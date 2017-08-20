unit Unhook;

interface

uses
  Windows,
  afxCodeHook,
  Native,
  JwaWinNT,
  JwaWinType,
  JwaAclApi,
  JwaAccCtrl;

procedure RemoveKernelHooks;
procedure RemoveUserHooks;

type
  TSections = array [0..0] of TImageSectionHeader;
  TStringArray = array [0..1024] of string;

implementation

//KERNEL MODE UNHOOKING

function AssignACL: boolean;
var
  ObjectName: UNICODE_STRING;
  ObjectAttributes: OBJECT_ATTRIBUTES;
  Section: THandle;
  Access, NewAccess: PAcl;
  SecurityDescriptor: PSecurityDescriptor;
  ExplicitAccess: EXPLICIT_ACCESS;
begin
  Result := False;
  RtlInitUnicodeString(@ObjectName, '\Device\PhysicalMemory');
  InitializeObjectAttributes(@ObjectAttributes, @ObjectName, OBJ_CASE_INSENSITIVE, 0, nil);
  if NT_SUCCESS(NtOpenSection(@Section, READ_CONTROL or WRITE_DAC, @ObjectAttributes)) then
  begin
    if GetSecurityInfo(Section, SE_KERNEL_OBJECT, DACL_SECURITY_INFORMATION, nil, nil, @Access, nil, SecurityDescriptor) = ERROR_SUCCESS then
    begin
      ZeroMemory(@ExplicitAccess, SizeOf(EXPLICIT_ACCESS));
      ExplicitAccess.grfAccessPermissions := SECTION_MAP_WRITE;
      ExplicitAccess.grfAccessMode := GRANT_ACCESS;
      ExplicitAccess.grfInheritance := NO_INHERITANCE;
      ExplicitAccess.Trustee.TrusteeForm := TRUSTEE_IS_NAME;
      ExplicitAccess.Trustee.TrusteeType := TRUSTEE_IS_USER;
      ExplicitAccess.Trustee.ptstrName := 'CURRENT_USER';
      if SetEntriesInAcl(1, @ExplicitAccess, Access, NewAccess) = ERROR_SUCCESS then
      begin
         if SetSecurityInfo(Section, SE_KERNEL_OBJECT, DACL_SECURITY_INFORMATION, nil, nil, NewAccess, nil) = ERROR_SUCCESS then
         begin
            Result := True;
         end;
      end;
    end;
  end;
end;

function OpenPhysicalMemory: THandle;
var
  ObjectName: UNICODE_STRING;
  ObjectAttributes: OBJECT_ATTRIBUTES;
  Section: THandle;
begin
  Result := INVALID_HANDLE_VALUE;
  RtlInitUnicodeString(@ObjectName, '\Device\PhysicalMemory');
  InitializeObjectAttributes(@ObjectAttributes, @ObjectName, OBJ_CASE_INSENSITIVE, 0, nil);
  if NT_SUCCESS(NtOpenSection(@Section, SECTION_MAP_READ or SECTION_MAP_WRITE, @ObjectAttributes)) then
  begin
    Result := Section;
  end;
end;

function GetKernelBase: dword;
var
  hHeap: THandle;
  Status: NTSTATUS;
  cbBuffer: dword;
  pBuffer: PSystemModuleInformation;
  ModCount: dword;
  ModLoop: integer;
begin
  Result := 0;
  hHeap := GetProcessHeap;
  cbBuffer := $8000;

  repeat
    pBuffer := HeapAlloc(hHeap, 0, cbBuffer);
    if (pBuffer = nil) then
    begin
      Result := $80400000;
      Exit;
    end;
    Status := NtQuerySystemInformation(SystemModuleInformation, pBuffer, cbBuffer, nil);
    if Status = NTSTATUS($C0000004) then
    begin
      HeapFree(hHeap, 0, pBuffer);
      cbBuffer := cbBuffer * 2;
    end
    else if not NT_SUCCESS(Status) then
    begin
      HeapFree(hHeap, 0, pBuffer);
       Result := $80400000;
       Exit;
    end;
  until Status <> NTSTATUS($C0000004);

  ModCount := pdword(pBuffer)^;
  pBuffer := pointer(dword(pBuffer) + 4);
  for ModLoop := 0 to ModCount - 1 do
  begin
    if Pos('ntoskrnl.exe', string(pBuffer.ImageName)) <> 0 then
    begin
      Result := dword(pBuffer.Base);
      Exit;
    end;
    Inc(pBuffer);
  end;
  //HeapFree(hHeap, 0, pBuffer);
