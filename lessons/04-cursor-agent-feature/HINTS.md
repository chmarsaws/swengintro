# Lesson 4 — Hints

<details>
<summary>Agent changed too many files</summary>

Reject or undo broad changes. Re-run with a narrower prompt referencing only `status.py`, `cli.py`, and one test file.
</details>

<details>
<summary>--online-only not recognized</summary>

Ensure `build_parser()` registers the flag and `main()` filters `list_members()` before printing.
</details>

<details>
<summary>test_set_status_invalid still expects busy to fail</summary>

Update that test: `busy` is now valid. Add a new test using an invalid status like `"vacation"`.
</details>

<details>
<summary>Where is Agent mode?</summary>

Open the Chat panel and select **Agent** (not Ask) from the mode dropdown.
</details>
