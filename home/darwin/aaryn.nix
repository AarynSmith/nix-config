{ pkgs, ... }:

{
  home.stateVersion = "24.05";

  home.username = "aaryn";
  home.homeDirectory = "/Users/aaryn";

  home.packages = [
    pkgs.nixfmt-rfc-style
  ];

  programs.zsh.shellAliases = {
    nix-rebuild = "cd ~/.config/nix-config/; sudo darwin-rebuild switch --flake .";
    nix-registry = "sudo wget -O/etc/nix/flake-registry.json https://raw.githubusercontent.com/NixOS/flake-registry/master/flake-registry.json";
    mcd = "test -d \"$1\" || mkdir \"$1\" && cd \"$1\"";
  };

  programs.git.settings = {
    credential.helper = "osxkeychain";
    gpg.ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
  };

  desktop {
    enableAreospace = true;
    enableGhostty = true;
  }

  # xdg.configFile."ghostty/config".text = ''
  #   theme = "Catppuccin Mocha"
  #   background-blur-radius = 20
  #   background-opacity = .85
  #   unfocused-split-opacity = .75
  #   clipboard-paste-protection = false
  #   copy-on-select = true
  # '';

  # Mac-only packages / configs here
}
