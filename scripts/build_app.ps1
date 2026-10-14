$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot "..")

$ruleWorkbook = Get-ChildItem -LiteralPath "MT" -File -Filter "*.xlsx" |
  Where-Object {
    $_.Name.Normalize([Text.NormalizationForm]::FormC) -eq "Giao phiếu_MT_v1.xlsx"
  } |
  Select-Object -First 1
if (-not $ruleWorkbook) {
  throw "Không tìm thấy workbook quy tắc Miền Trung trong thư mục MT."
}

uv sync --extra packaging
uv run pyinstaller `
  --noconfirm `
  --clean `
  --onedir `
  --windowed `
  --name ATS-OneBSS `
  --collect-all playwright `
  --collect-submodules encodings `
  --add-data "regions.toml;." `
  --add-data "regions/central;regions/central" `
  --add-data "$($ruleWorkbook.FullName);MT" `
  --add-data "assets/vinaphone-logo.png;assets" `
  src/ats_onebss/gui_main.py

$version = uv run python -c "from ats_onebss import __version__; print(__version__)"
Set-Content -LiteralPath "dist/ATS-OneBSS/VERSION.txt" -Value $version -NoNewline -Encoding ascii
Write-Host "Đã tạo ứng dụng Windows Miền Trung trong dist/ATS-OneBSS"
