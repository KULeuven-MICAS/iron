# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""stream-dse design for one head's prefill attention core.

The workload and the mapping are both generated from
:mod:`iron.operators.mha_prefill_stream.reference`, so the design, the golden output and
the runtime arguments all carry the same names; ``README.md`` has the rest.

Only the query dimension splits across cores, and not over rows and columns at once:
split per layer (``k=3``) each layer has a column and splits the query over its rows;
fused (``k=1``) the layers take a row each and the query splits over the columns.

:class:`DesignConfig` holds what a sweep varies, one value per operator rather than
one per process. ``IRON_FUSED_COLUMNS``, ``IRON_FUSED_ROWS``, ``IRON_FUSED_KERNEL`` and
``IRON_FLASH_QUERY`` are its defaults; unset, each gives the shipped design.
"""

import os
from dataclasses import dataclass, replace
from functools import lru_cache
from pathlib import Path

import torch

from iron.common.stream.design import (
    design_paths,
    digest,
    group_text,
    region_module,
)
from iron.common.stream.hardware import array
from iron.common.stream.mapping import (
    FusedGroup,
    Placement,
    emit_mapping,
    group_boundaries,
)
from iron.common.stream.runner import design_dir, experiment_id, run_codegen
from iron.common.stream.workload import export_workload
from iron.operators.mha_prefill_stream.reference import (
    CONTEXT_NODE,
    FUSED_NODE_NAMES,
    FUSED_RESULT_NAMES,
    NODE_NAMES,
    RESULT_NAMES,
    SCORE_SOFTMAX_NODE,
    SCORES_NODE,
    SOFTMAX_NODE,
    attention_core_module,
)


# Key positions the score GEMM produces at a time. The softmax reduces the key
# dimension and reads whole rows; a GEMM in a group of its own may block it, but one
# fused with the softmax may not.
_KEY_BLOCK = 64

# The one block mha.cc's flash kernels are written for: key and head both 64, since
# matmul_PV reuses the score GEMM's compiled dimensions. The query is not tied to it,
# which is what makes DesignConfig.flash_query a knob at all.
FLASH_BLOCK = 64


def key_tile(seq_len, k, flash=False):
    if flash:
        return FLASH_BLOCK
    return seq_len if k == 1 else _KEY_BLOCK


LAYER_BY_LAYER = 3

CORE_BYTES = 64 * 1024
BYTES_PER_ELEMENT = 2


@dataclass(frozen=True)
class DesignConfig:
    """How a fused (``k=1``) design spreads over the array.

    Experimental: these are sweep hooks rather than operator API, and only the fused
    designs read them -- split per layer, each layer has a column of its own and none of
    this applies. Carried per operator, so two of them may hold different designs at
    once; :meth:`from_environment` is what every entry point falls back to, so a sweep
    that sets the environment and passes nothing still gets the design it asks for.
    """

    # Query positions one flash step covers. The query is not tied to the kernels' block
    # -- it only sets DIM_M, which they take as any multiple of 16 -- and enlarging it
    # divides the number of query steps, and with it how often K and V are streamed again.
    flash_query: int = FLASH_BLOCK
    # The score GEMM and the online softmax as one kernel on one core.
    fused_kernel: bool = False

    @classmethod
    def from_environment(cls) -> "DesignConfig":
        """The defaults, each overridden by the environment variable that names it."""
        return cls(
            flash_query=int(os.environ.get("IRON_FLASH_QUERY", FLASH_BLOCK)),
            fused_kernel=os.environ.get("IRON_FUSED_KERNEL", "0") == "1",
        )


def score_layers(cfg: DesignConfig | None = None) -> list:
    """The layers the score side is, which fusing it into one kernel collapses to one."""
    cfg = cfg or DesignConfig.from_environment()
    return [SCORE_SOFTMAX_NODE] if cfg.fused_kernel else [SCORES_NODE, SOFTMAX_NODE]


def group_layers(k, cfg: DesignConfig | None = None) -> list:
    """The layers of each of the ``k`` fused groups, in the order the groups run."""
    return {
        1: [[*score_layers(cfg), CONTEXT_NODE]],
        LAYER_BY_LAYER: [[SCORES_NODE], [SOFTMAX_NODE], [CONTEXT_NODE]],
    }[k]


# Query positions a fused GEMM works at a time. The head's whole key or value sits on the
# core beside them -- 32 KB of a 64 KB core at seq_len 256 -- so the tile is what is left.
FUSED_QUERY_TILE = 16


def query_per_core(seq_len, k, flash=False, cfg=None):
    """Query positions one core holds when a layer has a column to itself."""
    return seq_len // array().num_rows


def query_tile(seq_len, k, flash=False, cfg=None):
    """Query positions one core works at a time. Split off, a core takes its whole slice
    at once: a second temporal loop beside the key one would put two variables in a reuse
    window, which the object-fifo lowering does not express. Fused, the key and the value
    are resident beside the tile, so the query is what iterates instead. Blocked, the
    kernels fix the block and both the query and the key iterate."""
    cfg = cfg or DesignConfig.from_environment()
    if flash:
        return cfg.flash_query
    return FUSED_QUERY_TILE if k == 1 else query_per_core(seq_len, k, cfg=cfg)


def _softmax_rows(seq_len, k, flash=False, cfg=None):
    """Query rows one softmax call normalizes. Fused, the group's layers share one query
    tile and the kernel loops the rows of it; split off, the tile is a single row."""
    return query_tile(seq_len, k, flash, cfg) if k == 1 else 1


def _scores_tile(seq_len, d_head, k, flash=False, cfg=None):
    """The score GEMM's (m, k, n).

    Exactly one dimension may iterate, since a tensor gets one reuse variable. Fused, the
    softmax behind it reduces a whole row, so the key has to come out whole and the query
    is what streams. Split off, stream the key while it spans more than a block, otherwise
    the contraction: streaming the query instead is expressible and builds, but the second
    block onwards comes back wrong.
    """
    cfg = cfg or DesignConfig.from_environment()
    if flash:
        return cfg.flash_query, d_head, FLASH_BLOCK
    query, key = query_tile(seq_len, k, cfg=cfg), seq_len
    if k == 1:
        return query, d_head, seq_len
    if key > _KEY_BLOCK:
        return query, d_head, _KEY_BLOCK
    return query, d_head // 2, key


def kernel_tiles(seq_len, d_head, k, flash=False, cfg=None):
    """Each GEMM layer's kernel tile, in the (m, k, n) order the kernel takes. The
    kernel tile and the intra-core tile are the same tile, so they are declared once."""
    cfg = cfg or DesignConfig.from_environment()
    return {
        score_layers(cfg)[0]: _scores_tile(seq_len, d_head, k, flash, cfg),
        CONTEXT_NODE: (
            query_tile(seq_len, k, flash, cfg),
            key_tile(seq_len, k, flash),
            d_head,
        ),
    }


# Per-stage cost calibration, from a traced run at seq 2048 on the 0|13|2 design.
#
# The estimator prices a node by its MAC count, which is wrong for this graph in two
# separate ways, so utilisation is the dial that corrects both. A softmax does 64x fewer
# MACs than the GEMM beside it and measures several times more expensive: it is
# transcendentals and cross-lane reductions, not multiply-accumulates. And the two GEMMs
# are not the same GEMM -- the value accumulation carries the online rescale on top of the
# matmul and measures 3.4x the score GEMM, though their loop nests are identical.
#
# Calibrated so modelled/measured is one constant across all three stages, anchored on the
# score GEMM at its original 61.8, and against TOTAL busy cycles per core over a run rather
# than cost per step. The estimator already divides by the inter-core tiling, so a per-step
# ratio double-counts it: the softmax runs on twice the cores and therefore half the steps.
# Left uncalibrated the model ranks designs by a cost structure the hardware does not have.
# See aie_kernels/aie2p/fast/README.md.
SCORES_UTILIZATION = 61.8
CONTEXT_UTILIZATION = 18.03
SOFTMAX_UTILIZATION = (
    0.1218 if os.environ.get("IRON_SOFTMAX_REFERENCE", "0") == "1" else 0.2184
)


def _placements(seq_len, d_head, k, causal, flash=False, cfg=None):
    """Where each layer runs.

    Fused, the three layers run at once and take a row each of the same columns, splitting
    the query over those columns. Split off, each layer has the column to itself and splits
    the query over the column's rows, a GEMM its output dimension over the columns too.
    """
    cfg = cfg or DesignConfig.from_environment()
    tiles = kernel_tiles(seq_len, d_head, k, flash, cfg)

    gemm = lambda m, contraction, n: dict(  # noqa: E731
        m=m,
        k=contraction,
        n=n,
        utilization=SCORES_UTILIZATION,
        layout="default",
        bfp16_mmul=True,
    )
    # A row at a time, over the MAC tile bounds of the GEMMs either side of it.
    softmax = dict(
        m=_softmax_rows(seq_len, k, flash, cfg),
        n=FLASH_BLOCK if flash else seq_len,
        utilization=SOFTMAX_UTILIZATION,
        layout="contiguous",
        bfp16_mmul=True,
    )
    if causal and not flash:
        # Masking is the softmax's own business here: the whole key row is resident, so a
        # query attends a suffix of it and the kernel drops that suffix before it reduces.
        softmax["causal"] = True
    if k == 1:
        if cfg.fused_kernel:
            # The mask lives inside the fused kernel, the way it already does inside the
            # softmax, so the score side asks for no causal entry point of its own.
            kwargs = {
                SCORE_SOFTMAX_NODE: gemm(*tiles[SCORE_SOFTMAX_NODE]),
                CONTEXT_NODE: gemm(*tiles[CONTEXT_NODE])
                | {"flash": True, "utilization": CONTEXT_UTILIZATION},
            }
        else:
            kwargs = {
                SCORES_NODE: gemm(*tiles[SCORES_NODE])
                | ({"causal": True} if flash else {}),
                SOFTMAX_NODE: softmax,
                CONTEXT_NODE: gemm(*tiles[CONTEXT_NODE])
                | (
                    {"flash": True, "utilization": CONTEXT_UTILIZATION} if flash else {}
                ),
            }
        return {layer: Placement((), kernel_kwargs=kw) for layer, kw in kwargs.items()}
    return {
        SCORES_NODE: Placement((), kernel_kwargs=gemm(*tiles[SCORES_NODE])),
        SOFTMAX_NODE: Placement((), kernel_kwargs=softmax),
        CONTEXT_NODE: Placement((), kernel_kwargs=gemm(*tiles[CONTEXT_NODE])),
    }


def _groups(seq_len, d_head, k, flash=False, cfg=None):
    """The fused groups. Their tiling is the kernels' granules, derived by stream --
    innermost first, the carried key leading under flash."""
    return [
        FusedGroup(f"Fused_Group_{index + 1}", layers)
        for index, layers in enumerate(group_layers(k, cfg))
    ]


def _check_shapes(seq_len, d_head, k, flash=False, cfg=None):
    cfg = cfg or DesignConfig.from_environment()
    if flash:
        if k != 1:
            raise ValueError("flash attention is generated as one fused group, so k=1")
        if d_head != FLASH_BLOCK:
            raise ValueError(
                f"mha.cc's flash kernels reuse the score GEMM's compiled block, which "
                f"holds only when d_head is {FLASH_BLOCK}, not {d_head}"
            )
        if cfg.flash_query % 16 or cfg.flash_query < 16:
            raise ValueError(
                f"the query block is the GEMM's DIM_M and must be a multiple of 16, "
                f"not {cfg.flash_query}"
            )
        resident = (
            BYTES_PER_ELEMENT
            * 2
            * (
                cfg.flash_query * d_head
                + FLASH_BLOCK * d_head
                + cfg.flash_query * FLASH_BLOCK
            )
        )
        if resident > CORE_BYTES:
            raise ValueError(
                f"a flash score core needs {resident} bytes for a {cfg.flash_query} "
                f"query block, over the {CORE_BYTES} byte core"
            )
        if seq_len % cfg.flash_query:
            # A query block shorter than the kernel's would read a scale row the
            # per-block reset does not clear.
            raise ValueError(
                f"seq_len {seq_len} must be a multiple of the {cfg.flash_query} query block"
            )
        return
    for name, extent, split in (
        ("query", seq_len, array().num_rows),
        ("head", d_head, 1),
    ):
        if extent % split or (extent // split) % 16:
            # A GEMM tile must be a multiple of its MAC dimensions.
            raise ValueError(
                f"{name} {extent} split {split} ways is not a multiple of 16 per core"
            )
    if seq_len % 64:
        # The softmax kernel drops whatever does not fill its 64-element vector.
        raise ValueError(f"seq_len {seq_len} must be a multiple of 64")
    if seq_len % _KEY_BLOCK:
        raise ValueError(f"seq_len {seq_len} must be a multiple of {_KEY_BLOCK}")
    if k == 1:
        # The fused score core holds the head's whole key beside its own double-buffered
        # query and score tiles.
        query = FUSED_QUERY_TILE
        resident = BYTES_PER_ELEMENT * (
            d_head * seq_len + 2 * query * d_head + 2 * query * seq_len
        )
        if resident > CORE_BYTES:
            raise ValueError(
                f"the fused score core needs {resident} bytes, over the {CORE_BYTES} "
                f"byte core; block the key dimension to go further"
            )
    if d_head % 16:
        raise ValueError(f"d_head {d_head} must be a multiple of 16")


@lru_cache(maxsize=None)
def workload_for(seq_len, d_head, flash=False, fused=False):
    """The exported workload for one problem size.

    ``fused`` is resolved by the caller rather than read off a config here, so that what
    the cache is keyed on is everything the exported graph depends on.
    """
    zeros = lambda *shape: torch.zeros(shape, dtype=torch.bfloat16)  # noqa: E731
    return export_workload(
        attention_core_module(flash=flash, fused=fused),
        (zeros(seq_len, d_head), zeros(d_head, seq_len), zeros(seq_len, d_head)),
        node_names=FUSED_NODE_NAMES if fused else NODE_NAMES,
        result_names=FUSED_RESULT_NAMES if fused else RESULT_NAMES,
    )


def build_inputs(
    seq_len, d_head, output_dir, k=LAYER_BY_LAYER, causal=False, flash=False, cfg=None
):
    """Write the workload and mapping for one configuration; return their paths."""
    cfg = cfg or DesignConfig.from_environment()
    _check_shapes(seq_len, d_head, k, flash, cfg)
    workload = workload_for(seq_len, d_head, flash, flash and cfg.fused_kernel)
    output_dir = Path(output_dir)
    return (
        workload.write(output_dir / "workload.onnx"),
        emit_mapping(
            workload,
            _placements(seq_len, d_head, k, causal, flash, cfg),
            _groups(seq_len, d_head, k, flash, cfg),
            array(),
            output_dir / "mapping.yaml",
        ),
    )


def _experiment_id(seq_len, d_head, k, causal, flash, cfg=None):
    cfg = cfg or DesignConfig.from_environment()
    suffix = f"_k{k}" if k != LAYER_BY_LAYER else ""
    if k == 1:
        if flash and cfg.flash_query != FLASH_BLOCK:
            suffix += f"_q{cfg.flash_query}"
        # Fusing the score side is a different graph, not just a different placement.
        if cfg.fused_kernel:
            suffix += "_fused"
    if flash:
        suffix += "_flash"
    elif causal:
        suffix += "_causal"
    return experiment_id("mha", f"{seq_len}_{d_head}", suffix)


def _run_codegen(seq_len, d_head, npu, k, causal, flash, cfg=None):
    """Run stream-dse's constraint optimization and code generation once."""
    eid = _experiment_id(seq_len, d_head, k, causal, flash, cfg)
    workload_path, mapping_path = build_inputs(
        seq_len, d_head, design_dir(eid), k=k, causal=causal, flash=flash, cfg=cfg
    )
    run_codegen(eid, workload_path, mapping_path, npu)