end;

function MapPhysicalMemory(hPysicalMemory: THandle; var PhysicalAddress: dword; var Length: dword; var VirtualAddress: pointer): boolean;
var
  Status: NTSTATUS;
  Base: PHYSICAL_ADDRESS;
begin
  VirtualAddress := nil;
  Base.QuadPart := PhysicalAddress;
  Status := NtMapViewOfSection(hPysicalMemory, GetCurrentProcess, @VirtualAddress, 0, Length, @Base, pulong(@Length), ViewShare, 0, PAGE_READWRITE);
  if not NT_SUCCESS(Status) then
  begin
    Result := False;
  end
  else
  begin
    PhysicalAddress := Base.LowPart;
    Result := True;
  end;
end;

procedure UnmapPhysicalMemory(Address: dword);
var
  Status: NTSTATUS;
begin
  Status := NtUnmapViewOfSection(GetCurrentProcess, pointer(Address));
  if not NT_SUCCESS(Status) then
  begin
  end;
end;

procedure GetNativeAPI(var NativeAPI: TStringArray);
var
  ModuleName: pchar;
  ImageBase, LoadedImage: pointer;
  Module: THandle;
  ModuleSize, BytesRead: dword;
  ImageDosHeader: PImageDosHeader;
  ImageNtHeaders: PImageNtHeaders;
  ImageExportDirectory: PImageExportDirectory;
  ExportLoop: integer;
  ExportName: pchar;
  PNames: pdword;
  POrdinal: pword;
  PSections: ^TSections;
  SectionLoop: integer;
  SectionBase: pointer;
  VirtualSectionSize, RawSectionSize: dword;
  ImageSize: dword;
  Sections: pointer;
  OS: Windows.TOSVersionInfo;
