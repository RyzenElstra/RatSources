VERSION 5.00
Begin VB.Form frmKeyLog
  Caption = "kl"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  Icon = "frmKeyLog.frx":0
  LinkTopic = "Form2"
  MaxButton = 0   'False
  ClientLeft = 165
  ClientTop = 735
  ClientWidth = 5655
  ClientHeight = 3360
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
  Begin RichTextLib.RichTextBox txtKeyLog
    Left = 0
    Top = 0
    Width = 5655
    Height = 2655
    TabIndex = 1
  End
  Begin MSComctlLib.StatusBar StatusBar1
    Left = 0
    Top = 3105
    Width = 5655
    Height = 255
    TabIndex = 0
  End
  Begin VB.Frame Frame1
    Left = 0
    Top = 2600
    Width = 5655
    Height = 495
    TabIndex = 2
    Begin VB.CheckBox chkAutoClean
      Caption = "Automatically clean {KEYS}"
      Left = 3000
      Top = 200
      Width = 2295
      Height = 195
      TabIndex = 4
    End
    Begin VB.CheckBox chkEnter
      Caption = "Replace {ENTER} with a new line."
      ForeColor = &H0&
      Left = 120
      Top = 200
      Width = 2775
      Height = 195
      TabIndex = 3
    End
  End
  Begin VB.Menu keylog_options
    Caption = "Options"
    Begin VB.Menu format_text
      Caption = "Clean Up Text"
    End
    Begin VB.Menu save_text
      Caption = "Save text"
    End
    Begin VB.Menu clear_text
      Caption = "Clear text"
    End
  End
End

Attribute VB_Name = "frmKeyLog"

Private Sub format_text__51AEE0
  '0051AEE0: push ebp
  '0051AEE1: mov ebp, esp
  '0051AEE3: sub esp, 0000000Ch
  '0051AEE6: push 004081B6h
  '0051AEEB: mov eax, fs:[00h]
  '0051AEF1: push eax
  '0051AEF2: mov fs:[00000000h], esp
  '0051AEF9: sub esp, 00000008h
  '0051AEFC: push ebx
  '0051AEFD: push esi
  '0051AEFE: push edi
  '0051AEFF: mov [ebp-0Ch], esp
  '0051AF02: mov [ebp-08h], 00406BB0h
  '0051AF09: mov esi, [ebp+08h]
  '0051AF0C: mov eax, esi
  '0051AF0E: and eax, 00000001h
  '0051AF11: mov [ebp-04h], eax
  '0051AF14: and esi, FFFFFFFEh
  '0051AF17: push esi
  '0051AF18: mov [ebp+08h], esi
  '0051AF1B: mov ecx, [esi]
  '0051AF1D: call [ecx+04h]
  '0051AF20: mov edx, [esi]
  '0051AF22: push esi
  '0051AF23: call [edx+00000730h]
  '0051AF29: mov [ebp-04h], 00000000h
  '0051AF30: mov eax, [ebp+08h]
  '0051AF33: push eax
  '0051AF34: mov ecx, [eax]
  '0051AF36: call [ecx+08h]
  '0051AF39: mov eax, [ebp-04h]
  '0051AF3C: mov ecx, [ebp-14h]
  '0051AF3F: pop edi
  '0051AF40: pop esi
  '0051AF41: mov fs:[00000000h], ecx
  '0051AF48: pop ebx
  '0051AF49: mov esp, ebp
  '0051AF4B: pop ebp
  '0051AF4C: retn 0004h
End Sub
Private Sub save_text__51AF50
  '0051AF50: push ebp
  '0051AF51: mov ebp, esp
  '0051AF53: sub esp, 0000000Ch
  '0051AF56: push 004081B6h
  '0051AF5B: mov eax, fs:[00h]
  '0051AF61: push eax
  '0051AF62: mov fs:[00000000h], esp
  '0051AF69: sub esp, 00000068h
  '0051AF6C: push ebx
  '0051AF6D: push esi
  '0051AF6E: push edi
  '0051AF6F: mov [ebp-0Ch], esp
  '0051AF72: mov [ebp-08h], 00406BB8h
  '0051AF79: mov esi, [ebp+08h]
  '0051AF7C: mov eax, esi
  '0051AF7E: and eax, 00000001h
  '0051AF81: mov [ebp-04h], eax
  '0051AF84: and esi, FFFFFFFEh
  '0051AF87: push esi
  '0051AF88: mov [ebp+08h], esi
  '0051AF8B: mov ecx, [esi]
  '0051AF8D: call [ecx+04h]
  '0051AF90: mov edx, [esi]
  '0051AF92: xor ebx, ebx
  '0051AF94: push ebx
  '0051AF95: push FFFFFDFBh
  '0051AF9A: push esi
  '0051AF9B: mov [ebp-18h], ebx
  '0051AF9E: mov [ebp-1Ch], ebx
  '0051AFA1: mov [ebp-20h], ebx
  '0051AFA4: mov [ebp-24h], ebx
  '0051AFA7: mov [ebp-28h], ebx
  '0051AFAA: mov [ebp-2Ch], ebx
  '0051AFAD: mov [ebp-30h], ebx
  '0051AFB0: mov [ebp-34h], ebx
  '0051AFB3: mov [ebp-44h], ebx
  '0051AFB6: mov [ebp-58h], ebx
  '0051AFB9: mov [ebp-5Ch], ebx
  '0051AFBC: mov [ebp-60h], ebx
  '0051AFBF: mov [ebp-64h], ebx
  '0051AFC2: mov [ebp-68h], ebx
  '0051AFC5: mov [ebp-6Ch], ebx
  '0051AFC8: call [edx+00000318h]
  '0051AFCE: push eax
  '0051AFCF: lea eax, [ebp-34h]
  '0051AFD2: push eax
  '0051AFD3: call [004010E4h]
  '0051AFD9: lea ecx, [ebp-44h]
  '0051AFDC: push eax
  '0051AFDD: push ecx
  '0051AFDE: call [004011E4h]
  '0051AFE4: add esp, 00000010h
  '0051AFE7: push eax
  '0051AFE8: call [0040103Ch]
  '0051AFEE: mov edx, eax
  '0051AFF0: lea ecx, [ebp-20h]
  '0051AFF3: call [00401378h]
  '0051AFF9: push eax
  '0051AFFA: push 0041BC60h
  '0051AFFF: call [00401184h]
  '0051B005: mov edi, eax
  '0051B007: lea ecx, [ebp-20h]
  '0051B00A: neg edi
  '0051B00C: sbb edi, edi
  '0051B00E: neg edi
  '0051B010: neg edi
  '0051B012: call [004013B4h]
  '0051B018: lea ecx, [ebp-34h]
  '0051B01B: call [004013B8h]
  '0051B021: lea ecx, [ebp-44h]
  '0051B024: call [00401030h]
  '0051B02A: cmp di, bx
  '0051B02D: jz 0051B1E5h
  '0051B033: push 00409784h
  '0051B038: call [00401200h]
  '0051B03E: lea edx, [ebp-18h]
  '0051B041: push eax
  '0051B042: push edx
  '0051B043: call [004010E4h]
  '0051B049: mov eax, [esi]
  '0051B04B: lea ecx, [ebp-60h]
  '0051B04E: push ecx
  '0051B04F: push esi
  '0051B050: call [eax+58h]
  '0051B053: cmp eax, ebx
  '0051B055: fclex 
  '0051B057: jnl 51B068h
  '0051B059: push 00000058h
  '0051B05B: push 00421D9Ch
  '0051B060: push esi
  '0051B061: push eax
  '0051B062: call [004010A0h]
  '0051B068: mov edx, [ebp-60h]
  '0051B06B: mov edi, [004012D8h]
  '0051B071: mov [ebp-68h], edx
  '0051B074: mov edx, 0041F400h
  '0051B079: lea ecx, [ebp-30h]
  '0051B07C: mov [ebp-6Ch], ebx
  '0051B07F: call edi
  '0051B081: mov edx, 0042A4D8h
  '0051B086: lea ecx, [ebp-2Ch]
  '0051B089: call edi
  '0051B08B: xor edx, edx
  '0051B08D: lea ecx, [ebp-28h]
  '0051B090: call edi
  '0051B092: mov edx, 0041F3A8h
  '0051B097: lea ecx, [ebp-24h]
  '0051B09A: mov [ebp-64h], 00000001h
  '0051B0A1: call edi
  '0051B0A3: xor edx, edx
  '0051B0A5: lea ecx, [ebp-20h]
  '0051B0A8: mov [ebp-58h], FFFFFFFFh
  '0051B0AF: call edi
  '0051B0B1: lea edx, [ebp-5Ch]
  '0051B0B4: mov eax, [ebp-18h]
  '0051B0B7: push edx
  '0051B0B8: lea edx, [ebp-6Ch]
  '0051B0BB: push edx
  '0051B0BC: lea edx, [ebp-68h]
  '0051B0BF: push edx
  '0051B0C0: lea edx, [ebp-30h]
  '0051B0C3: push edx
  '0051B0C4: lea edx, [ebp-2Ch]
  '0051B0C7: push edx
  '0051B0C8: lea edx, [ebp-28h]
  '0051B0CB: push edx
  '0051B0CC: lea edx, [ebp-64h]
  '0051B0CF: push edx
  '0051B0D0: lea edx, [ebp-24h]
  '0051B0D3: push edx
  '0051B0D4: mov ecx, [eax]
  '0051B0D6: lea edx, [ebp-58h]
  '0051B0D9: push edx
  '0051B0DA: lea edx, [ebp-20h]
  '0051B0DD: push edx
  '0051B0DE: lea edx, [ebp-1Ch]
  '0051B0E1: push edx
  '0051B0E2: push eax
  '0051B0E3: call [ecx+28h]
  '0051B0E6: cmp eax, ebx
  '0051B0E8: fclex 
  '0051B0EA: jnl 51B0FEh
  '0051B0EC: mov ecx, [ebp-18h]
  '0051B0EF: push 00000028h
  '0051B0F1: push 0041D108h
  '0051B0F6: push ecx
  '0051B0F7: push eax
  '0051B0F8: call [004010A0h]
  '0051B0FE: lea edx, [ebp-30h]
  '0051B101: lea eax, [ebp-2Ch]
  '0051B104: push edx
  '0051B105: lea ecx, [ebp-28h]
  '0051B108: push eax
  '0051B109: lea edx, [ebp-24h]
  '0051B10C: push ecx
  '0051B10D: lea eax, [ebp-20h]
  '0051B110: push edx
  '0051B111: push eax
  '0051B112: push 00000005h
  '0051B114: call [004012E8h]
  '0051B11A: mov ecx, [ebp-1Ch]
  '0051B11D: add esp, 00000018h
  '0051B120: push ecx
  '0051B121: push 0041BC60h
  '0051B126: call [00401184h]
  '0051B12C: test eax, eax
  '0051B12E: jz 0051B209h
  '0051B134: mov edx, [ebp-1Ch]
  '0051B137: push edx
  '0051B138: push 00000001h
  '0051B13A: push FFFFFFFFh
  '0051B13C: push 00000002h
  '0051B13E: call [004012A0h]
  '0051B144: mov eax, [esi]
  '0051B146: push ebx
  '0051B147: push FFFFFDFBh
  '0051B14C: push esi
  '0051B14D: call [eax+00000318h]
  '0051B153: lea ecx, [ebp-34h]
  '0051B156: push eax
  '0051B157: push ecx
  '0051B158: call [004010E4h]
  '0051B15E: lea edx, [ebp-44h]
  '0051B161: push eax
  '0051B162: push edx
  '0051B163: call [004011E4h]
  '0051B169: add esp, 00000010h
  '0051B16C: lea eax, [ebp-44h]
  '0051B16F: push eax
  '0051B170: call [0040103Ch]
  '0051B176: mov edx, eax
  '0051B178: lea ecx, [ebp-20h]
  '0051B17B: call [00401378h]
  '0051B181: push eax
  '0051B182: push 00000001h
  '0051B184: push 0041E878h
  '0051B189: call [00401234h]
  '0051B18F: add esp, 0000000Ch
  '0051B192: lea ecx, [ebp-20h]
  '0051B195: call [004013B4h]
  '0051B19B: lea ecx, [ebp-34h]
  '0051B19E: call [004013B8h]
  '0051B1A4: lea ecx, [ebp-44h]
  '0051B1A7: call [00401030h]
  '0051B1AD: push 00000001h
  '0051B1AF: call [00401168h]
  '0051B1B5: push 0041D108h
  '0051B1BA: push ebx
  '0051B1BB: call [0040137Ch]
  '0051B1C1: lea ecx, [ebp-18h]
  '0051B1C4: push eax
  '0051B1C5: push ecx
  '0051B1C6: call [004010E4h]
  '0051B1CC: mov edx, 0042A508h
  '0051B1D1: lea ecx, [ebp-20h]
  '0051B1D4: call edi
  '0051B1D6: mov edx, [esi]
  '0051B1D8: lea eax, [ebp-20h]
  '0051B1DB: push eax
  '0051B1DC: push esi
  '0051B1DD: call [edx+00000728h]
  '0051B1E3: jmp 51B200h
  '0051B1E5: mov edx, 0042A544h
  '0051B1EA: lea ecx, [ebp-20h]
  '0051B1ED: call [004012D8h]
  '0051B1F3: mov ecx, [esi]
  '0051B1F5: lea edx, [ebp-20h]
  '0051B1F8: push edx
  '0051B1F9: push esi
  '0051B1FA: call [ecx+00000728h]
  '0051B200: lea ecx, [ebp-20h]
  '0051B203: call [004013B4h]
  '0051B209: mov [ebp-04h], ebx
  '0051B20C: push 0051B258h
  '0051B211: jmp 51B245h
  '0051B213: lea eax, [ebp-30h]
  '0051B216: lea ecx, [ebp-2Ch]
  '0051B219: push eax
  '0051B21A: lea edx, [ebp-28h]
  '0051B21D: push ecx
  '0051B21E: lea eax, [ebp-24h]
  '0051B221: push edx
  '0051B222: lea ecx, [ebp-20h]
  '0051B225: push eax
  '0051B226: push ecx
  '0051B227: push 00000005h
  '0051B229: call [004012E8h]
  '0051B22F: add esp, 00000018h
  '0051B232: lea ecx, [ebp-34h]
  '0051B235: call [004013B8h]
  '0051B23B: lea ecx, [ebp-44h]
  '0051B23E: call [00401030h]
  '0051B244: ret 
