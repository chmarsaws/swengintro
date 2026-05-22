# Lesson 2 — Hints

<details>
<summary>dataclass field order error</summary>

New fields with defaults must come after fields without defaults, or give earlier fields defaults too.
</details>

<details>
<summary>Tests fail after adding display_name</summary>

Search tests for `.name` assertions on dashboard lines; update expected strings to `display_name` values.
</details>

<details>
<summary>push rejected (non-fast-forward)</summary>

Someone updated the remote branch. Run `git pull --rebase` on your feature branch, fix any issues, then push again.
</details>

<details>
<summary>What should the PR description say?</summary>

One paragraph: what you changed, why, and "pytest passes locally."
</details>
