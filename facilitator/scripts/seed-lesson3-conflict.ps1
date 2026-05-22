# Seeds a commit on main that conflicts with learner Lesson 2/3 work in status.py
# Run from repo root: .\facilitator\scripts\seed-lesson3-conflict.ps1

$ErrorActionPreference = "Stop"
if ($PSVersionTable.PSVersion.Major -ge 7) {
    $PSNativeCommandUseErrorActionPreference = $false
}

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
Set-Location $repoRoot

$statusFile = Join-Path $repoRoot "app\src\teampulse\status.py"
$content = Get-Content $statusFile -Raw

if ($content -match 'DEFAULT_STATUS = "away"' -and $content -match 'FACILITATOR: shipped on main') {
    Write-Host "Conflict seed already applied on current branch. Skipping."
    exit 0
}

$newContent = $content -replace `
    '(?s)(# Workshop baseline: unknown members default to offline\.\r?\n# Lesson 3: learners and the facilitator both edit this block — expect a merge conflict\.\r?\n)DEFAULT_STATUS = "offline"', `
    '$1# FACILITATOR: shipped on main during Lesson 3 — learners merge this change.
DEFAULT_STATUS = "away"'

if ($newContent -eq $content) {
    Write-Error "Could not apply conflict seed transformation. Check status.py format."
}

Set-Content -Path $statusFile -Value $newContent -NoNewline

$prev = $ErrorActionPreference
$ErrorActionPreference = "Continue"
git add $statusFile 2>&1 | Out-Null
git commit -m "feat(status): default unknown members to away (enterprise sync)" 2>&1 | Out-Null
$ErrorActionPreference = $prev

Write-Host ""
Write-Host "Committed conflict seed on current branch."
Write-Host "If you are on main, run: git push origin main"
Write-Host ""
