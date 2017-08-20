VERSION 5.00
Begin VB.UserControl SysTray
  ScaleMode = 3
  Begin VB.PictureBox picIcon
    BackColor = &H0&
    ForeColor = &H80000008&
    Left = 1560
    Top = 600
    Width = 240
    Height = 240
    Visible = 0   'False
    TabIndex = 2
    ScaleMode = 3
  End
  Begin VB.PictureBox picText
    BackColor = &H0&
    ForeColor = &HFFFF&
    Left = 2640
    Top = 720
    Width = 240
    Height = 240
    Visible = 0   'False
    TabIndex = 1
    ScaleMode = 3
  End
  Begin MSComctlLib.ImageList imgListTray
  End
  Begin VB.CommandButton IMG
    Left = 0
    Top = 0
    Width = 480
    Height = 480
    TabIndex = 0
    Picture = "SysTray.frx":0
    Style = 1
  End
End

Attribute VB_Name = "SysTray"

Private Sub picText__52B4E0
  '0052B4E0: push ebp
  '0052B4E1: mov ebp, esp
  '0052B4E3: sub esp, 0000000Ch
  '0052B4E6: push 004081B6h
  '0052B4EB: mov eax, fs:[00h]
  '0052B4F1: push eax
  '0052B4F2: mov fs:[00000000h], esp
  '0052B4F9: sub esp, 0000000Ch
  '0052B4FC: push ebx
  '0052B4FD: push esi
  '0052B4FE: push edi
  '0052B4FF: mov [ebp-0Ch], esp
  '0052B502: mov [ebp-08h], 004076D8h
  '0052B509: mov esi, [ebp+08h]
  '0052B50C: mov eax, esi
  '0052B50E: and eax, 00000001h
  '0052B511: mov [ebp-04h], eax
  '0052B514: and esi, FFFFFFFEh
  '0052B517: push esi
  '0052B518: mov [ebp+08h], esi
  '0052B51B: mov ecx, [esi]
  '0052B51D: call [ecx+04h]
  '0052B520: mov edx, [ebp+14h]
  '0052B523: mov eax, [edx]
  '0052B525: cmp eax, 44008000h
  '0052B52A: jnz 52B537h
  '0052B52C: mov eax, [esi]
  '0052B52E: push esi
  '0052B52F: call [eax+00000810h]
  '0052B535: jmp 52B547h
  '0052B537: cmp eax, 44014000h
  '0052B53C: jnz 52B547h
  '0052B53E: mov ecx, [esi]
  '0052B540: push esi
  '0052B541: call [ecx+00000814h]
  '0052B547: mov [ebp-04h], 00000000h
  '0052B54E: mov eax, [ebp+08h]
  '0052B551: push eax
  '0052B552: mov edx, [eax]
  '0052B554: call [edx+08h]
  '0052B557: mov eax, [ebp-04h]
  '0052B55A: mov ecx, [ebp-14h]
  '0052B55D: pop edi
  '0052B55E: pop esi
  '0052B55F: mov fs:[00000000h], ecx
  '0052B566: pop ebx
  '0052B567: mov esp, ebp
  '0052B569: pop ebp
  '0052B56A: retn 0014h
End Sub
Private Sub UserControl__529C30
  '00529C30: push ebp
  '00529C31: mov ebp, esp
  '00529C33: sub esp, 0000000Ch
  '00529C36: push 004081B6h
  '00529C3B: mov eax, fs:[00h]
  '00529C41: push eax
  '00529C42: mov fs:[00000000h], esp
  '00529C49: sub esp, 0000000Ch
  '00529C4C: push ebx
  '00529C4D: push esi
  '00529C4E: push edi
  '00529C4F: mov [ebp-0Ch], esp
  '00529C52: mov [ebp-08h], 004075A0h
  '00529C59: mov esi, [ebp+08h]
  '00529C5C: mov eax, esi
  '00529C5E: and eax, 00000001h
  '00529C61: mov [ebp-04h], eax
  '00529C64: and esi, FFFFFFFEh
  '00529C67: push esi
  '00529C68: mov [ebp+08h], esi
  '00529C6B: mov ecx, [esi]
  '00529C6D: call [ecx+04h]
  '00529C70: mov edx, [esi]
  '00529C72: push 43F00000h
  '00529C77: push esi
  '00529C78: call [edx+00000084h]
  '00529C7E: test eax, eax
  '00529C80: fclex 
  '00529C82: jnl 529C96h
  '00529C84: push 00000084h
  '00529C89: push 00420FA0h
  '00529C8E: push esi
  '00529C8F: push eax
  '00529C90: call [004010A0h]
  '00529C96: mov eax, [esi]
  '00529C98: push 43F00000h
  '00529C9D: push esi
  '00529C9E: call [eax+0000008Ch]
  '00529CA4: test eax, eax
  '00529CA6: fclex 
  '00529CA8: jnl 529CBCh
  '00529CAA: push 0000008Ch
  '00529CAF: push 00420FA0h
  '00529CB4: push esi
  '00529CB5: push eax
  '00529CB6: call [004010A0h]
  '00529CBC: mov [ebp-04h], 00000000h
  '00529CC3: mov eax, [ebp+08h]
  '00529CC6: push eax
  '00529CC7: mov ecx, [eax]
  '00529CC9: call [ecx+08h]
  '00529CCC: mov eax, [ebp-04h]
  '00529CCF: mov ecx, [ebp-14h]
  '00529CD2: pop edi
  '00529CD3: pop esi
  '00529CD4: mov fs:[00000000h], ecx
  '00529CDB: pop ebx
  '00529CDC: mov esp, ebp
  '00529CDE: pop ebp
  '00529CDF: retn 0004h
End Sub
Private Sub UserControl__529CF0
  '00529CF0: push ebp
  '00529CF1: mov ebp, esp
  '00529CF3: sub esp, 0000000Ch
  '00529CF6: push 004081B6h
  '00529CFB: mov eax, fs:[00h]
  '00529D01: push eax
  '00529D02: mov fs:[00000000h], esp
  '00529D09: sub esp, 0000000Ch
  '00529D0C: push ebx
  '00529D0D: push esi
  '00529D0E: push edi
  '00529D0F: mov [ebp-0Ch], esp
  '00529D12: mov [ebp-08h], 004075A8h
  '00529D19: mov esi, [ebp+08h]
  '00529D1C: mov eax, esi
  '00529D1E: and eax, 00000001h
  '00529D21: mov [ebp-04h], eax
  '00529D24: and esi, FFFFFFFEh
  '00529D27: push esi
  '00529D28: mov [ebp+08h], esi
  '00529D2B: mov ecx, [esi]
  '00529D2D: call [ecx+04h]
  '00529D30: mov edx, [esi]
  '00529D32: lea eax, [ebp-18h]
  '00529D35: xor edi, edi
  '00529D37: push eax
  '00529D38: push esi
  '00529D39: mov [ebp-18h], edi
  '00529D3C: call [edx+00000828h]
  '00529D42: mov [ebp-04h], edi
  '00529D45: mov eax, [ebp+08h]
  '00529D48: push eax
  '00529D49: mov ecx, [eax]
  '00529D4B: call [ecx+08h]
  '00529D4E: mov eax, [ebp-04h]
  '00529D51: mov ecx, [ebp-14h]
  '00529D54: pop edi
  '00529D55: pop esi
  '00529D56: mov fs:[00000000h], ecx
  '00529D5D: pop ebx
  '00529D5E: mov esp, ebp
  '00529D60: pop ebp
  '00529D61: retn 0004h
End Sub
Private Sub UserControl__529D70
  '00529D70: push ebp
  '00529D71: mov ebp, esp
  '00529D73: sub esp, 0000000Ch
  '00529D76: push 004081B6h
  '00529D7B: mov eax, fs:[00h]
  '00529D81: push eax
  '00529D82: mov fs:[00000000h], esp
  '00529D89: sub esp, 00000094h
  '00529D8F: push ebx
  '00529D90: push esi
  '00529D91: push edi
  '00529D92: mov [ebp-0Ch], esp
  '00529D95: mov [ebp-08h], 004075B0h
  '00529D9C: mov esi, [ebp+08h]
  '00529D9F: mov eax, esi
  '00529DA1: and eax, 00000001h
  '00529DA4: mov [ebp-04h], eax
  '00529DA7: and esi, FFFFFFFEh
  '00529DAA: push esi
  '00529DAB: mov [ebp+08h], esi
  '00529DAE: mov ecx, [esi]
  '00529DB0: call [ecx+04h]
  '00529DB3: mov edi, [ebp+0Ch]
  '00529DB6: mov ebx, [esi+48h]
  '00529DB9: xor eax, eax
  '00529DBB: mov ecx, 00000008h
  '00529DC0: mov edx, [edi]
  '00529DC2: mov [ebp-54h], eax
  '00529DC5: mov [ebp-18h], eax
  '00529DC8: mov [ebp-1Ch], eax
  '00529DCB: mov [ebp-20h], eax
  '00529DCE: mov [ebp-24h], eax
  '00529DD1: mov [ebp-34h], eax
  '00529DD4: mov [ebp-44h], eax
  '00529DD7: mov [ebp-68h], eax
  '00529DDA: mov [ebp-6Ch], edx
  '00529DDD: mov [ebp-4Ch], ebx
  '00529DE0: mov [ebp-54h], ecx
  '00529DE3: mov edx, [edx]
  '00529DE5: mov ebx, [ebp-60h]
  '00529DE8: sub esp, 00000010h
  '00529DEB: mov [ebp-00000098h], edx
  '00529DF1: mov edx, esp
  '00529DF3: mov eax, 0041BC60h
  '00529DF8: sub esp, 00000010h
  '00529DFB: mov [edx], ecx
  '00529DFD: mov ecx, esp
  '00529DFF: push 0042B558h
  '00529E04: mov [edx+04h], ebx
  '00529E07: mov [edx+08h], eax
  '00529E0A: mov eax, [ebp-58h]
  '00529E0D: mov [edx+0Ch], eax
  '00529E10: mov edx, [ebp-54h]
  '00529E13: mov eax, [ebp-50h]
  '00529E16: mov [ecx], edx
  '00529E18: mov edx, [ebp-4Ch]
  '00529E1B: mov [ecx+04h], eax
  '00529E1E: mov eax, [ebp-48h]
  '00529E21: mov [ecx+08h], edx
  '00529E24: mov edx, [ebp-00000098h]
  '00529E2A: mov [ecx+0Ch], eax
  '00529E2D: mov ecx, [ebp-6Ch]
  '00529E30: push ecx
  '00529E31: call [edx+20h]
  '00529E34: test eax, eax
  '00529E36: fclex 
  '00529E38: jnl 529E4Ch
  '00529E3A: mov ecx, [ebp-6Ch]
  '00529E3D: push 00000020h
  '00529E3F: push 00427C64h
  '00529E44: push ecx
  '00529E45: push eax
  '00529E46: call [004010A0h]
  '00529E4C: mov edx, [esi+4Ch]
  '00529E4F: sub esp, 00000010h
  '00529E52: mov [ebp-4Ch], edx
  '00529E55: mov edx, esp
  '00529E57: mov ecx, 00000009h
  '00529E5C: mov [ebp-2Ch], 00000000h
  '00529E63: mov [ebp-34h], ecx
  '00529E66: mov [ebp-54h], ecx
  '00529E69: mov [edx], ecx
  '00529E6B: mov ecx, [ebp-30h]
  '00529E6E: sub esp, 00000010h
  '00529E71: mov eax, [edi]
  '00529E73: mov [edx+04h], ecx
  '00529E76: mov ecx, [ebp-2Ch]
  '00529E79: mov [ebp-6Ch], eax
  '00529E7C: mov eax, [eax]
  '00529E7E: mov [edx+08h], ecx
  '00529E81: mov ecx, [ebp-28h]
  '00529E84: mov [edx+0Ch], ecx
  '00529E87: mov ecx, [ebp-54h]
  '00529E8A: mov edx, esp
  '00529E8C: push 0042B56Ch
  '00529E91: mov [edx], ecx
  '00529E93: mov ecx, [ebp-50h]
  '00529E96: mov [edx+04h], ecx
  '00529E99: mov ecx, [ebp-4Ch]
  '00529E9C: mov [edx+08h], ecx
  '00529E9F: mov ecx, [ebp-48h]
  '00529EA2: mov [edx+0Ch], ecx
  '00529EA5: mov edx, [ebp-6Ch]
  '00529EA8: push edx
  '00529EA9: call [eax+20h]
  '00529EAC: test eax, eax
  '00529EAE: fclex 
  '00529EB0: jnl 529EC4h
  '00529EB2: mov ecx, [ebp-6Ch]
  '00529EB5: push 00000020h
  '00529EB7: push 00427C64h
  '00529EBC: push ecx
  '00529EBD: push eax
  '00529EBE: call [004010A0h]
  '00529EC4: lea ecx, [ebp-34h]
  '00529EC7: call [00401030h]
  '00529ECD: mov edx, [esi+50h]
  '00529ED0: sub esp, 00000010h
  '00529ED3: mov [ebp-4Ch], edx
  '00529ED6: mov edx, esp
  '00529ED8: mov eax, 00000008h
  '00529EDD: mov [ebp-5Ch], 0041BC60h
  '00529EE4: mov [edx], eax
  '00529EE6: mov [ebp-54h], eax
  '00529EE9: mov eax, [ebp-5Ch]
  '00529EEC: sub esp, 00000010h
  '00529EEF: mov [edx+04h], ebx
  '00529EF2: mov ecx, [edi]
  '00529EF4: mov [ebp-6Ch], ecx
  '00529EF7: mov [edx+08h], eax
  '00529EFA: mov eax, [ebp-58h]
  '00529EFD: mov ecx, [ecx]
  '00529EFF: mov [edx+0Ch], eax
  '00529F02: mov eax, [ebp-54h]
  '00529F05: mov edx, esp
  '00529F07: push 0042B584h
  '00529F0C: mov [edx], eax
  '00529F0E: mov eax, [ebp-50h]
  '00529F11: mov [edx+04h], eax
  '00529F14: mov eax, [ebp-4Ch]
  '00529F17: mov [edx+08h], eax
  '00529F1A: mov eax, [ebp-48h]
  '00529F1D: mov [edx+0Ch], eax
  '00529F20: mov edx, [ebp-6Ch]
  '00529F23: push edx
  '00529F24: call [ecx+20h]
  '00529F27: test eax, eax
  '00529F29: fclex 
  '00529F2B: jnl 529F3Fh
  '00529F2D: mov ecx, [ebp-6Ch]
  '00529F30: push 00000020h
  '00529F32: push 00427C64h
  '00529F37: push ecx
  '00529F38: push eax
  '00529F39: call [004010A0h]
  '00529F3F: mov eax, [edi]
  '00529F41: mov dx, [esi+54h]
  '00529F45: mov ecx, 0000000Bh
  '00529F4A: mov [ebp-4Ch], dx
  '00529F4E: mov [ebp-54h], ecx
  '00529F51: mov edx, [eax]
  '00529F53: sub esp, 00000010h
  '00529F56: mov [ebp-0000009Ch], edx
  '00529F5C: mov edx, esp
  '00529F5E: mov [ebp-6Ch], eax
  '00529F61: xor eax, eax
  '00529F63: sub esp, 00000010h
  '00529F66: mov [edx], ecx
  '00529F68: mov ecx, esp
  '00529F6A: push 0042B59Ch
  '00529F6F: mov [edx+04h], ebx
  '00529F72: mov [edx+08h], eax
  '00529F75: mov eax, [ebp-58h]
  '00529F78: mov [edx+0Ch], eax
  '00529F7B: mov edx, [ebp-54h]
  '00529F7E: mov eax, [ebp-50h]
  '00529F81: mov [ecx], edx
  '00529F83: mov edx, [ebp-4Ch]
  '00529F86: mov [ecx+04h], eax
  '00529F89: mov eax, [ebp-48h]
  '00529F8C: mov [ecx+08h], edx
  '00529F8F: mov edx, [ebp-0000009Ch]
  '00529F95: mov [ecx+0Ch], eax
  '00529F98: mov ecx, [ebp-6Ch]
  '00529F9B: push ecx
  '00529F9C: call [edx+20h]
  '00529F9F: test eax, eax
  '00529FA1: fclex 
  '00529FA3: jnl 529FB7h
  '00529FA5: mov ecx, [ebp-6Ch]
  '00529FA8: push 00000020h
  '00529FAA: push 00427C64h
  '00529FAF: push ecx
  '00529FB0: push eax
  '00529FB1: call [004010A0h]
  '00529FB7: lea ecx, [ebp-54h]
  '00529FBA: call [00401030h]
  '00529FC0: mov edx, [esi+44h]
  '00529FC3: sub esp, 00000010h
  '00529FC6: mov [ebp-4Ch], edx
  '00529FC9: mov edx, esp
  '00529FCB: mov eax, 00000002h
  '00529FD0: sub esp, 00000010h
  '00529FD3: mov [edx], eax
  '00529FD5: xor eax, eax
  '00529FD7: mov [ebp-54h], 00000003h
  '00529FDE: mov ecx, [edi]
  '00529FE0: mov [edx+04h], ebx
  '00529FE3: mov [ebp-6Ch], ecx
  '00529FE6: mov ecx, [ecx]
  '00529FE8: mov [edx+08h], eax
  '00529FEB: mov eax, [ebp-58h]
  '00529FEE: mov [edx+0Ch], eax
  '00529FF1: mov eax, [ebp-54h]
  '00529FF4: mov edx, esp
  '00529FF6: push 0042B5B8h
  '00529FFB: mov [edx], eax
  '00529FFD: mov eax, [ebp-50h]
  '0052A000: mov [edx+04h], eax
  '0052A003: mov eax, [ebp-4Ch]
  '0052A006: mov [edx+08h], eax
  '0052A009: mov eax, [ebp-48h]
  '0052A00C: mov [edx+0Ch], eax
  '0052A00F: mov edx, [ebp-6Ch]
  '0052A012: push edx
  '0052A013: call [ecx+20h]
  '0052A016: test eax, eax
  '0052A018: fclex 
  '0052A01A: jnl 52A02Eh
  '0052A01C: mov ecx, [ebp-6Ch]
  '0052A01F: push 00000020h
  '0052A021: push 00427C64h
  '0052A026: push ecx
  '0052A027: push eax
  '0052A028: call [004010A0h]
  '0052A02E: mov edx, [esi]
  '0052A030: push esi
  '0052A031: call [edx+000003ACh]
  '0052A037: push eax
  '0052A038: lea eax, [ebp-18h]
  '0052A03B: push eax
  '0052A03C: call [004010E4h]
  '0052A042: mov ecx, [eax]
  '0052A044: lea edx, [ebp-68h]
  '0052A047: push edx
  '0052A048: push eax
  '0052A049: mov [ebp-6Ch], eax
  '0052A04C: call [ecx+50h]
  '0052A04F: test eax, eax
  '0052A051: fclex 
  '0052A053: jnl 52A067h
  '0052A055: mov ecx, [ebp-6Ch]
  '0052A058: push 00000050h
  '0052A05A: push 0041C058h
  '0052A05F: push ecx
  '0052A060: push eax
  '0052A061: call [004010A0h]
  '0052A067: mov eax, [edi]
  '0052A069: mov edx, [ebp-68h]
  '0052A06C: mov ecx, 00000003h
  '0052A071: mov [ebp-4Ch], edx
  '0052A074: mov [ebp-54h], ecx
  '0052A077: mov edx, [eax]
  '0052A079: sub esp, 00000010h
  '0052A07C: mov [ebp-000000A0h], edx
  '0052A082: mov edx, esp
  '0052A084: mov [ebp-74h], eax
  '0052A087: xor eax, eax
  '0052A089: sub esp, 00000010h
  '0052A08C: mov [edx], ecx
  '0052A08E: mov ecx, esp
  '0052A090: push 00427C50h
  '0052A095: mov [edx+04h], ebx
  '0052A098: mov [edx+08h], eax
  '0052A09B: mov eax, [ebp-58h]
  '0052A09E: mov [edx+0Ch], eax
  '0052A0A1: mov edx, [ebp-54h]
  '0052A0A4: mov eax, [ebp-50h]
  '0052A0A7: mov [ecx], edx
  '0052A0A9: mov edx, [ebp-4Ch]
  '0052A0AC: mov [ecx+04h], eax
  '0052A0AF: mov eax, [ebp-48h]
  '0052A0B2: mov [ecx+08h], edx
  '0052A0B5: mov edx, [ebp-000000A0h]
  '0052A0BB: mov [ecx+0Ch], eax
  '0052A0BE: mov ecx, [ebp-74h]
  '0052A0C1: push ecx
  '0052A0C2: call [edx+20h]
  '0052A0C5: test eax, eax
  '0052A0C7: fclex 
  '0052A0C9: jnl 52A0DDh
  '0052A0CB: mov ecx, [ebp-74h]
  '0052A0CE: push 00000020h
  '0052A0D0: push 00427C64h
  '0052A0D5: push ecx
  '0052A0D6: push eax
  '0052A0D7: call [004010A0h]
  '0052A0DD: lea ecx, [ebp-18h]
  '0052A0E0: call [004013B8h]
  '0052A0E6: mov edx, [esi]
  '0052A0E8: push esi
  '0052A0E9: call [edx+000003ACh]
  '0052A0EF: push eax
  '0052A0F0: lea eax, [ebp-18h]
  '0052A0F3: push eax
  '0052A0F4: call [004010E4h]
  '0052A0FA: mov ecx, [eax]
  '0052A0FC: lea edx, [ebp-68h]
  '0052A0FF: push edx
  '0052A100: push eax
  '0052A101: mov [ebp-6Ch], eax
  '0052A104: call [ecx+68h]
  '0052A107: test eax, eax
  '0052A109: fclex 
  '0052A10B: jnl 52A11Fh
  '0052A10D: mov ecx, [ebp-6Ch]
  '0052A110: push 00000068h
  '0052A112: push 0041C058h
  '0052A117: push ecx
  '0052A118: push eax
  '0052A119: call [004010A0h]
  '0052A11F: mov edx, [ebp-68h]
  '0052A122: sub esp, 00000010h
  '0052A125: mov [ebp-4Ch], edx
  '0052A128: mov edx, esp
  '0052A12A: mov eax, 00000003h
  '0052A12F: sub esp, 00000010h
  '0052A132: mov [edx], eax
  '0052A134: mov [ebp-54h], eax
  '0052A137: mov eax, 0000FFFFh
  '0052A13C: mov ecx, [edi]
  '0052A13E: mov [edx+04h], ebx
  '0052A141: mov [ebp-74h], ecx
  '0052A144: mov ecx, [ecx]
  '0052A146: mov [edx+08h], eax
  '0052A149: mov eax, [ebp-58h]
  '0052A14C: mov [edx+0Ch], eax
  '0052A14F: mov eax, [ebp-54h]
  '0052A152: mov edx, esp
  '0052A154: push 00427C78h
  '0052A159: mov [edx], eax
  '0052A15B: mov eax, [ebp-50h]
  '0052A15E: mov [edx+04h], eax
  '0052A161: mov eax, [ebp-4Ch]
  '0052A164: mov [edx+08h], eax
  '0052A167: mov eax, [ebp-48h]
  '0052A16A: mov [edx+0Ch], eax
  '0052A16D: mov edx, [ebp-74h]
  '0052A170: push edx
  '0052A171: call [ecx+20h]
  '0052A174: test eax, eax
  '0052A176: fclex 
  '0052A178: jnl 52A18Ch
  '0052A17A: mov ecx, [ebp-74h]
  '0052A17D: push 00000020h
  '0052A17F: push 00427C64h
  '0052A184: push ecx
  '0052A185: push eax
  '0052A186: call [004010A0h]
  '0052A18C: lea ecx, [ebp-18h]
  '0052A18F: call [004013B8h]
  '0052A195: mov edx, [esi+40h]
  '0052A198: sub esp, 00000010h
  '0052A19B: mov [ebp-4Ch], edx
  '0052A19E: mov edx, esp
  '0052A1A0: mov eax, 00000002h
  '0052A1A5: sub esp, 00000010h
  '0052A1A8: mov [edx], eax
  '0052A1AA: xor eax, eax
  '0052A1AC: mov [ebp-54h], 00000003h
  '0052A1B3: mov ecx, [edi]
  '0052A1B5: mov [edx+04h], ebx
  '0052A1B8: mov [ebp-6Ch], ecx
  '0052A1BB: mov ecx, [ecx]
  '0052A1BD: mov [edx+08h], eax
  '0052A1C0: mov eax, [ebp-58h]
  '0052A1C3: mov [edx+0Ch], eax
  '0052A1C6: mov eax, [ebp-54h]
  '0052A1C9: mov edx, esp
  '0052A1CB: push 0042B5D0h
  '0052A1D0: mov [edx], eax
  '0052A1D2: mov eax, [ebp-50h]
  '0052A1D5: mov [edx+04h], eax
  '0052A1D8: mov eax, [ebp-4Ch]
  '0052A1DB: mov [edx+08h], eax
  '0052A1DE: mov eax, [ebp-48h]
  '0052A1E1: mov [edx+0Ch], eax
  '0052A1E4: mov edx, [ebp-6Ch]
  '0052A1E7: push edx
  '0052A1E8: call [ecx+20h]
  '0052A1EB: test eax, eax
  '0052A1ED: fclex 
  '0052A1EF: jnl 52A203h
  '0052A1F1: mov ecx, [ebp-6Ch]
  '0052A1F4: push 00000020h
  '0052A1F6: push 00427C64h
  '0052A1FB: push ecx
  '0052A1FC: push eax
  '0052A1FD: call [004010A0h]
  '0052A203: mov eax, [edi]
  '0052A205: mov dx, [esi+3Ch]
  '0052A209: mov ecx, 00000002h
  '0052A20E: mov [ebp-4Ch], dx
  '0052A212: mov [ebp-54h], ecx
  '0052A215: mov edx, [eax]
  '0052A217: sub esp, 00000010h
  '0052A21A: mov [ebp-000000A4h], edx
  '0052A220: mov edx, esp
  '0052A222: mov [ebp-6Ch], eax
  '0052A225: xor eax, eax
  '0052A227: sub esp, 00000010h
  '0052A22A: mov [edx], ecx
  '0052A22C: mov ecx, esp
  '0052A22E: push 0042B5F0h
  '0052A233: mov [edx+04h], ebx
  '0052A236: mov [edx+08h], eax
  '0052A239: mov eax, [ebp-58h]
  '0052A23C: mov [edx+0Ch], eax
  '0052A23F: mov edx, [ebp-54h]
  '0052A242: mov eax, [ebp-50h]
  '0052A245: mov [ecx], edx
  '0052A247: mov edx, [ebp-4Ch]
  '0052A24A: mov [ecx+04h], eax
  '0052A24D: mov eax, [ebp-48h]
  '0052A250: mov [ecx+08h], edx
  '0052A253: mov edx, [ebp-000000A4h]
  '0052A259: mov [ecx+0Ch], eax
  '0052A25C: mov ecx, [ebp-6Ch]
  '0052A25F: push ecx
  '0052A260: call [edx+20h]
  '0052A263: test eax, eax
  '0052A265: fclex 
  '0052A267: jnl 52A27Bh
  '0052A269: mov ecx, [ebp-6Ch]
  '0052A26C: push 00000020h
  '0052A26E: push 00427C64h
  '0052A273: push ecx
  '0052A274: push eax
  '0052A275: call [004010A0h]
  '0052A27B: mov eax, [edi]
  '0052A27D: mov dx, [esi+3Eh]
  '0052A281: mov ecx, 00000002h
  '0052A286: mov [ebp-4Ch], dx
  '0052A28A: mov [ebp-54h], ecx
  '0052A28D: mov edx, [eax]
  '0052A28F: sub esp, 00000010h
  '0052A292: mov [ebp-000000A8h], edx
  '0052A298: mov edx, esp
  '0052A29A: mov [ebp-6Ch], eax
  '0052A29D: xor eax, eax
  '0052A29F: sub esp, 00000010h
  '0052A2A2: mov [edx], ecx
  '0052A2A4: mov ecx, esp
  '0052A2A6: push 0042B600h
  '0052A2AB: mov [edx+04h], ebx
  '0052A2AE: mov ebx, [ebp-6Ch]
  '0052A2B1: push ebx
  '0052A2B2: mov [edx+08h], eax
  '0052A2B5: mov eax, [ebp-58h]
  '0052A2B8: mov [edx+0Ch], eax
  '0052A2BB: mov edx, [ebp-54h]
  '0052A2BE: mov eax, [ebp-50h]
  '0052A2C1: mov [ecx], edx
  '0052A2C3: mov edx, [ebp-4Ch]
  '0052A2C6: mov [ecx+04h], eax
  '0052A2C9: mov eax, [ebp-48h]
  '0052A2CC: mov [ecx+08h], edx
  '0052A2CF: mov [ecx+0Ch], eax
  '0052A2D2: mov ecx, [ebp-000000A8h]
  '0052A2D8: call [ecx+20h]
  '0052A2DB: test eax, eax
  '0052A2DD: fclex 
  '0052A2DF: jnl 52A2F0h
  '0052A2E1: push 00000020h
  '0052A2E3: push 00427C64h
  '0052A2E8: push ebx
  '0052A2E9: push eax
  '0052A2EA: call [004010A0h]
  '0052A2F0: mov edx, [esi]
  '0052A2F2: push esi
  '0052A2F3: call [edx+000003ACh]
  '0052A2F9: push eax
  '0052A2FA: lea eax, [ebp-18h]
  '0052A2FD: push eax
  '0052A2FE: call [004010E4h]
  '0052A304: mov ebx, eax
  '0052A306: lea edx, [ebp-1Ch]
  '0052A309: push edx
  '0052A30A: push ebx
  '0052A30B: mov ecx, [ebx]
  '0052A30D: call [ecx+00000210h]
  '0052A313: test eax, eax
  '0052A315: fclex 
  '0052A317: jnl 52A32Bh
  '0052A319: push 00000210h
  '0052A31E: push 0041C058h
  '0052A323: push ebx
  '0052A324: push eax
  '0052A325: call [004010A0h]
  '0052A32B: mov eax, [esi]
  '0052A32D: mov edi, [edi]
  '0052A32F: lea ecx, [ebp-20h]
  '0052A332: push ecx
  '0052A333: push esi
  '0052A334: call [eax+000002B0h]
  '0052A33A: xor ebx, ebx
  '0052A33C: cmp eax, ebx
  '0052A33E: fclex 
  '0052A340: jnl 52A354h
  '0052A342: push 000002B0h
  '0052A347: push 00420FA0h
  '0052A34C: push esi
  '0052A34D: push eax
  '0052A34E: call [004010A0h]
  '0052A354: mov eax, [ebp-20h]
  '0052A357: lea ecx, [ebp-24h]
  '0052A35A: push ecx
  '0052A35B: push eax
  '0052A35C: mov edx, [eax]
  '0052A35E: mov esi, eax
  '0052A360: call [edx+24h]
  '0052A363: cmp eax, ebx
  '0052A365: fclex 
  '0052A367: jnl 52A378h
  '0052A369: push 00000024h
  '0052A36B: push 00427BDCh
  '0052A370: push esi
  '0052A371: push eax
  '0052A372: call [004010A0h]
  '0052A378: mov eax, [ebp-24h]
  '0052A37B: mov edx, [ebp-1Ch]
  '0052A37E: sub esp, 00000010h
  '0052A381: mov [ebp-24h], ebx
  '0052A384: mov [ebp-1Ch], ebx
  '0052A387: mov ebx, esp
  '0052A389: mov ecx, 00000009h
  '0052A38E: mov [ebp-3Ch], eax
  '0052A391: mov [ebp-44h], ecx
  '0052A394: mov [ebp-34h], ecx
  '0052A397: mov [ebx], ecx
  '0052A399: mov ecx, [ebp-40h]
  '0052A39C: sub esp, 00000010h
  '0052A39F: mov [ebp-2Ch], edx
  '0052A3A2: mov [ebx+04h], ecx
  '0052A3A5: mov ecx, esp
  '0052A3A7: mov esi, [edi]
  '0052A3A9: push 00427DC4h
  '0052A3AE: mov [ebx+08h], eax
  '0052A3B1: mov eax, [ebp-38h]
  '0052A3B4: push edi
  '0052A3B5: mov [ebx+0Ch], eax
  '0052A3B8: mov eax, [ebp-34h]
  '0052A3BB: mov [ecx], eax
  '0052A3BD: mov eax, [ebp-30h]
  '0052A3C0: mov [ecx+04h], eax
  '0052A3C3: mov [ecx+08h], edx
  '0052A3C6: mov edx, [ebp-28h]
  '0052A3C9: mov [ecx+0Ch], edx
  '0052A3CC: call [esi+20h]
  '0052A3CF: test eax, eax
  '0052A3D1: fclex 
  '0052A3D3: jnl 52A3E4h
  '0052A3D5: push 00000020h
  '0052A3D7: push 00427C64h
  '0052A3DC: push edi
  '0052A3DD: push eax
  '0052A3DE: call [004010A0h]
  '0052A3E4: lea eax, [ebp-20h]
  '0052A3E7: lea ecx, [ebp-18h]
  '0052A3EA: push eax
  '0052A3EB: push ecx
  '0052A3EC: push 00000002h
  '0052A3EE: call [00401064h]
  '0052A3F4: lea edx, [ebp-44h]
  '0052A3F7: lea eax, [ebp-34h]
  '0052A3FA: push edx
  '0052A3FB: push eax
  '0052A3FC: push 00000002h
  '0052A3FE: call [00401050h]
  '0052A404: add esp, 00000018h
  '0052A407: mov [ebp-04h], 00000000h
  '0052A40E: push 0052A442h
  '0052A413: jmp 52A441h
  '0052A415: lea ecx, [ebp-24h]
  '0052A418: lea edx, [ebp-20h]
  '0052A41B: push ecx
  '0052A41C: lea eax, [ebp-1Ch]
  '0052A41F: push edx
  '0052A420: lea ecx, [ebp-18h]
  '0052A423: push eax
  '0052A424: push ecx
  '0052A425: push 00000004h
  '0052A427: call [00401064h]
  '0052A42D: lea edx, [ebp-44h]
  '0052A430: lea eax, [ebp-34h]
  '0052A433: push edx
  '0052A434: push eax
  '0052A435: push 00000002h
  '0052A437: call [00401050h]
  '0052A43D: add esp, 00000020h
  '0052A440: ret 
