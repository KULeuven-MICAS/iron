# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Registry binding torch operators to their ONNX form and their AIE kernel.

One :class:`StreamOp` entry per supported torch operator is all a stream-dse-backed
operator needs: how the op is emitted by the ONNX exporter, which stream-dse kernel
implements it, which ``aie_kernels`` source that kernel is compiled from, and what
operand layouts the generated DMAs must use.

Ops stream-dse implements with a fused kernel but ONNX has no operator for are
declared with :func:`custom_op`, which gives them a schema in a private domain so
the exporter emits them as a single node.

Supporting a new op is one :class:`StreamKernel` plus one :data:`TORCH_OPS` entry --
the kernel source is IRON's existing ``aie_kernels/<dir>/<name>.cc``, exactly as the
hand-written operators use it.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Callable

import torch
from onnx import defs
from onnxscript import opset18
from onnxscript.values import Op, Opset

from iron.common.layout import (
    TiledStridedLayout,
    contiguous_2d,
    contiguous_tiled_2d,
    tiled_2d,
)

# Intrinsic MAC tile dimensions of the aie2p kernels stream-dse targets. The
# operand layouts are the contract the generated DMAs and the compiled kernel
# objects agree on.
# mm.cc takes an 8-row MAC tile when bf16 matmuls run on the bfp16 MACs and a
# 4-row one when they do not.
R, S, T = 4, 8, 8
MAC_ROWS_BFP16 = 8

# Element tile the stream-dse elementwise kernels are written against.
ELEMENTWISE_TILE = (32, 64)

# Private domain for ops that exist as an AIE kernel but not as an ONNX operator.
CUSTOM_DOMAIN = Opset("com.example", 1)

_ELEMENT_TYPES = ["tensor(bfloat16)", "tensor(float)"]


def custom_op(name: str, arity: int = 1) -> Op:
    """An operator in :data:`CUSTOM_DOMAIN`, emitted by the exporter as one node."""
    schema = defs.OpSchema(
        name,
        CUSTOM_DOMAIN.domain,
        CUSTOM_DOMAIN.version,
        inputs=[defs.OpSchema.FormalParameter(f"X{i}", "T") for i in range(arity)],
        outputs=[defs.OpSchema.FormalParameter("Y", "T")],
        type_constraints=[("T", _ELEMENT_TYPES, "")],
    )
    return Op(CUSTOM_DOMAIN, name, schema)


def mac_rows(bfp16_mmul: bool) -> int:
    """Rows of the MAC tile a kernel object compiled this way takes."""
    return MAC_ROWS_BFP16 if bfp16_mmul else R


def gemm_layouts(
    m: int, k: int, n: int, bfp16_mmul: bool = False
) -> tuple[TiledStridedLayout, ...]:
    """Layouts of a GEMM's ``A[m,k]``, ``B[k,n]`` and ``C[m,n]`` operands."""
    rows = mac_rows(bfp16_mmul)
    return (tiled_2d(m, k, rows, S), tiled_2d(k, n, S, T), tiled_2d(m, n, rows, T))


def elementwise_layouts(
    nb_operands: int, bfp16_mmul: bool = False
) -> tuple[TiledStridedLayout, ...]:
    """Identical tiled layout for each operand of an elementwise kernel."""
    return (tiled_2d(*ELEMENTWISE_TILE, mac_rows(bfp16_mmul), T),) * nb_operands


def softmax_layouts(n: int) -> tuple[TiledStridedLayout, ...]:
    """Layouts of the softmax's input and output.

    ``softmax.cc`` keeps one maximum and one sum over the length it is handed and
    takes no stride, so its tile is a single row and that row has to be contiguous.
    """
    return (contiguous_2d(1, n),) * 2


# The one block shape mha.cc's flash kernels are written for.
FLASH_TILE = 64


def flash_layouts() -> tuple[TiledStridedLayout, ...]:
    """Layouts of the online softmax's score and probability blocks.

    Row major, since the kernel walks a row at a time, but spelled over the MAC tile
    of the GEMM either side of it so the transform between them lines up.
    """
    return (contiguous_tiled_2d(FLASH_TILE, FLASH_TILE, MAC_ROWS_BFP16, T),) * 2


