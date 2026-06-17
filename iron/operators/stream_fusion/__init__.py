# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""Generic StreamFusedRegion support.

This package provides the building blocks for a generic, self-describing
``StreamFusedRegion`` that derives its runtime arg-spec and kernel object/symbol
links directly from stream-dse-generated MLIR, rather than from per-operator
hand-written configuration.

It is built up across plans 01-01..01-03:

- 01-01: :mod:`mlir_introspect` -- parse the runtime arg-spec and the
  ``link_with`` object/symbol links out of MLIR text. No NPU, no stream-dse import.
- 01-02: kernel resolver registry built on top of the introspected links.
- 01-03 (this plan): the :class:`StreamFusedRegion` operator itself, tying
  introspection + resolver together into a config-free ``MLIROperator``.

``StreamFusedRegion`` is intentionally NOT registered in
``iron/operators/__init__.py`` yet -- the package stays self-contained for this
phase. A follow-up plan exports it alongside the other operators.
"""

from iron.operators.stream_fusion.region import StreamFusedRegion
from iron.operators.stream_fusion.manifest import (
    WorkloadManifest,
    RegionSpec,
    Edge,
    Producer,
    Consumer,
    IOBinding,
    WorkloadIO,
    ManifestError,
    load_manifest,
    load_manifest_file,
    topo_order,
    validate,
)
from iron.operators.stream_fusion.workload import (
    StreamWorkload,
    DispatchPlan,
    BufferSpec,
    WorkloadInput,
    WorkloadWeight,
    WorkloadOutput,
    Intermediate,
)
from iron.operators.stream_fusion.emitter import (
    emit_manifest_from_modules,
    emit_manifest_k1_from_mlir,
    emit_manifest_from_stream,
    manifest_to_dict,
    write_manifest,
)
from iron.operators.stream_fusion.onnx_frontend import (
    OnnxTensorDesc,
    OnnxWorkload,
    ingest_onnx,
    bind_onnx_to_region,
    golden_swiglu,
    golden_swiglu_from_reference,
)

__all__ = [
    "StreamFusedRegion",
    "WorkloadManifest",
    "RegionSpec",
    "Edge",
    "Producer",
    "Consumer",
    "IOBinding",
    "WorkloadIO",
    "ManifestError",
    "load_manifest",
    "load_manifest_file",
    "topo_order",
    "validate",
    "StreamWorkload",
    "DispatchPlan",
    "BufferSpec",
    "WorkloadInput",
    "WorkloadWeight",
    "WorkloadOutput",
    "Intermediate",
    "emit_manifest_from_modules",
    "emit_manifest_k1_from_mlir",
    "emit_manifest_from_stream",
    "manifest_to_dict",
    "write_manifest",
    "OnnxTensorDesc",
    "OnnxWorkload",
    "ingest_onnx",
    "bind_onnx_to_region",
    "golden_swiglu",
    "golden_swiglu_from_reference",
]
