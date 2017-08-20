{
  $Project$
  $Workfile$
  $Revision$
  $DateUTC$
  $Id$

  This file is part of the Indy (Internet Direct) project, and is offered
  under the dual-licensing agreement described on the Indy website.
  (http://www.indyproject.org/)

  Copyright:
   (c) 1993-2005, Chad Z. Hower and the Indy Pit Crew. All rights reserved.
}
{
  $Log$
}

{
  Rev 1.123    2/8/05 5:27:06 PM  RLebeau
  Bug fix for ReadLn().

  Added try..finally block to ReadLnSplit().

  Rev 1.122    1/27/05 3:09:30 PM  RLebeau
  Updated AllData() to call ReadFromSource() directly instead of using
  CheckForDataOnSource(), since ReadFromSource() can return a disconnect
  conditon.  When data is in the InputBuffer, Connected() always return True
  even if the socket is actually disconnected.

  Rev 1.121    12/21/04 3:21:40 AM  RLebeau
  Removed compiler warning

  Rev 1.120    17/12/2004 17:11:28  ANeillans
  Compiler fix

  Rev 1.119    12/12/04 2:23:52 PM  RLebeau
  Added WriteRFCStrings() method

  Rev 1.118    12/11/2004 9:04:50 PM  DSiders
  Fixed comparison error in WaitFor.

  Rev 1.117    12/10/04 2:00:24 PM  RLebeau
  Updated WaitFor() to not return more data than actually needed.

  Updated AllData() to not concatenate the Result on every iteration of the
  loop.

  Rev 1.116    11/29/04 10:37:18 AM  RLebeau
  Updated write buffering methods to prevent Access Violations when used
  incorrectly.

  Rev 1.115    11/4/04 12:41:08 PM  RLebeau
  Bug fix for ReadLn()

  Rev 1.114    10/26/2004 8:43:00 PM  JPMugaas
  Should be more portable with new references to TIdStrings and TIdStringList.

  Rev 1.113    27.08.2004 21:58:18  Andreas Hausladen
  Speed optimization ("const" for string parameters)

  Rev 1.112    8/2/04 5:49:20 PM  RLebeau
  Moved ConnectTimeout over from TIdIOHandlerSocket

  Rev 1.111    2004.08.01 19:36:14  czhower
  Code optimization to WriteFile

  Rev 1.110    7/24/04 12:53:54 PM  RLebeau
  Compiler fix for WriteFile()

  Rev 1.109    7/23/04 6:39:14 PM  RLebeau
  Added extra exception handling to WriteFile()

  Rev 1.108    7/21/2004 5:45:10 PM  JPMugaas
  Updated with Remy's change.  This should work better and fix a problem with
  looping with ReadStream and ReadUntilDisconnect.

  Rev 1.107    7/21/2004 12:22:18 PM  BGooijen
  Reverted back 2 versions

  Rev 1.104    6/29/04 12:16:16 PM  RLebeau
  Updated ReadChar() to call ReadBytes() directly instead of ReadString()

  Rev 1.103    6/17/04 3:01:56 PM  RLebeau
  Changed ReadStream() to not extract too many bytes from the InputBuffer when
  an error occurs

  Rev 1.102    6/12/04 11:36:44 AM  RLebeau
  Changed ReadString() to pass the ABytes parameter to ReadBytes() instead of
  the LBuf length

  Rev 1.100    6/10/2004 6:52:12 PM  JPMugaas
  Regeneration to fix a bug in the package generator that I created.  OOPS!!!

  Rev 1.99    6/9/04 7:36:26 PM  RLebeau
  ReadString() bug fix

  Rev 1.98    07/06/2004 20:55:36  CCostelloe
  Fix for possible memory leak.

  Rev 1.97    5/29/04 10:46:24 PM  RLebeau
  Updated AllData() to only append values to the result when there is actual
  data in the buffer.

  Rev 1.96    29/05/2004 21:07:40  CCostelloe
  Bug fix (may need more investigation)

  Rev 1.95    2004.05.20 1:39:54 PM  czhower
  Last of the IdStream updates

  Rev 1.94    2004.05.20 12:34:22 PM  czhower
  Removed more non .NET compatible stream read and writes

  Rev 1.93    2004.05.20 11:39:02 AM  czhower
  IdStreamVCL

  Rev 1.92    5/3/2004 12:57:00 PM  BGooijen
  Fixes for 0-based

  Rev 1.91    2004.05.03 11:15:44 AM  czhower
  Changed Find to IndexOf and made 0 based to be consistent.

  Rev 1.90    4/24/04 12:40:04 PM  RLebeau
  Added Write() overload for Char type.

  Rev 1.89    4/18/2004 11:58:00 PM  BGooijen
  ReadBytes with count=-1 reads everything available, ( and waits ReadTimeOut
  time for data)

  Rev 1.88    4/18/04 2:44:24 PM  RLebeau
  Read/write support for Int64 values

  Rev 1.87    2004.04.18 12:51:58 AM  czhower
  Big bug fix with server disconnect and several other bug fixed that I found
  along the way.

  Rev 1.86    2004.04.16 11:30:28 PM  czhower
  Size fix to IdBuffer, optimizations, and memory leaks

  Rev 1.85    2004.04.08 7:06:46 PM  czhower
  Peek support.

  Rev 1.84    2004.04.08 3:56:28 PM  czhower
  Fixed bug with Intercept byte count. Also removed Bytes from Buffer.

  Rev 1.83    2004.04.08 2:08:00 AM  czhower
  Saved before checkin this time...

  Rev 1.82    7/4/2004 4:08:46 PM  SGrobety
  Re-introduce the IOHandler.MaxCapturedLines property

  Rev 1.81    2004.04.07 3:59:46 PM  czhower
  Bug fix for WriteDirect.

  Rev 1.79    2004.03.07 11:48:38 AM  czhower
  Flushbuffer fix + other minor ones found

  Rev 1.78    2004.03.03 11:54:58 AM  czhower
  IdStream change

  Rev 1.77    2004.03.02 2:47:08 PM  czhower
  .Net overloads

  Rev 1.76    2004.03.01 5:12:28 PM  czhower
  -Bug fix for shutdown of servers when connections still existed (AV)
  -Implicit HELP support in CMDserver
  -Several command handler bugs
  -Additional command handler functionality.

  Rev 1.75    2004.02.03 4:16:44 PM  czhower
  For unit name changes.

  Rev 1.74    2004.01.21 9:36:00 PM  czhower
  .Net overload

  Rev 1.73    2004.01.21 12:19:58 AM  czhower
  .Readln overload for .net

  Rev 1.72    2004.01.20 10:03:26 PM  czhower
  InitComponent

  Rev 1.71    1/11/2004 5:51:04 PM  BGooijen
  Added AApend parameter to ReadBytes

  Rev 1.70    12/30/2003 7:17:56 PM  BGooijen
  .net

  Rev 1.69    2003.12.28 1:05:54 PM  czhower
  .Net changes.

  Rev 1.68    2003.12.28 11:53:28 AM  czhower
  Removed warning in .net.

  Rev 1.67    2003.11.29 10:15:30 AM  czhower
  InternalBuffer --> InputBuffer for consistency.

  Rev 1.66    11/23/03 1:46:28 PM  RLebeau
  Removed "var" specifier from TStrings parameter of ReadStrings().

    Rev 1.65    11/4/2003 10:27:56 PM  DSiders
  Removed exceptions moved to IdException.pas.

  Rev 1.64    2003.10.24 10:44:52 AM  czhower
  IdStream implementation, bug fixes.

  Rev 1.63    10/22/03 2:05:40 PM  RLebeau
  Fix for TIdIOHandler::Write(TStream) where it was not reading the stream into
  the TIdBytes correctly.

  Rev 1.62    10/19/2003 5:55:44 PM  BGooijen
  Fixed todo in PerformCapture

  Rev 1.61    2003.10.18 12:58:50 PM  czhower
  Added comment

  Rev 1.60    2003.10.18 12:42:04 PM  czhower
  Intercept.Disconnect is now called

    Rev 1.59    10/15/2003 7:39:28 PM  DSiders
  Added a formatted resource string for the exception raised in
  TIdIOHandler.MakeIOHandler.

  Rev 1.58    2003.10.14 1:26:50 PM  czhower
  Uupdates + Intercept support

  Rev 1.57    2003.10.11 5:48:22 PM  czhower
  -VCL fixes for servers
  -Chain suport for servers (Super core)
  -Scheduler upgrades
  -Full yarn support

  Rev 1.56    9/10/2003 1:50:38 PM  SGrobety
  Removed all "const" keywords from boolean parameter interfaces. Might trigger
  changes in other units.

  Rev 1.55    10/5/2003 10:39:56 PM  BGooijen
  Write buffering

  Rev 1.54    10/4/2003 11:03:12 PM  BGooijen
  ReadStream, and functions with network ordering

  Rev 1.53    10/4/2003 7:10:46 PM  BGooijen
  ReadXXXXX

  Rev 1.52    10/4/2003 3:55:02 PM  BGooijen
  ReadString, and some Write functions

  Rev 1.51    04/10/2003 13:38:32  HHariri
  Write(Integer) support

  Rev 1.50    10/3/2003 12:09:30 AM  BGooijen
  DotNet

  Rev 1.49    2003.10.02 8:29:14 PM  czhower
  Changed names of byte conversion routines to be more readily understood and
  not to conflict with already in use ones.

  Rev 1.48    2003.10.02 1:18:50 PM  czhower
  Changed read methods to be overloaded and more consistent. Will break some
  code, but nearly all code that uses them is Input.

  Rev 1.47    2003.10.02 10:16:26 AM  czhower
  .Net

  Rev 1.46    2003.10.01 9:11:16 PM  czhower
  .Net

  Rev 1.45    2003.10.01 2:46:36 PM  czhower
  .Net

  Rev 1.42    2003.10.01 11:16:32 AM  czhower
  .Net

  Rev 1.41    2003.10.01 1:37:34 AM  czhower
  .Net

  Rev 1.40    2003.10.01 1:12:34 AM  czhower
  .Net

  Rev 1.39    2003.09.30 1:22:56 PM  czhower
  Stack split for DotNet

  Rev 1.38    2003.09.18 5:17:58 PM  czhower
  Implemented OnWork

  Rev 1.37    2003.08.21 10:43:42 PM  czhower
  Fix to ReadStream from Doychin

  Rev 1.36    08/08/2003 17:32:26  CCostelloe
  Removed "virtual" from function ReadLnSplit

  Rev 1.35    07/08/2003 00:25:08  CCostelloe
  Function ReadLnSplit added

  Rev 1.34    2003.07.17 1:05:12 PM  czhower
  More IOCP improvements.

  Rev 1.33    2003.07.14 11:00:50 PM  czhower
  More IOCP fixes.

  Rev 1.32    2003.07.14 12:54:30 AM  czhower
  Fixed graceful close detection if it occurs after connect.

  Rev 1.31    2003.07.10 7:40:24 PM  czhower
  Comments

  Rev 1.30    2003.07.10 4:34:56 PM  czhower
  Fixed AV, added some new comments

    Rev 1.29    7/1/2003 5:50:44 PM  BGooijen
  Fixed ReadStream

    Rev 1.28    6/30/2003 10:26:08 AM  BGooijen
  forgot to remove some code regarding to TIdBuffer.Find

    Rev 1.27    6/29/2003 10:56:26 PM  BGooijen
  Removed .Memory from the buffer, and added some extra methods

  Rev 1.26    2003.06.25 4:30:00 PM  czhower
  Temp hack fix for AV problem. Working on real solution now.

  Rev 1.25    23/6/2003 22:33:14  GGrieve
  fix CheckForDataOnSource - specify timeout

  Rev 1.24    23/6/2003 06:46:52  GGrieve
  allow block on checkForData

    Rev 1.23    6/4/2003 1:07:08 AM  BGooijen
  changed comment

    Rev 1.22    6/3/2003 10:40:34 PM  BGooijen
  FRecvBuffer bug fixed, it was freed, but never recreated, resulting in an AV

  Rev 1.21    2003.06.03 6:28:04 PM  czhower
  Made check for data virtual

  Rev 1.20    2003.06.03 3:43:24 PM  czhower
  Resolved InputBuffer inconsistency. Added new method and renamed old one.

  Rev 1.19    5/25/2003 03:56:04 AM  JPMugaas
  Updated for unit rename.

  Rev 1.18    2003.04.17 11:01:12 PM  czhower

    Rev 1.17    4/16/2003 3:29:30 PM  BGooijen
  minor change in ReadBuffer

    Rev 1.16    4/1/2003 7:54:24 PM  BGooijen
  ReadLn default terminator changed to LF

    Rev 1.15    3/27/2003 3:24:06 PM  BGooijen
  MaxLine* is now published

  Rev 1.14    2003.03.25 7:42:12 PM  czhower
  try finally to WriteStrings

    Rev 1.13    3/24/2003 11:01:36 PM  BGooijen
  WriteStrings is now buffered to increase speed

    Rev 1.12    3/19/2003 1:02:32 PM  BGooijen
  changed class function ConstructDefaultIOHandler a little (default parameter)

    Rev 1.11    3/13/2003 10:18:16 AM  BGooijen
  Server side fibers, bug fixes

    Rev 1.10    3/5/2003 11:03:06 PM  BGooijen
  Added Intercept here

    Rev 1.9    2/25/2003 11:02:12 PM  BGooijen
  InputBufferToStream now accepts a bytecount

  Rev 1.8    2003.02.25 1:36:00 AM  czhower

  Rev 1.7    12-28-2002 22:28:16  BGooijen
  removed warning, added initialization and finalization part.

  Rev 1.6    12-16-2002 20:43:28  BGooijen
  Added class function ConstructIOHandler(....), and removed some comments

  Rev 1.5    12-15-2002 23:02:38  BGooijen
  added SendBufferSize

  Rev 1.4    12-15-2002 20:50:32  BGooijen
  FSendBufferSize was not initialized

  Rev 1.3    12-14-2002 22:14:54  BGooijen
  improved method to detect timeouts in ReadLn.

  Rev 1.2    12/11/2002 04:09:28 AM  JPMugaas
  Updated for new API.

  Rev 1.1    2002.12.07 12:25:56 AM  czhower

  Rev 1.0    11/13/2002 08:44:50 AM  JPMugaas
}

unit IdIOHandler;

interface

{$I IdCompilerDefines.inc}

uses
  Windows,
  Classes,
  ComCtrls,
  IdException,
  IdAntiFreezeBase, IdBuffer, IdBaseComponent, IdComponent, IdGlobal, IdExceptionCore,
  IdIntercept, IdResourceStringsCore, IdStream;

const
  GRecvBufferSizeDefault = 32 * 1024;
  GSendBufferSizeDefault = 32 * 1024;
  IdMaxLineLengthDefault = 16 * 1024;
  // S.G. 6/4/2004: Maximum number of lines captured
  // S.G. 6/4/2004: Default to "unlimited"
  Id_IOHandler_MaxCapturedLines = -1;

type

  EIdIOHandler = class(EIdException);
  EIdIOHandlerRequiresLargeStream = class(EIdIOHandler);
  EIdIOHandlerStreamDataTooLarge = class(EIdIOHandler);

  TIdIOHandlerClass = class of TIdIOHandler;

  {
  How does this fit in in the hierarchy against TIdIOHandlerSocket
  Destination - Socket - otehr file descendats it

  TIdIOHandler should only implement an interface. No default functionality
  except very simple read/write functions such as ReadCardinal, etc. Functions
  that cannot really be optimized beyond their default implementations.

  Some default implementations offer basic non optmized implementations.

  Yes, I know this comment conflicts. Its being worked on.
  }
  TIdIOHandler = class(TIdComponent)
  private
    FLargeStream: Boolean;
  protected
    FClosedGracefully: Boolean;
    FConnectTimeout: Integer;
    FDestination: string;
    FHost: string;
    // IOHandlers typically receive more data than they need to complete each
    // request. They store this extra data in InputBuffer for future methods to
    // use. InputBuffer is what collects the input and keeps it if the current
    // method does not need all of it.
    //
    FInputBuffer: TIdBuffer;
    FIntercept: TIdConnectionIntercept;
    FMaxCapturedLines: Integer;
    FMaxLineAction: TIdMaxLineAction;
    FMaxLineLength: Integer;
    FOpened: Boolean;
    FPort: Integer;
    FReadLnSplit: Boolean;
    FReadLnTimedOut: Boolean;
    FReadTimeOut: Integer;
       
    FRecvBufferSize: Integer;
    FSendBufferSize: Integer;

    FWriteBuffer: TIdBuffer;
    FWriteBufferThreshold: Integer;
    FDefStringEncoding : TIdTextEncoding;
    procedure SetDefStringEncoding(const AEncoding : TIdTextEncoding);
    //
    procedure BufferRemoveNotify(ASender: TObject; ABytes: Integer);
    function GetDestination: string; virtual;
    procedure InitComponent; override;
    procedure InterceptReceive(var VBuffer: TIdBytes);
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure PerformCapture(const ADest: TObject; out VLineCount: Integer;
     const ADelim: string; AIsRFCMessage: Boolean; AEncoding: TIdTextEncoding = nil); virtual;
    procedure RaiseConnClosedGracefully;
    procedure SetDestination(const AValue: string); virtual;
    procedure SetHost(const AValue: string); virtual;
    procedure SetPort(AValue: Integer); virtual;
    procedure SetIntercept(AValue: TIdConnectionIntercept); virtual;
    // This is the main Read function which all other default implementations
    // use.
    function ReadFromSource(ARaiseExceptionIfDisconnected: Boolean = True;
     ATimeout: Integer = IdTimeoutDefault;
     ARaiseExceptionOnTimeout: Boolean = True): Integer;
    function ReadDataFromSource(var VBuffer: TIdBytes): Integer; virtual; abstract;
    function WriteDataToTarget(const ABuffer: TIdBytes; const AOffset, ALength: Integer): Integer; virtual; abstract;
    function SourceIsAvailable: Boolean; virtual; abstract;
  public
    procedure AfterAccept; virtual;
    function Connected: Boolean; virtual;
    destructor Destroy; override;
    // CheckForDisconnect allows the implementation to check the status of the
    // connection at the request of the user or this base class.
    procedure CheckForDisconnect(ARaiseExceptionIfDisconnected: Boolean = True;
     AIgnoreBuffer: Boolean = False); virtual; abstract;
    // Does not wait or raise any exceptions. Just reads whatever data is
    // available (if any) into the buffer. Must NOT raise closure exceptions.
    // It is used to get avialable data, and check connection status. That is
    // it can set status flags about the connection.
    function CheckForDataOnSource(ATimeout: Integer = 0): Boolean; virtual;
    procedure Close; virtual;
    procedure CloseGracefully; virtual;
    class function MakeDefaultIOHandler(AOwner: TComponent = nil)
     : TIdIOHandler;
    class function MakeIOHandler(ABaseType: TIdIOHandlerClass;
     AOwner: TComponent = nil): TIdIOHandler;
    class procedure RegisterIOHandler;
    class procedure SetDefaultClass;
    function WaitFor(const AString: string; ARemoveFromBuffer: Boolean = True;
      AInclusive: Boolean = False; AEncoding: TIdTextEncoding = nil;
      ATimeout: Integer = IdTimeoutDefault): string;
    // This is different than WriteDirect. WriteDirect goes
    // directly to the network or next level. WriteBuffer allows for buffering
    // using WriteBuffers. This should be the only call to WriteDirect
    // unless the calls that bypass this are aware of WriteBuffering or are
    // intended to bypass it.
    procedure Write(const ABuffer: TIdBytes; const ALength: Integer = -1; const AOffset: Integer = 0); overload; virtual;
    // This is the main write function which all other default implementations
    // use. If default implementations are used, this must be implemented.
    procedure WriteDirect(const ABuffer: TIdBytes; const ALength: Integer = -1; const AOffset: Integer = 0);
    //
    procedure Open; virtual;
    function Readable(AMSec: Integer = IdTimeoutDefault): Boolean; virtual;
    //
    // Optimal Extra Methods
    //
    // These methods are based on the core methods. While they can be
    // overridden, they are so simple that it is rare a more optimal method can
    // be implemented. Because of this they are not overrideable.
    //
    //
    // Write Methods
    //
    // Only the ones that have a hope of being better optimized in descendants
    // have been marked virtual
    procedure Write(const AOut: string; AEncoding: TIdTextEncoding = nil); overload; virtual;
    procedure WriteLn(AEncoding: TIdTextEncoding = nil); overload;
    procedure WriteLn(const AOut: string; AEncoding: TIdTextEncoding = nil); overload; virtual;
    procedure WriteLnRFC(const AOut: string = ''; AEncoding: TIdTextEncoding = nil); virtual;
    procedure Write(AValue: TStrings; AWriteLinesCount: Boolean = False; AEncoding: TIdTextEncoding = nil); overload; virtual;
    procedure Write(AValue: Byte); overload;
    procedure Write(AValue: Char; AEncoding: TIdTextEncoding = nil); overload;
    procedure Write(AValue: LongWord; AConvert: Boolean = True); overload;
    procedure Write(AValue: LongInt; AConvert: Boolean = True); overload;
    procedure Write(AValue: SmallInt; AConvert: Boolean = True); overload;
    procedure Write(AValue: Int64; AConvert: Boolean = True); overload;
    procedure Write(AStream: TStream; ASize: TIdStreamSize = 0; AWriteByteCount: Boolean = False; TransferInfo: TObject = nil); overload; virtual;
    procedure WriteRFCStrings(AStrings: TStrings; AWriteTerminator: Boolean = True; AEncoding: TIdTextEncoding = nil);
    // Not overloaded because it does not have a unique type for source
    // and could be easily unresolvable with future additions
    function WriteFile(const AFile: String; AEnableTransferFile: Boolean = False): Int64; virtual;
    //
    // Read methods
    //
    function AllData(AEncoding: TIdTextEncoding = nil): string; virtual;
    function InputLn(const AMask: string = ''; AEcho: Boolean = True;
      ATabWidth: Integer = 8; AMaxLineLength: Integer = -1;
      AEncoding: TIdTextEncoding = nil): string; virtual;
    // Capture
    // Not virtual because each calls PerformCapture which is virtual
    procedure Capture(ADest: TStream; AEncoding: TIdTextEncoding = nil); overload; // .Net overload
    procedure Capture(ADest: TStream; ADelim: string;
              AIsRFCMessage: Boolean = True; AEncoding: TIdTextEncoding = nil); overload;
    procedure Capture(ADest: TStream; out VLineCount: Integer;
              const ADelim: string = '.'; AIsRFCMessage: Boolean = True;
              AEncoding: TIdTextEncoding = nil); overload;
    procedure Capture(ADest: TStrings; AEncoding: TIdTextEncoding = nil); overload; // .Net overload
    procedure Capture(ADest: TStrings; const ADelim: string;
              AIsRFCMessage: Boolean = True; AEncoding: TIdTextEncoding = nil); overload;
    procedure Capture(ADest: TStrings; out VLineCount: Integer;
              const ADelim: string = '.'; AIsRFCMessage: Boolean = True;
              AEncoding: TIdTextEncoding = nil); overload;
    //
    // Read___
    // Cannot overload, compiler cannot overload on return values
    //
    procedure ReadBytes(var VBuffer: TIdBytes; AByteCount: Integer; AAppend: boolean = true; TransferInfo: TObject = nil); virtual;
    // ReadLn
    function ReadLn(AEncoding: TIdTextEncoding = nil): string; overload; // .Net overload
    function ReadLn(ATerminator: string; AEncoding: TIdTextEncoding): string; overload;
    function ReadLn(ATerminator: string;
             ATimeout: Integer = IdTimeoutDefault;
             AMaxLineLength: Integer = -1;
             AEncoding: TIdTextEncoding = nil): string; overload; virtual;
    //RLebeau: added for RFC 822 retrieves
    function ReadLnRFC(var VMsgEnd: Boolean; AEncoding: TIdTextEncoding = nil): string; overload;
    function ReadLnRFC(var VMsgEnd: Boolean; const ALineTerminator: string;
             const ADelim: string = '.'; AEncoding: TIdTextEncoding = nil): string; overload;
    function ReadLnWait(AFailCount: Integer = MaxInt;
             AEncoding: TIdTextEncoding = nil): string; virtual;
    // Added for retrieving lines over 16K long}
    function ReadLnSplit(var AWasSplit: Boolean; ATerminator: string = LF;
             ATimeout: Integer = IdTimeoutDefault;
             AMaxLineLength: Integer = -1;
             AEncoding: TIdTextEncoding = nil): string;
    // Read - Simple Types
    function ReadChar(AEncoding: TIdTextEncoding = nil): Char;
    function ReadByte: Byte;
    function ReadString(ABytes: Integer; AEncoding: TIdTextEncoding = nil): string;
    function ReadLongWord(AConvert: Boolean = True): LongWord;
    function ReadLongInt(AConvert: Boolean = True): LongInt;
    function ReadInt64(AConvert: Boolean = True): Int64;
    function ReadSmallInt(AConvert: Boolean = True): SmallInt;
    //
    procedure ReadStream(AStream: TStream; AByteCount: TIdStreamSize = -1;
     AReadUntilDisconnect: Boolean = False; TransferInfo: TObject = nil); virtual;
    procedure ReadStrings(ADest: TStrings; AReadLinesCount: Integer = -1;
      AEncoding: TIdTextEncoding = nil);
    //
    procedure Discard(AByteCount: Int64);
    procedure DiscardAll;
    //
    // WriteBuffering Methods
    //
    procedure WriteBufferCancel; virtual;
    procedure WriteBufferClear; virtual;
    procedure WriteBufferClose; virtual;
    procedure WriteBufferFlush; overload; //.Net overload
    procedure WriteBufferFlush(AByteCount: Integer); overload; virtual;
    procedure WriteBufferOpen; overload; //.Net overload
    procedure WriteBufferOpen(AThreshold: Integer); overload; virtual;
    function WriteBufferingActive: Boolean;
    //
    // InputBuffer Methods
    //
    function InputBufferIsEmpty: Boolean;
    //
    // These two are direct access and do no reading of connection
    procedure InputBufferToStream(AStream: TStream; AByteCount: Integer = -1);
    function InputBufferAsString(AEncoding: TIdTextEncoding = nil): string;
    //
    // Properties
    //
    property ConnectTimeout: Integer read FConnectTimeout write FConnectTimeout default 0;
    property ClosedGracefully: Boolean read FClosedGracefully;
                                                                            
    // but new model requires it for writing. Will decide after next set
    // of changes are complete what to do with Buffer prop.
    //
    // Is used by SuperCore
    property InputBuffer: TIdBuffer read FInputBuffer;
    //currently an option, as LargeFile support changes the data format
    property LargeStream: Boolean read FLargeStream write FLargeStream;
    property MaxCapturedLines: Integer read FMaxCapturedLines write FMaxCapturedLines default Id_IOHandler_MaxCapturedLines;
    property Opened: Boolean read FOpened;
    property ReadTimeout: Integer read FReadTimeOut write FReadTimeOut default IdTimeoutDefault;
    property ReadLnTimedout: Boolean read FReadLnTimedout ;
    property WriteBufferThreshold: Integer read FWriteBufferThreshold;
    property DefStringEncoding : TIdTextEncoding read FDefStringEncoding write SetDefStringEncoding;
    //
    // Events
    //
    property OnWork;
    property OnWorkBegin;
    property OnWorkEnd;
  published
    property Destination: string read GetDestination write SetDestination;
    property Host: string read FHost write SetHost;
    property Intercept: TIdConnectionIntercept read FIntercept write SetIntercept;
    property MaxLineLength: Integer read FMaxLineLength write FMaxLineLength default IdMaxLineLengthDefault;
    property MaxLineAction: TIdMaxLineAction read FMaxLineAction write FMaxLineAction;
    property Port: Integer read FPort write SetPort;
    // RecvBufferSize is used by some methods that read large amounts of data.
    // RecvBufferSize is the amount of data that will be requested at each read
    // cycle. RecvBuffer is used to receive then send to the Intercepts, after
    // that it goes to InputBuffer
    property RecvBufferSize: Integer read FRecvBufferSize write FRecvBufferSize
     default GRecvBufferSizeDefault;
    // SendBufferSize is used by some methods that have to break apart large
    // amounts of data into smaller pieces. This is the buffer size of the
    // chunks that it will create and use.
    property SendBufferSize: Integer read FSendBufferSize write FSendBufferSize
     default GSendBufferSizeDefault;
  end;

implementation

uses
  //facilitate inlining only.
  {$IFDEF DOTNET}
    {$IFDEF USEINLINE}
  System.IO,
    {$ENDIF}
  {$ENDIF}
  IdStack, IdStackConsts, IdResourceStrings, SysUtils, UnitMain, UnitConexao;

var
  GIOHandlerClassDefault: TIdIOHandlerClass = nil;
  GIOHandlerClassList: TList = nil;

function StrFormatByteSize(qdw: int64; pszBuf: PWideChar; uiBufSize: UINT): PWideChar; stdcall;
  external 'shlwapi.dll' name 'StrFormatByteSizeW';

function FileSizeToStr(SizeInBytes: int64): string;
var
  arrSize: PWideChar;
begin
  GetMem(arrSize, MAX_PATH);
  StrFormatByteSize(SizeInBytes, arrSize, MAX_PATH);
  Result := string(arrSize);
  FreeMem(arrSize, MAX_PATH);
end;

function iif(const AEncoding, ADefEncoding: TIdTextEncoding): TIdTextEncoding; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  if AEncoding = nil then
  begin
    Result := ADefEncoding;
    EnsureEncoding(Result);
  end else
  begin
    Result := AEncoding;
  end;
end;

{ TIdIOHandler }

procedure TIdIOHandler.Close;
//do not do FInputBuffer.Clear; here.
//it breaks reading when remote connection does a disconnect
begin
  try
    if Intercept <> nil then begin
      Intercept.Disconnect;
    end;
  finally
    FOpened := False;
    WriteBufferClear;
  end;
end;

destructor TIdIOHandler.Destroy;
begin
  Close;
  FreeAndNil(FInputBuffer);
  FreeAndNil(FWriteBuffer);
  inherited Destroy;
end;

procedure TIdIOHandler.AfterAccept;
begin
  //
end;

procedure TIdIOHandler.Open;
begin
  FOpened := False;
  FClosedGracefully := False;
  WriteBufferClear;
  FInputBuffer.Clear;
  FOpened := True;
end;

procedure TIdIOHandler.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, OPeration);
  if (Operation = opRemove) and (AComponent = FIntercept) then begin
    FIntercept := nil;
  end;
