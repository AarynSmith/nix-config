{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.llmapps;
in
{
  config = lib.mkIf cfg.enableLMStudio {
    homebrew = {
      enable = true;
      casks = [
        "lm-studio"
      ];
    };
  };
}
