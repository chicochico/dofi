{ config, pkgs, inputs, ... }:

let
  common = import ./common.nix { inherit config pkgs inputs; };
in
{
  inherit (common) programs;
  home = {
    inherit (common.home) username homeDirectory stateVersion file;
    packages = with pkgs; common.home.packages ++ [ 
      kubectl 
      teleport 
      argocd 
    ];
  };
}
