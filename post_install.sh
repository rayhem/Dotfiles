#!/bin/bash

apt update
apt install etckeeper 

apt install vim vim-gtk i3 conky-all git rsync lightdm xclip ssh woof build-essential texlive-full fonts-font-awesome suckless-tools zsh thunar
apt install zsh

# Install Syncthing
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
apt update
apt install syncthing

# Set up directories
xdg-user-dirs-update
xdg-user-dirs-update --set TEMPLATES "$HOME/Scratch"

# Download firefox (if necessary)
if [ ! -d "/opt/firefox" ]; then
  FIREFOX_ARCHIVE="firefox.tar.bz2"
  wget -O "$FIREFOX_ARCHIVE" "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
  tar -xvf "$FIREFOX_ARCHIVE" --directory "/opt/"
  rm "$FIREFOX_ARCHIVE"
fi
