object FormScreen: TFormScreen
  Left = 207
  Top = 117
  Width = 696
  Height = 360
  Caption = 'FormScreen'
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
  object img1: TImage
    Left = 77
    Top = 0
    Width = 603
    Height = 302
    Align = alClient
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
  object pb1: TProgressBar
    Left = 0
    Top = 0
    Width = 9
    Height = 302
    Align = alLeft
    Orientation = pbVertical
    TabOrder = 1
  end
  object pnl1: TPanel
    Left = 9
    Top = 0
    Width = 68
    Height = 302
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object lbl1: TLabel
      Left = 12
      Top = 48
      Width = 38
      Height = 13
      Caption = 'Quality:'
    end
    object lbl2: TLabel
      Left = 12
      Top = 216
      Width = 42
      Height = 13
      Caption = 'Interval:'
    end
    object lbl3: TLabel
      Left = 15
      Top = 184
      Width = 26
      Height = 13
      Caption = '50 %'
    end
    object btn1: TButton
      Left = 8
      Top = 8
      Width = 51
      Height = 25
      Caption = 'Start'
      TabOrder = 0
      OnClick = btn1Click
    end
    object trckbrQuality: TTrackBar
      Left = 16
      Top = 64
      Width = 25
      Height = 121
      Max = 100
      Min = 1
      Orientation = trVertical
      Position = 50
      TabOrder = 1
      TickMarks = tmBoth
      TickStyle = tsNone
      OnChange = trckbrQualityChange
    end
    object seInterval: TSpinEdit
      Left = 8
      Top = 232
      Width = 49
      Height = 22
      MaxLength = 1
      MaxValue = 5
      MinValue = 0
      TabOrder = 2
      Value = 1
    end
    object chk1: TCheckBox
      Left = 8
      Top = 272
      Width = 49
      Height = 17
      Caption = 'Save'
      TabOrder = 3
    end
  end
end
