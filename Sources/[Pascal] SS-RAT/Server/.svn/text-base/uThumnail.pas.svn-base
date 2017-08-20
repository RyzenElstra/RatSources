unit uThumnail;

interface
uses classes,windows,Graphics,jpeg,uFunction,MagicApiHooks;
type
  TThumbnails = class
  private
    procedure CreateThumbnail(InStream, OutStream: TStream);
    procedure CreateBMPThumb(InStream:TStream;OutFileName: TStream);
  public
    procedure CreateThumb(InFileName:String;Outputstream:TStream);
  end;
var
  Thumbnails: TThumbnails;
implementation
procedure TThumbnails.CreateThumbnail(InStream, OutStream: TStream);
var
  JpegImage: TJpegImage;
  Bitmap: TBitmap;
  Ratio: Double;
  ARect: TRect;
  AHeight, AHeightOffset: Integer;
  AWidth, AWidthOffset: Integer;
  newheight, newwidth : integer;
begin
  JpegImage:=TJpegImage.Create;
  try
    JpegImage.LoadFromStream(InStream);
    if JpegImage.Width <> JpegImage.height then begin
     if JpegImage.height > JpegImage.width then begin
        newheight := 128;
        newwidth := (newheight * JpegImage.width) div JpegImage.height;
     end
     else begin
        newwidth := 128;
        newheight := (newwidth * JpegImage.height) div JpegImage.width;
     end;
   end
   else begin
        newheight := 128;
        newwidth := 128;
   end;
    Bitmap:=TBitmap.Create;
    try
      Ratio:=JpegImage.Width/JpegImage.Height;
      if Ratio>1 then
      begin
        AHeight:=Round(newWidth/Ratio);
        AHeightOffset:=(newHeight-AHeight) div 2;
        AWidth:=newWidth;
        AWidthOffset:=0;
      end
      else
      begin
        AWidth:=Round(newHeight*Ratio);
        AWidthOffset:=(newWidth-AWidth) div 2;
        AHeight:=newHeight;
        AHeightOffset:=0;
      end;
      Bitmap.Width:=newWidth;
      Bitmap.Height:=newHeight;
      Bitmap.Canvas.Brush.Color:=clWhite;
      Bitmap.Canvas.FillRect(Rect(0,0,newWidth,newHeight));
      ARect:=Rect(AWidthOffset,AHeightOffset,AWidth+AWidthOffset,AHeight+AHeightOffset);
      Bitmap.Canvas.StretchDraw(ARect,JpegImage);
      JpegImage.Assign(Bitmap);
      JpegImage.SaveToStream(OutStream);
    finally
      Bitmap.Free;
    end;
  finally
    JpegImage.Free;
  end;
end;
procedure TThumbnails.CreateBMPThumb(InStream:TStream;OutFileName: TStream);
var
  Bitmap, Bitmap2: TBitmap;
  Ratio: Double;
  ARect: TRect;
  AHeight, AHeightOffset: Integer;
  AWidth, AWidthOffset: Integer;
  newheight, newwidth : integer;
  JpegImage :TJpegImage;
begin
  JpegImage := TJpegImage.Create;
Bitmap := TBitmap.Create;
Bitmap2 := TBitmap.Create;
Bitmap.LoadFromStream(inStream); 
if Bitmap.Width <> Bitmap.height then begin
     if Bitmap.height > Bitmap.width then begin
        newheight := 128;
        newwidth := (newheight * Bitmap.width) div Bitmap.height;
     end
     else begin
        newwidth := 128;
        newheight := (newwidth * Bitmap.height) div Bitmap.width;
     end;
   end
   else begin
        newheight := 128;
        newwidth := 128;
   end;
try
      Ratio:=Bitmap.Width/Bitmap.Height;
      if Ratio>1 then
      begin
        AHeight:=Round(newWidth/Ratio);
        AHeightOffset:=(newHeight-AHeight) div 2;
        AWidth:=newWidth;
        AWidthOffset:=0;
      end
      else
      begin
        AWidth:=Round(newHeight*Ratio);
        AWidthOffset:=(newWidth-AWidth) div 2;
        AHeight:=newHeight;
        AHeightOffset:=0;
      end;
      Bitmap2.Width:=newWidth;
      Bitmap2.Height:=newHeight;
      Bitmap2.Canvas.Brush.Color:=clWhite;
      Bitmap2.Canvas.FillRect(Rect(0,0,newWidth,newHeight));
      ARect:=Rect(AWidthOffset,AHeightOffset,AWidth+AWidthOffset,AHeight+AHeightOffset);
      Bitmap2.Canvas.StretchDraw(ARect,Bitmap);
      JpegImage.Assign(Bitmap2);
      JpegImage.SaveToStream(outFilename);
    finally
    Bitmap2.Free;
    Bitmap.Free;
    end;


end;
procedure TThumbnails.CreateThumb(InFileName:String;Outputstream:TStream);
var
  InStream:TFileStream;
  ext:String;
  functions:TFunctions;
begin
  functions := Tfunctions.Create;
  InStream:=TFileStream.Create(InFileName,$0000);
  try
  if LowCaseStr(copy(infilename,length(infilename) - 3,4)) = '.bmp' then
  begin
    CreateBmpThumb(InStream, OutputStream);
  end else begin
    CreateThumbnail(InStream,OutputStream);
  end;
    finally
      InStream.Free;
      Functions.Free;
    end;
end;
end.
