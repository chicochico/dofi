{ config, pkgs, inputs, ... }:

let
  common = import ./common.nix { inherit config pkgs inputs; };
in
{
  inherit (common) programs;
  home = {
    inherit (common.home) homeDirectory stateVersion;
    username = "franciscochiang";
    packages = with pkgs; common.home.packages ++ [
      glab
    ];

    file = common.home.file // {
      gitconfig = { source = ./dotfiles/config/git/config-gly; target = ".config/git/config-gly"; };
    };
  };
}
