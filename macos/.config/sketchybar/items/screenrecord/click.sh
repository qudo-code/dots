#!/usr/bin/env sh
source $HOME/.config/sketchybar/config.sh

OUTPUT_DIR="$HOME/recordings"

cleanup_ffmpeg_processes() {
    # Find and kill all ffmpeg processes matching our pattern
    FFMPEG_PIDS=$(pgrep -f "ffmpeg.*avfoundation.*2:" 2>/dev/null)
    if [ -z "$FFMPEG_PIDS" ]; then
        return 0
    fi
    
    for PID in $FFMPEG_PIDS; do
        # Send SIGINT for graceful stop (standard way to stop ffmpeg)
        kill -INT "$PID" 2>/dev/null
    done
}

start_ffmpeg_recording() {
    # Parse arguments in any order: --fps 60 --audio yes --screen 1
    FPS=30
    PIX_FMT=yuv420p
    SCREEN_IDX=2
    AUDIO=no
    EXTRA_FLAGS=""
    
    while [ $# -gt 0 ]; do
        case "$1" in
            --fps)
                FPS="$2"
                shift 2
                ;;
            --pix-fmt)
                PIX_FMT="$2"
                shift 2
                ;;
            --screen)
                SCREEN_IDX="$2"
                shift 2
                ;;
            --audio)
                AUDIO="$2"
                shift 2
                ;;
            --output-dir)
                OUTPUT_DIR="$2"
                shift 2
                ;;
            --extra)
                EXTRA_FLAGS="$2"
                shift 2
                ;;
            *)
                # Unknown option, treat as extra flags
                EXTRA_FLAGS="$EXTRA_FLAGS $1"
                shift
                ;;
        esac
    done
    
    OUTPUT_FILE="$OUTPUT_DIR/rec_$(date '+%Y-%m-%d_%H-%M-%S').mov"
    mkdir -p "$OUTPUT_DIR"
    
    # Build ffmpeg command
    FFMPEG_CMD="ffmpeg -f avfoundation -i \"${SCREEN_IDX}:\" -r $FPS -pix_fmt $PIX_FMT"
    
    if [ "$AUDIO" != "yes" ]; then
        FFMPEG_CMD="$FFMPEG_CMD -an"
    fi
    
    if [ -n "$EXTRA_FLAGS" ]; then
        FFMPEG_CMD="$FFMPEG_CMD $EXTRA_FLAGS"
    fi
    
    FFMPEG_CMD="$FFMPEG_CMD \"$OUTPUT_FILE\""
    
    eval "$FFMPEG_CMD > /tmp/ffmpeg_rec.log 2>&1 &"
}

# Check if any ffmpeg recording process is running
if pgrep -f "ffmpeg.*avfoundation.*2:" > /dev/null 2>&1; then
    # Stop recording
    cleanup_ffmpeg_processes

    open "$OUTPUT_DIR"
else
    # Start a new recording with default settings
    start_ffmpeg_recording
fi