End Sub
Private Sub UserControl__5295D0
  '005295D0: push ebp
  '005295D1: mov ebp, esp
  '005295D3: sub esp, 0000000Ch
  '005295D6: push 004081B6h
  '005295DB: mov eax, fs:[00h]
  '005295E1: push eax
  '005295E2: mov fs:[00000000h], esp
  '005295E9: sub esp, 00000074h
  '005295EC: push ebx
  '005295ED: push esi
  '005295EE: push edi
  '005295EF: mov [ebp-0Ch], esp
  '005295F2: mov [ebp-08h], 00407590h
  '005295F9: mov esi, [ebp+08h]
  '005295FC: mov eax, esi
  '005295FE: and eax, 00000001h
  '00529601: mov [ebp-04h], eax
  '00529604: and esi, FFFFFFFEh
  '00529607: push esi
  '00529608: mov [ebp+08h], esi
  '0052960B: mov ecx, [esi]
  '0052960D: call [ecx+04h]
  '00529610: lea ecx, [ebp-38h]
  '00529613: mov edi, [ebp+0Ch]
  '00529616: push ecx
  '00529617: xor eax, eax
  '00529619: sub esp, 00000010h
  '0052961C: mov ebx, [edi]
  '0052961E: mov [ebp-18h], eax
  '00529621: mov [ebp-1Ch], eax
  '00529624: mov [ebp-20h], eax
  '00529627: mov [ebp-24h], eax
  '0052962A: mov [ebp-28h], eax
  '0052962D: mov [ebp-38h], eax
  '00529630: mov [ebp-48h], eax
  '00529633: mov ecx, esp
  '00529635: mov eax, 00000008h
  '0052963A: mov edx, [ebx]
  '0052963C: mov [ecx], eax
  '0052963E: mov eax, [ebp-54h]
  '00529641: push 0042B558h
  '00529646: push ebx
  '00529647: mov [ecx+04h], eax
  '0052964A: mov eax, 0041BC60h
  '0052964F: mov [ecx+08h], eax
  '00529652: mov eax, [ebp-4Ch]
  '00529655: mov [ecx+0Ch], eax
  '00529658: call [edx+1Ch]
  '0052965B: test eax, eax
  '0052965D: fclex 
  '0052965F: jnl 529670h
  '00529661: push 0000001Ch
  '00529663: push 00427C64h
  '00529668: push ebx
  '00529669: push eax
  '0052966A: call [004010A0h]
  '00529670: lea ecx, [ebp-38h]
  '00529673: push ecx
  '00529674: call [0040103Ch]
  '0052967A: mov edx, eax
  '0052967C: lea ecx, [ebp-18h]
  '0052967F: call [00401378h]
  '00529685: mov edx, eax
  '00529687: lea ecx, [esi+48h]
  '0052968A: call [004012D8h]
  '00529690: lea ecx, [ebp-18h]
  '00529693: call [004013B4h]
  '00529699: lea ecx, [ebp-38h]
  '0052969C: call [00401030h]
  '005296A2: lea ecx, [ebp-48h]
  '005296A5: mov ebx, [edi]
  '005296A7: push ecx
  '005296A8: mov eax, 00000009h
  '005296AD: sub esp, 00000010h
  '005296B0: mov [ebp-38h], eax
  '005296B3: mov ecx, esp
  '005296B5: mov [ebp-30h], 00000000h
  '005296BC: mov edx, [ebx]
  '005296BE: push 0042B56Ch
  '005296C3: mov [ecx], eax
  '005296C5: mov eax, [ebp-34h]
  '005296C8: push ebx
  '005296C9: mov [ecx+04h], eax
  '005296CC: mov eax, [ebp-30h]
  '005296CF: mov [ecx+08h], eax
  '005296D2: mov eax, [ebp-2Ch]
  '005296D5: mov [ecx+0Ch], eax
  '005296D8: call [edx+1Ch]
  '005296DB: test eax, eax
  '005296DD: fclex 
  '005296DF: jnl 5296F0h
  '005296E1: push 0000001Ch
  '005296E3: push 00427C64h
  '005296E8: push ebx
  '005296E9: push eax
  '005296EA: call [004010A0h]
  '005296F0: lea ecx, [ebp-48h]
  '005296F3: push 004210C8h
  '005296F8: push ecx
  '005296F9: call [004011C8h]
  '005296FF: lea edx, [ebp-1Ch]
  '00529702: push eax
  '00529703: push edx
  '00529704: call [004010E4h]
  '0052970A: push eax
  '0052970B: lea eax, [esi+4Ch]
  '0052970E: push eax
  '0052970F: call [004010F8h]
  '00529715: lea ecx, [ebp-1Ch]
  '00529718: call [004013B8h]
  '0052971E: lea ecx, [ebp-48h]
  '00529721: lea edx, [ebp-38h]
  '00529724: push ecx
  '00529725: push edx
  '00529726: push 00000002h
  '00529728: call [00401050h]
  '0052972E: add esp, 0000000Ch
  '00529731: lea edx, [ebp-38h]
  '00529734: mov ebx, [edi]
  '00529736: mov eax, 00000008h
  '0052973B: push edx
  '0052973C: mov [ebp-50h], 0041BC60h
  '00529743: sub esp, 00000010h
  '00529746: mov ecx, [ebx]
  '00529748: mov edx, esp
  '0052974A: push 0042B584h
  '0052974F: push ebx
  '00529750: mov [edx], eax
  '00529752: mov eax, [ebp-54h]
  '00529755: mov [edx+04h], eax
  '00529758: mov eax, [ebp-50h]
  '0052975B: mov [edx+08h], eax
  '0052975E: mov eax, [ebp-4Ch]
  '00529761: mov [edx+0Ch], eax
  '00529764: call [ecx+1Ch]
  '00529767: test eax, eax
  '00529769: fclex 
  '0052976B: jnl 52977Ch
  '0052976D: push 0000001Ch
  '0052976F: push 00427C64h
  '00529774: push ebx
  '00529775: push eax
  '00529776: call [004010A0h]
  '0052977C: lea ecx, [ebp-38h]
  '0052977F: push ecx
  '00529780: call [0040103Ch]
  '00529786: mov edx, eax
  '00529788: lea ecx, [ebp-18h]
  '0052978B: call [00401378h]
  '00529791: mov edx, eax
  '00529793: lea ecx, [esi+50h]
  '00529796: call [004012D8h]
  '0052979C: lea ecx, [ebp-18h]
  '0052979F: call [004013B4h]
  '005297A5: lea ecx, [ebp-38h]
  '005297A8: call [00401030h]
  '005297AE: lea ecx, [ebp-38h]
  '005297B1: mov ebx, [edi]
  '005297B3: push ecx
  '005297B4: mov eax, 0000000Bh
  '005297B9: sub esp, 00000010h
  '005297BC: mov edx, [ebx]
  '005297BE: mov ecx, esp
  '005297C0: push 0042B59Ch
  '005297C5: push ebx
  '005297C6: mov [ecx], eax
  '005297C8: mov eax, [ebp-54h]
  '005297CB: mov [ecx+04h], eax
  '005297CE: xor eax, eax
  '005297D0: mov [ecx+08h], eax
  '005297D3: mov eax, [ebp-4Ch]
  '005297D6: mov [ecx+0Ch], eax
  '005297D9: call [edx+1Ch]
  '005297DC: test eax, eax
  '005297DE: fclex 
  '005297E0: jnl 5297F1h
  '005297E2: push 0000001Ch
  '005297E4: push 00427C64h
  '005297E9: push ebx
  '005297EA: push eax
  '005297EB: call [004010A0h]
  '005297F1: lea ecx, [ebp-38h]
  '005297F4: push ecx
  '005297F5: call [00401114h]
  '005297FB: lea ecx, [ebp-38h]
  '005297FE: mov [esi+54h], ax
  '00529802: call [00401030h]
  '00529808: lea ecx, [ebp-38h]
  '0052980B: mov ebx, [edi]
  '0052980D: push ecx
  '0052980E: mov eax, 00000002h
  '00529813: sub esp, 00000010h
  '00529816: mov edx, [ebx]
  '00529818: mov ecx, esp
  '0052981A: push 0042B5B8h
  '0052981F: push ebx
  '00529820: mov [ecx], eax
  '00529822: mov eax, [ebp-54h]
  '00529825: mov [ecx+04h], eax
  '00529828: xor eax, eax
  '0052982A: mov [ecx+08h], eax
  '0052982D: mov eax, [ebp-4Ch]
  '00529830: mov [ecx+0Ch], eax
  '00529833: call [edx+1Ch]
  '00529836: test eax, eax
  '00529838: fclex 
  '0052983A: jnl 52984Bh
  '0052983C: push 0000001Ch
  '0052983E: push 00427C64h
  '00529843: push ebx
  '00529844: push eax
  '00529845: call [004010A0h]
  '0052984B: lea ecx, [ebp-38h]
  '0052984E: push ecx
  '0052984F: call [0040130Ch]
  '00529855: lea ecx, [ebp-38h]
  '00529858: mov [esi+44h], eax
  '0052985B: call [00401030h]
  '00529861: mov edx, [esi]
  '00529863: push esi
  '00529864: call [edx+000003ACh]
  '0052986A: push eax
  '0052986B: lea eax, [ebp-1Ch]
  '0052986E: push eax
  '0052986F: call [004010E4h]
  '00529875: lea edx, [ebp-38h]
  '00529878: mov ebx, [edi]
  '0052987A: push edx
  '0052987B: mov [ebp-64h], eax
  '0052987E: sub esp, 00000010h
  '00529881: mov eax, 00000003h
  '00529886: mov edx, esp
  '00529888: mov ecx, [ebx]
  '0052988A: push 00427C50h
  '0052988F: push ebx
  '00529890: mov [edx], eax
  '00529892: mov eax, [ebp-54h]
  '00529895: mov [edx+04h], eax
  '00529898: xor eax, eax
  '0052989A: mov [edx+08h], eax
  '0052989D: mov eax, [ebp-4Ch]
  '005298A0: mov [edx+0Ch], eax
  '005298A3: call [ecx+1Ch]
  '005298A6: test eax, eax
  '005298A8: fclex 
  '005298AA: jnl 5298BBh
  '005298AC: push 0000001Ch
  '005298AE: push 00427C64h
  '005298B3: push ebx
  '005298B4: push eax
  '005298B5: call [004010A0h]
  '005298BB: mov ecx, [ebp-64h]
  '005298BE: lea edx, [ebp-38h]
  '005298C1: push edx
  '005298C2: mov ebx, [ecx]
  '005298C4: call [0040130Ch]
  '005298CA: mov [ebp-00000084h], ebx
  '005298D0: mov ebx, [ebp-64h]
  '005298D3: push eax
  '005298D4: mov eax, [ebp-00000084h]
  '005298DA: push ebx
  '005298DB: call [eax+54h]
  '005298DE: test eax, eax
  '005298E0: fclex 
  '005298E2: jnl 5298F3h
  '005298E4: push 00000054h
  '005298E6: push 0041C058h
  '005298EB: push ebx
  '005298EC: push eax
  '005298ED: call [004010A0h]
  '005298F3: lea ecx, [ebp-1Ch]
  '005298F6: call [004013B8h]
  '005298FC: lea ecx, [ebp-38h]
  '005298FF: call [00401030h]
  '00529905: mov ecx, [esi]
  '00529907: push esi
  '00529908: call [ecx+000003ACh]
  '0052990E: lea edx, [ebp-1Ch]
  '00529911: push eax
  '00529912: push edx
  '00529913: call [004010E4h]
  '00529919: lea edx, [ebp-38h]
  '0052991C: mov ebx, [edi]
  '0052991E: push edx
  '0052991F: mov [ebp-64h], eax
  '00529922: sub esp, 00000010h
  '00529925: mov eax, 00000003h
  '0052992A: mov edx, esp
  '0052992C: mov ecx, [ebx]
  '0052992E: push 00427C78h
  '00529933: push ebx
  '00529934: mov [edx], eax
  '00529936: mov eax, [ebp-54h]
  '00529939: mov [edx+04h], eax
  '0052993C: mov eax, 0000FFFFh
  '00529941: mov [edx+08h], eax
  '00529944: mov eax, [ebp-4Ch]
  '00529947: mov [edx+0Ch], eax
  '0052994A: call [ecx+1Ch]
  '0052994D: test eax, eax
  '0052994F: fclex 
  '00529951: jnl 529962h
  '00529953: push 0000001Ch
  '00529955: push 00427C64h
  '0052995A: push ebx
  '0052995B: push eax
  '0052995C: call [004010A0h]
  '00529962: mov ecx, [ebp-64h]
  '00529965: lea edx, [ebp-38h]
  '00529968: push edx
  '00529969: mov ebx, [ecx]
  '0052996B: call [0040130Ch]
  '00529971: mov [ebp-00000088h], ebx
  '00529977: mov ebx, [ebp-64h]
  '0052997A: push eax
  '0052997B: mov eax, [ebp-00000088h]
  '00529981: push ebx
  '00529982: call [eax+6Ch]
  '00529985: test eax, eax
  '00529987: fclex 
  '00529989: jnl 52999Ah
  '0052998B: push 0000006Ch
  '0052998D: push 0041C058h
  '00529992: push ebx
  '00529993: push eax
  '00529994: call [004010A0h]
  '0052999A: lea ecx, [ebp-1Ch]
  '0052999D: call [004013B8h]
  '005299A3: lea ecx, [ebp-38h]
  '005299A6: call [00401030h]
  '005299AC: lea edx, [ebp-38h]
  '005299AF: mov ebx, [edi]
  '005299B1: push edx
  '005299B2: mov eax, 00000002h
  '005299B7: sub esp, 00000010h
  '005299BA: mov ecx, [ebx]
  '005299BC: mov edx, esp
  '005299BE: push 0042B5D0h
  '005299C3: push ebx
  '005299C4: mov [edx], eax
  '005299C6: mov eax, [ebp-54h]
  '005299C9: mov [edx+04h], eax
  '005299CC: xor eax, eax
  '005299CE: mov [edx+08h], eax
  '005299D1: mov eax, [ebp-4Ch]
  '005299D4: mov [edx+0Ch], eax
  '005299D7: call [ecx+1Ch]
  '005299DA: test eax, eax
  '005299DC: fclex 
  '005299DE: jnl 5299EFh
  '005299E0: push 0000001Ch
  '005299E2: push 00427C64h
  '005299E7: push ebx
  '005299E8: push eax
  '005299E9: call [004010A0h]
  '005299EF: lea ecx, [ebp-38h]
  '005299F2: push ecx
  '005299F3: call [0040130Ch]
  '005299F9: lea ecx, [ebp-38h]
  '005299FC: mov [esi+40h], eax
  '005299FF: call [00401030h]
  '00529A05: lea ecx, [ebp-38h]
  '00529A08: mov ebx, [edi]
  '00529A0A: push ecx
  '00529A0B: mov eax, 00000002h
  '00529A10: sub esp, 00000010h
  '00529A13: mov edx, [ebx]
  '00529A15: mov ecx, esp
  '00529A17: push 0042B5F0h
  '00529A1C: push ebx
  '00529A1D: mov [ecx], eax
  '00529A1F: mov eax, [ebp-54h]
  '00529A22: mov [ecx+04h], eax
  '00529A25: xor eax, eax
  '00529A27: mov [ecx+08h], eax
  '00529A2A: mov eax, [ebp-4Ch]
  '00529A2D: mov [ecx+0Ch], eax
  '00529A30: call [edx+1Ch]
  '00529A33: test eax, eax
  '00529A35: fclex 
  '00529A37: jnl 529A48h
  '00529A39: push 0000001Ch
  '00529A3B: push 00427C64h
  '00529A40: push ebx
  '00529A41: push eax
  '00529A42: call [004010A0h]
  '00529A48: lea ecx, [ebp-38h]
  '00529A4B: push ecx
  '00529A4C: call [00401284h]
  '00529A52: lea ecx, [ebp-38h]
  '00529A55: mov [esi+3Ch], ax
  '00529A59: call [00401030h]
  '00529A5F: lea ecx, [ebp-38h]
  '00529A62: mov ebx, [edi]
  '00529A64: push ecx
  '00529A65: mov eax, 00000002h
  '00529A6A: sub esp, 00000010h
  '00529A6D: mov edx, [ebx]
  '00529A6F: mov ecx, esp
  '00529A71: push 0042B600h
  '00529A76: push ebx
  '00529A77: mov [ecx], eax
  '00529A79: mov eax, [ebp-54h]
  '00529A7C: mov [ecx+04h], eax
  '00529A7F: xor eax, eax
  '00529A81: mov [ecx+08h], eax
  '00529A84: mov eax, [ebp-4Ch]
  '00529A87: mov [ecx+0Ch], eax
  '00529A8A: call [edx+1Ch]
  '00529A8D: test eax, eax
  '00529A8F: fclex 
  '00529A91: jnl 529AA2h
  '00529A93: push 0000001Ch
  '00529A95: push 00427C64h
  '00529A9A: push ebx
  '00529A9B: push eax
  '00529A9C: call [004010A0h]
  '00529AA2: lea ecx, [ebp-38h]
  '00529AA5: push ecx
  '00529AA6: call [00401284h]
  '00529AAC: lea ecx, [ebp-38h]
  '00529AAF: mov [esi+3Eh], ax
  '00529AB3: call [00401030h]
  '00529AB9: mov edx, [esi]
  '00529ABB: lea eax, [ebp-1Ch]
  '00529ABE: push eax
  '00529ABF: push esi
  '00529AC0: call [edx+000002B0h]
  '00529AC6: test eax, eax
  '00529AC8: fclex 
  '00529ACA: jnl 529ADEh
  '00529ACC: push 000002B0h
  '00529AD1: push 00420FA0h
  '00529AD6: push esi
  '00529AD7: push eax
  '00529AD8: call [004010A0h]
  '00529ADE: mov eax, [ebp-1Ch]
  '00529AE1: lea edx, [ebp-20h]
  '00529AE4: push edx
  '00529AE5: push eax
  '00529AE6: mov ecx, [eax]
  '00529AE8: mov ebx, eax
  '00529AEA: call [ecx+24h]
  '00529AED: test eax, eax
  '00529AEF: fclex 
  '00529AF1: jnl 529B02h
  '00529AF3: push 00000024h
  '00529AF5: push 00427BDCh
  '00529AFA: push ebx
  '00529AFB: push eax
  '00529AFC: call [004010A0h]
  '00529B02: mov eax, [esi]
  '00529B04: push esi
  '00529B05: call [eax+000003ACh]
  '00529B0B: lea ecx, [ebp-28h]
  '00529B0E: push eax
  '00529B0F: push ecx
  '00529B10: call [004010E4h]
  '00529B16: lea ebx, [ebp-48h]
  '00529B19: mov edi, [edi]
  '00529B1B: push ebx
  '00529B1C: mov ecx, 00000009h
  '00529B21: sub esp, 00000010h
  '00529B24: mov [ebp-38h], ecx
  '00529B27: mov ebx, esp
  '00529B29: mov esi, eax
  '00529B2B: mov eax, [ebp-20h]
  '00529B2E: mov [ebp-20h], 00000000h
  '00529B35: mov [ebx], ecx
  '00529B37: mov ecx, [ebp-34h]
  '00529B3A: mov [ebp-30h], eax
  '00529B3D: mov edx, [edi]
  '00529B3F: mov [ebx+04h], ecx
  '00529B42: push 00427DC4h
  '00529B47: push edi
  '00529B48: mov [ebx+08h], eax
  '00529B4B: mov eax, [ebp-2Ch]
  '00529B4E: mov [ebx+0Ch], eax
  '00529B51: call [edx+1Ch]
  '00529B54: test eax, eax
  '00529B56: fclex 
  '00529B58: jnl 529B69h
  '00529B5A: push 0000001Ch
  '00529B5C: push 00427C64h
  '00529B61: push edi
  '00529B62: push eax
  '00529B63: call [004010A0h]
  '00529B69: mov edi, [esi]
  '00529B6B: lea ecx, [ebp-48h]
  '00529B6E: push 0041D908h
  '00529B73: push ecx
  '00529B74: call [004011C8h]
  '00529B7A: lea edx, [ebp-24h]
  '00529B7D: push eax
  '00529B7E: push edx
  '00529B7F: call [004010E4h]
  '00529B85: push eax
  '00529B86: push esi
  '00529B87: call [edi+00000214h]
  '00529B8D: test eax, eax
  '00529B8F: fclex 
  '00529B91: jnl 529BA5h
  '00529B93: push 00000214h
  '00529B98: push 0041C058h
  '00529B9D: push esi
  '00529B9E: push eax
  '00529B9F: call [004010A0h]
  '00529BA5: lea eax, [ebp-28h]
  '00529BA8: lea ecx, [ebp-24h]
  '00529BAB: push eax
  '00529BAC: lea edx, [ebp-1Ch]
  '00529BAF: push ecx
  '00529BB0: push edx
  '00529BB1: push 00000003h
  '00529BB3: call [00401064h]
  '00529BB9: lea eax, [ebp-48h]
  '00529BBC: lea ecx, [ebp-38h]
  '00529BBF: push eax
  '00529BC0: push ecx
  '00529BC1: push 00000002h
  '00529BC3: call [00401050h]
  '00529BC9: add esp, 0000001Ch
  '00529BCC: mov [ebp-04h], 00000000h
  '00529BD3: push 00529C10h
  '00529BD8: jmp 529C0Fh
  '00529BDA: lea ecx, [ebp-18h]
  '00529BDD: call [004013B4h]
  '00529BE3: lea edx, [ebp-28h]
  '00529BE6: lea eax, [ebp-24h]
  '00529BE9: push edx
  '00529BEA: lea ecx, [ebp-20h]
  '00529BED: push eax
  '00529BEE: lea edx, [ebp-1Ch]
  '00529BF1: push ecx
  '00529BF2: push edx
  '00529BF3: push 00000004h
  '00529BF5: call [00401064h]
  '00529BFB: lea eax, [ebp-48h]
  '00529BFE: lea ecx, [ebp-38h]
  '00529C01: push eax
  '00529C02: push ecx
  '00529C03: push 00000002h
  '00529C05: call [00401050h]
  '00529C0B: add esp, 00000020h
  '00529C0E: ret 
