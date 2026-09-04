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

import json
import logging
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
from iron.common.stream.runner import (
    design_dir,
    experiment_id,
    run_codegen,
    run_partition_codegen,
)

try:
    from stream.ir.infeasibility import InfeasibleAllocationError
except ImportError:
    InfeasibleAllocationError = RuntimeError
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

# The blocks a GEMM object can be compiled for, largest first, as (sequence, embedding,
# hidden). Which one a configuration gets is not declared: the build tries them in order
# and stream's solve is the arbiter, rejecting a block that does not fit its cores.
GEMM_BLOCKS = ((64, 64, 64), (32, 32, 64))

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
logger = logging.getLogger(__name__)

LAYER_BY_LAYER = 5
GROUP_LAYERS = {
    1: [[GATE, UP, SILU, MUL, DOWN]],
    2: [[GATE, UP, SILU, MUL], [DOWN]],
    LAYER_BY_LAYER: [[GATE], [UP], [SILU], [MUL], [DOWN]],
}


def gemm_blocks(block):
    """Each GEMM layer's compiled block, in the (m, k, n) order the kernel takes."""
    sequence, embedding, hidden = block
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


def partition_layers(seq_len, embedding_dim, hidden_dim, npu, k):
    """The layers of each fused group: declared for an explicit ``k``, solved otherwise.

    With ``k=None`` the mapping declares no fused groups and stream prices the
    candidate partitions itself -- each by the solve the deployed build runs, plus
    the namespace's dispatch overhead -- persisting the winner in ``partition.json``
    beside the design, the way the accepted GEMM block already is.
    """
    if k is not None:
        return GROUP_LAYERS[k]
    marker = (
        Path(design_dir(_experiment_id(seq_len, embedding_dim, hidden_dim, k)))
        / "partition.json"
    )
    if not marker.exists():
        _run_codegen(seq_len, embedding_dim, hidden_dim, npu, k)
    return [list(group) for group in json.loads(marker.read_text())["groups"]]


def _placements(k, hidden_dim, block):
    """The kernel of each layer; where they run is stream's PlacementGenerationStage.

    Split per layer, the elementwise kernels read whole rows so their transfers to and
    from memory are contiguous; fused behind a GEMM they take the block that GEMM
    writes, in the layout it writes it.
    """
    tiles = gemm_blocks(block)

    def gemm(block):
        return dict(
            zip("mkn", block), utilization=61.8, layout="default", bfp16_mmul=True
        )

    if k is None or k == LAYER_BY_LAYER:
        wide = elementwise(1, _row_width(hidden_dim), "contiguous")
        elementwise_kwargs = {SILU: wide, MUL: wide}
    else:
        sequence_tile, _, hidden_tile = block
        fused = elementwise(sequence_tile, hidden_tile, "default", bfp16_mmul=True)
        elementwise_kwargs = {SILU: fused, MUL: fused}
    return {
        GATE: Placement((), kernel_kwargs=gemm(tiles[GATE])),
        UP: Placement((), kernel_kwargs=gemm(tiles[UP])),
        SILU: Placement((), kernel_kwargs=elementwise_kwargs[SILU]),
        MUL: Placement((), kernel_kwargs=elementwise_kwargs[MUL]),
        DOWN: Placement((), kernel_kwargs=gemm(tiles[DOWN])),
    }


def elementwise(rows, columns, layout, bfp16_mmul=False):
    return {
        "utilization": 50.0,
        "layout": layout,
        "m": rows,
        "n": columns,
        "bfp16_mmul": bfp16_mmul,
    }


def _groups(k, hidden_dim):
    """The fused groups. Their tiling is the kernels' granules, derived by stream;
    with no ``k`` the mapping declares none and stream solves the partition too."""
    if k is None:
        return []
    return [
        FusedGroup(f"Fused_Group_{index + 1}", layers)
        for index, layers in enumerate(GROUP_LAYERS[k])
    ]


def _check_shapes(seq_len, embedding_dim, hidden_dim, k):
    """Reject a problem size no compiled block can divide."""
    grid = array()
    sequence_tile, embedding_tile, hidden_tile = GEMM_BLOCKS[-1]
    gemm_split = grid.num_columns if k in (None, LAYER_BY_LAYER) else 2
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


