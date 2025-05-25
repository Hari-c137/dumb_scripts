#!/bin/bash

env="$HOME/code"    # development enviroment diretory

file=$(find $env -type f | tofi --anchor center --width 55% --height 40% --horizontal false --prompt-text "select file: ")
if [[ -n "$file" ]]; then
  cd $(dirname $file)
  sh -c " kitty nvim "$file""
fi


