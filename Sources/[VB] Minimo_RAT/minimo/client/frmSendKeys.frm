VERSION 5.00
Begin VB.Form frmSendKeys
  Caption = "Send Keys"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  BorderStyle = 3 'Fixed Dialog
  Icon = "frmSendKeys.frx":0
  LinkTopic = "Form2"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 45
  ClientTop = 330
  ClientWidth = 5655
  ClientHeight = 3375
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
  StartUpPosition = 1 'CenterOwner
  Begin VB.CheckBox chkEnter
    Caption = "Replace enter key with {ENTER}"
    Left = 120
    Top = 3080
    Width = 2895
    Height = 195
    TabIndex = 13
  End
  Begin VB.CheckBox chkClose
    Caption = "Close me when keys are sent"
    Left = 120
    Top = 2800
    Width = 2775
    Height = 195
    TabIndex = 12
  End
  Begin VB.Frame Frame3
    Caption = "Bulk keys to send "
    Left = 0
    Top = 840
    Width = 5655
    Height = 1815
    TabIndex = 4
    Begin VB.CommandButton fkeys
      Caption = "{FX}"
      Index = 0
      Left = 120
      Top = 300
      Width = 570
      Height = 280
      TabIndex = 11
      ToolTipText = "For function keys (F1 to F12)"
    End
    Begin VB.CommandButton fkeys
      Caption = "{ENTER}"
      Index = 1
      Left = 720
      Top = 300
      Width = 810
      Height = 280
      TabIndex = 10
      ToolTipText = "Enter key"
    End
    Begin VB.CommandButton fkeys
      Caption = "{TAB}"
      Index = 2
      Left = 1560
      Top = 300
      Width = 690
      Height = 280
      TabIndex = 9
      ToolTipText = "Tab key"
    End
    Begin VB.CommandButton fkeys
      Caption = "{CAPSLOCK}"
      Index = 3
      Left = 2280
      Top = 300
      Width = 1170
      Height = 280
      TabIndex = 8
      ToolTipText = "Toggle caps lock"
    End
    Begin VB.CommandButton fkeys
      Caption = "{Shift + X}"
      Index = 4
      Left = 3480
      Top = 300
      Width = 1050
      Height = 280
      TabIndex = 7
      ToolTipText = "Shift and another key"
    End
    Begin VB.CommandButton fkeys
      Caption = "{Ctrl + X}"
      Index = 5
      Left = 4560
      Top = 300
      Width = 980
      Height = 280
      TabIndex = 6
      ToolTipText = "Ctrl and another key"
    End
    Begin VB.TextBox txtKeys
      Left = 120
      Top = 720
      Width = 5415
      Height = 975
      TabIndex = 5
      MultiLine = -1  'True
      ScrollBars = 2
    End
  End
  Begin VB.Frame Frame2
    Caption = "Recently Sent Keys "
    Left = 0
    Top = 120
    Width = 5655
    Height = 660
    TabIndex = 2
    Begin VB.ComboBox cmbKeys
      Left = 120
      Top = 240
      Width = 5415
      Height = 315
      TabIndex = 3
    End
  End
  Begin VB.CommandButton cmdClose
    Caption = "Close"
    Left = 3000
    Top = 2880
    Width = 1215
    Height = 280
    TabIndex = 1
  End
  Begin VB.CommandButton cmdSendKeys
    Caption = "Send"
    Left = 4320
    Top = 2880
    Width = 1215
    Height = 280
    TabIndex = 0
  End
End

Attribute VB_Name = "frmSendKeys"

Private Sub cmdClose__53D300
  '0053D300: push ebp
  '0053D301: mov ebp, esp
  '0053D303: sub esp, 0000000Ch
  '0053D306: push 004081B6h
  '0053D30B: mov eax, fs:[00h]
  '0053D311: push eax
  '0053D312: mov fs:[00000000h], esp
  '0053D319: sub esp, 00000018h
  '0053D31C: push ebx
  '0053D31D: push esi
  '0053D31E: push edi
  '0053D31F: mov [ebp-0Ch], esp
  '0053D322: mov [ebp-08h], 00407FC0h
  '0053D329: mov edi, [ebp+08h]
  '0053D32C: mov eax, edi
  '0053D32E: and eax, 00000001h
  '0053D331: mov [ebp-04h], eax
  '0053D334: and edi, FFFFFFFEh
  '0053D337: push edi
  '0053D338: mov [ebp+08h], edi
  '0053D33B: mov ecx, [edi]
  '0053D33D: call [ecx+04h]
  '0053D340: mov eax, [54238Ch]
  '0053D345: xor ebx, ebx
  '0053D347: cmp eax, ebx
  '0053D349: mov [ebp-18h], ebx
  '0053D34C: jnz 53D35Eh
  '0053D34E: push 0054238Ch
  '0053D353: push 0041D9E0h
  '0053D358: call [004012B8h]
  '0053D35E: mov esi, [0054238Ch]
  '0053D364: lea eax, [ebp-18h]
  '0053D367: push edi
  '0053D368: push eax
  '0053D369: mov edx, [esi]
  '0053D36B: mov [ebp-2Ch], edx
  '0053D36E: call [004010F8h]
  '0053D374: mov ecx, [ebp-2Ch]
  '0053D377: push eax
  '0053D378: push esi
  '0053D379: call [ecx+10h]
  '0053D37C: cmp eax, ebx
  '0053D37E: fclex 
  '0053D380: jnl 53D391h
  '0053D382: push 00000010h
  '0053D384: push 0041D9D0h
  '0053D389: push esi
  '0053D38A: push eax
  '0053D38B: call [004010A0h]
  '0053D391: lea ecx, [ebp-18h]
  '0053D394: call [004013B8h]
  '0053D39A: mov [ebp-04h], ebx
  '0053D39D: push 0053D3AFh
  '0053D3A2: jmp 53D3AEh
  '0053D3A4: lea ecx, [ebp-18h]
  '0053D3A7: call [004013B8h]
  '0053D3AD: ret 
End Sub
Private Sub chkClose__53CFD0
  '0053CFD0: push ebp
  '0053CFD1: mov ebp, esp
  '0053CFD3: sub esp, 0000000Ch
  '0053CFD6: push 004081B6h
  '0053CFDB: mov eax, fs:[00h]
  '0053CFE1: push eax
  '0053CFE2: mov fs:[00000000h], esp
  '0053CFE9: sub esp, 0000001Ch
  '0053CFEC: push ebx
  '0053CFED: push esi
  '0053CFEE: push edi
  '0053CFEF: mov [ebp-0Ch], esp
  '0053CFF2: mov [ebp-08h], 00407F90h
  '0053CFF9: mov esi, [ebp+08h]
  '0053CFFC: mov eax, esi
  '0053CFFE: and eax, 00000001h
  '0053D001: mov [ebp-04h], eax
  '0053D004: and esi, FFFFFFFEh
  '0053D007: push esi
  '0053D008: mov [ebp+08h], esi
  '0053D00B: mov ecx, [esi]
  '0053D00D: call [ecx+04h]
  '0053D010: mov edx, [esi]
  '0053D012: xor edi, edi
  '0053D014: push esi
  '0053D015: mov [ebp-18h], edi
  '0053D018: mov [ebp-1Ch], edi
  '0053D01B: mov [ebp-20h], edi
  '0053D01E: call [edx+00000300h]
  '0053D024: push eax
  '0053D025: lea eax, [ebp-1Ch]
  '0053D028: push eax
  '0053D029: call [004010E4h]
  '0053D02F: mov esi, eax
  '0053D031: lea edx, [ebp-20h]
  '0053D034: push edx
  '0053D035: push esi
  '0053D036: mov ecx, [esi]
  '0053D038: call [ecx+000000E0h]
  '0053D03E: cmp eax, edi
  '0053D040: fclex 
  '0053D042: jnl 53D056h
  '0053D044: push 000000E0h
  '0053D049: push 0041E108h
  '0053D04E: push esi
  '0053D04F: push eax
  '0053D050: call [004010A0h]
  '0053D056: mov eax, [ebp-20h]
  '0053D059: push eax
  '0053D05A: call [0040100Ch]
  '0053D060: mov edx, eax
  '0053D062: lea ecx, [ebp-18h]
  '0053D065: call [00401378h]
  '0053D06B: push eax
  '0053D06C: push 0042D4ACh
  '0053D071: push 0041EA6Ch
  '0053D076: push 0041EA58h
  '0053D07B: call [00401010h]
  '0053D081: lea ecx, [ebp-18h]
  '0053D084: call [004013B4h]
  '0053D08A: lea ecx, [ebp-1Ch]
  '0053D08D: call [004013B8h]
  '0053D093: mov [ebp-04h], edi
  '0053D096: push 0053D0B1h
  '0053D09B: jmp 53D0B0h
  '0053D09D: lea ecx, [ebp-18h]
  '0053D0A0: call [004013B4h]
  '0053D0A6: lea ecx, [ebp-1Ch]
  '0053D0A9: call [004013B8h]
  '0053D0AF: ret 
