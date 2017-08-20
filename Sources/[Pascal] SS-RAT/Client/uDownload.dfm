object Form14: TForm14
  Left = 352
  Top = 260
  Caption = 'Form14'
  ClientHeight = 107
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 23
    Height = 13
    Caption = 'URL:'
  end
  object lbl2: TLabel
    Left = 8
    Top = 40
    Width = 46
    Height = 13
    Caption = 'Filename:'
  end
  object edt1: TEdit
    Left = 56
    Top = 8
    Width = 321
    Height = 21
    TabOrder = 0
    Text = 'http://www.yourhost.com/file.exe'
  end
  object btn1: TButton
    Left = 288
    Top = 72
    Width = 89
    Height = 25
    Caption = 'Send Command'
    TabOrder = 1
    OnClick = btn1Click
  end
  object edt2: TEdit
    Left = 56
    Top = 40
    Width = 321
    Height = 21
    TabOrder = 2
    Text = 'file.exe'
  end
end
