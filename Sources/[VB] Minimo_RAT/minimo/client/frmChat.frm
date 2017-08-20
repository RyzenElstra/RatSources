VERSION 5.00
Begin VB.Form frmChat
  Caption = "chat"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  Icon = "frmChat.frx":0
  LinkTopic = "Form2"
  MaxButton = 0   'False
  ClientLeft = 165
  ClientTop = 735
  ClientWidth = 4290
  ClientHeight = 2655
  BeginProperty Font
    Name = "Tahoma"
    Size = 8.25
    Charset = 0
    Weight = 400
    Underline = 0 'False
    Italic = 0 'False
    Strikethrough = 0 'False
  EndProperty
  StartUpPosition = 3 'Windows Default
  Begin MSComctlLib.StatusBar StatusBar1
    Left = 0
    Top = 2400
    Width = 4290
    Height = 255
    TabIndex = 3
  End
  Begin VB.CommandButton cmdSend
    Caption = "Send"
    Left = 3360
    Top = 2100
    Width = 855
    Height = 280
    TabIndex = 2
  End
  Begin VB.TextBox txtSend
    ForeColor = &H404040&
    Left = 0
    Top = 2100
    Width = 3315
    Height = 285
    TabIndex = 1
  End
  Begin VB.TextBox txtChat
    ForeColor = &H404040&
    Left = 0
    Top = 0
    Width = 4215
    Height = 2055
    TabIndex = 0
    MultiLine = -1  'True
    ScrollBars = 2
    Locked = -1  'True
  End
  Begin VB.Menu chat_options
    Caption = "Options"
    Begin VB.Menu save_chat
      Caption = "Save Text"
    End
    Begin VB.Menu clear_text
      Caption = "Clear Text"
    End
  End
End

Attribute VB_Name = "frmChat"

Private Sub Form__51D9E0
  '0051D9E0: push ebp
  '0051D9E1: mov ebp, esp
  '0051D9E3: sub esp, 0000000Ch
  '0051D9E6: push 004081B6h
  '0051D9EB: mov eax, fs:[00h]
  '0051D9F1: push eax
  '0051D9F2: mov fs:[00000000h], esp
  '0051D9F9: sub esp, 00000050h
  '0051D9FC: push ebx
  '0051D9FD: push esi
  '0051D9FE: push edi
  '0051D9FF: mov [ebp-0Ch], esp
  '0051DA02: mov [ebp-08h], 00406CA0h
  '0051DA09: mov ebx, [ebp+08h]
  '0051DA0C: mov eax, ebx
  '0051DA0E: and eax, 00000001h
  '0051DA11: mov [ebp-04h], eax
  '0051DA14: and ebx, FFFFFFFEh
  '0051DA17: push ebx
  '0051DA18: mov [ebp+08h], ebx
  '0051DA1B: mov ecx, [ebx]
  '0051DA1D: call [ecx+04h]
  '0051DA20: mov edx, [ebx]
  '0051DA22: lea eax, [ebp-28h]
  '0051DA25: xor esi, esi
  '0051DA27: push eax
  '0051DA28: push ebx
  '0051DA29: mov [ebp-18h], esi
  '0051DA2C: mov [ebp-20h], esi
  '0051DA2F: mov [ebp-24h], esi
  '0051DA32: mov [ebp-28h], esi
  '0051DA35: mov [ebp-38h], esi
  '0051DA38: mov [ebp-3Ch], esi
  '0051DA3B: mov [ebp-40h], esi
  '0051DA3E: mov [ebp-50h], esi
  '0051DA41: mov [ebp-54h], esi
  '0051DA44: call [edx+00000218h]
  '0051DA4A: cmp eax, esi
  '0051DA4C: fclex 
  '0051DA4E: jnl 51DA62h
  '0051DA50: push 00000218h
  '0051DA55: push 00421C34h
  '0051DA5A: push ebx
  '0051DA5B: push eax
  '0051DA5C: call [004010A0h]
  '0051DA62: mov eax, [ebp-28h]
  '0051DA65: lea ecx, [ebp-50h]
  '0051DA68: push eax
  '0051DA69: push ecx
  '0051DA6A: mov [ebp-28h], esi
  '0051DA6D: call [004010E4h]
  '0051DA73: push eax
  '0051DA74: lea edx, [ebp-18h]
  '0051DA77: lea eax, [ebp-54h]
  '0051DA7A: push edx
  '0051DA7B: push eax
  '0051DA7C: push 0041F304h
  '0051DA81: call [004010CCh]
  '0051DA87: mov esi, [00401278h]
  '0051DA8D: mov edi, [0040130Ch]
  '0051DA93: test eax, eax
  '0051DA95: jz 0051DB41h
  '0051DA9B: mov ecx, [ebp-18h]
  '0051DA9E: push 0041E3FCh
  '0051DAA3: push ecx
  '0051DAA4: call esi
  '0051DAA6: mov edx, [ebp-18h]
  '0051DAA9: mov bx, ax
  '0051DAAC: neg bx
  '0051DAAF: sbb ebx, ebx
  '0051DAB1: push 00420F60h
  '0051DAB6: push edx
  '0051DAB7: inc ebx
  '0051DAB8: call esi
  '0051DABA: neg ax
  '0051DABD: sbb eax, eax
  '0051DABF: push 0041FB8Ch
  '0051DAC4: inc eax
  '0051DAC5: and ebx, eax
  '0051DAC7: mov eax, [ebp-18h]
  '0051DACA: neg ebx
  '0051DACC: sbb ebx, ebx
  '0051DACE: push eax
  '0051DACF: neg ebx
  '0051DAD1: call esi
  '0051DAD3: neg ax
  '0051DAD6: mov ecx, [ebp-18h]
  '0051DAD9: push 0041CE08h
  '0051DADE: sbb eax, eax
  '0051DAE0: push ecx
  '0051DAE1: inc eax
  '0051DAE2: and ebx, eax
  '0051DAE4: neg ebx
  '0051DAE6: sbb ebx, ebx
  '0051DAE8: neg ebx
  '0051DAEA: call esi
  '0051DAEC: neg ax
  '0051DAEF: sbb eax, eax
  '0051DAF1: inc eax
  '0051DAF2: test ebx, eax
  '0051DAF4: jnz 51DB26h
  '0051DAF6: mov edx, [ebp-18h]
  '0051DAF9: push 00000000h
  '0051DAFB: push 00420F70h
  '0051DB00: lea eax, [ebp-38h]
  '0051DB03: push edx
  '0051DB04: push eax
  '0051DB05: call [00401368h]
  '0051DB0B: add esp, 00000010h
  '0051DB0E: push eax
  '0051DB0F: call edi
  '0051DB11: lea ecx, [ebp-40h]
  '0051DB14: mov [ebp-40h], eax
  '0051DB17: push ecx
  '0051DB18: call 004EB0B0h
  '0051DB1D: lea ecx, [ebp-38h]
  '0051DB20: call [00401030h]
  '0051DB26: lea edx, [ebp-18h]
  '0051DB29: lea eax, [ebp-54h]
  '0051DB2C: push edx
  '0051DB2D: push eax
  '0051DB2E: push 0041F304h
  '0051DB33: call [00401150h]
  '0051DB39: mov ebx, [ebp+08h]
  '0051DB3C: jmp 0051DA93h
  '0051DB41: mov eax, [54106Ch]
  '0051DB46: test eax, eax
  '0051DB48: jnz 51DB5Fh
  '0051DB4A: push 0054106Ch
  '0051DB4F: push 00411238h
  '0051DB54: call [004012B8h]
  '0051DB5A: mov eax, [54106Ch]
  '0051DB5F: mov ecx, [eax]
  '0051DB61: push eax
  '0051DB62: call [ecx+00000328h]
  '0051DB68: lea edx, [ebp-28h]
  '0051DB6B: push eax
  '0051DB6C: push edx
  '0051DB6D: call [004010E4h]
  '0051DB73: mov esi, eax
  '0051DB75: lea ecx, [ebp-3Ch]
  '0051DB78: push ecx
  '0051DB79: push esi
  '0051DB7A: mov eax, [esi]
  '0051DB7C: call [eax+000000E0h]
  '0051DB82: test eax, eax
  '0051DB84: fclex 
  '0051DB86: jnl 51DB9Ah
  '0051DB88: push 000000E0h
  '0051DB8D: push 0041E108h
  '0051DB92: push esi
  '0051DB93: push eax
  '0051DB94: call [004010A0h]
  '0051DB9A: mov edi, [004013B8h]
  '0051DBA0: xor edx, edx
  '0051DBA2: cmp word ptr [ebp-3Ch], 0001h
  '0051DBA7: lea ecx, [ebp-28h]
  '0051DBAA: setz dl
  '0051DBAD: neg edx
  '0051DBAF: mov esi, edx
  '0051DBB1: call edi
  '0051DBB3: test si, si
  '0051DBB6: jz 51DBDCh
  '0051DBB8: push 00000000h
  '0051DBBA: push 0041E3ECh
  '0051DBBF: push ebx
  '0051DBC0: call [0040137Ch]
  '0051DBC6: push eax
  '0051DBC7: lea eax, [ebp-28h]
  '0051DBCA: push eax
  '0051DBCB: call [004010E4h]
  '0051DBD1: push eax
  '0051DBD2: call 004F8E60h
  '0051DBD7: lea ecx, [ebp-28h]
  '0051DBDA: call edi
  '0051DBDC: call [00401104h]
  '0051DBE2: mov edx, 0042A94Ch
  '0051DBE7: lea ecx, [ebp-24h]
  '0051DBEA: call [004012D8h]
  '0051DBF0: mov ecx, [ebx]
  '0051DBF2: lea edx, [ebp-24h]
  '0051DBF5: push edx
  '0051DBF6: push ebx
  '0051DBF7: call [ecx+00000714h]
  '0051DBFD: lea ecx, [ebp-24h]
  '0051DC00: call [004013B4h]
  '0051DC06: mov [ebp-04h], 00000000h
  '0051DC0D: push 0051DC56h
  '0051DC12: jmp 51DC30h
  '0051DC14: lea ecx, [ebp-24h]
  '0051DC17: call [004013B4h]
  '0051DC1D: lea ecx, [ebp-28h]
  '0051DC20: call [004013B8h]
  '0051DC26: lea ecx, [ebp-38h]
  '0051DC29: call [00401030h]
  '0051DC2F: ret 
