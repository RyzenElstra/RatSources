unit uCryptoGear;

{*****************************************************************************
*
*  CryptoGear Encryption Algorithm
*  Delphi version
*
*	 Author: Viotto
*	 Official website: Breaking-Security.Net
*
*	 This algorithm and code can be freely used,
*	 as long as you keep reference and credit to author and website.
*
******************************************************************************}

interface

const
  MODE_ECB = 0;
  MODE_CBC = 1;
  g_lenKeystream = 256;

type
  TByteArray = array of Byte;

  CCryptoGear = class
  private
    m_KeyStream: array[0..g_lenKeystream-1] of Byte;
    m_InitializationVector: Byte;
    m_ModeOfOperation: Byte;
  public
    constructor Initialize(sKey: AnsiString; ModeOfOperation: Byte = MODE_CBC; InitializationVector: Byte = 0);
    procedure Encrypt(var pData: TByteArray); overload;
    procedure Decrypt(var pData: TByteArray); overload;
    function Encrypt(sData: AnsiString): AnsiString; overload;
    function Decrypt(sData: AnsiString): AnsiString; overload;
end;


implementation


constructor CCryptoGear.Initialize(sKey: AnsiString; ModeOfOperation: Byte = MODE_CBC; InitializationVector: Byte = 0);
var
  pKey: TByteArray;
  i, lenKey: Cardinal;
begin
  m_ModeOfOperation := ModeOfOperation;
  lenKey := Length(sKey);
  SetLength(pKey, lenKey);
  Move(sKey[1], pKey[0], lenKey);

  for i := 0 to g_lenKeystream - 1 do
  begin
    m_KeyStream[i] := i + InitializationVector;
  end;

  for i := 0 to (g_lenKeystream - 1) do
  begin
    // xor initial keystream element value(0 - 255) with corresponding byte from key offset
    m_KeyStream[i] := (m_KeyStream[i] xor (lenKey + pKey[i mod lenKey])) mod 256;
  end;
end;


function CCryptoGear.Encrypt( sData: AnsiString): AnsiString;
var
  pData: TByteArray;
  lenData: Cardinal;
begin
  lenData := Length(sData);
  SetLength(pData, lenData);
  Move(sData[1], pData[0], lenData * SizeOf(Char));
  Encrypt(pData);
  SetString(sData, PAnsiChar(@pData[0]), lenData);
  Result := sData;
end;


function CCryptoGear.Decrypt( sData: AnsiString): AnsiString;
var
  pData: TByteArray;
  lenData: Cardinal;
begin
  lenData := Length(sData);
  SetLength(pData, lenData);
  Move(sData[1], pData[0], lenData * SizeOf(Char));
  Decrypt(pData);
  SetString(sData, PAnsiChar(@pData[0]), lenData);
  Result := sData;
end;


procedure CCryptoGear.Encrypt( var pData: TByteArray);
var
  lenData, Offset: Cardinal;
  i: Cardinal;
  KeyStream: array[0..g_lenKeystream-1] of Byte;
  extra: Byte;
begin
  Offset := 0;
  lenData := Length(pData);

  //Create a local copy of the original KeyStream.
  for i := 0 to g_lenKeystream - 1 do
  begin
    KeyStream[i] := m_KeyStream[i];
  end;

  // Calculate padding
  extra := lenData mod 4;
  // If plain-text data size is not a multiple of block size,
  // then we must add a temporary padding (will be removed after finishing encrypting)
  if (extra > 0) then
  begin
    extra := 4 - extra;
    lenData := lenData + extra;
    SetLength(pData, lenData);
  end;

  //Encrypt the data.
  repeat
    pData[Offset]                   :=  pData[Offset] xor KeyStream[Offset mod g_lenKeystream];
    pData[(Offset + 1) mod lenData] := (pData[(Offset + 1) mod lenData] +  pData[Offset] + KeyStream[ (Offset + 1) mod g_lenKeystream]) mod 256;
    pData[(Offset + 2) mod lenData] := Byte(pData[(Offset + 2) mod lenData] + (pData[(Offset + 1) mod lenData] - KeyStream[ (Offset + 2) mod g_lenKeystream]) mod 256);
    pData[(Offset + 3) mod lenData] := (pData[(Offset + 3) mod lenData] + (pData[(Offset + 2) mod lenData] xor KeyStream[ (Offset + 3) mod g_lenKeystream])) mod 256;

    if (m_ModeOfOperation = MODE_CBC) then
    begin

      if (Offset > 0) then
      begin
      // xor block with previous block.
        pData[Offset]                   := (pData[Offset] xor pData[(Offset - 4) mod lenData]) mod 256;
        pData[(Offset + 1) mod lenData] := (pData[(Offset + 1) mod lenData] xor pData[(Offset - 3) mod lenData]) mod 256;
        pData[(Offset + 2) mod lenData] := (pData[(Offset + 2) mod lenData] xor pData[(Offset - 2) mod lenData]) mod 256;
        pData[(Offset + 3) mod lenData] := (pData[(Offset + 3) mod lenData] xor pData[(Offset - 1) mod lenData]) mod 256;
      end;

      // keystream elements used in this block are shifted.
      // This way on next key round the corresponding keystream byte will be different.
      for i := 0 to 3 do
      begin
        KeyStream[(Offset + i) mod g_lenKeystream] := Byte(KeyStream[(Offset + i) mod g_lenKeystream] + pData[(Offset + i) mod lenData] mod 256);
      end;
    end;
    Inc(Offset, 4);
  until Offset >= lenData;

  // Remove padding.
  if (extra > 0) then
  begin
    lenData := lenData - extra;
    setlength(pData, lenData);
  end;
