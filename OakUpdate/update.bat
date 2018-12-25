@echo off
set /p comport="Enter COM Port of USB-Serial Adapter: "
echo Ensure Oak is attached as shown here and press a key: digistump.com/wiki/oak/serialupdate
pause
echo Updating...
echo esptool --baud 115200 --port %comport%
esptool --baud 115200 --port %comport% write_flash -fs 32m 0x1000 blank.bin 0x2000 firmware_v1.bin 0x101000 blank.bin 0x102000 blank.bin 0x202000 blank.bin 
echo Done
pause