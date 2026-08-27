#!/bin/bash
D=/home/micas/iron-stream-dse/experiments/flash_dse
for s in 4096 1024; do $D/altrun.sh $s 8 8 5 20; done
echo "ALT24 DONE"
