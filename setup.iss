; Inno Setup script for Music Theory Engine
; Download Inno Setup from https://jrsoftware.org/isinfo.php
; Build: right-click this file -> Compile, or run: ISCC.exe setup.iss

#define MyAppName "Music Theory Engine"
#define MyAppVersion "1.0"
#define MyAppPublisher "Music Theory Engine"
#define MyAppExeName "MusicTheoryEngine.exe"
#define MyAppAssocName MyAppName + " File"
#define MyAppAssocExt ".mte"

[Setup]
AppId={{B4F1A2C3-8D7E-4F6A-9B0C-1E2D3F4A5B6C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=installer
OutputBaseFilename=MusicTheoryEngine_Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
UninstallDisplayIcon={app}\{#MyAppExeName}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "release2\*.dll";     DestDir: "{app}"; Flags: ignoreversion
Source: "release2\*.exe";     DestDir: "{app}"; Flags: ignoreversion
Source: "release2\*.obj";     DestDir: "{app}"; Flags: ignoreversion skipifsourcedoesntexist
Source: "release2\platforms\*"; DestDir: "{app}\platforms"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "release2\styles\*";   DestDir: "{app}\styles";   Flags: ignoreversion recursesubdirs createallsubdirs
Source: "release2\iconengines\*"; DestDir: "{app}\iconengines"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "release2\imageformats\*"; DestDir: "{app}\imageformats"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[UninstallRun]
