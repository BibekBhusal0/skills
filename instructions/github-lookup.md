# GitHub lookup

To inspect code or docs on GitHub, clone the repository locally instead of
reading it through web fetch. Web fetch drops formatting and truncates;
a local clone is searchable and complete.

- Shallow clone only: `git clone --depth 1 <url>`. Never pull full history.
- Location: `~/Code/random/opencode/<repo-name>`.
- Reuse existing clones: if the directory already exists, skip cloning.
  Run `git pull` inside it only when the latest changes are actually needed.
