# Dotfiles

## Getting started

### Setup SSH with GitHub

Generate a new key and upload it to GitHub.
```sh
EMAIL="27211248+rcjorgensen@users.noreply.github.com"
KEY_FILE="$HOME/.ssh/id_ed25519"
if [ ! -f "$KEY_FILE" ]; then
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$HOME/.ssh/id_ed25519" -N ""
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
fi
```
### Install git

```sh
sudo apt install git -y
```

### Clone this repo

```
git clone git@github.com:rcjorgensen/dotfiles.git ~/dotfiles
```

### Run install script

```
cd ~/dotfiles
./install.sh
```

### Change shell

```
chsh -s $(which zsh)
```

### Install fzf

The .zshrc requires version 0.48.0 or later. If the APT package is older, install it manually with git.

### Install wezterm

### Install neovim

### Install nvm
