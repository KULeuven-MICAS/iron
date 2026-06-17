# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""IRON operators.

Operator classes are exposed lazily (PEP 562): they are imported on first
attribute access rather than eagerly at package import time. This lets pure-MLIR
/ introspection subpackages (e.g. ``iron.operators.stream_fusion``) be imported
on a host without the NPU runtime (XRT/pyxrt), while ``from iron.operators import
GEMM`` continues to work unchanged when the runtime is available.
"""

import importlib

# Public operator name -> defining submodule (relative to this package).
_OPERATORS = {
    "ElementwiseAdd": ".elementwise_add.op",
    "ElementwiseMul": ".elementwise_mul.op",
    "GEMM": ".gemm.op",
    "GEMV": ".gemv.op",
    "MHA": ".mha.op",
    "RMSNorm": ".rms_norm.op",
    "RoPE": ".rope.op",
    "SiLU": ".silu.op",
    "Softmax": ".softmax.op",
    "SwiGLUDecode": ".swiglu_decode.op",
    "SwiGLUPrefill": ".swiglu_prefill.op",
    "SwiGLUPrefillStream": ".swiglu_prefill_stream.op",
    "Transpose": ".transpose.op",
    "StridedCopy": ".strided_copy.op",
    "Repeat": ".repeat.op",
}

__all__ = list(_OPERATORS)


def __getattr__(name: str):
    module_path = _OPERATORS.get(name)
    if module_path is None:
        raise AttributeError(f"module {__name__!r} has no attribute {name!r}")
    module = importlib.import_module(module_path, __name__)
    attr = getattr(module, name)
    globals()[name] = attr  # cache so subsequent access skips __getattr__
    return attr


def __dir__():
    return sorted(set(globals()) | set(_OPERATORS))
