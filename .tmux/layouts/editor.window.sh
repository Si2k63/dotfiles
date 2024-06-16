# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/standard"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "editor"
run_cmd "nvim ."

# Split window into panes.
split_v 15
run_cmd "npm start"

split_h 50

run_cmd "git status"     # runs in active pane

select_pane 0
