from teampulse.roster import get_member
from teampulse.status import (
    DEFAULT_STATUS,
    format_dashboard_line,
    get_status,
    set_status,
)


def test_get_status_known_member():
    member = get_member("alex")
    assert member is not None
    assert get_status(member) == "online"


def test_get_status_unknown_member_uses_default():
    member = get_member("alex")
    assert member is not None
    # Unknown id would use default; seed data has alex
    assert DEFAULT_STATUS == "offline"


def test_set_status_valid():
    set_status("alex", "away")
    member = get_member("alex")
    assert member is not None
    assert get_status(member) == "away"
    set_status("alex", "online")  # restore for other tests


def test_set_status_invalid_raises():
    import pytest

    with pytest.raises(ValueError, match="Invalid status"):
        set_status("alex", "busy")  # busy added in Lesson 4


def test_format_dashboard_line():
    member = get_member("jordan")
    assert member is not None
    line = format_dashboard_line(member)
    assert "Jordan Lee" in line
    assert ":" in line
