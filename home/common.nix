{ pkgs, ... }:
{
  home.sessionVariables = {
    EDITOR = "nano";
    LANG = "en_US.UTF-8";
  };

  imports = [ ./modules/terminal ];

  terminal = {
    enableStarship = true;
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
    };
    prezto = {
      enable = true;
      editor.dotExpansion = true;
      git.submoduleIgnore = "dirty";
    };
    shellAliases = {
      # dc = "docker-compose";
      # dcu = "docker-compose up";
      # dcd = "docker-compose down"/Users/aaryn/.config/nix-config/home/darwin/aaryn.nix
      xyzzy = "echo 'Nothing happens'";
      ssh-switch = "ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedAlgorithms=+ssh-rsa ";
    };
  };

  home.packages = with pkgs; [
    # shared user-level tools
    ripgrep
    fd
    wget
    curl
    fzf
  ];
}
