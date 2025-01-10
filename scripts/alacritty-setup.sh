#!/bin/bash

echo "Configuring Alacritty..."

CONFIG_DIR="$HOME/.config/alacritty"
mkdir -p "$CONFIG_DIR"

CONFIG_FILE="alacritty.toml"
TARGET_FILE="$CONFIG_DIR/$CONFIG_FILE"
SOURCE_FILE="$(dirname "$0")/../config/$CONFIG_FILE"

cp "$SOURCE_FILE" "$TARGET_FILE"

echo "Alacritty configuration set at $CONFIG_DIR."
