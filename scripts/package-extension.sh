#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
VER="$(grep '"version"' manifest.json | head -1 | sed 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/')"
OUTDIR="$ROOT/release"
ZIP="$OUTDIR/BetterJapaneseCaptions-${VER}.zip"
mkdir -p "$OUTDIR"
rm -f "$ZIP"
zip -r "$ZIP" manifest.json icons dist -x "*.DS_Store"
echo "Created $ZIP ($(wc -c < "$ZIP" | tr -d ' ') bytes)"
