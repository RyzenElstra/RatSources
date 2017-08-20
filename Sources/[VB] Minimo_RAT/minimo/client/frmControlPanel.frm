VERSION 5.00
Begin VB.Form frmControlPanel
  Caption = "MiniMo Control Panel"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  BorderStyle = 1 'Fixed Single
  Icon = "frmControlPanel.frx":0
  LinkTopic = "Form2"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 45
  ClientTop = 330
  ClientWidth = 5295
  ClientHeight = 5355
  BeginProperty Font
    Name = "Tahoma"
    Size = 8.25
    Charset = 0
    Weight = 400
    Underline = 0 'False
    Italic = 0 'False
    Strikethrough = 0 'False
  EndProperty
  WhatsThisHelp = -1  'True
  StartUpPosition = 1 'CenterOwner
  Begin VB.CheckBox chkFortoBook
    Caption = "Automatically add forward connections to address book"
    Left = 6240
    Top = 1440
    Width = 4575
    Height = 195
    Enabled = 0   'False
    TabIndex = 39
    Value = 1
  End
  Begin VB.CheckBox chkRevtoBook
    Caption = "Automatically add reverse connections to address book"
    Left = 6240
    Top = 1200
    Width = 4575
    Height = 195
    Enabled = 0   'False
    TabIndex = 38
    Value = 1
  End
  Begin VB.Frame Frame3
    Caption = "Keylogger"
    Left = 5280
    Top = 6960
    Width = 5055
    Height = 615
    TabIndex = 29
    Begin VB.TextBox txtKeyMax
      Left = 2640
      Top = 195
      Width = 615
      Height = 285
      Text = "20"
      TabIndex = 30
      Alignment = 2 'Center
    End
    Begin VB.Label Label3
      Caption = "Log keys in packets of"
      Left = 960
      Top = 240
      Width = 1815
      Height = 255
      TabIndex = 32
    End
    Begin VB.Label Label6
      Caption = "characters"
      Left = 3360
      Top = 240
      Width = 975
      Height = 255
      TabIndex = 31
    End
  End
  Begin MSComctlLib.Toolbar Toolbar1
    Left = 0
    Top = 0
    Width = 5295
    Height = 360
    TabIndex = 0
  End
  Begin MSComctlLib.ImageList ImageList2
  End
  Begin MSComctlLib.StatusBar StatusBar1
    Left = 0
    Top = 5100
    Width = 5295
    Height = 255
    TabIndex = 5
  End
  Begin VB.Frame Frame1
    Index = 2
    Left = 0
    Top = 280
    Width = 5295
    Height = 4815
    Visible = 0   'False
    TabIndex = 6
    Begin VB.Frame Frame10
      Caption = "Client Options "
      Left = 120
      Top = 3000
      Width = 5055
      Height = 1695
      TabIndex = 54
      Begin VB.CheckBox chkMinimize
        Caption = "When client is closed, minimize to tray rather than exit"
        Left = 120
        Top = 240
        Width = 4815
        Height = 255
        TabIndex = 59
      End
      Begin VB.CheckBox chkConsole
        Caption = "Log activity in data console"
        Left = 120
        Top = 510
        Width = 3615
        Height = 195
        TabIndex = 58
        Value = 1
      End
      Begin VB.CheckBox chkStats
        Caption = "Enable MiniMo client stats."
        Left = 120
        Top = 750
        Width = 4695
        Height = 195
        TabIndex = 57
        Value = 1
      End
      Begin VB.CheckBox chkDock
        Caption = "Sub forms dock to main client form."
        Left = 120
        Top = 990
        Width = 4455
        Height = 195
        TabIndex = 56
      End
      Begin VB.CheckBox chkMeep
        Caption = "Send Meep/Moop commands to servers on 6 min. interval."
        Left = 120
        Top = 1230
        Width = 4575
        Height = 195
        TabIndex = 55
      End
    End
    Begin VB.Frame Frame8
      Caption = "Server Display Name "
      Left = 120
      Top = 240
      Width = 5055
      Height = 975
      TabIndex = 44
      Begin VB.TextBox txtDispName
        Left = 3840
        Top = 320
        Width = 975
        Height = 285
        Text = "%CN"
        TabIndex = 45
      End
      Begin VB.CheckBox chkClicks
        Caption = "Change display name when servers connect:"
        Left = 120
        Top = 360
        Width = 3855
        Height = 195
        TabIndex = 46
        Value = 1
      End
      Begin VB.Label Label2
        Caption = "You can use any of MiniMo's global variables for this value"
        ForeColor = &H404040&
        Left = 360
        Top = 640
        Width = 4335
        Height = 255
        TabIndex = 47
      End
    End
    Begin VB.Frame Frame9
      Caption = "Automate Client Functions "
      Left = 120
      Top = 1320
      Width = 5055
      Height = 1575
      TabIndex = 48
      Begin VB.CheckBox chkAutodlkeylog
        Caption = "Automatically download remote keylog file on connection"
        Left = 120
        Top = 1200
        Width = 4815
        Height = 195
        TabIndex = 53
      End
      Begin VB.CheckBox chkNoAnnoy
        Caption = "Automatically start transfer sessions without prompting."
        Left = 120
        Top = 480
        Width = 4455
        Height = 195
        TabIndex = 52
      End
      Begin VB.CheckBox chkCloseDownload
        Caption = "Automatically close transfer sessions when complete."
        Left = 120
        Top = 720
        Width = 4575
        Height = 195
        TabIndex = 51
      End
      Begin VB.CheckBox chkSaveInfo
        Caption = "Automatically save PC info to a .log file"
        Left = 120
        Top = 960
        Width = 4815
        Height = 195
        TabIndex = 50
      End
      Begin VB.CheckBox chkSmartBrowser
        Caption = "Automatically trim Directory Images upon new connections"
        Left = 120
        Top = 240
        Width = 4695
        Height = 195
        TabIndex = 49
        Value = 1
      End
    End
  End
  Begin VB.Frame Frame1
    Index = 1
    Left = 0
    Top = 280
    Width = 5295
    Height = 4815
    Visible = 0   'False
    TabIndex = 2
    Begin VB.CommandButton cmdSave
      Caption = "Save these settings as default"
      Index = 0
      Left = 120
      Top = 240
      Width = 5040
      Height = 255
      TabIndex = 9
    End
    Begin VB.TextBox txtInfo
      Left = 120
      Top = 600
      Width = 5055
      Height = 4095
      Text = "-----------------------------------------------------------------------\n{ FROM: %MDN% (%MIP%)(%MDT%)}\n-----------------------------------------------------------------------\nVersion = %VE\nUsername = %UN\nComputerName = %CN\nProcessor = %CP / [ENV]NUMBER_OF_PROCESSORS[/ENV]\nOS = %OS\nConnection = %CT\nPC Running for = %RT\nMail Clients = %MC\nServer Name = %FN\nServer Port = %PT\nDate/Time = %DT\nWindir = %WD\nSysdir = %SD\nIE URL = %WP\nMemory Used = %MU MB\nInstall Date = %IT\nFile run = %IF[e][e]\n"
      TabIndex = 3
      MultiLine = -1  'True
      ScrollBars = 2
    End
  End
  Begin VB.Frame Frame1
    Index = 4
    Left = 0
    Top = 280
    Width = 5295
    Height = 4815
    Visible = 0   'False
    TabIndex = 10
    Begin VB.CommandButton cmdDelete
      Caption = "Delete all MiniMo settings from Registry (restore default)"
      Left = 240
      Top = 3840
      Width = 4815
      Height = 255
      TabIndex = 21
    End
    Begin VB.CheckBox chkRevPass
      Caption = "Prompt me for password on each reverse connection"
      Left = 240
      Top = 2640
      Width = 4695
      Height = 255
      TabIndex = 19
      Value = 1
    End
    Begin VB.CheckBox chkGrantHook
      Caption = "Automatically grant Addins hooking rights without asking"
      Left = 240
      Top = 2280
      Width = 4815
      Height = 255
      TabIndex = 16
    End
    Begin VB.CheckBox chkPreviewDDE
      Caption = "Preview each command that AddIns try to send to servers"
      Left = 240
      Top = 1680
      Width = 4695
      Height = 255
      TabIndex = 14
    End
    Begin VB.CheckBox chkCryptAddy
      Caption = "Encrypt address book data when saved."
      Left = 240
      Top = 1320
      Width = 4815
      Height = 195
      TabIndex = 13
      Value = 1
    End
    Begin VB.CheckBox chkExecute
      Caption = "Automatically run these file types after downloaded:"
      Left = 240
      Top = 480
      Width = 4695
      Height = 195
      TabIndex = 12
      Value = 1
    End
    Begin VB.TextBox txtExecute
      Left = 480
      Top = 840
      Width = 4575
      Height = 285
      Text = "txt,gif,jpg,log,bmp,jpeg,avi,mpg,wav,mp3"
      TabIndex = 11
    End
    Begin VB.Label Label10
      Caption = "(otherwise the text in the password text box will automatically be sent)"
      ForeColor = &H404040&
      Left = 600
      Top = 2880
      Width = 4095
      Height = 375
      TabIndex = 20
    End
    Begin VB.Label Label7
      Caption = "Open console to view Addin --> Client commands"
      ForeColor = &H404040&
      Left = 600
      Top = 1920
      Width = 4095
      Height = 255
      TabIndex = 15
    End
  End
  Begin VB.Frame Frame1
    Index = 0
    Left = 0
    Top = 280
    Width = 5295
    Height = 4815
    TabIndex = 1
    Begin VB.Frame Frame7
      Caption = "Local"
      Left = 4080
      Top = 120
      Width = 975
      Height = 615
      TabIndex = 42
      Begin VB.TextBox txtListenPort
        Left = 120
        Top = 240
        Width = 735
        Height = 285
        Text = "40123"
        TabIndex = 43
        Alignment = 2 'Center
        ToolTipText = "main client port"
      End
    End
    Begin VB.Frame Frame6
      Caption = "Disallow connections/notifications from: "
      Left = 120
      Top = 3600
      Width = 5055
      Height = 1095
      TabIndex = 40
      Begin VB.TextBox txtBlocks
        ForeColor = &H404040&
        Left = 120
        Top = 240
        Width = 4815
        Height = 735
        Text = "Separate each IP with a comma\n"
        TabIndex = 41
        MultiLine = -1  'True
      End
    End
    Begin VB.Frame Frame2
      Caption = "Server Chat"
      Left = 120
      Top = 2280
      Width = 5055
      Height = 1215
      TabIndex = 33
      Begin VB.TextBox txtChatName
        Left = 1920
        Top = 360
        Width = 1215
        Height = 285
        Text = "Admin"
        TabIndex = 35
      End
      Begin VB.TextBox txtCaption
        Left = 1920
        Top = 720
        Width = 2895
        Height = 285
        Text = "Windows Chat"
        TabIndex = 34
      End
      Begin VB.Label Label4
        Caption = "Your chat Nickname:"
        Left = 360
        Top = 360
        Width = 1575
        Height = 255
        TabIndex = 37
      End
      Begin VB.Label Label5
        Caption = "Chat window caption:"
        Left = 240
        Top = 720
        Width = 1815
        Height = 255
        TabIndex = 36
      End
    End
    Begin VB.CheckBox chkOrder
      Caption = "Reverse connect new ports first ( forward is default )"
      Left = 240
      Top = 1920
      Width = 4815
      Height = 195
      TabIndex = 28
    End
    Begin VB.Frame Frame5
      Caption = "Local"
      Left = 4080
      Top = 840
      Width = 975
      Height = 975
      TabIndex = 25
      Begin VB.TextBox txtportcaplocal
        Left = 120
        Top = 600
        Width = 735
        Height = 285
        Text = "0"
        TabIndex = 27
        Alignment = 2 'Center
        ToolTipText = "local screen capture port"
      End
      Begin VB.TextBox txtportfilelocal
        Left = 120
        Top = 240
        Width = 735
        Height = 285
        Text = "0"
        TabIndex = 26
        Alignment = 2 'Center
        ToolTipText = "local file transfer port"
      End
    End
    Begin VB.Frame Frame4
      Caption = "Remote"
      Left = 3000
      Top = 840
      Width = 975
      Height = 975
      TabIndex = 22
      Begin VB.TextBox txtportcap
        Left = 120
        Top = 600
        Width = 735
        Height = 285
        Text = "40888"
        TabIndex = 24
        Alignment = 2 'Center
        ToolTipText = "Remote screen capture port"
      End
      Begin VB.TextBox txtportfile
        Left = 120
        Top = 240
        Width = 735
        Height = 285
        Text = "40887"
        TabIndex = 23
        Alignment = 2 'Center
        ToolTipText = "Remote file transfer port"
      End
    End
    Begin VB.Label Label9
      Caption = "Open new port for File Transfers:"
      Left = 120
      Top = 1125
      Width = 2775
      Height = 255
      TabIndex = 18
      Alignment = 1 'Right Justify
    End
    Begin VB.Label Label8
      Caption = "Open new port for Screen Captures:"
      Left = 120
      Top = 1485
      Width = 2775
      Height = 255
      TabIndex = 17
      Alignment = 1 'Right Justify
    End
    Begin VB.Label Label1
      Caption = "Listen for servers on port:"
      Left = 1320
      Top = 360
      Width = 2655
      Height = 255
      TabIndex = 4
      Alignment = 1 'Right Justify
    End
  End
  Begin VB.Frame Frame1
    Index = 3
    Left = 0
    Top = 280
    Width = 5295
    Height = 4815
    Visible = 0   'False
    TabIndex = 7
    Begin VB.TextBox txtStats
      BackColor = &H8000000F&
      ForeColor = &H404040&
      Left = 120
      Top = 240
      Width = 5055
      Height = 4455
      Text = "MiniMo Statistics\n"
      TabIndex = 8
      MultiLine = -1  'True
      ScrollBars = 2
      Locked = -1  'True
    End
  End
End

Attribute VB_Name = "frmControlPanel"

Private Sub txtportcaplocal__4FDB50
  '004FDB50: push ebp
  '004FDB51: mov ebp, esp
  '004FDB53: sub esp, 0000000Ch
  '004FDB56: push 004081B6h
  '004FDB5B: mov eax, fs:[00h]
  '004FDB61: push eax
  '004FDB62: mov fs:[00000000h], esp
  '004FDB69: sub esp, 00000008h
  '004FDB6C: push ebx
  '004FDB6D: push esi
  '004FDB6E: push edi
  '004FDB6F: mov [ebp-0Ch], esp
  '004FDB72: mov [ebp-08h], 00405BE0h
  '004FDB79: mov eax, [ebp+08h]
  '004FDB7C: mov ecx, eax
  '004FDB7E: and ecx, 00000001h
  '004FDB81: mov [ebp-04h], ecx
  '004FDB84: and al, FEh
  '004FDB86: push eax
  '004FDB87: mov [ebp+08h], eax
  '004FDB8A: mov edx, [eax]
  '004FDB8C: call [edx+04h]
  '004FDB8F: mov esi, [ebp+0Ch]
  '004FDB92: xor ecx, ecx
  '004FDB94: mov ax, [esi]
  '004FDB97: cmp ax, 0039h
  '004FDB9B: setle cl
  '004FDB9E: xor edx, edx
  '004FDBA0: cmp ax, 0030h
  '004FDBA4: setnl dl
  '004FDBA7: and ecx, edx
  '004FDBA9: neg ecx
  '004FDBAB: sbb ecx, ecx
  '004FDBAD: xor edx, edx
  '004FDBAF: neg ecx
  '004FDBB1: cmp ax, 0008h
  '004FDBB5: setz dl
  '004FDBB8: or ecx, edx
  '004FDBBA: jnz 4FDBC1h
  '004FDBBC: mov word ptr [esi], 0000h
  '004FDBC1: mov [ebp-04h], 00000000h
  '004FDBC8: mov eax, [ebp+08h]
  '004FDBCB: push eax
  '004FDBCC: mov ecx, [eax]
  '004FDBCE: call [ecx+08h]
  '004FDBD1: mov eax, [ebp-04h]
  '004FDBD4: mov ecx, [ebp-14h]
  '004FDBD7: pop edi
  '004FDBD8: pop esi
  '004FDBD9: mov fs:[00000000h], ecx
  '004FDBE0: pop ebx
  '004FDBE1: mov esp, ebp
  '004FDBE3: pop ebp
  '004FDBE4: retn 0008h
