#!/bin/bash

last_img=$(ls ~/pics/* | sort -n | tail -1 |  awk -F'/' '{print $NF}' | awk -F'.' '{print $1}');
next_img=$((last_img + 1));
echo "enter the wallpaper link: ";  read link;
curl -o $next_img $link;
mv $next_img ~/pics/;
