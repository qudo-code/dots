#!/usr/bin/env bash
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Set Node version
nvm install 22
nvm use 22

# Update NPM
npm i -g npm

# Install bun
curl -fsSL https://bun.sh/install | bash

# Install pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Terminal apps
brew install --cask iterm2
brew install --cask ghostty
brew install tmux

# Dev tools
brew install --cask docker
brew install --cask beekeeper-studio
brew install stripe/stripe-cli/stripe
brew install planetscale/tap/pscale

# Editors
brew install --cask cursor
brew install --cask zed
brew install --cask visual-studio-code

# Claude CLI
curl -fsSL https://claude.ai/install.sh | bash
