#!/bin/bash
D=/home/micas/iron-stream-dse/experiments/flash_dse
for s in 512 2048 8192; do $D/eqrun.sh $s 8 8 1 4 20; done
echo "EQ24 DONE"