End Sub
Private Sub UserControl__529420
  '00529420: push ebp
  '00529421: mov ebp, esp
  '00529423: sub esp, 0000000Ch
  '00529426: push 004081B6h
  '0052942B: mov eax, fs:[00h]
  '00529431: push eax
  '00529432: mov fs:[00000000h], esp
  '00529439: sub esp, 00000064h
  '0052943C: push ebx
  '0052943D: push esi
  '0052943E: push edi
  '0052943F: mov [ebp-0Ch], esp
  '00529442: mov [ebp-08h], 00407580h
  '00529449: mov edi, [ebp+08h]
  '0052944C: mov eax, edi
  '0052944E: and eax, 00000001h
  '00529451: mov [ebp-04h], eax
  '00529454: and edi, FFFFFFFEh
  '00529457: push edi
  '00529458: mov [ebp+08h], edi
  '0052945B: mov ecx, [edi]
  '0052945D: call [ecx+04h]
  '00529460: mov edx, 0041BC60h
  '00529465: lea ecx, [edi+48h]
  '00529468: mov [ebp-18h], 00000000h
  '0052946F: call [004012D8h]
  '00529475: mov eax, [54238Ch]
  '0052947A: test eax, eax
  '0052947C: jnz 52948Eh
  '0052947E: push 0054238Ch
  '00529483: push 0041D9E0h
  '00529488: call [004012B8h]
  '0052948E: lea ebx, [ebp-18h]
  '00529491: mov ecx, 0000000Ah
  '00529496: push ebx
  '00529497: mov [ebp-38h], ecx
  '0052949A: sub esp, 00000010h
  '0052949D: mov eax, 80020004h
  '005294A2: mov ebx, esp
  '005294A4: mov [ebp-30h], eax
  '005294A7: sub esp, 00000010h
  '005294AA: mov esi, [0054238Ch]
  '005294B0: mov [ebx], ecx
  '005294B2: mov ecx, [ebp-64h]
  '005294B5: mov edx, [esi]
  '005294B7: mov [ebx+04h], ecx
  '005294BA: mov ecx, esp
  '005294BC: sub esp, 00000010h
  '005294BF: mov [ebx+08h], eax
  '005294C2: mov eax, [ebp-5Ch]
  '005294C5: mov [ebx+0Ch], eax
  '005294C8: mov eax, 0000000Ah
  '005294CD: mov [ecx], eax
  '005294CF: mov eax, [ebp-54h]
  '005294D2: mov [ecx+04h], eax
  '005294D5: mov eax, 80020004h
  '005294DA: mov [ecx+08h], eax
  '005294DD: mov eax, [ebp-4Ch]
  '005294E0: mov [ecx+0Ch], eax
  '005294E3: mov ecx, esp
  '005294E5: mov eax, 0000000Ah
  '005294EA: sub esp, 00000010h
  '005294ED: mov [ecx], eax
  '005294EF: mov eax, [ebp-44h]
  '005294F2: mov [ecx+04h], eax
  '005294F5: mov eax, 80020004h
  '005294FA: mov [ecx+08h], eax
  '005294FD: mov eax, [ebp-3Ch]
  '00529500: mov [ecx+0Ch], eax
  '00529503: mov eax, [ebp-38h]
  '00529506: mov ecx, esp
  '00529508: sub esp, 00000010h
  '0052950B: mov [ecx], eax
  '0052950D: mov eax, [ebp-34h]
  '00529510: mov [ecx+04h], eax
  '00529513: mov eax, [ebp-30h]
  '00529516: mov [ecx+08h], eax
  '00529519: mov eax, [ebp-2Ch]
  '0052951C: mov [ecx+0Ch], eax
  '0052951F: mov ecx, esp
  '00529521: mov eax, 00000008h
  '00529526: push esi
  '00529527: mov [ecx], eax
  '00529529: mov eax, [ebp-24h]
  '0052952C: mov [ecx+04h], eax
  '0052952F: mov eax, 0041BC60h
  '00529534: mov [ecx+08h], eax
  '00529537: mov eax, [ebp-1Ch]
  '0052953A: mov [ecx+0Ch], eax
  '0052953D: call [edx+44h]
  '00529540: xor ebx, ebx
  '00529542: cmp eax, ebx
  '00529544: fclex 
  '00529546: jnl 529557h
  '00529548: push 00000044h
  '0052954A: push 0041D9D0h
  '0052954F: push esi
  '00529550: push eax
  '00529551: call [004010A0h]
  '00529557: mov ecx, [ebp-18h]
  '0052955A: lea edx, [edi+4Ch]
  '0052955D: push ecx
  '0052955E: push edx
  '0052955F: call [004010F8h]
  '00529565: lea ecx, [ebp-18h]
  '00529568: call [004013B8h]
  '0052956E: mov edx, 0041BC60h
  '00529573: lea ecx, [edi+50h]
  '00529576: call [004012D8h]
  '0052957C: mov [edi+54h], bx
  '00529580: mov [edi+44h], ebx
  '00529583: mov [edi+40h], ebx
  '00529586: mov [edi+3Ch], bx
  '0052958A: mov [edi+3Eh], bx
  '0052958E: mov [ebp-04h], ebx
  '00529591: push 005295A3h
  '00529596: jmp 5295A2h
  '00529598: lea ecx, [ebp-18h]
  '0052959B: call [004013B8h]
  '005295A1: ret 
End Sub
Private Sub unknown_52A470
  '0052A470: push ebp
  '0052A471: mov ebp, esp
  '0052A473: sub esp, 0000000Ch
  '0052A476: push 004081B6h
  '0052A47B: mov eax, fs:[00h]
  '0052A481: push eax
  '0052A482: mov fs:[00000000h], esp
  '0052A489: sub esp, 0000001Ch
  '0052A48C: push ebx
  '0052A48D: push esi
  '0052A48E: push edi
  '0052A48F: mov [ebp-0Ch], esp
  '0052A492: mov [ebp-08h], 004075C0h
  '0052A499: xor edi, edi
  '0052A49B: mov [ebp-04h], edi
  '0052A49E: mov esi, [ebp+08h]
  '0052A4A1: push esi
  '0052A4A2: mov eax, [esi]
  '0052A4A4: call [eax+04h]
  '0052A4A7: mov ecx, [esi]
  '0052A4A9: push esi
  '0052A4AA: mov [ebp-18h], edi
  '0052A4AD: mov [ebp-1Ch], edi
  '0052A4B0: mov [ebp-20h], edi
  '0052A4B3: call [ecx+000003ACh]
  '0052A4B9: lea edx, [ebp-1Ch]
  '0052A4BC: push eax
  '0052A4BD: push edx
  '0052A4BE: call [004010E4h]
  '0052A4C4: mov esi, eax
  '0052A4C6: lea ecx, [ebp-20h]
  '0052A4C9: push ecx
  '0052A4CA: push esi
  '0052A4CB: mov eax, [esi]
  '0052A4CD: call [eax+50h]
  '0052A4D0: cmp eax, edi
  '0052A4D2: fclex 
  '0052A4D4: jnl 52A4E5h
  '0052A4D6: push 00000050h
  '0052A4D8: push 0041C058h
  '0052A4DD: push esi
  '0052A4DE: push eax
  '0052A4DF: call [004010A0h]
  '0052A4E5: mov edx, [ebp-20h]
  '0052A4E8: lea ecx, [ebp-1Ch]
  '0052A4EB: mov [ebp-18h], edx
  '0052A4EE: call [004013B8h]
  '0052A4F4: push 0052A506h
  '0052A4F9: jmp 52A505h
  '0052A4FB: lea ecx, [ebp-1Ch]
  '0052A4FE: call [004013B8h]
  '0052A504: ret 
End Sub
Private Sub unknown_52A530
  '0052A530: push ebp
  '0052A531: mov ebp, esp
  '0052A533: sub esp, 0000000Ch
  '0052A536: push 004081B6h
  '0052A53B: mov eax, fs:[00h]
  '0052A541: push eax
  '0052A542: mov fs:[00000000h], esp
  '0052A549: sub esp, 00000028h
  '0052A54C: push ebx
  '0052A54D: push esi
  '0052A54E: push edi
  '0052A54F: mov [ebp-0Ch], esp
  '0052A552: mov [ebp-08h], 004075D0h
  '0052A559: xor ebx, ebx
  '0052A55B: mov [ebp-04h], ebx
  '0052A55E: mov esi, [ebp+08h]
  '0052A561: push esi
  '0052A562: mov eax, [esi]
  '0052A564: call [eax+04h]
  '0052A567: mov ecx, [esi]
  '0052A569: push esi
  '0052A56A: mov [ebp-18h], ebx
  '0052A56D: mov [ebp-2Ch], ebx
  '0052A570: call [ecx+000003ACh]
  '0052A576: lea edx, [ebp-18h]
  '0052A579: push eax
  '0052A57A: push edx
  '0052A57B: call [004010E4h]
  '0052A581: mov ecx, [ebp+0Ch]
  '0052A584: mov edi, eax
  '0052A586: push ecx
  '0052A587: push edi
  '0052A588: mov eax, [edi]
  '0052A58A: call [eax+54h]
  '0052A58D: cmp eax, ebx
  '0052A58F: fclex 
  '0052A591: jnl 52A5A2h
  '0052A593: push 00000054h
  '0052A595: push 0041C058h
  '0052A59A: push edi
  '0052A59B: push eax
  '0052A59C: call [004010A0h]
  '0052A5A2: lea ecx, [ebp-18h]
  '0052A5A5: call [004013B8h]
  '0052A5AB: sub esp, 00000010h
  '0052A5AE: mov ecx, 00000008h
  '0052A5B3: mov edi, esp
  '0052A5B5: mov edx, [esi]
  '0052A5B7: mov eax, 00427C50h
  '0052A5BC: push esi
  '0052A5BD: mov [edi], ecx
  '0052A5BF: mov ecx, [ebp-24h]
  '0052A5C2: mov [edi+04h], ecx
  '0052A5C5: mov [edi+08h], eax
  '0052A5C8: mov eax, [ebp-1Ch]
  '0052A5CB: mov [edi+0Ch], eax
  '0052A5CE: call [edx+00000390h]
  '0052A5D4: cmp eax, ebx
  '0052A5D6: fclex 
  '0052A5D8: jnl 52A5ECh
  '0052A5DA: push 00000390h
  '0052A5DF: push 00420FA0h
  '0052A5E4: push esi
  '0052A5E5: push eax
  '0052A5E6: call [004010A0h]
  '0052A5EC: mov ecx, [esi]
  '0052A5EE: lea edx, [ebp-2Ch]
  '0052A5F1: push edx
  '0052A5F2: push esi
  '0052A5F3: call [ecx+00000824h]
  '0052A5F9: push 0052A60Bh
  '0052A5FE: jmp 52A60Ah
  '0052A600: lea ecx, [ebp-18h]
  '0052A603: call [004013B8h]
  '0052A609: ret 