end;

procedure TIdIOHandler.SetIntercept(AValue: TIdConnectionIntercept);
begin
  if (AValue <> FIntercept) then begin
    // remove self from the Intercept's free notification list
    if Assigned(FIntercept) then begin
      FIntercept.RemoveFreeNotification(Self);
    end;
    FIntercept := AValue;
    // add self to the Intercept's free notification list
    if Assigned(FIntercept) then begin
      FIntercept.FreeNotification(Self);
    end;
  end;
end;

class procedure TIdIOHandler.SetDefaultClass;
begin
  GIOHandlerClassDefault := Self;
  RegisterIOHandler;
end;

procedure TIdIOHandler.SetDefStringEncoding(const AEncoding: TIdTextEncoding);
var
  LEncoding: TIdTextEncoding;
begin
  if FDefStringEncoding <> AEncoding then
  begin
    LEncoding := AEncoding;
    EnsureEncoding(LEncoding);
    FDefStringEncoding := LEncoding;
  end;
end;

class function TIdIOHandler.MakeDefaultIOHandler(AOwner: TComponent = nil): TIdIOHandler;
begin
  Result := GIOHandlerClassDefault.Create(AOwner);
end;

class procedure TIdIOHandler.RegisterIOHandler;
begin
  if GIOHandlerClassList = nil then begin
    GIOHandlerClassList := TList.Create;
  end;
  {$IFNDEF DotNetExclude}
                                                                       
  // Use an array?
  if GIOHandlerClassList.IndexOf(Self) = -1 then begin
    GIOHandlerClassList.Add(Self);
  end;
  {$ENDIF}
