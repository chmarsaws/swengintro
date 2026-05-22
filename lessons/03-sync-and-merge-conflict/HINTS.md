# Lesson 3 — Hints

<details>
<summary>No conflict appeared</summary>

Your branch may already include `main`. Ask the facilitator to confirm they ran the Lesson 3 seed script and that you pulled `origin main`.
</details>

<details>
<summary>pytest fails after merge</summary>

The facilitator changed `DEFAULT_STATUS` to `away` on `main`. Pick one default for the merged code and ensure tests expect that value.
</details>

<details>
<summary>Which side is "current"?</summary>

**Current (HEAD)** is your branch. **Incoming** is what you are merging in (`origin/main`).
</details>

<details>
<summary>I accidentally committed conflict markers</summary>

Search the file for `<<<<<<<` and fix, then amend or add a follow-up commit (facilitator can help).
</details>
