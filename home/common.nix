{ pkgs, ... }:
{
  home.sessionVariables = {
    EDITOR = "nano";
    LANG = "en_US.UTF-8";
  };

  imports = [
    ./modules/terminal
  ];

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
      # dcd = "docker-compose down";

      cat = "bat";

      top = "btop";
      htop = "btop";

      xyzzy = "echo 'Nothing happens'";
    };
  };

  home.packages = with pkgs; [
    # shared user-level tools
    ripgrep
    fd
  ];
}
