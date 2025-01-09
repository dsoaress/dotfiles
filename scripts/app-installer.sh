echo "Installing essential tools..."
essential_tools=(
  git
  wget
  mas
  nvm
  oven-sh/bun/bun
  go
  rust
  python
  gh
  glab
  starship
  atomicjar/tap/testcontainers-desktop
)

for tool in "${essential_tools[@]}"; do
  brew install "$tool"
done

echo "Installing cask applications..."
cask_apps=(
  alacritty
  visual-studio-code
  beekeeper-studio
  bruno
  boop
  orbstack
  google-chrome
  whatsapp
  discord
  microsoft-teams
  chatgpt
  viscosity
  istat-menus
  logi-options+
  betterdisplay
  figma
  pictogram
  vlc
  utm
  font-jetbrains-mono-nerd-font
)

for app in "${cask_apps[@]}"; do
  brew install --cask "$app"
done

echo "Installing apps from the Mac App Store..."
mac_app_store_apps=(
  937984704   # Amphetamine
  1632827132  # Camera Preview
  1558360383  # Menu Bar Calendar
  6475002485  # Reeder
  497799835   # Xcode
  1444636541  # Photomator
  409203825   # Numbers
  409201541   # Pages
)

for app_id in "${mac_app_store_apps[@]}"; do
  mas install "$app_id"
done
