{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.desktop;
in
{
  config = lib.mkMerge [
    (lib.mkIf cfg.enableHammerspoon {
      home.file.".hammerspoon" = {
        source = ../../../configurations/hammerspoon;
        recursive = true;
      };
    })
  ];
}
