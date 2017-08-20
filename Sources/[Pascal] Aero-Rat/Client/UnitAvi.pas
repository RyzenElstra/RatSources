unit UnitAvi;

interface

uses
  Windows,Classes,Dialogs, FOrms,UnitSaveProgress,SysUtils;

const
      // AVISaveOptions Dialog box flags

      ICMF_CHOOSE_KEYFRAME        =  1;     // show KeyFrame Every box
      ICMF_CHOOSE_DATARATE        =  2;     // show DataRate box
      ICMF_CHOOSE_PREVIEW         =  4;     // allow expanded preview dialog
      ICMF_CHOOSE_ALLCOMPRESSORS  =  8;     // don't only show those that
                                            // can handle the input format
                                            // or input data
      AVIIF_KEYFRAME              = 10;

type

  AVI_COMPRESS_OPTIONS = packed record
      fccType : DWORD;            // stream type, for consistency
      fccHandler : DWORD;         // compressor
      dwKeyFrameEvery : DWORD;    // keyframe rate
      dwQuality : DWORD;          // compress quality 0-10,000
      dwBytesPerSecond : DWORD;   // bytes per second
      dwFlags : DWORD;            // flags... see below
      lpFormat : DWORD;           // save format
      cbFormat : DWORD;
      lpParms : DWORD;            // compressor options
      cbParms : DWORD;
      dwInterleaveEvery : DWORD;  // for non-video streams only
  end;


  AVI_STREAM_INFO = packed record
      fccType : DWORD;
      fccHandler : DWORD;
      dwFlags : DWORD;
      dwCaps : DWORD;
      wPriority : word;
      wLanguage : word;
      dwScale : DWORD;
      dwRate : DWORD;
      dwStart : DWORD;
      dwLength : DWORD;
      dwInitialFrames : DWORD;
      dwSuggestedBufferSize : DWORD;
      dwQuality : DWORD;
      dwSampleSize : DWORD;
      rcFrame : TRect;
      dwEditCount  : DWORD;
      dwFormatChangeCount : DWORD;
      szName : array [0..63] of char;
  end;


  BITMAPINFOHEADER = packed record
      biSize : DWORD;
      biWidth : DWORD;
      biHeight : DWORD;
      biPlanes : word;
      biBitCount : word;
      biCompression : DWORD;
      biSizeImage : DWORD;
      biXPelsPerMeter : DWORD;
      biYPelsPerMeter : DWORD;
      biClrUsed : DWORD;
      biClrImportant : DWORD;
  end;

  BITMAPFILEHEADER = packed record
      bfType : word;  //"magic cookie" - must be "BM"
      bfSize : integer;
      bfReserved1 : word;
      bfReserved2 : word;
      bfOffBits : integer;
  end;

var
  Dum: String;
  procedure CreateAVI(CallBack: pointer; const FileName : string; IList : TStrings; FramesPerSec : integer = 10);
  function AVISaveOptions(Hwnd : DWORD; uiFlags : DWORD; nStreams : DWORD; pPavi : Pointer; plpOptions : Pointer) : boolean; stdcall; external 'avifil32.dll';
  function AVIFileCreateStream(pFile : DWORD; pPavi : Pointer; pSi : Pointer) : integer; stdcall; external 'avifil32.dll';
  function AVIFileOpen(pPfile : Pointer; szFile : PChar; uMode : DWORD; clSid : DWORD) : integer; stdCall; external 'avifil32.dll';
  function AVIMakeCompressedStream(psCompressed : Pointer; psSource : DWORD; lpOptions : Pointer; pclsidHandler : DWORD) : integer; stdcall; external 'avifil32.dll';
  function AVIStreamSetFormat(pAvi : DWORD; lPos : DWORD; lpGormat : Pointer; cbFormat : DWORD) : integer; stdcall; external 'avifil32.dll';
  function AVIStreamWrite(pAvi : DWORD; lStart : DWORD; lSamples : DWORD; lBuffer : Pointer; cBuffer : DWORD; dwFlags : DWORD; plSampWritten : DWORD; plBytesWritten : DWORD) : integer; stdcall; external 'avifil32.dll';
  function AVISaveOptionsFree(nStreams : DWORD; ppOptions : Pointer) : integer; stdcall; external 'avifil32.dll';
  function AVIFileRelease(pFile : DWORD) : integer; stdcall; external 'avifil32.dll';
  procedure AVIFileInit; stdcall; external 'avifil32.dll';
  procedure AVIFileExit; stdcall; external 'avifil32.dll';
  function AVIStreamRelease(pAvi : DWORD) : integer; stdcall; external 'avifil32.dll';
  function mmioStringToFOURCCA(sz : PChar; uFlags : DWORD) : integer; stdcall; external 'winmm.dll';


