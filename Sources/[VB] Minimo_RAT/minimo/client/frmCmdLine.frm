VERSION 5.00
Begin VB.Form frmCmdLine
  Caption = "MiniMo Remote Cmd Line"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  Icon = "frmCmdLine.frx":0
  LinkTopic = "Form2"
  MaxButton = 0   'False
  ClientLeft = 165
  ClientTop = 450
  ClientWidth = 6480
  ClientHeight = 4935
  BeginProperty Font
    Name = "Tahoma"
    Size = 8.25
    Charset = 0
    Weight = 400
    Underline = 0 'False
    Italic = 0 'False
    Strikethrough = 0 'False
  EndProperty
  StartUpPosition = 1 'CenterOwner
  Begin VB.CommandButton cmdExecute
    Caption = "Execute Cmd"
    Left = 5100
    Top = 0
    Width = 1335
    Height = 300
    TabIndex = 3
  End
  Begin VB.ComboBox Combo1
    Left = 0
    Top = 0
    Width = 5055
    Height = 315
    Text = "<enter commands here>"
    TabIndex = 2
  End
  Begin VB.TextBox txtResult
    Left = 0
    Top = 360
    Width = 6460
    Height = 4300
    TabIndex = 1
    MultiLine = -1  'True
    ScrollBars = 2
  End
  Begin MSComctlLib.StatusBar StatusBar1
    Left = 0
    Top = 4680
    Width = 6480
    Height = 255
    TabIndex = 0
  End
  Begin VB.Menu options_menu
    Caption = "Options"
    Begin VB.Menu edit_commands
      Caption = "Edit default commands"
    End
    Begin VB.Menu save_data
      Caption = "Save Data"
    End
    Begin VB.Menu clear_data
      Caption = "Clear Data"
    End
  End
End

Attribute VB_Name = "frmCmdLine"

Private Sub edit_commands__53F080
  '0053F080: push ebp
  '0053F081: mov ebp, esp
  '0053F083: sub esp, 0000000Ch
  '0053F086: push 004081B6h
  '0053F08B: mov eax, fs:[00h]
  '0053F091: push eax
  '0053F092: mov fs:[00000000h], esp
  '0053F099: sub esp, 00000020h
  '0053F09C: push ebx
  '0053F09D: push esi
  '0053F09E: push edi
  '0053F09F: mov [ebp-0Ch], esp
  '0053F0A2: mov [ebp-08h], 00408110h
  '0053F0A9: mov esi, [ebp+08h]
  '0053F0AC: mov eax, esi
  '0053F0AE: and eax, 00000001h
  '0053F0B1: mov [ebp-04h], eax
  '0053F0B4: and esi, FFFFFFFEh
  '0053F0B7: push esi
  '0053F0B8: mov [ebp+08h], esi
  '0053F0BB: mov ecx, [esi]
  '0053F0BD: call [ecx+04h]
  '0053F0C0: mov edx, [005410FCh]
  '0053F0C6: xor eax, eax
  '0053F0C8: push edx
  '0053F0C9: push 0042D71Ch
  '0053F0CE: mov [ebp-18h], eax
  '0053F0D1: mov [ebp-1Ch], eax
  '0053F0D4: mov [ebp-20h], eax
  '0053F0D7: mov [ebp-24h], eax
  '0053F0DA: mov [ebp-28h], eax
  '0053F0DD: call [0040108Ch]
  '0053F0E3: mov edx, eax
  '0053F0E5: lea ecx, [ebp-18h]
  '0053F0E8: call [00401378h]
  '0053F0EE: push eax
  '0053F0EF: call 00520140h
  '0053F0F4: xor ecx, ecx
  '0053F0F6: mov ebx, [004013B4h]
  '0053F0FC: cmp ax, FFFFh
  '0053F100: setz cl
  '0053F103: neg ecx
  '0053F105: mov edi, ecx
  '0053F107: lea ecx, [ebp-18h]
  '0053F10A: call ebx
  '0053F10C: test di, di
  '0053F10F: jz 0053F1AFh
  '0053F115: mov edi, [00401330h]
  '0053F11B: push 00000001h
  '0053F11D: lea edx, [ebp-28h]
  '0053F120: push 0041BC60h
  '0053F125: push edx
  '0053F126: call edi
  '0053F128: push eax
  '0053F129: lea eax, [ebp-24h]
  '0053F12C: push 0041BC60h
  '0053F131: push eax
  '0053F132: call edi
  '0053F134: mov ecx, [005410FCh]
  '0053F13A: push eax
  '0053F13B: push ecx
  '0053F13C: push 0042D71Ch
  '0053F141: call [0040108Ch]
  '0053F147: mov edx, eax
  '0053F149: lea ecx, [ebp-1Ch]
  '0053F14C: call [00401378h]
  '0053F152: lea edx, [ebp-20h]
  '0053F155: push eax
  '0053F156: push edx
  '0053F157: call edi
  '0053F159: push eax
  '0053F15A: lea eax, [ebp-18h]
  '0053F15D: push 0041FD78h
  '0053F162: push eax
  '0053F163: call edi
  '0053F165: push eax
  '0053F166: push 00000000h
  '0053F168: call 0041DC2Ch
  '0053F16D: call [0040109Ch]
  '0053F173: lea ecx, [ebp-28h]
  '0053F176: lea edx, [ebp-24h]
  '0053F179: push ecx
  '0053F17A: lea eax, [ebp-20h]
  '0053F17D: push edx
  '0053F17E: lea ecx, [ebp-1Ch]
  '0053F181: push eax
  '0053F182: lea edx, [ebp-18h]
  '0053F185: push ecx
  '0053F186: push edx
  '0053F187: push 00000005h
  '0053F189: call [004012E8h]
  '0053F18F: add esp, 00000018h
  '0053F192: mov edx, 0042D744h
  '0053F197: lea ecx, [ebp-18h]
  '0053F19A: call [004012D8h]
  '0053F1A0: mov eax, [esi]
  '0053F1A2: lea ecx, [ebp-18h]
  '0053F1A5: push ecx
  '0053F1A6: push esi
  '0053F1A7: call [eax+00000710h]
  '0053F1AD: jmp 53F1CAh
  '0053F1AF: mov edx, 00422E58h
  '0053F1B4: lea ecx, [ebp-18h]
  '0053F1B7: call [004012D8h]
  '0053F1BD: mov edx, [esi]
  '0053F1BF: lea eax, [ebp-18h]
  '0053F1C2: push eax
  '0053F1C3: push esi
  '0053F1C4: call [edx+00000710h]
  '0053F1CA: lea ecx, [ebp-18h]
  '0053F1CD: call ebx
  '0053F1CF: mov [ebp-04h], 00000000h
  '0053F1D6: push 0053F1FEh
  '0053F1DB: jmp 53F1FDh
  '0053F1DD: lea ecx, [ebp-28h]
  '0053F1E0: lea edx, [ebp-24h]
  '0053F1E3: push ecx
  '0053F1E4: lea eax, [ebp-20h]
  '0053F1E7: push edx
  '0053F1E8: lea ecx, [ebp-1Ch]
  '0053F1EB: push eax
  '0053F1EC: lea edx, [ebp-18h]
  '0053F1EF: push ecx
  '0053F1F0: push edx
  '0053F1F1: push 00000005h
  '0053F1F3: call [004012E8h]
  '0053F1F9: add esp, 00000018h
  '0053F1FC: ret 
