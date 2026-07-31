#!/bin/bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <compile|run> <command> [arguments...]" >&2
  exit 64
fi

profile=$1
shift

case "$profile" in
  compile)
    wall_time=15s
    cpu_time=10:12
    memory=1073741824:1073741824
    processes=64:64
    file_size=16777216:16777216
    ;;
  run)
    wall_time=5s
    cpu_time=3:4
    memory=134217728:134217728
    processes=16:16
    file_size=1048576:1048576
    ;;
  *)
    echo "idk what $profile is" >&2
    exit 64
    ;;
esac

exec /usr/bin/timeout \
  --signal=TERM \
  --kill-after=1s \
  "$wall_time" \
  /usr/bin/prlimit \
  --cpu="$cpu_time" \
  --as="$memory" \
  --nproc="$processes" \
  --fsize="$file_size" \
  --nofile=64:64 \
  --core=0:0 \
  -- \
  "$@"
