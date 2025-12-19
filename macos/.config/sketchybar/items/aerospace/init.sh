source $HOME/.config/sketchybar/config.sh

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color=0xffbdbdff \
        background.corner_radius=5 \
        background.height=20 \
        background.drawing=off \
        icon.padding_left=8 \
        icon.padding_right=3 \
        label.align=center \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$SKETCHYBAR_ITEMS_DIR/aerospace/update.sh $sid"
done