End Sub
Private Sub cmdExecute__53EC20
  '0053EC20: push ebp
  '0053EC21: mov ebp, esp
  '0053EC23: sub esp, 0000000Ch
  '0053EC26: push 004081B6h
  '0053EC2B: mov eax, fs:[00h]
  '0053EC31: push eax
  '0053EC32: mov fs:[00000000h], esp
  '0053EC39: sub esp, 00000070h
  '0053EC3C: push ebx
  '0053EC3D: push esi
  '0053EC3E: push edi
  '0053EC3F: mov [ebp-0Ch], esp
  '0053EC42: mov [ebp-08h], 00408100h
  '0053EC49: mov esi, [ebp+08h]
  '0053EC4C: mov eax, esi
  '0053EC4E: and eax, 00000001h
  '0053EC51: mov [ebp-04h], eax
  '0053EC54: and esi, FFFFFFFEh
  '0053EC57: push esi
  '0053EC58: mov [ebp+08h], esi
  '0053EC5B: mov ecx, [esi]
  '0053EC5D: call [ecx+04h]
  '0053EC60: mov edx, [esi]
  '0053EC62: xor ebx, ebx
  '0053EC64: push esi
  '0053EC65: mov [ebp-18h], ebx
  '0053EC68: mov [ebp-1Ch], ebx
  '0053EC6B: mov [ebp-20h], ebx
  '0053EC6E: mov [ebp-24h], ebx
  '0053EC71: mov [ebp-28h], ebx
  '0053EC74: mov [ebp-2Ch], ebx
  '0053EC77: mov [ebp-3Ch], ebx
  '0053EC7A: mov [ebp-4Ch], ebx
  '0053EC7D: mov [ebp-60h], ebx
  '0053EC80: call [edx+00000304h]
  '0053EC86: push eax
  '0053EC87: lea eax, [ebp-28h]
  '0053EC8A: push eax
  '0053EC8B: call [004010E4h]
  '0053EC91: mov edi, eax
  '0053EC93: push ebx
  '0053EC94: push edi
  '0053EC95: mov ecx, [edi]
  '0053EC97: call [ecx+000000A4h]
  '0053EC9D: cmp eax, ebx
  '0053EC9F: fclex 
  '0053ECA1: jnl 53ECB5h
  '0053ECA3: push 000000A4h
  '0053ECA8: push 0041E3FCh
  '0053ECAD: push edi
  '0053ECAE: push eax
  '0053ECAF: call [004010A0h]
  '0053ECB5: lea ecx, [ebp-28h]
  '0053ECB8: call [004013B8h]
  '0053ECBE: mov edx, [esi]
  '0053ECC0: push esi
  '0053ECC1: call [edx+00000300h]
  '0053ECC7: push eax
  '0053ECC8: lea eax, [ebp-28h]
  '0053ECCB: push eax
  '0053ECCC: call [004010E4h]
  '0053ECD2: mov edi, eax
  '0053ECD4: lea edx, [ebp-18h]
  '0053ECD7: push edx
  '0053ECD8: push edi
  '0053ECD9: mov ecx, [edi]
  '0053ECDB: call [ecx+000000A8h]
  '0053ECE1: cmp eax, ebx
  '0053ECE3: fclex 
  '0053ECE5: jnl 53ECF9h
  '0053ECE7: push 000000A8h
  '0053ECEC: push 0041C0C4h
  '0053ECF1: push edi
  '0053ECF2: push eax
  '0053ECF3: call [004010A0h]
  '0053ECF9: mov eax, [ebp-18h]
  '0053ECFC: push eax
  '0053ECFD: push ebx
  '0053ECFE: call [00401184h]
  '0053ED04: mov edi, eax
  '0053ED06: lea ecx, [ebp-18h]
  '0053ED09: neg edi
  '0053ED0B: sbb edi, edi
  '0053ED0D: inc edi
  '0053ED0E: neg edi
  '0053ED10: call [004013B4h]
  '0053ED16: lea ecx, [ebp-28h]
  '0053ED19: call [004013B8h]
  '0053ED1F: cmp di, bx
  '0053ED22: jz 53ED4Dh
  '0053ED24: mov edx, 0042D64Ch
  '0053ED29: lea ecx, [ebp-18h]
  '0053ED2C: call [004012D8h]
  '0053ED32: mov ecx, [esi]
  '0053ED34: lea edx, [ebp-18h]
  '0053ED37: push edx
  '0053ED38: push esi
  '0053ED39: call [ecx+00000710h]
  '0053ED3F: lea ecx, [ebp-18h]
  '0053ED42: call [004013B4h]
  '0053ED48: jmp 0053F019h
  '0053ED4D: mov eax, [esi]
  '0053ED4F: lea ecx, [ebp-18h]
  '0053ED52: push ecx
  '0053ED53: push esi
  '0053ED54: call [eax+000001C0h]
  '0053ED5A: cmp eax, ebx
  '0053ED5C: fclex 
  '0053ED5E: jnl 53ED72h
  '0053ED60: push 000001C0h
  '0053ED65: push 0041F540h
  '0053ED6A: push esi
  '0053ED6B: push eax
  '0053ED6C: call [004010A0h]
  '0053ED72: mov eax, [ebp-18h]
  '0053ED75: lea edx, [ebp-3Ch]
  '0053ED78: push edx
  '0053ED79: push 00000004h
  '0053ED7B: push eax
  '0053ED7C: mov [ebp-34h], 80020004h
  '0053ED83: mov [ebp-3Ch], 0000000Ah
  '0053ED8A: call [00401148h]
  '0053ED90: mov edx, eax
  '0053ED92: lea ecx, [ebp-1Ch]
  '0053ED95: call [00401378h]
  '0053ED9B: push eax
  '0053ED9C: call [004013BCh]
  '0053EDA2: mov eax, [541024h]
  '0053EDA7: fstp real8 ptr [ebp-68h]
  '0053EDAA: cmp eax, ebx
  '0053EDAC: jnz 53EDC3h
  '0053EDAE: push 00541024h
  '0053EDB3: push 00413334h
  '0053EDB8: call [004012B8h]
  '0053EDBE: mov eax, [541024h]
  '0053EDC3: mov ecx, [eax]
  '0053EDC5: push eax
  '0053EDC6: call [ecx+00000688h]
  '0053EDCC: lea edx, [ebp-28h]
  '0053EDCF: push eax
  '0053EDD0: push edx
  '0053EDD1: call [004010E4h]
  '0053EDD7: fld real8 ptr [ebp-68h]
  '0053EDDA: mov edi, eax
  '0053EDDC: lea eax, [ebp-2Ch]
  '0053EDDF: push eax
  '0053EDE0: mov ebx, [edi]
  '0053EDE2: call [00401348h]
  '0053EDE8: push eax
  '0053EDE9: push edi
  '0053EDEA: call [ebx+40h]
  '0053EDED: test eax, eax
  '0053EDEF: fclex 
  '0053EDF1: jnl 53EE02h
  '0053EDF3: push 00000040h
  '0053EDF5: push 0041E60Ch
  '0053EDFA: push edi
  '0053EDFB: push eax
  '0053EDFC: call [004010A0h]
  '0053EE02: mov ecx, [ebp-2Ch]
  '0053EE05: push 00000000h
  '0053EE07: push 00000008h
  '0053EE09: lea edx, [ebp-4Ch]
  '0053EE0C: push ecx
  '0053EE0D: push edx
  '0053EE0E: call [004011E4h]
  '0053EE14: add esp, 00000010h
  '0053EE17: push eax
  '0053EE18: call [00401284h]
  '0053EE1E: xor ecx, ecx
  '0053EE20: cmp ax, 0007h
  '0053EE24: lea edx, [ebp-1Ch]
  '0053EE27: lea eax, [ebp-18h]
  '0053EE2A: setz cl
  '0053EE2D: push edx
  '0053EE2E: push eax
  '0053EE2F: neg ecx
  '0053EE31: push 00000002h
  '0053EE33: mov di, cx
  '0053EE36: call [004012E8h]
  '0053EE3C: lea ecx, [ebp-2Ch]
  '0053EE3F: lea edx, [ebp-28h]
  '0053EE42: push ecx
  '0053EE43: push edx
  '0053EE44: push 00000002h
  '0053EE46: call [00401064h]
  '0053EE4C: lea eax, [ebp-4Ch]
  '0053EE4F: lea ecx, [ebp-3Ch]
  '0053EE52: push eax
  '0053EE53: push ecx
  '0053EE54: push 00000002h
  '0053EE56: call [00401050h]
  '0053EE5C: add esp, 00000024h
  '0053EE5F: test di, di
  '0053EE62: jz 0053EFF3h
  '0053EE68: mov edx, [esi]
  '0053EE6A: lea eax, [ebp-18h]
  '0053EE6D: push eax
  '0053EE6E: push esi
  '0053EE6F: call [edx+000001C0h]
  '0053EE75: test eax, eax
  '0053EE77: fclex 
  '0053EE79: jnl 53EE8Dh
  '0053EE7B: push 000001C0h
  '0053EE80: push 0041F540h
  '0053EE85: push esi
  '0053EE86: push eax
  '0053EE87: call [004010A0h]
  '0053EE8D: mov edx, [ebp-18h]
  '0053EE90: lea ecx, [ebp-3Ch]
  '0053EE93: push ecx
  '0053EE94: push 00000004h
  '0053EE96: push edx
  '0053EE97: mov [ebp-34h], 80020004h
  '0053EE9E: mov [ebp-3Ch], 0000000Ah
  '0053EEA5: call [00401148h]
  '0053EEAB: mov edx, eax
  '0053EEAD: lea ecx, [ebp-1Ch]
  '0053EEB0: call [00401378h]
  '0053EEB6: push eax
  '0053EEB7: call [004013BCh]
  '0053EEBD: mov eax, [541024h]
  '0053EEC2: fstp real8 ptr [ebp-68h]
  '0053EEC5: test eax, eax
  '0053EEC7: jnz 53EED9h
  '0053EEC9: push 00541024h
  '0053EECE: push 00413334h
  '0053EED3: call [004012B8h]
  '0053EED9: mov eax, [esi]
  '0053EEDB: mov ebx, [00541024h]
  '0053EEE1: push esi
  '0053EEE2: call [eax+00000300h]
  '0053EEE8: lea ecx, [ebp-28h]
  '0053EEEB: push eax
  '0053EEEC: push ecx
  '0053EEED: call [004010E4h]
  '0053EEF3: mov edi, eax
  '0053EEF5: lea eax, [ebp-20h]
  '0053EEF8: push eax
  '0053EEF9: push edi
  '0053EEFA: mov edx, [edi]
  '0053EEFC: call [edx+000000A8h]
  '0053EF02: test eax, eax
  '0053EF04: fclex 
  '0053EF06: jnl 53EF1Ah
  '0053EF08: push 000000A8h
  '0053EF0D: push 0041C0C4h
  '0053EF12: push edi
  '0053EF13: push eax
  '0053EF14: call [004010A0h]
  '0053EF1A: mov ecx, [ebp-20h]
  '0053EF1D: push 0042D68Ch
  '0053EF22: push ecx
  '0053EF23: call [0040108Ch]
  '0053EF29: mov edi, [00401378h]
  '0053EF2F: mov edx, eax
  '0053EF31: lea ecx, [ebp-24h]
  '0053EF34: call edi
  '0053EF36: fld real8 ptr [ebp-68h]
  '0053EF39: call [00401348h]
  '0053EF3F: mov [ebp-60h], eax
  '0053EF42: mov edx, [ebx]
  '0053EF44: lea eax, [ebp-24h]
  '0053EF47: lea ecx, [ebp-60h]
  '0053EF4A: push eax
  '0053EF4B: push ecx
  '0053EF4C: push ebx
  '0053EF4D: call [edx+00000714h]
  '0053EF53: test eax, eax
  '0053EF55: fclex 
  '0053EF57: jnl 53EF6Bh
  '0053EF59: push 00000714h
  '0053EF5E: push 0041C118h
  '0053EF63: push ebx
  '0053EF64: push eax
  '0053EF65: call [004010A0h]
  '0053EF6B: mov ebx, [004012E8h]
  '0053EF71: lea edx, [ebp-24h]
  '0053EF74: lea eax, [ebp-20h]
  '0053EF77: push edx
  '0053EF78: lea ecx, [ebp-1Ch]
  '0053EF7B: push eax
  '0053EF7C: lea edx, [ebp-18h]
  '0053EF7F: push ecx
  '0053EF80: push edx
  '0053EF81: push 00000004h
  '0053EF83: call ebx
  '0053EF85: add esp, 00000014h
  '0053EF88: lea ecx, [ebp-28h]
  '0053EF8B: call [004013B8h]
  '0053EF91: lea ecx, [ebp-3Ch]
  '0053EF94: call [00401030h]
  '0053EF9A: call [00401104h]
  '0053EFA0: mov eax, [esi]
  '0053EFA2: lea ecx, [ebp-18h]
  '0053EFA5: push ecx
  '0053EFA6: push esi
  '0053EFA7: call [eax+50h]
  '0053EFAA: test eax, eax
  '0053EFAC: fclex 
  '0053EFAE: jnl 53EFBFh
  '0053EFB0: push 00000050h
  '0053EFB2: push 0041F540h
  '0053EFB7: push esi
  '0053EFB8: push eax
  '0053EFB9: call [004010A0h]
  '0053EFBF: mov edx, [ebp-18h]
  '0053EFC2: push 0042D6A8h
  '0053EFC7: push edx
  '0053EFC8: call [0040108Ch]
  '0053EFCE: mov edx, eax
  '0053EFD0: lea ecx, [ebp-1Ch]
  '0053EFD3: call edi
  '0053EFD5: mov eax, [esi]
  '0053EFD7: lea ecx, [ebp-1Ch]
  '0053EFDA: push ecx
  '0053EFDB: push esi
  '0053EFDC: call [eax+00000710h]
  '0053EFE2: lea edx, [ebp-1Ch]
  '0053EFE5: lea eax, [ebp-18h]
  '0053EFE8: push edx
  '0053EFE9: push eax
  '0053EFEA: push 00000002h
  '0053EFEC: call ebx
  '0053EFEE: add esp, 0000000Ch
  '0053EFF1: jmp 53F017h
  '0053EFF3: mov edx, 0042D6D0h
  '0053EFF8: lea ecx, [ebp-18h]
  '0053EFFB: call [004012D8h]
  '0053F001: mov ecx, [esi]
  '0053F003: lea edx, [ebp-18h]
  '0053F006: push edx
  '0053F007: push esi
  '0053F008: call [ecx+00000710h]
  '0053F00E: lea ecx, [ebp-18h]
  '0053F011: call [004013B4h]
  '0053F017: xor ebx, ebx
  '0053F019: mov [ebp-04h], ebx
  '0053F01C: wait 
  '0053F01D: push 0053F061h
  '0053F022: jmp 53F060h
  '0053F024: lea eax, [ebp-24h]
  '0053F027: lea ecx, [ebp-20h]
  '0053F02A: push eax
  '0053F02B: lea edx, [ebp-1Ch]
  '0053F02E: push ecx
  '0053F02F: lea eax, [ebp-18h]
  '0053F032: push edx
  '0053F033: push eax
  '0053F034: push 00000004h
  '0053F036: call [004012E8h]
  '0053F03C: lea ecx, [ebp-2Ch]
  '0053F03F: lea edx, [ebp-28h]
  '0053F042: push ecx
  '0053F043: push edx
  '0053F044: push 00000002h
  '0053F046: call [00401064h]
  '0053F04C: lea eax, [ebp-4Ch]
  '0053F04F: lea ecx, [ebp-3Ch]
  '0053F052: push eax
  '0053F053: push ecx
  '0053F054: push 00000002h
  '0053F056: call [00401050h]
  '0053F05C: add esp, 0000002Ch
  '0053F05F: ret 
