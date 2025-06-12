#!/bin/bash
set -e;

echo "Launching firefox..." && swaymsg "workspace 2; exec /usr/bin/firefox-wayland"; 
echo "Launching foot..." && swaymsg "workspace 3; exec /usr/bin/footclient";
echo "Launching bottom..." && swaymsg 'workspace 4; exec alacritty -t "Bottom" -e "/usr/bin/btm"';
echo "Launching emacs..." && swaymsg "workspace 1; exec /usr/bin/emacsclient -nc";
