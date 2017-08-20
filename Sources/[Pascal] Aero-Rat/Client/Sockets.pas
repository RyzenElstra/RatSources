{
  Borland Delphi Winsock 1.1 Library by Aphex
  http://iamaphex.cjb.net
  unremote@knology.net

  This is a HEAVILY optimized version of Borland's
  ScktComp unit. It works in exactly the same fashion
  and supports all of it's Win32 functionality except
  using only 10% of the original vcl overhead.

  Also included is a TList, TStream and TThread class.

  For console applications you should make an object
  to contain your methods for socket events.

  Refer to the delphi help file for information about
  each of the different socket events!

  Example Program (22KB compilied with Delphi 6):

  type
    TConnection = class
      procedure Read(Sender: TObject; Socket: TCustomWinSocket);
    end;

  var
    Connection: TConnection;
    ClientSocket: TClientSocket;
    Msg: TMsg;
    Active: boolean;

  procedure TConnection.Read(Sender: TObject; Socket: TCustomWinSocket);
  begin
    WriteLn(Socket.ReceiveText);
  end;

  begin
    Connection := TConnection.Create;
    ClientSocket := TClientSocket.Create;
    ClientSocket.OnRead := Connection.Read;
    ClientSocket.Host := 'irc.server.net';
    ClientSocket.Port := 6667;
    ClientSocket.Active := True;
    Active := True;
    while Active do
    begin
      Sleep(100);
      if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
      begin
        if Msg.Message <> $0012 then
        begin
          TranslateMessage(Msg);
          DispatchMessage(Msg);
        end
        else
        begin
          Break;
        end;
      end;
    end;
  end.
}

unit Sockets;

interface

uses Windows, WinSock, CompressionStreamUnitForms, Forms, ComCtrls; { *g* }

const
  MAX_FRAME = 320000;
  FRAME_ID = $FFAADDEE;

const
  WM_USER = $0400;
  MaxListSize = Maxint div 16;
  soFromBeginning = 0;
  soFromCurrent = 1;
  soFromEnd = 2;

type
  PMessage = ^TMessage;
  TMessage = packed record
    Msg: Cardinal;
    case Integer of
      0: (
        WParam: Longint;
        LParam: Longint;
        Result: Longint);
      1: (
        WParamLo: Word;
        WParamHi: Word;
        LParamLo: Word;
        LParamHi: Word;
        ResultLo: Word;
        ResultHi: Word);
  end;

  TSeekOrigin = (soBeginning, soCurrent, soEnd);

type
  TWndMethod = procedure(var Message: TMessage) of object;

  PObjectInstance = ^TObjectInstance;
  TObjectInstance = packed record
    Code: Byte;
    Offset: Integer;
    case Integer of
      0: (Next: PObjectInstance);
      1: (Method: TWndMethod);
  end;

type

  TNotifyEvent = procedure(Sender: TObject) of object;

  TStream = class;

{ TList class }

  PPointerList = ^TPointerList;
  TPointerList = array[0..MaxListSize - 1] of Pointer;
  TListSortCompare = function (Item1, Item2: Pointer): Integer;
  TListNotification = (lnAdded, lnExtracted, lnDeleted);
  TListAssignOp = (laCopy, laAnd, laOr, laXor, laSrcUnique, laDestUnique);
  TList = class(TObject)
  private
    FList: PPointerList;
    FCount: Integer;
    FCapacity: Integer;
  protected
    function Get(Index: Integer): Pointer;
    procedure Grow; virtual;
    procedure Put(Index: Integer; Item: Pointer);
    procedure Notify(Ptr: Pointer; Action: TListNotification); virtual;
    procedure SetCapacity(NewCapacity: Integer);
    procedure SetCount(NewCount: Integer);
  public
    destructor Destroy; override;
    function Add(Item: Pointer): Integer;
    procedure Clear; virtual;
    procedure Delete(Index: Integer);
    procedure Exchange(Index1, Index2: Integer);
    function Expand: TList;
    function Extract(Item: Pointer): Pointer;
    function First: Pointer;
    function IndexOf(Item: Pointer): Integer;
    procedure Insert(Index: Integer; Item: Pointer);
    function Last: Pointer;
    procedure Move(CurIndex, NewIndex: Integer);
    function Remove(Item: Pointer): Integer;
    procedure Pack;
    procedure Sort(Compare: TListSortCompare);
    procedure Assign(ListA: TList; AOperator: TListAssignOp = laCopy; ListB: TList = nil);
    property Capacity: Integer read FCapacity write SetCapacity;
    property Count: Integer read FCount write SetCount;
    property Items[Index: Integer]: Pointer read Get write Put; default;
    property List: PPointerList read FList;
  end;

{ TThread class }

  TThreadMethod = procedure of object;

  TThreadPriority = (tpIdle, tpLowest, tpLower, tpNormal, tpHigher, tpHighest, tpTimeCritical);

  TThread = class
  private
    FHandle: THandle;
    FThreadID: THandle;
    FCreateSuspended: Boolean;
    FTerminated: Boolean;
    FSuspended: Boolean;
    FFreeOnTerminate: Boolean;
    FFinished: Boolean;
    FReturnValue: Integer;
    FOnTerminate: TNotifyEvent;
    FMethod: TThreadMethod;
    FSynchronizeException: TObject;
    FFatalException: TObject;
    procedure CheckThreadError(ErrCode: Integer); overload;
    procedure CheckThreadError(Success: Boolean); overload;
    procedure CallOnTerminate;
    function GetPriority: TThreadPriority;
    procedure SetPriority(Value: TThreadPriority);
    procedure SetSuspended(Value: Boolean);
  protected
    procedure DoTerminate; virtual;
    procedure Execute; virtual; abstract;
    procedure Synchronize(Method: TThreadMethod);
    property ReturnValue: Integer read FReturnValue write FReturnValue;
    property Terminated: Boolean read FTerminated;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;
    procedure AfterConstruction; override;
    procedure Resume;
    procedure Suspend;
    procedure Terminate;
    function WaitFor: LongWord;
    property FatalException: TObject read FFatalException;
    property FreeOnTerminate: Boolean read FFreeOnTerminate write FFreeOnTerminate;
    property Handle: THandle read FHandle;
    property Priority: TThreadPriority read GetPriority write SetPriority;
    property Suspended: Boolean read FSuspended write SetSuspended;
    property ThreadID: THandle read FThreadID;
    property OnTerminate: TNotifyEvent read FOnTerminate write FOnTerminate;
  end;

{ TStream class }

  TStream = class(TObject)
  private
    function GetPosition: Int64;
    procedure SetPosition(const Pos: Int64);
    function GetSize: Int64;
    procedure SetSize64(const NewSize: Int64);
  protected
    procedure SetSize(NewSize: Longint); overload; virtual;
    procedure SetSize(const NewSize: Int64); overload; virtual;
  public
    function Read(var Buffer; Count: Longint): Longint; virtual; abstract;
    function Write(const Buffer; Count: Longint): Longint; virtual; abstract;
    function Seek(Offset: Longint; Origin: Word): Longint; overload; virtual;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; overload; virtual;
    procedure ReadBuffer(var Buffer; Count: Longint);
    procedure WriteBuffer(const Buffer; Count: Longint);
    function CopyFrom(Source: TStream; Count: Int64): Int64;
    property Position: Int64 read GetPosition write SetPosition;
    property Size: Int64 read GetSize write SetSize64;
  end;

type
  PSecurityAttributes = pointer;

  TSynchroObject = class(TObject)
  public
    procedure Acquire; virtual;
    procedure Release; virtual;
  end;

  THandleObject = class(TSynchroObject)
  private
    FHandle: THandle;
    FLastError: Integer;
  public
    destructor Destroy; override;
    property LastError: Integer read FLastError;
    property Handle: THandle read FHandle;
  end;

  TWaitResult = (wrSignaled, wrTimeout, wrAbandoned, wrError);

  TEvent = class(THandleObject)
  public
    constructor Create(EventAttributes: PSecurityAttributes; ManualReset,
      InitialState: Boolean; const Name: string);
    function WaitFor(Timeout: LongWord): TWaitResult;
    procedure SetEvent;
    procedure ResetEvent;
  end;

  TSimpleEvent = class(TEvent)
  public
    constructor Create;
  end;

  TCriticalSection = class(TSynchroObject)
  protected
    FSection: TRTLCriticalSection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Acquire; override;
    procedure Release; override;
    procedure Enter;
    procedure Leave;
  end;

const
  CM_SOCKETMESSAGE = WM_USER + $0001;
  CM_DEFERFREE = WM_USER + $0002;
  CM_LOOKUPCOMPLETE = WM_USER + $0003;

