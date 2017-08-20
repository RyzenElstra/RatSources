VERSION 5.00
Begin VB.Form frmTempMod
  Caption = "Temp Settings"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  BorderStyle = 1 'Fixed Single
  Icon = "frmTempMod.frx":0
  LinkTopic = "Form2"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 45
  ClientTop = 330
  ClientWidth = 4110
  ClientHeight = 2070
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
  Begin VB.CommandButton cmdCancel
    Caption = "&Cancel"
    Left = 2160
    Top = 1680
    Width = 975
    Height = 280
    TabIndex = 13
  End
  Begin VB.CommandButton cmdSend
    Caption = "&Send"
    Left = 120
    Top = 1680
    Width = 1935
    Height = 280
    TabIndex = 12
  End
  Begin VB.CommandButton cmdHelp
    Caption = "&Help"
    Left = 3240
    Top = 1680
    Width = 735
    Height = 280
    TabIndex = 11
  End
  Begin VB.TextBox txtInterval
    Left = 3000
    Top = 480
    Width = 615
    Height = 285
    TabIndex = 8
  End
  Begin VB.TextBox txtPass
    Left = 1185
    Top = 1200
    Width = 1815
    Height = 285
    TabIndex = 6
    PasswordChar = "*"
  End
  Begin VB.TextBox txtFwdPort
    Left = 1185
    Top = 840
    Width = 975
    Height = 285
    TabIndex = 4
  End
  Begin VB.TextBox txtRevPort
    Left = 1185
    Top = 480
    Width = 975
    Height = 285
    TabIndex = 3
  End
  Begin VB.TextBox txtIP
    Left = 1185
    Top = 120
    Width = 2775
    Height = 285
    TabIndex = 0
  End
  Begin VB.Label Label1
    Caption = "min."
    Left = 3720
    Top = 525
    Width = 375
    Height = 255
    TabIndex = 10
  End
  Begin VB.Label Label6
    Caption = "Password:"
    Left = 345
    Top = 1245
    Width = 1095
    Height = 255
    TabIndex = 9
  End
  Begin VB.Label Label5
    Caption = "Interval:"
    Left = 2320
    Top = 525
    Width = 735
    Height = 255
    TabIndex = 7
  End
  Begin VB.Label Label4
    Caption = "Forward Port:"
    Left = 105
    Top = 885
    Width = 1215
    Height = 255
    TabIndex = 5
  End
  Begin VB.Label Label3
    Caption = "SIN Port:"
    Left = 450
    Top = 525
    Width = 975
    Height = 255
    TabIndex = 2
  End
  Begin VB.Label Label2
    Caption = "SIN IP:"
    Left = 600
    Top = 165
    Width = 1215
    Height = 255
    TabIndex = 1
  End
End

Attribute VB_Name = "frmTempMod"

Private Sub Form__5383F0
  '005383F0: push ebp
  '005383F1: mov ebp, esp
  '005383F3: sub esp, 00000018h
  '005383F6: push 004081B6h
  '005383FB: mov eax, fs:[00h]
  '00538401: push eax
  '00538402: mov fs:[00000000h], esp
  '00538409: mov eax, 00000048h
  '0053840E: call 004081B0h
  '00538413: push ebx
  '00538414: push esi
  '00538415: push edi
  '00538416: mov [ebp-18h], esp
  '00538419: mov [ebp-14h], 00407CB8h
  '00538420: mov eax, [ebp+08h]
  '00538423: and eax, 00000001h
  '00538426: mov [ebp-10h], eax
  '00538429: mov ecx, [ebp+08h]
  '0053842C: and ecx, FFFFFFFEh
  '0053842F: mov [ebp+08h], ecx
  '00538432: mov [ebp-0Ch], 00000000h
  '00538439: mov edx, [ebp+08h]
  '0053843C: mov eax, [edx]
  '0053843E: mov ecx, [ebp+08h]
  '00538441: push ecx
  '00538442: call [eax+04h]
  '00538445: mov [ebp-04h], 00000001h
  '0053844C: mov [ebp-04h], 00000002h
  '00538453: push FFFFFFFFh
  '00538455: call [004010E8h]
  '0053845B: mov [ebp-04h], 00000003h
  '00538462: lea edx, [ebp-28h]
  '00538465: push edx
  '00538466: mov eax, [ebp+08h]
  '00538469: mov ecx, [eax]
  '0053846B: mov edx, [ebp+08h]
  '0053846E: push edx
  '0053846F: call [ecx+00000218h]
  '00538475: fclex 
  '00538477: mov [ebp-40h], eax
  '0053847A: cmp [ebp-40h], 00000000h
  '0053847E: jnl 53849Dh
  '00538480: push 00000218h
  '00538485: push 00422390h
  '0053848A: mov eax, [ebp+08h]
  '0053848D: push eax
  '0053848E: mov ecx, [ebp-40h]
  '00538491: push ecx
  '00538492: call [004010A0h]
  '00538498: mov [ebp-68h], eax
  '0053849B: jmp 5384A4h
  '0053849D: mov [ebp-68h], 00000000h
  '005384A4: mov edx, [ebp-28h]
  '005384A7: mov [ebp-64h], edx
  '005384AA: mov [ebp-28h], 00000000h
  '005384B1: mov eax, [ebp-64h]
  '005384B4: push eax
  '005384B5: lea ecx, [ebp-44h]
  '005384B8: push ecx
  '005384B9: call [004010E4h]
  '005384BF: push eax
  '005384C0: lea edx, [ebp-24h]
  '005384C3: push edx
  '005384C4: lea eax, [ebp-48h]
  '005384C7: push eax
  '005384C8: push 0041F304h
  '005384CD: call [004010CCh]
  '005384D3: mov [ebp-60h], eax
  '005384D6: jmp 005385ACh
  '005384DB: mov [ebp-04h], 00000004h
  '005384E2: push 00420F60h
  '005384E7: mov ecx, [ebp-24h]
  '005384EA: push ecx
  '005384EB: call [00401278h]
  '005384F1: movsx esi, ax
  '005384F4: neg esi
  '005384F6: sbb esi, esi
  '005384F8: inc esi
  '005384F9: push 0041E3FCh
  '005384FE: mov edx, [ebp-24h]
  '00538501: push edx
  '00538502: call [00401278h]
  '00538508: movsx eax, ax
  '0053850B: neg eax
  '0053850D: sbb eax, eax
  '0053850F: inc eax
  '00538510: and esi, eax
  '00538512: neg esi
  '00538514: sbb esi, esi
  '00538516: neg esi
  '00538518: push 0041FB8Ch
  '0053851D: mov ecx, [ebp-24h]
  '00538520: push ecx
  '00538521: call [00401278h]
  '00538527: movsx edx, ax
  '0053852A: neg edx
  '0053852C: sbb edx, edx
  '0053852E: inc edx
  '0053852F: and esi, edx
  '00538531: neg esi
  '00538533: sbb esi, esi
  '00538535: neg esi
  '00538537: push 0041CE08h
  '0053853C: mov eax, [ebp-24h]
  '0053853F: push eax
  '00538540: call [00401278h]
  '00538546: movsx ecx, ax
  '00538549: neg ecx
  '0053854B: sbb ecx, ecx
  '0053854D: inc ecx
  '0053854E: and esi, ecx
  '00538550: test esi, esi
  '00538552: jnz 53858Fh
  '00538554: mov [ebp-04h], 00000005h
  '0053855B: push 00000000h
  '0053855D: push 00420F70h
  '00538562: mov edx, [ebp-24h]
  '00538565: push edx
  '00538566: lea eax, [ebp-38h]
  '00538569: push eax
  '0053856A: call [00401368h]
  '00538570: add esp, 00000010h
  '00538573: push eax
  '00538574: call [0040130Ch]
  '0053857A: mov [ebp-3Ch], eax
  '0053857D: lea ecx, [ebp-3Ch]
  '00538580: push ecx
  '00538581: call 004EB0B0h
  '00538586: lea ecx, [ebp-38h]
  '00538589: call [00401030h]
  '0053858F: mov [ebp-04h], 00000007h
  '00538596: lea edx, [ebp-24h]
  '00538599: push edx
  '0053859A: lea eax, [ebp-48h]
  '0053859D: push eax
  '0053859E: push 0041F304h
  '005385A3: call [00401150h]
  '005385A9: mov [ebp-60h], eax
  '005385AC: cmp [ebp-60h], 00000000h
  '005385B0: jnz 005384DBh
  '005385B6: mov [ebp-10h], 00000000h
  '005385BD: push 005385F4h
  '005385C2: jmp 5385D7h
  '005385C4: lea ecx, [ebp-28h]
  '005385C7: call [004013B8h]
  '005385CD: lea ecx, [ebp-38h]
  '005385D0: call [00401030h]
  '005385D6: ret 
