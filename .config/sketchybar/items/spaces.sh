sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color=0xffbdbdff \
        background.corner_radius=5 \
        background.height=20 \
        background.drawing=off \
        icon.padding_left=3 \
        icon.padding_right=3 \
        label.align=center \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done