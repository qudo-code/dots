#!/usr/bin/env bash
source $HOME/.config/sketchybar/config.sh

WORKSPACE_ID="$1"
SCRATCHPAD_WS="S"
SCRATCHPAD_QUEUE_FILE="$HOME/.config/aerospace-scratchpad/queue"

# Check if this is the focused workspace
if [ "$WORKSPACE_ID" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on label.color=0xff161617
# Special handling for scratchpad space "S"
elif [ "$WORKSPACE_ID" = "$SCRATCHPAD_WS" ]; then
    # Check if any scratchpad window is visible on current workspace
    CURRENT_WS=$(aerospace list-workspaces --focused 2>/dev/null)
    SCRATCHPAD_VISIBLE=false
    
    if [ -f "$SCRATCHPAD_QUEUE_FILE" ] && [ -s "$SCRATCHPAD_QUEUE_FILE" ]; then
        while IFS= read -r window_id; do
            if [ -n "$window_id" ]; then
                if aerospace list-windows --workspace "$CURRENT_WS" --format "%{window-id}" 2>/dev/null | grep -qx "$window_id"; then
                    SCRATCHPAD_VISIBLE=true
                    break
                fi
            fi
        done < "$SCRATCHPAD_QUEUE_FILE"
    fi
    
    if [ "$SCRATCHPAD_VISIBLE" = "true" ]; then
        sketchybar --set $NAME background.drawing=on label.color=0xff161617
    else
        sketchybar --set $NAME background.drawing=off label.color=0xffffffff
    fi
else
    sketchybar --set $NAME background.drawing=off label.color=0xffffffff
fi