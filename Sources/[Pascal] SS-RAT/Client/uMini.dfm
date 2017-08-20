object Form21: TForm21
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Schwarze Sonne RAT - Minidownloader'
  ClientHeight = 67
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 72
    Height = 13
    Caption = 'Download Link:'
  end
  object Label2: TLabel
    Left = 8
    Top = 35
    Width = 237
    Height = 13
    Caption = 'Minidownloader is a small Downloader (1,5 Kbyte)'
  end
  object Label3: TLabel
    Left = 8
    Top = 51
    Width = 220
    Height = 13
    Caption = 'with the ability to get modified by every Build!'
  end
  object Edit1: TEdit
    Left = 86
    Top = 8
    Width = 291
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 264
    Top = 35
    Width = 113
    Height = 25
    Caption = 'Build Downloader'
    TabOrder = 1
    OnClick = Button1Click
  end
end