End Sub
Private Sub txtKeys__53E760
  '0053E760: push ebp
  '0053E761: mov ebp, esp
  '0053E763: sub esp, 0000000Ch
  '0053E766: push 004081B6h
  '0053E76B: mov eax, fs:[00h]
  '0053E771: push eax
  '0053E772: mov fs:[00000000h], esp
  '0053E779: sub esp, 00000034h
  '0053E77C: push ebx
  '0053E77D: push esi
  '0053E77E: push edi
  '0053E77F: mov [ebp-0Ch], esp
  '0053E782: mov [ebp-08h], 004080D0h
  '0053E789: mov esi, [ebp+08h]
  '0053E78C: mov eax, esi
  '0053E78E: and eax, 00000001h
  '0053E791: mov [ebp-04h], eax
  '0053E794: and esi, FFFFFFFEh
  '0053E797: push esi
  '0053E798: mov [ebp+08h], esi
  '0053E79B: mov ecx, [esi]
  '0053E79D: call [ecx+04h]
  '0053E7A0: mov edx, [ebp+0Ch]
  '0053E7A3: xor eax, eax
  '0053E7A5: mov [ebp-18h], eax
  '0053E7A8: mov [ebp-1Ch], eax
  '0053E7AB: cmp word ptr [edx], 000Dh
  '0053E7AF: mov [ebp-20h], eax
  '0053E7B2: mov [ebp-24h], eax
  '0053E7B5: mov [ebp-28h], eax
  '0053E7B8: jnz 0053E968h
  '0053E7BE: mov eax, [esi]
  '0053E7C0: push esi
  '0053E7C1: call [eax+000002FCh]
  '0053E7C7: mov ebx, [004010E4h]
  '0053E7CD: lea ecx, [ebp-20h]
  '0053E7D0: push eax
  '0053E7D1: push ecx
  '0053E7D2: call ebx
  '0053E7D4: mov edi, eax
  '0053E7D6: lea eax, [ebp-28h]
  '0053E7D9: push eax
  '0053E7DA: push edi
  '0053E7DB: mov edx, [edi]
  '0053E7DD: call [edx+000000E0h]
  '0053E7E3: test eax, eax
  '0053E7E5: fclex 
  '0053E7E7: jnl 53E7FBh
  '0053E7E9: push 000000E0h
  '0053E7EE: push 0041E108h
  '0053E7F3: push edi
  '0053E7F4: push eax
  '0053E7F5: call [004010A0h]
  '0053E7FB: xor ecx, ecx
  '0053E7FD: cmp word ptr [ebp-28h], 0001h
  '0053E802: setz cl
  '0053E805: neg ecx
  '0053E807: mov di, cx
  '0053E80A: lea ecx, [ebp-20h]
  '0053E80D: call [004013B8h]
  '0053E813: test di, di
  '0053E816: jz 0053E966h
  '0053E81C: mov edx, [esi]
  '0053E81E: push esi
  '0053E81F: call [edx+0000030Ch]
  '0053E825: push eax
  '0053E826: lea eax, [ebp-24h]
  '0053E829: push eax
  '0053E82A: call ebx
  '0053E82C: mov ecx, [esi]
  '0053E82E: push esi
  '0053E82F: mov [ebp-34h], eax
  '0053E832: call [ecx+0000030Ch]
  '0053E838: lea edx, [ebp-20h]
  '0053E83B: push eax
  '0053E83C: push edx
  '0053E83D: call ebx
  '0053E83F: mov edi, eax
  '0053E841: lea ecx, [ebp-18h]
  '0053E844: push ecx
  '0053E845: push edi
  '0053E846: mov eax, [edi]
  '0053E848: call [eax+000000A0h]
  '0053E84E: test eax, eax
  '0053E850: fclex 
  '0053E852: jnl 53E866h
  '0053E854: push 000000A0h
  '0053E859: push 0041E3FCh
  '0053E85E: push edi
  '0053E85F: push eax
  '0053E860: call [004010A0h]
  '0053E866: mov eax, [ebp-18h]
  '0053E869: mov edx, [ebp-34h]
  '0053E86C: push eax
  '0053E86D: push 0042A5CCh
  '0053E872: mov edi, [edx]
  '0053E874: call [0040108Ch]
  '0053E87A: mov edx, eax
  '0053E87C: lea ecx, [ebp-1Ch]
  '0053E87F: call [00401378h]
  '0053E885: mov ecx, edi
  '0053E887: mov edi, [ebp-34h]
  '0053E88A: push eax
  '0053E88B: push edi
  '0053E88C: call [ecx+000000A4h]
  '0053E892: test eax, eax
  '0053E894: fclex 
  '0053E896: jnl 53E8AAh
  '0053E898: push 000000A4h
  '0053E89D: push 0041E3FCh
  '0053E8A2: push edi
  '0053E8A3: push eax
  '0053E8A4: call [004010A0h]
  '0053E8AA: lea edx, [ebp-1Ch]
  '0053E8AD: lea eax, [ebp-18h]
  '0053E8B0: push edx
  '0053E8B1: push eax
  '0053E8B2: push 00000002h
  '0053E8B4: call [004012E8h]
  '0053E8BA: lea ecx, [ebp-24h]
  '0053E8BD: lea edx, [ebp-20h]
  '0053E8C0: push ecx
  '0053E8C1: push edx
  '0053E8C2: push 00000002h
  '0053E8C4: call [00401064h]
  '0053E8CA: mov eax, [esi]
  '0053E8CC: add esp, 00000018h
  '0053E8CF: push esi
  '0053E8D0: call [eax+0000030Ch]
  '0053E8D6: lea ecx, [ebp-24h]
  '0053E8D9: push eax
  '0053E8DA: push ecx
  '0053E8DB: call ebx
  '0053E8DD: mov edx, [esi]
  '0053E8DF: push esi
  '0053E8E0: mov edi, eax
  '0053E8E2: call [edx+0000030Ch]
  '0053E8E8: push eax
  '0053E8E9: lea eax, [ebp-20h]
  '0053E8EC: push eax
  '0053E8ED: call ebx
  '0053E8EF: mov esi, eax
  '0053E8F1: lea edx, [ebp-18h]
  '0053E8F4: push edx
  '0053E8F5: push esi
  '0053E8F6: mov ecx, [esi]
  '0053E8F8: call [ecx+000000A0h]
  '0053E8FE: test eax, eax
  '0053E900: fclex 
  '0053E902: jnl 53E916h
  '0053E904: push 000000A0h
  '0053E909: push 0041E3FCh
  '0053E90E: push esi
  '0053E90F: push eax
  '0053E910: call [004010A0h]
  '0053E916: mov eax, [ebp-18h]
  '0053E919: mov esi, [edi]
  '0053E91B: push eax
  '0053E91C: call [00401044h]
  '0053E922: push eax
  '0053E923: push edi
  '0053E924: call [esi+00000114h]
  '0053E92A: test eax, eax
  '0053E92C: fclex 
  '0053E92E: jnl 53E942h
  '0053E930: push 00000114h
  '0053E935: push 0041E3FCh
  '0053E93A: push edi
  '0053E93B: push eax
  '0053E93C: call [004010A0h]
  '0053E942: lea ecx, [ebp-18h]
  '0053E945: call [004013B4h]
  '0053E94B: lea ecx, [ebp-24h]
  '0053E94E: lea edx, [ebp-20h]
  '0053E951: push ecx
  '0053E952: push edx
  '0053E953: push 00000002h
  '0053E955: call [00401064h]
  '0053E95B: mov eax, [ebp+0Ch]
  '0053E95E: add esp, 0000000Ch
  '0053E961: mov word ptr [eax], 0000h
  '0053E966: xor eax, eax
  '0053E968: mov [ebp-04h], eax
  '0053E96B: push 0053E997h
  '0053E970: jmp 53E996h
  '0053E972: lea ecx, [ebp-1Ch]
  '0053E975: lea edx, [ebp-18h]
  '0053E978: push ecx
  '0053E979: push edx
  '0053E97A: push 00000002h
  '0053E97C: call [004012E8h]
  '0053E982: lea eax, [ebp-24h]
  '0053E985: lea ecx, [ebp-20h]
  '0053E988: push eax
  '0053E989: push ecx
  '0053E98A: push 00000002h
  '0053E98C: call [00401064h]
  '0053E992: add esp, 00000018h
  '0053E995: ret 
End Sub
Private Sub cmbKeys__53D1D0
  '0053D1D0: push ebp
  '0053D1D1: mov ebp, esp
  '0053D1D3: sub esp, 0000000Ch
  '0053D1D6: push 004081B6h
  '0053D1DB: mov eax, fs:[00h]
  '0053D1E1: push eax
  '0053D1E2: mov fs:[00000000h], esp
  '0053D1E9: sub esp, 00000024h
  '0053D1EC: push ebx
  '0053D1ED: push esi
  '0053D1EE: push edi
  '0053D1EF: mov [ebp-0Ch], esp
  '0053D1F2: mov [ebp-08h], 00407FB0h
  '0053D1F9: mov esi, [ebp+08h]
  '0053D1FC: mov eax, esi
  '0053D1FE: and eax, 00000001h
  '0053D201: mov [ebp-04h], eax
  '0053D204: and esi, FFFFFFFEh
  '0053D207: push esi
  '0053D208: mov [ebp+08h], esi
  '0053D20B: mov ecx, [esi]
  '0053D20D: call [ecx+04h]
  '0053D210: mov edx, [esi]
  '0053D212: xor eax, eax
  '0053D214: push esi
  '0053D215: mov [ebp-18h], eax
  '0053D218: mov [ebp-1Ch], eax
  '0053D21B: mov [ebp-20h], eax
  '0053D21E: call [edx+0000030Ch]
  '0053D224: mov ebx, [004010E4h]
  '0053D22A: push eax
  '0053D22B: lea eax, [ebp-20h]
  '0053D22E: push eax
  '0053D22F: call ebx
  '0053D231: mov ecx, [esi]
  '0053D233: push esi
  '0053D234: mov edi, eax
  '0053D236: call [ecx+00000314h]
  '0053D23C: lea edx, [ebp-1Ch]
  '0053D23F: push eax
  '0053D240: push edx
  '0053D241: call ebx
  '0053D243: mov esi, eax
  '0053D245: lea ecx, [ebp-18h]
  '0053D248: push ecx
  '0053D249: push esi
  '0053D24A: mov eax, [esi]
  '0053D24C: call [eax+000000A8h]
  '0053D252: test eax, eax
  '0053D254: fclex 
  '0053D256: jnl 53D26Ah
  '0053D258: push 000000A8h
  '0053D25D: push 0041C0C4h
  '0053D262: push esi
  '0053D263: push eax
  '0053D264: call [004010A0h]
  '0053D26A: mov eax, [ebp-18h]
  '0053D26D: mov edx, [edi]
  '0053D26F: push eax
  '0053D270: push edi
  '0053D271: call [edx+000000A4h]
  '0053D277: test eax, eax
  '0053D279: fclex 
  '0053D27B: jnl 53D28Fh
  '0053D27D: push 000000A4h
  '0053D282: push 0041E3FCh
  '0053D287: push edi
  '0053D288: push eax
  '0053D289: call [004010A0h]
  '0053D28F: lea ecx, [ebp-18h]
  '0053D292: call [004013B4h]
  '0053D298: lea ecx, [ebp-20h]
  '0053D29B: lea edx, [ebp-1Ch]
  '0053D29E: push ecx
  '0053D29F: push edx
  '0053D2A0: push 00000002h
  '0053D2A2: call [00401064h]
  '0053D2A8: add esp, 0000000Ch
  '0053D2AB: mov [ebp-04h], 00000000h
  '0053D2B2: push 0053D2D7h
  '0053D2B7: jmp 53D2D6h
  '0053D2B9: lea ecx, [ebp-18h]
  '0053D2BC: call [004013B4h]
  '0053D2C2: lea eax, [ebp-20h]
  '0053D2C5: lea ecx, [ebp-1Ch]
  '0053D2C8: push eax
  '0053D2C9: push ecx
  '0053D2CA: push 00000002h
  '0053D2CC: call [00401064h]
  '0053D2D2: add esp, 0000000Ch
  '0053D2D5: ret 
