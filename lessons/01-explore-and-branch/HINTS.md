# Lesson 1 — Hints

<details>
<summary>I cannot find the terminal in Cursor</summary>

Use **Terminal → New Terminal** from the menu, or press `` Ctrl+` `` (backtick).
</details>

<details>
<summary>pytest is not found</summary>

From `app/` run: `pip install -e ".[dev]"` then try `pytest` again.
</details>

<details>
<summary>git checkout says pathspec did not match</summary>

You may have uncommitted changes. Run `git status`. Either commit on `main` first or stash, then create the branch.
</details>

<details>
<summary>How do I see what will be committed?</summary>

In Source Control, click the file name to open the side-by-side diff before you stage.
</details>
