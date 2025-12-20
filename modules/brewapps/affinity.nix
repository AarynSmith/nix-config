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
  config = lib.mkIf cfg.enableAffinity {
    homebrew = {
      enable = true;
      casks = [
        "affinity"
      ];
    };
  };
}
