unit retCompress;

{

RetCompress unit
=============================================================
author: retnyg @ krazz.net/retnyg
=============================================================

License: use this code whereever you want, but keep credits

=============================================================

uses a undocumented API of ntdll to compress data.
compression rate is similar to ZIP, but a lot faster (up to
15 times than WinRar).

disadvantage: needs winNT, API may be changed or abandoned
in the future.

i added also the routines Inflate/Deflate, which just
packs sequential #0's, which is quite effective when
packing small exe's.

take also a look at the function HardCodedString, it's
commented out, because it needs the command inttostr,
which is in sysutils. It can be used to Hardcode a binary
string into a delphi app, such as to generate an exe by code.

example application can be found here:
http://www.delphipraxis.net/topic54428_batch+dateien.html

Information about the used Api Commands can be found here:

http://undocumented.ntinternals.net/

version 1.2
- stores unpackable data
- added CompressFile

}

interface
uses windows, sysutils;

type
  PVOID = pointer;
  ULONG = cardinal;
  NTSTATUS = cardinal;
const

// RtlCompressBuffer constants

  COMPRESSION_FORMAT_NONE	    = $00000000;		// [result:STATUS_INVALID_PARAMETER]
  COMPRESSION_FORMAT_DEFAULT  = $00000001;		// [result:STATUS_INVALID_PARAMETER]
  COMPRESSION_FORMAT_LZNT1	  = $00000002;
  COMPRESSION_FORMAT_NS3	    = $00000003;		// STATUS_NOT_SUPPORTED
  COMPRESSION_FORMAT_NS15	    = $0000000F;		// STATUS_NOT_SUPPORTED
  COMPRESSION_FORMAT_SPARSE	  = $00004000;		// ??? [result:STATUS_INVALID_PARAMETER]

  COMPRESSION_ENGINE_STANDARD = $00000000;		// Standart compression
  COMPRESSION_ENGINE_MAXIMUM  = $00000100;		// Maximum (slowest but better)
  COMPRESSION_ENGINE_HIBER	  = $00000200;		// STATUS_NOT_SUPPORTED


function RtlGetCompressionWorkSpaceSize(CompressionFormatAndEngine: ULONG; CompressBufferWorkSpaceSize, CompressFragmentWorkSpaceSize : PULONG): NTSTATUS; stdcall;
function RtlCompressBuffer(CompressionFormatAndEngine:ULONG; SourceBuffer: PVOID; SourceBufferLength: ULONG; DestinationBuffer: PVOID; DestinationBufferLength: ULONG; SourceChunkSize: ULONG; pDestinationSize: PULONG; WorkspaceBuffer: PVOID):NTSTATUS; stdcall;
function RtlDeCompressBuffer(CompressionFormatAndEngine:ULONG; DestinationBuffer: PVOID; DestinationBufferLength: ULONG; SourceBuffer: PVOID; SourceBufferLength: ULONG; pDestinationSize: PULONG):NTSTATUS; stdcall;

function Compress(s:string):string; stdcall;
function DeCompress(s:string):string; stdcall;
function CompressFile(infile,outfile: string; const DoDeCompress: boolean = false):integer; stdcall;

function InFlate(s:string): string; stdcall;
function DeFlate(s:string): string; stdcall;
function HardCodedString(s:string):string; stdcall;

implementation

const
  ntdll = 'ntdll.dll';

function RtlGetCompressionWorkSpaceSize;  external ntdll name 'RtlGetCompressionWorkSpaceSize';
function RtlCompressBuffer;  external ntdll name 'RtlCompressBuffer';
function RtlDeCompressBuffer;  external ntdll name 'RtlDecompressBuffer';

function fastlength(s:string):dword;
asm
   test eax, eax
   jz @ende
   sub eax, 4
   mov eax, [eax]
   @ende:
end;

function Compress(s:string):string; stdcall;
var wsbuf: pointer;
    destSize, wsSize, wsFragsize: cardinal;
    l: cardinal;
    compressionType: cardinal;
