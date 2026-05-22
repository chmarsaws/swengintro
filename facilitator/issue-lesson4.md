# GitHub Issue — paste into your repo

**Title:** `Add busy status and --online-only filter`

**Labels:** `enhancement`, `good first issue` (optional)

---

## Description

TeamPulse needs to reflect real calendar load: engineers can be **busy** (in a meeting) distinct from **away**.

### Requirements

1. **`busy` status**
   - Add `busy` to valid statuses in `app/src/teampulse/status.py`.
   - `set_status(member_id, "busy")` must succeed.
   - Invalid statuses (e.g. `"vacation"`) must still raise `ValueError`.

2. **CLI filter `--online-only`**
   - In `app/src/teampulse/cli.py`, add flag `--online-only`.
   - When set, print only members whose status is `online`.
   - Default behavior (no flag) unchanged: show everyone.

3. **Tests**
   - Add/update tests in `app/tests/`; all tests must pass (`pytest` from `app/`).

4. **Cursor rules**
   - Add one team convention to `.cursor/rules/workshop.mdc` (e.g. status strings are lowercase).

### Acceptance criteria

- [ ] `pytest` passes
- [ ] `python -m teampulse --online-only` shows only online members
- [ ] `busy` is accepted by `set_status`
- [ ] PR or branch `learn/<username>/busy-and-filter` pushed

### Notes

Use Cursor Agent with `@` file references. Read the issue before coding.

**Assignee:** _(learner)_  
**Milestone:** Workshop Lesson 4
