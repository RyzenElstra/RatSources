VERSION 5.00
Begin VB.Form frmMsgbox
  Caption = "MiniMo"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  BorderStyle = 1 'Fixed Single
  Icon = "frmMsgbox.frx":0
  LinkTopic = "Form2"
  MaxButton = 0   'False
  MinButton = 0   'False
  ControlBox = 0   'False
  ClientLeft = 45
  ClientTop = 330
  ClientWidth = 5220
  ClientHeight = 1425
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
  Begin VB.CommandButton cmdOK
    Caption = "OK"
    Left = 1680
    Top = 960
    Width = 1695
    Height = 375
    TabIndex = 0
  End
  Begin VB.Label Label1
    Caption = "Label1"
    Left = 120
    Top = 120
    Width = 5055
    Height = 495
    TabIndex = 1
  End
End

Attribute VB_Name = "frmMsgbox"

Private Sub cmdOK__53CA60
  '0053CA60: push ebp
  '0053CA61: mov ebp, esp
  '0053CA63: sub esp, 0000000Ch
  '0053CA66: push 004081B6h
  '0053CA6B: mov eax, fs:[00h]
  '0053CA71: push eax
  '0053CA72: mov fs:[00000000h], esp
  '0053CA79: sub esp, 00000018h
  '0053CA7C: push ebx
  '0053CA7D: push esi
  '0053CA7E: push edi
  '0053CA7F: mov [ebp-0Ch], esp
  '0053CA82: mov [ebp-08h], 00407EC8h
  '0053CA89: mov edi, [ebp+08h]
  '0053CA8C: mov eax, edi
  '0053CA8E: and eax, 00000001h
  '0053CA91: mov [ebp-04h], eax
  '0053CA94: and edi, FFFFFFFEh
  '0053CA97: push edi
  '0053CA98: mov [ebp+08h], edi
  '0053CA9B: mov ecx, [edi]
  '0053CA9D: call [ecx+04h]
  '0053CAA0: mov eax, [54238Ch]
  '0053CAA5: xor ebx, ebx
  '0053CAA7: cmp eax, ebx
  '0053CAA9: mov [ebp-18h], ebx
  '0053CAAC: jnz 53CABEh
  '0053CAAE: push 0054238Ch
  '0053CAB3: push 0041D9E0h
  '0053CAB8: call [004012B8h]
  '0053CABE: mov esi, [0054238Ch]
  '0053CAC4: lea eax, [ebp-18h]
  '0053CAC7: push edi
  '0053CAC8: push eax
  '0053CAC9: mov edx, [esi]
  '0053CACB: mov [ebp-2Ch], edx
  '0053CACE: call [004010F8h]
  '0053CAD4: mov ecx, [ebp-2Ch]
  '0053CAD7: push eax
  '0053CAD8: push esi
  '0053CAD9: call [ecx+10h]
  '0053CADC: cmp eax, ebx
  '0053CADE: fclex 
  '0053CAE0: jnl 53CAF1h
  '0053CAE2: push 00000010h
  '0053CAE4: push 0041D9D0h
  '0053CAE9: push esi
  '0053CAEA: push eax
  '0053CAEB: call [004010A0h]
  '0053CAF1: lea ecx, [ebp-18h]
  '0053CAF4: call [004013B8h]
  '0053CAFA: mov [ebp-04h], ebx
  '0053CAFD: push 0053CB0Fh
  '0053CB02: jmp 53CB0Eh
  '0053CB04: lea ecx, [ebp-18h]
  '0053CB07: call [004013B8h]
  '0053CB0D: ret 