End Sub
Private Sub txtRevPort__5387A0
  '005387A0: push ebp
  '005387A1: mov ebp, esp
  '005387A3: sub esp, 0000000Ch
  '005387A6: push 004081B6h
  '005387AB: mov eax, fs:[00h]
  '005387B1: push eax
  '005387B2: mov fs:[00000000h], esp
  '005387B9: sub esp, 00000008h
  '005387BC: push ebx
  '005387BD: push esi
  '005387BE: push edi
  '005387BF: mov [ebp-0Ch], esp
  '005387C2: mov [ebp-08h], 00407D08h
  '005387C9: mov eax, [ebp+08h]
  '005387CC: mov ecx, eax
  '005387CE: and ecx, 00000001h
  '005387D1: mov [ebp-04h], ecx
  '005387D4: and al, FEh
  '005387D6: push eax
  '005387D7: mov [ebp+08h], eax
  '005387DA: mov edx, [eax]
  '005387DC: call [edx+04h]
  '005387DF: mov edi, [ebp+0Ch]
  '005387E2: push 0041E8A8h
  '005387E7: mov si, [edi]
  '005387EA: call [00401068h]
  '005387F0: xor ecx, ecx
  '005387F2: cmp si, ax
  '005387F5: setz cl
  '005387F8: xor edx, edx
  '005387FA: cmp si, 0039h
  '005387FE: setle dl
  '00538801: xor eax, eax
  '00538803: cmp si, 0030h
  '00538807: setnl al
  '0053880A: and edx, eax
  '0053880C: neg edx
  '0053880E: sbb edx, edx
  '00538810: xor eax, eax
  '00538812: neg edx
  '00538814: cmp si, 0008h
  '00538818: setz al
  '0053881B: or edx, eax
  '0053881D: neg edx
  '0053881F: sbb edx, edx
  '00538821: neg edx
  '00538823: or ecx, edx
  '00538825: jnz 53882Ch
  '00538827: mov word ptr [edi], 0000h
  '0053882C: mov [ebp-04h], 00000000h
  '00538833: mov eax, [ebp+08h]
  '00538836: push eax
  '00538837: mov ecx, [eax]
  '00538839: call [ecx+08h]
  '0053883C: mov eax, [ebp-04h]
  '0053883F: mov ecx, [ebp-14h]
  '00538842: pop edi
  '00538843: pop esi
  '00538844: mov fs:[00000000h], ecx
  '0053884B: pop ebx
  '0053884C: mov esp, ebp
  '0053884E: pop ebp
  '0053884F: retn 0008h
End Sub
Private Sub txtInterval__5386E0
  '005386E0: push ebp
  '005386E1: mov ebp, esp
  '005386E3: sub esp, 0000000Ch
  '005386E6: push 004081B6h
  '005386EB: mov eax, fs:[00h]
  '005386F1: push eax
  '005386F2: mov fs:[00000000h], esp
  '005386F9: sub esp, 00000008h
  '005386FC: push ebx
  '005386FD: push esi
  '005386FE: push edi
  '005386FF: mov [ebp-0Ch], esp
  '00538702: mov [ebp-08h], 00407D00h
  '00538709: mov eax, [ebp+08h]
  '0053870C: mov ecx, eax
  '0053870E: and ecx, 00000001h
  '00538711: mov [ebp-04h], ecx
  '00538714: and al, FEh
  '00538716: push eax
  '00538717: mov [ebp+08h], eax
  '0053871A: mov edx, [eax]
  '0053871C: call [edx+04h]
  '0053871F: mov edi, [ebp+0Ch]
  '00538722: push 0041E8A8h
  '00538727: mov si, [edi]
  '0053872A: call [00401068h]
  '00538730: xor ecx, ecx
  '00538732: cmp si, ax
  '00538735: setz cl
  '00538738: xor edx, edx
  '0053873A: cmp si, 0039h
  '0053873E: setle dl
  '00538741: xor eax, eax
  '00538743: cmp si, 0030h
  '00538747: setnl al
  '0053874A: and edx, eax
  '0053874C: neg edx
  '0053874E: sbb edx, edx
  '00538750: xor eax, eax
  '00538752: neg edx
  '00538754: cmp si, 0008h
  '00538758: setz al
  '0053875B: or edx, eax
  '0053875D: neg edx
  '0053875F: sbb edx, edx
  '00538761: neg edx
  '00538763: or ecx, edx
  '00538765: jnz 53876Ch
  '00538767: mov word ptr [edi], 0000h
  '0053876C: mov [ebp-04h], 00000000h
  '00538773: mov eax, [ebp+08h]
  '00538776: push eax
  '00538777: mov ecx, [eax]
  '00538779: call [ecx+08h]
  '0053877C: mov eax, [ebp-04h]
  '0053877F: mov ecx, [ebp-14h]
  '00538782: pop edi
  '00538783: pop esi
  '00538784: mov fs:[00000000h], ecx
  '0053878B: pop ebx
  '0053878C: mov esp, ebp
  '0053878E: pop ebp
  '0053878F: retn 0008h
End Sub
Private Sub txtFwdPort__538620
  '00538620: push ebp
  '00538621: mov ebp, esp
  '00538623: sub esp, 0000000Ch
  '00538626: push 004081B6h
  '0053862B: mov eax, fs:[00h]
  '00538631: push eax
  '00538632: mov fs:[00000000h], esp
  '00538639: sub esp, 00000008h
  '0053863C: push ebx
  '0053863D: push esi
  '0053863E: push edi
  '0053863F: mov [ebp-0Ch], esp
  '00538642: mov [ebp-08h], 00407CF8h
  '00538649: mov eax, [ebp+08h]
  '0053864C: mov ecx, eax
  '0053864E: and ecx, 00000001h
  '00538651: mov [ebp-04h], ecx
  '00538654: and al, FEh
  '00538656: push eax
  '00538657: mov [ebp+08h], eax
  '0053865A: mov edx, [eax]
  '0053865C: call [edx+04h]
  '0053865F: mov edi, [ebp+0Ch]
  '00538662: push 0041E8A8h
  '00538667: mov si, [edi]
  '0053866A: call [00401068h]
  '00538670: xor ecx, ecx
  '00538672: cmp si, ax
  '00538675: setz cl
  '00538678: xor edx, edx
  '0053867A: cmp si, 0039h
  '0053867E: setle dl
  '00538681: xor eax, eax
  '00538683: cmp si, 0030h
  '00538687: setnl al
  '0053868A: and edx, eax
  '0053868C: neg edx
  '0053868E: sbb edx, edx
  '00538690: xor eax, eax
  '00538692: neg edx
  '00538694: cmp si, 0008h
  '00538698: setz al
  '0053869B: or edx, eax
  '0053869D: neg edx
  '0053869F: sbb edx, edx
  '005386A1: neg edx
  '005386A3: or ecx, edx
  '005386A5: jnz 5386ACh
  '005386A7: mov word ptr [edi], 0000h
  '005386AC: mov [ebp-04h], 00000000h
  '005386B3: mov eax, [ebp+08h]
  '005386B6: push eax
  '005386B7: mov ecx, [eax]
  '005386B9: call [ecx+08h]
  '005386BC: mov eax, [ebp-04h]
  '005386BF: mov ecx, [ebp-14h]
  '005386C2: pop edi
  '005386C3: pop esi
  '005386C4: mov fs:[00000000h], ecx
  '005386CB: pop ebx
  '005386CC: mov esp, ebp
  '005386CE: pop ebp
  '005386CF: retn 0008h
