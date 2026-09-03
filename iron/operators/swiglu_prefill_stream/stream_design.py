# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Generate the SwiGLU-prefill design with stream-dse.

Both inputs stream-dse needs are produced here, from IRON:

* the **workload**, exported from :mod:`~iron.operators.swiglu_prefill_stream.reference`,
  the same module the test checks the result against;
* the **mapping**, from the placement below.

Both are written into the experiment's output directory at build time, never into
the source tree, and the mapping's node names come from the exported workload, so
the two cannot disagree. stream-dse then solves the allocation and emits the MLIR.

This module is imported lazily (by ``DesignGenerator`` at compile time), so
importing the operator does not require ``stream-dse`` to be installed, only
building it does.
"""

import os
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
from iron.common.stream.runner import design_dir, experiment_id, run_codegen
from iron.common.stream.mapping import (
    FusedGroup,
    Placement,
    emit_mapping,
    group_boundaries,
)
from iron.common.stream.workload import export_workload
from iron.operators.swiglu_prefill_stream import reference
from iron.operators.swiglu_prefill_stream.reference import swiglu_module

# Names for the exported graph's computation nodes, in topological order, and for
# the tensors they produce. They name the roles rather than the ATen ops the
# exporter captured, and they are what the mapping and the generated design are
# read by.
GATE, UP, SILU, MUL, DOWN = "Gemm_Left", "Gemm_Right", "Silu", "Elt_Mul", "Gemm_Down"
NODE_NAMES = [GATE, UP, SILU, MUL, DOWN]
RESULT_NAMES = {
    GATE: reference.GATE_PROJECTION,
    UP: reference.UP_PROJECTION,
    SILU: reference.ACTIVATION,
    MUL: reference.HIDDEN,
}

# The block each GEMM object is compiled for, as (sequence, embedding, hidden). This is
# a kernel property, not a tiling: steady-state tiles are stream's choice, seeded from
# these granules. Fused groups compile a smaller block because the elementwise cores
# hold three operands at once (at 64x64x64 the multiply core needs 80 KB of its 64 KB).
FUSED_BLOCK = (32, 32, 64)  # k=1, k=2
LAYER_BLOCK = (64, 64, 64)  # k=5

# Sequence positions an elementwise layer works at a time when it reads from and
# writes to memory. Its tile is then this many whole rows, which is contiguous in
# a row-major tensor, so each transfer runs the length of the rows rather than one
# MAC tile at a time.
ELEMENTWISE_ROWS = 1
# A row wider than this does not leave room for the three operands an elementwise layer
# holds at once. The width has to divide the dimension, so the row is read in equal pieces.
ELEMENTWISE_WIDTH = 2048

# Which layers each fused group contains, per number of groups ``k``. Splitting
# makes stream-dse emit one design per group; the tensor handed from one group to
# the next comes from the exported graph.
LAYER_BY_LAYER = 5
GROUP_LAYERS = {
    1: [[GATE, UP, SILU, MUL, DOWN]],
    2: [[GATE, UP, SILU, MUL], [DOWN]],
    LAYER_BY_LAYER: [[GATE], [UP], [SILU], [MUL], [DOWN]],
}


def block_for(k):
    """The compiled GEMM block, as (sequence, embedding, hidden), for ``k`` fused groups."""
    return LAYER_BLOCK if k == LAYER_BY_LAYER else FUSED_BLOCK


def gemm_blocks(k):
    """Each GEMM layer's compiled block, in the (m, k, n) order the kernel takes."""
    sequence, embedding, hidden = block_for(k)
    return {
        GATE: (sequence, embedding, hidden),
        UP: (sequence, embedding, hidden),
        DOWN: (sequence, hidden, embedding),
    }


def _row_width(hidden_dim):
    """How much of a row an elementwise core takes at once: the whole row where it fits,
    and otherwise the widest piece that divides it."""
    if hidden_dim <= ELEMENTWISE_WIDTH:
        return hidden_dim
    return max(w for w in range(ELEMENTWISE_WIDTH, 0, -1) if hidden_dim % w == 0)


