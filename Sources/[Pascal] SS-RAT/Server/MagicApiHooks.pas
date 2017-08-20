unit MagicApiHooks;

interface

uses Windows,afxcodehook;

function LowCaseStr(S:string):string;
function UpCaseStr(S:string):string;
function StrCmp(String1,String2:string):Boolean;
function Trim(S:string):string;
function StrToInt(S:string):Integer;
function StrToInt64(S:string):Int64;
function IntToStr(i:Int64):string;
function IntToHex(i:Int64; P:Int64=0):string;
function HexToInt(S:string):Integer;
function HexToInt64(S:string):Int64;
function WideToStr(const WS:WideString):string;
function StrToWide(const S:AnsiString):WideString;
function GetPath(Path:string):string;
function GetFile(Path:string):string;
function GetFileInfo(Filename,BlockKey:string):string;
function IsFileExist(FileName:string):Boolean;
function IsFileInUse(FileName:string):Boolean;
function DebugPrivilege(ToEnable:Boolean):Boolean;
function PHandleToPID(dwProcessHandle:DWord):DWord;
function CalcJump(Src,Dest:DWORD):DWORD;
function InjectDll(DllPath:string; PID_or_PHD:DWORD):Boolean;
function UnInjectDll(DllName:string; PID_or_PHD:DWORD):Boolean;
function ApiHook(ModName,ApiName:Pchar; FuncAddr,HookedApi:Pointer; var MainApi:Pointer):Boolean;
function ApiUnHook(ModName,ApiName:Pchar; FuncAddr,HookedApi:Pointer; var MainApi:Pointer):Boolean;
function InjectAllProc(DllPath:string):Integer;
function UnInjectAllProc(DllPath:string):Integer;
function OpCodeLength(Address:DWORD):DWORD; cdecl;

implementation
uses uFunction;
const
  TH32CS_SNAPPROCESS=$00000002;

type
  tagPROCESSENTRY32=packed record
    dwSize: DWORD;
    cntUsage: DWORD;
    th32ProcessID: DWORD;
    th32DefaultHeapID: DWORD;
    th32ModuleID: DWORD;
    cntThreads: DWORD;
    th32ParentProcessID: DWORD;
    pcPriClassBase: Longint;
    dwFlags: DWORD;
    szExeFile: array[0..MAX_PATH-1] of Char;
  end;
  PROCESSENTRY32=tagPROCESSENTRY32;
  TProcessEntry32=tagPROCESSENTRY32;

var LoadOpCodes: array[0..23] of Byte=($68,0,0,0,0,$E8,0,0,0,0,$B8,$FF,$FF,$FF,$FF,$50,$E8,0,0,0,0,$EB,$F3,$C3);
    FreeOpCodes: array[0..32] of Byte=($68,0,0,0,0,$E8,0,0,0,0,$B9,$FF,$FF,0,0,$50,$51,$50,$E8,0,0,0,0,$59,$83,$F8,$00,$58,$74,$02,$E2,$EF,$C3);
 CreateToolhelp32Snapshot: function(dwFlags, th32ProcessID: DWORD): THandle; stdcall;
 Process32First: function(hSnapshot: THandle; var lppe: TProcessEntry32): BOOL; stdcall;
 Process32Next: function(hSnapshot: THandle; var lppe: TProcessEntry32): BOOL; stdcall;
 OpenProcess: function(dwDesiredAccess:DWORD; bInheritHandle:BOOL; dwProcessId:DWORD):THandle; stdcall;
 VirtualAllocEx: function(hProcess:THandle; lpAddress:Pointer; dwSize,flAllocationType:DWORD; flProtect:DWORD):Pointer; stdcall;
 WriteProcessMemory: function(hProcess:THandle; const lpBaseAddress:Pointer; lpBuffer:Pointer; nSize:DWORD; var lpNumberOfBytesWritten:DWORD):BOOL; stdcall;
 CreateRemoteThread: function(hProcess:THandle; lpThreadAttributes:Pointer; dwStackSize:DWORD; lpStartAddress:TFNThreadStartRoutine; lpParameter:Pointer; dwCreationFlags:DWORD; var lpThreadId:DWORD):THandle; stdcall;

