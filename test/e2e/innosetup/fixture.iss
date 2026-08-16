#define AppName "innoextract e2e fixture"
#define AppVersion "1.0.0"

[Setup]
AppId={{6A8E5377-C325-44D8-9EB0-D57D63F16E30}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher=innoextract
DefaultDirName={pf}\innoextract-e2e
DefaultGroupName=innoextract e2e
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputBaseFilename=innoextract-e2e
Compression=lzma2
SolidCompression=yes
PrivilegesRequired=lowest
Uninstallable=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Types]
Name: "full"; Description: "Full installation"

[Components]
Name: "main"; Description: "Main files"; Types: full; Flags: fixed

[Tasks]
Name: "desktopicon"; Description: "Create a desktop icon"; Components: main; Flags: unchecked

[Dirs]
Name: "{app}\empty"; Components: main

[Files]
Source: "payload\hello.txt"; DestDir: "{app}"; Components: main; Flags: ignoreversion
Source: "payload\nested\config.ini"; DestDir: "{app}\nested"; Components: main; Flags: ignoreversion
Source: "payload\script-data.txt"; DestDir: "{app}\data"; Components: main; Check: ShouldInstall; Flags: ignoreversion

[Icons]
Name: "{group}\innoextract e2e fixture"; Filename: "{app}\hello.txt"; Tasks: desktopicon

[INI]
Filename: "{app}\fixture.ini"; Section: "fixture"; Key: "version"; String: "{#AppVersion}"

[Registry]
Root: HKCU; Subkey: "Software\innoextract-e2e"; ValueType: string; ValueName: "Version"; ValueData: "{#AppVersion}"

[Run]
Filename: "{app}\hello.txt"; WorkingDir: "{app}"; Flags: shellexec; Check: ShouldInstall

[Code]
function ShouldInstall(): Boolean;
begin
  Result := True;
end;
