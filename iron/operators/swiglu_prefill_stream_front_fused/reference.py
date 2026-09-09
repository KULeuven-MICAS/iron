# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Reference SwiGLU-prefill block: ``(SiLU(x @ gate) * (x @ up)) @ down``.

Running this module produces the golden output; exporting it produces the
workload stream-dse generates the design from.

The hidden dimension is *blocked*: ``w_front`` is ``[HIDDEN_SPLIT, blocks,
embedding, 2, HIDDEN_BLOCK]`` with ``blocks = hidden / (HIDDEN_SPLIT *
HIDDEN_BLOCK)``, so that one kernel tile of gate+up weights is one contiguous run
in DDR rather than 128 scattered 128-byte reads, and the leading dimension is the
half of the hidden blocks a group of front cores works on -- which is what lets
the front's weights arrive over one stream per group instead of one for all.
The front's result is ``[seq, HIDDEN_SPLIT, blocks, HIDDEN_BLOCK]``, bit-identical
to the row-major ``[seq, hidden]`` it stands for. The down projection consumes
that and a ``w_down`` blocked as ``[OUTPUT_SPLIT, tiles, HIDDEN_SPLIT, blocks,
HIDDEN_BLOCK, OUTPUT_BLOCK]``: the group of down cores that produces an output
column block owns a contiguous run of weights, and each kernel tile of it is one
contiguous 8 KB read. The output is ``[seq, tiles, OUTPUT_SPLIT, OUTPUT_BLOCK]``,
bit-identical to ``[seq, embedding]`` with column ``tile * OUTPUT_SPLIT *
OUTPUT_BLOCK + group * OUTPUT_BLOCK + i``. Keeping every operand a plain
permutation of the iteration space is what lets stream-dse derive the DMAs.