implementation


// DLL External declarations


// ============================================================================
// Main Function to Create AVI file from BMP file listing
// ============================================================================

procedure CreateAVI(CallBack: pointer; const FileName : string; IList : TStrings; FramesPerSec : integer = 10);
var
  Opts : AVI_COMPRESS_OPTIONS;
  pOpts : Pointer;
  pFile,ps,psCompressed : DWORD;
  strhdr : AVI_STREAM_INFO;
  i : integer;
  BFile : file;
  m_Bih : BITMAPINFOHEADER;
  m_Bfh : BITMAPFILEHEADER;
  m_MemBits : packed array of byte;
  m_MemBitMapInfo : packed array of byte;
  ProgressFunc: procedure(Pos,Max: dword);
begin
  @ProgressFunc := CallBack;

  DeleteFile(pchar(FileName));
  Fillchar(Opts,SizeOf(Opts),0);
  FillChar(strhdr,SizeOf(strhdr),0);
  Opts.fccHandler := 541215044;    // Full frames Uncompressed
  AVIFileInit;
  pfile := 0;
  pOpts := @Opts;

  if AVIFileOpen(@pFile,PChar(FileName),OF_WRITE or OF_CREATE,0) = 0 then begin
     // Determine Bitmap Properties from file item[0] in list
     AssignFile(BFile,IList[0]);
     Reset(BFile,1);
     BlockRead(BFile,m_Bfh,SizeOf(m_Bfh));
     BlockRead(BFile,m_Bih,SizeOf(m_Bih));
     SetLength(m_MemBitMapInfo,m_bfh.bfOffBits - 14);
     SetLength(m_MemBits,m_Bih.biSizeImage);
     Seek(BFile,SizeOf(m_Bfh));
     BlockRead(BFile,m_MemBitMapInfo[0],length(m_MemBitMapInfo));
     CloseFile(BFile);

     strhdr.fccType := mmioStringToFOURCCA('vids', 0);      // stream type video
     strhdr.fccHandler := 0;                                // def AVI handler
     strhdr.dwScale := 1;
     strhdr.dwRate := FramesPerSec;                         // fps 1 to 30
     strhdr.dwSuggestedBufferSize := m_Bih.biSizeImage;     // size of 1 frame
     SetRect(strhdr.rcFrame,0,0,m_Bih.biWidth,m_Bih.biHeight);

     if AVIFileCreateStream(pFile,@ps,@strhdr) = 0 then begin
        // if you want user selection options then call following line
        // (but seems to only like "Full frames Uncompressed option)

         AVISaveOptions(Application.Handle,
                        ICMF_CHOOSE_KEYFRAME or ICMF_CHOOSE_DATARATE,
                        1,@ps,@pOpts);
         AVISaveOptionsFree(1,@pOpts);

        if AVIMakeCompressedStream(@psCompressed,ps,@opts,0) = 0 then begin
            if AVIStreamSetFormat(psCompressed,0,@m_memBitmapInfo[0],
                                  length(m_MemBitMapInfo)) = 0 then begin

               for i := 0 to IList.Count - 1 do begin
                 try
                 AssignFile(BFile,IList[i]);
                 Reset(BFile,1);
                 Seek(BFile,m_bfh.bfOffBits);
                 BlockRead(BFile,m_MemBits[0],m_Bih.biSizeImage);
                 Seek(BFile,SizeOf(m_Bfh));
                 BlockRead(BFile,m_MemBitMapInfo[0],length(m_MemBitMapInfo));
                 CloseFile(BFile);
                 except
                 end;
                 if AVIStreamWrite(psCompressed,i,1,@m_MemBits[0], m_Bih.biSizeImage,AVIIF_KEYFRAME,0,0) <> 0 then begin
                    //ShowMessage('Error during Write AVI File');
                    //break;
                 end;
                 DeleteFile(pchar(IList[i]));
                 if @ProgressFunc <> nil then ProgressFunc(i,IList.Count);
                 Application.ProcessMessages;
               end;
            end;
        end;
     end;

     AVIStreamRelease(ps);
     AVIStreamRelease(psCompressed);
     AVIFileRelease(pFile);
  end;

  AVIFileExit;
  m_MemBitMapInfo := nil;
  m_memBits := nil;
  if @ProgressFunc <> nil then ProgressFunc(IList.Count,IList.Count);

end;


end.
 