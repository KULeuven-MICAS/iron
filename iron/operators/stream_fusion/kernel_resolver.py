# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Extensible kernel resolver for stream-dse-generated designs.

Each ``link_with="X.o"`` object discovered by
:func:`iron.operators.stream_fusion.mlir_introspect.collect_kernel_links` must be
mapped to a concrete :class:`~iron.common.KernelObjectArtifact`: a C source file,
the extra compile flags it needs, and any symbol renames. This module performs
that mapping through a registry of per-kernel-family handlers.

A *family* is a :class:`KernelFamily`: a ``matcher`` (decides whether a family
handles a given ``(object_filename, symbols)`` pair) plus a ``builder`` (produces
the :class:`~iron.common.KernelObjectArtifact`). Families are tried in
registration order and the first match wins.

Extensibility contract
-----------------------
Adding support for a new kernel family is a single declarative step: write a
matcher and a builder, then call :func:`register_family`. Nothing else in this
module -- and nothing in the dispatch loop (:func:`resolve_kernels`) or in the
region class that consumes it -- needs to change. The dispatch loop never
special-cases any family; it only scans the registry.

Seed families (reproduce today's SwiGLU artifacts exactly)
----------------------------------------------------------
- ``mm``: object ``mm_<M>_<K>_<N>.o``. Source ``aie_kernels/<kernel_dir>/mm.cc``.
  Flags ``-DDIM_M=<M> -DDIM_K=<K> -DDIM_N=<N> -Dbf16_bf16_ONLY``. Renames the
  unsuffixed upstream symbols ``matmul_bf16_bf16`` / ``zero_bf16`` to their
  ``_<M>_<K>_<N>`` suffixed forms.
- ``silu``: object ``silu.o``. Source ``aie_kernels/<kernel_dir>/silu.cc``. No
  flags, no rename.
- ``mul``: object ``mul.o``. Source ``aie_kernels/generic/mul.cc``. No flags, no
  rename.
"""

from __future__ import annotations

import re
from dataclasses import dataclass
from pathlib import Path
from typing import Callable

from iron.common import KernelObjectArtifact, SourceArtifact

from iron.operators.stream_fusion.mlir_introspect import KernelLink

# A matcher decides whether a family handles a given (object_filename, symbols)
# pair. A builder turns that pair into a concrete KernelObjectArtifact.
Matcher = Callable[[str, "frozenset[str]"], bool]
Builder = Callable[[str, "frozenset[str]", Path, str], KernelObjectArtifact]


@dataclass
class KernelFamily:
    """A declarative kernel-family handler.

    Attributes:
        name: Human-readable family name (for diagnostics).
        matcher: ``matches(object_filename, symbols) -> bool``. Returns True if
            this family is responsible for the object.
        builder: ``build(object_filename, symbols, base_dir, kernel_dir) ->
            KernelObjectArtifact``. Produces the artifact (source, flags,
            renames) for a matched object.
    """

    name: str
    matcher: Matcher
    builder: Builder


_REGISTRY: list[KernelFamily] = []


def register_family(family: KernelFamily) -> None:
    """Append a :class:`KernelFamily` to the module-level registry.

    Families are tried in registration order by :func:`resolve_kernels`; the
    first whose matcher accepts an object wins. This is the single entry point
    for extending the resolver -- no dispatch or region edits are required.
    """
    _REGISTRY.append(family)


# --- mm family -------------------------------------------------------------

# Object names of the form mm_<M>_<K>_<N>.o, capturing the three tile dims.
_MM_RE = re.compile(r"^mm_(\d+)_(\d+)_(\d+)\.o$")


def _mm_matches(object_filename: str, symbols: frozenset[str]) -> bool:
    return _MM_RE.match(object_filename) is not None


def _mm_build(
    object_filename: str,
    symbols: frozenset[str],
    base_dir: Path,
    kernel_dir: str,
) -> KernelObjectArtifact:
    match = _MM_RE.match(object_filename)
    if match is None:  # pragma: no cover - guarded by matcher
        raise ValueError(f"{object_filename!r} is not an mm_<M>_<K>_<N>.o object")
    m, k, n = match.group(1), match.group(2), match.group(3)
    suffix = f"{m}_{k}_{n}"
    return KernelObjectArtifact(
        f"mm_{suffix}.o",
        dependencies=[SourceArtifact(base_dir / "aie_kernels" / kernel_dir / "mm.cc")],
        extra_flags=[
            f"-DDIM_M={m}",
            f"-DDIM_K={k}",
            f"-DDIM_N={n}",
            "-Dbf16_bf16_ONLY",
        ],
        rename_symbols={
            "matmul_bf16_bf16": f"matmul_bf16_bf16_{suffix}",
            "zero_bf16": f"zero_bf16_{suffix}",
        },
    )


# --- silu family -----------------------------------------------------------


def _silu_matches(object_filename: str, symbols: frozenset[str]) -> bool:
    return object_filename == "silu.o"


def _silu_build(
    object_filename: str,
    symbols: frozenset[str],
    base_dir: Path,
    kernel_dir: str,
) -> KernelObjectArtifact:
    return KernelObjectArtifact(
        "silu.o",
        dependencies=[
            SourceArtifact(base_dir / "aie_kernels" / kernel_dir / "silu.cc")
        ],
    )


# --- mul family ------------------------------------------------------------


def _mul_matches(object_filename: str, symbols: frozenset[str]) -> bool:
    return object_filename == "mul.o"


def _mul_build(
    object_filename: str,
    symbols: frozenset[str],
    base_dir: Path,
    kernel_dir: str,
) -> KernelObjectArtifact:
    return KernelObjectArtifact(
        "mul.o",
        dependencies=[SourceArtifact(base_dir / "aie_kernels" / "generic" / "mul.cc")],
    )


# Register the three seed families at import time. Order is the dispatch order.
register_family(KernelFamily("mm", _mm_matches, _mm_build))
register_family(KernelFamily("silu", _silu_matches, _silu_build))
register_family(KernelFamily("mul", _mul_matches, _mul_build))


def resolve_kernels(
    links: list[KernelLink],
    base_dir: Path,
    kernel_dir: str = "aie2p",
) -> list[KernelObjectArtifact]:
    """Map each :class:`KernelLink` to its :class:`KernelObjectArtifact`.

    For every link, the first registered :class:`KernelFamily` whose ``matcher``
    accepts ``(link.object_filename, link.symbols)`` builds the artifact. The
    dispatch loop is family-agnostic: it only scans :data:`_REGISTRY`, so adding
    a family (via :func:`register_family`) requires no changes here.

    Args:
        links: Kernel links discovered from the design's MLIR.
        base_dir: Repository root under which ``aie_kernels/...`` sources live.
        kernel_dir: Device kernel subdir (e.g. ``"aie2p"`` on NPU2, ``"aie2"``
            on NPU1); see :func:`iron.common.device_utils.get_kernel_dir`.

    Returns:
        One :class:`~iron.common.KernelObjectArtifact` per link, in link order.

    Raises:
        LookupError: If no registered family matches a link, naming the object
            filename and the symbol set so the gap is loud.
    """
    artifacts: list[KernelObjectArtifact] = []
    for link in links:
        for family in _REGISTRY:
            if family.matcher(link.object_filename, link.symbols):
                artifacts.append(
                    family.builder(
                        link.object_filename, link.symbols, base_dir, kernel_dir
                    )
                )
                break
        else:
            raise LookupError(
                f"No kernel family matches object {link.object_filename!r} "
                f"with symbols {sorted(link.symbols)}"
            )
    return artifacts
