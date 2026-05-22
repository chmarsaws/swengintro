# Facilitator Runbook — Git + Cursor Workshop

Half-day session (~2.5–3 hours). You simulate other developers: PR reviews, pushes to `main`, and a product issue.

## Pre-workshop (day before)

1. **Publish repo** — Create a new GitHub repo from `swengintro/` (do not require learners to clone the parent TradingAgents monorepo).
2. **Push `main`:**

   ```powershell
   cd path\to\swengintro
   git init
   git add .
   git commit -m "chore: initial workshop seed"
   git branch -M main
   git remote add origin https://github.com/YOUR_ORG/swengintro.git
   git push -u origin main
   ```

3. **Access** — Confirm every learner has GitHub write access (collaborator or org team).
4. **Machines** — Git, Cursor, Python 3.10+, network to GitHub.
5. **Dry-run** — Run `facilitator/scripts/dry-run-lesson3.ps1` once locally (see end of this doc).

## Room setup (15 min before start)

- Share clone URL on screen/chat.
- Tell learners: start at **LEARNER_START.md** only; do not open `facilitator/`.
- Optional pairs for Git help; one branch per person: `learn/<github-username>/...`.

---

## Schedule overview

| Block | Duration | Lesson | Your actions |
|-------|----------|--------|--------------|
| 1 | 30 min | L1 Explore & branch | None (pre-seeded repo) |
| 2 | 45 min | L2 Commit & PR | Review PRs (~10 min each) |
| Break | 10 min | — | Run conflict seed on `main` |
| 3 | 45 min | L3 Merge conflict | Already pushed conflict; roam |
| 4 | 30 min | L4 Cursor Agent | Post issue 5 min before start |
| Close | 10 min | — | Debrief |

---

## Lesson 1 — Explore and branch (30 min)

**Learner doc:** [lessons/01-explore-and-branch/README.md](../lessons/01-explore-and-branch/README.md)  
**Your notes:** [lessons/01-explore-and-branch/facilitator-notes.md](../lessons/01-explore-and-branch/facilitator-notes.md)

### Script

1. Welcome: simulated team, you play teammates.
2. Point to clone URL and `LEARNER_START.md`.
3. Walk through opening folder in Cursor (30 sec demo).
4. Quiet work; circulate for `pytest` / `pip install` issues.

### Transition

> "Lesson 2: you'll add `display_name`, push, and open a PR. Pull latest `main` first."

---

## Lesson 2 — Commit, push, PR (45 min)

**Learner doc:** [lessons/02-commit-push-pr/README.md](../lessons/02-commit-push-pr/README.md)

### Script

1. Remind: `git checkout main && git pull` before new branch.
2. Set expectation: you will comment on every PR within ~10 minutes.

### PR review (pick one comment per learner)

```
Thanks for the PR! Could you rename the dashboard test to something
more specific, e.g. test_dashboard_shows_display_name?
```

```
Nice work. Please adjust the commit subject to use scope: feat(roster): ...
```

```
Please add a test that asserts display_name appears in format_dashboard_line output.
```

After they push fixes → **Approve** → **Merge** (or let them merge).

### Transition

> "Break. When we return, `main` will have moved—another dev shipped changes that conflict with status logic. Lesson 3 is merging that in."

---

## Break + seed Lesson 3 conflict (10 min)

**Critical:** Run while learners are on break, **before** Lesson 3.

```powershell
cd path\to\swengintro
git checkout main
git pull
.\facilitator\scripts\seed-lesson3-conflict.ps1
git push origin main
```

Announce:

> "`main` has new commits. Lesson 3: merge `main` into your branch and resolve the conflict in status.py."

**Learner doc:** [lessons/03-sync-and-merge-conflict/README.md](../lessons/03-sync-and-merge-conflict/README.md)

### Fast vs needs-help

| Persona | Tactic |
|---------|--------|
| Fast learners | Seed at break; they merge immediately |
| Needs help | Seed after 10 min into L3; you pair on first conflict |

### Verify one merge

Ask one volunteer to screen-share: conflict markers → resolve → `pytest` → push.

---

## Lesson 4 — Cursor Agent (30 min)

**5 minutes before start**, create GitHub issue from [issue-lesson4.md](issue-lesson4.md).

**Learner doc:** [lessons/04-cursor-agent-feature/README.md](../lessons/04-cursor-agent-feature/README.md)

### Script

1. Point to the issue URL.
2. Remind: Agent mode + `@` files + update `.cursor/rules/workshop.mdc`.
3. Quiet work; check pytest pass before wrap-up.

### Close (10 min)

Round-robin: one Git takeaway, one Cursor takeaway. Mention your real team’s PR/CI process if relevant.

---

## Canned PR review comments (copy-paste)

See Lesson 2 section. Stay constructive; one nit per PR.

---

## Troubleshooting

| Problem | Action |
|---------|--------|
| Learner cloned wrong folder | Must be `swengintro` root with `LEARNER_START.md` |
| No conflict in L3 | Confirm seed script pushed; learner merged `origin/main` not stale local `main` |
| pytest fails after merge | Merged `DEFAULT_STATUS` should be `away` per seed; update test expectations |
| Agent over-edits in L4 | Tell them to reject changes and narrow `@` scope |

---

## Dry-run (facilitator prep)

```powershell
.\facilitator\scripts\dry-run-lesson3.ps1
```

Expect: merge conflict in `status.py`, resolved merge passes pytest. Details in script output.

---

## File reference

| File | Purpose |
|------|---------|
| [scripts/seed-lesson3-conflict.ps1](scripts/seed-lesson3-conflict.ps1) | Push conflicting `main` commit |
| [scripts/dry-run-lesson3.ps1](scripts/dry-run-lesson3.ps1) | Validate conflict flow locally |
| [issue-lesson4.md](issue-lesson4.md) | Paste into GitHub Issues |
| [pr-review-comments.md](pr-review-comments.md) | Extra review snippets |
