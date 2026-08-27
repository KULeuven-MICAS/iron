#!/bin/bash
# Process-level alternation: each process loads exactly ONE hw context, so the
# two designs never coexist on the device. Rounds interleave in wall-clock time.
source /opt/xilinx/xrt/setup.sh >/dev/null 2>&1
cd /home/micas/iron-stream-dse
D=/home/micas/iron-stream-dse/experiments/flash_dse
P=/home/micas/iron-stream-dse-venv/bin/python3
S=/tmp/claude-1000/-home-micas-iron-stream-dse/85f85c3e-8a25-40c8-96d6-0b089fa815a4/scratchpad
SEQ=$1; COLS=$2; PIPES=$3; ROUNDS=${4:-6}; PER=${5:-20}
for r in $(seq 1 $ROUNDS); do
  for who in ours mha; do
    $P $S/alternate.py --seq $SEQ --columns $COLS --pipelines $PIPES \
       --rounds $PER --only $who --root $D/alt 2>>"$D/logs/alt_s${SEQ}.err" \
     | grep '^###JSON###' | sed 's/^###JSON###//' >> "$D/results/alt.jsonl"
  done
done
echo "ALT DONE seq=$SEQ"
