# Lesson 3: Sync with main and Resolve a Merge Conflict

**Time:** ~45 minutes  
**Git:** fetch, pull, merge, conflict markers, resolve, push  
**Cursor:** merge conflict UI, accept current/incoming/both

## Objectives

By the end of this lesson you will:

- Update your branch with the latest `main`
- Resolve a real merge conflict in `status.py`
- Complete the merge and push

## Prerequisites

- Lesson 2 PR merged into `main`
- Facilitator has pushed a conflicting change to `main` (they will announce when ready)

## Background

While you were working on Lesson 2, another developer ("the facilitator") shipped a change to **the same lines** in `app/src/teampulse/status.py` on `main`. Your job is to integrate their work with yours.

## Steps

### 1. Start from your Lesson 2 branch (or recreate)

If you still have your feature branch:

```bash
git fetch origin
git checkout learn/<username>/display-name
```

If you already merged and deleted the branch, create a practice branch from before the merge OR work on a new branch that includes your `display_name` work and merge `main` into it. **Ask your facilitator** which approach your cohort uses.

### 2. Pull latest main

```bash
git fetch origin
git checkout main
git pull origin main
git checkout learn/<username>/display-name
```

### 3. Merge main into your branch

```bash
git merge origin/main
```

Git will stop with a **merge conflict** in `status.py`. This is expected.

### 4. Resolve the conflict in Cursor

1. Open `app/src/teampulse/status.py`.
2. Find conflict markers:

   ```
   <<<<<<< HEAD
   ...
   =======
   ...
   >>>>>>> origin/main
   ```

3. Use Cursor's conflict actions (**Accept Current**, **Accept Incoming**, **Accept Both**) or edit manually so that:
   - Both your `display_name` dashboard behavior **and** the team's updated default/status logic are preserved
   - `DEFAULT_STATUS` and `VALID_STATUSES` are consistent
   - Conflict markers are completely removed

4. Run tests:

   ```bash
   cd app
   pytest
   ```

### 5. Complete the merge

```bash
git add app/src/teampulse/status.py
git commit -m "merge: resolve status.py conflict with main"
git push
```

If your Lesson 2 PR is still open, update the PR. If it was already merged, your facilitator may have you open a short follow-up PR—follow their instruction.

## Insights

- **`git fetch origin`** — downloads all new commits and branches from the remote (`origin`) into your local repository, but does *not* change any of your local branches. Think of it as "go check what is new on the server and store a copy locally."
- **`git checkout learn/<username>/display-name`** — switches back to your feature branch without the `-b` flag, because the branch already exists.
- **`git checkout main`** — switches to the `main` branch so you can update it before creating your merge.
- **`git pull origin main`** — fetches `origin/main` and merges it into your current branch in one step. After this, your local `main` matches the server.
- **`git merge origin/main`** — merges the remote-tracking copy of `main` into your current feature branch. When both branches have changed the same lines, git cannot decide which version to keep and marks the file with **conflict markers** (`<<<<<<<`, `=======`, `>>>>>>>`). Everything between `<<<<<<< HEAD` and `=======` is your version; everything between `=======` and `>>>>>>>` is the incoming version from `main`.
- **`cd app`** — moves into `app/` to run tests from the correct directory.
- **`pytest`** — verifies your conflict resolution did not break anything. Always run this *before* committing the merge.
- **`git add app/src/teampulse/status.py`** — stages the specific file you resolved. This tells git the conflict in that file is settled and should be included in the merge commit.
- **`git commit -m "merge: resolve status.py conflict with main"`** — finalizes the merge as a new commit. Git recognizes this as a merge commit because of the in-progress merge state left by the conflict.
- **`git push`** — pushes the updated branch (including your new merge commit) to the remote so the PR reflects the resolved state.

## Success checklist

- [ ] I ran `git fetch` and merged latest `main` into my branch
- [ ] I resolved the conflict in `status.py` without leaving marker text
- [ ] `pytest` passes after the merge
- [ ] I committed the merge and pushed
- [ ] I can explain what "current" vs "incoming" meant in my conflict

## Next lesson

Continue to [Lesson 4: Cursor Agent Feature](../04-cursor-agent-feature/README.md).

Optional help: [HINTS.md](HINTS.md)
