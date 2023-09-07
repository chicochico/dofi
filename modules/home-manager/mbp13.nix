{ config, pkgs, inputs, ... }:

let
  common = import ./common.nix { inherit config pkgs inputs; };
in
{
  inherit (common) programs;
  home = {
    inherit (common.home) username homeDirectory stateVersion;
    packages = with pkgs; common.home.packages ++ [
      argocd
      inetutils
      kubectl
      kubeseal
      kustomize
      teleport
      terragrunt
      yq
    ];

    file = common.home.file // {
      gitconfig = { source = ./dotfiles/gitconfig-tr; target = ".gitconfig"; };
      airflow_open = {
        source = ./bin/airflow-open.sh;
        target = "bin/airflow-open";
      };
    };
  };
}
