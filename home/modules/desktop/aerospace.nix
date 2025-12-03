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
      launchd.enable = false;

      # TOML-ish config via userSettings
      userSettings = {
        after-startup-command = [ ];
        start-at-login = false;
        enable-normalization-flatten-containers = true;
        enable-normalization-opposite-orientation-for-nested-containers = true;
        accordion-padding = 30;
        default-root-container-layout = "tiles";
        default-root-container-orientation = "auto";
        on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
        automatically-unhide-macos-hidden-apps = false;
        key-mapping = {
          preset = "qwerty";
        };

        gaps = {
          inner = {
            horizontal = 8;
            vertical = 8;
          };
          outer = {
            left = 0;
            right = 0;
            top = 0;
            bottom = 0;
          };
        };

        "mode.main.binding" = {
          "alt-slash" = "layout tiles horizontal veritcal";
          "alt-comma" = "layout accordion horizontal vertical";

          "alt-h" = "focus left";
          "alt-j" = "focus down";
          "alt-k" = "focus up";
          "alt-l" = "focus right";

          "alt-shift-h" = "move left";
          "alt-shift-j" = "move down";
          "alt-shift-k" = "move up";
          "alt-shift-l" = "move right";
        };
      };
    };
  };
}
