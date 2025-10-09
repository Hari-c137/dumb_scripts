#!/usr/bin/env bash

# Author: Harry P.
# Date    2025-05-26 23:58
# Header: quick_isos.sh
# Desc:   download latest ISOs from popular linux distros

LD=("ArchLinux" "CachyOS" "PikaOS" "VoidLinux" "NobaraLinux" 
    "openSUSE_T" "T2Linux" "Download_All" "FedoraLinux" "EndeavourOS"
    "Pop!_OS" "AlpineLinux" "Mint" "Debian");
choice=$(printf "%s\n" "${LD[@]}" | fzf --header-first --header 'select which iso to download' --layout=reverse --border --style=full)

if [[ ~/Downloads/ISO > /dev/null ]]; then
  mkdir -p ~/Downloads/ISO;
fi

case $choice in 
      ArchLinux)
        wget --quiet --show-progress https://geo.mirror.pkgbuild.com/iso/latest/archlinux-x86_64.iso -O ~/Downloads/ISO/archlinux-x86_64.iso
        ;;
      CachyOS)
        wget --quiet --show-progress https://sourceforge.net/projects/cachyos-arch/files/latest/download -O ~/Downloads/ISO/CachyOS.iso
        ;;
      PikaOS)
        echo "PikaOS"
        ;;
      VoidLinux)
        ver=$(curl -s https://repo-fi.voidlinux.org/live/current/ | grep -i -E 'base' | tail -n 2 | sed -n 's/.*href="\([^"]*\)".*/\1/p' | fzf)
        echo "$ver"
        wget --quiet --show-progress https://repo-fi.voidlinux.org/live/current/"$ver" -O ~/Downloads/ISO/"$ver"
        ;;
      NobaraLinux)
        echo "NobaraLinux"
        ;;
      openSUSE_T)
        echo "openSUSE_T"
        ;;
      T2Linux)
        echo "T2Linux"
        ;;
       esac

## ask choice for autoburn 
## autoburn to selected given /dev/sdx (dd or custom) 
## void linux custom builder
## WIP!!

