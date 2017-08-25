#!/usr/bin/env bash

# The two possible paths to linuxbrew.
BREW_PATH_ONE=~/.linuxbrew
BREW_PATH_TWO=/home/linuxbrew/.linuxbrew

echo -e "\nInstalling Linuxbrew\n"
if [ ! -d "$BREW_PATH_ONE" ] && [ ! -d "$BREW_PATH_TWO" ] ; then
    yes | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
fi

echo -e "\nAttempting to add Brew to PATH\n"
if [ ! `which brew` ] ; then
    echo -e "\nAdding Brew to PATH\n"
    test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$PATH"
    test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
    test -r ~/.bash_profile && echo 'export PATH="$(brew --prefix)/bin:$PATH"' >>~/.bash_profile
    echo 'export PATH="$(brew --prefix)/bin:$PATH"' >>~/.profile
fi