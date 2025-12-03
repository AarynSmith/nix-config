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
  config = lib.mkIf cfg.enableIce {
    homebrew = {
      enable = true;
      casks = [
        "jordanbaird-ice"
      ];
    };
  };
}