End Sub
Private Sub Form__51E0D0
  '0051E0D0: push ebp
  '0051E0D1: mov ebp, esp
  '0051E0D3: sub esp, 00000018h
  '0051E0D6: push 004081B6h
  '0051E0DB: mov eax, fs:[00h]
  '0051E0E1: push eax
  '0051E0E2: mov fs:[00000000h], esp
  '0051E0E9: mov eax, 000000A4h
  '0051E0EE: call 004081B0h
  '0051E0F3: push ebx
  '0051E0F4: push esi
  '0051E0F5: push edi
  '0051E0F6: mov [ebp-18h], esp
  '0051E0F9: mov [ebp-14h], 00406CD0h
  '0051E100: mov eax, [ebp+08h]
  '0051E103: and eax, 00000001h
  '0051E106: mov [ebp-10h], eax
  '0051E109: mov ecx, [ebp+08h]
  '0051E10C: and ecx, FFFFFFFEh
  '0051E10F: mov [ebp+08h], ecx
  '0051E112: mov [ebp-0Ch], 00000000h
  '0051E119: mov edx, [ebp+08h]
  '0051E11C: mov eax, [edx]
  '0051E11E: mov ecx, [ebp+08h]
  '0051E121: push ecx
  '0051E122: call [eax+04h]
  '0051E125: mov [ebp-04h], 00000001h
  '0051E12C: mov [ebp-04h], 00000002h
  '0051E133: push FFFFFFFFh
  '0051E135: call [004010E8h]
  '0051E13B: mov [ebp-04h], 00000003h
  '0051E142: lea edx, [ebp-60h]
  '0051E145: push edx
  '0051E146: mov eax, [ebp+08h]
  '0051E149: mov ecx, [eax]
  '0051E14B: mov edx, [ebp+08h]
  '0051E14E: push edx
  '0051E14F: call [ecx+00000080h]
  '0051E155: fclex 
  '0051E157: mov [ebp-68h], eax
  '0051E15A: cmp [ebp-68h], 00000000h
  '0051E15E: jnl 51E180h
  '0051E160: push 00000080h
  '0051E165: push 00421C34h
  '0051E16A: mov eax, [ebp+08h]
  '0051E16D: push eax
  '0051E16E: mov ecx, [ebp-68h]
  '0051E171: push ecx
  '0051E172: call [004010A0h]
  '0051E178: mov [ebp-00000094h], eax
  '0051E17E: jmp 51E18Ah
  '0051E180: mov [ebp-00000094h], 00000000h
  '0051E18A: fld real4 ptr [ebp-60h]
  '0051E18D: fcomp real4 ptr [004067C4h]
  '0051E193: fstsw ax
  '0051E195: test ah, 01h
  '0051E198: jz 51E1EAh
  '0051E19A: mov [ebp-04h], 00000004h
  '0051E1A1: push 44BB8000h
  '0051E1A6: mov edx, [ebp+08h]
  '0051E1A9: mov eax, [edx]
  '0051E1AB: mov ecx, [ebp+08h]
  '0051E1AE: push ecx
  '0051E1AF: call [eax+00000084h]
  '0051E1B5: fclex 
  '0051E1B7: mov [ebp-68h], eax
  '0051E1BA: cmp [ebp-68h], 00000000h
  '0051E1BE: jnl 51E1E0h
  '0051E1C0: push 00000084h
  '0051E1C5: push 00421C34h
  '0051E1CA: mov edx, [ebp+08h]
  '0051E1CD: push edx
  '0051E1CE: mov eax, [ebp-68h]
  '0051E1D1: push eax
  '0051E1D2: call [004010A0h]
  '0051E1D8: mov [ebp-00000098h], eax
  '0051E1DE: jmp 51E1EAh
  '0051E1E0: mov [ebp-00000098h], 00000000h
  '0051E1EA: mov [ebp-04h], 00000006h
  '0051E1F1: lea ecx, [ebp-60h]
  '0051E1F4: push ecx
  '0051E1F5: mov edx, [ebp+08h]
  '0051E1F8: mov eax, [edx]
  '0051E1FA: mov ecx, [ebp+08h]
  '0051E1FD: push ecx
  '0051E1FE: call [eax+00000088h]
  '0051E204: fclex 
  '0051E206: mov [ebp-68h], eax
  '0051E209: cmp [ebp-68h], 00000000h
  '0051E20D: jnl 51E22Fh
  '0051E20F: push 00000088h
  '0051E214: push 00421C34h
  '0051E219: mov edx, [ebp+08h]
  '0051E21C: push edx
  '0051E21D: mov eax, [ebp-68h]
  '0051E220: push eax
  '0051E221: call [004010A0h]
  '0051E227: mov [ebp-0000009Ch], eax
  '0051E22D: jmp 51E239h
  '0051E22F: mov [ebp-0000009Ch], 00000000h
  '0051E239: fld real4 ptr [ebp-60h]
  '0051E23C: fcomp real4 ptr [00401894h]
  '0051E242: fstsw ax
  '0051E244: test ah, 01h
  '0051E247: jz 51E299h
  '0051E249: mov [ebp-04h], 00000007h
  '0051E250: push 44D48000h
  '0051E255: mov ecx, [ebp+08h]
  '0051E258: mov edx, [ecx]
  '0051E25A: mov eax, [ebp+08h]
  '0051E25D: push eax
  '0051E25E: call [edx+0000008Ch]
  '0051E264: fclex 
  '0051E266: mov [ebp-68h], eax
  '0051E269: cmp [ebp-68h], 00000000h
  '0051E26D: jnl 51E28Fh
  '0051E26F: push 0000008Ch
  '0051E274: push 00421C34h
  '0051E279: mov ecx, [ebp+08h]
  '0051E27C: push ecx
  '0051E27D: mov edx, [ebp-68h]
  '0051E280: push edx
  '0051E281: call [004010A0h]
  '0051E287: mov [ebp-000000A0h], eax
  '0051E28D: jmp 51E299h
  '0051E28F: mov [ebp-000000A0h], 00000000h
  '0051E299: mov [ebp-04h], 00000009h
  '0051E2A0: lea eax, [ebp-60h]
  '0051E2A3: push eax
  '0051E2A4: mov ecx, [ebp+08h]
  '0051E2A7: mov edx, [ecx]
  '0051E2A9: mov eax, [ebp+08h]
  '0051E2AC: push eax
  '0051E2AD: call [edx+00000100h]
  '0051E2B3: fclex 
  '0051E2B5: mov [ebp-68h], eax
  '0051E2B8: cmp [ebp-68h], 00000000h
  '0051E2BC: jnl 51E2DEh
  '0051E2BE: push 00000100h
  '0051E2C3: push 00421C34h
  '0051E2C8: mov ecx, [ebp+08h]
  '0051E2CB: push ecx
  '0051E2CC: mov edx, [ebp-68h]
  '0051E2CF: push edx
  '0051E2D0: call [004010A0h]
  '0051E2D6: mov [ebp-000000A4h], eax
  '0051E2DC: jmp 51E2E8h
  '0051E2DE: mov [ebp-000000A4h], 00000000h
  '0051E2E8: mov eax, [ebp+08h]
  '0051E2EB: mov ecx, [eax]
  '0051E2ED: mov edx, [ebp+08h]
  '0051E2F0: push edx
  '0051E2F1: call [ecx+00000304h]
  '0051E2F7: push eax
  '0051E2F8: lea eax, [ebp-24h]
  '0051E2FB: push eax
  '0051E2FC: call [004010E4h]
  '0051E302: mov [ebp-70h], eax
  '0051E305: lea ecx, [ebp-64h]
  '0051E308: push ecx
  '0051E309: mov edx, [ebp+08h]
  '0051E30C: mov eax, [edx]
  '0051E30E: mov ecx, [ebp+08h]
  '0051E311: push ecx
  '0051E312: call [eax+00000108h]
  '0051E318: fclex 
  '0051E31A: mov [ebp-6Ch], eax
  '0051E31D: cmp [ebp-6Ch], 00000000h
  '0051E321: jnl 51E343h
  '0051E323: push 00000108h
  '0051E328: push 00421C34h
  '0051E32D: mov edx, [ebp+08h]
  '0051E330: push edx
  '0051E331: mov eax, [ebp-6Ch]
  '0051E334: push eax
  '0051E335: call [004010A0h]
  '0051E33B: mov [ebp-000000A8h], eax
  '0051E341: jmp 51E34Dh
  '0051E343: mov [ebp-000000A8h], 00000000h
  '0051E34D: fld real4 ptr [ebp-64h]
  '0051E350: fsub real4 ptr [00406D24h]
  '0051E356: fstp real4 ptr [ebp-54h]
  '0051E359: fstsw ax
  '0051E35B: test al, 0Dh
  '0051E35D: jnz 0051E85Eh
  '0051E363: mov [ebp-5Ch], 00000004h
  '0051E36A: mov ecx, [ebp-60h]
  '0051E36D: mov [ebp-44h], ecx
  '0051E370: mov [ebp-4Ch], 00000004h
  '0051E377: mov [ebp-34h], 00000000h
  '0051E37E: mov [ebp-3Ch], 00000002h
  '0051E385: mov eax, 00000010h
  '0051E38A: call 004081B0h
  '0051E38F: mov edx, esp
  '0051E391: mov eax, [ebp-5Ch]
  '0051E394: mov [edx], eax
  '0051E396: mov ecx, [ebp-58h]
  '0051E399: mov [edx+04h], ecx
  '0051E39C: mov eax, [ebp-54h]
  '0051E39F: mov [edx+08h], eax
  '0051E3A2: mov ecx, [ebp-50h]
  '0051E3A5: mov [edx+0Ch], ecx
  '0051E3A8: mov eax, 00000010h
  '0051E3AD: call 004081B0h
  '0051E3B2: mov edx, esp
  '0051E3B4: mov eax, [ebp-4Ch]
  '0051E3B7: mov [edx], eax
  '0051E3B9: mov ecx, [ebp-48h]
  '0051E3BC: mov [edx+04h], ecx
  '0051E3BF: mov eax, [ebp-44h]
  '0051E3C2: mov [edx+08h], eax
  '0051E3C5: mov ecx, [ebp-40h]
  '0051E3C8: mov [edx+0Ch], ecx
  '0051E3CB: mov eax, 00000010h
  '0051E3D0: call 004081B0h
  '0051E3D5: mov edx, esp
  '0051E3D7: mov eax, [ebp-3Ch]
  '0051E3DA: mov [edx], eax
  '0051E3DC: mov ecx, [ebp-38h]
  '0051E3DF: mov [edx+04h], ecx
  '0051E3E2: mov eax, [ebp-34h]
  '0051E3E5: mov [edx+08h], eax
  '0051E3E8: mov ecx, [ebp-30h]
  '0051E3EB: mov [edx+0Ch], ecx
  '0051E3EE: push 00000000h
  '0051E3F0: mov edx, [ebp-70h]
  '0051E3F3: mov eax, [edx]
  '0051E3F5: mov ecx, [ebp-70h]
  '0051E3F8: push ecx
  '0051E3F9: call [eax+00000224h]
  '0051E3FF: fclex 
  '0051E401: mov [ebp-74h], eax
  '0051E404: cmp [ebp-74h], 00000000h
  '0051E408: jnl 51E42Ah
  '0051E40A: push 00000224h
  '0051E40F: push 0041E3FCh
  '0051E414: mov edx, [ebp-70h]
  '0051E417: push edx
  '0051E418: mov eax, [ebp-74h]
  '0051E41B: push eax
  '0051E41C: call [004010A0h]
  '0051E422: mov [ebp-000000ACh], eax
  '0051E428: jmp 51E434h
  '0051E42A: mov [ebp-000000ACh], 00000000h
  '0051E434: lea ecx, [ebp-24h]
  '0051E437: call [004013B8h]
  '0051E43D: mov [ebp-04h], 0000000Ah
  '0051E444: mov ecx, [ebp+08h]
  '0051E447: mov edx, [ecx]
  '0051E449: mov eax, [ebp+08h]
  '0051E44C: push eax
  '0051E44D: call [edx+00000304h]
  '0051E453: push eax
  '0051E454: lea ecx, [ebp-24h]
  '0051E457: push ecx
  '0051E458: call [004010E4h]
  '0051E45E: mov [ebp-68h], eax
  '0051E461: lea edx, [ebp-60h]
  '0051E464: push edx
  '0051E465: mov eax, [ebp-68h]
  '0051E468: mov ecx, [eax]
  '0051E46A: mov edx, [ebp-68h]
  '0051E46D: push edx
  '0051E46E: call [ecx+00000080h]
  '0051E474: fclex 
  '0051E476: mov [ebp-6Ch], eax
  '0051E479: cmp [ebp-6Ch], 00000000h
  '0051E47D: jnl 51E49Fh
  '0051E47F: push 00000080h
  '0051E484: push 0041E3FCh
  '0051E489: mov eax, [ebp-68h]
  '0051E48C: push eax
  '0051E48D: mov ecx, [ebp-6Ch]
  '0051E490: push ecx
  '0051E491: call [004010A0h]
  '0051E497: mov [ebp-000000B0h], eax
  '0051E49D: jmp 51E4A9h
  '0051E49F: mov [ebp-000000B0h], 00000000h
  '0051E4A9: lea edx, [ebp-64h]
  '0051E4AC: push edx
  '0051E4AD: mov eax, [ebp+08h]
  '0051E4B0: mov ecx, [eax]
  '0051E4B2: mov edx, [ebp+08h]
  '0051E4B5: push edx
  '0051E4B6: call [ecx+00000100h]
  '0051E4BC: fclex 
  '0051E4BE: mov [ebp-70h], eax
  '0051E4C1: cmp [ebp-70h], 00000000h
  '0051E4C5: jnl 51E4E7h
  '0051E4C7: push 00000100h
  '0051E4CC: push 00421C34h
  '0051E4D1: mov eax, [ebp+08h]
  '0051E4D4: push eax
  '0051E4D5: mov ecx, [ebp-70h]
  '0051E4D8: push ecx
  '0051E4D9: call [004010A0h]
  '0051E4DF: mov [ebp-000000B4h], eax
  '0051E4E5: jmp 51E4F1h
  '0051E4E7: mov [ebp-000000B4h], 00000000h
  '0051E4F1: mov edx, [ebp+08h]
  '0051E4F4: mov eax, [edx]
  '0051E4F6: mov ecx, [ebp+08h]
  '0051E4F9: push ecx
  '0051E4FA: call [eax+00000300h]
  '0051E500: push eax
  '0051E501: lea edx, [ebp-28h]
  '0051E504: push edx
  '0051E505: call [004010E4h]
  '0051E50B: mov [ebp-74h], eax
  '0051E50E: mov [ebp-54h], 00000118h
  '0051E515: mov [ebp-5Ch], 00000002h
  '0051E51C: fld real4 ptr [ebp-64h]
  '0051E51F: fsub real4 ptr [00401898h]
  '0051E525: fstp real4 ptr [ebp-44h]
  '0051E528: fstsw ax
  '0051E52A: test al, 0Dh
  '0051E52C: jnz 0051E85Eh
  '0051E532: mov [ebp-4Ch], 00000004h
  '0051E539: fld real4 ptr [ebp-60h]
  '0051E53C: fadd real4 ptr [00406D20h]
  '0051E542: fstp real4 ptr [ebp-34h]
  '0051E545: fstsw ax
  '0051E547: test al, 0Dh
  '0051E549: jnz 0051E85Eh
  '0051E54F: mov [ebp-3Ch], 00000004h
  '0051E556: mov eax, 00000010h
  '0051E55B: call 004081B0h
  '0051E560: mov eax, esp
  '0051E562: mov ecx, [ebp-5Ch]
  '0051E565: mov [eax], ecx
  '0051E567: mov edx, [ebp-58h]
  '0051E56A: mov [eax+04h], edx
  '0051E56D: mov ecx, [ebp-54h]
  '0051E570: mov [eax+08h], ecx
  '0051E573: mov edx, [ebp-50h]
  '0051E576: mov [eax+0Ch], edx
  '0051E579: mov eax, 00000010h
  '0051E57E: call 004081B0h
  '0051E583: mov eax, esp
  '0051E585: mov ecx, [ebp-4Ch]
  '0051E588: mov [eax], ecx
  '0051E58A: mov edx, [ebp-48h]
  '0051E58D: mov [eax+04h], edx
  '0051E590: mov ecx, [ebp-44h]
  '0051E593: mov [eax+08h], ecx
  '0051E596: mov edx, [ebp-40h]
  '0051E599: mov [eax+0Ch], edx
  '0051E59C: mov eax, 00000010h
  '0051E5A1: call 004081B0h
  '0051E5A6: mov eax, esp
  '0051E5A8: mov ecx, [ebp-3Ch]
  '0051E5AB: mov [eax], ecx
  '0051E5AD: mov edx, [ebp-38h]
  '0051E5B0: mov [eax+04h], edx
  '0051E5B3: mov ecx, [ebp-34h]
  '0051E5B6: mov [eax+08h], ecx
  '0051E5B9: mov edx, [ebp-30h]
  '0051E5BC: mov [eax+0Ch], edx
  '0051E5BF: push 00000000h
  '0051E5C1: mov eax, [ebp-74h]
  '0051E5C4: mov ecx, [eax]
  '0051E5C6: mov edx, [ebp-74h]
  '0051E5C9: push edx
  '0051E5CA: call [ecx+00000224h]
  '0051E5D0: fclex 
  '0051E5D2: mov [ebp-78h], eax
  '0051E5D5: cmp [ebp-78h], 00000000h
  '0051E5D9: jnl 51E5FBh
  '0051E5DB: push 00000224h
  '0051E5E0: push 0041E3FCh
  '0051E5E5: mov eax, [ebp-74h]
  '0051E5E8: push eax
  '0051E5E9: mov ecx, [ebp-78h]
  '0051E5EC: push ecx
  '0051E5ED: call [004010A0h]
  '0051E5F3: mov [ebp-000000B8h], eax
  '0051E5F9: jmp 51E605h
  '0051E5FB: mov [ebp-000000B8h], 00000000h
  '0051E605: lea edx, [ebp-28h]
  '0051E608: push edx
  '0051E609: lea eax, [ebp-24h]
  '0051E60C: push eax
  '0051E60D: push 00000002h
  '0051E60F: call [00401064h]
  '0051E615: add esp, 0000000Ch
  '0051E618: mov [ebp-04h], 0000000Bh
  '0051E61F: mov ecx, [ebp+08h]
  '0051E622: mov edx, [ecx]
  '0051E624: mov eax, [ebp+08h]
  '0051E627: push eax
  '0051E628: call [edx+00000300h]
  '0051E62E: push eax
  '0051E62F: lea ecx, [ebp-24h]
  '0051E632: push ecx
  '0051E633: call [004010E4h]
  '0051E639: mov [ebp-68h], eax
  '0051E63C: lea edx, [ebp-60h]
  '0051E63F: push edx
  '0051E640: mov eax, [ebp-68h]
  '0051E643: mov ecx, [eax]
  '0051E645: mov edx, [ebp-68h]
  '0051E648: push edx
  '0051E649: call [ecx+78h]
  '0051E64C: fclex 
  '0051E64E: mov [ebp-6Ch], eax
  '0051E651: cmp [ebp-6Ch], 00000000h
  '0051E655: jnl 51E674h
  '0051E657: push 00000078h
  '0051E659: push 0041E3FCh
  '0051E65E: mov eax, [ebp-68h]
  '0051E661: push eax
  '0051E662: mov ecx, [ebp-6Ch]
  '0051E665: push ecx
  '0051E666: call [004010A0h]
  '0051E66C: mov [ebp-000000BCh], eax
  '0051E672: jmp 51E67Eh
  '0051E674: mov [ebp-000000BCh], 00000000h
  '0051E67E: mov edx, [ebp+08h]
  '0051E681: mov eax, [edx]
  '0051E683: mov ecx, [ebp+08h]
  '0051E686: push ecx
  '0051E687: call [eax+00000304h]
  '0051E68D: push eax
  '0051E68E: lea edx, [ebp-28h]
  '0051E691: push edx
  '0051E692: call [004010E4h]
  '0051E698: mov [ebp-70h], eax
  '0051E69B: lea eax, [ebp-64h]
  '0051E69E: push eax
  '0051E69F: mov ecx, [ebp-70h]
  '0051E6A2: mov edx, [ecx]
  '0051E6A4: mov eax, [ebp-70h]
  '0051E6A7: push eax
  '0051E6A8: call [edx+00000080h]
  '0051E6AE: fclex 
  '0051E6B0: mov [ebp-74h], eax
  '0051E6B3: cmp [ebp-74h], 00000000h
  '0051E6B7: jnl 51E6D9h
  '0051E6B9: push 00000080h
  '0051E6BE: push 0041E3FCh
  '0051E6C3: mov ecx, [ebp-70h]
  '0051E6C6: push ecx
  '0051E6C7: mov edx, [ebp-74h]
  '0051E6CA: push edx
  '0051E6CB: call [004010A0h]
  '0051E6D1: mov [ebp-000000C0h], eax
  '0051E6D7: jmp 51E6E3h
  '0051E6D9: mov [ebp-000000C0h], 00000000h
  '0051E6E3: mov eax, [ebp+08h]
  '0051E6E6: mov ecx, [eax]
  '0051E6E8: mov edx, [ebp+08h]
  '0051E6EB: push edx
  '0051E6EC: call [ecx+000002FCh]
  '0051E6F2: push eax
  '0051E6F3: lea eax, [ebp-2Ch]
  '0051E6F6: push eax
  '0051E6F7: call [004010E4h]
  '0051E6FD: mov [ebp-78h], eax
  '0051E700: mov [ebp-54h], 00000118h
  '0051E707: mov [ebp-5Ch], 00000002h
  '0051E70E: mov [ebp-44h], 00000357h
  '0051E715: mov [ebp-4Ch], 00000002h
  '0051E71C: fld real4 ptr [ebp-64h]
  '0051E71F: fadd real4 ptr [00406D20h]
  '0051E725: fstp real4 ptr [ebp-34h]
  '0051E728: fstsw ax
  '0051E72A: test al, 0Dh
  '0051E72C: jnz 0051E85Eh
  '0051E732: mov [ebp-3Ch], 00000004h
  '0051E739: mov eax, 00000010h
  '0051E73E: call 004081B0h
  '0051E743: mov ecx, esp
  '0051E745: mov edx, [ebp-5Ch]
  '0051E748: mov [ecx], edx
  '0051E74A: mov eax, [ebp-58h]
  '0051E74D: mov [ecx+04h], eax
  '0051E750: mov edx, [ebp-54h]
  '0051E753: mov [ecx+08h], edx
  '0051E756: mov eax, [ebp-50h]
  '0051E759: mov [ecx+0Ch], eax
  '0051E75C: mov eax, 00000010h
  '0051E761: call 004081B0h
  '0051E766: mov ecx, esp
  '0051E768: mov edx, [ebp-4Ch]
  '0051E76B: mov [ecx], edx
  '0051E76D: mov eax, [ebp-48h]
  '0051E770: mov [ecx+04h], eax
  '0051E773: mov edx, [ebp-44h]
  '0051E776: mov [ecx+08h], edx
  '0051E779: mov eax, [ebp-40h]
  '0051E77C: mov [ecx+0Ch], eax
  '0051E77F: mov eax, 00000010h
  '0051E784: call 004081B0h
  '0051E789: mov ecx, esp
  '0051E78B: mov edx, [ebp-3Ch]
  '0051E78E: mov [ecx], edx
  '0051E790: mov eax, [ebp-38h]
  '0051E793: mov [ecx+04h], eax
  '0051E796: mov edx, [ebp-34h]
  '0051E799: mov [ecx+08h], edx
  '0051E79C: mov eax, [ebp-30h]
  '0051E79F: mov [ecx+0Ch], eax
  '0051E7A2: fld real4 ptr [ebp-60h]
  '0051E7A5: fadd real4 ptr [00406D20h]
  '0051E7AB: fstsw ax
  '0051E7AD: test al, 0Dh
  '0051E7AF: jnz 0051E85Eh
  '0051E7B5: push ecx
  '0051E7B6: fstp real4 ptr [esp]
  '0051E7B9: mov ecx, [ebp-78h]
  '0051E7BC: mov edx, [ecx]
  '0051E7BE: mov eax, [ebp-78h]
  '0051E7C1: push eax
  '0051E7C2: call [edx+000001B4h]
  '0051E7C8: fclex 
  '0051E7CA: mov [ebp-7Ch], eax
  '0051E7CD: cmp [ebp-7Ch], 00000000h
  '0051E7D1: jnl 51E7F3h
  '0051E7D3: push 000001B4h
  '0051E7D8: push 00420F60h
  '0051E7DD: mov ecx, [ebp-78h]
  '0051E7E0: push ecx
  '0051E7E1: mov edx, [ebp-7Ch]
  '0051E7E4: push edx
  '0051E7E5: call [004010A0h]
  '0051E7EB: mov [ebp-000000C4h], eax
  '0051E7F1: jmp 51E7FDh
  '0051E7F3: mov [ebp-000000C4h], 00000000h
  '0051E7FD: lea eax, [ebp-2Ch]
  '0051E800: push eax
  '0051E801: lea ecx, [ebp-28h]
  '0051E804: push ecx
  '0051E805: lea edx, [ebp-24h]
  '0051E808: push edx
  '0051E809: push 00000003h
  '0051E80B: call [00401064h]
  '0051E811: add esp, 00000010h
  '0051E814: mov [ebp-10h], 00000000h
  '0051E81B: wait 
  '0051E81C: push 0051E83Ch
  '0051E821: jmp 51E83Bh
  '0051E823: lea eax, [ebp-2Ch]
  '0051E826: push eax
  '0051E827: lea ecx, [ebp-28h]
  '0051E82A: push ecx
  '0051E82B: lea edx, [ebp-24h]
  '0051E82E: push edx
  '0051E82F: push 00000003h
  '0051E831: call [00401064h]
  '0051E837: add esp, 00000010h
  '0051E83A: ret 
