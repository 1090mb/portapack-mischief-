@echo off

echo *** Re-flash the HackRF with PortaPack firmware ***
echo.
echo Connect your HackRF One to a USB port on your computer.
echo.
echo If using a PortaPack, put the PortaPack in HackRF mode by selecting
echo the "HackRF" option from the main menu.
echo.
pause

echo.

REM Check if the firmware file exists
if not exist portapack-mischief-firmware.bin (
    echo The firmware file "portapack-mischief-firmware.bin" does not exist.
    echo Please ensure that you have downloaded the latest release from:
    echo https://github.com/portapack-mischief/mischief-firmware/releases/
    echo.
    pause
    exit /b
)

"utils/hackrf_update.exe" portapack-mischief-firmware.bin
echo.
echo If your device never boots after flashing, please refer to won't boot article"
echo.
echo "click-to-open url: https://github.com/portapack-mischief/mischief-firmware/wiki/Won%%27t-boot"
echo "or"
echo "copy-and-paste url: https://github.com/portapack-mischief/mischief-firmware/wiki/Won't-boot"
echo.
pause