End Sub
Private Sub txtportfile__4FDBF0
  '004FDBF0: push ebp
  '004FDBF1: mov ebp, esp
  '004FDBF3: sub esp, 0000000Ch
  '004FDBF6: push 004081B6h
  '004FDBFB: mov eax, fs:[00h]
  '004FDC01: push eax
  '004FDC02: mov fs:[00000000h], esp
  '004FDC09: sub esp, 00000008h
  '004FDC0C: push ebx
  '004FDC0D: push esi
  '004FDC0E: push edi
  '004FDC0F: mov [ebp-0Ch], esp
  '004FDC12: mov [ebp-08h], 00405BE8h
  '004FDC19: mov eax, [ebp+08h]
  '004FDC1C: mov ecx, eax
  '004FDC1E: and ecx, 00000001h
  '004FDC21: mov [ebp-04h], ecx
  '004FDC24: and al, FEh
  '004FDC26: push eax
  '004FDC27: mov [ebp+08h], eax
  '004FDC2A: mov edx, [eax]
  '004FDC2C: call [edx+04h]
  '004FDC2F: mov esi, [ebp+0Ch]
  '004FDC32: xor ecx, ecx
  '004FDC34: mov ax, [esi]
  '004FDC37: cmp ax, 0039h
  '004FDC3B: setle cl
  '004FDC3E: xor edx, edx
  '004FDC40: cmp ax, 0030h
  '004FDC44: setnl dl
  '004FDC47: and ecx, edx
  '004FDC49: neg ecx
  '004FDC4B: sbb ecx, ecx
  '004FDC4D: xor edx, edx
  '004FDC4F: neg ecx
  '004FDC51: cmp ax, 0008h
  '004FDC55: setz dl
  '004FDC58: or ecx, edx
  '004FDC5A: jnz 4FDC61h
  '004FDC5C: mov word ptr [esi], 0000h
  '004FDC61: mov [ebp-04h], 00000000h
  '004FDC68: mov eax, [ebp+08h]
  '004FDC6B: push eax
  '004FDC6C: mov ecx, [eax]
  '004FDC6E: call [ecx+08h]
  '004FDC71: mov eax, [ebp-04h]
  '004FDC74: mov ecx, [ebp-14h]
  '004FDC77: pop edi
  '004FDC78: pop esi
  '004FDC79: mov fs:[00000000h], ecx
  '004FDC80: pop ebx
  '004FDC81: mov esp, ebp
  '004FDC83: pop ebp
  '004FDC84: retn 0008h
End Sub
Private Sub txtportcap__4FDAB0
  '004FDAB0: push ebp
  '004FDAB1: mov ebp, esp
  '004FDAB3: sub esp, 0000000Ch
  '004FDAB6: push 004081B6h
  '004FDABB: mov eax, fs:[00h]
  '004FDAC1: push eax
  '004FDAC2: mov fs:[00000000h], esp
  '004FDAC9: sub esp, 00000008h
  '004FDACC: push ebx
  '004FDACD: push esi
  '004FDACE: push edi
  '004FDACF: mov [ebp-0Ch], esp
  '004FDAD2: mov [ebp-08h], 00405BD8h
  '004FDAD9: mov eax, [ebp+08h]
  '004FDADC: mov ecx, eax
  '004FDADE: and ecx, 00000001h
  '004FDAE1: mov [ebp-04h], ecx
  '004FDAE4: and al, FEh
  '004FDAE6: push eax
  '004FDAE7: mov [ebp+08h], eax
  '004FDAEA: mov edx, [eax]
  '004FDAEC: call [edx+04h]
  '004FDAEF: mov esi, [ebp+0Ch]
  '004FDAF2: xor ecx, ecx
  '004FDAF4: mov ax, [esi]
  '004FDAF7: cmp ax, 0039h
  '004FDAFB: setle cl
  '004FDAFE: xor edx, edx
  '004FDB00: cmp ax, 0030h
  '004FDB04: setnl dl
  '004FDB07: and ecx, edx
  '004FDB09: neg ecx
  '004FDB0B: sbb ecx, ecx
  '004FDB0D: xor edx, edx
  '004FDB0F: neg ecx
  '004FDB11: cmp ax, 0008h
  '004FDB15: setz dl
  '004FDB18: or ecx, edx
  '004FDB1A: jnz 4FDB21h
  '004FDB1C: mov word ptr [esi], 0000h
  '004FDB21: mov [ebp-04h], 00000000h
  '004FDB28: mov eax, [ebp+08h]
  '004FDB2B: push eax
  '004FDB2C: mov ecx, [eax]
  '004FDB2E: call [ecx+08h]
  '004FDB31: mov eax, [ebp-04h]
  '004FDB34: mov ecx, [ebp-14h]
  '004FDB37: pop edi
  '004FDB38: pop esi
  '004FDB39: mov fs:[00000000h], ecx
  '004FDB40: pop ebx
  '004FDB41: mov esp, ebp
  '004FDB43: pop ebp
  '004FDB44: retn 0008h
End Sub
Private Sub Form__4FBF90
  '004FBF90: push ebp
  '004FBF91: mov ebp, esp
  '004FBF93: sub esp, 00000018h
  '004FBF96: push 004081B6h
  '004FBF9B: mov eax, fs:[00h]
  '004FBFA1: push eax
  '004FBFA2: mov fs:[00000000h], esp
  '004FBFA9: mov eax, 00000070h
  '004FBFAE: call 004081B0h
  '004FBFB3: push ebx
  '004FBFB4: push esi
  '004FBFB5: push edi
  '004FBFB6: mov [ebp-18h], esp
  '004FBFB9: mov [ebp-14h], 00405B08h
  '004FBFC0: mov eax, [ebp+08h]
  '004FBFC3: and eax, 00000001h
  '004FBFC6: mov [ebp-10h], eax
  '004FBFC9: mov ecx, [ebp+08h]
  '004FBFCC: and ecx, FFFFFFFEh
  '004FBFCF: mov [ebp+08h], ecx
  '004FBFD2: mov [ebp-0Ch], 00000000h
  '004FBFD9: mov edx, [ebp+08h]
  '004FBFDC: mov eax, [edx]
  '004FBFDE: mov ecx, [ebp+08h]
  '004FBFE1: push ecx
  '004FBFE2: call [eax+04h]
  '004FBFE5: mov [ebp-04h], 00000001h
  '004FBFEC: mov [ebp-04h], 00000002h
  '004FBFF3: push FFFFFFFFh
  '004FBFF5: call [004010E8h]
  '004FBFFB: mov [ebp-04h], 00000003h
  '004FC002: lea edx, [ebp-38h]
  '004FC005: push edx
  '004FC006: mov eax, [ebp+08h]
  '004FC009: mov ecx, [eax]
  '004FC00B: mov edx, [ebp+08h]
  '004FC00E: push edx
  '004FC00F: call [ecx+00000218h]
  '004FC015: fclex 
  '004FC017: mov [ebp-60h], eax
  '004FC01A: cmp [ebp-60h], 00000000h
  '004FC01E: jnl 4FC040h
  '004FC020: push 00000218h
  '004FC025: push 0041DE38h
  '004FC02A: mov eax, [ebp+08h]
  '004FC02D: push eax
  '004FC02E: mov ecx, [ebp-60h]
  '004FC031: push ecx
  '004FC032: call [004010A0h]
  '004FC038: mov [ebp-0000008Ch], eax
  '004FC03E: jmp 4FC04Ah
  '004FC040: mov [ebp-0000008Ch], 00000000h
  '004FC04A: mov edx, [ebp-38h]
  '004FC04D: mov [ebp-00000088h], edx
  '004FC053: mov [ebp-38h], 00000000h
  '004FC05A: mov eax, [ebp-00000088h]
  '004FC060: push eax
  '004FC061: lea ecx, [ebp-68h]
  '004FC064: push ecx
  '004FC065: call [004010E4h]
  '004FC06B: push eax
  '004FC06C: lea edx, [ebp-28h]
  '004FC06F: push edx
  '004FC070: lea eax, [ebp-6Ch]
  '004FC073: push eax
  '004FC074: push 0041F304h
  '004FC079: call [004010CCh]
  '004FC07F: mov [ebp-00000084h], eax
  '004FC085: jmp 004FC120h
  '004FC08A: mov [ebp-04h], 00000004h
  '004FC091: push 00420F60h
  '004FC096: mov ecx, [ebp-28h]
  '004FC099: push ecx
  '004FC09A: call [00401278h]
  '004FC0A0: movsx esi, ax
  '004FC0A3: neg esi
  '004FC0A5: sbb esi, esi
  '004FC0A7: inc esi
  '004FC0A8: push 0041E3FCh
  '004FC0AD: mov edx, [ebp-28h]
  '004FC0B0: push edx
  '004FC0B1: call [00401278h]
  '004FC0B7: movsx eax, ax
  '004FC0BA: neg eax
  '004FC0BC: sbb eax, eax
  '004FC0BE: inc eax
  '004FC0BF: and esi, eax
  '004FC0C1: test esi, esi
  '004FC0C3: jnz 4FC100h
  '004FC0C5: mov [ebp-04h], 00000005h
  '004FC0CC: push 00000000h
  '004FC0CE: push 00420F70h
  '004FC0D3: mov ecx, [ebp-28h]
  '004FC0D6: push ecx
  '004FC0D7: lea edx, [ebp-48h]
  '004FC0DA: push edx
  '004FC0DB: call [00401368h]
  '004FC0E1: add esp, 00000010h
  '004FC0E4: push eax
  '004FC0E5: call [0040130Ch]
  '004FC0EB: mov [ebp-5Ch], eax
  '004FC0EE: lea eax, [ebp-5Ch]
  '004FC0F1: push eax
  '004FC0F2: call 004EB0B0h
  '004FC0F7: lea ecx, [ebp-48h]
  '004FC0FA: call [00401030h]
  '004FC100: mov [ebp-04h], 00000007h
  '004FC107: lea ecx, [ebp-28h]
  '004FC10A: push ecx
  '004FC10B: lea edx, [ebp-6Ch]
  '004FC10E: push edx
  '004FC10F: push 0041F304h
  '004FC114: call [00401150h]
  '004FC11A: mov [ebp-00000084h], eax
  '004FC120: cmp [ebp-00000084h], 00000000h
  '004FC127: jnz 004FC08Ah
  '004FC12D: mov [ebp-04h], 00000008h
  '004FC134: mov [ebp-50h], 80020004h
  '004FC13B: mov [ebp-58h], 0000000Ah
  '004FC142: mov eax, 00000010h
  '004FC147: call 004081B0h
  '004FC14C: mov eax, esp
  '004FC14E: mov ecx, [ebp-58h]
  '004FC151: mov [eax], ecx
  '004FC153: mov edx, [ebp-54h]
  '004FC156: mov [eax+04h], edx
  '004FC159: mov ecx, [ebp-50h]
  '004FC15C: mov [eax+08h], ecx
  '004FC15F: mov edx, [ebp-4Ch]
  '004FC162: mov [eax+0Ch], edx
  '004FC165: push 004281F4h
  '004FC16A: push 0041EA6Ch
  '004FC16F: push 0041EA58h
  '004FC174: call [00401314h]
  '004FC17A: mov edx, eax
  '004FC17C: lea ecx, [ebp-24h]
  '004FC17F: call [00401378h]
  '004FC185: mov [ebp-04h], 00000009h
  '004FC18C: mov eax, [ebp-24h]
  '004FC18F: push eax
  '004FC190: call [0040107Ch]
  '004FC196: mov edx, eax
  '004FC198: lea ecx, [ebp-34h]
  '004FC19B: call [00401378h]
  '004FC1A1: push eax
  '004FC1A2: call [00401044h]
  '004FC1A8: neg eax
  '004FC1AA: sbb eax, eax
  '004FC1AC: neg eax
  '004FC1AE: neg eax
  '004FC1B0: mov [ebp-60h], ax
  '004FC1B4: lea ecx, [ebp-34h]
  '004FC1B7: call [004013B4h]
  '004FC1BD: movsx ecx, word ptr [ebp-60h]
  '004FC1C1: test ecx, ecx
  '004FC1C3: jz 4FC23Ah
  '004FC1C5: mov [ebp-04h], 0000000Ah
  '004FC1CC: mov edx, [ebp+08h]
  '004FC1CF: mov eax, [edx]
  '004FC1D1: mov ecx, [ebp+08h]
  '004FC1D4: push ecx
  '004FC1D5: call [eax+0000035Ch]
  '004FC1DB: push eax
  '004FC1DC: lea edx, [ebp-38h]
  '004FC1DF: push edx
  '004FC1E0: call [004010E4h]
  '004FC1E6: mov [ebp-60h], eax
  '004FC1E9: mov eax, [ebp-24h]
  '004FC1EC: push eax
  '004FC1ED: mov ecx, [ebp-60h]
  '004FC1F0: mov edx, [ecx]
  '004FC1F2: mov eax, [ebp-60h]
  '004FC1F5: push eax
  '004FC1F6: call [edx+000000A4h]
  '004FC1FC: fclex 
  '004FC1FE: mov [ebp-64h], eax
  '004FC201: cmp [ebp-64h], 00000000h
  '004FC205: jnl 4FC227h
  '004FC207: push 000000A4h
  '004FC20C: push 0041E3FCh
  '004FC211: mov ecx, [ebp-60h]
  '004FC214: push ecx
  '004FC215: mov edx, [ebp-64h]
  '004FC218: push edx
  '004FC219: call [004010A0h]
  '004FC21F: mov [ebp-00000090h], eax
  '004FC225: jmp 4FC231h
  '004FC227: mov [ebp-00000090h], 00000000h
  '004FC231: lea ecx, [ebp-38h]
  '004FC234: call [004013B8h]
  '004FC23A: mov [ebp-04h], 0000000Ch
  '004FC241: call [00401104h]
  '004FC247: mov [ebp-10h], 00000000h
  '004FC24E: push 004FC2A0h
  '004FC253: jmp 4FC271h
  '004FC255: lea ecx, [ebp-34h]
  '004FC258: call [004013B4h]
  '004FC25E: lea ecx, [ebp-38h]
  '004FC261: call [004013B8h]
  '004FC267: lea ecx, [ebp-48h]
  '004FC26A: call [00401030h]
  '004FC270: ret 
End Sub
Private Sub Form__4FC370
  '004FC370: push ebp
  '004FC371: mov ebp, esp
  '004FC373: sub esp, 0000000Ch
  '004FC376: push 004081B6h
  '004FC37B: mov eax, fs:[00h]
  '004FC381: push eax
  '004FC382: mov fs:[00000000h], esp
  '004FC389: sub esp, 0000000Ch
  '004FC38C: push ebx
  '004FC38D: push esi
  '004FC38E: push edi
  '004FC38F: mov [ebp-0Ch], esp
  '004FC392: mov [ebp-08h], 00405B60h
  '004FC399: mov esi, [ebp+08h]
  '004FC39C: mov eax, esi
  '004FC39E: and eax, 00000001h
  '004FC3A1: mov [ebp-04h], eax
  '004FC3A4: and esi, FFFFFFFEh
  '004FC3A7: push esi
  '004FC3A8: mov [ebp+08h], esi
  '004FC3AB: mov ecx, [esi]
  '004FC3AD: call [ecx+04h]
  '004FC3B0: cmp word ptr [0054104Eh], 0000h
  '004FC3B8: jnz 4FC3E9h
  '004FC3BA: mov edx, [ebp+0Ch]
  '004FC3BD: push esi
  '004FC3BE: mov word ptr [edx], 0001h
  '004FC3C3: mov eax, [esi]
  '004FC3C5: call [eax+000002B4h]
  '004FC3CB: test eax, eax
  '004FC3CD: fclex 
  '004FC3CF: jnl 4FC3E3h
  '004FC3D1: push 000002B4h
  '004FC3D6: push 0041DE38h
  '004FC3DB: push esi
  '004FC3DC: push eax
  '004FC3DD: call [004010A0h]
  '004FC3E3: call [00401104h]
  '004FC3E9: mov [ebp-04h], 00000000h
  '004FC3F0: mov eax, [ebp+08h]
  '004FC3F3: push eax
  '004FC3F4: mov ecx, [eax]
  '004FC3F6: call [ecx+08h]
  '004FC3F9: mov eax, [ebp-04h]
  '004FC3FC: mov ecx, [ebp-14h]
  '004FC3FF: pop edi
  '004FC400: pop esi
  '004FC401: mov fs:[00000000h], ecx
  '004FC408: pop ebx
  '004FC409: mov esp, ebp
  '004FC40B: pop ebp
  '004FC40C: retn 000Ch
