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

    base16-shell = {
      url = "github:chriskempson/base16-shell/master";
      flake = false;
    };

  };
  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }:
    {
      darwinConfigurations = {
        mbp14 = darwin.lib.darwinSystem {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          modules = [
            ./modules/darwin
          ];
        };
      };

      homeConfigurations = {
        mbp14 = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          modules = [
            ./modules/home-manager/mbp14.nix
          ];
          extraSpecialArgs = {
            inherit inputs;
          };
        };
        mbp13 = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          modules = [
            ./modules/home-manager/mbp13.nix
          ];
          extraSpecialArgs = {
            inherit inputs;
          };
        };
      };
    };
}
