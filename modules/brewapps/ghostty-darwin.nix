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
  config = lib.mkIf cfg.enableGhostty {
    # Not currently available for darwin
    # programs.ghostty = {
    #   # enable = true;
    #   enableZshIntegration = true;
    #   installBatSyntax = true;
    #   settings = {
    #     theme = "Catppuccin Mocha";
    #     background-blur-radius = 20;
    #     background-opacity = .85;
    #     unfocused-split-opacity = .75;
    #     clipboard-paste-protection = false;
    #     copy-on-select = true;
    #   };
    homebrew = {
      enable = true;
      casks = [
        "ghostty@tip"
      ];
    };

    # xdg.configFile."ghostty/config".text = ''
    #   theme = "Catppuccin Mocha"
    #   background-blur-radius = 20
    #   background-opacity = .85
    #   unfocused-split-opacity = .75
    #   clipboard-paste-protection = false
    #   copy-on-select = true
    # '';

  };

}
