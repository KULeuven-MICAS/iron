#!/bin/bash
cd /home/micas/iron-stream-dse
R=./experiments/flash_dse/run.sh
for seq in 1024 4096; do
  for p in 1 2 4 8; do
    $R mha_s${seq}_p${p} --design mha --seq $seq --pipelines $p
  done
  for c in 2 4 8; do
    IRON_FUSED_COLUMNS=$c $R flash_s${seq}_c${c} --design flash --seq $seq
  done
done
echo "PART1 DONE"
