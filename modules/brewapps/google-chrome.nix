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
  config = lib.mkIf cfg.enableChrome {
    homebrew = {
      enable = true;
      casks = [
        "google-chrome"
      ];
    };
  };
}
