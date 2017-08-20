VERSION 5.00
Begin VB.Form frmAddyBook
  Caption = "MiniMo Address Book"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  Icon = "frmAddyBook.frx":0
  LinkTopic = "Form2"
  Visible = 0   'False
  ClientLeft = 165
  ClientTop = 450
  ClientWidth = 5775
  ClientHeight = 4995
  ShowInTaskbar = 0   'False
  StartUpPosition = 3 'Windows Default
  Begin MSComctlLib.ImageList ImageList1
  End
  Begin MSComctlLib.ListView lstAddy
    Left = 0
    Top = 0
    Width = 5775
    Height = 4740
    TabIndex = 0
  End
  Begin MSComctlLib.StatusBar StatusBar1
    Left = 0
    Top = 4740
    Width = 5775
    Height = 255
    TabIndex = 1
  End
  Begin MSComctlLib.ProgressBar ProgressBar1
    Left = 3000
    Top = 6600
    Width = 1455
    Height = 255
    TabIndex = 2
  End
  Begin VB.Menu addy_menu
    Visible = 0   'False
    Caption = "addy menu"
    Begin VB.Menu add_new_entry
      Caption = "Add New Entry"
    End
    Begin VB.Menu ping_all
      Caption = "Ping All"
    End
    Begin VB.Menu remove_dead
      Caption = "Remove Dead"
    End
  End
End

Attribute VB_Name = "frmAddyBook"

Private Sub add_new_entry__538870
  '00538870: push ebp
  '00538871: mov ebp, esp
  '00538873: sub esp, 0000000Ch
  '00538876: push 004081B6h
  '0053887B: mov eax, fs:[00h]
  '00538881: push eax
  '00538882: mov fs:[00000000h], esp
  '00538889: sub esp, 000000F4h
  '0053888F: push ebx
  '00538890: push esi
  '00538891: push edi
  '00538892: mov [ebp-0Ch], esp
  '00538895: mov [ebp-08h], 00407D10h
  '0053889C: mov eax, [ebp+08h]
  '0053889F: mov ecx, eax
  '005388A1: and ecx, 00000001h
  '005388A4: mov [ebp-04h], ecx
  '005388A7: and al, FEh
  '005388A9: push eax
  '005388AA: mov [ebp+08h], eax
  '005388AD: mov edx, [eax]
  '005388AF: call [edx+04h]
  '005388B2: xor esi, esi
  '005388B4: mov ebx, 80020004h
  '005388B9: mov edi, 0000000Ah
  '005388BE: mov [ebp-4Ch], esi
  '005388C1: mov [ebp-5Ch], esi
  '005388C4: mov [ebp-6Ch], esi
  '005388C7: mov [ebp-7Ch], esi
  '005388CA: mov [ebp-0000008Ch], esi
  '005388D0: mov [ebp-000000ACh], esi
  '005388D6: lea edx, [ebp-000000ACh]
  '005388DC: lea ecx, [ebp-3Ch]
  '005388DF: mov [ebp-18h], esi
  '005388E2: mov [ebp-1Ch], esi
  '005388E5: mov [ebp-2Ch], esi
  '005388E8: mov [ebp-3Ch], esi
  '005388EB: mov [ebp-0000009Ch], esi
  '005388F1: mov [ebp-00000084h], ebx
  '005388F7: mov [ebp-0000008Ch], edi
  '005388FD: mov [ebp-74h], ebx
  '00538900: mov [ebp-7Ch], edi
  '00538903: mov [ebp-64h], ebx
  '00538906: mov [ebp-6Ch], edi
  '00538909: mov [ebp-54h], ebx
  '0053890C: mov [ebp-5Ch], edi
  '0053890F: mov [ebp-44h], ebx
  '00538912: mov [ebp-4Ch], edi
  '00538915: mov [ebp-000000A4h], 0042D3A8h
  '0053891F: mov [ebp-000000ACh], 00000008h
  '00538929: call [00401338h]
  '0053892F: lea edx, [ebp-0000009Ch]
  '00538935: lea ecx, [ebp-2Ch]
  '00538938: mov [ebp-00000094h], 0042D340h
  '00538942: mov [ebp-0000009Ch], 00000008h
  '0053894C: call [00401338h]
  '00538952: lea eax, [ebp-0000008Ch]
  '00538958: lea ecx, [ebp-7Ch]
  '0053895B: push eax
  '0053895C: lea edx, [ebp-6Ch]
  '0053895F: push ecx
  '00538960: lea eax, [ebp-5Ch]
  '00538963: push edx
  '00538964: lea ecx, [ebp-4Ch]
  '00538967: push eax
  '00538968: lea edx, [ebp-3Ch]
  '0053896B: push ecx
  '0053896C: lea eax, [ebp-2Ch]
  '0053896F: push edx
  '00538970: push eax
  '00538971: call [004010ECh]
  '00538977: mov edx, eax
  '00538979: lea ecx, [ebp-18h]
  '0053897C: call [00401378h]
  '00538982: lea ecx, [ebp-0000008Ch]
  '00538988: lea edx, [ebp-7Ch]
  '0053898B: push ecx
  '0053898C: lea eax, [ebp-6Ch]
  '0053898F: push edx
  '00538990: lea ecx, [ebp-5Ch]
  '00538993: push eax
  '00538994: lea edx, [ebp-4Ch]
  '00538997: push ecx
  '00538998: lea eax, [ebp-3Ch]
  '0053899B: push edx
  '0053899C: lea ecx, [ebp-2Ch]
  '0053899F: push eax
  '005389A0: push ecx
  '005389A1: push 00000007h
  '005389A3: call [00401050h]
  '005389A9: mov edx, [ebp-18h]
  '005389AC: add esp, 00000020h
  '005389AF: push edx
  '005389B0: push esi
  '005389B1: call [00401184h]
  '005389B7: test eax, eax
  '005389B9: jz 00538AB5h
  '005389BF: mov [ebp-00000084h], ebx
  '005389C5: mov [ebp-74h], ebx
  '005389C8: mov [ebp-64h], ebx
  '005389CB: mov [ebp-54h], ebx
  '005389CE: mov [ebp-44h], ebx
  '005389D1: mov [ebp-0000008Ch], edi
  '005389D7: mov [ebp-7Ch], edi
  '005389DA: mov [ebp-6Ch], edi
  '005389DD: mov [ebp-5Ch], edi
  '005389E0: mov [ebp-4Ch], edi
  '005389E3: mov edi, [00401338h]
  '005389E9: mov ebx, 00000008h
  '005389EE: lea edx, [ebp-000000ACh]
  '005389F4: lea ecx, [ebp-3Ch]
  '005389F7: mov [ebp-000000A4h], 0042D3F8h
  '00538A01: mov [ebp-000000ACh], ebx
  '00538A07: call edi
  '00538A09: lea edx, [ebp-0000009Ch]
  '00538A0F: lea ecx, [ebp-2Ch]
  '00538A12: mov [ebp-00000094h], 0042D3B4h
  '00538A1C: mov [ebp-0000009Ch], ebx
  '00538A22: call edi
  '00538A24: lea eax, [ebp-0000008Ch]
  '00538A2A: lea ecx, [ebp-7Ch]
  '00538A2D: push eax
  '00538A2E: lea edx, [ebp-6Ch]
  '00538A31: push ecx
  '00538A32: lea eax, [ebp-5Ch]
  '00538A35: push edx
  '00538A36: lea ecx, [ebp-4Ch]
  '00538A39: push eax
  '00538A3A: lea edx, [ebp-3Ch]
  '00538A3D: push ecx
  '00538A3E: lea eax, [ebp-2Ch]
  '00538A41: push edx
  '00538A42: push eax
  '00538A43: call [004010ECh]
  '00538A49: mov edx, eax
  '00538A4B: lea ecx, [ebp-1Ch]
  '00538A4E: call [00401378h]
  '00538A54: lea ecx, [ebp-0000008Ch]
  '00538A5A: lea edx, [ebp-7Ch]
  '00538A5D: push ecx
  '00538A5E: lea eax, [ebp-6Ch]
  '00538A61: push edx
  '00538A62: lea ecx, [ebp-5Ch]
  '00538A65: push eax
  '00538A66: lea edx, [ebp-4Ch]
  '00538A69: push ecx
  '00538A6A: lea eax, [ebp-3Ch]
  '00538A6D: push edx
  '00538A6E: lea ecx, [ebp-2Ch]
  '00538A71: push eax
  '00538A72: push ecx
  '00538A73: push 00000007h
  '00538A75: call [00401050h]
  '00538A7B: mov edi, [ebp+08h]
  '00538A7E: add esp, 00000020h
  '00538A81: lea eax, [ebp-2Ch]
  '00538A84: lea ecx, [ebp-1Ch]
  '00538A87: mov edx, [edi]
  '00538A89: push eax
  '00538A8A: lea eax, [ebp-18h]
  '00538A8D: push ecx
  '00538A8E: push eax
  '00538A8F: push edi
  '00538A90: call [edx+000006F8h]
  '00538A96: cmp eax, esi
  '00538A98: jnl 538AACh
  '00538A9A: push 000006F8h
  '00538A9F: push 00422D74h
  '00538AA4: push edi
  '00538AA5: push eax
  '00538AA6: call [004010A0h]
  '00538AAC: lea ecx, [ebp-2Ch]
  '00538AAF: call [00401030h]
  '00538AB5: mov [ebp-04h], esi
  '00538AB8: push 00538AFBh
  '00538ABD: jmp 538AEAh
  '00538ABF: lea ecx, [ebp-0000008Ch]
  '00538AC5: lea edx, [ebp-7Ch]
  '00538AC8: push ecx
  '00538AC9: lea eax, [ebp-6Ch]
  '00538ACC: push edx
  '00538ACD: lea ecx, [ebp-5Ch]
  '00538AD0: push eax
  '00538AD1: lea edx, [ebp-4Ch]
  '00538AD4: push ecx
  '00538AD5: lea eax, [ebp-3Ch]
  '00538AD8: push edx
  '00538AD9: lea ecx, [ebp-2Ch]
  '00538ADC: push eax
  '00538ADD: push ecx
  '00538ADE: push 00000007h
  '00538AE0: call [00401050h]
  '00538AE6: add esp, 00000020h
  '00538AE9: ret 
