source $HOME/.config/sketchybar/config.sh

sketchybar --add item battery right                      \
        --set battery \
        script="$SKETCHYBAR_ITEMS_DIR/battery/update.sh" \
        update_freq=10                  \
        padding_left=10                 \
        --subscribe battery system_woke
