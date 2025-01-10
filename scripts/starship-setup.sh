#!/bin/bash

echo "Configuring Starship..."

CONFIG_DIR="$HOME/.config"
mkdir -p "$CONFIG_DIR"

CONFIG_FILE="starship.toml"
TARGET_FILE="$CONFIG_DIR/$CONFIG_FILE"
SOURCE_FILE="$(dirname "$0")/../config/$CONFIG_FILE"

cp "$SOURCE_FILE" "$TARGET_FILE"

if ! grep -q 'eval "$(starship init zsh)"' ~/.zshrc; then
  echo 'eval "$(starship init zsh)"' >>~/.zshrc
  echo "Starship initialization added to .zshrc."
else
  echo "Starship initialization is already present in .zshrc."
fi

echo "Starship configuration copied to $CONFIG_DIR and initialized in .zshrc."