End Sub
Private Sub remove_dead__53B240
  '0053B240: push ebp
  '0053B241: mov ebp, esp
  '0053B243: sub esp, 0000000Ch
  '0053B246: push 004081B6h
  '0053B24B: mov eax, fs:[00h]
  '0053B251: push eax
  '0053B252: mov fs:[00000000h], esp
  '0053B259: sub esp, 00000008h
  '0053B25C: push ebx
  '0053B25D: push esi
  '0053B25E: push edi
  '0053B25F: mov [ebp-0Ch], esp
  '0053B262: mov [ebp-08h], 00407E90h
  '0053B269: mov esi, [ebp+08h]
  '0053B26C: mov eax, esi
  '0053B26E: and eax, 00000001h
  '0053B271: mov [ebp-04h], eax
  '0053B274: and esi, FFFFFFFEh
  '0053B277: push esi
  '0053B278: mov [ebp+08h], esi
  '0053B27B: mov ecx, [esi]
  '0053B27D: call [ecx+04h]
  '0053B280: mov edx, [esi]
  '0053B282: push esi
  '0053B283: call [edx+00000720h]
  '0053B289: mov [ebp-04h], 00000000h
  '0053B290: mov eax, [ebp+08h]
  '0053B293: push eax
  '0053B294: mov ecx, [eax]
  '0053B296: call [ecx+08h]
  '0053B299: mov eax, [ebp-04h]
  '0053B29C: mov ecx, [ebp-14h]
  '0053B29F: pop edi
  '0053B2A0: pop esi
  '0053B2A1: mov fs:[00000000h], ecx
  '0053B2A8: pop ebx
  '0053B2A9: mov esp, ebp
  '0053B2AB: pop ebp
  '0053B2AC: retn 0004h
