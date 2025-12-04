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
  config = lib.mkIf cfg.enableBackblaze {
    homebrew = {
      enable = true;
      casks = [
        "backblaze"
      ];
    };
  };
}
