# DOT ZSH AUTO INSTALLER

This repository contains scripts to automate the installation of Zsh and several useful plugins using oh-my-zsh on Linux systems.

## Installation Steps

1. ### Clone the Repository

   Clone this repository to your local machine:

   ```bash
   git clone <repository_url>
   cd <repository_name>
   ```

2. ### Run the Installation Script

   Execute the `install.sh` script to install oh-my-zsh, plugins, set up `.zshrc`, and make zsh the default shell:

   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. ### Plugin Installation Details

   The `plugins-installer.sh` script installs the following plugins:

   - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
   - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
   - [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)
   - [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete)
   - [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)

   These plugins are installed into `~/.oh-my-zsh/custom/plugins/`.

4. ### Setting up `.zshrc`

   The `.zshrc` file provided in this repository is copied to `~/.zshrc` during installation.

5. ### Make Zsh Default Shell

   The script automatically changes the default shell to zsh using `chsh`.

## Usage

After completing the installation steps, log out and log back in to your terminal session to start using Zsh with configured plugins.

## Notes

- Ensure that `git` and other necessary dependencies are installed before running the scripts.
- Customize `.zshrc` or add/remove plugins as desired by modifying the `plugins-installer.sh` script or manually editing `~/.zshrc`.

### Contributing

We welcome contributions to improve and expand this project! To contribute, please follow these steps:

1. **Fork the Repository**: Create a personal fork of the repository on GitHub.

2. **Clone Your Fork**: Clone your forked repository to your local machine.

   ```bash
   git clone https://github.com/your-username/repo-name.git
   cd repo-name
   ```

3. **Create a Branch**: Create a new branch for your feature or bug fix.

   ```bash
   git checkout -b feature-or-bugfix-name
   ```

4. **Make Changes**: Make your changes or additions. Ensure your code follows the project's coding standards and is properly documented.

5. **Commit Changes**: Commit your changes with a clear and concise commit message.

   ```bash
   git add .
   git commit -m "Description of your changes"
   ```

6. **Push Changes**: Push your changes to your forked repository.

   ```bash
   git push origin feature-or-bugfix-name
   ```

7. **Create a Pull Request**: Go to the original repository on GitHub and create a pull request from your forked repository and branch. Provide a detailed description of your changes and the reasons for them.

We appreciate your efforts and contributions to the project. Thank you for helping make this project better!

Feel free to modify this template based on your specific needs and guidelines.

## License

This project is licensed under the [MIT License](https://github.com/cargopip/dot-zsh/blob/master/LICENSE)
