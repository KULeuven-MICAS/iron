#!/usr/bin/env python3
# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

import time
import pytest

from ml_dtypes import bfloat16
from aie.utils.hostruntime.xrtruntime.tensor import XRTTensor
from iron.operators.swiglu_prefill_stream.op import SwiGLUPrefillStream

# swiglu_prefill_stream shares the same reference implementation as swiglu_decode:
# both compute W3 @ (SiLU(W1 @ x) * (W2 @ x)). Prefill operates on a full
# sequence (M > 1); the stream variant fuses the whole block into one design.
from iron.operators.swiglu_decode.reference import generate_golden_reference
from iron.common.test_utils import verify_buffer


def get_params():
    # (seq_len, embedding_dim, hidden_dim, seq_tile, embedding_tile, hidden_tile)
    # The 256/512/2048 config with 32/32/64 tiling is the MILP-feasible shape on
    # the whole-array Strix (npu2) target.
    params_list = [(256, 512, 2048, 32, 32, 64)]
    return [pytest.param(*p) for p in params_list]


@pytest.mark.supported_devices("npu2")
@pytest.mark.metrics(
    Latency=r"Latency \(us\): (?P<value>[\d\.]+)",
    Bandwidth=r"Effective Bandwidth: (?P<value>[\d\.e\+-]+) GB/s",
)
@pytest.mark.parametrize(
    "seq_len,embedding_dim,hidden_dim,seq_tile,embedding_tile,hidden_tile", get_params()
)
def test_swiglu_prefill_stream(
    seq_len,
    embedding_dim,
    hidden_dim,
    seq_tile,
    embedding_tile,
    hidden_tile,
    aie_context,
):
    golden_ref = generate_golden_reference(M=seq_len, K=embedding_dim, N=hidden_dim)

    operator = SwiGLUPrefillStream(
        seq_len=seq_len,
        embedding_dim=embedding_dim,
        hidden_dim=hidden_dim,
        seq_len_tile_size=seq_tile,
        embedding_tile_size=embedding_tile,
        hidden_tile_size=hidden_tile,
        context=aie_context,
    )
    # The stream design consumes weights in their natural (K, N) layout, so no
    # transpose is applied (the composite SwiGLUPrefill transposes; this one does
    # not).
    operator.weights_1 = golden_ref["w_gate"]
    operator.weights_2 = golden_ref["w_up"]
    operator.weights_3 = golden_ref["w_down"]

    operator.compile()
    op_func = operator.get_callable()

    input_buf = XRTTensor.from_torch(golden_ref["input"])
    w1_buf = XRTTensor.from_torch(operator.weights_1)
    w2_buf = XRTTensor.from_torch(operator.weights_2)
    w3_buf = XRTTensor.from_torch(operator.weights_3)
    output_buf = XRTTensor((seq_len * embedding_dim,), dtype=bfloat16)

    # Warmup
    op_func(input_buf, w1_buf, w2_buf, w3_buf, output_buf)

    start = time.perf_counter()
    op_func(input_buf, w1_buf, w2_buf, w3_buf, output_buf)
    elapsed_us = (time.perf_counter() - start) * 1e6

    total_bytes = input_buf.buffer_object().size() + output_buf.buffer_object().size()
    bandwidth_gbps = total_bytes / (elapsed_us * 1e-6) / 1e9
    print(f"Latency (us): {elapsed_us:.2f}")
    print(f"Effective Bandwidth: {bandwidth_gbps:.4f} GB/s")

    # SwiGLU chains several bf16 kernels, so rounding error accumulates; verify
    # the final output against the float reference with relaxed tolerances and a
    # small allowance for precision outliers.
    output = output_buf.to_torch().reshape((seq_len, embedding_dim))
    errors = verify_buffer(
        output, "output", golden_ref["output"], rel_tol=0.08, abs_tol=0.7, max_error_rate=0.05
    )

    assert not errors, f"Test failed with errors: {errors}"
