#!/bin/bash

echo "Configuring Starship..."

CONFIG_DIR="$HOME/.config"
mkdir -p "$CONFIG_DIR"

cp "$(dirname "$0")/../config/starship.toml" "$CONFIG_DIR/starship.toml"

echo 'eval "$(starship init zsh)"' >>~/.zshrc

echo "Starship configuration copied to $CONFIG_DIR and initialized in .zshrc."
