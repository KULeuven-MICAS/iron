# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""The Phase-4 ONNX front-end + golden runner (S5): hermetic, IRON-side.

This module realizes Design Decision 5 (ONNX is the workload interchange:
torch -> ONNX -> (stream) -> IRON) on the IRON side, in three pieces:

1. :func:`ingest_onnx` reads an ONNX model's *graph* via the ``onnx`` package
   (NOT onnxruntime) into a small typed :class:`OnnxWorkload`. It captures the
   ordered ``graph.input`` (the ACTIVATIONS), ``graph.initializer`` (the
   WEIGHTS/params, names + ``K,N`` shapes preserved verbatim), and
   ``graph.output``, each as an :class:`OnnxTensorDesc` ``(name, shape, dtype)``
   descriptor (the numpy dtype mapped from the ONNX ``elem_type`` via
   :func:`onnx.helper.tensor_dtype_to_np_dtype`).

2. :func:`bind_onnx_to_region` aligns the ingested ONNX tensors onto a region's
   ordered runtime arg-spec slots and returns the **Phase-3 io shape**
   (``{"inputs": [...], "weights": [...], "outputs": [...]}``, each a list of
   ``(name, region, slot, layout)`` tuples) so an ONNX-derived workload feeds
   :func:`~iron.operators.stream_fusion.emitter.emit_manifest_from_modules`
   directly. The activation(s) fill the leading ``"in"`` slots, the initializers
   fill the trailing ``"in"`` slots (the ``K,N`` weight layout recorded
   explicitly and NEVER collapsed -- Design Decision 4), and the outputs fill the
   ``"out"`` slots. A cardinality mismatch raises a clear :class:`ValueError`.

3. :func:`golden_swiglu` computes a torch (eager) SwiGLU reference
   (``y = (SiLU(x @ w_gate) * (x @ w_up)) @ w_down``) returning a numpy array of
   the workload output's shape/dtype, reusing the
   :mod:`iron.operators.swiglu_decode.reference` math.
   :func:`golden_swiglu_from_reference` delegates to
   :func:`~iron.operators.swiglu_decode.reference.generate_golden_reference` for a
   self-generated reference when the test does not supply ONNX weights.

Hermeticity (CONTEXT.md locked decisions)
------------------------------------------

