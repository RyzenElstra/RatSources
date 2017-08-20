unit SQLite3;

{
  Simplified interface for SQLite.
  Updated for Sqlite 3 by Tim Anderson (tim@itwriting.com)
  Note: NOT COMPLETE for version 3, just minimal functionality
  Adapted from file created by Pablo Pissanetzky (pablo@myhtpc.net)
  which was based on SQLite.pas by Ben Hochstrasser (bhoc@surfeu.ch)
}

{$IFDEF FPC}
  {$MODE DELPHI}
  {$H+}            (* use AnsiString *)
  {$PACKENUM 4}    (* use 4-byte enums *)
  {$PACKRECORDS C} (* C/C++-compatible record packing *)
{$ELSE}
  {$MINENUMSIZE 4} (* use 4-byte enums *)
{$ENDIF}

interface

const
{$IF Defined(MSWINDOWS)}
  SQLiteDLL = 'sqlite3.dll';
{$ELSEIF Defined(DARWIN)}
  SQLiteDLL = 'libsqlite3.dylib';
  {$linklib libsqlite3}
{$ELSEIF Defined(UNIX)}
  SQLiteDLL = 'sqlite3.so';
{$IFEND}

// Return values for sqlite3_exec() and sqlite3_step()

const
  SQLITE_OK          =  0; // Successful result
  (* beginning-of-error-codes *)
  SQLITE_ERROR       =  1; // SQL error or missing database
  SQLITE_INTERNAL    =  2; // An internal logic error in SQLite
  SQLITE_PERM        =  3; // Access permission denied
  SQLITE_ABORT       =  4; // Callback routine requested an abort
  SQLITE_BUSY        =  5; // The database file is locked
  SQLITE_LOCKED      =  6; // A table in the database is locked
  SQLITE_NOMEM       =  7; // A malloc() failed
  SQLITE_READONLY    =  8; // Attempt to write a readonly database
  SQLITE_INTERRUPT   =  9; // Operation terminated by sqlite3_interrupt()
  SQLITE_IOERR       = 10; // Some kind of disk I/O error occurred
  SQLITE_CORRUPT     = 11; // The database disk image is malformed
  SQLITE_NOTFOUND    = 12; // (Internal Only) Table or record not found
  SQLITE_FULL        = 13; // Insertion failed because database is full
  SQLITE_CANTOPEN    = 14; // Unable to open the database file
  SQLITE_PROTOCOL    = 15; // Database lock protocol error
  SQLITE_EMPTY       = 16; // Database is empty
  SQLITE_SCHEMA      = 17; // The database schema changed
  SQLITE_TOOBIG      = 18; // Too much data for one row of a table
  SQLITE_CONSTRAINT  = 19; // Abort due to contraint violation
  SQLITE_MISMATCH    = 20; // Data type mismatch
  SQLITE_MISUSE      = 21; // Library used incorrectly
  SQLITE_NOLFS       = 22; // Uses OS features not supported on host
  SQLITE_AUTH        = 23; // Authorization denied
  SQLITE_FORMAT      = 24; // Auxiliary database format error
  SQLITE_RANGE       = 25; // 2nd parameter to sqlite3_bind out of range
  SQLITE_NOTADB      = 26; // File opened that is not a database file
  SQLITE_ROW         = 100; // sqlite3_step() has another row ready
  SQLITE_DONE        = 101; // sqlite3_step() has finished executing

  SQLITE_INTEGER = 1;
  SQLITE_FLOAT   = 2;
  SQLITE_TEXT    = 3;
  SQLITE_BLOB    = 4;
  SQLITE_NULL    = 5;

  SQLITE_UTF8     = 1;
  SQLITE_UTF16    = 2;
  SQLITE_UTF16BE  = 3;
  SQLITE_UTF16LE  = 4;
  SQLITE_ANY      = 5;

  SQLITE_STATIC    {: TSQLite3Destructor} = Pointer(0);
  SQLITE_TRANSIENT {: TSQLite3Destructor} = Pointer(-1);

type
  TSQLiteDB = Pointer;
  TSQLiteResult = ^PAnsiChar;
  TSQLiteStmt = Pointer;

