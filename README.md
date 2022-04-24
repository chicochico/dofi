# Dotfiles my configuration files

My current machine configurations are tracked in this repository.

## Deployment
Install zsh and oh-my-zsh first to prevent `.zshrc` from being overriden. Then run:
```
git clone --bare https://github.com/chicochico/dotfiles.git $HOME/.cfg \
&& git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
```
