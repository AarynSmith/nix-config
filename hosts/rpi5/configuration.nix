# hosts/rpi5/configuration.nix
{ config, pkgs, ... }:
{
  networking.hostName = "rpi5";

  # standard NixOS boilerplate…
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "America/Chicago";

  users.users."aaryn" = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
