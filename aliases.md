# Aliases

## Vim & Tmux

| Alias | Command | Description |
| ----- | ------- | ----------- |
| `v` | `nvim` | Open Neovim |
| `vim` | `nvim` | Open Neovim (overrides system vim) |
| `nvim` | `nvm use 24 && nvim` | Switch to Node 24 then open Neovim |
| `tm` | `~/dotfiles/scripts/tmux_session_manager.sh` | Launch the tmux session manager script |
| `e` | `tmuxifier load-window editor` | Load the tmuxifier editor window layout |

## WordPress

| Alias / Function | Description |
|------------------|-------------|
| `db1` | Enable `WP_DEBUG` and `WP_DEBUG_DISPLAY` via WP-CLI |
| `db0` | Disable `WP_DEBUG` and `WP_DEBUG_DISPLAY` via WP-CLI |
| `g` / `th` | `cd` to the active theme directory (tries `gs-theme` first, falls back to the DB-registered theme) |
| `wb` | `cd` to the site web root (`/web`) |
| `lg` | `cd` to the site log directory |
| `a` | `cd` to the `accommodation` plugin directory |
| `s` | `cd` to the `supercontrol` plugin directory |
| `sat` | Toggle `Satisfy Any` in `.htaccess` — prepends it if absent, removes it if present |

## General

| Alias | Description |
| ----- | ----------- |
| `pub` | Print the public SSH key (`~/.ssh/id_ed25519.pub`) |
| `c` | `batcat` — syntax-highlighted `cat` replacement |
| `aliases` | Print this aliases reference file |