The whole path is ``torch`` + ``onnx`` + ``numpy`` only. Importing this module
imports NEITHER ``onnxruntime`` (absent in this venv -- the golden is torch eager,
ingest reads the onnx graph only) NOR ``stream`` (a parallel agent shares this
venv's stream-dse package state, so importing it would race) NOR any NPU symbol.
The headless executor round-trip asserts on
:meth:`~iron.operators.stream_fusion.workload.StreamWorkload.build_plan`, never
``.run()``.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from pathlib import Path

import numpy as np
import onnx
import torch
from onnx import TensorProto, helper, numpy_helper  # noqa: F401  (helper.tensor_dtype_to_np_dtype; numpy_helper for callers)

from iron.operators.swiglu_decode.reference import generate_golden_reference

# Module top level imports ONLY onnx + torch + numpy + the swiglu_decode golden
# math. `onnxruntime`, `stream`, StreamWorkload, XRTTensor and any stream-dse /
# NPU symbol are NEVER imported here -- importing this module stays hermetic.


# --------------------------------------------------------------------------- #
# dataclasses
# --------------------------------------------------------------------------- #


@dataclass
class OnnxTensorDesc:
    """A small descriptor for one ONNX tensor (input, initializer, or output).

    Attributes:
        name: The ONNX tensor name (``ValueInfoProto.name`` / ``TensorProto.name``).
        shape: The tensor shape as a ``tuple[int, ...]`` (dims in declaration order).
        dtype: The numpy dtype mapped from the ONNX ``elem_type`` via
            :func:`onnx.helper.tensor_dtype_to_np_dtype`.
    """

    name: str
    shape: tuple[int, ...]
    dtype: object


@dataclass
class OnnxWorkload:
    """The ingested ONNX graph I/O + initializers, in graph declaration order.

    Attributes:
        inputs: Ordered descriptors for the graph's ACTIVATIONS (``graph.input``
            entries whose name is not also an initializer name).
        initializers: Ordered descriptors for the WEIGHTS/params
            (``graph.initializer`` -- the initializers ARE the weights; names and
            ``K,N`` shapes preserved verbatim).
        outputs: Ordered descriptors for the graph OUTPUTS (``graph.output``).

    Order is the ONNX graph declaration order (preserved verbatim), which is the
    order :func:`bind_onnx_to_region` aligns onto the region arg-spec slots.
    """

    inputs: list[OnnxTensorDesc] = field(default_factory=list)
    initializers: list[OnnxTensorDesc] = field(default_factory=list)
    outputs: list[OnnxTensorDesc] = field(default_factory=list)


# --------------------------------------------------------------------------- #
# (B) ingest_onnx
# --------------------------------------------------------------------------- #


def _value_info_desc(vi) -> OnnxTensorDesc:
    """Build an :class:`OnnxTensorDesc` from a ``ValueInfoProto`` (input/output)."""
    tt = vi.type.tensor_type
    shape = tuple(d.dim_value for d in tt.shape.dim)
    dtype = helper.tensor_dtype_to_np_dtype(tt.elem_type)
    return OnnxTensorDesc(name=vi.name, shape=shape, dtype=dtype)


def _initializer_desc(t) -> OnnxTensorDesc:
    """Build an :class:`OnnxTensorDesc` from a ``TensorProto`` (initializer)."""
    shape = tuple(t.dims)
    dtype = helper.tensor_dtype_to_np_dtype(t.data_type)
    return OnnxTensorDesc(name=t.name, shape=shape, dtype=dtype)


def ingest_onnx(model_or_path) -> OnnxWorkload:
    """Ingest an ONNX model's graph I/O + initializers into an :class:`OnnxWorkload`.

    Reads the ONNX *graph* via the ``onnx`` package (NOT onnxruntime). The
    non-initializer ``graph.input`` entries are the ACTIVATIONS, the
    ``graph.initializer`` entries are the WEIGHTS (names + ``K,N`` shapes
    preserved), and ``graph.output`` are the OUTPUTS -- the exact split the binder
    aligns onto a region's arg-spec.

    Args:
        model_or_path: A ``.onnx`` file path (``str`` / :class:`~pathlib.Path`), an
            :class:`onnx.ModelProto`, or an :class:`onnx.GraphProto`.

    Returns:
        The ingested :class:`OnnxWorkload`.

    Note:
        Some exporters list an initializer ALSO in ``graph.input``. If an input
        name also appears as an initializer name it is treated as an initializer
        (a weight), NOT an activation -- so :attr:`OnnxWorkload.inputs` holds only
        the true activation(s). The initializer-name set is built first, then only
        ``graph.input`` entries whose name is NOT in that set are kept as
        activations.
    """
    if isinstance(model_or_path, onnx.GraphProto):
        graph = model_or_path
    elif isinstance(model_or_path, onnx.ModelProto):
        graph = model_or_path.graph
    else:
        model = onnx.load(str(model_or_path))
        graph = model.graph

    # Build the initializer-name set first so initializer-named inputs are filtered
    # out of the activations (they are weights, not activations).
    initializer_names = {t.name for t in graph.initializer}

    inputs = [
        _value_info_desc(vi)
        for vi in graph.input
        if vi.name not in initializer_names
    ]
    initializers = [_initializer_desc(t) for t in graph.initializer]
    outputs = [_value_info_desc(vi) for vi in graph.output]

    return OnnxWorkload(inputs=inputs, initializers=initializers, outputs=outputs)


# --------------------------------------------------------------------------- #
# (C) bind_onnx_to_region
# --------------------------------------------------------------------------- #


def bind_onnx_to_region(
    onnx_workload: OnnxWorkload,
    region_arg_spec: list,
    *,
    region_id: str = "region_0",
    weight_layout: str = "K,N",
    input_layout: str = "row_major",
    output_layout: str = "row_major",
    input_names: list | None = None,
    weight_names: list | None = None,
    output_names: list | None = None,
) -> dict:
    """Align ONNX tensors onto a region's arg-spec slots -> the Phase-3 io dict.

    The activation+weight tensors that fill the ``"in"`` slots, IN ORDER, are
    :attr:`OnnxWorkload.inputs` followed by :attr:`OnnxWorkload.initializers`
    (activations first, then weights -- matching the SwiGLU fixture: in-slot 0 =
    activation, trailing in-slots = weights). The :attr:`OnnxWorkload.outputs`
    fill the ``"out"`` slots.

    Slot convention (mirrors :func:`emit_manifest_k1_from_mlir`): an ``"in"``
    binding's slot ``k`` is the arg-spec input index ``k``; an ``"out"`` binding's
    slot ``j`` is the arg-spec output index ``j``. The ``weight_layout`` (``"K,N"``)
    is recorded per weight binding and NEVER collapsed (Design Decision 4).

    Args:
        onnx_workload: The ingested :class:`OnnxWorkload`.
        region_arg_spec: The region's ordered runtime arg-spec
            (``list[AIERuntimeArgSpec]``, e.g. from
            :func:`~iron.operators.stream_fusion.mlir_introspect.parse_runtime_args`).
            Split by ``direction``: the ``"in"`` specs lead the signature, the
            trailing ``"out"`` specs are the outputs.
        region_id: The region id stamped into every binding.
        weight_layout: Layout recorded on every weight binding (the ``K,N``
            convention -- preserved, never collapsed).
        input_layout: Layout recorded on every input binding.
        output_layout: Layout recorded on every output binding.
        input_names / weight_names / output_names: Optional explicit names
            overriding the ONNX descriptor names, positionally.

    Returns:
        The Phase-3 io dict ``{"inputs": [...], "weights": [...], "outputs": [...]}``
        of ``(name, region_id, slot, layout)`` tuples -- EXACTLY the io shape
        :func:`~iron.operators.stream_fusion.emitter.emit_manifest_from_modules`
        consumes (it does the ``in``/``out`` dict-key rename internally).

    Raises:
        ValueError: If the activation+weight count does not match the number of
            ``"in"`` arg-spec slots, or the output count does not match the number
            of ``"out"`` arg-spec slots (the message names both counts).
    """
    in_specs = [s for s in region_arg_spec if s.direction == "in"]
    out_specs = [s for s in region_arg_spec if s.direction == "out"]

    num_activations = len(onnx_workload.inputs)
    num_weights = len(onnx_workload.initializers)
    num_in_tensors = num_activations + num_weights

    if num_in_tensors != len(in_specs):
        raise ValueError(
            f"ONNX in-tensor count ({num_activations} activation(s) + "
            f"{num_weights} weight(s) = {num_in_tensors}) does not match the "
            f"region's {len(in_specs)} 'in' arg-spec slot(s)"
        )
    if len(onnx_workload.outputs) != len(out_specs):
        raise ValueError(
            f"ONNX output count ({len(onnx_workload.outputs)}) does not match the "
            f"region's {len(out_specs)} 'out' arg-spec slot(s)"
        )

    inputs: list[tuple] = []
    for slot, desc in enumerate(onnx_workload.inputs):
        name = input_names[slot] if input_names else desc.name
        inputs.append((name, region_id, slot, input_layout))

    weights: list[tuple] = []
    for j, desc in enumerate(onnx_workload.initializers):
        slot = num_activations + j  # trailing in-slots
        name = weight_names[j] if weight_names else desc.name
        weights.append((name, region_id, slot, weight_layout))  # "K,N" PRESERVED

    outputs: list[tuple] = []
    for slot, desc in enumerate(onnx_workload.outputs):
        name = output_names[slot] if output_names else desc.name
        outputs.append((name, region_id, slot, output_layout))

    return {"inputs": inputs, "weights": weights, "outputs": outputs}


# --------------------------------------------------------------------------- #
# (D) golden_swiglu
# --------------------------------------------------------------------------- #


def golden_swiglu(input_arr, w_gate, w_up, w_down) -> np.ndarray:
    """Compute the torch (eager) SwiGLU reference, returning a numpy array.

    SwiGLU math (mirrors :mod:`iron.operators.swiglu_decode.reference`)::

        y = (SiLU(x @ w_gate) * (x @ w_up)) @ w_down,   SiLU(z) = z * sigmoid(z)

    For the canonical tiny-SwiGLU shapes ``x (M,K)``, ``w_gate / w_up (K,N)``,
    ``w_down (N,K)`` the result is ``(M,K)`` -- i.e. the output binding's arg-spec
    shape. Every argument is cast to ``float32`` for the eager reference so dtype
    mismatches do not trip torch. Numerics need not match the NPU this milestone
    (ONNX-02) -- the bar is a right-shaped, right-dtyped reference array.

    Args:
        input_arr: The activation ``x``, a numpy array of shape ``(M, K)``.
        w_gate / w_up: The gate / up weights, numpy arrays of shape ``(K, N)``.
        w_down: The down weight, a numpy array of shape ``(N, K)``.

    Returns:
        The reference output as a numpy array of shape ``(M, K)``.
    """

    def _t(a):
        # np.array (not asarray) makes a writable copy: numpy_helper.to_array can
        # return a read-only view, and torch.as_tensor on it warns about undefined
        # write behavior. Copy + cast to float32 for the eager reference.
        return torch.as_tensor(np.array(a, dtype=np.float32))

    x = _t(input_arr)
    left = x @ _t(w_gate)
    right = x @ _t(w_up)
    inter = torch.nn.functional.silu(left) * right
    y = inter @ _t(w_down)
    return y.detach().cpu().numpy()


def golden_swiglu_from_reference(
    M: int = 1, K: int = 8, N: int = 16, seed: int = 42
) -> np.ndarray:
    """A self-generated SwiGLU reference (no ONNX weights supplied).

    Delegates to
    :func:`~iron.operators.swiglu_decode.reference.generate_golden_reference` and
    returns its ``"output"`` as a numpy ``float32`` array (shape ``(M, K)``). Used
    by tests that do not pass ONNX weights.

    Args:
        M: Batch size (rows of ``x``).
        K: Embedding dimension.
        N: Hidden / FFN intermediate dimension.
        seed: Random seed forwarded to ``generate_golden_reference``.

    Returns:
        The reference output as a numpy array of shape ``(M, K)``.
    """
    result = generate_golden_reference(M, K, N, seed)
    return np.asarray(result["output"].float().cpu().numpy())
