# TeamPulse

A small fictional internal tool used in the **Git + Cursor Starter Workshop**.

## Quick start

From this `app/` directory:

```bash
pip install -e ".[dev]"
pytest
python -m teampulse
```

## Layout

- `src/teampulse/roster.py` — team member records
- `src/teampulse/status.py` — member status lookup
- `src/teampulse/cli.py` — command-line dashboard
