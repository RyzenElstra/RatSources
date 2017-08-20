object EditService: TEditService
  Left = 565
  Top = 133
  Width = 309
  Height = 335
  Caption = 'EditService'
  Color = clBtnFace
  Constraints.MaxHeight = 335
  Constraints.MinHeight = 335
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    293
    299)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 64
    Height = 13
    Caption = 'Display Name'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 65
    Height = 13
    Caption = 'Service Name'
  end
  object Label3: TLabel
    Left = 8
    Top = 104
    Width = 55
    Height = 13
    Caption = 'Image Path'
  end
  object Label4: TLabel
    Left = 8
    Top = 152
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label5: TLabel
    Left = 8
    Top = 200
    Width = 40
    Height = 13
    Caption = 'Start Up'
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 279
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 8
    Top = 72
    Width = 279
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 8
    Top = 120
    Width = 279
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 8
    Top = 168
    Width = 279
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 216
    Width = 279
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 4
    Text = '2: Automatic'
    Items.Strings = (
      '2: Automatic'
      '3: Manual'
      '4: Disabled')
  end
  object Button1: TButton
    Left = 131
    Top = 248
    Width = 73
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 211
    Top = 248
    Width = 73
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    TabOrder = 6
    OnClick = Button2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 283
    Width = 293
    Height = 16
    Panels = <>
  end
end