type
  TCMSocketMessage = record
    Msg: Cardinal;
    Socket: TSocket;
    SelectEvent: Word;
    SelectError: Word;
    Result: Longint;
  end;

  TCMLookupComplete = record
    Msg: Cardinal;
    LookupHandle: THandle;
    AsyncBufLen: Word;
    AsyncError: Word;
    Result: Longint;
  end;

  TCustomWinSocket = class;
  TCustomSocket = class;
  TServerAcceptThread = class;
  TServerClientThread = class;
  TServerWinSocket = class;
  TServerClientWinSocket = class;

  TServerType = (stNonBlocking, stThreadBlocking);
  TClientType = (ctNonBlocking, ctBlocking);
  TAsyncStyle = (asRead, asWrite, asOOB, asAccept, asConnect, asClose);
  TAsyncStyles = set of TAsyncStyle;
  TSocketEvent = (seLookup, seConnecting, seConnect, seDisconnect, seListen,
    seAccept, seWrite, seRead);
  TLookupState = (lsIdle, lsLookupAddress, lsLookupService);
  TErrorEvent = (eeGeneral, eeSend, eeReceive, eeConnect, eeDisconnect, eeAccept, eeLookup);

  TSocketEventEvent = procedure (Sender: TObject; Socket: TCustomWinSocket;
    SocketEvent: TSocketEvent) of object;
  TSocketErrorEvent = procedure (Sender: TObject; Socket: TCustomWinSocket;
    ErrorEvent: TErrorEvent; var ErrorCode: Integer) of object;
  TGetSocketEvent = procedure (Sender: TObject; Socket: TSocket;
    var ClientSocket: TServerClientWinSocket) of object;
  TGetThreadEvent = procedure (Sender: TObject; ClientSocket: TServerClientWinSocket;
    var SocketThread: TServerClientThread) of object;
  TSocketNotifyEvent = procedure (Sender: TObject; Socket: TCustomWinSocket) of object;

  TNotifySocketEvent = procedure(var Socket: TCustomWinSocket; Data: pointer) of object;

  TConnectionInfo = record
    ConnectionType: dword;
  end;

  TCommandFrame = record
    Len: int64;
    Command: dword;
    Id: dword;
  end;
  PCommandFrame = ^TCommandFrame;

  TStreamFrame = record
    Len: int64;
    Rate: Single;
    Id: dword;
  end;

  TComputerInfo = record
    LanIP: dword;
    ComputerName: array [0..MAX_PATH] of char;
    UserName: array [0..MAX_PATH] of char;
    ID: array [0..MAX_PATH] of char;
    OS: byte;
    CPU: int64;
    RAM: int64;
    Webcam: boolean;
  end;

  TStreamRecord = class
    Stream: TMemoryStream;
    StreamFrame: TStreamFrame;
    TotalBytesRead: longint;
    ReceivingStream: boolean;
    ListItem: TListItem;
    StreamListItem: TListItem;
    ProgressBar: TProgressBar;
    LocalAddress: string;
    Info: TComputerInfo;
    SendProgressBar: TProgressBar;
    SendStreamListItem: TListItem;
  end;

  TNotifySocketFrameEvent = procedure(var Socket: TCustomWinSocket; Frame: TCommandFrame; Stream: TMemoryStream; Data: pointer) of object;

  TNotifyInfo = class
    Data: pointer;
    Callback: pointer;
  end;

  TCustomWinSocket = class
  private
    FSocket: TSocket;
    FConnected: Boolean;
    FSendStream: TStream;
    FDropAfterSend: Boolean;
    FHandle: HWnd;
    FAddr: TSockAddrIn;
    FAsyncStyles: TASyncStyles;
    FLookupState: TLookupState;
    FLookupHandle: THandle;
    FOnSocketEvent: TSocketEventEvent;
    FOnErrorEvent: TSocketErrorEvent;
    FSocketLock: TCriticalSection;
    FGetHostData: Pointer;
    FData: Pointer;
    FService: string;
    FPort: Word;
    FClient: Boolean;
    FQueueSize: Integer;
    function SendStreamPiece: Boolean;
    procedure WndProc(var Message: TMessage);
    procedure CMLookupComplete(var Message: TCMLookupComplete); message CM_LOOKUPCOMPLETE;
    procedure CMSocketMessage(var Message: TCMSocketMessage); message CM_SOCKETMESSAGE;
    procedure CMDeferFree(var Message); message CM_DEFERFREE;
    procedure DeferFree;
    procedure DoSetAsyncStyles;
    function GetHandle: HWnd;
    function GetLocalHost: string;
    function GetLocalAddress: string;
    function GetLocalPort: Integer;
    function GetRemoteHost: string;
    function GetRemoteAddress: string;
    function GetRemotePort: Integer;
    function GetRemoteAddr: TSockAddrIn;
  protected
    procedure AsyncInitSocket(const Name, Address, Service: string; Port: Word;
      QueueSize: Integer; Client: Boolean);
    procedure DoOpen;
    procedure DoListen(QueueSize: Integer);
    function InitSocket(const Name, Address, Service: string; Port: Word;
      Client: Boolean): TSockAddrIn;
    procedure Event(Socket: TCustomWinSocket; SocketEvent: TSocketEvent); dynamic;
    procedure Error(Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer); dynamic;
    procedure SetAsyncStyles(Value: TASyncStyles);
  public
    constructor Create(ASocket: TSocket);
    destructor Destroy; override;
    procedure Close;
    procedure DefaultHandler(var Message); override;
    procedure Lock;
    procedure Unlock;
    procedure Listen(const Name, Address, Service: string; Port: Word;
      QueueSize: Integer; Block: Boolean = True);
    procedure Open(const Name, Address, Service: string; Port: Word; Block: Boolean = True);
    procedure Accept(Socket: TSocket); virtual;
    procedure Connect(Socket: TSocket); virtual;
    procedure Disconnect(Socket: TSocket); virtual;
    procedure Read(Socket: TSocket); virtual;
    procedure Write(Socket: TSocket); virtual;
    function LookupName(const name: string): TInAddr;
    function LookupService(const service: string): Integer;

    function ReceiveLength: Integer;
    function ReceiveBuf(var Buf; Count: Integer): Integer;
    function ReceiveText: string;
    function SendBuf(var Buf; Count: Integer): Integer;
    function SendStream(AStream: TStream): Boolean;
    function SendStreamThenDrop(AStream: TStream): Boolean;
    function SendText(const S: string): Integer;

    property LocalHost: string read GetLocalHost;
    property LocalAddress: string read GetLocalAddress;
    property LocalPort: Integer read GetLocalPort;

    property RemoteHost: string read GetRemoteHost;
    property RemoteAddress: string read GetRemoteAddress;
    property RemotePort: Integer read GetRemotePort;
    property RemoteAddr: TSockAddrIn read GetRemoteAddr;

    property Connected: Boolean read FConnected;
    property Addr: TSockAddrIn read FAddr;
    property ASyncStyles: TAsyncStyles read FAsyncStyles write SetAsyncStyles;
    property Handle: HWnd read GetHandle;
    property SocketHandle: TSocket read FSocket;
    property LookupState: TLookupState read FLookupState;

    property OnSocketEvent: TSocketEventEvent read FOnSocketEvent write FOnSocketEvent;
    property OnErrorEvent: TSocketErrorEvent read FOnErrorEvent write FOnErrorEvent;

    property Data: Pointer read FData write FData;
  end;

  TClientWinSocket = class(TCustomWinSocket)
  private
    FClientType: TClientType;
  protected
    procedure SetClientType(Value: TClientType);
  public
    procedure Connect(Socket: TSocket); override;
    property ClientType: TClientType read FClientType write SetClientType;
  end;

  TServerClientWinSocket = class(TCustomWinSocket)
  private
    FServerWinSocket: TServerWinSocket;
  public
    constructor Create(Socket: TSocket; ServerWinSocket: TServerWinSocket);
    destructor Destroy; override;

    property ServerWinSocket: TServerWinSocket read FServerWinSocket;
  end;

  TThreadNotifyEvent = procedure (Sender: TObject;
    Thread: TServerClientThread) of object;

  TServerWinSocket = class(TCustomWinSocket)
  private
    FServerType: TServerType;
    FThreadCacheSize: Integer;
    FConnections: TList;
    FActiveThreads: TList;
    FListLock: TCriticalSection;
    FServerAcceptThread: TServerAcceptThread;
    FOnGetSocket: TGetSocketEvent;
    FOnGetThread: TGetThreadEvent;
    FOnThreadStart: TThreadNotifyEvent;
    FOnThreadEnd: TThreadNotifyEvent;
    FOnClientConnect: TSocketNotifyEvent;
    FOnClientDisconnect: TSocketNotifyEvent;
    FOnClientRead: TSocketNotifyEvent;
    FOnClientWrite: TSocketNotifyEvent;
    FOnClientError: TSocketErrorEvent;
    procedure AddClient(AClient: TServerClientWinSocket);
    procedure RemoveClient(AClient: TServerClientWinSocket);
    procedure AddThread(AThread: TServerClientThread);
    procedure RemoveThread(AThread: TServerClientThread);
    procedure ClientEvent(Sender: TObject; Socket: TCustomWinSocket;
      SocketEvent: TSocketEvent);
    procedure ClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    function GetActiveConnections: Integer;
    function GetActiveThreads: Integer;
    function GetConnections(Index: Integer): TCustomWinSocket;
    function GetIdleThreads: Integer;
  protected
    function DoCreateThread(ClientSocket: TServerClientWinSocket): TServerClientThread; virtual;
    procedure Listen(var Name, Address, Service: string; Port: Word;
      QueueSize: Integer);
    procedure SetServerType(Value: TServerType);
    procedure SetThreadCacheSize(Value: Integer);
    procedure ThreadEnd(AThread: TServerClientThread); dynamic;
    procedure ThreadStart(AThread: TServerClientThread); dynamic;
    function GetClientSocket(Socket: TSocket): TServerClientWinSocket; dynamic;
    function GetServerThread(ClientSocket: TServerClientWinSocket): TServerClientThread; dynamic;
    procedure ClientRead(Socket: TCustomWinSocket); dynamic;
    procedure ClientWrite(Socket: TCustomWinSOcket); dynamic;
    procedure ClientConnect(Socket: TCustomWinSOcket); dynamic;
    procedure ClientDisconnect(Socket: TCustomWinSOcket); dynamic;
    procedure ClientErrorEvent(Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer); dynamic;
  public
    constructor Create(ASocket: TSocket);
    destructor Destroy; override;
    procedure Accept(Socket: TSocket); override;
    procedure Disconnect(Socket: TSocket); override;
    function GetClientThread(ClientSocket: TServerClientWinSocket): TServerClientThread;
    property ActiveConnections: Integer read GetActiveConnections;
    property ActiveThreads: Integer read GetActiveThreads;
    property Connections[Index: Integer]: TCustomWinSocket read GetConnections;
    property IdleThreads: Integer read GetIdleThreads;
    property ServerType: TServerType read FServerType write SetServerType;
    property ThreadCacheSize: Integer read FThreadCacheSize write SetThreadCacheSize;
    property OnGetSocket: TGetSocketEvent read FOnGetSocket write FOnGetSocket;
    property OnGetThread: TGetThreadEvent read FOnGetThread write FOnGetThread;
    property OnThreadStart: TThreadNotifyEvent read FOnThreadStart write FOnThreadStart;
    property OnThreadEnd: TThreadNotifyEvent read FOnThreadEnd write FOnThreadEnd;
    property OnClientConnect: TSocketNotifyEvent read FOnClientConnect write FOnClientConnect;
    property OnClientDisconnect: TSocketNotifyEvent read FOnClientDisconnect write FOnClientDisconnect;
    property OnClientRead: TSocketNotifyEvent read FOnClientRead write FOnClientRead;
    property OnClientWrite: TSocketNotifyEvent read FOnClientWrite write FOnClientWrite;
    property OnClientError: TSocketErrorEvent read FOnClientError write FOnClientError;
  end;

  TServerAcceptThread = class(TThread)
  private
    FServerSocket: TServerWinSocket;
  public
    constructor Create(CreateSuspended: Boolean; ASocket: TServerWinSocket);
    procedure Execute; override;

    property ServerSocket: TServerWinSocket read FServerSocket;
  end;

  TServerClientThread = class(TThread)
  private
    FClientSocket: TServerClientWinSocket;
    FServerSocket: TServerWinSocket;
    FEvent: TSimpleEvent;
    FKeepInCache: Boolean;
    FData: Pointer;
    procedure HandleEvent(Sender: TObject; Socket: TCustomWinSocket;
      SocketEvent: TSocketEvent);
    procedure HandleError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure DoRead;
    procedure DoWrite;
  protected
    procedure DoTerminate; override;
    procedure Execute; override;
    procedure ClientExecute; virtual;
    procedure Event(SocketEvent: TSocketEvent); virtual;
    procedure Error(ErrorEvent: TErrorEvent; var ErrorCode: Integer); virtual;
    procedure HandleException; virtual;
    procedure ReActivate(ASocket: TServerClientWinSocket);
    function StartConnect: Boolean;
    function EndConnect: Boolean;
  public
    constructor Create(CreateSuspended: Boolean; ASocket: TServerClientWinSocket);
    destructor Destroy; override;

    property ClientSocket: TServerClientWinSocket read FClientSocket;
    property ServerSocket: TServerWinSocket read FServerSocket;
    property KeepInCache: Boolean read FKeepInCache write FKeepInCache;
    property Data: Pointer read FData write FData;
  end;

  TAbstractSocket = class(TObject)
  private
    FActive: Boolean;
    FPort: Integer;
    FAddress: string;
    FHost: string;
    FService: string;
    procedure DoEvent(Sender: TObject; Socket: TCustomWinSocket;
      SocketEvent: TSocketEvent);
    procedure DoError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
  protected
    procedure Event(Socket: TCustomWinSocket; SocketEvent: TSocketEvent);
      virtual; abstract;
    procedure Error(Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer); virtual; abstract;
    procedure DoActivate(Value: Boolean); virtual; abstract;
    procedure InitSocket(Socket: TCustomWinSocket);
    procedure SetActive(Value: Boolean);
    procedure SetAddress(Value: string);
    procedure SetHost(Value: string);
    procedure SetPort(Value: Integer);
    procedure SetService(Value: string);
    property Active: Boolean read FActive write SetActive;
    property Address: string read FAddress write SetAddress;
    property Host: string read FHost write SetHost;
    property Port: Integer read FPort write SetPort;
    property Service: string read FService write SetService;
  public
    procedure Open;
    procedure Close;
  end;

  TCustomSocket = class(TAbstractSocket)
  private
    FOnLookup: TSocketNotifyEvent;
    FOnConnect: TSocketNotifyEvent;
    FOnConnecting: TSocketNotifyEvent;
    FOnDisconnect: TSocketNotifyEvent;
    FOnListen: TSocketNotifyEvent;
    FOnAccept: TSocketNotifyEvent;
    FOnRead: TSocketNotifyEvent;
    FOnWrite: TSocketNotifyEvent;
    FOnError: TSocketErrorEvent;
  protected
    procedure Event(Socket: TCustomWinSocket; SocketEvent: TSocketEvent); override;
    procedure Error(Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer); override;
    property OnLookup: TSocketNotifyEvent read FOnLookup write FOnLookup;
    property OnConnecting: TSocketNotifyEvent read FOnConnecting write FOnConnecting;
    property OnConnect: TSocketNotifyEvent read FOnConnect write FOnConnect;
    property OnDisconnect: TSocketNotifyEvent read FOnDisconnect write FOnDisconnect;
    property OnListen: TSocketNotifyEvent read FOnListen write FOnListen;
    property OnAccept: TSocketNotifyEvent read FOnAccept write FOnAccept;
    property OnRead: TSocketNotifyEvent read FOnRead write FOnRead;
    property OnWrite: TSocketNotifyEvent read FOnWrite write FOnWrite;
    property OnError: TSocketErrorEvent read FOnError write FOnError;
  end;

  TWinSocketStream = class(TStream)
  private
    FSocket: TCustomWinSocket;
    FTimeout: Longint;
    FEvent: TSimpleEvent;
  public
    constructor Create(ASocket: TCustomWinSocket; TimeOut: Longint);
    destructor Destroy; override;
    function WaitForData(Timeout: Longint): Boolean;
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    property TimeOut: Longint read FTimeout write FTimeout;
  end;

  TClientSocket = class(TCustomSocket)
  private
    FClientSocket: TClientWinSocket;
  protected
    procedure DoActivate(Value: Boolean); override;
    function GetClientType: TClientType;
    procedure SetClientType(Value: TClientType);
  public
    constructor Create;
    destructor Destroy; override;
    property Socket: TClientWinSocket read FClientSocket;
  published
    property Active;
    property Address;
    property ClientType: TClientType read GetClientType write SetClientType;
    property Host;
    property Port;
    property Service;
    property OnLookup;
    property OnConnecting;
    property OnConnect;
    property OnDisconnect;
    property OnRead;
    property OnWrite;
    property OnError;
  end;

  TCustomServerSocket = class(TCustomSocket)
  protected
    FServerSocket: TServerWinSocket;
    procedure DoActivate(Value: Boolean); override;
    function GetServerType: TServerType;
    function GetGetThreadEvent: TGetThreadEvent;
    function GetGetSocketEvent: TGetSocketEvent;
    function GetThreadCacheSize: Integer;
    function GetOnThreadStart: TThreadNotifyEvent;
    function GetOnThreadEnd: TThreadNotifyEvent;
    function GetOnClientEvent(Index: Integer): TSocketNotifyEvent;
    function GetOnClientError: TSocketErrorEvent;
    procedure SetServerType(Value: TServerType);
    procedure SetGetThreadEvent(Value: TGetThreadEvent);
    procedure SetGetSocketEvent(Value: TGetSocketEvent);
    procedure SetThreadCacheSize(Value: Integer);
    procedure SetOnThreadStart(Value: TThreadNotifyEvent);
    procedure SetOnThreadEnd(Value: TThreadNotifyEvent);
    procedure SetOnClientEvent(Index: Integer; Value: TSocketNotifyEvent);
    procedure SetOnClientError(Value: TSocketErrorEvent);
    property ServerType: TServerType read GetServerType write SetServerType;
    property ThreadCacheSize: Integer read GetThreadCacheSize
      write SetThreadCacheSize;
    property OnGetThread: TGetThreadEvent read GetGetThreadEvent
      write SetGetThreadEvent;
    property OnGetSocket: TGetSocketEvent read GetGetSocketEvent
      write SetGetSocketEvent;
    property OnThreadStart: TThreadNotifyEvent read GetOnThreadStart
      write SetOnThreadStart;
    property OnThreadEnd: TThreadNotifyEvent read GetOnThreadEnd
      write SetOnThreadEnd;
    property OnClientConnect: TSocketNotifyEvent index 2 read GetOnClientEvent
      write SetOnClientEvent;
    property OnClientDisconnect: TSocketNotifyEvent index 3 read GetOnClientEvent
      write SetOnClientEvent;
    property OnClientRead: TSocketNotifyEvent index 0 read GetOnClientEvent
      write SetOnClientEvent;
    property OnClientWrite: TSocketNotifyEvent index 1 read GetOnClientEvent
      write SetOnClientEvent;
    property OnClientError: TSocketErrorEvent read GetOnClientError write SetOnClientError;
  public
    destructor Destroy; override;
  end;

  TServerSocket = class(TCustomServerSocket)
  public
    property Socket: TServerWinSocket read FServerSocket;
  published
    property Active;
    property Port;
    property Service;
    property ServerType;
    property ThreadCacheSize default 10;
    property OnListen;
    property OnAccept;
    property OnGetThread;
    property OnGetSocket;
    property OnThreadStart;
    property OnThreadEnd;
    property OnClientConnect;
    property OnClientDisconnect;
    property OnClientRead;
    property OnClientWrite;
    property OnClientError;
    constructor Create;
  end;

  TSocketErrorProc = procedure (ErrorCode: Integer);

