#!/usr/bin/env python3
# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""A stream-dse design is generated one module per fused group, and a group fails on
its own: a split that does not match its cores, two layers landing on one core, a
kernel with no binding. Checked as one design the first failure hides every later
group, so these checks run per group and report which of them hold.

The checks read a mapping and a generated module rather than a design module, so a
stream-backed operator joins by adding a row to :data:`DESIGNS`.
"""

import inspect
import math
import re
from collections.abc import Collection
from pathlib import Path

import pytest
import yaml

pytest.importorskip(
    "stream", reason="stream-dse not installed (see requirements_stream.txt)"
)

import aie.utils as aie_utils  # noqa: E402
from aie.iron.device import NPU2  # noqa: E402

aie_utils.set_current_device(NPU2())

from iron.operators.mha_prefill_stream import stream_design as mha  # noqa: E402
from iron.operators.swiglu_prefill_stream import stream_design as swiglu  # noqa: E402

# Stream-backed operators these checks cover, as (design module, dimensions, the group
# counts it is built for).
DESIGNS = {
    "swiglu": (swiglu, (256, 512, 2048), (1, 2, 5)),
    "mha": (mha, (256, 64), (mha.LAYER_BY_LAYER,)),
}


def _cores(layer: dict) -> list[int]:
    return layer["core_allocation"][0]


def layer_findings(layer: dict) -> list[str]:
    """Why this layer cannot be lowered, one finding each. Empty means it can."""
    name, cores = layer["name"], _cores(layer)
    tiling = layer.get("inter_core_tiling") or [[]]
    findings = []
    if len(tiling) > 1:
        findings.append(f"{name} offers {len(tiling)} tilings, only the first is read")
    split = math.prod(entry["split"] for entry in tiling[0])
    if split != len(cores):
        # SpatialUnrollPass zips the spatial indices against the cores with strict=True.
        findings.append(f"{name} splits {split} ways across {len(cores)} cores")
    if len(set(cores)) != len(cores):
        findings.append(f"{name} repeats a core id")
    if not (layer.get("kernel") or {}).get("name"):
        findings.append(f"{name} names no kernel")
    return findings


def group_findings(mapping: dict, index: int) -> list[str]:
    """Why the fused group at ``index`` cannot be lowered."""
    layers = {layer["name"]: layer for layer in mapping["layers"]}
    group = mapping["fused_groups"][index]
    findings, owner = [], {}
    for name in group["layers"]:
        layer = layers.get(name)
        if layer is None:
            findings.append(f"{group['name']} names unmapped layer {name}")
            continue
        findings += layer_findings(layer)
        for core in _cores(layer):
            # IterationSpaceToFor supports one compute node per core.
            if core in owner:
                findings.append(f"core {core} runs both {owner[core]} and {name}")
            owner[core] = name
    for entry in group["intra_core_tiling"]:
        if str(entry["dim"]).split(".")[0] not in group["layers"]:
            findings.append(f"{group['name']} tiles {entry['dim']} from another group")
    return findings


def design_findings(mlir: str, objects: Collection[str] | None = None) -> list[str]:
    """Why the generated module will not link. ``objects`` are the kernel objects the
    operator builds, when the caller knows them."""
    called = set(re.findall(r"func\.call @([A-Za-z0-9_]+)", mlir))
    declared = set(re.findall(r"func\.func private @([A-Za-z0-9_]+)", mlir))
    findings = [f"calls undeclared {name}" for name in sorted(called - declared)]
    if objects is not None:
        linked = set(re.findall(r'link_with\s*=\s*"([^"]+)"', mlir))
        findings += [f"links unbuilt {name}" for name in sorted(linked - set(objects))]
    return findings


# One tile's DMA channels, as AIE2TargetModel reports them for WireBundle::DMA.
DMA_CHANNELS = {0: 2, 1: 6}  # shim row, memory row; every other row is a compute tile
COMPUTE_DMA_CHANNELS = 2

_TILE = re.compile(r"%(\d+)\s*=\s*aie\.tile\((\d+),\s*(\d+)\)")
_FIFO = re.compile(r"aie\.objectfifo @(\S+?)\((%\d+)(.*?),\s*\{([^}]*)\}")


def dma_findings(mlir: str) -> list[str]:
    """Tiles the generated design asks for more DMA channels than they have.

    aiecc reports this as ``number of input DMA channel exceeded`` against a tile, with
    nothing tying it back to the mapping that chose it, so it is checked here instead. A
    fifo with one consumer, no layout transform and a neighbouring tile stays in the memory
    the two already share and costs no channel; every other fifo spends one on the producer
    and one on each consumer.
    """
    tiles = {f"%{m[1]}": (int(m[2]), int(m[3])) for m in _TILE.finditer(mlir)}
    seen = 0
    incoming: dict[tuple[int, int], int] = {}
    outgoing: dict[tuple[int, int], int] = {}
    for line in mlir.splitlines():
        found = _FIFO.search(line)
        if not found:
            continue
        _, producer, between, consumers = found.groups()
        reached = [c for c in re.findall(r"%\d+", consumers) if c in tiles]
        if producer not in tiles or not reached:
            continue
        seen += 1
        source = tiles[producer]
        transformed = "dimensionsToStream" in between or "dimensionsFromStream" in line
        if (
            len(reached) == 1
            and not transformed
            and _neighbours(source, tiles[reached[0]])
        ):
            continue
        outgoing[source] = outgoing.get(source, 0) + 1
        for consumer in reached:
            incoming[tiles[consumer]] = incoming.get(tiles[consumer], 0) + 1
    # A design with no fifo at all means the syntax moved under this check, not that
    # the design is clean: without this it reports nothing and the assert passes.
    findings = (
        [] if seen else ["no object fifos found; this check no longer reads the IR"]
    )
    for tile in sorted(set(incoming) | set(outgoing)):
        limit = DMA_CHANNELS.get(tile[1], COMPUTE_DMA_CHANNELS)
        for direction, spent in (
            ("in", incoming.get(tile, 0)),
            ("out", outgoing.get(tile, 0)),
        ):
            if spent > limit:
                findings.append(
                    f"tile{tile} takes {spent} {direction} DMA channels of {limit}"
                )
    return findings


def _neighbours(one: tuple[int, int], other: tuple[int, int]) -> bool:
    """Two compute tiles that share a memory module, per ``isLegalMemAffinity``."""
    if one[1] < 2 or other[1] < 2:
        return False
    return abs(one[0] - other[0]) + abs(one[1] - other[1]) == 1


# Implementation details that belong to iron.common.stream, and the helper each one
# shows was copied rather than imported.
COPIED_PLUMBING = {
    "mlir_mod_ctx": "region_module",
    "hashlib": "digest",
    "IRON_TRACE_SIZE": "trace_size",
    "IRON_TRACE_NTILES": "trace_tiles",
    "final.mlir": "design_paths",
    "get_current_device": "array",
    r"func\.func\s+private": "prefixed",
}


@pytest.mark.parametrize("operator", sorted(DESIGNS))
def test_design_module_imports_the_shared_helpers(operator):
    source = Path(inspect.getfile(DESIGNS[operator][0])).read_text()
    copied = sorted({h for marker, h in COPIED_PLUMBING.items() if marker in source})
    assert not copied, (
        f"{operator}/stream_design.py reimplements {copied}; "
        "import them from iron.common.stream"
    )


def _cases():
    for operator, (design, dims, counts) in DESIGNS.items():
        for k in counts:
            for index in range(k):
                yield pytest.param(
                    design, dims, k, index, id=f"{operator}-k{k}-group{index}"
                )


CASES = list(_cases())


@pytest.mark.parametrize("design, dims, k, index", CASES)
def test_group_maps_onto_its_cores(design, dims, k, index, tmp_path):
    _, mapping_path = design.build_inputs(*dims, output_dir=str(tmp_path), k=k)
    with open(mapping_path) as handle:
        mapping = yaml.safe_load(handle)
    assert group_findings(mapping, index) == []


@pytest.mark.parametrize("design, dims, k, index", CASES)
def test_generated_group_resolves_its_kernels(design, dims, k, index):
    path = design._design_paths(*dims, k=k)[index]
    try:
        with open(path) as handle:
            mlir = handle.read()
    except FileNotFoundError:
        pytest.skip("design not generated")
    assert design_findings(mlir) == []


def test_a_design_config_reads_the_environment_it_is_not_given(monkeypatch):
    """The sweep hooks are the config's defaults, so a harness that sets the environment
    and passes no config still gets the design it asks for."""
    monkeypatch.setenv("IRON_FUSED_COLUMNS", "2")
    monkeypatch.setenv("IRON_FUSED_ROWS", "0|13|2")
    cfg = mha.DesignConfig.from_environment()
    assert (cfg.fused_columns, cfg.fused_rows) == (2, "0|13|2")
    assert mha.DesignConfig() == mha.DesignConfig(flash_query=64, fused_columns=4)


def test_two_configs_give_two_designs_in_one_process(tmp_path):
    """A config is a value the operator carries, not module state: neither of these
    fixes the other, which constants read from the environment at import could not."""
    mappings = []
    for columns in (2, 4):
        cfg = mha.DesignConfig(fused_columns=columns)
        _, path = mha.build_inputs(
            256, 64, output_dir=str(tmp_path / f"c{columns}"), k=1, flash=True, cfg=cfg
        )
        assert group_findings(yaml.safe_load(Path(path).read_text()), 0) == []
        mappings.append(Path(path).read_text())
    assert mappings[0] != mappings[1]


def test_the_fused_score_kernel_maps_onto_its_cores(tmp_path):
    """The fused score-and-softmax node is only reachable through a design config that
    asks for it, so the cases above generate the three-layer design, never this one."""
    cfg = mha.DesignConfig(fused_kernel=True)
    assert mha.group_layers(1, cfg) == [[mha.SCORE_SOFTMAX_NODE, mha.CONTEXT_NODE]]
    _, path = mha.build_inputs(
        256, 64, output_dir=str(tmp_path), k=1, flash=True, cfg=cfg
    )
    mapping = yaml.safe_load(Path(path).read_text())
    kernels = {layer["name"]: layer["kernel"]["name"] for layer in mapping["layers"]}
    assert kernels[mha.SCORE_SOFTMAX_NODE] == "matmul_softmax"
    assert group_findings(mapping, 0) == []


@pytest.mark.parametrize("design, dims, k, index", CASES)
def test_generated_group_fits_the_dma_channels_its_tiles_have(design, dims, k, index):
    path = design._design_paths(*dims, k=k)[index]
    try:
        with open(path) as handle:
            mlir = handle.read()
    except FileNotFoundError:
        pytest.skip("design not generated")
    assert dma_findings(mlir) == []
