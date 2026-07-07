{ config, pkgs, lib, inputs, ... }:
{
  imports = map (p: ./. + "/${p}") (builtins.attrNames (lib.filterAttrs (n: _: n != "default.nix") (builtins.readDir ./.)));
}