End Sub
Private Sub txtportfilelocal__4FDC90
  '004FDC90: push ebp
  '004FDC91: mov ebp, esp
  '004FDC93: sub esp, 0000000Ch
  '004FDC96: push 004081B6h
  '004FDC9B: mov eax, fs:[00h]
  '004FDCA1: push eax
  '004FDCA2: mov fs:[00000000h], esp
  '004FDCA9: sub esp, 00000008h
  '004FDCAC: push ebx
  '004FDCAD: push esi
  '004FDCAE: push edi
  '004FDCAF: mov [ebp-0Ch], esp
  '004FDCB2: mov [ebp-08h], 00405BF0h
  '004FDCB9: mov eax, [ebp+08h]
  '004FDCBC: mov ecx, eax
  '004FDCBE: and ecx, 00000001h
  '004FDCC1: mov [ebp-04h], ecx
  '004FDCC4: and al, FEh
  '004FDCC6: push eax
  '004FDCC7: mov [ebp+08h], eax
  '004FDCCA: mov edx, [eax]
  '004FDCCC: call [edx+04h]
  '004FDCCF: mov esi, [ebp+0Ch]
  '004FDCD2: xor ecx, ecx
  '004FDCD4: mov ax, [esi]
  '004FDCD7: cmp ax, 0039h
  '004FDCDB: setle cl
  '004FDCDE: xor edx, edx
  '004FDCE0: cmp ax, 0030h
  '004FDCE4: setnl dl
  '004FDCE7: and ecx, edx
  '004FDCE9: neg ecx
  '004FDCEB: sbb ecx, ecx
  '004FDCED: xor edx, edx
  '004FDCEF: neg ecx
  '004FDCF1: cmp ax, 0008h
  '004FDCF5: setz dl
  '004FDCF8: or ecx, edx
  '004FDCFA: jnz 4FDD01h
  '004FDCFC: mov word ptr [esi], 0000h
  '004FDD01: mov [ebp-04h], 00000000h
  '004FDD08: mov eax, [ebp+08h]
  '004FDD0B: push eax
  '004FDD0C: mov ecx, [eax]
  '004FDD0E: call [ecx+08h]
  '004FDD11: mov eax, [ebp-04h]
  '004FDD14: mov ecx, [ebp-14h]
  '004FDD17: pop edi
  '004FDD18: pop esi
  '004FDD19: mov fs:[00000000h], ecx
  '004FDD20: pop ebx
  '004FDD21: mov esp, ebp
  '004FDD23: pop ebp
  '004FDD24: retn 0008h
End Sub
Private Sub cmdSave__4FBC40
  '004FBC40: push ebp
  '004FBC41: mov ebp, esp
  '004FBC43: sub esp, 0000000Ch
  '004FBC46: push 004081B6h
  '004FBC4B: mov eax, fs:[00h]
  '004FBC51: push eax
  '004FBC52: mov fs:[00000000h], esp
  '004FBC59: sub esp, 00000018h
  '004FBC5C: push ebx
  '004FBC5D: push esi
  '004FBC5E: push edi
  '004FBC5F: mov [ebp-0Ch], esp
  '004FBC62: mov [ebp-08h], 00405AE8h
  '004FBC69: mov esi, [ebp+08h]
  '004FBC6C: mov eax, esi
  '004FBC6E: and eax, 00000001h
  '004FBC71: mov [ebp-04h], eax
  '004FBC74: and esi, FFFFFFFEh
  '004FBC77: push esi
  '004FBC78: mov [ebp+08h], esi
  '004FBC7B: mov ecx, [esi]
  '004FBC7D: call [ecx+04h]
  '004FBC80: mov edx, [esi]
  '004FBC82: xor ebx, ebx
  '004FBC84: push esi
  '004FBC85: mov [ebp-18h], ebx
  '004FBC88: mov [ebp-1Ch], ebx
  '004FBC8B: call [edx+0000035Ch]
  '004FBC91: push eax
  '004FBC92: lea eax, [ebp-1Ch]
  '004FBC95: push eax
  '004FBC96: call [004010E4h]
  '004FBC9C: mov edi, eax
  '004FBC9E: lea edx, [ebp-18h]
  '004FBCA1: push edx
  '004FBCA2: push edi
  '004FBCA3: mov ecx, [edi]
  '004FBCA5: call [ecx+000000A0h]
  '004FBCAB: cmp eax, ebx
  '004FBCAD: fclex 
  '004FBCAF: jnl 4FBCC3h
  '004FBCB1: push 000000A0h
  '004FBCB6: push 0041E3FCh
  '004FBCBB: push edi
  '004FBCBC: push eax
  '004FBCBD: call [004010A0h]
  '004FBCC3: mov eax, [ebp-18h]
  '004FBCC6: push eax
  '004FBCC7: push 004281F4h
  '004FBCCC: push 0041EA6Ch
  '004FBCD1: push 0041EA58h
  '004FBCD6: call [00401010h]
  '004FBCDC: mov edi, [004013B4h]
  '004FBCE2: lea ecx, [ebp-18h]
  '004FBCE5: call edi
  '004FBCE7: lea ecx, [ebp-1Ch]
  '004FBCEA: call [004013B8h]
  '004FBCF0: mov edx, 00428208h
  '004FBCF5: lea ecx, [ebp-18h]
  '004FBCF8: call [004012D8h]
  '004FBCFE: mov ecx, [esi]
  '004FBD00: lea edx, [ebp-18h]
  '004FBD03: push edx
  '004FBD04: push esi
  '004FBD05: call [ecx+00000734h]
  '004FBD0B: lea ecx, [ebp-18h]
  '004FBD0E: call edi
  '004FBD10: mov [ebp-04h], ebx
  '004FBD13: push 004FBD2Eh
  '004FBD18: jmp 4FBD2Dh
  '004FBD1A: lea ecx, [ebp-18h]
  '004FBD1D: call [004013B4h]
  '004FBD23: lea ecx, [ebp-1Ch]
  '004FBD26: call [004013B8h]
  '004FBD2C: ret 
End Sub
Private Sub Toolbar1__4FC450
  '004FC450: push ebp
  '004FC451: mov ebp, esp
  '004FC453: sub esp, 0000000Ch
  '004FC456: push 004081B6h
  '004FC45B: mov eax, fs:[00h]
  '004FC461: push eax
  '004FC462: mov fs:[00000000h], esp
  '004FC469: sub esp, 0000007Ch
  '004FC46C: push ebx
  '004FC46D: push esi
  '004FC46E: push edi
  '004FC46F: mov [ebp-0Ch], esp
  '004FC472: mov [ebp-08h], 00405B68h
  '004FC479: mov esi, [ebp+08h]
  '004FC47C: mov eax, esi
  '004FC47E: and eax, 00000001h
  '004FC481: mov [ebp-04h], eax
  '004FC484: and esi, FFFFFFFEh
  '004FC487: push esi
  '004FC488: mov [ebp+08h], esi
  '004FC48B: mov ecx, [esi]
  '004FC48D: call [ecx+04h]
  '004FC490: mov edx, [ebp+0Ch]
  '004FC493: lea eax, [ebp-18h]
  '004FC496: xor edi, edi
  '004FC498: push edx
  '004FC499: push eax
  '004FC49A: mov [ebp-18h], edi
  '004FC49D: mov [ebp-1Ch], edi
  '004FC4A0: mov [ebp-20h], edi
  '004FC4A3: mov [ebp-30h], edi
  '004FC4A6: mov [ebp-40h], edi
  '004FC4A9: mov [ebp-50h], edi
  '004FC4AC: mov [ebp-60h], edi
  '004FC4AF: mov [ebp-64h], edi
  '004FC4B2: call [004010F8h]
  '004FC4B8: mov eax, [ebp-18h]
  '004FC4BB: lea edx, [ebp-1Ch]
  '004FC4BE: push edx
  '004FC4BF: push eax
  '004FC4C0: mov ecx, [eax]
  '004FC4C2: call [ecx+24h]
  '004FC4C5: cmp eax, edi
  '004FC4C7: fclex 
  '004FC4C9: jnl 4FC4DDh
  '004FC4CB: mov ecx, [ebp-18h]
  '004FC4CE: push 00000024h
  '004FC4D0: push 0041C048h
  '004FC4D5: push ecx
  '004FC4D6: push eax
  '004FC4D7: call [004010A0h]
  '004FC4DD: mov eax, [ebp-1Ch]
  '004FC4E0: lea edx, [ebp-30h]
  '004FC4E3: mov [ebp-28h], eax
  '004FC4E6: lea eax, [ebp-40h]
  '004FC4E9: mov [ebp-1Ch], edi
  '004FC4EC: mov edi, [00401174h]
  '004FC4F2: push edx
  '004FC4F3: push eax
  '004FC4F4: mov [ebp-30h], 00000008h
  '004FC4FB: call edi
  '004FC4FD: mov ebx, [00401198h]
  '004FC503: lea ecx, [ebp-40h]
  '004FC506: lea edx, [ebp-60h]
  '004FC509: push ecx
  '004FC50A: push edx
  '004FC50B: mov [ebp-58h], 00428318h
  '004FC512: mov [ebp-60h], 00008008h
  '004FC519: call ebx
  '004FC51B: mov [ebp-6Ch], eax
  '004FC51E: lea eax, [ebp-40h]
  '004FC521: lea ecx, [ebp-30h]
  '004FC524: push eax
  '004FC525: push ecx
  '004FC526: push 00000002h
  '004FC528: call [00401050h]
  '004FC52E: mov eax, [ebp-18h]
  '004FC531: add esp, 0000000Ch
  '004FC534: cmp word ptr [ebp-6Ch], 0000h
  '004FC539: jz 4FC58Bh
  '004FC53B: mov edx, [eax]
  '004FC53D: push 00000000h
  '004FC53F: push eax
  '004FC540: call [edx+00000080h]
  '004FC546: test eax, eax
  '004FC548: fclex 
  '004FC54A: jnl 4FC561h
  '004FC54C: mov ecx, [ebp-18h]
  '004FC54F: push 00000080h
  '004FC554: push 0041C048h
  '004FC559: push ecx
  '004FC55A: push eax
  '004FC55B: call [004010A0h]
  '004FC561: mov edx, [esi]
  '004FC563: push esi
  '004FC564: call [edx+000002B4h]
  '004FC56A: test eax, eax
  '004FC56C: fclex 
  '004FC56E: jnl 004FC966h
  '004FC574: push 000002B4h
  '004FC579: push 0041DE38h
  '004FC57E: push esi
  '004FC57F: push eax
  '004FC580: call [004010A0h]
  '004FC586: jmp 004FC966h
  '004FC58B: mov ecx, [eax]
  '004FC58D: lea edx, [ebp-1Ch]
  '004FC590: push edx
  '004FC591: push eax
  '004FC592: call [ecx+24h]
  '004FC595: test eax, eax
  '004FC597: fclex 
  '004FC599: jnl 4FC5ADh
  '004FC59B: mov ecx, [ebp-18h]
  '004FC59E: push 00000024h
  '004FC5A0: push 0041C048h
  '004FC5A5: push ecx
  '004FC5A6: push eax
  '004FC5A7: call [004010A0h]
  '004FC5AD: mov eax, [ebp-1Ch]
  '004FC5B0: lea edx, [ebp-30h]
  '004FC5B3: mov [ebp-28h], eax
  '004FC5B6: lea eax, [ebp-40h]
  '004FC5B9: push edx
  '004FC5BA: push eax
  '004FC5BB: mov [ebp-1Ch], 00000000h
  '004FC5C2: mov [ebp-30h], 00000008h
  '004FC5C9: call edi
  '004FC5CB: lea ecx, [ebp-40h]
  '004FC5CE: lea edx, [ebp-60h]
  '004FC5D1: push ecx
  '004FC5D2: push edx
  '004FC5D3: mov [ebp-58h], 0042832Ch
  '004FC5DA: mov [ebp-60h], 00008008h
  '004FC5E1: call ebx
  '004FC5E3: mov [ebp-6Ch], eax
  '004FC5E6: lea eax, [ebp-40h]
  '004FC5E9: lea ecx, [ebp-30h]
  '004FC5EC: push eax
  '004FC5ED: push ecx
  '004FC5EE: push 00000002h
  '004FC5F0: call [00401050h]
  '004FC5F6: add esp, 0000000Ch
  '004FC5F9: cmp word ptr [ebp-6Ch], 0000h
  '004FC5FE: jz 4FC625h
  '004FC600: mov edx, [esi]
  '004FC602: lea eax, [ebp-30h]
  '004FC605: lea ecx, [ebp-64h]
  '004FC608: push eax
  '004FC609: push ecx
  '004FC60A: push esi
  '004FC60B: mov [ebp-64h], 00000000h
  '004FC612: call [edx+000006F8h]
  '004FC618: test eax, eax
  '004FC61A: jnl 004FC95Dh
  '004FC620: jmp 004FC94Bh
  '004FC625: mov eax, [ebp-18h]
  '004FC628: lea ecx, [ebp-1Ch]
  '004FC62B: push ecx
  '004FC62C: push eax
  '004FC62D: mov edx, [eax]
  '004FC62F: call [edx+24h]
  '004FC632: test eax, eax
  '004FC634: fclex 
  '004FC636: jnl 4FC64Ah
  '004FC638: mov edx, [ebp-18h]
  '004FC63B: push 00000024h
  '004FC63D: push 0041C048h
  '004FC642: push edx
  '004FC643: push eax
  '004FC644: call [004010A0h]
  '004FC64A: mov eax, [ebp-1Ch]
  '004FC64D: lea ecx, [ebp-40h]
  '004FC650: mov [ebp-28h], eax
  '004FC653: lea eax, [ebp-30h]
  '004FC656: push eax
  '004FC657: push ecx
  '004FC658: mov [ebp-1Ch], 00000000h
  '004FC65F: mov [ebp-30h], 00000008h
  '004FC666: call edi
  '004FC668: lea edx, [ebp-40h]
  '004FC66B: lea eax, [ebp-60h]
  '004FC66E: push edx
  '004FC66F: push eax
  '004FC670: mov [ebp-58h], 00422ED8h
  '004FC677: mov [ebp-60h], 00008008h
  '004FC67E: call ebx
  '004FC680: lea ecx, [ebp-40h]
  '004FC683: lea edx, [ebp-30h]
  '004FC686: push ecx
  '004FC687: push edx
  '004FC688: push 00000002h
  '004FC68A: mov [ebp-6Ch], eax
  '004FC68D: call [00401050h]
  '004FC693: add esp, 0000000Ch
  '004FC696: cmp word ptr [ebp-6Ch], 0000h
  '004FC69B: jz 4FC6EDh
  '004FC69D: mov eax, [esi]
  '004FC69F: lea ecx, [ebp-30h]
  '004FC6A2: lea edx, [ebp-64h]
  '004FC6A5: push ecx
  '004FC6A6: push edx
  '004FC6A7: push esi
  '004FC6A8: mov [ebp-64h], 00000001h
  '004FC6AF: call [eax+000006F8h]
  '004FC6B5: test eax, eax
  '004FC6B7: jnl 4FC6CBh
  '004FC6B9: push 000006F8h
  '004FC6BE: push 0041DE68h
  '004FC6C3: push esi
  '004FC6C4: push eax
  '004FC6C5: call [004010A0h]
  '004FC6CB: lea ecx, [ebp-30h]
  '004FC6CE: call [00401030h]
  '004FC6D4: mov eax, [esi]
  '004FC6D6: lea ecx, [ebp-64h]
  '004FC6D9: push ecx
  '004FC6DA: push esi
  '004FC6DB: mov [ebp-64h], 00000000h
  '004FC6E2: call [eax+00000710h]
  '004FC6E8: jmp 004FC966h
  '004FC6ED: mov eax, [ebp-18h]
  '004FC6F0: lea ecx, [ebp-1Ch]
  '004FC6F3: push ecx
  '004FC6F4: push eax
  '004FC6F5: mov edx, [eax]
  '004FC6F7: call [edx+24h]
  '004FC6FA: test eax, eax
  '004FC6FC: fclex 
  '004FC6FE: jnl 4FC712h
  '004FC700: mov edx, [ebp-18h]
  '004FC703: push 00000024h
  '004FC705: push 0041C048h
  '004FC70A: push edx
  '004FC70B: push eax
  '004FC70C: call [004010A0h]
  '004FC712: mov eax, [ebp-1Ch]
  '004FC715: lea ecx, [ebp-40h]
  '004FC718: mov [ebp-28h], eax
  '004FC71B: lea eax, [ebp-30h]
  '004FC71E: push eax
  '004FC71F: push ecx
  '004FC720: mov [ebp-1Ch], 00000000h
  '004FC727: mov [ebp-30h], 00000008h
  '004FC72E: call edi
  '004FC730: lea edx, [ebp-40h]
  '004FC733: lea eax, [ebp-60h]
  '004FC736: push edx
  '004FC737: push eax
  '004FC738: mov [ebp-58h], 00428340h
  '004FC73F: mov [ebp-60h], 00008008h
  '004FC746: call ebx
  '004FC748: lea ecx, [ebp-40h]
  '004FC74B: lea edx, [ebp-30h]
  '004FC74E: push ecx
  '004FC74F: push edx
  '004FC750: push 00000002h
  '004FC752: mov [ebp-6Ch], eax
  '004FC755: call [00401050h]
  '004FC75B: add esp, 0000000Ch
  '004FC75E: cmp word ptr [ebp-6Ch], 0000h
  '004FC763: jz 4FC78Ah
  '004FC765: mov eax, [esi]
  '004FC767: lea ecx, [ebp-30h]
  '004FC76A: lea edx, [ebp-64h]
  '004FC76D: push ecx
  '004FC76E: push edx
  '004FC76F: push esi
  '004FC770: mov [ebp-64h], 00000002h
  '004FC777: call [eax+000006F8h]
  '004FC77D: test eax, eax
  '004FC77F: jnl 004FC95Dh
  '004FC785: jmp 004FC94Bh
  '004FC78A: mov eax, [ebp-18h]
  '004FC78D: lea edx, [ebp-1Ch]
  '004FC790: push edx
  '004FC791: push eax
  '004FC792: mov ecx, [eax]
  '004FC794: call [ecx+24h]
  '004FC797: test eax, eax
  '004FC799: fclex 
  '004FC79B: jnl 4FC7AFh
  '004FC79D: mov ecx, [ebp-18h]
  '004FC7A0: push 00000024h
  '004FC7A2: push 0041C048h
  '004FC7A7: push ecx
  '004FC7A8: push eax
  '004FC7A9: call [004010A0h]
  '004FC7AF: mov eax, [ebp-1Ch]
  '004FC7B2: lea edx, [ebp-30h]
  '004FC7B5: mov [ebp-28h], eax
  '004FC7B8: lea eax, [ebp-40h]
  '004FC7BB: push edx
  '004FC7BC: push eax
  '004FC7BD: mov [ebp-1Ch], 00000000h
  '004FC7C4: mov [ebp-30h], 00000008h
  '004FC7CB: call edi
  '004FC7CD: lea ecx, [ebp-40h]
  '004FC7D0: lea edx, [ebp-60h]
  '004FC7D3: push ecx
  '004FC7D4: push edx
  '004FC7D5: mov [ebp-58h], 00428354h
  '004FC7DC: mov [ebp-60h], 00008008h
  '004FC7E3: call ebx
  '004FC7E5: mov [ebp-6Ch], eax
  '004FC7E8: lea eax, [ebp-40h]
  '004FC7EB: lea ecx, [ebp-30h]
  '004FC7EE: push eax
  '004FC7EF: push ecx
  '004FC7F0: push 00000002h
  '004FC7F2: call [00401050h]
  '004FC7F8: add esp, 0000000Ch
  '004FC7FB: cmp word ptr [ebp-6Ch], 0000h
  '004FC800: jz 004FC8BAh
  '004FC806: mov edx, [esi]
  '004FC808: lea eax, [ebp-30h]
  '004FC80B: lea ecx, [ebp-64h]
  '004FC80E: push eax
  '004FC80F: push ecx
  '004FC810: push esi
  '004FC811: mov [ebp-64h], 00000003h
  '004FC818: call [edx+000006F8h]
  '004FC81E: test eax, eax
  '004FC820: jnl 4FC838h
  '004FC822: mov ebx, [004010A0h]
  '004FC828: push 000006F8h
  '004FC82D: push 0041DE68h
  '004FC832: push esi
  '004FC833: push eax
  '004FC834: call ebx
  '004FC836: jmp 4FC83Eh
  '004FC838: mov ebx, [004010A0h]
  '004FC83E: lea ecx, [ebp-30h]
  '004FC841: call [00401030h]
  '004FC847: mov edx, [esi]
  '004FC849: push esi
  '004FC84A: call [edx+000003D0h]
  '004FC850: push eax
  '004FC851: lea eax, [ebp-20h]
  '004FC854: push eax
  '004FC855: call [004010E4h]
  '004FC85B: mov ecx, [esi]
  '004FC85D: lea edx, [ebp-1Ch]
  '004FC860: push edx
  '004FC861: push esi
  '004FC862: mov edi, eax
  '004FC864: call [ecx+000006FCh]
  '004FC86A: test eax, eax
  '004FC86C: jnl 4FC87Ch
  '004FC86E: push 000006FCh
  '004FC873: push 0041DE68h
  '004FC878: push esi
  '004FC879: push eax
  '004FC87A: call ebx
  '004FC87C: mov ecx, [ebp-1Ch]
  '004FC87F: mov eax, [edi]
  '004FC881: push ecx
  '004FC882: push edi
  '004FC883: call [eax+000000A4h]
  '004FC889: test eax, eax
  '004FC88B: fclex 
  '004FC88D: jnl 4FC89Dh
  '004FC88F: push 000000A4h
  '004FC894: push 0041E3FCh
  '004FC899: push edi
  '004FC89A: push eax
  '004FC89B: call ebx
  '004FC89D: lea ecx, [ebp-1Ch]
  '004FC8A0: call [004013B4h]
  '004FC8A6: lea ecx, [ebp-20h]
  '004FC8A9: call [004013B8h]
  '004FC8AF: call [00401104h]
  '004FC8B5: jmp 004FC966h
  '004FC8BA: mov eax, [ebp-18h]
  '004FC8BD: lea ecx, [ebp-1Ch]
  '004FC8C0: push ecx
  '004FC8C1: push eax
  '004FC8C2: mov edx, [eax]
  '004FC8C4: call [edx+24h]
  '004FC8C7: test eax, eax
  '004FC8C9: fclex 
  '004FC8CB: jnl 4FC8DFh
  '004FC8CD: mov edx, [ebp-18h]
  '004FC8D0: push 00000024h
  '004FC8D2: push 0041C048h
  '004FC8D7: push edx
  '004FC8D8: push eax
  '004FC8D9: call [004010A0h]
  '004FC8DF: mov eax, [ebp-1Ch]
  '004FC8E2: lea ecx, [ebp-40h]
  '004FC8E5: mov [ebp-28h], eax
  '004FC8E8: lea eax, [ebp-30h]
  '004FC8EB: push eax
  '004FC8EC: push ecx
  '004FC8ED: mov [ebp-1Ch], 00000000h
  '004FC8F4: mov [ebp-30h], 00000008h
  '004FC8FB: call edi
  '004FC8FD: lea edx, [ebp-40h]
  '004FC900: lea eax, [ebp-60h]
  '004FC903: push edx
  '004FC904: push eax
  '004FC905: mov [ebp-58h], 00428370h
  '004FC90C: mov [ebp-60h], 00008008h
  '004FC913: call ebx
  '004FC915: lea ecx, [ebp-40h]
  '004FC918: lea edx, [ebp-30h]
  '004FC91B: push ecx
  '004FC91C: push edx
  '004FC91D: push 00000002h
  '004FC91F: mov edi, eax
  '004FC921: call [00401050h]
  '004FC927: add esp, 0000000Ch
  '004FC92A: test di, di
  '004FC92D: jz 4FC966h
  '004FC92F: mov eax, [esi]
  '004FC931: lea ecx, [ebp-30h]
  '004FC934: lea edx, [ebp-64h]
  '004FC937: push ecx
  '004FC938: push edx
  '004FC939: push esi
  '004FC93A: mov [ebp-64h], 00000004h
  '004FC941: call [eax+000006F8h]
  '004FC947: test eax, eax
  '004FC949: jnl 4FC95Dh
  '004FC94B: push 000006F8h
  '004FC950: push 0041DE68h
  '004FC955: push esi
  '004FC956: push eax
  '004FC957: call [004010A0h]
  '004FC95D: lea ecx, [ebp-30h]
  '004FC960: call [00401030h]
  '004FC966: mov [ebp-04h], 00000000h
  '004FC96D: push 004FC9A8h
  '004FC972: jmp 4FC99Eh
  '004FC974: lea ecx, [ebp-1Ch]
  '004FC977: call [004013B4h]
  '004FC97D: lea ecx, [ebp-20h]
  '004FC980: call [004013B8h]
  '004FC986: lea eax, [ebp-50h]
  '004FC989: lea ecx, [ebp-40h]
  '004FC98C: push eax
  '004FC98D: lea edx, [ebp-30h]
  '004FC990: push ecx
  '004FC991: push edx
  '004FC992: push 00000003h
  '004FC994: call [00401050h]
  '004FC99A: add esp, 00000010h
  '004FC99D: ret 