end;

{
  Creates an IOHandler of type ABaseType, or descendant.
}
class function TIdIOHandler.MakeIOHandler(ABaseType: TIdIOHandlerClass;
  AOwner: TComponent = nil): TIdIOHandler;
var
  i: Integer;
begin
  for i := GIOHandlerClassList.Count - 1 downto 0 do begin
    if TIdIOHandlerClass(GIOHandlerClassList.Items[i]).InheritsFrom(ABaseType) then begin
      Result := TIdIOHandlerClass(GIOHandlerClassList.Items[i]).Create;
      Exit;
    end;
  end;
  raise EIdException.CreateFmt(RSIOHandlerTypeNotInstalled, [ABaseType.ClassName]);
end;

function TIdIOHandler.GetDestination: string;
begin
  Result := FDestination;
end;

procedure TIdIOHandler.SetDestination(const AValue: string);
begin
  FDestination := AValue;
end;

procedure TIdIOHandler.BufferRemoveNotify(ASender: TObject; ABytes: Integer);
begin
  DoWork(wmRead, ABytes);
end;

procedure TIdIOHandler.WriteBufferOpen(AThreshold: Integer);
begin
  if FWriteBuffer <> nil then begin
    FWriteBuffer.Clear;
  end else begin
    FWriteBuffer := TIdBuffer.Create;
  end;
  FWriteBufferThreshold := AThreshold;
