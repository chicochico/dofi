{ config, pkgs, inputs, ... }:

let
  common = import ./common.nix { inherit config pkgs inputs; };
in
{
  inherit (common) programs;
  home = {
    inherit (common.home) username homeDirectory stateVersion;
    packages = with pkgs; common.home.packages ++ [ 
      kubectl
      kustomize
    ];

    file = common.home.file // {
      gitconfig = { source = ./dotfiles/gitconfig; target = ".gitconfig"; };
    };
  };
}
