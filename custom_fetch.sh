#!/bin/sh

# Author: Harry P.
# Date:   2025-05-26 23:54
# Header: custom_fetch.sh
# Desc: custom fetcher for void linux based on openbsd-fetch

# user is already defined
host="$(hostname)"
os='Void Linux'
kernel="$(uname -sr)"
uptime="$(uptime | awk -F, '{sub(".*up ",x,$1);print $1}' | sed -e 's/^[ \t]*//')"
packages="$(xbps-query -l | wc -l)"
shell="$(basename "${SHELL}")"
cpu="$(lscpu | grep "Model name" | sed 's/Model name:.* \(\i5-[^ ]*\).*/\1/')"
gpu="$(lspci | grep -i vga | sed -E 's/.*(RX [0-9]+).*/\1/')"

## UI DETECTION

parse_rcs() {
	for f in "${@}"; do
		wm="$(tail -n 1 "${f}" 2> /dev/null | cut -d ' ' -f 2)"
		[ -n "${wm}" ] && echo "${wm}" && return
	done
}

rcwm="$(parse_rcs "${HOME}/.xinitrc" "${HOME}/.xsession")"

ui='unknown'
uitype='UI'
if [ -n "${DE}" ]; then
	ui="${DE}"
	uitype='DE'
elif [ -n "${WM}" ]; then
	ui="${WM}"
	uitype='WM'
elif [ -n "${XDG_CURRENT_DESKTOP}" ]; then
	ui="${XDG_CURRENT_DESKTOP}"
	uitype='DE'
elif [ -n "${DESKTOP_SESSION}" ]; then
	ui="${DESKTOP_SESSION}"
	uitype='DE'
elif [ -n "${rcwm}" ]; then
	ui="${rcwm}"
	uitype='WM'
elif [ -n "${XDG_SESSION_TYPE}" ]; then
	ui="${XDG_SESSION_TYPE}"
fi

ui="$(basename "${ui}")"

## DEFINE COLORS

if [ -x "$(command -v tput)" ]; then
	bold="$(tput bold 2> /dev/null)"
	black="$(tput setaf 0 2> /dev/null 0 0 2>/dev/null)"
	red="$(tput setaf 1 2> /dev/null 0 0 2>/dev/null)"
	green="$(tput setaf 2 2> /dev/null 0 0 2>/dev/null)"
	yellow="$(tput setaf 3 2> /dev/null 0 0 2>/dev/null)"
	blue="$(tput setaf 4 2> /dev/null 0 0 2>/dev/null)"
	magenta="$(tput setaf 5 2> /dev/null 0 0 2>/dev/null)"
	cyan="$(tput setaf 6 2> /dev/null 0 0 2>/dev/null)"
	white="$(tput setaf 7 2> /dev/null 0 0 2>/dev/null)"
	reset="$(tput sgr0 2> /dev/null)"
fi

lc="${reset}${bold}${yellow}"  
nc="${reset}${bold}${yellow}" 
ic="${reset}"                
c0="${reset}${yellow}"      
c1="${reset}${white}"      
c2="${reset}${bold}${yellow}"  

## OUTPUT

cat <<EOF

${c0}       _____      ${nc}${USER}${ic}@${nc}${host}${reset}
${c0}     \-     -/    ${lc}OS:        ${ic}${os}${reset}
${c0}  \_/         \   ${lc}KERNEL:    ${ic}${kernel}${reset}
${c0}  |        ${c1}O O ${c0}|  ${lc}UPTIME:    ${ic}${uptime}${reset}
${c0}  |_  ${c2}<   ${c0})  ${c2}3 ${c0})  ${lc}PACKAGES:  ${ic}${packages}${reset}
${c0}  / \         /   ${lc}CPU:       ${ic}${cpu}${reset}
${c0}     /-_____-\    ${lc}GPU:       ${ic}${gpu}${reset}
EOF

