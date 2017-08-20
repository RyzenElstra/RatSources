VERSION 5.00
Begin VB.Form frmScript
  Caption = "MiniMo Settings"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  BorderStyle = 1 'Fixed Single
  'Icon = n/a
  LinkTopic = "Form1"
  MaxButton = 0   'False
  MinButton = 0   'False
  ControlBox = 0   'False
  Visible = 0   'False
  ClientLeft = 45
  ClientTop = 330
  ClientWidth = 5460
  ClientHeight = 2460
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
  Begin VB.Frame Frame2
    Left = 1960
    Top = 65456
    Width = 3495
    Height = 1815
    TabIndex = 5
    Begin VB.TextBox txtMessage
      Left = 60
      Top = 150
      Width = 3360
      Height = 1590
      TabIndex = 6
      MultiLine = -1  'True
      ScrollBars = 2
    End
  End
  Begin VB.Frame Frame1
    Left = 0
    Top = 65456
    Width = 1935
    Height = 1815
    TabIndex = 3
    Begin VB.PictureBox Picture1
      Picture = "frmScript.frx":0
      Left = 65
      Top = 150
      Width = 1800
      Height = 1590
      TabIndex = 4
      ScaleMode = 1
      'Unknown = 0   'False
    End
  End
  Begin VB.CheckBox chkAuthor
    Left = 120
    Top = 1800
    Width = 255
    Height = 255
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
  End
  Begin VB.CommandButton cmdContinue
    Caption = "OK"
    Left = 4680
    Top = 1800
    Width = 615
    Height = 495
    Enabled = 0   'False
    TabIndex = 0
  End
  Begin VB.Label Label1
    Caption = "I agree that the author of this script has provided it for educational purposes only and is not responsible for any damages it may cause."
    Left = 480
    Top = 1800
    Width = 4095
    Height = 615
    TabIndex = 2
  End
End

Attribute VB_Name = "frmScript"

Private Sub cmdContinue__49E110
  '0049E110: push ebp
  '0049E111: mov ebp, esp
  '0049E113: sub esp, 0000000Ch
  '0049E116: push 00403796h
  '0049E11B: mov eax, fs:[00h]
  '0049E121: push eax
  '0049E122: mov fs:[00000000h], esp
  '0049E129: sub esp, 00000018h
  '0049E12C: push ebx
  '0049E12D: push esi
  '0049E12E: push edi
  '0049E12F: mov [ebp-0Ch], esp
  '0049E132: mov [ebp-08h], 004036D0h
  '0049E139: mov edi, [ebp+08h]
  '0049E13C: mov eax, edi
  '0049E13E: and eax, 00000001h
  '0049E141: mov [ebp-04h], eax
  '0049E144: and edi, FFFFFFFEh
  '0049E147: push edi
  '0049E148: mov [ebp+08h], edi
  '0049E14B: mov ecx, [edi]
  '0049E14D: call [ecx+04h]
  '0049E150: mov eax, [4A0248h]
  '0049E155: xor ebx, ebx
  '0049E157: cmp eax, ebx
  '0049E159: mov [ebp-18h], ebx
  '0049E15C: jnz 49E16Eh
  '0049E15E: push 004A0248h
  '0049E163: push 004078F0h
  '0049E168: call [004012A8h]
  '0049E16E: mov esi, [004A0248h]
  '0049E174: push FFFFFFFFh
  '0049E176: push esi
  '0049E177: mov edx, [esi]
  '0049E179: call [edx+00000094h]
  '0049E17F: cmp eax, ebx
  '0049E181: fclex 
  '0049E183: jnl 49E197h
  '0049E185: push 00000094h
  '0049E18A: push 00410F84h
  '0049E18F: push esi
  '0049E190: push eax
  '0049E191: call [004010A8h]
  '0049E197: call [00401108h]
  '0049E19D: cmp [004A0F98h], ebx
  '0049E1A3: jnz 49E1B5h
  '0049E1A5: push 004A0F98h
  '0049E1AA: push 0040FFF4h
  '0049E1AF: call [004012A8h]
  '0049E1B5: mov esi, [004A0F98h]
  '0049E1BB: lea eax, [ebp-18h]
  '0049E1BE: push edi
  '0049E1BF: push eax
  '0049E1C0: mov edx, [esi]
  '0049E1C2: mov [ebp-2Ch], edx
  '0049E1C5: call [004010FCh]
  '0049E1CB: mov ecx, [ebp-2Ch]
  '0049E1CE: push eax
  '0049E1CF: push esi
  '0049E1D0: call [ecx+10h]
  '0049E1D3: cmp eax, ebx
  '0049E1D5: fclex 
  '0049E1D7: jnl 49E1E8h
  '0049E1D9: push 00000010h
  '0049E1DB: push 0040FFE4h
  '0049E1E0: push esi
  '0049E1E1: push eax
  '0049E1E2: call [004010A8h]
  '0049E1E8: lea ecx, [ebp-18h]
  '0049E1EB: call [00401388h]
  '0049E1F1: mov [ebp-04h], ebx
  '0049E1F4: push 0049E206h
  '0049E1F9: jmp 49E205h
  '0049E1FB: lea ecx, [ebp-18h]
  '0049E1FE: call [00401388h]
  '0049E204: ret 
