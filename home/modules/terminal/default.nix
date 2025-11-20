{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./bat.nix
    ./btop.nix
  ];
}