End Sub
Private Sub Form__51E870
  '0051E870: push ebp
  '0051E871: mov ebp, esp
  '0051E873: sub esp, 0000000Ch
  '0051E876: push 004081B6h
  '0051E87B: mov eax, fs:[00h]
  '0051E881: push eax
  '0051E882: mov fs:[00000000h], esp
  '0051E889: sub esp, 0000004Ch
  '0051E88C: push ebx
  '0051E88D: push esi
  '0051E88E: push edi
  '0051E88F: mov [ebp-0Ch], esp
  '0051E892: mov [ebp-08h], 00406D28h
  '0051E899: mov esi, [ebp+08h]
  '0051E89C: mov eax, esi
  '0051E89E: and eax, 00000001h
  '0051E8A1: mov [ebp-04h], eax
  '0051E8A4: and esi, FFFFFFFEh
  '0051E8A7: push esi
  '0051E8A8: mov [ebp+08h], esi
  '0051E8AB: mov ecx, [esi]
  '0051E8AD: call [ecx+04h]
  '0051E8B0: mov edx, [esi]
  '0051E8B2: lea eax, [ebp-18h]
  '0051E8B5: xor edi, edi
  '0051E8B7: push eax
  '0051E8B8: push esi
  '0051E8B9: mov [ebp-18h], edi
  '0051E8BC: mov [ebp-1Ch], edi
  '0051E8BF: mov [ebp-20h], edi
  '0051E8C2: mov [ebp-30h], edi
  '0051E8C5: mov [ebp-44h], edi
  '0051E8C8: call [edx+000001C0h]
  '0051E8CE: cmp eax, edi
  '0051E8D0: fclex 
  '0051E8D2: jnl 51E8E6h
  '0051E8D4: push 000001C0h
  '0051E8D9: push 00421C34h
  '0051E8DE: push esi
  '0051E8DF: push eax
  '0051E8E0: call [004010A0h]
  '0051E8E6: mov edx, [ebp-18h]
  '0051E8E9: lea ecx, [ebp-30h]
  '0051E8EC: push ecx
  '0051E8ED: push 00000004h
  '0051E8EF: push edx
  '0051E8F0: mov [ebp-28h], 80020004h
  '0051E8F7: mov [ebp-30h], 0000000Ah
  '0051E8FE: call [00401148h]
  '0051E904: mov edx, eax
  '0051E906: lea ecx, [ebp-1Ch]
  '0051E909: call [00401378h]
  '0051E90F: push eax
  '0051E910: call [004013BCh]
  '0051E916: mov eax, [541024h]
  '0051E91B: fstp real8 ptr [ebp-4Ch]
  '0051E91E: cmp eax, edi
  '0051E920: jnz 51E932h
  '0051E922: push 00541024h
  '0051E927: push 00413334h
  '0051E92C: call [004012B8h]
  '0051E932: mov esi, [00541024h]
  '0051E938: mov edx, 0042A9CCh
  '0051E93D: lea ecx, [ebp-20h]
  '0051E940: call [004012D8h]
  '0051E946: fld real8 ptr [ebp-4Ch]
  '0051E949: call [00401348h]
  '0051E94F: lea ecx, [ebp-20h]
  '0051E952: lea edx, [ebp-44h]
  '0051E955: mov [ebp-44h], eax
  '0051E958: mov eax, [esi]
  '0051E95A: push ecx
  '0051E95B: push edx
  '0051E95C: push esi
  '0051E95D: call [eax+00000714h]
  '0051E963: cmp eax, edi
  '0051E965: fclex 
  '0051E967: jnl 51E97Bh
  '0051E969: push 00000714h
  '0051E96E: push 0041C118h
  '0051E973: push esi
  '0051E974: push eax
  '0051E975: call [004010A0h]
  '0051E97B: lea eax, [ebp-20h]
  '0051E97E: lea ecx, [ebp-1Ch]
  '0051E981: push eax
  '0051E982: lea edx, [ebp-18h]
  '0051E985: push ecx
  '0051E986: push edx
  '0051E987: push 00000003h
  '0051E989: call [004012E8h]
  '0051E98F: add esp, 00000010h
  '0051E992: lea ecx, [ebp-30h]
  '0051E995: call [00401030h]
  '0051E99B: call [00401104h]
  '0051E9A1: mov [ebp-04h], edi
  '0051E9A4: wait 
  '0051E9A5: push 0051E9CEh
  '0051E9AA: jmp 51E9CDh
  '0051E9AC: lea eax, [ebp-20h]
  '0051E9AF: lea ecx, [ebp-1Ch]
  '0051E9B2: push eax
  '0051E9B3: lea edx, [ebp-18h]
  '0051E9B6: push ecx
  '0051E9B7: push edx
  '0051E9B8: push 00000003h
  '0051E9BA: call [004012E8h]
  '0051E9C0: add esp, 00000010h
  '0051E9C3: lea ecx, [ebp-30h]
  '0051E9C6: call [00401030h]
  '0051E9CC: ret 
