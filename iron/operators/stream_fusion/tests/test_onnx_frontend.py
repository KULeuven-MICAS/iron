# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Hermetic tests for the Phase-4 ONNX front-end + golden runner (S5).

The proof: a tiny torch SwiGLU ``nn.Module`` is exported to a temp ``.onnx`` via
``torch.onnx.export(dynamo=False)`` (the dynamo default needs ``onnxscript``,
absent in this venv; an ``onnx.helper`` graph-construction fallback is the safety
net), ingested into an :class:`OnnxWorkload` (1 activation + 3 ``K,N`` weights +
1 output), bound onto the SwiGLU FIXTURE region's arg-spec to produce the Phase-3
io dict, assembled into a manifest via ``emit_manifest_from_modules``, validated +
``StreamWorkload.build_plan()``-ed HEADLESSLY, and compared against the golden
output's shape/dtype.

Hermetic: torch + onnx + numpy only -- NO onnxruntime (absent), NO stream-dse
import (a parallel agent shares this venv's stream-dse state), NO NPU
(``StreamWorkload.build_plan`` is pure-data; ``.run()`` is never called and
``emit_manifest_from_stream`` is never invoked).
"""

import sys

import numpy as np
import onnx
import pytest
import torch
import torch.nn as nn

from iron.common import AIEContext
from iron.operators.stream_fusion import (
    ingest_onnx,
    bind_onnx_to_region,
    golden_swiglu,
    golden_swiglu_from_reference,
    OnnxWorkload,
    OnnxTensorDesc,  # noqa: F401  (re-exported for completeness)
    emit_manifest_from_modules,
    validate,
    topo_order,
    WorkloadManifest,
    StreamWorkload,
    WorkloadInput,
    WorkloadWeight,
    WorkloadOutput,
)
from iron.operators.stream_fusion.mlir_introspect import parse_runtime_args

# Canonical tiny-SwiGLU shapes (the live export probe ground truth):
#   activation x (M,K); weights w_gate/w_up (K,N), w_down (N,K); output y (M,K).
_M, _K, _N = 4, 8, 16


# --------------------------------------------------------------------------- #
# the tiny torch SwiGLU module + the export helper (with onnx.helper fallback)
# --------------------------------------------------------------------------- #


class _TinySwiGLU(nn.Module):
    """A minimal torch SwiGLU: y = (SiLU(x @ w_gate) * (x @ w_up)) @ w_down."""

    def __init__(self, K: int = _K, N: int = _N):
        super().__init__()
        self.w_gate = nn.Parameter(torch.randn(K, N))
        self.w_up = nn.Parameter(torch.randn(K, N))
        self.w_down = nn.Parameter(torch.randn(N, K))

    def forward(self, x):
        left = x @ self.w_gate
        right = x @ self.w_up
        return (torch.nn.functional.silu(left) * right) @ self.w_down


def _export_tiny_swiglu(path, M: int = _M, K: int = _K, N: int = _N):
    """Export a tiny SwiGLU to ``path`` (a .onnx file).

    Tries ``torch.onnx.export(dynamo=False)`` FIRST (the dynamo default needs
    ``onnxscript``, which is absent here). If that raises, falls back to building
    the ONNX graph directly with ``onnx.helper`` so the test stays hermetic even
    if export breaks. Both paths yield: one activation ``x``, three named ``K,N``
    initializers (``w_gate``, ``w_up``, ``w_down``), one output ``y``.

    Returns:
        The path written (``path``).
    """
    torch.manual_seed(0)
    m = _TinySwiGLU(K, N).eval()
    x = torch.randn(M, K)
    try:
        torch.onnx.export(
            m,
            (x,),
            str(path),
            input_names=["x"],
            output_names=["y"],
            dynamo=False,
        )
        return path
    except Exception:  # pragma: no cover - exercised only if export breaks
        # Fallback: build the SwiGLU graph directly with onnx.helper. Initializers
        # carry the K,N weights; the single activation is "x"; the output is "y".
        import onnx.helper as H
        from onnx import TensorProto, numpy_helper

        wg = m.w_gate.detach().numpy()
        wu = m.w_up.detach().numpy()
        wd = m.w_down.detach().numpy()
        inits = [
            numpy_helper.from_array(a, name=n)
            for a, n in [(wg, "w_gate"), (wu, "w_up"), (wd, "w_down")]
        ]
        xin = H.make_tensor_value_info("x", TensorProto.FLOAT, [M, K])
        yout = H.make_tensor_value_info("y", TensorProto.FLOAT, [M, K])
        nodes = [
            H.make_node("MatMul", ["x", "w_gate"], ["left"]),
            H.make_node("MatMul", ["x", "w_up"], ["right"]),
            H.make_node("Sigmoid", ["left"], ["sig"]),
            H.make_node("Mul", ["left", "sig"], ["silu"]),
            H.make_node("Mul", ["silu", "right"], ["inter"]),
            H.make_node("MatMul", ["inter", "w_down"], ["y"]),
        ]
        graph = H.make_graph(nodes, "tiny_swiglu", [xin], [yout], initializer=inits)
        onnx.save(H.make_model(graph), str(path))
        return path


@pytest.fixture
def aie_context():
    """A fresh AIEContext, with NPU-runtime teardown guarded for no-NPU hosts.

    Copied from tests/test_emitter.py / tests/test_workload.py: the repo-root
    ``aie_context`` teardown unconditionally calls ``DefaultNPURuntime.cleanup()``,
    which is ``None`` on a host without an NPU runtime. These tests are hermetic.
    """
    import aie.utils as aie_utils

    ctx = AIEContext()
    yield ctx
    runtime = aie_utils.DefaultNPURuntime
    if runtime is not None:
        runtime.cleanup()


# --------------------------------------------------------------------------- #
# tests
# --------------------------------------------------------------------------- #


def test_ingest_onnx_captures_graph_io(tmp_path):
    """ingest_onnx reads graph.input / graph.initializer / graph.output (name, shape, dtype).

    The activation x is the single graph.input; the three K,N weights are the
    graph.initializer entries (shapes preserved); y is the graph.output. dtypes
    are numpy float32 (elem_type FLOAT). ingest_onnx also accepts a ModelProto.
    """
    path = _export_tiny_swiglu(tmp_path / "m.onnx")
    wl = ingest_onnx(path)

    assert isinstance(wl, OnnxWorkload)
    assert [d.name for d in wl.inputs] == ["x"]
    assert [d.name for d in wl.initializers] == ["w_gate", "w_up", "w_down"]
    assert [d.name for d in wl.outputs] == ["y"]

    assert wl.inputs[0].shape == (_M, _K)  # (4, 8)
    assert [d.shape for d in wl.initializers] == [
        (_K, _N),
        (_K, _N),
        (_N, _K),
    ]  # (8,16),(8,16),(16,8) -- K,N preserved
    assert wl.outputs[0].shape == (_M, _K)  # (4, 8)

    assert wl.inputs[0].dtype == np.float32
    assert all(d.dtype == np.float32 for d in wl.initializers)
    assert wl.outputs[0].dtype == np.float32

    # ingest_onnx also accepts an onnx.ModelProto directly (same descriptors).
    model = onnx.load(str(path))
    wl_from_proto = ingest_onnx(model)
    assert [d.name for d in wl_from_proto.inputs] == ["x"]
    assert [d.name for d in wl_from_proto.initializers] == ["w_gate", "w_up", "w_down"]
    assert [d.name for d in wl_from_proto.outputs] == ["y"]
    assert [d.shape for d in wl_from_proto.initializers] == [
        (_K, _N),
        (_K, _N),
        (_N, _K),
    ]


def test_bind_onnx_to_region_yields_phase3_io(tmp_path, fixture_mlir_text):
    """bind_onnx_to_region maps ONNX tensors onto the fixture arg-spec slots.

    activation -> in-slot 0 (row_major); initializers -> trailing in-slots
    1..3 (K,N PRESERVED); output -> out-slot 0 (row_major). A cardinality mismatch
    raises ValueError.
    """
    path = _export_tiny_swiglu(tmp_path / "m.onnx")
    wl = ingest_onnx(path)
    arg_spec = parse_runtime_args(fixture_mlir_text, 1)

    io = bind_onnx_to_region(wl, arg_spec, region_id="r0")

    assert io["inputs"] == [("x", "r0", 0, "row_major")]
    assert io["weights"] == [
        ("w_gate", "r0", 1, "K,N"),
        ("w_up", "r0", 2, "K,N"),
        ("w_down", "r0", 3, "K,N"),
    ]  # K,N layout PRESERVED at the trailing in-slots
    assert io["outputs"] == [("y", "r0", 0, "row_major")]

    # Cardinality mismatch -> a clear ValueError. Drop a weight so the in-tensor
    # count (3) no longer matches the fixture's 4 "in" slots.
    short_wl = OnnxWorkload(
        inputs=wl.inputs,
        initializers=wl.initializers[:-1],
        outputs=wl.outputs,
    )
    with pytest.raises(ValueError):
        bind_onnx_to_region(short_wl, arg_spec, region_id="r0")


def test_onnx_binding_feeds_emitter_and_build_plan(
    tmp_path, fixture_mlir_path, fixture_mlir_text, aie_context
):
    """ONNX-01 END-TO-END: ONNX-derived io -> manifest -> validate/topo + build_plan.

    The bound io feeds emit_manifest_from_modules; the manifest passes
    validate/topo_order AND StreamWorkload.build_plan() round-trips headlessly
    (no NPU, no stream-dse), binding the fixture's full 5-arg arg-spec in order.
    """
    path = _export_tiny_swiglu(tmp_path / "m.onnx")
    wl = ingest_onnx(path)
    arg_spec = parse_runtime_args(fixture_mlir_text, 1)
    io = bind_onnx_to_region(wl, arg_spec, region_id="r0")

    manifest = emit_manifest_from_modules(
        [("r0", str(fixture_mlir_path), 1, ["gate", "up", "down"])],
        edges=[],
        io=io,
    )
    assert isinstance(manifest, WorkloadManifest)
    validate(manifest)  # does not raise
    assert topo_order(manifest) == ["r0"]

    workload = StreamWorkload(manifest, context=aie_context)
    plan = workload.build_plan()
    assert plan.order == ["r0"]
    assert plan.intermediates == []
    assert plan.region_bindings["r0"] == [
        WorkloadInput("x"),
        WorkloadWeight("w_gate"),
        WorkloadWeight("w_up"),
        WorkloadWeight("w_down"),
        WorkloadOutput("y"),
    ]


def test_golden_swiglu_shape_and_dtype(tmp_path, fixture_mlir_text):
    """ONNX-02: golden_swiglu returns a numpy array of the output binding's shape/dtype.

    The golden output rank/last-dim agree with wl.outputs[0].shape, which lines up
    with the manifest's output binding (out-slot 0 -> the region arg-spec "out"
    spec). golden_swiglu_from_reference also returns the right-shaped reference.
    """
    path = _export_tiny_swiglu(tmp_path / "m.onnx")
    wl = ingest_onnx(path)

    # Read the initializer arrays from the model (numpy_helper.to_array) + an input.
    model = onnx.load(str(path))
    inits = {t.name: onnx.numpy_helper.to_array(t) for t in model.graph.initializer}
    x = np.random.randn(*wl.inputs[0].shape).astype(np.float32)

    out = golden_swiglu(x, inits["w_gate"], inits["w_up"], inits["w_down"])

    assert out.shape == wl.outputs[0].shape == (_M, _K)  # (4, 8)
    assert np.issubdtype(out.dtype, np.floating)

    # The golden output lines up with the manifest's output binding arg-spec: the
    # out binding ("y", out-slot 0) corresponds to the region arg-spec "out" spec.
    arg_spec = parse_runtime_args(fixture_mlir_text, 1)
    out_specs = [s for s in arg_spec if s.direction == "out"]
    assert len(out_specs) == 1  # one "out" arg-spec slot == one ONNX output
    # rank + last-dim agree with the ONNX output descriptor (the right-shaped ref).
    assert out.ndim == len(wl.outputs[0].shape)
    assert out.shape[-1] == wl.outputs[0].shape[-1]

    # The self-generated reference (no ONNX weights) is also right-shaped.
    ref = golden_swiglu_from_reference(M=1, K=_K, N=_N)
    assert ref.shape == (1, _K)
    assert np.issubdtype(ref.dtype, np.floating)


def test_onnx_frontend_is_hermetic(tmp_path, fixture_mlir_text):
    """The ONNX path imports neither stream-dse nor onnxruntime (import + exercise)."""
    assert sys.modules.get("stream") is None
    assert sys.modules.get("onnxruntime") is None

    path = _export_tiny_swiglu(tmp_path / "m.onnx")
    wl = ingest_onnx(path)
    arg_spec = parse_runtime_args(fixture_mlir_text, 1)
    bind_onnx_to_region(wl, arg_spec, region_id="r0")
    model = onnx.load(str(path))
    inits = {t.name: onnx.numpy_helper.to_array(t) for t in model.graph.initializer}
    x = np.zeros(wl.inputs[0].shape, dtype=np.float32)
    golden_swiglu(x, inits["w_gate"], inits["w_up"], inits["w_down"])
    golden_swiglu_from_reference()

    assert sys.modules.get("stream") is None
    assert sys.modules.get("onnxruntime") is None