End Sub
Private Sub fkeys__53DCE0
  '0053DCE0: push ebp
  '0053DCE1: mov ebp, esp
  '0053DCE3: sub esp, 0000000Ch
  '0053DCE6: push 004081B6h
  '0053DCEB: mov eax, fs:[00h]
  '0053DCF1: push eax
  '0053DCF2: mov fs:[00000000h], esp
  '0053DCF9: sub esp, 00000044h
  '0053DCFC: push ebx
  '0053DCFD: push esi
  '0053DCFE: push edi
  '0053DCFF: mov [ebp-0Ch], esp
  '0053DD02: mov [ebp-08h], 00408038h
  '0053DD09: mov esi, [ebp+08h]
  '0053DD0C: mov eax, esi
  '0053DD0E: and eax, 00000001h
  '0053DD11: mov [ebp-04h], eax
  '0053DD14: and esi, FFFFFFFEh
  '0053DD17: push esi
  '0053DD18: mov [ebp+08h], esi
  '0053DD1B: mov ecx, [esi]
  '0053DD1D: call [ecx+04h]
  '0053DD20: mov edx, [esi]
  '0053DD22: xor eax, eax
  '0053DD24: push esi
  '0053DD25: mov [ebp-18h], eax
  '0053DD28: mov [ebp-1Ch], eax
  '0053DD2B: mov [ebp-20h], eax
  '0053DD2E: mov [ebp-24h], eax
  '0053DD31: mov [ebp-28h], eax
  '0053DD34: mov [ebp-2Ch], eax
  '0053DD37: mov [ebp-30h], eax
  '0053DD3A: call [edx+0000030Ch]
  '0053DD40: mov ebx, [004010E4h]
  '0053DD46: push eax
  '0053DD47: lea eax, [ebp-30h]
  '0053DD4A: push eax
  '0053DD4B: call ebx
  '0053DD4D: mov ecx, [esi]
  '0053DD4F: push esi
  '0053DD50: mov [ebp-4Ch], eax
  '0053DD53: call [ecx+0000030Ch]
  '0053DD59: lea edx, [ebp-24h]
  '0053DD5C: push eax
  '0053DD5D: push edx
  '0053DD5E: call ebx
  '0053DD60: mov edi, eax
  '0053DD62: lea ecx, [ebp-18h]
  '0053DD65: push ecx
  '0053DD66: push edi
  '0053DD67: mov eax, [edi]
  '0053DD69: call [eax+000000A0h]
  '0053DD6F: test eax, eax
  '0053DD71: fclex 
  '0053DD73: jnl 53DD8Bh
  '0053DD75: push 000000A0h
  '0053DD7A: push 0041E3FCh
  '0053DD7F: push edi
  '0053DD80: mov edi, [004010A0h]
  '0053DD86: push eax
  '0053DD87: call edi
  '0053DD89: jmp 53DD91h
  '0053DD8B: mov edi, [004010A0h]
  '0053DD91: mov edx, [esi]
  '0053DD93: push esi
  '0053DD94: call [edx+00000308h]
  '0053DD9A: push eax
  '0053DD9B: lea eax, [ebp-28h]
  '0053DD9E: push eax
  '0053DD9F: call ebx
  '0053DDA1: mov esi, eax
  '0053DDA3: mov eax, [ebp+0Ch]
  '0053DDA6: lea edx, [ebp-2Ch]
  '0053DDA9: mov ecx, [esi]
  '0053DDAB: push edx
  '0053DDAC: mov dx, [eax]
  '0053DDAF: push edx
  '0053DDB0: push esi
  '0053DDB1: call [ecx+40h]
  '0053DDB4: test eax, eax
  '0053DDB6: fclex 
  '0053DDB8: jnl 53DDC5h
  '0053DDBA: push 00000040h
  '0053DDBC: push 0041E60Ch
  '0053DDC1: push esi
  '0053DDC2: push eax
  '0053DDC3: call edi
  '0053DDC5: mov eax, [ebp-2Ch]
  '0053DDC8: lea edx, [ebp-1Ch]
  '0053DDCB: push edx
  '0053DDCC: push eax
  '0053DDCD: mov ecx, [eax]
  '0053DDCF: mov esi, eax
  '0053DDD1: call [ecx+50h]
  '0053DDD4: test eax, eax
  '0053DDD6: fclex 
  '0053DDD8: jnl 53DDE5h
  '0053DDDA: push 00000050h
  '0053DDDC: push 00420F60h
  '0053DDE1: push esi
  '0053DDE2: push eax
  '0053DDE3: call edi
  '0053DDE5: mov eax, [ebp-18h]
  '0053DDE8: mov esi, [ebp-4Ch]
  '0053DDEB: mov ecx, [ebp-1Ch]
  '0053DDEE: push eax
  '0053DDEF: mov ebx, [esi]
  '0053DDF1: push ecx
  '0053DDF2: call [0040108Ch]
  '0053DDF8: mov edx, eax
  '0053DDFA: lea ecx, [ebp-20h]
  '0053DDFD: call [00401378h]
  '0053DE03: push eax
  '0053DE04: push esi
  '0053DE05: call [ebx+000000A4h]
  '0053DE0B: test eax, eax
  '0053DE0D: fclex 
  '0053DE0F: jnl 53DE1Fh
  '0053DE11: push 000000A4h
  '0053DE16: push 0041E3FCh
  '0053DE1B: push esi
  '0053DE1C: push eax
  '0053DE1D: call edi
  '0053DE1F: lea edx, [ebp-20h]
  '0053DE22: lea eax, [ebp-1Ch]
  '0053DE25: push edx
  '0053DE26: lea ecx, [ebp-18h]
  '0053DE29: push eax
  '0053DE2A: push ecx
  '0053DE2B: push 00000003h
  '0053DE2D: call [004012E8h]
  '0053DE33: lea edx, [ebp-30h]
  '0053DE36: lea eax, [ebp-2Ch]
  '0053DE39: push edx
  '0053DE3A: lea ecx, [ebp-28h]
  '0053DE3D: push eax
  '0053DE3E: lea edx, [ebp-24h]
  '0053DE41: push ecx
  '0053DE42: push edx
  '0053DE43: push 00000004h
  '0053DE45: call [00401064h]
  '0053DE4B: add esp, 00000024h
  '0053DE4E: mov [ebp-04h], 00000000h
  '0053DE55: push 0053DE8Dh
  '0053DE5A: jmp 53DE8Ch
  '0053DE5C: lea eax, [ebp-20h]
  '0053DE5F: lea ecx, [ebp-1Ch]
  '0053DE62: push eax
  '0053DE63: lea edx, [ebp-18h]
  '0053DE66: push ecx
  '0053DE67: push edx
  '0053DE68: push 00000003h
  '0053DE6A: call [004012E8h]
  '0053DE70: lea eax, [ebp-30h]
  '0053DE73: lea ecx, [ebp-2Ch]
  '0053DE76: push eax
  '0053DE77: lea edx, [ebp-28h]
  '0053DE7A: push ecx
  '0053DE7B: lea eax, [ebp-24h]
  '0053DE7E: push edx
  '0053DE7F: push eax
  '0053DE80: push 00000004h
  '0053DE82: call [00401064h]
  '0053DE88: add esp, 00000024h
  '0053DE8B: ret 
End Sub
Private Sub chkEnter__53D0D0
  '0053D0D0: push ebp
  '0053D0D1: mov ebp, esp
  '0053D0D3: sub esp, 0000000Ch
  '0053D0D6: push 004081B6h
  '0053D0DB: mov eax, fs:[00h]
  '0053D0E1: push eax
  '0053D0E2: mov fs:[00000000h], esp
  '0053D0E9: sub esp, 0000001Ch
  '0053D0EC: push ebx
  '0053D0ED: push esi
  '0053D0EE: push edi
  '0053D0EF: mov [ebp-0Ch], esp
  '0053D0F2: mov [ebp-08h], 00407FA0h
  '0053D0F9: mov esi, [ebp+08h]
  '0053D0FC: mov eax, esi
  '0053D0FE: and eax, 00000001h
  '0053D101: mov [ebp-04h], eax
  '0053D104: and esi, FFFFFFFEh
  '0053D107: push esi
  '0053D108: mov [ebp+08h], esi
  '0053D10B: mov ecx, [esi]
  '0053D10D: call [ecx+04h]
  '0053D110: mov edx, [esi]
  '0053D112: xor edi, edi
  '0053D114: push esi
  '0053D115: mov [ebp-18h], edi
  '0053D118: mov [ebp-1Ch], edi
  '0053D11B: mov [ebp-20h], edi
  '0053D11E: call [edx+000002FCh]
  '0053D124: push eax
  '0053D125: lea eax, [ebp-1Ch]
  '0053D128: push eax
  '0053D129: call [004010E4h]
  '0053D12F: mov esi, eax
  '0053D131: lea edx, [ebp-20h]
  '0053D134: push edx
  '0053D135: push esi
  '0053D136: mov ecx, [esi]
  '0053D138: call [ecx+000000E0h]
  '0053D13E: cmp eax, edi
  '0053D140: fclex 
  '0053D142: jnl 53D156h
  '0053D144: push 000000E0h
  '0053D149: push 0041E108h
  '0053D14E: push esi
  '0053D14F: push eax
  '0053D150: call [004010A0h]
  '0053D156: mov eax, [ebp-20h]
  '0053D159: push eax
  '0053D15A: call [0040100Ch]
  '0053D160: mov edx, eax
  '0053D162: lea ecx, [ebp-18h]
  '0053D165: call [00401378h]
  '0053D16B: push eax
  '0053D16C: push 0042D4CCh
  '0053D171: push 0041EA6Ch
  '0053D176: push 0041EA58h
  '0053D17B: call [00401010h]
  '0053D181: lea ecx, [ebp-18h]
  '0053D184: call [004013B4h]
  '0053D18A: lea ecx, [ebp-1Ch]
  '0053D18D: call [004013B8h]
  '0053D193: mov [ebp-04h], edi
  '0053D196: push 0053D1B1h
  '0053D19B: jmp 53D1B0h
  '0053D19D: lea ecx, [ebp-18h]
  '0053D1A0: call [004013B4h]
  '0053D1A6: lea ecx, [ebp-1Ch]
  '0053D1A9: call [004013B8h]
  '0053D1AF: ret 