def _mha_artifacts(base_dir, kernel_dir):
    """``mha.cc``'s object: every entry point one online-softmax step calls.

    mha.cc includes mm.cc and softmax.cc, so one translation unit holds the partial
    softmax, the value accumulation and the rescale, and both cores of a step link
    against it. Its matmuls are compiled for the 64x64x64 block the kernels hard-code.
    Beside it, the vectorized copy that takes a snapshot of the running scale off the
    softmax core, built exactly as ``iron/operators/mha`` builds it.
    """
    from iron.common.compilation import KernelObjectArtifact, SourceArtifact

    return [
        KernelObjectArtifact(
            "mha_passThrough.o",
            dependencies=[
                SourceArtifact(base_dir / "aie_kernels" / "generic" / "passThrough.cc")
            ],
            extra_flags=["-DBIT_WIDTH=16"],
        ),
        KernelObjectArtifact(
            "mha.o",
            dependencies=[
                SourceArtifact(base_dir / "aie_kernels" / kernel_dir / f"{name}.cc")
                for name in ("mha", "mm", "softmax")
            ],
            extra_flags=[
                "-Dbf16_bf16_ONLY",
                f"-DDIM_M={FLASH_TILE}",
                f"-DDIM_K={FLASH_TILE}",
                f"-DDIM_N={FLASH_TILE}",
                "-DROUND_CONV_EVEN",
                "-DAIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16",
                "-DB_COL_MAJ",
            ],
        ),
    ]


def _gemm_artifacts(base_dir, kernel_dir, m: int, k: int, n: int):
    """The ``mm.cc`` object specialized for one tile shape.

    stream-dse emits dimension-suffixed symbols so GEMMs of different tile shapes
    coexist in one design (``GemmKernel.function_name``/``zero_name``); rename
    ``mm.cc``'s unsuffixed symbols to match.
    """
    from iron.common.compilation import KernelObjectArtifact, SourceArtifact

    suffix = f"{m}_{k}_{n}"
    return [
        KernelObjectArtifact(
            f"mm_{suffix}.o",
            dependencies=[
                SourceArtifact(base_dir / "aie_kernels" / kernel_dir / "mm.cc")
            ],
            extra_flags=[
                f"-DDIM_M={m}",
                f"-DDIM_K={k}",
                f"-DDIM_N={n}",
                "-Dbf16_bf16_ONLY",
                # Emulating the matmul on the bfp16 MACs is what makes the 8-row
                # MAC tile available, so it and the layouts move together.
                "-DAIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16",
                "-DROUND_CONV_EVEN",
            ],
            rename_symbols={
                "matmul_bf16_bf16": f"matmul_bf16_bf16_{suffix}",
                "zero_bf16": f"zero_bf16_{suffix}",
            },
        )
    ]


@dataclass(frozen=True)
class StreamKernel:
    """An AIE kernel: its stream-dse identity, its source, and its operand layouts.

    ``source``/``subdir`` name the file in IRON's ``aie_kernels`` library the same
    way the hand-written operators do (``subdir=None`` means the device directory,
    e.g. ``aie2p``). The object name must equal the kernel's ``linkwith_name`` in
    stream-dse, since the generated MLIR links against it.
    """

    key: str  # stream-dse AIEKernels key
    layouts: Callable[..., tuple[TiledStridedLayout, ...]]
    source: str | None = None
    subdir: str | None = None
    artifacts: Callable | None = None  # overrides source/subdir when tile-specialized
    only_on: str | None = None  # device directory the binding is written against

    def kernel_artifacts(self, base_dir, kernel_dir, **kwargs):
        """Compilation artifacts building this kernel's object file."""
        if self.only_on is not None and kernel_dir != self.only_on:
            raise NotImplementedError(
                f"the stream-dse '{self.key}' kernel is written against "
                f"{self.only_on}, not {kernel_dir}"
            )
        if self.artifacts is not None:
            return self.artifacts(base_dir, kernel_dir, **kwargs)
        from iron.common.compilation import KernelObjectArtifact, SourceArtifact

        subdir = self.subdir or kernel_dir
        return [
            KernelObjectArtifact(
                f"{self.source}.o",
                dependencies=[
                    SourceArtifact(
                        base_dir / "aie_kernels" / subdir / f"{self.source}.cc"
                    )
                ],
            )
        ]


GEMM = StreamKernel(key="gemm", layouts=gemm_layouts, artifacts=_gemm_artifacts)
SILU = StreamKernel(key="silu", layouts=lambda: elementwise_layouts(2), source="silu")
ELTWISE_MUL = StreamKernel(
    key="eltwise_mul",
    layouts=lambda: elementwise_layouts(3),
    source="mul",
    subdir="generic",
)
# aie2's softmax.cc is a different algorithm, over 16-element vectors and needing
# lut_based_ops.o, that neither the layouts nor the stream-dse kernel describe.
SOFTMAX = StreamKernel(
    key="softmax", layouts=softmax_layouts, source="softmax", only_on="aie2p"
)

def fused_score_softmax_layouts(
    m: int, k: int, n: int, bfp16_mmul: bool = False
) -> tuple[TiledStridedLayout, ...]:
    """Layouts of the fused score GEMM's ``Q``, ``k_t`` and probability block.

    The operands as the GEMM takes them, but the block leaves row major rather than
    MAC tiled: that is the layout the online softmax behind it reads, and having the
    GEMM write it directly is what lets the two share a core.
    """
    rows = mac_rows(bfp16_mmul)
    return (
        tiled_2d(m, k, rows, S),
        tiled_2d(k, n, S, T),
        contiguous_tiled_2d(m, n, rows, T),
    )