End Sub
Private Sub txtKeyLog__51B380
  '0051B380: push ebp
  '0051B381: mov ebp, esp
  '0051B383: sub esp, 0000000Ch
  '0051B386: push 004081B6h
  '0051B38B: mov eax, fs:[00h]
  '0051B391: push eax
  '0051B392: mov fs:[00000000h], esp
  '0051B399: sub esp, 00000074h
  '0051B39C: push ebx
  '0051B39D: push esi
  '0051B39E: push edi
  '0051B39F: mov [ebp-0Ch], esp
  '0051B3A2: mov [ebp-08h], 00406BD8h
  '0051B3A9: mov esi, [ebp+08h]
  '0051B3AC: mov eax, esi
  '0051B3AE: and eax, 00000001h
  '0051B3B1: mov [ebp-04h], eax
  '0051B3B4: and esi, FFFFFFFEh
  '0051B3B7: push esi
  '0051B3B8: mov [ebp+08h], esi
  '0051B3BB: mov ecx, [esi]
  '0051B3BD: call [ecx+04h]
  '0051B3C0: mov edx, [esi]
  '0051B3C2: xor ebx, ebx
  '0051B3C4: push ebx
  '0051B3C5: push FFFFFDFBh
  '0051B3CA: push esi
  '0051B3CB: mov [ebp-18h], ebx
  '0051B3CE: mov [ebp-1Ch], ebx
  '0051B3D1: mov [ebp-20h], ebx
  '0051B3D4: mov [ebp-24h], ebx
  '0051B3D7: mov [ebp-28h], ebx
  '0051B3DA: mov [ebp-2Ch], ebx
  '0051B3DD: mov [ebp-3Ch], ebx
  '0051B3E0: mov [ebp-4Ch], ebx
  '0051B3E3: mov [ebp-70h], ebx
  '0051B3E6: mov [ebp-74h], ebx
  '0051B3E9: call [edx+00000318h]
  '0051B3EF: mov edi, [004010E4h]
  '0051B3F5: push eax
  '0051B3F6: lea eax, [ebp-28h]
  '0051B3F9: push eax
  '0051B3FA: call edi
  '0051B3FC: lea ecx, [ebp-3Ch]
  '0051B3FF: push eax
  '0051B400: push ecx
  '0051B401: call [004011E4h]
  '0051B407: add esp, 00000010h
  '0051B40A: lea edx, [ebp-3Ch]
  '0051B40D: push ebx
  '0051B40E: push FFFFFFFFh
  '0051B410: push 00000001h
  '0051B412: push 0041F414h
  '0051B417: push 004248A8h
  '0051B41C: push edx
  '0051B41D: call [0040103Ch]
  '0051B423: mov ebx, [00401378h]
  '0051B429: mov edx, eax
  '0051B42B: lea ecx, [ebp-18h]
  '0051B42E: call ebx
  '0051B430: push eax
  '0051B431: call [00401230h]
  '0051B437: sub esp, 00000010h
  '0051B43A: mov ecx, 00000008h
  '0051B43F: mov edx, esp
  '0051B441: mov [ebp-4Ch], ecx
  '0051B444: mov [ebp-44h], eax
  '0051B447: push FFFFFDFBh
  '0051B44C: mov [edx], ecx
  '0051B44E: mov ecx, [ebp-48h]
  '0051B451: push esi
  '0051B452: mov [edx+04h], ecx
  '0051B455: mov ecx, [esi]
  '0051B457: mov [edx+08h], eax
  '0051B45A: mov eax, [ebp-40h]
  '0051B45D: mov [edx+0Ch], eax
  '0051B460: call [ecx+00000318h]
  '0051B466: lea edx, [ebp-2Ch]
  '0051B469: push eax
  '0051B46A: push edx
  '0051B46B: call edi
  '0051B46D: push eax
  '0051B46E: call [0040139Ch]
  '0051B474: lea ecx, [ebp-18h]
  '0051B477: call [004013B4h]
  '0051B47D: lea eax, [ebp-2Ch]
  '0051B480: lea ecx, [ebp-28h]
  '0051B483: push eax
  '0051B484: push ecx
  '0051B485: push 00000002h
  '0051B487: call [00401064h]
  '0051B48D: lea edx, [ebp-4Ch]
  '0051B490: lea eax, [ebp-3Ch]
  '0051B493: push edx
  '0051B494: push eax
  '0051B495: push 00000002h
  '0051B497: call [00401050h]
  '0051B49D: mov ecx, [esi]
  '0051B49F: add esp, 00000018h
  '0051B4A2: push esi
  '0051B4A3: call [ecx+00000304h]
  '0051B4A9: lea edx, [ebp-28h]
  '0051B4AC: push eax
  '0051B4AD: push edx
  '0051B4AE: call edi
  '0051B4B0: mov ecx, [eax]
  '0051B4B2: lea edx, [ebp-70h]
  '0051B4B5: push edx
  '0051B4B6: push eax
  '0051B4B7: mov [ebp-78h], eax
  '0051B4BA: call [ecx+000000E0h]
  '0051B4C0: test eax, eax
  '0051B4C2: fclex 
  '0051B4C4: jnl 51B4DBh
  '0051B4C6: mov ecx, [ebp-78h]
  '0051B4C9: push 000000E0h
  '0051B4CE: push 0041E108h
  '0051B4D3: push ecx
  '0051B4D4: push eax
  '0051B4D5: call [004010A0h]
  '0051B4DB: xor edx, edx
  '0051B4DD: cmp word ptr [ebp-70h], 0001h
  '0051B4E2: lea ecx, [ebp-28h]
  '0051B4E5: setz dl
  '0051B4E8: neg edx
  '0051B4EA: mov [ebp-80h], edx
  '0051B4ED: call [004013B8h]
  '0051B4F3: cmp word ptr [ebp-80h], 0000h
  '0051B4F8: jz 0051B5B4h
  '0051B4FE: mov eax, [esi]
  '0051B500: push 00000000h
  '0051B502: push FFFFFDFBh
  '0051B507: push esi
  '0051B508: call [eax+00000318h]
  '0051B50E: lea ecx, [ebp-28h]
  '0051B511: push eax
  '0051B512: push ecx
  '0051B513: call edi
  '0051B515: lea edx, [ebp-3Ch]
  '0051B518: push eax
  '0051B519: push edx
  '0051B51A: call [004011E4h]
  '0051B520: add esp, 00000010h
  '0051B523: lea eax, [ebp-3Ch]
  '0051B526: push 00000000h
  '0051B528: push FFFFFFFFh
  '0051B52A: push 00000001h
  '0051B52C: push 0041F414h
  '0051B531: push 0042A5CCh
  '0051B536: push eax
  '0051B537: call [0040103Ch]
  '0051B53D: mov edx, eax
  '0051B53F: lea ecx, [ebp-18h]
  '0051B542: call ebx
  '0051B544: push eax
  '0051B545: call [00401230h]
  '0051B54B: sub esp, 00000010h
  '0051B54E: mov ecx, 00000008h
  '0051B553: mov edx, esp
  '0051B555: mov [ebp-4Ch], ecx
  '0051B558: mov [ebp-44h], eax
  '0051B55B: push FFFFFDFBh
  '0051B560: mov [edx], ecx
  '0051B562: mov ecx, [ebp-48h]
  '0051B565: push esi
  '0051B566: mov [edx+04h], ecx
  '0051B569: mov ecx, [esi]
  '0051B56B: mov [edx+08h], eax
  '0051B56E: mov eax, [ebp-40h]
  '0051B571: mov [edx+0Ch], eax
  '0051B574: call [ecx+00000318h]
  '0051B57A: lea edx, [ebp-2Ch]
  '0051B57D: push eax
  '0051B57E: push edx
  '0051B57F: call edi
  '0051B581: push eax
  '0051B582: call [0040139Ch]
  '0051B588: lea ecx, [ebp-18h]
  '0051B58B: call [004013B4h]
  '0051B591: lea eax, [ebp-2Ch]
  '0051B594: lea ecx, [ebp-28h]
  '0051B597: push eax
  '0051B598: push ecx
  '0051B599: push 00000002h
  '0051B59B: call [00401064h]
  '0051B5A1: lea edx, [ebp-4Ch]
  '0051B5A4: lea eax, [ebp-3Ch]
  '0051B5A7: push edx
  '0051B5A8: push eax
  '0051B5A9: push 00000002h
  '0051B5AB: call [00401050h]
  '0051B5B1: add esp, 00000018h
  '0051B5B4: mov ecx, [esi]
  '0051B5B6: push esi
  '0051B5B7: call [ecx+00000300h]
  '0051B5BD: lea edx, [ebp-28h]
  '0051B5C0: push eax
  '0051B5C1: push edx
  '0051B5C2: call edi
  '0051B5C4: mov ecx, [eax]
  '0051B5C6: lea edx, [ebp-70h]
  '0051B5C9: push edx
  '0051B5CA: push eax
  '0051B5CB: mov [ebp-78h], eax
  '0051B5CE: call [ecx+000000E0h]
  '0051B5D4: test eax, eax
  '0051B5D6: fclex 
  '0051B5D8: jnl 51B5EFh
  '0051B5DA: mov ecx, [ebp-78h]
  '0051B5DD: push 000000E0h
  '0051B5E2: push 0041E108h
  '0051B5E7: push ecx
  '0051B5E8: push eax
  '0051B5E9: call [004010A0h]
  '0051B5EF: xor edx, edx
  '0051B5F1: cmp word ptr [ebp-70h], 0001h
  '0051B5F6: lea ecx, [ebp-28h]
  '0051B5F9: setz dl
  '0051B5FC: neg edx
  '0051B5FE: mov [ebp-80h], edx
  '0051B601: call [004013B8h]
  '0051B607: cmp word ptr [ebp-80h], 0000h
  '0051B60C: jz 51B619h
  '0051B60E: mov eax, [esi]
  '0051B610: push esi
  '0051B611: call [eax+00000730h]
  '0051B617: jmp 51B632h
  '0051B619: mov ecx, [esi+3Ch]
  '0051B61C: mov edx, [esi]
  '0051B61E: lea eax, [ebp-74h]
  '0051B621: mov [ebp-74h], ecx
  '0051B624: push eax
  '0051B625: push esi
  '0051B626: call [edx+0000072Ch]
  '0051B62C: call [00401104h]
  '0051B632: mov ecx, [esi]
  '0051B634: push 0042A5E0h
  '0051B639: push 00000000h
  '0051B63B: push 00000000h
  '0051B63D: push esi
  '0051B63E: call [ecx+00000318h]
  '0051B644: lea edx, [ebp-28h]
  '0051B647: push eax
  '0051B648: push edx
  '0051B649: call edi
  '0051B64B: push eax
  '0051B64C: lea eax, [ebp-3Ch]
  '0051B64F: push eax
  '0051B650: call [004011E4h]
  '0051B656: add esp, 00000010h
  '0051B659: push eax
  '0051B65A: call [0040103Ch]
  '0051B660: mov edx, eax
  '0051B662: lea ecx, [ebp-18h]
  '0051B665: call ebx
  '0051B667: push eax
  '0051B668: call [00401044h]
  '0051B66E: sub eax, [esi+3Ch]
  '0051B671: jo 0051B85Ah
  '0051B677: push eax
  '0051B678: call [00401024h]
  '0051B67E: mov edx, eax
  '0051B680: lea ecx, [ebp-1Ch]
  '0051B683: call ebx
  '0051B685: push eax
  '0051B686: call [0040108Ch]
  '0051B68C: mov edx, eax
  '0051B68E: lea ecx, [ebp-20h]
  '0051B691: call ebx
  '0051B693: push eax
  '0051B694: push 0042A604h
  '0051B699: call [0040108Ch]
  '0051B69F: mov edx, eax
  '0051B6A1: lea ecx, [ebp-24h]
  '0051B6A4: call ebx
  '0051B6A6: mov ecx, [esi]
  '0051B6A8: lea edx, [ebp-24h]
  '0051B6AB: push edx
  '0051B6AC: push esi
  '0051B6AD: call [ecx+00000728h]
  '0051B6B3: lea eax, [ebp-24h]
  '0051B6B6: lea ecx, [ebp-20h]
  '0051B6B9: push eax
  '0051B6BA: lea edx, [ebp-1Ch]
  '0051B6BD: push ecx
  '0051B6BE: lea eax, [ebp-18h]
  '0051B6C1: push edx
  '0051B6C2: push eax
  '0051B6C3: push 00000004h
  '0051B6C5: call [004012E8h]
  '0051B6CB: add esp, 00000014h
  '0051B6CE: lea ecx, [ebp-28h]
  '0051B6D1: call [004013B8h]
  '0051B6D7: lea ecx, [ebp-3Ch]
  '0051B6DA: call [00401030h]
  '0051B6E0: mov ecx, [esi]
  '0051B6E2: push 00000000h
  '0051B6E4: push 00000000h
  '0051B6E6: push esi
  '0051B6E7: call [ecx+00000318h]
  '0051B6ED: lea edx, [ebp-28h]
  '0051B6F0: push eax
  '0051B6F1: push edx
  '0051B6F2: call edi
  '0051B6F4: push eax
  '0051B6F5: lea eax, [ebp-3Ch]
  '0051B6F8: push eax
  '0051B6F9: call [004011E4h]
  '0051B6FF: add esp, 00000010h
  '0051B702: push eax
  '0051B703: call [0040103Ch]
  '0051B709: mov edx, eax
  '0051B70B: lea ecx, [ebp-18h]
  '0051B70E: call ebx
  '0051B710: push eax
  '0051B711: call [00401044h]
  '0051B717: sub esp, 00000010h
  '0051B71A: mov ecx, 00000003h
  '0051B71F: mov edx, esp
  '0051B721: push 00000008h
  '0051B723: push esi
  '0051B724: mov [edx], ecx
  '0051B726: mov ecx, [ebp-58h]
  '0051B729: mov [edx+04h], ecx
  '0051B72C: mov ecx, [esi]
  '0051B72E: mov [edx+08h], eax
  '0051B731: mov eax, [ebp-50h]
  '0051B734: mov [edx+0Ch], eax
  '0051B737: call [ecx+00000318h]
  '0051B73D: lea edx, [ebp-2Ch]
  '0051B740: push eax
  '0051B741: push edx
  '0051B742: call edi
  '0051B744: push eax
  '0051B745: call [0040139Ch]
  '0051B74B: lea ecx, [ebp-18h]
  '0051B74E: call [004013B4h]
  '0051B754: lea eax, [ebp-2Ch]
  '0051B757: lea ecx, [ebp-28h]
  '0051B75A: push eax
  '0051B75B: push ecx
  '0051B75C: push 00000002h
  '0051B75E: call [00401064h]
  '0051B764: add esp, 0000000Ch
  '0051B767: lea ecx, [ebp-3Ch]
  '0051B76A: call [00401030h]
  '0051B770: mov edx, [esi]
  '0051B772: push 00000000h
  '0051B774: push FFFFFDFBh
  '0051B779: push esi
  '0051B77A: call [edx+00000318h]
  '0051B780: push eax
  '0051B781: lea eax, [ebp-28h]
  '0051B784: push eax
  '0051B785: call edi
  '0051B787: lea ecx, [ebp-3Ch]
  '0051B78A: push eax
  '0051B78B: push ecx
  '0051B78C: call [004011E4h]
  '0051B792: add esp, 00000010h
  '0051B795: push eax
  '0051B796: call [0040103Ch]
  '0051B79C: mov edx, eax
  '0051B79E: lea ecx, [ebp-18h]
  '0051B7A1: call ebx
  '0051B7A3: push eax
  '0051B7A4: call [00401044h]
  '0051B7AA: lea ecx, [ebp-18h]
  '0051B7AD: mov [esi+3Ch], eax
  '0051B7B0: call [004013B4h]
  '0051B7B6: mov ebx, [004013B8h]
  '0051B7BC: lea ecx, [ebp-28h]
  '0051B7BF: call ebx
  '0051B7C1: lea ecx, [ebp-3Ch]
  '0051B7C4: call [00401030h]
  '0051B7CA: mov edx, [esi]
  '0051B7CC: push 00000000h
  '0051B7CE: push FFFFFDDAh
  '0051B7D3: push esi
  '0051B7D4: call [edx+00000318h]
  '0051B7DA: push eax
  '0051B7DB: lea eax, [ebp-28h]
  '0051B7DE: push eax
  '0051B7DF: call edi
  '0051B7E1: push eax
  '0051B7E2: call [00401040h]
  '0051B7E8: add esp, 0000000Ch
  '0051B7EB: lea ecx, [ebp-28h]
  '0051B7EE: call ebx
  '0051B7F0: mov [ebp-04h], 00000000h
  '0051B7F7: push 0051B83Bh
  '0051B7FC: jmp 51B83Ah
  '0051B7FE: lea ecx, [ebp-24h]
  '0051B801: lea edx, [ebp-20h]
  '0051B804: push ecx
  '0051B805: lea eax, [ebp-1Ch]
  '0051B808: push edx
  '0051B809: lea ecx, [ebp-18h]
  '0051B80C: push eax
  '0051B80D: push ecx
  '0051B80E: push 00000004h
  '0051B810: call [004012E8h]
  '0051B816: lea edx, [ebp-2Ch]
  '0051B819: lea eax, [ebp-28h]
  '0051B81C: push edx
  '0051B81D: push eax
  '0051B81E: push 00000002h
  '0051B820: call [00401064h]
  '0051B826: lea ecx, [ebp-4Ch]
  '0051B829: lea edx, [ebp-3Ch]
  '0051B82C: push ecx
  '0051B82D: push edx
  '0051B82E: push 00000002h
  '0051B830: call [00401050h]
  '0051B836: add esp, 0000002Ch
  '0051B839: ret 
