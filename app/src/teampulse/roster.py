"""Team roster — members and their identifiers."""

from dataclasses import dataclass


@dataclass(frozen=True)
class TeamMember:
    """A person on the engineering team."""

    id: str
    name: str
    display_name: str


# Seed roster for the workshop. Learners extend this in Lesson 2 (display_name).
TEAM: tuple[TeamMember, ...] = (
    TeamMember(id="alex", name="Alex Chen", display_name="Alex C."),
    TeamMember(id="jordan", name="Jordan Lee", display_name="Jordan L."),
    TeamMember(id="sam", name="Sam Rivera", display_name="Sam R."),
)


def get_member(member_id: str) -> TeamMember | None:
    """Return the team member with the given id, or None if not found."""
    for member in TEAM:
        if member.id == member_id:
            return member
    return None


def list_members() -> list[TeamMember]:
    """Return all team members."""
    return list(TEAM)
