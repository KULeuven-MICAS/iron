# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Headless plan/wiring tests for :class:`StreamWorkload` (no NPU, no stream-dse).

These tests assert on the pure-data :meth:`StreamWorkload.build_plan` output -- the
behavior-equivalence contract -- and never call :meth:`StreamWorkload.run` (this host
has no ``pyxrt``). Both regions of the multi-region manifests point at the SAME SwiGLU
fixture ``.mlir`` so the region arg-spec is known ground truth:

    (256,512), (512,2048), (512,2048), (2048,512), (256,512)   bf16, out_count=1
     input      w_gate       w_up        w_down      output

They prove:

- **WL-03 (k=1 reduction)**: a 1-region, no-edge manifest yields a plan whose single
  region binds its full 5-arg arg-spec (4 inputs then 1 output) in order -- behavior
  equivalent to calling ``StreamFusedRegion`` directly.
- **WL-02 (edge sizing)**: an inter-region edge's resident intermediate is sized from
  the PRODUCER region's arg-spec out-slot (shape + dtype, derived not hardcoded), and
  the intermediate handle lands at the consumer's in-slot (and the producer's out-slot).
- Dispatch follows ``topo_order``.
- ``build_plan`` touches no XRT (``sys.modules['pyxrt'] is None`` afterwards).
"""

import sys
from pathlib import Path

import numpy as np
import pytest

from iron.common import AIEContext
from iron.operators.stream_fusion import (
    load_manifest,
    StreamWorkload,
    BufferSpec,
    WorkloadInput,
    WorkloadWeight,
    WorkloadOutput,
    Intermediate,
)


# The fixture region's known arg-spec (ground truth; out_count=1, last arg is "out").
FIXTURE_ARG_SHAPES = [(256, 512), (512, 2048), (512, 2048), (2048, 512), (256, 512)]
FIXTURE_OUT_SLOT_SHAPE = (256, 512)  # arg-spec[-1] (the single output)


@pytest.fixture
def aie_context():
    """A fresh AIEContext, with NPU-runtime teardown guarded for no-NPU hosts.

    Copied from tests/test_region.py: the repo-root ``aie_context`` fixture's teardown
    unconditionally calls ``DefaultNPURuntime.cleanup()`` -- which is ``None``
    (AttributeError) on a host without an NPU runtime. These tests are hermetic.
    """
    import aie.utils as aie_utils

    ctx = AIEContext()
    yield ctx
    runtime = aie_utils.DefaultNPURuntime
    if runtime is not None:
        runtime.cleanup()


# --------------------------------------------------------------------------- #
# manifest builders (both regions use the SAME fixture .mlir => known arg-spec)
# --------------------------------------------------------------------------- #


def _weights(region: str) -> list[dict]:
    """The three SwiGLU weight bindings (in-slots 1,2,3) for a fixture region."""
    return [
        {"name": f"{region}_w_gate", "region": region, "in": 1, "layout": "K,N"},
        {"name": f"{region}_w_up", "region": region, "in": 2, "layout": "K,N"},
        {"name": f"{region}_w_down", "region": region, "in": 3, "layout": "K,N"},
    ]


def _k1_manifest(mlir: str) -> dict:
    """k=1: one region r0 = fixture; io feeds all 4 inputs + 1 output; no edges."""
    return {
        "regions": [
            {"id": "r0", "mlir": mlir, "out_count": 1, "layers": ["gate", "up", "down"]}
        ],
        "edges": [],
        "io": {
            "inputs": [{"name": "x", "region": "r0", "in": 0, "layout": "row_major"}],
            "weights": [
                {"name": "w_gate", "region": "r0", "in": 1, "layout": "K,N"},
                {"name": "w_up", "region": "r0", "in": 2, "layout": "K,N"},
                {"name": "w_down", "region": "r0", "in": 3, "layout": "K,N"},
            ],
            "outputs": [{"name": "y", "region": "r0", "out": 0, "layout": "row_major"}],
        },
    }


def _two_region_manifest(mlir: str) -> dict:
    """rA.out0 -> rB.in0; both fixture; workload feeds rA.in0 + each region's weights."""
    return {
        "regions": [
            {"id": "rA", "mlir": mlir, "out_count": 1},
            {"id": "rB", "mlir": mlir, "out_count": 1},
        ],
        "edges": [
            {"producer": {"region": "rA", "out": 0}, "consumer": {"region": "rB", "in": 0}}
        ],
        "io": {
            "inputs": [{"name": "x", "region": "rA", "in": 0, "layout": "row_major"}],
            "weights": _weights("rA") + _weights("rB"),
            "outputs": [{"name": "y", "region": "rB", "out": 0, "layout": "row_major"}],
        },
    }


def _three_region_chain(mlir: str) -> dict:
    """rA.out0 -> rB.in0 -> rC.in0; all fixture; workload feeds rA.in0 + weights."""
    return {
        "regions": [
            {"id": "rA", "mlir": mlir, "out_count": 1},
            {"id": "rB", "mlir": mlir, "out_count": 1},
            {"id": "rC", "mlir": mlir, "out_count": 1},
        ],
        "edges": [
            {"producer": {"region": "rA", "out": 0}, "consumer": {"region": "rB", "in": 0}},
            {"producer": {"region": "rB", "out": 0}, "consumer": {"region": "rC", "in": 0}},
        ],
        "io": {
            "inputs": [{"name": "x", "region": "rA", "in": 0, "layout": "row_major"}],
            "weights": _weights("rA") + _weights("rB") + _weights("rC"),
            "outputs": [{"name": "y", "region": "rC", "out": 0, "layout": "row_major"}],
        },
    }


