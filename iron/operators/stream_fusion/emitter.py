# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""The Phase-3 manifest emitter (S4): stream-free, NPU-free manifest assembly.

This module turns already-generated MLIR region descriptors into a Phase-2
:class:`~iron.operators.stream_fusion.manifest.WorkloadManifest`, degrading
gracefully to today's k=1 single-fused-module case. Its output round-trips
through the Phase-2 loader (``load_manifest`` / ``validate`` / ``topo_order``)
and the Phase-2 executor (``StreamWorkload.build_plan``) headlessly.

Three layers (CONTEXT.md locked decisions)
-------------------------------------------

1. :func:`emit_manifest_from_modules` -- the pure core. Assembles the Phase-2
   manifest from a list of ``(id, mlir_path, out_count, layers)`` region
   descriptors + an edge list + an io description. It builds a plain dict in the
   exact Phase-2 schema shape and runs it through ``load_manifest`` so the
   dataclass construction and the ``"in"`` / ``"out"`` dict-key conventions have a
   single source of truth. Stream-free, NPU-free, ALWAYS tested.

2. :func:`emit_manifest_k1_from_mlir` -- the k=1 convenience. One region from a
   single MLIR path, with io bindings INFERRED from
   :func:`~iron.operators.stream_fusion.mlir_introspect.parse_runtime_args`: the
   first ``"in"`` slot is the activation input, the trailing ``"in"`` slots are
   weights (the K,N weight-layout convention recorded, never collapsed -- Design
   Decision 4), and the ``"out"`` slots are outputs. Layer membership preserved.

3. :func:`emit_manifest_from_stream` -- the thin, lazily-stream-importing wrapper.
   ``stream`` is imported INSIDE the function (mirroring the guarded XRT import in
   :mod:`workload` and the lazy stream import in ``stream_design.py``) so importing
   this module needs no stream-dse. Today stream-dse returns a SINGLE fused module
   (``ctx["module"]``) -> k=1; a clearly-marked, forward-looking multi-region
   branch activates only if/when stream returns multiple modules. This function is
   intentionally NOT exercised by the default (no-NPU / no-stream) tests: a
   parallel agent shares this venv's stream-dse package state.

Plus JSON (and YAML-if-PyYAML) serialization: :func:`manifest_to_dict` and
:func:`write_manifest`, matching the Phase-2 loader, so a manifest file
round-trips emit -> write -> ``load_manifest_file`` -> ``validate``.

The ``in`` / ``out`` dict-key convention
-----------------------------------------

