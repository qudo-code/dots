#!/bin/bash
# ------------------------
# Setup
# ------------------------
pkg_name="dots"
repo="${HOME}/${pkg_name}"

# Detect/set $os
# macos, nixos, or whatever the ID in /etc/os/release
if [[ "$OSTYPE" == "darwin"* ]]; then os="macos";
elif [[ -f /etc/NIXOS ]]; then os="nixos";
elif [[ -f /etc/os-release ]]; then
    source /etc/os-release;
    os=$ID;
fi

# ------------------------
# Config builder utils
# ------------------------
# $1 input file/dir
# $2 destination file/dir
# $3/$4 text to find/replace after copy
sync_config() {
    # Check if dir or file
    if [ -d "$1" ]; then
        sudo mkdir -p $2
        sudo cp -R $1 $(dirname $2)
        echo "📂 $1 -> $2"
    else
        sudo mkdir -p $(dirname $2)

        # Use sed to find/replace/copy if $3/$4 provided
        if [[ -n "$3" && -n "$4" ]]; then
            sudo cat $1 | sed "s/$3/$4/g" > $2
            echo "🔄 $1 -> '$3' -> '$4' -> $2"
        else
            sudo cp  $1 $2
            echo "📄 $1 -> $2"
        fi
    fi
}

append_config() {
    cat $1 >> $2
    echo "++ $1 -> $2"
}

# Register user config
source "${repo}/config.sh"

# --------------------
# CLI commands
# --------------------
print_os_info() {
    echo "Dots CLI"
    echo "OS:      $os"
    echo "Home:    $HOME"
    echo "Command: $1"
}

print_help() {
    echo "Help"
    echo "-----------------"
    echo "✏️ Open configs in editor"
    echo "~/${pkg_name} edit"
    echo "~/${pkg_name} e"
    echo ""
    echo "➡️ Sync configs with sytem"
    echo "~/${pkg_name} sync"
    echo "~/${pkg_name} s"
    echo ""
    echo "🛠️ Run ~/dots install step"
    echo "~/${pkg_name} install"
    echo "~/${pkg_name} i"
}

run_method() {
    if declare -F $1 >/dev/null; then $1
    else echo $2
    fi
}

sync_git() {
    cd $repo
    git pull
    git add .
    git commit -m "sync"
    git push
}


# Run sync method for OS
sync_os() {
    echo "Pushing..."
    sync_git
    echo ""
    echo "Syncing..."
    echo "➡️ sync_shared"
    run_method sync_shared "skipped"
    echo ""
    echo "➡️ sync_$os"
    run_method "sync_$os" "skipped"
    echo ""
}

# Run install method for OS
install_os() {
    sync_os
    echo "Installing..."
    echo "🛠️ install_shared"
    run_method install_shared "skipped"
    echo ""
    echo -"🛠️ install_$os"
    run_method "install_$os" "skipped"
    echo ""
}

# Open editor for OS
edit_os() {
    echo "✏️ Opening configs in editor"

    if command -v zeditor >/dev/null 2>&1; then
        zeditor $repo;
    elif command -v zed >/dev/null 2>&1; then
        zed $repo;
    elif command -v cursor >/dev/null 2>&1; then
        cursor $repo;
    elif command -v code >/dev/null 2>&1; then
        code $repo;
    fi
}

# Intro
print_os_info $1

run_command() {
    if declare -F $1 >/dev/null; then
        $1
    else
        print_help
        echo "Command '$1' not setup for '$os'"
    fi
}

# Match command with method
method=${cmds[$1]}
if [[ "$1" == "s" || "$1" == "sync" ]]; then
    run_command sync_os
elif [[ "$1" == "i" || "$1" == "install" ]]; then
    run_command install_os
elif [[ "$1" == "e" || "$1" == "edit" ]]; then
    run_command edit_os
else
    print_help
    echo "Unknown command"
fi
