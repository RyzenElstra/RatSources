unit uWindows;

interface
uses windows,magicapihooks;
type
  TWindows = class
  private
  public
    function GetWindows(): string;
    procedure Maximize(Handle: HWND);
    procedure CloseWindow(Handle: HWND);
    procedure Minimize(Handle: HWND);
  end;
var
  Windows: TWindows;
  sWindowList:String;
implementation
procedure TWindows.CloseWindow(Handle: HWND);
begin
  SendMessage(Handle, 16, 0, 0);
end;
procedure TWindows.Maximize(Handle: HWND);
begin
  ShowWindow(Handle, SW_MAXIMIZE);
end;

procedure TWindows.Minimize(Handle: HWND);
begin
  ShowWindow(Handle, SW_MINIMIZE);
end;

function TWindows.GetWindows(): string;
  function EnumWindowProc(Hwnd: HWND; i: integer): boolean; stdcall;
  var
    Titulo, estado: string;
    PLACE:    TWindowPlacement;
  begin
    if (Hwnd = 0) then
    begin
      Result := False;
    end
    else
    begin
      SetLength(Titulo, 255);
      SetLength(Titulo, GetWindowText(Hwnd, PChar(Titulo), Length(Titulo)));
      PLACE.length := SizeOf(PLACE);
      GetWindowPlacement(hWnd, @PLACE);
      if PLACE.showCmd = SW_SHOWMAXIMIZED then
        estado := ' Maximized'
        else if PLACE.showCmd = SW_SHOWNORMAL then
        estado := ' Normal'
        else if PLACE.showCmd = SW_SHOWMINIMIZED then
        estado := ' Minimized';
      if IsWindowVisible(Hwnd) and (Titulo <> '') then
      begin
        sWindowList := sWindowList  + '|'+ Titulo + '#' + IntToStr(Hwnd) + '#' + estado;
      end;
      Result := True;
    end;
  end;
begin
  sWindowList := '';
  EnumWindows(@EnumWindowProc, 0);
  Result := sWindowList;
end;
end.
 