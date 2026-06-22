# ============================================================
# verspreid-huisstijl.ps1
# Kopieert huisstijl.css vanuit deze map naar elke site die de
# huisstijl gebruikt. Een site "doet mee" als er al een
# huisstijl.css in de sitemap staat. Zo blijven andere mappen
# (zoals mijnweer met een eigen stijl) ongemoeid.
#
# Gebruik in PowerShell:
#   cd C:\Lab023\huisstijl
#   .\verspreid-huisstijl.ps1
# ============================================================

$bron  = Join-Path $PSScriptRoot "huisstijl.css"
$basis = Split-Path $PSScriptRoot -Parent          # C:\Lab023

if (-not (Test-Path $bron)) {
    Write-Host "Bronbestand niet gevonden: $bron" -ForegroundColor Red
    exit 1
}

$aantal = 0
Get-ChildItem -Path $basis -Directory |
    Where-Object { $_.FullName -ne $PSScriptRoot } |
    ForEach-Object {
        $doel = Join-Path $_.FullName "huisstijl.css"
        if (Test-Path $doel) {
            Copy-Item $bron $doel -Force
            Write-Host "Bijgewerkt: $($_.Name)" -ForegroundColor Green
            $aantal++
        }
    }

Write-Host ""
Write-Host "Klaar. $aantal site(s) bijgewerkt."
Write-Host "Vergeet niet de bijgewerkte sites naar de webserver te kopieren (scp) en vast te leggen in GitHub."
