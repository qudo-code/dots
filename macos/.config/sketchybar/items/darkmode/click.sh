#!/bin/sh
source $HOME/.config/sketchybar/config.sh

# Set mode
osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'

# Force refresh item
source $SKETCHYBAR_ITEMS_DIR/darkmode/update.sh
