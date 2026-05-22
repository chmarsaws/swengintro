# Lesson 3 — Facilitator notes

## Before this lesson

Run `facilitator/scripts/seed-lesson3-conflict.ps1` on `main` and push **before** learners merge.

The script changes:

- `DEFAULT_STATUS` from `"offline"` to `"away"`
- Comment block above `DEFAULT_STATUS` (overlaps learner edits)

## Timing

- 45 minutes; conflict should appear for everyone who merges `origin/main` into a branch that still has pre-seed `status.py` **or** who merges after their L2 work.

## Cohort strategies

| Strategy | When to use |
|----------|-------------|
| **A:** Learners merge `main` into unmerged L2 branch | Best if L2 PRs still open |
| **B:** New branch off L2 merge commit | If all L2 PRs already merged |

## Fast vs needs-help

- **Fast:** merge immediately after seed push
- **Needs help:** delay seed 10 min so you can pair on first conflict

## Verify

One learner screen-share: conflict in `status.py`, markers visible, resolved file passes pytest.
