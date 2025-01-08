# Daniel’s macOS Dotfiles

Welcome to my personal macOS setup! This repository contains the configuration files and scripts I use to get my development environment up and running quickly. It includes tools, settings, and tweaks that I’ve customized to match my workflow.

## What’s Included?

### Essentials

- CLI Tools: git, wget, go, rust, python, nvm, gh, glab, starship, and more.
- GUI Applications: Visual Studio Code, Google Chrome, Alacritty, and others.
- Mac App Store Apps: Tools like Amphetamine, Reeder, Xcode, and more.

### Configurations

- Zsh: Custom .zshrc with aliases, plugin setups, and tool integrations.
- Alacritty: A minimal and sleek terminal configuration.
- Starship: A fast and beautiful shell prompt tailored to my preferences.
- Git: My preferred Git aliases and settings.

## How to Use

### Clone the Repository

```bash
git clone https://github.com/dsoaress/dotfiles.git
cd dotfiles
```

### Run the Setup Script

```bash
./setup.sh
```

### The script will

- Update your macOS system.
- Install Homebrew and essential tools.
- Configure terminal applications and development tools.
- Apply custom settings for Zsh, Git, Alacritty, and Starship.

### Restart Your Terminal

Once the script is done, restart your terminal to see everything in action.

## File Structure

```plaintext
.
├── scripts/
│   ├── alacritty-setup.sh      # Configures Alacritty terminal
│   ├── app-installer.sh        # Installs applications
│   ├── dev-tools.sh            # Configures development tools
│   ├── homebrew-setup.sh       # Installs Homebrew
│   ├── starship-setup.sh       # Configures Starship prompt
│   ├── zsh_setup.sh            # Configures Zsh shell
├── config/
│   ├── alacritty.yml           # Alacritty configuration
│   ├── gitconfig               # Git aliases and settings
│   ├── starship.toml           # Starship configuration
├── setup.sh                    # Main script to orchestrate the setup
└── README.md                   # You're here!
```
