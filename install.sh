#!/bin/bash
# Installs skills and global instructions via symlinks into ~/.config/opencode.
# Idempotent: correct symlinks are skipped, real files are backed up to .bak.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OPENCODE_DIR="$HOME/.config/opencode"

create_symlink() {
  local src="$1"
  local dest="$2"

  if [ -L "$dest" ] && [ "$(readlink -m "$dest")" == "$(readlink -m "$src")" ]; then
    echo "Symlink already correct: $dest"
    return
  fi

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "Backing up existing file: $dest"
    mv "$dest" "$dest.bak"
  fi

  echo "Linking $src -> $dest"
  mkdir -p "$(dirname "$dest")" && ln -sfn "$src" "$dest"
}

# Global instructions file.
create_symlink "$SCRIPT_DIR/AGENTS.global.md" "$OPENCODE_DIR/AGENTS.md"

# Each skill folder links wholesale so SKILL.md stays discovered.
for skill_dir in "$SCRIPT_DIR"/skills/*/; do
  skill="$(basename "$skill_dir")"
  create_symlink "$skill_dir" "$OPENCODE_DIR/skills/$skill"
done

# Register instruction files in opencode.json, preserving existing keys.
python3 - "$SCRIPT_DIR" "$OPENCODE_DIR/opencode.json" <<'EOF'
import json
import sys
from pathlib import Path

repo, config_path = Path(sys.argv[1]), Path(sys.argv[2])
entries = sorted(str(p) for p in (repo / "instructions").glob("*.md"))

config = json.loads(config_path.read_text()) if config_path.exists() else {}
current = config.get("instructions", [])
config["instructions"] = sorted(set(current) | set(entries))
config.setdefault("$schema", "https://opencode.ai/config.json")
config_path.write_text(json.dumps(config, indent=2) + "\n")
print(f"Instructions registered in {config_path}")
EOF
