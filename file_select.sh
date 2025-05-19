#!/bin/bash

# Find non-hidden files in ~/code/dumb_scripts and pass them to tofi for selection
file=$(find ~/code/ -type f | tofi --anchor center --width 40% --height 40% --horizontal false --prompt-text "select file: ")

if [[ -n "$file" ]]; then
  fish -c " footclient nvim "$file""
fi