End Sub
Private Sub chkEnter__519F60
  '00519F60: push ebp
  '00519F61: mov ebp, esp
  '00519F63: sub esp, 00000018h
  '00519F66: push 004081B6h
  '00519F6B: mov eax, fs:[00h]
  '00519F71: push eax
  '00519F72: mov fs:[00000000h], esp
  '00519F79: mov eax, 0000002Ch
  '00519F7E: call 004081B0h
  '00519F83: push ebx
  '00519F84: push esi
  '00519F85: push edi
  '00519F86: mov [ebp-18h], esp
  '00519F89: mov [ebp-14h], 00406AA0h
  '00519F90: mov eax, [ebp+08h]
  '00519F93: and eax, 00000001h
  '00519F96: mov [ebp-10h], eax
  '00519F99: mov ecx, [ebp+08h]
  '00519F9C: and ecx, FFFFFFFEh
  '00519F9F: mov [ebp+08h], ecx
  '00519FA2: mov [ebp-0Ch], 00000000h
  '00519FA9: mov edx, [ebp+08h]
  '00519FAC: mov eax, [edx]
  '00519FAE: mov ecx, [ebp+08h]
  '00519FB1: push ecx
  '00519FB2: call [eax+04h]
  '00519FB5: mov [ebp-04h], 00000001h
  '00519FBC: mov [ebp-04h], 00000002h
  '00519FC3: push FFFFFFFFh
  '00519FC5: call [004010E8h]
  '00519FCB: mov [ebp-04h], 00000003h
  '00519FD2: mov edx, [ebp+08h]
  '00519FD5: mov eax, [edx]
  '00519FD7: mov ecx, [ebp+08h]
  '00519FDA: push ecx
  '00519FDB: call [eax+00000304h]
  '00519FE1: push eax
  '00519FE2: lea edx, [ebp-28h]
  '00519FE5: push edx
  '00519FE6: call [004010E4h]
  '00519FEC: mov [ebp-30h], eax
  '00519FEF: lea eax, [ebp-2Ch]
  '00519FF2: push eax
  '00519FF3: mov ecx, [ebp-30h]
  '00519FF6: mov edx, [ecx]
  '00519FF8: mov eax, [ebp-30h]
  '00519FFB: push eax
  '00519FFC: call [edx+000000E0h]
  '0051A002: fclex 
  '0051A004: mov [ebp-34h], eax
  '0051A007: cmp [ebp-34h], 00000000h
  '0051A00B: jnl 51A02Ah
  '0051A00D: push 000000E0h
  '0051A012: push 0041E108h
  '0051A017: mov ecx, [ebp-30h]
  '0051A01A: push ecx
  '0051A01B: mov edx, [ebp-34h]
  '0051A01E: push edx
  '0051A01F: call [004010A0h]
  '0051A025: mov [ebp-4Ch], eax
  '0051A028: jmp 51A031h
  '0051A02A: mov [ebp-4Ch], 00000000h
  '0051A031: mov ax, [ebp-2Ch]
  '0051A035: push eax
  '0051A036: call [0040100Ch]
  '0051A03C: mov edx, eax
  '0051A03E: lea ecx, [ebp-24h]
  '0051A041: call [00401378h]
  '0051A047: push eax
  '0051A048: push 0042A43Ch
  '0051A04D: push 0041EA6Ch
  '0051A052: push 0041EA58h
  '0051A057: call [00401010h]
  '0051A05D: lea ecx, [ebp-24h]
  '0051A060: call [004013B4h]
  '0051A066: lea ecx, [ebp-28h]
  '0051A069: call [004013B8h]
  '0051A06F: mov [ebp-10h], 00000000h
  '0051A076: push 0051A091h
  '0051A07B: jmp 51A090h
  '0051A07D: lea ecx, [ebp-24h]
  '0051A080: call [004013B4h]
  '0051A086: lea ecx, [ebp-28h]
  '0051A089: call [004013B8h]
  '0051A08F: ret 