function SetErrorProc(ErrorProc: TSocketErrorProc): TSocketErrorProc;
function AllocateHWnd(Method: TWndMethod): HWND;
procedure DeallocateHWnd(Wnd: HWND);

implementation

threadvar
  SocketErrorProc: TSocketErrorProc;

type
  PInstanceBlock = ^TInstanceBlock;
  TInstanceBlock = packed record
    Next: PInstanceBlock;
    Code: array[1..2] of Byte;
    WndProcPtr: Pointer;
    Instances: array[0..313] of TObjectInstance;
  end;

var
  WSAData: TWSAData;
  InstBlockList: PInstanceBlock;
  InstFreeList: PObjectInstance;
  UtilWindowClass: TWndClass = (
    style: 0;
    lpfnWndProc: @DefWindowProc;
    cbClsExtra: 0;
    cbWndExtra: 0;
    hInstance: 0;
    hIcon: 0;
    hCursor: 0;
    hbrBackground: 0;
    lpszMenuName: nil;
    lpszClassName: 'TPUtilWindow');

{ TSynchroObject }

procedure TSynchroObject.Acquire;
begin
end;

procedure TSynchroObject.Release;
begin
end;

{ THandleObject }

destructor THandleObject.Destroy;
begin
  CloseHandle(FHandle);
  inherited Destroy;
end;

{ TEvent }

constructor TEvent.Create(EventAttributes: PSecurityAttributes; ManualReset,
  InitialState: Boolean; const Name: string);
begin
  FHandle := CreateEvent(EventAttributes, ManualReset, InitialState, PChar(Name));
end;

function TEvent.WaitFor(Timeout: LongWord): TWaitResult;
begin
  case WaitForSingleObject(Handle, Timeout) of
    WAIT_ABANDONED: Result := wrAbandoned;
    WAIT_OBJECT_0: Result := wrSignaled;
    WAIT_TIMEOUT: Result := wrTimeout;
    WAIT_FAILED:
      begin
        Result := wrError;
        FLastError := GetLastError;
      end;
  else
    Result := wrError;
  end;
end;

procedure TEvent.SetEvent;
begin
  Windows.SetEvent(Handle);
end;

procedure TEvent.ResetEvent;
begin
  Windows.ResetEvent(Handle);
end;

{ TSimpleEvent }

constructor TSimpleEvent.Create;
begin
  inherited Create(nil, True, False, '');
end;

{ TCriticalSection }

constructor TCriticalSection.Create;
begin
  inherited Create;
  InitializeCriticalSection(FSection);
end;

destructor TCriticalSection.Destroy;
begin
  DeleteCriticalSection(FSection);
  inherited Destroy;
end;

procedure TCriticalSection.Acquire;
begin
  EnterCriticalSection(FSection);
end;

procedure TCriticalSection.Release;
begin
  LeaveCriticalSection(FSection);
end;

procedure TCriticalSection.Enter;
begin
  Acquire;
end;

procedure TCriticalSection.Leave;
begin
  Release;
end;

{ TList }

destructor TList.Destroy;
begin
  Clear;
end;

function TList.Add(Item: Pointer): Integer;
begin
  Result := FCount;
  if Result = FCapacity then
    Grow;
  FList^[Result] := Item;
  Inc(FCount);
  if Item <> nil then
    Notify(Item, lnAdded);
end;

procedure TList.Clear;
begin
  SetCount(0);
  SetCapacity(0);
end;

procedure TList.Delete(Index: Integer);
var
  Temp: Pointer;
begin
  if (Index < 0) or (Index >= FCount) then
    Exit;
  Temp := Items[Index];
  Dec(FCount);
  if Index < FCount then
    System.Move(FList^[Index + 1], FList^[Index],
      (FCount - Index) * SizeOf(Pointer));
  if Temp <> nil then
    Notify(Temp, lnDeleted);
end;

procedure TList.Exchange(Index1, Index2: Integer);
var
  Item: Pointer;
begin
  if (Index1 < 0) or (Index1 >= FCount) then
    Exit;
  if (Index2 < 0) or (Index2 >= FCount) then
    Exit;
  Item := FList^[Index1];
  FList^[Index1] := FList^[Index2];
  FList^[Index2] := Item;
end;

function TList.Expand: TList;
begin
  if FCount = FCapacity then
    Grow;
  Result := Self;
end;

function TList.First: Pointer;
begin
  Result := Get(0);
end;

function TList.Get(Index: Integer): Pointer;
begin
  Result := nil;
  if (Index < 0) or (Index >= FCount) then
    Exit;
  Result := FList^[Index];
end;

procedure TList.Grow;
var
  Delta: Integer;
begin
  if FCapacity > 64 then
    Delta := FCapacity div 4
  else
    if FCapacity > 8 then
      Delta := 16
    else
      Delta := 4;
  SetCapacity(FCapacity + Delta);
end;

function TList.IndexOf(Item: Pointer): Integer;
begin
  Result := 0;
  while (Result < FCount) and (FList^[Result] <> Item) do
    Inc(Result);
  if Result = FCount then
    Result := -1;
end;

procedure TList.Insert(Index: Integer; Item: Pointer);
begin
  if (Index < 0) or (Index > FCount) then
    Exit;
  if FCount = FCapacity then
    Grow;
  if Index < FCount then
    System.Move(FList^[Index], FList^[Index + 1],
      (FCount - Index) * SizeOf(Pointer));
  FList^[Index] := Item;
  Inc(FCount);
  if Item <> nil then
    Notify(Item, lnAdded);
end;

function TList.Last: Pointer;
begin
  Result := Get(FCount - 1);
end;

procedure TList.Move(CurIndex, NewIndex: Integer);
var
  Item: Pointer;
begin
  if CurIndex <> NewIndex then
  begin
    if (NewIndex < 0) or (NewIndex >= FCount) then
      Exit;
    Item := Get(CurIndex);
    FList^[CurIndex] := nil;
    Delete(CurIndex);
    Insert(NewIndex, nil);
    FList^[NewIndex] := Item;
  end;
end;

procedure TList.Put(Index: Integer; Item: Pointer);
var
  Temp: Pointer;
begin
  if (Index < 0) or (Index >= FCount) then
    Exit;
  if Item <> FList^[Index] then
  begin
    Temp := FList^[Index];
    FList^[Index] := Item;
    if Temp <> nil then
      Notify(Temp, lnDeleted);
    if Item <> nil then
      Notify(Item, lnAdded);
  end;
end;

function TList.Remove(Item: Pointer): Integer;
begin
  Result := IndexOf(Item);
  if Result >= 0 then
    Delete(Result);
end;

procedure TList.Pack;
var
  I: Integer;
begin
  for I := FCount - 1 downto 0 do
    if Items[I] = nil then
      Delete(I);
end;

procedure TList.SetCapacity(NewCapacity: Integer);
begin
  if (NewCapacity < FCount) or (NewCapacity > MaxListSize) then
    Exit;
  if NewCapacity <> FCapacity then
  begin
    ReallocMem(FList, NewCapacity * SizeOf(Pointer));
    FCapacity := NewCapacity;
  end;
end;

procedure TList.SetCount(NewCount: Integer);
var
  I: Integer;
begin
  if (NewCount < 0) or (NewCount > MaxListSize) then
    Exit;
  if NewCount > FCapacity then
    SetCapacity(NewCount);
  if NewCount > FCount then
    FillChar(FList^[FCount], (NewCount - FCount) * SizeOf(Pointer), 0)
  else
    for I := FCount - 1 downto NewCount do
      Delete(I);
  FCount := NewCount;
end;

procedure QuickSort(SortList: PPointerList; L, R: Integer;
  SCompare: TListSortCompare);
var
  I, J: Integer;
  P, T: Pointer;
begin
  repeat
    I := L;
    J := R;
    P := SortList^[(L + R) shr 1];
    repeat
      while SCompare(SortList^[I], P) < 0 do
        Inc(I);
      while SCompare(SortList^[J], P) > 0 do
        Dec(J);
      if I <= J then
      begin
        T := SortList^[I];
        SortList^[I] := SortList^[J];
        SortList^[J] := T;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then
      QuickSort(SortList, L, J, SCompare);
    L := I;
  until I >= R;