End Sub
Private Sub unknown_52A630
  '0052A630: push ebp
  '0052A631: mov ebp, esp
  '0052A633: sub esp, 0000000Ch
  '0052A636: push 004081B6h
  '0052A63B: mov eax, fs:[00h]
  '0052A641: push eax
  '0052A642: mov fs:[00000000h], esp
  '0052A649: sub esp, 00000020h
  '0052A64C: push ebx
  '0052A64D: push esi
  '0052A64E: push edi
  '0052A64F: mov [ebp-0Ch], esp
  '0052A652: mov [ebp-08h], 004075E0h
  '0052A659: xor edi, edi
  '0052A65B: mov [ebp-04h], edi
  '0052A65E: mov esi, [ebp+08h]
  '0052A661: push esi
  '0052A662: mov eax, [esi]
  '0052A664: call [eax+04h]
  '0052A667: mov ecx, [ebp+0Ch]
  '0052A66A: push esi
  '0052A66B: mov [ebp-18h], edi
  '0052A66E: mov [ebp-1Ch], edi
  '0052A671: mov [ecx], edi
  '0052A673: mov edx, [esi]
  '0052A675: mov [ebp-20h], edi
  '0052A678: call [edx+000003ACh]
  '0052A67E: mov ebx, [004010E4h]
  '0052A684: push eax
  '0052A685: lea eax, [ebp-1Ch]
  '0052A688: push eax
  '0052A689: call ebx
  '0052A68B: mov esi, eax
  '0052A68D: lea edx, [ebp-20h]
  '0052A690: push edx
  '0052A691: push esi
  '0052A692: mov ecx, [esi]
  '0052A694: call [ecx+00000210h]
  '0052A69A: cmp eax, edi
  '0052A69C: fclex 
  '0052A69E: jnl 52A6B2h
  '0052A6A0: push 00000210h
  '0052A6A5: push 0041C058h
  '0052A6AA: push esi
  '0052A6AB: push eax
  '0052A6AC: call [004010A0h]
  '0052A6B2: mov eax, [ebp-20h]
  '0052A6B5: mov [ebp-20h], edi
  '0052A6B8: push eax
  '0052A6B9: lea eax, [ebp-18h]
  '0052A6BC: push eax
  '0052A6BD: call ebx
  '0052A6BF: lea ecx, [ebp-1Ch]
  '0052A6C2: call [004013B8h]
  '0052A6C8: push 0052A6F3h
  '0052A6CD: jmp 52A6F2h
  '0052A6CF: test byte ptr [ebp-04h], 04h
  '0052A6D3: jz 52A6DEh
  '0052A6D5: lea ecx, [ebp-18h]
  '0052A6D8: call [004013B8h]
  '0052A6DE: lea ecx, [ebp-20h]
  '0052A6E1: lea edx, [ebp-1Ch]
  '0052A6E4: push ecx
  '0052A6E5: push edx
  '0052A6E6: push 00000002h
  '0052A6E8: call [00401064h]
  '0052A6EE: add esp, 0000000Ch
  '0052A6F1: ret 
End Sub
Private Sub unknown_52A720
  '0052A720: push ebp
  '0052A721: mov ebp, esp
  '0052A723: sub esp, 0000000Ch
  '0052A726: push 004081B6h
  '0052A72B: mov eax, fs:[00h]
  '0052A731: push eax
  '0052A732: mov fs:[00000000h], esp
  '0052A739: sub esp, 00000030h
  '0052A73C: push ebx
  '0052A73D: push esi
  '0052A73E: push edi
  '0052A73F: mov [ebp-0Ch], esp
  '0052A742: mov [ebp-08h], 004075F0h
  '0052A749: xor edi, edi
  '0052A74B: mov [ebp-04h], edi
  '0052A74E: mov esi, [ebp+08h]
  '0052A751: push esi
  '0052A752: mov eax, [esi]
  '0052A754: call [eax+04h]
  '0052A757: mov ecx, [ebp+0Ch]
  '0052A75A: mov ebx, [004010F8h]
  '0052A760: lea edx, [ebp-18h]
  '0052A763: push ecx
  '0052A764: push edx
  '0052A765: mov [ebp-18h], edi
  '0052A768: mov [ebp-1Ch], edi
  '0052A76B: mov [ebp-20h], edi
  '0052A76E: call ebx
  '0052A770: mov eax, [esi]
  '0052A772: push esi
  '0052A773: call [eax+000003ACh]
  '0052A779: lea ecx, [ebp-20h]
  '0052A77C: push eax
  '0052A77D: push ecx
  '0052A77E: call [004010E4h]
  '0052A784: mov edi, eax
  '0052A786: mov eax, [ebp-18h]
  '0052A789: lea ecx, [ebp-1Ch]
  '0052A78C: push eax
  '0052A78D: mov edx, [edi]
  '0052A78F: push ecx
  '0052A790: mov [ebp-44h], edx
  '0052A793: call ebx
  '0052A795: mov edx, [ebp-44h]
  '0052A798: push eax
  '0052A799: push edi
  '0052A79A: call [edx+00000214h]
  '0052A7A0: test eax, eax
  '0052A7A2: fclex 
  '0052A7A4: jnl 52A7B8h
  '0052A7A6: push 00000214h
  '0052A7AB: push 0041C058h
  '0052A7B0: push edi
  '0052A7B1: push eax
  '0052A7B2: call [004010A0h]
  '0052A7B8: lea eax, [ebp-20h]
  '0052A7BB: lea ecx, [ebp-1Ch]
  '0052A7BE: push eax
  '0052A7BF: push ecx
  '0052A7C0: push 00000002h
  '0052A7C2: call [00401064h]
  '0052A7C8: mov ecx, 00000008h
  '0052A7CD: mov edx, [esi]
  '0052A7CF: push ecx
  '0052A7D0: mov eax, 00427DC4h
  '0052A7D5: mov edi, esp
  '0052A7D7: push esi
  '0052A7D8: mov [edi], ecx
  '0052A7DA: mov ecx, [ebp-2Ch]
  '0052A7DD: mov [edi+04h], ecx
  '0052A7E0: mov [edi+08h], eax
  '0052A7E3: mov eax, [ebp-24h]
  '0052A7E6: mov [edi+0Ch], eax
  '0052A7E9: call [edx+00000390h]
  '0052A7EF: test eax, eax
  '0052A7F1: fclex 
  '0052A7F3: jnl 52A807h
  '0052A7F5: push 00000390h
  '0052A7FA: push 00420FA0h
  '0052A7FF: push esi
  '0052A800: push eax
  '0052A801: call [004010A0h]
  '0052A807: push 0052A82Ch
  '0052A80C: jmp 52A822h
  '0052A80E: lea ecx, [ebp-20h]
  '0052A811: lea edx, [ebp-1Ch]
  '0052A814: push ecx
  '0052A815: push edx
  '0052A816: push 00000002h
  '0052A818: call [00401064h]
  '0052A81E: add esp, 0000000Ch
  '0052A821: ret 
End Sub
Private Sub unknown_52A850
  '0052A850: push ebp
  '0052A851: mov ebp, esp
  '0052A853: sub esp, 0000000Ch
  '0052A856: push 004081B6h
  '0052A85B: mov eax, fs:[00h]
  '0052A861: push eax
  '0052A862: mov fs:[00000000h], esp
  '0052A869: sub esp, 0000001Ch
  '0052A86C: push ebx
  '0052A86D: push esi
  '0052A86E: push edi
  '0052A86F: mov [ebp-0Ch], esp
  '0052A872: mov [ebp-08h], 00407600h
  '0052A879: xor edi, edi
  '0052A87B: mov [ebp-04h], edi
  '0052A87E: mov esi, [ebp+08h]
  '0052A881: push esi
  '0052A882: mov eax, [esi]
  '0052A884: call [eax+04h]
  '0052A887: mov ecx, [esi]
  '0052A889: push esi
  '0052A88A: mov [ebp-18h], edi
  '0052A88D: mov [ebp-1Ch], edi
  '0052A890: mov [ebp-20h], edi
  '0052A893: call [ecx+000003ACh]
  '0052A899: lea edx, [ebp-1Ch]
  '0052A89C: push eax
  '0052A89D: push edx
  '0052A89E: call [004010E4h]
  '0052A8A4: mov esi, eax
  '0052A8A6: lea ecx, [ebp-20h]
  '0052A8A9: push ecx
  '0052A8AA: push esi
  '0052A8AB: mov eax, [esi]
  '0052A8AD: call [eax+68h]
  '0052A8B0: cmp eax, edi
  '0052A8B2: fclex 
  '0052A8B4: jnl 52A8C5h
  '0052A8B6: push 00000068h
  '0052A8B8: push 0041C058h
  '0052A8BD: push esi
  '0052A8BE: push eax
  '0052A8BF: call [004010A0h]
  '0052A8C5: mov edx, [ebp-20h]
  '0052A8C8: lea ecx, [ebp-1Ch]
  '0052A8CB: mov [ebp-18h], edx
  '0052A8CE: call [004013B8h]
  '0052A8D4: push 0052A8E6h
  '0052A8D9: jmp 52A8E5h
  '0052A8DB: lea ecx, [ebp-1Ch]
  '0052A8DE: call [004013B8h]
  '0052A8E4: ret 
End Sub
Private Sub unknown_52A910
  '0052A910: push ebp
  '0052A911: mov ebp, esp
  '0052A913: sub esp, 0000000Ch
  '0052A916: push 004081B6h
  '0052A91B: mov eax, fs:[00h]
  '0052A921: push eax
  '0052A922: mov fs:[00000000h], esp
  '0052A929: sub esp, 00000028h
  '0052A92C: push ebx
  '0052A92D: push esi
  '0052A92E: push edi
  '0052A92F: mov [ebp-0Ch], esp
  '0052A932: mov [ebp-08h], 00407610h
  '0052A939: xor ebx, ebx
  '0052A93B: mov [ebp-04h], ebx
  '0052A93E: mov esi, [ebp+08h]
  '0052A941: push esi
  '0052A942: mov eax, [esi]
  '0052A944: call [eax+04h]
  '0052A947: mov ecx, [esi]
  '0052A949: push esi
  '0052A94A: mov [ebp-18h], ebx
  '0052A94D: mov [ebp-2Ch], ebx
  '0052A950: call [ecx+000003ACh]
  '0052A956: lea edx, [ebp-18h]
  '0052A959: push eax
  '0052A95A: push edx
  '0052A95B: call [004010E4h]
  '0052A961: mov ecx, [ebp+0Ch]
  '0052A964: mov edi, eax
  '0052A966: push ecx
  '0052A967: push edi
  '0052A968: mov eax, [edi]
  '0052A96A: call [eax+6Ch]
  '0052A96D: cmp eax, ebx
  '0052A96F: fclex 
  '0052A971: jnl 52A982h
  '0052A973: push 0000006Ch
  '0052A975: push 0041C058h
  '0052A97A: push edi
  '0052A97B: push eax
  '0052A97C: call [004010A0h]
  '0052A982: lea ecx, [ebp-18h]
  '0052A985: call [004013B8h]
  '0052A98B: sub esp, 00000010h
  '0052A98E: mov ecx, 00000008h
  '0052A993: mov edi, esp
  '0052A995: mov edx, [esi]
  '0052A997: mov eax, 00427C78h
  '0052A99C: push esi
  '0052A99D: mov [edi], ecx
  '0052A99F: mov ecx, [ebp-24h]
  '0052A9A2: mov [edi+04h], ecx
  '0052A9A5: mov [edi+08h], eax
  '0052A9A8: mov eax, [ebp-1Ch]
  '0052A9AB: mov [edi+0Ch], eax
  '0052A9AE: call [edx+00000390h]
  '0052A9B4: cmp eax, ebx
  '0052A9B6: fclex 
  '0052A9B8: jnl 52A9CCh
  '0052A9BA: push 00000390h
  '0052A9BF: push 00420FA0h
  '0052A9C4: push esi
  '0052A9C5: push eax
  '0052A9C6: call [004010A0h]
  '0052A9CC: mov ecx, [esi]
  '0052A9CE: lea edx, [ebp-2Ch]
  '0052A9D1: push edx
  '0052A9D2: push esi
  '0052A9D3: call [ecx+00000824h]
  '0052A9D9: push 0052A9EBh
  '0052A9DE: jmp 52A9EAh
  '0052A9E0: lea ecx, [ebp-18h]
  '0052A9E3: call [004013B8h]
  '0052A9E9: ret 
End Sub
Private Sub BackColor_52AA10
  '0052AA10: push ebp
  '0052AA11: mov ebp, esp
  '0052AA13: sub esp, 0000000Ch
  '0052AA16: push 004081B6h
  '0052AA1B: mov eax, fs:[00h]
  '0052AA21: push eax
  '0052AA22: mov fs:[00000000h], esp
  '0052AA29: sub esp, 0000000Ch
  '0052AA2C: push ebx
  '0052AA2D: push esi
  '0052AA2E: push edi
  '0052AA2F: mov [ebp-0Ch], esp
  '0052AA32: mov [ebp-08h], 00407620h
  '0052AA39: xor edi, edi
  '0052AA3B: mov [ebp-04h], edi
  '0052AA3E: mov esi, [ebp+08h]
  '0052AA41: push esi
  '0052AA42: mov eax, [esi]
  '0052AA44: call [eax+04h]
  '0052AA47: mov cx, [esi+3Ch]
  '0052AA4B: mov [ebp-18h], edi
  '0052AA4E: mov [ebp-18h], ecx
  '0052AA51: mov eax, [ebp+08h]
  '0052AA54: push eax
  '0052AA55: mov edx, [eax]
  '0052AA57: call [edx+08h]
  '0052AA5A: mov eax, [ebp+0Ch]
  '0052AA5D: mov cx, [ebp-18h]
  '0052AA61: mov [eax], cx
  '0052AA64: mov eax, [ebp-04h]
  '0052AA67: mov ecx, [ebp-14h]
  '0052AA6A: pop edi
  '0052AA6B: pop esi
  '0052AA6C: mov fs:[00000000h], ecx
  '0052AA73: pop ebx
  '0052AA74: mov esp, ebp
  '0052AA76: pop ebp
  '0052AA77: retn 0008h
End Sub
Private Sub BackColor_52AA80
  '0052AA80: push ebp
  '0052AA81: mov ebp, esp
  '0052AA83: sub esp, 0000000Ch
  '0052AA86: push 004081B6h
  '0052AA8B: mov eax, fs:[00h]
  '0052AA91: push eax
  '0052AA92: mov fs:[00000000h], esp
  '0052AA99: sub esp, 0000001Ch
  '0052AA9C: push ebx
  '0052AA9D: push esi
  '0052AA9E: push edi
  '0052AA9F: mov [ebp-0Ch], esp
  '0052AAA2: mov [ebp-08h], 00407628h
  '0052AAA9: mov [ebp-04h], 00000000h
  '0052AAB0: mov esi, [ebp+08h]
  '0052AAB3: push esi
  '0052AAB4: mov eax, [esi]
  '0052AAB6: call [eax+04h]
  '0052AAB9: mov cx, [ebp+0Ch]
  '0052AABD: sub esp, 00000010h
  '0052AAC0: mov [esi+3Ch], cx
  '0052AAC4: mov edi, esp
  '0052AAC6: mov ecx, 00000008h
  '0052AACB: mov edx, [esi]
  '0052AACD: mov [edi], ecx
  '0052AACF: mov ecx, [ebp-20h]
  '0052AAD2: mov eax, 0042B5F0h
  '0052AAD7: push esi
  '0052AAD8: mov [edi+04h], ecx
  '0052AADB: mov [edi+08h], eax
  '0052AADE: mov eax, [ebp-18h]
  '0052AAE1: mov [edi+0Ch], eax
  '0052AAE4: call [edx+00000390h]
  '0052AAEA: test eax, eax
  '0052AAEC: fclex 
  '0052AAEE: jnl 52AB02h
  '0052AAF0: push 00000390h
  '0052AAF5: push 00420FA0h
  '0052AAFA: push esi
  '0052AAFB: push eax
  '0052AAFC: call [004010A0h]
  '0052AB02: mov eax, [ebp+08h]
  '0052AB05: push eax
  '0052AB06: mov ecx, [eax]
  '0052AB08: call [ecx+08h]
  '0052AB0B: mov eax, [ebp-04h]
  '0052AB0E: mov ecx, [ebp-14h]
  '0052AB11: pop edi
  '0052AB12: pop esi
  '0052AB13: mov fs:[00000000h], ecx
  '0052AB1A: pop ebx
  '0052AB1B: mov esp, ebp
  '0052AB1D: pop ebp
  '0052AB1E: retn 0008h
End Sub
Private Sub Font_52AB30
  '0052AB30: push ebp
  '0052AB31: mov ebp, esp
  '0052AB33: sub esp, 0000000Ch
  '0052AB36: push 004081B6h
  '0052AB3B: mov eax, fs:[00h]
  '0052AB41: push eax
  '0052AB42: mov fs:[00000000h], esp
  '0052AB49: sub esp, 0000000Ch
  '0052AB4C: push ebx
  '0052AB4D: push esi
  '0052AB4E: push edi
  '0052AB4F: mov [ebp-0Ch], esp
  '0052AB52: mov [ebp-08h], 00407630h
  '0052AB59: xor edi, edi
  '0052AB5B: mov [ebp-04h], edi
  '0052AB5E: mov esi, [ebp+08h]
  '0052AB61: push esi
  '0052AB62: mov eax, [esi]
  '0052AB64: call [eax+04h]
  '0052AB67: mov cx, [esi+3Eh]
  '0052AB6B: mov [ebp-18h], edi
  '0052AB6E: mov [ebp-18h], ecx
  '0052AB71: mov eax, [ebp+08h]
  '0052AB74: push eax
  '0052AB75: mov edx, [eax]
  '0052AB77: call [edx+08h]
  '0052AB7A: mov eax, [ebp+0Ch]
  '0052AB7D: mov cx, [ebp-18h]
  '0052AB81: mov [eax], cx
  '0052AB84: mov eax, [ebp-04h]
  '0052AB87: mov ecx, [ebp-14h]
  '0052AB8A: pop edi
  '0052AB8B: pop esi
  '0052AB8C: mov fs:[00000000h], ecx
  '0052AB93: pop ebx
  '0052AB94: mov esp, ebp
  '0052AB96: pop ebp
  '0052AB97: retn 0008h
End Sub
Private Sub Font_52ABA0
  '0052ABA0: push ebp
  '0052ABA1: mov ebp, esp
  '0052ABA3: sub esp, 0000000Ch
  '0052ABA6: push 004081B6h
  '0052ABAB: mov eax, fs:[00h]
  '0052ABB1: push eax
  '0052ABB2: mov fs:[00000000h], esp
  '0052ABB9: sub esp, 0000001Ch
  '0052ABBC: push ebx
  '0052ABBD: push esi
  '0052ABBE: push edi
  '0052ABBF: mov [ebp-0Ch], esp
  '0052ABC2: mov [ebp-08h], 00407638h
  '0052ABC9: mov [ebp-04h], 00000000h
  '0052ABD0: mov esi, [ebp+08h]
  '0052ABD3: push esi
  '0052ABD4: mov eax, [esi]
  '0052ABD6: call [eax+04h]
  '0052ABD9: mov cx, [ebp+0Ch]
  '0052ABDD: sub esp, 00000010h
  '0052ABE0: mov [esi+3Eh], cx
  '0052ABE4: mov edi, esp
  '0052ABE6: mov ecx, 00000008h
  '0052ABEB: mov edx, [esi]
  '0052ABED: mov [edi], ecx
  '0052ABEF: mov ecx, [ebp-20h]
  '0052ABF2: mov eax, 0042B600h
  '0052ABF7: push esi
  '0052ABF8: mov [edi+04h], ecx
  '0052ABFB: mov [edi+08h], eax
  '0052ABFE: mov eax, [ebp-18h]
  '0052AC01: mov [edi+0Ch], eax
  '0052AC04: call [edx+00000390h]
  '0052AC0A: test eax, eax
  '0052AC0C: fclex 
  '0052AC0E: jnl 52AC22h
  '0052AC10: push 00000390h
  '0052AC15: push 00420FA0h
  '0052AC1A: push esi
  '0052AC1B: push eax
  '0052AC1C: call [004010A0h]
  '0052AC22: mov eax, [ebp+08h]
  '0052AC25: push eax
  '0052AC26: mov ecx, [eax]
  '0052AC28: call [ecx+08h]
  '0052AC2B: mov eax, [ebp-04h]
  '0052AC2E: mov ecx, [ebp-14h]
  '0052AC31: pop edi
  '0052AC32: pop esi
  '0052AC33: mov fs:[00000000h], ecx
  '0052AC3A: pop ebx
  '0052AC3B: mov esp, ebp
  '0052AC3D: pop ebp
  '0052AC3E: retn 0008h
