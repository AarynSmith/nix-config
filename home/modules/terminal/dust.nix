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
  config = lib.mkIf cfg.enableDust {
    home.packages = [ pkgs.dust ];

    programs.zsh.shellAliases = {
      du = "dust";
    };
  };
  # xdg.configFile."bat/syntaxes".source = null;
}
