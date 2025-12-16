#!/bin/bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Aerospace
source scripts/install-aerospace.sh

# Install Apps
source scripts/install-apps.sh

# Install Dev tools
source scripts/install-dev-tools.sh