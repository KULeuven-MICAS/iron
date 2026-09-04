# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""
Temporal fusion of multiple MLIR modules into one module with multiple devices and a main runtime sequence that calls into them.
"""

from __future__ import annotations

from itertools import count, islice

import numpy as np
import importlib.util
from functools import partial
from pathlib import Path
from aie import ir
from aie.dialects import aie, aiex, memref
from aie.extras.context import mlir_mod_ctx
import ml_dtypes

import os
import re
from typing import Any

from . import (
    CompilationArtifactGraph,
    CompilationRule,
    CompilationCommand,
    PythonCallbackCompilationCommand,
    PythonGeneratedMLIRArtifact,
    MLIRArtifact,
)

RESET_DEVICE = "reset_device"


# Compilation Artifacts
# ##########################################################################


def trace_argument_layout(
    arg_counts: dict[str, int], trace_size: int, traced: str | None = None
):
    """Buffer slots for the fused runtime sequence, as (consolidated, trace, count).

    Lowering patches a trace address against the dispatched kernel, not the callee, so an
    operator's buffer has to sit at the index it uses -- which is how many arguments it
    takes. Two operators taking the same number would want the same slot, so ``traced``
    names the one to instrument and the others go untraced.
    """
    if not trace_size:
        return [0, 1, 2], {}, 3
    trace_slots = {n: c for n, c in arg_counts.items() if traced in (None, n)}
    counts = list(trace_slots.values())
    shared = sorted({n for n in counts if counts.count(n) > 1})
    if shared:
        raise NotImplementedError(
            "operators taking the same number of arguments would share one trace buffer "
            f"(slots {shared}); set IRON_TRACE_OP to one of {sorted(trace_slots)}"
        )
    trace_indices = sorted(set(counts))
    consolidated_idx = list(islice((i for i in count() if i not in trace_indices), 3))
    return consolidated_idx, trace_slots, max(trace_indices + consolidated_idx) + 1


class SequenceMLIRArtifact(MLIRArtifact):
    def __init__(
        self,
        filename: str,
        operator_mlir_map: dict[str, PythonGeneratedMLIRArtifact],
        runlist: list[tuple[str, ...]],
        subbuffer_layout: dict[str, tuple[str, int, int]],
        buffer_sizes: tuple[int, int, int],
        slice_info: dict[str, tuple[str, int, int]] | None = None,
        trace_size: int = 0,
    ) -> None:
        dependencies = list(operator_mlir_map.values())
        super().__init__(filename, dependencies)
        self.operator_mlir_map = operator_mlir_map
        self.runlist = runlist
        self.subbuffer_layout = subbuffer_layout
        self.buffer_sizes = buffer_sizes
        self.slice_info = slice_info or {}
        # Bytes of trace buffer per runlist step, 0 for an untraced build.
        self.trace_size = trace_size


# Helper Functions
# ##########################################################################


def extract_runtime_sequence_arg_types(dev_op: Any) -> list[Any]:
    """MLIR helper: Extract argument types from a device operation's runtime sequence."""
    for nested_op in dev_op.body_region.blocks[0].operations:
        op_name = nested_op.operation.name
        if op_name == "aie.runtime_sequence":
            if hasattr(nested_op, "body") and hasattr(nested_op.body, "blocks"):
                if len(nested_op.body.blocks) > 0:
                    entry_block = nested_op.body.blocks[0]
                    arg_types = [
                        entry_block.arguments[i].type
                        for i in range(len(entry_block.arguments))
                    ]
                    return arg_types
    raise RuntimeError("Could not find runtime sequence in device operation")


