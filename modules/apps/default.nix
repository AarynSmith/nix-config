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
  options.apps = {
    enableGhostty = lib.mkEnableOption "enable ghostty configuration" // {
      default = false;
    };
  };
  imports = [
    ./ghostty-darwin.nix
  ];
}
