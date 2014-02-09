#!/bin/bash

whiptail --checklist "Select software to install" 20 60 5\
  firefox    "Firefox"            off \
  faenza     "Faenza"             off \
  talkPlugin "Google Talk Plugin" off 2>distrochoice

CHOICE=$?

echo $CHOICE
DOWNLOAD_DIRECTORY="/tmp/software_bundle"

mkdir -p $DOWNLOAD_DIRECTORY 

wget --recursive --no-host-directories --cut-dirs=7 --no-parent -A.bz2 --directory-prefix=$DOWNLOAD_DIRECTORY http://releases.mozilla.org/pub/mozilla.org/firefox/releases/latest/linux-x86_64/en-US/

wget --recursive --no-host-directories --cut-dirs=1 --no-parent -A.zip --directory-prefix=$DOWNLOAD_DIRECTORY https://faenza-icon-theme.googlecode.com/files/faenza-icon-theme_1.3.zip
