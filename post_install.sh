#!/bin/bash
apt update
apt install etckeeper 

USER=$(logname)

RESOURCES=$(whiptail --title "Select resources to configure" --checklist --separate-output "Options:" 20 78 8 \
  0 "Compilers, git, ssh, vim, etc." on \
  1 "Firefox" on \
  2 "i3" on \
  3 "Fonts" on \
  4 "Rust" on \
  5 "Syncthing" on \
  6 "XDG directories" on \
  7 "NVIDIA 440 graphics drivers" off \
  3>&1 1>&2 2>&3)

for i in $RESOURCES; do
  case $i in
    0) echo "Compilers";;
    1) echo "Firefox";;
    2) echo "I3";;
    3) echo "Fonts";;
    4) echo "Rust";;
    5) echo "Syncthing";;
    6) echo "XDG";;
    7) echo "NVIDIA";;
  esac
done

function configureDefaultPrograms {
  echo -n "Configuring baseline software..."
  apt install build-essential curl git rsync ssh vim vim-gtk woof 
  echo "done!"
}

function configureFirefox {
  echo -n "Configuring firefox..."
  INSTALL_DIR="/opt/firefox"
  if [ ! -d "$INSTALL_DIR" ]; then
    ARCHIVE="firefox.tar.bz2"
    wget -O "$ARCHIVE" "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
    tar -xvf "$ARCHIVE" --directory "/opt/"
    rm "$ARCHIVE"
  fi

  groupadd "firefox"
  usermod -aG "firefox" "$USER"
  chown -R root:firefox "$INSTALL_DIR"
  chmod -R 775 "$INSTALL_DIR"

  ln -s "$INSTALL_DIR/firefox" "/usr/local/bin"
  echo "done!"
}

function configureI3 {
  echo -n "Configuring i3..."
  apt install i3 conky-all lightdm xclip fonts-font-awesome suckless-tools thunar
  echo "done!"
}

function configureFonts {
  echo -n "Configuring fonts..."
  DESTINATION="/usr/share/fonts/ubuntu"
  if [ ! -d "$DESTINATION" ]; then
    ARCHIVE="ubuntu_font.zip"
    wget -O "$ARCHIVE" "https://assets.ubuntu.com/v1/0cef8205-ubuntu-font-family-0.83.zip"
    unzip "$ARCHIVE" -d "$DESTINATION"
    rm "$ARCHIVE"
  fi
  echo "done!"
}

function configureRust {
  echo -n "Configuring rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  echo "done!"
}

function configureSyncthing {
  echo -n "Configuring Syncthing..."
  curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
  echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
  apt update
  apt install syncthing
  echo "done!"
}

function configureXdgDirectories {
  echo -n "Configuring XDG directories..."
  HOMEDIR=$( getent passwd "$USER" | cut -d: -f6 )
  su "$USER" -c "xdg-user-dirs-update"
  su "$USER" -c "xdg-user-dirs-update --set TEMPLATES $HOMEDIR/Scratch"
  su "$USER" -c "rm -r $HOMEDIR/Desktop $HOMEDIR/Templates"
  echo "done!"
}

function configureNvidia440 {
  echo -n "Configuring NVIDIA drivers..."
  # Don't forget to install linux headers
  ARCHIVE="NVIDIA-Linux-x86_64-440.44.run"
  wget "http://us.download.nvidia.com/XFree86/Linux-x86_64/440.44/$ARCHIVE"
  chmod +x "$ARCHIVE"
  bash $ARCHIVE
  echo "done!"
}