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
  config = lib.mkIf cfg.enableAtuin {
    programs.atuin = {
      enable = true;
      enableZshIntegration = true;
      flags = [
        "--disable-up-arrow"
      ];
    };

    # programs.zsh.shellAliases = {
    #   du = "dust";
    # };
  };
}