End Sub
Private Sub ForeColor_52AC50
  '0052AC50: push ebp
  '0052AC51: mov ebp, esp
  '0052AC53: sub esp, 0000000Ch
  '0052AC56: push 004081B6h
  '0052AC5B: mov eax, fs:[00h]
  '0052AC61: push eax
  '0052AC62: mov fs:[00000000h], esp
  '0052AC69: sub esp, 0000000Ch
  '0052AC6C: push ebx
  '0052AC6D: push esi
  '0052AC6E: push edi
  '0052AC6F: mov [ebp-0Ch], esp
  '0052AC72: mov [ebp-08h], 00407640h
  '0052AC79: xor edi, edi
  '0052AC7B: mov [ebp-04h], edi
  '0052AC7E: mov esi, [ebp+08h]
  '0052AC81: push esi
  '0052AC82: mov eax, [esi]
  '0052AC84: call [eax+04h]
  '0052AC87: mov ecx, [esi+40h]
  '0052AC8A: mov [ebp-18h], edi
  '0052AC8D: mov [ebp-18h], ecx
  '0052AC90: mov eax, [ebp+08h]
  '0052AC93: push eax
  '0052AC94: mov edx, [eax]
  '0052AC96: call [edx+08h]
  '0052AC99: mov eax, [ebp+0Ch]
  '0052AC9C: mov ecx, [ebp-18h]
  '0052AC9F: mov [eax], ecx
  '0052ACA1: mov eax, [ebp-04h]
  '0052ACA4: mov ecx, [ebp-14h]
  '0052ACA7: pop edi
  '0052ACA8: pop esi
  '0052ACA9: mov fs:[00000000h], ecx
  '0052ACB0: pop ebx
  '0052ACB1: mov esp, ebp
  '0052ACB3: pop ebp
  '0052ACB4: retn 0008h
End Sub
Private Sub ForeColor_52ACC0
  '0052ACC0: push ebp
  '0052ACC1: mov ebp, esp
  '0052ACC3: sub esp, 0000000Ch
  '0052ACC6: push 004081B6h
  '0052ACCB: mov eax, fs:[00h]
  '0052ACD1: push eax
  '0052ACD2: mov fs:[00000000h], esp
  '0052ACD9: sub esp, 00000024h
  '0052ACDC: push ebx
  '0052ACDD: push esi
  '0052ACDE: push edi
  '0052ACDF: mov [ebp-0Ch], esp
  '0052ACE2: mov [ebp-08h], 00407648h
  '0052ACE9: xor edi, edi
  '0052ACEB: mov [ebp-04h], edi
  '0052ACEE: mov esi, [ebp+08h]
  '0052ACF1: push esi
  '0052ACF2: mov eax, [esi]
  '0052ACF4: call [eax+04h]
  '0052ACF7: mov edx, [esi]
  '0052ACF9: mov ecx, [ebp+0Ch]
  '0052ACFC: mov [ebp-18h], edi
  '0052ACFF: mov ebx, [ebp-24h]
  '0052AD02: lea edi, [esi+40h]
  '0052AD05: sub esp, 00000010h
  '0052AD08: mov [ebp-38h], edx
  '0052AD0B: mov edx, esp
  '0052AD0D: mov [edi], ecx
  '0052AD0F: mov ecx, 00000008h
  '0052AD14: mov [edx], ecx
  '0052AD16: mov ecx, [ebp-38h]
  '0052AD19: mov eax, 0042B5D0h
  '0052AD1E: push esi
  '0052AD1F: mov [edx+04h], ebx
  '0052AD22: mov [edx+08h], eax
  '0052AD25: mov eax, [ebp-1Ch]
  '0052AD28: mov [edx+0Ch], eax
  '0052AD2B: call [ecx+00000390h]
  '0052AD31: test eax, eax
  '0052AD33: fclex 
  '0052AD35: jnl 52AD49h
  '0052AD37: push 00000390h
  '0052AD3C: push 00420FA0h
  '0052AD41: push esi
  '0052AD42: push eax
  '0052AD43: call [004010A0h]
  '0052AD49: sub esp, 00000010h
  '0052AD4C: mov eax, 00004003h
  '0052AD51: mov edx, esp
  '0052AD53: mov ecx, [esi]
  '0052AD55: push 00000003h
  '0052AD57: push esi
  '0052AD58: mov [edx], eax
  '0052AD5A: mov eax, [ebp-1Ch]
  '0052AD5D: mov [edx+04h], ebx
  '0052AD60: mov [edx+08h], edi
  '0052AD63: mov [edx+0Ch], eax
  '0052AD66: call [ecx+000003B4h]
  '0052AD6C: lea edx, [ebp-18h]
  '0052AD6F: push eax
  '0052AD70: push edx
  '0052AD71: call [004010E4h]
  '0052AD77: push eax
  '0052AD78: call [0040139Ch]
  '0052AD7E: lea ecx, [ebp-18h]
  '0052AD81: call [004013B8h]
  '0052AD87: push 0052AD99h
  '0052AD8C: jmp 52AD98h
  '0052AD8E: lea ecx, [ebp-18h]
  '0052AD91: call [004013B8h]
  '0052AD97: ret 
End Sub
Private Sub PosX_52ADC0
  '0052ADC0: push ebp
  '0052ADC1: mov ebp, esp
  '0052ADC3: sub esp, 0000000Ch
  '0052ADC6: push 004081B6h
  '0052ADCB: mov eax, fs:[00h]
  '0052ADD1: push eax
  '0052ADD2: mov fs:[00000000h], esp
  '0052ADD9: sub esp, 0000000Ch
  '0052ADDC: push ebx
  '0052ADDD: push esi
  '0052ADDE: push edi
  '0052ADDF: mov [ebp-0Ch], esp
  '0052ADE2: mov [ebp-08h], 00407658h
  '0052ADE9: xor edi, edi
  '0052ADEB: mov [ebp-04h], edi
  '0052ADEE: mov esi, [ebp+08h]
  '0052ADF1: push esi
  '0052ADF2: mov eax, [esi]
  '0052ADF4: call [eax+04h]
  '0052ADF7: mov ecx, [ebp+0Ch]
  '0052ADFA: mov [ebp-18h], edi
  '0052ADFD: mov [ecx], edi
  '0052ADFF: mov edx, [esi+48h]
  '0052AE02: lea ecx, [ebp-18h]
  '0052AE05: call [004012D8h]
  '0052AE0B: push 0052AE1Dh
  '0052AE10: jmp 52AE1Ch
  '0052AE12: lea ecx, [ebp-18h]
  '0052AE15: call [004013B4h]
  '0052AE1B: ret 
End Sub
Private Sub PosX_52AE50
  '0052AE50: push ebp
  '0052AE51: mov ebp, esp
  '0052AE53: sub esp, 0000000Ch
  '0052AE56: push 004081B6h
  '0052AE5B: mov eax, fs:[00h]
  '0052AE61: push eax
  '0052AE62: mov fs:[00000000h], esp
  '0052AE69: sub esp, 00000024h
  '0052AE6C: push ebx
  '0052AE6D: push esi
  '0052AE6E: push edi
  '0052AE6F: mov [ebp-0Ch], esp
  '0052AE72: mov [ebp-08h], 00407668h
  '0052AE79: xor ebx, ebx
  '0052AE7B: mov [ebp-04h], ebx
  '0052AE7E: mov esi, [ebp+08h]
  '0052AE81: push esi
  '0052AE82: mov eax, [esi]
  '0052AE84: call [eax+04h]
  '0052AE87: mov edx, [ebp+0Ch]
  '0052AE8A: mov edi, [004012D8h]
  '0052AE90: lea ecx, [ebp-18h]
  '0052AE93: mov [ebp-18h], ebx
  '0052AE96: mov [ebp-2Ch], ebx
  '0052AE99: call edi
  '0052AE9B: mov edx, [ebp-18h]
  '0052AE9E: lea ecx, [esi+48h]
  '0052AEA1: call edi
  '0052AEA3: sub esp, 00000010h
  '0052AEA6: mov ecx, 00000008h
  '0052AEAB: mov edi, esp
  '0052AEAD: mov edx, [esi]
  '0052AEAF: mov eax, 0042B558h
  '0052AEB4: push esi
  '0052AEB5: mov [edi], ecx
  '0052AEB7: mov ecx, [ebp-24h]
  '0052AEBA: mov [edi+04h], ecx
  '0052AEBD: mov [edi+08h], eax
  '0052AEC0: mov eax, [ebp-1Ch]
  '0052AEC3: mov [edi+0Ch], eax
  '0052AEC6: call [edx+00000390h]
  '0052AECC: cmp eax, ebx
  '0052AECE: fclex 
  '0052AED0: jnl 52AEE4h
  '0052AED2: push 00000390h
  '0052AED7: push 00420FA0h
  '0052AEDC: push esi
  '0052AEDD: push eax
  '0052AEDE: call [004010A0h]
  '0052AEE4: mov ecx, [esi]
  '0052AEE6: lea edx, [ebp-2Ch]
  '0052AEE9: push edx
  '0052AEEA: push esi
  '0052AEEB: call [ecx+00000824h]
  '0052AEF1: push 0052AF00h
  '0052AEF6: lea ecx, [ebp-18h]
  '0052AEF9: call [004013B4h]
  '0052AEFF: ret 
End Sub
Private Sub PosY_52AF20
  '0052AF20: push ebp
  '0052AF21: mov ebp, esp
  '0052AF23: sub esp, 0000000Ch
  '0052AF26: push 004081B6h
  '0052AF2B: mov eax, fs:[00h]
  '0052AF31: push eax
  '0052AF32: mov fs:[00000000h], esp
  '0052AF39: sub esp, 0000000Ch
  '0052AF3C: push ebx
  '0052AF3D: push esi
  '0052AF3E: push edi
  '0052AF3F: mov [ebp-0Ch], esp
  '0052AF42: mov [ebp-08h], 00407678h
  '0052AF49: xor edi, edi
  '0052AF4B: mov [ebp-04h], edi
  '0052AF4E: mov esi, [ebp+08h]
  '0052AF51: push esi
  '0052AF52: mov eax, [esi]
  '0052AF54: call [eax+04h]
  '0052AF57: mov ecx, [ebp+0Ch]
  '0052AF5A: lea eax, [ebp-18h]
  '0052AF5D: mov [ebp-18h], edi
  '0052AF60: mov [ecx], edi
  '0052AF62: mov edx, [esi+4Ch]
  '0052AF65: push edx
  '0052AF66: push eax
  '0052AF67: call [004010F8h]
  '0052AF6D: push 0052AF7Fh
  '0052AF72: jmp 52AF7Eh
  '0052AF74: lea ecx, [ebp-18h]
  '0052AF77: call [004013B8h]
  '0052AF7D: ret 
End Sub
Private Sub PosY_52AFB0
  '0052AFB0: push ebp
  '0052AFB1: mov ebp, esp
  '0052AFB3: sub esp, 0000000Ch
  '0052AFB6: push 004081B6h
  '0052AFBB: mov eax, fs:[00h]
  '0052AFC1: push eax
  '0052AFC2: mov fs:[00000000h], esp
  '0052AFC9: sub esp, 00000034h
  '0052AFCC: push ebx
  '0052AFCD: push esi
  '0052AFCE: push edi
  '0052AFCF: mov [ebp-0Ch], esp
  '0052AFD2: mov [ebp-08h], 00407688h
  '0052AFD9: xor edi, edi
  '0052AFDB: mov [ebp-04h], edi
  '0052AFDE: mov esi, [ebp+08h]
  '0052AFE1: push esi
  '0052AFE2: mov eax, [esi]
  '0052AFE4: call [eax+04h]
  '0052AFE7: mov ecx, [ebp+0Ch]
  '0052AFEA: mov ebx, [004010F8h]
  '0052AFF0: lea edx, [ebp-18h]
  '0052AFF3: push ecx
  '0052AFF4: push edx
  '0052AFF5: mov [ebp-18h], edi
  '0052AFF8: mov [ebp-1Ch], edi
  '0052AFFB: mov [ebp-20h], edi
  '0052AFFE: mov [ebp-34h], edi
  '0052B001: call ebx
  '0052B003: mov ecx, [ebp-18h]
  '0052B006: lea eax, [esi+4Ch]
  '0052B009: push ecx
  '0052B00A: push eax
  '0052B00B: call ebx
  '0052B00D: sub esp, 00000010h
  '0052B010: mov eax, 00000008h
  '0052B015: mov ecx, esp
  '0052B017: mov edx, [esi]
  '0052B019: push esi
  '0052B01A: mov [ecx], eax
  '0052B01C: mov eax, [ebp-2Ch]
  '0052B01F: mov [ecx+04h], eax
  '0052B022: mov eax, 0042B56Ch
  '0052B027: mov [ecx+08h], eax
  '0052B02A: mov eax, [ebp-24h]
  '0052B02D: mov [ecx+0Ch], eax
  '0052B030: call [edx+00000390h]
  '0052B036: cmp eax, edi
  '0052B038: fclex 
  '0052B03A: jnl 52B04Eh
  '0052B03C: push 00000390h
  '0052B041: push 00420FA0h
  '0052B046: push esi
  '0052B047: push eax
  '0052B048: call [004010A0h]
  '0052B04E: mov ecx, [esi]
  '0052B050: push esi
  '0052B051: call [ecx+000003A8h]
  '0052B057: lea edx, [ebp-20h]
  '0052B05A: push eax
  '0052B05B: push edx
  '0052B05C: call [004010E4h]
  '0052B062: mov edi, eax
  '0052B064: mov eax, [esi+4Ch]
  '0052B067: lea ecx, [ebp-1Ch]
  '0052B06A: push eax
  '0052B06B: mov edx, [edi]
  '0052B06D: push ecx
  '0052B06E: mov [ebp-48h], edx
  '0052B071: call ebx
  '0052B073: mov edx, [ebp-48h]
  '0052B076: push eax
  '0052B077: push edi
  '0052B078: call [edx+64h]
  '0052B07B: test eax, eax
  '0052B07D: fclex 
  '0052B07F: jnl 52B090h
  '0052B081: push 00000064h
  '0052B083: push 0041C058h
  '0052B088: push edi
  '0052B089: push eax
  '0052B08A: call [004010A0h]
  '0052B090: lea eax, [ebp-20h]
  '0052B093: lea ecx, [ebp-1Ch]
  '0052B096: push eax
  '0052B097: push ecx
  '0052B098: push 00000002h
  '0052B09A: call [00401064h]
  '0052B0A0: mov edx, [esi]
  '0052B0A2: add esp, 0000000Ch
  '0052B0A5: lea eax, [ebp-34h]
  '0052B0A8: push eax
  '0052B0A9: push esi
  '0052B0AA: call [edx+00000824h]
  '0052B0B0: push 0052B0D5h
  '0052B0B5: jmp 52B0CBh
  '0052B0B7: lea ecx, [ebp-20h]
  '0052B0BA: lea edx, [ebp-1Ch]
  '0052B0BD: push ecx
  '0052B0BE: push edx
  '0052B0BF: push 00000002h
  '0052B0C1: call [00401064h]
  '0052B0C7: add esp, 0000000Ch
  '0052B0CA: ret 
End Sub
Private Sub Transparency_52B100
  '0052B100: push ebp
  '0052B101: mov ebp, esp
  '0052B103: sub esp, 0000000Ch
  '0052B106: push 004081B6h
  '0052B10B: mov eax, fs:[00h]
  '0052B111: push eax
  '0052B112: mov fs:[00000000h], esp
  '0052B119: sub esp, 0000000Ch
  '0052B11C: push ebx
  '0052B11D: push esi
  '0052B11E: push edi
  '0052B11F: mov [ebp-0Ch], esp
  '0052B122: mov [ebp-08h], 00407698h
  '0052B129: xor edi, edi
  '0052B12B: mov [ebp-04h], edi
  '0052B12E: mov esi, [ebp+08h]
  '0052B131: push esi
  '0052B132: mov eax, [esi]
  '0052B134: call [eax+04h]
  '0052B137: mov ecx, [ebp+0Ch]
  '0052B13A: mov [ebp-18h], edi
  '0052B13D: mov [ecx], edi
  '0052B13F: mov edx, [esi+50h]
  '0052B142: lea ecx, [ebp-18h]
  '0052B145: call [004012D8h]
  '0052B14B: push 0052B15Dh
  '0052B150: jmp 52B15Ch
  '0052B152: lea ecx, [ebp-18h]
  '0052B155: call [004013B4h]
  '0052B15B: ret 
End Sub
Private Sub Transparency_52B190
  '0052B190: push ebp
  '0052B191: mov ebp, esp
  '0052B193: sub esp, 0000000Ch
  '0052B196: push 004081B6h
  '0052B19B: mov eax, fs:[00h]
  '0052B1A1: push eax
  '0052B1A2: mov fs:[00000000h], esp
  '0052B1A9: sub esp, 00000024h
  '0052B1AC: push ebx
  '0052B1AD: push esi
  '0052B1AE: push edi
  '0052B1AF: mov [ebp-0Ch], esp
  '0052B1B2: mov [ebp-08h], 004076A8h
  '0052B1B9: xor ebx, ebx
  '0052B1BB: mov [ebp-04h], ebx
  '0052B1BE: mov esi, [ebp+08h]
  '0052B1C1: push esi
  '0052B1C2: mov eax, [esi]
  '0052B1C4: call [eax+04h]
  '0052B1C7: mov edx, [ebp+0Ch]
  '0052B1CA: mov edi, [004012D8h]
  '0052B1D0: lea ecx, [ebp-18h]
  '0052B1D3: mov [ebp-18h], ebx
  '0052B1D6: mov [ebp-2Ch], ebx
  '0052B1D9: call edi
  '0052B1DB: mov edx, [ebp-18h]
  '0052B1DE: lea ecx, [esi+50h]
  '0052B1E1: call edi
  '0052B1E3: sub esp, 00000010h
  '0052B1E6: mov ecx, 00000008h
  '0052B1EB: mov edi, esp
  '0052B1ED: mov edx, [esi]
  '0052B1EF: mov eax, 0042B584h
  '0052B1F4: push esi
  '0052B1F5: mov [edi], ecx
  '0052B1F7: mov ecx, [ebp-24h]
  '0052B1FA: mov [edi+04h], ecx
  '0052B1FD: mov [edi+08h], eax
  '0052B200: mov eax, [ebp-1Ch]
  '0052B203: mov [edi+0Ch], eax
  '0052B206: call [edx+00000390h]
  '0052B20C: cmp eax, ebx
  '0052B20E: fclex 
  '0052B210: jnl 52B224h
  '0052B212: push 00000390h
  '0052B217: push 00420FA0h
  '0052B21C: push esi
  '0052B21D: push eax
  '0052B21E: call [004010A0h]
  '0052B224: mov ecx, [esi]
  '0052B226: lea edx, [ebp-2Ch]
  '0052B229: push edx
  '0052B22A: push esi
  '0052B22B: call [ecx+00000824h]
  '0052B231: push 0052B240h
  '0052B236: lea ecx, [ebp-18h]
  '0052B239: call [004013B4h]
  '0052B23F: ret 
End Sub
Private Sub TrayTip_52B260
  '0052B260: push ebp
  '0052B261: mov ebp, esp
  '0052B263: sub esp, 0000000Ch
  '0052B266: push 004081B6h
  '0052B26B: mov eax, fs:[00h]
  '0052B271: push eax
  '0052B272: mov fs:[00000000h], esp
  '0052B279: sub esp, 0000000Ch
  '0052B27C: push ebx
  '0052B27D: push esi
  '0052B27E: push edi
  '0052B27F: mov [ebp-0Ch], esp
  '0052B282: mov [ebp-08h], 004076B8h
  '0052B289: xor edi, edi
  '0052B28B: mov [ebp-04h], edi
  '0052B28E: mov esi, [ebp+08h]
  '0052B291: push esi
  '0052B292: mov eax, [esi]
  '0052B294: call [eax+04h]
  '0052B297: mov ecx, [esi+44h]
  '0052B29A: mov [ebp-18h], edi
  '0052B29D: mov [ebp-18h], ecx
  '0052B2A0: mov eax, [ebp+08h]
  '0052B2A3: push eax
  '0052B2A4: mov edx, [eax]
  '0052B2A6: call [edx+08h]
  '0052B2A9: mov eax, [ebp+0Ch]
  '0052B2AC: mov ecx, [ebp-18h]
  '0052B2AF: mov [eax], ecx
  '0052B2B1: mov eax, [ebp-04h]
  '0052B2B4: mov ecx, [ebp-14h]
  '0052B2B7: pop edi
  '0052B2B8: pop esi
  '0052B2B9: mov fs:[00000000h], ecx
  '0052B2C0: pop ebx
  '0052B2C1: mov esp, ebp
  '0052B2C3: pop ebp
  '0052B2C4: retn 0008h
