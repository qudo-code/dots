#!/usr/bin/env bash
# Install Aerospace WM, Sketchybar, and Janky Borders
brew install --cask nikitabobko/tap/aerospace
brew trust felixkratz/formulae
brew tap FelixKratz/formulae
brew install borders
brew services start felixkratz/formulae/borders
brew trust felixkratz/formulae
brew install sketchybar

# Add SF Symbols used in status bar
brew install --cask sf-symbols

# Screenshots & screen recording
brew install --cask flameshot
brew install --cask ffmpeg
