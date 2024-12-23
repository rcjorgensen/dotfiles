#!/bin/bash

set -xe

sudo apt update
sudo apt -y upgrade

sudo apt install -y git wget curl stow unzip ripgrep build-essential

sudo apt autoremove -y

mkdir -p "$HOME/.config"

stow git
stow nvim
stow nvm
stow zsh
