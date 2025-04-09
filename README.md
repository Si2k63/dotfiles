# Si's Dotfiles

This dotfiles repository is intended to improve my efficiency as a developer.

It contains my aliases, tmux configuration and an install script to install all software dependencies for this repository.

It is used in conjuction with my [AstroNvim configuration](https://github.com/Si2k63/AstroNvimV4/).

## Installation

```
git clone git@github.com:Si2k63/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow .
./install.sh
```

## Some useful aliases

```
tm - open fzf on a preordained list of directories, then either attach to a tmux session or create a new one named after the selected directory's basename.
tn - the same as above, but load my editor layout which automatically starts neovim, creates a vertical split and runs git status.
pub - cat my pub key
```

