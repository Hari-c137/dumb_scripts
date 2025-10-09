#!/usr/bin/env bash

# Author: Harry P.
# Date    2025-05-27 00:03
# Header: swwwRand.sh
# Desc:   random wallpaper switcher for sway

WALLPAPER_DIR="${1:-$HOME/pics/}"
effects=("grow" "wave" "any" "fade")
random_index=$((RANDOM % ${#effects[@]}))
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" -o -iname "*.jpeg" -o -iname "*.bmp" \) | shuf -n 1)
swww img -t "${effects[random_index]}" --transition-duration 2 "$RANDOM_WALLPAPER" &
