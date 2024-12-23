# Add SSH key

```sh
KEY_FILE="$HOME/.ssh/id_ed25519"
if [ ! -f "$KEY_FILE" ]; then
  ssh-keygen -t ed25519 -C "27211248+rcjorgensen@users.noreply.github.com" -f "$HOME/.ssh/id_ed25519" -N ""
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
fi
```
