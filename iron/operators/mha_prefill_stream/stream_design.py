# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""stream-dse design for one head's prefill attention core.

The workload and the mapping are both generated from
:mod:`iron.operators.mha_prefill_stream.reference`, so the design, the golden output
and the runtime arguments all carry the same names.

Only the query dimension is splittable across cores: the head dimension is the score
GEMM's contraction and nothing accumulates partial sums between cores, and the key
dimension is the softmax's reduction. A single dimension cannot be split over rows and
over columns at once, which is what sets the two shapes the design comes in: split into
one group per layer (``k=3``) each layer has a column to itself and splits the query over
its rows; fused into one group (``k=1``) the three layers take a row each and the query
splits over the columns instead.
"""

import os
from functools import lru_cache
from pathlib import Path

import torch

from stream.api import optimize_allocation_co

from iron.common.stream.design import (
    design_paths,
    digest,
    group_text,
    region_module,
    stream_revision,
    trace_size,
    trace_tile_list,
    trace_tiles,
)
from iron.common.stream.hardware import ComputeArray
from iron.common.stream.mapping import (
    FusedGroup,
    Placement,
    emit_mapping,
    group_boundaries,
)
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

ACCELERATOR = os.path.join(
    os.path.dirname(__import__("stream").__file__),
    "inputs",
    "aie",
    "hardware",
    "whole_array_strix.yaml",
)
BACKEND = os.environ.get(
    "STREAM_BACKEND", "ortools_gscip"
)  # license-free OR-Tools GSCIP by default
OUTPUT_ROOT = "outputs"

# Columns a GEMM layer spans, splitting its output dimension over them on top of the
# query dimension over a column's rows. Kept at one: a distribute or a join costs one
# object fifo per core, so widening adds DMA channels about as fast as it adds compute.
# The hand-written operators behave the same way in this flow, and are also fastest at
# one column.
GEMM_COLUMNS = 1


# The context GEMM writes d_head across its columns and its kernel takes at least a
# 16-wide tile, so it cannot spread as far as the score GEMM, which writes the key.
def _context_columns(d_head):
    return min(GEMM_COLUMNS, max(d_head // 16, 1))


SOFTMAX_COLUMN = 0
# Memory tiles the solver may route through. The fused design spreads its shim traffic
# over every column, which is what keeps eight heads inside a shim's buffer descriptors.
COLUMNS_IN_USE = 8

# Key positions the score GEMM produces at a time. The softmax reduces the key
# dimension and reads whole rows; a GEMM in a group of its own may block it, but one
# fused with the softmax may not.
_KEY_BLOCK = 64

# The one block mha.cc's flash kernels are written for: key and head both 64, since
# matmul_PV reuses the score GEMM's compiled dimensions. The query is not tied to it --
# it only sets DIM_M, which the kernels take as any multiple of 16 -- and enlarging it
# divides the number of query steps, and with it how often K and V are streamed again.
FLASH_BLOCK = 64
FLASH_QUERY = int(os.environ.get("IRON_FLASH_QUERY", FLASH_BLOCK))


def key_tile(seq_len, k, flash=False):
    if flash:
        return FLASH_BLOCK
    return seq_len if k == 1 else _KEY_BLOCK


# The score GEMM and the online softmax as one kernel on one core. Three fused layers
# take a row each and leave the array's fourth idle; two take two rows each and cover it,
# and the score block stops making a round trip through the memory tile between them.
FUSED_KERNEL = os.environ.get("IRON_FUSED_KERNEL", "0") == "1"

SCORE_LAYERS = [SCORE_SOFTMAX_NODE] if FUSED_KERNEL else [SCORES_NODE, SOFTMAX_NODE]

LAYER_BY_LAYER = 3
GROUP_LAYERS = {
    1: [[*SCORE_LAYERS, CONTEXT_NODE]],
    LAYER_BY_LAYER: [[SCORES_NODE], [SOFTMAX_NODE], [CONTEXT_NODE]],
}

# A memory tile holds the head's whole key and value, since neither the key nor the
# head dimension can be tiled away. Measured against the 256 KB Strix memory tile.
MEMTILE_BYTES = 256 * 1024
CORE_BYTES = 64 * 1024
BYTES_PER_ELEMENT = 2

# Which of a column's cores the softmax runs on, by index.
SOFTMAX_CORES = (0, 1, 2, 3)

# The fused design runs its three layers at once, so each takes one row of every column
# it spans and the query dimension splits over the columns instead of over the rows.
# Overridable so a sweep can compare column counts; four is the design's own default.
FUSED_COLUMNS = int(os.environ.get("IRON_FUSED_COLUMNS", "4"))
# Which rows of a column each fused layer sits on. Three rows leaves the array's fourth
# idle, so a layer may be given two of them; IRON_FUSED_ROWS is "<scores>|<softmax>|
# <context>" with each field the row indices, e.g. "03|1|2" to widen the score GEMM.
# Fused, the two layers pair up the array's four rows. The pairing is not free: the
# running scale crosses between a step's two halves through the memory the tiles already
# share, so each core needs its partner directly above or below it and no other. Rows
# 1 and 2 against 0 and 3 is the one split of four rows where that holds both ways.
# The softmax costs several times what the stages either side of it do, measured, so given
# enough query blocks to fill them it takes two of the four rows and they take one each.
_WIDE_SOFTMAX_ROWS = "0|13|2"


def _default_rows(seq_len: int, flash: bool) -> str:
    if FUSED_KERNEL:
        return "12|03"
    if flash and not seq_len % (FLASH_QUERY * FUSED_COLUMNS * 2):
        return _WIDE_SOFTMAX_ROWS
    return "0|1|2"


def fused_rows(seq_len: int = 0, flash: bool = False) -> dict:
    """Which rows of a column each fused layer sits on."""
    spec = os.environ.get("IRON_FUSED_ROWS", _default_rows(seq_len, flash))
    return dict(
        zip(
            [*SCORE_LAYERS, CONTEXT_NODE],
            (tuple(int(c) for c in field) for field in spec.split("|")),
        )
    )


# Query positions a fused GEMM works at a time. The head's whole key or value sits on the
# core beside them -- 32 KB of a 64 KB core at seq_len 256 -- so the tile is what is left.
FUSED_QUERY_TILE = 16


@lru_cache(maxsize=None)
def array() -> ComputeArray:
    """The compute grid of the device being built for."""
    import aie.utils as aie_utils

    return ComputeArray.from_device(aie_utils.get_current_device())


def query_split(k, seq_len=0, flash=False):
    """How many cores the query dimension splits over: a column's rows while each layer
    has the column to itself, the columns once the three layers take a row each."""
    if k != 1:
        return array().num_rows
    return FUSED_COLUMNS * max(
        len(rows) for rows in fused_rows(seq_len, flash).values()
    )


def query_per_core(seq_len, k, flash=False):
    return seq_len // query_split(k, seq_len, flash)


def query_tile(seq_len, k, flash=False):
    """Query positions one core works at a time. Split off, a core takes its whole slice
    at once: a second temporal loop beside the key one would put two variables in a reuse
    window, which the object-fifo lowering does not express. Fused, the key and the value
    are resident beside the tile, so the query is what iterates instead. Blocked, the
    kernels fix the block and both the query and the key iterate."""
    if flash:
        return FLASH_QUERY
    return FUSED_QUERY_TILE if k == 1 else query_per_core(seq_len, k)


def _softmax_rows(seq_len, k, flash=False):
    """Query rows one softmax call normalizes. Fused, the group's layers share one query
    tile and the kernel loops the rows of it; split off, the tile is a single row."""
    return query_tile(seq_len, k, flash) if k == 1 else 1


def _scores_tile(seq_len, d_head, k, flash=False):
    """The score GEMM's (m, k, n).

    Exactly one dimension may iterate, since a tensor gets one reuse variable. Fused, the
    softmax behind it reduces a whole row, so the key has to come out whole and the query
    is what streams. Split off, stream the key while it spans more than a block, otherwise
    the contraction: streaming the query instead is expressible and builds, but the second
    block onwards comes back wrong.
    """
    if flash:
        return FLASH_QUERY, d_head, FLASH_BLOCK
    query, key = query_tile(seq_len, k), seq_len // GEMM_COLUMNS
    if k == 1:
        return query, d_head, seq_len
    if key > _KEY_BLOCK:
        return query, d_head, _KEY_BLOCK
    return query, d_head // 2, key


def kernel_tiles(seq_len, d_head, k, flash=False):
    """Each GEMM layer's kernel tile, in the (m, k, n) order the kernel takes. The
    kernel tile and the intra-core tile are the same tile, so they are declared once."""
    return {
        SCORE_LAYERS[0]: _scores_tile(seq_len, d_head, k, flash),
        CONTEXT_NODE: (
            query_tile(seq_len, k, flash),
            key_tile(seq_len, k, flash),
            d_head // _context_columns(d_head),
        ),
    }


def _placements(seq_len, d_head, k, causal, flash=False):
    """Where each layer runs.

    Fused, the three layers run at once and take a row each of the same columns, splitting
    the query over those columns. Split off, each layer has the column to itself: a GEMM
    then splits the query over the column's rows and its output dimension over the columns,
    and the softmax splits only the query, its other dimension being the reduction it may
    not divide.
    """
    grid = array()
    tiles = kernel_tiles(seq_len, d_head, k, flash)

    def split(cols):
        """Rows always, columns only when there is more than one to split over."""
        return (("D0", grid.num_rows),) + ((("D2", cols),) if cols > 1 else ())

    gemm = lambda m, contraction, n: dict(  # noqa: E731
        m=m, k=contraction, n=n, utilization=61.8, layout="default", bfp16_mmul=True
    )
    # A row at a time, over the MAC tile bounds of the GEMMs either side of it.
    softmax = dict(
        m=_softmax_rows(seq_len, k, flash),
        n=FLASH_BLOCK if flash else seq_len,
        utilization=50.0,
        layout="contiguous",
        bfp16_mmul=True,
    )
    if causal and not flash:
        # Masking is the softmax's own business here: the whole key row is resident, so a
        # query attends a suffix of it and the kernel drops that suffix before it reduces.
        softmax["causal"] = True
    if k == 1:
        rows = fused_rows(seq_len, flash)
        columns = grid.all_columns[:FUSED_COLUMNS]
        if FUSED_KERNEL:
            # The mask lives inside the fused kernel, the way it already does inside the
            # softmax, so the score side asks for no causal entry point of its own.
            kwargs = {
                SCORE_SOFTMAX_NODE: gemm(*tiles[SCORE_SOFTMAX_NODE]),
                CONTEXT_NODE: gemm(*tiles[CONTEXT_NODE]) | {"flash": True},
            }
        else:
            # Wider than the layer it feeds, the softmax hands its block straight to those
            # cores: no memory tile in that handover to re-lay it out, so the kernel leaves
            # it in the tiling the accumulation reads.
            handing_over = len(rows[SOFTMAX_NODE]) > len(rows[CONTEXT_NODE])
            kwargs = {
                SCORES_NODE: gemm(*tiles[SCORES_NODE])
                | ({"causal": True} if flash else {}),
                SOFTMAX_NODE: softmax | ({"tiled_out": True} if handing_over else {}),
                CONTEXT_NODE: gemm(*tiles[CONTEXT_NODE])
                | ({"flash": True} if flash else {}),
            }
        return {
            layer: Placement(
                columns,
                (("D0", FUSED_COLUMNS * len(rows[layer])),),
                kw,
                rows=rows[layer],
                # These layers hand to one another core to core, so a layer on several rows
                # has to keep its cores in the column of the core it hands to.
                by_row=True,
            )
            for layer, kw in kwargs.items()
        }
    return {
        SCORES_NODE: Placement(
            grid.all_columns[:GEMM_COLUMNS],
            split(GEMM_COLUMNS),
            gemm(*tiles[SCORES_NODE]),
        ),
        SOFTMAX_NODE: Placement(
            (SOFTMAX_COLUMN,),
            (("D0", len(SOFTMAX_CORES)),),
            softmax,
            rows=SOFTMAX_CORES,
        ),
        CONTEXT_NODE: Placement(
            grid.all_columns[: _context_columns(d_head)],
            split(_context_columns(d_head)),
            gemm(*tiles[CONTEXT_NODE]),
        ),
    }


def _layer_tiling(layer, seq_len, d_head, k, flash=False):
    """Each of the layer's dimensions, as (dim, tile, the extent one core holds)."""
    query = query_per_core(seq_len, k, flash)
    if layer in (SCORES_NODE, SCORE_SOFTMAX_NODE):
        rows, contraction, key = _scores_tile(seq_len, d_head, k, flash)
        return [
            ("D0", rows, query),
            ("D1", contraction, d_head),
            ("D2", key, seq_len // GEMM_COLUMNS),
        ]
    if layer == SOFTMAX_NODE:
        return [
            ("D0", _softmax_rows(seq_len, k, flash), query),
            ("D1", FLASH_BLOCK if flash else seq_len, seq_len),
        ]
    head = d_head // _context_columns(d_head)
    return [
        ("D0", query_tile(seq_len, k, flash), query),
        ("D1", key_tile(seq_len, k, flash), seq_len),
        ("D2", head, head),
    ]


def _nesting(dims, flash):
    """The dimensions in the order the group declares them, which is innermost first.

    Blocked, the key has to be the inner loop: one running scale and one context block
    belong to one query block, so that query block has to finish before the next starts.
    """
    return dims[::-1] if flash else dims


def _groups(seq_len, d_head, k, flash=False):
    """The fused groups, each tiling only the dimensions it actually iterates.

    A dimension a core already holds whole is left out: the loop would run once and
    still cost a reuse variable, and a tensor gets one.
    """
    return [
        FusedGroup(
            f"Fused_Group_{index + 1}",
            layers,
            [
                (layer, dim, tile)
                for layer in layers
                for dim, tile, extent in _nesting(
                    _layer_tiling(layer, seq_len, d_head, k, flash), flash
                )
                if tile < extent
            ],
        )
        for index, layers in enumerate(GROUP_LAYERS[k])
    ]


def _check_shapes(seq_len, d_head, k, flash=False):
    if flash:
        if k != 1:
            raise ValueError("flash attention is generated as one fused group, so k=1")
        if d_head != FLASH_BLOCK:
            raise ValueError(
                f"mha.cc's flash kernels reuse the score GEMM's compiled block, which "
                f"holds only when d_head is {FLASH_BLOCK}, not {d_head}"
            )
        if FLASH_QUERY % 16 or FLASH_QUERY < FLASH_BLOCK:
            raise ValueError(
                f"the query block is the GEMM's DIM_M and must be a multiple of 16 no "
                f"smaller than the key block, not {FLASH_QUERY}"
            )
        resident = (
            BYTES_PER_ELEMENT
            * 2
            * (FLASH_QUERY * d_head + FLASH_BLOCK * d_head + FLASH_QUERY * FLASH_BLOCK)
        )
        if resident > CORE_BYTES:
            raise ValueError(
                f"a flash score core needs {resident} bytes for a {FLASH_QUERY} query "
                f"block, over the {CORE_BYTES} byte core"
            )
        if seq_len % (FLASH_QUERY * FUSED_COLUMNS):
            # A query block shorter than the kernel's would read a scale row the
            # per-block reset does not clear.
            raise ValueError(
                f"seq_len {seq_len} must be a multiple of {FLASH_QUERY * FUSED_COLUMNS}: "
                f"the query splits over {FUSED_COLUMNS} columns in whole blocks of "
                f"{FLASH_QUERY}"
            )
        return
    for name, extent, split in (
        ("query", seq_len, query_split(k)),
        ("key", seq_len, GEMM_COLUMNS),
        ("head", d_head, _context_columns(d_head)),
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
        # query and score tiles, and a memory tile no longer bounds it.
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
    resident = 2 * seq_len * d_head * BYTES_PER_ELEMENT
    if resident > MEMTILE_BYTES:
        raise ValueError(
            f"key and value need {resident} bytes resident, over the "
            f"{MEMTILE_BYTES} byte memory tile; block the key dimension to go further"
        )


@lru_cache(maxsize=None)
def workload_for(seq_len, d_head, flash=False):
    """The exported workload for one problem size."""
    zeros = lambda *shape: torch.zeros(shape, dtype=torch.bfloat16)  # noqa: E731
    fused = flash and FUSED_KERNEL
    return export_workload(
        attention_core_module(flash=flash, fused=fused),
        (zeros(seq_len, d_head), zeros(d_head, seq_len), zeros(seq_len, d_head)),
        node_names=FUSED_NODE_NAMES if fused else NODE_NAMES,
        result_names=FUSED_RESULT_NAMES if fused else RESULT_NAMES,
    )


def build_inputs(
    seq_len, d_head, output_dir, k=LAYER_BY_LAYER, causal=False, flash=False
):
    """Write the workload and mapping for one configuration; return their paths."""
    _check_shapes(seq_len, d_head, k, flash)
    workload = workload_for(seq_len, d_head, flash)
    output_dir = Path(output_dir)
    return (
        workload.write(output_dir / "workload.onnx"),
        emit_mapping(
            workload,
            _placements(seq_len, d_head, k, causal, flash),
            _groups(seq_len, d_head, k, flash),
            array(),
            output_dir / "mapping.yaml",
        ),
    )


def _experiment_id(seq_len, d_head, k, causal, flash):
    grid = array()
    hardware = os.path.splitext(os.path.basename(ACCELERATOR))[0]
    suffix = f"_k{k}" if k != LAYER_BY_LAYER else ""
    # The fused designs split the query over FUSED_COLUMNS and nothing else in the id
    # records it, so without this a sweep over it is served the first design generated.
    if k == 1:
        suffix += f"_c{FUSED_COLUMNS}"
        if flash and FLASH_QUERY != FLASH_BLOCK:
            suffix += f"_q{FLASH_QUERY}"
        spec = "".join(
            "|" + "".join(str(r) for r in rs)
            for rs in fused_rows(seq_len, flash).values()
        )
        suffix += "_r" + spec.lstrip("|").replace("|", "_")
        # Fusing the score side is a different graph, not just a different placement.
        if FUSED_KERNEL:
            suffix += "_fused"
    if flash:
        suffix += "_flash"
    elif causal:
        suffix += "_causal"
    if trace_size():
        suffix += "_traced"
        # Which tiles are traced changes the design, so it belongs in the id.
        for col, row in trace_tile_list():
            suffix += f"_{col}x{row}"
    return (
        f"{hardware}-mha{suffix}_{seq_len}_{d_head}"
        f"-{grid.num_rows}_row_{grid.num_columns}_col-{stream_revision()}"
    )


def _run_codegen(seq_len, d_head, npu, k, causal, flash):
    """Run stream-dse's constraint optimization and code generation once."""
    experiment_id = _experiment_id(seq_len, d_head, k, causal, flash)
    workload_path, mapping_path = build_inputs(
        seq_len,
        d_head,
        os.path.join(OUTPUT_ROOT, experiment_id),
        k=k,
        causal=causal,
        flash=flash,
    )
    optimize_allocation_co(
        hardware=ACCELERATOR,
        workload=workload_path,
        mapping=mapping_path,
        experiment_id=experiment_id,
        output_path=OUTPUT_ROOT,
        skip_if_exists=False,
        enable_codegen=True,
        trace_size=trace_size(),
        trace_max_tiles=trace_tiles(),
        trace_tiles=trace_tile_list(),
        # One head occupies one column, so a wider search only enlarges the
        # memory-tile path enumeration the solver has to walk.
        nb_cols_to_use=COLUMNS_IN_USE,
        npu=npu,
        backend=BACKEND,
    )


def _design_paths(seq_len, d_head, k, causal=False, flash=False):
    return design_paths(
        os.path.join(OUTPUT_ROOT, _experiment_id(seq_len, d_head, k, causal, flash)),
        len(GROUP_LAYERS[k]),
    )


def _group_text(group_index, *, k, seq_len, d_head, npu, causal, flash) -> str:
    return group_text(
        group_index,
        _design_paths(seq_len, d_head, k, causal, flash),
        lambda: _run_codegen(seq_len, d_head, npu, k, causal, flash),
    )


def group_ports(seq_len, d_head, k=LAYER_BY_LAYER, fused=False):
    """Per fused group, the tensor names it takes in and hands on.

    Fusing the score side is a different graph with different node names, so its
    boundaries are read off that graph; every other design reads off the plain one.
    """
    return group_boundaries(workload_for(seq_len, d_head, fused), GROUP_LAYERS[k])


def group_digest(group_index, **dims) -> str:
    """Digest of a group's design, for recognising groups that share one."""
    return digest(_group_text(group_index, **dims))


def load_group(group_index, func_prefix="", **dims):
    """Generate the ``k``-group design once and return one group's aie module."""
    return region_module(_group_text(group_index, **dims), func_prefix)
