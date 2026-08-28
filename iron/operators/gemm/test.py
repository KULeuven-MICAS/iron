#!/usr/bin/env python3
# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

import contextlib
import logging
import os
import time

import numpy as np
import pytest
import aie.utils as aie_utils
import torch
import ml_dtypes
from aie.utils.hostruntime.xrtruntime.tensor import XRTTensor

from iron.common.sequence import OperatorSequence
from iron.common.tracing_utils import dump_traces
from iron.operators.gemm.op import GEMM
from iron.operators.gemm.reference import generate_golden_reference
from iron.common.test_utils import run_test, verify_buffer

logger = logging.getLogger(__name__)


def get_params():
    dev = aie_utils.get_current_device()
    max_aie_columns = dev.cols
    device_type = dev.resolve().name
    # fmt: off
    #   M,     K,     N, num_aie_columns, b_col_maj, c_col_maj,   m,   k,   n, trace_size, partition_N
    regular_params = [
        (2048,  2048,  2048,               1,     False,     False,  64,  64,  64,          0, 1),
        (2048,  2048,  2048,               2,      True,     False,  64,  64,  64,          0, 1),
        (2048,  2048,  2048,               8,      True,      True,  64,  64,  64,          0, 1),
        ( 384,  1536,  1792,               4,      True,     False,  32,  48,  64,          0, 1),
        (1792,   896,  1152,               8,     False,      True,  64,  32,  48,          0, 1),
        ( 896,  1792,   640,               8,     False,      True,  32,  64,  80,          0, 1),
        ( 192,   384,    64,               4,     False,     False,  48,  96,  16,          0, 1),
        ( 192,   384,    64,               4,      True,      True,  48,  96,  16,          0, 1),
        (  64,   512,   256,               4,      True,     False,  16,  64,  64,          0, 4),
    ]
    extensive_params = [
        (2048,  2048,  2048,               8,     False,     False,  32,  32, 128,          0, 1),
        (2048,  2048,  8192,               2,     False,     False,  64,  64,  64,          0, 1),
        (2048,  8192,  2048,               2,     False,     False,  64,  64,  64,          0, 1),
        (2048,    64,  2048,               2,     False,     False,  64,  64,  64,          0, 1),
        (2048,    64,  8192,               2,     False,     False,  64,  64,  64,          0, 1),
        (2048,  2048,  2048,               8,      True,     False, 128,  32,  32,          0, 1),
        (2048,  2048,  8192,               2,      True,     False,  64,  64,  64,          0, 1),
        (2048,  8192,  2048,               2,      True,     False,  64,  64,  64,          0, 1),
        (2048,    64,  2048,               2,      True,     False,  64,  64,  64,          0, 1),
        (2048,    64,  8192,               2,      True,     False,  64,  64,  64,          0, 1),
        (2048,  2048,  2048,               2,     False,      True,   8,  16,  32,          0, 1),
        (2048,  2048,  8192,               2,     False,      True,  64,  64,  64,          0, 1),
        (2048,  8192,  2048,               2,     False,      True,  64,  64,  64,          0, 1),
        (2048,    64,  2048,               2,     False,      True,  64,  64,  64,          0, 1),
        (2048,    64,  8192,               2,     False,      True,  64,  64,  64,          0, 1),
    ]
    # fmt: on

    params = []

    # Helper to generate name and append param
    def add_params(param_list, is_extensive):
        for p in param_list:
            (
                M,
                K,
                N,
                num_aie_columns,
                b_col_maj,
                c_col_maj,
                m,
                k,
                n,
                trace_size,
                partition_N,
            ) = p

            # Skip tests that require more columns than available on the device
            if num_aie_columns > max_aie_columns:
                continue

            # Skip configurations with small tile sizes that don't meet AIE2 kernel constraints
            # AIE2 mm kernel requires m % (4 * r) == 0 where r=4 for bf16
            if device_type == "npu1" and m < 16:
                continue

            marks = [pytest.mark.extensive] if is_extensive else []
            params.append(pytest.param(*p, marks=marks))

    add_params(regular_params, is_extensive=False)
    add_params(extensive_params, is_extensive=True)

    return params


