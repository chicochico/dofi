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

    base16-shell = {
      url = "github:chriskempson/base16-shell/master";
      flake = false;
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      # Import nixpkgs with the allowUnfree configuration
      pkgs = import nixpkgs {
        config = {
          allowUnfree = true;
        };
        system = "aarch64-darwin";
      };
    in {
      homeConfigurations = {
        mbp14-personal = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./modules/home-manager/mbp14-personal.nix
          ];
          extraSpecialArgs = {
            inherit inputs;
          };
        };

        mbp14-work = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./modules/home-manager/mbp14-work.nix
          ];
          extraSpecialArgs = {
            inherit inputs;
          };
        };

        mbp13 = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
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
