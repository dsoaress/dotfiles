#!/bin/bash

echo "Configuring development tools..."

echo "Configuring Git..."
cp "$(dirname "$0")/../config/gitconfig" ~/.gitconfig
if ! grep -q 'alias g="git"' ~/.zshrc; then
  echo 'alias g="git"' >>~/.zshrc
  echo "Git alias added to .zshrc."
else
  echo "Git alias already exists in .zshrc."
fi

echo "Configuring Go..."
mkdir -p "$HOME/go"
for line in 'export PATH=$PATH:/usr/local/go/bin' 'export GOPATH=$HOME/go' 'export PATH=$PATH:$GOPATH/bin'; do
  if ! grep -q "$line" ~/.zshrc; then
    echo "$line" >>~/.zshrc
    echo "Added: $line"
  else
    echo "Line already exists: $line"
  fi
done

echo "Configuring NVM..."
mkdir -p ~/.nvm
for line in 'export NVM_DIR="$HOME/.nvm"' '[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"' '[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"'; do
  if ! grep -q "$line" ~/.zshrc; then
    echo "$line" >>~/.zshrc
    echo "Added: $line"
  else
    echo "Line already exists: $line"
  fi
done

echo "Development tools configured."
