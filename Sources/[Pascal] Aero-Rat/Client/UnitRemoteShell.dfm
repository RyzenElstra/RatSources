object RemoteShell: TRemoteShell
  Left = 199
  Top = 151
  Width = 598
  Height = 364
  Caption = 'RemoteShell'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 582
    Height = 311
    Align = alClient
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnKeyPress = Memo1KeyPress
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 311
    Width = 582
    Height = 17
    Panels = <>
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 208
    Top = 96
  end
end