End Sub
Private Sub Form__53F220
  '0053F220: push ebp
  '0053F221: mov ebp, esp
  '0053F223: sub esp, 0000000Ch
  '0053F226: push 004081B6h
  '0053F22B: mov eax, fs:[00h]
  '0053F231: push eax
  '0053F232: mov fs:[00000000h], esp
  '0053F239: sub esp, 0000003Ch
  '0053F23C: push ebx
  '0053F23D: push esi
  '0053F23E: push edi
  '0053F23F: mov [ebp-0Ch], esp
  '0053F242: mov [ebp-08h], 00408120h
  '0053F249: mov edi, [ebp+08h]
  '0053F24C: mov eax, edi
  '0053F24E: and eax, 00000001h
  '0053F251: mov [ebp-04h], eax
  '0053F254: and edi, FFFFFFFEh
  '0053F257: push edi
  '0053F258: mov [ebp+08h], edi
  '0053F25B: mov ecx, [edi]
  '0053F25D: call [ecx+04h]
  '0053F260: mov edx, [edi]
  '0053F262: lea eax, [ebp-20h]
  '0053F265: xor ebx, ebx
  '0053F267: push eax
  '0053F268: push edi
  '0053F269: mov [ebp-18h], ebx
  '0053F26C: mov [ebp-1Ch], ebx
  '0053F26F: mov [ebp-20h], ebx
  '0053F272: mov [ebp-30h], ebx
  '0053F275: mov [ebp-34h], ebx
  '0053F278: mov [ebp-3Ch], ebx
  '0053F27B: mov [ebp-40h], ebx
  '0053F27E: call [edx+00000218h]
  '0053F284: cmp eax, ebx
  '0053F286: fclex 
  '0053F288: jnl 53F29Ch
  '0053F28A: push 00000218h
  '0053F28F: push 0041F540h
  '0053F294: push edi
  '0053F295: push eax
  '0053F296: call [004010A0h]
  '0053F29C: mov eax, [ebp-20h]
  '0053F29F: lea ecx, [ebp-3Ch]
  '0053F2A2: push eax
  '0053F2A3: push ecx
  '0053F2A4: mov [ebp-20h], ebx
  '0053F2A7: call [004010E4h]
  '0053F2AD: push eax
  '0053F2AE: lea edx, [ebp-18h]
  '0053F2B1: lea eax, [ebp-40h]
  '0053F2B4: push edx
  '0053F2B5: push eax
  '0053F2B6: push 0041F304h
  '0053F2BB: call [004010CCh]
  '0053F2C1: mov esi, [00401278h]
  '0053F2C7: cmp eax, ebx
  '0053F2C9: jz 0053F37Bh
  '0053F2CF: mov ecx, [ebp-18h]
  '0053F2D2: push 0041E3FCh
  '0053F2D7: push ecx
  '0053F2D8: call esi
  '0053F2DA: mov edx, [ebp-18h]
  '0053F2DD: mov bx, ax
  '0053F2E0: neg bx
  '0053F2E3: sbb ebx, ebx
  '0053F2E5: push 00420F60h
  '0053F2EA: push edx
  '0053F2EB: inc ebx
  '0053F2EC: call esi
  '0053F2EE: neg ax
  '0053F2F1: sbb eax, eax
  '0053F2F3: push 0041FB8Ch
  '0053F2F8: inc eax
  '0053F2F9: and ebx, eax
  '0053F2FB: mov eax, [ebp-18h]
  '0053F2FE: neg ebx
  '0053F300: sbb ebx, ebx
  '0053F302: push eax
  '0053F303: neg ebx
  '0053F305: call esi
  '0053F307: neg ax
  '0053F30A: mov ecx, [ebp-18h]
  '0053F30D: push 0041CE08h
  '0053F312: sbb eax, eax
  '0053F314: push ecx
  '0053F315: inc eax
  '0053F316: and ebx, eax
  '0053F318: neg ebx
  '0053F31A: sbb ebx, ebx
  '0053F31C: neg ebx
  '0053F31E: call esi
  '0053F320: neg ax
  '0053F323: sbb eax, eax
  '0053F325: inc eax
  '0053F326: test ebx, eax
  '0053F328: jnz 53F361h
  '0053F32A: mov edx, [ebp-18h]
  '0053F32D: xor ebx, ebx
  '0053F32F: push ebx
  '0053F330: push 00420F70h
  '0053F335: lea eax, [ebp-30h]
  '0053F338: push edx
  '0053F339: push eax
  '0053F33A: call [00401368h]
  '0053F340: add esp, 00000010h
  '0053F343: push eax
  '0053F344: call [0040130Ch]
  '0053F34A: lea ecx, [ebp-34h]
  '0053F34D: mov [ebp-34h], eax
  '0053F350: push ecx
  '0053F351: call 004EB0B0h
  '0053F356: lea ecx, [ebp-30h]
  '0053F359: call [00401030h]
  '0053F35F: jmp 53F363h
  '0053F361: xor ebx, ebx
  '0053F363: lea edx, [ebp-18h]
  '0053F366: lea eax, [ebp-40h]
  '0053F369: push edx
  '0053F36A: push eax
  '0053F36B: push 0041F304h
  '0053F370: call [00401150h]
  '0053F376: jmp 0053F2C7h
  '0053F37B: mov ecx, [edi]
  '0053F37D: push edi
  '0053F37E: call [ecx+00000300h]
  '0053F384: lea edx, [ebp-20h]
  '0053F387: push eax
  '0053F388: push edx
  '0053F389: call [004010E4h]
  '0053F38F: mov eax, [5410FCh]
  '0053F394: push eax
  '0053F395: push 0042D71Ch
  '0053F39A: call [0040108Ch]
  '0053F3A0: mov edx, eax
  '0053F3A2: lea ecx, [ebp-1Ch]
  '0053F3A5: call [00401378h]
  '0053F3AB: lea ecx, [ebp-20h]
  '0053F3AE: lea edx, [ebp-1Ch]
  '0053F3B1: push ecx
  '0053F3B2: lea eax, [ebp-30h]
  '0053F3B5: push edx
  '0053F3B6: push eax
  '0053F3B7: call 00519A60h
  '0053F3BC: mov esi, [004013B4h]
  '0053F3C2: lea ecx, [ebp-1Ch]
  '0053F3C5: call esi
  '0053F3C7: lea ecx, [ebp-20h]
  '0053F3CA: call [004013B8h]
  '0053F3D0: lea ecx, [ebp-30h]
  '0053F3D3: call [00401030h]
  '0053F3D9: mov edx, 0042D7ACh
  '0053F3DE: lea ecx, [ebp-1Ch]
  '0053F3E1: call [004012D8h]
  '0053F3E7: mov ecx, [edi]
  '0053F3E9: lea edx, [ebp-1Ch]
  '0053F3EC: push edx
  '0053F3ED: push edi
  '0053F3EE: call [ecx+00000710h]
  '0053F3F4: lea ecx, [ebp-1Ch]
  '0053F3F7: call esi
  '0053F3F9: mov [ebp-04h], ebx
  '0053F3FC: push 0053F43Ch
  '0053F401: jmp 53F41Fh
  '0053F403: lea ecx, [ebp-1Ch]
  '0053F406: call [004013B4h]
  '0053F40C: lea ecx, [ebp-20h]
  '0053F40F: call [004013B8h]
  '0053F415: lea ecx, [ebp-30h]
  '0053F418: call [00401030h]
  '0053F41E: ret 
