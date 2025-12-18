#!/usr/bin/env sh

source $HOME/.config/sketchybar/icons.sh

PID_FILE="$HOME/.config/sketchybar/screencapture.pid"

# Check if recording is in progress
# First check PID file, then also check if ffmpeg process is actually running
if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    # Check both the PID and if any ffmpeg with avfoundation is running
    if ps -p "$PID" > /dev/null 2>&1 || pgrep -f "ffmpeg.*avfoundation.*2:" > /dev/null 2>&1; then
        # Recording is active
        sketchybar -m --set screencapture icon="$RECORDING_ICN" icon.color=0xffff3333 label.color=0xffff3333
    else
        # PID file exists but process is dead, clean up
        rm -f "$PID_FILE"
        sketchybar -m --set screencapture icon="$RECORD_ICN" label.color=0xffffffff
    fi
elif pgrep -f "ffmpeg.*avfoundation.*2:" > /dev/null 2>&1; then
    # No PID file but ffmpeg is running - might be from a previous session
    # Get the PID and save it
    FFMPEG_PID=$(pgrep -f "ffmpeg.*avfoundation.*2:" | head -1)
    if [ -n "$FFMPEG_PID" ]; then
        echo "$FFMPEG_PID" > "$PID_FILE"
        sketchybar -m --set screencapture icon="$RECORDING_ICN" icon.color=0xffff3333 label.color=0xffff3333
    else
        sketchybar -m --set screencapture icon="$RECORD_ICN" label.color=0xffffffff
    fi
else
    # Not recording
    sketchybar -m --set screencapture icon="$RECORD_ICN" label.color=0xffffffff
fi

