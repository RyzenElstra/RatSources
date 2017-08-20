object FormWebcam: TFormWebcam
  Left = 249
  Top = 165
  Width = 696
  Height = 360
  Caption = 'FormWebcam'
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
    Left = 201
    Top = 0
    Width = 479
    Height = 302
    Align = alClient
    Stretch = True
  end
  object pb1: TProgressBar
    Left = 0
    Top = 0
    Width = 9
    Height = 302
    Align = alLeft
    Orientation = pbVertical
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 9
    Top = 0
    Width = 192
    Height = 302
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object lbl1: TLabel
      Left = 12
      Top = 46
      Width = 38
      Height = 13
      Caption = 'Quality:'
    end
    object lbl2: TLabel
      Left = 12
      Top = 76
      Width = 42
      Height = 13
      Caption = 'Interval:'
    end
    object lbl3: TLabel
      Left = 12
      Top = 12
      Width = 38
      Height = 13
      Caption = 'Drivers:'
    end
    object lbl4: TLabel
      Left = 148
      Top = 46
      Width = 26
      Height = 13
      Caption = '50 %'
    end
    object btn1: TButton
      Left = 98
      Top = 104
      Width = 75
      Height = 25
      Caption = 'Start'
      TabOrder = 0
      OnClick = btn1Click
    end
    object trckbrQuality: TTrackBar
      Left = 56
      Top = 40
      Width = 89
      Height = 25
      Max = 100
      Min = 1
      Position = 50
      TabOrder = 1
      TickMarks = tmBoth
      TickStyle = tsNone
      OnChange = trckbrQualityChange
    end
    object seInterval: TSpinEdit
      Left = 64
      Top = 72
      Width = 113
      Height = 22
      MaxLength = 1
      MaxValue = 5
      MinValue = 0
      TabOrder = 2
      Value = 1
    end
    object chk1: TCheckBox
      Left = 8
      Top = 108
      Width = 89
      Height = 17
      Caption = 'Save capture'
      TabOrder = 3
    end
    object cbbDrivers: TComboBoxEx
      Left = 64
      Top = 8
      Width = 113
      Height = 22
      ItemsEx = <>
      Style = csExDropDownList
      ItemHeight = 16
      TabOrder = 4
      DropDownCount = 8
    end
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