End Sub
Private Sub lstAddy__53B080
  '0053B080: push ebp
  '0053B081: mov ebp, esp
  '0053B083: sub esp, 0000000Ch
  '0053B086: push 004081B6h
  '0053B08B: mov eax, fs:[00h]
  '0053B091: push eax
  '0053B092: mov fs:[00000000h], esp
  '0053B099: sub esp, 00000050h
  '0053B09C: push ebx
  '0053B09D: push esi
  '0053B09E: push edi
  '0053B09F: mov [ebp-0Ch], esp
  '0053B0A2: mov [ebp-08h], 00407E78h
  '0053B0A9: mov esi, [ebp+08h]
  '0053B0AC: mov eax, esi
  '0053B0AE: and eax, 00000001h
  '0053B0B1: mov [ebp-04h], eax
  '0053B0B4: and esi, FFFFFFFEh
  '0053B0B7: push esi
  '0053B0B8: mov [ebp+08h], esi
  '0053B0BB: mov ecx, [esi]
  '0053B0BD: call [ecx+04h]
  '0053B0C0: mov edx, [ebp+0Ch]
  '0053B0C3: xor edi, edi
  '0053B0C5: mov [ebp-18h], edi
  '0053B0C8: mov [ebp-28h], edi
  '0053B0CB: cmp word ptr [edx], 0002h
  '0053B0CF: mov [ebp-38h], edi
  '0053B0D2: mov [ebp-48h], edi
  '0053B0D5: mov [ebp-58h], edi
  '0053B0D8: jnz 0053B19Ch
  '0053B0DE: sub esp, 00000010h
  '0053B0E1: mov ecx, 0000000Ah
  '0053B0E6: mov ebx, esp
  '0053B0E8: mov [ebp-28h], ecx
  '0053B0EB: mov edx, 80020004h
  '0053B0F0: sub esp, 00000010h
  '0053B0F3: mov [ebx], ecx
  '0053B0F5: mov ecx, [ebp-54h]
  '0053B0F8: mov eax, edx
  '0053B0FA: mov [ebp-20h], edx
  '0053B0FD: mov [ebx+04h], ecx
  '0053B100: mov ecx, esp
  '0053B102: sub esp, 00000010h
  '0053B105: mov edi, [esi]
  '0053B107: mov [ebx+08h], eax
  '0053B10A: mov eax, [ebp-4Ch]
  '0053B10D: mov [ebx+0Ch], eax
  '0053B110: mov eax, 0000000Ah
  '0053B115: mov [ecx], eax
  '0053B117: mov eax, [ebp-44h]
  '0053B11A: mov [ecx+04h], eax
  '0053B11D: mov eax, 0000000Ah
  '0053B122: mov [ecx+08h], edx
  '0053B125: mov edx, [ebp-3Ch]
  '0053B128: mov [ecx+0Ch], edx
  '0053B12B: mov edx, [ebp-34h]
  '0053B12E: mov ecx, esp
  '0053B130: sub esp, 00000010h
  '0053B133: mov [ecx], eax
  '0053B135: mov eax, 80020004h
  '0053B13A: mov [ecx+04h], edx
  '0053B13D: mov edx, [ebp-28h]
  '0053B140: mov [ecx+08h], eax
  '0053B143: mov eax, [ebp-2Ch]
  '0053B146: mov [ecx+0Ch], eax
  '0053B149: mov eax, [ebp-24h]
  '0053B14C: mov ecx, esp
  '0053B14E: push esi
  '0053B14F: mov [ecx], edx
  '0053B151: mov edx, [ebp-20h]
  '0053B154: mov [ecx+04h], eax
  '0053B157: mov eax, [ebp-1Ch]
  '0053B15A: mov [ecx+08h], edx
  '0053B15D: mov [ecx+0Ch], eax
  '0053B160: call [edi+000002FCh]
  '0053B166: lea ecx, [ebp-18h]
  '0053B169: push eax
  '0053B16A: push ecx
  '0053B16B: call [004010E4h]
  '0053B171: push eax
  '0053B172: push esi
  '0053B173: call [edi+000002BCh]
  '0053B179: xor edi, edi
  '0053B17B: cmp eax, edi
  '0053B17D: fclex 
  '0053B17F: jnl 53B193h
  '0053B181: push 000002BCh
  '0053B186: push 00422F24h
  '0053B18B: push esi
  '0053B18C: push eax
  '0053B18D: call [004010A0h]
  '0053B193: lea ecx, [ebp-18h]
  '0053B196: call [004013B8h]
  '0053B19C: mov [ebp-04h], edi
  '0053B19F: push 0053B1B1h
  '0053B1A4: jmp 53B1B0h
  '0053B1A6: lea ecx, [ebp-18h]
  '0053B1A9: call [004013B8h]
  '0053B1AF: ret 
End Sub
Private Sub ping_all__53B1D0
  '0053B1D0: push ebp
  '0053B1D1: mov ebp, esp
  '0053B1D3: sub esp, 0000000Ch
  '0053B1D6: push 004081B6h
  '0053B1DB: mov eax, fs:[00h]
  '0053B1E1: push eax
  '0053B1E2: mov fs:[00000000h], esp
  '0053B1E9: sub esp, 00000008h
  '0053B1EC: push ebx
  '0053B1ED: push esi
  '0053B1EE: push edi
  '0053B1EF: mov [ebp-0Ch], esp
  '0053B1F2: mov [ebp-08h], 00407E88h
  '0053B1F9: mov esi, [ebp+08h]
  '0053B1FC: mov eax, esi
  '0053B1FE: and eax, 00000001h
  '0053B201: mov [ebp-04h], eax
  '0053B204: and esi, FFFFFFFEh
  '0053B207: push esi
  '0053B208: mov [ebp+08h], esi
  '0053B20B: mov ecx, [esi]
  '0053B20D: call [ecx+04h]
  '0053B210: mov edx, [esi]
  '0053B212: push esi
  '0053B213: call [edx+00000718h]
  '0053B219: mov [ebp-04h], 00000000h
  '0053B220: mov eax, [ebp+08h]
  '0053B223: push eax
  '0053B224: mov ecx, [eax]
  '0053B226: call [ecx+08h]
  '0053B229: mov eax, [ebp-04h]
  '0053B22C: mov ecx, [ebp-14h]
  '0053B22F: pop edi
  '0053B230: pop esi
  '0053B231: mov fs:[00000000h], ecx
  '0053B238: pop ebx
  '0053B239: mov esp, ebp
  '0053B23B: pop ebp
  '0053B23C: retn 0004h