End Sub
Private Sub cmdSend__537530
  '00537530: push ebp
  '00537531: mov ebp, esp
  '00537533: sub esp, 00000018h
  '00537536: push 004081B6h
  '0053753B: mov eax, fs:[00h]
  '00537541: push eax
  '00537542: mov fs:[00000000h], esp
  '00537549: mov eax, 00000184h
  '0053754E: call 004081B0h
  '00537553: push ebx
  '00537554: push esi
  '00537555: push edi
  '00537556: mov [ebp-18h], esp
  '00537559: mov [ebp-14h], 00407C48h
  '00537560: mov eax, [ebp+08h]
  '00537563: and eax, 00000001h
  '00537566: mov [ebp-10h], eax
  '00537569: mov ecx, [ebp+08h]
  '0053756C: and ecx, FFFFFFFEh
  '0053756F: mov [ebp+08h], ecx
  '00537572: mov [ebp-0Ch], 00000000h
  '00537579: mov edx, [ebp+08h]
  '0053757C: mov eax, [edx]
  '0053757E: mov ecx, [ebp+08h]
  '00537581: push ecx
  '00537582: call [eax+04h]
  '00537585: mov [ebp-04h], 00000001h
  '0053758C: mov [ebp-04h], 00000002h
  '00537593: push FFFFFFFFh
  '00537595: call [004010E8h]
  '0053759B: mov [ebp-04h], 00000003h
  '005375A2: cmp [00541024h], 00000000h
  '005375A9: jnz 5375C7h
  '005375AB: push 00541024h
  '005375B0: push 00413334h
  '005375B5: call [004012B8h]
  '005375BB: mov [ebp-0000014Ch], 00541024h
  '005375C5: jmp 5375D1h
  '005375C7: mov [ebp-0000014Ch], 00541024h
  '005375D1: push 0041C038h
  '005375D6: push 00000000h
  '005375D8: push 00000003h
  '005375DA: mov edx, [ebp-0000014Ch]
  '005375E0: mov eax, [edx]
  '005375E2: mov ecx, [ebp-0000014Ch]
  '005375E8: mov edx, [ecx]
  '005375EA: mov ecx, [edx]
  '005375EC: push eax
  '005375ED: call [ecx+0000066Ch]
  '005375F3: push eax
  '005375F4: lea edx, [ebp-60h]
  '005375F7: push edx
  '005375F8: call [004010E4h]
  '005375FE: push eax
  '005375FF: lea eax, [ebp-80h]
  '00537602: push eax
  '00537603: call [004011E4h]
  '00537609: add esp, 00000010h
  '0053760C: push eax
  '0053760D: call [004011C8h]
  '00537613: push eax
  '00537614: lea ecx, [ebp-64h]
  '00537617: push ecx
  '00537618: call [004010E4h]
  '0053761E: mov [ebp-00000100h], eax
  '00537624: mov [ebp-00000088h], 00000007h
  '0053762E: mov [ebp-00000090h], 00000002h
  '00537638: lea edx, [ebp-68h]
  '0053763B: push edx
  '0053763C: lea eax, [ebp-00000090h]
  '00537642: push eax
  '00537643: mov ecx, [ebp-00000100h]
  '00537649: mov edx, [ecx]
  '0053764B: mov eax, [ebp-00000100h]
  '00537651: push eax
  '00537652: call [edx+24h]
  '00537655: fclex 
  '00537657: mov [ebp-00000104h], eax
  '0053765D: cmp [ebp-00000104h], 00000000h
  '00537664: jnl 537689h
  '00537666: push 00000024h
  '00537668: push 0041C038h
  '0053766D: mov ecx, [ebp-00000100h]
  '00537673: push ecx
  '00537674: mov edx, [ebp-00000104h]
  '0053767A: push edx
  '0053767B: call [004010A0h]
  '00537681: mov [ebp-00000150h], eax
  '00537687: jmp 537693h
  '00537689: mov [ebp-00000150h], 00000000h
  '00537693: mov eax, [ebp-68h]
  '00537696: mov [ebp-00000108h], eax
  '0053769C: lea ecx, [ebp-000000FCh]
  '005376A2: push ecx
  '005376A3: mov edx, [ebp-00000108h]
  '005376A9: mov eax, [edx]
  '005376AB: mov ecx, [ebp-00000108h]
  '005376B1: push ecx
  '005376B2: call [eax+7Ch]
  '005376B5: fclex 
  '005376B7: mov [ebp-0000010Ch], eax
  '005376BD: cmp [ebp-0000010Ch], 00000000h
  '005376C4: jnl 5376E9h
  '005376C6: push 0000007Ch
  '005376C8: push 0041C048h
  '005376CD: mov edx, [ebp-00000108h]
  '005376D3: push edx
  '005376D4: mov eax, [ebp-0000010Ch]
  '005376DA: push eax
  '005376DB: call [004010A0h]
  '005376E1: mov [ebp-00000154h], eax
  '005376E7: jmp 5376F3h
  '005376E9: mov [ebp-00000154h], 00000000h
  '005376F3: xor ecx, ecx
  '005376F5: cmp [ebp-000000FCh], 00000001h
  '005376FC: setz cl
  '005376FF: neg ecx
  '00537701: mov [ebp-00000110h], cx
  '00537708: lea edx, [ebp-68h]
  '0053770B: push edx
  '0053770C: lea eax, [ebp-64h]
  '0053770F: push eax
  '00537710: lea ecx, [ebp-60h]
  '00537713: push ecx
  '00537714: push 00000003h
  '00537716: call [00401064h]
  '0053771C: add esp, 00000010h
  '0053771F: lea edx, [ebp-00000090h]
  '00537725: push edx
  '00537726: lea eax, [ebp-80h]
  '00537729: push eax
  '0053772A: push 00000002h
  '0053772C: call [00401050h]
  '00537732: add esp, 0000000Ch
  '00537735: movsx ecx, word ptr [ebp-00000110h]
  '0053773C: test ecx, ecx
  '0053773E: jz 00537D57h
  '00537744: mov [ebp-04h], 00000004h
  '0053774B: mov edx, 0042D1E4h
  '00537750: lea ecx, [ebp-24h]
  '00537753: call [004012D8h]
  '00537759: lea edx, [ebp-24h]
  '0053775C: push edx
  '0053775D: call 00517B00h
  '00537762: xor ecx, ecx
  '00537764: cmp ax, FFFFh
  '00537768: setz cl
  '0053776B: neg ecx
  '0053776D: mov [ebp-00000100h], cx
  '00537774: lea ecx, [ebp-24h]
  '00537777: call [004013B4h]
  '0053777D: movsx edx, word ptr [ebp-00000100h]
  '00537784: test edx, edx
  '00537786: jz 00537C95h
  '0053778C: mov [ebp-04h], 00000005h
  '00537793: cmp [00541024h], 00000000h
  '0053779A: jnz 5377B8h
  '0053779C: push 00541024h
  '005377A1: push 00413334h
  '005377A6: call [004012B8h]
  '005377AC: mov [ebp-00000158h], 00541024h
  '005377B6: jmp 5377C2h
  '005377B8: mov [ebp-00000158h], 00541024h
  '005377C2: mov eax, [ebp-00000158h]
  '005377C8: mov ecx, [eax]
  '005377CA: mov [ebp-00000128h], ecx
  '005377D0: mov edx, [ebp+08h]
  '005377D3: mov eax, [edx]
  '005377D5: mov ecx, [ebp+08h]
  '005377D8: push ecx
  '005377D9: call [eax+00000318h]
  '005377DF: push eax
  '005377E0: lea edx, [ebp-60h]
  '005377E3: push edx
  '005377E4: call [004010E4h]
  '005377EA: mov [ebp-00000100h], eax
  '005377F0: lea eax, [ebp-24h]
  '005377F3: push eax
  '005377F4: mov ecx, [ebp-00000100h]
  '005377FA: mov edx, [ecx]
  '005377FC: mov eax, [ebp-00000100h]
  '00537802: push eax
  '00537803: call [edx+000000A0h]
  '00537809: fclex 
  '0053780B: mov [ebp-00000104h], eax
  '00537811: cmp [ebp-00000104h], 00000000h
  '00537818: jnl 537840h
  '0053781A: push 000000A0h
  '0053781F: push 0041E3FCh
  '00537824: mov ecx, [ebp-00000100h]
  '0053782A: push ecx
  '0053782B: mov edx, [ebp-00000104h]
  '00537831: push edx
  '00537832: call [004010A0h]
  '00537838: mov [ebp-0000015Ch], eax
  '0053783E: jmp 53784Ah
  '00537840: mov [ebp-0000015Ch], 00000000h
  '0053784A: mov eax, [ebp+08h]
  '0053784D: mov ecx, [eax]
  '0053784F: mov edx, [ebp+08h]
  '00537852: push edx
  '00537853: call [ecx+00000314h]
  '00537859: push eax
  '0053785A: lea eax, [ebp-64h]
  '0053785D: push eax
  '0053785E: call [004010E4h]
  '00537864: mov [ebp-00000108h], eax
  '0053786A: lea ecx, [ebp-2Ch]
  '0053786D: push ecx
  '0053786E: mov edx, [ebp-00000108h]
  '00537874: mov eax, [edx]
  '00537876: mov ecx, [ebp-00000108h]
  '0053787C: push ecx
  '0053787D: call [eax+000000A0h]
  '00537883: fclex 
  '00537885: mov [ebp-0000010Ch], eax
  '0053788B: cmp [ebp-0000010Ch], 00000000h
  '00537892: jnl 5378BAh
  '00537894: push 000000A0h
  '00537899: push 0041E3FCh
  '0053789E: mov edx, [ebp-00000108h]
  '005378A4: push edx
  '005378A5: mov eax, [ebp-0000010Ch]
  '005378AB: push eax
  '005378AC: call [004010A0h]
  '005378B2: mov [ebp-00000160h], eax
  '005378B8: jmp 5378C4h
  '005378BA: mov [ebp-00000160h], 00000000h
  '005378C4: mov ecx, [ebp+08h]
  '005378C7: mov edx, [ecx]
  '005378C9: mov eax, [ebp+08h]
  '005378CC: push eax
  '005378CD: call [edx+00000308h]
  '005378D3: push eax
  '005378D4: lea ecx, [ebp-68h]
  '005378D7: push ecx
  '005378D8: call [004010E4h]
  '005378DE: mov [ebp-00000110h], eax
  '005378E4: lea edx, [ebp-38h]
  '005378E7: push edx
  '005378E8: mov eax, [ebp-00000110h]
  '005378EE: mov ecx, [eax]
  '005378F0: mov edx, [ebp-00000110h]
  '005378F6: push edx
  '005378F7: call [ecx+000000A0h]
  '005378FD: fclex 
  '005378FF: mov [ebp-00000114h], eax
  '00537905: cmp [ebp-00000114h], 00000000h
  '0053790C: jnl 537934h
  '0053790E: push 000000A0h
  '00537913: push 0041E3FCh
  '00537918: mov eax, [ebp-00000110h]
  '0053791E: push eax
  '0053791F: mov ecx, [ebp-00000114h]
  '00537925: push ecx
  '00537926: call [004010A0h]
  '0053792C: mov [ebp-00000164h], eax
  '00537932: jmp 53793Eh
  '00537934: mov [ebp-00000164h], 00000000h
  '0053793E: mov edx, [ebp+08h]
  '00537941: mov eax, [edx]
  '00537943: mov ecx, [ebp+08h]
  '00537946: push ecx
  '00537947: call [eax+00000310h]
  '0053794D: push eax
  '0053794E: lea edx, [ebp-6Ch]
  '00537951: push edx
  '00537952: call [004010E4h]
  '00537958: mov [ebp-00000118h], eax
  '0053795E: lea eax, [ebp-44h]
  '00537961: push eax
  '00537962: mov ecx, [ebp-00000118h]
  '00537968: mov edx, [ecx]
  '0053796A: mov eax, [ebp-00000118h]
  '00537970: push eax
  '00537971: call [edx+000000A0h]
  '00537977: fclex 
  '00537979: mov [ebp-0000011Ch], eax
  '0053797F: cmp [ebp-0000011Ch], 00000000h
  '00537986: jnl 5379AEh
  '00537988: push 000000A0h
  '0053798D: push 0041E3FCh
  '00537992: mov ecx, [ebp-00000118h]
  '00537998: push ecx
  '00537999: mov edx, [ebp-0000011Ch]
  '0053799F: push edx
  '005379A0: call [004010A0h]
  '005379A6: mov [ebp-00000168h], eax
  '005379AC: jmp 5379B8h
  '005379AE: mov [ebp-00000168h], 00000000h
  '005379B8: mov eax, [ebp+08h]
  '005379BB: mov ecx, [eax]
  '005379BD: mov edx, [ebp+08h]
  '005379C0: push edx
  '005379C1: call [ecx+0000030Ch]
  '005379C7: push eax
  '005379C8: lea eax, [ebp-70h]
  '005379CB: push eax
  '005379CC: call [004010E4h]
  '005379D2: mov [ebp-00000120h], eax
  '005379D8: lea ecx, [ebp-50h]
  '005379DB: push ecx
  '005379DC: mov edx, [ebp-00000120h]
  '005379E2: mov eax, [edx]
  '005379E4: mov ecx, [ebp-00000120h]
  '005379EA: push ecx
  '005379EB: call [eax+000000A0h]
  '005379F1: fclex 
  '005379F3: mov [ebp-00000124h], eax
  '005379F9: cmp [ebp-00000124h], 00000000h
  '00537A00: jnl 537A28h
  '00537A02: push 000000A0h
  '00537A07: push 0041E3FCh
  '00537A0C: mov edx, [ebp-00000120h]
  '00537A12: push edx
  '00537A13: mov eax, [ebp-00000124h]
  '00537A19: push eax
  '00537A1A: call [004010A0h]
  '00537A20: mov [ebp-0000016Ch], eax
  '00537A26: jmp 537A32h
  '00537A28: mov [ebp-0000016Ch], 00000000h
  '00537A32: push 00424270h
  '00537A37: mov ecx, [ebp-24h]
  '00537A3A: push ecx
  '00537A3B: call [0040108Ch]
  '00537A41: mov edx, eax
  '00537A43: lea ecx, [ebp-28h]
  '00537A46: call [00401378h]
  '00537A4C: push eax
  '00537A4D: push 0041C0D8h
  '00537A52: call [0040108Ch]
  '00537A58: mov edx, eax
  '00537A5A: lea ecx, [ebp-30h]
  '00537A5D: call [00401378h]
  '00537A63: push eax
  '00537A64: mov edx, [ebp-2Ch]
  '00537A67: push edx
  '00537A68: call [0040108Ch]
  '00537A6E: mov edx, eax
  '00537A70: lea ecx, [ebp-34h]
  '00537A73: call [00401378h]
  '00537A79: push eax
  '00537A7A: push 0041C0D8h
  '00537A7F: call [0040108Ch]
  '00537A85: mov edx, eax
  '00537A87: lea ecx, [ebp-3Ch]
  '00537A8A: call [00401378h]
  '00537A90: push eax
  '00537A91: mov eax, [ebp-38h]
  '00537A94: push eax
  '00537A95: call [0040108Ch]
  '00537A9B: mov edx, eax
  '00537A9D: lea ecx, [ebp-40h]
  '00537AA0: call [00401378h]
  '00537AA6: push eax
  '00537AA7: push 0041C0D8h
  '00537AAC: call [0040108Ch]
  '00537AB2: mov edx, eax
  '00537AB4: lea ecx, [ebp-48h]
  '00537AB7: call [00401378h]
  '00537ABD: push eax
  '00537ABE: mov ecx, [ebp-44h]
  '00537AC1: push ecx
  '00537AC2: call [0040108Ch]
  '00537AC8: mov edx, eax
  '00537ACA: lea ecx, [ebp-4Ch]
  '00537ACD: call [00401378h]
  '00537AD3: push eax
  '00537AD4: push 0041C0D8h
  '00537AD9: call [0040108Ch]
  '00537ADF: mov edx, eax
  '00537AE1: lea ecx, [ebp-54h]
  '00537AE4: call [00401378h]
  '00537AEA: push eax
  '00537AEB: mov edx, [ebp-50h]
  '00537AEE: push edx
  '00537AEF: call [0040108Ch]
  '00537AF5: mov edx, eax
  '00537AF7: lea ecx, [ebp-58h]
  '00537AFA: call [00401378h]
  '00537B00: push eax
  '00537B01: push 0041C0D8h
  '00537B06: call [0040108Ch]
  '00537B0C: mov edx, eax
  '00537B0E: lea ecx, [ebp-5Ch]
  '00537B11: call [00401378h]
  '00537B17: lea eax, [ebp-5Ch]
  '00537B1A: push eax
  '00537B1B: mov ecx, [ebp-00000128h]
  '00537B21: mov edx, [ecx]
  '00537B23: mov eax, [ebp-00000128h]
  '00537B29: push eax
  '00537B2A: call [edx+0000070Ch]
  '00537B30: fclex 
  '00537B32: mov [ebp-0000012Ch], eax
  '00537B38: cmp [ebp-0000012Ch], 00000000h
  '00537B3F: jnl 537B67h
  '00537B41: push 0000070Ch
  '00537B46: push 0041C118h
  '00537B4B: mov ecx, [ebp-00000128h]
  '00537B51: push ecx
  '00537B52: mov edx, [ebp-0000012Ch]
  '00537B58: push edx
  '00537B59: call [004010A0h]
  '00537B5F: mov [ebp-00000170h], eax
  '00537B65: jmp 537B71h
  '00537B67: mov [ebp-00000170h], 00000000h
  '00537B71: lea eax, [ebp-5Ch]
  '00537B74: push eax
  '00537B75: lea ecx, [ebp-58h]
  '00537B78: push ecx
  '00537B79: lea edx, [ebp-50h]
  '00537B7C: push edx
  '00537B7D: lea eax, [ebp-54h]
  '00537B80: push eax
  '00537B81: lea ecx, [ebp-4Ch]
  '00537B84: push ecx
  '00537B85: lea edx, [ebp-44h]
  '00537B88: push edx
  '00537B89: lea eax, [ebp-48h]
  '00537B8C: push eax
  '00537B8D: lea ecx, [ebp-40h]
  '00537B90: push ecx
  '00537B91: lea edx, [ebp-38h]
  '00537B94: push edx
  '00537B95: lea eax, [ebp-3Ch]
  '00537B98: push eax
  '00537B99: lea ecx, [ebp-34h]
  '00537B9C: push ecx
  '00537B9D: lea edx, [ebp-2Ch]
  '00537BA0: push edx
  '00537BA1: lea eax, [ebp-30h]
  '00537BA4: push eax
  '00537BA5: lea ecx, [ebp-28h]
  '00537BA8: push ecx
  '00537BA9: lea edx, [ebp-24h]
  '00537BAC: push edx
  '00537BAD: push 0000000Fh
  '00537BAF: call [004012E8h]
  '00537BB5: add esp, 00000040h
  '00537BB8: lea eax, [ebp-70h]
  '00537BBB: push eax
  '00537BBC: lea ecx, [ebp-6Ch]
  '00537BBF: push ecx
  '00537BC0: lea edx, [ebp-68h]
  '00537BC3: push edx
  '00537BC4: lea eax, [ebp-64h]
  '00537BC7: push eax
  '00537BC8: lea ecx, [ebp-60h]
  '00537BCB: push ecx
  '00537BCC: push 00000005h
  '00537BCE: call [00401064h]
  '00537BD4: add esp, 00000018h
  '00537BD7: mov [ebp-04h], 00000006h
  '00537BDE: call [00401104h]
  '00537BE4: mov [ebp-04h], 00000007h
  '00537BEB: cmp [0054238Ch], 00000000h
  '00537BF2: jnz 537C10h
  '00537BF4: push 0054238Ch
  '00537BF9: push 0041D9E0h
  '00537BFE: call [004012B8h]
  '00537C04: mov [ebp-00000174h], 0054238Ch
  '00537C0E: jmp 537C1Ah
  '00537C10: mov [ebp-00000174h], 0054238Ch
  '00537C1A: mov edx, [ebp-00000174h]
  '00537C20: mov eax, [edx]
  '00537C22: mov [ebp-00000100h], eax
  '00537C28: mov ecx, [ebp+08h]
  '00537C2B: push ecx
  '00537C2C: lea edx, [ebp-60h]
  '00537C2F: push edx
  '00537C30: call [004010F8h]
  '00537C36: push eax
  '00537C37: mov eax, [ebp-00000100h]
  '00537C3D: mov ecx, [eax]
  '00537C3F: mov edx, [ebp-00000100h]
  '00537C45: push edx
  '00537C46: call [ecx+10h]
  '00537C49: fclex 
  '00537C4B: mov [ebp-00000104h], eax
  '00537C51: cmp [ebp-00000104h], 00000000h
  '00537C58: jnl 537C7Dh
  '00537C5A: push 00000010h
  '00537C5C: push 0041D9D0h
  '00537C61: mov eax, [ebp-00000100h]
  '00537C67: push eax
  '00537C68: mov ecx, [ebp-00000104h]
  '00537C6E: push ecx
  '00537C6F: call [004010A0h]
  '00537C75: mov [ebp-00000178h], eax
  '00537C7B: jmp 537C87h
  '00537C7D: mov [ebp-00000178h], 00000000h
  '00537C87: lea ecx, [ebp-60h]
  '00537C8A: call [004013B8h]
  '00537C90: jmp 00537D52h
  '00537C95: mov [ebp-04h], 00000009h
  '00537C9C: mov [ebp-000000A8h], 80020004h
  '00537CA6: mov [ebp-000000B0h], 0000000Ah
  '00537CB0: mov [ebp-00000098h], 80020004h
  '00537CBA: mov [ebp-000000A0h], 0000000Ah
  '00537CC4: mov [ebp-000000C8h], 0042D330h
  '00537CCE: mov [ebp-000000D0h], 00000008h
  '00537CD8: lea edx, [ebp-000000D0h]
  '00537CDE: lea ecx, [ebp-00000090h]
  '00537CE4: call [00401338h]
  '00537CEA: mov [ebp-000000B8h], 0042D2E8h
  '00537CF4: mov [ebp-000000C0h], 00000008h
  '00537CFE: lea edx, [ebp-000000C0h]
  '00537D04: lea ecx, [ebp-80h]
  '00537D07: call [00401338h]
  '00537D0D: lea edx, [ebp-000000B0h]
  '00537D13: push edx
  '00537D14: lea eax, [ebp-000000A0h]
  '00537D1A: push eax
  '00537D1B: lea ecx, [ebp-00000090h]
  '00537D21: push ecx
  '00537D22: push 00000040h
  '00537D24: lea edx, [ebp-80h]
  '00537D27: push edx
  '00537D28: call [004010E0h]
  '00537D2E: lea eax, [ebp-000000B0h]
  '00537D34: push eax
  '00537D35: lea ecx, [ebp-000000A0h]
  '00537D3B: push ecx
  '00537D3C: lea edx, [ebp-00000090h]
  '00537D42: push edx
  '00537D43: lea eax, [ebp-80h]
  '00537D46: push eax
  '00537D47: push 00000004h
  '00537D49: call [00401050h]
  '00537D4F: add esp, 00000014h
  '00537D52: jmp 0053832Dh
  '00537D57: mov [ebp-04h], 0000000Ch
  '00537D5E: call 00513300h
  '00537D63: cmp ax, FFFFh
  '00537D67: jnz 0053832Dh
  '00537D6D: mov [ebp-04h], 0000000Dh
  '00537D74: cmp [00541024h], 00000000h
  '00537D7B: jnz 537D99h
  '00537D7D: push 00541024h
  '00537D82: push 00413334h
  '00537D87: call [004012B8h]
  '00537D8D: mov [ebp-0000017Ch], 00541024h
  '00537D97: jmp 537DA3h
  '00537D99: mov [ebp-0000017Ch], 00541024h
  '00537DA3: mov ecx, [ebp-0000017Ch]
  '00537DA9: mov edx, [ecx]
  '00537DAB: mov [ebp-00000100h], edx
  '00537DB1: lea eax, [ebp-000000F4h]
  '00537DB7: push eax
  '00537DB8: mov ecx, [ebp-00000100h]
  '00537DBE: mov edx, [ecx]
  '00537DC0: mov eax, [ebp-00000100h]
  '00537DC6: push eax
  '00537DC7: call [edx+0000075Ch]
  '00537DCD: fclex 
  '00537DCF: mov [ebp-00000104h], eax
  '00537DD5: cmp [ebp-00000104h], 00000000h
  '00537DDC: jnl 537E04h
  '00537DDE: push 0000075Ch
  '00537DE3: push 0041C118h
  '00537DE8: mov ecx, [ebp-00000100h]
  '00537DEE: push ecx
  '00537DEF: mov edx, [ebp-00000104h]
  '00537DF5: push edx
  '00537DF6: call [004010A0h]
  '00537DFC: mov [ebp-00000180h], eax
  '00537E02: jmp 537E0Eh
  '00537E04: mov [ebp-00000180h], 00000000h
  '00537E0E: cmp [00541024h], 00000000h
  '00537E15: jnz 537E33h
  '00537E17: push 00541024h
  '00537E1C: push 00413334h
  '00537E21: call [004012B8h]
  '00537E27: mov [ebp-00000184h], 00541024h
  '00537E31: jmp 537E3Dh
  '00537E33: mov [ebp-00000184h], 00541024h
  '00537E3D: mov eax, [ebp-00000184h]
  '00537E43: mov ecx, [eax]
  '00537E45: mov [ebp-00000130h], ecx
  '00537E4B: mov edx, [ebp+08h]
  '00537E4E: mov eax, [edx]
  '00537E50: mov ecx, [ebp+08h]
  '00537E53: push ecx
  '00537E54: call [eax+00000318h]
  '00537E5A: push eax
  '00537E5B: lea edx, [ebp-60h]
  '00537E5E: push edx
  '00537E5F: call [004010E4h]
  '00537E65: mov [ebp-00000108h], eax
  '00537E6B: lea eax, [ebp-24h]
  '00537E6E: push eax
  '00537E6F: mov ecx, [ebp-00000108h]
  '00537E75: mov edx, [ecx]
  '00537E77: mov eax, [ebp-00000108h]
  '00537E7D: push eax
  '00537E7E: call [edx+000000A0h]
  '00537E84: fclex 
  '00537E86: mov [ebp-0000010Ch], eax
  '00537E8C: cmp [ebp-0000010Ch], 00000000h
  '00537E93: jnl 537EBBh
  '00537E95: push 000000A0h
  '00537E9A: push 0041E3FCh
  '00537E9F: mov ecx, [ebp-00000108h]
  '00537EA5: push ecx
  '00537EA6: mov edx, [ebp-0000010Ch]
  '00537EAC: push edx
  '00537EAD: call [004010A0h]
  '00537EB3: mov [ebp-00000188h], eax
  '00537EB9: jmp 537EC5h
  '00537EBB: mov [ebp-00000188h], 00000000h
  '00537EC5: mov eax, [ebp+08h]
  '00537EC8: mov ecx, [eax]
  '00537ECA: mov edx, [ebp+08h]
  '00537ECD: push edx
  '00537ECE: call [ecx+00000314h]
  '00537ED4: push eax
  '00537ED5: lea eax, [ebp-64h]
  '00537ED8: push eax
  '00537ED9: call [004010E4h]
  '00537EDF: mov [ebp-00000110h], eax
  '00537EE5: lea ecx, [ebp-2Ch]
  '00537EE8: push ecx
  '00537EE9: mov edx, [ebp-00000110h]
  '00537EEF: mov eax, [edx]
  '00537EF1: mov ecx, [ebp-00000110h]
  '00537EF7: push ecx
  '00537EF8: call [eax+000000A0h]
  '00537EFE: fclex 
  '00537F00: mov [ebp-00000114h], eax
  '00537F06: cmp [ebp-00000114h], 00000000h
  '00537F0D: jnl 537F35h
  '00537F0F: push 000000A0h
  '00537F14: push 0041E3FCh
  '00537F19: mov edx, [ebp-00000110h]
  '00537F1F: push edx
  '00537F20: mov eax, [ebp-00000114h]
  '00537F26: push eax
  '00537F27: call [004010A0h]
  '00537F2D: mov [ebp-0000018Ch], eax
  '00537F33: jmp 537F3Fh
  '00537F35: mov [ebp-0000018Ch], 00000000h
  '00537F3F: mov ecx, [ebp+08h]
  '00537F42: mov edx, [ecx]
  '00537F44: mov eax, [ebp+08h]
  '00537F47: push eax
  '00537F48: call [edx+00000308h]
  '00537F4E: push eax
  '00537F4F: lea ecx, [ebp-68h]
  '00537F52: push ecx
  '00537F53: call [004010E4h]
  '00537F59: mov [ebp-00000118h], eax
  '00537F5F: lea edx, [ebp-38h]
  '00537F62: push edx
  '00537F63: mov eax, [ebp-00000118h]
  '00537F69: mov ecx, [eax]
  '00537F6B: mov edx, [ebp-00000118h]
  '00537F71: push edx
  '00537F72: call [ecx+000000A0h]
  '00537F78: fclex 
  '00537F7A: mov [ebp-0000011Ch], eax
  '00537F80: cmp [ebp-0000011Ch], 00000000h
  '00537F87: jnl 537FAFh
  '00537F89: push 000000A0h
  '00537F8E: push 0041E3FCh
  '00537F93: mov eax, [ebp-00000118h]
  '00537F99: push eax
  '00537F9A: mov ecx, [ebp-0000011Ch]
  '00537FA0: push ecx
  '00537FA1: call [004010A0h]
  '00537FA7: mov [ebp-00000190h], eax
  '00537FAD: jmp 537FB9h
  '00537FAF: mov [ebp-00000190h], 00000000h
  '00537FB9: mov edx, [ebp+08h]
  '00537FBC: mov eax, [edx]
  '00537FBE: mov ecx, [ebp+08h]
  '00537FC1: push ecx
  '00537FC2: call [eax+00000310h]
  '00537FC8: push eax
  '00537FC9: lea edx, [ebp-6Ch]
  '00537FCC: push edx
  '00537FCD: call [004010E4h]
  '00537FD3: mov [ebp-00000120h], eax
  '00537FD9: lea eax, [ebp-44h]
  '00537FDC: push eax
  '00537FDD: mov ecx, [ebp-00000120h]
  '00537FE3: mov edx, [ecx]
  '00537FE5: mov eax, [ebp-00000120h]
  '00537FEB: push eax
  '00537FEC: call [edx+000000A0h]
  '00537FF2: fclex 
  '00537FF4: mov [ebp-00000124h], eax
  '00537FFA: cmp [ebp-00000124h], 00000000h
  '00538001: jnl 538029h
  '00538003: push 000000A0h
  '00538008: push 0041E3FCh
  '0053800D: mov ecx, [ebp-00000120h]
  '00538013: push ecx
  '00538014: mov edx, [ebp-00000124h]
  '0053801A: push edx
  '0053801B: call [004010A0h]
  '00538021: mov [ebp-00000194h], eax
  '00538027: jmp 538033h
  '00538029: mov [ebp-00000194h], 00000000h
  '00538033: mov eax, [ebp+08h]
  '00538036: mov ecx, [eax]
  '00538038: mov edx, [ebp+08h]
  '0053803B: push edx
  '0053803C: call [ecx+0000030Ch]
  '00538042: push eax
  '00538043: lea eax, [ebp-70h]
  '00538046: push eax
  '00538047: call [004010E4h]
  '0053804D: mov [ebp-00000128h], eax
  '00538053: lea ecx, [ebp-50h]
  '00538056: push ecx
  '00538057: mov edx, [ebp-00000128h]
  '0053805D: mov eax, [edx]
  '0053805F: mov ecx, [ebp-00000128h]
  '00538065: push ecx
  '00538066: call [eax+000000A0h]
  '0053806C: fclex 
  '0053806E: mov [ebp-0000012Ch], eax
  '00538074: cmp [ebp-0000012Ch], 00000000h
  '0053807B: jnl 5380A3h
  '0053807D: push 000000A0h
  '00538082: push 0041E3FCh
  '00538087: mov edx, [ebp-00000128h]
  '0053808D: push edx
  '0053808E: mov eax, [ebp-0000012Ch]
  '00538094: push eax
  '00538095: call [004010A0h]
  '0053809B: mov [ebp-00000198h], eax
  '005380A1: jmp 5380ADh
  '005380A3: mov [ebp-00000198h], 00000000h
  '005380AD: push 00424270h
  '005380B2: mov ecx, [ebp-24h]
  '005380B5: push ecx
  '005380B6: call [0040108Ch]
  '005380BC: mov edx, eax
  '005380BE: lea ecx, [ebp-28h]
  '005380C1: call [00401378h]
  '005380C7: push eax
  '005380C8: push 0041C0D8h
  '005380CD: call [0040108Ch]
  '005380D3: mov edx, eax
  '005380D5: lea ecx, [ebp-30h]
  '005380D8: call [00401378h]
  '005380DE: push eax
  '005380DF: mov edx, [ebp-2Ch]
  '005380E2: push edx
  '005380E3: call [0040108Ch]
  '005380E9: mov edx, eax
  '005380EB: lea ecx, [ebp-34h]
  '005380EE: call [00401378h]
  '005380F4: push eax
  '005380F5: push 0041C0D8h
  '005380FA: call [0040108Ch]
  '00538100: mov edx, eax
  '00538102: lea ecx, [ebp-3Ch]
  '00538105: call [00401378h]
  '0053810B: push eax
  '0053810C: mov eax, [ebp-38h]
  '0053810F: push eax
  '00538110: call [0040108Ch]
  '00538116: mov edx, eax
  '00538118: lea ecx, [ebp-40h]
  '0053811B: call [00401378h]
  '00538121: push eax
  '00538122: push 0041C0D8h
  '00538127: call [0040108Ch]
  '0053812D: mov edx, eax
  '0053812F: lea ecx, [ebp-48h]
  '00538132: call [00401378h]
  '00538138: push eax
  '00538139: mov ecx, [ebp-44h]
  '0053813C: push ecx
  '0053813D: call [0040108Ch]
  '00538143: mov edx, eax
  '00538145: lea ecx, [ebp-4Ch]
  '00538148: call [00401378h]
  '0053814E: push eax
  '0053814F: push 0041C0D8h
  '00538154: call [0040108Ch]
  '0053815A: mov edx, eax
  '0053815C: lea ecx, [ebp-54h]
  '0053815F: call [00401378h]
  '00538165: push eax
  '00538166: mov edx, [ebp-50h]
  '00538169: push edx
  '0053816A: call [0040108Ch]
  '00538170: mov edx, eax
  '00538172: lea ecx, [ebp-58h]
  '00538175: call [00401378h]
  '0053817B: push eax
  '0053817C: push 0041C0D8h
  '00538181: call [0040108Ch]
  '00538187: mov edx, eax
  '00538189: lea ecx, [ebp-5Ch]
  '0053818C: call [00401378h]
  '00538192: mov ax, [ebp-000000F4h]
  '00538199: mov [ebp-000000F8h], ax
  '005381A0: lea ecx, [ebp-5Ch]
  '005381A3: push ecx
  '005381A4: lea edx, [ebp-000000F8h]
  '005381AA: push edx
  '005381AB: mov eax, [ebp-00000130h]
  '005381B1: mov ecx, [eax]
  '005381B3: mov edx, [ebp-00000130h]
  '005381B9: push edx
  '005381BA: call [ecx+00000714h]
  '005381C0: fclex 
  '005381C2: mov [ebp-00000134h], eax
  '005381C8: cmp [ebp-00000134h], 00000000h
  '005381CF: jnl 5381F7h
  '005381D1: push 00000714h
  '005381D6: push 0041C118h
  '005381DB: mov eax, [ebp-00000130h]
  '005381E1: push eax
  '005381E2: mov ecx, [ebp-00000134h]
  '005381E8: push ecx
  '005381E9: call [004010A0h]
  '005381EF: mov [ebp-0000019Ch], eax
  '005381F5: jmp 538201h
  '005381F7: mov [ebp-0000019Ch], 00000000h
  '00538201: lea edx, [ebp-5Ch]
  '00538204: push edx
  '00538205: lea eax, [ebp-58h]
  '00538208: push eax
  '00538209: lea ecx, [ebp-50h]
  '0053820C: push ecx
  '0053820D: lea edx, [ebp-54h]
  '00538210: push edx
  '00538211: lea eax, [ebp-4Ch]
  '00538214: push eax
  '00538215: lea ecx, [ebp-44h]
  '00538218: push ecx
  '00538219: lea edx, [ebp-48h]
  '0053821C: push edx
  '0053821D: lea eax, [ebp-40h]
  '00538220: push eax
  '00538221: lea ecx, [ebp-38h]
  '00538224: push ecx
  '00538225: lea edx, [ebp-3Ch]
  '00538228: push edx
  '00538229: lea eax, [ebp-34h]
  '0053822C: push eax
  '0053822D: lea ecx, [ebp-2Ch]
  '00538230: push ecx
  '00538231: lea edx, [ebp-30h]
  '00538234: push edx
  '00538235: lea eax, [ebp-28h]
  '00538238: push eax
  '00538239: lea ecx, [ebp-24h]
  '0053823C: push ecx
  '0053823D: push 0000000Fh
  '0053823F: call [004012E8h]
  '00538245: add esp, 00000040h
  '00538248: lea edx, [ebp-70h]
  '0053824B: push edx
  '0053824C: lea eax, [ebp-6Ch]
  '0053824F: push eax
  '00538250: lea ecx, [ebp-68h]
  '00538253: push ecx
  '00538254: lea edx, [ebp-64h]
  '00538257: push edx
  '00538258: lea eax, [ebp-60h]
  '0053825B: push eax
  '0053825C: push 00000005h
  '0053825E: call [00401064h]
  '00538264: add esp, 00000018h
  '00538267: mov [ebp-04h], 0000000Eh
  '0053826E: call [00401104h]
  '00538274: mov [ebp-04h], 0000000Fh
  '0053827B: call [00401104h]
  '00538281: mov [ebp-04h], 00000010h
  '00538288: cmp [0054238Ch], 00000000h
  '0053828F: jnz 5382ADh
  '00538291: push 0054238Ch
  '00538296: push 0041D9E0h
  '0053829B: call [004012B8h]
  '005382A1: mov [ebp-000001A0h], 0054238Ch
  '005382AB: jmp 5382B7h
  '005382AD: mov [ebp-000001A0h], 0054238Ch
  '005382B7: mov ecx, [ebp-000001A0h]
  '005382BD: mov edx, [ecx]
  '005382BF: mov [ebp-00000100h], edx
  '005382C5: mov eax, [ebp+08h]
  '005382C8: push eax
  '005382C9: lea ecx, [ebp-60h]
  '005382CC: push ecx
  '005382CD: call [004010F8h]
  '005382D3: push eax
  '005382D4: mov edx, [ebp-00000100h]
  '005382DA: mov eax, [edx]
  '005382DC: mov ecx, [ebp-00000100h]
  '005382E2: push ecx
  '005382E3: call [eax+10h]
  '005382E6: fclex 
  '005382E8: mov [ebp-00000104h], eax
  '005382EE: cmp [ebp-00000104h], 00000000h
  '005382F5: jnl 53831Ah
  '005382F7: push 00000010h
  '005382F9: push 0041D9D0h
  '005382FE: mov edx, [ebp-00000100h]
  '00538304: push edx
  '00538305: mov eax, [ebp-00000104h]
  '0053830B: push eax
  '0053830C: call [004010A0h]
  '00538312: mov [ebp-000001A4h], eax
  '00538318: jmp 538324h
  '0053831A: mov [ebp-000001A4h], 00000000h
  '00538324: lea ecx, [ebp-60h]
  '00538327: call [004013B8h]
  '0053832D: mov [ebp-10h], 00000000h
  '00538334: push 005383CAh
  '00538339: jmp 005383C9h
  '0053833E: lea ecx, [ebp-5Ch]
  '00538341: push ecx
  '00538342: lea edx, [ebp-58h]
  '00538345: push edx
  '00538346: lea eax, [ebp-54h]
  '00538349: push eax
  '0053834A: lea ecx, [ebp-50h]
  '0053834D: push ecx
  '0053834E: lea edx, [ebp-4Ch]
  '00538351: push edx
  '00538352: lea eax, [ebp-48h]
  '00538355: push eax
  '00538356: lea ecx, [ebp-44h]
  '00538359: push ecx
  '0053835A: lea edx, [ebp-40h]
  '0053835D: push edx
  '0053835E: lea eax, [ebp-3Ch]
  '00538361: push eax
  '00538362: lea ecx, [ebp-38h]
  '00538365: push ecx
  '00538366: lea edx, [ebp-34h]
  '00538369: push edx
  '0053836A: lea eax, [ebp-30h]
  '0053836D: push eax
  '0053836E: lea ecx, [ebp-2Ch]
  '00538371: push ecx
  '00538372: lea edx, [ebp-28h]
  '00538375: push edx
  '00538376: lea eax, [ebp-24h]
  '00538379: push eax
  '0053837A: push 0000000Fh
  '0053837C: call [004012E8h]
  '00538382: add esp, 00000040h
  '00538385: lea ecx, [ebp-70h]
  '00538388: push ecx
  '00538389: lea edx, [ebp-6Ch]
  '0053838C: push edx
  '0053838D: lea eax, [ebp-68h]
  '00538390: push eax
  '00538391: lea ecx, [ebp-64h]
  '00538394: push ecx
  '00538395: lea edx, [ebp-60h]
  '00538398: push edx
  '00538399: push 00000005h
  '0053839B: call [00401064h]
  '005383A1: add esp, 00000018h
  '005383A4: lea eax, [ebp-000000B0h]
  '005383AA: push eax
  '005383AB: lea ecx, [ebp-000000A0h]
  '005383B1: push ecx
  '005383B2: lea edx, [ebp-00000090h]
  '005383B8: push edx
  '005383B9: lea eax, [ebp-80h]
  '005383BC: push eax
  '005383BD: push 00000004h
  '005383BF: call [00401050h]
  '005383C5: add esp, 00000014h
  '005383C8: ret 
