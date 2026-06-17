# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""The manifest-driven ``StreamWorkload`` executor.

``StreamWorkload`` turns a :class:`~iron.operators.stream_fusion.manifest.WorkloadManifest`
(02-01) into a runnable multi-region design built on top of one
:class:`~iron.operators.stream_fusion.region.StreamFusedRegion` per
:class:`~iron.operators.stream_fusion.manifest.RegionSpec`. It is responsible for:

1. **Per-region compilation** -- one ``StreamFusedRegion`` per region, built straight
   from the region's ``RegionSpec`` (``mlir`` + ``out_count`` + ``id`` as ``name_hint``).
   ``compile(dry_run=True)`` plans the build with no NPU.

2. **Edge buffer sizing** -- for each inter-region :class:`~iron.operators.stream_fusion.manifest.Edge`
   the resident intermediate's ``(shape, dtype)`` is **derived from the PRODUCER region's
   arg-spec at its out-slot**, never hardcoded. The out-slot ``j`` maps to arg-spec index
   ``n - out_count + j`` (the slot-index convention 02-01 documented).

3. **A headless dispatch plan** -- :meth:`StreamWorkload.build_plan` returns a pure-data,
   inspectable :class:`DispatchPlan`: the topo order, the per-edge intermediate
   :class:`BufferSpec` list, and per region the ordered list of buffer *handles*
   (:class:`WorkloadInput` / :class:`WorkloadWeight` / :class:`WorkloadOutput` /
   :class:`Intermediate`) in that region's arg-spec arg order. This is the
   behavior-equivalence contract proven by the no-NPU tests.

4. **A guarded NPU dispatch** -- :meth:`StreamWorkload.run` allocates an ``XRTTensor`` per
   edge intermediate and per workload output, then calls each region's ``get_callable()``
   in topo order passing buffers in arg-spec order. ``XRTTensor`` is imported **inside**
   :meth:`run` so importing this module -- and building the plan -- needs no ``pyxrt`` /
   NPU. :meth:`run` is intentionally NOT exercised by the no-NPU unit tests.

Design-for-testability (CONTEXT.md "Claude's discretion"): the topo/binding LOGIC is the
``build_plan`` pure-data path; the only NPU-touching code (``XRTTensor`` allocation and
``get_callable()`` dispatch) lives in :meth:`run`. The tests assert on ``build_plan``.

Slot-index <-> arg-spec mapping (from 02-01)
--------------------------------------------

With ``n`` total runtime args and ``out_count`` outputs (the last ``out_count`` args are
``"out"``):

- An **in**-slot ``k`` (``consumer.in`` / io input/weight ``in``) maps directly to arg-spec
  index ``k`` -- the inputs lead the signature, so the input arg positions are exactly
  ``0 .. n - out_count - 1``.
- An **out**-slot ``j`` (``producer.out`` / io output ``out``) maps to arg-spec index
  ``n - out_count + j``.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import TYPE_CHECKING, Any, Union

from iron.common import AIEContext

from iron.operators.stream_fusion.manifest import (
    WorkloadManifest,
    topo_order,
    validate,
)
from iron.operators.stream_fusion.region import StreamFusedRegion

if TYPE_CHECKING:  # pragma: no cover - typing only; never imported at runtime
    from aie.utils.hostruntime.xrtruntime.tensor import XRTTensor


# --------------------------------------------------------------------------- #
# plan value types (pure data; no XRT)
# --------------------------------------------------------------------------- #


@dataclass(frozen=True)
class BufferSpec:
    """The size of a resident intermediate buffer backing one inter-region edge.

    ``shape`` and ``dtype`` are read from the PRODUCER region's arg-spec at its
    out-slot (NOT hardcoded). ``producer_region`` / ``out_slot`` record where the
    size came from so the plan stays self-describing.
    """

    shape: tuple[int, ...]
    dtype: Any
    producer_region: str
    out_slot: int


@dataclass(frozen=True)
class WorkloadInput:
    """A buffer handle for a workload input tensor, by binding ``name``."""

    name: str


@dataclass(frozen=True)
class WorkloadWeight:
    """A buffer handle for a workload weight tensor, by binding ``name``."""

    name: str


@dataclass(frozen=True)
class WorkloadOutput:
    """A buffer handle for a workload output tensor, by binding ``name``."""

    name: str


@dataclass(frozen=True)
class Intermediate:
    """A buffer handle for a resident edge intermediate, by ``edge_index``.

    ``edge_index`` indexes :attr:`DispatchPlan.intermediates` (== the edge's index
    in ``manifest.edges``).
    """

    edge_index: int


# A region-binding entry is one of the tagged handle types above.
Handle = Union[WorkloadInput, WorkloadWeight, WorkloadOutput, Intermediate]