def default_groups(hidden_dim):
    """How many fused groups to build when the caller does not say.

    Layer by layer, always. Fusing is meant to pay for the round trips it saves with the
    cores it gives up, but it never has: measured at embedding 512 and hidden 2048 against
    iron/operators/swiglu_prefill, one group ties layer-by-layer at sequence 256 (1.29 ms
    both) and loses badly once the sequence grows -- 3.96 ms against 2.44 at 1024, and 7.49
    against 3.92 at 2048, where layer-by-layer is the only one of the two that beats the
    hand-written operator. Fusing costs each GEMM three quarters of its columns, and the
    weight traffic that follows outgrows the intermediates it keeps on chip.
    """
    return LAYER_BY_LAYER


def _placements(k, hidden_dim):
    """Where each layer runs.

    Fused (k=1, k=2): the layers sit on disjoint columns, two per GEMM and one per
    elementwise layer, so they pipeline across steady-state iterations. Each splits
    over the array's rows (D0, the sequence dimension) and a GEMM over its two
    columns as well (D2, the output dimension).

    Layer by layer (k=5): the layers run in turn, so each takes the whole array.
    The GEMMs use every row; the elementwise layers take one core per column and
    split the sequence across them, the shape IRON's channeled operators use. They
    also read whole rows, so their transfers to and from memory are contiguous.
    """
    grid = array()
    sequence_tile, _, hidden_tile = block_for(k)
    tiles = gemm_blocks(k)

    def gemm(tiles):
        return dict(
            zip("mkn", tiles), utilization=61.8, layout="default", bfp16_mmul=True
        )

    def elementwise(rows, columns, layout, bfp16_mmul=False):
        return {
            "utilization": 50.0,
            "layout": layout,
            "m": rows,
            "n": columns,
            "bfp16_mmul": bfp16_mmul,
        }

    if k == LAYER_BY_LAYER:
        wide = grid.all_columns
        gemm_split = (("D0", grid.num_rows), ("D2", grid.num_columns))
        elementwise_split = (("D0", grid.num_columns),)
        rows_wide = elementwise(ELEMENTWISE_ROWS, _row_width(hidden_dim), "contiguous")
        return {
            GATE: Placement(wide, gemm_split, gemm(tiles[GATE])),
            UP: Placement(wide, gemm_split, gemm(tiles[UP])),
            SILU: Placement(wide, elementwise_split, rows_wide, rows=[0]),
            MUL: Placement(wide, elementwise_split, rows_wide, rows=[0]),
            DOWN: Placement(wide, gemm_split, gemm(tiles[DOWN])),
        }

    columns = dict(zip(NODE_NAMES, grid.allocate([2, 2, 1, 1, 2])))
    gemm_split = (("D0", grid.num_rows), ("D2", 2))
    elementwise_split = (("D0", grid.num_rows),)
    # Fused behind a GEMM, so the operands take the layout that GEMM writes.
    fused = elementwise(sequence_tile, hidden_tile, "default", bfp16_mmul=True)
    return {
        GATE: Placement(columns[GATE], gemm_split, gemm(tiles[GATE])),
        UP: Placement(columns[UP], gemm_split, gemm(tiles[UP])),
        SILU: Placement(columns[SILU], elementwise_split, fused),
        MUL: Placement(columns[MUL], elementwise_split, fused),
        DOWN: Placement(columns[DOWN], gemm_split, gemm(tiles[DOWN])),
    }


def _groups(k, hidden_dim):
    """The fused groups. Their tiling is the kernels' granules, derived by stream."""
    return [
        FusedGroup(f"Fused_Group_{index + 1}", layers)
        for index, layers in enumerate(GROUP_LAYERS[k])
    ]