End Sub
Private Sub cmdCancel__537340
  '00537340: push ebp
  '00537341: mov ebp, esp
  '00537343: sub esp, 0000000Ch
  '00537346: push 004081B6h
  '0053734B: mov eax, fs:[00h]
  '00537351: push eax
  '00537352: mov fs:[00000000h], esp
  '00537359: sub esp, 00000018h
  '0053735C: push ebx
  '0053735D: push esi
  '0053735E: push edi
  '0053735F: mov [ebp-0Ch], esp
  '00537362: mov [ebp-08h], 00407C28h
  '00537369: mov edi, [ebp+08h]
  '0053736C: mov eax, edi
  '0053736E: and eax, 00000001h
  '00537371: mov [ebp-04h], eax
  '00537374: and edi, FFFFFFFEh
  '00537377: push edi
  '00537378: mov [ebp+08h], edi
  '0053737B: mov ecx, [edi]
  '0053737D: call [ecx+04h]
  '00537380: mov eax, [54238Ch]
  '00537385: xor ebx, ebx
  '00537387: cmp eax, ebx
  '00537389: mov [ebp-18h], ebx
  '0053738C: jnz 53739Eh
  '0053738E: push 0054238Ch
  '00537393: push 0041D9E0h
  '00537398: call [004012B8h]
  '0053739E: mov esi, [0054238Ch]
  '005373A4: lea eax, [ebp-18h]
  '005373A7: push edi
  '005373A8: push eax
  '005373A9: mov edx, [esi]
  '005373AB: mov [ebp-2Ch], edx
  '005373AE: call [004010F8h]
  '005373B4: mov ecx, [ebp-2Ch]
  '005373B7: push eax
  '005373B8: push esi
  '005373B9: call [ecx+10h]
  '005373BC: cmp eax, ebx
  '005373BE: fclex 
  '005373C0: jnl 5373D1h
  '005373C2: push 00000010h
  '005373C4: push 0041D9D0h
  '005373C9: push esi
  '005373CA: push eax
  '005373CB: call [004010A0h]
  '005373D1: lea ecx, [ebp-18h]
  '005373D4: call [004013B8h]
  '005373DA: mov [ebp-04h], ebx
  '005373DD: push 005373EFh
  '005373E2: jmp 5373EEh
  '005373E4: lea ecx, [ebp-18h]
  '005373E7: call [004013B8h]
  '005373ED: ret 
