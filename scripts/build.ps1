$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$src = Join-Path $root 'src\\scss'
$distDir = Join-Path $root 'dist'
$distFile = Join-Path $distDir 'jellyfin.css'

$orderedFiles = @(
    '_tokens.scss',
    '_base.scss',
    '_shell.scss',
    '_home.scss',
    '_details.scss',
    '_login.scss',
    '_dashboard.scss',
    '_player.scss',
    '_responsive.scss'
)

if (-not (Test-Path -LiteralPath $distDir)) {
    New-Item -ItemType Directory -Path $distDir | Out-Null
}

$timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
$builder = New-Object System.Collections.Generic.List[string]
$builder.Add('/* jellyfin-css build output */')
$builder.Add("/* generated: $timestamp */")
$builder.Add('/* source entrypoint: src/scss/index.scss */')
$builder.Add('')

foreach ($file in $orderedFiles) {
    $path = Join-Path $src $file
    if (-not (Test-Path -LiteralPath $path)) {
        throw "Missing source file: $path"
    }

    $builder.Add("/* ===== $file ===== */")
    $builder.Add((Get-Content -LiteralPath $path -Raw).Trim())
    $builder.Add('')
}

$content = [string]::Join([Environment]::NewLine, $builder)
[System.IO.File]::WriteAllText($distFile, $content, [System.Text.Encoding]::UTF8)

Write-Output "Built $distFile"