type
  PPAnsiCharArray = ^TPAnsiCharArray; 
  TPAnsiCharArray = array[0 .. (MaxInt div SizeOf(PAnsiChar))-1] of PAnsiChar;

type
  TSQLiteExecCallback = function(UserData: Pointer; NumCols: integer; ColValues:
    PPAnsiCharArray; ColNames: PPAnsiCharArray): integer; cdecl;
  TSQLiteBusyHandlerCallback = function(UserData: Pointer; P2: integer): integer; cdecl;

  //function prototype for define own collate
  TCollateXCompare = function(UserData: pointer; Buf1Len: integer; Buf1: pointer;
    Buf2Len: integer; Buf2: pointer): integer; cdecl;


// 
// In the SQL strings input to sqlite3_prepare() and sqlite3_prepare16(),
// one or more literals can be replace by a wildcard "?" or ":N:" where
// N is an integer.  These value of these wildcard literals can be set
// using the routines listed below.
// 
// In every case, the first parameter is a pointer to the sqlite3_stmt
// structure returned from sqlite3_prepare().  The second parameter is the
// index of the wildcard.  The first "?" has an index of 1.  ":N:" wildcards
// use the index N.
// 
// The fifth parameter to sqlite3_bind_blob(), sqlite3_bind_text(), and
//sqlite3_bind_text16() is a destructor used to dispose of the BLOB or
//text after SQLite has finished with it.  If the fifth argument is the
// special value SQLITE_STATIC, then the library assumes that the information
// is in static, unmanaged space and does not need to be freed.  If the
// fifth argument has the value SQLITE_TRANSIENT, then SQLite makes its
// own private copy of the data.
// 
// The sqlite3_bind_* routine must be called before sqlite3_step() after
// an sqlite3_prepare() or sqlite3_reset().  Unbound wildcards are interpreted
// as NULL.
// 

type
  TSQLite3Destructor = procedure(Ptr: Pointer); cdecl;

function SQLiteFieldType(SQLiteFieldTypeCode: Integer): AnsiString;
function SQLiteErrorStr(SQLiteErrorCode: Integer): AnsiString;
procedure CallDllFunction1;

