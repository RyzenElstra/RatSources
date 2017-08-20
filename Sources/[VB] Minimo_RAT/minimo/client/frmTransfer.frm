VERSION 5.00
Begin VB.Form frmTransfer
  Caption = "TF"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  Icon = "frmTransfer.frx":0
  LinkTopic = "Form2"
  MaxButton = 0   'False
  ClientLeft = 165
  ClientTop = 450
  ClientWidth = 5040
  ClientHeight = 2850
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
  Begin MSComctlLib.ListView lstQueue
    Left = 0
    Top = 0
    Width = 5055
    Height = 2580
    TabIndex = 2
  End
  Begin MSComctlLib.ImageList ImageList1
  End
  Begin VB.Timer Timer1
    Interval = 1000
    Left = 5640
    Top = 0
    Width = 18440
    Height = 3
  End
  Begin MSWinsockLib.Winsock wskTransfer
  End
  Begin MSComctlLib.ProgressBar ProgressBar1
    Left = 0
    Top = 2640
    Width = 1455
    Height = 255
    TabIndex = 0
  End
  Begin MSComctlLib.StatusBar StatusBar1
    Left = 0
    Top = 2595
    Width = 5040
    Height = 255
    TabIndex = 1
  End
  Begin VB.Menu file_manager
    Visible = 0   'False
    Caption = "File Manager"
    Begin VB.Menu cancel_transfer
      Caption = "Cancel transfer session"
    End
    Begin VB.Menu remove_queue
      Caption = "Remove from queue"
    End
  End
End

Attribute VB_Name = "frmTransfer"

Private Sub Form__520780
  '00520780: push ebp
  '00520781: mov ebp, esp
  '00520783: sub esp, 0000000Ch
  '00520786: push 004081B6h
  '0052078B: mov eax, fs:[00h]
  '00520791: push eax
  '00520792: mov fs:[00000000h], esp
  '00520799: sub esp, 0000010Ch
  '0052079F: push ebx
  '005207A0: push esi
  '005207A1: push edi
  '005207A2: mov [ebp-0Ch], esp
  '005207A5: mov [ebp-08h], 00406EB8h
  '005207AC: mov esi, [ebp+08h]
  '005207AF: mov eax, esi
  '005207B1: and eax, 00000001h
  '005207B4: mov [ebp-04h], eax
  '005207B7: and esi, FFFFFFFEh
  '005207BA: push esi
  '005207BB: mov [ebp+08h], esi
  '005207BE: mov ecx, [esi]
  '005207C0: call [ecx+04h]
  '005207C3: mov edx, [esi]
  '005207C5: lea eax, [ebp-20h]
  '005207C8: xor edi, edi
  '005207CA: push eax
  '005207CB: push esi
  '005207CC: mov [ebp-18h], edi
  '005207CF: mov [ebp-1Ch], edi
  '005207D2: mov [ebp-20h], edi
  '005207D5: mov [ebp-24h], edi
  '005207D8: mov [ebp-28h], edi
  '005207DB: mov [ebp-2Ch], edi
  '005207DE: mov [ebp-30h], edi
  '005207E1: mov [ebp-40h], edi
  '005207E4: mov [ebp-50h], edi
  '005207E7: mov [ebp-60h], edi
  '005207EA: mov [ebp-70h], edi
  '005207ED: mov [ebp-80h], edi
  '005207F0: mov [ebp-00000090h], edi
  '005207F6: mov [ebp-000000A0h], edi
  '005207FC: mov [ebp-000000B0h], edi
  '00520802: mov [ebp-000000E4h], edi
  '00520808: mov [ebp-000000E8h], edi
  '0052080E: mov [ebp-00000104h], edi
  '00520814: mov [ebp-00000108h], edi
  '0052081A: call [edx+00000218h]
  '00520820: cmp eax, edi
  '00520822: fclex 
  '00520824: jnl 520838h
  '00520826: push 00000218h
  '0052082B: push 004208E0h
  '00520830: push esi
  '00520831: push eax
  '00520832: call [004010A0h]
  '00520838: mov eax, [ebp-20h]
  '0052083B: lea ecx, [ebp-00000104h]
  '00520841: mov [ebp-20h], edi
  '00520844: mov edi, [004010E4h]
  '0052084A: push eax
  '0052084B: push ecx
  '0052084C: lea ebx, [esi+50h]
  '0052084F: call edi
  '00520851: push eax
  '00520852: lea edx, [ebp-00000108h]
  '00520858: push ebx
  '00520859: push edx
  '0052085A: push 0041F304h
  '0052085F: call [004010CCh]
  '00520865: test eax, eax
  '00520867: jz 0052092Dh
  '0052086D: mov eax, [ebx]
  '0052086F: push 0041E3FCh
  '00520874: push eax
  '00520875: call [00401278h]
  '0052087B: mov ecx, [ebx]
  '0052087D: mov dx, ax
  '00520880: neg dx
  '00520883: sbb edx, edx
  '00520885: push 00420F60h
  '0052088A: inc edx
  '0052088B: push ecx
  '0052088C: mov ebx, edx
  '0052088E: call [00401278h]
  '00520894: mov edx, [esi+50h]
  '00520897: neg ax
  '0052089A: sbb eax, eax
  '0052089C: push 0041FB8Ch
  '005208A1: inc eax
  '005208A2: push edx
  '005208A3: and ebx, eax
  '005208A5: neg ebx
  '005208A7: sbb ebx, ebx
  '005208A9: neg ebx
  '005208AB: call [00401278h]
  '005208B1: neg ax
  '005208B4: sbb eax, eax
  '005208B6: push 0041CE08h
  '005208BB: inc eax
  '005208BC: and ebx, eax
  '005208BE: mov eax, [esi+50h]
  '005208C1: neg ebx
  '005208C3: sbb ebx, ebx
  '005208C5: push eax
  '005208C6: neg ebx
  '005208C8: call [00401278h]
  '005208CE: neg ax
  '005208D1: sbb eax, eax
  '005208D3: inc eax
  '005208D4: test ebx, eax
  '005208D6: jnz 520912h
  '005208D8: mov ecx, [esi+50h]
  '005208DB: push 00000000h
  '005208DD: push 00420F70h
  '005208E2: lea edx, [ebp-40h]
  '005208E5: push ecx
  '005208E6: push edx
  '005208E7: call [00401368h]
  '005208ED: add esp, 00000010h
  '005208F0: push eax
  '005208F1: call [0040130Ch]
  '005208F7: mov [ebp-000000E8h], eax
  '005208FD: lea eax, [ebp-000000E8h]
  '00520903: push eax
  '00520904: call 004EB0B0h
  '00520909: lea ecx, [ebp-40h]
  '0052090C: call [00401030h]
  '00520912: lea ebx, [esi+50h]
  '00520915: lea ecx, [ebp-00000108h]
  '0052091B: push ebx
  '0052091C: push ecx
  '0052091D: push 0041F304h
  '00520922: call [00401150h]
  '00520928: jmp 00520865h
  '0052092D: sub esp, 00000010h
  '00520930: mov ecx, 0000000Ah
  '00520935: mov edx, esp
  '00520937: mov eax, 80020004h
  '0052093C: push 0042B0CCh
  '00520941: push 0041EA6Ch
  '00520946: mov [edx], ecx
  '00520948: mov ecx, [ebp-0000009Ch]
  '0052094E: push 0041EA58h
  '00520953: mov [edx+04h], ecx
  '00520956: mov [edx+08h], eax
  '00520959: mov eax, [ebp-00000094h]
  '0052095F: mov [edx+0Ch], eax
  '00520962: call [00401314h]
  '00520968: mov edx, eax
  '0052096A: lea ecx, [ebp-18h]
  '0052096D: call [00401378h]
  '00520973: mov ecx, [ebp-18h]
  '00520976: push ecx
  '00520977: call [00401044h]
  '0052097D: test eax, eax
  '0052097F: jle 5209B0h
  '00520981: mov edx, [ebp-18h]
  '00520984: mov ebx, [esi]
  '00520986: push edx
  '00520987: call [0040119Ch]
  '0052098D: push ecx
  '0052098E: fstp real4 ptr [esp]
  '00520991: push esi
  '00520992: call [ebx+00000084h]
  '00520998: test eax, eax
  '0052099A: fclex 
  '0052099C: jnl 5209B0h
  '0052099E: push 00000084h
  '005209A3: push 004208E0h
  '005209A8: push esi
  '005209A9: push eax
  '005209AA: call [004010A0h]
  '005209B0: sub esp, 00000010h
  '005209B3: mov ecx, 0000000Ah
  '005209B8: mov edx, esp
  '005209BA: mov eax, 80020004h
  '005209BF: push 0042B0E8h
  '005209C4: push 0041EA6Ch
  '005209C9: mov [edx], ecx
  '005209CB: mov ecx, [ebp-0000009Ch]
  '005209D1: push 0041EA58h
  '005209D6: mov [edx+04h], ecx
  '005209D9: mov [edx+08h], eax
  '005209DC: mov eax, [ebp-00000094h]
  '005209E2: mov [edx+0Ch], eax
  '005209E5: call [00401314h]
  '005209EB: mov edx, eax
  '005209ED: lea ecx, [ebp-18h]
  '005209F0: call [00401378h]
  '005209F6: mov ecx, [ebp-18h]
  '005209F9: push ecx
  '005209FA: call [00401044h]
  '00520A00: test eax, eax
  '00520A02: jle 520A33h
  '00520A04: mov edx, [ebp-18h]
  '00520A07: mov ebx, [esi]
  '00520A09: push edx
  '00520A0A: call [0040119Ch]
  '00520A10: push ecx
  '00520A11: fstp real4 ptr [esp]
  '00520A14: push esi
  '00520A15: call [ebx+0000008Ch]
  '00520A1B: test eax, eax
  '00520A1D: fclex 
  '00520A1F: jnl 520A33h
  '00520A21: push 0000008Ch
  '00520A26: push 004208E0h
  '00520A2B: push esi
  '00520A2C: push eax
  '00520A2D: call [004010A0h]
  '00520A33: mov eax, [54106Ch]
  '00520A38: test eax, eax
  '00520A3A: jnz 520A51h
  '00520A3C: push 0054106Ch
  '00520A41: push 00411238h
  '00520A46: call [004012B8h]
  '00520A4C: mov eax, [54106Ch]
  '00520A51: mov ecx, [eax]
  '00520A53: push eax
  '00520A54: call [ecx+00000328h]
  '00520A5A: lea edx, [ebp-20h]
  '00520A5D: push eax
  '00520A5E: push edx
  '00520A5F: call edi
  '00520A61: mov ebx, eax
  '00520A63: lea ecx, [ebp-000000E4h]
  '00520A69: push ecx
  '00520A6A: push ebx
  '00520A6B: mov eax, [ebx]
  '00520A6D: call [eax+000000E0h]
  '00520A73: test eax, eax
  '00520A75: fclex 
  '00520A77: jnl 520A8Bh
  '00520A79: push 000000E0h
  '00520A7E: push 0041E108h
  '00520A83: push ebx
  '00520A84: push eax
  '00520A85: call [004010A0h]
  '00520A8B: xor ebx, ebx
  '00520A8D: cmp word ptr [ebp-000000E4h], 0001h
  '00520A95: lea ecx, [ebp-20h]
  '00520A98: setz bl
  '00520A9B: neg ebx
  '00520A9D: call [004013B8h]
  '00520AA3: test bx, bx
  '00520AA6: jz 520ACCh
  '00520AA8: push 00000000h
  '00520AAA: push 0041E3ECh
  '00520AAF: push esi
  '00520AB0: call [0040137Ch]
  '00520AB6: lea edx, [ebp-20h]
  '00520AB9: push eax
  '00520ABA: push edx
  '00520ABB: call edi
  '00520ABD: push eax
  '00520ABE: call 004F8E60h
  '00520AC3: lea ecx, [ebp-20h]
  '00520AC6: call [004013B8h]
  '00520ACC: mov ebx, [00401104h]
  '00520AD2: mov word ptr [esi+48h], FFFFh
  '00520AD8: call ebx
  '00520ADA: mov edx, 0042B104h
  '00520ADF: lea ecx, [ebp-1Ch]
  '00520AE2: call [004012D8h]
  '00520AE8: mov eax, [esi]
  '00520AEA: lea ecx, [ebp-1Ch]
  '00520AED: push ecx
  '00520AEE: push esi
  '00520AEF: call [eax+00000738h]
  '00520AF5: lea ecx, [ebp-1Ch]
  '00520AF8: call [004013B4h]
  '00520AFE: call ebx
  '00520B00: mov eax, [54106Ch]
  '00520B05: test eax, eax
  '00520B07: jnz 520B1Eh
  '00520B09: push 0054106Ch
  '00520B0E: push 00411238h
  '00520B13: call [004012B8h]
  '00520B19: mov eax, [54106Ch]
  '00520B1E: mov edx, [eax]
  '00520B20: push eax
  '00520B21: call [edx+000003A8h]
  '00520B27: push eax
  '00520B28: lea eax, [ebp-20h]
  '00520B2B: push eax
  '00520B2C: call edi
  '00520B2E: mov ebx, eax
  '00520B30: lea edx, [ebp-000000E4h]
  '00520B36: push edx
  '00520B37: push ebx
  '00520B38: mov ecx, [ebx]
  '00520B3A: call [ecx+000000E0h]
  '00520B40: test eax, eax
  '00520B42: fclex 
  '00520B44: jnl 520B58h
  '00520B46: push 000000E0h
  '00520B4B: push 0041E108h
  '00520B50: push ebx
  '00520B51: push eax
  '00520B52: call [004010A0h]
  '00520B58: movsx eax, word ptr [ebp-000000E4h]
  '00520B5F: mov ecx, [esi]
  '00520B61: lea edx, [ebp-000000E8h]
  '00520B67: push edx
  '00520B68: push esi
  '00520B69: mov [ebp-000000E8h], eax
  '00520B6F: call [ecx+00000704h]
  '00520B75: lea ecx, [ebp-20h]
  '00520B78: call [004013B8h]
  '00520B7E: mov eax, [541058h]
  '00520B83: push eax
  '00520B84: push 00000000h
  '00520B86: call [00401184h]
  '00520B8C: test eax, eax
  '00520B8E: jz 00520F6Bh
  '00520B94: mov ecx, [esi]
  '00520B96: push 0041EFA8h
  '00520B9B: push 00000000h
  '00520B9D: push 00000007h
  '00520B9F: push esi
  '00520BA0: call [ecx+0000030Ch]
  '00520BA6: lea edx, [ebp-20h]
  '00520BA9: push eax
  '00520BAA: push edx
  '00520BAB: call edi
  '00520BAD: mov ebx, [004011E4h]
  '00520BB3: push eax
  '00520BB4: lea eax, [ebp-40h]
  '00520BB7: push eax
  '00520BB8: call ebx
  '00520BBA: add esp, 00000010h
  '00520BBD: push eax
  '00520BBE: call [004011C8h]
  '00520BC4: lea ecx, [ebp-24h]
  '00520BC7: push eax
  '00520BC8: push ecx
  '00520BC9: call edi
  '00520BCB: mov ecx, 80020004h
  '00520BD0: mov edx, 0000000Ah
  '00520BD5: mov [ebp-00000088h], ecx
  '00520BDB: mov [ebp-78h], ecx
  '00520BDE: mov [ebp-68h], ecx
  '00520BE1: mov [ebp-58h], ecx
  '00520BE4: mov [ebp-48h], ecx
  '00520BE7: lea ecx, [ebp-28h]
  '00520BEA: push ecx
  '00520BEB: lea ecx, [ebp-00000090h]
  '00520BF1: push ecx
  '00520BF2: lea ecx, [ebp-80h]
  '00520BF5: push ecx
  '00520BF6: lea ecx, [ebp-70h]
  '00520BF9: push ecx
  '00520BFA: lea ecx, [ebp-60h]
  '00520BFD: push ecx
  '00520BFE: lea ecx, [ebp-50h]
  '00520C01: mov [ebp-00000090h], edx
  '00520C07: mov [ebp-80h], edx
  '00520C0A: mov [ebp-70h], edx
  '00520C0D: mov [ebp-60h], edx
  '00520C10: mov [ebp-50h], edx
  '00520C13: mov edx, [eax]
  '00520C15: push ecx
  '00520C16: push eax
  '00520C17: mov [ebp-000000ECh], eax
  '00520C1D: call [edx+28h]
  '00520C20: test eax, eax
  '00520C22: fclex 
  '00520C24: jnl 520C3Bh
  '00520C26: mov edx, [ebp-000000ECh]
  '00520C2C: push 00000028h
  '00520C2E: push 0041EFA8h
  '00520C33: push edx
  '00520C34: push eax
  '00520C35: call [004010A0h]
  '00520C3B: mov eax, [ebp-28h]
  '00520C3E: mov edx, [00541058h]
  '00520C44: push edx
  '00520C45: push eax
  '00520C46: mov ecx, [eax]
  '00520C48: mov [ebp-000000F4h], eax
  '00520C4E: call [ecx+28h]
  '00520C51: test eax, eax
  '00520C53: fclex 
  '00520C55: jnl 520C6Ch
  '00520C57: mov ecx, [ebp-000000F4h]
  '00520C5D: push 00000028h
  '00520C5F: push 0041E438h
  '00520C64: push ecx
  '00520C65: push eax
  '00520C66: call [004010A0h]
  '00520C6C: lea edx, [ebp-28h]
  '00520C6F: lea eax, [ebp-24h]
  '00520C72: push edx
  '00520C73: lea ecx, [ebp-20h]
  '00520C76: push eax
  '00520C77: push ecx
  '00520C78: push 00000003h
  '00520C7A: call [00401064h]
  '00520C80: lea edx, [ebp-00000090h]
  '00520C86: lea eax, [ebp-80h]
  '00520C89: push edx
  '00520C8A: lea ecx, [ebp-70h]
  '00520C8D: push eax
  '00520C8E: lea edx, [ebp-60h]
  '00520C91: push ecx
  '00520C92: lea eax, [ebp-50h]
  '00520C95: push edx
  '00520C96: lea ecx, [ebp-40h]
  '00520C99: push eax
  '00520C9A: push ecx
  '00520C9B: push 00000006h
  '00520C9D: call [00401050h]
  '00520CA3: mov edx, [esi]
  '00520CA5: add esp, 0000002Ch
  '00520CA8: push 0041EFA8h
  '00520CAD: push 00000000h
  '00520CAF: push 00000007h
  '00520CB1: push esi
  '00520CB2: call [edx+0000030Ch]
  '00520CB8: push eax
  '00520CB9: lea eax, [ebp-28h]
  '00520CBC: push eax
  '00520CBD: call edi
  '00520CBF: lea ecx, [ebp-50h]
  '00520CC2: push eax
  '00520CC3: push ecx
  '00520CC4: call ebx
  '00520CC6: add esp, 00000010h
  '00520CC9: push eax
  '00520CCA: call [004011C8h]
  '00520CD0: lea edx, [ebp-2Ch]
  '00520CD3: push eax
  '00520CD4: push edx
  '00520CD5: call edi
  '00520CD7: push 0041EFA8h
  '00520CDC: mov [ebp-000000F4h], eax
  '00520CE2: mov eax, [esi]
  '00520CE4: push 00000000h
  '00520CE6: push 00000007h
  '00520CE8: push esi
  '00520CE9: call [eax+0000030Ch]
  '00520CEF: lea ecx, [ebp-20h]
  '00520CF2: push eax
  '00520CF3: push ecx
  '00520CF4: call edi
  '00520CF6: lea edx, [ebp-40h]
  '00520CF9: push eax
  '00520CFA: push edx
  '00520CFB: call ebx
  '00520CFD: add esp, 00000010h
  '00520D00: push eax
  '00520D01: call [004011C8h]
  '00520D07: push eax
  '00520D08: lea eax, [ebp-24h]
  '00520D0B: push eax
  '00520D0C: call edi
  '00520D0E: mov ecx, [eax]
  '00520D10: lea edx, [ebp-000000E8h]
  '00520D16: push edx
  '00520D17: push eax
  '00520D18: mov [ebp-000000ECh], eax
  '00520D1E: call [ecx+1Ch]
  '00520D21: test eax, eax
  '00520D23: fclex 
  '00520D25: jnl 520D3Ch
  '00520D27: mov ecx, [ebp-000000ECh]
  '00520D2D: push 0000001Ch
  '00520D2F: push 0041EFA8h
  '00520D34: push ecx
  '00520D35: push eax
  '00520D36: call [004010A0h]
  '00520D3C: mov edx, [ebp-000000E8h]
  '00520D42: mov eax, [ebp-000000F4h]
  '00520D48: mov [ebp-58h], edx
  '00520D4B: lea edx, [ebp-30h]
  '00520D4E: push edx
  '00520D4F: lea edx, [ebp-60h]
  '00520D52: mov [ebp-60h], 00000003h
  '00520D59: mov ecx, [eax]
  '00520D5B: push edx
  '00520D5C: push eax
  '00520D5D: call [ecx+30h]
  '00520D60: test eax, eax
  '00520D62: fclex 
  '00520D64: jnl 520D7Bh
  '00520D66: mov ecx, [ebp-000000F4h]
  '00520D6C: push 00000030h
  '00520D6E: push 0041EFA8h
  '00520D73: push ecx
  '00520D74: push eax
  '00520D75: call [004010A0h]
  '00520D7B: mov ecx, [ebp-30h]
  '00520D7E: sub esp, 00000010h
  '00520D81: mov [ebp-000000FCh], ecx
  '00520D87: mov eax, 00000002h
  '00520D8C: mov edx, [ecx]
  '00520D8E: mov ecx, esp
  '00520D90: mov [ecx], eax
  '00520D92: mov eax, [ebp-000000ACh]
  '00520D98: mov [ecx+04h], eax
  '00520D9B: mov eax, 00000001h
  '00520DA0: mov [ecx+08h], eax
  '00520DA3: mov eax, [ebp-000000A4h]
  '00520DA9: mov [ecx+0Ch], eax
  '00520DAC: mov ecx, [ebp-30h]
  '00520DAF: push ecx
  '00520DB0: call [edx+68h]
  '00520DB3: test eax, eax
  '00520DB5: fclex 
  '00520DB7: jnl 520DCEh
  '00520DB9: mov edx, [ebp-000000FCh]
  '00520DBF: push 00000068h
  '00520DC1: push 0041E438h
  '00520DC6: push edx
  '00520DC7: push eax
  '00520DC8: call [004010A0h]
  '00520DCE: lea eax, [ebp-30h]
  '00520DD1: lea ecx, [ebp-2Ch]
  '00520DD4: push eax
  '00520DD5: lea edx, [ebp-28h]
  '00520DD8: push ecx
  '00520DD9: lea eax, [ebp-24h]
  '00520DDC: push edx
  '00520DDD: lea ecx, [ebp-20h]
  '00520DE0: push eax
  '00520DE1: push ecx
  '00520DE2: push 00000005h
  '00520DE4: call [00401064h]
  '00520DEA: lea edx, [ebp-60h]
  '00520DED: lea eax, [ebp-50h]
  '00520DF0: push edx
  '00520DF1: lea ecx, [ebp-40h]
  '00520DF4: push eax
  '00520DF5: push ecx
  '00520DF6: push 00000003h
  '00520DF8: call [00401050h]
  '00520DFE: mov edx, [esi]
  '00520E00: add esp, 00000028h
  '00520E03: push 0041EFA8h
  '00520E08: push 00000000h
  '00520E0A: push 00000007h
  '00520E0C: push esi
  '00520E0D: call [edx+0000030Ch]
  '00520E13: push eax
  '00520E14: lea eax, [ebp-28h]
  '00520E17: push eax
  '00520E18: call edi
  '00520E1A: lea ecx, [ebp-50h]
  '00520E1D: push eax
  '00520E1E: push ecx
  '00520E1F: call ebx
  '00520E21: add esp, 00000010h
  '00520E24: push eax
  '00520E25: call [004011C8h]
  '00520E2B: lea edx, [ebp-2Ch]
  '00520E2E: push eax
  '00520E2F: push edx
  '00520E30: call edi
  '00520E32: push 0041EFA8h
  '00520E37: mov [ebp-000000F4h], eax
  '00520E3D: mov eax, [esi]
  '00520E3F: push 00000000h
  '00520E41: push 00000007h
  '00520E43: push esi
  '00520E44: call [eax+0000030Ch]
  '00520E4A: lea ecx, [ebp-20h]
  '00520E4D: push eax
  '00520E4E: push ecx
  '00520E4F: call edi
  '00520E51: lea edx, [ebp-40h]
  '00520E54: push eax
  '00520E55: push edx
  '00520E56: call ebx
  '00520E58: add esp, 00000010h
  '00520E5B: push eax
  '00520E5C: call [004011C8h]
  '00520E62: push eax
  '00520E63: lea eax, [ebp-24h]
  '00520E66: push eax
  '00520E67: call edi
  '00520E69: mov ecx, [eax]
  '00520E6B: lea edx, [ebp-000000E8h]
  '00520E71: push edx
  '00520E72: push eax
  '00520E73: mov [ebp-000000ECh], eax
  '00520E79: call [ecx+1Ch]
  '00520E7C: test eax, eax
  '00520E7E: fclex 
  '00520E80: jnl 520E97h
  '00520E82: mov ecx, [ebp-000000ECh]
  '00520E88: push 0000001Ch
  '00520E8A: push 0041EFA8h
  '00520E8F: push ecx
  '00520E90: push eax
  '00520E91: call [004010A0h]
  '00520E97: mov edx, [ebp-000000E8h]
  '00520E9D: mov eax, [ebp-000000F4h]
  '00520EA3: mov [ebp-58h], edx
  '00520EA6: lea edx, [ebp-30h]
  '00520EA9: push edx
  '00520EAA: lea edx, [ebp-60h]
  '00520EAD: mov [ebp-60h], 00000003h
  '00520EB4: mov ecx, [eax]
  '00520EB6: push edx
  '00520EB7: push eax
  '00520EB8: call [ecx+30h]
  '00520EBB: test eax, eax
  '00520EBD: fclex 
  '00520EBF: jnl 520ED6h
  '00520EC1: mov ecx, [ebp-000000F4h]
  '00520EC7: push 00000030h
  '00520EC9: push 0041EFA8h
  '00520ECE: push ecx
  '00520ECF: push eax
  '00520ED0: call [004010A0h]
  '00520ED6: mov ecx, [ebp-30h]
  '00520ED9: sub esp, 00000010h
  '00520EDC: mov [ebp-000000FCh], ecx
  '00520EE2: mov eax, 00000002h
  '00520EE7: mov edx, [ecx]
  '00520EE9: mov ecx, esp
  '00520EEB: mov [ecx], eax
  '00520EED: mov eax, [ebp-000000ACh]
  '00520EF3: mov [ecx+04h], eax
  '00520EF6: mov eax, 00000001h
  '00520EFB: mov [ecx+08h], eax
  '00520EFE: mov eax, [ebp-000000A4h]
  '00520F04: mov [ecx+0Ch], eax
  '00520F07: mov ecx, [ebp-30h]
  '00520F0A: push ecx
  '00520F0B: call [edx+70h]
  '00520F0E: test eax, eax
  '00520F10: fclex 
  '00520F12: jnl 520F29h
  '00520F14: mov edx, [ebp-000000FCh]
  '00520F1A: push 00000070h
  '00520F1C: push 0041E438h
  '00520F21: push edx
  '00520F22: push eax
  '00520F23: call [004010A0h]
  '00520F29: lea eax, [ebp-30h]
  '00520F2C: lea ecx, [ebp-2Ch]
  '00520F2F: push eax
  '00520F30: lea edx, [ebp-28h]
  '00520F33: push ecx
  '00520F34: lea eax, [ebp-24h]
  '00520F37: push edx
  '00520F38: lea ecx, [ebp-20h]
  '00520F3B: push eax
  '00520F3C: push ecx
  '00520F3D: push 00000005h
  '00520F3F: call [00401064h]
  '00520F45: lea edx, [ebp-60h]
  '00520F48: lea eax, [ebp-50h]
  '00520F4B: push edx
  '00520F4C: lea ecx, [ebp-40h]
  '00520F4F: push eax
  '00520F50: push ecx
  '00520F51: push 00000003h
  '00520F53: call [00401050h]
  '00520F59: add esp, 00000028h
  '00520F5C: xor edx, edx
  '00520F5E: mov ecx, 00541058h
  '00520F63: call [004012D8h]
  '00520F69: jmp 520F71h
  '00520F6B: mov ebx, [004011E4h]
  '00520F71: mov edx, [0054105Ch]
  '00520F77: push edx
  '00520F78: push 00000000h
  '00520F7A: call [00401184h]
  '00520F80: test eax, eax
  '00520F82: jz 00521357h
  '00520F88: mov eax, [esi]
  '00520F8A: push 0041EFA8h
  '00520F8F: push 00000000h
  '00520F91: push 00000007h
  '00520F93: push esi
  '00520F94: call [eax+0000030Ch]
  '00520F9A: lea ecx, [ebp-20h]
  '00520F9D: push eax
  '00520F9E: push ecx
  '00520F9F: call edi
  '00520FA1: lea edx, [ebp-40h]
  '00520FA4: push eax
  '00520FA5: push edx
  '00520FA6: call ebx
  '00520FA8: add esp, 00000010h
  '00520FAB: push eax
  '00520FAC: call [004011C8h]
  '00520FB2: push eax
  '00520FB3: lea eax, [ebp-24h]
  '00520FB6: push eax
  '00520FB7: call edi
  '00520FB9: mov edx, 80020004h
  '00520FBE: mov ecx, 0000000Ah
  '00520FC3: mov [ebp-00000088h], edx
  '00520FC9: mov [ebp-78h], edx
  '00520FCC: mov [ebp-68h], edx
  '00520FCF: mov [ebp-58h], edx
  '00520FD2: mov [ebp-48h], edx
  '00520FD5: lea edx, [ebp-28h]
  '00520FD8: push edx
  '00520FD9: lea edx, [ebp-00000090h]
  '00520FDF: push edx
  '00520FE0: lea edx, [ebp-80h]
  '00520FE3: push edx
  '00520FE4: lea edx, [ebp-70h]
  '00520FE7: push edx
  '00520FE8: lea edx, [ebp-60h]
  '00520FEB: push edx
  '00520FEC: lea edx, [ebp-50h]
  '00520FEF: mov [ebp-00000090h], ecx
  '00520FF5: mov [ebp-80h], ecx
  '00520FF8: mov [ebp-70h], ecx
  '00520FFB: mov [ebp-60h], ecx
  '00520FFE: mov [ebp-50h], ecx
  '00521001: mov ecx, [eax]
  '00521003: push edx
  '00521004: push eax
  '00521005: mov [ebp-000000ECh], eax
  '0052100B: call [ecx+28h]
  '0052100E: test eax, eax
  '00521010: fclex 
  '00521012: jnl 521029h
  '00521014: mov ecx, [ebp-000000ECh]
  '0052101A: push 00000028h
  '0052101C: push 0041EFA8h
  '00521021: push ecx
  '00521022: push eax
  '00521023: call [004010A0h]
  '00521029: mov eax, [ebp-28h]
  '0052102C: mov ecx, [0054105Ch]
  '00521032: push ecx
  '00521033: push eax
  '00521034: mov edx, [eax]
  '00521036: mov [ebp-000000F4h], eax
  '0052103C: call [edx+28h]
  '0052103F: test eax, eax
  '00521041: fclex 
  '00521043: jnl 52105Ah
  '00521045: mov edx, [ebp-000000F4h]
  '0052104B: push 00000028h
  '0052104D: push 0041E438h
  '00521052: push edx
  '00521053: push eax
  '00521054: call [004010A0h]
  '0052105A: lea eax, [ebp-28h]
  '0052105D: lea ecx, [ebp-24h]
  '00521060: push eax
  '00521061: lea edx, [ebp-20h]
  '00521064: push ecx
  '00521065: push edx
  '00521066: push 00000003h
  '00521068: call [00401064h]
  '0052106E: lea eax, [ebp-00000090h]
  '00521074: lea ecx, [ebp-80h]
  '00521077: push eax
  '00521078: lea edx, [ebp-70h]
  '0052107B: push ecx
  '0052107C: lea eax, [ebp-60h]
  '0052107F: push edx
  '00521080: lea ecx, [ebp-50h]
  '00521083: push eax
  '00521084: lea edx, [ebp-40h]
  '00521087: push ecx
  '00521088: push edx
  '00521089: push 00000006h
  '0052108B: call [00401050h]
  '00521091: mov eax, [esi]
  '00521093: add esp, 0000002Ch
  '00521096: push 0041EFA8h
  '0052109B: push 00000000h
  '0052109D: push 00000007h
  '0052109F: push esi
  '005210A0: call [eax+0000030Ch]
  '005210A6: lea ecx, [ebp-28h]
  '005210A9: push eax
  '005210AA: push ecx
  '005210AB: call edi
  '005210AD: lea edx, [ebp-50h]
  '005210B0: push eax
  '005210B1: push edx
  '005210B2: call ebx
  '005210B4: add esp, 00000010h
  '005210B7: push eax
  '005210B8: call [004011C8h]
  '005210BE: push eax
  '005210BF: lea eax, [ebp-2Ch]
  '005210C2: push eax
  '005210C3: call edi
  '005210C5: mov ecx, [esi]
  '005210C7: push 0041EFA8h
  '005210CC: push 00000000h
  '005210CE: push 00000007h
  '005210D0: push esi
  '005210D1: mov [ebp-000000F4h], eax
  '005210D7: call [ecx+0000030Ch]
  '005210DD: lea edx, [ebp-20h]
  '005210E0: push eax
  '005210E1: push edx
  '005210E2: call edi
  '005210E4: push eax
  '005210E5: lea eax, [ebp-40h]
  '005210E8: push eax
  '005210E9: call ebx
  '005210EB: add esp, 00000010h
  '005210EE: push eax
  '005210EF: call [004011C8h]
  '005210F5: lea ecx, [ebp-24h]
  '005210F8: push eax
  '005210F9: push ecx
  '005210FA: call edi
  '005210FC: mov edx, [eax]
  '005210FE: lea ecx, [ebp-000000E8h]
  '00521104: push ecx
  '00521105: push eax
  '00521106: mov [ebp-000000ECh], eax
  '0052110C: call [edx+1Ch]
  '0052110F: test eax, eax
  '00521111: fclex 
  '00521113: jnl 52112Ah
  '00521115: mov edx, [ebp-000000ECh]
  '0052111B: push 0000001Ch
  '0052111D: push 0041EFA8h
  '00521122: push edx
  '00521123: push eax
  '00521124: call [004010A0h]
  '0052112A: mov eax, [ebp-000000E8h]
  '00521130: lea edx, [ebp-30h]
  '00521133: mov [ebp-58h], eax
  '00521136: mov eax, [ebp-000000F4h]
  '0052113C: push edx
  '0052113D: lea edx, [ebp-60h]
  '00521140: mov [ebp-60h], 00000003h
  '00521147: mov ecx, [eax]
  '00521149: push edx
  '0052114A: push eax
  '0052114B: call [ecx+30h]
  '0052114E: test eax, eax
  '00521150: fclex 
  '00521152: jnl 521169h
  '00521154: mov ecx, [ebp-000000F4h]
  '0052115A: push 00000030h
  '0052115C: push 0041EFA8h
  '00521161: push ecx
  '00521162: push eax
  '00521163: call [004010A0h]
  '00521169: mov ecx, [ebp-30h]
  '0052116C: sub esp, 00000010h
  '0052116F: mov [ebp-000000FCh], ecx
  '00521175: mov eax, 00000002h
  '0052117A: mov edx, [ecx]
  '0052117C: mov ecx, esp
  '0052117E: mov [ecx], eax
  '00521180: mov eax, [ebp-000000ACh]
  '00521186: mov [ecx+04h], eax
  '00521189: mov eax, 00000002h
  '0052118E: mov [ecx+08h], eax
  '00521191: mov eax, [ebp-000000A4h]
  '00521197: mov [ecx+0Ch], eax
  '0052119A: mov ecx, [ebp-30h]
  '0052119D: push ecx
  '0052119E: call [edx+68h]
  '005211A1: test eax, eax
  '005211A3: fclex 
  '005211A5: jnl 5211BCh
  '005211A7: mov edx, [ebp-000000FCh]
  '005211AD: push 00000068h
  '005211AF: push 0041E438h
  '005211B4: push edx
  '005211B5: push eax
  '005211B6: call [004010A0h]
  '005211BC: lea eax, [ebp-30h]
  '005211BF: lea ecx, [ebp-2Ch]
  '005211C2: push eax
  '005211C3: lea edx, [ebp-28h]
  '005211C6: push ecx
  '005211C7: lea eax, [ebp-24h]
  '005211CA: push edx
  '005211CB: lea ecx, [ebp-20h]
  '005211CE: push eax
  '005211CF: push ecx
  '005211D0: push 00000005h
  '005211D2: call [00401064h]
  '005211D8: lea edx, [ebp-60h]
  '005211DB: lea eax, [ebp-50h]
  '005211DE: push edx
  '005211DF: lea ecx, [ebp-40h]
  '005211E2: push eax
  '005211E3: push ecx
  '005211E4: push 00000003h
  '005211E6: call [00401050h]
  '005211EC: mov edx, [esi]
  '005211EE: add esp, 00000028h
  '005211F1: push 0041EFA8h
  '005211F6: push 00000000h
  '005211F8: push 00000007h
  '005211FA: push esi
  '005211FB: call [edx+0000030Ch]
  '00521201: push eax
  '00521202: lea eax, [ebp-28h]
  '00521205: push eax
  '00521206: call edi
  '00521208: lea ecx, [ebp-50h]
  '0052120B: push eax
  '0052120C: push ecx
  '0052120D: call ebx
  '0052120F: add esp, 00000010h
  '00521212: push eax
  '00521213: call [004011C8h]
  '00521219: lea edx, [ebp-2Ch]
  '0052121C: push eax
  '0052121D: push edx
  '0052121E: call edi
  '00521220: push 0041EFA8h
  '00521225: mov [ebp-000000F4h], eax
  '0052122B: mov eax, [esi]
  '0052122D: push 00000000h
  '0052122F: push 00000007h
  '00521231: push esi
  '00521232: call [eax+0000030Ch]
  '00521238: lea ecx, [ebp-20h]
  '0052123B: push eax
  '0052123C: push ecx
  '0052123D: call edi
  '0052123F: lea edx, [ebp-40h]
  '00521242: push eax
  '00521243: push edx
  '00521244: call ebx
  '00521246: add esp, 00000010h
  '00521249: push eax
  '0052124A: call [004011C8h]
  '00521250: push eax
  '00521251: lea eax, [ebp-24h]
  '00521254: push eax
  '00521255: call edi
  '00521257: mov ecx, [eax]
  '00521259: lea edx, [ebp-000000E8h]
  '0052125F: push edx
  '00521260: push eax
  '00521261: mov [ebp-000000ECh], eax
  '00521267: call [ecx+1Ch]
  '0052126A: test eax, eax
  '0052126C: fclex 
  '0052126E: jnl 521285h
  '00521270: mov ecx, [ebp-000000ECh]
  '00521276: push 0000001Ch
  '00521278: push 0041EFA8h
  '0052127D: push ecx
  '0052127E: push eax
  '0052127F: call [004010A0h]
  '00521285: mov edx, [ebp-000000E8h]
  '0052128B: mov eax, [ebp-000000F4h]
  '00521291: mov [ebp-58h], edx
  '00521294: lea edx, [ebp-30h]
  '00521297: push edx
  '00521298: lea edx, [ebp-60h]
  '0052129B: mov [ebp-60h], 00000003h
  '005212A2: mov ecx, [eax]
  '005212A4: push edx
  '005212A5: push eax
  '005212A6: call [ecx+30h]
  '005212A9: test eax, eax
  '005212AB: fclex 
  '005212AD: jnl 5212C4h
  '005212AF: mov ecx, [ebp-000000F4h]
  '005212B5: push 00000030h
  '005212B7: push 0041EFA8h
  '005212BC: push ecx
  '005212BD: push eax
  '005212BE: call [004010A0h]
  '005212C4: mov ecx, [ebp-30h]
  '005212C7: sub esp, 00000010h
  '005212CA: mov [ebp-000000FCh], ecx
  '005212D0: mov eax, 00000002h
  '005212D5: mov edx, [ecx]
  '005212D7: mov ecx, esp
  '005212D9: mov [ecx], eax
  '005212DB: mov eax, [ebp-000000ACh]
  '005212E1: mov [ecx+04h], eax
  '005212E4: mov eax, 00000002h
  '005212E9: mov [ecx+08h], eax
  '005212EC: mov eax, [ebp-000000A4h]
  '005212F2: mov [ecx+0Ch], eax
  '005212F5: mov ecx, [ebp-30h]
  '005212F8: push ecx
  '005212F9: call [edx+70h]
  '005212FC: test eax, eax
  '005212FE: fclex 
  '00521300: jnl 521317h
  '00521302: mov edx, [ebp-000000FCh]
  '00521308: push 00000070h
  '0052130A: push 0041E438h
  '0052130F: push edx
  '00521310: push eax
  '00521311: call [004010A0h]
  '00521317: lea eax, [ebp-30h]
  '0052131A: lea ecx, [ebp-2Ch]
  '0052131D: push eax
  '0052131E: lea edx, [ebp-28h]
  '00521321: push ecx
  '00521322: lea eax, [ebp-24h]
  '00521325: push edx
  '00521326: lea ecx, [ebp-20h]
  '00521329: push eax
  '0052132A: push ecx
  '0052132B: push 00000005h
  '0052132D: call [00401064h]
  '00521333: lea edx, [ebp-60h]
  '00521336: lea eax, [ebp-50h]
  '00521339: push edx
  '0052133A: lea ecx, [ebp-40h]
  '0052133D: push eax
  '0052133E: push ecx
  '0052133F: push 00000003h
  '00521341: call [00401050h]
  '00521347: add esp, 00000028h
  '0052134A: xor edx, edx
  '0052134C: mov ecx, 0054105Ch
  '00521351: call [004012D8h]
  '00521357: mov edx, [esi]
  '00521359: push 00421124h
  '0052135E: push 00000000h
  '00521360: push 00000002h
  '00521362: push esi
  '00521363: call [edx+0000030Ch]
  '00521369: push eax
  '0052136A: lea eax, [ebp-24h]
  '0052136D: push eax
  '0052136E: call edi
  '00521370: lea ecx, [ebp-50h]
  '00521373: push eax
  '00521374: push ecx
  '00521375: call ebx
  '00521377: add esp, 00000010h
  '0052137A: push eax
  '0052137B: call [004011C8h]
  '00521381: lea edx, [ebp-28h]
  '00521384: push eax
  '00521385: push edx
  '00521386: call edi
  '00521388: lea edx, [ebp-2Ch]
  '0052138B: mov [ebp-58h], 00000001h
  '00521392: push edx
  '00521393: lea edx, [ebp-60h]
  '00521396: mov [ebp-60h], 00000002h
  '0052139D: mov ecx, [eax]
  '0052139F: push edx
  '005213A0: push eax
  '005213A1: mov [ebp-000000ECh], eax
  '005213A7: call [ecx+24h]
  '005213AA: test eax, eax
  '005213AC: fclex 
  '005213AE: jnl 5213C5h
  '005213B0: mov ecx, [ebp-000000ECh]
  '005213B6: push 00000024h
  '005213B8: push 00421124h
  '005213BD: push ecx
  '005213BE: push eax
  '005213BF: call [004010A0h]
  '005213C5: mov eax, [ebp-2Ch]
  '005213C8: push 00000000h
  '005213CA: mov [ebp-000000F4h], eax
  '005213D0: push 80010005h
  '005213D5: mov edx, [eax]
  '005213D7: mov eax, [esi]
  '005213D9: push esi
  '005213DA: mov [ebp-00000120h], edx
  '005213E0: call [eax+0000030Ch]
  '005213E6: lea ecx, [ebp-20h]
  '005213E9: push eax
  '005213EA: push ecx
  '005213EB: call edi
  '005213ED: lea edx, [ebp-40h]
  '005213F0: push eax
  '005213F1: push edx
  '005213F2: call ebx
  '005213F4: add esp, 00000010h
  '005213F7: push eax
  '005213F8: call [004011DCh]
  '005213FE: fsub real4 ptr [00406EB4h]
  '00521404: mov esi, [ebp-000000F4h]
  '0052140A: push ecx
  '0052140B: fstsw ax
  '0052140D: test al, 0Dh
  '0052140F: jnz 00521503h
  '00521415: fstp real4 ptr [esp]
  '00521418: mov eax, [ebp-00000120h]
  '0052141E: push esi
  '0052141F: call [eax+60h]
  '00521422: test eax, eax
  '00521424: fclex 
  '00521426: jnl 521437h
  '00521428: push 00000060h
  '0052142A: push 00421134h
  '0052142F: push esi
  '00521430: push eax
  '00521431: call [004010A0h]
  '00521437: lea ecx, [ebp-2Ch]
  '0052143A: lea edx, [ebp-28h]
  '0052143D: push ecx
  '0052143E: lea eax, [ebp-24h]
  '00521441: push edx
  '00521442: lea ecx, [ebp-20h]
  '00521445: push eax
  '00521446: push ecx
  '00521447: push 00000004h
  '00521449: call [00401064h]
  '0052144F: lea edx, [ebp-60h]
  '00521452: lea eax, [ebp-50h]
  '00521455: push edx
  '00521456: lea ecx, [ebp-40h]
  '00521459: push eax
  '0052145A: push ecx
  '0052145B: push 00000003h
  '0052145D: call [00401050h]
  '00521463: add esp, 00000024h
  '00521466: mov [ebp-04h], 00000000h
  '0052146D: wait 
  '0052146E: push 005214E4h
  '00521473: jmp 5214C1h
  '00521475: lea ecx, [ebp-1Ch]
  '00521478: call [004013B4h]
  '0052147E: lea edx, [ebp-30h]
  '00521481: lea eax, [ebp-2Ch]
  '00521484: push edx
  '00521485: lea ecx, [ebp-28h]
  '00521488: push eax
  '00521489: lea edx, [ebp-24h]
  '0052148C: push ecx
  '0052148D: lea eax, [ebp-20h]
  '00521490: push edx
  '00521491: push eax
  '00521492: push 00000005h
  '00521494: call [00401064h]
  '0052149A: lea ecx, [ebp-00000090h]
  '005214A0: lea edx, [ebp-80h]
  '005214A3: push ecx
  '005214A4: lea eax, [ebp-70h]
  '005214A7: push edx
  '005214A8: lea ecx, [ebp-60h]
  '005214AB: push eax
  '005214AC: lea edx, [ebp-50h]
  '005214AF: push ecx
  '005214B0: lea eax, [ebp-40h]
  '005214B3: push edx
  '005214B4: push eax
  '005214B5: push 00000006h
  '005214B7: call [00401050h]
  '005214BD: add esp, 00000034h
  '005214C0: ret 
End Sub
Private Sub Form__521DE0
  '00521DE0: push ebp
  '00521DE1: mov ebp, esp
  '00521DE3: sub esp, 00000018h
  '00521DE6: push 004081B6h
  '00521DEB: mov eax, fs:[00h]
  '00521DF1: push eax
  '00521DF2: mov fs:[00000000h], esp
  '00521DF9: mov eax, 00000190h
  '00521DFE: call 004081B0h
  '00521E03: push ebx
  '00521E04: push esi
  '00521E05: push edi
  '00521E06: mov [ebp-18h], esp
  '00521E09: mov [ebp-14h], 00406F50h
  '00521E10: mov eax, [ebp+08h]
  '00521E13: and eax, 00000001h
  '00521E16: mov [ebp-10h], eax
  '00521E19: mov ecx, [ebp+08h]
  '00521E1C: and ecx, FFFFFFFEh
  '00521E1F: mov [ebp+08h], ecx
  '00521E22: mov [ebp-0Ch], 00000000h
  '00521E29: mov edx, [ebp+08h]
  '00521E2C: mov eax, [edx]
  '00521E2E: mov ecx, [ebp+08h]
  '00521E31: push ecx
  '00521E32: call [eax+04h]
  '00521E35: mov [ebp-04h], 00000001h
  '00521E3C: mov [ebp-04h], 00000002h
  '00521E43: push FFFFFFFFh
  '00521E45: call [004010E8h]
  '00521E4B: mov [ebp-04h], 00000003h
  '00521E52: lea edx, [ebp-00000148h]
  '00521E58: push edx
  '00521E59: mov eax, [ebp+08h]
  '00521E5C: mov ecx, [eax]
  '00521E5E: mov edx, [ebp+08h]
  '00521E61: push edx
  '00521E62: call [ecx+00000080h]
  '00521E68: fclex 
  '00521E6A: mov [ebp-00000150h], eax
  '00521E70: cmp [ebp-00000150h], 00000000h
  '00521E77: jnl 521E9Ch
  '00521E79: push 00000080h
  '00521E7E: push 004208E0h
  '00521E83: mov eax, [ebp+08h]
  '00521E86: push eax
  '00521E87: mov ecx, [ebp-00000150h]
  '00521E8D: push ecx
  '00521E8E: call [004010A0h]
  '00521E94: mov [ebp-00000184h], eax
  '00521E9A: jmp 521EA6h
  '00521E9C: mov [ebp-00000184h], 00000000h
  '00521EA6: fld real4 ptr [ebp-00000148h]
  '00521EAC: fcomp real4 ptr [004067C4h]
  '00521EB2: fstsw ax
  '00521EB4: test ah, 01h
  '00521EB7: jz 521F12h
  '00521EB9: mov [ebp-04h], 00000004h
  '00521EC0: push 44BB8000h
  '00521EC5: mov edx, [ebp+08h]
  '00521EC8: mov eax, [edx]
  '00521ECA: mov ecx, [ebp+08h]
  '00521ECD: push ecx
  '00521ECE: call [eax+00000084h]
  '00521ED4: fclex 
  '00521ED6: mov [ebp-00000150h], eax
  '00521EDC: cmp [ebp-00000150h], 00000000h
  '00521EE3: jnl 521F08h
  '00521EE5: push 00000084h
  '00521EEA: push 004208E0h
  '00521EEF: mov edx, [ebp+08h]
  '00521EF2: push edx
  '00521EF3: mov eax, [ebp-00000150h]
  '00521EF9: push eax
  '00521EFA: call [004010A0h]
  '00521F00: mov [ebp-00000188h], eax
  '00521F06: jmp 521F12h
  '00521F08: mov [ebp-00000188h], 00000000h
  '00521F12: mov [ebp-04h], 00000006h
  '00521F19: lea ecx, [ebp-00000148h]
  '00521F1F: push ecx
  '00521F20: mov edx, [ebp+08h]
  '00521F23: mov eax, [edx]
  '00521F25: mov ecx, [ebp+08h]
  '00521F28: push ecx
  '00521F29: call [eax+00000088h]
  '00521F2F: fclex 
  '00521F31: mov [ebp-00000150h], eax
  '00521F37: cmp [ebp-00000150h], 00000000h
  '00521F3E: jnl 521F63h
  '00521F40: push 00000088h
  '00521F45: push 004208E0h
  '00521F4A: mov edx, [ebp+08h]
  '00521F4D: push edx
  '00521F4E: mov eax, [ebp-00000150h]
  '00521F54: push eax
  '00521F55: call [004010A0h]
  '00521F5B: mov [ebp-0000018Ch], eax
  '00521F61: jmp 521F6Dh
  '00521F63: mov [ebp-0000018Ch], 00000000h
  '00521F6D: fld real4 ptr [ebp-00000148h]
  '00521F73: fcomp real4 ptr [00401894h]
  '00521F79: fstsw ax
  '00521F7B: test ah, 01h
  '00521F7E: jz 521FD9h
  '00521F80: mov [ebp-04h], 00000007h
  '00521F87: push 44D48000h
  '00521F8C: mov ecx, [ebp+08h]
  '00521F8F: mov edx, [ecx]
  '00521F91: mov eax, [ebp+08h]
  '00521F94: push eax
  '00521F95: call [edx+0000008Ch]
  '00521F9B: fclex 
  '00521F9D: mov [ebp-00000150h], eax
  '00521FA3: cmp [ebp-00000150h], 00000000h
  '00521FAA: jnl 521FCFh
  '00521FAC: push 0000008Ch
  '00521FB1: push 004208E0h
  '00521FB6: mov ecx, [ebp+08h]
  '00521FB9: push ecx
  '00521FBA: mov edx, [ebp-00000150h]
  '00521FC0: push edx
  '00521FC1: call [004010A0h]
  '00521FC7: mov [ebp-00000190h], eax
  '00521FCD: jmp 521FD9h
  '00521FCF: mov [ebp-00000190h], 00000000h
  '00521FD9: mov [ebp-04h], 00000009h
  '00521FE0: mov [ebp-000000ACh], 00000000h
  '00521FEA: mov [ebp-000000B4h], 00000004h
  '00521FF4: mov [ebp-000000CCh], 00000000h
  '00521FFE: mov [ebp-000000D4h], 00000002h
  '00522008: lea eax, [ebp-00000148h]
  '0052200E: push eax
  '0052200F: mov ecx, [ebp+08h]
  '00522012: mov edx, [ecx]
  '00522014: mov eax, [ebp+08h]
  '00522017: push eax
  '00522018: call [edx+00000100h]
  '0052201E: fclex 
  '00522020: mov [ebp-00000150h], eax
  '00522026: cmp [ebp-00000150h], 00000000h
  '0052202D: jnl 522052h
  '0052202F: push 00000100h
  '00522034: push 004208E0h
  '00522039: mov ecx, [ebp+08h]
  '0052203C: push ecx
  '0052203D: mov edx, [ebp-00000150h]
  '00522043: push edx
  '00522044: call [004010A0h]
  '0052204A: mov [ebp-00000194h], eax
  '00522050: jmp 52205Ch
  '00522052: mov [ebp-00000194h], 00000000h
  '0052205C: mov eax, [ebp-00000148h]
  '00522062: mov [ebp-000000ECh], eax
  '00522068: mov [ebp-000000F4h], 00000004h
  '00522072: lea ecx, [ebp-0000014Ch]
  '00522078: push ecx
  '00522079: mov edx, [ebp+08h]
  '0052207C: mov eax, [edx]
  '0052207E: mov ecx, [ebp+08h]
  '00522081: push ecx
  '00522082: call [eax+00000108h]
  '00522088: fclex 
  '0052208A: mov [ebp-00000154h], eax
  '00522090: cmp [ebp-00000154h], 00000000h
  '00522097: jnl 5220BCh
  '00522099: push 00000108h
  '0052209E: push 004208E0h
  '005220A3: mov edx, [ebp+08h]
  '005220A6: push edx
  '005220A7: mov eax, [ebp-00000154h]
  '005220AD: push eax
  '005220AE: call [004010A0h]
  '005220B4: mov [ebp-00000198h], eax
  '005220BA: jmp 5220C6h
  '005220BC: mov [ebp-00000198h], 00000000h
  '005220C6: fld real4 ptr [ebp-0000014Ch]
  '005220CC: fsub real4 ptr [00406FA0h]
  '005220D2: fstp real4 ptr [ebp-0000010Ch]
  '005220D8: fstsw ax
  '005220DA: test al, 0Dh
  '005220DC: jnz 00522869h
  '005220E2: mov [ebp-00000114h], 00000004h
  '005220EC: mov eax, 00000010h
  '005220F1: call 004081B0h
  '005220F6: mov ecx, esp
  '005220F8: mov edx, [ebp-000000B4h]
  '005220FE: mov [ecx], edx
  '00522100: mov eax, [ebp-000000B0h]
  '00522106: mov [ecx+04h], eax
  '00522109: mov edx, [ebp-000000ACh]
  '0052210F: mov [ecx+08h], edx
  '00522112: mov eax, [ebp-000000A8h]
  '00522118: mov [ecx+0Ch], eax
  '0052211B: mov eax, 00000010h
  '00522120: call 004081B0h
  '00522125: mov ecx, esp
  '00522127: mov edx, [ebp-000000D4h]
  '0052212D: mov [ecx], edx
  '0052212F: mov eax, [ebp-000000D0h]
  '00522135: mov [ecx+04h], eax
  '00522138: mov edx, [ebp-000000CCh]
  '0052213E: mov [ecx+08h], edx
  '00522141: mov eax, [ebp-000000C8h]
  '00522147: mov [ecx+0Ch], eax
  '0052214A: mov eax, 00000010h
  '0052214F: call 004081B0h
  '00522154: mov ecx, esp
  '00522156: mov edx, [ebp-000000F4h]
  '0052215C: mov [ecx], edx
  '0052215E: mov eax, [ebp-000000F0h]
  '00522164: mov [ecx+04h], eax
  '00522167: mov edx, [ebp-000000ECh]
  '0052216D: mov [ecx+08h], edx
  '00522170: mov eax, [ebp-000000E8h]
  '00522176: mov [ecx+0Ch], eax
  '00522179: mov eax, 00000010h
  '0052217E: call 004081B0h
  '00522183: mov ecx, esp
  '00522185: mov edx, [ebp-00000114h]
  '0052218B: mov [ecx], edx
  '0052218D: mov eax, [ebp-00000110h]
  '00522193: mov [ecx+04h], eax
  '00522196: mov edx, [ebp-0000010Ch]
  '0052219C: mov [ecx+08h], edx
  '0052219F: mov eax, [ebp-00000108h]
  '005221A5: mov [ecx+0Ch], eax
  '005221A8: push 00000004h
  '005221AA: push 80011002h
  '005221AF: mov ecx, [ebp+08h]
  '005221B2: mov edx, [ecx]
  '005221B4: mov eax, [ebp+08h]
  '005221B7: push eax
  '005221B8: call [edx+0000030Ch]
  '005221BE: push eax
  '005221BF: lea ecx, [ebp-24h]
  '005221C2: push ecx
  '005221C3: call [004010E4h]
  '005221C9: push eax
  '005221CA: call [00401040h]
  '005221D0: add esp, 0000004Ch
  '005221D3: lea ecx, [ebp-24h]
  '005221D6: call [004013B8h]
  '005221DC: mov [ebp-04h], 0000000Ah
  '005221E3: push 0041E958h
  '005221E8: push 00000000h
  '005221EA: push 00000003h
  '005221EC: mov edx, [ebp+08h]
  '005221EF: mov eax, [edx]
  '005221F1: mov ecx, [ebp+08h]
  '005221F4: push ecx
  '005221F5: call [eax+0000031Ch]
  '005221FB: push eax
  '005221FC: lea edx, [ebp-24h]
  '005221FF: push edx
  '00522200: call [004010E4h]
  '00522206: push eax
  '00522207: lea eax, [ebp-54h]
  '0052220A: push eax
  '0052220B: call [004011E4h]
  '00522211: add esp, 00000010h
  '00522214: push eax
  '00522215: call [004011C8h]
  '0052221B: push eax
  '0052221C: lea ecx, [ebp-28h]
  '0052221F: push ecx
  '00522220: call [004010E4h]
  '00522226: mov [ebp-00000150h], eax
  '0052222C: mov [ebp-5Ch], 00000001h
  '00522233: mov [ebp-64h], 00000002h
  '0052223A: lea edx, [ebp-2Ch]
  '0052223D: push edx
  '0052223E: lea eax, [ebp-64h]
  '00522241: push eax
  '00522242: mov ecx, [ebp-00000150h]
  '00522248: mov edx, [ecx]
  '0052224A: mov eax, [ebp-00000150h]
  '00522250: push eax
  '00522251: call [edx+24h]
  '00522254: fclex 
  '00522256: mov [ebp-00000154h], eax
  '0052225C: cmp [ebp-00000154h], 00000000h
  '00522263: jnl 522288h
  '00522265: push 00000024h
  '00522267: push 0041E958h
  '0052226C: mov ecx, [ebp-00000150h]
  '00522272: push ecx
  '00522273: mov edx, [ebp-00000154h]
  '00522279: push edx
  '0052227A: call [004010A0h]
  '00522280: mov [ebp-0000019Ch], eax
  '00522286: jmp 522292h
  '00522288: mov [ebp-0000019Ch], 00000000h
  '00522292: mov eax, [ebp-2Ch]
  '00522295: mov [ebp-00000158h], eax
  '0052229B: lea ecx, [ebp-00000148h]
  '005222A1: push ecx
  '005222A2: mov edx, [ebp-00000158h]
  '005222A8: mov eax, [edx]
  '005222AA: mov ecx, [ebp-00000158h]
  '005222B0: push ecx
  '005222B1: call [eax+54h]
  '005222B4: fclex 
  '005222B6: mov [ebp-0000015Ch], eax
  '005222BC: cmp [ebp-0000015Ch], 00000000h
  '005222C3: jnl 5222E8h
  '005222C5: push 00000054h
  '005222C7: push 0041E968h
  '005222CC: mov edx, [ebp-00000158h]
  '005222D2: push edx
  '005222D3: mov eax, [ebp-0000015Ch]
  '005222D9: push eax
  '005222DA: call [004010A0h]
  '005222E0: mov [ebp-000001A0h], eax
  '005222E6: jmp 5222F2h
  '005222E8: mov [ebp-000001A0h], 00000000h
  '005222F2: fld real4 ptr [ebp-00000148h]
  '005222F8: fadd real4 ptr [00405C00h]
  '005222FE: fstp real4 ptr [ebp-000000CCh]
  '00522304: fstsw ax
  '00522306: test al, 0Dh
  '00522308: jnz 00522869h
  '0052230E: mov [ebp-000000D4h], 00000004h
  '00522318: push 00000000h
  '0052231A: push 80010004h
  '0052231F: mov ecx, [ebp+08h]
  '00522322: mov edx, [ecx]
  '00522324: mov eax, [ebp+08h]
  '00522327: push eax
  '00522328: call [edx+0000031Ch]
  '0052232E: push eax
  '0052232F: lea ecx, [ebp-30h]
  '00522332: push ecx
  '00522333: call [004010E4h]
  '00522339: push eax
  '0052233A: lea edx, [ebp-74h]
  '0052233D: push edx
  '0052233E: call [004011E4h]
  '00522344: add esp, 00000010h
  '00522347: push eax
  '00522348: call [004011DCh]
  '0052234E: fadd real4 ptr [00405BFCh]
  '00522354: fstp real4 ptr [ebp-000000ECh]
  '0052235A: fstsw ax
  '0052235C: test al, 0Dh
  '0052235E: jnz 00522869h
  '00522364: mov [ebp-000000F4h], 00000004h
  '0052236E: push 0041E958h
  '00522373: push 00000000h
  '00522375: push 00000003h
  '00522377: mov eax, [ebp+08h]
  '0052237A: mov ecx, [eax]
  '0052237C: mov edx, [ebp+08h]
  '0052237F: push edx
  '00522380: call [ecx+0000031Ch]
  '00522386: push eax
  '00522387: lea eax, [ebp-34h]
  '0052238A: push eax
  '0052238B: call [004010E4h]
  '00522391: push eax
  '00522392: lea ecx, [ebp-00000084h]
  '00522398: push ecx
  '00522399: call [004011E4h]
  '0052239F: add esp, 00000010h
  '005223A2: push eax
  '005223A3: call [004011C8h]
  '005223A9: push eax
  '005223AA: lea edx, [ebp-38h]
  '005223AD: push edx
  '005223AE: call [004010E4h]
  '005223B4: mov [ebp-00000160h], eax
  '005223BA: mov [ebp-0000008Ch], 00000001h
  '005223C4: mov [ebp-00000094h], 00000002h
  '005223CE: lea eax, [ebp-3Ch]
  '005223D1: push eax
  '005223D2: lea ecx, [ebp-00000094h]
  '005223D8: push ecx
  '005223D9: mov edx, [ebp-00000160h]
  '005223DF: mov eax, [edx]
  '005223E1: mov ecx, [ebp-00000160h]
  '005223E7: push ecx
  '005223E8: call [eax+24h]
  '005223EB: fclex 
  '005223ED: mov [ebp-00000164h], eax
  '005223F3: cmp [ebp-00000164h], 00000000h
  '005223FA: jnl 52241Fh
  '005223FC: push 00000024h
  '005223FE: push 0041E958h
  '00522403: mov edx, [ebp-00000160h]
  '00522409: push edx
  '0052240A: mov eax, [ebp-00000164h]
  '00522410: push eax
  '00522411: call [004010A0h]
  '00522417: mov [ebp-000001A4h], eax
  '0052241D: jmp 522429h
  '0052241F: mov [ebp-000001A4h], 00000000h
  '00522429: mov ecx, [ebp-3Ch]
  '0052242C: mov [ebp-00000168h], ecx
  '00522432: lea edx, [ebp-0000014Ch]
  '00522438: push edx
  '00522439: mov eax, [ebp-00000168h]
  '0052243F: mov ecx, [eax]
  '00522441: mov edx, [ebp-00000168h]
  '00522447: push edx
  '00522448: call [ecx+00000094h]
  '0052244E: fclex 
  '00522450: mov [ebp-0000016Ch], eax
  '00522456: cmp [ebp-0000016Ch], 00000000h
  '0052245D: jnl 522485h
  '0052245F: push 00000094h
  '00522464: push 0041E968h
  '00522469: mov eax, [ebp-00000168h]
  '0052246F: push eax
  '00522470: mov ecx, [ebp-0000016Ch]
  '00522476: push ecx
  '00522477: call [004010A0h]
  '0052247D: mov [ebp-000001A8h], eax
  '00522483: jmp 52248Fh
  '00522485: mov [ebp-000001A8h], 00000000h
  '0052248F: fld real4 ptr [ebp-0000014Ch]
  '00522495: fsub real4 ptr [00405BFCh]
  '0052249B: fstp real4 ptr [ebp-0000010Ch]
  '005224A1: fstsw ax
  '005224A3: test al, 0Dh
  '005224A5: jnz 00522869h
  '005224AB: mov [ebp-00000114h], 00000004h
  '005224B5: push 00000000h
  '005224B7: push 80010006h
  '005224BC: mov edx, [ebp+08h]
  '005224BF: mov eax, [edx]
  '005224C1: mov ecx, [ebp+08h]
  '005224C4: push ecx
  '005224C5: call [eax+0000031Ch]
  '005224CB: push eax
  '005224CC: lea edx, [ebp-40h]
  '005224CF: push edx
  '005224D0: call [004010E4h]
  '005224D6: push eax
  '005224D7: lea eax, [ebp-000000A4h]
  '005224DD: push eax
  '005224DE: call [004011E4h]
  '005224E4: add esp, 00000010h
  '005224E7: push eax
  '005224E8: call [004011DCh]
  '005224EE: fsub real4 ptr [00405BF8h]
  '005224F4: fstp real4 ptr [ebp-0000012Ch]
  '005224FA: fstsw ax
  '005224FC: test al, 0Dh
  '005224FE: jnz 00522869h
  '00522504: mov [ebp-00000134h], 00000004h
  '0052250E: mov eax, 00000010h
  '00522513: call 004081B0h
  '00522518: mov ecx, esp
  '0052251A: mov edx, [ebp-000000D4h]
  '00522520: mov [ecx], edx
  '00522522: mov eax, [ebp-000000D0h]
  '00522528: mov [ecx+04h], eax
  '0052252B: mov edx, [ebp-000000CCh]
  '00522531: mov [ecx+08h], edx
  '00522534: mov eax, [ebp-000000C8h]
  '0052253A: mov [ecx+0Ch], eax
  '0052253D: mov eax, 00000010h
  '00522542: call 004081B0h
  '00522547: mov ecx, esp
  '00522549: mov edx, [ebp-000000F4h]
  '0052254F: mov [ecx], edx
  '00522551: mov eax, [ebp-000000F0h]
  '00522557: mov [ecx+04h], eax
  '0052255A: mov edx, [ebp-000000ECh]
  '00522560: mov [ecx+08h], edx
  '00522563: mov eax, [ebp-000000E8h]
  '00522569: mov [ecx+0Ch], eax
  '0052256C: mov eax, 00000010h
  '00522571: call 004081B0h
  '00522576: mov ecx, esp
  '00522578: mov edx, [ebp-00000114h]
  '0052257E: mov [ecx], edx
  '00522580: mov eax, [ebp-00000110h]
  '00522586: mov [ecx+04h], eax
  '00522589: mov edx, [ebp-0000010Ch]
  '0052258F: mov [ecx+08h], edx
  '00522592: mov eax, [ebp-00000108h]
  '00522598: mov [ecx+0Ch], eax
  '0052259B: mov eax, 00000010h
  '005225A0: call 004081B0h
  '005225A5: mov ecx, esp
  '005225A7: mov edx, [ebp-00000134h]
  '005225AD: mov [ecx], edx
  '005225AF: mov eax, [ebp-00000130h]
  '005225B5: mov [ecx+04h], eax
  '005225B8: mov edx, [ebp-0000012Ch]
  '005225BE: mov [ecx+08h], edx
  '005225C1: mov eax, [ebp-00000128h]
  '005225C7: mov [ecx+0Ch], eax
  '005225CA: push 00000004h
  '005225CC: push 80011001h
  '005225D1: mov ecx, [ebp+08h]
  '005225D4: mov edx, [ecx]
  '005225D6: mov eax, [ebp+08h]
  '005225D9: push eax
  '005225DA: call [edx+00000318h]
  '005225E0: push eax
  '005225E1: lea ecx, [ebp-44h]
  '005225E4: push ecx
  '005225E5: call [004010E4h]
  '005225EB: push eax
  '005225EC: call [00401040h]
  '005225F2: add esp, 0000004Ch
  '005225F5: lea edx, [ebp-44h]
  '005225F8: push edx
  '005225F9: lea eax, [ebp-40h]
  '005225FC: push eax
  '005225FD: lea ecx, [ebp-3Ch]
  '00522600: push ecx
  '00522601: lea edx, [ebp-38h]
  '00522604: push edx
  '00522605: lea eax, [ebp-34h]
  '00522608: push eax
  '00522609: lea ecx, [ebp-30h]
  '0052260C: push ecx
  '0052260D: lea edx, [ebp-2Ch]
  '00522610: push edx
  '00522611: lea eax, [ebp-28h]
  '00522614: push eax
  '00522615: lea ecx, [ebp-24h]
  '00522618: push ecx
  '00522619: push 00000009h
  '0052261B: call [00401064h]
  '00522621: add esp, 00000028h
  '00522624: lea edx, [ebp-000000A4h]
  '0052262A: push edx
  '0052262B: lea eax, [ebp-00000094h]
  '00522631: push eax
  '00522632: lea ecx, [ebp-00000084h]
  '00522638: push ecx
  '00522639: lea edx, [ebp-74h]
  '0052263C: push edx
  '0052263D: lea eax, [ebp-64h]
  '00522640: push eax
  '00522641: lea ecx, [ebp-54h]
  '00522644: push ecx
  '00522645: push 00000006h
  '00522647: call [00401050h]
  '0052264D: add esp, 0000001Ch
  '00522650: mov [ebp-04h], 0000000Bh
  '00522657: push 00421124h
  '0052265C: push 00000000h
  '0052265E: push 00000002h
  '00522660: mov edx, [ebp+08h]
  '00522663: mov eax, [edx]
  '00522665: mov ecx, [ebp+08h]
  '00522668: push ecx
  '00522669: call [eax+0000030Ch]
  '0052266F: push eax
  '00522670: lea edx, [ebp-28h]
  '00522673: push edx
  '00522674: call [004010E4h]
  '0052267A: push eax
  '0052267B: lea eax, [ebp-64h]
  '0052267E: push eax
  '0052267F: call [004011E4h]
  '00522685: add esp, 00000010h
  '00522688: push eax
  '00522689: call [004011C8h]
  '0052268F: push eax
  '00522690: lea ecx, [ebp-2Ch]
  '00522693: push ecx
  '00522694: call [004010E4h]
  '0052269A: mov [ebp-00000150h], eax
  '005226A0: mov [ebp-6Ch], 00000001h
  '005226A7: mov [ebp-74h], 00000002h
  '005226AE: lea edx, [ebp-30h]
  '005226B1: push edx
  '005226B2: lea eax, [ebp-74h]
  '005226B5: push eax
  '005226B6: mov ecx, [ebp-00000150h]
  '005226BC: mov edx, [ecx]
  '005226BE: mov eax, [ebp-00000150h]
  '005226C4: push eax
  '005226C5: call [edx+24h]
  '005226C8: fclex 
  '005226CA: mov [ebp-00000154h], eax
  '005226D0: cmp [ebp-00000154h], 00000000h
  '005226D7: jnl 5226FCh
  '005226D9: push 00000024h
  '005226DB: push 00421124h
  '005226E0: mov ecx, [ebp-00000150h]
  '005226E6: push ecx
  '005226E7: mov edx, [ebp-00000154h]
  '005226ED: push edx
  '005226EE: call [004010A0h]
  '005226F4: mov [ebp-000001ACh], eax
  '005226FA: jmp 522706h
  '005226FC: mov [ebp-000001ACh], 00000000h
  '00522706: mov eax, [ebp-30h]
  '00522709: mov [ebp-00000158h], eax
  '0052270F: push 00000000h
  '00522711: push 80010005h
  '00522716: mov ecx, [ebp+08h]
  '00522719: mov edx, [ecx]
  '0052271B: mov eax, [ebp+08h]
  '0052271E: push eax
  '0052271F: call [edx+0000030Ch]
  '00522725: push eax
  '00522726: lea ecx, [ebp-24h]
  '00522729: push ecx
  '0052272A: call [004010E4h]
  '00522730: push eax
  '00522731: lea edx, [ebp-54h]
  '00522734: push edx
  '00522735: call [004011E4h]
  '0052273B: add esp, 00000010h
  '0052273E: push eax
  '0052273F: call [004011DCh]
  '00522745: fsub real4 ptr [00406EB4h]
  '0052274B: fstsw ax
  '0052274D: test al, 0Dh
  '0052274F: jnz 00522869h
  '00522755: push ecx
  '00522756: fstp real4 ptr [esp]
  '00522759: mov eax, [ebp-00000158h]
  '0052275F: mov ecx, [eax]
  '00522761: mov edx, [ebp-00000158h]
  '00522767: push edx
  '00522768: call [ecx+60h]
  '0052276B: fclex 
  '0052276D: mov [ebp-0000015Ch], eax
  '00522773: cmp [ebp-0000015Ch], 00000000h
  '0052277A: jnl 52279Fh
  '0052277C: push 00000060h
  '0052277E: push 00421134h
  '00522783: mov eax, [ebp-00000158h]
  '00522789: push eax
  '0052278A: mov ecx, [ebp-0000015Ch]
  '00522790: push ecx
  '00522791: call [004010A0h]
  '00522797: mov [ebp-000001B0h], eax
  '0052279D: jmp 5227A9h
  '0052279F: mov [ebp-000001B0h], 00000000h
  '005227A9: lea edx, [ebp-30h]
  '005227AC: push edx
  '005227AD: lea eax, [ebp-2Ch]
  '005227B0: push eax
  '005227B1: lea ecx, [ebp-28h]
  '005227B4: push ecx
  '005227B5: lea edx, [ebp-24h]
  '005227B8: push edx
  '005227B9: push 00000004h
  '005227BB: call [00401064h]
  '005227C1: add esp, 00000014h
  '005227C4: lea eax, [ebp-74h]
  '005227C7: push eax
  '005227C8: lea ecx, [ebp-64h]
  '005227CB: push ecx
  '005227CC: lea edx, [ebp-54h]
  '005227CF: push edx
  '005227D0: push 00000003h
  '005227D2: call [00401050h]
  '005227D8: add esp, 00000010h
  '005227DB: mov [ebp-10h], 00000000h
  '005227E2: wait 
  '005227E3: push 00522847h
  '005227E8: jmp 522846h
  '005227EA: lea eax, [ebp-44h]
  '005227ED: push eax
  '005227EE: lea ecx, [ebp-40h]
  '005227F1: push ecx
  '005227F2: lea edx, [ebp-3Ch]
  '005227F5: push edx
  '005227F6: lea eax, [ebp-38h]
  '005227F9: push eax
  '005227FA: lea ecx, [ebp-34h]
  '005227FD: push ecx
  '005227FE: lea edx, [ebp-30h]
  '00522801: push edx
  '00522802: lea eax, [ebp-2Ch]
  '00522805: push eax
  '00522806: lea ecx, [ebp-28h]
  '00522809: push ecx
  '0052280A: lea edx, [ebp-24h]
  '0052280D: push edx
  '0052280E: push 00000009h
  '00522810: call [00401064h]
  '00522816: add esp, 00000028h
  '00522819: lea eax, [ebp-000000A4h]
  '0052281F: push eax
  '00522820: lea ecx, [ebp-00000094h]
  '00522826: push ecx
  '00522827: lea edx, [ebp-00000084h]
  '0052282D: push edx
  '0052282E: lea eax, [ebp-74h]
  '00522831: push eax
  '00522832: lea ecx, [ebp-64h]
  '00522835: push ecx
  '00522836: lea edx, [ebp-54h]
  '00522839: push edx
  '0052283A: push 00000006h
  '0052283C: call [00401050h]
  '00522842: add esp, 0000001Ch
  '00522845: ret 
End Sub
Private Sub Form__522870
  '00522870: push ebp
  '00522871: mov ebp, esp
  '00522873: sub esp, 0000000Ch
  '00522876: push 004081B6h
  '0052287B: mov eax, fs:[00h]
  '00522881: push eax
  '00522882: mov fs:[00000000h], esp
  '00522889: sub esp, 0000000Ch
  '0052288C: push ebx
  '0052288D: push esi
  '0052288E: push edi
  '0052288F: mov [ebp-0Ch], esp
  '00522892: mov [ebp-08h], 00406FA8h
  '00522899: mov esi, [ebp+08h]
  '0052289C: mov eax, esi
  '0052289E: and eax, 00000001h
  '005228A1: mov [ebp-04h], eax
  '005228A4: and esi, FFFFFFFEh
  '005228A7: push esi
  '005228A8: mov [ebp+08h], esi
  '005228AB: mov ecx, [esi]
  '005228AD: call [ecx+04h]
  '005228B0: mov ax, [esi+36h]
  '005228B4: xor edi, edi
  '005228B6: cmp ax, di
  '005228B9: mov [ebp-18h], edi
  '005228BC: jz 5228C5h
  '005228BE: push eax
  '005228BF: call [00401168h]
  '005228C5: mov edx, [esi]
  '005228C7: push edi
  '005228C8: push 00000046h
  '005228CA: push esi
  '005228CB: call [edx+00000314h]
  '005228D1: push eax
  '005228D2: lea eax, [ebp-18h]
  '005228D5: push eax
  '005228D6: call [004010E4h]
  '005228DC: push eax
  '005228DD: call [00401040h]
  '005228E3: add esp, 0000000Ch
  '005228E6: lea ecx, [ebp-18h]
  '005228E9: call [004013B8h]
  '005228EF: mov [ebp-04h], edi
  '005228F2: push 00522904h
  '005228F7: jmp 522903h
  '005228F9: lea ecx, [ebp-18h]
  '005228FC: call [004013B8h]
  '00522902: ret 
End Sub
Private Sub Form__521CB0
  '00521CB0: push ebp
  '00521CB1: mov ebp, esp
  '00521CB3: sub esp, 0000000Ch
  '00521CB6: push 004081B6h
  '00521CBB: mov eax, fs:[00h]
  '00521CC1: push eax
  '00521CC2: mov fs:[00000000h], esp
  '00521CC9: sub esp, 00000014h
  '00521CCC: push ebx
  '00521CCD: push esi
  '00521CCE: push edi
  '00521CCF: mov [ebp-0Ch], esp
  '00521CD2: mov [ebp-08h], 00406F40h
  '00521CD9: mov esi, [ebp+08h]
  '00521CDC: mov eax, esi
  '00521CDE: and eax, 00000001h
  '00521CE1: mov [ebp-04h], eax
  '00521CE4: and esi, FFFFFFFEh
  '00521CE7: push esi
  '00521CE8: mov [ebp+08h], esi
  '00521CEB: mov ecx, [esi]
  '00521CED: call [ecx+04h]
  '00521CF0: mov edx, [esi]
  '00521CF2: lea eax, [ebp-1Ch]
  '00521CF5: xor edi, edi
  '00521CF7: push eax
  '00521CF8: push esi
  '00521CF9: mov [ebp-18h], edi
  '00521CFC: mov [ebp-1Ch], edi
  '00521CFF: call [edx+00000080h]
  '00521D05: cmp eax, edi
  '00521D07: fclex 
  '00521D09: jnl 521D1Dh
  '00521D0B: push 00000080h
  '00521D10: push 004208E0h
  '00521D15: push esi
  '00521D16: push eax
  '00521D17: call [004010A0h]
  '00521D1D: mov ecx, [ebp-1Ch]
  '00521D20: mov edi, [004011D4h]
  '00521D26: push ecx
  '00521D27: call edi
  '00521D29: mov ebx, [00401378h]
  '00521D2F: mov edx, eax
  '00521D31: lea ecx, [ebp-18h]
  '00521D34: call ebx
  '00521D36: push eax
  '00521D37: push 0042B0CCh
  '00521D3C: push 0041EA6Ch
  '00521D41: push 0041EA58h
  '00521D46: call [00401010h]
  '00521D4C: lea ecx, [ebp-18h]
  '00521D4F: call [004013B4h]
  '00521D55: mov edx, [esi]
  '00521D57: lea eax, [ebp-1Ch]
  '00521D5A: push eax
  '00521D5B: push esi
  '00521D5C: call [edx+00000088h]
  '00521D62: test eax, eax
  '00521D64: fclex 
  '00521D66: jnl 521D7Ah
  '00521D68: push 00000088h
  '00521D6D: push 004208E0h
  '00521D72: push esi
  '00521D73: push eax
  '00521D74: call [004010A0h]
  '00521D7A: mov ecx, [ebp-1Ch]
  '00521D7D: push ecx
  '00521D7E: call edi
  '00521D80: mov edx, eax
  '00521D82: lea ecx, [ebp-18h]
  '00521D85: call ebx
  '00521D87: push eax
  '00521D88: push 0042B0E8h
  '00521D8D: push 0041EA6Ch
  '00521D92: push 0041EA58h
  '00521D97: call [00401010h]
  '00521D9D: lea ecx, [ebp-18h]
  '00521DA0: call [004013B4h]
  '00521DA6: mov [ebp-04h], 00000000h
  '00521DAD: wait 
  '00521DAE: push 00521DC0h
  '00521DB3: jmp 521DBFh
  '00521DB5: lea ecx, [ebp-18h]
  '00521DB8: call [004013B4h]
  '00521DBE: ret 
End Sub
Private Sub cancel_transfer__5201E0
  '005201E0: push ebp
  '005201E1: mov ebp, esp
  '005201E3: sub esp, 00000018h
  '005201E6: push 004081B6h
  '005201EB: mov eax, fs:[00h]
  '005201F1: push eax
  '005201F2: mov fs:[00000000h], esp
  '005201F9: mov eax, 00000084h
  '005201FE: call 004081B0h
  '00520203: push ebx
  '00520204: push esi
  '00520205: push edi
  '00520206: mov [ebp-18h], esp
  '00520209: mov [ebp-14h], 00406E50h
  '00520210: mov eax, [ebp+08h]
  '00520213: and eax, 00000001h
  '00520216: mov [ebp-10h], eax
  '00520219: mov ecx, [ebp+08h]
  '0052021C: and ecx, FFFFFFFEh
  '0052021F: mov [ebp+08h], ecx
  '00520222: mov [ebp-0Ch], 00000000h
  '00520229: mov edx, [ebp+08h]
  '0052022C: mov eax, [edx]
  '0052022E: mov ecx, [ebp+08h]
  '00520231: push ecx
  '00520232: call [eax+04h]
  '00520235: mov [ebp-04h], 00000001h
  '0052023C: mov [ebp-04h], 00000002h
  '00520243: push FFFFFFFFh
  '00520245: call [004010E8h]
  '0052024B: mov [ebp-04h], 00000003h
  '00520252: push 00000000h
  '00520254: push 00000008h
  '00520256: mov edx, [ebp+08h]
  '00520259: mov eax, [edx]
  '0052025B: mov ecx, [ebp+08h]
  '0052025E: push ecx
  '0052025F: call [eax+00000314h]
  '00520265: push eax
  '00520266: lea edx, [ebp-2Ch]
  '00520269: push edx
  '0052026A: call [004010E4h]
  '00520270: push eax
  '00520271: lea eax, [ebp-40h]
  '00520274: push eax
  '00520275: call [004011E4h]
  '0052027B: add esp, 00000010h
  '0052027E: push eax
  '0052027F: call [00401284h]
  '00520285: movsx ecx, ax
  '00520288: neg ecx
  '0052028A: sbb ecx, ecx
  '0052028C: neg ecx
  '0052028E: neg ecx
  '00520290: mov [ebp-78h], cx
  '00520294: lea ecx, [ebp-2Ch]
  '00520297: call [004013B8h]
  '0052029D: lea ecx, [ebp-40h]
  '005202A0: call [00401030h]
  '005202A6: movsx edx, word ptr [ebp-78h]
  '005202AA: test edx, edx
  '005202AC: jz 0052058Fh
  '005202B2: mov [ebp-04h], 00000004h
  '005202B9: push 00000000h
  '005202BB: push 00000046h
  '005202BD: mov eax, [ebp+08h]
  '005202C0: mov ecx, [eax]
  '005202C2: mov edx, [ebp+08h]
  '005202C5: push edx
  '005202C6: call [ecx+00000314h]
  '005202CC: push eax
  '005202CD: lea eax, [ebp-2Ch]
  '005202D0: push eax
  '005202D1: call [004010E4h]
  '005202D7: push eax
  '005202D8: call [00401040h]
  '005202DE: add esp, 0000000Ch
  '005202E1: lea ecx, [ebp-2Ch]
  '005202E4: call [004013B8h]
  '005202EA: mov [ebp-04h], 00000005h
  '005202F1: push 0042B048h
  '005202F6: mov ecx, [ebp+08h]
  '005202F9: mov edx, [ecx+3Ch]
  '005202FC: push edx
  '005202FD: call [0040108Ch]
  '00520303: mov edx, eax
  '00520305: lea ecx, [ebp-24h]
  '00520308: call [00401378h]
  '0052030E: push eax
  '0052030F: push 0042B068h
  '00520314: call [0040108Ch]
  '0052031A: mov edx, eax
  '0052031C: lea ecx, [ebp-28h]
  '0052031F: call [00401378h]
  '00520325: lea eax, [ebp-28h]
  '00520328: push eax
  '00520329: mov ecx, [ebp+08h]
  '0052032C: mov edx, [ecx]
  '0052032E: mov eax, [ebp+08h]
  '00520331: push eax
  '00520332: call [edx+00000738h]
  '00520338: lea ecx, [ebp-28h]
  '0052033B: push ecx
  '0052033C: lea edx, [ebp-24h]
  '0052033F: push edx
  '00520340: push 00000002h
  '00520342: call [004012E8h]
  '00520348: add esp, 0000000Ch
  '0052034B: mov [ebp-04h], 00000006h
  '00520352: push 0041EFA8h
  '00520357: push 00000000h
  '00520359: push 00000007h
  '0052035B: mov eax, [ebp+08h]
  '0052035E: mov ecx, [eax]
  '00520360: mov edx, [ebp+08h]
  '00520363: push edx
  '00520364: call [ecx+0000030Ch]
  '0052036A: push eax
  '0052036B: lea eax, [ebp-2Ch]
  '0052036E: push eax
  '0052036F: call [004010E4h]
  '00520375: push eax
  '00520376: lea ecx, [ebp-40h]
  '00520379: push ecx
  '0052037A: call [004011E4h]
  '00520380: add esp, 00000010h
  '00520383: push eax
  '00520384: call [004011C8h]
  '0052038A: push eax
  '0052038B: lea edx, [ebp-30h]
  '0052038E: push edx
  '0052038F: call [004010E4h]
  '00520395: mov [ebp-78h], eax
  '00520398: lea eax, [ebp-74h]
  '0052039B: push eax
  '0052039C: mov ecx, [ebp-78h]
  '0052039F: mov edx, [ecx]
  '005203A1: mov eax, [ebp-78h]
  '005203A4: push eax
  '005203A5: call [edx+1Ch]
  '005203A8: fclex 
  '005203AA: mov [ebp-7Ch], eax
  '005203AD: cmp [ebp-7Ch], 00000000h
  '005203B1: jnl 5203D0h
  '005203B3: push 0000001Ch
  '005203B5: push 0041EFA8h
  '005203BA: mov ecx, [ebp-78h]
  '005203BD: push ecx
  '005203BE: mov edx, [ebp-7Ch]
  '005203C1: push edx
  '005203C2: call [004010A0h]
  '005203C8: mov [ebp-00000098h], eax
  '005203CE: jmp 5203DAh
  '005203D0: mov [ebp-00000098h], 00000000h
  '005203DA: xor eax, eax
  '005203DC: cmp [ebp-74h], 00000001h
  '005203E0: setnl al
  '005203E3: neg eax
  '005203E5: mov [ebp-80h], ax
  '005203E9: lea ecx, [ebp-30h]
  '005203EC: push ecx
  '005203ED: lea edx, [ebp-2Ch]
  '005203F0: push edx
  '005203F1: push 00000002h
  '005203F3: call [00401064h]
  '005203F9: add esp, 0000000Ch
  '005203FC: lea ecx, [ebp-40h]
  '005203FF: call [00401030h]
  '00520405: movsx eax, word ptr [ebp-80h]
  '00520409: test eax, eax
  '0052040B: jz 005204D4h
  '00520411: mov [ebp-04h], 00000007h
  '00520418: push 0041EFA8h
  '0052041D: push 00000000h
  '0052041F: push 00000007h
  '00520421: mov ecx, [ebp+08h]
  '00520424: mov edx, [ecx]
  '00520426: mov eax, [ebp+08h]
  '00520429: push eax
  '0052042A: call [edx+0000030Ch]
  '00520430: push eax
  '00520431: lea ecx, [ebp-2Ch]
  '00520434: push ecx
  '00520435: call [004010E4h]
  '0052043B: push eax
  '0052043C: lea edx, [ebp-40h]
  '0052043F: push edx
  '00520440: call [004011E4h]
  '00520446: add esp, 00000010h
  '00520449: push eax
  '0052044A: call [004011C8h]
  '00520450: push eax
  '00520451: lea eax, [ebp-30h]
  '00520454: push eax
  '00520455: call [004010E4h]
  '0052045B: mov [ebp-78h], eax
  '0052045E: mov [ebp-48h], 00000001h
  '00520465: mov [ebp-50h], 00000002h
  '0052046C: lea ecx, [ebp-50h]
  '0052046F: push ecx
  '00520470: mov edx, [ebp-78h]
  '00520473: mov eax, [edx]
  '00520475: mov ecx, [ebp-78h]
  '00520478: push ecx
  '00520479: call [eax+34h]
  '0052047C: fclex 
  '0052047E: mov [ebp-7Ch], eax
  '00520481: cmp [ebp-7Ch], 00000000h
  '00520485: jnl 5204A4h
  '00520487: push 00000034h
  '00520489: push 0041EFA8h
  '0052048E: mov edx, [ebp-78h]
  '00520491: push edx
  '00520492: mov eax, [ebp-7Ch]
  '00520495: push eax
  '00520496: call [004010A0h]
  '0052049C: mov [ebp-0000009Ch], eax
  '005204A2: jmp 5204AEh
  '005204A4: mov [ebp-0000009Ch], 00000000h
  '005204AE: lea ecx, [ebp-30h]
  '005204B1: push ecx
  '005204B2: lea edx, [ebp-2Ch]
  '005204B5: push edx
  '005204B6: push 00000002h
  '005204B8: call [00401064h]
  '005204BE: add esp, 0000000Ch
  '005204C1: lea eax, [ebp-50h]
  '005204C4: push eax
  '005204C5: lea ecx, [ebp-40h]
  '005204C8: push ecx
  '005204C9: push 00000002h
  '005204CB: call [00401050h]
  '005204D1: add esp, 0000000Ch
  '005204D4: mov [ebp-04h], 00000009h
  '005204DB: push 00000000h
  '005204DD: push 00000002h
  '005204DF: mov edx, [ebp+08h]
  '005204E2: mov eax, [edx]
  '005204E4: mov ecx, [ebp+08h]
  '005204E7: push ecx
  '005204E8: call [eax+00000318h]
  '005204EE: push eax
  '005204EF: lea edx, [ebp-2Ch]
  '005204F2: push edx
  '005204F3: call [004010E4h]
  '005204F9: push eax
  '005204FA: lea eax, [ebp-40h]
  '005204FD: push eax
  '005204FE: call [004011E4h]
  '00520504: add esp, 00000010h
  '00520507: push eax
  '00520508: call [004011DCh]
  '0052050E: fstp real4 ptr [ebp-58h]
  '00520511: mov [ebp-60h], 00000004h
  '00520518: mov eax, 00000010h
  '0052051D: call 004081B0h
  '00520522: mov ecx, esp
  '00520524: mov edx, [ebp-60h]
  '00520527: mov [ecx], edx
  '00520529: mov eax, [ebp-5Ch]
  '0052052C: mov [ecx+04h], eax
  '0052052F: mov edx, [ebp-58h]
  '00520532: mov [ecx+08h], edx
  '00520535: mov eax, [ebp-54h]
  '00520538: mov [ecx+0Ch], eax
  '0052053B: push 00000005h
  '0052053D: mov ecx, [ebp+08h]
  '00520540: mov edx, [ecx]
  '00520542: mov eax, [ebp+08h]
  '00520545: push eax
  '00520546: call [edx+00000318h]
  '0052054C: push eax
  '0052054D: lea ecx, [ebp-30h]
  '00520550: push ecx
  '00520551: call [004010E4h]
  '00520557: push eax
  '00520558: call [0040139Ch]
  '0052055E: lea edx, [ebp-30h]
  '00520561: push edx
  '00520562: lea eax, [ebp-2Ch]
  '00520565: push eax
  '00520566: push 00000002h
  '00520568: call [00401064h]
  '0052056E: add esp, 0000000Ch
  '00520571: lea ecx, [ebp-40h]
  '00520574: call [00401030h]
  '0052057A: mov [ebp-04h], 0000000Ah
  '00520581: mov ecx, [ebp+08h]
  '00520584: mov word ptr [ecx+60h], 0000h
  '0052058A: jmp 00520666h
  '0052058F: mov [ebp-04h], 0000000Ch
  '00520596: push 00000000h
  '00520598: push 00000002h
  '0052059A: mov edx, [ebp+08h]
  '0052059D: mov eax, [edx]
  '0052059F: mov ecx, [ebp+08h]
  '005205A2: push ecx
  '005205A3: call [eax+00000318h]
  '005205A9: push eax
  '005205AA: lea edx, [ebp-2Ch]
  '005205AD: push edx
  '005205AE: call [004010E4h]
  '005205B4: push eax
  '005205B5: lea eax, [ebp-40h]
  '005205B8: push eax
  '005205B9: call [004011E4h]
  '005205BF: add esp, 00000010h
  '005205C2: push eax
  '005205C3: call [004011DCh]
  '005205C9: fstp real4 ptr [ebp-58h]
  '005205CC: mov [ebp-60h], 00000004h
  '005205D3: mov eax, 00000010h
  '005205D8: call 004081B0h
  '005205DD: mov ecx, esp
  '005205DF: mov edx, [ebp-60h]
  '005205E2: mov [ecx], edx
  '005205E4: mov eax, [ebp-5Ch]
  '005205E7: mov [ecx+04h], eax
  '005205EA: mov edx, [ebp-58h]
  '005205ED: mov [ecx+08h], edx
  '005205F0: mov eax, [ebp-54h]
  '005205F3: mov [ecx+0Ch], eax
  '005205F6: push 00000005h
  '005205F8: mov ecx, [ebp+08h]
  '005205FB: mov edx, [ecx]
  '005205FD: mov eax, [ebp+08h]
  '00520600: push eax
  '00520601: call [edx+00000318h]
  '00520607: push eax
  '00520608: lea ecx, [ebp-30h]
  '0052060B: push ecx
  '0052060C: call [004010E4h]
  '00520612: push eax
  '00520613: call [0040139Ch]
  '00520619: lea edx, [ebp-30h]
  '0052061C: push edx
  '0052061D: lea eax, [ebp-2Ch]
  '00520620: push eax
  '00520621: push 00000002h
  '00520623: call [00401064h]
  '00520629: add esp, 0000000Ch
  '0052062C: lea ecx, [ebp-40h]
  '0052062F: call [00401030h]
  '00520635: mov [ebp-04h], 0000000Dh
  '0052063C: mov edx, 0042B080h
  '00520641: lea ecx, [ebp-24h]
  '00520644: call [004012D8h]
  '0052064A: lea ecx, [ebp-24h]
  '0052064D: push ecx
  '0052064E: mov edx, [ebp+08h]
  '00520651: mov eax, [edx]
  '00520653: mov ecx, [ebp+08h]
  '00520656: push ecx
  '00520657: call [eax+00000738h]
  '0052065D: lea ecx, [ebp-24h]
  '00520660: call [004013B4h]
  '00520666: mov [ebp-04h], 0000000Fh
  '0052066D: call [00401104h]
  '00520673: mov [ebp-04h], 00000010h
  '0052067A: cmp [0054238Ch], 00000000h
  '00520681: jnz 52069Fh
  '00520683: push 0054238Ch
  '00520688: push 0041D9E0h
  '0052068D: call [004012B8h]
  '00520693: mov [ebp-000000A0h], 0054238Ch
  '0052069D: jmp 5206A9h
  '0052069F: mov [ebp-000000A0h], 0054238Ch
  '005206A9: mov edx, [ebp-000000A0h]
  '005206AF: mov eax, [edx]
  '005206B1: mov [ebp-78h], eax
  '005206B4: mov ecx, [ebp+08h]
  '005206B7: push ecx
  '005206B8: lea edx, [ebp-2Ch]
  '005206BB: push edx
  '005206BC: call [004010F8h]
  '005206C2: push eax
  '005206C3: mov eax, [ebp-78h]
  '005206C6: mov ecx, [eax]
  '005206C8: mov edx, [ebp-78h]
  '005206CB: push edx
  '005206CC: call [ecx+10h]
  '005206CF: fclex 
  '005206D1: mov [ebp-7Ch], eax
  '005206D4: cmp [ebp-7Ch], 00000000h
  '005206D8: jnl 5206F7h
  '005206DA: push 00000010h
  '005206DC: push 0041D9D0h
  '005206E1: mov eax, [ebp-78h]
  '005206E4: push eax
  '005206E5: mov ecx, [ebp-7Ch]
  '005206E8: push ecx
  '005206E9: call [004010A0h]
  '005206EF: mov [ebp-000000A4h], eax
  '005206F5: jmp 520701h
  '005206F7: mov [ebp-000000A4h], 00000000h
  '00520701: lea ecx, [ebp-2Ch]
  '00520704: call [004013B8h]
  '0052070A: mov [ebp-10h], 00000000h
  '00520711: wait 
  '00520712: push 00520754h
  '00520717: jmp 520753h
  '00520719: lea edx, [ebp-28h]
  '0052071C: push edx
  '0052071D: lea eax, [ebp-24h]
  '00520720: push eax
  '00520721: push 00000002h
  '00520723: call [004012E8h]
  '00520729: add esp, 0000000Ch
  '0052072C: lea ecx, [ebp-30h]
  '0052072F: push ecx
  '00520730: lea edx, [ebp-2Ch]
  '00520733: push edx
  '00520734: push 00000002h
  '00520736: call [00401064h]
  '0052073C: add esp, 0000000Ch
  '0052073F: lea eax, [ebp-50h]
  '00520742: push eax
  '00520743: lea ecx, [ebp-40h]
  '00520746: push ecx
  '00520747: push 00000002h
  '00520749: call [00401050h]
  '0052074F: add esp, 0000000Ch
  '00520752: ret 
End Sub
Private Sub Timer1__523780
  '00523780: push ebp
  '00523781: mov ebp, esp
  '00523783: sub esp, 00000018h
  '00523786: push 004081B6h
  '0052378B: mov eax, fs:[00h]
  '00523791: push eax
  '00523792: mov fs:[00000000h], esp
  '00523799: mov eax, 000002C4h
  '0052379E: call 004081B0h
  '005237A3: push ebx
  '005237A4: push esi
  '005237A5: push edi
  '005237A6: mov [ebp-18h], esp
  '005237A9: mov [ebp-14h], 00407028h
  '005237B0: mov eax, [ebp+08h]
  '005237B3: and eax, 00000001h
  '005237B6: mov [ebp-10h], eax
  '005237B9: mov ecx, [ebp+08h]
  '005237BC: and ecx, FFFFFFFEh
  '005237BF: mov [ebp+08h], ecx
  '005237C2: mov [ebp-0Ch], 00000000h
  '005237C9: mov edx, [ebp+08h]
  '005237CC: mov eax, [edx]
  '005237CE: mov ecx, [ebp+08h]
  '005237D1: push ecx
  '005237D2: call [eax+04h]
  '005237D5: mov [ebp-04h], 00000001h
  '005237DC: mov [ebp-04h], 00000002h
  '005237E3: push FFFFFFFFh
  '005237E5: call [004010E8h]
  '005237EB: mov [ebp-04h], 00000003h
  '005237F2: push 00000000h
  '005237F4: push 00000008h
  '005237F6: mov edx, [ebp+08h]
  '005237F9: mov eax, [edx]
  '005237FB: mov ecx, [ebp+08h]
  '005237FE: push ecx
  '005237FF: call [eax+00000314h]
  '00523805: push eax
  '00523806: lea edx, [ebp-58h]
  '00523809: push edx
  '0052380A: call [004010E4h]
  '00523810: push eax
  '00523811: lea eax, [ebp-74h]
  '00523814: push eax
  '00523815: call [004011E4h]
  '0052381B: add esp, 00000010h
  '0052381E: push eax
  '0052381F: call [00401284h]
  '00523825: movsx ecx, ax
  '00523828: xor edx, edx
  '0052382A: cmp ecx, 00000007h
  '0052382D: setnz dl
  '00523830: neg edx
  '00523832: mov [ebp-000001C8h], dx
  '00523839: lea ecx, [ebp-58h]
  '0052383C: call [004013B8h]
  '00523842: lea ecx, [ebp-74h]
  '00523845: call [00401030h]
  '0052384B: movsx eax, word ptr [ebp-000001C8h]
  '00523852: test eax, eax
  '00523854: jz 52385Bh
  '00523856: jmp 00525985h
  '0052385B: mov [ebp-04h], 00000006h
  '00523862: call [00401104h]
  '00523868: mov [ebp-04h], 00000007h
  '0052386F: push 0041EFA8h
  '00523874: push 00000000h
  '00523876: push 00000007h
  '00523878: mov ecx, [ebp+08h]
  '0052387B: mov edx, [ecx]
  '0052387D: mov eax, [ebp+08h]
  '00523880: push eax
  '00523881: call [edx+0000030Ch]
  '00523887: push eax
  '00523888: lea ecx, [ebp-58h]
  '0052388B: push ecx
  '0052388C: call [004010E4h]
  '00523892: push eax
  '00523893: lea edx, [ebp-74h]
  '00523896: push edx
  '00523897: call [004011E4h]
  '0052389D: add esp, 00000010h
  '005238A0: push eax
  '005238A1: call [004011C8h]
  '005238A7: push eax
  '005238A8: lea eax, [ebp-5Ch]
  '005238AB: push eax
  '005238AC: call [004010E4h]
  '005238B2: mov [ebp-000001C8h], eax
  '005238B8: lea ecx, [ebp-000001B0h]
  '005238BE: push ecx
  '005238BF: mov edx, [ebp-000001C8h]
  '005238C5: mov eax, [edx]
  '005238C7: mov ecx, [ebp-000001C8h]
  '005238CD: push ecx
  '005238CE: call [eax+1Ch]
  '005238D1: fclex 
  '005238D3: mov [ebp-000001CCh], eax
  '005238D9: cmp [ebp-000001CCh], 00000000h
  '005238E0: jnl 523905h
  '005238E2: push 0000001Ch
  '005238E4: push 0041EFA8h
  '005238E9: mov edx, [ebp-000001C8h]
  '005238EF: push edx
  '005238F0: mov eax, [ebp-000001CCh]
  '005238F6: push eax
  '005238F7: call [004010A0h]
  '005238FD: mov [ebp-0000023Ch], eax
  '00523903: jmp 52390Fh
  '00523905: mov [ebp-0000023Ch], 00000000h
  '0052390F: xor ecx, ecx
  '00523911: cmp [ebp-000001B0h], 00000000h
  '00523918: setnle cl
  '0052391B: neg ecx
  '0052391D: mov edx, [ebp+08h]
  '00523920: xor eax, eax
  '00523922: cmp word ptr [edx+60h], 0000h
  '00523927: setz al
  '0052392A: neg eax
  '0052392C: and cx, ax
  '0052392F: mov [ebp-000001D0h], cx
  '00523936: lea ecx, [ebp-5Ch]
  '00523939: push ecx
  '0052393A: lea edx, [ebp-58h]
  '0052393D: push edx
  '0052393E: push 00000002h
  '00523940: call [00401064h]
  '00523946: add esp, 0000000Ch
  '00523949: lea ecx, [ebp-74h]
  '0052394C: call [00401030h]
  '00523952: movsx eax, word ptr [ebp-000001D0h]
  '00523959: test eax, eax
  '0052395B: jz 005256F5h
  '00523961: mov [ebp-04h], 00000008h
  '00523968: push 0041EFA8h
  '0052396D: push 00000000h
  '0052396F: push 00000007h
  '00523971: mov ecx, [ebp+08h]
  '00523974: mov edx, [ecx]
  '00523976: mov eax, [ebp+08h]
  '00523979: push eax
  '0052397A: call [edx+0000030Ch]
  '00523980: push eax
  '00523981: lea ecx, [ebp-58h]
  '00523984: push ecx
  '00523985: call [004010E4h]
  '0052398B: push eax
  '0052398C: lea edx, [ebp-74h]
  '0052398F: push edx
  '00523990: call [004011E4h]
  '00523996: add esp, 00000010h
  '00523999: push eax
  '0052399A: call [004011C8h]
  '005239A0: push eax
  '005239A1: lea eax, [ebp-5Ch]
  '005239A4: push eax
  '005239A5: call [004010E4h]
  '005239AB: mov [ebp-000001C8h], eax
  '005239B1: mov [ebp-7Ch], 00000001h
  '005239B8: mov [ebp-00000084h], 00000002h
  '005239C2: lea ecx, [ebp-60h]
  '005239C5: push ecx
  '005239C6: lea edx, [ebp-00000084h]
  '005239CC: push edx
  '005239CD: mov eax, [ebp-000001C8h]
  '005239D3: mov ecx, [eax]
  '005239D5: mov edx, [ebp-000001C8h]
  '005239DB: push edx
  '005239DC: call [ecx+24h]
  '005239DF: fclex 
  '005239E1: mov [ebp-000001CCh], eax
  '005239E7: cmp [ebp-000001CCh], 00000000h
  '005239EE: jnl 523A13h
  '005239F0: push 00000024h
  '005239F2: push 0041EFA8h
  '005239F7: mov eax, [ebp-000001C8h]
  '005239FD: push eax
  '005239FE: mov ecx, [ebp-000001CCh]
  '00523A04: push ecx
  '00523A05: call [004010A0h]
  '00523A0B: mov [ebp-00000240h], eax
  '00523A11: jmp 523A1Dh
  '00523A13: mov [ebp-00000240h], 00000000h
  '00523A1D: mov edx, [ebp-60h]
  '00523A20: mov [ebp-000001D0h], edx
  '00523A26: push FFFFFFFFh
  '00523A28: mov eax, [ebp-000001D0h]
  '00523A2E: mov ecx, [eax]
  '00523A30: mov edx, [ebp-000001D0h]
  '00523A36: push edx
  '00523A37: call [ecx+60h]
  '00523A3A: fclex 
  '00523A3C: mov [ebp-000001D4h], eax
  '00523A42: cmp [ebp-000001D4h], 00000000h
  '00523A49: jnl 523A6Eh
  '00523A4B: push 00000060h
  '00523A4D: push 0041E438h
  '00523A52: mov eax, [ebp-000001D0h]
  '00523A58: push eax
  '00523A59: mov ecx, [ebp-000001D4h]
  '00523A5F: push ecx
  '00523A60: call [004010A0h]
  '00523A66: mov [ebp-00000244h], eax
  '00523A6C: jmp 523A78h
  '00523A6E: mov [ebp-00000244h], 00000000h
  '00523A78: lea edx, [ebp-60h]
  '00523A7B: push edx
  '00523A7C: lea eax, [ebp-5Ch]
  '00523A7F: push eax
  '00523A80: lea ecx, [ebp-58h]
  '00523A83: push ecx
  '00523A84: push 00000003h
  '00523A86: call [00401064h]
  '00523A8C: add esp, 00000010h
  '00523A8F: lea edx, [ebp-00000084h]
  '00523A95: push edx
  '00523A96: lea eax, [ebp-74h]
  '00523A99: push eax
  '00523A9A: push 00000002h
  '00523A9C: call [00401050h]
  '00523AA2: add esp, 0000000Ch
  '00523AA5: mov [ebp-04h], 00000009h
  '00523AAC: push 0041EFA8h
  '00523AB1: push 00000000h
  '00523AB3: push 00000007h
  '00523AB5: mov ecx, [ebp+08h]
  '00523AB8: mov edx, [ecx]
  '00523ABA: mov eax, [ebp+08h]
  '00523ABD: push eax
  '00523ABE: call [edx+0000030Ch]
  '00523AC4: push eax
  '00523AC5: lea ecx, [ebp-58h]
  '00523AC8: push ecx
  '00523AC9: call [004010E4h]
  '00523ACF: push eax
  '00523AD0: lea edx, [ebp-74h]
  '00523AD3: push edx
  '00523AD4: call [004011E4h]
  '00523ADA: add esp, 00000010h
  '00523ADD: push eax
  '00523ADE: call [004011C8h]
  '00523AE4: push eax
  '00523AE5: lea eax, [ebp-5Ch]
  '00523AE8: push eax
  '00523AE9: call [004010E4h]
  '00523AEF: mov [ebp-000001C8h], eax
  '00523AF5: mov [ebp-7Ch], 00000001h
  '00523AFC: mov [ebp-00000084h], 00000002h
  '00523B06: lea ecx, [ebp-60h]
  '00523B09: push ecx
  '00523B0A: lea edx, [ebp-00000084h]
  '00523B10: push edx
  '00523B11: mov eax, [ebp-000001C8h]
  '00523B17: mov ecx, [eax]
  '00523B19: mov edx, [ebp-000001C8h]
  '00523B1F: push edx
  '00523B20: call [ecx+24h]
  '00523B23: fclex 
  '00523B25: mov [ebp-000001CCh], eax
  '00523B2B: cmp [ebp-000001CCh], 00000000h
  '00523B32: jnl 523B57h
  '00523B34: push 00000024h
  '00523B36: push 0041EFA8h
  '00523B3B: mov eax, [ebp-000001C8h]
  '00523B41: push eax
  '00523B42: mov ecx, [ebp-000001CCh]
  '00523B48: push ecx
  '00523B49: call [004010A0h]
  '00523B4F: mov [ebp-00000248h], eax
  '00523B55: jmp 523B61h
  '00523B57: mov [ebp-00000248h], 00000000h
  '00523B61: mov edx, [ebp-60h]
  '00523B64: mov [ebp-000001D0h], edx
  '00523B6A: push FFFFFFFFh
  '00523B6C: mov eax, [ebp-000001D0h]
  '00523B72: mov ecx, [eax]
  '00523B74: mov edx, [ebp-000001D0h]
  '00523B7A: push edx
  '00523B7B: call [ecx+30h]
  '00523B7E: fclex 
  '00523B80: mov [ebp-000001D4h], eax
  '00523B86: cmp [ebp-000001D4h], 00000000h
  '00523B8D: jnl 523BB2h
  '00523B8F: push 00000030h
  '00523B91: push 0041E438h
  '00523B96: mov eax, [ebp-000001D0h]
  '00523B9C: push eax
  '00523B9D: mov ecx, [ebp-000001D4h]
  '00523BA3: push ecx
  '00523BA4: call [004010A0h]
  '00523BAA: mov [ebp-0000024Ch], eax
  '00523BB0: jmp 523BBCh
  '00523BB2: mov [ebp-0000024Ch], 00000000h
  '00523BBC: lea edx, [ebp-60h]
  '00523BBF: push edx
  '00523BC0: lea eax, [ebp-5Ch]
  '00523BC3: push eax
  '00523BC4: lea ecx, [ebp-58h]
  '00523BC7: push ecx
  '00523BC8: push 00000003h
  '00523BCA: call [00401064h]
  '00523BD0: add esp, 00000010h
  '00523BD3: lea edx, [ebp-00000084h]
  '00523BD9: push edx
  '00523BDA: lea eax, [ebp-74h]
  '00523BDD: push eax
  '00523BDE: push 00000002h
  '00523BE0: call [00401050h]
  '00523BE6: add esp, 0000000Ch
  '00523BE9: mov [ebp-04h], 0000000Ah
  '00523BF0: push 0041E438h
  '00523BF5: push 00000000h
  '00523BF7: push 0000000Dh
  '00523BF9: mov ecx, [ebp+08h]
  '00523BFC: mov edx, [ecx]
  '00523BFE: mov eax, [ebp+08h]
  '00523C01: push eax
  '00523C02: call [edx+0000030Ch]
  '00523C08: push eax
  '00523C09: lea ecx, [ebp-58h]
  '00523C0C: push ecx
  '00523C0D: call [004010E4h]
  '00523C13: push eax
  '00523C14: lea edx, [ebp-74h]
  '00523C17: push edx
  '00523C18: call [004011E4h]
  '00523C1E: add esp, 00000010h
  '00523C21: push eax
  '00523C22: call [004011C8h]
  '00523C28: push eax
  '00523C29: lea eax, [ebp-5Ch]
  '00523C2C: push eax
  '00523C2D: call [004010E4h]
  '00523C33: mov [ebp-000001C8h], eax
  '00523C39: lea ecx, [ebp-00000084h]
  '00523C3F: push ecx
  '00523C40: mov edx, [ebp-000001C8h]
  '00523C46: mov eax, [edx]
  '00523C48: mov ecx, [ebp-000001C8h]
  '00523C4E: push ecx
  '00523C4F: call [eax+6Ch]
  '00523C52: fclex 
  '00523C54: mov [ebp-000001CCh], eax
  '00523C5A: cmp [ebp-000001CCh], 00000000h
  '00523C61: jnl 523C86h
  '00523C63: push 0000006Ch
  '00523C65: push 0041E438h
  '00523C6A: mov edx, [ebp-000001C8h]
  '00523C70: push edx
  '00523C71: mov eax, [ebp-000001CCh]
  '00523C77: push eax
  '00523C78: call [004010A0h]
  '00523C7E: mov [ebp-00000250h], eax
  '00523C84: jmp 523C90h
  '00523C86: mov [ebp-00000250h], 00000000h
  '00523C90: mov [ebp-0000013Ch], 00000002h
  '00523C9A: mov [ebp-00000144h], 00008002h
  '00523CA4: lea ecx, [ebp-00000084h]
  '00523CAA: push ecx
  '00523CAB: lea edx, [ebp-00000144h]
  '00523CB1: push edx
  '00523CB2: call [00401198h]
  '00523CB8: mov [ebp-000001D0h], ax
  '00523CBF: lea eax, [ebp-5Ch]
  '00523CC2: push eax
  '00523CC3: lea ecx, [ebp-58h]
  '00523CC6: push ecx
  '00523CC7: push 00000002h
  '00523CC9: call [00401064h]
  '00523CCF: add esp, 0000000Ch
  '00523CD2: lea edx, [ebp-00000084h]
  '00523CD8: push edx
  '00523CD9: lea eax, [ebp-74h]
  '00523CDC: push eax
  '00523CDD: push 00000002h
  '00523CDF: call [00401050h]
  '00523CE5: add esp, 0000000Ch
  '00523CE8: movsx ecx, word ptr [ebp-000001D0h]
  '00523CEF: test ecx, ecx
  '00523CF1: jz 00524DD3h
  '00523CF7: mov [ebp-04h], 0000000Bh
  '00523CFE: cmp [0054238Ch], 00000000h
  '00523D05: jnz 523D23h
  '00523D07: push 0054238Ch
  '00523D0C: push 0041D9E0h
  '00523D11: call [004012B8h]
  '00523D17: mov [ebp-00000254h], 0054238Ch
  '00523D21: jmp 523D2Dh
  '00523D23: mov [ebp-00000254h], 0054238Ch
  '00523D2D: mov edx, [ebp-00000254h]
  '00523D33: mov eax, [edx]
  '00523D35: mov [ebp-000001C8h], eax
  '00523D3B: lea ecx, [ebp-58h]
  '00523D3E: push ecx
  '00523D3F: mov edx, [ebp-000001C8h]
  '00523D45: mov eax, [edx]
  '00523D47: mov ecx, [ebp-000001C8h]
  '00523D4D: push ecx
  '00523D4E: call [eax+14h]
  '00523D51: fclex 
  '00523D53: mov [ebp-000001CCh], eax
  '00523D59: cmp [ebp-000001CCh], 00000000h
  '00523D60: jnl 523D85h
  '00523D62: push 00000014h
  '00523D64: push 0041D9D0h
  '00523D69: mov edx, [ebp-000001C8h]
  '00523D6F: push edx
  '00523D70: mov eax, [ebp-000001CCh]
  '00523D76: push eax
  '00523D77: call [004010A0h]
  '00523D7D: mov [ebp-00000258h], eax
  '00523D83: jmp 523D8Fh
  '00523D85: mov [ebp-00000258h], 00000000h
  '00523D8F: mov ecx, [ebp-58h]
  '00523D92: mov [ebp-000001D0h], ecx
  '00523D98: lea edx, [ebp-2Ch]
  '00523D9B: push edx
  '00523D9C: mov eax, [ebp-000001D0h]
  '00523DA2: mov ecx, [eax]
  '00523DA4: mov edx, [ebp-000001D0h]
  '00523DAA: push edx
  '00523DAB: call [ecx+50h]
  '00523DAE: fclex 
  '00523DB0: mov [ebp-000001D4h], eax
  '00523DB6: cmp [ebp-000001D4h], 00000000h
  '00523DBD: jnl 523DE2h
  '00523DBF: push 00000050h
  '00523DC1: push 0041D9F0h
  '00523DC6: mov eax, [ebp-000001D0h]
  '00523DCC: push eax
  '00523DCD: mov ecx, [ebp-000001D4h]
  '00523DD3: push ecx
  '00523DD4: call [004010A0h]
  '00523DDA: mov [ebp-0000025Ch], eax
  '00523DE0: jmp 523DECh
  '00523DE2: mov [ebp-0000025Ch], 00000000h
  '00523DEC: push 00000001h
  '00523DEE: mov edx, [ebp-2Ch]
  '00523DF1: push edx
  '00523DF2: call [00401380h]
  '00523DF8: mov edx, eax
  '00523DFA: lea ecx, [ebp-54h]
  '00523DFD: call [00401378h]
  '00523E03: cmp [0054238Ch], 00000000h
  '00523E0A: jnz 523E28h
  '00523E0C: push 0054238Ch
  '00523E11: push 0041D9E0h
  '00523E16: call [004012B8h]
  '00523E1C: mov [ebp-00000260h], 0054238Ch
  '00523E26: jmp 523E32h
  '00523E28: mov [ebp-00000260h], 0054238Ch
  '00523E32: mov eax, [ebp-00000260h]
  '00523E38: mov ecx, [eax]
  '00523E3A: mov [ebp-000001D8h], ecx
  '00523E40: lea edx, [ebp-5Ch]
  '00523E43: push edx
  '00523E44: mov eax, [ebp-000001D8h]
  '00523E4A: mov ecx, [eax]
  '00523E4C: mov edx, [ebp-000001D8h]
  '00523E52: push edx
  '00523E53: call [ecx+14h]
  '00523E56: fclex 
  '00523E58: mov [ebp-000001DCh], eax
  '00523E5E: cmp [ebp-000001DCh], 00000000h
  '00523E65: jnl 523E8Ah
  '00523E67: push 00000014h
  '00523E69: push 0041D9D0h
  '00523E6E: mov eax, [ebp-000001D8h]
  '00523E74: push eax
  '00523E75: mov ecx, [ebp-000001DCh]
  '00523E7B: push ecx
  '00523E7C: call [004010A0h]
  '00523E82: mov [ebp-00000264h], eax
  '00523E88: jmp 523E94h
  '00523E8A: mov [ebp-00000264h], 00000000h
  '00523E94: mov edx, [ebp-5Ch]
  '00523E97: mov [ebp-000001E0h], edx
  '00523E9D: lea eax, [ebp-34h]
  '00523EA0: push eax
  '00523EA1: mov ecx, [ebp-000001E0h]
  '00523EA7: mov edx, [ecx]
  '00523EA9: mov eax, [ebp-000001E0h]
  '00523EAF: push eax
  '00523EB0: call [edx+50h]
  '00523EB3: fclex 
  '00523EB5: mov [ebp-000001E4h], eax
  '00523EBB: cmp [ebp-000001E4h], 00000000h
  '00523EC2: jnl 523EE7h
  '00523EC4: push 00000050h
  '00523EC6: push 0041D9F0h
  '00523ECB: mov ecx, [ebp-000001E0h]
  '00523ED1: push ecx
  '00523ED2: mov edx, [ebp-000001E4h]
  '00523ED8: push edx
  '00523ED9: call [004010A0h]
  '00523EDF: mov [ebp-00000268h], eax
  '00523EE5: jmp 523EF1h
  '00523EE7: mov [ebp-00000268h], 00000000h
  '00523EF1: lea eax, [ebp-38h]
  '00523EF4: push eax
  '00523EF5: mov ecx, [ebp+08h]
  '00523EF8: mov edx, [ecx]
  '00523EFA: mov eax, [ebp+08h]
  '00523EFD: push eax
  '00523EFE: call [edx+50h]
  '00523F01: fclex 
  '00523F03: mov [ebp-000001E8h], eax
  '00523F09: cmp [ebp-000001E8h], 00000000h
  '00523F10: jnl 523F32h
  '00523F12: push 00000050h
  '00523F14: push 004208E0h
  '00523F19: mov ecx, [ebp+08h]
  '00523F1C: push ecx
  '00523F1D: mov edx, [ebp-000001E8h]
  '00523F23: push edx
  '00523F24: call [004010A0h]
  '00523F2A: mov [ebp-0000026Ch], eax
  '00523F30: jmp 523F3Ch
  '00523F32: mov [ebp-0000026Ch], 00000000h
  '00523F3C: lea eax, [ebp-3Ch]
  '00523F3F: push eax
  '00523F40: mov ecx, [ebp+08h]
  '00523F43: mov edx, [ecx]
  '00523F45: mov eax, [ebp+08h]
  '00523F48: push eax
  '00523F49: call [edx+50h]
  '00523F4C: fclex 
  '00523F4E: mov [ebp-000001ECh], eax
  '00523F54: cmp [ebp-000001ECh], 00000000h
  '00523F5B: jnl 523F7Dh
  '00523F5D: push 00000050h
  '00523F5F: push 004208E0h
  '00523F64: mov ecx, [ebp+08h]
  '00523F67: push ecx
  '00523F68: mov edx, [ebp-000001ECh]
  '00523F6E: push edx
  '00523F6F: call [004010A0h]
  '00523F75: mov [ebp-00000270h], eax
  '00523F7B: jmp 523F87h
  '00523F7D: mov [ebp-00000270h], 00000000h
  '00523F87: mov [ebp-0000014Ch], 0042B158h
  '00523F91: mov [ebp-00000154h], 00000008h
  '00523F9B: lea edx, [ebp-00000154h]
  '00523FA1: lea ecx, [ebp-00000084h]
  '00523FA7: call [00401338h]
  '00523FAD: mov eax, [ebp-3Ch]
  '00523FB0: mov [ebp-0000021Ch], eax
  '00523FB6: mov [ebp-3Ch], 00000000h
  '00523FBD: mov ecx, [ebp-0000021Ch]
  '00523FC3: mov [ebp-6Ch], ecx
  '00523FC6: mov [ebp-74h], 00000008h
  '00523FCD: mov edx, [ebp-38h]
  '00523FD0: push edx
  '00523FD1: call [00401044h]
  '00523FD7: xor ecx, ecx
  '00523FD9: test eax, eax
  '00523FDB: setnle cl
  '00523FDE: neg ecx
  '00523FE0: mov [ebp-0000013Ch], cx
  '00523FE7: mov [ebp-00000144h], 0000000Bh
  '00523FF1: lea edx, [ebp-00000084h]
  '00523FF7: push edx
  '00523FF8: lea eax, [ebp-74h]
  '00523FFB: push eax
  '00523FFC: lea ecx, [ebp-00000144h]
  '00524002: push ecx
  '00524003: lea edx, [ebp-00000094h]
  '00524009: push edx
  '0052400A: call [004012DCh]
  '00524010: lea eax, [ebp-48h]
  '00524013: push eax
  '00524014: mov ecx, [ebp+08h]
  '00524017: mov edx, [ecx]
  '00524019: mov eax, [ebp+08h]
  '0052401C: push eax
  '0052401D: call [edx+50h]
  '00524020: fclex 
  '00524022: mov [ebp-000001F0h], eax
  '00524028: cmp [ebp-000001F0h], 00000000h
  '0052402F: jnl 524051h
  '00524031: push 00000050h
  '00524033: push 004208E0h
  '00524038: mov ecx, [ebp+08h]
  '0052403B: push ecx
  '0052403C: mov edx, [ebp-000001F0h]
  '00524042: push edx
  '00524043: call [004010A0h]
  '00524049: mov [ebp-00000274h], eax
  '0052404F: jmp 52405Bh
  '00524051: mov [ebp-00000274h], 00000000h
  '0052405B: lea eax, [ebp-4Ch]
  '0052405E: push eax
  '0052405F: mov ecx, [ebp+08h]
  '00524062: mov edx, [ecx]
  '00524064: mov eax, [ebp+08h]
  '00524067: push eax
  '00524068: call [edx+50h]
  '0052406B: fclex 
  '0052406D: mov [ebp-000001F4h], eax
  '00524073: cmp [ebp-000001F4h], 00000000h
  '0052407A: jnl 52409Ch
  '0052407C: push 00000050h
  '0052407E: push 004208E0h
  '00524083: mov ecx, [ebp+08h]
  '00524086: push ecx
  '00524087: mov edx, [ebp-000001F4h]
  '0052408D: push edx
  '0052408E: call [004010A0h]
  '00524094: mov [ebp-00000278h], eax
  '0052409A: jmp 5240A6h
  '0052409C: mov [ebp-00000278h], 00000000h
  '005240A6: cmp [0054238Ch], 00000000h
  '005240AD: jnz 5240CBh
  '005240AF: push 0054238Ch
  '005240B4: push 0041D9E0h
  '005240B9: call [004012B8h]
  '005240BF: mov [ebp-0000027Ch], 0054238Ch
  '005240C9: jmp 5240D5h
  '005240CB: mov [ebp-0000027Ch], 0054238Ch
  '005240D5: mov eax, [ebp-0000027Ch]
  '005240DB: mov ecx, [eax]
  '005240DD: mov [ebp-000001F8h], ecx
  '005240E3: lea edx, [ebp-60h]
  '005240E6: push edx
  '005240E7: mov eax, [ebp-000001F8h]
  '005240ED: mov ecx, [eax]
  '005240EF: mov edx, [ebp-000001F8h]
  '005240F5: push edx
  '005240F6: call [ecx+14h]
  '005240F9: fclex 
  '005240FB: mov [ebp-000001FCh], eax
  '00524101: cmp [ebp-000001FCh], 00000000h
  '00524108: jnl 52412Dh
  '0052410A: push 00000014h
  '0052410C: push 0041D9D0h
  '00524111: mov eax, [ebp-000001F8h]
  '00524117: push eax
  '00524118: mov ecx, [ebp-000001FCh]
  '0052411E: push ecx
  '0052411F: call [004010A0h]
  '00524125: mov [ebp-00000280h], eax
  '0052412B: jmp 524137h
  '0052412D: mov [ebp-00000280h], 00000000h
  '00524137: mov edx, [ebp-60h]
  '0052413A: mov [ebp-00000200h], edx
  '00524140: lea eax, [ebp-40h]
  '00524143: push eax
  '00524144: mov ecx, [ebp-00000200h]
  '0052414A: mov edx, [ecx]
  '0052414C: mov eax, [ebp-00000200h]
  '00524152: push eax
  '00524153: call [edx+50h]
  '00524156: fclex 
  '00524158: mov [ebp-00000204h], eax
  '0052415E: cmp [ebp-00000204h], 00000000h
  '00524165: jnl 52418Ah
  '00524167: push 00000050h
  '00524169: push 0041D9F0h
  '0052416E: mov ecx, [ebp-00000200h]
  '00524174: push ecx
  '00524175: mov edx, [ebp-00000204h]
  '0052417B: push edx
  '0052417C: call [004010A0h]
  '00524182: mov [ebp-00000284h], eax
  '00524188: jmp 524194h
  '0052418A: mov [ebp-00000284h], 00000000h
  '00524194: mov eax, [ebp-40h]
  '00524197: push eax
  '00524198: push 0041DE34h
  '0052419D: call [0040108Ch]
  '005241A3: mov edx, eax
  '005241A5: lea ecx, [ebp-44h]
  '005241A8: call [00401378h]
  '005241AE: push eax
  '005241AF: push 0042B140h
  '005241B4: call [0040108Ch]
  '005241BA: mov [ebp-000000FCh], eax
  '005241C0: mov [ebp-00000104h], 00000008h
  '005241CA: mov [ebp-0000017Ch], 0042B158h
  '005241D4: mov [ebp-00000184h], 00000008h
  '005241DE: lea edx, [ebp-00000184h]
  '005241E4: lea ecx, [ebp-000000E4h]
  '005241EA: call [00401338h]
  '005241F0: mov ecx, [ebp-4Ch]
  '005241F3: mov [ebp-00000220h], ecx
  '005241F9: mov [ebp-4Ch], 00000000h
  '00524200: mov edx, [ebp-00000220h]
  '00524206: mov [ebp-000000CCh], edx
  '0052420C: mov [ebp-000000D4h], 00000008h
  '00524216: mov eax, [ebp-48h]
  '00524219: push eax
  '0052421A: call [00401044h]
  '00524220: xor ecx, ecx
  '00524222: test eax, eax
  '00524224: setnle cl
  '00524227: neg ecx
  '00524229: mov [ebp-0000016Ch], cx
  '00524230: mov [ebp-00000174h], 0000000Bh
  '0052423A: lea edx, [ebp-000000E4h]
  '00524240: push edx
  '00524241: lea eax, [ebp-000000D4h]
  '00524247: push eax
  '00524248: lea ecx, [ebp-00000174h]
  '0052424E: push ecx
  '0052424F: lea edx, [ebp-000000F4h]
  '00524255: push edx
  '00524256: call [004012DCh]
  '0052425C: mov eax, [ebp-34h]
  '0052425F: push eax
  '00524260: push 0042B140h
  '00524265: call [0040108Ch]
  '0052426B: mov [ebp-0000009Ch], eax
  '00524271: mov [ebp-000000A4h], 00000008h
  '0052427B: mov [ebp-0000015Ch], 0041DE34h
  '00524285: mov [ebp-00000164h], 00000008h
  '0052428F: mov ecx, [ebp-54h]
  '00524292: mov [ebp-00000224h], ecx
  '00524298: mov [ebp-54h], 00000000h
  '0052429F: mov edx, [ebp-00000224h]
  '005242A5: lea ecx, [ebp-30h]
  '005242A8: call [00401378h]
  '005242AE: push eax
  '005242AF: push 0041DE34h
  '005242B4: call [00401184h]
  '005242BA: neg eax
  '005242BC: sbb eax, eax
  '005242BE: inc eax
  '005242BF: neg eax
  '005242C1: mov [ebp-0000018Ch], ax
  '005242C8: mov [ebp-00000194h], 0000000Bh
  '005242D2: lea edx, [ebp-00000104h]
  '005242D8: push edx
  '005242D9: lea eax, [ebp-000000F4h]
  '005242DF: push eax
  '005242E0: lea ecx, [ebp-00000114h]
  '005242E6: push ecx
  '005242E7: call [00401274h]
  '005242ED: push eax
  '005242EE: lea edx, [ebp-000000A4h]
  '005242F4: push edx
  '005242F5: lea eax, [ebp-00000094h]
  '005242FB: push eax
  '005242FC: lea ecx, [ebp-000000B4h]
  '00524302: push ecx
  '00524303: call [00401274h]
  '00524309: push eax
  '0052430A: lea edx, [ebp-00000164h]
  '00524310: push edx
  '00524311: lea eax, [ebp-000000C4h]
  '00524317: push eax
  '00524318: call [00401274h]
  '0052431E: push eax
  '0052431F: lea ecx, [ebp-00000194h]
  '00524325: push ecx
  '00524326: lea edx, [ebp-00000124h]
  '0052432C: push edx
  '0052432D: call [004012DCh]
  '00524333: mov [ebp-0000019Ch], 0041DE34h
  '0052433D: mov [ebp-000001A4h], 00000008h
  '00524347: lea eax, [ebp-00000124h]
  '0052434D: push eax
  '0052434E: lea ecx, [ebp-000001A4h]
  '00524354: push ecx
  '00524355: lea edx, [ebp-00000134h]
  '0052435B: push edx
  '0052435C: call [00401274h]
  '00524362: push eax
  '00524363: call [0040103Ch]
  '00524369: mov edx, eax
  '0052436B: lea ecx, [ebp-50h]
  '0052436E: call [00401378h]
  '00524374: mov edx, eax
  '00524376: mov ecx, [ebp+08h]
  '00524379: add ecx, 00000040h
  '0052437C: call [004012D8h]
  '00524382: lea eax, [ebp-54h]
  '00524385: push eax
  '00524386: lea ecx, [ebp-50h]
  '00524389: push ecx
  '0052438A: lea edx, [ebp-48h]
  '0052438D: push edx
  '0052438E: lea eax, [ebp-44h]
  '00524391: push eax
  '00524392: lea ecx, [ebp-40h]
  '00524395: push ecx
  '00524396: lea edx, [ebp-38h]
  '00524399: push edx
  '0052439A: lea eax, [ebp-34h]
  '0052439D: push eax
  '0052439E: lea ecx, [ebp-30h]
  '005243A1: push ecx
  '005243A2: lea edx, [ebp-2Ch]
  '005243A5: push edx
  '005243A6: push 00000009h
  '005243A8: call [004012E8h]
  '005243AE: add esp, 00000028h
  '005243B1: lea eax, [ebp-60h]
  '005243B4: push eax
  '005243B5: lea ecx, [ebp-5Ch]
  '005243B8: push ecx
  '005243B9: lea edx, [ebp-58h]
  '005243BC: push edx
  '005243BD: push 00000003h
  '005243BF: call [00401064h]
  '005243C5: add esp, 00000010h
  '005243C8: lea eax, [ebp-00000134h]
  '005243CE: push eax
  '005243CF: lea ecx, [ebp-00000124h]
  '005243D5: push ecx
  '005243D6: lea edx, [ebp-00000114h]
  '005243DC: push edx
  '005243DD: lea eax, [ebp-000000C4h]
  '005243E3: push eax
  '005243E4: lea ecx, [ebp-00000194h]
  '005243EA: push ecx
  '005243EB: lea edx, [ebp-000000F4h]
  '005243F1: push edx
  '005243F2: lea eax, [ebp-00000104h]
  '005243F8: push eax
  '005243F9: lea ecx, [ebp-000000E4h]
  '005243FF: push ecx
  '00524400: lea edx, [ebp-000000D4h]
  '00524406: push edx
  '00524407: lea eax, [ebp-00000174h]
  '0052440D: push eax
  '0052440E: lea ecx, [ebp-000000B4h]
  '00524414: push ecx
  '00524415: lea edx, [ebp-00000094h]
  '0052441B: push edx
  '0052441C: lea eax, [ebp-000000A4h]
  '00524422: push eax
  '00524423: lea ecx, [ebp-00000084h]
  '00524429: push ecx
  '0052442A: lea edx, [ebp-74h]
  '0052442D: push edx
  '0052442E: lea eax, [ebp-00000144h]
  '00524434: push eax
  '00524435: push 00000010h
  '00524437: call [00401050h]
  '0052443D: add esp, 00000044h
  '00524440: mov [ebp-04h], 0000000Ch
  '00524447: mov ecx, [ebp+08h]
  '0052444A: mov edx, [ecx+40h]
  '0052444D: push edx
  '0052444E: lea eax, [ebp-2Ch]
  '00524451: push eax
  '00524452: call [00401330h]
  '00524458: push eax
  '00524459: call 0041DB7Ch
  '0052445E: call [0040109Ch]
  '00524464: mov ecx, [ebp-2Ch]
  '00524467: push ecx
  '00524468: mov edx, [ebp+08h]
  '0052446B: add edx, 00000040h
  '0052446E: push edx
  '0052446F: call [00401238h]
  '00524475: lea ecx, [ebp-2Ch]
  '00524478: call [004013B4h]
  '0052447E: mov [ebp-04h], 0000000Dh
  '00524485: call [00401104h]
  '0052448B: mov [ebp-04h], 0000000Eh
  '00524492: push 0041E438h
  '00524497: push 00000000h
  '00524499: push 0000000Dh
  '0052449B: mov eax, [ebp+08h]
  '0052449E: mov ecx, [eax]
  '005244A0: mov edx, [ebp+08h]
  '005244A3: push edx
  '005244A4: call [ecx+0000030Ch]
  '005244AA: push eax
  '005244AB: lea eax, [ebp-58h]
  '005244AE: push eax
  '005244AF: call [004010E4h]
  '005244B5: push eax
  '005244B6: lea ecx, [ebp-74h]
  '005244B9: push ecx
  '005244BA: call [004011E4h]
  '005244C0: add esp, 00000010h
  '005244C3: push eax
  '005244C4: call [004011C8h]
  '005244CA: push eax
  '005244CB: lea edx, [ebp-5Ch]
  '005244CE: push edx
  '005244CF: call [004010E4h]
  '005244D5: mov [ebp-000001C8h], eax
  '005244DB: lea eax, [ebp-2Ch]
  '005244DE: push eax
  '005244DF: mov ecx, [ebp-000001C8h]
  '005244E5: mov edx, [ecx]
  '005244E7: mov eax, [ebp-000001C8h]
  '005244ED: push eax
  '005244EE: call [edx+24h]
  '005244F1: fclex 
  '005244F3: mov [ebp-000001CCh], eax
  '005244F9: cmp [ebp-000001CCh], 00000000h
  '00524500: jnl 524525h
  '00524502: push 00000024h
  '00524504: push 0041E438h
  '00524509: mov ecx, [ebp-000001C8h]
  '0052450F: push ecx
  '00524510: mov edx, [ebp-000001CCh]
  '00524516: push edx
  '00524517: call [004010A0h]
  '0052451D: mov [ebp-00000288h], eax
  '00524523: jmp 52452Fh
  '00524525: mov [ebp-00000288h], 00000000h
  '0052452F: mov eax, [ebp-2Ch]
  '00524532: mov [ebp-00000228h], eax
  '00524538: mov [ebp-2Ch], 00000000h
  '0052453F: mov edx, [ebp-00000228h]
  '00524545: lea ecx, [ebp-30h]
  '00524548: call [00401378h]
  '0052454E: lea ecx, [ebp-30h]
  '00524551: push ecx
  '00524552: call 005194F0h
  '00524557: mov edx, eax
  '00524559: lea ecx, [ebp-34h]
  '0052455C: call [00401378h]
  '00524562: mov edx, eax
  '00524564: mov ecx, [ebp+08h]
  '00524567: add ecx, 0000003Ch
  '0052456A: call [004012D8h]
  '00524570: lea edx, [ebp-34h]
  '00524573: push edx
  '00524574: lea eax, [ebp-30h]
  '00524577: push eax
  '00524578: push 00000002h
  '0052457A: call [004012E8h]
  '00524580: add esp, 0000000Ch
  '00524583: lea ecx, [ebp-5Ch]
  '00524586: push ecx
  '00524587: lea edx, [ebp-58h]
  '0052458A: push edx
  '0052458B: push 00000002h
  '0052458D: call [00401064h]
  '00524593: add esp, 0000000Ch
  '00524596: lea ecx, [ebp-74h]
  '00524599: call [00401030h]
  '0052459F: mov [ebp-04h], 0000000Fh
  '005245A6: mov eax, [ebp+08h]
  '005245A9: mov ecx, [eax+3Ch]
  '005245AC: push ecx
  '005245AD: push 00423E5Ch
  '005245B2: call [00401184h]
  '005245B8: test eax, eax
  '005245BA: jnz 00524661h
  '005245C0: mov [ebp-04h], 00000010h
  '005245C7: lea edx, [ebp-74h]
  '005245CA: push edx
  '005245CB: call [00401334h]
  '005245D1: push 0042B16Ch
  '005245D6: push 00000000h
  '005245D8: push FFFFFFFFh
  '005245DA: push 00000001h
  '005245DC: push 0041E8A8h
  '005245E1: push 0041E6DCh
  '005245E6: lea eax, [ebp-74h]
  '005245E9: push eax
  '005245EA: lea ecx, [ebp-2Ch]
  '005245ED: push ecx
  '005245EE: call [0040126Ch]
  '005245F4: push eax
  '005245F5: call [00401230h]
  '005245FB: mov edx, eax
  '005245FD: lea ecx, [ebp-30h]
  '00524600: call [00401378h]
  '00524606: push eax
  '00524607: call [0040108Ch]
  '0052460D: mov edx, eax
  '0052460F: lea ecx, [ebp-34h]
  '00524612: call [00401378h]
  '00524618: push eax
  '00524619: push 004254C0h
  '0052461E: call [0040108Ch]
  '00524624: mov edx, eax
  '00524626: lea ecx, [ebp-38h]
  '00524629: call [00401378h]
  '0052462F: mov edx, eax
  '00524631: mov ecx, [ebp+08h]
  '00524634: add ecx, 0000003Ch
  '00524637: call [004012D8h]
  '0052463D: lea edx, [ebp-38h]
  '00524640: push edx
  '00524641: lea eax, [ebp-34h]
  '00524644: push eax
  '00524645: lea ecx, [ebp-30h]
  '00524648: push ecx
  '00524649: lea edx, [ebp-2Ch]
  '0052464C: push edx
  '0052464D: push 00000004h
  '0052464F: call [004012E8h]
  '00524655: add esp, 00000014h
  '00524658: lea ecx, [ebp-74h]
  '0052465B: call [00401030h]
  '00524661: mov [ebp-04h], 00000012h
  '00524668: mov eax, [ebp+08h]
  '0052466B: mov ecx, [eax+40h]
  '0052466E: push ecx
  '0052466F: mov edx, [ebp+08h]
  '00524672: mov eax, [edx+3Ch]
  '00524675: push eax
  '00524676: call [0040108Ch]
  '0052467C: mov edx, eax
  '0052467E: lea ecx, [ebp-2Ch]
  '00524681: call [00401378h]
  '00524687: push eax
  '00524688: call 00520140h
  '0052468D: mov [ebp-000001C8h], ax
  '00524694: lea ecx, [ebp-2Ch]
  '00524697: call [004013B4h]
  '0052469D: movsx ecx, word ptr [ebp-000001C8h]
  '005246A4: test ecx, ecx
  '005246A6: jz 00524B2Ah
  '005246AC: mov [ebp-04h], 00000013h
  '005246B3: push 0042B184h
  '005246B8: mov edx, [ebp+08h]
  '005246BB: mov eax, [edx+3Ch]
  '005246BE: push eax
  '005246BF: call [0040108Ch]
  '005246C5: mov edx, eax
  '005246C7: lea ecx, [ebp-2Ch]
  '005246CA: call [00401378h]
  '005246D0: push eax
  '005246D1: push 0042B1C8h
  '005246D6: call [0040108Ch]
  '005246DC: mov edx, eax
  '005246DE: lea ecx, [ebp-30h]
  '005246E1: call [00401378h]
  '005246E7: lea ecx, [ebp-30h]
  '005246EA: push ecx
  '005246EB: call 00517B00h
  '005246F0: xor edx, edx
  '005246F2: cmp ax, FFFFh
  '005246F6: setz dl
  '005246F9: neg edx
  '005246FB: mov [ebp-000001C8h], dx
  '00524702: lea eax, [ebp-30h]
  '00524705: push eax
  '00524706: lea ecx, [ebp-2Ch]
  '00524709: push ecx
  '0052470A: push 00000002h
  '0052470C: call [004012E8h]
  '00524712: add esp, 0000000Ch
  '00524715: movsx edx, word ptr [ebp-000001C8h]
  '0052471C: test edx, edx
  '0052471E: jz 52479Ah
  '00524720: mov [ebp-04h], 00000014h
  '00524727: mov eax, [ebp+08h]
  '0052472A: mov ecx, [eax+40h]
  '0052472D: push ecx
  '0052472E: mov edx, [ebp+08h]
  '00524731: mov eax, [edx+3Ch]
  '00524734: push eax
  '00524735: call [0040108Ch]
  '0052473B: mov [ebp-6Ch], eax
  '0052473E: mov [ebp-74h], 00000008h
  '00524745: lea ecx, [ebp-74h]
  '00524748: push ecx
  '00524749: call [00401188h]
  '0052474F: lea ecx, [ebp-74h]
  '00524752: call [00401030h]
  '00524758: mov [ebp-04h], 00000015h
  '0052475F: mov edx, [ebp+08h]
  '00524762: mov eax, [edx+40h]
  '00524765: push eax
  '00524766: mov ecx, [ebp+08h]
  '00524769: mov edx, [ecx+3Ch]
  '0052476C: push edx
  '0052476D: call [0040108Ch]
  '00524773: mov edx, eax
  '00524775: lea ecx, [ebp-2Ch]
  '00524778: call [00401378h]
  '0052477E: mov edx, eax
  '00524780: mov ecx, [ebp+08h]
  '00524783: add ecx, 00000044h
  '00524786: call [004012D8h]
  '0052478C: lea ecx, [ebp-2Ch]
  '0052478F: call [004013B4h]
  '00524795: jmp 00524B28h
  '0052479A: mov [ebp-04h], 00000017h
  '005247A1: push 00409784h
  '005247A6: call [00401200h]
  '005247AC: push eax
  '005247AD: lea eax, [ebp-24h]
  '005247B0: push eax
  '005247B1: call [004010E4h]
  '005247B7: mov [ebp-04h], 00000018h
  '005247BE: lea ecx, [ebp-000001B0h]
  '005247C4: push ecx
  '005247C5: mov edx, [ebp+08h]
  '005247C8: mov eax, [edx]
  '005247CA: mov ecx, [ebp+08h]
  '005247CD: push ecx
  '005247CE: call [eax+58h]
  '005247D1: fclex 
  '005247D3: mov [ebp-000001C8h], eax
  '005247D9: cmp [ebp-000001C8h], 00000000h
  '005247E0: jnl 524802h
  '005247E2: push 00000058h
  '005247E4: push 004208E0h
  '005247E9: mov edx, [ebp+08h]
  '005247EC: push edx
  '005247ED: mov eax, [ebp-000001C8h]
  '005247F3: push eax
  '005247F4: call [004010A0h]
  '005247FA: mov [ebp-0000028Ch], eax
  '00524800: jmp 52480Ch
  '00524802: mov [ebp-0000028Ch], 00000000h
  '0052480C: mov [ebp-000001BCh], 00000000h
  '00524816: mov ecx, [ebp-000001B0h]
  '0052481C: mov [ebp-000001B8h], ecx
  '00524822: xor edx, edx
  '00524824: lea ecx, [ebp-38h]
  '00524827: call [004012D8h]
  '0052482D: mov edx, 0042B270h
  '00524832: lea ecx, [ebp-34h]
  '00524835: call [004012D8h]
  '0052483B: mov [ebp-000001B4h], 00000001h
  '00524845: mov edx, 0042B244h
  '0052484A: lea ecx, [ebp-30h]
  '0052484D: call [004012D8h]
  '00524853: mov word ptr [ebp-000001A8h], FFFFh
  '0052485C: xor edx, edx
  '0052485E: lea ecx, [ebp-2Ch]
  '00524861: call [004012D8h]
  '00524867: lea edx, [ebp-000001ACh]
  '0052486D: push edx
  '0052486E: lea eax, [ebp-000001BCh]
  '00524874: push eax
  '00524875: lea ecx, [ebp-000001B8h]
  '0052487B: push ecx
  '0052487C: lea edx, [ebp-38h]
  '0052487F: push edx
  '00524880: lea eax, [ebp-34h]
  '00524883: push eax
  '00524884: mov ecx, [ebp+08h]
  '00524887: add ecx, 00000040h
  '0052488A: push ecx
  '0052488B: lea edx, [ebp-000001B4h]
  '00524891: push edx
  '00524892: lea eax, [ebp-30h]
  '00524895: push eax
  '00524896: lea ecx, [ebp-000001A8h]
  '0052489C: push ecx
  '0052489D: lea edx, [ebp-2Ch]
  '005248A0: push edx
  '005248A1: lea eax, [ebp-28h]
  '005248A4: push eax
  '005248A5: mov ecx, [ebp-24h]
  '005248A8: mov edx, [ecx]
  '005248AA: mov eax, [ebp-24h]
  '005248AD: push eax
  '005248AE: call [edx+28h]
  '005248B1: fclex 
  '005248B3: mov [ebp-000001CCh], eax
  '005248B9: cmp [ebp-000001CCh], 00000000h
  '005248C0: jnl 5248E2h
  '005248C2: push 00000028h
  '005248C4: push 0041D108h
  '005248C9: mov ecx, [ebp-24h]
  '005248CC: push ecx
  '005248CD: mov edx, [ebp-000001CCh]
  '005248D3: push edx
  '005248D4: call [004010A0h]
  '005248DA: mov [ebp-00000290h], eax
  '005248E0: jmp 5248ECh
  '005248E2: mov [ebp-00000290h], 00000000h
  '005248EC: lea eax, [ebp-38h]
  '005248EF: push eax
  '005248F0: lea ecx, [ebp-34h]
  '005248F3: push ecx
  '005248F4: lea edx, [ebp-30h]
  '005248F7: push edx
  '005248F8: lea eax, [ebp-2Ch]
  '005248FB: push eax
  '005248FC: push 00000004h
  '005248FE: call [004012E8h]
  '00524904: add esp, 00000014h
  '00524907: mov [ebp-04h], 00000019h
  '0052490E: push 0041D108h
  '00524913: push 00000000h
  '00524915: call [0040137Ch]
  '0052491B: push eax
  '0052491C: lea ecx, [ebp-24h]
  '0052491F: push ecx
  '00524920: call [004010E4h]
  '00524926: mov [ebp-04h], 0000001Ah
  '0052492D: mov edx, [ebp-28h]
  '00524930: push edx
  '00524931: push 0041BC60h
  '00524936: call [00401184h]
  '0052493C: test eax, eax
  '0052493E: jz 52495Bh
  '00524940: mov [ebp-04h], 0000001Bh
  '00524947: mov edx, [ebp-28h]
  '0052494A: mov ecx, [ebp+08h]
  '0052494D: add ecx, 00000044h
  '00524950: call [004012D8h]
  '00524956: jmp 00524B28h
  '0052495B: mov [ebp-04h], 0000001Dh
  '00524962: push 0041EFA8h
  '00524967: push 00000000h
  '00524969: push 00000007h
  '0052496B: mov eax, [ebp+08h]
  '0052496E: mov ecx, [eax]
  '00524970: mov edx, [ebp+08h]
  '00524973: push edx
  '00524974: call [ecx+0000030Ch]
  '0052497A: push eax
  '0052497B: lea eax, [ebp-58h]
  '0052497E: push eax
  '0052497F: call [004010E4h]
  '00524985: push eax
  '00524986: lea ecx, [ebp-74h]
  '00524989: push ecx
  '0052498A: call [004011E4h]
  '00524990: add esp, 00000010h
  '00524993: push eax
  '00524994: call [004011C8h]
  '0052499A: push eax
  '0052499B: lea edx, [ebp-5Ch]
  '0052499E: push edx
  '0052499F: call [004010E4h]
  '005249A5: mov [ebp-000001C8h], eax
  '005249AB: lea eax, [ebp-000001B0h]
  '005249B1: push eax
  '005249B2: mov ecx, [ebp-000001C8h]
  '005249B8: mov edx, [ecx]
  '005249BA: mov eax, [ebp-000001C8h]
  '005249C0: push eax
  '005249C1: call [edx+1Ch]
  '005249C4: fclex 
  '005249C6: mov [ebp-000001CCh], eax
  '005249CC: cmp [ebp-000001CCh], 00000000h
  '005249D3: jnl 5249F8h
  '005249D5: push 0000001Ch
  '005249D7: push 0041EFA8h
  '005249DC: mov ecx, [ebp-000001C8h]
  '005249E2: push ecx
  '005249E3: mov edx, [ebp-000001CCh]
  '005249E9: push edx
  '005249EA: call [004010A0h]
  '005249F0: mov [ebp-00000294h], eax
  '005249F6: jmp 524A02h
  '005249F8: mov [ebp-00000294h], 00000000h
  '00524A02: xor eax, eax
  '00524A04: cmp [ebp-000001B0h], 00000001h
  '00524A0B: setnl al
  '00524A0E: neg eax
  '00524A10: mov [ebp-000001D0h], ax
  '00524A17: lea ecx, [ebp-5Ch]
  '00524A1A: push ecx
  '00524A1B: lea edx, [ebp-58h]
  '00524A1E: push edx
  '00524A1F: push 00000002h
  '00524A21: call [00401064h]
  '00524A27: add esp, 0000000Ch
  '00524A2A: lea ecx, [ebp-74h]
  '00524A2D: call [00401030h]
  '00524A33: movsx eax, word ptr [ebp-000001D0h]
  '00524A3A: test eax, eax
  '00524A3C: jz 00524B23h
  '00524A42: mov [ebp-04h], 0000001Eh
  '00524A49: push 0041EFA8h
  '00524A4E: push 00000000h
  '00524A50: push 00000007h
  '00524A52: mov ecx, [ebp+08h]
  '00524A55: mov edx, [ecx]
  '00524A57: mov eax, [ebp+08h]
  '00524A5A: push eax
  '00524A5B: call [edx+0000030Ch]
  '00524A61: push eax
  '00524A62: lea ecx, [ebp-58h]
  '00524A65: push ecx
  '00524A66: call [004010E4h]
  '00524A6C: push eax
  '00524A6D: lea edx, [ebp-74h]
  '00524A70: push edx
  '00524A71: call [004011E4h]
  '00524A77: add esp, 00000010h
  '00524A7A: push eax
  '00524A7B: call [004011C8h]
  '00524A81: push eax
  '00524A82: lea eax, [ebp-5Ch]
  '00524A85: push eax
  '00524A86: call [004010E4h]
  '00524A8C: mov [ebp-000001C8h], eax
  '00524A92: mov [ebp-7Ch], 00000001h
  '00524A99: mov [ebp-00000084h], 00000002h
  '00524AA3: lea ecx, [ebp-00000084h]
  '00524AA9: push ecx
  '00524AAA: mov edx, [ebp-000001C8h]
  '00524AB0: mov eax, [edx]
  '00524AB2: mov ecx, [ebp-000001C8h]
  '00524AB8: push ecx
  '00524AB9: call [eax+34h]
  '00524ABC: fclex 
  '00524ABE: mov [ebp-000001CCh], eax
  '00524AC4: cmp [ebp-000001CCh], 00000000h
  '00524ACB: jnl 524AF0h
  '00524ACD: push 00000034h
  '00524ACF: push 0041EFA8h
  '00524AD4: mov edx, [ebp-000001C8h]
  '00524ADA: push edx
  '00524ADB: mov eax, [ebp-000001CCh]
  '00524AE1: push eax
  '00524AE2: call [004010A0h]
  '00524AE8: mov [ebp-00000298h], eax
  '00524AEE: jmp 524AFAh
  '00524AF0: mov [ebp-00000298h], 00000000h
  '00524AFA: lea ecx, [ebp-5Ch]
  '00524AFD: push ecx
  '00524AFE: lea edx, [ebp-58h]
  '00524B01: push edx
  '00524B02: push 00000002h
  '00524B04: call [00401064h]
  '00524B0A: add esp, 0000000Ch
  '00524B0D: lea eax, [ebp-00000084h]
  '00524B13: push eax
  '00524B14: lea ecx, [ebp-74h]
  '00524B17: push ecx
  '00524B18: push 00000002h
  '00524B1A: call [00401050h]
  '00524B20: add esp, 0000000Ch
  '00524B23: jmp 00525985h
  '00524B28: jmp 524B67h
  '00524B2A: mov [ebp-04h], 00000024h
  '00524B31: mov edx, [ebp+08h]
  '00524B34: mov eax, [edx+40h]
  '00524B37: push eax
  '00524B38: mov ecx, [ebp+08h]
  '00524B3B: mov edx, [ecx+3Ch]
  '00524B3E: push edx
  '00524B3F: call [0040108Ch]
  '00524B45: mov edx, eax
  '00524B47: lea ecx, [ebp-2Ch]
  '00524B4A: call [00401378h]
  '00524B50: mov edx, eax
  '00524B52: mov ecx, [ebp+08h]
  '00524B55: add ecx, 00000044h
  '00524B58: call [004012D8h]
  '00524B5E: lea ecx, [ebp-2Ch]
  '00524B61: call [004013B4h]
  '00524B67: mov [ebp-04h], 00000026h
  '00524B6E: call [00401104h]
  '00524B74: mov [ebp-04h], 00000027h
  '00524B7B: mov eax, [ebp+08h]
  '00524B7E: mov word ptr [eax+60h], FFFFh
  '00524B84: mov [ebp-04h], 00000028h
  '00524B8B: call [00401104h]
  '00524B91: mov [ebp-04h], 00000029h
  '00524B98: lea ecx, [ebp-2Ch]
  '00524B9B: push ecx
  '00524B9C: mov edx, [ebp+08h]
  '00524B9F: mov eax, [edx]
  '00524BA1: mov ecx, [ebp+08h]
  '00524BA4: push ecx
  '00524BA5: call [eax+000001C0h]
  '00524BAB: fclex 
  '00524BAD: mov [ebp-000001C8h], eax
  '00524BB3: cmp [ebp-000001C8h], 00000000h
  '00524BBA: jnl 524BDFh
  '00524BBC: push 000001C0h
  '00524BC1: push 004208E0h
  '00524BC6: mov edx, [ebp+08h]
  '00524BC9: push edx
  '00524BCA: mov eax, [ebp-000001C8h]
  '00524BD0: push eax
  '00524BD1: call [004010A0h]
  '00524BD7: mov [ebp-0000029Ch], eax
  '00524BDD: jmp 524BE9h
  '00524BDF: mov [ebp-0000029Ch], 00000000h
  '00524BE9: mov [ebp-6Ch], 80020004h
  '00524BF0: mov [ebp-74h], 0000000Ah
  '00524BF7: lea ecx, [ebp-74h]
  '00524BFA: push ecx
  '00524BFB: push 00000004h
  '00524BFD: mov edx, [ebp-2Ch]
  '00524C00: push edx
  '00524C01: call [00401148h]
  '00524C07: mov edx, eax
  '00524C09: lea ecx, [ebp-30h]
  '00524C0C: call [00401378h]
  '00524C12: push eax
  '00524C13: call [004013BCh]
  '00524C19: fstp real8 ptr [ebp-000001C4h]
  '00524C1F: cmp [00541024h], 00000000h
  '00524C26: jnz 524C44h
  '00524C28: push 00541024h
  '00524C2D: push 00413334h
  '00524C32: call [004012B8h]
  '00524C38: mov [ebp-000002A0h], 00541024h
  '00524C42: jmp 524C4Eh
  '00524C44: mov [ebp-000002A0h], 00541024h
  '00524C4E: mov eax, [ebp-000002A0h]
  '00524C54: mov ecx, [eax]
  '00524C56: mov [ebp-000001D4h], ecx
  '00524C5C: push 0041E438h
  '00524C61: push 00000000h
  '00524C63: push 0000000Dh
  '00524C65: mov edx, [ebp+08h]
  '00524C68: mov eax, [edx]
  '00524C6A: mov ecx, [ebp+08h]
  '00524C6D: push ecx
  '00524C6E: call [eax+0000030Ch]
  '00524C74: push eax
  '00524C75: lea edx, [ebp-58h]
  '00524C78: push edx
  '00524C79: call [004010E4h]
  '00524C7F: push eax
  '00524C80: lea eax, [ebp-00000084h]
  '00524C86: push eax
  '00524C87: call [004011E4h]
  '00524C8D: add esp, 00000010h
  '00524C90: push eax
  '00524C91: call [004011C8h]
  '00524C97: push eax
  '00524C98: lea ecx, [ebp-5Ch]
  '00524C9B: push ecx
  '00524C9C: call [004010E4h]
  '00524CA2: mov [ebp-000001CCh], eax
  '00524CA8: lea edx, [ebp-34h]
  '00524CAB: push edx
  '00524CAC: mov eax, [ebp-000001CCh]
  '00524CB2: mov ecx, [eax]
  '00524CB4: mov edx, [ebp-000001CCh]
  '00524CBA: push edx
  '00524CBB: call [ecx+24h]
  '00524CBE: fclex 
  '00524CC0: mov [ebp-000001D0h], eax
  '00524CC6: cmp [ebp-000001D0h], 00000000h
  '00524CCD: jnl 524CF2h
  '00524CCF: push 00000024h
  '00524CD1: push 0041E438h
  '00524CD6: mov eax, [ebp-000001CCh]
  '00524CDC: push eax
  '00524CDD: mov ecx, [ebp-000001D0h]
  '00524CE3: push ecx
  '00524CE4: call [004010A0h]
  '00524CEA: mov [ebp-000002A4h], eax
  '00524CF0: jmp 524CFCh
  '00524CF2: mov [ebp-000002A4h], 00000000h
  '00524CFC: push 0042B294h
  '00524D01: mov edx, [ebp-34h]
  '00524D04: push edx
  '00524D05: call [0040108Ch]
  '00524D0B: mov edx, eax
  '00524D0D: lea ecx, [ebp-38h]
  '00524D10: call [00401378h]
  '00524D16: fld real8 ptr [ebp-000001C4h]
  '00524D1C: call [00401348h]
  '00524D22: mov [ebp-000001A8h], ax
  '00524D29: lea eax, [ebp-38h]
  '00524D2C: push eax
  '00524D2D: lea ecx, [ebp-000001A8h]
  '00524D33: push ecx
  '00524D34: mov edx, [ebp-000001D4h]
  '00524D3A: mov eax, [edx]
  '00524D3C: mov ecx, [ebp-000001D4h]
  '00524D42: push ecx
  '00524D43: call [eax+00000714h]
  '00524D49: fclex 
  '00524D4B: mov [ebp-000001D8h], eax
  '00524D51: cmp [ebp-000001D8h], 00000000h
  '00524D58: jnl 524D80h
  '00524D5A: push 00000714h
  '00524D5F: push 0041C118h
  '00524D64: mov edx, [ebp-000001D4h]
  '00524D6A: push edx
  '00524D6B: mov eax, [ebp-000001D8h]
  '00524D71: push eax
  '00524D72: call [004010A0h]
  '00524D78: mov [ebp-000002A8h], eax
  '00524D7E: jmp 524D8Ah
  '00524D80: mov [ebp-000002A8h], 00000000h
  '00524D8A: lea ecx, [ebp-38h]
  '00524D8D: push ecx
  '00524D8E: lea edx, [ebp-34h]
  '00524D91: push edx
  '00524D92: lea eax, [ebp-30h]
  '00524D95: push eax
  '00524D96: lea ecx, [ebp-2Ch]
  '00524D99: push ecx
  '00524D9A: push 00000004h
  '00524D9C: call [004012E8h]
  '00524DA2: add esp, 00000014h
  '00524DA5: lea edx, [ebp-5Ch]
  '00524DA8: push edx
  '00524DA9: lea eax, [ebp-58h]
  '00524DAC: push eax
  '00524DAD: push 00000002h
  '00524DAF: call [00401064h]
  '00524DB5: add esp, 0000000Ch
  '00524DB8: lea ecx, [ebp-00000084h]
  '00524DBE: push ecx
  '00524DBF: lea edx, [ebp-74h]
  '00524DC2: push edx
  '00524DC3: push 00000002h
  '00524DC5: call [00401050h]
  '00524DCB: add esp, 0000000Ch
  '00524DCE: jmp 005256F0h
  '00524DD3: mov [ebp-04h], 0000002Ah
  '00524DDA: push 0041E438h
  '00524DDF: push 00000000h
  '00524DE1: push 0000000Dh
  '00524DE3: mov eax, [ebp+08h]
  '00524DE6: mov ecx, [eax]
  '00524DE8: mov edx, [ebp+08h]
  '00524DEB: push edx
  '00524DEC: call [ecx+0000030Ch]
  '00524DF2: push eax
  '00524DF3: lea eax, [ebp-58h]
  '00524DF6: push eax
  '00524DF7: call [004010E4h]
  '00524DFD: push eax
  '00524DFE: lea ecx, [ebp-74h]
  '00524E01: push ecx
  '00524E02: call [004011E4h]
  '00524E08: add esp, 00000010h
  '00524E0B: push eax
  '00524E0C: call [004011C8h]
  '00524E12: push eax
  '00524E13: lea edx, [ebp-5Ch]
  '00524E16: push edx
  '00524E17: call [004010E4h]
  '00524E1D: mov [ebp-000001C8h], eax
  '00524E23: lea eax, [ebp-00000084h]
  '00524E29: push eax
  '00524E2A: mov ecx, [ebp-000001C8h]
  '00524E30: mov edx, [ecx]
  '00524E32: mov eax, [ebp-000001C8h]
  '00524E38: push eax
  '00524E39: call [edx+6Ch]
  '00524E3C: fclex 
  '00524E3E: mov [ebp-000001CCh], eax
  '00524E44: cmp [ebp-000001CCh], 00000000h
  '00524E4B: jnl 524E70h
  '00524E4D: push 0000006Ch
  '00524E4F: push 0041E438h
  '00524E54: mov ecx, [ebp-000001C8h]
  '00524E5A: push ecx
  '00524E5B: mov edx, [ebp-000001CCh]
  '00524E61: push edx
  '00524E62: call [004010A0h]
  '00524E68: mov [ebp-000002ACh], eax
  '00524E6E: jmp 524E7Ah
  '00524E70: mov [ebp-000002ACh], 00000000h
  '00524E7A: mov [ebp-0000013Ch], 00000001h
  '00524E84: mov [ebp-00000144h], 00008002h
  '00524E8E: lea eax, [ebp-00000084h]
  '00524E94: push eax
  '00524E95: lea ecx, [ebp-00000144h]
  '00524E9B: push ecx
  '00524E9C: call [00401198h]
  '00524EA2: mov [ebp-000001D0h], ax
  '00524EA9: lea edx, [ebp-5Ch]
  '00524EAC: push edx
  '00524EAD: lea eax, [ebp-58h]
  '00524EB0: push eax
  '00524EB1: push 00000002h
  '00524EB3: call [00401064h]
  '00524EB9: add esp, 0000000Ch
  '00524EBC: lea ecx, [ebp-00000084h]
  '00524EC2: push ecx
  '00524EC3: lea edx, [ebp-74h]
  '00524EC6: push edx
  '00524EC7: push 00000002h
  '00524EC9: call [00401050h]
  '00524ECF: add esp, 0000000Ch
  '00524ED2: movsx eax, word ptr [ebp-000001D0h]
  '00524ED9: test eax, eax
  '00524EDB: jz 005256F0h
  '00524EE1: mov [ebp-04h], 0000002Bh
  '00524EE8: lea ecx, [ebp-2Ch]
  '00524EEB: push ecx
  '00524EEC: mov edx, [ebp+08h]
  '00524EEF: mov eax, [edx]
  '00524EF1: mov ecx, [ebp+08h]
  '00524EF4: push ecx
  '00524EF5: call [eax+000001C0h]
  '00524EFB: fclex 
  '00524EFD: mov [ebp-000001C8h], eax
  '00524F03: cmp [ebp-000001C8h], 00000000h
  '00524F0A: jnl 524F2Fh
  '00524F0C: push 000001C0h
  '00524F11: push 004208E0h
  '00524F16: mov edx, [ebp+08h]
  '00524F19: push edx
  '00524F1A: mov eax, [ebp-000001C8h]
  '00524F20: push eax
  '00524F21: call [004010A0h]
  '00524F27: mov [ebp-000002B0h], eax
  '00524F2D: jmp 524F39h
  '00524F2F: mov [ebp-000002B0h], 00000000h
  '00524F39: mov [ebp-6Ch], 80020004h
  '00524F40: mov [ebp-74h], 0000000Ah
  '00524F47: lea ecx, [ebp-74h]
  '00524F4A: push ecx
  '00524F4B: push 00000004h
  '00524F4D: mov edx, [ebp-2Ch]
  '00524F50: push edx
  '00524F51: call [00401148h]
  '00524F57: mov edx, eax
  '00524F59: lea ecx, [ebp-30h]
  '00524F5C: call [00401378h]
  '00524F62: push eax
  '00524F63: call [004013BCh]
  '00524F69: fstp real8 ptr [ebp-000001C4h]
  '00524F6F: push 0041E438h
  '00524F74: push 00000000h
  '00524F76: push 0000000Dh
  '00524F78: mov eax, [ebp+08h]
  '00524F7B: mov ecx, [eax]
  '00524F7D: mov edx, [ebp+08h]
  '00524F80: push edx
  '00524F81: call [ecx+0000030Ch]
  '00524F87: push eax
  '00524F88: lea eax, [ebp-58h]
  '00524F8B: push eax
  '00524F8C: call [004010E4h]
  '00524F92: push eax
  '00524F93: lea ecx, [ebp-00000084h]
  '00524F99: push ecx
  '00524F9A: call [004011E4h]
  '00524FA0: add esp, 00000010h
  '00524FA3: push eax
  '00524FA4: call [004011C8h]
  '00524FAA: push eax
  '00524FAB: lea edx, [ebp-5Ch]
  '00524FAE: push edx
  '00524FAF: call [004010E4h]
  '00524FB5: mov [ebp-000001CCh], eax
  '00524FBB: lea eax, [ebp-34h]
  '00524FBE: push eax
  '00524FBF: mov ecx, [ebp-000001CCh]
  '00524FC5: mov edx, [ecx]
  '00524FC7: mov eax, [ebp-000001CCh]
  '00524FCD: push eax
  '00524FCE: call [edx+24h]
  '00524FD1: fclex 
  '00524FD3: mov [ebp-000001D0h], eax
  '00524FD9: cmp [ebp-000001D0h], 00000000h
  '00524FE0: jnl 525005h
  '00524FE2: push 00000024h
  '00524FE4: push 0041E438h
  '00524FE9: mov ecx, [ebp-000001CCh]
  '00524FEF: push ecx
  '00524FF0: mov edx, [ebp-000001D0h]
  '00524FF6: push edx
  '00524FF7: call [004010A0h]
  '00524FFD: mov [ebp-000002B4h], eax
  '00525003: jmp 52500Fh
  '00525005: mov [ebp-000002B4h], 00000000h
  '0052500F: mov eax, [ebp-34h]
  '00525012: mov [ebp-0000022Ch], eax
  '00525018: mov [ebp-34h], 00000000h
  '0052501F: mov ecx, [ebp-0000022Ch]
  '00525025: mov [ebp-0000008Ch], ecx
  '0052502B: mov [ebp-00000094h], 00000008h
  '00525035: lea edx, [ebp-00000094h]
  '0052503B: push edx
  '0052503C: lea eax, [ebp-000000A4h]
  '00525042: push eax
  '00525043: call [00401118h]
  '00525049: push 0041E438h
  '0052504E: push 00000000h
  '00525050: push 0000000Dh
  '00525052: mov ecx, [ebp+08h]
  '00525055: mov edx, [ecx]
  '00525057: mov eax, [ebp+08h]
  '0052505A: push eax
  '0052505B: call [edx+0000030Ch]
  '00525061: push eax
  '00525062: lea ecx, [ebp-60h]
  '00525065: push ecx
  '00525066: call [004010E4h]
  '0052506C: push eax
  '0052506D: lea edx, [ebp-000000B4h]
  '00525073: push edx
  '00525074: call [004011E4h]
  '0052507A: add esp, 00000010h
  '0052507D: push eax
  '0052507E: call [004011C8h]
  '00525084: push eax
  '00525085: lea eax, [ebp-64h]
  '00525088: push eax
  '00525089: call [004010E4h]
  '0052508F: mov [ebp-000001D4h], eax
  '00525095: lea ecx, [ebp-38h]
  '00525098: push ecx
  '00525099: mov edx, [ebp-000001D4h]
  '0052509F: mov eax, [edx]
  '005250A1: mov ecx, [ebp-000001D4h]
  '005250A7: push ecx
  '005250A8: call [eax+24h]
  '005250AB: fclex 
  '005250AD: mov [ebp-000001D8h], eax
  '005250B3: cmp [ebp-000001D8h], 00000000h
  '005250BA: jnl 5250DFh
  '005250BC: push 00000024h
  '005250BE: push 0041E438h
  '005250C3: mov edx, [ebp-000001D4h]
  '005250C9: push edx
  '005250CA: mov eax, [ebp-000001D8h]
  '005250D0: push eax
  '005250D1: call [004010A0h]
  '005250D7: mov [ebp-000002B8h], eax
  '005250DD: jmp 5250E9h
  '005250DF: mov [ebp-000002B8h], 00000000h
  '005250E9: cmp [00541024h], 00000000h
  '005250F0: jnz 52510Eh
  '005250F2: push 00541024h
  '005250F7: push 00413334h
  '005250FC: call [004012B8h]
  '00525102: mov [ebp-000002BCh], 00541024h
  '0052510C: jmp 525118h
  '0052510E: mov [ebp-000002BCh], 00541024h
  '00525118: mov ecx, [ebp-000002BCh]
  '0052511E: mov edx, [ecx]
  '00525120: mov [ebp-000001DCh], edx
  '00525126: mov [ebp-000000BCh], 80020004h
  '00525130: mov [ebp-000000C4h], 0000000Ah
  '0052513A: push 0042B2ACh
  '0052513F: lea eax, [ebp-000000C4h]
  '00525145: push eax
  '00525146: push 00000001h
  '00525148: mov ecx, [ebp-38h]
  '0052514B: push ecx
  '0052514C: push 004207C4h
  '00525151: push 00000000h
  '00525153: call [004012ACh]
  '00525159: add eax, 00000004h
  '0052515C: jo 00525A82h
  '00525162: push eax
  '00525163: lea edx, [ebp-000000A4h]
  '00525169: push edx
  '0052516A: lea eax, [ebp-3Ch]
  '0052516D: push eax
  '0052516E: call [0040126Ch]
  '00525174: push eax
  '00525175: call [00401148h]
  '0052517B: mov edx, eax
  '0052517D: lea ecx, [ebp-40h]
  '00525180: call [00401378h]
  '00525186: push eax
  '00525187: call [0040108Ch]
  '0052518D: mov edx, eax
  '0052518F: lea ecx, [ebp-44h]
  '00525192: call [00401378h]
  '00525198: fld real8 ptr [ebp-000001C4h]
  '0052519E: call [00401348h]
  '005251A4: mov [ebp-000001A8h], ax
  '005251AB: lea ecx, [ebp-44h]
  '005251AE: push ecx
  '005251AF: lea edx, [ebp-000001A8h]
  '005251B5: push edx
  '005251B6: mov eax, [ebp-000001DCh]
  '005251BC: mov ecx, [eax]
  '005251BE: mov edx, [ebp-000001DCh]
  '005251C4: push edx
  '005251C5: call [ecx+00000714h]
  '005251CB: fclex 
  '005251CD: mov [ebp-000001E0h], eax
  '005251D3: cmp [ebp-000001E0h], 00000000h
  '005251DA: jnl 525202h
  '005251DC: push 00000714h
  '005251E1: push 0041C118h
  '005251E6: mov eax, [ebp-000001DCh]
  '005251EC: push eax
  '005251ED: mov ecx, [ebp-000001E0h]
  '005251F3: push ecx
  '005251F4: call [004010A0h]
  '005251FA: mov [ebp-000002C0h], eax
  '00525200: jmp 52520Ch
  '00525202: mov [ebp-000002C0h], 00000000h
  '0052520C: lea edx, [ebp-44h]
  '0052520F: push edx
  '00525210: lea eax, [ebp-40h]
  '00525213: push eax
  '00525214: lea ecx, [ebp-3Ch]
  '00525217: push ecx
  '00525218: lea edx, [ebp-38h]
  '0052521B: push edx
  '0052521C: lea eax, [ebp-30h]
  '0052521F: push eax
  '00525220: lea ecx, [ebp-2Ch]
  '00525223: push ecx
  '00525224: push 00000006h
  '00525226: call [004012E8h]
  '0052522C: add esp, 0000001Ch
  '0052522F: lea edx, [ebp-64h]
  '00525232: push edx
  '00525233: lea eax, [ebp-60h]
  '00525236: push eax
  '00525237: lea ecx, [ebp-5Ch]
  '0052523A: push ecx
  '0052523B: lea edx, [ebp-58h]
  '0052523E: push edx
  '0052523F: push 00000004h
  '00525241: call [00401064h]
  '00525247: add esp, 00000014h
  '0052524A: lea eax, [ebp-000000C4h]
  '00525250: push eax
  '00525251: lea ecx, [ebp-000000A4h]
  '00525257: push ecx
  '00525258: lea edx, [ebp-000000B4h]
  '0052525E: push edx
  '0052525F: lea eax, [ebp-00000094h]
  '00525265: push eax
  '00525266: lea ecx, [ebp-00000084h]
  '0052526C: push ecx
  '0052526D: lea edx, [ebp-74h]
  '00525270: push edx
  '00525271: push 00000006h
  '00525273: call [00401050h]
  '00525279: add esp, 0000001Ch
  '0052527C: mov [ebp-04h], 0000002Ch
  '00525283: mov eax, [ebp+08h]
  '00525286: mov word ptr [eax+60h], FFFFh
  '0052528C: mov [ebp-04h], 0000002Dh
  '00525293: call [00401104h]
  '00525299: mov [ebp-04h], 0000002Eh
  '005252A0: push 0041E438h
  '005252A5: push 00000000h
  '005252A7: push 0000000Dh
  '005252A9: mov ecx, [ebp+08h]
  '005252AC: mov edx, [ecx]
  '005252AE: mov eax, [ebp+08h]
  '005252B1: push eax
  '005252B2: call [edx+0000030Ch]
  '005252B8: push eax
  '005252B9: lea ecx, [ebp-58h]
  '005252BC: push ecx
  '005252BD: call [004010E4h]
  '005252C3: push eax
  '005252C4: lea edx, [ebp-74h]
  '005252C7: push edx
  '005252C8: call [004011E4h]
  '005252CE: add esp, 00000010h
  '005252D1: push eax
  '005252D2: call [004011C8h]
  '005252D8: push eax
  '005252D9: lea eax, [ebp-5Ch]
  '005252DC: push eax
  '005252DD: call [004010E4h]
  '005252E3: mov [ebp-000001C8h], eax
  '005252E9: lea ecx, [ebp-2Ch]
  '005252EC: push ecx
  '005252ED: mov edx, [ebp-000001C8h]
  '005252F3: mov eax, [edx]
  '005252F5: mov ecx, [ebp-000001C8h]
  '005252FB: push ecx
  '005252FC: call [eax+24h]
  '005252FF: fclex 
  '00525301: mov [ebp-000001CCh], eax
  '00525307: cmp [ebp-000001CCh], 00000000h
  '0052530E: jnl 525333h
  '00525310: push 00000024h
  '00525312: push 0041E438h
  '00525317: mov edx, [ebp-000001C8h]
  '0052531D: push edx
  '0052531E: mov eax, [ebp-000001CCh]
  '00525324: push eax
  '00525325: call [004010A0h]
  '0052532B: mov [ebp-000002C4h], eax
  '00525331: jmp 52533Dh
  '00525333: mov [ebp-000002C4h], 00000000h
  '0052533D: mov ecx, [ebp-2Ch]
  '00525340: mov [ebp-00000230h], ecx
  '00525346: mov [ebp-2Ch], 00000000h
  '0052534D: mov edx, [ebp-00000230h]
  '00525353: mov [ebp-7Ch], edx
  '00525356: mov [ebp-00000084h], 00000008h
  '00525360: lea eax, [ebp-00000084h]
  '00525366: push eax
  '00525367: lea ecx, [ebp-00000094h]
  '0052536D: push ecx
  '0052536E: call [00401118h]
  '00525374: mov [ebp-0000014Ch], 00000000h
  '0052537E: mov [ebp-00000154h], 00000002h
  '00525388: mov [ebp-0000013Ch], 004207C4h
  '00525392: mov [ebp-00000144h], 00000008h
  '0052539C: lea edx, [ebp-00000144h]
  '005253A2: lea ecx, [ebp-000000A4h]
  '005253A8: call [00401338h]
  '005253AE: push 00000000h
  '005253B0: push FFFFFFFFh
  '005253B2: lea edx, [ebp-000000A4h]
  '005253B8: push edx
  '005253B9: lea eax, [ebp-00000094h]
  '005253BF: push eax
  '005253C0: lea ecx, [ebp-30h]
  '005253C3: push ecx
  '005253C4: call [0040126Ch]
  '005253CA: push eax
  '005253CB: lea edx, [ebp-000000B4h]
  '005253D1: push edx
  '005253D2: call [0040122Ch]
  '005253D8: mov eax, 00000010h
  '005253DD: call 004081B0h
  '005253E2: mov eax, esp
  '005253E4: mov ecx, [ebp-00000154h]
  '005253EA: mov [eax], ecx
  '005253EC: mov edx, [ebp-00000150h]
  '005253F2: mov [eax+04h], edx
  '005253F5: mov ecx, [ebp-0000014Ch]
  '005253FB: mov [eax+08h], ecx
  '005253FE: mov edx, [ebp-00000148h]
  '00525404: mov [eax+0Ch], edx
  '00525407: push 00000001h
  '00525409: lea eax, [ebp-000000B4h]
  '0052540F: push eax
  '00525410: lea ecx, [ebp-000000C4h]
  '00525416: push ecx
  '00525417: call [00401100h]
  '0052541D: add esp, 0000001Ch
  '00525420: push eax
  '00525421: call [0040103Ch]
  '00525427: mov edx, eax
  '00525429: lea ecx, [ebp-34h]
  '0052542C: call [00401378h]
  '00525432: mov edx, eax
  '00525434: mov ecx, [ebp+08h]
  '00525437: add ecx, 0000004Ch
  '0052543A: call [004012D8h]
  '00525440: lea edx, [ebp-34h]
  '00525443: push edx
  '00525444: lea eax, [ebp-30h]
  '00525447: push eax
  '00525448: push 00000002h
  '0052544A: call [004012E8h]
  '00525450: add esp, 0000000Ch
  '00525453: lea ecx, [ebp-5Ch]
  '00525456: push ecx
  '00525457: lea edx, [ebp-58h]
  '0052545A: push edx
  '0052545B: push 00000002h
  '0052545D: call [00401064h]
  '00525463: add esp, 0000000Ch
  '00525466: lea eax, [ebp-000000C4h]
  '0052546C: push eax
  '0052546D: lea ecx, [ebp-000000B4h]
  '00525473: push ecx
  '00525474: lea edx, [ebp-000000A4h]
  '0052547A: push edx
  '0052547B: lea eax, [ebp-00000094h]
  '00525481: push eax
  '00525482: lea ecx, [ebp-00000084h]
  '00525488: push ecx
  '00525489: lea edx, [ebp-74h]
  '0052548C: push edx
  '0052548D: push 00000006h
  '0052548F: call [00401050h]
  '00525495: add esp, 0000001Ch
  '00525498: mov [ebp-04h], 0000002Fh
  '0052549F: mov eax, [ebp+08h]
  '005254A2: mov ecx, [eax+4Ch]
  '005254A5: push ecx
  '005254A6: push 00425EE4h
  '005254AB: call [00401184h]
  '005254B1: test eax, eax
  '005254B3: jnz 00525591h
  '005254B9: mov [ebp-04h], 00000030h
  '005254C0: mov word ptr [ebp-000001A8h], FFFFh
  '005254C9: lea edx, [ebp-000001A8h]
  '005254CF: push edx
  '005254D0: call 0051FFB0h
  '005254D5: mov edx, eax
  '005254D7: lea ecx, [ebp-34h]
  '005254DA: call [00401378h]
  '005254E0: mov word ptr [ebp-000001ACh], FFFFh
  '005254E9: mov eax, [ebp-34h]
  '005254EC: mov [ebp-00000234h], eax
  '005254F2: mov [ebp-34h], 00000000h
  '005254F9: mov edx, [ebp-00000234h]
  '005254FF: lea ecx, [ebp-2Ch]
  '00525502: call [00401378h]
  '00525508: push eax
  '00525509: push 00425EC0h
  '0052550E: call [0040108Ch]
  '00525514: mov edx, eax
  '00525516: lea ecx, [ebp-30h]
  '00525519: call [00401378h]
  '0052551F: lea ecx, [ebp-000001ACh]
  '00525525: push ecx
  '00525526: lea edx, [ebp-30h]
  '00525529: push edx
  '0052552A: mov eax, [ebp+08h]
  '0052552D: mov ecx, [eax]
  '0052552F: mov edx, [ebp+08h]
  '00525532: push edx
  '00525533: call [ecx+000006F8h]
  '00525539: mov [ebp-000001C8h], eax
  '0052553F: cmp [ebp-000001C8h], 00000000h
  '00525546: jnl 52556Bh
  '00525548: push 000006F8h
  '0052554D: push 00420910h
  '00525552: mov eax, [ebp+08h]
  '00525555: push eax
  '00525556: mov ecx, [ebp-000001C8h]
  '0052555C: push ecx
  '0052555D: call [004010A0h]
  '00525563: mov [ebp-000002C8h], eax
  '00525569: jmp 525575h
  '0052556B: mov [ebp-000002C8h], 00000000h
  '00525575: lea edx, [ebp-34h]
  '00525578: push edx
  '00525579: lea eax, [ebp-30h]
  '0052557C: push eax
  '0052557D: lea ecx, [ebp-2Ch]
  '00525580: push ecx
  '00525581: push 00000003h
  '00525583: call [004012E8h]
  '00525589: add esp, 00000010h
  '0052558C: jmp 005256F0h
  '00525591: mov [ebp-04h], 00000031h
  '00525598: mov edx, [ebp+08h]
  '0052559B: mov eax, [edx+4Ch]
  '0052559E: push eax
  '0052559F: push 00425DD8h
  '005255A4: call [00401184h]
  '005255AA: test eax, eax
  '005255AC: jnz 00525687h
  '005255B2: mov [ebp-04h], 00000032h
  '005255B9: mov word ptr [ebp-000001A8h], FFFFh
  '005255C2: lea ecx, [ebp-000001A8h]
  '005255C8: push ecx
  '005255C9: call 0051FFB0h
  '005255CE: mov edx, eax
  '005255D0: lea ecx, [ebp-34h]
  '005255D3: call [00401378h]
  '005255D9: mov word ptr [ebp-000001ACh], FFFFh
  '005255E2: mov edx, [ebp-34h]
  '005255E5: mov [ebp-00000238h], edx
  '005255EB: mov [ebp-34h], 00000000h
  '005255F2: mov edx, [ebp-00000238h]
  '005255F8: lea ecx, [ebp-2Ch]
  '005255FB: call [00401378h]
  '00525601: push eax
  '00525602: push 00425D84h
  '00525607: call [0040108Ch]
  '0052560D: mov edx, eax
  '0052560F: lea ecx, [ebp-30h]
  '00525612: call [00401378h]
  '00525618: lea eax, [ebp-000001ACh]
  '0052561E: push eax
  '0052561F: lea ecx, [ebp-30h]
  '00525622: push ecx
  '00525623: mov edx, [ebp+08h]
  '00525626: mov eax, [edx]
  '00525628: mov ecx, [ebp+08h]
  '0052562B: push ecx
  '0052562C: call [eax+000006F8h]
  '00525632: mov [ebp-000001C8h], eax
  '00525638: cmp [ebp-000001C8h], 00000000h
  '0052563F: jnl 525664h
  '00525641: push 000006F8h
  '00525646: push 00420910h
  '0052564B: mov edx, [ebp+08h]
  '0052564E: push edx
  '0052564F: mov eax, [ebp-000001C8h]
  '00525655: push eax
  '00525656: call [004010A0h]
  '0052565C: mov [ebp-000002CCh], eax
  '00525662: jmp 52566Eh
  '00525664: mov [ebp-000002CCh], 00000000h
  '0052566E: lea ecx, [ebp-34h]
  '00525671: push ecx
  '00525672: lea edx, [ebp-30h]
  '00525675: push edx
  '00525676: lea eax, [ebp-2Ch]
  '00525679: push eax
  '0052567A: push 00000003h
  '0052567C: call [004012E8h]
  '00525682: add esp, 00000010h
  '00525685: jmp 5256F0h
  '00525687: mov [ebp-04h], 00000034h
  '0052568E: mov word ptr [ebp-000001A8h], 0000h
  '00525697: lea ecx, [ebp-000001A8h]
  '0052569D: push ecx
  '0052569E: mov edx, [ebp+08h]
  '005256A1: add edx, 0000004Ch
  '005256A4: push edx
  '005256A5: mov eax, [ebp+08h]
  '005256A8: mov ecx, [eax]
  '005256AA: mov edx, [ebp+08h]
  '005256AD: push edx
  '005256AE: call [ecx+000006F8h]
  '005256B4: mov [ebp-000001C8h], eax
  '005256BA: cmp [ebp-000001C8h], 00000000h
  '005256C1: jnl 5256E6h
  '005256C3: push 000006F8h
  '005256C8: push 00420910h
  '005256CD: mov eax, [ebp+08h]
  '005256D0: push eax
  '005256D1: mov ecx, [ebp-000001C8h]
  '005256D7: push ecx
  '005256D8: call [004010A0h]
  '005256DE: mov [ebp-000002D0h], eax
  '005256E4: jmp 5256F0h
  '005256E6: mov [ebp-000002D0h], 00000000h
  '005256F0: jmp 00525985h
  '005256F5: mov [ebp-04h], 00000037h
  '005256FC: push 0041EFA8h
  '00525701: push 00000000h
  '00525703: push 00000007h
  '00525705: mov edx, [ebp+08h]
  '00525708: mov eax, [edx]
  '0052570A: mov ecx, [ebp+08h]
  '0052570D: push ecx
  '0052570E: call [eax+0000030Ch]
  '00525714: push eax
  '00525715: lea edx, [ebp-58h]
  '00525718: push edx
  '00525719: call [004010E4h]
  '0052571F: push eax
  '00525720: lea eax, [ebp-74h]
  '00525723: push eax
  '00525724: call [004011E4h]
  '0052572A: add esp, 00000010h
  '0052572D: push eax
  '0052572E: call [004011C8h]
  '00525734: push eax
  '00525735: lea ecx, [ebp-5Ch]
  '00525738: push ecx
  '00525739: call [004010E4h]
  '0052573F: mov [ebp-000001C8h], eax
  '00525745: lea edx, [ebp-000001B0h]
  '0052574B: push edx
  '0052574C: mov eax, [ebp-000001C8h]
  '00525752: mov ecx, [eax]
  '00525754: mov edx, [ebp-000001C8h]
  '0052575A: push edx
  '0052575B: call [ecx+1Ch]
  '0052575E: fclex 
  '00525760: mov [ebp-000001CCh], eax
  '00525766: cmp [ebp-000001CCh], 00000000h
  '0052576D: jnl 525792h
  '0052576F: push 0000001Ch
  '00525771: push 0041EFA8h
  '00525776: mov eax, [ebp-000001C8h]
  '0052577C: push eax
  '0052577D: mov ecx, [ebp-000001CCh]
  '00525783: push ecx
  '00525784: call [004010A0h]
  '0052578A: mov [ebp-000002D4h], eax
  '00525790: jmp 52579Ch
  '00525792: mov [ebp-000002D4h], 00000000h
  '0052579C: xor edx, edx
  '0052579E: cmp [ebp-000001B0h], 00000000h
  '005257A5: setz dl
  '005257A8: neg edx
  '005257AA: mov eax, [ebp+08h]
  '005257AD: xor ecx, ecx
  '005257AF: cmp word ptr [eax+60h], 0000h
  '005257B4: setz cl
  '005257B7: neg ecx
  '005257B9: and dx, cx
  '005257BC: mov [ebp-000001D0h], dx
  '005257C3: lea edx, [ebp-5Ch]
  '005257C6: push edx
  '005257C7: lea eax, [ebp-58h]
  '005257CA: push eax
  '005257CB: push 00000002h
  '005257CD: call [00401064h]
  '005257D3: add esp, 0000000Ch
  '005257D6: lea ecx, [ebp-74h]
  '005257D9: call [00401030h]
  '005257DF: movsx ecx, word ptr [ebp-000001D0h]
  '005257E6: test ecx, ecx
  '005257E8: jz 00525985h
  '005257EE: mov [ebp-04h], 00000038h
  '005257F5: cmp [0054106Ch], 00000000h
  '005257FC: jnz 52581Ah
  '005257FE: push 0054106Ch
  '00525803: push 00411238h
  '00525808: call [004012B8h]
  '0052580E: mov [ebp-000002D8h], 0054106Ch
  '00525818: jmp 525824h
  '0052581A: mov [ebp-000002D8h], 0054106Ch
  '00525824: mov edx, [ebp-000002D8h]
  '0052582A: mov eax, [edx]
  '0052582C: mov ecx, [ebp-000002D8h]
  '00525832: mov edx, [ecx]
  '00525834: mov ecx, [edx]
  '00525836: push eax
  '00525837: call [ecx+0000034Ch]
  '0052583D: push eax
  '0052583E: lea edx, [ebp-58h]
  '00525841: push edx
  '00525842: call [004010E4h]
  '00525848: mov [ebp-000001C8h], eax
  '0052584E: lea eax, [ebp-000001A8h]
  '00525854: push eax
  '00525855: mov ecx, [ebp-000001C8h]
  '0052585B: mov edx, [ecx]
  '0052585D: mov eax, [ebp-000001C8h]
  '00525863: push eax
  '00525864: call [edx+000000E0h]
  '0052586A: fclex 
  '0052586C: mov [ebp-000001CCh], eax
  '00525872: cmp [ebp-000001CCh], 00000000h
  '00525879: jnl 5258A1h
  '0052587B: push 000000E0h
  '00525880: push 0041E108h
  '00525885: mov ecx, [ebp-000001C8h]
  '0052588B: push ecx
  '0052588C: mov edx, [ebp-000001CCh]
  '00525892: push edx
  '00525893: call [004010A0h]
  '00525899: mov [ebp-000002DCh], eax
  '0052589F: jmp 5258ABh
  '005258A1: mov [ebp-000002DCh], 00000000h
  '005258AB: xor eax, eax
  '005258AD: cmp word ptr [ebp-000001A8h], 0001h
  '005258B5: setz al
  '005258B8: neg eax
  '005258BA: mov [ebp-000001D0h], ax
  '005258C1: lea ecx, [ebp-58h]
  '005258C4: call [004013B8h]
  '005258CA: movsx ecx, word ptr [ebp-000001D0h]
  '005258D1: test ecx, ecx
  '005258D3: jz 00525985h
  '005258D9: mov [ebp-04h], 00000039h
  '005258E0: cmp [0054238Ch], 00000000h
  '005258E7: jnz 525905h
  '005258E9: push 0054238Ch
  '005258EE: push 0041D9E0h
  '005258F3: call [004012B8h]
  '005258F9: mov [ebp-000002E0h], 0054238Ch
  '00525903: jmp 52590Fh
  '00525905: mov [ebp-000002E0h], 0054238Ch
  '0052590F: mov edx, [ebp-000002E0h]
  '00525915: mov eax, [edx]
  '00525917: mov [ebp-000001C8h], eax
  '0052591D: mov ecx, [ebp+08h]
  '00525920: push ecx
  '00525921: lea edx, [ebp-58h]
  '00525924: push edx
  '00525925: call [004010F8h]
  '0052592B: push eax
  '0052592C: mov eax, [ebp-000001C8h]
  '00525932: mov ecx, [eax]
  '00525934: mov edx, [ebp-000001C8h]
  '0052593A: push edx
  '0052593B: call [ecx+10h]
  '0052593E: fclex 
  '00525940: mov [ebp-000001CCh], eax
  '00525946: cmp [ebp-000001CCh], 00000000h
  '0052594D: jnl 525972h
  '0052594F: push 00000010h
  '00525951: push 0041D9D0h
  '00525956: mov eax, [ebp-000001C8h]
  '0052595C: push eax
  '0052595D: mov ecx, [ebp-000001CCh]
  '00525963: push ecx
  '00525964: call [004010A0h]
  '0052596A: mov [ebp-000002E4h], eax
  '00525970: jmp 52597Ch
  '00525972: mov [ebp-000002E4h], 00000000h
  '0052597C: lea ecx, [ebp-58h]
  '0052597F: call [004013B8h]
  '00525985: mov [ebp-10h], 00000000h
  '0052598C: wait 
  '0052598D: push 00525A60h
  '00525992: jmp 00525A4Dh
  '00525997: lea edx, [ebp-54h]
  '0052599A: push edx
  '0052599B: lea eax, [ebp-50h]
  '0052599E: push eax
  '0052599F: lea ecx, [ebp-4Ch]
  '005259A2: push ecx
  '005259A3: lea edx, [ebp-48h]
  '005259A6: push edx
  '005259A7: lea eax, [ebp-44h]
  '005259AA: push eax
  '005259AB: lea ecx, [ebp-40h]
  '005259AE: push ecx
  '005259AF: lea edx, [ebp-3Ch]
  '005259B2: push edx
  '005259B3: lea eax, [ebp-38h]
  '005259B6: push eax
  '005259B7: lea ecx, [ebp-34h]
  '005259BA: push ecx
  '005259BB: lea edx, [ebp-30h]
  '005259BE: push edx
  '005259BF: lea eax, [ebp-2Ch]
  '005259C2: push eax
  '005259C3: push 0000000Bh
  '005259C5: call [004012E8h]
  '005259CB: add esp, 00000030h
  '005259CE: lea ecx, [ebp-64h]
  '005259D1: push ecx
  '005259D2: lea edx, [ebp-60h]
  '005259D5: push edx
  '005259D6: lea eax, [ebp-5Ch]
  '005259D9: push eax
  '005259DA: lea ecx, [ebp-58h]
  '005259DD: push ecx
  '005259DE: push 00000004h
  '005259E0: call [00401064h]
  '005259E6: add esp, 00000014h
  '005259E9: lea edx, [ebp-00000134h]
  '005259EF: push edx
  '005259F0: lea eax, [ebp-00000124h]
  '005259F6: push eax
  '005259F7: lea ecx, [ebp-00000114h]
  '005259FD: push ecx
  '005259FE: lea edx, [ebp-00000104h]
  '00525A04: push edx
  '00525A05: lea eax, [ebp-000000F4h]
  '00525A0B: push eax
  '00525A0C: lea ecx, [ebp-000000E4h]
  '00525A12: push ecx
  '00525A13: lea edx, [ebp-000000D4h]
  '00525A19: push edx
  '00525A1A: lea eax, [ebp-000000C4h]
  '00525A20: push eax
  '00525A21: lea ecx, [ebp-000000B4h]
  '00525A27: push ecx
  '00525A28: lea edx, [ebp-000000A4h]
  '00525A2E: push edx
  '00525A2F: lea eax, [ebp-00000094h]
  '00525A35: push eax
  '00525A36: lea ecx, [ebp-00000084h]
  '00525A3C: push ecx
  '00525A3D: lea edx, [ebp-74h]
  '00525A40: push edx
  '00525A41: push 0000000Dh
  '00525A43: call [00401050h]
  '00525A49: add esp, 00000038h
  '00525A4C: ret 
End Sub
Private Sub remove_queue__5234C0
  '005234C0: push ebp
  '005234C1: mov ebp, esp
  '005234C3: sub esp, 0000000Ch
  '005234C6: push 004081B6h
  '005234CB: mov eax, fs:[00h]
  '005234D1: push eax
  '005234D2: mov fs:[00000000h], esp
  '005234D9: sub esp, 0000006Ch
  '005234DC: push ebx
  '005234DD: push esi
  '005234DE: push edi
  '005234DF: mov [ebp-0Ch], esp
  '005234E2: mov [ebp-08h], 00407008h
  '005234E9: mov esi, [ebp+08h]
  '005234EC: mov eax, esi
  '005234EE: and eax, 00000001h
  '005234F1: mov [ebp-04h], eax
  '005234F4: and esi, FFFFFFFEh
  '005234F7: push esi
  '005234F8: mov [ebp+08h], esi
  '005234FB: mov ecx, [esi]
  '005234FD: call [ecx+04h]
  '00523500: mov edx, [esi]
  '00523502: xor eax, eax
  '00523504: push 0041EFA8h
  '00523509: push eax
  '0052350A: push 00000007h
  '0052350C: push esi
  '0052350D: mov [ebp-18h], eax
  '00523510: mov [ebp-1Ch], eax
  '00523513: mov [ebp-20h], eax
  '00523516: mov [ebp-24h], eax
  '00523519: mov [ebp-34h], eax
  '0052351C: mov [ebp-44h], eax
  '0052351F: mov [ebp-54h], eax
  '00523522: mov [ebp-68h], eax
  '00523525: call [edx+0000030Ch]
  '0052352B: mov edi, [004010E4h]
  '00523531: push eax
  '00523532: lea eax, [ebp-18h]
  '00523535: push eax
  '00523536: call edi
  '00523538: lea ecx, [ebp-34h]
  '0052353B: push eax
  '0052353C: push ecx
  '0052353D: call [004011E4h]
  '00523543: add esp, 00000010h
  '00523546: push eax
  '00523547: call [004011C8h]
  '0052354D: lea edx, [ebp-1Ch]
  '00523550: push eax
  '00523551: push edx
  '00523552: call edi
  '00523554: mov ebx, eax
  '00523556: lea ecx, [ebp-68h]
  '00523559: push ecx
  '0052355A: push ebx
  '0052355B: mov eax, [ebx]
  '0052355D: call [eax+1Ch]
  '00523560: test eax, eax
  '00523562: fclex 
  '00523564: jnl 523575h
  '00523566: push 0000001Ch
  '00523568: push 0041EFA8h
  '0052356D: push ebx
  '0052356E: push eax
  '0052356F: call [004010A0h]
  '00523575: mov edx, [ebp-68h]
  '00523578: xor ebx, ebx
  '0052357A: test edx, edx
  '0052357C: lea edx, [ebp-1Ch]
  '0052357F: lea eax, [ebp-18h]
  '00523582: push edx
  '00523583: push eax
  '00523584: setnle bl
  '00523587: push 00000002h
  '00523589: neg ebx
  '0052358B: call [00401064h]
  '00523591: add esp, 0000000Ch
  '00523594: lea ecx, [ebp-34h]
  '00523597: call [00401030h]
  '0052359D: test bx, bx
  '005235A0: jz 0052368Eh
  '005235A6: mov ecx, [esi]
  '005235A8: push 0041EFA8h
  '005235AD: push 00000000h
  '005235AF: push 00000007h
  '005235B1: push esi
  '005235B2: call [ecx+0000030Ch]
  '005235B8: lea edx, [ebp-20h]
  '005235BB: push eax
  '005235BC: push edx
  '005235BD: call edi
  '005235BF: push eax
  '005235C0: lea eax, [ebp-44h]
  '005235C3: push eax
  '005235C4: call [004011E4h]
  '005235CA: add esp, 00000010h
  '005235CD: push eax
  '005235CE: call [004011C8h]
  '005235D4: lea ecx, [ebp-24h]
  '005235D7: push eax
  '005235D8: push ecx
  '005235D9: call edi
  '005235DB: mov edx, [esi]
  '005235DD: push 0041E438h
  '005235E2: push 00000000h
  '005235E4: push 0000000Dh
  '005235E6: push esi
  '005235E7: mov ebx, eax
  '005235E9: call [edx+0000030Ch]
  '005235EF: push eax
  '005235F0: lea eax, [ebp-18h]
  '005235F3: push eax
  '005235F4: call edi
  '005235F6: lea ecx, [ebp-34h]
  '005235F9: push eax
  '005235FA: push ecx
  '005235FB: call [004011E4h]
  '00523601: add esp, 00000010h
  '00523604: push eax
  '00523605: call [004011C8h]
  '0052360B: lea edx, [ebp-1Ch]
  '0052360E: push eax
  '0052360F: push edx
  '00523610: call edi
  '00523612: mov esi, eax
  '00523614: lea ecx, [ebp-68h]
  '00523617: push ecx
  '00523618: push esi
  '00523619: mov eax, [esi]
  '0052361B: call [eax+44h]
  '0052361E: test eax, eax
  '00523620: fclex 
  '00523622: jnl 523633h
  '00523624: push 00000044h
  '00523626: push 0041E438h
  '0052362B: push esi
  '0052362C: push eax
  '0052362D: call [004010A0h]
  '00523633: mov edx, [ebp-68h]
  '00523636: lea ecx, [ebp-54h]
  '00523639: mov [ebp-4Ch], edx
  '0052363C: mov [ebp-54h], 00000003h
  '00523643: mov eax, [ebx]
  '00523645: push ecx
  '00523646: push ebx
  '00523647: call [eax+34h]
  '0052364A: test eax, eax
  '0052364C: fclex 
  '0052364E: jnl 52365Fh
  '00523650: push 00000034h
  '00523652: push 0041EFA8h
  '00523657: push ebx
  '00523658: push eax
  '00523659: call [004010A0h]
  '0052365F: lea edx, [ebp-24h]
  '00523662: lea eax, [ebp-20h]
  '00523665: push edx
  '00523666: lea ecx, [ebp-1Ch]
  '00523669: push eax
  '0052366A: lea edx, [ebp-18h]
  '0052366D: push ecx
  '0052366E: push edx
  '0052366F: push 00000004h
  '00523671: call [00401064h]
  '00523677: lea eax, [ebp-54h]
  '0052367A: lea ecx, [ebp-44h]
  '0052367D: push eax
  '0052367E: lea edx, [ebp-34h]
  '00523681: push ecx
  '00523682: push edx
  '00523683: push 00000003h
  '00523685: call [00401050h]
  '0052368B: add esp, 00000024h
  '0052368E: mov [ebp-04h], 00000000h
  '00523695: push 005236CDh
  '0052369A: jmp 5236CCh
  '0052369C: lea eax, [ebp-24h]
  '0052369F: lea ecx, [ebp-20h]
  '005236A2: push eax
  '005236A3: lea edx, [ebp-1Ch]
  '005236A6: push ecx
  '005236A7: lea eax, [ebp-18h]
  '005236AA: push edx
  '005236AB: push eax
  '005236AC: push 00000004h
  '005236AE: call [00401064h]
  '005236B4: lea ecx, [ebp-54h]
  '005236B7: lea edx, [ebp-44h]
  '005236BA: push ecx
  '005236BB: lea eax, [ebp-34h]
  '005236BE: push edx
  '005236BF: push eax
  '005236C0: push 00000003h
  '005236C2: call [00401050h]
  '005236C8: add esp, 00000024h
  '005236CB: ret 
End Sub
Private Sub StatusBar1__5236F0
  '005236F0: push ebp
  '005236F1: mov ebp, esp
  '005236F3: sub esp, 0000000Ch
  '005236F6: push 004081B6h
  '005236FB: mov eax, fs:[00h]
  '00523701: push eax
  '00523702: mov fs:[00000000h], esp
  '00523709: sub esp, 0000000Ch
  '0052370C: push ebx
  '0052370D: push esi
  '0052370E: push edi
  '0052370F: mov [ebp-0Ch], esp
  '00523712: mov [ebp-08h], 00407018h
  '00523719: mov eax, [ebp+08h]
  '0052371C: mov ecx, eax
  '0052371E: and ecx, 00000001h
  '00523721: mov [ebp-04h], ecx
  '00523724: and al, FEh
  '00523726: push eax
  '00523727: mov [ebp+08h], eax
  '0052372A: mov edx, [eax]
  '0052372C: call [edx+04h]
  '0052372F: mov eax, [ebp+0Ch]
  '00523732: lea ecx, [ebp-18h]
  '00523735: xor esi, esi
  '00523737: push eax
  '00523738: push ecx
  '00523739: mov [ebp-18h], esi
  '0052373C: call [004010F8h]
  '00523742: mov [ebp-04h], esi
  '00523745: push 00523754h
  '0052374A: lea ecx, [ebp-18h]
  '0052374D: call [004013B8h]
  '00523753: ret 
End Sub
Private Sub lstQueue__5229A0
  '005229A0: push ebp
  '005229A1: mov ebp, esp
  '005229A3: sub esp, 00000018h
  '005229A6: push 004081B6h
  '005229AB: mov eax, fs:[00h]
  '005229B1: push eax
  '005229B2: mov fs:[00000000h], esp
  '005229B9: mov eax, 00000210h
  '005229BE: call 004081B0h
  '005229C3: push ebx
  '005229C4: push esi
  '005229C5: push edi
  '005229C6: mov [ebp-18h], esp
  '005229C9: mov [ebp-14h], 00406FC0h
  '005229D0: mov eax, [ebp+08h]
  '005229D3: and eax, 00000001h
  '005229D6: mov [ebp-10h], eax
  '005229D9: mov ecx, [ebp+08h]
  '005229DC: and ecx, FFFFFFFEh
  '005229DF: mov [ebp+08h], ecx
  '005229E2: mov [ebp-0Ch], 00000000h
  '005229E9: mov edx, [ebp+08h]
  '005229EC: mov eax, [edx]
  '005229EE: mov ecx, [ebp+08h]
  '005229F1: push ecx
  '005229F2: call [eax+04h]
  '005229F5: mov [ebp-04h], 00000001h
  '005229FC: mov edx, [ebp+0Ch]
  '005229FF: push edx
  '00522A00: lea eax, [ebp-24h]
  '00522A03: push eax
  '00522A04: call [004010F8h]
  '00522A0A: mov [ebp-04h], 00000002h
  '00522A11: push FFFFFFFFh
  '00522A13: call [004010E8h]
  '00522A19: mov [ebp-04h], 00000003h
  '00522A20: cmp [0054238Ch], 00000000h
  '00522A27: jnz 522A45h
  '00522A29: push 0054238Ch
  '00522A2E: push 0041D9E0h
  '00522A33: call [004012B8h]
  '00522A39: mov [ebp-00000200h], 0054238Ch
  '00522A43: jmp 522A4Fh
  '00522A45: mov [ebp-00000200h], 0054238Ch
  '00522A4F: mov ecx, [ebp-00000200h]
  '00522A55: mov edx, [ecx]
  '00522A57: mov [ebp-000001A0h], edx
  '00522A5D: lea eax, [ebp-54h]
  '00522A60: push eax
  '00522A61: mov ecx, [ebp-000001A0h]
  '00522A67: mov edx, [ecx]
  '00522A69: mov eax, [ebp-000001A0h]
  '00522A6F: push eax
  '00522A70: call [edx+14h]
  '00522A73: fclex 
  '00522A75: mov [ebp-000001A4h], eax
  '00522A7B: cmp [ebp-000001A4h], 00000000h
  '00522A82: jnl 522AA7h
  '00522A84: push 00000014h
  '00522A86: push 0041D9D0h
  '00522A8B: mov ecx, [ebp-000001A0h]
  '00522A91: push ecx
  '00522A92: mov edx, [ebp-000001A4h]
  '00522A98: push edx
  '00522A99: call [004010A0h]
  '00522A9F: mov [ebp-00000204h], eax
  '00522AA5: jmp 522AB1h
  '00522AA7: mov [ebp-00000204h], 00000000h
  '00522AB1: mov eax, [ebp-54h]
  '00522AB4: mov [ebp-000001A8h], eax
  '00522ABA: lea ecx, [ebp-2Ch]
  '00522ABD: push ecx
  '00522ABE: mov edx, [ebp-000001A8h]
  '00522AC4: mov eax, [edx]
  '00522AC6: mov ecx, [ebp-000001A8h]
  '00522ACC: push ecx
  '00522ACD: call [eax+50h]
  '00522AD0: fclex 
  '00522AD2: mov [ebp-000001ACh], eax
  '00522AD8: cmp [ebp-000001ACh], 00000000h
  '00522ADF: jnl 522B04h
  '00522AE1: push 00000050h
  '00522AE3: push 0041D9F0h
  '00522AE8: mov edx, [ebp-000001A8h]
  '00522AEE: push edx
  '00522AEF: mov eax, [ebp-000001ACh]
  '00522AF5: push eax
  '00522AF6: call [004010A0h]
  '00522AFC: mov [ebp-00000208h], eax
  '00522B02: jmp 522B0Eh
  '00522B04: mov [ebp-00000208h], 00000000h
  '00522B0E: push 00000001h
  '00522B10: mov ecx, [ebp-2Ch]
  '00522B13: push ecx
  '00522B14: call [00401380h]
  '00522B1A: mov edx, eax
  '00522B1C: lea ecx, [ebp-50h]
  '00522B1F: call [00401378h]
  '00522B25: cmp [0054238Ch], 00000000h
  '00522B2C: jnz 522B4Ah
  '00522B2E: push 0054238Ch
  '00522B33: push 0041D9E0h
  '00522B38: call [004012B8h]
  '00522B3E: mov [ebp-0000020Ch], 0054238Ch
  '00522B48: jmp 522B54h
  '00522B4A: mov [ebp-0000020Ch], 0054238Ch
  '00522B54: mov edx, [ebp-0000020Ch]
  '00522B5A: mov eax, [edx]
  '00522B5C: mov [ebp-000001B0h], eax
  '00522B62: lea ecx, [ebp-58h]
  '00522B65: push ecx
  '00522B66: mov edx, [ebp-000001B0h]
  '00522B6C: mov eax, [edx]
  '00522B6E: mov ecx, [ebp-000001B0h]
  '00522B74: push ecx
  '00522B75: call [eax+14h]
  '00522B78: fclex 
  '00522B7A: mov [ebp-000001B4h], eax
  '00522B80: cmp [ebp-000001B4h], 00000000h
  '00522B87: jnl 522BACh
  '00522B89: push 00000014h
  '00522B8B: push 0041D9D0h
  '00522B90: mov edx, [ebp-000001B0h]
  '00522B96: push edx
  '00522B97: mov eax, [ebp-000001B4h]
  '00522B9D: push eax
  '00522B9E: call [004010A0h]
  '00522BA4: mov [ebp-00000210h], eax
  '00522BAA: jmp 522BB6h
  '00522BAC: mov [ebp-00000210h], 00000000h
  '00522BB6: mov ecx, [ebp-58h]
  '00522BB9: mov [ebp-000001B8h], ecx
  '00522BBF: lea edx, [ebp-34h]
  '00522BC2: push edx
  '00522BC3: mov eax, [ebp-000001B8h]
  '00522BC9: mov ecx, [eax]
  '00522BCB: mov edx, [ebp-000001B8h]
  '00522BD1: push edx
  '00522BD2: call [ecx+50h]
  '00522BD5: fclex 
  '00522BD7: mov [ebp-000001BCh], eax
  '00522BDD: cmp [ebp-000001BCh], 00000000h
  '00522BE4: jnl 522C09h
  '00522BE6: push 00000050h
  '00522BE8: push 0041D9F0h
  '00522BED: mov eax, [ebp-000001B8h]
  '00522BF3: push eax
  '00522BF4: mov ecx, [ebp-000001BCh]
  '00522BFA: push ecx
  '00522BFB: call [004010A0h]
  '00522C01: mov [ebp-00000214h], eax
  '00522C07: jmp 522C13h
  '00522C09: mov [ebp-00000214h], 00000000h
  '00522C13: lea edx, [ebp-38h]
  '00522C16: push edx
  '00522C17: mov eax, [ebp+08h]
  '00522C1A: mov ecx, [eax]
  '00522C1C: mov edx, [ebp+08h]
  '00522C1F: push edx
  '00522C20: call [ecx+50h]
  '00522C23: fclex 
  '00522C25: mov [ebp-000001C0h], eax
  '00522C2B: cmp [ebp-000001C0h], 00000000h
  '00522C32: jnl 522C54h
  '00522C34: push 00000050h
  '00522C36: push 004208E0h
  '00522C3B: mov eax, [ebp+08h]
  '00522C3E: push eax
  '00522C3F: mov ecx, [ebp-000001C0h]
  '00522C45: push ecx
  '00522C46: call [004010A0h]
  '00522C4C: mov [ebp-00000218h], eax
  '00522C52: jmp 522C5Eh
  '00522C54: mov [ebp-00000218h], 00000000h
  '00522C5E: lea edx, [ebp-3Ch]
  '00522C61: push edx
  '00522C62: mov eax, [ebp+08h]
  '00522C65: mov ecx, [eax]
  '00522C67: mov edx, [ebp+08h]
  '00522C6A: push edx
  '00522C6B: call [ecx+50h]
  '00522C6E: fclex 
  '00522C70: mov [ebp-000001C4h], eax
  '00522C76: cmp [ebp-000001C4h], 00000000h
  '00522C7D: jnl 522C9Fh
  '00522C7F: push 00000050h
  '00522C81: push 004208E0h
  '00522C86: mov eax, [ebp+08h]
  '00522C89: push eax
  '00522C8A: mov ecx, [ebp-000001C4h]
  '00522C90: push ecx
  '00522C91: call [004010A0h]
  '00522C97: mov [ebp-0000021Ch], eax
  '00522C9D: jmp 522CA9h
  '00522C9F: mov [ebp-0000021Ch], 00000000h
  '00522CA9: mov [ebp-00000144h], 0042B158h
  '00522CB3: mov [ebp-0000014Ch], 00000008h
  '00522CBD: lea edx, [ebp-0000014Ch]
  '00522CC3: lea ecx, [ebp-7Ch]
  '00522CC6: call [00401338h]
  '00522CCC: mov edx, [ebp-3Ch]
  '00522CCF: mov [ebp-000001F4h], edx
  '00522CD5: mov [ebp-3Ch], 00000000h
  '00522CDC: mov eax, [ebp-000001F4h]
  '00522CE2: mov [ebp-64h], eax
  '00522CE5: mov [ebp-6Ch], 00000008h
  '00522CEC: mov ecx, [ebp-38h]
  '00522CEF: push ecx
  '00522CF0: call [00401044h]
  '00522CF6: xor edx, edx
  '00522CF8: test eax, eax
  '00522CFA: setnle dl
  '00522CFD: neg edx
  '00522CFF: mov [ebp-00000134h], dx
  '00522D06: mov [ebp-0000013Ch], 0000000Bh
  '00522D10: lea eax, [ebp-7Ch]
  '00522D13: push eax
  '00522D14: lea ecx, [ebp-6Ch]
  '00522D17: push ecx
  '00522D18: lea edx, [ebp-0000013Ch]
  '00522D1E: push edx
  '00522D1F: lea eax, [ebp-0000008Ch]
  '00522D25: push eax
  '00522D26: call [004012DCh]
  '00522D2C: lea ecx, [ebp-48h]
  '00522D2F: push ecx
  '00522D30: mov edx, [ebp+08h]
  '00522D33: mov eax, [edx]
  '00522D35: mov ecx, [ebp+08h]
  '00522D38: push ecx
  '00522D39: call [eax+50h]
  '00522D3C: fclex 
  '00522D3E: mov [ebp-000001C8h], eax
  '00522D44: cmp [ebp-000001C8h], 00000000h
  '00522D4B: jnl 522D6Dh
  '00522D4D: push 00000050h
  '00522D4F: push 004208E0h
  '00522D54: mov edx, [ebp+08h]
  '00522D57: push edx
  '00522D58: mov eax, [ebp-000001C8h]
  '00522D5E: push eax
  '00522D5F: call [004010A0h]
  '00522D65: mov [ebp-00000220h], eax
  '00522D6B: jmp 522D77h
  '00522D6D: mov [ebp-00000220h], 00000000h
  '00522D77: lea ecx, [ebp-4Ch]
  '00522D7A: push ecx
  '00522D7B: mov edx, [ebp+08h]
  '00522D7E: mov eax, [edx]
  '00522D80: mov ecx, [ebp+08h]
  '00522D83: push ecx
  '00522D84: call [eax+50h]
  '00522D87: fclex 
  '00522D89: mov [ebp-000001CCh], eax
  '00522D8F: cmp [ebp-000001CCh], 00000000h
  '00522D96: jnl 522DB8h
  '00522D98: push 00000050h
  '00522D9A: push 004208E0h
  '00522D9F: mov edx, [ebp+08h]
  '00522DA2: push edx
  '00522DA3: mov eax, [ebp-000001CCh]
  '00522DA9: push eax
  '00522DAA: call [004010A0h]
  '00522DB0: mov [ebp-00000224h], eax
  '00522DB6: jmp 522DC2h
  '00522DB8: mov [ebp-00000224h], 00000000h
  '00522DC2: cmp [0054238Ch], 00000000h
  '00522DC9: jnz 522DE7h
  '00522DCB: push 0054238Ch
  '00522DD0: push 0041D9E0h
  '00522DD5: call [004012B8h]
  '00522DDB: mov [ebp-00000228h], 0054238Ch
  '00522DE5: jmp 522DF1h
  '00522DE7: mov [ebp-00000228h], 0054238Ch
  '00522DF1: mov ecx, [ebp-00000228h]
  '00522DF7: mov edx, [ecx]
  '00522DF9: mov [ebp-000001D0h], edx
  '00522DFF: lea eax, [ebp-5Ch]
  '00522E02: push eax
  '00522E03: mov ecx, [ebp-000001D0h]
  '00522E09: mov edx, [ecx]
  '00522E0B: mov eax, [ebp-000001D0h]
  '00522E11: push eax
  '00522E12: call [edx+14h]
  '00522E15: fclex 
  '00522E17: mov [ebp-000001D4h], eax
  '00522E1D: cmp [ebp-000001D4h], 00000000h
  '00522E24: jnl 522E49h
  '00522E26: push 00000014h
  '00522E28: push 0041D9D0h
  '00522E2D: mov ecx, [ebp-000001D0h]
  '00522E33: push ecx
  '00522E34: mov edx, [ebp-000001D4h]
  '00522E3A: push edx
  '00522E3B: call [004010A0h]
  '00522E41: mov [ebp-0000022Ch], eax
  '00522E47: jmp 522E53h
  '00522E49: mov [ebp-0000022Ch], 00000000h
  '00522E53: mov eax, [ebp-5Ch]
  '00522E56: mov [ebp-000001D8h], eax
  '00522E5C: lea ecx, [ebp-40h]
  '00522E5F: push ecx
  '00522E60: mov edx, [ebp-000001D8h]
  '00522E66: mov eax, [edx]
  '00522E68: mov ecx, [ebp-000001D8h]
  '00522E6E: push ecx
  '00522E6F: call [eax+50h]
  '00522E72: fclex 
  '00522E74: mov [ebp-000001DCh], eax
  '00522E7A: cmp [ebp-000001DCh], 00000000h
  '00522E81: jnl 522EA6h
  '00522E83: push 00000050h
  '00522E85: push 0041D9F0h
  '00522E8A: mov edx, [ebp-000001D8h]
  '00522E90: push edx
  '00522E91: mov eax, [ebp-000001DCh]
  '00522E97: push eax
  '00522E98: call [004010A0h]
  '00522E9E: mov [ebp-00000230h], eax
  '00522EA4: jmp 522EB0h
  '00522EA6: mov [ebp-00000230h], 00000000h
  '00522EB0: mov ecx, [ebp-40h]
  '00522EB3: push ecx
  '00522EB4: push 0041DE34h
  '00522EB9: call [0040108Ch]
  '00522EBF: mov edx, eax
  '00522EC1: lea ecx, [ebp-44h]
  '00522EC4: call [00401378h]
  '00522ECA: push eax
  '00522ECB: push 0042B140h
  '00522ED0: call [0040108Ch]
  '00522ED6: mov [ebp-000000F4h], eax
  '00522EDC: mov [ebp-000000FCh], 00000008h
  '00522EE6: mov [ebp-00000174h], 0042B158h
  '00522EF0: mov [ebp-0000017Ch], 00000008h
  '00522EFA: lea edx, [ebp-0000017Ch]
  '00522F00: lea ecx, [ebp-000000DCh]
  '00522F06: call [00401338h]
  '00522F0C: mov edx, [ebp-4Ch]
  '00522F0F: mov [ebp-000001F8h], edx
  '00522F15: mov [ebp-4Ch], 00000000h
  '00522F1C: mov eax, [ebp-000001F8h]
  '00522F22: mov [ebp-000000C4h], eax
  '00522F28: mov [ebp-000000CCh], 00000008h
  '00522F32: mov ecx, [ebp-48h]
  '00522F35: push ecx
  '00522F36: call [00401044h]
  '00522F3C: xor edx, edx
  '00522F3E: test eax, eax
  '00522F40: setnle dl
  '00522F43: neg edx
  '00522F45: mov [ebp-00000164h], dx
  '00522F4C: mov [ebp-0000016Ch], 0000000Bh
  '00522F56: lea eax, [ebp-000000DCh]
  '00522F5C: push eax
  '00522F5D: lea ecx, [ebp-000000CCh]
  '00522F63: push ecx
  '00522F64: lea edx, [ebp-0000016Ch]
  '00522F6A: push edx
  '00522F6B: lea eax, [ebp-000000ECh]
  '00522F71: push eax
  '00522F72: call [004012DCh]
  '00522F78: mov ecx, [ebp-34h]
  '00522F7B: push ecx
  '00522F7C: push 0042B140h
  '00522F81: call [0040108Ch]
  '00522F87: mov [ebp-00000094h], eax
  '00522F8D: mov [ebp-0000009Ch], 00000008h
  '00522F97: mov [ebp-00000154h], 0041DE34h
  '00522FA1: mov [ebp-0000015Ch], 00000008h
  '00522FAB: mov edx, [ebp-50h]
  '00522FAE: mov [ebp-000001FCh], edx
  '00522FB4: mov [ebp-50h], 00000000h
  '00522FBB: mov edx, [ebp-000001FCh]
  '00522FC1: lea ecx, [ebp-30h]
  '00522FC4: call [00401378h]
  '00522FCA: push eax
  '00522FCB: push 0041DE34h
  '00522FD0: call [00401184h]
  '00522FD6: neg eax
  '00522FD8: sbb eax, eax
  '00522FDA: inc eax
  '00522FDB: neg eax
  '00522FDD: mov [ebp-00000184h], ax
  '00522FE4: mov [ebp-0000018Ch], 0000000Bh
  '00522FEE: lea eax, [ebp-000000FCh]
  '00522FF4: push eax
  '00522FF5: lea ecx, [ebp-000000ECh]
  '00522FFB: push ecx
  '00522FFC: lea edx, [ebp-0000010Ch]
  '00523002: push edx
  '00523003: call [00401274h]
  '00523009: push eax
  '0052300A: lea eax, [ebp-0000009Ch]
  '00523010: push eax
  '00523011: lea ecx, [ebp-0000008Ch]
  '00523017: push ecx
  '00523018: lea edx, [ebp-000000ACh]
  '0052301E: push edx
  '0052301F: call [00401274h]
  '00523025: push eax
  '00523026: lea eax, [ebp-0000015Ch]
  '0052302C: push eax
  '0052302D: lea ecx, [ebp-000000BCh]
  '00523033: push ecx
  '00523034: call [00401274h]
  '0052303A: push eax
  '0052303B: lea edx, [ebp-0000018Ch]
  '00523041: push edx
  '00523042: lea eax, [ebp-0000011Ch]
  '00523048: push eax
  '00523049: call [004012DCh]
  '0052304F: mov [ebp-00000194h], 0041DE34h
  '00523059: mov [ebp-0000019Ch], 00000008h
  '00523063: lea ecx, [ebp-0000011Ch]
  '00523069: push ecx
  '0052306A: lea edx, [ebp-0000019Ch]
  '00523070: push edx
  '00523071: lea eax, [ebp-0000012Ch]
  '00523077: push eax
  '00523078: call [00401274h]
  '0052307E: push eax
  '0052307F: call [0040103Ch]
  '00523085: mov edx, eax
  '00523087: lea ecx, [ebp-28h]
  '0052308A: call [00401378h]
  '00523090: lea ecx, [ebp-50h]
  '00523093: push ecx
  '00523094: lea edx, [ebp-48h]
  '00523097: push edx
  '00523098: lea eax, [ebp-44h]
  '0052309B: push eax
  '0052309C: lea ecx, [ebp-40h]
  '0052309F: push ecx
  '005230A0: lea edx, [ebp-38h]
  '005230A3: push edx
  '005230A4: lea eax, [ebp-34h]
  '005230A7: push eax
  '005230A8: lea ecx, [ebp-30h]
  '005230AB: push ecx
  '005230AC: lea edx, [ebp-2Ch]
  '005230AF: push edx
  '005230B0: push 00000008h
  '005230B2: call [004012E8h]
  '005230B8: add esp, 00000024h
  '005230BB: lea eax, [ebp-5Ch]
  '005230BE: push eax
  '005230BF: lea ecx, [ebp-58h]
  '005230C2: push ecx
  '005230C3: lea edx, [ebp-54h]
  '005230C6: push edx
  '005230C7: push 00000003h
  '005230C9: call [00401064h]
  '005230CF: add esp, 00000010h
  '005230D2: lea eax, [ebp-0000012Ch]
  '005230D8: push eax
  '005230D9: lea ecx, [ebp-0000011Ch]
  '005230DF: push ecx
  '005230E0: lea edx, [ebp-0000010Ch]
  '005230E6: push edx
  '005230E7: lea eax, [ebp-000000BCh]
  '005230ED: push eax
  '005230EE: lea ecx, [ebp-0000018Ch]
  '005230F4: push ecx
  '005230F5: lea edx, [ebp-000000ECh]
  '005230FB: push edx
  '005230FC: lea eax, [ebp-000000FCh]
  '00523102: push eax
  '00523103: lea ecx, [ebp-000000DCh]
  '00523109: push ecx
  '0052310A: lea edx, [ebp-000000CCh]
  '00523110: push edx
  '00523111: lea eax, [ebp-0000016Ch]
  '00523117: push eax
  '00523118: lea ecx, [ebp-000000ACh]
  '0052311E: push ecx
  '0052311F: lea edx, [ebp-0000008Ch]
  '00523125: push edx
  '00523126: lea eax, [ebp-0000009Ch]
  '0052312C: push eax
  '0052312D: lea ecx, [ebp-7Ch]
  '00523130: push ecx
  '00523131: lea edx, [ebp-6Ch]
  '00523134: push edx
  '00523135: lea eax, [ebp-0000013Ch]
  '0052313B: push eax
  '0052313C: push 00000010h
  '0052313E: call [00401050h]
  '00523144: add esp, 00000044h
  '00523147: mov [ebp-04h], 00000004h
  '0052314E: push 00000001h
  '00523150: push 0041BC60h
  '00523155: lea ecx, [ebp-38h]
  '00523158: push ecx
  '00523159: call [00401330h]
  '0052315F: push eax
  '00523160: push 0041BC60h
  '00523165: lea edx, [ebp-34h]
  '00523168: push edx
  '00523169: call [00401330h]
  '0052316F: push eax
  '00523170: mov eax, [ebp-28h]
  '00523173: push eax
  '00523174: lea ecx, [ebp-30h]
  '00523177: push ecx
  '00523178: call [00401330h]
  '0052317E: push eax
  '0052317F: push 0041FD78h
  '00523184: lea edx, [ebp-2Ch]
  '00523187: push edx
  '00523188: call [00401330h]
  '0052318E: push eax
  '0052318F: push 00000000h
  '00523191: call 0041DC2Ch
  '00523196: call [0040109Ch]
  '0052319C: mov eax, [ebp-30h]
  '0052319F: push eax
  '005231A0: lea ecx, [ebp-28h]
  '005231A3: push ecx
  '005231A4: call [00401238h]
  '005231AA: lea edx, [ebp-38h]
  '005231AD: push edx
  '005231AE: lea eax, [ebp-34h]
  '005231B1: push eax
  '005231B2: lea ecx, [ebp-30h]
  '005231B5: push ecx
  '005231B6: lea edx, [ebp-2Ch]
  '005231B9: push edx
  '005231BA: push 00000004h
  '005231BC: call [004012E8h]
  '005231C2: add esp, 00000014h
  '005231C5: mov [ebp-10h], 00000000h
  '005231CC: push 00523294h
  '005231D1: jmp 00523281h
  '005231D6: lea eax, [ebp-50h]
  '005231D9: push eax
  '005231DA: lea ecx, [ebp-4Ch]
  '005231DD: push ecx
  '005231DE: lea edx, [ebp-48h]
  '005231E1: push edx
  '005231E2: lea eax, [ebp-44h]
  '005231E5: push eax
  '005231E6: lea ecx, [ebp-40h]
  '005231E9: push ecx
  '005231EA: lea edx, [ebp-3Ch]
  '005231ED: push edx
  '005231EE: lea eax, [ebp-38h]
  '005231F1: push eax
  '005231F2: lea ecx, [ebp-34h]
  '005231F5: push ecx
  '005231F6: lea edx, [ebp-30h]
  '005231F9: push edx
  '005231FA: lea eax, [ebp-2Ch]
  '005231FD: push eax
  '005231FE: push 0000000Ah
  '00523200: call [004012E8h]
  '00523206: add esp, 0000002Ch
  '00523209: lea ecx, [ebp-5Ch]
  '0052320C: push ecx
  '0052320D: lea edx, [ebp-58h]
  '00523210: push edx
  '00523211: lea eax, [ebp-54h]
  '00523214: push eax
  '00523215: push 00000003h
  '00523217: call [00401064h]
  '0052321D: add esp, 00000010h
  '00523220: lea ecx, [ebp-0000012Ch]
  '00523226: push ecx
  '00523227: lea edx, [ebp-0000011Ch]
  '0052322D: push edx
  '0052322E: lea eax, [ebp-0000010Ch]
  '00523234: push eax
  '00523235: lea ecx, [ebp-000000FCh]
  '0052323B: push ecx
  '0052323C: lea edx, [ebp-000000ECh]
  '00523242: push edx
  '00523243: lea eax, [ebp-000000DCh]
  '00523249: push eax
  '0052324A: lea ecx, [ebp-000000CCh]
  '00523250: push ecx
  '00523251: lea edx, [ebp-000000BCh]
  '00523257: push edx
  '00523258: lea eax, [ebp-000000ACh]
  '0052325E: push eax
  '0052325F: lea ecx, [ebp-0000009Ch]
  '00523265: push ecx
  '00523266: lea edx, [ebp-0000008Ch]
  '0052326C: push edx
  '0052326D: lea eax, [ebp-7Ch]
  '00523270: push eax
  '00523271: lea ecx, [ebp-6Ch]
  '00523274: push ecx
  '00523275: push 0000000Dh
  '00523277: call [00401050h]
  '0052327D: add esp, 00000038h
  '00523280: ret 
End Sub
Private Sub lstQueue__5232C0
  '005232C0: push ebp
  '005232C1: mov ebp, esp
  '005232C3: sub esp, 0000000Ch
  '005232C6: push 004081B6h
  '005232CB: mov eax, fs:[00h]
  '005232D1: push eax
  '005232D2: mov fs:[00000000h], esp
  '005232D9: sub esp, 00000070h
  '005232DC: push ebx
  '005232DD: push esi
  '005232DE: push edi
  '005232DF: mov [ebp-0Ch], esp
  '005232E2: mov [ebp-08h], 00406FF8h
  '005232E9: mov esi, [ebp+08h]
  '005232EC: mov eax, esi
  '005232EE: and eax, 00000001h
  '005232F1: mov [ebp-04h], eax
  '005232F4: and esi, FFFFFFFEh
  '005232F7: push esi
  '005232F8: mov [ebp+08h], esi
  '005232FB: mov ecx, [esi]
  '005232FD: call [ecx+04h]
  '00523300: mov edx, [esi]
  '00523302: xor ebx, ebx
  '00523304: push 0041EFA8h
  '00523309: push ebx
  '0052330A: push 00000007h
  '0052330C: push esi
  '0052330D: mov [ebp-18h], ebx
  '00523310: mov [ebp-1Ch], ebx
  '00523313: mov [ebp-2Ch], ebx
  '00523316: mov [ebp-3Ch], ebx
  '00523319: mov [ebp-4Ch], ebx
  '0052331C: mov [ebp-5Ch], ebx
  '0052331F: mov [ebp-6Ch], ebx
  '00523322: mov [ebp-70h], ebx
  '00523325: call [edx+0000030Ch]
  '0052332B: mov edi, [004010E4h]
  '00523331: push eax
  '00523332: lea eax, [ebp-18h]
  '00523335: push eax
  '00523336: call edi
  '00523338: lea ecx, [ebp-2Ch]
  '0052333B: push eax
  '0052333C: push ecx
  '0052333D: call [004011E4h]
  '00523343: add esp, 00000010h
  '00523346: push eax
  '00523347: call [004011C8h]
  '0052334D: lea edx, [ebp-1Ch]
  '00523350: push eax
  '00523351: push edx
  '00523352: call edi
  '00523354: mov edi, eax
  '00523356: lea ecx, [ebp-70h]
  '00523359: push ecx
  '0052335A: push edi
  '0052335B: mov eax, [edi]
  '0052335D: call [eax+1Ch]
  '00523360: cmp eax, ebx
  '00523362: fclex 
  '00523364: jnl 523375h
  '00523366: push 0000001Ch
  '00523368: push 0041EFA8h
  '0052336D: push edi
  '0052336E: push eax
  '0052336F: call [004010A0h]
  '00523375: mov eax, [ebp+0Ch]
  '00523378: mov edi, [ebp-70h]
  '0052337B: xor edx, edx
  '0052337D: cmp word ptr [eax], 0002h
  '00523381: lea eax, [ebp-18h]
  '00523384: setz dl
  '00523387: neg edx
  '00523389: xor ecx, ecx
  '0052338B: cmp edi, ebx
  '0052338D: setnle cl
  '00523390: neg ecx
  '00523392: and edx, ecx
  '00523394: mov edi, edx
  '00523396: lea edx, [ebp-1Ch]
  '00523399: push edx
  '0052339A: push eax
  '0052339B: push 00000002h
  '0052339D: call [00401064h]
  '005233A3: add esp, 0000000Ch
  '005233A6: lea ecx, [ebp-2Ch]
  '005233A9: call [00401030h]
  '005233AF: cmp di, bx
  '005233B2: jz 00523476h
  '005233B8: sub esp, 00000010h
  '005233BB: mov ecx, 0000000Ah
  '005233C0: mov ebx, esp
  '005233C2: mov [ebp-3Ch], ecx
  '005233C5: mov edx, 80020004h
  '005233CA: sub esp, 00000010h
  '005233CD: mov [ebx], ecx
  '005233CF: mov ecx, [ebp-68h]
  '005233D2: mov eax, edx
  '005233D4: mov [ebp-34h], edx
  '005233D7: mov [ebx+04h], ecx
  '005233DA: mov ecx, esp
  '005233DC: sub esp, 00000010h
  '005233DF: mov edi, [esi]
  '005233E1: mov [ebx+08h], eax
  '005233E4: mov eax, [ebp-60h]
  '005233E7: mov [ebx+0Ch], eax
  '005233EA: mov eax, 0000000Ah
  '005233EF: mov [ecx], eax
  '005233F1: mov eax, [ebp-58h]
  '005233F4: mov [ecx+04h], eax
  '005233F7: mov eax, 0000000Ah
  '005233FC: mov [ecx+08h], edx
  '005233FF: mov edx, [ebp-50h]
  '00523402: mov [ecx+0Ch], edx
  '00523405: mov edx, [ebp-48h]
  '00523408: mov ecx, esp
  '0052340A: sub esp, 00000010h
  '0052340D: mov [ecx], eax
  '0052340F: mov eax, 80020004h
  '00523414: mov [ecx+04h], edx
  '00523417: mov edx, [ebp-3Ch]
  '0052341A: mov [ecx+08h], eax
  '0052341D: mov eax, [ebp-40h]
  '00523420: mov [ecx+0Ch], eax
  '00523423: mov eax, [ebp-38h]
  '00523426: mov ecx, esp
  '00523428: push esi
  '00523429: mov [ecx], edx
  '0052342B: mov edx, [ebp-34h]
  '0052342E: mov [ecx+04h], eax
  '00523431: mov eax, [ebp-30h]
  '00523434: mov [ecx+08h], edx
  '00523437: mov [ecx+0Ch], eax
  '0052343A: call [edi+00000300h]
  '00523440: lea ecx, [ebp-18h]
  '00523443: push eax
  '00523444: push ecx
  '00523445: call [004010E4h]
  '0052344B: push eax
  '0052344C: push esi
  '0052344D: call [edi+000002BCh]
  '00523453: xor ebx, ebx
  '00523455: cmp eax, ebx
  '00523457: fclex 
  '00523459: jnl 52346Dh
  '0052345B: push 000002BCh
  '00523460: push 004208E0h
  '00523465: push esi
  '00523466: push eax
  '00523467: call [004010A0h]
  '0052346D: lea ecx, [ebp-18h]
  '00523470: call [004013B8h]
  '00523476: mov [ebp-04h], ebx
  '00523479: push 0052349Eh
  '0052347E: jmp 52349Dh
  '00523480: lea edx, [ebp-1Ch]
  '00523483: lea eax, [ebp-18h]
  '00523486: push edx
  '00523487: push eax
  '00523488: push 00000002h
  '0052348A: call [00401064h]
  '00523490: add esp, 0000000Ch
  '00523493: lea ecx, [ebp-2Ch]
  '00523496: call [00401030h]
  '0052349C: ret 
End Sub
Private Sub lstQueue__522930
  '00522930: push ebp
  '00522931: mov ebp, esp
  '00522933: sub esp, 0000000Ch
  '00522936: push 004081B6h
  '0052293B: mov eax, fs:[00h]
  '00522941: push eax
  '00522942: mov fs:[00000000h], esp
  '00522949: sub esp, 00000008h
  '0052294C: push ebx
  '0052294D: push esi
  '0052294E: push edi
  '0052294F: mov [ebp-0Ch], esp
  '00522952: mov [ebp-08h], 00406FB8h
  '00522959: mov eax, [ebp+08h]
  '0052295C: mov ecx, eax
  '0052295E: and ecx, 00000001h
  '00522961: mov [ebp-04h], ecx
  '00522964: and al, FEh
  '00522966: push eax
  '00522967: mov [ebp+08h], eax
  '0052296A: mov edx, [eax]
  '0052296C: call [edx+04h]
  '0052296F: mov [ebp-04h], 00000000h
  '00522976: mov eax, [ebp+08h]
  '00522979: push eax
  '0052297A: mov ecx, [eax]
  '0052297C: call [ecx+08h]
  '0052297F: mov eax, [ebp-04h]
  '00522982: mov ecx, [ebp-14h]
  '00522985: pop edi
  '00522986: pop esi
  '00522987: mov fs:[00000000h], ecx
  '0052298E: pop ebx
  '0052298F: mov esp, ebp
  '00522991: pop ebp
  '00522992: retn 0004h
End Sub
Private Sub wskTransfer__525CB0
  '00525CB0: push ebp
  '00525CB1: mov ebp, esp
  '00525CB3: sub esp, 00000018h
  '00525CB6: push 004081B6h
  '00525CBB: mov eax, fs:[00h]
  '00525CC1: push eax
  '00525CC2: mov fs:[00000000h], esp
  '00525CC9: mov eax, 00000064h
  '00525CCE: call 004081B0h
  '00525CD3: push ebx
  '00525CD4: push esi
  '00525CD5: push edi
  '00525CD6: mov [ebp-18h], esp
  '00525CD9: mov [ebp-14h], 00407178h
  '00525CE0: mov eax, [ebp+08h]
  '00525CE3: and eax, 00000001h
  '00525CE6: mov [ebp-10h], eax
  '00525CE9: mov ecx, [ebp+08h]
  '00525CEC: and ecx, FFFFFFFEh
  '00525CEF: mov [ebp+08h], ecx
  '00525CF2: mov [ebp-0Ch], 00000000h
  '00525CF9: mov edx, [ebp+08h]
  '00525CFC: mov eax, [edx]
  '00525CFE: mov ecx, [ebp+08h]
  '00525D01: push ecx
  '00525D02: call [eax+04h]
  '00525D05: mov [ebp-04h], 00000001h
  '00525D0C: mov edx, [ebp+18h]
  '00525D0F: lea ecx, [ebp-28h]
  '00525D12: call [004012D8h]
  '00525D18: mov edx, [ebp+1Ch]
  '00525D1B: lea ecx, [ebp-24h]
  '00525D1E: call [004012D8h]
  '00525D24: mov [ebp-04h], 00000002h
  '00525D2B: cmp word ptr [ebp+0Ch], 274Dh
  '00525D31: jnz 00525E12h
  '00525D37: mov [ebp-04h], 00000003h
  '00525D3E: push 00000000h
  '00525D40: push 00000046h
  '00525D42: mov edx, [ebp+08h]
  '00525D45: mov eax, [edx]
  '00525D47: mov ecx, [ebp+08h]
  '00525D4A: push ecx
  '00525D4B: call [eax+00000314h]
  '00525D51: push eax
  '00525D52: lea edx, [ebp-3Ch]
  '00525D55: push edx
  '00525D56: call [004010E4h]
  '00525D5C: push eax
  '00525D5D: call [00401040h]
  '00525D63: add esp, 0000000Ch
  '00525D66: lea ecx, [ebp-3Ch]
  '00525D69: call [004013B8h]
  '00525D6F: mov [ebp-04h], 00000004h
  '00525D76: cmp [00541024h], 00000000h
  '00525D7D: jnz 525D98h
  '00525D7F: push 00541024h
  '00525D84: push 00413334h
  '00525D89: call [004012B8h]
  '00525D8F: mov [ebp-70h], 00541024h
  '00525D96: jmp 525D9Fh
  '00525D98: mov [ebp-70h], 00541024h
  '00525D9F: mov eax, [ebp-70h]
  '00525DA2: mov ecx, [eax]
  '00525DA4: mov [ebp-54h], ecx
  '00525DA7: mov edx, 0042B2C4h
  '00525DAC: lea ecx, [ebp-2Ch]
  '00525DAF: call [004012D8h]
  '00525DB5: lea edx, [ebp-2Ch]
  '00525DB8: push edx
  '00525DB9: mov eax, [ebp-54h]
  '00525DBC: mov ecx, [eax]
  '00525DBE: mov edx, [ebp-54h]
  '00525DC1: push edx
  '00525DC2: call [ecx+0000071Ch]
  '00525DC8: fclex 
  '00525DCA: mov [ebp-58h], eax
  '00525DCD: cmp [ebp-58h], 00000000h
  '00525DD1: jnl 525DF0h
  '00525DD3: push 0000071Ch
  '00525DD8: push 0041C118h
  '00525DDD: mov eax, [ebp-54h]
  '00525DE0: push eax
  '00525DE1: mov ecx, [ebp-58h]
  '00525DE4: push ecx
  '00525DE5: call [004010A0h]
  '00525DEB: mov [ebp-74h], eax
  '00525DEE: jmp 525DF7h
  '00525DF0: mov [ebp-74h], 00000000h
  '00525DF7: lea ecx, [ebp-2Ch]
  '00525DFA: call [004013B4h]
  '00525E00: mov [ebp-04h], 00000005h
  '00525E07: call [00401104h]
  '00525E0D: jmp 00526070h
  '00525E12: mov [ebp-04h], 00000007h
  '00525E19: push FFFFFFFFh
  '00525E1B: call [004010E8h]
  '00525E21: mov [ebp-04h], 00000008h
  '00525E28: push 00000000h
  '00525E2A: push 00000008h
  '00525E2C: mov edx, [ebp+08h]
  '00525E2F: mov eax, [edx]
  '00525E31: mov ecx, [ebp+08h]
  '00525E34: push ecx
  '00525E35: call [eax+00000314h]
  '00525E3B: push eax
  '00525E3C: lea edx, [ebp-3Ch]
  '00525E3F: push edx
  '00525E40: call [004010E4h]
  '00525E46: push eax
  '00525E47: lea eax, [ebp-4Ch]
  '00525E4A: push eax
  '00525E4B: call [004011E4h]
  '00525E51: add esp, 00000010h
  '00525E54: push eax
  '00525E55: call [00401284h]
  '00525E5B: movsx ecx, ax
  '00525E5E: neg ecx
  '00525E60: sbb ecx, ecx
  '00525E62: neg ecx
  '00525E64: neg ecx
  '00525E66: mov [ebp-54h], cx
  '00525E6A: lea ecx, [ebp-3Ch]
  '00525E6D: call [004013B8h]
  '00525E73: lea ecx, [ebp-4Ch]
  '00525E76: call [00401030h]
  '00525E7C: movsx edx, word ptr [ebp-54h]
  '00525E80: test edx, edx
  '00525E82: jz 525EBCh
  '00525E84: mov [ebp-04h], 00000009h
  '00525E8B: push 00000000h
  '00525E8D: push 00000046h
  '00525E8F: mov eax, [ebp+08h]
  '00525E92: mov ecx, [eax]
  '00525E94: mov edx, [ebp+08h]
  '00525E97: push edx
  '00525E98: call [ecx+00000314h]
  '00525E9E: push eax
  '00525E9F: lea eax, [ebp-3Ch]
  '00525EA2: push eax
  '00525EA3: call [004010E4h]
  '00525EA9: push eax
  '00525EAA: call [00401040h]
  '00525EB0: add esp, 0000000Ch
  '00525EB3: lea ecx, [ebp-3Ch]
  '00525EB6: call [004013B8h]
  '00525EBC: mov [ebp-04h], 0000000Bh
  '00525EC3: cmp [00541024h], 00000000h
  '00525ECA: jnz 525EE5h
  '00525ECC: push 00541024h
  '00525ED1: push 00413334h
  '00525ED6: call [004012B8h]
  '00525EDC: mov [ebp-78h], 00541024h
  '00525EE3: jmp 525EECh
  '00525EE5: mov [ebp-78h], 00541024h
  '00525EEC: mov ecx, [ebp-78h]
  '00525EEF: mov edx, [ecx]
  '00525EF1: mov [ebp-54h], edx
  '00525EF4: mov eax, [ebp+10h]
  '00525EF7: push eax
  '00525EF8: mov ecx, [ebp-54h]
  '00525EFB: mov edx, [ecx]
  '00525EFD: mov eax, [ebp-54h]
  '00525F00: push eax
  '00525F01: call [edx+0000071Ch]
  '00525F07: fclex 
  '00525F09: mov [ebp-58h], eax
  '00525F0C: cmp [ebp-58h], 00000000h
  '00525F10: jnl 525F2Fh
  '00525F12: push 0000071Ch
  '00525F17: push 0041C118h
  '00525F1C: mov ecx, [ebp-54h]
  '00525F1F: push ecx
  '00525F20: mov edx, [ebp-58h]
  '00525F23: push edx
  '00525F24: call [004010A0h]
  '00525F2A: mov [ebp-7Ch], eax
  '00525F2D: jmp 525F36h
  '00525F2F: mov [ebp-7Ch], 00000000h
  '00525F36: mov [ebp-04h], 0000000Ch
  '00525F3D: mov [ebp-50h], 00000004h
  '00525F44: push 0042B30Ch
  '00525F49: mov ax, [ebp+0Ch]
  '00525F4D: push eax
  '00525F4E: call [0040100Ch]
  '00525F54: mov edx, eax
  '00525F56: lea ecx, [ebp-2Ch]
  '00525F59: call [00401378h]
  '00525F5F: push eax
  '00525F60: call [0040108Ch]
  '00525F66: mov edx, eax
  '00525F68: lea ecx, [ebp-30h]
  '00525F6B: call [00401378h]
  '00525F71: push eax
  '00525F72: push 0041E7B0h
  '00525F77: call [0040108Ch]
  '00525F7D: mov edx, eax
  '00525F7F: lea ecx, [ebp-34h]
  '00525F82: call [00401378h]
  '00525F88: push eax
  '00525F89: mov ecx, [ebp+10h]
  '00525F8C: mov edx, [ecx]
  '00525F8E: push edx
  '00525F8F: call [0040108Ch]
  '00525F95: mov edx, eax
  '00525F97: lea ecx, [ebp-38h]
  '00525F9A: call [00401378h]
  '00525FA0: lea eax, [ebp-50h]
  '00525FA3: push eax
  '00525FA4: lea ecx, [ebp-38h]
  '00525FA7: push ecx
  '00525FA8: lea edx, [ebp-4Ch]
  '00525FAB: push edx
  '00525FAC: call 00513060h
  '00525FB1: lea eax, [ebp-38h]
  '00525FB4: push eax
  '00525FB5: lea ecx, [ebp-34h]
  '00525FB8: push ecx
  '00525FB9: lea edx, [ebp-30h]
  '00525FBC: push edx
  '00525FBD: lea eax, [ebp-2Ch]
  '00525FC0: push eax
  '00525FC1: push 00000004h
  '00525FC3: call [004012E8h]
  '00525FC9: add esp, 00000014h
  '00525FCC: lea ecx, [ebp-4Ch]
  '00525FCF: call [00401030h]
  '00525FD5: mov [ebp-04h], 0000000Dh
  '00525FDC: call [00401104h]
  '00525FE2: mov [ebp-04h], 0000000Eh
  '00525FE9: cmp [0054238Ch], 00000000h
  '00525FF0: jnz 52600Bh
  '00525FF2: push 0054238Ch
  '00525FF7: push 0041D9E0h
  '00525FFC: call [004012B8h]
  '00526002: mov [ebp-80h], 0054238Ch
  '00526009: jmp 526012h
  '0052600B: mov [ebp-80h], 0054238Ch
  '00526012: mov ecx, [ebp-80h]
  '00526015: mov edx, [ecx]
  '00526017: mov [ebp-54h], edx
  '0052601A: mov eax, [ebp+08h]
  '0052601D: push eax
  '0052601E: lea ecx, [ebp-3Ch]
  '00526021: push ecx
  '00526022: call [004010F8h]
  '00526028: push eax
  '00526029: mov edx, [ebp-54h]
  '0052602C: mov eax, [edx]
  '0052602E: mov ecx, [ebp-54h]
  '00526031: push ecx
  '00526032: call [eax+10h]
  '00526035: fclex 
  '00526037: mov [ebp-58h], eax
  '0052603A: cmp [ebp-58h], 00000000h
  '0052603E: jnl 52605Dh
  '00526040: push 00000010h
  '00526042: push 0041D9D0h
  '00526047: mov edx, [ebp-54h]
  '0052604A: push edx
  '0052604B: mov eax, [ebp-58h]
  '0052604E: push eax
  '0052604F: call [004010A0h]
  '00526055: mov [ebp-00000084h], eax
  '0052605B: jmp 526067h
  '0052605D: mov [ebp-00000084h], 00000000h
  '00526067: lea ecx, [ebp-3Ch]
  '0052606A: call [004013B8h]
  '00526070: mov [ebp-04h], 00000010h
  '00526077: mov ecx, [ebp+08h]
  '0052607A: movsx edx, word ptr [ecx+36h]
  '0052607E: test edx, edx
  '00526080: jz 526097h
  '00526082: mov [ebp-04h], 00000011h
  '00526089: mov eax, [ebp+08h]
  '0052608C: mov cx, [eax+36h]
  '00526090: push ecx
  '00526091: call [00401168h]
  '00526097: mov [ebp-04h], 00000013h
  '0052609E: mov edx, [ebp+08h]
  '005260A1: mov word ptr [edx+4Ah], FFFFh
  '005260A7: mov [ebp-10h], 00000000h
  '005260AE: push 005260F6h
  '005260B3: jmp 5260E3h
  '005260B5: lea eax, [ebp-38h]
  '005260B8: push eax
  '005260B9: lea ecx, [ebp-34h]
  '005260BC: push ecx
  '005260BD: lea edx, [ebp-30h]
  '005260C0: push edx
  '005260C1: lea eax, [ebp-2Ch]
  '005260C4: push eax
  '005260C5: push 00000004h
  '005260C7: call [004012E8h]
  '005260CD: add esp, 00000014h
  '005260D0: lea ecx, [ebp-3Ch]
  '005260D3: call [004013B8h]
  '005260D9: lea ecx, [ebp-4Ch]
  '005260DC: call [00401030h]
  '005260E2: ret 
End Sub
Private Sub wskTransfer__526420
  '00526420: push ebp
  '00526421: mov ebp, esp
  '00526423: sub esp, 00000018h
  '00526426: push 004081B6h
  '0052642B: mov eax, fs:[00h]
  '00526431: push eax
  '00526432: mov fs:[00000000h], esp
  '00526439: mov eax, 00000190h
  '0052643E: call 004081B0h
  '00526443: push ebx
  '00526444: push esi
  '00526445: push edi
  '00526446: mov [ebp-18h], esp
  '00526449: mov [ebp-14h], 00407208h
  '00526450: mov eax, [ebp+08h]
  '00526453: and eax, 00000001h
  '00526456: mov [ebp-10h], eax
  '00526459: mov ecx, [ebp+08h]
  '0052645C: and ecx, FFFFFFFEh
  '0052645F: mov [ebp+08h], ecx
  '00526462: mov [ebp-0Ch], 00000000h
  '00526469: mov edx, [ebp+08h]
  '0052646C: mov eax, [edx]
  '0052646E: mov ecx, [ebp+08h]
  '00526471: push ecx
  '00526472: call [eax+04h]
  '00526475: mov [ebp-04h], 00000001h
  '0052647C: mov [ebp-04h], 00000002h
  '00526483: push FFFFFFFFh
  '00526485: call [004010E8h]
  '0052648B: mov [ebp-04h], 00000003h
  '00526492: lea edx, [ebp-2Ch]
  '00526495: mov [ebp-000000F0h], edx
  '0052649B: mov [ebp-000000F8h], 00004008h
  '005264A5: mov [ebp-00000100h], 00000008h
  '005264AF: mov [ebp-00000108h], 00000003h
  '005264B9: mov eax, [ebp+0Ch]
  '005264BC: mov [ebp-00000120h], eax
  '005264C2: mov [ebp-00000128h], 00000003h
  '005264CC: mov eax, 00000010h
  '005264D1: call 004081B0h
  '005264D6: mov ecx, esp
  '005264D8: mov edx, [ebp-000000F8h]
  '005264DE: mov [ecx], edx
  '005264E0: mov eax, [ebp-000000F4h]
  '005264E6: mov [ecx+04h], eax
  '005264E9: mov edx, [ebp-000000F0h]
  '005264EF: mov [ecx+08h], edx
  '005264F2: mov eax, [ebp-000000ECh]
  '005264F8: mov [ecx+0Ch], eax
  '005264FB: mov eax, 00000010h
  '00526500: call 004081B0h
  '00526505: mov ecx, esp
  '00526507: mov edx, [ebp-00000108h]
  '0052650D: mov [ecx], edx
  '0052650F: mov eax, [ebp-00000104h]
  '00526515: mov [ecx+04h], eax
  '00526518: mov edx, [ebp-00000100h]
  '0052651E: mov [ecx+08h], edx
  '00526521: mov eax, [ebp-000000FCh]
  '00526527: mov [ecx+0Ch], eax
  '0052652A: mov eax, 00000010h
  '0052652F: call 004081B0h
  '00526534: mov ecx, esp
  '00526536: mov edx, [ebp-00000128h]
  '0052653C: mov [ecx], edx
  '0052653E: mov eax, [ebp-00000124h]
  '00526544: mov [ecx+04h], eax
  '00526547: mov edx, [ebp-00000120h]
  '0052654D: mov [ecx+08h], edx
  '00526550: mov eax, [ebp-0000011Ch]
  '00526556: mov [ecx+0Ch], eax
  '00526559: push 00000003h
  '0052655B: push 00000044h
  '0052655D: mov ecx, [ebp+08h]
  '00526560: mov edx, [ecx]
  '00526562: mov eax, [ebp+08h]
  '00526565: push eax
  '00526566: call [edx+00000314h]
  '0052656C: push eax
  '0052656D: lea ecx, [ebp-50h]
  '00526570: push ecx
  '00526571: call [004010E4h]
  '00526577: push eax
  '00526578: call [00401040h]
  '0052657E: add esp, 0000003Ch
  '00526581: lea ecx, [ebp-50h]
  '00526584: call [004013B8h]
  '0052658A: mov [ebp-04h], 00000004h
  '00526591: mov edx, [ebp-2Ch]
  '00526594: push edx
  '00526595: push 0041BC60h
  '0052659A: call [00401184h]
  '005265A0: test eax, eax
  '005265A2: jnz 5265A9h
  '005265A4: jmp 0052785Fh
  '005265A9: mov [ebp-04h], 00000007h
  '005265B0: mov eax, [ebp+08h]
  '005265B3: mov ecx, [eax+58h]
  '005265B6: push ecx
  '005265B7: mov edx, [ebp-2Ch]
  '005265BA: push edx
  '005265BB: call [0040108Ch]
  '005265C1: mov edx, eax
  '005265C3: lea ecx, [ebp-40h]
  '005265C6: call [00401378h]
  '005265CC: mov edx, eax
  '005265CE: mov ecx, [ebp+08h]
  '005265D1: add ecx, 00000058h
  '005265D4: call [004012D8h]
  '005265DA: lea ecx, [ebp-40h]
  '005265DD: call [004013B4h]
  '005265E3: mov [ebp-04h], 00000008h
  '005265EA: mov eax, [ebp+08h]
  '005265ED: add eax, 00000058h
  '005265F0: mov [ebp-000000F0h], eax
  '005265F6: mov [ebp-000000F8h], 00004008h
  '00526600: push 00000009h
  '00526602: lea ecx, [ebp-000000F8h]
  '00526608: push ecx
  '00526609: lea edx, [ebp-68h]
  '0052660C: push edx
  '0052660D: call [00401390h]
  '00526613: mov [ebp-00000100h], 0042B330h
  '0052661D: mov [ebp-00000108h], 00008008h
  '00526627: lea eax, [ebp-68h]
  '0052662A: push eax
  '0052662B: lea ecx, [ebp-00000108h]
  '00526631: push ecx
  '00526632: call [00401198h]
  '00526638: mov [ebp-00000144h], ax
  '0052663F: lea ecx, [ebp-68h]
  '00526642: call [00401030h]
  '00526648: movsx edx, word ptr [ebp-00000144h]
  '0052664F: test edx, edx
  '00526651: jz 005272C5h
  '00526657: mov [ebp-04h], 00000009h
  '0052665E: mov eax, [ebp+08h]
  '00526661: add eax, 00000058h
  '00526664: mov [ebp-000000F0h], eax
  '0052666A: mov [ebp-000000F8h], 00004008h
  '00526674: mov ecx, [ebp+08h]
  '00526677: mov edx, [ecx+58h]
  '0052667A: push edx
  '0052667B: call [00401044h]
  '00526681: sub eax, 00000009h
  '00526684: jo 00527916h
  '0052668A: push eax
  '0052668B: lea eax, [ebp-000000F8h]
  '00526691: push eax
  '00526692: lea ecx, [ebp-68h]
  '00526695: push ecx
  '00526696: call [0040136Ch]
  '0052669C: lea edx, [ebp-68h]
  '0052669F: push edx
  '005266A0: call [0040103Ch]
  '005266A6: mov edx, eax
  '005266A8: lea ecx, [ebp-40h]
  '005266AB: call [00401378h]
  '005266B1: mov edx, eax
  '005266B3: mov ecx, [ebp+08h]
  '005266B6: add ecx, 00000058h
  '005266B9: call [004012D8h]
  '005266BF: lea ecx, [ebp-40h]
  '005266C2: call [004013B4h]
  '005266C8: lea ecx, [ebp-68h]
  '005266CB: call [00401030h]
  '005266D1: mov [ebp-04h], 0000000Ah
  '005266D8: push 00000000h
  '005266DA: push 00000001h
  '005266DC: mov eax, [ebp+08h]
  '005266DF: mov ecx, [eax]
  '005266E1: mov edx, [ebp+08h]
  '005266E4: push edx
  '005266E5: call [ecx+00000318h]
  '005266EB: push eax
  '005266EC: lea eax, [ebp-50h]
  '005266EF: push eax
  '005266F0: call [004010E4h]
  '005266F6: push eax
  '005266F7: lea ecx, [ebp-68h]
  '005266FA: push ecx
  '005266FB: call [004011E4h]
  '00526701: add esp, 00000010h
  '00526704: push eax
  '00526705: call [004011DCh]
  '0052670B: fstp real4 ptr [ebp-000000F0h]
  '00526711: mov [ebp-000000F8h], 00000004h
  '0052671B: mov eax, 00000010h
  '00526720: call 004081B0h
  '00526725: mov edx, esp
  '00526727: mov eax, [ebp-000000F8h]
  '0052672D: mov [edx], eax
  '0052672F: mov ecx, [ebp-000000F4h]
  '00526735: mov [edx+04h], ecx
  '00526738: mov eax, [ebp-000000F0h]
  '0052673E: mov [edx+08h], eax
  '00526741: mov ecx, [ebp-000000ECh]
  '00526747: mov [edx+0Ch], ecx
  '0052674A: push 00000005h
  '0052674C: mov edx, [ebp+08h]
  '0052674F: mov eax, [edx]
  '00526751: mov ecx, [ebp+08h]
  '00526754: push ecx
  '00526755: call [eax+00000318h]
  '0052675B: push eax
  '0052675C: lea edx, [ebp-54h]
  '0052675F: push edx
  '00526760: call [004010E4h]
  '00526766: push eax
  '00526767: call [0040139Ch]
  '0052676D: lea eax, [ebp-54h]
  '00526770: push eax
  '00526771: lea ecx, [ebp-50h]
  '00526774: push ecx
  '00526775: push 00000002h
  '00526777: call [00401064h]
  '0052677D: add esp, 0000000Ch
  '00526780: lea ecx, [ebp-68h]
  '00526783: call [00401030h]
  '00526789: mov [ebp-04h], 0000000Bh
  '00526790: mov edx, [ebp+08h]
  '00526793: mov eax, [edx+44h]
  '00526796: push eax
  '00526797: push 00000001h
  '00526799: push FFFFFFFFh
  '0052679B: push 00004020h
  '005267A0: call [004012A0h]
  '005267A6: mov [ebp-04h], 0000000Ch
  '005267AD: push 00000001h
  '005267AF: push 00000001h
  '005267B1: call [004012A4h]
  '005267B7: add eax, 00000001h
  '005267BA: jo 00527916h
  '005267C0: push eax
  '005267C1: mov ecx, [ebp+08h]
  '005267C4: add ecx, 00000058h
  '005267C7: push ecx
  '005267C8: push 00000000h
  '005267CA: call [00401058h]
  '005267D0: mov [ebp-04h], 0000000Dh
  '005267D7: push 00000001h
  '005267D9: call [00401168h]
  '005267DF: mov [ebp-04h], 0000000Eh
  '005267E6: call [00401104h]
  '005267EC: mov [ebp-04h], 0000000Fh
  '005267F3: xor edx, edx
  '005267F5: mov ecx, [ebp+08h]
  '005267F8: add ecx, 00000058h
  '005267FB: call [004012D8h]
  '00526801: mov [ebp-04h], 00000010h
  '00526808: push 0041EFA8h
  '0052680D: push 00000000h
  '0052680F: push 00000007h
  '00526811: mov edx, [ebp+08h]
  '00526814: mov eax, [edx]
  '00526816: mov ecx, [ebp+08h]
  '00526819: push ecx
  '0052681A: call [eax+0000030Ch]
  '00526820: push eax
  '00526821: lea edx, [ebp-50h]
  '00526824: push edx
  '00526825: call [004010E4h]
  '0052682B: push eax
  '0052682C: lea eax, [ebp-68h]
  '0052682F: push eax
  '00526830: call [004011E4h]
  '00526836: add esp, 00000010h
  '00526839: push eax
  '0052683A: call [004011C8h]
  '00526840: push eax
  '00526841: lea ecx, [ebp-54h]
  '00526844: push ecx
  '00526845: call [004010E4h]
  '0052684B: mov [ebp-00000144h], eax
  '00526851: lea edx, [ebp-00000140h]
  '00526857: push edx
  '00526858: mov eax, [ebp-00000144h]
  '0052685E: mov ecx, [eax]
  '00526860: mov edx, [ebp-00000144h]
  '00526866: push edx
  '00526867: call [ecx+1Ch]
  '0052686A: fclex 
  '0052686C: mov [ebp-00000148h], eax
  '00526872: cmp [ebp-00000148h], 00000000h
  '00526879: jnl 52689Eh
  '0052687B: push 0000001Ch
  '0052687D: push 0041EFA8h
  '00526882: mov eax, [ebp-00000144h]
  '00526888: push eax
  '00526889: mov ecx, [ebp-00000148h]
  '0052688F: push ecx
  '00526890: call [004010A0h]
  '00526896: mov [ebp-00000170h], eax
  '0052689C: jmp 5268A8h
  '0052689E: mov [ebp-00000170h], 00000000h
  '005268A8: xor edx, edx
  '005268AA: cmp [ebp-00000140h], 00000001h
  '005268B1: setnl dl
  '005268B4: neg edx
  '005268B6: mov [ebp-0000014Ch], dx
  '005268BD: lea eax, [ebp-54h]
  '005268C0: push eax
  '005268C1: lea ecx, [ebp-50h]
  '005268C4: push ecx
  '005268C5: push 00000002h
  '005268C7: call [00401064h]
  '005268CD: add esp, 0000000Ch
  '005268D0: lea ecx, [ebp-68h]
  '005268D3: call [00401030h]
  '005268D9: movsx edx, word ptr [ebp-0000014Ch]
  '005268E0: test edx, edx
  '005268E2: jz 005269C0h
  '005268E8: mov [ebp-04h], 00000011h
  '005268EF: push 0041EFA8h
  '005268F4: push 00000000h
  '005268F6: push 00000007h
  '005268F8: mov eax, [ebp+08h]
  '005268FB: mov ecx, [eax]
  '005268FD: mov edx, [ebp+08h]
  '00526900: push edx
  '00526901: call [ecx+0000030Ch]
  '00526907: push eax
  '00526908: lea eax, [ebp-50h]
  '0052690B: push eax
  '0052690C: call [004010E4h]
  '00526912: push eax
  '00526913: lea ecx, [ebp-68h]
  '00526916: push ecx
  '00526917: call [004011E4h]
  '0052691D: add esp, 00000010h
  '00526920: push eax
  '00526921: call [004011C8h]
  '00526927: push eax
  '00526928: lea edx, [ebp-54h]
  '0052692B: push edx
  '0052692C: call [004010E4h]
  '00526932: mov [ebp-00000144h], eax
  '00526938: mov [ebp-70h], 00000001h
  '0052693F: mov [ebp-78h], 00000002h
  '00526946: lea eax, [ebp-78h]
  '00526949: push eax
  '0052694A: mov ecx, [ebp-00000144h]
  '00526950: mov edx, [ecx]
  '00526952: mov eax, [ebp-00000144h]
  '00526958: push eax
  '00526959: call [edx+34h]
  '0052695C: fclex 
  '0052695E: mov [ebp-00000148h], eax
  '00526964: cmp [ebp-00000148h], 00000000h
  '0052696B: jnl 526990h
  '0052696D: push 00000034h
  '0052696F: push 0041EFA8h
  '00526974: mov ecx, [ebp-00000144h]
  '0052697A: push ecx
  '0052697B: mov edx, [ebp-00000148h]
  '00526981: push edx
  '00526982: call [004010A0h]
  '00526988: mov [ebp-00000174h], eax
  '0052698E: jmp 52699Ah
  '00526990: mov [ebp-00000174h], 00000000h
  '0052699A: lea eax, [ebp-54h]
  '0052699D: push eax
  '0052699E: lea ecx, [ebp-50h]
  '005269A1: push ecx
  '005269A2: push 00000002h
  '005269A4: call [00401064h]
  '005269AA: add esp, 0000000Ch
  '005269AD: lea edx, [ebp-78h]
  '005269B0: push edx
  '005269B1: lea eax, [ebp-68h]
  '005269B4: push eax
  '005269B5: push 00000002h
  '005269B7: call [00401050h]
  '005269BD: add esp, 0000000Ch
  '005269C0: mov [ebp-04h], 00000013h
  '005269C7: mov [ebp-000000F0h], 00000000h
  '005269D1: mov [ebp-000000F8h], 00000004h
  '005269DB: mov eax, 00000010h
  '005269E0: call 004081B0h
  '005269E5: mov ecx, esp
  '005269E7: mov edx, [ebp-000000F8h]
  '005269ED: mov [ecx], edx
  '005269EF: mov eax, [ebp-000000F4h]
  '005269F5: mov [ecx+04h], eax
  '005269F8: mov edx, [ebp-000000F0h]
  '005269FE: mov [ecx+08h], edx
  '00526A01: mov eax, [ebp-000000ECh]
  '00526A07: mov [ecx+0Ch], eax
  '00526A0A: push 00000005h
  '00526A0C: mov ecx, [ebp+08h]
  '00526A0F: mov edx, [ecx]
  '00526A11: mov eax, [ebp+08h]
  '00526A14: push eax
  '00526A15: call [edx+00000318h]
  '00526A1B: push eax
  '00526A1C: lea ecx, [ebp-50h]
  '00526A1F: push ecx
  '00526A20: call [004010E4h]
  '00526A26: push eax
  '00526A27: call [0040139Ch]
  '00526A2D: lea ecx, [ebp-50h]
  '00526A30: call [004013B8h]
  '00526A36: mov [ebp-04h], 00000014h
  '00526A3D: mov [ebp-000000F0h], 00000000h
  '00526A47: mov [ebp-000000F8h], 0000000Bh
  '00526A51: mov eax, 00000010h
  '00526A56: call 004081B0h
  '00526A5B: mov edx, esp
  '00526A5D: mov eax, [ebp-000000F8h]
  '00526A63: mov [edx], eax
  '00526A65: mov ecx, [ebp-000000F4h]
  '00526A6B: mov [edx+04h], ecx
  '00526A6E: mov eax, [ebp-000000F0h]
  '00526A74: mov [edx+08h], eax
  '00526A77: mov ecx, [ebp-000000ECh]
  '00526A7D: mov [edx+0Ch], ecx
  '00526A80: push 80010007h
  '00526A85: mov edx, [ebp+08h]
  '00526A88: mov eax, [edx]
  '00526A8A: mov ecx, [ebp+08h]
  '00526A8D: push ecx
  '00526A8E: call [eax+00000318h]
  '00526A94: push eax
  '00526A95: lea edx, [ebp-50h]
  '00526A98: push edx
  '00526A99: call [004010E4h]
  '00526A9F: push eax
  '00526AA0: call [0040139Ch]
  '00526AA6: lea ecx, [ebp-50h]
  '00526AA9: call [004013B8h]
  '00526AAF: mov [ebp-04h], 00000015h
  '00526AB6: call [00401104h]
  '00526ABC: mov [ebp-04h], 00000016h
  '00526AC3: call [00401300h]
  '00526AC9: push eax
  '00526ACA: lea eax, [ebp-50h]
  '00526ACD: push eax
  '00526ACE: call [004010E4h]
  '00526AD4: mov [ebp-00000144h], eax
  '00526ADA: lea ecx, [ebp-00000140h]
  '00526AE0: push ecx
  '00526AE1: mov edx, [ebp-00000144h]
  '00526AE7: mov eax, [edx]
  '00526AE9: mov ecx, [ebp-00000144h]
  '00526AEF: push ecx
  '00526AF0: call [eax+1Ch]
  '00526AF3: fclex 
  '00526AF5: mov [ebp-00000148h], eax
  '00526AFB: cmp [ebp-00000148h], 00000000h
  '00526B02: jnl 526B27h
  '00526B04: push 0000001Ch
  '00526B06: push 0041E948h
  '00526B0B: mov edx, [ebp-00000144h]
  '00526B11: push edx
  '00526B12: mov eax, [ebp-00000148h]
  '00526B18: push eax
  '00526B19: call [004010A0h]
  '00526B1F: mov [ebp-00000178h], eax
  '00526B25: jmp 526B31h
  '00526B27: mov [ebp-00000178h], 00000000h
  '00526B31: xor ecx, ecx
  '00526B33: cmp [ebp-00000140h], 00000000h
  '00526B3A: setnz cl
  '00526B3D: neg ecx
  '00526B3F: mov [ebp-0000014Ch], cx
  '00526B46: lea ecx, [ebp-50h]
  '00526B49: call [004013B8h]
  '00526B4F: movsx edx, word ptr [ebp-0000014Ch]
  '00526B56: test edx, edx
  '00526B58: jz 526B90h
  '00526B5A: mov [ebp-04h], 00000017h
  '00526B61: mov edx, 0042B348h
  '00526B66: lea ecx, [ebp-40h]
  '00526B69: call [004012D8h]
  '00526B6F: lea eax, [ebp-40h]
  '00526B72: push eax
  '00526B73: mov ecx, [ebp+08h]
  '00526B76: mov edx, [ecx]
  '00526B78: mov eax, [ebp+08h]
  '00526B7B: push eax
  '00526B7C: call [edx+00000738h]
  '00526B82: lea ecx, [ebp-40h]
  '00526B85: call [004013B4h]
  '00526B8B: jmp 00526D41h
  '00526B90: mov [ebp-04h], 00000019h
  '00526B97: mov edx, 0042B014h
  '00526B9C: lea ecx, [ebp-40h]
  '00526B9F: call [004012D8h]
  '00526BA5: lea ecx, [ebp-40h]
  '00526BA8: push ecx
  '00526BA9: mov edx, [ebp+08h]
  '00526BAC: mov eax, [edx]
  '00526BAE: mov ecx, [ebp+08h]
  '00526BB1: push ecx
  '00526BB2: call [eax+00000738h]
  '00526BB8: lea ecx, [ebp-40h]
  '00526BBB: call [004013B4h]
  '00526BC1: mov [ebp-04h], 0000001Ah
  '00526BC8: cmp [00541024h], 00000000h
  '00526BCF: jnz 526BEDh
  '00526BD1: push 00541024h
  '00526BD6: push 00413334h
  '00526BDB: call [004012B8h]
  '00526BE1: mov [ebp-0000017Ch], 00541024h
  '00526BEB: jmp 526BF7h
  '00526BED: mov [ebp-0000017Ch], 00541024h
  '00526BF7: mov edx, [ebp-0000017Ch]
  '00526BFD: mov eax, [edx]
  '00526BFF: mov ecx, [ebp-0000017Ch]
  '00526C05: mov edx, [ecx]
  '00526C07: mov ecx, [edx]
  '00526C09: push eax
  '00526C0A: call [ecx+00000310h]
  '00526C10: push eax
  '00526C11: lea edx, [ebp-54h]
  '00526C14: push edx
  '00526C15: call [004010E4h]
  '00526C1B: mov [ebp-00000144h], eax
  '00526C21: push 00423810h
  '00526C26: push 00000000h
  '00526C28: push 00000004h
  '00526C2A: mov eax, [ebp+08h]
  '00526C2D: mov ecx, [eax]
  '00526C2F: mov edx, [ebp+08h]
  '00526C32: push edx
  '00526C33: call [ecx+00000314h]
  '00526C39: push eax
  '00526C3A: lea eax, [ebp-50h]
  '00526C3D: push eax
  '00526C3E: call [004010E4h]
  '00526C44: push eax
  '00526C45: lea ecx, [ebp-68h]
  '00526C48: push ecx
  '00526C49: call [004011E4h]
  '00526C4F: add esp, 00000010h
  '00526C52: push eax
  '00526C53: call [0040103Ch]
  '00526C59: mov edx, eax
  '00526C5B: lea ecx, [ebp-40h]
  '00526C5E: call [00401378h]
  '00526C64: push eax
  '00526C65: call [0040108Ch]
  '00526C6B: mov edx, eax
  '00526C6D: lea ecx, [ebp-44h]
  '00526C70: call [00401378h]
  '00526C76: push eax
  '00526C77: push 0042B37Ch
  '00526C7C: call [0040108Ch]
  '00526C82: mov edx, eax
  '00526C84: lea ecx, [ebp-48h]
  '00526C87: call [00401378h]
  '00526C8D: push eax
  '00526C8E: mov edx, [ebp+08h]
  '00526C91: mov eax, [edx+44h]
  '00526C94: push eax
  '00526C95: call [0040108Ch]
  '00526C9B: mov edx, eax
  '00526C9D: lea ecx, [ebp-4Ch]
  '00526CA0: call [00401378h]
  '00526CA6: push eax
  '00526CA7: mov ecx, [ebp-00000144h]
  '00526CAD: mov edx, [ecx]
  '00526CAF: mov eax, [ebp-00000144h]
  '00526CB5: push eax
  '00526CB6: call [edx+000000A4h]
  '00526CBC: fclex 
  '00526CBE: mov [ebp-00000148h], eax
  '00526CC4: cmp [ebp-00000148h], 00000000h
  '00526CCB: jnl 526CF3h
  '00526CCD: push 000000A4h
  '00526CD2: push 0041E3FCh
  '00526CD7: mov ecx, [ebp-00000144h]
  '00526CDD: push ecx
  '00526CDE: mov edx, [ebp-00000148h]
  '00526CE4: push edx
  '00526CE5: call [004010A0h]
  '00526CEB: mov [ebp-00000180h], eax
  '00526CF1: jmp 526CFDh
  '00526CF3: mov [ebp-00000180h], 00000000h
  '00526CFD: lea eax, [ebp-4Ch]
  '00526D00: push eax
  '00526D01: lea ecx, [ebp-48h]
  '00526D04: push ecx
  '00526D05: lea edx, [ebp-44h]
  '00526D08: push edx
  '00526D09: lea eax, [ebp-40h]
  '00526D0C: push eax
  '00526D0D: push 00000004h
  '00526D0F: call [004012E8h]
  '00526D15: add esp, 00000014h
  '00526D18: lea ecx, [ebp-54h]
  '00526D1B: push ecx
  '00526D1C: lea edx, [ebp-50h]
  '00526D1F: push edx
  '00526D20: push 00000002h
  '00526D22: call [00401064h]
  '00526D28: add esp, 0000000Ch
  '00526D2B: lea ecx, [ebp-68h]
  '00526D2E: call [00401030h]
  '00526D34: mov [ebp-04h], 0000001Bh
  '00526D3B: call [00401104h]
  '00526D41: mov [ebp-04h], 0000001Dh
  '00526D48: cmp [0054106Ch], 00000000h
  '00526D4F: jnz 526D6Dh
  '00526D51: push 0054106Ch
  '00526D56: push 00411238h
  '00526D5B: call [004012B8h]
  '00526D61: mov [ebp-00000184h], 0054106Ch
  '00526D6B: jmp 526D77h
  '00526D6D: mov [ebp-00000184h], 0054106Ch
  '00526D77: mov eax, [ebp-00000184h]
  '00526D7D: mov ecx, [eax]
  '00526D7F: mov edx, [ebp-00000184h]
  '00526D85: mov eax, [edx]
  '00526D87: mov edx, [eax]
  '00526D89: push ecx
  '00526D8A: call [edx+00000374h]
  '00526D90: push eax
  '00526D91: lea eax, [ebp-50h]
  '00526D94: push eax
  '00526D95: call [004010E4h]
  '00526D9B: mov [ebp-00000144h], eax
  '00526DA1: lea ecx, [ebp-0000013Ch]
  '00526DA7: push ecx
  '00526DA8: mov edx, [ebp-00000144h]
  '00526DAE: mov eax, [edx]
  '00526DB0: mov ecx, [ebp-00000144h]
  '00526DB6: push ecx
  '00526DB7: call [eax+000000E0h]
  '00526DBD: fclex 
  '00526DBF: mov [ebp-00000148h], eax
  '00526DC5: cmp [ebp-00000148h], 00000000h
  '00526DCC: jnl 526DF4h
  '00526DCE: push 000000E0h
  '00526DD3: push 0041E108h
  '00526DD8: mov edx, [ebp-00000144h]
  '00526DDE: push edx
  '00526DDF: mov eax, [ebp-00000148h]
  '00526DE5: push eax
  '00526DE6: call [004010A0h]
  '00526DEC: mov [ebp-00000188h], eax
  '00526DF2: jmp 526DFEh
  '00526DF4: mov [ebp-00000188h], 00000000h
  '00526DFE: cmp [0054106Ch], 00000000h
  '00526E05: jnz 526E23h
  '00526E07: push 0054106Ch
  '00526E0C: push 00411238h
  '00526E11: call [004012B8h]
  '00526E17: mov [ebp-0000018Ch], 0054106Ch
  '00526E21: jmp 526E2Dh
  '00526E23: mov [ebp-0000018Ch], 0054106Ch
  '00526E2D: mov ecx, [ebp-0000018Ch]
  '00526E33: mov edx, [ecx]
  '00526E35: mov eax, [ebp-0000018Ch]
  '00526E3B: mov ecx, [eax]
  '00526E3D: mov eax, [ecx]
  '00526E3F: push edx
  '00526E40: call [eax+00000378h]
  '00526E46: push eax
  '00526E47: lea ecx, [ebp-54h]
  '00526E4A: push ecx
  '00526E4B: call [004010E4h]
  '00526E51: mov [ebp-0000014Ch], eax
  '00526E57: lea edx, [ebp-40h]
  '00526E5A: push edx
  '00526E5B: mov eax, [ebp-0000014Ch]
  '00526E61: mov ecx, [eax]
  '00526E63: mov edx, [ebp-0000014Ch]
  '00526E69: push edx
  '00526E6A: call [ecx+000000A0h]
  '00526E70: fclex 
  '00526E72: mov [ebp-00000150h], eax
  '00526E78: cmp [ebp-00000150h], 00000000h
  '00526E7F: jnl 526EA7h
  '00526E81: push 000000A0h
  '00526E86: push 0041E3FCh
  '00526E8B: mov eax, [ebp-0000014Ch]
  '00526E91: push eax
  '00526E92: mov ecx, [ebp-00000150h]
  '00526E98: push ecx
  '00526E99: call [004010A0h]
  '00526E9F: mov [ebp-00000190h], eax
  '00526EA5: jmp 526EB1h
  '00526EA7: mov [ebp-00000190h], 00000000h
  '00526EB1: xor ebx, ebx
  '00526EB3: cmp word ptr [ebp-0000013Ch], 0001h
  '00526EBB: setz bl
  '00526EBE: neg ebx
  '00526EC0: push 00000001h
  '00526EC2: mov edx, [ebp-40h]
  '00526EC5: push edx
  '00526EC6: call [00401170h]
  '00526ECC: mov edx, eax
  '00526ECE: lea ecx, [ebp-4Ch]
  '00526ED1: call [00401378h]
  '00526ED7: push eax
  '00526ED8: push 00000003h
  '00526EDA: mov eax, [ebp+08h]
  '00526EDD: mov ecx, [eax+3Ch]
  '00526EE0: push ecx
  '00526EE1: call [00401380h]
  '00526EE7: mov edx, eax
  '00526EE9: lea ecx, [ebp-44h]
  '00526EEC: call [00401378h]
  '00526EF2: push eax
  '00526EF3: call [00401170h]
  '00526EF9: mov edx, eax
  '00526EFB: lea ecx, [ebp-48h]
  '00526EFE: call [00401378h]
  '00526F04: push eax
  '00526F05: push 00000000h
  '00526F07: call [004012ACh]
  '00526F0D: neg eax
  '00526F0F: sbb eax, eax
  '00526F11: neg eax
  '00526F13: neg eax
  '00526F15: and bx, ax
  '00526F18: mov [ebp-00000154h], bx
  '00526F1F: lea edx, [ebp-4Ch]
  '00526F22: push edx
  '00526F23: lea eax, [ebp-48h]
  '00526F26: push eax
  '00526F27: lea ecx, [ebp-44h]
  '00526F2A: push ecx
  '00526F2B: lea edx, [ebp-40h]
  '00526F2E: push edx
  '00526F2F: push 00000004h
  '00526F31: call [004012E8h]
  '00526F37: add esp, 00000014h
  '00526F3A: lea eax, [ebp-54h]
  '00526F3D: push eax
  '00526F3E: lea ecx, [ebp-50h]
  '00526F41: push ecx
  '00526F42: push 00000002h
  '00526F44: call [00401064h]
  '00526F4A: add esp, 0000000Ch
  '00526F4D: movsx edx, word ptr [ebp-00000154h]
  '00526F54: test edx, edx
  '00526F56: jz 00526FE0h
  '00526F5C: mov [ebp-04h], 0000001Eh
  '00526F63: push 00000001h
  '00526F65: push 0041BC60h
  '00526F6A: lea eax, [ebp-4Ch]
  '00526F6D: push eax
  '00526F6E: call [00401330h]
  '00526F74: push eax
  '00526F75: push 0041BC60h
  '00526F7A: lea ecx, [ebp-48h]
  '00526F7D: push ecx
  '00526F7E: call [00401330h]
  '00526F84: push eax
  '00526F85: mov edx, [ebp+08h]
  '00526F88: mov eax, [edx+44h]
  '00526F8B: push eax
  '00526F8C: lea ecx, [ebp-44h]
  '00526F8F: push ecx
  '00526F90: call [00401330h]
  '00526F96: push eax
  '00526F97: push 0041FD78h
  '00526F9C: lea edx, [ebp-40h]
  '00526F9F: push edx
  '00526FA0: call [00401330h]
  '00526FA6: push eax
  '00526FA7: push 00000000h
  '00526FA9: call 0041DC2Ch
  '00526FAE: call [0040109Ch]
  '00526FB4: mov eax, [ebp-44h]
  '00526FB7: push eax
  '00526FB8: mov ecx, [ebp+08h]
  '00526FBB: add ecx, 00000044h
  '00526FBE: push ecx
  '00526FBF: call [00401238h]
  '00526FC5: lea edx, [ebp-4Ch]
  '00526FC8: push edx
  '00526FC9: lea eax, [ebp-48h]
  '00526FCC: push eax
  '00526FCD: lea ecx, [ebp-44h]
  '00526FD0: push ecx
  '00526FD1: lea edx, [ebp-40h]
  '00526FD4: push edx
  '00526FD5: push 00000004h
  '00526FD7: call [004012E8h]
  '00526FDD: add esp, 00000014h
  '00526FE0: mov [ebp-04h], 00000020h
  '00526FE7: cmp [0054106Ch], 00000000h
  '00526FEE: jnz 52700Ch
  '00526FF0: push 0054106Ch
  '00526FF5: push 00411238h
  '00526FFA: call [004012B8h]
  '00527000: mov [ebp-00000194h], 0054106Ch
  '0052700A: jmp 527016h
  '0052700C: mov [ebp-00000194h], 0054106Ch
  '00527016: mov eax, [ebp-00000194h]
  '0052701C: mov ecx, [eax]
  '0052701E: mov edx, [ebp-00000194h]
  '00527024: mov eax, [edx]
  '00527026: mov edx, [eax]
  '00527028: push ecx
  '00527029: call [edx+00000324h]
  '0052702F: push eax
  '00527030: lea eax, [ebp-50h]
  '00527033: push eax
  '00527034: call [004010E4h]
  '0052703A: mov [ebp-00000144h], eax
  '00527040: lea ecx, [ebp-0000013Ch]
  '00527046: push ecx
  '00527047: mov edx, [ebp-00000144h]
  '0052704D: mov eax, [edx]
  '0052704F: mov ecx, [ebp-00000144h]
  '00527055: push ecx
  '00527056: call [eax+000000E0h]
  '0052705C: fclex 
  '0052705E: mov [ebp-00000148h], eax
  '00527064: cmp [ebp-00000148h], 00000000h
  '0052706B: jnl 527093h
  '0052706D: push 000000E0h
  '00527072: push 0041E108h
  '00527077: mov edx, [ebp-00000144h]
  '0052707D: push edx
  '0052707E: mov eax, [ebp-00000148h]
  '00527084: push eax
  '00527085: call [004010A0h]
  '0052708B: mov [ebp-00000198h], eax
  '00527091: jmp 52709Dh
  '00527093: mov [ebp-00000198h], 00000000h
  '0052709D: xor ecx, ecx
  '0052709F: cmp word ptr [ebp-0000013Ch], 0001h
  '005270A7: setz cl
  '005270AA: neg ecx
  '005270AC: mov [ebp-0000014Ch], cx
  '005270B3: lea ecx, [ebp-50h]
  '005270B6: call [004013B8h]
  '005270BC: movsx edx, word ptr [ebp-0000014Ch]
  '005270C3: test edx, edx
  '005270C5: jz 00527265h
  '005270CB: mov [ebp-04h], 00000021h
  '005270D2: mov edx, 0042A084h
  '005270D7: lea ecx, [ebp-40h]
  '005270DA: call [004012D8h]
  '005270E0: lea eax, [ebp-40h]
  '005270E3: push eax
  '005270E4: call 00517E20h
  '005270E9: mov edx, eax
  '005270EB: lea ecx, [ebp-44h]
  '005270EE: call [00401378h]
  '005270F4: push eax
  '005270F5: call [004013BCh]
  '005270FB: call [0040135Ch]
  '00527101: mov [ebp-28h], eax
  '00527104: lea ecx, [ebp-44h]
  '00527107: push ecx
  '00527108: lea edx, [ebp-40h]
  '0052710B: push edx
  '0052710C: push 00000002h
  '0052710E: call [004012E8h]
  '00527114: add esp, 0000000Ch
  '00527117: mov [ebp-04h], 00000022h
  '0052711E: mov eax, [ebp+08h]
  '00527121: mov ecx, [eax+44h]
  '00527124: push ecx
  '00527125: call [004012FCh]
  '0052712B: mov edx, [ebp-28h]
  '0052712E: add edx, eax
  '00527130: jo 00527916h
  '00527136: mov [ebp-28h], edx
  '00527139: mov [ebp-04h], 00000023h
  '00527140: lea eax, [ebp-28h]
  '00527143: mov [ebp-000000F0h], eax
  '00527149: mov [ebp-000000F8h], 00004003h
  '00527153: lea ecx, [ebp-000000F8h]
  '00527159: push ecx
  '0052715A: lea edx, [ebp-68h]
  '0052715D: push edx
  '0052715E: call [00401344h]
  '00527164: lea eax, [ebp-68h]
  '00527167: push eax
  '00527168: call [0040103Ch]
  '0052716E: mov edx, eax
  '00527170: lea ecx, [ebp-44h]
  '00527173: call [00401378h]
  '00527179: mov edx, 0042A084h
  '0052717E: lea ecx, [ebp-40h]
  '00527181: call [004012D8h]
  '00527187: lea ecx, [ebp-44h]
  '0052718A: push ecx
  '0052718B: lea edx, [ebp-40h]
  '0052718E: push edx
  '0052718F: lea eax, [ebp-78h]
  '00527192: push eax
  '00527193: call 005180A0h
  '00527198: lea ecx, [ebp-44h]
  '0052719B: push ecx
  '0052719C: lea edx, [ebp-40h]
  '0052719F: push edx
  '005271A0: push 00000002h
  '005271A2: call [004012E8h]
  '005271A8: add esp, 0000000Ch
  '005271AB: lea eax, [ebp-78h]
  '005271AE: push eax
  '005271AF: lea ecx, [ebp-68h]
  '005271B2: push ecx
  '005271B3: push 00000002h
  '005271B5: call [00401050h]
  '005271BB: add esp, 0000000Ch
  '005271BE: mov [ebp-04h], 00000024h
  '005271C5: mov edx, 0042A030h
  '005271CA: lea ecx, [ebp-40h]
  '005271CD: call [004012D8h]
  '005271D3: lea edx, [ebp-40h]
  '005271D6: push edx
  '005271D7: call 00517E20h
  '005271DC: mov edx, eax
  '005271DE: lea ecx, [ebp-44h]
  '005271E1: call [00401378h]
  '005271E7: push eax
  '005271E8: call [004013BCh]
  '005271EE: fadd real8 ptr [004019B8h]
  '005271F4: fstsw ax
  '005271F6: test al, 0Dh
  '005271F8: jnz 00527911h
  '005271FE: sub esp, 00000008h
  '00527201: fstp real8 ptr [esp]
  '00527204: call [004011F4h]
  '0052720A: mov edx, eax
  '0052720C: lea ecx, [ebp-4Ch]
  '0052720F: call [00401378h]
  '00527215: mov edx, 0042A030h
  '0052721A: lea ecx, [ebp-48h]
  '0052721D: call [004012D8h]
  '00527223: lea eax, [ebp-4Ch]
  '00527226: push eax
  '00527227: lea ecx, [ebp-48h]
  '0052722A: push ecx
  '0052722B: lea edx, [ebp-68h]
  '0052722E: push edx
  '0052722F: call 005180A0h
  '00527234: lea eax, [ebp-4Ch]
  '00527237: push eax
  '00527238: lea ecx, [ebp-48h]
  '0052723B: push ecx
  '0052723C: lea edx, [ebp-44h]
  '0052723F: push edx
  '00527240: lea eax, [ebp-40h]
  '00527243: push eax
  '00527244: push 00000004h
  '00527246: call [004012E8h]
  '0052724C: add esp, 00000014h
  '0052724F: lea ecx, [ebp-68h]
  '00527252: call [00401030h]
  '00527258: mov [ebp-04h], 00000025h
  '0052725F: call [00401104h]
  '00527265: mov [ebp-04h], 00000027h
  '0052726C: mov edx, 0042B3A0h
  '00527271: lea ecx, [ebp-40h]
  '00527274: call [004012D8h]
  '0052727A: lea ecx, [ebp-40h]
  '0052727D: push ecx
  '0052727E: mov edx, [ebp+08h]
  '00527281: mov eax, [edx]
  '00527283: mov ecx, [ebp+08h]
  '00527286: push ecx
  '00527287: call [eax+00000738h]
  '0052728D: lea ecx, [ebp-40h]
  '00527290: call [004013B4h]
  '00527296: mov [ebp-04h], 00000028h
  '0052729D: call [00401104h]
  '005272A3: mov [ebp-04h], 00000029h
  '005272AA: mov edx, [ebp+08h]
  '005272AD: mov word ptr [edx+60h], 0000h
  '005272B3: mov [ebp-04h], 0000002Ah
  '005272BA: call [00401104h]
  '005272C0: jmp 005276D3h
  '005272C5: mov [ebp-04h], 0000002Ch
  '005272CC: mov eax, [ebp+08h]
  '005272CF: mov ecx, [eax+58h]
  '005272D2: push ecx
  '005272D3: call [00401044h]
  '005272D9: cmp eax, 00019000h
  '005272DE: jle 52734Bh
  '005272E0: mov [ebp-04h], 0000002Dh
  '005272E7: mov edx, [ebp+08h]
  '005272EA: mov eax, [edx+44h]
  '005272ED: push eax
  '005272EE: push 00000001h
  '005272F0: push FFFFFFFFh
  '005272F2: push 00004020h
  '005272F7: call [004012A0h]
  '005272FD: mov [ebp-04h], 0000002Eh
  '00527304: push 00000001h
  '00527306: push 00000001h
  '00527308: call [004012A4h]
  '0052730E: add eax, 00000001h
  '00527311: jo 00527916h
  '00527317: push eax
  '00527318: mov ecx, [ebp+08h]
  '0052731B: add ecx, 00000058h
  '0052731E: push ecx
  '0052731F: push 00000000h
  '00527321: call [00401058h]
  '00527327: mov [ebp-04h], 0000002Fh
  '0052732E: push 00000001h
  '00527330: call [00401168h]
  '00527336: mov [ebp-04h], 00000030h
  '0052733D: xor edx, edx
  '0052733F: mov ecx, [ebp+08h]
  '00527342: add ecx, 00000058h
  '00527345: call [004012D8h]
  '0052734B: mov [ebp-04h], 00000032h
  '00527352: push 00000000h
  '00527354: push 00000005h
  '00527356: mov edx, [ebp+08h]
  '00527359: mov eax, [edx]
  '0052735B: mov ecx, [ebp+08h]
  '0052735E: push ecx
  '0052735F: call [eax+00000318h]
  '00527365: push eax
  '00527366: lea edx, [ebp-50h]
  '00527369: push edx
  '0052736A: call [004010E4h]
  '00527370: push eax
  '00527371: lea eax, [ebp-68h]
  '00527374: push eax
  '00527375: call [004011E4h]
  '0052737B: add esp, 00000010h
  '0052737E: push eax
  '0052737F: call [004011DCh]
  '00527385: fild dword ptr [ebp+0Ch]
  '00527388: fstp real8 ptr [ebp-000001A0h]
  '0052738E: fadd real8 ptr [ebp-000001A0h]
  '00527394: fstp real4 ptr [ebp-000000F0h]
  '0052739A: fstsw ax
  '0052739C: test al, 0Dh
  '0052739E: jnz 00527911h
  '005273A4: mov [ebp-000000F8h], 00000004h
  '005273AE: mov eax, 00000010h
  '005273B3: call 004081B0h
  '005273B8: mov ecx, esp
  '005273BA: mov edx, [ebp-000000F8h]
  '005273C0: mov [ecx], edx
  '005273C2: mov eax, [ebp-000000F4h]
  '005273C8: mov [ecx+04h], eax
  '005273CB: mov edx, [ebp-000000F0h]
  '005273D1: mov [ecx+08h], edx
  '005273D4: mov eax, [ebp-000000ECh]
  '005273DA: mov [ecx+0Ch], eax
  '005273DD: push 00000005h
  '005273DF: mov ecx, [ebp+08h]
  '005273E2: mov edx, [ecx]
  '005273E4: mov eax, [ebp+08h]
  '005273E7: push eax
  '005273E8: call [edx+00000318h]
  '005273EE: push eax
  '005273EF: lea ecx, [ebp-54h]
  '005273F2: push ecx
  '005273F3: call [004010E4h]
  '005273F9: push eax
  '005273FA: call [0040139Ch]
  '00527400: lea edx, [ebp-54h]
  '00527403: push edx
  '00527404: lea eax, [ebp-50h]
  '00527407: push eax
  '00527408: push 00000002h
  '0052740A: call [00401064h]
  '00527410: add esp, 0000000Ch
  '00527413: lea ecx, [ebp-68h]
  '00527416: call [00401030h]
  '0052741C: mov [ebp-04h], 00000033h
  '00527423: push 00000000h
  '00527425: push 00000005h
  '00527427: mov ecx, [ebp+08h]
  '0052742A: mov edx, [ecx]
  '0052742C: mov eax, [ebp+08h]
  '0052742F: push eax
  '00527430: call [edx+00000318h]
  '00527436: push eax
  '00527437: lea ecx, [ebp-50h]
  '0052743A: push ecx
  '0052743B: call [004010E4h]
  '00527441: push eax
  '00527442: lea edx, [ebp-68h]
  '00527445: push edx
  '00527446: call [004011E4h]
  '0052744C: add esp, 00000010h
  '0052744F: push eax
  '00527450: call [004011DCh]
  '00527456: fcomp real4 ptr [00405680h]
  '0052745C: fstsw ax
  '0052745E: test ah, 41h
  '00527461: jnz 52746Fh
  '00527463: mov [ebp-000001A4h], 00000001h
  '0052746D: jmp 527479h
  '0052746F: mov [ebp-000001A4h], 00000000h
  '00527479: mov eax, [ebp-000001A4h]
  '0052747F: neg eax
  '00527481: mov [ebp-00000144h], ax
  '00527488: lea ecx, [ebp-50h]
  '0052748B: call [004013B8h]
  '00527491: lea ecx, [ebp-68h]
  '00527494: call [00401030h]
  '0052749A: movsx ecx, word ptr [ebp-00000144h]
  '005274A1: test ecx, ecx
  '005274A3: jz 005276C6h
  '005274A9: mov [ebp-04h], 00000034h
  '005274B0: push 00000000h
  '005274B2: push 00000005h
  '005274B4: mov edx, [ebp+08h]
  '005274B7: mov eax, [edx]
  '005274B9: mov ecx, [ebp+08h]
  '005274BC: push ecx
  '005274BD: call [eax+00000318h]
  '005274C3: push eax
  '005274C4: lea edx, [ebp-50h]
  '005274C7: push edx
  '005274C8: call [004010E4h]
  '005274CE: push eax
  '005274CF: lea eax, [ebp-68h]
  '005274D2: push eax
  '005274D3: call [004011E4h]
  '005274D9: add esp, 00000010h
  '005274DC: push 00000000h
  '005274DE: push 00000001h
  '005274E0: mov ecx, [ebp+08h]
  '005274E3: mov edx, [ecx]
  '005274E5: mov eax, [ebp+08h]
  '005274E8: push eax
  '005274E9: call [edx+00000318h]
  '005274EF: push eax
  '005274F0: lea ecx, [ebp-54h]
  '005274F3: push ecx
  '005274F4: call [004010E4h]
  '005274FA: push eax
  '005274FB: lea edx, [ebp-78h]
  '005274FE: push edx
  '005274FF: call [004011E4h]
  '00527505: add esp, 00000010h
  '00527508: push 00000000h
  '0052750A: push 00000001h
  '0052750C: mov eax, [ebp+08h]
  '0052750F: mov ecx, [eax]
  '00527511: mov edx, [ebp+08h]
  '00527514: push edx
  '00527515: call [ecx+00000318h]
  '0052751B: push eax
  '0052751C: lea eax, [ebp-58h]
  '0052751F: push eax
  '00527520: call [004010E4h]
  '00527526: push eax
  '00527527: lea ecx, [ebp-000000C8h]
  '0052752D: push ecx
  '0052752E: call [004011E4h]
  '00527534: add esp, 00000010h
  '00527537: mov [ebp-00000100h], 0041E8E0h
  '00527541: mov [ebp-00000108h], 00000008h
  '0052754B: lea edx, [ebp-00000108h]
  '00527551: lea ecx, [ebp-00000098h]
  '00527557: call [00401338h]
  '0052755D: lea edx, [ebp-68h]
  '00527560: push edx
  '00527561: call [004011DCh]
  '00527567: fstp real4 ptr [ebp-000001A8h]
  '0052756D: lea eax, [ebp-78h]
  '00527570: push eax
  '00527571: call [004011DCh]
  '00527577: cmp [00541000h], 00000000h
  '0052757E: jnz 527588h
  '00527580: fdivr real4 ptr [ebp-000001A8h]
  '00527586: jmp 527593h
  '00527588: push [ebp-000001A8h]
  '0052758E: call 004081E6h
  '00527593: fmul real4 ptr [0040739Ch]
  '00527599: fstp real4 ptr [ebp-80h]
  '0052759C: fstsw ax
  '0052759E: test al, 0Dh
  '005275A0: jnz 00527911h
  '005275A6: mov [ebp-00000088h], 00000004h
  '005275B0: push 00000001h
  '005275B2: push 00000001h
  '005275B4: lea ecx, [ebp-00000098h]
  '005275BA: push ecx
  '005275BB: lea edx, [ebp-00000088h]
  '005275C1: push edx
  '005275C2: lea eax, [ebp-000000A8h]
  '005275C8: push eax
  '005275C9: call [00401094h]
  '005275CF: mov [ebp-00000110h], 0042B3CCh
  '005275D9: mov [ebp-00000118h], 00000008h
  '005275E3: push 00000000h
  '005275E5: lea ecx, [ebp-000000C8h]
  '005275EB: push ecx
  '005275EC: call [004011DCh]
  '005275F2: sub esp, 00000008h
  '005275F5: fstp real8 ptr [esp]
  '005275F8: call 00519620h
  '005275FD: mov [ebp-000000D0h], eax
  '00527603: mov [ebp-000000D8h], 00000008h
  '0052760D: lea edx, [ebp-000000A8h]
  '00527613: push edx
  '00527614: lea eax, [ebp-00000118h]
  '0052761A: push eax
  '0052761B: lea ecx, [ebp-000000B8h]
  '00527621: push ecx
  '00527622: call [00401274h]
  '00527628: push eax
  '00527629: lea edx, [ebp-000000D8h]
  '0052762F: push edx
  '00527630: lea eax, [ebp-000000E8h]
  '00527636: push eax
  '00527637: call [00401274h]
  '0052763D: push eax
  '0052763E: call [0040103Ch]
  '00527644: mov edx, eax
  '00527646: lea ecx, [ebp-40h]
  '00527649: call [00401378h]
  '0052764F: lea ecx, [ebp-40h]
  '00527652: push ecx
  '00527653: mov edx, [ebp+08h]
  '00527656: mov eax, [edx]
  '00527658: mov ecx, [ebp+08h]
  '0052765B: push ecx
  '0052765C: call [eax+00000738h]
  '00527662: lea ecx, [ebp-40h]
  '00527665: call [004013B4h]
  '0052766B: lea edx, [ebp-58h]
  '0052766E: push edx
  '0052766F: lea eax, [ebp-54h]
  '00527672: push eax
  '00527673: lea ecx, [ebp-50h]
  '00527676: push ecx
  '00527677: push 00000003h
  '00527679: call [00401064h]
  '0052767F: add esp, 00000010h
  '00527682: lea edx, [ebp-000000E8h]
  '00527688: push edx
  '00527689: lea eax, [ebp-000000D8h]
  '0052768F: push eax
  '00527690: lea ecx, [ebp-000000B8h]
  '00527696: push ecx
  '00527697: lea edx, [ebp-000000C8h]
  '0052769D: push edx
  '0052769E: lea eax, [ebp-000000A8h]
  '005276A4: push eax
  '005276A5: lea ecx, [ebp-00000098h]
  '005276AB: push ecx
  '005276AC: lea edx, [ebp-00000088h]
  '005276B2: push edx
  '005276B3: lea eax, [ebp-78h]
  '005276B6: push eax
  '005276B7: lea ecx, [ebp-68h]
  '005276BA: push ecx
  '005276BB: push 00000009h
  '005276BD: call [00401050h]
  '005276C3: add esp, 00000028h
  '005276C6: mov [ebp-04h], 00000036h
  '005276CD: call [00401104h]
  '005276D3: jmp 0052785Fh
  '005276D8: mov [ebp-04h], 0000003Ah
  '005276DF: call [00401300h]
  '005276E5: push eax
  '005276E6: lea edx, [ebp-50h]
  '005276E9: push edx
  '005276EA: call [004010E4h]
  '005276F0: mov [ebp-00000144h], eax
  '005276F6: lea eax, [ebp-40h]
  '005276F9: push eax
  '005276FA: mov ecx, [ebp-00000144h]
  '00527700: mov edx, [ecx]
  '00527702: mov eax, [ebp-00000144h]
  '00527708: push eax
  '00527709: call [edx+2Ch]
  '0052770C: fclex 
  '0052770E: mov [ebp-00000148h], eax
  '00527714: cmp [ebp-00000148h], 00000000h
  '0052771B: jnl 527740h
  '0052771D: push 0000002Ch
  '0052771F: push 0041E948h
  '00527724: mov ecx, [ebp-00000144h]
  '0052772A: push ecx
  '0052772B: mov edx, [ebp-00000148h]
  '00527731: push edx
  '00527732: call [004010A0h]
  '00527738: mov [ebp-000001ACh], eax
  '0052773E: jmp 52774Ah
  '00527740: mov [ebp-000001ACh], 00000000h
  '0052774A: call [00401300h]
  '00527750: push eax
  '00527751: lea eax, [ebp-54h]
  '00527754: push eax
  '00527755: call [004010E4h]
  '0052775B: mov [ebp-0000014Ch], eax
  '00527761: lea ecx, [ebp-00000140h]
  '00527767: push ecx
  '00527768: mov edx, [ebp-0000014Ch]
  '0052776E: mov eax, [edx]
  '00527770: mov ecx, [ebp-0000014Ch]
  '00527776: push ecx
  '00527777: call [eax+1Ch]
  '0052777A: fclex 
  '0052777C: mov [ebp-00000150h], eax
  '00527782: cmp [ebp-00000150h], 00000000h
  '00527789: jnl 5277AEh
  '0052778B: push 0000001Ch
  '0052778D: push 0041E948h
  '00527792: mov edx, [ebp-0000014Ch]
  '00527798: push edx
  '00527799: mov eax, [ebp-00000150h]
  '0052779F: push eax
  '005277A0: call [004010A0h]
  '005277A6: mov [ebp-000001B0h], eax
  '005277AC: jmp 5277B8h
  '005277AE: mov [ebp-000001B0h], 00000000h
  '005277B8: mov [ebp-00000090h], 80020004h
  '005277C2: mov [ebp-00000098h], 0000000Ah
  '005277CC: mov [ebp-80h], 80020004h
  '005277D3: mov [ebp-00000088h], 0000000Ah
  '005277DD: mov ecx, [ebp-00000140h]
  '005277E3: mov [ebp-70h], ecx
  '005277E6: mov [ebp-78h], 00000003h
  '005277ED: mov edx, [ebp-40h]
  '005277F0: mov [ebp-0000016Ch], edx
  '005277F6: mov [ebp-40h], 00000000h
  '005277FD: mov eax, [ebp-0000016Ch]
  '00527803: mov [ebp-60h], eax
  '00527806: mov [ebp-68h], 00000008h
  '0052780D: lea ecx, [ebp-00000098h]
  '00527813: push ecx
  '00527814: lea edx, [ebp-00000088h]
  '0052781A: push edx
  '0052781B: lea eax, [ebp-78h]
  '0052781E: push eax
  '0052781F: push 00000010h
  '00527821: lea ecx, [ebp-68h]
  '00527824: push ecx
  '00527825: call [004010E0h]
  '0052782B: lea edx, [ebp-54h]
  '0052782E: push edx
  '0052782F: lea eax, [ebp-50h]
  '00527832: push eax
  '00527833: push 00000002h
  '00527835: call [00401064h]
  '0052783B: add esp, 0000000Ch
  '0052783E: lea ecx, [ebp-00000098h]
  '00527844: push ecx
  '00527845: lea edx, [ebp-00000088h]
  '0052784B: push edx
  '0052784C: lea eax, [ebp-78h]
  '0052784F: push eax
  '00527850: lea ecx, [ebp-68h]
  '00527853: push ecx
  '00527854: push 00000004h
  '00527856: call [00401050h]
  '0052785C: add esp, 00000014h
  '0052785F: mov [ebp-10h], 00000000h
  '00527866: wait 
  '00527867: push 005278EFh
  '0052786C: jmp 5278E5h
  '0052786E: lea edx, [ebp-4Ch]
  '00527871: push edx
  '00527872: lea eax, [ebp-48h]
  '00527875: push eax
  '00527876: lea ecx, [ebp-44h]
  '00527879: push ecx
  '0052787A: lea edx, [ebp-40h]
  '0052787D: push edx
  '0052787E: push 00000004h
  '00527880: call [004012E8h]
  '00527886: add esp, 00000014h
  '00527889: lea eax, [ebp-58h]
  '0052788C: push eax
  '0052788D: lea ecx, [ebp-54h]
  '00527890: push ecx
  '00527891: lea edx, [ebp-50h]
  '00527894: push edx
  '00527895: push 00000003h
  '00527897: call [00401064h]
  '0052789D: add esp, 00000010h
  '005278A0: lea eax, [ebp-000000E8h]
  '005278A6: push eax
  '005278A7: lea ecx, [ebp-000000D8h]
  '005278AD: push ecx
  '005278AE: lea edx, [ebp-000000C8h]
  '005278B4: push edx
  '005278B5: lea eax, [ebp-000000B8h]
  '005278BB: push eax
  '005278BC: lea ecx, [ebp-000000A8h]
  '005278C2: push ecx
  '005278C3: lea edx, [ebp-00000098h]
  '005278C9: push edx
  '005278CA: lea eax, [ebp-00000088h]
  '005278D0: push eax
  '005278D1: lea ecx, [ebp-78h]
  '005278D4: push ecx
  '005278D5: lea edx, [ebp-68h]
  '005278D8: push edx
  '005278D9: push 00000009h
  '005278DB: call [00401050h]
  '005278E1: add esp, 00000028h
  '005278E4: ret 
End Sub
Private Sub wskTransfer__526120
  '00526120: push ebp
  '00526121: mov ebp, esp
  '00526123: sub esp, 0000000Ch
  '00526126: push 004081B6h
  '0052612B: mov eax, fs:[00h]
  '00526131: push eax
  '00526132: mov fs:[00000000h], esp
  '00526139: sub esp, 00000044h
  '0052613C: push ebx
  '0052613D: push esi
  '0052613E: push edi
  '0052613F: mov [ebp-0Ch], esp
  '00526142: mov [ebp-08h], 004071E8h
  '00526149: mov esi, [ebp+08h]
  '0052614C: mov eax, esi
  '0052614E: and eax, 00000001h
  '00526151: mov [ebp-04h], eax
  '00526154: and esi, FFFFFFFEh
  '00526157: push esi
  '00526158: mov [ebp+08h], esi
  '0052615B: mov ecx, [esi]
  '0052615D: call [ecx+04h]
  '00526160: mov edx, [esi]
  '00526162: xor ebx, ebx
  '00526164: push 0041E6BCh
  '00526169: push ebx
  '0052616A: push 00000004h
  '0052616C: push esi
  '0052616D: mov [ebp-18h], ebx
  '00526170: mov [ebp-1Ch], ebx
  '00526173: mov [ebp-20h], ebx
  '00526176: mov [ebp-24h], ebx
  '00526179: mov [ebp-28h], ebx
  '0052617C: mov [ebp-2Ch], ebx
  '0052617F: mov [ebp-30h], ebx
  '00526182: mov [ebp-40h], ebx
  '00526185: mov [ebp-50h], ebx
  '00526188: call [edx+00000314h]
  '0052618E: push eax
  '0052618F: lea eax, [ebp-2Ch]
  '00526192: push eax
  '00526193: call [004010E4h]
  '00526199: lea ecx, [ebp-40h]
  '0052619C: push eax
  '0052619D: push ecx
  '0052619E: call [004011E4h]
  '005261A4: add esp, 00000010h
  '005261A7: push eax
  '005261A8: call [0040103Ch]
  '005261AE: mov edi, [00401378h]
  '005261B4: mov edx, eax
  '005261B6: lea ecx, [ebp-18h]
  '005261B9: call edi
  '005261BB: push eax
  '005261BC: call [0040108Ch]
  '005261C2: mov edx, eax
  '005261C4: lea ecx, [ebp-1Ch]
  '005261C7: call edi
  '005261C9: push eax
  '005261CA: push 0041E6DCh
  '005261CF: call [0040108Ch]
  '005261D5: mov edx, eax
  '005261D7: lea ecx, [ebp-20h]
  '005261DA: call edi
  '005261DC: mov edx, [esi]
  '005261DE: push eax
  '005261DF: push ebx
  '005261E0: push 00000001h
  '005261E2: push esi
  '005261E3: call [edx+00000314h]
  '005261E9: push eax
  '005261EA: lea eax, [ebp-30h]
  '005261ED: push eax
  '005261EE: call [004010E4h]
  '005261F4: lea ecx, [ebp-50h]
  '005261F7: push eax
  '005261F8: push ecx
  '005261F9: call [004011E4h]
  '005261FF: add esp, 00000010h
  '00526202: push eax
  '00526203: call [0040130Ch]
  '00526209: push eax
  '0052620A: call [00401024h]
  '00526210: mov edx, eax
  '00526212: lea ecx, [ebp-24h]
  '00526215: call edi
  '00526217: push eax
  '00526218: call [0040108Ch]
  '0052621E: mov edx, eax
  '00526220: lea ecx, [ebp-28h]
  '00526223: call edi
  '00526225: mov edx, [esi]
  '00526227: lea eax, [ebp-28h]
  '0052622A: push eax
  '0052622B: push esi
  '0052622C: call [edx+00000738h]
  '00526232: lea ecx, [ebp-28h]
  '00526235: lea edx, [ebp-24h]
  '00526238: push ecx
  '00526239: lea eax, [ebp-20h]
  '0052623C: push edx
  '0052623D: lea ecx, [ebp-1Ch]
  '00526240: push eax
  '00526241: lea edx, [ebp-18h]
  '00526244: push ecx
  '00526245: push edx
  '00526246: push 00000005h
  '00526248: call [004012E8h]
  '0052624E: lea eax, [ebp-30h]
  '00526251: lea ecx, [ebp-2Ch]
  '00526254: push eax
  '00526255: push ecx
  '00526256: push 00000002h
  '00526258: call [00401064h]
  '0052625E: lea edx, [ebp-50h]
  '00526261: lea eax, [ebp-40h]
  '00526264: push edx
  '00526265: push eax
  '00526266: push 00000002h
  '00526268: call [00401050h]
  '0052626E: add esp, 00000030h
  '00526271: mov [ebp-04h], ebx
  '00526274: push 005262BCh
  '00526279: jmp 5262BBh
  '0052627B: lea ecx, [ebp-28h]
  '0052627E: lea edx, [ebp-24h]
  '00526281: push ecx
  '00526282: lea eax, [ebp-20h]
  '00526285: push edx
  '00526286: lea ecx, [ebp-1Ch]
  '00526289: push eax
  '0052628A: lea edx, [ebp-18h]
  '0052628D: push ecx
  '0052628E: push edx
  '0052628F: push 00000005h
  '00526291: call [004012E8h]
  '00526297: lea eax, [ebp-30h]
  '0052629A: lea ecx, [ebp-2Ch]
  '0052629D: push eax
  '0052629E: push ecx
  '0052629F: push 00000002h
  '005262A1: call [00401064h]
  '005262A7: lea edx, [ebp-50h]
  '005262AA: lea eax, [ebp-40h]
  '005262AD: push edx
  '005262AE: push eax
  '005262AF: push 00000002h
  '005262B1: call [00401050h]
  '005262B7: add esp, 00000030h
  '005262BA: ret 
End Sub
Private Sub wskTransfer__525A90
  '00525A90: push ebp
  '00525A91: mov ebp, esp
  '00525A93: sub esp, 00000018h
  '00525A96: push 004081B6h
  '00525A9B: mov eax, fs:[00h]
  '00525AA1: push eax
  '00525AA2: mov fs:[00000000h], esp
  '00525AA9: mov eax, 00000040h
  '00525AAE: call 004081B0h
  '00525AB3: push ebx
  '00525AB4: push esi
  '00525AB5: push edi
  '00525AB6: mov [ebp-18h], esp
  '00525AB9: mov [ebp-14h], 00407138h
  '00525AC0: mov eax, [ebp+08h]
  '00525AC3: and eax, 00000001h
  '00525AC6: mov [ebp-10h], eax
  '00525AC9: mov ecx, [ebp+08h]
  '00525ACC: and ecx, FFFFFFFEh
  '00525ACF: mov [ebp+08h], ecx
  '00525AD2: mov [ebp-0Ch], 00000000h
  '00525AD9: mov edx, [ebp+08h]
  '00525ADC: mov eax, [edx]
  '00525ADE: mov ecx, [ebp+08h]
  '00525AE1: push ecx
  '00525AE2: call [eax+04h]
  '00525AE5: mov [ebp-04h], 00000001h
  '00525AEC: mov [ebp-04h], 00000002h
  '00525AF3: push FFFFFFFFh
  '00525AF5: call [004010E8h]
  '00525AFB: mov [ebp-04h], 00000003h
  '00525B02: push 00000000h
  '00525B04: push 00000046h
  '00525B06: mov edx, [ebp+08h]
  '00525B09: mov eax, [edx]
  '00525B0B: mov ecx, [ebp+08h]
  '00525B0E: push ecx
  '00525B0F: call [eax+00000314h]
  '00525B15: push eax
  '00525B16: lea edx, [ebp-2Ch]
  '00525B19: push edx
  '00525B1A: call [004010E4h]
  '00525B20: push eax
  '00525B21: call [00401040h]
  '00525B27: add esp, 0000000Ch
  '00525B2A: lea ecx, [ebp-2Ch]
  '00525B2D: call [004013B8h]
  '00525B33: mov [ebp-04h], 00000004h
  '00525B3A: lea eax, [ebp+0Ch]
  '00525B3D: mov [ebp-44h], eax
  '00525B40: mov [ebp-4Ch], 00004003h
  '00525B47: mov eax, 00000010h
  '00525B4C: call 004081B0h
  '00525B51: mov ecx, esp
  '00525B53: mov edx, [ebp-4Ch]
  '00525B56: mov [ecx], edx
  '00525B58: mov eax, [ebp-48h]
  '00525B5B: mov [ecx+04h], eax
  '00525B5E: mov edx, [ebp-44h]
  '00525B61: mov [ecx+08h], edx
  '00525B64: mov eax, [ebp-40h]
  '00525B67: mov [ecx+0Ch], eax
  '00525B6A: push 00000001h
  '00525B6C: push 00000042h
  '00525B6E: mov ecx, [ebp+08h]
  '00525B71: mov edx, [ecx]
  '00525B73: mov eax, [ebp+08h]
  '00525B76: push eax
  '00525B77: call [edx+00000314h]
  '00525B7D: push eax
  '00525B7E: lea ecx, [ebp-2Ch]
  '00525B81: push ecx
  '00525B82: call [004010E4h]
  '00525B88: push eax
  '00525B89: call [00401040h]
  '00525B8F: add esp, 0000001Ch
  '00525B92: lea ecx, [ebp-2Ch]
  '00525B95: call [004013B8h]
  '00525B9B: mov [ebp-04h], 00000005h
  '00525BA2: push 0041E724h
  '00525BA7: push 00000000h
  '00525BA9: push 00000004h
  '00525BAB: mov edx, [ebp+08h]
  '00525BAE: mov eax, [edx]
  '00525BB0: mov ecx, [ebp+08h]
  '00525BB3: push ecx
  '00525BB4: call [eax+00000314h]
  '00525BBA: push eax
  '00525BBB: lea edx, [ebp-2Ch]
  '00525BBE: push edx
  '00525BBF: call [004010E4h]
  '00525BC5: push eax
  '00525BC6: lea eax, [ebp-3Ch]
  '00525BC9: push eax
  '00525BCA: call [004011E4h]
  '00525BD0: add esp, 00000010h
  '00525BD3: push eax
  '00525BD4: call [0040103Ch]
  '00525BDA: mov edx, eax
  '00525BDC: lea ecx, [ebp-24h]
  '00525BDF: call [00401378h]
  '00525BE5: push eax
  '00525BE6: call [0040108Ch]
  '00525BEC: mov edx, eax
  '00525BEE: lea ecx, [ebp-28h]
  '00525BF1: call [00401378h]
  '00525BF7: lea ecx, [ebp-28h]
  '00525BFA: push ecx
  '00525BFB: mov edx, [ebp+08h]
  '00525BFE: mov eax, [edx]
  '00525C00: mov ecx, [ebp+08h]
  '00525C03: push ecx
  '00525C04: call [eax+00000738h]
  '00525C0A: lea edx, [ebp-28h]
  '00525C0D: push edx
  '00525C0E: lea eax, [ebp-24h]
  '00525C11: push eax
  '00525C12: push 00000002h
  '00525C14: call [004012E8h]
  '00525C1A: add esp, 0000000Ch
  '00525C1D: lea ecx, [ebp-2Ch]
  '00525C20: call [004013B8h]
  '00525C26: lea ecx, [ebp-3Ch]
  '00525C29: call [00401030h]
  '00525C2F: mov [ebp-04h], 00000006h
  '00525C36: mov edx, 0041BC60h
  '00525C3B: mov ecx, [ebp+08h]
  '00525C3E: add ecx, 00000058h
  '00525C41: call [004012D8h]
  '00525C47: mov [ebp-04h], 00000007h
  '00525C4E: mov ecx, [ebp+08h]
  '00525C51: mov [ecx+5Ch], 00000000h
  '00525C58: mov [ebp-10h], 00000000h
  '00525C5F: push 00525C8Dh
  '00525C64: jmp 525C8Ch
  '00525C66: lea edx, [ebp-28h]
  '00525C69: push edx
  '00525C6A: lea eax, [ebp-24h]
  '00525C6D: push eax
  '00525C6E: push 00000002h
  '00525C70: call [004012E8h]
  '00525C76: add esp, 0000000Ch
  '00525C79: lea ecx, [ebp-2Ch]
  '00525C7C: call [004013B8h]
  '00525C82: lea ecx, [ebp-3Ch]
  '00525C85: call [00401030h]
  '00525C8B: ret 
End Sub
Private Sub wskTransfer__5293B0
  '005293B0: push ebp
  '005293B1: mov ebp, esp
  '005293B3: sub esp, 0000000Ch
  '005293B6: push 004081B6h
  '005293BB: mov eax, fs:[00h]
  '005293C1: push eax
  '005293C2: mov fs:[00000000h], esp
  '005293C9: sub esp, 00000008h
  '005293CC: push ebx
  '005293CD: push esi
  '005293CE: push edi
  '005293CF: mov [ebp-0Ch], esp
  '005293D2: mov [ebp-08h], 00407578h
  '005293D9: mov esi, [ebp+08h]
  '005293DC: mov eax, esi
  '005293DE: and eax, 00000001h
  '005293E1: mov [ebp-04h], eax
  '005293E4: and esi, FFFFFFFEh
  '005293E7: push esi
  '005293E8: mov [ebp+08h], esi
  '005293EB: mov ecx, [esi]
  '005293ED: call [ecx+04h]
  '005293F0: mov word ptr [esi+4Ah], FFFFh
  '005293F6: mov [ebp-04h], 00000000h
  '005293FD: mov eax, [ebp+08h]
  '00529400: push eax
  '00529401: mov edx, [eax]
  '00529403: call [edx+08h]
  '00529406: mov eax, [ebp-04h]
  '00529409: mov ecx, [ebp-14h]
  '0052940C: pop edi
  '0052940D: pop esi
  '0052940E: mov fs:[00000000h], ecx
  '00529415: pop ebx
  '00529416: mov esp, ebp
  '00529418: pop ebp
  '00529419: retn 0004h
End Sub
Private Sub unknown_527920
  '00527920: push ebp
  '00527921: mov ebp, esp
  '00527923: sub esp, 00000018h
  '00527926: push 004081B6h
  '0052792B: mov eax, fs:[00h]
  '00527931: push eax
  '00527932: mov fs:[00000000h], esp
  '00527939: mov eax, 00000184h
  '0052793E: call 004081B0h
  '00527943: push ebx
  '00527944: push esi
  '00527945: push edi
  '00527946: mov [ebp-18h], esp
  '00527949: mov [ebp-14h], 004073A0h
  '00527950: mov [ebp-10h], 00000000h
  '00527957: mov [ebp-0Ch], 00000000h
  '0052795E: mov eax, [ebp+08h]
  '00527961: mov ecx, [eax]
  '00527963: mov edx, [ebp+08h]
  '00527966: push edx
  '00527967: call [ecx+04h]
  '0052796A: mov [ebp-04h], 00000001h
  '00527971: mov [ebp-04h], 00000002h
  '00527978: push FFFFFFFFh
  '0052797A: call [004010E8h]
  '00527980: mov [ebp-04h], 00000003h
  '00527987: mov eax, [ebp+08h]
  '0052798A: movsx ecx, word ptr [eax+36h]
  '0052798E: test ecx, ecx
  '00527990: jz 5279A7h
  '00527992: mov [ebp-04h], 00000004h
  '00527999: mov edx, [ebp+08h]
  '0052799C: mov ax, [edx+36h]
  '005279A0: push eax
  '005279A1: call [00401168h]
  '005279A7: mov [ebp-04h], 00000006h
  '005279AE: mov [ebp-78h], 80020004h
  '005279B5: mov [ebp-80h], 0000000Ah
  '005279BC: lea ecx, [ebp-80h]
  '005279BF: push ecx
  '005279C0: call [004012BCh]
  '005279C6: mov edx, [ebp+08h]
  '005279C9: mov [edx+36h], ax
  '005279CD: lea ecx, [ebp-80h]
  '005279D0: call [00401030h]
  '005279D6: mov [ebp-04h], 00000007h
  '005279DD: mov [ebp-44h], 00001000h
  '005279E4: mov [ebp-04h], 00000008h
  '005279EB: mov [ebp-34h], 00000000h
  '005279F2: mov [ebp-04h], 00000009h
  '005279F9: push 00000000h
  '005279FB: push 00000008h
  '005279FD: mov eax, [ebp+08h]
  '00527A00: mov ecx, [eax]
  '00527A02: mov edx, [ebp+08h]
  '00527A05: push edx
  '00527A06: call [ecx+00000314h]
  '00527A0C: push eax
  '00527A0D: lea eax, [ebp-64h]
  '00527A10: push eax
  '00527A11: call [004010E4h]
  '00527A17: push eax
  '00527A18: lea ecx, [ebp-80h]
  '00527A1B: push ecx
  '00527A1C: call [004011E4h]
  '00527A22: add esp, 00000010h
  '00527A25: push eax
  '00527A26: call [00401284h]
  '00527A2C: movsx edx, ax
  '00527A2F: xor eax, eax
  '00527A31: cmp edx, 00000007h
  '00527A34: setnz al
  '00527A37: neg eax
  '00527A39: mov [ebp-0000012Ch], ax
  '00527A40: lea ecx, [ebp-64h]
  '00527A43: call [004013B8h]
  '00527A49: lea ecx, [ebp-80h]
  '00527A4C: call [00401030h]
  '00527A52: movsx ecx, word ptr [ebp-0000012Ch]
  '00527A59: test ecx, ecx
  '00527A5B: jz 00527B23h
  '00527A61: mov [ebp-04h], 0000000Ah
  '00527A68: mov [ebp-000000A8h], 80020004h
  '00527A72: mov [ebp-000000B0h], 0000000Ah
  '00527A7C: mov [ebp-00000098h], 80020004h
  '00527A86: mov [ebp-000000A0h], 0000000Ah
  '00527A90: mov [ebp-000000F8h], 0042B450h
  '00527A9A: mov [ebp-00000100h], 00000008h
  '00527AA4: lea edx, [ebp-00000100h]
  '00527AAA: lea ecx, [ebp-00000090h]
  '00527AB0: call [00401338h]
  '00527AB6: mov [ebp-000000E8h], 0042B3DCh
  '00527AC0: mov [ebp-000000F0h], 00000008h
  '00527ACA: lea edx, [ebp-000000F0h]
  '00527AD0: lea ecx, [ebp-80h]
  '00527AD3: call [00401338h]
  '00527AD9: lea edx, [ebp-000000B0h]
  '00527ADF: push edx
  '00527AE0: lea eax, [ebp-000000A0h]
  '00527AE6: push eax
  '00527AE7: lea ecx, [ebp-00000090h]
  '00527AED: push ecx
  '00527AEE: push 00000040h
  '00527AF0: lea edx, [ebp-80h]
  '00527AF3: push edx
  '00527AF4: call [004010E0h]
  '00527AFA: lea eax, [ebp-000000B0h]
  '00527B00: push eax
  '00527B01: lea ecx, [ebp-000000A0h]
  '00527B07: push ecx
  '00527B08: lea edx, [ebp-00000090h]
  '00527B0E: push edx
  '00527B0F: lea eax, [ebp-80h]
  '00527B12: push eax
  '00527B13: push 00000004h
  '00527B15: call [00401050h]
  '00527B1B: add esp, 00000014h
  '00527B1E: jmp 00528DE1h
  '00527B23: mov [ebp-04h], 0000000Dh
  '00527B2A: mov ecx, [ebp+0Ch]
  '00527B2D: mov edx, [ecx]
  '00527B2F: push edx
  '00527B30: call 00520140h
  '00527B35: movsx eax, ax
  '00527B38: test eax, eax
  '00527B3A: jnz 00527BFAh
  '00527B40: mov [ebp-04h], 0000000Eh
  '00527B47: mov [ebp-000000A8h], 80020004h
  '00527B51: mov [ebp-000000B0h], 0000000Ah
  '00527B5B: mov [ebp-00000098h], 80020004h
  '00527B65: mov [ebp-000000A0h], 0000000Ah
  '00527B6F: mov [ebp-000000E8h], 0042B4A4h
  '00527B79: mov [ebp-000000F0h], 00000008h
  '00527B83: lea edx, [ebp-000000F0h]
  '00527B89: lea ecx, [ebp-00000090h]
  '00527B8F: call [00401338h]
  '00527B95: mov ecx, [ebp+0Ch]
  '00527B98: mov edx, [ecx]
  '00527B9A: push edx
  '00527B9B: push 0042B478h
  '00527BA0: call [0040108Ch]
  '00527BA6: mov [ebp-78h], eax
  '00527BA9: mov [ebp-80h], 00000008h
  '00527BB0: lea eax, [ebp-000000B0h]
  '00527BB6: push eax
  '00527BB7: lea ecx, [ebp-000000A0h]
  '00527BBD: push ecx
  '00527BBE: lea edx, [ebp-00000090h]
  '00527BC4: push edx
  '00527BC5: push 00000010h
  '00527BC7: lea eax, [ebp-80h]
  '00527BCA: push eax
  '00527BCB: call [004010E0h]
  '00527BD1: lea ecx, [ebp-000000B0h]
  '00527BD7: push ecx
  '00527BD8: lea edx, [ebp-000000A0h]
  '00527BDE: push edx
  '00527BDF: lea eax, [ebp-00000090h]
  '00527BE5: push eax
  '00527BE6: lea ecx, [ebp-80h]
  '00527BE9: push ecx
  '00527BEA: push 00000004h
  '00527BEC: call [00401050h]
  '00527BF2: add esp, 00000014h
  '00527BF5: jmp 00528DE1h
  '00527BFA: mov [ebp-04h], 00000011h
  '00527C01: mov edx, [ebp+08h]
  '00527C04: mov eax, [edx]
  '00527C06: mov ecx, [ebp+08h]
  '00527C09: push ecx
  '00527C0A: call [eax+00000318h]
  '00527C10: push eax
  '00527C11: lea edx, [ebp-6Ch]
  '00527C14: push edx
  '00527C15: call [004010E4h]
  '00527C1B: mov eax, [ebp+08h]
  '00527C1E: mov ecx, [eax]
  '00527C20: mov edx, [ebp+08h]
  '00527C23: push edx
  '00527C24: call [ecx+0000031Ch]
  '00527C2A: push eax
  '00527C2B: lea eax, [ebp-70h]
  '00527C2E: push eax
  '00527C2F: call [004010E4h]
  '00527C35: mov [ebp-00000128h], 00000001h
  '00527C3F: mov ecx, [ebp-70h]
  '00527C42: mov [ebp-0000014Ch], ecx
  '00527C48: mov [ebp-70h], 00000000h
  '00527C4F: mov edx, [ebp-0000014Ch]
  '00527C55: push edx
  '00527C56: lea eax, [ebp-68h]
  '00527C59: push eax
  '00527C5A: call [004010E4h]
  '00527C60: mov ecx, [ebp-6Ch]
  '00527C63: mov [ebp-00000150h], ecx
  '00527C69: mov [ebp-6Ch], 00000000h
  '00527C70: mov edx, [ebp-00000150h]
  '00527C76: push edx
  '00527C77: lea eax, [ebp-64h]
  '00527C7A: push eax
  '00527C7B: call [004010E4h]
  '00527C81: lea ecx, [ebp-00000128h]
  '00527C87: push ecx
  '00527C88: lea edx, [ebp-68h]
  '00527C8B: push edx
  '00527C8C: lea eax, [ebp-64h]
  '00527C8F: push eax
  '00527C90: lea ecx, [ebp-80h]
  '00527C93: push ecx
  '00527C94: call 004FDD30h
  '00527C99: lea edx, [ebp-70h]
  '00527C9C: push edx
  '00527C9D: lea eax, [ebp-6Ch]
  '00527CA0: push eax
  '00527CA1: lea ecx, [ebp-68h]
  '00527CA4: push ecx
  '00527CA5: lea edx, [ebp-64h]
  '00527CA8: push edx
  '00527CA9: push 00000004h
  '00527CAB: call [00401064h]
  '00527CB1: add esp, 00000014h
  '00527CB4: lea ecx, [ebp-80h]
  '00527CB7: call [00401030h]
  '00527CBD: mov [ebp-04h], 00000012h
  '00527CC4: mov [ebp-000000E8h], FFFFFFFFh
  '00527CCE: mov [ebp-000000F0h], 0000000Bh
  '00527CD8: mov eax, 00000010h
  '00527CDD: call 004081B0h
  '00527CE2: mov eax, esp
  '00527CE4: mov ecx, [ebp-000000F0h]
  '00527CEA: mov [eax], ecx
  '00527CEC: mov edx, [ebp-000000ECh]
  '00527CF2: mov [eax+04h], edx
  '00527CF5: mov ecx, [ebp-000000E8h]
  '00527CFB: mov [eax+08h], ecx
  '00527CFE: mov edx, [ebp-000000E4h]
  '00527D04: mov [eax+0Ch], edx
  '00527D07: push 80010007h
  '00527D0C: mov eax, [ebp+08h]
  '00527D0F: mov ecx, [eax]
  '00527D11: mov edx, [ebp+08h]
  '00527D14: push edx
  '00527D15: call [ecx+00000318h]
  '00527D1B: push eax
  '00527D1C: lea eax, [ebp-64h]
  '00527D1F: push eax
  '00527D20: call [004010E4h]
  '00527D26: push eax
  '00527D27: call [0040139Ch]
  '00527D2D: lea ecx, [ebp-64h]
  '00527D30: call [004013B8h]
  '00527D36: mov [ebp-04h], 00000013h
  '00527D3D: mov ecx, [ebp+0Ch]
  '00527D40: mov edx, [ecx]
  '00527D42: push edx
  '00527D43: call [004012FCh]
  '00527D49: mov [ebp-00000154h], eax
  '00527D4F: fild dword ptr [ebp-00000154h]
  '00527D55: fstp real4 ptr [ebp-000000E8h]
  '00527D5B: mov [ebp-000000F0h], 00000004h
  '00527D65: mov eax, 00000010h
  '00527D6A: call 004081B0h
  '00527D6F: mov eax, esp
  '00527D71: mov ecx, [ebp-000000F0h]
  '00527D77: mov [eax], ecx
  '00527D79: mov edx, [ebp-000000ECh]
  '00527D7F: mov [eax+04h], edx
  '00527D82: mov ecx, [ebp-000000E8h]
  '00527D88: mov [eax+08h], ecx
  '00527D8B: mov edx, [ebp-000000E4h]
  '00527D91: mov [eax+0Ch], edx
  '00527D94: push 00000001h
  '00527D96: mov eax, [ebp+08h]
  '00527D99: mov ecx, [eax]
  '00527D9B: mov edx, [ebp+08h]
  '00527D9E: push edx
  '00527D9F: call [ecx+00000318h]
  '00527DA5: push eax
  '00527DA6: lea eax, [ebp-64h]
  '00527DA9: push eax
  '00527DAA: call [004010E4h]
  '00527DB0: push eax
  '00527DB1: call [0040139Ch]
  '00527DB7: lea ecx, [ebp-64h]
  '00527DBA: call [004013B8h]
  '00527DC0: mov [ebp-04h], 00000014h
  '00527DC7: mov [ebp-000000E8h], 00000000h
  '00527DD1: mov [ebp-000000F0h], 00000004h
  '00527DDB: mov eax, 00000010h
  '00527DE0: call 004081B0h
  '00527DE5: mov ecx, esp
  '00527DE7: mov edx, [ebp-000000F0h]
  '00527DED: mov [ecx], edx
  '00527DEF: mov eax, [ebp-000000ECh]
  '00527DF5: mov [ecx+04h], eax
  '00527DF8: mov edx, [ebp-000000E8h]
  '00527DFE: mov [ecx+08h], edx
  '00527E01: mov eax, [ebp-000000E4h]
  '00527E07: mov [ecx+0Ch], eax
  '00527E0A: push 00000005h
  '00527E0C: mov ecx, [ebp+08h]
  '00527E0F: mov edx, [ecx]
  '00527E11: mov eax, [ebp+08h]
  '00527E14: push eax
  '00527E15: call [edx+00000318h]
  '00527E1B: push eax
  '00527E1C: lea ecx, [ebp-64h]
  '00527E1F: push ecx
  '00527E20: call [004010E4h]
  '00527E26: push eax
  '00527E27: call [0040139Ch]
  '00527E2D: lea ecx, [ebp-64h]
  '00527E30: call [004013B8h]
  '00527E36: mov [ebp-04h], 00000015h
  '00527E3D: call 0041BFE0h
  '00527E42: mov [ebp-00000128h], eax
  '00527E48: call [0040109Ch]
  '00527E4E: mov edx, [ebp-00000128h]
  '00527E54: mov [ebp-2Ch], edx
  '00527E57: mov [ebp-04h], 00000016h
  '00527E5E: mov eax, [ebp+0Ch]
  '00527E61: mov ecx, [eax]
  '00527E63: push ecx
  '00527E64: call [004012FCh]
  '00527E6A: mov [ebp-28h], eax
  '00527E6D: mov [ebp-04h], 00000017h
  '00527E74: push 00000000h
  '00527E76: fild dword ptr [ebp-28h]
  '00527E79: fstp real8 ptr [ebp-0000015Ch]
  '00527E7F: mov edx, [ebp-00000158h]
  '00527E85: push edx
  '00527E86: mov eax, [ebp-0000015Ch]
  '00527E8C: push eax
  '00527E8D: call 00519620h
  '00527E92: mov edx, eax
  '00527E94: lea ecx, [ebp-4Ch]
  '00527E97: call [00401378h]
  '00527E9D: mov [ebp-04h], 00000018h
  '00527EA4: mov ecx, [ebp+0Ch]
  '00527EA7: mov edx, [ecx]
  '00527EA9: push edx
  '00527EAA: mov eax, [ebp+08h]
  '00527EAD: mov cx, [eax+36h]
  '00527EB1: push ecx
  '00527EB2: push FFFFFFFFh
  '00527EB4: push 00000120h
  '00527EB9: call [004012A0h]
  '00527EBF: mov [ebp-04h], 00000019h
  '00527EC6: mov edx, [ebp-44h]
  '00527EC9: push edx
  '00527ECA: call [0040114Ch]
  '00527ED0: mov edx, eax
  '00527ED2: lea ecx, [ebp-48h]
  '00527ED5: call [00401378h]
  '00527EDB: mov [ebp-04h], 0000001Ah
  '00527EE2: mov eax, [ebp-28h]
  '00527EE5: sub eax, [ebp-34h]
  '00527EE8: jo 00528E97h
  '00527EEE: cmp eax, [ebp-44h]
  '00527EF1: jl 00528476h
  '00527EF7: mov [ebp-04h], 0000001Bh
  '00527EFE: mov ecx, [ebp+08h]
  '00527F01: mov dx, [ecx+36h]
  '00527F05: push edx
  '00527F06: mov eax, [ebp-34h]
  '00527F09: add eax, 00000001h
  '00527F0C: jo 00528E97h
  '00527F12: push eax
  '00527F13: lea ecx, [ebp-48h]
  '00527F16: push ecx
  '00527F17: push 00000000h
  '00527F19: call [0040118Ch]
  '00527F1F: mov [ebp-04h], 0000001Ch
  '00527F26: mov edx, [ebp-34h]
  '00527F29: add edx, [ebp-44h]
  '00527F2C: jo 00528E97h
  '00527F32: mov [ebp-34h], edx
  '00527F35: mov [ebp-04h], 0000001Dh
  '00527F3C: call [00401104h]
  '00527F42: mov [ebp-04h], 0000001Eh
  '00527F49: push 00000000h
  '00527F4B: push 00000008h
  '00527F4D: mov eax, [ebp+08h]
  '00527F50: mov ecx, [eax]
  '00527F52: mov edx, [ebp+08h]
  '00527F55: push edx
  '00527F56: call [ecx+00000314h]
  '00527F5C: push eax
  '00527F5D: lea eax, [ebp-64h]
  '00527F60: push eax
  '00527F61: call [004010E4h]
  '00527F67: push eax
  '00527F68: lea ecx, [ebp-80h]
  '00527F6B: push ecx
  '00527F6C: call [004011E4h]
  '00527F72: add esp, 00000010h
  '00527F75: push eax
  '00527F76: call [00401284h]
  '00527F7C: movsx edx, ax
  '00527F7F: xor eax, eax
  '00527F81: cmp edx, 00000007h
  '00527F84: setz al
  '00527F87: neg eax
  '00527F89: mov [ebp-0000012Ch], ax
  '00527F90: lea ecx, [ebp-64h]
  '00527F93: call [004013B8h]
  '00527F99: lea ecx, [ebp-80h]
  '00527F9C: call [00401030h]
  '00527FA2: movsx ecx, word ptr [ebp-0000012Ch]
  '00527FA9: test ecx, ecx
  '00527FAB: jz 0052804Dh
  '00527FB1: mov [ebp-04h], 0000001Fh
  '00527FB8: mov edx, [ebp+08h]
  '00527FBB: mov word ptr [edx+4Ah], 0000h
  '00527FC1: mov [ebp-04h], 00000020h
  '00527FC8: call [00401104h]
  '00527FCE: mov [ebp-04h], 00000021h
  '00527FD5: mov eax, [ebp-48h]
  '00527FD8: mov [ebp-000000E8h], eax
  '00527FDE: mov [ebp-000000F0h], 00000008h
  '00527FE8: mov eax, 00000010h
  '00527FED: call 004081B0h
  '00527FF2: mov ecx, esp
  '00527FF4: mov edx, [ebp-000000F0h]
  '00527FFA: mov [ecx], edx
  '00527FFC: mov eax, [ebp-000000ECh]
  '00528002: mov [ecx+04h], eax
  '00528005: mov edx, [ebp-000000E8h]
  '0052800B: mov [ecx+08h], edx
  '0052800E: mov eax, [ebp-000000E4h]
  '00528014: mov [ecx+0Ch], eax
  '00528017: push 00000001h
  '00528019: push 00000043h
  '0052801B: mov ecx, [ebp+08h]
  '0052801E: mov edx, [ecx]
  '00528020: mov eax, [ebp+08h]
  '00528023: push eax
  '00528024: call [edx+00000314h]
  '0052802A: push eax
  '0052802B: lea ecx, [ebp-64h]
  '0052802E: push ecx
  '0052802F: call [004010E4h]
  '00528035: push eax
  '00528036: call [00401040h]
  '0052803C: add esp, 0000001Ch
  '0052803F: lea ecx, [ebp-64h]
  '00528042: call [004013B8h]
  '00528048: jmp 00528158h
  '0052804D: mov [ebp-04h], 00000023h
  '00528054: mov edx, [ebp+08h]
  '00528057: mov ax, [edx+36h]
  '0052805B: push eax
  '0052805C: call [00401168h]
  '00528062: mov [ebp-04h], 00000024h
  '00528069: cmp [00541024h], 00000000h
  '00528070: jnz 52808Eh
  '00528072: push 00541024h
  '00528077: push 00413334h
  '0052807C: call [004012B8h]
  '00528082: mov [ebp-00000160h], 00541024h
  '0052808C: jmp 528098h
  '0052808E: mov [ebp-00000160h], 00541024h
  '00528098: mov ecx, [ebp-00000160h]
  '0052809E: mov edx, [ecx]
  '005280A0: mov [ebp-0000012Ch], edx
  '005280A6: push 0042B4C0h
  '005280AB: push 00000000h
  '005280AD: fild dword ptr [ebp-34h]
  '005280B0: fstp real8 ptr [ebp-00000168h]
  '005280B6: mov eax, [ebp-00000164h]
  '005280BC: push eax
  '005280BD: mov ecx, [ebp-00000168h]
  '005280C3: push ecx
  '005280C4: call 00519620h
  '005280C9: mov edx, eax
  '005280CB: lea ecx, [ebp-50h]
  '005280CE: call [00401378h]
  '005280D4: push eax
  '005280D5: call [0040108Ch]
  '005280DB: mov edx, eax
  '005280DD: lea ecx, [ebp-54h]
  '005280E0: call [00401378h]
  '005280E6: lea edx, [ebp-54h]
  '005280E9: push edx
  '005280EA: mov eax, [ebp-0000012Ch]
  '005280F0: mov ecx, [eax]
  '005280F2: mov edx, [ebp-0000012Ch]
  '005280F8: push edx
  '005280F9: call [ecx+0000071Ch]
  '005280FF: fclex 
  '00528101: mov [ebp-00000130h], eax
  '00528107: cmp [ebp-00000130h], 00000000h
  '0052810E: jnl 528136h
  '00528110: push 0000071Ch
  '00528115: push 0041C118h
  '0052811A: mov eax, [ebp-0000012Ch]
  '00528120: push eax
  '00528121: mov ecx, [ebp-00000130h]
  '00528127: push ecx
  '00528128: call [004010A0h]
  '0052812E: mov [ebp-0000016Ch], eax
  '00528134: jmp 528140h
  '00528136: mov [ebp-0000016Ch], 00000000h
  '00528140: lea edx, [ebp-54h]
  '00528143: push edx
  '00528144: lea eax, [ebp-50h]
  '00528147: push eax
  '00528148: push 00000002h
  '0052814A: call [004012E8h]
  '00528150: add esp, 0000000Ch
  '00528153: jmp 00528DE1h
  '00528158: mov [ebp-04h], 00000027h
  '0052815F: call 0041BFE0h
  '00528164: mov [ebp-00000128h], eax
  '0052816A: call [0040109Ch]
  '00528170: mov ecx, [ebp-00000128h]
  '00528176: mov [ebp-40h], ecx
  '00528179: mov [ebp-04h], 00000028h
  '00528180: call 0041BFE0h
  '00528185: mov [ebp-00000128h], eax
  '0052818B: call [0040109Ch]
  '00528191: mov edx, [ebp-00000128h]
  '00528197: sub edx, [ebp-40h]
  '0052819A: jo 00528E97h
  '005281A0: cmp edx, 00002710h
  '005281A6: jnl 5281C2h
  '005281A8: mov eax, [ebp+08h]
  '005281AB: movsx ecx, word ptr [eax+4Ah]
  '005281AF: test ecx, ecx
  '005281B1: jnz 5281C2h
  '005281B3: mov [ebp-04h], 00000029h
  '005281BA: call [00401104h]
  '005281C0: jmp 528179h
  '005281C2: mov [ebp-04h], 0000002Bh
  '005281C9: push 00000000h
  '005281CB: push 00000005h
  '005281CD: mov edx, [ebp+08h]
  '005281D0: mov eax, [edx]
  '005281D2: mov ecx, [ebp+08h]
  '005281D5: push ecx
  '005281D6: call [eax+00000318h]
  '005281DC: push eax
  '005281DD: lea edx, [ebp-64h]
  '005281E0: push edx
  '005281E1: call [004010E4h]
  '005281E7: push eax
  '005281E8: lea eax, [ebp-80h]
  '005281EB: push eax
  '005281EC: call [004011E4h]
  '005281F2: add esp, 00000010h
  '005281F5: push eax
  '005281F6: call [004011DCh]
  '005281FC: fild dword ptr [ebp-44h]
  '005281FF: fstp real8 ptr [ebp-00000174h]
  '00528205: fadd real8 ptr [ebp-00000174h]
  '0052820B: fstp real4 ptr [ebp-000000E8h]
  '00528211: fstsw ax
  '00528213: test al, 0Dh
  '00528215: jnz 00528E92h
  '0052821B: mov [ebp-000000F0h], 00000004h
  '00528225: mov eax, 00000010h
  '0052822A: call 004081B0h
  '0052822F: mov ecx, esp
  '00528231: mov edx, [ebp-000000F0h]
  '00528237: mov [ecx], edx
  '00528239: mov eax, [ebp-000000ECh]
  '0052823F: mov [ecx+04h], eax
  '00528242: mov edx, [ebp-000000E8h]
  '00528248: mov [ecx+08h], edx
  '0052824B: mov eax, [ebp-000000E4h]
  '00528251: mov [ecx+0Ch], eax
  '00528254: push 00000005h
  '00528256: mov ecx, [ebp+08h]
  '00528259: mov edx, [ecx]
  '0052825B: mov eax, [ebp+08h]
  '0052825E: push eax
  '0052825F: call [edx+00000318h]
  '00528265: push eax
  '00528266: lea ecx, [ebp-68h]
  '00528269: push ecx
  '0052826A: call [004010E4h]
  '00528270: push eax
  '00528271: call [0040139Ch]
  '00528277: lea edx, [ebp-68h]
  '0052827A: push edx
  '0052827B: lea eax, [ebp-64h]
  '0052827E: push eax
  '0052827F: push 00000002h
  '00528281: call [00401064h]
  '00528287: add esp, 0000000Ch
  '0052828A: lea ecx, [ebp-80h]
  '0052828D: call [00401030h]
  '00528293: mov [ebp-04h], 0000002Ch
  '0052829A: push 00000000h
  '0052829C: push 00000005h
  '0052829E: mov ecx, [ebp+08h]
  '005282A1: mov edx, [ecx]
  '005282A3: mov eax, [ebp+08h]
  '005282A6: push eax
  '005282A7: call [edx+00000318h]
  '005282AD: push eax
  '005282AE: lea ecx, [ebp-64h]
  '005282B1: push ecx
  '005282B2: call [004010E4h]
  '005282B8: push eax
  '005282B9: lea edx, [ebp-80h]
  '005282BC: push edx
  '005282BD: call [004011E4h]
  '005282C3: add esp, 00000010h
  '005282C6: push 00000000h
  '005282C8: push 00000001h
  '005282CA: mov eax, [ebp+08h]
  '005282CD: mov ecx, [eax]
  '005282CF: mov edx, [ebp+08h]
  '005282D2: push edx
  '005282D3: call [ecx+00000318h]
  '005282D9: push eax
  '005282DA: lea eax, [ebp-68h]
  '005282DD: push eax
  '005282DE: call [004010E4h]
  '005282E4: push eax
  '005282E5: lea ecx, [ebp-00000090h]
  '005282EB: push ecx
  '005282EC: call [004011E4h]
  '005282F2: add esp, 00000010h
  '005282F5: mov [ebp-000000F8h], 0041E8E0h
  '005282FF: mov [ebp-00000100h], 00000008h
  '00528309: lea edx, [ebp-00000100h]
  '0052830F: lea ecx, [ebp-000000B0h]
  '00528315: call [00401338h]
  '0052831B: lea edx, [ebp-80h]
  '0052831E: push edx
  '0052831F: call [004011DCh]
  '00528325: fstp real4 ptr [ebp-00000178h]
  '0052832B: lea eax, [ebp-00000090h]
  '00528331: push eax
  '00528332: call [004011DCh]
  '00528338: cmp [00541000h], 00000000h
  '0052833F: jnz 528349h
  '00528341: fdivr real4 ptr [ebp-00000178h]
  '00528347: jmp 528354h
  '00528349: push [ebp-00000178h]
  '0052834F: call 004081E6h
  '00528354: fmul real4 ptr [0040739Ch]
  '0052835A: fstp real4 ptr [ebp-00000098h]
  '00528360: fstsw ax
  '00528362: test al, 0Dh
  '00528364: jnz 00528E92h
  '0052836A: mov [ebp-000000A0h], 00000004h
  '00528374: push 00000001h
  '00528376: push 00000001h
  '00528378: lea ecx, [ebp-000000B0h]
  '0052837E: push ecx
  '0052837F: lea edx, [ebp-000000A0h]
  '00528385: push edx
  '00528386: lea eax, [ebp-000000C0h]
  '0052838C: push eax
  '0052838D: call [00401094h]
  '00528393: mov [ebp-00000108h], 0042B3CCh
  '0052839D: mov [ebp-00000110h], 00000008h
  '005283A7: mov ecx, [ebp-4Ch]
  '005283AA: mov [ebp-00000118h], ecx
  '005283B0: mov [ebp-00000120h], 00000008h
  '005283BA: lea edx, [ebp-000000C0h]
  '005283C0: push edx
  '005283C1: lea eax, [ebp-00000110h]
  '005283C7: push eax
  '005283C8: lea ecx, [ebp-000000D0h]
  '005283CE: push ecx
  '005283CF: call [00401274h]
  '005283D5: push eax
  '005283D6: lea edx, [ebp-00000120h]
  '005283DC: push edx
  '005283DD: lea eax, [ebp-000000E0h]
  '005283E3: push eax
  '005283E4: call [00401274h]
  '005283EA: push eax
  '005283EB: call [0040103Ch]
  '005283F1: mov edx, eax
  '005283F3: lea ecx, [ebp-50h]
  '005283F6: call [00401378h]
  '005283FC: lea ecx, [ebp-50h]
  '005283FF: push ecx
  '00528400: mov edx, [ebp+08h]
  '00528403: mov eax, [edx]
  '00528405: mov ecx, [ebp+08h]
  '00528408: push ecx
  '00528409: call [eax+00000738h]
  '0052840F: lea ecx, [ebp-50h]
  '00528412: call [004013B4h]
  '00528418: lea edx, [ebp-68h]
  '0052841B: push edx
  '0052841C: lea eax, [ebp-64h]
  '0052841F: push eax
  '00528420: push 00000002h
  '00528422: call [00401064h]
  '00528428: add esp, 0000000Ch
  '0052842B: lea ecx, [ebp-000000E0h]
  '00528431: push ecx
  '00528432: lea edx, [ebp-000000D0h]
  '00528438: push edx
  '00528439: lea eax, [ebp-000000C0h]
  '0052843F: push eax
  '00528440: lea ecx, [ebp-000000B0h]
  '00528446: push ecx
  '00528447: lea edx, [ebp-000000A0h]
  '0052844D: push edx
  '0052844E: lea eax, [ebp-00000090h]
  '00528454: push eax
  '00528455: lea ecx, [ebp-80h]
  '00528458: push ecx
  '00528459: push 00000007h
  '0052845B: call [00401050h]
  '00528461: add esp, 00000020h
  '00528464: mov [ebp-04h], 0000002Dh
  '0052846B: call [00401104h]
  '00528471: jmp 00527EDBh
  '00528476: mov [ebp-04h], 0000002Fh
  '0052847D: mov edx, [ebp-28h]
  '00528480: sub edx, [ebp-34h]
  '00528483: jo 00528E97h
  '00528489: mov [ebp-3Ch], edx
  '0052848C: mov [ebp-04h], 00000030h
  '00528493: mov eax, [ebp-3Ch]
  '00528496: push eax
  '00528497: call [0040114Ch]
  '0052849D: mov edx, eax
  '0052849F: lea ecx, [ebp-48h]
  '005284A2: call [00401378h]
  '005284A8: mov [ebp-04h], 00000031h
  '005284AF: mov ecx, [ebp+08h]
  '005284B2: mov dx, [ecx+36h]
  '005284B6: push edx
  '005284B7: mov eax, [ebp-34h]
  '005284BA: add eax, 00000001h
  '005284BD: jo 00528E97h
  '005284C3: push eax
  '005284C4: lea ecx, [ebp-48h]
  '005284C7: push ecx
  '005284C8: push 00000000h
  '005284CA: call [0040118Ch]
  '005284D0: mov [ebp-04h], 00000032h
  '005284D7: push 00000000h
  '005284D9: push 00000008h
  '005284DB: mov edx, [ebp+08h]
  '005284DE: mov eax, [edx]
  '005284E0: mov ecx, [ebp+08h]
  '005284E3: push ecx
  '005284E4: call [eax+00000314h]
  '005284EA: push eax
  '005284EB: lea edx, [ebp-64h]
  '005284EE: push edx
  '005284EF: call [004010E4h]
  '005284F5: push eax
  '005284F6: lea eax, [ebp-80h]
  '005284F9: push eax
  '005284FA: call [004011E4h]
  '00528500: add esp, 00000010h
  '00528503: push eax
  '00528504: call [00401284h]
  '0052850A: movsx ecx, ax
  '0052850D: xor edx, edx
  '0052850F: cmp ecx, 00000007h
  '00528512: setz dl
  '00528515: neg edx
  '00528517: mov [ebp-0000012Ch], dx
  '0052851E: lea ecx, [ebp-64h]
  '00528521: call [004013B8h]
  '00528527: lea ecx, [ebp-80h]
  '0052852A: call [00401030h]
  '00528530: movsx eax, word ptr [ebp-0000012Ch]
  '00528537: test eax, eax
  '00528539: jz 005285DBh
  '0052853F: mov [ebp-04h], 00000033h
  '00528546: mov ecx, [ebp+08h]
  '00528549: mov word ptr [ecx+4Ah], 0000h
  '0052854F: mov [ebp-04h], 00000034h
  '00528556: call [00401104h]
  '0052855C: mov [ebp-04h], 00000035h
  '00528563: mov edx, [ebp-48h]
  '00528566: push edx
  '00528567: push 0042B330h
  '0052856C: call [0040108Ch]
  '00528572: mov [ebp-78h], eax
  '00528575: mov [ebp-80h], 00000008h
  '0052857C: mov eax, 00000010h
  '00528581: call 004081B0h
  '00528586: mov eax, esp
  '00528588: mov ecx, [ebp-80h]
  '0052858B: mov [eax], ecx
  '0052858D: mov edx, [ebp-7Ch]
  '00528590: mov [eax+04h], edx
  '00528593: mov ecx, [ebp-78h]
  '00528596: mov [eax+08h], ecx
  '00528599: mov edx, [ebp-74h]
  '0052859C: mov [eax+0Ch], edx
  '0052859F: push 00000001h
  '005285A1: push 00000043h
  '005285A3: mov eax, [ebp+08h]
  '005285A6: mov ecx, [eax]
  '005285A8: mov edx, [ebp+08h]
  '005285AB: push edx
  '005285AC: call [ecx+00000314h]
  '005285B2: push eax
  '005285B3: lea eax, [ebp-64h]
  '005285B6: push eax
  '005285B7: call [004010E4h]
  '005285BD: push eax
  '005285BE: call [00401040h]
  '005285C4: add esp, 0000001Ch
  '005285C7: lea ecx, [ebp-64h]
  '005285CA: call [004013B8h]
  '005285D0: lea ecx, [ebp-80h]
  '005285D3: call [00401030h]
  '005285D9: jmp 5285F5h
  '005285DB: mov [ebp-04h], 00000037h
  '005285E2: mov ecx, [ebp+08h]
  '005285E5: mov dx, [ecx+36h]
  '005285E9: push edx
  '005285EA: call [00401168h]
  '005285F0: jmp 00528DE1h
  '005285F5: mov [ebp-04h], 0000003Ah
  '005285FC: call 0041BFE0h
  '00528601: mov [ebp-00000128h], eax
  '00528607: call [0040109Ch]
  '0052860D: mov eax, [ebp-00000128h]
  '00528613: mov [ebp-40h], eax
  '00528616: mov [ebp-04h], 0000003Bh
  '0052861D: call 0041BFE0h
  '00528622: mov [ebp-00000128h], eax
  '00528628: call [0040109Ch]
  '0052862E: mov ecx, [ebp-00000128h]
  '00528634: sub ecx, [ebp-40h]
  '00528637: jo 00528E97h
  '0052863D: cmp ecx, 00002710h
  '00528643: jnl 52865Fh
  '00528645: mov edx, [ebp+08h]
  '00528648: movsx eax, word ptr [edx+4Ah]
  '0052864C: test eax, eax
  '0052864E: jnz 52865Fh
  '00528650: mov [ebp-04h], 0000003Ch
  '00528657: call [00401104h]
  '0052865D: jmp 528616h
  '0052865F: mov [ebp-04h], 0000003Eh
  '00528666: mov ecx, [ebp+08h]
  '00528669: mov dx, [ecx+36h]
  '0052866D: push edx
  '0052866E: call [00401168h]
  '00528674: mov [ebp-04h], 0000003Fh
  '0052867B: push 00000000h
  '0052867D: push 00000001h
  '0052867F: mov eax, [ebp+08h]
  '00528682: mov ecx, [eax]
  '00528684: mov edx, [ebp+08h]
  '00528687: push edx
  '00528688: call [ecx+00000318h]
  '0052868E: push eax
  '0052868F: lea eax, [ebp-64h]
  '00528692: push eax
  '00528693: call [004010E4h]
  '00528699: push eax
  '0052869A: lea ecx, [ebp-80h]
  '0052869D: push ecx
  '0052869E: call [004011E4h]
  '005286A4: add esp, 00000010h
  '005286A7: push eax
  '005286A8: call [004011DCh]
  '005286AE: fstp real4 ptr [ebp-000000E8h]
  '005286B4: mov [ebp-000000F0h], 00000004h
  '005286BE: mov eax, 00000010h
  '005286C3: call 004081B0h
  '005286C8: mov edx, esp
  '005286CA: mov eax, [ebp-000000F0h]
  '005286D0: mov [edx], eax
  '005286D2: mov ecx, [ebp-000000ECh]
  '005286D8: mov [edx+04h], ecx
  '005286DB: mov eax, [ebp-000000E8h]
  '005286E1: mov [edx+08h], eax
  '005286E4: mov ecx, [ebp-000000E4h]
  '005286EA: mov [edx+0Ch], ecx
  '005286ED: push 00000005h
  '005286EF: mov edx, [ebp+08h]
  '005286F2: mov eax, [edx]
  '005286F4: mov ecx, [ebp+08h]
  '005286F7: push ecx
  '005286F8: call [eax+00000318h]
  '005286FE: push eax
  '005286FF: lea edx, [ebp-68h]
  '00528702: push edx
  '00528703: call [004010E4h]
  '00528709: push eax
  '0052870A: call [0040139Ch]
  '00528710: lea eax, [ebp-68h]
  '00528713: push eax
  '00528714: lea ecx, [ebp-64h]
  '00528717: push ecx
  '00528718: push 00000002h
  '0052871A: call [00401064h]
  '00528720: add esp, 0000000Ch
  '00528723: lea ecx, [ebp-80h]
  '00528726: call [00401030h]
  '0052872C: mov [ebp-04h], 00000040h
  '00528733: push 0041EFA8h
  '00528738: push 00000000h
  '0052873A: push 00000007h
  '0052873C: mov edx, [ebp+08h]
  '0052873F: mov eax, [edx]
  '00528741: mov ecx, [ebp+08h]
  '00528744: push ecx
  '00528745: call [eax+0000030Ch]
  '0052874B: push eax
  '0052874C: lea edx, [ebp-64h]
  '0052874F: push edx
  '00528750: call [004010E4h]
  '00528756: push eax
  '00528757: lea eax, [ebp-80h]
  '0052875A: push eax
  '0052875B: call [004011E4h]
  '00528761: add esp, 00000010h
  '00528764: push eax
  '00528765: call [004011C8h]
  '0052876B: push eax
  '0052876C: lea ecx, [ebp-68h]
  '0052876F: push ecx
  '00528770: call [004010E4h]
  '00528776: mov [ebp-0000012Ch], eax
  '0052877C: lea edx, [ebp-00000128h]
  '00528782: push edx
  '00528783: mov eax, [ebp-0000012Ch]
  '00528789: mov ecx, [eax]
  '0052878B: mov edx, [ebp-0000012Ch]
  '00528791: push edx
  '00528792: call [ecx+1Ch]
  '00528795: fclex 
  '00528797: mov [ebp-00000130h], eax
  '0052879D: cmp [ebp-00000130h], 00000000h
  '005287A4: jnl 5287C9h
  '005287A6: push 0000001Ch
  '005287A8: push 0041EFA8h
  '005287AD: mov eax, [ebp-0000012Ch]
  '005287B3: push eax
  '005287B4: mov ecx, [ebp-00000130h]
  '005287BA: push ecx
  '005287BB: call [004010A0h]
  '005287C1: mov [ebp-0000017Ch], eax
  '005287C7: jmp 5287D3h
  '005287C9: mov [ebp-0000017Ch], 00000000h
  '005287D3: xor edx, edx
  '005287D5: cmp [ebp-00000128h], 00000001h
  '005287DC: setnl dl
  '005287DF: neg edx
  '005287E1: mov [ebp-00000134h], dx
  '005287E8: lea eax, [ebp-68h]
  '005287EB: push eax
  '005287EC: lea ecx, [ebp-64h]
  '005287EF: push ecx
  '005287F0: push 00000002h
  '005287F2: call [00401064h]
  '005287F8: add esp, 0000000Ch
  '005287FB: lea ecx, [ebp-80h]
  '005287FE: call [00401030h]
  '00528804: movsx edx, word ptr [ebp-00000134h]
  '0052880B: test edx, edx
  '0052880D: jz 005288F7h
  '00528813: mov [ebp-04h], 00000041h
  '0052881A: push 0041EFA8h
  '0052881F: push 00000000h
  '00528821: push 00000007h
  '00528823: mov eax, [ebp+08h]
  '00528826: mov ecx, [eax]
  '00528828: mov edx, [ebp+08h]
  '0052882B: push edx
  '0052882C: call [ecx+0000030Ch]
  '00528832: push eax
  '00528833: lea eax, [ebp-64h]
  '00528836: push eax
  '00528837: call [004010E4h]
  '0052883D: push eax
  '0052883E: lea ecx, [ebp-80h]
  '00528841: push ecx
  '00528842: call [004011E4h]
  '00528848: add esp, 00000010h
  '0052884B: push eax
  '0052884C: call [004011C8h]
  '00528852: push eax
  '00528853: lea edx, [ebp-68h]
  '00528856: push edx
  '00528857: call [004010E4h]
  '0052885D: mov [ebp-0000012Ch], eax
  '00528863: mov [ebp-00000088h], 00000001h
  '0052886D: mov [ebp-00000090h], 00000002h
  '00528877: lea eax, [ebp-00000090h]
  '0052887D: push eax
  '0052887E: mov ecx, [ebp-0000012Ch]
  '00528884: mov edx, [ecx]
  '00528886: mov eax, [ebp-0000012Ch]
  '0052888C: push eax
  '0052888D: call [edx+34h]
  '00528890: fclex 
  '00528892: mov [ebp-00000130h], eax
  '00528898: cmp [ebp-00000130h], 00000000h
  '0052889F: jnl 5288C4h
  '005288A1: push 00000034h
  '005288A3: push 0041EFA8h
  '005288A8: mov ecx, [ebp-0000012Ch]
  '005288AE: push ecx
  '005288AF: mov edx, [ebp-00000130h]
  '005288B5: push edx
  '005288B6: call [004010A0h]
  '005288BC: mov [ebp-00000180h], eax
  '005288C2: jmp 5288CEh
  '005288C4: mov [ebp-00000180h], 00000000h
  '005288CE: lea eax, [ebp-68h]
  '005288D1: push eax
  '005288D2: lea ecx, [ebp-64h]
  '005288D5: push ecx
  '005288D6: push 00000002h
  '005288D8: call [00401064h]
  '005288DE: add esp, 0000000Ch
  '005288E1: lea edx, [ebp-00000090h]
  '005288E7: push edx
  '005288E8: lea eax, [ebp-80h]
  '005288EB: push eax
  '005288EC: push 00000002h
  '005288EE: call [00401050h]
  '005288F4: add esp, 0000000Ch
  '005288F7: mov [ebp-04h], 00000043h
  '005288FE: call [00401104h]
  '00528904: mov [ebp-04h], 00000044h
  '0052890B: cmp [0054106Ch], 00000000h
  '00528912: jnz 528930h
  '00528914: push 0054106Ch
  '00528919: push 00411238h
  '0052891E: call [004012B8h]
  '00528924: mov [ebp-00000184h], 0054106Ch
  '0052892E: jmp 52893Ah
  '00528930: mov [ebp-00000184h], 0054106Ch
  '0052893A: mov ecx, [ebp-00000184h]
  '00528940: mov edx, [ecx]
  '00528942: mov eax, [ebp-00000184h]
  '00528948: mov ecx, [eax]
  '0052894A: mov eax, [ecx]
  '0052894C: push edx
  '0052894D: call [eax+00000324h]
  '00528953: push eax
  '00528954: lea ecx, [ebp-64h]
  '00528957: push ecx
  '00528958: call [004010E4h]
  '0052895E: mov [ebp-0000012Ch], eax
  '00528964: lea edx, [ebp-00000124h]
  '0052896A: push edx
  '0052896B: mov eax, [ebp-0000012Ch]
  '00528971: mov ecx, [eax]
  '00528973: mov edx, [ebp-0000012Ch]
  '00528979: push edx
  '0052897A: call [ecx+000000E0h]
  '00528980: fclex 
  '00528982: mov [ebp-00000130h], eax
  '00528988: cmp [ebp-00000130h], 00000000h
  '0052898F: jnl 5289B7h
  '00528991: push 000000E0h
  '00528996: push 0041E108h
  '0052899B: mov eax, [ebp-0000012Ch]
  '005289A1: push eax
  '005289A2: mov ecx, [ebp-00000130h]
  '005289A8: push ecx
  '005289A9: call [004010A0h]
  '005289AF: mov [ebp-00000188h], eax
  '005289B5: jmp 5289C1h
  '005289B7: mov [ebp-00000188h], 00000000h
  '005289C1: xor edx, edx
  '005289C3: cmp word ptr [ebp-00000124h], 0001h
  '005289CB: setz dl
  '005289CE: neg edx
  '005289D0: mov [ebp-00000134h], dx
  '005289D7: lea ecx, [ebp-64h]
  '005289DA: call [004013B8h]
  '005289E0: movsx eax, word ptr [ebp-00000134h]
  '005289E7: test eax, eax
  '005289E9: jz 00528B76h
  '005289EF: mov [ebp-04h], 00000045h
  '005289F6: mov edx, 0042A0A8h
  '005289FB: lea ecx, [ebp-50h]
  '005289FE: call [004012D8h]
  '00528A04: lea ecx, [ebp-50h]
  '00528A07: push ecx
  '00528A08: call 00517E20h
  '00528A0D: mov edx, eax
  '00528A0F: lea ecx, [ebp-54h]
  '00528A12: call [00401378h]
  '00528A18: push eax
  '00528A19: call [004013BCh]
  '00528A1F: call [0040135Ch]
  '00528A25: mov [ebp-30h], eax
  '00528A28: lea edx, [ebp-54h]
  '00528A2B: push edx
  '00528A2C: lea eax, [ebp-50h]
  '00528A2F: push eax
  '00528A30: push 00000002h
  '00528A32: call [004012E8h]
  '00528A38: add esp, 0000000Ch
  '00528A3B: mov [ebp-04h], 00000046h
  '00528A42: mov ecx, [ebp-30h]
  '00528A45: add ecx, [ebp-28h]
  '00528A48: jo 00528E97h
  '00528A4E: mov [ebp-30h], ecx
  '00528A51: mov [ebp-04h], 00000047h
  '00528A58: lea edx, [ebp-30h]
  '00528A5B: mov [ebp-000000E8h], edx
  '00528A61: mov [ebp-000000F0h], 00004003h
  '00528A6B: lea eax, [ebp-000000F0h]
  '00528A71: push eax
  '00528A72: lea ecx, [ebp-80h]
  '00528A75: push ecx
  '00528A76: call [00401344h]
  '00528A7C: lea edx, [ebp-80h]
  '00528A7F: push edx
  '00528A80: call [0040103Ch]
  '00528A86: mov edx, eax
  '00528A88: lea ecx, [ebp-54h]
  '00528A8B: call [00401378h]
  '00528A91: mov edx, 0042A0A8h
  '00528A96: lea ecx, [ebp-50h]
  '00528A99: call [004012D8h]
  '00528A9F: lea eax, [ebp-54h]
  '00528AA2: push eax
  '00528AA3: lea ecx, [ebp-50h]
  '00528AA6: push ecx
  '00528AA7: lea edx, [ebp-00000090h]
  '00528AAD: push edx
  '00528AAE: call 005180A0h
  '00528AB3: lea eax, [ebp-54h]
  '00528AB6: push eax
  '00528AB7: lea ecx, [ebp-50h]
  '00528ABA: push ecx
  '00528ABB: push 00000002h
  '00528ABD: call [004012E8h]
  '00528AC3: add esp, 0000000Ch
  '00528AC6: lea edx, [ebp-00000090h]
  '00528ACC: push edx
  '00528ACD: lea eax, [ebp-80h]
  '00528AD0: push eax
  '00528AD1: push 00000002h
  '00528AD3: call [00401050h]
  '00528AD9: add esp, 0000000Ch
  '00528ADC: mov [ebp-04h], 00000048h
  '00528AE3: mov edx, 0042A05Ch
  '00528AE8: lea ecx, [ebp-50h]
  '00528AEB: call [004012D8h]
  '00528AF1: lea ecx, [ebp-50h]
  '00528AF4: push ecx
  '00528AF5: call 00517E20h
  '00528AFA: mov edx, eax
  '00528AFC: lea ecx, [ebp-54h]
  '00528AFF: call [00401378h]
  '00528B05: push eax
  '00528B06: call [004013BCh]
  '00528B0C: fadd real8 ptr [004019B8h]
  '00528B12: fstsw ax
  '00528B14: test al, 0Dh
  '00528B16: jnz 00528E92h
  '00528B1C: sub esp, 00000008h
  '00528B1F: fstp real8 ptr [esp]
  '00528B22: call [004011F4h]
  '00528B28: mov edx, eax
  '00528B2A: lea ecx, [ebp-5Ch]
  '00528B2D: call [00401378h]
  '00528B33: mov edx, 0042A05Ch
  '00528B38: lea ecx, [ebp-58h]
  '00528B3B: call [004012D8h]
  '00528B41: lea edx, [ebp-5Ch]
  '00528B44: push edx
  '00528B45: lea eax, [ebp-58h]
  '00528B48: push eax
  '00528B49: lea ecx, [ebp-80h]
  '00528B4C: push ecx
  '00528B4D: call 005180A0h
  '00528B52: lea edx, [ebp-5Ch]
  '00528B55: push edx
  '00528B56: lea eax, [ebp-58h]
  '00528B59: push eax
  '00528B5A: lea ecx, [ebp-54h]
  '00528B5D: push ecx
  '00528B5E: lea edx, [ebp-50h]
  '00528B61: push edx
  '00528B62: push 00000004h
  '00528B64: call [004012E8h]
  '00528B6A: add esp, 00000014h
  '00528B6D: lea ecx, [ebp-80h]
  '00528B70: call [00401030h]
  '00528B76: mov [ebp-04h], 0000004Ah
  '00528B7D: mov [ebp-34h], 00000000h
  '00528B84: mov [ebp-04h], 0000004Bh
  '00528B8B: mov [ebp-000000E8h], 00000000h
  '00528B95: mov [ebp-000000F0h], 00000004h
  '00528B9F: mov eax, 00000010h
  '00528BA4: call 004081B0h
  '00528BA9: mov eax, esp
  '00528BAB: mov ecx, [ebp-000000F0h]
  '00528BB1: mov [eax], ecx
  '00528BB3: mov edx, [ebp-000000ECh]
  '00528BB9: mov [eax+04h], edx
  '00528BBC: mov ecx, [ebp-000000E8h]
  '00528BC2: mov [eax+08h], ecx
  '00528BC5: mov edx, [ebp-000000E4h]
  '00528BCB: mov [eax+0Ch], edx
  '00528BCE: push 00000005h
  '00528BD0: mov eax, [ebp+08h]
  '00528BD3: mov ecx, [eax]
  '00528BD5: mov edx, [ebp+08h]
  '00528BD8: push edx
  '00528BD9: call [ecx+00000318h]
  '00528BDF: push eax
  '00528BE0: lea eax, [ebp-64h]
  '00528BE3: push eax
  '00528BE4: call [004010E4h]
  '00528BEA: push eax
  '00528BEB: call [0040139Ch]
  '00528BF1: lea ecx, [ebp-64h]
  '00528BF4: call [004013B8h]
  '00528BFA: mov [ebp-04h], 0000004Ch
  '00528C01: call 0041BFE0h
  '00528C06: mov [ebp-00000128h], eax
  '00528C0C: call [0040109Ch]
  '00528C12: mov ecx, [ebp-00000128h]
  '00528C18: sub ecx, [ebp-2Ch]
  '00528C1B: jo 00528E97h
  '00528C21: mov [ebp-0000018Ch], ecx
  '00528C27: fild dword ptr [ebp-0000018Ch]
  '00528C2D: fstp real8 ptr [ebp-00000194h]
  '00528C33: fld real8 ptr [ebp-00000194h]
  '00528C39: cmp [00541000h], 00000000h
  '00528C40: jnz 528C4Ah
  '00528C42: fdiv real8 ptr [00404E08h]
  '00528C48: jmp 528C5Bh
  '00528C4A: push [00404E0Ch]
  '00528C50: push [00404E08h]
  '00528C56: call 004081D4h
  '00528C5B: fstsw ax
  '00528C5D: test al, 0Dh
  '00528C5F: jnz 00528E92h
  '00528C65: call [0040135Ch]
  '00528C6B: mov [ebp-2Ch], eax
  '00528C6E: mov [ebp-04h], 0000004Dh
  '00528C75: push 0042B4F0h
  '00528C7A: mov edx, [ebp-4Ch]
  '00528C7D: push edx
  '00528C7E: call [0040108Ch]
  '00528C84: mov edx, eax
  '00528C86: lea ecx, [ebp-50h]
  '00528C89: call [00401378h]
  '00528C8F: push eax
  '00528C90: push 0042B51Ch
  '00528C95: call [0040108Ch]
  '00528C9B: mov edx, eax
  '00528C9D: lea ecx, [ebp-54h]
  '00528CA0: call [00401378h]
  '00528CA6: push eax
  '00528CA7: push 00000000h
  '00528CA9: fild dword ptr [ebp-28h]
  '00528CAC: fstp real8 ptr [ebp-0000019Ch]
  '00528CB2: fild dword ptr [ebp-2Ch]
  '00528CB5: fstp real8 ptr [ebp-000001A4h]
  '00528CBB: fld real8 ptr [ebp-0000019Ch]
  '00528CC1: cmp [00541000h], 00000000h
  '00528CC8: jnz 528CD2h
  '00528CCA: fdiv real8 ptr [ebp-000001A4h]
  '00528CD0: jmp 528CE3h
  '00528CD2: push [ebp-000001A0h]
  '00528CD8: push [ebp-000001A4h]
  '00528CDE: call 004081D4h
  '00528CE3: fstsw ax
  '00528CE5: test al, 0Dh
  '00528CE7: jnz 00528E92h
  '00528CED: sub esp, 00000008h
  '00528CF0: fstp real8 ptr [esp]
  '00528CF3: call 00519620h
  '00528CF8: mov edx, eax
  '00528CFA: lea ecx, [ebp-58h]
  '00528CFD: call [00401378h]
  '00528D03: push eax
  '00528D04: call [0040108Ch]
  '00528D0A: mov edx, eax
  '00528D0C: lea ecx, [ebp-5Ch]
  '00528D0F: call [00401378h]
  '00528D15: push eax
  '00528D16: push 0042B528h
  '00528D1B: call [0040108Ch]
  '00528D21: mov edx, eax
  '00528D23: lea ecx, [ebp-60h]
  '00528D26: call [00401378h]
  '00528D2C: lea eax, [ebp-60h]
  '00528D2F: push eax
  '00528D30: mov ecx, [ebp+08h]
  '00528D33: mov edx, [ecx]
  '00528D35: mov eax, [ebp+08h]
  '00528D38: push eax
  '00528D39: call [edx+00000738h]
  '00528D3F: lea ecx, [ebp-60h]
  '00528D42: push ecx
  '00528D43: lea edx, [ebp-5Ch]
  '00528D46: push edx
  '00528D47: lea eax, [ebp-58h]
  '00528D4A: push eax
  '00528D4B: lea ecx, [ebp-54h]
  '00528D4E: push ecx
  '00528D4F: lea edx, [ebp-50h]
  '00528D52: push edx
  '00528D53: push 00000005h
  '00528D55: call [004012E8h]
  '00528D5B: add esp, 00000018h
  '00528D5E: mov [ebp-04h], 0000004Eh
  '00528D65: call [00401104h]
  '00528D6B: mov [ebp-04h], 0000004Fh
  '00528D72: mov eax, [ebp+10h]
  '00528D75: cmp word ptr [eax], FFFFh
  '00528D79: jnz 528DD1h
  '00528D7B: mov [ebp-04h], 00000050h
  '00528D82: mov ecx, [ebp+0Ch]
  '00528D85: mov edx, [ecx]
  '00528D87: push edx
  '00528D88: call 00520140h
  '00528D8D: cmp ax, FFFFh
  '00528D91: jnz 528DD1h
  '00528D93: mov [ebp-04h], 00000051h
  '00528D9A: mov eax, [ebp+0Ch]
  '00528D9D: mov ecx, [eax]
  '00528D9F: mov [ebp-000000E8h], ecx
  '00528DA5: mov [ebp-000000F0h], 00000008h
  '00528DAF: lea edx, [ebp-000000F0h]
  '00528DB5: lea ecx, [ebp-80h]
  '00528DB8: call [00401338h]
  '00528DBE: lea edx, [ebp-80h]
  '00528DC1: push edx
  '00528DC2: call [00401188h]
  '00528DC8: lea ecx, [ebp-80h]
  '00528DCB: call [00401030h]
  '00528DD1: mov [ebp-04h], 00000054h
  '00528DD8: mov eax, [ebp+08h]
  '00528DDB: mov word ptr [eax+60h], 0000h
  '00528DE1: wait 
  '00528DE2: push 00528E70h
  '00528DE7: jmp 528E5Dh
  '00528DE9: lea ecx, [ebp-60h]
  '00528DEC: push ecx
  '00528DED: lea edx, [ebp-5Ch]
  '00528DF0: push edx
  '00528DF1: lea eax, [ebp-58h]
  '00528DF4: push eax
  '00528DF5: lea ecx, [ebp-54h]
  '00528DF8: push ecx
  '00528DF9: lea edx, [ebp-50h]
  '00528DFC: push edx
  '00528DFD: push 00000005h
  '00528DFF: call [004012E8h]
  '00528E05: add esp, 00000018h
  '00528E08: lea eax, [ebp-70h]
  '00528E0B: push eax
  '00528E0C: lea ecx, [ebp-6Ch]
  '00528E0F: push ecx
  '00528E10: lea edx, [ebp-68h]
  '00528E13: push edx
  '00528E14: lea eax, [ebp-64h]
  '00528E17: push eax
  '00528E18: push 00000004h
  '00528E1A: call [00401064h]
  '00528E20: add esp, 00000014h
  '00528E23: lea ecx, [ebp-000000E0h]
  '00528E29: push ecx
  '00528E2A: lea edx, [ebp-000000D0h]
  '00528E30: push edx
  '00528E31: lea eax, [ebp-000000C0h]
  '00528E37: push eax
  '00528E38: lea ecx, [ebp-000000B0h]
  '00528E3E: push ecx
  '00528E3F: lea edx, [ebp-000000A0h]
  '00528E45: push edx
  '00528E46: lea eax, [ebp-00000090h]
  '00528E4C: push eax
  '00528E4D: lea ecx, [ebp-80h]
  '00528E50: push ecx
  '00528E51: push 00000007h
  '00528E53: call [00401050h]
  '00528E59: add esp, 00000020h
  '00528E5C: ret 
End Sub
Private Sub unknown_521510
  '00521510: push ebp
  '00521511: mov ebp, esp
  '00521513: sub esp, 00000018h
  '00521516: push 004081B6h
  '0052151B: mov eax, fs:[00h]
  '00521521: push eax
  '00521522: mov fs:[00000000h], esp
  '00521529: mov eax, 00000098h
  '0052152E: call 004081B0h
  '00521533: push ebx
  '00521534: push esi
  '00521535: push edi
  '00521536: mov [ebp-18h], esp
  '00521539: mov [ebp-14h], 00406EC8h
  '00521540: mov [ebp-10h], 00000000h
  '00521547: mov [ebp-0Ch], 00000000h
  '0052154E: mov [ebp-04h], 00000001h
  '00521555: mov [ebp-04h], 00000002h
  '0052155C: push FFFFFFFFh
  '0052155E: call [004010E8h]
  '00521564: mov [ebp-04h], 00000003h
  '0052156B: mov eax, [ebp+0Ch]
  '0052156E: cmp [eax], 00000001h
  '00521571: jnz 005219BBh
  '00521577: mov [ebp-04h], 00000004h
  '0052157E: push 00000000h
  '00521580: push 00000008h
  '00521582: mov ecx, [ebp+08h]
  '00521585: mov edx, [ecx]
  '00521587: mov eax, [ebp+08h]
  '0052158A: push eax
  '0052158B: call [edx+00000314h]
  '00521591: push eax
  '00521592: lea ecx, [ebp-2Ch]
  '00521595: push ecx
  '00521596: call [004010E4h]
  '0052159C: push eax
  '0052159D: lea edx, [ebp-40h]
  '005215A0: push edx
  '005215A1: call [004011E4h]
  '005215A7: add esp, 00000010h
  '005215AA: push eax
  '005215AB: call [00401284h]
  '005215B1: neg ax
  '005215B4: sbb eax, eax
  '005215B6: neg eax
  '005215B8: neg eax
  '005215BA: mov [ebp-74h], ax
  '005215BE: lea ecx, [ebp-2Ch]
  '005215C1: call [004013B8h]
  '005215C7: lea ecx, [ebp-40h]
  '005215CA: call [00401030h]
  '005215D0: movsx eax, word ptr [ebp-74h]
  '005215D4: test eax, eax
  '005215D6: jz 521610h
  '005215D8: mov [ebp-04h], 00000005h
  '005215DF: push 00000000h
  '005215E1: push 00000046h
  '005215E3: mov ecx, [ebp+08h]
  '005215E6: mov edx, [ecx]
  '005215E8: mov eax, [ebp+08h]
  '005215EB: push eax
  '005215EC: call [edx+00000314h]
  '005215F2: push eax
  '005215F3: lea ecx, [ebp-2Ch]
  '005215F6: push ecx
  '005215F7: call [004010E4h]
  '005215FD: push eax
  '005215FE: call [00401040h]
  '00521604: add esp, 0000000Ch
  '00521607: lea ecx, [ebp-2Ch]
  '0052160A: call [004013B8h]
  '00521610: mov [ebp-04h], 00000007h
  '00521617: cmp [0054106Ch], 00000000h
  '0052161E: jnz 52163Ch
  '00521620: push 0054106Ch
  '00521625: push 00411238h
  '0052162A: call [004012B8h]
  '00521630: mov [ebp-0000009Ch], 0054106Ch
  '0052163A: jmp 521646h
  '0052163C: mov [ebp-0000009Ch], 0054106Ch
  '00521646: mov edx, [ebp-0000009Ch]
  '0052164C: mov eax, [edx]
  '0052164E: mov ecx, [ebp-0000009Ch]
  '00521654: mov edx, [ecx]
  '00521656: mov ecx, [edx]
  '00521658: push eax
  '00521659: call [ecx+000003B4h]
  '0052165F: push eax
  '00521660: lea edx, [ebp-2Ch]
  '00521663: push edx
  '00521664: call [004010E4h]
  '0052166A: mov [ebp-74h], eax
  '0052166D: lea eax, [ebp-24h]
  '00521670: push eax
  '00521671: mov ecx, [ebp-74h]
  '00521674: mov edx, [ecx]
  '00521676: mov eax, [ebp-74h]
  '00521679: push eax
  '0052167A: call [edx+000000A0h]
  '00521680: fclex 
  '00521682: mov [ebp-78h], eax
  '00521685: cmp [ebp-78h], 00000000h
  '00521689: jnl 5216ABh
  '0052168B: push 000000A0h
  '00521690: push 0041E3FCh
  '00521695: mov ecx, [ebp-74h]
  '00521698: push ecx
  '00521699: mov edx, [ebp-78h]
  '0052169C: push edx
  '0052169D: call [004010A0h]
  '005216A3: mov [ebp-000000A0h], eax
  '005216A9: jmp 5216B5h
  '005216AB: mov [ebp-000000A0h], 00000000h
  '005216B5: mov eax, [ebp-24h]
  '005216B8: push eax
  '005216B9: call [004012E0h]
  '005216BF: mov [ebp-58h], eax
  '005216C2: mov [ebp-60h], 00000003h
  '005216C9: mov eax, 00000010h
  '005216CE: call 004081B0h
  '005216D3: mov ecx, esp
  '005216D5: mov edx, [ebp-60h]
  '005216D8: mov [ecx], edx
  '005216DA: mov eax, [ebp-5Ch]
  '005216DD: mov [ecx+04h], eax
  '005216E0: mov edx, [ebp-58h]
  '005216E3: mov [ecx+08h], edx
  '005216E6: mov eax, [ebp-54h]
  '005216E9: mov [ecx+0Ch], eax
  '005216EC: push 00000002h
  '005216EE: mov ecx, [ebp+08h]
  '005216F1: mov edx, [ecx]
  '005216F3: mov eax, [ebp+08h]
  '005216F6: push eax
  '005216F7: call [edx+00000314h]
  '005216FD: push eax
  '005216FE: lea ecx, [ebp-30h]
  '00521701: push ecx
  '00521702: call [004010E4h]
  '00521708: push eax
  '00521709: call [0040139Ch]
  '0052170F: lea ecx, [ebp-24h]
  '00521712: call [004013B4h]
  '00521718: lea edx, [ebp-30h]
  '0052171B: push edx
  '0052171C: lea eax, [ebp-2Ch]
  '0052171F: push eax
  '00521720: push 00000002h
  '00521722: call [00401064h]
  '00521728: add esp, 0000000Ch
  '0052172B: mov [ebp-04h], 00000008h
  '00521732: push 00000000h
  '00521734: push 00000041h
  '00521736: mov ecx, [ebp+08h]
  '00521739: mov edx, [ecx]
  '0052173B: mov eax, [ebp+08h]
  '0052173E: push eax
  '0052173F: call [edx+00000314h]
  '00521745: push eax
  '00521746: lea ecx, [ebp-2Ch]
  '00521749: push ecx
  '0052174A: call [004010E4h]
  '00521750: push eax
  '00521751: call [00401040h]
  '00521757: add esp, 0000000Ch
  '0052175A: lea ecx, [ebp-2Ch]
  '0052175D: call [004013B8h]
  '00521763: mov [ebp-04h], 00000009h
  '0052176A: call [00401104h]
  '00521770: mov [ebp-04h], 0000000Ah
  '00521777: push 00000000h
  '00521779: push 00000008h
  '0052177B: mov edx, [ebp+08h]
  '0052177E: mov eax, [edx]
  '00521780: mov ecx, [ebp+08h]
  '00521783: push ecx
  '00521784: call [eax+00000314h]
  '0052178A: push eax
  '0052178B: lea edx, [ebp-2Ch]
  '0052178E: push edx
  '0052178F: call [004010E4h]
  '00521795: push eax
  '00521796: lea eax, [ebp-40h]
  '00521799: push eax
  '0052179A: call [004011E4h]
  '005217A0: add esp, 00000010h
  '005217A3: push eax
  '005217A4: call [00401284h]
  '005217AA: movsx ecx, ax
  '005217AD: xor edx, edx
  '005217AF: cmp ecx, 00000002h
  '005217B2: setz dl
  '005217B5: neg edx
  '005217B7: mov [ebp-74h], dx
  '005217BB: lea ecx, [ebp-2Ch]
  '005217BE: call [004013B8h]
  '005217C4: lea ecx, [ebp-40h]
  '005217C7: call [00401030h]
  '005217CD: movsx eax, word ptr [ebp-74h]
  '005217D1: test eax, eax
  '005217D3: jz 00521985h
  '005217D9: mov [ebp-04h], 0000000Bh
  '005217E0: push 0041E410h
  '005217E5: push 00000000h
  '005217E7: push 00000002h
  '005217E9: mov ecx, [ebp+08h]
  '005217EC: mov edx, [ecx]
  '005217EE: mov eax, [ebp+08h]
  '005217F1: push eax
  '005217F2: call [edx+00000314h]
  '005217F8: push eax
  '005217F9: lea ecx, [ebp-2Ch]
  '005217FC: push ecx
  '005217FD: call [004010E4h]
  '00521803: push eax
  '00521804: lea edx, [ebp-40h]
  '00521807: push edx
  '00521808: call [004011E4h]
  '0052180E: add esp, 00000010h
  '00521811: push eax
  '00521812: call [0040130Ch]
  '00521818: push eax
  '00521819: call [00401024h]
  '0052181F: mov edx, eax
  '00521821: lea ecx, [ebp-24h]
  '00521824: call [00401378h]
  '0052182A: push eax
  '0052182B: call [0040108Ch]
  '00521831: mov edx, eax
  '00521833: lea ecx, [ebp-28h]
  '00521836: call [00401378h]
  '0052183C: lea eax, [ebp-28h]
  '0052183F: push eax
  '00521840: mov ecx, [ebp+08h]
  '00521843: mov edx, [ecx]
  '00521845: mov eax, [ebp+08h]
  '00521848: push eax
  '00521849: call [edx+00000738h]
  '0052184F: lea ecx, [ebp-28h]
  '00521852: push ecx
  '00521853: lea edx, [ebp-24h]
  '00521856: push edx
  '00521857: push 00000002h
  '00521859: call [004012E8h]
  '0052185F: add esp, 0000000Ch
  '00521862: lea ecx, [ebp-2Ch]
  '00521865: call [004013B8h]
  '0052186B: lea ecx, [ebp-40h]
  '0052186E: call [00401030h]
  '00521874: mov [ebp-04h], 0000000Ch
  '0052187B: cmp [00541024h], 00000000h
  '00521882: jnz 5218A0h
  '00521884: push 00541024h
  '00521889: push 00413334h
  '0052188E: call [004012B8h]
  '00521894: mov [ebp-000000A4h], 00541024h
  '0052189E: jmp 5218AAh
  '005218A0: mov [ebp-000000A4h], 00541024h
  '005218AA: mov eax, [ebp-000000A4h]
  '005218B0: mov ecx, [eax]
  '005218B2: mov [ebp-74h], ecx
  '005218B5: push 0042B128h
  '005218BA: push 00000000h
  '005218BC: push 00000002h
  '005218BE: mov edx, [ebp+08h]
  '005218C1: mov eax, [edx]
  '005218C3: mov ecx, [ebp+08h]
  '005218C6: push ecx
  '005218C7: call [eax+00000314h]
  '005218CD: push eax
  '005218CE: lea edx, [ebp-2Ch]
  '005218D1: push edx
  '005218D2: call [004010E4h]
  '005218D8: push eax
  '005218D9: lea eax, [ebp-40h]
  '005218DC: push eax
  '005218DD: call [004011E4h]
  '005218E3: add esp, 00000010h
  '005218E6: push eax
  '005218E7: call [0040130Ch]
  '005218ED: push eax
  '005218EE: call [00401024h]
  '005218F4: mov edx, eax
  '005218F6: lea ecx, [ebp-24h]
  '005218F9: call [00401378h]
  '005218FF: push eax
  '00521900: call [0040108Ch]
  '00521906: mov edx, eax
  '00521908: lea ecx, [ebp-28h]
  '0052190B: call [00401378h]
  '00521911: lea ecx, [ebp-28h]
  '00521914: push ecx
  '00521915: push 00541052h
  '0052191A: mov edx, [ebp-74h]
  '0052191D: mov eax, [edx]
  '0052191F: mov ecx, [ebp-74h]
  '00521922: push ecx
  '00521923: call [eax+00000714h]
  '00521929: fclex 
  '0052192B: mov [ebp-78h], eax
  '0052192E: cmp [ebp-78h], 00000000h
  '00521932: jnl 521954h
  '00521934: push 00000714h
  '00521939: push 0041C118h
  '0052193E: mov edx, [ebp-74h]
  '00521941: push edx
  '00521942: mov eax, [ebp-78h]
  '00521945: push eax
  '00521946: call [004010A0h]
  '0052194C: mov [ebp-000000A8h], eax
  '00521952: jmp 52195Eh
  '00521954: mov [ebp-000000A8h], 00000000h
  '0052195E: lea ecx, [ebp-28h]
  '00521961: push ecx
  '00521962: lea edx, [ebp-24h]
  '00521965: push edx
  '00521966: push 00000002h
  '00521968: call [004012E8h]
  '0052196E: add esp, 0000000Ch
  '00521971: lea ecx, [ebp-2Ch]
  '00521974: call [004013B8h]
  '0052197A: lea ecx, [ebp-40h]
  '0052197D: call [00401030h]
  '00521983: jmp 5219B6h
  '00521985: mov [ebp-04h], 0000000Eh
  '0052198C: mov edx, 0041E484h
  '00521991: lea ecx, [ebp-24h]
  '00521994: call [004012D8h]
  '0052199A: lea eax, [ebp-24h]
  '0052199D: push eax
  '0052199E: mov ecx, [ebp+08h]
  '005219A1: mov edx, [ecx]
  '005219A3: mov eax, [ebp+08h]
  '005219A6: push eax
  '005219A7: call [edx+00000738h]
  '005219AD: lea ecx, [ebp-24h]
  '005219B0: call [004013B4h]
  '005219B6: jmp 00521C4Ch
  '005219BB: mov [ebp-04h], 00000011h
  '005219C2: push 00000000h
  '005219C4: push 00000008h
  '005219C6: mov ecx, [ebp+08h]
  '005219C9: mov edx, [ecx]
  '005219CB: mov eax, [ebp+08h]
  '005219CE: push eax
  '005219CF: call [edx+00000314h]
  '005219D5: push eax
  '005219D6: lea ecx, [ebp-2Ch]
  '005219D9: push ecx
  '005219DA: call [004010E4h]
  '005219E0: push eax
  '005219E1: lea edx, [ebp-40h]
  '005219E4: push edx
  '005219E5: call [004011E4h]
  '005219EB: add esp, 00000010h
  '005219EE: push eax
  '005219EF: call [00401284h]
  '005219F5: neg ax
  '005219F8: sbb eax, eax
  '005219FA: neg eax
  '005219FC: neg eax
  '005219FE: mov [ebp-74h], ax
  '00521A02: lea ecx, [ebp-2Ch]
  '00521A05: call [004013B8h]
  '00521A0B: lea ecx, [ebp-40h]
  '00521A0E: call [00401030h]
  '00521A14: movsx eax, word ptr [ebp-74h]
  '00521A18: test eax, eax
  '00521A1A: jz 521A54h
  '00521A1C: mov [ebp-04h], 00000012h
  '00521A23: push 00000000h
  '00521A25: push 00000046h
  '00521A27: mov ecx, [ebp+08h]
  '00521A2A: mov edx, [ecx]
  '00521A2C: mov eax, [ebp+08h]
  '00521A2F: push eax
  '00521A30: call [edx+00000314h]
  '00521A36: push eax
  '00521A37: lea ecx, [ebp-2Ch]
  '00521A3A: push ecx
  '00521A3B: call [004010E4h]
  '00521A41: push eax
  '00521A42: call [00401040h]
  '00521A48: add esp, 0000000Ch
  '00521A4B: lea ecx, [ebp-2Ch]
  '00521A4E: call [004013B8h]
  '00521A54: mov [ebp-04h], 00000014h
  '00521A5B: cmp [00541024h], 00000000h
  '00521A62: jnz 521A80h
  '00521A64: push 00541024h
  '00521A69: push 00413334h
  '00521A6E: call [004012B8h]
  '00521A74: mov [ebp-000000ACh], 00541024h
  '00521A7E: jmp 521A8Ah
  '00521A80: mov [ebp-000000ACh], 00541024h
  '00521A8A: mov edx, [ebp-000000ACh]
  '00521A90: mov eax, [edx]
  '00521A92: mov [ebp-74h], eax
  '00521A95: lea ecx, [ebp-24h]
  '00521A98: push ecx
  '00521A99: mov edx, [ebp-74h]
  '00521A9C: mov eax, [edx]
  '00521A9E: mov ecx, [ebp-74h]
  '00521AA1: push ecx
  '00521AA2: call [eax+00000700h]
  '00521AA8: fclex 
  '00521AAA: mov [ebp-78h], eax
  '00521AAD: cmp [ebp-78h], 00000000h
  '00521AB1: jnl 521AD3h
  '00521AB3: push 00000700h
  '00521AB8: push 0041C118h
  '00521ABD: mov edx, [ebp-74h]
  '00521AC0: push edx
  '00521AC1: mov eax, [ebp-78h]
  '00521AC4: push eax
  '00521AC5: call [004010A0h]
  '00521ACB: mov [ebp-000000B0h], eax
  '00521AD1: jmp 521ADDh
  '00521AD3: mov [ebp-000000B0h], 00000000h
  '00521ADD: mov ecx, [ebp-24h]
  '00521AE0: push ecx
  '00521AE1: call [0040107Ch]
  '00521AE7: mov [ebp-38h], eax
  '00521AEA: mov [ebp-40h], 00000008h
  '00521AF1: cmp [0054106Ch], 00000000h
  '00521AF8: jnz 521B16h
  '00521AFA: push 0054106Ch
  '00521AFF: push 00411238h
  '00521B04: call [004012B8h]
  '00521B0A: mov [ebp-000000B4h], 0054106Ch
  '00521B14: jmp 521B20h
  '00521B16: mov [ebp-000000B4h], 0054106Ch
  '00521B20: mov edx, [ebp-000000B4h]
  '00521B26: mov eax, [edx]
  '00521B28: mov ecx, [ebp-000000B4h]
  '00521B2E: mov edx, [ecx]
  '00521B30: mov ecx, [edx]
  '00521B32: push eax
  '00521B33: call [ecx+000003C0h]
  '00521B39: push eax
  '00521B3A: lea edx, [ebp-2Ch]
  '00521B3D: push edx
  '00521B3E: call [004010E4h]
  '00521B44: mov [ebp-7Ch], eax
  '00521B47: lea eax, [ebp-28h]
  '00521B4A: push eax
  '00521B4B: mov ecx, [ebp-7Ch]
  '00521B4E: mov edx, [ecx]
  '00521B50: mov eax, [ebp-7Ch]
  '00521B53: push eax
  '00521B54: call [edx+000000A0h]
  '00521B5A: fclex 
  '00521B5C: mov [ebp-80h], eax
  '00521B5F: cmp [ebp-80h], 00000000h
  '00521B63: jnl 521B85h
  '00521B65: push 000000A0h
  '00521B6A: push 0041E3FCh
  '00521B6F: mov ecx, [ebp-7Ch]
  '00521B72: push ecx
  '00521B73: mov edx, [ebp-80h]
  '00521B76: push edx
  '00521B77: call [004010A0h]
  '00521B7D: mov [ebp-000000B8h], eax
  '00521B83: jmp 521B8Fh
  '00521B85: mov [ebp-000000B8h], 00000000h
  '00521B8F: mov eax, [ebp-28h]
  '00521B92: mov [ebp-00000098h], eax
  '00521B98: mov [ebp-28h], 00000000h
  '00521B9F: mov ecx, [ebp-00000098h]
  '00521BA5: mov [ebp-48h], ecx
  '00521BA8: mov [ebp-50h], 00000008h
  '00521BAF: mov eax, 00000010h
  '00521BB4: call 004081B0h
  '00521BB9: mov edx, esp
  '00521BBB: mov eax, [ebp-40h]
  '00521BBE: mov [edx], eax
  '00521BC0: mov ecx, [ebp-3Ch]
  '00521BC3: mov [edx+04h], ecx
  '00521BC6: mov eax, [ebp-38h]
  '00521BC9: mov [edx+08h], eax
  '00521BCC: mov ecx, [ebp-34h]
  '00521BCF: mov [edx+0Ch], ecx
  '00521BD2: mov eax, 00000010h
  '00521BD7: call 004081B0h
  '00521BDC: mov edx, esp
  '00521BDE: mov eax, [ebp-50h]
  '00521BE1: mov [edx], eax
  '00521BE3: mov ecx, [ebp-4Ch]
  '00521BE6: mov [edx+04h], ecx
  '00521BE9: mov eax, [ebp-48h]
  '00521BEC: mov [edx+08h], eax
  '00521BEF: mov ecx, [ebp-44h]
  '00521BF2: mov [edx+0Ch], ecx
  '00521BF5: push 00000002h
  '00521BF7: push 00000040h
  '00521BF9: mov edx, [ebp+08h]
  '00521BFC: mov eax, [edx]
  '00521BFE: mov ecx, [ebp+08h]
  '00521C01: push ecx
  '00521C02: call [eax+00000314h]
  '00521C08: push eax
  '00521C09: lea edx, [ebp-30h]
  '00521C0C: push edx
  '00521C0D: call [004010E4h]
  '00521C13: push eax
  '00521C14: call [00401040h]
  '00521C1A: add esp, 0000002Ch
  '00521C1D: lea ecx, [ebp-24h]
  '00521C20: call [004013B4h]
  '00521C26: lea eax, [ebp-30h]
  '00521C29: push eax
  '00521C2A: lea ecx, [ebp-2Ch]
  '00521C2D: push ecx
  '00521C2E: push 00000002h
  '00521C30: call [00401064h]
  '00521C36: add esp, 0000000Ch
  '00521C39: lea edx, [ebp-50h]
  '00521C3C: push edx
  '00521C3D: lea eax, [ebp-40h]
  '00521C40: push eax
  '00521C41: push 00000002h
  '00521C43: call [00401050h]
  '00521C49: add esp, 0000000Ch
  '00521C4C: push 00521C8Eh
  '00521C51: jmp 521C8Dh
  '00521C53: lea ecx, [ebp-28h]
  '00521C56: push ecx
  '00521C57: lea edx, [ebp-24h]
  '00521C5A: push edx
  '00521C5B: push 00000002h
  '00521C5D: call [004012E8h]
  '00521C63: add esp, 0000000Ch
  '00521C66: lea eax, [ebp-30h]
  '00521C69: push eax
  '00521C6A: lea ecx, [ebp-2Ch]
  '00521C6D: push ecx
  '00521C6E: push 00000002h
  '00521C70: call [00401064h]
  '00521C76: add esp, 0000000Ch
  '00521C79: lea edx, [ebp-50h]
  '00521C7C: push edx
  '00521C7D: lea eax, [ebp-40h]
  '00521C80: push eax
  '00521C81: push 00000002h
  '00521C83: call [00401050h]
  '00521C89: add esp, 0000000Ch
  '00521C8C: ret 
End Sub
Private Sub unknown_5262E0
  '005262E0: push ebp
  '005262E1: mov ebp, esp
  '005262E3: sub esp, 00000008h
  '005262E6: push 004081B6h
  '005262EB: mov eax, fs:[00h]
  '005262F1: push eax
  '005262F2: mov fs:[00000000h], esp
  '005262F9: sub esp, 00000050h
  '005262FC: push ebx
  '005262FD: push esi
  '005262FE: push edi
  '005262FF: mov [ebp-08h], esp
  '00526302: mov [ebp-04h], 004071F8h
  '00526309: mov eax, [ebp+08h]
  '0052630C: xor edi, edi
  '0052630E: push 0041E958h
  '00526313: push edi
  '00526314: mov ecx, [eax]
  '00526316: push 00000003h
  '00526318: push eax
  '00526319: mov [ebp-14h], edi
  '0052631C: mov [ebp-18h], edi
  '0052631F: mov [ebp-1Ch], edi
  '00526322: mov [ebp-2Ch], edi
  '00526325: mov [ebp-3Ch], edi
  '00526328: call [ecx+0000031Ch]
  '0052632E: mov esi, [004010E4h]
  '00526334: lea edx, [ebp-14h]
  '00526337: push eax
  '00526338: push edx
  '00526339: call esi
  '0052633B: push eax
  '0052633C: lea eax, [ebp-2Ch]
  '0052633F: push eax
  '00526340: call [004011E4h]
  '00526346: add esp, 00000010h
  '00526349: push eax
  '0052634A: call [004011C8h]
  '00526350: lea ecx, [ebp-18h]
  '00526353: push eax
  '00526354: push ecx
  '00526355: call esi
  '00526357: mov esi, eax
  '00526359: mov ebx, 00000002h
  '0052635E: lea eax, [ebp-1Ch]
  '00526361: lea ecx, [ebp-3Ch]
  '00526364: mov [ebp-34h], ebx
  '00526367: mov [ebp-3Ch], ebx
  '0052636A: mov edx, [esi]
  '0052636C: push eax
  '0052636D: push ecx
  '0052636E: push esi
  '0052636F: call [edx+24h]
  '00526372: cmp eax, edi
  '00526374: fclex 
  '00526376: jnl 526387h
  '00526378: push 00000024h
  '0052637A: push 0041E958h
  '0052637F: push esi
  '00526380: push eax
  '00526381: call [004010A0h]
  '00526387: mov ecx, [ebp+0Ch]
  '0052638A: mov eax, [ebp-1Ch]
  '0052638D: mov esi, eax
  '0052638F: mov ecx, [ecx]
  '00526391: mov edx, [eax]
  '00526393: push ecx
  '00526394: push eax
  '00526395: call [edx+00000080h]
  '0052639B: cmp eax, edi
  '0052639D: fclex 
  '0052639F: jnl 5263B3h
  '005263A1: push 00000080h
  '005263A6: push 0041E968h
  '005263AB: push esi
  '005263AC: push eax
  '005263AD: call [004010A0h]
  '005263B3: lea edx, [ebp-1Ch]
  '005263B6: lea eax, [ebp-18h]
  '005263B9: push edx
  '005263BA: lea ecx, [ebp-14h]
  '005263BD: push eax
  '005263BE: push ecx
  '005263BF: push 00000003h
  '005263C1: call [00401064h]
  '005263C7: lea edx, [ebp-3Ch]
  '005263CA: lea eax, [ebp-2Ch]
  '005263CD: push edx
  '005263CE: push eax
  '005263CF: push ebx
  '005263D0: call [00401050h]
  '005263D6: add esp, 0000001Ch
  '005263D9: push 00526409h
  '005263DE: jmp 526408h
  '005263E0: lea ecx, [ebp-1Ch]
  '005263E3: lea edx, [ebp-18h]
  '005263E6: push ecx
  '005263E7: lea eax, [ebp-14h]
  '005263EA: push edx
  '005263EB: push eax
  '005263EC: push 00000003h
  '005263EE: call [00401064h]
  '005263F4: lea ecx, [ebp-3Ch]
  '005263F7: lea edx, [ebp-2Ch]
  '005263FA: push ecx
  '005263FB: push edx
  '005263FC: push 00000002h
  '005263FE: call [00401050h]
  '00526404: add esp, 0000001Ch
  '00526407: ret 
End Sub
Private Sub unknown_528EA0
  '00528EA0: push ebp
  '00528EA1: mov ebp, esp
  '00528EA3: sub esp, 00000018h
  '00528EA6: push 004081B6h
  '00528EAB: mov eax, fs:[00h]
  '00528EB1: push eax
  '00528EB2: mov fs:[00000000h], esp
  '00528EB9: mov eax, 00000088h
  '00528EBE: call 004081B0h
  '00528EC3: push ebx
  '00528EC4: push esi
  '00528EC5: push edi
  '00528EC6: mov [ebp-18h], esp
  '00528EC9: mov [ebp-14h], 00407518h
  '00528ED0: mov [ebp-10h], 00000000h
  '00528ED7: mov [ebp-0Ch], 00000000h
  '00528EDE: mov [ebp-04h], 00000001h
  '00528EE5: mov [ebp-04h], 00000002h
  '00528EEC: push FFFFFFFFh
  '00528EEE: call [004010E8h]
  '00528EF4: mov [ebp-04h], 00000003h
  '00528EFB: push 00000000h
  '00528EFD: push 00000008h
  '00528EFF: mov eax, [ebp+08h]
  '00528F02: mov ecx, [eax]
  '00528F04: mov edx, [ebp+08h]
  '00528F07: push edx
  '00528F08: call [ecx+00000314h]
  '00528F0E: push eax
  '00528F0F: lea eax, [ebp-30h]
  '00528F12: push eax
  '00528F13: call [004010E4h]
  '00528F19: push eax
  '00528F1A: lea ecx, [ebp-44h]
  '00528F1D: push ecx
  '00528F1E: call [004011E4h]
  '00528F24: add esp, 00000010h
  '00528F27: push eax
  '00528F28: call [00401284h]
  '00528F2E: movsx edx, ax
  '00528F31: neg edx
  '00528F33: sbb edx, edx
  '00528F35: neg edx
  '00528F37: neg edx
  '00528F39: mov [ebp-68h], dx
  '00528F3D: lea ecx, [ebp-30h]
  '00528F40: call [004013B8h]
  '00528F46: lea ecx, [ebp-44h]
  '00528F49: call [00401030h]
  '00528F4F: movsx eax, word ptr [ebp-68h]
  '00528F53: test eax, eax
  '00528F55: jz 528F8Fh
  '00528F57: mov [ebp-04h], 00000004h
  '00528F5E: push 00000000h
  '00528F60: push 00000046h
  '00528F62: mov ecx, [ebp+08h]
  '00528F65: mov edx, [ecx]
  '00528F67: mov eax, [ebp+08h]
  '00528F6A: push eax
  '00528F6B: call [edx+00000314h]
  '00528F71: push eax
  '00528F72: lea ecx, [ebp-30h]
  '00528F75: push ecx
  '00528F76: call [004010E4h]
  '00528F7C: push eax
  '00528F7D: call [00401040h]
  '00528F83: add esp, 0000000Ch
  '00528F86: lea ecx, [ebp-30h]
  '00528F89: call [004013B8h]
  '00528F8F: mov [ebp-04h], 00000006h
  '00528F96: cmp [0054106Ch], 00000000h
  '00528F9D: jnz 528FBBh
  '00528F9F: push 0054106Ch
  '00528FA4: push 00411238h
  '00528FA9: call [004012B8h]
  '00528FAF: mov [ebp-00000088h], 0054106Ch
  '00528FB9: jmp 528FC5h
  '00528FBB: mov [ebp-00000088h], 0054106Ch
  '00528FC5: mov edx, [ebp-00000088h]
  '00528FCB: mov eax, [edx]
  '00528FCD: mov ecx, [ebp-00000088h]
  '00528FD3: mov edx, [ecx]
  '00528FD5: mov ecx, [edx]
  '00528FD7: push eax
  '00528FD8: call [ecx+000003C0h]
  '00528FDE: push eax
  '00528FDF: lea edx, [ebp-30h]
  '00528FE2: push edx
  '00528FE3: call [004010E4h]
  '00528FE9: mov [ebp-68h], eax
  '00528FEC: lea eax, [ebp-2Ch]
  '00528FEF: push eax
  '00528FF0: mov ecx, [ebp-68h]
  '00528FF3: mov edx, [ecx]
  '00528FF5: mov eax, [ebp-68h]
  '00528FF8: push eax
  '00528FF9: call [edx+000000A0h]
  '00528FFF: fclex 
  '00529001: mov [ebp-6Ch], eax
  '00529004: cmp [ebp-6Ch], 00000000h
  '00529008: jnl 52902Ah
  '0052900A: push 000000A0h
  '0052900F: push 0041E3FCh
  '00529014: mov ecx, [ebp-68h]
  '00529017: push ecx
  '00529018: mov edx, [ebp-6Ch]
  '0052901B: push edx
  '0052901C: call [004010A0h]
  '00529022: mov [ebp-0000008Ch], eax
  '00529028: jmp 529034h
  '0052902A: mov [ebp-0000008Ch], 00000000h
  '00529034: mov eax, [ebp-2Ch]
  '00529037: push eax
  '00529038: push 0041BC60h
  '0052903D: call [00401184h]
  '00529043: neg eax
  '00529045: sbb eax, eax
  '00529047: inc eax
  '00529048: neg eax
  '0052904A: mov [ebp-70h], ax
  '0052904E: lea ecx, [ebp-2Ch]
  '00529051: call [004013B4h]
  '00529057: lea ecx, [ebp-30h]
  '0052905A: call [004013B8h]
  '00529060: movsx ecx, word ptr [ebp-70h]
  '00529064: test ecx, ecx
  '00529066: jz 00529128h
  '0052906C: mov [ebp-04h], 00000007h
  '00529073: cmp [0054106Ch], 00000000h
  '0052907A: jnz 529098h
  '0052907C: push 0054106Ch
  '00529081: push 00411238h
  '00529086: call [004012B8h]
  '0052908C: mov [ebp-00000090h], 0054106Ch
  '00529096: jmp 5290A2h
  '00529098: mov [ebp-00000090h], 0054106Ch
  '005290A2: mov edx, [ebp-00000090h]
  '005290A8: mov eax, [edx]
  '005290AA: mov ecx, [ebp-00000090h]
  '005290B0: mov edx, [ecx]
  '005290B2: mov ecx, [edx]
  '005290B4: push eax
  '005290B5: call [ecx+000003C0h]
  '005290BB: push eax
  '005290BC: lea edx, [ebp-30h]
  '005290BF: push edx
  '005290C0: call [004010E4h]
  '005290C6: mov [ebp-68h], eax
  '005290C9: push 0042B53Ch
  '005290CE: mov eax, [ebp-68h]
  '005290D1: mov ecx, [eax]
  '005290D3: mov edx, [ebp-68h]
  '005290D6: push edx
  '005290D7: call [ecx+000000A4h]
  '005290DD: fclex 
  '005290DF: mov [ebp-6Ch], eax
  '005290E2: cmp [ebp-6Ch], 00000000h
  '005290E6: jnl 529108h
  '005290E8: push 000000A4h
  '005290ED: push 0041E3FCh
  '005290F2: mov eax, [ebp-68h]
  '005290F5: push eax
  '005290F6: mov ecx, [ebp-6Ch]
  '005290F9: push ecx
  '005290FA: call [004010A0h]
  '00529100: mov [ebp-00000094h], eax
  '00529106: jmp 529112h
  '00529108: mov [ebp-00000094h], 00000000h
  '00529112: lea ecx, [ebp-30h]
  '00529115: call [004013B8h]
  '0052911B: mov [ebp-04h], 00000008h
  '00529122: call [00401104h]
  '00529128: mov [ebp-04h], 0000000Ah
  '0052912F: cmp [0054106Ch], 00000000h
  '00529136: jnz 529154h
  '00529138: push 0054106Ch
  '0052913D: push 00411238h
  '00529142: call [004012B8h]
  '00529148: mov [ebp-00000098h], 0054106Ch
  '00529152: jmp 52915Eh
  '00529154: mov [ebp-00000098h], 0054106Ch
  '0052915E: mov edx, [ebp-00000098h]
  '00529164: mov eax, [edx]
  '00529166: mov ecx, [ebp-00000098h]
  '0052916C: mov edx, [ecx]
  '0052916E: mov ecx, [edx]
  '00529170: push eax
  '00529171: call [ecx+000003C0h]
  '00529177: push eax
  '00529178: lea edx, [ebp-30h]
  '0052917B: push edx
  '0052917C: call [004010E4h]
  '00529182: mov [ebp-68h], eax
  '00529185: lea eax, [ebp-2Ch]
  '00529188: push eax
  '00529189: mov ecx, [ebp-68h]
  '0052918C: mov edx, [ecx]
  '0052918E: mov eax, [ebp-68h]
  '00529191: push eax
  '00529192: call [edx+000000A0h]
  '00529198: fclex 
  '0052919A: mov [ebp-6Ch], eax
  '0052919D: cmp [ebp-6Ch], 00000000h
  '005291A1: jnl 5291C3h
  '005291A3: push 000000A0h
  '005291A8: push 0041E3FCh
  '005291AD: mov ecx, [ebp-68h]
  '005291B0: push ecx
  '005291B1: mov edx, [ebp-6Ch]
  '005291B4: push edx
  '005291B5: call [004010A0h]
  '005291BB: mov [ebp-0000009Ch], eax
  '005291C1: jmp 5291CDh
  '005291C3: mov [ebp-0000009Ch], 00000000h
  '005291CD: mov eax, [ebp-2Ch]
  '005291D0: push eax
  '005291D1: call [004012E0h]
  '005291D7: mov [ebp-4Ch], eax
  '005291DA: mov [ebp-54h], 00000003h
  '005291E1: mov eax, 00000010h
  '005291E6: call 004081B0h
  '005291EB: mov ecx, esp
  '005291ED: mov edx, [ebp-54h]
  '005291F0: mov [ecx], edx
  '005291F2: mov eax, [ebp-50h]
  '005291F5: mov [ecx+04h], eax
  '005291F8: mov edx, [ebp-4Ch]
  '005291FB: mov [ecx+08h], edx
  '005291FE: mov eax, [ebp-48h]
  '00529201: mov [ecx+0Ch], eax
  '00529204: push 00000002h
  '00529206: mov ecx, [ebp+08h]
  '00529209: mov edx, [ecx]
  '0052920B: mov eax, [ebp+08h]
  '0052920E: push eax
  '0052920F: call [edx+00000314h]
  '00529215: push eax
  '00529216: lea ecx, [ebp-34h]
  '00529219: push ecx
  '0052921A: call [004010E4h]
  '00529220: push eax
  '00529221: call [0040139Ch]
  '00529227: lea ecx, [ebp-2Ch]
  '0052922A: call [004013B4h]
  '00529230: lea edx, [ebp-34h]
  '00529233: push edx
  '00529234: lea eax, [ebp-30h]
  '00529237: push eax
  '00529238: push 00000002h
  '0052923A: call [00401064h]
  '00529240: add esp, 0000000Ch
  '00529243: mov [ebp-04h], 0000000Bh
  '0052924A: push 00000000h
  '0052924C: push 00000041h
  '0052924E: mov ecx, [ebp+08h]
  '00529251: mov edx, [ecx]
  '00529253: mov eax, [ebp+08h]
  '00529256: push eax
  '00529257: call [edx+00000314h]
  '0052925D: push eax
  '0052925E: lea ecx, [ebp-30h]
  '00529261: push ecx
  '00529262: call [004010E4h]
  '00529268: push eax
  '00529269: call [00401040h]
  '0052926F: add esp, 0000000Ch
  '00529272: lea ecx, [ebp-30h]
  '00529275: call [004013B8h]
  '0052927B: mov [ebp-04h], 0000000Ch
  '00529282: call [0040127Ch]
  '00529288: fstp real8 ptr [ebp-28h]
  '0052928B: mov [ebp-04h], 0000000Dh
  '00529292: call [0040127Ch]
  '00529298: call [00401108h]
  '0052929E: fstp real4 ptr [ebp-000000A0h]
  '005292A4: fld real8 ptr [ebp-28h]
  '005292A7: fadd real8 ptr [00405C98h]
  '005292AD: fstsw ax
  '005292AF: test al, 0Dh
  '005292B1: jnz 005293ABh
  '005292B7: fstp real4 ptr [ebp-000000A4h]
  '005292BD: fld real4 ptr [ebp-000000A4h]
  '005292C3: call [00401108h]
  '005292C9: fcomp real4 ptr [ebp-000000A0h]
  '005292CF: fstsw ax
  '005292D1: test ah, 41h
  '005292D4: jnz 5292E2h
  '005292D6: mov [ebp-000000A8h], 00000001h
  '005292E0: jmp 5292ECh
  '005292E2: mov [ebp-000000A8h], 00000000h
  '005292EC: mov esi, [ebp-000000A8h]
  '005292F2: neg esi
  '005292F4: push 00000000h
  '005292F6: push 00000008h
  '005292F8: mov edx, [ebp+08h]
  '005292FB: mov eax, [edx]
  '005292FD: mov ecx, [ebp+08h]
  '00529300: push ecx
  '00529301: call [eax+00000314h]
  '00529307: push eax
  '00529308: lea edx, [ebp-30h]
  '0052930B: push edx
  '0052930C: call [004010E4h]
  '00529312: push eax
  '00529313: lea eax, [ebp-44h]
  '00529316: push eax
  '00529317: call [004011E4h]
  '0052931D: add esp, 00000010h
  '00529320: push eax
  '00529321: call [00401284h]
  '00529327: movsx ecx, ax
  '0052932A: xor edx, edx
  '0052932C: cmp ecx, 00000007h
  '0052932F: setnz dl
  '00529332: neg edx
  '00529334: and si, dx
  '00529337: mov [ebp-68h], si
  '0052933B: lea ecx, [ebp-30h]
  '0052933E: call [004013B8h]
  '00529344: lea ecx, [ebp-44h]
  '00529347: call [00401030h]
  '0052934D: movsx eax, word ptr [ebp-68h]
  '00529351: test eax, eax
  '00529353: jz 529367h
  '00529355: mov [ebp-04h], 0000000Eh
  '0052935C: call [00401104h]
  '00529362: jmp 0052928Bh
  '00529367: wait 
  '00529368: push 00529396h
  '0052936D: jmp 529395h
  '0052936F: lea ecx, [ebp-2Ch]
  '00529372: call [004013B4h]
  '00529378: lea ecx, [ebp-34h]
  '0052937B: push ecx
  '0052937C: lea edx, [ebp-30h]
  '0052937F: push edx
  '00529380: push 00000002h
  '00529382: call [00401064h]
  '00529388: add esp, 0000000Ch
  '0052938B: lea ecx, [ebp-44h]
  '0052938E: call [00401030h]
  '00529394: ret 
End Sub