The Phase-2 loader reads edge consumers under the dict key ``"in"`` (mapped to
:class:`Consumer.in_`), io inputs/weights under ``"in"``, and io outputs under
``"out"``. Both the assembly path (the dicts handed to ``load_manifest``) and the
serialization path (:func:`manifest_to_dict`) honour this verbatim, which is why
:func:`manifest_to_dict` builds the dict by hand rather than via
``dataclasses.asdict`` (which would emit ``"in_"``).
"""

from __future__ import annotations

import json
from pathlib import Path

from iron.operators.stream_fusion.manifest import (
    ManifestError,
    WorkloadManifest,
    load_manifest,
    load_manifest_file,  # noqa: F401  (re-exported convenience for the file round-trip)
    topo_order,  # noqa: F401  (re-exported convenience)
    validate,  # noqa: F401  (re-exported convenience)
)
from iron.operators.stream_fusion.mlir_introspect import parse_runtime_args

# Module top level imports ONLY manifest + mlir_introspect (both pure-data,
# stream-free, NPU-free). `stream`, StreamWorkload, XRTTensor and any stream-dse
# symbol are NOT imported here -- emit_manifest_from_stream imports `stream`
# lazily inside its body so importing this module stays hermetic.


# --------------------------------------------------------------------------- #
# normalization helpers (tuple OR Phase-2 dict -> Phase-2 dict)
# --------------------------------------------------------------------------- #


def _normalize_region(region: object) -> dict:
    """Normalize a region descriptor into the Phase-2 region dict.

    Accepts either a 4-tuple ``(id, mlir_path, out_count, layers)`` (the
    CONTEXT.md descriptor shape) or a Phase-2 region dict
    ``{"id", "mlir", "out_count", "layers"}``.
    """
    if isinstance(region, dict):
        return {
            "id": region["id"],
            "mlir": str(region["mlir"]),
            "out_count": int(region.get("out_count", 1)),
            "layers": list(region.get("layers", [])),
        }
    # Tuple / list descriptor: (id, mlir_path, out_count, layers).
    region_id, mlir_path, out_count, layers = region
    return {
        "id": region_id,
        "mlir": str(mlir_path),
        "out_count": int(out_count),
        "layers": list(layers),
    }


def _normalize_edge(edge: object) -> dict:
    """Normalize an edge descriptor into the Phase-2 edge dict.

    Accepts either a 4-tuple ``(producer_region, out, consumer_region, in)`` or a
    Phase-2 edge dict ``{"producer": {"region", "out"}, "consumer": {"region",
    "in"}}``. NOTE the consumer dict key is ``"in"`` (the loader maps it to
    :class:`Consumer.in_`).
    """
    if isinstance(edge, dict):
        producer = edge["producer"]
        consumer = edge["consumer"]
        return {
            "producer": {"region": producer["region"], "out": int(producer["out"])},
            "consumer": {"region": consumer["region"], "in": int(consumer["in"])},
        }
    producer_region, out, consumer_region, in_ = edge
    return {
        "producer": {"region": producer_region, "out": int(out)},
        "consumer": {"region": consumer_region, "in": int(in_)},
    }


def _normalize_io_binding(binding: object, slot_key: str) -> dict:
    """Normalize one io binding into a Phase-2 binding dict under ``slot_key``.

    ``slot_key`` is ``"in"`` for inputs/weights and ``"out"`` for outputs (the
    loader requires the matching dict key). Accepts either a 4-tuple
    ``(name, region, slot, layout)`` or a Phase-2 binding dict already carrying
    the right ``slot_key`` (or the neutral key ``"slot"``).
    """
    if isinstance(binding, dict):
        if slot_key in binding:
            slot = binding[slot_key]
        elif "slot" in binding:
            slot = binding["slot"]
        else:
            raise ManifestError(
                f"io binding {binding!r} is missing its slot key "
                f"('{slot_key}' or 'slot')"
            )
        return {
            "name": binding["name"],
            "region": binding["region"],
            slot_key: int(slot),
            "layout": binding["layout"],
        }
    name, region, slot, layout = binding
    return {"name": name, "region": region, slot_key: int(slot), "layout": layout}


def _normalize_io(io: object) -> dict:
    """Normalize an io description into the Phase-2 io dict.

    ``io`` is a dict with optional ``"inputs"`` / ``"weights"`` / ``"outputs"``,
    each a list of ``(name, region, slot, layout)`` tuples OR Phase-2 binding
    dicts. inputs/weights serialize under the ``"in"`` key; outputs under ``"out"``.
    """
    if io is None:
        return {"inputs": [], "weights": [], "outputs": []}
    return {
        "inputs": [_normalize_io_binding(b, "in") for b in io.get("inputs", [])],
        "weights": [_normalize_io_binding(b, "in") for b in io.get("weights", [])],
        "outputs": [_normalize_io_binding(b, "out") for b in io.get("outputs", [])],
    }


# --------------------------------------------------------------------------- #
# (A) pure core: emit_manifest_from_modules
# --------------------------------------------------------------------------- #


def emit_manifest_from_modules(
    regions: list,
    edges: list | None = None,
    io: dict | None = None,
) -> WorkloadManifest:
    """Assemble a :class:`WorkloadManifest` from MLIR region descriptors + dataflow.

    This is the pure, stream-free, NPU-free core -- the always-tested entry point.

    Args:
        regions: A non-empty list of region descriptors, each either a 4-tuple
            ``(id, mlir_path, out_count, layers)`` or a Phase-2 region dict
            ``{"id", "mlir", "out_count", "layers"}``.
        edges: An optional list of edge descriptors, each either a 4-tuple
            ``(producer_region, out, consumer_region, in)`` or a Phase-2 edge dict
            ``{"producer": {"region", "out"}, "consumer": {"region", "in"}}``.
        io: An optional io description: a dict with optional
            ``"inputs"`` / ``"weights"`` / ``"outputs"``, each a list of
            ``(name, region, slot, layout)`` tuples or Phase-2 binding dicts.

    Returns:
        The assembled manifest, structurally validated by ``load_manifest``.

    Raises:
        ManifestError: If ``regions`` is empty (a friendlier named guard than the
            one ``load_manifest`` raises) or any descriptor is malformed.

    Routing the assembled plain dict through ``load_manifest`` keeps the manifest
    construction + the ``"in"`` / ``"out"`` key conventions in ONE place (no
    duplicated dataclass wiring).
    """
    if not regions:
        raise ManifestError(
            "emit_manifest_from_modules requires at least one region descriptor"
        )

    data = {
        "regions": [_normalize_region(r) for r in regions],
        "edges": [_normalize_edge(e) for e in (edges or [])],
        "io": _normalize_io(io),
    }
    return load_manifest(data)


# --------------------------------------------------------------------------- #
# (B) k=1 convenience: emit_manifest_k1_from_mlir
# --------------------------------------------------------------------------- #


def _default_weight_names(num_weights: int) -> list[str]:
    """Default weight names: the SwiGLU 3-weight shape, else ``w0..w{m-1}``.

    When exactly three weights are present (the SwiGLU gate/up/down shape), use the
    descriptive names; otherwise fall back to positional ``w0``, ``w1``, ... .
    """
    if num_weights == 3:
        return ["w_gate", "w_up", "w_down"]
    return [f"w{i}" for i in range(num_weights)]


def _default_output_names(num_outputs: int) -> list[str]:
    """Default output names: ``y`` for a single output, else ``y0..y{n-1}``."""
    if num_outputs == 1:
        return ["y"]
    return [f"y{i}" for i in range(num_outputs)]


def emit_manifest_k1_from_mlir(
    mlir_path,
    *,
    region_id: str = "region_0",
    out_count: int = 1,
    layers: list | None = None,
    names: dict | None = None,
    input_layout: str = "row_major",
    weight_layout: str = "K,N",
    output_layout: str = "row_major",
) -> WorkloadManifest:
    """Emit a 1-region (k=1) manifest from a single MLIR path, inferring io bindings.

    io bindings are inferred from ``parse_runtime_args(text, out_count)``:

    - The first ``"in"`` slot (in-slot 0) is the activation INPUT
      (layout ``input_layout``).
    - The remaining ``"in"`` slots (in-slots ``>= 1``) are WEIGHT bindings
      (layout ``weight_layout``, the K,N convention -- PRESERVED, not collapsed).
    - Each ``"out"`` slot is an OUTPUT binding (layout ``output_layout``).

    This slot-0-input / trailing-in-slots-weights split is the SwiGLU k=1
    convenience default; callers needing a different split use
    :func:`emit_manifest_from_modules` directly (fully explicit).

    Args:
        mlir_path: Path to the region's MLIR (already generated; read as text).
        region_id: The region id (becomes the operator ``name_hint``).
        out_count: Number of trailing args treated as outputs (default 1).
        layers: The region's layer membership (preserved verbatim); default ``[]``.
        names: Optional explicit names, a dict with keys ``"inputs"`` /
            ``"weights"`` / ``"outputs"`` -> ``list[str]``. Defaults: ``x`` for the
            single input, the SwiGLU ``w_gate`` / ``w_up`` / ``w_down`` (or
            ``w0..``) for weights, and ``y`` / ``y0..`` for outputs.
        input_layout: Layout recorded on the input binding.
        weight_layout: Layout recorded on weight bindings (the K,N convention).
        output_layout: Layout recorded on output bindings.

    Returns:
        The k=1 manifest (structurally validated by ``load_manifest``). This does
        NOT call ``StreamWorkload`` -- the executor round-trip is a test concern.
    """
    text = Path(mlir_path).read_text()
    specs = parse_runtime_args(text, out_count)
    n = len(specs)
    num_in = n - out_count

    names = names or {}
    input_names = list(names.get("inputs", [])) if "inputs" in names else None
    weight_names = list(names.get("weights", [])) if "weights" in names else None
    output_names = list(names.get("outputs", [])) if "outputs" in names else None

    inputs: list[tuple] = []
    weights: list[tuple] = []
    outputs: list[tuple] = []

    # Walk specs in signature order, tracking in-slot and out-slot counters.
    in_slot = 0
    out_slot = 0
    num_weights = max(num_in - 1, 0)
    if weight_names is None:
        weight_names = _default_weight_names(num_weights)
    if output_names is None:
        output_names = _default_output_names(out_count)
    if input_names is None:
        input_names = ["x"]

    weight_idx = 0
    for i, spec in enumerate(specs):
        if i < num_in:
            if in_slot == 0:
                # in-slot 0 -> the activation INPUT.
                name = input_names[0] if input_names else "x"
                inputs.append((name, region_id, in_slot, input_layout))
            else:
                # trailing in-slots -> WEIGHTS (K,N convention preserved).
                name = (
                    weight_names[weight_idx]
                    if weight_idx < len(weight_names)
                    else f"w{weight_idx}"
                )
                weights.append((name, region_id, in_slot, weight_layout))
                weight_idx += 1
            in_slot += 1
        else:
            # out-slot -> an OUTPUT.
            name = (
                output_names[out_slot]
                if out_slot < len(output_names)
                else f"y{out_slot}"
            )
            outputs.append((name, region_id, out_slot, output_layout))
            out_slot += 1

    io = {"inputs": inputs, "weights": weights, "outputs": outputs}
    layers = list(layers) if layers is not None else []
    region_descriptor = (region_id, str(mlir_path), out_count, layers)
    return emit_manifest_from_modules([region_descriptor], edges=[], io=io)


# --------------------------------------------------------------------------- #
# (C) thin lazy-stream wrapper: emit_manifest_from_stream
# --------------------------------------------------------------------------- #


def emit_manifest_from_stream(
    stream_result,
    *,
    mlir_dir,
    region_id: str = "region_0",
    layers: list | None = None,
    **k1_kwargs,
) -> WorkloadManifest:
    """Adapt a stream-dse codegen result into a manifest (lazy ``stream`` import).

    This is the THIN wrapper: ``stream`` is imported LAZILY inside this function
    (mirroring ``stream_design.py`` and the guarded XRT import in
    :meth:`StreamWorkload.run`), so importing :mod:`emitter` needs no stream-dse.

    Today stream-dse returns a SINGLE fused module (``ctx["module"]``) -> this
    routes to the k=1 path (:func:`emit_manifest_k1_from_mlir`). The MULTI-REGION
    branch is FORWARD-LOOKING: it activates only if/when stream returns multiple
    modules and is intentionally NOT covered by the default (no-NPU / no-stream)
    tests -- a parallel agent shares this venv's stream-dse package state, so
    exercising stream codegen here would race.

    Args:
        stream_result: A ctx-like dict with a ``"module"`` key (single fused
            module), OR a single fused module object, OR a forward-looking
            multi-region descriptor (a dict/obj exposing ``"regions"`` and
            ``"edges"``).
        mlir_dir: Directory to write each region's MLIR text into.
        region_id: The region id for the single-module (k=1) case.
        layers: The region's layer membership for the k=1 case.
        **k1_kwargs: Forwarded to :func:`emit_manifest_k1_from_mlir`.

    Returns:
        The assembled manifest.

    Raises:
        ManifestError: If stream-dse is not installed.
    """
    try:
        import stream  # noqa: F401  (lazy; mirrors stream_design.py / workload.run)
    except ImportError as exc:
        raise ManifestError(
            "emit_manifest_from_stream requires stream-dse to be installed; "
            "for an already-generated MLIR use emit_manifest_k1_from_mlir / "
            "emit_manifest_from_modules instead"
        ) from exc

    mlir_dir = Path(mlir_dir)
    mlir_dir.mkdir(parents=True, exist_ok=True)

    # Normalize stream_result into a single module or a multi-region descriptor.
    multi_region = None
    module = None
    if isinstance(stream_result, dict) and "module" in stream_result:
        # ctx-like dict: today's single fused module.
        module = stream_result["module"]
    elif (isinstance(stream_result, dict) and "regions" in stream_result) or (
        hasattr(stream_result, "regions") and hasattr(stream_result, "edges")
    ):
        # Forward-looking multi-region shape.
        multi_region = stream_result
    else:
        # Treat stream_result itself as the single fused module object.
        module = stream_result

    if multi_region is None:
        # SINGLE-MODULE (today, k=1): write the module text and route to k=1.
        mlir_text = str(module)
        region_path = mlir_dir / f"{region_id}.mlir"
        region_path.write_text(mlir_text)
        return emit_manifest_k1_from_mlir(
            region_path, region_id=region_id, layers=layers, **k1_kwargs
        )

    # ------------------------------------------------------------------ #
    # MULTI-REGION (forward-looking; NOT covered by the default tests).
    # Activates if/when stream-dse returns multiple fused modules. This is the
    # multi-fusion forward path -- the assembly entry point a multi-region ONNX
    # workload (Phase 4 / S5) will also target via emit_manifest_from_modules.
    # ------------------------------------------------------------------ #
    def _get(obj, key, default=None):
        if isinstance(obj, dict):
            return obj.get(key, default)
        return getattr(obj, key, default)

    raw_regions = _get(multi_region, "regions", [])
    raw_edges = _get(multi_region, "edges", [])
    raw_io = _get(multi_region, "io", None)

    region_descriptors: list[tuple] = []
    for r in raw_regions:
        r_id = _get(r, "id")
        r_module = _get(r, "module")
        r_out_count = int(_get(r, "out_count", 1))
        r_layers = list(_get(r, "layers", []) or [])
        r_path = mlir_dir / f"{r_id}.mlir"
        r_path.write_text(str(r_module))
        region_descriptors.append((r_id, str(r_path), r_out_count, r_layers))

    edge_descriptors: list[tuple] = []
    for e in raw_edges:
        producer = _get(e, "producer")
        consumer = _get(e, "consumer")
        edge_descriptors.append(
            (
                _get(producer, "region"),
                int(_get(producer, "out")),
                _get(consumer, "region"),
                int(_get(consumer, "in")),
            )
        )

    return emit_manifest_from_modules(
        region_descriptors, edges=edge_descriptors, io=raw_io
    )


# --------------------------------------------------------------------------- #
# (D) serialization: manifest_to_dict + write_manifest
# --------------------------------------------------------------------------- #


def manifest_to_dict(manifest: WorkloadManifest) -> dict:
    """Serialize a :class:`WorkloadManifest` to the Phase-2 plain dict.

    Built by hand (NOT ``dataclasses.asdict``) because :class:`Consumer.in_` must
    serialize back to the dict key ``"in"`` and io bindings split by direction
    into ``"in"`` (inputs/weights) and ``"out"`` (outputs) keys.

    Self-check contract: ``load_manifest(manifest_to_dict(m))`` reconstructs an
    equal manifest.
    """
    return {
        "regions": [
            {
                "id": r.id,
                "mlir": r.mlir,
                "out_count": r.out_count,
                "layers": list(r.layers),
            }
            for r in manifest.regions
        ],
        "edges": [
            {
                "producer": {"region": e.producer.region, "out": e.producer.out},
                # read Consumer.in_, write it under the dict key "in".
                "consumer": {"region": e.consumer.region, "in": e.consumer.in_},
            }
            for e in manifest.edges
        ],
        "io": {
            "inputs": [
                {"name": b.name, "region": b.region, "in": b.slot, "layout": b.layout}
                for b in manifest.io.inputs
            ],
            "weights": [
                {"name": b.name, "region": b.region, "in": b.slot, "layout": b.layout}
                for b in manifest.io.weights
            ],
            "outputs": [
                {"name": b.name, "region": b.region, "out": b.slot, "layout": b.layout}
                for b in manifest.io.outputs
            ],
        },
    }


def write_manifest(manifest: WorkloadManifest, path) -> Path:
    """Write a manifest to a ``.json`` or ``.yaml`` / ``.yml`` file.

    Pairs with ``load_manifest_file`` for the file round-trip. YAML support is
    optional: PyYAML is imported inside this function and a clear
    :class:`ManifestError` is raised if it is absent for a YAML file (mirroring
    ``load_manifest_file``). An unknown extension is rejected.

    Returns:
        The :class:`~pathlib.Path` written.
    """
    path = Path(path)
    suffix = path.suffix.lower()
    data = manifest_to_dict(manifest)

    if suffix == ".json":
        path.write_text(json.dumps(data, indent=2))
    elif suffix in (".yaml", ".yml"):
        try:
            import yaml  # type: ignore
        except ImportError as exc:  # pragma: no cover - exercised only without PyYAML
            raise ManifestError(
                f"writing '{path}' requires PyYAML; install it (pip install pyyaml) "
                f"or use a .json manifest instead"
            ) from exc
        path.write_text(yaml.safe_dump(data, sort_keys=False))
    else:
        raise ManifestError(
            f"unknown manifest extension '{suffix}' for '{path}'; "
            f"use .json, .yaml, or .yml"
        )

    return path
