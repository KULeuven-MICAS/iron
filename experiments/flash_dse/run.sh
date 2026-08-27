#!/bin/bash
# usage: run.sh TAG [env VAR=..] -- <measure.py args>
set -u
source /opt/xilinx/xrt/setup.sh >/dev/null 2>&1
cd /home/micas/iron-stream-dse
SP=/tmp/claude-1000/-home-micas-iron-stream-dse/85f85c3e-8a25-40c8-96d6-0b089fa815a4/scratchpad
TAG="$1"; shift
D=/home/micas/iron-stream-dse/experiments/flash_dse
mkdir -p "$D/builds/$TAG"
/home/micas/iron-stream-dse-venv/bin/python3 "$SP/measure.py" --tag "$TAG" \
  --build-dir "$D/builds/$TAG" "$@" > "$D/logs/$TAG.log" 2>&1
rc=$?
grep -h '^###JSON###' "$D/logs/$TAG.log" | sed 's/^###JSON###//' >> "$D/results/all.jsonl"
echo "rc=$rc tag=$TAG"
grep -h '^###JSON###' "$D/logs/$TAG.log" | sed 's/^###JSON###//' | /home/micas/iron-stream-dse-venv/bin/python3 -c "
import sys,json
for l in sys.stdin:
    r=json.loads(l)
    if r.get('ok'):
        d=r['dispatch_us']; n=r['numerics']
        print(f\"  OK  cores={r.get('cores')} median={d['median']:.1f}us min={d['min']:.1f} max={d['max']:.1f} sd={d['stdev']:.1f} errs={n['errors']}/{n['elements']} maxabs={n['max_abs_dev']:.3e} padded={r.get('padded')} build={r['build_s']:.0f}s\")
    else:
        print('  FAIL '+r.get('error','?'))
"
