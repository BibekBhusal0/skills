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

Mirror the standard CI pattern: what CI handles is never done manually.

- Include lint and formatting workflows only when the project requires them: add `lint.yml` (runs on pull requests) and `format.yml` (runs on push to main, auto-commits with `chore: ...`, pushes) only when the project contains code worth checking. Skip both for docs-only or trivial projects.
- When included, add `format` and `lint` scripts to `package.json` and tell the user that build, format, and lint are handled by CI on push. Record that hands-off policy in the project's `AGENTS.md`.

See [workflows.md](workflows.md) for the reference workflow files.

## Releases

Mirror the standard release pattern: version bump plus notes file, published by a manual workflow.

- Bump the `"version"` field in the project's version file (`package.json`, `cargo.lock` or equivalents). Append a suffix for pre-releases (for example `1.0.0-beta`); plain versions are stable releases.
- Write the release notes in `release-notes.md`. If the file is missing or empty, no GitHub release is created.
- Commit and push to `main`, then wait for the format and lint workflows to pass (if any).
- Trigger the release workflow manually from the Actions tab. It builds the project (skipped when there is nothing to build), creates the GitHub release from the notes file, then clears `release-notes.md`.

See [workflows.md](workflows.md) for the reference release workflow.

## Web projects

- Package manager is Bun (`bun init`, `bun install`, `bun run`).
- Always include Tailwind CSS, even for minimal pages.
- Pin GitHub Action versions with commit SHAs.

## Credits

If any scaffolded file is adapted from another repository, verify the license allows reuse and credit the source in the new project's README with a repository link, what was taken, and its license. No credit needed for my own projects.
