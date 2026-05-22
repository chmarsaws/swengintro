# Lesson 2 — Facilitator notes

## Timing

- 45 minutes; plan ~10 minutes for PR reviews per learner (batch if many attendees).

## Your role

Within 10 minutes of each PR opening:

1. Leave **one constructive comment** (see RUNBOOK canned comments).
2. After they push a fix, **approve** the PR.
3. Merge when ready, or let them merge if your org allows.

## Suggested review comments (pick one)

- "Please rename `test_dashboard` to something specific like `test_dashboard_shows_display_name`."
- "Commit message: use scope `feat(roster):` consistently in the subject line."
- "Add a test asserting `display_name` appears in `format_dashboard_line` output."

## What good looks like

- Single logical commit (or 2 if they fixed review feedback)
- PR template filled in
- No unrelated file changes

## Transition

Before Lesson 3: ensure all merged PRs are on `main`, then run **seed-lesson3-conflict** script (see RUNBOOK) before learners pull.
