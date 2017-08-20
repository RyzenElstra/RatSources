unit UnitThumbDb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, StdCtrls,Storages, ActiveX;

type
  TThumbInfo = record
    dwFirstDummy:dword;      //don't what this value is used for
    dwIndex:dword;           //index of thumb in catalog
    dwFileDate:dword;        //this dword may be a file date (unknown)
    dwThumbDate:dword;       //this dword may be a file date (unknown)
    dwUnknown1:dword;        //unknown word in thumb item
    dwUnknown2:dword;        //unknown word in thumb item
    dwSizeOfJPGStream:dword; //stream size of JPEG stream
  end;

  TThumbHeader = record
    DummyValue1: dword;
    ThumbCount: dword;
    ThumbSize: TSize;
  end;

var
  ThumbInfo: TThumbInfo;
  ThumbHeader: TThumbHeader;

function GetJpegThumb(ThumbFile,Fname: string): TJpegImage;


implementation

function GetJpegThumb(ThumbFile,Fname: string): TJpegImage;
var
  i,j: dword;
  ThumbsDBFile:TStorage;       //TStorage for thumbs.db file
  ThumbsDBCatalog:TStream;     //TStream for file catalog inside thumbs.db
  ThumbsDB_JPEG:tstream;       //stream for thumb image inside thumbs.db
  ThumbInfo: TThumbInfo;

      Filename:string;             //Filename read from catalog
    WideChr:word;                //placeholder to read widechar filename
    dwIndex:dword;               //placeholder to calculate item names
    IndexStr:string;             //name of TStorage item for each catalog item


begin
  Result := nil;
  try
  ThumbsDBFile := TStgFile.OpenFile(ThumbFile, STGM_READ or STGM_SHARE_EXCLUSIVE);
  try
    ThumbsDBCatalog := ThumbsDBFile.OpenStream('Catalog', STGM_READ or STGM_SHARE_EXCLUSIVE);
    try
      ThumbsDBCatalog.Read(ThumbHeader,SizeOf(TThumbHeader));

      for i := 0 to ThumbHeader.ThumbCount -1 do begin

        ThumbsDBCatalog.Read(ThumbInfo.dwFirstDummy,4);
        ThumbsDBCatalog.Read(ThumbInfo.dwIndex,4);
        ThumbsDBCatalog.Read(ThumbInfo.dwFileDate,4);
        ThumbsDBCatalog.Read(ThumbInfo.dwThumbDate,4);

        //read filename as widechar and convert to string
        Filename := '';
        repeat
          ThumbsDBCatalog.Read(WideChr,2);
          if WideChr <> 0 then Filename := Filename + char(WideChr);
        until WideChr = 0;
        ThumbsDBCatalog.Read(WideChr,2);

        if lowercase(FileName) <> lowercase(FName) then Continue;

        IndexStr := '';
        dwIndex := ThumbInfo.dwIndex;
        while dwIndex > 0 do
        begin
          j := dwIndex mod 10;
          IndexStr := IndexStr + IntToStr(j);
          dwIndex := dwIndex div 10;
        end;


        ThumbsDB_JPEG := ThumbsDBFile.OpenStream(IndexStr, STGM_READ or STGM_SHARE_EXCLUSIVE);
        try
          ThumbsDB_JPEG.Read(ThumbInfo.dwUnknown1,4);
          ThumbsDB_JPEG.Read(ThumbInfo.dwUnknown1,4);
          ThumbsDB_JPEG.Read(ThumbInfo.dwSizeOfJPGStream,4);
          try
            Result := TJpegImage.Create;
            Result.LoadFromStream(ThumbsDB_JPEG);
          except
          end;
        finally
          ThumbsDB_JPEG.Free;
        end;

      end;
    finally
      ThumbsDBCatalog.Free;
    end;
  finally
    ThumbsDBFile.Free;
  end;
  except
  end;
end;

end.
