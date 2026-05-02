#!/bin/bash

for arg in "$@"; do
  case "$arg" in
  --editor) EDITOR_MODE=true ;;
  esac
done

main() {
  local site_directory="/home/$USER/Projects"

  # Generate the list into a variable first to keep fzf clean
  local dir_list
  dir_list=$(
    find -L "$site_directory" -mindepth 1 -maxdepth 1 2>/dev/null
    find -L "/var/www" -mindepth 1 -maxdepth 1 2>/dev/null
    find -L "/home/sites" -mindepth 1 -maxdepth 1 2>/dev/null
    echo "/home/$USER/dotfiles"
  )

  # Pipe the variable into fzf
  selected_dir=$(echo "$dir_list" | fzf --style full \
    --padding 1,2 \
    --color 'border:#aaaaaa,label:#cccccc' \
    --color 'list-border:#00AACC,list-label:#99cc99' \
    --color 'input-border:#00CCAA,input-label:#ffcccc' \
    --color 'header-border:#6699cc,header-label:#ffffff')

  if [[ -n "$selected_dir" && -d "$selected_dir" ]]; then
    cd "$selected_dir" || exit
    initialise_tmux
  fi
}

initialise_tmux() {
  local session_name
  session_name=$(basename "$PWD" | tr '.' '_') # Tmux hates dots in names

  # Check if session exists (0 means yes, non-zero means no)
  tmux has-session -t "$session_name" 2>/dev/null
  local session_not_exists=$?

  if [ $session_not_exists -ne 0 ]; then
    if [ "$EDITOR_MODE" = "true" ]; then
      # Create session and run tmuxifier
      tmux new-session -d -s "$session_name"
      tmux send-keys -t "$session_name" "tmuxifier load-window editor" C-m
    else
      tmux new-session -d -s "$session_name"
    fi
  fi

  # Switch or Attach
  if [ -n "$TMUX" ]; then
    tmux switch-client -t "$session_name"
  else
    tmux attach -t "$session_name"
  fi
}

main
