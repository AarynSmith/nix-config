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
  };
  imports = [
    ./aerospace.nix
  ];
}
