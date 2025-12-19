source $HOME/.config/sketchybar/config.sh

sketchybar --add item clock right \
           --set clock update_freq=10 \
           icon=$CLOCK_ICN \
           script="$SKETCHYBAR_ITEMS_DIR/clock/update.sh"
