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
  config = lib.mkIf cfg.enableSyncthing {
    homebrew = {
      enable = true;
      casks = [
        "syncthing-app"
      ];
    };
  };
}
