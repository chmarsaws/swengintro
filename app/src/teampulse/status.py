"""Member status — online, away, or offline."""

from teampulse.roster import TeamMember, list_members

# Workshop baseline: unknown members default to offline.
# Lesson 3: learners and the facilitator both edit this block — expect a merge conflict.
DEFAULT_STATUS = "offline"

VALID_STATUSES = frozenset({"online", "away", "offline"})

# Seed status map (member id -> status)
_STATUSES: dict[str, str] = {
    "alex": "online",
    "jordan": "away",
    "sam": "offline",
}


def get_status(member: TeamMember) -> str:
    """Return the current status for a team member."""
    return _STATUSES.get(member.id, DEFAULT_STATUS)


def set_status(member_id: str, status: str) -> None:
    """Update status for a member. Raises ValueError if status is invalid."""
    if status not in VALID_STATUSES:
        raise ValueError(f"Invalid status: {status!r}. Must be one of {sorted(VALID_STATUSES)}")
    _STATUSES[member_id] = status


def format_dashboard_line(member: TeamMember) -> str:
    """Format one line for the CLI dashboard."""
    status = get_status(member)
    return f"{member.name}: {status}"
