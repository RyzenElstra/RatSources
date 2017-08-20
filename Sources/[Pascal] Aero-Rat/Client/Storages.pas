// (c) Alex Konshin mailto:alexk@msmt.spb.su 02.12.97

unit Storages;

interface

uses
	SysUtils, Windows, Classes, Forms, ActiveX;

const
	stgmOpenReadWrite = {STGM_TRANSACTED or} STGM_READWRITE or STGM_SHARE_DENY_WRITE;
	stgmOpenRead = {STGM_TRANSACTED or} STGM_READ or STGM_SHARE_DENY_WRITE;
	stgmCreate = {STGM_TRANSACTED or} STGM_READWRITE or STGM_SHARE_EXCLUSIVE or STGM_FAILIFTHERE;
	stgmConvert = {STGM_TRANSACTED or} STGM_READWRITE or STGM_SHARE_EXCLUSIVE or STGM_CONVERT;

type
	TStorage = class;

	TStgStream  = class(TStream)
	protected
		FStream : IStream;
		FStorage : TStorage;
		FName, FPath : String;
    procedure SetSize( NewSize : Longint ); override;
		procedure SetName( Value : String); virtual;
		constructor Create( const AName : String; AStorage : TStorage; AStream : IStream );
	public
    function Read( var Buffer; Count : Longint ) : Longint; override;
    function Write( const Buffer; Count : Longint ) : Longint; override;
    function Seek( Offset : Longint; Origin : Word ) : Longint; override;
		destructor Destroy; override;
		property asIStream : IStream read FStream;
		property Storage : TStorage read FStorage;
	published
		property Name : String read FName write SetName;
	end; { TStgStream  }

	TStorage = class
	protected
		FStorage : IStorage;
		FName, FPath : String;
		FParent : TStorage;
		FLockCount : LongInt;
		procedure SetName( Value : String); virtual;
		constructor Create( const AName : String; AParent : TStorage; AStorage : IStorage );
	public
		destructor Destroy; override; // нужно использовать Close !
		procedure Close;
		function CreateStream( const AName : String; const Mode : DWord ) : TStgStream;
		function OpenStream( const AName : String; const Mode : DWord ) : TStgStream;
		function OpenCreateStream( const AName : String; const Mode : DWord ) : TStgStream;
		function CreateStorage( const AName : String; const Mode : DWord ) : TStorage;
		function OpenStorage( const AName : String; const Mode : DWord ) : TStorage;
		function OpenCreateStorage( const AName : String; const Mode : DWord; var bCreate : Boolean ) : TStorage;
		procedure RenameElement( const AOldName, ANewName : String );
//    STGTY_STORAGE      = 1,
//    STGTY_STREAM       = 2,
//    STGTY_LOCKBYTES    = 3,
//    STGTY_PROPERTY     = 4
		procedure EnumElements( AStrings : TStrings );
	published
		property Storage : IStorage read FStorage;
		property Name : String read FName write SetName;
		property Path : String read FPath;
	end; { TStorage }

	TStgFile = class(TStorage)
	protected
		FFileName : String;
		constructor Create( const AFileName : String; AStorage : IStorage );
	public
		class function CreateFile( const AFileName : String; const Mode : DWord ) : TStgFile;
		class function OpenFile( const AFileName : String; const Mode : DWord ) : TStgFile;
//		function Clone( const Mode : DWord ) : TStgFile;
	end; { TStgFile }

function ModeToStgMode( const Mode : Word ) : DWORD;

// fmCreate			Create a file with the given name. If a file with the given name exists, open the file in write mode.
// fmOpenRead		Open the file for reading only.
// fmOpenWrite	Open the file for writing only. Writing to the file completely replaces the current contents.
// fmOpenReadWrite	Open the file to modify the current contents rather than replace them.
//
// fmShareCompat		Sharing is compatible with the way FCBs are opened.
// fmShareExclusive	Other applications can not open the file for any reason.
// fmShareDenyWrite	Other applications can open the file for reading but not for writing.
// fmShareDenyRead	Other applications can open the file for writing but not for reading.
// fmShareDenyNone	No attempt is made to prevent other applications from reading from or writing to the file.

function OpenStream( const APath : String; const Mode : Word ) : TStream; // Open plain file or IStream as TStream
function OpenStorage( const APath : String; const Mode : Word ) : TStorage;

