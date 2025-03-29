#!/bin/bash

# Find non-hidden files and pass them to tofi for selection
file=$(find . -type f -not -path "*/.*" |  tofi --anchor center --width 40% --height 40% --horizontal false --prompt-text "select file: ")

if [[ -n "$file" ]]; then
    neovide "$file"
fi

