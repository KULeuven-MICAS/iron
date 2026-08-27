#!/bin/bash
# Window-equalised, process-level alternation (one hw context per process).
source /opt/xilinx/xrt/setup.sh >/dev/null 2>&1
cd /home/micas/iron-stream-dse
D=/home/micas/iron-stream-dse/experiments/flash_dse
P=/home/micas/iron-stream-dse-venv/bin/python3
S=/tmp/claude-1000/-home-micas-iron-stream-dse/85f85c3e-8a25-40c8-96d6-0b089fa815a4/scratchpad
SEQ=$1; COLS=$2; PIPES=$3; HEADS=${4:-1}; ROUNDS=${5:-4}; PER=${6:-20}
for r in $(seq 1 $ROUNDS); do
  for who in ours mha; do
    $P $S/equal.py --seq $SEQ --columns $COLS --pipelines $PIPES --heads $HEADS \
       --rounds $PER --warmup 10 --only $who --root $D/eq 2>>"$D/logs/eq.err" \
     | grep '^###JSON###' | sed 's/^###JSON###//' >> "$D/results/eq.jsonl"
  done
done
echo "EQ DONE seq=$SEQ c=$COLS p=$PIPES h=$HEADS"