End Sub
Private Sub txtListenPort__4FDA10
  '004FDA10: push ebp
  '004FDA11: mov ebp, esp
  '004FDA13: sub esp, 0000000Ch
  '004FDA16: push 004081B6h
  '004FDA1B: mov eax, fs:[00h]
  '004FDA21: push eax
  '004FDA22: mov fs:[00000000h], esp
  '004FDA29: sub esp, 00000008h
  '004FDA2C: push ebx
  '004FDA2D: push esi
  '004FDA2E: push edi
  '004FDA2F: mov [ebp-0Ch], esp
  '004FDA32: mov [ebp-08h], 00405BD0h
  '004FDA39: mov eax, [ebp+08h]
  '004FDA3C: mov ecx, eax
  '004FDA3E: and ecx, 00000001h
  '004FDA41: mov [ebp-04h], ecx
  '004FDA44: and al, FEh
  '004FDA46: push eax
  '004FDA47: mov [ebp+08h], eax
  '004FDA4A: mov edx, [eax]
  '004FDA4C: call [edx+04h]
  '004FDA4F: mov esi, [ebp+0Ch]
  '004FDA52: xor ecx, ecx
  '004FDA54: mov ax, [esi]
  '004FDA57: cmp ax, 0039h
  '004FDA5B: setle cl
  '004FDA5E: xor edx, edx
  '004FDA60: cmp ax, 0030h
  '004FDA64: setnl dl
  '004FDA67: and ecx, edx
  '004FDA69: neg ecx
  '004FDA6B: sbb ecx, ecx
  '004FDA6D: xor edx, edx
  '004FDA6F: neg ecx
  '004FDA71: cmp ax, 0008h
  '004FDA75: setz dl
  '004FDA78: or ecx, edx
  '004FDA7A: jnz 4FDA81h
  '004FDA7C: mov word ptr [esi], 0000h
  '004FDA81: mov [ebp-04h], 00000000h
  '004FDA88: mov eax, [ebp+08h]
  '004FDA8B: push eax
  '004FDA8C: mov ecx, [eax]
  '004FDA8E: call [ecx+08h]
  '004FDA91: mov eax, [ebp-04h]
  '004FDA94: mov ecx, [ebp-14h]
  '004FDA97: pop edi
  '004FDA98: pop esi
  '004FDA99: mov fs:[00000000h], ecx
  '004FDAA0: pop ebx
  '004FDAA1: mov esp, ebp
  '004FDAA3: pop ebp
  '004FDAA4: retn 0008h
End Sub
Private Sub cmdDelete__4FBA70
  '004FBA70: push ebp
  '004FBA71: mov ebp, esp
  '004FBA73: sub esp, 00000018h
  '004FBA76: push 004081B6h
  '004FBA7B: mov eax, fs:[00h]
  '004FBA81: push eax
  '004FBA82: mov fs:[00000000h], esp
  '004FBA89: mov eax, 00000094h
  '004FBA8E: call 004081B0h
  '004FBA93: push ebx
  '004FBA94: push esi
  '004FBA95: push edi
  '004FBA96: mov [ebp-18h], esp
  '004FBA99: mov [ebp-14h], 00405AB0h
  '004FBAA0: mov eax, [ebp+08h]
  '004FBAA3: and eax, 00000001h
  '004FBAA6: mov [ebp-10h], eax
  '004FBAA9: mov ecx, [ebp+08h]
  '004FBAAC: and ecx, FFFFFFFEh
  '004FBAAF: mov [ebp+08h], ecx
  '004FBAB2: mov [ebp-0Ch], 00000000h
  '004FBAB9: mov edx, [ebp+08h]
  '004FBABC: mov eax, [edx]
  '004FBABE: mov ecx, [ebp+08h]
  '004FBAC1: push ecx
  '004FBAC2: call [eax+04h]
  '004FBAC5: mov [ebp-04h], 00000001h
  '004FBACC: mov [ebp-04h], 00000002h
  '004FBAD3: push FFFFFFFFh
  '004FBAD5: call [004010E8h]
  '004FBADB: mov [ebp-04h], 00000003h
  '004FBAE2: mov [ebp-78h], 80020004h
  '004FBAE9: mov [ebp-80h], 0000000Ah
  '004FBAF0: mov [ebp-68h], 80020004h
  '004FBAF7: mov [ebp-70h], 0000000Ah
  '004FBAFE: mov eax, 00000010h
  '004FBB03: call 004081B0h
  '004FBB08: mov edx, esp
  '004FBB0A: mov eax, [ebp-80h]
  '004FBB0D: mov [edx], eax
  '004FBB0F: mov ecx, [ebp-7Ch]
  '004FBB12: mov [edx+04h], ecx
  '004FBB15: mov eax, [ebp-78h]
  '004FBB18: mov [edx+08h], eax
  '004FBB1B: mov ecx, [ebp-74h]
  '004FBB1E: mov [edx+0Ch], ecx
  '004FBB21: mov eax, 00000010h
  '004FBB26: call 004081B0h
  '004FBB2B: mov edx, esp
  '004FBB2D: mov eax, [ebp-70h]
  '004FBB30: mov [edx], eax
  '004FBB32: mov ecx, [ebp-6Ch]
  '004FBB35: mov [edx+04h], ecx
  '004FBB38: mov eax, [ebp-68h]
  '004FBB3B: mov [edx+08h], eax
  '004FBB3E: mov ecx, [ebp-64h]
  '004FBB41: mov [edx+0Ch], ecx
  '004FBB44: push 0041EA58h
  '004FBB49: call [00401014h]
  '004FBB4F: mov [ebp-04h], 00000004h
  '004FBB56: mov [ebp-58h], 80020004h
  '004FBB5D: mov [ebp-60h], 0000000Ah
  '004FBB64: mov [ebp-48h], 80020004h
  '004FBB6B: mov [ebp-50h], 0000000Ah
  '004FBB72: mov [ebp-78h], 004281E4h
  '004FBB79: mov [ebp-80h], 00000008h
  '004FBB80: lea edx, [ebp-80h]
  '004FBB83: lea ecx, [ebp-40h]
  '004FBB86: call [00401338h]
  '004FBB8C: mov [ebp-68h], 00428158h
  '004FBB93: mov [ebp-70h], 00000008h
  '004FBB9A: lea edx, [ebp-70h]
  '004FBB9D: lea ecx, [ebp-30h]
  '004FBBA0: call [00401338h]
  '004FBBA6: lea edx, [ebp-60h]
  '004FBBA9: push edx
  '004FBBAA: lea eax, [ebp-50h]
  '004FBBAD: push eax
  '004FBBAE: lea ecx, [ebp-40h]
  '004FBBB1: push ecx
  '004FBBB2: push 00000040h
  '004FBBB4: lea edx, [ebp-30h]
  '004FBBB7: push edx
  '004FBBB8: call [004010E0h]
  '004FBBBE: lea eax, [ebp-60h]
  '004FBBC1: push eax
  '004FBBC2: lea ecx, [ebp-50h]
  '004FBBC5: push ecx
  '004FBBC6: lea edx, [ebp-40h]
  '004FBBC9: push edx
  '004FBBCA: lea eax, [ebp-30h]
  '004FBBCD: push eax
  '004FBBCE: push 00000004h
  '004FBBD0: call [00401050h]
  '004FBBD6: add esp, 00000014h
  '004FBBD9: mov [ebp-04h], 00000005h
  '004FBBE0: call [0040104Ch]
  '004FBBE6: mov [ebp-10h], 00000000h
  '004FBBED: push 004FBC11h
  '004FBBF2: jmp 4FBC10h
  '004FBBF4: lea ecx, [ebp-60h]
  '004FBBF7: push ecx
  '004FBBF8: lea edx, [ebp-50h]
  '004FBBFB: push edx
  '004FBBFC: lea eax, [ebp-40h]
  '004FBBFF: push eax
  '004FBC00: lea ecx, [ebp-30h]
  '004FBC03: push ecx
  '004FBC04: push 00000004h
  '004FBC06: call [00401050h]
  '004FBC0C: add esp, 00000014h
  '004FBC0F: ret 
