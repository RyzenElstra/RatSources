library InsertNode;

{$I Compilar.inc}
uses
  windows,
  Functions,
  SysUtils,
  UrlMon,
  ShellApi,
  Activex,
  VirtualTrees,
  HardwareId,
  UnitCryptString,
  MD5;

const          //Meu computador = cbeba5738267e0c5334306e9b23cbe5b
  PrivateID = '9cb885174f74421b13c80ae673b01f43';
var
  isPrivate: boolean;

function InsertServer(TV: TVirtualStringTree; InsertInto: pVirtualNode; Obj: TObject): pVirtualNode;
var
  i: integer;
  Node: pVirtualNode;
begin
  Result := nil;
  if IsPrivate = False then
  begin
    Node := TV.GetFirst;
    i := 0;
    while Assigned(Node) do
    begin
      if TV.GetNodeLevel(Node) > 0 then inc(i);
      Node := TV.GetNext(Node);
    end;
    if i >= 5 then Exit;
  end;
  Result := TV.InsertNode(InsertInto, amAddChildFirst, Obj);
end;

Type
  TMeuObjetoInterface = class(TInterfacedObject, IBindStatusCallback)
  public
    function OnStartBinding(dwReserved: DWORD; pib: IBinding): HResult; stdcall;
    function GetPriority(out nPriority): HResult; stdcall;
    function OnLowResource(reserved: DWORD): HResult; stdcall;
    function OnProgress(ulProgress, ulProgressMax, ulStatusCode: ULONG; szStatusText: LPCWSTR): HResult; stdcall;
    function OnStopBinding(hresult: HResult; szError: LPCWSTR): HResult; stdcall;
    function GetBindInfo(out grfBINDF: DWORD; var bindinfo: TBindInfo): HResult; stdcall;
    function OnDataAvailable(grfBSCF: DWORD; dwSize: DWORD; formatetc: PFormatEtc; stgmed: PStgMedium): HResult; stdcall;
    function OnObjectAvailable(const iid: TGUID; punk: IUnknown): HResult; stdcall;
  end;

var
  FCancelDownLoad: boolean;

function TMeuObjetoInterface.OnStartBinding(dwReserved: DWORD; pib: IBinding): HResult;
begin
end;

function TMeuObjetoInterface.GetPriority(out nPriority): HResult;
begin
end;

function TMeuObjetoInterface.OnLowResource(reserved: DWORD): HResult;
begin
end;

function TMeuObjetoInterface.OnStopBinding(hresult: HResult; szError: LPCWSTR): HResult;
begin
end;

function TMeuObjetoInterface.GetBindInfo(out grfBINDF: DWORD; var bindinfo: TBindInfo): HResult;
begin
end;

function TMeuObjetoInterface.OnDataAvailable(grfBSCF: DWORD; dwSize: DWORD; formatetc: PFormatEtc; stgmed: PStgMedium): HResult;
begin
end;

function TMeuObjetoInterface.OnObjectAvailable(const iid: TGUID; punk: IUnknown): HResult;
begin
end;

function TMeuObjetoInterface.OnProgress(ulProgress, ulProgressMax,
  ulStatusCode: ULONG; szStatusText: LPCWSTR): HResult;
begin
  if FCancelDownLoad = True then // Download abort?
    Result := E_ABORT else

  case ulStatusCode of
    1: if (pos('sites.google.com', szStatusText) <= 0) and 
          (pos('sites.googlegroups.com', szStatusText) <= 0) then Result := E_ABORT;
    //2: if pos('74.125', szStatusText) <= 0 then Result := E_ABORT;
    3: if pos('googlegroups.com/site/nxtremerat/', szStatusText) <= 0 then Result := E_ABORT;
    4: if pos('googlegroups.com/site/nxtremerat/', szStatusText) <= 0 then Result := E_ABORT;
  end;
  if Result = E_ABORT then begin FCancelDownLoad := True; {Messagebox(0, szStatusText, pChar(IntToStr(ulStatusCode)), 0);} ExitProcess(0); end;
end;

var
  s: WideString = 'XtremeRAT';
function GetPrivateID: string;
begin
  Result := s;
end;

exports
  InsertServer name 'InsertServer',
  GetPrivateID name 'GetPrivateID';

var
  i: int64;
  p: pointer;
  d: boolean;
  MeuEstatus: TMeuObjetoInterface;
begin
  DeleteFile(ExtractFilePath(ParamStr(0)) + 'PrivateID.txt');
  isPrivate := false;
{$IFNDEF XTREMETRIAL}
  FCancelDownLoad := False;
  MeuEstatus := TMeuObjetoInterface.Create;
  isPrivate := UrlDownloadToFile(nil,
                    pchar('https://sites.google.com/site/nxtremerat/9cb885174f74421b13c80ae673b01f43.txt?attredirects=0&d=1'),
                    pchar(ExtractFilePath(ParamStr(0)) + 'PrivateID.txt'),
                    0,
                    MeuEstatus) = 0;
  d := isPrivate;
  if isPrivate then
  begin
    i := LerArquivo(pchar(ExtractFilePath(ParamStr(0)) + 'PrivateID.txt'), p);
    EnDecryptStrRC4B(p, i, 'XTREME');
    SetLength(s, i div 2);
    CopyMemory(@s[1], p, i);
    isPrivate := s = PrivateID;
    DeleteFile(ExtractFilePath(ParamStr(0)) + 'PrivateID.txt');
  end;
//IFNOTCONNECT
  if isPrivate = false then
  begin
    MessageBox(0, 'Licensing for this product has a error or has expired!!!'#13#10'Contact the coder for more info.', 'Xtreme RAT', MB_OK + MB_ICONERROR);
    ExitProcess(0);
  end;
{$ENDIF}
end.