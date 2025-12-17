{ lib, config, pkgs, ... }:
let
  cfg = config.desktop;
in
{
  config = lib.mkIf cfg.enableVsCodium {
    environment.systemPackages = [ pkgs.vscodium ];
  };
}
