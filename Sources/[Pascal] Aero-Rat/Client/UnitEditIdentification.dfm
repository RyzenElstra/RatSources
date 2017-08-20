object EditIdentification: TEditIdentification
  Left = 202
  Top = 129
  Width = 303
  Height = 169
  Caption = 'EditIdentification'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    287
    133)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 29
    Height = 13
    Caption = 'Group'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 24
    Width = 273
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 0
    OnKeyPress = ComboBox1KeyPress
    Items.Strings = (
      '%COMPUTER%'
      '%USER%'
      '%LAN%'
      '%WAN%'
      '%WEBCAM%'
      '%VERSION%'
      '%ACCOUNT%'
      '%SYSTEM%'
      '%PROCESSOR%'
      '%MEMORY%'
      '%COUNTRY%'
      '%LANGUAGE%'
      '%COUNTRYCODE%')
  end
  object ComboBox2: TComboBox
    Left = 8
    Top = 72
    Width = 273
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 1
    OnKeyPress = ComboBox2KeyPress
    Items.Strings = (
      '%COMPUTER%'
      '%USER%'
      '%LAN%'
      '%WAN%'
      '%WEBCAM%'
      '%VERSION%'
      '%ACCOUNT%'
      '%SYSTEM%'
      '%PROCESSOR%'
      '%MEMORY%'
      '%COUNTRY%'
      '%LANGUAGE%'
      '%COUNTRYCODE%')
  end
  object BitBtn1: TBitBtn
    Left = 142
    Top = 102
    Width = 65
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 214
    Top = 102
    Width = 65
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
end
