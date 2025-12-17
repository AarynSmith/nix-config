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
  config = lib.mkIf cfg.enableFusion360 {
    homebrew = {
      enable = true;
      casks = [
        "autodesk-fusion"
      ];
    };
  };
}
