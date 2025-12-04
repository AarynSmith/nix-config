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
  config = lib.mkIf cfg.enableAlfred {
    homebrew = {
      enable = true;
      casks = [
        "alfred"
      ];
    };
  };
}
