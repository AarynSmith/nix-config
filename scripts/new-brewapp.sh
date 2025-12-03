#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <OptionName> <brew-cask-name>"
  echo "Example: $0 Ghostty ghostty"
  exit 1
fi

OPTION_NAME="$1"     # e.g. Ghostty (used in cfg.enableGhostty)
CASK_NAME="$2"       # e.g. ghostty (Homebrew cask name)

# Simple filename from cask name
FILE_NAME="${CASK_NAME}.nix"

BREWAPPS_DIR="modules/brewapps"

if [ ! -d "$BREWAPPS_DIR" ]; then
  echo "Error: $BREWAPPS_DIR does not exist. Run this from your repo root."
  exit 1
fi

TARGET_FILE="${BREWAPPS_DIR}/${FILE_NAME}"

if [ -e "$TARGET_FILE" ]; then
  echo "Error: ${TARGET_FILE} already exists"
  exit 1
fi

cat > "$TARGET_FILE" <<EOF
{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.brewapps;
in
{
  config = lib.mkIf cfg.enable${OPTION_NAME} {
    homebrew = {
      enable = true;
      casks = [
        "${CASK_NAME}"
      ];
    };
  };
}
EOF

echo "Created ${TARGET_FILE}"

echo
echo "Add the following to modules/brewapps/default.nix:"
echo
cat <<EOF
  # In options.brewapps:
    enable${OPTION_NAME} = lib.mkEnableOption "enable ${CASK_NAME} configuration" // {
      default = true;
    };

  # In imports list:
    ./$(basename "$TARGET_FILE")
EOF
