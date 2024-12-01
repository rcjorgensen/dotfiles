#!/bin/bash

set -e

sudo hwclock --hctosys

sudo apt update
sudo apt -y upgrade

sudo apt install -y wget git

sudo apt autoremove -y

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

DOTFILES_DIR="$HOME/dotfiles"
gh repo clone rcjorgensen/dotfiles "$DOTFILES_DIR"

cd "$DOTFILES_DIR"
sh ./install.sh
