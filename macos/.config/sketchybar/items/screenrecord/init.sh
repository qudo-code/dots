source $HOME/.config/sketchybar/config.sh

sketchybar --add item screenrecord right \
           --set screenrecord \
			script="$HOME/.config/sketchybar/items/screenrecord/update.sh" \
			click_script="$HOME/.config/sketchybar/items/screenrecord/click.sh" \
			update_freq=1 \
			icon="$RECORD_ICN" \
			icon.font="SF Symbols:Regular:14.0" \
			padding_right=8
