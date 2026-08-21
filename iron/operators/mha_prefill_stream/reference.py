# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Reference attention core for one head: ``softmax(q @ k_t) @ v``.

Running this module produces the golden output; exporting it produces the workload
stream-dse generates the design from. The block is the part of prefill attention that
runs on the host today -- the projections around it stay on IRON's own GEMM.

Two things the caller does rather than the graph. ``k_t`` arrives transposed, because
an ONNX ``Transpose`` is a layout node that cuts the fusion group and the generated
design has no operand transform to undo it. And the ``1/sqrt(d_head)`` factor is
folded into ``q``, which is exact and saves an elementwise pass over the scores.

The names below are the block's vocabulary. Everything downstream is named from here:
the ONNX tensors, the mapping's layers and runtime arguments, and the runtime buffers.
"""

import math

import torch
from torch import nn

QUERY = "q"
KEY_TRANSPOSED = "k_t"
VALUE = "v"
SCORES = "scores"
PROBABILITIES = "probs"
CONTEXT = "context"

TENSOR_NAMES = (QUERY, KEY_TRANSPOSED, VALUE, SCORES, PROBABILITIES, CONTEXT)

# Node names in the exported graph, in topological order.
SCORES_NODE, SOFTMAX_NODE, CONTEXT_NODE = "Attn_Scores", "Attn_Softmax", "Attn_Context"
NODE_NAMES = [SCORES_NODE, SOFTMAX_NODE, CONTEXT_NODE]

RESULT_NAMES = {SCORES_NODE: SCORES, SOFTMAX_NODE: PROBABILITIES, CONTEXT_NODE: CONTEXT}


class AttentionCore(nn.Module):
    """One head's scores, softmax and context, over a pre-scaled ``q``."""

    def forward(self, q, k_t, v):
        return torch.softmax(q @ k_t, dim=-1) @ v


def attention_core_module() -> AttentionCore:
    """The module the design is exported from. It holds no parameters: every operand
    is an activation the sequence hands in."""
    return AttentionCore().eval()


def query_scale(d_head: int) -> float:
    """The factor folded into ``q`` in place of scaling the scores."""
    return 1.0 / math.sqrt(d_head)


def generate_golden_reference(seq_len, d_head, seed=42, dtype=torch.bfloat16):
    """Golden operands and output, with the query already scaled."""
    generator = torch.Generator().manual_seed(seed)
    q = torch.randn(seq_len, d_head, generator=generator).to(dtype)
    k = torch.randn(seq_len, d_head, generator=generator).to(dtype)
    v = torch.randn(seq_len, d_head, generator=generator).to(dtype)
    q = (q * query_scale(d_head)).to(dtype)
    k_t = k.transpose(0, 1).contiguous()
    return {
        QUERY: q,
        KEY_TRANSPOSED: k_t,
        VALUE: v,
        CONTEXT: attention_core_module()(q, k_t, v),
    }
