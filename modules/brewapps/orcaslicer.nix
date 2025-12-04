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
  config = lib.mkIf cfg.enableOrcaslicer {
    homebrew = {
      enable = true;
      casks = [
        "orcaslicer"
      ];
    };
  };
}
