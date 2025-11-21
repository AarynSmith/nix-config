{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.apps;
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
      # If you don’t have taps/etc yet, you can also set them here.
      casks = [
        "ghostty" # stable
        # "ghostty@tip"  # or tip, if you prefer
      ];
    };
  };

}