def _design_paths(seq_len, d_head, k, causal=False, flash=False, cfg=None):
    cfg = cfg or DesignConfig.from_environment()
    return design_paths(
        design_dir(_experiment_id(seq_len, d_head, k, causal, flash, cfg)),
        len(group_layers(k, cfg)),
    )


def _group_text(
    group_index, *, k, seq_len, d_head, npu, causal, flash, cfg=None
) -> str:
    return group_text(
        group_index,
        _design_paths(seq_len, d_head, k, causal, flash, cfg),
        lambda: _run_codegen(seq_len, d_head, npu, k, causal, flash, cfg),
    )


def group_ports(seq_len, d_head, k=LAYER_BY_LAYER, fused=False, cfg=None):
    """Per fused group, the tensor names it takes in and hands on.

    Fusing the score side is a different graph with different node names, so its
    boundaries are read off that graph; every other design reads off the plain one,
    whose three nodes the flash graph shares.
    """
    return group_boundaries(
        workload_for(seq_len, d_head, fused, fused), group_layers(k, cfg)
    )


def group_digest(group_index, **dims) -> str:
    """Digest of a group's design, for recognising groups that share one."""
    return digest(_group_text(group_index, **dims))


def load_group(group_index, func_prefix="", **dims):
    """Generate the ``k``-group design once and return one group's aie module."""
    return region_module(_group_text(group_index, **dims), func_prefix)
