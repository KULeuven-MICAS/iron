# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

import numpy as np
import pytest
from ml_dtypes import bfloat16

from iron.common import AIERuntimeArgSpec
from iron.operators.stream_fusion.mlir_introspect import (
    KernelLink,
    collect_kernel_links,
    parse_runtime_args,
)


# --------------------------------------------------------------------------- #
# parse_runtime_args
# --------------------------------------------------------------------------- #


def test_parse_runtime_args_shapes(fixture_mlir_text):
    args = parse_runtime_args(fixture_mlir_text, out_count=1)
    assert len(args) == 5
    assert [a.shape for a in args] == [
        (256, 512),
        (512, 2048),
        (512, 2048),
        (2048, 512),
        (256, 512),
    ]


def test_parse_runtime_args_dtype_is_bf16(fixture_mlir_text):
    args = parse_runtime_args(fixture_mlir_text, out_count=1)
    assert all(a.dtype == bfloat16 for a in args)


def test_parse_runtime_args_directions_out_count_1(fixture_mlir_text):
    args = parse_runtime_args(fixture_mlir_text, out_count=1)
    assert [a.direction for a in args] == ["in", "in", "in", "in", "out"]


def test_parse_runtime_args_honors_out_count_2(fixture_mlir_text):
    args = parse_runtime_args(fixture_mlir_text, out_count=2)
    assert [a.direction for a in args] == ["in", "in", "in", "out", "out"]


def test_parse_runtime_args_returns_arg_spec_type(fixture_mlir_text):
    args = parse_runtime_args(fixture_mlir_text, out_count=1)
    assert all(isinstance(a, AIERuntimeArgSpec) for a in args)


def test_parse_runtime_args_f32_inline():
    # Minimal hand-written runtime_sequence with an f32 arg -> np.float32.
    mlir = (
        "    aie.runtime_sequence(%0 : memref<8x8xf32>, "
        "%1 : memref<8x8xf32>) {\n"
    )
    args = parse_runtime_args(mlir, out_count=1)
    assert len(args) == 2
    assert all(a.dtype == np.float32 for a in args)
    assert [a.shape for a in args] == [(8, 8), (8, 8)]
    assert [a.direction for a in args] == ["in", "out"]


def test_parse_runtime_args_no_sequence_raises():
    with pytest.raises(ValueError):
        parse_runtime_args("module { }")


# --------------------------------------------------------------------------- #
# collect_kernel_links
# --------------------------------------------------------------------------- #


def test_collect_kernel_links_objects(fixture_mlir_text):
    links = collect_kernel_links(fixture_mlir_text)
    assert len(links) == 4
    assert all(isinstance(link, KernelLink) for link in links)
    assert {link.object_filename for link in links} == {
        "mm_32_32_64.o",
        "mm_32_64_32.o",
        "silu.o",
        "mul.o",
    }


def test_collect_kernel_links_symbols(fixture_mlir_text):
    links = collect_kernel_links(fixture_mlir_text)
    by_obj = {link.object_filename: link.symbols for link in links}
    assert by_obj["mm_32_32_64.o"] == frozenset(
        {"matmul_bf16_bf16_32_32_64", "zero_bf16_32_32_64"}
    )
    assert by_obj["mm_32_64_32.o"] == frozenset(
        {"matmul_bf16_bf16_32_64_32", "zero_bf16_32_64_32"}
    )
    assert by_obj["silu.o"] == frozenset({"silu_bf16"})
    assert by_obj["mul.o"] == frozenset({"eltwise_mul_bf16_scalar"})


def test_collect_kernel_links_preserves_first_seen_order(fixture_mlir_text):
    links = collect_kernel_links(fixture_mlir_text)
    # De-duplicated by object filename, first appearance order preserved.
    names = [link.object_filename for link in links]
    assert len(names) == len(set(names))