End Sub
Private Sub unknown_4FC9D0
  '004FC9D0: push ebp
  '004FC9D1: mov ebp, esp
  '004FC9D3: sub esp, 0000000Ch
  '004FC9D6: push 004081B6h
  '004FC9DB: mov eax, fs:[00h]
  '004FC9E1: push eax
  '004FC9E2: mov fs:[00000000h], esp
  '004FC9E9: sub esp, 0000006Ch
  '004FC9EC: push ebx
  '004FC9ED: push esi
  '004FC9EE: push edi
  '004FC9EF: mov [ebp-0Ch], esp
  '004FC9F2: mov [ebp-08h], 00405B78h
  '004FC9F9: xor edi, edi
  '004FC9FB: mov [ebp-04h], edi
  '004FC9FE: mov esi, [ebp+08h]
  '004FCA01: push esi
  '004FCA02: mov eax, [esi]
  '004FCA04: call [eax+04h]
  '004FCA07: mov ecx, [ebp+10h]
  '004FCA0A: push esi
  '004FCA0B: mov [ebp-24h], edi
  '004FCA0E: mov [ebp-34h], edi
  '004FCA11: mov [ecx], edi
  '004FCA13: mov edx, [esi]
  '004FCA15: mov [ebp-38h], edi
  '004FCA18: mov [ebp-3Ch], edi
  '004FCA1B: mov [ebp-4Ch], edi
  '004FCA1E: mov [ebp-70h], edi
  '004FCA21: mov [ebp-74h], edi
  '004FCA24: call [edx+00000314h]
  '004FCA2A: push eax
  '004FCA2B: lea eax, [ebp-70h]
  '004FCA2E: push eax
  '004FCA2F: call [004010E4h]
  '004FCA35: lea ecx, [ebp-34h]
  '004FCA38: push eax
  '004FCA39: lea edx, [ebp-74h]
  '004FCA3C: push ecx
  '004FCA3D: push edx
  '004FCA3E: call [0040111Ch]
  '004FCA44: mov esi, [ebp-40h]
  '004FCA47: mov edi, [ebp-48h]
  '004FCA4A: mov ebx, [004011BCh]
  '004FCA50: test eax, eax
  '004FCA52: jz 4FCA86h
  '004FCA54: sub esp, 00000010h
  '004FCA57: mov ecx, 0000000Bh
  '004FCA5C: mov edx, esp
  '004FCA5E: xor eax, eax
  '004FCA60: push 0041F320h
  '004FCA65: mov [edx], ecx
  '004FCA67: mov [edx+04h], edi
  '004FCA6A: mov [edx+08h], eax
  '004FCA6D: lea eax, [ebp-34h]
  '004FCA70: push eax
  '004FCA71: mov [edx+0Ch], esi
  '004FCA74: call ebx
  '004FCA76: lea ecx, [ebp-34h]
  '004FCA79: lea edx, [ebp-74h]
  '004FCA7C: push ecx
  '004FCA7D: push edx
  '004FCA7E: call [004011B0h]
  '004FCA84: jmp 4FCA50h
  '004FCA86: mov eax, [ebp+08h]
  '004FCA89: push eax
  '004FCA8A: mov ecx, [eax]
  '004FCA8C: call [ecx+00000314h]
  '004FCA92: lea edx, [ebp-38h]
  '004FCA95: push eax
  '004FCA96: push edx
  '004FCA97: call [004010E4h]
  '004FCA9D: mov edx, [ebp+0Ch]
  '004FCAA0: lea ecx, [ebp-3Ch]
  '004FCAA3: mov esi, eax
  '004FCAA5: push ecx
  '004FCAA6: mov cx, [edx]
  '004FCAA9: mov eax, [esi]
  '004FCAAB: push ecx
  '004FCAAC: push esi
  '004FCAAD: call [eax+40h]
  '004FCAB0: test eax, eax
  '004FCAB2: fclex 
  '004FCAB4: jnl 4FCAC5h
  '004FCAB6: push 00000040h
  '004FCAB8: push 0041E60Ch
  '004FCABD: push esi
  '004FCABE: push eax
  '004FCABF: call [004010A0h]
  '004FCAC5: mov eax, [ebp-3Ch]
  '004FCAC8: push FFFFFFFFh
  '004FCACA: push eax
  '004FCACB: mov esi, eax
  '004FCACD: mov edx, [eax]
  '004FCACF: call [edx+0000009Ch]
  '004FCAD5: test eax, eax
  '004FCAD7: fclex 
  '004FCAD9: jnl 4FCAEDh
  '004FCADB: push 0000009Ch
  '004FCAE0: push 0042149Ch
  '004FCAE5: push esi
  '004FCAE6: push eax
  '004FCAE7: call [004010A0h]
  '004FCAED: lea eax, [ebp-3Ch]
  '004FCAF0: lea ecx, [ebp-38h]
  '004FCAF3: push eax
  '004FCAF4: push ecx
  '004FCAF5: push 00000002h
  '004FCAF7: call [00401064h]
  '004FCAFD: add esp, 0000000Ch
  '004FCB00: push 004FCB47h
  '004FCB05: jmp 4FCB2Ah
  '004FCB07: test byte ptr [ebp-04h], 04h
  '004FCB0B: jz 4FCB16h
  '004FCB0D: lea ecx, [ebp-24h]
  '004FCB10: call [00401030h]
  '004FCB16: lea edx, [ebp-3Ch]
  '004FCB19: lea eax, [ebp-38h]
  '004FCB1C: push edx
  '004FCB1D: push eax
  '004FCB1E: push 00000002h
  '004FCB20: call [00401064h]
  '004FCB26: add esp, 0000000Ch
  '004FCB29: ret 
