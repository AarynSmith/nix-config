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
    enableKeepassXC = lib.mkEnableOption "enable keepassxc configuration" // {
      default = false;
    };
    enableChrome = lib.mkEnableOption "enable google-chrome configuration" // {
      default = true;
    };
    enableChatGPT = lib.mkEnableOption "enable chatgpt configuration" // {
      default = false;
    };
    enableBackblaze = lib.mkEnableOption "enable backblaze configuration" // {
      default = false;
    };
    enableFusion360 = lib.mkEnableOption "enable autodesk-fusion configuration" // {
      default = false;
    };
    enableObsidan = lib.mkEnableOption "enable obsidian configuration" // {
      default = true;
    };
    enableSyncthing = lib.mkEnableOption "enable syncthing-app configuration" // {
      default = true;
    };
    enableMos = lib.mkEnableOption "enable mos configuration" // {
      default = true;
    };
    enableRectangle = lib.mkEnableOption "enable Rectangle configuration" // {
      default = true;
    };
    enableAffinity = lib.mkEnableOption "enable affinity configuration" // {
      default = true;
    };
    enableFastmail = lib.mkEnableOption "enable fastmail configuration" // {
      default = false;
    };
    enableRpi-Imager = lib.mkEnableOption "enable raspberry-pi-imager configuration" // {
      default = true;
    };
  };
  imports = [
    ./raspberry-pi-imager.nix
    ./fastmail.nix
    ./affinity.nix
    ./Rectangle.nix
    ./mos.nix
    ./keepassxc.nix
    ./syncthing-app.nix
    ./obsidian.nix
    ./autodesk-fusion.nix
    ./backblaze.nix
    ./chatgpt.nix
    ./google-chrome.nix
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
