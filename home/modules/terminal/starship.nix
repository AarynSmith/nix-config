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
  config = lib.mkIf cfg.enableStarship {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        command_timeout = 30000;
        shell = {
          disabled = false;
          fish_indicator = "🐟";
          zsh_indicator = "zsh";
        };
        character = {
          # The name of the module we are configuring is "character"
          success_symbol = "🚀"; # The "symbol" segment is being set to "➜"
          error_symbol = "💥";
        };
        battery = {
          full_symbol = "🔋";
          charging_symbol = "⚡️";
          discharging_symbol = "💀";
          display = [
            {
              threshold = 10;
              style = "bold red";
            }
            {
              threshold = 30;
              style = "bold yellow";
            }
          ];
        };
        git_commit.commit_hash_length = 4;
        gcloud.disabled = true;
        # conda.ignore_base = true;
        bun.format = "[🍔️$version](bold green) ";
        nodejs.detect_files = [
          "package.json"
          ".node-version"
          "!bunfig.toml"
          "!bun.lockb"
        ];
      };
    };
  };
}
