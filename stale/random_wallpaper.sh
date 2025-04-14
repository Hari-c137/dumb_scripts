#!/bin/bash

id=$(pgrep swaybg)

if [[ $id != NULL ]]; then
  kill -9 $id
fi

PIC=($(find ~/pics/ -type f | shuf -n 2 --random-source=/dev/random))

swaybg -m fill -i $PIC  & 
