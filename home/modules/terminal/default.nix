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
    enableAtuin = lib.mkEnableOption "enable atuin configuration" // {
      default = true;
    };
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
    enableZoxide = lib.mkEnableOption "enable zoxide configuration" // {
      default = true;
    };
  };
  imports = [
    ./atuin.nix
    ./git.nix
    ./bat.nix
    ./btop.nix
    ./starship.nix
    ./eza.nix
    ./dust.nix
    ./zoxide.nix
  ];
}
