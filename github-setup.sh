#!/usr/bin/env bash

echo "generating a new SSH key for GitHub"
ssh-keygen -t ed25519 -C "harrison.lau@outlook.com" -f ~/.ssh/id_ed25519
eval "$(ssh-agent -s)"
touch ~/.ssh/config
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_ed25519" | tee ~/.ssh/config
# ssh-add -K ~/.ssh/id_ed25519
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste that into GitHub"
