#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

sudo apt-get update

# Uninstall old vim version
sudo apt remove vim
sudo apt autoclean && sudo apt autoremove

# get latest version from ppa repo
sudo apt-add-repository ppa:jonathonf/vim

# update and install vim
sudo apt update
sudo apt install vim

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
