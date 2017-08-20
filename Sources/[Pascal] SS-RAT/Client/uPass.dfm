object Form13: TForm13
  Left = 391
  Top = 166
  Caption = 'Form13'
  ClientHeight = 527
  ClientWidth = 433
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
    433
    527)
  PixelsPerInch = 96
  TextHeight = 13
  object lv1: TListView
    Left = 8
    Top = 8
    Width = 421
    Height = 500
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'Type'
        Width = 100
      end
      item
        Caption = 'Username'
        Width = 100
      end
      item
        Caption = 'Password'
        Width = 100
      end
      item
        Caption = 'Additional'
        Width = 100
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    PopupMenu = pm1
    TabOrder = 0
    ViewStyle = vsReport
  end
  object stat1: TStatusBar
    Left = 0
    Top = 508
    Width = 433
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
  object pm1: TPopupMenu
    Left = 120
    Top = 120
    object MSNPasswords1: TMenuItem
      Caption = 'MSN Passwords'
      OnClick = MSNPasswords1Click
    end
    object Firefox1: TMenuItem
      Caption = 'Firefox Passwords'
      OnClick = Firefox1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Saveastxt1: TMenuItem
      Caption = 'Save as .txt'
      OnClick = Saveastxt1Click
    end
    object Clear1: TMenuItem
      Caption = 'Clear'
      OnClick = Clear1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object CopytoClipboard1: TMenuItem
      Caption = 'Copy to Clipboard'
      OnClick = CopytoClipboard1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    FileName = 'Passwords'
    Left = 136
    Top = 88
  end
end
