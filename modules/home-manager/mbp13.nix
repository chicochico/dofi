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
      go
      inetutils
      jira-cli-go # auth via env var JIRA_API_TOKEN. Check ~/.zprofile
      kubernetes-helm
      kubeseal
      kubeshark
      pgcli
      teleport
      terraform
      terragrunt
    ];

    file = common.home.file // {
      gitconfig = { source = ./dotfiles/config/git/config-tr; target = ".config/git/config-tr"; };
      airflow_open = {
        source = ./bin/airflow-open.sh;
        target = "bin/airflow-open";
      };
    };
  };
}
