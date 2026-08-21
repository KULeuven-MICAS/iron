# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""stream-dse design for one head's prefill attention core.

The workload and the mapping are both generated from
:mod:`iron.operators.mha_prefill_stream.reference`, so the design, the golden output
and the runtime arguments all carry the same names.

Only the query dimension is splittable across cores: the head dimension is the score
GEMM's contraction and nothing accumulates partial sums between cores, and the key
dimension is the softmax's reduction. A single dimension cannot be split over rows and
over columns at once, so one head occupies one column.
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
    trace_size,
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
    NODE_NAMES,
    RESULT_NAMES,
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
BACKEND = "ortools_gscip"  # license-free OR-Tools GSCIP, no Gurobi needed
OUTPUT_ROOT = "outputs"

# Columns the design occupies, one per layer. Only the query dimension is splittable
# and a single dimension cannot be split over rows and columns at once, so a layer
# takes one column; the layers take different ones so they never share a shim tile.
COLUMNS_IN_USE = 3

# Key positions the score GEMM produces at a time. The softmax reduces the key
# dimension and reads whole rows; a GEMM in a group of its own may block it, but one
# fused with the softmax may not.
_KEY_BLOCK = 64


def key_tile(seq_len, k):
    return seq_len if k == 1 else _KEY_BLOCK


LAYER_BY_LAYER = 3
GROUP_LAYERS = {
    1: [[SCORES_NODE, SOFTMAX_NODE, CONTEXT_NODE]],
    LAYER_BY_LAYER: [[SCORES_NODE], [SOFTMAX_NODE], [CONTEXT_NODE]],
}

# A memory tile holds the head's whole key and value, since neither the key nor the
# head dimension can be tiled away. Measured against the 256 KB Strix memory tile.
MEMTILE_BYTES = 256 * 1024
BYTES_PER_ELEMENT = 2

# Rows the softmax runs on. Its input is distributed straight from the shim to each
# core, one DMA channel each, so its core count is bounded by the shim's channels
# rather than by the work.
SOFTMAX_ROWS = (2, 3)


@lru_cache(maxsize=None)
def array() -> ComputeArray:
    """The compute grid of the device being built for."""
    import aie.utils as aie_utils

    return ComputeArray.from_device(aie_utils.get_current_device())


def _cores(grid):
    """A column per layer, and how many cores one layer has."""
    return grid.allocate([1] * COLUMNS_IN_USE), grid.num_rows


def query_tile(seq_len, grid):
    """Query positions one core holds. A core takes its whole slice at once: a second
    temporal loop beside the key one would put two variables in a reuse window, which
    the object-fifo lowering does not express."""
    return seq_len // _cores(grid)[1]


def kernel_tiles(seq_len, d_head, k):
    """Each GEMM layer's kernel tile, in the (m, k, n) order the kernel takes. The
    kernel tile and the intra-core tile are the same tile, so they are declared once."""
    tile, key = query_tile(seq_len, array()), key_tile(seq_len, k)
    return {SCORES_NODE: (tile, d_head, key), CONTEXT_NODE: (tile, key, d_head)}


def _placements(seq_len, d_head, k):
    """Where each layer runs. Every layer takes the same columns, splitting the query
    dimension over their cores, the only dimension a core may split."""
    grid = array()
    columns, cores = _cores(grid)
    scores_col, softmax_col, context_col = columns
    tiles = kernel_tiles(seq_len, d_head, k)
    split = (("D0", cores),)
    gemm = lambda m, contraction, n: dict(  # noqa: E731
        m=m, k=contraction, n=n, utilization=61.8, layout="default", bfp16_mmul=True
    )
    return {
        SCORES_NODE: Placement(scores_col, split, gemm(*tiles[SCORES_NODE])),
        SOFTMAX_NODE: Placement(
            softmax_col,
            (("D0", len(SOFTMAX_ROWS)),),
            # One call reduces its whole buffer, so the tile is exactly one row.
            dict(m=1, n=seq_len, utilization=50.0, layout="contiguous"),
            rows=SOFTMAX_ROWS,
        ),
        CONTEXT_NODE: Placement(context_col, split, gemm(*tiles[CONTEXT_NODE])),
    }


