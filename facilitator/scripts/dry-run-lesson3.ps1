# Abbreviated dry-run: simulate learner branch + facilitator seed + merge conflict
# Run from repo root after initial git commit: .\facilitator\scripts\dry-run-lesson3.ps1

$ErrorActionPreference = "Stop"
$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
Set-Location $repoRoot

function Assert($cond, $msg) {
    if (-not $cond) { throw $msg }
}

Write-Host "=== Dry-run: Lesson 3 merge conflict ===" -ForegroundColor Cyan

if (-not (Test-Path ".git")) {
    throw "Run git init and initial commit first (see README / RUNBOOK)."
}

$mainBranch = git rev-parse --abbrev-ref HEAD
git checkout main 2>$null

# Snapshot main before experiment
$mainBefore = git rev-parse HEAD

try {
    # --- Learner branch with display_name (Lesson 2 simulation) ---
    git checkout -B dry-run/learner-l2

    @'
"""Team roster — members and their identifiers."""

from dataclasses import dataclass


@dataclass(frozen=True)
class TeamMember:
    """A person on the engineering team."""

    id: str
    name: str
    display_name: str


TEAM: tuple[TeamMember, ...] = (
    TeamMember(id="alex", name="Alex Chen", display_name="Alex C."),
    TeamMember(id="jordan", name="Jordan Lee", display_name="Jordan L."),
    TeamMember(id="sam", name="Sam Rivera", display_name="Sam R."),
)


def get_member(member_id: str) -> TeamMember | None:
    for member in TEAM:
        if member.id == member_id:
            return member
    return None


def list_members() -> list[TeamMember]:
    return list(TEAM)
'@ | Set-Content "app\src\teampulse\roster.py" -Encoding utf8NoBOM

    (Get-Content "app\src\teampulse\status.py" -Raw) `
        -replace 'member\.name', 'member.display_name' |
        Set-Content "app\src\teampulse\status.py" -Encoding utf8NoBOM -NoNewline

    git add app/src/teampulse/roster.py app/src/teampulse/status.py
    git commit -m "feat(roster): add display_name (dry-run learner)" | Out-Null

    # --- Facilitator seed on main ---
    git checkout main
    & (Join-Path $PSScriptRoot "seed-lesson3-conflict.ps1")

    # --- Merge and expect conflict ---
    git checkout dry-run/learner-l2
    $mergeOut = git merge main 2>&1 | Out-String
    Write-Host $mergeOut

    $conflict = git diff --name-only --diff-filter=U
    Assert ($conflict -contains "app/src/teampulse/status.py") `
        "Expected conflict in status.py; unmerged: $conflict"

    Write-Host "Conflict detected (expected)." -ForegroundColor Yellow

    # Resolve: facilitator default + learner display_name
    @'
"""Member status — online, away, or offline."""

from teampulse.roster import TeamMember, list_members

# Workshop baseline: unknown members default to offline.
# Lesson 3: learners and the facilitator both edit this block — expect a merge conflict.
# FACILITATOR: shipped on main during Lesson 3 — learners merge this change.
DEFAULT_STATUS = "away"

VALID_STATUSES = frozenset({"online", "away", "offline"})

_STATUSES: dict[str, str] = {
    "alex": "online",
    "jordan": "away",
    "sam": "offline",
}


def get_status(member: TeamMember) -> str:
    return _STATUSES.get(member.id, DEFAULT_STATUS)


def set_status(member_id: str, status: str) -> None:
    if status not in VALID_STATUSES:
        raise ValueError(f"Invalid status: {status!r}. Must be one of {sorted(VALID_STATUSES)}")
    _STATUSES[member_id] = status


def format_dashboard_line(member: TeamMember) -> str:
    status = get_status(member)
    return f"{member.display_name}: {status}"
'@ | Set-Content "app\src\teampulse\status.py" -Encoding utf8NoBOM

    git add app/src/teampulse/status.py
    git commit -m "merge: resolve status.py (dry-run)" | Out-Null

    Push-Location app
    pytest -q
    $pytestExit = $LASTEXITCODE
    Pop-Location
    Assert ($pytestExit -eq 0) "pytest failed after merge resolution"

    Write-Host ""
    Write-Host "=== Dry-run PASSED ===" -ForegroundColor Green
    Write-Host "Conflict in status.py, merge resolved, pytest green."
}
finally {
    git checkout main | Out-Null
    git reset --hard $mainBefore | Out-Null
    git branch -D dry-run/learner-l2 2>$null | Out-Null
}
