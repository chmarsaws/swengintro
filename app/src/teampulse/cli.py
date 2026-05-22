"""TeamPulse CLI — print a simple team status dashboard."""

import argparse

from teampulse.roster import list_members
from teampulse.status import format_dashboard_line


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="teampulse",
        description="TeamPulse — team status dashboard (workshop app)",
    )
    return parser


def main(argv: list[str] | None = None) -> int:
    build_parser().parse_args(argv)
    print("TeamPulse Dashboard")
    print("-" * 24)
    for member in list_members():
        print(format_dashboard_line(member))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
