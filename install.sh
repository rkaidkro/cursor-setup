#!/usr/bin/env bash
set -euo pipefail

# Cursor Setup Installer
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/rkaidkro/cursor-setup/main/install.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/rkaidkro/cursor-setup/main/install.sh | bash -s -- --global

REPO_URL="https://github.com/rkaidkro/cursor-setup"
RAW_BASE="https://raw.githubusercontent.com/rkaidkro/cursor-setup/main"

# Parse args
GLOBAL_INSTALL=false
for arg in "$@"; do
  case $arg in
    --global) GLOBAL_INSTALL=true ;;
  esac
done

# Determine target directory
if [ "$GLOBAL_INSTALL" = true ]; then
  TARGET_DIR="$HOME/.cursor"
  echo "📁 Installing globally to $TARGET_DIR"
else
  TARGET_DIR="$(pwd)/.cursor"
  echo "📁 Installing to project: $TARGET_DIR"
fi

# Create directories
mkdir -p "$TARGET_DIR/rules"
mkdir -p "$TARGET_DIR/commands"

# Download rules
echo "📥 Downloading rules..."
RULES=(
  "api-key-errors.mdc"
  "your-role-atlas.mdc"
  "your-role_sous.mdc.disable"
  "your-role-HA.mdc.disable"
  "your-role-parra.mdc.disable"
  "your-role-work-swe-aid.mdc.disable"
  "your-role-legal-aid.mdc.disable"
)

for rule in "${RULES[@]}"; do
  echo "  → $rule"
  curl -fsSL "$RAW_BASE/.cursor/rules/$rule" -o "$TARGET_DIR/rules/$rule"
done

# Download commands
echo "📥 Downloading commands..."
COMMANDS=(
  "commit.md"
)

for cmd in "${COMMANDS[@]}"; do
  echo "  → $cmd"
  curl -fsSL "$RAW_BASE/.cursor/commands/$cmd" -o "$TARGET_DIR/commands/$cmd"
done

echo ""
echo "✅ Cursor setup installed successfully!"
echo ""
echo "Enabled rules:"
ls -1 "$TARGET_DIR/rules/" | grep -v '\.disable$' | sed 's/^/  ✓ /'
echo ""
echo "Disabled rules (rename to enable):"
ls -1 "$TARGET_DIR/rules/" | grep '\.disable$' | sed 's/^/  ○ /'
echo ""
echo "Commands:"
ls -1 "$TARGET_DIR/commands/" | sed 's/^/  ⚡ /'
echo ""
echo "To customize: edit files in $TARGET_DIR/"

