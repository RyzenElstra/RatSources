unit untHTTPDownload;

interface

Uses
  Windows, urlmon;

  function DownloadFile(SourceFile, DestFile: string): Boolean;
implementation

function DownloadFile(SourceFile, DestFile: string): Boolean;
begin
  try
    Result := UrlDownloadToFile(nil, PChar(SourceFile), PChar(DestFile), 0, nil) = 0;
  except
    Result := False;
  end;
end;



end.

