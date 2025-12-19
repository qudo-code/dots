#!/usr/bin/env sh
source $HOME/.config/sketchybar/config.sh

# Check if recording is in progress by looking for ffmpeg processes
if pgrep -f "ffmpeg.*avfoundation.*2:" > /dev/null 2>&1; then
    # Recording is active
    sketchybar -m --set screenrecord icon="$RECORDING_ICN" icon.color=0xffff3333 label.color=0xffff3333 label.drawing=on label.drawing=on label="Recording"
else
    # Not recording
    sketchybar -m --set screenrecord icon="$RECORD_SCREEN_ICN" icon.color=0xffffffff label.color=0xffffffff label.drawing=off
fi