End Sub
Private Sub Form__51A0C0
  '0051A0C0: push ebp
  '0051A0C1: mov ebp, esp
  '0051A0C3: sub esp, 00000018h
  '0051A0C6: push 004081B6h
  '0051A0CB: mov eax, fs:[00h]
  '0051A0D1: push eax
  '0051A0D2: mov fs:[00000000h], esp
  '0051A0D9: mov eax, 0000007Ch
  '0051A0DE: call 004081B0h
  '0051A0E3: push ebx
  '0051A0E4: push esi
  '0051A0E5: push edi
  '0051A0E6: mov [ebp-18h], esp
  '0051A0E9: mov [ebp-14h], 00406AD0h
  '0051A0F0: mov eax, [ebp+08h]
  '0051A0F3: and eax, 00000001h
  '0051A0F6: mov [ebp-10h], eax
  '0051A0F9: mov ecx, [ebp+08h]
  '0051A0FC: and ecx, FFFFFFFEh
  '0051A0FF: mov [ebp+08h], ecx
  '0051A102: mov [ebp-0Ch], 00000000h
  '0051A109: mov edx, [ebp+08h]
  '0051A10C: mov eax, [edx]
  '0051A10E: mov ecx, [ebp+08h]
  '0051A111: push ecx
  '0051A112: call [eax+04h]
  '0051A115: mov [ebp-04h], 00000001h
  '0051A11C: mov [ebp-04h], 00000002h
  '0051A123: push FFFFFFFFh
  '0051A125: call [004010E8h]
  '0051A12B: mov [ebp-04h], 00000003h
  '0051A132: lea edx, [ebp-38h]
  '0051A135: push edx
  '0051A136: mov eax, [ebp+08h]
  '0051A139: mov ecx, [eax]
  '0051A13B: mov edx, [ebp+08h]
  '0051A13E: push edx
  '0051A13F: call [ecx+00000218h]
  '0051A145: fclex 
  '0051A147: mov [ebp-60h], eax
  '0051A14A: cmp [ebp-60h], 00000000h
  '0051A14E: jnl 51A170h
  '0051A150: push 00000218h
  '0051A155: push 00421D9Ch
  '0051A15A: mov eax, [ebp+08h]
  '0051A15D: push eax
  '0051A15E: mov ecx, [ebp-60h]
  '0051A161: push ecx
  '0051A162: call [004010A0h]
  '0051A168: mov [ebp-0000008Ch], eax
  '0051A16E: jmp 51A17Ah
  '0051A170: mov [ebp-0000008Ch], 00000000h
  '0051A17A: mov edx, [ebp-38h]
  '0051A17D: mov [ebp-00000088h], edx
  '0051A183: mov [ebp-38h], 00000000h
  '0051A18A: mov eax, [ebp-00000088h]
  '0051A190: push eax
  '0051A191: lea ecx, [ebp-68h]
  '0051A194: push ecx
  '0051A195: call [004010E4h]
  '0051A19B: push eax
  '0051A19C: lea edx, [ebp-24h]
  '0051A19F: push edx
  '0051A1A0: lea eax, [ebp-6Ch]
  '0051A1A3: push eax
  '0051A1A4: push 0041F304h
  '0051A1A9: call [004010CCh]
  '0051A1AF: mov [ebp-00000084h], eax
  '0051A1B5: jmp 0051A2ADh
  '0051A1BA: mov [ebp-04h], 00000004h
  '0051A1C1: push 00420F60h
  '0051A1C6: mov ecx, [ebp-24h]
  '0051A1C9: push ecx
  '0051A1CA: call [00401278h]
  '0051A1D0: movsx esi, ax
  '0051A1D3: neg esi
  '0051A1D5: sbb esi, esi
  '0051A1D7: inc esi
  '0051A1D8: push 0042A454h
  '0051A1DD: mov edx, [ebp-24h]
  '0051A1E0: push edx
  '0051A1E1: call [00401278h]
  '0051A1E7: movsx eax, ax
  '0051A1EA: neg eax
  '0051A1EC: sbb eax, eax
  '0051A1EE: inc eax
  '0051A1EF: and esi, eax
  '0051A1F1: neg esi
  '0051A1F3: sbb esi, esi
  '0051A1F5: neg esi
  '0051A1F7: push 0041E3FCh
  '0051A1FC: mov ecx, [ebp-24h]
  '0051A1FF: push ecx
  '0051A200: call [00401278h]
  '0051A206: movsx edx, ax
  '0051A209: neg edx
  '0051A20B: sbb edx, edx
  '0051A20D: inc edx
  '0051A20E: and esi, edx
  '0051A210: neg esi
  '0051A212: sbb esi, esi
  '0051A214: neg esi
  '0051A216: push 0041FB8Ch
  '0051A21B: mov eax, [ebp-24h]
  '0051A21E: push eax
  '0051A21F: call [00401278h]
  '0051A225: movsx ecx, ax
  '0051A228: neg ecx
  '0051A22A: sbb ecx, ecx
  '0051A22C: inc ecx
  '0051A22D: and esi, ecx
  '0051A22F: neg esi
  '0051A231: sbb esi, esi
  '0051A233: neg esi
  '0051A235: push 0041CE08h
  '0051A23A: mov edx, [ebp-24h]
  '0051A23D: push edx
  '0051A23E: call [00401278h]
  '0051A244: movsx eax, ax
  '0051A247: neg eax
  '0051A249: sbb eax, eax
  '0051A24B: inc eax
  '0051A24C: and esi, eax
  '0051A24E: test esi, esi
  '0051A250: jnz 51A28Dh
  '0051A252: mov [ebp-04h], 00000005h
  '0051A259: push 00000000h
  '0051A25B: push 00420F70h
  '0051A260: mov ecx, [ebp-24h]
  '0051A263: push ecx
  '0051A264: lea edx, [ebp-48h]
  '0051A267: push edx
  '0051A268: call [00401368h]
  '0051A26E: add esp, 00000010h
  '0051A271: push eax
  '0051A272: call [0040130Ch]
  '0051A278: mov [ebp-5Ch], eax
  '0051A27B: lea eax, [ebp-5Ch]
  '0051A27E: push eax
  '0051A27F: call 004EB0B0h
  '0051A284: lea ecx, [ebp-48h]
  '0051A287: call [00401030h]
  '0051A28D: mov [ebp-04h], 00000007h
  '0051A294: lea ecx, [ebp-24h]
  '0051A297: push ecx
  '0051A298: lea edx, [ebp-6Ch]
  '0051A29B: push edx
  '0051A29C: push 0041F304h
  '0051A2A1: call [00401150h]
  '0051A2A7: mov [ebp-00000084h], eax
  '0051A2AD: cmp [ebp-00000084h], 00000000h
  '0051A2B4: jnz 0051A1BAh
  '0051A2BA: mov [ebp-04h], 00000008h
  '0051A2C1: mov [ebp-50h], 80020004h
  '0051A2C8: mov [ebp-58h], 0000000Ah
  '0051A2CF: mov eax, 00000010h
  '0051A2D4: call 004081B0h
  '0051A2D9: mov eax, esp
  '0051A2DB: mov ecx, [ebp-58h]
  '0051A2DE: mov [eax], ecx
  '0051A2E0: mov edx, [ebp-54h]
  '0051A2E3: mov [eax+04h], edx
  '0051A2E6: mov ecx, [ebp-50h]
  '0051A2E9: mov [eax+08h], ecx
  '0051A2EC: mov edx, [ebp-4Ch]
  '0051A2EF: mov [eax+0Ch], edx
  '0051A2F2: push 0042A468h
  '0051A2F7: push 0041EA6Ch
  '0051A2FC: push 0041EA58h
  '0051A301: call [00401314h]
  '0051A307: mov edx, eax
  '0051A309: lea ecx, [ebp-28h]
  '0051A30C: call [00401378h]
  '0051A312: mov [ebp-04h], 00000009h
  '0051A319: mov eax, [ebp-28h]
  '0051A31C: push eax
  '0051A31D: call [00401044h]
  '0051A323: test eax, eax
  '0051A325: jle 51A380h
  '0051A327: mov [ebp-04h], 0000000Ah
  '0051A32E: mov ecx, [ebp-28h]
  '0051A331: push ecx
  '0051A332: call [0040119Ch]
  '0051A338: push ecx
  '0051A339: fstp real4 ptr [esp]
  '0051A33C: mov edx, [ebp+08h]
  '0051A33F: mov eax, [edx]
  '0051A341: mov ecx, [ebp+08h]
  '0051A344: push ecx
  '0051A345: call [eax+00000084h]
  '0051A34B: fclex 
  '0051A34D: mov [ebp-60h], eax
  '0051A350: cmp [ebp-60h], 00000000h
  '0051A354: jnl 51A376h
  '0051A356: push 00000084h
  '0051A35B: push 00421D9Ch
  '0051A360: mov edx, [ebp+08h]
  '0051A363: push edx
  '0051A364: mov eax, [ebp-60h]
  '0051A367: push eax
  '0051A368: call [004010A0h]
  '0051A36E: mov [ebp-00000090h], eax
  '0051A374: jmp 51A380h
  '0051A376: mov [ebp-00000090h], 00000000h
  '0051A380: mov [ebp-04h], 0000000Ch
  '0051A387: mov [ebp-50h], 80020004h
  '0051A38E: mov [ebp-58h], 0000000Ah
  '0051A395: mov eax, 00000010h
  '0051A39A: call 004081B0h
  '0051A39F: mov ecx, esp
  '0051A3A1: mov edx, [ebp-58h]
  '0051A3A4: mov [ecx], edx
  '0051A3A6: mov eax, [ebp-54h]
  '0051A3A9: mov [ecx+04h], eax
  '0051A3AC: mov edx, [ebp-50h]
  '0051A3AF: mov [ecx+08h], edx
  '0051A3B2: mov eax, [ebp-4Ch]
  '0051A3B5: mov [ecx+0Ch], eax
  '0051A3B8: push 0042A480h
  '0051A3BD: push 0041EA6Ch
  '0051A3C2: push 0041EA58h
  '0051A3C7: call [00401314h]
  '0051A3CD: mov edx, eax
  '0051A3CF: lea ecx, [ebp-28h]
  '0051A3D2: call [00401378h]
  '0051A3D8: mov [ebp-04h], 0000000Dh
  '0051A3DF: mov ecx, [ebp-28h]
  '0051A3E2: push ecx
  '0051A3E3: call [00401044h]
  '0051A3E9: test eax, eax
  '0051A3EB: jle 51A446h
  '0051A3ED: mov [ebp-04h], 0000000Eh
  '0051A3F4: mov edx, [ebp-28h]
  '0051A3F7: push edx
  '0051A3F8: call [0040119Ch]
  '0051A3FE: push ecx
  '0051A3FF: fstp real4 ptr [esp]
  '0051A402: mov eax, [ebp+08h]
  '0051A405: mov ecx, [eax]
  '0051A407: mov edx, [ebp+08h]
  '0051A40A: push edx
  '0051A40B: call [ecx+0000008Ch]
  '0051A411: fclex 
  '0051A413: mov [ebp-60h], eax
  '0051A416: cmp [ebp-60h], 00000000h
  '0051A41A: jnl 51A43Ch
  '0051A41C: push 0000008Ch
  '0051A421: push 00421D9Ch
  '0051A426: mov eax, [ebp+08h]
  '0051A429: push eax
  '0051A42A: mov ecx, [ebp-60h]
  '0051A42D: push ecx
  '0051A42E: call [004010A0h]
  '0051A434: mov [ebp-00000094h], eax
  '0051A43A: jmp 51A446h
  '0051A43C: mov [ebp-00000094h], 00000000h
  '0051A446: mov [ebp-04h], 00000010h
  '0051A44D: mov edx, [ebp+08h]
  '0051A450: mov eax, [edx]
  '0051A452: mov ecx, [ebp+08h]
  '0051A455: push ecx
  '0051A456: call [eax+00000304h]
  '0051A45C: push eax
  '0051A45D: lea edx, [ebp-38h]
  '0051A460: push edx
  '0051A461: call [004010E4h]
  '0051A467: mov [ebp-60h], eax
  '0051A46A: mov [ebp-50h], 80020004h
  '0051A471: mov [ebp-58h], 0000000Ah
  '0051A478: mov eax, 00000010h
  '0051A47D: call 004081B0h
  '0051A482: mov eax, esp
  '0051A484: mov ecx, [ebp-58h]
  '0051A487: mov [eax], ecx
  '0051A489: mov edx, [ebp-54h]
  '0051A48C: mov [eax+04h], edx
  '0051A48F: mov ecx, [ebp-50h]
  '0051A492: mov [eax+08h], ecx
  '0051A495: mov edx, [ebp-4Ch]
  '0051A498: mov [eax+0Ch], edx
  '0051A49B: push 0042A43Ch
  '0051A4A0: push 0041EA6Ch
  '0051A4A5: push 0041EA58h
  '0051A4AA: call [00401314h]
  '0051A4B0: mov edx, eax
  '0051A4B2: lea ecx, [ebp-34h]
  '0051A4B5: call [00401378h]
  '0051A4BB: push eax
  '0051A4BC: call [00401250h]
  '0051A4C2: push eax
  '0051A4C3: mov eax, [ebp-60h]
  '0051A4C6: mov ecx, [eax]
  '0051A4C8: mov edx, [ebp-60h]
  '0051A4CB: push edx
  '0051A4CC: call [ecx+000000E4h]
  '0051A4D2: fclex 
  '0051A4D4: mov [ebp-64h], eax
  '0051A4D7: cmp [ebp-64h], 00000000h
  '0051A4DB: jnl 51A4FDh
  '0051A4DD: push 000000E4h
  '0051A4E2: push 0041E108h
  '0051A4E7: mov eax, [ebp-60h]
  '0051A4EA: push eax
  '0051A4EB: mov ecx, [ebp-64h]
  '0051A4EE: push ecx
  '0051A4EF: call [004010A0h]
  '0051A4F5: mov [ebp-00000098h], eax
  '0051A4FB: jmp 51A507h
  '0051A4FD: mov [ebp-00000098h], 00000000h
  '0051A507: lea ecx, [ebp-34h]
  '0051A50A: call [004013B4h]
  '0051A510: lea ecx, [ebp-38h]
  '0051A513: call [004013B8h]
  '0051A519: mov [ebp-04h], 00000011h
  '0051A520: mov edx, [ebp+08h]
  '0051A523: mov eax, [edx]
  '0051A525: mov ecx, [ebp+08h]
  '0051A528: push ecx
  '0051A529: call [eax+00000300h]
  '0051A52F: push eax
  '0051A530: lea edx, [ebp-38h]
  '0051A533: push edx
  '0051A534: call [004010E4h]
  '0051A53A: mov [ebp-60h], eax
  '0051A53D: mov [ebp-50h], 80020004h
  '0051A544: mov [ebp-58h], 0000000Ah
  '0051A54B: mov eax, 00000010h
  '0051A550: call 004081B0h
  '0051A555: mov eax, esp
  '0051A557: mov ecx, [ebp-58h]
  '0051A55A: mov [eax], ecx
  '0051A55C: mov edx, [ebp-54h]
  '0051A55F: mov [eax+04h], edx
  '0051A562: mov ecx, [ebp-50h]
  '0051A565: mov [eax+08h], ecx
  '0051A568: mov edx, [ebp-4Ch]
  '0051A56B: mov [eax+0Ch], edx
  '0051A56E: push 0042A424h
  '0051A573: push 0041EA6Ch
  '0051A578: push 0041EA58h
  '0051A57D: call [00401314h]
  '0051A583: mov edx, eax
  '0051A585: lea ecx, [ebp-34h]
  '0051A588: call [00401378h]
  '0051A58E: push eax
  '0051A58F: call [00401250h]
  '0051A595: push eax
  '0051A596: mov eax, [ebp-60h]
  '0051A599: mov ecx, [eax]
  '0051A59B: mov edx, [ebp-60h]
  '0051A59E: push edx
  '0051A59F: call [ecx+000000E4h]
  '0051A5A5: fclex 
  '0051A5A7: mov [ebp-64h], eax
  '0051A5AA: cmp [ebp-64h], 00000000h
  '0051A5AE: jnl 51A5D0h
  '0051A5B0: push 000000E4h
  '0051A5B5: push 0041E108h
  '0051A5BA: mov eax, [ebp-60h]
  '0051A5BD: push eax
  '0051A5BE: mov ecx, [ebp-64h]
  '0051A5C1: push ecx
  '0051A5C2: call [004010A0h]
  '0051A5C8: mov [ebp-0000009Ch], eax
  '0051A5CE: jmp 51A5DAh
  '0051A5D0: mov [ebp-0000009Ch], 00000000h
  '0051A5DA: lea ecx, [ebp-34h]
  '0051A5DD: call [004013B4h]
  '0051A5E3: lea ecx, [ebp-38h]
  '0051A5E6: call [004013B8h]
  '0051A5EC: mov [ebp-04h], 00000012h
  '0051A5F3: mov edx, [ebp+08h]
  '0051A5F6: mov [edx+3Ch], 00000001h
  '0051A5FD: mov [ebp-04h], 00000013h
  '0051A604: call [00401104h]
  '0051A60A: mov [ebp-04h], 00000014h
  '0051A611: mov edx, 0042A498h
  '0051A616: lea ecx, [ebp-34h]
  '0051A619: call [004012D8h]
  '0051A61F: lea eax, [ebp-34h]
  '0051A622: push eax
  '0051A623: mov ecx, [ebp+08h]
  '0051A626: mov edx, [ecx]
  '0051A628: mov eax, [ebp+08h]
  '0051A62B: push eax
  '0051A62C: call [edx+00000728h]
  '0051A632: lea ecx, [ebp-34h]
  '0051A635: call [004013B4h]
  '0051A63B: mov [ebp-10h], 00000000h
  '0051A642: wait 
  '0051A643: push 0051A695h
  '0051A648: jmp 51A666h
  '0051A64A: lea ecx, [ebp-34h]
  '0051A64D: call [004013B4h]
  '0051A653: lea ecx, [ebp-38h]
  '0051A656: call [004013B8h]
  '0051A65C: lea ecx, [ebp-48h]
  '0051A65F: call [00401030h]
  '0051A665: ret 
