{ config, pkgs, ... }:

{
  # Required by nix-darwin
  system.stateVersion = 6; # current default; set once and forget :contentReference[oaicite:4]{index=$

  networking.hostName = "Aaryns-MacBook-Pro"; # or your actual hostname

  system.primaryUser = "aaryn";

  # Enable Sudo -> TouchID
  security.pam.services.sudo_local.touchIdAuth = true;

  users.users."aaryn" = {
    home = "/Users/aaryn"; # adjust if your shortname differs
    shell = pkgs.zsh;
  };

  desktop.enableVsCodium = true;
  programs.zsh.enable = true;

  imports = [ ../../modules/brewapps ];
  brewapps.enableChatGPT = true;
  brewapps.enableBackblaze = true;
  brewapps.enableFusion360 = true;
  environment.systemPackages = with pkgs; [
    # other tools you want
  ];

  # Example macOS defaults via nix-darwin
  system.defaults = {
    dock = {
      autohide = true;
      largesize = 89;
      magnification = true;
      minimize-to-application = false;
      mineffect = "scale";
      mru-spaces = false;
      orientation = "bottom";
      persistent-apps = [
        { app = "/Applications/Google Chrome.app"; }
        { app = "/Applications/Ghostty.app"; }
        { app = "/Applications/Nix Apps/VSCodium.app"; }
        { app = "/Applications/Obsidian.app"; }
        { app = "/System/Applications/Stickies.app"; }
        { app = "/Users/aaryn/Applications/Autodesk Fusion.app"; }
        { app = "/Applications/ChatGPT.app"; }
        { app = "/Applications/OrcaSlicer.app"; }
        { app = "/Users/aaryn/Applications/Chrome Apps.localized/fluidd.app"; }
      ];
      persistent-others = [
        { folder = "/Users/aaryn/Downloads"; }
      ];
      show-process-indicators = true;
      show-recents = false;
      tilesize = 32;
      wvous-br-corner = 1;
      wvous-tr-corner = 12;
    };
    WindowManager = {
      GloballyEnabled = false;
    };
    finder = {
      AppleShowAllExtensions = true;
    };
  };
  # Homebrew (optional, if you want to keep using it declaratively later)
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "none"; # don't auto-remove non-declarative brew stuff
    };
    taps = [ ];
    casks = [ ];
  };
}