End Sub
Private Sub Form__49E230
  '0049E230: push ebp
  '0049E231: mov ebp, esp
  '0049E233: sub esp, 0000000Ch
  '0049E236: push 00403796h
  '0049E23B: mov eax, fs:[00h]
  '0049E241: push eax
  '0049E242: mov fs:[00000000h], esp
  '0049E249: sub esp, 00000038h
  '0049E24C: push ebx
  '0049E24D: push esi
  '0049E24E: push edi
  '0049E24F: mov [ebp-0Ch], esp
  '0049E252: mov [ebp-08h], 004036E0h
  '0049E259: mov esi, [ebp+08h]
  '0049E25C: mov eax, esi
  '0049E25E: and eax, 00000001h
  '0049E261: mov [ebp-04h], eax
  '0049E264: and esi, FFFFFFFEh
  '0049E267: push esi
  '0049E268: mov [ebp+08h], esi
  '0049E26B: mov ecx, [esi]
  '0049E26D: call [ecx+04h]
  '0049E270: mov edx, [esi]
  '0049E272: lea eax, [ebp-1Ch]
  '0049E275: xor ebx, ebx
  '0049E277: push eax
  '0049E278: push esi
  '0049E279: mov [ebp-18h], ebx
  '0049E27C: mov [ebp-1Ch], ebx
  '0049E27F: mov [ebp-2Ch], ebx
  '0049E282: mov [ebp-30h], ebx
  '0049E285: mov [ebp-38h], ebx
  '0049E288: mov [ebp-3Ch], ebx
  '0049E28B: call [edx+00000218h]
  '0049E291: cmp eax, ebx
  '0049E293: fclex 
  '0049E295: jnl 49E2A9h
  '0049E297: push 00000218h
  '0049E29C: push 00416838h
  '0049E2A1: push esi
  '0049E2A2: push eax
  '0049E2A3: call [004010A8h]
  '0049E2A9: mov eax, [ebp-1Ch]
  '0049E2AC: lea ecx, [ebp-38h]
  '0049E2AF: push eax
  '0049E2B0: push ecx
  '0049E2B1: mov [ebp-1Ch], ebx
  '0049E2B4: call [004010F0h]
  '0049E2BA: push eax
  '0049E2BB: lea edx, [ebp-18h]
  '0049E2BE: lea eax, [ebp-3Ch]
  '0049E2C1: push edx
  '0049E2C2: push eax
  '0049E2C3: push 00413C30h
  '0049E2C8: call [004010D0h]
  '0049E2CE: mov esi, [00401270h]
  '0049E2D4: mov edi, [004012ECh]
  '0049E2DA: cmp eax, ebx
  '0049E2DC: jz 0049E3A3h
  '0049E2E2: mov ecx, [ebp-18h]
  '0049E2E5: push 00411B44h
  '0049E2EA: push ecx
  '0049E2EB: call esi
  '0049E2ED: mov edx, [ebp-18h]
  '0049E2F0: mov bx, ax
  '0049E2F3: neg bx
  '0049E2F6: sbb ebx, ebx
  '0049E2F8: push 004146C8h
  '0049E2FD: push edx
  '0049E2FE: inc ebx
  '0049E2FF: call esi
  '0049E301: neg ax
  '0049E304: sbb eax, eax
  '0049E306: push 00412E68h
  '0049E30B: inc eax
  '0049E30C: and ebx, eax
  '0049E30E: mov eax, [ebp-18h]
  '0049E311: neg ebx
  '0049E313: sbb ebx, ebx
  '0049E315: push eax
  '0049E316: neg ebx
  '0049E318: call esi
  '0049E31A: neg ax
  '0049E31D: mov ecx, [ebp-18h]
  '0049E320: push 00411948h
  '0049E325: sbb eax, eax
  '0049E327: push ecx
  '0049E328: inc eax
  '0049E329: and ebx, eax
  '0049E32B: neg ebx
  '0049E32D: sbb ebx, ebx
  '0049E32F: neg ebx
  '0049E331: call esi
  '0049E333: neg ax
  '0049E336: mov edx, [ebp-18h]
  '0049E339: push 0041FE30h
  '0049E33E: sbb eax, eax
  '0049E340: push edx
  '0049E341: inc eax
  '0049E342: and ebx, eax
  '0049E344: neg ebx
  '0049E346: sbb ebx, ebx
  '0049E348: neg ebx
  '0049E34A: call esi
  '0049E34C: neg ax
  '0049E34F: sbb eax, eax
  '0049E351: inc eax
  '0049E352: test ebx, eax
  '0049E354: jnz 49E389h
  '0049E356: mov eax, [ebp-18h]
  '0049E359: xor ebx, ebx
  '0049E35B: push ebx
  '0049E35C: push 004146D8h
  '0049E361: lea ecx, [ebp-2Ch]
  '0049E364: push eax
  '0049E365: push ecx
  '0049E366: call [0040132Ch]
  '0049E36C: add esp, 00000010h
  '0049E36F: push eax
  '0049E370: call edi
  '0049E372: lea edx, [ebp-30h]
  '0049E375: mov [ebp-30h], eax
  '0049E378: push edx
  '0049E379: call 00484740h
  '0049E37E: lea ecx, [ebp-2Ch]
  '0049E381: call [00401034h]
  '0049E387: jmp 49E38Bh
  '0049E389: xor ebx, ebx
  '0049E38B: lea eax, [ebp-18h]
  '0049E38E: lea ecx, [ebp-3Ch]
  '0049E391: push eax
  '0049E392: push ecx
  '0049E393: push 00413C30h
  '0049E398: call [00401140h]
  '0049E39E: jmp 0049E2DAh
  '0049E3A3: mov [ebp-04h], ebx
  '0049E3A6: push 0049E3DDh
  '0049E3AB: jmp 49E3C0h
  '0049E3AD: lea ecx, [ebp-1Ch]
  '0049E3B0: call [00401388h]
  '0049E3B6: lea ecx, [ebp-2Ch]
  '0049E3B9: call [00401034h]
  '0049E3BF: ret 