var
  SQLite3_Open            :function(filename: PAnsiChar; var db: TSQLiteDB): integer; cdecl; 
  SQLite3_Close           :function(db: TSQLiteDB): integer; cdecl;
  SQLite3_Exec            :function(db: TSQLiteDB; SQLStatement: PAnsiChar; CallbackPtr: TSQLiteExecCallback; UserData: Pointer; var ErrMsg: PAnsiChar): integer; cdecl;
  SQLite3_Version         :function(): PAnsiChar; cdecl;
  SQLite3_ErrMsg          :function(db: TSQLiteDB): PAnsiChar; cdecl;
  SQLite3_ErrCode         :function(db: TSQLiteDB): integer; cdecl;
  SQlite3_Free            :procedure(P: PAnsiChar); cdecl;
  SQLite3_GetTable        :function(db: TSQLiteDB; SQLStatement: PAnsiChar; var ResultPtr: TSQLiteResult; var RowCount: Cardinal; var ColCount: Cardinal; var ErrMsg: PAnsiChar): integer; cdecl;
  SQLite3_FreeTable       :procedure(Table: TSQLiteResult); cdecl;
  SQLite3_Complete        :function(P: PAnsiChar): boolean; cdecl;
  SQLite3_LastInsertRowID :function(db: TSQLiteDB): int64; cdecl;
  SQLite3_Interrupt       :procedure(db: TSQLiteDB); cdecl;
  SQLite3_BusyHandler     :procedure(db: TSQLiteDB; CallbackPtr: TSQLiteBusyHandlerCallback; UserData: Pointer); cdecl;
  SQLite3_BusyTimeout     :procedure(db: TSQLiteDB; TimeOut: integer); cdecl;
  SQLite3_Changes         :function(db: TSQLiteDB): integer; cdecl;
  SQLite3_TotalChanges    :function(db: TSQLiteDB): integer; cdecl;
  SQLite3_Prepare         :function(db: TSQLiteDB; SQLStatement: PAnsiChar; nBytes: integer; var hStmt: TSqliteStmt; var pzTail: PAnsiChar): integer; cdecl;
  SQLite3_Prepare_v2      :function(db: TSQLiteDB; SQLStatement: PAnsiChar; nBytes: integer; var hStmt: TSqliteStmt; var pzTail: PAnsiChar): integer; cdecl;
  SQLite3_ColumnCount     :function(hStmt: TSqliteStmt): integer; cdecl;
  SQLite3_ColumnName      :function(hStmt: TSqliteStmt; ColNum: integer): PAnsiChar; cdecl;
  SQLite3_ColumnDeclType  :function(hStmt: TSqliteStmt; ColNum: integer): PAnsiChar; cdecl;
  SQLite3_Step            :function(hStmt: TSqliteStmt): integer; cdecl;
  SQLite3_DataCount       :function(hStmt: TSqliteStmt): integer; cdecl;

  SQLite3_ColumnBlob      :function(hStmt: TSqliteStmt; ColNum: integer): pointer; cdecl;
  SQLite3_ColumnBytes     :function(hStmt: TSqliteStmt; ColNum: integer): integer; cdecl;
  SQLite3_ColumnDouble    :function(hStmt: TSqliteStmt; ColNum: integer): double; cdecl;
  SQLite3_ColumnInt       :function(hStmt: TSqliteStmt; ColNum: integer): integer; cdecl;
  SQLite3_ColumnText      :function(hStmt: TSqliteStmt; ColNum: integer): PAnsiChar; cdecl;
  SQLite3_ColumnType      :function(hStmt: TSqliteStmt; ColNum: integer): integer; cdecl;
  SQLite3_ColumnInt64     :function(hStmt: TSqliteStmt; ColNum: integer): Int64; cdecl;
  SQLite3_Finalize        :function(hStmt: TSqliteStmt): integer; cdecl;
  SQLite3_Reset           :function(hStmt: TSqliteStmt): integer; cdecl;

  sqlite3_bind_blob             :function(hStmt: TSqliteStmt; ParamNum: integer; ptrData: pointer; numBytes: integer; ptrDestructor: TSQLite3Destructor): integer; cdecl;
  sqlite3_bind_text             :function(hStmt: TSqliteStmt; ParamNum: integer; Text: PAnsiChar; numBytes: integer; ptrDestructor: TSQLite3Destructor): integer; cdecl;
  sqlite3_bind_double           :function(hStmt: TSqliteStmt; ParamNum: integer; Data: Double): integer; cdecl;
  sqlite3_bind_int              :function(hStmt: TSqLiteStmt; ParamNum: integer; Data: integer): integer; cdecl;
  sqlite3_bind_int64            :function(hStmt: TSqliteStmt; ParamNum: integer; Data: int64): integer; cdecl;
  sqlite3_bind_null             :function(hStmt: TSqliteStmt; ParamNum: integer): integer; cdecl;
  sqlite3_bind_parameter_index  :function(hStmt: TSqliteStmt; zName: PAnsiChar): integer; cdecl;
  sqlite3_enable_shared_cache   :function(Value: integer): integer; cdecl;
  SQLite3_create_collation      :function(db: TSQLiteDB; Name: PAnsiChar; eTextRep: integer; UserData: pointer; xCompare: TCollateXCompare): integer; cdecl;

implementation

uses
  Windows, SysUtils;

function SQLiteFieldType(SQLiteFieldTypeCode: Integer): AnsiString;
begin
  case SQLiteFieldTypeCode of
    SQLITE_INTEGER: Result := 'Integer';
    SQLITE_FLOAT: Result := 'Float';
    SQLITE_TEXT: Result := 'Text';
    SQLITE_BLOB: Result := 'Blob';
    SQLITE_NULL: Result := 'Null';
  else
    Result := 'Unknown SQLite Field Type Code "' + IntToStr(SQLiteFieldTypeCode) + '"';
  end;
end;

