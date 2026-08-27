#!/bin/bash
source /opt/xilinx/xrt/setup.sh >/dev/null 2>&1
cd /home/micas/iron-stream-dse
SP=/tmp/claude-1000/-home-micas-iron-stream-dse/85f85c3e-8a25-40c8-96d6-0b089fa815a4/scratchpad
D=/home/micas/iron-stream-dse/experiments/flash_dse
P=/home/micas/iron-stream-dse-venv/bin/python3

# Root cause of the FUSED_COLUMNS=1 codegen failure, with the full traceback.
IRON_FUSED_COLUMNS=1 $P - > "$D/logs/c1_rootcause.txt" 2>&1 <<'PY'
import traceback
from iron.operators.mha_prefill_stream import stream_design as sd
try:
    sd.build_inputs(256, 64, "/tmp/c1probe", k=1, causal=True, flash=True)
    sd._run_codegen(256, 64, "npu2", 1, True, True)
except Exception:
    traceback.print_exc()
PY

$P "$SP/report.py"  > "$D/results/report.txt" 2>&1
$P "$SP/fit.py"     > "$D/results/fit.txt" 2>&1
$P "$SP/altreport.py" > "$D/results/altreport.txt" 2>&1
echo POSTDONE