def _layer_tiling(layer, seq_len, d_head, grid, k):
    """Each of the layer's dimensions, as (dim, tile, the extent one core holds)."""
    query = query_tile(seq_len, grid)
    KEY_TILE = key_tile(seq_len, k)
    if layer == SCORES_NODE:
        return [("D0", query, query), ("D1", d_head, d_head), ("D2", KEY_TILE, seq_len)]
    if layer == SOFTMAX_NODE:
        return [("D0", 1, seq_len // len(SOFTMAX_ROWS)), ("D1", seq_len, seq_len)]
    return [("D0", query, query), ("D1", KEY_TILE, seq_len), ("D2", d_head, d_head)]


def _groups(seq_len, d_head, k):
    """The fused groups, each tiling only the dimensions it actually iterates.

    A dimension a core already holds whole is left out: the loop would run once and
    still cost a reuse variable, and a tensor gets one.
    """
    grid = array()
    return [
        FusedGroup(
            f"Fused_Group_{index + 1}",
            layers,
            [
                (layer, dim, tile)
                for layer in layers
                for dim, tile, extent in _layer_tiling(layer, seq_len, d_head, grid, k)
                if tile < extent
            ],
        )
        for index, layers in enumerate(GROUP_LAYERS[k])
    ]


def _check_shapes(seq_len, d_head):
    grid = array()
    _, cores = _cores(grid)
    if seq_len % cores:
        raise ValueError(f"seq_len {seq_len} must be a multiple of {cores}")
    tile = query_tile(seq_len, grid)
    if tile % 16:
        # The GEMM takes a query tile that is a multiple of its MAC rows.
        raise ValueError(
            f"a core would hold {tile} query positions, not a multiple of 16"
        )
    if seq_len % 64:
        # The softmax kernel drops whatever does not fill its 64-element vector.
        raise ValueError(f"seq_len {seq_len} must be a multiple of 64")
    if seq_len % _KEY_BLOCK:
        raise ValueError(f"seq_len {seq_len} must be a multiple of {_KEY_BLOCK}")
    if d_head % 16:
        raise ValueError(f"d_head {d_head} must be a multiple of 16")
    resident = 2 * seq_len * d_head * BYTES_PER_ELEMENT
    if resident > MEMTILE_BYTES:
        raise ValueError(
            f"key and value need {resident} bytes resident, over the "
            f"{MEMTILE_BYTES} byte memory tile; block the key dimension to go further"
        )


@lru_cache(maxsize=None)
def workload_for(seq_len, d_head):
    """The exported workload for one problem size."""
    zeros = lambda *shape: torch.zeros(shape, dtype=torch.bfloat16)  # noqa: E731
    return export_workload(
        attention_core_module(),
        (zeros(seq_len, d_head), zeros(d_head, seq_len), zeros(seq_len, d_head)),
        node_names=NODE_NAMES,
        result_names=RESULT_NAMES,
    )


def build_inputs(seq_len, d_head, output_dir, k=LAYER_BY_LAYER):
    """Write the workload and mapping for one configuration; return their paths."""
    _check_shapes(seq_len, d_head)
    workload = workload_for(seq_len, d_head)
    output_dir = Path(output_dir)
    return (
        workload.write(output_dir / "workload.onnx"),
        emit_mapping(
            workload,
            _placements(seq_len, d_head, k),
            _groups(seq_len, d_head, k),
            array(),
            output_dir / "mapping.yaml",
        ),
    )


def _experiment_id(seq_len, d_head, k):
    grid = array()
    hardware = os.path.splitext(os.path.basename(ACCELERATOR))[0]
    suffix = f"_k{k}" if k != LAYER_BY_LAYER else ""
    if trace_size():
        suffix += "_traced"
    return (
        f"{hardware}-mha{suffix}_{seq_len}_{d_head}"
        f"-{grid.num_rows}_row_{grid.num_columns}_col"
    )


def _run_codegen(seq_len, d_head, npu, k):
    """Run stream-dse's constraint optimization and code generation once."""
    experiment_id = _experiment_id(seq_len, d_head, k)
    workload_path, mapping_path = build_inputs(
        seq_len, d_head, os.path.join(OUTPUT_ROOT, experiment_id), k=k
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
        # One head occupies one column, so a wider search only enlarges the
        # memory-tile path enumeration the solver has to walk.
        nb_cols_to_use=COLUMNS_IN_USE,
        npu=npu,
        backend=BACKEND,
    )


def _design_paths(seq_len, d_head, k):
    return design_paths(
        os.path.join(OUTPUT_ROOT, _experiment_id(seq_len, d_head, k)),
        len(GROUP_LAYERS[k]),
    )


def _group_text(group_index, *, k, seq_len, d_head, npu) -> str:
    return group_text(
        group_index,
        _design_paths(seq_len, d_head, k),
        lambda: _run_codegen(seq_len, d_head, npu, k),
    )


def group_ports(seq_len, d_head, k=LAYER_BY_LAYER):
    """Per fused group, the tensor names it takes in and hands on."""
    return group_boundaries(workload_for(seq_len, d_head), GROUP_LAYERS[k])


def group_digest(group_index, **dims) -> str:
    """Digest of a group's design, for recognising groups that share one."""
    return digest(_group_text(group_index, **dims))


def load_group(group_index, func_prefix="", **dims):
    """Generate the ``k``-group design once and return one group's aie module."""
    return region_module(_group_text(group_index, **dims), func_prefix)
