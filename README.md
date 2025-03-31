# Dofi: Configuration files

My system and home configurations files are tracked in this repository.

## Bootstrapping
1. Install [nix](https://nixos.org/download.html):
```
sh <(curl -L https://nixos.org/nix/install) 
```

2. Clone this repo:
```
git clone git@github.com:chicochico/dofi.git $HOME/dofi && cd $HOME/dofi
```

3. Activate nix shell:
```
nix-shell shell.nix
```

4. Switch (applies the configurations and install the dependencies):
```
home-manager switch --flake .#mbp14-personal
```

5. Set macos preferences (optional):
```
sh config-macos.sh
```

6. Install [homebrew](https://brew.sh/) (optional):
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## System
To update **system** configurations, modify `config-macos.sh` and apply with:
```
sh config-macos.sh
 ```

#### Finding current values and possible settings
On macos use the command `defaults` to read or write configurations, for example to get the current trackpad speed:
```
$ defaults read NSGlobalDomain com.apple.trackpad.scaling
3
```

To write a new value:
```
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2.0
```

Use `find` to view other possible settings, for example to see dock related settings:
```
$ defaults find dock
Found 26 keys in domain 'com.apple.dock': {
    "appswitcher-all-displays" = 1;
    autohide = 1;
    "autohide-delay" = 0;
```

With `read` is possible to get all keys of a domain, ex:
```
$ defaults read com.apple.dock
```


## Home
To update **home** configurations rebuild with:
```
home-manager switch --flake .#<home-config-name>
```

example:
```
home-manager switch --flake .#mbp14-personal
```

#### Rollbacks
When there are changes a new generation is created, you can rollback/forward to any of them. To view the generations run:
```
$ home-manager generations
2025-03-31 18:41 : id 707 -> /nix/store/bmqmwfyv4yvwlzih3d3arwrds1h2shxp-home-manager-generation
2025-03-31 17:40 : id 706 -> /nix/store/m2y6xqi6w78mg0a7n3z8wc4vzc0z9vhg-home-manager-generation
2025-03-31 17:34 : id 705 -> /nix/store/p7jkkpdzcbg2l12hfzfg48947c2g38rw-home-manager-generation
2025-03-31 17:30 : id 704 -> /nix/store/il3h84k5gnnxmmcjhygvpr8w4q40w6jn-home-manager-generation
...
```

Choose one of the generations and copy the path, for example for the gen `706`, run the activation script inside it's path:
```
$ /nix/store/m2y6xqi6w78mg0a7n3z8wc4vzc0z9vhg-home-manager-generation/activate
```


#### Upgrading packages
To update the flake lock run:
```
$ nix flake update
```

Then run the switch command as usual.



## Links
- [home-manager](https://github.com/nix-community/home-manager)
