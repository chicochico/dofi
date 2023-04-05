# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Theme
# $NIX_USER_PROFILE_DIR is created by nix-darwin
source $NIX_USER_PROFILE_DIR/home-manager/home-path/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

# ZSH options
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_IGNORE_ALL_DUPS
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

# Command editing
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# gpg
export GPG_TTY=$TTY

# helper funcs
function load_env() {
  export $(cat $1 | xargs)
}

# aliases
alias l="ls -lah --color=auto"
alias conf-vim="nvim ~/.config/nvim/init.lua"
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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi
