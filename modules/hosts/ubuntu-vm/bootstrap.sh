#!/bin/sh

sudo apt install git curl
git clone "https://github.com/riyyi/arch-wsl" dotfiles

# Install nix
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh -s -- --daemon
echo "experimental-features = flakes nix-command pipe-operators" > /etc/nix/nix.conf

# - switch
# - install packages (declpac)
# - chsh -s /bin/zsh
