# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Workload manifest: typed dataclasses + dict/file loader + Kahn topo + validate.

This module finalizes the DESIGN.md "Manifest schema (PLACEHOLDER)" into real,
typed Python and the graph machinery the Phase-2 executor (``StreamWorkload``,
02-02) consumes. It is **parse + logic only**: it imports no ``StreamFusedRegion``,
no XRT, and no stream-dse, mirroring :mod:`mlir_introspect` -- it is pure data +
graph logic.

Schema (mirrors DESIGN.md exactly)
----------------------------------

::

    regions:
      - id: region_0          # stable region identifier
        mlir: region_0.mlir   # one MLIR per fused region
        out_count: 1          # the per-region hint StreamFusedRegion already takes
        layers: [gate, up, down]   # workload layers fused into this region (PRESERVED)
    edges:
      - producer: { region: region_0, out: 0 }
        consumer: { region: region_1, in: 0 }
    io:
      inputs:  [{ name: x,      region: region_0, in: 0,  layout: row_major }]
      weights: [{ name: w_gate, region: region_0, in: 1,  layout: "K,N" }]
      outputs: [{ name: y,      region: region_last, out: 0, layout: row_major }]

The ``layers`` membership on each :class:`RegionSpec` is **retained, never
collapsed** (milestone Design Decision 4: the deferred reconfiguration-cost study
needs to know which layers live in which region/config, or that study becomes
impossible to run later).

The ``in`` / ``in_`` rename
---------------------------

``in`` is a Python keyword and cannot be a dataclass attribute name. The
:class:`Consumer` endpoint therefore stores its in-slot index as ``in_`` while the
loader reads the dict key ``"in"``. Read the dict key ``"in"``; read the attribute
``consumer.in_``.

Slot-index convention (02-02 follows this)
------------------------------------------

A slot index is an index into a region's ordered runtime arg-spec (the same order
as the ``aie.runtime_sequence``; see :mod:`mlir_introspect`). With ``n`` total args
and ``out_count`` outputs, the last ``out_count`` args are ``"out"``:

- An ``in`` slot (``consumer.in`` / io input/weight ``in``) is the 0-based index
  among the region's **input** arg positions, i.e. arg-spec indices
  ``0 .. n - out_count - 1``.
- An ``out`` slot (``producer.out`` / io output ``out``) is the 0-based index among
  the region's **output** arg positions: out index ``j`` maps to arg-spec index
  ``n - out_count + j``. This mapping lets 02-02's buffer sizing read the right
  arg-spec entry for an edge or output binding.

Deferred validation
--------------------

