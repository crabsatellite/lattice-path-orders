$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$source = Join-Path $projectRoot 'paper\lattice_path_orders.tex'
$paperDirectory = Join-Path $projectRoot 'paper'
$outputDirectory = Join-Path $projectRoot 'output\pdf'
$output = Join-Path $outputDirectory 'lattice_path_orders.pdf'

New-Item -ItemType Directory -Force -Path $outputDirectory | Out-Null
Push-Location $paperDirectory
try {
    & pdflatex -interaction=nonstopmode -halt-on-error 'lattice_path_orders.tex'
    if ($LASTEXITCODE -ne 0) { throw 'first pdflatex pass failed' }
    & bibtex 'lattice_path_orders'
    if ($LASTEXITCODE -ne 0) { throw 'bibtex pass failed' }
    & pdflatex -interaction=nonstopmode -halt-on-error 'lattice_path_orders.tex'
    if ($LASTEXITCODE -ne 0) { throw 'second pdflatex pass failed' }
    & pdflatex -interaction=nonstopmode -halt-on-error 'lattice_path_orders.tex'
    if ($LASTEXITCODE -ne 0) { throw 'third pdflatex pass failed' }
}
finally {
    Pop-Location
}
Copy-Item -LiteralPath (Join-Path $paperDirectory 'lattice_path_orders.pdf') -Destination $output -Force

$log = Get-Content -LiteralPath (Join-Path $paperDirectory 'lattice_path_orders.log') -Raw
if ($log -match 'undefined references|Overfull \\hbox|LaTeX Error') {
    throw 'LaTeX audit found an undefined reference, overfull box, or error'
}
Write-Output $output
