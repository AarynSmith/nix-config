{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.terminal;
in
{
  options.terminal = {
    enableGit = lib.mkEnableOption "enable git configuration" // {
      default = true;
    };
    enableBat = lib.mkEnableOption "enable bat configuration" // {
      default = true;
    };
    enableBtop = lib.mkEnableOption "enable btop configuration" // {
      default = true;
    };
    enableStarship = lib.mkEnableOption "enable starship configuration" // {
      default = false;
    };
    enableEza = lib.mkEnableOption "enable eza configuration" // {
      default = true;
    };
    enableDust = lib.mkEnableOption "enable dust configuration" // {
      default = true;
    };
  };
  imports = [
    ./git.nix
    ./bat.nix
    ./btop.nix
    ./starship.nix
    ./eza.nix
    ./dust.nix
  ];
}
