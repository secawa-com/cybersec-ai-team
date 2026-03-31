# CYBERSECTEAM Dev Setup (Windows PowerShell)
$ErrorActionPreference = "Stop"

$CybersecDir = $PSScriptRoot

Write-Host "=== CYBERSECTEAM Dev Setup ==="
Write-Host ""
Write-Host "Plugin mode: use 'claude --plugin-dir $CybersecDir' for local testing"
Write-Host ""

# Initialize project-level context directory for testing
$CybersecCtx = ".claude\cybersecteam"
New-Item -ItemType Directory -Force -Path "$CybersecCtx\kb" | Out-Null
Write-Host "  [+] Context directory: $CybersecCtx"

# Check for context files
$contextFiles = @("organization.md", "about-me.md", "strategy.md", "team.md", "governance.md")
$missing = 0
foreach ($cf in $contextFiles) {
    if (-not (Test-Path "$CybersecCtx\$cf")) {
        $missing++
    }
}

Write-Host ""
if ($missing -eq 0) {
    Write-Host "  Pliki kontekstowe: wszystkie obecne"
} else {
    Write-Host "  Pliki kontekstowe: brakuje $missing z $($contextFiles.Count)"
    Write-Host "  Uruchom /cybersecteam:context-setup w Claude Code aby je stworzyc interaktywnie"
}

Write-Host ""
Write-Host "=== Dev Setup gotowy ==="
Write-Host ""
Write-Host "Testowanie lokalne:"
Write-Host "  claude --plugin-dir $CybersecDir"
Write-Host ""
Write-Host "Walidacja:"
Write-Host "  ./dev-check"
Write-Host "  ./dev-check [skill-name]   # np. ./dev-check risk-assess"
