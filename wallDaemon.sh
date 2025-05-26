#!/bin/bash

# Author: Harry P.
# Date:   2025-05-26 22:49
# Header: wallDaemon.sh
# Desc:   kinda like a screensaver :3

WALLPAPER_DIR="${1:-$HOME/pics/}"
effects=("grow" "wave" "any" "fade")
random_index=$(( RANDOM % ${#effects[@]} )) 
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" -o  -iname "*.jpeg" -o -iname "*.bmp" \) | shuf -n 1)
swww img -t ${effects[random_index]} $RANDOM_WALLPAPER &
id=$(pgrep wallDaemon.sh)
sleep 5s # change time-interval here!!
bash wallDaemon.sh
