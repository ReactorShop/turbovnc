; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
#ifdef WIN64
ArchitecturesInstallIn64BitMode=x64
AppName=TurboVNC 64-bit
AppVerName=TurboVNC 64-bit v{#VERSION} ({#BUILD})
#else
AppName=TurboVNC
AppVerName=TurboVNC v{#VERSION} ({#BUILD})
#endif
AppVersion={#VERSION}
AppPublisher=The VirtualGL Project
AppPublisherURL=http://www.virtualgl.org
AppSupportURL=http://www.virtualgl.org
AppUpdatesURL=http://www.virtualgl.org
DefaultDirName={pf}\TurboVNC
#ifdef WIN64
DefaultGroupName=TurboVNC 64-bit
#else
DefaultGroupName=TurboVNC
#endif
AllowNoIcons=yes
InfoBeforeFile=InstInfo.rtf
Compression=zip/9
WindowVisible=no
DisableStartupPrompt=yes
BackColor=clBlack
BackColor2=clBlue
DirExistsWarning=no
VersionInfoCompany=The VirtualGL Project
VersionInfoDescription=A fast VNC implementation designed for video and 3D apps
VersionInfoVersion={#VERSION}

ChangesAssociations=yes

[Components]
Name: "server"; Description: "TurboVNC Server"; Types: custom;
Name: "viewer"; Description: "TurboVNC Viewer"; Types: full compact custom;
Name: "doc";    Description: "Documentation";   Types: full custom;

[Files]
Source: "{#BLDDIR}\bin\WinVNC.exe"; DestDir: "{app}"; Flags: ignoreversion restartreplace; Components: server
Source: "{#BLDDIR}\bin\VNCHooks.dll"; DestDir: "{app}"; Flags: ignoreversion restartreplace; Components: server
Source: "{#BLDDIR}\bin\vncviewer.exe"; DestDir: "{app}"; Flags: ignoreversion restartreplace; Components: viewer
Source: "{#BLDDIR}\bin\putty.exe"; DestDir: "{app}"; Flags: ignoreversion restartreplace; Components: viewer
Source: "LICENCE.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "WhatsNew.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\TurboVNC-ChangeLog.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "TurboVNC.url"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\vnc_docs\*.png"; DestDir: "{app}\doc"; Flags: ignoreversion; Components: doc
Source: "..\vnc_docs\*.html"; DestDir: "{app}\doc"; Flags: ignoreversion; Components: doc
Source: "..\vnc_docs\LIC*.TXT"; DestDir: "{app}\doc"; Flags: ignoreversion; Components: doc
Source: "..\vnc_docs\LIC*.txt"; DestDir: "{app}\doc"; Flags: ignoreversion; Components: doc
Source: "..\vnc_docs\*.css"; DestDir: "{app}\doc"; Flags: ignoreversion; Components: doc

[Icons]
Name: "{group}\Launch TurboVNC Server";               FileName: "{app}\WinVNC.exe";                                    WorkingDir: "{app}";     Components: server;
Name: "{group}\Show About Box";                       FileName: "{app}\WinVNC.exe";    Parameters: "-about";           WorkingDir: "{app}";     Components: server;
Name: "{group}\Show User Settings";                   FileName: "{app}\WinVNC.exe";    Parameters: "-settings";        WorkingDir: "{app}";     Components: server;
Name: "{group}\TurboVNC Viewer";                      FileName: "{app}\vncviewer.exe";                                 WorkingDir: "{app}";     Components: viewer;
Name: "{group}\TurboVNC Viewer (Listen Mode)";        FileName: "{app}\vncviewer.exe"; Parameters: "-listen";          WorkingDir: "{app}";     Components: viewer;
Name: "{group}\Uninstall TurboVNC";                   FileName: "{uninstallexe}";                                      WorkingDir: "{app}";                        
Name: "{group}\Administration\Install VNC Service";   FileName: "{app}\WinVNC.exe";    Parameters: "-install";         WorkingDir: "{app}";     Components: server;
Name: "{group}\Administration\Remove VNC Service";    FileName: "{app}\WinVNC.exe";    Parameters: "-remove";          WorkingDir: "{app}";     Components: server;
Name: "{group}\Administration\Run Service Helper";    FileName: "{app}\WinVNC.exe";    Parameters: "-servicehelper";   WorkingDir: "{app}";     Components: server;
Name: "{group}\Administration\Show Default Settings"; FileName: "{app}\WinVNC.exe";    Parameters: "-defaultsettings"; WorkingDir: "{app}";     Components: server;
Name: "{group}\Documentation\TurboVNC User's Guide";  FileName: "{app}\doc\index.html";                                WorkingDir: "{app}\doc"; Components: doc;
Name: "{group}\Documentation\Licensing Terms";        FileName: "write.exe";           Parameters: "LICENCE.txt";      WorkingDir: "{app}";     Flags: "useapppaths"
Name: "{group}\Documentation\TurboVNC Web Site";      FileName: "{app}\TurboVNC.url"
Name: "{group}\Documentation\TightVNC Change Log";    FileName: "write.exe";           Parameters: "WhatsNew.txt";     WorkingDir: "{app}";     Flags: "useapppaths"
Name: "{group}\Documentation\TurboVNC Change Log";    FileName: "write.exe";           Parameters: "TurboVNC-ChangeLog.txt"; WorkingDir: "{app}"; Flags: "useapppaths"

[Tasks]
Name: associate; Description: "&Associate .vnc files with TurboVNC Viewer"; GroupDescription: "File associations:"; Components: viewer
Name: installservice; Description: "&Register TurboVNC Server as a system service"; GroupDescription: "Server configuration:"; Components: server; Flags: unchecked; OnlyBelowVersion: 0,6.0

[Registry]
Root: HKCR; Subkey: ".vnc"; ValueType: string; ValueName: ""; ValueData: "VncViewer.Config"; Flags: uninsdeletevalue; Tasks: associate
Root: HKCR; Subkey: "VncViewer.Config"; ValueType: string; ValueName: ""; ValueData: "VNCviewer Config File"; Flags: uninsdeletekey; Tasks: associate
Root: HKCR; Subkey: "VncViewer.Config\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\vncviewer.exe,0"; Tasks: associate
Root: HKCR; Subkey: "VncViewer.Config\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\vncviewer.exe"" -config ""%1"""; Tasks: associate

[Run]
Filename: "{app}\WinVNC.exe"; Parameters: "-silent -reinstall"; Tasks: installservice
Filename: "net"; Parameters: "start WinVNC"; Tasks: installservice; MinVersion: 0,4.0
Filename: "{app}\WinVNC.exe"; Parameters: "-servicehelper"; Tasks: installservice

[UninstallRun]
Filename: "{app}\WinVNC.exe"; Parameters: "-kill"; OnlyBelowVersion: 0,4.0
Filename: "{app}\WinVNC.exe"; Parameters: "-silent -remove";