End Sub
Private Sub Form__53DEB0
  '0053DEB0: push ebp
  '0053DEB1: mov ebp, esp
  '0053DEB3: sub esp, 00000018h
  '0053DEB6: push 004081B6h
  '0053DEBB: mov eax, fs:[00h]
  '0053DEC1: push eax
  '0053DEC2: mov fs:[00000000h], esp
  '0053DEC9: mov eax, 000000B0h
  '0053DECE: call 004081B0h
  '0053DED3: push ebx
  '0053DED4: push esi
  '0053DED5: push edi
  '0053DED6: mov [ebp-18h], esp
  '0053DED9: mov [ebp-14h], 00408048h
  '0053DEE0: mov eax, [ebp+08h]
  '0053DEE3: and eax, 00000001h
  '0053DEE6: mov [ebp-10h], eax
  '0053DEE9: mov ecx, [ebp+08h]
  '0053DEEC: and ecx, FFFFFFFEh
  '0053DEEF: mov [ebp+08h], ecx
  '0053DEF2: mov [ebp-0Ch], 00000000h
  '0053DEF9: mov edx, [ebp+08h]
  '0053DEFC: mov eax, [edx]
  '0053DEFE: mov ecx, [ebp+08h]
  '0053DF01: push ecx
  '0053DF02: call [eax+04h]
  '0053DF05: mov [ebp-04h], 00000001h
  '0053DF0C: mov [ebp-04h], 00000002h
  '0053DF13: push FFFFFFFFh
  '0053DF15: call [004010E8h]
  '0053DF1B: mov [ebp-04h], 00000003h
  '0053DF22: lea edx, [ebp-30h]
  '0053DF25: push edx
  '0053DF26: mov eax, [ebp+08h]
  '0053DF29: mov ecx, [eax]
  '0053DF2B: mov edx, [ebp+08h]
  '0053DF2E: push edx
  '0053DF2F: call [ecx+00000218h]
  '0053DF35: fclex 
  '0053DF37: mov [ebp-00000098h], eax
  '0053DF3D: cmp [ebp-00000098h], 00000000h
  '0053DF44: jnl 53DF69h
  '0053DF46: push 00000218h
  '0053DF4B: push 0041E4C4h
  '0053DF50: mov eax, [ebp+08h]
  '0053DF53: push eax
  '0053DF54: mov ecx, [ebp-00000098h]
  '0053DF5A: push ecx
  '0053DF5B: call [004010A0h]
  '0053DF61: mov [ebp-000000C4h], eax
  '0053DF67: jmp 53DF73h
  '0053DF69: mov [ebp-000000C4h], 00000000h
  '0053DF73: mov edx, [ebp-30h]
  '0053DF76: mov [ebp-000000C0h], edx
  '0053DF7C: mov [ebp-30h], 00000000h
  '0053DF83: mov eax, [ebp-000000C0h]
  '0053DF89: push eax
  '0053DF8A: lea ecx, [ebp-000000A0h]
  '0053DF90: push ecx
  '0053DF91: call [004010E4h]
  '0053DF97: push eax
  '0053DF98: lea edx, [ebp-24h]
  '0053DF9B: push edx
  '0053DF9C: lea eax, [ebp-000000A4h]
  '0053DFA2: push eax
  '0053DFA3: push 0041F304h
  '0053DFA8: call [004010CCh]
  '0053DFAE: mov [ebp-000000BCh], eax
  '0053DFB4: jmp 0053E096h
  '0053DFB9: mov [ebp-04h], 00000004h
  '0053DFC0: push 00420F60h
  '0053DFC5: mov ecx, [ebp-24h]
  '0053DFC8: push ecx
  '0053DFC9: call [00401278h]
  '0053DFCF: movsx esi, ax
  '0053DFD2: neg esi
  '0053DFD4: sbb esi, esi
  '0053DFD6: inc esi
  '0053DFD7: push 0041E3FCh
  '0053DFDC: mov edx, [ebp-24h]
  '0053DFDF: push edx
  '0053DFE0: call [00401278h]
  '0053DFE6: movsx eax, ax
  '0053DFE9: neg eax
  '0053DFEB: sbb eax, eax
  '0053DFED: inc eax
  '0053DFEE: and esi, eax
  '0053DFF0: neg esi
  '0053DFF2: sbb esi, esi
  '0053DFF4: neg esi
  '0053DFF6: push 0041FB8Ch
  '0053DFFB: mov ecx, [ebp-24h]
  '0053DFFE: push ecx
  '0053DFFF: call [00401278h]
  '0053E005: movsx edx, ax
  '0053E008: neg edx
  '0053E00A: sbb edx, edx
  '0053E00C: inc edx
  '0053E00D: and esi, edx
  '0053E00F: neg esi
  '0053E011: sbb esi, esi
  '0053E013: neg esi
  '0053E015: push 0041CE08h
  '0053E01A: mov eax, [ebp-24h]
  '0053E01D: push eax
  '0053E01E: call [00401278h]
  '0053E024: movsx ecx, ax
  '0053E027: neg ecx
  '0053E029: sbb ecx, ecx
  '0053E02B: inc ecx
  '0053E02C: and esi, ecx
  '0053E02E: test esi, esi
  '0053E030: jnz 53E073h
  '0053E032: mov [ebp-04h], 00000005h
  '0053E039: push 00000000h
  '0053E03B: push 00420F70h
  '0053E040: mov edx, [ebp-24h]
  '0053E043: push edx
  '0053E044: lea eax, [ebp-40h]
  '0053E047: push eax
  '0053E048: call [00401368h]
  '0053E04E: add esp, 00000010h
  '0053E051: push eax
  '0053E052: call [0040130Ch]
  '0053E058: mov [ebp-00000094h], eax
  '0053E05E: lea ecx, [ebp-00000094h]
  '0053E064: push ecx
  '0053E065: call 004EB0B0h
  '0053E06A: lea ecx, [ebp-40h]
  '0053E06D: call [00401030h]
  '0053E073: mov [ebp-04h], 00000007h
  '0053E07A: lea edx, [ebp-24h]
  '0053E07D: push edx
  '0053E07E: lea eax, [ebp-000000A4h]
  '0053E084: push eax
  '0053E085: push 0041F304h
  '0053E08A: call [00401150h]
  '0053E090: mov [ebp-000000BCh], eax
  '0053E096: cmp [ebp-000000BCh], 00000000h
  '0053E09D: jnz 0053DFB9h
  '0053E0A3: mov [ebp-04h], 00000008h
  '0053E0AA: mov ecx, [ebp+08h]
  '0053E0AD: mov edx, [ecx]
  '0053E0AF: mov eax, [ebp+08h]
  '0053E0B2: push eax
  '0053E0B3: call [edx+000002FCh]
  '0053E0B9: push eax
  '0053E0BA: lea ecx, [ebp-30h]
  '0053E0BD: push ecx
  '0053E0BE: call [004010E4h]
  '0053E0C4: mov [ebp-00000098h], eax
  '0053E0CA: mov [ebp-78h], 80020004h
  '0053E0D1: mov [ebp-80h], 0000000Ah
  '0053E0D8: mov eax, 00000010h
  '0053E0DD: call 004081B0h
  '0053E0E2: mov edx, esp
  '0053E0E4: mov eax, [ebp-80h]
  '0053E0E7: mov [edx], eax
  '0053E0E9: mov ecx, [ebp-7Ch]
  '0053E0EC: mov [edx+04h], ecx
  '0053E0EF: mov eax, [ebp-78h]
  '0053E0F2: mov [edx+08h], eax
  '0053E0F5: mov ecx, [ebp-74h]
  '0053E0F8: mov [edx+0Ch], ecx
  '0053E0FB: push 0042D4CCh
  '0053E100: push 0041EA6Ch
  '0053E105: push 0041EA58h
  '0053E10A: call [00401314h]
  '0053E110: mov edx, eax
  '0053E112: lea ecx, [ebp-2Ch]
  '0053E115: call [00401378h]
  '0053E11B: push eax
  '0053E11C: call [00401250h]
  '0053E122: push eax
  '0053E123: mov edx, [ebp-00000098h]
  '0053E129: mov eax, [edx]
  '0053E12B: mov ecx, [ebp-00000098h]
  '0053E131: push ecx
  '0053E132: call [eax+000000E4h]
  '0053E138: fclex 
  '0053E13A: mov [ebp-0000009Ch], eax
  '0053E140: cmp [ebp-0000009Ch], 00000000h
  '0053E147: jnl 53E16Fh
  '0053E149: push 000000E4h
  '0053E14E: push 0041E108h
  '0053E153: mov edx, [ebp-00000098h]
  '0053E159: push edx
  '0053E15A: mov eax, [ebp-0000009Ch]
  '0053E160: push eax
  '0053E161: call [004010A0h]
  '0053E167: mov [ebp-000000C8h], eax
  '0053E16D: jmp 53E179h
  '0053E16F: mov [ebp-000000C8h], 00000000h
  '0053E179: lea ecx, [ebp-2Ch]
  '0053E17C: call [004013B4h]
  '0053E182: lea ecx, [ebp-30h]
  '0053E185: call [004013B8h]
  '0053E18B: mov [ebp-04h], 00000009h
  '0053E192: mov ecx, [ebp+08h]
  '0053E195: mov edx, [ecx]
  '0053E197: mov eax, [ebp+08h]
  '0053E19A: push eax
  '0053E19B: call [edx+00000300h]
  '0053E1A1: push eax
  '0053E1A2: lea ecx, [ebp-30h]
  '0053E1A5: push ecx
  '0053E1A6: call [004010E4h]
  '0053E1AC: mov [ebp-00000098h], eax
  '0053E1B2: mov [ebp-78h], 80020004h
  '0053E1B9: mov [ebp-80h], 0000000Ah
  '0053E1C0: mov eax, 00000010h
  '0053E1C5: call 004081B0h
  '0053E1CA: mov edx, esp
  '0053E1CC: mov eax, [ebp-80h]
  '0053E1CF: mov [edx], eax
  '0053E1D1: mov ecx, [ebp-7Ch]
  '0053E1D4: mov [edx+04h], ecx
  '0053E1D7: mov eax, [ebp-78h]
  '0053E1DA: mov [edx+08h], eax
  '0053E1DD: mov ecx, [ebp-74h]
  '0053E1E0: mov [edx+0Ch], ecx
  '0053E1E3: push 0042D4ACh
  '0053E1E8: push 0041EA6Ch
  '0053E1ED: push 0041EA58h
  '0053E1F2: call [00401314h]
  '0053E1F8: mov edx, eax
  '0053E1FA: lea ecx, [ebp-2Ch]
  '0053E1FD: call [00401378h]
  '0053E203: push eax
  '0053E204: call [00401250h]
  '0053E20A: push eax
  '0053E20B: mov edx, [ebp-00000098h]
  '0053E211: mov eax, [edx]
  '0053E213: mov ecx, [ebp-00000098h]
  '0053E219: push ecx
  '0053E21A: call [eax+000000E4h]
  '0053E220: fclex 
  '0053E222: mov [ebp-0000009Ch], eax
  '0053E228: cmp [ebp-0000009Ch], 00000000h
  '0053E22F: jnl 53E257h
  '0053E231: push 000000E4h
  '0053E236: push 0041E108h
  '0053E23B: mov edx, [ebp-00000098h]
  '0053E241: push edx
  '0053E242: mov eax, [ebp-0000009Ch]
  '0053E248: push eax
  '0053E249: call [004010A0h]
  '0053E24F: mov [ebp-000000CCh], eax
  '0053E255: jmp 53E261h
  '0053E257: mov [ebp-000000CCh], 00000000h
  '0053E261: lea ecx, [ebp-2Ch]
  '0053E264: call [004013B4h]
  '0053E26A: lea ecx, [ebp-30h]
  '0053E26D: call [004013B8h]
  '0053E273: mov [ebp-04h], 0000000Ah
  '0053E27A: mov ecx, [ebp+08h]
  '0053E27D: mov edx, [ecx]
  '0053E27F: mov eax, [ebp+08h]
  '0053E282: push eax
  '0053E283: call [edx+0000030Ch]
  '0053E289: mov [ebp-38h], eax
  '0053E28C: mov [ebp-40h], 00000009h
  '0053E293: mov eax, 00000010h
  '0053E298: call 004081B0h
  '0053E29D: mov ecx, esp
  '0053E29F: mov edx, [ebp-40h]
  '0053E2A2: mov [ecx], edx
  '0053E2A4: mov eax, [ebp-3Ch]
  '0053E2A7: mov [ecx+04h], eax
  '0053E2AA: mov edx, [ebp-38h]
  '0053E2AD: mov [ecx+08h], edx
  '0053E2B0: mov eax, [ebp-34h]
  '0053E2B3: mov [ecx+0Ch], eax
  '0053E2B6: push 0042D5F4h
  '0053E2BB: push 0041EA6Ch
  '0053E2C0: push 0041EA58h
  '0053E2C5: call [00401314h]
  '0053E2CB: mov edx, eax
  '0053E2CD: lea ecx, [ebp-28h]
  '0053E2D0: call [00401378h]
  '0053E2D6: lea ecx, [ebp-40h]
  '0053E2D9: call [00401030h]
  '0053E2DF: mov [ebp-04h], 0000000Bh
  '0053E2E6: mov ecx, [ebp-28h]
  '0053E2E9: push ecx
  '0053E2EA: call [00401044h]
  '0053E2F0: test eax, eax
  '0053E2F2: jle 0053E382h
  '0053E2F8: mov [ebp-04h], 0000000Ch
  '0053E2FF: mov edx, [ebp+08h]
  '0053E302: mov eax, [edx]
  '0053E304: mov ecx, [ebp+08h]
  '0053E307: push ecx
  '0053E308: call [eax+00000314h]
  '0053E30E: push eax
  '0053E30F: lea edx, [ebp-30h]
  '0053E312: push edx
  '0053E313: call [004010E4h]
  '0053E319: mov [ebp-00000098h], eax
  '0053E31F: mov eax, [ebp-28h]
  '0053E322: push eax
  '0053E323: mov ecx, [ebp-00000098h]
  '0053E329: mov edx, [ecx]
  '0053E32B: mov eax, [ebp-00000098h]
  '0053E331: push eax
  '0053E332: call [edx+000000ACh]
  '0053E338: fclex 
  '0053E33A: mov [ebp-0000009Ch], eax
  '0053E340: cmp [ebp-0000009Ch], 00000000h
  '0053E347: jnl 53E36Fh
  '0053E349: push 000000ACh
  '0053E34E: push 0041C0C4h
  '0053E353: mov ecx, [ebp-00000098h]
  '0053E359: push ecx
  '0053E35A: mov edx, [ebp-0000009Ch]
  '0053E360: push edx
  '0053E361: call [004010A0h]
  '0053E367: mov [ebp-000000D0h], eax
  '0053E36D: jmp 53E379h
  '0053E36F: mov [ebp-000000D0h], 00000000h
  '0053E379: lea ecx, [ebp-30h]
  '0053E37C: call [004013B8h]
  '0053E382: mov [ebp-04h], 0000000Eh
  '0053E389: mov [ebp-38h], 80020004h
  '0053E390: mov [ebp-40h], 0000000Ah
  '0053E397: lea eax, [ebp-40h]
  '0053E39A: push eax
  '0053E39B: lea ecx, [ebp-50h]
  '0053E39E: push ecx
  '0053E39F: call [0040129Ch]
  '0053E3A5: mov [ebp-00000088h], 0042D60Ch
  '0053E3AF: mov [ebp-00000090h], 00000008h
  '0053E3B9: lea edx, [ebp-50h]
  '0053E3BC: push edx
  '0053E3BD: lea eax, [ebp-00000090h]
  '0053E3C3: push eax
  '0053E3C4: lea ecx, [ebp-60h]
  '0053E3C7: push ecx
  '0053E3C8: call [00401274h]
  '0053E3CE: push eax
  '0053E3CF: lea edx, [ebp-2Ch]
  '0053E3D2: push edx
  '0053E3D3: call [0040126Ch]
  '0053E3D9: push eax
  '0053E3DA: call 00520140h
  '0053E3DF: xor ecx, ecx
  '0053E3E1: cmp ax, FFFFh
  '0053E3E5: setz cl
  '0053E3E8: neg ecx
  '0053E3EA: mov [ebp-00000098h], cx
  '0053E3F1: lea ecx, [ebp-2Ch]
  '0053E3F4: call [004013B4h]
  '0053E3FA: lea edx, [ebp-60h]
  '0053E3FD: push edx
  '0053E3FE: lea eax, [ebp-50h]
  '0053E401: push eax
  '0053E402: lea ecx, [ebp-40h]
  '0053E405: push ecx
  '0053E406: push 00000003h
  '0053E408: call [00401050h]
  '0053E40E: add esp, 00000010h
  '0053E411: movsx edx, word ptr [ebp-00000098h]
  '0053E418: test edx, edx
  '0053E41A: jz 0053E5E1h
  '0053E420: mov [ebp-04h], 0000000Fh
  '0053E427: mov [ebp-38h], 80020004h
  '0053E42E: mov [ebp-40h], 0000000Ah
  '0053E435: lea eax, [ebp-40h]
  '0053E438: push eax
  '0053E439: lea ecx, [ebp-50h]
  '0053E43C: push ecx
  '0053E43D: call [0040129Ch]
  '0053E443: mov [ebp-00000088h], 0042D60Ch
  '0053E44D: mov [ebp-00000090h], 00000008h
  '0053E457: lea edx, [ebp-50h]
  '0053E45A: push edx
  '0053E45B: lea eax, [ebp-00000090h]
  '0053E461: push eax
  '0053E462: lea ecx, [ebp-60h]
  '0053E465: push ecx
  '0053E466: call [00401274h]
  '0053E46C: push eax
  '0053E46D: lea edx, [ebp-2Ch]
  '0053E470: push edx
  '0053E471: call [0040126Ch]
  '0053E477: push eax
  '0053E478: call [004012FCh]
  '0053E47E: xor ecx, ecx
  '0053E480: cmp eax, 00002710h
  '0053E485: setnle cl
  '0053E488: neg ecx
  '0053E48A: mov [ebp-00000098h], cx
  '0053E491: lea ecx, [ebp-2Ch]
  '0053E494: call [004013B4h]
  '0053E49A: lea edx, [ebp-60h]
  '0053E49D: push edx
  '0053E49E: lea eax, [ebp-50h]
  '0053E4A1: push eax
  '0053E4A2: lea ecx, [ebp-40h]
  '0053E4A5: push ecx
  '0053E4A6: push 00000003h
  '0053E4A8: call [00401050h]
  '0053E4AE: add esp, 00000010h
  '0053E4B1: movsx edx, word ptr [ebp-00000098h]
  '0053E4B8: test edx, edx
  '0053E4BA: jz 53E52Bh
  '0053E4BC: mov [ebp-04h], 00000010h
  '0053E4C3: mov [ebp-38h], 80020004h
  '0053E4CA: mov [ebp-40h], 0000000Ah
  '0053E4D1: lea eax, [ebp-40h]
  '0053E4D4: push eax
  '0053E4D5: lea ecx, [ebp-50h]
  '0053E4D8: push ecx
  '0053E4D9: call [0040129Ch]
  '0053E4DF: mov [ebp-00000088h], 0042D60Ch
  '0053E4E9: mov [ebp-00000090h], 00000008h
  '0053E4F3: lea edx, [ebp-50h]
  '0053E4F6: push edx
  '0053E4F7: lea eax, [ebp-00000090h]
  '0053E4FD: push eax
  '0053E4FE: lea ecx, [ebp-60h]
  '0053E501: push ecx
  '0053E502: call [00401274h]
  '0053E508: push eax
  '0053E509: call [00401188h]
  '0053E50F: lea edx, [ebp-60h]
  '0053E512: push edx
  '0053E513: lea eax, [ebp-50h]
  '0053E516: push eax
  '0053E517: lea ecx, [ebp-40h]
  '0053E51A: push ecx
  '0053E51B: push 00000003h
  '0053E51D: call [00401050h]
  '0053E523: add esp, 00000010h
  '0053E526: jmp 0053E5E1h
  '0053E52B: mov [ebp-04h], 00000012h
  '0053E532: mov [ebp-38h], 80020004h
  '0053E539: mov [ebp-40h], 0000000Ah
  '0053E540: lea edx, [ebp-40h]
  '0053E543: push edx
  '0053E544: lea eax, [ebp-50h]
  '0053E547: push eax
  '0053E548: call [0040129Ch]
  '0053E54E: mov ecx, [ebp+08h]
  '0053E551: mov edx, [ecx]
  '0053E553: mov eax, [ebp+08h]
  '0053E556: push eax
  '0053E557: call [edx+00000314h]
  '0053E55D: push eax
  '0053E55E: lea ecx, [ebp-30h]
  '0053E561: push ecx
  '0053E562: call [004010E4h]
  '0053E568: mov [ebp-00000088h], 0042D60Ch
  '0053E572: mov [ebp-00000090h], 00000008h
  '0053E57C: lea edx, [ebp-50h]
  '0053E57F: push edx
  '0053E580: lea eax, [ebp-00000090h]
  '0053E586: push eax
  '0053E587: lea ecx, [ebp-60h]
  '0053E58A: push ecx
  '0053E58B: call [00401274h]
  '0053E591: push eax
  '0053E592: call [0040103Ch]
  '0053E598: mov edx, eax
  '0053E59A: lea ecx, [ebp-2Ch]
  '0053E59D: call [00401378h]
  '0053E5A3: lea edx, [ebp-30h]
  '0053E5A6: push edx
  '0053E5A7: lea eax, [ebp-2Ch]
  '0053E5AA: push eax
  '0053E5AB: lea ecx, [ebp-70h]
  '0053E5AE: push ecx
  '0053E5AF: call 00519A60h
  '0053E5B4: lea ecx, [ebp-2Ch]
  '0053E5B7: call [004013B4h]
  '0053E5BD: lea ecx, [ebp-30h]
  '0053E5C0: call [004013B8h]
  '0053E5C6: lea edx, [ebp-70h]
  '0053E5C9: push edx
  '0053E5CA: lea eax, [ebp-60h]
  '0053E5CD: push eax
  '0053E5CE: lea ecx, [ebp-50h]
  '0053E5D1: push ecx
  '0053E5D2: lea edx, [ebp-40h]
  '0053E5D5: push edx
  '0053E5D6: push 00000004h
  '0053E5D8: call [00401050h]
  '0053E5DE: add esp, 00000014h
  '0053E5E1: mov [ebp-10h], 00000000h
  '0053E5E8: push 0053E649h
  '0053E5ED: jmp 53E61Dh
  '0053E5EF: lea ecx, [ebp-2Ch]
  '0053E5F2: call [004013B4h]
  '0053E5F8: lea ecx, [ebp-30h]
  '0053E5FB: call [004013B8h]
  '0053E601: lea eax, [ebp-70h]
  '0053E604: push eax
  '0053E605: lea ecx, [ebp-60h]
  '0053E608: push ecx
  '0053E609: lea edx, [ebp-50h]
  '0053E60C: push edx
  '0053E60D: lea eax, [ebp-40h]
  '0053E610: push eax
  '0053E611: push 00000004h
  '0053E613: call [00401050h]
  '0053E619: add esp, 00000014h
  '0053E61C: ret 
