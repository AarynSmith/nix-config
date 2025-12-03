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
  options.desktop = {
    enableAerospace = lib.mkEnableOption "enable aerospace configuration" // {
      default = false;
    };
    enableHammerspoon = lib.mkEnableOption "enable hammerspoon configuration" // {
      default = false;
    };
    enableGhostty = lib.mkEnableOption "Enable Ghostty terminal configuration" // {
      default = false;
    };
    enableIce = lib.mkEnableOption "Enable Ice configuration" // {
      default = true;
    };
  };
  imports = [
    ./aerospace.nix
    ./hammerspoon.nix
    ./ghostty.nix
    ./ice.nix
  ];
}
