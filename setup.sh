#!/bin/bash

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "This script is designed for macOS."
  exit 1
fi

echo "Updating system..."
softwareupdate --install --all

echo "Starting setup..."
SCRIPTS_DIR="$(dirname "$0")/scripts"

bash "$SCRIPTS_DIR/homebrew-setup.sh"
bash "$SCRIPTS_DIR/app-installer.sh"
bash "$SCRIPTS_DIR/zsh-setup.sh"
bash "$SCRIPTS_DIR/dev-tools.sh"
bash "$SCRIPTS_DIR/starship-setup.sh"
bash "$SCRIPTS_DIR/alacritty-setup.sh"

echo "Setup complete! Restart your terminal to apply changes."
