# Dofi: Configuration files

My system and home configurations files are tracked in this repository.

## Bootstrapping
1. [install nix](https://nixos.org/download.html)
2. `git clone git@github.com:chicochico/dofi.git $HOME/dofi`
3. [install nix-darwin](https://github.com/LnL7/nix-darwin#install)
4. run `nix-shell shell.nix`
5. install home-brew for installing `--casks`
6. to setup os inside the new shell run `darwin-rebuild switch --flake .#mbp14`
7. to setup home `home-manager switch --flake .#mbp14`

Restarting the computer is a good idea.

## System
To update **system** configurations, rebuild with:
```
darwin-rebuild switch --flake .#mbp14
 ```

## Home
To update **home** configurations rebuild with:
```
home-manager switch --flake .#<home-config-name>

# example:
home-manager switch --flake .#mbp14
```

## Links
- [home-manager](https://github.com/nix-community/home-manager)
- [nix-darwin](https://github.com/LnL7/nix-darwin)
