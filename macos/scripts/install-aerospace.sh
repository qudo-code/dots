#!/usr/bin/env bash
# Install Aerospace WM, Sketchybar, and Janky Borders
brew install --cask nikitabobko/tap/aerospace
brew tap FelixKratz/formulae
brew install borders
brew install sketchybar

# Add SF Symbols used in status bar
brew install --cask sf-symbols

# Screenshots & screen recording
brew install --cask flameshot
brew install --cask ffmpeg