End Sub
Private Sub txtSend__51EB60
  '0051EB60: push ebp
  '0051EB61: mov ebp, esp
  '0051EB63: sub esp, 0000000Ch
  '0051EB66: push 004081B6h
  '0051EB6B: mov eax, fs:[00h]
  '0051EB71: push eax
  '0051EB72: mov fs:[00000000h], esp
  '0051EB79: sub esp, 00000010h
  '0051EB7C: push ebx
  '0051EB7D: push esi
  '0051EB7E: push edi
  '0051EB7F: mov [ebp-0Ch], esp
  '0051EB82: mov [ebp-08h], 00406D48h
  '0051EB89: mov esi, [ebp+08h]
  '0051EB8C: mov eax, esi
  '0051EB8E: and eax, 00000001h
  '0051EB91: mov [ebp-04h], eax
  '0051EB94: and esi, FFFFFFFEh
  '0051EB97: push esi
  '0051EB98: mov [ebp+08h], esi
  '0051EB9B: mov ecx, [esi]
  '0051EB9D: call [ecx+04h]
  '0051EBA0: mov edi, [ebp+0Ch]
  '0051EBA3: cmp word ptr [edi], 000Dh
  '0051EBA7: jnz 51EBCDh
  '0051EBA9: mov edx, [esi]
  '0051EBAB: push esi
  '0051EBAC: call [edx+000006FCh]
  '0051EBB2: test eax, eax
  '0051EBB4: jnl 51EBC8h
  '0051EBB6: push 000006FCh
  '0051EBBB: push 00421C64h
  '0051EBC0: push esi
  '0051EBC1: push eax
  '0051EBC2: call [004010A0h]
  '0051EBC8: mov word ptr [edi], 0000h
  '0051EBCD: mov [ebp-04h], 00000000h
  '0051EBD4: mov eax, [ebp+08h]
  '0051EBD7: push eax
  '0051EBD8: mov ecx, [eax]
  '0051EBDA: call [ecx+08h]
  '0051EBDD: mov eax, [ebp-04h]
  '0051EBE0: mov ecx, [ebp-14h]
  '0051EBE3: pop edi
  '0051EBE4: pop esi
  '0051EBE5: mov fs:[00000000h], ecx
  '0051EBEC: pop ebx
  '0051EBED: mov esp, ebp
  '0051EBEF: pop ebp
  '0051EBF0: retn 0008h
