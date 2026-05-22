# Lesson 1 — Facilitator notes

**Learners must not open this file during the workshop.**

## Timing

- 30 minutes, no live facilitator Git actions required.

## What to watch for

- Learners still on `main` when starting Lesson 2 — remind them to branch.
- Commits that change `status.py` or `roster.py` early — discourage; Lesson 2 owns roster changes.

## Common issues

| Symptom | Fix |
|---------|-----|
| Wrong Python / no pytest | Pair for `pip install -e ".[dev]"` in `app/` |
| Opened parent monorepo | Ensure they opened `swengintro` root only |
| Pushed Lesson 1 commit | Fine; Lesson 2 will use a new branch from latest `main` |

## Transition

Announce: "Lesson 2 — you'll add a feature and open your first PR. Merge Lesson 1 branch or discard; start Lesson 2 from updated `main`."
