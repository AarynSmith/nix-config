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
  config = lib.mkIf cfg.enableVLC {
    homebrew = {
      enable = true;
      casks = [
        "vlc"
      ];
    };
  };
}
