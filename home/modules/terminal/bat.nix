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
  config = lib.mkIf cfg.enableBat {
    programs.bat = {
      enable = true;
      themes = {
        catppuccin_mocha = {
          src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat";
            rev = "6810349b28055dce54076712fc05fc68da4b8ec0";
            sha256 = "sha256-lJapSgRVENTrbmpVyn+UQabC9fpV1G1e+CdlJ090uvg=";
          };
          file = "themes/Catppuccin Mocha.tmTheme";
        };
      };
      config = {
        pager = "less -FR";
        theme = "CatppuccinMocha";
      };
    };
    programs.zsh.shellAliases = {
      cat = "bat";
    };
  };
}
