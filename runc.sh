#!/bin/bash

export PATH=/home/pk/.cargo/bin:/home/pk/miniconda3/bin:/home/pk/miniconda3/condabin:/home/pk/.local/bin:/home/pk/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin

bash ./buildc.sh ./script.c /home/pk/Desktop/cppdatapacks/apps/local/app

/usr/bin/bwrap \
  --ro-bind /usr /usr \
  --ro-bind /lib /lib \
  --ro-bind /lib64 /lib64 \
  --bind /home/pk/Desktop/cppdatapacks/apps/global_sandbox /app_global \
  --bind /home/pk/Desktop/cppdatapacks/apps/local /app_local \
  --chdir /app_local \
  --unshare-all \
  /app_local/app