unit UnitCpuSpeed;

interface

uses
  Windows;

type
  TPDWord = ^DWORD;

  TSystem_Basic_Information = packed record
    dwUnknown1: DWORD;
    uKeMaximumIncrement: ULONG;
    uPageSize: ULONG;
    uMmNumberOfPhysicalPages: ULONG;
    uMmLowestPhysicalPage: ULONG;
    uMmHighestPhysicalPage: ULONG;
    uAllocationGranularity: ULONG;
    pLowestUserAddress: Pointer;
    pMmHighestUserAddress: Pointer;
    uKeActiveProcessors: ULONG;
    bKeNumberProcessors: byte;
    bUnknown2: byte;
    wUnknown3: word;
  end;

  TSystem_Performance_Information = packed record
    liIdleTime: LARGE_INTEGER; {LARGE_INTEGER}
    dwSpare: array[0..75] of DWORD;
  end;

  TSystem_Time_Information = packed record
    liKeBootTime: LARGE_INTEGER;
    liKeSystemTime: LARGE_INTEGER;
    liExpTimeZoneBias: LARGE_INTEGER;
    uCurrentTimeZoneId: ULONG;
    dwReserved: DWORD;
  end;

const
  SystemBasicInformation = 0;
  SystemPerformanceInformation = 2;
  SystemTimeInformation = 3;



var
  dbSystemTime: Double;
  dbIdleTime: Double;
  THr: dword;
  liOldIdleTime: LARGE_INTEGER = ();
  liOldSystemTime: LARGE_INTEGER = ();
  NtQuerySystemInformation: function(infoClass: DWORD; buffer: Pointer; bufSize: DWORD; returnSize: TPDword): DWORD; stdcall = nil;
  procedure GetCPUUsage;

implementation

function Li2Double(x: LARGE_INTEGER): Double;
begin
  Result := x.HighPart * 4.294967296E9 + x.LowPart
end;

procedure GetCPUUsage;
var
  SysBaseInfo: TSystem_Basic_Information;
  SysPerfInfo: TSystem_Performance_Information;
  SysTimeInfo: TSystem_Time_Information;
  status: Longint; {long}
begin
  if @NtQuerySystemInformation = nil then NtQuerySystemInformation := GetProcAddress(GetModuleHandle('ntdll.dll'),'NtQuerySystemInformation');

  status := NtQuerySystemInformation(SystemBasicInformation, @SysBaseInfo, SizeOf(SysBaseInfo), nil);
  if status <> 0 then Exit;

  while True do begin

    status := NtQuerySystemInformation(SystemTimeInformation, @SysTimeInfo, SizeOf(SysTimeInfo), 0);
    if status <> 0 then Exit;

    status := NtQuerySystemInformation(SystemPerformanceInformation, @SysPerfInfo, SizeOf(SysPerfInfo), nil);
    if status <> 0 then Exit;

    if (liOldIdleTime.QuadPart <> 0) then begin

      // CurrentValue = NewValue - OldValue
      dbIdleTime := Li2Double(SysPerfInfo.liIdleTime) - Li2Double(liOldIdleTime);
      dbSystemTime := Li2Double(SysTimeInfo.liKeSystemTime) - Li2Double(liOldSystemTime);

      // CurrentCpuIdle = IdleTime / SystemTime
      dbIdleTime := dbIdleTime / dbSystemTime;

      // CurrentCpuUsage% = 100 - (CurrentCpuIdle * 100) / NumberOfProcessors
      dbIdleTime := 100.0 - dbIdleTime * 100.0 / SysBaseInfo.bKeNumberProcessors + 0.5;

      // Show Percentage
      //Form1.Caption := FormatFloat('CPU Usage: 0.0 %',dbIdleTime);

    end;

    // store new CPU's idle and system time
    liOldIdleTime := SysPerfInfo.liIdleTime;
    liOldSystemTime := SysTimeInfo.liKeSystemTime;

    // wait one second
    Sleep(1000);
  end;
end;

initialization
  createthread(nil,0,@GetCPUUsage,nil,0,thr);


end.
