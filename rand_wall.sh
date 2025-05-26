#!/bin/bash

# Author: Harry P.
# Date    2025-05-27 00:01
# Header: rand_wall.sh
# Desc:   wayland wallpaper setter using multiple backend(wbg/swaybg)

c_wbg=$(pgrep wbg)
c_sbg=$(pgrep swaybg)
PIC=($(find ~/pics/ -type f | shuf -n 2))

if xbps-query -Rs swaybg > /dev/null; then
  if [[ c_wbg != NULL ]]; then
    kill -9 $c_wbg
  fi
    wbg $PIC &
else
  if [[ c_sbg != NULL ]]; then
    kill -9 $c_sbg
  fi
    swaybg -m fill -i $PIC &
fi


