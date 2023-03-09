#!/usr/bin/env bash

set -o errexit
set -o nounset

sudo apt-get update

# Uninstall old vim version
sudo apt remove vim
sudo apt autoclean && sudo apt autoremove

# get latest version from ppa repo
sudo apt-add-repository ppa:jonathonf/vim

# update and install vim
sudo apt update
sudo apt install vim


# install nodejs
sudo apt install nodejs

# make directories
mkdir $HOME/.vim

# setup vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# get .vimrc
wget https://raw.githubusercontent.com/TrygviZL/my-dotfiles/main/.vimrc
mv .vimrc $HOME

# get coc-settings
wget https://raw.githubusercontent.com/TrygviZL/my-dotfiles/main/coc-settings.json
mv coc-settings.json $HOME/.vim

# install plugins 
vim +PlugInstall

# install fish-shell
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish

# install oh-my-fish and set theme
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install lavender
