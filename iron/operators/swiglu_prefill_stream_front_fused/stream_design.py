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

import hashlib
import os
import re
from functools import lru_cache
from pathlib import Path

import stream
import torch
from fontTools.afmLib import kernRE
from fontTools.feaLib.ast import FontRevisionStatement
from xdsl.ir.affine import AffineMap
from stream.api import optimize_allocation_co
from stream.parser.onnx.operator_parser import OnnxOperatorParser
from stream.workload.workload import ComputationNode, Tensor

from iron.common.stream.hardware import ComputeArray
from iron.common.stream.mapping import (
    FusedGroup,
    Placement,
    emit_mapping,
    group_boundaries,
)
from iron.common.stream.workload import export_workload
from iron.operators.swiglu_prefill_stream_front_fused import reference
from iron.operators.swiglu_prefill_stream_front_fused.front_kernel import SwigluFrontFusedKernel
from iron.operators.swiglu_prefill_stream_front_fused.reference import swiglu_module

# Hardware description for the whole-array Strix (npu2) target, shipped as package
# data inside the installed stream package.
ACCELERATOR = os.path.join(
    os.path.dirname(stream.__file__),
    "inputs",
    "aie",
    "hardware",
    "whole_array_strix.yaml",
)

BACKEND = "gurobi"
OUTPUT_ROOT = "outputs"

# Names for the exported graph's computation nodes, in topological order, and for
# the tensors they produce. They name the roles rather than the ATen ops the
# exporter captured, and they are what the mapping and the generated design are
# read by.
NAME_FRONT = "front"
NAME_DOWN = "down"
NODE_NAMES = [NAME_FRONT, NAME_DOWN]
RESULT_NAMES = {
    NAME_FRONT: reference.NAME_FRONT,
}

# Sequence positions an elementwise layer works at a time when it reads from and
# writes to memory. Its tile is then this many whole rows, which is contiguous in
# a row-major tensor, so each transfer runs the length of the rows rather than one
# MAC tile at a time.
ELEMENTWISE_ROWS = 1

GROUP_LAYERS = [[NAME_FRONT, NAME_DOWN]]


class SwigluFrontFusedParser(OnnxOperatorParser):
    def generate_node(self, name_to_tensor_dict: dict[str, Tensor]) -> ComputationNode:
        inputs = tuple(name_to_tensor_dict[name] for name in self.node.input)

        # check input and shape validness
        assert len(inputs) == 2
        input_data, input_weight = inputs
        assert len(input_data.shape) == 2 and len(input_weight.shape) == 3
        dm, dk = input_data.shape
        wk, two, wn = input_weight.shape
        assert dk == wk
        assert two == 2

        mappings = (
            AffineMap.from_callable(lambda m, k, t, n: (m, k)),
            AffineMap.from_callable(lambda m, k, t, n: (k, t, n)),
            AffineMap.from_callable(lambda m, k, t, n: (m, n)),
        )
        return ComputationNode(
            type=self.node.op_type,
            name=self.node.name,
            inputs=inputs,
            outputs=self.get_output_tensors(),
            operand_mapping=mappings,
        )


def tiles_for():
    """The kernel tile, as (sequence, embedding, hidden), for ``k`` fused groups."""
    # TODO tune this
    return (16, 64, 64)


def gemm_tiles():
    """Each GEMM layer's kernel tile, in the (m, k, n) order the kernel takes."""
    sequence, embedding, hidden = tiles_for()
    return {
        NAME_FRONT: (sequence, embedding, hidden),
        NAME_DOWN: (sequence, hidden, embedding),
    }


COLUMNS_PER_LAYER = 2


@lru_cache(maxsize=None)
def array() -> ComputeArray:
    """The compute grid of the device being built for."""
    import aie.utils as aie_utils

    return ComputeArray.from_device(aie_utils.get_current_device())


def _placements(embedding_dim):
    """Where each layer runs: disjoint columns, D0 split over every core in them."""
    grid = array()
    sequence_tile, _, hidden_tile = tiles_for()
    tiles = gemm_tiles()

    def gemm(tiles):
        # TODO probably not correct?
        return dict(
            zip("mkn", tiles), utilization=61.8, layout="default", bfp16_mmul=True
        )

    columns = dict(zip([NAME_FRONT, NAME_DOWN], grid.allocate([COLUMNS_PER_LAYER] * 2)))
    cores = grid.num_rows * COLUMNS_PER_LAYER
    return {
        NAME_FRONT: Placement(
            columns[NAME_FRONT],
            (("D0", cores),),
            dict(gemm(tiles[NAME_FRONT]), full_k=embedding_dim),
        ),
        NAME_DOWN: Placement(
            columns[NAME_DOWN], (("D0", cores),), gemm(tiles[NAME_DOWN])
        ),
    }


