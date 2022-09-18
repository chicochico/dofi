# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_DISABLE_COMPFIX=true

# gpg
export GPG_TTY=$TTY

# Theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  docker
  aws
  colored-man-pages
)

# User configuration
source $ZSH/oh-my-zsh.sh

# helper funcs
function load_env() {
  export $(cat $1 | xargs)
}

# aliases
alias conf-vim="nvim ~/.config/nvim/init.vim"
alias conf-zsh="nvim ~/.zshrc"
alias conf-tmux="nvim ~/.tmux.conf"
alias conf-alacritty="nvim ~/.alacritty.yml"
alias conf="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias vim="nvim"
alias v="nvim"
alias vimr="vimr --cur-env"
alias c="clear"
alias ykswap="gpg-connect-agent 'scd serialno' 'learn --force' /bye"
alias yk="ykman"
alias d="docker"
alias k="kubectl"
alias lenv=load_env
alias g=gpg

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
