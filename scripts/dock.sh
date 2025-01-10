#!/bin/bash

echo "Resetting and configuring the Dock..."
dockutil --no-restart --remove all

apps=(
  "/Applications/Safari.app"
  "/Applications/Google Chrome.app"
  "/System/Applications/Mail.app"
  "/System/Applications/Calendar.app"
  "/System/Applications/Reminders.app"
  "/System/Applications/Notes.app"
  "/Applications/Microsoft Teams.app"
  "/Applications/Discord.app"
  "/Applications/WhatsApp.app"
  "/Applications/Reeder.app"
  "/Applications/Bruno.app"
  "/Applications/Beekeeper Studio.app"
  "/Applications/Visual Studio Code.app"
  "/Applications/Alacritty.app"
  "/Applications/Boop.app"
  "/System/Applications/Photos.app"
  "/Applications/Photomator.app"
  "/System/Applications/Music.app"
  "/System/Applications/Podcasts.app"
  "/System/Applications/App Store.app"
  "/System/Applications/System Settings.app"
)

for app in "${apps[@]}"; do
  dockutil --no-restart --add "$app"
done

dockutil --no-restart --add "~/Downloads" --view grid --display folder
killall Dock

echo "Dock successfully configured!"
