#!/bin/bash
cd /home/micas/iron-stream-dse
R=./experiments/flash_dse/run.sh
echo "=== 2B: flash seq sweep at c4 ==="
for s in 512 768 1536 2048 3072; do IRON_FUSED_COLUMNS=4 $R flash_s${s}_c4 --design flash --seq $s; done
echo "=== 2C: flash column probes ==="
IRON_FUSED_COLUMNS=1 $R flash_s1024_c1 --design flash --seq 1024
IRON_FUSED_COLUMNS=2 $R flash_s512_c2  --design flash --seq 512
IRON_FUSED_COLUMNS=2 $R flash_s2048_c2 --design flash --seq 2048
IRON_FUSED_COLUMNS=8 $R flash_s512_c8  --design flash --seq 512
IRON_FUSED_COLUMNS=8 $R flash_s2048_c8 --design flash --seq 2048
echo "=== 2E: intermediate seq for mha ==="
for s in 512 2048; do for p in 4 8; do $R mha_s${s}_p${p} --design mha --seq $s --pipelines $p; done; done
echo "PART2B DONE"
