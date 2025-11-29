; Inno Setup Script для File Cleanup Manager
; Created with Antigravity by Serik Muftakhidinov
; Version 1.2.3 (Russian Localization)

[Setup]
AppName=File Cleanup Manager
AppVersion=1.2.3
AppPublisher=Serik Muftakhidinov
DefaultDirName={autopf}\FileCleanupManager
DefaultGroupName=File Cleanup Manager
OutputBaseFilename=FileCleanupManagerSetup_v1.2.3
Compression=lzma2/max
SolidCompression=yes
PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64
UninstallDisplayIcon={app}\CleanupManager.exe
LicenseFile=
InfoBeforeFile=
SetupIconFile=
WizardStyle=modern

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "qlaunchicon"; Description: "Create a &Quick Launch icon"; GroupDescription: "Additional icons:"; Flags: unchecked

[Dirs]
Name: "{commonappdata}\FileCleanupManager"; Permissions: users-modify

[Files]
Source: "CleanupManager.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "README.md"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\File Cleanup Manager"; Filename: "{app}\CleanupManager.exe"
Name: "{group}\Удалить File Cleanup Manager"; Filename: "{uninstallexe}"
Name: "{autodesktop}\File Cleanup Manager"; Filename: "{app}\CleanupManager.exe"; Tasks: desktopicon

[Registry]
; Добавить в автозагрузку (опционально)
;Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; ValueName: "FileCleanupManager"; ValueData: "{app}\CleanupManager.exe"; Flags: uninsdeletevalue

[Run]
Filename: "{app}\CleanupManager.exe"; Description: "{cm:LaunchProgram,File Cleanup Manager}"; Flags: nowait postinstall skipifsilent

[Code]
// Проверка .NET Framework
function IsDotNetInstalled: Boolean;
var
  Exists: Boolean;
  Release: Cardinal;
begin
  Exists := RegQueryDWordValue(HKLM, 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full', 'Release', Release);
  Result := Exists and (Release >= 378389); // .NET 4.5+
end;

function InitializeSetup(): Boolean;
begin
if not IsDotNetInstalled then
  begin
    MsgBox('Требуется установка .NET Framework 4.5 или выше.' + #13#10 + 
           'Пожалуйста, установите .NET Framework и повторите установку.', 
           mbCriticalError, MB_OK);
    Result := False;
  end
  else
    Result := True;
end;
