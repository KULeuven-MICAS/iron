# SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""CI entry point for the stream_fusion test suite.

The repository's ``pytest.ini`` sets ``python_files = test.py``, so only files
named ``test.py`` are auto-collected. The detailed unit tests live under
``tests/test_*.py`` (GSD plan layout); this module re-exports their test
functions and the shared fixtures so the default ``pytest`` run discovers them.

These tests are hermetic: they operate on a copied MLIR fixture and require
neither an NPU nor stream-dse.
"""

from pathlib import Path

import pytest


@pytest.fixture
def fixture_mlir_path() -> Path:
    """Absolute path to the copied SwiGLU stream MLIR fixture."""
    return Path(__file__).parent / "tests" / "fixtures" / "swiglu_prefill_stream.mlir"


@pytest.fixture
def fixture_mlir_text(fixture_mlir_path: Path) -> str:
    """Text of the copied SwiGLU stream MLIR fixture."""
    return fixture_mlir_path.read_text()


# Re-export the test functions so `python_files = test.py` collects them.
from iron.operators.stream_fusion.tests.test_mlir_introspect import *  # noqa: E402,F401,F403
from iron.operators.stream_fusion.tests.test_kernel_resolver import *  # noqa: E402,F401,F403
from iron.operators.stream_fusion.tests.test_region import *  # noqa: E402,F401,F403
from iron.operators.stream_fusion.tests.test_manifest import *  # noqa: E402,F401,F403
from iron.operators.stream_fusion.tests.test_workload import *  # noqa: E402,F401,F403
from iron.operators.stream_fusion.tests.test_emitter import *  # noqa: E402,F401,F403
from iron.operators.stream_fusion.tests.test_onnx_frontend import *  # noqa: E402,F401,F403
