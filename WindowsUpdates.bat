@echo off

title Enable Updates
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Auto Update" /v AUOptions /t /REG_DWORD /d 4 /f

pause



