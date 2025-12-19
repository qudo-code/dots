#!/usr/bin/env sh
source $HOME/.config/sketchybar/config.sh

sketchybar --set $NAME icon=$CLOCK_ICN label="$(date '+%h %d  %I:%M')"
