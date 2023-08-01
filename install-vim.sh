
#!/usr/bin/env bash

DEBIAN_FRONTEND=noninteractive
set -o errexit
set -o nounset

# fix possible vpm routing issue
sudo rm -rf /etc/resolv.conf
sudo tee /etc/resolv.conf << EOF
search yourbase.domain.local
nameserver 8.8.8.8
nameserver 1.1.1.1
EOF

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

# install aws cli
sudo apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# install pip and dbt
sudo apt install python3-pip
pip install dbt-core dbt-snowflake

# Install saml2aws
mkdir -p ~/.local/bin
CURRENT_VERSION=$(curl -Ls https://api.github.com/repos/Versent/saml2aws/releases/latest | grep 'tag_name' | cut -d'v' -f2 | cut -d'"' -f1)
wget -c "https://github.com/Versent/saml2aws/releases/download/v${CURRENT_VERSION}/saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz" -O - | tar -xzv -C ~/.local/bin
chmod u+x ~/.local/bin/saml2aws

# adds convenient s2a command for logging into saml2aws
printf '\nfunction s2a {\n\tsaml2aws login --force\n\teval \x27$( $(which saml2aws) script --shell=bash --profile=$@)\x27\n}' >> ~/.bashrc; source ~/.bashrc