End Sub
Private Sub Form__53F460
  '0053F460: push ebp
  '0053F461: mov ebp, esp
  '0053F463: sub esp, 00000018h
  '0053F466: push 004081B6h
  '0053F46B: mov eax, fs:[00h]
  '0053F471: push eax
  '0053F472: mov fs:[00000000h], esp
  '0053F479: mov eax, 00000090h
  '0053F47E: call 004081B0h
  '0053F483: push ebx
  '0053F484: push esi
  '0053F485: push edi
  '0053F486: mov [ebp-18h], esp
  '0053F489: mov [ebp-14h], 00408130h
  '0053F490: mov eax, [ebp+08h]
  '0053F493: and eax, 00000001h
  '0053F496: mov [ebp-10h], eax
  '0053F499: mov ecx, [ebp+08h]
  '0053F49C: and ecx, FFFFFFFEh
  '0053F49F: mov [ebp+08h], ecx
  '0053F4A2: mov [ebp-0Ch], 00000000h
  '0053F4A9: mov edx, [ebp+08h]
  '0053F4AC: mov eax, [edx]
  '0053F4AE: mov ecx, [ebp+08h]
  '0053F4B1: push ecx
  '0053F4B2: call [eax+04h]
  '0053F4B5: mov [ebp-04h], 00000001h
  '0053F4BC: mov [ebp-04h], 00000002h
  '0053F4C3: push FFFFFFFFh
  '0053F4C5: call [004010E8h]
  '0053F4CB: mov [ebp-04h], 00000003h
  '0053F4D2: lea edx, [ebp-5Ch]
  '0053F4D5: push edx
  '0053F4D6: mov eax, [ebp+08h]
  '0053F4D9: mov ecx, [eax]
  '0053F4DB: mov edx, [ebp+08h]
  '0053F4DE: push edx
  '0053F4DF: call [ecx+00000080h]
  '0053F4E5: fclex 
  '0053F4E7: mov [ebp-64h], eax
  '0053F4EA: cmp [ebp-64h], 00000000h
  '0053F4EE: jnl 53F510h
  '0053F4F0: push 00000080h
  '0053F4F5: push 0041F540h
  '0053F4FA: mov eax, [ebp+08h]
  '0053F4FD: push eax
  '0053F4FE: mov ecx, [ebp-64h]
  '0053F501: push ecx
  '0053F502: call [004010A0h]
  '0053F508: mov [ebp-00000088h], eax
  '0053F50E: jmp 53F51Ah
  '0053F510: mov [ebp-00000088h], 00000000h
  '0053F51A: fld real4 ptr [ebp-5Ch]
  '0053F51D: fcomp real4 ptr [004067C4h]
  '0053F523: fstsw ax
  '0053F525: test ah, 01h
  '0053F528: jz 53F57Ah
  '0053F52A: mov [ebp-04h], 00000004h
  '0053F531: push 44BB8000h
  '0053F536: mov edx, [ebp+08h]
  '0053F539: mov eax, [edx]
  '0053F53B: mov ecx, [ebp+08h]
  '0053F53E: push ecx
  '0053F53F: call [eax+00000084h]
  '0053F545: fclex 
  '0053F547: mov [ebp-64h], eax
  '0053F54A: cmp [ebp-64h], 00000000h
  '0053F54E: jnl 53F570h
  '0053F550: push 00000084h
  '0053F555: push 0041F540h
  '0053F55A: mov edx, [ebp+08h]
  '0053F55D: push edx
  '0053F55E: mov eax, [ebp-64h]
  '0053F561: push eax
  '0053F562: call [004010A0h]
  '0053F568: mov [ebp-0000008Ch], eax
  '0053F56E: jmp 53F57Ah
  '0053F570: mov [ebp-0000008Ch], 00000000h
  '0053F57A: mov [ebp-04h], 00000006h
  '0053F581: lea ecx, [ebp-5Ch]
  '0053F584: push ecx
  '0053F585: mov edx, [ebp+08h]
  '0053F588: mov eax, [edx]
  '0053F58A: mov ecx, [ebp+08h]
  '0053F58D: push ecx
  '0053F58E: call [eax+00000088h]
  '0053F594: fclex 
  '0053F596: mov [ebp-64h], eax
  '0053F599: cmp [ebp-64h], 00000000h
  '0053F59D: jnl 53F5BFh
  '0053F59F: push 00000088h
  '0053F5A4: push 0041F540h
  '0053F5A9: mov edx, [ebp+08h]
  '0053F5AC: push edx
  '0053F5AD: mov eax, [ebp-64h]
  '0053F5B0: push eax
  '0053F5B1: call [004010A0h]
  '0053F5B7: mov [ebp-00000090h], eax
  '0053F5BD: jmp 53F5C9h
  '0053F5BF: mov [ebp-00000090h], 00000000h
  '0053F5C9: fld real4 ptr [ebp-5Ch]
  '0053F5CC: fcomp real4 ptr [00401894h]
  '0053F5D2: fstsw ax
  '0053F5D4: test ah, 01h
  '0053F5D7: jz 53F629h
  '0053F5D9: mov [ebp-04h], 00000007h
  '0053F5E0: push 44D48000h
  '0053F5E5: mov ecx, [ebp+08h]
  '0053F5E8: mov edx, [ecx]
  '0053F5EA: mov eax, [ebp+08h]
  '0053F5ED: push eax
  '0053F5EE: call [edx+0000008Ch]
  '0053F5F4: fclex 
  '0053F5F6: mov [ebp-64h], eax
  '0053F5F9: cmp [ebp-64h], 00000000h
  '0053F5FD: jnl 53F61Fh
  '0053F5FF: push 0000008Ch
  '0053F604: push 0041F540h
  '0053F609: mov ecx, [ebp+08h]
  '0053F60C: push ecx
  '0053F60D: mov edx, [ebp-64h]
  '0053F610: push edx
  '0053F611: call [004010A0h]
  '0053F617: mov [ebp-00000094h], eax
  '0053F61D: jmp 53F629h
  '0053F61F: mov [ebp-00000094h], 00000000h
  '0053F629: mov [ebp-04h], 00000009h
  '0053F630: mov eax, [ebp+08h]
  '0053F633: mov ecx, [eax]
  '0053F635: mov edx, [ebp+08h]
  '0053F638: push edx
  '0053F639: call [ecx+00000300h]
  '0053F63F: push eax
  '0053F640: lea eax, [ebp-24h]
  '0053F643: push eax
  '0053F644: call [004010E4h]
  '0053F64A: mov [ebp-68h], eax
  '0053F64D: lea ecx, [ebp-5Ch]
  '0053F650: push ecx
  '0053F651: mov edx, [ebp+08h]
  '0053F654: mov eax, [edx]
  '0053F656: mov ecx, [ebp+08h]
  '0053F659: push ecx
  '0053F65A: call [eax+00000100h]
  '0053F660: fclex 
  '0053F662: mov [ebp-64h], eax
  '0053F665: cmp [ebp-64h], 00000000h
  '0053F669: jnl 53F68Bh
  '0053F66B: push 00000100h
  '0053F670: push 0041F540h
  '0053F675: mov edx, [ebp+08h]
  '0053F678: push edx
  '0053F679: mov eax, [ebp-64h]
  '0053F67C: push eax
  '0053F67D: call [004010A0h]
  '0053F683: mov [ebp-00000098h], eax
  '0053F689: jmp 53F695h
  '0053F68B: mov [ebp-00000098h], 00000000h
  '0053F695: fld real4 ptr [ebp-5Ch]
  '0053F698: fsub real4 ptr [00408184h]
  '0053F69E: fstsw ax
  '0053F6A0: test al, 0Dh
  '0053F6A2: jnz 0053FA6Dh
  '0053F6A8: push ecx
  '0053F6A9: fstp real4 ptr [esp]
  '0053F6AC: mov ecx, [ebp-68h]
  '0053F6AF: mov edx, [ecx]
  '0053F6B1: mov eax, [ebp-68h]
  '0053F6B4: push eax
  '0053F6B5: call [edx+00000084h]
  '0053F6BB: fclex 
  '0053F6BD: mov [ebp-6Ch], eax
  '0053F6C0: cmp [ebp-6Ch], 00000000h
  '0053F6C4: jnl 53F6E6h
  '0053F6C6: push 00000084h
  '0053F6CB: push 0041C0C4h
  '0053F6D0: mov ecx, [ebp-68h]
  '0053F6D3: push ecx
  '0053F6D4: mov edx, [ebp-6Ch]
  '0053F6D7: push edx
  '0053F6D8: call [004010A0h]
  '0053F6DE: mov [ebp-0000009Ch], eax
  '0053F6E4: jmp 53F6F0h
  '0053F6E6: mov [ebp-0000009Ch], 00000000h
  '0053F6F0: lea ecx, [ebp-24h]
  '0053F6F3: call [004013B8h]
  '0053F6F9: mov [ebp-04h], 0000000Ah
  '0053F700: lea eax, [ebp-5Ch]
  '0053F703: push eax
  '0053F704: mov ecx, [ebp+08h]
  '0053F707: mov edx, [ecx]
  '0053F709: mov eax, [ebp+08h]
  '0053F70C: push eax
  '0053F70D: call [edx+00000100h]
  '0053F713: fclex 
  '0053F715: mov [ebp-64h], eax
  '0053F718: cmp [ebp-64h], 00000000h
  '0053F71C: jnl 53F73Eh
  '0053F71E: push 00000100h
  '0053F723: push 0041F540h
  '0053F728: mov ecx, [ebp+08h]
  '0053F72B: push ecx
  '0053F72C: mov edx, [ebp-64h]
  '0053F72F: push edx
  '0053F730: call [004010A0h]
  '0053F736: mov [ebp-000000A0h], eax
  '0053F73C: jmp 53F748h
  '0053F73E: mov [ebp-000000A0h], 00000000h
  '0053F748: mov eax, [ebp+08h]
  '0053F74B: mov ecx, [eax]
  '0053F74D: mov edx, [ebp+08h]
  '0053F750: push edx
  '0053F751: call [ecx+00000304h]
  '0053F757: push eax
  '0053F758: lea eax, [ebp-24h]
  '0053F75B: push eax
  '0053F75C: call [004010E4h]
  '0053F762: mov [ebp-6Ch], eax
  '0053F765: lea ecx, [ebp-60h]
  '0053F768: push ecx
  '0053F769: mov edx, [ebp+08h]
  '0053F76C: mov eax, [edx]
  '0053F76E: mov ecx, [ebp+08h]
  '0053F771: push ecx
  '0053F772: call [eax+00000108h]
  '0053F778: fclex 
  '0053F77A: mov [ebp-68h], eax
  '0053F77D: cmp [ebp-68h], 00000000h
  '0053F781: jnl 53F7A3h
  '0053F783: push 00000108h
  '0053F788: push 0041F540h
  '0053F78D: mov edx, [ebp+08h]
  '0053F790: push edx
  '0053F791: mov eax, [ebp-68h]
  '0053F794: push eax
  '0053F795: call [004010A0h]
  '0053F79B: mov [ebp-000000A4h], eax
  '0053F7A1: jmp 53F7ADh
  '0053F7A3: mov [ebp-000000A4h], 00000000h
  '0053F7AD: fld real4 ptr [ebp-60h]
  '0053F7B0: fsub real4 ptr [00408180h]
  '0053F7B6: fstp real4 ptr [ebp-50h]
  '0053F7B9: fstsw ax
  '0053F7BB: test al, 0Dh
  '0053F7BD: jnz 0053FA6Dh
  '0053F7C3: mov [ebp-58h], 00000004h
  '0053F7CA: mov ecx, [ebp-5Ch]
  '0053F7CD: mov [ebp-40h], ecx
  '0053F7D0: mov [ebp-48h], 00000004h
  '0053F7D7: mov [ebp-30h], 00000168h
  '0053F7DE: mov [ebp-38h], 00000002h
  '0053F7E5: mov eax, 00000010h
  '0053F7EA: call 004081B0h
  '0053F7EF: mov edx, esp
  '0053F7F1: mov eax, [ebp-58h]
  '0053F7F4: mov [edx], eax
  '0053F7F6: mov ecx, [ebp-54h]
  '0053F7F9: mov [edx+04h], ecx
  '0053F7FC: mov eax, [ebp-50h]
  '0053F7FF: mov [edx+08h], eax
  '0053F802: mov ecx, [ebp-4Ch]
  '0053F805: mov [edx+0Ch], ecx
  '0053F808: mov eax, 00000010h
  '0053F80D: call 004081B0h
  '0053F812: mov edx, esp
  '0053F814: mov eax, [ebp-48h]
  '0053F817: mov [edx], eax
  '0053F819: mov ecx, [ebp-44h]
  '0053F81C: mov [edx+04h], ecx
  '0053F81F: mov eax, [ebp-40h]
  '0053F822: mov [edx+08h], eax
  '0053F825: mov ecx, [ebp-3Ch]
  '0053F828: mov [edx+0Ch], ecx
  '0053F82B: mov eax, 00000010h
  '0053F830: call 004081B0h
  '0053F835: mov edx, esp
  '0053F837: mov eax, [ebp-38h]
  '0053F83A: mov [edx], eax
  '0053F83C: mov ecx, [ebp-34h]
  '0053F83F: mov [edx+04h], ecx
  '0053F842: mov eax, [ebp-30h]
  '0053F845: mov [edx+08h], eax
  '0053F848: mov ecx, [ebp-2Ch]
  '0053F84B: mov [edx+0Ch], ecx
  '0053F84E: push 00000000h
  '0053F850: mov edx, [ebp-6Ch]
  '0053F853: mov eax, [edx]
  '0053F855: mov ecx, [ebp-6Ch]
  '0053F858: push ecx
  '0053F859: call [eax+00000224h]
  '0053F85F: fclex 
  '0053F861: mov [ebp-70h], eax
  '0053F864: cmp [ebp-70h], 00000000h
  '0053F868: jnl 53F88Ah
  '0053F86A: push 00000224h
  '0053F86F: push 0041E3FCh
  '0053F874: mov edx, [ebp-6Ch]
  '0053F877: push edx
  '0053F878: mov eax, [ebp-70h]
  '0053F87B: push eax
  '0053F87C: call [004010A0h]
  '0053F882: mov [ebp-000000A8h], eax
  '0053F888: jmp 53F894h
  '0053F88A: mov [ebp-000000A8h], 00000000h
  '0053F894: lea ecx, [ebp-24h]
  '0053F897: call [004013B8h]
  '0053F89D: mov [ebp-04h], 0000000Bh
  '0053F8A4: mov ecx, [ebp+08h]
  '0053F8A7: mov edx, [ecx]
  '0053F8A9: mov eax, [ebp+08h]
  '0053F8AC: push eax
  '0053F8AD: call [edx+00000300h]
  '0053F8B3: push eax
  '0053F8B4: lea ecx, [ebp-24h]
  '0053F8B7: push ecx
  '0053F8B8: call [004010E4h]
  '0053F8BE: mov [ebp-64h], eax
  '0053F8C1: lea edx, [ebp-5Ch]
  '0053F8C4: push edx
  '0053F8C5: mov eax, [ebp-64h]
  '0053F8C8: mov ecx, [eax]
  '0053F8CA: mov edx, [ebp-64h]
  '0053F8CD: push edx
  '0053F8CE: call [ecx+00000080h]
  '0053F8D4: fclex 
  '0053F8D6: mov [ebp-68h], eax
  '0053F8D9: cmp [ebp-68h], 00000000h
  '0053F8DD: jnl 53F8FFh
  '0053F8DF: push 00000080h
  '0053F8E4: push 0041C0C4h
  '0053F8E9: mov eax, [ebp-64h]
  '0053F8EC: push eax
  '0053F8ED: mov ecx, [ebp-68h]
  '0053F8F0: push ecx
  '0053F8F1: call [004010A0h]
  '0053F8F7: mov [ebp-000000ACh], eax
  '0053F8FD: jmp 53F909h
  '0053F8FF: mov [ebp-000000ACh], 00000000h
  '0053F909: mov edx, [ebp+08h]
  '0053F90C: mov eax, [edx]
  '0053F90E: mov ecx, [ebp+08h]
  '0053F911: push ecx
  '0053F912: call [eax+000002FCh]
  '0053F918: push eax
  '0053F919: lea edx, [ebp-28h]
  '0053F91C: push edx
  '0053F91D: call [004010E4h]
  '0053F923: mov [ebp-6Ch], eax
  '0053F926: mov [ebp-50h], 80020004h
  '0053F92D: mov [ebp-58h], 0000000Ah
  '0053F934: mov [ebp-40h], 80020004h
  '0053F93B: mov [ebp-48h], 0000000Ah
  '0053F942: mov [ebp-30h], 00000000h
  '0053F949: mov [ebp-38h], 00000002h
  '0053F950: mov eax, 00000010h
  '0053F955: call 004081B0h
  '0053F95A: mov eax, esp
  '0053F95C: mov ecx, [ebp-58h]
  '0053F95F: mov [eax], ecx
  '0053F961: mov edx, [ebp-54h]
  '0053F964: mov [eax+04h], edx
  '0053F967: mov ecx, [ebp-50h]
  '0053F96A: mov [eax+08h], ecx
  '0053F96D: mov edx, [ebp-4Ch]
  '0053F970: mov [eax+0Ch], edx
  '0053F973: mov eax, 00000010h
  '0053F978: call 004081B0h
  '0053F97D: mov eax, esp
  '0053F97F: mov ecx, [ebp-48h]
  '0053F982: mov [eax], ecx
  '0053F984: mov edx, [ebp-44h]
  '0053F987: mov [eax+04h], edx
  '0053F98A: mov ecx, [ebp-40h]
  '0053F98D: mov [eax+08h], ecx
  '0053F990: mov edx, [ebp-3Ch]
  '0053F993: mov [eax+0Ch], edx
  '0053F996: mov eax, 00000010h
  '0053F99B: call 004081B0h
  '0053F9A0: mov eax, esp
  '0053F9A2: mov ecx, [ebp-38h]
  '0053F9A5: mov [eax], ecx
  '0053F9A7: mov edx, [ebp-34h]
  '0053F9AA: mov [eax+04h], edx
  '0053F9AD: mov ecx, [ebp-30h]
  '0053F9B0: mov [eax+08h], ecx
  '0053F9B3: mov edx, [ebp-2Ch]
  '0053F9B6: mov [eax+0Ch], edx
  '0053F9B9: fld real4 ptr [ebp-5Ch]
  '0053F9BC: fadd real4 ptr [00406D20h]
  '0053F9C2: fstsw ax
  '0053F9C4: test al, 0Dh
  '0053F9C6: jnz 0053FA6Dh
  '0053F9CC: push ecx
  '0053F9CD: fstp real4 ptr [esp]
  '0053F9D0: mov eax, [ebp-6Ch]
  '0053F9D3: mov ecx, [eax]
  '0053F9D5: mov edx, [ebp-6Ch]
  '0053F9D8: push edx
  '0053F9D9: call [ecx+000001B4h]
  '0053F9DF: fclex 
  '0053F9E1: mov [ebp-70h], eax
  '0053F9E4: cmp [ebp-70h], 00000000h
  '0053F9E8: jnl 53FA0Ah
  '0053F9EA: push 000001B4h
  '0053F9EF: push 00420F60h
  '0053F9F4: mov eax, [ebp-6Ch]
  '0053F9F7: push eax
  '0053F9F8: mov ecx, [ebp-70h]
  '0053F9FB: push ecx
  '0053F9FC: call [004010A0h]
  '0053FA02: mov [ebp-000000B0h], eax
  '0053FA08: jmp 53FA14h
  '0053FA0A: mov [ebp-000000B0h], 00000000h
  '0053FA14: lea edx, [ebp-28h]
  '0053FA17: push edx
  '0053FA18: lea eax, [ebp-24h]
  '0053FA1B: push eax
  '0053FA1C: push 00000002h
  '0053FA1E: call [00401064h]
  '0053FA24: add esp, 0000000Ch
  '0053FA27: mov [ebp-10h], 00000000h
  '0053FA2E: wait 
  '0053FA2F: push 0053FA4Bh
  '0053FA34: jmp 53FA4Ah
  '0053FA36: lea ecx, [ebp-28h]
  '0053FA39: push ecx
  '0053FA3A: lea edx, [ebp-24h]
  '0053FA3D: push edx
  '0053FA3E: push 00000002h
  '0053FA40: call [00401064h]
  '0053FA46: add esp, 0000000Ch
  '0053FA49: ret 
