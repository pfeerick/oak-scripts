@echo off

ECHO Oak Debug Build Script
ECHO.
ECHO Available Serial Ports appear to be:

for /f "tokens=4" %%A in ('mode^|findstr "COM[0-9]:"') do echo %%A
ECHO.
set /p COMPort="Which COM port do you want to use? "

CHOICE /M "Run esptool to restore an Oak on COM%COMPort%"
IF ERRORLEVEL 2 goto end
IF ERRORLEVEL 1 goto run_esptool
goto end

:run_esptool
esptool --baud 115200 --port COM%COMPort% write_flash -fs 32m 0x1000 blank.bin 0x0002000 OakSystem_debug_noparticle.bin 0x0081000 oakupdate_restore.bin 0x101000 blank.bin 0x102000 blank.bin 0x202000 blank.bin 
goto end

:end
pause