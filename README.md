# Skills

My personal collection of AI skills and global instructions for agents. Everything lives here and is installed onto the machine with symlinks, so this repo stays the single source of truth.

## What's inside

- **Global instructions** (`AGENTS.global.md`): rules that apply to every opencode session, covering comment style, GitHub lookup, licensing, and docs.
- **Skills** (`skills/`): opt-in workflows the agent loads on demand.
  - `create-project`: scaffold a new repo at `~/Code` with GitHub remote, baseline files, and formatting/lint automation.

## Install

Link what you need into place. Symlinks pick up future updates automatically, copies do not.

```bash
mkdir -p ~/.config/opencode/skills

# Global instructions
ln -s ~/Code/skills/AGENTS.global.md ~/.config/opencode/AGENTS.md

# A skill (repeat for each skill you want)
ln -s ~/Code/skills/skills/create-project ~/.config/opencode/skills/create-project
```

Prefer a frozen snapshot instead? Copy the files:

```bash
cp ~/Code/skills/AGENTS.global.md ~/.config/opencode/AGENTS.md
cp -r ~/Code/skills/skills/create-project ~/.config/opencode/skills/create-project
```

The same works for `~/.agents/skills/` if you want a skill visible to agent-compatible tools. Restart opencode after installing so the new config takes effect.

## Add a new skill

1. Create `skills/<name>/SKILL.md` with `name` and `description` frontmatter.
2. Link it into `~/.config/opencode/skills/` as shown above and restart opencode.

## License

MIT, see [LICENSE](LICENSE).
