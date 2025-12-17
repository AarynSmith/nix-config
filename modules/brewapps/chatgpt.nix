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
  config = lib.mkIf cfg.enableChatGPT {
    homebrew = {
      enable = true;
      casks = [
        "chatgpt"
      ];
    };
  };
}
