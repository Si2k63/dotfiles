#!/bin/bash

for arg in "$@"; do
    case "$arg" in
        --editor) EDITOR_MODE=true ;;
    esac
done

main() {
    local site_directory="/home/$USER/Projects"
    

    selected_dir=$(fzf  --ansi --preview="ls -lah {}" < <(
    find -L "$site_directory" -mindepth 1 -maxdepth 1  &&
    echo "/home/$USER/dotfiles"
    ))

    # Check if a directory was selected and if it exists
    if [[ -n $selected_dir && -d $selected_dir ]]; then
        # Change directory to the selected directory
        cd "$selected_dir"
        initialise_tmux
    fi
}

initialise_tmux() {
    local session_name=$(basename "$PWD")
    local session_exists=$(tmux has-session -t $session_name 2>/dev/null)

    if [ session_exists != 0 ]; then
        if [ "$EDITOR_MODE" = "true" ]; then
            tmux new-session -d -s $session_name "tmuxifier load-window editor ; tmux select-window -t 0"
        else
            tmux new-session -d -s $session_name
        fi
    fi

    if [ -n "$TMUX" ]; then
        tmux switch-client -t $session_name
    else
        tmux attach -t $session_name
    fi
}

main
