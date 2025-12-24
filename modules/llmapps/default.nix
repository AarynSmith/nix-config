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
  options.llmapps = {
    enableSuperWhisper = lib.mkEnableOption "enable superwhisper configuration" // {
      default = false;
    };
    enableLMStudio = lib.mkEnableOption "enable lm-studio configuration" // {
      default = true;
    };
  };
  imports = [
    ./lm-studio.nix
    ./superwhisper.nix
  ];
}
