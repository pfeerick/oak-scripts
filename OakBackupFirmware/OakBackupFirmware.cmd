@ECHO OFF
SET ESPTOOL=esptool.exe

ECHO Oak Backup Firmware
ECHO ====================
ECHO.
ECHO Available Serial Ports appear to be:
for /f "tokens=4" %%A in ('mode^|findstr "COM[0-9]:"') do echo %%A

ECHO.
set /p COMPort="Which COM port do you want to use (e.g. 3)? "

CHOICE /M "Run esptool to backup the firmware of the Oak on COM%COMPort%"
IF ERRORLEVEL 2 goto end
IF ERRORLEVEL 1 goto run_esptool
goto end

:run_esptool
%ESPTOOL% --baud 115200 --port COM%COMPort% read_flash 0x000000 0x400000 oak_backup.img

:end
pause
