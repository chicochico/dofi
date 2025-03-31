#!/bin/bash

echo "Setting macos preferences"

# Set system preferences
# Dock preferences
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0.0
defaults write com.apple.dock autohide-time-modifier -float 0.15
defaults write com.apple.dock appswitcher-all-displays -bool true

# Menu preferences
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Mouse and trackpad settings
defaults write NSGlobalDomain com.apple.mouse.scaling -float 3.0
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3.0
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain KeyRepeat -int 1

echo "Some settings take effect after restart"
