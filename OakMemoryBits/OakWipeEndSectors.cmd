@ECHO OFF
SET ESPTOOL=esptool.exe

ECHO Oak Wipe End Sectors
ECHO ====================
ECHO.
ECHO Available Serial Ports appear to be:
for /f "tokens=4" %%A in ('mode^|findstr "COM[0-9]:"') do echo %%A

ECHO.
set /p COMPort="Which COM port do you want to use (e.g. 3)? "

CHOICE /M "Run esptool on COM%COMPort%"
IF ERRORLEVEL 2 goto end
IF ERRORLEVEL 1 goto run_esptool
goto end

:run_esptool
%ESPTOOL% --baud 115200 --port COM%COMPort% write_flash -fs 32m 0x3FC000 blank.bin 0x3FD000 blank.bin 0x3FE000 blank.bin 0x3FF000 blank.bin

:end
pause
