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
  config = lib.mkIf cfg.enableSuperWhisper {
    homebrew = {
      enable = true;
      casks = [
        "superwhisper"
      ];
    };
  };
}