End Sub
Private Sub Form__538B20
  '00538B20: push ebp
  '00538B21: mov ebp, esp
  '00538B23: sub esp, 0000000Ch
  '00538B26: push 004081B6h
  '00538B2B: mov eax, fs:[00h]
  '00538B31: push eax
  '00538B32: mov fs:[00000000h], esp
  '00538B39: sub esp, 00000034h
  '00538B3C: push ebx
  '00538B3D: push esi
  '00538B3E: push edi
  '00538B3F: mov [ebp-0Ch], esp
  '00538B42: mov [ebp-08h], 00407D20h
  '00538B49: mov esi, [ebp+08h]
  '00538B4C: mov eax, esi
  '00538B4E: and eax, 00000001h
  '00538B51: mov [ebp-04h], eax
  '00538B54: and esi, FFFFFFFEh
  '00538B57: push esi
  '00538B58: mov [ebp+08h], esi
  '00538B5B: mov ecx, [esi]
  '00538B5D: call [ecx+04h]
  '00538B60: mov edx, [esi]
  '00538B62: xor edi, edi
  '00538B64: push esi
  '00538B65: mov [ebp-18h], edi
  '00538B68: mov [ebp-1Ch], edi
  '00538B6B: mov [ebp-20h], edi
  '00538B6E: mov [ebp-24h], edi
  '00538B71: mov [ebp-34h], edi
  '00538B74: mov [ebp-38h], edi
  '00538B77: call [edx+00000318h]
  '00538B7D: mov ebx, [004010E4h]
  '00538B83: push eax
  '00538B84: lea eax, [ebp-20h]
  '00538B87: push eax
  '00538B88: call ebx
  '00538B8A: mov ecx, [esi]
  '00538B8C: push esi
  '00538B8D: call [ecx+00000314h]
  '00538B93: lea edx, [ebp-24h]
  '00538B96: push eax
  '00538B97: push edx
  '00538B98: call ebx
  '00538B9A: mov eax, [ebp-24h]
  '00538B9D: mov [ebp-38h], 00000001h
  '00538BA4: push eax
  '00538BA5: lea eax, [ebp-1Ch]
  '00538BA8: push eax
  '00538BA9: mov [ebp-24h], edi
  '00538BAC: call ebx
  '00538BAE: mov eax, [ebp-20h]
  '00538BB1: lea ecx, [ebp-18h]
  '00538BB4: push eax
  '00538BB5: push ecx
  '00538BB6: mov [ebp-20h], edi
  '00538BB9: call ebx
  '00538BBB: lea edx, [ebp-38h]
  '00538BBE: lea eax, [ebp-1Ch]
  '00538BC1: push edx
  '00538BC2: lea ecx, [ebp-18h]
  '00538BC5: push eax
  '00538BC6: lea edx, [ebp-34h]
  '00538BC9: push ecx
  '00538BCA: push edx
  '00538BCB: call 004FDD30h
  '00538BD0: lea eax, [ebp-24h]
  '00538BD3: lea ecx, [ebp-20h]
  '00538BD6: push eax
  '00538BD7: lea edx, [ebp-1Ch]
  '00538BDA: push ecx
  '00538BDB: lea eax, [ebp-18h]
  '00538BDE: push edx
  '00538BDF: push eax
  '00538BE0: push 00000004h
  '00538BE2: call [00401064h]
  '00538BE8: add esp, 00000014h
  '00538BEB: lea ecx, [ebp-34h]
  '00538BEE: call [00401030h]
  '00538BF4: mov [ebp-04h], edi
  '00538BF7: push 00538C24h
  '00538BFC: jmp 538C23h
  '00538BFE: lea ecx, [ebp-24h]
  '00538C01: lea edx, [ebp-20h]
  '00538C04: push ecx
  '00538C05: lea eax, [ebp-1Ch]
  '00538C08: push edx
  '00538C09: lea ecx, [ebp-18h]
  '00538C0C: push eax
  '00538C0D: push ecx
  '00538C0E: push 00000004h
  '00538C10: call [00401064h]
  '00538C16: add esp, 00000014h
  '00538C19: lea ecx, [ebp-34h]
  '00538C1C: call [00401030h]
  '00538C22: ret 
