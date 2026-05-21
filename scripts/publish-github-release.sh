#!/usr/bin/env bash
# Publish a Chrome Web Store–style ZIP to GitHub Releases (downloadable Assets).
# Prerequisites: manifest version bumped, changes committed and pushed to origin/main.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
VER="$(grep '"version"' manifest.json | head -1 | sed 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/')"
TAG="v${VER}"
ZIP_REL="release/BetterJapaneseCaptions-${VER}.zip"

bash "$ROOT/scripts/package-extension.sh"

if [[ ! -f "$ZIP_REL" ]]; then
  echo "error: missing $ZIP_REL"
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "error: install GitHub CLI (gh) and run: gh auth login"
  exit 1
fi

if gh release view "$TAG" >/dev/null 2>&1; then
  echo "error: GitHub に ${TAG} の Release が既にあります。"
  echo "  Releases はバージョン（タグ）ごとに1枠です。古い ZIP を並べて残したい場合は、この Release を削除して作り直さず manifest の version を上げて公開してください。"
  echo "  一覧: gh release list -L 20"
  exit 1
fi
gh release create "$TAG" "$ZIP_REL" \
  --title "Better Japanese Captions ${VER}" \
  --notes "$(cat <<EOF
**Chrome extension package (Web Store submission build)**

- Download **\`BetterJapaneseCaptions-${VER}.zip\`** from Assets below.
- Install locally: unzip is not needed; Chrome \`chrome://extensions\` → Load unpacked uses the repo folder instead.

Source: [\`manifest.json\`@\`${TAG}\`](https://github.com/Blackphi6/better-japanese-captions/blob/${TAG}/manifest.json).
EOF
)"

echo "Done. Open: https://github.com/Blackphi6/better-japanese-captions/releases/tag/${TAG}"
