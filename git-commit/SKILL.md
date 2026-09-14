---
name: git-commit
description: >
  Execute atomic git commits with conventional commit message analysis, intelligent staging, and message generation.
  Trigger: When user asks to commit changes, create a commit, or mentions "/commit".
license: MIT
---

## Core principle

One commit = one deliverable behavior. Multiple unrelated changes in the working tree get committed one at a time, never together.

## 0. Classify (mandatory)

```bash
git status --porcelain
git diff
git diff --staged
```

Group every change by the deliverable behavior it belongs to (bug fix, feature, refactor, config). If 2+ unrelated concerns exist, stop and ask which one to commit now. If only one, proceed.

## 1. Stage only this change

```bash
git add path/to/file1 path/to/file2
git add -p path/to/file-with-mixed-changes
git add src/feature-b/*
```

Never commit secrets (.env, credentials, private keys); add them to `.gitignore` preventively. Never use bare `git add .` without verifying it captures one concern.

## 2. Verify staging (mandatory gate)

```bash
git diff --staged
```

The staged change must pass all four: one deliverable behavior; repo compiles with only this change; understandable from the diff alone; tests included when behavior changes. On any failure, unstage (`git restore --staged .`) and re-split.

## 3. Message

Determine type, scope, and description (present tense, imperative mood, under 72 chars). Format:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Body is mandatory: a blank line after the description, then paragraphs explaining what changed and why (reason, problem, trade-offs). Never an implementation diary:

```
Add rate limiting to API endpoints

Users were hitting the API too frequently, causing server strain.
This change implements token bucket algorithm to throttle requests.
```

Footer is optional, for `BREAKING CHANGE:` and issue refs (`Closes #123`). Mark breaking API changes with `feat!:` or the footer.

Commit types: feat, fix, docs, style, refactor, perf, test, build, ci, chore, revert.

## 4. Commit

```bash
git commit -m "$(cat <<'EOF'
<type>(<scope>): <description>

<body>

[optional footer]
EOF
)"
```

Sign with `-S` when a key is configured. Extras: `--amend` before pushing, `--fixup` plus `--autosquash` rebase, `--dry-run` to preview.

## Logical order

Split by behavior in dependency order so each step is independently verifiable: dependencies (models, types, schemas) first, behavior next, integration last. Tests ship with the behavior they verify; docs ship with the change they explain.

Weak (split by file type, avoid): `feat: add User model`, then service, then controller, then tests. Each step is broken until the last one lands.

Strong (split by behavior): `feat(auth): add User model with validation rules`, then `implement user registration with tests`, then `wire registration endpoint`. The repo compiles after every step and `git bisect` works.

## Git safety

Never update git config, skip hooks, force push, or run destructive commands without explicit request. If hooks reject a commit, fix the issue and create a new commit.
