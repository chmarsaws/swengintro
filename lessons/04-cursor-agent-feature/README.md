# Lesson 4: Cursor Agent and Feature Ticket

**Time:** ~30 minutes  
**Git:** feature branch from latest `main`, focused diff  
**Cursor:** Agent mode, `@` file context, project rules

## Objectives

By the end of this lesson you will:

- Implement a small feature from a GitHub issue using Cursor Agent
- Use `@` references to scope context
- Extend project rules in `.cursor/rules/workshop.mdc`
- Ship a tested change on a feature branch

## Prerequisites

- Lessons 1–3 complete
- `main` is up to date locally
- Facilitator has posted **Lesson 4 issue** on GitHub (they will announce)

## The ticket

Read the GitHub issue your facilitator created (title along the lines of **"Add busy status and --online-only filter"**).

Summary:

1. Add **`busy`** as a valid status in `status.py`.
2. Add CLI flag **`--online-only`** that prints only members whose status is `online`.
3. Add tests for both behaviors.
4. Update `.cursor/rules/workshop.mdc` with one team convention (see below).

## Steps

### 1. Update project rules (you)

Open [`.cursor/rules/workshop.mdc`](../../.cursor/rules/workshop.mdc) and add a bullet under **Conventions**, for example:

- Status strings are always lowercase.

Save the file. This teaches how teams encode standards for Cursor.

### 2. Create a feature branch

```bash
git checkout main
git pull
git checkout -b learn/<username>/busy-and-filter
```

### 3. Use Cursor Agent

Open **Agent** (Chat in Agent mode). Paste this prompt (adjust paths if needed):

```
Implement the GitHub issue for TeamPulse:

1. Add "busy" to VALID_STATUSES in @app/src/teampulse/status.py
2. Add --online-only flag to @app/src/teampulse/cli.py that prints only online members
3. Add tests in @app/tests/

Follow @.cursor/rules/workshop.mdc. Run pytest when done.
```

Review every change Agent proposes before accepting. You are responsible for the code.

### 4. Verify and commit

```bash
cd app
pytest
python -m teampulse
python -m teampulse --online-only
```

Commit with a clear message, push, and open a PR (or tell facilitator you're done if time is short).

## Success checklist

- [ ] I read the facilitator's GitHub issue
- [ ] I updated `.cursor/rules/workshop.mdc` with a convention
- [ ] `busy` is a valid status; invalid statuses still raise `ValueError`
- [ ] `--online-only` filters the dashboard correctly
- [ ] `pytest` passes
- [ ] I used Agent with `@` file references
- [ ] Branch pushed (PR optional per facilitator)

## Workshop complete

Congratulations—you've practiced branch workflow, PR review, merge conflicts, and Cursor Agent on a team codebase.

Optional help: [HINTS.md](HINTS.md)
