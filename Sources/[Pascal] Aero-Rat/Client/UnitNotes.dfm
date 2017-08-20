object Notes: TNotes
  Left = 196
  Top = 168
  Width = 331
  Height = 275
  Caption = 'Notes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 315
    Height = 200
    Align = alClient
    HideSelection = False
    HideScrollBars = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 200
    Width = 315
    Height = 39
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      315
      39)
    object Button2: TButton
      Left = 139
      Top = 6
      Width = 81
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 226
      Top = 6
      Width = 81
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Save'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