End Sub
Private Sub unknown_4FCCF0
  '004FCCF0: push ebp
  '004FCCF1: mov ebp, esp
  '004FCCF3: sub esp, 00000018h
  '004FCCF6: push 004081B6h
  '004FCCFB: mov eax, fs:[00h]
  '004FCD01: push eax
  '004FCD02: mov fs:[00000000h], esp
  '004FCD09: mov eax, 00000508h
  '004FCD0E: call 004081B0h
  '004FCD13: push ebx
  '004FCD14: push esi
  '004FCD15: push edi
  '004FCD16: mov [ebp-18h], esp
  '004FCD19: mov [ebp-14h], 00405B98h
  '004FCD20: mov [ebp-10h], 00000000h
  '004FCD27: mov [ebp-0Ch], 00000000h
  '004FCD2E: mov eax, [ebp+08h]
  '004FCD31: mov ecx, [eax]
  '004FCD33: mov edx, [ebp+08h]
  '004FCD36: push edx
  '004FCD37: call [ecx+04h]
  '004FCD3A: mov [ebp-04h], 00000001h
  '004FCD41: mov eax, [ebp+0Ch]
  '004FCD44: mov [eax], 00000000h
  '004FCD4A: mov [ebp-04h], 00000002h
  '004FCD51: push FFFFFFFFh
  '004FCD53: call [004010E8h]
  '004FCD59: mov [ebp-04h], 00000003h
  '004FCD60: mov edx, 004283A0h
  '004FCD65: lea ecx, [ebp-30h]
  '004FCD68: call [004012D8h]
  '004FCD6E: lea ecx, [ebp-30h]
  '004FCD71: push ecx
  '004FCD72: call 00518270h
  '004FCD77: mov edx, eax
  '004FCD79: lea ecx, [ebp-34h]
  '004FCD7C: call [00401378h]
  '004FCD82: push eax
  '004FCD83: call [004013BCh]
  '004FCD89: call [0040135Ch]
  '004FCD8F: mov [ebp-24h], eax
  '004FCD92: lea edx, [ebp-34h]
  '004FCD95: push edx
  '004FCD96: lea eax, [ebp-30h]
  '004FCD99: push eax
  '004FCD9A: push 00000002h
  '004FCD9C: call [004012E8h]
  '004FCDA2: add esp, 0000000Ch
  '004FCDA5: mov [ebp-04h], 00000004h
  '004FCDAC: mov ecx, [ebp+08h]
  '004FCDAF: mov edx, [ecx]
  '004FCDB1: mov eax, [ebp+08h]
  '004FCDB4: push eax
  '004FCDB5: call [edx+00000324h]
  '004FCDBB: push eax
  '004FCDBC: lea ecx, [ebp-64h]
  '004FCDBF: push ecx
  '004FCDC0: call [004010E4h]
  '004FCDC6: mov [ebp-000004D4h], eax
  '004FCDCC: lea edx, [ebp-000004D0h]
  '004FCDD2: push edx
  '004FCDD3: mov eax, [ebp-000004D4h]
  '004FCDD9: mov ecx, [eax]
  '004FCDDB: mov edx, [ebp-000004D4h]
  '004FCDE1: push edx
  '004FCDE2: call [ecx+000000E0h]
  '004FCDE8: fclex 
  '004FCDEA: mov [ebp-000004D8h], eax
  '004FCDF0: cmp [ebp-000004D8h], 00000000h
  '004FCDF7: jnl 4FCE1Fh
  '004FCDF9: push 000000E0h
  '004FCDFE: push 0041E108h
  '004FCE03: mov eax, [ebp-000004D4h]
  '004FCE09: push eax
  '004FCE0A: mov ecx, [ebp-000004D8h]
  '004FCE10: push ecx
  '004FCE11: call [004010A0h]
  '004FCE17: mov [ebp-00000510h], eax
  '004FCE1D: jmp 4FCE29h
  '004FCE1F: mov [ebp-00000510h], 00000000h
  '004FCE29: cmp [0054238Ch], 00000000h
  '004FCE30: jnz 4FCE4Eh
  '004FCE32: push 0054238Ch
  '004FCE37: push 0041D9E0h
  '004FCE3C: call [004012B8h]
  '004FCE42: mov [ebp-00000514h], 0054238Ch
  '004FCE4C: jmp 4FCE58h
  '004FCE4E: mov [ebp-00000514h], 0054238Ch
  '004FCE58: mov edx, [ebp-00000514h]
  '004FCE5E: mov eax, [edx]
  '004FCE60: mov [ebp-000004DCh], eax
  '004FCE66: lea ecx, [ebp-5Ch]
  '004FCE69: push ecx
  '004FCE6A: mov edx, [ebp-000004DCh]
  '004FCE70: mov eax, [edx]
  '004FCE72: mov ecx, [ebp-000004DCh]
  '004FCE78: push ecx
  '004FCE79: call [eax+14h]
  '004FCE7C: fclex 
  '004FCE7E: mov [ebp-000004E0h], eax
  '004FCE84: cmp [ebp-000004E0h], 00000000h
  '004FCE8B: jnl 4FCEB0h
  '004FCE8D: push 00000014h
  '004FCE8F: push 0041D9D0h
  '004FCE94: mov edx, [ebp-000004DCh]
  '004FCE9A: push edx
  '004FCE9B: mov eax, [ebp-000004E0h]
  '004FCEA1: push eax
  '004FCEA2: call [004010A0h]
  '004FCEA8: mov [ebp-00000518h], eax
  '004FCEAE: jmp 4FCEBAh
  '004FCEB0: mov [ebp-00000518h], 00000000h
  '004FCEBA: mov ecx, [ebp-5Ch]
  '004FCEBD: mov [ebp-000004E4h], ecx
  '004FCEC3: lea edx, [ebp-000004C8h]
  '004FCEC9: push edx
  '004FCECA: mov eax, [ebp-000004E4h]
  '004FCED0: mov ecx, [eax]
  '004FCED2: mov edx, [ebp-000004E4h]
  '004FCED8: push edx
  '004FCED9: call [ecx+000000B8h]
  '004FCEDF: fclex 
  '004FCEE1: mov [ebp-000004E8h], eax
  '004FCEE7: cmp [ebp-000004E8h], 00000000h
  '004FCEEE: jnl 4FCF16h
  '004FCEF0: push 000000B8h
  '004FCEF5: push 0041D9F0h
  '004FCEFA: mov eax, [ebp-000004E4h]
  '004FCF00: push eax
  '004FCF01: mov ecx, [ebp-000004E8h]
  '004FCF07: push ecx
  '004FCF08: call [004010A0h]
  '004FCF0E: mov [ebp-0000051Ch], eax
  '004FCF14: jmp 4FCF20h
  '004FCF16: mov [ebp-0000051Ch], 00000000h
  '004FCF20: cmp [0054238Ch], 00000000h
  '004FCF27: jnz 4FCF45h
  '004FCF29: push 0054238Ch
  '004FCF2E: push 0041D9E0h
  '004FCF33: call [004012B8h]
  '004FCF39: mov [ebp-00000520h], 0054238Ch
  '004FCF43: jmp 4FCF4Fh
  '004FCF45: mov [ebp-00000520h], 0054238Ch
  '004FCF4F: mov edx, [ebp-00000520h]
  '004FCF55: mov eax, [edx]
  '004FCF57: mov [ebp-000004ECh], eax
  '004FCF5D: lea ecx, [ebp-60h]
  '004FCF60: push ecx
  '004FCF61: mov edx, [ebp-000004ECh]
  '004FCF67: mov eax, [edx]
  '004FCF69: mov ecx, [ebp-000004ECh]
  '004FCF6F: push ecx
  '004FCF70: call [eax+14h]
  '004FCF73: fclex 
  '004FCF75: mov [ebp-000004F0h], eax
  '004FCF7B: cmp [ebp-000004F0h], 00000000h
  '004FCF82: jnl 4FCFA7h
  '004FCF84: push 00000014h
  '004FCF86: push 0041D9D0h
  '004FCF8B: mov edx, [ebp-000004ECh]
  '004FCF91: push edx
  '004FCF92: mov eax, [ebp-000004F0h]
  '004FCF98: push eax
  '004FCF99: call [004010A0h]
  '004FCF9F: mov [ebp-00000524h], eax
  '004FCFA5: jmp 4FCFB1h
  '004FCFA7: mov [ebp-00000524h], 00000000h
  '004FCFB1: mov ecx, [ebp-60h]
  '004FCFB4: mov [ebp-000004F4h], ecx
  '004FCFBA: lea edx, [ebp-000004CCh]
  '004FCFC0: push edx
  '004FCFC1: mov eax, [ebp-000004F4h]
  '004FCFC7: mov ecx, [eax]
  '004FCFC9: mov edx, [ebp-000004F4h]
  '004FCFCF: push edx
  '004FCFD0: call [ecx+000000C0h]
  '004FCFD6: fclex 
  '004FCFD8: mov [ebp-000004F8h], eax
  '004FCFDE: cmp [ebp-000004F8h], 00000000h
  '004FCFE5: jnl 4FD00Dh
  '004FCFE7: push 000000C0h
  '004FCFEC: push 0041D9F0h
  '004FCFF1: mov eax, [ebp-000004F4h]
  '004FCFF7: push eax
  '004FCFF8: mov ecx, [ebp-000004F8h]
  '004FCFFE: push ecx
  '004FCFFF: call [004010A0h]
  '004FD005: mov [ebp-00000528h], eax
  '004FD00B: jmp 4FD017h
  '004FD00D: mov [ebp-00000528h], 00000000h
  '004FD017: push 004283B0h
  '004FD01C: push 0041F414h
  '004FD021: call [0040108Ch]
  '004FD027: mov edx, eax
  '004FD029: lea ecx, [ebp-30h]
  '004FD02C: call [00401378h]
  '004FD032: push eax
  '004FD033: push 004283F4h
  '004FD038: call [0040108Ch]
  '004FD03E: mov edx, eax
  '004FD040: lea ecx, [ebp-34h]
  '004FD043: call [00401378h]
  '004FD049: push eax
  '004FD04A: mov dx, [ebp-000004C8h]
  '004FD051: push edx
  '004FD052: call [0040100Ch]
  '004FD058: mov edx, eax
  '004FD05A: lea ecx, [ebp-38h]
  '004FD05D: call [00401378h]
  '004FD063: push eax
  '004FD064: call [0040108Ch]
  '004FD06A: mov edx, eax
  '004FD06C: lea ecx, [ebp-3Ch]
  '004FD06F: call [00401378h]
  '004FD075: push eax
  '004FD076: push 0041E8A8h
  '004FD07B: call [0040108Ch]
  '004FD081: mov edx, eax
  '004FD083: lea ecx, [ebp-40h]
  '004FD086: call [00401378h]
  '004FD08C: push eax
  '004FD08D: mov ax, [ebp-000004CCh]
  '004FD094: push eax
  '004FD095: call [0040100Ch]
  '004FD09B: mov edx, eax
  '004FD09D: lea ecx, [ebp-44h]
  '004FD0A0: call [00401378h]
  '004FD0A6: push eax
  '004FD0A7: call [0040108Ch]
  '004FD0AD: mov edx, eax
  '004FD0AF: lea ecx, [ebp-48h]
  '004FD0B2: call [00401378h]
  '004FD0B8: push eax
  '004FD0B9: push 0042840Ch
  '004FD0BE: call [0040108Ch]
  '004FD0C4: mov edx, eax
  '004FD0C6: lea ecx, [ebp-4Ch]
  '004FD0C9: call [00401378h]
  '004FD0CF: push eax
  '004FD0D0: push 0041F414h
  '004FD0D5: call [0040108Ch]
  '004FD0DB: mov edx, eax
  '004FD0DD: lea ecx, [ebp-50h]
  '004FD0E0: call [00401378h]
  '004FD0E6: push eax
  '004FD0E7: push 004283B0h
  '004FD0EC: call [0040108Ch]
  '004FD0F2: mov edx, eax
  '004FD0F4: lea ecx, [ebp-54h]
  '004FD0F7: call [00401378h]
  '004FD0FD: push eax
  '004FD0FE: push 0041F414h
  '004FD103: call [0040108Ch]
  '004FD109: mov edx, eax
  '004FD10B: lea ecx, [ebp-58h]
  '004FD10E: call [00401378h]
  '004FD114: push eax
  '004FD115: push 00428420h
  '004FD11A: call [0040108Ch]
  '004FD120: mov [ebp-0000009Ch], eax
  '004FD126: mov [ebp-000000A4h], 00000008h
  '004FD130: mov [ebp-000002DCh], 00428460h
  '004FD13A: mov [ebp-000002E4h], 00000008h
  '004FD144: lea edx, [ebp-000002E4h]
  '004FD14A: lea ecx, [ebp-00000084h]
  '004FD150: call [00401338h]
  '004FD156: mov [ebp-000002CCh], 00427E0Ch
  '004FD160: mov [ebp-000002D4h], 00000008h
  '004FD16A: lea edx, [ebp-000002D4h]
  '004FD170: lea ecx, [ebp-74h]
  '004FD173: call [00401338h]
  '004FD179: xor ecx, ecx
  '004FD17B: cmp word ptr [ebp-000004D0h], 0001h
  '004FD183: setz cl
  '004FD186: neg ecx
  '004FD188: mov [ebp-000002BCh], cx
  '004FD18F: mov [ebp-000002C4h], 0000000Bh
  '004FD199: lea edx, [ebp-00000084h]
  '004FD19F: push edx
  '004FD1A0: lea eax, [ebp-74h]
  '004FD1A3: push eax
  '004FD1A4: lea ecx, [ebp-000002C4h]
  '004FD1AA: push ecx
  '004FD1AB: lea edx, [ebp-00000094h]
  '004FD1B1: push edx
  '004FD1B2: call [004012DCh]
  '004FD1B8: mov [ebp-000002ECh], 0041F414h
  '004FD1C2: mov [ebp-000002F4h], 00000008h
  '004FD1CC: mov [ebp-000002FCh], 00428478h
  '004FD1D6: mov [ebp-00000304h], 00000008h
  '004FD1E0: call 00517BF0h
  '004FD1E5: mov [ebp-000000DCh], eax
  '004FD1EB: mov [ebp-000000E4h], 00000008h
  '004FD1F5: mov [ebp-0000030Ch], 0041F414h
  '004FD1FF: mov [ebp-00000314h], 00000008h
  '004FD209: mov [ebp-0000031Ch], 004284A8h
  '004FD213: mov [ebp-00000324h], 00000008h
  '004FD21D: mov [ebp-0000032Ch], 0041F414h
  '004FD227: mov [ebp-00000334h], 00000008h
  '004FD231: mov [ebp-0000033Ch], 004284D8h
  '004FD23B: mov [ebp-00000344h], 00000008h
  '004FD245: mov [ebp-0000034Ch], 0041F414h
  '004FD24F: mov [ebp-00000354h], 00000008h
  '004FD259: mov [ebp-0000035Ch], 0042851Ch
  '004FD263: mov [ebp-00000364h], 00000008h
  '004FD26D: mov [ebp-0000036Ch], 0041F414h
  '004FD277: mov [ebp-00000374h], 00000008h
  '004FD281: mov [ebp-0000037Ch], 0042856Ch
  '004FD28B: mov [ebp-00000384h], 00000008h
  '004FD295: mov [ebp-0000038Ch], 0041F414h
  '004FD29F: mov [ebp-00000394h], 00000008h
  '004FD2A9: mov [ebp-0000039Ch], 004285DCh
  '004FD2B3: mov [ebp-000003A4h], 00000008h
  '004FD2BD: mov [ebp-000003ACh], 0041F414h
  '004FD2C7: mov [ebp-000003B4h], 00000008h
  '004FD2D1: mov [ebp-000003BCh], 00428654h
  '004FD2DB: mov [ebp-000003C4h], 00000008h
  '004FD2E5: mov [ebp-000003CCh], 0041F414h
  '004FD2EF: mov [ebp-000003D4h], 00000008h
  '004FD2F9: mov [ebp-000003DCh], 004286A8h
  '004FD303: mov [ebp-000003E4h], 00000008h
  '004FD30D: mov [ebp-000003ECh], 0041F414h
  '004FD317: mov [ebp-000003F4h], 00000008h
  '004FD321: mov [ebp-000003FCh], 004286F4h
  '004FD32B: mov [ebp-00000404h], 00000008h
  '004FD335: mov [ebp-0000040Ch], 0041F414h
  '004FD33F: mov [ebp-00000414h], 00000008h
  '004FD349: mov [ebp-0000041Ch], 00428740h
  '004FD353: mov [ebp-00000424h], 00000008h
  '004FD35D: mov [ebp-0000042Ch], 0041F414h
  '004FD367: mov [ebp-00000434h], 00000008h
  '004FD371: mov [ebp-0000043Ch], 004287A4h
  '004FD37B: mov [ebp-00000444h], 00000008h
  '004FD385: mov [ebp-0000044Ch], 0041F414h
  '004FD38F: mov [ebp-00000454h], 00000008h
  '004FD399: mov [ebp-0000045Ch], 004287ECh
  '004FD3A3: mov [ebp-00000464h], 00000008h
  '004FD3AD: mov [ebp-0000046Ch], 0041F414h
  '004FD3B7: mov [ebp-00000474h], 00000008h
  '004FD3C1: mov [ebp-0000047Ch], 00428830h
  '004FD3CB: mov [ebp-00000484h], 00000008h
  '004FD3D5: mov [ebp-0000048Ch], 0041F414h
  '004FD3DF: mov [ebp-00000494h], 00000008h
  '004FD3E9: mov [ebp-0000049Ch], 00428874h
  '004FD3F3: mov [ebp-000004A4h], 00000008h
  '004FD3FD: mov [ebp-000004ACh], 0041F414h
  '004FD407: mov [ebp-000004B4h], 00000008h
  '004FD411: mov [ebp-000004BCh], 0041BC60h
  '004FD41B: mov [ebp-000004C4h], 00000008h
  '004FD425: lea eax, [ebp-000000A4h]
  '004FD42B: push eax
  '004FD42C: lea ecx, [ebp-00000094h]
  '004FD432: push ecx
  '004FD433: lea edx, [ebp-000000B4h]
  '004FD439: push edx
  '004FD43A: call [00401274h]
  '004FD440: push eax
  '004FD441: lea eax, [ebp-000002F4h]
  '004FD447: push eax
  '004FD448: lea ecx, [ebp-000000C4h]
  '004FD44E: push ecx
  '004FD44F: call [00401274h]
  '004FD455: push eax
  '004FD456: lea edx, [ebp-00000304h]
  '004FD45C: push edx
  '004FD45D: lea eax, [ebp-000000D4h]
  '004FD463: push eax
  '004FD464: call [00401274h]
  '004FD46A: push eax
  '004FD46B: lea ecx, [ebp-000000E4h]
  '004FD471: push ecx
  '004FD472: lea edx, [ebp-000000F4h]
  '004FD478: push edx
  '004FD479: call [00401274h]
  '004FD47F: push eax
  '004FD480: lea eax, [ebp-00000314h]
  '004FD486: push eax
  '004FD487: lea ecx, [ebp-00000104h]
  '004FD48D: push ecx
  '004FD48E: call [00401274h]
  '004FD494: push eax
  '004FD495: lea edx, [ebp-00000324h]
  '004FD49B: push edx
  '004FD49C: lea eax, [ebp-00000114h]
  '004FD4A2: push eax
  '004FD4A3: call [00401274h]
  '004FD4A9: push eax
  '004FD4AA: lea ecx, [ebp-00000334h]
  '004FD4B0: push ecx
  '004FD4B1: lea edx, [ebp-00000124h]
  '004FD4B7: push edx
  '004FD4B8: call [00401274h]
  '004FD4BE: push eax
  '004FD4BF: lea eax, [ebp-00000344h]
  '004FD4C5: push eax
  '004FD4C6: lea ecx, [ebp-00000134h]
  '004FD4CC: push ecx
  '004FD4CD: call [00401274h]
  '004FD4D3: push eax
  '004FD4D4: lea edx, [ebp-00000354h]
  '004FD4DA: push edx
  '004FD4DB: lea eax, [ebp-00000144h]
  '004FD4E1: push eax
  '004FD4E2: call [00401274h]
  '004FD4E8: push eax
  '004FD4E9: lea ecx, [ebp-00000364h]
  '004FD4EF: push ecx
  '004FD4F0: lea edx, [ebp-00000154h]
  '004FD4F6: push edx
  '004FD4F7: call [00401274h]
  '004FD4FD: push eax
  '004FD4FE: lea eax, [ebp-00000374h]
  '004FD504: push eax
  '004FD505: lea ecx, [ebp-00000164h]
  '004FD50B: push ecx
  '004FD50C: call [00401274h]
  '004FD512: push eax
  '004FD513: lea edx, [ebp-00000384h]
  '004FD519: push edx
  '004FD51A: lea eax, [ebp-00000174h]
  '004FD520: push eax
  '004FD521: call [00401274h]
  '004FD527: push eax
  '004FD528: lea ecx, [ebp-00000394h]
  '004FD52E: push ecx
  '004FD52F: lea edx, [ebp-00000184h]
  '004FD535: push edx
  '004FD536: call [00401274h]
  '004FD53C: push eax
  '004FD53D: lea eax, [ebp-000003A4h]
  '004FD543: push eax
  '004FD544: lea ecx, [ebp-00000194h]
  '004FD54A: push ecx
  '004FD54B: call [00401274h]
  '004FD551: push eax
  '004FD552: lea edx, [ebp-000003B4h]
  '004FD558: push edx
  '004FD559: lea eax, [ebp-000001A4h]
  '004FD55F: push eax
  '004FD560: call [00401274h]
  '004FD566: push eax
  '004FD567: lea ecx, [ebp-000003C4h]
  '004FD56D: push ecx
  '004FD56E: lea edx, [ebp-000001B4h]
  '004FD574: push edx
  '004FD575: call [00401274h]
  '004FD57B: push eax
  '004FD57C: lea eax, [ebp-000003D4h]
  '004FD582: push eax
  '004FD583: lea ecx, [ebp-000001C4h]
  '004FD589: push ecx
  '004FD58A: call [00401274h]
  '004FD590: push eax
  '004FD591: lea edx, [ebp-000003E4h]
  '004FD597: push edx
  '004FD598: lea eax, [ebp-000001D4h]
  '004FD59E: push eax
  '004FD59F: call [00401274h]
  '004FD5A5: push eax
  '004FD5A6: lea ecx, [ebp-000003F4h]
  '004FD5AC: push ecx
  '004FD5AD: lea edx, [ebp-000001E4h]
  '004FD5B3: push edx
  '004FD5B4: call [00401274h]
  '004FD5BA: push eax
  '004FD5BB: lea eax, [ebp-00000404h]
  '004FD5C1: push eax
  '004FD5C2: lea ecx, [ebp-000001F4h]
  '004FD5C8: push ecx
  '004FD5C9: call [00401274h]
  '004FD5CF: push eax
  '004FD5D0: lea edx, [ebp-00000414h]
  '004FD5D6: push edx
  '004FD5D7: lea eax, [ebp-00000204h]
  '004FD5DD: push eax
  '004FD5DE: call [00401274h]
  '004FD5E4: push eax
  '004FD5E5: lea ecx, [ebp-00000424h]
  '004FD5EB: push ecx
  '004FD5EC: lea edx, [ebp-00000214h]
  '004FD5F2: push edx
  '004FD5F3: call [00401274h]
  '004FD5F9: push eax
  '004FD5FA: lea eax, [ebp-00000434h]
  '004FD600: push eax
  '004FD601: lea ecx, [ebp-00000224h]
  '004FD607: push ecx
  '004FD608: call [00401274h]
  '004FD60E: push eax
  '004FD60F: lea edx, [ebp-00000444h]
  '004FD615: push edx
  '004FD616: lea eax, [ebp-00000234h]
  '004FD61C: push eax
  '004FD61D: call [00401274h]
  '004FD623: push eax
  '004FD624: lea ecx, [ebp-00000454h]
  '004FD62A: push ecx
  '004FD62B: lea edx, [ebp-00000244h]
  '004FD631: push edx
  '004FD632: call [00401274h]
  '004FD638: push eax
  '004FD639: lea eax, [ebp-00000464h]
  '004FD63F: push eax
  '004FD640: lea ecx, [ebp-00000254h]
  '004FD646: push ecx
  '004FD647: call [00401274h]
  '004FD64D: push eax
  '004FD64E: lea edx, [ebp-00000474h]
  '004FD654: push edx
  '004FD655: lea eax, [ebp-00000264h]
  '004FD65B: push eax
  '004FD65C: call [00401274h]
  '004FD662: push eax
  '004FD663: lea ecx, [ebp-00000484h]
  '004FD669: push ecx
  '004FD66A: lea edx, [ebp-00000274h]
  '004FD670: push edx
  '004FD671: call [00401274h]
  '004FD677: push eax
  '004FD678: lea eax, [ebp-00000494h]
  '004FD67E: push eax
  '004FD67F: lea ecx, [ebp-00000284h]
  '004FD685: push ecx
  '004FD686: call [00401274h]
  '004FD68C: push eax
  '004FD68D: lea edx, [ebp-000004A4h]
  '004FD693: push edx
  '004FD694: lea eax, [ebp-00000294h]
  '004FD69A: push eax
  '004FD69B: call [00401274h]
  '004FD6A1: push eax
  '004FD6A2: lea ecx, [ebp-000004B4h]
  '004FD6A8: push ecx
  '004FD6A9: lea edx, [ebp-000002A4h]
  '004FD6AF: push edx
  '004FD6B0: call [00401274h]
  '004FD6B6: push eax
  '004FD6B7: lea eax, [ebp-000004C4h]
  '004FD6BD: push eax
  '004FD6BE: lea ecx, [ebp-000002B4h]
  '004FD6C4: push ecx
  '004FD6C5: call [00401274h]
  '004FD6CB: push eax
  '004FD6CC: call [0040103Ch]
  '004FD6D2: mov edx, eax
  '004FD6D4: lea ecx, [ebp-28h]
  '004FD6D7: call [00401378h]
  '004FD6DD: lea edx, [ebp-58h]
  '004FD6E0: push edx
  '004FD6E1: lea eax, [ebp-54h]
  '004FD6E4: push eax
  '004FD6E5: lea ecx, [ebp-50h]
  '004FD6E8: push ecx
  '004FD6E9: lea edx, [ebp-4Ch]
  '004FD6EC: push edx
  '004FD6ED: lea eax, [ebp-48h]
  '004FD6F0: push eax
  '004FD6F1: lea ecx, [ebp-44h]
  '004FD6F4: push ecx
  '004FD6F5: lea edx, [ebp-40h]
  '004FD6F8: push edx
  '004FD6F9: lea eax, [ebp-3Ch]
  '004FD6FC: push eax
  '004FD6FD: lea ecx, [ebp-38h]
  '004FD700: push ecx
  '004FD701: lea edx, [ebp-34h]
  '004FD704: push edx
  '004FD705: lea eax, [ebp-30h]
  '004FD708: push eax
  '004FD709: push 0000000Bh
  '004FD70B: call [004012E8h]
  '004FD711: add esp, 00000030h
  '004FD714: lea ecx, [ebp-64h]
  '004FD717: push ecx
  '004FD718: lea edx, [ebp-60h]
  '004FD71B: push edx
  '004FD71C: lea eax, [ebp-5Ch]
  '004FD71F: push eax
  '004FD720: push 00000003h
  '004FD722: call [00401064h]
  '004FD728: add esp, 00000010h
  '004FD72B: lea ecx, [ebp-00000234h]
  '004FD731: push ecx
  '004FD732: lea edx, [ebp-00000224h]
  '004FD738: push edx
  '004FD739: lea eax, [ebp-00000214h]
  '004FD73F: push eax
  '004FD740: lea ecx, [ebp-00000204h]
  '004FD746: push ecx
  '004FD747: lea edx, [ebp-000001F4h]
  '004FD74D: push edx
  '004FD74E: lea eax, [ebp-000001E4h]
  '004FD754: push eax
  '004FD755: lea ecx, [ebp-000001D4h]
  '004FD75B: push ecx
  '004FD75C: lea edx, [ebp-000001C4h]
  '004FD762: push edx
  '004FD763: lea eax, [ebp-000001B4h]
  '004FD769: push eax
  '004FD76A: lea ecx, [ebp-000001A4h]
  '004FD770: push ecx
  '004FD771: lea edx, [ebp-00000194h]
  '004FD777: push edx
  '004FD778: lea eax, [ebp-00000184h]
  '004FD77E: push eax
  '004FD77F: lea ecx, [ebp-00000174h]
  '004FD785: push ecx
  '004FD786: lea edx, [ebp-00000164h]
  '004FD78C: push edx
  '004FD78D: lea eax, [ebp-00000154h]
  '004FD793: push eax
  '004FD794: lea ecx, [ebp-00000144h]
  '004FD79A: push ecx
  '004FD79B: lea edx, [ebp-00000134h]
  '004FD7A1: push edx
  '004FD7A2: lea eax, [ebp-00000124h]
  '004FD7A8: push eax
  '004FD7A9: lea ecx, [ebp-00000114h]
  '004FD7AF: push ecx
  '004FD7B0: lea edx, [ebp-00000104h]
  '004FD7B6: push edx
  '004FD7B7: lea eax, [ebp-000000F4h]
  '004FD7BD: push eax
  '004FD7BE: lea ecx, [ebp-000000E4h]
  '004FD7C4: push ecx
  '004FD7C5: lea edx, [ebp-000000D4h]
  '004FD7CB: push edx
  '004FD7CC: lea eax, [ebp-000000C4h]
  '004FD7D2: push eax
  '004FD7D3: lea ecx, [ebp-000000B4h]
  '004FD7D9: push ecx
  '004FD7DA: lea edx, [ebp-00000094h]
  '004FD7E0: push edx
  '004FD7E1: lea eax, [ebp-000000A4h]
  '004FD7E7: push eax
  '004FD7E8: lea ecx, [ebp-00000084h]
  '004FD7EE: push ecx
  '004FD7EF: lea edx, [ebp-74h]
  '004FD7F2: push edx
  '004FD7F3: lea eax, [ebp-000002C4h]
  '004FD7F9: push eax
  '004FD7FA: lea ecx, [ebp-000002B4h]
  '004FD800: push ecx
  '004FD801: lea edx, [ebp-000002A4h]
  '004FD807: push edx
  '004FD808: lea eax, [ebp-00000294h]
  '004FD80E: push eax
  '004FD80F: lea ecx, [ebp-00000284h]
  '004FD815: push ecx
  '004FD816: lea edx, [ebp-00000274h]
  '004FD81C: push edx
  '004FD81D: lea eax, [ebp-00000264h]
  '004FD823: push eax
  '004FD824: lea ecx, [ebp-00000254h]
  '004FD82A: push ecx
  '004FD82B: lea edx, [ebp-00000244h]
  '004FD831: push edx
  '004FD832: push 00000026h
  '004FD834: call [00401050h]
  '004FD83A: add esp, 0000009Ch
  '004FD840: mov [ebp-04h], 00000005h
  '004FD847: lea eax, [ebp-28h]
  '004FD84A: push eax
  '004FD84B: call 00518270h
  '004FD850: mov edx, eax
  '004FD852: lea ecx, [ebp-2Ch]
  '004FD855: call [00401378h]
  '004FD85B: wait 
  '004FD85C: push 004FD9E0h
  '004FD861: jmp 004FD9D6h
  '004FD866: mov ecx, [ebp-10h]
  '004FD869: and ecx, 00000004h
  '004FD86C: test ecx, ecx
  '004FD86E: jz 4FD879h
  '004FD870: lea ecx, [ebp-2Ch]
  '004FD873: call [004013B4h]
  '004FD879: lea edx, [ebp-58h]
  '004FD87C: push edx
  '004FD87D: lea eax, [ebp-54h]
  '004FD880: push eax
  '004FD881: lea ecx, [ebp-50h]
  '004FD884: push ecx
  '004FD885: lea edx, [ebp-4Ch]
  '004FD888: push edx
  '004FD889: lea eax, [ebp-48h]
  '004FD88C: push eax
  '004FD88D: lea ecx, [ebp-44h]
  '004FD890: push ecx
  '004FD891: lea edx, [ebp-40h]
  '004FD894: push edx
  '004FD895: lea eax, [ebp-3Ch]
  '004FD898: push eax
  '004FD899: lea ecx, [ebp-38h]
  '004FD89C: push ecx
  '004FD89D: lea edx, [ebp-34h]
  '004FD8A0: push edx
  '004FD8A1: lea eax, [ebp-30h]
  '004FD8A4: push eax
  '004FD8A5: push 0000000Bh
  '004FD8A7: call [004012E8h]
  '004FD8AD: add esp, 00000030h
  '004FD8B0: lea ecx, [ebp-64h]
  '004FD8B3: push ecx
  '004FD8B4: lea edx, [ebp-60h]
  '004FD8B7: push edx
  '004FD8B8: lea eax, [ebp-5Ch]
  '004FD8BB: push eax
  '004FD8BC: push 00000003h
  '004FD8BE: call [00401064h]
  '004FD8C4: add esp, 00000010h
  '004FD8C7: lea ecx, [ebp-000002B4h]
  '004FD8CD: push ecx
  '004FD8CE: lea edx, [ebp-000002A4h]
  '004FD8D4: push edx
  '004FD8D5: lea eax, [ebp-00000294h]
  '004FD8DB: push eax
  '004FD8DC: lea ecx, [ebp-00000284h]
  '004FD8E2: push ecx
  '004FD8E3: lea edx, [ebp-00000274h]
  '004FD8E9: push edx
  '004FD8EA: lea eax, [ebp-00000264h]
  '004FD8F0: push eax
  '004FD8F1: lea ecx, [ebp-00000254h]
  '004FD8F7: push ecx
  '004FD8F8: lea edx, [ebp-00000244h]
  '004FD8FE: push edx
  '004FD8FF: lea eax, [ebp-00000234h]
  '004FD905: push eax
  '004FD906: lea ecx, [ebp-00000224h]
  '004FD90C: push ecx
  '004FD90D: lea edx, [ebp-00000214h]
  '004FD913: push edx
  '004FD914: lea eax, [ebp-00000204h]
  '004FD91A: push eax
  '004FD91B: lea ecx, [ebp-000001F4h]
  '004FD921: push ecx
  '004FD922: lea edx, [ebp-000001E4h]
  '004FD928: push edx
  '004FD929: lea eax, [ebp-000001D4h]
  '004FD92F: push eax
  '004FD930: lea ecx, [ebp-000001C4h]
  '004FD936: push ecx
  '004FD937: lea edx, [ebp-000001B4h]
  '004FD93D: push edx
  '004FD93E: lea eax, [ebp-000001A4h]
  '004FD944: push eax
  '004FD945: lea ecx, [ebp-00000194h]
  '004FD94B: push ecx
  '004FD94C: lea edx, [ebp-00000184h]
  '004FD952: push edx
  '004FD953: lea eax, [ebp-00000174h]
  '004FD959: push eax
  '004FD95A: lea ecx, [ebp-00000164h]
  '004FD960: push ecx
  '004FD961: lea edx, [ebp-00000154h]
  '004FD967: push edx
  '004FD968: lea eax, [ebp-00000144h]
  '004FD96E: push eax
  '004FD96F: lea ecx, [ebp-00000134h]
  '004FD975: push ecx
  '004FD976: lea edx, [ebp-00000124h]
  '004FD97C: push edx
  '004FD97D: lea eax, [ebp-00000114h]
  '004FD983: push eax
  '004FD984: lea ecx, [ebp-00000104h]
  '004FD98A: push ecx
  '004FD98B: lea edx, [ebp-000000F4h]
  '004FD991: push edx
  '004FD992: lea eax, [ebp-000000E4h]
  '004FD998: push eax
  '004FD999: lea ecx, [ebp-000000D4h]
  '004FD99F: push ecx
  '004FD9A0: lea edx, [ebp-000000C4h]
  '004FD9A6: push edx
  '004FD9A7: lea eax, [ebp-000000B4h]
  '004FD9AD: push eax
  '004FD9AE: lea ecx, [ebp-000000A4h]
  '004FD9B4: push ecx
  '004FD9B5: lea edx, [ebp-00000094h]
  '004FD9BB: push edx
  '004FD9BC: lea eax, [ebp-00000084h]
  '004FD9C2: push eax
  '004FD9C3: lea ecx, [ebp-74h]
  '004FD9C6: push ecx
  '004FD9C7: push 00000025h
  '004FD9C9: call [00401050h]
  '004FD9CF: add esp, 00000098h
  '004FD9D5: ret 
