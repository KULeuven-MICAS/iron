#!/bin/bash
D=/home/micas/iron-stream-dse/experiments/flash_dse
# (1) equalised re-measurement, 12 cores, priority order
for s in 4096 8192 256 1024 512 2048; do $D/eqrun.sh $s 4 4 1 4 20; done
# best-vs-best, 24 cores
for s in 4096 1024; do $D/eqrun.sh $s 8 8 1 4 20; done
# (2) heads sweep for the intercept, both designs, seq 1024 and 4096
for h in 2 4 8; do $D/eqrun.sh 1024 4 4 $h 3 15; done
for h in 2 4 8; do $D/eqrun.sh 4096 4 4 $h 3 10; done
for h in 2 4 8; do $D/eqrun.sh 256 4 4 $h 3 20; done
echo "EQALL DONE"
