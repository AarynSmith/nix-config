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
      default = true;
    };
    enableHammerspoon = lib.mkEnableOption "enable Hammerspoon configuration" // {
      default = true;
    };
    enableTheUnarchiver = lib.mkEnableOption "enable the-unarachiver configuration" // {
      default = false;
    };
    enableIce = lib.mkEnableOption "enable jordanbaird-ice configuration" // {
      default = true;
    };
    enableSignal = lib.mkEnableOption "enable signal configuration" // {
      default = true;
    };
    enableAlfred = lib.mkEnableOption "enable alfred configuration" // {
      default = true;
    };
    enableOrcaslicer = lib.mkEnableOption "enable orcaslicer configuration" // {
      default = true;
    };
    enableKarabiner = lib.mkEnableOption "enable karabiner-elements configuration" // {
      default = true;
    };
    enable1Password = lib.mkEnableOption "enable 1Password configuration" // {
      default = true; 
    };
  };
  imports = [
    ./1password.nix
    ./karabiner-elements.nix
    ./orcaslicer.nix
    ./alfred.nix
    ./signal.nix
    ./ghostty-darwin.nix
    ./hammerspoon.nix
    ./the-unarchiver.nix
    ./jordanbaird-ice.nix
  ];
}
