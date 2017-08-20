{
 文件名: ServiceDll.dpr
 概述: 替换由svchost.exe启动的某个系统服务,具体服务由全局变量 ServiceName 决定.

 经测试,生成的DLL文件运行完全正常.
 测试环境: Windows 2003 Server + Delphi 7.0

}

library ServiceDll;

uses
  Windows, WinSvc, SysUtils, Classes;

{ 定义全局变量 }
var
  // 服务控制信息句柄
  SvcStatsHandle : SERVICE_STATUS_HANDLE;
  // 存储服务状态
  dwCurrState : DWORD;
  // 服务名称
  ServiceName : PChar = 'BITS';

{ 调试函数,用于输出调试文本 }
procedure OutPutText(CH:PChar);
var
  FileHandle: TextFile;
  F : Integer;
Begin
  if not FileExists('C:\zztestdll.txt') then  F := FileCreate('C:\zztestdll.txt');
  if F > 0 Then FileClose(F);
  
  AssignFile(FileHandle,'C:\zztestdll.txt');
  Append(FileHandle);
  Writeln(FileHandle,CH);
  Flush(FileHandle);
  CloseFile(FileHandle);
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

{ 与SCM管理器通话 }
function TellSCM(dwState: DWORD; dwExitCode: DWORD; dwProgress: DWORD ): Boolean;
var
  srvStatus : service_status;
begin
  srvStatus.dwServiceType := SERVICE_WIN32_SHARE_PROCESS;
  dwCurrState := dwState;
  srvStatus.dwCurrentState := dwState;
  srvStatus.dwControlsAccepted := SERVICE_ACCEPT_STOP or SERVICE_ACCEPT_PAUSE_CONTINUE or SERVICE_ACCEPT_SHUTDOWN;
  srvStatus.dwWin32ExitCode := dwExitCode;
  srvStatus.dwServiceSpecificExitCode := 0;
  srvStatus.dwCheckPoint := dwProgress;
  srvStatus.dwWaitHint := 1000;
  Result := SetServiceStatus( SvcStatsHandle, srvStatus );
end;

{ Service 控制函数 }
procedure servicehandler(fdwcontrol: integer); stdcall;
begin
  case fdwcontrol of
    SERVICE_CONTROL_STOP:
    begin
      TellSCM( SERVICE_STOP_PENDING, 0, 1 );
      Sleep(10);
      TellSCM( SERVICE_STOPPED, 0, 0 );
    end;

    SERVICE_CONTROL_PAUSE:
    begin
      TellSCM( SERVICE_PAUSE_PENDING, 0, 1 );
      TellSCM( SERVICE_PAUSED, 0, 0 );
    end;

    SERVICE_CONTROL_CONTINUE:
    begin
      TellSCM( SERVICE_CONTINUE_PENDING, 0, 1 );
      TellSCM( SERVICE_RUNNING, 0, 0 );
    end;
    
    SERVICE_CONTROL_INTERROGATE: TellSCM(dwCurrState, 0, 0);
    SERVICE_CONTROL_SHUTDOWN: TellSCM(SERVICE_STOPPED, 0, 0);
  end;
end;

//  改变服务启动模式
function ConfigServiceEx(ServiceName: Pchar): Boolean;
var
  SCManager: SC_Handle;
  Service: SC_Handle;
begin
  Result := False;
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  if SCManager = 0 then Exit;
  try
    Service := OpenService(SCManager, ServiceName, SERVICE_ALL_ACCESS);
    Result := ChangeServiceConfig(Service, SERVICE_WIN32_OWN_PROCESS or SERVICE_INTERACTIVE_PROCESS, SERVICE_AUTO_START,
      SERVICE_NO_CHANGE, nil, nil, nil, nil, nil, nil, nil);
    CloseServiceHandle(Service);
  finally
    CloseServiceHandle(SCManager);
  end;
end;

//  service main函数
procedure ServiceMain(argc : Integer; var argv : pchar ); stdcall;
begin
{ try
  begin
  if ParamStr(1) <> '' then
  svcname := strNew(PChar(ParamStr(1)))
  else  begin
    svcname := strAlloc(10 * Sizeof(Char));
    svcname := 'none';
  end;
  OutPutText(svcname);
  end
  finally
   strdispose(svcname);
  end;
}

 // 注册控制函数
  SvcStatsHandle := RegisterServiceCtrlHandler(ServiceName, @servicehandler);
  if (SvcStatsHandle = 0) then
  begin
    OutPutText('Error in RegisterServiceCtrlHandler');
    exit;
  end else
  begin
    if ConfigServiceEx(ServiceName) then OutPutText('Setting Service AutoRun Done!')
    else OutPutText('Setting Service AutoRun Error!');
  end;

  // 启动服务
  TellSCM(SERVICE_START_PENDING, 0, 1 );
  TellSCM(SERVICE_RUNNING, 0, 0 );
  OutPutText('Service is Running');
  // 这里可以执行我们真正要作的代码
  while ((dwCurrState <> SERVICE_STOP_PENDING) and (dwCurrState <> SERVICE_STOPPED)) do
  begin
    sleep(1000);
  end;
  OutPutText('Service Exit');

end;


// 导出函数列表
exports
  ServiceMain;

{ dll入口点 }
begin
  DllProc := @DLLEntryPoint;
end. 