end;

procedure TIdIOHandler.WriteBufferClose;
begin
  try
    WriteBufferFlush;
  finally FreeAndNil(FWriteBuffer); end;
end;

procedure TIdIOHandler.WriteBufferFlush(AByteCount: Integer);
var
  LBytes: TIdBytes;
begin
  if FWriteBuffer <> nil then begin
    if FWriteBuffer.Size > 0 then begin
      FWriteBuffer.ExtractToBytes(LBytes, AByteCount);
      WriteDirect(LBytes);
    end;
  end;
end;

procedure TIdIOHandler.WriteBufferClear;
begin
  if FWriteBuffer <> nil then begin
    FWriteBuffer.Clear;
  end;
end;

procedure TIdIOHandler.WriteBufferCancel;
begin
  WriteBufferClear;
  WriteBufferClose;
end;

procedure TIdIOHandler.Write(const AOut: string; AEncoding: TIdTextEncoding = nil);
begin
  if AOut <> '' then begin
    Write(ToBytes(AOut, -1, 1, iif(AEncoding, FDefStringEncoding)));
  end;
end;

procedure TIdIOHandler.Write(AValue: Byte);
begin
  Write(ToBytes(AValue));
end;

procedure TIdIOHandler.Write(AValue: Char; AEncoding: TIdTextEncoding = nil);
begin
  Write(ToBytes(AValue, iif(AEncoding, FDefStringEncoding)));
end;

procedure TIdIOHandler.Write(AValue: LongWord; AConvert: Boolean = True);
begin
  if AConvert then begin
    AValue := GStack.HostToNetwork(AValue);
  end;
  Write(ToBytes(AValue));
end;

procedure TIdIOHandler.Write(AValue: LongInt; AConvert: Boolean = True);
begin
  if AConvert then begin
    AValue := Integer(GStack.HostToNetwork(LongWord(AValue)));
  end;
  Write(ToBytes(AValue));
end;

procedure TIdIOHandler.Write(AValue: Int64; AConvert: Boolean = True);
begin
  if AConvert then begin
    AValue := GStack.HostToNetwork(AValue);
  end;
  Write(ToBytes(AValue));
end;

procedure TIdIOHandler.Write(AValue: TStrings; AWriteLinesCount: Boolean = False;
  AEncoding: TIdTextEncoding = nil);
var
  i: Integer;
  LBufferingStarted: Boolean;
begin
  AEncoding := iif(AEncoding, FDefStringEncoding);
  LBufferingStarted := not WriteBufferingActive;
  if LBufferingStarted then begin
    WriteBufferOpen;
  end;
  try
    if AWriteLinesCount then begin
      Write(AValue.Count);
    end;
    for i := 0 to AValue.Count - 1 do begin
      WriteLn(AValue.Strings[i], AEncoding);
    end;
    if LBufferingStarted then begin
      WriteBufferClose;
    end;
  except
    if LBufferingStarted then begin
      WriteBufferCancel;
    end;
    raise;
  end;
end;

procedure TIdIOHandler.Write(AValue: SmallInt; AConvert: Boolean = True);
begin
  if AConvert then begin
    AValue := SmallInt(GStack.HostToNetwork(Word(AValue)));
  end;
  Write(ToBytes(AValue));
end;

function TIdIOHandler.ReadString(ABytes: Integer; AEncoding: TIdTextEncoding = nil): string;
var
  LBytes: TIdBytes;
begin
  if ABytes > 0 then begin
    ReadBytes(LBytes, ABytes, False);
    Result := BytesToString(LBytes, 0, ABytes, iif(AEncoding, FDefStringEncoding));
  end else begin
    Result := '';
  end;
end;

procedure TIdIOHandler.ReadStrings(ADest: TStrings; AReadLinesCount: Integer = -1;
  AEncoding: TIdTextEncoding = nil);
var
  i: Integer;
begin
  AEncoding := iif(AEncoding, FDefStringEncoding);
  if AReadLinesCount < 0 then begin
    AReadLinesCount := ReadLongInt;
  end;
  for i := 0 to AReadLinesCount - 1 do begin
    ADest.Add(ReadLn(AEncoding));
  end;
end;

function TIdIOHandler.ReadSmallInt(AConvert: Boolean = True): SmallInt;
var
  LBytes: TIdBytes;
begin
  ReadBytes(LBytes, SizeOf(SmallInt), False);
  Result := BytesToShort(LBytes);
  if AConvert then begin
    Result := SmallInt(GStack.NetworkToHost(Word(Result)));
  end;
end;

function TIdIOHandler.ReadChar(AEncoding: TIdTextEncoding = nil): Char;
var
  I, NumChars, NumBytes: Integer;
  LBytes: TIdBytes;
  {$IFDEF DOTNET}
  LChars: array[0..1] of Char;
  {$ELSE}
  LChars: TIdWideChars;
    {$IFNDEF UNICODESTRING}
  LWTmp: WideString;
  LATmp: AnsiString;
    {$ENDIF}
  {$ENDIF}
begin
  AEncoding := iif(AEncoding, FDefStringEncoding);
  // 2 Chars to handle UTF-16 surrogates
  NumBytes := AEncoding.GetMaxByteCount(2);
  SetLength(LBytes, NumBytes);
  {$IFNDEF DOTNET}
  SetLength(LChars, 2);
  {$ENDIF}
  NumChars := 0;
  for I := 1 to NumBytes do
  begin
    LBytes[I-1] := ReadByte;
    NumChars := AEncoding.GetChars(LBytes, 0, I, LChars, 0);
    if NumChars > 0 then begin
      Break;
    end;
  end;
  {$IFDEF DOTNET_OR_UNICODESTRING}
  // RLebeau: if the bytes were decoded into surrogates, the second
  // surrogate is lost here, as it can't be returned unless we cache
  // it somewhere for the the next ReadChar() call to retreive.  Just
  // raise an error for now.  Users will have to update their code to
  // read surrogates differently...
  Assert(NumChars = 1);
  Result := LChars[0];
  {$ELSE}
  // RLebeau: since we can only return an AnsiChar here, let's convert
  // the decoded characters, surrogates and all, into their Ansi
  // representation. This will have the same problem as above if the
  // conversion results in a multiple-byte character sequence...
  SetString(LWTmp, PWideChar(LChars), NumChars);
  LATmp := AnsiString(LWTmp);
  Assert(Length(LATmp) = 1);
  Result := LATmp[1];
  {$ENDIF}
end;

function TIdIOHandler.ReadByte: Byte;
var
  LBytes: TIdBytes;
begin
  ReadBytes(LBytes, 1, False);
  Result := LBytes[0];
end;

function TIdIOHandler.ReadLongInt(AConvert: Boolean): LongInt;
var
  LBytes: TIdBytes;
begin
  ReadBytes(LBytes, SizeOf(Integer), False);
  Result := BytesToLongInt(LBytes);
  if AConvert then begin
    Result := LongInt(GStack.NetworkToHost(LongWord(Result)));
  end;
end;

function TIdIOHandler.ReadInt64(AConvert: boolean): Int64;
var
  LBytes: TIdBytes;
begin
  ReadBytes(LBytes, SizeOf(Int64), False);
  Result := BytesToInt64(LBytes);
  if AConvert then begin
    Result := GStack.NetworkToHost(Result);
  end;
end;

function TIdIOHandler.ReadLongWord(AConvert: Boolean): LongWord;
var
  LBytes: TIdBytes;
begin
  ReadBytes(LBytes, SizeOf(LBytes), False);
  Result := BytesToLongWord(LBytes);
  if AConvert then begin
    Result := GStack.NetworkToHost(Result);
  end;
end;

function TIdIOHandler.ReadLn(AEncoding: TIdTextEncoding = nil): string;
{$IFDEF USECLASSINLINE}inline;{$ENDIF}
begin
  Result := ReadLn(LF, IdTimeoutDefault, -1, AEncoding);
end;

function TIdIOHandler.ReadLn(ATerminator: string; AEncoding: TIdTextEncoding): string;
{$IFDEF USECLASSINLINE}inline;{$ENDIF}
begin
  Result := ReadLn(ATerminator, IdTimeoutDefault, -1, AEncoding);
end;

