# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_DISABLE_COMPFIX=true

# Theme
ZSH_THEME="chico3"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git docker colorize colored-man-pages)

# User configuration
source $ZSH/oh-my-zsh.sh

# aliases
#alias source-edit="nvim ~/.zshrc"
alias vim="nvim"
alias vimr="vimr --cur-env"
alias c="clear"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Print blank line after prompt is rendered
precmd() { print "" }

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
