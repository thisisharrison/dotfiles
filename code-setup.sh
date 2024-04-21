# VS code setup

# Extensions
echo "🤖 Installing code extensions..." 

cat ./Code/extensions.txt | xargs -L 1 code --install-extension

echo "🤖 Finished installing" 

# Settings, Keybindings, Snippets
echo "🤖 Copying settings, keybindings, snippets..." 

cat ./Code/keybindings.json >> $HOME/Library/Application\ Support/Code/User/keybindings.json
cat ./Code/settings.json >> $HOME/Library/Application\ Support/Code/User/settings.json

echo "🤖 Finished copying settings, keybindings, snippets..." 