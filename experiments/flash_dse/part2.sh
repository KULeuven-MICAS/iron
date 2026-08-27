#!/bin/bash
cd /home/micas/iron-stream-dse
R=./experiments/flash_dse/run.sh

echo "=== 2A: seq 256 grid ==="
for p in 1 2 4 8; do $R mha_s256_p${p} --design mha --seq 256 --pipelines $p; done
for c in 1 2 4; do IRON_FUSED_COLUMNS=$c $R flash_s256_c${c} --design flash --seq 256; done
IRON_FUSED_COLUMNS=8 $R flash_s256_c8 --design flash --seq 256
for c in 1 2 4 8; do IRON_FUSED_COLUMNS=$c $R k1c_s256_c${c} --design k1causal --seq 256; done
IRON_FUSED_COLUMNS=4 $R k1_s256_c4 --design k1 --seq 256
$R k3c_s256 --design k3causal --seq 256

echo "=== 2B: flash seq sweep at c4 ==="
for s in 512 768 1536 2048 3072; do IRON_FUSED_COLUMNS=4 $R flash_s${s}_c4 --design flash --seq $s; done

echo "=== 2C: flash column probes ==="
IRON_FUSED_COLUMNS=1 $R flash_s1024_c1 --design flash --seq 1024
IRON_FUSED_COLUMNS=1 $R flash_s4096_c1 --design flash --seq 4096
IRON_FUSED_COLUMNS=2 $R flash_s512_c2  --design flash --seq 512
IRON_FUSED_COLUMNS=2 $R flash_s2048_c2 --design flash --seq 2048
IRON_FUSED_COLUMNS=8 $R flash_s512_c8  --design flash --seq 512
IRON_FUSED_COLUMNS=8 $R flash_s2048_c8 --design flash --seq 2048

echo "=== 2D: heads sweep at seq 256 ==="
for h in 2 4 8; do IRON_FUSED_COLUMNS=4 $R flash_s256_c4_h${h} --design flash --seq 256 --heads $h; done
for h in 2 4 8; do $R mha_s256_p4_h${h} --design mha --seq 256 --pipelines 4 --heads $h; done

echo "=== 2E: intermediate seq for the recommendation ==="
for s in 512 2048; do
  for p in 4 8; do $R mha_s${s}_p${p} --design mha --seq $s --pipelines $p; done
done
echo "PART2 DONE"
