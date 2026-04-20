#!/usr/bin/zsh

lastUpd="$(date '+%a %e %b %Y %H:%M:%S' -r /var/log/pacman.log)"
echo "Last update: $lastUpd"
STATE="${XDG_STATE_HOME:-$HOME/.local/state}"

backupHost="$(ls --sort=time --reverse "$STATE"/last-btl-*-finished | head -n 1)"
lastBtl="$(< ${backupHost})"
echo "Last backup: $lastBtl"

now="$(date '+%a %e %b %Y %H:%M:%S')"
echo "Now:         $now"
