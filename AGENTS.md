# skills

Personal AI skills and global agent instructions, stored in one place and installed onto this machine with symlinks.

## Layout

- `AGENTS.global.md`: all global agent rules in one file, symlinked to the opencode, Codex, and Claude Code global instruction files.
- `<name>/SKILL.md`: one folder per skill, symlinked into the opencode, agents, Claude, and Codex skills directories. Extra notes live next to `SKILL.md`.

## Validation

No build or tests. After changing anything, re-link following the install examples in `README.md`, verify with `ls -la ~/.config/opencode/skills/`, then quit and restart your agent. Config loads once at startup and is not hot-reloaded.
