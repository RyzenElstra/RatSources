unit uWeb;

interface

uses
  Windows, Winsock;

function ResolveDomain(HostName: String): String;

implementation

function ResolveDomain(HostName: String): String;
type
  TAPInAddr = Array[0..100] Of PInAddr;
  PAPInAddr = ^TAPInAddr;
var
  WSAData       :TWSAData;
  HostEntPtr    :PHostEnt;
  PPTR          :PAPInAddr;
  I             :Integer;
label
  Abort;
begin
  Result := '';
  WSAStartUp($101, WSAData);
  try
    HostEntPtr := GetHostByName(pChar(HostName));
    if HostEntPtr = nil then goto Abort;

    PPTR := PAPInAddr(HostEntPtr^.h_addr_list);
    I := 0;
    while PPTR^[I] <> nil do
    begin
      if HostName = '' then
      begin
        if (Pos('168', inet_ntoa(pptr^[I]^))<>1) and (Pos('192', inet_ntoa(pptr^[I]^))<>1) then
        begin
          Result := inet_ntoa(PPTR^[I]^);
          goto Abort;
        end;
      end else
        Result := inet_ntoa(PPTR^[I]^);
      Inc(I);
    end;
Abort:
  except
  end;
  WSACleanUp;
end;

end.