begin
  OS.dwOSVersionInfoSize := SizeOf(Windows.TOSVersionInfo);
  GetVersionEx(OS);
  if OS.dwMajorVersion <> 5 then
  begin
    Exit;
  end;

  GetMem(ModuleName, MAX_PATH);
  GetModuleFileName(GetModuleHandle('ntdll.dll'), ModuleName, MAX_PATH - 1);

  Module := CreateFile(ModuleName, GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  SetFilePointer(Module, 0, nil, FILE_BEGIN);
  ModuleSize := GetFileSize(Module, nil);
  GetMem(LoadedImage, ModuleSize);
  ReadFile(Module, LoadedImage^, ModuleSize, BytesRead, nil);
  CloseHandle(Module);

  ImageDosHeader := PImageDosHeader(LoadedImage);
  ImageNtHeaders := PImageNtHeaders(cardinal(ImageDosHeader.e_lfanew) + cardinal(LoadedImage));
  ImageBase := VirtualAlloc(nil, ImageNtHeaders.OptionalHeader.SizeOfImage, MEM_RESERVE, PAGE_NOACCESS);
  SectionBase := VirtualAlloc(ImageBase, ImageNtHeaders.OptionalHeader.SizeOfHeaders, MEM_COMMIT, PAGE_READWRITE);
  Move(LoadedImage^, SectionBase^, ImageNtHeaders.OptionalHeader.SizeOfHeaders);
  PSections := pointer(pchar(@(ImageNtHeaders.OptionalHeader)) + ImageNtHeaders.FileHeader.SizeOfOptionalHeader);

  VirtualSectionSize := PSections[ImageNtHeaders.FileHeader.NumberOfSections - 1].SizeOfRawData;
  RawSectionSize := PSections[ImageNtHeaders.FileHeader.NumberOfSections - 1].Misc.VirtualSize;
  if RawSectionSize > VirtualSectionSize then RawSectionSize := VirtualSectionSize;
  ImageSize := (PSections[ImageNtHeaders.FileHeader.NumberOfSections - 1].VirtualAddress - PSections[0].VirtualAddress) + RawSectionSize;

  Sections := VirtualAlloc(pointer(PSections[0].VirtualAddress + dword(ImageBase)), ImageSize, MEM_COMMIT, PAGE_READWRITE);

  for SectionLoop := 0 to ImageNtHeaders.FileHeader.NumberOfSections - 1 do
  begin
    VirtualSectionSize := PSections[SectionLoop].Misc.VirtualSize;
    RawSectionSize := PSections[SectionLoop].SizeOfRawData;
    if RawSectionSize > 0 then
    begin
      if RawSectionSize > VirtualSectionSize then RawSectionSize := VirtualSectionSize;
      SectionBase := pointer(PSections[SectionLoop].VirtualAddress + dword(ImageBase));
      FillChar(SectionBase^, RawSectionSize, 0);
      Move(pointer(cardinal(LoadedImage) + PSections[SectionLoop].PointerToRawData)^, SectionBase^, RawSectionSize);
    end;
  end;

  ImageExportDirectory := PImageExportDirectory(ImageNtHeaders.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress + cardinal(ImageBase));
  PNames := pointer(cardinal(ImageExportDirectory.AddressOfNames) + cardinal(ImageBase));
  POrdinal := pointer(cardinal(ImageExportDirectory.AddressOfNameOrdinals) + cardinal(ImageBase));

  for ExportLoop := 0 to ImageExportDirectory.NumberOfNames - 1 do
  begin
    ExportName := pchar(pdword(PNames)^ + cardinal(ImageBase));
    if OS.dwMinorVersion = 0 then
    begin
      if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase))^ = $B8 then
      begin
        if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 9)^ = $CD then
        begin
          if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 10)^ = $2E then
          begin
            NativeAPI[pdword(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 1)^] := ExportName;
          end;
        end;
      end;
    end
    else if OS.dwMinorVersion = 1 then
    begin
      if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase))^ = $B8 then
      begin
        if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 5)^ = $BA then
        begin
          if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 6)^ = $00 then
          begin
            if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 7)^ = $03 then
            begin
              if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 8)^ = $FE then
              begin
                if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 9)^ = $7F then
                begin
                  NativeAPI[pdword(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 1)^] := ExportName;
                end;
              end;
            end;
          end;
        end;
      end;
    end
    else if OS.dwMinorVersion = 2 then
    begin
      if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase))^ = $B8 then
      begin
        if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 5)^ = $BA then
        begin
          if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 6)^ = $00 then
          begin
            if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 7)^ = $03 then
            begin
              if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 8)^ = $FE then
              begin
                if pbyte(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 9)^ = $7F then
                begin
                  NativeAPI[pdword(pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^ + cardinal(ImageBase) + 1)^] := ExportName;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
    Inc(PNames);
    Inc(POrdinal);
  end;
  VirtualFree(ImageBase, 0, MEM_RELEASE);
  VirtualFree(SectionBase, 0, MEM_RELEASE);
  VirtualFree(Sections, 0, MEM_RELEASE);
  FreeMemory(ModuleName);
  FreeMemory(LoadedImage);
end;

function CheckKiServiceTableAddress(ImageBase: pointer; Address: dword; ImageNtHeaders: PImageNtHeaders): boolean;
var
  PReloc, PRelocs: PImageBaseRelocation;
  RelocsSize: cardinal;
  Reloc: PWord;
  ModCount: cardinal;
  RelocLoop: cardinal;
  RelocType: dword;
  RelocAddress: pointer;
