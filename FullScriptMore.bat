@echo off

title Full Script

REM Disable Guest Account
net user guest /active:no

REM Turn on Firewall
netsh advfirewall set allprofiles state on

REM Turn on Automatic Updates
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\ Auto Update" /v AUOptions /t REG_DWORD /d 4 /f

REM Telnet
DISM /online /disable-feature /featurename:TelnetClient
DISM /online /disable-feature /featurename:TelnetServer
sc stop "TlntSvr"
sc config "TlntSvr" start= disabled

REM Remote Desktop
sc stop "TermService"
sc config "TermService" start= disabled
sc stop "SessionEnv"
sc config "SessionEnv" start= disabled
sc stop "UmRdpService"
sc config "UmRdpService" start= disabled
sc stop "RemoteRegistry"
sc config "RemoteRegistry" start= disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f

REM Clear DNS Cache
ipconifg /flushdns

pause
