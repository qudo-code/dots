source $HOME/.config/sketchybar/config.sh

sketchybar --add item volume right \
        --set volume icon.font="SF Symbols:Regular:14.0" \
        icon="$VOLUME_ICN" \
        script="$SKETCHYBAR_ITEMS_DIR/volume/update.sh" \
        --subscribe volume volume_change
