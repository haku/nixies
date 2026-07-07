{ inputs, config, lib, pkgs, flake-parts-lib, ... }:
{
  # FIXME there must be a better way to do this, but i do not know what it is atm.
  imports = map (f: flake-parts-lib.importApply f {inherit inputs config lib pkgs;})
    (map (p: ./. + "/${p}") (builtins.attrNames (lib.filterAttrs (n: _: n != "default.nix") (builtins.readDir ./.))));
}
