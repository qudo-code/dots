# --------------------
# Every OS
# --------------------
sync_shared() {
    # Sync shared Zed settings
    sync_config "${repo}/shared/.config/zed/settings.json" "${HOME}/.config/zed/settings.json"
    # Sync wallpapers
    sync_config "${repo}/shared/.config/wallpapers" "${HOME}/.config/wallpapers"
    # Git config
    sync_config "${repo}/shared/.gitconfig" "${HOME}/.gitconfig"
}
# --------------------
# MacOS
# --------------------
sync_macos() {
    # Folders
    # Sync Janky Borders config
    sync_config "${repo}/macos/.config/borders" "${HOME}/.config/border"
    # Sync Sketchybar config
    sync_config "${repo}/macos/.config/sketchybar" "${HOME}/.config/sketchybar"

    # Files
    # Sync Zed keymaps per OS
    sync_config "${repo}/shared/.config/zed/keymap.json" "${HOME}/.config/zed/keymap.json" "MODKEY" "cmd"
    # Sync Aerospace config
    sync_config "${repo}/macos/.aerospace.toml" "${HOME}/.aerospace.toml"

    # Sync .zshrc shared + os config + source
    sync_config "${repo}/shared/.bashrc" "${HOME}/.zshrc"
    append_config "${repo}/macos/.zshrc" "${HOME}/.zshrc"
    source "${HOME}/.zshrc"
}
# --------------------
# NixOS
# --------------------
sync_nixos() {
    # Sync Nix config
    sync_config "${repo}/nixos/etc/nixos" "/etc/nixos"
    # Sync Zed keymaps per OS
    sync_config "${repo}/shared/.config/zed/keymap.json" "${HOME}/.config/zed/keymap.json" "MODKEY" "alt"
    # Sync Hyprland + Hyprpaper configs
    sync_config "${repo}/nixos/.config/hypr" "${HOME}/.config/hypr"
    # Sync Waybar configs
    sync_config "${repo}/nixos/.config/waybar" "${HOME}/.config/hypr"

    # Sync .bashrc shared + os config + source
    sync_config "${repo}/shared/.bashrc" "${HOME}/.bashrc"
    source "${HOME}/.bashrc"
}

install_nixos() {
    sudo nixos-rebuild switch
}
