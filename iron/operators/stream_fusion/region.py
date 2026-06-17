# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""The generic, self-describing ``StreamFusedRegion`` operator.

``StreamFusedRegion`` is an :class:`~iron.common.MLIROperator` that builds a
stream-dse-generated fused design *config-free*: it derives its runtime arg-spec
and its kernel object/symbol links directly from the design's MLIR text, rather
than from per-operator hand-written kernel configuration.

It accepts its MLIR from EITHER:

- a pre-generated ``.mlir`` file path (e.g. the SwiGLU fixture, used for
  hermetic verification without invoking stream-dse), OR
- a :class:`~iron.common.DesignGenerator` (lazy stream-dse codegen, the same
  mechanism the hardcoded ``SwiGLUPrefillStream`` baseline uses).

The only per-region configuration is the thin ``out_count`` hint (REG-01): the
number of trailing runtime args that are outputs. Everything else -- shapes,
dtypes, kernel sources, compile flags and symbol renames -- is discovered from
the MLIR via :mod:`iron.operators.stream_fusion.mlir_introspect` and resolved by
:mod:`iron.operators.stream_fusion.kernel_resolver`.

The class wires the three modules together:

    MLIR text
      |- parse_runtime_args(text, out_count)            -> AIERuntimeArgSpec[]
      `- resolve_kernels(collect_kernel_links(text), .. -> KernelObjectArtifact[]
                                                            |
                                                            `- get_artifacts(...)
                                                               -> xclbin + insts

``set_up_artifacts`` replicates the baseline exactly:
``get_artifacts(dynamic_obj_fifos=True)`` then append ``--no-unified`` to the
xclbin flags. The kernel directory is taken from
:func:`iron.common.device_utils.get_kernel_dir` -- the same device-derived call
the baseline ``SwiGLUPrefillStream`` uses -- so the resolved kernel sources match
the real hardware target rather than a hardcoded default.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

import aie.utils as aie_utils

from iron.common import (
    MLIROperator,
    SourceArtifact,
    PythonGeneratedMLIRArtifact,
    DesignGenerator,
)
from iron.common.device_utils import get_kernel_dir

from iron.operators.stream_fusion.mlir_introspect import (
    parse_runtime_args,
    collect_kernel_links,
)
from iron.operators.stream_fusion.kernel_resolver import resolve_kernels


@dataclass
class StreamFusedRegion(MLIROperator):
    """A config-free region built from a self-describing stream-dse MLIR design.

    Args:
        mlir: The design's MLIR source. Either a ``str``/:class:`pathlib.Path`
            pointing at a pre-generated ``.mlir`` file, or a
            :class:`~iron.common.DesignGenerator` that lazily produces the MLIR
            text (via stream-dse) when called.
        out_count: Number of trailing runtime args treated as outputs (REG-01).
            The only per-region configuration hint. Defaults to 1.
        name_hint: Stable component of the operator name. Used to build a
            deterministic name without depending on the (possibly variable)
            ``mlir`` field, so the name is well-defined even when ``mlir`` is a
            ``DesignGenerator``.
        context: The :class:`~iron.common.AIEContext`. ``context.base_dir`` is
            the repository root under which kernel sources live.
    """

    mlir: "str | Path | DesignGenerator"
    out_count: int = 1
    name_hint: str = "stream_fused_region"
    context: Any = field(default=None, repr=False, compare=False)

    def __post_init__(self) -> None:
        # AIEOperatorBase.__init__ resolves the context (default if None) and
        # initialises the artifact graph. Mirrors SwiGLUPrefillStream.
        MLIROperator.__init__(self, context=self.context)
        self._cached_mlir_text: str | None = None

    @property
    def name(self) -> str:
        """Stable operator name.

        Overridden (rather than relying on the @dataclass field-derived name in
        :class:`MLIROperator`) because the ``mlir`` field may be a
        ``DesignGenerator`` -- not a clean name component -- and because the
        base ``name`` requires a live device. Here the device suffix is appended
        only when a device is actually available, so the name is well-defined on
        a host with no NPU (needed for the build-graph dry-run and for
        introspection-only use).
        """
        base = f"StreamFusedRegion_{self.name_hint}_o{self.out_count}"
        device = aie_utils.get_current_device()
        if device is not None:
            return f"{base}_{device.resolve().name}"
        return base

    # --- MLIR text access --------------------------------------------------

    def _mlir_text(self) -> str:
        """Return the design's MLIR text, caching it after the first load.

        For a file path the text is read from disk; for a ``DesignGenerator`` it
        is produced by invoking the generator (which imports and runs the
        stream-dse codegen function). The fixture/file path avoids any
        stream-dse / NPU dependency, which is what keeps the unit tests hermetic.
        """
        if self._cached_mlir_text is None:
            if isinstance(self.mlir, DesignGenerator):
                self._cached_mlir_text = str(self.mlir())
            else:
                self._cached_mlir_text = Path(self.mlir).read_text()
        return self._cached_mlir_text

    # --- MLIROperator contract --------------------------------------------

    def get_mlir_artifact(self):
        """Return the MLIR compilation artifact.

        A :class:`~iron.common.PythonGeneratedMLIRArtifact` wrapping the
        ``DesignGenerator`` (lazy stream-dse codegen) when ``mlir`` is a
        generator, otherwise a :class:`~iron.common.SourceArtifact` pointing at
        the pre-generated ``.mlir`` file.
        """
        if isinstance(self.mlir, DesignGenerator):
            return PythonGeneratedMLIRArtifact(f"{self.name}.mlir", self.mlir)
        # Resolve to an absolute path: CompilationArtifactGraph.move_artifacts()
        # rewrites *relative* artifact paths into the build dir, which would point
        # a pre-generated source MLIR at a non-existent build/<file> and break the
        # dependency graph (the SourceArtifact would never be available). An
        # absolute path is left untouched, so the fixture/file is found as-is.
        return SourceArtifact(Path(self.mlir).resolve())

    def get_arg_spec(self):
        """Discover the runtime arg-spec from the MLIR (shapes/dtypes/direction).

        Shapes and dtypes come from the ``aie.runtime_sequence`` signature;
        direction is derived from the ``out_count`` hint (last ``out_count`` args
        are outputs).
        """
        return parse_runtime_args(self._mlir_text(), self.out_count)

    def get_kernel_artifacts(self):
        """Resolve every linked kernel object from the MLIR, config-free.

        Discovers each ``link_with`` object + its called symbols and maps them to
        concrete :class:`~iron.common.KernelObjectArtifact` recipes via the
        kernel-family registry. The kernel directory is the device-derived
        :func:`get_kernel_dir` value (same as the baseline), so resolved sources
        match the real hardware target.
        """
        return resolve_kernels(
            collect_kernel_links(self._mlir_text()),
            base_dir=self.context.base_dir,
            kernel_dir=get_kernel_dir(),
        )

    def set_up_artifacts(self) -> None:
        """Declare the build graph, replicating the baseline's flags exactly.

        ``--dynamic-objFifos`` (both targets, via ``dynamic_obj_fifos=True``) and
        ``--no-unified`` (xclbin only) -- a placed/routed stream-dse design links
        a distinct kernel object per core and is compiled per-core.
        """
        xclbin_artifact, insts_artifact = self.get_artifacts(dynamic_obj_fifos=True)
        xclbin_artifact.extra_flags.append("--no-unified")
        self.xclbin_artifact = xclbin_artifact
        self.insts_artifact = insts_artifact
        self.add_artifacts([xclbin_artifact, insts_artifact])
