# Global Instructions

Personal defaults for every agent session on this machine.

## Coding Preferences (General)

- Keep things simple. Channel "yagni" energy unless told otherwise.
- Type safety is useful, take advantage of it.
- Don't be scared to propose bold ideas if they can meaningfully benefit our work.
- Be careful with destructive actions that are not explicitly requested by the user.
- Tests are good! Endless smoke tests, "regression tests" for feature deletions, etc. much less good. Tests should be focused, not slop.
- Keep comments up to date! When making changes, it's important to keep things in sync.

## Coding Preferences (TypeScript Focused)

- `any` is the enemy. Inferred types are our friend. Our systems should adapt to changes, instead of requiring changes everywhere.
- If your TS code looks like a Python dev wrote it, it is bad TS code.
- Avoid one-line functions that are just casting wrappers.
- If not already specified in project, I generally like to use the following tech: Tailwind, React, Vite, bun

## Code Comments

Write only high-value comments. Every comment must earn its place.

- Explain what is not obvious at first glance: non-trivial logic, surprising side effects, load-bearing quirks, why this approach over the obvious one.
- Break down complex blocks into their intent before the implementation.
- Never narrate the conversation, address the reader, or describe what you just did. No greetings, no sign-offs, no meta-commentary.
- Never restate what the code already says. If the comment adds nothing beyond the identifiers, delete it.

## Agent Behavior

- Change only what was asked. Keep diffs minimal. Never delete files, rename symbols, remove logs or debug prints, remove comments, or change text, content, or behavior unless explicitly requested.
- Read only the files needed for the task. Don't explore the codebase broadly and don't read library or tool sources; without reading available docs first.
- Read a file before editing it. Copy the matched text exactly including whitespace and indentation, and include enough surrounding context to make the match unique.
- Verify with the cheapest command that checks the work (cargo check, lint, typecheck). Don't build, run, or test unless asked.
- No decorative banner or separator comments. No em dashes in markdown.

## GitHub Lookup

To inspect code or docs on GitHub, clone the repository locally instead of reading it through web fetch. Web fetch drops formatting and truncates; a local clone is searchable and complete.

- Shallow clone only: `git clone --depth 1 <url>`. Never pull full history.
- Location: `~/Code/random/opencode/<repo-name>`.
- Reuse existing clones: if the directory already exists, skip cloning. Run `git pull` inside it only when the latest changes are actually needed.

## Licensing and Credit

When code is inspired by or copied from another repository:

- Check that its license permits reuse (MIT, Apache-2.0, BSD, and similar permissive licenses generally do; proprietary, non-commercial, or no-license code does not).
- Credit the source in the project's README: repository link, what was taken, and its license.
- No credit needed for code from my own projects (`github.com/bibekbhusal0`, `github.com/BibekBhusal0`).

## Writing Docs for Humans

Documentation is written for the person reading it, not the system it describes.

- Lead with what the reader can do, not how the internals work.
- Include technical detail only when the reader needs it to act.
- Prefer short examples over exhaustive explanations.
