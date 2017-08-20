object FrmListen: TFrmListen
  Left = 773
  Top = 119
  Width = 240
  Height = 165
  Caption = 'Listen Server'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 209
    Height = 113
    Caption = 'Settings'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 36
      Width = 24
      Height = 13
      Caption = 'Port:'
    end
    object EdtPort: TEdit
      Left = 72
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '666'
    end
    object btnListen: TButton
      Left = 120
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Listen'
      TabOrder = 1
      OnClick = btnListenClick
    end
  end
end
