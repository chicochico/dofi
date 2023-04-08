# Dotfiles configuration files

My system and home configurations files are tracked in this repository.

## Bootstrapping
1. [install nix](https://nixos.org/download.html)
2. `git clone git@github.com:chicochico/dotfiles.git $HOME/dotfiles`
3. run `nix-shell shell.nix`
4. to setup os inside the new shell run `darwin-rebuild switch --flake .#mbp14`
5. to setup home `home-manager switch --flake .#mbp14`

Restarting the computer is a good idea.

To update **system** configurations, rebuild with:
```
 darwin-rebuild switch --flake .#hostname
 ```

To update **home** configurations rebuild with:
```
home-manager switch --flake .#username
```

TODO:
- figure out why base16 theme is not applied when starting a new terminal window

## Links
- [home-manager](https://github.com/nix-community/home-manager)
- [nix-darwin](https://github.com/LnL7/nix-darwin)

