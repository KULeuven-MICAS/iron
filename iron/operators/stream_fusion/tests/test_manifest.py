# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Unit tests for the workload manifest (dataclasses + loader + Kahn topo + validate).

Pure data + graph logic: no NPU, no XRT, no stream-dse. Manifest dicts are built
inline by small helpers that return a *fresh* dict each call so a test may mutate a
single field without affecting the others.
"""

from __future__ import annotations

import json

import pytest

from iron.operators.stream_fusion.manifest import (
    Edge,
    IOBinding,
    ManifestError,
    RegionSpec,
    WorkloadManifest,
    load_manifest,
    load_manifest_file,
    topo_order,
    validate,
)


# --------------------------------------------------------------------------- #
# manifest dict builders (fresh dict per call)
# --------------------------------------------------------------------------- #


def _two_region_manifest() -> dict:
    """region_a out 0 -> region_b in 0; io x -> a.in0, y -> b.out0."""
    return {
        "regions": [
            {"id": "region_a", "mlir": "region_a.mlir", "out_count": 1, "layers": ["gate", "up"]},
            {"id": "region_b", "mlir": "region_b.mlir", "out_count": 1, "layers": ["down"]},
        ],
        "edges": [
            {"producer": {"region": "region_a", "out": 0}, "consumer": {"region": "region_b", "in": 0}},
        ],
        "io": {
            "inputs": [{"name": "x", "region": "region_a", "in": 0, "layout": "row_major"}],
            "weights": [],
            "outputs": [{"name": "y", "region": "region_b", "out": 0, "layout": "row_major"}],
        },
    }


def _linear_chain_manifest() -> dict:
    """a -> b -> c."""
    return {
        "regions": [
            {"id": "a", "mlir": "a.mlir", "out_count": 1, "layers": []},
            {"id": "b", "mlir": "b.mlir", "out_count": 1, "layers": []},
            {"id": "c", "mlir": "c.mlir", "out_count": 1, "layers": []},
        ],
        "edges": [
            {"producer": {"region": "a", "out": 0}, "consumer": {"region": "b", "in": 0}},
            {"producer": {"region": "b", "out": 0}, "consumer": {"region": "c", "in": 0}},
        ],
        "io": {
            "inputs": [{"name": "x", "region": "a", "in": 0, "layout": "row_major"}],
            "weights": [],
            "outputs": [{"name": "y", "region": "c", "out": 0, "layout": "row_major"}],
        },
    }


def _diamond_manifest() -> dict:
    """a -> b, a -> c, b -> d, c -> d."""
    return {
        "regions": [
            {"id": "a", "mlir": "a.mlir", "out_count": 2, "layers": []},
            {"id": "b", "mlir": "b.mlir", "out_count": 1, "layers": []},
            {"id": "c", "mlir": "c.mlir", "out_count": 1, "layers": []},
            {"id": "d", "mlir": "d.mlir", "out_count": 1, "layers": []},
        ],
        "edges": [
            {"producer": {"region": "a", "out": 0}, "consumer": {"region": "b", "in": 0}},
            {"producer": {"region": "a", "out": 1}, "consumer": {"region": "c", "in": 0}},
            {"producer": {"region": "b", "out": 0}, "consumer": {"region": "d", "in": 0}},
            {"producer": {"region": "c", "out": 0}, "consumer": {"region": "d", "in": 1}},
        ],
        "io": {
            "inputs": [{"name": "x", "region": "a", "in": 0, "layout": "row_major"}],
            "weights": [],
            "outputs": [{"name": "y", "region": "d", "out": 0, "layout": "row_major"}],
        },
    }


def _k1_manifest() -> dict:
    """1 region, no edges; io x -> region_0.in0, y -> region_0.out0."""
    return {
        "regions": [
            {"id": "region_0", "mlir": "region_0.mlir", "out_count": 1, "layers": ["gate", "up", "down"]},
        ],
        "edges": [],
        "io": {
            "inputs": [{"name": "x", "region": "region_0", "in": 0, "layout": "row_major"}],
            "weights": [],
            "outputs": [{"name": "y", "region": "region_0", "out": 0, "layout": "row_major"}],
        },
    }


# --------------------------------------------------------------------------- #
# load + dataclasses
# --------------------------------------------------------------------------- #


def test_load_preserves_layers():
    m = load_manifest(_two_region_manifest())
    assert isinstance(m, WorkloadManifest)
    assert len(m.regions) == 2
    assert len(m.edges) == 1
    assert isinstance(m.regions[0], RegionSpec)
    assert isinstance(m.edges[0], Edge)

    a = m.regions[0]
    assert a.id == "region_a"
    assert a.mlir == "region_a.mlir"
    assert a.out_count == 1
    # layers preserved verbatim (Design Decision 4: never collapsed).
    assert a.layers == ["gate", "up"]
    assert m.regions[1].layers == ["down"]

    # io round-trips: 1 input, 0 weights, 1 output.
    assert len(m.io.inputs) == 1
    assert m.io.weights == []
    assert len(m.io.outputs) == 1
    assert isinstance(m.io.inputs[0], IOBinding)
    assert m.io.inputs[0].direction == "in"
    assert m.io.inputs[0].slot == 0
    assert m.io.outputs[0].direction == "out"
    assert m.io.outputs[0].slot == 0

    # edge endpoints (note the `in` -> `in_` rename on the consumer endpoint).
    assert m.edges[0].producer.region == "region_a"
    assert m.edges[0].producer.out == 0
    assert m.edges[0].consumer.region == "region_b"
    assert m.edges[0].consumer.in_ == 0


def test_load_defaults_out_count_and_layers():
    data = {
        "regions": [{"id": "r0", "mlir": "r0.mlir"}],
        "edges": [],
        "io": {
            "inputs": [{"name": "x", "region": "r0", "in": 0, "layout": "row_major"}],
            "weights": [],
            "outputs": [{"name": "y", "region": "r0", "out": 0, "layout": "row_major"}],
        },
    }
    m = load_manifest(data)
    assert m.regions[0].out_count == 1
    assert m.regions[0].layers == []


def test_load_missing_required_key_raises():
    data = _two_region_manifest()
    del data["regions"][0]["mlir"]
    with pytest.raises(ManifestError):
        load_manifest(data)


def test_load_missing_layout_raises():
    data = _two_region_manifest()
    del data["io"]["inputs"][0]["layout"]
    with pytest.raises(ManifestError):
        load_manifest(data)


# --------------------------------------------------------------------------- #
# topo_order
# --------------------------------------------------------------------------- #


def test_topo_order_linear():
    m = load_manifest(_linear_chain_manifest())
    assert topo_order(m) == ["a", "b", "c"]


def test_topo_order_diamond():
    m = load_manifest(_diamond_manifest())
    order = topo_order(m)
    assert set(order) == {"a", "b", "c", "d"}
    pos = {r: i for i, r in enumerate(order)}
    # a before everything; d after everything; b and c between a and d.
    assert pos["a"] == 0
    assert pos["d"] == len(order) - 1
    assert pos["a"] < pos["b"] < pos["d"]
    assert pos["a"] < pos["c"] < pos["d"]


def test_topo_order_k1():
    m = load_manifest(_k1_manifest())
    assert topo_order(m) == ["region_0"]
    validate(m)  # no raise


def test_topo_order_no_edges_declaration_order():
    data = _linear_chain_manifest()
    data["edges"] = []
    m = load_manifest(data)
    assert topo_order(m) == ["a", "b", "c"]


# --------------------------------------------------------------------------- #
# validate
# --------------------------------------------------------------------------- #


def test_validate_ok():
    validate(load_manifest(_two_region_manifest()))
    validate(load_manifest(_linear_chain_manifest()))
    validate(load_manifest(_diamond_manifest()))


def test_validate_cycle():
    data = _two_region_manifest()
    # add region_b out 0 -> region_a in 0 to close the cycle.
    data["edges"].append(
        {"producer": {"region": "region_b", "out": 0}, "consumer": {"region": "region_a", "in": 1}}
    )
    m = load_manifest(data)
    with pytest.raises(ManifestError, match="cycle"):
        validate(m)


def test_validate_dangling_region():
    data = _two_region_manifest()
    data["edges"][0]["consumer"]["region"] = "region_x"
    m = load_manifest(data)
    with pytest.raises(ManifestError):
        validate(m)


def test_validate_dangling_out_slot():
    data = _two_region_manifest()
    # region_b has out_count 1; reference out index 5.
    data["io"]["outputs"][0]["out"] = 5
    m = load_manifest(data)
    with pytest.raises(ManifestError):
        validate(m)


def test_validate_double_feed():
    data = _two_region_manifest()
    # region_b in 0 is already fed by the edge; add an io input also feeding b.in0.
    data["io"]["inputs"].append(
        {"name": "z", "region": "region_b", "in": 0, "layout": "row_major"}
    )
    m = load_manifest(data)
    with pytest.raises(ManifestError, match="fed|double"):
        validate(m)


# --------------------------------------------------------------------------- #
# file loader
# --------------------------------------------------------------------------- #


def test_load_manifest_file_json(tmp_path):
    data = _two_region_manifest()
    path = tmp_path / "m.json"
    path.write_text(json.dumps(data))
    m_file = load_manifest_file(path)
    m_mem = load_manifest(data)
    assert topo_order(m_file) == topo_order(m_mem)
    validate(m_file)


def test_load_manifest_file_unknown_ext_raises(tmp_path):
    path = tmp_path / "m.txt"
    path.write_text("{}")
    with pytest.raises(ManifestError):
        load_manifest_file(path)
