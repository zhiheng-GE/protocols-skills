#!/usr/bin/env bash
set -euo pipefail

# 只将稳定公开 skills 链接到 ~/.claude/skills：
# - skills/engineering
# - skills/productivity
# - skills/misc
# 不安装 personal、in-progress、deprecated。

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

if [ -L "$DEST" ]; then
  resolved="$(readlink -f "$DEST")"
  case "$resolved" in
    "$REPO"|"$REPO"/*)
      echo "error: $DEST is a symlink into this repo ($resolved)." >&2
      echo "Remove it (rm \"$DEST\") and re-run; the script will recreate it as a real dir." >&2
      exit 1
      ;;
  esac
fi

mkdir -p "$DEST"

for bucket in engineering productivity misc; do
  find "$REPO/skills/$bucket" -mindepth 1 -maxdepth 1 -type d -print0 |
  while IFS= read -r -d '' src; do
    [ -f "$src/SKILL.md" ] || continue
    name="$(basename "$src")"
    target="$DEST/$name"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
      rm -rf "$target"
    fi

    ln -sfn "$src" "$target"
    echo "linked $name -> $src"
  done
done
