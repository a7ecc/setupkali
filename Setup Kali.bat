@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
%windir%\System32\choice.exe /c 123 /m "Chouse Setup Number To Run it:"
IF %ERRORLEVEL% EQU 1 goto num1
IF %ERRORLEVEL% EQU 2 goto num2
IF %ERRORLEVEL% EQU 3 goto num3
:num1
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
shutdown /r /f
exit
:num2
start wsl.exe --install
start https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
cls
echo when the setup finish press double ENTER
pause > nul
pause > nul
wsl --set-default-version 2
start ms-windows-store://pdp?productid=9P9TQF7MRM4R^&mode=mini^&pos=0%2C0%2C1920%2C1008^&referrer=storeforweb^&source=https%3A%2F%2Fwww.google.com%2F
cls
echo when the setup finish press double ENTER
pause > nul
pause > nul
start ms-windows-store://pdp?hl=ar-ae^&gl=ae^&rtc=1^&productid=9PKR34TNCV07^&mode=mini^&pos=0%2C0%2C1920%2C1008^&referrer=storeforweb
cls
echo when the setup finish press double ENTER
pause > nul
pause > nul
wsl --unregister kali-linux
exit
:num3
cls
kali run sudo apt update ^&^& sudo apt upgrade -y
kali run sudo apt install kali-desktop-xfce -y
kali run sudo apt install xrdp -y
kali run sudo service xrdp start
kali run sudo apt install dbus-x11
kali run startxfce4