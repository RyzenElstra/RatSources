unit UnitAVFWDetector;

interface

uses
  Windows,
  TLHelp32;

const
  strAVProcess  : array[0..15] of string =  ('avesvc.exe',
                                             'ashdisp.exe',
                                             'avgcc.exe',
                                             'bdss.exe',
                                             'spider.exe',
                                             'kavsvc.exe',
                                             'nod32krn.exe',
                                             'cclaw.exe',
                                             'dvpapi.exe',
                                             'ewidoctrl.exe',
                                             'mcshield.exe',
                                             'pavfires.exe',
                                             'almon.exe',
                                             'ccapp.exe',
                                             'pccntmon.exe',
                                             'fssm32.exe');
                                             
  strAVName     : array[0..15] of string =  ('AntiVir',
                                             'Avast Antivirus',
                                             'AVG Antivirus',
                                             'BitDefender',
                                             'Dr.Web',
                                             'Kaspersky',
                                             'Nod32',
                                             'Norman',
                                             'Authentium Antivirus',
                                             'Ewido Security Suite',
                                             'McAfee VirusScan',
                                             'Panda Antivirus/Firewall',
                                             'Sophos',
                                             'Symantec/Norton',
                                             'PC-cillin Antivirus',
                                             'F-Secure');

  strFWProcess  : array[0..14] Of string =  ('issvc.exe',
                                             'vsmon.exe',
                                             'cpf.exe',
                                             'ca.exe',
                                             'tnbutil.exe',
                                             'kavpf.exe',
                                             'mpfservice.exe',
                                             'npfmsg.exe',
                                             'outpost.exe',
                                             'tpsrv.exe',
                                             'pavfires.exe',
                                             'kpf4ss.exe',
                                             'persfw.exe',
                                             'vsserv.exe',
                                             'smc.exe');
  strFWName     : array[0..14] Of string =  ('Norton Personal Firewall',
                                             'ZoneAlarm',
                                             'Comodo Firewall',
                                             'eTrust EZ Firewall',
                                             'F-Secure Internet Security',
                                             'Kaspersky Antihacker',
                                             'McAfee Personal Firewall',
                                             'Norman Personal Firewall',
                                             'Outpost Personal Firewall',
                                             'Panda Internet Security Suite',
                                             'Panda Anti-Virus/Firewall',
                                             'Kerio Personal Firewall',
                                             'Tiny Personal Firewall',
                                             'BitDefender / Bull Guard Antivirus',
                                             'Sygate Personal Firewall');

function GetRunningAntiviruses(): string;
function GetRunningFirewalls(): string;
Function Scan(Method: integer): string;
Function LowerCase(Const S: String): String;

implementation

function GetRunningAntiviruses(): string;
begin
Result := Scan(1);
end;

function GetRunningFirewalls(): string;
begin
Result := Scan(2);
end;

Function Scan(Method: integer): string;
Var
  cLoop          :Boolean;
  SnapShot       :THandle;
  L              :TProcessEntry32;
  i              :integer;
  strFirewalls   :string;
  strAntiviruses :string;
Begin
strFirewalls := '';
strAntiviruses := '';
exit;
  SnapShot := CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS or TH32CS_SNAPMODULE, 0);
  L.dwSize := SizeOf(L);
  cLoop := Process32First(SnapShot, L);
  while (Integer(cLoop) <> 0) do begin
    if Method = 1 then begin
      for i := 0 to 15 do begin
        if LowerCase(L.szExeFile) = strAVProcess[i] then
            strAntiviruses := strAntiviruses + strAVName[i] + ',';
      end;
    end;
    if Method = 2 then
    begin
      for i := 0 to 14 do begin
        if LowerCase(L.szExeFile) = strFWProcess[i] then
            strFirewalls := strFirewalls + strFWName[i] + ',';
      end;
    end;
      cLoop := Process32Next(SnapShot, L);
  end;
CloseHandle(SnapShot);

  strAntiviruses := Copy(strAntiviruses,1,Length(strAntiviruses)-1);
  strFirewalls := Copy(strFirewalls,1,Length(strFirewalls)-1);

if Method = 1 then Result := strAntiviruses else Result := strFirewalls;



//Result := strAntiviruses +  strFirewalls;
end;

function LowerCase(const S: string): string;
var
  Ch     :char;
  L      :integer;
  Source :pchar;
  Dest   :pchar;
begin
  L := Length(S);
  SetLength(Result, L);
  Source := Pointer(S);
  Dest   := Pointer(Result);
  while (L <> 0) do
  begin
    Ch := Source^;
   if (Ch >= 'A') and (Ch <= 'Z') then
      Inc(Ch, 32);
    Dest^ := Ch;
    Inc(Source);
    Inc(Dest);
    Dec(L);
  end;
end;

end.
