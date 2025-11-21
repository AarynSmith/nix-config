{ pkgs, ... }:

{
  home.stateVersion = "24.05";

  home.username = "aaryn";
  home.homeDirectory = "/Users/aaryn";

  home.packages = [
    pkgs.nixfmt-rfc-style
  ];

  programs.zsh.shellAliases = {
    nix-rebuild = "cd ~/.config/nix-config/; sudo nix run nix-darwin -- switch --flake .";
    mcd = "test -d \"$1\" || mkdir \"$1\" && cd \"$1\"";
  };

  programs.git.settings = {
    credential.helper = "osxkeychain";
    gpg.ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
  };

  xdg.configFile."ghostty/config".text = ''
    theme = "Catppuccin Mocha"
    background-blur-radius = 20
    background-opacity = .85
    unfocused-split-opacity = .75
    clipboard-paste-protection = false
    copy-on-select = true
  '';

  # Mac-only packages / configs here
}
