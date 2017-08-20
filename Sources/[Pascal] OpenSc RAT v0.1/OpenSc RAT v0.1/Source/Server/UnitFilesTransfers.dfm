object FormFilesTransfers: TFormFilesTransfers
  Left = 225
  Top = 156
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FormFilesTransfers'
  ClientHeight = 138
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 12
    Width = 46
    Height = 13
    Caption = 'Filename:'
  end
  object lbl2: TLabel
    Left = 8
    Top = 36
    Width = 41
    Height = 13
    Caption = 'File size:'
  end
  object lbl3: TLabel
    Left = 8
    Top = 60
    Width = 45
    Height = 13
    Caption = 'Time left:'
  end
  object lbl4: TLabel
    Left = 8
    Top = 82
    Width = 34
    Height = 13
    Caption = 'Speed:'
  end
  object pb1: TProgressBar
    Left = 8
    Top = 112
    Width = 337
    Height = 17
    TabOrder = 0
  end
end
