program cryptfile;
{$APPTYPE CONSOLE}

uses
  windows,
  UnitCryptString;

function LerArquivo(FileName: String; var Size: int64): Pointer;
var
  hFile: Cardinal;
  lpNumberOfBytesRead: DWORD;
begin
  result := nil;
  hFile := CreateFile(PChar(FileName), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  Size := GetFileSize(hFile, nil);
  GetMem(Result, Size);
  ReadFile(hFile, Result^, Size, lpNumberOfBytesRead, nil);
  CloseHandle(hFile);
end;

Procedure CriarArquivo(NomedoArquivo: String; imagem: pointer; Size: DWORD);
var
  hFile: THandle;
  lpNumberOfBytesWritten: DWORD;

begin
  hFile := CreateFile(PChar(NomedoArquivo), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, 0, 0);

  if hFile <> INVALID_HANDLE_VALUE then
  begin
    if Size = INVALID_HANDLE_VALUE then
    SetFilePointer(hFile, 0, nil, FILE_BEGIN);
    WriteFile(hFile, imagem^, Size, lpNumberOfBytesWritten, nil);
    CloseHandle(hFile);
  end;
end;

var
  p: pointer;
  s: int64;
  TempStr: String;
begin
  if paramstr(1) = '' then exit;
  if paramstr(2) = '' then exit;

  p := LerArquivo(paramstr(1), s);
  deletefile(pchar(paramstr(1)));

  if (p = nil) or (s <= 0) then exit;
  SetLength(TempStr, s);
  CopyMemory(@TempStr[1], p, s);

  writeln('');
  writeln('');
  writeln('');
  writeln('Iniciando a encriptção do arquivo' + ' ' + paramstr(1));
  writeln('');
  writeln('');
  writeln('');
  TempStr := EnDecryptStrRC4B(TempStr, ParamStr(2));

  writeln('Salvando o arquivo...');
  writeln('');
  writeln('');
  writeln('');
  CriarArquivo(paramstr(1), @TempStr[1], s);
end.
