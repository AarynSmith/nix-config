#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <OptionName> <brew-cask-name> [group]"
  echo "Example: $0 Ghostty ghostty"
  echo "Example: $0 Ollama ollama llmapps"
  echo "Group defaults to: brewapps"
  exit 1
fi

OPTION_NAME="$1"     # e.g. Ghostty (used in cfg.enableGhostty)
CASK_NAME="$2"       # e.g. ghostty (Homebrew cask name)
GROUP="${3:-brewapps}" # e.g. brewapps | llmapps | desktopapps

# Simple filename from cask name
FILE_NAME="${CASK_NAME}.nix"

MODULES_DIR="modules/${GROUP}"

if [ ! -d "$MODULES_DIR" ]; then
  echo "Error: $MODULES_DIR does not exist. Run this from your repo root, or create the group folder (e.g. modules/llmapps)."
  exit 1
fi

TARGET_FILE="${MODULES_DIR}/${FILE_NAME}"

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
  cfg = config.${GROUP};
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
echo "Add the following to modules/${GROUP}/default.nix:"
echo
cat <<EOF
  # In options.brewapps:
    enable${OPTION_NAME} = lib.mkEnableOption "enable ${CASK_NAME} configuration" // {
      default = true;
    };

  # In imports list:
    ./$(basename "$TARGET_FILE")
EOF
