#!/bin/bash

echo "Configuring Alacritty..."

CONFIG_DIR="$HOME/.config/alacritty"
mkdir -p "$CONFIG_DIR"

cp "$(dirname "$0")/../config/alacritty.yml" "$CONFIG_DIR/alacritty.yml"

echo "Alacritty configuration copied to $CONFIG_DIR."
