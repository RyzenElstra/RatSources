object SendKeys: TSendKeys
  Left = 488
  Top = 116
  Width = 414
  Height = 386
  Caption = 'SendKeys'
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
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 398
    Height = 301
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 0
    OnKeyDown = Memo1KeyDown
    OnKeyUp = Memo1KeyUp
  end
  object Panel1: TPanel
    Left = 0
    Top = 301
    Width = 398
    Height = 49
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      398
      49)
    object Button1: TButton
      Left = 327
      Top = 13
      Width = 65
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 255
      Top = 13
      Width = 65
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 1
      OnClick = Button2Click
    end
    object RadioButton1: TRadioButton
      Left = 8
      Top = 8
      Width = 105
      Height = 17
      Caption = 'Active Window'
      TabOrder = 2
    end
    object RadioButton2: TRadioButton
      Left = 104
      Top = 8
      Width = 113
      Height = 17
      Caption = 'Selected Window'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object CheckBox1: TCheckBox
      Left = 9
      Top = 28
      Width = 153
      Height = 17
      Caption = 'Send keys as they are typed'
      TabOrder = 4
    end
  end
end
