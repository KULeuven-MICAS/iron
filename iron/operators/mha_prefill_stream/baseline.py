# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""The same attention core built from IRON's own operators, for comparison.

Three dispatches over the same buffers as
:class:`~iron.operators.mha_prefill_stream.op.MHAPrefillStream`, so the two differ only
in who generated the designs. Core counts are given per layer and default to what the
stream-backed operator uses, so a comparison is at matched cores unless asked otherwise.
"""

from iron.common.sequence import OperatorSequence
from iron.operators.gemm.op import GEMM
from iron.operators.mha_prefill_stream.reference import (
    KEY_TRANSPOSED,
    PROBABILITIES,
    QUERY,
    SCORES,
    VALUE,
)
from iron.operators.softmax.op import Softmax

# The exported workload names the graph output, so the stream operator carries this
# name and the two sequences share one set of buffers.
OUTPUT = "output"

BYTES_PER_ELEMENT = 2

# Cores per layer, as (GEMM columns, softmax columns, softmax channels). A GEMM takes
# four cores per column; the softmax takes columns x channels.
MATCHED_CORES = (1, 2, 2)


class MHAPrefillBaseline(OperatorSequence):
    """``softmax(q @ k_t) @ v`` for one head from IRON's GEMM and Softmax operators."""

    def __init__(
        self,
        seq_len,
        d_head,
        heads=1,
        cores=MATCHED_CORES,
        context=None,
        share_designs=True,
    ):
        gemm_columns, softmax_columns, softmax_channels = cores
        # A GEMM spreads its N dimension over its columns, so the tile has to shrink with
        # them; it must stay a multiple of the kernel's MAC width.
        gemm = lambda m, k, n: GEMM(  # noqa: E731
            M=m,
            K=k,
            N=n,
            tile_n=max(min(64, n // gemm_columns), 16),
            num_aie_columns=gemm_columns,
            context=context,
        )
        scores = gemm(seq_len, d_head, seq_len)
        softmax = Softmax(
            rows=seq_len,
            cols=seq_len,
            num_aie_columns=softmax_columns,
            num_channels=softmax_channels,
            context=context,
        )
        out = gemm(seq_len, seq_len, d_head)
        head_bytes = seq_len * d_head * BYTES_PER_ELEMENT
        per_head = (QUERY, KEY_TRANSPOSED, VALUE, OUTPUT)
        runlist = []
        for head in range(heads):
            window = f"[{head * head_bytes}:{(head + 1) * head_bytes}]"
            slot = {name: name + window for name in per_head}
            runlist += [
                (scores, slot[QUERY], slot[KEY_TRANSPOSED], SCORES),
                (softmax, SCORES, PROBABILITIES),
                (out, PROBABILITIES, slot[VALUE], slot[OUTPUT]),
            ]
        super().__init__(
            name=f"mha_prefill_baseline_h{heads}_s{seq_len}_d{d_head}",
            runlist=runlist,
            input_args=[QUERY, KEY_TRANSPOSED, VALUE],
            output_args=[OUTPUT],
            buffer_sizes={name: heads * head_bytes for name in per_head},
            share_designs=share_designs,
            context=context,
        )
