# Dofi: Configuration files

My system and home configurations files are tracked in this repository.

## Bootstrapping
1. `sh <(curl -L https://nixos.org/nix/install)` - [install nix](https://nixos.org/download.html) 
2. `git clone git@github.com:chicochico/dofi.git $HOME/dofi`
3. `cd dofi`
4. `nix-shell shell.nix` - activate shell
5. `home-manager switch --flake .#mbp14` - setup home
7. `sh config-macos.sh` - set some preferences
8. `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` -- install home-brew for installing `--casks`

Restarting the computer is a good idea.

## System
To update **system** configurations, modify `config-macos.sh` and apply with:
```
sh config-macos.sh
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
