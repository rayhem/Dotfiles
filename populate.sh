#!/bin/sh
# Automatically create symbolic links to version-controlled files

DOTFILE_DIR=`pwd`
DOTFILES="gitconfig gvimrc nethackrc vimrc zshrc"

for file in $DOTFILES; do
    if [ -L $HOME/$file ]; then
        echo "[Symbolic Link] : $HOME/$file exists, skip.";
        # uncomment below line to remove all existing symbolic links
        # rm $HOME/$file
    elif [ -f $HOME/$file ] || [ -d $HOME/$file ]; then
        echo "[File or Dir] : $Home/$rcfile exists, skip.";
    else
        LINKNAME=".$file" 
        ln -sf $DOTFILE_DIR/$file $HOME/$LINKNAME
        echo "[good] : built symbolic link: $DOTFILE_DIR/$file";
    fi
done