end;

procedure TList.Sort(Compare: TListSortCompare);
begin
  if (FList <> nil) and (Count > 0) then
    QuickSort(FList, 0, Count - 1, Compare);
end;

function TList.Extract(Item: Pointer): Pointer;
var
  I: Integer;
begin
  Result := nil;
  I := IndexOf(Item);
  if I >= 0 then
  begin
    Result := Item;
    FList^[I] := nil;
    Delete(I);
    Notify(Result, lnExtracted);
  end;
end;

procedure TList.Notify(Ptr: Pointer; Action: TListNotification);
begin
  //nothing
end;

procedure TList.Assign(ListA: TList; AOperator: TListAssignOp; ListB: TList);
var
  I: Integer;
  LTemp, LSource: TList;
begin
  if ListB <> nil then
  begin
    LSource := ListB;
    Assign(ListA);
  end
  else
    LSource := ListA;

  case AOperator of

    laCopy:
      begin
        Clear;
        Capacity := LSource.Capacity;
        for I := 0 to LSource.Count - 1 do
          Add(LSource[I]);
      end;

    laAnd:
      for I := Count - 1 downto 0 do
        if LSource.IndexOf(Items[I]) = -1 then
          Delete(I);

    laOr:
      for I := 0 to LSource.Count - 1 do
        if IndexOf(LSource[I]) = -1 then
          Add(LSource[I]);

    laXor:
      begin
        LTemp := TList.Create;
        try
          LTemp.Capacity := LSource.Count;
          for I := 0 to LSource.Count - 1 do
            if IndexOf(LSource[I]) = -1 then
              LTemp.Add(LSource[I]);
          for I := Count - 1 downto 0 do
            if LSource.IndexOf(Items[I]) <> -1 then
              Delete(I);
          I := Count + LTemp.Count;
          if Capacity < I then
            Capacity := I;
          for I := 0 to LTemp.Count - 1 do
            Add(LTemp[I]);
        finally
          LTemp.Free;
        end;
      end;

    laSrcUnique:
      for I := Count - 1 downto 0 do
        if LSource.IndexOf(Items[I]) <> -1 then
          Delete(I);

    laDestUnique:
      begin
        LTemp := TList.Create;
        try
          LTemp.Capacity := LSource.Count;
          for I := LSource.Count - 1 downto 0 do
            if IndexOf(LSource[I]) = -1 then
              LTemp.Add(LSource[I]);
          Assign(LTemp);
        finally
          LTemp.Free;
        end;
      end;
  end;
end;

{ TThread }

type
  TSyncProc = record
    Thread: TThread;
    Signal: THandle;
  end;
  PSyncProc = ^TSyncProc;

var
  ProcPosted: Boolean;
  SyncList: TList = nil;
  ThreadLock: TRTLCriticalSection;
  ThreadCount: Integer;
  WakeMainThread: TNotifyEvent = nil;

procedure AddThread;
begin
  EnterCriticalSection(ThreadLock);
  try
    if (ThreadCount = 0) and (SyncList = nil) then
      SyncList := TList.Create;
    Inc(ThreadCount);
  finally
    LeaveCriticalSection(ThreadLock);
  end;
end;

procedure RemoveThread;
begin
  EnterCriticalSection(ThreadLock);
  try
    Dec(ThreadCount);
  finally
    LeaveCriticalSection(ThreadLock);
  end;
end;

function CheckSynchronize: Boolean;
var
  SyncProc: PSyncProc;
begin
  Result := False;
  if GetCurrentThreadID <> MainThreadID then
    Exit;
  if ProcPosted then
  begin
    EnterCriticalSection(ThreadLock);
    try
      Result := (SyncList <> nil) and (SyncList.Count > 0);
      if Result then
      begin
        while SyncList.Count > 0 do
        begin
          SyncProc := SyncList[0];
          SyncList.Delete(0);
          try
            SyncProc.Thread.FMethod;
          except
            SyncProc.Thread.FSynchronizeException := AcquireExceptionObject;
          end;
          SetEvent(SyncProc.signal);
        end;
        ProcPosted := False;
      end;
    finally
      LeaveCriticalSection(ThreadLock);
    end;
  end else Result := False;
end;

function ThreadProc(Thread: TThread): Integer;
var
  FreeThread: Boolean;
begin
  try
    if not Thread.Terminated then
    try
      Thread.Execute;
    except
      Thread.FFatalException := AcquireExceptionObject;
    end;
  finally
    FreeThread := Thread.FFreeOnTerminate;
    Result := Thread.FReturnValue;
    Thread.FFinished := True;
    Thread.DoTerminate;
    if FreeThread then Thread.Free;
    EndThread(Result);
  end;
end;

constructor TThread.Create(CreateSuspended: Boolean);
begin
  inherited Create;
  AddThread;
  FSuspended := CreateSuspended;
  FCreateSuspended := CreateSuspended;
  FHandle := BeginThread(nil, 0, @ThreadProc, Pointer(Self), CREATE_SUSPENDED, FThreadID);
end;

destructor TThread.Destroy;
begin
  if (FThreadID <> 0) and not FFinished then
  begin
    Terminate;
    if FCreateSuspended then
      Resume;
    WaitFor;
  end;
  if FHandle <> 0 then CloseHandle(FHandle);
  inherited Destroy;
  FFatalException.Free;
  RemoveThread;
end;

procedure TThread.AfterConstruction;
begin
  if not FCreateSuspended then
    Resume;
end;

procedure TThread.CheckThreadError(ErrCode: Integer);
begin
end;

procedure TThread.CheckThreadError(Success: Boolean);
begin
  if not Success then
    CheckThreadError(GetLastError);
end;

procedure TThread.CallOnTerminate;
begin
  if Assigned(FOnTerminate) then FOnTerminate(Self);
end;

procedure TThread.DoTerminate;
begin
  if Assigned(FOnTerminate) then Synchronize(CallOnTerminate);
end;

const
  Priorities: array [TThreadPriority] of Integer =
   (THREAD_PRIORITY_IDLE, THREAD_PRIORITY_LOWEST, THREAD_PRIORITY_BELOW_NORMAL,
    THREAD_PRIORITY_NORMAL, THREAD_PRIORITY_ABOVE_NORMAL,
    THREAD_PRIORITY_HIGHEST, THREAD_PRIORITY_TIME_CRITICAL);

function TThread.GetPriority: TThreadPriority;
var
  P: Integer;
  I: TThreadPriority;
begin
  P := GetThreadPriority(FHandle);
  CheckThreadError(P <> THREAD_PRIORITY_ERROR_RETURN);
  Result := tpNormal;
  for I := Low(TThreadPriority) to High(TThreadPriority) do
    if Priorities[I] = P then Result := I;
end;

procedure TThread.SetPriority(Value: TThreadPriority);
begin
  CheckThreadError(SetThreadPriority(FHandle, Priorities[Value]));
end;

procedure TThread.Synchronize(Method: TThreadMethod);
var
  SyncProc: TSyncProc;
begin
  SyncProc.Signal := CreateEvent(nil, True, False, nil);
  try
    EnterCriticalSection(ThreadLock);
    try
      FSynchronizeException := nil;
      FMethod := Method;
      SyncProc.Thread := Self;
      SyncList.Add(@SyncProc);
      ProcPosted := True;
      if Assigned(WakeMainThread) then
        WakeMainThread(Self);
      LeaveCriticalSection(ThreadLock);
      try
        WaitForSingleObject(SyncProc.Signal, INFINITE);
      finally
        EnterCriticalSection(ThreadLock);
      end;
    finally
      LeaveCriticalSection(ThreadLock);
    end;
  finally
    CloseHandle(SyncProc.Signal);
  end;
  if Assigned(FSynchronizeException) then raise FSynchronizeException;
end;

procedure TThread.SetSuspended(Value: Boolean);
begin
  if Value <> FSuspended then
    if Value then
      Suspend else
      Resume;
end;

procedure TThread.Suspend;
begin
  FSuspended := True;
  CheckThreadError(Integer(SuspendThread(FHandle)) >= 0);
end;

procedure TThread.Resume;
var
  SuspendCount: Integer;
begin
  SuspendCount := ResumeThread(FHandle);
  CheckThreadError(SuspendCount >= 0);
  if SuspendCount = 1 then
    FSuspended := False;
end;

procedure TThread.Terminate;
begin
  FTerminated := True;
end;

function TThread.WaitFor: LongWord;
var
  H: THandle;
  WaitResult: Cardinal;
  Msg: TMsg;
begin
  H := FHandle;
  if GetCurrentThreadID = MainThreadID then
  begin
    WaitResult := 0;
    repeat
      if WaitResult = WAIT_OBJECT_0 + 1 then
        PeekMessage(Msg, 0, 0, 0, PM_NOREMOVE);
      Sleep(0);
      CheckSynchronize;
      WaitResult := MsgWaitForMultipleObjects(1, H, False, 0, QS_SENDMESSAGE);
    until WaitResult = WAIT_OBJECT_0;
  end else WaitForSingleObject(H, INFINITE);
  CheckThreadError(GetExitCodeThread(H, Result));
end;

{ TStream }

function TStream.GetPosition: Int64;
begin
  Result := Seek(0, soCurrent);
end;

procedure TStream.SetPosition(const Pos: Int64);
begin
  Seek(Pos, soBeginning);
end;

function TStream.GetSize: Int64;
var
  Pos: Int64;
begin
  Pos := Seek(0, soCurrent);
  Result := Seek(0, soEnd);
  Seek(Pos, soBeginning);
end;

procedure TStream.SetSize(NewSize: Longint);
begin
  //nothing
end;

procedure TStream.SetSize64(const NewSize: Int64);
begin
  SetSize(NewSize);
end;

procedure TStream.SetSize(const NewSize: Int64);
begin
  if (NewSize < Low(Longint)) or (NewSize > High(Longint)) then
    Exit;
  SetSize(Longint(NewSize));
end;

function TStream.Seek(Offset: Longint; Origin: Word): Longint;

  procedure RaiseException;
  begin
    Exit;
  end;

type
  TSeek64 = function (const Offset: Int64; Origin: TSeekOrigin): Int64 of object;
var
  Impl: TSeek64;
  Base: TSeek64;
  ClassTStream: TClass;
begin
  Impl := Seek;
  ClassTStream := Self.ClassType;
  while (ClassTStream <> nil) and (ClassTStream <> TStream) do
    ClassTStream := ClassTStream.ClassParent;
  if ClassTStream = nil then RaiseException;
  Base := TStream(@ClassTStream).Seek;
  if TMethod(Impl).Code = TMethod(Base).Code then
    RaiseException;
  Result := Seek(Int64(Offset), TSeekOrigin(Origin));
end;

function TStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  Result := 0;
  if (Offset < Low(Longint)) or (Offset > High(Longint)) then
    Exit;
  Result := Seek(Longint(Offset), Ord(Origin));
end;