End Sub
Private Sub clear_data__53EB60
  '0053EB60: push ebp
  '0053EB61: mov ebp, esp
  '0053EB63: sub esp, 0000000Ch
  '0053EB66: push 004081B6h
  '0053EB6B: mov eax, fs:[00h]
  '0053EB71: push eax
  '0053EB72: mov fs:[00000000h], esp
  '0053EB79: sub esp, 00000014h
  '0053EB7C: push ebx
  '0053EB7D: push esi
  '0053EB7E: push edi
  '0053EB7F: mov [ebp-0Ch], esp
  '0053EB82: mov [ebp-08h], 004080F0h
  '0053EB89: mov esi, [ebp+08h]
  '0053EB8C: mov eax, esi
  '0053EB8E: and eax, 00000001h
  '0053EB91: mov [ebp-04h], eax
  '0053EB94: and esi, FFFFFFFEh
  '0053EB97: push esi
  '0053EB98: mov [ebp+08h], esi
  '0053EB9B: mov ecx, [esi]
  '0053EB9D: call [ecx+04h]
  '0053EBA0: mov edx, [esi]
  '0053EBA2: xor edi, edi
  '0053EBA4: push esi
  '0053EBA5: mov [ebp-18h], edi
  '0053EBA8: call [edx+00000304h]
  '0053EBAE: push eax
  '0053EBAF: lea eax, [ebp-18h]
  '0053EBB2: push eax
  '0053EBB3: call [004010E4h]
  '0053EBB9: mov esi, eax
  '0053EBBB: push edi
  '0053EBBC: push esi
  '0053EBBD: mov ecx, [esi]
  '0053EBBF: call [ecx+000000A4h]
  '0053EBC5: cmp eax, edi
  '0053EBC7: fclex 
  '0053EBC9: jnl 53EBDDh
  '0053EBCB: push 000000A4h
  '0053EBD0: push 0041E3FCh
  '0053EBD5: push esi
  '0053EBD6: push eax
  '0053EBD7: call [004010A0h]
  '0053EBDD: lea ecx, [ebp-18h]
  '0053EBE0: call [004013B8h]
  '0053EBE6: mov [ebp-04h], edi
  '0053EBE9: push 0053EBFBh
  '0053EBEE: jmp 53EBFAh
  '0053EBF0: lea ecx, [ebp-18h]
  '0053EBF3: call [004013B8h]
  '0053EBF9: ret 
