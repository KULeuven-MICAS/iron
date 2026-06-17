# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Stream-dse MLIR generation shim for the fused SwiGLU-prefill operator.

This is the in-IRON replacement for the previously hardcoded
``/home/micas/stream_aie/main_swiglu.py`` entry point. It calls the *installed*
``stream-dse`` package (``pip install stream-dse`` followed by ``stream-setup-aie``)
to produce a single fused MLIR module for the whole SwiGLU-prefill block, which
IRON then compiles into an xclbin/insts pair.

The function signature mirrors ``run_main_aie_codegen_swiglu`` from stream-dse's
``scripts/main_swiglu.py`` reference entry point. Because ``scripts/`` is not
shipped in the stream-dse wheel, that logic is vendored here; the hardware-
description YAML is resolved from the installed ``stream`` package, where it ships
as package data (stream-dse >= 1.13.3).

This module is imported lazily (by ``DesignGenerator`` at compile time), so
importing the operator does not require ``stream-dse`` to be installed -- only
building it does.
"""

import os
import re

import stream
from stream.api import optimize_allocation_co
from stream.inputs.aie.mapping.make_swiglu_mapping import make_swiglu_mapping
from stream.inputs.aie.workload.make_onnx_swiglu import make_swiglu_workload

# Hardware description for the whole-array Strix (npu2) target, shipped as package
# data inside the installed stream package (stream-dse >= 1.13.3).
_ACCELERATOR = os.path.join(
    os.path.dirname(stream.__file__),
    "inputs",
    "aie",
    "hardware",
    "whole_array_strix.yaml",
)


def run_main_aie_codegen_swiglu(
    seq_len,
    embedding_dim,
    hidden_dim,
    in_dtype="bf16",
    out_dtype="bf16",
    trace_size=0,
    rows=4,
    cols=8,
    npu="npu2",
    seq_len_tile_size=32,
    embedding_tile_size=32,
    hidden_tile_size=64,
    last_gemm_down=True,
    backend="ortools_gscip",
):
    """Generate the fused SwiGLU-prefill MLIR module via stream-dse.

    Returns the (xdsl) MLIR module; ``str(module)`` yields the textual MLIR that
    IRON's ``PythonGeneratedMLIRArtifact`` writes to disk and compiles.

    The default ``ortools_gscip`` backend is the license-free OR-Tools GSCIP
    solver, so no Gurobi license is required.
    """
    workload_path = make_swiglu_workload(
        seq_len,
        embedding_dim,
        hidden_dim,
        in_dtype,
        out_dtype,
        last_gemm_down=last_gemm_down,
    )
    mapping_path = make_swiglu_mapping(
        seq_len,
        embedding_dim,
        hidden_dim,
        last_gemm_down,
        seq_len_tile_size,
        embedding_tile_size,
        hidden_tile_size,
    )

    hw_name = os.path.splitext(os.path.basename(_ACCELERATOR))[0]
    wl_name = re.split(r"/|\.", workload_path)[-1]
    if wl_name == "onnx":
        wl_name = re.split(r"/|\.", workload_path)[-2]
    experiment_id = f"{hw_name}-{wl_name}-{rows}_row_{cols}_col"

    ctx = optimize_allocation_co(
        hardware=_ACCELERATOR,
        workload=workload_path,
        mapping=mapping_path,
        experiment_id=experiment_id,
        output_path="outputs",
        skip_if_exists=False,
        enable_codegen=True,
        trace_size=trace_size,
        nb_cols_to_use=cols,
        npu=npu,
        backend=backend,
    )
    return ctx.get("module")
