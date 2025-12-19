source $HOME/.config/sketchybar/config.sh

sketchybar -m --add item drive.logo left \
    --set drive.logo icon=$DRIVE_ICN \
    label.font="$FONT:Medium:16.0" \
    label.drawing=on \
    label="/" \
    click_script="open /"

sketchybar -m --add item home.logo left \
    --set home.logo icon=$HOME_ICN \
    label.font="$FONT:Medium:16.0" \
    label.drawing=on \
    label="/" \
    click_script="open ~/"

sketchybar -m --add item downloads.logo left \
    --set downloads.logo icon=$DOWNLOADS_ICN \
    label.font="$FONT:Medium:16.0" \
    label.drawing=off \
    click_script="open ~/Downloads"
        
