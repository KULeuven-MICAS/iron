#!/bin/bash
cd /home/micas/iron-stream-dse
R=./experiments/flash_dse/run.sh

# Consecutive identical runlist entries share ONE aiex.ConfigureOp
# (iron/common/compilation/sequence.py:279), so heads=h is
#   T(h) = configure + h * (per-run overhead + work)
# and  fixed = 2*T(1) - T(2),  work+run = T(2) - T(1).
echo "=== 3A: repeat-run, flash c4, across seq ==="
for s in 256 1024 4096; do
  for h in 2 3; do
    IRON_FUSED_COLUMNS=4 $R flash_s${s}_c4_H${h} --design flash --seq $s --heads $h
  done
done

echo "=== 3B: repeat-run, flash at seq 1024, across columns ==="
for c in 1 2 8; do
  IRON_FUSED_COLUMNS=$c $R flash_s1024_c${c}_H2 --design flash --seq 1024 --heads 2
done

echo "=== 3C: repeat-run, flash at seq 256, across columns ==="
for c in 1 2; do
  IRON_FUSED_COLUMNS=$c $R flash_s256_c${c}_H2 --design flash --seq 256 --heads 2
done

echo "=== 3D: iron/mha heads, same arithmetic (heads are internal, no reconfigure) ==="
for s in 1024 4096; do
  for h in 2 3; do $R mha_s${s}_p4_H${h} --design mha --seq $s --pipelines 4 --heads $h; done
done

echo "=== 3E: k=1 non-flash causal repeat-run at seq 256 (the cheaper small-seq design) ==="
IRON_FUSED_COLUMNS=4 $R k1c_s256_c4_H2 --design k1causal --seq 256 --heads 2
IRON_FUSED_COLUMNS=2 $R k1c_s256_c2_H2 --design k1causal --seq 256 --heads 2
echo "PART3 DONE"
