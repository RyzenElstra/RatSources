{
  服务处理单元
}
unit WinSvcUnit;

interface

uses
  Windows, WinSvc, WinSvcEx;

procedure InstallServiceEx(lpServiceName, lpDisplayName, lpValue, lpFileName: Pchar);
procedure StartServiceEx(Machine, ServiceName: Pchar);
procedure UninstallServiceEx(lpServiceName: Pchar; stStatus: TServiceStatus);
function ConfigServiceEx(ServiceName: Pchar; dwStatus: DWORD): Boolean;

implementation

{
  函数功能: 安装一个服务
  输入参数:
    1.服务名称
    2.显示名称
    3.服务说明
    4.程序名称
}
procedure InstallServiceEx(lpServiceName, lpDisplayName, lpValue, lpFileName: Pchar);
var
  SCManager: SC_HANDLE;
  srvdesc: PServiceDescription;
  Service: SC_HANDLE;
  lpArgs, lpDesc: Pchar;
begin
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  if SCManager = 0 then Exit;
  try
    Service := CreateService(SCManager, lpServiceName, lpDisplayName, SERVICE_ALL_ACCESS, SERVICE_WIN32_OWN_PROCESS or SERVICE_INTERACTIVE_PROCESS, SERVICE_AUTO_START, SERVICE_ERROR_IGNORE, lpFileName, nil, nil, nil, nil, nil);
    lpArgs := nil;
    if Assigned(ChangeServiceConfig2) then//改变服务说明
    begin
      lpDesc := lstrcpy(lpDesc, lpValue);
      GetMem(srvdesc, SizeOf(TServiceDescription));
      GetMem(srvdesc^.lpDescription, lstrlen(lpDesc) + 1);
      try
        lpDesc := lstrcpy(srvdesc^.lpDescription, lpDesc);
        ChangeServiceConfig2(Service, SERVICE_CONFIG_DESCRIPTION, srvdesc);
      finally
        FreeMem(srvdesc^.lpDescription);
        FreeMem(srvdesc);
      end;
    end;
    StartService(Service, 0, lpArgs);
    CloseServiceHandle(Service);
  finally
    CloseServiceHandle(SCManager);
  end;
end;

{
  函数功能: 启动一个已存在的服务
  输入参数:
    1.机器名称
    2.服务名称
}
procedure StartServiceEx(Machine, ServiceName: Pchar);
var
  SCManager: SC_Handle;
  Service: SC_Handle;
  Args: pchar;
begin
  SCManager := OpenSCManager(Machine, nil, SC_MANAGER_ALL_ACCESS);
  if SCManager = 0 then Exit;
  try
    Service := OpenService(SCManager, ServiceName, SERVICE_ALL_ACCESS);
    Args := nil;
    StartService(Service, 0, Args);
    CloseServiceHandle(Service);
  finally
    CloseServiceHandle(SCManager);
  end;
end;

{
  函数功能: 停止并删除一个服务
  输入参数:
    1.服务名称
    2.服务状态
}
procedure UninstallServiceEx(lpServiceName: Pchar; stStatus: TServiceStatus);
var
  SCManager: SC_HANDLE;
  Service: SC_HANDLE;
begin
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  if SCManager = 0 then Exit;
  try
    Service := OpenService(SCManager, lpServiceName, SERVICE_ALL_ACCESS);
    ControlService(Service, SERVICE_CONTROL_STOP, stStatus);
    DeleteService(Service);
    CloseServiceHandle(Service);
  finally
    CloseServiceHandle(SCManager);
  end;
end;

{
  函数功能: 改变服务启动模式
  输入参数:
    1.服务名称
    2.服务状态
}
function ConfigServiceEx(ServiceName: Pchar; dwStatus: DWORD): Boolean;
var
  SCManager: SC_Handle;
  Service: SC_Handle;
begin
  Result := False;
  SCManager := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  if SCManager = 0 then Exit;
  try
    Service := OpenService(SCManager, ServiceName, SERVICE_ALL_ACCESS);
    Result := ChangeServiceConfig(Service, SERVICE_WIN32_OWN_PROCESS or SERVICE_INTERACTIVE_PROCESS, dwStatus,
      SERVICE_NO_CHANGE, nil, nil, nil, nil, nil, nil, nil);
    CloseServiceHandle(Service);
  finally
    CloseServiceHandle(SCManager);
  end;
end;

end.