End Sub
Private Sub cmdSend__51D460
  '0051D460: push ebp
  '0051D461: mov ebp, esp
  '0051D463: sub esp, 0000000Ch
  '0051D466: push 004081B6h
  '0051D46B: mov eax, fs:[00h]
  '0051D471: push eax
  '0051D472: mov fs:[00000000h], esp
  '0051D479: sub esp, 00000094h
  '0051D47F: push ebx
  '0051D480: push esi
  '0051D481: push edi
  '0051D482: mov [ebp-0Ch], esp
  '0051D485: mov [ebp-08h], 00406C90h
  '0051D48C: mov esi, [ebp+08h]
  '0051D48F: mov eax, esi
  '0051D491: and eax, 00000001h
  '0051D494: mov [ebp-04h], eax
  '0051D497: and esi, FFFFFFFEh
  '0051D49A: push esi
  '0051D49B: mov [ebp+08h], esi
  '0051D49E: mov ecx, [esi]
  '0051D4A0: call [ecx+04h]
  '0051D4A3: mov edx, [esi]
  '0051D4A5: lea eax, [ebp-28h]
  '0051D4A8: xor edi, edi
  '0051D4AA: push eax
  '0051D4AB: push esi
  '0051D4AC: mov [ebp-24h], edi
  '0051D4AF: mov [ebp-28h], edi
  '0051D4B2: mov [ebp-2Ch], edi
  '0051D4B5: mov [ebp-30h], edi
  '0051D4B8: mov [ebp-34h], edi
  '0051D4BB: mov [ebp-38h], edi
  '0051D4BE: mov [ebp-3Ch], edi
  '0051D4C1: mov [ebp-40h], edi
  '0051D4C4: mov [ebp-44h], edi
  '0051D4C7: mov [ebp-54h], edi
  '0051D4CA: mov [ebp-64h], edi
  '0051D4CD: mov [ebp-74h], edi
  '0051D4D0: mov [ebp-78h], edi
  '0051D4D3: mov [ebp-7Ch], edi
  '0051D4D6: call [edx+000001C0h]
  '0051D4DC: cmp eax, edi
  '0051D4DE: fclex 
  '0051D4E0: jnl 51D4F4h
  '0051D4E2: push 000001C0h
  '0051D4E7: push 00421C34h
  '0051D4EC: push esi
  '0051D4ED: push eax
  '0051D4EE: call [004010A0h]
  '0051D4F4: mov edx, [ebp-28h]
  '0051D4F7: lea ecx, [ebp-54h]
  '0051D4FA: push ecx
  '0051D4FB: push 00000004h
  '0051D4FD: push edx
  '0051D4FE: mov [ebp-4Ch], 80020004h
  '0051D505: mov [ebp-54h], 0000000Ah
  '0051D50C: call [00401148h]
  '0051D512: mov edx, eax
  '0051D514: lea ecx, [ebp-2Ch]
  '0051D517: call [00401378h]
  '0051D51D: push eax
  '0051D51E: call [004013BCh]
  '0051D524: mov eax, [541024h]
  '0051D529: fstp real8 ptr [ebp-00000084h]
  '0051D52F: cmp eax, edi
  '0051D531: jnz 51D548h
  '0051D533: push 00541024h
  '0051D538: push 00413334h
  '0051D53D: call [004012B8h]
  '0051D543: mov eax, [541024h]
  '0051D548: mov ecx, [eax]
  '0051D54A: push eax
  '0051D54B: call [ecx+00000688h]
  '0051D551: lea edx, [ebp-3Ch]
  '0051D554: push eax
  '0051D555: push edx
  '0051D556: call [004010E4h]
  '0051D55C: fld real8 ptr [ebp-00000084h]
  '0051D562: mov edi, eax
  '0051D564: lea eax, [ebp-40h]
  '0051D567: push eax
  '0051D568: mov ebx, [edi]
  '0051D56A: call [00401348h]
  '0051D570: push eax
  '0051D571: push edi
  '0051D572: call [ebx+40h]
  '0051D575: test eax, eax
  '0051D577: fclex 
  '0051D579: jnl 51D58Ah
  '0051D57B: push 00000040h
  '0051D57D: push 0041E60Ch
  '0051D582: push edi
  '0051D583: push eax
  '0051D584: call [004010A0h]
  '0051D58A: mov ecx, [ebp-40h]
  '0051D58D: push 00000000h
  '0051D58F: push 00000008h
  '0051D591: lea edx, [ebp-64h]
  '0051D594: push ecx
  '0051D595: push edx
  '0051D596: call [004011E4h]
  '0051D59C: add esp, 00000010h
  '0051D59F: push eax
  '0051D5A0: call [00401284h]
  '0051D5A6: xor ebx, ebx
  '0051D5A8: cmp ax, 0007h
  '0051D5AC: lea eax, [ebp-2Ch]
  '0051D5AF: lea ecx, [ebp-28h]
  '0051D5B2: push eax
  '0051D5B3: push ecx
  '0051D5B4: setz bl
  '0051D5B7: push 00000002h
  '0051D5B9: neg ebx
  '0051D5BB: call [004012E8h]
  '0051D5C1: lea edx, [ebp-40h]
  '0051D5C4: lea eax, [ebp-3Ch]
  '0051D5C7: push edx
  '0051D5C8: push eax
  '0051D5C9: push 00000002h
  '0051D5CB: call [00401064h]
  '0051D5D1: mov edi, [00401050h]
  '0051D5D7: lea ecx, [ebp-64h]
  '0051D5DA: lea edx, [ebp-54h]
  '0051D5DD: push ecx
  '0051D5DE: push edx
  '0051D5DF: push 00000002h
  '0051D5E1: call edi
  '0051D5E3: add esp, 00000024h
  '0051D5E6: test bx, bx
  '0051D5E9: jz 0051D8D9h
  '0051D5EF: mov eax, [esi]
  '0051D5F1: lea ecx, [ebp-28h]
  '0051D5F4: push ecx
  '0051D5F5: push esi
  '0051D5F6: call [eax+000001C0h]
  '0051D5FC: test eax, eax
  '0051D5FE: fclex 
  '0051D600: jnl 51D614h
  '0051D602: push 000001C0h
  '0051D607: push 00421C34h
  '0051D60C: push esi
  '0051D60D: push eax
  '0051D60E: call [004010A0h]
  '0051D614: mov eax, [ebp-28h]
  '0051D617: lea edx, [ebp-54h]
  '0051D61A: push edx
  '0051D61B: push 00000004h
  '0051D61D: push eax
  '0051D61E: mov [ebp-4Ch], 80020004h
  '0051D625: mov [ebp-54h], 0000000Ah
  '0051D62C: call [00401148h]
  '0051D632: mov edx, eax
  '0051D634: lea ecx, [ebp-2Ch]
  '0051D637: call [00401378h]
  '0051D63D: push eax
  '0051D63E: call [004013BCh]
  '0051D644: mov eax, [541024h]
  '0051D649: fstp real8 ptr [ebp-00000084h]
  '0051D64F: test eax, eax
  '0051D651: jnz 51D663h
  '0051D653: push 00541024h
  '0051D658: push 00413334h
  '0051D65D: call [004012B8h]
  '0051D663: mov ecx, [00541024h]
  '0051D669: mov edx, [esi]
  '0051D66B: push esi
  '0051D66C: mov [ebp-00000094h], ecx
  '0051D672: call [edx+00000300h]
  '0051D678: mov ebx, [004010E4h]
  '0051D67E: push eax
  '0051D67F: lea eax, [ebp-3Ch]
  '0051D682: push eax
  '0051D683: call ebx
  '0051D685: mov edi, eax
  '0051D687: lea edx, [ebp-30h]
  '0051D68A: push edx
  '0051D68B: push edi
  '0051D68C: mov ecx, [edi]
  '0051D68E: call [ecx+000000A0h]
  '0051D694: test eax, eax
  '0051D696: fclex 
  '0051D698: jnl 51D6ACh
  '0051D69A: push 000000A0h
  '0051D69F: push 0041E3FCh
  '0051D6A4: push edi
  '0051D6A5: push eax
  '0051D6A6: call [004010A0h]
  '0051D6AC: mov eax, [ebp-30h]
  '0051D6AF: push 0042A890h
  '0051D6B4: push eax
  '0051D6B5: call [0040108Ch]
  '0051D6BB: mov edx, eax
  '0051D6BD: lea ecx, [ebp-34h]
  '0051D6C0: call [00401378h]
  '0051D6C6: fld real8 ptr [ebp-00000084h]
  '0051D6CC: call [00401348h]
  '0051D6D2: mov edi, [ebp-00000094h]
  '0051D6D8: mov [ebp-78h], eax
  '0051D6DB: lea edx, [ebp-34h]
  '0051D6DE: lea eax, [ebp-78h]
  '0051D6E1: mov ecx, [edi]
  '0051D6E3: push edx
  '0051D6E4: push eax
  '0051D6E5: push edi
  '0051D6E6: call [ecx+00000714h]
  '0051D6EC: test eax, eax
  '0051D6EE: fclex 
  '0051D6F0: jnl 51D704h
  '0051D6F2: push 00000714h
  '0051D6F7: push 0041C118h
  '0051D6FC: push edi
  '0051D6FD: push eax
  '0051D6FE: call [004010A0h]
  '0051D704: lea ecx, [ebp-34h]
  '0051D707: lea edx, [ebp-30h]
  '0051D70A: push ecx
  '0051D70B: lea eax, [ebp-2Ch]
  '0051D70E: push edx
  '0051D70F: lea ecx, [ebp-28h]
  '0051D712: push eax
  '0051D713: push ecx
  '0051D714: push 00000004h
  '0051D716: call [004012E8h]
  '0051D71C: add esp, 00000014h
  '0051D71F: lea ecx, [ebp-3Ch]
  '0051D722: call [004013B8h]
  '0051D728: lea ecx, [ebp-54h]
  '0051D72B: call [00401030h]
  '0051D731: call [00401104h]
  '0051D737: mov edx, [esi]
  '0051D739: push esi
  '0051D73A: call [edx+00000304h]
  '0051D740: push eax
  '0051D741: lea eax, [ebp-44h]
  '0051D744: push eax
  '0051D745: call ebx
  '0051D747: mov ecx, [esi]
  '0051D749: push esi
  '0051D74A: mov [ebp-00000098h], eax
  '0051D750: call [ecx+00000304h]
  '0051D756: lea edx, [ebp-3Ch]
  '0051D759: push eax
  '0051D75A: push edx
  '0051D75B: call ebx
  '0051D75D: mov edi, eax
  '0051D75F: lea ecx, [ebp-28h]
  '0051D762: push ecx
  '0051D763: push edi
  '0051D764: mov eax, [edi]
  '0051D766: call [eax+000000A0h]
  '0051D76C: test eax, eax
  '0051D76E: fclex 
  '0051D770: jnl 51D784h
  '0051D772: push 000000A0h
  '0051D777: push 0041E3FCh
  '0051D77C: push edi
  '0051D77D: push eax
  '0051D77E: call [004010A0h]
  '0051D784: mov edx, [esi]
  '0051D786: push esi
  '0051D787: call [edx+00000300h]
  '0051D78D: push eax
  '0051D78E: lea eax, [ebp-40h]
  '0051D791: push eax
  '0051D792: call ebx
  '0051D794: mov edi, eax
  '0051D796: lea edx, [ebp-2Ch]
  '0051D799: push edx
  '0051D79A: push edi
  '0051D79B: mov ecx, [edi]
  '0051D79D: call [ecx+000000A0h]
  '0051D7A3: test eax, eax
  '0051D7A5: fclex 
  '0051D7A7: jnl 51D7BBh
  '0051D7A9: push 000000A0h
  '0051D7AE: push 0041E3FCh
  '0051D7B3: push edi
  '0051D7B4: push eax
  '0051D7B5: call [004010A0h]
  '0051D7BB: mov ecx, [ebp-28h]
  '0051D7BE: mov eax, [ebp-00000098h]
  '0051D7C4: push ecx
  '0051D7C5: push 0042A8A8h
  '0051D7CA: mov edi, [eax]
  '0051D7CC: call [0040108Ch]
  '0051D7D2: mov edx, eax
  '0051D7D4: lea ecx, [ebp-30h]
  '0051D7D7: call [00401378h]
  '0051D7DD: mov edx, [ebp-2Ch]
  '0051D7E0: push eax
  '0051D7E1: push edx
  '0051D7E2: call [0040108Ch]
  '0051D7E8: mov edx, eax
  '0051D7EA: lea ecx, [ebp-34h]
  '0051D7ED: call [00401378h]
  '0051D7F3: push eax
  '0051D7F4: push 0041F414h
  '0051D7F9: call [0040108Ch]
  '0051D7FF: mov edx, eax
  '0051D801: lea ecx, [ebp-38h]
  '0051D804: call [00401378h]
  '0051D80A: mov [ebp-000000A8h], edi
  '0051D810: mov edi, [ebp-00000098h]
  '0051D816: push eax
  '0051D817: mov eax, [ebp-000000A8h]
  '0051D81D: push edi
  '0051D81E: call [eax+000000A4h]
  '0051D824: test eax, eax
  '0051D826: fclex 
  '0051D828: jnl 51D83Ch
  '0051D82A: push 000000A4h
  '0051D82F: push 0041E3FCh
  '0051D834: push edi
  '0051D835: push eax
  '0051D836: call [004010A0h]
  '0051D83C: lea ecx, [ebp-38h]
  '0051D83F: lea edx, [ebp-34h]
  '0051D842: push ecx
  '0051D843: lea eax, [ebp-2Ch]
  '0051D846: push edx
  '0051D847: lea ecx, [ebp-30h]
  '0051D84A: push eax
  '0051D84B: lea edx, [ebp-28h]
  '0051D84E: push ecx
  '0051D84F: push edx
  '0051D850: push 00000005h
  '0051D852: call [004012E8h]
  '0051D858: lea eax, [ebp-44h]
  '0051D85B: lea ecx, [ebp-40h]
  '0051D85E: push eax
  '0051D85F: lea edx, [ebp-3Ch]
  '0051D862: push ecx
  '0051D863: push edx
  '0051D864: push 00000003h
  '0051D866: call [00401064h]
  '0051D86C: mov eax, [esi]
  '0051D86E: add esp, 00000028h
  '0051D871: push esi
  '0051D872: call [eax+00000300h]
  '0051D878: lea ecx, [ebp-3Ch]
  '0051D87B: push eax
  '0051D87C: push ecx
  '0051D87D: call ebx
  '0051D87F: mov edi, eax
  '0051D881: push 0041BC60h
  '0051D886: push edi
  '0051D887: mov edx, [edi]
  '0051D889: call [edx+000000A4h]
  '0051D88F: test eax, eax
  '0051D891: fclex 
  '0051D893: jnl 51D8A7h
  '0051D895: push 000000A4h
  '0051D89A: push 0041E3FCh
  '0051D89F: push edi
  '0051D8A0: push eax
  '0051D8A1: call [004010A0h]
  '0051D8A7: lea ecx, [ebp-3Ch]
  '0051D8AA: call [004013B8h]
  '0051D8B0: mov edx, 0042A8BCh
  '0051D8B5: lea ecx, [ebp-28h]
  '0051D8B8: call [004012D8h]
  '0051D8BE: mov eax, [esi]
  '0051D8C0: lea ecx, [ebp-28h]
  '0051D8C3: push ecx
  '0051D8C4: push esi
  '0051D8C5: call [eax+00000714h]
  '0051D8CB: lea ecx, [ebp-28h]
  '0051D8CE: call [004013B4h]
  '0051D8D4: jmp 0051D95Dh
  '0051D8D9: mov edx, 0042A8DCh
  '0051D8DE: lea ecx, [ebp-28h]
  '0051D8E1: call [004012D8h]
  '0051D8E7: mov edx, [esi]
  '0051D8E9: lea eax, [ebp-28h]
  '0051D8EC: push eax
  '0051D8ED: push esi
  '0051D8EE: call [edx+00000714h]
  '0051D8F4: mov esi, [004013B4h]
  '0051D8FA: lea ecx, [ebp-28h]
  '0051D8FD: call esi
  '0051D8FF: lea ecx, [ebp-74h]
  '0051D902: lea edx, [ebp-24h]
  '0051D905: push ecx
  '0051D906: lea eax, [ebp-54h]
  '0051D909: push edx
  '0051D90A: push eax
  '0051D90B: mov [ebp-7Ch], 00000004h
  '0051D912: mov [ebp-6Ch], 0042A908h
  '0051D919: mov [ebp-74h], 00000008h
  '0051D920: call [00401274h]
  '0051D926: push eax
  '0051D927: call [0040103Ch]
  '0051D92D: mov edx, eax
  '0051D92F: lea ecx, [ebp-28h]
  '0051D932: call [00401378h]
  '0051D938: lea ecx, [ebp-7Ch]
  '0051D93B: lea edx, [ebp-28h]
  '0051D93E: push ecx
  '0051D93F: lea eax, [ebp-64h]
  '0051D942: push edx
  '0051D943: push eax
  '0051D944: call 00513060h
  '0051D949: lea ecx, [ebp-28h]
  '0051D94C: call esi
  '0051D94E: lea ecx, [ebp-64h]
  '0051D951: lea edx, [ebp-54h]
  '0051D954: push ecx
  '0051D955: push edx
  '0051D956: push 00000002h
  '0051D958: call edi
  '0051D95A: add esp, 0000000Ch
  '0051D95D: call [00401104h]
  '0051D963: mov [ebp-04h], 00000000h
  '0051D96A: wait 
  '0051D96B: push 0051D9C0h
  '0051D970: jmp 51D9B6h
  '0051D972: lea eax, [ebp-38h]
  '0051D975: lea ecx, [ebp-34h]
  '0051D978: push eax
  '0051D979: lea edx, [ebp-30h]
  '0051D97C: push ecx
  '0051D97D: lea eax, [ebp-2Ch]
  '0051D980: push edx
  '0051D981: lea ecx, [ebp-28h]
  '0051D984: push eax
  '0051D985: push ecx
  '0051D986: push 00000005h
  '0051D988: call [004012E8h]
  '0051D98E: lea edx, [ebp-44h]
  '0051D991: lea eax, [ebp-40h]
  '0051D994: push edx
  '0051D995: lea ecx, [ebp-3Ch]
  '0051D998: push eax
  '0051D999: push ecx
  '0051D99A: push 00000003h
  '0051D99C: call [00401064h]
  '0051D9A2: lea edx, [ebp-64h]
  '0051D9A5: lea eax, [ebp-54h]
  '0051D9A8: push edx
  '0051D9A9: push eax
  '0051D9AA: push 00000002h
  '0051D9AC: call [00401050h]
  '0051D9B2: add esp, 00000034h
  '0051D9B5: ret 
