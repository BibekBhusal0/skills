# Global instructions

Personal defaults for every agents session on this machine.

## Code comments

Write only high-value comments. Every comment must earn its place.

- Explain what is not obvious at first glance: non-trivial logic, surprising side effects, load-bearing quirks, why this approach over the obvious one.
- Break down complex blocks into their intent before the implementation.
- Never narrate the conversation, address the reader, or describe what you just did. No greetings, no sign-offs, no meta-commentary.
- Never restate what the code already says. If the comment adds nothing beyond the identifiers, delete it.

## GitHub lookup

To inspect code or docs on GitHub, clone the repository locally instead of reading it through web fetch. Web fetch drops formatting and truncates; a local clone is searchable and complete.

- Shallow clone only: `git clone --depth 1 <url>`. Never pull full history.
- Location: `~/Code/random/opencode/<repo-name>`.
- Reuse existing clones: if the directory already exists, skip cloning. Run `git pull` inside it only when the latest changes are actually needed.

## Licensing and credit

When code is inspired by or copied from another repository:

- Check that its license permits reuse (MIT, Apache-2.0, BSD, and similar permissive licenses generally do; proprietary, non-commercial, or no-license code does not).
- Credit the source in the project's README: repository link, what was taken, and its license.
- No credit needed for code from my own projects (`github.com/bibekbhusal0`, `github.com/BibekBhusal0`).

## Writing docs for humans

Documentation is written for the person reading it, not the system it describes.

- Lead with what the reader can do, not how the internals work.
- Include technical detail only when the reader needs it to act.
- Prefer short examples over exhaustive explanations.