The names below are the block's vocabulary, and they are the ones
:mod:`iron.operators.swiglu_decode.reference` -- the golden reference this
operator shares -- gives the same tensors. Everything downstream is named from
here: the ONNX tensors, the mapping's layers and runtime arguments, the runtime
buffers, and the tensor handed between fusion groups.
"""

from onnx import defs
from onnxscript.values import Op, Opset
import torch
from torch import nn

NAME_INPUT = "input"
NAME_FRONT = "front"
NAME_OUTPUT = "output"

NAME_WEIGHTS = ("w_front", "w_down")

# Width of one hidden-dimension block; the front kernel's hidden tile.
HIDDEN_BLOCK = 64
# Groups the hidden blocks are split over; each is one group of front cores.
HIDDEN_SPLIT = 2
# Width of one output-column block (the down kernel's output tile) and the groups
# of down cores the output columns are split over, interleaved block by block.
OUTPUT_BLOCK = 64
OUTPUT_SPLIT = 2

# Every name this module exports, for the correspondence check in iron/tests/stream.
TENSOR_NAMES = (
    NAME_INPUT,
    NAME_OUTPUT,
    NAME_FRONT,
    *NAME_WEIGHTS,
)


class SwiGLUFrontFused(nn.Module):
    """SwiGLU prefill block over a ``[seq_len, embedding_dim]`` activation."""

    def __init__(self, embedding_dim: int, hidden_dim: int, dtype=torch.bfloat16):
        super().__init__()
        assert hidden_dim % (HIDDEN_SPLIT * HIDDEN_BLOCK) == 0
        blocks = hidden_dim // (HIDDEN_SPLIT * HIDDEN_BLOCK)
        self.w_front = nn.Parameter(
            torch.zeros(
                (HIDDEN_SPLIT, blocks, embedding_dim, 2, HIDDEN_BLOCK), dtype=dtype
            )
        )
        assert embedding_dim % (OUTPUT_SPLIT * OUTPUT_BLOCK) == 0
        tiles = embedding_dim // (OUTPUT_SPLIT * OUTPUT_BLOCK)
        self.w_down = nn.Parameter(
            torch.zeros(
                (OUTPUT_SPLIT, tiles, HIDDEN_SPLIT, blocks, HIDDEN_BLOCK, OUTPUT_BLOCK),
                dtype=dtype,
            )
        )

    def forward(self, input):
        front = torch_swiglu_front_fused(input, self.w_front)
        return torch_gemm_blocked(front, self.w_down)


def block_front_weights(w_gate: torch.Tensor, w_up: torch.Tensor) -> torch.Tensor:
    """``[embedding, hidden]`` gate and up weights, in the layout ``w_front`` takes."""
    embedding_dim, hidden_dim = w_gate.shape
    blocks = hidden_dim // (HIDDEN_SPLIT * HIDDEN_BLOCK)
    stacked = torch.stack((w_gate, w_up), dim=1)  # [embedding, 2, hidden]
    return (
        stacked.reshape(embedding_dim, 2, HIDDEN_SPLIT, blocks, HIDDEN_BLOCK)
        .permute(2, 3, 0, 1, 4)
        .contiguous()
    )


def block_down_weights(w_down: torch.Tensor) -> torch.Tensor:
    """``[hidden, embedding]`` down weights, in the layout ``w_down`` takes."""
    hidden_dim, embedding_dim = w_down.shape
    blocks = hidden_dim // (HIDDEN_SPLIT * HIDDEN_BLOCK)
    tiles = embedding_dim // (OUTPUT_SPLIT * OUTPUT_BLOCK)
    return (
        w_down.reshape(
            HIDDEN_SPLIT, blocks, HIDDEN_BLOCK, tiles, OUTPUT_SPLIT, OUTPUT_BLOCK
        )
        .permute(4, 3, 0, 1, 2, 5)
        .contiguous()
    )


def swiglu_module(embedding_dim, hidden_dim, golden_reference=None) -> SwiGLUFrontFused:
    """A :class:`SwiGLU`, optionally holding ``golden_reference``'s weights.

    Weight *values* are irrelevant to the exported graph (only shapes and the
    topology are), so the operator builds its design from a zero-filled module.
    """
    module = SwiGLUFrontFused(embedding_dim, hidden_dim).eval()
    if golden_reference is not None:
        with torch.no_grad():
            for name in NAME_WEIGHTS:
                getattr(module, name).copy_(golden_reference[name])
    return module


# custom pytorch operators
@torch.library.custom_op("custom::swiglu_fused_front", mutates_args=())
def torch_swiglu_front_fused(x: torch.Tensor, w: torch.Tensor) -> torch.Tensor:
    """``[m, k] x [n_h, n_l, k, 2, n_i] -> [m, n_h, n_l, n_i]``: SiLU(x @ gate) * (x @ up)."""
    m, xk = x.shape
    n_h, n_l, wk, t, n_i = w.shape
    assert xk == wk and t == 2

    flat = w.permute(2, 3, 0, 1, 4).reshape(wk, 2, n_h * n_l * n_i)
    gate, up = x @ flat[:, 0, :], x @ flat[:, 1, :]
    return (torch.nn.functional.silu(gate) * up).reshape(m, n_h, n_l, n_i)


@torch_swiglu_front_fused.register_fake
def _(x: torch.Tensor, w: torch.Tensor):
    m, xk = x.shape
    n_h, n_l, wk, t, n_i = w.shape
    assert xk == wk and t == 2

    return torch.empty((m, n_h, n_l, n_i), dtype=x.dtype, device=x.device)


@torch.library.custom_op("custom::gemm_blocked", mutates_args=())
def torch_gemm_blocked(x: torch.Tensor, w: torch.Tensor) -> torch.Tensor:
    """``[m, k_h, k_l, k_i] x [j, n_t, k_h, k_l, k_i, n_i] -> [m, n_t, j, n_i]``.

    A GEMM over a blocked contraction, its output blocked by column: the result
    is row-major ``[m, n]`` with ``n = (n_t * J + j) * N_i + n_i``.
    """
    m, k_h, k_l, k_i = x.shape
    j, n_t, wk_h, wk_l, wk_i, n_i = w.shape
    assert (k_h, k_l, k_i) == (wk_h, wk_l, wk_i)
    k = k_h * k_l * k_i
    flat = w.permute(2, 3, 4, 1, 0, 5).reshape(k, n_t * j * n_i)
    return (x.reshape(m, k) @ flat).reshape(m, n_t, j, n_i)


@torch_gemm_blocked.register_fake
def _(x: torch.Tensor, w: torch.Tensor):
    m, k_h, k_l, k_i = x.shape
    j, n_t, wk_h, wk_l, wk_i, n_i = w.shape
    assert (k_h, k_l, k_i) == (wk_h, wk_l, wk_i)
    return torch.empty((m, n_t, j, n_i), dtype=x.dtype, device=x.device)


# custom onnx operator
onnx_custom_domain = Opset(domain="custom", version=1)
onnx_swiglu_front_fused = Op(
    onnx_custom_domain,
    "SwigluFrontFused",
    defs.OpSchema(
        "SwigluFrontFused",
        onnx_custom_domain.domain,
        onnx_custom_domain.version,
        inputs=[
            defs.OpSchema.FormalParameter("X", "T"),
            defs.OpSchema.FormalParameter("W", "T"),
        ],
        outputs=[defs.OpSchema.FormalParameter("Y", "T")],
        type_constraints=[("T", ["tensor(bfloat16)"], "")],
    ),
)

onnx_gemm_blocked = Op(
    onnx_custom_domain,
    "GemmBlocked",
    defs.OpSchema(
        "GemmBlocked",
        onnx_custom_domain.domain,
        onnx_custom_domain.version,
        inputs=[
            defs.OpSchema.FormalParameter("X", "T"),
            defs.OpSchema.FormalParameter("W", "T"),
        ],
        outputs=[defs.OpSchema.FormalParameter("Y", "T")],
        type_constraints=[("T", ["tensor(bfloat16)"], "")],
    ),
)

TRANSLATION_TABLE = {
    torch.ops.custom.swiglu_fused_front.default: onnx_swiglu_front_fused,
    torch.ops.custom.gemm_blocked.default: onnx_gemm_blocked,
}


def main():
    onnx_program = torch.onnx.export(
        SwiGLUFrontFused(256, 512).eval(),
        (torch.randn(4, 256, dtype=torch.bfloat16),),
        dynamo=True,
        custom_translation_table=TRANSLATION_TABLE,
    )

    onnx_program.save("model.onnx")


if __name__ == "__main__":
    main()