# --------------------------------------------------------------------------- #
# tests
# --------------------------------------------------------------------------- #


def test_k1_plan_reduces_to_single_region(fixture_mlir_path, aie_context):
    """WL-03: the k=1 plan binds exactly the region's 5-arg arg-spec in order.

    Behavior-equivalent to calling ``StreamFusedRegion`` directly (proven headless by
    inspecting the plan): 4 inputs (x, w_gate, w_up, w_down) then 1 output (y).
    """
    manifest = load_manifest(_k1_manifest(str(fixture_mlir_path)))
    workload = StreamWorkload(manifest, context=aie_context)
    plan = workload.build_plan()

    assert plan.order == ["r0"]
    assert plan.intermediates == []

    bindings = plan.region_bindings["r0"]
    assert len(bindings) == 5
    assert bindings == [
        WorkloadInput("x"),
        WorkloadWeight("w_gate"),
        WorkloadWeight("w_up"),
        WorkloadWeight("w_down"),
        WorkloadOutput("y"),
    ]


def test_edge_intermediate_sized_from_producer_argspec(fixture_mlir_path, aie_context):
    """WL-02: the edge intermediate is sized from the producer region's arg-spec out-slot.

    Derived, not hardcoded: read rA's arg-spec directly and compare (the fixture's
    single output slot is (256,512) bf16).
    """
    manifest = load_manifest(_two_region_manifest(str(fixture_mlir_path)))
    workload = StreamWorkload(manifest, context=aie_context)
    plan = workload.build_plan()

    assert len(plan.intermediates) == 1
    spec = plan.intermediates[0]
    assert isinstance(spec, BufferSpec)

    # Ground truth read straight from the producer region's arg-spec out-slot.
    producer_arg = workload.regions["rA"].get_arg_spec()[-1]
    assert spec.shape == tuple(producer_arg.shape)
    assert np.dtype(spec.dtype) == np.dtype(producer_arg.dtype)

    # And concretely (the fixture's single output): (256,512) bf16.
    assert spec.shape == FIXTURE_OUT_SLOT_SHAPE
    assert spec.producer_region == "rA"
    assert spec.out_slot == 0


def test_edge_handle_placed_at_consumer_in_slot(fixture_mlir_path, aie_context):
    """The Intermediate handle lands at the consumer in-slot (and producer out-slot).

    rB's in-slot 0 (arg-spec index 0) carries Intermediate(0); rB's weights sit at
    their in-slots and the workload output sits at rB's out-slot. The same resident
    buffer is also bound at rA's out-slot.
    """
    manifest = load_manifest(_two_region_manifest(str(fixture_mlir_path)))
    workload = StreamWorkload(manifest, context=aie_context)
    plan = workload.build_plan()

    rb = plan.region_bindings["rB"]
    assert len(rb) == 5
    assert rb == [
        Intermediate(0),  # consumer in-slot 0 (edge from rA)
        WorkloadWeight("rB_w_gate"),
        WorkloadWeight("rB_w_up"),
        WorkloadWeight("rB_w_down"),
        WorkloadOutput("y"),  # rB out-slot 0
    ]

    # The same edge buffer is bound at the producer rA's out-slot (last arg).
    ra = plan.region_bindings["rA"]
    assert len(ra) == 5
    assert ra[0] == WorkloadInput("x")
    assert ra[-1] == Intermediate(0)


def test_build_plan_no_npu(fixture_mlir_path, aie_context):
    """build_plan() never imports pyxrt / the XRTTensor module (headless)."""
    # Defensive: not already imported by an earlier test in the session.
    assert sys.modules.get("pyxrt") is None

    manifest = load_manifest(_k1_manifest(str(fixture_mlir_path)))
    workload = StreamWorkload(manifest, context=aie_context)
    plan = workload.build_plan()

    assert plan is not None
    assert sys.modules.get("pyxrt") is None
    assert "aie.utils.hostruntime.xrtruntime.tensor" not in sys.modules
    # run() exists (the guarded NPU path) but must NOT be called on this host.
    assert callable(workload.run)


def test_topo_order_used_for_dispatch(fixture_mlir_path, aie_context):
    """A 3-region chain dispatches in topo order with a binding entry per region."""
    manifest = load_manifest(_three_region_chain(str(fixture_mlir_path)))
    workload = StreamWorkload(manifest, context=aie_context)
    plan = workload.build_plan()

    assert plan.order == ["rA", "rB", "rC"]
    assert set(plan.region_bindings) == {"rA", "rB", "rC"}
    for region_id in plan.order:
        assert len(plan.region_bindings[region_id]) == 5
    # Two edges -> two resident intermediates, each (256,512) bf16 from the producer.
    assert len(plan.intermediates) == 2
    for spec in plan.intermediates:
        assert spec.shape == FIXTURE_OUT_SLOT_SHAPE


def test_unfed_slot_raises(fixture_mlir_path, aie_context):
    """An arg-spec in-slot with no io binding and no edge -> build_plan() ValueError.

    The arg-spec-aware unfed-slot check deferred from 02-01: the manifest omits the
    ``w_down`` weight (in-slot 3), which manifest.validate() cannot catch (it lacks the
    arg-spec), so the executor must.
    """
    data = _k1_manifest(str(fixture_mlir_path))
    # Drop the w_down weight (in-slot 3) -> arg index 3 is left unfed.
    data["io"]["weights"] = [w for w in data["io"]["weights"] if w["name"] != "w_down"]

    workload = StreamWorkload(load_manifest(data), context=aie_context)
    with pytest.raises(ValueError) as exc:
        workload.build_plan()
    message = str(exc.value)
    assert "r0" in message
    assert "arg index 3" in message
