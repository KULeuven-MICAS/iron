#!/bin/bash
D=/home/micas/iron-stream-dse/experiments/flash_dse
P=/home/micas/iron-stream-dse-venv/bin/python3
S=/tmp/claude-1000/-home-micas-iron-stream-dse/85f85c3e-8a25-40c8-96d6-0b089fa815a4/scratchpad
source /opt/xilinx/xrt/setup.sh >/dev/null 2>&1
cd /home/micas/iron-stream-dse
# fixed cost against column count at fixed seq: heads 1,2,4 give a least-squares intercept
for c in 2 8; do
  for h in 1 2 4; do
    for r in 1 2 3; do
      $P $S/equal.py --seq 1024 --columns $c --pipelines 4 --heads $h --rounds 15 \
         --warmup 10 --only ours --root $D/eq 2>>"$D/logs/eqcols.err" \
       | grep '^###JSON###' | sed 's/^###JSON###//' >> "$D/results/eq.jsonl"
    done
  done
done
echo "EQCOLS DONE"