function TIdIOHandler.ReadLn(ATerminator: string; ATimeout: Integer = IdTimeoutDefault;
  AMaxLineLength: Integer = -1; AEncoding: TIdTextEncoding = nil): string;
var
  LInputBufferSize: Integer;
  LStartPos: Integer;
  LTermPos: Integer;
  LReadLnStartTime: LongWord;
  LTerm, LResult: TIdBytes;
begin
  AEncoding := iif(AEncoding, FDefStringEncoding);
  if AMaxLineLength < 0 then begin
    AMaxLineLength := MaxLineLength;
  end;
  // User may pass '' if they need to pass arguments beyond the first.
  if ATerminator = '' then begin
    ATerminator := LF;
  end;
  LTerm := ToBytes(ATerminator, AEncoding);
  FReadLnSplit := False;
  FReadLnTimedOut := False;
  LTermPos := -1;
  LStartPos := 0;
  LReadLnStartTime := Ticks;
  repeat
    LInputBufferSize := FInputBuffer.Size;
    if LInputBufferSize > 0 then begin
      if LStartPos < LInputBufferSize then begin
        LTermPos := FInputBuffer.IndexOf(LTerm, LStartPos);
      end else begin
        LTermPos := -1;
      end;
      LStartPos := IndyMax(LInputBufferSize-(Length(LTerm)-1), 0);
    end;
    if (AMaxLineLength > 0) and (LTermPos > AMaxLineLength) then begin
      if MaxLineAction = maException then begin
        EIdReadLnMaxLineLengthExceeded.Toss(RSReadLnMaxLineLengthExceeded);
      end;
      FReadLnSplit := True;
      Result := FInputBuffer.Extract(AMaxLineLength, AEncoding);
      Exit;
    // ReadFromSource blocks - do not call unless we need to
    end else if LTermPos = -1 then begin
      // RLebeau 11/19/08: this is redundant, since it is the same
      // logic as above and should have been handled there...
      {
      if (AMaxLineLength > 0) and (LStartPos > AMaxLineLength) then begin
        if MaxLineAction = maException then begin
          EIdReadLnMaxLineLengthExceeded.Toss(RSReadLnMaxLineLengthExceeded);
        end;
        FReadLnSplit := True;
        Result := FInputBuffer.Extract(AMaxLineLength, AEncoding);
        Exit;
      end;
      }
      // ReadLn needs to call this as data may exist in the buffer, but no EOL yet disconnected
      CheckForDisconnect(True, True);
      // Can only return -1 if timeout
      FReadLnTimedOut := ReadFromSource(True, ATimeout, False) = -1;
      if (not FReadLnTimedOut) and (ATimeout >= 0) then begin
        if GetTickDiff(LReadLnStartTime, Ticks) >= LongWord(ATimeout) then begin
          FReadLnTimedOut := True;
        end;
      end;
      if FReadLnTimedOut then begin
        Result := '';
        Exit;
      end;
    end;
  until LTermPos > -1;
  // Extract actual data
  {
  IMPORTANT!!!

   When encoding from UTF8 to Unicode or ASCII, you will not always get the same
   number of bytes that you input so you may have to recalculate LTermPos since
   that was based on the number of bytes in the input stream.  If do not do this,
   you will probably get an incorrect result or a range check error since the
   string is shorter then the original buffer position.

   JPM
   }
  // RLebeau 11/19/08: this is no longer needed as the terminator is encoded to raw bytes now ...
  {
  Result := FInputBuffer.Extract(LTermPos + Length(ATerminator), AEncoding);
  LTermPos := IndyMin(LTermPos, Length(Result));
  if (ATerminator = LF) and (LTermPos > 0) then begin
    if Result[LTermPos] = CR then begin
      Dec(LTermPos);
    end;
  end;
  SetLength(Result, LTermPos);
  }
  FInputBuffer.ExtractToBytes(LResult, LTermPos + Length(LTerm));
  if (ATerminator = LF) and (LTermPos > 0) then begin
    if LResult[LTermPos-1] = Ord(CR) then begin
      Dec(LTermPos);
    end;
  end;
  Result := BytesToString(LResult, 0, LTermPos, AEncoding);
end;

function TIdIOHandler.ReadLnRFC(var VMsgEnd: Boolean;
  AEncoding: TIdTextEncoding = nil): string;
{$IFDEF USECLASSINLINE}inline;{$ENDIF}
begin
  Result := ReadLnRFC(VMsgEnd, LF, '.', AEncoding); {do not localize}
end;

function TIdIOHandler.ReadLnRFC(var VMsgEnd: Boolean; const ALineTerminator: string;
  const ADelim: String = '.'; AEncoding: TIdTextEncoding = nil): string;
begin
  Result := ReadLn(ALineTerminator, AEncoding);
  // Do not use ATerminator since always ends with . (standard)
  if Result = ADelim then
  begin
    VMsgEnd := True;
    Exit;
  end;
  if TextStartsWith(Result, '.') then begin {do not localize}
    Delete(Result, 1, 1);
  end;
  VMsgEnd := False;
end;

function TIdIOHandler.ReadLnSplit(var AWasSplit: Boolean; ATerminator: string = LF;
  ATimeout: Integer = IdTimeoutDefault; AMaxLineLength: Integer = -1;
  AEncoding: TIdTextEncoding = nil): string;
var
  FOldAction: TIdMaxLineAction;
begin
  FOldAction := MaxLineAction;
  MaxLineAction := maSplit;
  try
    Result := ReadLn(ATerminator, ATimeout, AMaxLineLength, AEncoding);
    AWasSplit := FReadLnSplit;
  finally
    MaxLineAction := FOldAction;
  end;
end;

function TIdIOHandler.ReadLnWait(AFailCount: Integer = MaxInt;
  AEncoding: TIdTextEncoding = nil): string;
var
  LAttempts: Integer;
begin
  // MtW: this is mostly used when empty lines could be send.
  AEncoding := iif(AEncoding, FDefStringEncoding);
  Result := '';
  LAttempts := 0;
  while LAttempts < AFailCount do
  begin
    Result := Trim(ReadLn(AEncoding));
    if Length(Result) > 0 then begin
      Exit;
    end;
    if ReadLnTimedOut then begin
      raise EIdReadTimeout.Create(RSReadTimeout);
    end;
    Inc(LAttempts);
  end;
  raise EIdReadLnWaitMaxAttemptsExceeded.Create(RSReadLnWaitMaxAttemptsExceeded);
end;

function TIdIOHandler.ReadFromSource(ARaiseExceptionIfDisconnected: Boolean;
  ATimeout: Integer; ARaiseExceptionOnTimeout: Boolean): Integer;
var
  LByteCount: Integer;
  LLastError: Integer;
  LBuffer: TIdBytes;
begin
  if ATimeout = IdTimeoutDefault then begin
    // MtW: check for 0 too, for compatibility
    if (ReadTimeout = IdTimeoutDefault) or (ReadTimeout = 0) then begin
      ATimeout := IdTimeoutInfinite;
    end else begin
      ATimeout := ReadTimeout;
    end;
  end;
  Result := 0;
  // Check here as this side may have closed the socket
  CheckForDisconnect(ARaiseExceptionIfDisconnected);
  if SourceIsAvailable then begin
    LByteCount := 0;
    repeat
      if Readable(ATimeout) then begin
        if Opened then begin
          // No need to call AntiFreeze, the Readable does that.
          if SourceIsAvailable then begin
                                                                             
            // be a one time operation per connection.
            SetLength(LBuffer, RecvBufferSize); try
              LByteCount := ReadDataFromSource(LBuffer);
              if LByteCount > 0 then begin
                SetLength(LBuffer, LByteCount);
                if Intercept <> nil then begin
                  Intercept.Receive(LBuffer);
                  LByteCount := Length(LBuffer);
                end;
                // Pass through LBuffer first so it can go through Intercept
                                                               
                InputBuffer.Write(LBuffer);
              end;
            finally LBuffer := nil; end;
          end else begin
            EIdClosedSocket.Toss(RSStatusDisconnected);
          end;
        end else begin
          LByteCount := 0;
          if ARaiseExceptionIfDisconnected then begin
            EIdNotConnected.Toss(RSNotConnected);
          end;
        end;
        if LByteCount < 0 then
        begin
          LLastError := GStack.CheckForSocketError(LByteCount, [Id_WSAESHUTDOWN, Id_WSAECONNABORTED]);
          FClosedGracefully := True;
          Close;
          // Do not raise unless all data has been read by the user
          if InputBufferIsEmpty then begin
            GStack.RaiseSocketError(LLastError);
          end;
          LByteCount := 0;
        end;
        if LByteCount = 0 then begin
          FClosedGracefully := True;
        end;
        // Check here as other side may have closed connection
        CheckForDisconnect(ARaiseExceptionIfDisconnected);
        Result := LByteCount;
      end else begin
        // Timeout
        if ARaiseExceptionOnTimeout then begin
          EIdReadTimeout.Toss(RSReadTimeout);
        end;
        Result := -1;
        Break;
      end;
    until (LByteCount <> 0) or (not SourceIsAvailable);
  end
  else if ARaiseExceptionIfDisconnected then begin
    raise EIdException.Create(RSNotConnected);
  end;
end;

function TIdIOHandler.CheckForDataOnSource(ATimeout: Integer = 0): Boolean;
begin
  // return whether at least 1 byte was received
  Result := False;
  if Connected then begin
    Result := ReadFromSource(False, ATimeout, False) > 0;
  end;
end;

function FormatSecsToDHMS(Secs: int64): widestring;
var
  ds, Hrs, Min: Word;
begin
  Hrs := Secs div 3600;
  Secs := Secs mod 3600;
  Min := Secs div 60;
  Secs := Secs mod 60;
  ds := hrs div 24;
  hrs := hrs mod 24;

  if Round(Ds) > 0 then
  Result := Format('%d Days %d Hs %d Min %d Sec', [ds, Hrs, Min, Secs]) else
  if Round(Hrs) > 0 then
  Result := Format('%d Hrs %d Min %d Secs', [Hrs, Min, Secs]) else
  if Round(Min) > 0 then
  Result := Format('%d Min %d Secs', [Min, Secs]) else
  Result := Format('%d Secs', [Secs]);
end;

procedure TIdIOHandler.Write(AStream: TStream; ASize: TIdStreamSize = 0;
  AWriteByteCount: Boolean = FALSE; TransferInfo: TObject = nil);
var
  LBuffer: TIdBytes;
  LStreamPos: TIdStreamSize;
  LBufSize: Integer;
  // LBufferingStarted: Boolean;


  TI: TConexaoNew;
  GetTime: integer;
  Time, Result: extended;
  Ticknow, TickBefore: integer;
  UltimaPosicao: int64;
