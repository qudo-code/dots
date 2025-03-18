echo "Syncing config"
repo="${HOME}/dots/nixos";

# Copy/sync files from dotfiles repo to system destinations
declare -A copy_paths=(
  # Bash
  ["${repo}/.bashrc"]="${HOME}/.bashrc"
  # Zed
  ["${repo}/.config/zed/keymap.json"]="${HOME}/.config/zed/keymap.json"
  ["${repo}/.config/zed/settings.json"]="${HOME}/.config/zed/settings.json"
  # Hyprland
  ["${repo}/.config/hypr/hyprland.conf"]="${HOME}/.config/hypr/hyprland.conf"
  # Hyprpaper
  ["${repo}/.config/hypr/hyprpaper.conf"]="${HOME}/.config/hypr/hyprpaper.conf"
  # Waybar
  ["${repo}/.config/waybar/config.jsonc"]="${HOME}/.config/waybar/config.jsonc"
  ["${repo}/.config/waybar/style.css"]="${HOME}/.config/waybar/style.css"
)

for src in "${!copy_paths[@]}"; do
  echo ""
  dst="${copy_paths[$src]}"
  mkdir -p $(dirname "$dst")
  cp --force $src $dst
  echo "${src}"
  echo "└──> ${dst}"
done

# Copy all wallpaper
wallpapers="${repo}/.config/wallpapers/";
wallpapersdst="${HOME}/.config";
echo "└──> ${wallpapers}";
cp -r "${wallpapers}" "${wallpapersdst}";

# Source copied .bashrc
source ~/.bashrc
