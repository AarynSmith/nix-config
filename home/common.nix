{ pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "nano";
    LANG = "en_US.UTF-8";
  };

  home.packages = with pkgs; [
    # shared user-level tools
    ripgrep
    fd
  ];
}