begin
  Result := False;
  PRelocs := PImageBaseRelocation(ImageNtHeaders.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].VirtualAddress + cardinal(ImageBase));
  PReloc := PRelocs;
  RelocsSize := ImageNtHeaders.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].Size;
  while cardinal(PReloc) - cardinal(PRelocs) < RelocsSize do
  begin
    ModCount := (PReloc.SizeOfBlock - Sizeof(TImageBaseRelocation)) shr 1;
    Reloc := pointer(cardinal(PReloc) + Sizeof(TImageBaseRelocation));
    for RelocLoop := 0 to ModCount - 1 do
    begin
      RelocType := (Reloc^ and $f000) shr 12;
      if RelocType = 3 then
      begin
        RelocAddress := pdword(cardinal(ImageBase) + PReloc.VirtualAddress + (Reloc^ and $0fff));
        if dword(RelocAddress^) = dword(Address) then
        begin
          Result := True;
        end;
      end;
      Inc(Reloc);
    end;
    PReloc := pointer(Reloc);
  end;
end;

function GetKiServiceTableAddress(ImageBase: pointer; SDT: dword; ImageNtHeaders: PImageNtHeaders): dword;
var
  PReloc, PRelocs: PImageBaseRelocation;
  RelocsSize: cardinal;
  Reloc: PWord;
  ModCount: cardinal;
  RelocLoop: cardinal;
  RelocType: dword;
  RelocAddress: pointer;
  ServiceTableAddress: pointer;
begin
  Result := 0;
  PRelocs := PImageBaseRelocation(ImageNtHeaders.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].VirtualAddress + cardinal(ImageBase));
  PReloc := PRelocs;
  RelocsSize := ImageNtHeaders.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].Size;
  while cardinal(PReloc) - cardinal(PRelocs) < RelocsSize do
  begin
    ModCount := (PReloc.SizeOfBlock - Sizeof(TImageBaseRelocation)) shr 1;
    Reloc := pointer(cardinal(PReloc) + Sizeof(TImageBaseRelocation));
    for RelocLoop := 0 to ModCount - 1 do
    begin
      RelocType := (Reloc^ and $f000) shr 12;
      if RelocType = 3 then
      begin
        RelocAddress := pdword(cardinal(ImageBase) + PReloc.VirtualAddress + (Reloc^ and $0fff));
        ServiceTableAddress := pointer(SDT + ImageNtHeaders.OptionalHeader.ImageBase);
        if dword(RelocAddress^) = dword(ServiceTableAddress) then
        begin
          if pword(dword(RelocAddress) - 2)^ = $05C7 then
          begin
            if CheckKiServiceTableAddress(ImageBase, pdword(dword(RelocAddress) + 4)^, ImageNtHeaders) then
            begin
              Result := pdword(dword(RelocAddress) + 4)^ - ImageNtHeaders.OptionalHeader.ImageBase;
            end;
          end;
        end;
      end;
      Inc(Reloc);
    end;
    PReloc := pointer(Reloc);
  end;
end;

procedure RemoveKernelHooks;
var
  ModuleName: pchar;
  ImageBase, LoadedImage: pointer;
  Module: THandle;
  ModuleSize, BytesRead: dword;
  ImageDosHeader: PImageDosHeader;
  ImageNtHeaders: PImageNtHeaders;
  ImageExportDirectory: PImageExportDirectory;
  ExportLoop: integer;
  ExportName: pchar;
  PNames: pdword;
  POrdinal: pword;
  PSections: ^TSections;
  SectionLoop: integer;
  SectionBase: pointer;
  ImageSize: dword;
  Sections: pointer;
  SDT: dword;
  VirtualSectionSize, RawSectionSize, Count, Entries, AddressBegin, ServiceTableAddress, Bytes, KernelBase, KernelOffset, hPysicalMemory, PhysicalAddress, TargetAddress, Size, NumberOfHooks: dword;
  pTarget: pointer;
  ServiceTable, MappedServiceTable: pdword;
  NativeAPI: TStringArray;
  ModLoop: dword;
  Answer: string;
