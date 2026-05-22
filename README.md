# Git + Cursor Starter Workshop

A half-day hands-on workshop for new software engineers. Learners work in a small fictional app (**TeamPulse**) while a facilitator plays teammates: PR reviews, competing commits on `main`, and product tickets.

## For facilitators

1. Publish this folder as its own Git repository (recommended), separate from any parent monorepo.
2. Follow **[facilitator/RUNBOOK.md](facilitator/RUNBOOK.md)** for timing, scripts, and canned review comments.
3. Do not share `facilitator/` paths with learners during the session—they should use **[LEARNER_START.md](LEARNER_START.md)** only.

## For learners

Start here: **[LEARNER_START.md](LEARNER_START.md)**

## Prerequisites

| Tool | Notes |
|------|--------|
| Git | 2.30+ |
| [Cursor](https://cursor.com) | Desktop IDE |
| GitHub account | Clone, push, PRs |
| Python 3.10+ | For TeamPulse tests |
| pytest | Installed via `pip install -e ".[dev]"` in `app/` |

## Repository layout

```
swengintro/
├── LEARNER_START.md      # Learner entry point
├── lessons/              # Four workshop lessons
├── app/                  # TeamPulse mini-app
├── facilitator/          # Facilitator-only runbook and scripts
└── .cursor/rules/        # Cursor project rules (extended in Lesson 4)
```

## License

MIT — use and adapt freely for internal training.
