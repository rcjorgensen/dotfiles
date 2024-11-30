#!/bin/bash

set -e

sudo apt update
sudo apt -y upgrade

sudo apt install -y curl wget git stow

sudo apt autoremove -y

curl -LO https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

sudo mkdir -p -m 755 /etc/apt/keyrings
wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh -y

KEY_FILE="$HOME/.ssh/id_ed25519"
if [ ! -f "$KEY_FILE" ]; then
	ssh-keygen -t ed25519 -C "27211248+rcjorgensen@users.noreply.github.com" -f "$HOME/.ssh/id_ed25519" -N ""
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_ed25519
fi

if ! gh auth status; then
	gh auth login
fi

NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
	git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
fi

git -C "$NVM_DIR" checkout v0.40.1
. "$HOME/.nvm/nvm.sh"
nvm install 23.3.0

mkdir -p "$HOME/.config"

stow bash
stow git
stow nvim
