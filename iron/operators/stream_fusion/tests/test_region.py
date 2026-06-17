# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Config-free SwiGLU proof for :class:`StreamFusedRegion`.

These tests drive the *generic* region with the copied SwiGLU stream MLIR fixture
and prove it reproduces the hardcoded ``SwiGLUPrefillStream`` baseline with no
per-operator kernel configuration:

- ``get_arg_spec()`` returns the same 5-arg spec (direction, shape, dtype).
- ``get_kernel_artifacts()`` returns the same four kernel recipes (filenames,
  flags, renames, source basenames).
- ``compile(dry_run=True)`` plans the build with ``--dynamic-objFifos`` and
  ``--no-unified``.
- the fixture MLIR parses under ``aie-opt``.

No NPU and no stream-dse import are required: the region is fed the pre-generated
fixture file, and the baseline arg-spec / kernel recipes are encoded inline (the
baseline op module hard-imports NPU-only XRT helpers at import time, so we do not
import it here -- we compare against its documented ground truth instead).
"""

import os
import shutil
import subprocess
from pathlib import Path

import numpy as np
import pytest
from ml_dtypes import bfloat16

from iron.common import AIEContext, AIERuntimeArgSpec
from iron.operators.stream_fusion import StreamFusedRegion

AIE_OPT = "/home/micas/iron-stream-dse-venv/bin/aie-opt"

# Baseline ground truth (SwiGLUPrefillStream with seq_len=256, embedding_dim=512,
# hidden_dim=2048, tiles 32/32/64, last_gemm_down=True). The runtime args are
# (input, w_gate, w_up, w_down, output), all bf16; the final arg is the output.
EXPECTED_ARG_SPEC = [
    AIERuntimeArgSpec("in", (256, 512), bfloat16),  # input
    AIERuntimeArgSpec("in", (512, 2048), bfloat16),  # weights_1 (gate)
    AIERuntimeArgSpec("in", (512, 2048), bfloat16),  # weights_2 (up)
    AIERuntimeArgSpec("in", (2048, 512), bfloat16),  # weights_3 (down)
    AIERuntimeArgSpec("out", (256, 512), bfloat16),  # output
]

# Baseline ground truth for the four kernel objects. mm objects carry the
# dimension defines + the bf16-only flag and rename the unsuffixed upstream
# symbols to their dimension-suffixed forms; silu/mul carry neither.
EXPECTED_MM = {
    "mm_32_32_64.o": {
        "flags": ["-DDIM_M=32", "-DDIM_K=32", "-DDIM_N=64", "-Dbf16_bf16_ONLY"],
        "renames": {
            "matmul_bf16_bf16": "matmul_bf16_bf16_32_32_64",
            "zero_bf16": "zero_bf16_32_32_64",
        },
        "source": "mm.cc",
    },
    "mm_32_64_32.o": {
        "flags": ["-DDIM_M=32", "-DDIM_K=64", "-DDIM_N=32", "-Dbf16_bf16_ONLY"],
        "renames": {
            "matmul_bf16_bf16": "matmul_bf16_bf16_32_64_32",
            "zero_bf16": "zero_bf16_32_64_32",
        },
        "source": "mm.cc",
    },
}
EXPECTED_SIMPLE = {"silu.o": "silu.cc", "mul.o": "mul.cc"}


@pytest.fixture
def aie_context():
    """A fresh AIEContext, with NPU-runtime teardown guarded for no-NPU hosts.

    Overrides the repo-root ``aie_context`` fixture, whose teardown unconditionally
    calls ``DefaultNPURuntime.cleanup()`` -- which is ``None`` (AttributeError) on a
    host without an NPU runtime. These tests are hermetic and need no NPU.
    """
    import aie.utils as aie_utils

    ctx = AIEContext()
    yield ctx
    runtime = aie_utils.DefaultNPURuntime
    if runtime is not None:
        runtime.cleanup()


@pytest.fixture
def region(fixture_mlir_path, aie_context):
    """A StreamFusedRegion driven by the SwiGLU fixture (out_count=1)."""
    return StreamFusedRegion(
        mlir=fixture_mlir_path, out_count=1, context=aie_context
    )


def _source_basename(artifact):
    """Basename of a kernel artifact's C source (its first dependency)."""
    return Path(list(artifact.dependencies)[0].filename).name


def test_argspec_parity(region):
    """The region's discovered arg-spec equals the baseline 5-arg spec."""
    specs = region.get_arg_spec()
    assert len(specs) == len(EXPECTED_ARG_SPEC)
    for got, expected in zip(specs, EXPECTED_ARG_SPEC):
        assert got.direction == expected.direction
        assert tuple(got.shape) == tuple(expected.shape)
        assert np.dtype(got.dtype) == np.dtype(expected.dtype)


def test_kernel_parity(region):
    """The region resolves the same four kernel recipes as the baseline."""
    arts = region.get_kernel_artifacts()
    by_name = {a.filename: a for a in arts}

    assert set(by_name) == {"mm_32_32_64.o", "mm_32_64_32.o", "silu.o", "mul.o"}

    # mm objects: flags + renames + source basename match the baseline recipe.
    for name, expected in EXPECTED_MM.items():
        art = by_name[name]
        assert art.extra_flags == expected["flags"]
        assert art.rename_symbols == expected["renames"]
        assert _source_basename(art) == expected["source"]

    # silu/mul: no flags, no renames; source basenames match.
    for name, source in EXPECTED_SIMPLE.items():
        art = by_name[name]
        assert art.extra_flags == []
        assert art.rename_symbols == {}
        assert _source_basename(art) == source


def test_dry_run_compile(region):
    """compile(dry_run=True) plans the build with the baseline flags, no NPU."""
    region.compile(dry_run=True)
    flags = region.xclbin_artifact.extra_flags
    assert "--dynamic-objFifos" in flags
    assert "--no-unified" in flags


def test_design_generator_artifact_type(aie_context):
    """A DesignGenerator-backed region yields a PythonGeneratedMLIRArtifact.

    The generator is constructed but never invoked (no stream-dse / NPU), so we
    assert only the artifact type, per the plan.
    """
    from iron.common import DesignGenerator, PythonGeneratedMLIRArtifact

    gen = DesignGenerator(
        Path("iron/operators/swiglu_prefill_stream/stream_design.py").resolve(),
        "run_main_aie_codegen_swiglu",
    )
    gen_region = StreamFusedRegion(mlir=gen, out_count=1, context=aie_context)
    assert isinstance(gen_region.get_mlir_artifact(), PythonGeneratedMLIRArtifact)


def test_aie_opt_parses_fixture(fixture_mlir_path):
    """The fixture MLIR parses under aie-opt (syntactic round-trip, no NPU)."""
    binary = AIE_OPT if Path(AIE_OPT).exists() else shutil.which("aie-opt")
    if binary is None:
        pytest.skip("aie-opt not available")
    result = subprocess.run(
        [binary, str(fixture_mlir_path), "-o", os.devnull],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0, (
        f"aie-opt failed to parse the fixture (rc={result.returncode}):\n"
        f"{result.stderr}"
    )
