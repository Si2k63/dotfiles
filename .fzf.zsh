# Setup fzf
# ---------
if [[ ! "$PATH" == */home/si/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/si/.fzf/bin"
fi

source <(fzf --zsh)
