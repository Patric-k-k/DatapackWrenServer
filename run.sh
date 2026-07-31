#!/bin/bash
bash ./build.sh ./script.cpp /home/pk/Desktop/cppdatapacks/apps/local/app

bwrap \
  --ro-bind /usr /usr \
  --ro-bind /lib /lib \
  --ro-bind /lib64 /lib64 \
  --bind /home/pk/Desktop/cppdatapacks/apps/global_sandbox /app_global \
  --bind /home/pk/Desktop/cppdatapacks/apps/local /app_local \
  --chdir /app_local \
  --unshare-all \
  /app_local/app