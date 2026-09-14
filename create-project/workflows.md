# Reference CI workflows

Adapt these per project. Non-web projects keep the same shape but swap the Bun steps for the stack's install/lint/format commands: the PR workflow runs the check, the push workflow applies the fix and auto-commits.

## lint.yml (pull requests)

```yaml
name: Lint

on:
  pull_request:

jobs:
  lint:
    name: Lint
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1 # v7.0.1

      - name: Set up Bun
        uses: oven-sh/setup-bun@0c5077e51419868618aeaa5fe8019c62421857d6 # v2.2.0
        with:
          bun-version: latest

      - name: Install dependencies
        run: bun install

      - name: Run linter
        run: bun run lint
```

## format.yml (push to main)

```yaml
name: Format

on:
  push:
    branches:
      - main
  workflow_dispatch:

permissions:
  contents: write

jobs:
  format:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1 # v7.0.1
        with:
          fetch-depth: 0

      - name: Set up Bun
        uses: oven-sh/setup-bun@0c5077e51419868618aeaa5fe8019c62421857d6 # v2.2.0
        with:
          bun-version: latest

      - name: Install dependencies
        run: bun install

      - name: Run formatter
        run: bun run format

      - name: Commit formatting changes
        run: |
          git config --local user.email "github-actions[bot]@users.noreply.github.com"
          git config --local user.name "github-actions[bot]"
          git add .
          git diff --cached --quiet || git commit -m "chore: Auto format"

      - name: Push changes
        run: git push origin ${{ github.ref_name || 'main' }}
```

## package.json scripts

```json
{
  "scripts": {
    "format": "prettier --write .",
    "lint": "eslint ."
  }
}
```
