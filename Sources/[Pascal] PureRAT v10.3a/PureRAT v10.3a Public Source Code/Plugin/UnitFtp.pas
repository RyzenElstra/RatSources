unit UnitFtp;

interface

uses
  uftp, UnitFunctions;

function UploadToFtp(Host, User, Pass, Dir, lFile, rFile: string; Port: Word): Boolean;
function DownloadFromFtp(Host, User, Pass, Dir, lFile, rFile: string; Port: Word): Boolean;

implementation

function DownloadFromFtp(Host, User, Pass, Dir, lFile, rFile: string; Port: Word): Boolean;
var
  FTpAccess: tFtpAccess;
begin
  Result := False;
  FTpAccess := tFtpAccess.create(Host, User, Pass, Port);

  if (not Assigned(FTpAccess)) or (not FTpAccess.connected) then
  begin
    FTpAccess.Free;
    Exit;
  end;

  if FTpAccess.SetDir('./' + Dir) = False then
  begin
    FTpAccess.Free;
    Exit;
  end;

  lFile := lFile + '\' + FTpAccess.GetFile(rFile);
  if not FileExists(lFile) then
  begin
    FTpAccess.Free;
    Exit;
  end;

  FTpAccess.Free;
  Result := True;
end;

function UploadToFtp(Host, User, Pass, Dir, lFile, rFile: string; Port: Word): Boolean;
var
  FTpAccess: tFtpAccess;
begin
  Result := False;
  FTpAccess := tFtpAccess.create(Host, User, Pass, Port);

  if (not Assigned(FTpAccess)) or (not FTpAccess.connected) then
  begin
    FTpAccess.Free;
    Exit;
  end;

  if FTpAccess.SetDir('./' + Dir) = False then
  begin
    FTpAccess.Free;
    Exit;
  end;

  if FTpAccess.PutFile(lFile, rFile) = False then
  begin
    FTpAccess.Free;
    Exit;
  end;

  FTpAccess.Free;
  Result := True;
end;

end.