End Sub
Private Sub Form__538CC0
  '00538CC0: push ebp
  '00538CC1: mov ebp, esp
  '00538CC3: sub esp, 00000018h
  '00538CC6: push 004081B6h
  '00538CCB: mov eax, fs:[00h]
  '00538CD1: push eax
  '00538CD2: mov fs:[00000000h], esp
  '00538CD9: mov eax, 00000180h
  '00538CDE: call 004081B0h
  '00538CE3: push ebx
  '00538CE4: push esi
  '00538CE5: push edi
  '00538CE6: mov [ebp-18h], esp
  '00538CE9: mov [ebp-14h], 00407D38h
  '00538CF0: mov eax, [ebp+08h]
  '00538CF3: and eax, 00000001h
  '00538CF6: mov [ebp-10h], eax
  '00538CF9: mov ecx, [ebp+08h]
  '00538CFC: and ecx, FFFFFFFEh
  '00538CFF: mov [ebp+08h], ecx
  '00538D02: mov [ebp-0Ch], 00000000h
  '00538D09: mov edx, [ebp+08h]
  '00538D0C: mov eax, [edx]
  '00538D0E: mov ecx, [ebp+08h]
  '00538D11: push ecx
  '00538D12: call [eax+04h]
  '00538D15: mov [ebp-04h], 00000001h
  '00538D1C: mov [ebp-04h], 00000002h
  '00538D23: push FFFFFFFFh
  '00538D25: call [004010E8h]
  '00538D2B: mov [ebp-04h], 00000003h
  '00538D32: mov [ebp-00000098h], 00000000h
  '00538D3C: mov [ebp-000000A0h], 0000000Bh
  '00538D46: mov eax, 00000010h
  '00538D4B: call 004081B0h
  '00538D50: mov edx, esp
  '00538D52: mov eax, [ebp-000000A0h]
  '00538D58: mov [edx], eax
  '00538D5A: mov ecx, [ebp-0000009Ch]
  '00538D60: mov [edx+04h], ecx
  '00538D63: mov eax, [ebp-00000098h]
  '00538D69: mov [edx+08h], eax
  '00538D6C: mov ecx, [ebp-00000094h]
  '00538D72: mov [edx+0Ch], ecx
  '00538D75: push 80010007h
  '00538D7A: mov edx, [ebp+08h]
  '00538D7D: mov eax, [edx]
  '00538D7F: mov ecx, [ebp+08h]
  '00538D82: push ecx
  '00538D83: call [eax+00000318h]
  '00538D89: push eax
  '00538D8A: lea edx, [ebp-24h]
  '00538D8D: push edx
  '00538D8E: call [004010E4h]
  '00538D94: push eax
  '00538D95: call [0040139Ch]
  '00538D9B: lea ecx, [ebp-24h]
  '00538D9E: call [004013B8h]
  '00538DA4: mov [ebp-04h], 00000004h
  '00538DAB: mov [ebp-00000098h], 00000000h
  '00538DB5: mov [ebp-000000A0h], 00000004h
  '00538DBF: mov [ebp-000000B8h], 00000000h
  '00538DC9: mov [ebp-000000C0h], 00000002h
  '00538DD3: lea eax, [ebp-00000134h]
  '00538DD9: push eax
  '00538DDA: mov ecx, [ebp+08h]
  '00538DDD: mov edx, [ecx]
  '00538DDF: mov eax, [ebp+08h]
  '00538DE2: push eax
  '00538DE3: call [edx+00000100h]
  '00538DE9: fclex 
  '00538DEB: mov [ebp-00000140h], eax
  '00538DF1: cmp [ebp-00000140h], 00000000h
  '00538DF8: jnl 538E1Dh
  '00538DFA: push 00000100h
  '00538DFF: push 00422F24h
  '00538E04: mov ecx, [ebp+08h]
  '00538E07: push ecx
  '00538E08: mov edx, [ebp-00000140h]
  '00538E0E: push edx
  '00538E0F: call [004010A0h]
  '00538E15: mov [ebp-0000017Ch], eax
  '00538E1B: jmp 538E27h
  '00538E1D: mov [ebp-0000017Ch], 00000000h
  '00538E27: mov eax, [ebp-00000134h]
  '00538E2D: mov [ebp-000000D8h], eax
  '00538E33: mov [ebp-000000E0h], 00000004h
  '00538E3D: lea ecx, [ebp-00000138h]
  '00538E43: push ecx
  '00538E44: mov edx, [ebp+08h]
  '00538E47: mov eax, [edx]
  '00538E49: mov ecx, [ebp+08h]
  '00538E4C: push ecx
  '00538E4D: call [eax+00000108h]
  '00538E53: fclex 
  '00538E55: mov [ebp-00000144h], eax
  '00538E5B: cmp [ebp-00000144h], 00000000h
  '00538E62: jnl 538E87h
  '00538E64: push 00000108h
  '00538E69: push 00422F24h
  '00538E6E: mov edx, [ebp+08h]
  '00538E71: push edx
  '00538E72: mov eax, [ebp-00000144h]
  '00538E78: push eax
  '00538E79: call [004010A0h]
  '00538E7F: mov [ebp-00000180h], eax
  '00538E85: jmp 538E91h
  '00538E87: mov [ebp-00000180h], 00000000h
  '00538E91: fld real4 ptr [ebp-00000138h]
  '00538E97: fsub real4 ptr [004067C0h]
  '00538E9D: fstp real4 ptr [ebp-000000F8h]
  '00538EA3: fstsw ax
  '00538EA5: test al, 0Dh
  '00538EA7: jnz 005396FCh
  '00538EAD: mov [ebp-00000100h], 00000004h
  '00538EB7: mov eax, 00000010h
  '00538EBC: call 004081B0h
  '00538EC1: mov ecx, esp
  '00538EC3: mov edx, [ebp-000000A0h]
  '00538EC9: mov [ecx], edx
  '00538ECB: mov eax, [ebp-0000009Ch]
  '00538ED1: mov [ecx+04h], eax
  '00538ED4: mov edx, [ebp-00000098h]
  '00538EDA: mov [ecx+08h], edx
  '00538EDD: mov eax, [ebp-00000094h]
  '00538EE3: mov [ecx+0Ch], eax
  '00538EE6: mov eax, 00000010h
  '00538EEB: call 004081B0h
  '00538EF0: mov ecx, esp
  '00538EF2: mov edx, [ebp-000000C0h]
  '00538EF8: mov [ecx], edx
  '00538EFA: mov eax, [ebp-000000BCh]
  '00538F00: mov [ecx+04h], eax
  '00538F03: mov edx, [ebp-000000B8h]
  '00538F09: mov [ecx+08h], edx
  '00538F0C: mov eax, [ebp-000000B4h]
  '00538F12: mov [ecx+0Ch], eax
  '00538F15: mov eax, 00000010h
  '00538F1A: call 004081B0h
  '00538F1F: mov ecx, esp
  '00538F21: mov edx, [ebp-000000E0h]
  '00538F27: mov [ecx], edx
  '00538F29: mov eax, [ebp-000000DCh]
  '00538F2F: mov [ecx+04h], eax
  '00538F32: mov edx, [ebp-000000D8h]
  '00538F38: mov [ecx+08h], edx
  '00538F3B: mov eax, [ebp-000000D4h]
  '00538F41: mov [ecx+0Ch], eax
  '00538F44: mov eax, 00000010h
  '00538F49: call 004081B0h
  '00538F4E: mov ecx, esp
  '00538F50: mov edx, [ebp-00000100h]
  '00538F56: mov [ecx], edx
  '00538F58: mov eax, [ebp-000000FCh]
  '00538F5E: mov [ecx+04h], eax
  '00538F61: mov edx, [ebp-000000F8h]
  '00538F67: mov [ecx+08h], edx
  '00538F6A: mov eax, [ebp-000000F4h]
  '00538F70: mov [ecx+0Ch], eax
  '00538F73: push 00000004h
  '00538F75: push 80011002h
  '00538F7A: mov ecx, [ebp+08h]
  '00538F7D: mov edx, [ecx]
  '00538F7F: mov eax, [ebp+08h]
  '00538F82: push eax
  '00538F83: call [edx+00000310h]
  '00538F89: push eax
  '00538F8A: lea ecx, [ebp-24h]
  '00538F8D: push ecx
  '00538F8E: call [004010E4h]
  '00538F94: push eax
  '00538F95: call [00401040h]
  '00538F9B: add esp, 0000004Ch
  '00538F9E: lea ecx, [ebp-24h]
  '00538FA1: call [004013B8h]
  '00538FA7: mov [ebp-04h], 00000005h
  '00538FAE: push 00421124h
  '00538FB3: push 00000000h
  '00538FB5: push 00000002h
  '00538FB7: mov edx, [ebp+08h]
  '00538FBA: mov eax, [edx]
  '00538FBC: mov ecx, [ebp+08h]
  '00538FBF: push ecx
  '00538FC0: call [eax+00000310h]
  '00538FC6: push eax
  '00538FC7: lea edx, [ebp-28h]
  '00538FCA: push edx
  '00538FCB: call [004010E4h]
  '00538FD1: push eax
  '00538FD2: lea eax, [ebp-60h]
  '00538FD5: push eax
  '00538FD6: call [004011E4h]
  '00538FDC: add esp, 00000010h
  '00538FDF: push eax
  '00538FE0: call [004011C8h]
  '00538FE6: push eax
  '00538FE7: lea ecx, [ebp-2Ch]
  '00538FEA: push ecx
  '00538FEB: call [004010E4h]
  '00538FF1: mov [ebp-00000140h], eax
  '00538FF7: mov [ebp-68h], 00000002h
  '00538FFE: mov [ebp-70h], 00000002h
  '00539005: lea edx, [ebp-30h]
  '00539008: push edx
  '00539009: lea eax, [ebp-70h]
  '0053900C: push eax
  '0053900D: mov ecx, [ebp-00000140h]
  '00539013: mov edx, [ecx]
  '00539015: mov eax, [ebp-00000140h]
  '0053901B: push eax
  '0053901C: call [edx+24h]
  '0053901F: fclex 
  '00539021: mov [ebp-00000144h], eax
  '00539027: cmp [ebp-00000144h], 00000000h
  '0053902E: jnl 539053h
  '00539030: push 00000024h
  '00539032: push 00421124h
  '00539037: mov ecx, [ebp-00000140h]
  '0053903D: push ecx
  '0053903E: mov edx, [ebp-00000144h]
  '00539044: push edx
  '00539045: call [004010A0h]
  '0053904B: mov [ebp-00000184h], eax
  '00539051: jmp 53905Dh
  '00539053: mov [ebp-00000184h], 00000000h
  '0053905D: mov eax, [ebp-30h]
  '00539060: mov [ebp-00000148h], eax
  '00539066: push 00000000h
  '00539068: push 80010005h
  '0053906D: mov ecx, [ebp+08h]
  '00539070: mov edx, [ecx]
  '00539072: mov eax, [ebp+08h]
  '00539075: push eax
  '00539076: call [edx+00000310h]
  '0053907C: push eax
  '0053907D: lea ecx, [ebp-24h]
  '00539080: push ecx
  '00539081: call [004010E4h]
  '00539087: push eax
  '00539088: lea edx, [ebp-50h]
  '0053908B: push edx
  '0053908C: call [004011E4h]
  '00539092: add esp, 00000010h
  '00539095: push eax
  '00539096: call [004011DCh]
  '0053909C: fsub real4 ptr [00407D80h]
  '005390A2: fstsw ax
  '005390A4: test al, 0Dh
  '005390A6: jnz 005396FCh
  '005390AC: push ecx
  '005390AD: fstp real4 ptr [esp]
  '005390B0: mov eax, [ebp-00000148h]
  '005390B6: mov ecx, [eax]
  '005390B8: mov edx, [ebp-00000148h]
  '005390BE: push edx
  '005390BF: call [ecx+60h]
  '005390C2: fclex 
  '005390C4: mov [ebp-0000014Ch], eax
  '005390CA: cmp [ebp-0000014Ch], 00000000h
  '005390D1: jnl 5390F6h
  '005390D3: push 00000060h
  '005390D5: push 00421134h
  '005390DA: mov eax, [ebp-00000148h]
  '005390E0: push eax
  '005390E1: mov ecx, [ebp-0000014Ch]
  '005390E7: push ecx
  '005390E8: call [004010A0h]
  '005390EE: mov [ebp-00000188h], eax
  '005390F4: jmp 539100h
  '005390F6: mov [ebp-00000188h], 00000000h
  '00539100: lea edx, [ebp-30h]
  '00539103: push edx
  '00539104: lea eax, [ebp-2Ch]
  '00539107: push eax
  '00539108: lea ecx, [ebp-28h]
  '0053910B: push ecx
  '0053910C: lea edx, [ebp-24h]
  '0053910F: push edx
  '00539110: push 00000004h
  '00539112: call [00401064h]
  '00539118: add esp, 00000014h
  '0053911B: lea eax, [ebp-70h]
  '0053911E: push eax
  '0053911F: lea ecx, [ebp-60h]
  '00539122: push ecx
  '00539123: lea edx, [ebp-50h]
  '00539126: push edx
  '00539127: push 00000003h
  '00539129: call [00401050h]
  '0053912F: add esp, 00000010h
  '00539132: mov [ebp-04h], 00000006h
  '00539139: push 0041E958h
  '0053913E: push 00000000h
  '00539140: push 00000003h
  '00539142: mov eax, [ebp+08h]
  '00539145: mov ecx, [eax]
  '00539147: mov edx, [ebp+08h]
  '0053914A: push edx
  '0053914B: call [ecx+00000314h]
  '00539151: push eax
  '00539152: lea eax, [ebp-24h]
  '00539155: push eax
  '00539156: call [004010E4h]
  '0053915C: push eax
  '0053915D: lea ecx, [ebp-50h]
  '00539160: push ecx
  '00539161: call [004011E4h]
  '00539167: add esp, 00000010h
  '0053916A: push eax
  '0053916B: call [004011C8h]
  '00539171: push eax
  '00539172: lea edx, [ebp-28h]
  '00539175: push edx
  '00539176: call [004010E4h]
  '0053917C: mov [ebp-00000140h], eax
  '00539182: mov [ebp-58h], 00000001h
  '00539189: mov [ebp-60h], 00000002h
  '00539190: lea eax, [ebp-2Ch]
  '00539193: push eax
  '00539194: lea ecx, [ebp-60h]
  '00539197: push ecx
  '00539198: mov edx, [ebp-00000140h]
  '0053919E: mov eax, [edx]
  '005391A0: mov ecx, [ebp-00000140h]
  '005391A6: push ecx
  '005391A7: call [eax+24h]
  '005391AA: fclex 
  '005391AC: mov [ebp-00000144h], eax
  '005391B2: cmp [ebp-00000144h], 00000000h
  '005391B9: jnl 5391DEh
  '005391BB: push 00000024h
  '005391BD: push 0041E958h
  '005391C2: mov edx, [ebp-00000140h]
  '005391C8: push edx
  '005391C9: mov eax, [ebp-00000144h]
  '005391CF: push eax
  '005391D0: call [004010A0h]
  '005391D6: mov [ebp-0000018Ch], eax
  '005391DC: jmp 5391E8h
  '005391DE: mov [ebp-0000018Ch], 00000000h
  '005391E8: mov ecx, [ebp-2Ch]
  '005391EB: mov [ebp-00000148h], ecx
  '005391F1: lea edx, [ebp-00000134h]
  '005391F7: push edx
  '005391F8: mov eax, [ebp-00000148h]
  '005391FE: mov ecx, [eax]
  '00539200: mov edx, [ebp-00000148h]
  '00539206: push edx
  '00539207: call [ecx+54h]
  '0053920A: fclex 
  '0053920C: mov [ebp-0000014Ch], eax
  '00539212: cmp [ebp-0000014Ch], 00000000h
  '00539219: jnl 53923Eh
  '0053921B: push 00000054h
  '0053921D: push 0041E968h
  '00539222: mov eax, [ebp-00000148h]
  '00539228: push eax
  '00539229: mov ecx, [ebp-0000014Ch]
  '0053922F: push ecx
  '00539230: call [004010A0h]
  '00539236: mov [ebp-00000190h], eax
  '0053923C: jmp 539248h
  '0053923E: mov [ebp-00000190h], 00000000h
  '00539248: fld real4 ptr [ebp-00000134h]
  '0053924E: fadd real4 ptr [00405C00h]
  '00539254: fstp real4 ptr [ebp-000000B8h]
  '0053925A: fstsw ax
  '0053925C: test al, 0Dh
  '0053925E: jnz 005396FCh
  '00539264: mov [ebp-000000C0h], 00000004h
  '0053926E: cmp [00541200h], 00000000h
  '00539275: jnz 539293h
  '00539277: push 00541200h
  '0053927C: push 0040B670h
  '00539281: call [004012B8h]
  '00539287: mov [ebp-00000194h], 00541200h
  '00539291: jmp 53929Dh
  '00539293: mov [ebp-00000194h], 00541200h
  '0053929D: mov edx, [ebp-00000194h]
  '005392A3: mov eax, [edx]
  '005392A5: mov [ebp-00000150h], eax
  '005392AB: lea ecx, [ebp-00000138h]
  '005392B1: push ecx
  '005392B2: mov edx, [ebp-00000150h]
  '005392B8: mov eax, [edx]
  '005392BA: mov ecx, [ebp-00000150h]
  '005392C0: push ecx
  '005392C1: call [eax+00000088h]
  '005392C7: fclex 
  '005392C9: mov [ebp-00000154h], eax
  '005392CF: cmp [ebp-00000154h], 00000000h
  '005392D6: jnl 5392FEh
  '005392D8: push 00000088h
  '005392DD: push 00422F24h
  '005392E2: mov edx, [ebp-00000150h]
  '005392E8: push edx
  '005392E9: mov eax, [ebp-00000154h]
  '005392EF: push eax
  '005392F0: call [004010A0h]
  '005392F6: mov [ebp-00000198h], eax
  '005392FC: jmp 539308h
  '005392FE: mov [ebp-00000198h], 00000000h
  '00539308: fld real4 ptr [ebp-00000138h]
  '0053930E: fsub real4 ptr [00407D7Ch]
  '00539314: fstp real4 ptr [ebp-000000D8h]
  '0053931A: fstsw ax
  '0053931C: test al, 0Dh
  '0053931E: jnz 005396FCh
  '00539324: mov [ebp-000000E0h], 00000004h
  '0053932E: push 0041E958h
  '00539333: push 00000000h
  '00539335: push 00000003h
  '00539337: mov ecx, [ebp+08h]
  '0053933A: mov edx, [ecx]
  '0053933C: mov eax, [ebp+08h]
  '0053933F: push eax
  '00539340: call [edx+00000314h]
  '00539346: push eax
  '00539347: lea ecx, [ebp-30h]
  '0053934A: push ecx
  '0053934B: call [004010E4h]
  '00539351: push eax
  '00539352: lea edx, [ebp-70h]
  '00539355: push edx
  '00539356: call [004011E4h]
  '0053935C: add esp, 00000010h
  '0053935F: push eax
  '00539360: call [004011C8h]
  '00539366: push eax
  '00539367: lea eax, [ebp-34h]
  '0053936A: push eax
  '0053936B: call [004010E4h]
  '00539371: mov [ebp-00000158h], eax
  '00539377: mov [ebp-78h], 00000001h
  '0053937E: mov [ebp-80h], 00000002h
  '00539385: lea ecx, [ebp-38h]
  '00539388: push ecx
  '00539389: lea edx, [ebp-80h]
  '0053938C: push edx
  '0053938D: mov eax, [ebp-00000158h]
  '00539393: mov ecx, [eax]
  '00539395: mov edx, [ebp-00000158h]
  '0053939B: push edx
  '0053939C: call [ecx+24h]
  '0053939F: fclex 
  '005393A1: mov [ebp-0000015Ch], eax
  '005393A7: cmp [ebp-0000015Ch], 00000000h
  '005393AE: jnl 5393D3h
  '005393B0: push 00000024h
  '005393B2: push 0041E958h
  '005393B7: mov eax, [ebp-00000158h]
  '005393BD: push eax
  '005393BE: mov ecx, [ebp-0000015Ch]
  '005393C4: push ecx
  '005393C5: call [004010A0h]
  '005393CB: mov [ebp-0000019Ch], eax
  '005393D1: jmp 5393DDh
  '005393D3: mov [ebp-0000019Ch], 00000000h
  '005393DD: mov edx, [ebp-38h]
  '005393E0: mov [ebp-00000160h], edx
  '005393E6: lea eax, [ebp-0000013Ch]
  '005393EC: push eax
  '005393ED: mov ecx, [ebp-00000160h]
  '005393F3: mov edx, [ecx]
  '005393F5: mov eax, [ebp-00000160h]
  '005393FB: push eax
  '005393FC: call [edx+00000094h]
  '00539402: fclex 
  '00539404: mov [ebp-00000164h], eax
  '0053940A: cmp [ebp-00000164h], 00000000h
  '00539411: jnl 539439h
  '00539413: push 00000094h
  '00539418: push 0041E968h
  '0053941D: mov ecx, [ebp-00000160h]
  '00539423: push ecx
  '00539424: mov edx, [ebp-00000164h]
  '0053942A: push edx
  '0053942B: call [004010A0h]
  '00539431: mov [ebp-000001A0h], eax
  '00539437: jmp 539443h
  '00539439: mov [ebp-000001A0h], 00000000h
  '00539443: fld real4 ptr [ebp-0000013Ch]
  '00539449: fsub real4 ptr [00405BFCh]
  '0053944F: fstp real4 ptr [ebp-000000F8h]
  '00539455: fstsw ax
  '00539457: test al, 0Dh
  '00539459: jnz 005396FCh
  '0053945F: mov [ebp-00000100h], 00000004h
  '00539469: push 00000000h
  '0053946B: push 80010006h
  '00539470: mov eax, [ebp+08h]
  '00539473: mov ecx, [eax]
  '00539475: mov edx, [ebp+08h]
  '00539478: push edx
  '00539479: call [ecx+00000314h]
  '0053947F: push eax
  '00539480: lea eax, [ebp-3Ch]
  '00539483: push eax
  '00539484: call [004010E4h]
  '0053948A: push eax
  '0053948B: lea ecx, [ebp-00000090h]
  '00539491: push ecx
  '00539492: call [004011E4h]
  '00539498: add esp, 00000010h
  '0053949B: push eax
  '0053949C: call [004011DCh]
  '005394A2: fsub real4 ptr [00405BF8h]
  '005394A8: fstp real4 ptr [ebp-00000118h]
  '005394AE: fstsw ax
  '005394B0: test al, 0Dh
  '005394B2: jnz 005396FCh
  '005394B8: mov [ebp-00000120h], 00000004h
  '005394C2: mov eax, 00000010h
  '005394C7: call 004081B0h
  '005394CC: mov edx, esp
  '005394CE: mov eax, [ebp-000000C0h]
  '005394D4: mov [edx], eax
  '005394D6: mov ecx, [ebp-000000BCh]
  '005394DC: mov [edx+04h], ecx
  '005394DF: mov eax, [ebp-000000B8h]
  '005394E5: mov [edx+08h], eax
  '005394E8: mov ecx, [ebp-000000B4h]
  '005394EE: mov [edx+0Ch], ecx
  '005394F1: mov eax, 00000010h
  '005394F6: call 004081B0h
  '005394FB: mov edx, esp
  '005394FD: mov eax, [ebp-000000E0h]
  '00539503: mov [edx], eax
  '00539505: mov ecx, [ebp-000000DCh]
  '0053950B: mov [edx+04h], ecx
  '0053950E: mov eax, [ebp-000000D8h]
  '00539514: mov [edx+08h], eax
  '00539517: mov ecx, [ebp-000000D4h]
  '0053951D: mov [edx+0Ch], ecx
  '00539520: mov eax, 00000010h
  '00539525: call 004081B0h
  '0053952A: mov edx, esp
  '0053952C: mov eax, [ebp-00000100h]
  '00539532: mov [edx], eax
  '00539534: mov ecx, [ebp-000000FCh]
  '0053953A: mov [edx+04h], ecx
  '0053953D: mov eax, [ebp-000000F8h]
  '00539543: mov [edx+08h], eax
  '00539546: mov ecx, [ebp-000000F4h]
  '0053954C: mov [edx+0Ch], ecx
  '0053954F: mov eax, 00000010h
  '00539554: call 004081B0h
  '00539559: mov edx, esp
  '0053955B: mov eax, [ebp-00000120h]
  '00539561: mov [edx], eax
  '00539563: mov ecx, [ebp-0000011Ch]
  '00539569: mov [edx+04h], ecx
  '0053956C: mov eax, [ebp-00000118h]
  '00539572: mov [edx+08h], eax
  '00539575: mov ecx, [ebp-00000114h]
  '0053957B: mov [edx+0Ch], ecx
  '0053957E: push 00000004h
  '00539580: push 80011001h
  '00539585: mov edx, [ebp+08h]
  '00539588: mov eax, [edx]
  '0053958A: mov ecx, [ebp+08h]
  '0053958D: push ecx
  '0053958E: call [eax+00000318h]
  '00539594: push eax
  '00539595: lea edx, [ebp-40h]
  '00539598: push edx
  '00539599: call [004010E4h]
  '0053959F: push eax
  '005395A0: call [00401040h]
  '005395A6: add esp, 0000004Ch
  '005395A9: lea eax, [ebp-40h]
  '005395AC: push eax
  '005395AD: lea ecx, [ebp-3Ch]
  '005395B0: push ecx
  '005395B1: lea edx, [ebp-38h]
  '005395B4: push edx
  '005395B5: lea eax, [ebp-34h]
  '005395B8: push eax
  '005395B9: lea ecx, [ebp-30h]
  '005395BC: push ecx
  '005395BD: lea edx, [ebp-2Ch]
  '005395C0: push edx
  '005395C1: lea eax, [ebp-28h]
  '005395C4: push eax
  '005395C5: lea ecx, [ebp-24h]
  '005395C8: push ecx
  '005395C9: push 00000008h
  '005395CB: call [00401064h]
  '005395D1: add esp, 00000024h
  '005395D4: lea edx, [ebp-00000090h]
  '005395DA: push edx
  '005395DB: lea eax, [ebp-80h]
  '005395DE: push eax
  '005395DF: lea ecx, [ebp-70h]
  '005395E2: push ecx
  '005395E3: lea edx, [ebp-60h]
  '005395E6: push edx
  '005395E7: lea eax, [ebp-50h]
  '005395EA: push eax
  '005395EB: push 00000005h
  '005395ED: call [00401050h]
  '005395F3: add esp, 00000018h
  '005395F6: mov [ebp-04h], 00000007h
  '005395FD: call [00401104h]
  '00539603: mov [ebp-04h], 00000008h
  '0053960A: mov [ebp-00000098h], FFFFFFFFh
  '00539614: mov [ebp-000000A0h], 0000000Bh
  '0053961E: mov eax, 00000010h
  '00539623: call 004081B0h
  '00539628: mov ecx, esp
  '0053962A: mov edx, [ebp-000000A0h]
  '00539630: mov [ecx], edx
  '00539632: mov eax, [ebp-0000009Ch]
  '00539638: mov [ecx+04h], eax
  '0053963B: mov edx, [ebp-00000098h]
  '00539641: mov [ecx+08h], edx
  '00539644: mov eax, [ebp-00000094h]
  '0053964A: mov [ecx+0Ch], eax
  '0053964D: push 80010007h
  '00539652: mov ecx, [ebp+08h]
  '00539655: mov edx, [ecx]
  '00539657: mov eax, [ebp+08h]
  '0053965A: push eax
  '0053965B: call [edx+00000318h]
  '00539661: push eax
  '00539662: lea ecx, [ebp-24h]
  '00539665: push ecx
  '00539666: call [004010E4h]
  '0053966C: push eax
  '0053966D: call [0040139Ch]
  '00539673: lea ecx, [ebp-24h]
  '00539676: call [004013B8h]
  '0053967C: mov [ebp-10h], 00000000h
  '00539683: wait 
  '00539684: push 005396DAh
  '00539689: jmp 5396D9h
  '0053968B: lea edx, [ebp-40h]
  '0053968E: push edx
  '0053968F: lea eax, [ebp-3Ch]
  '00539692: push eax
  '00539693: lea ecx, [ebp-38h]
  '00539696: push ecx
  '00539697: lea edx, [ebp-34h]
  '0053969A: push edx
  '0053969B: lea eax, [ebp-30h]
  '0053969E: push eax
  '0053969F: lea ecx, [ebp-2Ch]
  '005396A2: push ecx
  '005396A3: lea edx, [ebp-28h]
  '005396A6: push edx
  '005396A7: lea eax, [ebp-24h]
  '005396AA: push eax
  '005396AB: push 00000008h
  '005396AD: call [00401064h]
  '005396B3: add esp, 00000024h
  '005396B6: lea ecx, [ebp-00000090h]
  '005396BC: push ecx
  '005396BD: lea edx, [ebp-80h]
  '005396C0: push edx
  '005396C1: lea eax, [ebp-70h]
  '005396C4: push eax
  '005396C5: lea ecx, [ebp-60h]
  '005396C8: push ecx
  '005396C9: lea edx, [ebp-50h]
  '005396CC: push edx
  '005396CD: push 00000005h
  '005396CF: call [00401050h]
  '005396D5: add esp, 00000018h
  '005396D8: ret 
