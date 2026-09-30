#!/usr/bin/env python3
# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""A generated design records, per fused group, the port activity stream reported for it."""

import json

from iron.common.stream.runner import (
    PORT_ACTIVITY,
    PORT_REPORT,
    solve_options,
    write_port_activity,
)

ROW = {"kind": "memory_port", "port": "dma.s2mm", "core_ids": [2], "utilization": 0.9}


def test_each_group_keeps_its_rows(tmp_path):
    allocations = {1: None, 0: {"performance": {"memory_ports": [ROW]}}}
    write_port_activity(str(tmp_path), allocations)
    assert json.loads((tmp_path / PORT_ACTIVITY).read_text()) == {
        "group_0": [ROW],
        "group_1": [],
    }


def test_every_solve_asks_for_the_report_without_a_bound(monkeypatch):
    from types import SimpleNamespace

    from iron.common.stream import runner

    monkeypatch.setattr(runner, "array", lambda: SimpleNamespace(num_columns=8))
    monkeypatch.setattr(runner, "library", lambda: None)
    assert PORT_REPORT == {"memory_ports": {"interval": False, "burst": False}}
    assert solve_options("npu2").families == [PORT_REPORT]
