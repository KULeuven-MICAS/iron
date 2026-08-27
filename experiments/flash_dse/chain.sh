#!/bin/bash
D=/home/micas/iron-stream-dse/experiments/flash_dse
until grep -q "ALTALL DONE" $D/altall.out 2>/dev/null; do sleep 20; done
$D/alt24.sh   > $D/alt24.out  2>&1
$D/part3.sh   > $D/part3.out  2>&1
$D/part2b.sh  > $D/part2b.out 2>&1
$D/post.sh    > $D/post.out   2>&1
echo CHAINDONE > $D/chain.out
