# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""The one path from an operator's exported workload and emitted mapping to a
generated design.

Every stream-backed operator used to carry its own copy of the accelerator path,
solver backend, output root, cache-id scheme and ``optimize_allocation_co`` call,
and the copies drifted (one took a backend override, one passed traced tiles).
This module owns all of it; an operator contributes only its family name, its
shape string, and the design knobs that genuinely distinguish its designs.
"""

import os

import stream

from iron.common.stream.design import (
    stream_revision,
    trace_group,
    trace_size,
    trace_tile_list,
    trace_tiles,
)
from iron.common.stream.hardware import array

ACCELERATOR = os.path.join(
    os.path.dirname(stream.__file__),
    "inputs",
    "aie",
    "hardware",
    "whole_array_strix.yaml",
)

# License-free OR-Tools GSCIP unless the environment says otherwise.
BACKEND = os.environ.get("STREAM_BACKEND", "ortools_gscip")
OUTPUT_ROOT = "outputs"


def experiment_id(family: str, shape: str, suffix: str = "") -> str:
    """The design-cache key: every knob that changes the generated design must appear.

    The trace configuration and the installed stream revision are appended here so no
    operator can forget them; ``suffix`` carries the operator's own design knobs.
    """
    hardware = os.path.splitext(os.path.basename(ACCELERATOR))[0]
    grid = array()
    if os.environ.get("STREAM_TILE_FORCE"):
        # A forced tile choice is a different design; without this the probe run is
        # served the cached unforced one and measures nothing.
        suffix += f"_force_{os.environ['STREAM_TILE_FORCE']}"
    if trace_size():
        # The buffer size is compiled into the runtime sequence, so a design
        # generated for one size cannot serve another; same for which tiles.
        suffix += f"_traced{trace_size()}"
        for col, row in trace_tile_list():
            suffix += f"_{col}x{row}"
    return (
        f"{hardware}-{family}{suffix}_{shape}"
        f"-{grid.num_rows}_row_{grid.num_columns}_col-{stream_revision()}"
    )


def design_dir(experiment_id: str) -> str:
    return os.path.join(OUTPUT_ROOT, experiment_id)


def run_codegen(experiment_id: str, workload_path, mapping_path, npu: str) -> None:
    """Run stream-dse's constraint optimization and code generation once.

    Tile sizes are searched by stream around the mapping's declared seed; the
    mapping's tiling is a granule, not a decision.
    """
    from stream.api import optimize_allocation_co

    optimize_allocation_co(
        hardware=ACCELERATOR,
        workload=workload_path,
        mapping=mapping_path,
        experiment_id=experiment_id,
        output_path=OUTPUT_ROOT,
        skip_if_exists=False,
        enable_codegen=True,
        trace_size=trace_size(),
        trace_max_tiles=trace_tiles(),
        trace_group=trace_group(),
        trace_tiles=trace_tile_list(),
        nb_cols_to_use=array().num_columns,
        npu=npu,
        backend=BACKEND,
        tile_search=True,
    )
