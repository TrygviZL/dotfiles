#!/bin/bash

# Update package lists
sudo apt update

sudo apt install unzip

# AWS CLI
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws

# Node.js & npm via NVM
echo "Installing NVM, Node.js, and npm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
source ~/.bashrc
nvm install 18
nvm use 18

# Git
echo "Installing Git..."
sudo apt install -y git

# set aws default region needed for terraform plan
aws configure set region eu-west-1

# Install saml2aws
echo "Installing saml2aws..."
mkdir -p ~/.local/bin
CURRENT_VERSION=$(curl -Ls https://api.github.com/repos/Versent/saml2aws/releases/latest | grep 'tag_name' | cut -d'v' -f2 | cut -d'"' -f1)
wget -c "https://github.com/Versent/saml2aws/releases/download/v${CURRENT_VERSION}/saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz" -O - | tar -xzv -C ~/.local/bin
chmod u+x ~/.local/bin/saml2aws
saml2aws --version

# adds convenient s2a command for logging into saml2aws
printf '\nfunction s2a {\n\tsaml2aws login --force\n\teval \x27$( $(which saml2aws) script --shell=bash --profile=$@)\x27\n}' >> ~/.bashrc; source ~/.bashrc

# Docker
echo "Installing Docker..."
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# AWS CDK
echo "Installing AWS CDK..."
npm install -g aws-cdk

# TypeScript
echo "Installing TypeScript..."
npm install -g typescript

# Terraform (Updated as per Terraform Docs)
echo "Installing Terraform..."
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform

# Python & pip
echo "Installing Python and pip..."
sudo apt install -y python3 python3-pip

# Jq
echo "Installing jq..."
sudo apt install -y jq

# Docker Compose
echo "Installing Docker Compose..."
sudo apt install -y docker-compose

# VSCode
echo "Installing VSCode..."
sudo snap install code --classic

# tmux
echo "Installing tmux..."
sudo apt install -y tmux

# OpenSSL
echo "Installing OpenSSL..."
sudo apt install -y openssl

# Update Bash Prompt
echo "Updating .bashrc with PS1 and Git functions..."
echo "function parse_git_dirty {" >> ~/.bashrc
echo "  [[ \$(git status 2> /dev/null | tail -n1) != \"nothing to commit, working tree clean\" ]] && echo \"*\"" >> ~/.bashrc
echo "}" >> ~/.bashrc
echo "function parse_git_branch {" >> ~/.bashrc
echo "  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e \"s/* \\(.*\\)/(\\1\$(parse_git_dirty))/\"" >> ~/.bashrc
echo "}" >> ~/.bashrc
echo "export PS1='\\[\\e[\\033[01;34m\\]\\u@\\h \\[\\e[38;5;211m\\]\\w\\[\\e[\\033[38;5;48m\\] \$(parse_git_branch)\\[\\e[\\033[00m\\]\\$ '" >> ~/.bashrc

# Install github cli
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# Completed
echo "Installation completed."
