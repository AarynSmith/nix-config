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
  config = lib.mkIf cfg.enableZoxide {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
