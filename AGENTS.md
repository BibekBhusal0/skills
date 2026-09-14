# skills

Personal AI skills and global instructions, stored in one place and installed
onto this machine with symlinks.

## Layout

- `AGENTS.global.md` — all global opencode rules in one file, symlinked to
  `~/.config/opencode/AGENTS.md`.
- `skills/<name>/SKILL.md` — one folder per skill, symlinked into
  `~/.config/opencode/skills/`. Extra notes live next to `SKILL.md`.

## Install

Installed via `config/opencode.sh` in the omarchy-overrides repo (it sources
`utils/symlink.sh` from there). This repo holds no installer and no CI.

## Validation

No build or tests. After changing anything, re-run `config/opencode.sh`,
verify with `ls -la ~/.config/opencode/skills/`, then quit and restart
opencode — config loads once at startup and is not hot-reloaded.