End Sub
Private Sub save_data__53FA80
  '0053FA80: push ebp
  '0053FA81: mov ebp, esp
  '0053FA83: sub esp, 0000000Ch
  '0053FA86: push 004081B6h
  '0053FA8B: mov eax, fs:[00h]
  '0053FA91: push eax
  '0053FA92: mov fs:[00000000h], esp
  '0053FA99: sub esp, 0000005Ch
  '0053FA9C: push ebx
  '0053FA9D: push esi
  '0053FA9E: push edi
  '0053FA9F: mov [ebp-0Ch], esp
  '0053FAA2: mov [ebp-08h], 00408188h
  '0053FAA9: mov esi, [ebp+08h]
  '0053FAAC: mov eax, esi
  '0053FAAE: and eax, 00000001h
  '0053FAB1: mov [ebp-04h], eax
  '0053FAB4: and esi, FFFFFFFEh
  '0053FAB7: push esi
  '0053FAB8: mov [ebp+08h], esi
  '0053FABB: mov ecx, [esi]
  '0053FABD: call [ecx+04h]
  '0053FAC0: mov edx, [esi]
  '0053FAC2: xor ebx, ebx
  '0053FAC4: push esi
  '0053FAC5: mov [ebp-18h], ebx
  '0053FAC8: mov [ebp-1Ch], ebx
  '0053FACB: mov [ebp-20h], ebx
  '0053FACE: mov [ebp-24h], ebx
  '0053FAD1: mov [ebp-28h], ebx
  '0053FAD4: mov [ebp-2Ch], ebx
  '0053FAD7: mov [ebp-30h], ebx
  '0053FADA: mov [ebp-34h], ebx
  '0053FADD: mov [ebp-48h], ebx
  '0053FAE0: mov [ebp-4Ch], ebx
  '0053FAE3: mov [ebp-50h], ebx
  '0053FAE6: mov [ebp-54h], ebx
  '0053FAE9: mov [ebp-58h], ebx
  '0053FAEC: mov [ebp-5Ch], ebx
  '0053FAEF: call [edx+00000304h]
  '0053FAF5: push eax
  '0053FAF6: lea eax, [ebp-34h]
  '0053FAF9: push eax
  '0053FAFA: call [004010E4h]
  '0053FB00: mov edi, eax
  '0053FB02: lea edx, [ebp-20h]
  '0053FB05: push edx
  '0053FB06: push edi
  '0053FB07: mov ecx, [edi]
  '0053FB09: call [ecx+000000A0h]
  '0053FB0F: cmp eax, ebx
  '0053FB11: fclex 
  '0053FB13: jnl 53FB27h
  '0053FB15: push 000000A0h
  '0053FB1A: push 0041E3FCh
  '0053FB1F: push edi
  '0053FB20: push eax
  '0053FB21: call [004010A0h]
  '0053FB27: mov eax, [ebp-20h]
  '0053FB2A: push eax
  '0053FB2B: push 0041BC60h
  '0053FB30: call [00401184h]
  '0053FB36: mov edi, eax
  '0053FB38: lea ecx, [ebp-20h]
  '0053FB3B: neg edi
  '0053FB3D: sbb edi, edi
  '0053FB3F: neg edi
  '0053FB41: neg edi
  '0053FB43: call [004013B4h]
  '0053FB49: lea ecx, [ebp-34h]
  '0053FB4C: call [004013B8h]
  '0053FB52: cmp di, bx
  '0053FB55: jz 0053FD37h
  '0053FB5B: push 00409784h
  '0053FB60: call [00401200h]
  '0053FB66: lea ecx, [ebp-18h]
  '0053FB69: push eax
  '0053FB6A: push ecx
  '0053FB6B: call [004010E4h]
  '0053FB71: mov edx, [esi]
  '0053FB73: lea eax, [ebp-50h]
  '0053FB76: push eax
  '0053FB77: push esi
  '0053FB78: call [edx+58h]
  '0053FB7B: cmp eax, ebx
  '0053FB7D: fclex 
  '0053FB7F: jnl 53FB90h
  '0053FB81: push 00000058h
  '0053FB83: push 0041F540h
  '0053FB88: push esi
  '0053FB89: push eax
  '0053FB8A: call [004010A0h]
  '0053FB90: mov ecx, [ebp-50h]
  '0053FB93: mov edi, [004012D8h]
  '0053FB99: mov [ebp-58h], ecx
  '0053FB9C: mov edx, 0041F400h
  '0053FBA1: lea ecx, [ebp-30h]
  '0053FBA4: mov [ebp-5Ch], ebx
  '0053FBA7: call edi
  '0053FBA9: mov edx, 0042D7C0h
  '0053FBAE: lea ecx, [ebp-2Ch]
  '0053FBB1: call edi
  '0053FBB3: xor edx, edx
  '0053FBB5: lea ecx, [ebp-28h]
  '0053FBB8: call edi
  '0053FBBA: mov edx, 0041F3A8h
  '0053FBBF: lea ecx, [ebp-24h]
  '0053FBC2: mov [ebp-54h], 00000001h
  '0053FBC9: call edi
  '0053FBCB: xor edx, edx
  '0053FBCD: lea ecx, [ebp-20h]
  '0053FBD0: mov [ebp-48h], FFFFFFFFh
  '0053FBD7: call edi
  '0053FBD9: lea ecx, [ebp-4Ch]
  '0053FBDC: mov eax, [ebp-18h]
  '0053FBDF: push ecx
  '0053FBE0: lea ecx, [ebp-5Ch]
  '0053FBE3: push ecx
  '0053FBE4: lea ecx, [ebp-58h]
  '0053FBE7: push ecx
  '0053FBE8: lea ecx, [ebp-30h]
  '0053FBEB: push ecx
  '0053FBEC: lea ecx, [ebp-2Ch]
  '0053FBEF: push ecx
  '0053FBF0: lea ecx, [ebp-28h]
  '0053FBF3: push ecx
  '0053FBF4: lea ecx, [ebp-54h]
  '0053FBF7: push ecx
  '0053FBF8: lea ecx, [ebp-24h]
  '0053FBFB: push ecx
  '0053FBFC: mov edx, [eax]
  '0053FBFE: lea ecx, [ebp-48h]
  '0053FC01: push ecx
  '0053FC02: lea ecx, [ebp-20h]
  '0053FC05: push ecx
  '0053FC06: lea ecx, [ebp-1Ch]
  '0053FC09: push ecx
  '0053FC0A: push eax
  '0053FC0B: call [edx+28h]
  '0053FC0E: cmp eax, ebx
  '0053FC10: fclex 
  '0053FC12: jnl 53FC26h
  '0053FC14: mov edx, [ebp-18h]
  '0053FC17: push 00000028h
  '0053FC19: push 0041D108h
  '0053FC1E: push edx
  '0053FC1F: push eax
  '0053FC20: call [004010A0h]
  '0053FC26: lea eax, [ebp-30h]
  '0053FC29: lea ecx, [ebp-2Ch]
  '0053FC2C: push eax
  '0053FC2D: lea edx, [ebp-28h]
  '0053FC30: push ecx
  '0053FC31: lea eax, [ebp-24h]
  '0053FC34: push edx
  '0053FC35: lea ecx, [ebp-20h]
  '0053FC38: push eax
  '0053FC39: push ecx
  '0053FC3A: push 00000005h
  '0053FC3C: call [004012E8h]
  '0053FC42: mov edx, [ebp-1Ch]
  '0053FC45: add esp, 00000018h
  '0053FC48: push edx
  '0053FC49: push 0041BC60h
  '0053FC4E: call [00401184h]
  '0053FC54: test eax, eax
  '0053FC56: jz 0053FD5Bh
  '0053FC5C: mov eax, [ebp-1Ch]
  '0053FC5F: push eax
  '0053FC60: push 00000001h
  '0053FC62: push FFFFFFFFh
  '0053FC64: push 00000002h
  '0053FC66: call [004012A0h]
  '0053FC6C: mov ecx, [esi]
  '0053FC6E: push esi
  '0053FC6F: call [ecx+00000304h]
  '0053FC75: lea edx, [ebp-34h]
  '0053FC78: push eax
  '0053FC79: push edx
  '0053FC7A: call [004010E4h]
  '0053FC80: mov edi, eax
  '0053FC82: lea ecx, [ebp-20h]
  '0053FC85: push ecx
  '0053FC86: push edi
  '0053FC87: mov eax, [edi]
  '0053FC89: call [eax+000000A0h]
  '0053FC8F: cmp eax, ebx
  '0053FC91: fclex 
  '0053FC93: jnl 53FCA7h
  '0053FC95: push 000000A0h
  '0053FC9A: push 0041E3FCh
  '0053FC9F: push edi
  '0053FCA0: push eax
  '0053FCA1: call [004010A0h]
  '0053FCA7: mov edx, [ebp-20h]
  '0053FCAA: push edx
  '0053FCAB: push 00000001h
  '0053FCAD: push 0041E878h
  '0053FCB2: call [00401234h]
  '0053FCB8: add esp, 0000000Ch
  '0053FCBB: lea ecx, [ebp-20h]
  '0053FCBE: call [004013B4h]
  '0053FCC4: lea ecx, [ebp-34h]
  '0053FCC7: call [004013B8h]
  '0053FCCD: push 00000001h
  '0053FCCF: call [00401168h]
  '0053FCD5: push 0041D108h
  '0053FCDA: push ebx
  '0053FCDB: call [0040137Ch]
  '0053FCE1: push eax
  '0053FCE2: lea eax, [ebp-18h]
  '0053FCE5: push eax
  '0053FCE6: call [004010E4h]
  '0053FCEC: lea ecx, [ebp-1Ch]
  '0053FCEF: push 0042D7DCh
  '0053FCF4: push ecx
  '0053FCF5: call 005194F0h
  '0053FCFA: mov edi, [00401378h]
  '0053FD00: mov edx, eax
  '0053FD02: lea ecx, [ebp-20h]
  '0053FD05: call edi
  '0053FD07: push eax
  '0053FD08: call [0040108Ch]
  '0053FD0E: mov edx, eax
  '0053FD10: lea ecx, [ebp-24h]
  '0053FD13: call edi
  '0053FD15: mov edx, [esi]
  '0053FD17: lea eax, [ebp-24h]
  '0053FD1A: push eax
  '0053FD1B: push esi
  '0053FD1C: call [edx+00000710h]
  '0053FD22: lea ecx, [ebp-24h]
  '0053FD25: lea edx, [ebp-20h]
  '0053FD28: push ecx
  '0053FD29: push edx
  '0053FD2A: push 00000002h
  '0053FD2C: call [004012E8h]
  '0053FD32: add esp, 0000000Ch
  '0053FD35: jmp 53FD5Bh
  '0053FD37: mov edx, 0042D800h
  '0053FD3C: lea ecx, [ebp-20h]
  '0053FD3F: call [004012D8h]
  '0053FD45: mov eax, [esi]
  '0053FD47: lea ecx, [ebp-20h]
  '0053FD4A: push ecx
  '0053FD4B: push esi
  '0053FD4C: call [eax+00000710h]
  '0053FD52: lea ecx, [ebp-20h]
  '0053FD55: call [004013B4h]
  '0053FD5B: mov [ebp-04h], ebx
  '0053FD5E: push 0053FDA1h
  '0053FD63: jmp 53FD8Eh
  '0053FD65: lea edx, [ebp-30h]
  '0053FD68: lea eax, [ebp-2Ch]
  '0053FD6B: push edx
  '0053FD6C: lea ecx, [ebp-28h]
  '0053FD6F: push eax
  '0053FD70: lea edx, [ebp-24h]
  '0053FD73: push ecx
  '0053FD74: lea eax, [ebp-20h]
  '0053FD77: push edx
  '0053FD78: push eax
  '0053FD79: push 00000005h
  '0053FD7B: call [004012E8h]
  '0053FD81: add esp, 00000018h
  '0053FD84: lea ecx, [ebp-34h]
  '0053FD87: call [004013B8h]
  '0053FD8D: ret 
End Sub