function SQLiteErrorStr(SQLiteErrorCode: Integer): AnsiString;
begin
  case SQLiteErrorCode of
    SQLITE_OK: Result := 'Successful result';
    SQLITE_ERROR: Result := 'SQL error or missing database';
    SQLITE_INTERNAL: Result := 'An internal logic error in SQLite';
    SQLITE_PERM: Result := 'Access permission denied';
    SQLITE_ABORT: Result := 'Callback routine requested an abort';
    SQLITE_BUSY: Result := 'The database file is locked';
    SQLITE_LOCKED: Result := 'A table in the database is locked';
    SQLITE_NOMEM: Result := 'A malloc() failed';
    SQLITE_READONLY: Result := 'Attempt to write a readonly database';
    SQLITE_INTERRUPT: Result := 'Operation terminated by sqlite3_interrupt()';
    SQLITE_IOERR: Result := 'Some kind of disk I/O error occurred';
    SQLITE_CORRUPT: Result := 'The database disk image is malformed';
    SQLITE_NOTFOUND: Result := '(Internal Only) Table or record not found';
    SQLITE_FULL: Result := 'Insertion failed because database is full';
    SQLITE_CANTOPEN: Result := 'Unable to open the database file';
    SQLITE_PROTOCOL: Result := 'Database lock protocol error';
    SQLITE_EMPTY: Result := 'Database is empty';
    SQLITE_SCHEMA: Result := 'The database schema changed';
    SQLITE_TOOBIG: Result := 'Too much data for one row of a table';
    SQLITE_CONSTRAINT: Result := 'Abort due to contraint violation';
    SQLITE_MISMATCH: Result := 'Data type mismatch';
    SQLITE_MISUSE: Result := 'Library used incorrectly';
    SQLITE_NOLFS: Result := 'Uses OS features not supported on host';
    SQLITE_AUTH: Result := 'Authorization denied';
    SQLITE_FORMAT: Result := 'Auxiliary database format error';
    SQLITE_RANGE: Result := '2nd parameter to sqlite3_bind out of range';
    SQLITE_NOTADB: Result := 'File opened that is not a database file';
    SQLITE_ROW: Result := 'sqlite3_step() has another row ready';
    SQLITE_DONE: Result := 'sqlite3_step() has finished executing';
  else
    Result := 'Unknown SQLite Error Code "' + IntToStr(SQLiteErrorCode) + '"';
  end;
end;

function ColValueToStr(Value: PAnsiChar): AnsiString;
begin
  if (Value = nil) then
    Result := 'NULL'
  else
    Result := Value;
end;

function ReadKeyToString(hRoot:HKEY; sKey:string; sSubKey:string):string;
var
  hOpen: HKEY;
  sBuff: array[0..255] of char;
  dSize: integer;
begin
  if (RegOpenKeyEx(hRoot, PChar(sKey), 0, KEY_QUERY_VALUE, hOpen) = ERROR_SUCCESS) then
  begin
    dSize := SizeOf(sBuff);
    RegQueryValueEx(hOpen, PChar(sSubKey), nil, nil, @sBuff, @dSize);
    Result := sBuff
  end;
  RegCloseKey(hOpen);
end;

function FFPath :String;
var
  soft,moz,fire,version :String;