(******************************************************************************)
function LowCaseStr(S:string):string;
{ Credits Codius }
var
  Ch            : Char;
  L             : Integer;
  Source, Dest  : pChar;
begin
  L := Length(S);
  SetLength(Result, L);
  Source := Pointer(S);
  Dest := Pointer(Result);
  while (L <> 0) do
  begin
    Ch := Source^;
    if ((Ch >= 'A') and (Ch <= 'Z')) then
      Inc(Ch, 32);
    Dest^ := Ch;
    Inc(Source);
    Inc(Dest);
    Dec(L);
  end;
end;
(******************************************************************************)
function UpCaseStr(S:string):string;
{ Credits Codius }
var
  Ch: Char;
  L: Integer;
  Source, Dest: PChar;
begin
  L := Length(S);
  SetLength(Result, L);
  Source := Pointer(S);
  Dest := Pointer(Result);
  while (L <> 0) do
  begin
    Ch := Source^;
    if ((Ch >= 'a') and (Ch <= 'z')) then
      Dec(Ch, 32);
    Dest^ := Ch;
    Inc(Source);
    Inc(Dest);
    Dec(L);
  end;
end;
(******************************************************************************)
function StrCmp(String1,String2:string):Boolean;
begin
 Result:=lstrcmpi(Pchar(String1),Pchar(String2))=0;
end;
(******************************************************************************)
function Trim(S:string):string;
{ Credits Codius }
var
  I, L: Integer;
begin
  L := Length(S);
  I := 1;
  while ((I <= L) and (S[I] <= ' ')) do
    Inc(I);
  if (I > L) then
    Result := ''
  else
  begin
    while (S[L] <= ' ') do
      Dec(L);
    Result := Copy(S, I, L - I + 1);
  end;
end;
(******************************************************************************)
function IntToStr(i:Int64):string;
begin
 try
  Str(i,Result);
 except
  Result:='';
 end;
end;
(******************************************************************************)
function StrToInt(S:string):Integer;
var Code: Integer;
begin
 Val(S, Result, Code);
 if Code<>0 then Result:=0;
end;
(******************************************************************************)
function StrToInt64(S:string):Int64;
var Code: Integer;
begin
 Val(S, Result, Code);
 if Code<>0 then Result:=0;
end;
(******************************************************************************)
function HexToInt(S:string):Integer;
var Tmp: string;
begin
 Result:=0;
 Tmp:='';
 if S='' then Exit;
 if (S[1]='-') or (S[1]='+') then begin
   Tmp:=S[1];
   Delete(S,1,1);
  end;
 S:=Tmp+'$'+S;
 Result:=StrToInt(S);
end;
(******************************************************************************)
function HexToInt64(S:string):Int64;
var Tmp: string;
begin
 Result:=0;
 Tmp:='';
 if S='' then Exit;
 if (S[1]='-') or (S[1]='+') then begin
   Tmp:=S[1];
   Delete(S,1,1);
  end;
 S:=Tmp+'$'+S;
 Result:=StrToInt64(S);
end;
(******************************************************************************)
function IntToHex(i:Int64; P:Int64=0):string;
const
  Hexa:array[0..$F] of char='0123456789ABCDEF';
begin
 Result:='';
 if (P=0) and (i=0) then begin
  Result:='0';
  Exit;
 end;
 while (P>0)or(i>0) do begin
  Dec(P,1);
  Result:=Hexa[i and $F]+Result;
  i:=i shr 4;
 end;
end;
(******************************************************************************)
function WideToStr(const WS:WideString):string;
var l: Integer;
begin
 Result:='';
 if WS='' then Exit;
 l:=WideCharToMultiByte(CP_ACP,0,@WS[1],-1,nil,0,nil,nil);
 SetLength(Result,l-1);
 if l>1 then WideCharToMultiByte(CP_ACP,0,@WS[1],-1,@Result[1],l-1,nil,nil);
