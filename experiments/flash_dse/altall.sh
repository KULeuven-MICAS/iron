#!/bin/bash
D=/home/micas/iron-stream-dse/experiments/flash_dse
# priority order from the coordinator
for s in 4096 8192 256 1024 512 2048; do
  $D/altrun.sh $s 4 4 6 20
done
echo "ALTALL DONE"