def _groups():
    """The fused groups, each with the intra-core tiling of its leading GEMM.

    Splitting makes stream-dse emit one design per group, which IRON then deploys
    as a single full ELF. D0 is the sequence dimension, D1 the contraction and D2
    the output dimension.
    """
    sequence_tile, embedding_tile, hidden_tile = tiles_for()
    # TODO what does this mean exactly? why does the order matter here?
    tiling = [
        [
            (NAME_FRONT, "D1", embedding_tile),
            (NAME_DOWN, "D2", embedding_tile),
            (NAME_FRONT, "D3", hidden_tile),
            (NAME_FRONT, "D0", sequence_tile),
        ]
    ]
    return [
        FusedGroup(f"Fused_Group_{index + 1}", layers, group_tiling)
        for index, (layers, group_tiling) in enumerate(zip(GROUP_LAYERS, tiling))
    ]


def _check_shapes(seq_len, embedding_dim, hidden_dim):
    """Reject a problem size the placement and the kernel tiles cannot divide."""
    grid = array()
    sequence_tile, embedding_tile, hidden_tile = tiles_for()
    gemm_split = 2
    cores = grid.num_rows * COLUMNS_PER_LAYER
    if seq_len % cores or seq_len < sequence_tile * cores:
        raise ValueError(
            f"seq_len ({seq_len}) must be a multiple of {cores} and at "
            f"least {sequence_tile * cores}"
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


def group_ports(seq_len, embedding_dim, hidden_dim):
    """Per fused group, the tensor names it takes in and hands on.

    These are the operator's runtime arguments, including the tensors a split
    design passes from one group to the next.
    """
    return group_boundaries(
        workload_for(seq_len, embedding_dim, hidden_dim), GROUP_LAYERS
    )


def build_inputs(seq_len, embedding_dim, hidden_dim, output_dir):
    """Write the workload and mapping for one configuration; return their paths."""
    _check_shapes(seq_len, embedding_dim, hidden_dim)
    workload = workload_for(seq_len, embedding_dim, hidden_dim)
    output_dir = Path(output_dir)
    return (
        workload.write(output_dir / "workload.onnx"),
        emit_mapping(
            workload,
            _placements(embedding_dim),
            _groups(),
            array(),
            output_dir / "mapping.yaml",
        ),
    )


def _experiment_id(seq_len, embedding_dim, hidden_dim):
    grid = array()
    hardware = os.path.splitext(os.path.basename(ACCELERATOR))[0]

    trace_suffix = ""
    if trace_size():
        trace_suffix = f"-traced_{trace_size()}_{trace_tiles()}"
        if trace_core_pc():
            trace_suffix += "-pc"
        elif trace_core_lock_requests():
            trace_suffix += "-locks"
    return (
        f"{hardware}-swiglu_fused_front{trace_suffix}_{seq_len}_{embedding_dim}_{hidden_dim}"
        f"-{grid.num_rows}_row_{grid.num_columns}_col"
    )


def trace_size():
    return int(os.environ.get("IRON_TRACE_SIZE", "0"))


def trace_tiles():
    return int(os.environ.get("IRON_TRACE_NTILES", "1"))


def trace_memtiles():
    """Number of memory tiles to trace; set IRON_TRACE_NMEMTILES=0 to disable."""
    return int(os.environ.get("IRON_TRACE_NMEMTILES", "1"))


def trace_shimtiles():
    """Number of shim tiles to trace; set IRON_TRACE_NSHIMTILES=0 to disable."""
    return int(os.environ.get("IRON_TRACE_NSHIMTILES", "1"))


def trace_core_pc():
    """Trace selected core events with their program counter."""
    return os.environ.get("IRON_TRACE_CORE_PC", "0").lower() not in {
        "",
        "0",
        "false",
        "no",
        "off",
    }


def trace_core_lock_requests():
    """Trace lock requests alongside event-time stall events."""
    return os.environ.get("IRON_TRACE_CORE_LOCKS", "0").lower() not in {
        "",
        "0",
        "false",
        "no",
        "off",
    }


def _detailed_core_trace(mlir_text: str) -> str:
    """Add instruction-level lock events to the selected core trace mode."""
    if not (trace_core_pc() or trace_core_lock_requests()):
        return mlir_text

    if trace_core_pc():
        mlir_text = re.sub(
            r'("aie\.trace\.mode"\(\)\s*<\{mode\s*=\s*)0(\s*:\s*i32\s*\}>)',
            r"\g<1>1\g<2>",
            mlir_text,
        )

    def rewrite_core_trace(match):
        block = match.group(0)
        if trace_core_pc():
            for old, new in (
                ("MEMORY_STALL", "INSTR_STREAM_GET"),
                ("LOCK_STALL", "INSTR_STREAM_PUT"),
                ("INSTR_VECTOR", "NONE"),
            ):
                block = block.replace(
                    f'#aie.trace_event<"{old}">', f'#aie.trace_event<"{new}">'
                )
        none_index = 0

        def replace_none(none_match):
            nonlocal none_index
            if trace_core_pc():
                replacement = (
                    "INSTR_LOCK_ACQUIRE_REQ"
                    if none_index == 0
                    else "INSTR_LOCK_RELEASE_REQ" if none_index == 1 else "NONE"
                )
            else:
                replacement = (
                    "INSTR_LOCK_ACQUIRE_REQ" if none_index == 0 else "NONE"
                )
            none_index += 1
            return f'#aie.trace_event<"{replacement}">'

        return re.sub(r'#aie\.trace_event<"NONE">', replace_none, block)

    mlir_text = re.sub(
        r'"aie\.trace"\(.*?\n\s+\}\) : \(index\) -> \(\)',
        rewrite_core_trace,
        mlir_text,
        flags=re.DOTALL,
    )
    return mlir_text


def _design_paths(seq_len, embedding_dim, hidden_dim):
    """Where stream-dse writes each group's MLIR.

    A single fused group goes through stream-dse's single-design pipeline and lands
    in ``codegen/``; several groups each land in their own ``group_i/codegen/``.
    """
    output_dir = os.path.join(
        OUTPUT_ROOT, _experiment_id(seq_len, embedding_dim, hidden_dim)
    )
    return [os.path.join(output_dir, "codegen", "final.mlir")]


def _run_codegen(seq_len, embedding_dim, hidden_dim, npu):
    """Run stream-dse's constraint optimization and code generation once."""
    from stream.parser.onnx.model import register_onnx_parser

    register_onnx_parser("SwigluFrontFused", SwigluFrontFusedParser)

    grid = array()
    experiment_id = _experiment_id(seq_len, embedding_dim, hidden_dim)
    workload_path, mapping_path = build_inputs(
        seq_len,
        embedding_dim,
        hidden_dim,
        os.path.join(OUTPUT_ROOT, experiment_id),
    )

    def front_fused_kernel(
        m: int,
        k: int,
        n: int,
        utilization: float,
        layout: str,
        bfp16_mmul: bool,
        full_k: int,
    ):
        # TODO what is the point of utilization and these other extra params?
        del layout, bfp16_mmul
        return SwigluFrontFusedKernel(
            m=m, k=k, n=n, full_k=full_k, utilization=utilization
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
        nb_cols_to_use=grid.num_columns,
        npu=npu,
        backend=BACKEND,
        kernels={"swiglu_fused_front": front_fused_kernel},
    )


def _prefixed(mlir_text: str, func_prefix: str) -> str:
    """Apply a fused-operator ``func_prefix`` (``op<idx>_``) to a group's MLIR.

    ``OperatorSequence`` renames each child's kernel object files and symbols to
    ``op<idx>_...`` so the groups stay distinct inside one ELF; the group's MLIR
    must reference the same prefixed names. Prefix the ``link_with`` object files
    and every privately declared kernel symbol, and its call sites.
    """
    if not func_prefix:
        return mlir_text
    mlir_text = re.sub(
        r'link_with\s*=\s*"([^"]+)"',
        lambda m: f'link_with = "{func_prefix}{m.group(1)}"',
        mlir_text,
    )
    symbols = sorted(
        set(re.findall(r"func\.func\s+private\s+@([A-Za-z0-9_]+)", mlir_text)),
        key=len,
        reverse=True,
    )
    for symbol in symbols:
        mlir_text = re.sub(
            rf"@{re.escape(symbol)}\b", f"@{func_prefix}{symbol}", mlir_text
        )
    return mlir_text


def region_module(mlir_text: str, func_prefix: str = ""):
    """Parse a group's MLIR text into an ``aie`` module for fusion.

    ``OperatorSequence`` consumes ``aie.DeviceOp`` objects, so the xDSL-emitted
    group text is re-parsed with the mlir-aie bindings, after ``func_prefix``
    rewriting.
    """
    from aie import ir
    from aie.extras.context import mlir_mod_ctx

    with mlir_mod_ctx():
        module = ir.Module.parse(_prefixed(mlir_text, func_prefix))
        _add_auxiliary_traces(module)
        return module


def _add_auxiliary_traces(module):
    """Add optional memtile and shim-tile traces to a stream-dse module."""
    if not trace_size():
        return

    from aie.dialects import aie
    from aie.ir import InsertionPoint
    from aie.utils.trace.events import MemTileEvent, PacketType, ShimTileEvent

    device = next(
        operation
        for operation in module.body.operations
        if str(operation.operation.name) == "aie.device"
    )
    device_block = device.operation.regions[0].blocks[0]
    sequence = next(
        operation
        for operation in device_block.operations
        if str(operation.operation.name) == "aie.runtime_sequence"
    )
    sequence_block = sequence.operation.regions[0].blocks[0]
    tiles = [
        operation
        for operation in device_block.operations
        if str(operation.operation.name) == "aie.tile"
    ]
    memtiles = [tile for tile in tiles if tile.is_mem_tile()]
    shimtiles = [tile for tile in tiles if tile.is_shim_tile()]
    trace_specs = [
        (
            tile,
            f"trace_memtile_iron_{index}",
            MemTileEvent,
            PacketType.MEMTILE,
        )
        for index, tile in enumerate(memtiles[: max(0, trace_memtiles())])
    ] + [
        (
            tile,
            f"trace_shimtile_iron_{index}",
            ShimTileEvent,
            PacketType.SHIMTILE,
        )
        for index, tile in enumerate(shimtiles[: max(0, trace_shimtiles())])
    ]

    events = {
        MemTileEvent: (
            MemTileEvent.GROUP_DMA_ACTIVITY,
            MemTileEvent.DMA_S2MM_SEL0_START_TASK,
            MemTileEvent.DMA_S2MM_SEL0_FINISHED_TASK,
            MemTileEvent.DMA_MM2S_SEL0_START_TASK,
            MemTileEvent.DMA_MM2S_SEL0_FINISHED_TASK,
        ),
        ShimTileEvent: (
            ShimTileEvent.GROUP_DMA_ACTIVITY,
            ShimTileEvent.DMA_S2MM_0_START_TASK,
            ShimTileEvent.DMA_S2MM_0_FINISHED_TASK,
            ShimTileEvent.DMA_MM2S_0_START_TASK,
            ShimTileEvent.DMA_MM2S_0_FINISHED_TASK,
        ),
    }
    names = []
    for tile, name, event_type, packet_type in trace_specs:
        with InsertionPoint.at_block_terminator(device_block):

            @aie.trace(tile, name)
            def trace_body():
                aie.trace_packet(type=packet_type)
                for event in events[event_type]:
                    aie.trace_event(event)
                aie.trace_start(broadcast=15)
                aie.trace_stop(broadcast=14)

        names.append(name)

    with InsertionPoint.at_block_begin(sequence_block):
        for name in names:
            aie.trace_start_config(name)


def _group_text(group_index, *, seq_len, embedding_dim, hidden_dim, npu) -> str:
    """One group's generated MLIR, before any ``func_prefix`` rewriting."""
    finals = _design_paths(seq_len, embedding_dim, hidden_dim)
    if not all(os.path.exists(final) for final in finals):
        _run_codegen(seq_len, embedding_dim, hidden_dim, npu)
    return Path(finals[group_index]).read_text()


def group_digest(group_index, **dims) -> str:
    """Digest of a group's design, for recognising groups that share one."""
    return hashlib.sha256(_group_text(group_index, **dims).encode()).hexdigest()


def load_group(
        group_index, func_prefix="", *, seq_len, embedding_dim, hidden_dim, npu
):
    """Generate the ``k``-group design once and return one group's aie module.

    ``group_index`` selects the group, in the order :data:`GROUP_LAYERS` lists them.
    ``func_prefix`` is injected by ``OperatorSequence``. Every group loader calls
    this; the first generates the design and the rest reuse the files on disk.
    """
    text = _group_text(
        group_index,
        seq_len=seq_len,
        embedding_dim=embedding_dim,
        hidden_dim=hidden_dim,
        npu=npu,
    )
    return region_module(_detailed_core_trace(text), func_prefix)
