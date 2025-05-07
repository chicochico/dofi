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
      (pkgs.stdenv.mkDerivation {
        pname = "multi-gitter";
        version = "0.57.1";
        src = pkgs.fetchurl {
          url = "https://github.com/lindell/multi-gitter/releases/download/v0.57.1/multi-gitter_0.57.1_Darwin_ARM64.tar.gz";
          sha256 = "7b40579e264d1d28251de329bd031feff0754de76ca7fd936a3774b891e41091";
        };
        installPhase = ''
          tar -xzvf $src
          mkdir -p $out/bin
          cp multi-gitter $out/bin/
        '';
      })
    ];

    file = common.home.file // {
      gitconfig = { source = ./dotfiles/config/git/config-gly; target = ".config/git/config-gly"; };
    };
  };
}
