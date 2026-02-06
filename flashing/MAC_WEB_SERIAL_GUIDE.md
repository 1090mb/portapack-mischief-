# Web Serial Flashing on Mac - Compatibility Guide

This guide provides Mac-specific information for using the web-based firmware flashing tool at [hackrf.app](https://hackrf.app/).

## Overview

The PortaPack Mischief firmware can be updated using a web-based tool (MischiefHub) that runs in your browser and communicates with your HackRF/PortaPack via the Web Serial API. This eliminates the need for command-line tools for most users.

**Access the tool at: [https://hackrf.app/](https://hackrf.app/)**

## Browser Requirements

The Web Serial API is **only supported in specific browsers**:

✅ **Supported Browsers:**
- Google Chrome (recommended)
- Microsoft Edge
- Opera

❌ **NOT Supported:**
- Safari
- Firefox
- Other browsers

**Important:** You **must** use Chrome, Edge, or Opera on your Mac. Safari does not support the Web Serial API.

## Known macOS Compatibility Issues

### Issue: Device Not Found or Connection Failures

macOS has known compatibility issues with the Web Serial API. Users may experience:

- Device not appearing in the browser's port selection dialog
- "No compatible device found" error messages
- Connection failures or timeouts
- Intermittent connectivity issues

### Why These Issues Occur

macOS handles USB serial port permissions and device access differently than Windows and Linux. The Web Serial API implementation in browsers may not always correctly enumerate or access serial devices on macOS due to:

1. **System Integrity Protection (SIP):** macOS security features may restrict USB device access
2. **USB Permission Model:** macOS requires explicit permission grants that may not integrate smoothly with browser APIs
3. **Driver Compatibility:** Some USB-to-serial chipsets may not work reliably with Web Serial on macOS
4. **Browser Implementation:** Web Serial API support on macOS is still maturing

## Troubleshooting Steps for Mac

If you encounter issues connecting to your device via the web interface:

### 1. Basic Checks

- **Use a compatible browser:** Ensure you're using Chrome, Edge, or Opera (not Safari)
- **Update your browser:** Make sure you have the latest version installed
- **Update macOS:** Keep your operating system up to date
- **Check your USB cable:** Use a high-quality USB cable with data support (not charging-only)
- **Try different USB ports:** Some ports may have better compatibility than others
- **Restart Chrome:** Close all Chrome windows and relaunch the browser

### 2. Device Mode Verification

- Your PortaPack must be in **normal mode** (not HackRF mode) to use the web flashing tool
- The screen should show the PortaPack interface, not HackRF mode

### 3. Permission Settings

1. Open **System Settings** (System Preferences on older macOS)
2. Navigate to **Privacy & Security** → **Accessories** or **USB Accessories**
3. Ensure Chrome/Edge is allowed to access USB devices
4. You may need to grant additional permissions when prompted by the browser

### 4. Check Active Connections

Other applications may hold the serial port. Close any software that might be accessing the device:
- Terminal applications (screen, minicom, etc.)
- Serial monitor tools
- Other browser tabs accessing the device

### 5. Browser Developer Console

If connection issues persist, check the browser console for errors:
1. Open Chrome Developer Tools (View → Developer → Developer Tools)
2. Go to the Console tab
3. Look for Web Serial API errors
4. Report detailed error messages when seeking help

### 6. Community Support

If you continue experiencing issues:
- Check the [MischiefHub Issues](https://github.com/1090mb/MischiefHub/issues) page
- Join the [PortaPack Discord](https://discord.gg/tuwVMv3) for community support
- Search for your specific error message in existing discussions

## Alternative Flashing Methods for Mac

If the web-based tool doesn't work on your Mac, you can use traditional command-line tools:

### Method 1: Using hackrf_spiflash (Recommended)

1. Install HackRF tools via Homebrew:
   ```bash
   brew install hackrf
   ```

2. Connect your device via USB

3. Switch to HackRF mode on your PortaPack (select "HackRF" from the main menu)

4. Flash the firmware:
   ```bash
   hackrf_spiflash -w portapack-mischief-firmware.bin
   ```

5. Reboot your device

### Method 2: On-Device Flash Utility

If your device already has a recent firmware version:

1. Download the `.ppfw.tar` firmware file
2. Copy it to your SD card (using a card reader or file transfer)
3. Put the SD card back in your PortaPack
4. Use the "Flash Utility" app from the Utilities menu on your device
5. Select the firmware file and follow on-screen instructions

## Reporting Issues

If you discover new Mac-specific issues or have solutions to share:

1. Check existing issues: [MischiefHub GitHub Issues](https://github.com/1090mb/MischiefHub/issues)
2. Create a new issue with:
   - Your macOS version (e.g., macOS 14.2 Sonoma)
   - Browser and version (e.g., Chrome 120.0.6099.234)
   - Device model (e.g., PortaPack H2, H4M)
   - Complete error messages from the browser console
   - Steps to reproduce the issue

## Additional Resources

- **MischiefHub GitHub:** [https://github.com/1090mb/MischiefHub](https://github.com/1090mb/MischiefHub)
- **Firmware Releases:** [https://github.com/portapack-mischief/mischief-firmware/releases](https://github.com/portapack-mischief/mischief-firmware/releases)
- **General Update Guide:** [https://github.com/portapack-mayhem/mayhem-firmware/wiki/Update-firmware](https://github.com/portapack-mayhem/mayhem-firmware/wiki/Update-firmware)
- **Web Serial API Browser Support:** [https://caniuse.com/web-serial](https://caniuse.com/web-serial)
- **PortaPack Discord:** [https://discord.gg/tuwVMv3](https://discord.gg/tuwVMv3)

---

**Note:** The web-based flashing tool is a community-maintained project that continues to improve Mac compatibility. Check the MischiefHub repository for the latest updates and fixes.