def _check_shapes(seq_len, embedding_dim, hidden_dim, k):
    """Reject a problem size the placement and the kernel tiles cannot divide."""
    grid = array()
    sequence_tile, embedding_tile, hidden_tile = block_for(k)
    gemm_split = grid.num_columns if k == LAYER_BY_LAYER else 2
    if seq_len % grid.num_rows or seq_len < sequence_tile * grid.num_rows:
        raise ValueError(
            f"seq_len ({seq_len}) must be a multiple of {grid.num_rows} and at "
            f"least {sequence_tile * grid.num_rows}"
        )
    if embedding_dim % (embedding_tile * gemm_split):
        raise ValueError(
            f"embedding_dim ({embedding_dim}) must be a multiple of "
            f"{embedding_tile * gemm_split}"
        )
    if hidden_dim % (hidden_tile * gemm_split):
        raise ValueError(
            f"hidden_dim ({hidden_dim}) must be a multiple of "
            f"{hidden_tile * gemm_split}"
        )


@lru_cache(maxsize=None)
def workload_for(seq_len, embedding_dim, hidden_dim):
    """The exported workload for one problem size."""
    return export_workload(
        swiglu_module(embedding_dim, hidden_dim),
        (torch.zeros(seq_len, embedding_dim, dtype=torch.bfloat16),),
        node_names=NODE_NAMES,
        result_names=RESULT_NAMES,
    )


def group_ports(seq_len, embedding_dim, hidden_dim, k=1):
    """Per fused group, the tensor names it takes in and hands on.

    These are the operator's runtime arguments, including the tensors a split
    design passes from one group to the next.
    """
    return group_boundaries(
        workload_for(seq_len, embedding_dim, hidden_dim), GROUP_LAYERS[k]
    )


def build_inputs(seq_len, embedding_dim, hidden_dim, output_dir, k=1):
    """Write the workload and mapping for one configuration; return their paths."""
    _check_shapes(seq_len, embedding_dim, hidden_dim, k)
    workload = workload_for(seq_len, embedding_dim, hidden_dim)
    output_dir = Path(output_dir)
    return (
        workload.write(output_dir / "workload.onnx"),
        emit_mapping(
            workload,
            _placements(k, hidden_dim),
            _groups(k, hidden_dim),
            array(),
            output_dir / "mapping.yaml",
        ),
    )


def _experiment_id(seq_len, embedding_dim, hidden_dim, k):
    suffix = f"_k{k}" if k > 1 else ""
    return experiment_id("swiglu", f"{seq_len}_{embedding_dim}_{hidden_dim}", suffix)


def _run_codegen(seq_len, embedding_dim, hidden_dim, npu, k):
    """Run stream-dse's constraint optimization and code generation once."""
    eid = _experiment_id(seq_len, embedding_dim, hidden_dim, k)
    workload_path, mapping_path = build_inputs(
        seq_len, embedding_dim, hidden_dim, design_dir(eid), k=k
    )
    run_codegen(eid, workload_path, mapping_path, npu)


def _design_paths(seq_len, embedding_dim, hidden_dim, k):
    return design_paths(
        design_dir(_experiment_id(seq_len, embedding_dim, hidden_dim, k)),
        len(GROUP_LAYERS[k]),
    )


def _group_text(group_index, *, k, seq_len, embedding_dim, hidden_dim, npu) -> str:
    return group_text(
        group_index,
        _design_paths(seq_len, embedding_dim, hidden_dim, k),
        lambda: _run_codegen(seq_len, embedding_dim, hidden_dim, npu, k),
    )


def group_digest(group_index, **dims) -> str:
    """Digest of a group's design, for recognising groups that share one."""
    return digest(_group_text(group_index, **dims))


def load_group(group_index, func_prefix="", **dims):
    """Generate the ``k``-group design once and return one group's aie module.

    ``group_index`` selects the group, in the order :data:`GROUP_LAYERS` lists them.
    ``func_prefix`` is injected by ``OperatorSequence``.
    """
    return region_module(_group_text(group_index, **dims), func_prefix)
