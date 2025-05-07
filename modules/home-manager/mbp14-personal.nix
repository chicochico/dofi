{ config, pkgs, inputs, ... }:

let
  common = import ./common.nix { inherit config pkgs inputs; };
in
{
  inherit (common) programs;
  home = {
    inherit (common.home) homeDirectory stateVersion;
    username = "fchiang";
    packages = with pkgs; common.home.packages ++ [
      exercism
      bats
    ];

    file = common.home.file // { };
  };
}
