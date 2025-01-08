#!/bin/bash

echo "Configuring development tools..."

echo "Configuring Git..."
cp "$(dirname "$0")/../config/gitconfig" ~/.gitconfig
echo 'alias g="git"' >>~/.zshrc

echo "Configuring Go..."
mkdir -p "$HOME/go"
echo 'export PATH=$PATH:/usr/local/go/bin' >>~/.zshrc
echo 'export GOPATH=$HOME/go' >>~/.zshrc
echo 'export PATH=$PATH:$GOPATH/bin' >>~/.zshrc

echo "Configuring Rust..."
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >>~/.zshrc

echo "Configuring NVM..."
mkdir -p ~/.nvm
echo 'export NVM_DIR="$HOME/.nvm"' >>~/.zshrc
echo '[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"' >>~/.zshrc
echo '[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"' >>~/.zshrc
cat << 'EOF' >> ~/.zshrc
# Automatically use Node.js version from .nvmrc if present
autoload -U add-zsh-hook

nvm_auto_use() {
  local nvmrc_path
  nvmrc_path=$(nvm_find_nvmrc)

  if [ -n "$nvmrc_path" ]; then
    local node_version
    node_version=$(nvm version)

    if [ "$(nvm current)" != "system" ] || [ "$(nvm current)" != "$(nvm version "$(cat "$nvmrc_path")")" ]; then
      nvm use --silent || nvm install
    fi

    # Enable Corepack after setting Node.js version
    corepack enable
  fi
}

add-zsh-hook chpwd nvm_auto_use
nvm_auto_use
EOF

echo "Development tools configured."
