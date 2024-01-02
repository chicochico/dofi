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
      kubernetes-helm
      kubeseal
      kustomize
      pgcli
      teleport
      terraform
      terragrunt
      yq-go
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