@dataclass(frozen=True)
class DispatchPlan:
    """The inspectable, pure-data dispatch plan produced by :meth:`StreamWorkload.build_plan`.

    Attributes:
        order: Region ids in topo dispatch order (``topo_order(manifest)``).
        intermediates: One :class:`BufferSpec` per ``manifest.edges`` entry, in edge
            order; each sized from its producer region's arg-spec out-slot.
        region_bindings: Per region id, the ordered list of buffer handles in that
            region's arg-spec arg order (length == ``len(region.get_arg_spec())``).
    """

    order: list[str]
    intermediates: list[BufferSpec]
    region_bindings: dict[str, list[Handle]]


# --------------------------------------------------------------------------- #
# executor
# --------------------------------------------------------------------------- #


class StreamWorkload:
    """A manifest-driven multi-region executor over :class:`StreamFusedRegion`.

    Construction validates + topo-orders the manifest and builds one
    ``StreamFusedRegion`` per region. :meth:`build_plan` is the headless wiring
    contract (no NPU); :meth:`run` is the guarded NPU dispatch path.
    """

    def __init__(self, manifest: WorkloadManifest, context: Any = None) -> None:
        # Resolve a context the same way the operators do (default if None), so a
        # workload can be built on a no-NPU host for planning/introspection.
        self.context = context if context is not None else AIEContext()
        self.manifest = manifest

        # Manifest-level checks (references, out-slot bounds, single-feed, acyclic).
        validate(manifest)

        # Topo dispatch order, computed up front and reused by build_plan/run.
        self.order: list[str] = topo_order(manifest)

        # One config-free region per RegionSpec. mlir + out_count map 1:1; the
        # region id becomes the operator name_hint.
        self.regions: dict[str, StreamFusedRegion] = {
            spec.id: StreamFusedRegion(
                mlir=spec.mlir,
                out_count=spec.out_count,
                name_hint=spec.id,
                context=self.context,
            )
            for spec in manifest.regions
        }

        # Per-region out_count, indexed by id (used for the out-slot arg mapping).
        self._out_count: dict[str, int] = {
            spec.id: spec.out_count for spec in manifest.regions
        }

    # --- compilation ------------------------------------------------------- #

    def compile(self, dry_run: bool = False) -> "StreamWorkload":
        """Compile (build/parse) every region.

        ``dry_run=True`` plans the build graph only (no NPU), mirroring
        :meth:`StreamFusedRegion.compile`. Returns ``self`` for chaining.
        """
        for region_id in self.order:
            self.regions[region_id].compile(dry_run=dry_run)
        return self

    # --- arg-spec helpers (parse-only; no NPU) ----------------------------- #

    def _arg_spec(self, region_id: str) -> list[Any]:
        """The region's runtime arg-spec (``list[AIERuntimeArgSpec]``), parse-only."""
        return self.regions[region_id].get_arg_spec()

    def _out_slot_argindex(self, region_id: str, out_j: int) -> int:
        """Map out-slot ``out_j`` to its absolute arg-spec index.

        out index ``j`` -> arg-spec index ``n - out_count + j`` (02-01 convention).
        """
        n = len(self._arg_spec(region_id))
        out_count = self._out_count[region_id]
        return n - out_count + out_j

    # --- the headless plan ------------------------------------------------- #

    def build_plan(self) -> DispatchPlan:
        """Build the pure-data dispatch plan (no XRT, no NPU).

        Computes the topo order, sizes each edge intermediate from its producer
        region's arg-spec out-slot, and assembles each region's ordered buffer-handle
        list in arg-spec arg order. A single edge's resident :class:`Intermediate`
        buffer is bound to BOTH endpoints -- the producer region's out-slot (where it
        is written) and the consumer region's in-slot (where it is read) -- since it is
        one shared resident tensor. Raises :class:`ValueError` if any region arg-spec
        position is left unfed (the arg-spec-aware "unfed slot" check 02-01 deferred to
        the executor) or assigned twice.
        """
        order = list(self.order)

        # 1. Edge intermediates, sized from the PRODUCER arg-spec out-slot.
        intermediates: list[BufferSpec] = []
        for edge in self.manifest.edges:
            prod_region = edge.producer.region
            arg_index = self._out_slot_argindex(prod_region, edge.producer.out)
            arg = self._arg_spec(prod_region)[arg_index]
            intermediates.append(
                BufferSpec(
                    shape=tuple(arg.shape),
                    dtype=arg.dtype,
                    producer_region=prod_region,
                    out_slot=edge.producer.out,
                )
            )

        # 2. Per-region ordered handle list, filled by arg-spec absolute index.
        region_bindings: dict[str, list[Handle]] = {}
        for region_id in order:
            n = len(self._arg_spec(region_id))
            slots: list[Handle | None] = [None] * n

            def _assign(arg_index: int, handle: Handle, source: str) -> None:
                if not (0 <= arg_index < n):
                    raise ValueError(
                        f"region '{region_id}' {source} maps to arg index "
                        f"{arg_index}, out of range for its {n}-arg arg-spec"
                    )
                if slots[arg_index] is not None:
                    raise ValueError(
                        f"region '{region_id}' arg index {arg_index} assigned "
                        f"twice ({slots[arg_index]!r} and {handle!r} from {source})"
                    )
                slots[arg_index] = handle

            # io inputs / weights -> in-slot k maps directly to arg-spec index k.
            for binding in self.manifest.io.inputs:
                if binding.region == region_id:
                    _assign(
                        binding.slot,
                        WorkloadInput(binding.name),
                        f"io input '{binding.name}'",
                    )
            for binding in self.manifest.io.weights:
                if binding.region == region_id:
                    _assign(
                        binding.slot,
                        WorkloadWeight(binding.name),
                        f"io weight '{binding.name}'",
                    )

            # edges touching this region -> the SAME resident Intermediate buffer is
            # bound to BOTH endpoints: the producer's out-slot (the region writes the
            # edge result there) and the consumer's in-slot (the region reads it). A
            # region is a producer for some edges and a consumer for others.
            for edge_index, edge in enumerate(self.manifest.edges):
                if edge.producer.region == region_id:
                    _assign(
                        self._out_slot_argindex(region_id, edge.producer.out),
                        Intermediate(edge_index),
                        f"edge {edge_index} producer out-slot",
                    )
                if edge.consumer.region == region_id:
                    _assign(
                        edge.consumer.in_,
                        Intermediate(edge_index),
                        f"edge {edge_index} consumer in-slot",
                    )

            # io outputs -> out-slot j maps to arg-spec index n - out_count + j.
            for binding in self.manifest.io.outputs:
                if binding.region == region_id:
                    _assign(
                        self._out_slot_argindex(region_id, binding.slot),
                        WorkloadOutput(binding.name),
                        f"io output '{binding.name}'",
                    )

            # arg-spec-aware unfed-slot check (deferred from 02-01).
            for arg_index, handle in enumerate(slots):
                if handle is None:
                    raise ValueError(
                        f"region '{region_id}' arg index {arg_index} is unfed: no "
                        f"io binding or edge feeds it (arg-spec has {n} args)"
                    )

            region_bindings[region_id] = [h for h in slots]  # type: ignore[misc]

        return DispatchPlan(
            order=order,
            intermediates=intermediates,
            region_bindings=region_bindings,
        )

    # --- the guarded NPU dispatch ----------------------------------------- #

    def run(self, inputs: dict[str, "XRTTensor"]) -> dict[str, "XRTTensor"]:
        """Dispatch the workload on an NPU (GUARDED; not covered by no-NPU tests).

        Allocates an ``XRTTensor`` per edge intermediate and per workload output
        (sized from the plan's :class:`BufferSpec` / the producing region's arg-spec
        out-slot), binds workload inputs/weights and the intermediates, then calls
        each region's ``get_callable()`` in topo order passing buffers in arg-spec
        arg order. Returns the workload-output buffers keyed by output name.

        ``XRTTensor`` is imported INSIDE this method, so importing this module and
        calling :meth:`build_plan` need no ``pyxrt`` / NPU. This live path is the
        contract to exercise once hardware is available; :meth:`build_plan` is the
        headless wiring contract the unit tests assert on.

        Args:
            inputs: Workload input/weight buffers keyed by io-binding ``name``.

        Returns:
            Workload output buffers keyed by io-output ``name``.
        """
        from aie.utils.hostruntime.xrtruntime.tensor import XRTTensor

        plan = self.build_plan()

        # Allocate one resident XRTTensor per edge intermediate, from its BufferSpec.
        edge_buffers: list[Any] = [
            XRTTensor(spec.shape, dtype=spec.dtype) for spec in plan.intermediates
        ]

        # Allocate one output XRTTensor per io output, sized from the region out-slot.
        output_buffers: dict[str, Any] = {}
        for binding in self.manifest.io.outputs:
            arg_index = self._out_slot_argindex(binding.region, binding.slot)
            arg = self._arg_spec(binding.region)[arg_index]
            output_buffers[binding.name] = XRTTensor(
                tuple(arg.shape), dtype=arg.dtype
            )

        def _resolve(handle: Handle) -> Any:
            if isinstance(handle, (WorkloadInput, WorkloadWeight)):
                return inputs[handle.name]
            if isinstance(handle, Intermediate):
                return edge_buffers[handle.edge_index]
            if isinstance(handle, WorkloadOutput):
                return output_buffers[handle.name]
            raise TypeError(f"unknown buffer handle: {handle!r}")  # pragma: no cover

        for region_id in plan.order:
            buffers = [_resolve(h) for h in plan.region_bindings[region_id]]
            op_func = self.regions[region_id].get_callable()
            op_func(*buffers)

        return output_buffers
