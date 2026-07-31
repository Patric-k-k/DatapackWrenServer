#!/bin/bash

cp $1 "/run/media/pk/External HD1/Enviedistil_buildareas/workspace/in.cpp"

touch "/run/media/pk/External HD1/Enviedistil_buildareas/workspace/out"

bwrap \
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
  g++ /workspace/in.cpp -o /workspace/out
cp "/run/media/pk/External HD1/Enviedistil_buildareas/workspace/out" $2
