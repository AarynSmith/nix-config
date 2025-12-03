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

      userSettings = {
        accordion-padding = 30;
        after-login-command = [ ];
        after-startup-command = [ ];
        automatically-unhide-macos-hidden-apps = false;
        default-root-container-layout = "tiles";
        default-root-container-orientation = "auto";
        enable-normalization-flatten-containers = true;
        enable-normalization-opposite-orientation-for-nested-containers = true;
        on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
        start-at-login = false;

        gaps = {
          inner = {
            horizontal = 8;
            vertical = 8;
          };
          outer = {
            bottom = 0;
            left = 0;
            right = 0;
            top = 0;
          };
        };

        "key-mapping" = {
          preset = "qwerty";
        };

        "mode.main.binding" = {
          "alt-comma" = "layout accordion horizontal vertical";
          "alt-slash" = "layout tiles horizontal vertical";

          "alt-h" = "focus left";
          "alt-j" = "focus down";
          "alt-k" = "focus up";
          "alt-l" = "focus right";

          "alt-shift-h" = "move left";
          "alt-shift-j" = "move down";
          "alt-shift-k" = "move up";
          "alt-shift-l" = "move right";

          "alt-minus" = "resize smart -50";
          "alt-equal" = "resize smart +50";

          "alt-1" = "workspace 1";
          "alt-2" = "workspace 2";
          "alt-3" = "workspace 3";
          "alt-4" = "workspace 4";
          "alt-5" = "workspace 5";
          "alt-6" = "workspace 6";
          "alt-7" = "workspace 7";
          "alt-8" = "workspace 8";
          "alt-9" = "workspace 9";

          "alt-shift-1" = "move-node-to-workspace 1";
          "alt-shift-2" = "move-node-to-workspace 2";
          "alt-shift-3" = "move-node-to-workspace 3";
          "alt-shift-4" = "move-node-to-workspace 4";
          "alt-shift-5" = "move-node-to-workspace 5";
          "alt-shift-6" = "move-node-to-workspace 6";
          "alt-shift-7" = "move-node-to-workspace 7";
          "alt-shift-8" = "move-node-to-workspace 8";
          "alt-shift-9" = "move-node-to-workspace 9";

          "alt-tab" = "workspace-back-and-forth";
          "alt-shift-tab" = "move-workspace-to-monitor --wrap-around next";

          "alt-shift-semicolon" = "mode service";
        };

        "mode.service.binding" = {
          esc = [
            "reload-config"
            "mode main"
          ];
        };
      };
    };
  };
}
