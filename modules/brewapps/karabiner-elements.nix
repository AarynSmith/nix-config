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
  config = lib.mkIf cfg.enableKarabiner {
    homebrew = {
      enable = true;
      casks = [
        "karabiner-elements"
      ];
    };
  };
}