//=============================================================
implementation

uses
	ComObj;//, StringConv;

type
	TStgFmt = (
		STGFMT_STORAGE,// = 0 Indicates that the file must be a compound file.
       _stgfmt_1,
		   _stgfmt_2,
		STGFMT_FILE,   // = 3 Indicates that the file must not be a compound file.
		               //     This element is only valid when using the StgCreateStorageEx
									 //     or StgOpenStorageEx functions to access the NTFS file system
									 //     implementation of the IPropertySetStorage interface.
		STGFMT_ANY,    // = 4 Indicates that the system will determine the file type and use
		               //     the appropriate structured storage or property set implementation.
									 //     This value cannot be used with the StgCreateStorageEx function.
		STGFMT_DOCFILE // = 5 Indicates that the file must be a compound file, and is similar
		               //     to the STGFMT_STORAGE flag, but indicates that the compound-file
									 //     form of the compound-file implementation must be used.
	);

	TStgOptions = packed record
		usVersion : Word;
		reserved  : Word;
		ulSectorSize : DWORD;
	end;
	PStgOptions = ^TStgOptions;

	TStgOpenStorageEx = function (
		pwcsName: POleStr;
		grfMode : DWORD;        // Specifies the access mode for the object
		stgfmt : TStgFmt;       // Specifies the storage file format
		grfAttrs : DWORD;       // Reserved; must be zero
		pOptions : PStgOptions; // Address of STGOPTIONS pointer
		reserved2	: Pointer;    // Reserved; must be zero
		riid : PGUID;           // Specifies the GUID of the interface pointer
		out stgOpen: IStorage
	) : HResult; stdcall;

const
  ole32    = 'ole32.dll';

//=============================================================
//  fmCreate         = $ffff;
//  fmOpenRead       = $0000;
//  fmOpenWrite      = $0001;
//  fmOpenReadWrite  = $0002;
//  fmShareCompat    = $0000;
//  fmShareExclusive = $0010;
//  fmShareDenyWrite = $0020;
//  fmShareDenyRead  = $0030;
//  fmShareDenyNone  = $0040;
function ModeToStgMode( const Mode : Word ) : DWORD;
const
		RWModes : Array [0..3] of DWord = (STGM_READ,STGM_WRITE,STGM_READWRITE,0);
		ShareModes : Array [0..7] of DWord =
		(	STGM_SHARE_EXCLUSIVE,STGM_SHARE_EXCLUSIVE,STGM_SHARE_DENY_WRITE,STGM_SHARE_DENY_READ,
			STGM_SHARE_DENY_NONE,STGM_SHARE_EXCLUSIVE,STGM_SHARE_EXCLUSIVE,STGM_SHARE_EXCLUSIVE);
begin
	if Mode=fmCreate then Result := stgmCreate
	else Result := RWModes[Mode and 3] or ShareModes[Mode shr 4];
end;
//-------------------------------------------------------------
function GetName( var ptr : PChar; var len : Integer ) : String;
const Delimitors : String = '/\'#0;
var	i : Integer;
begin
	Result := '';
	//i := QScanChars( ptr, len, Delimitors );
 	if i>0 then
		begin
 			Dec(i);
 			if i=0 then Exit;
			Result := Copy(ptr,1,i);
 			Inc(ptr,i);
 			Dec(len,i)
		end
 	else
  	begin
  		Result := Copy(ptr,1,len);
  		ptr := nil;
  		len := 0;
		end;
end;
//-------------------------------------------------------------
// Open plain file or IStream
//
// path\file
// d:\path\file
// path\file:path\stream
// d:\path\file:path\stream
// \\server\resource\path\file:path\stream
function OpenStream( const APath : String; const Mode : Word ) : TStream;
var	ptr, pc : PChar;
		len, i : Integer;
		dwStgMode : DWord;
		sName, sFile : String;
		bCreate : Boolean;
		oStg, oStgNext : TStorage;
