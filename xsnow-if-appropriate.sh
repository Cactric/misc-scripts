#!/bin/sh

month="$(date '+%m')"
day="$(date '+%d')"

if [ "$month" = '12' ] || { [ "$month" = '01' ] && [ "$day" -lt 7 ];} || [ "$1" = "-f" ]; then
    env -u HOME xsnow -defaults -noconfig -nomenu -notrees -snowflakes 75 -showsanta -santa 1 -nometeors -moon 0 -aurora 0 -offsets -30 -showbirds 0 -stars 0
fi
