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
  config = lib.mkIf cfg.enableTailscale {
    homebrew = {
      enable = true;
      casks = [
        "tailscale-app"
      ];
    };
  };
}