begin
	Result := nil;
	if APath='' then Exit;
	ptr := PChar(APath);
	len := Length(APath);
	//if SkipBlanksLen(ptr,len)=nil then Exit;
	if (ptr^<>'\')and(ptr^<>'/')and(len>2)and((ptr+1)^=':') then pc := ptr+2
	else pc := ptr;
	pc := StrScan(pc,':');
	if pc=nil then
	begin
		sFile := Copy(ptr,1,len);
		Result := TFileStream.Create( sFile, Mode);
		Exit;
	end;
	i := pc-ptr;
	sFile := Copy(ptr,1,i);
	Inc(i);
	Inc(ptr,i);
	Dec(len,i);
	if len=0 then Exit;
	dwStgMode := ModeToStgMode(Mode);
	bCreate := False;
// открываем/создаем структурированный файл
	if not FileExists(sFile) then
		begin
			if Mode<>fmCreate then raise EWriteError.Create('File '''+sFile+''' not found');
			oStg := TStgFile.CreateFile(sFile,stgmCreate);
			bCreate := True;
		end
	else
		begin
			if Mode=fmCreate then dwStgMode := {stgmOpenReadWrite}STGM_READWRITE or STGM_SHARE_EXCLUSIVE;
			oStg := TStgFile.OpenFile(sFile,dwStgMode)
		end;
	if oStg<>nil then
	try
		sName := GetName(ptr,len);
		while (len>0)and(ptr<>nil) do
		begin
			Inc(ptr);
			Dec(len);
			if sName<>'' then
			begin
				Dec(oStg.FLockCount);
				if Mode=fmCreate then oStgNext := oStg.OpenCreateStorage(sName,dwStgMode,bCreate)
				else oStgNext := oStg.OpenStorage(sName,dwStgMode);
				oStg := oStgNext;
			end;
			sName := GetName(ptr,len);
		end;
		if sName='' then Result := nil
		else if bCreate then Result := oStg.CreateStream(sName,dwStgMode)
		else if Mode=fmCreate then Result := oStg.OpenCreateStream(sName,dwStgMode)
		else Result := oStg.OpenStream(sName,dwStgMode);
		oStg.Close;
	except
		if oStg<>nil then	oStg.Close;
		raise;
	end;
end;
//-------------------------------------------------------------
function OpenStorage( const APath : String; const Mode : Word ) : TStorage;
var	ptr, pc : PChar;
		len, i : Integer;
		dwStgMode : DWord;
		sName, sFile : String;
		bCreate : Boolean;
		oStg : TStorage;
begin
	Result := nil;
	if APath='' then Exit;
	ptr := PChar(APath);
	len := Length(APath);
	//if SkipBlanksLen(ptr,len)=nil then Exit;
	if (ptr^<>'\')and(ptr^<>'/')and(len>2)and((ptr+1)^=':') then pc := ptr+2
	else pc := ptr;
	dwStgMode := ModeToStgMode(Mode);
	pc := StrScan(pc,':');
	if pc=nil then
	begin
		sFile := Copy(ptr,1,len);
		if not FileExists(sFile) then
			begin
				if Mode<>fmCreate then raise EWriteError.Create('File '''+sFile+''' not found');
				Result := TStgFile.CreateFile(sFile,stgmCreate);
			end
		else Result := TStgFile.OpenFile(sFile,dwStgMode);
		Exit;
	end;
	i := pc-ptr;
	sFile := Copy(ptr,1,i);
	Inc(i);
	Inc(ptr,i);
	Dec(len,i);
//	if len=0 then Exit;
	bCreate := False;
	oStg := nil;
// открываем/создаем структурированный файл
	if not FileExists(sFile) then
		begin
			if Mode<>fmCreate then raise EWriteError.Create('File '''+sFile+''' not found');
			Result := TStgFile.CreateFile(sFile,stgmCreate);
			bCreate := True;
		end
	else
		begin
			if Mode=fmCreate then dwStgMode := STGM_READWRITE or STGM_SHARE_EXCLUSIVE;{stgmOpenReadWrite;}
			Result := TStgFile.OpenFile(sFile,dwStgMode)
		end;
	if Result<>nil then
	try
		while (len>0)and(ptr<>nil) do
		begin
			Inc(ptr);
			Dec(len);
			sName := GetName(ptr,len);
			if sName<>'' then
			begin
				oStg := Result;
				Result := nil;
				if Mode=fmCreate then Result := oStg.OpenCreateStorage(sName,dwStgMode,bCreate)
				else Result := oStg.OpenStorage(sName,dwStgMode);
				oStg.Close;
			end;
		end;
	except
		if Result<>nil then Result.Close else if oStg<>nil then	oStg.Close;
		raise;
	end;
end;

//==TStgStream===========================================================
constructor TStgStream.Create( const AName : String; AStorage : TStorage; AStream : IStream );
begin
	inherited Create;
	FStream := AStream;
	FStorage := AStorage;
	if AStorage<>nil then
	begin
		FPath := AStorage.FPath+AStorage.FName+'\';
		Inc(AStorage.FLockCount);
	end;
	FName := AName;
end; {TStgStream.Create}
//-------------------------------------------------------------
destructor TStgStream.Destroy;
begin
{	if FStream<>nil then
	begin
		FStream._Release;
		FStream := nil;
	end;}
	FStream := nil;
	if FStorage<>nil then FStorage.Close;
	inherited Destroy;
end; {TStgStream.Destroy}
//-------------------------------------------------------------
function TStgStream.Read( var Buffer; Count : Longint ) : Longint;
begin
	Result := 0;
	if FStream<>nil then OleCheck( FStream.Read( @Buffer, Count, @Result ) );
end; {TStgStream.Read}
//-------------------------------------------------------------
function TStgStream.Write( const Buffer; Count : Longint ) : Longint;
begin
	Result := 0;
	if FStream<>nil then OleCheck( FStream.Write( @Buffer, Count, @Result ) );
end; {TStgStream.Write}
//-------------------------------------------------------------
function TStgStream.Seek( Offset : Longint; Origin : Word ) : Longint;
var	NewPos : LargeInt;
begin
	Result := 0;
	if FStream=nil then Exit;
	OleCheck( FStream.Seek( Offset, Origin, NewPos ) );
{$IFNDEF VER110}
	Result := LongInt(NewPos);
{$ELSE}
	Result := Trunc(NewPos);
{$ENDIF}
end; {TStgStream.Seek}
//-------------------------------------------------------------
procedure TStgStream.SetSize( NewSize : Longint );
begin
	if FStream=nil then Exit;
	OleCheck( FStream.SetSize(NewSize) );
end; {TStgStream.SetSize}
//-------------------------------------------------------------
procedure TStgStream.SetName( Value : String );
begin
	if FName=Value then Exit;
	if FStorage<>nil then FStorage.RenameElement(FName,Value);
	FName := Value;
end; {TStgStream.SetName}

//==TStorage===========================================================
constructor TStorage.Create( const AName : String; AParent : TStorage; AStorage : IStorage );
begin
	inherited Create;
	FStorage := AStorage;
	FName := AName;
	FParent := AParent;
	if AParent<>nil then
	begin
		FPath := AParent.FPath+AParent.FName+'\';
		Inc(AParent.FLockCount);
	end;
end; {TStorage.Create}
//-------------------------------------------------------------
destructor TStorage.Destroy;
begin
{	if FStorage<>nil then
	begin
		FStorage._Release;
		FStorage := nil;
	end;}
	FStorage := nil;
	FLockCount := 0;
	if FParent<>nil then FParent.Close;
	inherited Destroy;
end;
//-------------------------------------------------------------
procedure TStorage.Close;
begin
	if FLockCount>0 then Dec(FLockCount) else FStorage := nil;
end;
//-------------------------------------------------------------
function TStorage.CreateStream( const AName : String; const Mode : DWord ) : TStgStream;
var	pw : PWideChar;
		rc : HResult;
		newStream : IStream;
begin
	Result := nil;
	if (FStorage=nil)or(AName='') then Exit;
	pw := StringToOleStr(AName);
	try
		rc := FStorage.CreateStream( pw, Mode, 0, 0, newStream );
		if rc<>S_OK then OleError(rc);
	finally
		SysFreeString(pw);
	end;
	if newStream=nil then Exit;
	Result := TStgStream.Create( AName, Self, newStream );
end;
//-------------------------------------------------------------
function TStorage.OpenStream( const AName : String; const Mode : DWord ) : TStgStream;
var	pw : PWideChar;
		rc : HResult;
		newStream : IStream;
begin
	Result := nil;
	if (FStorage=nil)or(AName='') then Exit;
	pw := StringToOleStr(AName);
	try
		rc := FStorage.OpenStream( pw, nil, Mode, 0, newStream );
		if rc<>S_OK then OleError(rc);
	finally
		SysFreeString(pw);
	end;
	if newStream=nil then Exit;
	Result := TStgStream.Create( AName, Self, newStream );
end;
//-------------------------------------------------------------
function TStorage.OpenCreateStream( const AName : String; const Mode : DWord ) : TStgStream;
var	pw : PWideChar;
		rc : HResult;
		newStream : IStream;
begin
	Result := nil;
	if (FStorage=nil)or(AName='') then Exit;
	pw := StringToOleStr(AName);
	try
		rc := FStorage.OpenStream( pw, nil, Mode and ($ffffffff xor STGM_CREATE xor STGM_CONVERT), 0, newStream );
		if rc=STG_E_FILENOTFOUND then rc := FStorage.CreateStream( pw, Mode, 0, 0, newStream );
		if rc<>S_OK then OleError(rc);
	finally
		SysFreeString(pw);
	end;
	if newStream=nil then Exit;
	Result := TStgStream.Create( AName, Self, newStream );
end;
//-------------------------------------------------------------
function TStorage.CreateStorage( const AName : String; const Mode : DWord ) : TStorage;
var	pw : PWideChar;
		rc : HResult;
		newStg : IStorage;
begin
	Result := nil;
	if (FStorage=nil)or(AName='') then Exit;
	pw := StringToOleStr(AName);
	try
		rc := FStorage.CreateStorage( pw, Mode, 0, 0, newStg );
		if rc<>S_OK then OleError(rc);
	finally
		SysFreeString(pw);
	end;
	if newStg=nil then Exit;
	Result := TStorage.Create( AName, Self, newStg );
end;
//-------------------------------------------------------------
function TStorage.OpenStorage( const AName : String; const Mode : DWord ) : TStorage;
var	pw : PWideChar;
		rc : HResult;
		newStg : IStorage;
begin
	Result := nil;
	if (FStorage=nil)or(AName='') then Exit;
	pw := StringToOleStr(AName);
//  newStg := nil;
	rc := FStorage.OpenStorage( pw, nil, Mode, nil, 0, newStg );
	SysFreeString(pw);
	if rc<>S_OK then OleError(rc);
	if newStg=nil then Exit;
	Result := TStorage.Create( AName, Self, newStg );
end;
//-------------------------------------------------------------
function TStorage.OpenCreateStorage( const AName : String; const Mode : DWord; var bCreate : Boolean ) : TStorage;
var	pw : PWideChar;
		rc : HResult;
		newStg : IStorage;
begin
	Result := nil;
	if (FStorage=nil)or(AName='') then Exit;
	pw := StringToOleStr(AName);
	if bCreate then rc := FStorage.CreateStorage( pw, Mode, 0, 0, newStg )
	else
		begin
			rc := FStorage.OpenStorage( pw, nil, Mode and ($ffffffff xor STGM_CREATE xor STGM_CONVERT), nil, 0, newStg );
			if rc=STG_E_FILENOTFOUND then
			begin
				rc := FStorage.CreateStorage( pw, Mode, 0, 0, newStg );
				bCreate := True;
			end;
		end;
	SysFreeString(pw);
	if rc<>S_OK then OleError(rc);
	if newStg=nil then Exit;
	Result := TStorage.Create( AName, Self, newStg );
end; {TStorage.CreateStorage}
//-------------------------------------------------------------
procedure TStorage.EnumElements( AStrings : TStrings );
const	MaxElem = 10;
var	rc : HResult;
		n,i : LongInt;
		oEnum : IEnumSTATSTG;
		aElem : Array [0..MaxElem-1] of TSTATSTG;
    sName : String;
begin
	if (FStorage=nil) or (AStrings=nil) then Exit;
	rc := FStorage.EnumElements(0,nil,0,oEnum);
	if rc<>S_OK then OleCheck(rc);
	n := MaxElem;
//	try
		repeat
			oEnum.Next(MaxElem,aElem,@n);
			if n>0 then
				for i := 0 to n-1 do with aElem[i] do
				begin
          WideCharToStrVar(pwcsName,sName);
					AStrings.AddObject(sName,Pointer(dwType));
					CoTaskMemFree(pwcsName);
				end;
		until n<>MaxElem;
//	finally
//		oEnum._Release;
//    oEnum := nil;
//	end;
end; {TStorage.EnumElements}
//-------------------------------------------------------------
procedure TStorage.RenameElement( const AOldName, ANewName : String );
var	wcOld,wcNew : PWideChar;
		rc : HResult;
begin
	if (FStorage=nil)or(AOldName='')or(ANewName='')or(AOldName=ANewName)  then Exit;
	wcOld := StringToOleStr(AOldName);
	wcNew := StringToOleStr(ANewName);
	try
		rc := FStorage.RenameElement(wcOld,wcNew);
	finally
		SysFreeString(wcOld);
		SysFreeString(wcNew);
	end;
	OleCheck(rc);
end; {TStorage.RenameElement}
//-------------------------------------------------------------
procedure TStorage.SetName( Value : String );
begin
	if FName=Value then Exit;
	if (FStorage<>nil)and(FParent<>nil) then FParent.RenameElement(FName,Value);
	FName := Value;
end; {TStorage.SetName}

//==TStgFile===========================================================
constructor TStgFile.Create( const AFileName : String; AStorage : IStorage );
begin
	inherited Create('',nil,AStorage);
	if AFileName='' then Exit;
	FFileName := ExpandFileName(AFileName);
	FPath := FFileName+':';
end; {TStgFile.Create}
//-------------------------------------------------------------
class function TStgFile.CreateFile( const AFileName : String; const Mode : DWord ) : TStgFile;
var	pw : PWideChar;
		newStg : IStorage;
begin
	Result := nil;
	if AFileName='' then Exit;
	pw := StringToOleStr(AFileName);
	try
		newStg := nil;
		OleCheck( StgCreateDocFile(pw,Mode,0,newStg) );
	finally
		SysFreeString(pw);
	end;
	if newStg<>nil then Result := TStgFile.Create(AFileName,newStg);
end; {TStgFile.CreateFile}
//-------------------------------------------------------------
class function TStgFile.OpenFile( const AFileName : String; const Mode : DWord ) : TStgFile;
{
const
	stgOptions : TStgOptions = (
		usVersion : 1;
		reserved  : 0;
		ulSectorSize : 512 );
}
//ISTORAGE_IID : TGUID = '{0000000B-0000-0000-C000-000000000046}';
var	
	pw : PWideChar;
	newStg : IStorage;
	rc : HResult;
//	hLibrary : THandle;
//	StgOpenStorageEx : TStgOpenStorageEx;
begin
	Result := nil;
	if AFileName='' then Exit;
//	hLibrary := INVALID_HANDLE_VALUE;
	pw := StringToOleStr(AFileName);
	newStg := nil;
	try
{
		StgOpenStorageEx := nil;
		if (Win32Platform=VER_PLATFORM_WIN32_NT) then
		begin
			hLibrary := LoadLibrary( ole32 ); // Actually it has already been loaded
			StgOpenStorageEx := GetProcAddress( hLibrary, 'StgOpenStorageEx' );
		end;
		if Assigned(StgOpenStorageEx) then
			rc := StgOpenStorageEx( pw, Mode, STGFMT_ANY, 0, @stgOptions, nil, @ISTORAGE_IID, newStg )
		else}
			begin
				rc := StgOpenStorage(pw,nil,Mode,nil,0,newStg);
				if rc = STG_E_FILEALREADYEXISTS then Exit; // Specified file is not compound file.
			end;
		OleCheck( rc );
	finally
		SysFreeString(pw);
//		if hLibrary<>INVALID_HANDLE_VALUE then FreeLibrary(hLibrary);
	end;
	if newStg<>nil then Result := TStgFile.Create(AFileName,newStg);
end; {TStgFile.OpenFile}

//-------------------------------------------------------------
{function TStgFile.Clone( const Mode : DWord ) : TStgFile;
var	newStg : IStorage;
begin
	Result := nil;
	newStg := nil;
	if FStorage=nil then Exit;
	StgOpenStorage(nil,FStorage,Mode,nil,0,newStg);
	if newStg<>nil then Result := TStgFile.Create(Self.FFileName,newStg);
end; {TStgFile.Clone}

end.
