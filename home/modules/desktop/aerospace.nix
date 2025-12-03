{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.desktop;
in
{
  config = lib.mkIf cfg.enableAerospace {
    programs.aerospace = {
      enable = true;

      # start at login via launchd (Home Manager-managed)
      launchd.enable = true;

      # TOML-ish config via userSettings
      userSettings = {
        gaps.outer = {
          left = 8;
          right = 8;
          top = 8;
          bottom = 8;
        };

        "mode.main.binding" = {
          "alt-h" = "focus left";
          "alt-j" = "focus down";
          "alt-k" = "focus up";
          "alt-l" = "focus right";
        };
      };
    };
  };
}