End Sub
Private Sub Form__53E670
  '0053E670: push ebp
  '0053E671: mov ebp, esp
  '0053E673: sub esp, 0000000Ch
  '0053E676: push 004081B6h
  '0053E67B: mov eax, fs:[00h]
  '0053E681: push eax
  '0053E682: mov fs:[00000000h], esp
  '0053E689: sub esp, 00000018h
  '0053E68C: push ebx
  '0053E68D: push esi
  '0053E68E: push edi
  '0053E68F: mov [ebp-0Ch], esp
  '0053E692: mov [ebp-08h], 004080C0h
  '0053E699: mov esi, [ebp+08h]
  '0053E69C: mov eax, esi
  '0053E69E: and eax, 00000001h
  '0053E6A1: mov [ebp-04h], eax
  '0053E6A4: and esi, FFFFFFFEh
  '0053E6A7: push esi
  '0053E6A8: mov [ebp+08h], esi
  '0053E6AB: mov ecx, [esi]
  '0053E6AD: call [ecx+04h]
  '0053E6B0: mov edx, [esi]
  '0053E6B2: xor edi, edi
  '0053E6B4: push esi
  '0053E6B5: mov [ebp-18h], edi
  '0053E6B8: mov [ebp-1Ch], edi
  '0053E6BB: call [edx+0000030Ch]
  '0053E6C1: push eax
  '0053E6C2: lea eax, [ebp-1Ch]
  '0053E6C5: push eax
  '0053E6C6: call [004010E4h]
  '0053E6CC: mov esi, eax
  '0053E6CE: lea edx, [ebp-18h]
  '0053E6D1: push edx
  '0053E6D2: push esi
  '0053E6D3: mov ecx, [esi]
  '0053E6D5: call [ecx+000000A0h]
  '0053E6DB: cmp eax, edi
  '0053E6DD: fclex 
  '0053E6DF: jnl 53E6F3h
  '0053E6E1: push 000000A0h
  '0053E6E6: push 0041E3FCh
  '0053E6EB: push esi
  '0053E6EC: push eax
  '0053E6ED: call [004010A0h]
  '0053E6F3: mov eax, [ebp-18h]
  '0053E6F6: push eax
  '0053E6F7: push 0042D5F4h
  '0053E6FC: push 0041EA6Ch
  '0053E701: push 0041EA58h
  '0053E706: call [00401010h]
  '0053E70C: lea ecx, [ebp-18h]
  '0053E70F: call [004013B4h]
  '0053E715: lea ecx, [ebp-1Ch]
  '0053E718: call [004013B8h]
  '0053E71E: mov [ebp-04h], edi
  '0053E721: push 0053E73Ch
  '0053E726: jmp 53E73Bh
  '0053E728: lea ecx, [ebp-18h]
  '0053E72B: call [004013B4h]
  '0053E731: lea ecx, [ebp-1Ch]
  '0053E734: call [004013B8h]
  '0053E73A: ret 