procedure TStream.ReadBuffer(var Buffer; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    Exit;
end;

procedure TStream.WriteBuffer(const Buffer; Count: Longint);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    Exit;
end;

function TStream.CopyFrom(Source: TStream; Count: Int64): Int64;
const
  MaxBufSize = $F000;
var
  BufSize, N: Integer;
  Buffer: PChar;
begin
  if Count = 0 then
  begin
    Source.Position := 0;
    Count := Source.Size;
  end;
  Result := Count;
  if Count > MaxBufSize then BufSize := MaxBufSize else BufSize := Count;
  GetMem(Buffer, BufSize);
  try
    while Count <> 0 do
    begin
      if Count > BufSize then N := BufSize else N := Count;
      Source.ReadBuffer(Buffer^, N);
      WriteBuffer(Buffer^, N);
      Dec(Count, N);
    end;
  finally
    FreeMem(Buffer, BufSize);
  end;
end;

procedure FreeAndNil(var Obj);
var
  Temp: TObject;
begin
  Temp := TObject(Obj);
  Pointer(Obj) := nil;
  Temp.Free;
end;

function StdWndProc(Window: HWND; Message, WParam: Longint;
  LParam: Longint): Longint; stdcall; assembler;
asm
        XOR     EAX,EAX
        PUSH    EAX
        PUSH    LParam
        PUSH    WParam
        PUSH    Message
        MOV     EDX,ESP
        MOV     EAX,[ECX].Longint[4]
        CALL    [ECX].Pointer
        ADD     ESP,12
        POP     EAX
end;

function CalcJmpOffset(Src, Dest: Pointer): Longint;
begin
  Result := Longint(Dest) - (Longint(Src) + 5);
end;

function MakeObjectInstance(Method: TWndMethod): Pointer;
const
  BlockCode: array[1..2] of Byte = (
    $59,       { POP ECX }
    $E9);      { JMP StdWndProc }
  PageSize = 4096;
var
  Block: PInstanceBlock;
  Instance: PObjectInstance;
begin
  if InstFreeList = nil then
  begin
    Block := VirtualAlloc(nil, PageSize, MEM_COMMIT, PAGE_EXECUTE_READWRITE);
    Block^.Next := InstBlockList;
    Move(BlockCode, Block^.Code, SizeOf(BlockCode));
    Block^.WndProcPtr := Pointer(CalcJmpOffset(@Block^.Code[2], @StdWndProc));
    Instance := @Block^.Instances;
    repeat
      Instance^.Code := $E8;
      Instance^.Offset := CalcJmpOffset(Instance, @Block^.Code);
      Instance^.Next := InstFreeList;
      InstFreeList := Instance;
      Inc(Longint(Instance), SizeOf(TObjectInstance));
    until Longint(Instance) - Longint(Block) >= SizeOf(TInstanceBlock);
    InstBlockList := Block;
  end;
  Result := InstFreeList;
  Instance := InstFreeList;
  InstFreeList := Instance^.Next;
  Instance^.Method := Method;
end;

procedure FreeObjectInstance(ObjectInstance: Pointer);
begin
  if ObjectInstance <> nil then
  begin
    PObjectInstance(ObjectInstance)^.Next := InstFreeList;
    InstFreeList := ObjectInstance;
  end;
end;

function AllocateHWnd(Method: TWndMethod): HWND;
var
  TempClass: TWndClass;
  ClassRegistered: Boolean;
begin
  UtilWindowClass.hInstance := HInstance;
{$IFDEF PIC}
  UtilWindowClass.lpfnWndProc := @DefWindowProc;
{$ENDIF}
  ClassRegistered := GetClassInfo(HInstance, UtilWindowClass.lpszClassName,
    TempClass);
  if not ClassRegistered or (TempClass.lpfnWndProc <> @DefWindowProc) then
  begin
    if ClassRegistered then
      Windows.UnregisterClass(UtilWindowClass.lpszClassName, HInstance);
    Windows.RegisterClass(UtilWindowClass);
  end;
  Result := CreateWindowEx(WS_EX_TOOLWINDOW, UtilWindowClass.lpszClassName,
    '', WS_POPUP {!0}, 0, 0, 0, 0, 0, 0, HInstance, nil);
  if Assigned(Method) then
    SetWindowLong(Result, GWL_WNDPROC, Longint(MakeObjectInstance(Method)));
end;

procedure DeallocateHWnd(Wnd: HWND);
var
  Instance: Pointer;
begin
  Instance := Pointer(GetWindowLong(Wnd, GWL_WNDPROC));
  DestroyWindow(Wnd);
  if Instance <> @DefWindowProc then FreeObjectInstance(Instance);
end;

function AllocMem(Size: Cardinal): Pointer;
begin
  GetMem(Result, Size);
  FillChar(Result^, Size, 0);
end;

function SetErrorProc(ErrorProc: TSocketErrorProc): TSocketErrorProc;
begin
  Result := SocketErrorProc;
  SocketErrorProc := ErrorProc;
end;

function CheckSocketResult(ResultCode: Integer; const Op: string): Integer;
begin
  if ResultCode <> 0 then
  begin
    Result := WSAGetLastError;
    if Result <> WSAEWOULDBLOCK then
      if Assigned(SocketErrorProc) then
        SocketErrorProc(Result)
  end else Result := 0;
end;

procedure Startup;
begin
  WSAStartup($0101, WSAData);
end;

procedure Cleanup;
begin
  WSACleanup;
end;

{ TCustomWinSocket }

constructor TCustomWinSocket.Create(ASocket: TSocket);
begin
  inherited Create;
  Startup;
  FSocketLock := TCriticalSection.Create;
  FASyncStyles := [asRead, asWrite, asConnect, asClose];
  FSocket := ASocket;
  FAddr.sin_family := PF_INET;
  FAddr.sin_addr.s_addr := INADDR_ANY;
  FAddr.sin_port := 0;
  FConnected := FSocket <> INVALID_SOCKET;
end;

destructor TCustomWinSocket.Destroy;
begin
  FOnSocketEvent := nil;  { a p h e x  w a s  h e r e  ; ) }
  if FConnected and (FSocket <> INVALID_SOCKET) then
    Disconnect(FSocket);
  if FHandle <> 0 then DeallocateHWnd(FHandle);
  FSocketLock.Free;
  Cleanup;
  FreeMem(FGetHostData);
  FGetHostData := nil;
  inherited Destroy;
end;

procedure TCustomWinSocket.Accept(Socket: TSocket);
begin
end;

procedure TCustomWinSocket.AsyncInitSocket(const Name, Address,
  Service: string; Port: Word; QueueSize: Integer; Client: Boolean);
var
  ErrorCode: Integer;
begin
  try
    case FLookupState of
      lsIdle:
        begin
          if not Client then
          begin
            FLookupState := lsLookupAddress;
            FAddr.sin_addr.S_addr := INADDR_ANY;
          end else if Name <> '' then
          begin
            if FGetHostData = nil then
              FGetHostData := AllocMem(MAXGETHOSTSTRUCT);
            FLookupHandle := WSAAsyncGetHostByName(Handle, CM_LOOKUPCOMPLETE,
              PChar(Name), FGetHostData, MAXGETHOSTSTRUCT);
            CheckSocketResult(Ord(FLookupHandle = 0), 'WSAASyncGetHostByName');
            FService := Service;
            FPort := Port;
            FQueueSize := QueueSize;
            FClient := Client;
            FLookupState := lsLookupAddress;
            Exit;
          end else if Address <> '' then
          begin
            FLookupState := lsLookupAddress;
            FAddr.sin_addr.S_addr := inet_addr(PChar(Address));
          end else
          begin
            ErrorCode := 1110;
            Error(Self, eeLookup, ErrorCode);
            Disconnect(FSocket);
            Exit;
          end;
        end;
      lsLookupAddress:
        begin
          if Service <> '' then
          begin
            if FGetHostData = nil then
              FGetHostData := AllocMem(MAXGETHOSTSTRUCT);
            FLookupHandle := WSAASyncGetServByName(Handle, CM_LOOKUPCOMPLETE,
              PChar(Service), 'tcp' , FGetHostData, MAXGETHOSTSTRUCT);
            CheckSocketResult(Ord(FLookupHandle = 0), 'WSAASyncGetServByName');
            FLookupState := lsLookupService;
            Exit;
          end else
          begin
            FLookupState := lsLookupService;
            FAddr.sin_port := htons(Port);
          end;
        end;
      lsLookupService:
        begin
          FLookupState := lsIdle;
          if Client then
            DoOpen
          else DoListen(QueueSize);
        end;
    end;
    if FLookupState <> lsIdle then
      ASyncInitSocket(Name, Address, Service, Port, QueueSize, Client);
  except
    Disconnect(FSocket);
    raise;
  end;
end;

procedure TCustomWinSocket.Close;
begin
  Disconnect(FSocket);
end;

procedure TCustomWinSocket.Connect(Socket: TSocket);
begin
end;

procedure TCustomWinSocket.Lock;
begin
  FSocketLock.Enter;
end;

procedure TCustomWinSocket.Unlock;
begin
  FSocketLock.Leave;
end;

procedure TCustomWinSocket.CMSocketMessage(var Message: TCMSocketMessage);

  function CheckError: Boolean;
  var
    ErrorEvent: TErrorEvent;
    ErrorCode: Integer;
  begin
    if Message.SelectError <> 0 then
    begin
      Result := False;
      ErrorCode := Message.SelectError;
      case Message.SelectEvent of
        FD_CONNECT: ErrorEvent := eeConnect;
        FD_CLOSE: ErrorEvent := eeDisconnect;
        FD_READ: ErrorEvent := eeReceive;
        FD_WRITE: ErrorEvent := eeSend;
        FD_ACCEPT: ErrorEvent := eeAccept;
      else
        ErrorEvent := eeGeneral;
      end;
      Error(Self, ErrorEvent, ErrorCode);
    end else Result := True;
  end;

begin
  with Message do
    if CheckError then
      case SelectEvent of
        FD_CONNECT: Connect(Socket);
        FD_CLOSE: Disconnect(Socket);
        FD_READ: Read(Socket);
        FD_WRITE: Write(Socket);
        FD_ACCEPT: Accept(Socket);
      end;
end;

procedure TCustomWinSocket.CMDeferFree(var Message);
begin
  Free;
end;

procedure TCustomWinSocket.DeferFree;
begin
  if FHandle <> 0 then PostMessage(FHandle, CM_DEFERFREE, 0, 0);
end;

procedure TCustomWinSocket.DoSetAsyncStyles;
var
  Msg: Integer;
  Wnd: HWnd;
  Blocking: Longint;
begin
  Msg := 0;
  Wnd := 0;
  if FAsyncStyles <> [] then
  begin
    Msg := CM_SOCKETMESSAGE;
    Wnd := Handle;
  end;
  WSAAsyncSelect(FSocket, Wnd, Msg, Longint(Byte(FAsyncStyles)));
  if FASyncStyles = [] then
  begin
    Blocking := 0;
    ioctlsocket(FSocket, FIONBIO, Blocking);
  end;
end;

procedure TCustomWinSocket.DoListen(QueueSize: Integer);
begin
  CheckSocketResult(bind(FSocket, FAddr, SizeOf(FAddr)), 'bind');
  DoSetASyncStyles;
  if QueueSize > SOMAXCONN then QueueSize := SOMAXCONN;
  Event(Self, seListen);
  CheckSocketResult(Winsock.listen(FSocket, QueueSize), 'listen');
  FLookupState := lsIdle;
  FConnected := True;
end;

procedure TCustomWinSocket.DoOpen;
begin
  DoSetASyncStyles;
  Event(Self, seConnecting);
  CheckSocketResult(WinSock.connect(FSocket, FAddr, SizeOf(FAddr)), 'connect');
  FLookupState := lsIdle;
  if not (asConnect in FAsyncStyles) then
  begin
    FConnected := FSocket <> INVALID_SOCKET;
    Event(Self, seConnect);
  end;
end;

function TCustomWinSocket.GetHandle: HWnd;
begin
  if FHandle = 0 then
    FHandle := AllocateHwnd(WndProc);
  Result := FHandle;
end;

function TCustomWinSocket.GetLocalAddress: string;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Lock;
  try
    Result := '';
    if FSocket = INVALID_SOCKET then Exit;
    Size := SizeOf(SockAddrIn);
    if getsockname(FSocket, SockAddrIn, Size) = 0 then
      Result := inet_ntoa(SockAddrIn.sin_addr);
  finally
    Unlock;
  end;
end;

function TCustomWinSocket.GetLocalHost: string;
var
  LocalName: array[0..255] of Char;
begin
  Lock;
  try
    Result := '';
    if FSocket = INVALID_SOCKET then Exit;
    if gethostname(LocalName, SizeOf(LocalName)) = 0 then
      Result := LocalName;
  finally
    Unlock;
  end;
end;

function TCustomWinSocket.GetLocalPort: Integer;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Lock;
  try
    Result := -1;
    if FSocket = INVALID_SOCKET then Exit;
    Size := SizeOf(SockAddrIn);
    if getsockname(FSocket, SockAddrIn, Size) = 0 then
      Result := ntohs(SockAddrIn.sin_port);
  finally
    Unlock;
  end;
end;

function TCustomWinSocket.GetRemoteHost: string;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
  HostEnt: PHostEnt;
begin
  Lock;
  try
    Result := '';
    if not FConnected then Exit;
    Size := SizeOf(SockAddrIn);
    CheckSocketResult(getpeername(FSocket, SockAddrIn, Size), 'getpeername');
    HostEnt := gethostbyaddr(@SockAddrIn.sin_addr.s_addr, 4, PF_INET);
    if HostEnt <> nil then Result := HostEnt.h_name;
  finally
    Unlock;
  end;