begin
  GetNativeAPI(NativeAPI);

  GetMem(ModuleName, MAX_PATH);
  GetSystemDirectory(ModuleName, MAX_PATH - 1);

  Module := CreateFile(pchar(ModuleName + '\ntoskrnl.exe'), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  SetFilePointer(Module, 0, nil, FILE_BEGIN);
  ModuleSize := GetFileSize(Module, nil);
  GetMem(LoadedImage, ModuleSize);
  ReadFile(Module, LoadedImage^, ModuleSize, BytesRead, nil);
  CloseHandle(Module);

  ImageDosHeader := PImageDosHeader(LoadedImage);
  ImageNtHeaders := PImageNtHeaders(cardinal(ImageDosHeader.e_lfanew) + cardinal(LoadedImage));
  ImageBase := VirtualAlloc(nil, ImageNtHeaders.OptionalHeader.SizeOfImage, MEM_RESERVE, PAGE_NOACCESS);
  SectionBase := VirtualAlloc(ImageBase, ImageNtHeaders.OptionalHeader.SizeOfHeaders, MEM_COMMIT, PAGE_READWRITE);
  Move(LoadedImage^, SectionBase^, ImageNtHeaders.OptionalHeader.SizeOfHeaders);
  PSections := pointer(pchar(@(ImageNtHeaders.OptionalHeader)) + ImageNtHeaders.FileHeader.SizeOfOptionalHeader);

  VirtualSectionSize := PSections[ImageNtHeaders.FileHeader.NumberOfSections - 1].SizeOfRawData;
  RawSectionSize := PSections[ImageNtHeaders.FileHeader.NumberOfSections - 1].Misc.VirtualSize;
  if RawSectionSize > VirtualSectionSize then RawSectionSize := VirtualSectionSize;
  ImageSize := (PSections[ImageNtHeaders.FileHeader.NumberOfSections - 1].VirtualAddress - PSections[0].VirtualAddress) + RawSectionSize;

  Sections := VirtualAlloc(pointer(PSections[0].VirtualAddress + dword(ImageBase)), ImageSize, MEM_COMMIT, PAGE_READWRITE);

  for SectionLoop := 0 to ImageNtHeaders.FileHeader.NumberOfSections - 1 do
  begin
    VirtualSectionSize := PSections[SectionLoop].Misc.VirtualSize;
    RawSectionSize := PSections[SectionLoop].SizeOfRawData;
    if RawSectionSize > 0 then
    begin
      if RawSectionSize > VirtualSectionSize then RawSectionSize := VirtualSectionSize;
      SectionBase := pointer(PSections[SectionLoop].VirtualAddress + dword(ImageBase));
      FillChar(SectionBase^, RawSectionSize, 0);
      Move(pointer(cardinal(LoadedImage) + PSections[SectionLoop].PointerToRawData)^, SectionBase^, RawSectionSize);
    end;
  end;

  ImageExportDirectory := PImageExportDirectory(ImageNtHeaders.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress + cardinal(ImageBase));
  PNames := pointer(cardinal(ImageExportDirectory.AddressOfNames) + cardinal(ImageBase));
  POrdinal := pointer(cardinal(ImageExportDirectory.AddressOfNameOrdinals) + cardinal(ImageBase));
  SDT := 0;

  for ExportLoop := 0 to ImageExportDirectory.NumberOfNames - 1 do
  begin
    ExportName := pchar(pdword(PNames)^ + cardinal(ImageBase));
    if lstrcmpi(ExportName, 'KeServiceDescriptorTable') = 0 then
    begin
      SDT := pdword(ImageExportDirectory.AddressOfFunctions + (POrdinal^ * 4) + cardinal(ImageBase))^;
      Break;
    end;
    Inc(PNames);
    Inc(POrdinal);
  end;

  KernelBase := GetKernelBase - $80000000;
  KernelOffset := KernelBase - ImageNtHeaders.OptionalHeader.ImageBase;

  AssignACL;

  pTarget := nil;
  hPysicalMemory := OpenPhysicalMemory;
  PhysicalAddress := SDT + KernelBase;
  TargetAddress := PhysicalAddress;
  Size := $2000;

  if MapPhysicalMemory(hPysicalMemory, PhysicalAddress, Size, pTarget) then
  begin
    AddressBegin := TargetAddress - PhysicalAddress;
    Bytes := Size - AddressBegin;
    if Bytes >= 4 then
    begin
      ServiceTableAddress := dword(pointer(dword(pTarget) + AddressBegin)^);
      if Bytes >= 12 then
      begin
        Count := dword(pointer(dword(pTarget) + AddressBegin + 8)^);
      end;
    end;

    UnmapPhysicalMemory(dword(pTarget));

    PhysicalAddress := ServiceTableAddress - $80000000;
    TargetAddress := PhysicalAddress;
    pTarget := nil;
    Size := $2000;
    if MapPhysicalMemory(hPysicalMemory, PhysicalAddress, Size, pTarget) then
    begin
      AddressBegin := TargetAddress - PhysicalAddress;
      Entries := (Size - AddressBegin) shr 2;
      if (Entries >= Count) then
      begin
        ServiceTable := pointer(dword(pTarget) + AddressBegin);
        MappedServiceTable := pointer(cardinal(ImageBase) + TargetAddress - KernelOffset - ImageNtHeaders.OptionalHeader.ImageBase);
        MappedServiceTable := pointer(cardinal(ImageBase) + GetKiServiceTableAddress(ImageBase, SDT, ImageNtHeaders));
        NumberOfHooks := 0;
        for ModLoop := 0 to Count - 1 do
        begin
          if (pdword(dword(ServiceTable) + (ModLoop * 4))^ - $80000000 - KernelOffset) <> pdword(dword(MappedServiceTable) + (ModLoop * 4))^ then
          begin
            Inc(NumberOfHooks);
            if Length(NativeAPI[ModLoop]) <> 0 then
            begin
              pdword(dword(ServiceTable) + (ModLoop * 4))^ := pdword(dword(MappedServiceTable) + (ModLoop * 4))^ + $80000000 + KernelOffset;
            end;
          end;
        end;
        if NumberOfHooks = 0 then
        begin
        end;
      end;
      UnmapPhysicalMemory(dword(pTarget));
    end;
  end;
  VirtualFree(ImageBase, 0, MEM_RELEASE);
  VirtualFree(SectionBase, 0, MEM_RELEASE);
  VirtualFree(Sections, 0, MEM_RELEASE);
  FreeMemory(ModuleName);
  FreeMemory(LoadedImage);
end;

//USER MODE UNHOOKING

function UnhookExport(hModule: HMODULE; FunctionName: pchar): boolean;
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
  ImageNtHeaders := PImageNtHeaders(cardinal(ImageDosHeader.e_lfanew) + cardinal(LoadedImage));
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
  ImageNtHeaders := PImageNtHeaders(cardinal(ImageDosHeader.e_lfanew) + cardinal(ImageBase));
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
      CodeLen := SizeOfProc(LoadedAddress);
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

function CheckExports(ImageBase: pointer; ImageExportDirectory: PImageExportDirectory): boolean;
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

procedure RemoveUserHooks;
var
  ImageBase: pointer;
  ImageDosHeader: PImageDosHeader;
  ImageNtHeaders: PImageNtHeaders;
  ImageExportDirectory: PImageExportDirectory;
begin
  ImageBase := pointer(GetModuleHandle('kernel32'));
  ImageDosHeader := PImageDosHeader(ImageBase);
  ImageNtHeaders := PImageNtHeaders(cardinal(ImageDosHeader.e_lfanew) + cardinal(ImageBase));
  ImageExportDirectory := PImageExportDirectory(ImageNtHeaders.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress + cardinal(ImageBase));
  if ImageExportDirectory <> ImageBase then
  begin
    if ImageExportDirectory.NumberOfNames <> 0 then
    begin
      CheckExports(ImageBase, ImageExportDirectory);
    end;
  end;
end;

end.

