#!/usr/bin/zsh

lastUpd="$(date '+%a %e %b %Y %H:%M:%S' -r /var/log/pacman.log)"
echo "Last update: $lastUpd"
lastBtl="$(< ~/.local/state/last-btl-finished)"
echo "Last backup: $lastBtl"
now="$(date '+%a %e %b %Y %H:%M:%S')"
echo "Now:         $now"
