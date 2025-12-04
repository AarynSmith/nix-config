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
  config = lib.mkIf cfg.enableIce {
    # If you want to install Ice here instead of via brewapps:
    # homebrew = {
    #   enable = true;
    #   casks = [ "jordanbaird-ice" ];
    # };

    # Copy plist on each activation
    home.activation.icePreferences = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      src=${../../../configurations/ice/com.jordanbaird.Ice.plist}
      dst="$HOME/Library/Preferences/com.jordanbaird.Ice.plist"

      mkdir -p "$(dirname "$dst")"
      /bin/cp -f "$src" "$dst"

      # Optionally restart Ice so it picks up changes
      /usr/bin/killall Ice 2>/dev/null || true
      /usr/bin/open -a Ice 2>/dev/null || true
    '';

  };
}
