unit Hardwareid;

interface
uses
  windows,
  sysutils;

Function GetHardwareid:longword;
Function CrcString(source: string):longword;

implementation

function GetIdeSerialNumber ():Ansistring;
const IDENTIFY_BUFFER_SIZE = 512;
type
  TIDERegs = packed record
    bFeaturesReg     : BYTE;
    bSectorCountReg  : BYTE;
    bSectorNumberReg : BYTE;
    bCylLowReg       : BYTE;
    bCylHighReg      : BYTE;
    bDriveHeadReg    : BYTE;
    bCommandReg      : BYTE;
    bReserved        : BYTE;
  end;
  TSendCmdInParams = packed record
    cBufferSize  : DWORD;
    irDriveRegs  : TIDERegs;
    bDriveNumber : BYTE;
    bReserved    : Array[0..2] of Byte;
    dwReserved   : Array[0..3] of DWORD;
    bBuffer      : Array[0..0] of Byte;
  end;
  TIdSector = packed record
    wGenConfig                 : Word;
    wNumCyls                   : Word;
    wReserved                  : Word;
    wNumHeads                  : Word;
    wBytesPerTrack             : Word;
    wBytesPerSector            : Word;
    wSectorsPerTrack           : Word;
    wVendorUnique              : Array[0..2] of Word;
    sSerialNumber              : Array[0..19] of ansiCHAR;
    wBufferType                : Word;
    wBufferSize                : Word;
    wECCSize                   : Word;
    sFirmwareRev               : Array[0..7] of ansiCHAR;
    sModelNumber               : Array[0..39] of ansiCHAR;
    wMoreVendorUnique          : Word;
    wDoubleWordIO              : Word;
    wCapabilities              : Word;
    wReserved1                 : Word;
    wPIOTiming                 : Word;
    wDMATiming                 : Word;
    wBS                        : Word;
    wNumCurrentCyls            : Word;
    wNumCurrentHeads           : Word;
    wNumCurrentSectorsPerTrack : Word;
    ulCurrentSectorCapacity    : DWORD;
    wMultSectorStuff           : Word;
    ulTotalAddressableSectors  : DWORD;
    wSingleWordDMA             : Word;
    wMultiWordDMA              : Word;
    bReserved                  : Array[0..127] of BYTE;
  end;
  PIdSector = ^TIdSector;
  TDriverStatus = packed record
    bDriverError : Byte;
    bIDEStatus   : Byte;
    bReserved    : Array[0..1] of Byte;
    dwReserved   : Array[0..1] of DWORD;
  end;
  TSendCmdOutParams = packed record
    cBufferSize  : DWORD;
    DriverStatus : TDriverStatus;
    bBuffer      : Array[0..0] of BYTE;
  end;

  var
    hDevice : THandle;
    cbBytesReturned : DWORD;
    SCIP : TSendCmdInParams;
    aIdOutCmd : Array [0..(SizeOf(TSendCmdOutParams)+IDENTIFY_BUFFER_SIZE-1)-1] of Byte;
    IdOutCmd  : TSendCmdOutParams absolute aIdOutCmd;

  procedure ChangeByteOrder( var Data; Size : Integer );
  var ptr : PChar;
      i : Integer;
      c : Char;
  begin
    ptr := @Data;
    for i := 0 to (Size shr 1)-1 do
    begin
      c := ptr^;
      ptr^ := (ptr+1)^;
      (ptr+1)^ := c;
      Inc(ptr,2);
    end;
  end;