End Sub
Private Sub chkAuthor__49DFD0
  '0049DFD0: push ebp
  '0049DFD1: mov ebp, esp
  '0049DFD3: sub esp, 0000000Ch
  '0049DFD6: push 00403796h
  '0049DFDB: mov eax, fs:[00h]
  '0049DFE1: push eax
  '0049DFE2: mov fs:[00000000h], esp
  '0049DFE9: sub esp, 0000001Ch
  '0049DFEC: push ebx
  '0049DFED: push esi
  '0049DFEE: push edi
  '0049DFEF: mov [ebp-0Ch], esp
  '0049DFF2: mov [ebp-08h], 004036C0h
  '0049DFF9: mov esi, [ebp+08h]
  '0049DFFC: mov eax, esi
  '0049DFFE: and eax, 00000001h
  '0049E001: mov [ebp-04h], eax
  '0049E004: and esi, FFFFFFFEh
  '0049E007: push esi
  '0049E008: mov [ebp+08h], esi
  '0049E00B: mov ecx, [esi]
  '0049E00D: call [ecx+04h]
  '0049E010: mov edx, [esi]
  '0049E012: xor eax, eax
  '0049E014: push esi
  '0049E015: mov [ebp-18h], eax
  '0049E018: mov [ebp-1Ch], eax
  '0049E01B: call [edx+0000030Ch]
  '0049E021: mov ebx, [004010F0h]
  '0049E027: push eax
  '0049E028: lea eax, [ebp-18h]
  '0049E02B: push eax
  '0049E02C: call ebx
  '0049E02E: mov edi, eax
  '0049E030: lea edx, [ebp-1Ch]
  '0049E033: push edx
  '0049E034: push edi
  '0049E035: mov ecx, [edi]
  '0049E037: call [ecx+000000E0h]
  '0049E03D: test eax, eax
  '0049E03F: fclex 
  '0049E041: jnl 49E055h
  '0049E043: push 000000E0h
  '0049E048: push 00412E78h
  '0049E04D: push edi
  '0049E04E: push eax
  '0049E04F: call [004010A8h]
  '0049E055: xor eax, eax
  '0049E057: cmp word ptr [ebp-1Ch], 0001h
  '0049E05C: lea ecx, [ebp-18h]
  '0049E05F: setz al
  '0049E062: neg eax
  '0049E064: mov edi, eax
  '0049E066: call [00401388h]
  '0049E06C: mov ecx, [esi]
  '0049E06E: push esi
  '0049E06F: test di, di
  '0049E072: jz 49E096h
  '0049E074: call [ecx+00000310h]
  '0049E07A: lea edx, [ebp-18h]
  '0049E07D: push eax
  '0049E07E: push edx
  '0049E07F: call ebx
  '0049E081: mov esi, eax
  '0049E083: push FFFFFFFFh
  '0049E085: push esi
  '0049E086: mov eax, [esi]
  '0049E088: call [eax+0000008Ch]
  '0049E08E: test eax, eax
  '0049E090: fclex 
  '0049E092: jnl 49E0C8h
  '0049E094: jmp 49E0B6h
  '0049E096: call [ecx+00000310h]
  '0049E09C: lea edx, [ebp-18h]
  '0049E09F: push eax
  '0049E0A0: push edx
  '0049E0A1: call ebx
  '0049E0A3: mov esi, eax
  '0049E0A5: push 00000000h
  '0049E0A7: push esi
  '0049E0A8: mov eax, [esi]
  '0049E0AA: call [eax+0000008Ch]
  '0049E0B0: test eax, eax
  '0049E0B2: fclex 
  '0049E0B4: jnl 49E0C8h
  '0049E0B6: push 0000008Ch
  '0049E0BB: push 004146C8h
  '0049E0C0: push esi
  '0049E0C1: push eax
  '0049E0C2: call [004010A8h]
  '0049E0C8: lea ecx, [ebp-18h]
  '0049E0CB: call [00401388h]
  '0049E0D1: mov [ebp-04h], 00000000h
  '0049E0D8: push 0049E0EAh
  '0049E0DD: jmp 49E0E9h
  '0049E0DF: lea ecx, [ebp-18h]
  '0049E0E2: call [00401388h]
  '0049E0E8: ret 
End Sub

