# 1. Load your shared logic
source ~/dotfiles/.aliases

# 2. Validate the project root immediately
PROJ=$(wproot)

if [ -z "$PROJ" ]; then
  echo "----------------------------------------------------------"
  echo "ABORTING: Not a valid WordPress project root."
  echo "----------------------------------------------------------"
  exit 1
fi

# 3. Theme Window (First Window)
# We calculate the path first to see if we should create the window
THEME_PATH=$(get_theme_path)

if [[ -n "$THEME_PATH" ]]; then
  window_root "$THEME_PATH"
  tmux rename-window "editor"
  split_v 15
  run_cmd "gst"
  select_pane 1
  run_cmd "nvim"
fi

# 4. Accommodation Plugin
if [[ -d "$PROJ/web/wp-content/plugins/accommodation" ]]; then
  window_root "$PROJ/web/wp-content/plugins/accommodation"
  new_window "acc"
  run_cmd "nvim ."
  split_v 15
  run_cmd "gst"
  select_pane 1
fi

# 5. Supercontrol Plugin
if [[ -d "$PROJ/web/wp-content/plugins/supercontrol" ]]; then
  window_root "$PROJ/web/wp-content/plugins/supercontrol"
  new_window "sc"
  run_cmd "nvim ."
  split_v 15
  run_cmd "gst"
  select_pane 1
fi

# 6. Web Window
if [[ -d "$PROJ/web" ]]; then
  window_root "$PROJ/web"
  new_window "web"
fi

# 7. Logs
if [[ -d "$PROJ/log" ]]; then
  window_root "$PROJ/log"
  new_window "logs"
fi

new_window "htop"
run_cmd "htop"

select_window 1