def group_ports(seq_len, embedding_dim, hidden_dim, k=1, npu="npu2"):
    """Per fused group, the tensor names it takes in and hands on.

    These are the operator's runtime arguments, including the tensors a split
    design passes from one group to the next.
    """
    return group_boundaries(
        workload_for(seq_len, embedding_dim, hidden_dim),
        partition_layers(seq_len, embedding_dim, hidden_dim, npu, k),
    )


def build_inputs(
    seq_len, embedding_dim, hidden_dim, output_dir, k=1, block=GEMM_BLOCKS[-1]
):
    """Write the workload and mapping for one configuration; return their paths."""
    _check_shapes(seq_len, embedding_dim, hidden_dim, k)
    workload = workload_for(seq_len, embedding_dim, hidden_dim)
    output_dir = Path(output_dir)
    return (
        workload.write(output_dir / "workload.onnx"),
        emit_mapping(
            workload,
            _placements(k, hidden_dim, block),
            _groups(k, hidden_dim),
            array(),
            output_dir / "mapping.yaml",
        ),
    )


def _experiment_id(seq_len, embedding_dim, hidden_dim, k):
    suffix = "_kauto" if k is None else (f"_k{k}" if k > 1 else "")
    return experiment_id("swiglu", f"{seq_len}_{embedding_dim}_{hidden_dim}", suffix)


def _block_marker(eid):
    return Path(design_dir(eid)) / "gemm_block.json"


def chosen_block(seq_len, embedding_dim, hidden_dim, npu, k):
    """The compiled GEMM block the solve accepted, building the design if needed."""
    marker = _block_marker(_experiment_id(seq_len, embedding_dim, hidden_dim, k))
    if not marker.exists():
        _run_codegen(seq_len, embedding_dim, hidden_dim, npu, k)
    return tuple(json.loads(marker.read_text()))


def _run_codegen(seq_len, embedding_dim, hidden_dim, npu, k):
    """Build with the largest block the solve accepts; the last candidate must hold.

    With ``k=None`` every (partition, block) pair becomes a candidate mapping and
    stream's priced search picks among them; the winner's block is persisted the
    same way an explicit build's is.
    """
    eid = _experiment_id(seq_len, embedding_dim, hidden_dim, k)
    if k is None:
        base = Path(design_dir(eid))
        candidates, shapes = [], []
        for candidate_k in (1, LAYER_BY_LAYER):
            for block in GEMM_BLOCKS:
                candidate_dir = (
                    base / f"candidate_k{candidate_k}_b{'x'.join(map(str, block))}"
                )
                try:
                    workload_path, mapping_path = build_inputs(
                        seq_len,
                        embedding_dim,
                        hidden_dim,
                        candidate_dir,
                        k=candidate_k,
                        block=block,
                    )
                except ValueError:
                    continue
                candidates.append(mapping_path)
                shapes.append(block)
        run_partition_codegen(eid, workload_path, candidates, npu)
        chosen = json.loads((base / "partition.json").read_text())
        _block_marker(eid).write_text(json.dumps(shapes[chosen["chosen"]]))
        return
    for block in GEMM_BLOCKS:
        workload_path, mapping_path = build_inputs(
            seq_len, embedding_dim, hidden_dim, design_dir(eid), k=k, block=block
        )
        try:
            run_codegen(eid, workload_path, mapping_path, npu)
        except (InfeasibleAllocationError, RuntimeError) as error:
            if block is GEMM_BLOCKS[-1]:
                raise
            logger.info("Block %s does not fit (%s); trying the next", block, error)
            continue
        _block_marker(eid).write_text(json.dumps(block))
        return


def _design_paths(seq_len, embedding_dim, hidden_dim, k, npu="npu2"):
    return design_paths(
        design_dir(_experiment_id(seq_len, embedding_dim, hidden_dim, k)),
        len(partition_layers(seq_len, embedding_dim, hidden_dim, npu, k)),
    )


def _group_text(group_index, *, k, seq_len, embedding_dim, hidden_dim, npu) -> str:
    return group_text(
        group_index,
        _design_paths(seq_len, embedding_dim, hidden_dim, k, npu),
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
