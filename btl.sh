#!/usr/bin/bash

# Backup to laptop.sh

# XDG base directories
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"
STATE="${XDG_STATE_HOME:-$HOME/.local/state}"

HOST="laptop"
DATE_STARTED="$(date '+%a %e %b %Y %H:%M:%S')"
echo "$DATE_STARTED" > "$STATE/last-btl-started"

RSYNC_ARGS=()
EXTRA_EXCLUDES=()
SOURCE_DIR=~/
DEST_DIR="/srv/backups/AsteroidBackup"


# Parse arguments and hostname

while [[ "$1" ]]; do
    case $1 in
        "--host") HOST=$2 ;;
        "--source") SOURCE_DIR=$2 ;;
        "--dest") DEST_DIR=$2 ;;
        "--rsync-arg") RSYNC_ARGS+=("$2") ;;
        "--exclude") EXTRA_EXCLUDES+=(--exclude="$2") ;;
    esac

    shift
done

echo "Host: $HOST"
echo "Date: $DATE_STARTED"
rsync -av --progress --partial --delete-delay --delete-excluded --hard-links "${RSYNC_ARGS[@]}" "$SOURCE_DIR" "$HOST":"$DEST_DIR" \
--exclude-from "$CONFIG/btl-excludes" \
"${EXTRA_EXCLUDES[@]}" && date '+%a %e %b %Y %H:%M:%S' > "$STATE/last-btl-finished"
