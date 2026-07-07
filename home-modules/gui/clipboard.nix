{ pkgs, lib, config, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
  ];

  services.clipman = {
    enable = true;
    extraArgs = [ "--max-items" "101" ];
  };
}
