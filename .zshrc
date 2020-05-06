# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="chico3"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git docker)

# User configuration
source $ZSH/oh-my-zsh.sh

# aliases
#alias source-edit="nvim ~/.zshrc"
alias vim="nvim"
alias vimr="vimr --cur-env"
alias c="clear"

case `uname` in
  Linux) # linux specifics settings
    eval $(dircolors ~/.dircolors)
    # for windows clipboard
    export DISPLAY=:0
  ;;
esac

# Pyenv Virtualenv
eval "$(pyenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# added by travis gem
[ -f /Users/chico/.travis/travis.sh ] && source /Users/chico/.travis/travis.sh

# thefuck
eval $(thefuck --alias)

# Print blank line after prompt is rendered
precmd() { print "" }
export PATH="/usr/local/opt/helm@2/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