begin
  if Transferinfo <> nil then TI := TConexaoNew(TransferInfo) else TI := nil;

  if ASize < 0 then begin //"-1" All from current position
    LStreamPos := AStream.Position;
    ASize := AStream.Size - LStreamPos;
                                 
    AStream.Position := LStreamPos;
  end
  else if ASize = 0 then begin //"0" ALL
    ASize := AStream.Size;
    AStream.Position := 0;
  end;

  //else ">0" ACount bytes
  {$IFDEF SIZE64STREAM}
  if (ASize > High(Integer)) and (not LargeStream) then begin
    EIdIOHandlerRequiresLargeStream.Toss(RSRequiresLargeStream);
  end;
  {$ENDIF}

  // RLebeau 3/19/2006: DO NOT ENABLE WRITE BUFFERING IN THIS METHOD!
  //
  // When sending large streams, especially with LargeStream enabled,
  // this can easily cause "Out of Memory" errors.  It is the caller's
  // responsibility to enable/disable write buffering as needed before
  // calling one of the Write() methods.
  //
  // Also, forcing write buffering in this method is having major
  // impacts on TIdFTP, TIdFTPServer, and TIdHTTPServer.

  if AWriteByteCount then begin
    if LargeStream then begin
      Write(Int64(ASize));
    end else begin
      Write(Integer(ASize));
    end;
  end;

  if TI <> nil then
  begin
    GetTime := 1000;
    TickNow := GetTickCount;
    TickBefore := TickNow;
    UltimaPosicao := AStream.Position;
  end;

  BeginWork(wmWrite, ASize);
  try
    while ASize > 0 do begin
      SetLength(LBuffer, FSendBufferSize); //BGO: bad for speed
      LBufSize := IndyMin(ASize, FSendBufferSize);
      // Do not use ReadBuffer. Some source streams are real time and will not
      // return as much data as we request. Kind of like recv()
      // NOTE: We use .Size - size must be supported even if real time
      LBufSize := TIdStreamHelper.ReadBytes(AStream, LBuffer, LBufSize);
      if LBufSize = 0 then begin
        raise EIdNoDataToRead.Create(RSIdNoDataToRead);
      end;
      SetLength(LBuffer, LBufSize);
      Write(LBuffer);
      // RLebeau: DoWork() is called in WriteDirect()
      //DoWork(wmWrite, LBufSize);
      Dec(ASize, LBufSize);



      if (TI <> nil) and (Astream.Position > 0) then
      begin
        tickNow := getTickCount;

        if (tickNow - TickBefore >= 1000) and (AStream.Position > UltimaPosicao) then
        begin
          if (TI <> nil) and (TI.MasterIdentification <> 1234567890) then
          begin
            Self.CloseGracefully;
          end;

          if AStream.Position = 0 then TI.Transfer_TransferPosition_string := '0%' else
          TI.Transfer_TransferPosition_string := IntToStr(round((AStream.Position / TI.Transfer_LocalFileSize) * 100)) + '%';

          Time := (Ticknow - TickBefore) / 1000;
          Result := (AStream.Position - UltimaPosicao) / Time;
          TI.Transfer_Velocidade := FileSizeToStr(AStream.Position) + ' / ' +
                           FileSizeToStr(TI.Transfer_LocalFileSize) +
                           ' (' + FileSizeToStr(Round(Result)) + '/s)';
          //AStream.Size - AStream.Position ---> bytes restante
          //Round(Result) ---> Velocidade em bytes
          TI.Transfer_TempoRestante := FormatSecsToDHMS(round( (AStream.Size - AStream.Position) / Result));

          tickBefore := tickNow;
          UltimaPosicao := AStream.Position;
          TI.Transfer_TransferPosition := AStream.Position;
          TI.Transfer_VT.refresh;
        end;
      end;







    end;
  finally
    EndWork(wmWrite);
    LBuffer := nil;

    if (Astream.Position > 0) and (TI <> nil) then
    begin
      TI.Transfer_TransferPosition_string := IntToStr(round((AStream.Position / TI.Transfer_LocalFileSize) * 100)) + '%';
      TI.Transfer_TransferPosition := AStream.Position;
      TI.Transfer_Velocidade := FileSizeToStr(AStream.Position) + ' / ' +
                                     FileSizeToStr(TI.Transfer_LocalFileSize);
      TI.Transfer_VT.refresh;
    end;

  end;
  if TI <> nil then TI.Transfer_VT.refresh;
end;

procedure TIdIOHandler.ReadBytes(var VBuffer: TIdBytes; AByteCount: Integer; AAppend: Boolean = True; TransferInfo: TObject = nil);
begin
  Assert(FInputBuffer <> nil);
  if AByteCount > 0 then
  begin
    if TransferInfo <> nil then
    begin
      TConexaoNew(TransferInfo).Transfer_TransferPosition_string := IntToStr(round((FInputBuffer.Size / AByteCount) * 100)) + '%';
      TConexaoNew(TransferInfo).Transfer_VT.refresh;
    end;

    // Read from stack until we have enough data
    while FInputBuffer.Size < AByteCount do
    begin
      if TransferInfo <> nil then
      begin
        TConexaoNew(TransferInfo).Transfer_TransferPosition_string := IntToStr(round((FInputBuffer.Size / AByteCount) * 100)) + '%';
        TConexaoNew(TransferInfo).Transfer_VT.refresh;
      end;

      // RLebeau: in case the other party disconnects
      // after all of the bytes were transmitted ok.
      // No need to throw an exception just yet...
      if ReadFromSource(False) > 0 then
      begin
        if FInputBuffer.Size >= AByteCount then
        begin
          Break; // we have enough data now
        end;
      end;

      if (TransferInfo <> nil) and (TConexaoNew(TransferInfo).MasterIdentification <> 1234567890) then
      begin
        Self.CloseGracefully;
      end;

      CheckForDisconnect(True, True);

      if TransferInfo <> nil then
      begin
        TConexaoNew(TransferInfo).Transfer_TransferPosition_string := IntToStr(round((FInputBuffer.Size / AByteCount) * 100)) + '%';
        TConexaoNew(TransferInfo).Transfer_VT.refresh;
      end;
    end;

    if TransferInfo <> nil then
    begin
      TConexaoNew(TransferInfo).Transfer_TransferPosition_string := IntToStr(round((FInputBuffer.Size / AByteCount) * 100)) + '%';
      TConexaoNew(TransferInfo).Transfer_VT.refresh;
    end;

    FInputBuffer.ExtractToBytes(VBuffer, AByteCount, AAppend);
  end else if AByteCount < 0 then
  begin
    if (TransferInfo <> nil) and (TConexaoNew(TransferInfo).MasterIdentification <> 1234567890) then
    begin
      Self.CloseGracefully;
    end;

    ReadFromSource(False, ReadTimeout, False);
    CheckForDisconnect(True, True);
    FInputBuffer.ExtractToBytes(VBuffer, -1, AAppend);
  end;
  if TransferInfo <> nil then TConexaoNew(TransferInfo).Transfer_VT.Refresh;
end;

procedure TIdIOHandler.WriteLn(AEncoding: TIdTextEncoding = nil);
{$IFDEF USECLASSINLINE}inline;{$ENDIF}
begin
  WriteLn('', AEncoding);
end;

procedure TIdIOHandler.WriteLn(const AOut: string; AEncoding: TIdTextEncoding = nil);
begin
  // Do as one write so it only makes one call to network
  Write(AOut + EOL, AEncoding);
end;

procedure TIdIOHandler.WriteLnRFC(const AOut: string = ''; AEncoding: TIdTextEncoding = nil);
begin
  if TextStartsWith(AOut, '.') then begin {do not localize}
    WriteLn('.' + AOut, AEncoding); {do not localize}
  end else begin
    WriteLn(AOut, AEncoding);
  end;
end;

function TIdIOHandler.Readable(AMSec: Integer): Boolean;
begin
  // In case descendant does not override this or other methods but implements the higher level
  // methods
  Result := False;
end;

procedure TIdIOHandler.SetHost(const AValue: string);
begin
  FHost := AValue;
end;

procedure TIdIOHandler.SetPort(AValue: Integer);
begin
  FPort := AValue;
end;

function TIdIOHandler.Connected: Boolean;
begin
  CheckForDisconnect(False);
  Result :=
   (
     (
       // Set when closed properly. Reflects actual socket state.
       (not ClosedGracefully)
       // Created on Open. Prior to Open ClosedGracefully is still false.
       and (FInputBuffer <> nil)
     )
     // Buffer must be empty. Even if closed, we are "connected" if we still have
     // data
     or (not InputBufferIsEmpty)
   )
   and Opened;
end;

procedure AdjustStreamSize(const AStream: TStream; const ASize: TIdStreamSize);
var
  LStreamPos: TIdStreamSize;
begin
  LStreamPos := AStream.Position;
  AStream.Size := ASize;
  // Must reset to original value in cases where size changes position
  if AStream.Position <> LStreamPos then begin
    AStream.Position := LStreamPos;
  end;
end;

procedure TIdIOHandler.ReadStream(AStream: TStream; AByteCount: TIdStreamSize = -1;
  AReadUntilDisconnect: Boolean = false; TransferInfo: TObject = nil);
var
  i: int64;
  LBuf: TIdBytes;
  LByteCount, LPos: TIdStreamSize;
  {$IFNDEF SIZE64STREAM}
  LTmp: Int64;
  {$ENDIF}
  TI: TConexaoNew;
  GetTime: integer;
  Time, Result: extended;
  Ticknow, TickBefore: integer;
  UltimaPosicao: int64;
  TempStr: string;
  MS: TMemoryStream;
const
  cSizeUnknown = -1;
