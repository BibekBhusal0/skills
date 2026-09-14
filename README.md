# Skills

My personal collection of AI skills and global instructions for opencode.
Everything lives here and is installed onto the machine with symlinks, so
this repo stays the single source of truth.

## What's inside

- **Global instructions** (`AGENTS.global.md`) — rules that apply to every
  opencode session: comment style, GitHub lookup, licensing, and docs.
- **Skills** (`skills/`) — opt-in workflows the agent loads on demand:
  - `create-project` — scaffold a new repo at `~/Code` with GitHub remote,
    baseline files, and formatting/lint automation.

## Install

Installed via `config/opencode.sh` in
[omarchy-overrides](https://github.com/BibekBhusal0/omarchy-overrides),
which links everything into `~/.config/opencode/`. Existing files are
backed up with a `.bak` suffix, never overwritten. Re-run it after pulling
updates or adding a skill, then quit and restart opencode for the changes
to take effect.

## Add a new skill

1. Create `skills/<name>/SKILL.md` with `name` and `description` frontmatter.
2. Re-run `config/opencode.sh` in omarchy-overrides and restart opencode.

## 📜 License

MIT — see [LICENSE](LICENSE).
