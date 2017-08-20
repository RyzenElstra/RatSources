unit UnitThread; //Original unit by testtest, modified by wrh1d3 :)

interface

uses
  Windows;

type
  TSynchronizeProcedure = procedure of object;
  TThread = class
  private
    FHandle: THandle;
    FThreadId: Cardinal;
    FTerminated: Boolean;    
    FSuspended: Boolean;
    FExitCode: Cardinal;
    FFreeOnTerminate: Boolean;
  protected
    procedure Synchronize(SnycProc: TSynchronizeProcedure);
    procedure Execute; virtual; abstract;
  public
    constructor Create(CreateSuspended: Boolean);
    procedure Resume;        
    procedure Suspend;
    procedure Terminate;
    property Terminated: Boolean read FTerminated;    
    property Suspended: Boolean read FSuspended;
    property FreeOnTerminate: Boolean read FFreeOnTerminate write FFreeOnTerminate;
    property ExitCode: Cardinal read FExitCode;
    property Handle: THandle read FHandle;
    property Id: Cardinal read FThreadId;      
    procedure Lock;
    procedure Unlock;
    destructor Destroy; override;
  end;


implementation

const
  THREAD_ERROR = Cardinal(-1);

var
  ThreadLock: TRTLCriticalSection;

function ThreadFunc(Thread: Pointer): Integer;
begin
  with TThread(Thread) do
  try
    Execute;
  finally
    GetExitCodeThread(FHandle, Cardinal(Result));
    FExitCode := Result;
    FTerminated := True;
    if FFreeOnTerminate then Free;
    ExitThread(Result);
  end;
end;

constructor TThread.Create(CreateSuspended: Boolean);
var
  Flags: Cardinal;
begin
  inherited Create;
  FTerminated := False;
  FSuspended := CreateSuspended;
  FExitCode := 0;
  FFreeOnTerminate := False;
  if CreateSuspended then Flags := CREATE_SUSPENDED else Flags := 0;
  FHandle := BeginThread(nil, 0, ThreadFunc, Pointer(Self), Flags, FThreadId);
end;

procedure TThread.Synchronize(SnycProc: TSynchronizeProcedure);
begin
  Lock;
  try SnycProc;
  finally
    Unlock;
  end;
end;

procedure TThread.Resume;
begin
  if FSuspended and (ResumeThread(FHandle) <> THREAD_ERROR) then FSuspended := False;
end;

procedure TThread.Suspend;
begin
  if not Suspended and (SuspendThread(FHandle) <> THREAD_ERROR) then FSuspended := True;
end;

procedure TThread.Terminate;
begin
  if not FTerminated then FTerminated := True;
end;

procedure TThread.Lock;
begin
  EnterCriticalSection(ThreadLock);
end;

procedure TThread.Unlock;
begin
  LeaveCriticalSection(ThreadLock);
end;

destructor TThread.Destroy;
begin
  CloseHandle(FHandle);
  inherited Destroy;
end;

initialization
  InitializeCriticalSection(ThreadLock);

finalization
  DeleteCriticalSection(ThreadLock);

end.
