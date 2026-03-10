#!/usr/bin/env bash
# Install ai4hccl skills to Claude Code (~/.claude/skills/)
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_SKILLS="$HOME/.claude/skills"

mkdir -p "$CLAUDE_SKILLS"

install_skill() {
    local name="$1"
    local src="$2"
    local dest="$CLAUDE_SKILLS/$name"

    if [ ! -f "$src/SKILL.md" ]; then
        echo "[skip] $name: SKILL.md not found (run 'git submodule update --init'?)"
        return
    fi

    if [ -L "$dest" ]; then
        echo "[ok]   $name"
    elif [ -e "$dest" ]; then
        echo "[skip] $name: destination exists and is not a symlink"
    else
        ln -s "$src" "$dest"
        echo "[new]  $name -> $src"
    fi
}

install_skill "vibe-design" "$REPO_DIR/skills/vibe-design"
install_skill "vibe-review" "$REPO_DIR/skills/vibe-review/skills/vibe-review"
install_skill "vibe-pr"     "$REPO_DIR/skills/vibe-pr"

echo ""
echo "Done. Restart Claude Code to activate."
