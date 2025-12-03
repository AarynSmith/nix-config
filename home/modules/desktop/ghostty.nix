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
  config = lib.mkMerge [
    # Shared config file on all platforms
    (lib.mkIf cfg.enableGhostty {
      xdg.configFile."ghostty/config".text = ''
        theme = "Catppuccin Mocha"
        background-blur-radius = 20
        background-opacity = .85
        unfocused-split-opacity = .75
        clipboard-paste-protection = false
        copy-on-select = true
      '';
    })

    # Linux-only installation via Home Manager
    (lib.mkIf (cfg.enableGhostty && pkgs.stdenv.isLinux) {
      programs.ghostty.enable = true;
    })
  ];
}
