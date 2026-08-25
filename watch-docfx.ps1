# watch-and-serve.ps1
# Place this in your docfx project root (next to docfx.json).
# - Starts "docfx serve _site" in a separate PowerShell window
# - Watches docs folder (and subfolders) and runs "docfx build" on changes
# - Streams docfx build output in this window

Set-StrictMode -Version Latest
$ErrorActionPreference = "Continue"

# --- CONFIG ---
# path to watch relative to script (set to project folder where your .md/.yml live)
$watchRelativePath = "docs"
# folder produced by docfx build (passed to docfx serve)
$siteFolder = "_site"
# debounce time in seconds (how long to wait after last FS event before rebuilding)
$debounceSeconds = 0.6
# path to docfx command, if not in PATH set full exe path here:
$docfxCmd = "docfx"
# ------------------

# resolve script dir and switch to it
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

# ensure watch path exists (if not, warn and still watch project root)
$watchPath = Join-Path $scriptDir $watchRelativePath
if (-not (Test-Path $watchPath)) {
    Write-Warning "Watch path '$watchPath' does not exist. Falling back to project root."
    $watchPath = $scriptDir
}

# Start server in a new CMD window (robust with spaces in paths)
try {
    # /k keeps the window open; cd /d switches drive & dir; everything is fully quoted
    $cmdLine = "cd /d `"$scriptDir`" && `"$docfxCmd`" serve `"$siteFolder`" --port 5000"
    Start-Process -FilePath "cmd.exe" -ArgumentList @('/k', $cmdLine) -WindowStyle Normal
    Write-Host "Started docfx server in a new window (serving: $siteFolder)."
}
catch {
    Write-Warning "Could not start server window automatically: $($_.Exception.Message)"
    Write-Host "You can start it manually with: docfx serve $siteFolder"
}

# Initial build so site exists before serving
Write-Host "`nRunning initial build..." -ForegroundColor Cyan
& $docfxCmd build 2>&1 | ForEach-Object { Write-Host $_ }
if ($LASTEXITCODE -ne 0) {
    Write-Warning "Initial docfx build finished with exit code $LASTEXITCODE. Check errors above."
} else {
    Write-Host "Initial build succeeded." -ForegroundColor Green
}

# FileSystemWatcher setup
$fsw = New-Object System.IO.FileSystemWatcher
$fsw.Path = $watchPath
$fsw.IncludeSubdirectories = $true
$fsw.Filter = "*.*"
$fsw.EnableRaisingEvents = $true

# Variables used for debounce logic
$global:pendingRebuild = $false
$global:lastEventTime = Get-Date

$onChange = {
    # update lastEventTime and flag rebuild pending
    $global:lastEventTime = Get-Date
    $global:pendingRebuild = $true
}

# Register events
$regs = @()
$regs += Register-ObjectEvent $fsw Changed -Action $onChange
$regs += Register-ObjectEvent $fsw Created -Action $onChange
$regs += Register-ObjectEvent $fsw Renamed -Action $onChange
$regs += Register-ObjectEvent $fsw Deleted -Action $onChange

Write-Host "`nWatching: $watchPath (subfolders included). Press Ctrl+C in this window to stop." -ForegroundColor Cyan

# Main loop: check pendingRebuild and debounce
try {
    while ($true) {
        Start-Sleep -Milliseconds 200

        if ($global:pendingRebuild) {
            $idle = (Get-Date) - $global:lastEventTime
            if ($idle.TotalSeconds -ge $debounceSeconds) {
                # consume the rebuild flag
                $global:pendingRebuild = $false

                Write-Host "`nChange(s) detected at $($global:lastEventTime). Rebuilding..." -ForegroundColor Yellow
                $start = Get-Date

                # run docfx build and stream output (stdout + stderr)
                & $docfxCmd build 2>&1 | ForEach-Object { Write-Host $_ }

                if ($LASTEXITCODE -ne 0) {
                    Write-Host "docfx build finished with exit code $LASTEXITCODE." -ForegroundColor Red
                } else {
                    $duration = (Get-Date) - $start
                    Write-Host ("Build succeeded in {0:N2} s." -f $duration.TotalSeconds) -ForegroundColor Green
                }
            }
        }
    }
}
catch [System.Exception] {
    Write-Error "Watcher loop failed: $($_.Exception.Message)"
}
finally {
    # clean up registered events
    foreach ($r in $regs) { Unregister-Event -SourceIdentifier $r.Name -ErrorAction SilentlyContinue }
    $fsw.Dispose()
}
