#!/usr/bin/env bash
# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Aerospace
source "${SCRIPT_DIR}/install-aerospace.sh"

# Install Apps
source "${SCRIPT_DIR}/install-apps.sh"

# Install Dev tools
source "${SCRIPT_DIR}/install-dev-tools.sh"