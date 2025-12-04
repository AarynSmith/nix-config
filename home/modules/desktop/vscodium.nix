{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.desktop;
in
{
  config = lib.mkIf cfg.enableVsCodium {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      # profiles.default.extensions = with pkgs.vscode-extensions; [
      #   dracula-theme.theme-dracula
      #   vscodevim.vim
      #   yzhang.markdown-all-in-one
      # ];
    };
  };
}
