VERSION 5.00
Begin VB.Form frmFirstLoad
  Caption = "Welcome to MiniMo!"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  BorderStyle = 4 'Fixed ToolWindow
  'Icon = n/a
  LinkTopic = "Form1"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 45
  ClientTop = 285
  ClientWidth = 5415
  ClientHeight = 4035
  ShowInTaskbar = 0   'False
  StartUpPosition = 2 'CenterScreen
  Begin VB.CommandButton Command1
    Caption = "Continue"
    Left = 1440
    Top = 3600
    Width = 2295
    Height = 255
    TabIndex = 3
  End
  Begin VB.CheckBox Check1
    Caption = "Enable the tooltip help system."
    ForeColor = &H404040&
    Left = 1320
    Top = 3120
    Width = 3015
    Height = 255
    TabIndex = 2
    Value = 1
    BeginProperty Font
      Name = "Tahoma"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.PictureBox Picture1
    Picture = "frmFirstLoad.frx":0
    Left = 0
    Top = 0
    Width = 5415
    Height = 1695
    TabIndex = 0
    ScaleMode = 1
    DataFormat = 0
  End
  Begin VB.Label Label1
    Caption = "Welcome to the the MiniMo Edit Server! This is the first time you have run this program. A tooltip help system has been included to help new users understand the many features MiniMo offers. Just hover your mouse over buttons and text boxes for infomation on that specific feature. You may enable or disable the help feature by clicking the Help button in the bottom left corner of the program."
    ForeColor = &H404040&
    Left = 120
    Top = 1800
    Width = 5175
    Height = 1215
    TabIndex = 1
    BeginProperty Font
      Name = "Tahoma"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
End

Attribute VB_Name = "frmFirstLoad"