begin
  Result := '';
  if SysUtils.Win32Platform=VER_PLATFORM_WIN32_NT then
    begin
      hDevice := CreateFile( '\\.\PhysicalDrive0', GENERIC_READ or GENERIC_WRITE,
        FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0 );
    end
  else
      hDevice := CreateFile( '\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0 );
  if hDevice=INVALID_HANDLE_VALUE then Exit;
  try
    FillChar(SCIP,SizeOf(TSendCmdInParams)-1,#0);
    FillChar(aIdOutCmd,SizeOf(aIdOutCmd),#0);
    cbBytesReturned := 0;
    with SCIP do
    begin
      cBufferSize  := IDENTIFY_BUFFER_SIZE;
      with irDriveRegs do
      begin
        bSectorCountReg  := 1;
        bSectorNumberReg := 1;
        bDriveHeadReg    := $A0;
        bCommandReg      := $EC;
      end;
    end;
    if not DeviceIoControl( hDevice, $0007c088, @SCIP, SizeOf(TSendCmdInParams)-1,
      @aIdOutCmd, SizeOf(aIdOutCmd), cbBytesReturned, nil ) then Exit;
  finally
    CloseHandle(hDevice);
  end;
  with PIdSector(@IdOutCmd.bBuffer)^ do
  begin
    ChangeByteOrder( sSerialNumber, SizeOf(sSerialNumber) );
    (PChar(@sSerialNumber)+SizeOf(sSerialNumber))^ := #0;
    Result := PansiChar(@sSerialNumber);
  end;
end;

function GetCnCPUInfoString: string;
const
  cnIFContinuous = '%.8x%.8x%.8x%.8x';
var
  iEax,iEbx,iEcx,iEdx: Integer;
begin
  asm
    push ebx
    push ecx
    push edx
    mov  eax, $1
    dw $A20F
    mov iEax, eax
    mov iEbx, ebx
    mov iEcx, ecx
    mov iEdx, edx
    pop edx
    pop ecx
    pop ebx
  end;
  Result := Format(cnIFContinuous, [iEax, iEbx, iEcx, iEdx])
end;

function GetMacAddress: string;
var
  Lib: Cardinal;
  Func: function(GUID: PGUID): Longint; stdcall;
  GUID1, GUID2: TGUID;
begin
  Result := '';
  Lib := LoadLibrary('rpcrt4.dll');
  if Lib <> 0 then
  begin
    if Win32Platform <>VER_PLATFORM_WIN32_NT then
      @Func := GetProcAddress(Lib, 'UuidCreate')
      else @Func := GetProcAddress(Lib, 'UuidCreateSequential');
    if Assigned(Func) then
    begin
      if (Func(@GUID1) = 0) and
        (Func(@GUID2) = 0) and
        (GUID1.D4[2] = GUID2.D4[2]) and
        (GUID1.D4[3] = GUID2.D4[3]) and
        (GUID1.D4[4] = GUID2.D4[4]) and
        (GUID1.D4[5] = GUID2.D4[5]) and
        (GUID1.D4[6] = GUID2.D4[6]) and
        (GUID1.D4[7] = GUID2.D4[7]) then
      begin
        Result :=
         IntToHex(GUID1.D4[2], 2) +
         IntToHex(GUID1.D4[3], 2) +
         IntToHex(GUID1.D4[4], 2) +
         IntToHex(GUID1.D4[5], 2) +
         IntToHex(GUID1.D4[6], 2) +
         IntToHex(GUID1.D4[7], 2);
      end;
    end;
    FreeLibrary(Lib);
  end;
end;

type
  TCPUIDResult = packed record
    EAX: Cardinal;
    EBX: Cardinal;
    ECX: Cardinal;
    EDX: Cardinal;
  end;
  TCPUType = (ctPrimary, ctOverDrive, ctSecondary, ctUnknown);

const
   CPUID_CPUSIGNATURE	: DWORD = $1;

var
  CPUID_Level: DWORD;

function ExecuteCPUID: TCPUIDResult; assembler;
asm
    PUSH    EBX
    PUSH    EDI
    MOV     EDI, EAX
    MOV     EAX, CPUID_LEVEL
    DW	    $A20F
    STOSD
    MOV     EAX, EBX
    STOSD
    MOV     EAX, ECX
    STOSD
    MOV     EAX, EDX
    STOSD
    POP     EDI
    POP     EBX
end;

function GetCPUSerialNumber: String;
  function SplitToNibble(ANumber: String): String;
  var
    rs:string;
  begin
    rs:=Copy(ANumber,0,4)+Copy(ANumber,5,4);
    Result:=rs;
  end;
var
  SerialNumber: TCPUIDResult;
begin
  Result:='';
  CPUID_Level:=CPUID_CPUSIGNATURE;
  SerialNumber:=ExecuteCPUID;
  Result:=SplitToNibble(IntToHex(SerialNumber.EAX,8));
  CPUID_Level:=CPUID_CPUSIGNATURE;
  SerialNumber:=ExecuteCPUID;
  Result:=Result+SplitToNibble(IntToHex(SerialNumber.EDX,8));
  Result:=Result+SplitToNibble(IntToHex(SerialNumber.ECX,8));
end;

{****CrcString*******************************************************************}
function CRC32(CRC: LongWord; Data: Pointer; DataSize: LongWord): LongWord; assembler;
asm
         AND    EDX,EDX
         JZ     @Exit
         AND    ECX,ECX
         JLE    @Exit
         PUSH   EBX
         PUSH   EDI
         XOR    EBX,EBX
         LEA    EDI,CS:[OFFSET @CRC32]
@Start:  MOV    BL,AL
         SHR    EAX,8
         XOR    BL,[EDX]
         XOR    EAX,[EDI + EBX * 4]
         INC    EDX
         DEC    ECX
         JNZ    @Start
         POP    EDI
         POP    EBX
@Exit:   RET
         DB 0, 0, 0, 0, 0 // Align Table
@CRC32:  DD 000000000h, 077073096h, 0EE0E612Ch, 0990951BAh
         DD 0076DC419h, 0706AF48Fh, 0E963A535h, 09E6495A3h
         DD 00EDB8832h, 079DCB8A4h, 0E0D5E91Eh, 097D2D988h
         DD 009B64C2Bh, 07EB17CBDh, 0E7B82D07h, 090BF1D91h
         DD 01DB71064h, 06AB020F2h, 0F3B97148h, 084BE41DEh
         DD 01ADAD47Dh, 06DDDE4EBh, 0F4D4B551h, 083D385C7h
         DD 0136C9856h, 0646BA8C0h, 0FD62F97Ah, 08A65C9ECh
         DD 014015C4Fh, 063066CD9h, 0FA0F3D63h, 08D080DF5h
         DD 03B6E20C8h, 04C69105Eh, 0D56041E4h, 0A2677172h
         DD 03C03E4D1h, 04B04D447h, 0D20D85FDh, 0A50AB56Bh
         DD 035B5A8FAh, 042B2986Ch, 0DBBBC9D6h, 0ACBCF940h
         DD 032D86CE3h, 045DF5C75h, 0DCD60DCFh, 0ABD13D59h
         DD 026D930ACh, 051DE003Ah, 0C8D75180h, 0BFD06116h
         DD 021B4F4B5h, 056B3C423h, 0CFBA9599h, 0B8BDA50Fh
         DD 02802B89Eh, 05F058808h, 0C60CD9B2h, 0B10BE924h
         DD 02F6F7C87h, 058684C11h, 0C1611DABh, 0B6662D3Dh
         DD 076DC4190h, 001DB7106h, 098D220BCh, 0EFD5102Ah
         DD 071B18589h, 006B6B51Fh, 09FBFE4A5h, 0E8B8D433h
         DD 07807C9A2h, 00F00F934h, 09609A88Eh, 0E10E9818h
         DD 07F6A0DBBh, 0086D3D2Dh, 091646C97h, 0E6635C01h
         DD 06B6B51F4h, 01C6C6162h, 0856530D8h, 0F262004Eh
         DD 06C0695EDh, 01B01A57Bh, 08208F4C1h, 0F50FC457h
         DD 065B0D9C6h, 012B7E950h, 08BBEB8EAh, 0FCB9887Ch
         DD 062DD1DDFh, 015DA2D49h, 08CD37CF3h, 0FBD44C65h
         DD 04DB26158h, 03AB551CEh, 0A3BC0074h, 0D4BB30E2h
         DD 04ADFA541h, 03DD895D7h, 0A4D1C46Dh, 0D3D6F4FBh
         DD 04369E96Ah, 0346ED9FCh, 0AD678846h, 0DA60B8D0h
         DD 044042D73h, 033031DE5h, 0AA0A4C5Fh, 0DD0D7CC9h
         DD 05005713Ch, 0270241AAh, 0BE0B1010h, 0C90C2086h
         DD 05768B525h, 0206F85B3h, 0B966D409h, 0CE61E49Fh
         DD 05EDEF90Eh, 029D9C998h, 0B0D09822h, 0C7D7A8B4h
         DD 059B33D17h, 02EB40D81h, 0B7BD5C3Bh, 0C0BA6CADh
         DD 0EDB88320h, 09ABFB3B6h, 003B6E20Ch, 074B1D29Ah
         DD 0EAD54739h, 09DD277AFh, 004DB2615h, 073DC1683h
         DD 0E3630B12h, 094643B84h, 00D6D6A3Eh, 07A6A5AA8h
         DD 0E40ECF0Bh, 09309FF9Dh, 00A00AE27h, 07D079EB1h
         DD 0F00F9344h, 08708A3D2h, 01E01F268h, 06906C2FEh
         DD 0F762575Dh, 0806567CBh, 0196C3671h, 06E6B06E7h
         DD 0FED41B76h, 089D32BE0h, 010DA7A5Ah, 067DD4ACCh
         DD 0F9B9DF6Fh, 08EBEEFF9h, 017B7BE43h, 060B08ED5h
         DD 0D6D6A3E8h, 0A1D1937Eh, 038D8C2C4h, 04FDFF252h
         DD 0D1BB67F1h, 0A6BC5767h, 03FB506DDh, 048B2364Bh
         DD 0D80D2BDAh, 0AF0A1B4Ch, 036034AF6h, 041047A60h
         DD 0DF60EFC3h, 0A867DF55h, 0316E8EEFh, 04669BE79h
         DD 0CB61B38Ch, 0BC66831Ah, 0256FD2A0h, 05268E236h
         DD 0CC0C7795h, 0BB0B4703h, 0220216B9h, 05505262Fh
         DD 0C5BA3BBEh, 0B2BD0B28h, 02BB45A92h, 05CB36A04h
         DD 0C2D7FFA7h, 0B5D0CF31h, 02CD99E8Bh, 05BDEAE1Dh
         DD 09B64C2B0h, 0EC63F226h, 0756AA39Ch, 0026D930Ah
         DD 09C0906A9h, 0EB0E363Fh, 072076785h, 005005713h
         DD 095BF4A82h, 0E2B87A14h, 07BB12BAEh, 00CB61B38h
         DD 092D28E9Bh, 0E5D5BE0Dh, 07CDCEFB7h, 00BDBDF21h
         DD 086D3D2D4h, 0F1D4E242h, 068DDB3F8h, 01FDA836Eh
         DD 081BE16CDh, 0F6B9265Bh, 06FB077E1h, 018B74777h
         DD 088085AE6h, 0FF0F6A70h, 066063BCAh, 011010B5Ch
         DD 08F659EFFh, 0F862AE69h, 0616BFFD3h, 0166CCF45h
         DD 0A00AE278h, 0D70DD2EEh, 04E048354h, 03903B3C2h
         DD 0A7672661h, 0D06016F7h, 04969474Dh, 03E6E77DBh
         DD 0AED16A4Ah, 0D9D65ADCh, 040DF0B66h, 037D83BF0h
         DD 0A9BCAE53h, 0DEBB9EC5h, 047B2CF7Fh, 030B5FFE9h
         DD 0BDBDF21Ch, 0CABAC28Ah, 053B39330h, 024B4A3A6h
         DD 0BAD03605h, 0CDD70693h, 054DE5729h, 023D967BFh
         DD 0B3667A2Eh, 0C4614AB8h, 05D681B02h, 02A6F2B94h
         DD 0B40BBE37h, 0C30C8EA1h, 05A05DF1Bh, 02D02EF8Dh
         DD 074726F50h, 0736E6F69h, 0706F4320h, 067697279h
         DD 028207468h, 031202963h, 020393939h, 048207962h
         DD 06E656761h, 064655220h, 06E616D64h, 06FBBA36Eh
end;

Function CrcString(source:string):longword;
var
x : ansistring;
begin
  x := ansistring(source);
  result := crc32(0,pansichar(x),length(x));
end;
{******************************************************************************}


{****GetFileDetails*********************************************************************}
function GetFileDetails(sFile:string; sUVI:string):string;
var
  dLen:         DWORD;
  BuffLen:      DWORD;
  dHandle:      DWORD;
  pBuff:        Pointer;
  pVerPtr:      Pointer;
  dVal:         WORD;
  sLangCharset: string;
  sTmp:         string;
  sBuff:        array[0..255] of Char;
begin
  dLen := GetFileVersionInfoSize(PChar(sFile), dHandle);
  if dLen <> 0 then
  begin
    BuffLen := dLen;
    pBuff := VirtualAlloc(nil, dLen, MEM_COMMIT, PAGE_READWRITE);
    if GetFileVersionInfo(PChar(sFile), dHandle, dLen, pBuff) then
    begin
      if VerQueryValue(pBuff, '\VarFileInfo\Translation', pVerPtr, dLen) then
      begin
        CopyMemory(@dVal, pVerPtr, 2);
        sTmp := '0000' + IntToHex(dVal, 0);
        sLangCharset := Copy(sTmp, Length(sTmp) - 3, 4);
        CopyMemory(@dVal, Pointer(DWORD(pVerPtr) + 2), 2);
        sTmp := '0000' + IntToHex(dVal, 0);
        sLangCharset := sLangCharset + Copy(sTmp, Length(sTmp) - 3, 4);
        if VerQueryValue(pBuff, PChar('\StringFileInfo\' + sLangCharset + '\' + sUVI), pVerPtr, dLen) then
        begin
          FillChar(sBuff, 256, #0);
          lstrcpy(sBuff, pVerPtr);
          Result := sBuff;
          VirtualFree(pBuff, BuffLen, MEM_DECOMMIT);
        end;
      end;
    end;
  end;
end;
{*************************************************************************************}

Function GetHardwareid: longword;
var
hardwareid : string;
begin
  hardwareid := '';
  if GetCPUSerialNumber <> '' then
    hardwareid := hardwareid + GetCPUSerialNumber;
  if Trim(String(GetIdeSerialNumber)) <> '' then
    hardwareid := hardwareid + Trim(String(GetIdeSerialNumber));
  result := CrcString(hardwareid);
end;

end.


