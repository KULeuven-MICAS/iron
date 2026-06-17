# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Tests for the extensible kernel resolver.

These reproduce the baseline SwiGLU operator's ``get_kernel_artifacts()`` recipe
(see ``iron/operators/swiglu_prefill_stream/op.py``): the four kernel objects
``mm_32_32_64.o``, ``mm_32_64_32.o``, ``silu.o``, ``mul.o`` with the exact
sources, flags, and renames the hardcoded baseline produced -- and prove that a
new kernel family is purely additive (one ``register_family`` call, no dispatch
edits).
"""

from pathlib import Path

import pytest

from iron.common import KernelObjectArtifact, SourceArtifact
from iron.operators.stream_fusion.mlir_introspect import (
    KernelLink,
    collect_kernel_links,
)
from iron.operators.stream_fusion import kernel_resolver
from iron.operators.stream_fusion.kernel_resolver import (
    KernelFamily,
    register_family,
    resolve_kernels,
)

# Absolute, synthetic repo root. The resolver only constructs paths from it; the
# tests assert source filenames END WITH the expected relative paths, so the
# concrete root value is irrelevant.
BASE_DIR = Path("/abs/repo")
KERNEL_DIR = "aie2p"


def _source_filename(artifact: KernelObjectArtifact) -> str:
    """Return the single dependency source path string of a kernel artifact."""
    return list(artifact.dependencies)[0].filename


@pytest.fixture
def resolved(fixture_mlir_text: str) -> dict[str, KernelObjectArtifact]:
    """Resolve the fixture's kernel links, keyed by object filename."""
    links = collect_kernel_links(fixture_mlir_text)
    artifacts = resolve_kernels(links, base_dir=BASE_DIR, kernel_dir=KERNEL_DIR)
    return {a.filename: a for a in artifacts}


def test_resolves_exactly_four_artifacts(fixture_mlir_text: str) -> None:
    links = collect_kernel_links(fixture_mlir_text)
    artifacts = resolve_kernels(links, base_dir=BASE_DIR, kernel_dir=KERNEL_DIR)
    assert len(artifacts) == 4
    assert {a.filename for a in artifacts} == {
        "mm_32_32_64.o",
        "mm_32_64_32.o",
        "silu.o",
        "mul.o",
    }


def test_mm_32_32_64_matches_baseline(resolved) -> None:
    art = resolved["mm_32_32_64.o"]
    assert art.extra_flags == [
        "-DDIM_M=32",
        "-DDIM_K=32",
        "-DDIM_N=64",
        "-Dbf16_bf16_ONLY",
    ]
    assert art.rename_symbols == {
        "matmul_bf16_bf16": "matmul_bf16_bf16_32_32_64",
        "zero_bf16": "zero_bf16_32_32_64",
    }
    assert len(art.dependencies) == 1
    assert _source_filename(art).endswith("aie_kernels/aie2p/mm.cc")


def test_mm_32_64_32_matches_baseline(resolved) -> None:
    art = resolved["mm_32_64_32.o"]
    assert art.extra_flags == [
        "-DDIM_M=32",
        "-DDIM_K=64",
        "-DDIM_N=32",
        "-Dbf16_bf16_ONLY",
    ]
    assert art.rename_symbols == {
        "matmul_bf16_bf16": "matmul_bf16_bf16_32_64_32",
        "zero_bf16": "zero_bf16_32_64_32",
    }
    assert _source_filename(art).endswith("aie_kernels/aie2p/mm.cc")


def test_silu_matches_baseline(resolved) -> None:
    art = resolved["silu.o"]
    assert art.extra_flags == []
    assert art.rename_symbols == {}
    assert _source_filename(art).endswith("aie_kernels/aie2p/silu.cc")


def test_mul_matches_baseline(resolved) -> None:
    art = resolved["mul.o"]
    assert art.extra_flags == []
    assert art.rename_symbols == {}
    assert _source_filename(art).endswith("aie_kernels/generic/mul.cc")


def test_unknown_object_raises_lookup_error() -> None:
    links = [KernelLink(object_filename="unknown.o", symbols=frozenset({"foo"}))]
    with pytest.raises(LookupError) as excinfo:
        resolve_kernels(links, base_dir=BASE_DIR, kernel_dir=KERNEL_DIR)
    msg = str(excinfo.value)
    assert "unknown.o" in msg
    assert "foo" in msg


def test_adding_a_family_is_purely_additive() -> None:
    """A throwaway family resolves a synthetic link with no dispatch edits."""
    registry_before = len(kernel_resolver._REGISTRY)

    def _foo_matches(object_filename: str, symbols: frozenset[str]) -> bool:
        return object_filename == "foo_7.o"

    def _foo_build(object_filename, symbols, base_dir, kernel_dir):
        return KernelObjectArtifact(
            "foo_7.o",
            dependencies=[SourceArtifact(base_dir / "aie_kernels" / "foo.cc")],
            extra_flags=["-DP=7"],
        )

    register_family(KernelFamily("foo", _foo_matches, _foo_build))
    try:
        assert len(kernel_resolver._REGISTRY) == registry_before + 1
        links = [KernelLink(object_filename="foo_7.o", symbols=frozenset())]
        [artifact] = resolve_kernels(links, base_dir=BASE_DIR, kernel_dir=KERNEL_DIR)
        assert artifact.filename == "foo_7.o"
        assert artifact.extra_flags == ["-DP=7"]
        assert _source_filename(artifact).endswith("aie_kernels/foo.cc")
    finally:
        # Keep the module-level registry clean for other tests / re-runs.
        kernel_resolver._REGISTRY.pop()
