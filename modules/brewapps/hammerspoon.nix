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
  config = lib.mkIf cfg.enableHammerspoon {
    homebrew = {
      enable = true;
      casks = [
        "hammerspoon"
      ];
    };
  };

}
