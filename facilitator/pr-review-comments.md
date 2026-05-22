# PR review comments — copy-paste library

Use **one** comment per pull request. Request a small change, then approve after fix.

---

## Test naming

```
Thanks for the PR! Could you rename the dashboard test to something more
specific, e.g. test_dashboard_shows_display_name? That makes failures easier to read.
```

---

## Commit message

```
Nice work on the feature. Please tweak the commit subject to use the scope:
feat(roster): add display_name for dashboard output
```

---

## Missing test

```
Please add a test that asserts display_name appears in format_dashboard_line output.
Run pytest before pushing the update.
```

---

## Scope creep

```
This PR looks good functionally, but please drop the unrelated README edit so the
PR stays focused on display_name. You can open a separate PR for docs.
```

---

## Approval

```
LGTM — thanks for addressing the feedback. Approved from my side.
```
