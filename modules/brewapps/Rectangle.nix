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
  config = lib.mkIf cfg.enableRectangle {
    homebrew = {
      enable = true;
      casks = [
        "Rectangle"
      ];
    };
  };
}