@contextlib.contextmanager
def _without_trace_size():
    """Keep the ordinary validation dispatch untraced when tracing is opt-in."""
    trace_size = os.environ.pop("IRON_TRACE_SIZE", None)
    try:
        yield
    finally:
        if trace_size is not None:
            os.environ["IRON_TRACE_SIZE"] = trace_size


def _trace_size(parameter_trace_size):
    return parameter_trace_size or int(os.environ.get("IRON_TRACE_SIZE", "0"))


def _trace_ntiles():
    return int(os.environ.get("IRON_TRACE_NTILES", "2"))


def _trace_tag(request):
    return f"gemm_{request.node.callspec.id}"


def _trace_gemm(
    operator,
    golden_ref,
    partition_N,
    trace_size,
    request,
    aie_context,
):
    """Run a traced full-ELF GEMM and write one JSON file per dispatch."""
    if trace_size <= 0:
        return
    if aie_utils.get_current_device().resolve().name != "npu2":
        return

    def make_traced_sequence(num_columns):
        traced_operator = GEMM(
            M=operator.M,
            K=operator.K,
            N=operator.N,
            tile_m=operator.tile_m,
            tile_k=operator.tile_k,
            tile_n=operator.tile_n,
            num_aie_columns=num_columns,
            prio_accuracy=operator.prio_accuracy,
            emulate_bf16_mmul_with_bfp16=operator.emulate_bf16_mmul_with_bfp16,
            b_col_maj=operator.b_col_maj,
            c_col_maj=operator.c_col_maj,
            trace_size=trace_size,
            context=aie_context,
        )
        return traced_operator, OperatorSequence(
            name=f"{traced_operator.name}_sequence",
            runlist=[(traced_operator, "A", "B", "C")],
            input_args=["A", "B"],
            output_args=["C"],
            dispatch="fused",
            trace_size=trace_size,
            context=aie_context,
        )

    traced_operator, traced_sequence = make_traced_sequence(operator.num_aie_columns)

    previous_ntiles = os.environ.get("IRON_TRACE_NTILES")
    os.environ["IRON_TRACE_NTILES"] = str(_trace_ntiles())
    try:
        try:
            traced_sequence.compile()
        except RuntimeError as exc:
            if (
                operator.num_aie_columns <= 4
                or "Unable to find a legal routing" not in str(exc)
            ):
                raise
            # NPU2's eight-column GEMM layouts can exhaust packet-routing
            # resources when trace flows are added. Trace the same matrix
            # dimensions with the four-column layout as a routable fallback.
            logger.warning(
                "Using four-column trace fallback for %s after trace routing "
                "failed for the eight-column layout",
                request.node.callspec.id,
            )
            traced_operator, traced_sequence = make_traced_sequence(4)
            traced_sequence.compile()
        run = traced_sequence.get_callable()
        tag = _trace_tag(request)

        A = golden_ref["input"].flatten()
        B_full = golden_ref["input_b"][0]
        B_full_np = (
            B_full.contiguous().view(torch.uint16).numpy().view(ml_dtypes.bfloat16)
        )
        B_parts = traced_operator.partition_B(B_full_np, partition_N)

        for partition, B_part in enumerate(B_parts):
            B = torch.from_numpy(B_part.view(np.uint16)).view(torch.bfloat16).flatten()
            for name, data in (("A", A), ("B", B)):
                buffer = run.get_buffer(name)
                buffer.torch_view()[:] = data.to(torch.bfloat16)
                buffer.to("npu")
            run()
            suffix = f"_partition{partition}" if partition_N > 1 else ""
            dump_traces(run, f"{tag}{suffix}")
    finally:
        if previous_ntiles is None:
            os.environ.pop("IRON_TRACE_NTILES", None)
        else:
            os.environ["IRON_TRACE_NTILES"] = previous_ntiles