End Sub
Private Sub Form__53CB30
  '0053CB30: push ebp
  '0053CB31: mov ebp, esp
  '0053CB33: sub esp, 0000000Ch
  '0053CB36: push 004081B6h
  '0053CB3B: mov eax, fs:[00h]
  '0053CB41: push eax
  '0053CB42: mov fs:[00000000h], esp
  '0053CB49: sub esp, 00000038h
  '0053CB4C: push ebx
  '0053CB4D: push esi
  '0053CB4E: push edi
  '0053CB4F: mov [ebp-0Ch], esp
  '0053CB52: mov [ebp-08h], 00407ED8h
  '0053CB59: mov esi, [ebp+08h]
  '0053CB5C: mov eax, esi
  '0053CB5E: and eax, 00000001h
  '0053CB61: mov [ebp-04h], eax
  '0053CB64: and esi, FFFFFFFEh
  '0053CB67: push esi
  '0053CB68: mov [ebp+08h], esi
  '0053CB6B: mov ecx, [esi]
  '0053CB6D: call [ecx+04h]
  '0053CB70: mov edx, [esi]
  '0053CB72: lea eax, [ebp-1Ch]
  '0053CB75: xor ebx, ebx
  '0053CB77: push eax
  '0053CB78: push esi
  '0053CB79: mov [ebp-18h], ebx
  '0053CB7C: mov [ebp-1Ch], ebx
  '0053CB7F: mov [ebp-2Ch], ebx
  '0053CB82: mov [ebp-30h], ebx
  '0053CB85: mov [ebp-38h], ebx
  '0053CB88: mov [ebp-3Ch], ebx
  '0053CB8B: call [edx+00000218h]
  '0053CB91: cmp eax, ebx
  '0053CB93: fclex 
  '0053CB95: jnl 53CBA9h
  '0053CB97: push 00000218h
  '0053CB9C: push 00426DA0h
  '0053CBA1: push esi
  '0053CBA2: push eax
  '0053CBA3: call [004010A0h]
  '0053CBA9: mov eax, [ebp-1Ch]
  '0053CBAC: lea ecx, [ebp-38h]
  '0053CBAF: push eax
  '0053CBB0: push ecx
  '0053CBB1: mov [ebp-1Ch], ebx
  '0053CBB4: call [004010E4h]
  '0053CBBA: push eax
  '0053CBBB: lea edx, [ebp-18h]
  '0053CBBE: lea eax, [ebp-3Ch]
  '0053CBC1: push edx
  '0053CBC2: push eax
  '0053CBC3: push 0041F304h
  '0053CBC8: call [004010CCh]
  '0053CBCE: mov esi, [00401278h]
  '0053CBD4: mov edi, [0040130Ch]
  '0053CBDA: cmp eax, ebx
  '0053CBDC: jz 0053CC8Ah
  '0053CBE2: mov ecx, [ebp-18h]
  '0053CBE5: push 0041E3FCh
  '0053CBEA: push ecx
  '0053CBEB: call esi
  '0053CBED: mov edx, [ebp-18h]
  '0053CBF0: mov bx, ax
  '0053CBF3: neg bx
  '0053CBF6: sbb ebx, ebx
  '0053CBF8: push 00420F60h
  '0053CBFD: push edx
  '0053CBFE: inc ebx
  '0053CBFF: call esi
  '0053CC01: neg ax
  '0053CC04: sbb eax, eax
  '0053CC06: push 0041FB8Ch
  '0053CC0B: inc eax
  '0053CC0C: and ebx, eax
  '0053CC0E: mov eax, [ebp-18h]
  '0053CC11: neg ebx
  '0053CC13: sbb ebx, ebx
  '0053CC15: push eax
  '0053CC16: neg ebx
  '0053CC18: call esi
  '0053CC1A: neg ax
  '0053CC1D: mov ecx, [ebp-18h]
  '0053CC20: push 0041CE08h
  '0053CC25: sbb eax, eax
  '0053CC27: push ecx
  '0053CC28: inc eax
  '0053CC29: and ebx, eax
  '0053CC2B: neg ebx
  '0053CC2D: sbb ebx, ebx
  '0053CC2F: neg ebx
  '0053CC31: call esi
  '0053CC33: neg ax
  '0053CC36: sbb eax, eax
  '0053CC38: inc eax
  '0053CC39: test ebx, eax
  '0053CC3B: jnz 53CC70h
  '0053CC3D: mov edx, [ebp-18h]
  '0053CC40: xor ebx, ebx
  '0053CC42: push ebx
  '0053CC43: push 00420F70h
  '0053CC48: lea eax, [ebp-2Ch]
  '0053CC4B: push edx
  '0053CC4C: push eax
  '0053CC4D: call [00401368h]
  '0053CC53: add esp, 00000010h
  '0053CC56: push eax
  '0053CC57: call edi
  '0053CC59: lea ecx, [ebp-30h]
  '0053CC5C: mov [ebp-30h], eax
  '0053CC5F: push ecx
  '0053CC60: call 004EB0B0h
  '0053CC65: lea ecx, [ebp-2Ch]
  '0053CC68: call [00401030h]
  '0053CC6E: jmp 53CC72h
  '0053CC70: xor ebx, ebx
  '0053CC72: lea edx, [ebp-18h]
  '0053CC75: lea eax, [ebp-3Ch]
  '0053CC78: push edx
  '0053CC79: push eax
  '0053CC7A: push 0041F304h
  '0053CC7F: call [00401150h]
  '0053CC85: jmp 0053CBDAh
  '0053CC8A: mov [ebp-04h], ebx
  '0053CC8D: push 0053CCC4h
  '0053CC92: jmp 53CCA7h
  '0053CC94: lea ecx, [ebp-1Ch]
  '0053CC97: call [004013B8h]
  '0053CC9D: lea ecx, [ebp-2Ch]
  '0053CCA0: call [00401030h]
  '0053CCA6: ret 
End Sub

