#!/bin/bash

if [[ "$SHELL" != "/bin/zsh" ]]; then
  echo "Setting Zsh as the default shell..."
  chsh -s /bin/zsh
else
  echo "Zsh is already the default shell."
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed."
fi

echo "Installing Oh My Zsh plugins..."
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >>~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >>~/.zshrc
