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
  config = lib.mkIf cfg.enableTheUnarchiver {
    homebrew = {
      enable = true;
      casks = [
        "the-unarchiver"
      ];
    };
  };

}