@pytest.mark.metrics(
    Latency=r"Latency \(us\): (?P<value>[\d\.]+)",
    Bandwidth=r"Effective Bandwidth: (?P<value>[\d\.e\+-]+) GB/s",
    Throughput=r"Throughput: (?P<value>[\d\.e\+-]+) GFLOP/s",
)
@pytest.mark.parametrize(
    "M,K,N,num_aie_columns,b_col_maj,c_col_maj,m,k,n,trace_size,partition_N",
    get_params(),
)
def test_gemm(
    M,
    K,
    N,
    num_aie_columns,
    b_col_maj,
    c_col_maj,
    m,
    k,
    n,
    trace_size,
    partition_N,
    aie_context,
    request,
):
    total_N = N * partition_N

    golden_ref = generate_golden_reference(
        M=M,
        K=K,
        N=total_N,
        b_col_maj=b_col_maj,
        c_col_maj=c_col_maj,
    )

    operator = GEMM(
        M=M,
        K=K,
        N=N,
        tile_m=m,
        tile_k=k,
        tile_n=n,
        num_aie_columns=num_aie_columns,
        prio_accuracy=True,
        emulate_bf16_mmul_with_bfp16=False,
        b_col_maj=b_col_maj,
        c_col_maj=c_col_maj,
        context=aie_context,
    )

    with _without_trace_size():
        if partition_N == 1:
            input_buffers = {
                "A": golden_ref["input"].flatten(),
                "B": golden_ref["input_b"][0].flatten(),
            }
            output_buffers = {
                "C": golden_ref["output"][0].flatten(),
            }
            errors, latency_us, bandwidth_gbps = run_test(
                operator, input_buffers, output_buffers, rel_tol=0.005, abs_tol=0.005
            )
        else:
            compilable = operator.compile()
            op_func = compilable.get_callable()

            # Convert B_full torch bfloat16 → numpy bfloat16 for partition_B
            B_full_np = (
                golden_ref["input_b"][0]
                .contiguous()
                .view(torch.uint16)
                .numpy()
                .view(ml_dtypes.bfloat16)
            )

            # Partition B using the operator method (handles slicing and padding)
            B_parts = compilable.partition_B(B_full_np, partition_N)

            # Create A XRTTensor (shared across all partitions)
            A_buf = XRTTensor.from_torch(golden_ref["input"].flatten())

            # Allocate per-partition B and C XRTTensors
            arg_spec = compilable.get_arg_spec()
            c_shape = arg_spec[2].shape
            c_dtype = arg_spec[2].dtype

            B_bufs = []
            C_bufs = []
            for i in range(partition_N):
                b_torch = (
                    torch.from_numpy(B_parts[i].view(np.uint16))
                    .view(torch.bfloat16)
                    .flatten()
                )
                B_bufs.append(XRTTensor.from_torch(b_torch))
                C_bufs.append(XRTTensor(c_shape, dtype=c_dtype))

            # Run each partition
            start_time = time.perf_counter()
            for i in range(partition_N):
                op_func(A_buf, B_bufs[i], C_bufs[i])
            end_time = time.perf_counter()
            latency_us = (end_time - start_time) * 1e6

            # Read back and concatenate C partitions along the column dimension
            C_parts_torch = [buf.to_torch().reshape(c_shape) for buf in C_bufs]
            if c_col_maj:
                C_concat = torch.cat(C_parts_torch, dim=0)
            else:
                C_concat = torch.cat(C_parts_torch, dim=1)

            # Compare concatenated output to full reference
            C_expected = golden_ref["output"][0]
            buf_errors = verify_buffer(
                C_concat, "C", C_expected, rel_tol=0.005, abs_tol=0.005
            )
            errors = {"C": buf_errors} if buf_errors else {}

            # Calculate bandwidth
            a_bytes = golden_ref["input"].nelement() * 2  # bf16 = 2 bytes
            b_bytes = sum(p.nbytes for p in B_parts)
            c_bytes = C_concat.nelement() * 2
            total_bytes = a_bytes + b_bytes + c_bytes
            bandwidth_gbps = total_bytes / (latency_us * 1e-6) / 1e9

    _trace_gemm(
        operator,
        golden_ref,
        partition_N,
        _trace_size(trace_size),
        request,
        aie_context,
    )

    gflops = (2.0 * M * K * total_N) / (latency_us * 1e-6) / 1e9

    print(f"\nLatency (us): {latency_us:.1f}")
    print(f"Effective Bandwidth: {bandwidth_gbps:.6e} GB/s")
    print(f"Throughput: {gflops:.6e} GFLOP/s\n")

    assert not errors, "Test failed"
