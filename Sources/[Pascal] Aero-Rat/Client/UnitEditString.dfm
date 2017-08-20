object EditString: TEditString
  Left = 428
  Top = 213
  Width = 305
  Height = 176
  Caption = 'EditString'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 56
    Height = 13
    Caption = 'Value Name'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 52
    Height = 13
    Caption = 'Value Data'
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 273
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 8
    Top = 72
    Width = 273
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
  end
  object Button1: TButton
    Left = 208
    Top = 104
    Width = 73
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 104
    Width = 73
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = Button2Click
  end
end
