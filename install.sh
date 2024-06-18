#!/bin/bash
# Install oh-my-zsh
echo "Installing oh-my-zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "oh-my-zsh is already installed."
fi

# Install Plugins
echo "Installing Plugins"
chmod +x ./plugins-installer.sh
./plugins-installer.sh

# Move zhsrc file
cp .zshrc ~/.zshrc

# Make zsh default shell
chsh -s $(which zsh)
echo "The current shell is $SHELL"

# Done
echo "Installation Completed"
echo "Happy Hacking!"


