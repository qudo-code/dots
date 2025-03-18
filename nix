echo "Syncing config"
repo="$HOME/git/dotfiles/nixos";

# Copy/sync files from dotfiles repo to system destinations
declare -A copy_paths=(
  # Nix config
  ["${repo}/etc/nixos/configuration.nix"]="/etc/nixos/"
  # Bash
  ["${repo}/.bash_aliases"]="${HOME}/"
  # Zed
  ["${repo}/.config/zed/keymap.json"]="${HOME}/.config/zed/keymap.json"
  ["${repo}/.config/zed/settings.json"]="${HOME}/.config/zed/settings.json"
  # Hyprland
  ["${repo}/.config/hypr/hyprland.conf"]="${HOME}/.config/hypr/hyprland.conf"
  # Waybar
  ["${repo}/.config/waybar/config.jsonc"]="${HOME}/.config/waybar/config.jsonc"
  ["${repo}/.config/waybar/style.css"]="${HOME}/.config/waybar/style.css"
)

for src in "${!copy_paths[@]}"; do
  echo ""
  dst="${copy_paths[$src]}"
  sudo mkdir -p $(dirname "$dst")
  sudo cp --force $src $dst
  echo "${src}"
  echo "└──> ${dst}"
done

# Source aliases
source ${HOME}/.bash_aliases
