# Lesson 1: Explore and Branch

**Time:** ~30 minutes  
**Git:** clone, branch, working tree  
**Cursor:** workspace, file tree, terminal, Source Control panel

## Objectives

By the end of this lesson you will:

- Navigate the workshop repository in Cursor
- Run TeamPulse locally and understand where the code lives
- Create your first feature branch and make a small commit

## Prerequisites

- Completed setup in [LEARNER_START.md](../../LEARNER_START.md)
- Repository cloned to your machine

## Steps

### 1. Orient yourself

Open these paths in Cursor (click through the file tree or use Quick Open `Ctrl+P`):

| Path | What it is |
|------|------------|
| `LEARNER_START.md` | Your roadmap |
| `app/src/teampulse/` | Application source |
| `app/tests/` | Automated tests |
| `lessons/` | Workshop instructions |

### 2. Run TeamPulse

In the Cursor terminal:

```bash
cd app
pytest
python -m teampulse
```

You should see a short dashboard listing three team members and their statuses.

### 3. Create your branch

Replace `<username>` with your GitHub username (or the name your facilitator assigned):

```bash
git checkout -b learn/<username>/explore
```

**Cursor tip:** You can also create a branch from the **Source Control** view (branch name dropdown → Create new branch).

### 4. Make a small fix

Find and fix **one** of these (your choice):

- A typo in this lesson's README or in [LEARNER_START.md](../../LEARNER_START.md), **or**
- Improve a comment in `app/src/teampulse/cli.py` (one line is enough)

Do not change application behavior yet.

### 5. Commit locally

1. Open the **Source Control** panel (`Ctrl+Shift+G`).
2. Review the **diff** for your change.
3. Stage the file(s).
4. Commit with a clear message, for example:

   ```
   docs: fix typo in lesson 1 README
   ```

5. Do **not** push yet unless your facilitator says otherwise.

## Insights

- **`cd app`** — changes your working directory to `app/`. Commands like `pytest` and `python` run relative to whichever folder you are in.
- **`pytest`** — discovers and runs every test file, then prints a pass/fail summary. A green dot per test means it passed; `F` means it failed with a reason.
- **`python -m teampulse`** — runs the `teampulse` package as a program. The `-m` flag tells Python to look up the package by name and run its `__main__.py`.
- **`git checkout -b learn/<username>/explore`** — creates a new branch named `learn/<username>/explore` and immediately switches to it. The `-b` flag is what creates the branch; without it `checkout` would only switch to an existing one. All commits you make will now live on this branch instead of on `main`.

## Success checklist

- [ ] I can find `app/src/teampulse/` and `lessons/` in Cursor
- [ ] `pytest` passes in `app/`
- [ ] `python -m teampulse` prints the dashboard
- [ ] I am on branch `learn/<username>/explore`
- [ ] I made one small commit with a descriptive message
- [ ] I reviewed the diff before committing

## Next lesson

When every box is checked, continue to [Lesson 2: Commit, Push, and PR](../02-commit-push-pr/README.md).

Optional help: [HINTS.md](HINTS.md)
