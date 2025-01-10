#!/bin/bash

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "This script is designed for macOS."
  exit 1
fi

if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root. Type your password to continue..."
  sudo "$0" "$@"
  exit
fi

echo "Updating system..."
softwareupdate --install --all

echo "Starting setup..."
SCRIPTS_DIR="./scripts"
FAILED_SCRIPTS=()

run_script() {
  local script="$1"
  local require_sudo="$2"
  
  if [[ "$require_sudo" == "no" ]]; then
    echo "Running $script as $SUDO_USER..."
    if su - "$SUDO_USER" -c "bash $(pwd)/$script"; then
      echo "$script completed successfully."
    else
      echo "Error: $script failed!"
      FAILED_SCRIPTS+=("$script")
    fi
  else
    echo "Running $script as root..."
    if bash "$script"; then
      echo "$script completed successfully."
    else
      echo "Error: $script failed!"
      FAILED_SCRIPTS+=("$script")
    fi
  fi
}

SCRIPTS=(
  "homebrew-setup.sh:yes"
  "app-installer.sh:yes"
  "zsh-setup.sh:yes"
  "dev-tools.sh:no"
  "starship-setup.sh:no"
  "alacritty-setup.sh:no"
  "dock.sh:no"
)

for script_entry in "${SCRIPTS[@]}"; do
  IFS=":" read -r script require_sudo <<< "$script_entry"
  run_script "$SCRIPTS_DIR/$script" "$require_sudo"
done

if [ ${#FAILED_SCRIPTS[@]} -ne 0 ]; then
  echo "The following scripts failed:"
  for script in "${FAILED_SCRIPTS[@]}"; do
    echo "- $script"
  done
  echo "Please check the logs for more details."
else
  echo "Setup complete! Restarting your machine in 10 seconds, press CTRL+C to cancel..."
  sleep 10 && reboot
fi
