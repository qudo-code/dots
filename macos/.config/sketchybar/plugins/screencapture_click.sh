#!/bin/sh
PID_FILE="$HOME/.config/sketchybar/screencapture.pid"

# Check if any ffmpeg recording process is running (more reliable than PID file)
if pgrep -f "ffmpeg.*avfoundation.*2:" > /dev/null 2>&1; then
    # Stop recording - find and kill all ffmpeg processes matching our pattern
    FFMPEG_PIDS=$(pgrep -f "ffmpeg.*avfoundation.*2:")
    for PID in $FFMPEG_PIDS; do
        # Send SIGINT first for graceful stop
        kill -INT "$PID" 2>/dev/null
    done
    # Wait for processes to stop
    sleep 1
    # Force kill any that are still running
    REMAINING=$(pgrep -f "ffmpeg.*avfoundation.*2:")
    if [ -n "$REMAINING" ]; then
        for PID in $REMAINING; do
            kill -TERM "$PID" 2>/dev/null
        done
        sleep 0.5
        # Final kill if still running
        FINAL=$(pgrep -f "ffmpeg.*avfoundation.*2:")
        if [ -n "$FINAL" ]; then
            for PID in $FINAL; do
                kill -KILL "$PID" 2>/dev/null
            done
        fi
    fi
    # Clean up PID file
    rm -f "$PID_FILE"
    # Trigger update to change icon
    "$HOME/.config/sketchybar/plugins/screencapture.sh"
else
    # No recording in progress, but kill any stray ffmpeg processes first
    # (in case they exist but weren't detected by pgrep)
    FFMPEG_PIDS=$(pgrep -f "ffmpeg.*avfoundation.*2:" 2>/dev/null)
    if [ -n "$FFMPEG_PIDS" ]; then
        for PID in $FFMPEG_PIDS; do
            kill -INT "$PID" 2>/dev/null
        done
        sleep 0.5
        REMAINING=$(pgrep -f "ffmpeg.*avfoundation.*2:" 2>/dev/null)
        if [ -n "$REMAINING" ]; then
            for PID in $REMAINING; do
                kill -KILL "$PID" 2>/dev/null
            done
        fi
        rm -f "$PID_FILE"
    fi
    # Start a new one
    OUTPUT_FILE="$HOME/recordings/rec_$(date '+%Y-%m-%d_%H-%M-%S').mov"
    # Ensure the directory exists
    mkdir -p "$(dirname "$OUTPUT_FILE")"
    # Start ffmpeg recording (screen 0, no audio)
    # -f avfoundation: macOS screen capture API
    # -i "2:": screen 0 (index 2), no audio device (empty after colon)
    # -r 30: 30 fps
    # -pix_fmt yuv420p: pixel format for compatibility
    # -an: disable audio encoding
    ffmpeg -f avfoundation -i "2:" -r 30 -pix_fmt yuv420p -an "$OUTPUT_FILE" > /tmp/ffmpeg_rec.log 2>&1 &
    FFMPEG_PID=$!
    echo $FFMPEG_PID > "$PID_FILE"
    # Wait a moment and verify it's still running
    sleep 1
    if ps -p "$FFMPEG_PID" > /dev/null 2>&1; then
        # Process is running, update icon
        "$HOME/.config/sketchybar/plugins/screencapture.sh"
    else
        # Process died immediately, check log and clean up
        rm -f "$PID_FILE"
        "$HOME/.config/sketchybar/plugins/screencapture.sh"
    fi
fi

