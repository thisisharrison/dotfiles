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

# Download homebrew
echo "🤖 installing homebrew..."
source ./install-homebrew.sh

# Setup git configs
echo "🤖 setup github..."
source ./github-setup.sh

# Download nvm
echo "🤖 installing node..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Copy dot and config files. 
# Needs to execute `.zshrc` here to export path for brew and nvm
echo "🤖 setup macos..."
source ./.macos

# Install node
nvm install node
nvm install 16
nvm use 16

echo "nvm --version: $(command -v nvm)"
echo "node --version: $(node --version)"
echo "npm --version: $(npm --version)"

echo "🤖 installing a few global npm packages..."
npm install --global yarn typescript ts-node serve fkill-cli

# Install other stuff with brew 
echo "🤖 brew installing stuff..."
brew bundle install Brewfile

echo "🤖 install oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp omz-config.zsh $ZSH_CUSTOM 
cp alias.zsh $ZSH_CUSTOM
cat .zshrc >> $ZSH_CUSTOM/exports.zsh

# Setup tiling manager
cat .yabairc >> $HOME/.yabairc
cat .skhdrc >> $HOME/.skhdrc

# Setup vscode
source ./code-setup.sh

echo "🤖 updating things..."
# Update App Store apps
sudo softwareupdate -i -a
# Update Homebrew (Cask) & packages
brew update
brew upgrade
# Update Ruby & gems
sudo gem update —system
sudo gem update

echo "🤖 DONE!!! 🎉"