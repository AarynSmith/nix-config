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
    enableGhostty = lib.mkEnableOption "Enable Ghostty terminal configuration" // {
      default = false;
    };
  };
  imports = [
    ./aerospace.nix
    ./ghostty.nix
  ];
}
