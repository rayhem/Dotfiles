#!/bin/bash

#if [[ $EUID -ne 0 ]]; then
  #echo "You must be root to run this." 1>&2
  #exit 100
#fi

DOWNLOAD_DIR=$(whiptail --title "Download location" --inputbox "Enter download location:" 10 78 "/home/connor/Downloads/dldir" 3>&1 1>&2 2>&3)

mkdir -p $DOWNLOAD_DIR

whiptail --title "Software selection" --checklist "Select software to install" --separate-output 20 60 5\
  firefox    "Firefox web browser" off \
  faenza     "Faenza icon theme"   off \
  talkPlugin "Google Talk Plugin"  off \
  greybird   "Greybird GTK theme"  off 2>"$DOWNLOAD_DIR/softwareList.txt"

while read LINE; do
  case $LINE in
  "firefox" ) 
    echo "Now installing Firefox..."
    wget --no-verbose --recursive --no-host-directories --cut-dirs=7 --no-parent -A.bz2 --directory-prefix=$DOWNLOAD_DIR http://releases.mozilla.org/pub/mozilla.org/firefox/releases/latest/linux-x86_64/en-US/
      tar -xvjf "$DOWNLOAD_DIR/firefox*.tar.bz2"
  ;;

  "faenza" ) 
    wget --no-verbose --recursive --no-host-directories --cut-dirs=1 --no-parent -A.zip --directory-prefix=$DOWNLOAD_DIR https://faenza-icon-theme.googlecode.com/files/faenza-icon-theme_1.3.zip
  ;;

  "greybird" )
    git clone --quiet "https://github.com/shimmerproject/Greybird.git" "$DOWNLOAD_DIR/greybird"
  ;;

"talkPlugin" )
    wget 

  esac
done < "$DOWNLOAD_DIR/softwareList.txt"