End Sub
Private Sub Form__51A900
  '0051A900: push ebp
  '0051A901: mov ebp, esp
  '0051A903: sub esp, 00000018h
  '0051A906: push 004081B6h
  '0051A90B: mov eax, fs:[00h]
  '0051A911: push eax
  '0051A912: mov fs:[00000000h], esp
  '0051A919: mov eax, 000000D4h
  '0051A91E: call 004081B0h
  '0051A923: push ebx
  '0051A924: push esi
  '0051A925: push edi
  '0051A926: mov [ebp-18h], esp
  '0051A929: mov [ebp-14h], 00406B58h
  '0051A930: mov eax, [ebp+08h]
  '0051A933: and eax, 00000001h
  '0051A936: mov [ebp-10h], eax
  '0051A939: mov ecx, [ebp+08h]
  '0051A93C: and ecx, FFFFFFFEh
  '0051A93F: mov [ebp+08h], ecx
  '0051A942: mov [ebp-0Ch], 00000000h
  '0051A949: mov edx, [ebp+08h]
  '0051A94C: mov eax, [edx]
  '0051A94E: mov ecx, [ebp+08h]
  '0051A951: push ecx
  '0051A952: call [eax+04h]
  '0051A955: mov [ebp-04h], 00000001h
  '0051A95C: mov [ebp-04h], 00000002h
  '0051A963: push FFFFFFFFh
  '0051A965: call [004010E8h]
  '0051A96B: mov [ebp-04h], 00000003h
  '0051A972: lea edx, [ebp-000000A8h]
  '0051A978: push edx
  '0051A979: mov eax, [ebp+08h]
  '0051A97C: mov ecx, [eax]
  '0051A97E: mov edx, [ebp+08h]
  '0051A981: push edx
  '0051A982: call [ecx+00000088h]
  '0051A988: fclex 
  '0051A98A: mov [ebp-000000B0h], eax
  '0051A990: cmp [ebp-000000B0h], 00000000h
  '0051A997: jnl 51A9BCh
  '0051A999: push 00000088h
  '0051A99E: push 00421D9Ch
  '0051A9A3: mov eax, [ebp+08h]
  '0051A9A6: push eax
  '0051A9A7: mov ecx, [ebp-000000B0h]
  '0051A9AD: push ecx
  '0051A9AE: call [004010A0h]
  '0051A9B4: mov [ebp-000000D4h], eax
  '0051A9BA: jmp 51A9C6h
  '0051A9BC: mov [ebp-000000D4h], 00000000h
  '0051A9C6: fld real4 ptr [ebp-000000A8h]
  '0051A9CC: fcomp real4 ptr [004067C4h]
  '0051A9D2: fstsw ax
  '0051A9D4: test ah, 01h
  '0051A9D7: jz 51AA32h
  '0051A9D9: mov [ebp-04h], 00000004h
  '0051A9E0: push 44BB8000h
  '0051A9E5: mov edx, [ebp+08h]
  '0051A9E8: mov eax, [edx]
  '0051A9EA: mov ecx, [ebp+08h]
  '0051A9ED: push ecx
  '0051A9EE: call [eax+0000008Ch]
  '0051A9F4: fclex 
  '0051A9F6: mov [ebp-000000B0h], eax
  '0051A9FC: cmp [ebp-000000B0h], 00000000h
  '0051AA03: jnl 51AA28h
  '0051AA05: push 0000008Ch
  '0051AA0A: push 00421D9Ch
  '0051AA0F: mov edx, [ebp+08h]
  '0051AA12: push edx
  '0051AA13: mov eax, [ebp-000000B0h]
  '0051AA19: push eax
  '0051AA1A: call [004010A0h]
  '0051AA20: mov [ebp-000000D8h], eax
  '0051AA26: jmp 51AA32h
  '0051AA28: mov [ebp-000000D8h], 00000000h
  '0051AA32: mov [ebp-04h], 00000006h
  '0051AA39: lea ecx, [ebp-000000A8h]
  '0051AA3F: push ecx
  '0051AA40: mov edx, [ebp+08h]
  '0051AA43: mov eax, [edx]
  '0051AA45: mov ecx, [ebp+08h]
  '0051AA48: push ecx
  '0051AA49: call [eax+00000080h]
  '0051AA4F: fclex 
  '0051AA51: mov [ebp-000000B0h], eax
  '0051AA57: cmp [ebp-000000B0h], 00000000h
  '0051AA5E: jnl 51AA83h
  '0051AA60: push 00000080h
  '0051AA65: push 00421D9Ch
  '0051AA6A: mov edx, [ebp+08h]
  '0051AA6D: push edx
  '0051AA6E: mov eax, [ebp-000000B0h]
  '0051AA74: push eax
  '0051AA75: call [004010A0h]
  '0051AA7B: mov [ebp-000000DCh], eax
  '0051AA81: jmp 51AA8Dh
  '0051AA83: mov [ebp-000000DCh], 00000000h
  '0051AA8D: fld real4 ptr [ebp-000000A8h]
  '0051AA93: fcomp real4 ptr [004067C4h]
  '0051AA99: fstsw ax
  '0051AA9B: test ah, 01h
  '0051AA9E: jz 51AAF9h
  '0051AAA0: mov [ebp-04h], 00000007h
  '0051AAA7: push 44BB8000h
  '0051AAAC: mov ecx, [ebp+08h]
  '0051AAAF: mov edx, [ecx]
  '0051AAB1: mov eax, [ebp+08h]
  '0051AAB4: push eax
  '0051AAB5: call [edx+00000084h]
  '0051AABB: fclex 
  '0051AABD: mov [ebp-000000B0h], eax
  '0051AAC3: cmp [ebp-000000B0h], 00000000h
  '0051AACA: jnl 51AAEFh
  '0051AACC: push 00000084h
  '0051AAD1: push 00421D9Ch
  '0051AAD6: mov ecx, [ebp+08h]
  '0051AAD9: push ecx
  '0051AADA: mov edx, [ebp-000000B0h]
  '0051AAE0: push edx
  '0051AAE1: call [004010A0h]
  '0051AAE7: mov [ebp-000000E0h], eax
  '0051AAED: jmp 51AAF9h
  '0051AAEF: mov [ebp-000000E0h], 00000000h
  '0051AAF9: mov [ebp-04h], 00000009h
  '0051AB00: mov [ebp-2Ch], 00000000h
  '0051AB07: mov [ebp-34h], 00000004h
  '0051AB0E: mov [ebp-4Ch], 00000000h
  '0051AB15: mov [ebp-54h], 00000002h
  '0051AB1C: lea eax, [ebp-000000A8h]
  '0051AB22: push eax
  '0051AB23: mov ecx, [ebp+08h]
  '0051AB26: mov edx, [ecx]
  '0051AB28: mov eax, [ebp+08h]
  '0051AB2B: push eax
  '0051AB2C: call [edx+00000100h]
  '0051AB32: fclex 
  '0051AB34: mov [ebp-000000B0h], eax
  '0051AB3A: cmp [ebp-000000B0h], 00000000h
  '0051AB41: jnl 51AB66h
  '0051AB43: push 00000100h
  '0051AB48: push 00421D9Ch
  '0051AB4D: mov ecx, [ebp+08h]
  '0051AB50: push ecx
  '0051AB51: mov edx, [ebp-000000B0h]
  '0051AB57: push edx
  '0051AB58: call [004010A0h]
  '0051AB5E: mov [ebp-000000E4h], eax
  '0051AB64: jmp 51AB70h
  '0051AB66: mov [ebp-000000E4h], 00000000h
  '0051AB70: mov eax, [ebp-000000A8h]
  '0051AB76: mov [ebp-6Ch], eax
  '0051AB79: mov [ebp-74h], 00000004h
  '0051AB80: lea ecx, [ebp-000000ACh]
  '0051AB86: push ecx
  '0051AB87: mov edx, [ebp+08h]
  '0051AB8A: mov eax, [edx]
  '0051AB8C: mov ecx, [ebp+08h]
  '0051AB8F: push ecx
  '0051AB90: call [eax+00000108h]
  '0051AB96: fclex 
  '0051AB98: mov [ebp-000000B4h], eax
  '0051AB9E: cmp [ebp-000000B4h], 00000000h
  '0051ABA5: jnl 51ABCAh
  '0051ABA7: push 00000108h
  '0051ABAC: push 00421D9Ch
  '0051ABB1: mov edx, [ebp+08h]
  '0051ABB4: push edx
  '0051ABB5: mov eax, [ebp-000000B4h]
  '0051ABBB: push eax
  '0051ABBC: call [004010A0h]
  '0051ABC2: mov [ebp-000000E8h], eax
  '0051ABC8: jmp 51ABD4h
  '0051ABCA: mov [ebp-000000E8h], 00000000h
  '0051ABD4: fld real4 ptr [ebp-000000ACh]
  '0051ABDA: fsub real4 ptr [00406BA8h]
  '0051ABE0: fstp real4 ptr [ebp-0000008Ch]
  '0051ABE6: fstsw ax
  '0051ABE8: test al, 0Dh
  '0051ABEA: jnz 0051AED9h
  '0051ABF0: mov [ebp-00000094h], 00000004h
  '0051ABFA: mov eax, 00000010h
  '0051ABFF: call 004081B0h
  '0051AC04: mov ecx, esp
  '0051AC06: mov edx, [ebp-34h]
  '0051AC09: mov [ecx], edx
  '0051AC0B: mov eax, [ebp-30h]
  '0051AC0E: mov [ecx+04h], eax
  '0051AC11: mov edx, [ebp-2Ch]
  '0051AC14: mov [ecx+08h], edx
  '0051AC17: mov eax, [ebp-28h]
  '0051AC1A: mov [ecx+0Ch], eax
  '0051AC1D: mov eax, 00000010h
  '0051AC22: call 004081B0h
  '0051AC27: mov ecx, esp
  '0051AC29: mov edx, [ebp-54h]
  '0051AC2C: mov [ecx], edx
  '0051AC2E: mov eax, [ebp-50h]
  '0051AC31: mov [ecx+04h], eax
  '0051AC34: mov edx, [ebp-4Ch]
  '0051AC37: mov [ecx+08h], edx
  '0051AC3A: mov eax, [ebp-48h]
  '0051AC3D: mov [ecx+0Ch], eax
  '0051AC40: mov eax, 00000010h
  '0051AC45: call 004081B0h
  '0051AC4A: mov ecx, esp
  '0051AC4C: mov edx, [ebp-74h]
  '0051AC4F: mov [ecx], edx
  '0051AC51: mov eax, [ebp-70h]
  '0051AC54: mov [ecx+04h], eax
  '0051AC57: mov edx, [ebp-6Ch]
  '0051AC5A: mov [ecx+08h], edx
  '0051AC5D: mov eax, [ebp-68h]
  '0051AC60: mov [ecx+0Ch], eax
  '0051AC63: mov eax, 00000010h
  '0051AC68: call 004081B0h
  '0051AC6D: mov ecx, esp
  '0051AC6F: mov edx, [ebp-00000094h]
  '0051AC75: mov [ecx], edx
  '0051AC77: mov eax, [ebp-00000090h]
  '0051AC7D: mov [ecx+04h], eax
  '0051AC80: mov edx, [ebp-0000008Ch]
  '0051AC86: mov [ecx+08h], edx
  '0051AC89: mov eax, [ebp-00000088h]
  '0051AC8F: mov [ecx+0Ch], eax
  '0051AC92: push 00000004h
  '0051AC94: push 80011002h
  '0051AC99: mov ecx, [ebp+08h]
  '0051AC9C: mov edx, [ecx]
  '0051AC9E: mov eax, [ebp+08h]
  '0051ACA1: push eax
  '0051ACA2: call [edx+00000318h]
  '0051ACA8: push eax
  '0051ACA9: lea ecx, [ebp-24h]
  '0051ACAC: push ecx
  '0051ACAD: call [004010E4h]
  '0051ACB3: push eax
  '0051ACB4: call [00401040h]
  '0051ACBA: add esp, 0000004Ch
  '0051ACBD: lea ecx, [ebp-24h]
  '0051ACC0: call [004013B8h]
  '0051ACC6: mov [ebp-04h], 0000000Ah
  '0051ACCD: lea edx, [ebp-000000A8h]
  '0051ACD3: push edx
  '0051ACD4: mov eax, [ebp+08h]
  '0051ACD7: mov ecx, [eax]
  '0051ACD9: mov edx, [ebp+08h]
  '0051ACDC: push edx
  '0051ACDD: call [ecx+00000108h]
  '0051ACE3: fclex 
  '0051ACE5: mov [ebp-000000B0h], eax
  '0051ACEB: cmp [ebp-000000B0h], 00000000h
  '0051ACF2: jnl 51AD17h
  '0051ACF4: push 00000108h
  '0051ACF9: push 00421D9Ch
  '0051ACFE: mov eax, [ebp+08h]
  '0051AD01: push eax
  '0051AD02: mov ecx, [ebp-000000B0h]
  '0051AD08: push ecx
  '0051AD09: call [004010A0h]
  '0051AD0F: mov [ebp-000000ECh], eax
  '0051AD15: jmp 51AD21h
  '0051AD17: mov [ebp-000000ECh], 00000000h
  '0051AD21: lea edx, [ebp-000000ACh]
  '0051AD27: push edx
  '0051AD28: mov eax, [ebp+08h]
  '0051AD2B: mov ecx, [eax]
  '0051AD2D: mov edx, [ebp+08h]
  '0051AD30: push edx
  '0051AD31: call [ecx+00000100h]
  '0051AD37: fclex 
  '0051AD39: mov [ebp-000000B4h], eax
  '0051AD3F: cmp [ebp-000000B4h], 00000000h
  '0051AD46: jnl 51AD6Bh
  '0051AD48: push 00000100h
  '0051AD4D: push 00421D9Ch
  '0051AD52: mov eax, [ebp+08h]
  '0051AD55: push eax
  '0051AD56: mov ecx, [ebp-000000B4h]
  '0051AD5C: push ecx
  '0051AD5D: call [004010A0h]
  '0051AD63: mov [ebp-000000F0h], eax
  '0051AD69: jmp 51AD75h
  '0051AD6B: mov [ebp-000000F0h], 00000000h
  '0051AD75: mov edx, [ebp+08h]
  '0051AD78: mov eax, [edx]
  '0051AD7A: mov ecx, [ebp+08h]
  '0051AD7D: push ecx
  '0051AD7E: call [eax+000002FCh]
  '0051AD84: push eax
  '0051AD85: lea edx, [ebp-24h]
  '0051AD88: push edx
  '0051AD89: call [004010E4h]
  '0051AD8F: mov [ebp-000000B8h], eax
  '0051AD95: mov [ebp-4Ch], 80020004h
  '0051AD9C: mov [ebp-54h], 0000000Ah
  '0051ADA3: mov eax, [ebp-000000ACh]
  '0051ADA9: mov [ebp-3Ch], eax
  '0051ADAC: mov [ebp-44h], 00000004h
  '0051ADB3: fld real4 ptr [ebp-000000A8h]
  '0051ADB9: fsub real4 ptr [00406BA4h]
  '0051ADBF: fstp real4 ptr [ebp-2Ch]
  '0051ADC2: fstsw ax
  '0051ADC4: test al, 0Dh
  '0051ADC6: jnz 0051AED9h
  '0051ADCC: mov [ebp-34h], 00000004h
  '0051ADD3: mov eax, 00000010h
  '0051ADD8: call 004081B0h
  '0051ADDD: mov ecx, esp
  '0051ADDF: mov edx, [ebp-54h]
  '0051ADE2: mov [ecx], edx
  '0051ADE4: mov eax, [ebp-50h]
  '0051ADE7: mov [ecx+04h], eax
  '0051ADEA: mov edx, [ebp-4Ch]
  '0051ADED: mov [ecx+08h], edx
  '0051ADF0: mov eax, [ebp-48h]
  '0051ADF3: mov [ecx+0Ch], eax
  '0051ADF6: mov eax, 00000010h
  '0051ADFB: call 004081B0h
  '0051AE00: mov ecx, esp
  '0051AE02: mov edx, [ebp-44h]
  '0051AE05: mov [ecx], edx
  '0051AE07: mov eax, [ebp-40h]
  '0051AE0A: mov [ecx+04h], eax
  '0051AE0D: mov edx, [ebp-3Ch]
  '0051AE10: mov [ecx+08h], edx
  '0051AE13: mov eax, [ebp-38h]
  '0051AE16: mov [ecx+0Ch], eax
  '0051AE19: mov eax, 00000010h
  '0051AE1E: call 004081B0h
  '0051AE23: mov ecx, esp
  '0051AE25: mov edx, [ebp-34h]
  '0051AE28: mov [ecx], edx
  '0051AE2A: mov eax, [ebp-30h]
  '0051AE2D: mov [ecx+04h], eax
  '0051AE30: mov edx, [ebp-2Ch]
  '0051AE33: mov [ecx+08h], edx
  '0051AE36: mov eax, [ebp-28h]
  '0051AE39: mov [ecx+0Ch], eax
  '0051AE3C: push 00000000h
  '0051AE3E: mov ecx, [ebp-000000B8h]
  '0051AE44: mov edx, [ecx]
  '0051AE46: mov eax, [ebp-000000B8h]
  '0051AE4C: push eax
  '0051AE4D: call [edx+00000178h]
  '0051AE53: fclex 
  '0051AE55: mov [ebp-000000BCh], eax
  '0051AE5B: cmp [ebp-000000BCh], 00000000h
  '0051AE62: jnl 51AE8Ah
  '0051AE64: push 00000178h
  '0051AE69: push 0042149Ch
  '0051AE6E: mov ecx, [ebp-000000B8h]
  '0051AE74: push ecx
  '0051AE75: mov edx, [ebp-000000BCh]
  '0051AE7B: push edx
  '0051AE7C: call [004010A0h]
  '0051AE82: mov [ebp-000000F4h], eax
  '0051AE88: jmp 51AE94h
  '0051AE8A: mov [ebp-000000F4h], 00000000h
  '0051AE94: lea ecx, [ebp-24h]
  '0051AE97: call [004013B8h]
  '0051AE9D: mov [ebp-10h], 00000000h
  '0051AEA4: wait 
  '0051AEA5: push 0051AEB7h
  '0051AEAA: jmp 51AEB6h
  '0051AEAC: lea ecx, [ebp-24h]
  '0051AEAF: call [004013B8h]
  '0051AEB5: ret 
