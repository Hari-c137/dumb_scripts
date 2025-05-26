#!/bin/bash

# Author: Harry P.
# Date:   2025-05-26 23:36
# Header: wallpaper_dwnld.sh
# Desc:   downloads walls & rename to numbers and store in pics

last_img=$(ls ~/pics/* | sort -n | tail -1 |  awk -F'/' '{print $NF}' | awk -F'.' '{print $1}');
next_img=$((last_img + 1));
echo "enter the wallpaper link: ";  read link;
curl -o $next_img $link;
mv $next_img ~/pics/;
