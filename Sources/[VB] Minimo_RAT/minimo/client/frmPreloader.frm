VERSION 5.00
Begin VB.Form frmPreloader
  ScaleMode = 1
  WhatsThisButton = 0   'False
  Picture = "frmPreloader.frx":0
  BorderStyle = 0 'None
  'Icon = n/a
  ClientLeft = 0
  ClientTop = 0
  ClientWidth = 3525
  ClientHeight = 1980
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
  Begin VB.Timer tmrProgbar
    Enabled = 0   'False
    Interval = 1
    Left = 6240
    Top = 0
    Width = 53256
    Height = 2
  End
  Begin VB.PictureBox picBar
    BackColor = &HFFFFFF&
    Index = 0
    Picture = "frmPreloader.frx":37
    ForeColor = &H80000008&
    Left = 240
    Top = 2160
    Width = 6000
    Height = 210
    Visible = 0   'False
    TabIndex = 5
    ScaleMode = 0
  End
  Begin VB.PictureBox picBar
    BackColor = &HFFFFFF&
    Index = 1
    Picture = "frmPreloader.frx":1CC9
    ForeColor = &H80000008&
    Left = 240
    Top = 2400
    Width = 6000
    Height = 210
    Visible = 0   'False
    TabIndex = 4
    ScaleMode = 0
  End
  Begin VB.PictureBox picBar
    BackColor = &HFFFFFF&
    Index = 2
    Picture = "frmPreloader.frx":3EFB
    ForeColor = &H80000008&
    Left = 240
    Top = 2640
    Width = 6000
    Height = 210
    Visible = 0   'False
    TabIndex = 3
    ScaleMode = 0
  End
  Begin VB.PictureBox picBar
    BackColor = &HFFFFFF&
    Index = 3
    Picture = "frmPreloader.frx":54B5
    ForeColor = &H80000008&
    Left = 240
    Top = 2880
    Width = 6000
    Height = 210
    Visible = 0   'False
    TabIndex = 2
    ScaleMode = 0
  End
  Begin VB.PictureBox picMain
    BackColor = &HFFFFFF&
    Picture = "frmPreloader.frx":6DEE
    ForeColor = &H80000008&
    Left = 280
    Top = 1460
    Width = 3015
    Height = 240
    TabIndex = 0
    ScaleMode = 1
    'Unknown = 0   'False
    BeginProperty Font
      Name = "MS Sans Serif"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
    Begin VB.Label lblInfo
      Caption = "0 %"
      ForeColor = &H0&
      Left = 1320
      Top = 0
      Width = 345
      Height = 195
      TabIndex = 1
      AutoSize = -1  'True
      BackStyle = 0 'Transparent
      BeginProperty Font
        Name = "Tahoma"
        Size = 8.25
        Charset = 0
        Weight = 700
        Underline = 0 'False
        Italic = 0 'False
        Strikethrough = 0 'False
      EndProperty
    End
  End
  Begin VB.Image Image1
    Picture = "frmPreloader.frx":754E
    Left = 0
    Top = 0
    Width = 3525
    Height = 1980
  End
End

Attribute VB_Name = "frmPreloader"

Private Sub tmrProgbar__52FD90
  '0052FD90: push ebp
  '0052FD91: mov ebp, esp
  '0052FD93: sub esp, 0000000Ch
  '0052FD96: push 004081B6h
  '0052FD9B: mov eax, fs:[00h]
  '0052FDA1: push eax
  '0052FDA2: mov fs:[00000000h], esp
  '0052FDA9: sub esp, 00000078h
  '0052FDAC: push ebx
  '0052FDAD: push esi
  '0052FDAE: push edi
  '0052FDAF: mov [ebp-0Ch], esp
  '0052FDB2: mov [ebp-08h], 00407950h
  '0052FDB9: mov esi, [ebp+08h]
  '0052FDBC: mov eax, esi
  '0052FDBE: and eax, 00000001h
  '0052FDC1: mov [ebp-04h], eax
  '0052FDC4: and esi, FFFFFFFEh
  '0052FDC7: push esi
  '0052FDC8: mov [ebp+08h], esi
  '0052FDCB: mov ecx, [esi]
  '0052FDCD: call [ecx+04h]
  '0052FDD0: fld real8 ptr [esi+38h]
  '0052FDD3: fadd real8 ptr [00407948h]
  '0052FDD9: mov edx, [esi]
  '0052FDDB: xor edi, edi
  '0052FDDD: push esi
  '0052FDDE: mov [ebp-18h], edi
  '0052FDE1: fstp real8 ptr [esi+38h]
  '0052FDE4: fstsw ax
  '0052FDE6: test al, 0Dh
  '0052FDE8: jnz 005300FEh
  '0052FDEE: mov [ebp-1Ch], edi
  '0052FDF1: mov [ebp-20h], edi
  '0052FDF4: mov [ebp-24h], edi
  '0052FDF7: mov [ebp-28h], edi
  '0052FDFA: mov [ebp-2Ch], edi
  '0052FDFD: mov [ebp-30h], edi
  '0052FE00: mov [ebp-40h], edi
  '0052FE03: mov [ebp-50h], edi
  '0052FE06: mov [ebp-60h], edi
  '0052FE09: mov [ebp-70h], edi
  '0052FE0C: call [edx+00000304h]
  '0052FE12: mov ebx, [004010E4h]
  '0052FE18: push eax
  '0052FE19: lea eax, [ebp-30h]
  '0052FE1C: push eax
  '0052FE1D: call ebx
  '0052FE1F: mov ecx, [esi]
  '0052FE21: push esi
  '0052FE22: call [ecx+00000300h]
  '0052FE28: lea edx, [ebp-20h]
  '0052FE2B: push eax
  '0052FE2C: push edx
  '0052FE2D: call ebx
  '0052FE2F: mov ecx, [eax]
  '0052FE31: lea edx, [ebp-24h]
  '0052FE34: push edx
  '0052FE35: mov dx, [esi+40h]
  '0052FE39: push edx
  '0052FE3A: push eax
  '0052FE3B: mov [ebp-74h], eax
  '0052FE3E: call [ecx+40h]
  '0052FE41: cmp eax, edi
  '0052FE43: fclex 
  '0052FE45: jnl 52FE59h
  '0052FE47: mov ecx, [ebp-74h]
  '0052FE4A: push 00000040h
  '0052FE4C: push 0041E60Ch
  '0052FE51: push ecx
  '0052FE52: push eax
  '0052FE53: call [004010A0h]
  '0052FE59: mov eax, [ebp-24h]
  '0052FE5C: lea edx, [ebp-2Ch]
  '0052FE5F: push eax
  '0052FE60: push edx
  '0052FE61: mov [ebp-24h], edi
  '0052FE64: call ebx
  '0052FE66: mov eax, [ebp-30h]
  '0052FE69: mov [ebp-30h], edi
  '0052FE6C: push eax
  '0052FE6D: lea eax, [ebp-28h]
  '0052FE70: push eax
  '0052FE71: call ebx
  '0052FE73: fld real8 ptr [esi+38h]
  '0052FE76: mov edi, [esi]
  '0052FE78: lea ecx, [ebp-2Ch]
  '0052FE7B: lea edx, [ebp-28h]
  '0052FE7E: push ecx
  '0052FE7F: push edx
  '0052FE80: call [00401348h]
  '0052FE86: push eax
  '0052FE87: push esi
  '0052FE88: call [edi+000006FCh]
  '0052FE8E: test eax, eax
  '0052FE90: jnl 52FEA4h
  '0052FE92: push 000006FCh
  '0052FE97: push 0042B7DCh
  '0052FE9C: push esi
  '0052FE9D: push eax
  '0052FE9E: call [004010A0h]
  '0052FEA4: lea eax, [ebp-30h]
  '0052FEA7: lea ecx, [ebp-2Ch]
  '0052FEAA: push eax
  '0052FEAB: lea edx, [ebp-28h]
  '0052FEAE: push ecx
  '0052FEAF: lea eax, [ebp-20h]
  '0052FEB2: push edx
  '0052FEB3: push eax
  '0052FEB4: push 00000004h
  '0052FEB6: call [00401064h]
  '0052FEBC: mov ecx, [esi]
  '0052FEBE: add esp, 00000014h
  '0052FEC1: push esi
  '0052FEC2: call [ecx+00000308h]
  '0052FEC8: lea edx, [ebp-20h]
  '0052FECB: push eax
  '0052FECC: push edx
  '0052FECD: call ebx
  '0052FECF: mov ecx, [esi+34h]
  '0052FED2: mov edi, eax
  '0052FED4: push ecx
  '0052FED5: push edi
  '0052FED6: mov eax, [edi]
  '0052FED8: call [eax+54h]
  '0052FEDB: test eax, eax
  '0052FEDD: fclex 
  '0052FEDF: jnl 52FEF0h
  '0052FEE1: push 00000054h
  '0052FEE3: push 004221B4h
  '0052FEE8: push edi
  '0052FEE9: push eax
  '0052FEEA: call [004010A0h]
  '0052FEF0: lea ecx, [ebp-20h]
  '0052FEF3: call [004013B8h]
  '0052FEF9: mov edx, [esi+34h]
  '0052FEFC: push edx
  '0052FEFD: push 00000064h
  '0052FEFF: call [0040100Ch]
  '0052FF05: mov edi, [00401378h]
  '0052FF0B: mov edx, eax
  '0052FF0D: lea ecx, [ebp-18h]
  '0052FF10: call edi
  '0052FF12: push eax
  '0052FF13: push 0042C8D8h
  '0052FF18: call [0040108Ch]
  '0052FF1E: mov edx, eax
  '0052FF20: lea ecx, [ebp-1Ch]
  '0052FF23: call edi
  '0052FF25: push eax
  '0052FF26: call [00401184h]
  '0052FF2C: mov edi, eax
  '0052FF2E: lea eax, [ebp-1Ch]
  '0052FF31: neg edi
  '0052FF33: sbb edi, edi
  '0052FF35: lea ecx, [ebp-18h]
  '0052FF38: push eax
  '0052FF39: inc edi
  '0052FF3A: push ecx
  '0052FF3B: push 00000002h
  '0052FF3D: neg edi
  '0052FF3F: call [004012E8h]
  '0052FF45: add esp, 0000000Ch
  '0052FF48: test di, di
  '0052FF4B: jz 0053008Fh
  '0052FF51: mov edx, [esi]
  '0052FF53: push esi
  '0052FF54: call [edx+000002FCh]
  '0052FF5A: push eax
  '0052FF5B: lea eax, [ebp-20h]
  '0052FF5E: push eax
  '0052FF5F: call ebx
  '0052FF61: mov edi, eax
  '0052FF63: push 00000000h
  '0052FF65: push edi
  '0052FF66: mov ecx, [edi]
  '0052FF68: call [ecx+5Ch]
  '0052FF6B: test eax, eax
  '0052FF6D: fclex 
  '0052FF6F: jnl 52FF80h
  '0052FF71: push 0000005Ch
  '0052FF73: push 0041E5CCh
  '0052FF78: push edi
  '0052FF79: push eax
  '0052FF7A: call [004010A0h]
  '0052FF80: lea ecx, [ebp-20h]
  '0052FF83: call [004013B8h]
  '0052FF89: lea edx, [ebp-40h]
  '0052FF8C: lea eax, [ebp-50h]
  '0052FF8F: push edx
  '0052FF90: push eax
  '0052FF91: mov [ebp-38h], 00000000h
  '0052FF98: mov [ebp-34h], 3FE00000h
  '0052FF9F: mov [ebp-40h], 00000005h
  '0052FFA6: call 0052DE80h
  '0052FFAB: lea ecx, [ebp-50h]
  '0052FFAE: lea edx, [ebp-40h]
  '0052FFB1: push ecx
  '0052FFB2: push edx
  '0052FFB3: push 00000002h
  '0052FFB5: call [00401050h]
  '0052FFBB: mov eax, [541024h]
  '0052FFC0: add esp, 0000000Ch
  '0052FFC3: test eax, eax
  '0052FFC5: jnz 52FFD7h
  '0052FFC7: push 00541024h
  '0052FFCC: push 00413334h
  '0052FFD1: call [004012B8h]
  '0052FFD7: sub esp, 00000010h
  '0052FFDA: mov ecx, 0000000Ah
  '0052FFDF: mov ebx, esp
  '0052FFE1: mov [ebp-60h], ecx
  '0052FFE4: mov eax, 80020004h
  '0052FFE9: sub esp, 00000010h
  '0052FFEC: mov [ebx], ecx
  '0052FFEE: mov ecx, [ebp-6Ch]
  '0052FFF1: mov [ebp-58h], eax
  '0052FFF4: mov edi, [00541024h]
  '0052FFFA: mov [ebx+04h], ecx
  '0052FFFD: mov ecx, esp
  '0052FFFF: mov edx, [edi]
  '00530001: push edi
  '00530002: mov [ebx+08h], eax
  '00530005: mov eax, [ebp-64h]
  '00530008: mov [ebx+0Ch], eax
  '0053000B: mov eax, [ebp-60h]
  '0053000E: mov [ecx], eax
  '00530010: mov eax, [ebp-5Ch]
  '00530013: mov [ecx+04h], eax
  '00530016: mov eax, [ebp-58h]
  '00530019: mov [ecx+08h], eax
  '0053001C: mov eax, [ebp-54h]
  '0053001F: mov [ecx+0Ch], eax
  '00530022: call [edx+000002B0h]
  '00530028: test eax, eax
  '0053002A: fclex 
  '0053002C: jnl 530040h
  '0053002E: push 000002B0h
  '00530033: push 0041C0E8h
  '00530038: push edi
  '00530039: push eax
  '0053003A: call [004010A0h]
  '00530040: mov eax, [54238Ch]
  '00530045: test eax, eax
  '00530047: jnz 530059h
  '00530049: push 0054238Ch
  '0053004E: push 0041D9E0h
  '00530053: call [004012B8h]
  '00530059: mov edi, [0054238Ch]
  '0053005F: lea ecx, [ebp-20h]
  '00530062: push esi
  '00530063: push ecx
  '00530064: mov ebx, [edi]
  '00530066: call [004010F8h]
  '0053006C: push eax
  '0053006D: push edi
  '0053006E: call [ebx+10h]
  '00530071: test eax, eax
  '00530073: fclex 
  '00530075: jnl 530086h
  '00530077: push 00000010h
  '00530079: push 0041D9D0h
  '0053007E: push edi
  '0053007F: push eax
  '00530080: call [004010A0h]
  '00530086: lea ecx, [ebp-20h]
  '00530089: call [004013B8h]
  '0053008F: mov [ebp-04h], 00000000h
  '00530096: wait 
  '00530097: push 005300DFh
  '0053009C: jmp 5300DEh
  '0053009E: lea edx, [ebp-1Ch]
  '005300A1: lea eax, [ebp-18h]
  '005300A4: push edx
  '005300A5: push eax
  '005300A6: push 00000002h
  '005300A8: call [004012E8h]
  '005300AE: lea ecx, [ebp-30h]
  '005300B1: lea edx, [ebp-2Ch]
  '005300B4: push ecx
  '005300B5: lea eax, [ebp-28h]
  '005300B8: push edx
  '005300B9: lea ecx, [ebp-24h]
  '005300BC: push eax
  '005300BD: lea edx, [ebp-20h]
  '005300C0: push ecx
  '005300C1: push edx
  '005300C2: push 00000005h
  '005300C4: call [00401064h]
  '005300CA: lea eax, [ebp-50h]
  '005300CD: lea ecx, [ebp-40h]
  '005300D0: push eax
  '005300D1: push ecx
  '005300D2: push 00000002h
  '005300D4: call [00401050h]
  '005300DA: add esp, 00000030h
  '005300DD: ret 