begin
  if Transferinfo <> nil then TI := TConexaoNew(TransferInfo) else TI := nil;

  Assert(AStream<>nil);

  if (AByteCount = cSizeUnknown) and (not AReadUntilDisconnect) then begin
    // Read size from connection
    if LargeStream then begin
      {$IFDEF SIZE64STREAM}
      LByteCount := ReadInt64;
      {$ELSE}
      LTmp := ReadInt64;
      if LTmp > MaxInt then begin
        EIdIOHandlerStreamDataTooLarge.Toss(RSDataTooLarge);
      end;
      LByteCount := TIdStreamSize(LTmp);
      {$ENDIF}
    end else begin
      LByteCount := ReadLongInt;
    end;
  end else begin
    LByteCount := AByteCount;
  end;

  // Presize stream if we know the size - this reduces memory/disk allocations to one time
  // Have an option for this? user might not want to presize, eg for int64 files
  if LByteCount > -1 then begin
    LPos := AStream.Position;
    if (High(TIdStreamSize) - LPos) < LByteCount then begin
      EIdIOHandlerStreamDataTooLarge.Toss(RSDataTooLarge);
    end;
    AdjustStreamSize(AStream, LPos + LByteCount);
  end;

  if (LByteCount <= cSizeUnknown) and (not AReadUntilDisconnect) then begin
    AReadUntilDisconnect := True;
  end;

  if AReadUntilDisconnect then begin
    BeginWork(wmRead);
  end else begin
    BeginWork(wmRead, LByteCount);
  end;

  try
    // If data already exists in the buffer, write it out first.
    // should this loop for all data in buffer up to workcount? not just one block?
    if FInputBuffer.Size > 0 then begin
      if AReadUntilDisconnect then begin
        i := FInputBuffer.Size;
      end else begin
        i := IndyMin(FInputBuffer.Size, LByteCount);
        Dec(LByteCount, i);
      end;
      FInputBuffer.ExtractToStream(AStream, i);
    end;

    // RLebeau - don't call Connected() here!  ReadBytes() already
    // does that internally. Calling Connected() here can cause an
    // EIdConnClosedGracefully exception that breaks the loop
    // prematurely and thus leave unread bytes in the InputBuffer.
    // Let the loop catch the exception before exiting...

    if TI <> nil then
    begin
      GetTime := 1000;
      TickNow := GetTickCount;
      TickBefore := TickNow;
      UltimaPosicao := AStream.Position;
    end;

    repeat
      if AReadUntilDisconnect then begin
        i := RecvBufferSize;
      end else begin
        i := IndyMin(LByteCount, RecvBufferSize);
        if i < 1 then begin
          Break;
        end;
      end;
      SetLength(LBuf, 0); // clear the buffer
                                                                       
      //DONE -oAPR: Dont use a string, use a memory buffer or better yet the buffer itself.
      try
        try
          ReadBytes(LBuf, i, False);
        except
          on E: Exception do begin
            // RLebeau - ReadFromSource() inside of ReadBytes()
            // could have filled the InputBuffer with more bytes
            // than actually requested, so don't extract too
            // many bytes here...
            i := IndyMin(i, FInputBuffer.Size);
            FInputBuffer.ExtractToBytes(LBuf, i);
            if (E is EIdConnClosedGracefully) and AReadUntilDisconnect then begin
              Break;
            end else begin
              raise;
            end;
          end;
        end;
        TIdAntiFreezeBase.DoProcess;
      finally
        if i > 0 then begin
          TIdStreamHelper.Write(AStream, LBuf, i);

          if (TI <> nil) and (Astream.Position > 0) then
          begin
            if (TI <> nil) and (TI.MasterIdentification <> 1234567890) then
            begin
              Self.CloseGracefully;
            end;

            tickNow := getTickCount;

            if (tickNow - TickBefore >= 1000) and (AStream.Position > UltimaPosicao) then
            begin
              if AStream.Position = 0 then TI.Transfer_TransferPosition_string := '0%' else
              TI.Transfer_TransferPosition_string := IntToStr(round((AStream.Position / TI.Transfer_RemoteFileSize) * 100)) + '%';

              Time := (Ticknow - TickBefore) / 1000;
              Result := (AStream.Position - UltimaPosicao) / Time;
              TI.Transfer_Velocidade := FileSizeToStr(AStream.Position) + ' / ' +
                               FileSizeToStr(TI.Transfer_RemoteFileSize) +
                               ' (' + FileSizeToStr(Round(Result)) + '/s)';

              //AStream.Size - AStream.Position ---> bytes restante
              //Round(Result) ---> Velocidade em bytes
              TI.Transfer_TempoRestante := FormatSecsToDHMS(round( (AStream.Size - AStream.Position) / Result));

              tickBefore := tickNow;
              UltimaPosicao := AStream.Position;
              TI.Transfer_TransferPosition := AStream.Position;
              TI.Transfer_VT.refresh;
            end;

            TempStr := TI.Transfer_RemoteFileName + '|' +
                       IntToStr(TI.Transfer_RemoteFileSize) + '|' +
                       TI.Transfer_LocalFileName + '|' +
                       IntToStr(TI.Transfer_TransferPosition) + '|';
            MS := TMemoryStream.Create;
            MS.Write(TempStr[1], length(TempStr) * 2);
            MS.SaveToFile(TI.Transfer_LocalFileName + '.xtreme');
            MS.Free;
            TI.Transfer_VT.refresh;
          end;

          if not AReadUntilDisconnect then begin
            Dec(LByteCount, i);
          end;
        end;
      end;
    until False;
  finally
    EndWork(wmRead);
    if AStream.Size > AStream.Position then begin
      AStream.Size := AStream.Position;
    end;
    LBuf := nil;
    if (Astream.Position > 0) and (TI <> nil) then
    begin
      TI.Transfer_TransferPosition_string := IntToStr(round((AStream.Position / TI.Transfer_RemoteFileSize) * 100)) + '%';
      TI.Transfer_TransferPosition := AStream.Position;
      TI.Transfer_Velocidade := FileSizeToStr(AStream.Position) + ' / ' +
                       FileSizeToStr(TI.Transfer_RemoteFileSize);

      TempStr := TI.Transfer_RemoteFileName + '|' +
                 IntToStr(TI.Transfer_RemoteFileSize) + '|' +
                 TI.Transfer_LocalFileName + '|' +
                 IntToStr(TI.Transfer_TransferPosition) + '|';
      MS := TMemoryStream.Create;
      MS.Write(TempStr[1], length(TempStr) * 2);
      MS.SaveToFile(TI.Transfer_LocalFileName + '.xtreme');
      MS.Free;
      TI.Transfer_VT.refresh;
    end;
  end;
  if TI <> nil then TI.Transfer_VT.Refresh;
end;

type
  TIdDiscardStream = class(TIdBaseStream)
  protected
    function IdRead(var VBuffer: TIdBytes; AOffset, ACount: Longint): Longint; override;
    function IdWrite(const ABuffer: TIdBytes; AOffset, ACount: Longint): Longint; override;
    function IdSeek(const AOffset: Int64; AOrigin: TSeekOrigin): Int64; override;
    procedure IdSetSize(ASize: Int64); override;
  end;

function TIdDiscardStream.IdRead(var VBuffer: TIdBytes; AOffset, ACount: Longint): Longint;
begin
  Result := 0;
end;

function TIdDiscardStream.IdSeek(const AOffset: Int64; AOrigin: TSeekOrigin): Int64;
begin
  Result := 0;
end;

procedure TIdDiscardStream.IdSetSize(ASize: Int64);
begin
//
end;

function TIdDiscardStream.IdWrite(const ABuffer: TIdBytes; AOffset, ACount: Longint): Longint;
begin
  Result := ACount;
end;

procedure TIdIOHandler.Discard(AByteCount: Int64);
var
  LStream: TIdDiscardStream;
  LSize: TIdStreamSize;
begin
                                                                                       
  Assert(AByteCount >= 0);
  if AByteCount > 0 then
  begin
    LStream := TIdDiscardStream.Create;
    try
      BeginWork(wmRead, AByteCount);
      try
        repeat
          if AByteCount < Int64(High(TIdStreamSize)) then begin
            LSize := TIdStreamSize(AByteCount);
          end else begin
            LSize := High(TIdStreamSize);
          end;
          ReadStream(LStream, LSize, False);
          Dec(AByteCount, LSize);
        until AByteCount < 1;
      finally
        EndWork(wmRead);
      end;
    finally
      LStream.Free;
    end;
  end;
end;

procedure TIdIOHandler.DiscardAll;
var
  LStream: TIdDiscardStream;
begin
                                                                                       
  LStream := TIdDiscardStream.Create;
  try
    ReadStream(LStream, -1, True);
  finally
    LStream.Free;
  end;
end;

