# Welcome to the Git + Cursor Workshop

You are joining a simulated engineering team. Your facilitator will act as other developers: reviewing your pull requests, pushing changes to `main`, and filing tickets. **This is not a solo tutorial**—follow the lessons in order and wait for facilitator actions when noted.

## Before you begin

1. **Clone** the workshop repository (your facilitator will share the URL).
2. **Open the folder in Cursor**: File → Open Folder → select the repo root (`swengintro`).
3. **Install TeamPulse** (one time):

   ```bash
   cd app
   pip install -e ".[dev]"
   pytest
   ```

4. Confirm the CLI runs:

   ```bash
   python -m teampulse
   ```

## Insights

- **`cd app`** — changes your working directory to `app/`. Commands like `pytest` and `python` will run relative to that folder.
- **`pip install -e ".[dev]"`** — installs the TeamPulse package in *editable* mode (`-e`) along with its development dependencies. Editable means edits to the source files take effect immediately without reinstalling.
- **`pytest`** — discovers and runs every test file matching `test_*.py`, then reports how many passed or failed.
- **`python -m teampulse`** — runs the `teampulse` package as a program (via its `__main__.py`), which starts the CLI dashboard.

## Rules

- Complete **one lesson at a time**. Check off every item on the success checklist before moving on.
- Use branches named `learn/<your-github-username>/<short-description>` unless your facilitator says otherwise.
- Run `pytest` from the `app/` directory before every commit.
- **Do not open** the `facilitator/` folder or any file named `facilitator-notes.md` during the workshop—they are for your instructor only.

## Lessons

| # | Topic | Start here |
|---|--------|------------|
| 1 | Explore the repo, branch, first commit | [lessons/01-explore-and-branch/README.md](lessons/01-explore-and-branch/README.md) |
| 2 | Feature work, commit, push, open a PR | [lessons/02-commit-push-pr/README.md](lessons/02-commit-push-pr/README.md) |
| 3 | Sync with `main`, resolve a merge conflict | [lessons/03-sync-and-merge-conflict/README.md](lessons/03-sync-and-merge-conflict/README.md) |
| 4 | Cursor Agent, issue ticket, ship a feature | [lessons/04-cursor-agent-feature/README.md](lessons/04-cursor-agent-feature/README.md) |

## Need help?

- Read **HINTS.md** in the current lesson folder (optional).
- Ask your facilitator—especially when the lesson says to wait for a PR review or a new GitHub issue.

**Begin with Lesson 1 →**
