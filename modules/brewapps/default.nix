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
  options.brewapps = {
    enableGhostty = lib.mkEnableOption "enable ghostty configuration" // {
      default = false;
    };
    enableTheUnarchiver = lib.mkEnableOption "enable the-unarachiver configuration" // {
      default = false;
    };
  };
  imports = [
    ./ghostty-darwin.nix
    ./the-unarchiver.nix
  ];
}
