#!/bin/bash
# Install the cc-statusline status line into Claude Code.
#
#   1. Check that jq >= 1.6 is available (the status line script needs it)
#   2. Back up any existing statusline.sh that differs from the new one
#   3. Copy statusline.sh into <claude dir>/scripts/ and make it executable
#   4. Merge ONLY the statusLine key into <claude dir>/settings.json
#
# Safe to re-run: identical files are left alone and other settings are preserved.
# Honors CLAUDE_CONFIG_DIR; defaults to ~/.claude.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$SCRIPT_DIR/statusline.sh"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
TARGET_DIR="$CLAUDE_DIR/scripts"
TARGET="$TARGET_DIR/statusline.sh"
SETTINGS="$CLAUDE_DIR/settings.json"
STAMP="$(date +%Y%m%d%H%M%S)"
tmp=""
trap '[ -n "$tmp" ] && rm -f "$tmp"' EXIT

# Keep the portable ~ form for the default location; use an absolute path otherwise
if [ "$CLAUDE_DIR" = "$HOME/.claude" ]; then
  COMMAND="~/.claude/scripts/statusline.sh"
else
  COMMAND="$TARGET"
fi

info() { printf '  %s\n' "$*"; }
fail() { printf 'cc-statusline: %s\n' "$*" >&2; exit 1; }

[ -f "$SRC" ] || fail "cannot find $SRC"

# 1. jq
if ! command -v jq >/dev/null 2>&1; then
  case "$(uname -s)" in
    Darwin) hint="brew install jq" ;;
    Linux) hint="sudo apt install jq  (or your distro's package manager)" ;;
    MINGW*|MSYS*|CYGWIN*) hint="winget install jqlang.jq  OR  scoop install jq" ;;
    *) hint="see https://jqlang.org/download/" ;;
  esac
  fail "jq is required but not installed. Install it with: $hint"
fi
jq_ver="$(jq --version 2>/dev/null | sed -E 's/^jq-([0-9]+)\.([0-9]+).*/\1 \2/')"
read -r jq_major jq_minor <<< "$jq_ver"
if [ -z "${jq_minor:-}" ] || [ "$jq_major" -lt 1 ] || { [ "$jq_major" -eq 1 ] && [ "$jq_minor" -lt 6 ]; }; then
  fail "jq >= 1.6 is required (found: $(jq --version 2>&1))"
fi

echo "Installing cc-statusline"

# 2 + 3. Script
mkdir -p "$TARGET_DIR"
if [ -f "$TARGET" ] && cmp -s "$SRC" "$TARGET"; then
  info "script already up to date: $TARGET"
else
  if [ -f "$TARGET" ]; then
    cp "$TARGET" "$TARGET.bak.$STAMP"
    info "backed up existing script to $TARGET.bak.$STAMP"
  fi
  cp "$SRC" "$TARGET"
  info "installed script to $TARGET"
fi
chmod +x "$TARGET"

# 4. settings.json
if [ -f "$SETTINGS" ]; then
  jq empty "$SETTINGS" 2>/dev/null || fail "$SETTINGS is not valid JSON; fix it and re-run"
  current="$(jq -c '.statusLine // empty' "$SETTINGS")"
else
  current=""
fi
desired="$(jq -cn --arg cmd "$COMMAND" '{type: "command", command: $cmd}')"

if [ "$current" = "$desired" ]; then
  info "settings already point to the status line: $SETTINGS"
else
  if [ -f "$SETTINGS" ]; then
    cp "$SETTINGS" "$SETTINGS.bak.$STAMP"
    info "backed up settings to $SETTINGS.bak.$STAMP"
    base="$SETTINGS"
  else
    base="/dev/null"
  fi
  tmp="$(mktemp "${SETTINGS}.XXXXXX")"
  if [ "$base" = "/dev/null" ]; then
    jq -n --argjson sl "$desired" '{statusLine: $sl}' > "$tmp"
  else
    jq --argjson sl "$desired" '.statusLine = $sl' "$base" > "$tmp"
  fi
  # Write through (not mv) so a symlinked settings.json and its permissions survive
  cat "$tmp" > "$SETTINGS"
  info "set statusLine.command = $COMMAND in $SETTINGS"
fi

echo "Done. Start a new Claude Code session (or send a message) to see the status line."