End Sub
Private Sub txtChat__51DFA0
  '0051DFA0: push ebp
  '0051DFA1: mov ebp, esp
  '0051DFA3: sub esp, 0000000Ch
  '0051DFA6: push 004081B6h
  '0051DFAB: mov eax, fs:[00h]
  '0051DFB1: push eax
  '0051DFB2: mov fs:[00000000h], esp
  '0051DFB9: sub esp, 00000024h
  '0051DFBC: push ebx
  '0051DFBD: push esi
  '0051DFBE: push edi
  '0051DFBF: mov [ebp-0Ch], esp
  '0051DFC2: mov [ebp-08h], 00406CC0h
  '0051DFC9: mov esi, [ebp+08h]
  '0051DFCC: mov eax, esi
  '0051DFCE: and eax, 00000001h
  '0051DFD1: mov [ebp-04h], eax
  '0051DFD4: and esi, FFFFFFFEh
  '0051DFD7: push esi
  '0051DFD8: mov [ebp+08h], esi
  '0051DFDB: mov ecx, [esi]
  '0051DFDD: call [ecx+04h]
  '0051DFE0: mov edx, [esi]
  '0051DFE2: xor eax, eax
  '0051DFE4: push esi
  '0051DFE5: mov [ebp-18h], eax
  '0051DFE8: mov [ebp-1Ch], eax
  '0051DFEB: mov [ebp-20h], eax
  '0051DFEE: call [edx+00000304h]
  '0051DFF4: mov ebx, [004010E4h]
  '0051DFFA: push eax
  '0051DFFB: lea eax, [ebp-20h]
  '0051DFFE: push eax
  '0051DFFF: call ebx
  '0051E001: mov ecx, [esi]
  '0051E003: push esi
  '0051E004: mov edi, eax
  '0051E006: call [ecx+00000304h]
  '0051E00C: lea edx, [ebp-1Ch]
  '0051E00F: push eax
  '0051E010: push edx
  '0051E011: call ebx
  '0051E013: mov esi, eax
  '0051E015: lea ecx, [ebp-18h]
  '0051E018: push ecx
  '0051E019: push esi
  '0051E01A: mov eax, [esi]
  '0051E01C: call [eax+000000A0h]
  '0051E022: test eax, eax
  '0051E024: fclex 
  '0051E026: jnl 51E03Ah
  '0051E028: push 000000A0h
  '0051E02D: push 0041E3FCh
  '0051E032: push esi
  '0051E033: push eax
  '0051E034: call [004010A0h]
  '0051E03A: mov edx, [ebp-18h]
  '0051E03D: mov esi, [edi]
  '0051E03F: push edx
  '0051E040: call [00401044h]
  '0051E046: push eax
  '0051E047: push edi
  '0051E048: call [esi+00000114h]
  '0051E04E: test eax, eax
  '0051E050: fclex 
  '0051E052: jnl 51E066h
  '0051E054: push 00000114h
  '0051E059: push 0041E3FCh
  '0051E05E: push edi
  '0051E05F: push eax
  '0051E060: call [004010A0h]
  '0051E066: lea ecx, [ebp-18h]
  '0051E069: call [004013B4h]
  '0051E06F: lea eax, [ebp-20h]
  '0051E072: lea ecx, [ebp-1Ch]
  '0051E075: push eax
  '0051E076: push ecx
  '0051E077: push 00000002h
  '0051E079: call [00401064h]
  '0051E07F: add esp, 0000000Ch
  '0051E082: mov [ebp-04h], 00000000h
  '0051E089: push 0051E0AEh
  '0051E08E: jmp 51E0ADh
  '0051E090: lea ecx, [ebp-18h]
  '0051E093: call [004013B4h]
  '0051E099: lea edx, [ebp-20h]
  '0051E09C: lea eax, [ebp-1Ch]
  '0051E09F: push edx
  '0051E0A0: push eax
  '0051E0A1: push 00000002h
  '0051E0A3: call [00401064h]
  '0051E0A9: add esp, 0000000Ch
  '0051E0AC: ret 