:func:`validate` here checks references, out-slot bounds (against ``out_count``,
which the manifest carries), in-slot non-negativity, single-feed, and acyclicity.
The **upper bound** on an in-slot index (``in < n - out_count``) is *not* checked
here: the input-slot count needs the region's MLIR/arg-spec, which is an executor
concern. 02-02 performs that arg-spec-aware bound check when it has the MLIR.
"""

from __future__ import annotations

import json
from collections import deque
from dataclasses import dataclass, field
from pathlib import Path


class ManifestError(ValueError):
    """Raised for any manifest load or validation failure."""


# --------------------------------------------------------------------------- #
# dataclasses
# --------------------------------------------------------------------------- #


@dataclass
class Producer:
    """An edge producer endpoint: region ``region`` output slot ``out``."""

    region: str
    out: int


@dataclass
class Consumer:
    """An edge consumer endpoint: region ``region`` input slot ``in_``.

    The attribute is ``in_`` because ``in`` is a Python keyword; the loader reads
    the dict key ``"in"``.
    """

    region: str
    in_: int


@dataclass
class Edge:
    """A producer -> consumer tensor dataflow edge between two regions."""

    producer: Producer
    consumer: Consumer


@dataclass
class RegionSpec:
    """A single fused region.

    Maps 1:1 to the per-region fields ``StreamFusedRegion`` consumes
    (``mlir`` + ``out_count``); ``id`` becomes the operator ``name_hint``.

    ``layers`` records which workload layers fused into this region and is
    **preserved verbatim, never collapsed** (Design Decision 4).
    """

    id: str
    mlir: str
    out_count: int = 1
    layers: list[str] = field(default_factory=list)


@dataclass
class IOBinding:
    """A workload tensor <-> region tensor-slot binding.

    ``slot`` is an ``in``/``out`` index per the slot-index convention in the module
    docstring; ``direction`` is ``"in"`` (inputs/weights) or ``"out"`` (outputs),
    set from which dict key (``"in"`` or ``"out"``) was present. ``layout`` is the
    explicit weight-layout/transpose convention and is required on every binding.
    """

    name: str
    region: str
    slot: int
    direction: str
    layout: str


@dataclass
class WorkloadIO:
    """The workload-level I/O bindings: inputs, weights, outputs."""

    inputs: list[IOBinding] = field(default_factory=list)
    weights: list[IOBinding] = field(default_factory=list)
    outputs: list[IOBinding] = field(default_factory=list)


@dataclass
class WorkloadManifest:
    """A complete workload: regions + inter-region edges + workload I/O."""

    regions: list[RegionSpec]
    edges: list[Edge]
    io: WorkloadIO


# --------------------------------------------------------------------------- #
# loader
# --------------------------------------------------------------------------- #


def _require(entry: dict, key: str, what: str) -> object:
    """Return ``entry[key]`` or raise a clear :class:`ManifestError`."""
    if key not in entry:
        raise ManifestError(f"{what} is missing required key '{key}': {entry!r}")
    return entry[key]


def _load_region(entry: dict) -> RegionSpec:
    region_id = _require(entry, "id", "region")
    mlir = _require(entry, "mlir", f"region '{region_id if 'id' in entry else '?'}'")
    out_count = entry.get("out_count", 1)
    layers = list(entry.get("layers", []))
    return RegionSpec(id=region_id, mlir=mlir, out_count=out_count, layers=layers)


def _load_edge(entry: dict) -> Edge:
    producer = _require(entry, "producer", "edge")
    consumer = _require(entry, "consumer", "edge")
    p = Producer(
        region=_require(producer, "region", "edge producer"),
        out=_require(producer, "out", "edge producer"),
    )
    c = Consumer(
        region=_require(consumer, "region", "edge consumer"),
        in_=_require(consumer, "in", "edge consumer"),
    )
    return Edge(producer=p, consumer=c)


def _load_io_binding(entry: dict, direction: str) -> IOBinding:
    name = _require(entry, "name", f"io {direction} binding")
    region = _require(entry, "region", f"io binding '{name}'")
    slot_key = "in" if direction == "in" else "out"
    slot = _require(entry, slot_key, f"io binding '{name}'")
    layout = _require(entry, "layout", f"io binding '{name}'")
    return IOBinding(
        name=name, region=region, slot=slot, direction=direction, layout=layout
    )


def load_manifest(data: dict) -> WorkloadManifest:
    """Build a :class:`WorkloadManifest` from a plain dict (strict).

    Raises :class:`ManifestError` (naming the offending entry) on any missing
    required key. ``out_count`` defaults to 1 and ``layers`` to ``[]``; every io
    binding must carry an explicit ``layout``.
    """
    if not isinstance(data, dict):
        raise ManifestError(f"manifest must be a dict, got {type(data).__name__}")

    raw_regions = _require(data, "regions", "manifest")
    if not isinstance(raw_regions, list) or not raw_regions:
        raise ManifestError("manifest 'regions' must be a non-empty list")
    regions = [_load_region(r) for r in raw_regions]

    edges = [_load_edge(e) for e in data.get("edges", [])]

    raw_io = data.get("io", {}) or {}
    io = WorkloadIO(
        inputs=[_load_io_binding(b, "in") for b in raw_io.get("inputs", [])],
        weights=[_load_io_binding(b, "in") for b in raw_io.get("weights", [])],
        outputs=[_load_io_binding(b, "out") for b in raw_io.get("outputs", [])],
    )

    return WorkloadManifest(regions=regions, edges=edges, io=io)


def load_manifest_file(path: "str | Path") -> WorkloadManifest:
    """Read a manifest file (``.json`` or ``.yaml``/``.yml``) and load it.

    YAML support is optional: PyYAML is imported inside this function and a clear
    :class:`ManifestError` is raised if it is absent for a ``.yaml`` file. An
    unknown extension is rejected.
    """
    path = Path(path)
    suffix = path.suffix.lower()

    if suffix == ".json":
        data = json.loads(path.read_text())
    elif suffix in (".yaml", ".yml"):
        try:
            import yaml  # type: ignore
        except ImportError as exc:  # pragma: no cover - exercised only without PyYAML
            raise ManifestError(
                f"loading '{path}' requires PyYAML; install it (pip install pyyaml) "
                f"or use a .json manifest instead"
            ) from exc
        data = yaml.safe_load(path.read_text())
    else:
        raise ManifestError(
            f"unknown manifest extension '{suffix}' for '{path}'; "
            f"use .json, .yaml, or .yml"
        )

    return load_manifest(data)


# --------------------------------------------------------------------------- #
# topological order (Kahn)
# --------------------------------------------------------------------------- #


def topo_order(manifest: WorkloadManifest) -> list[str]:
    """Return region ids in a valid topological order (Kahn's algorithm).

    The dependency graph is derived from ``edges``: ``producer.region`` precedes
    ``consumer.region``. The in-degree-0 queue is seeded in ``regions[]``
    declaration order for determinism, so a no-edge manifest yields regions in
    declaration order (and a k=1 manifest returns its single region id).

    Raises :class:`ManifestError` (naming the regions still in the graph) if a
    cycle prevents a complete ordering.
    """
    region_ids = [r.id for r in manifest.regions]
    in_degree: dict[str, int] = {rid: 0 for rid in region_ids}
    successors: dict[str, list[str]] = {rid: [] for rid in region_ids}

    for edge in manifest.edges:
        src = edge.producer.region
        dst = edge.consumer.region
        # Skip self/dangling-aware bookkeeping here; reference validity is a
        # validate() concern. Only count edges between known regions so topo
        # ordering is well-defined; unknown regions surface in validate().
        if src not in in_degree or dst not in in_degree:
            continue
        successors[src].append(dst)
        in_degree[dst] += 1

    queue = deque(rid for rid in region_ids if in_degree[rid] == 0)
    order: list[str] = []
    while queue:
        rid = queue.popleft()
        order.append(rid)
        for nxt in successors[rid]:
            in_degree[nxt] -= 1
            if in_degree[nxt] == 0:
                queue.append(nxt)

    if len(order) != len(region_ids):
        remaining = [rid for rid in region_ids if rid not in order]
        raise ManifestError(
            f"cycle detected among regions: {remaining}"
        )

    return order


# --------------------------------------------------------------------------- #
# validation
# --------------------------------------------------------------------------- #


def validate(manifest: WorkloadManifest) -> None:
    """Validate a manifest, raising :class:`ManifestError` on any problem.

    Checks performed here:

    - **Reference check**: every edge producer/consumer region and every io
      binding region must exist in ``regions[]``.
    - **Out-slot check**: ``producer.out`` and io-output ``out`` must satisfy
      ``0 <= out < region.out_count`` (the dangling-out-slot case).
    - **In-slot non-negativity**: ``consumer.in`` and io-input/weight ``in`` must
      be ``>= 0``. The arg-spec-aware upper bound is deferred to the executor
      (02-02), which has the region's MLIR.
    - **Feed-count check**: each ``(region, in-slot)`` must be fed by at most one
      source -- an edge OR a workload input/weight binding, never both/twice.
    - **Acyclicity**: delegated to :func:`topo_order`; its cycle error propagates.
    """
    region_by_id = {r.id: r for r in manifest.regions}

    def _check_region(region_id: str, where: str) -> RegionSpec:
        if region_id not in region_by_id:
            raise ManifestError(
                f"{where} references unknown region '{region_id}'"
            )
        return region_by_id[region_id]

    # Track in-slot feeders so we can detect double-feeds.
    feeders: dict[tuple[str, int], list[str]] = {}

    def _add_feeder(region_id: str, slot: int, source: str) -> None:
        feeders.setdefault((region_id, slot), []).append(source)

    # --- edges ---
    for edge in manifest.edges:
        producer_region = _check_region(edge.producer.region, "edge producer")
        consumer_region = _check_region(edge.consumer.region, "edge consumer")

        if not (0 <= edge.producer.out < producer_region.out_count):
            raise ManifestError(
                f"edge producer out-slot {edge.producer.out} out of range for "
                f"region '{producer_region.id}' (out_count={producer_region.out_count})"
            )
        if edge.consumer.in_ < 0:
            raise ManifestError(
                f"edge consumer in-slot {edge.consumer.in_} on region "
                f"'{consumer_region.id}' must be >= 0"
            )
        _add_feeder(
            consumer_region.id,
            edge.consumer.in_,
            f"edge from {producer_region.id}.out{edge.producer.out}",
        )

    # --- io inputs / weights (feed an in-slot) ---
    for binding in (*manifest.io.inputs, *manifest.io.weights):
        region = _check_region(binding.region, f"io binding '{binding.name}'")
        if binding.slot < 0:
            raise ManifestError(
                f"io binding '{binding.name}' in-slot {binding.slot} on region "
                f"'{region.id}' must be >= 0"
            )
        _add_feeder(region.id, binding.slot, f"io input/weight '{binding.name}'")

    # --- io outputs (reference an out-slot) ---
    for binding in manifest.io.outputs:
        region = _check_region(binding.region, f"io output '{binding.name}'")
        if not (0 <= binding.slot < region.out_count):
            raise ManifestError(
                f"io output '{binding.name}' references out-slot {binding.slot} "
                f"out of range for region '{region.id}' (out_count={region.out_count})"
            )

    # --- feed-count check ---
    for (region_id, slot), sources in feeders.items():
        if len(sources) > 1:
            raise ManifestError(
                f"in-slot {slot} on region '{region_id}' is fed more than once "
                f"(double-fed by: {sources})"
            )

    # --- acyclicity (lets topo_order's cycle ManifestError propagate) ---
    topo_order(manifest)
