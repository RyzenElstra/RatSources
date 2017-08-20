unit vIconChanger;

interface

uses
  Windows, Classes, SysUtils, Graphics;

procedure ChangeIcon(FileName, IconFile, ResName:string);
//FileName: is the exefile that you would to patch
//IconFile: all icons found in the iconfile will be added
//ResName: is the name of the IconGroup that you add to the file

implementation

resourcestring
  SInvalidFileName = 'Invalide filename %s';

type
  TNewHeader = record
    idReserved:WORD;
    idType:WORD;
    idCount:WORD;
  end;

  TResDirHeader = packed record
    bWidth:Byte;
    bHeight:Byte;
    bColorCount:Byte;
    bReserved:Byte;
    wPlanes:WORD;
    wBitCount:WORD;
    lBytesInRes:Longint;
  end;

  TIconFileResDirEntry = packed record
    DirHeader:TResDirHeader;
    lImageOffset:Longint;
  end;

  TIconResDirEntry = packed record
    DirHeader:TResDirHeader;
    wNameOrdinal:WORD;
  end;

  PIconResDirGrp = ^TIconResDirGrp;
  TIconResDirGrp = packed record
    idHeader:TNewHeader;
    idEntries:array[0..0] of TIconResDirEntry;
  end;

  PIconFileResGrp = ^TIconFileResDirGrp;
  TIconFileResDirGrp = packed record
    idHeader:TNewHeader;
    idEntries:array[0..0] of TIconFileResDirEntry;
  end;

  TBeginUpdateRes=function(pFileName: PChar; bDeleteExistingResources: BOOL): THandle; stdcall;

  TUpdateRes=function(hUpdate: THandle; lpType, lpName: PChar;
               wLanguage: Word; lpData: Pointer; cbData: DWORD): BOOL; stdcall;

  TEndUpdateRes=function(hUpdate: THandle; fDiscard: BOOL): BOOL; stdcall;

function MakeLangID:WORD;
begin
  Result:=(SUBLANG_ENGLISH_US shl 10) or LANG_ENGLISH;
end;

procedure CheckFileName(Value:string);
begin
  if (Trim(Value) = EmptyStr) or (not FileExists(Value)) then
    raise Exception.Create(Format(SInvalidFileName, [Value]));
end;

procedure ChangeIcon(FileName, IconFile, ResName:string);
var
  I:Integer;
  Group:Pointer;

  Header:TNewHeader;
  FileGrp:PIconFileResGrp;
  IconGrp:PIconResDirGrp;
  IconGrpSize,
  FileGrpSize:Integer;

  Icon:TIcon;
  Stream:TMemoryStream;
  hUpdateRes:THandle;
begin
  CheckFileName(FileName);
  hUpdateRes:=BeginUpdateResource(PChar(FileName), False);
  Win32Check(hUpdateRes <> 0);
  CheckFileName(IconFile);
  Icon:=TIcon.Create;
  Icon.LoadFromFile(IconFile);
  Stream:=TMemoryStream.Create;
  try
    Icon.SaveToStream(Stream);
  finally
    Icon.Free;
  end;
  Stream.Position:=0;
  Stream.Read(Header, SizeOf(Header));
  FileGrpSize := SizeOf(TIconFileResDirGrp) + (Header.idCount - 1) * SizeOf(TIconFileResDirEntry);
  IconGrpSize := SizeOf(TIconResDirGrp) + (Header.idCount - 1) * SizeOf(TIconResDirEntry);
  GetMem(FileGrp, FileGrpSize);GetMem(IconGrp, IconGrpSize);
  Stream.Position:=0;
  Stream.Read(FileGrp^, FileGrpSize);//loading icongroup
  Group:=nil;
  try
    for I:=0 to FileGrp^.idHeader.idCount - 1 do //building icongroup from loaded entries
    begin
      with IconGrp^ do
      begin
        idHeader:=FileGrp^.idHeader;
        idEntries[I].DirHeader:=FileGrp^.idEntries[I].DirHeader;
        idEntries[I].wNameOrdinal:=I;//fixing Ordinals
      end;
      with FileGrp^.idEntries[I] do
      begin
        Stream.Seek(lImageOffset, soFromBeginning);
        ReallocMem(Group, DirHeader.lBytesInRes);
        Stream.Read(Group^, DirHeader.lBytesInRes);
        Win32Check(UpdateResource(hUpdateRes,RT_ICON,PChar(MakeIntResource(I)),
                            MakeLangID, Group, DirHeader.lBytesInRes));
      end;
    end;//for
    Win32Check(UpdateResource(hUpdateRes,RT_GROUP_ICON, PChar(ResName),
                                  MakeLangID, IconGrp, IconGrpSize));//adding the icongroup
    Win32Check(EndUpdateResource(hUpdateRes, False));
    finally
      Stream.Free;
      FreeMem(FileGrp);
      FreeMem(IconGrp);
      FreeMem(Group);
    end;//try
end;

var
  hLib:HMODULE;
  BeginUpdateRes:TBeginUpdateRes;
  UpdateRes:TUpdateRes;
  EndUpdateRes:TEndUpdateRes;

procedure GetFunctions(hLib:HMODULE);
begin
  @BeginUpdateRes:=GetProcAddress(hLib,'BeginUpdateResourceA');
  @UpdateRes:=GetProcAddress(hLib,'UpdateResourceA');
  @EndUpdateRes:=GetProcAddress(hLib,'EndUpdateResourceA');
end;

initialization
  if Win32Platform = VER_PLATFORM_WIN32_WINDOWS then
    hLib:=LoadLibrary('unicows.dll') //for win9x
  else
    hLib:=GetModuleHandle('Kernel32.dll');//assuming Kernel32 is mapped

  if hLib > 0 then GetFunctions(hLib);

finalization
  if GetModuleHandle('unicows.dll') > 0 then
    FreeLibrary(hLib);

end.
