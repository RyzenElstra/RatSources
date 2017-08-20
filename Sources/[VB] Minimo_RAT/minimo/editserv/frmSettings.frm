VERSION 5.00
Begin VB.Form frmSettings
  Caption = "MiniMo - Settings Manager"
  ScaleMode = 1
  'Unknown = 0   'False
  BorderStyle = 1 'Fixed Single
  Icon = "frmSettings.frx":0
  LinkTopic = "Form1"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 45
  ClientTop = 330
  ClientWidth = 3270
  ClientHeight = 2655
  StartUpPosition = 1 'CenterOwner
  Begin VB.ListBox lstSettings
    ForeColor = &H404040&
    Left = 0
    Top = 600
    Width = 3255
    Height = 1740
    TabIndex = 3
    BeginProperty Font
      Name = "Tahoma"
      Size = 9
      Charset = 0
      Weight = 700
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.FileListBox File1
    Left = 6840
    Top = 2880
    Width = 855
    Height = 870
    Visible = 0   'False
    TabIndex = 1
  End
  Begin MSComctlLib.StatusBar StatusBar1
    Left = 0
    Top = 2400
    Width = 3270
    Height = 255
    TabIndex = 2
  End
  Begin VB.Label Label1
    Caption = "Double click on the settings file that you would like import into the edit server."
    Left = 120
    Top = 120
    Width = 3195
    Height = 435
    TabIndex = 0
  End
End

Attribute VB_Name = "frmSettings"