End Sub
Private Sub save_chat__51DC80
  '0051DC80: push ebp
  '0051DC81: mov ebp, esp
  '0051DC83: sub esp, 0000000Ch
  '0051DC86: push 004081B6h
  '0051DC8B: mov eax, fs:[00h]
  '0051DC91: push eax
  '0051DC92: mov fs:[00000000h], esp
  '0051DC99: sub esp, 0000005Ch
  '0051DC9C: push ebx
  '0051DC9D: push esi
  '0051DC9E: push edi
  '0051DC9F: mov [ebp-0Ch], esp
  '0051DCA2: mov [ebp-08h], 00406CB0h
  '0051DCA9: mov esi, [ebp+08h]
  '0051DCAC: mov eax, esi
  '0051DCAE: and eax, 00000001h
  '0051DCB1: mov [ebp-04h], eax
  '0051DCB4: and esi, FFFFFFFEh
  '0051DCB7: push esi
  '0051DCB8: mov [ebp+08h], esi
  '0051DCBB: mov ecx, [esi]
  '0051DCBD: call [ecx+04h]
  '0051DCC0: mov edx, [esi]
  '0051DCC2: xor ebx, ebx
  '0051DCC4: push esi
  '0051DCC5: mov [ebp-18h], ebx
  '0051DCC8: mov [ebp-1Ch], ebx
  '0051DCCB: mov [ebp-20h], ebx
  '0051DCCE: mov [ebp-24h], ebx
  '0051DCD1: mov [ebp-28h], ebx
  '0051DCD4: mov [ebp-2Ch], ebx
  '0051DCD7: mov [ebp-30h], ebx
  '0051DCDA: mov [ebp-34h], ebx
  '0051DCDD: mov [ebp-48h], ebx
  '0051DCE0: mov [ebp-4Ch], ebx
  '0051DCE3: mov [ebp-50h], ebx
  '0051DCE6: mov [ebp-54h], ebx
  '0051DCE9: mov [ebp-58h], ebx
  '0051DCEC: mov [ebp-5Ch], ebx
  '0051DCEF: call [edx+00000304h]
  '0051DCF5: push eax
  '0051DCF6: lea eax, [ebp-34h]
  '0051DCF9: push eax
  '0051DCFA: call [004010E4h]
  '0051DD00: mov edi, eax
  '0051DD02: lea edx, [ebp-20h]
  '0051DD05: push edx
  '0051DD06: push edi
  '0051DD07: mov ecx, [edi]
  '0051DD09: call [ecx+000000A0h]
  '0051DD0F: cmp eax, ebx
  '0051DD11: fclex 
  '0051DD13: jnl 51DD27h
  '0051DD15: push 000000A0h
  '0051DD1A: push 0041E3FCh
  '0051DD1F: push edi
  '0051DD20: push eax
  '0051DD21: call [004010A0h]
  '0051DD27: mov eax, [ebp-20h]
  '0051DD2A: push eax
  '0051DD2B: push 0041BC60h
  '0051DD30: call [00401184h]
  '0051DD36: mov edi, eax
  '0051DD38: lea ecx, [ebp-20h]
  '0051DD3B: neg edi
  '0051DD3D: sbb edi, edi
  '0051DD3F: neg edi
  '0051DD41: neg edi
  '0051DD43: call [004013B4h]
  '0051DD49: lea ecx, [ebp-34h]
  '0051DD4C: call [004013B8h]
  '0051DD52: cmp di, bx
  '0051DD55: jz 0051DF09h
  '0051DD5B: push 00409784h
  '0051DD60: call [00401200h]
  '0051DD66: lea ecx, [ebp-18h]
  '0051DD69: push eax
  '0051DD6A: push ecx
  '0051DD6B: call [004010E4h]
  '0051DD71: mov edx, [esi]
  '0051DD73: lea eax, [ebp-50h]
  '0051DD76: push eax
  '0051DD77: push esi
  '0051DD78: call [edx+58h]
  '0051DD7B: cmp eax, ebx
  '0051DD7D: fclex 
  '0051DD7F: jnl 51DD90h
  '0051DD81: push 00000058h
  '0051DD83: push 00421C34h
  '0051DD88: push esi
  '0051DD89: push eax
  '0051DD8A: call [004010A0h]
  '0051DD90: mov ecx, [ebp-50h]
  '0051DD93: mov edi, [004012D8h]
  '0051DD99: mov [ebp-58h], ecx
  '0051DD9C: mov edx, 0041F400h
  '0051DDA1: lea ecx, [ebp-30h]
  '0051DDA4: mov [ebp-5Ch], ebx
  '0051DDA7: call edi
  '0051DDA9: mov edx, 0042A95Ch
  '0051DDAE: lea ecx, [ebp-2Ch]
  '0051DDB1: call edi
  '0051DDB3: xor edx, edx
  '0051DDB5: lea ecx, [ebp-28h]
  '0051DDB8: call edi
  '0051DDBA: mov edx, 0041F3A8h
  '0051DDBF: lea ecx, [ebp-24h]
  '0051DDC2: mov [ebp-54h], 00000001h
  '0051DDC9: call edi
  '0051DDCB: xor edx, edx
  '0051DDCD: lea ecx, [ebp-20h]
  '0051DDD0: mov [ebp-48h], FFFFFFFFh
  '0051DDD7: call edi
  '0051DDD9: lea ecx, [ebp-4Ch]
  '0051DDDC: mov eax, [ebp-18h]
  '0051DDDF: push ecx
  '0051DDE0: lea ecx, [ebp-5Ch]
  '0051DDE3: push ecx
  '0051DDE4: lea ecx, [ebp-58h]
  '0051DDE7: push ecx
  '0051DDE8: lea ecx, [ebp-30h]
  '0051DDEB: push ecx
  '0051DDEC: lea ecx, [ebp-2Ch]
  '0051DDEF: push ecx
  '0051DDF0: lea ecx, [ebp-28h]
  '0051DDF3: push ecx
  '0051DDF4: lea ecx, [ebp-54h]
  '0051DDF7: push ecx
  '0051DDF8: lea ecx, [ebp-24h]
  '0051DDFB: push ecx
  '0051DDFC: mov edx, [eax]
  '0051DDFE: lea ecx, [ebp-48h]
  '0051DE01: push ecx
  '0051DE02: lea ecx, [ebp-20h]
  '0051DE05: push ecx
  '0051DE06: lea ecx, [ebp-1Ch]
  '0051DE09: push ecx
  '0051DE0A: push eax
  '0051DE0B: call [edx+28h]
  '0051DE0E: cmp eax, ebx
  '0051DE10: fclex 
  '0051DE12: jnl 51DE26h
  '0051DE14: mov edx, [ebp-18h]
  '0051DE17: push 00000028h
  '0051DE19: push 0041D108h
  '0051DE1E: push edx
  '0051DE1F: push eax
  '0051DE20: call [004010A0h]
  '0051DE26: lea eax, [ebp-30h]
  '0051DE29: lea ecx, [ebp-2Ch]
  '0051DE2C: push eax
  '0051DE2D: lea edx, [ebp-28h]
  '0051DE30: push ecx
  '0051DE31: lea eax, [ebp-24h]
  '0051DE34: push edx
  '0051DE35: lea ecx, [ebp-20h]
  '0051DE38: push eax
  '0051DE39: push ecx
  '0051DE3A: push 00000005h
  '0051DE3C: call [004012E8h]
  '0051DE42: mov edx, [ebp-1Ch]
  '0051DE45: add esp, 00000018h
  '0051DE48: push edx
  '0051DE49: push 0041BC60h
  '0051DE4E: call [00401184h]
  '0051DE54: test eax, eax
  '0051DE56: jz 0051DF2Dh
  '0051DE5C: mov eax, [ebp-1Ch]
  '0051DE5F: push eax
  '0051DE60: push 00000001h
  '0051DE62: push FFFFFFFFh
  '0051DE64: push 00000002h
  '0051DE66: call [004012A0h]
  '0051DE6C: mov ecx, [esi]
  '0051DE6E: push esi
  '0051DE6F: call [ecx+00000304h]
  '0051DE75: lea edx, [ebp-34h]
  '0051DE78: push eax
  '0051DE79: push edx
  '0051DE7A: call [004010E4h]
  '0051DE80: mov ecx, [eax]
  '0051DE82: lea edx, [ebp-20h]
  '0051DE85: push edx
  '0051DE86: push eax
  '0051DE87: mov [ebp-60h], eax
  '0051DE8A: call [ecx+000000A0h]
  '0051DE90: cmp eax, ebx
  '0051DE92: fclex 
  '0051DE94: jnl 51DEABh
  '0051DE96: mov ecx, [ebp-60h]
  '0051DE99: push 000000A0h
  '0051DE9E: push 0041E3FCh
  '0051DEA3: push ecx
  '0051DEA4: push eax
  '0051DEA5: call [004010A0h]
  '0051DEAB: mov edx, [ebp-20h]
  '0051DEAE: push edx
  '0051DEAF: push 00000001h
  '0051DEB1: push 0041E878h
  '0051DEB6: call [00401234h]
  '0051DEBC: add esp, 0000000Ch
  '0051DEBF: lea ecx, [ebp-20h]
  '0051DEC2: call [004013B4h]
  '0051DEC8: lea ecx, [ebp-34h]
  '0051DECB: call [004013B8h]
  '0051DED1: push 00000001h
  '0051DED3: call [00401168h]
  '0051DED9: push 0041D108h
  '0051DEDE: push ebx
  '0051DEDF: call [0040137Ch]
  '0051DEE5: push eax
  '0051DEE6: lea eax, [ebp-18h]
  '0051DEE9: push eax
  '0051DEEA: call [004010E4h]
  '0051DEF0: mov edx, 0042A978h
  '0051DEF5: lea ecx, [ebp-20h]
  '0051DEF8: call edi
  '0051DEFA: mov ecx, [esi]
  '0051DEFC: lea edx, [ebp-20h]
  '0051DEFF: push edx
  '0051DF00: push esi
  '0051DF01: call [ecx+00000714h]
  '0051DF07: jmp 51DF24h
  '0051DF09: mov edx, 0042A99Ch
  '0051DF0E: lea ecx, [ebp-20h]
  '0051DF11: call [004012D8h]
  '0051DF17: mov eax, [esi]
  '0051DF19: lea ecx, [ebp-20h]
  '0051DF1C: push ecx
  '0051DF1D: push esi
  '0051DF1E: call [eax+00000714h]
  '0051DF24: lea ecx, [ebp-20h]
  '0051DF27: call [004013B4h]
  '0051DF2D: mov [ebp-04h], ebx
  '0051DF30: push 0051DF73h
  '0051DF35: jmp 51DF60h
  '0051DF37: lea edx, [ebp-30h]
  '0051DF3A: lea eax, [ebp-2Ch]
  '0051DF3D: push edx
  '0051DF3E: lea ecx, [ebp-28h]
  '0051DF41: push eax
  '0051DF42: lea edx, [ebp-24h]
  '0051DF45: push ecx
  '0051DF46: lea eax, [ebp-20h]
  '0051DF49: push edx
  '0051DF4A: push eax
  '0051DF4B: push 00000005h
  '0051DF4D: call [004012E8h]
  '0051DF53: add esp, 00000018h
  '0051DF56: lea ecx, [ebp-34h]
  '0051DF59: call [004013B8h]
  '0051DF5F: ret 
