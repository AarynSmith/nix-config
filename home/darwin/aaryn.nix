{ pkgs, ... }:

{
  home.username = "aaryn";
  home.homeDirectory = "/Users/aaryn";

  programs.zsh.enable = true;

  programs.git = {
    enable = true;
    userName = "AarynSmith";
    userEmail = "4387096+AarynSmith@users.noreply.github.com";
    #signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAlElxioTwGZpGuxlFOyF/JpaPulFc83B5DCViHML76s"
  };

  # Mac-only packages / configs here
}

