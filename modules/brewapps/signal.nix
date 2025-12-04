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
  config = lib.mkIf cfg.enableSignal {
    homebrew = {
      enable = true;
      casks = [
        "signal"
      ];
    };
  };
}
