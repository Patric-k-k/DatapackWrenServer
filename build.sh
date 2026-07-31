#!/bin/bash
#build.sh
cp $1 "/run/media/pk/External HD1/Enviedistil_buildareas/workspace/in.cpp"

touch "/run/media/pk/External HD1/Enviedistil_buildareas/workspace/outp"

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
  --bind "/run/media/pk/External HD1/Enviedistil_buildareas/workspace/outp" /workspace/outp \
  --unshare-all \
  /usr/bin/g++ /workspace/in.cpp -o /workspace/outp || exit $?
cp "/run/media/pk/External HD1/Enviedistil_buildareas/workspace/outp" $2
