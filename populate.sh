#!/bin/sh
# Automatically create symbolic links to version-controlled files

Escape="\033";
RedF="${Escape}[31m"; GreenF="${Escape}[32m";
Reset="${Escape}[0m";

DOTFILE_DIR=`pwd`
DOTFILES="conkyrc gitconfig gvimrc nethackrc vimrc zshrc"

for file in $DOTFILES; do
    TARGET="$HOME/.$file"
    if [ -L $TARGET ]; then
        echo "[${RedF}Symlink${Reset}] : Link $TARGET already exists, skipped.";
        # uncomment below line to remove all existing symbolic links
        # rm $HOME/$file
    elif [ -f $TARGET ]; then
        echo "[${RedF}File${Reset}] : File $TARGET already exists, skipped.";
    else
        ln -sf $DOTFILE_DIR/$file $TARGET
        echo "[${GreenF}Good${Reset}] : built symbolic link: $TARGET";
    fi
done