End Sub
Private Sub clear_text__51D370
  '0051D370: push ebp
  '0051D371: mov ebp, esp
  '0051D373: sub esp, 0000000Ch
  '0051D376: push 004081B6h
  '0051D37B: mov eax, fs:[00h]
  '0051D381: push eax
  '0051D382: mov fs:[00000000h], esp
  '0051D389: sub esp, 00000018h
  '0051D38C: push ebx
  '0051D38D: push esi
  '0051D38E: push edi
  '0051D38F: mov [ebp-0Ch], esp
  '0051D392: mov [ebp-08h], 00406C80h
  '0051D399: mov esi, [ebp+08h]
  '0051D39C: mov eax, esi
  '0051D39E: and eax, 00000001h
  '0051D3A1: mov [ebp-04h], eax
  '0051D3A4: and esi, FFFFFFFEh
  '0051D3A7: push esi
  '0051D3A8: mov [ebp+08h], esi
  '0051D3AB: mov ecx, [esi]
  '0051D3AD: call [ecx+04h]
  '0051D3B0: mov edx, [esi]
  '0051D3B2: xor ebx, ebx
  '0051D3B4: push esi
  '0051D3B5: mov [ebp-18h], ebx
  '0051D3B8: mov [ebp-1Ch], ebx
  '0051D3BB: call [edx+00000304h]
  '0051D3C1: push eax
  '0051D3C2: lea eax, [ebp-1Ch]
  '0051D3C5: push eax
  '0051D3C6: call [004010E4h]
  '0051D3CC: mov edi, eax
  '0051D3CE: push 0041BC60h
  '0051D3D3: push edi
  '0051D3D4: mov ecx, [edi]
  '0051D3D6: call [ecx+000000A4h]
  '0051D3DC: cmp eax, ebx
  '0051D3DE: fclex 
  '0051D3E0: jnl 51D3F4h
  '0051D3E2: push 000000A4h
  '0051D3E7: push 0041E3FCh
  '0051D3EC: push edi
  '0051D3ED: push eax
  '0051D3EE: call [004010A0h]
  '0051D3F4: lea ecx, [ebp-1Ch]
  '0051D3F7: call [004013B8h]
  '0051D3FD: mov edx, 0042A870h
  '0051D402: lea ecx, [ebp-18h]
  '0051D405: call [004012D8h]
  '0051D40B: mov edx, [esi]
  '0051D40D: lea eax, [ebp-18h]
  '0051D410: push eax
  '0051D411: push esi
  '0051D412: call [edx+00000714h]
  '0051D418: lea ecx, [ebp-18h]
  '0051D41B: call [004013B4h]
  '0051D421: mov [ebp-04h], ebx
  '0051D424: push 0051D43Fh
  '0051D429: jmp 51D43Eh
  '0051D42B: lea ecx, [ebp-18h]
  '0051D42E: call [004013B4h]
  '0051D434: lea ecx, [ebp-1Ch]
  '0051D437: call [004013B8h]
  '0051D43D: ret 
End Sub