end;

function TCustomWinSocket.GetRemoteAddress: string;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Lock;
  try
    Result := '';
    if not FConnected then Exit;
    Size := SizeOf(SockAddrIn);
    CheckSocketResult(getpeername(FSocket, SockAddrIn, Size), 'getpeername');
    Result := inet_ntoa(SockAddrIn.sin_addr);
  finally
    Unlock;
  end;
end;

function TCustomWinSocket.GetRemotePort: Integer;
var
  SockAddrIn: TSockAddrIn;
  Size: Integer;
begin
  Lock;
  try
    Result := 0;
    if not FConnected then Exit;
    Size := SizeOf(SockAddrIn);
    CheckSocketResult(getpeername(FSocket, SockAddrIn, Size), 'getpeername');
    Result := ntohs(SockAddrIn.sin_port);
  finally
    Unlock;
  end;
end;

function TCustomWinSocket.GetRemoteAddr: TSockAddrIn;
var
  Size: Integer;
begin
  Lock;
  try
    FillChar(Result, SizeOf(Result), 0);
    if not FConnected then Exit;
    Size := SizeOf(Result);
    if getpeername(FSocket, Result, Size) <> 0 then
      FillChar(Result, SizeOf(Result), 0);
  finally
    Unlock;
  end;
end;

function TCustomWinSocket.LookupName(const Name: string): TInAddr;
var
  HostEnt: PHostEnt;
  InAddr: TInAddr;
begin
  HostEnt := gethostbyname(PChar(Name));
  FillChar(InAddr, SizeOf(InAddr), 0);
  if HostEnt <> nil then
  begin
    with InAddr, HostEnt^ do
    begin
      S_un_b.s_b1 := h_addr^[0];
      S_un_b.s_b2 := h_addr^[1];
      S_un_b.s_b3 := h_addr^[2];
      S_un_b.s_b4 := h_addr^[3];
    end;
  end;
  Result := InAddr;
end;

function TCustomWinSocket.LookupService(const Service: string): Integer;
var
  ServEnt: PServEnt;
begin
  ServEnt := getservbyname(PChar(Service), 'tcp');
  if ServEnt <> nil then
    Result := ntohs(ServEnt.s_port)
  else Result := 0;
end;

function TCustomWinSocket.InitSocket(const Name, Address, Service: string; Port: Word;
  Client: Boolean): TSockAddrIn;
begin
  Result.sin_family := PF_INET;
  if Name <> '' then
    Result.sin_addr := LookupName(name)
  else if Address <> '' then
    Result.sin_addr.s_addr := inet_addr(PChar(Address))
  else if not Client then
    Result.sin_addr.s_addr := INADDR_ANY
  else Exit;
  if Service <> '' then
    Result.sin_port := htons(LookupService(Service))
  else
    Result.sin_port := htons(Port);
end;

procedure TCustomWinSocket.Listen(const Name, Address, Service: string; Port: Word;
  QueueSize: Integer; Block: Boolean);
begin
  if FConnected then Exit;
  FSocket := socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
  if FSocket = INVALID_SOCKET then Exit;
  try
    Event(Self, seLookUp);
    if Block then
    begin
      FAddr := InitSocket(Name, Address, Service, Port, False);
      DoListen(QueueSize);
    end else
      AsyncInitSocket(Name, Address, Service, Port, QueueSize, False);
  except
    Disconnect(FSocket);
    raise;
  end;
end;

procedure TCustomWinSocket.Open(const Name, Address, Service: string; Port: Word; Block: Boolean);
begin
  if FConnected then Exit;
  FSocket := socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
  if FSocket = INVALID_SOCKET then Exit;
  try
    Event(Self, seLookUp);
    if Block then
    begin
      FAddr := InitSocket(Name, Address, Service, Port, True);
      DoOpen;
    end else
      AsyncInitSocket(Name, Address, Service, Port, 0, True);
  except
    Disconnect(FSocket);
    raise;
  end;
end;

procedure TCustomWinSocket.Disconnect(Socket: TSocket);
begin
  Lock;
  try
    if FLookupHandle <> 0 then
      CheckSocketResult(WSACancelASyncRequest(FLookupHandle), 'WSACancelASyncRequest');
    FLookupHandle := 0;
    if (Socket = INVALID_SOCKET) or (Socket <> FSocket) then exit;
    Event(Self, seDisconnect);
    CheckSocketResult(closesocket(FSocket), 'closesocket');
    FSocket := INVALID_SOCKET;
    FAddr.sin_family := PF_INET;
    FAddr.sin_addr.s_addr := INADDR_ANY;
    FAddr.sin_port := 0;
    FConnected := False;
    FreeAndNil(FSendStream);
  finally
    Unlock;
  end;
end;

procedure TCustomWinSocket.DefaultHandler(var Message);
begin
  with TMessage(Message) do
    if FHandle <> 0 then
      Result := CallWindowProc(@DefWindowProc, FHandle, Msg, wParam, lParam);
end;

procedure TCustomWinSocket.Event(Socket: TCustomWinSocket; SocketEvent: TSocketEvent);
begin
  if Assigned(FOnSocketEvent) then FOnSocketEvent(Self, Socket, SocketEvent);
end;

