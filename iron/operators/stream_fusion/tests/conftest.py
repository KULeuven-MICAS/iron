# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

from pathlib import Path

import pytest


@pytest.fixture
def fixture_mlir_path() -> Path:
    """Absolute path to the copied SwiGLU stream MLIR fixture."""
    return Path(__file__).parent / "fixtures" / "swiglu_prefill_stream.mlir"


@pytest.fixture
def fixture_mlir_text(fixture_mlir_path: Path) -> str:
    """Text of the copied SwiGLU stream MLIR fixture."""
    return fixture_mlir_path.read_text()
