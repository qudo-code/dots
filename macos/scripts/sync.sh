#!/usr/bin/env bash
# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

copy_directory() {
    local source="$1"
    local dest="$2"
    local executable="$3"
    
    if [ -z "$source" ] || [ -z "$dest" ]; then
        echo "Usage: copy_directory <source> <destination>"
        return 1
    fi
    
    sudo mkdir -p "$dest"
    sudo cp -R "$source" "$dest"
    sudo chown -R "${USER}:$(id -gn)" "$dest/$(basename "$source")"
    echo "📂 $source -> $dest"
}

copy_file() {
    local source="$1"
    local dest="$2"
    
    if [ -z "$source" ] || [ -z "$dest" ]; then
        echo "Usage: copy_file <source> <destination>"
        return 1
    fi

    sudo cp "$source" "$dest"
    sudo chown "${USER}:$(id -gn)" "$dest"
    echo "📄 $source -> $dest"
}

append_file() {
    local source="$1"
    local dest="$2"
    
    if [ -z "$source" ] || [ -z "$dest" ]; then
        echo "Usage: append_file <source> <destination>"
        return 1
    fi

    sudo cat "$source" >> "$dest"
    echo "++ $source -> $dest"
}

sync_configs() {
    # Create .zshrc only if it doesn't exist
    if [ ! -f "${HOME}/.zshrc" ]; then
        copy_file "${SCRIPT_DIR}/../.zshrc" "${HOME}/.zshrc"
    fi
    
    # Sync git config
    copy_file "${SCRIPT_DIR}/../.gitconfig" "${HOME}/.gitconfig"

    # Sync aerospace config
    copy_file "${SCRIPT_DIR}/../.aerospace.toml" "${HOME}/.aerospace.toml"

    # Sync aerospace borders config
    copy_directory "${SCRIPT_DIR}/../.config/borders" "${HOME}/.config"

    # Sync aerospace sketchybar config and plugins
    copy_directory "${SCRIPT_DIR}/../.config/sketchybar" "${HOME}/.config"

    # Sync aerospace scratchpad script
    copy_directory "${SCRIPT_DIR}/../.config/aerospace-scratchpad" "${HOME}/.config"

    # Copy wallpapers
    copy_directory "${SCRIPT_DIR}/../wallpapers" "${HOME}/.config"
}

sync_configs
source "${HOME}/.zshrc"
aerospace reload-config
brew services restart sketchybar