End Sub
Private Sub unknown_4FB8C0
  '004FB8C0: push ebp
  '004FB8C1: mov ebp, esp
  '004FB8C3: sub esp, 00000008h
  '004FB8C6: push 004081B6h
  '004FB8CB: mov eax, fs:[00h]
  '004FB8D1: push eax
  '004FB8D2: mov fs:[00000000h], esp
  '004FB8D9: sub esp, 00000010h
  '004FB8DC: push ebx
  '004FB8DD: push esi
  '004FB8DE: push edi
  '004FB8DF: mov [ebp-08h], esp
  '004FB8E2: mov [ebp-04h], 00405A90h
  '004FB8E9: mov eax, [54238Ch]
  '004FB8EE: mov [ebp-14h], 00000000h
  '004FB8F5: test eax, eax
  '004FB8F7: jnz 4FB909h
  '004FB8F9: push 0054238Ch
  '004FB8FE: push 0041D9E0h
  '004FB903: call [004012B8h]
  '004FB909: mov eax, [ebp+08h]
  '004FB90C: mov esi, [0054238Ch]
  '004FB912: lea ecx, [ebp-14h]
  '004FB915: push eax
  '004FB916: mov edi, [esi]
  '004FB918: push ecx
  '004FB919: call [004010F8h]
  '004FB91F: push eax
  '004FB920: push esi
  '004FB921: call [edi+10h]
  '004FB924: test eax, eax
  '004FB926: fclex 
  '004FB928: jnl 4FB939h
  '004FB92A: push 00000010h
  '004FB92C: push 0041D9D0h
  '004FB931: push esi
  '004FB932: push eax
  '004FB933: call [004010A0h]
  '004FB939: lea ecx, [ebp-14h]
  '004FB93C: call [004013B8h]
  '004FB942: push 004FB954h
  '004FB947: jmp 4FB953h
  '004FB949: lea ecx, [ebp-14h]
  '004FB94C: call [004013B8h]
  '004FB952: ret 
End Sub
Private Sub unknown_4FB970
  '004FB970: push ebp
  '004FB971: mov ebp, esp
  '004FB973: sub esp, 00000008h
  '004FB976: push 004081B6h
  '004FB97B: mov eax, fs:[00h]
  '004FB981: push eax
  '004FB982: mov fs:[00000000h], esp
  '004FB989: sub esp, 00000030h
  '004FB98C: push ebx
  '004FB98D: push esi
  '004FB98E: push edi
  '004FB98F: mov [ebp-08h], esp
  '004FB992: mov [ebp-04h], 00405AA0h
  '004FB999: sub esp, 00000010h
  '004FB99C: mov ecx, 00000008h
  '004FB9A1: mov edi, esp
  '004FB9A3: mov esi, ecx
  '004FB9A5: mov eax, 004280DCh
  '004FB9AA: sub esp, 00000010h
  '004FB9AD: mov [edi], ecx
  '004FB9AF: mov ecx, [ebp-30h]
  '004FB9B2: mov edx, 0041EA6Ch
  '004FB9B7: mov [ebp-14h], 00000000h
  '004FB9BE: mov [edi+04h], ecx
  '004FB9C1: mov ecx, esp
  '004FB9C3: push 0041EA58h
  '004FB9C8: mov [edi+08h], eax
  '004FB9CB: mov eax, [ebp-28h]
  '004FB9CE: mov [edi+0Ch], eax
  '004FB9D1: mov eax, [ebp-20h]
  '004FB9D4: mov [ecx], esi
  '004FB9D6: mov [ecx+04h], eax
  '004FB9D9: mov [ecx+08h], edx
  '004FB9DC: mov edx, [ebp-18h]
  '004FB9DF: mov [ecx+0Ch], edx
  '004FB9E2: call [00401014h]
  '004FB9E8: call [00401104h]
  '004FB9EE: mov eax, [541024h]
  '004FB9F3: test eax, eax
  '004FB9F5: jnz 4FBA07h
  '004FB9F7: push 00541024h
  '004FB9FC: push 00413334h
  '004FBA01: call [004012B8h]
  '004FBA07: mov esi, [00541024h]
  '004FBA0D: mov edx, 004280FCh
  '004FBA12: lea ecx, [ebp-14h]
  '004FBA15: call [004012D8h]
  '004FBA1B: mov eax, [esi]
  '004FBA1D: lea ecx, [ebp-14h]
  '004FBA20: push ecx
  '004FBA21: push esi
  '004FBA22: call [eax+0000071Ch]
  '004FBA28: test eax, eax
  '004FBA2A: fclex 
  '004FBA2C: jnl 4FBA40h
  '004FBA2E: push 0000071Ch
  '004FBA33: push 0041C118h
  '004FBA38: push esi
  '004FBA39: push eax
  '004FBA3A: call [004010A0h]
  '004FBA40: lea ecx, [ebp-14h]
  '004FBA43: call [004013B4h]
  '004FBA49: push 004FBA5Bh
  '004FBA4E: jmp 4FBA5Ah
  '004FBA50: lea ecx, [ebp-14h]
  '004FBA53: call [004013B4h]
  '004FBA59: ret 
