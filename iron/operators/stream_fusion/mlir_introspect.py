# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""MLIR introspection for stream-dse-generated designs.

This module makes a stream-dse-generated AIE design self-describing purely from
its MLIR text. It does NOT import stream-dse and requires no NPU.

Two entry points:

- :func:`parse_runtime_args` reads the runtime arg-spec (shape + element dtype +
  direction) from the ``aie.runtime_sequence(...)`` memref signature. Direction
  is derived from ``out_count``: the last ``out_count`` args are ``"out"``, the
  rest ``"in"``.
- :func:`collect_kernel_links` discovers, for each ``link_with="X.o"`` object,
  the set of ``func.call @symbol`` symbols invoked inside the enclosing
  ``aie.core(...)`` block, de-duplicated by object filename (symbols unioned
  across cores that link the same object), preserving first-seen order.
"""

import re
from dataclasses import dataclass

import numpy as np
from ml_dtypes import bfloat16

from iron.common import AIERuntimeArgSpec

# MLIR element-type token -> numpy dtype. Extend as obvious; an unknown token
# raises a KeyError with a clear message so failures are loud rather than silent.
_DTYPE_MAP = {
    "bf16": bfloat16,
    "f32": np.float32,
    "f16": np.float16,
    "i32": np.int32,
    "i16": np.int16,
    "i8": np.int8,
}

# The runtime_sequence signature. stream-dse emits it on a single line, but
# DOTALL + non-greedy capture also tolerates a multi-line form.
_RUNTIME_SEQUENCE_RE = re.compile(r"aie\.runtime_sequence\((.*?)\)\s*\{", re.DOTALL)

# A single memref type inside the runtime_sequence arg list.
_MEMREF_RE = re.compile(r"memref<([^>]+)>")

# An aie.core block opener and the func.call symbols inside one.
_CORE_OPEN_RE = re.compile(r"aie\.core\(")
_FUNC_CALL_RE = re.compile(r"func\.call\s+@([A-Za-z0-9_]+)")

# The link_with attribute trailing an aie.core block.
_LINK_WITH_RE = re.compile(r'link_with="([^"]+)"')


def _dtype_from_token(token: str) -> np.dtype:
    try:
        return _DTYPE_MAP[token]
    except KeyError:
        raise KeyError(
            f"Unknown MLIR element dtype token {token!r}; "
            f"known tokens: {sorted(_DTYPE_MAP)}"
        )


def parse_runtime_args(mlir_text: str, out_count: int = 1) -> list[AIERuntimeArgSpec]:
    """Parse the runtime arg-spec from an ``aie.runtime_sequence(...)`` signature.

    Each argument is read from its ``memref<dim0 x dim1 x ... x DTYPE>`` type:
    leading tokens are the integer dims (the shape), the trailing token is the
    element dtype (mapped via :data:`_DTYPE_MAP`).

    Direction is derived from ``out_count``: with ``n`` args, an arg at index
    ``i`` is ``"out"`` if ``i >= n - out_count`` else ``"in"``.

    Args:
        mlir_text: MLIR text containing exactly one ``aie.runtime_sequence``.
        out_count: Number of trailing args treated as outputs (default 1).

    Returns:
        A list of :class:`~iron.common.AIERuntimeArgSpec`, in signature order.

    Raises:
        ValueError: If no ``aie.runtime_sequence`` is found.
        KeyError: If a memref carries an unknown element dtype token.
    """
    match = _RUNTIME_SEQUENCE_RE.search(mlir_text)
    if match is None:
        raise ValueError("No aie.runtime_sequence(...) found in MLIR text")

    arg_list = match.group(1)
    memrefs = _MEMREF_RE.findall(arg_list)
    if not memrefs:
        raise ValueError(
            "aie.runtime_sequence found but no memref arguments could be parsed"
        )

    n = len(memrefs)
    specs: list[AIERuntimeArgSpec] = []
    for i, inner in enumerate(memrefs):
        tokens = inner.split("x")
        *dim_tokens, dtype_token = tokens
        shape = tuple(int(t) for t in dim_tokens)
        dtype = _dtype_from_token(dtype_token)
        direction = "out" if i >= n - out_count else "in"
        specs.append(AIERuntimeArgSpec(direction=direction, shape=shape, dtype=dtype))

    return specs


@dataclass
class KernelLink:
    """A linked kernel object and the symbols its cores call.

    Attributes:
        object_filename: The ``link_with`` object file (e.g. ``"silu.o"``).
        symbols: The set of ``func.call`` symbol names invoked inside the
            ``aie.core`` block(s) that link this object, unioned across cores.
    """

    object_filename: str
    symbols: frozenset[str]


def collect_kernel_links(mlir_text: str) -> list[KernelLink]:
    """Collect ``(link_with object, called-symbol-set)`` records from MLIR.

    For every ``link_with="X.o"`` occurrence, the enclosing ``aie.core(...)``
    block is located by scanning backwards from the ``link_with`` position to the
    nearest preceding ``aie.core(``; every ``func.call @symbol`` in that span is
    collected. Records are then de-duplicated by ``object_filename``, unioning the
    symbol sets across all cores that link the same object, while preserving the
    order in which each object first appears.

    Args:
        mlir_text: MLIR text containing one or more ``aie.core`` blocks.

    Returns:
        A list of :class:`KernelLink`, one per distinct object, in first-seen
        order. Empty if there are no ``link_with`` blocks.
    """
    # object_filename -> accumulating set of symbols. Python dicts preserve
    # insertion order, which gives us first-seen ordering for free.
    accumulated: dict[str, set[str]] = {}

    for link_match in _LINK_WITH_RE.finditer(mlir_text):
        object_filename = link_match.group(1)
        link_pos = link_match.start()

        # Find the enclosing aie.core( by scanning backwards: take the last
        # aie.core( opener that occurs before this link_with.
        core_start = None
        for core_match in _CORE_OPEN_RE.finditer(mlir_text, 0, link_pos):
            core_start = core_match.end()
        if core_start is None:
            # link_with with no preceding aie.core (malformed); skip its span
            # start at the link position so we at least don't pull unrelated calls.
            core_start = link_pos

        span = mlir_text[core_start:link_pos]
        symbols = set(_FUNC_CALL_RE.findall(span))

        accumulated.setdefault(object_filename, set()).update(symbols)

    return [
        KernelLink(object_filename=obj, symbols=frozenset(syms))
        for obj, syms in accumulated.items()
    ]
