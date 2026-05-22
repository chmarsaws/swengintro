from teampulse.roster import get_member, list_members


def test_list_members_returns_seed_data():
    members = list_members()
    assert len(members) == 3
    ids = {m.id for m in members}
    assert ids == {"alex", "jordan", "sam"}


def test_get_member_found():
    member = get_member("alex")
    assert member is not None
    assert member.name == "Alex Chen"


def test_get_member_not_found():
    assert get_member("unknown") is None