End Sub
Private Sub TrayTip_52B2D0
  '0052B2D0: push ebp
  '0052B2D1: mov ebp, esp
  '0052B2D3: sub esp, 0000000Ch
  '0052B2D6: push 004081B6h
  '0052B2DB: mov eax, fs:[00h]
  '0052B2E1: push eax
  '0052B2E2: mov fs:[00000000h], esp
  '0052B2E9: sub esp, 00000020h
  '0052B2EC: push ebx
  '0052B2ED: push esi
  '0052B2EE: push edi
  '0052B2EF: mov [ebp-0Ch], esp
  '0052B2F2: mov [ebp-08h], 004076C0h
  '0052B2F9: xor edi, edi
  '0052B2FB: mov [ebp-04h], edi
  '0052B2FE: mov esi, [ebp+08h]
  '0052B301: push esi
  '0052B302: mov eax, [esi]
  '0052B304: call [eax+04h]
  '0052B307: mov ecx, [ebp+0Ch]
  '0052B30A: sub esp, 00000010h
  '0052B30D: mov [esi+44h], ecx
  '0052B310: mov ebx, esp
  '0052B312: mov ecx, 00000008h
  '0052B317: mov edx, [esi]
  '0052B319: mov [ebx], ecx
  '0052B31B: mov ecx, [ebp-20h]
  '0052B31E: mov eax, 0042B5B8h
  '0052B323: push esi
  '0052B324: mov [ebx+04h], ecx
  '0052B327: mov [ebp-28h], edi
  '0052B32A: mov [ebx+08h], eax
  '0052B32D: mov eax, [ebp-18h]
  '0052B330: mov [ebx+0Ch], eax
  '0052B333: call [edx+00000390h]
  '0052B339: cmp eax, edi
  '0052B33B: fclex 
  '0052B33D: jnl 52B351h
  '0052B33F: push 00000390h
  '0052B344: push 00420FA0h
  '0052B349: push esi
  '0052B34A: push eax
  '0052B34B: call [004010A0h]
  '0052B351: mov ecx, [esi]
  '0052B353: lea edx, [ebp-28h]
  '0052B356: push edx
  '0052B357: push esi
  '0052B358: call [ecx+00000824h]
  '0052B35E: mov eax, [ebp+08h]
  '0052B361: push eax
  '0052B362: mov ecx, [eax]
  '0052B364: call [ecx+08h]
  '0052B367: mov eax, [ebp-04h]
  '0052B36A: mov ecx, [ebp-14h]
  '0052B36D: pop edi
  '0052B36E: pop esi
  '0052B36F: mov fs:[00000000h], ecx
  '0052B376: pop ebx
  '0052B377: mov esp, ebp
  '0052B379: pop ebp
  '0052B37A: retn 0008h
End Sub
Private Sub TrayIcon_52B380
  '0052B380: push ebp
  '0052B381: mov ebp, esp
  '0052B383: sub esp, 0000000Ch
  '0052B386: push 004081B6h
  '0052B38B: mov eax, fs:[00h]
  '0052B391: push eax
  '0052B392: mov fs:[00000000h], esp
  '0052B399: sub esp, 0000000Ch
  '0052B39C: push ebx
  '0052B39D: push esi
  '0052B39E: push edi
  '0052B39F: mov [ebp-0Ch], esp
  '0052B3A2: mov [ebp-08h], 004076C8h
  '0052B3A9: xor edi, edi
  '0052B3AB: mov [ebp-04h], edi
  '0052B3AE: mov esi, [ebp+08h]
  '0052B3B1: push esi
  '0052B3B2: mov eax, [esi]
  '0052B3B4: call [eax+04h]
  '0052B3B7: mov cx, [esi+54h]
  '0052B3BB: mov [ebp-18h], edi
  '0052B3BE: mov [ebp-18h], ecx
  '0052B3C1: mov eax, [ebp+08h]
  '0052B3C4: push eax
  '0052B3C5: mov edx, [eax]
  '0052B3C7: call [edx+08h]
  '0052B3CA: mov eax, [ebp+0Ch]
  '0052B3CD: mov cx, [ebp-18h]
  '0052B3D1: mov [eax], cx
  '0052B3D4: mov eax, [ebp-04h]
  '0052B3D7: mov ecx, [ebp-14h]
  '0052B3DA: pop edi
  '0052B3DB: pop esi
  '0052B3DC: mov fs:[00000000h], ecx
  '0052B3E3: pop ebx
  '0052B3E4: mov esp, ebp
  '0052B3E6: pop ebp
  '0052B3E7: retn 0008h
End Sub
Private Sub TrayIcon_52B3F0
  '0052B3F0: push ebp
  '0052B3F1: mov ebp, esp
  '0052B3F3: sub esp, 0000000Ch
  '0052B3F6: push 004081B6h
  '0052B3FB: mov eax, fs:[00h]
  '0052B401: push eax
  '0052B402: mov fs:[00000000h], esp
  '0052B409: sub esp, 0000001Ch
  '0052B40C: push ebx
  '0052B40D: push esi
  '0052B40E: push edi
  '0052B40F: mov [ebp-0Ch], esp
  '0052B412: mov [ebp-08h], 004076D0h
  '0052B419: mov [ebp-04h], 00000000h
  '0052B420: mov esi, [ebp+08h]
  '0052B423: push esi
  '0052B424: mov eax, [esi]
  '0052B426: call [eax+04h]
  '0052B429: mov cx, [ebp+0Ch]
  '0052B42D: sub esp, 00000010h
  '0052B430: mov [esi+54h], cx
  '0052B434: mov edi, esp
  '0052B436: mov ecx, 00000008h
  '0052B43B: mov edx, [esi]
  '0052B43D: mov [edi], ecx
  '0052B43F: mov ecx, [ebp-20h]
  '0052B442: mov eax, 0042B59Ch
  '0052B447: push esi
  '0052B448: mov [edi+04h], ecx
  '0052B44B: mov [edi+08h], eax
  '0052B44E: mov eax, [ebp-18h]
  '0052B451: mov [edi+0Ch], eax
  '0052B454: call [edx+00000390h]
  '0052B45A: test eax, eax
  '0052B45C: fclex 
  '0052B45E: jnl 52B472h
  '0052B460: push 00000390h
  '0052B465: push 00420FA0h
  '0052B46A: push esi
  '0052B46B: push eax
  '0052B46C: call [004010A0h]
  '0052B472: mov ecx, [esi]
  '0052B474: push esi
  '0052B475: call [ecx+0000081Ch]
  '0052B47B: mov eax, [ebp+08h]
  '0052B47E: push eax
  '0052B47F: mov edx, [eax]
  '0052B481: call [edx+08h]
  '0052B484: mov eax, [ebp-04h]
  '0052B487: mov ecx, [ebp-14h]
  '0052B48A: pop edi
  '0052B48B: pop esi
  '0052B48C: mov fs:[00000000h], ecx
  '0052B493: pop ebx
  '0052B494: mov esp, ebp
  '0052B496: pop ebp
  '0052B497: retn 0008h
End Sub
Private Sub TrayVisible_52B4A0
  '0052B4A0: mov eax, [esp+04h]
  '0052B4A4: push 00000000h
  '0052B4A6: push 00000001h
  '0052B4A8: push eax
  '0052B4A9: call [00401060h]
  '0052B4AF: add esp, 0000000Ch
  '0052B4B2: xor eax, eax
  '0052B4B4: retn 0004h
End Sub
Private Sub unknown_52B4C0
  '0052B4C0: mov eax, [esp+04h]
  '0052B4C4: push 00000000h
  '0052B4C6: push 00000002h
  '0052B4C8: push eax
  '0052B4C9: call [00401060h]
  '0052B4CF: add esp, 0000000Ch
  '0052B4D2: xor eax, eax
  '0052B4D4: retn 0004h
End Sub
Private Sub unknown_52B570
  '0052B570: push ecx
  '0052B571: mov ecx, [esp+08h]
  '0052B575: mov [esp], 00000000h
  '0052B57D: movsx eax, word ptr [ecx+54h]
  '0052B581: cmp eax, FFFFFFFFh
  '0052B584: jz 52B59Eh
  '0052B586: test eax, eax
  '0052B588: jnz 52B5ACh
  '0052B58A: mov eax, [ecx]
  '0052B58C: lea edx, [esp]
  '0052B590: push edx
  '0052B591: push ecx
  '0052B592: call [eax+00000828h]
  '0052B598: xor eax, eax
  '0052B59A: pop ecx
  '0052B59B: retn 0004h
End Sub
Private Sub unknown_52B5C0
  '0052B5C0: push ebp
  '0052B5C1: mov ebp, esp
  '0052B5C3: sub esp, 00000008h
  '0052B5C6: push 004081B6h
  '0052B5CB: mov eax, fs:[00h]
  '0052B5D1: push eax
  '0052B5D2: mov fs:[00000000h], esp
  '0052B5D9: sub esp, 00000190h
  '0052B5DF: push ebx
  '0052B5E0: push esi
  '0052B5E1: push edi
  '0052B5E2: mov [ebp-08h], esp
  '0052B5E5: mov [ebp-04h], 004076E0h
  '0052B5EC: mov esi, [ebp+08h]
  '0052B5EF: mov ecx, 00000026h
  '0052B5F4: xor eax, eax
  '0052B5F6: lea edi, [ebp-000000ACh]
  '0052B5FC: rep stosd 
  '0052B5FE: mov ecx, 00000016h
  '0052B603: lea edi, [ebp-00000194h]
  '0052B609: rep stosd 
  '0052B60B: mov eax, [esi]
  '0052B60D: xor ebx, ebx
  '0052B60F: push esi
  '0052B610: mov [ebp-000000B0h], ebx
  '0052B616: mov [ebp-000000B4h], ebx
  '0052B61C: mov [ebp-000000B8h], ebx
  '0052B622: mov [ebp-000000BCh], ebx
  '0052B628: mov [ebp-000000C0h], ebx
  '0052B62E: mov [ebp-000000C4h], ebx
  '0052B634: mov [ebp-000000C8h], ebx
  '0052B63A: mov [ebp-000000D8h], ebx
  '0052B640: mov [ebp-000000E8h], ebx
  '0052B646: mov [ebp-000000F8h], ebx
  '0052B64C: mov [ebp-00000108h], ebx
  '0052B652: mov [ebp-0000012Ch], ebx
  '0052B658: mov [ebp-000000ACh], 00000058h
  '0052B662: call [eax+000003ACh]
  '0052B668: mov edi, [004010E4h]
  '0052B66E: lea ecx, [ebp-000000B8h]
  '0052B674: push eax
  '0052B675: push ecx
  '0052B676: call edi
  '0052B678: mov edx, [eax]
  '0052B67A: lea ecx, [ebp-0000012Ch]
  '0052B680: push ecx
  '0052B681: push eax
  '0052B682: mov [ebp-00000130h], eax
  '0052B688: call [edx+000001C0h]
  '0052B68E: cmp eax, ebx
  '0052B690: fclex 
  '0052B692: jnl 52B6ACh
  '0052B694: mov edx, [ebp-00000130h]
  '0052B69A: push 000001C0h
  '0052B69F: push 0041C058h
  '0052B6A4: push edx
  '0052B6A5: push eax
  '0052B6A6: call [004010A0h]
  '0052B6AC: mov eax, [ebp-0000012Ch]
  '0052B6B2: lea ecx, [ebp-000000B8h]
  '0052B6B8: mov [ebp-000000A8h], eax
  '0052B6BE: call [004013B8h]
  '0052B6C4: mov eax, [esi+44h]
  '0052B6C7: mov [ebp-000000A4h], 00000001h
  '0052B6D1: dec eax
  '0052B6D2: mov [ebp-000000A0h], 00000007h
  '0052B6DC: mov [ebp-0000009Ch], 00000200h
  '0052B6E6: jz 0052B773h
  '0052B6EC: mov ecx, [esi]
  '0052B6EE: push esi
  '0052B6EF: call [ecx+000003A8h]
  '0052B6F5: lea edx, [ebp-000000B8h]
  '0052B6FB: push eax
  '0052B6FC: push edx
  '0052B6FD: call edi
  '0052B6FF: mov edi, eax
  '0052B701: lea ecx, [ebp-000000BCh]
  '0052B707: push ecx
  '0052B708: push edi
  '0052B709: mov eax, [edi]
  '0052B70B: call [eax+60h]
  '0052B70E: cmp eax, ebx
  '0052B710: fclex 
  '0052B712: jnl 52B723h
  '0052B714: push 00000060h
  '0052B716: push 0041C058h
  '0052B71B: push edi
  '0052B71C: push eax
  '0052B71D: call [004010A0h]
  '0052B723: mov edx, [ebp-000000BCh]
  '0052B729: push ebx
  '0052B72A: push ebx
  '0052B72B: lea eax, [ebp-000000D8h]
  '0052B731: push edx
  '0052B732: push eax
  '0052B733: call [004011E4h]
  '0052B739: add esp, 00000010h
  '0052B73C: push eax
  '0052B73D: call [0040130Ch]
  '0052B743: lea ecx, [ebp-000000BCh]
  '0052B749: lea edx, [ebp-000000B8h]
  '0052B74F: push ecx
  '0052B750: push edx
  '0052B751: push 00000002h
  '0052B753: mov [ebp-00000098h], eax
  '0052B759: call [00401064h]
  '0052B75F: add esp, 0000000Ch
  '0052B762: lea ecx, [ebp-000000D8h]
  '0052B768: call [00401030h]
  '0052B76E: jmp 0052BA74h
  '0052B773: mov eax, [esi]
  '0052B775: push esi
  '0052B776: call [eax+0000082Ch]
  '0052B77C: mov ecx, [esi]
  '0052B77E: push 0042B638h
  '0052B783: push ebx
  '0052B784: push 00000004h
  '0052B786: push esi
  '0052B787: call [ecx+000003B4h]
  '0052B78D: lea edx, [ebp-000000B8h]
  '0052B793: push eax
  '0052B794: push edx
  '0052B795: call edi
  '0052B797: push eax
  '0052B798: lea eax, [ebp-000000D8h]
  '0052B79E: push eax
  '0052B79F: call [004011E4h]
  '0052B7A5: add esp, 00000010h
  '0052B7A8: push eax
  '0052B7A9: call [004011C8h]
  '0052B7AF: lea ecx, [ebp-000000BCh]
  '0052B7B5: push eax
  '0052B7B6: push ecx
  '0052B7B7: call edi
  '0052B7B9: mov ebx, eax
  '0052B7BB: lea eax, [ebp-000000E8h]
  '0052B7C1: mov [ebp-000000E0h], 00000001h
  '0052B7CB: mov [ebp-000000E8h], 00000002h
  '0052B7D5: mov edx, [ebx]
  '0052B7D7: push eax
  '0052B7D8: push ebx
  '0052B7D9: call [edx+3Ch]
  '0052B7DC: test eax, eax
  '0052B7DE: fclex 
  '0052B7E0: jnl 52B7F1h
  '0052B7E2: push 0000003Ch
  '0052B7E4: push 0042B638h
  '0052B7E9: push ebx
  '0052B7EA: push eax
  '0052B7EB: call [004010A0h]
  '0052B7F1: lea ecx, [ebp-000000BCh]
  '0052B7F7: lea edx, [ebp-000000B8h]
  '0052B7FD: push ecx
  '0052B7FE: push edx
  '0052B7FF: push 00000002h
  '0052B801: call [00401064h]
  '0052B807: lea eax, [ebp-000000E8h]
  '0052B80D: lea ecx, [ebp-000000D8h]
  '0052B813: push eax
  '0052B814: push ecx
  '0052B815: push 00000002h
  '0052B817: call [00401050h]
  '0052B81D: mov edx, [esi]
  '0052B81F: add esp, 00000018h
  '0052B822: push esi
  '0052B823: call [edx+000003ACh]
  '0052B829: push eax
  '0052B82A: lea eax, [ebp-000000B8h]
  '0052B830: push eax
  '0052B831: call edi
  '0052B833: mov ebx, eax
  '0052B835: lea edx, [ebp-000000BCh]
  '0052B83B: push edx
  '0052B83C: push ebx
  '0052B83D: mov ecx, [ebx]
  '0052B83F: call [ecx+00000188h]
  '0052B845: test eax, eax
  '0052B847: fclex 
  '0052B849: jnl 52B85Dh
  '0052B84B: push 00000188h
  '0052B850: push 0041C058h
  '0052B855: push ebx
  '0052B856: push eax
  '0052B857: call [004010A0h]
  '0052B85D: mov eax, [esi]
  '0052B85F: push 0042B638h
  '0052B864: push 00000000h
  '0052B866: push 00000004h
  '0052B868: push esi
  '0052B869: call [eax+000003B4h]
  '0052B86F: lea ecx, [ebp-000000C0h]
  '0052B875: push eax
  '0052B876: push ecx
  '0052B877: call edi
  '0052B879: lea edx, [ebp-000000D8h]
  '0052B87F: push eax
  '0052B880: push edx
  '0052B881: call [004011E4h]
  '0052B887: add esp, 00000010h
  '0052B88A: push eax
  '0052B88B: call [004011C8h]
  '0052B891: push eax
  '0052B892: lea eax, [ebp-000000C4h]
  '0052B898: push eax
  '0052B899: call edi
  '0052B89B: mov ebx, eax
  '0052B89D: mov eax, [ebp-000000BCh]
  '0052B8A3: mov [ebp-00000100h], eax
  '0052B8A9: mov eax, 0000000Ah
  '0052B8AE: mov [ebp-000000F8h], eax
  '0052B8B4: mov [ebp-000000E8h], eax
  '0052B8BA: lea edx, [ebp-000000C8h]
  '0052B8C0: lea eax, [ebp-00000108h]
  '0052B8C6: push edx
  '0052B8C7: mov ecx, 80020004h
  '0052B8CC: push eax
  '0052B8CD: lea edx, [ebp-000000F8h]
  '0052B8D3: lea eax, [ebp-000000E8h]
  '0052B8D9: mov [ebp-000000BCh], 00000000h
  '0052B8E3: mov [ebp-00000108h], 00000009h
  '0052B8ED: mov [ebp-000000F0h], ecx
  '0052B8F3: mov [ebp-000000E0h], ecx
  '0052B8F9: mov ecx, [ebx]
  '0052B8FB: push edx
  '0052B8FC: push eax
  '0052B8FD: push ebx
  '0052B8FE: call [ecx+2Ch]
  '0052B901: test eax, eax
  '0052B903: fclex 
  '0052B905: jnl 52B916h
  '0052B907: push 0000002Ch
  '0052B909: push 0042B638h
  '0052B90E: push ebx
  '0052B90F: push eax
  '0052B910: call [004010A0h]
  '0052B916: mov ebx, [00401064h]
  '0052B91C: lea ecx, [ebp-000000C8h]
  '0052B922: lea edx, [ebp-000000C4h]
  '0052B928: push ecx
  '0052B929: lea eax, [ebp-000000C0h]
  '0052B92F: push edx
  '0052B930: lea ecx, [ebp-000000B8h]
  '0052B936: push eax
  '0052B937: push ecx
  '0052B938: push 00000004h
  '0052B93A: call ebx
  '0052B93C: lea edx, [ebp-00000108h]
  '0052B942: lea eax, [ebp-000000F8h]
  '0052B948: push edx
  '0052B949: lea ecx, [ebp-000000E8h]
  '0052B94F: push eax
  '0052B950: lea edx, [ebp-000000D8h]
  '0052B956: push ecx
  '0052B957: push edx
  '0052B958: push 00000004h
  '0052B95A: call [00401050h]
  '0052B960: mov eax, [esi]
  '0052B962: add esp, 00000028h
  '0052B965: push 0042B638h
  '0052B96A: push 00000000h
  '0052B96C: push 00000004h
  '0052B96E: push esi
  '0052B96F: call [eax+000003B4h]
  '0052B975: lea ecx, [ebp-000000B8h]
  '0052B97B: push eax
  '0052B97C: push ecx
  '0052B97D: call edi
  '0052B97F: lea edx, [ebp-000000D8h]
  '0052B985: push eax
  '0052B986: push edx
  '0052B987: call [004011E4h]
  '0052B98D: add esp, 00000010h
  '0052B990: push eax
  '0052B991: call [004011C8h]
  '0052B997: push eax
  '0052B998: lea eax, [ebp-000000BCh]
  '0052B99E: push eax
  '0052B99F: call edi
  '0052B9A1: mov edi, eax
  '0052B9A3: lea edx, [ebp-000000C0h]
  '0052B9A9: lea eax, [ebp-000000E8h]
  '0052B9AF: mov [ebp-000000E0h], 00000001h
  '0052B9B9: mov [ebp-000000E8h], 00000002h
  '0052B9C3: mov ecx, [edi]
  '0052B9C5: push edx
  '0052B9C6: push eax
  '0052B9C7: push edi
  '0052B9C8: call [ecx+24h]
  '0052B9CB: test eax, eax
  '0052B9CD: fclex 
  '0052B9CF: jnl 52B9E0h
  '0052B9D1: push 00000024h
  '0052B9D3: push 0042B638h
  '0052B9D8: push edi
  '0052B9D9: push eax
  '0052B9DA: call [004010A0h]
  '0052B9E0: mov eax, [ebp-000000C0h]
  '0052B9E6: lea edx, [ebp-000000C4h]
  '0052B9EC: push edx
  '0052B9ED: push eax
  '0052B9EE: mov ecx, [eax]
  '0052B9F0: mov edi, eax
  '0052B9F2: call [ecx+40h]
  '0052B9F5: test eax, eax
  '0052B9F7: fclex 
  '0052B9F9: jnl 52BA0Ah
  '0052B9FB: push 00000040h
  '0052B9FD: push 0042B648h
  '0052BA02: push edi
  '0052BA03: push eax
  '0052BA04: call [004010A0h]
  '0052BA0A: mov eax, [ebp-000000C4h]
  '0052BA10: push 00000000h
  '0052BA12: push 00000000h
  '0052BA14: lea ecx, [ebp-000000F8h]
  '0052BA1A: push eax
  '0052BA1B: push ecx
  '0052BA1C: call [004011E4h]
  '0052BA22: add esp, 00000010h
  '0052BA25: push eax
  '0052BA26: call [0040130Ch]
  '0052BA2C: mov [ebp-00000098h], eax
  '0052BA32: lea edx, [ebp-000000C4h]
  '0052BA38: lea eax, [ebp-000000C0h]
  '0052BA3E: push edx
  '0052BA3F: lea ecx, [ebp-000000BCh]
  '0052BA45: push eax
  '0052BA46: lea edx, [ebp-000000B8h]
  '0052BA4C: push ecx
  '0052BA4D: push edx
  '0052BA4E: push 00000004h
  '0052BA50: call ebx
  '0052BA52: lea eax, [ebp-000000F8h]
  '0052BA58: lea ecx, [ebp-000000E8h]
  '0052BA5E: push eax
  '0052BA5F: lea edx, [ebp-000000D8h]
  '0052BA65: push ecx
  '0052BA66: push edx
  '0052BA67: push 00000003h
  '0052BA69: call [00401050h]
  '0052BA6F: add esp, 00000024h
  '0052BA72: xor ebx, ebx
  '0052BA74: mov eax, [esi+48h]
  '0052BA77: push eax
  '0052BA78: push ebx
  '0052BA79: call [0040128Ch]
  '0052BA7F: mov esi, [00401378h]
  '0052BA85: mov edx, eax
  '0052BA87: lea ecx, [ebp-000000B0h]
  '0052BA8D: call esi
  '0052BA8F: push eax
  '0052BA90: call [0040108Ch]
  '0052BA96: mov edx, eax
  '0052BA98: lea ecx, [ebp-000000B4h]
  '0052BA9E: call esi
  '0052BAA0: lea ecx, [ebp-00000094h]
  '0052BAA6: push eax
  '0052BAA7: push ecx
  '0052BAA8: push 00000040h
  '0052BAAA: call [00401090h]
  '0052BAB0: lea edx, [ebp-000000B4h]
  '0052BAB6: lea eax, [ebp-000000B0h]
  '0052BABC: push edx
  '0052BABD: push eax
  '0052BABE: push 00000002h
  '0052BAC0: call [004012E8h]
  '0052BAC6: add esp, 0000000Ch
  '0052BAC9: lea ecx, [ebp-000000ACh]
  '0052BACF: lea edx, [ebp-00000194h]
  '0052BAD5: push ecx
  '0052BAD6: push edx
  '0052BAD7: push 0042101Ch
  '0052BADC: call [004011F8h]
  '0052BAE2: push eax
  '0052BAE3: push ebx
  '0052BAE4: call 00421064h
  '0052BAE9: mov [ebp-0000012Ch], eax
  '0052BAEF: call [0040109Ch]
  '0052BAF5: lea eax, [ebp-00000194h]
  '0052BAFB: lea ecx, [ebp-000000ACh]
  '0052BB01: push eax
  '0052BB02: push ecx
  '0052BB03: push 0042101Ch
  '0052BB08: call [00401078h]
  '0052BB0E: mov edx, [ebp-0000012Ch]
  '0052BB14: push 0052BB88h
  '0052BB19: mov [ebp-14h], edx
  '0052BB1C: jmp 52BB87h
  '0052BB1E: lea eax, [ebp-000000B4h]
  '0052BB24: lea ecx, [ebp-000000B0h]
  '0052BB2A: push eax
  '0052BB2B: push ecx
  '0052BB2C: push 00000002h
  '0052BB2E: call [004012E8h]
  '0052BB34: lea edx, [ebp-000000C8h]
  '0052BB3A: lea eax, [ebp-000000C4h]
  '0052BB40: push edx
  '0052BB41: lea ecx, [ebp-000000C0h]
  '0052BB47: push eax
  '0052BB48: lea edx, [ebp-000000BCh]
  '0052BB4E: push ecx
  '0052BB4F: lea eax, [ebp-000000B8h]
  '0052BB55: push edx
  '0052BB56: push eax
  '0052BB57: push 00000005h
  '0052BB59: call [00401064h]
  '0052BB5F: lea ecx, [ebp-00000108h]
  '0052BB65: lea edx, [ebp-000000F8h]
  '0052BB6B: push ecx
  '0052BB6C: lea eax, [ebp-000000E8h]
  '0052BB72: push edx
  '0052BB73: lea ecx, [ebp-000000D8h]
  '0052BB79: push eax
  '0052BB7A: push ecx
  '0052BB7B: push 00000004h
  '0052BB7D: call [00401050h]
  '0052BB83: add esp, 00000038h
  '0052BB86: ret 
