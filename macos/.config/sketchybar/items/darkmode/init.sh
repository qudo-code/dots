source $HOME/.config/sketchybar/config.sh

sketchybar --add item appearance right \
			--set appearance script="$SKETCHYBAR_ITEMS_DIR/darkmode/update.sh" \
					click_script="$SKETCHYBAR_ITEMS_DIR/darkmode/click.sh" \
					update_freq=1

source $SKETCHYBAR_ITEMS_DIR/darkmode/update.sh