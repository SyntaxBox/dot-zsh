#!/bin/zsh

# Update package list and install necessary dependencies
echo "Updating package list and installing git..."
sudo apt update
sudo apt install -y git

# List of Zsh plugin repository URLs
ZSH_PLUGINS=(
  "https://github.com/zsh-users/zsh-autosuggestions.git"
  "https://github.com/zsh-users/zsh-syntax-highlighting.git"
  "https://github.com/zdharma-continuum/fast-syntax-highlighting.git"
  "https://github.com/marlonrichert/zsh-autocomplete.git"
  "https://github.com/zsh-users/zsh-history-substring-search.git"
)

# Function to install a Zsh plugin
install_zsh_plugin() {
  local repo_url=$1
  local plugin_name=$(basename $repo_url .git)
  local plugin_dir="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$plugin_name"

  if [ ! -d "$plugin_dir" ]; then
    echo "Installing $plugin_name..."
    git clone $repo_url $plugin_dir
  else
    echo "$plugin_name is already installed."
  fi
}

# Install plugins
for plugin in "${ZSH_PLUGINS[@]}"; do
  install_zsh_plugin $plugin
done

# Apply the changes
echo "Applying changes..."
source ~/.zshrc

echo "Zsh plugins installation complete!"
