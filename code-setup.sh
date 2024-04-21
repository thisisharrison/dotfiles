# VS code setup

# Extensions
echo "🤖 Installing code extensions..." 

cat ./Code/extensions.txt | xargs -L 1 code --install-extension

echo "🤖 Finished installing" 

# Settings, Keybindings, Snippets
echo "🤖 Symlinking settings, keybindings, snippets..." 

ln -s ./Code/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
ln -s ./Code/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -s ./Code/snippets/ $HOME/Library/Application\ Support/Code/User

echo "🤖 Finished symlinking settings, keybindings, snippets..." 