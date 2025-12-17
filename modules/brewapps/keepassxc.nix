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
  config = lib.mkIf cfg.enableKeepassXC {
    homebrew = {
      enable = true;
      casks = [
        "keepassxc"
      ];
    };
  };
}