End Sub
Private Sub cmdSendKeys__53D3D0
  '0053D3D0: push ebp
  '0053D3D1: mov ebp, esp
  '0053D3D3: sub esp, 00000018h
  '0053D3D6: push 004081B6h
  '0053D3DB: mov eax, fs:[00h]
  '0053D3E1: push eax
  '0053D3E2: mov fs:[00000000h], esp
  '0053D3E9: mov eax, 00000100h
  '0053D3EE: call 004081B0h
  '0053D3F3: push ebx
  '0053D3F4: push esi
  '0053D3F5: push edi
  '0053D3F6: mov [ebp-18h], esp
  '0053D3F9: mov [ebp-14h], 00407FD0h
  '0053D400: mov eax, [ebp+08h]
  '0053D403: and eax, 00000001h
  '0053D406: mov [ebp-10h], eax
  '0053D409: mov ecx, [ebp+08h]
  '0053D40C: and ecx, FFFFFFFEh
  '0053D40F: mov [ebp+08h], ecx
  '0053D412: mov [ebp-0Ch], 00000000h
  '0053D419: mov edx, [ebp+08h]
  '0053D41C: mov eax, [edx]
  '0053D41E: mov ecx, [ebp+08h]
  '0053D421: push ecx
  '0053D422: call [eax+04h]
  '0053D425: mov [ebp-04h], 00000001h
  '0053D42C: mov [ebp-04h], 00000002h
  '0053D433: push FFFFFFFFh
  '0053D435: call [004010E8h]
  '0053D43B: mov [ebp-04h], 00000003h
  '0053D442: lea edx, [ebp-24h]
  '0053D445: push edx
  '0053D446: mov eax, [ebp+08h]
  '0053D449: mov ecx, [eax]
  '0053D44B: mov edx, [ebp+08h]
  '0053D44E: push edx
  '0053D44F: call [ecx+000001C0h]
  '0053D455: fclex 
  '0053D457: mov [ebp-000000C4h], eax
  '0053D45D: cmp [ebp-000000C4h], 00000000h
  '0053D464: jnl 53D489h
  '0053D466: push 000001C0h
  '0053D46B: push 0041E4C4h
  '0053D470: mov eax, [ebp+08h]
  '0053D473: push eax
  '0053D474: mov ecx, [ebp-000000C4h]
  '0053D47A: push ecx
  '0053D47B: call [004010A0h]
  '0053D481: mov [ebp-000000F0h], eax
  '0053D487: jmp 53D493h
  '0053D489: mov [ebp-000000F0h], 00000000h
  '0053D493: mov [ebp-3Ch], 80020004h
  '0053D49A: mov [ebp-44h], 0000000Ah
  '0053D4A1: lea edx, [ebp-44h]
  '0053D4A4: push edx
  '0053D4A5: push 00000004h
  '0053D4A7: mov eax, [ebp-24h]
  '0053D4AA: push eax
  '0053D4AB: call [00401148h]
  '0053D4B1: mov edx, eax
  '0053D4B3: lea ecx, [ebp-28h]
  '0053D4B6: call [00401378h]
  '0053D4BC: push eax
  '0053D4BD: call [00401044h]
  '0053D4C3: neg eax
  '0053D4C5: sbb eax, eax
  '0053D4C7: inc eax
  '0053D4C8: neg eax
  '0053D4CA: mov [ebp-000000C8h], ax
  '0053D4D1: lea ecx, [ebp-28h]
  '0053D4D4: push ecx
  '0053D4D5: lea edx, [ebp-24h]
  '0053D4D8: push edx
  '0053D4D9: push 00000002h
  '0053D4DB: call [004012E8h]
  '0053D4E1: add esp, 0000000Ch
  '0053D4E4: lea ecx, [ebp-44h]
  '0053D4E7: call [00401030h]
  '0053D4ED: movsx eax, word ptr [ebp-000000C8h]
  '0053D4F4: test eax, eax
  '0053D4F6: jz 0053D641h
  '0053D4FC: mov [ebp-04h], 00000004h
  '0053D503: mov [ebp-6Ch], 80020004h
  '0053D50A: mov [ebp-74h], 0000000Ah
  '0053D511: mov [ebp-5Ch], 80020004h
  '0053D518: mov [ebp-64h], 0000000Ah
  '0053D51F: mov [ebp-0000008Ch], 0042D544h
  '0053D529: mov [ebp-00000094h], 00000008h
  '0053D533: lea edx, [ebp-00000094h]
  '0053D539: lea ecx, [ebp-54h]
  '0053D53C: call [00401338h]
  '0053D542: mov [ebp-7Ch], 0042D4F0h
  '0053D549: mov [ebp-00000084h], 00000008h
  '0053D553: lea edx, [ebp-00000084h]
  '0053D559: lea ecx, [ebp-44h]
  '0053D55C: call [00401338h]
  '0053D562: lea ecx, [ebp-74h]
  '0053D565: push ecx
  '0053D566: lea edx, [ebp-64h]
  '0053D569: push edx
  '0053D56A: lea eax, [ebp-54h]
  '0053D56D: push eax
  '0053D56E: push 00000010h
  '0053D570: lea ecx, [ebp-44h]
  '0053D573: push ecx
  '0053D574: call [004010E0h]
  '0053D57A: lea edx, [ebp-74h]
  '0053D57D: push edx
  '0053D57E: lea eax, [ebp-64h]
  '0053D581: push eax
  '0053D582: lea ecx, [ebp-54h]
  '0053D585: push ecx
  '0053D586: lea edx, [ebp-44h]
  '0053D589: push edx
  '0053D58A: push 00000004h
  '0053D58C: call [00401050h]
  '0053D592: add esp, 00000014h
  '0053D595: mov [ebp-04h], 00000005h
  '0053D59C: cmp [0054238Ch], 00000000h
  '0053D5A3: jnz 53D5C1h
  '0053D5A5: push 0054238Ch
  '0053D5AA: push 0041D9E0h
  '0053D5AF: call [004012B8h]
  '0053D5B5: mov [ebp-000000F4h], 0054238Ch
  '0053D5BF: jmp 53D5CBh
  '0053D5C1: mov [ebp-000000F4h], 0054238Ch
  '0053D5CB: mov eax, [ebp-000000F4h]
  '0053D5D1: mov ecx, [eax]
  '0053D5D3: mov [ebp-000000C4h], ecx
  '0053D5D9: mov edx, [ebp+08h]
  '0053D5DC: push edx
  '0053D5DD: lea eax, [ebp-34h]
  '0053D5E0: push eax
  '0053D5E1: call [004010F8h]
  '0053D5E7: push eax
  '0053D5E8: mov ecx, [ebp-000000C4h]
  '0053D5EE: mov edx, [ecx]
  '0053D5F0: mov eax, [ebp-000000C4h]
  '0053D5F6: push eax
  '0053D5F7: call [edx+10h]
  '0053D5FA: fclex 
  '0053D5FC: mov [ebp-000000C8h], eax
  '0053D602: cmp [ebp-000000C8h], 00000000h
  '0053D609: jnl 53D62Eh
  '0053D60B: push 00000010h
  '0053D60D: push 0041D9D0h
  '0053D612: mov ecx, [ebp-000000C4h]
  '0053D618: push ecx
  '0053D619: mov edx, [ebp-000000C8h]
  '0053D61F: push edx
  '0053D620: call [004010A0h]
  '0053D626: mov [ebp-000000F8h], eax
  '0053D62C: jmp 53D638h
  '0053D62E: mov [ebp-000000F8h], 00000000h
  '0053D638: lea ecx, [ebp-34h]
  '0053D63B: call [004013B8h]
  '0053D641: mov [ebp-04h], 00000007h
  '0053D648: mov eax, [ebp+08h]
  '0053D64B: mov ecx, [eax]
  '0053D64D: mov edx, [ebp+08h]
  '0053D650: push edx
  '0053D651: call [ecx+0000030Ch]
  '0053D657: push eax
  '0053D658: lea eax, [ebp-34h]
  '0053D65B: push eax
  '0053D65C: call [004010E4h]
  '0053D662: mov [ebp-000000C4h], eax
  '0053D668: lea ecx, [ebp-24h]
  '0053D66B: push ecx
  '0053D66C: mov edx, [ebp-000000C4h]
  '0053D672: mov eax, [edx]
  '0053D674: mov ecx, [ebp-000000C4h]
  '0053D67A: push ecx
  '0053D67B: call [eax+000000A0h]
  '0053D681: fclex 
  '0053D683: mov [ebp-000000C8h], eax
  '0053D689: cmp [ebp-000000C8h], 00000000h
  '0053D690: jnl 53D6B8h
  '0053D692: push 000000A0h
  '0053D697: push 0041E3FCh
  '0053D69C: mov edx, [ebp-000000C4h]
  '0053D6A2: push edx
  '0053D6A3: mov eax, [ebp-000000C8h]
  '0053D6A9: push eax
  '0053D6AA: call [004010A0h]
  '0053D6B0: mov [ebp-000000FCh], eax
  '0053D6B6: jmp 53D6C2h
  '0053D6B8: mov [ebp-000000FCh], 00000000h
  '0053D6C2: mov ecx, [ebp-24h]
  '0053D6C5: push ecx
  '0053D6C6: call [00401044h]
  '0053D6CC: neg eax
  '0053D6CE: sbb eax, eax
  '0053D6D0: inc eax
  '0053D6D1: neg eax
  '0053D6D3: mov [ebp-000000CCh], ax
  '0053D6DA: lea ecx, [ebp-24h]
  '0053D6DD: call [004013B4h]
  '0053D6E3: lea ecx, [ebp-34h]
  '0053D6E6: call [004013B8h]
  '0053D6EC: movsx edx, word ptr [ebp-000000CCh]
  '0053D6F3: test edx, edx
  '0053D6F5: jz 0053D799h
  '0053D6FB: mov [ebp-04h], 00000008h
  '0053D702: mov [ebp-6Ch], 80020004h
  '0053D709: mov [ebp-74h], 0000000Ah
  '0053D710: mov [ebp-5Ch], 80020004h
  '0053D717: mov [ebp-64h], 0000000Ah
  '0053D71E: mov [ebp-0000008Ch], 0042D5D4h
  '0053D728: mov [ebp-00000094h], 00000008h
  '0053D732: lea edx, [ebp-00000094h]
  '0053D738: lea ecx, [ebp-54h]
  '0053D73B: call [00401338h]
  '0053D741: mov [ebp-7Ch], 0042D568h
  '0053D748: mov [ebp-00000084h], 00000008h
  '0053D752: lea edx, [ebp-00000084h]
  '0053D758: lea ecx, [ebp-44h]
  '0053D75B: call [00401338h]
  '0053D761: lea eax, [ebp-74h]
  '0053D764: push eax
  '0053D765: lea ecx, [ebp-64h]
  '0053D768: push ecx
  '0053D769: lea edx, [ebp-54h]
  '0053D76C: push edx
  '0053D76D: push 00000030h
  '0053D76F: lea eax, [ebp-44h]
  '0053D772: push eax
  '0053D773: call [004010E0h]
  '0053D779: lea ecx, [ebp-74h]
  '0053D77C: push ecx
  '0053D77D: lea edx, [ebp-64h]
  '0053D780: push edx
  '0053D781: lea eax, [ebp-54h]
  '0053D784: push eax
  '0053D785: lea ecx, [ebp-44h]
  '0053D788: push ecx
  '0053D789: push 00000004h
  '0053D78B: call [00401050h]
  '0053D791: add esp, 00000014h
  '0053D794: jmp 0053DC68h
  '0053D799: mov [ebp-04h], 0000000Ah
  '0053D7A0: lea edx, [ebp-24h]
  '0053D7A3: push edx
  '0053D7A4: mov eax, [ebp+08h]
  '0053D7A7: mov ecx, [eax]
  '0053D7A9: mov edx, [ebp+08h]
  '0053D7AC: push edx
  '0053D7AD: call [ecx+000001C0h]
  '0053D7B3: fclex 
  '0053D7B5: mov [ebp-000000C4h], eax
  '0053D7BB: cmp [ebp-000000C4h], 00000000h
  '0053D7C2: jnl 53D7E7h
  '0053D7C4: push 000001C0h
  '0053D7C9: push 0041E4C4h
  '0053D7CE: mov eax, [ebp+08h]
  '0053D7D1: push eax
  '0053D7D2: mov ecx, [ebp-000000C4h]
  '0053D7D8: push ecx
  '0053D7D9: call [004010A0h]
  '0053D7DF: mov [ebp-00000100h], eax
  '0053D7E5: jmp 53D7F1h
  '0053D7E7: mov [ebp-00000100h], 00000000h
  '0053D7F1: mov [ebp-3Ch], 80020004h
  '0053D7F8: mov [ebp-44h], 0000000Ah
  '0053D7FF: lea edx, [ebp-44h]
  '0053D802: push edx
  '0053D803: push 00000004h
  '0053D805: mov eax, [ebp-24h]
  '0053D808: push eax
  '0053D809: call [00401148h]
  '0053D80F: mov edx, eax
  '0053D811: lea ecx, [ebp-28h]
  '0053D814: call [00401378h]
  '0053D81A: push eax
  '0053D81B: call [004013BCh]
  '0053D821: fstp real8 ptr [ebp-000000C0h]
  '0053D827: cmp [00541024h], 00000000h
  '0053D82E: jnz 53D84Ch
  '0053D830: push 00541024h
  '0053D835: push 00413334h
  '0053D83A: call [004012B8h]
  '0053D840: mov [ebp-00000104h], 00541024h
  '0053D84A: jmp 53D856h
  '0053D84C: mov [ebp-00000104h], 00541024h
  '0053D856: mov ecx, [ebp-00000104h]
  '0053D85C: mov edx, [ecx]
  '0053D85E: mov [ebp-000000D0h], edx
  '0053D864: mov eax, [ebp+08h]
  '0053D867: mov ecx, [eax]
  '0053D869: mov edx, [ebp+08h]
  '0053D86C: push edx
  '0053D86D: call [ecx+0000030Ch]
  '0053D873: push eax
  '0053D874: lea eax, [ebp-34h]
  '0053D877: push eax
  '0053D878: call [004010E4h]
  '0053D87E: mov [ebp-000000C8h], eax
  '0053D884: lea ecx, [ebp-2Ch]
  '0053D887: push ecx
  '0053D888: mov edx, [ebp-000000C8h]
  '0053D88E: mov eax, [edx]
  '0053D890: mov ecx, [ebp-000000C8h]
  '0053D896: push ecx
  '0053D897: call [eax+000000A0h]
  '0053D89D: fclex 
  '0053D89F: mov [ebp-000000CCh], eax
  '0053D8A5: cmp [ebp-000000CCh], 00000000h
  '0053D8AC: jnl 53D8D4h
  '0053D8AE: push 000000A0h
  '0053D8B3: push 0041E3FCh
  '0053D8B8: mov edx, [ebp-000000C8h]
  '0053D8BE: push edx
  '0053D8BF: mov eax, [ebp-000000CCh]
  '0053D8C5: push eax
  '0053D8C6: call [004010A0h]
  '0053D8CC: mov [ebp-00000108h], eax
  '0053D8D2: jmp 53D8DEh
  '0053D8D4: mov [ebp-00000108h], 00000000h
  '0053D8DE: push 0041E55Ch
  '0053D8E3: mov ecx, [ebp-2Ch]
  '0053D8E6: push ecx
  '0053D8E7: call [0040108Ch]
  '0053D8ED: mov edx, eax
  '0053D8EF: lea ecx, [ebp-30h]
  '0053D8F2: call [00401378h]
  '0053D8F8: fld real8 ptr [ebp-000000C0h]
  '0053D8FE: call [00401348h]
  '0053D904: mov [ebp-000000B8h], ax
  '0053D90B: lea edx, [ebp-30h]
  '0053D90E: push edx
  '0053D90F: lea eax, [ebp-000000B8h]
  '0053D915: push eax
  '0053D916: mov ecx, [ebp-000000D0h]
  '0053D91C: mov edx, [ecx]
  '0053D91E: mov eax, [ebp-000000D0h]
  '0053D924: push eax
  '0053D925: call [edx+00000714h]
  '0053D92B: fclex 
  '0053D92D: mov [ebp-000000D4h], eax
  '0053D933: cmp [ebp-000000D4h], 00000000h
  '0053D93A: jnl 53D962h
  '0053D93C: push 00000714h
  '0053D941: push 0041C118h
  '0053D946: mov ecx, [ebp-000000D0h]
  '0053D94C: push ecx
  '0053D94D: mov edx, [ebp-000000D4h]
  '0053D953: push edx
  '0053D954: call [004010A0h]
  '0053D95A: mov [ebp-0000010Ch], eax
  '0053D960: jmp 53D96Ch
  '0053D962: mov [ebp-0000010Ch], 00000000h
  '0053D96C: lea eax, [ebp-30h]
  '0053D96F: push eax
  '0053D970: lea ecx, [ebp-2Ch]
  '0053D973: push ecx
  '0053D974: lea edx, [ebp-28h]
  '0053D977: push edx
  '0053D978: lea eax, [ebp-24h]
  '0053D97B: push eax
  '0053D97C: push 00000004h
  '0053D97E: call [004012E8h]
  '0053D984: add esp, 00000014h
  '0053D987: lea ecx, [ebp-34h]
  '0053D98A: call [004013B8h]
  '0053D990: lea ecx, [ebp-44h]
  '0053D993: call [00401030h]
  '0053D999: mov [ebp-04h], 0000000Bh
  '0053D9A0: mov ecx, [ebp+08h]
  '0053D9A3: mov edx, [ecx]
  '0053D9A5: mov eax, [ebp+08h]
  '0053D9A8: push eax
  '0053D9A9: call [edx+0000030Ch]
  '0053D9AF: push eax
  '0053D9B0: lea ecx, [ebp-34h]
  '0053D9B3: push ecx
  '0053D9B4: call [004010E4h]
  '0053D9BA: mov [ebp-000000C4h], eax
  '0053D9C0: lea edx, [ebp-24h]
  '0053D9C3: push edx
  '0053D9C4: mov eax, [ebp-000000C4h]
  '0053D9CA: mov ecx, [eax]
  '0053D9CC: mov edx, [ebp-000000C4h]
  '0053D9D2: push edx
  '0053D9D3: call [ecx+000000A0h]
  '0053D9D9: fclex 
  '0053D9DB: mov [ebp-000000C8h], eax
  '0053D9E1: cmp [ebp-000000C8h], 00000000h
  '0053D9E8: jnl 53DA10h
  '0053D9EA: push 000000A0h
  '0053D9EF: push 0041E3FCh
  '0053D9F4: mov eax, [ebp-000000C4h]
  '0053D9FA: push eax
  '0053D9FB: mov ecx, [ebp-000000C8h]
  '0053DA01: push ecx
  '0053DA02: call [004010A0h]
  '0053DA08: mov [ebp-00000110h], eax
  '0053DA0E: jmp 53DA1Ah
  '0053DA10: mov [ebp-00000110h], 00000000h
  '0053DA1A: mov edx, [ebp-24h]
  '0053DA1D: push edx
  '0053DA1E: push 0042D5F4h
  '0053DA23: push 0041EA6Ch
  '0053DA28: push 0041EA58h
  '0053DA2D: call [00401010h]
  '0053DA33: lea ecx, [ebp-24h]
  '0053DA36: call [004013B4h]
  '0053DA3C: lea ecx, [ebp-34h]
  '0053DA3F: call [004013B8h]
  '0053DA45: mov [ebp-04h], 0000000Ch
  '0053DA4C: mov eax, [ebp+08h]
  '0053DA4F: mov ecx, [eax]
  '0053DA51: mov edx, [ebp+08h]
  '0053DA54: push edx
  '0053DA55: call [ecx+0000030Ch]
  '0053DA5B: push eax
  '0053DA5C: lea eax, [ebp-34h]
  '0053DA5F: push eax
  '0053DA60: call [004010E4h]
  '0053DA66: mov [ebp-000000C4h], eax
  '0053DA6C: lea ecx, [ebp-24h]
  '0053DA6F: push ecx
  '0053DA70: mov edx, [ebp-000000C4h]
  '0053DA76: mov eax, [edx]
  '0053DA78: mov ecx, [ebp-000000C4h]
  '0053DA7E: push ecx
  '0053DA7F: call [eax+000000A0h]
  '0053DA85: fclex 
  '0053DA87: mov [ebp-000000C8h], eax
  '0053DA8D: cmp [ebp-000000C8h], 00000000h
  '0053DA94: jnl 53DABCh
  '0053DA96: push 000000A0h
  '0053DA9B: push 0041E3FCh
  '0053DAA0: mov edx, [ebp-000000C4h]
  '0053DAA6: push edx
  '0053DAA7: mov eax, [ebp-000000C8h]
  '0053DAAD: push eax
  '0053DAAE: call [004010A0h]
  '0053DAB4: mov [ebp-00000114h], eax
  '0053DABA: jmp 53DAC6h
  '0053DABC: mov [ebp-00000114h], 00000000h
  '0053DAC6: mov ecx, [ebp-24h]
  '0053DAC9: mov [ebp-000000ECh], ecx
  '0053DACF: mov [ebp-24h], 00000000h
  '0053DAD6: mov edx, [ebp-000000ECh]
  '0053DADC: lea ecx, [ebp-28h]
  '0053DADF: call [00401378h]
  '0053DAE5: lea edx, [ebp-28h]
  '0053DAE8: push edx
  '0053DAE9: mov eax, [ebp+08h]
  '0053DAEC: mov ecx, [eax]
  '0053DAEE: mov edx, [ebp+08h]
  '0053DAF1: push edx
  '0053DAF2: call [ecx+0000071Ch]
  '0053DAF8: lea ecx, [ebp-28h]
  '0053DAFB: call [004013B4h]
  '0053DB01: lea ecx, [ebp-34h]
  '0053DB04: call [004013B8h]
  '0053DB0A: mov [ebp-04h], 0000000Dh
  '0053DB11: mov eax, [ebp+08h]
  '0053DB14: mov ecx, [eax]
  '0053DB16: mov edx, [ebp+08h]
  '0053DB19: push edx
  '0053DB1A: call [ecx+00000300h]
  '0053DB20: push eax
  '0053DB21: lea eax, [ebp-34h]
  '0053DB24: push eax
  '0053DB25: call [004010E4h]
  '0053DB2B: mov [ebp-000000C4h], eax
  '0053DB31: lea ecx, [ebp-000000B8h]
  '0053DB37: push ecx
  '0053DB38: mov edx, [ebp-000000C4h]
  '0053DB3E: mov eax, [edx]
  '0053DB40: mov ecx, [ebp-000000C4h]
  '0053DB46: push ecx
  '0053DB47: call [eax+000000E0h]
  '0053DB4D: fclex 
  '0053DB4F: mov [ebp-000000C8h], eax
  '0053DB55: cmp [ebp-000000C8h], 00000000h
  '0053DB5C: jnl 53DB84h
  '0053DB5E: push 000000E0h
  '0053DB63: push 0041E108h
  '0053DB68: mov edx, [ebp-000000C4h]
  '0053DB6E: push edx
  '0053DB6F: mov eax, [ebp-000000C8h]
  '0053DB75: push eax
  '0053DB76: call [004010A0h]
  '0053DB7C: mov [ebp-00000118h], eax
  '0053DB82: jmp 53DB8Eh
  '0053DB84: mov [ebp-00000118h], 00000000h
  '0053DB8E: xor ecx, ecx
  '0053DB90: cmp word ptr [ebp-000000B8h], 0001h
  '0053DB98: setz cl
  '0053DB9B: neg ecx
  '0053DB9D: mov [ebp-000000CCh], cx
  '0053DBA4: lea ecx, [ebp-34h]
  '0053DBA7: call [004013B8h]
  '0053DBAD: movsx edx, word ptr [ebp-000000CCh]
  '0053DBB4: test edx, edx
  '0053DBB6: jz 0053DC68h
  '0053DBBC: mov [ebp-04h], 0000000Eh
  '0053DBC3: cmp [0054238Ch], 00000000h
  '0053DBCA: jnz 53DBE8h
  '0053DBCC: push 0054238Ch
  '0053DBD1: push 0041D9E0h
  '0053DBD6: call [004012B8h]
  '0053DBDC: mov [ebp-0000011Ch], 0054238Ch
  '0053DBE6: jmp 53DBF2h
  '0053DBE8: mov [ebp-0000011Ch], 0054238Ch
  '0053DBF2: mov eax, [ebp-0000011Ch]
  '0053DBF8: mov ecx, [eax]
  '0053DBFA: mov [ebp-000000C4h], ecx
  '0053DC00: mov edx, [ebp+08h]
  '0053DC03: push edx
  '0053DC04: lea eax, [ebp-34h]
  '0053DC07: push eax
  '0053DC08: call [004010F8h]
  '0053DC0E: push eax
  '0053DC0F: mov ecx, [ebp-000000C4h]
  '0053DC15: mov edx, [ecx]
  '0053DC17: mov eax, [ebp-000000C4h]
  '0053DC1D: push eax
  '0053DC1E: call [edx+10h]
  '0053DC21: fclex 
  '0053DC23: mov [ebp-000000C8h], eax
  '0053DC29: cmp [ebp-000000C8h], 00000000h
  '0053DC30: jnl 53DC55h
  '0053DC32: push 00000010h
  '0053DC34: push 0041D9D0h
  '0053DC39: mov ecx, [ebp-000000C4h]
  '0053DC3F: push ecx
  '0053DC40: mov edx, [ebp-000000C8h]
  '0053DC46: push edx
  '0053DC47: call [004010A0h]
  '0053DC4D: mov [ebp-00000120h], eax
  '0053DC53: jmp 53DC5Fh
  '0053DC55: mov [ebp-00000120h], 00000000h
  '0053DC5F: lea ecx, [ebp-34h]
  '0053DC62: call [004013B8h]
  '0053DC68: mov [ebp-10h], 00000000h
  '0053DC6F: wait 
  '0053DC70: push 0053DCB8h
  '0053DC75: jmp 53DCB7h
  '0053DC77: lea eax, [ebp-30h]
  '0053DC7A: push eax
  '0053DC7B: lea ecx, [ebp-2Ch]
  '0053DC7E: push ecx
  '0053DC7F: lea edx, [ebp-28h]
  '0053DC82: push edx
  '0053DC83: lea eax, [ebp-24h]
  '0053DC86: push eax
  '0053DC87: push 00000004h
  '0053DC89: call [004012E8h]
  '0053DC8F: add esp, 00000014h
  '0053DC92: lea ecx, [ebp-34h]
  '0053DC95: call [004013B8h]
  '0053DC9B: lea ecx, [ebp-74h]
  '0053DC9E: push ecx
  '0053DC9F: lea edx, [ebp-64h]
  '0053DCA2: push edx
  '0053DCA3: lea eax, [ebp-54h]
  '0053DCA6: push eax
  '0053DCA7: lea ecx, [ebp-44h]
  '0053DCAA: push ecx
  '0053DCAB: push 00000004h
  '0053DCAD: call [00401050h]
  '0053DCB3: add esp, 00000014h
  '0053DCB6: ret 
End Sub

