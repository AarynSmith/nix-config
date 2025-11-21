{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.terminal;
in
{
  config = lib.mkIf cfg.enableEza {
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      colors = "always";
      extraOptions = [
        "--group-directories-first"
        "--smart-group"
      ];
      git = true;
      icons = "always";
    };

    programs.zsh.shellAliases = {
      ls = "eza -G -a";
      ll = "eza -laah  --color-scale=age --time-style=long-iso";
      l = "eza -a";
      la = "eza -laa";
    };
  };
  # xdg.configFile."bat/syntaxes".source = null;
}