end;


procedure CCryptoGear.Decrypt( var pData: TByteArray);
var
  KeyStream: array[0..g_lenKeystream-1] of Byte;
  lenData, Offset: Cardinal;
  extra     : Byte;
  a, b, c, d: Byte;
  e, f, g, h: Byte;
  i, j, k   : Byte;
begin
  Offset := 0;
  lenData := Length(pData);

  //Create a local copy of the original KeyStream.
  for i := 0 to g_lenKeystream -1 do
  begin
    KeyStream[i] := m_KeyStream[i];
  end;

  // Calculate padding
  extra := lenData mod 4;
  // If plain-text data size is not a multiple of block size,
  // then we must add a temporary padding (will be removed after finishing encrypting)
  if (extra > 0) then
  begin
    extra := 4 - extra;
    lenData := lenData + extra;
    SetLength(pData, lenData);
  end;

  //Decrypt the data.
  repeat

    if m_ModeOfOperation = MODE_CBC then
    begin
      // Save original encrypted bytes, used for key shifting later
      a := pData[Offset];
      b := pData[(Offset + 1) mod lenData];
      c := pData[(Offset + 2) mod lenData];
      d := pData[(Offset + 3) mod lenData];

      // Do from second cycle
      if (Offset > 0) then
      begin
        // xor block with previous block
        pData[Offset] :=  pData[Offset] xor e ;
        pData[(Offset + 1) mod lenData] := pData[(Offset + 1) mod lenData] xor f ;
        pData[(Offset + 2) mod lenData] := pData[(Offset + 2) mod lenData] xor g ;
        pData[(Offset + 3) mod lenData] := pData[(Offset + 3) mod lenData] xor h ;
      end;

      // Store encrypted bytes of this block for next cycle
      e := a;
      f := b;
      g := c;
      h := d;
    end;

    // Save xored bytes (or original encrypted bytes if we are using ECB).
    // With those we can shift back keystream operations and obtain clear-text.
    i := pData[Offset];
    j := pData[(Offset + 1) mod lenData];
    k := pData[(Offset + 2) mod lenData];

    pData[Offset]                   := pData[Offset] xor KeyStream[Offset mod g_lenKeystream];
    pData[(Offset + 1) mod lenData] := Byte(pData[(Offset + 1) mod lenData] - (i  + KeyStream[(Offset + 1) mod g_lenKeystream]) mod 256);
    pData[(Offset + 2) mod lenData] := Byte(pData[(Offset + 2) mod lenData] - (j  - KeyStream[(Offset + 2) mod g_lenKeystream]) mod 256);
    pData[(Offset + 3) mod lenData] := Byte(pData[(Offset + 3) mod lenData] - (k xor KeyStream[(Offset + 3) mod g_lenKeystream]) mod 256);

    if m_ModeOfOperation = MODE_CBC then
    begin
      // Values of KeyStream elements used in this block are modified.
      // This way on each key round the corresponding key byte will be different.
      KeyStream[Offset mod g_lenKeystream]       := Byte(KeyStream[Offset mod g_lenKeystream]       + a);
      KeyStream[(Offset + 1) mod g_lenKeystream] := Byte(KeyStream[(Offset + 1) mod g_lenKeystream] + b);
      KeyStream[(Offset + 2) mod g_lenKeystream] := Byte(KeyStream[(Offset + 2) mod g_lenKeystream] + c);
      KeyStream[(Offset + 3) mod g_lenKeystream] := Byte(KeyStream[(Offset + 3) mod g_lenKeystream] + d);
    end;
    Inc(Offset, 4);
  until Offset >= lenData;

  // Remove padding.
  if (extra > 0) then
  begin
    lenData := lenData - extra;
    setlength(pData, lenData);
  end;
end;


end.
