object Form18: TForm18
  Left = 0
  Top = 0
  Caption = 'Form18'
  ClientHeight = 342
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    332
    342)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 335
    Height = 294
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 3
    Top = 300
    Width = 329
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    Color = clBlack
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyDown = Edit1KeyDown
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 323
    Width = 332
    Height = 19
    Panels = <
      item
        Text = '0'
        Width = 50
      end
      item
        Text = '127.0.0.1'
        Width = 50
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 192
    Top = 168
    object Activate1: TMenuItem
      Caption = 'Activate'
      OnClick = Activate1Click
    end
    object Close1: TMenuItem
      Caption = 'Close'
      Enabled = False
      OnClick = Close1Click
    end
  end
end