Private Sub Command1__49E400
  '0049E400: push ebp
  '0049E401: mov ebp, esp
  '0049E403: sub esp, 0000000Ch
  '0049E406: push 00403796h
  '0049E40B: mov eax, fs:[00h]
  '0049E411: push eax
  '0049E412: mov fs:[00000000h], esp
  '0049E419: sub esp, 0000003Ch
  '0049E41C: push ebx
  '0049E41D: push esi
  '0049E41E: push edi
  '0049E41F: mov [ebp-0Ch], esp
  '0049E422: mov [ebp-08h], 004036F0h
  '0049E429: mov esi, [ebp+08h]
  '0049E42C: mov eax, esi
  '0049E42E: and eax, 00000001h
  '0049E431: mov [ebp-04h], eax
  '0049E434: and esi, FFFFFFFEh
  '0049E437: push esi
  '0049E438: mov [ebp+08h], esi
  '0049E43B: mov ecx, [esi]
  '0049E43D: call [ecx+04h]
  '0049E440: mov edx, [esi]
  '0049E442: xor edi, edi
  '0049E444: push esi
  '0049E445: mov [ebp-18h], edi
  '0049E448: mov [ebp-3Ch], edi
  '0049E44B: call [edx+00000300h]
  '0049E451: push eax
  '0049E452: lea eax, [ebp-18h]
  '0049E455: push eax
  '0049E456: call [004010F0h]
  '0049E45C: mov esi, eax
  '0049E45E: lea edx, [ebp-3Ch]
  '0049E461: push edx
  '0049E462: push esi
  '0049E463: mov ecx, [esi]
  '0049E465: call [ecx+000000E0h]
  '0049E46B: cmp eax, edi
  '0049E46D: fclex 
  '0049E46F: jnl 49E483h
  '0049E471: push 000000E0h
  '0049E476: push 00412E78h
  '0049E47B: push esi
  '0049E47C: push eax
  '0049E47D: call [004010A8h]
  '0049E483: xor eax, eax
  '0049E485: cmp word ptr [ebp-3Ch], 0001h
  '0049E48A: lea ecx, [ebp-18h]
  '0049E48D: setz al
  '0049E490: neg eax
  '0049E492: mov esi, eax
  '0049E494: call [00401388h]
  '0049E49A: cmp si, di
  '0049E49D: jz 49E4A6h
  '0049E49F: push 0041441Ch
  '0049E4A4: jmp 49E4ABh
  '0049E4A6: push 004142E8h
  '0049E4AB: push 004142D0h
  '0049E4B0: push 004142B4h
  '0049E4B5: push 00410E04h
  '0049E4BA: call [00401010h]
  '0049E4C0: cmp [004A0248h], edi
  '0049E4C6: jnz 49E4D8h
  '0049E4C8: push 004A0248h
  '0049E4CD: push 004078F0h
  '0049E4D2: call [004012A8h]
  '0049E4D8: sub esp, 00000010h
  '0049E4DB: mov ecx, 0000000Ah
  '0049E4E0: mov ebx, esp
  '0049E4E2: mov [ebp-28h], ecx
  '0049E4E5: mov eax, 80020004h
  '0049E4EA: sub esp, 00000010h
  '0049E4ED: mov [ebx], ecx
  '0049E4EF: mov ecx, [ebp-34h]
  '0049E4F2: mov edx, eax
  '0049E4F4: mov esi, [004A0248h]
  '0049E4FA: mov [ebx+04h], ecx
  '0049E4FD: mov ecx, esp
  '0049E4FF: mov edi, [esi]
  '0049E501: push esi
  '0049E502: mov [ebx+08h], eax
  '0049E505: mov eax, [ebp-2Ch]
  '0049E508: mov [ebx+0Ch], eax
  '0049E50B: mov eax, [ebp-28h]
  '0049E50E: mov [ecx], eax
  '0049E510: mov eax, [ebp-24h]
  '0049E513: mov [ecx+04h], eax
  '0049E516: mov [ecx+08h], edx
  '0049E519: mov edx, [ebp-1Ch]
  '0049E51C: mov [ecx+0Ch], edx
  '0049E51F: call [edi+000002B0h]
  '0049E525: test eax, eax
  '0049E527: fclex 
  '0049E529: jnl 49E53Dh
  '0049E52B: push 000002B0h
  '0049E530: push 00410F84h
  '0049E535: push esi
  '0049E536: push eax
  '0049E537: call [004010A8h]
  '0049E53D: call [00401108h]
  '0049E543: mov eax, [4A0F98h]
  '0049E548: test eax, eax
  '0049E54A: jnz 49E55Ch
  '0049E54C: push 004A0F98h
  '0049E551: push 0040FFF4h
  '0049E556: call [004012A8h]
  '0049E55C: mov eax, [ebp+08h]
  '0049E55F: mov esi, [004A0F98h]
  '0049E565: lea ecx, [ebp-18h]
  '0049E568: push eax
  '0049E569: mov edi, [esi]
  '0049E56B: push ecx
  '0049E56C: call [004010FCh]
  '0049E572: push eax
  '0049E573: push esi
  '0049E574: call [edi+10h]
  '0049E577: test eax, eax
  '0049E579: fclex 
  '0049E57B: jnl 49E58Ch
  '0049E57D: push 00000010h
  '0049E57F: push 0040FFE4h
  '0049E584: push esi
  '0049E585: push eax
  '0049E586: call [004010A8h]
  '0049E58C: lea ecx, [ebp-18h]
  '0049E58F: call [00401388h]
  '0049E595: mov [ebp-04h], 00000000h
  '0049E59C: push 0049E5AEh
  '0049E5A1: jmp 49E5ADh
  '0049E5A3: lea ecx, [ebp-18h]
  '0049E5A6: call [00401388h]
  '0049E5AC: ret 
