# Dotfiles configuration files

Configurations files are tracked in this repository.

## Deployment
Install zsh and oh-my-zsh first to prevent `.zshrc` from being overriden. Then run:
```
git clone --bare https://github.com/chicochico/dotfiles.git $HOME/.cfg \
&& git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout --force
```
Restart the terminal or `source ~/.zshrc`.
