# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Loading stream-dse generated designs into IRON.

Everything here is independent of which operator generated the design, so a
stream-backed operator's own module holds only its workload, its mapping and the
dimensions they are built for. ``iron/tests/stream/groups.py`` fails a design module
that redefines any of these instead of importing them.
"""

import hashlib
import os
import re
from functools import lru_cache
from pathlib import Path

__all__ = [
    "prefixed",
    "stream_revision",
    "region_module",
    "design_paths",
    "group_text",
    "digest",
    "trace_size",
    "trace_tiles",
    "traced_tiles",
    "traced_ports",
]

# A memory tile's trace packet type, and the event slots one trace unit has.
_MEMTILE_PACKET = 3
_EVENT_SLOTS = 8


@lru_cache(maxsize=None)
def stream_revision() -> str:
    """Token for the installed stream package, which nothing else in the build observes.

    A design is cached under its experiment id and rebuilt from the mtime of its own
    ``stream_design.py``, so without this a stream-side change is served the design from
    before it. Mtimes rather than the checkout's commit: an edit that is not committed
    yet is exactly the case that goes unnoticed.
    """
    import stream

    root = Path(stream.__file__).parent
    stamps = sorted(
        (str(path.relative_to(root)), path.stat().st_mtime_ns)
        for path in root.rglob("*.py")
    )
    return hashlib.sha256(f"{stream.__version__}{stamps}".encode()).hexdigest()[:8]


def prefixed(mlir_text: str, func_prefix: str) -> str:
    """Apply a fused-operator ``func_prefix`` (``op<idx>_``) to a group's MLIR.

    ``OperatorSequence`` renames each child's kernel object files and symbols so the
    groups stay distinct inside one ELF; the group's MLIR must reference the same
    prefixed names. Longest symbol first, so one symbol cannot prefix another.
    """
    if not func_prefix:
        return mlir_text
    mlir_text = re.sub(
        r'link_with\s*=\s*"([^"]+)"',
        lambda match: f'link_with = "{func_prefix}{match.group(1)}"',
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

    ``OperatorSequence`` consumes ``aie.DeviceOp`` objects, so the xDSL-emitted group
    text is re-parsed with the mlir-aie bindings, after ``func_prefix`` rewriting.
    """
    from aie import ir
    from aie.extras.context import mlir_mod_ctx

    with mlir_mod_ctx():
        return ir.Module.parse(prefixed(mlir_text, func_prefix))


def design_paths(output_dir: str, n_groups: int) -> list[str]:
    """Where stream-dse writes each fused group's MLIR."""
    return [
        os.path.join(output_dir, f"group_{index}", "codegen", "final.mlir")
        for index in range(n_groups)
    ]


def group_text(group_index: int, paths: list[str], generate) -> str:
    """One group's generated MLIR, generating the whole design first if any is missing.

    Every group loader calls this; the first generates the design and the rest read the
    files it wrote.
    """
    if not all(os.path.exists(path) for path in paths):
        generate()
    text = Path(paths[group_index]).read_text()
    ports = traced_ports()
    return _watch_dma_ports(text, ports) if ports else text


def _watch_dma_ports(mlir_text: str, ports) -> str:
    """The design with every traced memory tile counting cycles its DMA ``ports`` run, in
    place of the DMA events stream gives it, which name no channel."""
    from aie import ir
    from aie.dialects import aie
    from aie.extras.context import mlir_mod_ctx

    with mlir_mod_ctx():
        module = ir.Module.parse(mlir_text)
        for device in module.body.operations:
            for trace in device.regions[0].blocks[0].operations:
                if trace.operation.name != "aie.trace":
                    continue
                body = trace.regions[0].blocks[0]
                ops = {op.operation.name: op for op in body.operations}
                packet = ops.get("aie.trace.packet")
                if packet is None or (
                    ir.IntegerAttr(packet.operation.attributes["type"]).value
                    != _MEMTILE_PACKET
                ):
                    continue
                for op in list(body.operations):
                    if op.operation.name == "aie.trace.event":
                        op.operation.erase()
                with ir.InsertionPoint(ops["aie.trace.start"]):
                    for slot, (direction, channel) in enumerate(ports):
                        aie.trace_port(
                            slot,
                            aie.WireBundle.DMA,
                            channel,
                            getattr(aie.DMAChannelDir, direction),
                        )
                    for slot in range(_EVENT_SLOTS):
                        aie.trace_event(
                            f"PORT_RUNNING_{slot}" if slot < len(ports) else "NONE"
                        )
        return str(module)


def digest(mlir_text: str) -> str:
    """Digest of a group's design, for recognising groups that share one."""
    return hashlib.sha256(mlir_text.encode()).hexdigest()


def trace_size() -> int:
    """DDR trace buffer in bytes, 0 for an untraced build.

    Opt-in: tracing adds a runtime-sequence argument, so it changes the ABI.
    """
    return int(os.environ.get("IRON_TRACE_SIZE", "0"))


def trace_tiles() -> int:
    """How many tiles to trace. Routing, not the packet id space, is the real limit."""
    return int(os.environ.get("IRON_TRACE_NTILES", "4"))


def traced_ports() -> tuple[tuple[str, int], ...]:
    """The DMA ports a traced memory tile watches, from ``IRON_TRACE_PORTS="S2MM:0,MM2S:0"``,
    eight at most; empty keeps the events stream gives it."""
    spec = os.environ.get("IRON_TRACE_PORTS", "")
    ports = tuple(
        (direction, int(channel))
        for direction, channel in (port.split(":") for port in spec.split(",") if port)
    )
    if len(ports) > _EVENT_SLOTS:
        raise ValueError(f"a trace unit watches {_EVENT_SLOTS} ports, not {len(ports)}")
    return ports


def traced_tiles() -> tuple[tuple[int, int], ...]:
    """The (column, row) tiles to trace, from ``IRON_TRACE_TILES="col,row;col,row"``; empty
    leaves the choice to stream. A memory tile in the list is traced at its DMA."""
    spec = os.environ.get("IRON_TRACE_TILES", "")
    return tuple(
        tuple(int(v) for v in tile.split(",")) for tile in spec.split(";") if tile
    )