End Sub
Private Sub Form__51A6C0
  '0051A6C0: push ebp
  '0051A6C1: mov ebp, esp
  '0051A6C3: sub esp, 0000000Ch
  '0051A6C6: push 004081B6h
  '0051A6CB: mov eax, fs:[00h]
  '0051A6D1: push eax
  '0051A6D2: mov fs:[00000000h], esp
  '0051A6D9: sub esp, 00000050h
  '0051A6DC: push ebx
  '0051A6DD: push esi
  '0051A6DE: push edi
  '0051A6DF: mov [ebp-0Ch], esp
  '0051A6E2: mov [ebp-08h], 00406B48h
  '0051A6E9: mov esi, [ebp+08h]
  '0051A6EC: mov eax, esi
  '0051A6EE: and eax, 00000001h
  '0051A6F1: mov [ebp-04h], eax
  '0051A6F4: and esi, FFFFFFFEh
  '0051A6F7: push esi
  '0051A6F8: mov [ebp+08h], esi
  '0051A6FB: mov ecx, [esi]
  '0051A6FD: call [ecx+04h]
  '0051A700: mov edx, [esi]
  '0051A702: lea eax, [ebp-18h]
  '0051A705: xor edi, edi
  '0051A707: push eax
  '0051A708: push esi
  '0051A709: mov [ebp-18h], edi
  '0051A70C: mov [ebp-1Ch], edi
  '0051A70F: mov [ebp-20h], edi
  '0051A712: mov [ebp-30h], edi
  '0051A715: mov [ebp-44h], edi
  '0051A718: mov [ebp-48h], edi
  '0051A71B: call [edx+000001C0h]
  '0051A721: cmp eax, edi
  '0051A723: fclex 
  '0051A725: jnl 51A73Dh
  '0051A727: mov ebx, [004010A0h]
  '0051A72D: push 000001C0h
  '0051A732: push 00421D9Ch
  '0051A737: push esi
  '0051A738: push eax
  '0051A739: call ebx
  '0051A73B: jmp 51A743h
  '0051A73D: mov ebx, [004010A0h]
  '0051A743: mov edx, [ebp-18h]
  '0051A746: lea ecx, [ebp-30h]
  '0051A749: push ecx
  '0051A74A: push 00000004h
  '0051A74C: push edx
  '0051A74D: mov [ebp-28h], 80020004h
  '0051A754: mov [ebp-30h], 0000000Ah
  '0051A75B: call [00401148h]
  '0051A761: mov edx, eax
  '0051A763: lea ecx, [ebp-1Ch]
  '0051A766: call [00401378h]
  '0051A76C: push eax
  '0051A76D: call [004013BCh]
  '0051A773: mov eax, [541024h]
  '0051A778: fstp real8 ptr [ebp-50h]
  '0051A77B: cmp eax, edi
  '0051A77D: jnz 51A78Fh
  '0051A77F: push 00541024h
  '0051A784: push 00413334h
  '0051A789: call [004012B8h]
  '0051A78F: mov edi, [00541024h]
  '0051A795: mov edx, 0042A4C0h
  '0051A79A: lea ecx, [ebp-20h]
  '0051A79D: call [004012D8h]
  '0051A7A3: fld real8 ptr [ebp-50h]
  '0051A7A6: call [00401348h]
  '0051A7AC: lea ecx, [ebp-20h]
  '0051A7AF: lea edx, [ebp-44h]
  '0051A7B2: mov [ebp-44h], eax
  '0051A7B5: mov eax, [edi]
  '0051A7B7: push ecx
  '0051A7B8: push edx
  '0051A7B9: push edi
  '0051A7BA: call [eax+00000714h]
  '0051A7C0: test eax, eax
  '0051A7C2: fclex 
  '0051A7C4: jnl 51A7D4h
  '0051A7C6: push 00000714h
  '0051A7CB: push 0041C118h
  '0051A7D0: push edi
  '0051A7D1: push eax
  '0051A7D2: call ebx
  '0051A7D4: lea eax, [ebp-20h]
  '0051A7D7: lea ecx, [ebp-1Ch]
  '0051A7DA: push eax
  '0051A7DB: lea edx, [ebp-18h]
  '0051A7DE: push ecx
  '0051A7DF: push edx
  '0051A7E0: push 00000003h
  '0051A7E2: call [004012E8h]
  '0051A7E8: add esp, 00000010h
  '0051A7EB: lea ecx, [ebp-30h]
  '0051A7EE: call [00401030h]
  '0051A7F4: call [00401104h]
  '0051A7FA: mov eax, [esi]
  '0051A7FC: lea ecx, [ebp-48h]
  '0051A7FF: push ecx
  '0051A800: push esi
  '0051A801: call [eax+00000080h]
  '0051A807: test eax, eax
  '0051A809: fclex 
  '0051A80B: jnl 51A81Bh
  '0051A80D: push 00000080h
  '0051A812: push 00421D9Ch
  '0051A817: push esi
  '0051A818: push eax
  '0051A819: call ebx
  '0051A81B: mov edx, [ebp-48h]
  '0051A81E: mov edi, [004011D4h]
  '0051A824: push edx
  '0051A825: call edi
  '0051A827: mov edx, eax
  '0051A829: lea ecx, [ebp-18h]
  '0051A82C: call [00401378h]
  '0051A832: mov ebx, [00401010h]
  '0051A838: push eax
  '0051A839: push 0042A468h
  '0051A83E: push 0041EA6Ch
  '0051A843: push 0041EA58h
  '0051A848: call ebx
  '0051A84A: lea ecx, [ebp-18h]
  '0051A84D: call [004013B4h]
  '0051A853: mov eax, [esi]
  '0051A855: lea ecx, [ebp-48h]
  '0051A858: push ecx
  '0051A859: push esi
  '0051A85A: call [eax+00000088h]
  '0051A860: test eax, eax
  '0051A862: fclex 
  '0051A864: jnl 51A878h
  '0051A866: push 00000088h
  '0051A86B: push 00421D9Ch
  '0051A870: push esi
  '0051A871: push eax
  '0051A872: call [004010A0h]
  '0051A878: mov edx, [ebp-48h]
  '0051A87B: push edx
  '0051A87C: call edi
  '0051A87E: mov edx, eax
  '0051A880: lea ecx, [ebp-18h]
  '0051A883: call [00401378h]
  '0051A889: push eax
  '0051A88A: push 0042A480h
  '0051A88F: push 0041EA6Ch
  '0051A894: push 0041EA58h
  '0051A899: call ebx
  '0051A89B: lea ecx, [ebp-18h]
  '0051A89E: call [004013B4h]
  '0051A8A4: mov [ebp-04h], 00000000h
  '0051A8AB: wait 
  '0051A8AC: push 0051A8D5h
  '0051A8B1: jmp 51A8D4h
  '0051A8B3: lea eax, [ebp-20h]
  '0051A8B6: lea ecx, [ebp-1Ch]
  '0051A8B9: push eax
  '0051A8BA: lea edx, [ebp-18h]
  '0051A8BD: push ecx
  '0051A8BE: push edx
  '0051A8BF: push 00000003h
  '0051A8C1: call [004012E8h]
  '0051A8C7: add esp, 00000010h
  '0051A8CA: lea ecx, [ebp-30h]
  '0051A8CD: call [00401030h]
  '0051A8D3: ret 
