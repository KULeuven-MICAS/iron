# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Hermetic tests for the Phase-3 manifest emitter (S4): no NPU, no stream-dse.

These tests prove the emitter (``iron.operators.stream_fusion.emitter``) over the
copied SwiGLU fixture:

- ``emit_manifest_k1_from_mlir`` infers io bindings from the region's arg-spec
  (``parse_runtime_args``): in-slot 0 -> input, trailing in-slots -> weights with
  the K,N layout PRESERVED, out-slots -> outputs -- producing a valid 1-region
  manifest that ``validate`` / ``topo_order`` accept and that
  ``StreamWorkload.build_plan`` round-trips HEADLESSLY (EMIT-02 end to end).
- ``emit_manifest_from_modules`` is the explicit core the convenience layers over.
- ``manifest_to_dict`` / ``write_manifest`` round-trip through the Phase-2 loader
  (JSON always; YAML if PyYAML is present).
- Importing the emitter / building a manifest never imports ``stream`` and
  ``emit_manifest_from_stream`` is NEVER called (a parallel agent shares this
  venv's stream-dse package state, so exercising stream codegen would race).

The fixture region's known arg-spec (ground truth; out_count=1, last arg "out"):

    (256,512), (512,2048), (512,2048), (2048,512), (256,512)   bf16
     input      w_gate       w_up        w_down      output
"""

import sys

import pytest

from iron.common import AIEContext  # noqa: F401  (parity with sibling tests)
from iron.operators.stream_fusion import (
    emit_manifest_from_modules,
    emit_manifest_from_stream,
    emit_manifest_k1_from_mlir,
    manifest_to_dict,
    write_manifest,
    load_manifest,
    load_manifest_file,
    validate,
    topo_order,
    WorkloadManifest,
    StreamWorkload,
    WorkloadInput,
    WorkloadWeight,
    WorkloadOutput,
    ManifestError,  # noqa: F401  (re-exported for completeness / future use)
)
from iron.operators.stream_fusion.mlir_introspect import parse_runtime_args


# The fixture region's known arg-spec (ground truth; out_count=1).
FIXTURE_ARG_SHAPES = [(256, 512), (512, 2048), (512, 2048), (2048, 512), (256, 512)]
SWIGLU_NAMES = {
    "inputs": ["x"],
    "weights": ["w_gate", "w_up", "w_down"],
    "outputs": ["y"],
}


@pytest.fixture
def aie_context():
    """A fresh AIEContext, with NPU-runtime teardown guarded for no-NPU hosts.

    Copied from tests/test_workload.py: the repo-root ``aie_context`` fixture's
    teardown unconditionally calls ``DefaultNPURuntime.cleanup()`` -- which is
    ``None`` (AttributeError) on a host without an NPU runtime. These tests are
    hermetic.
    """
    import aie.utils as aie_utils

    ctx = AIEContext()
    yield ctx
    runtime = aie_utils.DefaultNPURuntime
    if runtime is not None:
        runtime.cleanup()


def _k1_manifest(fixture_mlir_path) -> WorkloadManifest:
    """The SwiGLU k=1 manifest with explicit names (the shared fixture under test)."""
    return emit_manifest_k1_from_mlir(
        str(fixture_mlir_path),
        region_id="r0",
        layers=["gate", "up", "down"],
        names=SWIGLU_NAMES,
    )


# --------------------------------------------------------------------------- #
# tests
# --------------------------------------------------------------------------- #


def test_k1_emit_from_fixture_is_valid(fixture_mlir_path):
    """k=1 SwiGLU emit -> a valid 1-region manifest with arg-spec-inferred io.

    Layers PRESERVED; the K,N weight layout PRESERVED, not collapsed.
    """
    manifest = _k1_manifest(fixture_mlir_path)

    assert isinstance(manifest, WorkloadManifest)
    assert len(manifest.regions) == 1
    region = manifest.regions[0]
    assert region.id == "r0"
    assert region.out_count == 1
    assert region.layers == ["gate", "up", "down"]  # PRESERVED

    # io.inputs: x at in-slot 0.
    assert len(manifest.io.inputs) == 1
    assert manifest.io.inputs[0].name == "x"
    assert manifest.io.inputs[0].region == "r0"
    assert manifest.io.inputs[0].slot == 0
    assert manifest.io.inputs[0].direction == "in"

    # io.weights: w_gate@1, w_up@2, w_down@3, all layout "K,N".
    assert [b.name for b in manifest.io.weights] == ["w_gate", "w_up", "w_down"]
    assert [b.slot for b in manifest.io.weights] == [1, 2, 3]
    assert all(b.layout == "K,N" for b in manifest.io.weights)  # PRESERVED, not collapsed
    assert all(b.direction == "in" for b in manifest.io.weights)

    # io.outputs: y at out-slot 0, layout row_major.
    assert len(manifest.io.outputs) == 1
    assert manifest.io.outputs[0].name == "y"
    assert manifest.io.outputs[0].slot == 0
    assert manifest.io.outputs[0].layout == "row_major"
    assert manifest.io.outputs[0].direction == "out"

    validate(manifest)  # does not raise
    assert topo_order(manifest) == ["r0"]


def test_k1_emit_roundtrips_through_executor(fixture_mlir_path, aie_context):
    """EMIT-02 end to end: the emitted k=1 manifest drives StreamWorkload headless.

    No NPU, no stream-dse: build_plan binds the region's full 5-arg arg-spec in
    order (4 inputs then 1 output).
    """
    manifest = _k1_manifest(fixture_mlir_path)
    workload = StreamWorkload(manifest, context=aie_context)
    plan = workload.build_plan()

    assert plan.order == ["r0"]
    assert plan.intermediates == []
    assert plan.region_bindings["r0"] == [
        WorkloadInput("x"),
        WorkloadWeight("w_gate"),
        WorkloadWeight("w_up"),
        WorkloadWeight("w_down"),
        WorkloadOutput("y"),
    ]


def test_from_modules_explicit_assembly(fixture_mlir_path):
    """The convenience is a thin layer over the explicit core.

    emit_manifest_from_modules with the same region + io produces a manifest equal
    (via manifest_to_dict) to emit_manifest_k1_from_mlir with the same names.
    """
    io = {
        "inputs": [("x", "r0", 0, "row_major")],
        "weights": [
            ("w_gate", "r0", 1, "K,N"),
            ("w_up", "r0", 2, "K,N"),
            ("w_down", "r0", 3, "K,N"),
        ],
        "outputs": [("y", "r0", 0, "row_major")],
    }
    explicit = emit_manifest_from_modules(
        [("r0", str(fixture_mlir_path), 1, ["gate", "up", "down"])],
        edges=[],
        io=io,
    )
    convenience = _k1_manifest(fixture_mlir_path)

    assert manifest_to_dict(explicit) == manifest_to_dict(convenience)


def test_io_bindings_match_argspec(fixture_mlir_path):
    """io binding directions + slot indices are DERIVED from the arg-spec, not hardcoded.

    The in-slot bindings (inputs+weights) align 1:1 with the arg-spec "in"
    positions (slots 0..3); the output binding aligns with the "out" position
    (slot 0).
    """
    specs = parse_runtime_args(fixture_mlir_path.read_text(), 1)
    in_positions = [i for i, s in enumerate(specs) if s.direction == "in"]
    out_positions = [i for i, s in enumerate(specs) if s.direction == "out"]
    assert in_positions == [0, 1, 2, 3]
    assert out_positions == [4]

    manifest = _k1_manifest(fixture_mlir_path)

    # inputs + weights occupy the in-slots 0..3 in order.
    in_bindings = sorted(
        (*manifest.io.inputs, *manifest.io.weights), key=lambda b: b.slot
    )
    assert [b.slot for b in in_bindings] == [0, 1, 2, 3]
    assert all(b.direction == "in" for b in in_bindings)

    # the output occupies out-slot 0 (the single "out" arg).
    assert len(manifest.io.outputs) == 1
    assert manifest.io.outputs[0].slot == 0
    assert manifest.io.outputs[0].direction == "out"


def test_manifest_dict_roundtrip(fixture_mlir_path):
    """manifest_to_dict -> load_manifest reconstructs an equal manifest.

    Spot-check the dict key conventions: io weights use "in", io outputs use "out".
    """
    manifest = _k1_manifest(fixture_mlir_path)
    data = manifest_to_dict(manifest)

    reloaded = load_manifest(data)
    assert manifest_to_dict(reloaded) == data

    # Dict key conventions ("in" / "out").
    assert "in" in data["io"]["weights"][0]
    assert "out" in data["io"]["outputs"][0]
    assert data["io"]["weights"][0]["in"] == 1
    assert data["io"]["outputs"][0]["out"] == 0


def test_json_file_roundtrip(fixture_mlir_path, tmp_path):
    """emit -> write_manifest(.json) -> load_manifest_file -> validate -> topo_order."""
    manifest = _k1_manifest(fixture_mlir_path)
    path = write_manifest(manifest, tmp_path / "m.json")
    assert path.exists()

    reloaded = load_manifest_file(tmp_path / "m.json")
    validate(reloaded)
    assert topo_order(reloaded) == ["r0"]
    assert manifest_to_dict(reloaded) == manifest_to_dict(manifest)


def test_yaml_file_roundtrip_if_available(fixture_mlir_path, tmp_path):
    """The same file round-trip for YAML, skipped if PyYAML is not installed."""
    try:
        import yaml  # noqa: F401
    except ImportError:
        pytest.skip("PyYAML not installed")

    manifest = _k1_manifest(fixture_mlir_path)
    write_manifest(manifest, tmp_path / "m.yaml")

    reloaded = load_manifest_file(tmp_path / "m.yaml")
    validate(reloaded)
    assert topo_order(reloaded) == ["r0"]
    assert manifest_to_dict(reloaded) == manifest_to_dict(manifest)


def test_emitter_import_is_hermetic(fixture_mlir_path):
    """Importing the emitter / building a k=1 manifest never imports stream-dse.

    emit_manifest_from_stream is callable but is intentionally NOT invoked.
    """
    assert sys.modules.get("stream") is None

    manifest = _k1_manifest(fixture_mlir_path)
    assert isinstance(manifest, WorkloadManifest)
    assert sys.modules.get("stream") is None

    # The lazy-stream wrapper exists but must NOT be called on this host.
    assert callable(emit_manifest_from_stream)
    assert sys.modules.get("stream") is None
