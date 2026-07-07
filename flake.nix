{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-compat.url = "github:NixOS/flake-compat";
    flake-parts.url = "github:hercules-ci/flake-parts";

    themes.url = "github:RGBCube/ThemeNix";
  };
  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } ({ self, withSystem, moduleWithSystem, ... }: {
      #debug = true;
      imports = [
        inputs.home-manager.flakeModules.home-manager
        ./nixos-modules
        ./home-modules
      ];
      systems = [ "x86_64-linux" ];
    });
}
