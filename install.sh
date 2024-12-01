#!/bin/bash

set -e

sudo apt update
sudo apt -y upgrade

sudo apt install -y curl stow gpg unzip ripgrep build-essential

sudo apt autoremove -y

curl -LO https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
	git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
fi

git -C "$NVM_DIR" checkout v0.40.1
. "$HOME/.nvm/nvm.sh"
nvm install 23.3.0

curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update
sudo apt install wezterm -y

mkdir -p "$HOME/.config"

BASHRC="$HOME/.bashrc"
PROFILE="$HOME/.profile"
BASH_LOGOUT="$HOME/.bash_logout"
if [ -f "$BASHRC" ]; then
	rm "$BASHRC"
fi
if [ -f "$PROFILE" ]; then
	rm "$PROFILE"
fi
if [ -f "$BASH_LOGOUT" ]; then
	rm "$BASH_LOGOUT"
fi

stow bash
stow git
stow nvim
stow wezterm
