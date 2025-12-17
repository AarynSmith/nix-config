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
  config = lib.mkIf cfg.enableObsidan {
    homebrew = {
      enable = true;
      casks = [
        "obsidian"
      ];
    };
  };
}
