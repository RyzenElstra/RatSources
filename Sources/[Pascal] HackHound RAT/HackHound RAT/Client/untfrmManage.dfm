object frmManage: TfrmManage
  Left = 241
  Top = 140
  Width = 735
  Height = 404
  Caption = 'HackHound [RAT] v0.1b - [Managing - 127.0.0.1]'
  Color = clBtnFace
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
  OldCreateOrder = False
  DesignSize = (
    719
    368)
  PixelsPerInch = 96
  TextHeight = 13
  object GBTools: TGroupBox
    Left = 184
    Top = 8
    Width = 546
    Height = 370
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Tools'
    TabOrder = 4
    object PCTools: TPageControl
      Left = 8
      Top = 16
      Width = 513
      Height = 329
      ActivePage = TabSheet8
      TabOrder = 0
      object TabSheet8: TTabSheet
        Caption = 'Active Ports'
        object lvActivePorts: TListView
          Left = 0
          Top = 0
          Width = 505
          Height = 297
          Columns = <
            item
              Caption = 'Protocol'
              Width = 60
            end
            item
              Caption = 'Local IP'
              Width = 100
            end
            item
              Caption = 'Local Port'
              Width = 75
            end
            item
              Caption = 'Remote IP'
              Width = 100
            end
            item
              Caption = 'Remote Port'
              Width = 75
            end
            item
              Caption = 'Status'
              Width = 80
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object TabSheet9: TTabSheet
        Caption = 'Remote Shell'
        ImageIndex = 1
        object memRemoteShell: TMemo
          Left = 0
          Top = 0
          Width = 505
          Height = 297
          TabOrder = 0
        end
      end
    end
  end
  object GBAdministration: TGroupBox
    Left = 184
    Top = 8
    Width = 546
    Height = 370
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Administration'
    TabOrder = 6
    object GroupBox3: TGroupBox
      Left = 128
      Top = 136
      Width = 249
      Height = 81
      Caption = 'Administration'
      TabOrder = 0
      object txtID: TEdit
        Left = 8
        Top = 16
        Width = 153
        Height = 21
        TabOrder = 0
        Text = 'New ID'
      end
      object cmdEditID: TButton
        Left = 168
        Top = 16
        Width = 73
        Height = 25
        Caption = 'Edit ID'
        TabOrder = 1
      end
      object cmdUpdate: TButton
        Left = 8
        Top = 48
        Width = 73
        Height = 25
        Caption = 'Update'
        TabOrder = 2
      end
      object cmdRestart: TButton
        Left = 88
        Top = 48
        Width = 73
        Height = 25
        Caption = 'Restart'
        TabOrder = 3
        OnClick = cmdRestartClick
      end
      object cmdUninstall: TButton
        Left = 168
        Top = 48
        Width = 73
        Height = 25
        Caption = 'Uninstall'
        TabOrder = 4
      end
    end
  end
  object GBSurveillance: TGroupBox
    Left = 184
    Top = 8
    Width = 546
    Height = 370
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Surveillance'
    TabOrder = 5
    object PCSurveillance: TPageControl
      Left = 8
      Top = 16
      Width = 513
      Height = 329
      ActivePage = TabSheet10
      TabOrder = 0
      object TabSheet10: TTabSheet
        Caption = 'Keylogger'
        object memKeylogger: TMemo
          Left = 0
          Top = 0
          Width = 505
          Height = 297
          TabOrder = 0
        end
      end
      object TabSheet11: TTabSheet
        Caption = 'Screen Capture'
        ImageIndex = 1
        object Image1: TImage
          Left = 8
          Top = 0
          Width = 489
          Height = 265
        end
        object Label1: TLabel
          Left = 8
          Top = 280
          Width = 58
          Height = 13
          Caption = 'Interval (s):'
        end
        object lstInterval: TListBox
          Left = 72
          Top = 280
          Width = 41
          Height = 17
          ItemHeight = 13
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10')
          TabOrder = 0
        end
        object cmdStartCapture: TButton
          Left = 424
          Top = 272
          Width = 73
          Height = 25
          Caption = 'Start'
          TabOrder = 1
        end
        object cmdSingleCapture: TButton
          Left = 344
          Top = 272
          Width = 73
          Height = 25
          Caption = 'Single'
          TabOrder = 2
        end
      end
      object TabSheet12: TTabSheet
        Caption = 'Passwords'
        ImageIndex = 2
        object tvPasswords: TTreeView
          Left = 8
          Top = 8
          Width = 121
          Height = 289
          Indent = 19
          TabOrder = 0
          Items.Data = {
            03000000200000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
            0746697265666F782A0000000000000000000000FFFFFFFFFFFFFFFF00000000
            0000000011496E7465726E6574204578706C6F7265721E000000000000000000
            0000FFFFFFFFFFFFFFFF0000000000000000054F74686572}
        end
        object lvFirefoxPasswords: TListView
          Left = 136
          Top = 8
          Width = 361
          Height = 289
          Columns = <
            item
              Caption = 'Website'
              Width = 150
            end
            item
              Caption = 'Username'
              Width = 100
            end
            item
              Caption = 'Password'
              Width = 100
            end>
          GridLines = True
          TabOrder = 1
          ViewStyle = vsReport
        end
        object lvInternetExplorerPasswords: TListView
          Left = 136
          Top = 8
          Width = 361
          Height = 289
          Columns = <
            item
              Caption = 'Website'
              Width = 150
            end
            item
              Caption = 'Username'
              Width = 100
            end
            item
              Caption = 'Password'
              Width = 100
            end>
          GridLines = True
          TabOrder = 2
          ViewStyle = vsReport
        end
        object lvOtherPasswords: TListView
          Left = 136
          Top = 8
          Width = 361
          Height = 289
          Columns = <
            item
              Caption = 'Username'
              Width = 100
            end
            item
              Caption = 'Password'
              Width = 100
            end
            item
              Caption = 'Other'
              Width = 150
            end>
          GridLines = True
          TabOrder = 3
          ViewStyle = vsReport
        end
      end
    end
  end
  object GBManagers: TGroupBox
    Left = 184
    Top = 8
    Width = 529
    Height = 353
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Managers'
    TabOrder = 3
    DesignSize = (
      529
      353)
    object PCManagers: TPageControl
      Left = 8
      Top = 16
      Width = 513
      Height = 329
      ActivePage = TabSheet1
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Files'
        DesignSize = (
          505
          301)
        object txtCurrentFolder: TEdit
          Left = 32
          Top = 8
          Width = 377
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Enabled = False
          ReadOnly = True
          TabOrder = 0
          OnChange = txtCurrentFolderChange
        end
        object cmdListDrives: TButton
          Left = 416
          Top = 8
          Width = 81
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'List Drives'
          TabOrder = 1
          OnClick = cmdListDrivesClick
        end
        object cmdGoBack: TButton
          Left = 0
          Top = 8
          Width = 25
          Height = 25
          Caption = '<'
          Enabled = False
          TabOrder = 2
          OnClick = cmdGoBackClick
        end
        object Panel1: TPanel
          Left = 0
          Top = 40
          Width = 497
          Height = 257
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvNone
          TabOrder = 3
          object Splitter1: TSplitter
            Left = 137
            Top = 0
            Width = 9
            Height = 257
          end
          object tvFolders: TTreeView
            Left = 0
            Top = 0
            Width = 137
            Height = 257
            Align = alLeft
            Indent = 19
            PopupMenu = mnutvFolders
            TabOrder = 0
            OnDblClick = tvFoldersDblClick
          end
          object lvFiles: TListView
            Left = 146
            Top = 0
            Width = 351
            Height = 257
            Align = alClient
            Columns = <
              item
                Caption = 'Name'
                Width = 250
              end
              item
                Caption = 'Size'
                Width = 80
              end>
            GridLines = True
            PopupMenu = mnulvFiles
            TabOrder = 1
            ViewStyle = vsReport
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Registry'
        ImageIndex = 1
        object tvRegistry: TTreeView
          Left = 0
          Top = 8
          Width = 137
          Height = 289
          Indent = 19
          TabOrder = 0
        end
        object lvRegistry: TListView
          Left = 144
          Top = 8
          Width = 361
          Height = 289
          Columns = <
            item
              Caption = 'Name'
              Width = 130
            end
            item
              Caption = 'Type'
              Width = 100
            end
            item
              Caption = 'Data'
              Width = 100
            end>
          GridLines = True
          TabOrder = 1
          ViewStyle = vsReport
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Processes'
        ImageIndex = 2
        object lvProcesses: TListView
          Left = 0
          Top = 8
          Width = 505
          Height = 289
          Columns = <
            item
              Caption = 'Image Name'
              Width = 100
            end
            item
              Caption = 'Path'
              Width = 300
            end
            item
              Caption = 'PID'
              Width = 60
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Services'
        ImageIndex = 3
        object lvServices: TListView
          Left = 0
          Top = 8
          Width = 505
          Height = 289
          Columns = <
            item
              Caption = 'Display Name'
              Width = 100
            end
            item
              Caption = 'Service Name'
              Width = 100
            end
            item
              Caption = 'Path'
              Width = 150
            end
            item
              Caption = 'Description'
              Width = 150
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Devices'
        ImageIndex = 4
        object tvDevices: TTreeView
          Left = 0
          Top = 8
          Width = 505
          Height = 289
          Indent = 19
          TabOrder = 0
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Installed Apps'
        ImageIndex = 5
        object ListView2: TListView
          Left = 0
          Top = 8
          Width = 505
          Height = 289
          Columns = <
            item
              Caption = 'Name'
              Width = 200
            end
            item
              Caption = 'Uninstall Path'
              Width = 300
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object TabSheet7: TTabSheet
        Caption = 'Windows'
        ImageIndex = 6
        object lvWindows: TListView
          Left = 0
          Top = 8
          Width = 505
          Height = 289
          Columns = <
            item
              Caption = 'Window Name'
              Width = 400
            end
            item
              Caption = 'Handle'
              Width = 100
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
  end
  object cmbManage: TComboBox
    Left = 8
    Top = 8
    Width = 169
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = cmbManageChange
    Items.Strings = (
      'Administration'
      'Managers'
      'Surveillance'
      'Tools')
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 40
    Width = 169
    Height = 161
    Caption = 'System Information'
    TabOrder = 1
    object lvSystemInformation: TListView
      Left = 8
      Top = 16
      Width = 153
      Height = 137
      Columns = <
        item
          Caption = 'Name'
          Width = 70
        end
        item
          Caption = 'Value'
          Width = 70
        end>
      GridLines = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 208
    Width = 169
    Height = 153
    Caption = 'Server Settings'
    TabOrder = 2
    object lvServerSettings: TListView
      Left = 8
      Top = 16
      Width = 153
      Height = 129
      Columns = <
        item
          Caption = 'Name'
          Width = 70
        end
        item
          Caption = 'Value'
          Width = 70
        end>
      GridLines = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object mnutvFolders: TPopupMenu
    Left = 688
    object mnutvFoldersRefresh: TMenuItem
      Caption = 'Refresh'
      OnClick = mnutvFoldersRefreshClick
    end
  end
  object mnulvFiles: TPopupMenu
    Left = 672
    object mnulvFilesUpload: TMenuItem
      Caption = 'Upload'
    end
    object mnulvFilesDownload: TMenuItem
      Caption = 'Download'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnulvFilesDelete: TMenuItem
      Caption = 'Delete'
      OnClick = mnulvFilesDeleteClick
    end
    object mnulvFilesExecute: TMenuItem
      Caption = 'Execute'
      object mnuExecuteHidden: TMenuItem
        Caption = 'Hidden'
      end
      object mnuExecuteVisible: TMenuItem
        Caption = 'Visible'
      end
    end
  end
end
