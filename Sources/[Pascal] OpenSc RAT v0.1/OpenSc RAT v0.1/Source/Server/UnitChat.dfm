object FormChat: TFormChat
  Left = 207
  Top = 117
  Width = 696
  Height = 360
  Caption = 'FormChat'
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
  object pnl1: TPanel
    Left = 0
    Top = 269
    Width = 680
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object edtChat: TEdit
      Left = 8
      Top = 6
      Width = 585
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = edtChatKeyPress
    end
    object btn1: TButton
      Left = 600
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Send'
      Enabled = False
      TabOrder = 1
      OnClick = btn1Click
    end
  end
  object mmoChat: TMemo
    Left = 0
    Top = 0
    Width = 680
    Height = 269
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object stat1: TStatusBar
    Left = 0
    Top = 302
    Width = 680
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    ParentFont = True
    UseSystemFont = False
  end
end