End Sub
Private Sub Form__52E210
  '0052E210: push ebp
  '0052E211: mov ebp, esp
  '0052E213: sub esp, 00000018h
  '0052E216: push 004081B6h
  '0052E21B: mov eax, fs:[00h]
  '0052E221: push eax
  '0052E222: mov fs:[00000000h], esp
  '0052E229: mov eax, 000001CCh
  '0052E22E: call 004081B0h
  '0052E233: push ebx
  '0052E234: push esi
  '0052E235: push edi
  '0052E236: mov [ebp-18h], esp
  '0052E239: mov [ebp-14h], 00407860h
  '0052E240: mov eax, [ebp+08h]
  '0052E243: and eax, 00000001h
  '0052E246: mov [ebp-10h], eax
  '0052E249: mov ecx, [ebp+08h]
  '0052E24C: and ecx, FFFFFFFEh
  '0052E24F: mov [ebp+08h], ecx
  '0052E252: mov [ebp-0Ch], 00000000h
  '0052E259: mov edx, [ebp+08h]
  '0052E25C: mov eax, [edx]
  '0052E25E: mov ecx, [ebp+08h]
  '0052E261: push ecx
  '0052E262: call [eax+04h]
  '0052E265: mov [ebp-04h], 00000001h
  '0052E26C: mov [ebp-04h], 00000002h
  '0052E273: push FFFFFFFFh
  '0052E275: call [004010E8h]
  '0052E27B: mov [ebp-04h], 00000003h
  '0052E282: cmp [0054238Ch], 00000000h
  '0052E289: jnz 52E2A7h
  '0052E28B: push 0054238Ch
  '0052E290: push 0041D9E0h
  '0052E295: call [004012B8h]
  '0052E29B: mov [ebp-00000140h], 0054238Ch
  '0052E2A5: jmp 52E2B1h
  '0052E2A7: mov [ebp-00000140h], 0054238Ch
  '0052E2B1: mov edx, [ebp-00000140h]
  '0052E2B7: mov eax, [edx]
  '0052E2B9: mov [ebp-000000E8h], eax
  '0052E2BF: lea ecx, [ebp-3Ch]
  '0052E2C2: push ecx
  '0052E2C3: mov edx, [ebp-000000E8h]
  '0052E2C9: mov eax, [edx]
  '0052E2CB: mov ecx, [ebp-000000E8h]
  '0052E2D1: push ecx
  '0052E2D2: call [eax+14h]
  '0052E2D5: fclex 
  '0052E2D7: mov [ebp-000000ECh], eax
  '0052E2DD: cmp [ebp-000000ECh], 00000000h
  '0052E2E4: jnl 52E309h
  '0052E2E6: push 00000014h
  '0052E2E8: push 0041D9D0h
  '0052E2ED: mov edx, [ebp-000000E8h]
  '0052E2F3: push edx
  '0052E2F4: mov eax, [ebp-000000ECh]
  '0052E2FA: push eax
  '0052E2FB: call [004010A0h]
  '0052E301: mov [ebp-00000144h], eax
  '0052E307: jmp 52E313h
  '0052E309: mov [ebp-00000144h], 00000000h
  '0052E313: mov ecx, [ebp-3Ch]
  '0052E316: mov [ebp-000000F0h], ecx
  '0052E31C: lea edx, [ebp-28h]
  '0052E31F: push edx
  '0052E320: mov eax, [ebp-000000F0h]
  '0052E326: mov ecx, [eax]
  '0052E328: mov edx, [ebp-000000F0h]
  '0052E32E: push edx
  '0052E32F: call [ecx+50h]
  '0052E332: fclex 
  '0052E334: mov [ebp-000000F4h], eax
  '0052E33A: cmp [ebp-000000F4h], 00000000h
  '0052E341: jnl 52E366h
  '0052E343: push 00000050h
  '0052E345: push 0041D9F0h
  '0052E34A: mov eax, [ebp-000000F0h]
  '0052E350: push eax
  '0052E351: mov ecx, [ebp-000000F4h]
  '0052E357: push ecx
  '0052E358: call [004010A0h]
  '0052E35E: mov [ebp-00000148h], eax
  '0052E364: jmp 52E370h
  '0052E366: mov [ebp-00000148h], 00000000h
  '0052E370: push 00000001h
  '0052E372: mov edx, [ebp-28h]
  '0052E375: push edx
  '0052E376: call [00401380h]
  '0052E37C: mov edx, eax
  '0052E37E: lea ecx, [ebp-38h]
  '0052E381: call [00401378h]
  '0052E387: cmp [0054238Ch], 00000000h
  '0052E38E: jnz 52E3ACh
  '0052E390: push 0054238Ch
  '0052E395: push 0041D9E0h
  '0052E39A: call [004012B8h]
  '0052E3A0: mov [ebp-0000014Ch], 0054238Ch
  '0052E3AA: jmp 52E3B6h
  '0052E3AC: mov [ebp-0000014Ch], 0054238Ch
  '0052E3B6: mov eax, [ebp-0000014Ch]
  '0052E3BC: mov ecx, [eax]
  '0052E3BE: mov [ebp-000000F8h], ecx
  '0052E3C4: lea edx, [ebp-40h]
  '0052E3C7: push edx
  '0052E3C8: mov eax, [ebp-000000F8h]
  '0052E3CE: mov ecx, [eax]
  '0052E3D0: mov edx, [ebp-000000F8h]
  '0052E3D6: push edx
  '0052E3D7: call [ecx+14h]
  '0052E3DA: fclex 
  '0052E3DC: mov [ebp-000000FCh], eax
  '0052E3E2: cmp [ebp-000000FCh], 00000000h
  '0052E3E9: jnl 52E40Eh
  '0052E3EB: push 00000014h
  '0052E3ED: push 0041D9D0h
  '0052E3F2: mov eax, [ebp-000000F8h]
  '0052E3F8: push eax
  '0052E3F9: mov ecx, [ebp-000000FCh]
  '0052E3FF: push ecx
  '0052E400: call [004010A0h]
  '0052E406: mov [ebp-00000150h], eax
  '0052E40C: jmp 52E418h
  '0052E40E: mov [ebp-00000150h], 00000000h
  '0052E418: mov edx, [ebp-40h]
  '0052E41B: mov [ebp-00000100h], edx
  '0052E421: lea eax, [ebp-30h]
  '0052E424: push eax
  '0052E425: mov ecx, [ebp-00000100h]
  '0052E42B: mov edx, [ecx]
  '0052E42D: mov eax, [ebp-00000100h]
  '0052E433: push eax
  '0052E434: call [edx+50h]
  '0052E437: fclex 
  '0052E439: mov [ebp-00000104h], eax
  '0052E43F: cmp [ebp-00000104h], 00000000h
  '0052E446: jnl 52E46Bh
  '0052E448: push 00000050h
  '0052E44A: push 0041D9F0h
  '0052E44F: mov ecx, [ebp-00000100h]
  '0052E455: push ecx
  '0052E456: mov edx, [ebp-00000104h]
  '0052E45C: push edx
  '0052E45D: call [004010A0h]
  '0052E463: mov [ebp-00000154h], eax
  '0052E469: jmp 52E475h
  '0052E46B: mov [ebp-00000154h], 00000000h
  '0052E475: cmp [0054238Ch], 00000000h
  '0052E47C: jnz 52E49Ah
  '0052E47E: push 0054238Ch
  '0052E483: push 0041D9E0h
  '0052E488: call [004012B8h]
  '0052E48E: mov [ebp-00000158h], 0054238Ch
  '0052E498: jmp 52E4A4h
  '0052E49A: mov [ebp-00000158h], 0054238Ch
  '0052E4A4: mov eax, [ebp-00000158h]
  '0052E4AA: mov ecx, [eax]
  '0052E4AC: mov [ebp-00000108h], ecx
  '0052E4B2: lea edx, [ebp-44h]
  '0052E4B5: push edx
  '0052E4B6: mov eax, [ebp-00000108h]
  '0052E4BC: mov ecx, [eax]
  '0052E4BE: mov edx, [ebp-00000108h]
  '0052E4C4: push edx
  '0052E4C5: call [ecx+14h]
  '0052E4C8: fclex 
  '0052E4CA: mov [ebp-0000010Ch], eax
  '0052E4D0: cmp [ebp-0000010Ch], 00000000h
  '0052E4D7: jnl 52E4FCh
  '0052E4D9: push 00000014h
  '0052E4DB: push 0041D9D0h
  '0052E4E0: mov eax, [ebp-00000108h]
  '0052E4E6: push eax
  '0052E4E7: mov ecx, [ebp-0000010Ch]
  '0052E4ED: push ecx
  '0052E4EE: call [004010A0h]
  '0052E4F4: mov [ebp-0000015Ch], eax
  '0052E4FA: jmp 52E506h
  '0052E4FC: mov [ebp-0000015Ch], 00000000h
  '0052E506: mov edx, [ebp-44h]
  '0052E509: mov [ebp-00000110h], edx
  '0052E50F: lea eax, [ebp-34h]
  '0052E512: push eax
  '0052E513: mov ecx, [ebp-00000110h]
  '0052E519: mov edx, [ecx]
  '0052E51B: mov eax, [ebp-00000110h]
  '0052E521: push eax
  '0052E522: call [edx+50h]
  '0052E525: fclex 
  '0052E527: mov [ebp-00000114h], eax
  '0052E52D: cmp [ebp-00000114h], 00000000h
  '0052E534: jnl 52E559h
  '0052E536: push 00000050h
  '0052E538: push 0041D9F0h
  '0052E53D: mov ecx, [ebp-00000110h]
  '0052E543: push ecx
  '0052E544: mov edx, [ebp-00000114h]
  '0052E54A: push edx
  '0052E54B: call [004010A0h]
  '0052E551: mov [ebp-00000160h], eax
  '0052E557: jmp 52E563h
  '0052E559: mov [ebp-00000160h], 00000000h
  '0052E563: mov eax, [ebp-34h]
  '0052E566: mov [ebp-0000012Ch], eax
  '0052E56C: mov [ebp-34h], 00000000h
  '0052E573: mov ecx, [ebp-0000012Ch]
  '0052E579: mov [ebp-60h], ecx
  '0052E57C: mov [ebp-68h], 00000008h
  '0052E583: mov edx, [ebp-30h]
  '0052E586: push edx
  '0052E587: push 0041DE34h
  '0052E58C: call [0040108Ch]
  '0052E592: mov [ebp-50h], eax
  '0052E595: mov [ebp-58h], 00000008h
  '0052E59C: mov eax, [ebp-38h]
  '0052E59F: mov [ebp-00000130h], eax
  '0052E5A5: mov [ebp-38h], 00000000h
  '0052E5AC: mov edx, [ebp-00000130h]
  '0052E5B2: lea ecx, [ebp-2Ch]
  '0052E5B5: call [00401378h]
  '0052E5BB: push eax
  '0052E5BC: push 0041DE34h
  '0052E5C1: call [00401184h]
  '0052E5C7: neg eax
  '0052E5C9: sbb eax, eax
  '0052E5CB: neg eax
  '0052E5CD: neg eax
  '0052E5CF: mov [ebp-000000A0h], ax
  '0052E5D6: mov [ebp-000000A8h], 0000000Bh
  '0052E5E0: lea ecx, [ebp-68h]
  '0052E5E3: push ecx
  '0052E5E4: lea edx, [ebp-58h]
  '0052E5E7: push edx
  '0052E5E8: lea eax, [ebp-000000A8h]
  '0052E5EE: push eax
  '0052E5EF: lea ecx, [ebp-78h]
  '0052E5F2: push ecx
  '0052E5F3: call [004012DCh]
  '0052E5F9: lea edx, [ebp-78h]
  '0052E5FC: push edx
  '0052E5FD: call [0040103Ch]
  '0052E603: mov edx, eax
  '0052E605: lea ecx, [ebp-24h]
  '0052E608: call [00401378h]
  '0052E60E: lea eax, [ebp-38h]
  '0052E611: push eax
  '0052E612: lea ecx, [ebp-30h]
  '0052E615: push ecx
  '0052E616: lea edx, [ebp-2Ch]
  '0052E619: push edx
  '0052E61A: lea eax, [ebp-28h]
  '0052E61D: push eax
  '0052E61E: push 00000004h
  '0052E620: call [004012E8h]
  '0052E626: add esp, 00000014h
  '0052E629: lea ecx, [ebp-44h]
  '0052E62C: push ecx
  '0052E62D: lea edx, [ebp-40h]
  '0052E630: push edx
  '0052E631: lea eax, [ebp-3Ch]
  '0052E634: push eax
  '0052E635: push 00000003h
  '0052E637: call [00401064h]
  '0052E63D: add esp, 00000010h
  '0052E640: lea ecx, [ebp-78h]
  '0052E643: push ecx
  '0052E644: lea edx, [ebp-68h]
  '0052E647: push edx
  '0052E648: lea eax, [ebp-58h]
  '0052E64B: push eax
  '0052E64C: lea ecx, [ebp-000000A8h]
  '0052E652: push ecx
  '0052E653: push 00000004h
  '0052E655: call [00401050h]
  '0052E65B: add esp, 00000014h
  '0052E65E: mov [ebp-04h], 00000004h
  '0052E665: mov edx, [ebp-24h]
  '0052E668: push edx
  '0052E669: push 0042BD98h
  '0052E66E: call [0040108Ch]
  '0052E674: mov [ebp-50h], eax
  '0052E677: mov [ebp-58h], 00000008h
  '0052E67E: lea eax, [ebp-000000DCh]
  '0052E684: push eax
  '0052E685: lea ecx, [ebp-58h]
  '0052E688: push ecx
  '0052E689: mov edx, [ebp+08h]
  '0052E68C: mov eax, [edx]
  '0052E68E: mov ecx, [ebp+08h]
  '0052E691: push ecx
  '0052E692: call [eax+000006F8h]
  '0052E698: mov [ebp-000000E8h], eax
  '0052E69E: cmp [ebp-000000E8h], 00000000h
  '0052E6A5: jnl 52E6CAh
  '0052E6A7: push 000006F8h
  '0052E6AC: push 0042B7DCh
  '0052E6B1: mov edx, [ebp+08h]
  '0052E6B4: push edx
  '0052E6B5: mov eax, [ebp-000000E8h]
  '0052E6BB: push eax
  '0052E6BC: call [004010A0h]
  '0052E6C2: mov [ebp-00000164h], eax
  '0052E6C8: jmp 52E6D4h
  '0052E6CA: mov [ebp-00000164h], 00000000h
  '0052E6D4: xor ecx, ecx
  '0052E6D6: cmp word ptr [ebp-000000DCh], FFFFh
  '0052E6DE: setz cl
  '0052E6E1: neg ecx
  '0052E6E3: mov [ebp-000000ECh], cx
  '0052E6EA: lea ecx, [ebp-58h]
  '0052E6ED: call [00401030h]
  '0052E6F3: movsx edx, word ptr [ebp-000000ECh]
  '0052E6FA: test edx, edx
  '0052E6FC: jz 52E713h
  '0052E6FE: mov [ebp-04h], 00000005h
  '0052E705: mov eax, [ebp+08h]
  '0052E708: mov word ptr [eax+40h], 0000h
  '0052E70E: jmp 0052E995h
  '0052E713: mov [ebp-04h], 00000006h
  '0052E71A: mov ecx, [ebp-24h]
  '0052E71D: push ecx
  '0052E71E: push 0042C734h
  '0052E723: call [0040108Ch]
  '0052E729: mov [ebp-50h], eax
  '0052E72C: mov [ebp-58h], 00000008h
  '0052E733: lea edx, [ebp-000000DCh]
  '0052E739: push edx
  '0052E73A: lea eax, [ebp-58h]
  '0052E73D: push eax
  '0052E73E: mov ecx, [ebp+08h]
  '0052E741: mov edx, [ecx]
  '0052E743: mov eax, [ebp+08h]
  '0052E746: push eax
  '0052E747: call [edx+000006F8h]
  '0052E74D: mov [ebp-000000E8h], eax
  '0052E753: cmp [ebp-000000E8h], 00000000h
  '0052E75A: jnl 52E77Fh
  '0052E75C: push 000006F8h
  '0052E761: push 0042B7DCh
  '0052E766: mov ecx, [ebp+08h]
  '0052E769: push ecx
  '0052E76A: mov edx, [ebp-000000E8h]
  '0052E770: push edx
  '0052E771: call [004010A0h]
  '0052E777: mov [ebp-00000168h], eax
  '0052E77D: jmp 52E789h
  '0052E77F: mov [ebp-00000168h], 00000000h
  '0052E789: xor eax, eax
  '0052E78B: cmp word ptr [ebp-000000DCh], FFFFh
  '0052E793: setz al
  '0052E796: neg eax
  '0052E798: mov [ebp-000000ECh], ax
  '0052E79F: lea ecx, [ebp-58h]
  '0052E7A2: call [00401030h]
  '0052E7A8: movsx ecx, word ptr [ebp-000000ECh]
  '0052E7AF: test ecx, ecx
  '0052E7B1: jz 52E7C8h
  '0052E7B3: mov [ebp-04h], 00000007h
  '0052E7BA: mov edx, [ebp+08h]
  '0052E7BD: mov word ptr [edx+40h], 0002h
  '0052E7C3: jmp 0052E995h
  '0052E7C8: mov [ebp-04h], 00000008h
  '0052E7CF: mov eax, [ebp-24h]
  '0052E7D2: push eax
  '0052E7D3: push 0042C75Ch
  '0052E7D8: call [0040108Ch]
  '0052E7DE: mov [ebp-50h], eax
  '0052E7E1: mov [ebp-58h], 00000008h
  '0052E7E8: lea ecx, [ebp-000000DCh]
  '0052E7EE: push ecx
  '0052E7EF: lea edx, [ebp-58h]
  '0052E7F2: push edx
  '0052E7F3: mov eax, [ebp+08h]
  '0052E7F6: mov ecx, [eax]
  '0052E7F8: mov edx, [ebp+08h]
  '0052E7FB: push edx
  '0052E7FC: call [ecx+000006F8h]
  '0052E802: mov [ebp-000000E8h], eax
  '0052E808: cmp [ebp-000000E8h], 00000000h
  '0052E80F: jnl 52E834h
  '0052E811: push 000006F8h
  '0052E816: push 0042B7DCh
  '0052E81B: mov eax, [ebp+08h]
  '0052E81E: push eax
  '0052E81F: mov ecx, [ebp-000000E8h]
  '0052E825: push ecx
  '0052E826: call [004010A0h]
  '0052E82C: mov [ebp-0000016Ch], eax
  '0052E832: jmp 52E83Eh
  '0052E834: mov [ebp-0000016Ch], 00000000h
  '0052E83E: xor edx, edx
  '0052E840: cmp word ptr [ebp-000000DCh], FFFFh
  '0052E848: setz dl
  '0052E84B: neg edx
  '0052E84D: mov [ebp-000000ECh], dx
  '0052E854: lea ecx, [ebp-58h]
  '0052E857: call [00401030h]
  '0052E85D: movsx eax, word ptr [ebp-000000ECh]
  '0052E864: test eax, eax
  '0052E866: jz 52E87Dh
  '0052E868: mov [ebp-04h], 00000009h
  '0052E86F: mov ecx, [ebp+08h]
  '0052E872: mov word ptr [ecx+40h], 0003h
  '0052E878: jmp 0052E995h
  '0052E87D: mov [ebp-04h], 0000000Ah
  '0052E884: mov edx, [ebp-24h]
  '0052E887: push edx
  '0052E888: push 0042C788h
  '0052E88D: call [0040108Ch]
  '0052E893: mov [ebp-50h], eax
  '0052E896: mov [ebp-58h], 00000008h
  '0052E89D: lea eax, [ebp-000000DCh]
  '0052E8A3: push eax
  '0052E8A4: lea ecx, [ebp-58h]
  '0052E8A7: push ecx
  '0052E8A8: mov edx, [ebp+08h]
  '0052E8AB: mov eax, [edx]
  '0052E8AD: mov ecx, [ebp+08h]
  '0052E8B0: push ecx
  '0052E8B1: call [eax+000006F8h]
  '0052E8B7: mov [ebp-000000E8h], eax
  '0052E8BD: cmp [ebp-000000E8h], 00000000h
  '0052E8C4: jnl 52E8E9h
  '0052E8C6: push 000006F8h
  '0052E8CB: push 0042B7DCh
  '0052E8D0: mov edx, [ebp+08h]
  '0052E8D3: push edx
  '0052E8D4: mov eax, [ebp-000000E8h]
  '0052E8DA: push eax
  '0052E8DB: call [004010A0h]
  '0052E8E1: mov [ebp-00000170h], eax
  '0052E8E7: jmp 52E8F3h
  '0052E8E9: mov [ebp-00000170h], 00000000h
  '0052E8F3: xor ecx, ecx
  '0052E8F5: cmp word ptr [ebp-000000DCh], FFFFh
  '0052E8FD: setz cl
  '0052E900: neg ecx
  '0052E902: mov [ebp-000000ECh], cx
  '0052E909: lea ecx, [ebp-58h]
  '0052E90C: call [00401030h]
  '0052E912: movsx edx, word ptr [ebp-000000ECh]
  '0052E919: test edx, edx
  '0052E91B: jz 52E985h
  '0052E91D: mov [ebp-04h], 0000000Bh
  '0052E924: mov [ebp-50h], 80020004h
  '0052E92B: mov [ebp-58h], 0000000Ah
  '0052E932: lea eax, [ebp-58h]
  '0052E935: push eax
  '0052E936: call [004010C0h]
  '0052E93C: fmul real4 ptr [00405640h]
  '0052E942: fstsw ax
  '0052E944: test al, 0Dh
  '0052E946: jnz 0052FCA7h
  '0052E94C: call [00401360h]
  '0052E952: mov ecx, [ebp+08h]
  '0052E955: mov [ecx+40h], ax
  '0052E959: lea ecx, [ebp-58h]
  '0052E95C: call [00401030h]
  '0052E962: mov [ebp-04h], 0000000Ch
  '0052E969: mov edx, [ebp+08h]
  '0052E96C: cmp word ptr [edx+40h], 0003h
  '0052E971: jle 52E983h
  '0052E973: mov [ebp-04h], 0000000Dh
  '0052E97A: mov eax, [ebp+08h]
  '0052E97D: mov word ptr [eax+40h], 0001h
  '0052E983: jmp 52E995h
  '0052E985: mov [ebp-04h], 00000010h
  '0052E98C: mov ecx, [ebp+08h]
  '0052E98F: mov word ptr [ecx+40h], 0001h
  '0052E995: mov [ebp-04h], 00000012h
  '0052E99C: mov edx, [ebp-24h]
  '0052E99F: push edx
  '0052E9A0: push 0042C7B8h
  '0052E9A5: call [0040108Ch]
  '0052E9AB: mov [ebp-50h], eax
  '0052E9AE: mov [ebp-58h], 00000008h
  '0052E9B5: lea eax, [ebp-000000DCh]
  '0052E9BB: push eax
  '0052E9BC: lea ecx, [ebp-58h]
  '0052E9BF: push ecx
  '0052E9C0: mov edx, [ebp+08h]
  '0052E9C3: mov eax, [edx]
  '0052E9C5: mov ecx, [ebp+08h]
  '0052E9C8: push ecx
  '0052E9C9: call [eax+000006F8h]
  '0052E9CF: mov [ebp-000000E8h], eax
  '0052E9D5: cmp [ebp-000000E8h], 00000000h
  '0052E9DC: jnl 52EA01h
  '0052E9DE: push 000006F8h
  '0052E9E3: push 0042B7DCh
  '0052E9E8: mov edx, [ebp+08h]
  '0052E9EB: push edx
  '0052E9EC: mov eax, [ebp-000000E8h]
  '0052E9F2: push eax
  '0052E9F3: call [004010A0h]
  '0052E9F9: mov [ebp-00000174h], eax
  '0052E9FF: jmp 52EA0Bh
  '0052EA01: mov [ebp-00000174h], 00000000h
  '0052EA0B: xor ecx, ecx
  '0052EA0D: cmp word ptr [ebp-000000DCh], FFFFh
  '0052EA15: setz cl
  '0052EA18: neg ecx
  '0052EA1A: mov [ebp-000000ECh], cx
  '0052EA21: lea ecx, [ebp-58h]
  '0052EA24: call [00401030h]
  '0052EA2A: movsx edx, word ptr [ebp-000000ECh]
  '0052EA31: test edx, edx
  '0052EA33: jz 0052EABEh
  '0052EA39: mov [ebp-04h], 00000013h
  '0052EA40: mov eax, [ebp+08h]
  '0052EA43: mov ecx, [eax]
  '0052EA45: mov edx, [ebp+08h]
  '0052EA48: push edx
  '0052EA49: call [ecx+00000308h]
  '0052EA4F: push eax
  '0052EA50: lea eax, [ebp-3Ch]
  '0052EA53: push eax
  '0052EA54: call [004010E4h]
  '0052EA5A: mov [ebp-000000E8h], eax
  '0052EA60: push 00FFFFFFh
  '0052EA65: mov ecx, [ebp-000000E8h]
  '0052EA6B: mov edx, [ecx]
  '0052EA6D: mov eax, [ebp-000000E8h]
  '0052EA73: push eax
  '0052EA74: call [edx+6Ch]
  '0052EA77: fclex 
  '0052EA79: mov [ebp-000000ECh], eax
  '0052EA7F: cmp [ebp-000000ECh], 00000000h
  '0052EA86: jnl 52EAABh
  '0052EA88: push 0000006Ch
  '0052EA8A: push 004221B4h
  '0052EA8F: mov ecx, [ebp-000000E8h]
  '0052EA95: push ecx
  '0052EA96: mov edx, [ebp-000000ECh]
  '0052EA9C: push edx
  '0052EA9D: call [004010A0h]
  '0052EAA3: mov [ebp-00000178h], eax
  '0052EAA9: jmp 52EAB5h
  '0052EAAB: mov [ebp-00000178h], 00000000h
  '0052EAB5: lea ecx, [ebp-3Ch]
  '0052EAB8: call [004013B8h]
  '0052EABE: mov [ebp-04h], 00000015h
  '0052EAC5: mov eax, [ebp-24h]
  '0052EAC8: push eax
  '0052EAC9: push 0042C7ECh
  '0052EACE: call [0040108Ch]
  '0052EAD4: mov [ebp-50h], eax
  '0052EAD7: mov [ebp-58h], 00000008h
  '0052EADE: lea ecx, [ebp-000000DCh]
  '0052EAE4: push ecx
  '0052EAE5: lea edx, [ebp-58h]
  '0052EAE8: push edx
  '0052EAE9: mov eax, [ebp+08h]
  '0052EAEC: mov ecx, [eax]
  '0052EAEE: mov edx, [ebp+08h]
  '0052EAF1: push edx
  '0052EAF2: call [ecx+000006F8h]
  '0052EAF8: mov [ebp-000000E8h], eax
  '0052EAFE: cmp [ebp-000000E8h], 00000000h
  '0052EB05: jnl 52EB2Ah
  '0052EB07: push 000006F8h
  '0052EB0C: push 0042B7DCh
  '0052EB11: mov eax, [ebp+08h]
  '0052EB14: push eax
  '0052EB15: mov ecx, [ebp-000000E8h]
  '0052EB1B: push ecx
  '0052EB1C: call [004010A0h]
  '0052EB22: mov [ebp-0000017Ch], eax
  '0052EB28: jmp 52EB34h
  '0052EB2A: mov [ebp-0000017Ch], 00000000h
  '0052EB34: xor edx, edx
  '0052EB36: cmp word ptr [ebp-000000DCh], FFFFh
  '0052EB3E: setz dl
  '0052EB41: neg edx
  '0052EB43: mov [ebp-000000ECh], dx
  '0052EB4A: lea ecx, [ebp-58h]
  '0052EB4D: call [00401030h]
  '0052EB53: movsx eax, word ptr [ebp-000000ECh]
  '0052EB5A: test eax, eax
  '0052EB5C: jz 0052EDF0h
  '0052EB62: mov [ebp-04h], 00000016h
  '0052EB69: mov ecx, [ebp+08h]
  '0052EB6C: mov edx, [ecx]
  '0052EB6E: mov eax, [ebp+08h]
  '0052EB71: push eax
  '0052EB72: call [edx+0000030Ch]
  '0052EB78: push eax
  '0052EB79: lea ecx, [ebp-44h]
  '0052EB7C: push ecx
  '0052EB7D: call [004010E4h]
  '0052EB83: mov [ebp-000000F0h], eax
  '0052EB89: cmp [0054238Ch], 00000000h
  '0052EB90: jnz 52EBAEh
  '0052EB92: push 0054238Ch
  '0052EB97: push 0041D9E0h
  '0052EB9C: call [004012B8h]
  '0052EBA2: mov [ebp-00000180h], 0054238Ch
  '0052EBAC: jmp 52EBB8h
  '0052EBAE: mov [ebp-00000180h], 0054238Ch
  '0052EBB8: mov edx, [ebp-00000180h]
  '0052EBBE: mov eax, [edx]
  '0052EBC0: mov [ebp-000000E8h], eax
  '0052EBC6: mov [ebp-000000D0h], 80020004h
  '0052EBD0: mov [ebp-000000D8h], 0000000Ah
  '0052EBDA: mov [ebp-000000C0h], 80020004h
  '0052EBE4: mov [ebp-000000C8h], 0000000Ah
  '0052EBEE: mov [ebp-000000B0h], 80020004h
  '0052EBF8: mov [ebp-000000B8h], 0000000Ah
  '0052EC02: mov [ebp-000000A0h], 80020004h
  '0052EC0C: mov [ebp-000000A8h], 0000000Ah
  '0052EC16: mov ecx, [ebp-24h]
  '0052EC19: push ecx
  '0052EC1A: push 0042C7ECh
  '0052EC1F: call [0040108Ch]
  '0052EC25: mov [ebp-50h], eax
  '0052EC28: mov [ebp-58h], 00000008h
  '0052EC2F: lea edx, [ebp-3Ch]
  '0052EC32: push edx
  '0052EC33: mov eax, 00000010h
  '0052EC38: call 004081B0h
  '0052EC3D: mov eax, esp
  '0052EC3F: mov ecx, [ebp-000000D8h]
  '0052EC45: mov [eax], ecx
  '0052EC47: mov edx, [ebp-000000D4h]
  '0052EC4D: mov [eax+04h], edx
  '0052EC50: mov ecx, [ebp-000000D0h]
  '0052EC56: mov [eax+08h], ecx
  '0052EC59: mov edx, [ebp-000000CCh]
  '0052EC5F: mov [eax+0Ch], edx
  '0052EC62: mov eax, 00000010h
  '0052EC67: call 004081B0h
  '0052EC6C: mov eax, esp
  '0052EC6E: mov ecx, [ebp-000000C8h]
  '0052EC74: mov [eax], ecx
  '0052EC76: mov edx, [ebp-000000C4h]
  '0052EC7C: mov [eax+04h], edx
  '0052EC7F: mov ecx, [ebp-000000C0h]
  '0052EC85: mov [eax+08h], ecx
  '0052EC88: mov edx, [ebp-000000BCh]
  '0052EC8E: mov [eax+0Ch], edx
  '0052EC91: mov eax, 00000010h
  '0052EC96: call 004081B0h
  '0052EC9B: mov eax, esp
  '0052EC9D: mov ecx, [ebp-000000B8h]
  '0052ECA3: mov [eax], ecx
  '0052ECA5: mov edx, [ebp-000000B4h]
  '0052ECAB: mov [eax+04h], edx
  '0052ECAE: mov ecx, [ebp-000000B0h]
  '0052ECB4: mov [eax+08h], ecx
  '0052ECB7: mov edx, [ebp-000000ACh]
  '0052ECBD: mov [eax+0Ch], edx
  '0052ECC0: mov eax, 00000010h
  '0052ECC5: call 004081B0h
  '0052ECCA: mov eax, esp
  '0052ECCC: mov ecx, [ebp-000000A8h]
  '0052ECD2: mov [eax], ecx
  '0052ECD4: mov edx, [ebp-000000A4h]
  '0052ECDA: mov [eax+04h], edx
  '0052ECDD: mov ecx, [ebp-000000A0h]
  '0052ECE3: mov [eax+08h], ecx
  '0052ECE6: mov edx, [ebp-0000009Ch]
  '0052ECEC: mov [eax+0Ch], edx
  '0052ECEF: mov eax, 00000010h
  '0052ECF4: call 004081B0h
  '0052ECF9: mov eax, esp
  '0052ECFB: mov ecx, [ebp-58h]
  '0052ECFE: mov [eax], ecx
  '0052ED00: mov edx, [ebp-54h]
  '0052ED03: mov [eax+04h], edx
  '0052ED06: mov ecx, [ebp-50h]
  '0052ED09: mov [eax+08h], ecx
  '0052ED0C: mov edx, [ebp-4Ch]
  '0052ED0F: mov [eax+0Ch], edx
  '0052ED12: mov eax, [ebp-000000E8h]
  '0052ED18: mov ecx, [eax]
  '0052ED1A: mov edx, [ebp-000000E8h]
  '0052ED20: push edx
  '0052ED21: call [ecx+44h]
  '0052ED24: fclex 
  '0052ED26: mov [ebp-000000ECh], eax
  '0052ED2C: cmp [ebp-000000ECh], 00000000h
  '0052ED33: jnl 52ED58h
  '0052ED35: push 00000044h
  '0052ED37: push 0041D9D0h
  '0052ED3C: mov eax, [ebp-000000E8h]
  '0052ED42: push eax
  '0052ED43: mov ecx, [ebp-000000ECh]
  '0052ED49: push ecx
  '0052ED4A: call [004010A0h]
  '0052ED50: mov [ebp-00000184h], eax
  '0052ED56: jmp 52ED62h
  '0052ED58: mov [ebp-00000184h], 00000000h
  '0052ED62: mov edx, [ebp-3Ch]
  '0052ED65: mov [ebp-00000134h], edx
  '0052ED6B: mov [ebp-3Ch], 00000000h
  '0052ED72: mov eax, [ebp-00000134h]
  '0052ED78: push eax
  '0052ED79: lea ecx, [ebp-40h]
  '0052ED7C: push ecx
  '0052ED7D: call [004010E4h]
  '0052ED83: push eax
  '0052ED84: mov edx, [ebp-000000F0h]
  '0052ED8A: mov eax, [edx]
  '0052ED8C: mov ecx, [ebp-000000F0h]
  '0052ED92: push ecx
  '0052ED93: call [eax+5Ch]
  '0052ED96: fclex 
  '0052ED98: mov [ebp-000000F4h], eax
  '0052ED9E: cmp [ebp-000000F4h], 00000000h
  '0052EDA5: jnl 52EDCAh
  '0052EDA7: push 0000005Ch
  '0052EDA9: push 00420F90h
  '0052EDAE: mov edx, [ebp-000000F0h]
  '0052EDB4: push edx
  '0052EDB5: mov eax, [ebp-000000F4h]
  '0052EDBB: push eax
  '0052EDBC: call [004010A0h]
  '0052EDC2: mov [ebp-00000188h], eax
  '0052EDC8: jmp 52EDD4h
  '0052EDCA: mov [ebp-00000188h], 00000000h
  '0052EDD4: lea ecx, [ebp-44h]
  '0052EDD7: push ecx
  '0052EDD8: lea edx, [ebp-40h]
  '0052EDDB: push edx
  '0052EDDC: push 00000002h
  '0052EDDE: call [00401064h]
  '0052EDE4: add esp, 0000000Ch
  '0052EDE7: lea ecx, [ebp-58h]
  '0052EDEA: call [00401030h]
  '0052EDF0: mov [ebp-04h], 00000018h
  '0052EDF7: mov eax, [ebp-24h]
  '0052EDFA: push eax
  '0052EDFB: push 0042C820h
  '0052EE00: call [0040108Ch]
  '0052EE06: mov [ebp-50h], eax
  '0052EE09: mov [ebp-58h], 00000008h
  '0052EE10: lea ecx, [ebp-000000DCh]
  '0052EE16: push ecx
  '0052EE17: lea edx, [ebp-58h]
  '0052EE1A: push edx
  '0052EE1B: mov eax, [ebp+08h]
  '0052EE1E: mov ecx, [eax]
  '0052EE20: mov edx, [ebp+08h]
  '0052EE23: push edx
  '0052EE24: call [ecx+000006F8h]
  '0052EE2A: mov [ebp-000000E8h], eax
  '0052EE30: cmp [ebp-000000E8h], 00000000h
  '0052EE37: jnl 52EE5Ch
  '0052EE39: push 000006F8h
  '0052EE3E: push 0042B7DCh
  '0052EE43: mov eax, [ebp+08h]
  '0052EE46: push eax
  '0052EE47: mov ecx, [ebp-000000E8h]
  '0052EE4D: push ecx
  '0052EE4E: call [004010A0h]
  '0052EE54: mov [ebp-0000018Ch], eax
  '0052EE5A: jmp 52EE66h
  '0052EE5C: mov [ebp-0000018Ch], 00000000h
  '0052EE66: xor edx, edx
  '0052EE68: cmp word ptr [ebp-000000DCh], FFFFh
  '0052EE70: setz dl
  '0052EE73: neg edx
  '0052EE75: mov [ebp-000000ECh], dx
  '0052EE7C: lea ecx, [ebp-58h]
  '0052EE7F: call [00401030h]
  '0052EE85: movsx eax, word ptr [ebp-000000ECh]
  '0052EE8C: test eax, eax
  '0052EE8E: jz 0052F122h
  '0052EE94: mov [ebp-04h], 00000019h
  '0052EE9B: mov ecx, [ebp+08h]
  '0052EE9E: mov edx, [ecx]
  '0052EEA0: mov eax, [ebp+08h]
  '0052EEA3: push eax
  '0052EEA4: call [edx+00000304h]
  '0052EEAA: push eax
  '0052EEAB: lea ecx, [ebp-44h]
  '0052EEAE: push ecx
  '0052EEAF: call [004010E4h]
  '0052EEB5: mov [ebp-000000F0h], eax
  '0052EEBB: cmp [0054238Ch], 00000000h
  '0052EEC2: jnz 52EEE0h
  '0052EEC4: push 0054238Ch
  '0052EEC9: push 0041D9E0h
  '0052EECE: call [004012B8h]
  '0052EED4: mov [ebp-00000190h], 0054238Ch
  '0052EEDE: jmp 52EEEAh
  '0052EEE0: mov [ebp-00000190h], 0054238Ch
  '0052EEEA: mov edx, [ebp-00000190h]
  '0052EEF0: mov eax, [edx]
  '0052EEF2: mov [ebp-000000E8h], eax
  '0052EEF8: mov [ebp-000000D0h], 80020004h
  '0052EF02: mov [ebp-000000D8h], 0000000Ah
  '0052EF0C: mov [ebp-000000C0h], 80020004h
  '0052EF16: mov [ebp-000000C8h], 0000000Ah
  '0052EF20: mov [ebp-000000B0h], 80020004h
  '0052EF2A: mov [ebp-000000B8h], 0000000Ah
  '0052EF34: mov [ebp-000000A0h], 80020004h
  '0052EF3E: mov [ebp-000000A8h], 0000000Ah
  '0052EF48: mov ecx, [ebp-24h]
  '0052EF4B: push ecx
  '0052EF4C: push 0042C820h
  '0052EF51: call [0040108Ch]
  '0052EF57: mov [ebp-50h], eax
  '0052EF5A: mov [ebp-58h], 00000008h
  '0052EF61: lea edx, [ebp-3Ch]
  '0052EF64: push edx
  '0052EF65: mov eax, 00000010h
  '0052EF6A: call 004081B0h
  '0052EF6F: mov eax, esp
  '0052EF71: mov ecx, [ebp-000000D8h]
  '0052EF77: mov [eax], ecx
  '0052EF79: mov edx, [ebp-000000D4h]
  '0052EF7F: mov [eax+04h], edx
  '0052EF82: mov ecx, [ebp-000000D0h]
  '0052EF88: mov [eax+08h], ecx
  '0052EF8B: mov edx, [ebp-000000CCh]
  '0052EF91: mov [eax+0Ch], edx
  '0052EF94: mov eax, 00000010h
  '0052EF99: call 004081B0h
  '0052EF9E: mov eax, esp
  '0052EFA0: mov ecx, [ebp-000000C8h]
  '0052EFA6: mov [eax], ecx
  '0052EFA8: mov edx, [ebp-000000C4h]
  '0052EFAE: mov [eax+04h], edx
  '0052EFB1: mov ecx, [ebp-000000C0h]
  '0052EFB7: mov [eax+08h], ecx
  '0052EFBA: mov edx, [ebp-000000BCh]
  '0052EFC0: mov [eax+0Ch], edx
  '0052EFC3: mov eax, 00000010h
  '0052EFC8: call 004081B0h
  '0052EFCD: mov eax, esp
  '0052EFCF: mov ecx, [ebp-000000B8h]
  '0052EFD5: mov [eax], ecx
  '0052EFD7: mov edx, [ebp-000000B4h]
  '0052EFDD: mov [eax+04h], edx
  '0052EFE0: mov ecx, [ebp-000000B0h]
  '0052EFE6: mov [eax+08h], ecx
  '0052EFE9: mov edx, [ebp-000000ACh]
  '0052EFEF: mov [eax+0Ch], edx
  '0052EFF2: mov eax, 00000010h
  '0052EFF7: call 004081B0h
  '0052EFFC: mov eax, esp
  '0052EFFE: mov ecx, [ebp-000000A8h]
  '0052F004: mov [eax], ecx
  '0052F006: mov edx, [ebp-000000A4h]
  '0052F00C: mov [eax+04h], edx
  '0052F00F: mov ecx, [ebp-000000A0h]
  '0052F015: mov [eax+08h], ecx
  '0052F018: mov edx, [ebp-0000009Ch]
  '0052F01E: mov [eax+0Ch], edx
  '0052F021: mov eax, 00000010h
  '0052F026: call 004081B0h
  '0052F02B: mov eax, esp
  '0052F02D: mov ecx, [ebp-58h]
  '0052F030: mov [eax], ecx
  '0052F032: mov edx, [ebp-54h]
  '0052F035: mov [eax+04h], edx
  '0052F038: mov ecx, [ebp-50h]
  '0052F03B: mov [eax+08h], ecx
  '0052F03E: mov edx, [ebp-4Ch]
  '0052F041: mov [eax+0Ch], edx
  '0052F044: mov eax, [ebp-000000E8h]
  '0052F04A: mov ecx, [eax]
  '0052F04C: mov edx, [ebp-000000E8h]
  '0052F052: push edx
  '0052F053: call [ecx+44h]
  '0052F056: fclex 
  '0052F058: mov [ebp-000000ECh], eax
  '0052F05E: cmp [ebp-000000ECh], 00000000h
  '0052F065: jnl 52F08Ah
  '0052F067: push 00000044h
  '0052F069: push 0041D9D0h
  '0052F06E: mov eax, [ebp-000000E8h]
  '0052F074: push eax
  '0052F075: mov ecx, [ebp-000000ECh]
  '0052F07B: push ecx
  '0052F07C: call [004010A0h]
  '0052F082: mov [ebp-00000194h], eax
  '0052F088: jmp 52F094h
  '0052F08A: mov [ebp-00000194h], 00000000h
  '0052F094: mov edx, [ebp-3Ch]
  '0052F097: mov [ebp-00000138h], edx
  '0052F09D: mov [ebp-3Ch], 00000000h
  '0052F0A4: mov eax, [ebp-00000138h]
  '0052F0AA: push eax
  '0052F0AB: lea ecx, [ebp-40h]
  '0052F0AE: push ecx
  '0052F0AF: call [004010E4h]
  '0052F0B5: push eax
  '0052F0B6: mov edx, [ebp-000000F0h]
  '0052F0BC: mov eax, [edx]
  '0052F0BE: mov ecx, [ebp-000000F0h]
  '0052F0C4: push ecx
  '0052F0C5: call [eax+64h]
  '0052F0C8: fclex 
  '0052F0CA: mov [ebp-000000F4h], eax
  '0052F0D0: cmp [ebp-000000F4h], 00000000h
  '0052F0D7: jnl 52F0FCh
  '0052F0D9: push 00000064h
  '0052F0DB: push 0041C058h
  '0052F0E0: mov edx, [ebp-000000F0h]
  '0052F0E6: push edx
  '0052F0E7: mov eax, [ebp-000000F4h]
  '0052F0ED: push eax
  '0052F0EE: call [004010A0h]
  '0052F0F4: mov [ebp-00000198h], eax
  '0052F0FA: jmp 52F106h
  '0052F0FC: mov [ebp-00000198h], 00000000h
  '0052F106: lea ecx, [ebp-44h]
  '0052F109: push ecx
  '0052F10A: lea edx, [ebp-40h]
  '0052F10D: push edx
  '0052F10E: push 00000002h
  '0052F110: call [00401064h]
  '0052F116: add esp, 0000000Ch
  '0052F119: lea ecx, [ebp-58h]
  '0052F11C: call [00401030h]
  '0052F122: mov [ebp-04h], 0000001Bh
  '0052F129: mov eax, [ebp-24h]
  '0052F12C: push eax
  '0052F12D: push 0042C854h
  '0052F132: call [0040108Ch]
  '0052F138: mov [ebp-50h], eax
  '0052F13B: mov [ebp-58h], 00000008h
  '0052F142: lea ecx, [ebp-000000DCh]
  '0052F148: push ecx
  '0052F149: lea edx, [ebp-58h]
  '0052F14C: push edx
  '0052F14D: mov eax, [ebp+08h]
  '0052F150: mov ecx, [eax]
  '0052F152: mov edx, [ebp+08h]
  '0052F155: push edx
  '0052F156: call [ecx+000006F8h]
  '0052F15C: mov [ebp-000000E8h], eax
  '0052F162: cmp [ebp-000000E8h], 00000000h
  '0052F169: jnl 52F18Eh
  '0052F16B: push 000006F8h
  '0052F170: push 0042B7DCh
  '0052F175: mov eax, [ebp+08h]
  '0052F178: push eax
  '0052F179: mov ecx, [ebp-000000E8h]
  '0052F17F: push ecx
  '0052F180: call [004010A0h]
  '0052F186: mov [ebp-0000019Ch], eax
  '0052F18C: jmp 52F198h
  '0052F18E: mov [ebp-0000019Ch], 00000000h
  '0052F198: xor edx, edx
  '0052F19A: cmp word ptr [ebp-000000DCh], FFFFh
  '0052F1A2: setz dl
  '0052F1A5: neg edx
  '0052F1A7: mov [ebp-000000ECh], dx
  '0052F1AE: lea ecx, [ebp-58h]
  '0052F1B1: call [00401030h]
  '0052F1B7: movsx eax, word ptr [ebp-000000ECh]
  '0052F1BE: test eax, eax
  '0052F1C0: jz 0052F4C7h
  '0052F1C6: mov [ebp-04h], 0000001Ch
  '0052F1CD: mov ecx, [ebp+08h]
  '0052F1D0: mov edx, [ecx]
  '0052F1D2: mov eax, [ebp+08h]
  '0052F1D5: push eax
  '0052F1D6: call [edx+00000300h]
  '0052F1DC: push eax
  '0052F1DD: lea ecx, [ebp-40h]
  '0052F1E0: push ecx
  '0052F1E1: call [004010E4h]
  '0052F1E7: mov [ebp-000000F0h], eax
  '0052F1ED: lea edx, [ebp-44h]
  '0052F1F0: push edx
  '0052F1F1: push 00000003h
  '0052F1F3: mov eax, [ebp-000000F0h]
  '0052F1F9: mov ecx, [eax]
  '0052F1FB: mov edx, [ebp-000000F0h]
  '0052F201: push edx
  '0052F202: call [ecx+40h]
  '0052F205: fclex 
  '0052F207: mov [ebp-000000F4h], eax
  '0052F20D: cmp [ebp-000000F4h], 00000000h
  '0052F214: jnl 52F239h
  '0052F216: push 00000040h
  '0052F218: push 0041E60Ch
  '0052F21D: mov eax, [ebp-000000F0h]
  '0052F223: push eax
  '0052F224: mov ecx, [ebp-000000F4h]
  '0052F22A: push ecx
  '0052F22B: call [004010A0h]
  '0052F231: mov [ebp-000001A0h], eax
  '0052F237: jmp 52F243h
  '0052F239: mov [ebp-000001A0h], 00000000h
  '0052F243: mov edx, [ebp-44h]
  '0052F246: mov [ebp-000000F8h], edx
  '0052F24C: cmp [0054238Ch], 00000000h
  '0052F253: jnz 52F271h
  '0052F255: push 0054238Ch
  '0052F25A: push 0041D9E0h
  '0052F25F: call [004012B8h]
  '0052F265: mov [ebp-000001A4h], 0054238Ch
  '0052F26F: jmp 52F27Bh
  '0052F271: mov [ebp-000001A4h], 0054238Ch
  '0052F27B: mov eax, [ebp-000001A4h]
  '0052F281: mov ecx, [eax]
  '0052F283: mov [ebp-000000E8h], ecx
  '0052F289: mov [ebp-000000D0h], 80020004h
  '0052F293: mov [ebp-000000D8h], 0000000Ah
  '0052F29D: mov [ebp-000000C0h], 80020004h
  '0052F2A7: mov [ebp-000000C8h], 0000000Ah
  '0052F2B1: mov [ebp-000000B0h], 80020004h
  '0052F2BB: mov [ebp-000000B8h], 0000000Ah
  '0052F2C5: mov [ebp-000000A0h], 80020004h
  '0052F2CF: mov [ebp-000000A8h], 0000000Ah
  '0052F2D9: mov edx, [ebp-24h]
  '0052F2DC: push edx
  '0052F2DD: push 0042C854h
  '0052F2E2: call [0040108Ch]
  '0052F2E8: mov [ebp-50h], eax
  '0052F2EB: mov [ebp-58h], 00000008h
  '0052F2F2: lea eax, [ebp-3Ch]
  '0052F2F5: push eax
  '0052F2F6: mov eax, 00000010h
  '0052F2FB: call 004081B0h
  '0052F300: mov ecx, esp
  '0052F302: mov edx, [ebp-000000D8h]
  '0052F308: mov [ecx], edx
  '0052F30A: mov eax, [ebp-000000D4h]
  '0052F310: mov [ecx+04h], eax
  '0052F313: mov edx, [ebp-000000D0h]
  '0052F319: mov [ecx+08h], edx
  '0052F31C: mov eax, [ebp-000000CCh]
  '0052F322: mov [ecx+0Ch], eax
  '0052F325: mov eax, 00000010h
  '0052F32A: call 004081B0h
  '0052F32F: mov ecx, esp
  '0052F331: mov edx, [ebp-000000C8h]
  '0052F337: mov [ecx], edx
  '0052F339: mov eax, [ebp-000000C4h]
  '0052F33F: mov [ecx+04h], eax
  '0052F342: mov edx, [ebp-000000C0h]
  '0052F348: mov [ecx+08h], edx
  '0052F34B: mov eax, [ebp-000000BCh]
  '0052F351: mov [ecx+0Ch], eax
  '0052F354: mov eax, 00000010h
  '0052F359: call 004081B0h
  '0052F35E: mov ecx, esp
  '0052F360: mov edx, [ebp-000000B8h]
  '0052F366: mov [ecx], edx
  '0052F368: mov eax, [ebp-000000B4h]
  '0052F36E: mov [ecx+04h], eax
  '0052F371: mov edx, [ebp-000000B0h]
  '0052F377: mov [ecx+08h], edx
  '0052F37A: mov eax, [ebp-000000ACh]
  '0052F380: mov [ecx+0Ch], eax
  '0052F383: mov eax, 00000010h
  '0052F388: call 004081B0h
  '0052F38D: mov ecx, esp
  '0052F38F: mov edx, [ebp-000000A8h]
  '0052F395: mov [ecx], edx
  '0052F397: mov eax, [ebp-000000A4h]
  '0052F39D: mov [ecx+04h], eax
  '0052F3A0: mov edx, [ebp-000000A0h]
  '0052F3A6: mov [ecx+08h], edx
  '0052F3A9: mov eax, [ebp-0000009Ch]
  '0052F3AF: mov [ecx+0Ch], eax
  '0052F3B2: mov eax, 00000010h
  '0052F3B7: call 004081B0h
  '0052F3BC: mov ecx, esp
  '0052F3BE: mov edx, [ebp-58h]
  '0052F3C1: mov [ecx], edx
  '0052F3C3: mov eax, [ebp-54h]
  '0052F3C6: mov [ecx+04h], eax
  '0052F3C9: mov edx, [ebp-50h]
  '0052F3CC: mov [ecx+08h], edx
  '0052F3CF: mov eax, [ebp-4Ch]
  '0052F3D2: mov [ecx+0Ch], eax
  '0052F3D5: mov ecx, [ebp-000000E8h]
  '0052F3DB: mov edx, [ecx]
  '0052F3DD: mov eax, [ebp-000000E8h]
  '0052F3E3: push eax
  '0052F3E4: call [edx+44h]
  '0052F3E7: fclex 
  '0052F3E9: mov [ebp-000000ECh], eax
  '0052F3EF: cmp [ebp-000000ECh], 00000000h
  '0052F3F6: jnl 52F41Bh
  '0052F3F8: push 00000044h
  '0052F3FA: push 0041D9D0h
  '0052F3FF: mov ecx, [ebp-000000E8h]
  '0052F405: push ecx
  '0052F406: mov edx, [ebp-000000ECh]
  '0052F40C: push edx
  '0052F40D: call [004010A0h]
  '0052F413: mov [ebp-000001A8h], eax
  '0052F419: jmp 52F425h
  '0052F41B: mov [ebp-000001A8h], 00000000h
  '0052F425: mov eax, [ebp-3Ch]
  '0052F428: mov [ebp-0000013Ch], eax
  '0052F42E: mov [ebp-3Ch], 00000000h
  '0052F435: mov ecx, [ebp-0000013Ch]
  '0052F43B: push ecx
  '0052F43C: lea edx, [ebp-48h]
  '0052F43F: push edx
  '0052F440: call [004010E4h]
  '0052F446: push eax
  '0052F447: mov eax, [ebp-000000F8h]
  '0052F44D: mov ecx, [eax]
  '0052F44F: mov edx, [ebp-000000F8h]
  '0052F455: push edx
  '0052F456: call [ecx+64h]
  '0052F459: fclex 
  '0052F45B: mov [ebp-000000FCh], eax
  '0052F461: cmp [ebp-000000FCh], 00000000h
  '0052F468: jnl 52F48Dh
  '0052F46A: push 00000064h
  '0052F46C: push 0041C058h
  '0052F471: mov eax, [ebp-000000F8h]
  '0052F477: push eax
  '0052F478: mov ecx, [ebp-000000FCh]
  '0052F47E: push ecx
  '0052F47F: call [004010A0h]
  '0052F485: mov [ebp-000001ACh], eax
  '0052F48B: jmp 52F497h
  '0052F48D: mov [ebp-000001ACh], 00000000h
  '0052F497: lea edx, [ebp-44h]
  '0052F49A: push edx
  '0052F49B: lea eax, [ebp-48h]
  '0052F49E: push eax
  '0052F49F: lea ecx, [ebp-40h]
  '0052F4A2: push ecx
  '0052F4A3: push 00000003h
  '0052F4A5: call [00401064h]
  '0052F4AB: add esp, 00000010h
  '0052F4AE: lea ecx, [ebp-58h]
  '0052F4B1: call [00401030h]
  '0052F4B7: mov [ebp-04h], 0000001Dh
  '0052F4BE: mov edx, [ebp+08h]
  '0052F4C1: mov word ptr [edx+40h], 0003h
  '0052F4C7: mov [ebp-04h], 0000001Fh
  '0052F4CE: lea eax, [ebp-58h]
  '0052F4D1: push eax
  '0052F4D2: call [004011C0h]
  '0052F4D8: mov [ebp-000000A0h], 0042C888h
  '0052F4E2: mov [ebp-000000A8h], 00000008h
  '0052F4EC: mov [ebp-000000B0h], 00000000h
  '0052F4F6: mov [ebp-000000B8h], 00008002h
  '0052F500: push 00000001h
  '0052F502: lea ecx, [ebp-58h]
  '0052F505: push ecx
  '0052F506: lea edx, [ebp-000000A8h]
  '0052F50C: push edx
  '0052F50D: push 00000001h
  '0052F50F: lea eax, [ebp-68h]
  '0052F512: push eax
  '0052F513: call [00401260h]
  '0052F519: push eax
  '0052F51A: lea ecx, [ebp-000000B8h]
  '0052F520: push ecx
  '0052F521: call [00401198h]
  '0052F527: mov [ebp-000000E8h], ax
  '0052F52E: lea edx, [ebp-68h]
  '0052F531: push edx
  '0052F532: lea eax, [ebp-58h]
  '0052F535: push eax
  '0052F536: push 00000002h
  '0052F538: call [00401050h]
  '0052F53E: add esp, 0000000Ch
  '0052F541: movsx ecx, word ptr [ebp-000000E8h]
  '0052F548: test ecx, ecx
  '0052F54A: jz 52F5C6h
  '0052F54C: mov [ebp-04h], 00000020h
  '0052F553: lea edx, [ebp-000000E0h]
  '0052F559: push edx
  '0052F55A: mov eax, [ebp+08h]
  '0052F55D: mov ecx, [eax]
  '0052F55F: mov edx, [ebp+08h]
  '0052F562: push edx
  '0052F563: call [ecx+58h]
  '0052F566: fclex 
  '0052F568: mov [ebp-000000E8h], eax
  '0052F56E: cmp [ebp-000000E8h], 00000000h
  '0052F575: jnl 52F597h
  '0052F577: push 00000058h
  '0052F579: push 0042B9E0h
  '0052F57E: mov eax, [ebp+08h]
  '0052F581: push eax
  '0052F582: mov ecx, [ebp-000000E8h]
  '0052F588: push ecx
  '0052F589: call [004010A0h]
  '0052F58F: mov [ebp-000001B0h], eax
  '0052F595: jmp 52F5A1h
  '0052F597: mov [ebp-000001B0h], 00000000h
  '0052F5A1: mov edx, [ebp-000000E0h]
  '0052F5A7: mov [ebp-000000E4h], edx
  '0052F5AD: lea eax, [ebp-000000E4h]
  '0052F5B3: push eax
  '0052F5B4: call 00519E00h
  '0052F5B9: mov [ebp-04h], 00000021h
  '0052F5C0: call [00401104h]
  '0052F5C6: mov [ebp-04h], 00000023h
  '0052F5CD: call [00401104h]
  '0052F5D3: mov [ebp-04h], 00000024h
  '0052F5DA: cmp [0054238Ch], 00000000h
  '0052F5E1: jnz 52F5FFh
  '0052F5E3: push 0054238Ch
  '0052F5E8: push 0041D9E0h
  '0052F5ED: call [004012B8h]
  '0052F5F3: mov [ebp-000001B4h], 0054238Ch
  '0052F5FD: jmp 52F609h
  '0052F5FF: mov [ebp-000001B4h], 0054238Ch
  '0052F609: mov ecx, [ebp-000001B4h]
  '0052F60F: mov edx, [ecx]
  '0052F611: mov [ebp-000000E8h], edx
  '0052F617: cmp [0054106Ch], 00000000h
  '0052F61E: jnz 52F63Ch
  '0052F620: push 0054106Ch
  '0052F625: push 00411238h
  '0052F62A: call [004012B8h]
  '0052F630: mov [ebp-000001B8h], 0054106Ch
  '0052F63A: jmp 52F646h
  '0052F63C: mov [ebp-000001B8h], 0054106Ch
  '0052F646: mov eax, [ebp-000001B8h]
  '0052F64C: mov ecx, [eax]
  '0052F64E: push ecx
  '0052F64F: lea edx, [ebp-3Ch]
  '0052F652: push edx
  '0052F653: call [004010F8h]
  '0052F659: push eax
  '0052F65A: mov eax, [ebp-000000E8h]
  '0052F660: mov ecx, [eax]
  '0052F662: mov edx, [ebp-000000E8h]
  '0052F668: push edx
  '0052F669: call [ecx+0Ch]
  '0052F66C: fclex 
  '0052F66E: mov [ebp-000000ECh], eax
  '0052F674: cmp [ebp-000000ECh], 00000000h
  '0052F67B: jnl 52F6A0h
  '0052F67D: push 0000000Ch
  '0052F67F: push 0041D9D0h
  '0052F684: mov eax, [ebp-000000E8h]
  '0052F68A: push eax
  '0052F68B: mov ecx, [ebp-000000ECh]
  '0052F691: push ecx
  '0052F692: call [004010A0h]
  '0052F698: mov [ebp-000001BCh], eax
  '0052F69E: jmp 52F6AAh
  '0052F6A0: mov [ebp-000001BCh], 00000000h
  '0052F6AA: lea ecx, [ebp-3Ch]
  '0052F6AD: call [004013B8h]
  '0052F6B3: mov [ebp-04h], 00000025h
  '0052F6BA: cmp [0054238Ch], 00000000h
  '0052F6C1: jnz 52F6DFh
  '0052F6C3: push 0054238Ch
  '0052F6C8: push 0041D9E0h
  '0052F6CD: call [004012B8h]
  '0052F6D3: mov [ebp-000001C0h], 0054238Ch
  '0052F6DD: jmp 52F6E9h
  '0052F6DF: mov [ebp-000001C0h], 0054238Ch
  '0052F6E9: mov edx, [ebp-000001C0h]
  '0052F6EF: mov eax, [edx]
  '0052F6F1: mov [ebp-000000E8h], eax
  '0052F6F7: cmp [0054110Ch], 00000000h
  '0052F6FE: jnz 52F71Ch
  '0052F700: push 0054110Ch
  '0052F705: push 0040A440h
  '0052F70A: call [004012B8h]
  '0052F710: mov [ebp-000001C4h], 0054110Ch
  '0052F71A: jmp 52F726h
  '0052F71C: mov [ebp-000001C4h], 0054110Ch
  '0052F726: mov ecx, [ebp-000001C4h]
  '0052F72C: mov edx, [ecx]
  '0052F72E: push edx
  '0052F72F: lea eax, [ebp-3Ch]
  '0052F732: push eax
  '0052F733: call [004010F8h]
  '0052F739: push eax
  '0052F73A: mov ecx, [ebp-000000E8h]
  '0052F740: mov edx, [ecx]
  '0052F742: mov eax, [ebp-000000E8h]
  '0052F748: push eax
  '0052F749: call [edx+0Ch]
  '0052F74C: fclex 
  '0052F74E: mov [ebp-000000ECh], eax
  '0052F754: cmp [ebp-000000ECh], 00000000h
  '0052F75B: jnl 52F780h
  '0052F75D: push 0000000Ch
  '0052F75F: push 0041D9D0h
  '0052F764: mov ecx, [ebp-000000E8h]
  '0052F76A: push ecx
  '0052F76B: mov edx, [ebp-000000ECh]
  '0052F771: push edx
  '0052F772: call [004010A0h]
  '0052F778: mov [ebp-000001C8h], eax
  '0052F77E: jmp 52F78Ah
  '0052F780: mov [ebp-000001C8h], 00000000h
  '0052F78A: lea ecx, [ebp-3Ch]
  '0052F78D: call [004013B8h]
  '0052F793: mov [ebp-04h], 00000026h
  '0052F79A: cmp [0054238Ch], 00000000h
  '0052F7A1: jnz 52F7BFh
  '0052F7A3: push 0054238Ch
  '0052F7A8: push 0041D9E0h
  '0052F7AD: call [004012B8h]
  '0052F7B3: mov [ebp-000001CCh], 0054238Ch
  '0052F7BD: jmp 52F7C9h
  '0052F7BF: mov [ebp-000001CCh], 0054238Ch
  '0052F7C9: mov eax, [ebp-000001CCh]
  '0052F7CF: mov ecx, [eax]
  '0052F7D1: mov [ebp-000000E8h], ecx
  '0052F7D7: cmp [00541024h], 00000000h
  '0052F7DE: jnz 52F7FCh
  '0052F7E0: push 00541024h
  '0052F7E5: push 00413334h
  '0052F7EA: call [004012B8h]
  '0052F7F0: mov [ebp-000001D0h], 00541024h
  '0052F7FA: jmp 52F806h
  '0052F7FC: mov [ebp-000001D0h], 00541024h
  '0052F806: mov edx, [ebp-000001D0h]
  '0052F80C: mov eax, [edx]
  '0052F80E: push eax
  '0052F80F: lea ecx, [ebp-3Ch]
  '0052F812: push ecx
  '0052F813: call [004010F8h]
  '0052F819: push eax
  '0052F81A: mov edx, [ebp-000000E8h]
  '0052F820: mov eax, [edx]
  '0052F822: mov ecx, [ebp-000000E8h]
  '0052F828: push ecx
  '0052F829: call [eax+0Ch]
  '0052F82C: fclex 
  '0052F82E: mov [ebp-000000ECh], eax
  '0052F834: cmp [ebp-000000ECh], 00000000h
  '0052F83B: jnl 52F860h
  '0052F83D: push 0000000Ch
  '0052F83F: push 0041D9D0h
  '0052F844: mov edx, [ebp-000000E8h]
  '0052F84A: push edx
  '0052F84B: mov eax, [ebp-000000ECh]
  '0052F851: push eax
  '0052F852: call [004010A0h]
  '0052F858: mov [ebp-000001D4h], eax
  '0052F85E: jmp 52F86Ah
  '0052F860: mov [ebp-000001D4h], 00000000h
  '0052F86A: lea ecx, [ebp-3Ch]
  '0052F86D: call [004013B8h]
  '0052F873: mov [ebp-04h], 00000027h
  '0052F87A: mov ecx, [ebp-24h]
  '0052F87D: push ecx
  '0052F87E: push 0042C8A0h
  '0052F883: call [0040108Ch]
  '0052F889: mov [ebp-50h], eax
  '0052F88C: mov [ebp-58h], 00000008h
  '0052F893: lea edx, [ebp-000000DCh]
  '0052F899: push edx
  '0052F89A: lea eax, [ebp-58h]
  '0052F89D: push eax
  '0052F89E: mov ecx, [ebp+08h]
  '0052F8A1: mov edx, [ecx]
  '0052F8A3: mov eax, [ebp+08h]
  '0052F8A6: push eax
  '0052F8A7: call [edx+000006F8h]
  '0052F8AD: mov [ebp-000000E8h], eax
  '0052F8B3: cmp [ebp-000000E8h], 00000000h
  '0052F8BA: jnl 52F8DFh
  '0052F8BC: push 000006F8h
  '0052F8C1: push 0042B7DCh
  '0052F8C6: mov ecx, [ebp+08h]
  '0052F8C9: push ecx
  '0052F8CA: mov edx, [ebp-000000E8h]
  '0052F8D0: push edx
  '0052F8D1: call [004010A0h]
  '0052F8D7: mov [ebp-000001D8h], eax
  '0052F8DD: jmp 52F8E9h
  '0052F8DF: mov [ebp-000001D8h], 00000000h
  '0052F8E9: xor eax, eax
  '0052F8EB: cmp word ptr [ebp-000000DCh], FFFFh
  '0052F8F3: setz al
  '0052F8F6: neg eax
  '0052F8F8: mov [ebp-000000C0h], ax
  '0052F8FF: mov [ebp-000000C8h], 0000000Bh
  '0052F909: lea ecx, [ebp-68h]
  '0052F90C: push ecx
  '0052F90D: call [004011C0h]
  '0052F913: mov [ebp-000000A0h], 0042C8CCh
  '0052F91D: mov [ebp-000000A8h], 00000008h
  '0052F927: mov [ebp-000000B0h], 00000000h
  '0052F931: mov [ebp-000000B8h], 00008002h
  '0052F93B: lea edx, [ebp-000000C8h]
  '0052F941: push edx
  '0052F942: push 00000001h
  '0052F944: lea eax, [ebp-68h]
  '0052F947: push eax
  '0052F948: lea ecx, [ebp-000000A8h]
  '0052F94E: push ecx
  '0052F94F: push 00000000h
  '0052F951: lea edx, [ebp-78h]
  '0052F954: push edx
  '0052F955: call [00401260h]
  '0052F95B: push eax
  '0052F95C: lea eax, [ebp-000000B8h]
  '0052F962: push eax
  '0052F963: lea ecx, [ebp-00000088h]
  '0052F969: push ecx
  '0052F96A: call [00401088h]
  '0052F970: push eax
  '0052F971: lea edx, [ebp-00000098h]
  '0052F977: push edx
  '0052F978: call [004011B8h]
  '0052F97E: push eax
  '0052F97F: call [0040112Ch]
  '0052F985: mov [ebp-000000ECh], ax
  '0052F98C: lea eax, [ebp-000000C8h]
  '0052F992: push eax
  '0052F993: lea ecx, [ebp-78h]
  '0052F996: push ecx
  '0052F997: lea edx, [ebp-68h]
  '0052F99A: push edx
  '0052F99B: lea eax, [ebp-58h]
  '0052F99E: push eax
  '0052F99F: push 00000004h
  '0052F9A1: call [00401050h]
  '0052F9A7: add esp, 00000014h
  '0052F9AA: movsx ecx, word ptr [ebp-000000ECh]
  '0052F9B1: test ecx, ecx
  '0052F9B3: jz 0052FB8Ah
  '0052F9B9: mov [ebp-04h], 00000028h
  '0052F9C0: cmp [00541024h], 00000000h
  '0052F9C7: jnz 52F9E5h
  '0052F9C9: push 00541024h
  '0052F9CE: push 00413334h
  '0052F9D3: call [004012B8h]
  '0052F9D9: mov [ebp-000001DCh], 00541024h
  '0052F9E3: jmp 52F9EFh
  '0052F9E5: mov [ebp-000001DCh], 00541024h
  '0052F9EF: mov edx, [ebp-000001DCh]
  '0052F9F5: mov eax, [edx]
  '0052F9F7: mov [ebp-000000E8h], eax
  '0052F9FD: mov [ebp-000000B0h], 80020004h
  '0052FA07: mov [ebp-000000B8h], 0000000Ah
  '0052FA11: mov [ebp-000000A0h], 80020004h
  '0052FA1B: mov [ebp-000000A8h], 0000000Ah
  '0052FA25: mov eax, 00000010h
  '0052FA2A: call 004081B0h
  '0052FA2F: mov ecx, esp
  '0052FA31: mov edx, [ebp-000000B8h]
  '0052FA37: mov [ecx], edx
  '0052FA39: mov eax, [ebp-000000B4h]
  '0052FA3F: mov [ecx+04h], eax
  '0052FA42: mov edx, [ebp-000000B0h]
  '0052FA48: mov [ecx+08h], edx
  '0052FA4B: mov eax, [ebp-000000ACh]
  '0052FA51: mov [ecx+0Ch], eax
  '0052FA54: mov eax, 00000010h
  '0052FA59: call 004081B0h
  '0052FA5E: mov ecx, esp
  '0052FA60: mov edx, [ebp-000000A8h]
  '0052FA66: mov [ecx], edx
  '0052FA68: mov eax, [ebp-000000A4h]
  '0052FA6E: mov [ecx+04h], eax
  '0052FA71: mov edx, [ebp-000000A0h]
  '0052FA77: mov [ecx+08h], edx
  '0052FA7A: mov eax, [ebp-0000009Ch]
  '0052FA80: mov [ecx+0Ch], eax
  '0052FA83: mov ecx, [ebp-000000E8h]
  '0052FA89: mov edx, [ecx]
  '0052FA8B: mov eax, [ebp-000000E8h]
  '0052FA91: push eax
  '0052FA92: call [edx+000002B0h]
  '0052FA98: fclex 
  '0052FA9A: mov [ebp-000000ECh], eax
  '0052FAA0: cmp [ebp-000000ECh], 00000000h
  '0052FAA7: jnl 52FACFh
  '0052FAA9: push 000002B0h
  '0052FAAE: push 0041C0E8h
  '0052FAB3: mov ecx, [ebp-000000E8h]
  '0052FAB9: push ecx
  '0052FABA: mov edx, [ebp-000000ECh]
  '0052FAC0: push edx
  '0052FAC1: call [004010A0h]
  '0052FAC7: mov [ebp-000001E0h], eax
  '0052FACD: jmp 52FAD9h
  '0052FACF: mov [ebp-000001E0h], 00000000h
  '0052FAD9: mov [ebp-04h], 00000029h
  '0052FAE0: cmp [0054238Ch], 00000000h
  '0052FAE7: jnz 52FB05h
  '0052FAE9: push 0054238Ch
  '0052FAEE: push 0041D9E0h
  '0052FAF3: call [004012B8h]
  '0052FAF9: mov [ebp-000001E4h], 0054238Ch
  '0052FB03: jmp 52FB0Fh
  '0052FB05: mov [ebp-000001E4h], 0054238Ch
  '0052FB0F: mov eax, [ebp-000001E4h]
  '0052FB15: mov ecx, [eax]
  '0052FB17: mov [ebp-000000E8h], ecx
  '0052FB1D: mov edx, [ebp+08h]
  '0052FB20: push edx
  '0052FB21: lea eax, [ebp-3Ch]
  '0052FB24: push eax
  '0052FB25: call [004010F8h]
  '0052FB2B: push eax
  '0052FB2C: mov ecx, [ebp-000000E8h]
  '0052FB32: mov edx, [ecx]
  '0052FB34: mov eax, [ebp-000000E8h]
  '0052FB3A: push eax
  '0052FB3B: call [edx+10h]
  '0052FB3E: fclex 
  '0052FB40: mov [ebp-000000ECh], eax
  '0052FB46: cmp [ebp-000000ECh], 00000000h
  '0052FB4D: jnl 52FB72h
  '0052FB4F: push 00000010h
  '0052FB51: push 0041D9D0h
  '0052FB56: mov ecx, [ebp-000000E8h]
  '0052FB5C: push ecx
  '0052FB5D: mov edx, [ebp-000000ECh]
  '0052FB63: push edx
  '0052FB64: call [004010A0h]
  '0052FB6A: mov [ebp-000001E8h], eax
  '0052FB70: jmp 52FB7Ch
  '0052FB72: mov [ebp-000001E8h], 00000000h
  '0052FB7C: lea ecx, [ebp-3Ch]
  '0052FB7F: call [004013B8h]
  '0052FB85: jmp 0052FC0Ch
  '0052FB8A: mov [ebp-04h], 0000002Bh
  '0052FB91: mov eax, [ebp+08h]
  '0052FB94: mov ecx, [eax]
  '0052FB96: mov edx, [ebp+08h]
  '0052FB99: push edx
  '0052FB9A: call [ecx+000002FCh]
  '0052FBA0: push eax
  '0052FBA1: lea eax, [ebp-3Ch]
  '0052FBA4: push eax
  '0052FBA5: call [004010E4h]
  '0052FBAB: mov [ebp-000000E8h], eax
  '0052FBB1: push FFFFFFFFh
  '0052FBB3: mov ecx, [ebp-000000E8h]
  '0052FBB9: mov edx, [ecx]
  '0052FBBB: mov eax, [ebp-000000E8h]
  '0052FBC1: push eax
  '0052FBC2: call [edx+5Ch]
  '0052FBC5: fclex 
  '0052FBC7: mov [ebp-000000ECh], eax
  '0052FBCD: cmp [ebp-000000ECh], 00000000h
  '0052FBD4: jnl 52FBF9h
  '0052FBD6: push 0000005Ch
  '0052FBD8: push 0041E5CCh
  '0052FBDD: mov ecx, [ebp-000000E8h]
  '0052FBE3: push ecx
  '0052FBE4: mov edx, [ebp-000000ECh]
  '0052FBEA: push edx
  '0052FBEB: call [004010A0h]
  '0052FBF1: mov [ebp-000001ECh], eax
  '0052FBF7: jmp 52FC03h
  '0052FBF9: mov [ebp-000001ECh], 00000000h
  '0052FC03: lea ecx, [ebp-3Ch]
  '0052FC06: call [004013B8h]
  '0052FC0C: mov [ebp-10h], 00000000h
  '0052FC13: wait 
  '0052FC14: push 0052FC85h
  '0052FC19: jmp 52FC7Bh
  '0052FC1B: lea eax, [ebp-38h]
  '0052FC1E: push eax
  '0052FC1F: lea ecx, [ebp-34h]
  '0052FC22: push ecx
  '0052FC23: lea edx, [ebp-30h]
  '0052FC26: push edx
  '0052FC27: lea eax, [ebp-2Ch]
  '0052FC2A: push eax
  '0052FC2B: lea ecx, [ebp-28h]
  '0052FC2E: push ecx
  '0052FC2F: push 00000005h
  '0052FC31: call [004012E8h]
  '0052FC37: add esp, 00000018h
  '0052FC3A: lea edx, [ebp-48h]
  '0052FC3D: push edx
  '0052FC3E: lea eax, [ebp-44h]
  '0052FC41: push eax
  '0052FC42: lea ecx, [ebp-40h]
  '0052FC45: push ecx
  '0052FC46: lea edx, [ebp-3Ch]
  '0052FC49: push edx
  '0052FC4A: push 00000004h
  '0052FC4C: call [00401064h]
  '0052FC52: add esp, 00000014h
  '0052FC55: lea eax, [ebp-00000098h]
  '0052FC5B: push eax
  '0052FC5C: lea ecx, [ebp-00000088h]
  '0052FC62: push ecx
  '0052FC63: lea edx, [ebp-78h]
  '0052FC66: push edx
  '0052FC67: lea eax, [ebp-68h]
  '0052FC6A: push eax
  '0052FC6B: lea ecx, [ebp-58h]
  '0052FC6E: push ecx
  '0052FC6F: push 00000005h
  '0052FC71: call [00401050h]
  '0052FC77: add esp, 00000018h
  '0052FC7A: ret 
