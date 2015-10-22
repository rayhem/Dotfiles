#!/bin/bash

#Get root permissions
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

DOWNLOAD_DIR=$(whiptail --title "Download location" --inputbox "Enter download location:" 10 78 "/tmp" 3>&1 1>&2 2>&3)

mkdir -p $DOWNLOAD_DIR
DOWNLOADER="wget --no-verbose --recursive --no-host-directories --cut-dirs=7 --no-parent"

whiptail --title "Software selection" --checklist "Select software to install" --separate-output 20 60 4\
  faenza     "Faenza icon theme"        on \
  ubuntuFont "Ubuntu font pack"         on \
  utils      "Standard linux utilities" on \
  mathematica "Clean up Mathematica installation" on 2>"$DOWNLOAD_DIR/softwareList.txt"

while read LINE; do
  case $LINE in
  "faenza" ) 
    echo "Now installing Faenza..."
    WORKDIR="$DOWNLOAD_DIR/faenza"
    mkdir -p $WORKDIR && cd $WORKDIR
    eval "$DOWNLOADER -A.zip https://faenza-icon-theme.googlecode.com/files/faenza-icon-theme_1.3.zip"
    unzip "$WORKDIR/faenza-icon-theme_1.3.zip" 
    #sh ./INSTALL
    #cd $DOWNLOAD_DIR && rm -r $WORKDIR
  ;;
  "ubuntuFont" )
    echo "Now installing Ubuntu fonts..."
    WORKDIR="$DOWNLOAD_DIR/ubuntu_font"
    mkdir -p $WORKDIR && cd $WORKDIR
    eval "$DOWNLOADER -A.zip http://font.ubuntu.com/download/ubuntu-font-family-0.83.zip"
    unzip "$WORKDIR/ubuntu-font-family-0.83.zip"
    mv "ubuntu-font-family-0.83" "/usr/share/fonts/opentype/"
    cd $DOWNLOAD_DIR && rm -r $WORKDIR
  ;;
  "utils" )
    echo "Now installing Linux utilities..."
    SOFTWARE_LIST="build-essential clang clementine gfortran gfortran-doc git git-gui guake keepassx meld orpie python-gpgme rsync unison-gtk vim vim-gtk workrave"
    aptitude update
    aptitude install -y etckeeper
    aptitude install -y $SOFTWARE_LIST
  ;;
  "mathematica" )
    echo "Now cleaning Mathematica installation..."
    mv "/etc/xdg/menus/applications-merged/wolfram-all.menu" "/etc/xdg/menus/applications-merged/wolfram-all.menu.garbage"
    echo -e "\tCategories=Development;" >> "/usr/share/applications/wolfram-mathematica10.desktop"
  ;;
  esac
done < "$DOWNLOAD_DIR/softwareList.txt"
