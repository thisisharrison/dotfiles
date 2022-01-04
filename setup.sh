#!/usr/bin/env bash
# ~/.macos — https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "🤖 installing xcode cli..."
xcode-select --install

echo "🤖 installing homebrew..."
source ./install-homebrew.sh

echo "🤖 installing node..."
curl -L https://git.io/n-install | bash

echo "node --version: $(node --version)"
echo "npm --version: $(npm --version)"

echo "🤖 installing a few global npm packages..."
npm install --global yarn typescript ts-node serve fkill-cli

echo "🤖 brew installing stuff..."
brew bundle

echo "🤖 setup macos..."
source ./.macos

echo "🤖 setup vscode..."
source ./vscode-setup.sh

echo "🤖 DONE!!! 🎉"