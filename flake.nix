{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-compat.url = "github:NixOS/flake-compat";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    import-tree.url = "github:denful/import-tree";

    themes.url = "github:RGBCube/ThemeNix";
  };
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } ({ self, ... }: {
    #debug = true;
    imports = [
      #inputs.home-manager.flakeModules.home-manager
      inputs.flake-parts.flakeModules.modules
      (inputs.import-tree [ ./nixos-modules ./home-modules ])
    ];
    flake.nixosModules = self.modules.nixos;
    flake.homeModules = self.modules.homeManager;
    systems = [ "x86_64-linux" ];
  });
}
