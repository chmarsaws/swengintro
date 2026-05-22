# Lesson 2: Commit, Push, and Pull Request

**Time:** ~45 minutes  
**Git:** stage, commit, push, pull request, review cycle  
**Cursor:** inline edit, diff before commit, commit from Source Control

## Objectives

By the end of this lesson you will:

- Add a `display_name` field to team members and show it in the CLI
- Write a focused commit and push your branch
- Open a pull request and respond to review feedback

## Prerequisites

- Lesson 1 complete
- On latest `main` (pull first): `git checkout main && git pull`

## The task

Product wants friendlier dashboard output. Each `TeamMember` should have a **`display_name`** used in the CLI instead of (or in addition to) `name`.

### Requirements

1. Add `display_name: str` to `TeamMember` in `app/src/teampulse/roster.py`.
2. Set sensible `display_name` values in seed data (e.g. `"Alex C."` for Alex Chen).
3. Update `format_dashboard_line` in `app/src/teampulse/status.py` to show `display_name`.
4. Add or update tests in `app/tests/` so pytest still passes.
5. Run `pytest` before you commit.

### Branch

```bash
git checkout main
git pull
git checkout -b learn/<username>/display-name
```

## Steps

### 1. Implement the feature

Edit the files above. Use Cursor's editor and, if you like, inline suggestions (`Ctrl+K` on a selection).

### 2. Verify

```bash
cd app
pytest
python -m teampulse
```

Confirm the dashboard shows display names.

### 3. Commit and push

1. Review every changed file in Source Control diff view.
2. Commit with a message in **imperative mood**, e.g.:

   ```
   feat(roster): add display_name for dashboard output
   ```

3. Push:

   ```bash
   git push -u origin learn/<username>/display-name
   ```

### 4. Open a pull request

On GitHub, open a **Pull Request** into `main`. The PR template will prompt you for a summary and test plan.

**Wait for facilitator review** — they will leave a comment asking for a small change (often commit message polish or a test name). Make the fix, push again, and tell them when ready.

## Success checklist

- [ ] `display_name` exists on `TeamMember` and seed data is updated
- [ ] CLI output uses `display_name`
- [ ] `pytest` passes
- [ ] Branch pushed and PR opened against `main`
- [ ] I addressed facilitator review feedback and pushed again
- [ ] PR approved (facilitator will merge or ask you to merge)

## Next lesson

After your PR is merged (or facilitator confirms you're ready), continue to [Lesson 3: Sync and Merge Conflict](../03-sync-and-merge-conflict/README.md).

Optional help: [HINTS.md](HINTS.md)
