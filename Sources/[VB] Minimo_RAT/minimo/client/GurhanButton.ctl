VERSION 5.00
Begin VB.UserControl GurhanButton
  MousePointer = 99
  ScaleMode = 3
  Begin VB.Timer OverTimer
    Enabled = 0   'False
    Interval = 10
    Left = 1080
    Top = 0
    Width = 8
    Height = 0
  End
  Begin VB.Image imgHAND
    Picture = "GurhanButton.frx":0
    Left = 1800
    Top = 0
    Width = 480
    Height = 480
    Visible = 0   'False
  End
End

Attribute VB_Name = "GurhanButton"

Private Sub UserControl__4EF7C0
  '004EF7C0: push ebp
  '004EF7C1: mov ebp, esp
  '004EF7C3: sub esp, 0000000Ch
  '004EF7C6: push 004081B6h
  '004EF7CB: mov eax, fs:[00h]
  '004EF7D1: push eax
  '004EF7D2: mov fs:[00000000h], esp
  '004EF7D9: sub esp, 00000010h
  '004EF7DC: push ebx
  '004EF7DD: push esi
  '004EF7DE: push edi
  '004EF7DF: mov [ebp-0Ch], esp
  '004EF7E2: mov [ebp-08h], 00405648h
  '004EF7E9: mov esi, [ebp+08h]
  '004EF7EC: mov eax, esi
  '004EF7EE: and eax, 00000001h
  '004EF7F1: mov [ebp-04h], eax
  '004EF7F4: and esi, FFFFFFFEh
  '004EF7F7: push esi
  '004EF7F8: mov [ebp+08h], esi
  '004EF7FB: mov ecx, [esi]
  '004EF7FD: call [ecx+04h]
  '004EF800: mov edx, [esi]
  '004EF802: lea eax, [ebp-18h]
  '004EF805: push eax
  '004EF806: push esi
  '004EF807: mov [ebp-18h], 00000000h
  '004EF80E: call [edx+00000100h]
  '004EF814: test eax, eax
  '004EF816: fclex 
  '004EF818: jnl 4EF830h
  '004EF81A: mov edi, [004010A0h]
  '004EF820: push 00000100h
  '004EF825: push 0042725Ch
  '004EF82A: push esi
  '004EF82B: push eax
  '004EF82C: call edi
  '004EF82E: jmp 4EF836h
  '004EF830: mov edi, [004010A0h]
  '004EF836: fld real4 ptr [ebp-18h]
  '004EF839: fcomp real4 ptr [0040142Ch]
  '004EF83F: fstsw ax
  '004EF841: test ah, 01h
  '004EF844: jz 4EF86Eh
  '004EF846: mov eax, [esi+10h]
  '004EF849: push 43160000h
  '004EF84E: push eax
  '004EF84F: mov ecx, [eax]
  '004EF851: call [ecx+00000084h]
  '004EF857: test eax, eax
  '004EF859: fclex 
  '004EF85B: jnl 4EF86Eh
  '004EF85D: mov edx, [esi+10h]
  '004EF860: push 00000084h
  '004EF865: push 0042725Ch
  '004EF86A: push edx
  '004EF86B: push eax
  '004EF86C: call edi
  '004EF86E: mov eax, [esi]
  '004EF870: lea ecx, [ebp-18h]
  '004EF873: push ecx
  '004EF874: push esi
  '004EF875: call [eax+00000108h]
  '004EF87B: test eax, eax
  '004EF87D: fclex 
  '004EF87F: jnl 4EF88Fh
  '004EF881: push 00000108h
  '004EF886: push 0042725Ch
  '004EF88B: push esi
  '004EF88C: push eax
  '004EF88D: call edi
  '004EF88F: fld real4 ptr [ebp-18h]
  '004EF892: fcomp real4 ptr [0040142Ch]
  '004EF898: fstsw ax
  '004EF89A: test ah, 01h
  '004EF89D: jz 4EF8C7h
  '004EF89F: mov eax, [esi+10h]
  '004EF8A2: push 43160000h
  '004EF8A7: push eax
  '004EF8A8: mov edx, [eax]
  '004EF8AA: call [edx+0000008Ch]
  '004EF8B0: test eax, eax
  '004EF8B2: fclex 
  '004EF8B4: jnl 4EF8C7h
  '004EF8B6: mov ecx, [esi+10h]
  '004EF8B9: push 0000008Ch
  '004EF8BE: push 0042725Ch
  '004EF8C3: push ecx
  '004EF8C4: push eax
  '004EF8C5: call edi
  '004EF8C7: mov edx, [esi]
  '004EF8C9: lea eax, [ebp-18h]
  '004EF8CC: push eax
  '004EF8CD: push esi
  '004EF8CE: call [edx+00000100h]
  '004EF8D4: test eax, eax
  '004EF8D6: fclex 
  '004EF8D8: jnl 4EF8E8h
  '004EF8DA: push 00000100h
  '004EF8DF: push 0042725Ch
  '004EF8E4: push esi
  '004EF8E5: push eax
  '004EF8E6: call edi
  '004EF8E8: fld real4 ptr [ebp-18h]
  '004EF8EB: mov ebx, [0040135Ch]
  '004EF8F1: call ebx
  '004EF8F3: mov ecx, [esi]
  '004EF8F5: lea edx, [ebp-18h]
  '004EF8F8: push edx
  '004EF8F9: push esi
  '004EF8FA: mov [esi+40h], eax
  '004EF8FD: call [ecx+00000108h]
  '004EF903: test eax, eax
  '004EF905: fclex 
  '004EF907: jnl 4EF917h
  '004EF909: push 00000108h
  '004EF90E: push 0042725Ch
  '004EF913: push esi
  '004EF914: push eax
  '004EF915: call edi
  '004EF917: fld real4 ptr [ebp-18h]
  '004EF91A: call ebx
  '004EF91C: lea ecx, [ebp-18h]
  '004EF91F: mov [esi+44h], eax
  '004EF922: mov eax, [esi]
  '004EF924: push ecx
  '004EF925: push esi
  '004EF926: mov [esi+00000088h], 00000004h
  '004EF930: call [eax+00000100h]
  '004EF936: test eax, eax
  '004EF938: fclex 
  '004EF93A: jnl 4EF94Ah
  '004EF93C: push 00000100h
  '004EF941: push 0042725Ch
  '004EF946: push esi
  '004EF947: push eax
  '004EF948: call edi
  '004EF94A: fld real4 ptr [ebp-18h]
  '004EF94D: fsub real4 ptr [00405640h]
  '004EF953: fstsw ax
  '004EF955: test al, 0Dh
  '004EF957: jnz 004EFA09h
  '004EF95D: call ebx
  '004EF95F: mov edx, [esi]
  '004EF961: mov [esi+00000090h], eax
  '004EF967: lea eax, [ebp-18h]
  '004EF96A: mov [esi+0000008Ch], 00000004h
  '004EF974: push eax
  '004EF975: push esi
  '004EF976: call [edx+00000108h]
  '004EF97C: test eax, eax
  '004EF97E: fclex 
  '004EF980: jnl 4EF990h
  '004EF982: push 00000108h
  '004EF987: push 0042725Ch
  '004EF98C: push esi
  '004EF98D: push eax
  '004EF98E: call edi
  '004EF990: fld real4 ptr [ebp-18h]
  '004EF993: fsub real4 ptr [00405640h]
  '004EF999: fstsw ax
  '004EF99B: test al, 0Dh
  '004EF99D: jnz 4EFA09h
  '004EF99F: call ebx
  '004EF9A1: mov ecx, [esi+3Ch]
  '004EF9A4: mov [esi+00000094h], eax
  '004EF9AA: push ecx
  '004EF9AB: call 00420C34h
  '004EF9B0: call [0040109Ch]
  '004EF9B6: cmp [esi+000000C0h], 00000003h
  '004EF9BD: jnz 4EF9C8h
  '004EF9BF: mov edx, [esi]
  '004EF9C1: push esi
  '004EF9C2: call [edx+0000092Ch]
  '004EF9C8: mov eax, [esi]
  '004EF9CA: push esi
  '004EF9CB: call [eax+000007A4h]
  '004EF9D1: test eax, eax
  '004EF9D3: jnl 4EF9E3h
  '004EF9D5: push 000007A4h
  '004EF9DA: push 0042728Ch
  '004EF9DF: push esi
  '004EF9E0: push eax
  '004EF9E1: call edi
  '004EF9E3: mov [ebp-04h], 00000000h
  '004EF9EA: mov eax, [ebp+08h]
  '004EF9ED: push eax
  '004EF9EE: mov ecx, [eax]
  '004EF9F0: call [ecx+08h]
  '004EF9F3: mov eax, [ebp-04h]
  '004EF9F6: mov ecx, [ebp-14h]
  '004EF9F9: pop edi
  '004EF9FA: pop esi
  '004EF9FB: mov fs:[00000000h], ecx
  '004EFA02: pop ebx
  '004EFA03: mov esp, ebp
  '004EFA05: pop ebp
  '004EFA06: retn 0004h
End Sub
Private Sub UserControl__4EFB60
  '004EFB60: push ebp
  '004EFB61: mov ebp, esp
  '004EFB63: sub esp, 0000000Ch
  '004EFB66: push 004081B6h
  '004EFB6B: mov eax, fs:[00h]
  '004EFB71: push eax
  '004EFB72: mov fs:[00000000h], esp
  '004EFB79: sub esp, 00000010h
  '004EFB7C: push ebx
  '004EFB7D: push esi
  '004EFB7E: push edi
  '004EFB7F: mov [ebp-0Ch], esp
  '004EFB82: mov [ebp-08h], 00405658h
  '004EFB89: mov esi, [ebp+08h]
  '004EFB8C: mov eax, esi
  '004EFB8E: and eax, 00000001h
  '004EFB91: mov [ebp-04h], eax
  '004EFB94: and esi, FFFFFFFEh
  '004EFB97: push esi
  '004EFB98: mov [ebp+08h], esi
  '004EFB9B: mov ecx, [esi]
  '004EFB9D: call [ecx+04h]
  '004EFBA0: mov edx, [esi]
  '004EFBA2: lea eax, [ebp-18h]
  '004EFBA5: xor edi, edi
  '004EFBA7: push eax
  '004EFBA8: push esi
  '004EFBA9: mov [ebp-18h], edi
  '004EFBAC: call [edx+000007B8h]
  '004EFBB2: cmp eax, edi
  '004EFBB4: jnl 4EFBC8h
  '004EFBB6: push 000007B8h
  '004EFBBB: push 0042728Ch
  '004EFBC0: push esi
  '004EFBC1: push eax
  '004EFBC2: call [004010A0h]
  '004EFBC8: mov ecx, [ebp-18h]
  '004EFBCB: push ecx
  '004EFBCC: call 0042793Ch
  '004EFBD1: call [0040109Ch]
  '004EFBD7: mov edx, [esi]
  '004EFBD9: lea eax, [esi+000000F4h]
  '004EFBDF: lea ecx, [esi+000000F0h]
  '004EFBE5: push eax
  '004EFBE6: push ecx
  '004EFBE7: lea eax, [esi+000000EEh]
  '004EFBED: lea ecx, [esi+000000ECh]
  '004EFBF3: push eax
  '004EFBF4: push ecx
  '004EFBF5: push esi
  '004EFBF6: call [edx+000008CCh]
  '004EFBFC: cmp eax, edi
  '004EFBFE: jnl 4EFC12h
  '004EFC00: push 000008CCh
  '004EFC05: push 0042728Ch
  '004EFC0A: push esi
  '004EFC0B: push eax
  '004EFC0C: call [004010A0h]
  '004EFC12: mov [ebp-04h], edi
  '004EFC15: mov eax, [ebp+08h]
  '004EFC18: push eax
  '004EFC19: mov edx, [eax]
  '004EFC1B: call [edx+08h]
  '004EFC1E: mov eax, [ebp-04h]
  '004EFC21: mov ecx, [ebp-14h]
  '004EFC24: pop edi
  '004EFC25: pop esi
  '004EFC26: mov fs:[00000000h], ecx
  '004EFC2D: pop ebx
  '004EFC2E: mov esp, ebp
  '004EFC30: pop ebp
  '004EFC31: retn 0004h
End Sub
Private Sub UserControl__4EFC40
  '004EFC40: push ebp
  '004EFC41: mov ebp, esp
  '004EFC43: sub esp, 0000000Ch
  '004EFC46: push 004081B6h
  '004EFC4B: mov eax, fs:[00h]
  '004EFC51: push eax
  '004EFC52: mov fs:[00000000h], esp
  '004EFC59: sub esp, 0000002Ch
  '004EFC5C: push ebx
  '004EFC5D: push esi
  '004EFC5E: push edi
  '004EFC5F: mov [ebp-0Ch], esp
  '004EFC62: mov [ebp-08h], 00405660h
  '004EFC69: mov esi, [ebp+08h]
  '004EFC6C: mov eax, esi
  '004EFC6E: and eax, 00000001h
  '004EFC71: mov [ebp-04h], eax
  '004EFC74: and esi, FFFFFFFEh
  '004EFC77: push esi
  '004EFC78: mov [ebp+08h], esi
  '004EFC7B: mov ecx, [esi]
  '004EFC7D: call [ecx+04h]
  '004EFC80: mov al, [esi+000000F8h]
  '004EFC86: test al, al
  '004EFC88: jnz 4EFCE7h
  '004EFC8A: mov edx, [ebp+0Ch]
  '004EFC8D: cmp word ptr [edx], 0020h
  '004EFC91: jnz 4EFCD4h
  '004EFC93: mov edi, [00401208h]
  '004EFC99: mov ecx, 00000001h
  '004EFC9E: call edi
  '004EFCA0: mov ecx, 00000001h
  '004EFCA5: mov [esi+000000E9h], al
  '004EFCAB: call edi
  '004EFCAD: mov [esi+000000EAh], al
  '004EFCB3: mov eax, [esi]
  '004EFCB5: push esi
  '004EFCB6: call [eax+000007A4h]
  '004EFCBC: test eax, eax
  '004EFCBE: jnl 4EFCDAh
  '004EFCC0: push 000007A4h
  '004EFCC5: push 0042728Ch
  '004EFCCA: push esi
  '004EFCCB: push eax
  '004EFCCC: call [004010A0h]
  '004EFCD2: jmp 4EFCDAh
  '004EFCD4: mov edi, [00401208h]
  '004EFCDA: mov ecx, 00000001h
  '004EFCDF: call edi
  '004EFCE1: mov [esi+000000F8h], al
  '004EFCE7: sub esp, 00000010h
  '004EFCEA: mov eax, 00004002h
  '004EFCEF: mov edi, esp
  '004EFCF1: mov edx, eax
  '004EFCF3: sub esp, 00000010h
  '004EFCF6: mov ecx, [ebp+10h]
  '004EFCF9: mov [edi], eax
  '004EFCFB: mov eax, [ebp-20h]
  '004EFCFE: mov [edi+04h], eax
  '004EFD01: mov eax, [ebp+0Ch]
  '004EFD04: mov [edi+08h], eax
  '004EFD07: mov eax, [ebp-18h]
  '004EFD0A: mov [edi+0Ch], eax
  '004EFD0D: mov eax, esp
  '004EFD0F: push 00000002h
  '004EFD11: push 00000002h
  '004EFD13: mov [eax], edx
  '004EFD15: mov edx, [ebp-30h]
  '004EFD18: push esi
  '004EFD19: mov [eax+04h], edx
  '004EFD1C: mov [eax+08h], ecx
  '004EFD1F: mov ecx, [ebp-28h]
  '004EFD22: mov [eax+0Ch], ecx
  '004EFD25: call [00401060h]
  '004EFD2B: add esp, 0000002Ch
  '004EFD2E: mov [ebp-04h], 00000000h
  '004EFD35: mov eax, [ebp+08h]
  '004EFD38: push eax
  '004EFD39: mov edx, [eax]
  '004EFD3B: call [edx+08h]
  '004EFD3E: mov eax, [ebp-04h]
  '004EFD41: mov ecx, [ebp-14h]
  '004EFD44: pop edi
  '004EFD45: pop esi
  '004EFD46: mov fs:[00000000h], ecx
  '004EFD4D: pop ebx
  '004EFD4E: mov esp, ebp
  '004EFD50: pop ebp
  '004EFD51: retn 000Ch
End Sub
Private Sub UserControl__4EFD60
  '004EFD60: push ebp
  '004EFD61: mov ebp, esp
  '004EFD63: sub esp, 0000000Ch
  '004EFD66: push 004081B6h
  '004EFD6B: mov eax, fs:[00h]
  '004EFD71: push eax
  '004EFD72: mov fs:[00000000h], esp
  '004EFD79: sub esp, 00000018h
  '004EFD7C: push ebx
  '004EFD7D: push esi
  '004EFD7E: push edi
  '004EFD7F: mov [ebp-0Ch], esp
  '004EFD82: mov [ebp-08h], 00405668h
  '004EFD89: mov esi, [ebp+08h]
  '004EFD8C: mov eax, esi
  '004EFD8E: and eax, 00000001h
  '004EFD91: mov [ebp-04h], eax
  '004EFD94: and esi, FFFFFFFEh
  '004EFD97: push esi
  '004EFD98: mov [ebp+08h], esi
  '004EFD9B: mov ecx, [esi]
  '004EFD9D: call [ecx+04h]
  '004EFDA0: sub esp, 00000010h
  '004EFDA3: mov eax, [ebp+0Ch]
  '004EFDA6: mov edx, esp
  '004EFDA8: mov ecx, 00004002h
  '004EFDAD: push 00000001h
  '004EFDAF: push 00000003h
  '004EFDB1: mov [edx], ecx
  '004EFDB3: mov ecx, [ebp-20h]
  '004EFDB6: push esi
  '004EFDB7: mov [edx+04h], ecx
  '004EFDBA: mov [edx+08h], eax
  '004EFDBD: mov eax, [ebp-18h]
  '004EFDC0: mov [edx+0Ch], eax
  '004EFDC3: call [00401060h]
  '004EFDC9: add esp, 0000001Ch
  '004EFDCC: mov [ebp-04h], 00000000h
  '004EFDD3: mov eax, [ebp+08h]
  '004EFDD6: push eax
  '004EFDD7: mov ecx, [eax]
  '004EFDD9: call [ecx+08h]
  '004EFDDC: mov eax, [ebp-04h]
  '004EFDDF: mov ecx, [ebp-14h]
  '004EFDE2: pop edi
  '004EFDE3: pop esi
  '004EFDE4: mov fs:[00000000h], ecx
  '004EFDEB: pop ebx
  '004EFDEC: mov esp, ebp
  '004EFDEE: pop ebp
  '004EFDEF: retn 0008h
End Sub
Private Sub UserControl__4EFE00
  '004EFE00: push ebp
  '004EFE01: mov ebp, esp
  '004EFE03: sub esp, 0000000Ch
  '004EFE06: push 004081B6h
  '004EFE0B: mov eax, fs:[00h]
  '004EFE11: push eax
  '004EFE12: mov fs:[00000000h], esp
  '004EFE19: sub esp, 00000038h
  '004EFE1C: push ebx
  '004EFE1D: push esi
  '004EFE1E: push edi
  '004EFE1F: mov [ebp-0Ch], esp
  '004EFE22: mov [ebp-08h], 00405670h
  '004EFE29: mov esi, [ebp+08h]
  '004EFE2C: mov eax, esi
  '004EFE2E: and eax, 00000001h
  '004EFE31: mov [ebp-04h], eax
  '004EFE34: and esi, FFFFFFFEh
  '004EFE37: push esi
  '004EFE38: mov [ebp+08h], esi
  '004EFE3B: mov ecx, [esi]
  '004EFE3D: call [ecx+04h]
  '004EFE40: mov edx, [ebp+0Ch]
  '004EFE43: xor ebx, ebx
  '004EFE45: mov [ebp-38h], ebx
  '004EFE48: mov [ebp-3Ch], ebx
  '004EFE4B: cmp word ptr [edx], 0020h
  '004EFE4F: mov [ebp-40h], ebx
  '004EFE52: jnz 004EFEEEh
  '004EFE58: mov edi, [00401208h]
  '004EFE5E: xor ecx, ecx
  '004EFE60: call edi
  '004EFE62: xor ecx, ecx
  '004EFE64: mov [esi+000000E9h], al
  '004EFE6A: call edi
  '004EFE6C: mov [esi+000000EAh], al
  '004EFE72: mov eax, [esi]
  '004EFE74: push esi
  '004EFE75: call [eax+000007D4h]
  '004EFE7B: cmp eax, ebx
  '004EFE7D: jnl 4EFE95h
  '004EFE7F: mov edi, [004010A0h]
  '004EFE85: push 000007D4h
  '004EFE8A: push 0042728Ch
  '004EFE8F: push esi
  '004EFE90: push eax
  '004EFE91: call edi
  '004EFE93: jmp 4EFE9Bh
  '004EFE95: mov edi, [004010A0h]
  '004EFE9B: mov ecx, [esi]
  '004EFE9D: push esi
  '004EFE9E: call [ecx+000007A4h]
  '004EFEA4: cmp eax, ebx
  '004EFEA6: jnl 4EFEB6h
  '004EFEA8: push 000007A4h
  '004EFEAD: push 0042728Ch
  '004EFEB2: push esi
  '004EFEB3: push eax
  '004EFEB4: call edi
  '004EFEB6: mov edx, [esi]
  '004EFEB8: lea eax, [ebp-40h]
  '004EFEBB: lea ecx, [ebp-3Ch]
  '004EFEBE: push eax
  '004EFEBF: mov eax, [ebp+10h]
  '004EFEC2: push ecx
  '004EFEC3: lea ecx, [ebp-38h]
  '004EFEC6: push eax
  '004EFEC7: push ecx
  '004EFEC8: push esi
  '004EFEC9: mov [ebp-40h], ebx
  '004EFECC: mov [ebp-3Ch], ebx
  '004EFECF: mov [ebp-38h], 00000001h
  '004EFED6: call [edx+000008D4h]
  '004EFEDC: cmp eax, ebx
  '004EFEDE: jnl 4EFEEEh
  '004EFEE0: push 000008D4h
  '004EFEE5: push 0042728Ch
  '004EFEEA: push esi
  '004EFEEB: push eax
  '004EFEEC: call edi
  '004EFEEE: xor ecx, ecx
  '004EFEF0: call [00401208h]
  '004EFEF6: sub esp, 00000010h
  '004EFEF9: mov [esi+000000F8h], al
  '004EFEFF: mov edx, esp
  '004EFF01: mov eax, 00004002h
  '004EFF06: mov ecx, eax
  '004EFF08: sub esp, 00000010h
  '004EFF0B: mov [edx], eax
  '004EFF0D: mov eax, [ebp-20h]
  '004EFF10: mov [edx+04h], eax
  '004EFF13: mov eax, [ebp+0Ch]
  '004EFF16: mov [edx+08h], eax
  '004EFF19: mov eax, [ebp-18h]
  '004EFF1C: mov [edx+0Ch], eax
  '004EFF1F: mov eax, [ebp-30h]
  '004EFF22: mov edx, esp
  '004EFF24: push 00000002h
  '004EFF26: push 00000004h
  '004EFF28: push esi
  '004EFF29: mov [edx], ecx
  '004EFF2B: mov ecx, [ebp+10h]
  '004EFF2E: mov [edx+04h], eax
  '004EFF31: mov eax, [ebp-28h]
  '004EFF34: mov [edx+08h], ecx
  '004EFF37: mov [edx+0Ch], eax
  '004EFF3A: call [00401060h]
  '004EFF40: add esp, 0000002Ch
  '004EFF43: mov [ebp-04h], ebx
  '004EFF46: mov eax, [ebp+08h]
  '004EFF49: push eax
  '004EFF4A: mov ecx, [eax]
  '004EFF4C: call [ecx+08h]
  '004EFF4F: mov eax, [ebp-04h]
  '004EFF52: mov ecx, [ebp-14h]
  '004EFF55: pop edi
  '004EFF56: pop esi
  '004EFF57: mov fs:[00000000h], ecx
  '004EFF5E: pop ebx
  '004EFF5F: mov esp, ebp
  '004EFF61: pop ebp
  '004EFF62: retn 000Ch
End Sub
Private Sub UserControl__4EFF70
  '004EFF70: push ebp
  '004EFF71: mov ebp, esp
  '004EFF73: sub esp, 0000000Ch
  '004EFF76: push 004081B6h
  '004EFF7B: mov eax, fs:[00h]
  '004EFF81: push eax
  '004EFF82: mov fs:[00000000h], esp
  '004EFF89: sub esp, 0000004Ch
  '004EFF8C: push ebx
  '004EFF8D: push esi
  '004EFF8E: push edi
  '004EFF8F: mov [ebp-0Ch], esp
  '004EFF92: mov [ebp-08h], 00405678h
  '004EFF99: mov esi, [ebp+08h]
  '004EFF9C: mov eax, esi
  '004EFF9E: and eax, 00000001h
  '004EFFA1: mov [ebp-04h], eax
  '004EFFA4: and esi, FFFFFFFEh
  '004EFFA7: push esi
  '004EFFA8: mov [ebp+08h], esi
  '004EFFAB: mov ecx, [esi]
  '004EFFAD: call [ecx+04h]
  '004EFFB0: mov eax, [ebp+0Ch]
  '004EFFB3: mov ecx, [ebp+10h]
  '004EFFB6: mov dx, [eax]
  '004EFFB9: mov [esi+000000ECh], dx
  '004EFFC0: mov dx, [ecx]
  '004EFFC3: mov ecx, [ebp+14h]
  '004EFFC6: mov [esi+000000EEh], dx
  '004EFFCD: mov edx, [ecx]
  '004EFFCF: mov ecx, [ebp+18h]
  '004EFFD2: mov [esi+000000F0h], edx
  '004EFFD8: mov edx, [ecx]
  '004EFFDA: mov [esi+000000F4h], edx
  '004EFFE0: cmp word ptr [eax], 0002h
  '004EFFE4: jz 4F0016h
  '004EFFE6: mov ecx, 00000001h
  '004EFFEB: call [00401208h]
  '004EFFF1: mov [esi+000000E9h], al
  '004EFFF7: mov eax, [esi]
  '004EFFF9: push esi
  '004EFFFA: call [eax+000007A4h]
  '004F0000: test eax, eax
  '004F0002: jnl 4F0016h
  '004F0004: push 000007A4h
  '004F0009: push 0042728Ch
  '004F000E: push esi
  '004F000F: push eax
  '004F0010: call [004010A0h]
  '004F0016: sub esp, 00000010h
  '004F0019: mov eax, 00004002h
  '004F001E: mov ebx, esp
  '004F0020: mov ecx, eax
  '004F0022: sub esp, 00000010h
  '004F0025: mov edx, 00004004h
  '004F002A: mov [ebx], eax
  '004F002C: mov eax, [ebp-20h]
  '004F002F: mov edi, edx
  '004F0031: mov [ebx+04h], eax
  '004F0034: mov eax, [ebp+0Ch]
  '004F0037: mov [ebx+08h], eax
  '004F003A: mov eax, [ebp-18h]
  '004F003D: mov [ebx+0Ch], eax
  '004F0040: mov eax, esp
  '004F0042: sub esp, 00000010h
  '004F0045: mov [eax], ecx
  '004F0047: mov ecx, [ebp-30h]
  '004F004A: mov [eax+04h], ecx
  '004F004D: mov ecx, [ebp+10h]
  '004F0050: mov [eax+08h], ecx
  '004F0053: mov ecx, [ebp-28h]
  '004F0056: mov [eax+0Ch], ecx
  '004F0059: mov ecx, [ebp-40h]
  '004F005C: mov eax, esp
  '004F005E: sub esp, 00000010h
  '004F0061: mov [eax], edx
  '004F0063: mov edx, [ebp+14h]
  '004F0066: mov [eax+04h], ecx
  '004F0069: mov ecx, [ebp-38h]
  '004F006C: mov [eax+08h], edx
  '004F006F: mov edx, esp
  '004F0071: push 00000004h
  '004F0073: push 00000005h
  '004F0075: mov [eax+0Ch], ecx
  '004F0078: mov eax, [ebp-50h]
  '004F007B: mov ecx, [ebp+18h]
  '004F007E: mov [edx], edi
  '004F0080: push esi
  '004F0081: mov [edx+04h], eax
  '004F0084: mov eax, [ebp-48h]
  '004F0087: mov [edx+08h], ecx
  '004F008A: mov [edx+0Ch], eax
  '004F008D: call [00401060h]
  '004F0093: add esp, 0000004Ch
  '004F0096: mov [ebp-04h], 00000000h
  '004F009D: mov eax, [ebp+08h]
  '004F00A0: push eax
  '004F00A1: mov ecx, [eax]
  '004F00A3: call [ecx+08h]
  '004F00A6: mov eax, [ebp-04h]
  '004F00A9: mov ecx, [ebp-14h]
  '004F00AC: pop edi
  '004F00AD: pop esi
  '004F00AE: mov fs:[00000000h], ecx
  '004F00B5: pop ebx
  '004F00B6: mov esp, ebp
  '004F00B8: pop ebp
  '004F00B9: retn 0014h
End Sub
Private Sub UserControl__4F00C0
  '004F00C0: push ebp
  '004F00C1: mov ebp, esp
  '004F00C3: sub esp, 0000000Ch
  '004F00C6: push 004081B6h
  '004F00CB: mov eax, fs:[00h]
  '004F00D1: push eax
  '004F00D2: mov fs:[00000000h], esp
  '004F00D9: sub esp, 00000074h
  '004F00DC: push ebx
  '004F00DD: push esi
  '004F00DE: push edi
  '004F00DF: mov [ebp-0Ch], esp
  '004F00E2: mov [ebp-08h], 00405688h
  '004F00E9: mov esi, [ebp+08h]
  '004F00EC: mov eax, esi
  '004F00EE: and eax, 00000001h
  '004F00F1: mov [ebp-04h], eax
  '004F00F4: and esi, FFFFFFFEh
  '004F00F7: push esi
  '004F00F8: mov [ebp+08h], esi
  '004F00FB: mov ecx, [esi]
  '004F00FD: call [ecx+04h]
  '004F0100: mov edx, [esi]
  '004F0102: lea eax, [ebp-74h]
  '004F0105: xor edi, edi
  '004F0107: push eax
  '004F0108: push esi
  '004F0109: mov [ebp-18h], edi
  '004F010C: mov [ebp-1Ch], edi
  '004F010F: mov [ebp-2Ch], edi
  '004F0112: mov byte ptr [ebp-70h], 00h
  '004F0116: mov [ebp-74h], edi
  '004F0119: mov [ebp-78h], edi
  '004F011C: call [edx+00000100h]
  '004F0122: cmp eax, edi
  '004F0124: fclex 
  '004F0126: jnl 4F013Ah
  '004F0128: push 00000100h
  '004F012D: push 0042725Ch
  '004F0132: push esi
  '004F0133: push eax
  '004F0134: call [004010A0h]
  '004F013A: mov ecx, [esi]
  '004F013C: lea edx, [ebp-78h]
  '004F013F: push edx
  '004F0140: push esi
  '004F0141: call [ecx+00000108h]
  '004F0147: cmp eax, edi
  '004F0149: fclex 
  '004F014B: jnl 4F015Fh
  '004F014D: push 00000108h
  '004F0152: push 0042725Ch
  '004F0157: push esi
  '004F0158: push eax
  '004F0159: call [004010A0h]
  '004F015F: mov ecx, [ebp+14h]
  '004F0162: fld real4 ptr [ecx]
  '004F0164: fcomp real4 ptr [00405680h]
  '004F016A: fstsw ax
  '004F016C: test ah, 01h
  '004F016F: jnz 4F0176h
  '004F0171: mov edi, 00000001h
  '004F0176: mov ebx, [ebp+18h]
  '004F0179: fld real4 ptr [ebx]
  '004F017B: fcomp real4 ptr [00405680h]
  '004F0181: fstsw ax
  '004F0183: test ah, 01h
  '004F0186: jnz 4F018Fh
  '004F0188: mov edx, 00000001h
  '004F018D: jmp 4F0191h
  '004F018F: xor edx, edx
  '004F0191: fld real4 ptr [ecx]
  '004F0193: fcomp real4 ptr [ebp-74h]
  '004F0196: fstsw ax
  '004F0198: test ah, 01h
  '004F019B: jz 4F01A4h
  '004F019D: mov ecx, 00000001h
  '004F01A2: jmp 4F01A6h
  '004F01A4: xor ecx, ecx
  '004F01A6: fld real4 ptr [ebx]
  '004F01A8: fcomp real4 ptr [ebp-78h]
  '004F01AB: fstsw ax
  '004F01AD: test ah, 01h
  '004F01B0: jz 4F01B9h
  '004F01B2: mov eax, 00000001h
  '004F01B7: jmp 4F01BBh
  '004F01B9: xor eax, eax
  '004F01BB: neg eax
  '004F01BD: neg ecx
  '004F01BF: and eax, ecx
  '004F01C1: neg edx
  '004F01C3: and eax, edx
  '004F01C5: neg edi
  '004F01C7: and eax, edi
  '004F01C9: test ax, ax
  '004F01CC: jz 004F0303h
  '004F01D2: mov al, [esi+000000EAh]
  '004F01D8: test al, al
  '004F01DA: jnz 004F0303h
  '004F01E0: mov eax, [esi]
  '004F01E2: push esi
  '004F01E3: call [eax+000003A8h]
  '004F01E9: lea ecx, [ebp-1Ch]
  '004F01EC: push eax
  '004F01ED: push ecx
  '004F01EE: call [004010E4h]
  '004F01F4: mov edi, eax
  '004F01F6: push FFFFFFFFh
  '004F01F8: push edi
  '004F01F9: mov edx, [edi]
  '004F01FB: call [edx+5Ch]
  '004F01FE: test eax, eax
  '004F0200: fclex 
  '004F0202: jnl 4F0217h
  '004F0204: push 0000005Ch
  '004F0206: push 0041E5CCh
  '004F020B: push edi
  '004F020C: mov edi, [004010A0h]
  '004F0212: push eax
  '004F0213: call edi
  '004F0215: jmp 4F021Dh
  '004F0217: mov edi, [004010A0h]
  '004F021D: lea ecx, [ebp-1Ch]
  '004F0220: call [004013B8h]
  '004F0226: mov ecx, 00000001h
  '004F022B: call [00401208h]
  '004F0231: mov [esi+000000EAh], al
  '004F0237: mov eax, [esi+000000B4h]
  '004F023D: push 00000000h
  '004F023F: push eax
  '004F0240: call [00401210h]
  '004F0246: test ax, ax
  '004F0249: jnz 4F025Fh
  '004F024B: mov ecx, [esi+000000B4h]
  '004F0251: lea edx, [esi+000000C4h]
  '004F0257: push ecx
  '004F0258: push edx
  '004F0259: call [004010F8h]
  '004F025F: mov edx, [ebp-38h]
  '004F0262: sub esp, 00000010h
  '004F0265: mov ecx, esp
  '004F0267: mov eax, 00004002h
  '004F026C: push 00000001h
  '004F026E: push 00000008h
  '004F0270: mov [ecx], eax
  '004F0272: mov eax, [ebp+10h]
  '004F0275: push esi
  '004F0276: mov [ecx+04h], edx
  '004F0279: mov edx, [ebp-30h]
  '004F027C: mov [ecx+08h], eax
  '004F027F: mov [ecx+0Ch], edx
  '004F0282: call [00401060h]
  '004F0288: mov eax, [esi]
  '004F028A: add esp, 0000001Ch
  '004F028D: push esi
  '004F028E: call [eax+000007A4h]
  '004F0294: test eax, eax
  '004F0296: jnl 4F02A6h
  '004F0298: push 000007A4h
  '004F029D: push 0042728Ch
  '004F02A2: push esi
  '004F02A3: push eax
  '004F02A4: call edi
  '004F02A6: call [00401104h]
  '004F02AC: mov ecx, [esi]
  '004F02AE: lea edx, [ebp-2Ch]
  '004F02B1: push edx
  '004F02B2: push esi
  '004F02B3: call [ecx+00000848h]
  '004F02B9: test eax, eax
  '004F02BB: jnl 4F02CBh
  '004F02BD: push 00000848h
  '004F02C2: push 0042728Ch
  '004F02C7: push esi
  '004F02C8: push eax
  '004F02C9: call edi
  '004F02CB: lea eax, [ebp-2Ch]
  '004F02CE: push eax
  '004F02CF: call [0040103Ch]
  '004F02D5: mov edx, eax
  '004F02D7: lea ecx, [ebp-18h]
  '004F02DA: call [00401378h]
  '004F02E0: mov ecx, [esi]
  '004F02E2: lea edx, [ebp-70h]
  '004F02E5: lea eax, [ebp-18h]
  '004F02E8: push edx
  '004F02E9: push eax
  '004F02EA: push esi
  '004F02EB: call [ecx+00000910h]
  '004F02F1: lea ecx, [ebp-18h]
  '004F02F4: call [004013B4h]
  '004F02FA: lea ecx, [ebp-2Ch]
  '004F02FD: call [00401030h]
  '004F0303: sub esp, 00000010h
  '004F0306: mov eax, [ebp+0Ch]
  '004F0309: mov ebx, esp
  '004F030B: mov ecx, 00004002h
  '004F0310: mov edx, ecx
  '004F0312: sub esp, 00000010h
  '004F0315: mov [ebx], ecx
  '004F0317: mov ecx, [ebp-38h]
  '004F031A: mov edi, 00004004h
  '004F031F: mov [ebx+04h], ecx
  '004F0322: mov ecx, esp
  '004F0324: sub esp, 00000010h
  '004F0327: mov [ebx+08h], eax
  '004F032A: mov eax, [ebp-30h]
  '004F032D: mov [ebx+0Ch], eax
  '004F0330: mov eax, [ebp+10h]
  '004F0333: mov [ecx], edx
  '004F0335: mov edx, [ebp-48h]
  '004F0338: mov [ecx+04h], edx
  '004F033B: mov edx, [ebp-40h]
  '004F033E: mov [ecx+08h], eax
  '004F0341: mov eax, esp
  '004F0343: sub esp, 00000010h
  '004F0346: mov [ecx+0Ch], edx
  '004F0349: mov ecx, [ebp-58h]
  '004F034C: mov edx, [ebp+14h]
  '004F034F: mov [eax], edi
  '004F0351: mov [eax+04h], ecx
  '004F0354: mov ecx, [ebp-50h]
  '004F0357: mov [eax+08h], edx
  '004F035A: mov edx, esp
  '004F035C: push 00000004h
  '004F035E: push 00000006h
  '004F0360: mov [eax+0Ch], ecx
  '004F0363: mov ecx, [ebp+18h]
  '004F0366: mov eax, edi
  '004F0368: push esi
  '004F0369: mov [edx], eax
  '004F036B: mov eax, [ebp-68h]
  '004F036E: mov [edx+04h], eax
  '004F0371: mov eax, [ebp-60h]
  '004F0374: mov [edx+08h], ecx
  '004F0377: mov [edx+0Ch], eax
  '004F037A: call [00401060h]
  '004F0380: add esp, 0000004Ch
  '004F0383: mov [ebp-04h], 00000000h
  '004F038A: wait 
  '004F038B: push 004F03AFh
  '004F0390: jmp 4F03AEh
  '004F0392: lea ecx, [ebp-18h]
  '004F0395: call [004013B4h]
  '004F039B: lea ecx, [ebp-1Ch]
  '004F039E: call [004013B8h]
  '004F03A4: lea ecx, [ebp-2Ch]
  '004F03A7: call [00401030h]
  '004F03AD: ret 
End Sub
Private Sub UserControl__4F03D0
  '004F03D0: push ebp
  '004F03D1: mov ebp, esp
  '004F03D3: sub esp, 0000000Ch
  '004F03D6: push 004081B6h
  '004F03DB: mov eax, fs:[00h]
  '004F03E1: push eax
  '004F03E2: mov fs:[00000000h], esp
  '004F03E9: sub esp, 00000068h
  '004F03EC: push ebx
  '004F03ED: push esi
  '004F03EE: push edi
  '004F03EF: mov [ebp-0Ch], esp
  '004F03F2: mov [ebp-08h], 00405698h
  '004F03F9: mov esi, [ebp+08h]
  '004F03FC: mov eax, esi
  '004F03FE: and eax, 00000001h
  '004F0401: mov [ebp-04h], eax
  '004F0404: and esi, FFFFFFFEh
  '004F0407: push esi
  '004F0408: mov [ebp+08h], esi
  '004F040B: mov ecx, [esi]
  '004F040D: call [ecx+04h]
  '004F0410: xor edi, edi
  '004F0412: xor ecx, ecx
  '004F0414: mov [ebp-18h], edi
  '004F0417: mov [ebp-1Ch], edi
  '004F041A: mov byte ptr [ebp-60h], 00h
  '004F041E: mov [ebp-64h], edi
  '004F0421: mov [ebp-68h], edi
  '004F0424: call [00401208h]
  '004F042A: mov edx, [ebp+0Ch]
  '004F042D: mov [esi+000000E9h], al
  '004F0433: cmp word ptr [edx], 0002h
  '004F0437: jz 004F058Fh
  '004F043D: mov eax, [esi]
  '004F043F: push esi
  '004F0440: call [eax+000007A4h]
  '004F0446: cmp eax, edi
  '004F0448: jnl 4F0460h
  '004F044A: mov ebx, [004010A0h]
  '004F0450: push 000007A4h
  '004F0455: push 0042728Ch
  '004F045A: push esi
  '004F045B: push eax
  '004F045C: call ebx
  '004F045E: jmp 4F0466h
  '004F0460: mov ebx, [004010A0h]
  '004F0466: mov ecx, [esi]
  '004F0468: lea edx, [ebp-64h]
  '004F046B: push edx
  '004F046C: push esi
  '004F046D: call [ecx+00000100h]
  '004F0473: cmp eax, edi
  '004F0475: fclex 
  '004F0477: jnl 4F0487h
  '004F0479: push 00000100h
  '004F047E: push 0042725Ch
  '004F0483: push esi
  '004F0484: push eax
  '004F0485: call ebx
  '004F0487: mov eax, [esi]
  '004F0489: lea ecx, [ebp-68h]
  '004F048C: push ecx
  '004F048D: push esi
  '004F048E: call [eax+00000108h]
  '004F0494: cmp eax, edi
  '004F0496: fclex 
  '004F0498: jnl 4F04A8h
  '004F049A: push 00000108h
  '004F049F: push 0042725Ch
  '004F04A4: push esi
  '004F04A5: push eax
  '004F04A6: call ebx
  '004F04A8: mov ecx, [ebp+14h]
  '004F04AB: fld real4 ptr [ecx]
  '004F04AD: fcomp real4 ptr [00405680h]
  '004F04B3: fstsw ax
  '004F04B5: test ah, 01h
  '004F04B8: jnz 4F04BFh
  '004F04BA: mov edi, 00000001h
  '004F04BF: mov edx, [ebp+18h]
  '004F04C2: fld real4 ptr [edx]
  '004F04C4: fcomp real4 ptr [00405680h]
  '004F04CA: fstsw ax
  '004F04CC: test ah, 01h
  '004F04CF: jnz 4F04D8h
  '004F04D1: mov edx, 00000001h
  '004F04D6: jmp 4F04DAh
  '004F04D8: xor edx, edx
  '004F04DA: fld real4 ptr [ecx]
  '004F04DC: fcomp real4 ptr [ebp-64h]
  '004F04DF: fstsw ax
  '004F04E1: test ah, 01h
  '004F04E4: jz 4F04EDh
  '004F04E6: mov ecx, 00000001h
  '004F04EB: jmp 4F04EFh
  '004F04ED: xor ecx, ecx
  '004F04EF: mov eax, [ebp+18h]
  '004F04F2: fld real4 ptr [eax]
  '004F04F4: fcomp real4 ptr [ebp-68h]
  '004F04F7: fstsw ax
  '004F04F9: test ah, 01h
  '004F04FC: jz 4F0505h
  '004F04FE: mov eax, 00000001h
  '004F0503: jmp 4F0507h
  '004F0505: xor eax, eax
  '004F0507: neg eax
  '004F0509: neg ecx
  '004F050B: and eax, ecx
  '004F050D: neg edx
  '004F050F: and eax, edx
  '004F0511: neg edi
  '004F0513: and eax, edi
  '004F0515: test ax, ax
  '004F0518: jz 4F058Fh
  '004F051A: mov ecx, [esi]
  '004F051C: lea edx, [ebp-18h]
  '004F051F: push edx
  '004F0520: push esi
  '004F0521: call [ecx+00000850h]
  '004F0527: test eax, eax
  '004F0529: jnl 4F0539h
  '004F052B: push 00000850h
  '004F0530: push 0042728Ch
  '004F0535: push esi
  '004F0536: push eax
  '004F0537: call ebx
  '004F0539: mov edx, [ebp-18h]
  '004F053C: lea ecx, [ebp-1Ch]
  '004F053F: mov [ebp-18h], 00000000h
  '004F0546: call [00401378h]
  '004F054C: mov eax, [esi]
  '004F054E: lea ecx, [ebp-60h]
  '004F0551: lea edx, [ebp-1Ch]
  '004F0554: push ecx
  '004F0555: push edx
  '004F0556: push esi
  '004F0557: call [eax+00000910h]
  '004F055D: lea ecx, [ebp-1Ch]
  '004F0560: call [004013B4h]
  '004F0566: push 00000000h
  '004F0568: push 00000001h
  '004F056A: push esi
  '004F056B: call [00401060h]
  '004F0571: mov eax, [esi]
  '004F0573: add esp, 0000000Ch
  '004F0576: push esi
  '004F0577: call [eax+000007D4h]
  '004F057D: test eax, eax
  '004F057F: jnl 4F058Fh
  '004F0581: push 000007D4h
  '004F0586: push 0042728Ch
  '004F058B: push esi
  '004F058C: push eax
  '004F058D: call ebx
  '004F058F: sub esp, 00000010h
  '004F0592: mov eax, 00004002h
  '004F0597: mov ebx, esp
  '004F0599: mov edx, eax
  '004F059B: sub esp, 00000010h
  '004F059E: mov ecx, [ebp+10h]
  '004F05A1: mov [ebx], eax
  '004F05A3: mov eax, [ebp-28h]
  '004F05A6: mov edi, 00004004h
  '004F05AB: mov [ebx+04h], eax
  '004F05AE: mov eax, [ebp+0Ch]
  '004F05B1: mov [ebx+08h], eax
  '004F05B4: mov eax, [ebp-20h]
  '004F05B7: mov [ebx+0Ch], eax
  '004F05BA: mov eax, esp
  '004F05BC: sub esp, 00000010h
  '004F05BF: mov [eax], edx
  '004F05C1: mov edx, [ebp-38h]
  '004F05C4: mov [eax+04h], edx
  '004F05C7: mov edx, esp
  '004F05C9: sub esp, 00000010h
  '004F05CC: mov [eax+08h], ecx
  '004F05CF: mov ecx, [ebp-30h]
  '004F05D2: mov [eax+0Ch], ecx
  '004F05D5: mov eax, [ebp-48h]
  '004F05D8: mov ecx, [ebp+14h]
  '004F05DB: mov [edx], edi
  '004F05DD: mov [edx+04h], eax
  '004F05E0: mov eax, [ebp-40h]
  '004F05E3: mov [edx+08h], ecx
  '004F05E6: mov ecx, esp
  '004F05E8: push 00000004h
  '004F05EA: push 00000007h
  '004F05EC: mov [edx+0Ch], eax
  '004F05EF: mov edx, [ebp-58h]
  '004F05F2: mov eax, edi
  '004F05F4: push esi
  '004F05F5: mov [ecx], eax
  '004F05F7: mov eax, [ebp+18h]
  '004F05FA: mov [ecx+04h], edx
  '004F05FD: mov edx, [ebp-50h]
  '004F0600: mov [ecx+08h], eax
  '004F0603: mov [ecx+0Ch], edx
  '004F0606: call [00401060h]
  '004F060C: add esp, 0000004Ch
  '004F060F: mov [ebp-04h], 00000000h
  '004F0616: wait 
  '004F0617: push 004F0633h
  '004F061C: jmp 4F0632h
  '004F061E: lea eax, [ebp-1Ch]
  '004F0621: lea ecx, [ebp-18h]
  '004F0624: push eax
  '004F0625: push ecx
  '004F0626: push 00000002h
  '004F0628: call [004012E8h]
  '004F062E: add esp, 0000000Ch
  '004F0631: ret 
End Sub
Private Sub UserControl__4EF420
  '004EF420: push ebp
  '004EF421: mov ebp, esp
  '004EF423: sub esp, 0000000Ch
  '004EF426: push 004081B6h
  '004EF42B: mov eax, fs:[00h]
  '004EF431: push eax
  '004EF432: mov fs:[00000000h], esp
  '004EF439: sub esp, 00000010h
  '004EF43C: push ebx
  '004EF43D: push esi
  '004EF43E: push edi
  '004EF43F: mov [ebp-0Ch], esp
  '004EF442: mov [ebp-08h], 00405610h
  '004EF449: mov esi, [ebp+08h]
  '004EF44C: mov eax, esi
  '004EF44E: and eax, 00000001h
  '004EF451: mov [ebp-04h], eax
  '004EF454: and esi, FFFFFFFEh
  '004EF457: push esi
  '004EF458: mov [ebp+08h], esi
  '004EF45B: mov ecx, [esi]
  '004EF45D: call [ecx+04h]
  '004EF460: mov edi, [esi]
  '004EF462: xor ebx, ebx
  '004EF464: push 00427F88h
  '004EF469: mov [ebp-18h], ebx
  '004EF46C: call [00401200h]
  '004EF472: lea edx, [ebp-18h]
  '004EF475: push eax
  '004EF476: push edx
  '004EF477: call [004010E4h]
  '004EF47D: push eax
  '004EF47E: push esi
  '004EF47F: call [edi+00000940h]
  '004EF485: cmp eax, ebx
  '004EF487: fclex 
  '004EF489: jnl 4EF4A1h
  '004EF48B: mov edi, [004010A0h]
  '004EF491: push 00000940h
  '004EF496: push 0042728Ch
  '004EF49B: push esi
  '004EF49C: push eax
  '004EF49D: call edi
  '004EF49F: jmp 4EF4A7h
  '004EF4A1: mov edi, [004010A0h]
  '004EF4A7: lea ecx, [ebp-18h]
  '004EF4AA: call [004013B8h]
  '004EF4B0: mov eax, [esi]
  '004EF4B2: push 00000003h
  '004EF4B4: push esi
  '004EF4B5: call [eax+00000114h]
  '004EF4BB: cmp eax, ebx
  '004EF4BD: fclex 
  '004EF4BF: jnl 4EF4CFh
  '004EF4C1: push 00000114h
  '004EF4C6: push 0042725Ch
  '004EF4CB: push esi
  '004EF4CC: push eax
  '004EF4CD: call edi
  '004EF4CF: mov ecx, [esi]
  '004EF4D1: push 00000003h
  '004EF4D3: push esi
  '004EF4D4: call [ecx+00000294h]
  '004EF4DA: cmp eax, ebx
  '004EF4DC: fclex 
  '004EF4DE: jnl 4EF4EEh
  '004EF4E0: push 00000294h
  '004EF4E5: push 0042725Ch
  '004EF4EA: push esi
  '004EF4EB: push eax
  '004EF4EC: call edi
  '004EF4EE: mov [ebp-04h], ebx
  '004EF4F1: push 004EF503h
  '004EF4F6: jmp 4EF502h
  '004EF4F8: lea ecx, [ebp-18h]
  '004EF4FB: call [004013B8h]
  '004EF501: ret 
End Sub
Private Sub UserControl__4ED680
  '004ED680: push ebp
  '004ED681: mov ebp, esp
  '004ED683: sub esp, 0000000Ch
  '004ED686: push 004081B6h
  '004ED68B: mov eax, fs:[00h]
  '004ED691: push eax
  '004ED692: mov fs:[00000000h], esp
  '004ED699: sub esp, 00000010h
  '004ED69C: push ebx
  '004ED69D: push esi
  '004ED69E: push edi
  '004ED69F: mov [ebp-0Ch], esp
  '004ED6A2: mov [ebp-08h], 004055D8h
  '004ED6A9: mov esi, [ebp+08h]
  '004ED6AC: mov eax, esi
  '004ED6AE: and eax, 00000001h
  '004ED6B1: mov [ebp-04h], eax
  '004ED6B4: and esi, FFFFFFFEh
  '004ED6B7: push esi
  '004ED6B8: mov [ebp+08h], esi
  '004ED6BB: mov ecx, [esi]
  '004ED6BD: call [ecx+04h]
  '004ED6C0: mov edx, [esi+3Ch]
  '004ED6C3: xor edi, edi
  '004ED6C5: push edx
  '004ED6C6: mov [ebp-18h], edi
  '004ED6C9: call 00420C34h
  '004ED6CE: call [0040109Ch]
  '004ED6D4: mov ebx, [esi]
  '004ED6D6: push 0041D908h
  '004ED6DB: push edi
  '004ED6DC: call [0040137Ch]
  '004ED6E2: push eax
  '004ED6E3: lea eax, [ebp-18h]
  '004ED6E6: push eax
  '004ED6E7: call [004010E4h]
  '004ED6ED: push eax
  '004ED6EE: push esi
  '004ED6EF: call [ebx+00000940h]
  '004ED6F5: cmp eax, edi
  '004ED6F7: fclex 
  '004ED6F9: jnl 4ED70Dh
  '004ED6FB: push 00000940h
  '004ED700: push 0042728Ch
  '004ED705: push esi
  '004ED706: push eax
  '004ED707: call [004010A0h]
  '004ED70D: lea ecx, [ebp-18h]
  '004ED710: call [004013B8h]
  '004ED716: mov [ebp-04h], edi
  '004ED719: push 004ED72Bh
  '004ED71E: jmp 4ED72Ah
  '004ED720: lea ecx, [ebp-18h]
  '004ED723: call [004013B8h]
  '004ED729: ret 
End Sub
Private Sub UserControl__4ED750
  '004ED750: push ebp
  '004ED751: mov ebp, esp
  '004ED753: sub esp, 0000000Ch
  '004ED756: push 004081B6h
  '004ED75B: mov eax, fs:[00h]
  '004ED761: push eax
  '004ED762: mov fs:[00000000h], esp
  '004ED769: sub esp, 0000008Ch
  '004ED76F: push ebx
  '004ED770: push esi
  '004ED771: push edi
  '004ED772: mov [ebp-0Ch], esp
  '004ED775: mov [ebp-08h], 004055E8h
  '004ED77C: mov esi, [ebp+08h]
  '004ED77F: mov eax, esi
  '004ED781: and eax, 00000001h
  '004ED784: mov [ebp-04h], eax
  '004ED787: and esi, FFFFFFFEh
  '004ED78A: push esi
  '004ED78B: mov [ebp+08h], esi
  '004ED78E: mov ecx, [esi]
  '004ED790: call [ecx+04h]
  '004ED793: mov edi, [ebp+0Ch]
  '004ED796: mov edx, [esi]
  '004ED798: xor eax, eax
  '004ED79A: mov ebx, [edi]
  '004ED79C: mov [ebp-18h], eax
  '004ED79F: mov [ebp-1Ch], eax
  '004ED7A2: mov [ebp-20h], eax
  '004ED7A5: mov [ebp-24h], eax
  '004ED7A8: mov [ebp-34h], eax
  '004ED7AB: mov [ebp-44h], eax
  '004ED7AE: mov [ebp-54h], eax
  '004ED7B1: mov [ebp-68h], eax
  '004ED7B4: lea eax, [ebp-1Ch]
  '004ED7B7: push eax
  '004ED7B8: push esi
  '004ED7B9: call [edx+000002B0h]
  '004ED7BF: test eax, eax
  '004ED7C1: fclex 
  '004ED7C3: jnl 4ED7D7h
  '004ED7C5: push 000002B0h
  '004ED7CA: push 0042725Ch
  '004ED7CF: push esi
  '004ED7D0: push eax
  '004ED7D1: call [004010A0h]
  '004ED7D7: mov eax, [ebp-1Ch]
  '004ED7DA: lea edx, [ebp-18h]
  '004ED7DD: push edx
  '004ED7DE: push eax
  '004ED7DF: mov ecx, [eax]
  '004ED7E1: mov [ebp-70h], eax
  '004ED7E4: call [ecx+20h]
  '004ED7E7: test eax, eax
  '004ED7E9: fclex 
  '004ED7EB: jnl 4ED7FFh
  '004ED7ED: mov ecx, [ebp-70h]
  '004ED7F0: push 00000020h
  '004ED7F2: push 00427BDCh
  '004ED7F7: push ecx
  '004ED7F8: push eax
  '004ED7F9: call [004010A0h]
  '004ED7FF: mov edx, [esi+000000B8h]
  '004ED805: mov eax, [ebp-18h]
  '004ED808: sub esp, 00000010h
  '004ED80B: mov [ebp-4Ch], edx
  '004ED80E: mov [ebp-2Ch], eax
  '004ED811: mov edx, esp
  '004ED813: mov eax, 00000008h
  '004ED818: sub esp, 00000010h
  '004ED81B: mov [ebp-34h], eax
  '004ED81E: mov [ebp-54h], eax
  '004ED821: mov [edx], eax
  '004ED823: mov eax, [ebp-30h]
  '004ED826: mov [ebp-18h], 00000000h
  '004ED82D: mov ecx, [ebx]
  '004ED82F: mov [edx+04h], eax
  '004ED832: mov eax, [ebp-2Ch]
  '004ED835: mov [edx+08h], eax
  '004ED838: mov eax, [ebp-28h]
  '004ED83B: mov [edx+0Ch], eax
  '004ED83E: mov eax, [ebp-54h]
  '004ED841: mov edx, esp
  '004ED843: push 00427CB0h
  '004ED848: push ebx
  '004ED849: mov [edx], eax
  '004ED84B: mov eax, [ebp-50h]
  '004ED84E: mov [edx+04h], eax
  '004ED851: mov eax, [ebp-4Ch]
  '004ED854: mov [edx+08h], eax
  '004ED857: mov eax, [ebp-48h]
  '004ED85A: mov [edx+0Ch], eax
  '004ED85D: call [ecx+20h]
  '004ED860: test eax, eax
  '004ED862: fclex 
  '004ED864: jnl 4ED875h
  '004ED866: push 00000020h
  '004ED868: push 00427C64h
  '004ED86D: push ebx
  '004ED86E: push eax
  '004ED86F: call [004010A0h]
  '004ED875: lea ecx, [ebp-1Ch]
  '004ED878: call [004013B8h]
  '004ED87E: lea ecx, [ebp-34h]
  '004ED881: call [00401030h]
  '004ED887: mov edx, [edi]
  '004ED889: mov ebx, [esi+000000BCh]
  '004ED88F: mov [ebp-6Ch], edx
  '004ED892: mov [ebp-4Ch], ebx
  '004ED895: mov [ebp-54h], 00000003h
  '004ED89C: mov edx, [edx]
  '004ED89E: mov ebx, [ebp-60h]
  '004ED8A1: sub esp, 00000010h
  '004ED8A4: mov [ebp-0000009Ch], edx
  '004ED8AA: mov edx, esp
  '004ED8AC: mov ecx, 00000002h
  '004ED8B1: mov eax, 00000001h
  '004ED8B6: mov [edx], ecx
  '004ED8B8: sub esp, 00000010h
  '004ED8BB: mov ecx, esp
  '004ED8BD: mov [edx+04h], ebx
  '004ED8C0: push 00427CC4h
  '004ED8C5: mov [edx+08h], eax
  '004ED8C8: mov eax, [ebp-58h]
  '004ED8CB: mov [edx+0Ch], eax
  '004ED8CE: mov edx, [ebp-54h]
  '004ED8D1: mov eax, [ebp-50h]
  '004ED8D4: mov [ecx], edx
  '004ED8D6: mov edx, [ebp-4Ch]
  '004ED8D9: mov [ecx+04h], eax
  '004ED8DC: mov eax, [ebp-48h]
  '004ED8DF: mov [ecx+08h], edx
  '004ED8E2: mov edx, [ebp-0000009Ch]
  '004ED8E8: mov [ecx+0Ch], eax
  '004ED8EB: mov ecx, [ebp-6Ch]
  '004ED8EE: push ecx
  '004ED8EF: call [edx+20h]
  '004ED8F2: test eax, eax
  '004ED8F4: fclex 
  '004ED8F6: jnl 4ED90Ah
  '004ED8F8: mov ecx, [ebp-6Ch]
  '004ED8FB: push 00000020h
  '004ED8FD: push 00427C64h
  '004ED902: push ecx
  '004ED903: push eax
  '004ED904: call [004010A0h]
  '004ED90A: mov edx, [esi+000000C0h]
  '004ED910: sub esp, 00000010h
  '004ED913: mov [ebp-4Ch], edx
  '004ED916: mov edx, esp
  '004ED918: mov eax, 00000002h
  '004ED91D: sub esp, 00000010h
  '004ED920: mov [edx], eax
  '004ED922: mov [ebp-54h], 00000003h
  '004ED929: mov ecx, [edi]
  '004ED92B: mov [edx+04h], ebx
  '004ED92E: mov [ebp-6Ch], ecx
  '004ED931: mov ecx, [ecx]
  '004ED933: mov [edx+08h], eax
  '004ED936: mov eax, [ebp-58h]
  '004ED939: mov [edx+0Ch], eax
  '004ED93C: mov eax, [ebp-54h]
  '004ED93F: mov edx, esp
  '004ED941: push 00427CE8h
  '004ED946: mov [edx], eax
  '004ED948: mov eax, [ebp-50h]
  '004ED94B: mov [edx+04h], eax
  '004ED94E: mov eax, [ebp-4Ch]
  '004ED951: mov [edx+08h], eax
  '004ED954: mov eax, [ebp-48h]
  '004ED957: mov [edx+0Ch], eax
  '004ED95A: mov edx, [ebp-6Ch]
  '004ED95D: push edx
  '004ED95E: call [ecx+20h]
  '004ED961: test eax, eax
  '004ED963: fclex 
  '004ED965: jnl 4ED979h
  '004ED967: mov ecx, [ebp-6Ch]
  '004ED96A: push 00000020h
  '004ED96C: push 00427C64h
  '004ED971: push ecx
  '004ED972: push eax
  '004ED973: call [004010A0h]
  '004ED979: mov edx, [esi+000000C4h]
  '004ED97F: sub esp, 00000010h
  '004ED982: mov [ebp-4Ch], edx
  '004ED985: mov edx, esp
  '004ED987: mov ecx, 00000009h
  '004ED98C: mov [ebp-2Ch], 00000000h
  '004ED993: mov [ebp-34h], ecx
  '004ED996: mov [ebp-54h], ecx
  '004ED999: mov [edx], ecx
  '004ED99B: mov ecx, [ebp-30h]
  '004ED99E: sub esp, 00000010h
  '004ED9A1: mov eax, [edi]
  '004ED9A3: mov [edx+04h], ecx
  '004ED9A6: mov ecx, [ebp-2Ch]
  '004ED9A9: mov [ebp-6Ch], eax
  '004ED9AC: mov eax, [eax]
  '004ED9AE: mov [edx+08h], ecx
  '004ED9B1: mov ecx, [ebp-28h]
  '004ED9B4: mov [edx+0Ch], ecx
  '004ED9B7: mov ecx, [ebp-54h]
  '004ED9BA: mov edx, esp
  '004ED9BC: push 00427D04h
  '004ED9C1: mov [edx], ecx
  '004ED9C3: mov ecx, [ebp-50h]
  '004ED9C6: mov [edx+04h], ecx
  '004ED9C9: mov ecx, [ebp-4Ch]
  '004ED9CC: mov [edx+08h], ecx
  '004ED9CF: mov ecx, [ebp-48h]
  '004ED9D2: mov [edx+0Ch], ecx
  '004ED9D5: mov edx, [ebp-6Ch]
  '004ED9D8: push edx
  '004ED9D9: call [eax+20h]
  '004ED9DC: test eax, eax
  '004ED9DE: fclex 
  '004ED9E0: jnl 4ED9F4h
  '004ED9E2: mov ecx, [ebp-6Ch]
  '004ED9E5: push 00000020h
  '004ED9E7: push 00427C64h
  '004ED9EC: push ecx
  '004ED9ED: push eax
  '004ED9EE: call [004010A0h]
  '004ED9F4: lea ecx, [ebp-34h]
  '004ED9F7: call [00401030h]
  '004ED9FD: mov edx, [esi+000000C8h]
  '004EDA03: sub esp, 00000010h
  '004EDA06: mov [ebp-4Ch], edx
  '004EDA09: mov edx, esp
  '004EDA0B: mov eax, 00000002h
  '004EDA10: sub esp, 00000010h
  '004EDA13: mov [edx], eax
  '004EDA15: mov eax, 00000020h
  '004EDA1A: mov [ebp-54h], 00000003h
  '004EDA21: mov ecx, [edi]
  '004EDA23: mov [edx+04h], ebx
  '004EDA26: mov [ebp-6Ch], ecx
  '004EDA29: mov ecx, [ecx]
  '004EDA2B: mov [edx+08h], eax
  '004EDA2E: mov eax, [ebp-58h]
  '004EDA31: mov [edx+0Ch], eax
  '004EDA34: mov eax, [ebp-54h]
  '004EDA37: mov edx, esp
  '004EDA39: push 00427D18h
  '004EDA3E: mov [edx], eax
  '004EDA40: mov eax, [ebp-50h]
  '004EDA43: mov [edx+04h], eax
  '004EDA46: mov eax, [ebp-4Ch]
  '004EDA49: mov [edx+08h], eax
  '004EDA4C: mov eax, [ebp-48h]
  '004EDA4F: mov [edx+0Ch], eax
  '004EDA52: mov edx, [ebp-6Ch]
  '004EDA55: push edx
  '004EDA56: call [ecx+20h]
  '004EDA59: test eax, eax
  '004EDA5B: fclex 
  '004EDA5D: jnl 4EDA71h
  '004EDA5F: mov ecx, [ebp-6Ch]
  '004EDA62: push 00000020h
  '004EDA64: push 00427C64h
  '004EDA69: push ecx
  '004EDA6A: push eax
  '004EDA6B: call [004010A0h]
  '004EDA71: mov edx, [esi+000000CCh]
  '004EDA77: sub esp, 00000010h
  '004EDA7A: mov [ebp-4Ch], edx
  '004EDA7D: mov edx, esp
  '004EDA7F: mov eax, 00000002h
  '004EDA84: sub esp, 00000010h
  '004EDA87: mov [edx], eax
  '004EDA89: mov eax, 00000020h
  '004EDA8E: mov [ebp-54h], 00000003h
  '004EDA95: mov ecx, [edi]
  '004EDA97: mov [edx+04h], ebx
  '004EDA9A: mov [ebp-6Ch], ecx
  '004EDA9D: mov ecx, [ecx]
  '004EDA9F: mov [edx+08h], eax
  '004EDAA2: mov eax, [ebp-58h]
  '004EDAA5: mov [edx+0Ch], eax
  '004EDAA8: mov eax, [ebp-54h]
  '004EDAAB: mov edx, esp
  '004EDAAD: push 00427D38h
  '004EDAB2: mov [edx], eax
  '004EDAB4: mov eax, [ebp-50h]
  '004EDAB7: mov [edx+04h], eax
  '004EDABA: mov eax, [ebp-4Ch]
  '004EDABD: mov [edx+08h], eax
  '004EDAC0: mov eax, [ebp-48h]
  '004EDAC3: mov [edx+0Ch], eax
  '004EDAC6: mov edx, [ebp-6Ch]
  '004EDAC9: push edx
  '004EDACA: call [ecx+20h]
  '004EDACD: test eax, eax
  '004EDACF: fclex 
  '004EDAD1: jnl 4EDAE5h
  '004EDAD3: mov ecx, [ebp-6Ch]
  '004EDAD6: push 00000020h
  '004EDAD8: push 00427C64h
  '004EDADD: push ecx
  '004EDADE: push eax
  '004EDADF: call [004010A0h]
  '004EDAE5: mov edx, [esi+000000D0h]
  '004EDAEB: sub esp, 00000010h
  '004EDAEE: mov [ebp-4Ch], edx
  '004EDAF1: mov edx, esp
  '004EDAF3: mov eax, 00000002h
  '004EDAF8: sub esp, 00000010h
  '004EDAFB: mov [edx], eax
  '004EDAFD: mov eax, 00000001h
  '004EDB02: mov [ebp-54h], 00000003h
  '004EDB09: mov ecx, [edi]
  '004EDB0B: mov [edx+04h], ebx
  '004EDB0E: mov [ebp-6Ch], ecx
  '004EDB11: mov ecx, [ecx]
  '004EDB13: mov [edx+08h], eax
  '004EDB16: mov eax, [ebp-58h]
  '004EDB19: mov [edx+0Ch], eax
  '004EDB1C: mov eax, [ebp-54h]
  '004EDB1F: mov edx, esp
  '004EDB21: push 00427D58h
  '004EDB26: mov [edx], eax
  '004EDB28: mov eax, [ebp-50h]
  '004EDB2B: mov [edx+04h], eax
  '004EDB2E: mov eax, [ebp-4Ch]
  '004EDB31: mov [edx+08h], eax
  '004EDB34: mov eax, [ebp-48h]
  '004EDB37: mov [edx+0Ch], eax
  '004EDB3A: mov edx, [ebp-6Ch]
  '004EDB3D: push edx
  '004EDB3E: call [ecx+20h]
  '004EDB41: test eax, eax
  '004EDB43: fclex 
  '004EDB45: jnl 4EDB59h
  '004EDB47: mov ecx, [ebp-6Ch]
  '004EDB4A: push 00000020h
  '004EDB4C: push 00427C64h
  '004EDB51: push ecx
  '004EDB52: push eax
  '004EDB53: call [004010A0h]
  '004EDB59: mov edx, [esi+000000A8h]
  '004EDB5F: sub esp, 00000010h
  '004EDB62: mov [ebp-4Ch], edx
  '004EDB65: mov edx, esp
  '004EDB67: mov eax, 00000002h
  '004EDB6C: sub esp, 00000010h
  '004EDB6F: mov [edx], eax
  '004EDB71: mov eax, 00000020h
  '004EDB76: mov [ebp-54h], 00000003h
  '004EDB7D: mov ecx, [edi]
  '004EDB7F: mov [edx+04h], ebx
  '004EDB82: mov [ebp-6Ch], ecx
  '004EDB85: mov ecx, [ecx]
  '004EDB87: mov [edx+08h], eax
  '004EDB8A: mov eax, [ebp-58h]
  '004EDB8D: mov [edx+0Ch], eax
  '004EDB90: mov eax, [ebp-54h]
  '004EDB93: mov edx, esp
  '004EDB95: push 00427D74h
  '004EDB9A: mov [edx], eax
  '004EDB9C: mov eax, [ebp-50h]
  '004EDB9F: mov [edx+04h], eax
  '004EDBA2: mov eax, [ebp-4Ch]
  '004EDBA5: mov [edx+08h], eax
  '004EDBA8: mov eax, [ebp-48h]
  '004EDBAB: mov [edx+0Ch], eax
  '004EDBAE: mov edx, [ebp-6Ch]
  '004EDBB1: push edx
  '004EDBB2: call [ecx+20h]
  '004EDBB5: test eax, eax
  '004EDBB7: fclex 
  '004EDBB9: jnl 4EDBCDh
  '004EDBBB: mov ecx, [ebp-6Ch]
  '004EDBBE: push 00000020h
  '004EDBC0: push 00427C64h
  '004EDBC5: push ecx
  '004EDBC6: push eax
  '004EDBC7: call [004010A0h]
  '004EDBCD: mov edx, [esi+000000ACh]
  '004EDBD3: sub esp, 00000010h
  '004EDBD6: mov [ebp-4Ch], edx
  '004EDBD9: mov edx, esp
  '004EDBDB: mov eax, 00000002h
  '004EDBE0: sub esp, 00000010h
  '004EDBE3: mov [edx], eax
  '004EDBE5: mov eax, 00000020h
  '004EDBEA: mov [ebp-54h], 00000003h
  '004EDBF1: mov ecx, [edi]
  '004EDBF3: mov [edx+04h], ebx
  '004EDBF6: mov [ebp-6Ch], ecx
  '004EDBF9: mov ecx, [ecx]
  '004EDBFB: mov [edx+08h], eax
  '004EDBFE: mov eax, [ebp-58h]
  '004EDC01: mov [edx+0Ch], eax
  '004EDC04: mov eax, [ebp-54h]
  '004EDC07: mov edx, esp
  '004EDC09: push 00427D9Ch
  '004EDC0E: mov [edx], eax
  '004EDC10: mov eax, [ebp-50h]
  '004EDC13: mov [edx+04h], eax
  '004EDC16: mov eax, [ebp-4Ch]
  '004EDC19: mov [edx+08h], eax
  '004EDC1C: mov eax, [ebp-48h]
  '004EDC1F: mov [edx+0Ch], eax
  '004EDC22: mov edx, [ebp-6Ch]
  '004EDC25: push edx
  '004EDC26: call [ecx+20h]
  '004EDC29: test eax, eax
  '004EDC2B: fclex 
  '004EDC2D: jnl 4EDC41h
  '004EDC2F: mov ecx, [ebp-6Ch]
  '004EDC32: push 00000020h
  '004EDC34: push 00427C64h
  '004EDC39: push ecx
  '004EDC3A: push eax
  '004EDC3B: call [004010A0h]
  '004EDC41: mov edx, [esi+000000B4h]
  '004EDC47: sub esp, 00000010h
  '004EDC4A: mov [ebp-4Ch], edx
  '004EDC4D: mov edx, esp
  '004EDC4F: mov ecx, 00000009h
  '004EDC54: mov [ebp-2Ch], 00000000h
  '004EDC5B: mov [ebp-34h], ecx
  '004EDC5E: mov [ebp-54h], ecx
  '004EDC61: mov [edx], ecx
  '004EDC63: mov ecx, [ebp-30h]
  '004EDC66: sub esp, 00000010h
  '004EDC69: mov eax, [edi]
  '004EDC6B: mov [edx+04h], ecx
  '004EDC6E: mov ecx, [ebp-2Ch]
  '004EDC71: mov [ebp-6Ch], eax
  '004EDC74: mov eax, [eax]
  '004EDC76: mov [edx+08h], ecx
  '004EDC79: mov ecx, [ebp-28h]
  '004EDC7C: mov [edx+0Ch], ecx
  '004EDC7F: mov ecx, [ebp-54h]
  '004EDC82: mov edx, esp
  '004EDC84: push 00427DD4h
  '004EDC89: mov [edx], ecx
  '004EDC8B: mov ecx, [ebp-50h]
  '004EDC8E: mov [edx+04h], ecx
  '004EDC91: mov ecx, [ebp-4Ch]
  '004EDC94: mov [edx+08h], ecx
  '004EDC97: mov ecx, [ebp-48h]
  '004EDC9A: mov [edx+0Ch], ecx
  '004EDC9D: mov edx, [ebp-6Ch]
  '004EDCA0: push edx
  '004EDCA1: call [eax+20h]
  '004EDCA4: test eax, eax
  '004EDCA6: fclex 
  '004EDCA8: jnl 4EDCBCh
  '004EDCAA: mov ecx, [ebp-6Ch]
  '004EDCAD: push 00000020h
  '004EDCAF: push 00427C64h
  '004EDCB4: push ecx
  '004EDCB5: push eax
  '004EDCB6: call [004010A0h]
  '004EDCBC: lea ecx, [ebp-34h]
  '004EDCBF: call [00401030h]
  '004EDCC5: mov eax, [esi+10h]
  '004EDCC8: lea ecx, [ebp-68h]
  '004EDCCB: push ecx
  '004EDCCC: push eax
  '004EDCCD: mov edx, [eax]
  '004EDCCF: call [edx+00000090h]
  '004EDCD5: test eax, eax
  '004EDCD7: fclex 
  '004EDCD9: jnl 4EDCF0h
  '004EDCDB: mov edx, [esi+10h]
  '004EDCDE: push 00000090h
  '004EDCE3: push 0042725Ch
  '004EDCE8: push edx
  '004EDCE9: push eax
  '004EDCEA: call [004010A0h]
  '004EDCF0: mov dx, [ebp-68h]
  '004EDCF4: sub esp, 00000010h
  '004EDCF7: mov [ebp-4Ch], dx
  '004EDCFB: mov edx, esp
  '004EDCFD: mov eax, 0000000Bh
  '004EDD02: sub esp, 00000010h
  '004EDD05: mov [edx], eax
  '004EDD07: mov [ebp-54h], eax
  '004EDD0A: or eax, FFFFFFFFh
  '004EDD0D: mov ecx, [edi]
  '004EDD0F: mov [edx+04h], ebx
  '004EDD12: mov [ebp-70h], ecx
  '004EDD15: mov ecx, [ecx]
  '004EDD17: mov [edx+08h], eax
  '004EDD1A: mov eax, [ebp-58h]
  '004EDD1D: mov [edx+0Ch], eax
  '004EDD20: mov eax, [ebp-54h]
  '004EDD23: mov edx, esp
  '004EDD25: push 00427E0Ch
  '004EDD2A: mov [edx], eax
  '004EDD2C: mov eax, [ebp-50h]
  '004EDD2F: mov [edx+04h], eax
  '004EDD32: mov eax, [ebp-4Ch]
  '004EDD35: mov [edx+08h], eax
  '004EDD38: mov eax, [ebp-48h]
  '004EDD3B: mov [edx+0Ch], eax
  '004EDD3E: mov edx, [ebp-70h]
  '004EDD41: push edx
  '004EDD42: call [ecx+20h]
  '004EDD45: test eax, eax
  '004EDD47: fclex 
  '004EDD49: jnl 4EDD5Dh
  '004EDD4B: mov ecx, [ebp-70h]
  '004EDD4E: push 00000020h
  '004EDD50: push 00427C64h
  '004EDD55: push ecx
  '004EDD56: push eax
  '004EDD57: call [004010A0h]
  '004EDD5D: lea ecx, [ebp-54h]
  '004EDD60: call [00401030h]
  '004EDD66: mov eax, [esi+10h]
  '004EDD69: lea ecx, [ebp-1Ch]
  '004EDD6C: push ecx
  '004EDD6D: push eax
  '004EDD6E: mov edx, [eax]
  '004EDD70: call [edx+00000248h]
  '004EDD76: test eax, eax
  '004EDD78: fclex 
  '004EDD7A: jnl 4EDD91h
  '004EDD7C: mov edx, [esi+10h]
  '004EDD7F: push 00000248h
  '004EDD84: push 0042725Ch
  '004EDD89: push edx
  '004EDD8A: push eax
  '004EDD8B: call [004010A0h]
  '004EDD91: mov eax, [edi]
  '004EDD93: mov ecx, [esi]
  '004EDD95: lea edx, [ebp-20h]
  '004EDD98: mov [ebp-7Ch], eax
  '004EDD9B: push edx
  '004EDD9C: push esi
  '004EDD9D: call [ecx+000002B0h]
  '004EDDA3: test eax, eax
  '004EDDA5: fclex 
  '004EDDA7: jnl 4EDDBBh
  '004EDDA9: push 000002B0h
  '004EDDAE: push 0042725Ch
  '004EDDB3: push esi
  '004EDDB4: push eax
  '004EDDB5: call [004010A0h]
  '004EDDBB: mov eax, [ebp-20h]
  '004EDDBE: lea edx, [ebp-24h]
  '004EDDC1: push edx
  '004EDDC2: push eax
  '004EDDC3: mov ecx, [eax]
  '004EDDC5: mov [ebp-74h], eax
  '004EDDC8: call [ecx+24h]
  '004EDDCB: test eax, eax
  '004EDDCD: fclex 
  '004EDDCF: jnl 4EDDE3h
  '004EDDD1: mov ecx, [ebp-74h]
  '004EDDD4: push 00000024h
  '004EDDD6: push 00427BDCh
  '004EDDDB: push ecx
  '004EDDDC: push eax
  '004EDDDD: call [004010A0h]
  '004EDDE3: mov eax, [ebp-24h]
  '004EDDE6: mov ecx, [ebp-1Ch]
  '004EDDE9: mov edx, [ebp-7Ch]
  '004EDDEC: mov [ebp-3Ch], eax
  '004EDDEF: mov eax, 00000009h
  '004EDDF4: mov [ebp-24h], 00000000h
  '004EDDFB: mov [ebp-44h], eax
  '004EDDFE: mov [ebp-1Ch], 00000000h
  '004EDE05: mov [ebp-2Ch], ecx
  '004EDE08: mov [ebp-34h], eax
  '004EDE0B: mov ecx, [edx]
  '004EDE0D: sub esp, 00000010h
  '004EDE10: mov edx, esp
  '004EDE12: sub esp, 00000010h
  '004EDE15: mov [edx], eax
  '004EDE17: mov eax, [ebp-40h]
  '004EDE1A: mov [edx+04h], eax
  '004EDE1D: mov eax, [ebp-3Ch]
  '004EDE20: mov [edx+08h], eax
  '004EDE23: mov eax, [ebp-38h]
  '004EDE26: mov [edx+0Ch], eax
  '004EDE29: mov eax, [ebp-34h]
  '004EDE2C: mov edx, esp
  '004EDE2E: push 00427DC4h
  '004EDE33: mov [edx], eax
  '004EDE35: mov eax, [ebp-30h]
  '004EDE38: mov [edx+04h], eax
  '004EDE3B: mov eax, [ebp-2Ch]
  '004EDE3E: mov [edx+08h], eax
  '004EDE41: mov eax, [ebp-28h]
  '004EDE44: mov [edx+0Ch], eax
  '004EDE47: mov edx, [ebp-7Ch]
  '004EDE4A: push edx
  '004EDE4B: call [ecx+20h]
  '004EDE4E: test eax, eax
  '004EDE50: fclex 
  '004EDE52: jnl 4EDE66h
  '004EDE54: mov ecx, [ebp-7Ch]
  '004EDE57: push 00000020h
  '004EDE59: push 00427C64h
  '004EDE5E: push ecx
  '004EDE5F: push eax
  '004EDE60: call [004010A0h]
  '004EDE66: lea ecx, [ebp-20h]
  '004EDE69: call [004013B8h]
  '004EDE6F: lea edx, [ebp-44h]
  '004EDE72: lea eax, [ebp-34h]
  '004EDE75: push edx
  '004EDE76: push eax
  '004EDE77: push 00000002h
  '004EDE79: call [00401050h]
  '004EDE7F: mov ecx, [esi]
  '004EDE81: add esp, 0000000Ch
  '004EDE84: lea edx, [ebp-1Ch]
  '004EDE87: push edx
  '004EDE88: push esi
  '004EDE89: call [ecx+000007C4h]
  '004EDE8F: test eax, eax
  '004EDE91: jnl 4EDEA5h
  '004EDE93: push 000007C4h
  '004EDE98: push 0042728Ch
  '004EDE9D: push esi
  '004EDE9E: push eax
  '004EDE9F: call [004010A0h]
  '004EDEA5: mov edx, [ebp-1Ch]
  '004EDEA8: sub esp, 00000010h
  '004EDEAB: mov [ebp-2Ch], edx
  '004EDEAE: mov edx, esp
  '004EDEB0: mov ecx, 00000009h
  '004EDEB5: mov [ebp-3Ch], 00000000h
  '004EDEBC: mov [ebp-44h], ecx
  '004EDEBF: mov [ebp-34h], ecx
  '004EDEC2: mov [edx], ecx
  '004EDEC4: mov ecx, [ebp-40h]
  '004EDEC7: sub esp, 00000010h
  '004EDECA: mov eax, [edi]
  '004EDECC: mov [edx+04h], ecx
  '004EDECF: mov ecx, [ebp-3Ch]
  '004EDED2: mov [ebp-70h], eax
  '004EDED5: mov [ebp-1Ch], 00000000h
  '004EDEDC: mov [edx+08h], ecx
  '004EDEDF: mov ecx, [ebp-38h]
  '004EDEE2: mov eax, [eax]
  '004EDEE4: mov [edx+0Ch], ecx
  '004EDEE7: mov ecx, [ebp-34h]
  '004EDEEA: mov edx, esp
  '004EDEEC: push 00427DF4h
  '004EDEF1: mov [edx], ecx
  '004EDEF3: mov ecx, [ebp-30h]
  '004EDEF6: mov [edx+04h], ecx
  '004EDEF9: mov ecx, [ebp-2Ch]
  '004EDEFC: mov [edx+08h], ecx
  '004EDEFF: mov ecx, [ebp-28h]
  '004EDF02: mov [edx+0Ch], ecx
  '004EDF05: mov edx, [ebp-70h]
  '004EDF08: push edx
  '004EDF09: call [eax+20h]
  '004EDF0C: test eax, eax
  '004EDF0E: fclex 
  '004EDF10: jnl 4EDF24h
  '004EDF12: mov ecx, [ebp-70h]
  '004EDF15: push 00000020h
  '004EDF17: push 00427C64h
  '004EDF1C: push ecx
  '004EDF1D: push eax
  '004EDF1E: call [004010A0h]
  '004EDF24: lea edx, [ebp-44h]
  '004EDF27: lea eax, [ebp-34h]
  '004EDF2A: push edx
  '004EDF2B: push eax
  '004EDF2C: push 00000002h
  '004EDF2E: call [00401050h]
  '004EDF34: mov eax, [esi+10h]
  '004EDF37: add esp, 0000000Ch
  '004EDF3A: lea edx, [ebp-68h]
  '004EDF3D: mov ecx, [eax]
  '004EDF3F: push edx
  '004EDF40: push eax
  '004EDF41: call [ecx+000000A0h]
  '004EDF47: test eax, eax
  '004EDF49: fclex 
  '004EDF4B: jnl 4EDF62h
  '004EDF4D: mov ecx, [esi+10h]
  '004EDF50: push 000000A0h
  '004EDF55: push 0042725Ch
  '004EDF5A: push ecx
  '004EDF5B: push eax
  '004EDF5C: call [004010A0h]
  '004EDF62: mov eax, [edi]
  '004EDF64: mov dx, [ebp-68h]
  '004EDF68: mov ecx, 00000002h
  '004EDF6D: mov [ebp-4Ch], dx
  '004EDF71: mov [ebp-54h], ecx
  '004EDF74: mov edx, [eax]
  '004EDF76: sub esp, 00000010h
  '004EDF79: mov [ebp-000000A0h], edx
  '004EDF7F: mov edx, esp
  '004EDF81: mov [ebp-70h], eax
  '004EDF84: xor eax, eax
  '004EDF86: sub esp, 00000010h
  '004EDF89: mov [edx], ecx
  '004EDF8B: mov ecx, esp
  '004EDF8D: push 00427E20h
  '004EDF92: mov [edx+04h], ebx
  '004EDF95: mov [edx+08h], eax
  '004EDF98: mov eax, [ebp-58h]
  '004EDF9B: mov [edx+0Ch], eax
  '004EDF9E: mov edx, [ebp-54h]
  '004EDFA1: mov eax, [ebp-50h]
  '004EDFA4: mov [ecx], edx
  '004EDFA6: mov edx, [ebp-4Ch]
  '004EDFA9: mov [ecx+04h], eax
  '004EDFAC: mov eax, [ebp-48h]
  '004EDFAF: mov [ecx+08h], edx
  '004EDFB2: mov edx, [ebp-000000A0h]
  '004EDFB8: mov [ecx+0Ch], eax
  '004EDFBB: mov ecx, [ebp-70h]
  '004EDFBE: push ecx
  '004EDFBF: call [edx+20h]
  '004EDFC2: test eax, eax
  '004EDFC4: fclex 
  '004EDFC6: jnl 4EDFDAh
  '004EDFC8: mov ecx, [ebp-70h]
  '004EDFCB: push 00000020h
  '004EDFCD: push 00427C64h
  '004EDFD2: push ecx
  '004EDFD3: push eax
  '004EDFD4: call [004010A0h]
  '004EDFDA: mov dx, [esi+00000100h]
  '004EDFE1: sub esp, 00000010h
  '004EDFE4: mov [ebp-4Ch], dx
  '004EDFE8: mov edx, esp
  '004EDFEA: mov eax, 00000002h
  '004EDFEF: sub esp, 00000010h
  '004EDFF2: mov [edx], eax
  '004EDFF4: mov eax, 00000001h
  '004EDFF9: mov [ebp-54h], 0000000Bh
  '004EE000: mov ecx, [edi]
  '004EE002: mov [edx+04h], ebx
  '004EE005: mov [ebp-6Ch], ecx
  '004EE008: mov ecx, [ecx]
  '004EE00A: mov [edx+08h], eax
  '004EE00D: mov eax, [ebp-58h]
  '004EE010: mov [edx+0Ch], eax
  '004EE013: mov eax, [ebp-54h]
  '004EE016: mov edx, esp
  '004EE018: push 00427C90h
  '004EE01D: mov [edx], eax
  '004EE01F: mov eax, [ebp-50h]
  '004EE022: mov [edx+04h], eax
  '004EE025: mov eax, [ebp-4Ch]
  '004EE028: mov [edx+08h], eax
  '004EE02B: mov eax, [ebp-48h]
  '004EE02E: mov [edx+0Ch], eax
  '004EE031: mov edx, [ebp-6Ch]
  '004EE034: push edx
  '004EE035: call [ecx+20h]
  '004EE038: test eax, eax
  '004EE03A: fclex 
  '004EE03C: jnl 4EE050h
  '004EE03E: mov ecx, [ebp-6Ch]
  '004EE041: push 00000020h
  '004EE043: push 00427C64h
  '004EE048: push ecx
  '004EE049: push eax
  '004EE04A: call [004010A0h]
  '004EE050: lea ecx, [ebp-54h]
  '004EE053: call [00401030h]
  '004EE059: mov edx, [esi+000000FCh]
  '004EE05F: sub esp, 00000010h
  '004EE062: mov [ebp-4Ch], edx
  '004EE065: mov edx, esp
  '004EE067: mov eax, 00000008h
  '004EE06C: sub esp, 00000010h
  '004EE06F: mov [edx], eax
  '004EE071: mov [ebp-54h], eax
  '004EE074: mov eax, 0041BC60h
  '004EE079: mov ecx, [edi]
  '004EE07B: mov [edx+04h], ebx
  '004EE07E: mov [ebp-6Ch], ecx
  '004EE081: mov ecx, [ecx]
  '004EE083: mov [edx+08h], eax
  '004EE086: mov eax, [ebp-58h]
  '004EE089: mov [edx+0Ch], eax
  '004EE08C: mov eax, [ebp-54h]
  '004EE08F: mov edx, esp
  '004EE091: push 00427E40h
  '004EE096: mov [edx], eax
  '004EE098: mov eax, [ebp-50h]
  '004EE09B: mov [edx+04h], eax
  '004EE09E: mov eax, [ebp-4Ch]
  '004EE0A1: mov [edx+08h], eax
  '004EE0A4: mov eax, [ebp-48h]
  '004EE0A7: mov [edx+0Ch], eax
  '004EE0AA: mov edx, [ebp-6Ch]
  '004EE0AD: push edx
  '004EE0AE: call [ecx+20h]
  '004EE0B1: test eax, eax
  '004EE0B3: fclex 
  '004EE0B5: jnl 4EE0C9h
  '004EE0B7: mov ecx, [ebp-6Ch]
  '004EE0BA: push 00000020h
  '004EE0BC: push 00427C64h
  '004EE0C1: push ecx
  '004EE0C2: push eax
  '004EE0C3: call [004010A0h]
  '004EE0C9: mov edx, [esi+00000124h]
  '004EE0CF: sub esp, 00000010h
  '004EE0D2: mov [ebp-4Ch], edx
  '004EE0D5: mov edx, esp
  '004EE0D7: mov eax, 00000003h
  '004EE0DC: sub esp, 00000010h
  '004EE0DF: mov [edx], eax
  '004EE0E1: mov [ebp-54h], eax
  '004EE0E4: mov eax, 80000014h
  '004EE0E9: mov ecx, [edi]
  '004EE0EB: mov [edx+04h], ebx
  '004EE0EE: mov [ebp-6Ch], ecx
  '004EE0F1: mov ecx, [ecx]
  '004EE0F3: mov [edx+08h], eax
  '004EE0F6: mov eax, [ebp-58h]
  '004EE0F9: mov [edx+0Ch], eax
  '004EE0FC: mov eax, [ebp-54h]
  '004EE0FF: mov edx, esp
  '004EE101: push 00427E4Ch
  '004EE106: mov [edx], eax
  '004EE108: mov eax, [ebp-50h]
  '004EE10B: mov [edx+04h], eax
  '004EE10E: mov eax, [ebp-4Ch]
  '004EE111: mov [edx+08h], eax
  '004EE114: mov eax, [ebp-48h]
  '004EE117: mov [edx+0Ch], eax
  '004EE11A: mov edx, [ebp-6Ch]
  '004EE11D: push edx
  '004EE11E: call [ecx+20h]
  '004EE121: test eax, eax
  '004EE123: fclex 
  '004EE125: jnl 4EE139h
  '004EE127: mov ecx, [ebp-6Ch]
  '004EE12A: push 00000020h
  '004EE12C: push 00427C64h
  '004EE131: push ecx
  '004EE132: push eax
  '004EE133: call [004010A0h]
  '004EE139: mov edx, [esi+00000128h]
  '004EE13F: sub esp, 00000010h
  '004EE142: mov [ebp-4Ch], edx
  '004EE145: mov edx, esp
  '004EE147: mov eax, 00000003h
  '004EE14C: sub esp, 00000010h
  '004EE14F: mov [edx], eax
  '004EE151: mov [ebp-54h], eax
  '004EE154: mov eax, 80000016h
  '004EE159: mov ecx, [edi]
  '004EE15B: mov [edx+04h], ebx
  '004EE15E: mov [ebp-6Ch], ecx
  '004EE161: mov ecx, [ecx]
  '004EE163: mov [edx+08h], eax
  '004EE166: mov eax, [ebp-58h]
  '004EE169: mov [edx+0Ch], eax
  '004EE16C: mov eax, [ebp-54h]
  '004EE16F: mov edx, esp
  '004EE171: push 00427E70h
  '004EE176: mov [edx], eax
  '004EE178: mov eax, [ebp-50h]
  '004EE17B: mov [edx+04h], eax
  '004EE17E: mov eax, [ebp-4Ch]
  '004EE181: mov [edx+08h], eax
  '004EE184: mov eax, [ebp-48h]
  '004EE187: mov [edx+0Ch], eax
  '004EE18A: mov edx, [ebp-6Ch]
  '004EE18D: push edx
  '004EE18E: call [ecx+20h]
  '004EE191: test eax, eax
  '004EE193: fclex 
  '004EE195: jnl 4EE1A9h
  '004EE197: mov ecx, [ebp-6Ch]
  '004EE19A: push 00000020h
  '004EE19C: push 00427C64h
  '004EE1A1: push ecx
  '004EE1A2: push eax
  '004EE1A3: call [004010A0h]
  '004EE1A9: mov dx, [esi+00000120h]
  '004EE1B0: sub esp, 00000010h
  '004EE1B3: mov [ebp-4Ch], dx
  '004EE1B7: mov edx, esp
  '004EE1B9: mov eax, 00000002h
  '004EE1BE: sub esp, 00000010h
  '004EE1C1: mov [edx], eax
  '004EE1C3: mov eax, 00000001h
  '004EE1C8: mov [ebp-54h], 0000000Bh
  '004EE1CF: mov ecx, [edi]
  '004EE1D1: mov [edx+04h], ebx
  '004EE1D4: mov [ebp-6Ch], ecx
  '004EE1D7: mov ecx, [ecx]
  '004EE1D9: mov [edx+08h], eax
  '004EE1DC: mov eax, [ebp-58h]
  '004EE1DF: mov [edx+0Ch], eax
  '004EE1E2: mov eax, [ebp-54h]
  '004EE1E5: mov edx, esp
  '004EE1E7: push 00427E90h
  '004EE1EC: mov [edx], eax
  '004EE1EE: mov eax, [ebp-50h]
  '004EE1F1: mov [edx+04h], eax
  '004EE1F4: mov eax, [ebp-4Ch]
  '004EE1F7: mov [edx+08h], eax
  '004EE1FA: mov eax, [ebp-48h]
  '004EE1FD: mov [edx+0Ch], eax
  '004EE200: mov edx, [ebp-6Ch]
  '004EE203: push edx
  '004EE204: call [ecx+20h]
  '004EE207: test eax, eax
  '004EE209: fclex 
  '004EE20B: jnl 4EE21Fh
  '004EE20D: mov ecx, [ebp-6Ch]
  '004EE210: push 00000020h
  '004EE212: push 00427C64h
  '004EE217: push ecx
  '004EE218: push eax
  '004EE219: call [004010A0h]
  '004EE21F: lea ecx, [ebp-54h]
  '004EE222: call [00401030h]
  '004EE228: mov edx, [esi+0000011Ch]
  '004EE22E: sub esp, 00000010h
  '004EE231: mov [ebp-4Ch], edx
  '004EE234: mov edx, esp
  '004EE236: mov eax, 00000003h
  '004EE23B: sub esp, 00000010h
  '004EE23E: mov [edx], eax
  '004EE240: mov [ebp-54h], eax
  '004EE243: mov eax, 8000000Fh
  '004EE248: mov ecx, [edi]
  '004EE24A: mov [edx+04h], ebx
  '004EE24D: mov [ebp-6Ch], ecx
  '004EE250: mov ecx, [ecx]
  '004EE252: mov [edx+08h], eax
  '004EE255: mov eax, [ebp-58h]
  '004EE258: mov [edx+0Ch], eax
  '004EE25B: mov eax, [ebp-54h]
  '004EE25E: mov edx, esp
  '004EE260: push 00427C50h
  '004EE265: mov [edx], eax
  '004EE267: mov eax, [ebp-50h]
  '004EE26A: mov [edx+04h], eax
  '004EE26D: mov eax, [ebp-4Ch]
  '004EE270: mov [edx+08h], eax
  '004EE273: mov eax, [ebp-48h]
  '004EE276: mov [edx+0Ch], eax
  '004EE279: mov edx, [ebp-6Ch]
  '004EE27C: push edx
  '004EE27D: call [ecx+20h]
  '004EE280: test eax, eax
  '004EE282: fclex 
  '004EE284: jnl 4EE298h
  '004EE286: mov ecx, [ebp-6Ch]
  '004EE289: push 00000020h
  '004EE28B: push 00427C64h
  '004EE290: push ecx
  '004EE291: push eax
  '004EE292: call [004010A0h]
  '004EE298: mov edx, [esi+00000118h]
  '004EE29E: sub esp, 00000010h
  '004EE2A1: mov [ebp-4Ch], edx
  '004EE2A4: mov edx, esp
  '004EE2A6: mov eax, 00000003h
  '004EE2AB: sub esp, 00000010h
  '004EE2AE: mov [edx], eax
  '004EE2B0: mov [ebp-54h], eax
  '004EE2B3: mov eax, 80000012h
  '004EE2B8: mov ecx, [edi]
  '004EE2BA: mov [edx+04h], ebx
  '004EE2BD: mov [ebp-6Ch], ecx
  '004EE2C0: mov ecx, [ecx]
  '004EE2C2: mov [edx+08h], eax
  '004EE2C5: mov eax, [ebp-58h]
  '004EE2C8: mov [edx+0Ch], eax
  '004EE2CB: mov eax, [ebp-54h]
  '004EE2CE: mov edx, esp
  '004EE2D0: push 00427C78h
  '004EE2D5: mov [edx], eax
  '004EE2D7: mov eax, [ebp-50h]
  '004EE2DA: mov [edx+04h], eax
  '004EE2DD: mov eax, [ebp-4Ch]
  '004EE2E0: mov [edx+08h], eax
  '004EE2E3: mov eax, [ebp-48h]
  '004EE2E6: mov [edx+0Ch], eax
  '004EE2E9: mov edx, [ebp-6Ch]
  '004EE2EC: push edx
  '004EE2ED: call [ecx+20h]
  '004EE2F0: test eax, eax
  '004EE2F2: fclex 
  '004EE2F4: jnl 4EE308h
  '004EE2F6: mov ecx, [ebp-6Ch]
  '004EE2F9: push 00000020h
  '004EE2FB: push 00427C64h
  '004EE300: push ecx
  '004EE301: push eax
  '004EE302: call [004010A0h]
  '004EE308: mov edx, [esi+00000110h]
  '004EE30E: sub esp, 00000010h
  '004EE311: mov [ebp-4Ch], edx
  '004EE314: mov edx, esp
  '004EE316: mov eax, 00000008h
  '004EE31B: sub esp, 00000010h
  '004EE31E: mov [edx], eax
  '004EE320: mov [ebp-54h], eax
  '004EE323: mov eax, 00427BF0h
  '004EE328: mov ecx, [edi]
  '004EE32A: mov [edx+04h], ebx
  '004EE32D: mov [ebp-6Ch], ecx
  '004EE330: mov ecx, [ecx]
  '004EE332: mov [edx+08h], eax
  '004EE335: mov eax, [ebp-58h]
  '004EE338: mov [edx+0Ch], eax
  '004EE33B: mov eax, [ebp-54h]
  '004EE33E: mov edx, esp
  '004EE340: push 00427EB4h
  '004EE345: mov [edx], eax
  '004EE347: mov eax, [ebp-50h]
  '004EE34A: mov [edx+04h], eax
  '004EE34D: mov eax, [ebp-4Ch]
  '004EE350: mov [edx+08h], eax
  '004EE353: mov eax, [ebp-48h]
  '004EE356: mov [edx+0Ch], eax
  '004EE359: mov edx, [ebp-6Ch]
  '004EE35C: push edx
  '004EE35D: call [ecx+20h]
  '004EE360: test eax, eax
  '004EE362: fclex 
  '004EE364: jnl 4EE378h
  '004EE366: mov ecx, [ebp-6Ch]
  '004EE369: push 00000020h
  '004EE36B: push 00427C64h
  '004EE370: push ecx
  '004EE371: push eax
  '004EE372: call [004010A0h]
  '004EE378: mov edx, [esi+00000114h]
  '004EE37E: sub esp, 00000010h
  '004EE381: mov [ebp-4Ch], edx
  '004EE384: mov edx, esp
  '004EE386: mov eax, 00000008h
  '004EE38B: sub esp, 00000010h
  '004EE38E: mov [edx], eax
  '004EE390: mov [ebp-54h], eax
  '004EE393: mov eax, 00427C20h
  '004EE398: mov ecx, [edi]
  '004EE39A: mov [edx+04h], ebx
  '004EE39D: mov [ebp-6Ch], ecx
  '004EE3A0: mov ecx, [ecx]
  '004EE3A2: mov [edx+08h], eax
  '004EE3A5: mov eax, [ebp-58h]
  '004EE3A8: mov [edx+0Ch], eax
  '004EE3AB: mov eax, [ebp-54h]
  '004EE3AE: mov edx, esp
  '004EE3B0: push 00427ECCh
  '004EE3B5: mov [edx], eax
  '004EE3B7: mov eax, [ebp-50h]
  '004EE3BA: mov [edx+04h], eax
  '004EE3BD: mov eax, [ebp-4Ch]
  '004EE3C0: mov [edx+08h], eax
  '004EE3C3: mov eax, [ebp-48h]
  '004EE3C6: mov [edx+0Ch], eax
  '004EE3C9: mov edx, [ebp-6Ch]
  '004EE3CC: push edx
  '004EE3CD: call [ecx+20h]
  '004EE3D0: test eax, eax
  '004EE3D2: fclex 
  '004EE3D4: jnl 4EE3E8h
  '004EE3D6: mov ecx, [ebp-6Ch]
  '004EE3D9: push 00000020h
  '004EE3DB: push 00427C64h
  '004EE3E0: push ecx
  '004EE3E1: push eax
  '004EE3E2: call [004010A0h]
  '004EE3E8: mov dx, [esi+0000010Eh]
  '004EE3EF: sub esp, 00000010h
  '004EE3F2: mov [ebp-4Ch], dx
  '004EE3F6: mov edx, esp
  '004EE3F8: mov eax, 00000002h
  '004EE3FD: sub esp, 00000010h
  '004EE400: mov [edx], eax
  '004EE402: mov eax, 00000001h
  '004EE407: mov [ebp-54h], 0000000Bh
  '004EE40E: mov ecx, [edi]
  '004EE410: mov [edx+04h], ebx
  '004EE413: mov [ebp-6Ch], ecx
  '004EE416: mov ecx, [ecx]
  '004EE418: mov [edx+08h], eax
  '004EE41B: mov eax, [ebp-58h]
  '004EE41E: mov [edx+0Ch], eax
  '004EE421: mov eax, [ebp-54h]
  '004EE424: mov edx, esp
  '004EE426: push 00427EE8h
  '004EE42B: mov [edx], eax
  '004EE42D: mov eax, [ebp-50h]
  '004EE430: mov [edx+04h], eax
  '004EE433: mov eax, [ebp-4Ch]
  '004EE436: mov [edx+08h], eax
  '004EE439: mov eax, [ebp-48h]
  '004EE43C: mov [edx+0Ch], eax
  '004EE43F: mov edx, [ebp-6Ch]
  '004EE442: push edx
  '004EE443: call [ecx+20h]
  '004EE446: test eax, eax
  '004EE448: fclex 
  '004EE44A: jnl 4EE45Eh
  '004EE44C: mov ecx, [ebp-6Ch]
  '004EE44F: push 00000020h
  '004EE451: push 00427C64h
  '004EE456: push ecx
  '004EE457: push eax
  '004EE458: call [004010A0h]
  '004EE45E: lea ecx, [ebp-54h]
  '004EE461: call [00401030h]
  '004EE467: mov dx, [esi+0000010Ch]
  '004EE46E: sub esp, 00000010h
  '004EE471: mov [ebp-4Ch], dx
  '004EE475: mov edx, esp
  '004EE477: mov eax, 00000002h
  '004EE47C: sub esp, 00000010h
  '004EE47F: mov [edx], eax
  '004EE481: xor eax, eax
  '004EE483: mov [ebp-54h], 0000000Bh
  '004EE48A: mov ecx, [edi]
  '004EE48C: mov [edx+04h], ebx
  '004EE48F: mov [ebp-6Ch], ecx
  '004EE492: mov ecx, [ecx]
  '004EE494: mov [edx+08h], eax
  '004EE497: mov eax, [ebp-58h]
  '004EE49A: mov [edx+0Ch], eax
  '004EE49D: mov eax, [ebp-54h]
  '004EE4A0: mov edx, esp
  '004EE4A2: push 00427F04h
  '004EE4A7: mov [edx], eax
  '004EE4A9: mov eax, [ebp-50h]
  '004EE4AC: mov [edx+04h], eax
  '004EE4AF: mov eax, [ebp-4Ch]
  '004EE4B2: mov [edx+08h], eax
  '004EE4B5: mov eax, [ebp-48h]
  '004EE4B8: mov [edx+0Ch], eax
  '004EE4BB: mov edx, [ebp-6Ch]
  '004EE4BE: push edx
  '004EE4BF: call [ecx+20h]
  '004EE4C2: test eax, eax
  '004EE4C4: fclex 
  '004EE4C6: jnl 4EE4DAh
  '004EE4C8: mov ecx, [ebp-6Ch]
  '004EE4CB: push 00000020h
  '004EE4CD: push 00427C64h
  '004EE4D2: push ecx
  '004EE4D3: push eax
  '004EE4D4: call [004010A0h]
  '004EE4DA: lea ecx, [ebp-54h]
  '004EE4DD: call [00401030h]
  '004EE4E3: mov edx, [esi+00000108h]
  '004EE4E9: sub esp, 00000010h
  '004EE4EC: mov [ebp-4Ch], edx
  '004EE4EF: mov edx, esp
  '004EE4F1: mov eax, 00000002h
  '004EE4F6: sub esp, 00000010h
  '004EE4F9: mov [edx], eax
  '004EE4FB: xor eax, eax
  '004EE4FD: mov [ebp-54h], 00000003h
  '004EE504: mov ecx, [edi]
  '004EE506: mov [edx+04h], ebx
  '004EE509: mov [ebp-6Ch], ecx
  '004EE50C: mov ecx, [ecx]
  '004EE50E: mov [edx+08h], eax
  '004EE511: mov eax, [ebp-58h]
  '004EE514: mov [edx+0Ch], eax
  '004EE517: mov eax, [ebp-54h]
  '004EE51A: mov edx, esp
  '004EE51C: push 00426F4Ch
  '004EE521: mov [edx], eax
  '004EE523: mov eax, [ebp-50h]
  '004EE526: mov [edx+04h], eax
  '004EE529: mov eax, [ebp-4Ch]
  '004EE52C: mov [edx+08h], eax
  '004EE52F: mov eax, [ebp-48h]
  '004EE532: mov [edx+0Ch], eax
  '004EE535: mov edx, [ebp-6Ch]
  '004EE538: push edx
  '004EE539: call [ecx+20h]
  '004EE53C: test eax, eax
  '004EE53E: fclex 
  '004EE540: jnl 4EE554h
  '004EE542: mov ecx, [ebp-6Ch]
  '004EE545: push 00000020h
  '004EE547: push 00427C64h
  '004EE54C: push ecx
  '004EE54D: push eax
  '004EE54E: call [004010A0h]
  '004EE554: mov dx, [esi+00000106h]
  '004EE55B: sub esp, 00000010h
  '004EE55E: mov [ebp-4Ch], dx
  '004EE562: mov edx, esp
  '004EE564: mov eax, 00000002h
  '004EE569: sub esp, 00000010h
  '004EE56C: mov [edx], eax
  '004EE56E: xor eax, eax
  '004EE570: mov [ebp-54h], 0000000Bh
  '004EE577: mov ecx, [edi]
  '004EE579: mov [edx+04h], ebx
  '004EE57C: mov [ebp-6Ch], ecx
  '004EE57F: mov ecx, [ecx]
  '004EE581: mov [edx+08h], eax
  '004EE584: mov eax, [ebp-58h]
  '004EE587: mov [edx+0Ch], eax
  '004EE58A: mov eax, [ebp-54h]
  '004EE58D: mov edx, esp
  '004EE58F: push 00427F30h
  '004EE594: mov [edx], eax
  '004EE596: mov eax, [ebp-50h]
  '004EE599: mov [edx+04h], eax
  '004EE59C: mov eax, [ebp-4Ch]
  '004EE59F: mov [edx+08h], eax
  '004EE5A2: mov eax, [ebp-48h]
  '004EE5A5: mov [edx+0Ch], eax
  '004EE5A8: mov edx, [ebp-6Ch]
  '004EE5AB: push edx
  '004EE5AC: call [ecx+20h]
  '004EE5AF: test eax, eax
  '004EE5B1: fclex 
  '004EE5B3: jnl 4EE5C7h
  '004EE5B5: mov ecx, [ebp-6Ch]
  '004EE5B8: push 00000020h
  '004EE5BA: push 00427C64h
  '004EE5BF: push ecx
  '004EE5C0: push eax
  '004EE5C1: call [004010A0h]
  '004EE5C7: lea ecx, [ebp-54h]
  '004EE5CA: call [00401030h]
  '004EE5D0: mov dx, [esi+00000102h]
  '004EE5D7: sub esp, 00000010h
  '004EE5DA: mov [ebp-4Ch], dx
  '004EE5DE: mov edx, esp
  '004EE5E0: mov eax, 00000002h
  '004EE5E5: mov [ebp-5Ch], 00000001h
  '004EE5EC: mov [edx], eax
  '004EE5EE: mov [ebp-54h], eax
  '004EE5F1: mov eax, [ebp-5Ch]
  '004EE5F4: sub esp, 00000010h
  '004EE5F7: mov [edx+04h], ebx
  '004EE5FA: mov ecx, [edi]
  '004EE5FC: mov [ebp-6Ch], ecx
  '004EE5FF: mov [edx+08h], eax
  '004EE602: mov eax, [ebp-58h]
  '004EE605: mov ecx, [ecx]
  '004EE607: mov [edx+0Ch], eax
  '004EE60A: mov eax, [ebp-54h]
  '004EE60D: mov edx, esp
  '004EE60F: push 00427F50h
  '004EE614: mov [edx], eax
  '004EE616: mov eax, [ebp-50h]
  '004EE619: mov [edx+04h], eax
  '004EE61C: mov eax, [ebp-4Ch]
  '004EE61F: mov [edx+08h], eax
  '004EE622: mov eax, [ebp-48h]
  '004EE625: mov [edx+0Ch], eax
  '004EE628: mov edx, [ebp-6Ch]
  '004EE62B: push edx
  '004EE62C: call [ecx+20h]
  '004EE62F: test eax, eax
  '004EE631: fclex 
  '004EE633: jnl 4EE647h
  '004EE635: mov ecx, [ebp-6Ch]
  '004EE638: push 00000020h
  '004EE63A: push 00427C64h
  '004EE63F: push ecx
  '004EE640: push eax
  '004EE641: call [004010A0h]
  '004EE647: mov dx, [esi+00000104h]
  '004EE64E: sub esp, 00000010h
  '004EE651: mov esi, esp
  '004EE653: mov ecx, 00000002h
  '004EE658: mov eax, 00000008h
  '004EE65D: sub esp, 00000010h
  '004EE660: mov [esi], ecx
  '004EE662: mov edi, [edi]
  '004EE664: mov [ebp-54h], ecx
  '004EE667: mov ecx, esp
  '004EE669: mov [esi+04h], ebx
  '004EE66C: mov [ebp-4Ch], dx
  '004EE670: mov edx, [edi]
  '004EE672: push 00427F60h
  '004EE677: mov [esi+08h], eax
  '004EE67A: mov eax, [ebp-58h]
  '004EE67D: push edi
  '004EE67E: mov [esi+0Ch], eax
  '004EE681: mov eax, [ebp-54h]
  '004EE684: mov [ecx], eax
  '004EE686: mov eax, [ebp-50h]
  '004EE689: mov [ecx+04h], eax
  '004EE68C: mov eax, [ebp-4Ch]
  '004EE68F: mov [ecx+08h], eax
  '004EE692: mov eax, [ebp-48h]
  '004EE695: mov [ecx+0Ch], eax
  '004EE698: call [edx+20h]
  '004EE69B: test eax, eax
  '004EE69D: fclex 
  '004EE69F: jnl 4EE6B0h
  '004EE6A1: push 00000020h
  '004EE6A3: push 00427C64h
  '004EE6A8: push edi
  '004EE6A9: push eax
  '004EE6AA: call [004010A0h]
  '004EE6B0: mov [ebp-04h], 00000000h
  '004EE6B7: push 004EE6F0h
  '004EE6BC: jmp 4EE6EFh
  '004EE6BE: lea ecx, [ebp-18h]
  '004EE6C1: call [004013B4h]
  '004EE6C7: lea ecx, [ebp-24h]
  '004EE6CA: lea edx, [ebp-20h]
  '004EE6CD: push ecx
  '004EE6CE: lea eax, [ebp-1Ch]
  '004EE6D1: push edx
  '004EE6D2: push eax
  '004EE6D3: push 00000003h
  '004EE6D5: call [00401064h]
  '004EE6DB: lea ecx, [ebp-44h]
  '004EE6DE: lea edx, [ebp-34h]
  '004EE6E1: push ecx
  '004EE6E2: push edx
  '004EE6E3: push 00000002h
  '004EE6E5: call [00401050h]
  '004EE6EB: add esp, 0000001Ch
  '004EE6EE: ret 
End Sub
Private Sub UserControl__4EC5E0
  '004EC5E0: push ebp
  '004EC5E1: mov ebp, esp
  '004EC5E3: sub esp, 0000000Ch
  '004EC5E6: push 004081B6h
  '004EC5EB: mov eax, fs:[00h]
  '004EC5F1: push eax
  '004EC5F2: mov fs:[00000000h], esp
  '004EC5F9: sub esp, 00000074h
  '004EC5FC: push ebx
  '004EC5FD: push esi
  '004EC5FE: push edi
  '004EC5FF: mov [ebp-0Ch], esp
  '004EC602: mov [ebp-08h], 004055C8h
  '004EC609: mov esi, [ebp+08h]
  '004EC60C: mov eax, esi
  '004EC60E: and eax, 00000001h
  '004EC611: mov [ebp-04h], eax
  '004EC614: and esi, FFFFFFFEh
  '004EC617: push esi
  '004EC618: mov [ebp+08h], esi
  '004EC61B: mov ecx, [esi]
  '004EC61D: call [ecx+04h]
  '004EC620: mov edi, [ebp+0Ch]
  '004EC623: xor eax, eax
  '004EC625: lea ebx, [ebp-38h]
  '004EC628: mov [ebp-18h], eax
  '004EC62B: mov edx, [edi]
  '004EC62D: mov [ebp-1Ch], eax
  '004EC630: mov [ebp-20h], eax
  '004EC633: mov [ebp-24h], eax
  '004EC636: mov [ebp-28h], eax
  '004EC639: mov [ebp-38h], eax
  '004EC63C: mov [ebp-48h], eax
  '004EC63F: mov [ebp-5Ch], edx
  '004EC642: mov edx, [edx]
  '004EC644: push ebx
  '004EC645: mov ebx, [ebp-54h]
  '004EC648: sub esp, 00000010h
  '004EC64B: mov [ebp-00000088h], edx
  '004EC651: mov edx, esp
  '004EC653: mov ecx, 00000003h
  '004EC658: mov eax, 8000000Fh
  '004EC65D: mov [edx], ecx
  '004EC65F: mov ecx, [ebp-5Ch]
  '004EC662: push 00427C50h
  '004EC667: push ecx
  '004EC668: mov [edx+04h], ebx
  '004EC66B: mov [edx+08h], eax
  '004EC66E: mov eax, [ebp-4Ch]
  '004EC671: mov [edx+0Ch], eax
  '004EC674: mov edx, [ebp-00000088h]
  '004EC67A: call [edx+1Ch]
  '004EC67D: test eax, eax
  '004EC67F: fclex 
  '004EC681: jnl 4EC695h
  '004EC683: mov ecx, [ebp-5Ch]
  '004EC686: push 0000001Ch
  '004EC688: push 00427C64h
  '004EC68D: push ecx
  '004EC68E: push eax
  '004EC68F: call [004010A0h]
  '004EC695: lea edx, [ebp-38h]
  '004EC698: push edx
  '004EC699: call [0040130Ch]
  '004EC69F: lea ecx, [ebp-38h]
  '004EC6A2: mov [esi+0000011Ch], eax
  '004EC6A8: call [00401030h]
  '004EC6AE: mov eax, [esi+10h]
  '004EC6B1: mov edx, [esi+0000011Ch]
  '004EC6B7: push edx
  '004EC6B8: push eax
  '004EC6B9: mov ecx, [eax]
  '004EC6BB: call [ecx+64h]
  '004EC6BE: test eax, eax
  '004EC6C0: fclex 
  '004EC6C2: jnl 4EC6D6h
  '004EC6C4: mov ecx, [esi+10h]
  '004EC6C7: push 00000064h
  '004EC6C9: push 0042725Ch
  '004EC6CE: push ecx
  '004EC6CF: push eax
  '004EC6D0: call [004010A0h]
  '004EC6D6: mov ecx, [edi]
  '004EC6D8: mov eax, 00000003h
  '004EC6DD: mov [ebp-5Ch], ecx
  '004EC6E0: mov edx, [ecx]
  '004EC6E2: lea ecx, [ebp-38h]
  '004EC6E5: push ecx
  '004EC6E6: sub esp, 00000010h
  '004EC6E9: mov ecx, esp
  '004EC6EB: push 00427C78h
  '004EC6F0: mov [ecx], eax
  '004EC6F2: mov eax, 80000012h
  '004EC6F7: mov [ecx+04h], ebx
  '004EC6FA: mov [ecx+08h], eax
  '004EC6FD: mov eax, [ebp-4Ch]
  '004EC700: mov [ecx+0Ch], eax
  '004EC703: mov ecx, [ebp-5Ch]
  '004EC706: push ecx
  '004EC707: call [edx+1Ch]
  '004EC70A: test eax, eax
  '004EC70C: fclex 
  '004EC70E: jnl 4EC722h
  '004EC710: mov edx, [ebp-5Ch]
  '004EC713: push 0000001Ch
  '004EC715: push 00427C64h
  '004EC71A: push edx
  '004EC71B: push eax
  '004EC71C: call [004010A0h]
  '004EC722: lea eax, [ebp-38h]
  '004EC725: push eax
  '004EC726: call [0040130Ch]
  '004EC72C: lea ecx, [ebp-38h]
  '004EC72F: mov [esi+00000118h], eax
  '004EC735: call [00401030h]
  '004EC73B: mov eax, [esi+10h]
  '004EC73E: mov edx, [esi+00000118h]
  '004EC744: push edx
  '004EC745: push eax
  '004EC746: mov ecx, [eax]
  '004EC748: call [ecx+6Ch]
  '004EC74B: test eax, eax
  '004EC74D: fclex 
  '004EC74F: jnl 4EC763h
  '004EC751: mov ecx, [esi+10h]
  '004EC754: push 0000006Ch
  '004EC756: push 0042725Ch
  '004EC75B: push ecx
  '004EC75C: push eax
  '004EC75D: call [004010A0h]
  '004EC763: mov ecx, [edi]
  '004EC765: mov eax, 00000002h
  '004EC76A: mov [ebp-5Ch], ecx
  '004EC76D: mov edx, [ecx]
  '004EC76F: lea ecx, [ebp-38h]
  '004EC772: push ecx
  '004EC773: sub esp, 00000010h
  '004EC776: mov ecx, esp
  '004EC778: push 00427C90h
  '004EC77D: mov [ecx], eax
  '004EC77F: mov eax, 00000001h
  '004EC784: mov [ecx+04h], ebx
  '004EC787: mov [ecx+08h], eax
  '004EC78A: mov eax, [ebp-4Ch]
  '004EC78D: mov [ecx+0Ch], eax
  '004EC790: mov ecx, [ebp-5Ch]
  '004EC793: push ecx
  '004EC794: call [edx+1Ch]
  '004EC797: test eax, eax
  '004EC799: fclex 
  '004EC79B: jnl 4EC7AFh
  '004EC79D: mov edx, [ebp-5Ch]
  '004EC7A0: push 0000001Ch
  '004EC7A2: push 00427C64h
  '004EC7A7: push edx
  '004EC7A8: push eax
  '004EC7A9: call [004010A0h]
  '004EC7AF: lea eax, [ebp-38h]
  '004EC7B2: push eax
  '004EC7B3: call [00401114h]
  '004EC7B9: lea ecx, [ebp-38h]
  '004EC7BC: mov [esi+00000100h], ax
  '004EC7C3: call [00401030h]
  '004EC7C9: mov ecx, [esi]
  '004EC7CB: lea edx, [ebp-20h]
  '004EC7CE: push edx
  '004EC7CF: push esi
  '004EC7D0: call [ecx+000002B0h]
  '004EC7D6: test eax, eax
  '004EC7D8: fclex 
  '004EC7DA: jnl 4EC7EEh
  '004EC7DC: push 000002B0h
  '004EC7E1: push 0042725Ch
  '004EC7E6: push esi
  '004EC7E7: push eax
  '004EC7E8: call [004010A0h]
  '004EC7EE: mov eax, [ebp-20h]
  '004EC7F1: lea edx, [ebp-18h]
  '004EC7F4: push edx
  '004EC7F5: push eax
  '004EC7F6: mov ecx, [eax]
  '004EC7F8: mov [ebp-60h], eax
  '004EC7FB: call [ecx+20h]
  '004EC7FE: test eax, eax
  '004EC800: fclex 
  '004EC802: jnl 4EC816h
  '004EC804: mov ecx, [ebp-60h]
  '004EC807: push 00000020h
  '004EC809: push 00427BDCh
  '004EC80E: push ecx
  '004EC80F: push eax
  '004EC810: call [004010A0h]
  '004EC816: mov eax, [ebp-18h]
  '004EC819: mov ecx, [edi]
  '004EC81B: mov [ebp-30h], eax
  '004EC81E: mov eax, 00000008h
  '004EC823: mov [ebp-18h], 00000000h
  '004EC82A: mov [ebp-38h], eax
  '004EC82D: mov edx, [ecx]
  '004EC82F: mov [ebp-68h], ecx
  '004EC832: lea ecx, [ebp-48h]
  '004EC835: push ecx
  '004EC836: sub esp, 00000010h
  '004EC839: mov ecx, esp
  '004EC83B: push 00427CB0h
  '004EC840: mov [ecx], eax
  '004EC842: mov eax, [ebp-34h]
  '004EC845: mov [ecx+04h], eax
  '004EC848: mov eax, [ebp-30h]
  '004EC84B: mov [ecx+08h], eax
  '004EC84E: mov eax, [ebp-2Ch]
  '004EC851: mov [ecx+0Ch], eax
  '004EC854: mov ecx, [ebp-68h]
  '004EC857: push ecx
  '004EC858: call [edx+1Ch]
  '004EC85B: test eax, eax
  '004EC85D: fclex 
  '004EC85F: jnl 4EC873h
  '004EC861: mov edx, [ebp-68h]
  '004EC864: push 0000001Ch
  '004EC866: push 00427C64h
  '004EC86B: push edx
  '004EC86C: push eax
  '004EC86D: call [004010A0h]
  '004EC873: lea eax, [ebp-48h]
  '004EC876: push eax
  '004EC877: call [0040103Ch]
  '004EC87D: mov edx, eax
  '004EC87F: lea ecx, [ebp-1Ch]
  '004EC882: call [00401378h]
  '004EC888: mov edx, eax
  '004EC88A: lea ecx, [esi+000000B8h]
  '004EC890: call [004012D8h]
  '004EC896: lea ecx, [ebp-1Ch]
  '004EC899: call [004013B4h]
  '004EC89F: lea ecx, [ebp-20h]
  '004EC8A2: call [004013B8h]
  '004EC8A8: lea ecx, [ebp-48h]
  '004EC8AB: lea edx, [ebp-38h]
  '004EC8AE: push ecx
  '004EC8AF: push edx
  '004EC8B0: push 00000002h
  '004EC8B2: call [00401050h]
  '004EC8B8: add esp, 0000000Ch
  '004EC8BB: lea edx, [ebp-38h]
  '004EC8BE: mov eax, 00000002h
  '004EC8C3: mov ecx, [edi]
  '004EC8C5: push edx
  '004EC8C6: mov [ebp-5Ch], ecx
  '004EC8C9: sub esp, 00000010h
  '004EC8CC: mov ecx, [ecx]
  '004EC8CE: mov edx, esp
  '004EC8D0: push 00427CC4h
  '004EC8D5: mov [edx], eax
  '004EC8D7: mov eax, 00000001h
  '004EC8DC: mov [edx+04h], ebx
  '004EC8DF: mov [edx+08h], eax
  '004EC8E2: mov eax, [ebp-4Ch]
  '004EC8E5: mov [edx+0Ch], eax
  '004EC8E8: mov edx, [ebp-5Ch]
  '004EC8EB: push edx
  '004EC8EC: call [ecx+1Ch]
  '004EC8EF: test eax, eax
  '004EC8F1: fclex 
  '004EC8F3: jnl 4EC907h
  '004EC8F5: mov ecx, [ebp-5Ch]
  '004EC8F8: push 0000001Ch
  '004EC8FA: push 00427C64h
  '004EC8FF: push ecx
  '004EC900: push eax
  '004EC901: call [004010A0h]
  '004EC907: lea edx, [ebp-38h]
  '004EC90A: push edx
  '004EC90B: call [0040130Ch]
  '004EC911: lea ecx, [ebp-38h]
  '004EC914: mov [esi+000000BCh], eax
  '004EC91A: call [00401030h]
  '004EC920: lea edx, [ebp-38h]
  '004EC923: mov eax, 00000002h
  '004EC928: push edx
  '004EC929: mov ecx, [edi]
  '004EC92B: sub esp, 00000010h
  '004EC92E: mov [ebp-5Ch], ecx
  '004EC931: mov edx, esp
  '004EC933: mov ecx, [ecx]
  '004EC935: push 00427CE8h
  '004EC93A: mov [edx], eax
  '004EC93C: mov [edx+04h], ebx
  '004EC93F: mov [edx+08h], eax
  '004EC942: mov eax, [ebp-4Ch]
  '004EC945: mov [edx+0Ch], eax
  '004EC948: mov edx, [ebp-5Ch]
  '004EC94B: push edx
  '004EC94C: call [ecx+1Ch]
  '004EC94F: test eax, eax
  '004EC951: fclex 
  '004EC953: jnl 4EC967h
  '004EC955: mov ecx, [ebp-5Ch]
  '004EC958: push 0000001Ch
  '004EC95A: push 00427C64h
  '004EC95F: push ecx
  '004EC960: push eax
  '004EC961: call [004010A0h]
  '004EC967: lea edx, [ebp-38h]
  '004EC96A: push edx
  '004EC96B: call [0040130Ch]
  '004EC971: lea ecx, [ebp-38h]
  '004EC974: mov [esi+000000C0h], eax
  '004EC97A: call [00401030h]
  '004EC980: lea edx, [ebp-48h]
  '004EC983: mov eax, 00000009h
  '004EC988: push edx
  '004EC989: mov ecx, [edi]
  '004EC98B: sub esp, 00000010h
  '004EC98E: mov [ebp-38h], eax
  '004EC991: mov edx, esp
  '004EC993: mov [ebp-30h], 00000000h
  '004EC99A: mov [ebp-5Ch], ecx
  '004EC99D: mov ecx, [ecx]
  '004EC99F: mov [edx], eax
  '004EC9A1: mov eax, [ebp-34h]
  '004EC9A4: push 00427D04h
  '004EC9A9: mov [edx+04h], eax
  '004EC9AC: mov eax, [ebp-30h]
  '004EC9AF: mov [edx+08h], eax
  '004EC9B2: mov eax, [ebp-2Ch]
  '004EC9B5: mov [edx+0Ch], eax
  '004EC9B8: mov edx, [ebp-5Ch]
  '004EC9BB: push edx
  '004EC9BC: call [ecx+1Ch]
  '004EC9BF: test eax, eax
  '004EC9C1: fclex 
  '004EC9C3: jnl 4EC9D7h
  '004EC9C5: mov ecx, [ebp-5Ch]
  '004EC9C8: push 0000001Ch
  '004EC9CA: push 00427C64h
  '004EC9CF: push ecx
  '004EC9D0: push eax
  '004EC9D1: call [004010A0h]
  '004EC9D7: lea edx, [ebp-48h]
  '004EC9DA: push 004210C8h
  '004EC9DF: push edx
  '004EC9E0: call [004011C8h]
  '004EC9E6: push eax
  '004EC9E7: lea eax, [ebp-20h]
  '004EC9EA: push eax
  '004EC9EB: call [004010E4h]
  '004EC9F1: lea ecx, [esi+000000C4h]
  '004EC9F7: push eax
  '004EC9F8: push ecx
  '004EC9F9: call [004010F8h]
  '004EC9FF: lea ecx, [ebp-20h]
  '004ECA02: call [004013B8h]
  '004ECA08: lea edx, [ebp-48h]
  '004ECA0B: lea eax, [ebp-38h]
  '004ECA0E: push edx
  '004ECA0F: push eax
  '004ECA10: push 00000002h
  '004ECA12: call [00401050h]
  '004ECA18: add esp, 0000000Ch
  '004ECA1B: lea edx, [ebp-38h]
  '004ECA1E: mov eax, 00000002h
  '004ECA23: mov ecx, [edi]
  '004ECA25: push edx
  '004ECA26: mov [ebp-5Ch], ecx
  '004ECA29: sub esp, 00000010h
  '004ECA2C: mov ecx, [ecx]
  '004ECA2E: mov edx, esp
  '004ECA30: push 00427D18h
  '004ECA35: mov [edx], eax
  '004ECA37: mov eax, 00000020h
  '004ECA3C: mov [edx+04h], ebx
  '004ECA3F: mov [edx+08h], eax
  '004ECA42: mov eax, [ebp-4Ch]
  '004ECA45: mov [edx+0Ch], eax
  '004ECA48: mov edx, [ebp-5Ch]
  '004ECA4B: push edx
  '004ECA4C: call [ecx+1Ch]
  '004ECA4F: test eax, eax
  '004ECA51: fclex 
  '004ECA53: jnl 4ECA67h
  '004ECA55: mov ecx, [ebp-5Ch]
  '004ECA58: push 0000001Ch
  '004ECA5A: push 00427C64h
  '004ECA5F: push ecx
  '004ECA60: push eax
  '004ECA61: call [004010A0h]
  '004ECA67: lea edx, [ebp-38h]
  '004ECA6A: push edx
  '004ECA6B: call [0040130Ch]
  '004ECA71: lea ecx, [ebp-38h]
  '004ECA74: mov [esi+000000C8h], eax
  '004ECA7A: call [00401030h]
  '004ECA80: lea edx, [ebp-38h]
  '004ECA83: mov eax, 00000002h
  '004ECA88: push edx
  '004ECA89: mov ecx, [edi]
  '004ECA8B: sub esp, 00000010h
  '004ECA8E: mov [ebp-5Ch], ecx
  '004ECA91: mov edx, esp
  '004ECA93: mov ecx, [ecx]
  '004ECA95: push 00427D38h
  '004ECA9A: mov [edx], eax
  '004ECA9C: mov eax, 00000020h
  '004ECAA1: mov [edx+04h], ebx
  '004ECAA4: mov [edx+08h], eax
  '004ECAA7: mov eax, [ebp-4Ch]
  '004ECAAA: mov [edx+0Ch], eax
  '004ECAAD: mov edx, [ebp-5Ch]
  '004ECAB0: push edx
  '004ECAB1: call [ecx+1Ch]
  '004ECAB4: test eax, eax
  '004ECAB6: fclex 
  '004ECAB8: jnl 4ECACCh
  '004ECABA: mov ecx, [ebp-5Ch]
  '004ECABD: push 0000001Ch
  '004ECABF: push 00427C64h
  '004ECAC4: push ecx
  '004ECAC5: push eax
  '004ECAC6: call [004010A0h]
  '004ECACC: lea edx, [ebp-38h]
  '004ECACF: push edx
  '004ECAD0: call [0040130Ch]
  '004ECAD6: lea ecx, [ebp-38h]
  '004ECAD9: mov [esi+000000CCh], eax
  '004ECADF: call [00401030h]
  '004ECAE5: lea edx, [ebp-38h]
  '004ECAE8: mov eax, 00000002h
  '004ECAED: push edx
  '004ECAEE: mov ecx, [edi]
  '004ECAF0: sub esp, 00000010h
  '004ECAF3: mov [ebp-50h], 00000001h
  '004ECAFA: mov edx, esp
  '004ECAFC: mov [ebp-5Ch], ecx
  '004ECAFF: mov ecx, [ecx]
  '004ECB01: push 00427D58h
  '004ECB06: mov [edx], eax
  '004ECB08: mov eax, [ebp-50h]
  '004ECB0B: mov [edx+04h], ebx
  '004ECB0E: mov [edx+08h], eax
  '004ECB11: mov eax, [ebp-4Ch]
  '004ECB14: mov [edx+0Ch], eax
  '004ECB17: mov edx, [ebp-5Ch]
  '004ECB1A: push edx
  '004ECB1B: call [ecx+1Ch]
  '004ECB1E: test eax, eax
  '004ECB20: fclex 
  '004ECB22: jnl 4ECB36h
  '004ECB24: mov ecx, [ebp-5Ch]
  '004ECB27: push 0000001Ch
  '004ECB29: push 00427C64h
  '004ECB2E: push ecx
  '004ECB2F: push eax
  '004ECB30: call [004010A0h]
  '004ECB36: lea edx, [ebp-38h]
  '004ECB39: push edx
  '004ECB3A: call [0040130Ch]
  '004ECB40: lea ecx, [ebp-38h]
  '004ECB43: mov [esi+000000D0h], eax
  '004ECB49: call [00401030h]
  '004ECB4F: lea edx, [ebp-38h]
  '004ECB52: mov eax, 00000002h
  '004ECB57: push edx
  '004ECB58: mov ecx, [edi]
  '004ECB5A: sub esp, 00000010h
  '004ECB5D: mov [ebp-5Ch], ecx
  '004ECB60: mov edx, esp
  '004ECB62: mov ecx, [ecx]
  '004ECB64: push 00427D74h
  '004ECB69: mov [edx], eax
  '004ECB6B: mov eax, 00000020h
  '004ECB70: mov [edx+04h], ebx
  '004ECB73: mov [edx+08h], eax
  '004ECB76: mov eax, [ebp-4Ch]
  '004ECB79: mov [edx+0Ch], eax
  '004ECB7C: mov edx, [ebp-5Ch]
  '004ECB7F: push edx
  '004ECB80: call [ecx+1Ch]
  '004ECB83: test eax, eax
  '004ECB85: fclex 
  '004ECB87: jnl 4ECB9Bh
  '004ECB89: mov ecx, [ebp-5Ch]
  '004ECB8C: push 0000001Ch
  '004ECB8E: push 00427C64h
  '004ECB93: push ecx
  '004ECB94: push eax
  '004ECB95: call [004010A0h]
  '004ECB9B: lea edx, [ebp-38h]
  '004ECB9E: push edx
  '004ECB9F: call [0040130Ch]
  '004ECBA5: lea ecx, [ebp-38h]
  '004ECBA8: mov [esi+000000A8h], eax
  '004ECBAE: call [00401030h]
  '004ECBB4: lea edx, [ebp-38h]
  '004ECBB7: mov eax, 00000002h
  '004ECBBC: push edx
  '004ECBBD: mov ecx, [edi]
  '004ECBBF: sub esp, 00000010h
  '004ECBC2: mov [ebp-50h], 00000020h
  '004ECBC9: mov edx, esp
  '004ECBCB: mov [ebp-5Ch], ecx
  '004ECBCE: mov ecx, [ecx]
  '004ECBD0: push 00427D9Ch
  '004ECBD5: mov [edx], eax
  '004ECBD7: mov eax, [ebp-50h]
  '004ECBDA: mov [edx+04h], ebx
  '004ECBDD: mov [edx+08h], eax
  '004ECBE0: mov eax, [ebp-4Ch]
  '004ECBE3: mov [edx+0Ch], eax
  '004ECBE6: mov edx, [ebp-5Ch]
  '004ECBE9: push edx
  '004ECBEA: call [ecx+1Ch]
  '004ECBED: test eax, eax
  '004ECBEF: fclex 
  '004ECBF1: jnl 4ECC05h
  '004ECBF3: mov ecx, [ebp-5Ch]
  '004ECBF6: push 0000001Ch
  '004ECBF8: push 00427C64h
  '004ECBFD: push ecx
  '004ECBFE: push eax
  '004ECBFF: call [004010A0h]
  '004ECC05: lea edx, [ebp-38h]
  '004ECC08: push edx
  '004ECC09: call [0040130Ch]
  '004ECC0F: lea ecx, [ebp-38h]
  '004ECC12: mov [esi+000000ACh], eax
  '004ECC18: call [00401030h]
  '004ECC1E: mov eax, [esi]
  '004ECC20: lea ecx, [ebp-20h]
  '004ECC23: push ecx
  '004ECC24: push esi
  '004ECC25: call [eax+000002B0h]
  '004ECC2B: test eax, eax
  '004ECC2D: fclex 
  '004ECC2F: jnl 4ECC43h
  '004ECC31: push 000002B0h
  '004ECC36: push 0042725Ch
  '004ECC3B: push esi
  '004ECC3C: push eax
  '004ECC3D: call [004010A0h]
  '004ECC43: mov eax, [ebp-20h]
  '004ECC46: lea ecx, [ebp-24h]
  '004ECC49: push ecx
  '004ECC4A: push eax
  '004ECC4B: mov edx, [eax]
  '004ECC4D: mov ebx, eax
  '004ECC4F: call [edx+24h]
  '004ECC52: test eax, eax
  '004ECC54: fclex 
  '004ECC56: jnl 4ECC67h
  '004ECC58: push 00000024h
  '004ECC5A: push 00427BDCh
  '004ECC5F: push ebx
  '004ECC60: push eax
  '004ECC61: call [004010A0h]
  '004ECC67: mov eax, [ebp-24h]
  '004ECC6A: lea ecx, [ebp-48h]
  '004ECC6D: push ecx
  '004ECC6E: mov ebx, [edi]
  '004ECC70: sub esp, 00000010h
  '004ECC73: mov [ebp-30h], eax
  '004ECC76: mov ecx, esp
  '004ECC78: mov eax, 00000009h
  '004ECC7D: mov [ebp-38h], eax
  '004ECC80: mov [ebp-24h], 00000000h
  '004ECC87: mov edx, [ebx]
  '004ECC89: mov [ecx], eax
  '004ECC8B: mov eax, [ebp-34h]
  '004ECC8E: push 00427DC4h
  '004ECC93: mov [ecx+04h], eax
  '004ECC96: mov eax, [ebp-30h]
  '004ECC99: push ebx
  '004ECC9A: mov [ecx+08h], eax
  '004ECC9D: mov eax, [ebp-2Ch]
  '004ECCA0: mov [ecx+0Ch], eax
  '004ECCA3: call [edx+1Ch]
  '004ECCA6: test eax, eax
  '004ECCA8: fclex 
  '004ECCAA: jnl 4ECCBBh
  '004ECCAC: push 0000001Ch
  '004ECCAE: push 00427C64h
  '004ECCB3: push ebx
  '004ECCB4: push eax
  '004ECCB5: call [004010A0h]
  '004ECCBB: mov ecx, [esi+10h]
  '004ECCBE: lea edx, [ebp-48h]
  '004ECCC1: push 0041D908h
  '004ECCC6: push edx
  '004ECCC7: mov ebx, [ecx]
  '004ECCC9: call [004011C8h]
  '004ECCCF: push eax
  '004ECCD0: lea eax, [ebp-28h]
  '004ECCD3: push eax
  '004ECCD4: call [004010E4h]
  '004ECCDA: mov ecx, [esi+10h]
  '004ECCDD: push eax
  '004ECCDE: push ecx
  '004ECCDF: call [ebx+0000024Ch]
  '004ECCE5: test eax, eax
  '004ECCE7: fclex 
  '004ECCE9: jnl 4ECD00h
  '004ECCEB: mov edx, [esi+10h]
  '004ECCEE: push 0000024Ch
  '004ECCF3: push 0042725Ch
  '004ECCF8: push edx
  '004ECCF9: push eax
  '004ECCFA: call [004010A0h]
  '004ECD00: lea eax, [ebp-28h]
  '004ECD03: lea ecx, [ebp-20h]
  '004ECD06: push eax
  '004ECD07: push ecx
  '004ECD08: push 00000002h
  '004ECD0A: call [00401064h]
  '004ECD10: lea edx, [ebp-48h]
  '004ECD13: lea eax, [ebp-38h]
  '004ECD16: push edx
  '004ECD17: push eax
  '004ECD18: push 00000002h
  '004ECD1A: call [00401050h]
  '004ECD20: mov ecx, [esi]
  '004ECD22: add esp, 00000018h
  '004ECD25: lea edx, [ebp-20h]
  '004ECD28: push edx
  '004ECD29: push esi
  '004ECD2A: call [ecx+000002B0h]
  '004ECD30: test eax, eax
  '004ECD32: fclex 
  '004ECD34: jnl 4ECD48h
  '004ECD36: push 000002B0h
  '004ECD3B: push 0042725Ch
  '004ECD40: push esi
  '004ECD41: push eax
  '004ECD42: call [004010A0h]
  '004ECD48: mov eax, [ebp-20h]
  '004ECD4B: lea edx, [ebp-24h]
  '004ECD4E: push edx
  '004ECD4F: push eax
  '004ECD50: mov ecx, [eax]
  '004ECD52: mov ebx, eax
  '004ECD54: call [ecx+24h]
  '004ECD57: test eax, eax
  '004ECD59: fclex 
  '004ECD5B: jnl 4ECD6Ch
  '004ECD5D: push 00000024h
  '004ECD5F: push 00427BDCh
  '004ECD64: push ebx
  '004ECD65: push eax
  '004ECD66: call [004010A0h]
  '004ECD6C: mov eax, [ebp-24h]
  '004ECD6F: lea edx, [ebp-48h]
  '004ECD72: push edx
  '004ECD73: mov ebx, [edi]
  '004ECD75: sub esp, 00000010h
  '004ECD78: mov [ebp-30h], eax
  '004ECD7B: mov edx, esp
  '004ECD7D: mov eax, 00000009h
  '004ECD82: mov [ebp-38h], eax
  '004ECD85: mov [ebp-24h], 00000000h
  '004ECD8C: mov ecx, [ebx]
  '004ECD8E: mov [edx], eax
  '004ECD90: mov eax, [ebp-34h]
  '004ECD93: push 00427DC4h
  '004ECD98: mov [edx+04h], eax
  '004ECD9B: mov eax, [ebp-30h]
  '004ECD9E: push ebx
  '004ECD9F: mov [edx+08h], eax
  '004ECDA2: mov eax, [ebp-2Ch]
  '004ECDA5: mov [edx+0Ch], eax
  '004ECDA8: call [ecx+1Ch]
  '004ECDAB: test eax, eax
  '004ECDAD: fclex 
  '004ECDAF: jnl 4ECDC0h
  '004ECDB1: push 0000001Ch
  '004ECDB3: push 00427C64h
  '004ECDB8: push ebx
  '004ECDB9: push eax
  '004ECDBA: call [004010A0h]
  '004ECDC0: mov ebx, [esi]
  '004ECDC2: lea ecx, [ebp-48h]
  '004ECDC5: push 0041D908h
  '004ECDCA: push ecx
  '004ECDCB: call [004011C8h]
  '004ECDD1: lea edx, [ebp-28h]
  '004ECDD4: push eax
  '004ECDD5: push edx
  '004ECDD6: call [004010E4h]
  '004ECDDC: push eax
  '004ECDDD: push esi
  '004ECDDE: call [ebx+00000940h]
  '004ECDE4: test eax, eax
  '004ECDE6: fclex 
  '004ECDE8: jnl 4ECDFCh
  '004ECDEA: push 00000940h
  '004ECDEF: push 0042728Ch
  '004ECDF4: push esi
  '004ECDF5: push eax
  '004ECDF6: call [004010A0h]
  '004ECDFC: lea eax, [ebp-28h]
  '004ECDFF: lea ecx, [ebp-20h]
  '004ECE02: push eax
  '004ECE03: push ecx
  '004ECE04: push 00000002h
  '004ECE06: call [00401064h]
  '004ECE0C: lea edx, [ebp-48h]
  '004ECE0F: lea eax, [ebp-38h]
  '004ECE12: push edx
  '004ECE13: push eax
  '004ECE14: push 00000002h
  '004ECE16: call [00401050h]
  '004ECE1C: add esp, 00000018h
  '004ECE1F: lea edx, [ebp-48h]
  '004ECE22: mov ebx, [edi]
  '004ECE24: mov eax, 00000009h
  '004ECE29: push edx
  '004ECE2A: mov [ebp-38h], eax
  '004ECE2D: sub esp, 00000010h
  '004ECE30: mov [ebp-30h], 00000000h
  '004ECE37: mov edx, esp
  '004ECE39: mov ecx, [ebx]
  '004ECE3B: push 00427DD4h
  '004ECE40: push ebx
  '004ECE41: mov [edx], eax
  '004ECE43: mov eax, [ebp-34h]
  '004ECE46: mov [edx+04h], eax
  '004ECE49: mov eax, [ebp-30h]
  '004ECE4C: mov [edx+08h], eax
  '004ECE4F: mov eax, [ebp-2Ch]
  '004ECE52: mov [edx+0Ch], eax
  '004ECE55: call [ecx+1Ch]
  '004ECE58: test eax, eax
  '004ECE5A: fclex 
  '004ECE5C: jnl 4ECE6Dh
  '004ECE5E: push 0000001Ch
  '004ECE60: push 00427C64h
  '004ECE65: push ebx
  '004ECE66: push eax
  '004ECE67: call [004010A0h]
  '004ECE6D: lea ecx, [ebp-48h]
  '004ECE70: push 004210C8h
  '004ECE75: push ecx
  '004ECE76: call [004011C8h]
  '004ECE7C: lea edx, [ebp-20h]
  '004ECE7F: push eax
  '004ECE80: push edx
  '004ECE81: call [004010E4h]
  '004ECE87: push eax
  '004ECE88: lea eax, [esi+000000B4h]
  '004ECE8E: push eax
  '004ECE8F: call [004010F8h]
  '004ECE95: lea ecx, [ebp-20h]
  '004ECE98: call [004013B8h]
  '004ECE9E: lea ecx, [ebp-48h]
  '004ECEA1: lea edx, [ebp-38h]
  '004ECEA4: push ecx
  '004ECEA5: push edx
  '004ECEA6: push 00000002h
  '004ECEA8: call [00401050h]
  '004ECEAE: add esp, 0000000Ch
  '004ECEB1: lea edx, [ebp-48h]
  '004ECEB4: mov ebx, [edi]
  '004ECEB6: mov eax, 00000009h
  '004ECEBB: push edx
  '004ECEBC: mov [ebp-38h], eax
  '004ECEBF: sub esp, 00000010h
  '004ECEC2: mov [ebp-30h], 00000000h
  '004ECEC9: mov edx, esp
  '004ECECB: mov ecx, [ebx]
  '004ECECD: push 00427D04h
  '004ECED2: push ebx
  '004ECED3: mov [edx], eax
  '004ECED5: mov eax, [ebp-34h]
  '004ECED8: mov [edx+04h], eax
  '004ECEDB: mov eax, [ebp-30h]
  '004ECEDE: mov [edx+08h], eax
  '004ECEE1: mov eax, [ebp-2Ch]
  '004ECEE4: mov [edx+0Ch], eax
  '004ECEE7: call [ecx+1Ch]
  '004ECEEA: test eax, eax
  '004ECEEC: fclex 
  '004ECEEE: jnl 4ECEFFh
  '004ECEF0: push 0000001Ch
  '004ECEF2: push 00427C64h
  '004ECEF7: push ebx
  '004ECEF8: push eax
  '004ECEF9: call [004010A0h]
  '004ECEFF: lea ecx, [ebp-48h]
  '004ECF02: push 004210C8h
  '004ECF07: push ecx
  '004ECF08: call [004011C8h]
  '004ECF0E: lea edx, [ebp-20h]
  '004ECF11: push eax
  '004ECF12: push edx
  '004ECF13: call [004010E4h]
  '004ECF19: push eax
  '004ECF1A: lea eax, [esi+000000B0h]
  '004ECF20: push eax
  '004ECF21: call [004010F8h]
  '004ECF27: lea ecx, [ebp-20h]
  '004ECF2A: call [004013B8h]
  '004ECF30: lea ecx, [ebp-48h]
  '004ECF33: lea edx, [ebp-38h]
  '004ECF36: push ecx
  '004ECF37: push edx
  '004ECF38: push 00000002h
  '004ECF3A: call [00401050h]
  '004ECF40: add esp, 0000000Ch
  '004ECF43: lea edx, [ebp-48h]
  '004ECF46: mov ebx, [edi]
  '004ECF48: mov eax, 00000009h
  '004ECF4D: push edx
  '004ECF4E: mov [ebp-38h], eax
  '004ECF51: sub esp, 00000010h
  '004ECF54: mov [ebp-30h], 00000000h
  '004ECF5B: mov edx, esp
  '004ECF5D: mov ecx, [ebx]
  '004ECF5F: push 00427DF4h
  '004ECF64: push ebx
  '004ECF65: mov [edx], eax
  '004ECF67: mov eax, [ebp-34h]
  '004ECF6A: mov [edx+04h], eax
  '004ECF6D: mov eax, [ebp-30h]
  '004ECF70: mov [edx+08h], eax
  '004ECF73: mov eax, [ebp-2Ch]
  '004ECF76: mov [edx+0Ch], eax
  '004ECF79: call [ecx+1Ch]
  '004ECF7C: test eax, eax
  '004ECF7E: fclex 
  '004ECF80: jnl 4ECF91h
  '004ECF82: push 0000001Ch
  '004ECF84: push 00427C64h
  '004ECF89: push ebx
  '004ECF8A: push eax
  '004ECF8B: call [004010A0h]
  '004ECF91: mov ebx, [esi]
  '004ECF93: lea ecx, [ebp-48h]
  '004ECF96: push 004210C8h
  '004ECF9B: push ecx
  '004ECF9C: call [004011C8h]
  '004ECFA2: lea edx, [ebp-20h]
  '004ECFA5: push eax
  '004ECFA6: push edx
  '004ECFA7: call [004010E4h]
  '004ECFAD: push eax
  '004ECFAE: push esi
  '004ECFAF: call [ebx+000007C8h]
  '004ECFB5: test eax, eax
  '004ECFB7: jnl 4ECFCBh
  '004ECFB9: push 000007C8h
  '004ECFBE: push 0042728Ch
  '004ECFC3: push esi
  '004ECFC4: push eax
  '004ECFC5: call [004010A0h]
  '004ECFCB: lea ecx, [ebp-20h]
  '004ECFCE: call [004013B8h]
  '004ECFD4: lea eax, [ebp-48h]
  '004ECFD7: lea ecx, [ebp-38h]
  '004ECFDA: push eax
  '004ECFDB: push ecx
  '004ECFDC: push 00000002h
  '004ECFDE: call [00401050h]
  '004ECFE4: add esp, 0000000Ch
  '004ECFE7: lea ecx, [ebp-38h]
  '004ECFEA: mov ebx, [edi]
  '004ECFEC: mov eax, 0000000Bh
  '004ECFF1: push ecx
  '004ECFF2: sub esp, 00000010h
  '004ECFF5: mov edx, [ebx]
  '004ECFF7: mov ecx, esp
  '004ECFF9: push 00427E0Ch
  '004ECFFE: push ebx
  '004ECFFF: mov [ecx], eax
  '004ED001: mov eax, [ebp-54h]
  '004ED004: mov [ecx+04h], eax
  '004ED007: or eax, FFFFFFFFh
  '004ED00A: mov [ecx+08h], eax
  '004ED00D: mov eax, [ebp-4Ch]
  '004ED010: mov [ecx+0Ch], eax
  '004ED013: call [edx+1Ch]
  '004ED016: test eax, eax
  '004ED018: fclex 
  '004ED01A: jnl 4ED02Bh
  '004ED01C: push 0000001Ch
  '004ED01E: push 00427C64h
  '004ED023: push ebx
  '004ED024: push eax
  '004ED025: call [004010A0h]
  '004ED02B: mov ecx, [esi+10h]
  '004ED02E: lea edx, [ebp-38h]
  '004ED031: push edx
  '004ED032: mov ebx, [ecx]
  '004ED034: call [00401114h]
  '004ED03A: push eax
  '004ED03B: mov eax, [esi+10h]
  '004ED03E: push eax
  '004ED03F: call [ebx+00000094h]
  '004ED045: test eax, eax
  '004ED047: fclex 
  '004ED049: jnl 4ED060h
  '004ED04B: mov ecx, [esi+10h]
  '004ED04E: push 00000094h
  '004ED053: push 0042725Ch
  '004ED058: push ecx
  '004ED059: push eax
  '004ED05A: call [004010A0h]
  '004ED060: lea ecx, [ebp-38h]
  '004ED063: call [00401030h]
  '004ED069: lea ecx, [ebp-38h]
  '004ED06C: mov ebx, [edi]
  '004ED06E: push ecx
  '004ED06F: mov eax, 00000002h
  '004ED074: sub esp, 00000010h
  '004ED077: mov edx, [ebx]
  '004ED079: mov ecx, esp
  '004ED07B: push 00427E20h
  '004ED080: push ebx
  '004ED081: mov [ecx], eax
  '004ED083: mov eax, [ebp-54h]
  '004ED086: mov [ecx+04h], eax
  '004ED089: xor eax, eax
  '004ED08B: mov [ecx+08h], eax
  '004ED08E: mov eax, [ebp-4Ch]
  '004ED091: mov [ecx+0Ch], eax
  '004ED094: call [edx+1Ch]
  '004ED097: test eax, eax
  '004ED099: fclex 
  '004ED09B: jnl 4ED0ACh
  '004ED09D: push 0000001Ch
  '004ED09F: push 00427C64h
  '004ED0A4: push ebx
  '004ED0A5: push eax
  '004ED0A6: call [004010A0h]
  '004ED0AC: mov ecx, [esi+10h]
  '004ED0AF: lea edx, [ebp-38h]
  '004ED0B2: push edx
  '004ED0B3: mov ebx, [ecx]
  '004ED0B5: call [00401284h]
  '004ED0BB: push eax
  '004ED0BC: mov eax, [esi+10h]
  '004ED0BF: push eax
  '004ED0C0: call [ebx+000000A4h]
  '004ED0C6: test eax, eax
  '004ED0C8: fclex 
  '004ED0CA: jnl 4ED0E1h
  '004ED0CC: mov ecx, [esi+10h]
  '004ED0CF: push 000000A4h
  '004ED0D4: push 0042725Ch
  '004ED0D9: push ecx
  '004ED0DA: push eax
  '004ED0DB: call [004010A0h]
  '004ED0E1: mov ebx, [00401030h]
  '004ED0E7: lea ecx, [ebp-38h]
  '004ED0EA: call ebx
  '004ED0EC: mov ecx, [edi]
  '004ED0EE: mov eax, 00000008h
  '004ED0F3: mov [ebp-5Ch], ecx
  '004ED0F6: mov edx, [ecx]
  '004ED0F8: lea ecx, [ebp-38h]
  '004ED0FB: push ecx
  '004ED0FC: sub esp, 00000010h
  '004ED0FF: mov ecx, esp
  '004ED101: push 00427E40h
  '004ED106: mov [ecx], eax
  '004ED108: mov eax, [ebp-54h]
  '004ED10B: mov [ecx+04h], eax
  '004ED10E: mov eax, 0041BC60h
  '004ED113: mov [ecx+08h], eax
  '004ED116: mov eax, [ebp-4Ch]
  '004ED119: mov [ecx+0Ch], eax
  '004ED11C: mov ecx, [ebp-5Ch]
  '004ED11F: push ecx
  '004ED120: call [edx+1Ch]
  '004ED123: test eax, eax
  '004ED125: fclex 
  '004ED127: jnl 4ED13Bh
  '004ED129: mov edx, [ebp-5Ch]
  '004ED12C: push 0000001Ch
  '004ED12E: push 00427C64h
  '004ED133: push edx
  '004ED134: push eax
  '004ED135: call [004010A0h]
  '004ED13B: lea eax, [ebp-38h]
  '004ED13E: push eax
  '004ED13F: call [0040103Ch]
  '004ED145: mov edx, eax
  '004ED147: lea ecx, [ebp-18h]
  '004ED14A: call [00401378h]
  '004ED150: mov edx, eax
  '004ED152: lea ecx, [esi+000000FCh]
  '004ED158: call [004012D8h]
  '004ED15E: lea ecx, [ebp-18h]
  '004ED161: call [004013B4h]
  '004ED167: lea ecx, [ebp-38h]
  '004ED16A: call ebx
  '004ED16C: lea edx, [ebp-38h]
  '004ED16F: mov eax, 00000003h
  '004ED174: push edx
  '004ED175: mov ecx, [edi]
  '004ED177: sub esp, 00000010h
  '004ED17A: mov [ebp-5Ch], ecx
  '004ED17D: mov edx, esp
  '004ED17F: mov ecx, [ecx]
  '004ED181: push 00427E4Ch
  '004ED186: mov [edx], eax
  '004ED188: mov eax, [ebp-54h]
  '004ED18B: mov [edx+04h], eax
  '004ED18E: mov eax, 80000014h
  '004ED193: mov [edx+08h], eax
  '004ED196: mov eax, [ebp-4Ch]
  '004ED199: mov [edx+0Ch], eax
  '004ED19C: mov edx, [ebp-5Ch]
  '004ED19F: push edx
  '004ED1A0: call [ecx+1Ch]
  '004ED1A3: test eax, eax
  '004ED1A5: fclex 
  '004ED1A7: jnl 4ED1BBh
  '004ED1A9: mov ecx, [ebp-5Ch]
  '004ED1AC: push 0000001Ch
  '004ED1AE: push 00427C64h
  '004ED1B3: push ecx
  '004ED1B4: push eax
  '004ED1B5: call [004010A0h]
  '004ED1BB: lea edx, [ebp-38h]
  '004ED1BE: push edx
  '004ED1BF: call [0040130Ch]
  '004ED1C5: lea ecx, [ebp-38h]
  '004ED1C8: mov [esi+00000124h], eax
  '004ED1CE: call ebx
  '004ED1D0: lea edx, [ebp-38h]
  '004ED1D3: mov eax, 00000003h
  '004ED1D8: push edx
  '004ED1D9: mov ecx, [edi]
  '004ED1DB: sub esp, 00000010h
  '004ED1DE: mov [ebp-5Ch], ecx
  '004ED1E1: mov edx, esp
  '004ED1E3: mov ecx, [ecx]
  '004ED1E5: push 00427E70h
  '004ED1EA: mov [edx], eax
  '004ED1EC: mov eax, [ebp-54h]
  '004ED1EF: mov [edx+04h], eax
  '004ED1F2: mov eax, 80000016h
  '004ED1F7: mov [edx+08h], eax
  '004ED1FA: mov eax, [ebp-4Ch]
  '004ED1FD: mov [edx+0Ch], eax
  '004ED200: mov edx, [ebp-5Ch]
  '004ED203: push edx
  '004ED204: call [ecx+1Ch]
  '004ED207: test eax, eax
  '004ED209: fclex 
  '004ED20B: jnl 4ED21Fh
  '004ED20D: mov ecx, [ebp-5Ch]
  '004ED210: push 0000001Ch
  '004ED212: push 00427C64h
  '004ED217: push ecx
  '004ED218: push eax
  '004ED219: call [004010A0h]
  '004ED21F: lea edx, [ebp-38h]
  '004ED222: push edx
  '004ED223: call [0040130Ch]
  '004ED229: lea ecx, [ebp-38h]
  '004ED22C: mov [esi+00000128h], eax
  '004ED232: call ebx
  '004ED234: lea edx, [ebp-38h]
  '004ED237: mov eax, 00000002h
  '004ED23C: push edx
  '004ED23D: mov ecx, [edi]
  '004ED23F: sub esp, 00000010h
  '004ED242: mov [ebp-5Ch], ecx
  '004ED245: mov edx, esp
  '004ED247: mov ecx, [ecx]
  '004ED249: push 00427E90h
  '004ED24E: mov [edx], eax
  '004ED250: mov eax, [ebp-54h]
  '004ED253: mov [edx+04h], eax
  '004ED256: mov eax, 00000001h
  '004ED25B: mov [edx+08h], eax
  '004ED25E: mov eax, [ebp-4Ch]
  '004ED261: mov [edx+0Ch], eax
  '004ED264: mov edx, [ebp-5Ch]
  '004ED267: push edx
  '004ED268: call [ecx+1Ch]
  '004ED26B: test eax, eax
  '004ED26D: fclex 
  '004ED26F: jnl 4ED283h
  '004ED271: mov ecx, [ebp-5Ch]
  '004ED274: push 0000001Ch
  '004ED276: push 00427C64h
  '004ED27B: push ecx
  '004ED27C: push eax
  '004ED27D: call [004010A0h]
  '004ED283: lea edx, [ebp-38h]
  '004ED286: push edx
  '004ED287: call [00401114h]
  '004ED28D: lea ecx, [ebp-38h]
  '004ED290: mov [esi+00000120h], ax
  '004ED297: call ebx
  '004ED299: lea edx, [ebp-38h]
  '004ED29C: mov eax, 00000008h
  '004ED2A1: push edx
  '004ED2A2: mov ecx, [edi]
  '004ED2A4: sub esp, 00000010h
  '004ED2A7: mov [ebp-5Ch], ecx
  '004ED2AA: mov edx, esp
  '004ED2AC: mov ecx, [ecx]
  '004ED2AE: push 00427EB4h
  '004ED2B3: mov [edx], eax
  '004ED2B5: mov eax, [ebp-54h]
  '004ED2B8: mov [edx+04h], eax
  '004ED2BB: mov eax, 00427BF0h
  '004ED2C0: mov [edx+08h], eax
  '004ED2C3: mov eax, [ebp-4Ch]
  '004ED2C6: mov [edx+0Ch], eax
  '004ED2C9: mov edx, [ebp-5Ch]
  '004ED2CC: push edx
  '004ED2CD: call [ecx+1Ch]
  '004ED2D0: test eax, eax
  '004ED2D2: fclex 
  '004ED2D4: jnl 4ED2E8h
  '004ED2D6: mov ecx, [ebp-5Ch]
  '004ED2D9: push 0000001Ch
  '004ED2DB: push 00427C64h
  '004ED2E0: push ecx
  '004ED2E1: push eax
  '004ED2E2: call [004010A0h]
  '004ED2E8: lea edx, [ebp-38h]
  '004ED2EB: push edx
  '004ED2EC: call [0040103Ch]
  '004ED2F2: mov edx, eax
  '004ED2F4: lea ecx, [ebp-18h]
  '004ED2F7: call [00401378h]
  '004ED2FD: mov edx, eax
  '004ED2FF: lea ecx, [esi+00000110h]
  '004ED305: call [004012D8h]
  '004ED30B: lea ecx, [ebp-18h]
  '004ED30E: call [004013B4h]
  '004ED314: lea ecx, [ebp-38h]
  '004ED317: call ebx
  '004ED319: lea edx, [ebp-38h]
  '004ED31C: mov eax, 00000008h
  '004ED321: push edx
  '004ED322: mov ecx, [edi]
  '004ED324: sub esp, 00000010h
  '004ED327: mov [ebp-5Ch], ecx
  '004ED32A: mov edx, esp
  '004ED32C: mov ecx, [ecx]
  '004ED32E: push 00427ECCh
  '004ED333: mov [edx], eax
  '004ED335: mov eax, [ebp-54h]
  '004ED338: mov [edx+04h], eax
  '004ED33B: mov eax, 00427C20h
  '004ED340: mov [edx+08h], eax
  '004ED343: mov eax, [ebp-4Ch]
  '004ED346: mov [edx+0Ch], eax
  '004ED349: mov edx, [ebp-5Ch]
  '004ED34C: push edx
  '004ED34D: call [ecx+1Ch]
  '004ED350: test eax, eax
  '004ED352: fclex 
  '004ED354: jnl 4ED368h
  '004ED356: mov ecx, [ebp-5Ch]
  '004ED359: push 0000001Ch
  '004ED35B: push 00427C64h
  '004ED360: push ecx
  '004ED361: push eax
  '004ED362: call [004010A0h]
  '004ED368: lea edx, [ebp-38h]
  '004ED36B: push edx
  '004ED36C: call [0040103Ch]
  '004ED372: mov edx, eax
  '004ED374: lea ecx, [ebp-18h]
  '004ED377: call [00401378h]
  '004ED37D: mov edx, eax
  '004ED37F: lea ecx, [esi+00000114h]
  '004ED385: call [004012D8h]
  '004ED38B: lea ecx, [ebp-18h]
  '004ED38E: call [004013B4h]
  '004ED394: lea ecx, [ebp-38h]
  '004ED397: call ebx
  '004ED399: lea edx, [ebp-38h]
  '004ED39C: mov eax, 00000002h
  '004ED3A1: push edx
  '004ED3A2: mov ecx, [edi]
  '004ED3A4: sub esp, 00000010h
  '004ED3A7: mov [ebp-5Ch], ecx
  '004ED3AA: mov edx, esp
  '004ED3AC: mov ecx, [ecx]
  '004ED3AE: push 00427EE8h
  '004ED3B3: mov [edx], eax
  '004ED3B5: mov eax, [ebp-54h]
  '004ED3B8: mov [edx+04h], eax
  '004ED3BB: mov eax, 00000001h
  '004ED3C0: mov [edx+08h], eax
  '004ED3C3: mov eax, [ebp-4Ch]
  '004ED3C6: mov [edx+0Ch], eax
  '004ED3C9: mov edx, [ebp-5Ch]
  '004ED3CC: push edx
  '004ED3CD: call [ecx+1Ch]
  '004ED3D0: test eax, eax
  '004ED3D2: fclex 
  '004ED3D4: jnl 4ED3E8h
  '004ED3D6: mov ecx, [ebp-5Ch]
  '004ED3D9: push 0000001Ch
  '004ED3DB: push 00427C64h
  '004ED3E0: push ecx
  '004ED3E1: push eax
  '004ED3E2: call [004010A0h]
  '004ED3E8: lea edx, [ebp-38h]
  '004ED3EB: push edx
  '004ED3EC: call [00401114h]
  '004ED3F2: lea ecx, [ebp-38h]
  '004ED3F5: mov [esi+0000010Eh], ax
  '004ED3FC: call ebx
  '004ED3FE: lea edx, [ebp-38h]
  '004ED401: mov eax, 00000002h
  '004ED406: push edx
  '004ED407: mov ecx, [edi]
  '004ED409: sub esp, 00000010h
  '004ED40C: mov [ebp-5Ch], ecx
  '004ED40F: mov edx, esp
  '004ED411: mov ecx, [ecx]
  '004ED413: push 00427F04h
  '004ED418: mov [edx], eax
  '004ED41A: mov eax, [ebp-54h]
  '004ED41D: mov [edx+04h], eax
  '004ED420: xor eax, eax
  '004ED422: mov [edx+08h], eax
  '004ED425: mov eax, [ebp-4Ch]
  '004ED428: mov [edx+0Ch], eax
  '004ED42B: mov edx, [ebp-5Ch]
  '004ED42E: push edx
  '004ED42F: call [ecx+1Ch]
  '004ED432: test eax, eax
  '004ED434: fclex 
  '004ED436: jnl 4ED44Ah
  '004ED438: mov ecx, [ebp-5Ch]
  '004ED43B: push 0000001Ch
  '004ED43D: push 00427C64h
  '004ED442: push ecx
  '004ED443: push eax
  '004ED444: call [004010A0h]
  '004ED44A: lea edx, [ebp-38h]
  '004ED44D: push edx
  '004ED44E: call [00401114h]
  '004ED454: lea ecx, [ebp-38h]
  '004ED457: mov [esi+0000010Ch], ax
  '004ED45E: call ebx
  '004ED460: lea edx, [ebp-38h]
  '004ED463: mov eax, 00000002h
  '004ED468: push edx
  '004ED469: mov ecx, [edi]
  '004ED46B: sub esp, 00000010h
  '004ED46E: mov [ebp-5Ch], ecx
  '004ED471: mov edx, esp
  '004ED473: mov ecx, [ecx]
  '004ED475: push 00426F4Ch
  '004ED47A: mov [edx], eax
  '004ED47C: mov eax, [ebp-54h]
  '004ED47F: mov [edx+04h], eax
  '004ED482: xor eax, eax
  '004ED484: mov [edx+08h], eax
  '004ED487: mov eax, [ebp-4Ch]
  '004ED48A: mov [edx+0Ch], eax
  '004ED48D: mov edx, [ebp-5Ch]
  '004ED490: push edx
  '004ED491: call [ecx+1Ch]
  '004ED494: test eax, eax
  '004ED496: fclex 
  '004ED498: jnl 4ED4ACh
  '004ED49A: mov ecx, [ebp-5Ch]
  '004ED49D: push 0000001Ch
  '004ED49F: push 00427C64h
  '004ED4A4: push ecx
  '004ED4A5: push eax
  '004ED4A6: call [004010A0h]
  '004ED4AC: lea edx, [ebp-38h]
  '004ED4AF: push edx
  '004ED4B0: call [0040130Ch]
  '004ED4B6: lea ecx, [ebp-38h]
  '004ED4B9: mov [esi+00000108h], eax
  '004ED4BF: call ebx
  '004ED4C1: lea edx, [ebp-38h]
  '004ED4C4: mov eax, 00000002h
  '004ED4C9: push edx
  '004ED4CA: mov ecx, [edi]
  '004ED4CC: sub esp, 00000010h
  '004ED4CF: mov [ebp-5Ch], ecx
  '004ED4D2: mov edx, esp
  '004ED4D4: mov ecx, [ecx]
  '004ED4D6: push 00427F30h
  '004ED4DB: mov [edx], eax
  '004ED4DD: mov eax, [ebp-54h]
  '004ED4E0: mov [edx+04h], eax
  '004ED4E3: xor eax, eax
  '004ED4E5: mov [edx+08h], eax
  '004ED4E8: mov eax, [ebp-4Ch]
  '004ED4EB: mov [edx+0Ch], eax
  '004ED4EE: mov edx, [ebp-5Ch]
  '004ED4F1: push edx
  '004ED4F2: call [ecx+1Ch]
  '004ED4F5: test eax, eax
  '004ED4F7: fclex 
  '004ED4F9: jnl 4ED50Dh
  '004ED4FB: mov ecx, [ebp-5Ch]
  '004ED4FE: push 0000001Ch
  '004ED500: push 00427C64h
  '004ED505: push ecx
  '004ED506: push eax
  '004ED507: call [004010A0h]
  '004ED50D: lea edx, [ebp-38h]
  '004ED510: push edx
  '004ED511: call [00401114h]
  '004ED517: lea ecx, [ebp-38h]
  '004ED51A: mov [esi+00000106h], ax
  '004ED521: call ebx
  '004ED523: lea edx, [ebp-38h]
  '004ED526: mov eax, 00000002h
  '004ED52B: push edx
  '004ED52C: mov ecx, [edi]
  '004ED52E: sub esp, 00000010h
  '004ED531: mov [ebp-50h], 00000001h
  '004ED538: mov edx, esp
  '004ED53A: mov [ebp-5Ch], ecx
  '004ED53D: mov ecx, [ecx]
  '004ED53F: push 00427F50h
  '004ED544: mov [edx], eax
  '004ED546: mov eax, [ebp-54h]
  '004ED549: mov [edx+04h], eax
  '004ED54C: mov eax, [ebp-50h]
  '004ED54F: mov [edx+08h], eax
  '004ED552: mov eax, [ebp-4Ch]
  '004ED555: mov [edx+0Ch], eax
  '004ED558: mov edx, [ebp-5Ch]
  '004ED55B: push edx
  '004ED55C: call [ecx+1Ch]
  '004ED55F: test eax, eax
  '004ED561: fclex 
  '004ED563: jnl 4ED577h
  '004ED565: mov ecx, [ebp-5Ch]
  '004ED568: push 0000001Ch
  '004ED56A: push 00427C64h
  '004ED56F: push ecx
  '004ED570: push eax
  '004ED571: call [004010A0h]
  '004ED577: lea edx, [ebp-38h]
  '004ED57A: push edx
  '004ED57B: call [00401284h]
  '004ED581: lea ecx, [ebp-38h]
  '004ED584: mov [esi+00000102h], ax
  '004ED58B: call ebx
  '004ED58D: lea edx, [ebp-38h]
  '004ED590: mov edi, [edi]
  '004ED592: push edx
  '004ED593: mov eax, 00000002h
  '004ED598: sub esp, 00000010h
  '004ED59B: mov ecx, [edi]
  '004ED59D: mov edx, esp
  '004ED59F: push 00427F60h
  '004ED5A4: push edi
  '004ED5A5: mov [edx], eax
  '004ED5A7: mov eax, [ebp-54h]
  '004ED5AA: mov [edx+04h], eax
  '004ED5AD: mov eax, 00000008h
  '004ED5B2: mov [edx+08h], eax
  '004ED5B5: mov eax, [ebp-4Ch]
  '004ED5B8: mov [edx+0Ch], eax
  '004ED5BB: call [ecx+1Ch]
  '004ED5BE: test eax, eax
  '004ED5C0: fclex 
  '004ED5C2: jnl 4ED5D3h
  '004ED5C4: push 0000001Ch
  '004ED5C6: push 00427C64h
  '004ED5CB: push edi
  '004ED5CC: push eax
  '004ED5CD: call [004010A0h]
  '004ED5D3: lea ecx, [ebp-38h]
  '004ED5D6: push ecx
  '004ED5D7: call [00401284h]
  '004ED5DD: lea ecx, [ebp-38h]
  '004ED5E0: mov [esi+00000104h], ax
  '004ED5E7: call ebx
  '004ED5E9: mov edx, [esi]
  '004ED5EB: push esi
  '004ED5EC: call [edx+00000934h]
  '004ED5F2: mov eax, [esi]
  '004ED5F4: push esi
  '004ED5F5: call [eax+000008B8h]
  '004ED5FB: test eax, eax
  '004ED5FD: jnl 4ED611h
  '004ED5FF: push 000008B8h
  '004ED604: push 0042728Ch
  '004ED609: push esi
  '004ED60A: push eax
  '004ED60B: call [004010A0h]
  '004ED611: mov [ebp-04h], 00000000h
  '004ED618: push 004ED658h
  '004ED61D: jmp 4ED657h
  '004ED61F: lea ecx, [ebp-1Ch]
  '004ED622: lea edx, [ebp-18h]
  '004ED625: push ecx
  '004ED626: push edx
  '004ED627: push 00000002h
  '004ED629: call [004012E8h]
  '004ED62F: lea eax, [ebp-28h]
  '004ED632: lea ecx, [ebp-24h]
  '004ED635: push eax
  '004ED636: lea edx, [ebp-20h]
  '004ED639: push ecx
  '004ED63A: push edx
  '004ED63B: push 00000003h
  '004ED63D: call [00401064h]
  '004ED643: lea eax, [ebp-48h]
  '004ED646: lea ecx, [ebp-38h]
  '004ED649: push eax
  '004ED64A: push ecx
  '004ED64B: push 00000002h
  '004ED64D: call [00401050h]
  '004ED653: add esp, 00000028h
  '004ED656: ret 
End Sub
Private Sub UserControl__4EC100
  '004EC100: push ebp
  '004EC101: mov ebp, esp
  '004EC103: sub esp, 0000000Ch
  '004EC106: push 004081B6h
  '004EC10B: mov eax, fs:[00h]
  '004EC111: push eax
  '004EC112: mov fs:[00000000h], esp
  '004EC119: sub esp, 00000080h
  '004EC11F: push ebx
  '004EC120: push esi
  '004EC121: push edi
  '004EC122: mov [ebp-0Ch], esp
  '004EC125: mov [ebp-08h], 004055B8h
  '004EC12C: mov esi, [ebp+08h]
  '004EC12F: mov eax, esi
  '004EC131: and eax, 00000001h
  '004EC134: mov [ebp-04h], eax
  '004EC137: and esi, FFFFFFFEh
  '004EC13A: push esi
  '004EC13B: mov [ebp+08h], esi
  '004EC13E: mov ecx, [esi]
  '004EC140: call [ecx+04h]
  '004EC143: mov edx, [esi]
  '004EC145: lea eax, [ebp-1Ch]
  '004EC148: xor edi, edi
  '004EC14A: push eax
  '004EC14B: push esi
  '004EC14C: mov [ebp-18h], edi
  '004EC14F: mov [ebp-1Ch], edi
  '004EC152: mov [ebp-20h], edi
  '004EC155: mov [ebp-24h], edi
  '004EC158: mov [esi+0000011Ch], 8000000Fh
  '004EC162: mov [esi+00000118h], 80000012h
  '004EC16C: mov word ptr [esi+00000100h], FFFFh
  '004EC175: call [edx+000002B0h]
  '004EC17B: cmp eax, edi
  '004EC17D: fclex 
  '004EC17F: jnl 4EC197h
  '004EC181: mov edi, [004010A0h]
  '004EC187: push 000002B0h
  '004EC18C: push 0042725Ch
  '004EC191: push esi
  '004EC192: push eax
  '004EC193: call edi
  '004EC195: jmp 4EC19Dh
  '004EC197: mov edi, [004010A0h]
  '004EC19D: mov eax, [ebp-1Ch]
  '004EC1A0: lea edx, [ebp-20h]
  '004EC1A3: push edx
  '004EC1A4: push eax
  '004EC1A5: mov ecx, [eax]
  '004EC1A7: mov ebx, eax
  '004EC1A9: call [ecx+24h]
  '004EC1AC: test eax, eax
  '004EC1AE: fclex 
  '004EC1B0: jnl 4EC1BDh
  '004EC1B2: push 00000024h
  '004EC1B4: push 00427BDCh
  '004EC1B9: push ebx
  '004EC1BA: push eax
  '004EC1BB: call edi
  '004EC1BD: mov eax, [ebp-20h]
  '004EC1C0: mov ecx, [esi+10h]
  '004EC1C3: lea edx, [ebp-24h]
  '004EC1C6: push eax
  '004EC1C7: mov [ebp-20h], 00000000h
  '004EC1CE: mov ebx, [ecx]
  '004EC1D0: push edx
  '004EC1D1: call [004010E4h]
  '004EC1D7: push eax
  '004EC1D8: mov eax, [esi+10h]
  '004EC1DB: push eax
  '004EC1DC: call [ebx+0000024Ch]
  '004EC1E2: test eax, eax
  '004EC1E4: fclex 
  '004EC1E6: jnl 4EC1F9h
  '004EC1E8: mov ecx, [esi+10h]
  '004EC1EB: push 0000024Ch
  '004EC1F0: push 0042725Ch
  '004EC1F5: push ecx
  '004EC1F6: push eax
  '004EC1F7: call edi
  '004EC1F9: lea edx, [ebp-24h]
  '004EC1FC: lea eax, [ebp-1Ch]
  '004EC1FF: push edx
  '004EC200: push eax
  '004EC201: push 00000002h
  '004EC203: call [00401064h]
  '004EC209: mov ecx, [esi]
  '004EC20B: add esp, 0000000Ch
  '004EC20E: lea edx, [ebp-1Ch]
  '004EC211: push edx
  '004EC212: push esi
  '004EC213: call [ecx+000002B0h]
  '004EC219: test eax, eax
  '004EC21B: fclex 
  '004EC21D: jnl 4EC22Dh
  '004EC21F: push 000002B0h
  '004EC224: push 0042725Ch
  '004EC229: push esi
  '004EC22A: push eax
  '004EC22B: call edi
  '004EC22D: mov eax, [ebp-1Ch]
  '004EC230: lea edx, [ebp-20h]
  '004EC233: push edx
  '004EC234: push eax
  '004EC235: mov ecx, [eax]
  '004EC237: mov ebx, eax
  '004EC239: call [ecx+24h]
  '004EC23C: test eax, eax
  '004EC23E: fclex 
  '004EC240: jnl 4EC24Dh
  '004EC242: push 00000024h
  '004EC244: push 00427BDCh
  '004EC249: push ebx
  '004EC24A: push eax
  '004EC24B: call edi
  '004EC24D: mov eax, [ebp-20h]
  '004EC250: mov ebx, [esi]
  '004EC252: push eax
  '004EC253: lea eax, [ebp-24h]
  '004EC256: push eax
  '004EC257: mov [ebp-20h], 00000000h
  '004EC25E: call [004010E4h]
  '004EC264: push eax
  '004EC265: push esi
  '004EC266: call [ebx+00000940h]
  '004EC26C: test eax, eax
  '004EC26E: fclex 
  '004EC270: jnl 4EC280h
  '004EC272: push 00000940h
  '004EC277: push 0042728Ch
  '004EC27C: push esi
  '004EC27D: push eax
  '004EC27E: call edi
  '004EC280: lea ecx, [ebp-24h]
  '004EC283: lea edx, [ebp-1Ch]
  '004EC286: push ecx
  '004EC287: push edx
  '004EC288: push 00000002h
  '004EC28A: call [00401064h]
  '004EC290: mov eax, [esi]
  '004EC292: add esp, 0000000Ch
  '004EC295: lea ecx, [ebp-1Ch]
  '004EC298: push ecx
  '004EC299: push esi
  '004EC29A: call [eax+000002B0h]
  '004EC2A0: test eax, eax
  '004EC2A2: fclex 
  '004EC2A4: jnl 4EC2B4h
  '004EC2A6: push 000002B0h
  '004EC2AB: push 0042725Ch
  '004EC2B0: push esi
  '004EC2B1: push eax
  '004EC2B2: call edi
  '004EC2B4: mov eax, [ebp-1Ch]
  '004EC2B7: lea ecx, [ebp-18h]
  '004EC2BA: push ecx
  '004EC2BB: push eax
  '004EC2BC: mov edx, [eax]
  '004EC2BE: mov ebx, eax
  '004EC2C0: call [edx+20h]
  '004EC2C3: test eax, eax
  '004EC2C5: fclex 
  '004EC2C7: jnl 4EC2D4h
  '004EC2C9: push 00000020h
  '004EC2CB: push 00427BDCh
  '004EC2D0: push ebx
  '004EC2D1: push eax
  '004EC2D2: call edi
  '004EC2D4: mov edx, [ebp-18h]
  '004EC2D7: lea ecx, [esi+000000B8h]
  '004EC2DD: call [004012D8h]
  '004EC2E3: lea ecx, [ebp-18h]
  '004EC2E6: call [004013B4h]
  '004EC2EC: lea ecx, [ebp-1Ch]
  '004EC2EF: call [004013B8h]
  '004EC2F5: mov eax, 00000001h
  '004EC2FA: mov ecx, 00000020h
  '004EC2FF: mov [esi+000000BCh], eax
  '004EC305: mov [esi+000000C0h], 00000002h
  '004EC30F: mov [esi+000000C8h], ecx
  '004EC315: mov [esi+000000CCh], ecx
  '004EC31B: mov [esi+000000D0h], eax
  '004EC321: mov eax, [54238Ch]
  '004EC326: test eax, eax
  '004EC328: jnz 4EC33Ah
  '004EC32A: push 0054238Ch
  '004EC32F: push 0041D9E0h
  '004EC334: call [004012B8h]
  '004EC33A: lea ebx, [ebp-1Ch]
  '004EC33D: mov ecx, 0000000Ah
  '004EC342: push ebx
  '004EC343: mov eax, 80020004h
  '004EC348: sub esp, 00000010h
  '004EC34B: mov edi, [0054238Ch]
  '004EC351: mov ebx, esp
  '004EC353: sub esp, 00000010h
  '004EC356: mov edx, [edi]
  '004EC358: mov [ebx], ecx
  '004EC35A: mov ecx, [ebp-70h]
  '004EC35D: mov [ebx+04h], ecx
  '004EC360: mov ecx, esp
  '004EC362: sub esp, 00000010h
  '004EC365: mov [ebx+08h], eax
  '004EC368: mov eax, [ebp-68h]
  '004EC36B: mov [ebx+0Ch], eax
  '004EC36E: mov eax, 0000000Ah
  '004EC373: mov [ecx], eax
  '004EC375: mov eax, [ebp-60h]
  '004EC378: mov [ecx+04h], eax
  '004EC37B: mov eax, 80020004h
  '004EC380: mov [ecx+08h], eax
  '004EC383: mov eax, [ebp-58h]
  '004EC386: mov [ecx+0Ch], eax
  '004EC389: mov ecx, esp
  '004EC38B: mov eax, 0000000Ah
  '004EC390: sub esp, 00000010h
  '004EC393: mov [ecx], eax
  '004EC395: mov eax, [ebp-50h]
  '004EC398: mov [ecx+04h], eax
  '004EC39B: mov eax, 80020004h
  '004EC3A0: mov [ecx+08h], eax
  '004EC3A3: mov eax, [ebp-48h]
  '004EC3A6: mov [ecx+0Ch], eax
  '004EC3A9: mov ecx, esp
  '004EC3AB: mov eax, 0000000Ah
  '004EC3B0: sub esp, 00000010h
  '004EC3B3: mov [ecx], eax
  '004EC3B5: mov eax, [ebp-40h]
  '004EC3B8: mov [ecx+04h], eax
  '004EC3BB: mov eax, 80020004h
  '004EC3C0: mov [ecx+08h], eax
  '004EC3C3: mov eax, [ebp-38h]
  '004EC3C6: mov [ecx+0Ch], eax
  '004EC3C9: mov ecx, esp
  '004EC3CB: mov eax, 00000008h
  '004EC3D0: push edi
  '004EC3D1: mov [ecx], eax
  '004EC3D3: mov eax, [ebp-30h]
  '004EC3D6: mov [ecx+04h], eax
  '004EC3D9: mov eax, 0041BC60h
  '004EC3DE: mov [ecx+08h], eax
  '004EC3E1: mov eax, [ebp-28h]
  '004EC3E4: mov [ecx+0Ch], eax
  '004EC3E7: call [edx+44h]
  '004EC3EA: test eax, eax
  '004EC3EC: fclex 
  '004EC3EE: jnl 4EC3FFh
  '004EC3F0: push 00000044h
  '004EC3F2: push 0041D9D0h
  '004EC3F7: push edi
  '004EC3F8: push eax
  '004EC3F9: call [004010A0h]
  '004EC3FF: mov ecx, [ebp-1Ch]
  '004EC402: lea edx, [esi+000000B4h]
  '004EC408: push ecx
  '004EC409: push edx
  '004EC40A: call [004010F8h]
  '004EC410: lea ecx, [ebp-1Ch]
  '004EC413: call [004013B8h]
  '004EC419: mov eax, [54238Ch]
  '004EC41E: test eax, eax
  '004EC420: jnz 4EC432h
  '004EC422: push 0054238Ch
  '004EC427: push 0041D9E0h
  '004EC42C: call [004012B8h]
  '004EC432: lea ebx, [ebp-1Ch]
  '004EC435: mov ecx, 0000000Ah
  '004EC43A: push ebx
  '004EC43B: mov [ebp-44h], ecx
  '004EC43E: sub esp, 00000010h
  '004EC441: mov eax, 80020004h
  '004EC446: mov ebx, esp
  '004EC448: mov [ebp-3Ch], eax
  '004EC44B: sub esp, 00000010h
  '004EC44E: mov edi, [0054238Ch]
  '004EC454: mov [ebx], ecx
  '004EC456: mov ecx, [ebp-70h]
  '004EC459: mov edx, [edi]
  '004EC45B: mov [ebx+04h], ecx
  '004EC45E: mov ecx, esp
  '004EC460: sub esp, 00000010h
  '004EC463: mov [ebx+08h], eax
  '004EC466: mov eax, [ebp-68h]
  '004EC469: mov [ebx+0Ch], eax
  '004EC46C: mov eax, 0000000Ah
  '004EC471: mov [ecx], eax
  '004EC473: mov eax, [ebp-60h]
  '004EC476: mov [ecx+04h], eax
  '004EC479: mov eax, 80020004h
  '004EC47E: mov [ecx+08h], eax
  '004EC481: mov eax, [ebp-58h]
  '004EC484: mov [ecx+0Ch], eax
  '004EC487: mov ecx, esp
  '004EC489: mov eax, 0000000Ah
  '004EC48E: sub esp, 00000010h
  '004EC491: mov [ecx], eax
  '004EC493: mov eax, [ebp-50h]
  '004EC496: mov [ecx+04h], eax
  '004EC499: mov eax, 80020004h
  '004EC49E: mov [ecx+08h], eax
  '004EC4A1: mov eax, [ebp-48h]
  '004EC4A4: mov [ecx+0Ch], eax
  '004EC4A7: mov eax, [ebp-44h]
  '004EC4AA: mov ecx, esp
  '004EC4AC: sub esp, 00000010h
  '004EC4AF: mov [ecx], eax
  '004EC4B1: mov eax, [ebp-40h]
  '004EC4B4: mov [ecx+04h], eax
  '004EC4B7: mov eax, [ebp-3Ch]
  '004EC4BA: mov [ecx+08h], eax
  '004EC4BD: mov eax, [ebp-38h]
  '004EC4C0: mov [ecx+0Ch], eax
  '004EC4C3: mov ecx, esp
  '004EC4C5: mov eax, 00000008h
  '004EC4CA: push edi
  '004EC4CB: mov [ecx], eax
  '004EC4CD: mov eax, [ebp-30h]
  '004EC4D0: mov [ecx+04h], eax
  '004EC4D3: mov eax, 0041BC60h
  '004EC4D8: mov [ecx+08h], eax
  '004EC4DB: mov eax, [ebp-28h]
  '004EC4DE: mov [ecx+0Ch], eax
  '004EC4E1: call [edx+44h]
  '004EC4E4: xor ebx, ebx
  '004EC4E6: cmp eax, ebx
  '004EC4E8: fclex 
  '004EC4EA: jnl 4EC4FBh
  '004EC4EC: push 00000044h
  '004EC4EE: push 0041D9D0h
  '004EC4F3: push edi
  '004EC4F4: push eax
  '004EC4F5: call [004010A0h]
  '004EC4FB: mov ecx, [ebp-1Ch]
  '004EC4FE: lea edx, [esi+000000B0h]
  '004EC504: push ecx
  '004EC505: push edx
  '004EC506: call [004010F8h]
  '004EC50C: lea ecx, [ebp-1Ch]
  '004EC50F: call [004013B8h]
  '004EC515: mov edi, [004012D8h]
  '004EC51B: mov edx, 0041BC60h
  '004EC520: lea ecx, [esi+000000FCh]
  '004EC526: call edi
  '004EC528: mov edx, 00427BF0h
  '004EC52D: lea ecx, [esi+00000110h]
  '004EC533: mov [esi+00000124h], 80000014h
  '004EC53D: mov [esi+00000128h], 80000016h
  '004EC547: mov word ptr [esi+00000120h], FFFFh
  '004EC550: call edi
  '004EC552: mov edx, 00427C20h
  '004EC557: lea ecx, [esi+00000114h]
  '004EC55D: call edi
  '004EC55F: mov word ptr [esi+0000010Eh], FFFFh
  '004EC568: mov [esi+0000010Ch], bx
  '004EC56F: mov [esi+00000108h], ebx
  '004EC575: mov [esi+00000106h], bx
  '004EC57C: mov word ptr [esi+00000102h], 0001h
  '004EC585: mov word ptr [esi+00000104h], 0008h
  '004EC58E: mov [ebp-04h], ebx
  '004EC591: push 004EC5BAh
  '004EC596: jmp 4EC5B9h
  '004EC598: lea ecx, [ebp-18h]
  '004EC59B: call [004013B4h]
  '004EC5A1: lea eax, [ebp-24h]
  '004EC5A4: lea ecx, [ebp-20h]
  '004EC5A7: push eax
  '004EC5A8: lea edx, [ebp-1Ch]
  '004EC5AB: push ecx
  '004EC5AC: push edx
  '004EC5AD: push 00000003h
  '004EC5AF: call [00401064h]
  '004EC5B5: add esp, 00000010h
  '004EC5B8: ret 
End Sub
Private Sub UserControl__4EF680
  '004EF680: push ebp
  '004EF681: mov ebp, esp
  '004EF683: sub esp, 0000000Ch
  '004EF686: push 004081B6h
  '004EF68B: mov eax, fs:[00h]
  '004EF691: push eax
  '004EF692: mov fs:[00000000h], esp
  '004EF699: sub esp, 0000000Ch
  '004EF69C: push ebx
  '004EF69D: push esi
  '004EF69E: push edi
  '004EF69F: mov [ebp-0Ch], esp
  '004EF6A2: mov [ebp-08h], 00405630h
  '004EF6A9: mov esi, [ebp+08h]
  '004EF6AC: mov eax, esi
  '004EF6AE: and eax, 00000001h
  '004EF6B1: mov [ebp-04h], eax
  '004EF6B4: and esi, FFFFFFFEh
  '004EF6B7: push esi
  '004EF6B8: mov [ebp+08h], esi
  '004EF6BB: mov ecx, [esi]
  '004EF6BD: call [ecx+04h]
  '004EF6C0: mov ecx, 00000001h
  '004EF6C5: call [00401208h]
  '004EF6CB: mov edx, [esi]
  '004EF6CD: push esi
  '004EF6CE: mov [esi+000000E8h], al
  '004EF6D4: call [edx+000007A4h]
  '004EF6DA: test eax, eax
  '004EF6DC: jnl 4EF6F0h
  '004EF6DE: push 000007A4h
  '004EF6E3: push 0042728Ch
  '004EF6E8: push esi
  '004EF6E9: push eax
  '004EF6EA: call [004010A0h]
  '004EF6F0: mov [ebp-04h], 00000000h
  '004EF6F7: mov eax, [ebp+08h]
  '004EF6FA: push eax
  '004EF6FB: mov ecx, [eax]
  '004EF6FD: call [ecx+08h]
  '004EF700: mov eax, [ebp-04h]
  '004EF703: mov ecx, [ebp-14h]
  '004EF706: pop edi
  '004EF707: pop esi
  '004EF708: mov fs:[00000000h], ecx
  '004EF70F: pop ebx
  '004EF710: mov esp, ebp
  '004EF712: pop ebp
  '004EF713: retn 0004h
End Sub
Private Sub UserControl__4EF720
  '004EF720: push ebp
  '004EF721: mov ebp, esp
  '004EF723: sub esp, 0000000Ch
  '004EF726: push 004081B6h
  '004EF72B: mov eax, fs:[00h]
  '004EF731: push eax
  '004EF732: mov fs:[00000000h], esp
  '004EF739: sub esp, 0000000Ch
  '004EF73C: push ebx
  '004EF73D: push esi
  '004EF73E: push edi
  '004EF73F: mov [ebp-0Ch], esp
  '004EF742: mov [ebp-08h], 00405638h
  '004EF749: mov esi, [ebp+08h]
  '004EF74C: mov eax, esi
  '004EF74E: and eax, 00000001h
  '004EF751: mov [ebp-04h], eax
  '004EF754: and esi, FFFFFFFEh
  '004EF757: push esi
  '004EF758: mov [ebp+08h], esi
  '004EF75B: mov ecx, [esi]
  '004EF75D: call [ecx+04h]
  '004EF760: mov edi, [00401208h]
  '004EF766: xor ecx, ecx
  '004EF768: call edi
  '004EF76A: xor ecx, ecx
  '004EF76C: mov [esi+000000E8h], al
  '004EF772: call edi
  '004EF774: mov edx, [esi]
  '004EF776: push esi
  '004EF777: mov [esi+000000E9h], al
  '004EF77D: call [edx+000007A4h]
  '004EF783: test eax, eax
  '004EF785: jnl 4EF799h
  '004EF787: push 000007A4h
  '004EF78C: push 0042728Ch
  '004EF791: push esi
  '004EF792: push eax
  '004EF793: call [004010A0h]
  '004EF799: mov [ebp-04h], 00000000h
  '004EF7A0: mov eax, [ebp+08h]
  '004EF7A3: push eax
  '004EF7A4: mov ecx, [eax]
  '004EF7A6: call [ecx+08h]
  '004EF7A9: mov eax, [ebp-04h]
  '004EF7AC: mov ecx, [ebp-14h]
  '004EF7AF: pop edi
  '004EF7B0: pop esi
  '004EF7B1: mov fs:[00000000h], ecx
  '004EF7B8: pop ebx
  '004EF7B9: mov esp, ebp
  '004EF7BB: pop ebp
  '004EF7BC: retn 0004h
End Sub
Private Sub UserControl__4EF5F0
  '004EF5F0: push ebp
  '004EF5F1: mov ebp, esp
  '004EF5F3: sub esp, 0000000Ch
  '004EF5F6: push 004081B6h
  '004EF5FB: mov eax, fs:[00h]
  '004EF601: push eax
  '004EF602: mov fs:[00000000h], esp
  '004EF609: sub esp, 0000000Ch
  '004EF60C: push ebx
  '004EF60D: push esi
  '004EF60E: push edi
  '004EF60F: mov [ebp-0Ch], esp
  '004EF612: mov [ebp-08h], 00405628h
  '004EF619: mov esi, [ebp+08h]
  '004EF61C: mov eax, esi
  '004EF61E: and eax, 00000001h
  '004EF621: mov [ebp-04h], eax
  '004EF624: and esi, FFFFFFFEh
  '004EF627: push esi
  '004EF628: mov [ebp+08h], esi
  '004EF62B: mov ecx, [esi]
  '004EF62D: call [ecx+04h]
  '004EF630: mov edx, [esi]
  '004EF632: push esi
  '004EF633: call [edx+000007A4h]
  '004EF639: test eax, eax
  '004EF63B: jnl 4EF64Fh
  '004EF63D: push 000007A4h
  '004EF642: push 0042728Ch
  '004EF647: push esi
  '004EF648: push eax
  '004EF649: call [004010A0h]
  '004EF64F: mov [ebp-04h], 00000000h
  '004EF656: mov eax, [ebp+08h]
  '004EF659: push eax
  '004EF65A: mov ecx, [eax]
  '004EF65C: call [ecx+08h]
  '004EF65F: mov eax, [ebp-04h]
  '004EF662: mov ecx, [ebp-14h]
  '004EF665: pop edi
  '004EF666: pop esi
  '004EF667: mov fs:[00000000h], ecx
  '004EF66E: pop ebx
  '004EF66F: mov esp, ebp
  '004EF671: pop ebp
  '004EF672: retn 0008h
End Sub
Private Sub UserControl__4EF530
  '004EF530: push ebp
  '004EF531: mov ebp, esp
  '004EF533: sub esp, 0000000Ch
  '004EF536: push 004081B6h
  '004EF53B: mov eax, fs:[00h]
  '004EF541: push eax
  '004EF542: mov fs:[00000000h], esp
  '004EF549: sub esp, 00000010h
  '004EF54C: push ebx
  '004EF54D: push esi
  '004EF54E: push edi
  '004EF54F: mov [ebp-0Ch], esp
  '004EF552: mov [ebp-08h], 00405620h
  '004EF559: mov esi, [ebp+08h]
  '004EF55C: mov eax, esi
  '004EF55E: and eax, 00000001h
  '004EF561: mov [ebp-04h], eax
  '004EF564: and esi, FFFFFFFEh
  '004EF567: push esi
  '004EF568: mov [ebp+08h], esi
  '004EF56B: mov ecx, [esi]
  '004EF56D: call [ecx+04h]
  '004EF570: mov edx, [esi]
  '004EF572: lea eax, [ebp-18h]
  '004EF575: xor edi, edi
  '004EF577: push eax
  '004EF578: push esi
  '004EF579: mov [ebp-18h], edi
  '004EF57C: call [edx+000007A8h]
  '004EF582: cmp eax, edi
  '004EF584: fclex 
  '004EF586: jnl 4EF59Ah
  '004EF588: push 000007A8h
  '004EF58D: push 0042728Ch
  '004EF592: push esi
  '004EF593: push eax
  '004EF594: call [004010A0h]
  '004EF59A: cmp [ebp-18h], di
  '004EF59E: jz 4EF5CCh
  '004EF5A0: push edi
  '004EF5A1: push 00000001h
  '004EF5A3: push esi
  '004EF5A4: call [00401060h]
  '004EF5AA: mov ecx, [esi]
  '004EF5AC: add esp, 0000000Ch
  '004EF5AF: push esi
  '004EF5B0: call [ecx+000007D4h]
  '004EF5B6: cmp eax, edi
  '004EF5B8: jnl 4EF5CCh
  '004EF5BA: push 000007D4h
  '004EF5BF: push 0042728Ch
  '004EF5C4: push esi
  '004EF5C5: push eax
  '004EF5C6: call [004010A0h]
  '004EF5CC: mov [ebp-04h], edi
  '004EF5CF: mov eax, [ebp+08h]
  '004EF5D2: push eax
  '004EF5D3: mov edx, [eax]
  '004EF5D5: call [edx+08h]
  '004EF5D8: mov eax, [ebp-04h]
  '004EF5DB: mov ecx, [ebp-14h]
  '004EF5DE: pop edi
  '004EF5DF: pop esi
  '004EF5E0: mov fs:[00000000h], ecx
  '004EF5E7: pop ebx
  '004EF5E8: mov esp, ebp
  '004EF5EA: pop ebp
  '004EF5EB: retn 0008h
End Sub
Private Sub g_Font_IAT_4011E8
  Call IAT.4011E8
End Sub
Private Sub OverTimer__4F2BA0
  '004F2BA0: push ebp
  '004F2BA1: mov ebp, esp
  '004F2BA3: sub esp, 0000000Ch
  '004F2BA6: push 004081B6h
  '004F2BAB: mov eax, fs:[00h]
  '004F2BB1: push eax
  '004F2BB2: mov fs:[00000000h], esp
  '004F2BB9: sub esp, 00000034h
  '004F2BBC: push ebx
  '004F2BBD: push esi
  '004F2BBE: push edi
  '004F2BBF: mov [ebp-0Ch], esp
  '004F2BC2: mov [ebp-08h], 00405760h
  '004F2BC9: mov esi, [ebp+08h]
  '004F2BCC: mov eax, esi
  '004F2BCE: and eax, 00000001h
  '004F2BD1: mov [ebp-04h], eax
  '004F2BD4: and esi, FFFFFFFEh
  '004F2BD7: push esi
  '004F2BD8: mov [ebp+08h], esi
  '004F2BDB: mov ecx, [esi]
  '004F2BDD: call [ecx+04h]
  '004F2BE0: xor edx, edx
  '004F2BE2: lea eax, [ebp-1Ch]
  '004F2BE5: mov [ebp-1Ch], edx
  '004F2BE8: xor edi, edi
  '004F2BEA: push eax
  '004F2BEB: mov [ebp-18h], edx
  '004F2BEE: mov [ebp-20h], edi
  '004F2BF1: mov [ebp-30h], edi
  '004F2BF4: mov [ebp-34h], edi
  '004F2BF7: call 0041E324h
  '004F2BFC: call [0040109Ch]
  '004F2C02: mov ecx, [esi]
  '004F2C04: lea edx, [ebp-34h]
  '004F2C07: push edx
  '004F2C08: push esi
  '004F2C09: call [ecx+000007B8h]
  '004F2C0F: cmp eax, edi
  '004F2C11: jnl 4F2C29h
  '004F2C13: mov ebx, [004010A0h]
  '004F2C19: push 000007B8h
  '004F2C1E: push 0042728Ch
  '004F2C23: push esi
  '004F2C24: push eax
  '004F2C25: call ebx
  '004F2C27: jmp 4F2C2Fh
  '004F2C29: mov ebx, [004010A0h]
  '004F2C2F: mov eax, [ebp-18h]
  '004F2C32: mov ecx, [ebp-1Ch]
  '004F2C35: push eax
  '004F2C36: push ecx
  '004F2C37: call 00427984h
  '004F2C3C: mov edi, eax
  '004F2C3E: call [0040109Ch]
  '004F2C44: cmp [ebp-34h], edi
  '004F2C47: jz 004F2D2Eh
  '004F2C4D: mov edx, [esi]
  '004F2C4F: push esi
  '004F2C50: call [edx+000003A8h]
  '004F2C56: push eax
  '004F2C57: lea eax, [ebp-20h]
  '004F2C5A: push eax
  '004F2C5B: call [004010E4h]
  '004F2C61: mov edi, eax
  '004F2C63: push 00000000h
  '004F2C65: push edi
  '004F2C66: mov ecx, [edi]
  '004F2C68: call [ecx+5Ch]
  '004F2C6B: test eax, eax
  '004F2C6D: fclex 
  '004F2C6F: jnl 4F2C7Ch
  '004F2C71: push 0000005Ch
  '004F2C73: push 0041E5CCh
  '004F2C78: push edi
  '004F2C79: push eax
  '004F2C7A: call ebx
  '004F2C7C: lea ecx, [ebp-20h]
  '004F2C7F: call [004013B8h]
  '004F2C85: mov edi, [00401208h]
  '004F2C8B: xor ecx, ecx
  '004F2C8D: call edi
  '004F2C8F: mov edx, [esi+000000B0h]
  '004F2C95: mov [esi+000000EAh], al
  '004F2C9B: lea eax, [esi+000000C4h]
  '004F2CA1: push edx
  '004F2CA2: push eax
  '004F2CA3: call [004010F8h]
  '004F2CA9: sub esp, 00000010h
  '004F2CAC: mov ecx, 00004002h
  '004F2CB1: mov edx, esp
  '004F2CB3: lea eax, [esi+000000EEh]
  '004F2CB9: push 00000001h
  '004F2CBB: push 00000009h
  '004F2CBD: mov [edx], ecx
  '004F2CBF: mov ecx, [ebp-2Ch]
  '004F2CC2: push esi
  '004F2CC3: mov [edx+04h], ecx
  '004F2CC6: mov [edx+08h], eax
  '004F2CC9: mov eax, [ebp-24h]
  '004F2CCC: mov [edx+0Ch], eax
  '004F2CCF: call [00401060h]
  '004F2CD5: mov ecx, [esi]
  '004F2CD7: add esp, 0000001Ch
  '004F2CDA: push esi
  '004F2CDB: call [ecx+000007A4h]
  '004F2CE1: test eax, eax
  '004F2CE3: jnl 4F2CF3h
  '004F2CE5: push 000007A4h
  '004F2CEA: push 0042728Ch
  '004F2CEF: push esi
  '004F2CF0: push eax
  '004F2CF1: call ebx
  '004F2CF3: cmp byte ptr [esi+000000E9h], 01h
  '004F2CFA: jnz 4F2D2Eh
  '004F2CFC: xor ecx, ecx
  '004F2CFE: call edi
  '004F2D00: mov edx, [esi]
  '004F2D02: push esi
  '004F2D03: mov [esi+000000E9h], al
  '004F2D09: call [edx+000007A4h]
  '004F2D0F: test eax, eax
  '004F2D11: jnl 4F2D21h
  '004F2D13: push 000007A4h
  '004F2D18: push 0042728Ch
  '004F2D1D: push esi
  '004F2D1E: push eax
  '004F2D1F: call ebx
  '004F2D21: mov ecx, 00000001h
  '004F2D26: call edi
  '004F2D28: mov [esi+000000E9h], al
  '004F2D2E: mov [ebp-04h], 00000000h
  '004F2D35: push 004F2D47h
  '004F2D3A: jmp 4F2D46h
  '004F2D3C: lea ecx, [ebp-20h]
  '004F2D3F: call [004013B8h]
  '004F2D45: ret 
End Sub
Private Sub unknown_4EFA10
  '004EFA10: push ebp
  '004EFA11: mov ebp, esp
  '004EFA13: sub esp, 0000000Ch
  '004EFA16: push 004081B6h
  '004EFA1B: mov eax, fs:[00h]
  '004EFA21: push eax
  '004EFA22: mov fs:[00000000h], esp
  '004EFA29: sub esp, 00000010h
  '004EFA2C: push ebx
  '004EFA2D: push esi
  '004EFA2E: push edi
  '004EFA2F: mov [ebp-0Ch], esp
  '004EFA32: mov [ebp-08h], 00405650h
  '004EFA39: xor ebx, ebx
  '004EFA3B: mov [ebp-04h], ebx
  '004EFA3E: mov esi, [ebp+08h]
  '004EFA41: push esi
  '004EFA42: mov eax, [esi]
  '004EFA44: call [eax+04h]
  '004EFA47: mov ecx, [esi]
  '004EFA49: push FFFFFFFFh
  '004EFA4B: push esi
  '004EFA4C: mov [ebp-18h], ebx
  '004EFA4F: call [ecx+0000014Ch]
  '004EFA55: cmp eax, ebx
  '004EFA57: fclex 
  '004EFA59: jnl 4EFA71h
  '004EFA5B: mov edi, [004010A0h]
  '004EFA61: push 0000014Ch
  '004EFA66: push 0042725Ch
  '004EFA6B: push esi
  '004EFA6C: push eax
  '004EFA6D: call edi
  '004EFA6F: jmp 4EFA77h
  '004EFA71: mov edi, [004010A0h]
  '004EFA77: mov eax, [esi+10h]
  '004EFA7A: push eax
  '004EFA7B: mov edx, [eax]
  '004EFA7D: call [edx+0000035Ch]
  '004EFA83: cmp eax, ebx
  '004EFA85: fclex 
  '004EFA87: jnl 4EFA9Ah
  '004EFA89: mov ecx, [esi+10h]
  '004EFA8C: push 0000035Ch
  '004EFA91: push 0042725Ch
  '004EFA96: push ecx
  '004EFA97: push eax
  '004EFA98: call edi
  '004EFA9A: mov edx, [esi]
  '004EFA9C: push esi
  '004EFA9D: call [edx+000008E8h]
  '004EFAA3: cmp [esi+000000C0h], 00000004h
  '004EFAAA: jz 4EFAB5h
  '004EFAAC: mov eax, [esi]
  '004EFAAE: push esi
  '004EFAAF: call [eax+000008ECh]
  '004EFAB5: mov ecx, [esi]
  '004EFAB7: push esi
  '004EFAB8: call [ecx+000008A0h]
  '004EFABE: mov edx, [esi]
  '004EFAC0: push esi
  '004EFAC1: call [edx+00000908h]
  '004EFAC7: cmp byte ptr [esi+000000E8h], 01h
  '004EFACE: jnz 4EFB19h
  '004EFAD0: cmp [esi+00000100h], bx
  '004EFAD7: jz 4EFB19h
  '004EFAD9: cmp [esi+000000C0h], 00000003h
  '004EFAE0: jz 4EFB19h
  '004EFAE2: mov eax, [esi]
  '004EFAE4: lea ecx, [ebp-18h]
  '004EFAE7: push ecx
  '004EFAE8: push esi
  '004EFAE9: call [eax+000000D8h]
  '004EFAEF: cmp eax, ebx
  '004EFAF1: fclex 
  '004EFAF3: jnl 4EFB03h
  '004EFAF5: push 000000D8h
  '004EFAFA: push 0042725Ch
  '004EFAFF: push esi
  '004EFB00: push eax
  '004EFB01: call edi
  '004EFB03: mov eax, [ebp-18h]
  '004EFB06: lea edx, [esi+00000088h]
  '004EFB0C: push edx
  '004EFB0D: push eax
  '004EFB0E: call 00427A34h
  '004EFB13: call [0040109Ch]
  '004EFB19: mov ecx, [esi]
  '004EFB1B: push esi
  '004EFB1C: call [ecx+000008FCh]
  '004EFB22: mov edx, [esi]
  '004EFB24: push ebx
  '004EFB25: push esi
  '004EFB26: call [edx+0000014Ch]
  '004EFB2C: cmp eax, ebx
  '004EFB2E: fclex 
  '004EFB30: jnl 4EFB40h
  '004EFB32: push 0000014Ch
  '004EFB37: push 0042725Ch
  '004EFB3C: push esi
  '004EFB3D: push eax
  '004EFB3E: call edi
  '004EFB40: mov eax, [ebp+08h]
  '004EFB43: push eax
  '004EFB44: mov ecx, [eax]
  '004EFB46: call [ecx+08h]
  '004EFB49: mov eax, [ebp-04h]
  '004EFB4C: mov ecx, [ebp-14h]
  '004EFB4F: pop edi
  '004EFB50: pop esi
  '004EFB51: mov fs:[00000000h], ecx
  '004EFB58: pop ebx
  '004EFB59: mov esp, ebp
  '004EFB5B: pop ebp
  '004EFB5C: retn 0004h
End Sub
Private Sub unknown_4F0660
  '004F0660: push ebp
  '004F0661: mov ebp, esp
  '004F0663: sub esp, 0000000Ch
  '004F0666: push 004081B6h
  '004F066B: mov eax, fs:[00h]
  '004F0671: push eax
  '004F0672: mov fs:[00000000h], esp
  '004F0679: sub esp, 00000014h
  '004F067C: push ebx
  '004F067D: push esi
  '004F067E: push edi
  '004F067F: mov [ebp-0Ch], esp
  '004F0682: mov [ebp-08h], 004056A8h
  '004F0689: xor edi, edi
  '004F068B: mov [ebp-04h], edi
  '004F068E: mov esi, [ebp+08h]
  '004F0691: push esi
  '004F0692: mov eax, [esi]
  '004F0694: call [eax+04h]
  '004F0697: mov eax, [esi+10h]
  '004F069A: lea edx, [ebp-1Ch]
  '004F069D: mov [ebp-1Ch], edi
  '004F06A0: push edx
  '004F06A1: mov ecx, [eax]
  '004F06A3: push eax
  '004F06A4: mov [ebp-18h], edi
  '004F06A7: call [ecx+00000090h]
  '004F06AD: cmp eax, edi
  '004F06AF: fclex 
  '004F06B1: jnl 4F06C8h
  '004F06B3: mov ecx, [esi+10h]
  '004F06B6: push 00000090h
  '004F06BB: push 0042725Ch
  '004F06C0: push ecx
  '004F06C1: push eax
  '004F06C2: call [004010A0h]
  '004F06C8: mov edx, [ebp-1Ch]
  '004F06CB: mov [ebp-18h], edx
  '004F06CE: mov eax, [ebp+08h]
  '004F06D1: push eax
  '004F06D2: mov ecx, [eax]
  '004F06D4: call [ecx+08h]
  '004F06D7: mov edx, [ebp+0Ch]
  '004F06DA: mov ax, [ebp-18h]
  '004F06DE: mov [edx], ax
  '004F06E1: mov eax, [ebp-04h]
  '004F06E4: mov ecx, [ebp-14h]
  '004F06E7: pop edi
  '004F06E8: pop esi
  '004F06E9: mov fs:[00000000h], ecx
  '004F06F0: pop ebx
  '004F06F1: mov esp, ebp
  '004F06F3: pop ebp
  '004F06F4: retn 0008h
End Sub
Private Sub unknown_4F0700
  '004F0700: push ebp
  '004F0701: mov ebp, esp
  '004F0703: sub esp, 0000000Ch
  '004F0706: push 004081B6h
  '004F070B: mov eax, fs:[00h]
  '004F0711: push eax
  '004F0712: mov fs:[00000000h], esp
  '004F0719: sub esp, 0000001Ch
  '004F071C: push ebx
  '004F071D: push esi
  '004F071E: push edi
  '004F071F: mov [ebp-0Ch], esp
  '004F0722: mov [ebp-08h], 004056B0h
  '004F0729: mov [ebp-04h], 00000000h
  '004F0730: mov esi, [ebp+08h]
  '004F0733: push esi
  '004F0734: mov eax, [esi]
  '004F0736: call [eax+04h]
  '004F0739: mov eax, [esi+10h]
  '004F073C: mov edx, [ebp+0Ch]
  '004F073F: push edx
  '004F0740: push eax
  '004F0741: mov ecx, [eax]
  '004F0743: call [ecx+00000094h]
  '004F0749: test eax, eax
  '004F074B: fclex 
  '004F074D: jnl 4F0768h
  '004F074F: mov ecx, [esi+10h]
  '004F0752: mov edi, [004010A0h]
  '004F0758: push 00000094h
  '004F075D: push 0042725Ch
  '004F0762: push ecx
  '004F0763: push eax
  '004F0764: call edi
  '004F0766: jmp 4F076Eh
  '004F0768: mov edi, [004010A0h]
  '004F076E: sub esp, 00000010h
  '004F0771: mov ecx, 00000008h
  '004F0776: mov ebx, esp
  '004F0778: mov edx, [esi]
  '004F077A: mov eax, 00427E0Ch
  '004F077F: push esi
  '004F0780: mov [ebx], ecx
  '004F0782: mov ecx, [ebp-20h]
  '004F0785: mov [ebx+04h], ecx
  '004F0788: mov [ebx+08h], eax
  '004F078B: mov eax, [ebp-18h]
  '004F078E: mov [ebx+0Ch], eax
  '004F0791: call [edx+00000390h]
  '004F0797: test eax, eax
  '004F0799: fclex 
  '004F079B: jnl 4F07ABh
  '004F079D: push 00000390h
  '004F07A2: push 0042725Ch
  '004F07A7: push esi
  '004F07A8: push eax
  '004F07A9: call edi
  '004F07AB: mov ecx, [esi]
  '004F07AD: push esi
  '004F07AE: call [ecx+000007A4h]
  '004F07B4: test eax, eax
  '004F07B6: jnl 4F07C6h
  '004F07B8: push 000007A4h
  '004F07BD: push 0042728Ch
  '004F07C2: push esi
  '004F07C3: push eax
  '004F07C4: call edi
  '004F07C6: mov eax, [ebp+08h]
  '004F07C9: push eax
  '004F07CA: mov edx, [eax]
  '004F07CC: call [edx+08h]
  '004F07CF: mov eax, [ebp-04h]
  '004F07D2: mov ecx, [ebp-14h]
  '004F07D5: pop edi
  '004F07D6: pop esi
  '004F07D7: mov fs:[00000000h], ecx
  '004F07DE: pop ebx
  '004F07DF: mov esp, ebp
  '004F07E1: pop ebp
  '004F07E2: retn 0008h
End Sub
Private Sub unknown_4F07F0
  '004F07F0: push ebp
  '004F07F1: mov ebp, esp
  '004F07F3: sub esp, 0000000Ch
  '004F07F6: push 004081B6h
  '004F07FB: mov eax, fs:[00h]
  '004F0801: push eax
  '004F0802: mov fs:[00000000h], esp
  '004F0809: sub esp, 00000018h
  '004F080C: push ebx
  '004F080D: push esi
  '004F080E: push edi
  '004F080F: mov [ebp-0Ch], esp
  '004F0812: mov [ebp-08h], 004056B8h
  '004F0819: xor edi, edi
  '004F081B: mov [ebp-04h], edi
  '004F081E: mov esi, [ebp+08h]
  '004F0821: push esi
  '004F0822: mov eax, [esi]
  '004F0824: call [eax+04h]
  '004F0827: mov ecx, [ebp+0Ch]
  '004F082A: lea eax, [ebp-1Ch]
  '004F082D: push eax
  '004F082E: push esi
  '004F082F: mov [ecx], edi
  '004F0831: mov edx, [esi]
  '004F0833: mov [ebp-18h], edi
  '004F0836: mov [ebp-1Ch], edi
  '004F0839: call [edx+00000938h]
  '004F083F: cmp eax, edi
  '004F0841: fclex 
  '004F0843: jnl 4F0857h
  '004F0845: push 00000938h
  '004F084A: push 0042728Ch
  '004F084F: push esi
  '004F0850: push eax
  '004F0851: call [004010A0h]
  '004F0857: mov eax, [ebp-1Ch]
  '004F085A: lea ecx, [ebp-18h]
  '004F085D: push eax
  '004F085E: push ecx
  '004F085F: mov [ebp-1Ch], edi
  '004F0862: call [004010E4h]
  '004F0868: push 004F0889h
  '004F086D: jmp 4F0888h
  '004F086F: test byte ptr [ebp-04h], 04h
  '004F0873: jz 4F087Eh
  '004F0875: lea ecx, [ebp-18h]
  '004F0878: call [004013B8h]
  '004F087E: lea ecx, [ebp-1Ch]
  '004F0881: call [004013B8h]
  '004F0887: ret 
End Sub
Private Sub unknown_4F08B0
  '004F08B0: push ebp
  '004F08B1: mov ebp, esp
  '004F08B3: sub esp, 0000000Ch
  '004F08B6: push 004081B6h
  '004F08BB: mov eax, fs:[00h]
  '004F08C1: push eax
  '004F08C2: mov fs:[00000000h], esp
  '004F08C9: sub esp, 0000005Ch
  '004F08CC: push ebx
  '004F08CD: push esi
  '004F08CE: push edi
  '004F08CF: mov [ebp-0Ch], esp
  '004F08D2: mov [ebp-08h], 004056C8h
  '004F08D9: xor edi, edi
  '004F08DB: mov [ebp-04h], edi
  '004F08DE: mov esi, [ebp+08h]
  '004F08E1: push esi
  '004F08E2: mov eax, [esi]
  '004F08E4: call [eax+04h]
  '004F08E7: mov ecx, [ebp+0Ch]
  '004F08EA: lea edx, [ebp-18h]
  '004F08ED: push ecx
  '004F08EE: push edx
  '004F08EF: mov [ebp-18h], edi
  '004F08F2: mov [ebp-1Ch], edi
  '004F08F5: mov [ebp-2Ch], edi
  '004F08F8: mov [ebp-3Ch], edi
  '004F08FB: mov [ebp-4Ch], edi
  '004F08FE: mov [ebp-64h], edi
  '004F0901: call [004010F8h]
  '004F0907: mov eax, [esi]
  '004F0909: lea ecx, [ebp-1Ch]
  '004F090C: push ecx
  '004F090D: push esi
  '004F090E: call [eax+00000938h]
  '004F0914: cmp eax, edi
  '004F0916: fclex 
  '004F0918: jnl 4F092Ch
  '004F091A: push 00000938h
  '004F091F: push 0042728Ch
  '004F0924: push esi
  '004F0925: push eax
  '004F0926: call [004010A0h]
  '004F092C: mov eax, [ebp-1Ch]
  '004F092F: lea edx, [ebp-64h]
  '004F0932: push eax
  '004F0933: push edx
  '004F0934: mov [ebp-1Ch], edi
  '004F0937: call [004010E4h]
  '004F093D: mov eax, [ebp-18h]
  '004F0940: mov esi, [004011E4h]
  '004F0946: push edi
  '004F0947: push edi
  '004F0948: lea ecx, [ebp-2Ch]
  '004F094B: push eax
  '004F094C: push ecx
  '004F094D: call esi
  '004F094F: add esp, 00000010h
  '004F0952: push eax
  '004F0953: call [0040103Ch]
  '004F0959: sub esp, 00000010h
  '004F095C: mov ecx, 00000008h
  '004F0961: mov edx, esp
  '004F0963: mov [ebp-3Ch], ecx
  '004F0966: mov [ebp-34h], eax
  '004F0969: push edi
  '004F096A: mov [edx], ecx
  '004F096C: mov ecx, [ebp-38h]
  '004F096F: mov edi, [0040139Ch]
  '004F0975: mov [edx+04h], ecx
  '004F0978: mov ecx, [ebp-64h]
  '004F097B: push ecx
  '004F097C: mov [edx+08h], eax
  '004F097F: mov eax, [ebp-30h]
  '004F0982: mov [edx+0Ch], eax
  '004F0985: call edi
  '004F0987: mov ebx, [00401050h]
  '004F098D: lea edx, [ebp-3Ch]
  '004F0990: lea eax, [ebp-2Ch]
  '004F0993: push edx
  '004F0994: push eax
  '004F0995: push 00000002h
  '004F0997: call ebx
  '004F0999: mov ecx, [ebp-18h]
  '004F099C: push 00000000h
  '004F099E: push 00000002h
  '004F09A0: lea edx, [ebp-2Ch]
  '004F09A3: push ecx
  '004F09A4: push edx
  '004F09A5: call esi
  '004F09A7: add esp, 0000001Ch
  '004F09AA: push eax
  '004F09AB: call [00401160h]
  '004F09B1: sub esp, 00000010h
  '004F09B4: mov [ebp-40h], edx
  '004F09B7: mov edx, esp
  '004F09B9: mov ecx, 00000006h
  '004F09BE: mov [ebp-4Ch], ecx
  '004F09C1: mov [ebp-44h], eax
  '004F09C4: mov [edx], ecx
  '004F09C6: mov ecx, [ebp-48h]
  '004F09C9: push 00000002h
  '004F09CB: mov [edx+04h], ecx
  '004F09CE: mov ecx, [ebp-64h]
  '004F09D1: push ecx
  '004F09D2: mov [edx+08h], eax
  '004F09D5: mov eax, [ebp-40h]
  '004F09D8: mov [edx+0Ch], eax
  '004F09DB: call edi
  '004F09DD: lea ecx, [ebp-2Ch]
  '004F09E0: call [00401030h]
  '004F09E6: mov edx, [ebp-18h]
  '004F09E9: push 00000000h
  '004F09EB: push 00000003h
  '004F09ED: lea eax, [ebp-2Ch]
  '004F09F0: push edx
  '004F09F1: push eax
  '004F09F2: call esi
  '004F09F4: add esp, 00000010h
  '004F09F7: push eax
  '004F09F8: call [00401114h]
  '004F09FE: mov [ebp-44h], ax
  '004F0A02: mov eax, 0000000Bh
  '004F0A07: mov [ebp-4Ch], eax
  '004F0A0A: mov edx, [ebp-48h]
  '004F0A0D: sub esp, 00000010h
  '004F0A10: mov ecx, esp
  '004F0A12: push 00000003h
  '004F0A14: mov [ecx], eax
  '004F0A16: mov eax, [ebp-44h]
  '004F0A19: mov [ecx+04h], edx
  '004F0A1C: mov edx, [ebp-40h]
  '004F0A1F: mov [ecx+08h], eax
  '004F0A22: mov eax, [ebp-64h]
  '004F0A25: push eax
  '004F0A26: mov [ecx+0Ch], edx
  '004F0A29: call edi
  '004F0A2B: lea ecx, [ebp-4Ch]
  '004F0A2E: lea edx, [ebp-2Ch]
  '004F0A31: push ecx
  '004F0A32: push edx
  '004F0A33: push 00000002h
  '004F0A35: call ebx
  '004F0A37: mov eax, [ebp-18h]
  '004F0A3A: push 00000000h
  '004F0A3C: push 00000004h
  '004F0A3E: lea ecx, [ebp-2Ch]
  '004F0A41: push eax
  '004F0A42: push ecx
  '004F0A43: call esi
  '004F0A45: add esp, 0000001Ch
  '004F0A48: push eax
  '004F0A49: call [00401114h]
  '004F0A4F: sub esp, 00000010h
  '004F0A52: mov [ebp-44h], ax
  '004F0A56: mov ecx, [ebp-44h]
  '004F0A59: mov edx, esp
  '004F0A5B: mov eax, 0000000Bh
  '004F0A60: push 00000004h
  '004F0A62: mov [ebp-4Ch], eax
  '004F0A65: mov [edx], eax
  '004F0A67: mov eax, [ebp-48h]
  '004F0A6A: mov [edx+04h], eax
  '004F0A6D: mov eax, [ebp-40h]
  '004F0A70: mov [edx+08h], ecx
  '004F0A73: mov ecx, [ebp-64h]
  '004F0A76: push ecx
  '004F0A77: mov [edx+0Ch], eax
  '004F0A7A: call edi
  '004F0A7C: lea edx, [ebp-4Ch]
  '004F0A7F: lea eax, [ebp-2Ch]
  '004F0A82: push edx
  '004F0A83: push eax
  '004F0A84: push 00000002h
  '004F0A86: call ebx
  '004F0A88: mov ecx, [ebp-18h]
  '004F0A8B: push 00000000h
  '004F0A8D: push 00000005h
  '004F0A8F: lea edx, [ebp-2Ch]
  '004F0A92: push ecx
  '004F0A93: push edx
  '004F0A94: call esi
  '004F0A96: add esp, 0000001Ch
  '004F0A99: push eax
  '004F0A9A: call [00401114h]
  '004F0AA0: mov edx, [ebp-48h]
  '004F0AA3: sub esp, 00000010h
  '004F0AA6: mov [ebp-44h], ax
  '004F0AAA: mov ecx, esp
  '004F0AAC: mov eax, 0000000Bh
  '004F0AB1: push 00000005h
  '004F0AB3: mov [ecx], eax
  '004F0AB5: mov [ebp-4Ch], eax
  '004F0AB8: mov eax, [ebp-44h]
  '004F0ABB: mov [ecx+04h], edx
  '004F0ABE: mov edx, [ebp-40h]
  '004F0AC1: mov [ecx+08h], eax
  '004F0AC4: mov eax, [ebp-64h]
  '004F0AC7: push eax
  '004F0AC8: mov [ecx+0Ch], edx
  '004F0ACB: call edi
  '004F0ACD: lea ecx, [ebp-4Ch]
  '004F0AD0: lea edx, [ebp-2Ch]
  '004F0AD3: push ecx
  '004F0AD4: push edx
  '004F0AD5: push 00000002h
  '004F0AD7: call ebx
  '004F0AD9: mov eax, [ebp-18h]
  '004F0ADC: push 00000000h
  '004F0ADE: push 00000006h
  '004F0AE0: lea ecx, [ebp-2Ch]
  '004F0AE3: push eax
  '004F0AE4: push ecx
  '004F0AE5: call esi
  '004F0AE7: add esp, 0000001Ch
  '004F0AEA: push eax
  '004F0AEB: call [00401114h]
  '004F0AF1: sub esp, 00000010h
  '004F0AF4: mov [ebp-44h], ax
  '004F0AF8: mov ecx, [ebp-44h]
  '004F0AFB: mov edx, esp
  '004F0AFD: mov eax, 0000000Bh
  '004F0B02: push 00000006h
  '004F0B04: mov [ebp-4Ch], eax
  '004F0B07: mov [edx], eax
  '004F0B09: mov eax, [ebp-48h]
  '004F0B0C: mov [edx+04h], eax
  '004F0B0F: mov eax, [ebp-40h]
  '004F0B12: mov [edx+08h], ecx
  '004F0B15: mov ecx, [ebp-64h]
  '004F0B18: push ecx
  '004F0B19: mov [edx+0Ch], eax
  '004F0B1C: call edi
  '004F0B1E: lea edx, [ebp-4Ch]
  '004F0B21: lea eax, [ebp-2Ch]
  '004F0B24: push edx
  '004F0B25: push eax
  '004F0B26: push 00000002h
  '004F0B28: call ebx
  '004F0B2A: add esp, 0000000Ch
  '004F0B2D: lea ecx, [ebp-64h]
  '004F0B30: push 00000000h
  '004F0B32: push ecx
  '004F0B33: call [004010F8h]
  '004F0B39: sub esp, 00000010h
  '004F0B3C: mov esi, [ebp+08h]
  '004F0B3F: mov edi, esp
  '004F0B41: mov ecx, 00000008h
  '004F0B46: mov edx, [esi]
  '004F0B48: mov [ebp-4Ch], ecx
  '004F0B4B: mov [edi], ecx
  '004F0B4D: mov ecx, [ebp-48h]
  '004F0B50: mov eax, 00427DC4h
  '004F0B55: push esi
  '004F0B56: mov [edi+04h], ecx
  '004F0B59: mov [ebp-44h], eax
  '004F0B5C: mov [edi+08h], eax
  '004F0B5F: mov eax, [ebp-40h]
  '004F0B62: mov [edi+0Ch], eax
  '004F0B65: call [edx+00000390h]
  '004F0B6B: test eax, eax
  '004F0B6D: fclex 
  '004F0B6F: jnl 4F0B83h
  '004F0B71: push 00000390h
  '004F0B76: push 0042725Ch
  '004F0B7B: push esi
  '004F0B7C: push eax
  '004F0B7D: call [004010A0h]
  '004F0B83: push 004F0BB8h
  '004F0B88: jmp 4F0BA7h
  '004F0B8A: lea ecx, [ebp-1Ch]
  '004F0B8D: call [004013B8h]
  '004F0B93: lea ecx, [ebp-3Ch]
  '004F0B96: lea edx, [ebp-2Ch]
  '004F0B99: push ecx
  '004F0B9A: push edx
  '004F0B9B: push 00000002h
  '004F0B9D: call [00401050h]
  '004F0BA3: add esp, 0000000Ch
  '004F0BA6: ret 
End Sub
Private Sub unknown_4F0D10
  '004F0D10: push ebp
  '004F0D11: mov ebp, esp
  '004F0D13: sub esp, 0000000Ch
  '004F0D16: push 004081B6h
  '004F0D1B: mov eax, fs:[00h]
  '004F0D21: push eax
  '004F0D22: mov fs:[00000000h], esp
  '004F0D29: sub esp, 00000014h
  '004F0D2C: push ebx
  '004F0D2D: push esi
  '004F0D2E: push edi
  '004F0D2F: mov [ebp-0Ch], esp
  '004F0D32: mov [ebp-08h], 004056E8h
  '004F0D39: xor edi, edi
  '004F0D3B: mov [ebp-04h], edi
  '004F0D3E: mov esi, [ebp+08h]
  '004F0D41: push esi
  '004F0D42: mov eax, [esi]
  '004F0D44: call [eax+04h]
  '004F0D47: mov eax, [esi+10h]
  '004F0D4A: lea edx, [ebp-1Ch]
  '004F0D4D: mov [ebp-1Ch], edi
  '004F0D50: push edx
  '004F0D51: mov ecx, [eax]
  '004F0D53: push eax
  '004F0D54: mov [ebp-18h], edi
  '004F0D57: call [ecx+58h]
  '004F0D5A: cmp eax, edi
  '004F0D5C: fclex 
  '004F0D5E: jnl 4F0D72h
  '004F0D60: mov ecx, [esi+10h]
  '004F0D63: push 00000058h
  '004F0D65: push 0042725Ch
  '004F0D6A: push ecx
  '004F0D6B: push eax
  '004F0D6C: call [004010A0h]
  '004F0D72: mov edx, [ebp-1Ch]
  '004F0D75: mov [ebp-18h], edx
  '004F0D78: mov eax, [ebp+08h]
  '004F0D7B: push eax
  '004F0D7C: mov ecx, [eax]
  '004F0D7E: call [ecx+08h]
  '004F0D81: mov edx, [ebp+0Ch]
  '004F0D84: mov eax, [ebp-18h]
  '004F0D87: mov [edx], eax
  '004F0D89: mov eax, [ebp-04h]
  '004F0D8C: mov ecx, [ebp-14h]
  '004F0D8F: pop edi
  '004F0D90: pop esi
  '004F0D91: mov fs:[00000000h], ecx
  '004F0D98: pop ebx
  '004F0D99: mov esp, ebp
  '004F0D9B: pop ebp
  '004F0D9C: retn 0008h
End Sub
Private Sub unknown_4F0DA0
  '004F0DA0: push ebp
  '004F0DA1: mov ebp, esp
  '004F0DA3: sub esp, 0000000Ch
  '004F0DA6: push 004081B6h
  '004F0DAB: mov eax, fs:[00h]
  '004F0DB1: push eax
  '004F0DB2: mov fs:[00000000h], esp
  '004F0DB9: sub esp, 00000014h
  '004F0DBC: push ebx
  '004F0DBD: push esi
  '004F0DBE: push edi
  '004F0DBF: mov [ebp-0Ch], esp
  '004F0DC2: mov [ebp-08h], 004056F0h
  '004F0DC9: xor edi, edi
  '004F0DCB: mov [ebp-04h], edi
  '004F0DCE: mov esi, [ebp+08h]
  '004F0DD1: push esi
  '004F0DD2: mov eax, [esi]
  '004F0DD4: call [eax+04h]
  '004F0DD7: mov eax, [esi+10h]
  '004F0DDA: lea edx, [ebp-1Ch]
  '004F0DDD: mov [ebp-1Ch], edi
  '004F0DE0: push edx
  '004F0DE1: mov ecx, [eax]
  '004F0DE3: push eax
  '004F0DE4: mov [ebp-18h], edi
  '004F0DE7: call [ecx+000000A0h]
  '004F0DED: cmp eax, edi
  '004F0DEF: fclex 
  '004F0DF1: jnl 4F0E08h
  '004F0DF3: mov ecx, [esi+10h]
  '004F0DF6: push 000000A0h
  '004F0DFB: push 0042725Ch
  '004F0E00: push ecx
  '004F0E01: push eax
  '004F0E02: call [004010A0h]
  '004F0E08: movsx edx, word ptr [ebp-1Ch]
  '004F0E0C: mov [ebp-18h], edx
  '004F0E0F: mov eax, [ebp+08h]
  '004F0E12: push eax
  '004F0E13: mov ecx, [eax]
  '004F0E15: call [ecx+08h]
  '004F0E18: mov edx, [ebp+0Ch]
  '004F0E1B: mov eax, [ebp-18h]
  '004F0E1E: mov [edx], eax
  '004F0E20: mov eax, [ebp-04h]
  '004F0E23: mov ecx, [ebp-14h]
  '004F0E26: pop edi
  '004F0E27: pop esi
  '004F0E28: mov fs:[00000000h], ecx
  '004F0E2F: pop ebx
  '004F0E30: mov esp, ebp
  '004F0E32: pop ebp
  '004F0E33: retn 0008h
End Sub
Private Sub unknown_4F0E40
  '004F0E40: push ebp
  '004F0E41: mov ebp, esp
  '004F0E43: sub esp, 0000000Ch
  '004F0E46: push 004081B6h
  '004F0E4B: mov eax, fs:[00h]
  '004F0E51: push eax
  '004F0E52: mov fs:[00000000h], esp
  '004F0E59: sub esp, 0000001Ch
  '004F0E5C: push ebx
  '004F0E5D: push esi
  '004F0E5E: push edi
  '004F0E5F: mov [ebp-0Ch], esp
  '004F0E62: mov [ebp-08h], 004056F8h
  '004F0E69: mov [ebp-04h], 00000000h
  '004F0E70: mov esi, [ebp+08h]
  '004F0E73: push esi
  '004F0E74: mov eax, [esi]
  '004F0E76: call [eax+04h]
  '004F0E79: mov ecx, [esi+10h]
  '004F0E7C: mov edi, [ecx]
  '004F0E7E: mov ecx, [ebp+0Ch]
  '004F0E81: call [004011A8h]
  '004F0E87: mov edx, [esi+10h]
  '004F0E8A: push eax
  '004F0E8B: push edx
  '004F0E8C: call [edi+000000A4h]
  '004F0E92: test eax, eax
  '004F0E94: fclex 
  '004F0E96: jnl 4F0EADh
  '004F0E98: mov ecx, [esi+10h]
  '004F0E9B: push 000000A4h
  '004F0EA0: push 0042725Ch
  '004F0EA5: push ecx
  '004F0EA6: push eax
  '004F0EA7: call [004010A0h]
  '004F0EAD: sub esp, 00000010h
  '004F0EB0: mov ecx, 00000008h
  '004F0EB5: mov edi, esp
  '004F0EB7: mov edx, [esi]
  '004F0EB9: mov eax, 00427E20h
  '004F0EBE: push esi
  '004F0EBF: mov [edi], ecx
  '004F0EC1: mov ecx, [ebp-20h]
  '004F0EC4: mov [edi+04h], ecx
  '004F0EC7: mov [edi+08h], eax
  '004F0ECA: mov eax, [ebp-18h]
  '004F0ECD: mov [edi+0Ch], eax
  '004F0ED0: call [edx+00000390h]
  '004F0ED6: test eax, eax
  '004F0ED8: fclex 
  '004F0EDA: jnl 4F0EEEh
  '004F0EDC: push 00000390h
  '004F0EE1: push 0042725Ch
  '004F0EE6: push esi
  '004F0EE7: push eax
  '004F0EE8: call [004010A0h]
  '004F0EEE: mov eax, [ebp+08h]
  '004F0EF1: push eax
  '004F0EF2: mov ecx, [eax]
  '004F0EF4: call [ecx+08h]
  '004F0EF7: mov eax, [ebp-04h]
  '004F0EFA: mov ecx, [ebp-14h]
  '004F0EFD: pop edi
  '004F0EFE: pop esi
  '004F0EFF: mov fs:[00000000h], ecx
  '004F0F06: pop ebx
  '004F0F07: mov esp, ebp
  '004F0F09: pop ebp
  '004F0F0A: retn 0008h
End Sub
Private Sub unknown_4F0F10
  '004F0F10: push ebp
  '004F0F11: mov ebp, esp
  '004F0F13: sub esp, 0000000Ch
  '004F0F16: push 004081B6h
  '004F0F1B: mov eax, fs:[00h]
  '004F0F21: push eax
  '004F0F22: mov fs:[00000000h], esp
  '004F0F29: sub esp, 00000018h
  '004F0F2C: push ebx
  '004F0F2D: push esi
  '004F0F2E: push edi
  '004F0F2F: mov [ebp-0Ch], esp
  '004F0F32: mov [ebp-08h], 00405700h
  '004F0F39: xor edi, edi
  '004F0F3B: mov [ebp-04h], edi
  '004F0F3E: mov esi, [ebp+08h]
  '004F0F41: push esi
  '004F0F42: mov eax, [esi]
  '004F0F44: call [eax+04h]
  '004F0F47: mov ecx, [ebp+0Ch]
  '004F0F4A: mov [ebp-18h], edi
  '004F0F4D: mov [ebp-1Ch], edi
  '004F0F50: mov [ecx], edi
  '004F0F52: mov eax, [esi+10h]
  '004F0F55: lea ecx, [ebp-1Ch]
  '004F0F58: mov edx, [eax]
  '004F0F5A: push ecx
  '004F0F5B: push eax
  '004F0F5C: call [edx+00000220h]
  '004F0F62: cmp eax, edi
  '004F0F64: fclex 
  '004F0F66: jnl 4F0F7Dh
  '004F0F68: mov edx, [esi+10h]
  '004F0F6B: push 00000220h
  '004F0F70: push 0042725Ch
  '004F0F75: push edx
  '004F0F76: push eax
  '004F0F77: call [004010A0h]
  '004F0F7D: mov eax, [ebp-1Ch]
  '004F0F80: mov [ebp-1Ch], edi
  '004F0F83: push eax
  '004F0F84: lea eax, [ebp-18h]
  '004F0F87: push eax
  '004F0F88: call [004010E4h]
  '004F0F8E: push 004F0FAFh
  '004F0F93: jmp 4F0FAEh
  '004F0F95: test byte ptr [ebp-04h], 04h
  '004F0F99: jz 4F0FA4h
  '004F0F9B: lea ecx, [ebp-18h]
  '004F0F9E: call [004013B8h]
  '004F0FA4: lea ecx, [ebp-1Ch]
  '004F0FA7: call [004013B8h]
  '004F0FAD: ret 
End Sub
Private Sub unknown_4F0FE0
  '004F0FE0: push ebp
  '004F0FE1: mov ebp, esp
  '004F0FE3: sub esp, 0000000Ch
  '004F0FE6: push 004081B6h
  '004F0FEB: mov eax, fs:[00h]
  '004F0FF1: push eax
  '004F0FF2: mov fs:[00000000h], esp
  '004F0FF9: sub esp, 00000028h
  '004F0FFC: push ebx
  '004F0FFD: push esi
  '004F0FFE: push edi
  '004F0FFF: mov [ebp-0Ch], esp
  '004F1002: mov [ebp-08h], 00405710h
  '004F1009: xor ebx, ebx
  '004F100B: mov [ebp-04h], ebx
  '004F100E: mov esi, [ebp+08h]
  '004F1011: push esi
  '004F1012: mov eax, [esi]
  '004F1014: call [eax+04h]
  '004F1017: mov ecx, [ebp+0Ch]
  '004F101A: mov edi, [004010F8h]
  '004F1020: lea edx, [ebp-18h]
  '004F1023: push ecx
  '004F1024: push edx
  '004F1025: mov [ebp-18h], ebx
  '004F1028: mov [ebp-1Ch], ebx
  '004F102B: call edi
  '004F102D: mov eax, [esi+10h]
  '004F1030: mov ecx, [ebp-18h]
  '004F1033: push ecx
  '004F1034: mov edx, [eax]
  '004F1036: lea eax, [ebp-1Ch]
  '004F1039: push eax
  '004F103A: mov [ebp-3Ch], edx
  '004F103D: call edi
  '004F103F: mov ecx, [esi+10h]
  '004F1042: mov edx, [ebp-3Ch]
  '004F1045: push eax
  '004F1046: push ecx
  '004F1047: call [edx+00000224h]
  '004F104D: cmp eax, ebx
  '004F104F: fclex 
  '004F1051: jnl 4F1068h
  '004F1053: mov ecx, [esi+10h]
  '004F1056: push 00000224h
  '004F105B: push 0042725Ch
  '004F1060: push ecx
  '004F1061: push eax
  '004F1062: call [004010A0h]
  '004F1068: lea ecx, [ebp-1Ch]
  '004F106B: call [004013B8h]
  '004F1071: sub esp, 00000010h
  '004F1074: mov ecx, 00000008h
  '004F1079: mov edi, esp
  '004F107B: mov edx, [esi]
  '004F107D: mov eax, 00427DF4h
  '004F1082: push esi
  '004F1083: mov [edi], ecx
  '004F1085: mov ecx, [ebp-28h]
  '004F1088: mov [edi+04h], ecx
  '004F108B: mov [edi+08h], eax
  '004F108E: mov eax, [ebp-20h]
  '004F1091: mov [edi+0Ch], eax
  '004F1094: call [edx+00000390h]
  '004F109A: cmp eax, ebx
  '004F109C: fclex 
  '004F109E: jnl 4F10B2h
  '004F10A0: push 00000390h
  '004F10A5: push 0042725Ch
  '004F10AA: push esi
  '004F10AB: push eax
  '004F10AC: call [004010A0h]
  '004F10B2: push 004F10CDh
  '004F10B7: jmp 4F10C3h
  '004F10B9: lea ecx, [ebp-1Ch]
  '004F10BC: call [004013B8h]
  '004F10C2: ret 
End Sub
Private Sub unknown_4F10F0
  '004F10F0: push ebp
  '004F10F1: mov ebp, esp
  '004F10F3: sub esp, 0000000Ch
  '004F10F6: push 004081B6h
  '004F10FB: mov eax, fs:[00h]
  '004F1101: push eax
  '004F1102: mov fs:[00000000h], esp
  '004F1109: sub esp, 0000000Ch
  '004F110C: push ebx
  '004F110D: push esi
  '004F110E: push edi
  '004F110F: mov [ebp-0Ch], esp
  '004F1112: mov [ebp-08h], 00405720h
  '004F1119: xor edi, edi
  '004F111B: mov [ebp-04h], edi
  '004F111E: mov esi, [ebp+08h]
  '004F1121: push esi
  '004F1122: mov eax, [esi]
  '004F1124: call [eax+04h]
  '004F1127: mov cx, [esi+00000100h]
  '004F112E: mov [ebp-18h], edi
  '004F1131: mov [ebp-18h], ecx
  '004F1134: mov eax, [ebp+08h]
  '004F1137: push eax
  '004F1138: mov edx, [eax]
  '004F113A: call [edx+08h]
  '004F113D: mov eax, [ebp+0Ch]
  '004F1140: mov cx, [ebp-18h]
  '004F1144: mov [eax], cx
  '004F1147: mov eax, [ebp-04h]
  '004F114A: mov ecx, [ebp-14h]
  '004F114D: pop edi
  '004F114E: pop esi
  '004F114F: mov fs:[00000000h], ecx
  '004F1156: pop ebx
  '004F1157: mov esp, ebp
  '004F1159: pop ebp
  '004F115A: retn 0008h
End Sub
Private Sub unknown_4F1160
  '004F1160: push ebp
  '004F1161: mov ebp, esp
  '004F1163: sub esp, 0000000Ch
  '004F1166: push 004081B6h
  '004F116B: mov eax, fs:[00h]
  '004F1171: push eax
  '004F1172: mov fs:[00000000h], esp
  '004F1179: sub esp, 0000001Ch
  '004F117C: push ebx
  '004F117D: push esi
  '004F117E: push edi
  '004F117F: mov [ebp-0Ch], esp
  '004F1182: mov [ebp-08h], 00405728h
  '004F1189: mov [ebp-04h], 00000000h
  '004F1190: mov esi, [ebp+08h]
  '004F1193: push esi
  '004F1194: mov eax, [esi]
  '004F1196: call [eax+04h]
  '004F1199: mov cx, [ebp+0Ch]
  '004F119D: sub esp, 00000010h
  '004F11A0: mov [esi+00000100h], cx
  '004F11A7: mov edi, esp
  '004F11A9: mov ecx, 00000008h
  '004F11AE: mov edx, [esi]
  '004F11B0: mov [edi], ecx
  '004F11B2: mov ecx, [ebp-20h]
  '004F11B5: mov eax, 00427C90h
  '004F11BA: push esi
  '004F11BB: mov [edi+04h], ecx
  '004F11BE: mov [edi+08h], eax
  '004F11C1: mov eax, [ebp-18h]
  '004F11C4: mov [edi+0Ch], eax
  '004F11C7: call [edx+00000390h]
  '004F11CD: test eax, eax
  '004F11CF: fclex 
  '004F11D1: jnl 4F11E5h
  '004F11D3: push 00000390h
  '004F11D8: push 0042725Ch
  '004F11DD: push esi
  '004F11DE: push eax
  '004F11DF: call [004010A0h]
  '004F11E5: mov ecx, [esi]
  '004F11E7: push esi
  '004F11E8: call [ecx+000007A4h]
  '004F11EE: test eax, eax
  '004F11F0: jnl 4F1204h
  '004F11F2: push 000007A4h
  '004F11F7: push 0042728Ch
  '004F11FC: push esi
  '004F11FD: push eax
  '004F11FE: call [004010A0h]
  '004F1204: mov eax, [ebp+08h]
  '004F1207: push eax
  '004F1208: mov edx, [eax]
  '004F120A: call [edx+08h]
  '004F120D: mov eax, [ebp-04h]
  '004F1210: mov ecx, [ebp-14h]
  '004F1213: pop edi
  '004F1214: pop esi
  '004F1215: mov fs:[00000000h], ecx
  '004F121C: pop ebx
  '004F121D: mov esp, ebp
  '004F121F: pop ebp
  '004F1220: retn 0008h
End Sub
Private Sub unknown_4F2D70
  '004F2D70: push ebp
  '004F2D71: mov ebp, esp
  '004F2D73: sub esp, 0000000Ch
  '004F2D76: push 004081B6h
  '004F2D7B: mov eax, fs:[00h]
  '004F2D81: push eax
  '004F2D82: mov fs:[00000000h], esp
  '004F2D89: sub esp, 0000005Ch
  '004F2D8C: push ebx
  '004F2D8D: push esi
  '004F2D8E: push edi
  '004F2D8F: mov [ebp-0Ch], esp
  '004F2D92: mov [ebp-08h], 00405770h
  '004F2D99: xor ebx, ebx
  '004F2D9B: mov [ebp-04h], ebx
  '004F2D9E: mov esi, [ebp+08h]
  '004F2DA1: push esi
  '004F2DA2: mov eax, [esi]
  '004F2DA4: call [eax+04h]
  '004F2DA7: lea ecx, [ebp-4Ch]
  '004F2DAA: push 00000007h
  '004F2DAC: lea edx, [ebp-2Ch]
  '004F2DAF: lea edi, [esi+000000FCh]
  '004F2DB5: push ecx
  '004F2DB6: mov [ebp-4Ch], ebx
  '004F2DB9: push edx
  '004F2DBA: mov [ebp-18h], ebx
  '004F2DBD: mov [ebp-1Ch], ebx
  '004F2DC0: mov [ebp-2Ch], ebx
  '004F2DC3: mov [ebp-3Ch], ebx
  '004F2DC6: mov [ebp-5Ch], ebx
  '004F2DC9: mov [ebp-44h], edi
  '004F2DCC: mov [ebp-4Ch], 00004008h
  '004F2DD3: call [0040136Ch]
  '004F2DD9: lea eax, [ebp-2Ch]
  '004F2DDC: lea ecx, [ebp-5Ch]
  '004F2DDF: push eax
  '004F2DE0: push ecx
  '004F2DE1: mov [ebp-54h], 00427FACh
  '004F2DE8: mov [ebp-5Ch], 00008008h
  '004F2DEF: call [00401198h]
  '004F2DF5: lea ecx, [ebp-2Ch]
  '004F2DF8: mov [ebp-60h], ax
  '004F2DFC: call [00401030h]
  '004F2E02: cmp [ebp-60h], bx
  '004F2E06: jz 4F2E72h
  '004F2E08: mov eax, [esi+10h]
  '004F2E0B: lea ecx, [ebp-18h]
  '004F2E0E: push ecx
  '004F2E0F: push eax
  '004F2E10: mov edx, [eax]
  '004F2E12: call [edx+00000198h]
  '004F2E18: cmp eax, ebx
  '004F2E1A: fclex 
  '004F2E1C: jnl 4F2E33h
  '004F2E1E: mov edx, [esi+10h]
  '004F2E21: push 00000198h
  '004F2E26: push 0042725Ch
  '004F2E2B: push edx
  '004F2E2C: push eax
  '004F2E2D: call [004010A0h]
  '004F2E33: mov eax, [ebp-18h]
  '004F2E36: push 0041E3ECh
  '004F2E3B: push eax
  '004F2E3C: call [0040137Ch]
  '004F2E42: lea ecx, [ebp-1Ch]
  '004F2E45: push eax
  '004F2E46: push ecx
  '004F2E47: call [004010E4h]
  '004F2E4D: mov eax, [edi]
  '004F2E4F: mov edx, [esi]
  '004F2E51: lea ecx, [ebp-1Ch]
  '004F2E54: push eax
  '004F2E55: push ecx
  '004F2E56: push esi
  '004F2E57: call [edx+000008F4h]
  '004F2E5D: lea edx, [ebp-1Ch]
  '004F2E60: lea eax, [ebp-18h]
  '004F2E63: push edx
  '004F2E64: push eax
  '004F2E65: push 00000002h
  '004F2E67: call [00401064h]
  '004F2E6D: add esp, 0000000Ch
  '004F2E70: jmp 4F2EE5h
  '004F2E72: mov ecx, [edi]
  '004F2E74: push ecx
  '004F2E75: push 0041BC60h
  '004F2E7A: call [00401184h]
  '004F2E80: test eax, eax
  '004F2E82: jz 4F2EE5h
  '004F2E84: mov eax, [esi+10h]
  '004F2E87: lea ecx, [ebp-18h]
  '004F2E8A: push ecx
  '004F2E8B: push eax
  '004F2E8C: mov edx, [eax]
  '004F2E8E: call [edx+00000330h]
  '004F2E94: cmp eax, ebx
  '004F2E96: fclex 
  '004F2E98: jnl 4F2EAFh
  '004F2E9A: mov edx, [esi+10h]
  '004F2E9D: push 00000330h
  '004F2EA2: push 0042725Ch
  '004F2EA7: push edx
  '004F2EA8: push eax
  '004F2EA9: call [004010A0h]
  '004F2EAF: mov eax, [ebp-18h]
  '004F2EB2: mov edx, [edi]
  '004F2EB4: push 0041BC60h
  '004F2EB9: push 0041BC60h
  '004F2EBE: mov ecx, [eax]
  '004F2EC0: push edx
  '004F2EC1: push eax
  '004F2EC2: mov esi, eax
  '004F2EC4: call [ecx+24h]
  '004F2EC7: cmp eax, ebx
  '004F2EC9: fclex 
  '004F2ECB: jnl 4F2EDCh
  '004F2ECD: push 00000024h
  '004F2ECF: push 00427FBCh
  '004F2ED4: push esi
  '004F2ED5: push eax
  '004F2ED6: call [004010A0h]
  '004F2EDC: lea ecx, [ebp-18h]
  '004F2EDF: call [004013B8h]
  '004F2EE5: push 004F2F11h
  '004F2EEA: jmp 4F2F10h
  '004F2EEC: lea eax, [ebp-1Ch]
  '004F2EEF: lea ecx, [ebp-18h]
  '004F2EF2: push eax
  '004F2EF3: push ecx
  '004F2EF4: push 00000002h
  '004F2EF6: call [00401064h]
  '004F2EFC: lea edx, [ebp-3Ch]
  '004F2EFF: lea eax, [ebp-2Ch]
  '004F2F02: push edx
  '004F2F03: push eax
  '004F2F04: push 00000002h
  '004F2F06: call [00401050h]
  '004F2F0C: add esp, 00000018h
  '004F2F0F: ret 
End Sub
Private Sub unknown_4F3050
  '004F3050: push ebp
  '004F3051: mov ebp, esp
  '004F3053: sub esp, 0000000Ch
  '004F3056: push 004081B6h
  '004F305B: mov eax, fs:[00h]
  '004F3061: push eax
  '004F3062: mov fs:[00000000h], esp
  '004F3069: sub esp, 0000000Ch
  '004F306C: push ebx
  '004F306D: push esi
  '004F306E: push edi
  '004F306F: mov [ebp-0Ch], esp
  '004F3072: mov [ebp-08h], 00405790h
  '004F3079: xor edi, edi
  '004F307B: mov [ebp-04h], edi
  '004F307E: mov esi, [ebp+08h]
  '004F3081: push esi
  '004F3082: mov eax, [esi]
  '004F3084: call [eax+04h]
  '004F3087: mov ecx, [ebp+0Ch]
  '004F308A: mov [ebp-18h], edi
  '004F308D: mov [ecx], edi
  '004F308F: mov edx, [esi+000000FCh]
  '004F3095: lea ecx, [ebp-18h]
  '004F3098: call [004012D8h]
  '004F309E: push 004F30B0h
  '004F30A3: jmp 4F30AFh
  '004F30A5: lea ecx, [ebp-18h]
  '004F30A8: call [004013B4h]
  '004F30AE: ret 
End Sub
Private Sub unknown_4F30E0
  '004F30E0: push ebp
  '004F30E1: mov ebp, esp
  '004F30E3: sub esp, 0000000Ch
  '004F30E6: push 004081B6h
  '004F30EB: mov eax, fs:[00h]
  '004F30F1: push eax
  '004F30F2: mov fs:[00000000h], esp
  '004F30F9: sub esp, 00000020h
  '004F30FC: push ebx
  '004F30FD: push esi
  '004F30FE: push edi
  '004F30FF: mov [ebp-0Ch], esp
  '004F3102: mov [ebp-08h], 004057A0h
  '004F3109: xor ebx, ebx
  '004F310B: mov [ebp-04h], ebx
  '004F310E: mov esi, [ebp+08h]
  '004F3111: push esi
  '004F3112: mov eax, [esi]
  '004F3114: call [eax+04h]
  '004F3117: mov edx, [ebp+0Ch]
  '004F311A: mov edi, [004012D8h]
  '004F3120: lea ecx, [ebp-18h]
  '004F3123: mov [ebp-18h], ebx
  '004F3126: call edi
  '004F3128: mov edx, [ebp-18h]
  '004F312B: lea ecx, [esi+000000FCh]
  '004F3131: call edi
  '004F3133: sub esp, 00000010h
  '004F3136: mov ecx, 00000008h
  '004F313B: mov edi, esp
  '004F313D: mov edx, [esi]
  '004F313F: mov eax, 00427E40h
  '004F3144: push esi
  '004F3145: mov [edi], ecx
  '004F3147: mov ecx, [ebp-24h]
  '004F314A: mov [edi+04h], ecx
  '004F314D: mov [edi+08h], eax
  '004F3150: mov eax, [ebp-1Ch]
  '004F3153: mov [edi+0Ch], eax
  '004F3156: call [edx+00000390h]
  '004F315C: cmp eax, ebx
  '004F315E: fclex 
  '004F3160: jnl 4F3174h
  '004F3162: push 00000390h
  '004F3167: push 0042725Ch
  '004F316C: push esi
  '004F316D: push eax
  '004F316E: call [004010A0h]
  '004F3174: push 004F3183h
  '004F3179: lea ecx, [ebp-18h]
  '004F317C: call [004013B4h]
  '004F3182: ret 
End Sub
Private Sub unknown_4F31B0
  '004F31B0: push ebp
  '004F31B1: mov ebp, esp
  '004F31B3: sub esp, 0000000Ch
  '004F31B6: push 004081B6h
  '004F31BB: mov eax, fs:[00h]
  '004F31C1: push eax
  '004F31C2: mov fs:[00000000h], esp
  '004F31C9: sub esp, 0000000Ch
  '004F31CC: push ebx
  '004F31CD: push esi
  '004F31CE: push edi
  '004F31CF: mov [ebp-0Ch], esp
  '004F31D2: mov [ebp-08h], 004057B0h
  '004F31D9: xor edi, edi
  '004F31DB: mov [ebp-04h], edi
  '004F31DE: mov esi, [ebp+08h]
  '004F31E1: push esi
  '004F31E2: mov eax, [esi]
  '004F31E4: call [eax+04h]
  '004F31E7: mov ecx, [ebp+0Ch]
  '004F31EA: mov [ebp-18h], edi
  '004F31ED: mov [ecx], edi
  '004F31EF: mov edx, [esi+000000B8h]
  '004F31F5: lea ecx, [ebp-18h]
  '004F31F8: call [004012D8h]
  '004F31FE: push 004F3210h
  '004F3203: jmp 4F320Fh
  '004F3205: lea ecx, [ebp-18h]
  '004F3208: call [004013B4h]
  '004F320E: ret 
End Sub
Private Sub unknown_4F3240
  '004F3240: push ebp
  '004F3241: mov ebp, esp
  '004F3243: sub esp, 0000000Ch
  '004F3246: push 004081B6h
  '004F324B: mov eax, fs:[00h]
  '004F3251: push eax
  '004F3252: mov fs:[00000000h], esp
  '004F3259: sub esp, 00000020h
  '004F325C: push ebx
  '004F325D: push esi
  '004F325E: push edi
  '004F325F: mov [ebp-0Ch], esp
  '004F3262: mov [ebp-08h], 004057C0h
  '004F3269: xor ebx, ebx
  '004F326B: mov [ebp-04h], ebx
  '004F326E: mov esi, [ebp+08h]
  '004F3271: push esi
  '004F3272: mov eax, [esi]
  '004F3274: call [eax+04h]
  '004F3277: mov edx, [ebp+0Ch]
  '004F327A: mov edi, [004012D8h]
  '004F3280: lea ecx, [ebp-18h]
  '004F3283: mov [ebp-18h], ebx
  '004F3286: call edi
  '004F3288: mov edx, [ebp-18h]
  '004F328B: lea ecx, [esi+000000B8h]
  '004F3291: call edi
  '004F3293: sub esp, 00000010h
  '004F3296: mov ecx, 00000008h
  '004F329B: mov edi, esp
  '004F329D: mov edx, [esi]
  '004F329F: mov eax, 00427CB0h
  '004F32A4: push esi
  '004F32A5: mov [edi], ecx
  '004F32A7: mov ecx, [ebp-24h]
  '004F32AA: mov [edi+04h], ecx
  '004F32AD: mov [edi+08h], eax
  '004F32B0: mov eax, [ebp-1Ch]
  '004F32B3: mov [edi+0Ch], eax
  '004F32B6: call [edx+00000390h]
  '004F32BC: cmp eax, ebx
  '004F32BE: fclex 
  '004F32C0: jnl 4F32D4h
  '004F32C2: push 00000390h
  '004F32C7: push 0042725Ch
  '004F32CC: push esi
  '004F32CD: push eax
  '004F32CE: call [004010A0h]
  '004F32D4: mov ecx, [esi]
  '004F32D6: push esi
  '004F32D7: call [ecx+00000934h]
  '004F32DD: mov edx, [esi]
  '004F32DF: push esi
  '004F32E0: call [edx+000007A4h]
  '004F32E6: cmp eax, ebx
  '004F32E8: jnl 4F32FCh
  '004F32EA: push 000007A4h
  '004F32EF: push 0042728Ch
  '004F32F4: push esi
  '004F32F5: push eax
  '004F32F6: call [004010A0h]
  '004F32FC: push 004F330Bh
  '004F3301: lea ecx, [ebp-18h]
  '004F3304: call [004013B4h]
  '004F330A: ret 
End Sub
Private Sub unknown_4F3330
  '004F3330: push ebp
  '004F3331: mov ebp, esp
  '004F3333: sub esp, 0000000Ch
  '004F3336: push 004081B6h
  '004F333B: mov eax, fs:[00h]
  '004F3341: push eax
  '004F3342: mov fs:[00000000h], esp
  '004F3349: sub esp, 0000000Ch
  '004F334C: push ebx
  '004F334D: push esi
  '004F334E: push edi
  '004F334F: mov [ebp-0Ch], esp
  '004F3352: mov [ebp-08h], 004057D0h
  '004F3359: xor edi, edi
  '004F335B: mov [ebp-04h], edi
  '004F335E: mov esi, [ebp+08h]
  '004F3361: push esi
  '004F3362: mov eax, [esi]
  '004F3364: call [eax+04h]
  '004F3367: mov ecx, [esi+000000C0h]
  '004F336D: mov [ebp-18h], edi
  '004F3370: mov [ebp-18h], ecx
  '004F3373: mov eax, [ebp+08h]
  '004F3376: push eax
  '004F3377: mov edx, [eax]
  '004F3379: call [edx+08h]
  '004F337C: mov eax, [ebp+0Ch]
  '004F337F: mov ecx, [ebp-18h]
  '004F3382: mov [eax], ecx
  '004F3384: mov eax, [ebp-04h]
  '004F3387: mov ecx, [ebp-14h]
  '004F338A: pop edi
  '004F338B: pop esi
  '004F338C: mov fs:[00000000h], ecx
  '004F3393: pop ebx
  '004F3394: mov esp, ebp
  '004F3396: pop ebp
  '004F3397: retn 0008h
End Sub
Private Sub unknown_4F33A0
  '004F33A0: push ebp
  '004F33A1: mov ebp, esp
  '004F33A3: sub esp, 0000000Ch
  '004F33A6: push 004081B6h
  '004F33AB: mov eax, fs:[00h]
  '004F33B1: push eax
  '004F33B2: mov fs:[00000000h], esp
  '004F33B9: sub esp, 0000001Ch
  '004F33BC: push ebx
  '004F33BD: push esi
  '004F33BE: push edi
  '004F33BF: mov [ebp-0Ch], esp
  '004F33C2: mov [ebp-08h], 004057D8h
  '004F33C9: mov [ebp-04h], 00000000h
  '004F33D0: mov esi, [ebp+08h]
  '004F33D3: push esi
  '004F33D4: mov eax, [esi]
  '004F33D6: call [eax+04h]
  '004F33D9: mov ecx, [ebp+0Ch]
  '004F33DC: sub esp, 00000010h
  '004F33DF: mov [esi+000000C0h], ecx
  '004F33E5: mov edi, esp
  '004F33E7: mov ecx, 00000008h
  '004F33EC: mov edx, [esi]
  '004F33EE: mov [edi], ecx
  '004F33F0: mov ecx, [ebp-20h]
  '004F33F3: mov eax, 00427CE8h
  '004F33F8: push esi
  '004F33F9: mov [edi+04h], ecx
  '004F33FC: mov [edi+08h], eax
  '004F33FF: mov eax, [ebp-18h]
  '004F3402: mov [edi+0Ch], eax
  '004F3405: call [edx+00000390h]
  '004F340B: test eax, eax
  '004F340D: fclex 
  '004F340F: jnl 4F3427h
  '004F3411: mov edi, [004010A0h]
  '004F3417: push 00000390h
  '004F341C: push 0042725Ch
  '004F3421: push esi
  '004F3422: push eax
  '004F3423: call edi
  '004F3425: jmp 4F342Dh
  '004F3427: mov edi, [004010A0h]
  '004F342D: cmp [esi+000000C0h], 00000003h
  '004F3434: jnz 4F3453h
  '004F3436: mov ecx, [esi]
  '004F3438: push 00000000h
  '004F343A: push esi
  '004F343B: call [ecx+0000087Ch]
  '004F3441: test eax, eax
  '004F3443: jnl 4F3453h
  '004F3445: push 0000087Ch
  '004F344A: push 0042728Ch
  '004F344F: push esi
  '004F3450: push eax
  '004F3451: call edi
  '004F3453: mov edx, [esi]
  '004F3455: push esi
  '004F3456: call [edx+000008B8h]
  '004F345C: test eax, eax
  '004F345E: jnl 4F346Eh
  '004F3460: push 000008B8h
  '004F3465: push 0042728Ch
  '004F346A: push esi
  '004F346B: push eax
  '004F346C: call edi
  '004F346E: mov eax, [ebp+08h]
  '004F3471: push eax
  '004F3472: mov ecx, [eax]
  '004F3474: call [ecx+08h]
  '004F3477: mov eax, [ebp-04h]
  '004F347A: mov ecx, [ebp-14h]
  '004F347D: pop edi
  '004F347E: pop esi
  '004F347F: mov fs:[00000000h], ecx
  '004F3486: pop ebx
  '004F3487: mov esp, ebp
  '004F3489: pop ebp
  '004F348A: retn 0008h
End Sub
Private Sub unknown_4F3490
  '004F3490: push ebp
  '004F3491: mov ebp, esp
  '004F3493: sub esp, 0000000Ch
  '004F3496: push 004081B6h
  '004F349B: mov eax, fs:[00h]
  '004F34A1: push eax
  '004F34A2: mov fs:[00000000h], esp
  '004F34A9: sub esp, 0000000Ch
  '004F34AC: push ebx
  '004F34AD: push esi
  '004F34AE: push edi
  '004F34AF: mov [ebp-0Ch], esp
  '004F34B2: mov [ebp-08h], 004057E0h
  '004F34B9: xor edi, edi
  '004F34BB: mov [ebp-04h], edi
  '004F34BE: mov esi, [ebp+08h]
  '004F34C1: push esi
  '004F34C2: mov eax, [esi]
  '004F34C4: call [eax+04h]
  '004F34C7: mov ecx, [esi+000000BCh]
  '004F34CD: mov [ebp-18h], edi
  '004F34D0: mov [ebp-18h], ecx
  '004F34D3: mov eax, [ebp+08h]
  '004F34D6: push eax
  '004F34D7: mov edx, [eax]
  '004F34D9: call [edx+08h]
  '004F34DC: mov eax, [ebp+0Ch]
  '004F34DF: mov ecx, [ebp-18h]
  '004F34E2: mov [eax], ecx
  '004F34E4: mov eax, [ebp-04h]
  '004F34E7: mov ecx, [ebp-14h]
  '004F34EA: pop edi
  '004F34EB: pop esi
  '004F34EC: mov fs:[00000000h], ecx
  '004F34F3: pop ebx
  '004F34F4: mov esp, ebp
  '004F34F6: pop ebp
  '004F34F7: retn 0008h
End Sub
Private Sub unknown_4F3500
  '004F3500: push ebp
  '004F3501: mov ebp, esp
  '004F3503: sub esp, 0000000Ch
  '004F3506: push 004081B6h
  '004F350B: mov eax, fs:[00h]
  '004F3511: push eax
  '004F3512: mov fs:[00000000h], esp
  '004F3519: sub esp, 0000001Ch
  '004F351C: push ebx
  '004F351D: push esi
  '004F351E: push edi
  '004F351F: mov [ebp-0Ch], esp
  '004F3522: mov [ebp-08h], 004057E8h
  '004F3529: mov [ebp-04h], 00000000h
  '004F3530: mov esi, [ebp+08h]
  '004F3533: push esi
  '004F3534: mov eax, [esi]
  '004F3536: call [eax+04h]
  '004F3539: mov ecx, [ebp+0Ch]
  '004F353C: sub esp, 00000010h
  '004F353F: mov [esi+000000BCh], ecx
  '004F3545: mov edi, esp
  '004F3547: mov ecx, 00000008h
  '004F354C: mov edx, [esi]
  '004F354E: mov [edi], ecx
  '004F3550: mov ecx, [ebp-20h]
  '004F3553: mov eax, 00427CC4h
  '004F3558: push esi
  '004F3559: mov [edi+04h], ecx
  '004F355C: mov [edi+08h], eax
  '004F355F: mov eax, [ebp-18h]
  '004F3562: mov [edi+0Ch], eax
  '004F3565: call [edx+00000390h]
  '004F356B: test eax, eax
  '004F356D: fclex 
  '004F356F: jnl 4F3583h
  '004F3571: push 00000390h
  '004F3576: push 0042725Ch
  '004F357B: push esi
  '004F357C: push eax
  '004F357D: call [004010A0h]
  '004F3583: mov ecx, [esi]
  '004F3585: push esi
  '004F3586: call [ecx+000007A4h]
  '004F358C: test eax, eax
  '004F358E: jnl 4F35A2h
  '004F3590: push 000007A4h
  '004F3595: push 0042728Ch
  '004F359A: push esi
  '004F359B: push eax
  '004F359C: call [004010A0h]
  '004F35A2: mov eax, [ebp+08h]
  '004F35A5: push eax
  '004F35A6: mov edx, [eax]
  '004F35A8: call [edx+08h]
  '004F35AB: mov eax, [ebp-04h]
  '004F35AE: mov ecx, [ebp-14h]
  '004F35B1: pop edi
  '004F35B2: pop esi
  '004F35B3: mov fs:[00000000h], ecx
  '004F35BA: pop ebx
  '004F35BB: mov esp, ebp
  '004F35BD: pop ebp
  '004F35BE: retn 0008h
End Sub
Private Sub unknown_4F35D0
  '004F35D0: push ebp
  '004F35D1: mov ebp, esp
  '004F35D3: sub esp, 0000000Ch
  '004F35D6: push 004081B6h
  '004F35DB: mov eax, fs:[00h]
  '004F35E1: push eax
  '004F35E2: mov fs:[00000000h], esp
  '004F35E9: sub esp, 0000000Ch
  '004F35EC: push ebx
  '004F35ED: push esi
  '004F35EE: push edi
  '004F35EF: mov [ebp-0Ch], esp
  '004F35F2: mov [ebp-08h], 004057F0h
  '004F35F9: xor edi, edi
  '004F35FB: mov [ebp-04h], edi
  '004F35FE: mov esi, [ebp+08h]
  '004F3601: push esi
  '004F3602: mov eax, [esi]
  '004F3604: call [eax+04h]
  '004F3607: mov ecx, [ebp+0Ch]
  '004F360A: lea eax, [ebp-18h]
  '004F360D: mov [ebp-18h], edi
  '004F3610: mov [ecx], edi
  '004F3612: mov edx, [esi+000000C4h]
  '004F3618: push edx
  '004F3619: push eax
  '004F361A: call [004010F8h]
  '004F3620: push 004F3632h
  '004F3625: jmp 4F3631h
  '004F3627: lea ecx, [ebp-18h]
  '004F362A: call [004013B8h]
  '004F3630: ret 
End Sub
Private Sub unknown_4F3660
  '004F3660: push ebp
  '004F3661: mov ebp, esp
  '004F3663: sub esp, 0000000Ch
  '004F3666: push 004081B6h
  '004F366B: mov eax, fs:[00h]
  '004F3671: push eax
  '004F3672: mov fs:[00000000h], esp
  '004F3679: sub esp, 0000006Ch
  '004F367C: push ebx
  '004F367D: push esi
  '004F367E: push edi
  '004F367F: mov [ebp-0Ch], esp
  '004F3682: mov [ebp-08h], 00405800h
  '004F3689: xor edi, edi
  '004F368B: mov [ebp-04h], edi
  '004F368E: mov esi, [ebp+08h]
  '004F3691: push esi
  '004F3692: mov eax, [esi]
  '004F3694: call [eax+04h]
  '004F3697: mov ecx, [ebp+0Ch]
  '004F369A: mov ebx, [004010F8h]
  '004F36A0: lea edx, [ebp-18h]
  '004F36A3: push ecx
  '004F36A4: push edx
  '004F36A5: mov [ebp-18h], edi
  '004F36A8: mov [ebp-28h], edi
  '004F36AB: mov [ebp-48h], edi
  '004F36AE: mov [ebp-4Ch], edi
  '004F36B1: mov [ebp-50h], edi
  '004F36B4: call ebx
  '004F36B6: mov eax, [ebp-18h]
  '004F36B9: lea edi, [esi+000000C4h]
  '004F36BF: push eax
  '004F36C0: push edi
  '004F36C1: call ebx
  '004F36C3: mov ecx, [ebp-18h]
  '004F36C6: lea edx, [esi+000000B0h]
  '004F36CC: push ecx
  '004F36CD: push edx
  '004F36CE: call ebx
  '004F36D0: mov eax, [edi]
  '004F36D2: push 00000000h
  '004F36D4: push eax
  '004F36D5: call [00401210h]
  '004F36DB: test ax, ax
  '004F36DE: jz 4F36F9h
  '004F36E0: mov edi, [ebp-34h]
  '004F36E3: mov eax, 00000020h
  '004F36E8: mov [esi+000000A8h], eax
  '004F36EE: mov [esi+000000ACh], eax
  '004F36F4: jmp 004F38BCh
  '004F36F9: mov ecx, [edi]
  '004F36FB: push 00000000h
  '004F36FD: push 00000004h
  '004F36FF: lea edx, [ebp-28h]
  '004F3702: push ecx
  '004F3703: push edx
  '004F3704: call [004011E4h]
  '004F370A: mov eax, [esi+10h]
  '004F370D: add esp, 00000010h
  '004F3710: lea edx, [ebp-4Ch]
  '004F3713: mov ecx, [eax]
  '004F3715: push edx
  '004F3716: push eax
  '004F3717: call [ecx+00000110h]
  '004F371D: test eax, eax
  '004F371F: fclex 
  '004F3721: jnl 4F3738h
  '004F3723: mov ecx, [esi+10h]
  '004F3726: push 00000110h
  '004F372B: push 0042725Ch
  '004F3730: push ecx
  '004F3731: push eax
  '004F3732: call [004010A0h]
  '004F3738: mov edi, [esi+10h]
  '004F373B: mov dx, [ebp-4Ch]
  '004F373F: mov eax, 00000002h
  '004F3744: mov [ebp-40h], dx
  '004F3748: mov ebx, [edi]
  '004F374A: lea edi, [ebp-50h]
  '004F374D: push edi
  '004F374E: mov edx, eax
  '004F3750: sub esp, 00000010h
  '004F3753: mov ecx, 00000008h
  '004F3758: mov edi, esp
  '004F375A: sub esp, 00000010h
  '004F375D: mov [edi], eax
  '004F375F: mov eax, [ebp-44h]
  '004F3762: mov [edi+04h], eax
  '004F3765: mov eax, [ebp-40h]
  '004F3768: mov [edi+08h], eax
  '004F376B: mov eax, [ebp-3Ch]
  '004F376E: mov [edi+0Ch], eax
  '004F3771: mov edi, [ebp-34h]
  '004F3774: mov eax, esp
  '004F3776: mov [eax], edx
  '004F3778: lea edx, [ebp-28h]
  '004F377B: push edx
  '004F377C: mov [eax+04h], edi
  '004F377F: mov [eax+08h], ecx
  '004F3782: mov ecx, [ebp-2Ch]
  '004F3785: mov [eax+0Ch], ecx
  '004F3788: call [0040130Ch]
  '004F378E: mov [ebp-64h], eax
  '004F3791: mov ecx, [esi+10h]
  '004F3794: fild dword ptr [ebp-64h]
  '004F3797: fstp real4 ptr [ebp-68h]
  '004F379A: mov eax, [ebp-68h]
  '004F379D: push eax
  '004F379E: push ecx
  '004F379F: call [ebx+00000374h]
  '004F37A5: test eax, eax
  '004F37A7: fclex 
  '004F37A9: jnl 4F37C0h
  '004F37AB: mov edx, [esi+10h]
  '004F37AE: push 00000374h
  '004F37B3: push 0042725Ch
  '004F37B8: push edx
  '004F37B9: push eax
  '004F37BA: call [004010A0h]
  '004F37C0: fld real4 ptr [ebp-50h]
  '004F37C3: call [0040135Ch]
  '004F37C9: lea ecx, [ebp-28h]
  '004F37CC: mov [esi+000000A8h], eax
  '004F37D2: call [00401030h]
  '004F37D8: mov eax, [esi+000000C4h]
  '004F37DE: push 00000000h
  '004F37E0: push 00000005h
  '004F37E2: lea ecx, [ebp-28h]
  '004F37E5: push eax
  '004F37E6: push ecx
  '004F37E7: call [004011E4h]
  '004F37ED: mov eax, [esi+10h]
  '004F37F0: add esp, 00000010h
  '004F37F3: lea ecx, [ebp-4Ch]
  '004F37F6: mov edx, [eax]
  '004F37F8: push ecx
  '004F37F9: push eax
  '004F37FA: call [edx+00000110h]
  '004F3800: test eax, eax
  '004F3802: fclex 
  '004F3804: jnl 4F381Bh
  '004F3806: mov edx, [esi+10h]
  '004F3809: push 00000110h
  '004F380E: push 0042725Ch
  '004F3813: push edx
  '004F3814: push eax
  '004F3815: call [004010A0h]
  '004F381B: mov edx, [esi+10h]
  '004F381E: mov ax, [ebp-4Ch]
  '004F3822: mov [ebp-40h], ax
  '004F3826: mov eax, 00000002h
  '004F382B: mov ebx, [edx]
  '004F382D: lea edx, [ebp-50h]
  '004F3830: push edx
  '004F3831: mov [ebp-38h], eax
  '004F3834: sub esp, 00000010h
  '004F3837: mov ecx, 00000008h
  '004F383C: mov edx, esp
  '004F383E: sub esp, 00000010h
  '004F3841: mov [edx], eax
  '004F3843: mov eax, [ebp-44h]
  '004F3846: mov [edx+04h], eax
  '004F3849: mov eax, [ebp-40h]
  '004F384C: mov [edx+08h], eax
  '004F384F: mov eax, [ebp-3Ch]
  '004F3852: mov [edx+0Ch], eax
  '004F3855: mov eax, [ebp-38h]
  '004F3858: mov edx, esp
  '004F385A: mov [edx], eax
  '004F385C: mov [edx+04h], edi
  '004F385F: mov [edx+08h], ecx
  '004F3862: mov ecx, [ebp-2Ch]
  '004F3865: mov [edx+0Ch], ecx
  '004F3868: lea edx, [ebp-28h]
  '004F386B: push edx
  '004F386C: call [0040130Ch]
  '004F3872: mov [ebp-6Ch], eax
  '004F3875: mov ecx, [esi+10h]
  '004F3878: fild dword ptr [ebp-6Ch]
  '004F387B: fstp real4 ptr [ebp-70h]
  '004F387E: mov eax, [ebp-70h]
  '004F3881: push eax
  '004F3882: push ecx
  '004F3883: call [ebx+00000378h]
  '004F3889: test eax, eax
  '004F388B: fclex 
  '004F388D: jnl 4F38A4h
  '004F388F: mov edx, [esi+10h]
  '004F3892: push 00000378h
  '004F3897: push 0042725Ch
  '004F389C: push edx
  '004F389D: push eax
  '004F389E: call [004010A0h]
  '004F38A4: fld real4 ptr [ebp-50h]
  '004F38A7: call [0040135Ch]
  '004F38AD: lea ecx, [ebp-28h]
  '004F38B0: mov [esi+000000ACh], eax
  '004F38B6: call [00401030h]
  '004F38BC: sub esp, 00000010h
  '004F38BF: mov ecx, 00000008h
  '004F38C4: mov ebx, esp
  '004F38C6: mov edx, [esi]
  '004F38C8: mov eax, 00427D04h
  '004F38CD: push esi
  '004F38CE: mov [ebx], ecx
  '004F38D0: mov [ebx+04h], edi
  '004F38D3: mov [ebx+08h], eax
  '004F38D6: mov eax, [ebp-2Ch]
  '004F38D9: mov [ebx+0Ch], eax
  '004F38DC: call [edx+00000390h]
  '004F38E2: test eax, eax
  '004F38E4: fclex 
  '004F38E6: jnl 4F38FAh
  '004F38E8: push 00000390h
  '004F38ED: push 0042725Ch
  '004F38F2: push esi
  '004F38F3: push eax
  '004F38F4: call [004010A0h]
  '004F38FA: mov eax, [esi+000000D0h]
  '004F3900: mov ebx, 00000002h
  '004F3905: cmp eax, ebx
  '004F3907: jnz 004F3AD2h
  '004F390D: mov ecx, [esi+000000C4h]
  '004F3913: push 00000000h
  '004F3915: push 00000004h
  '004F3917: lea edx, [ebp-28h]
  '004F391A: push ecx
  '004F391B: push edx
  '004F391C: call [004011E4h]
  '004F3922: mov eax, [esi+10h]
  '004F3925: add esp, 00000010h
  '004F3928: lea edx, [ebp-4Ch]
  '004F392B: mov ecx, [eax]
  '004F392D: push edx
  '004F392E: push eax
  '004F392F: call [ecx+00000110h]
  '004F3935: test eax, eax
  '004F3937: fclex 
  '004F3939: jnl 4F3950h
  '004F393B: mov ecx, [esi+10h]
  '004F393E: push 00000110h
  '004F3943: push 0042725Ch
  '004F3948: push ecx
  '004F3949: push eax
  '004F394A: call [004010A0h]
  '004F3950: mov dx, [ebp-4Ch]
  '004F3954: mov eax, ebx
  '004F3956: mov [ebp-40h], dx
  '004F395A: mov edx, [esi+10h]
  '004F395D: mov [ebp-38h], ebx
  '004F3960: mov ecx, 00000008h
  '004F3965: mov ebx, [edx]
  '004F3967: lea edx, [ebp-50h]
  '004F396A: push edx
  '004F396B: sub esp, 00000010h
  '004F396E: mov edx, esp
  '004F3970: sub esp, 00000010h
  '004F3973: mov [edx], eax
  '004F3975: mov eax, [ebp-44h]
  '004F3978: mov [edx+04h], eax
  '004F397B: mov eax, [ebp-40h]
  '004F397E: mov [edx+08h], eax
  '004F3981: mov eax, [ebp-3Ch]
  '004F3984: mov [edx+0Ch], eax
  '004F3987: mov eax, [ebp-38h]
  '004F398A: mov edx, esp
  '004F398C: mov [edx], eax
  '004F398E: mov [edx+04h], edi
  '004F3991: mov [edx+08h], ecx
  '004F3994: mov ecx, [ebp-2Ch]
  '004F3997: mov [edx+0Ch], ecx
  '004F399A: lea edx, [ebp-28h]
  '004F399D: push edx
  '004F399E: call [0040130Ch]
  '004F39A4: mov [ebp-74h], eax
  '004F39A7: mov ecx, [esi+10h]
  '004F39AA: fild dword ptr [ebp-74h]
  '004F39AD: fstp real4 ptr [ebp-78h]
  '004F39B0: mov eax, [ebp-78h]
  '004F39B3: push eax
  '004F39B4: push ecx
  '004F39B5: call [ebx+00000374h]
  '004F39BB: test eax, eax
  '004F39BD: fclex 
  '004F39BF: jnl 4F39D6h
  '004F39C1: mov edx, [esi+10h]
  '004F39C4: push 00000374h
  '004F39C9: push 0042725Ch
  '004F39CE: push edx
  '004F39CF: push eax
  '004F39D0: call [004010A0h]
  '004F39D6: fld real4 ptr [ebp-50h]
  '004F39D9: call [0040135Ch]
  '004F39DF: lea ecx, [ebp-28h]
  '004F39E2: mov [esi+000000C8h], eax
  '004F39E8: call [00401030h]
  '004F39EE: mov eax, [esi+000000C4h]
  '004F39F4: push 00000000h
  '004F39F6: push 00000005h
  '004F39F8: lea ecx, [ebp-28h]
  '004F39FB: push eax
  '004F39FC: push ecx
  '004F39FD: call [004011E4h]
  '004F3A03: mov eax, [esi+10h]
  '004F3A06: add esp, 00000010h
  '004F3A09: lea ecx, [ebp-4Ch]
  '004F3A0C: mov edx, [eax]
  '004F3A0E: push ecx
  '004F3A0F: push eax
  '004F3A10: call [edx+00000110h]
  '004F3A16: test eax, eax
  '004F3A18: fclex 
  '004F3A1A: jnl 4F3A31h
  '004F3A1C: mov edx, [esi+10h]
  '004F3A1F: push 00000110h
  '004F3A24: push 0042725Ch
  '004F3A29: push edx
  '004F3A2A: push eax
  '004F3A2B: call [004010A0h]
  '004F3A31: mov edx, [esi+10h]
  '004F3A34: mov ax, [ebp-4Ch]
  '004F3A38: mov [ebp-40h], ax
  '004F3A3C: mov eax, 00000002h
  '004F3A41: mov ebx, [edx]
  '004F3A43: lea edx, [ebp-50h]
  '004F3A46: push edx
  '004F3A47: mov [ebp-38h], eax
  '004F3A4A: sub esp, 00000010h
  '004F3A4D: mov ecx, 00000008h
  '004F3A52: mov edx, esp
  '004F3A54: sub esp, 00000010h
  '004F3A57: mov [edx], eax
  '004F3A59: mov eax, [ebp-44h]
  '004F3A5C: mov [edx+04h], eax
  '004F3A5F: mov eax, [ebp-40h]
  '004F3A62: mov [edx+08h], eax
  '004F3A65: mov eax, [ebp-3Ch]
  '004F3A68: mov [edx+0Ch], eax
  '004F3A6B: mov eax, [ebp-38h]
  '004F3A6E: mov edx, esp
  '004F3A70: mov [edx], eax
  '004F3A72: mov [edx+04h], edi
  '004F3A75: mov [edx+08h], ecx
  '004F3A78: mov ecx, [ebp-2Ch]
  '004F3A7B: mov [edx+0Ch], ecx
  '004F3A7E: lea edx, [ebp-28h]
  '004F3A81: push edx
  '004F3A82: call [0040130Ch]
  '004F3A88: mov [ebp-7Ch], eax
  '004F3A8B: mov ecx, [esi+10h]
  '004F3A8E: fild dword ptr [ebp-7Ch]
  '004F3A91: fstp real4 ptr [ebp-80h]
  '004F3A94: mov eax, [ebp-80h]
  '004F3A97: push eax
  '004F3A98: push ecx
  '004F3A99: call [ebx+00000378h]
  '004F3A9F: test eax, eax
  '004F3AA1: fclex 
  '004F3AA3: jnl 4F3ABAh
  '004F3AA5: mov edx, [esi+10h]
  '004F3AA8: push 00000378h
  '004F3AAD: push 0042725Ch
  '004F3AB2: push edx
  '004F3AB3: push eax
  '004F3AB4: call [004010A0h]
  '004F3ABA: fld real4 ptr [ebp-50h]
  '004F3ABD: call [0040135Ch]
  '004F3AC3: lea ecx, [ebp-28h]
  '004F3AC6: mov [esi+000000CCh], eax
  '004F3ACC: call [00401030h]
  '004F3AD2: mov eax, [esi]
  '004F3AD4: push esi
  '004F3AD5: call [eax+000007A4h]
  '004F3ADB: test eax, eax
  '004F3ADD: jnl 4F3AF1h
  '004F3ADF: push 000007A4h
  '004F3AE4: push 0042728Ch
  '004F3AE9: push esi
  '004F3AEA: push eax
  '004F3AEB: call [004010A0h]
  '004F3AF1: wait 
  '004F3AF2: push 004F3B0Dh
  '004F3AF7: jmp 4F3B03h
  '004F3AF9: lea ecx, [ebp-28h]
  '004F3AFC: call [00401030h]
  '004F3B02: ret 
End Sub
Private Sub unknown_4F3B30
  '004F3B30: push ebp
  '004F3B31: mov ebp, esp
  '004F3B33: sub esp, 0000000Ch
  '004F3B36: push 004081B6h
  '004F3B3B: mov eax, fs:[00h]
  '004F3B41: push eax
  '004F3B42: mov fs:[00000000h], esp
  '004F3B49: sub esp, 0000000Ch
  '004F3B4C: push ebx
  '004F3B4D: push esi
  '004F3B4E: push edi
  '004F3B4F: mov [ebp-0Ch], esp
  '004F3B52: mov [ebp-08h], 00405810h
  '004F3B59: xor edi, edi
  '004F3B5B: mov [ebp-04h], edi
  '004F3B5E: mov esi, [ebp+08h]
  '004F3B61: push esi
  '004F3B62: mov eax, [esi]
  '004F3B64: call [eax+04h]
  '004F3B67: mov ecx, [esi+000000C8h]
  '004F3B6D: mov [ebp-18h], edi
  '004F3B70: mov [ebp-18h], ecx
  '004F3B73: mov eax, [ebp+08h]
  '004F3B76: push eax
  '004F3B77: mov edx, [eax]
  '004F3B79: call [edx+08h]
  '004F3B7C: mov eax, [ebp+0Ch]
  '004F3B7F: mov ecx, [ebp-18h]
  '004F3B82: mov [eax], ecx
  '004F3B84: mov eax, [ebp-04h]
  '004F3B87: mov ecx, [ebp-14h]
  '004F3B8A: pop edi
  '004F3B8B: pop esi
  '004F3B8C: mov fs:[00000000h], ecx
  '004F3B93: pop ebx
  '004F3B94: mov esp, ebp
  '004F3B96: pop ebp
  '004F3B97: retn 0008h
End Sub
Private Sub unknown_4F3BA0
  '004F3BA0: push ebp
  '004F3BA1: mov ebp, esp
  '004F3BA3: sub esp, 0000000Ch
  '004F3BA6: push 004081B6h
  '004F3BAB: mov eax, fs:[00h]
  '004F3BB1: push eax
  '004F3BB2: mov fs:[00000000h], esp
  '004F3BB9: sub esp, 0000001Ch
  '004F3BBC: push ebx
  '004F3BBD: push esi
  '004F3BBE: push edi
  '004F3BBF: mov [ebp-0Ch], esp
  '004F3BC2: mov [ebp-08h], 00405818h
  '004F3BC9: mov [ebp-04h], 00000000h
  '004F3BD0: mov esi, [ebp+08h]
  '004F3BD3: push esi
  '004F3BD4: mov eax, [esi]
  '004F3BD6: call [eax+04h]
  '004F3BD9: mov ecx, [ebp+0Ch]
  '004F3BDC: sub esp, 00000010h
  '004F3BDF: mov [esi+000000C8h], ecx
  '004F3BE5: mov edi, esp
  '004F3BE7: mov ecx, 00000008h
  '004F3BEC: mov edx, [esi]
  '004F3BEE: mov [edi], ecx
  '004F3BF0: mov ecx, [ebp-20h]
  '004F3BF3: mov eax, 00427D18h
  '004F3BF8: push esi
  '004F3BF9: mov [edi+04h], ecx
  '004F3BFC: mov [edi+08h], eax
  '004F3BFF: mov eax, [ebp-18h]
  '004F3C02: mov [edi+0Ch], eax
  '004F3C05: call [edx+00000390h]
  '004F3C0B: test eax, eax
  '004F3C0D: fclex 
  '004F3C0F: jnl 4F3C23h
  '004F3C11: push 00000390h
  '004F3C16: push 0042725Ch
  '004F3C1B: push esi
  '004F3C1C: push eax
  '004F3C1D: call [004010A0h]
  '004F3C23: mov ecx, [esi]
  '004F3C25: push esi
  '004F3C26: call [ecx+000007A4h]
  '004F3C2C: test eax, eax
  '004F3C2E: jnl 4F3C42h
  '004F3C30: push 000007A4h
  '004F3C35: push 0042728Ch
  '004F3C3A: push esi
  '004F3C3B: push eax
  '004F3C3C: call [004010A0h]
  '004F3C42: mov eax, [ebp+08h]
  '004F3C45: push eax
  '004F3C46: mov edx, [eax]
  '004F3C48: call [edx+08h]
  '004F3C4B: mov eax, [ebp-04h]
  '004F3C4E: mov ecx, [ebp-14h]
  '004F3C51: pop edi
  '004F3C52: pop esi
  '004F3C53: mov fs:[00000000h], ecx
  '004F3C5A: pop ebx
  '004F3C5B: mov esp, ebp
  '004F3C5D: pop ebp
  '004F3C5E: retn 0008h
End Sub
Private Sub unknown_4F3C70
  '004F3C70: push ebp
  '004F3C71: mov ebp, esp
  '004F3C73: sub esp, 0000000Ch
  '004F3C76: push 004081B6h
  '004F3C7B: mov eax, fs:[00h]
  '004F3C81: push eax
  '004F3C82: mov fs:[00000000h], esp
  '004F3C89: sub esp, 0000000Ch
  '004F3C8C: push ebx
  '004F3C8D: push esi
  '004F3C8E: push edi
  '004F3C8F: mov [ebp-0Ch], esp
  '004F3C92: mov [ebp-08h], 00405820h
  '004F3C99: xor edi, edi
  '004F3C9B: mov [ebp-04h], edi
  '004F3C9E: mov esi, [ebp+08h]
  '004F3CA1: push esi
  '004F3CA2: mov eax, [esi]
  '004F3CA4: call [eax+04h]
  '004F3CA7: mov ecx, [esi+000000CCh]
  '004F3CAD: mov [ebp-18h], edi
  '004F3CB0: mov [ebp-18h], ecx
  '004F3CB3: mov eax, [ebp+08h]
  '004F3CB6: push eax
  '004F3CB7: mov edx, [eax]
  '004F3CB9: call [edx+08h]
  '004F3CBC: mov eax, [ebp+0Ch]
  '004F3CBF: mov ecx, [ebp-18h]
  '004F3CC2: mov [eax], ecx
  '004F3CC4: mov eax, [ebp-04h]
  '004F3CC7: mov ecx, [ebp-14h]
  '004F3CCA: pop edi
  '004F3CCB: pop esi
  '004F3CCC: mov fs:[00000000h], ecx
  '004F3CD3: pop ebx
  '004F3CD4: mov esp, ebp
  '004F3CD6: pop ebp
  '004F3CD7: retn 0008h
End Sub
Private Sub unknown_4F3CE0
  '004F3CE0: push ebp
  '004F3CE1: mov ebp, esp
  '004F3CE3: sub esp, 0000000Ch
  '004F3CE6: push 004081B6h
  '004F3CEB: mov eax, fs:[00h]
  '004F3CF1: push eax
  '004F3CF2: mov fs:[00000000h], esp
  '004F3CF9: sub esp, 0000001Ch
  '004F3CFC: push ebx
  '004F3CFD: push esi
  '004F3CFE: push edi
  '004F3CFF: mov [ebp-0Ch], esp
  '004F3D02: mov [ebp-08h], 00405828h
  '004F3D09: mov [ebp-04h], 00000000h
  '004F3D10: mov esi, [ebp+08h]
  '004F3D13: push esi
  '004F3D14: mov eax, [esi]
  '004F3D16: call [eax+04h]
  '004F3D19: mov ecx, [ebp+0Ch]
  '004F3D1C: sub esp, 00000010h
  '004F3D1F: mov [esi+000000CCh], ecx
  '004F3D25: mov edi, esp
  '004F3D27: mov ecx, 00000008h
  '004F3D2C: mov edx, [esi]
  '004F3D2E: mov [edi], ecx
  '004F3D30: mov ecx, [ebp-20h]
  '004F3D33: mov eax, 00427D38h
  '004F3D38: push esi
  '004F3D39: mov [edi+04h], ecx
  '004F3D3C: mov [edi+08h], eax
  '004F3D3F: mov eax, [ebp-18h]
  '004F3D42: mov [edi+0Ch], eax
  '004F3D45: call [edx+00000390h]
  '004F3D4B: test eax, eax
  '004F3D4D: fclex 
  '004F3D4F: jnl 4F3D63h
  '004F3D51: push 00000390h
  '004F3D56: push 0042725Ch
  '004F3D5B: push esi
  '004F3D5C: push eax
  '004F3D5D: call [004010A0h]
  '004F3D63: mov ecx, [esi]
  '004F3D65: push esi
  '004F3D66: call [ecx+000007A4h]
  '004F3D6C: test eax, eax
  '004F3D6E: jnl 4F3D82h
  '004F3D70: push 000007A4h
  '004F3D75: push 0042728Ch
  '004F3D7A: push esi
  '004F3D7B: push eax
  '004F3D7C: call [004010A0h]
  '004F3D82: mov eax, [ebp+08h]
  '004F3D85: push eax
  '004F3D86: mov edx, [eax]
  '004F3D88: call [edx+08h]
  '004F3D8B: mov eax, [ebp-04h]
  '004F3D8E: mov ecx, [ebp-14h]
  '004F3D91: pop edi
  '004F3D92: pop esi
  '004F3D93: mov fs:[00000000h], ecx
  '004F3D9A: pop ebx
  '004F3D9B: mov esp, ebp
  '004F3D9D: pop ebp
  '004F3D9E: retn 0008h
End Sub
Private Sub unknown_4F3DB0
  '004F3DB0: push ebp
  '004F3DB1: mov ebp, esp
  '004F3DB3: sub esp, 0000000Ch
  '004F3DB6: push 004081B6h
  '004F3DBB: mov eax, fs:[00h]
  '004F3DC1: push eax
  '004F3DC2: mov fs:[00000000h], esp
  '004F3DC9: sub esp, 0000000Ch
  '004F3DCC: push ebx
  '004F3DCD: push esi
  '004F3DCE: push edi
  '004F3DCF: mov [ebp-0Ch], esp
  '004F3DD2: mov [ebp-08h], 00405830h
  '004F3DD9: xor edi, edi
  '004F3DDB: mov [ebp-04h], edi
  '004F3DDE: mov esi, [ebp+08h]
  '004F3DE1: push esi
  '004F3DE2: mov eax, [esi]
  '004F3DE4: call [eax+04h]
  '004F3DE7: mov ecx, [esi+000000D0h]
  '004F3DED: mov [ebp-18h], edi
  '004F3DF0: mov [ebp-18h], ecx
  '004F3DF3: mov eax, [ebp+08h]
  '004F3DF6: push eax
  '004F3DF7: mov edx, [eax]
  '004F3DF9: call [edx+08h]
  '004F3DFC: mov eax, [ebp+0Ch]
  '004F3DFF: mov ecx, [ebp-18h]
  '004F3E02: mov [eax], ecx
  '004F3E04: mov eax, [ebp-04h]
  '004F3E07: mov ecx, [ebp-14h]
  '004F3E0A: pop edi
  '004F3E0B: pop esi
  '004F3E0C: mov fs:[00000000h], ecx
  '004F3E13: pop ebx
  '004F3E14: mov esp, ebp
  '004F3E16: pop ebp
  '004F3E17: retn 0008h
End Sub
Private Sub unknown_4F3E20
  '004F3E20: push ebp
  '004F3E21: mov ebp, esp
  '004F3E23: sub esp, 0000000Ch
  '004F3E26: push 004081B6h
  '004F3E2B: mov eax, fs:[00h]
  '004F3E31: push eax
  '004F3E32: mov fs:[00000000h], esp
  '004F3E39: sub esp, 0000001Ch
  '004F3E3C: push ebx
  '004F3E3D: push esi
  '004F3E3E: push edi
  '004F3E3F: mov [ebp-0Ch], esp
  '004F3E42: mov [ebp-08h], 00405838h
  '004F3E49: mov [ebp-04h], 00000000h
  '004F3E50: mov esi, [ebp+08h]
  '004F3E53: push esi
  '004F3E54: mov eax, [esi]
  '004F3E56: call [eax+04h]
  '004F3E59: sub esp, 00000010h
  '004F3E5C: mov ecx, 00000008h
  '004F3E61: mov ebx, esp
  '004F3E63: mov edi, [ebp+0Ch]
  '004F3E66: mov edx, [esi]
  '004F3E68: mov eax, 00427D58h
  '004F3E6D: mov [ebx], ecx
  '004F3E6F: mov ecx, [ebp-20h]
  '004F3E72: push esi
  '004F3E73: mov [esi+000000D0h], edi
  '004F3E79: mov [ebx+04h], ecx
  '004F3E7C: mov [ebx+08h], eax
  '004F3E7F: mov eax, [ebp-18h]
  '004F3E82: mov [ebx+0Ch], eax
  '004F3E85: call [edx+00000390h]
  '004F3E8B: test eax, eax
  '004F3E8D: fclex 
  '004F3E8F: jnl 4F3EA3h
  '004F3E91: push 00000390h
  '004F3E96: push 0042725Ch
  '004F3E9B: push esi
  '004F3E9C: push eax
  '004F3E9D: call [004010A0h]
  '004F3EA3: test edi, edi
  '004F3EA5: jnz 4F3EAEh
  '004F3EA7: mov eax, 00000010h
  '004F3EAC: jmp 4F3EE5h
  '004F3EAE: cmp edi, 00000001h
  '004F3EB1: jz 4F3EE0h
  '004F3EB3: cmp edi, 00000002h
  '004F3EB6: jnz 4F3EF1h
  '004F3EB8: mov ecx, [esi+000000C4h]
  '004F3EBE: push 00000000h
  '004F3EC0: push ecx
  '004F3EC1: call [00401210h]
  '004F3EC7: test ax, ax
  '004F3ECA: jnz 4F3EE0h
  '004F3ECC: mov edx, [esi+000000A8h]
  '004F3ED2: mov eax, [esi+000000ACh]
  '004F3ED8: mov [esi+000000C8h], edx
  '004F3EDE: jmp 4F3EEBh
  '004F3EE0: mov eax, 00000020h
  '004F3EE5: mov [esi+000000C8h], eax
  '004F3EEB: mov [esi+000000CCh], eax
  '004F3EF1: mov ecx, [esi]
  '004F3EF3: push esi
  '004F3EF4: call [ecx+000007A4h]
  '004F3EFA: test eax, eax
  '004F3EFC: jnl 4F3F10h
  '004F3EFE: push 000007A4h
  '004F3F03: push 0042728Ch
  '004F3F08: push esi
  '004F3F09: push eax
  '004F3F0A: call [004010A0h]
  '004F3F10: mov eax, [ebp+08h]
  '004F3F13: push eax
  '004F3F14: mov edx, [eax]
  '004F3F16: call [edx+08h]
  '004F3F19: mov eax, [ebp-04h]
  '004F3F1C: mov ecx, [ebp-14h]
  '004F3F1F: pop edi
  '004F3F20: pop esi
  '004F3F21: mov fs:[00000000h], ecx
  '004F3F28: pop ebx
  '004F3F29: mov esp, ebp
  '004F3F2B: pop ebp
  '004F3F2C: retn 0008h
End Sub
Private Sub unknown_4F5C20
  '004F5C20: push ebp
  '004F5C21: mov ebp, esp
  '004F5C23: sub esp, 0000000Ch
  '004F5C26: push 004081B6h
  '004F5C2B: mov eax, fs:[00h]
  '004F5C31: push eax
  '004F5C32: mov fs:[00000000h], esp
  '004F5C39: sub esp, 0000000Ch
  '004F5C3C: push ebx
  '004F5C3D: push esi
  '004F5C3E: push edi
  '004F5C3F: mov [ebp-0Ch], esp
  '004F5C42: mov [ebp-08h], 004058E8h
  '004F5C49: xor edi, edi
  '004F5C4B: mov [ebp-04h], edi
  '004F5C4E: mov esi, [ebp+08h]
  '004F5C51: push esi
  '004F5C52: mov eax, [esi]
  '004F5C54: call [eax+04h]
  '004F5C57: mov ecx, [ebp+0Ch]
  '004F5C5A: lea eax, [ebp-18h]
  '004F5C5D: mov [ebp-18h], edi
  '004F5C60: mov [ecx], edi
  '004F5C62: mov edx, [esi+000000B4h]
  '004F5C68: push edx
  '004F5C69: push eax
  '004F5C6A: call [004010F8h]
  '004F5C70: push 004F5C82h
  '004F5C75: jmp 4F5C81h
  '004F5C77: lea ecx, [ebp-18h]
  '004F5C7A: call [004013B8h]
  '004F5C80: ret 
End Sub
Private Sub unknown_4F5CB0
  '004F5CB0: push ebp
  '004F5CB1: mov ebp, esp
  '004F5CB3: sub esp, 0000000Ch
  '004F5CB6: push 004081B6h
  '004F5CBB: mov eax, fs:[00h]
  '004F5CC1: push eax
  '004F5CC2: mov fs:[00000000h], esp
  '004F5CC9: sub esp, 00000020h
  '004F5CCC: push ebx
  '004F5CCD: push esi
  '004F5CCE: push edi
  '004F5CCF: mov [ebp-0Ch], esp
  '004F5CD2: mov [ebp-08h], 004058F8h
  '004F5CD9: xor ebx, ebx
  '004F5CDB: mov [ebp-04h], ebx
  '004F5CDE: mov esi, [ebp+08h]
  '004F5CE1: push esi
  '004F5CE2: mov eax, [esi]
  '004F5CE4: call [eax+04h]
  '004F5CE7: mov ecx, [ebp+0Ch]
  '004F5CEA: mov edi, [004010F8h]
  '004F5CF0: lea edx, [ebp-18h]
  '004F5CF3: push ecx
  '004F5CF4: push edx
  '004F5CF5: mov [ebp-18h], ebx
  '004F5CF8: call edi
  '004F5CFA: mov eax, [ebp-18h]
  '004F5CFD: lea ecx, [esi+000000B4h]
  '004F5D03: push eax
  '004F5D04: push ecx
  '004F5D05: call edi
  '004F5D07: sub esp, 00000010h
  '004F5D0A: mov ecx, 00000008h
  '004F5D0F: mov edi, esp
  '004F5D11: mov edx, [esi]
  '004F5D13: mov eax, 00427DD4h
  '004F5D18: push esi
  '004F5D19: mov [edi], ecx
  '004F5D1B: mov ecx, [ebp-24h]
  '004F5D1E: mov [edi+04h], ecx
  '004F5D21: mov [edi+08h], eax
  '004F5D24: mov eax, [ebp-1Ch]
  '004F5D27: mov [edi+0Ch], eax
  '004F5D2A: call [edx+00000390h]
  '004F5D30: cmp eax, ebx
  '004F5D32: fclex 
  '004F5D34: jnl 4F5D48h
  '004F5D36: push 00000390h
  '004F5D3B: push 0042725Ch
  '004F5D40: push esi
  '004F5D41: push eax
  '004F5D42: call [004010A0h]
  '004F5D48: push 004F5D57h
  '004F5D4D: lea ecx, [ebp-18h]
  '004F5D50: call [004013B8h]
  '004F5D56: ret 
End Sub
Private Sub unknown_4F5D80
  '004F5D80: push ebp
  '004F5D81: mov ebp, esp
  '004F5D83: sub esp, 0000000Ch
  '004F5D86: push 004081B6h
  '004F5D8B: mov eax, fs:[00h]
  '004F5D91: push eax
  '004F5D92: mov fs:[00000000h], esp
  '004F5D99: sub esp, 0000000Ch
  '004F5D9C: push ebx
  '004F5D9D: push esi
  '004F5D9E: push edi
  '004F5D9F: mov [ebp-0Ch], esp
  '004F5DA2: mov [ebp-08h], 00405908h
  '004F5DA9: xor edi, edi
  '004F5DAB: mov [ebp-04h], edi
  '004F5DAE: mov esi, [ebp+08h]
  '004F5DB1: push esi
  '004F5DB2: mov eax, [esi]
  '004F5DB4: call [eax+04h]
  '004F5DB7: mov ecx, [esi+00000124h]
  '004F5DBD: mov [ebp-18h], edi
  '004F5DC0: mov [ebp-18h], ecx
  '004F5DC3: mov eax, [ebp+08h]
  '004F5DC6: push eax
  '004F5DC7: mov edx, [eax]
  '004F5DC9: call [edx+08h]
  '004F5DCC: mov eax, [ebp+0Ch]
  '004F5DCF: mov ecx, [ebp-18h]
  '004F5DD2: mov [eax], ecx
  '004F5DD4: mov eax, [ebp-04h]
  '004F5DD7: mov ecx, [ebp-14h]
  '004F5DDA: pop edi
  '004F5DDB: pop esi
  '004F5DDC: mov fs:[00000000h], ecx
  '004F5DE3: pop ebx
  '004F5DE4: mov esp, ebp
  '004F5DE6: pop ebp
  '004F5DE7: retn 0008h
End Sub
Private Sub unknown_4F5DF0
  '004F5DF0: push ebp
  '004F5DF1: mov ebp, esp
  '004F5DF3: sub esp, 0000000Ch
  '004F5DF6: push 004081B6h
  '004F5DFB: mov eax, fs:[00h]
  '004F5E01: push eax
  '004F5E02: mov fs:[00000000h], esp
  '004F5E09: sub esp, 0000001Ch
  '004F5E0C: push ebx
  '004F5E0D: push esi
  '004F5E0E: push edi
  '004F5E0F: mov [ebp-0Ch], esp
  '004F5E12: mov [ebp-08h], 00405910h
  '004F5E19: mov [ebp-04h], 00000000h
  '004F5E20: mov esi, [ebp+08h]
  '004F5E23: push esi
  '004F5E24: mov eax, [esi]
  '004F5E26: call [eax+04h]
  '004F5E29: mov ecx, [ebp+0Ch]
  '004F5E2C: sub esp, 00000010h
  '004F5E2F: mov [esi+00000124h], ecx
  '004F5E35: mov edi, esp
  '004F5E37: mov ecx, 00000008h
  '004F5E3C: mov edx, [esi]
  '004F5E3E: mov [edi], ecx
  '004F5E40: mov ecx, [ebp-20h]
  '004F5E43: mov eax, 00427E4Ch
  '004F5E48: push esi
  '004F5E49: mov [edi+04h], ecx
  '004F5E4C: mov [edi+08h], eax
  '004F5E4F: mov eax, [ebp-18h]
  '004F5E52: mov [edi+0Ch], eax
  '004F5E55: call [edx+00000390h]
  '004F5E5B: test eax, eax
  '004F5E5D: fclex 
  '004F5E5F: jnl 4F5E73h
  '004F5E61: push 00000390h
  '004F5E66: push 0042725Ch
  '004F5E6B: push esi
  '004F5E6C: push eax
  '004F5E6D: call [004010A0h]
  '004F5E73: mov eax, [ebp+08h]
  '004F5E76: push eax
  '004F5E77: mov ecx, [eax]
  '004F5E79: call [ecx+08h]
  '004F5E7C: mov eax, [ebp-04h]
  '004F5E7F: mov ecx, [ebp-14h]
  '004F5E82: pop edi
  '004F5E83: pop esi
  '004F5E84: mov fs:[00000000h], ecx
  '004F5E8B: pop ebx
  '004F5E8C: mov esp, ebp
  '004F5E8E: pop ebp
  '004F5E8F: retn 0008h
End Sub
Private Sub unknown_4F5EA0
  '004F5EA0: push ebp
  '004F5EA1: mov ebp, esp
  '004F5EA3: sub esp, 0000000Ch
  '004F5EA6: push 004081B6h
  '004F5EAB: mov eax, fs:[00h]
  '004F5EB1: push eax
  '004F5EB2: mov fs:[00000000h], esp
  '004F5EB9: sub esp, 0000000Ch
  '004F5EBC: push ebx
  '004F5EBD: push esi
  '004F5EBE: push edi
  '004F5EBF: mov [ebp-0Ch], esp
  '004F5EC2: mov [ebp-08h], 00405918h
  '004F5EC9: xor edi, edi
  '004F5ECB: mov [ebp-04h], edi
  '004F5ECE: mov esi, [ebp+08h]
  '004F5ED1: push esi
  '004F5ED2: mov eax, [esi]
  '004F5ED4: call [eax+04h]
  '004F5ED7: mov ecx, [esi+00000128h]
  '004F5EDD: mov [ebp-18h], edi
  '004F5EE0: mov [ebp-18h], ecx
  '004F5EE3: mov eax, [ebp+08h]
  '004F5EE6: push eax
  '004F5EE7: mov edx, [eax]
  '004F5EE9: call [edx+08h]
  '004F5EEC: mov eax, [ebp+0Ch]
  '004F5EEF: mov ecx, [ebp-18h]
  '004F5EF2: mov [eax], ecx
  '004F5EF4: mov eax, [ebp-04h]
  '004F5EF7: mov ecx, [ebp-14h]
  '004F5EFA: pop edi
  '004F5EFB: pop esi
  '004F5EFC: mov fs:[00000000h], ecx
  '004F5F03: pop ebx
  '004F5F04: mov esp, ebp
  '004F5F06: pop ebp
  '004F5F07: retn 0008h
End Sub
Private Sub unknown_4F5F10
  '004F5F10: push ebp
  '004F5F11: mov ebp, esp
  '004F5F13: sub esp, 0000000Ch
  '004F5F16: push 004081B6h
  '004F5F1B: mov eax, fs:[00h]
  '004F5F21: push eax
  '004F5F22: mov fs:[00000000h], esp
  '004F5F29: sub esp, 0000001Ch
  '004F5F2C: push ebx
  '004F5F2D: push esi
  '004F5F2E: push edi
  '004F5F2F: mov [ebp-0Ch], esp
  '004F5F32: mov [ebp-08h], 00405920h
  '004F5F39: mov [ebp-04h], 00000000h
  '004F5F40: mov esi, [ebp+08h]
  '004F5F43: push esi
  '004F5F44: mov eax, [esi]
  '004F5F46: call [eax+04h]
  '004F5F49: mov ecx, [ebp+0Ch]
  '004F5F4C: sub esp, 00000010h
  '004F5F4F: mov [esi+00000128h], ecx
  '004F5F55: mov edi, esp
  '004F5F57: mov ecx, 00000008h
  '004F5F5C: mov edx, [esi]
  '004F5F5E: mov [edi], ecx
  '004F5F60: mov ecx, [ebp-20h]
  '004F5F63: mov eax, 00427E70h
  '004F5F68: push esi
  '004F5F69: mov [edi+04h], ecx
  '004F5F6C: mov [edi+08h], eax
  '004F5F6F: mov eax, [ebp-18h]
  '004F5F72: mov [edi+0Ch], eax
  '004F5F75: call [edx+00000390h]
  '004F5F7B: test eax, eax
  '004F5F7D: fclex 
  '004F5F7F: jnl 4F5F93h
  '004F5F81: push 00000390h
  '004F5F86: push 0042725Ch
  '004F5F8B: push esi
  '004F5F8C: push eax
  '004F5F8D: call [004010A0h]
  '004F5F93: mov eax, [ebp+08h]
  '004F5F96: push eax
  '004F5F97: mov ecx, [eax]
  '004F5F99: call [ecx+08h]
  '004F5F9C: mov eax, [ebp-04h]
  '004F5F9F: mov ecx, [ebp-14h]
  '004F5FA2: pop edi
  '004F5FA3: pop esi
  '004F5FA4: mov fs:[00000000h], ecx
  '004F5FAB: pop ebx
  '004F5FAC: mov esp, ebp
  '004F5FAE: pop ebp
  '004F5FAF: retn 0008h
End Sub
Private Sub unknown_4F5FC0
  '004F5FC0: push ebp
  '004F5FC1: mov ebp, esp
  '004F5FC3: sub esp, 0000000Ch
  '004F5FC6: push 004081B6h
  '004F5FCB: mov eax, fs:[00h]
  '004F5FD1: push eax
  '004F5FD2: mov fs:[00000000h], esp
  '004F5FD9: sub esp, 0000000Ch
  '004F5FDC: push ebx
  '004F5FDD: push esi
  '004F5FDE: push edi
  '004F5FDF: mov [ebp-0Ch], esp
  '004F5FE2: mov [ebp-08h], 00405928h
  '004F5FE9: xor edi, edi
  '004F5FEB: mov [ebp-04h], edi
  '004F5FEE: mov esi, [ebp+08h]
  '004F5FF1: push esi
  '004F5FF2: mov eax, [esi]
  '004F5FF4: call [eax+04h]
  '004F5FF7: mov cx, [esi+00000120h]
  '004F5FFE: mov [ebp-18h], edi
  '004F6001: mov [ebp-18h], ecx
  '004F6004: mov eax, [ebp+08h]
  '004F6007: push eax
  '004F6008: mov edx, [eax]
  '004F600A: call [edx+08h]
  '004F600D: mov eax, [ebp+0Ch]
  '004F6010: mov cx, [ebp-18h]
  '004F6014: mov [eax], cx
  '004F6017: mov eax, [ebp-04h]
  '004F601A: mov ecx, [ebp-14h]
  '004F601D: pop edi
  '004F601E: pop esi
  '004F601F: mov fs:[00000000h], ecx
  '004F6026: pop ebx
  '004F6027: mov esp, ebp
  '004F6029: pop ebp
  '004F602A: retn 0008h
End Sub
Private Sub unknown_4F6030
  '004F6030: push ebp
  '004F6031: mov ebp, esp
  '004F6033: sub esp, 0000000Ch
  '004F6036: push 004081B6h
  '004F603B: mov eax, fs:[00h]
  '004F6041: push eax
  '004F6042: mov fs:[00000000h], esp
  '004F6049: sub esp, 0000001Ch
  '004F604C: push ebx
  '004F604D: push esi
  '004F604E: push edi
  '004F604F: mov [ebp-0Ch], esp
  '004F6052: mov [ebp-08h], 00405930h
  '004F6059: mov [ebp-04h], 00000000h
  '004F6060: mov esi, [ebp+08h]
  '004F6063: push esi
  '004F6064: mov eax, [esi]
  '004F6066: call [eax+04h]
  '004F6069: mov cx, [ebp+0Ch]
  '004F606D: sub esp, 00000010h
  '004F6070: mov [esi+00000120h], cx
  '004F6077: mov edi, esp
  '004F6079: mov ecx, 00000008h
  '004F607E: mov edx, [esi]
  '004F6080: mov [edi], ecx
  '004F6082: mov ecx, [ebp-20h]
  '004F6085: mov eax, 00427E90h
  '004F608A: push esi
  '004F608B: mov [edi+04h], ecx
  '004F608E: mov [edi+08h], eax
  '004F6091: mov eax, [ebp-18h]
  '004F6094: mov [edi+0Ch], eax
  '004F6097: call [edx+00000390h]
  '004F609D: test eax, eax
  '004F609F: fclex 
  '004F60A1: jnl 4F60B5h
  '004F60A3: push 00000390h
  '004F60A8: push 0042725Ch
  '004F60AD: push esi
  '004F60AE: push eax
  '004F60AF: call [004010A0h]
  '004F60B5: mov eax, [ebp+08h]
  '004F60B8: push eax
  '004F60B9: mov ecx, [eax]
  '004F60BB: call [ecx+08h]
  '004F60BE: mov eax, [ebp-04h]
  '004F60C1: mov ecx, [ebp-14h]
  '004F60C4: pop edi
  '004F60C5: pop esi
  '004F60C6: mov fs:[00000000h], ecx
  '004F60CD: pop ebx
  '004F60CE: mov esp, ebp
  '004F60D0: pop ebp
  '004F60D1: retn 0008h
End Sub
Private Sub unknown_4F60E0
  '004F60E0: push ebp
  '004F60E1: mov ebp, esp
  '004F60E3: sub esp, 0000000Ch
  '004F60E6: push 004081B6h
  '004F60EB: mov eax, fs:[00h]
  '004F60F1: push eax
  '004F60F2: mov fs:[00000000h], esp
  '004F60F9: sub esp, 0000000Ch
  '004F60FC: push ebx
  '004F60FD: push esi
  '004F60FE: push edi
  '004F60FF: mov [ebp-0Ch], esp
  '004F6102: mov [ebp-08h], 00405938h
  '004F6109: xor edi, edi
  '004F610B: mov [ebp-04h], edi
  '004F610E: mov esi, [ebp+08h]
  '004F6111: push esi
  '004F6112: mov eax, [esi]
  '004F6114: call [eax+04h]
  '004F6117: mov ecx, [esi+0000011Ch]
  '004F611D: mov [ebp-18h], edi
  '004F6120: mov [ebp-18h], ecx
  '004F6123: mov eax, [ebp+08h]
  '004F6126: push eax
  '004F6127: mov edx, [eax]
  '004F6129: call [edx+08h]
  '004F612C: mov eax, [ebp+0Ch]
  '004F612F: mov ecx, [ebp-18h]
  '004F6132: mov [eax], ecx
  '004F6134: mov eax, [ebp-04h]
  '004F6137: mov ecx, [ebp-14h]
  '004F613A: pop edi
  '004F613B: pop esi
  '004F613C: mov fs:[00000000h], ecx
  '004F6143: pop ebx
  '004F6144: mov esp, ebp
  '004F6146: pop ebp
  '004F6147: retn 0008h
End Sub
Private Sub unknown_4F6150
  '004F6150: push ebp
  '004F6151: mov ebp, esp
  '004F6153: sub esp, 0000000Ch
  '004F6156: push 004081B6h
  '004F615B: mov eax, fs:[00h]
  '004F6161: push eax
  '004F6162: mov fs:[00000000h], esp
  '004F6169: sub esp, 0000001Ch
  '004F616C: push ebx
  '004F616D: push esi
  '004F616E: push edi
  '004F616F: mov [ebp-0Ch], esp
  '004F6172: mov [ebp-08h], 00405940h
  '004F6179: mov [ebp-04h], 00000000h
  '004F6180: mov esi, [ebp+08h]
  '004F6183: push esi
  '004F6184: mov eax, [esi]
  '004F6186: call [eax+04h]
  '004F6189: mov ecx, [ebp+0Ch]
  '004F618C: sub esp, 00000010h
  '004F618F: mov [esi+0000011Ch], ecx
  '004F6195: mov edi, esp
  '004F6197: mov ecx, 00000008h
  '004F619C: mov edx, [esi]
  '004F619E: mov [edi], ecx
  '004F61A0: mov ecx, [ebp-20h]
  '004F61A3: mov eax, 00427C50h
  '004F61A8: push esi
  '004F61A9: mov [edi+04h], ecx
  '004F61AC: mov [edi+08h], eax
  '004F61AF: mov eax, [ebp-18h]
  '004F61B2: mov [edi+0Ch], eax
  '004F61B5: call [edx+00000390h]
  '004F61BB: test eax, eax
  '004F61BD: fclex 
  '004F61BF: jnl 4F61D7h
  '004F61C1: mov edi, [004010A0h]
  '004F61C7: push 00000390h
  '004F61CC: push 0042725Ch
  '004F61D1: push esi
  '004F61D2: push eax
  '004F61D3: call edi
  '004F61D5: jmp 4F61DDh
  '004F61D7: mov edi, [004010A0h]
  '004F61DD: mov eax, [esi+10h]
  '004F61E0: mov edx, [esi+0000011Ch]
  '004F61E6: push edx
  '004F61E7: push eax
  '004F61E8: mov ecx, [eax]
  '004F61EA: call [ecx+64h]
  '004F61ED: test eax, eax
  '004F61EF: fclex 
  '004F61F1: jnl 4F6201h
  '004F61F3: mov ecx, [esi+10h]
  '004F61F6: push 00000064h
  '004F61F8: push 0042725Ch
  '004F61FD: push ecx
  '004F61FE: push eax
  '004F61FF: call edi
  '004F6201: mov edx, [esi]
  '004F6203: push esi
  '004F6204: call [edx+000007A4h]
  '004F620A: test eax, eax
  '004F620C: jnl 4F621Ch
  '004F620E: push 000007A4h
  '004F6213: push 0042728Ch
  '004F6218: push esi
  '004F6219: push eax
  '004F621A: call edi
  '004F621C: mov eax, [ebp+08h]
  '004F621F: push eax
  '004F6220: mov ecx, [eax]
  '004F6222: call [ecx+08h]
  '004F6225: mov eax, [ebp-04h]
  '004F6228: mov ecx, [ebp-14h]
  '004F622B: pop edi
  '004F622C: pop esi
  '004F622D: mov fs:[00000000h], ecx
  '004F6234: pop ebx
  '004F6235: mov esp, ebp
  '004F6237: pop ebp
  '004F6238: retn 0008h
End Sub
Private Sub unknown_4F6240
  '004F6240: push ebp
  '004F6241: mov ebp, esp
  '004F6243: sub esp, 0000000Ch
  '004F6246: push 004081B6h
  '004F624B: mov eax, fs:[00h]
  '004F6251: push eax
  '004F6252: mov fs:[00000000h], esp
  '004F6259: sub esp, 0000000Ch
  '004F625C: push ebx
  '004F625D: push esi
  '004F625E: push edi
  '004F625F: mov [ebp-0Ch], esp
  '004F6262: mov [ebp-08h], 00405948h
  '004F6269: xor edi, edi
  '004F626B: mov [ebp-04h], edi
  '004F626E: mov esi, [ebp+08h]
  '004F6271: push esi
  '004F6272: mov eax, [esi]
  '004F6274: call [eax+04h]
  '004F6277: mov ecx, [esi+00000118h]
  '004F627D: mov [ebp-18h], edi
  '004F6280: mov [ebp-18h], ecx
  '004F6283: mov eax, [ebp+08h]
  '004F6286: push eax
  '004F6287: mov edx, [eax]
  '004F6289: call [edx+08h]
  '004F628C: mov eax, [ebp+0Ch]
  '004F628F: mov ecx, [ebp-18h]
  '004F6292: mov [eax], ecx
  '004F6294: mov eax, [ebp-04h]
  '004F6297: mov ecx, [ebp-14h]
  '004F629A: pop edi
  '004F629B: pop esi
  '004F629C: mov fs:[00000000h], ecx
  '004F62A3: pop ebx
  '004F62A4: mov esp, ebp
  '004F62A6: pop ebp
  '004F62A7: retn 0008h
End Sub
Private Sub unknown_4F62B0
  '004F62B0: push ebp
  '004F62B1: mov ebp, esp
  '004F62B3: sub esp, 0000000Ch
  '004F62B6: push 004081B6h
  '004F62BB: mov eax, fs:[00h]
  '004F62C1: push eax
  '004F62C2: mov fs:[00000000h], esp
  '004F62C9: sub esp, 0000001Ch
  '004F62CC: push ebx
  '004F62CD: push esi
  '004F62CE: push edi
  '004F62CF: mov [ebp-0Ch], esp
  '004F62D2: mov [ebp-08h], 00405950h
  '004F62D9: mov [ebp-04h], 00000000h
  '004F62E0: mov esi, [ebp+08h]
  '004F62E3: push esi
  '004F62E4: mov eax, [esi]
  '004F62E6: call [eax+04h]
  '004F62E9: mov ecx, [ebp+0Ch]
  '004F62EC: sub esp, 00000010h
  '004F62EF: mov [esi+00000118h], ecx
  '004F62F5: mov edi, esp
  '004F62F7: mov ecx, 00000008h
  '004F62FC: mov edx, [esi]
  '004F62FE: mov [edi], ecx
  '004F6300: mov ecx, [ebp-20h]
  '004F6303: mov eax, 00427C78h
  '004F6308: push esi
  '004F6309: mov [edi+04h], ecx
  '004F630C: mov [edi+08h], eax
  '004F630F: mov eax, [ebp-18h]
  '004F6312: mov [edi+0Ch], eax
  '004F6315: call [edx+00000390h]
  '004F631B: test eax, eax
  '004F631D: fclex 
  '004F631F: jnl 4F6337h
  '004F6321: mov edi, [004010A0h]
  '004F6327: push 00000390h
  '004F632C: push 0042725Ch
  '004F6331: push esi
  '004F6332: push eax
  '004F6333: call edi
  '004F6335: jmp 4F633Dh
  '004F6337: mov edi, [004010A0h]
  '004F633D: mov eax, [esi+10h]
  '004F6340: mov edx, [esi+00000118h]
  '004F6346: push edx
  '004F6347: push eax
  '004F6348: mov ecx, [eax]
  '004F634A: call [ecx+6Ch]
  '004F634D: test eax, eax
  '004F634F: fclex 
  '004F6351: jnl 4F6361h
  '004F6353: mov ecx, [esi+10h]
  '004F6356: push 0000006Ch
  '004F6358: push 0042725Ch
  '004F635D: push ecx
  '004F635E: push eax
  '004F635F: call edi
  '004F6361: mov edx, [esi]
  '004F6363: push esi
  '004F6364: call [edx+000007A4h]
  '004F636A: test eax, eax
  '004F636C: jnl 4F637Ch
  '004F636E: push 000007A4h
  '004F6373: push 0042728Ch
  '004F6378: push esi
  '004F6379: push eax
  '004F637A: call edi
  '004F637C: mov eax, [ebp+08h]
  '004F637F: push eax
  '004F6380: mov ecx, [eax]
  '004F6382: call [ecx+08h]
  '004F6385: mov eax, [ebp-04h]
  '004F6388: mov ecx, [ebp-14h]
  '004F638B: pop edi
  '004F638C: pop esi
  '004F638D: mov fs:[00000000h], ecx
  '004F6394: pop ebx
  '004F6395: mov esp, ebp
  '004F6397: pop ebp
  '004F6398: retn 0008h
End Sub
Private Sub unknown_4F63A0
  '004F63A0: push ebp
  '004F63A1: mov ebp, esp
  '004F63A3: sub esp, 0000000Ch
  '004F63A6: push 004081B6h
  '004F63AB: mov eax, fs:[00h]
  '004F63B1: push eax
  '004F63B2: mov fs:[00000000h], esp
  '004F63B9: sub esp, 00000028h
  '004F63BC: push ebx
  '004F63BD: push esi
  '004F63BE: push edi
  '004F63BF: mov [ebp-0Ch], esp
  '004F63C2: mov [ebp-08h], 00405958h
  '004F63C9: xor edi, edi
  '004F63CB: mov [ebp-04h], edi
  '004F63CE: mov esi, [ebp+08h]
  '004F63D1: push esi
  '004F63D2: mov eax, [esi]
  '004F63D4: call [eax+04h]
  '004F63D7: mov ecx, [ebp+0Ch]
  '004F63DA: mov [ebp-34h], edi
  '004F63DD: mov [ebp-24h], edi
  '004F63E0: mov [ebp-34h], 00000008h
  '004F63E7: mov [ecx], edi
  '004F63E9: mov edx, [esi+00000110h]
  '004F63EF: mov [ebp-2Ch], edx
  '004F63F2: lea edx, [ebp-34h]
  '004F63F5: lea ecx, [ebp-24h]
  '004F63F8: call [00401358h]
  '004F63FE: push 004F6410h
  '004F6403: jmp 4F640Fh
  '004F6405: lea ecx, [ebp-24h]
  '004F6408: call [00401030h]
  '004F640E: ret 
End Sub
Private Sub unknown_4F6450
  '004F6450: push ebp
  '004F6451: mov ebp, esp
  '004F6453: sub esp, 0000000Ch
  '004F6456: push 004081B6h
  '004F645B: mov eax, fs:[00h]
  '004F6461: push eax
  '004F6462: mov fs:[00000000h], esp
  '004F6469: sub esp, 00000030h
  '004F646C: push ebx
  '004F646D: push esi
  '004F646E: push edi
  '004F646F: mov [ebp-0Ch], esp
  '004F6472: mov [ebp-08h], 00405968h
  '004F6479: xor edi, edi
  '004F647B: mov [ebp-04h], edi
  '004F647E: mov esi, [ebp+08h]
  '004F6481: push esi
  '004F6482: mov eax, [esi]
  '004F6484: call [eax+04h]
  '004F6487: lea edx, [ebp+0Ch]
  '004F648A: lea ecx, [ebp-24h]
  '004F648D: mov [ebp-24h], edi
  '004F6490: mov [ebp-28h], edi
  '004F6493: call [00401338h]
  '004F6499: lea ecx, [ebp-24h]
  '004F649C: push ecx
  '004F649D: call [00401388h]
  '004F64A3: mov edx, eax
  '004F64A5: lea ecx, [ebp-28h]
  '004F64A8: call [00401378h]
  '004F64AE: mov edx, eax
  '004F64B0: lea ecx, [esi+00000110h]
  '004F64B6: call [004012D8h]
  '004F64BC: lea ecx, [ebp-28h]
  '004F64BF: call [004013B4h]
  '004F64C5: sub esp, 00000010h
  '004F64C8: mov ecx, 00000008h
  '004F64CD: mov ebx, esp
  '004F64CF: mov edx, [esi]
  '004F64D1: mov eax, 00427EB4h
  '004F64D6: push esi
  '004F64D7: mov [ebx], ecx
  '004F64D9: mov ecx, [ebp-34h]
  '004F64DC: mov [ebx+04h], ecx
  '004F64DF: mov [ebx+08h], eax
  '004F64E2: mov eax, [ebp-2Ch]
  '004F64E5: mov [ebx+0Ch], eax
  '004F64E8: call [edx+00000390h]
  '004F64EE: cmp eax, edi
  '004F64F0: fclex 
  '004F64F2: jnl 4F6506h
  '004F64F4: push 00000390h
  '004F64F9: push 0042725Ch
  '004F64FE: push esi
  '004F64FF: push eax
  '004F6500: call [004010A0h]
  '004F6506: push 004F6521h
  '004F650B: jmp 4F6517h
  '004F650D: lea ecx, [ebp-28h]
  '004F6510: call [004013B4h]
  '004F6516: ret 
End Sub
Private Sub unknown_4F6540
  '004F6540: push ebp
  '004F6541: mov ebp, esp
  '004F6543: sub esp, 0000000Ch
  '004F6546: push 004081B6h
  '004F654B: mov eax, fs:[00h]
  '004F6551: push eax
  '004F6552: mov fs:[00000000h], esp
  '004F6559: sub esp, 0000000Ch
  '004F655C: push ebx
  '004F655D: push esi
  '004F655E: push edi
  '004F655F: mov [ebp-0Ch], esp
  '004F6562: mov [ebp-08h], 00405978h
  '004F6569: xor edi, edi
  '004F656B: mov [ebp-04h], edi
  '004F656E: mov esi, [ebp+08h]
  '004F6571: push esi
  '004F6572: mov eax, [esi]
  '004F6574: call [eax+04h]
  '004F6577: mov ecx, [ebp+0Ch]
  '004F657A: mov [ebp-18h], edi
  '004F657D: mov [ecx], edi
  '004F657F: mov edx, [esi+00000114h]
  '004F6585: lea ecx, [ebp-18h]
  '004F6588: call [004012D8h]
  '004F658E: push 004F65A0h
  '004F6593: jmp 4F659Fh
  '004F6595: lea ecx, [ebp-18h]
  '004F6598: call [004013B4h]
  '004F659E: ret 
End Sub
Private Sub Refresh_4F65D0
  '004F65D0: push ebp
  '004F65D1: mov ebp, esp
  '004F65D3: sub esp, 0000000Ch
  '004F65D6: push 004081B6h
  '004F65DB: mov eax, fs:[00h]
  '004F65E1: push eax
  '004F65E2: mov fs:[00000000h], esp
  '004F65E9: sub esp, 00000020h
  '004F65EC: push ebx
  '004F65ED: push esi
  '004F65EE: push edi
  '004F65EF: mov [ebp-0Ch], esp
  '004F65F2: mov [ebp-08h], 00405988h
  '004F65F9: xor ebx, ebx
  '004F65FB: mov [ebp-04h], ebx
  '004F65FE: mov esi, [ebp+08h]
  '004F6601: push esi
  '004F6602: mov eax, [esi]
  '004F6604: call [eax+04h]
  '004F6607: mov edx, [ebp+0Ch]
  '004F660A: mov edi, [004012D8h]
  '004F6610: lea ecx, [ebp-18h]
  '004F6613: mov [ebp-18h], ebx
  '004F6616: call edi
  '004F6618: mov edx, [ebp-18h]
  '004F661B: lea ecx, [esi+00000114h]
  '004F6621: call edi
  '004F6623: sub esp, 00000010h
  '004F6626: mov ecx, 00000008h
  '004F662B: mov edi, esp
  '004F662D: mov edx, [esi]
  '004F662F: mov eax, 00427ECCh
  '004F6634: push esi
  '004F6635: mov [edi], ecx
  '004F6637: mov ecx, [ebp-24h]
  '004F663A: mov [edi+04h], ecx
  '004F663D: mov [edi+08h], eax
  '004F6640: mov eax, [ebp-1Ch]
  '004F6643: mov [edi+0Ch], eax
  '004F6646: call [edx+00000390h]
  '004F664C: cmp eax, ebx
  '004F664E: fclex 
  '004F6650: jnl 4F6664h
  '004F6652: push 00000390h
  '004F6657: push 0042725Ch
  '004F665C: push esi
  '004F665D: push eax
  '004F665E: call [004010A0h]
  '004F6664: push 004F6673h
  '004F6669: lea ecx, [ebp-18h]
  '004F666C: call [004013B4h]
  '004F6672: ret 
End Sub
Private Sub unknown_4F66A0
  '004F66A0: push ebp
  '004F66A1: mov ebp, esp
  '004F66A3: sub esp, 0000000Ch
  '004F66A6: push 004081B6h
  '004F66AB: mov eax, fs:[00h]
  '004F66B1: push eax
  '004F66B2: mov fs:[00000000h], esp
  '004F66B9: sub esp, 00000018h
  '004F66BC: push ebx
  '004F66BD: push esi
  '004F66BE: push edi
  '004F66BF: mov [ebp-0Ch], esp
  '004F66C2: mov [ebp-08h], 00405998h
  '004F66C9: xor edi, edi
  '004F66CB: mov [ebp-04h], edi
  '004F66CE: mov esi, [ebp+08h]
  '004F66D1: push esi
  '004F66D2: mov eax, [esi]
  '004F66D4: call [eax+04h]
  '004F66D7: mov ecx, [ebp+0Ch]
  '004F66DA: mov [ebp-18h], edi
  '004F66DD: mov [ebp-1Ch], edi
  '004F66E0: mov [ecx], edi
  '004F66E2: mov eax, [esi+10h]
  '004F66E5: lea ecx, [ebp-1Ch]
  '004F66E8: mov edx, [eax]
  '004F66EA: push ecx
  '004F66EB: push eax
  '004F66EC: call [edx+000001C0h]
  '004F66F2: cmp eax, edi
  '004F66F4: fclex 
  '004F66F6: jnl 4F670Dh
  '004F66F8: mov edx, [esi+10h]
  '004F66FB: push 000001C0h
  '004F6700: push 0042725Ch
  '004F6705: push edx
  '004F6706: push eax
  '004F6707: call [004010A0h]
  '004F670D: mov edx, [ebp-1Ch]
  '004F6710: lea ecx, [ebp-18h]
  '004F6713: mov [ebp-1Ch], edi
  '004F6716: call [00401378h]
  '004F671C: push 004F673Dh
  '004F6721: jmp 4F673Ch
  '004F6723: test byte ptr [ebp-04h], 04h
  '004F6727: jz 4F6732h
  '004F6729: lea ecx, [ebp-18h]
  '004F672C: call [004013B4h]
  '004F6732: lea ecx, [ebp-1Ch]
  '004F6735: call [004013B4h]
  '004F673B: ret 
End Sub
Private Sub unknown_4F6770
  '004F6770: push ebp
  '004F6771: mov ebp, esp
  '004F6773: sub esp, 0000000Ch
  '004F6776: push 004081B6h
  '004F677B: mov eax, fs:[00h]
  '004F6781: push eax
  '004F6782: mov fs:[00000000h], esp
  '004F6789: sub esp, 0000000Ch
  '004F678C: push ebx
  '004F678D: push esi
  '004F678E: push edi
  '004F678F: mov [ebp-0Ch], esp
  '004F6792: mov [ebp-08h], 004059A8h
  '004F6799: xor esi, esi
  '004F679B: mov [ebp-04h], esi
  '004F679E: mov eax, [ebp+08h]
  '004F67A1: push eax
  '004F67A2: mov ecx, [eax]
  '004F67A4: call [ecx+04h]
  '004F67A7: mov edx, [ebp+0Ch]
  '004F67AA: lea ecx, [ebp-18h]
  '004F67AD: mov [ebp-18h], esi
  '004F67B0: call [004012D8h]
  '004F67B6: push 004F67C5h
  '004F67BB: lea ecx, [ebp-18h]
  '004F67BE: call [004013B4h]
  '004F67C4: ret 
End Sub
Private Sub unknown_4F68A0
  '004F68A0: push ebp
  '004F68A1: mov ebp, esp
  '004F68A3: sub esp, 0000000Ch
  '004F68A6: push 004081B6h
  '004F68AB: mov eax, fs:[00h]
  '004F68B1: push eax
  '004F68B2: mov fs:[00000000h], esp
  '004F68B9: sub esp, 0000000Ch
  '004F68BC: push ebx
  '004F68BD: push esi
  '004F68BE: push edi
  '004F68BF: mov [ebp-0Ch], esp
  '004F68C2: mov [ebp-08h], 004059C8h
  '004F68C9: xor edi, edi
  '004F68CB: mov [ebp-04h], edi
  '004F68CE: mov esi, [ebp+08h]
  '004F68D1: push esi
  '004F68D2: mov eax, [esi]
  '004F68D4: call [eax+04h]
  '004F68D7: mov cx, [esi+0000010Eh]
  '004F68DE: mov [ebp-18h], edi
  '004F68E1: mov [ebp-18h], ecx
  '004F68E4: mov eax, [ebp+08h]
  '004F68E7: push eax
  '004F68E8: mov edx, [eax]
  '004F68EA: call [edx+08h]
  '004F68ED: mov eax, [ebp+0Ch]
  '004F68F0: mov cx, [ebp-18h]
  '004F68F4: mov [eax], cx
  '004F68F7: mov eax, [ebp-04h]
  '004F68FA: mov ecx, [ebp-14h]
  '004F68FD: pop edi
  '004F68FE: pop esi
  '004F68FF: mov fs:[00000000h], ecx
  '004F6906: pop ebx
  '004F6907: mov esp, ebp
  '004F6909: pop ebp
  '004F690A: retn 0008h
End Sub
Private Sub unknown_4F6910
  '004F6910: push ebp
  '004F6911: mov ebp, esp
  '004F6913: sub esp, 0000000Ch
  '004F6916: push 004081B6h
  '004F691B: mov eax, fs:[00h]
  '004F6921: push eax
  '004F6922: mov fs:[00000000h], esp
  '004F6929: sub esp, 00000038h
  '004F692C: push ebx
  '004F692D: push esi
  '004F692E: push edi
  '004F692F: mov [ebp-0Ch], esp
  '004F6932: mov [ebp-08h], 004059D0h
  '004F6939: xor edi, edi
  '004F693B: mov [ebp-04h], edi
  '004F693E: mov esi, [ebp+08h]
  '004F6941: push esi
  '004F6942: mov eax, [esi]
  '004F6944: call [eax+04h]
  '004F6947: mov cx, [ebp+0Ch]
  '004F694B: sub esp, 00000010h
  '004F694E: mov [esi+0000010Eh], cx
  '004F6955: mov ebx, esp
  '004F6957: mov ecx, 00000008h
  '004F695C: mov edx, [esi]
  '004F695E: mov [ebx], ecx
  '004F6960: mov ecx, [ebp-2Ch]
  '004F6963: mov eax, 00427EE8h
  '004F6968: push esi
  '004F6969: mov [ebx+04h], ecx
  '004F696C: mov [ebp-18h], edi
  '004F696F: mov [ebp-1Ch], edi
  '004F6972: mov [ebp-20h], edi
  '004F6975: mov [ebx+08h], eax
  '004F6978: mov eax, [ebp-24h]
  '004F697B: mov [ebx+0Ch], eax
  '004F697E: call [edx+00000390h]
  '004F6984: cmp eax, edi
  '004F6986: fclex 
  '004F6988: jnl 4F69A0h
  '004F698A: mov ebx, [004010A0h]
  '004F6990: push 00000390h
  '004F6995: push 0042725Ch
  '004F699A: push esi
  '004F699B: push eax
  '004F699C: call ebx
  '004F699E: jmp 4F69A6h
  '004F69A0: mov ebx, [004010A0h]
  '004F69A6: cmp word ptr [esi+0000010Eh], FFFFh
  '004F69AE: jnz 004F6A5Bh
  '004F69B4: mov ecx, [esi]
  '004F69B6: push esi
  '004F69B7: call [ecx+000003ACh]
  '004F69BD: lea edx, [ebp-18h]
  '004F69C0: push eax
  '004F69C1: push edx
  '004F69C2: call [004010E4h]
  '004F69C8: mov edi, eax
  '004F69CA: lea ecx, [ebp-1Ch]
  '004F69CD: push ecx
  '004F69CE: push edi
  '004F69CF: mov eax, [edi]
  '004F69D1: call [eax+58h]
  '004F69D4: test eax, eax
  '004F69D6: fclex 
  '004F69D8: jnl 4F69E5h
  '004F69DA: push 00000058h
  '004F69DC: push 00420F90h
  '004F69E1: push edi
  '004F69E2: push eax
  '004F69E3: call ebx
  '004F69E5: mov eax, [ebp-1Ch]
  '004F69E8: mov edx, [esi+10h]
  '004F69EB: push eax
  '004F69EC: lea eax, [ebp-20h]
  '004F69EF: mov [ebp-1Ch], 00000000h
  '004F69F6: mov edi, [edx]
  '004F69F8: push eax
  '004F69F9: call [004010E4h]
  '004F69FF: mov ecx, [esi+10h]
  '004F6A02: push eax
  '004F6A03: push ecx
  '004F6A04: call [edi+00000224h]
  '004F6A0A: test eax, eax
  '004F6A0C: fclex 
  '004F6A0E: jnl 4F6A21h
  '004F6A10: mov edx, [esi+10h]
  '004F6A13: push 00000224h
  '004F6A18: push 0042725Ch
  '004F6A1D: push edx
  '004F6A1E: push eax
  '004F6A1F: call ebx
  '004F6A21: lea eax, [ebp-20h]
  '004F6A24: lea ecx, [ebp-18h]
  '004F6A27: push eax
  '004F6A28: push ecx
  '004F6A29: push 00000002h
  '004F6A2B: call [00401064h]
  '004F6A31: mov eax, [esi+10h]
  '004F6A34: add esp, 0000000Ch
  '004F6A37: mov edx, [eax]
  '004F6A39: push 00000063h
  '004F6A3B: push eax
  '004F6A3C: call [edx+000000A4h]
  '004F6A42: test eax, eax
  '004F6A44: fclex 
  '004F6A46: jnl 4F6AA8h
  '004F6A48: mov ecx, [esi+10h]
  '004F6A4B: push 000000A4h
  '004F6A50: push 0042725Ch
  '004F6A55: push ecx
  '004F6A56: push eax
  '004F6A57: call ebx
  '004F6A59: jmp 4F6AA8h
  '004F6A5B: mov edx, [esi+10h]
  '004F6A5E: push 004210C8h
  '004F6A63: push edi
  '004F6A64: mov edx, [edx]
  '004F6A66: mov [ebp-4Ch], edx
  '004F6A69: call [0040137Ch]
  '004F6A6F: push eax
  '004F6A70: lea eax, [ebp-18h]
  '004F6A73: push eax
  '004F6A74: call [004010E4h]
  '004F6A7A: mov ecx, [esi+10h]
  '004F6A7D: mov edx, [ebp-4Ch]
  '004F6A80: push eax
  '004F6A81: push ecx
  '004F6A82: call [edx+00000224h]
  '004F6A88: test eax, eax
  '004F6A8A: fclex 
  '004F6A8C: jnl 4F6A9Fh
  '004F6A8E: mov ecx, [esi+10h]
  '004F6A91: push 00000224h
  '004F6A96: push 0042725Ch
  '004F6A9B: push ecx
  '004F6A9C: push eax
  '004F6A9D: call ebx
  '004F6A9F: lea ecx, [ebp-18h]
  '004F6AA2: call [004013B8h]
  '004F6AA8: push 004F6AC8h
  '004F6AAD: jmp 4F6AC7h
  '004F6AAF: lea edx, [ebp-20h]
  '004F6AB2: lea eax, [ebp-1Ch]
  '004F6AB5: push edx
  '004F6AB6: lea ecx, [ebp-18h]
  '004F6AB9: push eax
  '004F6ABA: push ecx
  '004F6ABB: push 00000003h
  '004F6ABD: call [00401064h]
  '004F6AC3: add esp, 00000010h
  '004F6AC6: ret 
End Sub
Private Sub unknown_4F6AF0
  '004F6AF0: push ebp
  '004F6AF1: mov ebp, esp
  '004F6AF3: sub esp, 0000000Ch
  '004F6AF6: push 004081B6h
  '004F6AFB: mov eax, fs:[00h]
  '004F6B01: push eax
  '004F6B02: mov fs:[00000000h], esp
  '004F6B09: sub esp, 0000000Ch
  '004F6B0C: push ebx
  '004F6B0D: push esi
  '004F6B0E: push edi
  '004F6B0F: mov [ebp-0Ch], esp
  '004F6B12: mov [ebp-08h], 004059E0h
  '004F6B19: xor edi, edi
  '004F6B1B: mov [ebp-04h], edi
  '004F6B1E: mov esi, [ebp+08h]
  '004F6B21: push esi
  '004F6B22: mov eax, [esi]
  '004F6B24: call [eax+04h]
  '004F6B27: mov cx, [esi+0000010Ch]
  '004F6B2E: mov [ebp-18h], edi
  '004F6B31: mov [ebp-18h], ecx
  '004F6B34: mov eax, [ebp+08h]
  '004F6B37: push eax
  '004F6B38: mov edx, [eax]
  '004F6B3A: call [edx+08h]
  '004F6B3D: mov eax, [ebp+0Ch]
  '004F6B40: mov cx, [ebp-18h]
  '004F6B44: mov [eax], cx
  '004F6B47: mov eax, [ebp-04h]
  '004F6B4A: mov ecx, [ebp-14h]
  '004F6B4D: pop edi
  '004F6B4E: pop esi
  '004F6B4F: mov fs:[00000000h], ecx
  '004F6B56: pop ebx
  '004F6B57: mov esp, ebp
  '004F6B59: pop ebp
  '004F6B5A: retn 0008h
End Sub
Private Sub unknown_4F6B60
  '004F6B60: push ebp
  '004F6B61: mov ebp, esp
  '004F6B63: sub esp, 0000000Ch
  '004F6B66: push 004081B6h
  '004F6B6B: mov eax, fs:[00h]
  '004F6B71: push eax
  '004F6B72: mov fs:[00000000h], esp
  '004F6B79: sub esp, 0000001Ch
  '004F6B7C: push ebx
  '004F6B7D: push esi
  '004F6B7E: push edi
  '004F6B7F: mov [ebp-0Ch], esp
  '004F6B82: mov [ebp-08h], 004059E8h
  '004F6B89: mov [ebp-04h], 00000000h
  '004F6B90: mov esi, [ebp+08h]
  '004F6B93: push esi
  '004F6B94: mov eax, [esi]
  '004F6B96: call [eax+04h]
  '004F6B99: mov cx, [ebp+0Ch]
  '004F6B9D: sub esp, 00000010h
  '004F6BA0: mov [esi+0000010Ch], cx
  '004F6BA7: mov edi, esp
  '004F6BA9: mov ecx, 00000008h
  '004F6BAE: mov edx, [esi]
  '004F6BB0: mov [edi], ecx
  '004F6BB2: mov ecx, [ebp-20h]
  '004F6BB5: mov eax, 00427F04h
  '004F6BBA: push esi
  '004F6BBB: mov [edi+04h], ecx
  '004F6BBE: mov [edi+08h], eax
  '004F6BC1: mov eax, [ebp-18h]
  '004F6BC4: mov [edi+0Ch], eax
  '004F6BC7: call [edx+00000390h]
  '004F6BCD: test eax, eax
  '004F6BCF: fclex 
  '004F6BD1: jnl 4F6BE5h
  '004F6BD3: push 00000390h
  '004F6BD8: push 0042725Ch
  '004F6BDD: push esi
  '004F6BDE: push eax
  '004F6BDF: call [004010A0h]
  '004F6BE5: mov eax, [ebp+08h]
  '004F6BE8: push eax
  '004F6BE9: mov ecx, [eax]
  '004F6BEB: call [ecx+08h]
  '004F6BEE: mov eax, [ebp-04h]
  '004F6BF1: mov ecx, [ebp-14h]
  '004F6BF4: pop edi
  '004F6BF5: pop esi
  '004F6BF6: mov fs:[00000000h], ecx
  '004F6BFD: pop ebx
  '004F6BFE: mov esp, ebp
  '004F6C00: pop ebp
  '004F6C01: retn 0008h
End Sub
Private Sub unknown_4F6C10
  '004F6C10: push ebp
  '004F6C11: mov ebp, esp
  '004F6C13: sub esp, 0000000Ch
  '004F6C16: push 004081B6h
  '004F6C1B: mov eax, fs:[00h]
  '004F6C21: push eax
  '004F6C22: mov fs:[00000000h], esp
  '004F6C29: sub esp, 0000000Ch
  '004F6C2C: push ebx
  '004F6C2D: push esi
  '004F6C2E: push edi
  '004F6C2F: mov [ebp-0Ch], esp
  '004F6C32: mov [ebp-08h], 004059F0h
  '004F6C39: xor edi, edi
  '004F6C3B: mov [ebp-04h], edi
  '004F6C3E: mov esi, [ebp+08h]
  '004F6C41: push esi
  '004F6C42: mov eax, [esi]
  '004F6C44: call [eax+04h]
  '004F6C47: mov ecx, [esi+00000108h]
  '004F6C4D: mov [ebp-18h], edi
  '004F6C50: mov [ebp-18h], ecx
  '004F6C53: mov eax, [ebp+08h]
  '004F6C56: push eax
  '004F6C57: mov edx, [eax]
  '004F6C59: call [edx+08h]
  '004F6C5C: mov eax, [ebp+0Ch]
  '004F6C5F: mov ecx, [ebp-18h]
  '004F6C62: mov [eax], ecx
  '004F6C64: mov eax, [ebp-04h]
  '004F6C67: mov ecx, [ebp-14h]
  '004F6C6A: pop edi
  '004F6C6B: pop esi
  '004F6C6C: mov fs:[00000000h], ecx
  '004F6C73: pop ebx
  '004F6C74: mov esp, ebp
  '004F6C76: pop ebp
  '004F6C77: retn 0008h
End Sub
Private Sub Enabled_4F6C80
  '004F6C80: push ebp
  '004F6C81: mov ebp, esp
  '004F6C83: sub esp, 0000000Ch
  '004F6C86: push 004081B6h
  '004F6C8B: mov eax, fs:[00h]
  '004F6C91: push eax
  '004F6C92: mov fs:[00000000h], esp
  '004F6C99: sub esp, 0000001Ch
  '004F6C9C: push ebx
  '004F6C9D: push esi
  '004F6C9E: push edi
  '004F6C9F: mov [ebp-0Ch], esp
  '004F6CA2: mov [ebp-08h], 004059F8h
  '004F6CA9: mov [ebp-04h], 00000000h
  '004F6CB0: mov esi, [ebp+08h]
  '004F6CB3: push esi
  '004F6CB4: mov eax, [esi]
  '004F6CB6: call [eax+04h]
  '004F6CB9: mov ecx, [ebp+0Ch]
  '004F6CBC: sub esp, 00000010h
  '004F6CBF: mov [esi+00000108h], ecx
  '004F6CC5: mov edi, esp
  '004F6CC7: mov ecx, 00000008h
  '004F6CCC: mov edx, [esi]
  '004F6CCE: mov [edi], ecx
  '004F6CD0: mov ecx, [ebp-20h]
  '004F6CD3: mov eax, 00426F4Ch
  '004F6CD8: push esi
  '004F6CD9: mov [edi+04h], ecx
  '004F6CDC: mov [edi+08h], eax
  '004F6CDF: mov eax, [ebp-18h]
  '004F6CE2: mov [edi+0Ch], eax
  '004F6CE5: call [edx+00000390h]
  '004F6CEB: test eax, eax
  '004F6CED: fclex 
  '004F6CEF: jnl 4F6D03h
  '004F6CF1: push 00000390h
  '004F6CF6: push 0042725Ch
  '004F6CFB: push esi
  '004F6CFC: push eax
  '004F6CFD: call [004010A0h]
  '004F6D03: mov ecx, [esi]
  '004F6D05: push esi
  '004F6D06: call [ecx+000007A4h]
  '004F6D0C: test eax, eax
  '004F6D0E: jnl 4F6D22h
  '004F6D10: push 000007A4h
  '004F6D15: push 0042728Ch
  '004F6D1A: push esi
  '004F6D1B: push eax
  '004F6D1C: call [004010A0h]
  '004F6D22: mov eax, [ebp+08h]
  '004F6D25: push eax
  '004F6D26: mov edx, [eax]
  '004F6D28: call [edx+08h]
  '004F6D2B: mov eax, [ebp-04h]
  '004F6D2E: mov ecx, [ebp-14h]
  '004F6D31: pop edi
  '004F6D32: pop esi
  '004F6D33: mov fs:[00000000h], ecx
  '004F6D3A: pop ebx
  '004F6D3B: mov esp, ebp
  '004F6D3D: pop ebp
  '004F6D3E: retn 0008h
End Sub
Private Sub Enabled_4F6D50
  '004F6D50: push ebp
  '004F6D51: mov ebp, esp
  '004F6D53: sub esp, 0000000Ch
  '004F6D56: push 004081B6h
  '004F6D5B: mov eax, fs:[00h]
  '004F6D61: push eax
  '004F6D62: mov fs:[00000000h], esp
  '004F6D69: sub esp, 0000000Ch
  '004F6D6C: push ebx
  '004F6D6D: push esi
  '004F6D6E: push edi
  '004F6D6F: mov [ebp-0Ch], esp
  '004F6D72: mov [ebp-08h], 00405A00h
  '004F6D79: xor edi, edi
  '004F6D7B: mov [ebp-04h], edi
  '004F6D7E: mov esi, [ebp+08h]
  '004F6D81: push esi
  '004F6D82: mov eax, [esi]
  '004F6D84: call [eax+04h]
  '004F6D87: mov cx, [esi+00000106h]
  '004F6D8E: mov [ebp-18h], edi
  '004F6D91: mov [ebp-18h], ecx
  '004F6D94: mov eax, [ebp+08h]
  '004F6D97: push eax
  '004F6D98: mov edx, [eax]
  '004F6D9A: call [edx+08h]
  '004F6D9D: mov eax, [ebp+0Ch]
  '004F6DA0: mov cx, [ebp-18h]
  '004F6DA4: mov [eax], cx
  '004F6DA7: mov eax, [ebp-04h]
  '004F6DAA: mov ecx, [ebp-14h]
  '004F6DAD: pop edi
  '004F6DAE: pop esi
  '004F6DAF: mov fs:[00000000h], ecx
  '004F6DB6: pop ebx
  '004F6DB7: mov esp, ebp
  '004F6DB9: pop ebp
  '004F6DBA: retn 0008h
End Sub
Private Sub Font_4F6DC0
  '004F6DC0: push ebp
  '004F6DC1: mov ebp, esp
  '004F6DC3: sub esp, 0000000Ch
  '004F6DC6: push 004081B6h
  '004F6DCB: mov eax, fs:[00h]
  '004F6DD1: push eax
  '004F6DD2: mov fs:[00000000h], esp
  '004F6DD9: sub esp, 0000001Ch
  '004F6DDC: push ebx
  '004F6DDD: push esi
  '004F6DDE: push edi
  '004F6DDF: mov [ebp-0Ch], esp
  '004F6DE2: mov [ebp-08h], 00405A08h
  '004F6DE9: mov [ebp-04h], 00000000h
  '004F6DF0: mov esi, [ebp+08h]
  '004F6DF3: push esi
  '004F6DF4: mov eax, [esi]
  '004F6DF6: call [eax+04h]
  '004F6DF9: mov cx, [ebp+0Ch]
  '004F6DFD: sub esp, 00000010h
  '004F6E00: mov [esi+00000106h], cx
  '004F6E07: mov edi, esp
  '004F6E09: mov ecx, 00000008h
  '004F6E0E: mov edx, [esi]
  '004F6E10: mov [edi], ecx
  '004F6E12: mov ecx, [ebp-20h]
  '004F6E15: mov eax, 00427F30h
  '004F6E1A: push esi
  '004F6E1B: mov [edi+04h], ecx
  '004F6E1E: mov [edi+08h], eax
  '004F6E21: mov eax, [ebp-18h]
  '004F6E24: mov [edi+0Ch], eax
  '004F6E27: call [edx+00000390h]
  '004F6E2D: test eax, eax
  '004F6E2F: fclex 
  '004F6E31: jnl 4F6E45h
  '004F6E33: push 00000390h
  '004F6E38: push 0042725Ch
  '004F6E3D: push esi
  '004F6E3E: push eax
  '004F6E3F: call [004010A0h]
  '004F6E45: mov ecx, [esi]
  '004F6E47: push esi
  '004F6E48: call [ecx+000007A4h]
  '004F6E4E: test eax, eax
  '004F6E50: jnl 4F6E64h
  '004F6E52: push 000007A4h
  '004F6E57: push 0042728Ch
  '004F6E5C: push esi
  '004F6E5D: push eax
  '004F6E5E: call [004010A0h]
  '004F6E64: mov eax, [ebp+08h]
  '004F6E67: push eax
  '004F6E68: mov edx, [eax]
  '004F6E6A: call [edx+08h]
  '004F6E6D: mov eax, [ebp-04h]
  '004F6E70: mov ecx, [ebp-14h]
  '004F6E73: pop edi
  '004F6E74: pop esi
  '004F6E75: mov fs:[00000000h], ecx
  '004F6E7C: pop ebx
  '004F6E7D: mov esp, ebp
  '004F6E7F: pop ebp
  '004F6E80: retn 0008h
End Sub
Private Sub Font_4F6E90
  '004F6E90: push ebp
  '004F6E91: mov ebp, esp
  '004F6E93: sub esp, 0000000Ch
  '004F6E96: push 004081B6h
  '004F6E9B: mov eax, fs:[00h]
  '004F6EA1: push eax
  '004F6EA2: mov fs:[00000000h], esp
  '004F6EA9: sub esp, 0000000Ch
  '004F6EAC: push ebx
  '004F6EAD: push esi
  '004F6EAE: push edi
  '004F6EAF: mov [ebp-0Ch], esp
  '004F6EB2: mov [ebp-08h], 00405A10h
  '004F6EB9: xor edi, edi
  '004F6EBB: mov [ebp-04h], edi
  '004F6EBE: mov esi, [ebp+08h]
  '004F6EC1: push esi
  '004F6EC2: mov eax, [esi]
  '004F6EC4: call [eax+04h]
  '004F6EC7: mov cx, [esi+00000102h]
  '004F6ECE: mov [ebp-18h], edi
  '004F6ED1: mov [ebp-18h], ecx
  '004F6ED4: mov eax, [ebp+08h]
  '004F6ED7: push eax
  '004F6ED8: mov edx, [eax]
  '004F6EDA: call [edx+08h]
  '004F6EDD: mov eax, [ebp+0Ch]
  '004F6EE0: mov cx, [ebp-18h]
  '004F6EE4: mov [eax], cx
  '004F6EE7: mov eax, [ebp-04h]
  '004F6EEA: mov ecx, [ebp-14h]
  '004F6EED: pop edi
  '004F6EEE: pop esi
  '004F6EEF: mov fs:[00000000h], ecx
  '004F6EF6: pop ebx
  '004F6EF7: mov esp, ebp
  '004F6EF9: pop ebp
  '004F6EFA: retn 0008h
End Sub
Private Sub g_Font_FontChanged_4F6F00
  '004F6F00: push ebp
  '004F6F01: mov ebp, esp
  '004F6F03: sub esp, 0000000Ch
  '004F6F06: push 004081B6h
  '004F6F0B: mov eax, fs:[00h]
  '004F6F11: push eax
  '004F6F12: mov fs:[00000000h], esp
  '004F6F19: sub esp, 0000001Ch
  '004F6F1C: push ebx
  '004F6F1D: push esi
  '004F6F1E: push edi
  '004F6F1F: mov [ebp-0Ch], esp
  '004F6F22: mov [ebp-08h], 00405A18h
  '004F6F29: mov [ebp-04h], 00000000h
  '004F6F30: mov esi, [ebp+08h]
  '004F6F33: push esi
  '004F6F34: mov eax, [esi]
  '004F6F36: call [eax+04h]
  '004F6F39: mov cx, [ebp+0Ch]
  '004F6F3D: sub esp, 00000010h
  '004F6F40: mov [esi+00000102h], cx
  '004F6F47: mov edi, esp
  '004F6F49: mov ecx, 00000008h
  '004F6F4E: mov edx, [esi]
  '004F6F50: mov [edi], ecx
  '004F6F52: mov ecx, [ebp-20h]
  '004F6F55: mov eax, 00427F50h
  '004F6F5A: push esi
  '004F6F5B: mov [edi+04h], ecx
  '004F6F5E: mov [edi+08h], eax
  '004F6F61: mov eax, [ebp-18h]
  '004F6F64: mov [edi+0Ch], eax
  '004F6F67: call [edx+00000390h]
  '004F6F6D: test eax, eax
  '004F6F6F: fclex 
  '004F6F71: jnl 4F6F85h
  '004F6F73: push 00000390h
  '004F6F78: push 0042725Ch
  '004F6F7D: push esi
  '004F6F7E: push eax
  '004F6F7F: call [004010A0h]
  '004F6F85: mov ecx, [esi]
  '004F6F87: push esi
  '004F6F88: call [ecx+000007A4h]
  '004F6F8E: test eax, eax
  '004F6F90: jnl 4F6FA4h
  '004F6F92: push 000007A4h
  '004F6F97: push 0042728Ch
  '004F6F9C: push esi
  '004F6F9D: push eax
  '004F6F9E: call [004010A0h]
  '004F6FA4: mov eax, [ebp+08h]
  '004F6FA7: push eax
  '004F6FA8: mov edx, [eax]
  '004F6FAA: call [edx+08h]
  '004F6FAD: mov eax, [ebp-04h]
  '004F6FB0: mov ecx, [ebp-14h]
  '004F6FB3: pop edi
  '004F6FB4: pop esi
  '004F6FB5: mov fs:[00000000h], ecx
  '004F6FBC: pop ebx
  '004F6FBD: mov esp, ebp
  '004F6FBF: pop ebp
  '004F6FC0: retn 0008h
End Sub
Private Sub hwnd_4F6FD0
  '004F6FD0: push ebp
  '004F6FD1: mov ebp, esp
  '004F6FD3: sub esp, 0000000Ch
  '004F6FD6: push 004081B6h
  '004F6FDB: mov eax, fs:[00h]
  '004F6FE1: push eax
  '004F6FE2: mov fs:[00000000h], esp
  '004F6FE9: sub esp, 0000000Ch
  '004F6FEC: push ebx
  '004F6FED: push esi
  '004F6FEE: push edi
  '004F6FEF: mov [ebp-0Ch], esp
  '004F6FF2: mov [ebp-08h], 00405A20h
  '004F6FF9: xor edi, edi
  '004F6FFB: mov [ebp-04h], edi
  '004F6FFE: mov esi, [ebp+08h]
  '004F7001: push esi
  '004F7002: mov eax, [esi]
  '004F7004: call [eax+04h]
  '004F7007: mov cx, [esi+00000104h]
  '004F700E: mov [ebp-18h], edi
  '004F7011: mov [ebp-18h], ecx
  '004F7014: mov eax, [ebp+08h]
  '004F7017: push eax
  '004F7018: mov edx, [eax]
  '004F701A: call [edx+08h]
  '004F701D: mov eax, [ebp+0Ch]
  '004F7020: mov cx, [ebp-18h]
  '004F7024: mov [eax], cx
  '004F7027: mov eax, [ebp-04h]
  '004F702A: mov ecx, [ebp-14h]
  '004F702D: pop edi
  '004F702E: pop esi
  '004F702F: mov fs:[00000000h], ecx
  '004F7036: pop ebx
  '004F7037: mov esp, ebp
  '004F7039: pop ebp
  '004F703A: retn 0008h
End Sub
Private Sub MousePointer_4F7040
  '004F7040: push ebp
  '004F7041: mov ebp, esp
  '004F7043: sub esp, 0000000Ch
  '004F7046: push 004081B6h
  '004F704B: mov eax, fs:[00h]
  '004F7051: push eax
  '004F7052: mov fs:[00000000h], esp
  '004F7059: sub esp, 0000001Ch
  '004F705C: push ebx
  '004F705D: push esi
  '004F705E: push edi
  '004F705F: mov [ebp-0Ch], esp
  '004F7062: mov [ebp-08h], 00405A28h
  '004F7069: mov [ebp-04h], 00000000h
  '004F7070: mov esi, [ebp+08h]
  '004F7073: push esi
  '004F7074: mov eax, [esi]
  '004F7076: call [eax+04h]
  '004F7079: mov cx, [ebp+0Ch]
  '004F707D: sub esp, 00000010h
  '004F7080: mov [esi+00000104h], cx
  '004F7087: mov edi, esp
  '004F7089: mov ecx, 00000008h
  '004F708E: mov edx, [esi]
  '004F7090: mov [edi], ecx
  '004F7092: mov ecx, [ebp-20h]
  '004F7095: mov eax, 00427F60h
  '004F709A: push esi
  '004F709B: mov [edi+04h], ecx
  '004F709E: mov [edi+08h], eax
  '004F70A1: mov eax, [ebp-18h]
  '004F70A4: mov [edi+0Ch], eax
  '004F70A7: call [edx+00000390h]
  '004F70AD: test eax, eax
  '004F70AF: fclex 
  '004F70B1: jnl 4F70C5h
  '004F70B3: push 00000390h
  '004F70B8: push 0042725Ch
  '004F70BD: push esi
  '004F70BE: push eax
  '004F70BF: call [004010A0h]
  '004F70C5: mov ecx, [esi]
  '004F70C7: push esi
  '004F70C8: call [ecx+000007A4h]
  '004F70CE: test eax, eax
  '004F70D0: jnl 4F70E4h
  '004F70D2: push 000007A4h
  '004F70D7: push 0042728Ch
  '004F70DC: push esi
  '004F70DD: push eax
  '004F70DE: call [004010A0h]
  '004F70E4: mov eax, [ebp+08h]
  '004F70E7: push eax
  '004F70E8: mov edx, [eax]
  '004F70EA: call [edx+08h]
  '004F70ED: mov eax, [ebp-04h]
  '004F70F0: mov ecx, [ebp-14h]
  '004F70F3: pop edi
  '004F70F4: pop esi
  '004F70F5: mov fs:[00000000h], ecx
  '004F70FC: pop ebx
  '004F70FD: mov esp, ebp
  '004F70FF: pop ebp
  '004F7100: retn 0008h
End Sub
Private Sub ShowFocusRect_4EE710
  '004EE710: push ebp
  '004EE711: mov ebp, esp
  '004EE713: sub esp, 00000008h
  '004EE716: push 004081B6h
  '004EE71B: mov eax, fs:[00h]
  '004EE721: push eax
  '004EE722: mov fs:[00000000h], esp
  '004EE729: sub esp, 00000114h
  '004EE72F: push ebx
  '004EE730: push esi
  '004EE731: push edi
  '004EE732: mov [ebp-08h], esp
  '004EE735: mov [ebp-04h], 00405600h
  '004EE73C: mov esi, [ebp+08h]
  '004EE73F: xor edi, edi
  '004EE741: lea ecx, [ebp-000000E8h]
  '004EE747: mov [ebp-24h], edi
  '004EE74A: mov [esi+00000098h], edi
  '004EE750: mov [esi+0000009Ch], edi
  '004EE756: mov eax, [esi]
  '004EE758: push ecx
  '004EE759: push esi
  '004EE75A: mov [ebp-34h], edi
  '004EE75D: mov [ebp-44h], edi
  '004EE760: mov [ebp-54h], edi
  '004EE763: mov [ebp-64h], edi
  '004EE766: mov [ebp-74h], edi
  '004EE769: mov [ebp-00000084h], edi
  '004EE76F: mov [ebp-00000094h], edi
  '004EE775: mov [ebp-000000A4h], edi
  '004EE77B: mov [ebp-000000B4h], edi
  '004EE781: mov [ebp-000000C4h], edi
  '004EE787: mov [ebp-000000D4h], edi
  '004EE78D: mov [ebp-000000E4h], edi
  '004EE793: mov [ebp-000000E8h], edi
  '004EE799: call [eax+00000100h]
  '004EE79F: cmp eax, edi
  '004EE7A1: fclex 
  '004EE7A3: jnl 4EE7B7h
  '004EE7A5: push 00000100h
  '004EE7AA: push 0042725Ch
  '004EE7AF: push esi
  '004EE7B0: push eax
  '004EE7B1: call [004010A0h]
  '004EE7B7: fld real4 ptr [ebp-000000E8h]
  '004EE7BD: fsub real4 ptr [004055F8h]
  '004EE7C3: mov ebx, [0040135Ch]
  '004EE7C9: fstsw ax
  '004EE7CB: test al, 0Dh
  '004EE7CD: jnz 004EF40Ch
  '004EE7D3: call ebx
  '004EE7D5: mov [esi+000000A0h], eax
  '004EE7DB: mov edx, [esi]
  '004EE7DD: lea eax, [ebp-000000E8h]
  '004EE7E3: push eax
  '004EE7E4: push esi
  '004EE7E5: call [edx+00000108h]
  '004EE7EB: cmp eax, edi
  '004EE7ED: fclex 
  '004EE7EF: jnl 4EE803h
  '004EE7F1: push 00000108h
  '004EE7F6: push 0042725Ch
  '004EE7FB: push esi
  '004EE7FC: push eax
  '004EE7FD: call [004010A0h]
  '004EE803: fld real4 ptr [ebp-000000E8h]
  '004EE809: fsub real4 ptr [004055F8h]
  '004EE80F: fstsw ax
  '004EE811: test al, 0Dh
  '004EE813: jnz 004EF40Ch
  '004EE819: call ebx
  '004EE81B: mov [esi+000000A4h], eax
  '004EE821: mov ecx, [esi+00000098h]
  '004EE827: add ecx, 00000004h
  '004EE82A: push edi
  '004EE82B: jo 004EF411h
  '004EE831: mov [esi+48h], ecx
  '004EE834: mov edx, [esi+0000009Ch]
  '004EE83A: add edx, 00000004h
  '004EE83D: jo 004EF411h
  '004EE843: mov [esi+4Ch], edx
  '004EE846: mov eax, [esi+000000A0h]
  '004EE84C: sub eax, 00000004h
  '004EE84F: jo 004EF411h
  '004EE855: add eax, 00000001h
  '004EE858: jo 004EF411h
  '004EE85E: mov [esi+50h], eax
  '004EE861: mov ecx, [esi+000000A4h]
  '004EE867: sub ecx, 00000004h
  '004EE86A: jo 004EF411h
  '004EE870: add ecx, 00000001h
  '004EE873: jo 004EF411h
  '004EE879: mov [esi+54h], ecx
  '004EE87C: mov edx, [esi+000000C4h]
  '004EE882: push edx
  '004EE883: call [00401210h]
  '004EE889: test ax, ax
  '004EE88C: jz 4EE8BAh
  '004EE88E: mov eax, [esi+48h]
  '004EE891: push esi
  '004EE892: mov [esi+68h], eax
  '004EE895: mov ecx, [esi+4Ch]
  '004EE898: mov [esi+6Ch], ecx
  '004EE89B: mov edx, [esi+50h]
  '004EE89E: mov [esi+70h], edx
  '004EE8A1: mov eax, [esi+54h]
  '004EE8A4: mov [esi+74h], eax
  '004EE8A7: mov ecx, [esi]
  '004EE8A9: call [ecx+000008F8h]
  '004EE8AF: wait 
  '004EE8B0: push 004EF3F7h
  '004EE8B5: jmp 004EF3E1h
  '004EE8BA: mov edx, [esi+000000B8h]
  '004EE8C0: push edx
  '004EE8C1: push 0041BC60h
  '004EE8C6: call [00401184h]
  '004EE8CC: test eax, eax
  '004EE8CE: jnz 004EE95Bh
  '004EE8D4: mov ecx, [esi+48h]
  '004EE8D7: mov eax, [esi+50h]
  '004EE8DA: mov ebx, [esi+000000C8h]
  '004EE8E0: sub eax, ecx
  '004EE8E2: jo 004EF411h
  '004EE8E8: sub eax, ebx
  '004EE8EA: push 004EF3F7h
  '004EE8EF: jo 004EF411h
  '004EE8F5: cdq 
  '004EE8F6: wait 
  '004EE8F7: sub eax, edx
  '004EE8F9: sar eax, 01h
  '004EE8FB: add eax, ecx
  '004EE8FD: jo 004EF411h
  '004EE903: mov [esi+58h], eax
  '004EE906: mov ecx, [esi+4Ch]
  '004EE909: mov eax, [esi+54h]
  '004EE90C: mov edx, [esi+000000CCh]
  '004EE912: sub eax, ecx
  '004EE914: jo 004EF411h
  '004EE91A: sub eax, edx
  '004EE91C: jo 004EF411h
  '004EE922: cdq 
  '004EE923: sub eax, edx
  '004EE925: sar eax, 01h
  '004EE927: add eax, ecx
  '004EE929: jo 004EF411h
  '004EE92F: mov [esi+5Ch], eax
  '004EE932: mov eax, [esi+000000C8h]
  '004EE938: add eax, [esi+58h]
  '004EE93B: jo 004EF411h
  '004EE941: mov [esi+60h], eax
  '004EE944: mov ecx, [esi+5Ch]
  '004EE947: add ecx, [esi+000000CCh]
  '004EE94D: jo 004EF411h
  '004EE953: mov [esi+64h], ecx
  '004EE956: jmp 004EF3E1h
  '004EE95B: mov edx, [esi+48h]
  '004EE95E: push esi
  '004EE95F: mov [esi+68h], edx
  '004EE962: mov eax, [esi+4Ch]
  '004EE965: mov [esi+6Ch], eax
  '004EE968: mov ecx, [esi+50h]
  '004EE96B: mov [esi+70h], ecx
  '004EE96E: mov edx, [esi+54h]
  '004EE971: mov [esi+74h], edx
  '004EE974: mov eax, [esi]
  '004EE976: call [eax+000008F8h]
  '004EE97C: mov ecx, [esi+000000C8h]
  '004EE982: mov ebx, [00401020h]
  '004EE988: mov [ebp-0000009Ch], ecx
  '004EE98E: mov edi, 00000003h
  '004EE993: lea edx, [ebp-000000A4h]
  '004EE999: lea ecx, [ebp-24h]
  '004EE99C: mov [ebp-000000A4h], edi
  '004EE9A2: call ebx
  '004EE9A4: mov edx, [esi+000000CCh]
  '004EE9AA: lea ecx, [ebp-44h]
  '004EE9AD: mov [ebp-0000009Ch], edx
  '004EE9B3: lea edx, [ebp-000000A4h]
  '004EE9B9: mov [ebp-000000A4h], edi
  '004EE9BF: call ebx
  '004EE9C1: mov eax, [esi+70h]
  '004EE9C4: mov ecx, [esi+68h]
  '004EE9C7: sub eax, ecx
  '004EE9C9: lea edx, [ebp-000000A4h]
  '004EE9CF: jo 004EF411h
  '004EE9D5: lea ecx, [ebp-34h]
  '004EE9D8: mov [ebp-0000009Ch], eax
  '004EE9DE: mov [ebp-000000A4h], edi
  '004EE9E4: call ebx
  '004EE9E6: mov ebx, [esi+74h]
  '004EE9E9: mov edx, [esi+6Ch]
  '004EE9EC: mov eax, [esi+000000BCh]
  '004EE9F2: sub ebx, edx
  '004EE9F4: jo 004EF411h
  '004EE9FA: cmp eax, 00000001h
  '004EE9FD: jnz 004EEC24h
  '004EEA03: mov eax, [esi+4Ch]
  '004EEA06: mov ecx, [esi+54h]
  '004EEA09: sub ecx, eax
  '004EEA0B: mov [ebp-000000BCh], eax
  '004EEA11: jo 004EF411h
  '004EEA17: mov [ebp-0000009Ch], ecx
  '004EEA1D: mov ecx, 00000002h
  '004EEA22: lea edx, [ebp-000000A4h]
  '004EEA28: mov [ebp-000000ACh], ecx
  '004EEA2E: mov [ebp-000000B4h], ecx
  '004EEA34: lea eax, [ebp-44h]
  '004EEA37: push edx
  '004EEA38: lea ecx, [ebp-54h]
  '004EEA3B: push eax
  '004EEA3C: push ecx
  '004EEA3D: mov [ebp-000000A4h], edi
  '004EEA43: mov [ebp-000000C4h], edi
  '004EEA49: call [00401004h]
  '004EEA4F: push eax
  '004EEA50: lea edx, [ebp-000000B4h]
  '004EEA56: lea eax, [ebp-64h]
  '004EEA59: push edx
  '004EEA5A: push eax
  '004EEA5B: call [00401048h]
  '004EEA61: lea ecx, [ebp-000000C4h]
  '004EEA67: push eax
  '004EEA68: lea edx, [ebp-74h]
  '004EEA6B: push ecx
  '004EEA6C: push edx
  '004EEA6D: call [00401328h]
  '004EEA73: push eax
  '004EEA74: call [0040130Ch]
  '004EEA7A: lea ecx, [ebp-74h]
  '004EEA7D: mov [esi+5Ch], eax
  '004EEA80: call [00401030h]
  '004EEA86: mov eax, [esi+48h]
  '004EEA89: mov ecx, [esi+50h]
  '004EEA8C: sub ecx, eax
  '004EEA8E: mov [ebp-000000CCh], eax
  '004EEA94: jo 004EF411h
  '004EEA9A: mov [ebp-000000ACh], ecx
  '004EEAA0: mov ecx, 00000002h
  '004EEAA5: lea edx, [ebp-000000B4h]
  '004EEAAB: mov [ebp-000000BCh], ecx
  '004EEAB1: mov [ebp-000000C4h], ecx
  '004EEAB7: lea eax, [ebp-24h]
  '004EEABA: push edx
  '004EEABB: lea ecx, [ebp-000000A4h]
  '004EEAC1: push eax
  '004EEAC2: lea edx, [ebp-54h]
  '004EEAC5: push ecx
  '004EEAC6: push edx
  '004EEAC7: mov [ebp-000000B4h], edi
  '004EEACD: mov byte ptr [ebp-0000009Ch], 04h
  '004EEAD4: mov [ebp-000000A4h], 00000011h
  '004EEADE: mov [ebp-000000D4h], edi
  '004EEAE4: call [00401328h]
  '004EEAEA: push eax
  '004EEAEB: lea eax, [ebp-34h]
  '004EEAEE: lea ecx, [ebp-64h]
  '004EEAF1: push eax
  '004EEAF2: push ecx
  '004EEAF3: call [00401328h]
  '004EEAF9: lea edx, [ebp-74h]
  '004EEAFC: push eax
  '004EEAFD: push edx
  '004EEAFE: call [00401004h]
  '004EEB04: push eax
  '004EEB05: lea eax, [ebp-000000C4h]
  '004EEB0B: lea ecx, [ebp-00000084h]
  '004EEB11: push eax
  '004EEB12: push ecx
  '004EEB13: call [00401048h]
  '004EEB19: push eax
  '004EEB1A: lea edx, [ebp-000000D4h]
  '004EEB20: lea eax, [ebp-00000094h]
  '004EEB26: push edx
  '004EEB27: push eax
  '004EEB28: call [00401328h]
  '004EEB2E: push eax
  '004EEB2F: call [0040130Ch]
  '004EEB35: lea ecx, [ebp-00000094h]
  '004EEB3B: mov [esi+58h], eax
  '004EEB3E: lea edx, [ebp-64h]
  '004EEB41: push ecx
  '004EEB42: lea eax, [ebp-54h]
  '004EEB45: push edx
  '004EEB46: push eax
  '004EEB47: push edi
  '004EEB48: call [00401050h]
  '004EEB4E: mov ecx, [esi+5Ch]
  '004EEB51: add esp, 00000010h
  '004EEB54: lea edx, [ebp-000000A4h]
  '004EEB5A: mov [ebp-0000009Ch], ecx
  '004EEB60: lea eax, [ebp-44h]
  '004EEB63: push edx
  '004EEB64: lea ecx, [ebp-54h]
  '004EEB67: push eax
  '004EEB68: push ecx
  '004EEB69: mov [ebp-000000A4h], edi
  '004EEB6F: call [00401328h]
  '004EEB75: push eax
  '004EEB76: call [0040130Ch]
  '004EEB7C: lea ecx, [ebp-54h]
  '004EEB7F: mov [esi+64h], eax
  '004EEB82: call [00401030h]
  '004EEB88: mov edx, [esi+58h]
  '004EEB8B: lea eax, [ebp-000000A4h]
  '004EEB91: mov [ebp-0000009Ch], edx
  '004EEB97: lea ecx, [ebp-24h]
  '004EEB9A: push eax
  '004EEB9B: lea edx, [ebp-54h]
  '004EEB9E: push ecx
  '004EEB9F: push edx
  '004EEBA0: mov [ebp-000000A4h], edi
  '004EEBA6: call [00401328h]
  '004EEBAC: push eax
  '004EEBAD: call [0040130Ch]
  '004EEBB3: lea ecx, [ebp-54h]
  '004EEBB6: mov [esi+60h], eax
  '004EEBB9: call [00401030h]
  '004EEBBF: mov ecx, [esi+4Ch]
  '004EEBC2: mov eax, [esi+54h]
  '004EEBC5: sub eax, ecx
  '004EEBC7: mov [ebp-000000A4h], edi
  '004EEBCD: jo 004EF411h
  '004EEBD3: sub eax, ebx
  '004EEBD5: jo 004EF411h
  '004EEBDB: cdq 
  '004EEBDC: sub eax, edx
  '004EEBDE: sar eax, 01h
  '004EEBE0: add eax, ecx
  '004EEBE2: jo 004EF411h
  '004EEBE8: mov [esi+6Ch], eax
  '004EEBEB: mov eax, [esi+60h]
  '004EEBEE: add eax, 00000004h
  '004EEBF1: jo 004EF411h
  '004EEBF7: mov [esi+68h], eax
  '004EEBFA: mov ecx, [esi+6Ch]
  '004EEBFD: add ecx, ebx
  '004EEBFF: mov edx, eax
  '004EEC01: jo 004EF411h
  '004EEC07: mov [esi+74h], ecx
  '004EEC0A: lea eax, [ebp-000000A4h]
  '004EEC10: mov [ebp-0000009Ch], edx
  '004EEC16: lea ecx, [ebp-34h]
  '004EEC19: push eax
  '004EEC1A: lea edx, [ebp-54h]
  '004EEC1D: push ecx
  '004EEC1E: push edx
  '004EEC1F: jmp 004EF0F4h
  '004EEC24: mov ecx, 00000002h
  '004EEC29: cmp eax, ecx
  '004EEC2B: jnz 004EEE68h
  '004EEC31: mov ecx, [esi+4Ch]
  '004EEC34: mov eax, [esi+54h]
  '004EEC37: sub eax, ecx
  '004EEC39: mov [ebp-000000B4h], edi
  '004EEC3F: jo 004EF411h
  '004EEC45: sub eax, ebx
  '004EEC47: mov byte ptr [ebp-0000009Ch], 04h
  '004EEC4E: jo 004EF411h
  '004EEC54: cdq 
  '004EEC55: sub eax, edx
  '004EEC57: lea edx, [ebp-000000B4h]
  '004EEC5D: sar eax, 01h
  '004EEC5F: add eax, ecx
  '004EEC61: push edx
  '004EEC62: jo 004EF411h
  '004EEC68: mov [esi+6Ch], eax
  '004EEC6B: mov eax, [esi+48h]
  '004EEC6E: mov ecx, [esi+50h]
  '004EEC71: mov [ebp-000000CCh], eax
  '004EEC77: sub ecx, eax
  '004EEC79: lea eax, [ebp-24h]
  '004EEC7C: jo 004EF411h
  '004EEC82: mov [ebp-000000ACh], ecx
  '004EEC88: mov ecx, 00000002h
  '004EEC8D: mov [ebp-000000BCh], ecx
  '004EEC93: mov [ebp-000000C4h], ecx
  '004EEC99: lea ecx, [ebp-000000A4h]
  '004EEC9F: push eax
  '004EECA0: lea edx, [ebp-54h]
  '004EECA3: push ecx
  '004EECA4: push edx
  '004EECA5: mov [ebp-000000A4h], 00000011h
  '004EECAF: mov [ebp-000000D4h], edi
  '004EECB5: call [00401328h]
  '004EECBB: push eax
  '004EECBC: lea eax, [ebp-34h]
  '004EECBF: lea ecx, [ebp-64h]
  '004EECC2: push eax
  '004EECC3: push ecx
  '004EECC4: call [00401328h]
  '004EECCA: lea edx, [ebp-74h]
  '004EECCD: push eax
  '004EECCE: push edx
  '004EECCF: call [00401004h]
  '004EECD5: push eax
  '004EECD6: lea eax, [ebp-000000C4h]
  '004EECDC: lea ecx, [ebp-00000084h]
  '004EECE2: push eax
  '004EECE3: push ecx
  '004EECE4: call [00401048h]
  '004EECEA: push eax
  '004EECEB: lea edx, [ebp-000000D4h]
  '004EECF1: lea eax, [ebp-00000094h]
  '004EECF7: push edx
  '004EECF8: push eax
  '004EECF9: call [00401328h]
  '004EECFF: push eax
  '004EED00: call [0040130Ch]
  '004EED06: lea ecx, [ebp-00000094h]
  '004EED0C: mov [esi+68h], eax
  '004EED0F: lea edx, [ebp-64h]
  '004EED12: push ecx
  '004EED13: lea eax, [ebp-54h]
  '004EED16: push edx
  '004EED17: push eax
  '004EED18: push edi
  '004EED19: call [00401050h]
  '004EED1F: mov ecx, [esi+6Ch]
  '004EED22: add esp, 00000010h
  '004EED25: add ecx, ebx
  '004EED27: lea eax, [ebp-000000A4h]
  '004EED2D: jo 004EF411h
  '004EED33: mov [esi+74h], ecx
  '004EED36: mov edx, [esi+68h]
  '004EED39: mov [ebp-0000009Ch], edx
  '004EED3F: lea ecx, [ebp-34h]
  '004EED42: push eax
  '004EED43: lea edx, [ebp-54h]
  '004EED46: push ecx
  '004EED47: mov [ebp-000000A4h], edi
  '004EED4D: push edx
  '004EED4E: call [00401328h]
  '004EED54: push eax
  '004EED55: call [0040130Ch]
  '004EED5B: mov ebx, [00401030h]
  '004EED61: lea ecx, [ebp-54h]
  '004EED64: mov [esi+70h], eax
  '004EED67: call ebx
  '004EED69: mov eax, [esi+4Ch]
  '004EED6C: mov ecx, [esi+54h]
  '004EED6F: sub ecx, eax
  '004EED71: mov [ebp-000000BCh], eax
  '004EED77: jo 004EF411h
  '004EED7D: mov [ebp-0000009Ch], ecx
  '004EED83: mov ecx, 00000002h
  '004EED88: lea edx, [ebp-000000A4h]
  '004EED8E: mov [ebp-000000ACh], ecx
  '004EED94: mov [ebp-000000B4h], ecx
  '004EED9A: lea eax, [ebp-44h]
  '004EED9D: push edx
  '004EED9E: lea ecx, [ebp-54h]
  '004EEDA1: push eax
  '004EEDA2: push ecx
  '004EEDA3: mov [ebp-000000A4h], edi
  '004EEDA9: mov [ebp-000000C4h], edi
  '004EEDAF: call [00401004h]
  '004EEDB5: push eax
  '004EEDB6: lea edx, [ebp-000000B4h]
  '004EEDBC: lea eax, [ebp-64h]
  '004EEDBF: push edx
  '004EEDC0: push eax
  '004EEDC1: call [00401048h]
  '004EEDC7: lea ecx, [ebp-000000C4h]
  '004EEDCD: push eax
  '004EEDCE: lea edx, [ebp-74h]
  '004EEDD1: push ecx
  '004EEDD2: push edx
  '004EEDD3: call [00401328h]
  '004EEDD9: push eax
  '004EEDDA: call [0040130Ch]
  '004EEDE0: lea ecx, [ebp-74h]
  '004EEDE3: mov [esi+5Ch], eax
  '004EEDE6: call ebx
  '004EEDE8: mov eax, [esi+70h]
  '004EEDEB: lea edx, [ebp-000000A4h]
  '004EEDF1: add eax, 00000004h
  '004EEDF4: push edx
  '004EEDF5: jo 004EF411h
  '004EEDFB: mov [esi+58h], eax
  '004EEDFE: mov ecx, [esi+5Ch]
  '004EEE01: mov [ebp-0000009Ch], ecx
  '004EEE07: lea eax, [ebp-44h]
  '004EEE0A: lea ecx, [ebp-54h]
  '004EEE0D: push eax
  '004EEE0E: push ecx
  '004EEE0F: mov [ebp-000000A4h], edi
  '004EEE15: call [00401328h]
  '004EEE1B: push eax
  '004EEE1C: call [0040130Ch]
  '004EEE22: lea ecx, [ebp-54h]
  '004EEE25: mov [esi+64h], eax
  '004EEE28: call ebx
  '004EEE2A: mov edx, [esi+58h]
  '004EEE2D: lea eax, [ebp-000000A4h]
  '004EEE33: mov [ebp-0000009Ch], edx
  '004EEE39: lea ecx, [ebp-24h]
  '004EEE3C: push eax
  '004EEE3D: lea edx, [ebp-54h]
  '004EEE40: push ecx
  '004EEE41: push edx
  '004EEE42: mov [ebp-000000A4h], edi
  '004EEE48: call [00401328h]
  '004EEE4E: push eax
  '004EEE4F: call [0040130Ch]
  '004EEE55: lea ecx, [ebp-54h]
  '004EEE58: mov [esi+60h], eax
  '004EEE5B: call ebx
  '004EEE5D: wait 
  '004EEE5E: push 004EF3F7h
  '004EEE63: jmp 004EF3E1h
  '004EEE68: test eax, eax
  '004EEE6A: jnz 004EF118h
  '004EEE70: mov eax, [esi+4Ch]
  '004EEE73: mov edx, [esi+54h]
  '004EEE76: sub edx, eax
  '004EEE78: mov [ebp-000000DCh], eax
  '004EEE7E: jo 004EF411h
  '004EEE84: mov [ebp-000000CCh], ecx
  '004EEE8A: mov [ebp-000000D4h], ecx
  '004EEE90: lea eax, [ebp-000000C4h]
  '004EEE96: mov [ebp-000000BCh], edx
  '004EEE9C: lea ecx, [ebp-44h]
  '004EEE9F: push eax
  '004EEEA0: lea edx, [ebp-000000A4h]
  '004EEEA6: push ecx
  '004EEEA7: lea eax, [ebp-54h]
  '004EEEAA: push edx
  '004EEEAB: push eax
  '004EEEAC: mov [ebp-000000C4h], edi
  '004EEEB2: mov byte ptr [ebp-0000009Ch], 04h
  '004EEEB9: mov [ebp-000000A4h], 00000011h
  '004EEEC3: mov [ebp-000000ACh], ebx
  '004EEEC9: mov [ebp-000000B4h], edi
  '004EEECF: mov [ebp-000000E4h], edi
  '004EEED5: call [00401328h]
  '004EEEDB: lea ecx, [ebp-000000B4h]
  '004EEEE1: push eax
  '004EEEE2: lea edx, [ebp-64h]
  '004EEEE5: push ecx
  '004EEEE6: push edx
  '004EEEE7: call [00401328h]
  '004EEEED: push eax
  '004EEEEE: lea eax, [ebp-74h]
  '004EEEF1: push eax
  '004EEEF2: call [00401004h]
  '004EEEF8: lea ecx, [ebp-000000D4h]
  '004EEEFE: push eax
  '004EEEFF: lea edx, [ebp-00000084h]
  '004EEF05: push ecx
  '004EEF06: push edx
  '004EEF07: call [00401048h]
  '004EEF0D: push eax
  '004EEF0E: lea eax, [ebp-000000E4h]
  '004EEF14: lea ecx, [ebp-00000094h]
  '004EEF1A: push eax
  '004EEF1B: push ecx
  '004EEF1C: call [00401328h]
  '004EEF22: push eax
  '004EEF23: call [0040130Ch]
  '004EEF29: mov [esi+5Ch], eax
  '004EEF2C: lea edx, [ebp-00000094h]
  '004EEF32: lea eax, [ebp-64h]
  '004EEF35: push edx
  '004EEF36: lea ecx, [ebp-54h]
  '004EEF39: push eax
  '004EEF3A: push ecx
  '004EEF3B: push edi
  '004EEF3C: call [00401050h]
  '004EEF42: mov eax, [esi+48h]
  '004EEF45: mov edx, [esi+50h]
  '004EEF48: add esp, 00000010h
  '004EEF4B: sub edx, eax
  '004EEF4D: mov ecx, 00000002h
  '004EEF52: mov [ebp-000000BCh], eax
  '004EEF58: jo 004EF411h
  '004EEF5E: mov [ebp-000000ACh], ecx
  '004EEF64: mov [ebp-000000B4h], ecx
  '004EEF6A: lea eax, [ebp-000000A4h]
  '004EEF70: mov [ebp-0000009Ch], edx
  '004EEF76: lea ecx, [ebp-24h]
  '004EEF79: push eax
  '004EEF7A: lea edx, [ebp-54h]
  '004EEF7D: push ecx
  '004EEF7E: push edx
  '004EEF7F: mov [ebp-000000A4h], edi
  '004EEF85: mov [ebp-000000C4h], edi
  '004EEF8B: call [00401004h]
  '004EEF91: push eax
  '004EEF92: lea eax, [ebp-000000B4h]
  '004EEF98: lea ecx, [ebp-64h]
  '004EEF9B: push eax
  '004EEF9C: push ecx
  '004EEF9D: call [00401048h]
  '004EEFA3: push eax
  '004EEFA4: lea edx, [ebp-000000C4h]
  '004EEFAA: lea eax, [ebp-74h]
  '004EEFAD: push edx
  '004EEFAE: push eax
  '004EEFAF: call [00401328h]
  '004EEFB5: push eax
  '004EEFB6: call [0040130Ch]
  '004EEFBC: lea ecx, [ebp-74h]
  '004EEFBF: mov [esi+58h], eax
  '004EEFC2: call [00401030h]
  '004EEFC8: mov ecx, [esi+5Ch]
  '004EEFCB: lea edx, [ebp-000000A4h]
  '004EEFD1: mov [ebp-0000009Ch], ecx
  '004EEFD7: lea eax, [ebp-44h]
  '004EEFDA: push edx
  '004EEFDB: lea ecx, [ebp-54h]
  '004EEFDE: push eax
  '004EEFDF: push ecx
  '004EEFE0: mov [ebp-000000A4h], edi
  '004EEFE6: call [00401328h]
  '004EEFEC: push eax
  '004EEFED: call [0040130Ch]
  '004EEFF3: lea ecx, [ebp-54h]
  '004EEFF6: mov [esi+64h], eax
  '004EEFF9: call [00401030h]
  '004EEFFF: mov edx, [esi+58h]
  '004EF002: lea eax, [ebp-000000A4h]
  '004EF008: mov [ebp-0000009Ch], edx
  '004EF00E: lea ecx, [ebp-24h]
  '004EF011: push eax
  '004EF012: lea edx, [ebp-54h]
  '004EF015: push ecx
  '004EF016: push edx
  '004EF017: mov [ebp-000000A4h], edi
  '004EF01D: call [00401328h]
  '004EF023: push eax
  '004EF024: call [0040130Ch]
  '004EF02A: lea ecx, [ebp-54h]
  '004EF02D: mov [esi+60h], eax
  '004EF030: call [00401030h]
  '004EF036: mov eax, [esi+64h]
  '004EF039: lea edx, [ebp-000000A4h]
  '004EF03F: add eax, 00000004h
  '004EF042: push edx
  '004EF043: jo 004EF411h
  '004EF049: mov [esi+6Ch], eax
  '004EF04C: mov eax, [esi+48h]
  '004EF04F: mov ecx, [esi+50h]
  '004EF052: mov [ebp-000000BCh], eax
  '004EF058: sub ecx, eax
  '004EF05A: lea eax, [ebp-34h]
  '004EF05D: jo 004EF411h
  '004EF063: mov [ebp-0000009Ch], ecx
  '004EF069: mov ecx, 00000002h
  '004EF06E: mov [ebp-000000ACh], ecx
  '004EF074: mov [ebp-000000B4h], ecx
  '004EF07A: lea ecx, [ebp-54h]
  '004EF07D: push eax
  '004EF07E: push ecx
  '004EF07F: mov [ebp-000000A4h], edi
  '004EF085: mov [ebp-000000C4h], edi
  '004EF08B: call [00401004h]
  '004EF091: push eax
  '004EF092: lea edx, [ebp-000000B4h]
  '004EF098: lea eax, [ebp-64h]
  '004EF09B: push edx
  '004EF09C: push eax
  '004EF09D: call [00401048h]
  '004EF0A3: lea ecx, [ebp-000000C4h]
  '004EF0A9: push eax
  '004EF0AA: lea edx, [ebp-74h]
  '004EF0AD: push ecx
  '004EF0AE: push edx
  '004EF0AF: call [00401328h]
  '004EF0B5: push eax
  '004EF0B6: call [0040130Ch]
  '004EF0BC: lea ecx, [ebp-74h]
  '004EF0BF: mov [esi+68h], eax
  '004EF0C2: call [00401030h]
  '004EF0C8: mov eax, [esi+6Ch]
  '004EF0CB: add eax, ebx
  '004EF0CD: lea edx, [ebp-000000A4h]
  '004EF0D3: jo 004EF411h
  '004EF0D9: mov [esi+74h], eax
  '004EF0DC: mov ecx, [esi+68h]
  '004EF0DF: mov [ebp-0000009Ch], ecx
  '004EF0E5: lea eax, [ebp-34h]
  '004EF0E8: push edx
  '004EF0E9: lea ecx, [ebp-54h]
  '004EF0EC: push eax
  '004EF0ED: mov [ebp-000000A4h], edi
  '004EF0F3: push ecx
  '004EF0F4: call [00401328h]
  '004EF0FA: push eax
  '004EF0FB: call [0040130Ch]
  '004EF101: lea ecx, [ebp-54h]
  '004EF104: mov [esi+70h], eax
  '004EF107: call [00401030h]
  '004EF10D: wait 
  '004EF10E: push 004EF3F7h
  '004EF113: jmp 004EF3E1h
  '004EF118: cmp eax, edi
  '004EF11A: jnz 004EF3B3h
  '004EF120: mov eax, [esi+4Ch]
  '004EF123: mov edx, [esi+54h]
  '004EF126: sub edx, eax
  '004EF128: mov [ebp-000000DCh], eax
  '004EF12E: jo 004EF411h
  '004EF134: mov [ebp-000000CCh], ecx
  '004EF13A: mov [ebp-000000D4h], ecx
  '004EF140: lea eax, [ebp-000000C4h]
  '004EF146: mov [ebp-000000BCh], edx
  '004EF14C: lea ecx, [ebp-44h]
  '004EF14F: push eax
  '004EF150: lea edx, [ebp-000000A4h]
  '004EF156: push ecx
  '004EF157: lea eax, [ebp-54h]
  '004EF15A: push edx
  '004EF15B: push eax
  '004EF15C: mov [ebp-000000C4h], edi
  '004EF162: mov byte ptr [ebp-0000009Ch], 04h
  '004EF169: mov [ebp-000000A4h], 00000011h
  '004EF173: mov [ebp-000000ACh], ebx
  '004EF179: mov [ebp-000000B4h], edi
  '004EF17F: mov [ebp-000000E4h], edi
  '004EF185: call [00401328h]
  '004EF18B: lea ecx, [ebp-000000B4h]
  '004EF191: push eax
  '004EF192: lea edx, [ebp-64h]
  '004EF195: push ecx
  '004EF196: push edx
  '004EF197: call [00401328h]
  '004EF19D: push eax
  '004EF19E: lea eax, [ebp-74h]
  '004EF1A1: push eax
  '004EF1A2: call [00401004h]
  '004EF1A8: lea ecx, [ebp-000000D4h]
  '004EF1AE: push eax
  '004EF1AF: lea edx, [ebp-00000084h]
  '004EF1B5: push ecx
  '004EF1B6: push edx
  '004EF1B7: call [00401048h]
  '004EF1BD: push eax
  '004EF1BE: lea eax, [ebp-000000E4h]
  '004EF1C4: lea ecx, [ebp-00000094h]
  '004EF1CA: push eax
  '004EF1CB: push ecx
  '004EF1CC: call [00401328h]
  '004EF1D2: push eax
  '004EF1D3: call [0040130Ch]
  '004EF1D9: mov [esi+6Ch], eax
  '004EF1DC: lea edx, [ebp-00000094h]
  '004EF1E2: lea eax, [ebp-64h]
  '004EF1E5: push edx
  '004EF1E6: lea ecx, [ebp-54h]
  '004EF1E9: push eax
  '004EF1EA: push ecx
  '004EF1EB: push edi
  '004EF1EC: call [00401050h]
  '004EF1F2: mov eax, [esi+48h]
  '004EF1F5: mov edx, [esi+50h]
  '004EF1F8: add esp, 00000010h
  '004EF1FB: sub edx, eax
  '004EF1FD: mov ecx, 00000002h
  '004EF202: mov [ebp-000000BCh], eax
  '004EF208: jo 004EF411h
  '004EF20E: mov [ebp-000000ACh], ecx
  '004EF214: mov [ebp-000000B4h], ecx
  '004EF21A: lea eax, [ebp-000000A4h]
  '004EF220: mov [ebp-0000009Ch], edx
  '004EF226: lea ecx, [ebp-34h]
  '004EF229: push eax
  '004EF22A: lea edx, [ebp-54h]
  '004EF22D: push ecx
  '004EF22E: push edx
  '004EF22F: mov [ebp-000000A4h], edi
  '004EF235: mov [ebp-000000C4h], edi
  '004EF23B: call [00401004h]
  '004EF241: push eax
  '004EF242: lea eax, [ebp-000000B4h]
  '004EF248: lea ecx, [ebp-64h]
  '004EF24B: push eax
  '004EF24C: push ecx
  '004EF24D: call [00401048h]
  '004EF253: push eax
  '004EF254: lea edx, [ebp-000000C4h]
  '004EF25A: lea eax, [ebp-74h]
  '004EF25D: push edx
  '004EF25E: push eax
  '004EF25F: call [00401328h]
  '004EF265: push eax
  '004EF266: call [0040130Ch]
  '004EF26C: lea ecx, [ebp-74h]
  '004EF26F: mov [esi+68h], eax
  '004EF272: call [00401030h]
  '004EF278: mov ecx, [esi+6Ch]
  '004EF27B: lea eax, [ebp-000000A4h]
  '004EF281: add ecx, ebx
  '004EF283: mov ebx, [00401328h]
  '004EF289: jo 004EF411h
  '004EF28F: mov [esi+74h], ecx
  '004EF292: mov edx, [esi+68h]
  '004EF295: mov [ebp-0000009Ch], edx
  '004EF29B: lea ecx, [ebp-34h]
  '004EF29E: push eax
  '004EF29F: lea edx, [ebp-54h]
  '004EF2A2: push ecx
  '004EF2A3: push edx
  '004EF2A4: mov [ebp-000000A4h], edi
  '004EF2AA: call ebx
  '004EF2AC: push eax
  '004EF2AD: call [0040130Ch]
  '004EF2B3: lea ecx, [ebp-54h]
  '004EF2B6: mov [esi+70h], eax
  '004EF2B9: call [00401030h]
  '004EF2BF: mov eax, [esi+74h]
  '004EF2C2: lea edx, [ebp-000000A4h]
  '004EF2C8: add eax, 00000004h
  '004EF2CB: push edx
  '004EF2CC: jo 004EF411h
  '004EF2D2: mov [esi+5Ch], eax
  '004EF2D5: mov eax, [esi+48h]
  '004EF2D8: mov ecx, [esi+50h]
  '004EF2DB: mov [ebp-000000BCh], eax
  '004EF2E1: sub ecx, eax
  '004EF2E3: lea eax, [ebp-24h]
  '004EF2E6: jo 004EF411h
  '004EF2EC: mov [ebp-0000009Ch], ecx
  '004EF2F2: mov ecx, 00000002h
  '004EF2F7: mov [ebp-000000ACh], ecx
  '004EF2FD: mov [ebp-000000B4h], ecx
  '004EF303: lea ecx, [ebp-54h]
  '004EF306: push eax
  '004EF307: push ecx
  '004EF308: mov [ebp-000000A4h], edi
  '004EF30E: mov [ebp-000000C4h], edi
  '004EF314: call [00401004h]
  '004EF31A: push eax
  '004EF31B: lea edx, [ebp-000000B4h]
  '004EF321: lea eax, [ebp-64h]
  '004EF324: push edx
  '004EF325: push eax
  '004EF326: call [00401048h]
  '004EF32C: lea ecx, [ebp-000000C4h]
  '004EF332: push eax
  '004EF333: lea edx, [ebp-74h]
  '004EF336: push ecx
  '004EF337: push edx
  '004EF338: call ebx
  '004EF33A: push eax
  '004EF33B: call [0040130Ch]
  '004EF341: lea ecx, [ebp-74h]
  '004EF344: mov [esi+58h], eax
  '004EF347: call [00401030h]
  '004EF34D: mov eax, [esi+5Ch]
  '004EF350: lea ecx, [ebp-000000A4h]
  '004EF356: mov [ebp-0000009Ch], eax
  '004EF35C: lea edx, [ebp-44h]
  '004EF35F: push ecx
  '004EF360: lea eax, [ebp-54h]
  '004EF363: push edx
  '004EF364: push eax
  '004EF365: mov [ebp-000000A4h], edi
  '004EF36B: call ebx
  '004EF36D: push eax
  '004EF36E: call [0040130Ch]
  '004EF374: lea ecx, [ebp-54h]
  '004EF377: mov [esi+64h], eax
  '004EF37A: call [00401030h]
  '004EF380: mov ecx, [esi+58h]
  '004EF383: lea edx, [ebp-000000A4h]
  '004EF389: mov [ebp-0000009Ch], ecx
  '004EF38F: lea eax, [ebp-24h]
  '004EF392: push edx
  '004EF393: lea ecx, [ebp-54h]
  '004EF396: push eax
  '004EF397: push ecx
  '004EF398: mov [ebp-000000A4h], edi
  '004EF39E: call ebx
  '004EF3A0: push eax
  '004EF3A1: call [0040130Ch]
  '004EF3A7: lea ecx, [ebp-54h]
  '004EF3AA: mov [esi+60h], eax
  '004EF3AD: call [00401030h]
  '004EF3B3: wait 
  '004EF3B4: push 004EF3F7h
  '004EF3B9: jmp 4EF3E1h
  '004EF3BB: lea edx, [ebp-00000094h]
  '004EF3C1: lea eax, [ebp-00000084h]
  '004EF3C7: push edx
  '004EF3C8: lea ecx, [ebp-74h]
  '004EF3CB: push eax
  '004EF3CC: lea edx, [ebp-64h]
  '004EF3CF: push ecx
  '004EF3D0: lea eax, [ebp-54h]
  '004EF3D3: push edx
  '004EF3D4: push eax
  '004EF3D5: push 00000005h
  '004EF3D7: call [00401050h]
  '004EF3DD: add esp, 00000018h
  '004EF3E0: ret 
End Sub
Private Sub ButtonStyle_4F0BE0
  '004F0BE0: push ebp
  '004F0BE1: mov ebp, esp
  '004F0BE3: sub esp, 0000000Ch
  '004F0BE6: push 004081B6h
  '004F0BEB: mov eax, fs:[00h]
  '004F0BF1: push eax
  '004F0BF2: mov fs:[00000000h], esp
  '004F0BF9: sub esp, 00000020h
  '004F0BFC: push ebx
  '004F0BFD: push esi
  '004F0BFE: push edi
  '004F0BFF: mov [ebp-0Ch], esp
  '004F0C02: mov [ebp-08h], 004056D8h
  '004F0C09: mov esi, [ebp+08h]
  '004F0C0C: mov eax, esi
  '004F0C0E: and eax, 00000001h
  '004F0C11: mov [ebp-04h], eax
  '004F0C14: and esi, FFFFFFFEh
  '004F0C17: push esi
  '004F0C18: mov [ebp+08h], esi
  '004F0C1B: mov ecx, [esi]
  '004F0C1D: call [ecx+04h]
  '004F0C20: mov edx, [ebp+0Ch]
  '004F0C23: xor ebx, ebx
  '004F0C25: lea ecx, [ebp-18h]
  '004F0C28: mov [ebp-18h], ebx
  '004F0C2B: mov [ebp-1Ch], ebx
  '004F0C2E: mov [ebp-20h], ebx
  '004F0C31: call [004012D8h]
  '004F0C37: mov edx, [esi]
  '004F0C39: lea eax, [ebp-1Ch]
  '004F0C3C: push eax
  '004F0C3D: push esi
  '004F0C3E: call [edx+00000938h]
  '004F0C44: cmp eax, ebx
  '004F0C46: fclex 
  '004F0C48: jnl 4F0C60h
  '004F0C4A: mov edi, [004010A0h]
  '004F0C50: push 00000938h
  '004F0C55: push 0042728Ch
  '004F0C5A: push esi
  '004F0C5B: push eax
  '004F0C5C: call edi
  '004F0C5E: jmp 4F0C66h
  '004F0C60: mov edi, [004010A0h]
  '004F0C66: mov eax, [ebp-1Ch]
  '004F0C69: mov ecx, [esi+10h]
  '004F0C6C: lea edx, [ebp-20h]
  '004F0C6F: push eax
  '004F0C70: mov [ebp-1Ch], ebx
  '004F0C73: mov ebx, [ecx]
  '004F0C75: push edx
  '004F0C76: call [004010E4h]
  '004F0C7C: push eax
  '004F0C7D: mov eax, [esi+10h]
  '004F0C80: push eax
  '004F0C81: call [ebx+0000024Ch]
  '004F0C87: test eax, eax
  '004F0C89: fclex 
  '004F0C8B: jnl 4F0C9Eh
  '004F0C8D: mov ecx, [esi+10h]
  '004F0C90: push 0000024Ch
  '004F0C95: push 0042725Ch
  '004F0C9A: push ecx
  '004F0C9B: push eax
  '004F0C9C: call edi
  '004F0C9E: lea ecx, [ebp-20h]
  '004F0CA1: call [004013B8h]
  '004F0CA7: mov edx, [esi]
  '004F0CA9: push esi
  '004F0CAA: call [edx+000007A4h]
  '004F0CB0: test eax, eax
  '004F0CB2: jnl 4F0CC2h
  '004F0CB4: push 000007A4h
  '004F0CB9: push 0042728Ch
  '004F0CBE: push esi
  '004F0CBF: push eax
  '004F0CC0: call edi
  '004F0CC2: mov [ebp-04h], 00000000h
  '004F0CC9: push 004F0CEEh
  '004F0CCE: jmp 4F0CE4h
  '004F0CD0: lea eax, [ebp-20h]
  '004F0CD3: lea ecx, [ebp-1Ch]
  '004F0CD6: push eax
  '004F0CD7: push ecx
  '004F0CD8: push 00000002h
  '004F0CDA: call [00401064h]
  '004F0CE0: add esp, 0000000Ch
  '004F0CE3: ret 
End Sub
Private Sub PicturePosition_4F1230
  '004F1230: sub esp, 00000068h
  '004F1233: push ebx
  '004F1234: push ebp
  '004F1235: push esi
  '004F1236: push edi
  '004F1237: mov ecx, 00000006h
  '004F123C: xor eax, eax
  '004F123E: lea edi, [esp+60h]
  '004F1242: mov ebx, [esp+00000088h]
  '004F1249: rep stosd 
  '004F124B: mov ecx, 00000006h
  '004F1250: lea edi, [esp+48h]
  '004F1254: rep stosd 
  '004F1256: mov ecx, 00000006h
  '004F125B: lea edi, [esp+30h]
  '004F125F: rep stosd 
  '004F1261: mov cx, [ebx]
  '004F1264: mov eax, [esp+00000080h]
  '004F126B: xor edx, edx
  '004F126D: mov esi, [esp+7Ch]
  '004F1271: mov eax, [eax]
  '004F1273: mov byte ptr [esp+13h], 00h
  '004F1278: neg cx
  '004F127B: jo 004F15E7h
  '004F1281: mov [ebx], cx
  '004F1284: mov ecx, [esp+00000084h]
  '004F128B: mov [esp+14h], edx
  '004F128F: mov [esp+20h], edx
  '004F1293: mov di, [ecx]
  '004F1296: mov [esp+1Ch], edx
  '004F129A: cmp di, dx
  '004F129D: mov [esp+24h], edx
  '004F12A1: jl 004F13D2h
  '004F12A7: jmp 4F12ADh
  '004F12A9: mov eax, [esp+18h]
  '004F12AD: mov edx, [esi]
  '004F12AF: lea ecx, [esp+14h]
  '004F12B3: push ecx
  '004F12B4: movsx ecx, word ptr [ebx]
  '004F12B7: push ecx
  '004F12B8: push eax
  '004F12B9: push esi
  '004F12BA: call [edx+0000091Ch]
  '004F12C0: mov eax, [esi]
  '004F12C2: lea ecx, [esp+14h]
  '004F12C6: mov edx, [esp+14h]
  '004F12CA: push ecx
  '004F12CB: push esi
  '004F12CC: mov [esp+20h], edx
  '004F12D0: call [eax+000000D8h]
  '004F12D6: test eax, eax
  '004F12D8: fclex 
  '004F12DA: jnl 4F12F2h
  '004F12DC: mov ebp, [004010A0h]
  '004F12E2: push 000000D8h
  '004F12E7: push 0042725Ch
  '004F12EC: push esi
  '004F12ED: push eax
  '004F12EE: call ebp
  '004F12F0: jmp 4F12F8h
  '004F12F2: mov ebp, [004010A0h]
  '004F12F8: mov edx, [esi]
  '004F12FA: lea eax, [esp+20h]
  '004F12FE: push eax
  '004F12FF: push esi
  '004F1300: call [edx+00000100h]
  '004F1306: test eax, eax
  '004F1308: fclex 
  '004F130A: jnl 4F131Ah
  '004F130C: push 00000100h
  '004F1311: push 0042725Ch
  '004F1316: push esi
  '004F1317: push eax
  '004F1318: call ebp
  '004F131A: mov ecx, [esi]
  '004F131C: lea edx, [esp+1Ch]
  '004F1320: push edx
  '004F1321: push esi
  '004F1322: call [ecx+00000108h]
  '004F1328: test eax, eax
  '004F132A: fclex 
  '004F132C: jnl 4F133Ch
  '004F132E: push 00000108h
  '004F1333: push 0042725Ch
  '004F1338: push esi
  '004F1339: push eax
  '004F133A: call ebp
  '004F133C: xor ecx, ecx
  '004F133E: call [00401208h]
  '004F1344: movsx ecx, di
  '004F1347: mov [esp+7Ch], ecx
  '004F134B: mov [esp+13h], al
  '004F134F: fild dword ptr [esp+7Ch]
  '004F1353: mov eax, [esp+14h]
  '004F1357: mov ebp, [esi]
  '004F1359: mov [esp+24h], eax
  '004F135D: mov eax, [esp+18h]
  '004F1361: fstp real4 ptr [esp+28h]
  '004F1365: fld real4 ptr [esp+1Ch]
  '004F1369: fsub real4 ptr [esp+28h]
  '004F136D: lea edx, [esp+13h]
  '004F1371: push edx
  '004F1372: push eax
  '004F1373: fstsw ax
  '004F1375: test al, 0Dh
  '004F1377: jnz 004F15E2h
  '004F137D: call [0040135Ch]
  '004F1383: fild dword ptr [esp+00000084h]
  '004F138A: push eax
  '004F138B: fstp real4 ptr [esp+34h]
  '004F138F: fld real4 ptr [esp+2Ch]
  '004F1393: fsub real4 ptr [esp+34h]
  '004F1397: fstsw ax
  '004F1399: test al, 0Dh
  '004F139B: jnz 004F15E2h
  '004F13A1: call [0040135Ch]
  '004F13A7: push eax
  '004F13A8: mov eax, [esp+0000008Ch]
  '004F13AF: push eax
  '004F13B0: lea ecx, [esp+38h]
  '004F13B4: push eax
  '004F13B5: push ecx
  '004F13B6: push esi
  '004F13B7: call [ebp+00000924h]
  '004F13BD: sub di, 0001h
  '004F13C1: jo 004F15E7h
  '004F13C7: test di, di
  '004F13CA: jnl 004F12A9h
  '004F13D0: xor edx, edx
  '004F13D2: mov ax, [ebx]
  '004F13D5: mov ecx, [esp+00000084h]
  '004F13DC: neg ax
  '004F13DF: jo 004F15E7h
  '004F13E5: mov [ebx], ax
  '004F13E8: mov bp, [ecx]
  '004F13EB: cmp bp, dx
  '004F13EE: jl 004F15D6h
  '004F13F4: jmp 4F13FDh
  '004F13F6: mov ebx, [esp+00000088h]
  '004F13FD: mov ecx, [esp+00000080h]
  '004F1404: mov edx, [esi]
  '004F1406: mov edi, [00401348h]
  '004F140C: lea eax, [esp+60h]
  '004F1410: push eax
  '004F1411: push ecx
  '004F1412: push esi
  '004F1413: call [edx+00000914h]
  '004F1419: mov edx, [esi]
  '004F141B: lea eax, [esp+48h]
  '004F141F: mov ecx, [esp+00000080h]
  '004F1426: push eax
  '004F1427: push ecx
  '004F1428: push esi
  '004F1429: call [edx+00000914h]
  '004F142F: mov edx, [esi]
  '004F1431: lea eax, [esp+30h]
  '004F1435: mov ecx, [esp+00000080h]
  '004F143C: push eax
  '004F143D: push ecx
  '004F143E: push esi
  '004F143F: call [edx+00000914h]
  '004F1445: movsx edx, word ptr [ebx]
  '004F1448: mov [esp+00000084h], edx
  '004F144F: fild dword ptr [esp+00000084h]
  '004F1456: fstp real8 ptr [esp+28h]
  '004F145A: fld real8 ptr [esp+28h]
  '004F145E: fadd real8 ptr [esp+40h]
  '004F1462: fstsw ax
  '004F1464: test al, 0Dh
  '004F1466: jnz 004F15E2h
  '004F146C: call edi
  '004F146E: push eax
  '004F146F: movsx eax, word ptr [ebx]
  '004F1472: mov [esp+00000088h], eax
  '004F1479: fild dword ptr [esp+00000088h]
  '004F1480: fstp real8 ptr [esp+2Ch]
  '004F1484: fld real8 ptr [esp+2Ch]
  '004F1488: fadd real8 ptr [esp+54h]
  '004F148C: fstsw ax
  '004F148E: test al, 0Dh
  '004F1490: jnz 004F15E2h
  '004F1496: call edi
  '004F1498: movsx ecx, word ptr [ebx]
  '004F149B: mov [esp+00000088h], ecx
  '004F14A2: push eax
  '004F14A3: fild dword ptr [esp+0000008Ch]
  '004F14AA: fstp real8 ptr [esp+30h]
  '004F14AE: fld real8 ptr [esp+30h]
  '004F14B2: fadd real8 ptr [esp+68h]
  '004F14B6: fstsw ax
  '004F14B8: test al, 0Dh
  '004F14BA: jnz 004F15E2h
  '004F14C0: call edi
  '004F14C2: push eax
  '004F14C3: call [00401034h]
  '004F14C9: lea ecx, [esp+14h]
  '004F14CD: mov edx, [esp+00000080h]
  '004F14D4: push ecx
  '004F14D5: push esi
  '004F14D6: mov [edx], eax
  '004F14D8: mov eax, [esi]
  '004F14DA: call [eax+00000100h]
  '004F14E0: test eax, eax
  '004F14E2: fclex 
  '004F14E4: jnl 4F14F8h
  '004F14E6: push 00000100h
  '004F14EB: push 0042725Ch
  '004F14F0: push esi
  '004F14F1: push eax
  '004F14F2: call [004010A0h]
  '004F14F8: mov edx, [esp+00000080h]
  '004F14FF: mov cx, bp
  '004F1502: add cx, 0001h
  '004F1506: mov ebx, [esi]
  '004F1508: mov eax, [edx]
  '004F150A: jo 004F15E7h
  '004F1510: movsx edx, cx
  '004F1513: mov [esp+00000084h], edx
  '004F151A: push eax
  '004F151B: fild dword ptr [esp+00000088h]
  '004F1522: movsx edi, bp
  '004F1525: fstp real4 ptr [esp+00000088h]
  '004F152C: fld real4 ptr [esp+18h]
  '004F1530: fsub real4 ptr [esp+00000088h]
  '004F1537: push edi
  '004F1538: fstsw ax
  '004F153A: test al, 0Dh
  '004F153C: jnz 004F15E2h
  '004F1542: call [0040135Ch]
  '004F1548: push eax
  '004F1549: push edi
  '004F154A: push edi
  '004F154B: push esi
  '004F154C: call [ebx+00000920h]
  '004F1552: mov eax, [esi]
  '004F1554: lea ecx, [esp+14h]
  '004F1558: push ecx
  '004F1559: push esi
  '004F155A: call [eax+00000108h]
  '004F1560: test eax, eax
  '004F1562: fclex 
  '004F1564: jnl 4F1578h
  '004F1566: push 00000108h
  '004F156B: push 0042725Ch
  '004F1570: push esi
  '004F1571: push eax
  '004F1572: call [004010A0h]
  '004F1578: mov edx, [esp+00000080h]
  '004F157F: mov cx, bp
  '004F1582: add cx, 0001h
  '004F1586: mov ebx, [esi]
  '004F1588: mov eax, [edx]
  '004F158A: jo 4F15E7h
  '004F158C: movsx edx, cx
  '004F158F: mov [esp+00000084h], edx
  '004F1596: push eax
  '004F1597: fild dword ptr [esp+00000088h]
  '004F159E: fstp real4 ptr [esp+00000088h]
  '004F15A5: fld real4 ptr [esp+18h]
  '004F15A9: fsub real4 ptr [esp+00000088h]
  '004F15B0: fstsw ax
  '004F15B2: test al, 0Dh
  '004F15B4: jnz 4F15E2h
  '004F15B6: call [0040135Ch]
  '004F15BC: push eax
  '004F15BD: push edi
  '004F15BE: push edi
  '004F15BF: push edi
  '004F15C0: push esi
  '004F15C1: call [ebx+00000920h]
  '004F15C7: sub bp, 0001h
  '004F15CB: jo 4F15E7h
  '004F15CD: test bp, bp
  '004F15D0: jnl 004F13F6h
  '004F15D6: pop edi
  '004F15D7: pop esi
  '004F15D8: pop ebp
  '004F15D9: xor eax, eax
  '004F15DB: pop ebx
  '004F15DC: add esp, 00000068h
  '004F15DF: retn 0010h
End Sub
Private Sub PicturePosition_4F15F0
  '004F15F0: sub esp, 00000078h
  '004F15F3: push ebx
  '004F15F4: push ebp
  '004F15F5: push esi
  '004F15F6: push edi
  '004F15F7: mov ecx, 00000006h
  '004F15FC: xor eax, eax
  '004F15FE: lea edi, [esp+40h]
  '004F1602: mov esi, [esp+0000008Ch]
  '004F1609: rep stosd 
  '004F160B: mov ecx, 00000006h
  '004F1610: lea edi, [esp+58h]
  '004F1614: rep stosd 
  '004F1616: mov ecx, 00000006h
  '004F161B: lea edi, [esp+70h]
  '004F161F: rep stosd 
  '004F1621: mov eax, [esp+00000090h]
  '004F1628: mov ebx, [esp+00000098h]
  '004F162F: xor edx, edx
  '004F1631: mov byte ptr [esp+13h], 00h
  '004F1636: mov ecx, [eax]
  '004F1638: mov eax, [esp+00000094h]
  '004F163F: mov [esp+14h], edx
  '004F1643: mov [esp+28h], edx
  '004F1647: mov di, [eax]
  '004F164A: mov [esp+24h], edx
  '004F164E: cmp di, dx
  '004F1651: mov [esp+2Ch], edx
  '004F1655: mov [esp+18h], ecx
  '004F1659: jl 004F182Bh
  '004F165F: mov ecx, [esi]
  '004F1661: mov ebp, [00401348h]
  '004F1667: lea edx, [esp+40h]
  '004F166B: lea eax, [esp+18h]
  '004F166F: push edx
  '004F1670: push eax
  '004F1671: push esi
  '004F1672: call [ecx+00000914h]
  '004F1678: movsx ecx, word ptr [ebx]
  '004F167B: mov [esp+1Ch], ecx
  '004F167F: fild dword ptr [esp+1Ch]
  '004F1683: fstp real8 ptr [esp+38h]
  '004F1687: fld real8 ptr [esp+38h]
  '004F168B: fadd real8 ptr [esp+40h]
  '004F168F: fstsw ax
  '004F1691: test al, 0Dh
  '004F1693: jnz 004F1978h
  '004F1699: call ebp
  '004F169B: mov edx, [esi]
  '004F169D: mov [esp+38h], eax
  '004F16A1: lea eax, [esp+58h]
  '004F16A5: lea ecx, [esp+18h]
  '004F16A9: push eax
  '004F16AA: push ecx
  '004F16AB: push esi
  '004F16AC: call [edx+00000914h]
  '004F16B2: movsx edx, word ptr [ebx]
  '004F16B5: mov [esp+1Ch], edx
  '004F16B9: fild dword ptr [esp+1Ch]
  '004F16BD: fstp real8 ptr [esp+30h]
  '004F16C1: fld real8 ptr [esp+30h]
  '004F16C5: fadd real8 ptr [esp+60h]
  '004F16C9: fstsw ax
  '004F16CB: test al, 0Dh
  '004F16CD: jnz 004F1978h
  '004F16D3: call ebp
  '004F16D5: lea ecx, [esp+70h]
  '004F16D9: lea edx, [esp+18h]
  '004F16DD: mov [esp+30h], eax
  '004F16E1: mov eax, [esi]
  '004F16E3: push ecx
  '004F16E4: push edx
  '004F16E5: push esi
  '004F16E6: call [eax+00000914h]
  '004F16EC: movsx eax, word ptr [ebx]
  '004F16EF: mov [esp+1Ch], eax
  '004F16F3: fild dword ptr [esp+1Ch]
  '004F16F7: fstp real8 ptr [esp+1Ch]
  '004F16FB: fld real8 ptr [esp+1Ch]
  '004F16FF: fadd real8 ptr [esp+00000080h]
  '004F1706: fstsw ax
  '004F1708: test al, 0Dh
  '004F170A: jnz 004F1978h
  '004F1710: call ebp
  '004F1712: mov ecx, [esp+30h]
  '004F1716: mov edx, [esp+38h]
  '004F171A: push eax
  '004F171B: push ecx
  '004F171C: push edx
  '004F171D: call [00401034h]
  '004F1723: lea ecx, [esp+14h]
  '004F1727: mov [esp+18h], eax
  '004F172B: mov eax, [esi]
  '004F172D: push ecx
  '004F172E: push esi
  '004F172F: call [eax+000000D8h]
  '004F1735: test eax, eax
  '004F1737: fclex 
  '004F1739: jnl 4F1751h
  '004F173B: mov ebp, [004010A0h]
  '004F1741: push 000000D8h
  '004F1746: push 0042725Ch
  '004F174B: push esi
  '004F174C: push eax
  '004F174D: call ebp
  '004F174F: jmp 4F1757h
  '004F1751: mov ebp, [004010A0h]
  '004F1757: mov edx, [esi]
  '004F1759: lea eax, [esp+28h]
  '004F175D: push eax
  '004F175E: push esi
  '004F175F: call [edx+00000100h]
  '004F1765: test eax, eax
  '004F1767: fclex 
  '004F1769: jnl 4F1779h
  '004F176B: push 00000100h
  '004F1770: push 0042725Ch
  '004F1775: push esi
  '004F1776: push eax
  '004F1777: call ebp
  '004F1779: mov ecx, [esi]
  '004F177B: lea edx, [esp+24h]
  '004F177F: push edx
  '004F1780: push esi
  '004F1781: call [ecx+00000108h]
  '004F1787: test eax, eax
  '004F1789: fclex 
  '004F178B: jnl 4F179Bh
  '004F178D: push 00000108h
  '004F1792: push 0042725Ch
  '004F1797: push esi
  '004F1798: push eax
  '004F1799: call ebp
  '004F179B: xor ecx, ecx
  '004F179D: call [00401208h]
  '004F17A3: movsx ecx, di
  '004F17A6: mov [esp+1Ch], ecx
  '004F17AA: mov [esp+13h], al
  '004F17AE: fild dword ptr [esp+1Ch]
  '004F17B2: mov eax, [esp+14h]
  '004F17B6: mov ebp, [esi]
  '004F17B8: mov [esp+2Ch], eax
  '004F17BC: mov eax, [esp+18h]
  '004F17C0: fstp real4 ptr [esp+38h]
  '004F17C4: fld real4 ptr [esp+24h]
  '004F17C8: fsub real4 ptr [esp+38h]
  '004F17CC: lea edx, [esp+13h]
  '004F17D0: push edx
  '004F17D1: push eax
  '004F17D2: fstsw ax
  '004F17D4: test al, 0Dh
  '004F17D6: jnz 004F1978h
  '004F17DC: call [0040135Ch]
  '004F17E2: fild dword ptr [esp+24h]
  '004F17E6: push eax
  '004F17E7: fstp real4 ptr [esp+44h]
  '004F17EB: fld real4 ptr [esp+34h]
  '004F17EF: fsub real4 ptr [esp+44h]
  '004F17F3: fstsw ax
  '004F17F5: test al, 0Dh
  '004F17F7: jnz 004F1978h
  '004F17FD: call [0040135Ch]
  '004F1803: push eax
  '004F1804: mov eax, [esp+2Ch]
  '004F1808: push eax
  '004F1809: lea ecx, [esp+40h]
  '004F180D: push eax
  '004F180E: push ecx
  '004F180F: push esi
  '004F1810: call [ebp+00000924h]
  '004F1816: sub di, 0001h
  '004F181A: jo 004F197Dh
  '004F1820: test di, di
  '004F1823: jnl 004F165Fh
  '004F1829: xor edx, edx
  '004F182B: mov ax, [ebx]
  '004F182E: mov ecx, [esp+00000094h]
  '004F1835: neg ax
  '004F1838: jo 004F197Dh
  '004F183E: mov [ebx], ax
  '004F1841: mov bp, [ecx]
  '004F1844: cmp bp, dx
  '004F1847: jl 004F196Ch
  '004F184D: jmp 4F1856h
  '004F184F: mov ebx, [esp+00000098h]
  '004F1856: movsx ecx, word ptr [ebx]
  '004F1859: mov edx, [esi]
  '004F185B: lea eax, [esp+14h]
  '004F185F: push eax
  '004F1860: mov eax, [esp+00000094h]
  '004F1867: push ecx
  '004F1868: mov ecx, [eax]
  '004F186A: push ecx
  '004F186B: push esi
  '004F186C: call [edx+0000091Ch]
  '004F1872: lea ecx, [esp+14h]
  '004F1876: mov ebx, [esp+00000090h]
  '004F187D: mov edx, [esp+14h]
  '004F1881: push ecx
  '004F1882: push esi
  '004F1883: mov [ebx], edx
  '004F1885: mov eax, [esi]
  '004F1887: call [eax+00000100h]
  '004F188D: test eax, eax
  '004F188F: fclex 
  '004F1891: jnl 4F18A5h
  '004F1893: push 00000100h
  '004F1898: push 0042725Ch
  '004F189D: push esi
  '004F189E: push eax
  '004F189F: call [004010A0h]
  '004F18A5: mov eax, [ebx]
  '004F18A7: mov cx, bp
  '004F18AA: add cx, 0001h
  '004F18AE: push eax
  '004F18AF: jo 004F197Dh
  '004F18B5: movsx eax, cx
  '004F18B8: mov [esp+3Ch], eax
  '004F18BC: mov edx, [esi]
  '004F18BE: fild dword ptr [esp+3Ch]
  '004F18C2: movsx edi, bp
  '004F18C5: fstp real4 ptr [esp+3Ch]
  '004F18C9: fld real4 ptr [esp+18h]
  '004F18CD: fsub real4 ptr [esp+3Ch]
  '004F18D1: push edi
  '004F18D2: mov [esp+40h], edx
  '004F18D6: fstsw ax
  '004F18D8: test al, 0Dh
  '004F18DA: jnz 004F1978h
  '004F18E0: call [0040135Ch]
  '004F18E6: mov ecx, [esp+40h]
  '004F18EA: push eax
  '004F18EB: push edi
  '004F18EC: push edi
  '004F18ED: push esi
  '004F18EE: call [ecx+00000920h]
  '004F18F4: mov edx, [esi]
  '004F18F6: lea eax, [esp+14h]
  '004F18FA: push eax
  '004F18FB: push esi
  '004F18FC: call [edx+00000108h]
  '004F1902: test eax, eax
  '004F1904: fclex 
  '004F1906: jnl 4F191Ah
  '004F1908: push 00000108h
  '004F190D: push 0042725Ch
  '004F1912: push esi
  '004F1913: push eax
  '004F1914: call [004010A0h]
  '004F191A: mov ecx, [esp+00000090h]
  '004F1921: mov ax, bp
  '004F1924: add ax, 0001h
  '004F1928: mov ebx, [esi]
  '004F192A: mov edx, [ecx]
  '004F192C: jo 4F197Dh
  '004F192E: movsx ecx, ax
  '004F1931: mov [esp+38h], ecx
  '004F1935: push edx
  '004F1936: fild dword ptr [esp+3Ch]
  '004F193A: fstp real4 ptr [esp+3Ch]
  '004F193E: fld real4 ptr [esp+18h]
  '004F1942: fsub real4 ptr [esp+3Ch]
  '004F1946: fstsw ax
  '004F1948: test al, 0Dh
  '004F194A: jnz 4F1978h
  '004F194C: call [0040135Ch]
  '004F1952: push eax
  '004F1953: push edi
  '004F1954: push edi
  '004F1955: push edi
  '004F1956: push esi
  '004F1957: call [ebx+00000920h]
  '004F195D: sub bp, 0001h
  '004F1961: jo 4F197Dh
  '004F1963: test bp, bp
  '004F1966: jnl 004F184Fh
  '004F196C: pop edi
  '004F196D: pop esi
  '004F196E: pop ebp
  '004F196F: xor eax, eax
  '004F1971: pop ebx
  '004F1972: add esp, 00000078h
  '004F1975: retn 0010h
End Sub
Private Sub Picture_4F1990
  '004F1990: sub esp, 00000018h
  '004F1993: mov eax, [esp+24h]
  '004F1997: push ebx
  '004F1998: xor ebx, ebx
  '004F199A: push esi
  '004F199B: cmp word ptr [eax], 0002h
  '004F199F: mov esi, [esp+24h]
  '004F19A3: push edi
  '004F19A4: mov [esp+14h], ebx
  '004F19A8: mov [esp+20h], ebx
  '004F19AC: mov [esp+0Ch], ebx
  '004F19B0: mov [esp+10h], ebx
  '004F19B4: mov [esp+18h], ebx
  '004F19B8: mov [esp+1Ch], ebx
  '004F19BC: jnl 004F1C11h
  '004F19C2: mov ecx, [esi]
  '004F19C4: lea edx, [esp+0Ch]
  '004F19C8: push edx
  '004F19C9: push esi
  '004F19CA: call [ecx+000000D8h]
  '004F19D0: mov edi, [004010A0h]
  '004F19D6: cmp eax, ebx
  '004F19D8: fclex 
  '004F19DA: jnl 4F19EAh
  '004F19DC: push 000000D8h
  '004F19E1: push 0042725Ch
  '004F19E6: push esi
  '004F19E7: push eax
  '004F19E8: call edi
  '004F19EA: mov eax, [esi]
  '004F19EC: lea ecx, [esp+10h]
  '004F19F0: push ecx
  '004F19F1: push esi
  '004F19F2: call [eax+00000100h]
  '004F19F8: cmp eax, ebx
  '004F19FA: fclex 
  '004F19FC: jnl 4F1A0Ch
  '004F19FE: push 00000100h
  '004F1A03: push 0042725Ch
  '004F1A08: push esi
  '004F1A09: push eax
  '004F1A0A: call edi
  '004F1A0C: mov edx, [esi]
  '004F1A0E: lea eax, [esp+18h]
  '004F1A12: push eax
  '004F1A13: push esi
  '004F1A14: call [edx+00000108h]
  '004F1A1A: cmp eax, ebx
  '004F1A1C: fclex 
  '004F1A1E: jnl 4F1A2Eh
  '004F1A20: push 00000108h
  '004F1A25: push 0042725Ch
  '004F1A2A: push esi
  '004F1A2B: push eax
  '004F1A2C: call edi
  '004F1A2E: fld real4 ptr [esp+18h]
  '004F1A32: fsub real4 ptr [004055F8h]
  '004F1A38: mov ecx, [esp+0Ch]
  '004F1A3C: lea edx, [esp+14h]
  '004F1A40: push ebp
  '004F1A41: mov ebp, [0040135Ch]
  '004F1A47: push edx
  '004F1A48: mov [esp+1Ch], bl
  '004F1A4C: mov ebx, [esi]
  '004F1A4E: push 80000010h
  '004F1A53: fstsw ax
  '004F1A55: test al, 0Dh
  '004F1A57: jnz 004F1CB0h
  '004F1A5D: mov [esp+28h], ecx
  '004F1A61: call ebp
  '004F1A63: fld real4 ptr [esp+1Ch]
  '004F1A67: fsub real4 ptr [004055F8h]
  '004F1A6D: push eax
  '004F1A6E: fstsw ax
  '004F1A70: test al, 0Dh
  '004F1A72: jnz 004F1CB0h
  '004F1A78: call ebp
  '004F1A7A: push eax
  '004F1A7B: push 00000000h
  '004F1A7D: lea eax, [esp+34h]
  '004F1A81: push 00000000h
  '004F1A83: push eax
  '004F1A84: push esi
  '004F1A85: call [ebx+00000924h]
  '004F1A8B: mov ecx, [esi]
  '004F1A8D: lea edx, [esp+10h]
  '004F1A91: push edx
  '004F1A92: push esi
  '004F1A93: call [ecx+000000D8h]
  '004F1A99: test eax, eax
  '004F1A9B: fclex 
  '004F1A9D: jnl 4F1AADh
  '004F1A9F: push 000000D8h
  '004F1AA4: push 0042725Ch
  '004F1AA9: push esi
  '004F1AAA: push eax
  '004F1AAB: call edi
  '004F1AAD: mov eax, [esi]
  '004F1AAF: lea ecx, [esp+14h]
  '004F1AB3: push ecx
  '004F1AB4: push esi
  '004F1AB5: call [eax+00000100h]
  '004F1ABB: test eax, eax
  '004F1ABD: fclex 
  '004F1ABF: jnl 4F1ACFh
  '004F1AC1: push 00000100h
  '004F1AC6: push 0042725Ch
  '004F1ACB: push esi
  '004F1ACC: push eax
  '004F1ACD: call edi
  '004F1ACF: mov edx, [esi]
  '004F1AD1: lea eax, [esp+1Ch]
  '004F1AD5: push eax
  '004F1AD6: push esi
  '004F1AD7: call [edx+00000108h]
  '004F1ADD: test eax, eax
  '004F1ADF: fclex 
  '004F1AE1: jnl 4F1AF1h
  '004F1AE3: push 00000108h
  '004F1AE8: push 0042725Ch
  '004F1AED: push esi
  '004F1AEE: push eax
  '004F1AEF: call edi
  '004F1AF1: fld real4 ptr [esp+1Ch]
  '004F1AF5: fadd real4 ptr [004055F8h]
  '004F1AFB: mov ecx, [esp+10h]
  '004F1AFF: mov ebx, [esi]
  '004F1B01: lea edx, [esp+18h]
  '004F1B05: mov byte ptr [esp+18h], 00h
  '004F1B0A: push edx
  '004F1B0B: push 80000014h
  '004F1B10: fstsw ax
  '004F1B12: test al, 0Dh
  '004F1B14: jnz 004F1CB0h
  '004F1B1A: mov [esp+28h], ecx
  '004F1B1E: call ebp
  '004F1B20: fld real4 ptr [esp+1Ch]
  '004F1B24: fadd real4 ptr [004055F8h]
  '004F1B2A: push eax
  '004F1B2B: fstsw ax
  '004F1B2D: test al, 0Dh
  '004F1B2F: jnz 004F1CB0h
  '004F1B35: call ebp
  '004F1B37: push eax
  '004F1B38: push 00000000h
  '004F1B3A: lea eax, [esp+34h]
  '004F1B3E: push 00000000h
  '004F1B40: push eax
  '004F1B41: push esi
  '004F1B42: call [ebx+00000924h]
  '004F1B48: mov ecx, [esi]
  '004F1B4A: lea edx, [esp+10h]
  '004F1B4E: push edx
  '004F1B4F: push esi
  '004F1B50: call [ecx+000000D8h]
  '004F1B56: test eax, eax
  '004F1B58: fclex 
  '004F1B5A: jnl 4F1B6Ah
  '004F1B5C: push 000000D8h
  '004F1B61: push 0042725Ch
  '004F1B66: push esi
  '004F1B67: push eax
  '004F1B68: call edi
  '004F1B6A: mov eax, [esi]
  '004F1B6C: lea ecx, [esp+14h]
  '004F1B70: push ecx
  '004F1B71: push esi
  '004F1B72: call [eax+00000100h]
  '004F1B78: test eax, eax
  '004F1B7A: fclex 
  '004F1B7C: jnl 4F1B8Ch
  '004F1B7E: push 00000100h
  '004F1B83: push 0042725Ch
  '004F1B88: push esi
  '004F1B89: push eax
  '004F1B8A: call edi
  '004F1B8C: mov edx, [esi]
  '004F1B8E: lea eax, [esp+1Ch]
  '004F1B92: push eax
  '004F1B93: push esi
  '004F1B94: call [edx+00000108h]
  '004F1B9A: test eax, eax
  '004F1B9C: fclex 
  '004F1B9E: jnl 4F1BAEh
  '004F1BA0: push 00000108h
  '004F1BA5: push 0042725Ch
  '004F1BAA: push esi
  '004F1BAB: push eax
  '004F1BAC: call edi
  '004F1BAE: fld real4 ptr [esp+1Ch]
  '004F1BB2: fadd real4 ptr [004055F8h]
  '004F1BB8: mov ecx, [esp+10h]
  '004F1BBC: mov edi, [esi]
  '004F1BBE: lea edx, [esp+18h]
  '004F1BC2: mov byte ptr [esp+18h], 00h
  '004F1BC7: push edx
  '004F1BC8: push 80000015h
  '004F1BCD: fstsw ax
  '004F1BCF: test al, 0Dh
  '004F1BD1: jnz 004F1CB0h
  '004F1BD7: mov [esp+28h], ecx
  '004F1BDB: call ebp
  '004F1BDD: fld real4 ptr [esp+1Ch]
  '004F1BE1: fadd real4 ptr [004055F8h]
  '004F1BE7: push eax
  '004F1BE8: fstsw ax
  '004F1BEA: test al, 0Dh
  '004F1BEC: jnz 004F1CB0h
  '004F1BF2: call ebp
  '004F1BF4: push eax
  '004F1BF5: push FFFFFFFFh
  '004F1BF7: lea eax, [esp+34h]
  '004F1BFB: push FFFFFFFFh
  '004F1BFD: push eax
  '004F1BFE: push esi
  '004F1BFF: call [edi+00000924h]
  '004F1C05: pop ebp
  '004F1C06: pop edi
  '004F1C07: pop esi
  '004F1C08: xor eax, eax
  '004F1C0A: pop ebx
  '004F1C0B: add esp, 00000018h
  '004F1C0E: retn 0010h
End Sub
Private Sub Picture_4F1CC0
  '004F1CC0: sub esp, 00000040h
  '004F1CC3: push ebx
  '004F1CC4: push ebp
  '004F1CC5: push esi
  '004F1CC6: mov esi, [esp+50h]
  '004F1CCA: push edi
  '004F1CCB: mov ecx, 00000006h
  '004F1CD0: xor eax, eax
  '004F1CD2: lea edi, [esp+20h]
  '004F1CD6: rep stosd 
  '004F1CD8: mov ecx, 00000006h
  '004F1CDD: lea edi, [esp+38h]
  '004F1CE1: rep stosd 
  '004F1CE3: mov eax, [esi+000000C0h]
  '004F1CE9: xor ebx, ebx
  '004F1CEB: cmp eax, 00000003h
  '004F1CEE: mov [esp+14h], ebx
  '004F1CF2: mov [esp+10h], ebx
  '004F1CF6: mov [esp+18h], ebx
  '004F1CFA: mov [esp+1Ch], ebx
  '004F1CFE: jz 004F1F8Eh
  '004F1D04: mov edi, [004010A0h]
  '004F1D0A: cmp eax, 00000002h
  '004F1D0D: jnz 4F1D52h
  '004F1D0F: cmp [esi+000000E9h], bl
  '004F1D15: jnz 4F1D2Ch
  '004F1D17: cmp word ptr [esi+00000106h], FFFFh
  '004F1D1F: jnz 4F1D2Ch
  '004F1D21: mov eax, [esi]
  '004F1D23: push esi
  '004F1D24: call [eax+0000090Ch]
  '004F1D2A: jmp 4F1D65h
  '004F1D2C: mov eax, [esi+10h]
  '004F1D2F: mov edx, [esi+0000011Ch]
  '004F1D35: push edx
  '004F1D36: push eax
  '004F1D37: mov ecx, [eax]
  '004F1D39: call [ecx+64h]
  '004F1D3C: cmp eax, ebx
  '004F1D3E: fclex 
  '004F1D40: jnl 4F1D65h
  '004F1D42: mov ecx, [esi+10h]
  '004F1D45: push 00000064h
  '004F1D47: push 0042725Ch
  '004F1D4C: push ecx
  '004F1D4D: push eax
  '004F1D4E: call edi
  '004F1D50: jmp 4F1D65h
  '004F1D52: cmp word ptr [esi+00000106h], FFFFh
  '004F1D5A: jnz 4F1D65h
  '004F1D5C: mov edx, [esi]
  '004F1D5E: push esi
  '004F1D5F: call [edx+0000090Ch]
  '004F1D65: cmp [esi+000000C0h], 00000002h
  '004F1D6C: jnz 004F1F8Eh
  '004F1D72: mov eax, [esi]
  '004F1D74: lea ecx, [esp+18h]
  '004F1D78: lea edx, [esp+10h]
  '004F1D7C: push ecx
  '004F1D7D: push edx
  '004F1D7E: push esi
  '004F1D7F: mov [esp+1Ch], 8000000Dh
  '004F1D87: call [eax+00000918h]
  '004F1D8D: mov ecx, [esi]
  '004F1D8F: lea edx, [esp+38h]
  '004F1D93: mov eax, [esp+18h]
  '004F1D97: push edx
  '004F1D98: mov [esp+20h], eax
  '004F1D9C: lea eax, [esp+20h]
  '004F1DA0: push eax
  '004F1DA1: push esi
  '004F1DA2: call [ecx+00000914h]
  '004F1DA8: lea ecx, [esp+38h]
  '004F1DAC: lea edx, [esp+20h]
  '004F1DB0: push ecx
  '004F1DB1: push edx
  '004F1DB2: push 00000018h
  '004F1DB4: call [00401084h]
  '004F1DBA: mov cl, [esi+000000EAh]
  '004F1DC0: mov dl, [esi+000000E9h]
  '004F1DC6: xor eax, eax
  '004F1DC8: cmp cl, 01h
  '004F1DCB: mov ebp, [00401348h]
  '004F1DD1: setnz al
  '004F1DD4: xor ecx, ecx
  '004F1DD6: cmp dl, bl
  '004F1DD8: setnz cl
  '004F1DDB: or eax, ecx
  '004F1DDD: jnz 004F1EAFh
  '004F1DE3: mov edx, [esi]
  '004F1DE5: lea eax, [esp+14h]
  '004F1DE9: push eax
  '004F1DEA: push esi
  '004F1DEB: call [edx+00000830h]
  '004F1DF1: cmp eax, ebx
  '004F1DF3: jnl 4F1E03h
  '004F1DF5: push 00000830h
  '004F1DFA: push 0042728Ch
  '004F1DFF: push esi
  '004F1E00: push eax
  '004F1E01: call edi
  '004F1E03: cmp word ptr [esp+14h], FFFFh
  '004F1E09: jnz 4F1E6Dh
  '004F1E0B: fld real8 ptr [esp+30h]
  '004F1E0F: fadd real8 ptr [00405748h]
  '004F1E15: mov ecx, [esi+10h]
  '004F1E18: mov ebx, [ecx]
  '004F1E1A: fstsw ax
  '004F1E1C: test al, 0Dh
  '004F1E1E: jnz 004F1F9Ah
  '004F1E24: call ebp
  '004F1E26: fld real8 ptr [esp+28h]
  '004F1E2A: fadd real8 ptr [00405740h]
  '004F1E30: push eax
  '004F1E31: fstsw ax
  '004F1E33: test al, 0Dh
  '004F1E35: jnz 004F1F9Ah
  '004F1E3B: call ebp
  '004F1E3D: fld real8 ptr [esp+24h]
  '004F1E41: fadd real8 ptr [00405738h]
  '004F1E47: push eax
  '004F1E48: fstsw ax
  '004F1E4A: test al, 0Dh
  '004F1E4C: jnz 004F1F9Ah
  '004F1E52: call ebp
  '004F1E54: push eax
  '004F1E55: call [00401034h]
  '004F1E5B: mov edx, [esi+10h]
  '004F1E5E: push eax
  '004F1E5F: push edx
  '004F1E60: call [ebx+64h]
  '004F1E63: xor ebx, ebx
  '004F1E65: cmp eax, ebx
  '004F1E67: fclex 
  '004F1E69: jnl 4F1EAFh
  '004F1E6B: jmp 4F1EA1h
  '004F1E6D: mov edx, [esi]
  '004F1E6F: lea eax, [esp+10h]
  '004F1E73: push eax
  '004F1E74: push esi
  '004F1E75: call [edx+00000828h]
  '004F1E7B: cmp eax, ebx
  '004F1E7D: jnl 4F1E8Dh
  '004F1E7F: push 00000828h
  '004F1E84: push 0042728Ch
  '004F1E89: push esi
  '004F1E8A: push eax
  '004F1E8B: call edi
  '004F1E8D: mov eax, [esi+10h]
  '004F1E90: mov edx, [esp+10h]
  '004F1E94: push edx
  '004F1E95: push eax
  '004F1E96: mov ecx, [eax]
  '004F1E98: call [ecx+64h]
  '004F1E9B: cmp eax, ebx
  '004F1E9D: fclex 
  '004F1E9F: jnl 4F1EAFh
  '004F1EA1: mov ecx, [esi+10h]
  '004F1EA4: push 00000064h
  '004F1EA6: push 0042725Ch
  '004F1EAB: push ecx
  '004F1EAC: push eax
  '004F1EAD: call edi
  '004F1EAF: cmp byte ptr [esi+000000E9h], 01h
  '004F1EB6: jnz 004F1F8Eh
  '004F1EBC: mov edx, [esi]
  '004F1EBE: lea eax, [esp+14h]
  '004F1EC2: push eax
  '004F1EC3: push esi
  '004F1EC4: call [edx+00000830h]
  '004F1ECA: cmp eax, ebx
  '004F1ECC: jnl 4F1EDCh
  '004F1ECE: push 00000830h
  '004F1ED3: push 0042728Ch
  '004F1ED8: push esi
  '004F1ED9: push eax
  '004F1EDA: call edi
  '004F1EDC: cmp word ptr [esp+14h], FFFFh
  '004F1EE2: jnz 4F1F4Ch
  '004F1EE4: fld real8 ptr [esp+30h]
  '004F1EE8: fadd real8 ptr [00405748h]
  '004F1EEE: mov ecx, [esi+10h]
  '004F1EF1: mov ebx, [ecx]
  '004F1EF3: fstsw ax
  '004F1EF5: test al, 0Dh
  '004F1EF7: jnz 004F1F9Ah
  '004F1EFD: call ebp
  '004F1EFF: fld real8 ptr [esp+28h]
  '004F1F03: fadd real8 ptr [00405740h]
  '004F1F09: push eax
  '004F1F0A: fsub real8 ptr [00405730h]
  '004F1F10: fstsw ax
  '004F1F12: test al, 0Dh
  '004F1F14: jnz 004F1F9Ah
  '004F1F1A: call ebp
  '004F1F1C: fld real8 ptr [esp+24h]
  '004F1F20: fadd real8 ptr [00405738h]
  '004F1F26: push eax
  '004F1F27: fsub real8 ptr [00405730h]
  '004F1F2D: fstsw ax
  '004F1F2F: test al, 0Dh
  '004F1F31: jnz 4F1F9Ah
  '004F1F33: call ebp
  '004F1F35: push eax
  '004F1F36: call [00401034h]
  '004F1F3C: mov edx, [esi+10h]
  '004F1F3F: push eax
  '004F1F40: push edx
  '004F1F41: call [ebx+64h]
  '004F1F44: test eax, eax
  '004F1F46: fclex 
  '004F1F48: jnl 4F1F8Eh
  '004F1F4A: jmp 4F1F80h
  '004F1F4C: mov edx, [esi]
  '004F1F4E: lea eax, [esp+10h]
  '004F1F52: push eax
  '004F1F53: push esi
  '004F1F54: call [edx+00000820h]
  '004F1F5A: cmp eax, ebx
  '004F1F5C: jnl 4F1F6Ch
  '004F1F5E: push 00000820h
  '004F1F63: push 0042728Ch
  '004F1F68: push esi
  '004F1F69: push eax
  '004F1F6A: call edi
  '004F1F6C: mov eax, [esi+10h]
  '004F1F6F: mov edx, [esp+10h]
  '004F1F73: push edx
  '004F1F74: push eax
  '004F1F75: mov ecx, [eax]
  '004F1F77: call [ecx+64h]
  '004F1F7A: cmp eax, ebx
  '004F1F7C: fclex 
  '004F1F7E: jnl 4F1F8Eh
  '004F1F80: mov ecx, [esi+10h]
  '004F1F83: push 00000064h
  '004F1F85: push 0042725Ch
  '004F1F8A: push ecx
  '004F1F8B: push eax
  '004F1F8C: call edi
  '004F1F8E: pop edi
  '004F1F8F: pop esi
  '004F1F90: pop ebp
  '004F1F91: xor eax, eax
  '004F1F93: pop ebx
  '004F1F94: add esp, 00000040h
  '004F1F97: retn 0004h
End Sub
Private Sub PictureWidth_4F1FA0
  '004F1FA0: push ebp
  '004F1FA1: mov ebp, esp
  '004F1FA3: sub esp, 00000008h
  '004F1FA6: push 004081B6h
  '004F1FAB: mov eax, fs:[00h]
  '004F1FB1: push eax
  '004F1FB2: mov fs:[00000000h], esp
  '004F1FB9: sub esp, 00000060h
  '004F1FBC: push ebx
  '004F1FBD: push esi
  '004F1FBE: push edi
  '004F1FBF: mov [ebp-08h], esp
  '004F1FC2: mov [ebp-04h], 00405750h
  '004F1FC9: mov esi, [ebp+08h]
  '004F1FCC: lea ecx, [ebp-14h]
  '004F1FCF: xor ebx, ebx
  '004F1FD1: push ecx
  '004F1FD2: mov eax, [esi]
  '004F1FD4: push esi
  '004F1FD5: mov [ebp-14h], ebx
  '004F1FD8: mov [ebp-24h], ebx
  '004F1FDB: mov [ebp-34h], ebx
  '004F1FDE: mov [ebp-44h], ebx
  '004F1FE1: mov [ebp-48h], ebx
  '004F1FE4: mov [ebp-4Ch], ebx
  '004F1FE7: mov [ebp-50h], ebx
  '004F1FEA: mov [ebp-54h], ebx
  '004F1FED: mov [ebp-58h], ebx
  '004F1FF0: mov [ebp-5Ch], ebx
  '004F1FF3: call [eax+000002B0h]
  '004F1FF9: cmp eax, ebx
  '004F1FFB: fclex 
  '004F1FFD: jnl 4F2015h
  '004F1FFF: mov edi, [004010A0h]
  '004F2005: push 000002B0h
  '004F200A: push 0042725Ch
  '004F200F: push esi
  '004F2010: push eax
  '004F2011: call edi
  '004F2013: jmp 4F201Bh
  '004F2015: mov edi, [004010A0h]
  '004F201B: mov eax, [ebp-14h]
  '004F201E: lea ecx, [ebp-48h]
  '004F2021: push ecx
  '004F2022: push eax
  '004F2023: mov edx, [eax]
  '004F2025: mov [ebp-64h], eax
  '004F2028: call [edx+3Ch]
  '004F202B: cmp eax, ebx
  '004F202D: fclex 
  '004F202F: jnl 4F203Fh
  '004F2031: mov edx, [ebp-64h]
  '004F2034: push 0000003Ch
  '004F2036: push 00427BDCh
  '004F203B: push edx
  '004F203C: push eax
  '004F203D: call edi
  '004F203F: mov ebx, [ebp-48h]
  '004F2042: lea ecx, [ebp-14h]
  '004F2045: not ebx
  '004F2047: call [004013B8h]
  '004F204D: mov eax, [esi+000000C0h]
  '004F2053: test bx, bx
  '004F2056: jz 004F2292h
  '004F205C: cmp eax, 00000003h
  '004F205F: jnz 4F2086h
  '004F2061: mov edi, [esi]
  '004F2063: lea eax, [ebp-48h]
  '004F2066: push eax
  '004F2067: xor ecx, ecx
  '004F2069: mov byte ptr [ebp-48h], 00h
  '004F206D: call [00401208h]
  '004F2073: push eax
  '004F2074: push esi
  '004F2075: call [edi+00000928h]
  '004F207B: wait 
  '004F207C: push 004F2B83h
  '004F2081: jmp 004F2B82h
  '004F2086: cmp eax, 00000002h
  '004F2089: jnz 4F209Fh
  '004F208B: mov ecx, [esi]
  '004F208D: push esi
  '004F208E: call [ecx+000008E8h]
  '004F2094: wait 
  '004F2095: push 004F2B83h
  '004F209A: jmp 004F2B82h
  '004F209F: cmp word ptr [esi+00000102h], 0002h
  '004F20A7: lea ebx, [esi+00000102h]
  '004F20AD: jnl 004F2212h
  '004F20B3: mov edx, [esi]
  '004F20B5: lea eax, [ebp-50h]
  '004F20B8: push eax
  '004F20B9: push esi
  '004F20BA: call [edx+000000D8h]
  '004F20C0: test eax, eax
  '004F20C2: fclex 
  '004F20C4: jnl 4F20D4h
  '004F20C6: push 000000D8h
  '004F20CB: push 0042725Ch
  '004F20D0: push esi
  '004F20D1: push eax
  '004F20D2: call edi
  '004F20D4: mov ecx, [esi]
  '004F20D6: lea edx, [ebp-54h]
  '004F20D9: push edx
  '004F20DA: push esi
  '004F20DB: call [ecx+00000100h]
  '004F20E1: test eax, eax
  '004F20E3: fclex 
  '004F20E5: jnl 4F20F5h
  '004F20E7: push 00000100h
  '004F20EC: push 0042725Ch
  '004F20F1: push esi
  '004F20F2: push eax
  '004F20F3: call edi
  '004F20F5: mov eax, [esi]
  '004F20F7: lea ecx, [ebp-58h]
  '004F20FA: push ecx
  '004F20FB: push esi
  '004F20FC: call [eax+00000108h]
  '004F2102: test eax, eax
  '004F2104: fclex 
  '004F2106: jnl 4F2116h
  '004F2108: push 00000108h
  '004F210D: push 0042725Ch
  '004F2112: push esi
  '004F2113: push eax
  '004F2114: call edi
  '004F2116: mov edx, [ebp-50h]
  '004F2119: mov ebx, [esi]
  '004F211B: fld real4 ptr [ebp-58h]
  '004F211E: lea eax, [ebp-48h]
  '004F2121: mov byte ptr [ebp-48h], 00h
  '004F2125: push eax
  '004F2126: push 80000010h
  '004F212B: mov [ebp-5Ch], edx
  '004F212E: call [0040135Ch]
  '004F2134: fld real4 ptr [ebp-54h]
  '004F2137: push eax
  '004F2138: call [0040135Ch]
  '004F213E: push eax
  '004F213F: push 00000000h
  '004F2141: lea ecx, [ebp-5Ch]
  '004F2144: push 00000000h
  '004F2146: push ecx
  '004F2147: push esi
  '004F2148: call [ebx+00000924h]
  '004F214E: mov edx, [esi]
  '004F2150: lea eax, [ebp-50h]
  '004F2153: push eax
  '004F2154: push esi
  '004F2155: call [edx+000000D8h]
  '004F215B: test eax, eax
  '004F215D: fclex 
  '004F215F: jnl 4F216Fh
  '004F2161: push 000000D8h
  '004F2166: push 0042725Ch
  '004F216B: push esi
  '004F216C: push eax
  '004F216D: call edi
  '004F216F: mov ecx, [esi]
  '004F2171: lea edx, [ebp-54h]
  '004F2174: push edx
  '004F2175: push esi
  '004F2176: call [ecx+00000100h]
  '004F217C: test eax, eax
  '004F217E: fclex 
  '004F2180: jnl 4F2190h
  '004F2182: push 00000100h
  '004F2187: push 0042725Ch
  '004F218C: push esi
  '004F218D: push eax
  '004F218E: call edi
  '004F2190: mov eax, [esi]
  '004F2192: lea ecx, [ebp-58h]
  '004F2195: push ecx
  '004F2196: push esi
  '004F2197: call [eax+00000108h]
  '004F219D: test eax, eax
  '004F219F: fclex 
  '004F21A1: jnl 4F21B1h
  '004F21A3: push 00000108h
  '004F21A8: push 0042725Ch
  '004F21AD: push esi
  '004F21AE: push eax
  '004F21AF: call edi
  '004F21B1: fld real4 ptr [ebp-58h]
  '004F21B4: fadd real4 ptr [004055F8h]
  '004F21BA: mov edx, [ebp-50h]
  '004F21BD: mov edi, [0040135Ch]
  '004F21C3: mov ebx, [esi]
  '004F21C5: lea eax, [ebp-48h]
  '004F21C8: push eax
  '004F21C9: push 80000014h
  '004F21CE: fstsw ax
  '004F21D0: test al, 0Dh
  '004F21D2: jnz 004F2B98h
  '004F21D8: mov byte ptr [ebp-48h], 00h
  '004F21DC: mov [ebp-5Ch], edx
  '004F21DF: call edi
  '004F21E1: fld real4 ptr [ebp-54h]
  '004F21E4: fadd real4 ptr [004055F8h]
  '004F21EA: push eax
  '004F21EB: fstsw ax
  '004F21ED: test al, 0Dh
  '004F21EF: jnz 004F2B98h
  '004F21F5: call edi
  '004F21F7: push eax
  '004F21F8: push 00000000h
  '004F21FA: lea ecx, [ebp-5Ch]
  '004F21FD: push 00000000h
  '004F21FF: push ecx
  '004F2200: push esi
  '004F2201: call [ebx+00000924h]
  '004F2207: wait 
  '004F2208: push 004F2B83h
  '004F220D: jmp 004F2B82h
  '004F2212: mov eax, [esi+10h]
  '004F2215: lea ecx, [ebp-50h]
  '004F2218: push ecx
  '004F2219: push eax
  '004F221A: mov edx, [eax]
  '004F221C: call [edx+60h]
  '004F221F: test eax, eax
  '004F2221: fclex 
  '004F2223: jnl 4F2233h
  '004F2225: mov edx, [esi+10h]
  '004F2228: push 00000060h
  '004F222A: push 0042725Ch
  '004F222F: push edx
  '004F2230: push eax
  '004F2231: call edi
  '004F2233: mov eax, [ebp-50h]
  '004F2236: mov ecx, [esi]
  '004F2238: mov [ebp-54h], eax
  '004F223B: lea edx, [ebp-58h]
  '004F223E: lea eax, [ebp-54h]
  '004F2241: push edx
  '004F2242: push eax
  '004F2243: push esi
  '004F2244: call [ecx+00000918h]
  '004F224A: mov ecx, [esi]
  '004F224C: lea edx, [ebp-48h]
  '004F224F: push edx
  '004F2250: push esi
  '004F2251: call [ecx+00000888h]
  '004F2257: test eax, eax
  '004F2259: jnl 4F2269h
  '004F225B: push 00000888h
  '004F2260: push 0042728Ch
  '004F2265: push esi
  '004F2266: push eax
  '004F2267: call edi
  '004F2269: mov eax, [ebp-48h]
  '004F226C: mov ecx, [ebp-58h]
  '004F226F: mov edx, [esi]
  '004F2271: mov [ebp-4Ch], eax
  '004F2274: lea eax, [ebp-4Ch]
  '004F2277: mov [ebp-5Ch], ecx
  '004F227A: push eax
  '004F227B: lea ecx, [ebp-5Ch]
  '004F227E: push ebx
  '004F227F: push ecx
  '004F2280: push esi
  '004F2281: call [edx+000008DCh]
  '004F2287: wait 
  '004F2288: push 004F2B83h
  '004F228D: jmp 004F2B82h
  '004F2292: cmp eax, 00000002h
  '004F2295: jnz 004F237Eh
  '004F229B: mov edx, [esi]
  '004F229D: lea eax, [ebp-48h]
  '004F22A0: push eax
  '004F22A1: push esi
  '004F22A2: call [edx+00000868h]
  '004F22A8: test eax, eax
  '004F22AA: jnl 4F22BAh
  '004F22AC: push 00000868h
  '004F22B1: push 0042728Ch
  '004F22B6: push esi
  '004F22B7: push eax
  '004F22B8: call edi
  '004F22BA: mov al, [esi+000000EAh]
  '004F22C0: xor ecx, ecx
  '004F22C2: test al, al
  '004F22C4: setnz cl
  '004F22C7: xor edx, edx
  '004F22C9: cmp [ebp-48h], dx
  '004F22CD: setnz dl
  '004F22D0: or ecx, edx
  '004F22D2: jz 004F2B5Dh
  '004F22D8: mov eax, [esi]
  '004F22DA: lea ecx, [ebp-50h]
  '004F22DD: push ecx
  '004F22DE: push esi
  '004F22DF: call [eax+000000D8h]
  '004F22E5: test eax, eax
  '004F22E7: fclex 
  '004F22E9: jnl 4F22F9h
  '004F22EB: push 000000D8h
  '004F22F0: push 0042725Ch
  '004F22F5: push esi
  '004F22F6: push eax
  '004F22F7: call edi
  '004F22F9: mov edx, [esi]
  '004F22FB: lea eax, [ebp-54h]
  '004F22FE: push eax
  '004F22FF: push esi
  '004F2300: call [edx+00000100h]
  '004F2306: test eax, eax
  '004F2308: fclex 
  '004F230A: jnl 4F231Ah
  '004F230C: push 00000100h
  '004F2311: push 0042725Ch
  '004F2316: push esi
  '004F2317: push eax
  '004F2318: call edi
  '004F231A: mov ecx, [esi]
  '004F231C: lea edx, [ebp-58h]
  '004F231F: push edx
  '004F2320: push esi
  '004F2321: call [ecx+00000108h]
  '004F2327: test eax, eax
  '004F2329: fclex 
  '004F232B: jnl 4F233Bh
  '004F232D: push 00000108h
  '004F2332: push 0042725Ch
  '004F2337: push esi
  '004F2338: push eax
  '004F2339: call edi
  '004F233B: mov edx, [esi+00000118h]
  '004F2341: mov eax, [ebp-50h]
  '004F2344: fld real4 ptr [ebp-58h]
  '004F2347: mov edi, [0040135Ch]
  '004F234D: mov ebx, [esi]
  '004F234F: lea ecx, [ebp-48h]
  '004F2352: mov byte ptr [ebp-48h], 00h
  '004F2356: push ecx
  '004F2357: push edx
  '004F2358: mov [ebp-5Ch], eax
  '004F235B: call edi
  '004F235D: fld real4 ptr [ebp-54h]
  '004F2360: push eax
  '004F2361: call edi
  '004F2363: push eax
  '004F2364: push 00000000h
  '004F2366: lea eax, [ebp-5Ch]
  '004F2369: push 00000000h
  '004F236B: push eax
  '004F236C: push esi
  '004F236D: call [ebx+00000924h]
  '004F2373: wait 
  '004F2374: push 004F2B83h
  '004F2379: jmp 004F2B82h
  '004F237E: cmp eax, 00000003h
  '004F2381: mov al, [esi+000000E9h]
  '004F2387: jnz 004F2435h
  '004F238D: cmp al, 01h
  '004F238F: jnz 4F23B2h
  '004F2391: mov edi, [00401208h]
  '004F2397: mov ebx, [esi]
  '004F2399: lea ecx, [ebp-48h]
  '004F239C: mov byte ptr [ebp-48h], 00h
  '004F23A0: push ecx
  '004F23A1: mov ecx, 00000002h
  '004F23A6: call edi
  '004F23A8: push eax
  '004F23A9: push esi
  '004F23AA: call [ebx+00000928h]
  '004F23B0: jmp 4F23B8h
  '004F23B2: mov edi, [00401208h]
  '004F23B8: mov al, [esi+000000EAh]
  '004F23BE: mov bl, [esi+000000E9h]
  '004F23C4: mov ecx, 00000001h
  '004F23C9: xor edx, edx
  '004F23CB: cmp al, cl
  '004F23CD: setnz dl
  '004F23D0: xor eax, eax
  '004F23D2: test bl, bl
  '004F23D4: setnz al
  '004F23D7: or edx, eax
  '004F23D9: jnz 4F23F2h
  '004F23DB: call edi
  '004F23DD: mov ebx, [esi]
  '004F23DF: lea ecx, [ebp-48h]
  '004F23E2: push ecx
  '004F23E3: xor ecx, ecx
  '004F23E5: mov [ebp-48h], al
  '004F23E8: call edi
  '004F23EA: push eax
  '004F23EB: push esi
  '004F23EC: call [ebx+00000928h]
  '004F23F2: mov al, [esi+000000EAh]
  '004F23F8: mov bl, [esi+000000E9h]
  '004F23FE: xor edx, edx
  '004F2400: test al, al
  '004F2402: setnz dl
  '004F2405: xor eax, eax
  '004F2407: test bl, bl
  '004F2409: setnz al
  '004F240C: or edx, eax
  '004F240E: jnz 004F2B5Dh
  '004F2414: mov ebx, [esi]
  '004F2416: lea ecx, [ebp-48h]
  '004F2419: push ecx
  '004F241A: xor ecx, ecx
  '004F241C: mov byte ptr [ebp-48h], 00h
  '004F2420: call edi
  '004F2422: push eax
  '004F2423: push esi
  '004F2424: call [ebx+00000928h]
  '004F242A: wait 
  '004F242B: push 004F2B83h
  '004F2430: jmp 004F2B82h
  '004F2435: cmp al, 01h
  '004F2437: jnz 004F261Eh
  '004F243D: cmp word ptr [esi+00000102h], 0002h
  '004F2445: lea ebx, [esi+00000102h]
  '004F244B: jnl 004F25A9h
  '004F2451: mov edx, [esi]
  '004F2453: lea eax, [ebp-50h]
  '004F2456: push eax
  '004F2457: push esi
  '004F2458: call [edx+000000D8h]
  '004F245E: test eax, eax
  '004F2460: fclex 
  '004F2462: jnl 4F2472h
  '004F2464: push 000000D8h
  '004F2469: push 0042725Ch
  '004F246E: push esi
  '004F246F: push eax
  '004F2470: call edi
  '004F2472: mov ecx, [esi]
  '004F2474: lea edx, [ebp-54h]
  '004F2477: push edx
  '004F2478: push esi
  '004F2479: call [ecx+00000100h]
  '004F247F: test eax, eax
  '004F2481: fclex 
  '004F2483: jnl 4F2493h
  '004F2485: push 00000100h
  '004F248A: push 0042725Ch
  '004F248F: push esi
  '004F2490: push eax
  '004F2491: call edi
  '004F2493: mov eax, [esi]
  '004F2495: lea ecx, [ebp-58h]
  '004F2498: push ecx
  '004F2499: push esi
  '004F249A: call [eax+00000108h]
  '004F24A0: test eax, eax
  '004F24A2: fclex 
  '004F24A4: jnl 4F24B4h
  '004F24A6: push 00000108h
  '004F24AB: push 0042725Ch
  '004F24B0: push esi
  '004F24B1: push eax
  '004F24B2: call edi
  '004F24B4: mov edx, [ebp-50h]
  '004F24B7: mov ebx, [esi]
  '004F24B9: fld real4 ptr [ebp-58h]
  '004F24BC: lea eax, [ebp-48h]
  '004F24BF: mov byte ptr [ebp-48h], 00h
  '004F24C3: push eax
  '004F24C4: push 80000014h
  '004F24C9: mov [ebp-5Ch], edx
  '004F24CC: call [0040135Ch]
  '004F24D2: fld real4 ptr [ebp-54h]
  '004F24D5: push eax
  '004F24D6: call [0040135Ch]
  '004F24DC: push eax
  '004F24DD: push 00000000h
  '004F24DF: lea ecx, [ebp-5Ch]
  '004F24E2: push 00000000h
  '004F24E4: push ecx
  '004F24E5: push esi
  '004F24E6: call [ebx+00000924h]
  '004F24EC: mov edx, [esi]
  '004F24EE: lea eax, [ebp-50h]
  '004F24F1: push eax
  '004F24F2: push esi
  '004F24F3: call [edx+000000D8h]
  '004F24F9: test eax, eax
  '004F24FB: fclex 
  '004F24FD: jnl 4F250Dh
  '004F24FF: push 000000D8h
  '004F2504: push 0042725Ch
  '004F2509: push esi
  '004F250A: push eax
  '004F250B: call edi
  '004F250D: mov ecx, [esi]
  '004F250F: lea edx, [ebp-54h]
  '004F2512: push edx
  '004F2513: push esi
  '004F2514: call [ecx+00000100h]
  '004F251A: test eax, eax
  '004F251C: fclex 
  '004F251E: jnl 4F252Eh
  '004F2520: push 00000100h
  '004F2525: push 0042725Ch
  '004F252A: push esi
  '004F252B: push eax
  '004F252C: call edi
  '004F252E: mov eax, [esi]
  '004F2530: lea ecx, [ebp-58h]
  '004F2533: push ecx
  '004F2534: push esi
  '004F2535: call [eax+00000108h]
  '004F253B: test eax, eax
  '004F253D: fclex 
  '004F253F: jnl 4F254Fh
  '004F2541: push 00000108h
  '004F2546: push 0042725Ch
  '004F254B: push esi
  '004F254C: push eax
  '004F254D: call edi
  '004F254F: fld real4 ptr [ebp-58h]
  '004F2552: fadd real4 ptr [004055F8h]
  '004F2558: mov edx, [ebp-50h]
  '004F255B: mov ebx, [esi]
  '004F255D: lea eax, [ebp-48h]
  '004F2560: mov byte ptr [ebp-48h], 00h
  '004F2564: push eax
  '004F2565: push 80000010h
  '004F256A: fstsw ax
  '004F256C: test al, 0Dh
  '004F256E: jnz 004F2B98h
  '004F2574: mov [ebp-5Ch], edx
  '004F2577: call [0040135Ch]
  '004F257D: fld real4 ptr [ebp-54h]
  '004F2580: fadd real4 ptr [004055F8h]
  '004F2586: push eax
  '004F2587: fstsw ax
  '004F2589: test al, 0Dh
  '004F258B: jnz 004F2B98h
  '004F2591: call [0040135Ch]
  '004F2597: push eax
  '004F2598: push 00000000h
  '004F259A: lea ecx, [ebp-5Ch]
  '004F259D: push 00000000h
  '004F259F: push ecx
  '004F25A0: push esi
  '004F25A1: call [ebx+00000924h]
  '004F25A7: jmp 4F261Eh
  '004F25A9: mov eax, [esi+10h]
  '004F25AC: lea ecx, [ebp-50h]
  '004F25AF: push ecx
  '004F25B0: push eax
  '004F25B1: mov edx, [eax]
  '004F25B3: call [edx+60h]
  '004F25B6: test eax, eax
  '004F25B8: fclex 
  '004F25BA: jnl 4F25CAh
  '004F25BC: mov edx, [esi+10h]
  '004F25BF: push 00000060h
  '004F25C1: push 0042725Ch
  '004F25C6: push edx
  '004F25C7: push eax
  '004F25C8: call edi
  '004F25CA: mov eax, [ebp-50h]
  '004F25CD: mov ecx, [esi]
  '004F25CF: mov [ebp-54h], eax
  '004F25D2: lea edx, [ebp-58h]
  '004F25D5: lea eax, [ebp-54h]
  '004F25D8: push edx
  '004F25D9: push eax
  '004F25DA: push esi
  '004F25DB: call [ecx+00000918h]
  '004F25E1: mov ecx, [esi]
  '004F25E3: lea edx, [ebp-48h]
  '004F25E6: push edx
  '004F25E7: push esi
  '004F25E8: call [ecx+00000888h]
  '004F25EE: test eax, eax
  '004F25F0: jnl 4F2600h
  '004F25F2: push 00000888h
  '004F25F7: push 0042728Ch
  '004F25FC: push esi
  '004F25FD: push eax
  '004F25FE: call edi
  '004F2600: mov eax, [ebp-48h]
  '004F2603: mov ecx, [ebp-58h]
  '004F2606: mov edx, [esi]
  '004F2608: mov [ebp-4Ch], eax
  '004F260B: lea eax, [ebp-4Ch]
  '004F260E: mov [ebp-5Ch], ecx
  '004F2611: push eax
  '004F2612: lea ecx, [ebp-5Ch]
  '004F2615: push ebx
  '004F2616: push ecx
  '004F2617: push esi
  '004F2618: call [edx+000008E0h]
  '004F261E: mov al, [esi+000000EAh]
  '004F2624: mov bl, [esi+000000E9h]
  '004F262A: xor edx, edx
  '004F262C: cmp al, 01h
  '004F262E: setnz dl
  '004F2631: xor eax, eax
  '004F2633: test bl, bl
  '004F2635: setnz al
  '004F2638: or edx, eax
  '004F263A: jnz 004F2821h
  '004F2640: cmp word ptr [esi+00000102h], 0002h
  '004F2648: lea ebx, [esi+00000102h]
  '004F264E: jnl 004F27ACh
  '004F2654: mov ecx, [esi]
  '004F2656: lea edx, [ebp-50h]
  '004F2659: push edx
  '004F265A: push esi
  '004F265B: call [ecx+000000D8h]
  '004F2661: test eax, eax
  '004F2663: fclex 
  '004F2665: jnl 4F2675h
  '004F2667: push 000000D8h
  '004F266C: push 0042725Ch
  '004F2671: push esi
  '004F2672: push eax
  '004F2673: call edi
  '004F2675: mov eax, [esi]
  '004F2677: lea ecx, [ebp-54h]
  '004F267A: push ecx
  '004F267B: push esi
  '004F267C: call [eax+00000100h]
  '004F2682: test eax, eax
  '004F2684: fclex 
  '004F2686: jnl 4F2696h
  '004F2688: push 00000100h
  '004F268D: push 0042725Ch
  '004F2692: push esi
  '004F2693: push eax
  '004F2694: call edi
  '004F2696: mov edx, [esi]
  '004F2698: lea eax, [ebp-58h]
  '004F269B: push eax
  '004F269C: push esi
  '004F269D: call [edx+00000108h]
  '004F26A3: test eax, eax
  '004F26A5: fclex 
  '004F26A7: jnl 4F26B7h
  '004F26A9: push 00000108h
  '004F26AE: push 0042725Ch
  '004F26B3: push esi
  '004F26B4: push eax
  '004F26B5: call edi
  '004F26B7: mov ecx, [ebp-50h]
  '004F26BA: mov ebx, [esi]
  '004F26BC: fld real4 ptr [ebp-58h]
  '004F26BF: lea edx, [ebp-48h]
  '004F26C2: mov byte ptr [ebp-48h], 00h
  '004F26C6: push edx
  '004F26C7: push 80000010h
  '004F26CC: mov [ebp-5Ch], ecx
  '004F26CF: call [0040135Ch]
  '004F26D5: fld real4 ptr [ebp-54h]
  '004F26D8: push eax
  '004F26D9: call [0040135Ch]
  '004F26DF: push eax
  '004F26E0: push 00000000h
  '004F26E2: lea eax, [ebp-5Ch]
  '004F26E5: push 00000000h
  '004F26E7: push eax
  '004F26E8: push esi
  '004F26E9: call [ebx+00000924h]
  '004F26EF: mov ecx, [esi]
  '004F26F1: lea edx, [ebp-50h]
  '004F26F4: push edx
  '004F26F5: push esi
  '004F26F6: call [ecx+000000D8h]
  '004F26FC: test eax, eax
  '004F26FE: fclex 
  '004F2700: jnl 4F2710h
  '004F2702: push 000000D8h
  '004F2707: push 0042725Ch
  '004F270C: push esi
  '004F270D: push eax
  '004F270E: call edi
  '004F2710: mov eax, [esi]
  '004F2712: lea ecx, [ebp-54h]
  '004F2715: push ecx
  '004F2716: push esi
  '004F2717: call [eax+00000100h]
  '004F271D: test eax, eax
  '004F271F: fclex 
  '004F2721: jnl 4F2731h
  '004F2723: push 00000100h
  '004F2728: push 0042725Ch
  '004F272D: push esi
  '004F272E: push eax
  '004F272F: call edi
  '004F2731: mov edx, [esi]
  '004F2733: lea eax, [ebp-58h]
  '004F2736: push eax
  '004F2737: push esi
  '004F2738: call [edx+00000108h]
  '004F273E: test eax, eax
  '004F2740: fclex 
  '004F2742: jnl 4F2752h
  '004F2744: push 00000108h
  '004F2749: push 0042725Ch
  '004F274E: push esi
  '004F274F: push eax
  '004F2750: call edi
  '004F2752: fld real4 ptr [ebp-58h]
  '004F2755: fadd real4 ptr [004055F8h]
  '004F275B: mov ecx, [ebp-50h]
  '004F275E: mov ebx, [esi]
  '004F2760: lea edx, [ebp-48h]
  '004F2763: mov byte ptr [ebp-48h], 00h
  '004F2767: push edx
  '004F2768: push 80000014h
  '004F276D: fstsw ax
  '004F276F: test al, 0Dh
  '004F2771: jnz 004F2B98h
  '004F2777: mov [ebp-5Ch], ecx
  '004F277A: call [0040135Ch]
  '004F2780: fld real4 ptr [ebp-54h]
  '004F2783: fadd real4 ptr [004055F8h]
  '004F2789: push eax
  '004F278A: fstsw ax
  '004F278C: test al, 0Dh
  '004F278E: jnz 004F2B98h
  '004F2794: call [0040135Ch]
  '004F279A: push eax
  '004F279B: push 00000000h
  '004F279D: lea eax, [ebp-5Ch]
  '004F27A0: push 00000000h
  '004F27A2: push eax
  '004F27A3: push esi
  '004F27A4: call [ebx+00000924h]
  '004F27AA: jmp 4F2821h
  '004F27AC: mov eax, [esi+10h]
  '004F27AF: lea edx, [ebp-50h]
  '004F27B2: push edx
  '004F27B3: push eax
  '004F27B4: mov ecx, [eax]
  '004F27B6: call [ecx+60h]
  '004F27B9: test eax, eax
  '004F27BB: fclex 
  '004F27BD: jnl 4F27CDh
  '004F27BF: mov ecx, [esi+10h]
  '004F27C2: push 00000060h
  '004F27C4: push 0042725Ch
  '004F27C9: push ecx
  '004F27CA: push eax
  '004F27CB: call edi
  '004F27CD: mov edx, [ebp-50h]
  '004F27D0: mov eax, [esi]
  '004F27D2: mov [ebp-54h], edx
  '004F27D5: lea ecx, [ebp-58h]
  '004F27D8: lea edx, [ebp-54h]
  '004F27DB: push ecx
  '004F27DC: push edx
  '004F27DD: push esi
  '004F27DE: call [eax+00000918h]
  '004F27E4: mov eax, [esi]
  '004F27E6: lea ecx, [ebp-48h]
  '004F27E9: push ecx
  '004F27EA: push esi
  '004F27EB: call [eax+00000888h]
  '004F27F1: test eax, eax
  '004F27F3: jnl 4F2803h
  '004F27F5: push 00000888h
  '004F27FA: push 0042728Ch
  '004F27FF: push esi
  '004F2800: push eax
  '004F2801: call edi
  '004F2803: mov edx, [ebp-48h]
  '004F2806: mov eax, [ebp-58h]
  '004F2809: mov ecx, [esi]
  '004F280B: mov [ebp-4Ch], edx
  '004F280E: lea edx, [ebp-4Ch]
  '004F2811: mov [ebp-5Ch], eax
  '004F2814: push edx
  '004F2815: lea eax, [ebp-5Ch]
  '004F2818: push ebx
  '004F2819: push eax
  '004F281A: push esi
  '004F281B: call [ecx+000008DCh]
  '004F2821: mov al, [esi+000000EAh]
  '004F2827: mov bl, [esi+000000E9h]
  '004F282D: xor ecx, ecx
  '004F282F: test al, al
  '004F2831: setnz cl
  '004F2834: xor edx, edx
  '004F2836: test bl, bl
  '004F2838: setnz dl
  '004F283B: or ecx, edx
  '004F283D: jnz 004F2A32h
  '004F2843: mov eax, [esi+000000C0h]
  '004F2849: test eax, eax
  '004F284B: jnz 004F2A32h
  '004F2851: cmp word ptr [esi+00000102h], 0002h
  '004F2859: lea ebx, [esi+00000102h]
  '004F285F: jnl 004F29BDh
  '004F2865: mov eax, [esi]
  '004F2867: lea ecx, [ebp-50h]
  '004F286A: push ecx
  '004F286B: push esi
  '004F286C: call [eax+000000D8h]
  '004F2872: test eax, eax
  '004F2874: fclex 
  '004F2876: jnl 4F2886h
  '004F2878: push 000000D8h
  '004F287D: push 0042725Ch
  '004F2882: push esi
  '004F2883: push eax
  '004F2884: call edi
  '004F2886: mov edx, [esi]
  '004F2888: lea eax, [ebp-54h]
  '004F288B: push eax
  '004F288C: push esi
  '004F288D: call [edx+00000100h]
  '004F2893: test eax, eax
  '004F2895: fclex 
  '004F2897: jnl 4F28A7h
  '004F2899: push 00000100h
  '004F289E: push 0042725Ch
  '004F28A3: push esi
  '004F28A4: push eax
  '004F28A5: call edi
  '004F28A7: mov ecx, [esi]
  '004F28A9: lea edx, [ebp-58h]
  '004F28AC: push edx
  '004F28AD: push esi
  '004F28AE: call [ecx+00000108h]
  '004F28B4: test eax, eax
  '004F28B6: fclex 
  '004F28B8: jnl 4F28C8h
  '004F28BA: push 00000108h
  '004F28BF: push 0042725Ch
  '004F28C4: push esi
  '004F28C5: push eax
  '004F28C6: call edi
  '004F28C8: mov eax, [ebp-50h]
  '004F28CB: mov ebx, [esi]
  '004F28CD: fld real4 ptr [ebp-58h]
  '004F28D0: lea ecx, [ebp-48h]
  '004F28D3: mov byte ptr [ebp-48h], 00h
  '004F28D7: push ecx
  '004F28D8: push 80000010h
  '004F28DD: mov [ebp-5Ch], eax
  '004F28E0: call [0040135Ch]
  '004F28E6: fld real4 ptr [ebp-54h]
  '004F28E9: push eax
  '004F28EA: call [0040135Ch]
  '004F28F0: push eax
  '004F28F1: push 00000000h
  '004F28F3: lea edx, [ebp-5Ch]
  '004F28F6: push 00000000h
  '004F28F8: push edx
  '004F28F9: push esi
  '004F28FA: call [ebx+00000924h]
  '004F2900: mov eax, [esi]
  '004F2902: lea ecx, [ebp-50h]
  '004F2905: push ecx
  '004F2906: push esi
  '004F2907: call [eax+000000D8h]
  '004F290D: test eax, eax
  '004F290F: fclex 
  '004F2911: jnl 4F2921h
  '004F2913: push 000000D8h
  '004F2918: push 0042725Ch
  '004F291D: push esi
  '004F291E: push eax
  '004F291F: call edi
  '004F2921: mov edx, [esi]
  '004F2923: lea eax, [ebp-54h]
  '004F2926: push eax
  '004F2927: push esi
  '004F2928: call [edx+00000100h]
  '004F292E: test eax, eax
  '004F2930: fclex 
  '004F2932: jnl 4F2942h
  '004F2934: push 00000100h
  '004F2939: push 0042725Ch
  '004F293E: push esi
  '004F293F: push eax
  '004F2940: call edi
  '004F2942: mov ecx, [esi]
  '004F2944: lea edx, [ebp-58h]
  '004F2947: push edx
  '004F2948: push esi
  '004F2949: call [ecx+00000108h]
  '004F294F: test eax, eax
  '004F2951: fclex 
  '004F2953: jnl 4F2963h
  '004F2955: push 00000108h
  '004F295A: push 0042725Ch
  '004F295F: push esi
  '004F2960: push eax
  '004F2961: call edi
  '004F2963: fld real4 ptr [ebp-58h]
  '004F2966: fadd real4 ptr [004055F8h]
  '004F296C: mov eax, [ebp-50h]
  '004F296F: mov ebx, [esi]
  '004F2971: lea ecx, [ebp-48h]
  '004F2974: mov [ebp-5Ch], eax
  '004F2977: push ecx
  '004F2978: push 80000014h
  '004F297D: fstsw ax
  '004F297F: test al, 0Dh
  '004F2981: jnz 004F2B98h
  '004F2987: mov byte ptr [ebp-48h], 00h
  '004F298B: call [0040135Ch]
  '004F2991: fld real4 ptr [ebp-54h]
  '004F2994: fadd real4 ptr [004055F8h]
  '004F299A: push eax
  '004F299B: fstsw ax
  '004F299D: test al, 0Dh
  '004F299F: jnz 004F2B98h
  '004F29A5: call [0040135Ch]
  '004F29AB: push eax
  '004F29AC: push 00000000h
  '004F29AE: lea edx, [ebp-5Ch]
  '004F29B1: push 00000000h
  '004F29B3: push edx
  '004F29B4: push esi
  '004F29B5: call [ebx+00000924h]
  '004F29BB: jmp 4F2A32h
  '004F29BD: mov eax, [esi+10h]
  '004F29C0: lea edx, [ebp-50h]
  '004F29C3: push edx
  '004F29C4: push eax
  '004F29C5: mov ecx, [eax]
  '004F29C7: call [ecx+60h]
  '004F29CA: test eax, eax
  '004F29CC: fclex 
  '004F29CE: jnl 4F29DEh
  '004F29D0: mov ecx, [esi+10h]
  '004F29D3: push 00000060h
  '004F29D5: push 0042725Ch
  '004F29DA: push ecx
  '004F29DB: push eax
  '004F29DC: call edi
  '004F29DE: mov edx, [ebp-50h]
  '004F29E1: mov eax, [esi]
  '004F29E3: mov [ebp-54h], edx
  '004F29E6: lea ecx, [ebp-58h]
  '004F29E9: lea edx, [ebp-54h]
  '004F29EC: push ecx
  '004F29ED: push edx
  '004F29EE: push esi
  '004F29EF: call [eax+00000918h]
  '004F29F5: mov eax, [esi]
  '004F29F7: lea ecx, [ebp-48h]
  '004F29FA: push ecx
  '004F29FB: push esi
  '004F29FC: call [eax+00000888h]
  '004F2A02: test eax, eax
  '004F2A04: jnl 4F2A14h
  '004F2A06: push 00000888h
  '004F2A0B: push 0042728Ch
  '004F2A10: push esi
  '004F2A11: push eax
  '004F2A12: call edi
  '004F2A14: mov edx, [ebp-48h]
  '004F2A17: mov eax, [ebp-58h]
  '004F2A1A: mov ecx, [esi]
  '004F2A1C: mov [ebp-4Ch], edx
  '004F2A1F: lea edx, [ebp-4Ch]
  '004F2A22: mov [ebp-5Ch], eax
  '004F2A25: push edx
  '004F2A26: lea eax, [ebp-5Ch]
  '004F2A29: push ebx
  '004F2A2A: push eax
  '004F2A2B: push esi
  '004F2A2C: call [ecx+000008DCh]
  '004F2A32: mov dl, [esi+000000E8h]
  '004F2A38: mov ebx, [esi+000000C0h]
  '004F2A3E: xor ecx, ecx
  '004F2A40: cmp dl, 01h
  '004F2A43: setz cl
  '004F2A46: neg ecx
  '004F2A48: xor edx, edx
  '004F2A4A: mov [ebp-44h], 0000000Bh
  '004F2A51: test ebx, ebx
  '004F2A53: setz dl
  '004F2A56: neg edx
  '004F2A58: and ecx, edx
  '004F2A5A: mov dl, [esi+000000E9h]
  '004F2A60: xor eax, eax
  '004F2A62: test dl, dl
  '004F2A64: setz al
  '004F2A67: neg eax
  '004F2A69: and ecx, eax
  '004F2A6B: lea edx, [ebp-14h]
  '004F2A6E: mov [ebp-3Ch], cx
  '004F2A72: mov ecx, [esi]
  '004F2A74: push edx
  '004F2A75: push esi
  '004F2A76: call [ecx+000002C0h]
  '004F2A7C: test eax, eax
  '004F2A7E: fclex 
  '004F2A80: jnl 4F2A90h
  '004F2A82: push 000002C0h
  '004F2A87: push 0042725Ch
  '004F2A8C: push esi
  '004F2A8D: push eax
  '004F2A8E: call edi
  '004F2A90: mov ecx, [ebp-14h]
  '004F2A93: lea eax, [ebp-44h]
  '004F2A96: push eax
  '004F2A97: push 00000000h
  '004F2A99: push 00427F98h
  '004F2A9E: lea edx, [ebp-24h]
  '004F2AA1: push ecx
  '004F2AA2: push edx
  '004F2AA3: call [00401368h]
  '004F2AA9: add esp, 00000010h
  '004F2AAC: push eax
  '004F2AAD: lea eax, [ebp-34h]
  '004F2AB0: push eax
  '004F2AB1: call [004011B8h]
  '004F2AB7: push eax
  '004F2AB8: call [0040112Ch]
  '004F2ABE: lea ecx, [ebp-14h]
  '004F2AC1: mov bx, ax
  '004F2AC4: call [004013B8h]
  '004F2ACA: lea ecx, [ebp-24h]
  '004F2ACD: lea edx, [ebp-44h]
  '004F2AD0: push ecx
  '004F2AD1: push edx
  '004F2AD2: push 00000002h
  '004F2AD4: call [00401050h]
  '004F2ADA: add esp, 0000000Ch
  '004F2ADD: test bx, bx
  '004F2AE0: jz 4F2B5Dh
  '004F2AE2: mov eax, [esi+10h]
  '004F2AE5: lea edx, [ebp-50h]
  '004F2AE8: push edx
  '004F2AE9: push eax
  '004F2AEA: mov ecx, [eax]
  '004F2AEC: call [ecx+60h]
  '004F2AEF: test eax, eax
  '004F2AF1: fclex 
  '004F2AF3: jnl 4F2B03h
  '004F2AF5: mov ecx, [esi+10h]
  '004F2AF8: push 00000060h
  '004F2AFA: push 0042725Ch
  '004F2AFF: push ecx
  '004F2B00: push eax
  '004F2B01: call edi
  '004F2B03: mov edx, [ebp-50h]
  '004F2B06: mov eax, [esi]
  '004F2B08: mov [ebp-54h], edx
  '004F2B0B: lea ecx, [ebp-58h]
  '004F2B0E: lea edx, [ebp-54h]
  '004F2B11: push ecx
  '004F2B12: push edx
  '004F2B13: push esi
  '004F2B14: call [eax+00000918h]
  '004F2B1A: mov eax, [esi]
  '004F2B1C: lea ecx, [ebp-48h]
  '004F2B1F: push ecx
  '004F2B20: push esi
  '004F2B21: call [eax+00000888h]
  '004F2B27: test eax, eax
  '004F2B29: jnl 4F2B39h
  '004F2B2B: push 00000888h
  '004F2B30: push 0042728Ch
  '004F2B35: push esi
  '004F2B36: push eax
  '004F2B37: call edi
  '004F2B39: mov edx, [ebp-48h]
  '004F2B3C: mov eax, [ebp-58h]
  '004F2B3F: mov ecx, [esi]
  '004F2B41: mov [ebp-4Ch], edx
  '004F2B44: lea edx, [ebp-4Ch]
  '004F2B47: mov [ebp-5Ch], eax
  '004F2B4A: push edx
  '004F2B4B: lea eax, [esi+00000102h]
  '004F2B51: lea edx, [ebp-5Ch]
  '004F2B54: push eax
  '004F2B55: push edx
  '004F2B56: push esi
  '004F2B57: call [ecx+000008E4h]
  '004F2B5D: wait 
  '004F2B5E: push 004F2B83h
  '004F2B63: jmp 4F2B82h
  '004F2B65: lea ecx, [ebp-14h]
  '004F2B68: call [004013B8h]
  '004F2B6E: lea eax, [ebp-34h]
  '004F2B71: lea ecx, [ebp-24h]
  '004F2B74: push eax
  '004F2B75: push ecx
  '004F2B76: push 00000002h
  '004F2B78: call [00401050h]
  '004F2B7E: add esp, 0000000Ch
  '004F2B81: ret 
End Sub
Private Sub PictureHeight_4F2F30
  '004F2F30: push ebp
  '004F2F31: mov ebp, esp
  '004F2F33: sub esp, 00000008h
  '004F2F36: push 004081B6h
  '004F2F3B: mov eax, fs:[00h]
  '004F2F41: push eax
  '004F2F42: mov fs:[00000000h], esp
  '004F2F49: sub esp, 0000002Ch
  '004F2F4C: push ebx
  '004F2F4D: push esi
  '004F2F4E: push edi
  '004F2F4F: mov [ebp-08h], esp
  '004F2F52: mov [ebp-04h], 00405780h
  '004F2F59: mov edx, [ebp+10h]
  '004F2F5C: xor edi, edi
  '004F2F5E: lea ecx, [ebp-14h]
  '004F2F61: mov [ebp-14h], edi
  '004F2F64: mov [ebp-1Ch], edi
  '004F2F67: mov [ebp-20h], edi
  '004F2F6A: mov [ebp-24h], edi
  '004F2F6D: mov [ebp-28h], edi
  '004F2F70: mov [ebp-2Ch], edi
  '004F2F73: call [004012D8h]
  '004F2F79: mov eax, [ebp+0Ch]
  '004F2F7C: lea edx, [ebp-2Ch]
  '004F2F7F: push edx
  '004F2F80: mov esi, [eax]
  '004F2F82: push esi
  '004F2F83: mov ecx, [esi]
  '004F2F85: call [ecx+58h]
  '004F2F88: cmp eax, edi
  '004F2F8A: fclex 
  '004F2F8C: jnl 4F2F9Dh
  '004F2F8E: push 00000058h
  '004F2F90: push 0041E3ECh
  '004F2F95: push esi
  '004F2F96: push eax
  '004F2F97: call [004010A0h]
  '004F2F9D: mov esi, [00401330h]
  '004F2FA3: push 00000001h
  '004F2FA5: lea eax, [ebp-28h]
  '004F2FA8: push 0041BC60h
  '004F2FAD: push eax
  '004F2FAE: call esi
  '004F2FB0: push eax
  '004F2FB1: lea ecx, [ebp-24h]
  '004F2FB4: push 0041BC60h
  '004F2FB9: push ecx
  '004F2FBA: call esi
  '004F2FBC: mov edx, [ebp-14h]
  '004F2FBF: push eax
  '004F2FC0: lea eax, [ebp-20h]
  '004F2FC3: push edx
  '004F2FC4: push eax
  '004F2FC5: call esi
  '004F2FC7: push eax
  '004F2FC8: lea ecx, [ebp-1Ch]
  '004F2FCB: push 0041FD78h
  '004F2FD0: push ecx
  '004F2FD1: call esi
  '004F2FD3: mov edx, [ebp-2Ch]
  '004F2FD6: push eax
  '004F2FD7: push edx
  '004F2FD8: call 0041DC2Ch
  '004F2FDD: call [0040109Ch]
  '004F2FE3: mov eax, [ebp-20h]
  '004F2FE6: lea ecx, [ebp-14h]
  '004F2FE9: push eax
  '004F2FEA: push ecx
  '004F2FEB: call [00401238h]
  '004F2FF1: lea edx, [ebp-28h]
  '004F2FF4: lea eax, [ebp-24h]
  '004F2FF7: push edx
  '004F2FF8: lea ecx, [ebp-20h]
  '004F2FFB: push eax
  '004F2FFC: lea edx, [ebp-1Ch]
  '004F2FFF: push ecx
  '004F3000: push edx
  '004F3001: push 00000004h
  '004F3003: call [004012E8h]
  '004F3009: add esp, 00000014h
  '004F300C: push 004F3039h
  '004F3011: jmp 4F302Fh
  '004F3013: lea eax, [ebp-28h]
  '004F3016: lea ecx, [ebp-24h]
  '004F3019: push eax
  '004F301A: lea edx, [ebp-20h]
  '004F301D: push ecx
  '004F301E: lea eax, [ebp-1Ch]
  '004F3021: push edx
  '004F3022: push eax
  '004F3023: push 00000004h
  '004F3025: call [004012E8h]
  '004F302B: add esp, 00000014h
  '004F302E: ret 
End Sub
Private Sub PictureHeight_4F3F30
  '004F3F30: push ebp
  '004F3F31: mov ebp, esp
  '004F3F33: sub esp, 00000008h
  '004F3F36: push 004081B6h
  '004F3F3B: mov eax, fs:[00h]
  '004F3F41: push eax
  '004F3F42: mov fs:[00000000h], esp
  '004F3F49: sub esp, 00000050h
  '004F3F4C: push ebx
  '004F3F4D: push esi
  '004F3F4E: push edi
  '004F3F4F: mov [ebp-08h], esp
  '004F3F52: mov [ebp-04h], 00405840h
  '004F3F59: mov esi, [ebp+08h]
  '004F3F5C: mov eax, 00000001h
  '004F3F61: lea ecx, [ebp-50h]
  '004F3F64: xor edi, edi
  '004F3F66: mov [esi+000000DCh], eax
  '004F3F6C: mov [esi+000000E0h], eax
  '004F3F72: mov [esi+000000D8h], eax
  '004F3F78: mov [esi+000000D4h], 00000014h
  '004F3F82: mov eax, [esi]
  '004F3F84: push ecx
  '004F3F85: push esi
  '004F3F86: mov [ebp-20h], edi
  '004F3F89: mov [ebp-2Ch], edi
  '004F3F8C: mov [ebp-3Ch], edi
  '004F3F8F: mov [ebp-4Ch], edi
  '004F3F92: mov [ebp-50h], edi
  '004F3F95: call [eax+000000D8h]
  '004F3F9B: cmp eax, edi
  '004F3F9D: fclex 
  '004F3F9F: jnl 4F3FB3h
  '004F3FA1: push 000000D8h
  '004F3FA6: push 0042725Ch
  '004F3FAB: push esi
  '004F3FAC: push eax
  '004F3FAD: call [004010A0h]
  '004F3FB3: mov edx, [esi+000000B8h]
  '004F3FB9: lea ebx, [esi+000000B8h]
  '004F3FBF: lea eax, [esi+000000D4h]
  '004F3FC5: lea edi, [esi+68h]
  '004F3FC8: push eax
  '004F3FC9: push 00000415h
  '004F3FCE: push edi
  '004F3FCF: push edx
  '004F3FD0: call [00401044h]
  '004F3FD6: push eax
  '004F3FD7: mov eax, [ebx]
  '004F3FD9: lea ecx, [ebp-2Ch]
  '004F3FDC: push eax
  '004F3FDD: push ecx
  '004F3FDE: call [00401330h]
  '004F3FE4: mov edx, [ebp-50h]
  '004F3FE7: push eax
  '004F3FE8: push edx
  '004F3FE9: call 004279C8h
  '004F3FEE: call [0040109Ch]
  '004F3FF4: mov eax, [ebp-2Ch]
  '004F3FF7: push eax
  '004F3FF8: push ebx
  '004F3FF9: call [00401238h]
  '004F3FFF: lea ecx, [ebp-2Ch]
  '004F4002: call [004013B4h]
  '004F4008: mov ecx, [esi+70h]
  '004F400B: mov edx, [edi]
  '004F400D: sub ecx, edx
  '004F400F: lea edx, [ebp-4Ch]
  '004F4012: jo 004F4103h
  '004F4018: mov [ebp-44h], ecx
  '004F401B: lea ecx, [ebp-20h]
  '004F401E: mov [ebp-4Ch], 00000003h
  '004F4025: call [00401020h]
  '004F402B: mov ebx, [esi+74h]
  '004F402E: mov eax, [esi+6Ch]
  '004F4031: mov ecx, [esi+48h]
  '004F4034: mov edx, [esi+70h]
  '004F4037: sub ebx, eax
  '004F4039: mov eax, [esi+50h]
  '004F403C: jo 004F4103h
  '004F4042: sub eax, ecx
  '004F4044: mov [ebp-4Ch], 00000003h
  '004F404B: jo 004F4103h
  '004F4051: sub edx, [edi]
  '004F4053: jo 004F4103h
  '004F4059: sub eax, edx
  '004F405B: jo 004F4103h
  '004F4061: cdq 
  '004F4062: sub eax, edx
  '004F4064: sar eax, 01h
  '004F4066: add eax, ecx
  '004F4068: jo 004F4103h
  '004F406E: mov [edi], eax
  '004F4070: mov ecx, [esi+4Ch]
  '004F4073: mov eax, [esi+54h]
  '004F4076: mov edx, [esi+74h]
  '004F4079: sub eax, ecx
  '004F407B: jo 004F4103h
  '004F4081: sub edx, [esi+6Ch]
  '004F4084: jo 4F4103h
  '004F4086: sub eax, edx
  '004F4088: jo 4F4103h
  '004F408A: cdq 
  '004F408B: sub eax, edx
  '004F408D: lea edx, [ebp-20h]
  '004F4090: sar eax, 01h
  '004F4092: add eax, ecx
  '004F4094: lea ecx, [ebp-4Ch]
  '004F4097: jo 4F4103h
  '004F4099: mov [edi+04h], eax
  '004F409C: mov eax, [edi]
  '004F409E: mov [ebp-44h], eax
  '004F40A1: push ecx
  '004F40A2: lea eax, [ebp-3Ch]
  '004F40A5: push edx
  '004F40A6: push eax
  '004F40A7: call [00401328h]
  '004F40AD: push eax
  '004F40AE: call [0040130Ch]
  '004F40B4: lea ecx, [ebp-3Ch]
  '004F40B7: mov [edi+08h], eax
  '004F40BA: call [00401030h]
  '004F40C0: mov ecx, [esi+6Ch]
  '004F40C3: push 004F40EEh
  '004F40C8: add ecx, ebx
  '004F40CA: jo 4F4103h
  '004F40CC: mov [edi+0Ch], ecx
  '004F40CF: jmp 4F40E4h
  '004F40D1: lea ecx, [ebp-2Ch]
  '004F40D4: call [004013B4h]
  '004F40DA: lea ecx, [ebp-3Ch]
  '004F40DD: call [00401030h]
  '004F40E3: ret 
End Sub
Private Sub PictureSize_4F4110
  '004F4110: push ebp
  '004F4111: mov ebp, esp
  '004F4113: sub esp, 00000008h
  '004F4116: push 004081B6h
  '004F411B: mov eax, fs:[00h]
  '004F4121: push eax
  '004F4122: mov fs:[00000000h], esp
  '004F4129: sub esp, 00000040h
  '004F412C: push ebx
  '004F412D: push esi
  '004F412E: push edi
  '004F412F: mov [ebp-08h], esp
  '004F4132: mov [ebp-04h], 00405850h
  '004F4139: mov esi, [ebp+08h]
  '004F413C: xor eax, eax
  '004F413E: mov [ebp-20h], eax
  '004F4141: xor ebx, ebx
  '004F4143: mov ecx, [esi+000000B8h]
  '004F4149: lea edi, [esi+000000B8h]
  '004F414F: mov [ebp-1Ch], eax
  '004F4152: push ecx
  '004F4153: mov [ebp-18h], eax
  '004F4156: push 0041BC60h
  '004F415B: mov [ebp-14h], eax
  '004F415E: mov [ebp-24h], ebx
  '004F4161: mov [ebp-2Ch], ebx
  '004F4164: mov [ebp-30h], ebx
  '004F4167: mov [ebp-34h], ebx
  '004F416A: mov [ebp-38h], ebx
  '004F416D: mov [ebp-3Ch], ebx
  '004F4170: call [00401184h]
  '004F4176: test eax, eax
  '004F4178: jz 004F44F3h
  '004F417E: mov edx, [esi]
  '004F4180: lea eax, [ebp-34h]
  '004F4183: push eax
  '004F4184: push esi
  '004F4185: call [edx+000000D8h]
  '004F418B: cmp eax, ebx
  '004F418D: fclex 
  '004F418F: jnl 4F41A3h
  '004F4191: push 000000D8h
  '004F4196: push 0042725Ch
  '004F419B: push esi
  '004F419C: push eax
  '004F419D: call [004010A0h]
  '004F41A3: mov ecx, [esi]
  '004F41A5: lea edx, [ebp-38h]
  '004F41A8: lea eax, [esi+00000118h]
  '004F41AE: push edx
  '004F41AF: push eax
  '004F41B0: push esi
  '004F41B1: call [ecx+00000918h]
  '004F41B7: mov ecx, [ebp-38h]
  '004F41BA: mov edx, [ebp-34h]
  '004F41BD: push ecx
  '004F41BE: push edx
  '004F41BF: call 004276F0h
  '004F41C4: call [0040109Ch]
  '004F41CA: lea ebx, [esi+68h]
  '004F41CD: lea eax, [esi+78h]
  '004F41D0: push ebx
  '004F41D1: push eax
  '004F41D2: push 00000010h
  '004F41D4: mov [ebp-50h], eax
  '004F41D7: call [00401084h]
  '004F41DD: cmp byte ptr [esi+000000E9h], 01h
  '004F41E4: jnz 4F4229h
  '004F41E6: cmp [esi+000000C0h], 00000002h
  '004F41ED: jz 4F4229h
  '004F41EF: mov eax, [ebx]
  '004F41F1: add eax, 00000001h
  '004F41F4: jo 004F451Ah
  '004F41FA: mov [ebx], eax
  '004F41FC: mov ecx, [esi+6Ch]
  '004F41FF: add ecx, 00000001h
  '004F4202: jo 004F451Ah
  '004F4208: mov [ebx+04h], ecx
  '004F420B: mov edx, [esi+70h]
  '004F420E: add edx, 00000001h
  '004F4211: jo 004F451Ah
  '004F4217: mov [ebx+08h], edx
  '004F421A: mov eax, [esi+74h]
  '004F421D: add eax, 00000001h
  '004F4220: jo 004F451Ah
  '004F4226: mov [ebx+0Ch], eax
  '004F4229: mov ecx, [esi]
  '004F422B: lea edx, [ebp-30h]
  '004F422E: push edx
  '004F422F: push esi
  '004F4230: call [ecx+000007A8h]
  '004F4236: test eax, eax
  '004F4238: jnl 4F424Ch
  '004F423A: push 000007A8h
  '004F423F: push 0042728Ch
  '004F4244: push esi
  '004F4245: push eax
  '004F4246: call [004010A0h]
  '004F424C: cmp word ptr [ebp-30h], 0000h
  '004F4251: jnz 004F447Ch
  '004F4257: mov eax, [esi+10h]
  '004F425A: lea edx, [ebp-34h]
  '004F425D: push edx
  '004F425E: push eax
  '004F425F: mov ecx, [eax]
  '004F4261: call [ecx+68h]
  '004F4264: test eax, eax
  '004F4266: fclex 
  '004F4268: jnl 4F427Ch
  '004F426A: mov ecx, [esi+10h]
  '004F426D: push 00000068h
  '004F426F: push 0042725Ch
  '004F4274: push ecx
  '004F4275: push eax
  '004F4276: call [004010A0h]
  '004F427C: mov edx, [ebp-34h]
  '004F427F: mov eax, [esi]
  '004F4281: lea ecx, [ebp-34h]
  '004F4284: mov [ebp-24h], edx
  '004F4287: push ecx
  '004F4288: push esi
  '004F4289: call [eax+000000D8h]
  '004F428F: test eax, eax
  '004F4291: fclex 
  '004F4293: jnl 4F42A7h
  '004F4295: push 000000D8h
  '004F429A: push 0042725Ch
  '004F429F: push esi
  '004F42A0: push eax
  '004F42A1: call [004010A0h]
  '004F42A7: mov edx, [esi]
  '004F42A9: lea eax, [ebp-3Ch]
  '004F42AC: lea ecx, [ebp-38h]
  '004F42AF: push eax
  '004F42B0: push ecx
  '004F42B1: push esi
  '004F42B2: mov [ebp-38h], 80000014h
  '004F42B9: call [edx+00000918h]
  '004F42BF: mov edx, [ebp-3Ch]
  '004F42C2: mov eax, [ebp-34h]
  '004F42C5: push edx
  '004F42C6: push eax
  '004F42C7: call 004276F0h
  '004F42CC: call [0040109Ch]
  '004F42D2: mov edx, [ebx]
  '004F42D4: mov eax, [esi+70h]
  '004F42D7: mov ecx, [esi+74h]
  '004F42DA: add edx, 00000001h
  '004F42DD: jo 004F451Ah
  '004F42E3: add eax, 00000001h
  '004F42E6: mov [ebp-14h], ecx
  '004F42E9: mov ecx, [esi+6Ch]
  '004F42EC: mov [ebp-20h], edx
  '004F42EF: mov edx, [esi]
  '004F42F1: jo 004F451Ah
  '004F42F7: mov [ebp-18h], eax
  '004F42FA: lea eax, [ebp-34h]
  '004F42FD: add ecx, 00000001h
  '004F4300: push eax
  '004F4301: jo 004F451Ah
  '004F4307: push esi
  '004F4308: mov [ebp-1Ch], ecx
  '004F430B: call [edx+000000D8h]
  '004F4311: test eax, eax
  '004F4313: fclex 
  '004F4315: jnl 4F4329h
  '004F4317: push 000000D8h
  '004F431C: push 0042725Ch
  '004F4321: push esi
  '004F4322: push eax
  '004F4323: call [004010A0h]
  '004F4329: mov edx, [edi]
  '004F432B: lea eax, [esi+000000D4h]
  '004F4331: push eax
  '004F4332: lea ecx, [ebp-20h]
  '004F4335: push 00000015h
  '004F4337: push ecx
  '004F4338: push edx
  '004F4339: call [00401044h]
  '004F433F: push eax
  '004F4340: mov eax, [edi]
  '004F4342: lea ecx, [ebp-2Ch]
  '004F4345: push eax
  '004F4346: push ecx
  '004F4347: call [00401330h]
  '004F434D: mov edx, [ebp-34h]
  '004F4350: push eax
  '004F4351: push edx
  '004F4352: call 004279C8h
  '004F4357: call [0040109Ch]
  '004F435D: mov eax, [ebp-2Ch]
  '004F4360: push eax
  '004F4361: push edi
  '004F4362: call [00401238h]
  '004F4368: lea ecx, [ebp-2Ch]
  '004F436B: call [004013B4h]
  '004F4371: mov ecx, [esi]
  '004F4373: lea edx, [ebp-34h]
  '004F4376: push edx
  '004F4377: push esi
  '004F4378: call [ecx+000000D8h]
  '004F437E: test eax, eax
  '004F4380: fclex 
  '004F4382: jnl 4F4396h
  '004F4384: push 000000D8h
  '004F4389: push 0042725Ch
  '004F438E: push esi
  '004F438F: push eax
  '004F4390: call [004010A0h]
  '004F4396: mov eax, [esi]
  '004F4398: lea ecx, [ebp-3Ch]
  '004F439B: lea edx, [ebp-38h]
  '004F439E: push ecx
  '004F439F: push edx
  '004F43A0: push esi
  '004F43A1: mov [ebp-38h], 80000010h
  '004F43A8: call [eax+00000918h]
  '004F43AE: mov eax, [ebp-3Ch]
  '004F43B1: mov ecx, [ebp-34h]
  '004F43B4: push eax
  '004F43B5: push ecx
  '004F43B6: call 004276F0h
  '004F43BB: call [0040109Ch]
  '004F43C1: mov edx, [esi]
  '004F43C3: lea eax, [ebp-34h]
  '004F43C6: push eax
  '004F43C7: push esi
  '004F43C8: call [edx+000000D8h]
  '004F43CE: test eax, eax
  '004F43D0: fclex 
  '004F43D2: jnl 4F43E6h
  '004F43D4: push 000000D8h
  '004F43D9: push 0042725Ch
  '004F43DE: push esi
  '004F43DF: push eax
  '004F43E0: call [004010A0h]
  '004F43E6: mov ecx, [edi]
  '004F43E8: lea eax, [esi+000000D4h]
  '004F43EE: push eax
  '004F43EF: push 00000015h
  '004F43F1: push ebx
  '004F43F2: push ecx
  '004F43F3: call [00401044h]
  '004F43F9: mov edx, [edi]
  '004F43FB: push eax
  '004F43FC: lea eax, [ebp-2Ch]
  '004F43FF: push edx
  '004F4400: push eax
  '004F4401: call [00401330h]
  '004F4407: mov ecx, [ebp-34h]
  '004F440A: push eax
  '004F440B: push ecx
  '004F440C: call 004279C8h
  '004F4411: mov ebx, [0040109Ch]
  '004F4417: call ebx
  '004F4419: mov edx, [ebp-2Ch]
  '004F441C: push edx
  '004F441D: push edi
  '004F441E: call [00401238h]
  '004F4424: lea ecx, [ebp-2Ch]
  '004F4427: call [004013B4h]
  '004F442D: mov eax, [esi]
  '004F442F: lea ecx, [ebp-34h]
  '004F4432: push ecx
  '004F4433: push esi
  '004F4434: call [eax+000000D8h]
  '004F443A: test eax, eax
  '004F443C: fclex 
  '004F443E: jnl 4F4452h
  '004F4440: push 000000D8h
  '004F4445: push 0042725Ch
  '004F444A: push esi
  '004F444B: push eax
  '004F444C: call [004010A0h]
  '004F4452: mov edx, [esi]
  '004F4454: lea eax, [ebp-38h]
  '004F4457: lea ecx, [ebp-24h]
  '004F445A: push eax
  '004F445B: push ecx
  '004F445C: push esi
  '004F445D: call [edx+00000918h]
  '004F4463: mov edx, [ebp-38h]
  '004F4466: mov eax, [ebp-34h]
  '004F4469: push edx
  '004F446A: push eax
  '004F446B: call 004276F0h
  '004F4470: call ebx
  '004F4472: push 004F4505h
  '004F4477: jmp 004F4504h
  '004F447C: mov ecx, [esi]
  '004F447E: lea edx, [ebp-34h]
  '004F4481: push edx
  '004F4482: push esi
  '004F4483: call [ecx+000000D8h]
  '004F4489: test eax, eax
  '004F448B: fclex 
  '004F448D: jnl 4F44A1h
  '004F448F: push 000000D8h
  '004F4494: push 0042725Ch
  '004F4499: push esi
  '004F449A: push eax
  '004F449B: call [004010A0h]
  '004F44A1: mov eax, [edi]
  '004F44A3: add esi, 000000D4h
  '004F44A9: push esi
  '004F44AA: push 00000015h
  '004F44AC: push ebx
  '004F44AD: push eax
  '004F44AE: call [00401044h]
  '004F44B4: mov ecx, [edi]
  '004F44B6: push eax
  '004F44B7: lea edx, [ebp-2Ch]
  '004F44BA: push ecx
  '004F44BB: push edx
  '004F44BC: call [00401330h]
  '004F44C2: push eax
  '004F44C3: mov eax, [ebp-34h]
  '004F44C6: push eax
  '004F44C7: call 004279C8h
  '004F44CC: call [0040109Ch]
  '004F44D2: mov ecx, [ebp-2Ch]
  '004F44D5: push ecx
  '004F44D6: push edi
  '004F44D7: call [00401238h]
  '004F44DD: lea ecx, [ebp-2Ch]
  '004F44E0: call [004013B4h]
  '004F44E6: mov edx, [ebp-50h]
  '004F44E9: push edx
  '004F44EA: push ebx
  '004F44EB: push 00000010h
  '004F44ED: call [00401084h]
  '004F44F3: push 004F4505h
  '004F44F8: jmp 4F4504h
  '004F44FA: lea ecx, [ebp-2Ch]
  '004F44FD: call [004013B4h]
  '004F4503: ret 
End Sub
Private Sub PictureSize_4F4520
  '004F4520: push ebp
  '004F4521: mov ebp, esp
  '004F4523: sub esp, 00000008h
  '004F4526: push 004081B6h
  '004F452B: mov eax, fs:[00h]
  '004F4531: push eax
  '004F4532: mov fs:[00000000h], esp
  '004F4539: sub esp, 0000005Ch
  '004F453C: push ebx
  '004F453D: push esi
  '004F453E: push edi
  '004F453F: mov [ebp-08h], esp
  '004F4542: mov [ebp-04h], 00405860h
  '004F4549: mov esi, [ebp+08h]
  '004F454C: lea ecx, [ebp-4Ch]
  '004F454F: xor edi, edi
  '004F4551: push ecx
  '004F4552: mov eax, [esi]
  '004F4554: push esi
  '004F4555: mov [ebp-24h], edi
  '004F4558: mov [ebp-2Ch], edi
  '004F455B: mov [ebp-34h], edi
  '004F455E: mov [ebp-44h], edi
  '004F4561: mov byte ptr [ebp-48h], 00h
  '004F4565: mov [ebp-4Ch], edi
  '004F4568: mov [ebp-50h], edi
  '004F456B: mov [ebp-54h], edi
  '004F456E: mov [ebp-58h], edi
  '004F4571: mov [ebp-5Ch], edi
  '004F4574: mov [ebp-60h], edi
  '004F4577: call [eax+000000D8h]
  '004F457D: cmp eax, edi
  '004F457F: fclex 
  '004F4581: jnl 4F4599h
  '004F4583: mov ebx, [004010A0h]
  '004F4589: push 000000D8h
  '004F458E: push 0042725Ch
  '004F4593: push esi
  '004F4594: push eax
  '004F4595: call ebx
  '004F4597: jmp 4F459Fh
  '004F4599: mov ebx, [004010A0h]
  '004F459F: mov edx, [ebp-4Ch]
  '004F45A2: push edx
  '004F45A3: call 004275F8h
  '004F45A8: mov edi, [0040109Ch]
  '004F45AE: mov [ebp-50h], eax
  '004F45B1: call edi
  '004F45B3: mov eax, [ebp-50h]
  '004F45B6: mov ecx, [esi]
  '004F45B8: lea edx, [ebp-4Ch]
  '004F45BB: mov [ebp-24h], eax
  '004F45BE: push edx
  '004F45BF: push esi
  '004F45C0: call [ecx+000000D8h]
  '004F45C6: test eax, eax
  '004F45C8: fclex 
  '004F45CA: jnl 4F45DAh
  '004F45CC: push 000000D8h
  '004F45D1: push 0042725Ch
  '004F45D6: push esi
  '004F45D7: push eax
  '004F45D8: call ebx
  '004F45DA: mov eax, [ebp-4Ch]
  '004F45DD: push eax
  '004F45DE: call 004275F8h
  '004F45E3: mov [ebp-50h], eax
  '004F45E6: call edi
  '004F45E8: mov ecx, [ebp-50h]
  '004F45EB: mov edx, [esi]
  '004F45ED: lea eax, [ebp-4Ch]
  '004F45F0: mov [ebp-2Ch], ecx
  '004F45F3: push eax
  '004F45F4: push esi
  '004F45F5: call [edx+000000D8h]
  '004F45FB: test eax, eax
  '004F45FD: fclex 
  '004F45FF: jnl 4F460Fh
  '004F4601: push 000000D8h
  '004F4606: push 0042725Ch
  '004F460B: push esi
  '004F460C: push eax
  '004F460D: call ebx
  '004F460F: mov ecx, [esi+000000ACh]
  '004F4615: mov edx, [esi+000000A8h]
  '004F461B: mov eax, [ebp-4Ch]
  '004F461E: lea ebx, [esi+000000ACh]
  '004F4624: push ecx
  '004F4625: push edx
  '004F4626: push eax
  '004F4627: call 004276A8h
  '004F462C: mov [ebp-50h], eax
  '004F462F: call edi
  '004F4631: mov ecx, [ebp-50h]
  '004F4634: mov edx, [esi]
  '004F4636: lea eax, [ebp-4Ch]
  '004F4639: mov [ebp-20h], ecx
  '004F463C: push eax
  '004F463D: push esi
  '004F463E: call [edx+000000D8h]
  '004F4644: test eax, eax
  '004F4646: fclex 
  '004F4648: jnl 4F465Ch
  '004F464A: push 000000D8h
  '004F464F: push 0042725Ch
  '004F4654: push esi
  '004F4655: push eax
  '004F4656: call [004010A0h]
  '004F465C: mov ecx, [esi+000000CCh]
  '004F4662: mov edx, [esi+000000C8h]
  '004F4668: mov eax, [ebp-4Ch]
  '004F466B: push ecx
  '004F466C: push edx
  '004F466D: push eax
  '004F466E: call 004276A8h
  '004F4673: mov [ebp-50h], eax
  '004F4676: call edi
  '004F4678: mov edx, [ebp-20h]
  '004F467B: mov eax, [ebp-24h]
  '004F467E: mov ecx, [ebp-50h]
  '004F4681: push edx
  '004F4682: push eax
  '004F4683: mov [ebp-28h], ecx
  '004F4686: call 00420BECh
  '004F468B: mov [ebp-4Ch], eax
  '004F468E: call edi
  '004F4690: mov edx, [ebp-28h]
  '004F4693: mov eax, [ebp-2Ch]
  '004F4696: mov ecx, [ebp-4Ch]
  '004F4699: push edx
  '004F469A: push eax
  '004F469B: mov [ebp-18h], ecx
  '004F469E: call 00420BECh
  '004F46A3: mov [ebp-4Ch], eax
  '004F46A6: call edi
  '004F46A8: mov edx, [ebp+0Ch]
  '004F46AB: mov ecx, [ebp-4Ch]
  '004F46AE: mov [ebp-1Ch], ecx
  '004F46B1: cmp byte ptr [edx], 00h
  '004F46B4: jnz 004F48DBh
  '004F46BA: mov eax, [esi]
  '004F46BC: lea ecx, [ebp-4Ch]
  '004F46BF: push ecx
  '004F46C0: push esi
  '004F46C1: call [eax+000000D8h]
  '004F46C7: test eax, eax
  '004F46C9: fclex 
  '004F46CB: jnl 4F46DFh
  '004F46CD: push 000000D8h
  '004F46D2: push 0042725Ch
  '004F46D7: push esi
  '004F46D8: push eax
  '004F46D9: call [004010A0h]
  '004F46DF: mov edx, [ebp-4Ch]
  '004F46E2: push edx
  '004F46E3: call 004275F8h
  '004F46E8: mov [ebp-50h], eax
  '004F46EB: call edi
  '004F46ED: mov ecx, [esi+000000C4h]
  '004F46F3: mov eax, [ebp-50h]
  '004F46F6: push 00000000h
  '004F46F8: push 00000000h
  '004F46FA: lea edx, [ebp-44h]
  '004F46FD: push ecx
  '004F46FE: push edx
  '004F46FF: mov [ebp-34h], eax
  '004F4702: call [004011E4h]
  '004F4708: add esp, 00000010h
  '004F470B: push eax
  '004F470C: call [0040130Ch]
  '004F4712: push eax
  '004F4713: mov eax, [ebp-34h]
  '004F4716: push eax
  '004F4717: call 00420BECh
  '004F471C: mov [ebp-4Ch], eax
  '004F471F: call edi
  '004F4721: mov ecx, [ebp-4Ch]
  '004F4724: mov [ebp-30h], ecx
  '004F4727: lea ecx, [ebp-44h]
  '004F472A: call [00401030h]
  '004F4730: mov edx, [ebp-24h]
  '004F4733: push 00FFFFFFh
  '004F4738: push edx
  '004F4739: call 004275ACh
  '004F473E: call edi
  '004F4740: mov ecx, 00000001h
  '004F4745: call [00401208h]
  '004F474B: mov edx, [ebx]
  '004F474D: lea ecx, [ebp-48h]
  '004F4750: push ecx
  '004F4751: mov ecx, [esi+000000A8h]
  '004F4757: push 00FFFFFFh
  '004F475C: push edx
  '004F475D: push ecx
  '004F475E: push 00000000h
  '004F4760: lea edx, [ebp-24h]
  '004F4763: mov [ebp-48h], al
  '004F4766: mov eax, [esi]
  '004F4768: push 00000000h
  '004F476A: push edx
  '004F476B: push esi
  '004F476C: call [eax+00000924h]
  '004F4772: xor eax, eax
  '004F4774: lea edx, [esi+00000108h]
  '004F477A: mov [ebp-58h], eax
  '004F477D: mov [ebp-54h], eax
  '004F4780: mov [ebp-50h], eax
  '004F4783: mov [ebp-4Ch], eax
  '004F4786: push edx
  '004F4787: lea eax, [ebp-58h]
  '004F478A: lea edx, [ebp-54h]
  '004F478D: push eax
  '004F478E: push edx
  '004F478F: lea eax, [esi+000000A8h]
  '004F4795: push ebx
  '004F4796: push eax
  '004F4797: mov ecx, [esi]
  '004F4799: lea eax, [ebp-50h]
  '004F479C: push eax
  '004F479D: lea edx, [ebp-4Ch]
  '004F47A0: lea eax, [ebp-34h]
  '004F47A3: push edx
  '004F47A4: push eax
  '004F47A5: lea edx, [ebp-24h]
  '004F47A8: lea eax, [ebp-24h]
  '004F47AB: push edx
  '004F47AC: push eax
  '004F47AD: push esi
  '004F47AE: call [ecx+00000930h]
  '004F47B4: mov ecx, [ebx]
  '004F47B6: mov edx, [esi+000000A8h]
  '004F47BC: push 00CC0020h
  '004F47C1: push ecx
  '004F47C2: push edx
  '004F47C3: mov eax, [ebp-24h]
  '004F47C6: mov ecx, [esi+000000CCh]
  '004F47CC: mov edx, [esi+000000C8h]
  '004F47D2: push 00000000h
  '004F47D4: push 00000000h
  '004F47D6: push eax
  '004F47D7: mov eax, [ebp-2Ch]
  '004F47DA: push ecx
  '004F47DB: push edx
  '004F47DC: push 00000000h
  '004F47DE: push 00000000h
  '004F47E0: push eax
  '004F47E1: call 00427528h
  '004F47E6: call edi
  '004F47E8: mov ecx, [ebp-1Ch]
  '004F47EB: mov edx, [ebp-2Ch]
  '004F47EE: push ecx
  '004F47EF: push edx
  '004F47F0: call 00420BECh
  '004F47F5: call edi
  '004F47F7: mov eax, [ebp+14h]
  '004F47FA: cmp byte ptr [eax], 01h
  '004F47FD: jnz 4F4876h
  '004F47FF: push 00000092h
  '004F4804: push 00000092h
  '004F4809: push 00000092h
  '004F480E: call [00401034h]
  '004F4814: push eax
  '004F4815: call 00420A8Ch
  '004F481A: mov [ebp-4Ch], eax
  '004F481D: call edi
  '004F481F: mov ecx, [esi]
  '004F4821: mov ebx, [ebp-4Ch]
  '004F4824: lea edx, [ebp-4Ch]
  '004F4827: push edx
  '004F4828: push esi
  '004F4829: call [ecx+000000D8h]
  '004F482F: test eax, eax
  '004F4831: fclex 
  '004F4833: jnl 4F4847h
  '004F4835: push 000000D8h
  '004F483A: push 0042725Ch
  '004F483F: push esi
  '004F4840: push eax
  '004F4841: call [004010A0h]
  '004F4847: mov eax, [ebp+10h]
  '004F484A: push 00000084h
  '004F484F: push 00000000h
  '004F4851: push 00000000h
  '004F4853: mov ecx, [eax+04h]
  '004F4856: mov edx, [eax]
  '004F4858: mov eax, [ebp-28h]
  '004F485B: push ecx
  '004F485C: mov ecx, [ebp-4Ch]
  '004F485F: push edx
  '004F4860: push 00000000h
  '004F4862: push eax
  '004F4863: push 00000000h
  '004F4865: push ebx
  '004F4866: push ecx
  '004F4867: call 004278B4h
  '004F486C: call edi
  '004F486E: push ebx
  '004F486F: call 00420C34h
  '004F4874: jmp 4F48BEh
  '004F4876: mov edx, [esi]
  '004F4878: lea eax, [ebp-4Ch]
  '004F487B: push eax
  '004F487C: push esi
  '004F487D: call [edx+000000D8h]
  '004F4883: test eax, eax
  '004F4885: fclex 
  '004F4887: jnl 4F489Bh
  '004F4889: push 000000D8h
  '004F488E: push 0042725Ch
  '004F4893: push esi
  '004F4894: push eax
  '004F4895: call [004010A0h]
  '004F489B: mov eax, [ebp+10h]
  '004F489E: push 00000024h
  '004F48A0: push 00000000h
  '004F48A2: push 00000000h
  '004F48A4: mov ecx, [eax+04h]
  '004F48A7: mov edx, [eax]
  '004F48A9: mov eax, [ebp-28h]
  '004F48AC: push ecx
  '004F48AD: mov ecx, [ebp-4Ch]
  '004F48B0: push edx
  '004F48B1: push 00000000h
  '004F48B3: push eax
  '004F48B4: push 00000000h
  '004F48B6: push 00000000h
  '004F48B8: push ecx
  '004F48B9: call 004278B4h
  '004F48BE: call edi
  '004F48C0: mov edx, [ebp-30h]
  '004F48C3: push edx
  '004F48C4: call 00420C34h
  '004F48C9: call edi
  '004F48CB: mov eax, [ebp-34h]
  '004F48CE: push eax
  '004F48CF: call 0042763Ch
  '004F48D4: call edi
  '004F48D6: jmp 004F49EEh
  '004F48DB: mov ecx, [esi+000000C4h]
  '004F48E1: push 00000000h
  '004F48E3: push 00000000h
  '004F48E5: lea edx, [ebp-44h]
  '004F48E8: push ecx
  '004F48E9: push edx
  '004F48EA: call [004011E4h]
  '004F48F0: add esp, 00000010h
  '004F48F3: lea eax, [ebp-44h]
  '004F48F6: push 00000004h
  '004F48F8: push 00000000h
  '004F48FA: push 00000000h
  '004F48FC: push 00000000h
  '004F48FE: push 00000000h
  '004F4900: push 00000000h
  '004F4902: push eax
  '004F4903: call [0040130Ch]
  '004F4909: mov ecx, [ebp-24h]
  '004F490C: push eax
  '004F490D: push 00000000h
  '004F490F: push 00000000h
  '004F4911: push ecx
  '004F4912: call 004278B4h
  '004F4917: call edi
  '004F4919: lea ecx, [ebp-44h]
  '004F491C: call [00401030h]
  '004F4922: mov edx, [ebx]
  '004F4924: mov eax, [esi+000000A8h]
  '004F492A: mov ecx, [ebp-24h]
  '004F492D: push 00CC0020h
  '004F4932: push edx
  '004F4933: mov edx, [esi+000000CCh]
  '004F4939: lea ebx, [esi+000000CCh]
  '004F493F: push eax
  '004F4940: mov eax, [esi+000000C8h]
  '004F4946: push 00000000h
  '004F4948: push 00000000h
  '004F494A: push ecx
  '004F494B: mov ecx, [ebp-2Ch]
  '004F494E: push edx
  '004F494F: push eax
  '004F4950: push 00000000h
  '004F4952: push 00000000h
  '004F4954: push ecx
  '004F4955: call 00427528h
  '004F495A: call edi
  '004F495C: mov edx, [esi]
  '004F495E: lea eax, [ebp-4Ch]
  '004F4961: push eax
  '004F4962: push esi
  '004F4963: call [edx+000000D8h]
  '004F4969: test eax, eax
  '004F496B: fclex 
  '004F496D: jnl 4F4981h
  '004F496F: push 000000D8h
  '004F4974: push 0042725Ch
  '004F4979: push esi
  '004F497A: push eax
  '004F497B: call [004010A0h]
  '004F4981: mov ecx, [esi]
  '004F4983: lea edx, [ebp-50h]
  '004F4986: push edx
  '004F4987: push esi
  '004F4988: call [ecx+000000D8h]
  '004F498E: test eax, eax
  '004F4990: fclex 
  '004F4992: jnl 4F49A6h
  '004F4994: push 000000D8h
  '004F4999: push 0042725Ch
  '004F499E: push esi
  '004F499F: push eax
  '004F49A0: call [004010A0h]
  '004F49A6: xor eax, eax
  '004F49A8: mov ecx, [ebp-4Ch]
  '004F49AB: mov [ebp-60h], eax
  '004F49AE: mov [ebp-5Ch], eax
  '004F49B1: mov eax, [ebp-50h]
  '004F49B4: mov [ebp-54h], ecx
  '004F49B7: mov [ebp-58h], eax
  '004F49BA: lea eax, [esi+00000108h]
  '004F49C0: push eax
  '004F49C1: mov eax, [ebp+10h]
  '004F49C4: mov edx, [esi]
  '004F49C6: lea ecx, [eax+04h]
  '004F49C9: push ecx
  '004F49CA: push eax
  '004F49CB: lea eax, [esi+000000C8h]
  '004F49D1: push ebx
  '004F49D2: push eax
  '004F49D3: lea eax, [ebp-60h]
  '004F49D6: push eax
  '004F49D7: lea ecx, [ebp-5Ch]
  '004F49DA: lea eax, [ebp-2Ch]
  '004F49DD: push ecx
  '004F49DE: push eax
  '004F49DF: lea ecx, [ebp-58h]
  '004F49E2: lea eax, [ebp-54h]
  '004F49E5: push ecx
  '004F49E6: push eax
  '004F49E7: push esi
  '004F49E8: call [edx+00000930h]
  '004F49EE: mov ecx, [ebp-18h]
  '004F49F1: mov edx, [ebp-24h]
  '004F49F4: push ecx
  '004F49F5: push edx
  '004F49F6: call 00420BECh
  '004F49FB: call edi
  '004F49FD: mov eax, [ebp-1Ch]
  '004F4A00: mov ecx, [ebp-2Ch]
  '004F4A03: push eax
  '004F4A04: push ecx
  '004F4A05: call 00420BECh
  '004F4A0A: call edi
  '004F4A0C: mov edx, [ebp-20h]
  '004F4A0F: push edx
  '004F4A10: call 00420C34h
  '004F4A15: call edi
  '004F4A17: mov eax, [ebp-28h]
  '004F4A1A: push eax
  '004F4A1B: call 00420C34h
  '004F4A20: call edi
  '004F4A22: mov ecx, [ebp-24h]
  '004F4A25: push ecx
  '004F4A26: call 0042763Ch
  '004F4A2B: call edi
  '004F4A2D: mov edx, [ebp-2Ch]
  '004F4A30: push edx
  '004F4A31: call 0042763Ch
  '004F4A36: call edi
  '004F4A38: push 004F4A4Ah
  '004F4A3D: jmp 4F4A49h
  '004F4A3F: lea ecx, [ebp-44h]
  '004F4A42: call [00401030h]
  '004F4A48: ret 
End Sub
Private Sub unknown_4F4A60
  '004F4A60: push ebp
  '004F4A61: mov ebp, esp
  '004F4A63: sub esp, 00000008h
  '004F4A66: push 004081B6h
  '004F4A6B: mov eax, fs:[00h]
  '004F4A71: push eax
  '004F4A72: mov fs:[00000000h], esp
  '004F4A79: sub esp, 000000D8h
  '004F4A7F: push ebx
  '004F4A80: push esi
  '004F4A81: push edi
  '004F4A82: mov [ebp-08h], esp
  '004F4A85: mov [ebp-04h], 00405870h
  '004F4A8C: mov eax, [ebp+0Ch]
  '004F4A8F: xor edi, edi
  '004F4A91: mov [ebp-2Ch], edi
  '004F4A94: mov [ebp-30h], edi
  '004F4A97: mov cl, [eax]
  '004F4A99: mov [ebp-40h], edi
  '004F4A9C: test cl, cl
  '004F4A9E: mov [ebp-50h], edi
  '004F4AA1: mov [ebp-60h], edi
  '004F4AA4: mov [ebp-70h], edi
  '004F4AA7: mov [ebp-80h], edi
  '004F4AAA: mov [ebp-00000090h], edi
  '004F4AB0: mov [ebp-000000A0h], edi
  '004F4AB6: mov [ebp-000000B0h], edi
  '004F4ABC: mov [ebp-000000B4h], edi
  '004F4AC2: mov [ebp-000000B8h], edi
  '004F4AC8: mov [ebp-000000BCh], edi
  '004F4ACE: mov [ebp-000000C0h], edi
  '004F4AD4: mov [ebp-000000C4h], edi
  '004F4ADA: mov [ebp-000000C8h], edi
  '004F4AE0: mov [ebp-000000CCh], edi
  '004F4AE6: jnz 004F4E8Ah
  '004F4AEC: mov esi, [ebp+08h]
  '004F4AEF: lea edx, [ebp-000000B4h]
  '004F4AF5: push edx
  '004F4AF6: push esi
  '004F4AF7: mov ecx, [esi]
  '004F4AF9: call [ecx+000000D8h]
  '004F4AFF: cmp eax, edi
  '004F4B01: fclex 
  '004F4B03: jnl 4F4B17h
  '004F4B05: push 000000D8h
  '004F4B0A: push 0042725Ch
  '004F4B0F: push esi
  '004F4B10: push eax
  '004F4B11: call [004010A0h]
  '004F4B17: mov eax, [ebp-000000B4h]
  '004F4B1D: push eax
  '004F4B1E: call 004275F8h
  '004F4B23: mov edi, [0040109Ch]
  '004F4B29: mov [ebp-000000B8h], eax
  '004F4B2F: call edi
  '004F4B31: mov ecx, [esi]
  '004F4B33: mov ebx, [ebp-000000B8h]
  '004F4B39: lea edx, [ebp-000000B4h]
  '004F4B3F: push edx
  '004F4B40: push esi
  '004F4B41: call [ecx+000000D8h]
  '004F4B47: test eax, eax
  '004F4B49: fclex 
  '004F4B4B: jnl 4F4B5Fh
  '004F4B4D: push 000000D8h
  '004F4B52: push 0042725Ch
  '004F4B57: push esi
  '004F4B58: push eax
  '004F4B59: call [004010A0h]
  '004F4B5F: mov eax, [esi+000000ACh]
  '004F4B65: mov ecx, [esi+000000A8h]
  '004F4B6B: mov edx, [ebp-000000B4h]
  '004F4B71: push eax
  '004F4B72: push ecx
  '004F4B73: push edx
  '004F4B74: call 004276A8h
  '004F4B79: mov [ebp-000000B8h], eax
  '004F4B7F: call edi
  '004F4B81: mov eax, [ebp-000000B8h]
  '004F4B87: mov ecx, [esi]
  '004F4B89: lea edx, [ebp-000000B4h]
  '004F4B8F: mov [ebp-20h], eax
  '004F4B92: push edx
  '004F4B93: push esi
  '004F4B94: call [ecx+000000D8h]
  '004F4B9A: test eax, eax
  '004F4B9C: fclex 
  '004F4B9E: jnl 4F4BB2h
  '004F4BA0: push 000000D8h
  '004F4BA5: push 0042725Ch
  '004F4BAA: push esi
  '004F4BAB: push eax
  '004F4BAC: call [004010A0h]
  '004F4BB2: mov eax, [ebp-000000B4h]
  '004F4BB8: push eax
  '004F4BB9: call 004275F8h
  '004F4BBE: mov [ebp-000000B8h], eax
  '004F4BC4: call edi
  '004F4BC6: mov ecx, [ebp-000000B8h]
  '004F4BCC: mov edx, [esi]
  '004F4BCE: lea eax, [ebp-000000B4h]
  '004F4BD4: mov [ebp-2Ch], ecx
  '004F4BD7: push eax
  '004F4BD8: push esi
  '004F4BD9: call [edx+000000D8h]
  '004F4BDF: test eax, eax
  '004F4BE1: fclex 
  '004F4BE3: jnl 4F4BF7h
  '004F4BE5: push 000000D8h
  '004F4BEA: push 0042725Ch
  '004F4BEF: push esi
  '004F4BF0: push eax
  '004F4BF1: call [004010A0h]
  '004F4BF7: mov ecx, [esi+000000CCh]
  '004F4BFD: mov edx, [esi+000000C8h]
  '004F4C03: mov eax, [ebp-000000B4h]
  '004F4C09: push ecx
  '004F4C0A: push edx
  '004F4C0B: push eax
  '004F4C0C: call 004276A8h
  '004F4C11: mov [ebp-000000B8h], eax
  '004F4C17: call edi
  '004F4C19: mov edx, [ebp-20h]
  '004F4C1C: mov ecx, [ebp-000000B8h]
  '004F4C22: push edx
  '004F4C23: push ebx
  '004F4C24: mov [ebp-28h], ecx
  '004F4C27: call 00420BECh
  '004F4C2C: mov [ebp-000000B4h], eax
  '004F4C32: call edi
  '004F4C34: mov ecx, [ebp-28h]
  '004F4C37: mov edx, [ebp-2Ch]
  '004F4C3A: mov eax, [ebp-000000B4h]
  '004F4C40: push ecx
  '004F4C41: push edx
  '004F4C42: mov [ebp-18h], eax
  '004F4C45: call 00420BECh
  '004F4C4A: mov [ebp-000000B4h], eax
  '004F4C50: call edi
  '004F4C52: mov eax, [ebp-000000B4h]
  '004F4C58: mov ecx, [ebp+14h]
  '004F4C5B: mov [ebp-1Ch], eax
  '004F4C5E: cmp byte ptr [ecx], 01h
  '004F4C61: jnz 004F4CE9h
  '004F4C67: push 00000092h
  '004F4C6C: push 00000092h
  '004F4C71: push 00000092h
  '004F4C76: call [00401034h]
  '004F4C7C: push eax
  '004F4C7D: call 00420A8Ch
  '004F4C82: mov [ebp-000000B4h], eax
  '004F4C88: call edi
  '004F4C8A: mov eax, [esi+000000C4h]
  '004F4C90: mov edx, [ebp-000000B4h]
  '004F4C96: push 00000000h
  '004F4C98: push 00000000h
  '004F4C9A: lea ecx, [ebp-40h]
  '004F4C9D: push eax
  '004F4C9E: push ecx
  '004F4C9F: mov [ebp-14h], edx
  '004F4CA2: call [004011E4h]
  '004F4CA8: add esp, 00000010h
  '004F4CAB: lea edx, [ebp-40h]
  '004F4CAE: push 00000083h
  '004F4CB3: push 00000000h
  '004F4CB5: push 00000000h
  '004F4CB7: push 00000000h
  '004F4CB9: push 00000000h
  '004F4CBB: push 00000000h
  '004F4CBD: push edx
  '004F4CBE: call [0040130Ch]
  '004F4CC4: push eax
  '004F4CC5: mov eax, [ebp-14h]
  '004F4CC8: push 00000000h
  '004F4CCA: push eax
  '004F4CCB: push ebx
  '004F4CCC: call 004278B4h
  '004F4CD1: call edi
  '004F4CD3: lea ecx, [ebp-40h]
  '004F4CD6: call [00401030h]
  '004F4CDC: mov ecx, [ebp-14h]
  '004F4CDF: push ecx
  '004F4CE0: call 00420C34h
  '004F4CE5: call edi
  '004F4CE7: jmp 4F4D2Dh
  '004F4CE9: mov edx, [esi+000000C4h]
  '004F4CEF: push 00000000h
  '004F4CF1: push 00000000h
  '004F4CF3: lea eax, [ebp-40h]
  '004F4CF6: push edx
  '004F4CF7: push eax
  '004F4CF8: call [004011E4h]
  '004F4CFE: add esp, 00000010h
  '004F4D01: lea ecx, [ebp-40h]
  '004F4D04: push 00000023h
  '004F4D06: push 00000000h
  '004F4D08: push 00000000h
  '004F4D0A: push 00000000h
  '004F4D0C: push 00000000h
  '004F4D0E: push 00000000h
  '004F4D10: push ecx
  '004F4D11: call [0040130Ch]
  '004F4D17: push eax
  '004F4D18: push 00000000h
  '004F4D1A: push 00000000h
  '004F4D1C: push ebx
  '004F4D1D: call 004278B4h
  '004F4D22: call edi
  '004F4D24: lea ecx, [ebp-40h]
  '004F4D27: call [00401030h]
  '004F4D2D: mov edx, [esi+000000ACh]
  '004F4D33: mov eax, [ebp+10h]
  '004F4D36: mov ecx, [esi+000000A8h]
  '004F4D3C: push 00CC0020h
  '004F4D41: push edx
  '004F4D42: mov edx, [eax+0Ch]
  '004F4D45: push ecx
  '004F4D46: mov ecx, [eax+04h]
  '004F4D49: push 00000000h
  '004F4D4B: sub edx, ecx
  '004F4D4D: mov ecx, [eax+08h]
  '004F4D50: push 00000000h
  '004F4D52: push ebx
  '004F4D53: jo 004F5041h
  '004F4D59: push edx
  '004F4D5A: mov edx, [eax]
  '004F4D5C: sub ecx, edx
  '004F4D5E: mov edx, [ebp-2Ch]
  '004F4D61: jo 004F5041h
  '004F4D67: push ecx
  '004F4D68: push 00000000h
  '004F4D6A: push 00000000h
  '004F4D6C: push edx
  '004F4D6D: call 00427528h
  '004F4D72: call edi
  '004F4D74: mov eax, [esi]
  '004F4D76: lea ecx, [ebp-000000B4h]
  '004F4D7C: push ecx
  '004F4D7D: push esi
  '004F4D7E: call [eax+000000D8h]
  '004F4D84: test eax, eax
  '004F4D86: fclex 
  '004F4D88: jnl 4F4D9Ch
  '004F4D8A: push 000000D8h
  '004F4D8F: push 0042725Ch
  '004F4D94: push esi
  '004F4D95: push eax
  '004F4D96: call [004010A0h]
  '004F4D9C: mov edx, [esi]
  '004F4D9E: lea eax, [ebp-000000B8h]
  '004F4DA4: push eax
  '004F4DA5: push esi
  '004F4DA6: call [edx+000000D8h]
  '004F4DAC: xor ecx, ecx
  '004F4DAE: cmp eax, ecx
  '004F4DB0: fclex 
  '004F4DB2: jnl 4F4DC8h
  '004F4DB4: push 000000D8h
  '004F4DB9: push 0042725Ch
  '004F4DBE: push esi
  '004F4DBF: push eax
  '004F4DC0: call [004010A0h]
  '004F4DC6: xor ecx, ecx
  '004F4DC8: mov edx, [ebp-000000B4h]
  '004F4DCE: mov eax, [ebp+10h]
  '004F4DD1: mov [ebp-000000BCh], edx
  '004F4DD7: lea edx, [ebp-000000CCh]
  '004F4DDD: add eax, 00000004h
  '004F4DE0: push edx
  '004F4DE1: mov edx, [ebp+10h]
  '004F4DE4: push eax
  '004F4DE5: lea eax, [esi+000000CCh]
  '004F4DEB: push edx
  '004F4DEC: push eax
  '004F4DED: lea eax, [esi+000000C8h]
  '004F4DF3: push eax
  '004F4DF4: lea eax, [ebp-000000C8h]
  '004F4DFA: push eax
  '004F4DFB: lea edx, [ebp-000000C4h]
  '004F4E01: lea eax, [ebp-2Ch]
  '004F4E04: mov [ebp-000000CCh], ecx
  '004F4E0A: mov [ebp-000000C8h], ecx
  '004F4E10: mov [ebp-000000C4h], ecx
  '004F4E16: mov ecx, [ebp-000000B8h]
  '004F4E1C: push edx
  '004F4E1D: push eax
  '004F4E1E: lea edx, [ebp-000000C0h]
  '004F4E24: lea eax, [ebp-000000BCh]
  '004F4E2A: mov [ebp-000000C0h], ecx
  '004F4E30: mov ecx, [esi]
  '004F4E32: push edx
  '004F4E33: push eax
  '004F4E34: push esi
  '004F4E35: call [ecx+00000930h]
  '004F4E3B: mov ecx, [ebp-18h]
  '004F4E3E: push ecx
  '004F4E3F: push ebx
  '004F4E40: call 00420BECh
  '004F4E45: call edi
  '004F4E47: mov edx, [ebp-1Ch]
  '004F4E4A: mov eax, [ebp-2Ch]
  '004F4E4D: push edx
  '004F4E4E: push eax
  '004F4E4F: call 00420BECh
  '004F4E54: call edi
  '004F4E56: mov ecx, [ebp-20h]
  '004F4E59: push ecx
  '004F4E5A: call 00420C34h
  '004F4E5F: call edi
  '004F4E61: mov edx, [ebp-28h]
  '004F4E64: push edx
  '004F4E65: call 00420C34h
  '004F4E6A: call edi
  '004F4E6C: push ebx
  '004F4E6D: call 0042763Ch
  '004F4E72: call edi
  '004F4E74: mov eax, [ebp-2Ch]
  '004F4E77: push eax
  '004F4E78: call 0042763Ch
  '004F4E7D: call edi
  '004F4E7F: wait 
  '004F4E80: push 004F502Ch
  '004F4E85: jmp 004F502Bh
  '004F4E8A: mov ecx, [ebp+10h]
  '004F4E8D: mov edx, 0000000Ah
  '004F4E92: mov esi, [ebp+08h]
  '004F4E95: mov [ebp-70h], 00000002h
  '004F4E9C: mov edi, [ecx+04h]
  '004F4E9F: mov eax, [ecx+0Ch]
  '004F4EA2: mov [ebp-000000DCh], edi
  '004F4EA8: sub eax, edi
  '004F4EAA: mov edi, [ecx]
  '004F4EAC: mov ecx, [ecx+08h]
  '004F4EAF: jo 004F5041h
  '004F4EB5: sub ecx, edi
  '004F4EB7: mov [ebp-50h], 00000003h
  '004F4EBE: jo 004F5041h
  '004F4EC4: sub esp, 00000010h
  '004F4EC7: mov [ebp-000000E0h], edi
  '004F4ECD: mov ebx, esp
  '004F4ECF: sub esp, 00000010h
  '004F4ED2: mov edi, [esi+10h]
  '004F4ED5: mov [ebx], edx
  '004F4ED7: mov edx, [ebp-000000ACh]
  '004F4EDD: mov edi, [edi]
  '004F4EDF: mov [ebx+04h], edx
  '004F4EE2: mov edx, 80020004h
  '004F4EE7: mov [ebx+08h], edx
  '004F4EEA: mov edx, [ebp-000000A4h]
  '004F4EF0: mov [ebx+0Ch], edx
  '004F4EF3: mov ebx, esp
  '004F4EF5: mov edx, 00000003h
  '004F4EFA: sub esp, 00000010h
  '004F4EFD: mov [ebx], edx
  '004F4EFF: mov edx, [ebp-0000009Ch]
  '004F4F05: mov [ebx+04h], edx
  '004F4F08: mov edx, [esi+000000ACh]
  '004F4F0E: mov [ebx+08h], edx
  '004F4F11: mov edx, [ebp-00000094h]
  '004F4F17: mov [ebx+0Ch], edx
  '004F4F1A: mov ebx, esp
  '004F4F1C: mov edx, 00000003h
  '004F4F21: sub esp, 00000010h
  '004F4F24: mov [ebx], edx
  '004F4F26: mov edx, [ebp-0000008Ch]
  '004F4F2C: mov [ebx+04h], edx
  '004F4F2F: mov edx, [esi+000000A8h]
  '004F4F35: mov [ebx+08h], edx
  '004F4F38: mov edx, [ebp-00000084h]
  '004F4F3E: mov [ebx+0Ch], edx
  '004F4F41: mov ebx, esp
  '004F4F43: mov edx, 00000002h
  '004F4F48: sub esp, 00000010h
  '004F4F4B: mov [ebx], edx
  '004F4F4D: mov edx, [ebp-7Ch]
  '004F4F50: mov [ebx+04h], edx
  '004F4F53: xor edx, edx
  '004F4F55: mov [ebx+08h], edx
  '004F4F58: mov edx, [ebp-74h]
  '004F4F5B: mov [ebx+0Ch], edx
  '004F4F5E: mov edx, [ebp-70h]
  '004F4F61: mov ebx, esp
  '004F4F63: sub esp, 00000010h
  '004F4F66: mov [ebx], edx
  '004F4F68: mov edx, [ebp-6Ch]
  '004F4F6B: mov [ebx+04h], edx
  '004F4F6E: xor edx, edx
  '004F4F70: mov [ebx+08h], edx
  '004F4F73: mov edx, [ebp-64h]
  '004F4F76: mov [ebx+0Ch], edx
  '004F4F79: mov ebx, esp
  '004F4F7B: mov edx, 00000003h
  '004F4F80: sub esp, 00000010h
  '004F4F83: mov [ebx], edx
  '004F4F85: mov edx, [ebp-5Ch]
  '004F4F88: mov [ebx+04h], edx
  '004F4F8B: mov edx, esp
  '004F4F8D: mov [ebx+08h], eax
  '004F4F90: mov eax, [ebp-54h]
  '004F4F93: mov [ebx+0Ch], eax
  '004F4F96: mov eax, [ebp-50h]
  '004F4F99: mov [edx], eax
  '004F4F9B: mov eax, [ebp-4Ch]
  '004F4F9E: mov [edx+04h], eax
  '004F4FA1: fild dword ptr [ebp-000000DCh]
  '004F4FA7: mov [edx+08h], ecx
  '004F4FAA: mov ecx, [ebp-44h]
  '004F4FAD: fstp real4 ptr [ebp-000000E4h]
  '004F4FB3: fild dword ptr [ebp-000000E0h]
  '004F4FB9: mov [edx+0Ch], ecx
  '004F4FBC: mov edx, [ebp-000000E4h]
  '004F4FC2: mov ecx, [esi+000000C4h]
  '004F4FC8: push edx
  '004F4FC9: fstp real4 ptr [ebp-000000E8h]
  '004F4FCF: mov eax, [ebp-000000E8h]
  '004F4FD5: lea edx, [ebp-30h]
  '004F4FD8: push eax
  '004F4FD9: push ecx
  '004F4FDA: push edx
  '004F4FDB: call [004010F8h]
  '004F4FE1: push eax
  '004F4FE2: mov eax, [esi+10h]
  '004F4FE5: push eax
  '004F4FE6: call [edi+00000364h]
  '004F4FEC: test eax, eax
  '004F4FEE: fclex 
  '004F4FF0: jnl 4F5007h
  '004F4FF2: mov ecx, [esi+10h]
  '004F4FF5: push 00000364h
  '004F4FFA: push 0042725Ch
  '004F4FFF: push ecx
  '004F5000: push eax
  '004F5001: call [004010A0h]
  '004F5007: lea ecx, [ebp-30h]
  '004F500A: call [004013B8h]
  '004F5010: wait 
  '004F5011: push 004F502Ch
  '004F5016: jmp 4F502Bh
  '004F5018: lea ecx, [ebp-30h]
  '004F501B: call [004013B8h]
  '004F5021: lea ecx, [ebp-40h]
  '004F5024: call [00401030h]
  '004F502A: ret 
End Sub
Private Sub unknown_4F5050
  '004F5050: push ebp
  '004F5051: mov ebp, esp
  '004F5053: sub esp, 00000008h
  '004F5056: push 004081B6h
  '004F505B: mov eax, fs:[00h]
  '004F5061: push eax
  '004F5062: mov fs:[00000000h], esp
  '004F5069: sub esp, 0000002Ch
  '004F506C: push ebx
  '004F506D: push esi
  '004F506E: push edi
  '004F506F: mov [ebp-08h], esp
  '004F5072: mov [ebp-04h], 00405880h
  '004F5079: mov esi, [ebp+08h]
  '004F507C: xor ebx, ebx
  '004F507E: push ebx
  '004F507F: mov [ebp-24h], ebx
  '004F5082: mov eax, [esi+000000C4h]
  '004F5088: mov [ebp-28h], bl
  '004F508B: push eax
  '004F508C: mov [ebp-2Ch], bl
  '004F508F: call [00401210h]
  '004F5095: test ax, ax
  '004F5098: jnz 004F534Dh
  '004F509E: lea edi, [esi+58h]
  '004F50A1: lea eax, [esi+78h]
  '004F50A4: push edi
  '004F50A5: push eax
  '004F50A6: push 00000010h
  '004F50A8: mov [ebp-3Ch], eax
  '004F50AB: call [00401084h]
  '004F50B1: mov dl, [esi+000000EAh]
  '004F50B7: mov al, [esi+000000E9h]
  '004F50BD: xor ecx, ecx
  '004F50BF: cmp dl, 01h
  '004F50C2: setnz cl
  '004F50C5: xor edx, edx
  '004F50C7: test al, al
  '004F50C9: setnz dl
  '004F50CC: or ecx, edx
  '004F50CE: jnz 4F50E0h
  '004F50D0: cmp [esi+000000C0h], 00000002h
  '004F50D7: jnz 4F50E0h
  '004F50D9: mov ebx, FFFFFFFDh
  '004F50DE: jmp 4F50F2h
  '004F50E0: cmp al, 01h
  '004F50E2: jnz 4F50F2h
  '004F50E4: cmp [esi+000000C0h], 00000002h
  '004F50EB: jz 4F50F2h
  '004F50ED: mov ebx, 00000001h
  '004F50F2: mov edx, [edi]
  '004F50F4: push 00000000h
  '004F50F6: movsx eax, bx
  '004F50F9: mov ecx, eax
  '004F50FB: push 00000003h
  '004F50FD: add ecx, edx
  '004F50FF: mov edx, [edi+04h]
  '004F5102: jo 004F5374h
  '004F5108: mov [edi], ecx
  '004F510A: mov ecx, [edi+08h]
  '004F510D: add edx, eax
  '004F510F: jo 004F5374h
  '004F5115: mov [edi+04h], edx
  '004F5118: mov edx, [edi+0Ch]
  '004F511B: add ecx, eax
  '004F511D: jo 004F5374h
  '004F5123: add edx, eax
  '004F5125: mov [edi+08h], ecx
  '004F5128: jo 004F5374h
  '004F512E: mov [edi+0Ch], edx
  '004F5131: mov eax, [esi+000000C4h]
  '004F5137: lea ecx, [ebp-24h]
  '004F513A: push eax
  '004F513B: push ecx
  '004F513C: call [004011E4h]
  '004F5142: add esp, 00000010h
  '004F5145: push eax
  '004F5146: call [00401284h]
  '004F514C: mov bx, ax
  '004F514F: lea ecx, [ebp-24h]
  '004F5152: dec bx
  '004F5154: neg bx
  '004F5157: sbb ebx, ebx
  '004F5159: inc ebx
  '004F515A: neg ebx
  '004F515C: call [00401030h]
  '004F5162: test bx, bx
  '004F5165: jz 004F523Bh
  '004F516B: mov edx, [esi]
  '004F516D: lea eax, [ebp-28h]
  '004F5170: push eax
  '004F5171: push esi
  '004F5172: call [edx+000007A8h]
  '004F5178: test eax, eax
  '004F517A: jnl 4F518Eh
  '004F517C: push 000007A8h
  '004F5181: push 0042728Ch
  '004F5186: push esi
  '004F5187: push eax
  '004F5188: call [004010A0h]
  '004F518E: cmp word ptr [ebp-28h], 0000h
  '004F5193: jnz 4F51BBh
  '004F5195: xor ecx, ecx
  '004F5197: mov byte ptr [ebp-2Ch], 00h
  '004F519B: call [00401208h]
  '004F51A1: mov ecx, [esi]
  '004F51A3: lea edx, [ebp-2Ch]
  '004F51A6: mov [ebp-28h], al
  '004F51A9: push edx
  '004F51AA: lea eax, [ebp-28h]
  '004F51AD: push edi
  '004F51AE: push eax
  '004F51AF: push esi
  '004F51B0: call [ecx+00000900h]
  '004F51B6: jmp 004F5340h
  '004F51BB: mov al, [esi+000000EAh]
  '004F51C1: mov bl, [esi+000000E9h]
  '004F51C7: xor ecx, ecx
  '004F51C9: cmp al, 01h
  '004F51CB: setnz cl
  '004F51CE: xor edx, edx
  '004F51D0: test bl, bl
  '004F51D2: setnz dl
  '004F51D5: or ecx, edx
  '004F51D7: jnz 4F5210h
  '004F51D9: cmp [esi+000000C0h], 00000002h
  '004F51E0: jnz 4F5210h
  '004F51E2: mov ebx, [00401208h]
  '004F51E8: mov ecx, 00000001h
  '004F51ED: call ebx
  '004F51EF: xor ecx, ecx
  '004F51F1: mov [ebp-2Ch], al
  '004F51F4: call ebx
  '004F51F6: mov edx, [ebp-3Ch]
  '004F51F9: lea ecx, [ebp-2Ch]
  '004F51FC: push ecx
  '004F51FD: lea ecx, [ebp-28h]
  '004F5200: mov [ebp-28h], al
  '004F5203: mov eax, [esi]
  '004F5205: push edx
  '004F5206: push ecx
  '004F5207: push esi
  '004F5208: call [eax+00000900h]
  '004F520E: jmp 4F5216h
  '004F5210: mov ebx, [00401208h]
  '004F5216: mov ecx, 00000001h
  '004F521B: mov byte ptr [ebp-2Ch], 00h
  '004F521F: call ebx
  '004F5221: mov edx, [esi]
  '004F5223: mov [ebp-28h], al
  '004F5226: lea eax, [ebp-2Ch]
  '004F5229: lea ecx, [ebp-28h]
  '004F522C: push eax
  '004F522D: push edi
  '004F522E: push ecx
  '004F522F: push esi
  '004F5230: call [edx+00000900h]
  '004F5236: jmp 004F5340h
  '004F523B: mov edx, [esi+000000C4h]
  '004F5241: push 00000000h
  '004F5243: push 00000003h
  '004F5245: lea eax, [ebp-24h]
  '004F5248: push edx
  '004F5249: push eax
  '004F524A: call [004011E4h]
  '004F5250: add esp, 00000010h
  '004F5253: push eax
  '004F5254: call [00401284h]
  '004F525A: xor ebx, ebx
  '004F525C: cmp ax, 0003h
  '004F5260: setz bl
  '004F5263: lea ecx, [ebp-24h]
  '004F5266: neg ebx
  '004F5268: call [00401030h]
  '004F526E: test bx, bx
  '004F5271: jz 004F5340h
  '004F5277: mov ecx, [esi]
  '004F5279: lea edx, [ebp-28h]
  '004F527C: push edx
  '004F527D: push esi
  '004F527E: call [ecx+000007A8h]
  '004F5284: test eax, eax
  '004F5286: jnl 4F529Ah
  '004F5288: push 000007A8h
  '004F528D: push 0042728Ch
  '004F5292: push esi
  '004F5293: push eax
  '004F5294: call [004010A0h]
  '004F529A: cmp word ptr [ebp-28h], 0000h
  '004F529F: jnz 4F52C4h
  '004F52A1: xor ecx, ecx
  '004F52A3: mov byte ptr [ebp-2Ch], 00h
  '004F52A7: call [00401208h]
  '004F52AD: lea ecx, [ebp-2Ch]
  '004F52B0: lea edx, [ebp-28h]
  '004F52B3: push ecx
  '004F52B4: mov [ebp-28h], al
  '004F52B7: mov eax, [esi]
  '004F52B9: push edi
  '004F52BA: push edx
  '004F52BB: push esi
  '004F52BC: call [eax+00000904h]
  '004F52C2: jmp 4F5340h
  '004F52C4: mov cl, [esi+000000EAh]
  '004F52CA: mov bl, [esi+000000E9h]
  '004F52D0: xor eax, eax
  '004F52D2: cmp cl, 01h
  '004F52D5: setnz al
  '004F52D8: xor ecx, ecx
  '004F52DA: test bl, bl
  '004F52DC: setnz cl
  '004F52DF: or eax, ecx
  '004F52E1: jnz 4F531Ah
  '004F52E3: cmp [esi+000000C0h], 00000002h
  '004F52EA: jnz 4F531Ah
  '004F52EC: mov ebx, [00401208h]
  '004F52F2: mov ecx, 00000001h
  '004F52F7: call ebx
  '004F52F9: xor ecx, ecx
  '004F52FB: mov [ebp-2Ch], al
  '004F52FE: call ebx
  '004F5300: mov ecx, [ebp-3Ch]
  '004F5303: mov edx, [esi]
  '004F5305: mov [ebp-28h], al
  '004F5308: lea eax, [ebp-2Ch]
  '004F530B: push eax
  '004F530C: lea eax, [ebp-28h]
  '004F530F: push ecx
  '004F5310: push eax
  '004F5311: push esi
  '004F5312: call [edx+00000904h]
  '004F5318: jmp 4F5320h
  '004F531A: mov ebx, [00401208h]
  '004F5320: mov ecx, 00000001h
  '004F5325: mov byte ptr [ebp-2Ch], 00h
  '004F5329: call ebx
  '004F532B: mov ecx, [esi]
  '004F532D: lea edx, [ebp-2Ch]
  '004F5330: mov [ebp-28h], al
  '004F5333: push edx
  '004F5334: lea eax, [ebp-28h]
  '004F5337: push edi
  '004F5338: push eax
  '004F5339: push esi
  '004F533A: call [ecx+00000904h]
  '004F5340: mov ecx, [ebp-3Ch]
  '004F5343: push ecx
  '004F5344: push edi
  '004F5345: push 00000010h
  '004F5347: call [00401084h]
  '004F534D: push 004F535Fh
  '004F5352: jmp 4F535Eh
  '004F5354: lea ecx, [ebp-24h]
  '004F5357: call [00401030h]
  '004F535D: ret 
End Sub
Private Sub unknown_4F5380
  '004F5380: push ebp
  '004F5381: mov ebp, esp
  '004F5383: sub esp, 00000018h
  '004F5386: push 004081B6h
  '004F538B: mov eax, fs:[00h]
  '004F5391: push eax
  '004F5392: mov fs:[00000000h], esp
  '004F5399: mov eax, 000000C8h
  '004F539E: call 004081B0h
  '004F53A3: push ebx
  '004F53A4: push esi
  '004F53A5: push edi
  '004F53A6: mov [ebp-18h], esp
  '004F53A9: mov [ebp-14h], 00405890h
  '004F53B0: mov [ebp-10h], 00000000h
  '004F53B7: mov [ebp-0Ch], 00000000h
  '004F53BE: mov [ebp-04h], 00000001h
  '004F53C5: mov [ebp-04h], 00000002h
  '004F53CC: push FFFFFFFFh
  '004F53CE: call [004010E8h]
  '004F53D4: mov [ebp-04h], 00000003h
  '004F53DB: lea eax, [ebp-44h]
  '004F53DE: push eax
  '004F53DF: mov ecx, [ebp+08h]
  '004F53E2: mov edx, [ecx]
  '004F53E4: mov eax, [ebp+08h]
  '004F53E7: push eax
  '004F53E8: call [edx+000002C0h]
  '004F53EE: fclex 
  '004F53F0: mov [ebp-0000008Ch], eax
  '004F53F6: cmp [ebp-0000008Ch], 00000000h
  '004F53FD: jnl 4F5422h
  '004F53FF: push 000002C0h
  '004F5404: push 0042725Ch
  '004F5409: mov ecx, [ebp+08h]
  '004F540C: push ecx
  '004F540D: mov edx, [ebp-0000008Ch]
  '004F5413: push edx
  '004F5414: call [004010A0h]
  '004F541A: mov [ebp-000000B0h], eax
  '004F5420: jmp 4F542Ch
  '004F5422: mov [ebp-000000B0h], 00000000h
  '004F542C: push 00000000h
  '004F542E: push 00427FCCh
  '004F5433: mov eax, [ebp-44h]
  '004F5436: push eax
  '004F5437: lea ecx, [ebp-58h]
  '004F543A: push ecx
  '004F543B: call [00401368h]
  '004F5441: add esp, 00000010h
  '004F5444: lea edx, [ebp-48h]
  '004F5447: push edx
  '004F5448: mov eax, [ebp+08h]
  '004F544B: mov ecx, [eax]
  '004F544D: mov edx, [ebp+08h]
  '004F5450: push edx
  '004F5451: call [ecx+00000198h]
  '004F5457: fclex 
  '004F5459: mov [ebp-00000090h], eax
  '004F545F: cmp [ebp-00000090h], 00000000h
  '004F5466: jnl 4F548Bh
  '004F5468: push 00000198h
  '004F546D: push 0042725Ch
  '004F5472: mov eax, [ebp+08h]
  '004F5475: push eax
  '004F5476: mov ecx, [ebp-00000090h]
  '004F547C: push ecx
  '004F547D: call [004010A0h]
  '004F5483: mov [ebp-000000B4h], eax
  '004F5489: jmp 4F5495h
  '004F548B: mov [ebp-000000B4h], 00000000h
  '004F5495: push 00000000h
  '004F5497: push 00427FD8h
  '004F549C: mov edx, [ebp-48h]
  '004F549F: push edx
  '004F54A0: lea eax, [ebp-68h]
  '004F54A3: push eax
  '004F54A4: call [00401368h]
  '004F54AA: add esp, 00000010h
  '004F54AD: lea ecx, [ebp-7Ch]
  '004F54B0: push ecx
  '004F54B1: mov edx, [ebp+08h]
  '004F54B4: mov eax, [edx]
  '004F54B6: mov ecx, [ebp+08h]
  '004F54B9: push ecx
  '004F54BA: call [eax+00000110h]
  '004F54C0: fclex 
  '004F54C2: mov [ebp-00000094h], eax
  '004F54C8: cmp [ebp-00000094h], 00000000h
  '004F54CF: jnl 4F54F4h
  '004F54D1: push 00000110h
  '004F54D6: push 0042725Ch
  '004F54DB: mov edx, [ebp+08h]
  '004F54DE: push edx
  '004F54DF: mov eax, [ebp-00000094h]
  '004F54E5: push eax
  '004F54E6: call [004010A0h]
  '004F54EC: mov [ebp-000000B8h], eax
  '004F54F2: jmp 4F54FEh
  '004F54F4: mov [ebp-000000B8h], 00000000h
  '004F54FE: mov cx, [ebp-7Ch]
  '004F5502: mov [ebp-70h], cx
  '004F5506: mov [ebp-78h], 00000002h
  '004F550D: lea edx, [ebp-80h]
  '004F5510: push edx
  '004F5511: mov eax, 00000010h
  '004F5516: call 004081B0h
  '004F551B: mov eax, esp
  '004F551D: mov ecx, [ebp-78h]
  '004F5520: mov [eax], ecx
  '004F5522: mov edx, [ebp-74h]
  '004F5525: mov [eax+04h], edx
  '004F5528: mov ecx, [ebp-70h]
  '004F552B: mov [eax+08h], ecx
  '004F552E: mov edx, [ebp-6Ch]
  '004F5531: mov [eax+0Ch], edx
  '004F5534: mov eax, 00000010h
  '004F5539: call 004081B0h
  '004F553E: mov eax, esp
  '004F5540: mov ecx, [ebp-68h]
  '004F5543: mov [eax], ecx
  '004F5545: mov edx, [ebp-64h]
  '004F5548: mov [eax+04h], edx
  '004F554B: mov ecx, [ebp-60h]
  '004F554E: mov [eax+08h], ecx
  '004F5551: mov edx, [ebp-5Ch]
  '004F5554: mov [eax+0Ch], edx
  '004F5557: lea eax, [ebp-58h]
  '004F555A: push eax
  '004F555B: call [004011DCh]
  '004F5561: push ecx
  '004F5562: fstp real4 ptr [esp]
  '004F5565: mov ecx, [ebp+08h]
  '004F5568: mov edx, [ecx]
  '004F556A: mov eax, [ebp+08h]
  '004F556D: push eax
  '004F556E: call [edx+00000374h]
  '004F5574: fclex 
  '004F5576: mov [ebp-00000098h], eax
  '004F557C: cmp [ebp-00000098h], 00000000h
  '004F5583: jnl 4F55A8h
  '004F5585: push 00000374h
  '004F558A: push 0042725Ch
  '004F558F: mov ecx, [ebp+08h]
  '004F5592: push ecx
  '004F5593: mov edx, [ebp-00000098h]
  '004F5599: push edx
  '004F559A: call [004010A0h]
  '004F55A0: mov [ebp-000000BCh], eax
  '004F55A6: jmp 4F55B2h
  '004F55A8: mov [ebp-000000BCh], 00000000h
  '004F55B2: fld real4 ptr [ebp-80h]
  '004F55B5: call [0040135Ch]
  '004F55BB: mov [ebp-3Ch], eax
  '004F55BE: lea eax, [ebp-48h]
  '004F55C1: push eax
  '004F55C2: lea ecx, [ebp-44h]
  '004F55C5: push ecx
  '004F55C6: push 00000002h
  '004F55C8: call [00401064h]
  '004F55CE: add esp, 0000000Ch
  '004F55D1: lea edx, [ebp-68h]
  '004F55D4: push edx
  '004F55D5: lea eax, [ebp-58h]
  '004F55D8: push eax
  '004F55D9: push 00000002h
  '004F55DB: call [00401050h]
  '004F55E1: add esp, 0000000Ch
  '004F55E4: mov [ebp-04h], 00000004h
  '004F55EB: lea ecx, [ebp-44h]
  '004F55EE: push ecx
  '004F55EF: mov edx, [ebp+08h]
  '004F55F2: mov eax, [edx]
  '004F55F4: mov ecx, [ebp+08h]
  '004F55F7: push ecx
  '004F55F8: call [eax+000002C0h]
  '004F55FE: fclex 
  '004F5600: mov [ebp-0000008Ch], eax
  '004F5606: cmp [ebp-0000008Ch], 00000000h
  '004F560D: jnl 4F5632h
  '004F560F: push 000002C0h
  '004F5614: push 0042725Ch
  '004F5619: mov edx, [ebp+08h]
  '004F561C: push edx
  '004F561D: mov eax, [ebp-0000008Ch]
  '004F5623: push eax
  '004F5624: call [004010A0h]
  '004F562A: mov [ebp-000000C0h], eax
  '004F5630: jmp 4F563Ch
  '004F5632: mov [ebp-000000C0h], 00000000h
  '004F563C: push 00000000h
  '004F563E: push 00427FECh
  '004F5643: mov ecx, [ebp-44h]
  '004F5646: push ecx
  '004F5647: lea edx, [ebp-58h]
  '004F564A: push edx
  '004F564B: call [00401368h]
  '004F5651: add esp, 00000010h
  '004F5654: lea eax, [ebp-48h]
  '004F5657: push eax
  '004F5658: mov ecx, [ebp+08h]
  '004F565B: mov edx, [ecx]
  '004F565D: mov eax, [ebp+08h]
  '004F5660: push eax
  '004F5661: call [edx+00000198h]
  '004F5667: fclex 
  '004F5669: mov [ebp-00000090h], eax
  '004F566F: cmp [ebp-00000090h], 00000000h
  '004F5676: jnl 4F569Bh
  '004F5678: push 00000198h
  '004F567D: push 0042725Ch
  '004F5682: mov ecx, [ebp+08h]
  '004F5685: push ecx
  '004F5686: mov edx, [ebp-00000090h]
  '004F568C: push edx
  '004F568D: call [004010A0h]
  '004F5693: mov [ebp-000000C4h], eax
  '004F5699: jmp 4F56A5h
  '004F569B: mov [ebp-000000C4h], 00000000h
  '004F56A5: push 00000000h
  '004F56A7: push 00427FD8h
  '004F56AC: mov eax, [ebp-48h]
  '004F56AF: push eax
  '004F56B0: lea ecx, [ebp-68h]
  '004F56B3: push ecx
  '004F56B4: call [00401368h]
  '004F56BA: add esp, 00000010h
  '004F56BD: lea edx, [ebp-7Ch]
  '004F56C0: push edx
  '004F56C1: mov eax, [ebp+08h]
  '004F56C4: mov ecx, [eax]
  '004F56C6: mov edx, [ebp+08h]
  '004F56C9: push edx
  '004F56CA: call [ecx+00000110h]
  '004F56D0: fclex 
  '004F56D2: mov [ebp-00000094h], eax
  '004F56D8: cmp [ebp-00000094h], 00000000h
  '004F56DF: jnl 4F5704h
  '004F56E1: push 00000110h
  '004F56E6: push 0042725Ch
  '004F56EB: mov eax, [ebp+08h]
  '004F56EE: push eax
  '004F56EF: mov ecx, [ebp-00000094h]
  '004F56F5: push ecx
  '004F56F6: call [004010A0h]
  '004F56FC: mov [ebp-000000C8h], eax
  '004F5702: jmp 4F570Eh
  '004F5704: mov [ebp-000000C8h], 00000000h
  '004F570E: mov dx, [ebp-7Ch]
  '004F5712: mov [ebp-70h], dx
  '004F5716: mov [ebp-78h], 00000002h
  '004F571D: lea eax, [ebp-80h]
  '004F5720: push eax
  '004F5721: mov eax, 00000010h
  '004F5726: call 004081B0h
  '004F572B: mov ecx, esp
  '004F572D: mov edx, [ebp-78h]
  '004F5730: mov [ecx], edx
  '004F5732: mov eax, [ebp-74h]
  '004F5735: mov [ecx+04h], eax
  '004F5738: mov edx, [ebp-70h]
  '004F573B: mov [ecx+08h], edx
  '004F573E: mov eax, [ebp-6Ch]
  '004F5741: mov [ecx+0Ch], eax
  '004F5744: mov eax, 00000010h
  '004F5749: call 004081B0h
  '004F574E: mov ecx, esp
  '004F5750: mov edx, [ebp-68h]
  '004F5753: mov [ecx], edx
  '004F5755: mov eax, [ebp-64h]
  '004F5758: mov [ecx+04h], eax
  '004F575B: mov edx, [ebp-60h]
  '004F575E: mov [ecx+08h], edx
  '004F5761: mov eax, [ebp-5Ch]
  '004F5764: mov [ecx+0Ch], eax
  '004F5767: lea ecx, [ebp-58h]
  '004F576A: push ecx
  '004F576B: call [004011DCh]
  '004F5771: push ecx
  '004F5772: fstp real4 ptr [esp]
  '004F5775: mov edx, [ebp+08h]
  '004F5778: mov eax, [edx]
  '004F577A: mov ecx, [ebp+08h]
  '004F577D: push ecx
  '004F577E: call [eax+00000378h]
  '004F5784: fclex 
  '004F5786: mov [ebp-00000098h], eax
  '004F578C: cmp [ebp-00000098h], 00000000h
  '004F5793: jnl 4F57B8h
  '004F5795: push 00000378h
  '004F579A: push 0042725Ch
  '004F579F: mov edx, [ebp+08h]
  '004F57A2: push edx
  '004F57A3: mov eax, [ebp-00000098h]
  '004F57A9: push eax
  '004F57AA: call [004010A0h]
  '004F57B0: mov [ebp-000000CCh], eax
  '004F57B6: jmp 4F57C2h
  '004F57B8: mov [ebp-000000CCh], 00000000h
  '004F57C2: fld real4 ptr [ebp-80h]
  '004F57C5: call [0040135Ch]
  '004F57CB: mov [ebp-2Ch], eax
  '004F57CE: lea ecx, [ebp-48h]
  '004F57D1: push ecx
  '004F57D2: lea edx, [ebp-44h]
  '004F57D5: push edx
  '004F57D6: push 00000002h
  '004F57D8: call [00401064h]
  '004F57DE: add esp, 0000000Ch
  '004F57E1: lea eax, [ebp-68h]
  '004F57E4: push eax
  '004F57E5: lea ecx, [ebp-58h]
  '004F57E8: push ecx
  '004F57E9: push 00000002h
  '004F57EB: call [00401050h]
  '004F57F1: add esp, 0000000Ch
  '004F57F4: mov [ebp-04h], 00000005h
  '004F57FB: lea edx, [ebp-44h]
  '004F57FE: push edx
  '004F57FF: mov eax, [ebp+08h]
  '004F5802: mov ecx, [eax]
  '004F5804: mov edx, [ebp+08h]
  '004F5807: push edx
  '004F5808: call [ecx+00000198h]
  '004F580E: fclex 
  '004F5810: mov [ebp-0000008Ch], eax
  '004F5816: cmp [ebp-0000008Ch], 00000000h
  '004F581D: jnl 4F5842h
  '004F581F: push 00000198h
  '004F5824: push 0042725Ch
  '004F5829: mov eax, [ebp+08h]
  '004F582C: push eax
  '004F582D: mov ecx, [ebp-0000008Ch]
  '004F5833: push ecx
  '004F5834: call [004010A0h]
  '004F583A: mov [ebp-000000D0h], eax
  '004F5840: jmp 4F584Ch
  '004F5842: mov [ebp-000000D0h], 00000000h
  '004F584C: push 004210C8h
  '004F5851: push 00000000h
  '004F5853: push 00427FF4h
  '004F5858: mov edx, [ebp-44h]
  '004F585B: push edx
  '004F585C: lea eax, [ebp-58h]
  '004F585F: push eax
  '004F5860: call [00401368h]
  '004F5866: add esp, 00000010h
  '004F5869: push eax
  '004F586A: call [004011C8h]
  '004F5870: push eax
  '004F5871: lea ecx, [ebp-24h]
  '004F5874: push ecx
  '004F5875: call [004010E4h]
  '004F587B: lea ecx, [ebp-44h]
  '004F587E: call [004013B8h]
  '004F5884: lea ecx, [ebp-58h]
  '004F5887: call [00401030h]
  '004F588D: mov [ebp-04h], 00000006h
  '004F5894: lea edx, [ebp-80h]
  '004F5897: push edx
  '004F5898: mov eax, [ebp+08h]
  '004F589B: mov ecx, [eax]
  '004F589D: mov edx, [ebp+08h]
  '004F58A0: push edx
  '004F58A1: call [ecx+000000D8h]
  '004F58A7: fclex 
  '004F58A9: mov [ebp-0000008Ch], eax
  '004F58AF: cmp [ebp-0000008Ch], 00000000h
  '004F58B6: jnl 4F58DBh
  '004F58B8: push 000000D8h
  '004F58BD: push 0042725Ch
  '004F58C2: mov eax, [ebp+08h]
  '004F58C5: push eax
  '004F58C6: mov ecx, [ebp-0000008Ch]
  '004F58CC: push ecx
  '004F58CD: call [004010A0h]
  '004F58D3: mov [ebp-000000D4h], eax
  '004F58D9: jmp 4F58E5h
  '004F58DB: mov [ebp-000000D4h], 00000000h
  '004F58E5: mov edx, [ebp-80h]
  '004F58E8: push edx
  '004F58E9: call 004275F8h
  '004F58EE: mov [ebp-00000084h], eax
  '004F58F4: call [0040109Ch]
  '004F58FA: mov eax, [ebp-00000084h]
  '004F5900: mov [ebp-38h], eax
  '004F5903: mov [ebp-04h], 00000007h
  '004F590A: lea ecx, [ebp-80h]
  '004F590D: push ecx
  '004F590E: mov edx, [ebp+08h]
  '004F5911: mov eax, [edx]
  '004F5913: mov ecx, [ebp+08h]
  '004F5916: push ecx
  '004F5917: call [eax+00000100h]
  '004F591D: fclex 
  '004F591F: mov [ebp-0000008Ch], eax
  '004F5925: cmp [ebp-0000008Ch], 00000000h
  '004F592C: jnl 4F5951h
  '004F592E: push 00000100h
  '004F5933: push 0042725Ch
  '004F5938: mov edx, [ebp+08h]
  '004F593B: push edx
  '004F593C: mov eax, [ebp-0000008Ch]
  '004F5942: push eax
  '004F5943: call [004010A0h]
  '004F5949: mov [ebp-000000D8h], eax
  '004F594F: jmp 4F595Bh
  '004F5951: mov [ebp-000000D8h], 00000000h
  '004F595B: lea ecx, [ebp-00000084h]
  '004F5961: push ecx
  '004F5962: mov edx, [ebp+08h]
  '004F5965: mov eax, [edx]
  '004F5967: mov ecx, [ebp+08h]
  '004F596A: push ecx
  '004F596B: call [eax+00000108h]
  '004F5971: fclex 
  '004F5973: mov [ebp-00000090h], eax
  '004F5979: cmp [ebp-00000090h], 00000000h
  '004F5980: jnl 4F59A5h
  '004F5982: push 00000108h
  '004F5987: push 0042725Ch
  '004F598C: mov edx, [ebp+08h]
  '004F598F: push edx
  '004F5990: mov eax, [ebp-00000090h]
  '004F5996: push eax
  '004F5997: call [004010A0h]
  '004F599D: mov [ebp-000000DCh], eax
  '004F59A3: jmp 4F59AFh
  '004F59A5: mov [ebp-000000DCh], 00000000h
  '004F59AF: fld real4 ptr [ebp-00000084h]
  '004F59B5: call [0040135Ch]
  '004F59BB: push eax
  '004F59BC: fld real4 ptr [ebp-80h]
  '004F59BF: call [0040135Ch]
  '004F59C5: push eax
  '004F59C6: mov ecx, [ebp-38h]
  '004F59C9: push ecx
  '004F59CA: call 004276A8h
  '004F59CF: mov [ebp-00000088h], eax
  '004F59D5: call [0040109Ch]
  '004F59DB: mov edx, [ebp-00000088h]
  '004F59E1: mov [ebp-34h], edx
  '004F59E4: mov [ebp-04h], 00000008h
  '004F59EB: push 00000000h
  '004F59ED: push 00000000h
  '004F59EF: mov eax, [ebp-24h]
  '004F59F2: push eax
  '004F59F3: lea ecx, [ebp-58h]
  '004F59F6: push ecx
  '004F59F7: call [004011E4h]
  '004F59FD: add esp, 00000010h
  '004F5A00: push eax
  '004F5A01: call [0040130Ch]
  '004F5A07: push eax
  '004F5A08: mov edx, [ebp-38h]
  '004F5A0B: push edx
  '004F5A0C: call 00420BECh
  '004F5A11: call [0040109Ch]
  '004F5A17: lea ecx, [ebp-58h]
  '004F5A1A: call [00401030h]
  '004F5A20: mov [ebp-04h], 00000009h
  '004F5A27: lea eax, [ebp-80h]
  '004F5A2A: push eax
  '004F5A2B: mov ecx, [ebp+08h]
  '004F5A2E: mov edx, [ecx]
  '004F5A30: mov eax, [ebp+08h]
  '004F5A33: push eax
  '004F5A34: call [edx+000000D8h]
  '004F5A3A: fclex 
  '004F5A3C: mov [ebp-0000008Ch], eax
  '004F5A42: cmp [ebp-0000008Ch], 00000000h
  '004F5A49: jnl 4F5A6Eh
  '004F5A4B: push 000000D8h
  '004F5A50: push 0042725Ch
  '004F5A55: mov ecx, [ebp+08h]
  '004F5A58: push ecx
  '004F5A59: mov edx, [ebp-0000008Ch]
  '004F5A5F: push edx
  '004F5A60: call [004010A0h]
  '004F5A66: mov [ebp-000000E0h], eax
  '004F5A6C: jmp 4F5A78h
  '004F5A6E: mov [ebp-000000E0h], 00000000h
  '004F5A78: lea eax, [ebp-00000084h]
  '004F5A7E: push eax
  '004F5A7F: mov ecx, [ebp+08h]
  '004F5A82: mov edx, [ecx]
  '004F5A84: mov eax, [ebp+08h]
  '004F5A87: push eax
  '004F5A88: call [edx+00000100h]
  '004F5A8E: fclex 
  '004F5A90: mov [ebp-00000090h], eax
  '004F5A96: cmp [ebp-00000090h], 00000000h
  '004F5A9D: jnl 4F5AC2h
  '004F5A9F: push 00000100h
  '004F5AA4: push 0042725Ch
  '004F5AA9: mov ecx, [ebp+08h]
  '004F5AAC: push ecx
  '004F5AAD: mov edx, [ebp-00000090h]
  '004F5AB3: push edx
  '004F5AB4: call [004010A0h]
  '004F5ABA: mov [ebp-000000E4h], eax
  '004F5AC0: jmp 4F5ACCh
  '004F5AC2: mov [ebp-000000E4h], 00000000h
  '004F5ACC: lea eax, [ebp-00000088h]
  '004F5AD2: push eax
  '004F5AD3: mov ecx, [ebp+08h]
  '004F5AD6: mov edx, [ecx]
  '004F5AD8: mov eax, [ebp+08h]
  '004F5ADB: push eax
  '004F5ADC: call [edx+00000108h]
  '004F5AE2: fclex 
  '004F5AE4: mov [ebp-00000094h], eax
  '004F5AEA: cmp [ebp-00000094h], 00000000h
  '004F5AF1: jnl 4F5B16h
  '004F5AF3: push 00000108h
  '004F5AF8: push 0042725Ch
  '004F5AFD: mov ecx, [ebp+08h]
  '004F5B00: push ecx
  '004F5B01: mov edx, [ebp-00000094h]
  '004F5B07: push edx
  '004F5B08: call [004010A0h]
  '004F5B0E: mov [ebp-000000E8h], eax
  '004F5B14: jmp 4F5B20h
  '004F5B16: mov [ebp-000000E8h], 00000000h
  '004F5B20: push 00CC0020h
  '004F5B25: mov eax, [ebp-2Ch]
  '004F5B28: push eax
  '004F5B29: mov ecx, [ebp-3Ch]
  '004F5B2C: push ecx
  '004F5B2D: mov edx, [ebp-38h]
  '004F5B30: push edx
  '004F5B31: fld real4 ptr [ebp-00000088h]
  '004F5B37: call [0040135Ch]
  '004F5B3D: push eax
  '004F5B3E: fld real4 ptr [ebp-00000084h]
  '004F5B44: call [0040135Ch]
  '004F5B4A: push eax
  '004F5B4B: push 00000000h
  '004F5B4D: push 00000000h
  '004F5B4F: mov eax, [ebp-80h]
  '004F5B52: push eax
  '004F5B53: call 00427568h
  '004F5B58: call [0040109Ch]
  '004F5B5E: mov [ebp-04h], 0000000Ah
  '004F5B65: mov ecx, [ebp-28h]
  '004F5B68: push ecx
  '004F5B69: mov edx, [ebp-38h]
  '004F5B6C: push edx
  '004F5B6D: call 00420BECh
  '004F5B72: call [0040109Ch]
  '004F5B78: mov [ebp-04h], 0000000Bh
  '004F5B7F: mov eax, [ebp-34h]
  '004F5B82: push eax
  '004F5B83: call 00420C34h
  '004F5B88: call [0040109Ch]
  '004F5B8E: mov [ebp-04h], 0000000Ch
  '004F5B95: mov ecx, [ebp-38h]
  '004F5B98: push ecx
  '004F5B99: call 0042763Ch
  '004F5B9E: call [0040109Ch]
  '004F5BA4: mov [ebp-04h], 0000000Dh
  '004F5BAB: push 004210C8h
  '004F5BB0: push 00000000h
  '004F5BB2: call [0040137Ch]
  '004F5BB8: push eax
  '004F5BB9: lea edx, [ebp-24h]
  '004F5BBC: push edx
  '004F5BBD: call [004010E4h]
  '004F5BC3: wait 
  '004F5BC4: push 004F5BFCh
  '004F5BC9: jmp 4F5BF2h
  '004F5BCB: lea eax, [ebp-48h]
  '004F5BCE: push eax
  '004F5BCF: lea ecx, [ebp-44h]
  '004F5BD2: push ecx
  '004F5BD3: push 00000002h
  '004F5BD5: call [00401064h]
  '004F5BDB: add esp, 0000000Ch
  '004F5BDE: lea edx, [ebp-68h]
  '004F5BE1: push edx
  '004F5BE2: lea eax, [ebp-58h]
  '004F5BE5: push eax
  '004F5BE6: push 00000002h
  '004F5BE8: call [00401050h]
  '004F5BEE: add esp, 0000000Ch
  '004F5BF1: ret 
End Sub
Private Sub unknown_4F67F0
  '004F67F0: push ebp
  '004F67F1: mov ebp, esp
  '004F67F3: sub esp, 00000008h
  '004F67F6: push 004081B6h
  '004F67FB: mov eax, fs:[00h]
  '004F6801: push eax
  '004F6802: mov fs:[00000000h], esp
  '004F6809: sub esp, 00000010h
  '004F680C: push ebx
  '004F680D: push esi
  '004F680E: push edi
  '004F680F: mov [ebp-08h], esp
  '004F6812: mov [ebp-04h], 004059B8h
  '004F6819: mov esi, [ebp+0Ch]
  '004F681C: push 00020003h
  '004F6821: push 00000001h
  '004F6823: lea ecx, [ebp-18h]
  '004F6826: mov eax, [esi]
  '004F6828: mov [ebp-18h], 00000000h
  '004F682F: push eax
  '004F6830: push ecx
  '004F6831: call [00401330h]
  '004F6837: push eax
  '004F6838: call 004278F8h
  '004F683D: mov edi, eax
  '004F683F: call [0040109Ch]
  '004F6845: mov edx, [ebp-18h]
  '004F6848: push edx
  '004F6849: push esi
  '004F684A: call [00401238h]
  '004F6850: mov ecx, edi
  '004F6852: call [00401220h]
  '004F6858: lea ecx, [ebp-18h]
  '004F685B: mov [ebp-14h], al
  '004F685E: call [004013B4h]
  '004F6864: push 004F6876h
  '004F6869: jmp 4F6875h
  '004F686B: lea ecx, [ebp-18h]
  '004F686E: call [004013B4h]
  '004F6874: ret 
End Sub
Private Sub unknown_4F7110
  '004F7110: push ebp
  '004F7111: mov ebp, esp
  '004F7113: sub esp, 00000008h
  '004F7116: push 004081B6h
  '004F711B: mov eax, fs:[00h]
  '004F7121: push eax
  '004F7122: mov fs:[00000000h], esp
  '004F7129: sub esp, 00000048h
  '004F712C: push ebx
  '004F712D: push esi
  '004F712E: push edi
  '004F712F: mov [ebp-08h], esp
  '004F7132: mov [ebp-04h], 00405A38h
  '004F7139: mov esi, [ebp+0Ch]
  '004F713C: mov ecx, 00000006h
  '004F7141: xor eax, eax
  '004F7143: lea edi, [ebp-2Ch]
  '004F7146: fild dword ptr [esi]
  '004F7148: rep stosd 
  '004F714A: fstp real8 ptr [ebp-48h]
  '004F714D: fld real8 ptr [ebp-48h]
  '004F7150: cmp [00541000h], 00000000h
  '004F7157: jnz 4F7161h
  '004F7159: fdiv real8 ptr [00405A30h]
  '004F715F: jmp 4F7172h
  '004F7161: push [00405A34h]
  '004F7167: push [00405A30h]
  '004F716D: call 004081D4h
  '004F7172: mov [ebp-14h], 00000000h
  '004F7179: cmp [00541000h], 00000000h
  '004F7180: jnz 4F718Ah
  '004F7182: fdiv real8 ptr [00405A30h]
  '004F7188: jmp 4F719Bh
  '004F718A: push [00405A34h]
  '004F7190: push [00405A30h]
  '004F7196: call 004081D4h
  '004F719B: fstsw ax
  '004F719D: test al, 0Dh
  '004F719F: jnz 004F7267h
  '004F71A5: call [00401120h]
  '004F71AB: fstp real8 ptr [ebp-1Ch]
  '004F71AE: fld real8 ptr [ebp-1Ch]
  '004F71B1: fmul real8 ptr [00405A30h]
  '004F71B7: fmul real8 ptr [00405A30h]
  '004F71BD: fstp real8 ptr [ebp-3Ch]
  '004F71C0: fstsw ax
  '004F71C2: test al, 0Dh
  '004F71C4: jnz 004F7267h
  '004F71CA: fild dword ptr [esi]
  '004F71CC: fstp real8 ptr [ebp-50h]
  '004F71CF: fld real8 ptr [ebp-50h]
  '004F71D2: fsub real8 ptr [ebp-3Ch]
  '004F71D5: cmp [00541000h], 00000000h
  '004F71DC: jnz 4F71E6h
  '004F71DE: fdiv real8 ptr [00405A30h]
  '004F71E4: jmp 4F71F7h
  '004F71E6: push [00405A34h]
  '004F71EC: push [00405A30h]
  '004F71F2: call 004081D4h
  '004F71F7: fstsw ax
  '004F71F9: test al, 0Dh
  '004F71FB: jnz 4F7267h
  '004F71FD: call [00401120h]
  '004F7203: fstp real8 ptr [ebp-24h]
  '004F7206: fld real8 ptr [ebp-24h]
  '004F7209: fmul real8 ptr [00405A30h]
  '004F720F: fstp real8 ptr [ebp-34h]
  '004F7212: fstsw ax
  '004F7214: test al, 0Dh
  '004F7216: jnz 4F7267h
  '004F7218: fild dword ptr [esi]
  '004F721A: fstp real8 ptr [ebp-58h]
  '004F721D: fld real8 ptr [ebp-58h]
  '004F7220: fsub real8 ptr [ebp-3Ch]
  '004F7223: fsub real8 ptr [ebp-34h]
  '004F7226: fstsw ax
  '004F7228: test al, 0Dh
  '004F722A: jnz 4F7267h
  '004F722C: call [00401120h]
  '004F7232: fstp real8 ptr [ebp-2Ch]
  '004F7235: wait 
  '004F7236: push 004F7245h
  '004F723B: lea ecx, [ebp-14h]
  '004F723E: call [004013B4h]
  '004F7244: ret 
End Sub
Private Sub unknown_4F7270
  '004F7270: mov eax, [esp+08h]
  '004F7274: xor ecx, ecx
  '004F7276: mov eax, [eax]
  '004F7278: test eax, eax
  '004F727A: setnl cl
  '004F727D: xor edx, edx
  '004F727F: cmp eax, 00FFFFFFh
  '004F7284: setle dl
  '004F7287: test ecx, edx
  '004F7289: jnz 4F72ABh
  '004F728B: and eax, 00FFFFFFh
  '004F7290: push esi
  '004F7291: push eax
  '004F7292: call 0041D708h
  '004F7297: mov esi, eax
  '004F7299: call [0040109Ch]
  '004F729F: mov eax, [esp+10h]
  '004F72A3: mov [eax], esi
  '004F72A5: xor eax, eax
  '004F72A7: pop esi
  '004F72A8: retn 000Ch
End Sub
Private Sub PictureHover_4F72C0
  '004F72C0: push ebx
  '004F72C1: push esi
  '004F72C2: mov esi, [esp+10h]
  '004F72C6: push edi
  '004F72C7: mov eax, esi
  '004F72C9: cdq 
  '004F72CA: and edx, 0000FFFFh
  '004F72D0: add eax, edx
  '004F72D2: sar eax, 10h
  '004F72D5: mov edi, eax
  '004F72D7: and edi, 800000FFh
  '004F72DD: jns 4F72E7h
  '004F72DF: dec edi
  '004F72E0: or edi, FFFFFF00h
  '004F72E6: inc edi
  '004F72E7: mov ebx, [esp+18h]
  '004F72EB: mov ecx, edi
  '004F72ED: imul ecx, ebx
  '004F72F0: mov eax, 2AAAAAABh
  '004F72F5: jo 004F73A5h
  '004F72FB: imul ecx
  '004F72FD: sar edx, 05h
  '004F7300: mov eax, edx
  '004F7302: shr eax, 1Fh
  '004F7305: add edx, eax
  '004F7307: mov eax, esi
  '004F7309: mov ecx, edx
  '004F730B: add ecx, edi
  '004F730D: cdq 
  '004F730E: jo 004F73A5h
  '004F7314: and edx, 000000FFh
  '004F731A: add eax, edx
  '004F731C: sar eax, 08h
  '004F731F: mov edi, eax
  '004F7321: and edi, 800000FFh
  '004F7327: jns 4F7331h
  '004F7329: dec edi
  '004F732A: or edi, FFFFFF00h
  '004F7330: inc edi
  '004F7331: add edi, ebx
  '004F7333: jo 4F73A5h
  '004F7335: and esi, 000000FFh
  '004F733B: add esi, ebx
  '004F733D: jo 4F73A5h
  '004F733F: test esi, esi
  '004F7341: jnl 4F7347h
  '004F7343: xor esi, esi
  '004F7345: jmp 4F7354h
  '004F7347: cmp esi, 000000FFh
  '004F734D: jle 4F7354h
  '004F734F: mov esi, 000000FFh
  '004F7354: test edi, edi
  '004F7356: jnl 4F735Ch
  '004F7358: xor edi, edi
  '004F735A: jmp 4F7369h
  '004F735C: cmp edi, 000000FFh
  '004F7362: jle 4F7369h
  '004F7364: mov edi, 000000FFh
  '004F7369: test ecx, ecx
  '004F736B: jnl 4F7371h
  '004F736D: xor ecx, ecx
  '004F736F: jmp 4F737Eh
  '004F7371: cmp ecx, 000000FFh
  '004F7377: jle 4F737Eh
  '004F7379: mov ecx, 000000FFh
  '004F737E: mov ebx, [004011A8h]
  '004F7384: call ebx
  '004F7386: push eax
  '004F7387: mov ecx, edi
  '004F7389: call ebx
  '004F738B: push eax
  '004F738C: mov ecx, esi
  '004F738E: call ebx
  '004F7390: push eax
  '004F7391: call [00401034h]
  '004F7397: pop edi
  '004F7398: pop esi
  '004F7399: mov ecx, [esp+14h]
  '004F739D: pop ebx
  '004F739E: mov [ecx], eax
  '004F73A0: xor eax, eax
  '004F73A2: retn 0010h
End Sub
Private Sub PictureHover_4F73B0
  '004F73B0: sub esp, 0000000Ch
  '004F73B3: push ebp
  '004F73B4: push esi
  '004F73B5: mov esi, [esp+18h]
  '004F73B9: xor eax, eax
  '004F73BB: lea edx, [esp+08h]
  '004F73BF: push edi
  '004F73C0: mov ecx, [esi]
  '004F73C2: mov [esp+10h], eax
  '004F73C6: push edx
  '004F73C7: push esi
  '004F73C8: mov [esp+1Ch], eax
  '004F73CC: mov [esp+14h], eax
  '004F73D0: call [ecx+000000D8h]
  '004F73D6: mov ebp, [004010A0h]
  '004F73DC: test eax, eax
  '004F73DE: fclex 
  '004F73E0: jnl 4F73F0h
  '004F73E2: push 000000D8h
  '004F73E7: push 0042725Ch
  '004F73EC: push esi
  '004F73ED: push eax
  '004F73EE: call ebp
  '004F73F0: mov eax, [esp+30h]
  '004F73F4: push ebx
  '004F73F5: push eax
  '004F73F6: push 00000001h
  '004F73F8: push 00000000h
  '004F73FA: call 00427318h
  '004F73FF: mov edi, [0040109Ch]
  '004F7405: mov ebx, eax
  '004F7407: call edi
  '004F7409: mov ecx, [esp+10h]
  '004F740D: push ebx
  '004F740E: push ecx
  '004F740F: call 00420BECh
  '004F7414: mov ebx, eax
  '004F7416: call edi
  '004F7418: push ebx
  '004F7419: call 00420C34h
  '004F741E: call edi
  '004F7420: mov edx, [esi]
  '004F7422: lea eax, [esp+10h]
  '004F7426: push eax
  '004F7427: push esi
  '004F7428: call [edx+000000D8h]
  '004F742E: test eax, eax
  '004F7430: fclex 
  '004F7432: pop ebx
  '004F7433: jnl 4F7443h
  '004F7435: push 000000D8h
  '004F743A: push 0042725Ch
  '004F743F: push esi
  '004F7440: push eax
  '004F7441: call ebp
  '004F7443: mov edx, [esp+24h]
  '004F7447: mov eax, [esp+20h]
  '004F744B: lea ecx, [esp+10h]
  '004F744F: push ecx
  '004F7450: mov ecx, [esp+10h]
  '004F7454: push edx
  '004F7455: push eax
  '004F7456: push ecx
  '004F7457: call 0042735Ch
  '004F745C: call edi
  '004F745E: mov edx, [esi]
  '004F7460: lea eax, [esp+0Ch]
  '004F7464: push eax
  '004F7465: push esi
  '004F7466: call [edx+000000D8h]
  '004F746C: test eax, eax
  '004F746E: fclex 
  '004F7470: jnl 4F7480h
  '004F7472: push 000000D8h
  '004F7477: push 0042725Ch
  '004F747C: push esi
  '004F747D: push eax
  '004F747E: call ebp
  '004F7480: mov ecx, [esp+2Ch]
  '004F7484: mov edx, [esp+28h]
  '004F7488: mov eax, [esp+0Ch]
  '004F748C: push ecx
  '004F748D: push edx
  '004F748E: push eax
  '004F748F: call 0042739Ch
  '004F7494: call edi
  '004F7496: pop edi
  '004F7497: pop esi
  '004F7498: xor eax, eax
  '004F749A: pop ebp
  '004F749B: add esp, 0000000Ch
  '004F749E: retn 0018h
End Sub
Private Sub XPColor_Pressed_4F74B0
  '004F74B0: sub esp, 00000014h
  '004F74B3: xor eax, eax
  '004F74B5: push esi
  '004F74B6: mov [esp+08h], eax
  '004F74BA: lea edx, [esp+04h]
  '004F74BE: mov [esp+0Ch], eax
  '004F74C2: push edi
  '004F74C3: mov [esp+14h], eax
  '004F74C7: push edx
  '004F74C8: mov [esp+1Ch], eax
  '004F74CC: mov [esp+0Ch], eax
  '004F74D0: mov eax, [esp+24h]
  '004F74D4: lea edx, [esp+3Ch]
  '004F74D8: push edx
  '004F74D9: push eax
  '004F74DA: mov ecx, [eax]
  '004F74DC: call [ecx+00000918h]
  '004F74E2: mov eax, [esp+08h]
  '004F74E6: push eax
  '004F74E7: call 00420A8Ch
  '004F74EC: mov edi, [0040109Ch]
  '004F74F2: mov esi, eax
  '004F74F4: call edi
  '004F74F6: mov edx, [esp+2Ch]
  '004F74FA: mov ecx, [esp+28h]
  '004F74FE: mov eax, [esp+30h]
  '004F7502: mov [esp+10h], edx
  '004F7506: mov edx, [esp+3Ch]
  '004F750A: mov [esp+0Ch], ecx
  '004F750E: mov ecx, [esp+34h]
  '004F7512: mov [esp+14h], eax
  '004F7516: mov al, [edx]
  '004F7518: mov [esp+18h], ecx
  '004F751C: mov ecx, [esp+24h]
  '004F7520: cmp al, 01h
  '004F7522: lea eax, [esp+0Ch]
  '004F7526: push esi
  '004F7527: mov edx, [ecx]
  '004F7529: push eax
  '004F752A: push edx
  '004F752B: jnz 4F7546h
  '004F752D: call 00420A34h
  '004F7532: call edi
  '004F7534: push esi
  '004F7535: call 00420C34h
  '004F753A: call edi
  '004F753C: pop edi
  '004F753D: xor eax, eax
  '004F753F: pop esi
  '004F7540: add esp, 00000014h
  '004F7543: retn 0020h
End Sub
Private Sub XPColor_Pressed_4F7560
  '004F7560: sub esp, 00000028h
  '004F7563: push ebx
  '004F7564: push ebp
  '004F7565: push esi
  '004F7566: mov esi, [esp+38h]
  '004F756A: lea ecx, [esp+10h]
  '004F756E: push edi
  '004F756F: mov eax, [esi]
  '004F7571: xor edi, edi
  '004F7573: push ecx
  '004F7574: push esi
  '004F7575: mov [esp+24h], edi
  '004F7579: mov byte ptr [esp+1Ah], 00h
  '004F757E: mov [esp+1Ch], edi
  '004F7582: mov [esp+20h], edi
  '004F7586: mov [esp+28h], edi
  '004F758A: call [eax+000000D8h]
  '004F7590: mov ebx, [004010A0h]
  '004F7596: cmp eax, edi
  '004F7598: fclex 
  '004F759A: jnl 4F75AAh
  '004F759C: push 000000D8h
  '004F75A1: push 0042725Ch
  '004F75A6: push esi
  '004F75A7: push eax
  '004F75A8: call ebx
  '004F75AA: mov ebp, [00401208h]
  '004F75B0: mov ecx, 00000001h
  '004F75B5: call ebp
  '004F75B7: mov edx, [esp+14h]
  '004F75BB: lea edi, [esi+0000011Ch]
  '004F75C1: mov [esp+18h], edx
  '004F75C5: lea ecx, [esp+12h]
  '004F75C9: mov edx, [edi]
  '004F75CB: push ecx
  '004F75CC: mov ecx, [esi+44h]
  '004F75CF: push edx
  '004F75D0: mov edx, [esi+40h]
  '004F75D3: push ecx
  '004F75D4: push edx
  '004F75D5: push 00000000h
  '004F75D7: lea ecx, [esp+2Ch]
  '004F75DB: mov [esp+26h], al
  '004F75DF: mov eax, [esi]
  '004F75E1: push 00000000h
  '004F75E3: push ecx
  '004F75E4: push esi
  '004F75E5: call [eax+00000924h]
  '004F75EB: mov edx, [esi]
  '004F75ED: lea eax, [esp+12h]
  '004F75F1: push eax
  '004F75F2: push esi
  '004F75F3: call [edx+000007A8h]
  '004F75F9: test eax, eax
  '004F75FB: jnl 4F760Bh
  '004F75FD: push 000007A8h
  '004F7602: push 0042728Ch
  '004F7607: push esi
  '004F7608: push eax
  '004F7609: call ebx
  '004F760B: cmp word ptr [esp+12h], 0000h
  '004F7611: jz 004F8297h
  '004F7617: cmp word ptr [esi+00000120h], FFFFh
  '004F761F: jnz 4F7650h
  '004F7621: mov ebp, [00401034h]
  '004F7627: push 000000E6h
  '004F762C: push 000000AAh
  '004F7631: push 0000008Ch
  '004F7636: call ebp
  '004F7638: push 00000047h
  '004F763A: push 00000099h
  '004F763F: push 000000E1h
  '004F7644: mov [esp+28h], eax
  '004F7648: call ebp
  '004F764A: mov [esp+24h], eax
  '004F764E: jmp 4F7664h
  '004F7650: mov ecx, [esi+00000124h]
  '004F7656: mov edx, [esi+00000128h]
  '004F765C: mov [esp+1Ch], ecx
  '004F7660: mov [esp+24h], edx
  '004F7664: mov al, [esp+40h]
  '004F7668: test al, al
  '004F766A: jnz 004F7E45h
  '004F7670: fild dword ptr [esi+44h]
  '004F7673: lea ecx, [esp+14h]
  '004F7677: push ecx
  '004F7678: push edi
  '004F7679: fstp real8 ptr [esp+30h]
  '004F767D: fld real8 ptr [00405A48h]
  '004F7683: cmp [00541000h], 00000000h
  '004F768A: jnz 4F7692h
  '004F768C: fdiv real8 ptr [esp+30h]
  '004F7690: jmp 4F769Fh
  '004F7692: push [esp+34h]
  '004F7696: push [esp+34h]
  '004F769A: call 004081D4h
  '004F769F: push esi
  '004F76A0: fstp real4 ptr [esp+48h]
  '004F76A4: fstsw ax
  '004F76A6: test al, 0Dh
  '004F76A8: jnz 004F84DFh
  '004F76AE: mov eax, [esi]
  '004F76B0: call [eax+00000918h]
  '004F76B6: mov edx, [esi]
  '004F76B8: lea eax, [esp+18h]
  '004F76BC: mov ecx, [esp+14h]
  '004F76C0: push eax
  '004F76C1: push 00000030h
  '004F76C3: push ecx
  '004F76C4: push esi
  '004F76C5: call [edx+0000091Ch]
  '004F76CB: mov eax, [esi+44h]
  '004F76CE: mov ebp, [esp+18h]
  '004F76D2: mov edi, 00000001h
  '004F76D7: mov [esp+28h], eax
  '004F76DB: cmp eax, edi
  '004F76DD: mov [esp+40h], edi
  '004F76E1: jl 4F7750h
  '004F76E3: fld real4 ptr [esp+3Ch]
  '004F76E7: fchs 
  '004F76E9: fstsw ax
  '004F76EB: test al, 0Dh
  '004F76ED: jnz 004F84DFh
  '004F76F3: fild dword ptr [esp+40h]
  '004F76F7: mov ebx, [esi]
  '004F76F9: lea edx, [esp+14h]
  '004F76FD: push edx
  '004F76FE: fstp real8 ptr [esp+34h]
  '004F7702: fmul real8 ptr [esp+34h]
  '004F7706: fstsw ax
  '004F7708: test al, 0Dh
  '004F770A: jnz 004F84DFh
  '004F7710: call [0040135Ch]
  '004F7716: push eax
  '004F7717: push ebp
  '004F7718: push esi
  '004F7719: call [ebx+0000091Ch]
  '004F771F: mov edx, [esi+40h]
  '004F7722: mov eax, [esi]
  '004F7724: mov ecx, [esp+14h]
  '004F7728: push ecx
  '004F7729: push edi
  '004F772A: push edx
  '004F772B: push edi
  '004F772C: push 00000000h
  '004F772E: push esi
  '004F772F: call [eax+00000920h]
  '004F7735: add edi, 00000001h
  '004F7738: mov eax, [esp+28h]
  '004F773C: jo 004F84E4h
  '004F7742: cmp edi, eax
  '004F7744: mov [esp+40h], edi
  '004F7748: jle 4F76E3h
  '004F774A: mov ebx, [004010A0h]
  '004F7750: mov eax, [esi]
  '004F7752: lea ecx, [esp+14h]
  '004F7756: push ecx
  '004F7757: push esi
  '004F7758: call [eax+000000D8h]
  '004F775E: test eax, eax
  '004F7760: fclex 
  '004F7762: jnl 4F7772h
  '004F7764: push 000000D8h
  '004F7769: push 0042725Ch
  '004F776E: push esi
  '004F776F: push eax
  '004F7770: call ebx
  '004F7772: mov edx, [esp+14h]
  '004F7776: mov eax, [esi]
  '004F7778: lea ecx, [esp+12h]
  '004F777C: mov [esp+18h], edx
  '004F7780: mov edx, [esi+44h]
  '004F7783: push ecx
  '004F7784: mov ecx, [esi+40h]
  '004F7787: push 80000015h
  '004F778C: push edx
  '004F778D: push ecx
  '004F778E: push 00000000h
  '004F7790: lea edx, [esp+2Ch]
  '004F7794: push 00000000h
  '004F7796: push edx
  '004F7797: push esi
  '004F7798: mov byte ptr [esp+32h], 00h
  '004F779D: call [eax+00000924h]
  '004F77A3: mov eax, [esi]
  '004F77A5: lea ecx, [esp+14h]
  '004F77A9: push ecx
  '004F77AA: push esi
  '004F77AB: call [eax+000000D8h]
  '004F77B1: test eax, eax
  '004F77B3: fclex 
  '004F77B5: jnl 4F77C5h
  '004F77B7: push 000000D8h
  '004F77BC: push 0042725Ch
  '004F77C1: push esi
  '004F77C2: push eax
  '004F77C3: call ebx
  '004F77C5: mov edx, [esp+14h]
  '004F77C9: push 80000015h
  '004F77CE: push 00000001h
  '004F77D0: push 00000001h
  '004F77D2: push edx
  '004F77D3: call 00427424h
  '004F77D8: mov edi, [0040109Ch]
  '004F77DE: call edi
  '004F77E0: mov eax, [esi]
  '004F77E2: lea ecx, [esp+14h]
  '004F77E6: push ecx
  '004F77E7: push esi
  '004F77E8: call [eax+000000D8h]
  '004F77EE: test eax, eax
  '004F77F0: fclex 
  '004F77F2: jnl 4F7802h
  '004F77F4: push 000000D8h
  '004F77F9: push 0042725Ch
  '004F77FE: push esi
  '004F77FF: push eax
  '004F7800: call ebx
  '004F7802: mov edx, [esi+44h]
  '004F7805: mov eax, [esp+14h]
  '004F7809: sub edx, 00000002h
  '004F780C: push 80000015h
  '004F7811: jo 004F84E4h
  '004F7817: push edx
  '004F7818: push 00000001h
  '004F781A: push eax
  '004F781B: call 00427424h
  '004F7820: call edi
  '004F7822: mov ecx, [esi]
  '004F7824: lea edx, [esp+14h]
  '004F7828: push edx
  '004F7829: push esi
  '004F782A: call [ecx+000000D8h]
  '004F7830: test eax, eax
  '004F7832: fclex 
  '004F7834: jnl 4F7844h
  '004F7836: push 000000D8h
  '004F783B: push 0042725Ch
  '004F7840: push esi
  '004F7841: push eax
  '004F7842: call ebx
  '004F7844: mov eax, [esi+40h]
  '004F7847: mov ecx, [esp+14h]
  '004F784B: sub eax, 00000002h
  '004F784E: push 80000015h
  '004F7853: push 00000001h
  '004F7855: jo 004F84E4h
  '004F785B: push eax
  '004F785C: push ecx
  '004F785D: call 00427424h
  '004F7862: call edi
  '004F7864: mov edx, [esi]
  '004F7866: lea eax, [esp+14h]
  '004F786A: push eax
  '004F786B: push esi
  '004F786C: call [edx+000000D8h]
  '004F7872: test eax, eax
  '004F7874: fclex 
  '004F7876: jnl 4F7886h
  '004F7878: push 000000D8h
  '004F787D: push 0042725Ch
  '004F7882: push esi
  '004F7883: push eax
  '004F7884: call ebx
  '004F7886: mov ecx, [esi+44h]
  '004F7889: mov edx, [esi+40h]
  '004F788C: mov eax, [esp+14h]
  '004F7890: sub ecx, 00000002h
  '004F7893: jo 004F84E4h
  '004F7899: sub edx, 00000002h
  '004F789C: push 80000015h
  '004F78A1: push ecx
  '004F78A2: jo 004F84E4h
  '004F78A8: push edx
  '004F78A9: push eax
  '004F78AA: call 00427424h
  '004F78AF: call edi
  '004F78B1: cmp byte ptr [esi+000000E8h], 01h
  '004F78B8: jnz 004F7ABFh
  '004F78BE: mov ecx, [esi]
  '004F78C0: lea edx, [esp+14h]
  '004F78C4: push edx
  '004F78C5: push esi
  '004F78C6: call [ecx+000000D8h]
  '004F78CC: test eax, eax
  '004F78CE: fclex 
  '004F78D0: jnl 4F78E0h
  '004F78D2: push 000000D8h
  '004F78D7: push 0042725Ch
  '004F78DC: push esi
  '004F78DD: push eax
  '004F78DE: call ebx
  '004F78E0: mov eax, [esp+14h]
  '004F78E4: lea edx, [esp+12h]
  '004F78E8: mov [esp+18h], eax
  '004F78EC: mov eax, [esp+1Ch]
  '004F78F0: push edx
  '004F78F1: mov edx, [esi+44h]
  '004F78F4: push eax
  '004F78F5: mov eax, [esi+40h]
  '004F78F8: sub edx, 00000002h
  '004F78FB: mov ecx, [esi]
  '004F78FD: jo 004F84E4h
  '004F7903: sub eax, 00000001h
  '004F7906: push edx
  '004F7907: jo 004F84E4h
  '004F790D: push eax
  '004F790E: push 00000002h
  '004F7910: lea edx, [esp+2Ch]
  '004F7914: push 00000001h
  '004F7916: push edx
  '004F7917: push esi
  '004F7918: mov byte ptr [esp+32h], 00h
  '004F791D: call [ecx+00000924h]
  '004F7923: mov eax, [esi]
  '004F7925: lea ecx, [esp+14h]
  '004F7929: lea edx, [esp+1Ch]
  '004F792D: push ecx
  '004F792E: push edx
  '004F792F: push esi
  '004F7930: call [eax+00000918h]
  '004F7936: mov eax, [esi]
  '004F7938: lea ecx, [esp+18h]
  '004F793C: mov edx, [esp+14h]
  '004F7940: push ecx
  '004F7941: push FFFFFFDFh
  '004F7943: push edx
  '004F7944: push esi
  '004F7945: call [eax+0000091Ch]
  '004F794B: mov eax, [esi+44h]
  '004F794E: mov ecx, [esi]
  '004F7950: mov edx, [esp+18h]
  '004F7954: push edx
  '004F7955: mov edx, eax
  '004F7957: sub edx, 00000002h
  '004F795A: jo 004F84E4h
  '004F7960: push edx
  '004F7961: mov edx, [esi+40h]
  '004F7964: sub edx, 00000002h
  '004F7967: jo 004F84E4h
  '004F796D: sub eax, 00000002h
  '004F7970: push edx
  '004F7971: jo 004F84E4h
  '004F7977: push eax
  '004F7978: push 00000002h
  '004F797A: push esi
  '004F797B: call [ecx+00000920h]
  '004F7981: mov eax, [esi]
  '004F7983: lea ecx, [esp+14h]
  '004F7987: lea edx, [esp+1Ch]
  '004F798B: push ecx
  '004F798C: push edx
  '004F798D: push esi
  '004F798E: call [eax+00000918h]
  '004F7994: mov eax, [esi]
  '004F7996: lea ecx, [esp+18h]
  '004F799A: mov edx, [esp+14h]
  '004F799E: push ecx
  '004F799F: push 00000041h
  '004F79A1: push edx
  '004F79A2: push esi
  '004F79A3: call [eax+0000091Ch]
  '004F79A9: mov edx, [esi+40h]
  '004F79AC: mov eax, [esi]
  '004F79AE: mov ecx, [esp+18h]
  '004F79B2: sub edx, 00000002h
  '004F79B5: push ecx
  '004F79B6: push 00000001h
  '004F79B8: jo 004F84E4h
  '004F79BE: push edx
  '004F79BF: push 00000001h
  '004F79C1: push 00000002h
  '004F79C3: push esi
  '004F79C4: call [eax+00000920h]
  '004F79CA: mov eax, [esi]
  '004F79CC: lea ecx, [esp+14h]
  '004F79D0: lea edx, [esp+1Ch]
  '004F79D4: push ecx
  '004F79D5: push edx
  '004F79D6: push esi
  '004F79D7: call [eax+00000918h]
  '004F79DD: mov eax, [esi]
  '004F79DF: lea ecx, [esp+18h]
  '004F79E3: mov edx, [esp+14h]
  '004F79E7: push ecx
  '004F79E8: push 00000032h
  '004F79EA: push edx
  '004F79EB: push esi
  '004F79EC: call [eax+0000091Ch]
  '004F79F2: mov edx, [esi+40h]
  '004F79F5: mov eax, [esi]
  '004F79F7: mov ecx, [esp+18h]
  '004F79FB: sub edx, 00000001h
  '004F79FE: push ecx
  '004F79FF: push 00000002h
  '004F7A01: jo 004F84E4h
  '004F7A07: push edx
  '004F7A08: push 00000002h
  '004F7A0A: push 00000001h
  '004F7A0C: push esi
  '004F7A0D: call [eax+00000920h]
  '004F7A13: mov eax, [esi]
  '004F7A15: lea ecx, [esp+14h]
  '004F7A19: lea edx, [esp+1Ch]
  '004F7A1D: push ecx
  '004F7A1E: push edx
  '004F7A1F: push esi
  '004F7A20: call [eax+00000918h]
  '004F7A26: mov eax, [esi]
  '004F7A28: lea ecx, [esp+18h]
  '004F7A2C: mov edx, [esp+14h]
  '004F7A30: push ecx
  '004F7A31: push 0000001Fh
  '004F7A33: push edx
  '004F7A34: push esi
  '004F7A35: call [eax+0000091Ch]
  '004F7A3B: mov edx, [esi+44h]
  '004F7A3E: mov eax, [esi]
  '004F7A40: mov ecx, [esp+18h]
  '004F7A44: sub edx, 00000003h
  '004F7A47: push ecx
  '004F7A48: jo 004F84E4h
  '004F7A4E: push edx
  '004F7A4F: push 00000002h
  '004F7A51: push 00000003h
  '004F7A53: push 00000002h
  '004F7A55: push esi
  '004F7A56: call [eax+00000920h]
  '004F7A5C: mov eax, [esi]
  '004F7A5E: lea ecx, [esp+14h]
  '004F7A62: lea edx, [esp+1Ch]
  '004F7A66: push ecx
  '004F7A67: push edx
  '004F7A68: push esi
  '004F7A69: call [eax+00000918h]
  '004F7A6F: mov eax, [esi]
  '004F7A71: lea ecx, [esp+18h]
  '004F7A75: mov edx, [esp+14h]
  '004F7A79: push ecx
  '004F7A7A: push 0000001Fh
  '004F7A7C: push edx
  '004F7A7D: push esi
  '004F7A7E: call [eax+0000091Ch]
  '004F7A84: mov eax, [esi+40h]
  '004F7A87: mov ecx, [esi]
  '004F7A89: mov edx, [esp+18h]
  '004F7A8D: push edx
  '004F7A8E: mov edx, [esi+44h]
  '004F7A91: sub edx, 00000003h
  '004F7A94: jo 004F84E4h
  '004F7A9A: push edx
  '004F7A9B: mov edx, eax
  '004F7A9D: sub edx, 00000003h
  '004F7AA0: jo 004F84E4h
  '004F7AA6: sub eax, 00000003h
  '004F7AA9: push edx
  '004F7AAA: push 00000003h
  '004F7AAC: jo 004F84E4h
  '004F7AB2: push eax
  '004F7AB3: push esi
  '004F7AB4: call [ecx+00000920h]
  '004F7ABA: jmp 004F7CA3h
  '004F7ABF: mov eax, [esi]
  '004F7AC1: lea ecx, [esp+14h]
  '004F7AC5: push ecx
  '004F7AC6: push FFFFFFD0h
  '004F7AC8: push ebp
  '004F7AC9: push esi
  '004F7ACA: call [eax+0000091Ch]
  '004F7AD0: mov eax, [esi+44h]
  '004F7AD3: mov edx, [esi]
  '004F7AD5: mov ecx, [esp+14h]
  '004F7AD9: push ecx
  '004F7ADA: mov ecx, eax
  '004F7ADC: sub ecx, 00000002h
  '004F7ADF: jo 004F84E4h
  '004F7AE5: push ecx
  '004F7AE6: mov ecx, [esi+40h]
  '004F7AE9: sub ecx, 00000002h
  '004F7AEC: jo 004F84E4h
  '004F7AF2: sub eax, 00000002h
  '004F7AF5: push ecx
  '004F7AF6: jo 004F84E4h
  '004F7AFC: push eax
  '004F7AFD: push 00000002h
  '004F7AFF: push esi
  '004F7B00: call [edx+00000920h]
  '004F7B06: mov edx, [esi]
  '004F7B08: lea eax, [esp+14h]
  '004F7B0C: push eax
  '004F7B0D: push FFFFFFE0h
  '004F7B0F: push ebp
  '004F7B10: push esi
  '004F7B11: call [edx+0000091Ch]
  '004F7B17: mov eax, [esi+44h]
  '004F7B1A: mov ecx, [esi]
  '004F7B1C: mov edx, [esp+14h]
  '004F7B20: push edx
  '004F7B21: mov edx, eax
  '004F7B23: sub edx, 00000003h
  '004F7B26: jo 004F84E4h
  '004F7B2C: push edx
  '004F7B2D: mov edx, [esi+40h]
  '004F7B30: sub edx, 00000002h
  '004F7B33: jo 004F84E4h
  '004F7B39: sub eax, 00000003h
  '004F7B3C: push edx
  '004F7B3D: jo 004F84E4h
  '004F7B43: push eax
  '004F7B44: push 00000001h
  '004F7B46: push esi
  '004F7B47: call [ecx+00000920h]
  '004F7B4D: mov eax, [esi]
  '004F7B4F: lea ecx, [esp+14h]
  '004F7B53: push ecx
  '004F7B54: push FFFFFFDCh
  '004F7B56: push ebp
  '004F7B57: push esi
  '004F7B58: call [eax+0000091Ch]
  '004F7B5E: mov eax, [esi+40h]
  '004F7B61: mov edx, [esi]
  '004F7B63: mov ecx, [esp+14h]
  '004F7B67: push ecx
  '004F7B68: mov ecx, [esi+44h]
  '004F7B6B: sub ecx, 00000002h
  '004F7B6E: jo 004F84E4h
  '004F7B74: push ecx
  '004F7B75: mov ecx, eax
  '004F7B77: sub ecx, 00000002h
  '004F7B7A: jo 004F84E4h
  '004F7B80: sub eax, 00000002h
  '004F7B83: push ecx
  '004F7B84: push 00000002h
  '004F7B86: jo 004F84E4h
  '004F7B8C: push eax
  '004F7B8D: push esi
  '004F7B8E: call [edx+00000920h]
  '004F7B94: mov edx, [esi]
  '004F7B96: lea eax, [esp+14h]
  '004F7B9A: push eax
  '004F7B9B: push FFFFFFE8h
  '004F7B9D: push ebp
  '004F7B9E: push esi
  '004F7B9F: call [edx+0000091Ch]
  '004F7BA5: mov eax, [esi+40h]
  '004F7BA8: mov ecx, [esi]
  '004F7BAA: mov edx, [esp+14h]
  '004F7BAE: push edx
  '004F7BAF: mov edx, [esi+44h]
  '004F7BB2: sub edx, 00000003h
  '004F7BB5: jo 004F84E4h
  '004F7BBB: push edx
  '004F7BBC: mov edx, eax
  '004F7BBE: sub edx, 00000003h
  '004F7BC1: jo 004F84E4h
  '004F7BC7: sub eax, 00000003h
  '004F7BCA: push edx
  '004F7BCB: push 00000003h
  '004F7BCD: jo 004F84E4h
  '004F7BD3: push eax
  '004F7BD4: push esi
  '004F7BD5: call [ecx+00000920h]
  '004F7BDB: mov eax, [esi]
  '004F7BDD: lea ecx, [esp+14h]
  '004F7BE1: push ecx
  '004F7BE2: push 00000010h
  '004F7BE4: push ebp
  '004F7BE5: push esi
  '004F7BE6: call [eax+0000091Ch]
  '004F7BEC: mov ecx, [esi+40h]
  '004F7BEF: mov edx, [esi]
  '004F7BF1: mov eax, [esp+14h]
  '004F7BF5: sub ecx, 00000002h
  '004F7BF8: push eax
  '004F7BF9: push 00000001h
  '004F7BFB: jo 004F84E4h
  '004F7C01: push ecx
  '004F7C02: push 00000001h
  '004F7C04: push 00000002h
  '004F7C06: push esi
  '004F7C07: call [edx+00000920h]
  '004F7C0D: mov edx, [esi]
  '004F7C0F: lea eax, [esp+14h]
  '004F7C13: push eax
  '004F7C14: push 0000000Ah
  '004F7C16: push ebp
  '004F7C17: push esi
  '004F7C18: call [edx+0000091Ch]
  '004F7C1E: mov eax, [esi+40h]
  '004F7C21: mov ecx, [esi]
  '004F7C23: mov edx, [esp+14h]
  '004F7C27: sub eax, 00000002h
  '004F7C2A: push edx
  '004F7C2B: push 00000002h
  '004F7C2D: jo 004F84E4h
  '004F7C33: push eax
  '004F7C34: push 00000002h
  '004F7C36: push 00000001h
  '004F7C38: push esi
  '004F7C39: call [ecx+00000920h]
  '004F7C3F: mov ecx, [esi]
  '004F7C41: lea edx, [esp+14h]
  '004F7C45: push edx
  '004F7C46: push FFFFFFFBh
  '004F7C48: push ebp
  '004F7C49: push esi
  '004F7C4A: call [ecx+0000091Ch]
  '004F7C50: mov edx, [esi+44h]
  '004F7C53: mov eax, [esi]
  '004F7C55: mov ecx, [esp+14h]
  '004F7C59: sub edx, 00000002h
  '004F7C5C: push ecx
  '004F7C5D: jo 004F84E4h
  '004F7C63: push edx
  '004F7C64: push 00000001h
  '004F7C66: push 00000002h
  '004F7C68: push 00000001h
  '004F7C6A: push esi
  '004F7C6B: call [eax+00000920h]
  '004F7C71: mov eax, [esi]
  '004F7C73: lea ecx, [esp+14h]
  '004F7C77: push ecx
  '004F7C78: push FFFFFFF6h
  '004F7C7A: push ebp
  '004F7C7B: push esi
  '004F7C7C: call [eax+0000091Ch]
  '004F7C82: mov ecx, [esi+44h]
  '004F7C85: mov edx, [esi]
  '004F7C87: mov eax, [esp+14h]
  '004F7C8B: sub ecx, 00000003h
  '004F7C8E: push eax
  '004F7C8F: jo 004F84E4h
  '004F7C95: push ecx
  '004F7C96: push 00000002h
  '004F7C98: push 00000003h
  '004F7C9A: push 00000002h
  '004F7C9C: push esi
  '004F7C9D: call [edx+00000920h]
  '004F7CA3: mov edx, [esp+44h]
  '004F7CA7: cmp byte ptr [edx], 01h
  '004F7CAA: jnz 004F84D3h
  '004F7CB0: mov eax, [esi]
  '004F7CB2: lea ecx, [esp+14h]
  '004F7CB6: push ecx
  '004F7CB7: push esi
  '004F7CB8: call [eax+000000D8h]
  '004F7CBE: test eax, eax
  '004F7CC0: fclex 
  '004F7CC2: jnl 4F7CD2h
  '004F7CC4: push 000000D8h
  '004F7CC9: push 0042725Ch
  '004F7CCE: push esi
  '004F7CCF: push eax
  '004F7CD0: call ebx
  '004F7CD2: mov edx, [esp+14h]
  '004F7CD6: mov edi, [esp+24h]
  '004F7CDA: mov [esp+18h], edx
  '004F7CDE: mov edx, [esi+44h]
  '004F7CE1: lea ecx, [esp+12h]
  '004F7CE5: sub edx, 00000002h
  '004F7CE8: push ecx
  '004F7CE9: mov ecx, [esi+40h]
  '004F7CEC: mov eax, [esi]
  '004F7CEE: push edi
  '004F7CEF: jo 004F84E4h
  '004F7CF5: sub ecx, 00000001h
  '004F7CF8: push edx
  '004F7CF9: jo 004F84E4h
  '004F7CFF: push ecx
  '004F7D00: push 00000002h
  '004F7D02: lea edx, [esp+2Ch]
  '004F7D06: push 00000001h
  '004F7D08: push edx
  '004F7D09: push esi
  '004F7D0A: mov byte ptr [esp+32h], 00h
  '004F7D0F: call [eax+00000924h]
  '004F7D15: mov eax, [esi]
  '004F7D17: lea ecx, [esp+14h]
  '004F7D1B: push ecx
  '004F7D1C: push FFFFFFD8h
  '004F7D1E: push edi
  '004F7D1F: push esi
  '004F7D20: call [eax+0000091Ch]
  '004F7D26: mov eax, [esi+44h]
  '004F7D29: mov edx, [esi]
  '004F7D2B: mov ecx, [esp+14h]
  '004F7D2F: push ecx
  '004F7D30: mov ecx, eax
  '004F7D32: sub ecx, 00000002h
  '004F7D35: jo 004F84E4h
  '004F7D3B: push ecx
  '004F7D3C: mov ecx, [esi+40h]
  '004F7D3F: sub ecx, 00000002h
  '004F7D42: jo 004F84E4h
  '004F7D48: sub eax, 00000002h
  '004F7D4B: push ecx
  '004F7D4C: jo 004F84E4h
  '004F7D52: push eax
  '004F7D53: push 00000002h
  '004F7D55: push esi
  '004F7D56: call [edx+00000920h]
  '004F7D5C: mov edx, [esi]
  '004F7D5E: lea eax, [esp+14h]
  '004F7D62: push eax
  '004F7D63: push 0000005Ah
  '004F7D65: push edi
  '004F7D66: push esi
  '004F7D67: call [edx+0000091Ch]
  '004F7D6D: mov eax, [esi+40h]
  '004F7D70: mov ecx, [esi]
  '004F7D72: mov edx, [esp+14h]
  '004F7D76: sub eax, 00000002h
  '004F7D79: push edx
  '004F7D7A: push 00000001h
  '004F7D7C: jo 004F84E4h
  '004F7D82: push eax
  '004F7D83: push 00000001h
  '004F7D85: push 00000002h
  '004F7D87: push esi
  '004F7D88: call [ecx+00000920h]
  '004F7D8E: mov ecx, [esi]
  '004F7D90: lea edx, [esp+14h]
  '004F7D94: push edx
  '004F7D95: push 00000023h
  '004F7D97: push edi
  '004F7D98: push esi
  '004F7D99: call [ecx+0000091Ch]
  '004F7D9F: mov edx, [esi+40h]
  '004F7DA2: mov eax, [esi]
  '004F7DA4: mov ecx, [esp+14h]
  '004F7DA8: sub edx, 00000001h
  '004F7DAB: push ecx
  '004F7DAC: push 00000002h
  '004F7DAE: jo 004F84E4h
  '004F7DB4: push edx
  '004F7DB5: push 00000002h
  '004F7DB7: push 00000001h
  '004F7DB9: push esi
  '004F7DBA: call [eax+00000920h]
  '004F7DC0: mov eax, [esi]
  '004F7DC2: lea ecx, [esp+14h]
  '004F7DC6: push ecx
  '004F7DC7: push 00000014h
  '004F7DC9: push edi
  '004F7DCA: push esi
  '004F7DCB: call [eax+0000091Ch]
  '004F7DD1: mov ecx, [esi+44h]
  '004F7DD4: mov edx, [esi]
  '004F7DD6: mov eax, [esp+14h]
  '004F7DDA: sub ecx, 00000003h
  '004F7DDD: push eax
  '004F7DDE: jo 004F84E4h
  '004F7DE4: push ecx
  '004F7DE5: push 00000002h
  '004F7DE7: push 00000003h
  '004F7DE9: push 00000002h
  '004F7DEB: push esi
  '004F7DEC: call [edx+00000920h]
  '004F7DF2: mov edx, [esi]
  '004F7DF4: lea eax, [esp+14h]
  '004F7DF8: push eax
  '004F7DF9: push 00000014h
  '004F7DFB: push edi
  '004F7DFC: push esi
  '004F7DFD: call [edx+0000091Ch]
  '004F7E03: mov eax, [esi+40h]
  '004F7E06: mov ecx, [esi]
  '004F7E08: mov edx, [esp+14h]
  '004F7E0C: push edx
  '004F7E0D: mov edx, [esi+44h]
  '004F7E10: sub edx, 00000003h
  '004F7E13: jo 004F84E4h
  '004F7E19: push edx
  '004F7E1A: mov edx, eax
  '004F7E1C: sub edx, 00000003h
  '004F7E1F: jo 004F84E4h
  '004F7E25: sub eax, 00000003h
  '004F7E28: push edx
  '004F7E29: push 00000003h
  '004F7E2B: jo 004F84E4h
  '004F7E31: push eax
  '004F7E32: push esi
  '004F7E33: call [ecx+00000920h]
  '004F7E39: pop edi
  '004F7E3A: pop esi
  '004F7E3B: pop ebp
  '004F7E3C: xor eax, eax
  '004F7E3E: pop ebx
  '004F7E3F: add esp, 00000028h
  '004F7E42: retn 000Ch
End Sub
Private Sub XPColor_Hover_4F84F0
  '004F84F0: push ecx
  '004F84F1: push ebx
  '004F84F2: push ebp
  '004F84F3: push esi
  '004F84F4: push edi
  '004F84F5: mov edi, [esp+18h]
  '004F84F9: mov [esp+10h], 00000000h
  '004F8501: mov eax, [edi+3Ch]
  '004F8504: push eax
  '004F8505: call 00420C34h
  '004F850A: mov esi, [0040109Ch]
  '004F8510: call esi
  '004F8512: mov ecx, [edi+44h]
  '004F8515: mov edx, [edi+40h]
  '004F8518: push ecx
  '004F8519: push edx
  '004F851A: push 00000000h
  '004F851C: push 00000000h
  '004F851E: call 0042746Ch
  '004F8523: mov [esp+10h], eax
  '004F8527: call esi
  '004F8529: mov eax, [esp+10h]
  '004F852D: push 00000000h
  '004F852F: push 00000000h
  '004F8531: push 00000000h
  '004F8533: push 00000000h
  '004F8535: mov [edi+3Ch], eax
  '004F8538: call 0042746Ch
  '004F853D: mov [esp+10h], eax
  '004F8541: call esi
  '004F8543: mov ebx, [esp+10h]
  '004F8547: push 00000001h
  '004F8549: push 00000002h
  '004F854B: push 00000000h
  '004F854D: push 00000000h
  '004F854F: call 0042746Ch
  '004F8554: mov [esp+10h], eax
  '004F8558: call esi
  '004F855A: mov eax, [esp+10h]
  '004F855E: mov ecx, [edi+3Ch]
  '004F8561: push 00000004h
  '004F8563: push eax
  '004F8564: push ecx
  '004F8565: push ebx
  '004F8566: mov ebp, eax
  '004F8568: call 004274B0h
  '004F856D: call esi
  '004F856F: push ebp
  '004F8570: call 00420C34h
  '004F8575: call esi
  '004F8577: mov eax, [edi+44h]
  '004F857A: mov edx, eax
  '004F857C: sub edx, 00000001h
  '004F857F: jo 004F8779h
  '004F8585: push edx
  '004F8586: push 00000002h
  '004F8588: push eax
  '004F8589: push 00000000h
  '004F858B: call 0042746Ch
  '004F8590: mov [esp+10h], eax
  '004F8594: call esi
  '004F8596: mov eax, [esp+10h]
  '004F859A: push 00000004h
  '004F859C: mov ebp, eax
  '004F859E: push eax
  '004F859F: mov eax, [edi+3Ch]
  '004F85A2: push ebx
  '004F85A3: push eax
  '004F85A4: call 004274B0h
  '004F85A9: call esi
  '004F85AB: push ebp
  '004F85AC: call 00420C34h
  '004F85B1: call esi
  '004F85B3: mov eax, [edi+40h]
  '004F85B6: push 00000001h
  '004F85B8: mov ecx, eax
  '004F85BA: sub ecx, 00000002h
  '004F85BD: jo 004F8779h
  '004F85C3: push ecx
  '004F85C4: push 00000000h
  '004F85C6: push eax
  '004F85C7: call 0042746Ch
  '004F85CC: mov [esp+10h], eax
  '004F85D0: call esi
  '004F85D2: mov eax, [esp+10h]
  '004F85D6: mov edx, [edi+3Ch]
  '004F85D9: push 00000004h
  '004F85DB: push eax
  '004F85DC: push edx
  '004F85DD: push ebx
  '004F85DE: mov ebp, eax
  '004F85E0: call 004274B0h
  '004F85E5: call esi
  '004F85E7: push ebp
  '004F85E8: call 00420C34h
  '004F85ED: call esi
  '004F85EF: mov eax, [edi+44h]
  '004F85F2: mov ecx, [edi+40h]
  '004F85F5: mov edx, eax
  '004F85F7: sub edx, 00000001h
  '004F85FA: jo 004F8779h
  '004F8600: push edx
  '004F8601: mov edx, ecx
  '004F8603: sub edx, 00000002h
  '004F8606: jo 004F8779h
  '004F860C: push edx
  '004F860D: push eax
  '004F860E: push ecx
  '004F860F: call 0042746Ch
  '004F8614: mov [esp+10h], eax
  '004F8618: call esi
  '004F861A: mov eax, [esp+10h]
  '004F861E: push 00000004h
  '004F8620: mov ebp, eax
  '004F8622: push eax
  '004F8623: mov eax, [edi+3Ch]
  '004F8626: push ebx
  '004F8627: push eax
  '004F8628: call 004274B0h
  '004F862D: call esi
  '004F862F: push ebp
  '004F8630: call 00420C34h
  '004F8635: call esi
  '004F8637: push 00000002h
  '004F8639: push 00000001h
  '004F863B: push 00000001h
  '004F863D: push 00000000h
  '004F863F: call 0042746Ch
  '004F8644: mov [esp+10h], eax
  '004F8648: call esi
  '004F864A: mov eax, [esp+10h]
  '004F864E: mov ecx, [edi+3Ch]
  '004F8651: push 00000004h
  '004F8653: push eax
  '004F8654: push ecx
  '004F8655: push ebx
  '004F8656: mov ebp, eax
  '004F8658: call 004274B0h
  '004F865D: call esi
  '004F865F: push ebp
  '004F8660: call 00420C34h
  '004F8665: call esi
  '004F8667: mov eax, [edi+44h]
  '004F866A: mov edx, eax
  '004F866C: sub edx, 00000002h
  '004F866F: jo 004F8779h
  '004F8675: sub eax, 00000001h
  '004F8678: push edx
  '004F8679: push 00000001h
  '004F867B: jo 004F8779h
  '004F8681: push eax
  '004F8682: push 00000000h
  '004F8684: call 0042746Ch
  '004F8689: mov [esp+10h], eax
  '004F868D: call esi
  '004F868F: mov eax, [esp+10h]
  '004F8693: push 00000004h
  '004F8695: mov ebp, eax
  '004F8697: push eax
  '004F8698: mov eax, [edi+3Ch]
  '004F869B: push ebx
  '004F869C: push eax
  '004F869D: call 004274B0h
  '004F86A2: call esi
  '004F86A4: push ebp
  '004F86A5: call 00420C34h
  '004F86AA: call esi
  '004F86AC: mov eax, [edi+40h]
  '004F86AF: push 00000002h
  '004F86B1: mov ecx, eax
  '004F86B3: sub ecx, 00000001h
  '004F86B6: jo 004F8779h
  '004F86BC: push ecx
  '004F86BD: push 00000001h
  '004F86BF: push eax
  '004F86C0: call 0042746Ch
  '004F86C5: mov [esp+10h], eax
  '004F86C9: call esi
  '004F86CB: mov eax, [esp+10h]
  '004F86CF: mov edx, [edi+3Ch]
  '004F86D2: push 00000004h
  '004F86D4: push eax
  '004F86D5: push edx
  '004F86D6: push ebx
  '004F86D7: mov ebp, eax
  '004F86D9: call 004274B0h
  '004F86DE: call esi
  '004F86E0: push ebp
  '004F86E1: call 00420C34h
  '004F86E6: call esi
  '004F86E8: mov eax, [edi+44h]
  '004F86EB: mov ecx, [edi+40h]
  '004F86EE: mov edx, eax
  '004F86F0: sub edx, 00000002h
  '004F86F3: jo 004F8779h
  '004F86F9: push edx
  '004F86FA: mov edx, ecx
  '004F86FC: sub edx, 00000001h
  '004F86FF: jo 4F8779h
  '004F8701: sub eax, 00000001h
  '004F8704: push edx
  '004F8705: jo 4F8779h
  '004F8707: push eax
  '004F8708: push ecx
  '004F8709: call 0042746Ch
  '004F870E: mov [esp+10h], eax
  '004F8712: call esi
  '004F8714: mov eax, [esp+10h]
  '004F8718: push 00000004h
  '004F871A: mov ebp, eax
  '004F871C: push eax
  '004F871D: mov eax, [edi+3Ch]
  '004F8720: push ebx
  '004F8721: push eax
  '004F8722: call 004274B0h
  '004F8727: call esi
  '004F8729: push ebp
  '004F872A: call 00420C34h
  '004F872F: call esi
  '004F8731: push ebx
  '004F8732: call 00420C34h
  '004F8737: call esi
  '004F8739: mov ecx, [edi]
  '004F873B: lea edx, [esp+10h]
  '004F873F: push edx
  '004F8740: push edi
  '004F8741: call [ecx+000007B8h]
  '004F8747: test eax, eax
  '004F8749: jnl 4F875Dh
  '004F874B: push 000007B8h
  '004F8750: push 0042728Ch
  '004F8755: push edi
  '004F8756: push eax
  '004F8757: call [004010A0h]
  '004F875D: mov eax, [edi+3Ch]
  '004F8760: mov ecx, [esp+10h]
  '004F8764: push FFFFFFFFh
  '004F8766: push eax
  '004F8767: push ecx
  '004F8768: call 004274E4h
  '004F876D: call esi
  '004F876F: pop edi
  '004F8770: pop esi
  '004F8771: pop ebp
  '004F8772: xor eax, eax
  '004F8774: pop ebx
  '004F8775: pop ecx
  '004F8776: retn 0004h
End Sub
Private Sub XPColor_Hover_4F8780
  '004F8780: sub esp, 00000024h
  '004F8783: mov eax, [esp+38h]
  '004F8787: mov edx, [esp+40h]
  '004F878B: push ebx
  '004F878C: push ebp
  '004F878D: mov eax, [eax]
  '004F878F: push esi
  '004F8790: mov esi, [esp+48h]
  '004F8794: push edi
  '004F8795: mov edi, [004011A8h]
  '004F879B: mov [esp+10h], eax
  '004F879F: mov ecx, [esi]
  '004F87A1: mov [esp+28h], ecx
  '004F87A5: mov ecx, [edx]
  '004F87A7: sub ecx, eax
  '004F87A9: jo 004F8AF8h
  '004F87AF: call edi
  '004F87B1: mov ebp, [esi]
  '004F87B3: mov ebx, eax
  '004F87B5: mov eax, [esp+54h]
  '004F87B9: mov ecx, [eax]
  '004F87BB: sub ecx, ebp
  '004F87BD: jo 004F8AF8h
  '004F87C3: call edi
  '004F87C5: mov ebp, [esp+40h]
  '004F87C9: mov edi, eax
  '004F87CB: mov ecx, [ebp]
  '004F87CE: push ecx
  '004F87CF: call 004275F8h
  '004F87D4: mov esi, [0040109Ch]
  '004F87DA: mov [esp+48h], eax
  '004F87DE: call esi
  '004F87E0: mov eax, [ebp]
  '004F87E3: mov edx, [esp+48h]
  '004F87E7: push eax
  '004F87E8: mov [esp+54h], edx
  '004F87EC: call 004275F8h
  '004F87F1: mov [esp+48h], eax
  '004F87F5: call esi
  '004F87F7: mov ecx, [esp+48h]
  '004F87FB: push 00000000h
  '004F87FD: movsx edi, di
  '004F8800: movsx ebx, bx
  '004F8803: push 00000001h
  '004F8805: push 00000001h
  '004F8807: push edi
  '004F8808: push ebx
  '004F8809: mov [esp+68h], ecx
  '004F880D: call 00427738h
  '004F8812: mov [esp+48h], eax
  '004F8816: call esi
  '004F8818: mov edx, [esp+48h]
  '004F881C: push 00000000h
  '004F881E: push 00000001h
  '004F8820: push 00000001h
  '004F8822: push edi
  '004F8823: push ebx
  '004F8824: mov [esp+60h], edx
  '004F8828: call 00427738h
  '004F882D: mov [esp+48h], eax
  '004F8831: call esi
  '004F8833: mov ecx, [esp+4Ch]
  '004F8837: mov edx, [esp+50h]
  '004F883B: mov eax, [esp+48h]
  '004F883F: push ecx
  '004F8840: push edx
  '004F8841: mov [esp+1Ch], eax
  '004F8845: call 00420BECh
  '004F884A: mov [esp+48h], eax
  '004F884E: call esi
  '004F8850: mov ecx, [esp+14h]
  '004F8854: mov edx, [esp+54h]
  '004F8858: mov eax, [esp+48h]
  '004F885C: push ecx
  '004F885D: push edx
  '004F885E: mov [esp+24h], eax
  '004F8862: call 00420BECh
  '004F8867: mov [esp+48h], eax
  '004F886B: call esi
  '004F886D: mov eax, [esp+48h]
  '004F8871: mov ecx, [ebp]
  '004F8874: mov [esp+20h], eax
  '004F8878: push ecx
  '004F8879: call 004275F8h
  '004F887E: mov ebp, eax
  '004F8880: call esi
  '004F8882: mov edx, [esp+40h]
  '004F8886: mov eax, [edx]
  '004F8888: push eax
  '004F8889: call 004275F8h
  '004F888E: mov [esp+48h], eax
  '004F8892: call esi
  '004F8894: mov edx, [esp+40h]
  '004F8898: mov ecx, [esp+48h]
  '004F889C: push edi
  '004F889D: push ebx
  '004F889E: mov eax, [edx]
  '004F88A0: mov [esp+54h], ecx
  '004F88A4: push eax
  '004F88A5: call 004276A8h
  '004F88AA: mov [esp+48h], eax
  '004F88AE: call esi
  '004F88B0: mov edx, [esp+40h]
  '004F88B4: mov ecx, [esp+48h]
  '004F88B8: push edi
  '004F88B9: push ebx
  '004F88BA: mov eax, [edx]
  '004F88BC: mov [esp+1Ch], ecx
  '004F88C0: push eax
  '004F88C1: call 004276A8h
  '004F88C6: mov [esp+48h], eax
  '004F88CA: call esi
  '004F88CC: mov edx, [esp+14h]
  '004F88D0: mov ecx, [esp+48h]
  '004F88D4: push edx
  '004F88D5: push ebp
  '004F88D6: mov [esp+20h], ecx
  '004F88DA: call 00420BECh
  '004F88DF: mov [esp+48h], eax
  '004F88E3: call esi
  '004F88E5: mov ecx, [esp+18h]
  '004F88E9: mov edx, [esp+4Ch]
  '004F88ED: mov eax, [esp+48h]
  '004F88F1: push ecx
  '004F88F2: push edx
  '004F88F3: mov [esp+1Ch], eax
  '004F88F7: call 00420BECh
  '004F88FC: mov [esp+48h], eax
  '004F8900: call esi
  '004F8902: mov eax, [esp+48h]
  '004F8906: mov ecx, [esp+60h]
  '004F890A: mov [esp+18h], eax
  '004F890E: mov eax, [esp+44h]
  '004F8912: mov edx, [ecx]
  '004F8914: mov ecx, [eax]
  '004F8916: push edx
  '004F8917: push ecx
  '004F8918: call 004275ACh
  '004F891D: mov [esp+48h], eax
  '004F8921: call esi
  '004F8923: mov edx, [esp+28h]
  '004F8927: mov ecx, [esp+44h]
  '004F892B: mov eax, [esp+10h]
  '004F892F: push 00CC0020h
  '004F8934: push edx
  '004F8935: mov edx, [ecx]
  '004F8937: push eax
  '004F8938: mov eax, [esp+5Ch]
  '004F893C: push edx
  '004F893D: push edi
  '004F893E: push ebx
  '004F893F: push 00000000h
  '004F8941: push 00000000h
  '004F8943: push eax
  '004F8944: call 00427568h
  '004F8949: call esi
  '004F894B: mov edx, [esp+44h]
  '004F894F: mov ecx, [esp+48h]
  '004F8953: push ecx
  '004F8954: mov eax, [edx]
  '004F8956: push eax
  '004F8957: call 004275ACh
  '004F895C: mov [esp+48h], eax
  '004F8960: call esi
  '004F8962: mov eax, [esp+50h]
  '004F8966: mov edx, [esp+60h]
  '004F896A: mov ecx, [esp+48h]
  '004F896E: push 00330008h
  '004F8973: push 00000000h
  '004F8975: push 00000000h
  '004F8977: push eax
  '004F8978: push edi
  '004F8979: mov [edx], ecx
  '004F897B: mov ecx, [esp+68h]
  '004F897F: push ebx
  '004F8980: push 00000000h
  '004F8982: push 00000000h
  '004F8984: push ecx
  '004F8985: call 00427568h
  '004F898A: call esi
  '004F898C: mov edx, [esp+5Ch]
  '004F8990: mov ecx, [esp+58h]
  '004F8994: push 00CC0020h
  '004F8999: mov eax, [edx]
  '004F899B: mov edx, [ecx]
  '004F899D: push eax
  '004F899E: mov eax, [esp+48h]
  '004F89A2: push edx
  '004F89A3: mov ecx, [eax]
  '004F89A5: push ecx
  '004F89A6: push edi
  '004F89A7: push ebx
  '004F89A8: push 00000000h
  '004F89AA: push 00000000h
  '004F89AC: push ebp
  '004F89AD: call 00427568h
  '004F89B2: call esi
  '004F89B4: mov edx, [esp+50h]
  '004F89B8: push 008800C6h
  '004F89BD: push 00000000h
  '004F89BF: push 00000000h
  '004F89C1: push edx
  '004F89C2: push edi
  '004F89C3: push ebx
  '004F89C4: push 00000000h
  '004F89C6: push 00000000h
  '004F89C8: push ebp
  '004F89C9: call 00427568h
  '004F89CE: call esi
  '004F89D0: mov eax, [esp+28h]
  '004F89D4: mov edx, [esp+44h]
  '004F89D8: mov ecx, [esp+10h]
  '004F89DC: push 00CC0020h
  '004F89E1: push eax
  '004F89E2: mov eax, [edx]
  '004F89E4: push ecx
  '004F89E5: mov ecx, [esp+58h]
  '004F89E9: push eax
  '004F89EA: push edi
  '004F89EB: push ebx
  '004F89EC: push 00000000h
  '004F89EE: push 00000000h
  '004F89F0: push ecx
  '004F89F1: call 00427568h
  '004F89F6: call esi
  '004F89F8: mov edx, [esp+54h]
  '004F89FC: mov eax, [esp+4Ch]
  '004F8A00: push 008800C6h
  '004F8A05: push 00000000h
  '004F8A07: push 00000000h
  '004F8A09: push edx
  '004F8A0A: push edi
  '004F8A0B: push ebx
  '004F8A0C: push 00000000h
  '004F8A0E: push 00000000h
  '004F8A10: push eax
  '004F8A11: call 00427568h
  '004F8A16: call esi
  '004F8A18: mov ecx, [esp+4Ch]
  '004F8A1C: push 00660046h
  '004F8A21: push 00000000h
  '004F8A23: push 00000000h
  '004F8A25: push ecx
  '004F8A26: push edi
  '004F8A27: push ebx
  '004F8A28: push 00000000h
  '004F8A2A: push 00000000h
  '004F8A2C: push ebp
  '004F8A2D: call 00427568h
  '004F8A32: call esi
  '004F8A34: mov edx, [esp+5Ch]
  '004F8A38: mov ecx, [esp+58h]
  '004F8A3C: push 00CC0020h
  '004F8A41: push 00000000h
  '004F8A43: mov eax, [edx]
  '004F8A45: mov edx, [ecx]
  '004F8A47: push 00000000h
  '004F8A49: push ebp
  '004F8A4A: push edi
  '004F8A4B: push ebx
  '004F8A4C: push eax
  '004F8A4D: mov eax, [esp+58h]
  '004F8A51: push edx
  '004F8A52: mov ecx, [eax]
  '004F8A54: push ecx
  '004F8A55: call 00427568h
  '004F8A5A: call esi
  '004F8A5C: mov edx, [esp+1Ch]
  '004F8A60: mov ebx, [esp+50h]
  '004F8A64: push edx
  '004F8A65: push ebx
  '004F8A66: call 00420BECh
  '004F8A6B: mov edi, eax
  '004F8A6D: call esi
  '004F8A6F: push edi
  '004F8A70: call 00420C34h
  '004F8A75: call esi
  '004F8A77: mov eax, [esp+20h]
  '004F8A7B: mov ecx, [esp+54h]
  '004F8A7F: push eax
  '004F8A80: push ecx
  '004F8A81: call 00420BECh
  '004F8A86: mov edi, eax
  '004F8A88: call esi
  '004F8A8A: push edi
  '004F8A8B: call 00420C34h
  '004F8A90: call esi
  '004F8A92: mov edx, [esp+14h]
  '004F8A96: push edx
  '004F8A97: push ebp
  '004F8A98: call 00420BECh
  '004F8A9D: mov edi, eax
  '004F8A9F: call esi
  '004F8AA1: push edi
  '004F8AA2: call 00420C34h
  '004F8AA7: call esi
  '004F8AA9: mov eax, [esp+18h]
  '004F8AAD: mov ecx, [esp+4Ch]
  '004F8AB1: push eax
  '004F8AB2: push ecx
  '004F8AB3: call 00420BECh
  '004F8AB8: mov edi, eax
  '004F8ABA: call esi
  '004F8ABC: push edi
  '004F8ABD: call 00420C34h
  '004F8AC2: call esi
  '004F8AC4: push ebx
  '004F8AC5: call 0042763Ch
  '004F8ACA: call esi
  '004F8ACC: mov edx, [esp+54h]
  '004F8AD0: push edx
  '004F8AD1: call 0042763Ch
  '004F8AD6: call esi
  '004F8AD8: push ebp
  '004F8AD9: call 0042763Ch
  '004F8ADE: call esi
  '004F8AE0: mov eax, [esp+4Ch]
  '004F8AE4: push eax
  '004F8AE5: call 0042763Ch
  '004F8AEA: call esi
  '004F8AEC: pop edi
  '004F8AED: pop esi
  '004F8AEE: pop ebp
  '004F8AEF: xor eax, eax
  '004F8AF1: pop ebx
  '004F8AF2: add esp, 00000024h
  '004F8AF5: retn 002Ch
End Sub
Private Sub XPDefaultColors_4F8B00
  '004F8B00: push ebp
  '004F8B01: mov ebp, esp
  '004F8B03: sub esp, 00000008h
  '004F8B06: push 004081B6h
  '004F8B0B: mov eax, fs:[00h]
  '004F8B11: push eax
  '004F8B12: mov fs:[00000000h], esp
  '004F8B19: sub esp, 00000070h
  '004F8B1C: push ebx
  '004F8B1D: push esi
  '004F8B1E: push edi
  '004F8B1F: mov [ebp-08h], esp
  '004F8B22: mov [ebp-04h], 00405A50h
  '004F8B29: mov ebx, [ebp+08h]
  '004F8B2C: xor esi, esi
  '004F8B2E: mov [ebp-18h], esi
  '004F8B31: mov [ebp-28h], esi
  '004F8B34: mov eax, [ebx+000000B8h]
  '004F8B3A: lea edi, [ebx+000000B8h]
  '004F8B40: push eax
  '004F8B41: mov [ebp-38h], esi
  '004F8B44: mov [ebp-48h], esi
  '004F8B47: mov [ebp-58h], esi
  '004F8B4A: mov [ebp-78h], esi
  '004F8B4D: call [00401044h]
  '004F8B53: cmp eax, 00000001h
  '004F8B56: jle 004F8DEDh
  '004F8B5C: mov ecx, [edi]
  '004F8B5E: push 00000001h
  '004F8B60: push ecx
  '004F8B61: push 00428008h
  '004F8B66: push 00000001h
  '004F8B68: call [004012ACh]
  '004F8B6E: mov edx, [edi]
  '004F8B70: mov esi, eax
  '004F8B72: push edx
  '004F8B73: call [00401044h]
  '004F8B79: cmp esi, eax
  '004F8B7B: jnl 004F8DD4h
  '004F8B81: test esi, esi
  '004F8B83: jle 004F8DD4h
  '004F8B89: mov ecx, esi
  '004F8B8B: lea eax, [ebp-28h]
  '004F8B8E: add ecx, 00000001h
  '004F8B91: push eax
  '004F8B92: jo 004F8E57h
  '004F8B98: lea edx, [ebp-58h]
  '004F8B9B: push ecx
  '004F8B9C: lea eax, [ebp-38h]
  '004F8B9F: push edx
  '004F8BA0: push eax
  '004F8BA1: mov [ebp-20h], 00000001h
  '004F8BA8: mov [ebp-28h], 00000002h
  '004F8BAF: mov [ebp-50h], edi
  '004F8BB2: mov [ebp-58h], 00004008h
  '004F8BB9: call [00401154h]
  '004F8BBF: lea ecx, [ebp-38h]
  '004F8BC2: lea edx, [ebp-78h]
  '004F8BC5: push ecx
  '004F8BC6: push edx
  '004F8BC7: mov [ebp-70h], 00428008h
  '004F8BCE: mov [ebp-78h], 00008008h
  '004F8BD5: call [00401308h]
  '004F8BDB: mov [ebp-7Ch], ax
  '004F8BDF: lea eax, [ebp-38h]
  '004F8BE2: lea ecx, [ebp-28h]
  '004F8BE5: push eax
  '004F8BE6: push ecx
  '004F8BE7: push 00000002h
  '004F8BE9: call [00401050h]
  '004F8BEF: add esp, 0000000Ch
  '004F8BF2: cmp word ptr [ebp-7Ch], 0000h
  '004F8BF7: jz 004F8CA2h
  '004F8BFD: lea edx, [ebp-28h]
  '004F8C00: add esi, 00000001h
  '004F8C03: push edx
  '004F8C04: lea eax, [ebp-58h]
  '004F8C07: jo 004F8E57h
  '004F8C0D: push esi
  '004F8C0E: lea ecx, [ebp-38h]
  '004F8C11: push eax
  '004F8C12: push ecx
  '004F8C13: mov [ebp-20h], 00000001h
  '004F8C1A: mov [ebp-28h], 00000002h
  '004F8C21: mov [ebp-50h], edi
  '004F8C24: mov [ebp-58h], 00004008h
  '004F8C2B: call [00401154h]
  '004F8C31: lea edx, [ebp-38h]
  '004F8C34: lea eax, [ebp-48h]
  '004F8C37: push edx
  '004F8C38: push eax
  '004F8C39: call [00401074h]
  '004F8C3F: mov ecx, [ebx+10h]
  '004F8C42: lea edx, [ebp-48h]
  '004F8C45: lea eax, [ebp-18h]
  '004F8C48: push edx
  '004F8C49: mov esi, [ecx]
  '004F8C4B: push eax
  '004F8C4C: call [0040126Ch]
  '004F8C52: mov ecx, [ebx+10h]
  '004F8C55: push eax
  '004F8C56: push ecx
  '004F8C57: call [esi+00000324h]
  '004F8C5D: test eax, eax
  '004F8C5F: fclex 
  '004F8C61: jnl 4F8C78h
  '004F8C63: mov edx, [ebx+10h]
  '004F8C66: push 00000324h
  '004F8C6B: push 0042725Ch
  '004F8C70: push edx
  '004F8C71: push eax
  '004F8C72: call [004010A0h]
  '004F8C78: lea ecx, [ebp-18h]
  '004F8C7B: call [004013B4h]
  '004F8C81: lea eax, [ebp-48h]
  '004F8C84: lea ecx, [ebp-38h]
  '004F8C87: push eax
  '004F8C88: lea edx, [ebp-28h]
  '004F8C8B: push ecx
  '004F8C8C: push edx
  '004F8C8D: push 00000003h
  '004F8C8F: call [00401050h]
  '004F8C95: add esp, 00000010h
  '004F8C98: push 004F8E42h
  '004F8C9D: jmp 004F8E41h
  '004F8CA2: mov eax, [edi]
  '004F8CA4: add esi, 00000002h
  '004F8CA7: jo 004F8E57h
  '004F8CAD: push esi
  '004F8CAE: push eax
  '004F8CAF: push 00428008h
  '004F8CB4: push 00000001h
  '004F8CB6: call [004012ACh]
  '004F8CBC: mov esi, eax
  '004F8CBE: lea ecx, [ebp-28h]
  '004F8CC1: mov edx, esi
  '004F8CC3: push ecx
  '004F8CC4: add edx, 00000001h
  '004F8CC7: lea eax, [ebp-58h]
  '004F8CCA: jo 004F8E57h
  '004F8CD0: push edx
  '004F8CD1: lea ecx, [ebp-38h]
  '004F8CD4: push eax
  '004F8CD5: push ecx
  '004F8CD6: mov [ebp-20h], 00000001h
  '004F8CDD: mov [ebp-28h], 00000002h
  '004F8CE4: mov [ebp-50h], edi
  '004F8CE7: mov [ebp-58h], 00004008h
  '004F8CEE: call [00401154h]
  '004F8CF4: lea edx, [ebp-38h]
  '004F8CF7: lea eax, [ebp-78h]
  '004F8CFA: push edx
  '004F8CFB: push eax
  '004F8CFC: mov [ebp-70h], 00428008h
  '004F8D03: mov [ebp-78h], 00008008h
  '004F8D0A: call [00401308h]
  '004F8D10: lea ecx, [ebp-38h]
  '004F8D13: lea edx, [ebp-28h]
  '004F8D16: push ecx
  '004F8D17: push edx
  '004F8D18: push 00000002h
  '004F8D1A: mov [ebp-7Ch], ax
  '004F8D1E: call [00401050h]
  '004F8D24: add esp, 0000000Ch
  '004F8D27: cmp word ptr [ebp-7Ch], 0000h
  '004F8D2C: jz 004F8DD4h
  '004F8D32: lea eax, [ebp-28h]
  '004F8D35: add esi, 00000001h
  '004F8D38: push eax
  '004F8D39: lea ecx, [ebp-58h]
  '004F8D3C: jo 004F8E57h
  '004F8D42: push esi
  '004F8D43: lea edx, [ebp-38h]
  '004F8D46: push ecx
  '004F8D47: push edx
  '004F8D48: mov [ebp-20h], 00000001h
  '004F8D4F: mov [ebp-28h], 00000002h
  '004F8D56: mov [ebp-50h], edi
  '004F8D59: mov [ebp-58h], 00004008h
  '004F8D60: call [00401154h]
  '004F8D66: lea eax, [ebp-38h]
  '004F8D69: lea ecx, [ebp-48h]
  '004F8D6C: push eax
  '004F8D6D: push ecx
  '004F8D6E: call [00401074h]
  '004F8D74: mov edx, [ebx+10h]
  '004F8D77: lea eax, [ebp-48h]
  '004F8D7A: lea ecx, [ebp-18h]
  '004F8D7D: push eax
  '004F8D7E: mov esi, [edx]
  '004F8D80: push ecx
  '004F8D81: call [0040126Ch]
  '004F8D87: mov edx, [ebx+10h]
  '004F8D8A: push eax
  '004F8D8B: push edx
  '004F8D8C: call [esi+00000324h]
  '004F8D92: test eax, eax
  '004F8D94: fclex 
  '004F8D96: jnl 4F8DADh
  '004F8D98: mov ecx, [ebx+10h]
  '004F8D9B: push 00000324h
  '004F8DA0: push 0042725Ch
  '004F8DA5: push ecx
  '004F8DA6: push eax
  '004F8DA7: call [004010A0h]
  '004F8DAD: lea ecx, [ebp-18h]
  '004F8DB0: call [004013B4h]
  '004F8DB6: lea edx, [ebp-48h]
  '004F8DB9: lea eax, [ebp-38h]
  '004F8DBC: push edx
  '004F8DBD: lea ecx, [ebp-28h]
  '004F8DC0: push eax
  '004F8DC1: push ecx
  '004F8DC2: push 00000003h
  '004F8DC4: call [00401050h]
  '004F8DCA: add esp, 00000010h
  '004F8DCD: push 004F8E42h
  '004F8DD2: jmp 4F8E41h
  '004F8DD4: mov eax, [ebx+10h]
  '004F8DD7: push 0041BC60h
  '004F8DDC: push eax
  '004F8DDD: mov edx, [eax]
  '004F8DDF: call [edx+00000324h]
  '004F8DE5: test eax, eax
  '004F8DE7: fclex 
  '004F8DE9: jnl 4F8E19h
  '004F8DEB: jmp 4F8E04h
  '004F8DED: mov eax, [ebx+10h]
  '004F8DF0: push 0041BC60h
  '004F8DF5: push eax
  '004F8DF6: mov edx, [eax]
  '004F8DF8: call [edx+00000324h]
  '004F8DFE: cmp eax, esi
  '004F8E00: fclex 
  '004F8E02: jnl 4F8E19h
  '004F8E04: mov ecx, [ebx+10h]
  '004F8E07: push 00000324h
  '004F8E0C: push 0042725Ch
  '004F8E11: push ecx
  '004F8E12: push eax
  '004F8E13: call [004010A0h]
  '004F8E19: push 004F8E42h
  '004F8E1E: jmp 4F8E41h
  '004F8E20: lea ecx, [ebp-18h]
  '004F8E23: call [004013B4h]
  '004F8E29: lea edx, [ebp-48h]
  '004F8E2C: lea eax, [ebp-38h]
  '004F8E2F: push edx
  '004F8E30: lea ecx, [ebp-28h]
  '004F8E33: push eax
  '004F8E34: push ecx
  '004F8E35: push 00000003h
  '004F8E37: call [00401050h]
  '004F8E3D: add esp, 00000010h
  '004F8E40: ret 
End Sub