Private Sub lstSettings__477200
  '00477200: push ebp
  '00477201: mov ebp, esp
  '00477203: sub esp, 0000000Ch
  '00477206: push 00403796h
  '0047720B: mov eax, fs:[00h]
  '00477211: push eax
  '00477212: mov fs:[00000000h], esp
  '00477219: sub esp, 00000038h
  '0047721C: push ebx
  '0047721D: push esi
  '0047721E: push edi
  '0047721F: mov [ebp-0Ch], esp
  '00477222: mov [ebp-08h], 004023A8h
  '00477229: mov edi, [ebp+08h]
  '0047722C: mov eax, edi
  '0047722E: and eax, 00000001h
  '00477231: mov [ebp-04h], eax
  '00477234: and edi, FFFFFFFEh
  '00477237: push edi
  '00477238: mov [ebp+08h], edi
  '0047723B: mov ecx, [edi]
  '0047723D: call [ecx+04h]
  '00477240: mov edx, [edi]
  '00477242: xor ebx, ebx
  '00477244: push edi
  '00477245: mov [ebp-18h], ebx
  '00477248: mov [ebp-1Ch], ebx
  '0047724B: mov [ebp-20h], ebx
  '0047724E: mov [ebp-24h], ebx
  '00477251: mov [ebp-28h], ebx
  '00477254: mov [ebp-2Ch], ebx
  '00477257: mov [ebp-30h], ebx
  '0047725A: call [edx+000002FCh]
  '00477260: push eax
  '00477261: lea eax, [ebp-28h]
  '00477264: push eax
  '00477265: call [004010F0h]
  '0047726B: mov esi, eax
  '0047726D: lea edx, [ebp-18h]
  '00477270: push edx
  '00477271: push esi
  '00477272: mov ecx, [esi]
  '00477274: call [ecx+000000F8h]
  '0047727A: cmp eax, ebx
  '0047727C: fclex 
  '0047727E: jnl 477292h
  '00477280: push 000000F8h
  '00477285: push 00411948h
  '0047728A: push esi
  '0047728B: push eax
  '0047728C: call [004010A8h]
  '00477292: cmp [004A0248h], ebx
  '00477298: jnz 4772AAh
  '0047729A: push 004A0248h
  '0047729F: push 004078F0h
  '004772A4: call [004012A8h]
  '004772AA: mov eax, [edi+34h]
  '004772AD: mov edi, [00401094h]
  '004772B3: mov esi, [004A0248h]
  '004772B9: push eax
  '004772BA: push 0041032Ch
  '004772BF: mov [ebp-2Ch], FFFFFFFFh
  '004772C6: call edi
  '004772C8: mov ebx, [00401348h]
  '004772CE: mov edx, eax
  '004772D0: lea ecx, [ebp-1Ch]
  '004772D3: call ebx
  '004772D5: mov ecx, [ebp-18h]
  '004772D8: push eax
  '004772D9: push ecx
  '004772DA: call edi
  '004772DC: mov edx, eax
  '004772DE: lea ecx, [ebp-20h]
  '004772E1: call ebx
  '004772E3: push eax
  '004772E4: push 0041FEC8h
  '004772E9: call edi
  '004772EB: mov edx, eax
  '004772ED: lea ecx, [ebp-24h]
  '004772F0: call ebx
  '004772F2: mov edx, [esi]
  '004772F4: lea eax, [ebp-30h]
  '004772F7: push eax
  '004772F8: lea ecx, [ebp-2Ch]
  '004772FB: lea eax, [ebp-24h]
  '004772FE: push ecx
  '004772FF: push eax
  '00477300: push esi
  '00477301: call [edx+00000708h]
  '00477307: test eax, eax
  '00477309: fclex 
  '0047730B: jnl 47731Fh
  '0047730D: push 00000708h
  '00477312: push 00410FB4h
  '00477317: push esi
  '00477318: push eax
  '00477319: call [004010A8h]
  '0047731F: xor ecx, ecx
  '00477321: cmp word ptr [ebp-30h], FFFFh
  '00477326: lea edx, [ebp-24h]
  '00477329: lea eax, [ebp-20h]
  '0047732C: setz cl
  '0047732F: neg ecx
  '00477331: mov esi, ecx
  '00477333: push edx
  '00477334: lea ecx, [ebp-18h]
  '00477337: push eax
  '00477338: lea edx, [ebp-1Ch]
  '0047733B: push ecx
  '0047733C: push edx
  '0047733D: push 00000004h
  '0047733F: call [004012CCh]
  '00477345: mov edi, [00401388h]
  '0047734B: add esp, 00000014h
  '0047734E: lea ecx, [ebp-28h]
  '00477351: call edi
  '00477353: test si, si
  '00477356: jz 4773A8h
  '00477358: mov eax, [4A0F98h]
  '0047735D: test eax, eax
  '0047735F: jnz 477371h
  '00477361: push 004A0F98h
  '00477366: push 0040FFF4h
  '0047736B: call [004012A8h]
  '00477371: mov eax, [ebp+08h]
  '00477374: mov esi, [004A0F98h]
  '0047737A: lea ecx, [ebp-28h]
  '0047737D: push eax
  '0047737E: mov ebx, [esi]
  '00477380: push ecx
  '00477381: call [004010FCh]
  '00477387: push eax
  '00477388: push esi
  '00477389: call [ebx+10h]
  '0047738C: test eax, eax
  '0047738E: fclex 
  '00477390: jnl 4773A1h
  '00477392: push 00000010h
  '00477394: push 0040FFE4h
  '00477399: push esi
  '0047739A: push eax
  '0047739B: call [004010A8h]
  '004773A1: lea ecx, [ebp-28h]
  '004773A4: call edi
  '004773A6: jmp 4773CFh
  '004773A8: mov edx, 0041FED8h
  '004773AD: lea ecx, [ebp-18h]
  '004773B0: call [004012C4h]
  '004773B6: mov eax, [ebp+08h]
  '004773B9: lea ecx, [ebp-18h]
  '004773BC: push ecx
  '004773BD: push eax
  '004773BE: mov edx, [eax]
  '004773C0: call [edx+00000704h]
  '004773C6: lea ecx, [ebp-18h]
  '004773C9: call [0040138Ch]
  '004773CF: mov [ebp-04h], 00000000h
  '004773D6: push 00477403h
  '004773DB: jmp 477402h
  '004773DD: lea edx, [ebp-24h]
  '004773E0: lea eax, [ebp-20h]
  '004773E3: push edx
  '004773E4: lea ecx, [ebp-1Ch]
  '004773E7: push eax
  '004773E8: lea edx, [ebp-18h]
  '004773EB: push ecx
  '004773EC: push edx
  '004773ED: push 00000004h
  '004773EF: call [004012CCh]
  '004773F5: add esp, 00000014h
  '004773F8: lea ecx, [ebp-28h]
  '004773FB: call [00401388h]
  '00477401: ret 
