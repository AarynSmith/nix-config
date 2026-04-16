{ lib, config, pkgs, ... }:
let cfg = config.terminal;
in {
  config = lib.mkIf cfg.enableNvm {
    programs.zsh.initContent = ''
      eval "$(fnm env --use-on-cd --shell zsh)"
    '';
    home.packages = [ pkgs.fnm ];
  };
}
