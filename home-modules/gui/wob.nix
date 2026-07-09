{ inputs, ...}: {
  flake.modules.homeManager.wob = { ... }:
  let
    theme = inputs.themes.custom (import ./_faehazel/base16.nix);
  in
  {
    # https://mynixos.com/home-manager/options/services.wob
    # https://www.mankier.com/5/wob.ini
    services.wob = {
      enable = true;
      settings = {
        "" = {
          anchor = "right";
          orientation = "vertical";
          width = 50;
          height = 500;
          border_size = 4;
          border_color = theme.base0E;
          bar_color = theme.base0A;
          background_color = theme.base00;
        };
      };
    };
  };
}