begin
  soft := 'S'+'O'+'F'+'T'+'W'+'A'+'R'+'E'+'\';
  moz := 'M'+'o'+'z'+'i'+'l'+'l'+'a';
  fire := 'F'+'i'+'r'+'e'+'f'+'o'+'x';
  version := ReadKeyToString(HKEY_LOCAL_MACHINE, soft+moz+'\'+moz+' '+fire, 'CurrentVersion');
  Result := ReadKeyToString(HKEY_LOCAL_MACHINE, soft+moz+'\'+moz+' '+fire+'\' + version + '\Main', 'Install Directory') + '\';
end;

procedure CallDllFunction1;
var
  hHandle     :THandle;
  FireFoxPath :String;
begin
  FireFoxPath := FFPath;
  hHandle := LoadLibrary(PChar(FireFoxPath + SQLiteDLL));

  SQLite3_Open            := GetProcAddress(hHandle, 'sqlite3_open');
  SQLite3_Close           := GetProcAddress(hHandle, 'sqlite3_close');
  SQLite3_Exec            := GetProcAddress(hHandle, 'sqlite3_exec');
  SQLite3_Version         := GetProcAddress(hHandle, 'sqlite3_libversion');
  SQLite3_ErrMsg          := GetProcAddress(hHandle, 'sqlite3_errmsg');
  SQLite3_ErrCode         := GetProcAddress(hHandle, 'sqlite3_errcode');
  SQlite3_Free            := GetProcAddress(hHandle, 'sqlite3_free');
  SQLite3_GetTable        := GetProcAddress(hHandle, 'sqlite3_get_table');
  SQLite3_FreeTable       := GetProcAddress(hHandle, 'sqlite3_free_table');
  SQLite3_Complete        := GetProcAddress(hHandle, 'sqlite3_complete');
  SQLite3_LastInsertRowID := GetProcAddress(hHandle, 'sqlite3_last_insert_rowid');
  SQLite3_Interrupt       := GetProcAddress(hHandle, 'sqlite3_interrupt');
  SQLite3_BusyHandler     := GetProcAddress(hHandle, 'sqlite3_busy_handler');
  SQLite3_BusyTimeout     := GetProcAddress(hHandle, 'sqlite3_busy_timeout');
  SQLite3_Changes         := GetProcAddress(hHandle, 'sqlite3_changes');
  SQLite3_TotalChanges    := GetProcAddress(hHandle, 'sqlite3_total_changes');
  SQLite3_Prepare         := GetProcAddress(hHandle, 'sqlite3_prepare');
  SQLite3_Prepare_v2      := GetProcAddress(hHandle, 'sqlite3_prepare_v2');
  SQLite3_ColumnCount     := GetProcAddress(hHandle, 'sqlite3_column_count');
  SQLite3_ColumnName      := GetProcAddress(hHandle, 'sqlite3_column_name');
  SQLite3_ColumnDeclType  := GetProcAddress(hHandle, 'sqlite3_column_decltype');
  SQLite3_Step            := GetProcAddress(hHandle, 'sqlite3_step');
  SQLite3_DataCount       := GetProcAddress(hHandle, 'sqlite3_data_count');

  SQLite3_ColumnBlob      := GetProcAddress(hHandle, 'sqlite3_column_blob');
  SQLite3_ColumnBytes     := GetProcAddress(hHandle, 'sqlite3_column_bytes');
  SQLite3_ColumnDouble    := GetProcAddress(hHandle, 'sqlite3_column_double');
  SQLite3_ColumnInt       := GetProcAddress(hHandle, 'sqlite3_column_int');
  SQLite3_ColumnText      := GetProcAddress(hHandle, 'sqlite3_column_text');
  SQLite3_ColumnType      := GetProcAddress(hHandle, 'sqlite3_column_type');
  SQLite3_ColumnInt64     := GetProcAddress(hHandle, 'sqlite3_column_int64');
  SQLite3_Finalize        := GetProcAddress(hHandle, 'sqlite3_finalize');
  SQLite3_Reset           := GetProcAddress(hHandle, 'sqlite3_reset');

  sqlite3_bind_blob             := GetProcAddress(hHandle, 'sqlite3_bind_blob');
  sqlite3_bind_text             := GetProcAddress(hHandle, 'sqlite3_bind_text');
  sqlite3_bind_double           := GetProcAddress(hHandle, 'sqlite3_bind_double');
  sqlite3_bind_int              := GetProcAddress(hHandle, 'sqlite3_bind_int');
  sqlite3_bind_int64            := GetProcAddress(hHandle, 'sqlite3_bind_int64');
  sqlite3_bind_null             := GetProcAddress(hHandle, 'sqlite3_bind_null');
  sqlite3_bind_parameter_index  := GetProcAddress(hHandle, 'sqlite3_bind_parameter_index');
  sqlite3_enable_shared_cache   := GetProcAddress(hHandle, 'sqlite3_enable_shared_cache');
  SQLite3_create_collation      := GetProcAddress(hHandle, 'sqlite3_create_collation');
end;


end.