begin
  l:=fastlength(s);
  if l > 0 then begin
    // maximum compression can get really slow on bigger files, so we do fast if
    // file bigger than a half mb:
    if l > $80000 then
      compressionType := COMPRESSION_FORMAT_LZNT1 or COMPRESSION_ENGINE_STANDARD
    else
      compressionType := COMPRESSION_FORMAT_LZNT1 or COMPRESSION_ENGINE_MAXIMUM;

    rtlGetCompressionWorkspaceSize( compressionType, @wssize, @wsfragsize);
    getmem(wsbuf, wssize);
    setlength(result, l + 4);
    destsize := 0;
    rtlCompressBuffer(compressionType, @s[1], l, @result[5], l, $1000, @destSize, wsBuf);
    freemem(wsbuf);
    pcardinal(@result[1])^ := l;
    if destsize = 0 then // no compression possible
    begin
      {asm
        mov ecx, l
        xor eax, eax
        mov eax, ecx
        and eax, $00000003
        shr ecx, 2
        mov edi, result
        mov edi, [edi]
        add edi, 4
        mov esi, s
        rep movsd
        mov ecx, eax
        rep movsb
      end; }
      move(pointer(@s[1])^,pointer(@result[5])^,l);
    end
    else begin
      delete(result, destsize + 5, maxint);
    end;
  end else result := '';
end;

function DeCompress(s:string):string; stdcall;
var packedSize, unpackedSize, destSize, compressionType: cardinal;
begin
  packedSize := fastlength(s) - 4;
  if packedSize > 0 then begin
    unpackedSize := pcardinal(@s[1])^;
    setlength(result,unPackedSize);
    if PackedSize = UnPackedSize then
       move(pointer(@s[5])^,pointer(@result[1])^,PackedSize)
    else begin
      if unPackedSize > $80000 then
        compressionType := COMPRESSION_FORMAT_LZNT1 or COMPRESSION_ENGINE_STANDARD
      else
        compressionType := COMPRESSION_FORMAT_LZNT1 or COMPRESSION_ENGINE_MAXIMUM;
      rtlDeCompressBuffer( compressionType, @result[1],unPackedSize,@s[5],packedSize,@DestSize );
    end;
  end else result := '';
end;

function CompressFile(infile,outfile: string; const DoDeCompress: boolean = false):integer; stdcall;
//Compress/Decompresses a file. Result is packing percentage. or maxint, if error
var f: integer;
    fs: cardinal;
    buf: string;
begin
   result := maxint;
   if fileexists(infile) then begin
     f := fileopen(infile, fmOpenRead);
     if f <> 0 then begin
       fs := FileSeek(f,0,2);
       FileSeek(f,0,0);
       setlength(buf,fs);
       fileread(f,pointer(@buf[1])^,fs);
       fileclose(f);
       f := fileCreate(outfile,fmOpenWrite);
       if f <> 0 then begin
         if DoDeCompress then buf:=decompress(buf)
          else buf:=compress(buf);
         filewrite(f,pointer(@buf[1])^,length(buf));
         fileclose(f);
         result := 100-(round(length(buf)/(fs/100)));
       end;
     end;  
   end;
end;

function InFlate(s:string): string; stdcall;
var i: cardinal;
    c, ordc: byte;
    l: dword;
begin
  result := '';
  l:=fastlength(s);
  i := 1;
  while i <= l do begin
     ordc := byte(s[i]);
     if ordc = 0 then begin
        c:=0;
        while (byte(s[i])=0) and (c<255) and (i <= l) do begin
          inc(c);
          inc(i);
        end;
        result := result + #0 +char(c);
     end
     else  begin
       result := result + s[i];
       inc(i);
     end;
  end;
end;

function DeFlate(s:string): string; stdcall;
var i: cardinal;
    c, ordc: byte;
    l,l2: dword;
begin
  result := '';
  l:=fastlength(s);
  i := 1;
  while i <= l do begin
     ordc := byte(s[i]);
     if ordc = 0 then begin
        c:=byte(s[i+1]);
        l2:=fastlength(result);
        setlength(result, l2 + c);
        fillchar(pointer(@result[l2+1])^,c,0);
        inc(i);
     end
     else  begin
       result := result + s[i];
     end;
     inc(i);
  end;
end;

function HardCodedString(s:string):string; stdcall;

  function isText(b:byte):boolean;
  begin
    result := false;
    if (b >= 32) and (b <= 175) and (b<>168) then result := true;
  end;

var i : cardinal;
    stract, DoLF: boolean;
    ordc: byte;
begin
  stract := false;
  DoLF:=falsE;
  for i := 1 to fastlength(s) do begin
     ordc := byte(s[i]);
     if ((stract) and (not istext(ordc))) OR
     ((not stract) and (istext(ordc))) then begin
       stract := not stract;
       result := result + '''';
     end;
     if stract then result := result + s[i]
     else result := result + '#' + inttostr(ordc);
     if i mod 30 = 0 then DoLF := true;
     if (not stract) and (DoLF) then begin
       result := result + ' + '#13#10;
       DoLF := falsE;
     end;
  end;
  if stract then result := result + '''';
  result := result + ';';
end;

end.
