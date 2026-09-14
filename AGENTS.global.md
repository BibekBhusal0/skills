# Global instructions

Personal defaults for every opencode session on this machine.

Detailed rules auto-load from `~/Code/skills/instructions/` via the
`instructions` field in `~/.config/opencode/opencode.json`:

- `code-comments.md` — high-value comments only.
- `github-lookup.md` — clone GitHub repos shallowly to
  `~/Code/random/opencode/` instead of web fetch.
- `licensing.md` — license checks and README credit for reused code.
- `writing-docs.md` — user-focused documentation.

Project source of truth: `~/Code/skills`. Edit there, re-run `./install.sh`,
then restart opencode.
