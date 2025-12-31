{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.brewapps;
in
{
  config = lib.mkIf cfg.enableRpi-Imager {
    homebrew = {
      enable = true;
      casks = [
        "raspberry-pi-imager"
      ];
    };
  };
}
