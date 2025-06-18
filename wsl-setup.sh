#!/bin/bash

set -e

DOTFILES_DIR="$HOME/dotfiles/wsl"
BASHRC="$HOME/.bashrc"
CONFIG="source $DOTFILES_DIR/.bashrc_wsl"

sudo apt update
xargs -a "$DOTFILES_DIR/packages.txt" sudo apt install -y

grep -Fxq "$CONFIG" "$BASHRC" || echo "$CONFIG" >> "$BASHRC"
cp "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

cd /tmp
wget https://go.dev/dl/go1.24.4.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.24.4.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

