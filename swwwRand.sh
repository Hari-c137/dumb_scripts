#!/bin/bash

WALLPAPER_DIR="${1:-$HOME/pics/}"
effects=("grow" "wave" "any" "fade")
random_index=$(( RANDOM % ${#effects[@]} )) 
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" -o  -iname "*.jpeg" -o -iname "*.bmp" \) | shuf -n 1)
swww img -t ${effects[random_index]} $RANDOM_WALLPAPER &