End Sub
Private Sub Form__538C50
  '00538C50: push ebp
  '00538C51: mov ebp, esp
  '00538C53: sub esp, 0000000Ch
  '00538C56: push 004081B6h
  '00538C5B: mov eax, fs:[00h]
  '00538C61: push eax
  '00538C62: mov fs:[00000000h], esp
  '00538C69: sub esp, 00000008h
  '00538C6C: push ebx
  '00538C6D: push esi
  '00538C6E: push edi
  '00538C6F: mov [ebp-0Ch], esp
  '00538C72: mov [ebp-08h], 00407D30h
  '00538C79: mov eax, [ebp+08h]
  '00538C7C: mov ecx, eax
  '00538C7E: and ecx, 00000001h
  '00538C81: mov [ebp-04h], ecx
  '00538C84: and al, FEh
  '00538C86: push eax
  '00538C87: mov [ebp+08h], eax
  '00538C8A: mov edx, [eax]
  '00538C8C: call [edx+04h]
  '00538C8F: mov [ebp-04h], 00000000h
  '00538C96: mov eax, [ebp+08h]
  '00538C99: push eax
  '00538C9A: mov ecx, [eax]
  '00538C9C: call [ecx+08h]
  '00538C9F: mov eax, [ebp-04h]
  '00538CA2: mov ecx, [ebp-14h]
  '00538CA5: pop edi
  '00538CA6: pop esi
  '00538CA7: mov fs:[00000000h], ecx
  '00538CAE: pop ebx
  '00538CAF: mov esp, ebp
  '00538CB1: pop ebp
  '00538CB2: retn 000Ch
End Sub

