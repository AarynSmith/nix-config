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

  home.sessionVariables.SSH_AUTH_SOCK = "/Users/aaryn/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";

  xdg.configFile."1Password/ssh/agent.toml".text = ''
    [[ssh-keys]]
    vault = "Private"

    [[ssh-keys]]
    vault = "SSH Keys"
  '';

  desktop.enableAerospace = false;
  desktop.enableGhostty = true;
  desktop.enableHammerspoon = true;
}