End Sub
Private Sub unknown_52BBB0
  '0052BBB0: push ebp
  '0052BBB1: mov ebp, esp
  '0052BBB3: sub esp, 00000008h
  '0052BBB6: push 004081B6h
  '0052BBBB: mov eax, fs:[00h]
  '0052BBC1: push eax
  '0052BBC2: mov fs:[00000000h], esp
  '0052BBC9: sub esp, 00000194h
  '0052BBCF: push ebx
  '0052BBD0: push esi
  '0052BBD1: push edi
  '0052BBD2: mov [ebp-08h], esp
  '0052BBD5: mov [ebp-04h], 004076F0h
  '0052BBDC: mov esi, [ebp+08h]
  '0052BBDF: mov ecx, 00000026h
  '0052BBE4: xor eax, eax
  '0052BBE6: lea edi, [ebp-000000ACh]
  '0052BBEC: rep stosd 
  '0052BBEE: xor edx, edx
  '0052BBF0: mov ecx, 00000016h
  '0052BBF5: cmp [esi+54h], dx
  '0052BBF9: lea edi, [ebp-00000194h]
  '0052BBFF: mov [ebp-14h], edx
  '0052BC02: mov [ebp-000000B0h], edx
  '0052BC08: mov [ebp-000000B4h], edx
  '0052BC0E: mov [ebp-000000B8h], edx
  '0052BC14: mov [ebp-000000BCh], edx
  '0052BC1A: mov [ebp-000000C0h], edx
  '0052BC20: mov [ebp-000000C4h], edx
  '0052BC26: mov [ebp-000000C8h], edx
  '0052BC2C: mov [ebp-000000D8h], edx
  '0052BC32: mov [ebp-000000E8h], edx
  '0052BC38: mov [ebp-000000F8h], edx
  '0052BC3E: mov [ebp-00000108h], edx
  '0052BC44: mov [ebp-0000012Ch], edx
  '0052BC4A: rep stosd 
  '0052BC4C: jz 0052C10Dh
  '0052BC52: mov eax, [esi]
  '0052BC54: push esi
  '0052BC55: mov [ebp-000000ACh], 00000058h
  '0052BC5F: call [eax+000003ACh]
  '0052BC65: mov edi, [004010E4h]
  '0052BC6B: lea ecx, [ebp-000000B8h]
  '0052BC71: push eax
  '0052BC72: push ecx
  '0052BC73: call edi
  '0052BC75: mov ebx, eax
  '0052BC77: lea eax, [ebp-0000012Ch]
  '0052BC7D: push eax
  '0052BC7E: push ebx
  '0052BC7F: mov edx, [ebx]
  '0052BC81: call [edx+000001C0h]
  '0052BC87: test eax, eax
  '0052BC89: fclex 
  '0052BC8B: jnl 52BC9Fh
  '0052BC8D: push 000001C0h
  '0052BC92: push 0041C058h
  '0052BC97: push ebx
  '0052BC98: push eax
  '0052BC99: call [004010A0h]
  '0052BC9F: mov ecx, [ebp-0000012Ch]
  '0052BCA5: mov [ebp-000000A8h], ecx
  '0052BCAB: lea ecx, [ebp-000000B8h]
  '0052BCB1: call [004013B8h]
  '0052BCB7: mov eax, [esi+44h]
  '0052BCBA: mov [ebp-000000A4h], 00000001h
  '0052BCC4: dec eax
  '0052BCC5: mov [ebp-000000A0h], 00000007h
  '0052BCCF: mov [ebp-0000009Ch], 00000200h
  '0052BCD9: jz 0052BD68h
  '0052BCDF: mov edx, [esi]
  '0052BCE1: push esi
  '0052BCE2: call [edx+000003A8h]
  '0052BCE8: push eax
  '0052BCE9: lea eax, [ebp-000000B8h]
  '0052BCEF: push eax
  '0052BCF0: call edi
  '0052BCF2: mov edi, eax
  '0052BCF4: lea edx, [ebp-000000BCh]
  '0052BCFA: push edx
  '0052BCFB: push edi
  '0052BCFC: mov ecx, [edi]
  '0052BCFE: call [ecx+60h]
  '0052BD01: test eax, eax
  '0052BD03: fclex 
  '0052BD05: jnl 52BD16h
  '0052BD07: push 00000060h
  '0052BD09: push 0041C058h
  '0052BD0E: push edi
  '0052BD0F: push eax
  '0052BD10: call [004010A0h]
  '0052BD16: mov eax, [ebp-000000BCh]
  '0052BD1C: push 00000000h
  '0052BD1E: push 00000000h
  '0052BD20: lea ecx, [ebp-000000D8h]
  '0052BD26: push eax
  '0052BD27: push ecx
  '0052BD28: call [004011E4h]
  '0052BD2E: add esp, 00000010h
  '0052BD31: push eax
  '0052BD32: call [0040130Ch]
  '0052BD38: mov [ebp-00000098h], eax
  '0052BD3E: lea edx, [ebp-000000BCh]
  '0052BD44: lea eax, [ebp-000000B8h]
  '0052BD4A: push edx
  '0052BD4B: push eax
  '0052BD4C: push 00000002h
  '0052BD4E: call [00401064h]
  '0052BD54: add esp, 0000000Ch
  '0052BD57: lea ecx, [ebp-000000D8h]
  '0052BD5D: call [00401030h]
  '0052BD63: jmp 0052C068h
  '0052BD68: mov ecx, [esi]
  '0052BD6A: push esi
  '0052BD6B: call [ecx+0000082Ch]
  '0052BD71: mov edx, [esi]
  '0052BD73: push 0042B638h
  '0052BD78: push 00000000h
  '0052BD7A: push 00000004h
  '0052BD7C: push esi
  '0052BD7D: call [edx+000003B4h]
  '0052BD83: push eax
  '0052BD84: lea eax, [ebp-000000B8h]
  '0052BD8A: push eax
  '0052BD8B: call edi
  '0052BD8D: lea ecx, [ebp-000000D8h]
  '0052BD93: push eax
  '0052BD94: push ecx
  '0052BD95: call [004011E4h]
  '0052BD9B: add esp, 00000010h
  '0052BD9E: push eax
  '0052BD9F: call [004011C8h]
  '0052BDA5: lea edx, [ebp-000000BCh]
  '0052BDAB: push eax
  '0052BDAC: push edx
  '0052BDAD: call edi
  '0052BDAF: mov ebx, eax
  '0052BDB1: lea ecx, [ebp-000000E8h]
  '0052BDB7: mov [ebp-000000E0h], 00000001h
  '0052BDC1: mov [ebp-000000E8h], 00000002h
  '0052BDCB: mov eax, [ebx]
  '0052BDCD: push ecx
  '0052BDCE: push ebx
  '0052BDCF: call [eax+3Ch]
  '0052BDD2: test eax, eax
  '0052BDD4: fclex 
  '0052BDD6: jnl 52BDE7h
  '0052BDD8: push 0000003Ch
  '0052BDDA: push 0042B638h
  '0052BDDF: push ebx
  '0052BDE0: push eax
  '0052BDE1: call [004010A0h]
  '0052BDE7: lea edx, [ebp-000000BCh]
  '0052BDED: lea eax, [ebp-000000B8h]
  '0052BDF3: push edx
  '0052BDF4: push eax
  '0052BDF5: push 00000002h
  '0052BDF7: call [00401064h]
  '0052BDFD: lea ecx, [ebp-000000E8h]
  '0052BE03: lea edx, [ebp-000000D8h]
  '0052BE09: push ecx
  '0052BE0A: push edx
  '0052BE0B: push 00000002h
  '0052BE0D: call [00401050h]
  '0052BE13: mov eax, [esi]
  '0052BE15: add esp, 00000018h
  '0052BE18: push esi
  '0052BE19: call [eax+000003ACh]
  '0052BE1F: lea ecx, [ebp-000000B8h]
  '0052BE25: push eax
  '0052BE26: push ecx
  '0052BE27: call edi
  '0052BE29: mov ebx, eax
  '0052BE2B: lea eax, [ebp-000000BCh]
  '0052BE31: push eax
  '0052BE32: push ebx
  '0052BE33: mov edx, [ebx]
  '0052BE35: call [edx+00000188h]
  '0052BE3B: test eax, eax
  '0052BE3D: fclex 
  '0052BE3F: jnl 52BE53h
  '0052BE41: push 00000188h
  '0052BE46: push 0041C058h
  '0052BE4B: push ebx
  '0052BE4C: push eax
  '0052BE4D: call [004010A0h]
  '0052BE53: mov ecx, [esi]
  '0052BE55: push 0042B638h
  '0052BE5A: push 00000000h
  '0052BE5C: push 00000004h
  '0052BE5E: push esi
  '0052BE5F: call [ecx+000003B4h]
  '0052BE65: lea edx, [ebp-000000C0h]
  '0052BE6B: push eax
  '0052BE6C: push edx
  '0052BE6D: call edi
  '0052BE6F: push eax
  '0052BE70: lea eax, [ebp-000000D8h]
  '0052BE76: push eax
  '0052BE77: call [004011E4h]
  '0052BE7D: add esp, 00000010h
  '0052BE80: push eax
  '0052BE81: call [004011C8h]
  '0052BE87: lea ecx, [ebp-000000C4h]
  '0052BE8D: push eax
  '0052BE8E: push ecx
  '0052BE8F: call edi
  '0052BE91: mov ebx, eax
  '0052BE93: mov eax, [ebp-000000BCh]
  '0052BE99: mov [ebp-00000100h], eax
  '0052BE9F: mov eax, 0000000Ah
  '0052BEA4: mov ecx, 80020004h
  '0052BEA9: mov [ebp-000000F8h], eax
  '0052BEAF: mov [ebp-000000E8h], eax
  '0052BEB5: mov [ebp-000000F0h], ecx
  '0052BEBB: mov [ebp-000000E0h], ecx
  '0052BEC1: lea eax, [ebp-000000C8h]
  '0052BEC7: lea ecx, [ebp-00000108h]
  '0052BECD: push eax
  '0052BECE: push ecx
  '0052BECF: lea eax, [ebp-000000F8h]
  '0052BED5: lea ecx, [ebp-000000E8h]
  '0052BEDB: mov [ebp-000000BCh], 00000000h
  '0052BEE5: mov [ebp-00000108h], 00000009h
  '0052BEEF: mov edx, [ebx]
  '0052BEF1: push eax
  '0052BEF2: push ecx
  '0052BEF3: push ebx
  '0052BEF4: call [edx+2Ch]
  '0052BEF7: test eax, eax
  '0052BEF9: fclex 
  '0052BEFB: jnl 52BF0Ch
  '0052BEFD: push 0000002Ch
  '0052BEFF: push 0042B638h
  '0052BF04: push ebx
  '0052BF05: push eax
  '0052BF06: call [004010A0h]
  '0052BF0C: mov ebx, [00401064h]
  '0052BF12: lea edx, [ebp-000000C8h]
  '0052BF18: lea eax, [ebp-000000C4h]
  '0052BF1E: push edx
  '0052BF1F: lea ecx, [ebp-000000C0h]
  '0052BF25: push eax
  '0052BF26: lea edx, [ebp-000000B8h]
  '0052BF2C: push ecx
  '0052BF2D: push edx
  '0052BF2E: push 00000004h
  '0052BF30: call ebx
  '0052BF32: lea eax, [ebp-00000108h]
  '0052BF38: lea ecx, [ebp-000000F8h]
  '0052BF3E: push eax
  '0052BF3F: lea edx, [ebp-000000E8h]
  '0052BF45: push ecx
  '0052BF46: lea eax, [ebp-000000D8h]
  '0052BF4C: push edx
  '0052BF4D: push eax
  '0052BF4E: push 00000004h
  '0052BF50: call [00401050h]
  '0052BF56: mov ecx, [esi]
  '0052BF58: add esp, 00000028h
  '0052BF5B: push 0042B638h
  '0052BF60: push 00000000h
  '0052BF62: push 00000004h
  '0052BF64: push esi
  '0052BF65: call [ecx+000003B4h]
  '0052BF6B: lea edx, [ebp-000000B8h]
  '0052BF71: push eax
  '0052BF72: push edx
  '0052BF73: call edi
  '0052BF75: push eax
  '0052BF76: lea eax, [ebp-000000D8h]
  '0052BF7C: push eax
  '0052BF7D: call [004011E4h]
  '0052BF83: add esp, 00000010h
  '0052BF86: push eax
  '0052BF87: call [004011C8h]
  '0052BF8D: lea ecx, [ebp-000000BCh]
  '0052BF93: push eax
  '0052BF94: push ecx
  '0052BF95: call edi
  '0052BF97: mov edi, eax
  '0052BF99: lea eax, [ebp-000000C0h]
  '0052BF9F: lea ecx, [ebp-000000E8h]
  '0052BFA5: mov [ebp-000000E0h], 00000001h
  '0052BFAF: mov [ebp-000000E8h], 00000002h
  '0052BFB9: mov edx, [edi]
  '0052BFBB: push eax
  '0052BFBC: push ecx
  '0052BFBD: push edi
  '0052BFBE: call [edx+24h]
  '0052BFC1: test eax, eax
  '0052BFC3: fclex 
  '0052BFC5: jnl 52BFD6h
  '0052BFC7: push 00000024h
  '0052BFC9: push 0042B638h
  '0052BFCE: push edi
  '0052BFCF: push eax
  '0052BFD0: call [004010A0h]
  '0052BFD6: mov eax, [ebp-000000C0h]
  '0052BFDC: lea ecx, [ebp-000000C4h]
  '0052BFE2: push ecx
  '0052BFE3: push eax
  '0052BFE4: mov edx, [eax]
  '0052BFE6: mov edi, eax
  '0052BFE8: call [edx+40h]
  '0052BFEB: test eax, eax
  '0052BFED: fclex 
  '0052BFEF: jnl 52C000h
  '0052BFF1: push 00000040h
  '0052BFF3: push 0042B648h
  '0052BFF8: push edi
  '0052BFF9: push eax
  '0052BFFA: call [004010A0h]
  '0052C000: mov edx, [ebp-000000C4h]
  '0052C006: push 00000000h
  '0052C008: push 00000000h
  '0052C00A: lea eax, [ebp-000000F8h]
  '0052C010: push edx
  '0052C011: push eax
  '0052C012: call [004011E4h]
  '0052C018: add esp, 00000010h
  '0052C01B: push eax
  '0052C01C: call [0040130Ch]
  '0052C022: lea ecx, [ebp-000000C4h]
  '0052C028: mov [ebp-00000098h], eax
  '0052C02E: lea edx, [ebp-000000C0h]
  '0052C034: push ecx
  '0052C035: lea eax, [ebp-000000BCh]
  '0052C03B: push edx
  '0052C03C: lea ecx, [ebp-000000B8h]
  '0052C042: push eax
  '0052C043: push ecx
  '0052C044: push 00000004h
  '0052C046: call ebx
  '0052C048: lea edx, [ebp-000000F8h]
  '0052C04E: lea eax, [ebp-000000E8h]
  '0052C054: push edx
  '0052C055: lea ecx, [ebp-000000D8h]
  '0052C05B: push eax
  '0052C05C: push ecx
  '0052C05D: push 00000003h
  '0052C05F: call [00401050h]
  '0052C065: add esp, 00000024h
  '0052C068: mov edx, [esi+48h]
  '0052C06B: push edx
  '0052C06C: push 00000000h
  '0052C06E: call [0040128Ch]
  '0052C074: mov esi, [00401378h]
  '0052C07A: mov edx, eax
  '0052C07C: lea ecx, [ebp-000000B0h]
  '0052C082: call esi
  '0052C084: push eax
  '0052C085: call [0040108Ch]
  '0052C08B: mov edx, eax
  '0052C08D: lea ecx, [ebp-000000B4h]
  '0052C093: call esi
  '0052C095: push eax
  '0052C096: lea eax, [ebp-00000094h]
  '0052C09C: push eax
  '0052C09D: push 00000040h
  '0052C09F: call [00401090h]
  '0052C0A5: lea ecx, [ebp-000000B4h]
  '0052C0AB: lea edx, [ebp-000000B0h]
  '0052C0B1: push ecx
  '0052C0B2: push edx
  '0052C0B3: push 00000002h
  '0052C0B5: call [004012E8h]
  '0052C0BB: add esp, 0000000Ch
  '0052C0BE: lea eax, [ebp-000000ACh]
  '0052C0C4: lea ecx, [ebp-00000194h]
  '0052C0CA: push eax
  '0052C0CB: push ecx
  '0052C0CC: push 0042101Ch
  '0052C0D1: call [004011F8h]
  '0052C0D7: push eax
  '0052C0D8: push 00000001h
  '0052C0DA: call 00421064h
  '0052C0DF: mov [ebp-0000012Ch], eax
  '0052C0E5: call [0040109Ch]
  '0052C0EB: lea edx, [ebp-00000194h]
  '0052C0F1: lea eax, [ebp-000000ACh]
  '0052C0F7: push edx
  '0052C0F8: push eax
  '0052C0F9: push 0042101Ch
  '0052C0FE: call [00401078h]
  '0052C104: mov ecx, [ebp-0000012Ch]
  '0052C10A: mov [ebp-14h], ecx
  '0052C10D: push 0052C17Eh
  '0052C112: jmp 52C17Dh
  '0052C114: lea edx, [ebp-000000B4h]
  '0052C11A: lea eax, [ebp-000000B0h]
  '0052C120: push edx
  '0052C121: push eax
  '0052C122: push 00000002h
  '0052C124: call [004012E8h]
  '0052C12A: lea ecx, [ebp-000000C8h]
  '0052C130: lea edx, [ebp-000000C4h]
  '0052C136: push ecx
  '0052C137: lea eax, [ebp-000000C0h]
  '0052C13D: push edx
  '0052C13E: lea ecx, [ebp-000000BCh]
  '0052C144: push eax
  '0052C145: lea edx, [ebp-000000B8h]
  '0052C14B: push ecx
  '0052C14C: push edx
  '0052C14D: push 00000005h
  '0052C14F: call [00401064h]
  '0052C155: lea eax, [ebp-00000108h]
  '0052C15B: lea ecx, [ebp-000000F8h]
  '0052C161: push eax
  '0052C162: lea edx, [ebp-000000E8h]
  '0052C168: push ecx
  '0052C169: lea eax, [ebp-000000D8h]
  '0052C16F: push edx
  '0052C170: push eax
  '0052C171: push 00000004h
  '0052C173: call [00401050h]
  '0052C179: add esp, 00000038h
  '0052C17C: ret 
