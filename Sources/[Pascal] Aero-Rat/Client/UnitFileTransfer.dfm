object FileTransfer: TFileTransfer
  Left = 347
  Top = 284
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'FileTransfer'
  ClientHeight = 112
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    342
    112)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 58
    Height = 13
    Caption = 'Local Name:'
  end
  object Label3: TLabel
    Left = 8
    Top = 32
    Width = 62
    Height = 13
    Caption = 'Speed: 0 kbs'
  end
  object Label4: TLabel
    Left = 8
    Top = 56
    Width = 125
    Height = 13
    Caption = 'Time Remaining: 00:00:00'
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 80
    Width = 325
    Height = 17
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 160
    Top = 24
  end
end
