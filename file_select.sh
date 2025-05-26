#!/bin/bash

# Author: Harry P.
# Date:   2025-05-26 23:57
# Header: file_select.sh
# Desc:   file selector using tofi to launch file with neovim and kitty

env1="$HOME/code"    # development enviroment diretory
env2="$HOME/.config"
file=$(find $env1 $env2 -type f | tofi --anchor center --width 55% --height 40% --horizontal false --prompt-text "select file: ")
if [[ -n "$file" ]]; then
  cd $(dirname $file)
  sh -c " kitty nvim "$file""
fi


