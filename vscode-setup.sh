#!/usr/bin/env bash

echo "symlink vscode settings"
ln -s "${HOME}/dotfiles/VSCode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"

echo "install extensions"
for ext in $(jq '.extensions[]' -r ${HOME}/dotfiles/VSCode/extensions.json)
do
  code --install-extension $ext --force
done

echo "done"