def get_child_mlir_module(mlir_artifact: PythonGeneratedMLIRArtifact) -> Any:
    """Extract MLIR module from a PythonGeneratedMLIRArtifact.

    Uses the artifact's DesignGenerator to dynamically import the design
    module and call the callback, returning the raw (non-stringified) MLIR
    module object for further inspection by the fusion pass.
    """
    if not isinstance(mlir_artifact, PythonGeneratedMLIRArtifact):
        raise TypeError(
            f"Expected PythonGeneratedMLIRArtifact, got {type(mlir_artifact).__name__}"
        )
    gen = mlir_artifact.generator
    spec = importlib.util.spec_from_file_location(gen.source_path.name, gen.source_path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    callback_function = getattr(module, gen.fn_name)
    return callback_function(*gen.args, **gen.kwargs)


def _entry_windows(slice_info, subbuffer_layout, buffer_names: tuple[str, ...]):
    """Each buffer's absolute (kind, offset, length) in its consolidated buffer."""
    windows = []
    for name in buffer_names:
        if name in slice_info:
            base, start, end = slice_info[name]
            kind, parent_offset, _ = subbuffer_layout[base]
            windows.append((kind, parent_offset + start, end - start, base, start))
        else:
            kind, offset, length = subbuffer_layout[name]
            windows.append((kind, offset, length, name, 0))
    return windows


def find_replicated_runs(runlist, slice_info, subbuffer_layout):
    """Maximal runs of one design over uniformly advancing windows, as fold candidates.

    N consecutive entries of the same design whose buffer windows advance by one
    constant step per argument -- the window's own length, or zero for an operand
    every run rereads -- are one iterated run. A design is foldable only when every
    appearance folds the same way: the rewrite is per design, and one device cannot
    iterate two different shapes.
    """
    groups: list[tuple[int, int]] = []
    start = 0
    for i in range(1, len(runlist) + 1):
        if i == len(runlist) or runlist[i][0] != runlist[start][0]:
            groups.append((start, i))
            start = i
    candidates: dict[str, tuple[int, tuple[int, ...]]] = {}
    spans: dict[str, list[tuple[int, int]]] = {}
    for lo, hi in groups:
        op_name = runlist[lo][0]
        n = hi - lo
        if n < 2:
            candidates.setdefault(op_name, None)
            spans.setdefault(op_name, []).append((lo, hi))
            continue
        rows = [
            _entry_windows(slice_info, subbuffer_layout, runlist[i][1:])
            for i in range(lo, hi)
        ]
        deltas: list[int] = []
        for pos in range(len(rows[0])):
            lengths = {row[pos][2] for row in rows}
            steps = {rows[i + 1][pos][1] - rows[i][pos][1] for i in range(n - 1)}
            if len(lengths) != 1 or len(steps) != 1:
                deltas = []
                break
            (length,), (step,) = lengths, steps
            if step not in (0, length):
                deltas = []
                break
            deltas.append(step)
        shape = (n, tuple(deltas)) if deltas else None
        if op_name in candidates and candidates[op_name] != shape:
            shape = None
        candidates[op_name] = shape
        spans.setdefault(op_name, []).append((lo, hi))
    return {
        name: (shape, spans[name])
        for name, shape in candidates.items()
        if shape is not None and all(hi - lo == shape[0] for lo, hi in spans[name])
    }


def replicate_sequence(
    dev_op: Any, n: int, deltas_bytes: tuple[int, ...], itemsize: int
) -> bool:
    """Iterate a design's runtime sequence ``n`` times, one argument stride per step.

    Every shim task's leading transfer dimension carries the step: it must be free
    (extent one, stride zero) or the design already spends it, and then nothing here
    changes. The argument types widen to the whole span.
    """
    with dev_op.operation.context, ir.Location.unknown():
        seq_op = None
        for nested in dev_op.operation.regions[0].blocks[0].operations:
            if nested.operation.name == "aie.runtime_sequence":
                seq_op = nested
                break
        if seq_op is None:
            return False
        block = seq_op.operation.regions[0].blocks[0]
        if len(block.arguments) != len(deltas_bytes):
            return False
        bds = []
        for op in seq_op.operation.regions[0].blocks[0].operations:
            regions = op.operation.regions
            for inner in regions[0].blocks[0].operations if len(regions) else ():
                if inner.operation.name == "aie.dma_bd":
                    sizes = list(
                        ir.DenseI64ArrayAttr(inner.operation.attributes["static_sizes"])
                    )
                    strides = list(
                        ir.DenseI64ArrayAttr(
                            inner.operation.attributes["static_strides"]
                        )
                    )
                    if len(sizes) != 4 or sizes[0] != 1 or strides[0] != 0:
                        return False
                    arg_index = None
                    for i, arg in enumerate(block.arguments):
                        if inner.operation.operands[0] == arg:
                            arg_index = i
                            break
                    if arg_index is None:
                        return False
                    bds.append((inner.operation, sizes, strides, arg_index))
        for op, sizes, strides, arg_index in bds:
            sizes[0] = n
            strides[0] = deltas_bytes[arg_index] // itemsize
            op.attributes["static_sizes"] = ir.DenseI64ArrayAttr.get(sizes)
            op.attributes["static_strides"] = ir.DenseI64ArrayAttr.get(strides)
            task = op.parent
            assert task.name == "aiex.dma_configure_task_for"
            task.attributes["repeat_count"] = ir.IntegerAttr.get(
                ir.IntegerType.get_signless(32), n - 1
            )
        for i, arg in enumerate(block.arguments):
            if deltas_bytes[i] == 0:
                continue
            old_type = ir.MemRefType(arg.type)
            new_shape = [old_type.shape[0] * n, *old_type.shape[1:]]
            arg.set_type(ir.MemRefType.get(new_shape, old_type.element_type))
        return True


def fold_runlist(
    runlist, slice_info, subbuffer_layout, folded: dict
) -> list[tuple[str, ...]]:
    """The runlist with each folded span replaced by its one whole-span entry.

    The span entries' slice names are registered in ``slice_info`` in place, so the
    callable resolves them like any other slice.
    """
    replaced: list[tuple[str, ...]] = []
    i = 0
    while i < len(runlist):
        op_name, *buffer_names = runlist[i]
        if op_name not in folded:
            replaced.append(runlist[i])
            i += 1
            continue
        (n, deltas), _ = folded[op_name]
        windows = _entry_windows(slice_info, subbuffer_layout, tuple(buffer_names))
        span_names = []
        for pos, name in enumerate(buffer_names):
            if deltas[pos] == 0:
                span_names.append(name)
                continue
            _, _, length, base, start = windows[pos]
            span_name = f"{base}[{start}:{start + n * length}]#folded"
            slice_info[span_name] = (base, start, start + n * length)
            span_names.append(span_name)
        replaced.append((op_name, *span_names))
        i += n
    return replaced


def needs_additional_reset(runlist: list[Any]) -> bool:
    """Whether the sequence must configure one more device than the runlist asks for.

    ``aiecc --expand-load-pdis`` marks each configure point by loading one of two
    otherwise empty PDIs, alternating between them from a fixed start. A load of the
    PDI already loaded has no effect, so a sequence with an odd number of configure
    points ends on the one the next dispatch starts with, and that dispatch
    reconfigures over the state the last design left. Configuring one more device
    makes the count even. Consecutive entries running the same operator share a
    configure point.
    """
    points = 0
    previous = None
    for op_name, *_ in runlist:
        if op_name != previous:
            points += 1
            previous = op_name
    return points % 2 == 1


def fuse_mlir(artifact: SequenceMLIRArtifact) -> None:
    """Fuse multiple MLIR modules by inlining their device operations and adding a new main device and runtime sequence that call into sequence of operations based on a runlist."""

    input_buffer_size, output_buffer_size, scratch_buffer_size = artifact.buffer_sizes

    # Extract device operations and module-level parameter decls from each
    # operator's MLIR artifact.  Note: in the current MLIR-AIE pipeline,
    # ``aiex.scratchpad_parameter`` ops are emitted at *module* scope (above the
    # ``aie.device``), because the scratchpad is a single hardware resource
    # shared across all PDIs in a runlist and the verifier on
    # ``aiex.read_scratchpad_parameter`` requires the decl to be visible at module
    # scope.  We collect those module-level decls per-operator so we can
    # re-declare them once at the top of the fused module.
    device_mlir_strings = {}
    operator_param_decls: dict[str, dict[str, ir.Type]] = {}
    device_ty = None
    sequence_arg_types = {}
    # A traced sequence carries a trailing buffer no window advances over, so folding
    # stays out of its way.
    # IRON_ABLATE_FLOW keeps the unfolded per-entry runs, as the A/B arm of the
    # ablation study.
    folded = (
        {}
        if artifact.trace_size or os.environ.get("IRON_ABLATE_FLOW")
        else find_replicated_runs(
            artifact.runlist, artifact.slice_info, artifact.subbuffer_layout
        )
    )
    fold_itemsize = np.dtype(ml_dtypes.bfloat16).itemsize
    for op_name, mlir_artifact in artifact.operator_mlir_map.items():
        mlir_module = get_child_mlir_module(mlir_artifact)
        device_ops = []
        params_here: dict[str, ir.Type] = {}
        for op in mlir_module.body.operations:
            if isinstance(op, aie.DeviceOp):
                device_ops.append(op)
            elif op.operation.name == "aiex.scratchpad_parameter":
                sym_name = ir.StringAttr(op.operation.attributes["sym_name"]).value
                param_type = ir.TypeAttr(op.operation.attributes["type"]).value
                params_here[sym_name] = param_type
        if len(device_ops) != 1:
            raise ValueError(
                f"Expected exactly one device operation in MLIR artifact for operator '{op_name}', "
                f"got {len(device_ops)}"
            )
        device_op = device_ops[0]
        if op_name in folded:
            (n, deltas), _ = folded[op_name]
            if not replicate_sequence(device_op, n, deltas, fold_itemsize):
                del folded[op_name]
        if device_ty is None:
            device_ty = device_op.device
        device_mlir_strings[op_name] = str(device_op)
        operator_param_decls[op_name] = params_here
        sequence_arg_types[op_name] = extract_runtime_sequence_arg_types(device_op)
    runlist = (
        fold_runlist(
            artifact.runlist, artifact.slice_info, artifact.subbuffer_layout, folded
        )
        if folded
        else artifact.runlist
    )

    # Deduplicate parameter decls across operators (same name must have the
    # same type; otherwise indices would collide in the global state table).
    hoisted_params: dict[str, ir.Type] = {}
    for op_name, params_here in operator_param_decls.items():
        for sym_name, param_type in params_here.items():
            existing = hoisted_params.get(sym_name)
            if existing is not None and str(existing) != str(param_type):
                raise ValueError(
                    f"ScratchpadParameter '{sym_name}' is declared with conflicting "
                    f"types across operators: {existing} vs {param_type}"
                )
            hoisted_params[sym_name] = param_type

    # Build fused MLIR module
    with mlir_mod_ctx() as ctx:

        # Emit hoisted parameters first.
        with ir.InsertionPoint.at_block_begin(ctx.module.body):
            for sym_name, param_type in hoisted_params.items():
                aiex.scratchpad_parameter(sym_name, param_type)

        # Concatenate aie.device ops.
        params_preamble = "\n".join(
            f"  aiex.scratchpad_parameter @{name} : {param_type}"
            for name, param_type in hoisted_params.items()
        )
        for op_name, device_str in device_mlir_strings.items():
            wrapped = f"module {{\n{params_preamble}\n{device_str}\n}}"
            wrapper_module = ir.Module.parse(wrapped)
            # Find the (sole) DeviceOp in the wrapper module.
            dev_op = None
            for op in wrapper_module.body.operations:
                if isinstance(op, aie.DeviceOp):
                    dev_op = op
                    break
            assert (
                dev_op is not None
            ), f"DeviceOp missing after re-parse for operator '{op_name}'"
            dev_op.sym_name = ir.StringAttr.get(op_name)
            ctx.module.body.append(dev_op)

        needs_reset = needs_additional_reset(runlist)
        if needs_reset:

            @aie.device(device_ty)
            def reset():
                @aiex.runtime_sequence()
                def sequence():
                    pass

            reset.operation.attributes["sym_name"] = ir.StringAttr.get(RESET_DEVICE)

        # Create the main device -- this contains the runtime sequence calling into the other devices
        @aie.device(device_ty)
        def main():
            buf_dtype = np.dtype[
                ml_dtypes.bfloat16
            ]  # TODO: support for other data types
            itemsize = np.dtype(ml_dtypes.bfloat16).itemsize

            # RuntimeSequenceOp
            trace_size = artifact.trace_size
            # IRON_TRACE_OP names a runlist position; design sharing renumbers the
            # generated devices, so the position is resolved to the design it runs.
            traced = os.environ.get("IRON_TRACE_OP") or None
            if traced and (match := re.match(r"op(\d+)_", traced)):
                traced = artifact.runlist[int(match.group(1))][0]
            consolidated_idx, trace_slots, n_args = trace_argument_layout(
                {name: len(sequence_arg_types[name]) for name, *_ in runlist},
                trace_size,
                traced,
            )
            trace_indices = sorted(set(trace_slots.values()))

            sizes = dict(
                zip(
                    consolidated_idx,
                    (input_buffer_size, output_buffer_size, scratch_buffer_size),
                )
            )
            arg_types = [
                (
                    np.ndarray[(max(1, trace_size),), np.dtype[np.int8]]
                    if i in trace_indices
                    else np.ndarray[(max(1, sizes.get(i, 0) // itemsize),), buf_dtype]
                )
                for i in range(n_args)
            ]

            @aiex.runtime_sequence(*arg_types)
            def sequence(*all_bufs):
                input_buf, output_buf, scratch_buf = (
                    all_bufs[i] for i in consolidated_idx
                )
                consolidated_buffers = {
                    "input": input_buf,
                    "output": output_buf,
                    "scratch": scratch_buf,
                }

                # Execute operations in runlist order
                configure_op = None
                last_op_name = None
                for op_name, *buffer_names in runlist:
                    expected_arg_types = sequence_arg_types[op_name]

                    # Avoid reconfiguring altogether if the same op is called multiple times consecutively
                    if configure_op is None or op_name != last_op_name:
                        # Configure Op
                        configure_sym_ref_attr = ir.FlatSymbolRefAttr.get(op_name)
                        configure_op = aiex.ConfigureOp(
                            configure_sym_ref_attr
                        )  # TODO: optimization -- if previous op was in the same device, skip reconfiguration
                        configure_body = configure_op.body.blocks.append()
                        last_op_name = op_name

                    with ir.InsertionPoint(configure_body):

                        # For each buffer, add subview and reinterpret_cast ops
                        buffer_ssa_values = []
                        for idx, buf_name in enumerate(buffer_names):
                            # Check if this is a sliced buffer
                            if buf_name in artifact.slice_info:
                                base_name, start, end = artifact.slice_info[buf_name]
                                # Get parent buffer info
                                buf_type, parent_offset, parent_length = (
                                    artifact.subbuffer_layout[base_name]
                                )
                                # Calculate actual offset and length for slice
                                offset = parent_offset + start
                                length = end - start
                            else:
                                # Regular buffer
                                buf_type, offset, length = artifact.subbuffer_layout[
                                    buf_name
                                ]

                            # Subview Op
                            consolidated_buf = consolidated_buffers[buf_type]
                            offset_elements = offset // itemsize
                            size_elements = length // itemsize
                            subview = memref.subview(
                                consolidated_buf,
                                [offset_elements],
                                [size_elements],
                                [1],
                            )

                            # Reinterpret_cast Op
                            target_type = expected_arg_types[idx]
                            expected_memref = ir.MemRefType(target_type)
                            target_shape = [
                                expected_memref.shape[i]
                                for i in range(expected_memref.rank)
                            ]
                            expected_size = np.prod(target_shape)
                            assert (
                                expected_size == size_elements
                            ), f"Size mismatch for buffer '{buf_name}': MLIR runtime sequence expected {expected_size}, Python fused operator provided {size_elements}"
                            strides = []
                            stride = 1
                            for dim in reversed(target_shape):
                                strides.insert(0, stride)
                                stride *= dim
                            result_type = ir.MemRefType.get(
                                target_shape, ir.BF16Type.get()
                            )
                            reinterpreted = memref.reinterpret_cast(
                                result=result_type,
                                source=subview,
                                offsets=[],
                                sizes=[],
                                strides=[],
                                static_offsets=[0],
                                static_sizes=target_shape,
                                static_strides=strides,
                            )
                            buffer_ssa_values.append(reinterpreted)

                        # Trace lowering appends a buffer to the callee's signature.
                        if op_name in trace_slots:
                            buffer_ssa_values.append(all_bufs[trace_slots[op_name]])

                        # Run Op
                        sequence_sym_ref_attr = ir.FlatSymbolRefAttr.get("sequence")
                        run_op = aiex.RunOp(sequence_sym_ref_attr, buffer_ssa_values)

                if needs_reset:
                    reset_op = aiex.ConfigureOp(ir.FlatSymbolRefAttr.get(RESET_DEVICE))
                    reset_op.body.blocks.append()

        # Write the fused MLIR to file
        with open(artifact.filename, "w") as f:
            f.write(str(ctx.module))


# Compilation Rules
# ##########################################################################


class ReplicatedMLIRArtifact(MLIRArtifact):
    """A design module with its runtime sequence iterated over a folded span."""

    def __init__(
        self,
        filename: str,
        source: PythonGeneratedMLIRArtifact,
        n: int,
        deltas_bytes: tuple[int, ...],
    ):
        super().__init__(filename, dependencies=[source])
        self.source = source
        self.n = n
        self.deltas_bytes = deltas_bytes


def write_replicated_mlir(artifact: ReplicatedMLIRArtifact) -> None:
    mlir_module = get_child_mlir_module(artifact.source)
    itemsize = np.dtype(ml_dtypes.bfloat16).itemsize
    device_op = next(
        op for op in mlir_module.body.operations if isinstance(op, aie.DeviceOp)
    )
    if not replicate_sequence(device_op, artifact.n, artifact.deltas_bytes, itemsize):
        raise ValueError(
            f"design {artifact.source.filename} does not fold {artifact.n} ways"
        )
    with open(artifact.filename, "w") as f:
        f.write(str(mlir_module))


class ReplicateMLIRCompilationRule(CompilationRule):
    """Compilation rule that writes folded-span design modules."""

    def matches(self, graph: CompilationArtifactGraph) -> bool:
        return any(graph.get_worklist(ReplicatedMLIRArtifact))

    def compile(self, graph: CompilationArtifactGraph) -> list[CompilationCommand]:
        commands: list[CompilationCommand] = []
        for artifact in graph.get_worklist(ReplicatedMLIRArtifact):
            commands.append(
                PythonCallbackCompilationCommand(
                    partial(write_replicated_mlir, artifact)
                )
            )
            artifact.available = True
        return commands


class FusePythonGeneratedMLIRCompilationRule(CompilationRule):
    """Compilation rule that fuses multiple MLIR modules into one."""

    def matches(self, graph: CompilationArtifactGraph) -> bool:
        return any(graph.get_worklist(SequenceMLIRArtifact))

    def compile(self, graph: CompilationArtifactGraph) -> list[CompilationCommand]:
        commands: list[CompilationCommand] = []
        worklist = graph.get_worklist(SequenceMLIRArtifact)
        for artifact in worklist:
            callback = partial(fuse_mlir, artifact)
            commands.append(PythonCallbackCompilationCommand(callback))
            artifact.available = True
        return commands
