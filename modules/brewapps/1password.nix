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
  config = lib.mkIf cfg.enable1Password {
    homebrew = {
      enable = true;
      casks = [
        "1password"
        "1password-cli"
      ];
    };
  };
}
