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
  config = lib.mkIf cfg.enableFastmail {
    homebrew = {
      enable = true;
      casks = [
        "fastmail"
      ];
    };
  };
}
