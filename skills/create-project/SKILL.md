---
name: create-project
description: Use when creating a new project, scaffolding a repo, initializing a repository, bootstrapping boilerplate, or starting a new codebase from scratch. Triggers: new project, create project, new repo, scaffold, boilerplate, initialize project.
---

# Create Project

Scaffold a new project with GitHub remote, baseline files, and CI automation.

## Location and remote

- Create the project at `~/Code/<name>` unless a different path is specified.
- Initialize git and create the GitHub remote with the `gh` CLI (skip remote setup only if `gh` is missing or unauthenticated): `gh repo create <name> --public --source=. --push`
- Repositories are public unless private is explicitly requested.

## Baseline files

Every project gets:

- `README.md`: what the project does and how to use it, written for the reader. Keep it user-focused, lead with what the reader can do, and prefer short examples over exhaustive explanations.
- `AGENTS.md`: stack, layout, commands, and conventions an agent needs.
- `LICENSE`: MIT unless specified otherwise.
- `.gitignore`: appropriate for the stack.

## Automation

Mirror the standard CI pattern: formatting is automated, never manual.

- `.github/workflows/lint.yml`: runs on pull requests, installs deps and runs the linter.
- `.github/workflows/format.yml`: runs on push to main, runs the formatter, auto-commits with `chore: ...`, and pushes.
- `package.json` scripts: `format` and `lint`, even for non-web projects that contain JS/TS, JSON, or Markdown.
- Tell the user that build, format, and lint are handled by CI on push, and record that hands-off policy in the project's `AGENTS.md`.

See [workflows.md](workflows.md) for the reference workflow files.

## Web projects

- Package manager is Bun (`bun init`, `bun install`, `bun run`).
- Always include Tailwind CSS, even for minimal pages.
- Pin GitHub Action versions with commit SHAs.

## Credits

If any scaffolded file is adapted from another repository, verify the license allows reuse and credit the source in the new project's README with a repository link, what was taken, and its license. No credit needed for my own projects.
