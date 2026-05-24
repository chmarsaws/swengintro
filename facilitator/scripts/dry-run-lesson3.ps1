# Abbreviated dry-run: simulate learner branch + facilitator seed + merge conflict
# Run from repo root after initial git commit: .\facilitator\scripts\dry-run-lesson3.ps1

$ErrorActionPreference = "Stop"
if ($PSVersionTable.PSVersion.Major -ge 7) {
    $PSNativeCommandUseErrorActionPreference = $false
}

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
Set-Location $repoRoot

function Assert($cond, $msg) {
    if (-not $cond) { throw $msg }
}

function Invoke-Git {
    param(
        [string[]]$Command,
        [int[]]$AllowExitCodes = @(0)
    )
    $prev = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    $out = & git @Command 2>&1 | ForEach-Object { "$_" }
    $code = $LASTEXITCODE
    $ErrorActionPreference = $prev
    if ($AllowExitCodes -notcontains $code) {
        throw "git $($Command -join ' ') failed with exit code $code`n$($out -join "`n")"
    }
    return $out
}

Write-Host "=== Dry-run: Lesson 3 merge conflict ===" -ForegroundColor Cyan

if (-not (Test-Path ".git")) {
    throw "Run git init and initial commit first (see README / RUNBOOK)."
}

Invoke-Git -Command @("checkout", "main") | Out-Null
$script:MainBefore = "$(Invoke-Git -Command @('rev-parse', 'HEAD'))".Trim()

try {
    Invoke-Git -Command @("checkout", "-B", "dry-run/learner-l2") | Out-Null

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
'@ | Set-Content "app\src\teampulse\roster.py" -Encoding UTF8

    (Get-Content "app\src\teampulse\status.py" -Raw) `
        -replace 'member\.name', 'member.display_name' |
        Set-Content "app\src\teampulse\status.py" -Encoding UTF8 -NoNewline

    Invoke-Git -Command @("add", "app/src/teampulse/roster.py", "app/src/teampulse/status.py") | Out-Null
    Invoke-Git -Command @("commit", "-m", "feat(roster): add display_name (dry-run learner)") | Out-Null

    Invoke-Git -Command @("checkout", "main") | Out-Null
    & (Join-Path $PSScriptRoot "seed-lesson3-conflict.ps1")

    Invoke-Git -Command @("checkout", "dry-run/learner-l2") | Out-Null
    $mergeOut = (Invoke-Git -Command @("merge", "main") -AllowExitCodes 0, 1) -join "`n"
    Write-Host $mergeOut

    $conflict = Invoke-Git -Command @("diff", "--name-only", "--diff-filter=U")
    Assert ($conflict -contains "app/src/teampulse/status.py") `
        "Expected conflict in status.py; unmerged: $conflict"

    Write-Host "Conflict detected (expected)." -ForegroundColor Yellow

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
    return f"{member.display_name}: [{status}]"
'@ | Set-Content "app\src\teampulse\status.py" -Encoding UTF8

    Invoke-Git -Command @("add", "app/src/teampulse/status.py") | Out-Null
    Invoke-Git -Command @("commit", "-m", "merge: resolve status.py (dry-run)") | Out-Null

    (Get-Content "app/tests/test_cli.py" -Raw) -replace 'Alex Chen', 'Alex C.' |
        Set-Content "app/tests/test_cli.py" -Encoding UTF8
    (Get-Content "app/tests/test_status.py" -Raw) `
        -replace 'DEFAULT_STATUS == "offline"', 'DEFAULT_STATUS == "away"' `
        -replace 'Jordan Lee', 'Jordan L.' |
        Set-Content "app/tests/test_status.py" -Encoding UTF8
    Invoke-Git -Command @("add", "app/tests/test_cli.py", "app/tests/test_status.py") | Out-Null
    Invoke-Git -Command @("commit", "-m", "test: align expectations after merge (dry-run)") | Out-Null

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
    if ($script:MainBefore) {
        Invoke-Git -Command @("checkout", "main") | Out-Null
        Invoke-Git -Command @("reset", "--hard", $script:MainBefore) | Out-Null
        $ErrorActionPreference = "Continue"
        git branch -D dry-run/learner-l2 2>&1 | Out-Null
    }
}
