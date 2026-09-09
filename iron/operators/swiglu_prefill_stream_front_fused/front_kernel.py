# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""stream-dse kernel descriptions for the fused SwiGLU front and its down GEMM.

Both kernels work on a *blocked* hidden dimension (see
:mod:`~iron.operators.swiglu_prefill_stream_front_fused.reference`): the block
index is an extent-one operand dimension of every tile, so the layouts below carry
it as a unit-bound stride and the data the kernels see is exactly what the plain
2-D/3-D kernels were written against.
"""

from collections.abc import Sequence
from dataclasses import dataclass

from snaxc.ir.tsl import Stride, TiledStride, TiledStridedLayout
from xdsl.dialects.builtin import FunctionType, MemRefType, i32
from xdsl.dialects.func import CallOp
from xdsl.irdl import Operation

from stream.compiler.dialects.stream import ComputationNodeOp
from stream.compiler.kernels.aie_kernel import AIEKernelWithZeroing

# Intrinsic MAC tile of the aie2p bf16 kernels on the bfp16 MACs.
R, S, T = 8, 8, 8


def _unit(stride: int) -> TiledStride:
    """An extent-one dimension; its stride never moves anything."""
    return TiledStride([Stride(stride, 1)])


@dataclass
class SwigluFrontFusedKernel(AIEKernelWithZeroing):
    """``front_fused.cc``: ``A[m, k] x B[1, 1, k, 2, n] -> C[m, 1, 1, n]``.

    The two leading unit dimensions of ``B`` (and the matching ones of ``C``) are
    the hidden block's group and index: a kernel call takes one block.
    """

    m: int
    k: int
    n: int
    full_k: int

    @property
    def suffix(self) -> str:
        return f"{self.m}_{self.k}_{self.n}_k{self.full_k}"

    @property
    def zero_name(self) -> str:
        return f"swiglu_fused_zero_{self.suffix}"

    def zero_type(self, op: ComputationNodeOp) -> FunctionType:
        return FunctionType.from_lists(inputs=[op.inputs[2].type], outputs=[])

    @property
    def linkwith_name(self) -> str:
        return f"swiglu_fused_core_{self.suffix}.o"

    @property
    def function_name(self) -> str:
        return f"swiglu_front_fused_{self.suffix}"

    def operand_layouts(self) -> Sequence[TiledStridedLayout]:
        r, s, t = R, S, T
        mt, kt, nt = self.m // r, self.k // s, self.n // t
        return [
            # A: m x k, tiles of r x s
            TiledStridedLayout(
                [
                    TiledStride([Stride(r * s * kt, mt), Stride(s, r)]),
                    TiledStride([Stride(r * s, kt), Stride(1, s)]),
                ]
            ),
            # B: [group] x [block] x k x 2 x n, gate/up tiled independently as s x t
            TiledStridedLayout(
                [
                    _unit(2 * self.k * self.n),
                    _unit(2 * self.k * self.n),
                    TiledStride([Stride(2 * s * t * nt, kt), Stride(t, s)]),
                    TiledStride([Stride(s * t * nt, 2)]),
                    TiledStride([Stride(s * t, nt), Stride(1, t)]),
                ]
            ),
            # C: m x [group] x [block] x n, tiles of r x t
            TiledStridedLayout(
                [
                    TiledStride([Stride(r * t * nt, mt), Stride(t, r)]),
                    _unit(self.m * self.n),
                    _unit(self.m * self.n),
                    TiledStride([Stride(r * t, nt), Stride(1, t)]),
                ]
            ),
        ]

    def function_type(self, op: ComputationNodeOp) -> FunctionType:
        assert op.output is not None
        return FunctionType.from_lists(
            inputs=[op.inputs[0].type, op.inputs[1].type, op.inputs[2].type],
            outputs=[],
        )

    def function_call(self, op: ComputationNodeOp) -> Sequence[Operation]:
        assert op.output is not None
        return [
            CallOp(self.function_name, [op.inputs[0], op.inputs[1], op.inputs[2]], []),
        ]


@dataclass
class GemmBlockedKernel(AIEKernelWithZeroing):
    """``mm.cc``: ``A[m, 1, k] x B[1, k, n] -> C[m, n]``, the contraction blocked.

    The same object as stream-dse's own ``gemm`` kernel; only the operands' ranks
    differ, the block index being an extent-one dimension of both inputs.
    """

    m: int
    k: int
    n: int

    @property
    def suffix(self) -> str:
        return f"{self.m}_{self.k}_{self.n}"

    @property
    def zero_name(self) -> str:
        return f"zero_bf16_{self.suffix}"

    def zero_type(self, op: ComputationNodeOp) -> FunctionType:
        return FunctionType.from_lists(inputs=[op.inputs[2].type], outputs=[])

    @property
    def linkwith_name(self) -> str:
        return f"mm_{self.suffix}.o"

    @property
    def function_name(self) -> str:
        return f"matmul_bf16_bf16_{self.suffix}"

    def operand_layouts(self) -> Sequence[TiledStridedLayout]:
        r, s, t = R, S, T
        mt, kt, nt = self.m // r, self.k // s, self.n // t
        return [
            # A: m x [block] x k, tiles of r x s
            TiledStridedLayout(
                [
                    TiledStride([Stride(r * s * kt, mt), Stride(s, r)]),
                    _unit(self.m * self.k),
                    TiledStride([Stride(r * s, kt), Stride(1, s)]),
                ]
            ),
            # B: [block] x k x n, tiles of s x t
            TiledStridedLayout(
                [
                    _unit(self.k * self.n),
                    TiledStride([Stride(s * t * nt, kt), Stride(t, s)]),
                    TiledStride([Stride(s * t, nt), Stride(1, t)]),
                ]
            ),
            # C: m x n, tiles of r x t
            TiledStridedLayout(
                [
                    TiledStride([Stride(r * t * nt, mt), Stride(t, r)]),
                    TiledStride([Stride(r * t, nt), Stride(1, t)]),
                ]
            ),
        ]

    def function_type(self, op: ComputationNodeOp) -> FunctionType:
        assert op.output is not None
        return FunctionType.from_lists(
            inputs=[op.inputs[0].type, op.inputs[1].type, op.inputs[2].type],
            outputs=[],
        )

    def function_call(self, op: ComputationNodeOp) -> Sequence[Operation]:
        assert op.output is not None
        return [
            CallOp(self.function_name, [op.inputs[0], op.inputs[1], op.inputs[2]], []),
        ]


@dataclass
class GemmJoinedKernel(GemmBlockedKernel):
    """``mm.cc`` over a memory-tile join: ``A[J, m, 1, 1, k] x B[1, 1, 1, 1, k, n] -> C[m, 1, 1, n]``.

    The contraction is blocked twice over: ``J`` joined blocks (produced by as many
    cores, staged in a memory tile) of one block each. The kernel receives the
    whole joined element and the index of the block to use, which stream-dse
    passes as an extra ``i32`` operand (see
    ``TransferToObjectFIFOPattern.generate_memtile_join``); ``mm_join.cc`` offsets
    the ``A`` pointer by it.
    """

    joined: int = 2

    @property
    def linkwith_name(self) -> str:
        return f"mm_join_{self.suffix}.o"

    @property
    def function_name(self) -> str:
        return f"matmul_bf16_bf16_join_{self.suffix}"

    def operand_layouts(self) -> Sequence[TiledStridedLayout]:
        r, s, t = R, S, T
        mt, kt, nt = self.m // r, self.k // s, self.n // t
        return [
            # A: [joined block] x m x [block] x [block] x k, tiles of r x s
            TiledStridedLayout(
                [
                    TiledStride([Stride(self.m * self.k, self.joined)]),
                    TiledStride([Stride(r * s * kt, mt), Stride(s, r)]),
                    _unit(self.m * self.k),
                    _unit(self.m * self.k),
                    TiledStride([Stride(r * s, kt), Stride(1, s)]),
                ]
            ),
            # B: [output group] x [output tile] x [block] x [block] x k x n, tiles of s x t
            TiledStridedLayout(
                [
                    _unit(self.k * self.n),
                    _unit(self.k * self.n),
                    _unit(self.k * self.n),
                    _unit(self.k * self.n),
                    TiledStride([Stride(s * t * nt, kt), Stride(t, s)]),
                    TiledStride([Stride(s * t, nt), Stride(1, t)]),
                ]
            ),
            # C: m x [output tile] x [output group] x n, tiles of r x t
            TiledStridedLayout(
                [
                    TiledStride([Stride(r * t * nt, mt), Stride(t, r)]),
                    _unit(self.m * self.n),
                    _unit(self.m * self.n),
                    TiledStride([Stride(r * t, nt), Stride(1, t)]),
                ]
            ),
        ]

    @staticmethod
    def _arguments(op: ComputationNodeOp):
        """``(A, B, C, block)``: the memref operands in order, then the block index.

        The index is appended to the node's operands when the join is lowered,
        before the output operand is, so it is picked out by type.
        """
        memrefs = [i for i in op.inputs if isinstance(i.type, MemRefType)]
        indices = [i for i in op.inputs if i.type == i32]
        assert (
            len(memrefs) == 3 and len(indices) == 1
        ), "expected A, B, C and the joined block index"
        return (*memrefs, indices[0])

    def zero_type(self, op: ComputationNodeOp) -> FunctionType:
        return FunctionType.from_lists(inputs=[self._arguments(op)[2].type], outputs=[])

    def function_type(self, op: ComputationNodeOp) -> FunctionType:
        assert op.output is not None
        return FunctionType.from_lists(
            inputs=[argument.type for argument in self._arguments(op)], outputs=[]
        )

    def function_call(self, op: ComputationNodeOp) -> Sequence[Operation]:
        assert op.output is not None
        return [CallOp(self.function_name, list(self._arguments(op)), [])]
