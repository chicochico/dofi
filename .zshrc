# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="chico3"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git docker)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

# aliases
#alias source-edit="nvim ~/.zshrc"
alias vim="nvim"
alias c="clear"

case `uname` in
  Linux) # linux specifics settings
    eval $(dircolors ~/.dircolors)
    # for windows clipboard
    export DISPLAY=:0
  ;;
esac

# Virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=$HOME/.pyenv/shims/python
export WORKON_HOME=$HOME/.venvs
export PROJECT_HOME=$HOME/dev

# Pyenv Virtualenv
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "pyenv virtualenvwrapper"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# added by travis gem
[ -f /Users/chico/.travis/travis.sh ] && source /Users/chico/.travis/travis.sh