End Sub
Private Sub unknown_52FCB0
  '0052FCB0: push ebp
  '0052FCB1: mov ebp, esp
  '0052FCB3: sub esp, 0000000Ch
  '0052FCB6: push 004081B6h
  '0052FCBB: mov eax, fs:[00h]
  '0052FCC1: push eax
  '0052FCC2: mov fs:[00000000h], esp
  '0052FCC9: sub esp, 00000028h
  '0052FCCC: push ebx
  '0052FCCD: push esi
  '0052FCCE: push edi
  '0052FCCF: mov [ebp-0Ch], esp
  '0052FCD2: mov [ebp-08h], 00407938h
  '0052FCD9: xor esi, esi
  '0052FCDB: mov [ebp-04h], esi
  '0052FCDE: mov eax, [ebp+08h]
  '0052FCE1: push eax
  '0052FCE2: mov ecx, [eax]
  '0052FCE4: call [ecx+04h]
  '0052FCE7: mov edx, [ebp+0Ch]
  '0052FCEA: lea ecx, [ebp-30h]
  '0052FCED: mov [ebp-18h], esi
  '0052FCF0: mov [ebp-1Ch], esi
  '0052FCF3: mov [ebp-20h], esi
  '0052FCF6: mov [ebp-30h], esi
  '0052FCF9: call [00401028h]
  '0052FCFF: lea edx, [ebp-1Ch]
  '0052FD02: push eax
  '0052FD03: push edx
  '0052FD04: call [0040126Ch]
  '0052FD0A: push eax
  '0052FD0B: lea eax, [ebp-20h]
  '0052FD0E: push eax
  '0052FD0F: call [00401330h]
  '0052FD15: push eax
  '0052FD16: call 0042BA34h
  '0052FD1B: mov esi, eax
  '0052FD1D: call [0040109Ch]
  '0052FD23: xor ecx, ecx
  '0052FD25: cmp esi, FFFFFFFFh
  '0052FD28: lea edx, [ebp-20h]
  '0052FD2B: lea eax, [ebp-1Ch]
  '0052FD2E: setnz cl
  '0052FD31: push edx
  '0052FD32: push eax
  '0052FD33: neg ecx
  '0052FD35: push 00000002h
  '0052FD37: mov [ebp-18h], ecx
  '0052FD3A: call [004012E8h]
  '0052FD40: add esp, 0000000Ch
  '0052FD43: push 0052FD5Fh
  '0052FD48: jmp 52FD5Eh
  '0052FD4A: lea ecx, [ebp-20h]
  '0052FD4D: lea edx, [ebp-1Ch]
  '0052FD50: push ecx
  '0052FD51: push edx
  '0052FD52: push 00000002h
  '0052FD54: call [004012E8h]
  '0052FD5A: add esp, 0000000Ch
  '0052FD5D: ret 