End Sub
Private Sub cmdHelp__537410
  '00537410: push ebp
  '00537411: mov ebp, esp
  '00537413: sub esp, 0000000Ch
  '00537416: push 004081B6h
  '0053741B: mov eax, fs:[00h]
  '00537421: push eax
  '00537422: mov fs:[00000000h], esp
  '00537429: sub esp, 00000088h
  '0053742F: push ebx
  '00537430: push esi
  '00537431: push edi
  '00537432: mov [ebp-0Ch], esp
  '00537435: mov [ebp-08h], 00407C38h
  '0053743C: mov eax, [ebp+08h]
  '0053743F: mov ecx, eax
  '00537441: and ecx, 00000001h
  '00537444: mov [ebp-04h], ecx
  '00537447: and al, FEh
  '00537449: push eax
  '0053744A: mov [ebp+08h], eax
  '0053744D: mov edx, [eax]
  '0053744F: call [edx+04h]
  '00537452: mov edi, [00401338h]
  '00537458: mov ecx, 80020004h
  '0053745D: xor esi, esi
  '0053745F: mov [ebp-4Ch], ecx
  '00537462: mov eax, 0000000Ah
  '00537467: mov [ebp-3Ch], ecx
  '0053746A: mov ebx, 00000008h
  '0053746F: mov [ebp-44h], esi
  '00537472: mov [ebp-54h], esi
  '00537475: mov [ebp-74h], esi
  '00537478: lea edx, [ebp-74h]
  '0053747B: lea ecx, [ebp-34h]
  '0053747E: mov [ebp-24h], esi
  '00537481: mov [ebp-34h], esi
  '00537484: mov [ebp-64h], esi
  '00537487: mov [ebp-54h], eax
  '0053748A: mov [ebp-44h], eax
  '0053748D: mov [ebp-6Ch], 0042D1D4h
  '00537494: mov [ebp-74h], ebx
  '00537497: call edi
  '00537499: lea edx, [ebp-64h]
  '0053749C: lea ecx, [ebp-24h]
  '0053749F: mov [ebp-5Ch], 0042D164h
  '005374A6: mov [ebp-64h], ebx
  '005374A9: call edi
  '005374AB: lea eax, [ebp-54h]
  '005374AE: lea ecx, [ebp-44h]
  '005374B1: push eax
  '005374B2: lea edx, [ebp-34h]
  '005374B5: push ecx
  '005374B6: push edx
  '005374B7: lea eax, [ebp-24h]
  '005374BA: push 00000040h
  '005374BC: push eax
  '005374BD: call [004010E0h]
  '005374C3: lea ecx, [ebp-54h]
  '005374C6: lea edx, [ebp-44h]
  '005374C9: push ecx
  '005374CA: lea eax, [ebp-34h]
  '005374CD: push edx
  '005374CE: lea ecx, [ebp-24h]
  '005374D1: push eax
  '005374D2: push ecx
  '005374D3: push 00000004h
  '005374D5: call [00401050h]
  '005374DB: add esp, 00000014h
  '005374DE: mov [ebp-04h], esi
  '005374E1: push 00537505h
  '005374E6: jmp 537504h
  '005374E8: lea edx, [ebp-54h]
  '005374EB: lea eax, [ebp-44h]
  '005374EE: push edx
  '005374EF: lea ecx, [ebp-34h]
  '005374F2: push eax
  '005374F3: lea edx, [ebp-24h]
  '005374F6: push ecx
  '005374F7: push edx
  '005374F8: push 00000004h
  '005374FA: call [00401050h]
  '00537500: add esp, 00000014h
  '00537503: ret 
End Sub

