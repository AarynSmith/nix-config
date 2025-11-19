{ config, pkgs, ... }:

{
  # Required by nix-darwin
  system.stateVersion = 6;  # current default; set once and forget :contentReference[oaicite:4]{index=$

  networking.hostName = "Aaryns-MacBook-Air";  # or your actual hostname

  services.nix-daemon.enable = true;

  users.users."aaryn" = {
    home = "/Users/aaryn";  # adjust if your shortname differs
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  # Example macOS defaults via nix-darwin
  system.defaults = {
    dock.autohide = true;
    finder = {
      AppleShowAllExtensions = true;
    };
  };

  # Homebrew (optional, if you want to keep using it declaratively later)
  # homebrew = {
  #   enable = true;
  #   onActivation = {
  #     autoUpdate = true;
  #     cleanup = "none";  # don't auto-remove non-declarative brew stuff
  #   };
  #   taps = [ "homebrew/cask" ];
  #   casks = [ "iterm2" "visual-studio-code" ];
  # };
}
