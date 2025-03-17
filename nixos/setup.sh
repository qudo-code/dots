# WIP setup script
#!/bin/bash

# Config
# DOTFILES_REPO="~/git/dotfiles";
# DOTFILES_BACKUPS="$DOTFILES_REPO/.backups"

# link_config_dir() {
#     CONFIG_DIR = "$DOTFILES_REPO/$1";
#     DIR_TO_LINK = "$2";

#     if test -d "/$DIR_TO_LINK"; then
#         BACKUP_PATH="$DOTFILES_BACKUPS/$NIXOS_DIR";
#         sudo mv "/$DIR_TO_LINK" "$DOTFILES_BACKUPS/$NIXOS_DIR";
#         sudo ln -s "$CONFIG_DIR" "$SYMLINK_DIR/../"
#     fi
# }

# link_config_dir "nixos/etc/nixos" "/etc/nixos"



# NIXOS_PARENT_DIR="/etc/nixos";
# NIXOS_FULL_PATH="$NIXOS_PARENT_DIR/$NIXOS_DIR";
# if test -d "/$NIXOS_FULL_PATH"; then
#     sudo mv "/$NIXOS_FULL_PATH" "$DOTFILES_BACKUPS/$NIXOS_DIR";

#     # mv /etc/nixos ~/git/dotfiles/.backups/nixos
#     sudo mv "/$NIXOS_FULL_PATH" "$DOTFILES_BACKUPS/$NIXOS_DIR";
#     #
#     sudo ln -s "$DOTFILES_REPO/nixos/$NIXOS_FULL_PATH" "/$NIXOS_FULL_PATH/../"
# fi

# HYPRLAND_CONFIG_PARENT_DIR="~/.config/";
# HYPRLAND_CONFIG_DIR="$HYPRLAND_CONFIG_PARENT_DIR/hypr";

# WAYBAR_CONFIG_PARENT_DIR="~/.config/";
# WAYBAR_CONFIG_DIR="$WAYLAND_CONFIG_PARENT_DIR/waybar"