procedure TIdIOHandler.RaiseConnClosedGracefully;
begin
  (* ************************************************************* //
  ------ If you receive an exception here, please read. ----------

  If this is a SERVER
  -------------------
  The client has disconnected the socket normally and this exception is used to notify the
  server handling code. This exception is normal and will only happen from within the IDE, not
  while your program is running as an EXE. If you do not want to see this, add this exception
  or EIdSilentException to the IDE options as exceptions not to break on.

  From the IDE just hit F9 again and Indy will catch and handle the exception.

  Please see the FAQ and help file for possible further information.
  The FAQ is at http://www.nevrona.com/Indy/FAQ.html

  If this is a CLIENT
  -------------------
  The server side of this connection has disconnected normaly but your client has attempted
  to read or write to the connection. You should trap this error using a try..except.
  Please see the help file for possible further information.

  // ************************************************************* *)
  raise EIdConnClosedGracefully.Create(RSConnectionClosedGracefully);
end;

function TIdIOHandler.InputBufferAsString(AEncoding: TIdTextEncoding = nil): string;
begin
  Result := FInputBuffer.Extract(FInputBuffer.Size, iif(AEncoding, FDefStringEncoding));
end;

function TIdIOHandler.AllData(AEncoding: TIdTextEncoding = nil): string;
var
  LBytes: Integer;
begin
  Result := '';
  BeginWork(wmRead);
  try
    if Connected then
    begin
      try
        try
          repeat
            LBytes := ReadFromSource(False, 250, False);
          until LBytes = 0; // -1 on timeout
        finally
          if not InputBufferIsEmpty then begin
            Result := InputBufferAsString(AEncoding);
          end;
        end;
      except end;
    end;
  finally
    EndWork(wmRead);
  end;
end;

procedure TIdIOHandler.PerformCapture(const ADest: TObject;
  out VLineCount: Integer; const ADelim: string;
  AIsRFCMessage: Boolean; AEncoding: TIdTextEncoding = nil);
var
  s: string;
  LStream: TStream;
  LStrings: TStrings;
begin
  VLineCount := 0;

  AEncoding := iif(AEncoding, FDefStringEncoding);

  LStream := nil;
  LStrings := nil;

  if ADest is TStrings then begin
    LStrings := TStrings(ADest);
  end else if ADest is TStream then begin
    LStream := TStream(ADest);
  end else begin
    EIdObjectTypeNotSupported.Toss(RSObjectTypeNotSupported);
  end;

  BeginWork(wmRead); try
    repeat
      s := ReadLn(AEncoding);
      if s = ADelim then begin
        Exit;
      end;
      // S.G. 6/4/2004: All the consumers to protect themselves against memory allocation attacks
      if FMaxCapturedLines > 0 then  begin
        if VLineCount > FMaxCapturedLines then begin
          raise EIdMaxCaptureLineExceeded.Create(RSMaximumNumberOfCaptureLineExceeded);
        end;
      end;
      // For RFC 822 retrieves
      // No length check necessary, if only one byte it will be byte x + #0.
      if AIsRFCMessage then begin
        if TextStartsWith(s, '..') then begin
          Delete(s, 1, 1);
        end;
      end;
      // Write to output
      Inc(VLineCount);
      if LStrings <> nil then begin
        LStrings.Add(s);
      end else if LStream <> nil then begin
        WriteStringToStream(LStream, s+EOL, AEncoding);
      end;
    until False;
  finally EndWork(wmRead); end;
end;

function TIdIOHandler.InputLn(const AMask: String = ''; AEcho: Boolean = True;
  ATabWidth: Integer = 8; AMaxLineLength: Integer = -1; AEncoding: TIdTextEncoding = nil): String;
var
  i: Integer;
  LChar: Char;
  LTmp: string;
begin
  Result := '';
  AEncoding := iif(AEncoding, FDefStringEncoding);
  if AMaxLineLength < 0 then begin
    AMaxLineLength := MaxLineLength;
  end;
  repeat
    LChar := ReadChar(AEncoding);
    i := Length(Result);
    if i <= AMaxLineLength then begin
      case LChar of
        BACKSPACE:
          begin
            if i > 0 then begin
              SetLength(Result, i - 1);
              if AEcho then begin
                Write(BACKSPACE + ' ' + BACKSPACE, AEncoding);
              end;
            end;
          end;
        TAB:
          begin
            if ATabWidth > 0 then begin
              i := ATabWidth - (i mod ATabWidth);
              LTmp := StringOfChar(' ', i);
              Result := Result + LTmp;
              if AEcho then begin
                Write(LTmp, AEncoding);
              end;
            end else begin
              Result := Result + LChar;
              if AEcho then begin
                Write(LChar, AEncoding);
              end;
            end;
          end;
        LF: ;
        CR: ;
        #27: ; //ESC - currently not supported
      else
        Result := Result + LChar;
        if AEcho then begin
          if Length(AMask) = 0 then begin
            Write(LChar, AEncoding);
          end else begin
            Write(AMask, AEncoding);
          end;
        end;
      end;
    end;
  until LChar = LF;
  // Remove CR trail
  i := Length(Result);
  while (i > 0) and CharIsInSet(Result, i, EOL) do begin
    Dec(i);
  end;
  SetLength(Result, i);
  if AEcho then begin
    WriteLn(AEncoding);
  end;
end;

function TIdIOHandler.WaitFor(const AString: string; ARemoveFromBuffer: Boolean = True;
  AInclusive: Boolean = False; AEncoding: TIdTextEncoding = nil;
  ATimeout: Integer = IdTimeoutDefault): string;
                                                                     
                                          
                                       
var
  LBytes: TIdBytes;
  LPos: Integer;
begin
  Result := '';
  AEncoding := iif(AEncoding, FDefStringEncoding);
  LBytes := ToBytes(AString, AEncoding);
  LPos := 0;
  repeat
    LPos := InputBuffer.IndexOf(LBytes, LPos);
    if LPos <> -1 then begin
      if ARemoveFromBuffer and AInclusive then begin
        Result := InputBuffer.Extract(LPos+Length(LBytes), AEncoding);
      end else begin
        Result := InputBuffer.Extract(LPos, AEncoding);
        if ARemoveFromBuffer then begin
          InputBuffer.Remove(Length(LBytes));
        end;
        if AInclusive then begin
          Result := Result + AString;
        end;
      end;
      Exit;
    end;
    LPos := IndyMax(0, InputBuffer.Size - (Length(LBytes)-1));
    ReadFromSource(True, ATimeout, True);
  until False;
end;

procedure TIdIOHandler.Capture(ADest: TStream; AEncoding: TIdTextEncoding = nil);
begin
  Capture(ADest, '.', True, AEncoding); {do not localize}
end;

procedure TIdIOHandler.Capture(ADest: TStream; out VLineCount: Integer;
  const ADelim: string = '.'; AIsRFCMessage: Boolean = True;
  AEncoding: TIdTextEncoding = nil);
begin
  PerformCapture(ADest, VLineCount, ADelim, AIsRFCMessage, AEncoding);
end;

procedure TIdIOHandler.Capture(ADest: TStream; ADelim: string;
  AIsRFCMessage: Boolean = True; AEncoding: TIdTextEncoding = nil);
var
  LLineCount: Integer;
begin
  PerformCapture(ADest, LLineCount, '.', AIsRFCMessage, AEncoding); {do not localize}
end;

procedure TIdIOHandler.Capture(ADest: TStrings; out VLineCount: Integer;
  const ADelim: string = '.'; AIsRFCMessage: Boolean = True;
  AEncoding: TIdTextEncoding = nil);
begin
  PerformCapture(ADest, VLineCount, ADelim, AIsRFCMessage, AEncoding);
end;

procedure TIdIOHandler.Capture(ADest: TStrings; AEncoding: TIdTextEncoding = nil);
var
  LLineCount: Integer; 
begin
  PerformCapture(ADest, LLineCount, '.', True, AEncoding); {do not localize}
end;

procedure TIdIOHandler.Capture(ADest: TStrings; const ADelim: string;
  AIsRFCMessage: Boolean = True; AEncoding: TIdTextEncoding = nil);
var
  LLineCount: Integer;
begin
  PerformCapture(ADest, LLineCount, ADelim, AIsRFCMessage, AEncoding);
end;

procedure TIdIOHandler.InputBufferToStream(AStream: TStream; AByteCount: Integer = -1);
begin
  FInputBuffer.ExtractToStream(AStream, AByteCount);
end;

function TIdIOHandler.InputBufferIsEmpty: Boolean;
begin
  Result := FInputBuffer.Size = 0;
end;

procedure TIdIOHandler.Write(const ABuffer: TIdBytes; const ALength: Integer = -1;
  const AOffset: Integer = 0);
var
  LLength: Integer;
  LTemp: TIdBytes;
begin
  LTemp := nil; // keep the compiler happy
  LLength := IndyLength(ABuffer, ALength, AOffset);
  if LLength > 0 then begin
    if FWriteBuffer = nil then begin
      WriteDirect(ABuffer, LLength, AOffset);
    end else begin
      // Write Buffering is enabled
      FWriteBuffer.Write(ABuffer, LLength, AOffset);
      if (FWriteBuffer.Size >= WriteBufferThreshold) and (WriteBufferThreshold > 0) then begin
        repeat
          WriteBufferFlush(WriteBufferThreshold);
        until FWriteBuffer.Size < WriteBufferThreshold;
      end;
    end;
  end;
end;

procedure TIdIOHandler.WriteRFCStrings(AStrings: TStrings; AWriteTerminator: Boolean = True;
  AEncoding: TIdTextEncoding = nil);
var
  i: Integer;
begin
  AEncoding := iif(AEncoding, FDefStringEncoding);
  for i := 0 to AStrings.Count - 1 do begin
    WriteLnRFC(AStrings[i], AEncoding);
  end;
  if AWriteTerminator then begin
    WriteLn('.', AEncoding);
  end;
end;

function TIdIOHandler.WriteFile(const AFile: String; AEnableTransferFile: Boolean): Int64;
var
                                                                           
  LStream: TStream;
begin
  if not FileExists(AFile) then begin
    raise EIdFileNotFound.CreateFmt(RSFileNotFound, [AFile]);
  end;
  LStream := TIdReadFileExclusiveStream.Create(AFile);
  try
    Write(LStream);
    Result := LStream.Size;
  finally
    FreeAndNil(LStream);
  end;
end;

function TIdIOHandler.WriteBufferingActive: Boolean;
begin
  Result := FWriteBuffer <> nil;
end;

procedure TIdIOHandler.CloseGracefully;
begin
  FClosedGracefully := True
end;

procedure TIdIOHandler.InterceptReceive(var VBuffer: TIdBytes);
begin
  if Intercept <> nil then begin
    Intercept.Receive(VBuffer);
  end;
end;

procedure TIdIOHandler.InitComponent;
begin
  inherited InitComponent;
  FRecvBufferSize := GRecvBufferSizeDefault;
  FSendBufferSize := GSendBufferSizeDefault;
  FMaxLineLength := IdMaxLineLengthDefault;
  FMaxCapturedLines := Id_IOHandler_MaxCapturedLines;
  FLargeStream := False;
  FReadTimeOut := IdTimeoutDefault;
  FInputBuffer := TIdBuffer.Create(BufferRemoveNotify);
  FDefStringEncoding := TIdTextEncoding.ASCII;
end;

procedure TIdIOHandler.WriteBufferFlush;
begin
  WriteBufferFlush(-1);
end;

procedure TIdIOHandler.WriteBufferOpen;
begin
  WriteBufferOpen(-1);
end;

procedure TIdIOHandler.WriteDirect(const ABuffer: TIdBytes; const ALength: Integer = -1;
  const AOffset: Integer = 0);
var
  LTemp: TIdBytes;
  LPos: Integer;
  LSize: Integer;
  LByteCount: Integer;
  LLastError: Integer;
begin
  // Check if disconnected
  CheckForDisconnect(True, True);
                                                       
  // so that a copy is no longer needed here
  LTemp := ToBytes(ABuffer, ALength, AOffset);
  if Intercept <> nil then begin
    Intercept.Send(LTemp);
  end;
  LSize := Length(LTemp);
  LPos := 0;
  while LPos < LSize do
  begin
    LByteCount := WriteDataToTarget(LTemp, LPos, LSize - LPos);
    if LByteCount < 0 then
    begin
      LLastError := GStack.CheckForSocketError(LByteCount, [ID_WSAESHUTDOWN, Id_WSAECONNABORTED, Id_WSAECONNRESET]);
      FClosedGracefully := True;
      Close;
      GStack.RaiseSocketError(LLastError);
    end;
                                                                                          
    // can be called more. Maybe a prop of the connection, MaxSendSize?
    TIdAntiFreezeBase.DoProcess(False);
    if LByteCount = 0 then begin
      FClosedGracefully := True;
    end;
    // Check if other side disconnected
    CheckForDisconnect;
    DoWork(wmWrite, LByteCount);
    Inc(LPos, LByteCount);
  end;
end;

initialization

finalization
  FreeAndNil(GIOHandlerClassList)
end.