End Sub
Private Sub unknown_52C1A0
  '0052C1A0: push ebp
  '0052C1A1: mov ebp, esp
  '0052C1A3: sub esp, 00000008h
  '0052C1A6: push 004081B6h
  '0052C1AB: mov eax, fs:[00h]
  '0052C1B1: push eax
  '0052C1B2: mov fs:[00000000h], esp
  '0052C1B9: sub esp, 00000108h
  '0052C1BF: push ebx
  '0052C1C0: push esi
  '0052C1C1: push edi
  '0052C1C2: mov [ebp-08h], esp
  '0052C1C5: mov [ebp-04h], 00407700h
  '0052C1CC: mov ecx, 00000026h
  '0052C1D1: xor eax, eax
  '0052C1D3: lea edi, [ebp-000000A8h]
  '0052C1D9: xor ebx, ebx
  '0052C1DB: rep stosd 
  '0052C1DD: mov ecx, 00000016h
  '0052C1E2: lea edi, [ebp-00000114h]
  '0052C1E8: rep stosd 
  '0052C1EA: mov eax, [ebp+08h]
  '0052C1ED: mov [ebp-000000B0h], ebx
  '0052C1F3: push eax
  '0052C1F4: mov [ebp-000000B4h], ebx
  '0052C1FA: mov ecx, [eax]
  '0052C1FC: mov [ebp-000000A8h], 00000058h
  '0052C206: call [ecx+000003ACh]
  '0052C20C: lea edx, [ebp-000000B0h]
  '0052C212: push eax
  '0052C213: push edx
  '0052C214: call [004010E4h]
  '0052C21A: mov esi, eax
  '0052C21C: lea ecx, [ebp-000000B4h]
  '0052C222: push ecx
  '0052C223: push esi
  '0052C224: mov eax, [esi]
  '0052C226: call [eax+000001C0h]
  '0052C22C: cmp eax, ebx
  '0052C22E: fclex 
  '0052C230: jnl 52C244h
  '0052C232: push 000001C0h
  '0052C237: push 0041C058h
  '0052C23C: push esi
  '0052C23D: push eax
  '0052C23E: call [004010A0h]
  '0052C244: mov edx, [ebp-000000B4h]
  '0052C24A: lea ecx, [ebp-000000B0h]
  '0052C250: mov [ebp-000000A4h], edx
  '0052C256: call [004013B8h]
  '0052C25C: lea eax, [ebp-000000A8h]
  '0052C262: lea ecx, [ebp-00000114h]
  '0052C268: push eax
  '0052C269: push ecx
  '0052C26A: push 0042101Ch
  '0052C26F: mov [ebp-000000A0h], 00000001h
  '0052C279: call [004011F8h]
  '0052C27F: push eax
  '0052C280: push 00000002h
  '0052C282: call 00421064h
  '0052C287: mov [ebp-000000B4h], eax
  '0052C28D: call [0040109Ch]
  '0052C293: lea edx, [ebp-00000114h]
  '0052C299: lea eax, [ebp-000000A8h]
  '0052C29F: push edx
  '0052C2A0: push eax
  '0052C2A1: push 0042101Ch
  '0052C2A6: call [00401078h]
  '0052C2AC: mov ecx, [ebp-000000B4h]
  '0052C2B2: push 0052C2CDh
  '0052C2B7: mov [ebp-000000ACh], ecx
  '0052C2BD: jmp 52C2CCh
  '0052C2BF: lea ecx, [ebp-000000B0h]
  '0052C2C5: call [004013B8h]
  '0052C2CB: ret 
End Sub
Private Sub n/a_52C2F0
  '0052C2F0: push ebp
  '0052C2F1: mov ebp, esp
  '0052C2F3: sub esp, 00000008h
  '0052C2F6: push 004081B6h
  '0052C2FB: mov eax, fs:[00h]
  '0052C301: push eax
  '0052C302: mov fs:[00000000h], esp
  '0052C309: sub esp, 000000D8h
  '0052C30F: push ebx
  '0052C310: push esi
  '0052C311: push edi
  '0052C312: mov [ebp-08h], esp
  '0052C315: mov [ebp-04h], 00407710h
  '0052C31C: mov esi, [ebp+08h]
  '0052C31F: xor ebx, ebx
  '0052C321: push esi
  '0052C322: mov [ebp-20h], ebx
  '0052C325: mov eax, [esi]
  '0052C327: mov [ebp-24h], ebx
  '0052C32A: mov [ebp-28h], ebx
  '0052C32D: mov [ebp-2Ch], ebx
  '0052C330: mov [ebp-30h], ebx
  '0052C333: mov [ebp-34h], ebx
  '0052C336: mov [ebp-000000A8h], ebx
  '0052C33C: mov [ebp-000000ACh], ebx
  '0052C342: call [eax+000003ACh]
  '0052C348: mov edi, [004010E4h]
  '0052C34E: lea ecx, [ebp-20h]
  '0052C351: push eax
  '0052C352: push ecx
  '0052C353: call edi
  '0052C355: mov edx, [eax]
  '0052C357: lea ecx, [ebp-000000A8h]
  '0052C35D: push ecx
  '0052C35E: push eax
  '0052C35F: mov [ebp-000000B0h], eax
  '0052C365: call [edx+50h]
  '0052C368: cmp eax, ebx
  '0052C36A: fclex 
  '0052C36C: jnl 52C383h
  '0052C36E: mov edx, [ebp-000000B0h]
  '0052C374: push 00000050h
  '0052C376: push 0041C058h
  '0052C37B: push edx
  '0052C37C: push eax
  '0052C37D: call [004010A0h]
  '0052C383: mov eax, [ebp-000000A8h]
  '0052C389: mov ebx, [004013B8h]
  '0052C38F: lea ecx, [ebp-20h]
  '0052C392: mov [ebp-14h], eax
  '0052C395: call ebx
  '0052C397: mov ecx, [esi]
  '0052C399: push esi
  '0052C39A: call [ecx+000003ACh]
  '0052C3A0: lea edx, [ebp-20h]
  '0052C3A3: push eax
  '0052C3A4: push edx
  '0052C3A5: call edi
  '0052C3A7: mov ecx, [eax]
  '0052C3A9: lea edx, [ebp-000000A8h]
  '0052C3AF: push edx
  '0052C3B0: push eax
  '0052C3B1: mov [ebp-000000B0h], eax
  '0052C3B7: call [ecx+68h]
  '0052C3BA: test eax, eax
  '0052C3BC: fclex 
  '0052C3BE: jnl 52C3D5h
  '0052C3C0: mov ecx, [ebp-000000B0h]
  '0052C3C6: push 00000068h
  '0052C3C8: push 0041C058h
  '0052C3CD: push ecx
  '0052C3CE: push eax
  '0052C3CF: call [004010A0h]
  '0052C3D5: mov edx, [ebp-000000A8h]
  '0052C3DB: lea ecx, [ebp-20h]
  '0052C3DE: mov [ebp-18h], edx
  '0052C3E1: call ebx
  '0052C3E3: mov eax, [esi]
  '0052C3E5: push esi
  '0052C3E6: call [eax+000003ACh]
  '0052C3EC: lea ecx, [ebp-20h]
  '0052C3EF: push eax
  '0052C3F0: push ecx
  '0052C3F1: call edi
  '0052C3F3: mov edx, [eax]
  '0052C3F5: push eax
  '0052C3F6: mov [ebp-000000B0h], eax
  '0052C3FC: call [edx+00000278h]
  '0052C402: test eax, eax
  '0052C404: fclex 
  '0052C406: jnl 52C420h
  '0052C408: mov ecx, [ebp-000000B0h]
  '0052C40E: push 00000278h
  '0052C413: push 0041C058h
  '0052C418: push ecx
  '0052C419: push eax
  '0052C41A: call [004010A0h]
  '0052C420: lea ecx, [ebp-20h]
  '0052C423: call ebx
  '0052C425: mov edx, [esi]
  '0052C427: push esi
  '0052C428: call [edx+000003A8h]
  '0052C42E: push eax
  '0052C42F: lea eax, [ebp-20h]
  '0052C432: push eax
  '0052C433: call edi
  '0052C435: mov ecx, [eax]
  '0052C437: push eax
  '0052C438: mov [ebp-000000B0h], eax
  '0052C43E: call [ecx+00000278h]
  '0052C444: test eax, eax
  '0052C446: fclex 
  '0052C448: jnl 52C462h
  '0052C44A: mov edx, [ebp-000000B0h]
  '0052C450: push 00000278h
  '0052C455: push 0041C058h
  '0052C45A: push edx
  '0052C45B: push eax
  '0052C45C: call [004010A0h]
  '0052C462: lea ecx, [ebp-20h]
  '0052C465: call ebx
  '0052C467: mov eax, [esi]
  '0052C469: push esi
  '0052C46A: call [eax+000003ACh]
  '0052C470: lea ecx, [ebp-20h]
  '0052C473: push eax
  '0052C474: push ecx
  '0052C475: call edi
  '0052C477: mov ecx, [ebp-14h]
  '0052C47A: mov edx, [eax]
  '0052C47C: push ecx
  '0052C47D: push eax
  '0052C47E: mov [ebp-000000B0h], eax
  '0052C484: call [edx+6Ch]
  '0052C487: test eax, eax
  '0052C489: fclex 
  '0052C48B: jnl 52C4A2h
  '0052C48D: mov edx, [ebp-000000B0h]
  '0052C493: push 0000006Ch
  '0052C495: push 0041C058h
  '0052C49A: push edx
  '0052C49B: push eax
  '0052C49C: call [004010A0h]
  '0052C4A2: lea ecx, [ebp-20h]
  '0052C4A5: call ebx
  '0052C4A7: mov eax, [esi]
  '0052C4A9: push esi
  '0052C4AA: call [eax+000003ACh]
  '0052C4B0: lea ecx, [ebp-20h]
  '0052C4B3: push eax
  '0052C4B4: push ecx
  '0052C4B5: call edi
  '0052C4B7: movsx ecx, word ptr [esi+3Eh]
  '0052C4BB: mov [ebp-000000DCh], ecx
  '0052C4C1: push 00000000h
  '0052C4C3: fild dword ptr [ebp-000000DCh]
  '0052C4C9: mov edx, [eax]
  '0052C4CB: mov [ebp-000000B0h], eax
  '0052C4D1: fstp real4 ptr [ebp-000000E0h]
  '0052C4D7: mov ecx, [ebp-000000E0h]
  '0052C4DD: push ecx
  '0052C4DE: movsx ecx, word ptr [esi+3Ch]
  '0052C4E2: mov [ebp-000000E4h], ecx
  '0052C4E8: fild dword ptr [ebp-000000E4h]
  '0052C4EE: fstp real4 ptr [ebp-000000E8h]
  '0052C4F4: mov ecx, [ebp-000000E8h]
  '0052C4FA: push ecx
  '0052C4FB: push 00000000h
  '0052C4FD: push eax
  '0052C4FE: call [edx+00000288h]
  '0052C504: test eax, eax
  '0052C506: fclex 
  '0052C508: jnl 52C522h
  '0052C50A: mov edx, [ebp-000000B0h]
  '0052C510: push 00000288h
  '0052C515: push 0041C058h
  '0052C51A: push edx
  '0052C51B: push eax
  '0052C51C: call [004010A0h]
  '0052C522: lea ecx, [ebp-20h]
  '0052C525: call ebx
  '0052C527: mov eax, [esi]
  '0052C529: push esi
  '0052C52A: call [eax+000003ACh]
  '0052C530: lea ecx, [ebp-20h]
  '0052C533: push eax
  '0052C534: push ecx
  '0052C535: call edi
  '0052C537: mov ecx, [ebp-18h]
  '0052C53A: mov edx, [eax]
  '0052C53C: push ecx
  '0052C53D: push eax
  '0052C53E: mov [ebp-000000B0h], eax
  '0052C544: call [edx+6Ch]
  '0052C547: test eax, eax
  '0052C549: fclex 
  '0052C54B: jnl 52C562h
  '0052C54D: mov edx, [ebp-000000B0h]
  '0052C553: push 0000006Ch
  '0052C555: push 0041C058h
  '0052C55A: push edx
  '0052C55B: push eax
  '0052C55C: call [004010A0h]
  '0052C562: lea ecx, [ebp-20h]
  '0052C565: call ebx
  '0052C567: mov eax, [esi]
  '0052C569: push esi
  '0052C56A: call [eax+000003ACh]
  '0052C570: lea ecx, [ebp-24h]
  '0052C573: push eax
  '0052C574: push ecx
  '0052C575: call edi
  '0052C577: mov edx, [esi+50h]
  '0052C57A: mov eax, [ebp-24h]
  '0052C57D: push edx
  '0052C57E: push eax
  '0052C57F: lea eax, [ebp-20h]
  '0052C582: mov [ebp-24h], 00000000h
  '0052C589: push eax
  '0052C58A: call edi
  '0052C58C: push eax
  '0052C58D: push 0041E878h
  '0052C592: call [004011A0h]
  '0052C598: lea ecx, [ebp-24h]
  '0052C59B: lea edx, [ebp-20h]
  '0052C59E: push ecx
  '0052C59F: push edx
  '0052C5A0: push 00000002h
  '0052C5A2: call [00401064h]
  '0052C5A8: mov eax, [esi]
  '0052C5AA: add esp, 00000018h
  '0052C5AD: push esi
  '0052C5AE: call [eax+000003ACh]
  '0052C5B4: lea ecx, [ebp-20h]
  '0052C5B7: push eax
  '0052C5B8: push ecx
  '0052C5B9: call edi
  '0052C5BB: mov ebx, eax
  '0052C5BD: lea eax, [ebp-24h]
  '0052C5C0: push eax
  '0052C5C1: push ebx
  '0052C5C2: mov edx, [ebx]
  '0052C5C4: call [edx+00000188h]
  '0052C5CA: test eax, eax
  '0052C5CC: fclex 
  '0052C5CE: jnl 52C5E2h
  '0052C5D0: push 00000188h
  '0052C5D5: push 0041C058h
  '0052C5DA: push ebx
  '0052C5DB: push eax
  '0052C5DC: call [004010A0h]
  '0052C5E2: mov ecx, [esi]
  '0052C5E4: push esi
  '0052C5E5: call [ecx+000003A8h]
  '0052C5EB: lea edx, [ebp-28h]
  '0052C5EE: push eax
  '0052C5EF: push edx
  '0052C5F0: call edi
  '0052C5F2: mov ebx, eax
  '0052C5F4: lea ecx, [ebp-000000A8h]
  '0052C5FA: push ecx
  '0052C5FB: push ebx
  '0052C5FC: mov eax, [ebx]
  '0052C5FE: call [eax+00000108h]
  '0052C604: test eax, eax
  '0052C606: fclex 
  '0052C608: jnl 52C61Ch
  '0052C60A: push 00000108h
  '0052C60F: push 0041C058h
  '0052C614: push ebx
  '0052C615: push eax
  '0052C616: call [004010A0h]
  '0052C61C: mov edx, [esi]
  '0052C61E: push esi
  '0052C61F: call [edx+000003A8h]
  '0052C625: push eax
  '0052C626: lea eax, [ebp-2Ch]
  '0052C629: push eax
  '0052C62A: call edi
  '0052C62C: mov ebx, eax
  '0052C62E: lea edx, [ebp-000000ACh]
  '0052C634: push edx
  '0052C635: push ebx
  '0052C636: mov ecx, [ebx]
  '0052C638: call [ecx+00000110h]
  '0052C63E: test eax, eax
  '0052C640: fclex 
  '0052C642: jnl 52C656h
  '0052C644: push 00000110h
  '0052C649: push 0041C058h
  '0052C64E: push ebx
  '0052C64F: push eax
  '0052C650: call [004010A0h]
  '0052C656: mov eax, [esi]
  '0052C658: push esi
  '0052C659: call [eax+000003A8h]
  '0052C65F: lea ecx, [ebp-34h]
  '0052C662: push eax
  '0052C663: push ecx
  '0052C664: call edi
  '0052C666: mov edx, [ebp-24h]
  '0052C669: sub esp, 00000010h
  '0052C66C: mov [ebp-000000D8h], edx
  '0052C672: mov edx, esp
  '0052C674: mov ecx, 0000000Ah
  '0052C679: mov esi, eax
  '0052C67B: mov [edx], ecx
  '0052C67D: mov [ebp-64h], ecx
  '0052C680: mov ecx, [ebp-000000A0h]
  '0052C686: mov eax, 80020004h
  '0052C68B: mov [edx+04h], ecx
  '0052C68E: mov [ebp-5Ch], eax
  '0052C691: sub esp, 00000010h
  '0052C694: mov [ebp-44h], 00000004h
  '0052C69B: mov [edx+08h], eax
  '0052C69E: mov eax, [ebp-00000098h]
  '0052C6A4: mov ecx, esp
  '0052C6A6: sub esp, 00000010h
  '0052C6A9: mov [edx+0Ch], eax
  '0052C6AC: mov edx, [ebp-00000090h]
  '0052C6B2: mov eax, 0000000Ah
  '0052C6B7: mov [ebp-24h], 00000000h
  '0052C6BE: mov [ecx], eax
  '0052C6C0: mov eax, 80020004h
  '0052C6C5: mov ebx, [esi]
  '0052C6C7: mov [ecx+04h], edx
  '0052C6CA: mov edx, [ebp-80h]
  '0052C6CD: mov [ecx+08h], eax
  '0052C6D0: mov eax, [ebp-00000088h]
  '0052C6D6: mov [ecx+0Ch], eax
  '0052C6D9: mov ecx, esp
  '0052C6DB: mov eax, 0000000Ah
  '0052C6E0: sub esp, 00000010h
  '0052C6E3: mov [ecx], eax
  '0052C6E5: mov eax, 80020004h
  '0052C6EA: mov [ecx+04h], edx
  '0052C6ED: mov edx, [ebp-70h]
  '0052C6F0: mov [ecx+08h], eax
  '0052C6F3: mov eax, [ebp-78h]
  '0052C6F6: mov [ecx+0Ch], eax
  '0052C6F9: mov ecx, esp
  '0052C6FB: mov eax, 0000000Ah
  '0052C700: sub esp, 00000010h
  '0052C703: mov [ecx], eax
  '0052C705: mov eax, 80020004h
  '0052C70A: mov [ecx+04h], edx
  '0052C70D: mov edx, [ebp-64h]
  '0052C710: mov [ecx+08h], eax
  '0052C713: mov eax, [ebp-68h]
  '0052C716: mov [ecx+0Ch], eax
  '0052C719: mov eax, [ebp-60h]
  '0052C71C: mov ecx, esp
  '0052C71E: sub esp, 00000010h
  '0052C721: mov [ecx], edx
  '0052C723: mov edx, [ebp-5Ch]
  '0052C726: mov [ecx+04h], eax
  '0052C729: mov eax, [ebp-58h]
  '0052C72C: mov [ecx+08h], edx
  '0052C72F: mov edx, [ebp-50h]
  '0052C732: mov [ecx+0Ch], eax
  '0052C735: mov ecx, esp
  '0052C737: mov eax, 00000004h
  '0052C73C: sub esp, 00000010h
  '0052C73F: mov [ecx], eax
  '0052C741: mov eax, [ebp-000000ACh]
  '0052C747: mov [ecx+04h], edx
  '0052C74A: mov edx, [ebp-44h]
  '0052C74D: mov [ecx+08h], eax
  '0052C750: mov eax, [ebp-48h]
  '0052C753: mov [ecx+0Ch], eax
  '0052C756: mov eax, [ebp-40h]
  '0052C759: mov ecx, esp
  '0052C75B: mov [ecx], edx
  '0052C75D: mov [ecx+04h], eax
  '0052C760: mov eax, [ebp-000000A8h]
  '0052C766: mov edx, [ebp-38h]
  '0052C769: mov [ecx+08h], eax
  '0052C76C: mov eax, [ebp-000000D8h]
  '0052C772: push 00000000h
  '0052C774: push 00000000h
  '0052C776: mov [ecx+0Ch], edx
  '0052C779: lea ecx, [ebp-30h]
  '0052C77C: push eax
  '0052C77D: push ecx
  '0052C77E: call edi
  '0052C780: push eax
  '0052C781: push esi
  '0052C782: call [ebx+00000280h]
  '0052C788: test eax, eax
  '0052C78A: fclex 
  '0052C78C: jnl 52C7A0h
  '0052C78E: push 00000280h
  '0052C793: push 0041C058h
  '0052C798: push esi
  '0052C799: push eax
  '0052C79A: call [004010A0h]
  '0052C7A0: lea edx, [ebp-34h]
  '0052C7A3: lea eax, [ebp-30h]
  '0052C7A6: push edx
  '0052C7A7: lea ecx, [ebp-2Ch]
  '0052C7AA: push eax
  '0052C7AB: lea edx, [ebp-28h]
  '0052C7AE: push ecx
  '0052C7AF: lea eax, [ebp-20h]
  '0052C7B2: push edx
  '0052C7B3: push eax
  '0052C7B4: push 00000005h
  '0052C7B6: call [00401064h]
  '0052C7BC: add esp, 00000018h
  '0052C7BF: wait 
  '0052C7C0: push 0052C7ECh
  '0052C7C5: jmp 52C7EBh
  '0052C7C7: lea ecx, [ebp-34h]
  '0052C7CA: lea edx, [ebp-30h]
  '0052C7CD: push ecx
  '0052C7CE: lea eax, [ebp-2Ch]
  '0052C7D1: push edx
  '0052C7D2: lea ecx, [ebp-28h]
  '0052C7D5: push eax
  '0052C7D6: lea edx, [ebp-24h]
  '0052C7D9: push ecx
  '0052C7DA: lea eax, [ebp-20h]
  '0052C7DD: push edx
  '0052C7DE: push eax
  '0052C7DF: push 00000006h
  '0052C7E1: call [00401064h]
  '0052C7E7: add esp, 0000001Ch
  '0052C7EA: ret 
End Sub

