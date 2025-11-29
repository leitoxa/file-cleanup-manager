# 🗑️ File Cleanup Manager

![Version](https://img.shields.io/badge/version-1.2.2-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Platform](https://img.shields.io/badge/platform-Windows-lightgrey)
![.NET](https://img.shields.io/badge/.NET-4.5+-purple)

Native Windows application for automatic file cleanup with Telegram notifications support.

## ✨ Features

- 🎨 **Modern Dark-themed GUI** - Beautiful and intuitive interface
- 📂 **Flexible File Filtering** - Filter by file extensions with auto-detection
- ⏰ **Scheduled Cleanup** - Runs as Windows Service with configurable intervals
- 🔔 **Telegram Notifications** - Get notified about cleanup events and service status
- 🔍 **Auto-Extension Scanning** - Automatically detect file types in folder
- 📊 **Detailed Logging** - All operations logged to `cleanup.log`
- 💾 **Persistent Configuration** - Settings saved in ProgramData (survives reinstallation)
- �️ **Recycle Bin Support** - Safe deletion with optional recycle bin usage
- 🔒 **TLS 1.2 Support** - Works on Windows Server 2012 and Windows 7+

## 🚀 Quick Start

### Download & Install

Download the latest installer from [Releases](../../releases):
- **FileCleanupManagerSetup_v1.2.2.exe** (~100 KB)

Run the installer and follow the setup wizard.

### Configuration

1. Launch "File Cleanup Manager" from Start Menu
2. **Set Cleanup Folder**: Choose the folder to monitor
3. **Set Retention Period**: Files older than X days will be deleted
4. **Configure Extensions**: Filter by file types (e.g., `.log`, `.tmp`) or leave empty for all files
5. **Set Check Interval**: How often to run cleanup (in minutes, recommended: 60)
6. **Configure Telegram** (optional): Click "🔔 Telegram" button

### Install as Windows Service

1. Click **"Install"** in the Service Management section
2. Click **"Start"** to begin automatic cleanup
3. Service will run in the background and perform scheduled cleanups

**Note:** Administrator rights are required for service installation.

## 🔔 Telegram Notifications

See [TELEGRAM_SETUP.md](TELEGRAM_SETUP.md) for detailed setup instructions.

**Quick Setup:**
1. Create a bot via [@BotFather](https://t.me/BotFather)
2. Get your Chat ID via [@userinfobot](https://t.me/userinfobot)
3. Click "🔔 Telegram" in the app and enter bot token and chat ID
4. Click "Save" and "Test" to verify

### TLS 1.2 Fix for Windows Server 2012

If Telegram notifications don't work on Windows Server 2012, run:
```cmd
enable_tls12.reg
```
Then restart your server.

## 📝 Building from Source

### Requirements
- Windows 7 or newer
- .NET Framework 4.5+ (included in Windows 10/11)

### Build

```cmd
build.bat
```

This will create `CleanupManager.exe` (~26 KB).

### Create Installer

```cmd
build_installer.bat
```

Requires [Inno Setup](https://jrsoftware.org/isinfo.php) installed.

Output: `Output\FileCleanupManagerSetup_v1.2.2.exe`

## 📂 Project Structure

```
file-cleanup-manager/
├── CleanupManager.cs          # Main source code
├── build.bat                  # Compilation script
├── build_installer.bat        # Installer build script
├── installer.iss              # Inno Setup configuration
├── enable_tls12.reg           # TLS 1.2 fix for Server 2012
├── TELEGRAM_SETUP.md          # Telegram setup guide
├── INSTALLER_GUIDE.md         # Installer creation guide
└── Output/                    # Compiled installer output
    └── FileCleanupManagerSetup_v1.2.2.exe
```

## ⚙️ Configuration

Settings are stored in:
```
C:\ProgramData\FileCleanupManager\config.json
```

Example configuration:
```json
{
    "folder_path": "C:\\Temp",
    "days_old": 7,
    "recursive": false,
    "use_recycle_bin": true,
    "interval_minutes": 60,
    "file_extensions": [".log", ".tmp"],
    "telegram_bot_token": "YOUR_BOT_TOKEN",
    "telegram_chat_id": "YOUR_CHAT_ID"
}
```

## 🛠️ Usage

### GUI Mode
```cmd
CleanupManager.exe
```

### Command Line

**Install Service:**
```cmd
CleanupManager.exe /install
```

**Uninstall Service:**
```cmd
CleanupManager.exe /uninstall
```

**Run as Service (manual):**
```cmd
CleanupManager.exe /service
```

## ⚠️ Important Notes

1. **Administrator Rights**: Required for service installation/management
2. **Backup Important Data**: Always backup before configuring cleanup
3. **Test First**: Use "Preview" and "Test Run" buttons before installing service
4. **Permanent Deletion**: Files are deleted permanently (unless recycle bin is enabled)
5. **System Folders**: DO NOT use on Windows, Program Files, or System32 folders

## 🔧 Requirements

- **OS**: Windows 7 / Server 2012 or newer
- **Framework**: .NET Framework 4.5+ (built-in on Windows 10/11)
- **Permissions**: Administrator rights for service operations

## 📊 Technical Details

- **Language**: C# 5.0
- **Framework**: .NET Framework 4.5
- **GUI**: Windows Forms
- **JSON**: System.Web.Extensions (JavaScriptSerializer)
- **Service**: System.ServiceProcess
- **File Size**: ~26 KB (executable), ~100 KB (installer)
- **Dependencies**: None (all system libraries)

## 🆘 Troubleshooting

**Telegram notifications not working on Server 2012:**
- Run `enable_tls12.reg` to enable TLS 1.2
- Restart server
- Check `C:\ProgramData\FileCleanupManager\cleanup.log` for errors

**Service won't start:**
- Verify folder path exists
- Check permissions on target folder
- Review logs in `cleanup.log`
- Reinstall service (Uninstall → Install)

**Build errors:**
- Ensure .NET Framework 4.5+ is installed
- Check compiler path in `build.bat`
- Run Command Prompt as Administrator

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Serik Muftakhidinov**

Developed with AI assistance from Google Deepmind (Gemini 2.0).

## 🆕 Version History

### v1.2.2 (Current)
- ✅ Fixed Telegram settings persistence
- ✅ Enhanced error logging with detailed diagnostics
- ✅ Configuration stored in ProgramData (survives reinstallation)

### v1.2.0
- ✅ TLS 1.2 support for Windows Server 2012
- ✅ Telegram notifications for service events
- ✅ Auto-extension scanning
- ✅ Modern dark-themed GUI

### v1.0
- Initial release with basic cleanup functionality

## � Links

- [Telegram Setup Guide](TELEGRAM_SETUP.md)
- [Installer Build Guide](INSTALLER_GUIDE.md)
- [GitHub Releases](../../releases)

---

**Note**: This is a native C# application with minimal dependencies and small footprint (~26 KB). Perfect for servers and production environments where you need reliable, scheduled file cleanup with notifications.