End Sub
Private Sub clear_text__51B280
  '0051B280: push ebp
  '0051B281: mov ebp, esp
  '0051B283: sub esp, 0000000Ch
  '0051B286: push 004081B6h
  '0051B28B: mov eax, fs:[00h]
  '0051B291: push eax
  '0051B292: mov fs:[00000000h], esp
  '0051B299: sub esp, 00000030h
  '0051B29C: push ebx
  '0051B29D: push esi
  '0051B29E: push edi
  '0051B29F: mov [ebp-0Ch], esp
  '0051B2A2: mov [ebp-08h], 00406BC8h
  '0051B2A9: mov esi, [ebp+08h]
  '0051B2AC: mov eax, esi
  '0051B2AE: and eax, 00000001h
  '0051B2B1: mov [ebp-04h], eax
  '0051B2B4: and esi, FFFFFFFEh
  '0051B2B7: push esi
  '0051B2B8: mov [ebp+08h], esi
  '0051B2BB: mov ecx, [esi]
  '0051B2BD: call [ecx+04h]
  '0051B2C0: sub esp, 00000010h
  '0051B2C3: mov ecx, 00000008h
  '0051B2C8: mov edx, esp
  '0051B2CA: mov eax, 0041BC60h
  '0051B2CF: xor edi, edi
  '0051B2D1: push FFFFFDFBh
  '0051B2D6: mov [edx], ecx
  '0051B2D8: mov ecx, [ebp-28h]
  '0051B2DB: push esi
  '0051B2DC: mov [ebp-18h], edi
  '0051B2DF: mov [edx+04h], ecx
  '0051B2E2: mov ecx, [esi]
  '0051B2E4: mov [ebp-1Ch], edi
  '0051B2E7: mov [edx+08h], eax
  '0051B2EA: mov eax, [ebp-20h]
  '0051B2ED: mov [edx+0Ch], eax
  '0051B2F0: call [ecx+00000318h]
  '0051B2F6: lea edx, [ebp-1Ch]
  '0051B2F9: push eax
  '0051B2FA: push edx
  '0051B2FB: call [004010E4h]
  '0051B301: push eax
  '0051B302: call [0040139Ch]
  '0051B308: lea ecx, [ebp-1Ch]
  '0051B30B: call [004013B8h]
  '0051B311: mov edx, 0042A5A0h
  '0051B316: lea ecx, [ebp-18h]
  '0051B319: call [004012D8h]
  '0051B31F: mov eax, [esi]
  '0051B321: lea ecx, [ebp-18h]
  '0051B324: push ecx
  '0051B325: push esi
  '0051B326: call [eax+00000728h]
  '0051B32C: lea ecx, [ebp-18h]
  '0051B32F: call [004013B4h]
  '0051B335: mov [ebp-04h], edi
  '0051B338: push 0051B353h
  '0051B33D: jmp 51B352h
  '0051B33F: lea ecx, [ebp-18h]
  '0051B342: call [004013B4h]
  '0051B348: lea ecx, [ebp-1Ch]
  '0051B34B: call [004013B8h]
  '0051B351: ret 
