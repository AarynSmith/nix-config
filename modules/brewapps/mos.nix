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
  config = lib.mkIf cfg.enableMos {
    homebrew = {
      enable = true;
      casks = [
        "mos"
      ];
    };
  };
}
