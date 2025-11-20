{ config, pkgs, ... }:

{
  # Required by nix-darwin
  system.stateVersion = 6; # current default; set once and forget :contentReference[oaicite:4]{index=$

  networking.hostName = "Aaryns-MacBook-Air"; # or your actual hostname

  system.primaryUser = "aaryn";

  # Enable Sudo -> TouchID
  security.pam.services.sudo_local.touchIdAuth = true;

  users.users."aaryn" = {
    home = "/Users/aaryn"; # adjust if your shortname differs
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    # other tools you want
  ];

  # Example macOS defaults via nix-darwin
  system.defaults = {
    dock = {
      autohide = true;
      persistent-apps = [
        { app = "/Applications/Google Chrome.app"; }
        { app = "/Applications/Ghostty.app"; }
        { app = "/Applications/VSCodium.app"; }
        { app = "/System/Applications/Stickies.app"; }
        { app = "/Users/aaryn/Applications/Autodesk Fusion.app"; }
        { app = "/Users/aaryn/Applications/Chrome Apps.localized/ChatGPT.app"; }
        { app = "/Applications/OrcaSlicer.app"; }
        { app = "/Users/aaryn/Applications/Chrome Apps.localized/fluidd 1.app"; }
      ];
    };
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
  #   # taps = [ "homebrew/cask" ];
  #   casks = [ "karabiner-elements" ];
  # };
}