# mha.cc's flash kernels, both halves of an online-softmax step, live in one object.
FLASH = StreamKernel(
    key="partial_softmax",
    layouts=flash_layouts,
    artifacts=_mha_artifacts,
    only_on="aie2p",
)

# The score GEMM and the online softmax as one node, so two fused layers cover the
# four rows that three layers leave one of idle.
FUSED_SCORE_SOFTMAX = StreamKernel(
    key="matmul_softmax",
    layouts=fused_score_softmax_layouts,
    artifacts=_mha_artifacts,
    only_on="aie2p",
)

Silu = custom_op("Silu")
PartialSoftmax = custom_op("PartialSoftmax")
MatmulSoftmax = custom_op("MatmulSoftmax", arity=2)


@torch.library.custom_op("iron_stream::partial_softmax", mutates_args=())
def partial_softmax(x: torch.Tensor) -> torch.Tensor:
    """One online-softmax step over a key block: exponentials, left unnormalised.

    The running row maximum and sum, the causal mask and the final division are all
    the kernel's own business, so this is the whole of what the graph says about the
    step: an elementwise node, whose key axis therefore carries no reduction and is
    free to be blocked.
    """
    return torch.exp(x - x.amax(dim=-1, keepdim=True))


@partial_softmax.register_fake
def _(x: torch.Tensor) -> torch.Tensor:
    return torch.empty_like(x)


@torch.library.custom_op("iron_stream::matmul_softmax", mutates_args=())
def matmul_softmax(q: torch.Tensor, k_t: torch.Tensor) -> torch.Tensor:
    """The score GEMM and one online-softmax step over the block it produces.

    The same value as the two nodes it replaces, so the golden output is unchanged:
    what moves is where the block is computed, not what it holds.
    """
    scores = q @ k_t
    return torch.exp(scores - scores.amax(dim=-1, keepdim=True))


@matmul_softmax.register_fake
def _(q: torch.Tensor, k_t: torch.Tensor) -> torch.Tensor:
    return q.new_empty((*q.shape[:-1], k_t.shape[-1]))


def _to_gemm(a, b):
    return opset18.Gemm(a, b)


def _to_silu(x):
    return Silu(x)


def _to_partial_softmax(x):
    return PartialSoftmax(x)


def _to_matmul_softmax(a, b):
    return MatmulSoftmax(a, b)


def _to_mul(a, b):
    return opset18.Mul(a, b)


def _to_softmax(x, dim):
    """Pinned to a single node: the torchlib lowering can add a ``Cast``, and any
    extra node shifts the positional renaming of the exported graph. A ``dtype``
    argument has nowhere to go here and is rejected rather than dropped."""
    return opset18.Softmax(x, axis=dim)


@dataclass(frozen=True)
class StreamOp:
    """How one torch operator is exported, and which kernel runs it.

    ``translation`` overrides how the exporter lowers the operator, and is needed
    only when its default lowering is not what stream-dse parses. Leaving it unset
    keeps the exporter's own lowering and just binds the resulting ONNX operator to
    a kernel.
    """

    onnx_type: str
    kernel: StreamKernel
    translation: Callable | None = None


# torch operator -> its ONNX form and AIE kernel. Gemm rather than the exporter's
# default MatMul because stream-dse's Gemm parser iterates (m, k, n), which is the
# order the mappings address as D0/D1/D2.
TORCH_OPS: dict[Callable, StreamOp] = {
    torch.ops.aten.matmul.default: StreamOp("Gemm", GEMM, _to_gemm),
    torch.ops.aten.silu.default: StreamOp("Silu", SILU, _to_silu),
    torch.ops.aten.mul.Tensor: StreamOp("Mul", ELTWISE_MUL, _to_mul),
    torch.ops.aten.softmax.int: StreamOp("Softmax", SOFTMAX, _to_softmax),
    torch.ops.iron_stream.partial_softmax.default: StreamOp(
        "PartialSoftmax", FLASH, _to_partial_softmax
    ),
    torch.ops.iron_stream.matmul_softmax.default: StreamOp(
        "MatmulSoftmax", FUSED_SCORE_SOFTMAX, _to_matmul_softmax
    ),
}

_BY_ONNX_TYPE = {op.onnx_type: op for op in TORCH_OPS.values()}


def translation_table() -> dict[Callable, Callable]:
    """The ``custom_translation_table`` for :func:`torch.onnx.export`."""
    return {
        target: op.translation
        for target, op in TORCH_OPS.items()
        if op.translation is not None
    }


def op_for_onnx_type(onnx_type: str) -> StreamOp:
    """The :class:`StreamOp` an exported node's operator type belongs to."""
    try:
        return _BY_ONNX_TYPE[onnx_type]
    except KeyError:
        raise NotImplementedError(
            f"ONNX operator '{onnx_type}' has no stream-dse mapping; "
            f"add it to iron.common.stream.ops.TORCH_OPS"
        ) from None
