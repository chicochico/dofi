# Dofi: Configuration files

My system and home configurations files are tracked in this repository.

## Bootstrapping
1. `sh <(curl -L https://nixos.org/nix/install)` - [install nix](https://nixos.org/download.html) 
2. `git clone git@github.com:chicochico/dofi.git $HOME/dofi`
3. `cd dofi`
4. `nix-shell shell.nix` - activate shell
5. `home-manager switch --flake .#mbp14-personal` - setup home
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
home-manager switch --flake .#mbp14-personal
```

When there are changes a new generation is created, you ca rollback/forward to any of them. Use `home-manager generations` to view them.

#### Upgrading packages
To update the flake lock run:
```nix flake update```

Then run the switch command as usual.

#### Rollbacks
To view the generations run:
```
home-manager generations
2025-03-31 18:41 : id 707 -> /nix/store/bmqmwfyv4yvwlzih3d3arwrds1h2shxp-home-manager-generation
2025-03-31 17:40 : id 706 -> /nix/store/m2y6xqi6w78mg0a7n3z8wc4vzc0z9vhg-home-manager-generation
2025-03-31 17:34 : id 705 -> /nix/store/p7jkkpdzcbg2l12hfzfg48947c2g38rw-home-manager-generation
2025-03-31 17:30 : id 704 -> /nix/store/il3h84k5gnnxmmcjhygvpr8w4q40w6jn-home-manager-generation
...
```

Choose one of the generations and copy the path, for example for the gen `706`, run the activation script inside it's path:
```
/nix/store/m2y6xqi6w78mg0a7n3z8wc4vzc0z9vhg-home-manager-generation/activate
```



## Links
- [home-manager](https://github.com/nix-community/home-manager)
