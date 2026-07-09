{ config, ... }: {
  flake.modules.nixos.main = { ... }:
  {
    imports = with config.flake.modules.nixos; [
      oomd
    ];
  };
}
