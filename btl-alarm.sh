#!/bin/sh

# Make a notification if a backup hasn't happened in X days
# (to laptop and/or via DejaDup)
permissibleSec=604800 # 7 days

timeNow=$(date +%s)
btlFinished=$(stat -c %Y "${XDG_STATE_HOME:-$HOME/.local/state}/last-btl-finished")
dejadupFinished=$(dconf read /org/gnome/deja-dup/last-run | cut -d "'" -f 2 | date +%s -f -)

if [ $((timeNow - btlFinished)) -gt $permissibleSec ]; then
    echo "It has been more than a week since the last back up"
    notify-send -t 10000 "It has been more than a week since the last back up" -a "Backup alarm" -i backup
fi
if [ $((timeNow - dejadupFinished)) -gt $permissibleSec ]; then
    echo "It has been more than a week since the last backup to JOHN-BACKUP"
    notify-send -t 10000 "It has been more than a week since the last backup to JOHN-BACKUP" -a "Backup alarm" -i backup
fi
