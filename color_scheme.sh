#!/bin/bash

# Author: Harry P.
# Date:   2025-05-26 23:52
# Header: color-scheme.sh
# Desc:   fzf & gowall based wallpaper theme changer


last_img=$(ls ~/pics/* | sort -n | tail -1 |  awk -F'/' '{print $NF}' | awk -F'.' '{print $1}');
next_img=$((last_img + 1));
echo "enter the wallpaper link: ";  read link;
echo "do you want to change color-scheme? (y/n)";
read choice;

if [[ $choice == "n" ]]
then
  curl -o $next_img $link;
  mv $next_img ~/pics/;
else
  curl -O $link;
  theme=$(gowall list | fzf);
  filename=$(echo $link | awk -F'/' '{print $NF}');
  gowall convert $filename -t $theme;
  mv ~/Pictures/gowall/$filename $next_img;
  mv $next_img ~/pics/;
  rm $filename;
fi
  
