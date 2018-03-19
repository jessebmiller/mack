#!/bin/bash

set +e

# Set Hostname
sudo scutil --set HostName dyson-alpha

# Git global config
git config --global set user.name "Jesse B. Miller"
git config --global set user.email "jesse@jessebmiller.com"

# Dock
echo "fixing the Dock"
defaults write com.apple.dock tilesize -int 1
defaults write com.apple.dock autohide-time-modifier -float 20000000000
defaults write com.apple.Dock autohide -bool TRUE
killall Dock

# Fonts
echo "Installing fonts"
brew cask install \
  font-anonymous-pro \
  font-dejavu-sans-mono-for-powerline \
  font-droid-sans \
  font-droid-sans-mono font-droid-sans-mono-for-powerline \
  font-meslo-lg font-input \
  font-inconsolata font-inconsolata-for-powerline \
  font-liberation-mono font-liberation-mono-for-powerline \
  font-liberation-sans \
  font-meslo-lg \
  font-nixie-one \
  font-office-code-pro \
  font-pt-mono \
  font-raleway font-roboto \
  font-source-code-pro font-source-code-pro-for-powerline \
  font-source-sans-pro \
  font-ubuntu font-ubuntu-mono-powerline

# Install dotfiles
echo "Installing dotfiles"
/bin/bash ../dotfiles/install.sh
