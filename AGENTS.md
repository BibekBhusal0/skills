# skills

Personal AI skills and global instructions, stored in one place and installed onto this machine with symlinks.

## Layout

- `AGENTS.global.md`: all global opencode rules in one file, symlinked to `~/.config/opencode/AGENTS.md`.
- `skills/<name>/SKILL.md`: one folder per skill, symlinked into `~/.config/opencode/skills/` and `~/.agents/skills/`. Extra notes live next to `SKILL.md`.

## Validation

No build or tests. After changing anything, re-link following the install examples in `README.md`, verify with `ls -la ~/.config/opencode/skills/`, then quit and restart opencode. Config loads once at startup and is not hot-reloaded.
