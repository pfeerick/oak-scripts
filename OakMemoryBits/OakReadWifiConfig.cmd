@ECHO OFF
SET ESPTOOL=esptool.exe

ECHO Oak Read WiFi Config
ECHO ====================
ECHO.
ECHO Available Serial Ports appear to be:
for /f "tokens=4" %%A in ('mode^|findstr "COM[0-9]:"') do echo %%A

ECHO.
set /p COMPort="Which COM port do you want to use (e.g. 3)? "

CHOICE /M "Run esptool to restore an Oak on COM%COMPort%"
IF ERRORLEVEL 2 goto end
IF ERRORLEVEL 1 goto run_esptool
goto end

:run_esptool
%ESPTOOL% --baud 115200 --port COM%COMPort% read_flash 0x100B00 0x000100 flash_wifi_config.bin

:end
pause
