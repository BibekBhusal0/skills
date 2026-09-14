# Skills

My personal collection of AI skills and global agent instructions. Everything lives here and is installed onto the machine with symlinks, so this repo stays the single source of truth.

## What's inside

- **Global instructions** (`AGENTS.global.md`): rules that apply to every AI coding session, covering comment style, GitHub lookup, licensing, and docs.
- **Skills** (one folder per skill): opt-in workflows the agent loads on demand.
  - `create-project`: scaffold a new repo at `~/Code` with GitHub remote, baseline files, and formatting/lint automation.
  - `unslop`: cut AI tells from any writing, always applied.
  - `git-commit`: atomic git commits with conventional message analysis, intelligent staging, and message generation.

## Install

Link what you need into place. Symlinks pick up future updates automatically, copies do not. Repeat the skill lines for each skill you want, then restart your agent so the new config takes effect.

### opencode

```bash
mkdir -p ~/.config/opencode/skills
ln -s ~/Code/skills/AGENTS.global.md ~/.config/opencode/AGENTS.md
ln -s ~/Code/skills/create-project ~/.config/opencode/skills/create-project
```

### Claude Code

```bash
mkdir -p ~/.claude/skills
ln -s ~/Code/skills/AGENTS.global.md ~/.claude/CLAUDE.md
ln -s ~/Code/skills/create-project ~/.claude/skills/create-project
```

### Codex

```bash
mkdir -p ~/.codex/skills
ln -s ~/Code/skills/AGENTS.global.md ~/.codex/AGENTS.md
ln -s ~/Code/skills/create-project ~/.codex/skills/create-project
```

### Other agent-compatible tools

```bash
mkdir -p ~/.agents/skills
ln -s ~/Code/skills/create-project ~/.agents/skills/create-project
```

### Cursor

Nothing to link. Cursor picks up the repo-level `AGENTS.md` files on its own.

### Frozen snapshot

Prefer a copy that never changes? Copy the files instead of linking:

```bash
cp ~/Code/skills/AGENTS.global.md ~/.config/opencode/AGENTS.md
cp -r ~/Code/skills/create-project ~/.config/opencode/skills/create-project
```

## Add a new skill

1. Create `<name>/SKILL.md` with `name` and `description` frontmatter.
2. Link it into each skills directory as shown above and restart your agent.

## License

MIT, see [LICENSE](LICENSE).

## Credit

- `unslop/` skill taken from [cursor/plugins](https://github.com/cursor/plugins) (`pstack/skills/unslop`), MIT licensed.
- `git-commit/` skill inspired by [vekzz-dev/opencode-skills](https://github.com/vekzz-dev/opencode-skills) (`git-commit/`), MIT licensed.
