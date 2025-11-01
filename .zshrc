export ZSH=~/.oh-my-zsh

export EDITOR=nvim

export PATH=~/.composer/vendor/bin:$PATH
export PATH="$PATH:/usr/cli-tool/"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$HOME/.tmux/plugins/tmuxifier/bin:$PATH"
export PATH="$PATH:$HOME/dotfiles/scripts"

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

ZSH_THEME="gentoo"

plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

[[ -f ~/dotfiles/.aliases ]] && source ~/dotfiles/.aliases

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

autoload -U add-zsh-hook

auto_nvm_use() {
  if ! command -v nvm &> /dev/null; then
    return
  fi
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use > /dev/null
  fi
}

add-zsh-hook chpwd auto_nvm_use

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export TMUXIFIER_LAYOUT_PATH="$HOME/dotfiles/layouts"

eval "$(zoxide init zsh)"

export PATH="$PATH:/opt/nvim-linux-x86_64/bin:$HOME/.config/composer/vendor/bin"
