#!/bin/bash

cp $1 "/run/media/pk/External HD1/Enviedistil_buildareas/workspace/in.c"

touch "/run/media/pk/External HD1/Enviedistil_buildareas/workspace/out"

bash ./limit.sh compile /usr/bin/bwrap \
  --die-with-parent \
  --ro-bind /usr /usr \
  --ro-bind /bin /bin \
  --ro-bind /lib /lib \
  --ro-bind /lib64 /lib64 \
  --ro-bind /usr/libexec /usr/libexec \
  --ro-bind /etc/alternatives /etc/alternatives \
  --dir /workspace \
  --ro-bind "/run/media/pk/External HD1/Enviedistil_buildareas/workspace" /workspace \
  --bind "/run/media/pk/External HD1/Enviedistil_buildareas/workspace/out" /workspace/out \
  --unshare-all \
  /usr/bin/gcc /workspace/in.c -o /workspace/out || exit $?
cp "/run/media/pk/External HD1/Enviedistil_buildareas/workspace/out" $2
