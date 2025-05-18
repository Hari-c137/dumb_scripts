#!/bin/bash

WALLPAPER_DIR="${1:-$HOME/pics/}"
PIC=($(find ~/pics/ -type f | shuf -n 2))
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" -o  -iname "*.jpeg" -o -iname "*.bmp" \) | shuf -n 1)
echo $RANDOM_WALLPAPER
swww img $RANDOM_WALLPAPER &