End Sub
Private Sub Form__49E5D0
  '0049E5D0: push ebp
  '0049E5D1: mov ebp, esp
  '0049E5D3: sub esp, 0000000Ch
  '0049E5D6: push 00403796h
  '0049E5DB: mov eax, fs:[00h]
  '0049E5E1: push eax
  '0049E5E2: mov fs:[00000000h], esp
  '0049E5E9: sub esp, 00000040h
  '0049E5EC: push ebx
  '0049E5ED: push esi
  '0049E5EE: push edi
  '0049E5EF: mov [ebp-0Ch], esp
  '0049E5F2: mov [ebp-08h], 00403700h
  '0049E5F9: mov esi, [ebp+08h]
  '0049E5FC: mov eax, esi
  '0049E5FE: and eax, 00000001h
  '0049E601: mov [ebp-04h], eax
  '0049E604: and esi, FFFFFFFEh
  '0049E607: push esi
  '0049E608: mov [ebp+08h], esi
  '0049E60B: mov ecx, [esi]
  '0049E60D: call [ecx+04h]
  '0049E610: mov edx, [esi]
  '0049E612: lea eax, [ebp-24h]
  '0049E615: xor ebx, ebx
  '0049E617: push eax
  '0049E618: push esi
  '0049E619: mov [ebp-18h], ebx
  '0049E61C: mov [ebp-20h], ebx
  '0049E61F: mov [ebp-24h], ebx
  '0049E622: mov [ebp-34h], ebx
  '0049E625: mov [ebp-38h], ebx
  '0049E628: mov [ebp-40h], ebx
  '0049E62B: mov [ebp-44h], ebx
  '0049E62E: call [edx+00000218h]
  '0049E634: cmp eax, ebx
  '0049E636: fclex 
  '0049E638: jnl 49E64Ch
  '0049E63A: push 00000218h
  '0049E63F: push 00410E60h
  '0049E644: push esi
  '0049E645: push eax
  '0049E646: call [004010A8h]
  '0049E64C: mov eax, [ebp-24h]
  '0049E64F: lea ecx, [ebp-40h]
  '0049E652: push eax
  '0049E653: push ecx
  '0049E654: mov [ebp-24h], ebx
  '0049E657: call [004010F0h]
  '0049E65D: push eax
  '0049E65E: lea edx, [ebp-18h]
  '0049E661: lea eax, [ebp-44h]
  '0049E664: push edx
  '0049E665: push eax
  '0049E666: push 00413C30h
  '0049E66B: call [004010D0h]
  '0049E671: mov esi, [00401270h]
  '0049E677: mov edi, [004012ECh]
  '0049E67D: cmp eax, ebx
  '0049E67F: jz 0049E72Dh
  '0049E685: mov ecx, [ebp-18h]
  '0049E688: push 00411B44h
  '0049E68D: push ecx
  '0049E68E: call esi
  '0049E690: mov edx, [ebp-18h]
  '0049E693: mov bx, ax
  '0049E696: neg bx
  '0049E699: sbb ebx, ebx
  '0049E69B: push 004146C8h
  '0049E6A0: push edx
  '0049E6A1: inc ebx
  '0049E6A2: call esi
  '0049E6A4: neg ax
  '0049E6A7: sbb eax, eax
  '0049E6A9: push 00411948h
  '0049E6AE: inc eax
  '0049E6AF: and ebx, eax
  '0049E6B1: mov eax, [ebp-18h]
  '0049E6B4: neg ebx
  '0049E6B6: sbb ebx, ebx
  '0049E6B8: push eax
  '0049E6B9: neg ebx
  '0049E6BB: call esi
  '0049E6BD: neg ax
  '0049E6C0: mov ecx, [ebp-18h]
  '0049E6C3: push 0041FE30h
  '0049E6C8: sbb eax, eax
  '0049E6CA: push ecx
  '0049E6CB: inc eax
  '0049E6CC: and ebx, eax
  '0049E6CE: neg ebx
  '0049E6D0: sbb ebx, ebx
  '0049E6D2: neg ebx
  '0049E6D4: call esi
  '0049E6D6: neg ax
  '0049E6D9: sbb eax, eax
  '0049E6DB: inc eax
  '0049E6DC: test ebx, eax
  '0049E6DE: jnz 49E713h
  '0049E6E0: mov edx, [ebp-18h]
  '0049E6E3: xor ebx, ebx
  '0049E6E5: push ebx
  '0049E6E6: push 004146D8h
  '0049E6EB: lea eax, [ebp-34h]
  '0049E6EE: push edx
  '0049E6EF: push eax
  '0049E6F0: call [0040132Ch]
  '0049E6F6: add esp, 00000010h
  '0049E6F9: push eax
  '0049E6FA: call edi
  '0049E6FC: lea ecx, [ebp-38h]
  '0049E6FF: mov [ebp-38h], eax
  '0049E702: push ecx
  '0049E703: call 00484740h
  '0049E708: lea ecx, [ebp-34h]
  '0049E70B: call [00401034h]
  '0049E711: jmp 49E715h
  '0049E713: xor ebx, ebx
  '0049E715: lea edx, [ebp-18h]
  '0049E718: lea eax, [ebp-44h]
  '0049E71B: push edx
  '0049E71C: push eax
  '0049E71D: push 00413C30h
  '0049E722: call [00401140h]
  '0049E728: jmp 0049E67Dh
  '0049E72D: mov [ebp-04h], ebx
  '0049E730: push 0049E770h
  '0049E735: jmp 49E74Ah
  '0049E737: lea ecx, [ebp-24h]
  '0049E73A: call [00401388h]
  '0049E740: lea ecx, [ebp-34h]
  '0049E743: call [00401034h]
  '0049E749: ret 
End Sub

