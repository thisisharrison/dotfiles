#!/usr/bin/env bash

echo "copy vscode settings"
rm ${HOME}/Library/Application\ Support/Code/User/settings.json
# prefer copying instead of symlink
cp "${HOME}/dotfiles/VSCode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
# ln -s "${HOME}/dotfiles/VSCode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"

echo "install extensions"
for ext in $(jq '.extensions[]' -r ${HOME}/dotfiles/VSCode/extensions.json)
do
  code --install-extension $ext --force
done

echo "done"