End Sub
Private Sub unknown_4FBD50
  '004FBD50: push ebp
  '004FBD51: mov ebp, esp
  '004FBD53: sub esp, 00000008h
  '004FBD56: push 004081B6h
  '004FBD5B: mov eax, fs:[00h]
  '004FBD61: push eax
  '004FBD62: mov fs:[00000000h], esp
  '004FBD69: sub esp, 0000004Ch
  '004FBD6C: push ebx
  '004FBD6D: push esi
  '004FBD6E: push edi
  '004FBD6F: mov [ebp-08h], esp
  '004FBD72: mov [ebp-04h], 00405AF8h
  '004FBD79: sub esp, 00000010h
  '004FBD7C: mov ecx, 0000000Ah
  '004FBD81: mov edx, esp
  '004FBD83: mov [ebp-50h], ecx
  '004FBD86: mov eax, 80020004h
  '004FBD8B: xor edi, edi
  '004FBD8D: mov [edx], ecx
  '004FBD8F: mov ecx, [ebp-4Ch]
  '004FBD92: mov [ebp-48h], eax
  '004FBD95: push 0042822Ch
  '004FBD9A: mov [edx+04h], ecx
  '004FBD9D: mov ecx, [ebp+0Ch]
  '004FBDA0: mov [ebp-20h], edi
  '004FBDA3: mov [ebp-24h], edi
  '004FBDA6: mov [edx+08h], eax
  '004FBDA9: mov eax, [ebp-44h]
  '004FBDAC: mov [ebp-28h], edi
  '004FBDAF: mov [ebp-2Ch], edi
  '004FBDB2: mov [edx+0Ch], eax
  '004FBDB5: mov dx, [ecx]
  '004FBDB8: add dx, 0001h
  '004FBDBC: mov [ebp-30h], edi
  '004FBDBF: jo 004FBF88h
  '004FBDC5: push edx
  '004FBDC6: mov [ebp-40h], edi
  '004FBDC9: call [0040100Ch]
  '004FBDCF: mov esi, [00401378h]
  '004FBDD5: mov edx, eax
  '004FBDD7: lea ecx, [ebp-24h]
  '004FBDDA: call esi
  '004FBDDC: mov ebx, [0040108Ch]
  '004FBDE2: push eax
  '004FBDE3: call ebx
  '004FBDE5: mov edx, eax
  '004FBDE7: lea ecx, [ebp-28h]
  '004FBDEA: call esi
  '004FBDEC: push eax
  '004FBDED: push 0041EA6Ch
  '004FBDF2: push 0041EA58h
  '004FBDF7: call [00401314h]
  '004FBDFD: lea edx, [ebp-40h]
  '004FBE00: lea ecx, [ebp-20h]
  '004FBE03: mov [ebp-38h], eax
  '004FBE06: mov [ebp-40h], 00000008h
  '004FBE0D: call [00401020h]
  '004FBE13: lea eax, [ebp-28h]
  '004FBE16: lea ecx, [ebp-24h]
  '004FBE19: push eax
  '004FBE1A: push ecx
  '004FBE1B: push 00000002h
  '004FBE1D: call [004012E8h]
  '004FBE23: add esp, 0000000Ch
  '004FBE26: lea edx, [ebp-20h]
  '004FBE29: lea eax, [ebp-50h]
  '004FBE2C: mov [ebp-48h], 0041BC60h
  '004FBE33: push edx
  '004FBE34: push eax
  '004FBE35: mov [ebp-50h], 00008008h
  '004FBE3C: call [00401308h]
  '004FBE42: test ax, ax
  '004FBE45: jz 004FBED5h
  '004FBE4B: mov eax, [ebp+08h]
  '004FBE4E: push eax
  '004FBE4F: mov ecx, [eax]
  '004FBE51: call [ecx+0000035Ch]
  '004FBE57: lea edx, [ebp-30h]
  '004FBE5A: push eax
  '004FBE5B: push edx
  '004FBE5C: call [004010E4h]
  '004FBE62: mov esi, eax
  '004FBE64: lea eax, [ebp-20h]
  '004FBE67: lea ecx, [ebp-24h]
  '004FBE6A: push eax
  '004FBE6B: mov ebx, [esi]
  '004FBE6D: push ecx
  '004FBE6E: call [0040126Ch]
  '004FBE74: push eax
  '004FBE75: push esi
  '004FBE76: call [ebx+000000A4h]
  '004FBE7C: cmp eax, edi
  '004FBE7E: fclex 
  '004FBE80: jnl 4FBE94h
  '004FBE82: push 000000A4h
  '004FBE87: push 0041E3FCh
  '004FBE8C: push esi
  '004FBE8D: push eax
  '004FBE8E: call [004010A0h]
  '004FBE94: mov esi, [004013B4h]
  '004FBE9A: lea ecx, [ebp-24h]
  '004FBE9D: call esi
  '004FBE9F: lea ecx, [ebp-30h]
  '004FBEA2: call [004013B8h]
  '004FBEA8: mov edx, 00428240h
  '004FBEAD: lea ecx, [ebp-24h]
  '004FBEB0: call [004012D8h]
  '004FBEB6: mov eax, [ebp+08h]
  '004FBEB9: lea ecx, [ebp-24h]
  '004FBEBC: push ecx
  '004FBEBD: push eax
  '004FBEBE: mov edx, [eax]
  '004FBEC0: call [edx+00000734h]
  '004FBEC6: lea ecx, [ebp-24h]
  '004FBEC9: call esi
  '004FBECB: push 004FBF73h
  '004FBED0: jmp 004FBF69h
  '004FBED5: mov edx, [ebp+0Ch]
  '004FBED8: push 004282B0h
  '004FBEDD: mov ax, [edx]
  '004FBEE0: add ax, 0001h
  '004FBEE4: jo 004FBF88h
  '004FBEEA: push eax
  '004FBEEB: call [0040100Ch]
  '004FBEF1: mov edx, eax
  '004FBEF3: lea ecx, [ebp-24h]
  '004FBEF6: call esi
  '004FBEF8: push eax
  '004FBEF9: call ebx
  '004FBEFB: mov edx, eax
  '004FBEFD: lea ecx, [ebp-28h]
  '004FBF00: call esi
  '004FBF02: push eax
  '004FBF03: push 004282ECh
  '004FBF08: call ebx
  '004FBF0A: mov edx, eax
  '004FBF0C: lea ecx, [ebp-2Ch]
  '004FBF0F: call esi
  '004FBF11: mov eax, [ebp+08h]
  '004FBF14: lea edx, [ebp-2Ch]
  '004FBF17: push edx
  '004FBF18: push eax
  '004FBF19: mov ecx, [eax]
  '004FBF1B: call [ecx+00000734h]
  '004FBF21: lea eax, [ebp-2Ch]
  '004FBF24: lea ecx, [ebp-28h]
  '004FBF27: push eax
  '004FBF28: lea edx, [ebp-24h]
  '004FBF2B: push ecx
  '004FBF2C: push edx
  '004FBF2D: push 00000003h
  '004FBF2F: call [004012E8h]
  '004FBF35: add esp, 00000010h
  '004FBF38: push 004FBF73h
  '004FBF3D: jmp 4FBF69h
  '004FBF3F: lea eax, [ebp-2Ch]
  '004FBF42: lea ecx, [ebp-28h]
  '004FBF45: push eax
  '004FBF46: lea edx, [ebp-24h]
  '004FBF49: push ecx
  '004FBF4A: push edx
  '004FBF4B: push 00000003h
  '004FBF4D: call [004012E8h]
  '004FBF53: add esp, 00000010h
  '004FBF56: lea ecx, [ebp-30h]
  '004FBF59: call [004013B8h]
  '004FBF5F: lea ecx, [ebp-40h]
  '004FBF62: call [00401030h]
  '004FBF68: ret 
End Sub
Private Sub unknown_4FC2D0
  '004FC2D0: sub esp, 00000008h
  '004FC2D3: push esi
  '004FC2D4: push edi
  '004FC2D5: mov [esp+0Ch], 00000000h
  '004FC2DD: mov [esp+08h], 00000000h
  '004FC2E5: call 0041E080h
  '004FC2EA: mov edi, [0040109Ch]
  '004FC2F0: call edi
  '004FC2F2: mov esi, [esp+14h]
  '004FC2F6: lea ecx, [esp+0Ch]
  '004FC2FA: push ecx
  '004FC2FB: push esi
  '004FC2FC: mov eax, [esi]
  '004FC2FE: call [eax+58h]
  '004FC301: test eax, eax
  '004FC303: fclex 
  '004FC305: jnl 4FC316h
  '004FC307: push 00000058h
  '004FC309: push 0041DE38h
  '004FC30E: push esi
  '004FC30F: push eax
  '004FC310: call [004010A0h]
  '004FC316: mov eax, [esp+0Ch]
  '004FC31A: lea edx, [esp+08h]
  '004FC31E: push edx
  '004FC31F: push 00000002h
  '004FC321: push 000000A1h
  '004FC326: push eax
  '004FC327: mov [esp+18h], 00000000h
  '004FC32F: call 0041E0C8h
  '004FC334: call edi
  '004FC336: pop edi
  '004FC337: xor eax, eax
  '004FC339: pop esi
  '004FC33A: add esp, 00000008h
  '004FC33D: retn 0014h
End Sub
Private Sub unknown_4FC340
  '004FC340: push esi
  '004FC341: mov esi, [esp+08h]
  '004FC345: push esi
  '004FC346: mov eax, [esi]
  '004FC348: call [eax+000002B4h]
  '004FC34E: test eax, eax
  '004FC350: fclex 
  '004FC352: jnl 4FC366h
  '004FC354: push 000002B4h
  '004FC359: push 0041DE38h
  '004FC35E: push esi
  '004FC35F: push eax
  '004FC360: call [004010A0h]
  '004FC366: xor eax, eax
  '004FC368: pop esi
  '004FC369: retn 0004h
End Sub
Private Sub unknown_538860
  '00538860: xor eax, eax
  '00538862: retn 0004h
End Sub
Private Sub unknown_4FC410
  '004FC410: push esi
  '004FC411: mov esi, [esp+0Ch]
  '004FC415: xor ecx, ecx
  '004FC417: mov ax, [esi]
  '004FC41A: cmp ax, 0039h
  '004FC41E: setle cl
  '004FC421: xor edx, edx
  '004FC423: cmp ax, 0030h
  '004FC427: setnl dl
  '004FC42A: and ecx, edx
  '004FC42C: neg ecx
  '004FC42E: sbb ecx, ecx
  '004FC430: xor edx, edx
  '004FC432: neg ecx
  '004FC434: cmp ax, 0008h
  '004FC438: setz dl
  '004FC43B: or ecx, edx
  '004FC43D: jnz 4FC444h
  '004FC43F: mov word ptr [esi], 0000h
  '004FC444: xor eax, eax
  '004FC446: pop esi
  '004FC447: retn 0008h
End Sub
Private Sub unknown_4FC410
  '004FC410: push esi
  '004FC411: mov esi, [esp+0Ch]
  '004FC415: xor ecx, ecx
  '004FC417: mov ax, [esi]
  '004FC41A: cmp ax, 0039h
  '004FC41E: setle cl
  '004FC421: xor edx, edx
  '004FC423: cmp ax, 0030h
  '004FC427: setnl dl
  '004FC42A: and ecx, edx
  '004FC42C: neg ecx
  '004FC42E: sbb ecx, ecx
  '004FC430: xor edx, edx
  '004FC432: neg ecx
  '004FC434: cmp ax, 0008h
  '004FC438: setz dl
  '004FC43B: or ecx, edx
  '004FC43D: jnz 4FC444h
  '004FC43F: mov word ptr [esi], 0000h
  '004FC444: xor eax, eax
  '004FC446: pop esi
  '004FC447: retn 0008h
End Sub
Private Sub FormMaster_4FCB80
  '004FCB80: push ebp
  '004FCB81: mov ebp, esp
  '004FCB83: sub esp, 00000008h
  '004FCB86: push 004081B6h
  '004FCB8B: mov eax, fs:[00h]
  '004FCB91: push eax
  '004FCB92: mov fs:[00000000h], esp
  '004FCB99: sub esp, 00000054h
  '004FCB9C: push ebx
  '004FCB9D: push esi
  '004FCB9E: push edi
  '004FCB9F: mov [ebp-08h], esp
  '004FCBA2: mov [ebp-04h], 00405B88h
  '004FCBA9: mov eax, [ebp+08h]
  '004FCBAC: xor edi, edi
  '004FCBAE: push 0041E958h
  '004FCBB3: push edi
  '004FCBB4: mov ecx, [eax]
  '004FCBB6: push 00000003h
  '004FCBB8: push eax
  '004FCBB9: mov [ebp-14h], edi
  '004FCBBC: mov [ebp-18h], edi
  '004FCBBF: mov [ebp-1Ch], edi
  '004FCBC2: mov [ebp-20h], edi
  '004FCBC5: mov [ebp-30h], edi
  '004FCBC8: mov [ebp-40h], edi
  '004FCBCB: call [ecx+000003DCh]
  '004FCBD1: mov esi, [004010E4h]
  '004FCBD7: lea edx, [ebp-18h]
  '004FCBDA: push eax
  '004FCBDB: push edx
  '004FCBDC: call esi
  '004FCBDE: push eax
  '004FCBDF: lea eax, [ebp-30h]
  '004FCBE2: push eax
  '004FCBE3: call [004011E4h]
  '004FCBE9: add esp, 00000010h
  '004FCBEC: push eax
  '004FCBED: call [004011C8h]
  '004FCBF3: lea ecx, [ebp-1Ch]
  '004FCBF6: push eax
  '004FCBF7: push ecx
  '004FCBF8: call esi
  '004FCBFA: mov esi, eax
  '004FCBFC: lea eax, [ebp-20h]
  '004FCBFF: lea ecx, [ebp-40h]
  '004FCC02: mov [ebp-38h], 00000001h
  '004FCC09: mov [ebp-40h], 00000002h
  '004FCC10: mov edx, [esi]
  '004FCC12: push eax
  '004FCC13: push ecx
  '004FCC14: push esi
  '004FCC15: call [edx+24h]
  '004FCC18: cmp eax, edi
  '004FCC1A: fclex 
  '004FCC1C: jnl 4FCC2Dh
  '004FCC1E: push 00000024h
  '004FCC20: push 0041E958h
  '004FCC25: push esi
  '004FCC26: push eax
  '004FCC27: call [004010A0h]
  '004FCC2D: mov edx, [ebp+0Ch]
  '004FCC30: mov esi, [ebp-20h]
  '004FCC33: push 00428388h
  '004FCC38: mov eax, [edx]
  '004FCC3A: mov ebx, [esi]
  '004FCC3C: push eax
  '004FCC3D: call [0040108Ch]
  '004FCC43: mov edx, eax
  '004FCC45: lea ecx, [ebp-14h]
  '004FCC48: call [00401378h]
  '004FCC4E: push eax
  '004FCC4F: push esi
  '004FCC50: call [ebx+00000080h]
  '004FCC56: cmp eax, edi
  '004FCC58: fclex 
  '004FCC5A: jnl 4FCC6Eh
  '004FCC5C: push 00000080h
  '004FCC61: push 0041E968h
  '004FCC66: push esi
  '004FCC67: push eax
  '004FCC68: call [004010A0h]
  '004FCC6E: lea ecx, [ebp-14h]
  '004FCC71: call [004013B4h]
  '004FCC77: lea ecx, [ebp-20h]
  '004FCC7A: lea edx, [ebp-1Ch]
  '004FCC7D: push ecx
  '004FCC7E: lea eax, [ebp-18h]
  '004FCC81: push edx
  '004FCC82: push eax
  '004FCC83: push 00000003h
  '004FCC85: call [00401064h]
  '004FCC8B: lea ecx, [ebp-40h]
  '004FCC8E: lea edx, [ebp-30h]
  '004FCC91: push ecx
  '004FCC92: push edx
  '004FCC93: push 00000002h
  '004FCC95: call [00401050h]
  '004FCC9B: add esp, 0000001Ch
  '004FCC9E: push 004FCCD7h
  '004FCCA3: jmp 4FCCD6h
  '004FCCA5: lea ecx, [ebp-14h]
  '004FCCA8: call [004013B4h]
  '004FCCAE: lea eax, [ebp-20h]
  '004FCCB1: lea ecx, [ebp-1Ch]
  '004FCCB4: push eax
  '004FCCB5: lea edx, [ebp-18h]
  '004FCCB8: push ecx
  '004FCCB9: push edx
  '004FCCBA: push 00000003h
  '004FCCBC: call [00401064h]
  '004FCCC2: lea eax, [ebp-40h]
  '004FCCC5: lea ecx, [ebp-30h]
  '004FCCC8: push eax
  '004FCCC9: push ecx
  '004FCCCA: push 00000002h
  '004FCCCC: call [00401050h]
  '004FCCD2: add esp, 0000001Ch
  '004FCCD5: ret 
End Sub

