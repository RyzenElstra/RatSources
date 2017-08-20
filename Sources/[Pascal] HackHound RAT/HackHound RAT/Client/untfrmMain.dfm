object frmMain: TfrmMain
  Left = 201
  Top = 136
  Width = 824
  Height = 403
  Caption = 'HackHound [RAT] v0.1b'
  Color = clBtnFace
  Constraints.MinHeight = 396
  Constraints.MinWidth = 808
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000040040000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000002B5B
    E5962B5BE5FF2B5BE5FF2B5BE5962B5BE5962B5BE5FF2B5BE5FF2B5BE5962B5B
    E5962B5BE5FF2B5BE5FF2B5BE5962B5BE5962B5BE5FF2B5BE5FF2B5BE5962B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5962B5BE5FF2B5BE5FF2B5BE5962B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5BE5962B5BE5FF2B5BE5FF2B5BE5960000
    00000000000000000000000000002B5BE5FFFFFFFFFFFFFFFFFF2B5BE5FF2B5B
    E5FFFFFFFFFFFFFFFFFF2B5BE5FF000000000000000000000000000000000000
    00000000000000000000000000002B5BE5962B5BE5FF2B5BE5FF2B5BE5962B5B
    E5962B5BE5FF2B5BE5FF2B5BE596000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000F00F0000F00F0000FFFF0000}
  Menu = mnuFile
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    808
    347)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 9
    Width = 793
    Height = 313
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Connections'
      DesignSize = (
        785
        285)
      object lvConnections: TListView
        Left = 8
        Top = 8
        Width = 769
        Height = 273
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            Caption = 'Identification'
            Width = 90
          end
          item
            Caption = 'LAN'
            Width = 90
          end
          item
            Caption = 'WAN'
            Width = 90
          end
          item
            Caption = 'Username'
            Width = 80
          end
          item
            Caption = 'Computer'
            Width = 80
          end
          item
            Caption = 'Account Type'
            Width = 90
          end
          item
            Caption = 'OS'
            Width = 80
          end
          item
            Caption = 'Version'
            Width = 70
          end
          item
            Caption = 'Ping'
            Width = 80
          end>
        GridLines = True
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = lvConnectionsDblClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Stats'
      ImageIndex = 1
      DesignSize = (
        785
        285)
      object lvStats: TListView
        Left = 200
        Top = 8
        Width = 577
        Height = 273
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            Caption = 'Time'
            Width = 100
          end
          item
            Caption = 'Remote Host'
            Width = 100
          end
          item
            Caption = 'Description'
            Width = 360
          end>
        GridLines = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object chkSaveStatistics: TCheckBox
        Left = 8
        Top = 264
        Width = 153
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Save Statistics'
        TabOrder = 1
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 185
        Height = 57
        Caption = 'Connections'
        TabOrder = 2
        object lblTotalAttemptedConnections: TLabel
          Left = 8
          Top = 32
          Width = 153
          Height = 13
          Caption = 'Total Attempted Connections: 0'
        end
        object lblTotalSuccessfulConnections: TLabel
          Left = 8
          Top = 16
          Width = 152
          Height = 13
          Caption = 'Total Successful Connections: 0'
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 72
        Width = 185
        Height = 57
        Caption = 'Data'
        TabOrder = 3
        object lblTotalSentData: TLabel
          Left = 8
          Top = 16
          Width = 118
          Height = 13
          Caption = 'Total Sent Data: 0 Bytes'
        end
        object lblTotalReceivedData: TLabel
          Left = 8
          Top = 32
          Width = 140
          Height = 13
          Caption = 'Total Received Data: 0 Bytes'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Settings'
      ImageIndex = 2
      DesignSize = (
        785
        285)
      object GroupBox1: TGroupBox
        Left = 244
        Top = 72
        Width = 289
        Height = 137
        Anchors = []
        Caption = 'Settings'
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 124
          Height = 13
          Caption = 'Reverse Connection Port:'
        end
        object Label2: TLabel
          Left = 80
          Top = 40
          Width = 50
          Height = 13
          Caption = 'Password:'
        end
        object txtReverseConnectionPort: TEdit
          Left = 144
          Top = 16
          Width = 137
          Height = 21
          TabOrder = 0
          Text = '4182'
        end
        object txtPassword: TEdit
          Left = 144
          Top = 40
          Width = 113
          Height = 21
          TabOrder = 1
          Text = 'admin'
        end
        object chkHidePassword: TCheckBox
          Left = 264
          Top = 40
          Width = 17
          Height = 17
          TabOrder = 2
        end
        object chkNotifyOnNewConnection: TCheckBox
          Left = 8
          Top = 64
          Width = 273
          Height = 17
          Caption = 'Notify On New Connection'
          TabOrder = 3
        end
        object chkNotifyOnDisconnection: TCheckBox
          Left = 8
          Top = 80
          Width = 273
          Height = 17
          Caption = 'Notify On Disconnection'
          TabOrder = 4
        end
        object cmdSaveSettings: TButton
          Left = 160
          Top = 104
          Width = 123
          Height = 25
          Caption = 'Save Settings'
          TabOrder = 5
          OnClick = cmdSaveSettingsClick
        end
      end
    end
  end
  object SBMain: TStatusBar
    Left = 0
    Top = 328
    Width = 808
    Height = 19
    Panels = <
      item
        Text = 'Status: Idle...'
        Width = 630
      end
      item
        Text = 'Port: 4180'
        Width = 70
      end
      item
        Text = 'Connections: 0'
        Width = 50
      end>
    ParentShowHint = False
    ShowHint = False
  end
  object mnuFile: TMainMenu
    Left = 776
    object File1: TMenuItem
      Caption = 'File'
      object mnuNewServer: TMenuItem
        Caption = 'New Server'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuExit: TMenuItem
        Caption = 'Exit'
        OnClick = mnuExitClick
      end
    end
    object mnuPreferences: TMenuItem
      Caption = 'Preferences'
    end
    object mnuHelp: TMenuItem
      Caption = 'Help'
      object mnuHHRATHelp: TMenuItem
        Caption = 'HackHound [RAT] Help'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuAbout: TMenuItem
        Caption = 'About'
        OnClick = mnuAboutClick
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 752
  end
  object sckServer: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientDisconnect = sckServerClientDisconnect
    OnClientRead = sckServerClientRead
    OnClientError = sckServerClientError
    Left = 728
  end
end
