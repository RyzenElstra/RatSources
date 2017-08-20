object FormCallback: TFormCallback
  Left = 396
  Top = 234
  Width = 291
  Height = 106
  Caption = 'FormCallback'
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
  object GaugeEx: TGauge
    Left = 0
    Top = 0
    Width = 283
    Height = 25
    Align = alTop
    Progress = 0
  end
  object SBarEx: TStatusBar
    Left = 0
    Top = 62
    Width = 283
    Height = 17
    Panels = <>
  end
  object Button_Cancel: TButton
    Left = 80
    Top = 32
    Width = 113
    Height = 25
    Caption = #21462#28040#20256#36755
    TabOrder = 1
    OnClick = Button_CancelClick
  end
end