End Sub
Private Sub Form__476920
  '00476920: push ebp
  '00476921: mov ebp, esp
  '00476923: sub esp, 0000000Ch
  '00476926: push 00403796h
  '0047692B: mov eax, fs:[00h]
  '00476931: push eax
  '00476932: mov fs:[00000000h], esp
  '00476939: sub esp, 00000038h
  '0047693C: push ebx
  '0047693D: push esi
  '0047693E: push edi
  '0047693F: mov [ebp-0Ch], esp
  '00476942: mov [ebp-08h], 00402348h
  '00476949: mov ebx, [ebp+08h]
  '0047694C: mov eax, ebx
  '0047694E: and eax, 00000001h
  '00476951: mov [ebp-04h], eax
  '00476954: and ebx, FFFFFFFEh
  '00476957: push ebx
  '00476958: mov [ebp+08h], ebx
  '0047695B: mov ecx, [ebx]
  '0047695D: call [ecx+04h]
  '00476960: mov edx, [ebx]
  '00476962: lea eax, [ebp-1Ch]
  '00476965: xor esi, esi
  '00476967: push eax
  '00476968: push ebx
  '00476969: mov [ebp-18h], esi
  '0047696C: mov [ebp-1Ch], esi
  '0047696F: mov [ebp-2Ch], esi
  '00476972: mov [ebp-30h], esi
  '00476975: mov [ebp-38h], esi
  '00476978: mov [ebp-3Ch], esi
  '0047697B: call [edx+00000218h]
  '00476981: cmp eax, esi
  '00476983: fclex 
  '00476985: jnl 476999h
  '00476987: push 00000218h
  '0047698C: push 00413D58h
  '00476991: push ebx
  '00476992: push eax
  '00476993: call [004010A8h]
  '00476999: mov eax, [ebp-1Ch]
  '0047699C: lea ecx, [ebp-38h]
  '0047699F: push eax
  '004769A0: push ecx
  '004769A1: mov [ebp-1Ch], esi
  '004769A4: call [004010F0h]
  '004769AA: push eax
  '004769AB: lea edx, [ebp-18h]
  '004769AE: lea eax, [ebp-3Ch]
  '004769B1: push edx
  '004769B2: push eax
  '004769B3: push 00413C30h
  '004769B8: call [004010D0h]
  '004769BE: mov esi, [00401270h]
  '004769C4: mov edi, [004012ECh]
  '004769CA: test eax, eax
  '004769CC: jz 00476A78h
  '004769D2: mov ecx, [ebp-18h]
  '004769D5: push 00411B44h
  '004769DA: push ecx
  '004769DB: call esi
  '004769DD: mov edx, [ebp-18h]
  '004769E0: mov bx, ax
  '004769E3: neg bx
  '004769E6: sbb ebx, ebx
  '004769E8: push 004146C8h
  '004769ED: push edx
  '004769EE: inc ebx
  '004769EF: call esi
  '004769F1: neg ax
  '004769F4: sbb eax, eax
  '004769F6: push 00411948h
  '004769FB: inc eax
  '004769FC: and ebx, eax
  '004769FE: mov eax, [ebp-18h]
  '00476A01: neg ebx
  '00476A03: sbb ebx, ebx
  '00476A05: push eax
  '00476A06: neg ebx
  '00476A08: call esi
  '00476A0A: neg ax
  '00476A0D: mov ecx, [ebp-18h]
  '00476A10: push 0041FE30h
  '00476A15: sbb eax, eax
  '00476A17: push ecx
  '00476A18: inc eax
  '00476A19: and ebx, eax
  '00476A1B: neg ebx
  '00476A1D: sbb ebx, ebx
  '00476A1F: neg ebx
  '00476A21: call esi
  '00476A23: neg ax
  '00476A26: sbb eax, eax
  '00476A28: inc eax
  '00476A29: test ebx, eax
  '00476A2B: jnz 476A5Dh
  '00476A2D: mov edx, [ebp-18h]
  '00476A30: push 00000000h
  '00476A32: push 004146D8h
  '00476A37: lea eax, [ebp-2Ch]
  '00476A3A: push edx
  '00476A3B: push eax
  '00476A3C: call [0040132Ch]
  '00476A42: add esp, 00000010h
  '00476A45: push eax
  '00476A46: call edi
  '00476A48: lea ecx, [ebp-30h]
  '00476A4B: mov [ebp-30h], eax
  '00476A4E: push ecx
  '00476A4F: call 00484740h
  '00476A54: lea ecx, [ebp-2Ch]
  '00476A57: call [00401034h]
  '00476A5D: lea edx, [ebp-18h]
  '00476A60: lea eax, [ebp-3Ch]
  '00476A63: push edx
  '00476A64: push eax
  '00476A65: push 00413C30h
  '00476A6A: call [00401140h]
  '00476A70: mov ebx, [ebp+08h]
  '00476A73: jmp 004769CAh
  '00476A78: mov ecx, [ebx]
  '00476A7A: push ebx
  '00476A7B: call [ecx+000006FCh]
  '00476A81: mov [ebp-04h], 00000000h
  '00476A88: push 00476ABFh
  '00476A8D: jmp 476AA2h
  '00476A8F: lea ecx, [ebp-1Ch]
  '00476A92: call [00401388h]
  '00476A98: lea ecx, [ebp-2Ch]
  '00476A9B: call [00401034h]
  '00476AA1: ret 
End Sub

