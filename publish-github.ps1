# One-time: run `gh auth login` in this folder, then run this script again.
# Creates https://github.com/jpdm07/soar-stakeholder-preview (if missing) and pushes main.

$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $RepoRoot

$ghCandidates = @(
  "gh",
  "${env:ProgramFiles}\GitHub CLI\gh.exe",
  "${env:ProgramFiles(x86)}\GitHub CLI\gh.exe"
)
$gh = $null
foreach ($c in $ghCandidates) {
  if ($c -eq "gh") {
    $cmd = Get-Command gh -ErrorAction SilentlyContinue
    if ($cmd) { $gh = $cmd.Source; break }
  } elseif (Test-Path $c) { $gh = $c; break }
}

if (-not $gh) {
  Write-Host "Install GitHub CLI: winget install GitHub.cli"
  exit 1
}

Write-Host "Using: $gh"
cmd /c "`"$gh`" auth status >nul 2>&1"
$authOk = ($LASTEXITCODE -eq 0)
if (-not $authOk) {
  Write-Host ""
  Write-Host ">>> Log in once (browser will open), then re-run this script:"
  Write-Host "    gh auth login"
  exit 1
}

cmd /c "`"$gh`" repo view jpdm07/soar-stakeholder-preview >nul 2>&1"
$exists = ($LASTEXITCODE -eq 0)

if (-not $exists) {
  Write-Host "Creating public repo jpdm07/soar-stakeholder-preview ..."
  & $gh repo create soar-stakeholder-preview --public --description "SOAR stakeholder UX preview (static demo)" --confirm
}

Write-Host "Pushing main ..."
git push -u origin main
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host ""
Write-Host "Done. Share these:"
Write-Host "  Repo:    https://github.com/jpdm07/soar-stakeholder-preview"
Write-Host "  Pages:   https://jpdm07.github.io/soar-stakeholder-preview/"
Write-Host ""
Write-Host "If Pages 404: GitHub repo Settings -> Pages -> Deploy from branch main / (root)."