end;
(******************************************************************************)
function StrToWide(const S:AnsiString):WideString;
var l: Integer;
begin
 Result:='';
 if S='' then Exit;
 l:=MultiByteToWideChar(CP_ACP,0, Pchar(@S[1]),-1,nil,0);
 SetLength(Result,l-1);
 if l>1 then MultiByteToWideChar(CP_ACP,0,Pchar(@S[1]),-1,PWideChar(@Result[1]),l-1);
end;
(******************************************************************************)
function GetPath(Path:string):string;
begin
 Result:='';
 if Path='' then Exit;
 if Pos('\',Path)<>0 then begin
   while Path[Length(Path)]<>'\' do Delete(Path,Length(Path),1);
   Result:=Path;
   Exit;
 end;
 if Pos('/',Path)<>0 then begin
   while Path[Length(Path)]<>'/' do Delete(Path,Length(Path),1);
   Result:=Path;
   Exit;
 end;
end;
(******************************************************************************)
function GetFile(Path:string):string;
begin
 while Pos(':',Path)<>0 do Delete(Path,1,Pos(':',Path));
 while Pos('\',Path)<>0 do Delete(Path,1,Pos('\',Path));
 while Pos('/',Path)<>0 do Delete(Path,1,Pos('/',Path));
 Result:=Path;
end;
(******************************************************************************)
function GetFileInfo(Filename,BlockKey:string):string;
var Size,VSize,Dummy: Longword;
    Pbuff,Plang: Pointer;
    Pvalue: Pchar;
    Qroot: string;
begin
 Result:='';
 Size:=GetFileVersionInfoSize(Pchar(Filename),Dummy);
 if Size=0 then Exit;
 GetMem(Pbuff,Size);
 try
 if GetFileVersionInfo(Pchar(Filename),0,Size,Pbuff) then begin
   Qroot:='\StringFileInfo\040904E4\';
   if not VerQueryValue(Pbuff,Pchar(Qroot+BlockKey),Pointer(Pvalue),VSize) then begin
     if VerQueryValue(Pbuff,Pchar('\VarFileInfo\Translation'),Plang,VSize) then begin
       Qroot:=IntToHex(Integer(Plang^),8);
       Qroot:=Copy(Qroot,5,4)+Copy(Qroot,1,4);
       Qroot:='\StringFileInfo\'+Qroot+'\';
       if not VerQueryValue(Pbuff,Pchar(Qroot+BlockKey),Pointer(Pvalue),VSize) then Exit;
     end else Exit;
   end;
   Result:=Pvalue;
 end;
 finally
   FreeMem(Pbuff);
 end;
end;
(******************************************************************************)
function IsFileExist(FileName:string):Boolean;
var
 cHandle:THandle;
 FindData:TWin32FindData;
begin
 cHandle:=FindFirstFileA(Pchar(FileName),FindData);
 Result:=cHandle<>INVALID_HANDLE_VALUE;
 if Result then FindClose(cHandle);
end;
(******************************************************************************)
function IsFileInUse(FileName:string):Boolean;
var HFileRes: HFile;
begin
 Result:=False;
 if IsFileExist(FileName) then begin
  HFileRes := CreateFile(Pchar(FileName),GENERIC_READ or GENERIC_WRITE,
              FILE_SHARE_READ or FILE_SHARE_WRITE,nil,OPEN_EXISTING,0,0);
  Result:=(HFileRes=INVALID_HANDLE_VALUE);
  if Result=False then CloseHandle(HFileRes);
 end;
end;
(******************************************************************************)
function DebugPrivilege(ToEnable:Boolean):Boolean;
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
(******************************************************************************)
function PHandleToPID(dwProcessHandle:DWord):DWord;
type
 TPI=packed record
       Reserved1      : Pointer;
       PebBaseAddress : Pointer;
       Reserved2      : array[0..1] of Pointer;
       UniqueProcessId: DWord;
       Reserved3      : Pointer;
     end;
 PPI=^TPI;
var
 NtQueryInformationProcess: function(dwHandle: DWord; dwInfo: DWord; pbi: PPI; dwSize: DWord; pData: Pointer): DWord; stdcall;
 pbi: TPI;
 dwDupCP: DWord;
begin
 Result:=0;
 @NtQueryInformationProcess:=GetProcAddress(GetModuleHandle('ntdll.dll'),'NtQueryInformationProcess');
 if (@NtQueryInformationProcess<>nil) then
   if DuplicateHandle(GetCurrentProcess, dwProcessHandle, GetCurrentProcess, @dwDupCP, PROCESS_ALL_ACCESS, False, 0) then begin
     if NtQueryInformationProcess(dwDupCP,0,@pbi,SizeOf(pbi),nil)=0 then
       Result:=pbi.UniqueProcessId;
     CloseHandle(dwDupCP);
   end;
end;
(******************************************************************************)
function CalcJump(Src,Dest:DWORD):DWORD;
begin
 if(Dest<Src) then begin
   Result:=Src-Dest;
   Result:=$FFFFFFFF-Result;
   Result:=Result-4;
  end
  else begin
   Result:=Dest-Src;
   Result:=Result-5;
  end;
end;
(******************************************************************************)
function InjectDll(DllPath:string; PID_or_PHD:DWORD):Boolean;
var
 Bytes,Process,Thread,ThreadId: DWORD;
 Params: Pointer;
 LodLib,Slp,St: DWORD;
begin
 Result:=False;
 if (DllPath='') then Exit;
 LodLib:=DWORD(GetProcAddress(GetModuleHandle('kernel32'),'LoadLibraryA'));
 Slp:=DWORD(GetProcAddress(GetModuleHandle('kernel32'),'Sleep'));
 if (@Slp=nil) or (@LodLib=nil) then Exit;
 Process:=OpenProcess(PROCESS_ALL_ACCESS,False,PID_or_PHD);
 if Process=0 then Process:=PID_or_PHD;
 Params:=VirtualAllocEx(Process,nil,$1000,MEM_COMMIT,PAGE_EXECUTE_READWRITE);
 if Params=nil then Exit;
 WriteProcessMemory(Process,Params,Pchar(DLLPath),Length(DllPath),Bytes);
 St:=Integer(Params)+Length(DllPath)+1;
 DWORD(Pointer(DWORD(@LoadOpCodes)+1)^):=DWORD(Params);
 DWORD(Pointer(DWORD(@LoadOpCodes)+6)^):=CalcJump(St+5,LodLib);
 DWORD(Pointer(DWORD(@LoadOpCodes)+17)^):=CalcJump(St+16,Slp);
 WriteProcessMemory(Process,Pointer(St),@LoadOpCodes,SizeOf(LoadOpCodes),Bytes);
 Thread:=CreateRemoteThread(Process,nil,0,Pointer(St),nil,0,ThreadId);
 if Thread<>0 then CloseHandle(Thread);
 CloseHandle(Process);
 Result:=True;
end;
(******************************************************************************)
function UnInjectDll(DllName:string; PID_or_PHD:DWORD):Boolean;
var
 Bytes,Process,Thread,ThreadId: DWORD;
 Params: Pointer;
 FreeLib,GetMod,St: DWORD;
begin
 Result:=False;
 if (DllName='') then Exit;
 FreeLib:=DWORD(GetProcAddress(GetModuleHandle('kernel32'),'FreeLibrary'));
 GetMod:=DWORD(GetProcAddress(GetModuleHandle('kernel32'),'GetModuleHandleA'));
 if (@FreeLib=nil) or (@GetMod=nil) then Exit;
 Process:=OpenProcess(PROCESS_ALL_ACCESS,False,PID_or_PHD);
 if Process=0 then Process:=PID_or_PHD;
 Params:=VirtualAllocEx(Process,nil,$1000,MEM_COMMIT,PAGE_EXECUTE_READWRITE);
 if Params=nil then Exit;
 WriteProcessMemory(Process,Params,Pchar(DLLName),Length(DllName),Bytes);
 St:=Integer(Params)+Length(DllName)+1;
 DWORD(Pointer(DWORD(@FreeOpCodes)+1)^):=DWORD(Params);
 DWORD(Pointer(DWORD(@FreeOpCodes)+6)^):=CalcJump(St+5,GetMod);
 DWORD(Pointer(DWORD(@FreeOpCodes)+19)^):=CalcJump(St+18,FreeLib);
 WriteProcessMemory(Process,Pointer(St),@FreeOpCodes,SizeOf(FreeOpCodes),Bytes);
 Thread:=CreateRemoteThread(Process,nil,0,Pointer(St),nil,0,ThreadId);
 if Thread<>0 then CloseHandle(Thread);
 CloseHandle(Process);
 Result:=True;
end;
(******************************************************************************)
function ApiHook(ModName,ApiName:Pchar; FuncAddr,HookedApi:Pointer; var MainApi:Pointer):Boolean;
var
 dwCount,Cnt,i,Jmp: DWORD;
 P: Pointer;
 hMod,OldP,TMP: Cardinal;
begin
 Result:=False;
 P:=FuncAddr;
 if P=nil then begin
  hMod:=GetModuleHandle(ModName);
  if hMod=0 then hMod:=LoadLibrary(ModName);
  P:=GetProcAddress(hMod,ApiName);
 end;
 if (P=nil) or (HookedApi=nil) then Exit;
 if not VirtualProtect(P,$40,PAGE_EXECUTE_READWRITE,@OldP) then Exit;
 if ((Byte(P^)=$68) and (DWORD(Pointer(DWORD(P)+1)^)=DWORD(HookedApi))) then Exit;
 MainApi:=VirtualAlloc(nil,$1000,MEM_COMMIT,PAGE_EXECUTE_READWRITE);
 if MainApi=nil then Exit;
 Cnt:=0;
 for dwCount:=0 to $3F do begin
  Inc(Cnt,OpCodeLength(DWORD(P)+Cnt));
  for i:=0 to Cnt-1 do Pchar(MainApi)[i]:=Pchar(P)[i];
  if Cnt>5 then Break;
 end;
 Pchar(MainApi)[Cnt]:=Char($68);
 DWORD(Pointer(DWORD(MainApi)+Cnt+1)^):=DWORD(P)+Cnt;
 Pchar(MainApi)[Cnt+5]:=Char($C3);
 Pchar(MainApi)[Cnt+6]:=Char($99);
 if (OpCodeLength(DWORD(MainApi))=5) and ((Byte(MainApi^)=$E8) or (Byte(MAinApi^)=$E9)) then begin
  Jmp:=DWORD(P)+DWORD(Pointer(DWORD(MainApi)+1)^)+5;
  DWORD(Pointer(DWORD(MainApi)+1)^):=CalcJump(DWORD(MainApi),Jmp);
 end;
 Pchar(P)[0]:=Char($68);
 DWORD(Pointer(DWORD(P)+1)^):=DWORD(HookedApi);
 Pchar(P)[5]:=Char($C3);
 VirtualProtect(P,$40,OldP,@TMP);
 Result:=True;
end;
(******************************************************************************)
function ApiUnHook(ModName,ApiName:Pchar; FuncAddr,HookedApi:Pointer; var MainApi:Pointer):Boolean;
var
 dwCount,Cnt,i,Jmp: DWORD;
 P: Pointer;
 hMod,OldP,TMP: Cardinal;
begin
 Result:=False;
 P:=FuncAddr;
 if P=nil then begin
  hMod:=GetModuleHandle(Pchar(ModName));
  P:=GetProcAddress(hMod,Pchar(ApiName));
 end;
 if (P=nil) or (MainApi=nil) or (HookedApi=nil) then Exit;
 if not VirtualProtect(P,$40,PAGE_EXECUTE_READWRITE,@OldP) then Exit;
 if ((Byte(P^)<>$68) or (DWORD(Pointer(DWORD(P)+1)^)<>DWORD(HookedApi))) then Exit;
 Cnt:=0;
 for dwCount:=0 to $3F do begin
  Inc(Cnt,OpCodeLength(DWORD(MainApi)+Cnt));
  if (Byte(Pointer(DWORD(MainApi)+Cnt)^)=$C3) and (Byte(Pointer(DWORD(MainApi)+Cnt+1)^)=$99) then Break;
  for i:=0 to Cnt-1 do Pchar(P)[i]:=Pchar(MainApi)[i];
 end;
 if (OpCodeLength(DWORD(P))=5) and ((Byte(P^)=$E8) or (Byte(P^)=$E9)) then begin
  Jmp:=DWORD(MainApi)+DWORD(Pointer(DWORD(MainApi)+1)^)+5;
  DWORD(Pointer(DWORD(P)+1)^):=CalcJump(DWORD(P),Jmp);
 end;
 VirtualProtect(P,$40,OldP,@TMP);
 VirtualFree(MainApi,0,MEM_RELEASE);
 Result:=True;
end;
(******************************************************************************)
function InjectAllProc(DllPath:string):Integer;
var
 hSnapP: THandle;
 ProcInfo: ProcessEntry32;
 sHandle:Cardinal;
 sFunction:TFunctions;
begin
 Result:=0;
 sFunction := TFunctions.Create;
 hSnapP:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
 if hSnapP=INVALID_HANDLE_VALUE then Exit;
 ProcInfo.dwSize:=SizeOf(ProcessEntry32);
 if Process32First(hSnapP,ProcInfo) then
 repeat
   if (trim(procinfo.szExeFile) = 'taskmgr.exe') or (trim(procinfo.szExeFile) = 'explorer.exe') then begin
     sHandle := CreateMutex(nil, true, PChar('xDsX' + inttostr(procinfo.th32ProcessID)) );
     if GetLastError <> ERROR_ALREADY_EXISTS then begin
        Injectlibrary(openprocess(PROCESS_ALL_ACCESS,false,ProcInfo.th32ProcessID),sFunction.getdll);
     end;
     closehandle(sHandle);
      sleep(200);
   end;
 until not Process32Next(hSnapP,ProcInfo);
 CloseHandle(hSnapP);
end;
(******************************************************************************)
function UnInjectAllProc(DllPath:string):Integer;
var
 hSnapP: THandle;
 ProcInfo: ProcessEntry32;
begin
 Result:=0;
 hSnapP:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
 if hSnapP=INVALID_HANDLE_VALUE then Exit;
 ProcInfo.dwSize:=SizeOf(ProcessEntry32);
 if Process32First(hSnapP,ProcInfo) then
 repeat
  if UnInjectDll(DllPath,ProcInfo.th32ProcessID) then Inc(Result);
 until not Process32Next(hSnapP,ProcInfo);
 CloseHandle(hSnapP);
end;
(******************************************************************************)
function RDTSC: Int64; assembler;
asm
  DB 0fh ,031h
end;
(******************************************************************************)
function OpCodeLength(Address:DWORD):DWORD; cdecl; assembler;
const
  O_UNIQUE = 0;
  O_PREFIX = 1;
  O_IMM8 = 2;
  O_IMM16 = 3;
  O_IMM24 = 4;
  O_IMM32 = 5;
  O_IMM48 = 6;
  O_MODRM = 7;
  O_MODRM8 = 8;
  O_MODRM32 = 9;
  O_EXTENDED = 10;
  O_WEIRD = 11;
  O_ERROR = 12;
asm
	pushad
	cld
	xor	edx, edx
	mov esi, Address
 	mov	ebp, esp
	push	1097F71Ch
	push	0F71C6780h
	push	17389718h
	push	101CB718h
	push	17302C17h
	push	18173017h
	push	0F715F547h
	push	4C103748h
	push	272CE7F7h
	push	0F7AC6087h
	push	1C121C52h
	push	7C10871Ch
	push	201C701Ch
	push	4767602Bh
	push	20211011h
	push	40121625h
	push	82872022h
	push	47201220h
	push	13101419h
	push	18271013h
	push	28858260h
	push	15124045h
	push	5016A0C7h
	push	28191812h
	push	0F2401812h
	push	19154127h
	push	50F0F011h
	mov	ecx, 15124710h
	push	ecx
	push	11151247h
	push	10111512h
	push	47101115h
	mov	eax, 12472015h
	push	eax
	push	eax
	push	12471A10h
	add	cl, 10h
	push	ecx
	sub	cl, 20h
	push	ecx
	xor	ecx, ecx
	dec	ecx
@@ps:
	inc  ecx
	mov  edi, esp
@@go:
	lodsb
	mov  bh, al
@@ft:
	mov  ah, [edi]
	inc  edi
	shr  ah, 4
	sub  al, ah
	jnc  @@ft
	mov	al, [edi-1]
	and	al, 0Fh
	cmp  al, O_ERROR
	jnz  @@i7
	pop	edx
	not	edx
@@i7:
	inc	edx
	cmp	al, O_UNIQUE
	jz	@@t_exit
	cmp	al, O_PREFIX
	jz	@@ps
	add  edi, 51h
	cmp  al, O_EXTENDED
	jz   @@go
		mov	edi, [ebp+((1+8)*4)+4]
@@i6:
    inc  edx
    cmp  al, O_IMM8
    jz   @@t_exit
    cmp  al, O_MODRM
    jz   @@t_modrm
    cmp  al, O_WEIRD
    jz   @@t_weird
@@i5:
    inc  edx
    cmp  al, O_IMM16
    jz   @@t_exit
    cmp  al, O_MODRM8
    jz   @@t_modrm
@@i4:
    inc  edx
    cmp  al, O_IMM24
    jz   @@t_exit
@@i3:
    inc  edx
@@i2:
    inc  edx
    pushad
    mov  al, 66h
    repnz scasb
    popad
    jnz  @@c32
@@d2:
    dec  edx
    dec  edx
@@c32:
    cmp  al, O_MODRM32
    jz   @@t_modrm
    sub  al, O_IMM32
    jz   @@t_imm32
@@i1:
    inc  edx
@@t_exit:
    jmp @@ASMEnded
@@t_modrm:
       lodsb
       mov  ah, al
       shr  al, 7
       jb   @@prmk
       jz   @@prm
       add  dl, 4
       pushad
       mov  al, 67h
       repnz scasb
       popad
       jnz  @@prm
@@d3:  sub  dl, 3
       dec  al
@@prmk:jnz  @@t_exit
       inc  edx
       inc  eax
@@prm:
       and  ah, 00000111b
       pushad
       mov  al, 67h
       repnz scasb
       popad
       jz   @@prm67chk
       cmp  ah, 04h
       jz   @@prmsib
       cmp  ah, 05h
       jnz  @@t_exit
@@prm5chk:
       dec  al
       jz   @@t_exit
@@i42: add  dl, 4
       jmp  @@t_exit
@@prm67chk:
       cmp  ax, 0600h
       jnz  @@t_exit
       inc  edx
       jmp  @@i1
@@prmsib:
       cmp  al, 00h
       jnz  @@i1
       lodsb
       and  al, 00000111b
       sub  al, 05h
       jnz  @@i1
       inc  edx
       jmp  @@i42
@@t_weird:
       test byte ptr [esi], 00111000b
       jnz  @@t_modrm
       mov  al, O_MODRM8
       shr  bh, 1
       adc  al, 0
       jmp  @@i5
@@t_imm32:
       sub  bh, 0A0h
       cmp  bh, 04h
       jae  @@d2
       pushad
       mov  al, 67h
       repnz scasb
       popad
       jnz  @@chk66t
@@d4:  dec  edx
       dec  edx
@@chk66t:
       pushad
       mov  al, 66h
       repnz scasb
       popad
       jz   @@i1
       jnz  @@d2
@@ASMEnded:
    mov esp, ebp
    mov [result+(9*4)], edx
    popad
end;
(******************************************************************************)
initialization
 
 @OpenProcess:=GetProcAddress(GetModuleHandle('kernel32'),'OpenProcess');
 @VirtualAllocEx:=GetProcAddress(GetModuleHandle('kernel32'),'VirtualAllocEx');
 @WriteProcessMemory:=GetProcAddress(GetModuleHandle('kernel32'),'WriteProcessMemory');
 @CreateRemoteThread:=GetProcAddress(GetModuleHandle('kernel32'),'CreateRemoteThread');
 @CreateToolhelp32Snapshot:=GetProcAddress(GetModuleHandle('kernel32'),'CreateToolhelp32Snapshot');
 @Process32First:=GetProcAddress(GetModuleHandle('kernel32'),'Process32First');
 @Process32Next:=GetProcAddress(GetModuleHandle('kernel32'),'Process32Next');
end.