End Sub
Private Sub unknown_530110
  '00530110: push ebp
  '00530111: mov ebp, esp
  '00530113: sub esp, 0000000Ch
  '00530116: push 004081B6h
  '0053011B: mov eax, fs:[00h]
  '00530121: push eax
  '00530122: mov fs:[00000000h], esp
  '00530129: sub esp, 00000090h
  '0053012F: push ebx
  '00530130: push esi
  '00530131: push edi
  '00530132: mov [ebp-0Ch], esp
  '00530135: mov [ebp-08h], 00407970h
  '0053013C: xor ebx, ebx
  '0053013E: mov [ebp-04h], ebx
  '00530141: mov eax, [ebp+08h]
  '00530144: push eax
  '00530145: mov ecx, [eax]
  '00530147: call [ecx+04h]
  '0053014A: mov eax, [ebp+0Ch]
  '0053014D: mov [ebp-18h], ebx
  '00530150: cmp ax, 0064h
  '00530154: mov [ebp-1Ch], ebx
  '00530157: mov [ebp-20h], ebx
  '0053015A: mov [ebp-24h], ebx
  '0053015D: mov [ebp-28h], ebx
  '00530160: mov [ebp-2Ch], ebx
  '00530163: mov [ebp-30h], ebx
  '00530166: mov [ebp-34h], ebx
  '00530169: mov [ebp-38h], ebx
  '0053016C: mov [ebp-3Ch], ebx
  '0053016F: jnle 00530488h
  '00530175: cmp ax, bx
  '00530178: jl 00530488h
  '0053017E: mov edx, [ebp+10h]
  '00530181: lea ecx, [ebp-28h]
  '00530184: push ecx
  '00530185: mov esi, [edx]
  '00530187: push esi
  '00530188: mov eax, [esi]
  '0053018A: call [eax+000000E0h]
  '00530190: cmp eax, ebx
  '00530192: fclex 
  '00530194: jnl 5301ACh
  '00530196: mov edi, [004010A0h]
  '0053019C: push 000000E0h
  '005301A1: push 0041C058h
  '005301A6: push esi
  '005301A7: push eax
  '005301A8: call edi
  '005301AA: jmp 5301B2h
  '005301AC: mov edi, [004010A0h]
  '005301B2: mov edx, [ebp+10h]
  '005301B5: lea ecx, [ebp-2Ch]
  '005301B8: push ecx
  '005301B9: mov esi, [edx]
  '005301BB: push esi
  '005301BC: mov eax, [esi]
  '005301BE: call [eax+00000080h]
  '005301C4: cmp eax, ebx
  '005301C6: fclex 
  '005301C8: jnl 5301D8h
  '005301CA: push 00000080h
  '005301CF: push 0041C058h
  '005301D4: push esi
  '005301D5: push eax
  '005301D6: call edi
  '005301D8: cmp [0054238Ch], ebx
  '005301DE: jnz 5301F0h
  '005301E0: push 0054238Ch
  '005301E5: push 0041D9E0h
  '005301EA: call [004012B8h]
  '005301F0: mov esi, [0054238Ch]
  '005301F6: lea eax, [ebp-20h]
  '005301F9: push eax
  '005301FA: push esi
  '005301FB: mov edx, [esi]
  '005301FD: call [edx+18h]
  '00530200: cmp eax, ebx
  '00530202: fclex 
  '00530204: jnl 530211h
  '00530206: push 00000018h
  '00530208: push 0041D9D0h
  '0053020D: push esi
  '0053020E: push eax
  '0053020F: call edi
  '00530211: mov eax, [ebp-20h]
  '00530214: lea edx, [ebp-30h]
  '00530217: push edx
  '00530218: push eax
  '00530219: mov ecx, [eax]
  '0053021B: mov esi, eax
  '0053021D: call [ecx+00000080h]
  '00530223: cmp eax, ebx
  '00530225: fclex 
  '00530227: jnl 530237h
  '00530229: push 00000080h
  '0053022E: push 00420F20h
  '00530233: push esi
  '00530234: push eax
  '00530235: call edi
  '00530237: mov eax, [ebp+10h]
  '0053023A: lea edx, [ebp-34h]
  '0053023D: push edx
  '0053023E: mov esi, [eax]
  '00530240: push esi
  '00530241: mov ecx, [esi]
  '00530243: call [ecx+00000088h]
  '00530249: cmp eax, ebx
  '0053024B: fclex 
  '0053024D: jnl 53025Dh
  '0053024F: push 00000088h
  '00530254: push 0041C058h
  '00530259: push esi
  '0053025A: push eax
  '0053025B: call edi
  '0053025D: cmp [0054238Ch], ebx
  '00530263: jnz 530275h
  '00530265: push 0054238Ch
  '0053026A: push 0041D9E0h
  '0053026F: call [004012B8h]
  '00530275: mov esi, [0054238Ch]
  '0053027B: lea ecx, [ebp-24h]
  '0053027E: push ecx
  '0053027F: push esi
  '00530280: mov eax, [esi]
  '00530282: call [eax+18h]
  '00530285: cmp eax, ebx
  '00530287: fclex 
  '00530289: jnl 530296h
  '0053028B: push 00000018h
  '0053028D: push 0041D9D0h
  '00530292: push esi
  '00530293: push eax
  '00530294: call edi
  '00530296: mov eax, [ebp-24h]
  '00530299: lea ecx, [ebp-38h]
  '0053029C: push ecx
  '0053029D: push eax
  '0053029E: mov edx, [eax]
  '005302A0: mov esi, eax
  '005302A2: call [edx+00000088h]
  '005302A8: cmp eax, ebx
  '005302AA: fclex 
  '005302AC: jnl 5302BCh
  '005302AE: push 00000088h
  '005302B3: push 00420F20h
  '005302B8: push esi
  '005302B9: push eax
  '005302BA: call edi
  '005302BC: mov ebx, [ebp+14h]
  '005302BF: lea eax, [ebp-3Ch]
  '005302C2: push eax
  '005302C3: mov esi, [ebx]
  '005302C5: push esi
  '005302C6: mov edx, [esi]
  '005302C8: call [edx+000000E0h]
  '005302CE: test eax, eax
  '005302D0: fclex 
  '005302D2: jnl 5302E2h
  '005302D4: push 000000E0h
  '005302D9: push 0041C058h
  '005302DE: push esi
  '005302DF: push eax
  '005302E0: call edi
  '005302E2: fld real4 ptr [ebp-34h]
  '005302E5: cmp [00541000h], 00000000h
  '005302EC: jnz 5302F3h
  '005302EE: fdiv real4 ptr [ebp-38h]
  '005302F1: jmp 5302FBh
  '005302F3: push [ebp-38h]
  '005302F6: call 004081C8h
  '005302FB: movsx ecx, word ptr [ebp+0Ch]
  '005302FF: mov edx, [ebp-3Ch]
  '00530302: mov esi, [0040135Ch]
  '00530308: push 00CC0020h
  '0053030D: push 00000000h
  '0053030F: push 00000000h
  '00530311: push edx
  '00530312: mov [ebp-00000088h], ecx
  '00530318: fstsw ax
  '0053031A: test al, 0Dh
  '0053031C: jnz 005304D4h
  '00530322: call esi
  '00530324: fld real4 ptr [ebp-2Ch]
  '00530327: cmp [00541000h], 00000000h
  '0053032E: jnz 530335h
  '00530330: fdiv real4 ptr [ebp-30h]
  '00530333: jmp 53033Dh
  '00530335: push [ebp-30h]
  '00530338: call 004081C8h
  '0053033D: push eax
  '0053033E: fstsw ax
  '00530340: test al, 0Dh
  '00530342: jnz 005304D4h
  '00530348: fild dword ptr [ebp-00000088h]
  '0053034E: fstp real8 ptr [ebp-00000090h]
  '00530354: fld real8 ptr [ebp-00000090h]
  '0053035A: cmp [00541000h], 00000000h
  '00530361: jnz 53036Bh
  '00530363: fdiv real8 ptr [00407968h]
  '00530369: jmp 53037Ch
  '0053036B: push [0040796Ch]
  '00530371: push [00407968h]
  '00530377: call 004081D4h
  '0053037C: fmulp st(1), st(0)
  '0053037E: fild dword ptr [ebp-00000088h]
  '00530384: fstp real8 ptr [ebp-00000098h]
  '0053038A: fld real8 ptr [ebp-00000098h]
  '00530390: fmul real8 ptr [00407960h]
  '00530396: faddp st(1), st(0)
  '00530398: fstsw ax
  '0053039A: test al, 0Dh
  '0053039C: jnz 005304D4h
  '005303A2: call esi
  '005303A4: push eax
  '005303A5: mov eax, [ebp+0Ch]
  '005303A8: neg eax
  '005303AA: movsx ecx, ax
  '005303AD: mov [ebp-0000009Ch], ecx
  '005303B3: push 00000000h
  '005303B5: fild dword ptr [ebp-0000009Ch]
  '005303BB: fstp real8 ptr [ebp-000000A4h]
  '005303C1: fld real8 ptr [ebp-000000A4h]
  '005303C7: fmul real8 ptr [00407960h]
  '005303CD: fstsw ax
  '005303CF: test al, 0Dh
  '005303D1: jnz 005304D4h
  '005303D7: call esi
  '005303D9: mov edx, [ebp-28h]
  '005303DC: push eax
  '005303DD: push edx
  '005303DE: call 00427568h
  '005303E3: call [0040109Ch]
  '005303E9: lea eax, [ebp-24h]
  '005303EC: lea ecx, [ebp-20h]
  '005303EF: push eax
  '005303F0: push ecx
  '005303F1: push 00000002h
  '005303F3: call [00401064h]
  '005303F9: mov edx, [ebp+10h]
  '005303FC: add esp, 0000000Ch
  '005303FF: mov esi, [edx]
  '00530401: push esi
  '00530402: mov eax, [esi]
  '00530404: call [eax+00000264h]
  '0053040A: test eax, eax
  '0053040C: fclex 
  '0053040E: jnl 53041Eh
  '00530410: push 00000264h
  '00530415: push 0041C058h
  '0053041A: push esi
  '0053041B: push eax
  '0053041C: call edi
  '0053041E: mov esi, [ebx]
  '00530420: push esi
  '00530421: mov ecx, [esi]
  '00530423: call [ecx+00000264h]
  '00530429: test eax, eax
  '0053042B: fclex 
  '0053042D: jnl 53043Dh
  '0053042F: push 00000264h
  '00530434: push 0041C058h
  '00530439: push esi
  '0053043A: push eax
  '0053043B: call edi
  '0053043D: mov edx, [ebp+0Ch]
  '00530440: push edx
  '00530441: call [0040100Ch]
  '00530447: mov esi, [00401378h]
  '0053044D: mov edx, eax
  '0053044F: lea ecx, [ebp-18h]
  '00530452: call esi
  '00530454: push eax
  '00530455: push 0042C8D8h
  '0053045A: call [0040108Ch]
  '00530460: mov edx, eax
  '00530462: lea ecx, [ebp-1Ch]
  '00530465: call esi
  '00530467: mov edx, eax
  '00530469: mov eax, [ebp+08h]
  '0053046C: lea ecx, [eax+34h]
  '0053046F: call [004012D8h]
  '00530475: lea ecx, [ebp-1Ch]
  '00530478: lea edx, [ebp-18h]
  '0053047B: push ecx
  '0053047C: push edx
  '0053047D: push 00000002h
  '0053047F: call [004012E8h]
  '00530485: add esp, 0000000Ch
  '00530488: wait 
  '00530489: push 005304B5h
  '0053048E: jmp 5304B4h
  '00530490: lea eax, [ebp-1Ch]
  '00530493: lea ecx, [ebp-18h]
  '00530496: push eax
  '00530497: push ecx
  '00530498: push 00000002h
  '0053049A: call [004012E8h]
  '005304A0: lea edx, [ebp-24h]
  '005304A3: lea eax, [ebp-20h]
  '005304A6: push edx
  '005304A7: push eax
  '005304A8: push 00000002h
  '005304AA: call [00401064h]
  '005304B0: add esp, 00000018h
  '005304B3: ret 
End Sub

