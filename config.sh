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
install_macos() {
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Install Aerospace WM, Sketchybar, and Janky Borders
    brew install --cask nikitabobko/tap/aerospace
    brew tap FelixKratz/formulae
    brew install borders
    brew install sketchybar

    # Add SF Symbols used in status bar
    brew install --cask sf-symbols

    # Screenshots
    brew install --cask flameshot

    # Install nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # Set Node version
    nvm install 20
    nvm use 20

    # Update NPM
    npm i -g npm

    # bun
    curl -fsSL https://bun.sh/install | bash

    # pnpm
    npm i -g pnpm

    # Apps
    brew install --cask slack
    brew install --cask discord
    brew install --cask spotify
    brew install --cask docker
    brew install --cask beekeeper-studio
    brew install --cask zed
    brew install --cask brave-browser
    brew install --cask signal
    brew install --cask iterm2
}

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
