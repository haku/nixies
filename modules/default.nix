{ withSystem, moduleWithSystem, inputs, ... }:
{
  flake.nixosModules.default = moduleWithSystem (perSystem@{ config, self', ... }:
  { pkgs, lib, config, ... }:
  {
    imports = map (p: ./. + "/${p}") (builtins.attrNames (lib.filterAttrs (n: _: n != "default.nix") (builtins.readDir ./.)));
  });
}
