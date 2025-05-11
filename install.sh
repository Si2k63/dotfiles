#!/bin/sh

sudo apt install zoxide
sudo apt install stow
sudo apt install jq

cd ~/dotfiles
stow .

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

~/.fzf/install

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

git clone git@github.com:Si2k63/AstroNvimV4.git ~/.config/nvim
