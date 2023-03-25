# for flakes schema:
# https://nixos.wiki/wiki/Flakes
{
  description = "This is: The Config.";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }:
    let
      user = "fchiang";
      system = "aarch64-darwin";
    in {
      darwinConfigurations.mac = darwin.lib.darwinSystem {
        pkgs = import nixpkgs { system = "${system}"; };
        modules = [
          ./modules/darwin
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${user} = import ./modules/home-manager;
            };
          }
        ];
      };
    };
}
