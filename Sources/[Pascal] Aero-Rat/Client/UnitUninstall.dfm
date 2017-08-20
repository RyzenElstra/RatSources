object UninstallForm: TUninstallForm
  Left = 267
  Top = 163
  BorderStyle = bsDialog
  Caption = 'Uninstall'
  ClientHeight = 65
  ClientWidth = 217
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 204
    Height = 13
    Caption = 'Are you sure you want to remove server ?'
  end
  object Button1: TButton
    Left = 112
    Top = 32
    Width = 65
    Height = 25
    Caption = 'Cancel'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 32
    Width = 65
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button2Click
  end
end