End Sub
Private Sub chkAutoClean__519E60
  '00519E60: push ebp
  '00519E61: mov ebp, esp
  '00519E63: sub esp, 0000000Ch
  '00519E66: push 004081B6h
  '00519E6B: mov eax, fs:[00h]
  '00519E71: push eax
  '00519E72: mov fs:[00000000h], esp
  '00519E79: sub esp, 0000001Ch
  '00519E7C: push ebx
  '00519E7D: push esi
  '00519E7E: push edi
  '00519E7F: mov [ebp-0Ch], esp
  '00519E82: mov [ebp-08h], 00406A90h
  '00519E89: mov esi, [ebp+08h]
  '00519E8C: mov eax, esi
  '00519E8E: and eax, 00000001h
  '00519E91: mov [ebp-04h], eax
  '00519E94: and esi, FFFFFFFEh
  '00519E97: push esi
  '00519E98: mov [ebp+08h], esi
  '00519E9B: mov ecx, [esi]
  '00519E9D: call [ecx+04h]
  '00519EA0: mov edx, [esi]
  '00519EA2: xor edi, edi
  '00519EA4: push esi
  '00519EA5: mov [ebp-18h], edi
  '00519EA8: mov [ebp-1Ch], edi
  '00519EAB: mov [ebp-20h], edi
  '00519EAE: call [edx+00000304h]
  '00519EB4: push eax
  '00519EB5: lea eax, [ebp-1Ch]
  '00519EB8: push eax
  '00519EB9: call [004010E4h]
  '00519EBF: mov esi, eax
  '00519EC1: lea edx, [ebp-20h]
  '00519EC4: push edx
  '00519EC5: push esi
  '00519EC6: mov ecx, [esi]
  '00519EC8: call [ecx+000000E0h]
  '00519ECE: cmp eax, edi
  '00519ED0: fclex 
  '00519ED2: jnl 519EE6h
  '00519ED4: push 000000E0h
  '00519ED9: push 0041E108h
  '00519EDE: push esi
  '00519EDF: push eax
  '00519EE0: call [004010A0h]
  '00519EE6: mov eax, [ebp-20h]
  '00519EE9: push eax
  '00519EEA: call [0040100Ch]
  '00519EF0: mov edx, eax
  '00519EF2: lea ecx, [ebp-18h]
  '00519EF5: call [00401378h]
  '00519EFB: push eax
  '00519EFC: push 0042A424h
  '00519F01: push 0041EA6Ch
  '00519F06: push 0041EA58h
  '00519F0B: call [00401010h]
  '00519F11: lea ecx, [ebp-18h]
  '00519F14: call [004013B4h]
  '00519F1A: lea ecx, [ebp-1Ch]
  '00519F1D: call [004013B8h]
  '00519F23: mov [ebp-04h], edi
  '00519F26: push 00519F41h
  '00519F2B: jmp 519F40h
  '00519F2D: lea ecx, [ebp-18h]
  '00519F30: call [004013B4h]
  '00519F36: lea ecx, [ebp-1Ch]
  '00519F39: call [004013B8h]
  '00519F3F: ret 
End Sub

