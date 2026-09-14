# skills

Personal AI skills and global instructions, stored in one place and installed
onto this machine with symlinks.

## Layout

- `AGENTS.global.md` — global opencode rules, symlinked to
  `~/.config/opencode/AGENTS.md`.
- `instructions/` — detail files auto-loaded via the `instructions` field in
  `~/.config/opencode/opencode.json`. One topic per file.
- `skills/<name>/SKILL.md` — one folder per skill, symlinked into
  `~/.config/opencode/skills/`. Extra notes live next to `SKILL.md`.
- `install.sh` — idempotent installer. Replaces stale symlinks, backs up
  real files to `<dest>.bak`, merges `instructions` into `opencode.json`
  without touching other keys.

## Validation

No build or tests. After changing anything, run `./install.sh`, verify with
`ls -la ~/.config/opencode/skills/`, confirm `opencode.json` still parses
(`python3 -c "import json; json.load(open(...))"`), then quit and restart
opencode — config loads once at startup and is not hot-reloaded.
