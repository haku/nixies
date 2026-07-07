{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    flake-compat.url = "github:NixOS/flake-compat";
    flake-parts.url = "github:hercules-ci/flake-parts";
    make-shell = {
      url = "github:nicknovitski/make-shell";
      inputs.flake-compat.follows = "flake-compat";
    };
  };
  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } ({ self, withSystem, moduleWithSystem, ... }: {
      #debug = true;
      imports = [
        inputs.make-shell.flakeModules.default
        ./modules
      ];
      systems = [ "x86_64-linux" ];
    });
}
