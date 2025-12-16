#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


copy_directory() {
    local source="$1"
    local dest="$2"
    
    if [ -z "$source" ] || [ -z "$dest" ]; then
        echo "Usage: copy_directory <source> <destination>"
        return 1
    fi
    
    sudo mkdir -p "$dest"
    sudo cp -R "$source" "$dest"
    echo "📂 $source -> $dest"
}

copy_file() {
    local source="$1"
    local dest="$2"
    
    if [ -z "$source" ] || [ -z "$dest" ]; then
        echo "Usage: copy_file <source> <destination> [find] [replace]"
        return 1
    fi
    
    sudo mkdir -p "$(dirname "$dest")"
    
    # Use sed to find/replace/copy if $3/$4 provided
    if [[ -n "$3" && -n "$4" ]]; then
        sudo cat "$source" | sed "s/$3/$4/g" > "$dest"
        echo "📄 $source -> '$3' -> '$4' -> $dest"
    else
        sudo cp "$source" "$dest"
        echo "📄 $source -> $dest"
    fi
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
    # Append to .zshrc if following vars don't exist
    if ! grep -q "PNPM_HOME" "${HOME}/.zshrc" || ! grep -q "NVM_DIR" "${HOME}/.zshrc"; then
        append_file "${SCRIPT_DIR}/../.zshrc" "${HOME}/.zshrc"
        sudo source "${HOME}/.zshrc"
    fi
    
    # Sync git config
    copy_file "${SCRIPT_DIR}/../.gitconfig" "${HOME}/.gitconfig"

    # Sync aerospace config
    copy_file "${SCRIPT_DIR}/../.aerospace.toml" "${HOME}/.aerospace.toml"

    # Sync aerospace borders config
    copy_directory "${SCRIPT_DIR}/../.config/borders" "${HOME}/.config"

    # Sync aerospace sketchybar config
    copy_directory "${SCRIPT_DIR}/../.config/sketchybar" "${HOME}/.config"

    # Copy wallpapers
    copy_directory "${SCRIPT_DIR}/../wallpapers" "${HOME}/.config"

    aerospace reload-config

    brew services restart sketchybar
}

sync_configs