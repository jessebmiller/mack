#!/bin/bash

set +e

# - homebrew, fonts, chrome, docker, iterm2

echo "Install starting. You may be asked for your password (for sudo)."

# requires xcode and tools!
xcode-select -p || exit "XCode must be installed! (use the app store)"

# requirements
cd ~/
mkdir ~/tmp

# homebrew
if hash brew &> /dev/null; then
	echo_ok "Homebrew already installed"
else
    echo_warn "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Dock
echo "fixing the Dock"
defaults write com.apple.dock tilesize -int 1
defaults write com.apple.dock autohide-time-modifier -float 20000000000
killall Dock

brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts

brew update
brew upgrade

# Fonts
echo "Installing fonts..."
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

# Apps
echo "Installing applications..."
brew cask install \
     google-chrome \
     iterm2 \
     docker \
     tidal

curl https://prerelease.keybase.io/Keybase.dmg > ~/tmp/Keybase.dmg
sudo hdiutil attach ~/tmp/Keybase.dmg
cp -r /Volumes/Keybase/Keybase.app /Applications
sudo hdiutil detach /Volumes/Keybase

# Install dotfiles
export GLOBIGNORE="*." # exclude . and .. from glob
for file in ~/mack/dotfiles/.*; do
    destinationFile="~/$(basename $file)"
    ln -s $file $destinationFile
done
unset GLOBIGNORE

# configure iterm2
open "~/tmp/mack/config/SolarizedDark.itermcolors"

rm -rf ~/tmp