procedure TCustomWinSocket.Error(Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  if Assigned(FOnErrorEvent) then FOnErrorEvent(Self, Socket, ErrorEvent, ErrorCode);
end;

function TCustomWinSocket.SendText(const s: string): Integer;
begin
  Result := SendBuf(Pointer(S)^, Length(S));
end;

function TCustomWinSocket.SendStreamPiece: Boolean;
var
  Buffer: array[0..4095] of Byte;
  StartPos: Integer;
  AmountInBuf: Integer;
  AmountSent: Integer;
  ErrorCode: Integer;

  procedure DropStream;
  begin
    if FDropAfterSend then Disconnect(FSocket);
    FDropAfterSend := False;
    FSendStream.Free;
    FSendStream := nil;
    if FData <> nil then TStreamRecord(FData).SendProgressBar.Free;
    if FData <> nil then TStreamRecord(FData).SendProgressBar := nil;
    if FData <> nil then TStreamRecord(FData).SendStreamListItem.Delete;
    if FData <> nil then TStreamRecord(FData).SendStreamListItem := nil;
  end;

begin
  Lock;
  try
    Result := False;
    if FSendStream <> nil then
    begin
      if (FSocket = INVALID_SOCKET) or (not FConnected) then exit;
      while True do
      begin
        StartPos := FSendStream.Position;
        AmountInBuf := FSendStream.Read(Buffer, SizeOf(Buffer));
        if AmountInBuf > 0 then
        begin
          AmountSent := send(FSocket, Buffer, AmountInBuf, 0);
          if AmountSent = SOCKET_ERROR then
          begin
            ErrorCode := WSAGetLastError;
            if ErrorCode <> WSAEWOULDBLOCK then
            begin
              Error(Self, eeSend, ErrorCode);
              Disconnect(FSocket);
              DropStream;
              if FAsyncStyles <> [] then Exit;
              Break;
            end else
            begin
              FSendStream.Position := StartPos;
              if FData <> nil then TStreamRecord(FData).SendProgressBar.Position := ((FSendStream.Size * 100) div FSendStream.Position);
              if FData <> nil then TStreamRecord(FData).SendProgressBar.Repaint;
              Application.ProcessMessages;
              Break;
            end;
          end
          else if AmountInBuf > AmountSent then
          begin
            FSendStream.Position := StartPos + AmountSent;
            if FData <> nil then TStreamRecord(FData).SendProgressBar.Position := ((FSendStream.Size * 100) div FSendStream.Position);
            if FData <> nil then TStreamRecord(FData).SendProgressBar.Repaint;
            Application.ProcessMessages;
          end
          else if FSendStream.Position = FSendStream.Size then
          begin
            if FData <> nil then TStreamRecord(FData).SendProgressBar.Position := ((FSendStream.Size * 100) div FSendStream.Position);
            if FData <> nil then TStreamRecord(FData).SendProgressBar.Repaint;
            Application.ProcessMessages;
            DropStream;
            Break;
          end;
        end else
        begin
          DropStream;
          Break;
        end;
      end;
      Result := True;
    end;
  finally
    Unlock;
  end;
end;

function TCustomWinSocket.SendStream(AStream: TStream): Boolean;
begin
  Result := False;
  if FSendStream = nil then
  begin
    FSendStream := AStream;
    Result := SendStreamPiece;
  end;
end;

function TCustomWinSocket.SendStreamThenDrop(AStream: TStream): Boolean;
begin
  FDropAfterSend := True;
  Result := SendStream(AStream);
  if not Result then FDropAfterSend := False;
end;

function TCustomWinSocket.SendBuf(var Buf; Count: Integer): Integer;
var
  ErrorCode: Integer;
begin
  Lock;
  try
    Result := 0;
    if not FConnected then Exit;
    Result := send(FSocket, Buf, Count, 0);
    if Result = SOCKET_ERROR then
    begin
      ErrorCode := WSAGetLastError;
      if (ErrorCode <> WSAEWOULDBLOCK) then
      begin
        Error(Self, eeSend, ErrorCode);
        Disconnect(FSocket);
        if ErrorCode <> 0 then
          Exit;
      end;
    end;
  finally
    Unlock;
  end;
end;

procedure TCustomWinSocket.SetAsyncStyles(Value: TASyncStyles);
begin
  if Value <> FASyncStyles then
  begin
    FASyncStyles := Value;
    if FSocket <> INVALID_SOCKET then
      DoSetAsyncStyles;
  end;
end;

procedure TCustomWinSocket.Read(Socket: TSocket);
begin
  if (FSocket = INVALID_SOCKET) or (Socket <> FSocket) then Exit;
  Event(Self, seRead);
end;

function TCustomWinSocket.ReceiveBuf(var Buf; Count: Integer): Integer;
var
  ErrorCode: Integer;
begin
  Lock;
  try
    Result := 0;
    if (Count = -1) and FConnected then
      ioctlsocket(FSocket, FIONREAD, Longint(Result))
    else begin
      if not FConnected then Exit;
      Result := recv(FSocket, Buf, Count, 0);
      if Result = SOCKET_ERROR then
      begin
        ErrorCode := WSAGetLastError;
        if ErrorCode <> WSAEWOULDBLOCK then
        begin
          Error(Self, eeReceive, ErrorCode);
          Disconnect(FSocket);
          if ErrorCode <> 0 then
            Exit;
        end;
      end;
    end;
  finally
    Unlock;
  end;
end;

function TCustomWinSocket.ReceiveLength: Integer;
begin
  Result := ReceiveBuf(Pointer(nil)^, -1);
end;

function TCustomWinSocket.ReceiveText: string;
begin
  SetLength(Result, ReceiveBuf(Pointer(nil)^, -1));
  SetLength(Result, ReceiveBuf(Pointer(Result)^, Length(Result)));
end;

procedure TCustomWinSocket.WndProc(var Message: TMessage);
begin
  try
    Dispatch(Message);
  except
  end;
end;

procedure TCustomWinSocket.Write(Socket: TSocket);
begin
  if (FSocket = INVALID_SOCKET) or (Socket <> FSocket) then Exit;
  if not SendStreamPiece then Event(Self, seWrite);
end;

procedure TCustomWinSocket.CMLookupComplete(var Message: TCMLookupComplete);
var
  ErrorCode: Integer;
begin
  if Message.LookupHandle = FLookupHandle then
  begin
    FLookupHandle := 0;
    if Message.AsyncError <> 0 then
    begin
      ErrorCode := Message.AsyncError;
      Error(Self, eeLookup, ErrorCode);
      Disconnect(FSocket);
      Exit;
    end;
    if FLookupState = lsLookupAddress then
    begin
      FAddr.sin_addr.S_addr := Integer(Pointer(PHostEnt(FGetHostData).h_addr^)^);
      ASyncInitSocket('', '', FService, FPort, FQueueSize, FClient);
    end else if FLookupState = lsLookupService then
    begin
      FAddr.sin_port := PServEnt(FGetHostData).s_port;
      FPort := 0;
      FService := '';
      ASyncInitSocket('', '', '', 0, FQueueSize, FClient);
    end;
  end;
end;

{ TClientWinSocket }

procedure TClientWinSocket.Connect(Socket: TSocket);
begin
  FConnected := True;
  Event(Self, seConnect);
end;

procedure TClientWinSocket.SetClientType(Value: TClientType);
begin
  if Value <> FClientType then
    if not FConnected then
    begin
      FClientType := Value;
      if FClientType = ctBlocking then
        ASyncStyles := []
      else ASyncStyles := [asRead, asWrite, asConnect, asClose];
    end;
end;

{ TServerClientWinsocket }

constructor TServerClientWinSocket.Create(Socket: TSocket; ServerWinSocket: TServerWinSocket);
begin
  FServerWinSocket := ServerWinSocket;
  if Assigned(FServerWinSocket) then
  begin
    FServerWinSocket.AddClient(Self);
    if FServerWinSocket.AsyncStyles <> [] then
    begin
      OnSocketEvent := FServerWinSocket.ClientEvent;
      OnErrorEvent := FServerWinSocket.ClientError;
    end;
  end;
  inherited Create(Socket);
  if FServerWinSocket.ASyncStyles <> [] then DoSetAsyncStyles;
  if FConnected then Event(Self, seConnect);
end;

destructor TServerClientWinSocket.Destroy;
begin
  if Assigned(FServerWinSocket) then
    FServerWinSocket.RemoveClient(Self);
  inherited Destroy;
end;

{ TServerWinSocket }

constructor TServerWinSocket.Create(ASocket: TSocket);
begin
  FConnections := TList.Create;
  FActiveThreads := TList.Create;
  FListLock := TCriticalSection.Create;
  inherited Create(ASocket);
  FAsyncStyles := [asAccept];
end;

destructor TServerWinSocket.Destroy;
begin
  inherited Destroy;
  FConnections.Free;
  FActiveThreads.Free;
  FListLock.Free;
end;

procedure TServerWinSocket.AddClient(AClient: TServerClientWinSocket);
begin
  FListLock.Enter;
  try
    if FConnections.IndexOf(AClient) < 0 then
      FConnections.Add(AClient);
  finally
    FListLock.Leave;
  end;
end;

procedure TServerWinSocket.RemoveClient(AClient: TServerClientWinSocket);
begin
  FListLock.Enter;
  try
    FConnections.Remove(AClient);
  finally
    FListLock.Leave;
  end;
end;

procedure TServerWinSocket.AddThread(AThread: TServerClientThread);
begin
  FListLock.Enter;
  try
    if FActiveThreads.IndexOf(AThread) < 0 then
    begin
      FActiveThreads.Add(AThread);
      if FActiveThreads.Count <= FThreadCacheSize then
        AThread.KeepInCache := True;
    end;
  finally
    FListLock.Leave;
  end;
end;

procedure TServerWinSocket.RemoveThread(AThread: TServerClientThread);
begin
  FListLock.Enter;
  try
    FActiveThreads.Remove(AThread);
  finally
    FListLock.Leave;
  end;
end;

procedure TServerWinSocket.ClientEvent(Sender: TObject; Socket: TCustomWinSocket;
  SocketEvent: TSocketEvent);
begin
  case SocketEvent of
    seAccept,
    seLookup,
    seConnecting,
    seListen:
      begin end;
    seConnect: ClientConnect(Socket);
    seDisconnect: ClientDisconnect(Socket);
    seRead: ClientRead(Socket);
    seWrite: ClientWrite(Socket);
  end;
end;

procedure TServerWinSocket.ClientError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ClientErrorEvent(Socket, ErrorEvent, ErrorCode);
end;

function TServerWinSocket.GetActiveConnections: Integer;
begin
  Result := FConnections.Count;
end;

function TServerWinSocket.GetConnections(Index: Integer): TCustomWinSocket;
begin
  Result := FConnections[Index];
end;

function TServerWinSocket.GetActiveThreads: Integer;
var
  I: Integer;
begin
  FListLock.Enter;
  try
    Result := 0;
    for I := 0 to FActiveThreads.Count - 1 do
      if TServerClientThread(FActiveThreads[I]).ClientSocket <> nil then
        Inc(Result);
  finally
    FListLock.Leave;
  end;
end;

function TServerWinSocket.GetIdleThreads: Integer;
var
  I: Integer;
begin
  FListLock.Enter;
  try
    Result := 0;
    for I := 0 to FActiveThreads.Count - 1 do
      if TServerClientThread(FActiveThreads[I]).ClientSocket = nil then
        Inc(Result);
  finally
    FListLock.Leave;
  end;
end;

procedure TServerWinSocket.Accept(Socket: TSocket);
var
  ClientSocket: TServerClientWinSocket;
  ClientWinSocket: TSocket;
  Addr: TSockAddrIn;
  Len: Integer;
  OldOpenType, NewOpenType: Integer;
begin
  Len := SizeOf(OldOpenType);
  if getsockopt(INVALID_SOCKET, SOL_SOCKET, SO_OPENTYPE, PChar(@OldOpenType),
    Len) = 0 then
  try
    if FServerType = stThreadBlocking then
    begin
      NewOpenType := SO_SYNCHRONOUS_NONALERT;
      setsockopt(INVALID_SOCKET, SOL_SOCKET, SO_OPENTYPE, PChar(@NewOpenType), Len);
    end;
    Len := SizeOf(Addr);
    ClientWinSocket := WinSock.accept(Socket, @Addr, @Len);
    if ClientWinSocket <> INVALID_SOCKET then
    begin
      ClientSocket := GetClientSocket(ClientWinSocket);
      if Assigned(FOnSocketEvent) then
        FOnSocketEvent(Self, ClientSocket, seAccept);
      if FServerType = stThreadBlocking then
      begin
        ClientSocket.ASyncStyles := [];
        GetServerThread(ClientSocket);
      end;
    end;
  finally
    Len := SizeOf(OldOpenType);
    setsockopt(INVALID_SOCKET, SOL_SOCKET, SO_OPENTYPE, PChar(@OldOpenType), Len);
  end;
end;

procedure TServerWinSocket.Disconnect(Socket: TSocket);
var
  SaveCacheSize: Integer;
begin
  Lock;
  try
    SaveCacheSize := ThreadCacheSize;
    try
      ThreadCacheSize := 0;
      while FActiveThreads.Count > 0 do
        with TServerClientThread(FActiveThreads.Last) do
        begin
          FreeOnTerminate := False;
          Terminate;
          FEvent.SetEvent;
          if (ClientSocket <> nil) and ClientSocket.Connected then
            ClientSocket.Close;
          WaitFor;  
          Free;
        end;
      while FConnections.Count > 0 do
        TCustomWinSocket(FConnections.Last).Free;
      if FServerAcceptThread <> nil then
        FServerAcceptThread.Terminate;
      inherited Disconnect(Socket);
      FServerAcceptThread.Free;
      FServerAcceptThread := nil;
    finally
      ThreadCacheSize := SaveCacheSize;
    end;
  finally
    Unlock;
  end;
end;

function TServerWinSocket.DoCreateThread(ClientSocket: TServerClientWinSocket): TServerClientThread;
begin
  Result := TServerClientThread.Create(False, ClientSocket);
end;

procedure TServerWinSocket.Listen(var Name, Address, Service: string; Port: Word;
  QueueSize: Integer);
begin
  inherited Listen(Name, Address, Service, Port, QueueSize, ServerType = stThreadBlocking);
  if FConnected and (ServerType = stThreadBlocking) then
    FServerAcceptThread := TServerAcceptThread.Create(False, Self);
end;

procedure TServerWinSocket.SetServerType(Value: TServerType);
begin
  if Value <> FServerType then
    if not FConnected then
    begin
      FServerType := Value;
      if FServerType = stThreadBlocking then
        ASyncStyles := []
      else ASyncStyles := [asAccept];
    end;
end;

procedure TServerWinSocket.SetThreadCacheSize(Value: Integer);
var
  Start, I: Integer;
begin
  if Value <> FThreadCacheSize then
  begin
    if Value < FThreadCacheSize then
      Start := Value
    else Start := FThreadCacheSize;
    FThreadCacheSize := Value;
    FListLock.Enter;
    try
      for I := 0 to FActiveThreads.Count - 1 do
        with TServerClientThread(FActiveThreads[I]) do
          KeepInCache := I < Start;
    finally
      FListLock.Leave;
    end;
  end;
end;

function TServerWinSocket.GetClientSocket(Socket: TSocket): TServerClientWinSocket;
begin
  Result := nil;
  if Assigned(FOnGetSocket) then FOnGetSocket(Self, Socket, Result);
  if Result = nil then
    Result := TServerClientWinSocket.Create(Socket, Self);
end;

procedure TServerWinSocket.ThreadEnd(AThread: TServerClientThread);
begin
  if Assigned(FOnThreadEnd) then FOnThreadEnd(Self, AThread);
end;

procedure TServerWinSocket.ThreadStart(AThread: TServerClientThread);
begin
  if Assigned(FOnThreadStart) then FOnThreadStart(Self, AThread);
end;

function TServerWinSocket.GetServerThread(ClientSocket: TServerClientWinSocket): TServerClientThread;
var
  I: Integer;
begin
  Result := nil;
  FListLock.Enter;
  try
    for I := 0 to FActiveThreads.Count - 1 do
      if TServerClientThread(FActiveThreads[I]).ClientSocket = nil then
      begin
        Result := FActiveThreads[I];
        Result.ReActivate(ClientSocket);
        Break;
      end;
  finally
    FListLock.Leave;
  end;
  if Result = nil then
  begin
    if Assigned(FOnGetThread) then FOnGetThread(Self, ClientSocket, Result);
    if Result = nil then Result := DoCreateThread(ClientSocket);
  end;
end;

function TServerWinSocket.GetClientThread(ClientSocket: TServerClientWinSocket): TServerClientThread;
var
  I: Integer;
begin
  Result := nil;
  FListLock.Enter;
  try
    for I := 0 to FActiveThreads.Count - 1 do
      if TServerClientThread(FActiveThreads[I]).ClientSocket = ClientSocket then
      begin
        Result := FActiveThreads[I];
        Break;
      end;
  finally
    FListLock.Leave;
  end;
end;

procedure TServerWinSocket.ClientConnect(Socket: TCustomWinSocket);
begin
  if Assigned(FOnClientConnect) then FOnClientConnect(Self, Socket);
end;

procedure TServerWinSocket.ClientDisconnect(Socket: TCustomWinSocket);
begin
  if Assigned(FOnClientDisconnect) then FOnClientDisconnect(Self, Socket);
  if ServerType = stNonBlocking then Socket.DeferFree;
end;

procedure TServerWinSocket.ClientRead(Socket: TCustomWinSocket);
begin
  if Assigned(FOnClientRead) then FOnClientRead(Self, Socket);
end;

procedure TServerWinSocket.ClientWrite(Socket: TCustomWinSocket);
begin
  if Assigned(FOnClientWrite) then FOnClientWrite(Self, Socket);
end;

procedure TServerWinSocket.ClientErrorEvent(Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  if Assigned(FOnClientError) then FOnClientError(Self, Socket, ErrorEvent, ErrorCode);
end;

{ TServerAcceptThread }

constructor TServerAcceptThread.Create(CreateSuspended: Boolean;
  ASocket: TServerWinSocket);
begin
  FServerSocket := ASocket;
  inherited Create(CreateSuspended);
end;

procedure TServerAcceptThread.Execute;
begin
  while not Terminated do
    FServerSocket.Accept(FServerSocket.SocketHandle);
end;

{ TServerClientThread }

constructor TServerClientThread.Create(CreateSuspended: Boolean;
  ASocket: TServerClientWinSocket);
begin
  FreeOnTerminate := True;
  FEvent := TSimpleEvent.Create;
  inherited Create(True);
  Priority := tpHigher;
  ReActivate(ASocket);
  if not CreateSuspended then Resume;
end;

destructor TServerClientThread.Destroy;
begin
  FClientSocket.Free;
  FEvent.Free;
  inherited Destroy;
end;

procedure TServerClientThread.ReActivate(ASocket: TServerClientWinSocket);
begin
  FClientSocket := ASocket;
  if Assigned(FClientSocket) then
  begin
    FServerSocket := FClientSocket.ServerWinSocket;
    FServerSocket.AddThread(Self);
    FClientSocket.OnSocketEvent := HandleEvent;
    FClientSocket.OnErrorEvent := HandleError;
    FEvent.SetEvent;
  end;
end;

procedure TServerClientThread.DoRead;
begin
  ClientSocket.ServerWinSocket.Event(ClientSocket, seRead);
end;

procedure TServerClientThread.DoTerminate;
begin
  inherited DoTerminate;
  if Assigned(FServerSocket) then
    FServerSocket.RemoveThread(Self);
end;

procedure TServerClientThread.DoWrite;
begin
  FServerSocket.Event(ClientSocket, seWrite);
end;

procedure TServerClientThread.HandleEvent(Sender: TObject; Socket: TCustomWinSocket;
  SocketEvent: TSocketEvent);
begin
  Event(SocketEvent);
end;

procedure TServerClientThread.HandleError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  Error(ErrorEvent, ErrorCode);
end;

procedure TServerClientThread.Event(SocketEvent: TSocketEvent);
begin
  FServerSocket.ClientEvent(Self, ClientSocket, SocketEvent);
end;

procedure TServerClientThread.Error(ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  FServerSocket.ClientError(Self, ClientSocket, ErrorEvent, ErrorCode);
end;

procedure TServerClientThread.HandleException;
begin
end;

procedure TServerClientThread.Execute;
begin
  FServerSocket.ThreadStart(Self);
  try
    try
      while True do
      begin
        if StartConnect then ClientExecute;
        if EndConnect then Break;
      end;
    except
      HandleException;
      KeepInCache := False;
    end;
  finally
    FServerSocket.ThreadEnd(Self);
  end;
end;

procedure TServerClientThread.ClientExecute;
var
  FDSet: TFDSet;
  TimeVal: TTimeVal;
begin
  while not Terminated and ClientSocket.Connected do
  begin
    FD_ZERO(FDSet);
    FD_SET(ClientSocket.SocketHandle, FDSet);
    TimeVal.tv_sec := 0;
    TimeVal.tv_usec := 500;
    if (select(0, nil, @FDSet, nil, @TimeVal) > 0) and not Terminated then
      Synchronize(DoWrite);
    if (select(0, @FDSet, nil, nil, @TimeVal) > 0) and not Terminated then
      if ClientSocket.ReceiveBuf(FDSet, -1) = 0 then Break
      else Synchronize(DoRead);
  end;
end;

function TServerClientThread.StartConnect: Boolean;
begin
  if FEvent.WaitFor(INFINITE) = wrSignaled then
    FEvent.ResetEvent;
  Result := not Terminated;
end;

function TServerClientThread.EndConnect: Boolean;
begin
  FClientSocket.Free;
  FClientSocket := nil;
  Result := Terminated or not KeepInCache;
end;

{ TAbstractSocket }

procedure TAbstractSocket.DoEvent(Sender: TObject; Socket: TCustomWinSocket;
  SocketEvent: TSocketEvent);
begin
  Event(Socket, SocketEvent);
end;

procedure TAbstractSocket.DoError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  Error(Socket, ErrorEvent, ErrorCode);
end;

procedure TAbstractSocket.SetActive(Value: Boolean);
begin
  if Value <> FActive then
  begin
    DoActivate(Value);
  end;
end;

procedure TAbstractSocket.InitSocket(Socket: TCustomWinSocket);
begin
  Socket.OnSocketEvent := DoEvent;
  Socket.OnErrorEvent := DoError;
end;

procedure TAbstractSocket.SetAddress(Value: string);
begin
  if Value <> FAddress then
  begin
    if FActive then Exit;
    FAddress := Value;
  end;
end;

procedure TAbstractSocket.SetHost(Value: string);
begin
  if Value <> FHost then
  begin
    if FActive then Exit;
    FHost := Value;
  end;
end;

procedure TAbstractSocket.SetPort(Value: Integer);
begin
  if FPort <> Value then
  begin
    if FActive then Exit;
    FPort := Value;
  end;
end;

procedure TAbstractSocket.SetService(Value: string);
begin
  if Value <> FService then
  begin
    if FActive then Exit;
    FService := Value;
  end;
end;

procedure TAbstractSocket.Open;
begin
  Active := True;
end;

procedure TAbstractSocket.Close;
begin
  Active := False;
end;

{ TCustomSocket }

procedure TCustomSocket.Event(Socket: TCustomWinSocket; SocketEvent: TSocketEvent);
begin
  case SocketEvent of
    seLookup: if Assigned(FOnLookup) then FOnLookup(Self, Socket);
    seConnecting: if Assigned(FOnConnecting) then FOnConnecting(Self, Socket);
    seConnect:
      begin
        FActive := True;
        if Assigned(FOnConnect) then FOnConnect(Self, Socket);
      end;
    seListen:
      begin
        FActive := True;
        if Assigned(FOnListen) then FOnListen(Self, Socket);
      end;
    seDisconnect:
      begin
        FActive := False;
        if Assigned(FOnDisconnect) then FOnDisconnect(Self, Socket);
      end;
    seAccept: if Assigned(FOnAccept) then FOnAccept(Self, Socket);
    seRead: if Assigned(FOnRead) then FOnRead(Self, Socket);
    seWrite: if Assigned(FOnWrite) then FOnWrite(Self, Socket);
  end;
end;

procedure TCustomSocket.Error(Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  if Assigned(FOnError) then FOnError(Self, Socket, ErrorEvent, ErrorCode);
end;

{ TWinSocketStream }

constructor TWinSocketStream.Create(ASocket: TCustomWinSocket; TimeOut: Longint);
begin
  if ASocket.ASyncStyles <> [] then
    Exit;
  FSocket := ASocket;
  FTimeOut := TimeOut;
  FEvent := TSimpleEvent.Create;
  inherited Create;
end;

destructor TWinSocketStream.Destroy;
begin
  FEvent.Free;
  inherited Destroy;
end;

function TWinSocketStream.WaitForData(Timeout: Longint): Boolean;
var
  FDSet: TFDSet;
  TimeVal: TTimeVal;
begin
  TimeVal.tv_sec := Timeout div 1000;
  TimeVal.tv_usec := (Timeout mod 1000) * 1000;
  FD_ZERO(FDSet);
  FD_SET(FSocket.SocketHandle, FDSet);
  Result := select(0, @FDSet, nil, nil, @TimeVal) > 0;
end;

function TWinSocketStream.Read(var Buffer; Count: Longint): Longint;
var
  Overlapped: TOverlapped;
begin
  FSocket.Lock;
  try
    FillChar(OVerlapped, SizeOf(Overlapped), 0);
    Overlapped.hEvent := FEvent.Handle;
    if not ReadFile(FSocket.SocketHandle, Buffer, Count, DWORD(Result),
      @Overlapped) and (GetLastError <> ERROR_IO_PENDING) then
    begin
    end;
    if FEvent.WaitFor(FTimeOut) <> wrSignaled then
      Result := 0
    else
    begin
      GetOverlappedResult(FSocket.SocketHandle, Overlapped, DWORD(Result), False);
      FEvent.ResetEvent;
    end;
  finally
    FSocket.Unlock;
  end;
end;

function TWinSocketStream.Write(const Buffer; Count: Longint): Longint;
var
  Overlapped: TOverlapped;
begin
  FSocket.Lock;
  try
    FillChar(Overlapped, SizeOf(Overlapped), 0);
    Overlapped.hEvent := FEvent.Handle;
    if not WriteFile(FSocket.SocketHandle, Buffer, Count, DWORD(Result),
      @Overlapped) and (GetLastError <> ERROR_IO_PENDING) then
    begin
    end;
    if FEvent.WaitFor(FTimeOut) <> wrSignaled then
      Result := 0
    else GetOverlappedResult(FSocket.SocketHandle, Overlapped, DWORD(Result), False);
  finally
    FSocket.Unlock;
  end;
end;

function TWinSocketStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  Result := 0;
end;

{ TClientSocket }

constructor TClientSocket.Create;
begin
  inherited Create;
  FClientSocket := TClientWinSocket.Create(INVALID_SOCKET);
  InitSocket(FClientSocket);
end;

destructor TClientSocket.Destroy;
begin
  FClientSocket.Free;
  inherited Destroy;
end;

procedure TClientSocket.DoActivate(Value: Boolean);
begin
  if (Value <> FClientSocket.Connected) then
  begin
    if FClientSocket.Connected then
      FClientSocket.Disconnect(FClientSocket.FSocket)
    else FClientSocket.Open(FHost, FAddress, FService, FPort, ClientType = ctBlocking);
  end;
end;

function TClientSocket.GetClientType: TClientType;
begin
  Result := FClientSocket.ClientType;
end;

procedure TClientSocket.SetClientType(Value: TClientType);
begin
  FClientSocket.ClientType := Value;
end;

{ TCustomServerSocket }

destructor TCustomServerSocket.Destroy;
begin
  FServerSocket.Free;
  inherited Destroy;
end;

procedure TCustomServerSocket.DoActivate(Value: Boolean);
begin
  if (Value <> FServerSocket.Connected) then
  begin
    if FServerSocket.Connected then
      FServerSocket.Disconnect(FServerSocket.SocketHandle)
    else FServerSocket.Listen(FHost, FAddress, FService, FPort, SOMAXCONN);
  end;
end;

function TCustomServerSocket.GetServerType: TServerType;
begin
  Result := FServerSocket.ServerType;
end;

procedure TCustomServerSocket.SetServerType(Value: TServerType);
begin
  FServerSocket.ServerType := Value;
end;

function TCustomServerSocket.GetGetThreadEvent: TGetThreadEvent;
begin
  Result := FServerSocket.OnGetThread;
end;

procedure TCustomServerSocket.SetGetThreadEvent(Value: TGetThreadEvent);
begin
  FServerSocket.OnGetThread := Value;
end;

function TCustomServerSocket.GetGetSocketEvent: TGetSocketEvent;
begin
  Result := FServerSocket.OnGetSocket;
end;

procedure TCustomServerSocket.SetGetSocketEvent(Value: TGetSocketEvent);
begin
  FServerSocket.OnGetSocket := Value;
end;

function TCustomServerSocket.GetThreadCacheSize: Integer;
begin
  Result := FServerSocket.ThreadCacheSize;
end;

procedure TCustomServerSocket.SetThreadCacheSize(Value: Integer);
begin
  FServerSocket.ThreadCacheSize := Value;
end;

function TCustomServerSocket.GetOnThreadStart: TThreadNotifyEvent;
begin
  Result := FServerSocket.OnThreadStart;
end;

function TCustomServerSocket.GetOnThreadEnd: TThreadNotifyEvent;
begin
  Result := FServerSocket.OnThreadEnd;
end;

procedure TCustomServerSocket.SetOnThreadStart(Value: TThreadNotifyEvent);
begin
  FServerSocket.OnThreadStart := Value;
end;

procedure TCustomServerSocket.SetOnThreadEnd(Value: TThreadNotifyEvent);
begin
  FServerSocket.OnThreadEnd := Value;
end;

function TCustomServerSocket.GetOnClientEvent(Index: Integer): TSocketNotifyEvent;
begin
  case Index of
    0: Result := FServerSocket.OnClientRead;
    1: Result := FServerSocket.OnClientWrite;
    2: Result := FServerSocket.OnClientConnect;
    3: Result := FServerSocket.OnClientDisconnect;
  end;
end;

procedure TCustomServerSocket.SetOnClientEvent(Index: Integer;
  Value: TSocketNotifyEvent);
begin
  case Index of
    0: FServerSocket.OnClientRead := Value;
    1: FServerSocket.OnClientWrite := Value;
    2: FServerSocket.OnClientConnect := Value;
    3: FServerSocket.OnClientDisconnect := Value;
  end;
end;

function TCustomServerSocket.GetOnClientError: TSocketErrorEvent;
begin
  Result := FServerSocket.OnClientError;
end;

procedure TCustomServerSocket.SetOnClientError(Value: TSocketErrorEvent);
begin
  FServerSocket.OnClientError := Value;
end;

{ TServerSocket }

constructor TServerSocket.Create;
begin
  inherited Create;
  FServerSocket := TServerWinSocket.Create(INVALID_SOCKET);
  InitSocket(FServerSocket);
  FServerSocket.ThreadCacheSize := 10;
end;

end.
