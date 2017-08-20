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

Private Sub g_Font_IAT_4011D8
  Call IAT.4011D8
End Sub
Private Sub UserControl__47B0A0
  '0047B0A0: push ebp
  '0047B0A1: mov ebp, esp
  '0047B0A3: sub esp, 0000000Ch
  '0047B0A6: push 00403796h
  '0047B0AB: mov eax, fs:[00h]
  '0047B0B1: push eax
  '0047B0B2: mov fs:[00000000h], esp
  '0047B0B9: sub esp, 00000010h
  '0047B0BC: push ebx
  '0047B0BD: push esi
  '0047B0BE: push edi
  '0047B0BF: mov [ebp-0Ch], esp
  '0047B0C2: mov [ebp-08h], 00402478h
  '0047B0C9: mov esi, [ebp+08h]
  '0047B0CC: mov eax, esi
  '0047B0CE: and eax, 00000001h
  '0047B0D1: mov [ebp-04h], eax
  '0047B0D4: and esi, FFFFFFFEh
  '0047B0D7: push esi
  '0047B0D8: mov [ebp+08h], esi
  '0047B0DB: mov ecx, [esi]
  '0047B0DD: call [ecx+04h]
  '0047B0E0: mov edx, [esi]
  '0047B0E2: lea eax, [ebp-18h]
  '0047B0E5: push eax
  '0047B0E6: push esi
  '0047B0E7: mov [ebp-18h], 00000000h
  '0047B0EE: call [edx+00000100h]
  '0047B0F4: test eax, eax
  '0047B0F6: fclex 
  '0047B0F8: jnl 47B110h
  '0047B0FA: mov edi, [004010A8h]
  '0047B100: push 00000100h
  '0047B105: push 0041FF4Ch
  '0047B10A: push esi
  '0047B10B: push eax
  '0047B10C: call edi
  '0047B10E: jmp 47B116h
  '0047B110: mov edi, [004010A8h]
  '0047B116: fld real4 ptr [ebp-18h]
  '0047B119: fcomp real4 ptr [00402470h]
  '0047B11F: fstsw ax
  '0047B121: test ah, 01h
  '0047B124: jz 47B14Eh
  '0047B126: mov eax, [esi+10h]
  '0047B129: push 43160000h
  '0047B12E: push eax
  '0047B12F: mov ecx, [eax]
  '0047B131: call [ecx+00000084h]
  '0047B137: test eax, eax
  '0047B139: fclex 
  '0047B13B: jnl 47B14Eh
  '0047B13D: mov edx, [esi+10h]
  '0047B140: push 00000084h
  '0047B145: push 0041FF4Ch
  '0047B14A: push edx
  '0047B14B: push eax
  '0047B14C: call edi
  '0047B14E: mov eax, [esi]
  '0047B150: lea ecx, [ebp-18h]
  '0047B153: push ecx
  '0047B154: push esi
  '0047B155: call [eax+00000108h]
  '0047B15B: test eax, eax
  '0047B15D: fclex 
  '0047B15F: jnl 47B16Fh
  '0047B161: push 00000108h
  '0047B166: push 0041FF4Ch
  '0047B16B: push esi
  '0047B16C: push eax
  '0047B16D: call edi
  '0047B16F: fld real4 ptr [ebp-18h]
  '0047B172: fcomp real4 ptr [00402470h]
  '0047B178: fstsw ax
  '0047B17A: test ah, 01h
  '0047B17D: jz 47B1A7h
  '0047B17F: mov eax, [esi+10h]
  '0047B182: push 43160000h
  '0047B187: push eax
  '0047B188: mov edx, [eax]
  '0047B18A: call [edx+0000008Ch]
  '0047B190: test eax, eax
  '0047B192: fclex 
  '0047B194: jnl 47B1A7h
  '0047B196: mov ecx, [esi+10h]
  '0047B199: push 0000008Ch
  '0047B19E: push 0041FF4Ch
  '0047B1A3: push ecx
  '0047B1A4: push eax
  '0047B1A5: call edi
  '0047B1A7: mov edx, [esi]
  '0047B1A9: lea eax, [ebp-18h]
  '0047B1AC: push eax
  '0047B1AD: push esi
  '0047B1AE: call [edx+00000100h]
  '0047B1B4: test eax, eax
  '0047B1B6: fclex 
  '0047B1B8: jnl 47B1C8h
  '0047B1BA: push 00000100h
  '0047B1BF: push 0041FF4Ch
  '0047B1C4: push esi
  '0047B1C5: push eax
  '0047B1C6: call edi
  '0047B1C8: fld real4 ptr [ebp-18h]
  '0047B1CB: mov ebx, [00401320h]
  '0047B1D1: call ebx
  '0047B1D3: mov ecx, [esi]
  '0047B1D5: lea edx, [ebp-18h]
  '0047B1D8: push edx
  '0047B1D9: push esi
  '0047B1DA: mov [esi+40h], eax
  '0047B1DD: call [ecx+00000108h]
  '0047B1E3: test eax, eax
  '0047B1E5: fclex 
  '0047B1E7: jnl 47B1F7h
  '0047B1E9: push 00000108h
  '0047B1EE: push 0041FF4Ch
  '0047B1F3: push esi
  '0047B1F4: push eax
  '0047B1F5: call edi
  '0047B1F7: fld real4 ptr [ebp-18h]
  '0047B1FA: call ebx
  '0047B1FC: lea ecx, [ebp-18h]
  '0047B1FF: mov [esi+44h], eax
  '0047B202: mov eax, [esi]
  '0047B204: push ecx
  '0047B205: push esi
  '0047B206: mov [esi+00000088h], 00000004h
  '0047B210: call [eax+00000100h]
  '0047B216: test eax, eax
  '0047B218: fclex 
  '0047B21A: jnl 47B22Ah
  '0047B21C: push 00000100h
  '0047B221: push 0041FF4Ch
  '0047B226: push esi
  '0047B227: push eax
  '0047B228: call edi
  '0047B22A: fld real4 ptr [ebp-18h]
  '0047B22D: fsub real4 ptr [00402064h]
  '0047B233: fstsw ax
  '0047B235: test al, 0Dh
  '0047B237: jnz 0047B2E9h
  '0047B23D: call ebx
  '0047B23F: mov edx, [esi]
  '0047B241: mov [esi+00000090h], eax
  '0047B247: lea eax, [ebp-18h]
  '0047B24A: mov [esi+0000008Ch], 00000004h
  '0047B254: push eax
  '0047B255: push esi
  '0047B256: call [edx+00000108h]
  '0047B25C: test eax, eax
  '0047B25E: fclex 
  '0047B260: jnl 47B270h
  '0047B262: push 00000108h
  '0047B267: push 0041FF4Ch
  '0047B26C: push esi
  '0047B26D: push eax
  '0047B26E: call edi
  '0047B270: fld real4 ptr [ebp-18h]
  '0047B273: fsub real4 ptr [00402064h]
  '0047B279: fstsw ax
  '0047B27B: test al, 0Dh
  '0047B27D: jnz 47B2E9h
  '0047B27F: call ebx
  '0047B281: mov ecx, [esi+3Ch]
  '0047B284: mov [esi+00000094h], eax
  '0047B28A: push ecx
  '0047B28B: call 0041297Ch
  '0047B290: call [004010A4h]
  '0047B296: cmp [esi+000000C0h], 00000003h
  '0047B29D: jnz 47B2A8h
  '0047B29F: mov edx, [esi]
  '0047B2A1: push esi
  '0047B2A2: call [edx+0000092Ch]
  '0047B2A8: mov eax, [esi]
  '0047B2AA: push esi
  '0047B2AB: call [eax+000007A4h]
  '0047B2B1: test eax, eax
  '0047B2B3: jnl 47B2C3h
  '0047B2B5: push 000007A4h
  '0047B2BA: push 0041FF7Ch
  '0047B2BF: push esi
  '0047B2C0: push eax
  '0047B2C1: call edi
  '0047B2C3: mov [ebp-04h], 00000000h
  '0047B2CA: mov eax, [ebp+08h]
  '0047B2CD: push eax
  '0047B2CE: mov ecx, [eax]
  '0047B2D0: call [ecx+08h]
  '0047B2D3: mov eax, [ebp-04h]
  '0047B2D6: mov ecx, [ebp-14h]
  '0047B2D9: pop edi
  '0047B2DA: pop esi
  '0047B2DB: mov fs:[00000000h], ecx
  '0047B2E2: pop ebx
  '0047B2E3: mov esp, ebp
  '0047B2E5: pop ebp
  '0047B2E6: retn 0004h
End Sub
Private Sub UserControl__47B440
  '0047B440: push ebp
  '0047B441: mov ebp, esp
  '0047B443: sub esp, 0000000Ch
  '0047B446: push 00403796h
  '0047B44B: mov eax, fs:[00h]
  '0047B451: push eax
  '0047B452: mov fs:[00000000h], esp
  '0047B459: sub esp, 00000010h
  '0047B45C: push ebx
  '0047B45D: push esi
  '0047B45E: push edi
  '0047B45F: mov [ebp-0Ch], esp
  '0047B462: mov [ebp-08h], 00402488h
  '0047B469: mov esi, [ebp+08h]
  '0047B46C: mov eax, esi
  '0047B46E: and eax, 00000001h
  '0047B471: mov [ebp-04h], eax
  '0047B474: and esi, FFFFFFFEh
  '0047B477: push esi
  '0047B478: mov [ebp+08h], esi
  '0047B47B: mov ecx, [esi]
  '0047B47D: call [ecx+04h]
  '0047B480: mov edx, [esi]
  '0047B482: lea eax, [ebp-18h]
  '0047B485: xor edi, edi
  '0047B487: push eax
  '0047B488: push esi
  '0047B489: mov [ebp-18h], edi
  '0047B48C: call [edx+000007B8h]
  '0047B492: cmp eax, edi
  '0047B494: jnl 47B4A8h
  '0047B496: push 000007B8h
  '0047B49B: push 0041FF7Ch
  '0047B4A0: push esi
  '0047B4A1: push eax
  '0047B4A2: call [004010A8h]
  '0047B4A8: mov ecx, [ebp-18h]
  '0047B4AB: push ecx
  '0047B4AC: call 00420580h
  '0047B4B1: call [004010A4h]
  '0047B4B7: mov edx, [esi]
  '0047B4B9: lea eax, [esi+000000F4h]
  '0047B4BF: lea ecx, [esi+000000F0h]
  '0047B4C5: push eax
  '0047B4C6: push ecx
  '0047B4C7: lea eax, [esi+000000EEh]
  '0047B4CD: lea ecx, [esi+000000ECh]
  '0047B4D3: push eax
  '0047B4D4: push ecx
  '0047B4D5: push esi
  '0047B4D6: call [edx+000008CCh]
  '0047B4DC: cmp eax, edi
  '0047B4DE: jnl 47B4F2h
  '0047B4E0: push 000008CCh
  '0047B4E5: push 0041FF7Ch
  '0047B4EA: push esi
  '0047B4EB: push eax
  '0047B4EC: call [004010A8h]
  '0047B4F2: mov [ebp-04h], edi
  '0047B4F5: mov eax, [ebp+08h]
  '0047B4F8: push eax
  '0047B4F9: mov edx, [eax]
  '0047B4FB: call [edx+08h]
  '0047B4FE: mov eax, [ebp-04h]
  '0047B501: mov ecx, [ebp-14h]
  '0047B504: pop edi
  '0047B505: pop esi
  '0047B506: mov fs:[00000000h], ecx
  '0047B50D: pop ebx
  '0047B50E: mov esp, ebp
  '0047B510: pop ebp
  '0047B511: retn 0004h
End Sub
Private Sub UserControl__47B520
  '0047B520: push ebp
  '0047B521: mov ebp, esp
  '0047B523: sub esp, 0000000Ch
  '0047B526: push 00403796h
  '0047B52B: mov eax, fs:[00h]
  '0047B531: push eax
  '0047B532: mov fs:[00000000h], esp
  '0047B539: sub esp, 0000002Ch
  '0047B53C: push ebx
  '0047B53D: push esi
  '0047B53E: push edi
  '0047B53F: mov [ebp-0Ch], esp
  '0047B542: mov [ebp-08h], 00402490h
  '0047B549: mov esi, [ebp+08h]
  '0047B54C: mov eax, esi
  '0047B54E: and eax, 00000001h
  '0047B551: mov [ebp-04h], eax
  '0047B554: and esi, FFFFFFFEh
  '0047B557: push esi
  '0047B558: mov [ebp+08h], esi
  '0047B55B: mov ecx, [esi]
  '0047B55D: call [ecx+04h]
  '0047B560: mov al, [esi+000000F8h]
  '0047B566: test al, al
  '0047B568: jnz 47B5C7h
  '0047B56A: mov edx, [ebp+0Ch]
  '0047B56D: cmp word ptr [edx], 0020h
  '0047B571: jnz 47B5B4h
  '0047B573: mov edi, [004011F4h]
  '0047B579: mov ecx, 00000001h
  '0047B57E: call edi
  '0047B580: mov ecx, 00000001h
  '0047B585: mov [esi+000000E9h], al
  '0047B58B: call edi
  '0047B58D: mov [esi+000000EAh], al
  '0047B593: mov eax, [esi]
  '0047B595: push esi
  '0047B596: call [eax+000007A4h]
  '0047B59C: test eax, eax
  '0047B59E: jnl 47B5BAh
  '0047B5A0: push 000007A4h
  '0047B5A5: push 0041FF7Ch
  '0047B5AA: push esi
  '0047B5AB: push eax
  '0047B5AC: call [004010A8h]
  '0047B5B2: jmp 47B5BAh
  '0047B5B4: mov edi, [004011F4h]
  '0047B5BA: mov ecx, 00000001h
  '0047B5BF: call edi
  '0047B5C1: mov [esi+000000F8h], al
  '0047B5C7: sub esp, 00000010h
  '0047B5CA: mov eax, 00004002h
  '0047B5CF: mov edi, esp
  '0047B5D1: mov edx, eax
  '0047B5D3: sub esp, 00000010h
  '0047B5D6: mov ecx, [ebp+10h]
  '0047B5D9: mov [edi], eax
  '0047B5DB: mov eax, [ebp-20h]
  '0047B5DE: mov [edi+04h], eax
  '0047B5E1: mov eax, [ebp+0Ch]
  '0047B5E4: mov [edi+08h], eax
  '0047B5E7: mov eax, [ebp-18h]
  '0047B5EA: mov [edi+0Ch], eax
  '0047B5ED: mov eax, esp
  '0047B5EF: push 00000002h
  '0047B5F1: push 00000002h
  '0047B5F3: mov [eax], edx
  '0047B5F5: mov edx, [ebp-30h]
  '0047B5F8: push esi
  '0047B5F9: mov [eax+04h], edx
  '0047B5FC: mov [eax+08h], ecx
  '0047B5FF: mov ecx, [ebp-28h]
  '0047B602: mov [eax+0Ch], ecx
  '0047B605: call [00401068h]
  '0047B60B: add esp, 0000002Ch
  '0047B60E: mov [ebp-04h], 00000000h
  '0047B615: mov eax, [ebp+08h]
  '0047B618: push eax
  '0047B619: mov edx, [eax]
  '0047B61B: call [edx+08h]
  '0047B61E: mov eax, [ebp-04h]
  '0047B621: mov ecx, [ebp-14h]
  '0047B624: pop edi
  '0047B625: pop esi
  '0047B626: mov fs:[00000000h], ecx
  '0047B62D: pop ebx
  '0047B62E: mov esp, ebp
  '0047B630: pop ebp
  '0047B631: retn 000Ch
End Sub
Private Sub UserControl__47B640
  '0047B640: push ebp
  '0047B641: mov ebp, esp
  '0047B643: sub esp, 0000000Ch
  '0047B646: push 00403796h
  '0047B64B: mov eax, fs:[00h]
  '0047B651: push eax
  '0047B652: mov fs:[00000000h], esp
  '0047B659: sub esp, 00000018h
  '0047B65C: push ebx
  '0047B65D: push esi
  '0047B65E: push edi
  '0047B65F: mov [ebp-0Ch], esp
  '0047B662: mov [ebp-08h], 00402498h
  '0047B669: mov esi, [ebp+08h]
  '0047B66C: mov eax, esi
  '0047B66E: and eax, 00000001h
  '0047B671: mov [ebp-04h], eax
  '0047B674: and esi, FFFFFFFEh
  '0047B677: push esi
  '0047B678: mov [ebp+08h], esi
  '0047B67B: mov ecx, [esi]
  '0047B67D: call [ecx+04h]
  '0047B680: sub esp, 00000010h
  '0047B683: mov eax, [ebp+0Ch]
  '0047B686: mov edx, esp
  '0047B688: mov ecx, 00004002h
  '0047B68D: push 00000001h
  '0047B68F: push 00000003h
  '0047B691: mov [edx], ecx
  '0047B693: mov ecx, [ebp-20h]
  '0047B696: push esi
  '0047B697: mov [edx+04h], ecx
  '0047B69A: mov [edx+08h], eax
  '0047B69D: mov eax, [ebp-18h]
  '0047B6A0: mov [edx+0Ch], eax
  '0047B6A3: call [00401068h]
  '0047B6A9: add esp, 0000001Ch
  '0047B6AC: mov [ebp-04h], 00000000h
  '0047B6B3: mov eax, [ebp+08h]
  '0047B6B6: push eax
  '0047B6B7: mov ecx, [eax]
  '0047B6B9: call [ecx+08h]
  '0047B6BC: mov eax, [ebp-04h]
  '0047B6BF: mov ecx, [ebp-14h]
  '0047B6C2: pop edi
  '0047B6C3: pop esi
  '0047B6C4: mov fs:[00000000h], ecx
  '0047B6CB: pop ebx
  '0047B6CC: mov esp, ebp
  '0047B6CE: pop ebp
  '0047B6CF: retn 0008h
End Sub
Private Sub UserControl__47B6E0
  '0047B6E0: push ebp
  '0047B6E1: mov ebp, esp
  '0047B6E3: sub esp, 0000000Ch
  '0047B6E6: push 00403796h
  '0047B6EB: mov eax, fs:[00h]
  '0047B6F1: push eax
  '0047B6F2: mov fs:[00000000h], esp
  '0047B6F9: sub esp, 00000038h
  '0047B6FC: push ebx
  '0047B6FD: push esi
  '0047B6FE: push edi
  '0047B6FF: mov [ebp-0Ch], esp
  '0047B702: mov [ebp-08h], 004024A0h
  '0047B709: mov esi, [ebp+08h]
  '0047B70C: mov eax, esi
  '0047B70E: and eax, 00000001h
  '0047B711: mov [ebp-04h], eax
  '0047B714: and esi, FFFFFFFEh
  '0047B717: push esi
  '0047B718: mov [ebp+08h], esi
  '0047B71B: mov ecx, [esi]
  '0047B71D: call [ecx+04h]
  '0047B720: mov edx, [ebp+0Ch]
  '0047B723: xor ebx, ebx
  '0047B725: mov [ebp-38h], ebx
  '0047B728: mov [ebp-3Ch], ebx
  '0047B72B: cmp word ptr [edx], 0020h
  '0047B72F: mov [ebp-40h], ebx
  '0047B732: jnz 0047B7CEh
  '0047B738: mov edi, [004011F4h]
  '0047B73E: xor ecx, ecx
  '0047B740: call edi
  '0047B742: xor ecx, ecx
  '0047B744: mov [esi+000000E9h], al
  '0047B74A: call edi
  '0047B74C: mov [esi+000000EAh], al
  '0047B752: mov eax, [esi]
  '0047B754: push esi
  '0047B755: call [eax+000007D4h]
  '0047B75B: cmp eax, ebx
  '0047B75D: jnl 47B775h
  '0047B75F: mov edi, [004010A8h]
  '0047B765: push 000007D4h
  '0047B76A: push 0041FF7Ch
  '0047B76F: push esi
  '0047B770: push eax
  '0047B771: call edi
  '0047B773: jmp 47B77Bh
  '0047B775: mov edi, [004010A8h]
  '0047B77B: mov ecx, [esi]
  '0047B77D: push esi
  '0047B77E: call [ecx+000007A4h]
  '0047B784: cmp eax, ebx
  '0047B786: jnl 47B796h
  '0047B788: push 000007A4h
  '0047B78D: push 0041FF7Ch
  '0047B792: push esi
  '0047B793: push eax
  '0047B794: call edi
  '0047B796: mov edx, [esi]
  '0047B798: lea eax, [ebp-40h]
  '0047B79B: lea ecx, [ebp-3Ch]
  '0047B79E: push eax
  '0047B79F: mov eax, [ebp+10h]
  '0047B7A2: push ecx
  '0047B7A3: lea ecx, [ebp-38h]
  '0047B7A6: push eax
  '0047B7A7: push ecx
  '0047B7A8: push esi
  '0047B7A9: mov [ebp-40h], ebx
  '0047B7AC: mov [ebp-3Ch], ebx
  '0047B7AF: mov [ebp-38h], 00000001h
  '0047B7B6: call [edx+000008D4h]
  '0047B7BC: cmp eax, ebx
  '0047B7BE: jnl 47B7CEh
  '0047B7C0: push 000008D4h
  '0047B7C5: push 0041FF7Ch
  '0047B7CA: push esi
  '0047B7CB: push eax
  '0047B7CC: call edi
  '0047B7CE: xor ecx, ecx
  '0047B7D0: call [004011F4h]
  '0047B7D6: sub esp, 00000010h
  '0047B7D9: mov [esi+000000F8h], al
  '0047B7DF: mov edx, esp
  '0047B7E1: mov eax, 00004002h
  '0047B7E6: mov ecx, eax
  '0047B7E8: sub esp, 00000010h
  '0047B7EB: mov [edx], eax
  '0047B7ED: mov eax, [ebp-20h]
  '0047B7F0: mov [edx+04h], eax
  '0047B7F3: mov eax, [ebp+0Ch]
  '0047B7F6: mov [edx+08h], eax
  '0047B7F9: mov eax, [ebp-18h]
  '0047B7FC: mov [edx+0Ch], eax
  '0047B7FF: mov eax, [ebp-30h]
  '0047B802: mov edx, esp
  '0047B804: push 00000002h
  '0047B806: push 00000004h
  '0047B808: push esi
  '0047B809: mov [edx], ecx
  '0047B80B: mov ecx, [ebp+10h]
  '0047B80E: mov [edx+04h], eax
  '0047B811: mov eax, [ebp-28h]
  '0047B814: mov [edx+08h], ecx
  '0047B817: mov [edx+0Ch], eax
  '0047B81A: call [00401068h]
  '0047B820: add esp, 0000002Ch
  '0047B823: mov [ebp-04h], ebx
  '0047B826: mov eax, [ebp+08h]
  '0047B829: push eax
  '0047B82A: mov ecx, [eax]
  '0047B82C: call [ecx+08h]
  '0047B82F: mov eax, [ebp-04h]
  '0047B832: mov ecx, [ebp-14h]
  '0047B835: pop edi
  '0047B836: pop esi
  '0047B837: mov fs:[00000000h], ecx
  '0047B83E: pop ebx
  '0047B83F: mov esp, ebp
  '0047B841: pop ebp
  '0047B842: retn 000Ch
End Sub
Private Sub UserControl__47B850
  '0047B850: push ebp
  '0047B851: mov ebp, esp
  '0047B853: sub esp, 0000000Ch
  '0047B856: push 00403796h
  '0047B85B: mov eax, fs:[00h]
  '0047B861: push eax
  '0047B862: mov fs:[00000000h], esp
  '0047B869: sub esp, 0000004Ch
  '0047B86C: push ebx
  '0047B86D: push esi
  '0047B86E: push edi
  '0047B86F: mov [ebp-0Ch], esp
  '0047B872: mov [ebp-08h], 004024A8h
  '0047B879: mov esi, [ebp+08h]
  '0047B87C: mov eax, esi
  '0047B87E: and eax, 00000001h
  '0047B881: mov [ebp-04h], eax
  '0047B884: and esi, FFFFFFFEh
  '0047B887: push esi
  '0047B888: mov [ebp+08h], esi
  '0047B88B: mov ecx, [esi]
  '0047B88D: call [ecx+04h]
  '0047B890: mov eax, [ebp+0Ch]
  '0047B893: mov ecx, [ebp+10h]
  '0047B896: mov dx, [eax]
  '0047B899: mov [esi+000000ECh], dx
  '0047B8A0: mov dx, [ecx]
  '0047B8A3: mov ecx, [ebp+14h]
  '0047B8A6: mov [esi+000000EEh], dx
  '0047B8AD: mov edx, [ecx]
  '0047B8AF: mov ecx, [ebp+18h]
  '0047B8B2: mov [esi+000000F0h], edx
  '0047B8B8: mov edx, [ecx]
  '0047B8BA: mov [esi+000000F4h], edx
  '0047B8C0: cmp word ptr [eax], 0002h
  '0047B8C4: jz 47B8F6h
  '0047B8C6: mov ecx, 00000001h
  '0047B8CB: call [004011F4h]
  '0047B8D1: mov [esi+000000E9h], al
  '0047B8D7: mov eax, [esi]
  '0047B8D9: push esi
  '0047B8DA: call [eax+000007A4h]
  '0047B8E0: test eax, eax
  '0047B8E2: jnl 47B8F6h
  '0047B8E4: push 000007A4h
  '0047B8E9: push 0041FF7Ch
  '0047B8EE: push esi
  '0047B8EF: push eax
  '0047B8F0: call [004010A8h]
  '0047B8F6: sub esp, 00000010h
  '0047B8F9: mov eax, 00004002h
  '0047B8FE: mov ebx, esp
  '0047B900: mov ecx, eax
  '0047B902: sub esp, 00000010h
  '0047B905: mov edx, 00004004h
  '0047B90A: mov [ebx], eax
  '0047B90C: mov eax, [ebp-20h]
  '0047B90F: mov edi, edx
  '0047B911: mov [ebx+04h], eax
  '0047B914: mov eax, [ebp+0Ch]
  '0047B917: mov [ebx+08h], eax
  '0047B91A: mov eax, [ebp-18h]
  '0047B91D: mov [ebx+0Ch], eax
  '0047B920: mov eax, esp
  '0047B922: sub esp, 00000010h
  '0047B925: mov [eax], ecx
  '0047B927: mov ecx, [ebp-30h]
  '0047B92A: mov [eax+04h], ecx
  '0047B92D: mov ecx, [ebp+10h]
  '0047B930: mov [eax+08h], ecx
  '0047B933: mov ecx, [ebp-28h]
  '0047B936: mov [eax+0Ch], ecx
  '0047B939: mov ecx, [ebp-40h]
  '0047B93C: mov eax, esp
  '0047B93E: sub esp, 00000010h
  '0047B941: mov [eax], edx
  '0047B943: mov edx, [ebp+14h]
  '0047B946: mov [eax+04h], ecx
  '0047B949: mov ecx, [ebp-38h]
  '0047B94C: mov [eax+08h], edx
  '0047B94F: mov edx, esp
  '0047B951: push 00000004h
  '0047B953: push 00000005h
  '0047B955: mov [eax+0Ch], ecx
  '0047B958: mov eax, [ebp-50h]
  '0047B95B: mov ecx, [ebp+18h]
  '0047B95E: mov [edx], edi
  '0047B960: push esi
  '0047B961: mov [edx+04h], eax
  '0047B964: mov eax, [ebp-48h]
  '0047B967: mov [edx+08h], ecx
  '0047B96A: mov [edx+0Ch], eax
  '0047B96D: call [00401068h]
  '0047B973: add esp, 0000004Ch
  '0047B976: mov [ebp-04h], 00000000h
  '0047B97D: mov eax, [ebp+08h]
  '0047B980: push eax
  '0047B981: mov ecx, [eax]
  '0047B983: call [ecx+08h]
  '0047B986: mov eax, [ebp-04h]
  '0047B989: mov ecx, [ebp-14h]
  '0047B98C: pop edi
  '0047B98D: pop esi
  '0047B98E: mov fs:[00000000h], ecx
  '0047B995: pop ebx
  '0047B996: mov esp, ebp
  '0047B998: pop ebp
  '0047B999: retn 0014h
End Sub
Private Sub UserControl__47B9A0
  '0047B9A0: push ebp
  '0047B9A1: mov ebp, esp
  '0047B9A3: sub esp, 0000000Ch
  '0047B9A6: push 00403796h
  '0047B9AB: mov eax, fs:[00h]
  '0047B9B1: push eax
  '0047B9B2: mov fs:[00000000h], esp
  '0047B9B9: sub esp, 00000074h
  '0047B9BC: push ebx
  '0047B9BD: push esi
  '0047B9BE: push edi
  '0047B9BF: mov [ebp-0Ch], esp
  '0047B9C2: mov [ebp-08h], 004024B0h
  '0047B9C9: mov esi, [ebp+08h]
  '0047B9CC: mov eax, esi
  '0047B9CE: and eax, 00000001h
  '0047B9D1: mov [ebp-04h], eax
  '0047B9D4: and esi, FFFFFFFEh
  '0047B9D7: push esi
  '0047B9D8: mov [ebp+08h], esi
  '0047B9DB: mov ecx, [esi]
  '0047B9DD: call [ecx+04h]
  '0047B9E0: mov edx, [esi]
  '0047B9E2: lea eax, [ebp-74h]
  '0047B9E5: xor edi, edi
  '0047B9E7: push eax
  '0047B9E8: push esi
  '0047B9E9: mov [ebp-18h], edi
  '0047B9EC: mov [ebp-1Ch], edi
  '0047B9EF: mov [ebp-2Ch], edi
  '0047B9F2: mov byte ptr [ebp-70h], 00h
  '0047B9F6: mov [ebp-74h], edi
  '0047B9F9: mov [ebp-78h], edi
  '0047B9FC: call [edx+00000100h]
  '0047BA02: cmp eax, edi
  '0047BA04: fclex 
  '0047BA06: jnl 47BA1Ah
  '0047BA08: push 00000100h
  '0047BA0D: push 0041FF4Ch
  '0047BA12: push esi
  '0047BA13: push eax
  '0047BA14: call [004010A8h]
  '0047BA1A: mov ecx, [esi]
  '0047BA1C: lea edx, [ebp-78h]
  '0047BA1F: push edx
  '0047BA20: push esi
  '0047BA21: call [ecx+00000108h]
  '0047BA27: cmp eax, edi
  '0047BA29: fclex 
  '0047BA2B: jnl 47BA3Fh
  '0047BA2D: push 00000108h
  '0047BA32: push 0041FF4Ch
  '0047BA37: push esi
  '0047BA38: push eax
  '0047BA39: call [004010A8h]
  '0047BA3F: mov ecx, [ebp+14h]
  '0047BA42: fld real4 ptr [ecx]
  '0047BA44: fcomp real4 ptr [00402058h]
  '0047BA4A: fstsw ax
  '0047BA4C: test ah, 01h
  '0047BA4F: jnz 47BA56h
  '0047BA51: mov edi, 00000001h
  '0047BA56: mov ebx, [ebp+18h]
  '0047BA59: fld real4 ptr [ebx]
  '0047BA5B: fcomp real4 ptr [00402058h]
  '0047BA61: fstsw ax
  '0047BA63: test ah, 01h
  '0047BA66: jnz 47BA6Fh
  '0047BA68: mov edx, 00000001h
  '0047BA6D: jmp 47BA71h
  '0047BA6F: xor edx, edx
  '0047BA71: fld real4 ptr [ecx]
  '0047BA73: fcomp real4 ptr [ebp-74h]
  '0047BA76: fstsw ax
  '0047BA78: test ah, 01h
  '0047BA7B: jz 47BA84h
  '0047BA7D: mov ecx, 00000001h
  '0047BA82: jmp 47BA86h
  '0047BA84: xor ecx, ecx
  '0047BA86: fld real4 ptr [ebx]
  '0047BA88: fcomp real4 ptr [ebp-78h]
  '0047BA8B: fstsw ax
  '0047BA8D: test ah, 01h
  '0047BA90: jz 47BA99h
  '0047BA92: mov eax, 00000001h
  '0047BA97: jmp 47BA9Bh
  '0047BA99: xor eax, eax
  '0047BA9B: neg eax
  '0047BA9D: neg ecx
  '0047BA9F: and eax, ecx
  '0047BAA1: neg edx
  '0047BAA3: and eax, edx
  '0047BAA5: neg edi
  '0047BAA7: and eax, edi
  '0047BAA9: test ax, ax
  '0047BAAC: jz 0047BBE3h
  '0047BAB2: mov al, [esi+000000EAh]
  '0047BAB8: test al, al
  '0047BABA: jnz 0047BBE3h
  '0047BAC0: mov eax, [esi]
  '0047BAC2: push esi
  '0047BAC3: call [eax+000003A8h]
  '0047BAC9: lea ecx, [ebp-1Ch]
  '0047BACC: push eax
  '0047BACD: push ecx
  '0047BACE: call [004010F0h]
  '0047BAD4: mov edi, eax
  '0047BAD6: push FFFFFFFFh
  '0047BAD8: push edi
  '0047BAD9: mov edx, [edi]
  '0047BADB: call [edx+5Ch]
  '0047BADE: test eax, eax
  '0047BAE0: fclex 
  '0047BAE2: jnl 47BAF7h
  '0047BAE4: push 0000005Ch
  '0047BAE6: push 004148B4h
  '0047BAEB: push edi
  '0047BAEC: mov edi, [004010A8h]
  '0047BAF2: push eax
  '0047BAF3: call edi
  '0047BAF5: jmp 47BAFDh
  '0047BAF7: mov edi, [004010A8h]
  '0047BAFD: lea ecx, [ebp-1Ch]
  '0047BB00: call [00401388h]
  '0047BB06: mov ecx, 00000001h
  '0047BB0B: call [004011F4h]
  '0047BB11: mov [esi+000000EAh], al
  '0047BB17: mov eax, [esi+000000B4h]
  '0047BB1D: push 00000000h
  '0047BB1F: push eax
  '0047BB20: call [004011FCh]
  '0047BB26: test ax, ax
  '0047BB29: jnz 47BB3Fh
  '0047BB2B: mov ecx, [esi+000000B4h]
  '0047BB31: lea edx, [esi+000000C4h]
  '0047BB37: push ecx
  '0047BB38: push edx
  '0047BB39: call [004010FCh]
  '0047BB3F: mov edx, [ebp-38h]
  '0047BB42: sub esp, 00000010h
  '0047BB45: mov ecx, esp
  '0047BB47: mov eax, 00004002h
  '0047BB4C: push 00000001h
  '0047BB4E: push 00000008h
  '0047BB50: mov [ecx], eax
  '0047BB52: mov eax, [ebp+10h]
  '0047BB55: push esi
  '0047BB56: mov [ecx+04h], edx
  '0047BB59: mov edx, [ebp-30h]
  '0047BB5C: mov [ecx+08h], eax
  '0047BB5F: mov [ecx+0Ch], edx
  '0047BB62: call [00401068h]
  '0047BB68: mov eax, [esi]
  '0047BB6A: add esp, 0000001Ch
  '0047BB6D: push esi
  '0047BB6E: call [eax+000007A4h]
  '0047BB74: test eax, eax
  '0047BB76: jnl 47BB86h
  '0047BB78: push 000007A4h
  '0047BB7D: push 0041FF7Ch
  '0047BB82: push esi
  '0047BB83: push eax
  '0047BB84: call edi
  '0047BB86: call [00401108h]
  '0047BB8C: mov ecx, [esi]
  '0047BB8E: lea edx, [ebp-2Ch]
  '0047BB91: push edx
  '0047BB92: push esi
  '0047BB93: call [ecx+00000848h]
  '0047BB99: test eax, eax
  '0047BB9B: jnl 47BBABh
  '0047BB9D: push 00000848h
  '0047BBA2: push 0041FF7Ch
  '0047BBA7: push esi
  '0047BBA8: push eax
  '0047BBA9: call edi
  '0047BBAB: lea eax, [ebp-2Ch]
  '0047BBAE: push eax
  '0047BBAF: call [00401048h]
  '0047BBB5: mov edx, eax
  '0047BBB7: lea ecx, [ebp-18h]
  '0047BBBA: call [00401348h]
  '0047BBC0: mov ecx, [esi]
  '0047BBC2: lea edx, [ebp-70h]
  '0047BBC5: lea eax, [ebp-18h]
  '0047BBC8: push edx
  '0047BBC9: push eax
  '0047BBCA: push esi
  '0047BBCB: call [ecx+00000910h]
  '0047BBD1: lea ecx, [ebp-18h]
  '0047BBD4: call [0040138Ch]
  '0047BBDA: lea ecx, [ebp-2Ch]
  '0047BBDD: call [00401034h]
  '0047BBE3: sub esp, 00000010h
  '0047BBE6: mov eax, [ebp+0Ch]
  '0047BBE9: mov ebx, esp
  '0047BBEB: mov ecx, 00004002h
  '0047BBF0: mov edx, ecx
  '0047BBF2: sub esp, 00000010h
  '0047BBF5: mov [ebx], ecx
  '0047BBF7: mov ecx, [ebp-38h]
  '0047BBFA: mov edi, 00004004h
  '0047BBFF: mov [ebx+04h], ecx
  '0047BC02: mov ecx, esp
  '0047BC04: sub esp, 00000010h
  '0047BC07: mov [ebx+08h], eax
  '0047BC0A: mov eax, [ebp-30h]
  '0047BC0D: mov [ebx+0Ch], eax
  '0047BC10: mov eax, [ebp+10h]
  '0047BC13: mov [ecx], edx
  '0047BC15: mov edx, [ebp-48h]
  '0047BC18: mov [ecx+04h], edx
  '0047BC1B: mov edx, [ebp-40h]
  '0047BC1E: mov [ecx+08h], eax
  '0047BC21: mov eax, esp
  '0047BC23: sub esp, 00000010h
  '0047BC26: mov [ecx+0Ch], edx
  '0047BC29: mov ecx, [ebp-58h]
  '0047BC2C: mov edx, [ebp+14h]
  '0047BC2F: mov [eax], edi
  '0047BC31: mov [eax+04h], ecx
  '0047BC34: mov ecx, [ebp-50h]
  '0047BC37: mov [eax+08h], edx
  '0047BC3A: mov edx, esp
  '0047BC3C: push 00000004h
  '0047BC3E: push 00000006h
  '0047BC40: mov [eax+0Ch], ecx
  '0047BC43: mov ecx, [ebp+18h]
  '0047BC46: mov eax, edi
  '0047BC48: push esi
  '0047BC49: mov [edx], eax
  '0047BC4B: mov eax, [ebp-68h]
  '0047BC4E: mov [edx+04h], eax
  '0047BC51: mov eax, [ebp-60h]
  '0047BC54: mov [edx+08h], ecx
  '0047BC57: mov [edx+0Ch], eax
  '0047BC5A: call [00401068h]
  '0047BC60: add esp, 0000004Ch
  '0047BC63: mov [ebp-04h], 00000000h
  '0047BC6A: wait 
  '0047BC6B: push 0047BC8Fh
  '0047BC70: jmp 47BC8Eh
  '0047BC72: lea ecx, [ebp-18h]
  '0047BC75: call [0040138Ch]
  '0047BC7B: lea ecx, [ebp-1Ch]
  '0047BC7E: call [00401388h]
  '0047BC84: lea ecx, [ebp-2Ch]
  '0047BC87: call [00401034h]
  '0047BC8D: ret 
End Sub
Private Sub UserControl__47BCB0
  '0047BCB0: push ebp
  '0047BCB1: mov ebp, esp
  '0047BCB3: sub esp, 0000000Ch
  '0047BCB6: push 00403796h
  '0047BCBB: mov eax, fs:[00h]
  '0047BCC1: push eax
  '0047BCC2: mov fs:[00000000h], esp
  '0047BCC9: sub esp, 00000068h
  '0047BCCC: push ebx
  '0047BCCD: push esi
  '0047BCCE: push edi
  '0047BCCF: mov [ebp-0Ch], esp
  '0047BCD2: mov [ebp-08h], 004024C0h
  '0047BCD9: mov esi, [ebp+08h]
  '0047BCDC: mov eax, esi
  '0047BCDE: and eax, 00000001h
  '0047BCE1: mov [ebp-04h], eax
  '0047BCE4: and esi, FFFFFFFEh
  '0047BCE7: push esi
  '0047BCE8: mov [ebp+08h], esi
  '0047BCEB: mov ecx, [esi]
  '0047BCED: call [ecx+04h]
  '0047BCF0: xor edi, edi
  '0047BCF2: xor ecx, ecx
  '0047BCF4: mov [ebp-18h], edi
  '0047BCF7: mov [ebp-1Ch], edi
  '0047BCFA: mov byte ptr [ebp-60h], 00h
  '0047BCFE: mov [ebp-64h], edi
  '0047BD01: mov [ebp-68h], edi
  '0047BD04: call [004011F4h]
  '0047BD0A: mov edx, [ebp+0Ch]
  '0047BD0D: mov [esi+000000E9h], al
  '0047BD13: cmp word ptr [edx], 0002h
  '0047BD17: jz 0047BE6Fh
  '0047BD1D: mov eax, [esi]
  '0047BD1F: push esi
  '0047BD20: call [eax+000007A4h]
  '0047BD26: cmp eax, edi
  '0047BD28: jnl 47BD40h
  '0047BD2A: mov ebx, [004010A8h]
  '0047BD30: push 000007A4h
  '0047BD35: push 0041FF7Ch
  '0047BD3A: push esi
  '0047BD3B: push eax
  '0047BD3C: call ebx
  '0047BD3E: jmp 47BD46h
  '0047BD40: mov ebx, [004010A8h]
  '0047BD46: mov ecx, [esi]
  '0047BD48: lea edx, [ebp-64h]
  '0047BD4B: push edx
  '0047BD4C: push esi
  '0047BD4D: call [ecx+00000100h]
  '0047BD53: cmp eax, edi
  '0047BD55: fclex 
  '0047BD57: jnl 47BD67h
  '0047BD59: push 00000100h
  '0047BD5E: push 0041FF4Ch
  '0047BD63: push esi
  '0047BD64: push eax
  '0047BD65: call ebx
  '0047BD67: mov eax, [esi]
  '0047BD69: lea ecx, [ebp-68h]
  '0047BD6C: push ecx
  '0047BD6D: push esi
  '0047BD6E: call [eax+00000108h]
  '0047BD74: cmp eax, edi
  '0047BD76: fclex 
  '0047BD78: jnl 47BD88h
  '0047BD7A: push 00000108h
  '0047BD7F: push 0041FF4Ch
  '0047BD84: push esi
  '0047BD85: push eax
  '0047BD86: call ebx
  '0047BD88: mov ecx, [ebp+14h]
  '0047BD8B: fld real4 ptr [ecx]
  '0047BD8D: fcomp real4 ptr [00402058h]
  '0047BD93: fstsw ax
  '0047BD95: test ah, 01h
  '0047BD98: jnz 47BD9Fh
  '0047BD9A: mov edi, 00000001h
  '0047BD9F: mov edx, [ebp+18h]
  '0047BDA2: fld real4 ptr [edx]
  '0047BDA4: fcomp real4 ptr [00402058h]
  '0047BDAA: fstsw ax
  '0047BDAC: test ah, 01h
  '0047BDAF: jnz 47BDB8h
  '0047BDB1: mov edx, 00000001h
  '0047BDB6: jmp 47BDBAh
  '0047BDB8: xor edx, edx
  '0047BDBA: fld real4 ptr [ecx]
  '0047BDBC: fcomp real4 ptr [ebp-64h]
  '0047BDBF: fstsw ax
  '0047BDC1: test ah, 01h
  '0047BDC4: jz 47BDCDh
  '0047BDC6: mov ecx, 00000001h
  '0047BDCB: jmp 47BDCFh
  '0047BDCD: xor ecx, ecx
  '0047BDCF: mov eax, [ebp+18h]
  '0047BDD2: fld real4 ptr [eax]
  '0047BDD4: fcomp real4 ptr [ebp-68h]
  '0047BDD7: fstsw ax
  '0047BDD9: test ah, 01h
  '0047BDDC: jz 47BDE5h
  '0047BDDE: mov eax, 00000001h
  '0047BDE3: jmp 47BDE7h
  '0047BDE5: xor eax, eax
  '0047BDE7: neg eax
  '0047BDE9: neg ecx
  '0047BDEB: and eax, ecx
  '0047BDED: neg edx
  '0047BDEF: and eax, edx
  '0047BDF1: neg edi
  '0047BDF3: and eax, edi
  '0047BDF5: test ax, ax
  '0047BDF8: jz 47BE6Fh
  '0047BDFA: mov ecx, [esi]
  '0047BDFC: lea edx, [ebp-18h]
  '0047BDFF: push edx
  '0047BE00: push esi
  '0047BE01: call [ecx+00000850h]
  '0047BE07: test eax, eax
  '0047BE09: jnl 47BE19h
  '0047BE0B: push 00000850h
  '0047BE10: push 0041FF7Ch
  '0047BE15: push esi
  '0047BE16: push eax
  '0047BE17: call ebx
  '0047BE19: mov edx, [ebp-18h]
  '0047BE1C: lea ecx, [ebp-1Ch]
  '0047BE1F: mov [ebp-18h], 00000000h
  '0047BE26: call [00401348h]
  '0047BE2C: mov eax, [esi]
  '0047BE2E: lea ecx, [ebp-60h]
  '0047BE31: lea edx, [ebp-1Ch]
  '0047BE34: push ecx
  '0047BE35: push edx
  '0047BE36: push esi
  '0047BE37: call [eax+00000910h]
  '0047BE3D: lea ecx, [ebp-1Ch]
  '0047BE40: call [0040138Ch]
  '0047BE46: push 00000000h
  '0047BE48: push 00000001h
  '0047BE4A: push esi
  '0047BE4B: call [00401068h]
  '0047BE51: mov eax, [esi]
  '0047BE53: add esp, 0000000Ch
  '0047BE56: push esi
  '0047BE57: call [eax+000007D4h]
  '0047BE5D: test eax, eax
  '0047BE5F: jnl 47BE6Fh
  '0047BE61: push 000007D4h
  '0047BE66: push 0041FF7Ch
  '0047BE6B: push esi
  '0047BE6C: push eax
  '0047BE6D: call ebx
  '0047BE6F: sub esp, 00000010h
  '0047BE72: mov eax, 00004002h
  '0047BE77: mov ebx, esp
  '0047BE79: mov edx, eax
  '0047BE7B: sub esp, 00000010h
  '0047BE7E: mov ecx, [ebp+10h]
  '0047BE81: mov [ebx], eax
  '0047BE83: mov eax, [ebp-28h]
  '0047BE86: mov edi, 00004004h
  '0047BE8B: mov [ebx+04h], eax
  '0047BE8E: mov eax, [ebp+0Ch]
  '0047BE91: mov [ebx+08h], eax
  '0047BE94: mov eax, [ebp-20h]
  '0047BE97: mov [ebx+0Ch], eax
  '0047BE9A: mov eax, esp
  '0047BE9C: sub esp, 00000010h
  '0047BE9F: mov [eax], edx
  '0047BEA1: mov edx, [ebp-38h]
  '0047BEA4: mov [eax+04h], edx
  '0047BEA7: mov edx, esp
  '0047BEA9: sub esp, 00000010h
  '0047BEAC: mov [eax+08h], ecx
  '0047BEAF: mov ecx, [ebp-30h]
  '0047BEB2: mov [eax+0Ch], ecx
  '0047BEB5: mov eax, [ebp-48h]
  '0047BEB8: mov ecx, [ebp+14h]
  '0047BEBB: mov [edx], edi
  '0047BEBD: mov [edx+04h], eax
  '0047BEC0: mov eax, [ebp-40h]
  '0047BEC3: mov [edx+08h], ecx
  '0047BEC6: mov ecx, esp
  '0047BEC8: push 00000004h
  '0047BECA: push 00000007h
  '0047BECC: mov [edx+0Ch], eax
  '0047BECF: mov edx, [ebp-58h]
  '0047BED2: mov eax, edi
  '0047BED4: push esi
  '0047BED5: mov [ecx], eax
  '0047BED7: mov eax, [ebp+18h]
  '0047BEDA: mov [ecx+04h], edx
  '0047BEDD: mov edx, [ebp-50h]
  '0047BEE0: mov [ecx+08h], eax
  '0047BEE3: mov [ecx+0Ch], edx
  '0047BEE6: call [00401068h]
  '0047BEEC: add esp, 0000004Ch
  '0047BEEF: mov [ebp-04h], 00000000h
  '0047BEF6: wait 
  '0047BEF7: push 0047BF13h
  '0047BEFC: jmp 47BF12h
  '0047BEFE: lea eax, [ebp-1Ch]
  '0047BF01: lea ecx, [ebp-18h]
  '0047BF04: push eax
  '0047BF05: push ecx
  '0047BF06: push 00000002h
  '0047BF08: call [004012CCh]
  '0047BF0E: add esp, 0000000Ch
  '0047BF11: ret 
End Sub
Private Sub UserControl__47AD00
  '0047AD00: push ebp
  '0047AD01: mov ebp, esp
  '0047AD03: sub esp, 0000000Ch
  '0047AD06: push 00403796h
  '0047AD0B: mov eax, fs:[00h]
  '0047AD11: push eax
  '0047AD12: mov fs:[00000000h], esp
  '0047AD19: sub esp, 00000010h
  '0047AD1C: push ebx
  '0047AD1D: push esi
  '0047AD1E: push edi
  '0047AD1F: mov [ebp-0Ch], esp
  '0047AD22: mov [ebp-08h], 00402440h
  '0047AD29: mov esi, [ebp+08h]
  '0047AD2C: mov eax, esi
  '0047AD2E: and eax, 00000001h
  '0047AD31: mov [ebp-04h], eax
  '0047AD34: and esi, FFFFFFFEh
  '0047AD37: push esi
  '0047AD38: mov [ebp+08h], esi
  '0047AD3B: mov ecx, [esi]
  '0047AD3D: call [ecx+04h]
  '0047AD40: mov edi, [esi]
  '0047AD42: xor ebx, ebx
  '0047AD44: push 0041A950h
  '0047AD49: mov [ebp-18h], ebx
  '0047AD4C: call [004011F0h]
  '0047AD52: lea edx, [ebp-18h]
  '0047AD55: push eax
  '0047AD56: push edx
  '0047AD57: call [004010F0h]
  '0047AD5D: push eax
  '0047AD5E: push esi
  '0047AD5F: call [edi+00000940h]
  '0047AD65: cmp eax, ebx
  '0047AD67: fclex 
  '0047AD69: jnl 47AD81h
  '0047AD6B: mov edi, [004010A8h]
  '0047AD71: push 00000940h
  '0047AD76: push 0041FF7Ch
  '0047AD7B: push esi
  '0047AD7C: push eax
  '0047AD7D: call edi
  '0047AD7F: jmp 47AD87h
  '0047AD81: mov edi, [004010A8h]
  '0047AD87: lea ecx, [ebp-18h]
  '0047AD8A: call [00401388h]
  '0047AD90: mov eax, [esi]
  '0047AD92: push 00000003h
  '0047AD94: push esi
  '0047AD95: call [eax+00000114h]
  '0047AD9B: cmp eax, ebx
  '0047AD9D: fclex 
  '0047AD9F: jnl 47ADAFh
  '0047ADA1: push 00000114h
  '0047ADA6: push 0041FF4Ch
  '0047ADAB: push esi
  '0047ADAC: push eax
  '0047ADAD: call edi
  '0047ADAF: mov ecx, [esi]
  '0047ADB1: push 00000003h
  '0047ADB3: push esi
  '0047ADB4: call [ecx+00000294h]
  '0047ADBA: cmp eax, ebx
  '0047ADBC: fclex 
  '0047ADBE: jnl 47ADCEh
  '0047ADC0: push 00000294h
  '0047ADC5: push 0041FF4Ch
  '0047ADCA: push esi
  '0047ADCB: push eax
  '0047ADCC: call edi
  '0047ADCE: call [00401108h]
  '0047ADD4: mov [ebp-04h], ebx
  '0047ADD7: push 0047ADE9h
  '0047ADDC: jmp 47ADE8h
  '0047ADDE: lea ecx, [ebp-18h]
  '0047ADE1: call [00401388h]
  '0047ADE7: ret 
End Sub
Private Sub UserControl__478F60
  '00478F60: push ebp
  '00478F61: mov ebp, esp
  '00478F63: sub esp, 0000000Ch
  '00478F66: push 00403796h
  '00478F6B: mov eax, fs:[00h]
  '00478F71: push eax
  '00478F72: mov fs:[00000000h], esp
  '00478F79: sub esp, 00000010h
  '00478F7C: push ebx
  '00478F7D: push esi
  '00478F7E: push edi
  '00478F7F: mov [ebp-0Ch], esp
  '00478F82: mov [ebp-08h], 00402408h
  '00478F89: mov esi, [ebp+08h]
  '00478F8C: mov eax, esi
  '00478F8E: and eax, 00000001h
  '00478F91: mov [ebp-04h], eax
  '00478F94: and esi, FFFFFFFEh
  '00478F97: push esi
  '00478F98: mov [ebp+08h], esi
  '00478F9B: mov ecx, [esi]
  '00478F9D: call [ecx+04h]
  '00478FA0: mov edx, [esi+3Ch]
  '00478FA3: xor edi, edi
  '00478FA5: push edx
  '00478FA6: mov [ebp-18h], edi
  '00478FA9: call 0041297Ch
  '00478FAE: call [004010A4h]
  '00478FB4: mov ebx, [esi]
  '00478FB6: push 00413978h
  '00478FBB: push edi
  '00478FBC: call [00401340h]
  '00478FC2: push eax
  '00478FC3: lea eax, [ebp-18h]
  '00478FC6: push eax
  '00478FC7: call [004010F0h]
  '00478FCD: push eax
  '00478FCE: push esi
  '00478FCF: call [ebx+00000940h]
  '00478FD5: cmp eax, edi
  '00478FD7: fclex 
  '00478FD9: jnl 478FEDh
  '00478FDB: push 00000940h
  '00478FE0: push 0041FF7Ch
  '00478FE5: push esi
  '00478FE6: push eax
  '00478FE7: call [004010A8h]
  '00478FED: lea ecx, [ebp-18h]
  '00478FF0: call [00401388h]
  '00478FF6: mov [ebp-04h], edi
  '00478FF9: push 0047900Bh
  '00478FFE: jmp 47900Ah
  '00479000: lea ecx, [ebp-18h]
  '00479003: call [00401388h]
  '00479009: ret 
End Sub
Private Sub UserControl__479030
  '00479030: push ebp
  '00479031: mov ebp, esp
  '00479033: sub esp, 0000000Ch
  '00479036: push 00403796h
  '0047903B: mov eax, fs:[00h]
  '00479041: push eax
  '00479042: mov fs:[00000000h], esp
  '00479049: sub esp, 0000008Ch
  '0047904F: push ebx
  '00479050: push esi
  '00479051: push edi
  '00479052: mov [ebp-0Ch], esp
  '00479055: mov [ebp-08h], 00402418h
  '0047905C: mov esi, [ebp+08h]
  '0047905F: mov eax, esi
  '00479061: and eax, 00000001h
  '00479064: mov [ebp-04h], eax
  '00479067: and esi, FFFFFFFEh
  '0047906A: push esi
  '0047906B: mov [ebp+08h], esi
  '0047906E: mov ecx, [esi]
  '00479070: call [ecx+04h]
  '00479073: mov edi, [ebp+0Ch]
  '00479076: mov edx, [esi]
  '00479078: xor eax, eax
  '0047907A: mov ebx, [edi]
  '0047907C: mov [ebp-18h], eax
  '0047907F: mov [ebp-1Ch], eax
  '00479082: mov [ebp-20h], eax
  '00479085: mov [ebp-24h], eax
  '00479088: mov [ebp-34h], eax
  '0047908B: mov [ebp-44h], eax
  '0047908E: mov [ebp-54h], eax
  '00479091: mov [ebp-68h], eax
  '00479094: lea eax, [ebp-1Ch]
  '00479097: push eax
  '00479098: push esi
  '00479099: call [edx+000002B0h]
  '0047909F: test eax, eax
  '004790A1: fclex 
  '004790A3: jnl 4790B7h
  '004790A5: push 000002B0h
  '004790AA: push 0041FF4Ch
  '004790AF: push esi
  '004790B0: push eax
  '004790B1: call [004010A8h]
  '004790B7: mov eax, [ebp-1Ch]
  '004790BA: lea edx, [ebp-18h]
  '004790BD: push edx
  '004790BE: push eax
  '004790BF: mov ecx, [eax]
  '004790C1: mov [ebp-70h], eax
  '004790C4: call [ecx+20h]
  '004790C7: test eax, eax
  '004790C9: fclex 
  '004790CB: jnl 4790DFh
  '004790CD: mov ecx, [ebp-70h]
  '004790D0: push 00000020h
  '004790D2: push 0041BDC4h
  '004790D7: push ecx
  '004790D8: push eax
  '004790D9: call [004010A8h]
  '004790DF: mov edx, [esi+000000B8h]
  '004790E5: mov eax, [ebp-18h]
  '004790E8: sub esp, 00000010h
  '004790EB: mov [ebp-4Ch], edx
  '004790EE: mov [ebp-2Ch], eax
  '004790F1: mov edx, esp
  '004790F3: mov eax, 00000008h
  '004790F8: sub esp, 00000010h
  '004790FB: mov [ebp-34h], eax
  '004790FE: mov [ebp-54h], eax
  '00479101: mov [edx], eax
  '00479103: mov eax, [ebp-30h]
  '00479106: mov [ebp-18h], 00000000h
  '0047910D: mov ecx, [ebx]
  '0047910F: mov [edx+04h], eax
  '00479112: mov eax, [ebp-2Ch]
  '00479115: mov [edx+08h], eax
  '00479118: mov eax, [ebp-28h]
  '0047911B: mov [edx+0Ch], eax
  '0047911E: mov eax, [ebp-54h]
  '00479121: mov edx, esp
  '00479123: push 00420844h
  '00479128: push ebx
  '00479129: mov [edx], eax
  '0047912B: mov eax, [ebp-50h]
  '0047912E: mov [edx+04h], eax
  '00479131: mov eax, [ebp-4Ch]
  '00479134: mov [edx+08h], eax
  '00479137: mov eax, [ebp-48h]
  '0047913A: mov [edx+0Ch], eax
  '0047913D: call [ecx+20h]
  '00479140: test eax, eax
  '00479142: fclex 
  '00479144: jnl 479155h
  '00479146: push 00000020h
  '00479148: push 004207F8h
  '0047914D: push ebx
  '0047914E: push eax
  '0047914F: call [004010A8h]
  '00479155: lea ecx, [ebp-1Ch]
  '00479158: call [00401388h]
  '0047915E: lea ecx, [ebp-34h]
  '00479161: call [00401034h]
  '00479167: mov edx, [edi]
  '00479169: mov ebx, [esi+000000BCh]
  '0047916F: mov [ebp-6Ch], edx
  '00479172: mov [ebp-4Ch], ebx
  '00479175: mov [ebp-54h], 00000003h
  '0047917C: mov edx, [edx]
  '0047917E: mov ebx, [ebp-60h]
  '00479181: sub esp, 00000010h
  '00479184: mov [ebp-0000009Ch], edx
  '0047918A: mov edx, esp
  '0047918C: mov ecx, 00000002h
  '00479191: mov eax, 00000001h
  '00479196: mov [edx], ecx
  '00479198: sub esp, 00000010h
  '0047919B: mov ecx, esp
  '0047919D: mov [edx+04h], ebx
  '004791A0: push 00420858h
  '004791A5: mov [edx+08h], eax
  '004791A8: mov eax, [ebp-58h]
  '004791AB: mov [edx+0Ch], eax
  '004791AE: mov edx, [ebp-54h]
  '004791B1: mov eax, [ebp-50h]
  '004791B4: mov [ecx], edx
  '004791B6: mov edx, [ebp-4Ch]
  '004791B9: mov [ecx+04h], eax
  '004791BC: mov eax, [ebp-48h]
  '004791BF: mov [ecx+08h], edx
  '004791C2: mov edx, [ebp-0000009Ch]
  '004791C8: mov [ecx+0Ch], eax
  '004791CB: mov ecx, [ebp-6Ch]
  '004791CE: push ecx
  '004791CF: call [edx+20h]
  '004791D2: test eax, eax
  '004791D4: fclex 
  '004791D6: jnl 4791EAh
  '004791D8: mov ecx, [ebp-6Ch]
  '004791DB: push 00000020h
  '004791DD: push 004207F8h
  '004791E2: push ecx
  '004791E3: push eax
  '004791E4: call [004010A8h]
  '004791EA: mov edx, [esi+000000C0h]
  '004791F0: sub esp, 00000010h
  '004791F3: mov [ebp-4Ch], edx
  '004791F6: mov edx, esp
  '004791F8: mov eax, 00000002h
  '004791FD: sub esp, 00000010h
  '00479200: mov [edx], eax
  '00479202: mov [ebp-54h], 00000003h
  '00479209: mov ecx, [edi]
  '0047920B: mov [edx+04h], ebx
  '0047920E: mov [ebp-6Ch], ecx
  '00479211: mov ecx, [ecx]
  '00479213: mov [edx+08h], eax
  '00479216: mov eax, [ebp-58h]
  '00479219: mov [edx+0Ch], eax
  '0047921C: mov eax, [ebp-54h]
  '0047921F: mov edx, esp
  '00479221: push 0042087Ch
  '00479226: mov [edx], eax
  '00479228: mov eax, [ebp-50h]
  '0047922B: mov [edx+04h], eax
  '0047922E: mov eax, [ebp-4Ch]
  '00479231: mov [edx+08h], eax
  '00479234: mov eax, [ebp-48h]
  '00479237: mov [edx+0Ch], eax
  '0047923A: mov edx, [ebp-6Ch]
  '0047923D: push edx
  '0047923E: call [ecx+20h]
  '00479241: test eax, eax
  '00479243: fclex 
  '00479245: jnl 479259h
  '00479247: mov ecx, [ebp-6Ch]
  '0047924A: push 00000020h
  '0047924C: push 004207F8h
  '00479251: push ecx
  '00479252: push eax
  '00479253: call [004010A8h]
  '00479259: mov edx, [esi+000000C4h]
  '0047925F: sub esp, 00000010h
  '00479262: mov [ebp-4Ch], edx
  '00479265: mov edx, esp
  '00479267: mov ecx, 00000009h
  '0047926C: mov [ebp-2Ch], 00000000h
  '00479273: mov [ebp-34h], ecx
  '00479276: mov [ebp-54h], ecx
  '00479279: mov [edx], ecx
  '0047927B: mov ecx, [ebp-30h]
  '0047927E: sub esp, 00000010h
  '00479281: mov eax, [edi]
  '00479283: mov [edx+04h], ecx
  '00479286: mov ecx, [ebp-2Ch]
  '00479289: mov [ebp-6Ch], eax
  '0047928C: mov eax, [eax]
  '0047928E: mov [edx+08h], ecx
  '00479291: mov ecx, [ebp-28h]
  '00479294: mov [edx+0Ch], ecx
  '00479297: mov ecx, [ebp-54h]
  '0047929A: mov edx, esp
  '0047929C: push 00420898h
  '004792A1: mov [edx], ecx
  '004792A3: mov ecx, [ebp-50h]
  '004792A6: mov [edx+04h], ecx
  '004792A9: mov ecx, [ebp-4Ch]
  '004792AC: mov [edx+08h], ecx
  '004792AF: mov ecx, [ebp-48h]
  '004792B2: mov [edx+0Ch], ecx
  '004792B5: mov edx, [ebp-6Ch]
  '004792B8: push edx
  '004792B9: call [eax+20h]
  '004792BC: test eax, eax
  '004792BE: fclex 
  '004792C0: jnl 4792D4h
  '004792C2: mov ecx, [ebp-6Ch]
  '004792C5: push 00000020h
  '004792C7: push 004207F8h
  '004792CC: push ecx
  '004792CD: push eax
  '004792CE: call [004010A8h]
  '004792D4: lea ecx, [ebp-34h]
  '004792D7: call [00401034h]
  '004792DD: mov edx, [esi+000000C8h]
  '004792E3: sub esp, 00000010h
  '004792E6: mov [ebp-4Ch], edx
  '004792E9: mov edx, esp
  '004792EB: mov eax, 00000002h
  '004792F0: sub esp, 00000010h
  '004792F3: mov [edx], eax
  '004792F5: mov eax, 00000020h
  '004792FA: mov [ebp-54h], 00000003h
  '00479301: mov ecx, [edi]
  '00479303: mov [edx+04h], ebx
  '00479306: mov [ebp-6Ch], ecx
  '00479309: mov ecx, [ecx]
  '0047930B: mov [edx+08h], eax
  '0047930E: mov eax, [ebp-58h]
  '00479311: mov [edx+0Ch], eax
  '00479314: mov eax, [ebp-54h]
  '00479317: mov edx, esp
  '00479319: push 004208ACh
  '0047931E: mov [edx], eax
  '00479320: mov eax, [ebp-50h]
  '00479323: mov [edx+04h], eax
  '00479326: mov eax, [ebp-4Ch]
  '00479329: mov [edx+08h], eax
  '0047932C: mov eax, [ebp-48h]
  '0047932F: mov [edx+0Ch], eax
  '00479332: mov edx, [ebp-6Ch]
  '00479335: push edx
  '00479336: call [ecx+20h]
  '00479339: test eax, eax
  '0047933B: fclex 
  '0047933D: jnl 479351h
  '0047933F: mov ecx, [ebp-6Ch]
  '00479342: push 00000020h
  '00479344: push 004207F8h
  '00479349: push ecx
  '0047934A: push eax
  '0047934B: call [004010A8h]
  '00479351: mov edx, [esi+000000CCh]
  '00479357: sub esp, 00000010h
  '0047935A: mov [ebp-4Ch], edx
  '0047935D: mov edx, esp
  '0047935F: mov eax, 00000002h
  '00479364: sub esp, 00000010h
  '00479367: mov [edx], eax
  '00479369: mov eax, 00000020h
  '0047936E: mov [ebp-54h], 00000003h
  '00479375: mov ecx, [edi]
  '00479377: mov [edx+04h], ebx
  '0047937A: mov [ebp-6Ch], ecx
  '0047937D: mov ecx, [ecx]
  '0047937F: mov [edx+08h], eax
  '00479382: mov eax, [ebp-58h]
  '00479385: mov [edx+0Ch], eax
  '00479388: mov eax, [ebp-54h]
  '0047938B: mov edx, esp
  '0047938D: push 004208CCh
  '00479392: mov [edx], eax
  '00479394: mov eax, [ebp-50h]
  '00479397: mov [edx+04h], eax
  '0047939A: mov eax, [ebp-4Ch]
  '0047939D: mov [edx+08h], eax
  '004793A0: mov eax, [ebp-48h]
  '004793A3: mov [edx+0Ch], eax
  '004793A6: mov edx, [ebp-6Ch]
  '004793A9: push edx
  '004793AA: call [ecx+20h]
  '004793AD: test eax, eax
  '004793AF: fclex 
  '004793B1: jnl 4793C5h
  '004793B3: mov ecx, [ebp-6Ch]
  '004793B6: push 00000020h
  '004793B8: push 004207F8h
  '004793BD: push ecx
  '004793BE: push eax
  '004793BF: call [004010A8h]
  '004793C5: mov edx, [esi+000000D0h]
  '004793CB: sub esp, 00000010h
  '004793CE: mov [ebp-4Ch], edx
  '004793D1: mov edx, esp
  '004793D3: mov eax, 00000002h
  '004793D8: sub esp, 00000010h
  '004793DB: mov [edx], eax
  '004793DD: mov eax, 00000001h
  '004793E2: mov [ebp-54h], 00000003h
  '004793E9: mov ecx, [edi]
  '004793EB: mov [edx+04h], ebx
  '004793EE: mov [ebp-6Ch], ecx
  '004793F1: mov ecx, [ecx]
  '004793F3: mov [edx+08h], eax
  '004793F6: mov eax, [ebp-58h]
  '004793F9: mov [edx+0Ch], eax
  '004793FC: mov eax, [ebp-54h]
  '004793FF: mov edx, esp
  '00479401: push 004208ECh
  '00479406: mov [edx], eax
  '00479408: mov eax, [ebp-50h]
  '0047940B: mov [edx+04h], eax
  '0047940E: mov eax, [ebp-4Ch]
  '00479411: mov [edx+08h], eax
  '00479414: mov eax, [ebp-48h]
  '00479417: mov [edx+0Ch], eax
  '0047941A: mov edx, [ebp-6Ch]
  '0047941D: push edx
  '0047941E: call [ecx+20h]
  '00479421: test eax, eax
  '00479423: fclex 
  '00479425: jnl 479439h
  '00479427: mov ecx, [ebp-6Ch]
  '0047942A: push 00000020h
  '0047942C: push 004207F8h
  '00479431: push ecx
  '00479432: push eax
  '00479433: call [004010A8h]
  '00479439: mov edx, [esi+000000A8h]
  '0047943F: sub esp, 00000010h
  '00479442: mov [ebp-4Ch], edx
  '00479445: mov edx, esp
  '00479447: mov eax, 00000002h
  '0047944C: sub esp, 00000010h
  '0047944F: mov [edx], eax
  '00479451: mov eax, 00000020h
  '00479456: mov [ebp-54h], 00000003h
  '0047945D: mov ecx, [edi]
  '0047945F: mov [edx+04h], ebx
  '00479462: mov [ebp-6Ch], ecx
  '00479465: mov ecx, [ecx]
  '00479467: mov [edx+08h], eax
  '0047946A: mov eax, [ebp-58h]
  '0047946D: mov [edx+0Ch], eax
  '00479470: mov eax, [ebp-54h]
  '00479473: mov edx, esp
  '00479475: push 00420908h
  '0047947A: mov [edx], eax
  '0047947C: mov eax, [ebp-50h]
  '0047947F: mov [edx+04h], eax
  '00479482: mov eax, [ebp-4Ch]
  '00479485: mov [edx+08h], eax
  '00479488: mov eax, [ebp-48h]
  '0047948B: mov [edx+0Ch], eax
  '0047948E: mov edx, [ebp-6Ch]
  '00479491: push edx
  '00479492: call [ecx+20h]
  '00479495: test eax, eax
  '00479497: fclex 
  '00479499: jnl 4794ADh
  '0047949B: mov ecx, [ebp-6Ch]
  '0047949E: push 00000020h
  '004794A0: push 004207F8h
  '004794A5: push ecx
  '004794A6: push eax
  '004794A7: call [004010A8h]
  '004794AD: mov edx, [esi+000000ACh]
  '004794B3: sub esp, 00000010h
  '004794B6: mov [ebp-4Ch], edx
  '004794B9: mov edx, esp
  '004794BB: mov eax, 00000002h
  '004794C0: sub esp, 00000010h
  '004794C3: mov [edx], eax
  '004794C5: mov eax, 00000020h
  '004794CA: mov [ebp-54h], 00000003h
  '004794D1: mov ecx, [edi]
  '004794D3: mov [edx+04h], ebx
  '004794D6: mov [ebp-6Ch], ecx
  '004794D9: mov ecx, [ecx]
  '004794DB: mov [edx+08h], eax
  '004794DE: mov eax, [ebp-58h]
  '004794E1: mov [edx+0Ch], eax
  '004794E4: mov eax, [ebp-54h]
  '004794E7: mov edx, esp
  '004794E9: push 00420930h
  '004794EE: mov [edx], eax
  '004794F0: mov eax, [ebp-50h]
  '004794F3: mov [edx+04h], eax
  '004794F6: mov eax, [ebp-4Ch]
  '004794F9: mov [edx+08h], eax
  '004794FC: mov eax, [ebp-48h]
  '004794FF: mov [edx+0Ch], eax
  '00479502: mov edx, [ebp-6Ch]
  '00479505: push edx
  '00479506: call [ecx+20h]
  '00479509: test eax, eax
  '0047950B: fclex 
  '0047950D: jnl 479521h
  '0047950F: mov ecx, [ebp-6Ch]
  '00479512: push 00000020h
  '00479514: push 004207F8h
  '00479519: push ecx
  '0047951A: push eax
  '0047951B: call [004010A8h]
  '00479521: mov edx, [esi+000000B4h]
  '00479527: sub esp, 00000010h
  '0047952A: mov [ebp-4Ch], edx
  '0047952D: mov edx, esp
  '0047952F: mov ecx, 00000009h
  '00479534: mov [ebp-2Ch], 00000000h
  '0047953B: mov [ebp-34h], ecx
  '0047953E: mov [ebp-54h], ecx
  '00479541: mov [edx], ecx
  '00479543: mov ecx, [ebp-30h]
  '00479546: sub esp, 00000010h
  '00479549: mov eax, [edi]
  '0047954B: mov [edx+04h], ecx
  '0047954E: mov ecx, [ebp-2Ch]
  '00479551: mov [ebp-6Ch], eax
  '00479554: mov eax, [eax]
  '00479556: mov [edx+08h], ecx
  '00479559: mov ecx, [ebp-28h]
  '0047955C: mov [edx+0Ch], ecx
  '0047955F: mov ecx, [ebp-54h]
  '00479562: mov edx, esp
  '00479564: push 00420974h
  '00479569: mov [edx], ecx
  '0047956B: mov ecx, [ebp-50h]
  '0047956E: mov [edx+04h], ecx
  '00479571: mov ecx, [ebp-4Ch]
  '00479574: mov [edx+08h], ecx
  '00479577: mov ecx, [ebp-48h]
  '0047957A: mov [edx+0Ch], ecx
  '0047957D: mov edx, [ebp-6Ch]
  '00479580: push edx
  '00479581: call [eax+20h]
  '00479584: test eax, eax
  '00479586: fclex 
  '00479588: jnl 47959Ch
  '0047958A: mov ecx, [ebp-6Ch]
  '0047958D: push 00000020h
  '0047958F: push 004207F8h
  '00479594: push ecx
  '00479595: push eax
  '00479596: call [004010A8h]
  '0047959C: lea ecx, [ebp-34h]
  '0047959F: call [00401034h]
  '004795A5: mov eax, [esi+10h]
  '004795A8: lea ecx, [ebp-68h]
  '004795AB: push ecx
  '004795AC: push eax
  '004795AD: mov edx, [eax]
  '004795AF: call [edx+00000090h]
  '004795B5: test eax, eax
  '004795B7: fclex 
  '004795B9: jnl 4795D0h
  '004795BB: mov edx, [esi+10h]
  '004795BE: push 00000090h
  '004795C3: push 0041FF4Ch
  '004795C8: push edx
  '004795C9: push eax
  '004795CA: call [004010A8h]
  '004795D0: mov dx, [ebp-68h]
  '004795D4: sub esp, 00000010h
  '004795D7: mov [ebp-4Ch], dx
  '004795DB: mov edx, esp
  '004795DD: mov eax, 0000000Bh
  '004795E2: sub esp, 00000010h
  '004795E5: mov [edx], eax
  '004795E7: mov [ebp-54h], eax
  '004795EA: or eax, FFFFFFFFh
  '004795ED: mov ecx, [edi]
  '004795EF: mov [edx+04h], ebx
  '004795F2: mov [ebp-70h], ecx
  '004795F5: mov ecx, [ecx]
  '004795F7: mov [edx+08h], eax
  '004795FA: mov eax, [ebp-58h]
  '004795FD: mov [edx+0Ch], eax
  '00479600: mov eax, [ebp-54h]
  '00479603: mov edx, esp
  '00479605: push 004209ACh
  '0047960A: mov [edx], eax
  '0047960C: mov eax, [ebp-50h]
  '0047960F: mov [edx+04h], eax
  '00479612: mov eax, [ebp-4Ch]
  '00479615: mov [edx+08h], eax
  '00479618: mov eax, [ebp-48h]
  '0047961B: mov [edx+0Ch], eax
  '0047961E: mov edx, [ebp-70h]
  '00479621: push edx
  '00479622: call [ecx+20h]
  '00479625: test eax, eax
  '00479627: fclex 
  '00479629: jnl 47963Dh
  '0047962B: mov ecx, [ebp-70h]
  '0047962E: push 00000020h
  '00479630: push 004207F8h
  '00479635: push ecx
  '00479636: push eax
  '00479637: call [004010A8h]
  '0047963D: lea ecx, [ebp-54h]
  '00479640: call [00401034h]
  '00479646: mov eax, [esi+10h]
  '00479649: lea ecx, [ebp-1Ch]
  '0047964C: push ecx
  '0047964D: push eax
  '0047964E: mov edx, [eax]
  '00479650: call [edx+00000248h]
  '00479656: test eax, eax
  '00479658: fclex 
  '0047965A: jnl 479671h
  '0047965C: mov edx, [esi+10h]
  '0047965F: push 00000248h
  '00479664: push 0041FF4Ch
  '00479669: push edx
  '0047966A: push eax
  '0047966B: call [004010A8h]
  '00479671: mov eax, [edi]
  '00479673: mov ecx, [esi]
  '00479675: lea edx, [ebp-20h]
  '00479678: mov [ebp-7Ch], eax
  '0047967B: push edx
  '0047967C: push esi
  '0047967D: call [ecx+000002B0h]
  '00479683: test eax, eax
  '00479685: fclex 
  '00479687: jnl 47969Bh
  '00479689: push 000002B0h
  '0047968E: push 0041FF4Ch
  '00479693: push esi
  '00479694: push eax
  '00479695: call [004010A8h]
  '0047969B: mov eax, [ebp-20h]
  '0047969E: lea edx, [ebp-24h]
  '004796A1: push edx
  '004796A2: push eax
  '004796A3: mov ecx, [eax]
  '004796A5: mov [ebp-74h], eax
  '004796A8: call [ecx+24h]
  '004796AB: test eax, eax
  '004796AD: fclex 
  '004796AF: jnl 4796C3h
  '004796B1: mov ecx, [ebp-74h]
  '004796B4: push 00000024h
  '004796B6: push 0041BDC4h
  '004796BB: push ecx
  '004796BC: push eax
  '004796BD: call [004010A8h]
  '004796C3: mov eax, [ebp-24h]
  '004796C6: mov ecx, [ebp-1Ch]
  '004796C9: mov edx, [ebp-7Ch]
  '004796CC: mov [ebp-3Ch], eax
  '004796CF: mov eax, 00000009h
  '004796D4: mov [ebp-24h], 00000000h
  '004796DB: mov [ebp-44h], eax
  '004796DE: mov [ebp-1Ch], 00000000h
  '004796E5: mov [ebp-2Ch], ecx
  '004796E8: mov [ebp-34h], eax
  '004796EB: mov ecx, [edx]
  '004796ED: sub esp, 00000010h
  '004796F0: mov edx, esp
  '004796F2: sub esp, 00000010h
  '004796F5: mov [edx], eax
  '004796F7: mov eax, [ebp-40h]
  '004796FA: mov [edx+04h], eax
  '004796FD: mov eax, [ebp-3Ch]
  '00479700: mov [edx+08h], eax
  '00479703: mov eax, [ebp-38h]
  '00479706: mov [edx+0Ch], eax
  '00479709: mov eax, [ebp-34h]
  '0047970C: mov edx, esp
  '0047970E: push 00420958h
  '00479713: mov [edx], eax
  '00479715: mov eax, [ebp-30h]
  '00479718: mov [edx+04h], eax
  '0047971B: mov eax, [ebp-2Ch]
  '0047971E: mov [edx+08h], eax
  '00479721: mov eax, [ebp-28h]
  '00479724: mov [edx+0Ch], eax
  '00479727: mov edx, [ebp-7Ch]
  '0047972A: push edx
  '0047972B: call [ecx+20h]
  '0047972E: test eax, eax
  '00479730: fclex 
  '00479732: jnl 479746h
  '00479734: mov ecx, [ebp-7Ch]
  '00479737: push 00000020h
  '00479739: push 004207F8h
  '0047973E: push ecx
  '0047973F: push eax
  '00479740: call [004010A8h]
  '00479746: lea ecx, [ebp-20h]
  '00479749: call [00401388h]
  '0047974F: lea edx, [ebp-44h]
  '00479752: lea eax, [ebp-34h]
  '00479755: push edx
  '00479756: push eax
  '00479757: push 00000002h
  '00479759: call [00401058h]
  '0047975F: mov ecx, [esi]
  '00479761: add esp, 0000000Ch
  '00479764: lea edx, [ebp-1Ch]
  '00479767: push edx
  '00479768: push esi
  '00479769: call [ecx+000007C4h]
  '0047976F: test eax, eax
  '00479771: jnl 479785h
  '00479773: push 000007C4h
  '00479778: push 0041FF7Ch
  '0047977D: push esi
  '0047977E: push eax
  '0047977F: call [004010A8h]
  '00479785: mov edx, [ebp-1Ch]
  '00479788: sub esp, 00000010h
  '0047978B: mov [ebp-2Ch], edx
  '0047978E: mov edx, esp
  '00479790: mov ecx, 00000009h
  '00479795: mov [ebp-3Ch], 00000000h
  '0047979C: mov [ebp-44h], ecx
  '0047979F: mov [ebp-34h], ecx
  '004797A2: mov [edx], ecx
  '004797A4: mov ecx, [ebp-40h]
  '004797A7: sub esp, 00000010h
  '004797AA: mov eax, [edi]
  '004797AC: mov [edx+04h], ecx
  '004797AF: mov ecx, [ebp-3Ch]
  '004797B2: mov [ebp-70h], eax
  '004797B5: mov [ebp-1Ch], 00000000h
  '004797BC: mov [edx+08h], ecx
  '004797BF: mov ecx, [ebp-38h]
  '004797C2: mov eax, [eax]
  '004797C4: mov [edx+0Ch], ecx
  '004797C7: mov ecx, [ebp-34h]
  '004797CA: mov edx, esp
  '004797CC: push 00420994h
  '004797D1: mov [edx], ecx
  '004797D3: mov ecx, [ebp-30h]
  '004797D6: mov [edx+04h], ecx
  '004797D9: mov ecx, [ebp-2Ch]
  '004797DC: mov [edx+08h], ecx
  '004797DF: mov ecx, [ebp-28h]
  '004797E2: mov [edx+0Ch], ecx
  '004797E5: mov edx, [ebp-70h]
  '004797E8: push edx
  '004797E9: call [eax+20h]
  '004797EC: test eax, eax
  '004797EE: fclex 
  '004797F0: jnl 479804h
  '004797F2: mov ecx, [ebp-70h]
  '004797F5: push 00000020h
  '004797F7: push 004207F8h
  '004797FC: push ecx
  '004797FD: push eax
  '004797FE: call [004010A8h]
  '00479804: lea edx, [ebp-44h]
  '00479807: lea eax, [ebp-34h]
  '0047980A: push edx
  '0047980B: push eax
  '0047980C: push 00000002h
  '0047980E: call [00401058h]
  '00479814: mov eax, [esi+10h]
  '00479817: add esp, 0000000Ch
  '0047981A: lea edx, [ebp-68h]
  '0047981D: mov ecx, [eax]
  '0047981F: push edx
  '00479820: push eax
  '00479821: call [ecx+000000A0h]
  '00479827: test eax, eax
  '00479829: fclex 
  '0047982B: jnl 479842h
  '0047982D: mov ecx, [esi+10h]
  '00479830: push 000000A0h
  '00479835: push 0041FF4Ch
  '0047983A: push ecx
  '0047983B: push eax
  '0047983C: call [004010A8h]
  '00479842: mov eax, [edi]
  '00479844: mov dx, [ebp-68h]
  '00479848: mov ecx, 00000002h
  '0047984D: mov [ebp-4Ch], dx
  '00479851: mov [ebp-54h], ecx
  '00479854: mov edx, [eax]
  '00479856: sub esp, 00000010h
  '00479859: mov [ebp-000000A0h], edx
  '0047985F: mov edx, esp
  '00479861: mov [ebp-70h], eax
  '00479864: xor eax, eax
  '00479866: sub esp, 00000010h
  '00479869: mov [edx], ecx
  '0047986B: mov ecx, esp
  '0047986D: push 004209C0h
  '00479872: mov [edx+04h], ebx
  '00479875: mov [edx+08h], eax
  '00479878: mov eax, [ebp-58h]
  '0047987B: mov [edx+0Ch], eax
  '0047987E: mov edx, [ebp-54h]
  '00479881: mov eax, [ebp-50h]
  '00479884: mov [ecx], edx
  '00479886: mov edx, [ebp-4Ch]
  '00479889: mov [ecx+04h], eax
  '0047988C: mov eax, [ebp-48h]
  '0047988F: mov [ecx+08h], edx
  '00479892: mov edx, [ebp-000000A0h]
  '00479898: mov [ecx+0Ch], eax
  '0047989B: mov ecx, [ebp-70h]
  '0047989E: push ecx
  '0047989F: call [edx+20h]
  '004798A2: test eax, eax
  '004798A4: fclex 
  '004798A6: jnl 4798BAh
  '004798A8: mov ecx, [ebp-70h]
  '004798AB: push 00000020h
  '004798AD: push 004207F8h
  '004798B2: push ecx
  '004798B3: push eax
  '004798B4: call [004010A8h]
  '004798BA: mov dx, [esi+00000100h]
  '004798C1: sub esp, 00000010h
  '004798C4: mov [ebp-4Ch], dx
  '004798C8: mov edx, esp
  '004798CA: mov eax, 00000002h
  '004798CF: sub esp, 00000010h
  '004798D2: mov [edx], eax
  '004798D4: mov eax, 00000001h
  '004798D9: mov [ebp-54h], 0000000Bh
  '004798E0: mov ecx, [edi]
  '004798E2: mov [edx+04h], ebx
  '004798E5: mov [ebp-6Ch], ecx
  '004798E8: mov ecx, [ecx]
  '004798EA: mov [edx+08h], eax
  '004798ED: mov eax, [ebp-58h]
  '004798F0: mov [edx+0Ch], eax
  '004798F3: mov eax, [ebp-54h]
  '004798F6: mov edx, esp
  '004798F8: push 00420824h
  '004798FD: mov [edx], eax
  '004798FF: mov eax, [ebp-50h]
  '00479902: mov [edx+04h], eax
  '00479905: mov eax, [ebp-4Ch]
  '00479908: mov [edx+08h], eax
  '0047990B: mov eax, [ebp-48h]
  '0047990E: mov [edx+0Ch], eax
  '00479911: mov edx, [ebp-6Ch]
  '00479914: push edx
  '00479915: call [ecx+20h]
  '00479918: test eax, eax
  '0047991A: fclex 
  '0047991C: jnl 479930h
  '0047991E: mov ecx, [ebp-6Ch]
  '00479921: push 00000020h
  '00479923: push 004207F8h
  '00479928: push ecx
  '00479929: push eax
  '0047992A: call [004010A8h]
  '00479930: lea ecx, [ebp-54h]
  '00479933: call [00401034h]
  '00479939: mov edx, [esi+000000FCh]
  '0047993F: sub esp, 00000010h
  '00479942: mov [ebp-4Ch], edx
  '00479945: mov edx, esp
  '00479947: mov eax, 00000008h
  '0047994C: sub esp, 00000010h
  '0047994F: mov [edx], eax
  '00479951: mov [ebp-54h], eax
  '00479954: mov eax, 0040FE84h
  '00479959: mov ecx, [edi]
  '0047995B: mov [edx+04h], ebx
  '0047995E: mov [ebp-6Ch], ecx
  '00479961: mov ecx, [ecx]
  '00479963: mov [edx+08h], eax
  '00479966: mov eax, [ebp-58h]
  '00479969: mov [edx+0Ch], eax
  '0047996C: mov eax, [ebp-54h]
  '0047996F: mov edx, esp
  '00479971: push 004209E0h
  '00479976: mov [edx], eax
  '00479978: mov eax, [ebp-50h]
  '0047997B: mov [edx+04h], eax
  '0047997E: mov eax, [ebp-4Ch]
  '00479981: mov [edx+08h], eax
  '00479984: mov eax, [ebp-48h]
  '00479987: mov [edx+0Ch], eax
  '0047998A: mov edx, [ebp-6Ch]
  '0047998D: push edx
  '0047998E: call [ecx+20h]
  '00479991: test eax, eax
  '00479993: fclex 
  '00479995: jnl 4799A9h
  '00479997: mov ecx, [ebp-6Ch]
  '0047999A: push 00000020h
  '0047999C: push 004207F8h
  '004799A1: push ecx
  '004799A2: push eax
  '004799A3: call [004010A8h]
  '004799A9: mov edx, [esi+00000124h]
  '004799AF: sub esp, 00000010h
  '004799B2: mov [ebp-4Ch], edx
  '004799B5: mov edx, esp
  '004799B7: mov eax, 00000003h
  '004799BC: sub esp, 00000010h
  '004799BF: mov [edx], eax
  '004799C1: mov [ebp-54h], eax
  '004799C4: mov eax, 80000014h
  '004799C9: mov ecx, [edi]
  '004799CB: mov [edx+04h], ebx
  '004799CE: mov [ebp-6Ch], ecx
  '004799D1: mov ecx, [ecx]
  '004799D3: mov [edx+08h], eax
  '004799D6: mov eax, [ebp-58h]
  '004799D9: mov [edx+0Ch], eax
  '004799DC: mov eax, [ebp-54h]
  '004799DF: mov edx, esp
  '004799E1: push 004209ECh
  '004799E6: mov [edx], eax
  '004799E8: mov eax, [ebp-50h]
  '004799EB: mov [edx+04h], eax
  '004799EE: mov eax, [ebp-4Ch]
  '004799F1: mov [edx+08h], eax
  '004799F4: mov eax, [ebp-48h]
  '004799F7: mov [edx+0Ch], eax
  '004799FA: mov edx, [ebp-6Ch]
  '004799FD: push edx
  '004799FE: call [ecx+20h]
  '00479A01: test eax, eax
  '00479A03: fclex 
  '00479A05: jnl 479A19h
  '00479A07: mov ecx, [ebp-6Ch]
  '00479A0A: push 00000020h
  '00479A0C: push 004207F8h
  '00479A11: push ecx
  '00479A12: push eax
  '00479A13: call [004010A8h]
  '00479A19: mov edx, [esi+00000128h]
  '00479A1F: sub esp, 00000010h
  '00479A22: mov [ebp-4Ch], edx
  '00479A25: mov edx, esp
  '00479A27: mov eax, 00000003h
  '00479A2C: sub esp, 00000010h
  '00479A2F: mov [edx], eax
  '00479A31: mov [ebp-54h], eax
  '00479A34: mov eax, 80000016h
  '00479A39: mov ecx, [edi]
  '00479A3B: mov [edx+04h], ebx
  '00479A3E: mov [ebp-6Ch], ecx
  '00479A41: mov ecx, [ecx]
  '00479A43: mov [edx+08h], eax
  '00479A46: mov eax, [ebp-58h]
  '00479A49: mov [edx+0Ch], eax
  '00479A4C: mov eax, [ebp-54h]
  '00479A4F: mov edx, esp
  '00479A51: push 00420A10h
  '00479A56: mov [edx], eax
  '00479A58: mov eax, [ebp-50h]
  '00479A5B: mov [edx+04h], eax
  '00479A5E: mov eax, [ebp-4Ch]
  '00479A61: mov [edx+08h], eax
  '00479A64: mov eax, [ebp-48h]
  '00479A67: mov [edx+0Ch], eax
  '00479A6A: mov edx, [ebp-6Ch]
  '00479A6D: push edx
  '00479A6E: call [ecx+20h]
  '00479A71: test eax, eax
  '00479A73: fclex 
  '00479A75: jnl 479A89h
  '00479A77: mov ecx, [ebp-6Ch]
  '00479A7A: push 00000020h
  '00479A7C: push 004207F8h
  '00479A81: push ecx
  '00479A82: push eax
  '00479A83: call [004010A8h]
  '00479A89: mov dx, [esi+00000120h]
  '00479A90: sub esp, 00000010h
  '00479A93: mov [ebp-4Ch], dx
  '00479A97: mov edx, esp
  '00479A99: mov eax, 00000002h
  '00479A9E: sub esp, 00000010h
  '00479AA1: mov [edx], eax
  '00479AA3: mov eax, 00000001h
  '00479AA8: mov [ebp-54h], 0000000Bh
  '00479AAF: mov ecx, [edi]
  '00479AB1: mov [edx+04h], ebx
  '00479AB4: mov [ebp-6Ch], ecx
  '00479AB7: mov ecx, [ecx]
  '00479AB9: mov [edx+08h], eax
  '00479ABC: mov eax, [ebp-58h]
  '00479ABF: mov [edx+0Ch], eax
  '00479AC2: mov eax, [ebp-54h]
  '00479AC5: mov edx, esp
  '00479AC7: push 00420A30h
  '00479ACC: mov [edx], eax
  '00479ACE: mov eax, [ebp-50h]
  '00479AD1: mov [edx+04h], eax
  '00479AD4: mov eax, [ebp-4Ch]
  '00479AD7: mov [edx+08h], eax
  '00479ADA: mov eax, [ebp-48h]
  '00479ADD: mov [edx+0Ch], eax
  '00479AE0: mov edx, [ebp-6Ch]
  '00479AE3: push edx
  '00479AE4: call [ecx+20h]
  '00479AE7: test eax, eax
  '00479AE9: fclex 
  '00479AEB: jnl 479AFFh
  '00479AED: mov ecx, [ebp-6Ch]
  '00479AF0: push 00000020h
  '00479AF2: push 004207F8h
  '00479AF7: push ecx
  '00479AF8: push eax
  '00479AF9: call [004010A8h]
  '00479AFF: lea ecx, [ebp-54h]
  '00479B02: call [00401034h]
  '00479B08: mov edx, [esi+0000011Ch]
  '00479B0E: sub esp, 00000010h
  '00479B11: mov [ebp-4Ch], edx
  '00479B14: mov edx, esp
  '00479B16: mov eax, 00000003h
  '00479B1B: sub esp, 00000010h
  '00479B1E: mov [edx], eax
  '00479B20: mov [ebp-54h], eax
  '00479B23: mov eax, 8000000Fh
  '00479B28: mov ecx, [edi]
  '00479B2A: mov [edx+04h], ebx
  '00479B2D: mov [ebp-6Ch], ecx
  '00479B30: mov ecx, [ecx]
  '00479B32: mov [edx+08h], eax
  '00479B35: mov eax, [ebp-58h]
  '00479B38: mov [edx+0Ch], eax
  '00479B3B: mov eax, [ebp-54h]
  '00479B3E: mov edx, esp
  '00479B40: push 004207E4h
  '00479B45: mov [edx], eax
  '00479B47: mov eax, [ebp-50h]
  '00479B4A: mov [edx+04h], eax
  '00479B4D: mov eax, [ebp-4Ch]
  '00479B50: mov [edx+08h], eax
  '00479B53: mov eax, [ebp-48h]
  '00479B56: mov [edx+0Ch], eax
  '00479B59: mov edx, [ebp-6Ch]
  '00479B5C: push edx
  '00479B5D: call [ecx+20h]
  '00479B60: test eax, eax
  '00479B62: fclex 
  '00479B64: jnl 479B78h
  '00479B66: mov ecx, [ebp-6Ch]
  '00479B69: push 00000020h
  '00479B6B: push 004207F8h
  '00479B70: push ecx
  '00479B71: push eax
  '00479B72: call [004010A8h]
  '00479B78: mov edx, [esi+00000118h]
  '00479B7E: sub esp, 00000010h
  '00479B81: mov [ebp-4Ch], edx
  '00479B84: mov edx, esp
  '00479B86: mov eax, 00000003h
  '00479B8B: sub esp, 00000010h
  '00479B8E: mov [edx], eax
  '00479B90: mov [ebp-54h], eax
  '00479B93: mov eax, 80000012h
  '00479B98: mov ecx, [edi]
  '00479B9A: mov [edx+04h], ebx
  '00479B9D: mov [ebp-6Ch], ecx
  '00479BA0: mov ecx, [ecx]
  '00479BA2: mov [edx+08h], eax
  '00479BA5: mov eax, [ebp-58h]
  '00479BA8: mov [edx+0Ch], eax
  '00479BAB: mov eax, [ebp-54h]
  '00479BAE: mov edx, esp
  '00479BB0: push 0042080Ch
  '00479BB5: mov [edx], eax
  '00479BB7: mov eax, [ebp-50h]
  '00479BBA: mov [edx+04h], eax
  '00479BBD: mov eax, [ebp-4Ch]
  '00479BC0: mov [edx+08h], eax
  '00479BC3: mov eax, [ebp-48h]
  '00479BC6: mov [edx+0Ch], eax
  '00479BC9: mov edx, [ebp-6Ch]
  '00479BCC: push edx
  '00479BCD: call [ecx+20h]
  '00479BD0: test eax, eax
  '00479BD2: fclex 
  '00479BD4: jnl 479BE8h
  '00479BD6: mov ecx, [ebp-6Ch]
  '00479BD9: push 00000020h
  '00479BDB: push 004207F8h
  '00479BE0: push ecx
  '00479BE1: push eax
  '00479BE2: call [004010A8h]
  '00479BE8: mov edx, [esi+00000110h]
  '00479BEE: sub esp, 00000010h
  '00479BF1: mov [ebp-4Ch], edx
  '00479BF4: mov edx, esp
  '00479BF6: mov eax, 00000008h
  '00479BFB: sub esp, 00000010h
  '00479BFE: mov [edx], eax
  '00479C00: mov [ebp-54h], eax
  '00479C03: mov eax, 0041BFA4h
  '00479C08: mov ecx, [edi]
  '00479C0A: mov [edx+04h], ebx
  '00479C0D: mov [ebp-6Ch], ecx
  '00479C10: mov ecx, [ecx]
  '00479C12: mov [edx+08h], eax
  '00479C15: mov eax, [ebp-58h]
  '00479C18: mov [edx+0Ch], eax
  '00479C1B: mov eax, [ebp-54h]
  '00479C1E: mov edx, esp
  '00479C20: push 00420A54h
  '00479C25: mov [edx], eax
  '00479C27: mov eax, [ebp-50h]
  '00479C2A: mov [edx+04h], eax
  '00479C2D: mov eax, [ebp-4Ch]
  '00479C30: mov [edx+08h], eax
  '00479C33: mov eax, [ebp-48h]
  '00479C36: mov [edx+0Ch], eax
  '00479C39: mov edx, [ebp-6Ch]
  '00479C3C: push edx
  '00479C3D: call [ecx+20h]
  '00479C40: test eax, eax
  '00479C42: fclex 
  '00479C44: jnl 479C58h
  '00479C46: mov ecx, [ebp-6Ch]
  '00479C49: push 00000020h
  '00479C4B: push 004207F8h
  '00479C50: push ecx
  '00479C51: push eax
  '00479C52: call [004010A8h]
  '00479C58: mov edx, [esi+00000114h]
  '00479C5E: sub esp, 00000010h
  '00479C61: mov [ebp-4Ch], edx
  '00479C64: mov edx, esp
  '00479C66: mov eax, 00000008h
  '00479C6B: sub esp, 00000010h
  '00479C6E: mov [edx], eax
  '00479C70: mov [ebp-54h], eax
  '00479C73: mov eax, 004207B4h
  '00479C78: mov ecx, [edi]
  '00479C7A: mov [edx+04h], ebx
  '00479C7D: mov [ebp-6Ch], ecx
  '00479C80: mov ecx, [ecx]
  '00479C82: mov [edx+08h], eax
  '00479C85: mov eax, [ebp-58h]
  '00479C88: mov [edx+0Ch], eax
  '00479C8B: mov eax, [ebp-54h]
  '00479C8E: mov edx, esp
  '00479C90: push 00420A6Ch
  '00479C95: mov [edx], eax
  '00479C97: mov eax, [ebp-50h]
  '00479C9A: mov [edx+04h], eax
  '00479C9D: mov eax, [ebp-4Ch]
  '00479CA0: mov [edx+08h], eax
  '00479CA3: mov eax, [ebp-48h]
  '00479CA6: mov [edx+0Ch], eax
  '00479CA9: mov edx, [ebp-6Ch]
  '00479CAC: push edx
  '00479CAD: call [ecx+20h]
  '00479CB0: test eax, eax
  '00479CB2: fclex 
  '00479CB4: jnl 479CC8h
  '00479CB6: mov ecx, [ebp-6Ch]
  '00479CB9: push 00000020h
  '00479CBB: push 004207F8h
  '00479CC0: push ecx
  '00479CC1: push eax
  '00479CC2: call [004010A8h]
  '00479CC8: mov dx, [esi+0000010Eh]
  '00479CCF: sub esp, 00000010h
  '00479CD2: mov [ebp-4Ch], dx
  '00479CD6: mov edx, esp
  '00479CD8: mov eax, 00000002h
  '00479CDD: sub esp, 00000010h
  '00479CE0: mov [edx], eax
  '00479CE2: mov eax, 00000001h
  '00479CE7: mov [ebp-54h], 0000000Bh
  '00479CEE: mov ecx, [edi]
  '00479CF0: mov [edx+04h], ebx
  '00479CF3: mov [ebp-6Ch], ecx
  '00479CF6: mov ecx, [ecx]
  '00479CF8: mov [edx+08h], eax
  '00479CFB: mov eax, [ebp-58h]
  '00479CFE: mov [edx+0Ch], eax
  '00479D01: mov eax, [ebp-54h]
  '00479D04: mov edx, esp
  '00479D06: push 00420A88h
  '00479D0B: mov [edx], eax
  '00479D0D: mov eax, [ebp-50h]
  '00479D10: mov [edx+04h], eax
  '00479D13: mov eax, [ebp-4Ch]
  '00479D16: mov [edx+08h], eax
  '00479D19: mov eax, [ebp-48h]
  '00479D1C: mov [edx+0Ch], eax
  '00479D1F: mov edx, [ebp-6Ch]
  '00479D22: push edx
  '00479D23: call [ecx+20h]
  '00479D26: test eax, eax
  '00479D28: fclex 
  '00479D2A: jnl 479D3Eh
  '00479D2C: mov ecx, [ebp-6Ch]
  '00479D2F: push 00000020h
  '00479D31: push 004207F8h
  '00479D36: push ecx
  '00479D37: push eax
  '00479D38: call [004010A8h]
  '00479D3E: lea ecx, [ebp-54h]
  '00479D41: call [00401034h]
  '00479D47: mov dx, [esi+0000010Ch]
  '00479D4E: sub esp, 00000010h
  '00479D51: mov [ebp-4Ch], dx
  '00479D55: mov edx, esp
  '00479D57: mov eax, 00000002h
  '00479D5C: sub esp, 00000010h
  '00479D5F: mov [edx], eax
  '00479D61: xor eax, eax
  '00479D63: mov [ebp-54h], 0000000Bh
  '00479D6A: mov ecx, [edi]
  '00479D6C: mov [edx+04h], ebx
  '00479D6F: mov [ebp-6Ch], ecx
  '00479D72: mov ecx, [ecx]
  '00479D74: mov [edx+08h], eax
  '00479D77: mov eax, [ebp-58h]
  '00479D7A: mov [edx+0Ch], eax
  '00479D7D: mov eax, [ebp-54h]
  '00479D80: mov edx, esp
  '00479D82: push 00420AA4h
  '00479D87: mov [edx], eax
  '00479D89: mov eax, [ebp-50h]
  '00479D8C: mov [edx+04h], eax
  '00479D8F: mov eax, [ebp-4Ch]
  '00479D92: mov [edx+08h], eax
  '00479D95: mov eax, [ebp-48h]
  '00479D98: mov [edx+0Ch], eax
  '00479D9B: mov edx, [ebp-6Ch]
  '00479D9E: push edx
  '00479D9F: call [ecx+20h]
  '00479DA2: test eax, eax
  '00479DA4: fclex 
  '00479DA6: jnl 479DBAh
  '00479DA8: mov ecx, [ebp-6Ch]
  '00479DAB: push 00000020h
  '00479DAD: push 004207F8h
  '00479DB2: push ecx
  '00479DB3: push eax
  '00479DB4: call [004010A8h]
  '00479DBA: lea ecx, [ebp-54h]
  '00479DBD: call [00401034h]
  '00479DC3: mov edx, [esi+00000108h]
  '00479DC9: sub esp, 00000010h
  '00479DCC: mov [ebp-4Ch], edx
  '00479DCF: mov edx, esp
  '00479DD1: mov eax, 00000002h
  '00479DD6: sub esp, 00000010h
  '00479DD9: mov [edx], eax
  '00479DDB: xor eax, eax
  '00479DDD: mov [ebp-54h], 00000003h
  '00479DE4: mov ecx, [edi]
  '00479DE6: mov [edx+04h], ebx
  '00479DE9: mov [ebp-6Ch], ecx
  '00479DEC: mov ecx, [ecx]
  '00479DEE: mov [edx+08h], eax
  '00479DF1: mov eax, [ebp-58h]
  '00479DF4: mov [edx+0Ch], eax
  '00479DF7: mov eax, [ebp-54h]
  '00479DFA: mov edx, esp
  '00479DFC: push 00420AD0h
  '00479E01: mov [edx], eax
  '00479E03: mov eax, [ebp-50h]
  '00479E06: mov [edx+04h], eax
  '00479E09: mov eax, [ebp-4Ch]
  '00479E0C: mov [edx+08h], eax
  '00479E0F: mov eax, [ebp-48h]
  '00479E12: mov [edx+0Ch], eax
  '00479E15: mov edx, [ebp-6Ch]
  '00479E18: push edx
  '00479E19: call [ecx+20h]
  '00479E1C: test eax, eax
  '00479E1E: fclex 
  '00479E20: jnl 479E34h
  '00479E22: mov ecx, [ebp-6Ch]
  '00479E25: push 00000020h
  '00479E27: push 004207F8h
  '00479E2C: push ecx
  '00479E2D: push eax
  '00479E2E: call [004010A8h]
  '00479E34: mov dx, [esi+00000106h]
  '00479E3B: sub esp, 00000010h
  '00479E3E: mov [ebp-4Ch], dx
  '00479E42: mov edx, esp
  '00479E44: mov eax, 00000002h
  '00479E49: sub esp, 00000010h
  '00479E4C: mov [edx], eax
  '00479E4E: xor eax, eax
  '00479E50: mov [ebp-54h], 0000000Bh
  '00479E57: mov ecx, [edi]
  '00479E59: mov [edx+04h], ebx
  '00479E5C: mov [ebp-6Ch], ecx
  '00479E5F: mov ecx, [ecx]
  '00479E61: mov [edx+08h], eax
  '00479E64: mov eax, [ebp-58h]
  '00479E67: mov [edx+0Ch], eax
  '00479E6A: mov eax, [ebp-54h]
  '00479E6D: mov edx, esp
  '00479E6F: push 00420AE8h
  '00479E74: mov [edx], eax
  '00479E76: mov eax, [ebp-50h]
  '00479E79: mov [edx+04h], eax
  '00479E7C: mov eax, [ebp-4Ch]
  '00479E7F: mov [edx+08h], eax
  '00479E82: mov eax, [ebp-48h]
  '00479E85: mov [edx+0Ch], eax
  '00479E88: mov edx, [ebp-6Ch]
  '00479E8B: push edx
  '00479E8C: call [ecx+20h]
  '00479E8F: test eax, eax
  '00479E91: fclex 
  '00479E93: jnl 479EA7h
  '00479E95: mov ecx, [ebp-6Ch]
  '00479E98: push 00000020h
  '00479E9A: push 004207F8h
  '00479E9F: push ecx
  '00479EA0: push eax
  '00479EA1: call [004010A8h]
  '00479EA7: lea ecx, [ebp-54h]
  '00479EAA: call [00401034h]
  '00479EB0: mov dx, [esi+00000102h]
  '00479EB7: sub esp, 00000010h
  '00479EBA: mov [ebp-4Ch], dx
  '00479EBE: mov edx, esp
  '00479EC0: mov eax, 00000002h
  '00479EC5: mov [ebp-5Ch], 00000001h
  '00479ECC: mov [edx], eax
  '00479ECE: mov [ebp-54h], eax
  '00479ED1: mov eax, [ebp-5Ch]
  '00479ED4: sub esp, 00000010h
  '00479ED7: mov [edx+04h], ebx
  '00479EDA: mov ecx, [edi]
  '00479EDC: mov [ebp-6Ch], ecx
  '00479EDF: mov [edx+08h], eax
  '00479EE2: mov eax, [ebp-58h]
  '00479EE5: mov ecx, [ecx]
  '00479EE7: mov [edx+0Ch], eax
  '00479EEA: mov eax, [ebp-54h]
  '00479EED: mov edx, esp
  '00479EEF: push 00420B08h
  '00479EF4: mov [edx], eax
  '00479EF6: mov eax, [ebp-50h]
  '00479EF9: mov [edx+04h], eax
  '00479EFC: mov eax, [ebp-4Ch]
  '00479EFF: mov [edx+08h], eax
  '00479F02: mov eax, [ebp-48h]
  '00479F05: mov [edx+0Ch], eax
  '00479F08: mov edx, [ebp-6Ch]
  '00479F0B: push edx
  '00479F0C: call [ecx+20h]
  '00479F0F: test eax, eax
  '00479F11: fclex 
  '00479F13: jnl 479F27h
  '00479F15: mov ecx, [ebp-6Ch]
  '00479F18: push 00000020h
  '00479F1A: push 004207F8h
  '00479F1F: push ecx
  '00479F20: push eax
  '00479F21: call [004010A8h]
  '00479F27: mov dx, [esi+00000104h]
  '00479F2E: sub esp, 00000010h
  '00479F31: mov esi, esp
  '00479F33: mov ecx, 00000002h
  '00479F38: mov eax, 00000008h
  '00479F3D: sub esp, 00000010h
  '00479F40: mov [esi], ecx
  '00479F42: mov edi, [edi]
  '00479F44: mov [ebp-54h], ecx
  '00479F47: mov ecx, esp
  '00479F49: mov [esi+04h], ebx
  '00479F4C: mov [ebp-4Ch], dx
  '00479F50: mov edx, [edi]
  '00479F52: push 00420B18h
  '00479F57: mov [esi+08h], eax
  '00479F5A: mov eax, [ebp-58h]
  '00479F5D: push edi
  '00479F5E: mov [esi+0Ch], eax
  '00479F61: mov eax, [ebp-54h]
  '00479F64: mov [ecx], eax
  '00479F66: mov eax, [ebp-50h]
  '00479F69: mov [ecx+04h], eax
  '00479F6C: mov eax, [ebp-4Ch]
  '00479F6F: mov [ecx+08h], eax
  '00479F72: mov eax, [ebp-48h]
  '00479F75: mov [ecx+0Ch], eax
  '00479F78: call [edx+20h]
  '00479F7B: test eax, eax
  '00479F7D: fclex 
  '00479F7F: jnl 479F90h
  '00479F81: push 00000020h
  '00479F83: push 004207F8h
  '00479F88: push edi
  '00479F89: push eax
  '00479F8A: call [004010A8h]
  '00479F90: mov [ebp-04h], 00000000h
  '00479F97: push 00479FD0h
  '00479F9C: jmp 479FCFh
  '00479F9E: lea ecx, [ebp-18h]
  '00479FA1: call [0040138Ch]
  '00479FA7: lea ecx, [ebp-24h]
  '00479FAA: lea edx, [ebp-20h]
  '00479FAD: push ecx
  '00479FAE: lea eax, [ebp-1Ch]
  '00479FB1: push edx
  '00479FB2: push eax
  '00479FB3: push 00000003h
  '00479FB5: call [0040106Ch]
  '00479FBB: lea ecx, [ebp-44h]
  '00479FBE: lea edx, [ebp-34h]
  '00479FC1: push ecx
  '00479FC2: push edx
  '00479FC3: push 00000002h
  '00479FC5: call [00401058h]
  '00479FCB: add esp, 0000001Ch
  '00479FCE: ret 
End Sub
Private Sub UserControl__477EC0
  '00477EC0: push ebp
  '00477EC1: mov ebp, esp
  '00477EC3: sub esp, 0000000Ch
  '00477EC6: push 00403796h
  '00477ECB: mov eax, fs:[00h]
  '00477ED1: push eax
  '00477ED2: mov fs:[00000000h], esp
  '00477ED9: sub esp, 00000074h
  '00477EDC: push ebx
  '00477EDD: push esi
  '00477EDE: push edi
  '00477EDF: mov [ebp-0Ch], esp
  '00477EE2: mov [ebp-08h], 004023F8h
  '00477EE9: mov esi, [ebp+08h]
  '00477EEC: mov eax, esi
  '00477EEE: and eax, 00000001h
  '00477EF1: mov [ebp-04h], eax
  '00477EF4: and esi, FFFFFFFEh
  '00477EF7: push esi
  '00477EF8: mov [ebp+08h], esi
  '00477EFB: mov ecx, [esi]
  '00477EFD: call [ecx+04h]
  '00477F00: mov edi, [ebp+0Ch]
  '00477F03: xor eax, eax
  '00477F05: lea ebx, [ebp-38h]
  '00477F08: mov [ebp-18h], eax
  '00477F0B: mov edx, [edi]
  '00477F0D: mov [ebp-1Ch], eax
  '00477F10: mov [ebp-20h], eax
  '00477F13: mov [ebp-24h], eax
  '00477F16: mov [ebp-28h], eax
  '00477F19: mov [ebp-38h], eax
  '00477F1C: mov [ebp-48h], eax
  '00477F1F: mov [ebp-5Ch], edx
  '00477F22: mov edx, [edx]
  '00477F24: push ebx
  '00477F25: mov ebx, [ebp-54h]
  '00477F28: sub esp, 00000010h
  '00477F2B: mov [ebp-00000088h], edx
  '00477F31: mov edx, esp
  '00477F33: mov ecx, 00000003h
  '00477F38: mov eax, 8000000Fh
  '00477F3D: mov [edx], ecx
  '00477F3F: mov ecx, [ebp-5Ch]
  '00477F42: push 004207E4h
  '00477F47: push ecx
  '00477F48: mov [edx+04h], ebx
  '00477F4B: mov [edx+08h], eax
  '00477F4E: mov eax, [ebp-4Ch]
  '00477F51: mov [edx+0Ch], eax
  '00477F54: mov edx, [ebp-00000088h]
  '00477F5A: call [edx+1Ch]
  '00477F5D: test eax, eax
  '00477F5F: fclex 
  '00477F61: jnl 477F75h
  '00477F63: mov ecx, [ebp-5Ch]
  '00477F66: push 0000001Ch
  '00477F68: push 004207F8h
  '00477F6D: push ecx
  '00477F6E: push eax
  '00477F6F: call [004010A8h]
  '00477F75: lea edx, [ebp-38h]
  '00477F78: push edx
  '00477F79: call [004012ECh]
  '00477F7F: lea ecx, [ebp-38h]
  '00477F82: mov [esi+0000011Ch], eax
  '00477F88: call [00401034h]
  '00477F8E: mov eax, [esi+10h]
  '00477F91: mov edx, [esi+0000011Ch]
  '00477F97: push edx
  '00477F98: push eax
  '00477F99: mov ecx, [eax]
  '00477F9B: call [ecx+64h]
  '00477F9E: test eax, eax
  '00477FA0: fclex 
  '00477FA2: jnl 477FB6h
  '00477FA4: mov ecx, [esi+10h]
  '00477FA7: push 00000064h
  '00477FA9: push 0041FF4Ch
  '00477FAE: push ecx
  '00477FAF: push eax
  '00477FB0: call [004010A8h]
  '00477FB6: mov ecx, [edi]
  '00477FB8: mov eax, 00000003h
  '00477FBD: mov [ebp-5Ch], ecx
  '00477FC0: mov edx, [ecx]
  '00477FC2: lea ecx, [ebp-38h]
  '00477FC5: push ecx
  '00477FC6: sub esp, 00000010h
  '00477FC9: mov ecx, esp
  '00477FCB: push 0042080Ch
  '00477FD0: mov [ecx], eax
  '00477FD2: mov eax, 80000012h
  '00477FD7: mov [ecx+04h], ebx
  '00477FDA: mov [ecx+08h], eax
  '00477FDD: mov eax, [ebp-4Ch]
  '00477FE0: mov [ecx+0Ch], eax
  '00477FE3: mov ecx, [ebp-5Ch]
  '00477FE6: push ecx
  '00477FE7: call [edx+1Ch]
  '00477FEA: test eax, eax
  '00477FEC: fclex 
  '00477FEE: jnl 478002h
  '00477FF0: mov edx, [ebp-5Ch]
  '00477FF3: push 0000001Ch
  '00477FF5: push 004207F8h
  '00477FFA: push edx
  '00477FFB: push eax
  '00477FFC: call [004010A8h]
  '00478002: lea eax, [ebp-38h]
  '00478005: push eax
  '00478006: call [004012ECh]
  '0047800C: lea ecx, [ebp-38h]
  '0047800F: mov [esi+00000118h], eax
  '00478015: call [00401034h]
  '0047801B: mov eax, [esi+10h]
  '0047801E: mov edx, [esi+00000118h]
  '00478024: push edx
  '00478025: push eax
  '00478026: mov ecx, [eax]
  '00478028: call [ecx+6Ch]
  '0047802B: test eax, eax
  '0047802D: fclex 
  '0047802F: jnl 478043h
  '00478031: mov ecx, [esi+10h]
  '00478034: push 0000006Ch
  '00478036: push 0041FF4Ch
  '0047803B: push ecx
  '0047803C: push eax
  '0047803D: call [004010A8h]
  '00478043: mov ecx, [edi]
  '00478045: mov eax, 00000002h
  '0047804A: mov [ebp-5Ch], ecx
  '0047804D: mov edx, [ecx]
  '0047804F: lea ecx, [ebp-38h]
  '00478052: push ecx
  '00478053: sub esp, 00000010h
  '00478056: mov ecx, esp
  '00478058: push 00420824h
  '0047805D: mov [ecx], eax
  '0047805F: mov eax, 00000001h
  '00478064: mov [ecx+04h], ebx
  '00478067: mov [ecx+08h], eax
  '0047806A: mov eax, [ebp-4Ch]
  '0047806D: mov [ecx+0Ch], eax
  '00478070: mov ecx, [ebp-5Ch]
  '00478073: push ecx
  '00478074: call [edx+1Ch]
  '00478077: test eax, eax
  '00478079: fclex 
  '0047807B: jnl 47808Fh
  '0047807D: mov edx, [ebp-5Ch]
  '00478080: push 0000001Ch
  '00478082: push 004207F8h
  '00478087: push edx
  '00478088: push eax
  '00478089: call [004010A8h]
  '0047808F: lea eax, [ebp-38h]
  '00478092: push eax
  '00478093: call [0040110Ch]
  '00478099: lea ecx, [ebp-38h]
  '0047809C: mov [esi+00000100h], ax
  '004780A3: call [00401034h]
  '004780A9: mov ecx, [esi]
  '004780AB: lea edx, [ebp-20h]
  '004780AE: push edx
  '004780AF: push esi
  '004780B0: call [ecx+000002B0h]
  '004780B6: test eax, eax
  '004780B8: fclex 
  '004780BA: jnl 4780CEh
  '004780BC: push 000002B0h
  '004780C1: push 0041FF4Ch
  '004780C6: push esi
  '004780C7: push eax
  '004780C8: call [004010A8h]
  '004780CE: mov eax, [ebp-20h]
  '004780D1: lea edx, [ebp-18h]
  '004780D4: push edx
  '004780D5: push eax
  '004780D6: mov ecx, [eax]
  '004780D8: mov [ebp-60h], eax
  '004780DB: call [ecx+20h]
  '004780DE: test eax, eax
  '004780E0: fclex 
  '004780E2: jnl 4780F6h
  '004780E4: mov ecx, [ebp-60h]
  '004780E7: push 00000020h
  '004780E9: push 0041BDC4h
  '004780EE: push ecx
  '004780EF: push eax
  '004780F0: call [004010A8h]
  '004780F6: mov eax, [ebp-18h]
  '004780F9: mov ecx, [edi]
  '004780FB: mov [ebp-30h], eax
  '004780FE: mov eax, 00000008h
  '00478103: mov [ebp-18h], 00000000h
  '0047810A: mov [ebp-38h], eax
  '0047810D: mov edx, [ecx]
  '0047810F: mov [ebp-68h], ecx
  '00478112: lea ecx, [ebp-48h]
  '00478115: push ecx
  '00478116: sub esp, 00000010h
  '00478119: mov ecx, esp
  '0047811B: push 00420844h
  '00478120: mov [ecx], eax
  '00478122: mov eax, [ebp-34h]
  '00478125: mov [ecx+04h], eax
  '00478128: mov eax, [ebp-30h]
  '0047812B: mov [ecx+08h], eax
  '0047812E: mov eax, [ebp-2Ch]
  '00478131: mov [ecx+0Ch], eax
  '00478134: mov ecx, [ebp-68h]
  '00478137: push ecx
  '00478138: call [edx+1Ch]
  '0047813B: test eax, eax
  '0047813D: fclex 
  '0047813F: jnl 478153h
  '00478141: mov edx, [ebp-68h]
  '00478144: push 0000001Ch
  '00478146: push 004207F8h
  '0047814B: push edx
  '0047814C: push eax
  '0047814D: call [004010A8h]
  '00478153: lea eax, [ebp-48h]
  '00478156: push eax
  '00478157: call [00401048h]
  '0047815D: mov edx, eax
  '0047815F: lea ecx, [ebp-1Ch]
  '00478162: call [00401348h]
  '00478168: mov edx, eax
  '0047816A: lea ecx, [esi+000000B8h]
  '00478170: call [004012C4h]
  '00478176: lea ecx, [ebp-1Ch]
  '00478179: call [0040138Ch]
  '0047817F: lea ecx, [ebp-20h]
  '00478182: call [00401388h]
  '00478188: lea ecx, [ebp-48h]
  '0047818B: lea edx, [ebp-38h]
  '0047818E: push ecx
  '0047818F: push edx
  '00478190: push 00000002h
  '00478192: call [00401058h]
  '00478198: add esp, 0000000Ch
  '0047819B: lea edx, [ebp-38h]
  '0047819E: mov eax, 00000002h
  '004781A3: mov ecx, [edi]
  '004781A5: push edx
  '004781A6: mov [ebp-5Ch], ecx
  '004781A9: sub esp, 00000010h
  '004781AC: mov ecx, [ecx]
  '004781AE: mov edx, esp
  '004781B0: push 00420858h
  '004781B5: mov [edx], eax
  '004781B7: mov eax, 00000001h
  '004781BC: mov [edx+04h], ebx
  '004781BF: mov [edx+08h], eax
  '004781C2: mov eax, [ebp-4Ch]
  '004781C5: mov [edx+0Ch], eax
  '004781C8: mov edx, [ebp-5Ch]
  '004781CB: push edx
  '004781CC: call [ecx+1Ch]
  '004781CF: test eax, eax
  '004781D1: fclex 
  '004781D3: jnl 4781E7h
  '004781D5: mov ecx, [ebp-5Ch]
  '004781D8: push 0000001Ch
  '004781DA: push 004207F8h
  '004781DF: push ecx
  '004781E0: push eax
  '004781E1: call [004010A8h]
  '004781E7: lea edx, [ebp-38h]
  '004781EA: push edx
  '004781EB: call [004012ECh]
  '004781F1: lea ecx, [ebp-38h]
  '004781F4: mov [esi+000000BCh], eax
  '004781FA: call [00401034h]
  '00478200: lea edx, [ebp-38h]
  '00478203: mov eax, 00000002h
  '00478208: push edx
  '00478209: mov ecx, [edi]
  '0047820B: sub esp, 00000010h
  '0047820E: mov [ebp-5Ch], ecx
  '00478211: mov edx, esp
  '00478213: mov ecx, [ecx]
  '00478215: push 0042087Ch
  '0047821A: mov [edx], eax
  '0047821C: mov [edx+04h], ebx
  '0047821F: mov [edx+08h], eax
  '00478222: mov eax, [ebp-4Ch]
  '00478225: mov [edx+0Ch], eax
  '00478228: mov edx, [ebp-5Ch]
  '0047822B: push edx
  '0047822C: call [ecx+1Ch]
  '0047822F: test eax, eax
  '00478231: fclex 
  '00478233: jnl 478247h
  '00478235: mov ecx, [ebp-5Ch]
  '00478238: push 0000001Ch
  '0047823A: push 004207F8h
  '0047823F: push ecx
  '00478240: push eax
  '00478241: call [004010A8h]
  '00478247: lea edx, [ebp-38h]
  '0047824A: push edx
  '0047824B: call [004012ECh]
  '00478251: lea ecx, [ebp-38h]
  '00478254: mov [esi+000000C0h], eax
  '0047825A: call [00401034h]
  '00478260: lea edx, [ebp-48h]
  '00478263: mov eax, 00000009h
  '00478268: push edx
  '00478269: mov ecx, [edi]
  '0047826B: sub esp, 00000010h
  '0047826E: mov [ebp-38h], eax
  '00478271: mov edx, esp
  '00478273: mov [ebp-30h], 00000000h
  '0047827A: mov [ebp-5Ch], ecx
  '0047827D: mov ecx, [ecx]
  '0047827F: mov [edx], eax
  '00478281: mov eax, [ebp-34h]
  '00478284: push 00420898h
  '00478289: mov [edx+04h], eax
  '0047828C: mov eax, [ebp-30h]
  '0047828F: mov [edx+08h], eax
  '00478292: mov eax, [ebp-2Ch]
  '00478295: mov [edx+0Ch], eax
  '00478298: mov edx, [ebp-5Ch]
  '0047829B: push edx
  '0047829C: call [ecx+1Ch]
  '0047829F: test eax, eax
  '004782A1: fclex 
  '004782A3: jnl 4782B7h
  '004782A5: mov ecx, [ebp-5Ch]
  '004782A8: push 0000001Ch
  '004782AA: push 004207F8h
  '004782AF: push ecx
  '004782B0: push eax
  '004782B1: call [004010A8h]
  '004782B7: lea edx, [ebp-48h]
  '004782BA: push 00412CE8h
  '004782BF: push edx
  '004782C0: call [004011B8h]
  '004782C6: push eax
  '004782C7: lea eax, [ebp-20h]
  '004782CA: push eax
  '004782CB: call [004010F0h]
  '004782D1: lea ecx, [esi+000000C4h]
  '004782D7: push eax
  '004782D8: push ecx
  '004782D9: call [004010FCh]
  '004782DF: lea ecx, [ebp-20h]
  '004782E2: call [00401388h]
  '004782E8: lea edx, [ebp-48h]
  '004782EB: lea eax, [ebp-38h]
  '004782EE: push edx
  '004782EF: push eax
  '004782F0: push 00000002h
  '004782F2: call [00401058h]
  '004782F8: add esp, 0000000Ch
  '004782FB: lea edx, [ebp-38h]
  '004782FE: mov eax, 00000002h
  '00478303: mov ecx, [edi]
  '00478305: push edx
  '00478306: mov [ebp-5Ch], ecx
  '00478309: sub esp, 00000010h
  '0047830C: mov ecx, [ecx]
  '0047830E: mov edx, esp
  '00478310: push 004208ACh
  '00478315: mov [edx], eax
  '00478317: mov eax, 00000020h
  '0047831C: mov [edx+04h], ebx
  '0047831F: mov [edx+08h], eax
  '00478322: mov eax, [ebp-4Ch]
  '00478325: mov [edx+0Ch], eax
  '00478328: mov edx, [ebp-5Ch]
  '0047832B: push edx
  '0047832C: call [ecx+1Ch]
  '0047832F: test eax, eax
  '00478331: fclex 
  '00478333: jnl 478347h
  '00478335: mov ecx, [ebp-5Ch]
  '00478338: push 0000001Ch
  '0047833A: push 004207F8h
  '0047833F: push ecx
  '00478340: push eax
  '00478341: call [004010A8h]
  '00478347: lea edx, [ebp-38h]
  '0047834A: push edx
  '0047834B: call [004012ECh]
  '00478351: lea ecx, [ebp-38h]
  '00478354: mov [esi+000000C8h], eax
  '0047835A: call [00401034h]
  '00478360: lea edx, [ebp-38h]
  '00478363: mov eax, 00000002h
  '00478368: push edx
  '00478369: mov ecx, [edi]
  '0047836B: sub esp, 00000010h
  '0047836E: mov [ebp-5Ch], ecx
  '00478371: mov edx, esp
  '00478373: mov ecx, [ecx]
  '00478375: push 004208CCh
  '0047837A: mov [edx], eax
  '0047837C: mov eax, 00000020h
  '00478381: mov [edx+04h], ebx
  '00478384: mov [edx+08h], eax
  '00478387: mov eax, [ebp-4Ch]
  '0047838A: mov [edx+0Ch], eax
  '0047838D: mov edx, [ebp-5Ch]
  '00478390: push edx
  '00478391: call [ecx+1Ch]
  '00478394: test eax, eax
  '00478396: fclex 
  '00478398: jnl 4783ACh
  '0047839A: mov ecx, [ebp-5Ch]
  '0047839D: push 0000001Ch
  '0047839F: push 004207F8h
  '004783A4: push ecx
  '004783A5: push eax
  '004783A6: call [004010A8h]
  '004783AC: lea edx, [ebp-38h]
  '004783AF: push edx
  '004783B0: call [004012ECh]
  '004783B6: lea ecx, [ebp-38h]
  '004783B9: mov [esi+000000CCh], eax
  '004783BF: call [00401034h]
  '004783C5: lea edx, [ebp-38h]
  '004783C8: mov eax, 00000002h
  '004783CD: push edx
  '004783CE: mov ecx, [edi]
  '004783D0: sub esp, 00000010h
  '004783D3: mov [ebp-50h], 00000001h
  '004783DA: mov edx, esp
  '004783DC: mov [ebp-5Ch], ecx
  '004783DF: mov ecx, [ecx]
  '004783E1: push 004208ECh
  '004783E6: mov [edx], eax
  '004783E8: mov eax, [ebp-50h]
  '004783EB: mov [edx+04h], ebx
  '004783EE: mov [edx+08h], eax
  '004783F1: mov eax, [ebp-4Ch]
  '004783F4: mov [edx+0Ch], eax
  '004783F7: mov edx, [ebp-5Ch]
  '004783FA: push edx
  '004783FB: call [ecx+1Ch]
  '004783FE: test eax, eax
  '00478400: fclex 
  '00478402: jnl 478416h
  '00478404: mov ecx, [ebp-5Ch]
  '00478407: push 0000001Ch
  '00478409: push 004207F8h
  '0047840E: push ecx
  '0047840F: push eax
  '00478410: call [004010A8h]
  '00478416: lea edx, [ebp-38h]
  '00478419: push edx
  '0047841A: call [004012ECh]
  '00478420: lea ecx, [ebp-38h]
  '00478423: mov [esi+000000D0h], eax
  '00478429: call [00401034h]
  '0047842F: lea edx, [ebp-38h]
  '00478432: mov eax, 00000002h
  '00478437: push edx
  '00478438: mov ecx, [edi]
  '0047843A: sub esp, 00000010h
  '0047843D: mov [ebp-5Ch], ecx
  '00478440: mov edx, esp
  '00478442: mov ecx, [ecx]
  '00478444: push 00420908h
  '00478449: mov [edx], eax
  '0047844B: mov eax, 00000020h
  '00478450: mov [edx+04h], ebx
  '00478453: mov [edx+08h], eax
  '00478456: mov eax, [ebp-4Ch]
  '00478459: mov [edx+0Ch], eax
  '0047845C: mov edx, [ebp-5Ch]
  '0047845F: push edx
  '00478460: call [ecx+1Ch]
  '00478463: test eax, eax
  '00478465: fclex 
  '00478467: jnl 47847Bh
  '00478469: mov ecx, [ebp-5Ch]
  '0047846C: push 0000001Ch
  '0047846E: push 004207F8h
  '00478473: push ecx
  '00478474: push eax
  '00478475: call [004010A8h]
  '0047847B: lea edx, [ebp-38h]
  '0047847E: push edx
  '0047847F: call [004012ECh]
  '00478485: lea ecx, [ebp-38h]
  '00478488: mov [esi+000000A8h], eax
  '0047848E: call [00401034h]
  '00478494: lea edx, [ebp-38h]
  '00478497: mov eax, 00000002h
  '0047849C: push edx
  '0047849D: mov ecx, [edi]
  '0047849F: sub esp, 00000010h
  '004784A2: mov [ebp-50h], 00000020h
  '004784A9: mov edx, esp
  '004784AB: mov [ebp-5Ch], ecx
  '004784AE: mov ecx, [ecx]
  '004784B0: push 00420930h
  '004784B5: mov [edx], eax
  '004784B7: mov eax, [ebp-50h]
  '004784BA: mov [edx+04h], ebx
  '004784BD: mov [edx+08h], eax
  '004784C0: mov eax, [ebp-4Ch]
  '004784C3: mov [edx+0Ch], eax
  '004784C6: mov edx, [ebp-5Ch]
  '004784C9: push edx
  '004784CA: call [ecx+1Ch]
  '004784CD: test eax, eax
  '004784CF: fclex 
  '004784D1: jnl 4784E5h
  '004784D3: mov ecx, [ebp-5Ch]
  '004784D6: push 0000001Ch
  '004784D8: push 004207F8h
  '004784DD: push ecx
  '004784DE: push eax
  '004784DF: call [004010A8h]
  '004784E5: lea edx, [ebp-38h]
  '004784E8: push edx
  '004784E9: call [004012ECh]
  '004784EF: lea ecx, [ebp-38h]
  '004784F2: mov [esi+000000ACh], eax
  '004784F8: call [00401034h]
  '004784FE: mov eax, [esi]
  '00478500: lea ecx, [ebp-20h]
  '00478503: push ecx
  '00478504: push esi
  '00478505: call [eax+000002B0h]
  '0047850B: test eax, eax
  '0047850D: fclex 
  '0047850F: jnl 478523h
  '00478511: push 000002B0h
  '00478516: push 0041FF4Ch
  '0047851B: push esi
  '0047851C: push eax
  '0047851D: call [004010A8h]
  '00478523: mov eax, [ebp-20h]
  '00478526: lea ecx, [ebp-24h]
  '00478529: push ecx
  '0047852A: push eax
  '0047852B: mov edx, [eax]
  '0047852D: mov ebx, eax
  '0047852F: call [edx+24h]
  '00478532: test eax, eax
  '00478534: fclex 
  '00478536: jnl 478547h
  '00478538: push 00000024h
  '0047853A: push 0041BDC4h
  '0047853F: push ebx
  '00478540: push eax
  '00478541: call [004010A8h]
  '00478547: mov eax, [ebp-24h]
  '0047854A: lea ecx, [ebp-48h]
  '0047854D: push ecx
  '0047854E: mov ebx, [edi]
  '00478550: sub esp, 00000010h
  '00478553: mov [ebp-30h], eax
  '00478556: mov ecx, esp
  '00478558: mov eax, 00000009h
  '0047855D: mov [ebp-38h], eax
  '00478560: mov [ebp-24h], 00000000h
  '00478567: mov edx, [ebx]
  '00478569: mov [ecx], eax
  '0047856B: mov eax, [ebp-34h]
  '0047856E: push 00420958h
  '00478573: mov [ecx+04h], eax
  '00478576: mov eax, [ebp-30h]
  '00478579: push ebx
  '0047857A: mov [ecx+08h], eax
  '0047857D: mov eax, [ebp-2Ch]
  '00478580: mov [ecx+0Ch], eax
  '00478583: call [edx+1Ch]
  '00478586: test eax, eax
  '00478588: fclex 
  '0047858A: jnl 47859Bh
  '0047858C: push 0000001Ch
  '0047858E: push 004207F8h
  '00478593: push ebx
  '00478594: push eax
  '00478595: call [004010A8h]
  '0047859B: mov ecx, [esi+10h]
  '0047859E: lea edx, [ebp-48h]
  '004785A1: push 00413978h
  '004785A6: push edx
  '004785A7: mov ebx, [ecx]
  '004785A9: call [004011B8h]
  '004785AF: push eax
  '004785B0: lea eax, [ebp-28h]
  '004785B3: push eax
  '004785B4: call [004010F0h]
  '004785BA: mov ecx, [esi+10h]
  '004785BD: push eax
  '004785BE: push ecx
  '004785BF: call [ebx+0000024Ch]
  '004785C5: test eax, eax
  '004785C7: fclex 
  '004785C9: jnl 4785E0h
  '004785CB: mov edx, [esi+10h]
  '004785CE: push 0000024Ch
  '004785D3: push 0041FF4Ch
  '004785D8: push edx
  '004785D9: push eax
  '004785DA: call [004010A8h]
  '004785E0: lea eax, [ebp-28h]
  '004785E3: lea ecx, [ebp-20h]
  '004785E6: push eax
  '004785E7: push ecx
  '004785E8: push 00000002h
  '004785EA: call [0040106Ch]
  '004785F0: lea edx, [ebp-48h]
  '004785F3: lea eax, [ebp-38h]
  '004785F6: push edx
  '004785F7: push eax
  '004785F8: push 00000002h
  '004785FA: call [00401058h]
  '00478600: mov ecx, [esi]
  '00478602: add esp, 00000018h
  '00478605: lea edx, [ebp-20h]
  '00478608: push edx
  '00478609: push esi
  '0047860A: call [ecx+000002B0h]
  '00478610: test eax, eax
  '00478612: fclex 
  '00478614: jnl 478628h
  '00478616: push 000002B0h
  '0047861B: push 0041FF4Ch
  '00478620: push esi
  '00478621: push eax
  '00478622: call [004010A8h]
  '00478628: mov eax, [ebp-20h]
  '0047862B: lea edx, [ebp-24h]
  '0047862E: push edx
  '0047862F: push eax
  '00478630: mov ecx, [eax]
  '00478632: mov ebx, eax
  '00478634: call [ecx+24h]
  '00478637: test eax, eax
  '00478639: fclex 
  '0047863B: jnl 47864Ch
  '0047863D: push 00000024h
  '0047863F: push 0041BDC4h
  '00478644: push ebx
  '00478645: push eax
  '00478646: call [004010A8h]
  '0047864C: mov eax, [ebp-24h]
  '0047864F: lea edx, [ebp-48h]
  '00478652: push edx
  '00478653: mov ebx, [edi]
  '00478655: sub esp, 00000010h
  '00478658: mov [ebp-30h], eax
  '0047865B: mov edx, esp
  '0047865D: mov eax, 00000009h
  '00478662: mov [ebp-38h], eax
  '00478665: mov [ebp-24h], 00000000h
  '0047866C: mov ecx, [ebx]
  '0047866E: mov [edx], eax
  '00478670: mov eax, [ebp-34h]
  '00478673: push 00420958h
  '00478678: mov [edx+04h], eax
  '0047867B: mov eax, [ebp-30h]
  '0047867E: push ebx
  '0047867F: mov [edx+08h], eax
  '00478682: mov eax, [ebp-2Ch]
  '00478685: mov [edx+0Ch], eax
  '00478688: call [ecx+1Ch]
  '0047868B: test eax, eax
  '0047868D: fclex 
  '0047868F: jnl 4786A0h
  '00478691: push 0000001Ch
  '00478693: push 004207F8h
  '00478698: push ebx
  '00478699: push eax
  '0047869A: call [004010A8h]
  '004786A0: mov ebx, [esi]
  '004786A2: lea ecx, [ebp-48h]
  '004786A5: push 00413978h
  '004786AA: push ecx
  '004786AB: call [004011B8h]
  '004786B1: lea edx, [ebp-28h]
  '004786B4: push eax
  '004786B5: push edx
  '004786B6: call [004010F0h]
  '004786BC: push eax
  '004786BD: push esi
  '004786BE: call [ebx+00000940h]
  '004786C4: test eax, eax
  '004786C6: fclex 
  '004786C8: jnl 4786DCh
  '004786CA: push 00000940h
  '004786CF: push 0041FF7Ch
  '004786D4: push esi
  '004786D5: push eax
  '004786D6: call [004010A8h]
  '004786DC: lea eax, [ebp-28h]
  '004786DF: lea ecx, [ebp-20h]
  '004786E2: push eax
  '004786E3: push ecx
  '004786E4: push 00000002h
  '004786E6: call [0040106Ch]
  '004786EC: lea edx, [ebp-48h]
  '004786EF: lea eax, [ebp-38h]
  '004786F2: push edx
  '004786F3: push eax
  '004786F4: push 00000002h
  '004786F6: call [00401058h]
  '004786FC: add esp, 00000018h
  '004786FF: lea edx, [ebp-48h]
  '00478702: mov ebx, [edi]
  '00478704: mov eax, 00000009h
  '00478709: push edx
  '0047870A: mov [ebp-38h], eax
  '0047870D: sub esp, 00000010h
  '00478710: mov [ebp-30h], 00000000h
  '00478717: mov edx, esp
  '00478719: mov ecx, [ebx]
  '0047871B: push 00420974h
  '00478720: push ebx
  '00478721: mov [edx], eax
  '00478723: mov eax, [ebp-34h]
  '00478726: mov [edx+04h], eax
  '00478729: mov eax, [ebp-30h]
  '0047872C: mov [edx+08h], eax
  '0047872F: mov eax, [ebp-2Ch]
  '00478732: mov [edx+0Ch], eax
  '00478735: call [ecx+1Ch]
  '00478738: test eax, eax
  '0047873A: fclex 
  '0047873C: jnl 47874Dh
  '0047873E: push 0000001Ch
  '00478740: push 004207F8h
  '00478745: push ebx
  '00478746: push eax
  '00478747: call [004010A8h]
  '0047874D: lea ecx, [ebp-48h]
  '00478750: push 00412CE8h
  '00478755: push ecx
  '00478756: call [004011B8h]
  '0047875C: lea edx, [ebp-20h]
  '0047875F: push eax
  '00478760: push edx
  '00478761: call [004010F0h]
  '00478767: push eax
  '00478768: lea eax, [esi+000000B4h]
  '0047876E: push eax
  '0047876F: call [004010FCh]
  '00478775: lea ecx, [ebp-20h]
  '00478778: call [00401388h]
  '0047877E: lea ecx, [ebp-48h]
  '00478781: lea edx, [ebp-38h]
  '00478784: push ecx
  '00478785: push edx
  '00478786: push 00000002h
  '00478788: call [00401058h]
  '0047878E: add esp, 0000000Ch
  '00478791: lea edx, [ebp-48h]
  '00478794: mov ebx, [edi]
  '00478796: mov eax, 00000009h
  '0047879B: push edx
  '0047879C: mov [ebp-38h], eax
  '0047879F: sub esp, 00000010h
  '004787A2: mov [ebp-30h], 00000000h
  '004787A9: mov edx, esp
  '004787AB: mov ecx, [ebx]
  '004787AD: push 00420898h
  '004787B2: push ebx
  '004787B3: mov [edx], eax
  '004787B5: mov eax, [ebp-34h]
  '004787B8: mov [edx+04h], eax
  '004787BB: mov eax, [ebp-30h]
  '004787BE: mov [edx+08h], eax
  '004787C1: mov eax, [ebp-2Ch]
  '004787C4: mov [edx+0Ch], eax
  '004787C7: call [ecx+1Ch]
  '004787CA: test eax, eax
  '004787CC: fclex 
  '004787CE: jnl 4787DFh
  '004787D0: push 0000001Ch
  '004787D2: push 004207F8h
  '004787D7: push ebx
  '004787D8: push eax
  '004787D9: call [004010A8h]
  '004787DF: lea ecx, [ebp-48h]
  '004787E2: push 00412CE8h
  '004787E7: push ecx
  '004787E8: call [004011B8h]
  '004787EE: lea edx, [ebp-20h]
  '004787F1: push eax
  '004787F2: push edx
  '004787F3: call [004010F0h]
  '004787F9: push eax
  '004787FA: lea eax, [esi+000000B0h]
  '00478800: push eax
  '00478801: call [004010FCh]
  '00478807: lea ecx, [ebp-20h]
  '0047880A: call [00401388h]
  '00478810: lea ecx, [ebp-48h]
  '00478813: lea edx, [ebp-38h]
  '00478816: push ecx
  '00478817: push edx
  '00478818: push 00000002h
  '0047881A: call [00401058h]
  '00478820: add esp, 0000000Ch
  '00478823: lea edx, [ebp-48h]
  '00478826: mov ebx, [edi]
  '00478828: mov eax, 00000009h
  '0047882D: push edx
  '0047882E: mov [ebp-38h], eax
  '00478831: sub esp, 00000010h
  '00478834: mov [ebp-30h], 00000000h
  '0047883B: mov edx, esp
  '0047883D: mov ecx, [ebx]
  '0047883F: push 00420994h
  '00478844: push ebx
  '00478845: mov [edx], eax
  '00478847: mov eax, [ebp-34h]
  '0047884A: mov [edx+04h], eax
  '0047884D: mov eax, [ebp-30h]
  '00478850: mov [edx+08h], eax
  '00478853: mov eax, [ebp-2Ch]
  '00478856: mov [edx+0Ch], eax
  '00478859: call [ecx+1Ch]
  '0047885C: test eax, eax
  '0047885E: fclex 
  '00478860: jnl 478871h
  '00478862: push 0000001Ch
  '00478864: push 004207F8h
  '00478869: push ebx
  '0047886A: push eax
  '0047886B: call [004010A8h]
  '00478871: mov ebx, [esi]
  '00478873: lea ecx, [ebp-48h]
  '00478876: push 00412CE8h
  '0047887B: push ecx
  '0047887C: call [004011B8h]
  '00478882: lea edx, [ebp-20h]
  '00478885: push eax
  '00478886: push edx
  '00478887: call [004010F0h]
  '0047888D: push eax
  '0047888E: push esi
  '0047888F: call [ebx+000007C8h]
  '00478895: test eax, eax
  '00478897: jnl 4788ABh
  '00478899: push 000007C8h
  '0047889E: push 0041FF7Ch
  '004788A3: push esi
  '004788A4: push eax
  '004788A5: call [004010A8h]
  '004788AB: lea ecx, [ebp-20h]
  '004788AE: call [00401388h]
  '004788B4: lea eax, [ebp-48h]
  '004788B7: lea ecx, [ebp-38h]
  '004788BA: push eax
  '004788BB: push ecx
  '004788BC: push 00000002h
  '004788BE: call [00401058h]
  '004788C4: add esp, 0000000Ch
  '004788C7: lea ecx, [ebp-38h]
  '004788CA: mov ebx, [edi]
  '004788CC: mov eax, 0000000Bh
  '004788D1: push ecx
  '004788D2: sub esp, 00000010h
  '004788D5: mov edx, [ebx]
  '004788D7: mov ecx, esp
  '004788D9: push 004209ACh
  '004788DE: push ebx
  '004788DF: mov [ecx], eax
  '004788E1: mov eax, [ebp-54h]
  '004788E4: mov [ecx+04h], eax
  '004788E7: or eax, FFFFFFFFh
  '004788EA: mov [ecx+08h], eax
  '004788ED: mov eax, [ebp-4Ch]
  '004788F0: mov [ecx+0Ch], eax
  '004788F3: call [edx+1Ch]
  '004788F6: test eax, eax
  '004788F8: fclex 
  '004788FA: jnl 47890Bh
  '004788FC: push 0000001Ch
  '004788FE: push 004207F8h
  '00478903: push ebx
  '00478904: push eax
  '00478905: call [004010A8h]
  '0047890B: mov ecx, [esi+10h]
  '0047890E: lea edx, [ebp-38h]
  '00478911: push edx
  '00478912: mov ebx, [ecx]
  '00478914: call [0040110Ch]
  '0047891A: push eax
  '0047891B: mov eax, [esi+10h]
  '0047891E: push eax
  '0047891F: call [ebx+00000094h]
  '00478925: test eax, eax
  '00478927: fclex 
  '00478929: jnl 478940h
  '0047892B: mov ecx, [esi+10h]
  '0047892E: push 00000094h
  '00478933: push 0041FF4Ch
  '00478938: push ecx
  '00478939: push eax
  '0047893A: call [004010A8h]
  '00478940: lea ecx, [ebp-38h]
  '00478943: call [00401034h]
  '00478949: lea ecx, [ebp-38h]
  '0047894C: mov ebx, [edi]
  '0047894E: push ecx
  '0047894F: mov eax, 00000002h
  '00478954: sub esp, 00000010h
  '00478957: mov edx, [ebx]
  '00478959: mov ecx, esp
  '0047895B: push 004209C0h
  '00478960: push ebx
  '00478961: mov [ecx], eax
  '00478963: mov eax, [ebp-54h]
  '00478966: mov [ecx+04h], eax
  '00478969: xor eax, eax
  '0047896B: mov [ecx+08h], eax
  '0047896E: mov eax, [ebp-4Ch]
  '00478971: mov [ecx+0Ch], eax
  '00478974: call [edx+1Ch]
  '00478977: test eax, eax
  '00478979: fclex 
  '0047897B: jnl 47898Ch
  '0047897D: push 0000001Ch
  '0047897F: push 004207F8h
  '00478984: push ebx
  '00478985: push eax
  '00478986: call [004010A8h]
  '0047898C: mov ecx, [esi+10h]
  '0047898F: lea edx, [ebp-38h]
  '00478992: push edx
  '00478993: mov ebx, [ecx]
  '00478995: call [0040127Ch]
  '0047899B: push eax
  '0047899C: mov eax, [esi+10h]
  '0047899F: push eax
  '004789A0: call [ebx+000000A4h]
  '004789A6: test eax, eax
  '004789A8: fclex 
  '004789AA: jnl 4789C1h
  '004789AC: mov ecx, [esi+10h]
  '004789AF: push 000000A4h
  '004789B4: push 0041FF4Ch
  '004789B9: push ecx
  '004789BA: push eax
  '004789BB: call [004010A8h]
  '004789C1: mov ebx, [00401034h]
  '004789C7: lea ecx, [ebp-38h]
  '004789CA: call ebx
  '004789CC: mov ecx, [edi]
  '004789CE: mov eax, 00000008h
  '004789D3: mov [ebp-5Ch], ecx
  '004789D6: mov edx, [ecx]
  '004789D8: lea ecx, [ebp-38h]
  '004789DB: push ecx
  '004789DC: sub esp, 00000010h
  '004789DF: mov ecx, esp
  '004789E1: push 004209E0h
  '004789E6: mov [ecx], eax
  '004789E8: mov eax, [ebp-54h]
  '004789EB: mov [ecx+04h], eax
  '004789EE: mov eax, 0040FE84h
  '004789F3: mov [ecx+08h], eax
  '004789F6: mov eax, [ebp-4Ch]
  '004789F9: mov [ecx+0Ch], eax
  '004789FC: mov ecx, [ebp-5Ch]
  '004789FF: push ecx
  '00478A00: call [edx+1Ch]
  '00478A03: test eax, eax
  '00478A05: fclex 
  '00478A07: jnl 478A1Bh
  '00478A09: mov edx, [ebp-5Ch]
  '00478A0C: push 0000001Ch
  '00478A0E: push 004207F8h
  '00478A13: push edx
  '00478A14: push eax
  '00478A15: call [004010A8h]
  '00478A1B: lea eax, [ebp-38h]
  '00478A1E: push eax
  '00478A1F: call [00401048h]
  '00478A25: mov edx, eax
  '00478A27: lea ecx, [ebp-18h]
  '00478A2A: call [00401348h]
  '00478A30: mov edx, eax
  '00478A32: lea ecx, [esi+000000FCh]
  '00478A38: call [004012C4h]
  '00478A3E: lea ecx, [ebp-18h]
  '00478A41: call [0040138Ch]
  '00478A47: lea ecx, [ebp-38h]
  '00478A4A: call ebx
  '00478A4C: lea edx, [ebp-38h]
  '00478A4F: mov eax, 00000003h
  '00478A54: push edx
  '00478A55: mov ecx, [edi]
  '00478A57: sub esp, 00000010h
  '00478A5A: mov [ebp-5Ch], ecx
  '00478A5D: mov edx, esp
  '00478A5F: mov ecx, [ecx]
  '00478A61: push 004209ECh
  '00478A66: mov [edx], eax
  '00478A68: mov eax, [ebp-54h]
  '00478A6B: mov [edx+04h], eax
  '00478A6E: mov eax, 80000014h
  '00478A73: mov [edx+08h], eax
  '00478A76: mov eax, [ebp-4Ch]
  '00478A79: mov [edx+0Ch], eax
  '00478A7C: mov edx, [ebp-5Ch]
  '00478A7F: push edx
  '00478A80: call [ecx+1Ch]
  '00478A83: test eax, eax
  '00478A85: fclex 
  '00478A87: jnl 478A9Bh
  '00478A89: mov ecx, [ebp-5Ch]
  '00478A8C: push 0000001Ch
  '00478A8E: push 004207F8h
  '00478A93: push ecx
  '00478A94: push eax
  '00478A95: call [004010A8h]
  '00478A9B: lea edx, [ebp-38h]
  '00478A9E: push edx
  '00478A9F: call [004012ECh]
  '00478AA5: lea ecx, [ebp-38h]
  '00478AA8: mov [esi+00000124h], eax
  '00478AAE: call ebx
  '00478AB0: lea edx, [ebp-38h]
  '00478AB3: mov eax, 00000003h
  '00478AB8: push edx
  '00478AB9: mov ecx, [edi]
  '00478ABB: sub esp, 00000010h
  '00478ABE: mov [ebp-5Ch], ecx
  '00478AC1: mov edx, esp
  '00478AC3: mov ecx, [ecx]
  '00478AC5: push 00420A10h
  '00478ACA: mov [edx], eax
  '00478ACC: mov eax, [ebp-54h]
  '00478ACF: mov [edx+04h], eax
  '00478AD2: mov eax, 80000016h
  '00478AD7: mov [edx+08h], eax
  '00478ADA: mov eax, [ebp-4Ch]
  '00478ADD: mov [edx+0Ch], eax
  '00478AE0: mov edx, [ebp-5Ch]
  '00478AE3: push edx
  '00478AE4: call [ecx+1Ch]
  '00478AE7: test eax, eax
  '00478AE9: fclex 
  '00478AEB: jnl 478AFFh
  '00478AED: mov ecx, [ebp-5Ch]
  '00478AF0: push 0000001Ch
  '00478AF2: push 004207F8h
  '00478AF7: push ecx
  '00478AF8: push eax
  '00478AF9: call [004010A8h]
  '00478AFF: lea edx, [ebp-38h]
  '00478B02: push edx
  '00478B03: call [004012ECh]
  '00478B09: lea ecx, [ebp-38h]
  '00478B0C: mov [esi+00000128h], eax
  '00478B12: call ebx
  '00478B14: lea edx, [ebp-38h]
  '00478B17: mov eax, 00000002h
  '00478B1C: push edx
  '00478B1D: mov ecx, [edi]
  '00478B1F: sub esp, 00000010h
  '00478B22: mov [ebp-5Ch], ecx
  '00478B25: mov edx, esp
  '00478B27: mov ecx, [ecx]
  '00478B29: push 00420A30h
  '00478B2E: mov [edx], eax
  '00478B30: mov eax, [ebp-54h]
  '00478B33: mov [edx+04h], eax
  '00478B36: mov eax, 00000001h
  '00478B3B: mov [edx+08h], eax
  '00478B3E: mov eax, [ebp-4Ch]
  '00478B41: mov [edx+0Ch], eax
  '00478B44: mov edx, [ebp-5Ch]
  '00478B47: push edx
  '00478B48: call [ecx+1Ch]
  '00478B4B: test eax, eax
  '00478B4D: fclex 
  '00478B4F: jnl 478B63h
  '00478B51: mov ecx, [ebp-5Ch]
  '00478B54: push 0000001Ch
  '00478B56: push 004207F8h
  '00478B5B: push ecx
  '00478B5C: push eax
  '00478B5D: call [004010A8h]
  '00478B63: lea edx, [ebp-38h]
  '00478B66: push edx
  '00478B67: call [0040110Ch]
  '00478B6D: lea ecx, [ebp-38h]
  '00478B70: mov [esi+00000120h], ax
  '00478B77: call ebx
  '00478B79: lea edx, [ebp-38h]
  '00478B7C: mov eax, 00000008h
  '00478B81: push edx
  '00478B82: mov ecx, [edi]
  '00478B84: sub esp, 00000010h
  '00478B87: mov [ebp-5Ch], ecx
  '00478B8A: mov edx, esp
  '00478B8C: mov ecx, [ecx]
  '00478B8E: push 00420A54h
  '00478B93: mov [edx], eax
  '00478B95: mov eax, [ebp-54h]
  '00478B98: mov [edx+04h], eax
  '00478B9B: mov eax, 0041BFA4h
  '00478BA0: mov [edx+08h], eax
  '00478BA3: mov eax, [ebp-4Ch]
  '00478BA6: mov [edx+0Ch], eax
  '00478BA9: mov edx, [ebp-5Ch]
  '00478BAC: push edx
  '00478BAD: call [ecx+1Ch]
  '00478BB0: test eax, eax
  '00478BB2: fclex 
  '00478BB4: jnl 478BC8h
  '00478BB6: mov ecx, [ebp-5Ch]
  '00478BB9: push 0000001Ch
  '00478BBB: push 004207F8h
  '00478BC0: push ecx
  '00478BC1: push eax
  '00478BC2: call [004010A8h]
  '00478BC8: lea edx, [ebp-38h]
  '00478BCB: push edx
  '00478BCC: call [00401048h]
  '00478BD2: mov edx, eax
  '00478BD4: lea ecx, [ebp-18h]
  '00478BD7: call [00401348h]
  '00478BDD: mov edx, eax
  '00478BDF: lea ecx, [esi+00000110h]
  '00478BE5: call [004012C4h]
  '00478BEB: lea ecx, [ebp-18h]
  '00478BEE: call [0040138Ch]
  '00478BF4: lea ecx, [ebp-38h]
  '00478BF7: call ebx
  '00478BF9: lea edx, [ebp-38h]
  '00478BFC: mov eax, 00000008h
  '00478C01: push edx
  '00478C02: mov ecx, [edi]
  '00478C04: sub esp, 00000010h
  '00478C07: mov [ebp-5Ch], ecx
  '00478C0A: mov edx, esp
  '00478C0C: mov ecx, [ecx]
  '00478C0E: push 00420A6Ch
  '00478C13: mov [edx], eax
  '00478C15: mov eax, [ebp-54h]
  '00478C18: mov [edx+04h], eax
  '00478C1B: mov eax, 004207B4h
  '00478C20: mov [edx+08h], eax
  '00478C23: mov eax, [ebp-4Ch]
  '00478C26: mov [edx+0Ch], eax
  '00478C29: mov edx, [ebp-5Ch]
  '00478C2C: push edx
  '00478C2D: call [ecx+1Ch]
  '00478C30: test eax, eax
  '00478C32: fclex 
  '00478C34: jnl 478C48h
  '00478C36: mov ecx, [ebp-5Ch]
  '00478C39: push 0000001Ch
  '00478C3B: push 004207F8h
  '00478C40: push ecx
  '00478C41: push eax
  '00478C42: call [004010A8h]
  '00478C48: lea edx, [ebp-38h]
  '00478C4B: push edx
  '00478C4C: call [00401048h]
  '00478C52: mov edx, eax
  '00478C54: lea ecx, [ebp-18h]
  '00478C57: call [00401348h]
  '00478C5D: mov edx, eax
  '00478C5F: lea ecx, [esi+00000114h]
  '00478C65: call [004012C4h]
  '00478C6B: lea ecx, [ebp-18h]
  '00478C6E: call [0040138Ch]
  '00478C74: lea ecx, [ebp-38h]
  '00478C77: call ebx
  '00478C79: lea edx, [ebp-38h]
  '00478C7C: mov eax, 00000002h
  '00478C81: push edx
  '00478C82: mov ecx, [edi]
  '00478C84: sub esp, 00000010h
  '00478C87: mov [ebp-5Ch], ecx
  '00478C8A: mov edx, esp
  '00478C8C: mov ecx, [ecx]
  '00478C8E: push 00420A88h
  '00478C93: mov [edx], eax
  '00478C95: mov eax, [ebp-54h]
  '00478C98: mov [edx+04h], eax
  '00478C9B: mov eax, 00000001h
  '00478CA0: mov [edx+08h], eax
  '00478CA3: mov eax, [ebp-4Ch]
  '00478CA6: mov [edx+0Ch], eax
  '00478CA9: mov edx, [ebp-5Ch]
  '00478CAC: push edx
  '00478CAD: call [ecx+1Ch]
  '00478CB0: test eax, eax
  '00478CB2: fclex 
  '00478CB4: jnl 478CC8h
  '00478CB6: mov ecx, [ebp-5Ch]
  '00478CB9: push 0000001Ch
  '00478CBB: push 004207F8h
  '00478CC0: push ecx
  '00478CC1: push eax
  '00478CC2: call [004010A8h]
  '00478CC8: lea edx, [ebp-38h]
  '00478CCB: push edx
  '00478CCC: call [0040110Ch]
  '00478CD2: lea ecx, [ebp-38h]
  '00478CD5: mov [esi+0000010Eh], ax
  '00478CDC: call ebx
  '00478CDE: lea edx, [ebp-38h]
  '00478CE1: mov eax, 00000002h
  '00478CE6: push edx
  '00478CE7: mov ecx, [edi]
  '00478CE9: sub esp, 00000010h
  '00478CEC: mov [ebp-5Ch], ecx
  '00478CEF: mov edx, esp
  '00478CF1: mov ecx, [ecx]
  '00478CF3: push 00420AA4h
  '00478CF8: mov [edx], eax
  '00478CFA: mov eax, [ebp-54h]
  '00478CFD: mov [edx+04h], eax
  '00478D00: xor eax, eax
  '00478D02: mov [edx+08h], eax
  '00478D05: mov eax, [ebp-4Ch]
  '00478D08: mov [edx+0Ch], eax
  '00478D0B: mov edx, [ebp-5Ch]
  '00478D0E: push edx
  '00478D0F: call [ecx+1Ch]
  '00478D12: test eax, eax
  '00478D14: fclex 
  '00478D16: jnl 478D2Ah
  '00478D18: mov ecx, [ebp-5Ch]
  '00478D1B: push 0000001Ch
  '00478D1D: push 004207F8h
  '00478D22: push ecx
  '00478D23: push eax
  '00478D24: call [004010A8h]
  '00478D2A: lea edx, [ebp-38h]
  '00478D2D: push edx
  '00478D2E: call [0040110Ch]
  '00478D34: lea ecx, [ebp-38h]
  '00478D37: mov [esi+0000010Ch], ax
  '00478D3E: call ebx
  '00478D40: lea edx, [ebp-38h]
  '00478D43: mov eax, 00000002h
  '00478D48: push edx
  '00478D49: mov ecx, [edi]
  '00478D4B: sub esp, 00000010h
  '00478D4E: mov [ebp-5Ch], ecx
  '00478D51: mov edx, esp
  '00478D53: mov ecx, [ecx]
  '00478D55: push 00420AD0h
  '00478D5A: mov [edx], eax
  '00478D5C: mov eax, [ebp-54h]
  '00478D5F: mov [edx+04h], eax
  '00478D62: xor eax, eax
  '00478D64: mov [edx+08h], eax
  '00478D67: mov eax, [ebp-4Ch]
  '00478D6A: mov [edx+0Ch], eax
  '00478D6D: mov edx, [ebp-5Ch]
  '00478D70: push edx
  '00478D71: call [ecx+1Ch]
  '00478D74: test eax, eax
  '00478D76: fclex 
  '00478D78: jnl 478D8Ch
  '00478D7A: mov ecx, [ebp-5Ch]
  '00478D7D: push 0000001Ch
  '00478D7F: push 004207F8h
  '00478D84: push ecx
  '00478D85: push eax
  '00478D86: call [004010A8h]
  '00478D8C: lea edx, [ebp-38h]
  '00478D8F: push edx
  '00478D90: call [004012ECh]
  '00478D96: lea ecx, [ebp-38h]
  '00478D99: mov [esi+00000108h], eax
  '00478D9F: call ebx
  '00478DA1: lea edx, [ebp-38h]
  '00478DA4: mov eax, 00000002h
  '00478DA9: push edx
  '00478DAA: mov ecx, [edi]
  '00478DAC: sub esp, 00000010h
  '00478DAF: mov [ebp-5Ch], ecx
  '00478DB2: mov edx, esp
  '00478DB4: mov ecx, [ecx]
  '00478DB6: push 00420AE8h
  '00478DBB: mov [edx], eax
  '00478DBD: mov eax, [ebp-54h]
  '00478DC0: mov [edx+04h], eax
  '00478DC3: xor eax, eax
  '00478DC5: mov [edx+08h], eax
  '00478DC8: mov eax, [ebp-4Ch]
  '00478DCB: mov [edx+0Ch], eax
  '00478DCE: mov edx, [ebp-5Ch]
  '00478DD1: push edx
  '00478DD2: call [ecx+1Ch]
  '00478DD5: test eax, eax
  '00478DD7: fclex 
  '00478DD9: jnl 478DEDh
  '00478DDB: mov ecx, [ebp-5Ch]
  '00478DDE: push 0000001Ch
  '00478DE0: push 004207F8h
  '00478DE5: push ecx
  '00478DE6: push eax
  '00478DE7: call [004010A8h]
  '00478DED: lea edx, [ebp-38h]
  '00478DF0: push edx
  '00478DF1: call [0040110Ch]
  '00478DF7: lea ecx, [ebp-38h]
  '00478DFA: mov [esi+00000106h], ax
  '00478E01: call ebx
  '00478E03: lea edx, [ebp-38h]
  '00478E06: mov eax, 00000002h
  '00478E0B: push edx
  '00478E0C: mov ecx, [edi]
  '00478E0E: sub esp, 00000010h
  '00478E11: mov [ebp-50h], 00000001h
  '00478E18: mov edx, esp
  '00478E1A: mov [ebp-5Ch], ecx
  '00478E1D: mov ecx, [ecx]
  '00478E1F: push 00420B08h
  '00478E24: mov [edx], eax
  '00478E26: mov eax, [ebp-54h]
  '00478E29: mov [edx+04h], eax
  '00478E2C: mov eax, [ebp-50h]
  '00478E2F: mov [edx+08h], eax
  '00478E32: mov eax, [ebp-4Ch]
  '00478E35: mov [edx+0Ch], eax
  '00478E38: mov edx, [ebp-5Ch]
  '00478E3B: push edx
  '00478E3C: call [ecx+1Ch]
  '00478E3F: test eax, eax
  '00478E41: fclex 
  '00478E43: jnl 478E57h
  '00478E45: mov ecx, [ebp-5Ch]
  '00478E48: push 0000001Ch
  '00478E4A: push 004207F8h
  '00478E4F: push ecx
  '00478E50: push eax
  '00478E51: call [004010A8h]
  '00478E57: lea edx, [ebp-38h]
  '00478E5A: push edx
  '00478E5B: call [0040127Ch]
  '00478E61: lea ecx, [ebp-38h]
  '00478E64: mov [esi+00000102h], ax
  '00478E6B: call ebx
  '00478E6D: lea edx, [ebp-38h]
  '00478E70: mov edi, [edi]
  '00478E72: push edx
  '00478E73: mov eax, 00000002h
  '00478E78: sub esp, 00000010h
  '00478E7B: mov ecx, [edi]
  '00478E7D: mov edx, esp
  '00478E7F: push 00420B18h
  '00478E84: push edi
  '00478E85: mov [edx], eax
  '00478E87: mov eax, [ebp-54h]
  '00478E8A: mov [edx+04h], eax
  '00478E8D: mov eax, 00000008h
  '00478E92: mov [edx+08h], eax
  '00478E95: mov eax, [ebp-4Ch]
  '00478E98: mov [edx+0Ch], eax
  '00478E9B: call [ecx+1Ch]
  '00478E9E: test eax, eax
  '00478EA0: fclex 
  '00478EA2: jnl 478EB3h
  '00478EA4: push 0000001Ch
  '00478EA6: push 004207F8h
  '00478EAB: push edi
  '00478EAC: push eax
  '00478EAD: call [004010A8h]
  '00478EB3: lea ecx, [ebp-38h]
  '00478EB6: push ecx
  '00478EB7: call [0040127Ch]
  '00478EBD: lea ecx, [ebp-38h]
  '00478EC0: mov [esi+00000104h], ax
  '00478EC7: call ebx
  '00478EC9: mov edx, [esi]
  '00478ECB: push esi
  '00478ECC: call [edx+00000934h]
  '00478ED2: mov eax, [esi]
  '00478ED4: push esi
  '00478ED5: call [eax+000008B8h]
  '00478EDB: test eax, eax
  '00478EDD: jnl 478EF1h
  '00478EDF: push 000008B8h
  '00478EE4: push 0041FF7Ch
  '00478EE9: push esi
  '00478EEA: push eax
  '00478EEB: call [004010A8h]
  '00478EF1: mov [ebp-04h], 00000000h
  '00478EF8: push 00478F38h
  '00478EFD: jmp 478F37h
  '00478EFF: lea ecx, [ebp-1Ch]
  '00478F02: lea edx, [ebp-18h]
  '00478F05: push ecx
  '00478F06: push edx
  '00478F07: push 00000002h
  '00478F09: call [004012CCh]
  '00478F0F: lea eax, [ebp-28h]
  '00478F12: lea ecx, [ebp-24h]
  '00478F15: push eax
  '00478F16: lea edx, [ebp-20h]
  '00478F19: push ecx
  '00478F1A: push edx
  '00478F1B: push 00000003h
  '00478F1D: call [0040106Ch]
  '00478F23: lea eax, [ebp-48h]
  '00478F26: lea ecx, [ebp-38h]
  '00478F29: push eax
  '00478F2A: push ecx
  '00478F2B: push 00000002h
  '00478F2D: call [00401058h]
  '00478F33: add esp, 00000028h
  '00478F36: ret 
End Sub
Private Sub UserControl__4779E0
  '004779E0: push ebp
  '004779E1: mov ebp, esp
  '004779E3: sub esp, 0000000Ch
  '004779E6: push 00403796h
  '004779EB: mov eax, fs:[00h]
  '004779F1: push eax
  '004779F2: mov fs:[00000000h], esp
  '004779F9: sub esp, 00000080h
  '004779FF: push ebx
  '00477A00: push esi
  '00477A01: push edi
  '00477A02: mov [ebp-0Ch], esp
  '00477A05: mov [ebp-08h], 004023E8h
  '00477A0C: mov esi, [ebp+08h]
  '00477A0F: mov eax, esi
  '00477A11: and eax, 00000001h
  '00477A14: mov [ebp-04h], eax
  '00477A17: and esi, FFFFFFFEh
  '00477A1A: push esi
  '00477A1B: mov [ebp+08h], esi
  '00477A1E: mov ecx, [esi]
  '00477A20: call [ecx+04h]
  '00477A23: mov edx, [esi]
  '00477A25: lea eax, [ebp-1Ch]
  '00477A28: xor edi, edi
  '00477A2A: push eax
  '00477A2B: push esi
  '00477A2C: mov [ebp-18h], edi
  '00477A2F: mov [ebp-1Ch], edi
  '00477A32: mov [ebp-20h], edi
  '00477A35: mov [ebp-24h], edi
  '00477A38: mov [esi+0000011Ch], 8000000Fh
  '00477A42: mov [esi+00000118h], 80000012h
  '00477A4C: mov word ptr [esi+00000100h], FFFFh
  '00477A55: call [edx+000002B0h]
  '00477A5B: cmp eax, edi
  '00477A5D: fclex 
  '00477A5F: jnl 477A77h
  '00477A61: mov edi, [004010A8h]
  '00477A67: push 000002B0h
  '00477A6C: push 0041FF4Ch
  '00477A71: push esi
  '00477A72: push eax
  '00477A73: call edi
  '00477A75: jmp 477A7Dh
  '00477A77: mov edi, [004010A8h]
  '00477A7D: mov eax, [ebp-1Ch]
  '00477A80: lea edx, [ebp-20h]
  '00477A83: push edx
  '00477A84: push eax
  '00477A85: mov ecx, [eax]
  '00477A87: mov ebx, eax
  '00477A89: call [ecx+24h]
  '00477A8C: test eax, eax
  '00477A8E: fclex 
  '00477A90: jnl 477A9Dh
  '00477A92: push 00000024h
  '00477A94: push 0041BDC4h
  '00477A99: push ebx
  '00477A9A: push eax
  '00477A9B: call edi
  '00477A9D: mov eax, [ebp-20h]
  '00477AA0: mov ecx, [esi+10h]
  '00477AA3: lea edx, [ebp-24h]
  '00477AA6: push eax
  '00477AA7: mov [ebp-20h], 00000000h
  '00477AAE: mov ebx, [ecx]
  '00477AB0: push edx
  '00477AB1: call [004010F0h]
  '00477AB7: push eax
  '00477AB8: mov eax, [esi+10h]
  '00477ABB: push eax
  '00477ABC: call [ebx+0000024Ch]
  '00477AC2: test eax, eax
  '00477AC4: fclex 
  '00477AC6: jnl 477AD9h
  '00477AC8: mov ecx, [esi+10h]
  '00477ACB: push 0000024Ch
  '00477AD0: push 0041FF4Ch
  '00477AD5: push ecx
  '00477AD6: push eax
  '00477AD7: call edi
  '00477AD9: lea edx, [ebp-24h]
  '00477ADC: lea eax, [ebp-1Ch]
  '00477ADF: push edx
  '00477AE0: push eax
  '00477AE1: push 00000002h
  '00477AE3: call [0040106Ch]
  '00477AE9: mov ecx, [esi]
  '00477AEB: add esp, 0000000Ch
  '00477AEE: lea edx, [ebp-1Ch]
  '00477AF1: push edx
  '00477AF2: push esi
  '00477AF3: call [ecx+000002B0h]
  '00477AF9: test eax, eax
  '00477AFB: fclex 
  '00477AFD: jnl 477B0Dh
  '00477AFF: push 000002B0h
  '00477B04: push 0041FF4Ch
  '00477B09: push esi
  '00477B0A: push eax
  '00477B0B: call edi
  '00477B0D: mov eax, [ebp-1Ch]
  '00477B10: lea edx, [ebp-20h]
  '00477B13: push edx
  '00477B14: push eax
  '00477B15: mov ecx, [eax]
  '00477B17: mov ebx, eax
  '00477B19: call [ecx+24h]
  '00477B1C: test eax, eax
  '00477B1E: fclex 
  '00477B20: jnl 477B2Dh
  '00477B22: push 00000024h
  '00477B24: push 0041BDC4h
  '00477B29: push ebx
  '00477B2A: push eax
  '00477B2B: call edi
  '00477B2D: mov eax, [ebp-20h]
  '00477B30: mov ebx, [esi]
  '00477B32: push eax
  '00477B33: lea eax, [ebp-24h]
  '00477B36: push eax
  '00477B37: mov [ebp-20h], 00000000h
  '00477B3E: call [004010F0h]
  '00477B44: push eax
  '00477B45: push esi
  '00477B46: call [ebx+00000940h]
  '00477B4C: test eax, eax
  '00477B4E: fclex 
  '00477B50: jnl 477B60h
  '00477B52: push 00000940h
  '00477B57: push 0041FF7Ch
  '00477B5C: push esi
  '00477B5D: push eax
  '00477B5E: call edi
  '00477B60: lea ecx, [ebp-24h]
  '00477B63: lea edx, [ebp-1Ch]
  '00477B66: push ecx
  '00477B67: push edx
  '00477B68: push 00000002h
  '00477B6A: call [0040106Ch]
  '00477B70: mov eax, [esi]
  '00477B72: add esp, 0000000Ch
  '00477B75: lea ecx, [ebp-1Ch]
  '00477B78: push ecx
  '00477B79: push esi
  '00477B7A: call [eax+000002B0h]
  '00477B80: test eax, eax
  '00477B82: fclex 
  '00477B84: jnl 477B94h
  '00477B86: push 000002B0h
  '00477B8B: push 0041FF4Ch
  '00477B90: push esi
  '00477B91: push eax
  '00477B92: call edi
  '00477B94: mov eax, [ebp-1Ch]
  '00477B97: lea ecx, [ebp-18h]
  '00477B9A: push ecx
  '00477B9B: push eax
  '00477B9C: mov edx, [eax]
  '00477B9E: mov ebx, eax
  '00477BA0: call [edx+20h]
  '00477BA3: test eax, eax
  '00477BA5: fclex 
  '00477BA7: jnl 477BB4h
  '00477BA9: push 00000020h
  '00477BAB: push 0041BDC4h
  '00477BB0: push ebx
  '00477BB1: push eax
  '00477BB2: call edi
  '00477BB4: mov edx, [ebp-18h]
  '00477BB7: lea ecx, [esi+000000B8h]
  '00477BBD: call [004012C4h]
  '00477BC3: lea ecx, [ebp-18h]
  '00477BC6: call [0040138Ch]
  '00477BCC: lea ecx, [ebp-1Ch]
  '00477BCF: call [00401388h]
  '00477BD5: mov eax, 00000001h
  '00477BDA: mov ecx, 00000020h
  '00477BDF: mov [esi+000000BCh], eax
  '00477BE5: mov [esi+000000C0h], 00000002h
  '00477BEF: mov [esi+000000C8h], ecx
  '00477BF5: mov [esi+000000CCh], ecx
  '00477BFB: mov [esi+000000D0h], eax
  '00477C01: mov eax, [4A0F98h]
  '00477C06: test eax, eax
  '00477C08: jnz 477C1Ah
  '00477C0A: push 004A0F98h
  '00477C0F: push 0040FFF4h
  '00477C14: call [004012A8h]
  '00477C1A: lea ebx, [ebp-1Ch]
  '00477C1D: mov ecx, 0000000Ah
  '00477C22: push ebx
  '00477C23: mov eax, 80020004h
  '00477C28: sub esp, 00000010h
  '00477C2B: mov edi, [004A0F98h]
  '00477C31: mov ebx, esp
  '00477C33: sub esp, 00000010h
  '00477C36: mov edx, [edi]
  '00477C38: mov [ebx], ecx
  '00477C3A: mov ecx, [ebp-70h]
  '00477C3D: mov [ebx+04h], ecx
  '00477C40: mov ecx, esp
  '00477C42: sub esp, 00000010h
  '00477C45: mov [ebx+08h], eax
  '00477C48: mov eax, [ebp-68h]
  '00477C4B: mov [ebx+0Ch], eax
  '00477C4E: mov eax, 0000000Ah
  '00477C53: mov [ecx], eax
  '00477C55: mov eax, [ebp-60h]
  '00477C58: mov [ecx+04h], eax
  '00477C5B: mov eax, 80020004h
  '00477C60: mov [ecx+08h], eax
  '00477C63: mov eax, [ebp-58h]
  '00477C66: mov [ecx+0Ch], eax
  '00477C69: mov ecx, esp
  '00477C6B: mov eax, 0000000Ah
  '00477C70: sub esp, 00000010h
  '00477C73: mov [ecx], eax
  '00477C75: mov eax, [ebp-50h]
  '00477C78: mov [ecx+04h], eax
  '00477C7B: mov eax, 80020004h
  '00477C80: mov [ecx+08h], eax
  '00477C83: mov eax, [ebp-48h]
  '00477C86: mov [ecx+0Ch], eax
  '00477C89: mov ecx, esp
  '00477C8B: mov eax, 0000000Ah
  '00477C90: sub esp, 00000010h
  '00477C93: mov [ecx], eax
  '00477C95: mov eax, [ebp-40h]
  '00477C98: mov [ecx+04h], eax
  '00477C9B: mov eax, 80020004h
  '00477CA0: mov [ecx+08h], eax
  '00477CA3: mov eax, [ebp-38h]
  '00477CA6: mov [ecx+0Ch], eax
  '00477CA9: mov ecx, esp
  '00477CAB: mov eax, 00000008h
  '00477CB0: push edi
  '00477CB1: mov [ecx], eax
  '00477CB3: mov eax, [ebp-30h]
  '00477CB6: mov [ecx+04h], eax
  '00477CB9: mov eax, 0040FE84h
  '00477CBE: mov [ecx+08h], eax
  '00477CC1: mov eax, [ebp-28h]
  '00477CC4: mov [ecx+0Ch], eax
  '00477CC7: call [edx+44h]
  '00477CCA: test eax, eax
  '00477CCC: fclex 
  '00477CCE: jnl 477CDFh
  '00477CD0: push 00000044h
  '00477CD2: push 0040FFE4h
  '00477CD7: push edi
  '00477CD8: push eax
  '00477CD9: call [004010A8h]
  '00477CDF: mov ecx, [ebp-1Ch]
  '00477CE2: lea edx, [esi+000000B4h]
  '00477CE8: push ecx
  '00477CE9: push edx
  '00477CEA: call [004010FCh]
  '00477CF0: lea ecx, [ebp-1Ch]
  '00477CF3: call [00401388h]
  '00477CF9: mov eax, [4A0F98h]
  '00477CFE: test eax, eax
  '00477D00: jnz 477D12h
  '00477D02: push 004A0F98h
  '00477D07: push 0040FFF4h
  '00477D0C: call [004012A8h]
  '00477D12: lea ebx, [ebp-1Ch]
  '00477D15: mov ecx, 0000000Ah
  '00477D1A: push ebx
  '00477D1B: mov [ebp-44h], ecx
  '00477D1E: sub esp, 00000010h
  '00477D21: mov eax, 80020004h
  '00477D26: mov ebx, esp
  '00477D28: mov [ebp-3Ch], eax
  '00477D2B: sub esp, 00000010h
  '00477D2E: mov edi, [004A0F98h]
  '00477D34: mov [ebx], ecx
  '00477D36: mov ecx, [ebp-70h]
  '00477D39: mov edx, [edi]
  '00477D3B: mov [ebx+04h], ecx
  '00477D3E: mov ecx, esp
  '00477D40: sub esp, 00000010h
  '00477D43: mov [ebx+08h], eax
  '00477D46: mov eax, [ebp-68h]
  '00477D49: mov [ebx+0Ch], eax
  '00477D4C: mov eax, 0000000Ah
  '00477D51: mov [ecx], eax
  '00477D53: mov eax, [ebp-60h]
  '00477D56: mov [ecx+04h], eax
  '00477D59: mov eax, 80020004h
  '00477D5E: mov [ecx+08h], eax
  '00477D61: mov eax, [ebp-58h]
  '00477D64: mov [ecx+0Ch], eax
  '00477D67: mov ecx, esp
  '00477D69: mov eax, 0000000Ah
  '00477D6E: sub esp, 00000010h
  '00477D71: mov [ecx], eax
  '00477D73: mov eax, [ebp-50h]
  '00477D76: mov [ecx+04h], eax
  '00477D79: mov eax, 80020004h
  '00477D7E: mov [ecx+08h], eax
  '00477D81: mov eax, [ebp-48h]
  '00477D84: mov [ecx+0Ch], eax
  '00477D87: mov eax, [ebp-44h]
  '00477D8A: mov ecx, esp
  '00477D8C: sub esp, 00000010h
  '00477D8F: mov [ecx], eax
  '00477D91: mov eax, [ebp-40h]
  '00477D94: mov [ecx+04h], eax
  '00477D97: mov eax, [ebp-3Ch]
  '00477D9A: mov [ecx+08h], eax
  '00477D9D: mov eax, [ebp-38h]
  '00477DA0: mov [ecx+0Ch], eax
  '00477DA3: mov ecx, esp
  '00477DA5: mov eax, 00000008h
  '00477DAA: push edi
  '00477DAB: mov [ecx], eax
  '00477DAD: mov eax, [ebp-30h]
  '00477DB0: mov [ecx+04h], eax
  '00477DB3: mov eax, 0040FE84h
  '00477DB8: mov [ecx+08h], eax
  '00477DBB: mov eax, [ebp-28h]
  '00477DBE: mov [ecx+0Ch], eax
  '00477DC1: call [edx+44h]
  '00477DC4: xor ebx, ebx
  '00477DC6: cmp eax, ebx
  '00477DC8: fclex 
  '00477DCA: jnl 477DDBh
  '00477DCC: push 00000044h
  '00477DCE: push 0040FFE4h
  '00477DD3: push edi
  '00477DD4: push eax
  '00477DD5: call [004010A8h]
  '00477DDB: mov ecx, [ebp-1Ch]
  '00477DDE: lea edx, [esi+000000B0h]
  '00477DE4: push ecx
  '00477DE5: push edx
  '00477DE6: call [004010FCh]
  '00477DEC: lea ecx, [ebp-1Ch]
  '00477DEF: call [00401388h]
  '00477DF5: mov edi, [004012C4h]
  '00477DFB: mov edx, 0040FE84h
  '00477E00: lea ecx, [esi+000000FCh]
  '00477E06: call edi
  '00477E08: mov edx, 0041BFA4h
  '00477E0D: lea ecx, [esi+00000110h]
  '00477E13: mov [esi+00000124h], 80000014h
  '00477E1D: mov [esi+00000128h], 80000016h
  '00477E27: mov word ptr [esi+00000120h], FFFFh
  '00477E30: call edi
  '00477E32: mov edx, 004207B4h
  '00477E37: lea ecx, [esi+00000114h]
  '00477E3D: call edi
  '00477E3F: mov word ptr [esi+0000010Eh], FFFFh
  '00477E48: mov [esi+0000010Ch], bx
  '00477E4F: mov [esi+00000108h], ebx
  '00477E55: mov [esi+00000106h], bx
  '00477E5C: mov word ptr [esi+00000102h], 0001h
  '00477E65: mov word ptr [esi+00000104h], 0008h
  '00477E6E: mov [ebp-04h], ebx
  '00477E71: push 00477E9Ah
  '00477E76: jmp 477E99h
  '00477E78: lea ecx, [ebp-18h]
  '00477E7B: call [0040138Ch]
  '00477E81: lea eax, [ebp-24h]
  '00477E84: lea ecx, [ebp-20h]
  '00477E87: push eax
  '00477E88: lea edx, [ebp-1Ch]
  '00477E8B: push ecx
  '00477E8C: push edx
  '00477E8D: push 00000003h
  '00477E8F: call [0040106Ch]
  '00477E95: add esp, 00000010h
  '00477E98: ret 
End Sub
Private Sub UserControl__47AF60
  '0047AF60: push ebp
  '0047AF61: mov ebp, esp
  '0047AF63: sub esp, 0000000Ch
  '0047AF66: push 00403796h
  '0047AF6B: mov eax, fs:[00h]
  '0047AF71: push eax
  '0047AF72: mov fs:[00000000h], esp
  '0047AF79: sub esp, 0000000Ch
  '0047AF7C: push ebx
  '0047AF7D: push esi
  '0047AF7E: push edi
  '0047AF7F: mov [ebp-0Ch], esp
  '0047AF82: mov [ebp-08h], 00402460h
  '0047AF89: mov esi, [ebp+08h]
  '0047AF8C: mov eax, esi
  '0047AF8E: and eax, 00000001h
  '0047AF91: mov [ebp-04h], eax
  '0047AF94: and esi, FFFFFFFEh
  '0047AF97: push esi
  '0047AF98: mov [ebp+08h], esi
  '0047AF9B: mov ecx, [esi]
  '0047AF9D: call [ecx+04h]
  '0047AFA0: mov ecx, 00000001h
  '0047AFA5: call [004011F4h]
  '0047AFAB: mov edx, [esi]
  '0047AFAD: push esi
  '0047AFAE: mov [esi+000000E8h], al
  '0047AFB4: call [edx+000007A4h]
  '0047AFBA: test eax, eax
  '0047AFBC: jnl 47AFD0h
  '0047AFBE: push 000007A4h
  '0047AFC3: push 0041FF7Ch
  '0047AFC8: push esi
  '0047AFC9: push eax
  '0047AFCA: call [004010A8h]
  '0047AFD0: mov [ebp-04h], 00000000h
  '0047AFD7: mov eax, [ebp+08h]
  '0047AFDA: push eax
  '0047AFDB: mov ecx, [eax]
  '0047AFDD: call [ecx+08h]
  '0047AFE0: mov eax, [ebp-04h]
  '0047AFE3: mov ecx, [ebp-14h]
  '0047AFE6: pop edi
  '0047AFE7: pop esi
  '0047AFE8: mov fs:[00000000h], ecx
  '0047AFEF: pop ebx
  '0047AFF0: mov esp, ebp
  '0047AFF2: pop ebp
  '0047AFF3: retn 0004h
End Sub
Private Sub UserControl__47B000
  '0047B000: push ebp
  '0047B001: mov ebp, esp
  '0047B003: sub esp, 0000000Ch
  '0047B006: push 00403796h
  '0047B00B: mov eax, fs:[00h]
  '0047B011: push eax
  '0047B012: mov fs:[00000000h], esp
  '0047B019: sub esp, 0000000Ch
  '0047B01C: push ebx
  '0047B01D: push esi
  '0047B01E: push edi
  '0047B01F: mov [ebp-0Ch], esp
  '0047B022: mov [ebp-08h], 00402468h
  '0047B029: mov esi, [ebp+08h]
  '0047B02C: mov eax, esi
  '0047B02E: and eax, 00000001h
  '0047B031: mov [ebp-04h], eax
  '0047B034: and esi, FFFFFFFEh
  '0047B037: push esi
  '0047B038: mov [ebp+08h], esi
  '0047B03B: mov ecx, [esi]
  '0047B03D: call [ecx+04h]
  '0047B040: mov edi, [004011F4h]
  '0047B046: xor ecx, ecx
  '0047B048: call edi
  '0047B04A: xor ecx, ecx
  '0047B04C: mov [esi+000000E8h], al
  '0047B052: call edi
  '0047B054: mov edx, [esi]
  '0047B056: push esi
  '0047B057: mov [esi+000000E9h], al
  '0047B05D: call [edx+000007A4h]
  '0047B063: test eax, eax
  '0047B065: jnl 47B079h
  '0047B067: push 000007A4h
  '0047B06C: push 0041FF7Ch
  '0047B071: push esi
  '0047B072: push eax
  '0047B073: call [004010A8h]
  '0047B079: mov [ebp-04h], 00000000h
  '0047B080: mov eax, [ebp+08h]
  '0047B083: push eax
  '0047B084: mov ecx, [eax]
  '0047B086: call [ecx+08h]
  '0047B089: mov eax, [ebp-04h]
  '0047B08C: mov ecx, [ebp-14h]
  '0047B08F: pop edi
  '0047B090: pop esi
  '0047B091: mov fs:[00000000h], ecx
  '0047B098: pop ebx
  '0047B099: mov esp, ebp
  '0047B09B: pop ebp
  '0047B09C: retn 0004h
End Sub
Private Sub UserControl__47AED0
  '0047AED0: push ebp
  '0047AED1: mov ebp, esp
  '0047AED3: sub esp, 0000000Ch
  '0047AED6: push 00403796h
  '0047AEDB: mov eax, fs:[00h]
  '0047AEE1: push eax
  '0047AEE2: mov fs:[00000000h], esp
  '0047AEE9: sub esp, 0000000Ch
  '0047AEEC: push ebx
  '0047AEED: push esi
  '0047AEEE: push edi
  '0047AEEF: mov [ebp-0Ch], esp
  '0047AEF2: mov [ebp-08h], 00402458h
  '0047AEF9: mov esi, [ebp+08h]
  '0047AEFC: mov eax, esi
  '0047AEFE: and eax, 00000001h
  '0047AF01: mov [ebp-04h], eax
  '0047AF04: and esi, FFFFFFFEh
  '0047AF07: push esi
  '0047AF08: mov [ebp+08h], esi
  '0047AF0B: mov ecx, [esi]
  '0047AF0D: call [ecx+04h]
  '0047AF10: mov edx, [esi]
  '0047AF12: push esi
  '0047AF13: call [edx+000007A4h]
  '0047AF19: test eax, eax
  '0047AF1B: jnl 47AF2Fh
  '0047AF1D: push 000007A4h
  '0047AF22: push 0041FF7Ch
  '0047AF27: push esi
  '0047AF28: push eax
  '0047AF29: call [004010A8h]
  '0047AF2F: mov [ebp-04h], 00000000h
  '0047AF36: mov eax, [ebp+08h]
  '0047AF39: push eax
  '0047AF3A: mov ecx, [eax]
  '0047AF3C: call [ecx+08h]
  '0047AF3F: mov eax, [ebp-04h]
  '0047AF42: mov ecx, [ebp-14h]
  '0047AF45: pop edi
  '0047AF46: pop esi
  '0047AF47: mov fs:[00000000h], ecx
  '0047AF4E: pop ebx
  '0047AF4F: mov esp, ebp
  '0047AF51: pop ebp
  '0047AF52: retn 0008h
End Sub
Private Sub UserControl__47AE10
  '0047AE10: push ebp
  '0047AE11: mov ebp, esp
  '0047AE13: sub esp, 0000000Ch
  '0047AE16: push 00403796h
  '0047AE1B: mov eax, fs:[00h]
  '0047AE21: push eax
  '0047AE22: mov fs:[00000000h], esp
  '0047AE29: sub esp, 00000010h
  '0047AE2C: push ebx
  '0047AE2D: push esi
  '0047AE2E: push edi
  '0047AE2F: mov [ebp-0Ch], esp
  '0047AE32: mov [ebp-08h], 00402450h
  '0047AE39: mov esi, [ebp+08h]
  '0047AE3C: mov eax, esi
  '0047AE3E: and eax, 00000001h
  '0047AE41: mov [ebp-04h], eax
  '0047AE44: and esi, FFFFFFFEh
  '0047AE47: push esi
  '0047AE48: mov [ebp+08h], esi
  '0047AE4B: mov ecx, [esi]
  '0047AE4D: call [ecx+04h]
  '0047AE50: mov edx, [esi]
  '0047AE52: lea eax, [ebp-18h]
  '0047AE55: xor edi, edi
  '0047AE57: push eax
  '0047AE58: push esi
  '0047AE59: mov [ebp-18h], edi
  '0047AE5C: call [edx+000007A8h]
  '0047AE62: cmp eax, edi
  '0047AE64: fclex 
  '0047AE66: jnl 47AE7Ah
  '0047AE68: push 000007A8h
  '0047AE6D: push 0041FF7Ch
  '0047AE72: push esi
  '0047AE73: push eax
  '0047AE74: call [004010A8h]
  '0047AE7A: cmp [ebp-18h], di
  '0047AE7E: jz 47AEACh
  '0047AE80: push edi
  '0047AE81: push 00000001h
  '0047AE83: push esi
  '0047AE84: call [00401068h]
  '0047AE8A: mov ecx, [esi]
  '0047AE8C: add esp, 0000000Ch
  '0047AE8F: push esi
  '0047AE90: call [ecx+000007D4h]
  '0047AE96: cmp eax, edi
  '0047AE98: jnl 47AEACh
  '0047AE9A: push 000007D4h
  '0047AE9F: push 0041FF7Ch
  '0047AEA4: push esi
  '0047AEA5: push eax
  '0047AEA6: call [004010A8h]
  '0047AEAC: mov [ebp-04h], edi
  '0047AEAF: mov eax, [ebp+08h]
  '0047AEB2: push eax
  '0047AEB3: mov edx, [eax]
  '0047AEB5: call [edx+08h]
  '0047AEB8: mov eax, [ebp-04h]
  '0047AEBB: mov ecx, [ebp-14h]
  '0047AEBE: pop edi
  '0047AEBF: pop esi
  '0047AEC0: mov fs:[00000000h], ecx
  '0047AEC7: pop ebx
  '0047AEC8: mov esp, ebp
  '0047AECA: pop ebp
  '0047AECB: retn 0008h
End Sub
Private Sub OverTimer__47E480
  '0047E480: push ebp
  '0047E481: mov ebp, esp
  '0047E483: sub esp, 0000000Ch
  '0047E486: push 00403796h
  '0047E48B: mov eax, fs:[00h]
  '0047E491: push eax
  '0047E492: mov fs:[00000000h], esp
  '0047E499: sub esp, 00000034h
  '0047E49C: push ebx
  '0047E49D: push esi
  '0047E49E: push edi
  '0047E49F: mov [ebp-0Ch], esp
  '0047E4A2: mov [ebp-08h], 00402588h
  '0047E4A9: mov esi, [ebp+08h]
  '0047E4AC: mov eax, esi
  '0047E4AE: and eax, 00000001h
  '0047E4B1: mov [ebp-04h], eax
  '0047E4B4: and esi, FFFFFFFEh
  '0047E4B7: push esi
  '0047E4B8: mov [ebp+08h], esi
  '0047E4BB: mov ecx, [esi]
  '0047E4BD: call [ecx+04h]
  '0047E4C0: xor edx, edx
  '0047E4C2: lea eax, [ebp-1Ch]
  '0047E4C5: mov [ebp-1Ch], edx
  '0047E4C8: xor edi, edi
  '0047E4CA: push eax
  '0047E4CB: mov [ebp-18h], edx
  '0047E4CE: mov [ebp-20h], edi
  '0047E4D1: mov [ebp-30h], edi
  '0047E4D4: mov [ebp-34h], edi
  '0047E4D7: call 00420624h
  '0047E4DC: call [004010A4h]
  '0047E4E2: mov ecx, [esi]
  '0047E4E4: lea edx, [ebp-34h]
  '0047E4E7: push edx
  '0047E4E8: push esi
  '0047E4E9: call [ecx+000007B8h]
  '0047E4EF: cmp eax, edi
  '0047E4F1: jnl 47E509h
  '0047E4F3: mov ebx, [004010A8h]
  '0047E4F9: push 000007B8h
  '0047E4FE: push 0041FF7Ch
  '0047E503: push esi
  '0047E504: push eax
  '0047E505: call ebx
  '0047E507: jmp 47E50Fh
  '0047E509: mov ebx, [004010A8h]
  '0047E50F: mov eax, [ebp-18h]
  '0047E512: mov ecx, [ebp-1Ch]
  '0047E515: push eax
  '0047E516: push ecx
  '0047E517: call 004205C8h
  '0047E51C: mov edi, eax
  '0047E51E: call [004010A4h]
  '0047E524: cmp [ebp-34h], edi
  '0047E527: jz 0047E60Eh
  '0047E52D: mov edx, [esi]
  '0047E52F: push esi
  '0047E530: call [edx+000003A8h]
  '0047E536: push eax
  '0047E537: lea eax, [ebp-20h]
  '0047E53A: push eax
  '0047E53B: call [004010F0h]
  '0047E541: mov edi, eax
  '0047E543: push 00000000h
  '0047E545: push edi
  '0047E546: mov ecx, [edi]
  '0047E548: call [ecx+5Ch]
  '0047E54B: test eax, eax
  '0047E54D: fclex 
  '0047E54F: jnl 47E55Ch
  '0047E551: push 0000005Ch
  '0047E553: push 004148B4h
  '0047E558: push edi
  '0047E559: push eax
  '0047E55A: call ebx
  '0047E55C: lea ecx, [ebp-20h]
  '0047E55F: call [00401388h]
  '0047E565: mov edi, [004011F4h]
  '0047E56B: xor ecx, ecx
  '0047E56D: call edi
  '0047E56F: mov edx, [esi+000000B0h]
  '0047E575: mov [esi+000000EAh], al
  '0047E57B: lea eax, [esi+000000C4h]
  '0047E581: push edx
  '0047E582: push eax
  '0047E583: call [004010FCh]
  '0047E589: sub esp, 00000010h
  '0047E58C: mov ecx, 00004002h
  '0047E591: mov edx, esp
  '0047E593: lea eax, [esi+000000EEh]
  '0047E599: push 00000001h
  '0047E59B: push 00000009h
  '0047E59D: mov [edx], ecx
  '0047E59F: mov ecx, [ebp-2Ch]
  '0047E5A2: push esi
  '0047E5A3: mov [edx+04h], ecx
  '0047E5A6: mov [edx+08h], eax
  '0047E5A9: mov eax, [ebp-24h]
  '0047E5AC: mov [edx+0Ch], eax
  '0047E5AF: call [00401068h]
  '0047E5B5: mov ecx, [esi]
  '0047E5B7: add esp, 0000001Ch
  '0047E5BA: push esi
  '0047E5BB: call [ecx+000007A4h]
  '0047E5C1: test eax, eax
  '0047E5C3: jnl 47E5D3h
  '0047E5C5: push 000007A4h
  '0047E5CA: push 0041FF7Ch
  '0047E5CF: push esi
  '0047E5D0: push eax
  '0047E5D1: call ebx
  '0047E5D3: cmp byte ptr [esi+000000E9h], 01h
  '0047E5DA: jnz 47E60Eh
  '0047E5DC: xor ecx, ecx
  '0047E5DE: call edi
  '0047E5E0: mov edx, [esi]
  '0047E5E2: push esi
  '0047E5E3: mov [esi+000000E9h], al
  '0047E5E9: call [edx+000007A4h]
  '0047E5EF: test eax, eax
  '0047E5F1: jnl 47E601h
  '0047E5F3: push 000007A4h
  '0047E5F8: push 0041FF7Ch
  '0047E5FD: push esi
  '0047E5FE: push eax
  '0047E5FF: call ebx
  '0047E601: mov ecx, 00000001h
  '0047E606: call edi
  '0047E608: mov [esi+000000E9h], al
  '0047E60E: mov [ebp-04h], 00000000h
  '0047E615: push 0047E627h
  '0047E61A: jmp 47E626h
  '0047E61C: lea ecx, [ebp-20h]
  '0047E61F: call [00401388h]
  '0047E625: ret 
End Sub
Private Sub unknown_47B2F0
  '0047B2F0: push ebp
  '0047B2F1: mov ebp, esp
  '0047B2F3: sub esp, 0000000Ch
  '0047B2F6: push 00403796h
  '0047B2FB: mov eax, fs:[00h]
  '0047B301: push eax
  '0047B302: mov fs:[00000000h], esp
  '0047B309: sub esp, 00000010h
  '0047B30C: push ebx
  '0047B30D: push esi
  '0047B30E: push edi
  '0047B30F: mov [ebp-0Ch], esp
  '0047B312: mov [ebp-08h], 00402480h
  '0047B319: xor ebx, ebx
  '0047B31B: mov [ebp-04h], ebx
  '0047B31E: mov esi, [ebp+08h]
  '0047B321: push esi
  '0047B322: mov eax, [esi]
  '0047B324: call [eax+04h]
  '0047B327: mov ecx, [esi]
  '0047B329: push FFFFFFFFh
  '0047B32B: push esi
  '0047B32C: mov [ebp-18h], ebx
  '0047B32F: call [ecx+0000014Ch]
  '0047B335: cmp eax, ebx
  '0047B337: fclex 
  '0047B339: jnl 47B351h
  '0047B33B: mov edi, [004010A8h]
  '0047B341: push 0000014Ch
  '0047B346: push 0041FF4Ch
  '0047B34B: push esi
  '0047B34C: push eax
  '0047B34D: call edi
  '0047B34F: jmp 47B357h
  '0047B351: mov edi, [004010A8h]
  '0047B357: mov eax, [esi+10h]
  '0047B35A: push eax
  '0047B35B: mov edx, [eax]
  '0047B35D: call [edx+0000035Ch]
  '0047B363: cmp eax, ebx
  '0047B365: fclex 
  '0047B367: jnl 47B37Ah
  '0047B369: mov ecx, [esi+10h]
  '0047B36C: push 0000035Ch
  '0047B371: push 0041FF4Ch
  '0047B376: push ecx
  '0047B377: push eax
  '0047B378: call edi
  '0047B37A: mov edx, [esi]
  '0047B37C: push esi
  '0047B37D: call [edx+000008E8h]
  '0047B383: cmp [esi+000000C0h], 00000004h
  '0047B38A: jz 47B395h
  '0047B38C: mov eax, [esi]
  '0047B38E: push esi
  '0047B38F: call [eax+000008ECh]
  '0047B395: mov ecx, [esi]
  '0047B397: push esi
  '0047B398: call [ecx+000008A0h]
  '0047B39E: mov edx, [esi]
  '0047B3A0: push esi
  '0047B3A1: call [edx+00000908h]
  '0047B3A7: cmp byte ptr [esi+000000E8h], 01h
  '0047B3AE: jnz 47B3F9h
  '0047B3B0: cmp [esi+00000100h], bx
  '0047B3B7: jz 47B3F9h
  '0047B3B9: cmp [esi+000000C0h], 00000003h
  '0047B3C0: jz 47B3F9h
  '0047B3C2: mov eax, [esi]
  '0047B3C4: lea ecx, [ebp-18h]
  '0047B3C7: push ecx
  '0047B3C8: push esi
  '0047B3C9: call [eax+000000D8h]
  '0047B3CF: cmp eax, ebx
  '0047B3D1: fclex 
  '0047B3D3: jnl 47B3E3h
  '0047B3D5: push 000000D8h
  '0047B3DA: push 0041FF4Ch
  '0047B3DF: push esi
  '0047B3E0: push eax
  '0047B3E1: call edi
  '0047B3E3: mov eax, [ebp-18h]
  '0047B3E6: lea edx, [esi+00000088h]
  '0047B3EC: push edx
  '0047B3ED: push eax
  '0047B3EE: call 004206B0h
  '0047B3F3: call [004010A4h]
  '0047B3F9: mov ecx, [esi]
  '0047B3FB: push esi
  '0047B3FC: call [ecx+000008FCh]
  '0047B402: mov edx, [esi]
  '0047B404: push ebx
  '0047B405: push esi
  '0047B406: call [edx+0000014Ch]
  '0047B40C: cmp eax, ebx
  '0047B40E: fclex 
  '0047B410: jnl 47B420h
  '0047B412: push 0000014Ch
  '0047B417: push 0041FF4Ch
  '0047B41C: push esi
  '0047B41D: push eax
  '0047B41E: call edi
  '0047B420: mov eax, [ebp+08h]
  '0047B423: push eax
  '0047B424: mov ecx, [eax]
  '0047B426: call [ecx+08h]
  '0047B429: mov eax, [ebp-04h]
  '0047B42C: mov ecx, [ebp-14h]
  '0047B42F: pop edi
  '0047B430: pop esi
  '0047B431: mov fs:[00000000h], ecx
  '0047B438: pop ebx
  '0047B439: mov esp, ebp
  '0047B43B: pop ebp
  '0047B43C: retn 0004h
End Sub
Private Sub unknown_47BF40
  '0047BF40: push ebp
  '0047BF41: mov ebp, esp
  '0047BF43: sub esp, 0000000Ch
  '0047BF46: push 00403796h
  '0047BF4B: mov eax, fs:[00h]
  '0047BF51: push eax
  '0047BF52: mov fs:[00000000h], esp
  '0047BF59: sub esp, 00000014h
  '0047BF5C: push ebx
  '0047BF5D: push esi
  '0047BF5E: push edi
  '0047BF5F: mov [ebp-0Ch], esp
  '0047BF62: mov [ebp-08h], 004024D0h
  '0047BF69: xor edi, edi
  '0047BF6B: mov [ebp-04h], edi
  '0047BF6E: mov esi, [ebp+08h]
  '0047BF71: push esi
  '0047BF72: mov eax, [esi]
  '0047BF74: call [eax+04h]
  '0047BF77: mov eax, [esi+10h]
  '0047BF7A: lea edx, [ebp-1Ch]
  '0047BF7D: mov [ebp-1Ch], edi
  '0047BF80: push edx
  '0047BF81: mov ecx, [eax]
  '0047BF83: push eax
  '0047BF84: mov [ebp-18h], edi
  '0047BF87: call [ecx+00000090h]
  '0047BF8D: cmp eax, edi
  '0047BF8F: fclex 
  '0047BF91: jnl 47BFA8h
  '0047BF93: mov ecx, [esi+10h]
  '0047BF96: push 00000090h
  '0047BF9B: push 0041FF4Ch
  '0047BFA0: push ecx
  '0047BFA1: push eax
  '0047BFA2: call [004010A8h]
  '0047BFA8: mov edx, [ebp-1Ch]
  '0047BFAB: mov [ebp-18h], edx
  '0047BFAE: mov eax, [ebp+08h]
  '0047BFB1: push eax
  '0047BFB2: mov ecx, [eax]
  '0047BFB4: call [ecx+08h]
  '0047BFB7: mov edx, [ebp+0Ch]
  '0047BFBA: mov ax, [ebp-18h]
  '0047BFBE: mov [edx], ax
  '0047BFC1: mov eax, [ebp-04h]
  '0047BFC4: mov ecx, [ebp-14h]
  '0047BFC7: pop edi
  '0047BFC8: pop esi
  '0047BFC9: mov fs:[00000000h], ecx
  '0047BFD0: pop ebx
  '0047BFD1: mov esp, ebp
  '0047BFD3: pop ebp
  '0047BFD4: retn 0008h
End Sub
Private Sub unknown_47BFE0
  '0047BFE0: push ebp
  '0047BFE1: mov ebp, esp
  '0047BFE3: sub esp, 0000000Ch
  '0047BFE6: push 00403796h
  '0047BFEB: mov eax, fs:[00h]
  '0047BFF1: push eax
  '0047BFF2: mov fs:[00000000h], esp
  '0047BFF9: sub esp, 0000001Ch
  '0047BFFC: push ebx
  '0047BFFD: push esi
  '0047BFFE: push edi
  '0047BFFF: mov [ebp-0Ch], esp
  '0047C002: mov [ebp-08h], 004024D8h
  '0047C009: mov [ebp-04h], 00000000h
  '0047C010: mov esi, [ebp+08h]
  '0047C013: push esi
  '0047C014: mov eax, [esi]
  '0047C016: call [eax+04h]
  '0047C019: mov eax, [esi+10h]
  '0047C01C: mov edx, [ebp+0Ch]
  '0047C01F: push edx
  '0047C020: push eax
  '0047C021: mov ecx, [eax]
  '0047C023: call [ecx+00000094h]
  '0047C029: test eax, eax
  '0047C02B: fclex 
  '0047C02D: jnl 47C048h
  '0047C02F: mov ecx, [esi+10h]
  '0047C032: mov edi, [004010A8h]
  '0047C038: push 00000094h
  '0047C03D: push 0041FF4Ch
  '0047C042: push ecx
  '0047C043: push eax
  '0047C044: call edi
  '0047C046: jmp 47C04Eh
  '0047C048: mov edi, [004010A8h]
  '0047C04E: sub esp, 00000010h
  '0047C051: mov ecx, 00000008h
  '0047C056: mov ebx, esp
  '0047C058: mov edx, [esi]
  '0047C05A: mov eax, 004209ACh
  '0047C05F: push esi
  '0047C060: mov [ebx], ecx
  '0047C062: mov ecx, [ebp-20h]
  '0047C065: mov [ebx+04h], ecx
  '0047C068: mov [ebx+08h], eax
  '0047C06B: mov eax, [ebp-18h]
  '0047C06E: mov [ebx+0Ch], eax
  '0047C071: call [edx+00000390h]
  '0047C077: test eax, eax
  '0047C079: fclex 
  '0047C07B: jnl 47C08Bh
  '0047C07D: push 00000390h
  '0047C082: push 0041FF4Ch
  '0047C087: push esi
  '0047C088: push eax
  '0047C089: call edi
  '0047C08B: mov ecx, [esi]
  '0047C08D: push esi
  '0047C08E: call [ecx+000007A4h]
  '0047C094: test eax, eax
  '0047C096: jnl 47C0A6h
  '0047C098: push 000007A4h
  '0047C09D: push 0041FF7Ch
  '0047C0A2: push esi
  '0047C0A3: push eax
  '0047C0A4: call edi
  '0047C0A6: mov eax, [ebp+08h]
  '0047C0A9: push eax
  '0047C0AA: mov edx, [eax]
  '0047C0AC: call [edx+08h]
  '0047C0AF: mov eax, [ebp-04h]
  '0047C0B2: mov ecx, [ebp-14h]
  '0047C0B5: pop edi
  '0047C0B6: pop esi
  '0047C0B7: mov fs:[00000000h], ecx
  '0047C0BE: pop ebx
  '0047C0BF: mov esp, ebp
  '0047C0C1: pop ebp
  '0047C0C2: retn 0008h
End Sub
Private Sub unknown_47C0D0
  '0047C0D0: push ebp
  '0047C0D1: mov ebp, esp
  '0047C0D3: sub esp, 0000000Ch
  '0047C0D6: push 00403796h
  '0047C0DB: mov eax, fs:[00h]
  '0047C0E1: push eax
  '0047C0E2: mov fs:[00000000h], esp
  '0047C0E9: sub esp, 00000018h
  '0047C0EC: push ebx
  '0047C0ED: push esi
  '0047C0EE: push edi
  '0047C0EF: mov [ebp-0Ch], esp
  '0047C0F2: mov [ebp-08h], 004024E0h
  '0047C0F9: xor edi, edi
  '0047C0FB: mov [ebp-04h], edi
  '0047C0FE: mov esi, [ebp+08h]
  '0047C101: push esi
  '0047C102: mov eax, [esi]
  '0047C104: call [eax+04h]
  '0047C107: mov ecx, [ebp+0Ch]
  '0047C10A: lea eax, [ebp-1Ch]
  '0047C10D: push eax
  '0047C10E: push esi
  '0047C10F: mov [ecx], edi
  '0047C111: mov edx, [esi]
  '0047C113: mov [ebp-18h], edi
  '0047C116: mov [ebp-1Ch], edi
  '0047C119: call [edx+00000938h]
  '0047C11F: cmp eax, edi
  '0047C121: fclex 
  '0047C123: jnl 47C137h
  '0047C125: push 00000938h
  '0047C12A: push 0041FF7Ch
  '0047C12F: push esi
  '0047C130: push eax
  '0047C131: call [004010A8h]
  '0047C137: mov eax, [ebp-1Ch]
  '0047C13A: lea ecx, [ebp-18h]
  '0047C13D: push eax
  '0047C13E: push ecx
  '0047C13F: mov [ebp-1Ch], edi
  '0047C142: call [004010F0h]
  '0047C148: push 0047C169h
  '0047C14D: jmp 47C168h
  '0047C14F: test byte ptr [ebp-04h], 04h
  '0047C153: jz 47C15Eh
  '0047C155: lea ecx, [ebp-18h]
  '0047C158: call [00401388h]
  '0047C15E: lea ecx, [ebp-1Ch]
  '0047C161: call [00401388h]
  '0047C167: ret 
End Sub
Private Sub unknown_47C190
  '0047C190: push ebp
  '0047C191: mov ebp, esp
  '0047C193: sub esp, 0000000Ch
  '0047C196: push 00403796h
  '0047C19B: mov eax, fs:[00h]
  '0047C1A1: push eax
  '0047C1A2: mov fs:[00000000h], esp
  '0047C1A9: sub esp, 0000005Ch
  '0047C1AC: push ebx
  '0047C1AD: push esi
  '0047C1AE: push edi
  '0047C1AF: mov [ebp-0Ch], esp
  '0047C1B2: mov [ebp-08h], 004024F0h
  '0047C1B9: xor edi, edi
  '0047C1BB: mov [ebp-04h], edi
  '0047C1BE: mov esi, [ebp+08h]
  '0047C1C1: push esi
  '0047C1C2: mov eax, [esi]
  '0047C1C4: call [eax+04h]
  '0047C1C7: mov ecx, [ebp+0Ch]
  '0047C1CA: lea edx, [ebp-18h]
  '0047C1CD: push ecx
  '0047C1CE: push edx
  '0047C1CF: mov [ebp-18h], edi
  '0047C1D2: mov [ebp-1Ch], edi
  '0047C1D5: mov [ebp-2Ch], edi
  '0047C1D8: mov [ebp-3Ch], edi
  '0047C1DB: mov [ebp-4Ch], edi
  '0047C1DE: mov [ebp-64h], edi
  '0047C1E1: call [004010FCh]
  '0047C1E7: mov eax, [esi]
  '0047C1E9: lea ecx, [ebp-1Ch]
  '0047C1EC: push ecx
  '0047C1ED: push esi
  '0047C1EE: call [eax+00000938h]
  '0047C1F4: cmp eax, edi
  '0047C1F6: fclex 
  '0047C1F8: jnl 47C20Ch
  '0047C1FA: push 00000938h
  '0047C1FF: push 0041FF7Ch
  '0047C204: push esi
  '0047C205: push eax
  '0047C206: call [004010A8h]
  '0047C20C: mov eax, [ebp-1Ch]
  '0047C20F: lea edx, [ebp-64h]
  '0047C212: push eax
  '0047C213: push edx
  '0047C214: mov [ebp-1Ch], edi
  '0047C217: call [004010F0h]
  '0047C21D: mov eax, [ebp-18h]
  '0047C220: mov esi, [004011D4h]
  '0047C226: push edi
  '0047C227: push edi
  '0047C228: lea ecx, [ebp-2Ch]
  '0047C22B: push eax
  '0047C22C: push ecx
  '0047C22D: call esi
  '0047C22F: add esp, 00000010h
  '0047C232: push eax
  '0047C233: call [00401048h]
  '0047C239: sub esp, 00000010h
  '0047C23C: mov ecx, 00000008h
  '0047C241: mov edx, esp
  '0047C243: mov [ebp-3Ch], ecx
  '0047C246: mov [ebp-34h], eax
  '0047C249: push edi
  '0047C24A: mov [edx], ecx
  '0047C24C: mov ecx, [ebp-38h]
  '0047C24F: mov edi, [0040136Ch]
  '0047C255: mov [edx+04h], ecx
  '0047C258: mov ecx, [ebp-64h]
  '0047C25B: push ecx
  '0047C25C: mov [edx+08h], eax
  '0047C25F: mov eax, [ebp-30h]
  '0047C262: mov [edx+0Ch], eax
  '0047C265: call edi
  '0047C267: mov ebx, [00401058h]
  '0047C26D: lea edx, [ebp-3Ch]
  '0047C270: lea eax, [ebp-2Ch]
  '0047C273: push edx
  '0047C274: push eax
  '0047C275: push 00000002h
  '0047C277: call ebx
  '0047C279: mov ecx, [ebp-18h]
  '0047C27C: push 00000000h
  '0047C27E: push 00000002h
  '0047C280: lea edx, [ebp-2Ch]
  '0047C283: push ecx
  '0047C284: push edx
  '0047C285: call esi
  '0047C287: add esp, 0000001Ch
  '0047C28A: push eax
  '0047C28B: call [0040115Ch]
  '0047C291: sub esp, 00000010h
  '0047C294: mov [ebp-40h], edx
  '0047C297: mov edx, esp
  '0047C299: mov ecx, 00000006h
  '0047C29E: mov [ebp-4Ch], ecx
  '0047C2A1: mov [ebp-44h], eax
  '0047C2A4: mov [edx], ecx
  '0047C2A6: mov ecx, [ebp-48h]
  '0047C2A9: push 00000002h
  '0047C2AB: mov [edx+04h], ecx
  '0047C2AE: mov ecx, [ebp-64h]
  '0047C2B1: push ecx
  '0047C2B2: mov [edx+08h], eax
  '0047C2B5: mov eax, [ebp-40h]
  '0047C2B8: mov [edx+0Ch], eax
  '0047C2BB: call edi
  '0047C2BD: lea ecx, [ebp-2Ch]
  '0047C2C0: call [00401034h]
  '0047C2C6: mov edx, [ebp-18h]
  '0047C2C9: push 00000000h
  '0047C2CB: push 00000003h
  '0047C2CD: lea eax, [ebp-2Ch]
  '0047C2D0: push edx
  '0047C2D1: push eax
  '0047C2D2: call esi
  '0047C2D4: add esp, 00000010h
  '0047C2D7: push eax
  '0047C2D8: call [0040110Ch]
  '0047C2DE: mov [ebp-44h], ax
  '0047C2E2: mov eax, 0000000Bh
  '0047C2E7: mov [ebp-4Ch], eax
  '0047C2EA: mov edx, [ebp-48h]
  '0047C2ED: sub esp, 00000010h
  '0047C2F0: mov ecx, esp
  '0047C2F2: push 00000003h
  '0047C2F4: mov [ecx], eax
  '0047C2F6: mov eax, [ebp-44h]
  '0047C2F9: mov [ecx+04h], edx
  '0047C2FC: mov edx, [ebp-40h]
  '0047C2FF: mov [ecx+08h], eax
  '0047C302: mov eax, [ebp-64h]
  '0047C305: push eax
  '0047C306: mov [ecx+0Ch], edx
  '0047C309: call edi
  '0047C30B: lea ecx, [ebp-4Ch]
  '0047C30E: lea edx, [ebp-2Ch]
  '0047C311: push ecx
  '0047C312: push edx
  '0047C313: push 00000002h
  '0047C315: call ebx
  '0047C317: mov eax, [ebp-18h]
  '0047C31A: push 00000000h
  '0047C31C: push 00000004h
  '0047C31E: lea ecx, [ebp-2Ch]
  '0047C321: push eax
  '0047C322: push ecx
  '0047C323: call esi
  '0047C325: add esp, 0000001Ch
  '0047C328: push eax
  '0047C329: call [0040110Ch]
  '0047C32F: sub esp, 00000010h
  '0047C332: mov [ebp-44h], ax
  '0047C336: mov ecx, [ebp-44h]
  '0047C339: mov edx, esp
  '0047C33B: mov eax, 0000000Bh
  '0047C340: push 00000004h
  '0047C342: mov [ebp-4Ch], eax
  '0047C345: mov [edx], eax
  '0047C347: mov eax, [ebp-48h]
  '0047C34A: mov [edx+04h], eax
  '0047C34D: mov eax, [ebp-40h]
  '0047C350: mov [edx+08h], ecx
  '0047C353: mov ecx, [ebp-64h]
  '0047C356: push ecx
  '0047C357: mov [edx+0Ch], eax
  '0047C35A: call edi
  '0047C35C: lea edx, [ebp-4Ch]
  '0047C35F: lea eax, [ebp-2Ch]
  '0047C362: push edx
  '0047C363: push eax
  '0047C364: push 00000002h
  '0047C366: call ebx
  '0047C368: mov ecx, [ebp-18h]
  '0047C36B: push 00000000h
  '0047C36D: push 00000005h
  '0047C36F: lea edx, [ebp-2Ch]
  '0047C372: push ecx
  '0047C373: push edx
  '0047C374: call esi
  '0047C376: add esp, 0000001Ch
  '0047C379: push eax
  '0047C37A: call [0040110Ch]
  '0047C380: mov edx, [ebp-48h]
  '0047C383: sub esp, 00000010h
  '0047C386: mov [ebp-44h], ax
  '0047C38A: mov ecx, esp
  '0047C38C: mov eax, 0000000Bh
  '0047C391: push 00000005h
  '0047C393: mov [ecx], eax
  '0047C395: mov [ebp-4Ch], eax
  '0047C398: mov eax, [ebp-44h]
  '0047C39B: mov [ecx+04h], edx
  '0047C39E: mov edx, [ebp-40h]
  '0047C3A1: mov [ecx+08h], eax
  '0047C3A4: mov eax, [ebp-64h]
  '0047C3A7: push eax
  '0047C3A8: mov [ecx+0Ch], edx
  '0047C3AB: call edi
  '0047C3AD: lea ecx, [ebp-4Ch]
  '0047C3B0: lea edx, [ebp-2Ch]
  '0047C3B3: push ecx
  '0047C3B4: push edx
  '0047C3B5: push 00000002h
  '0047C3B7: call ebx
  '0047C3B9: mov eax, [ebp-18h]
  '0047C3BC: push 00000000h
  '0047C3BE: push 00000006h
  '0047C3C0: lea ecx, [ebp-2Ch]
  '0047C3C3: push eax
  '0047C3C4: push ecx
  '0047C3C5: call esi
  '0047C3C7: add esp, 0000001Ch
  '0047C3CA: push eax
  '0047C3CB: call [0040110Ch]
  '0047C3D1: sub esp, 00000010h
  '0047C3D4: mov [ebp-44h], ax
  '0047C3D8: mov ecx, [ebp-44h]
  '0047C3DB: mov edx, esp
  '0047C3DD: mov eax, 0000000Bh
  '0047C3E2: push 00000006h
  '0047C3E4: mov [ebp-4Ch], eax
  '0047C3E7: mov [edx], eax
  '0047C3E9: mov eax, [ebp-48h]
  '0047C3EC: mov [edx+04h], eax
  '0047C3EF: mov eax, [ebp-40h]
  '0047C3F2: mov [edx+08h], ecx
  '0047C3F5: mov ecx, [ebp-64h]
  '0047C3F8: push ecx
  '0047C3F9: mov [edx+0Ch], eax
  '0047C3FC: call edi
  '0047C3FE: lea edx, [ebp-4Ch]
  '0047C401: lea eax, [ebp-2Ch]
  '0047C404: push edx
  '0047C405: push eax
  '0047C406: push 00000002h
  '0047C408: call ebx
  '0047C40A: add esp, 0000000Ch
  '0047C40D: lea ecx, [ebp-64h]
  '0047C410: push 00000000h
  '0047C412: push ecx
  '0047C413: call [004010FCh]
  '0047C419: sub esp, 00000010h
  '0047C41C: mov esi, [ebp+08h]
  '0047C41F: mov edi, esp
  '0047C421: mov ecx, 00000008h
  '0047C426: mov edx, [esi]
  '0047C428: mov [ebp-4Ch], ecx
  '0047C42B: mov [edi], ecx
  '0047C42D: mov ecx, [ebp-48h]
  '0047C430: mov eax, 00420958h
  '0047C435: push esi
  '0047C436: mov [edi+04h], ecx
  '0047C439: mov [ebp-44h], eax
  '0047C43C: mov [edi+08h], eax
  '0047C43F: mov eax, [ebp-40h]
  '0047C442: mov [edi+0Ch], eax
  '0047C445: call [edx+00000390h]
  '0047C44B: test eax, eax
  '0047C44D: fclex 
  '0047C44F: jnl 47C463h
  '0047C451: push 00000390h
  '0047C456: push 0041FF4Ch
  '0047C45B: push esi
  '0047C45C: push eax
  '0047C45D: call [004010A8h]
  '0047C463: push 0047C498h
  '0047C468: jmp 47C487h
  '0047C46A: lea ecx, [ebp-1Ch]
  '0047C46D: call [00401388h]
  '0047C473: lea ecx, [ebp-3Ch]
  '0047C476: lea edx, [ebp-2Ch]
  '0047C479: push ecx
  '0047C47A: push edx
  '0047C47B: push 00000002h
  '0047C47D: call [00401058h]
  '0047C483: add esp, 0000000Ch
  '0047C486: ret 
End Sub
Private Sub unknown_47C5F0
  '0047C5F0: push ebp
  '0047C5F1: mov ebp, esp
  '0047C5F3: sub esp, 0000000Ch
  '0047C5F6: push 00403796h
  '0047C5FB: mov eax, fs:[00h]
  '0047C601: push eax
  '0047C602: mov fs:[00000000h], esp
  '0047C609: sub esp, 00000014h
  '0047C60C: push ebx
  '0047C60D: push esi
  '0047C60E: push edi
  '0047C60F: mov [ebp-0Ch], esp
  '0047C612: mov [ebp-08h], 00402510h
  '0047C619: xor edi, edi
  '0047C61B: mov [ebp-04h], edi
  '0047C61E: mov esi, [ebp+08h]
  '0047C621: push esi
  '0047C622: mov eax, [esi]
  '0047C624: call [eax+04h]
  '0047C627: mov eax, [esi+10h]
  '0047C62A: lea edx, [ebp-1Ch]
  '0047C62D: mov [ebp-1Ch], edi
  '0047C630: push edx
  '0047C631: mov ecx, [eax]
  '0047C633: push eax
  '0047C634: mov [ebp-18h], edi
  '0047C637: call [ecx+58h]
  '0047C63A: cmp eax, edi
  '0047C63C: fclex 
  '0047C63E: jnl 47C652h
  '0047C640: mov ecx, [esi+10h]
  '0047C643: push 00000058h
  '0047C645: push 0041FF4Ch
  '0047C64A: push ecx
  '0047C64B: push eax
  '0047C64C: call [004010A8h]
  '0047C652: mov edx, [ebp-1Ch]
  '0047C655: mov [ebp-18h], edx
  '0047C658: mov eax, [ebp+08h]
  '0047C65B: push eax
  '0047C65C: mov ecx, [eax]
  '0047C65E: call [ecx+08h]
  '0047C661: mov edx, [ebp+0Ch]
  '0047C664: mov eax, [ebp-18h]
  '0047C667: mov [edx], eax
  '0047C669: mov eax, [ebp-04h]
  '0047C66C: mov ecx, [ebp-14h]
  '0047C66F: pop edi
  '0047C670: pop esi
  '0047C671: mov fs:[00000000h], ecx
  '0047C678: pop ebx
  '0047C679: mov esp, ebp
  '0047C67B: pop ebp
  '0047C67C: retn 0008h
End Sub
Private Sub unknown_47C680
  '0047C680: push ebp
  '0047C681: mov ebp, esp
  '0047C683: sub esp, 0000000Ch
  '0047C686: push 00403796h
  '0047C68B: mov eax, fs:[00h]
  '0047C691: push eax
  '0047C692: mov fs:[00000000h], esp
  '0047C699: sub esp, 00000014h
  '0047C69C: push ebx
  '0047C69D: push esi
  '0047C69E: push edi
  '0047C69F: mov [ebp-0Ch], esp
  '0047C6A2: mov [ebp-08h], 00402518h
  '0047C6A9: xor edi, edi
  '0047C6AB: mov [ebp-04h], edi
  '0047C6AE: mov esi, [ebp+08h]
  '0047C6B1: push esi
  '0047C6B2: mov eax, [esi]
  '0047C6B4: call [eax+04h]
  '0047C6B7: mov eax, [esi+10h]
  '0047C6BA: lea edx, [ebp-1Ch]
  '0047C6BD: mov [ebp-1Ch], edi
  '0047C6C0: push edx
  '0047C6C1: mov ecx, [eax]
  '0047C6C3: push eax
  '0047C6C4: mov [ebp-18h], edi
  '0047C6C7: call [ecx+000000A0h]
  '0047C6CD: cmp eax, edi
  '0047C6CF: fclex 
  '0047C6D1: jnl 47C6E8h
  '0047C6D3: mov ecx, [esi+10h]
  '0047C6D6: push 000000A0h
  '0047C6DB: push 0041FF4Ch
  '0047C6E0: push ecx
  '0047C6E1: push eax
  '0047C6E2: call [004010A8h]
  '0047C6E8: movsx edx, word ptr [ebp-1Ch]
  '0047C6EC: mov [ebp-18h], edx
  '0047C6EF: mov eax, [ebp+08h]
  '0047C6F2: push eax
  '0047C6F3: mov ecx, [eax]
  '0047C6F5: call [ecx+08h]
  '0047C6F8: mov edx, [ebp+0Ch]
  '0047C6FB: mov eax, [ebp-18h]
  '0047C6FE: mov [edx], eax
  '0047C700: mov eax, [ebp-04h]
  '0047C703: mov ecx, [ebp-14h]
  '0047C706: pop edi
  '0047C707: pop esi
  '0047C708: mov fs:[00000000h], ecx
  '0047C70F: pop ebx
  '0047C710: mov esp, ebp
  '0047C712: pop ebp
  '0047C713: retn 0008h
End Sub
Private Sub unknown_47C720
  '0047C720: push ebp
  '0047C721: mov ebp, esp
  '0047C723: sub esp, 0000000Ch
  '0047C726: push 00403796h
  '0047C72B: mov eax, fs:[00h]
  '0047C731: push eax
  '0047C732: mov fs:[00000000h], esp
  '0047C739: sub esp, 0000001Ch
  '0047C73C: push ebx
  '0047C73D: push esi
  '0047C73E: push edi
  '0047C73F: mov [ebp-0Ch], esp
  '0047C742: mov [ebp-08h], 00402520h
  '0047C749: mov [ebp-04h], 00000000h
  '0047C750: mov esi, [ebp+08h]
  '0047C753: push esi
  '0047C754: mov eax, [esi]
  '0047C756: call [eax+04h]
  '0047C759: mov ecx, [esi+10h]
  '0047C75C: mov edi, [ecx]
  '0047C75E: mov ecx, [ebp+0Ch]
  '0047C761: call [0040119Ch]
  '0047C767: mov edx, [esi+10h]
  '0047C76A: push eax
  '0047C76B: push edx
  '0047C76C: call [edi+000000A4h]
  '0047C772: test eax, eax
  '0047C774: fclex 
  '0047C776: jnl 47C78Dh
  '0047C778: mov ecx, [esi+10h]
  '0047C77B: push 000000A4h
  '0047C780: push 0041FF4Ch
  '0047C785: push ecx
  '0047C786: push eax
  '0047C787: call [004010A8h]
  '0047C78D: sub esp, 00000010h
  '0047C790: mov ecx, 00000008h
  '0047C795: mov edi, esp
  '0047C797: mov edx, [esi]
  '0047C799: mov eax, 004209C0h
  '0047C79E: push esi
  '0047C79F: mov [edi], ecx
  '0047C7A1: mov ecx, [ebp-20h]
  '0047C7A4: mov [edi+04h], ecx
  '0047C7A7: mov [edi+08h], eax
  '0047C7AA: mov eax, [ebp-18h]
  '0047C7AD: mov [edi+0Ch], eax
  '0047C7B0: call [edx+00000390h]
  '0047C7B6: test eax, eax
  '0047C7B8: fclex 
  '0047C7BA: jnl 47C7CEh
  '0047C7BC: push 00000390h
  '0047C7C1: push 0041FF4Ch
  '0047C7C6: push esi
  '0047C7C7: push eax
  '0047C7C8: call [004010A8h]
  '0047C7CE: mov eax, [ebp+08h]
  '0047C7D1: push eax
  '0047C7D2: mov ecx, [eax]
  '0047C7D4: call [ecx+08h]
  '0047C7D7: mov eax, [ebp-04h]
  '0047C7DA: mov ecx, [ebp-14h]
  '0047C7DD: pop edi
  '0047C7DE: pop esi
  '0047C7DF: mov fs:[00000000h], ecx
  '0047C7E6: pop ebx
  '0047C7E7: mov esp, ebp
  '0047C7E9: pop ebp
  '0047C7EA: retn 0008h
End Sub
Private Sub unknown_47C7F0
  '0047C7F0: push ebp
  '0047C7F1: mov ebp, esp
  '0047C7F3: sub esp, 0000000Ch
  '0047C7F6: push 00403796h
  '0047C7FB: mov eax, fs:[00h]
  '0047C801: push eax
  '0047C802: mov fs:[00000000h], esp
  '0047C809: sub esp, 00000018h
  '0047C80C: push ebx
  '0047C80D: push esi
  '0047C80E: push edi
  '0047C80F: mov [ebp-0Ch], esp
  '0047C812: mov [ebp-08h], 00402528h
  '0047C819: xor edi, edi
  '0047C81B: mov [ebp-04h], edi
  '0047C81E: mov esi, [ebp+08h]
  '0047C821: push esi
  '0047C822: mov eax, [esi]
  '0047C824: call [eax+04h]
  '0047C827: mov ecx, [ebp+0Ch]
  '0047C82A: mov [ebp-18h], edi
  '0047C82D: mov [ebp-1Ch], edi
  '0047C830: mov [ecx], edi
  '0047C832: mov eax, [esi+10h]
  '0047C835: lea ecx, [ebp-1Ch]
  '0047C838: mov edx, [eax]
  '0047C83A: push ecx
  '0047C83B: push eax
  '0047C83C: call [edx+00000220h]
  '0047C842: cmp eax, edi
  '0047C844: fclex 
  '0047C846: jnl 47C85Dh
  '0047C848: mov edx, [esi+10h]
  '0047C84B: push 00000220h
  '0047C850: push 0041FF4Ch
  '0047C855: push edx
  '0047C856: push eax
  '0047C857: call [004010A8h]
  '0047C85D: mov eax, [ebp-1Ch]
  '0047C860: mov [ebp-1Ch], edi
  '0047C863: push eax
  '0047C864: lea eax, [ebp-18h]
  '0047C867: push eax
  '0047C868: call [004010F0h]
  '0047C86E: push 0047C88Fh
  '0047C873: jmp 47C88Eh
  '0047C875: test byte ptr [ebp-04h], 04h
  '0047C879: jz 47C884h
  '0047C87B: lea ecx, [ebp-18h]
  '0047C87E: call [00401388h]
  '0047C884: lea ecx, [ebp-1Ch]
  '0047C887: call [00401388h]
  '0047C88D: ret 
End Sub
Private Sub unknown_47C8C0
  '0047C8C0: push ebp
  '0047C8C1: mov ebp, esp
  '0047C8C3: sub esp, 0000000Ch
  '0047C8C6: push 00403796h
  '0047C8CB: mov eax, fs:[00h]
  '0047C8D1: push eax
  '0047C8D2: mov fs:[00000000h], esp
  '0047C8D9: sub esp, 00000028h
  '0047C8DC: push ebx
  '0047C8DD: push esi
  '0047C8DE: push edi
  '0047C8DF: mov [ebp-0Ch], esp
  '0047C8E2: mov [ebp-08h], 00402538h
  '0047C8E9: xor ebx, ebx
  '0047C8EB: mov [ebp-04h], ebx
  '0047C8EE: mov esi, [ebp+08h]
  '0047C8F1: push esi
  '0047C8F2: mov eax, [esi]
  '0047C8F4: call [eax+04h]
  '0047C8F7: mov ecx, [ebp+0Ch]
  '0047C8FA: mov edi, [004010FCh]
  '0047C900: lea edx, [ebp-18h]
  '0047C903: push ecx
  '0047C904: push edx
  '0047C905: mov [ebp-18h], ebx
  '0047C908: mov [ebp-1Ch], ebx
  '0047C90B: call edi
  '0047C90D: mov eax, [esi+10h]
  '0047C910: mov ecx, [ebp-18h]
  '0047C913: push ecx
  '0047C914: mov edx, [eax]
  '0047C916: lea eax, [ebp-1Ch]
  '0047C919: push eax
  '0047C91A: mov [ebp-3Ch], edx
  '0047C91D: call edi
  '0047C91F: mov ecx, [esi+10h]
  '0047C922: mov edx, [ebp-3Ch]
  '0047C925: push eax
  '0047C926: push ecx
  '0047C927: call [edx+00000224h]
  '0047C92D: cmp eax, ebx
  '0047C92F: fclex 
  '0047C931: jnl 47C948h
  '0047C933: mov ecx, [esi+10h]
  '0047C936: push 00000224h
  '0047C93B: push 0041FF4Ch
  '0047C940: push ecx
  '0047C941: push eax
  '0047C942: call [004010A8h]
  '0047C948: lea ecx, [ebp-1Ch]
  '0047C94B: call [00401388h]
  '0047C951: sub esp, 00000010h
  '0047C954: mov ecx, 00000008h
  '0047C959: mov edi, esp
  '0047C95B: mov edx, [esi]
  '0047C95D: mov eax, 00420994h
  '0047C962: push esi
  '0047C963: mov [edi], ecx
  '0047C965: mov ecx, [ebp-28h]
  '0047C968: mov [edi+04h], ecx
  '0047C96B: mov [edi+08h], eax
  '0047C96E: mov eax, [ebp-20h]
  '0047C971: mov [edi+0Ch], eax
  '0047C974: call [edx+00000390h]
  '0047C97A: cmp eax, ebx
  '0047C97C: fclex 
  '0047C97E: jnl 47C992h
  '0047C980: push 00000390h
  '0047C985: push 0041FF4Ch
  '0047C98A: push esi
  '0047C98B: push eax
  '0047C98C: call [004010A8h]
  '0047C992: push 0047C9ADh
  '0047C997: jmp 47C9A3h
  '0047C999: lea ecx, [ebp-1Ch]
  '0047C99C: call [00401388h]
  '0047C9A2: ret 
End Sub
Private Sub unknown_47C9D0
  '0047C9D0: push ebp
  '0047C9D1: mov ebp, esp
  '0047C9D3: sub esp, 0000000Ch
  '0047C9D6: push 00403796h
  '0047C9DB: mov eax, fs:[00h]
  '0047C9E1: push eax
  '0047C9E2: mov fs:[00000000h], esp
  '0047C9E9: sub esp, 0000000Ch
  '0047C9EC: push ebx
  '0047C9ED: push esi
  '0047C9EE: push edi
  '0047C9EF: mov [ebp-0Ch], esp
  '0047C9F2: mov [ebp-08h], 00402548h
  '0047C9F9: xor edi, edi
  '0047C9FB: mov [ebp-04h], edi
  '0047C9FE: mov esi, [ebp+08h]
  '0047CA01: push esi
  '0047CA02: mov eax, [esi]
  '0047CA04: call [eax+04h]
  '0047CA07: mov cx, [esi+00000100h]
  '0047CA0E: mov [ebp-18h], edi
  '0047CA11: mov [ebp-18h], ecx
  '0047CA14: mov eax, [ebp+08h]
  '0047CA17: push eax
  '0047CA18: mov edx, [eax]
  '0047CA1A: call [edx+08h]
  '0047CA1D: mov eax, [ebp+0Ch]
  '0047CA20: mov cx, [ebp-18h]
  '0047CA24: mov [eax], cx
  '0047CA27: mov eax, [ebp-04h]
  '0047CA2A: mov ecx, [ebp-14h]
  '0047CA2D: pop edi
  '0047CA2E: pop esi
  '0047CA2F: mov fs:[00000000h], ecx
  '0047CA36: pop ebx
  '0047CA37: mov esp, ebp
  '0047CA39: pop ebp
  '0047CA3A: retn 0008h
End Sub
Private Sub unknown_47CA40
  '0047CA40: push ebp
  '0047CA41: mov ebp, esp
  '0047CA43: sub esp, 0000000Ch
  '0047CA46: push 00403796h
  '0047CA4B: mov eax, fs:[00h]
  '0047CA51: push eax
  '0047CA52: mov fs:[00000000h], esp
  '0047CA59: sub esp, 0000001Ch
  '0047CA5C: push ebx
  '0047CA5D: push esi
  '0047CA5E: push edi
  '0047CA5F: mov [ebp-0Ch], esp
  '0047CA62: mov [ebp-08h], 00402550h
  '0047CA69: mov [ebp-04h], 00000000h
  '0047CA70: mov esi, [ebp+08h]
  '0047CA73: push esi
  '0047CA74: mov eax, [esi]
  '0047CA76: call [eax+04h]
  '0047CA79: mov cx, [ebp+0Ch]
  '0047CA7D: sub esp, 00000010h
  '0047CA80: mov [esi+00000100h], cx
  '0047CA87: mov edi, esp
  '0047CA89: mov ecx, 00000008h
  '0047CA8E: mov edx, [esi]
  '0047CA90: mov [edi], ecx
  '0047CA92: mov ecx, [ebp-20h]
  '0047CA95: mov eax, 00420824h
  '0047CA9A: push esi
  '0047CA9B: mov [edi+04h], ecx
  '0047CA9E: mov [edi+08h], eax
  '0047CAA1: mov eax, [ebp-18h]
  '0047CAA4: mov [edi+0Ch], eax
  '0047CAA7: call [edx+00000390h]
  '0047CAAD: test eax, eax
  '0047CAAF: fclex 
  '0047CAB1: jnl 47CAC5h
  '0047CAB3: push 00000390h
  '0047CAB8: push 0041FF4Ch
  '0047CABD: push esi
  '0047CABE: push eax
  '0047CABF: call [004010A8h]
  '0047CAC5: mov ecx, [esi]
  '0047CAC7: push esi
  '0047CAC8: call [ecx+000007A4h]
  '0047CACE: test eax, eax
  '0047CAD0: jnl 47CAE4h
  '0047CAD2: push 000007A4h
  '0047CAD7: push 0041FF7Ch
  '0047CADC: push esi
  '0047CADD: push eax
  '0047CADE: call [004010A8h]
  '0047CAE4: mov eax, [ebp+08h]
  '0047CAE7: push eax
  '0047CAE8: mov edx, [eax]
  '0047CAEA: call [edx+08h]
  '0047CAED: mov eax, [ebp-04h]
  '0047CAF0: mov ecx, [ebp-14h]
  '0047CAF3: pop edi
  '0047CAF4: pop esi
  '0047CAF5: mov fs:[00000000h], ecx
  '0047CAFC: pop ebx
  '0047CAFD: mov esp, ebp
  '0047CAFF: pop ebp
  '0047CB00: retn 0008h
End Sub
Private Sub unknown_47E650
  '0047E650: push ebp
  '0047E651: mov ebp, esp
  '0047E653: sub esp, 0000000Ch
  '0047E656: push 00403796h
  '0047E65B: mov eax, fs:[00h]
  '0047E661: push eax
  '0047E662: mov fs:[00000000h], esp
  '0047E669: sub esp, 0000005Ch
  '0047E66C: push ebx
  '0047E66D: push esi
  '0047E66E: push edi
  '0047E66F: mov [ebp-0Ch], esp
  '0047E672: mov [ebp-08h], 00402598h
  '0047E679: xor ebx, ebx
  '0047E67B: mov [ebp-04h], ebx
  '0047E67E: mov esi, [ebp+08h]
  '0047E681: push esi
  '0047E682: mov eax, [esi]
  '0047E684: call [eax+04h]
  '0047E687: lea ecx, [ebp-4Ch]
  '0047E68A: push 00000007h
  '0047E68C: lea edx, [ebp-2Ch]
  '0047E68F: lea edi, [esi+000000FCh]
  '0047E695: push ecx
  '0047E696: mov [ebp-4Ch], ebx
  '0047E699: push edx
  '0047E69A: mov [ebp-18h], ebx
  '0047E69D: mov [ebp-1Ch], ebx
  '0047E6A0: mov [ebp-2Ch], ebx
  '0047E6A3: mov [ebp-3Ch], ebx
  '0047E6A6: mov [ebp-5Ch], ebx
  '0047E6A9: mov [ebp-44h], edi
  '0047E6AC: mov [ebp-4Ch], 00004008h
  '0047E6B3: call [00401330h]
  '0047E6B9: lea eax, [ebp-2Ch]
  '0047E6BC: lea ecx, [ebp-5Ch]
  '0047E6BF: push eax
  '0047E6C0: push ecx
  '0047E6C1: mov [ebp-54h], 00414C8Ch
  '0047E6C8: mov [ebp-5Ch], 00008008h
  '0047E6CF: call [00401194h]
  '0047E6D5: lea ecx, [ebp-2Ch]
  '0047E6D8: mov [ebp-60h], ax
  '0047E6DC: call [00401034h]
  '0047E6E2: cmp [ebp-60h], bx
  '0047E6E6: jz 47E752h
  '0047E6E8: mov eax, [esi+10h]
  '0047E6EB: lea ecx, [ebp-18h]
  '0047E6EE: push ecx
  '0047E6EF: push eax
  '0047E6F0: mov edx, [eax]
  '0047E6F2: call [edx+00000198h]
  '0047E6F8: cmp eax, ebx
  '0047E6FA: fclex 
  '0047E6FC: jnl 47E713h
  '0047E6FE: mov edx, [esi+10h]
  '0047E701: push 00000198h
  '0047E706: push 0041FF4Ch
  '0047E70B: push edx
  '0047E70C: push eax
  '0047E70D: call [004010A8h]
  '0047E713: mov eax, [ebp-18h]
  '0047E716: push 00413F90h
  '0047E71B: push eax
  '0047E71C: call [00401340h]
  '0047E722: lea ecx, [ebp-1Ch]
  '0047E725: push eax
  '0047E726: push ecx
  '0047E727: call [004010F0h]
  '0047E72D: mov eax, [edi]
  '0047E72F: mov edx, [esi]
  '0047E731: lea ecx, [ebp-1Ch]
  '0047E734: push eax
  '0047E735: push ecx
  '0047E736: push esi
  '0047E737: call [edx+000008F4h]
  '0047E73D: lea edx, [ebp-1Ch]
  '0047E740: lea eax, [ebp-18h]
  '0047E743: push edx
  '0047E744: push eax
  '0047E745: push 00000002h
  '0047E747: call [0040106Ch]
  '0047E74D: add esp, 0000000Ch
  '0047E750: jmp 47E7C5h
  '0047E752: mov ecx, [edi]
  '0047E754: push ecx
  '0047E755: push 0040FE84h
  '0047E75A: call [00401184h]
  '0047E760: test eax, eax
  '0047E762: jz 47E7C5h
  '0047E764: mov eax, [esi+10h]
  '0047E767: lea ecx, [ebp-18h]
  '0047E76A: push ecx
  '0047E76B: push eax
  '0047E76C: mov edx, [eax]
  '0047E76E: call [edx+00000330h]
  '0047E774: cmp eax, ebx
  '0047E776: fclex 
  '0047E778: jnl 47E78Fh
  '0047E77A: mov edx, [esi+10h]
  '0047E77D: push 00000330h
  '0047E782: push 0041FF4Ch
  '0047E787: push edx
  '0047E788: push eax
  '0047E789: call [004010A8h]
  '0047E78F: mov eax, [ebp-18h]
  '0047E792: mov edx, [edi]
  '0047E794: push 0040FE84h
  '0047E799: push 0040FE84h
  '0047E79E: mov ecx, [eax]
  '0047E7A0: push edx
  '0047E7A1: push eax
  '0047E7A2: mov esi, eax
  '0047E7A4: call [ecx+24h]
  '0047E7A7: cmp eax, ebx
  '0047E7A9: fclex 
  '0047E7AB: jnl 47E7BCh
  '0047E7AD: push 00000024h
  '0047E7AF: push 00414174h
  '0047E7B4: push esi
  '0047E7B5: push eax
  '0047E7B6: call [004010A8h]
  '0047E7BC: lea ecx, [ebp-18h]
  '0047E7BF: call [00401388h]
  '0047E7C5: push 0047E7F1h
  '0047E7CA: jmp 47E7F0h
  '0047E7CC: lea eax, [ebp-1Ch]
  '0047E7CF: lea ecx, [ebp-18h]
  '0047E7D2: push eax
  '0047E7D3: push ecx
  '0047E7D4: push 00000002h
  '0047E7D6: call [0040106Ch]
  '0047E7DC: lea edx, [ebp-3Ch]
  '0047E7DF: lea eax, [ebp-2Ch]
  '0047E7E2: push edx
  '0047E7E3: push eax
  '0047E7E4: push 00000002h
  '0047E7E6: call [00401058h]
  '0047E7EC: add esp, 00000018h
  '0047E7EF: ret 
End Sub
Private Sub unknown_47E930
  '0047E930: push ebp
  '0047E931: mov ebp, esp
  '0047E933: sub esp, 0000000Ch
  '0047E936: push 00403796h
  '0047E93B: mov eax, fs:[00h]
  '0047E941: push eax
  '0047E942: mov fs:[00000000h], esp
  '0047E949: sub esp, 0000000Ch
  '0047E94C: push ebx
  '0047E94D: push esi
  '0047E94E: push edi
  '0047E94F: mov [ebp-0Ch], esp
  '0047E952: mov [ebp-08h], 004025B8h
  '0047E959: xor edi, edi
  '0047E95B: mov [ebp-04h], edi
  '0047E95E: mov esi, [ebp+08h]
  '0047E961: push esi
  '0047E962: mov eax, [esi]
  '0047E964: call [eax+04h]
  '0047E967: mov ecx, [ebp+0Ch]
  '0047E96A: mov [ebp-18h], edi
  '0047E96D: mov [ecx], edi
  '0047E96F: mov edx, [esi+000000FCh]
  '0047E975: lea ecx, [ebp-18h]
  '0047E978: call [004012C4h]
  '0047E97E: push 0047E990h
  '0047E983: jmp 47E98Fh
  '0047E985: lea ecx, [ebp-18h]
  '0047E988: call [0040138Ch]
  '0047E98E: ret 
End Sub
Private Sub unknown_47E9C0
  '0047E9C0: push ebp
  '0047E9C1: mov ebp, esp
  '0047E9C3: sub esp, 0000000Ch
  '0047E9C6: push 00403796h
  '0047E9CB: mov eax, fs:[00h]
  '0047E9D1: push eax
  '0047E9D2: mov fs:[00000000h], esp
  '0047E9D9: sub esp, 00000020h
  '0047E9DC: push ebx
  '0047E9DD: push esi
  '0047E9DE: push edi
  '0047E9DF: mov [ebp-0Ch], esp
  '0047E9E2: mov [ebp-08h], 004025C8h
  '0047E9E9: xor ebx, ebx
  '0047E9EB: mov [ebp-04h], ebx
  '0047E9EE: mov esi, [ebp+08h]
  '0047E9F1: push esi
  '0047E9F2: mov eax, [esi]
  '0047E9F4: call [eax+04h]
  '0047E9F7: mov edx, [ebp+0Ch]
  '0047E9FA: mov edi, [004012C4h]
  '0047EA00: lea ecx, [ebp-18h]
  '0047EA03: mov [ebp-18h], ebx
  '0047EA06: call edi
  '0047EA08: mov edx, [ebp-18h]
  '0047EA0B: lea ecx, [esi+000000FCh]
  '0047EA11: call edi
  '0047EA13: sub esp, 00000010h
  '0047EA16: mov ecx, 00000008h
  '0047EA1B: mov edi, esp
  '0047EA1D: mov edx, [esi]
  '0047EA1F: mov eax, 004209E0h
  '0047EA24: push esi
  '0047EA25: mov [edi], ecx
  '0047EA27: mov ecx, [ebp-24h]
  '0047EA2A: mov [edi+04h], ecx
  '0047EA2D: mov [edi+08h], eax
  '0047EA30: mov eax, [ebp-1Ch]
  '0047EA33: mov [edi+0Ch], eax
  '0047EA36: call [edx+00000390h]
  '0047EA3C: cmp eax, ebx
  '0047EA3E: fclex 
  '0047EA40: jnl 47EA54h
  '0047EA42: push 00000390h
  '0047EA47: push 0041FF4Ch
  '0047EA4C: push esi
  '0047EA4D: push eax
  '0047EA4E: call [004010A8h]
  '0047EA54: push 0047EA63h
  '0047EA59: lea ecx, [ebp-18h]
  '0047EA5C: call [0040138Ch]
  '0047EA62: ret 
End Sub
Private Sub unknown_47EA90
  '0047EA90: push ebp
  '0047EA91: mov ebp, esp
  '0047EA93: sub esp, 0000000Ch
  '0047EA96: push 00403796h
  '0047EA9B: mov eax, fs:[00h]
  '0047EAA1: push eax
  '0047EAA2: mov fs:[00000000h], esp
  '0047EAA9: sub esp, 0000000Ch
  '0047EAAC: push ebx
  '0047EAAD: push esi
  '0047EAAE: push edi
  '0047EAAF: mov [ebp-0Ch], esp
  '0047EAB2: mov [ebp-08h], 004025D8h
  '0047EAB9: xor edi, edi
  '0047EABB: mov [ebp-04h], edi
  '0047EABE: mov esi, [ebp+08h]
  '0047EAC1: push esi
  '0047EAC2: mov eax, [esi]
  '0047EAC4: call [eax+04h]
  '0047EAC7: mov ecx, [ebp+0Ch]
  '0047EACA: mov [ebp-18h], edi
  '0047EACD: mov [ecx], edi
  '0047EACF: mov edx, [esi+000000B8h]
  '0047EAD5: lea ecx, [ebp-18h]
  '0047EAD8: call [004012C4h]
  '0047EADE: push 0047EAF0h
  '0047EAE3: jmp 47EAEFh
  '0047EAE5: lea ecx, [ebp-18h]
  '0047EAE8: call [0040138Ch]
  '0047EAEE: ret 
End Sub
Private Sub unknown_47EB20
  '0047EB20: push ebp
  '0047EB21: mov ebp, esp
  '0047EB23: sub esp, 0000000Ch
  '0047EB26: push 00403796h
  '0047EB2B: mov eax, fs:[00h]
  '0047EB31: push eax
  '0047EB32: mov fs:[00000000h], esp
  '0047EB39: sub esp, 00000020h
  '0047EB3C: push ebx
  '0047EB3D: push esi
  '0047EB3E: push edi
  '0047EB3F: mov [ebp-0Ch], esp
  '0047EB42: mov [ebp-08h], 004025E8h
  '0047EB49: xor ebx, ebx
  '0047EB4B: mov [ebp-04h], ebx
  '0047EB4E: mov esi, [ebp+08h]
  '0047EB51: push esi
  '0047EB52: mov eax, [esi]
  '0047EB54: call [eax+04h]
  '0047EB57: mov edx, [ebp+0Ch]
  '0047EB5A: mov edi, [004012C4h]
  '0047EB60: lea ecx, [ebp-18h]
  '0047EB63: mov [ebp-18h], ebx
  '0047EB66: call edi
  '0047EB68: mov edx, [ebp-18h]
  '0047EB6B: lea ecx, [esi+000000B8h]
  '0047EB71: call edi
  '0047EB73: sub esp, 00000010h
  '0047EB76: mov ecx, 00000008h
  '0047EB7B: mov edi, esp
  '0047EB7D: mov edx, [esi]
  '0047EB7F: mov eax, 00420844h
  '0047EB84: push esi
  '0047EB85: mov [edi], ecx
  '0047EB87: mov ecx, [ebp-24h]
  '0047EB8A: mov [edi+04h], ecx
  '0047EB8D: mov [edi+08h], eax
  '0047EB90: mov eax, [ebp-1Ch]
  '0047EB93: mov [edi+0Ch], eax
  '0047EB96: call [edx+00000390h]
  '0047EB9C: cmp eax, ebx
  '0047EB9E: fclex 
  '0047EBA0: jnl 47EBB4h
  '0047EBA2: push 00000390h
  '0047EBA7: push 0041FF4Ch
  '0047EBAC: push esi
  '0047EBAD: push eax
  '0047EBAE: call [004010A8h]
  '0047EBB4: mov ecx, [esi]
  '0047EBB6: push esi
  '0047EBB7: call [ecx+00000934h]
  '0047EBBD: mov edx, [esi]
  '0047EBBF: push esi
  '0047EBC0: call [edx+000007A4h]
  '0047EBC6: cmp eax, ebx
  '0047EBC8: jnl 47EBDCh
  '0047EBCA: push 000007A4h
  '0047EBCF: push 0041FF7Ch
  '0047EBD4: push esi
  '0047EBD5: push eax
  '0047EBD6: call [004010A8h]
  '0047EBDC: push 0047EBEBh
  '0047EBE1: lea ecx, [ebp-18h]
  '0047EBE4: call [0040138Ch]
  '0047EBEA: ret 
End Sub
Private Sub unknown_47EC10
  '0047EC10: push ebp
  '0047EC11: mov ebp, esp
  '0047EC13: sub esp, 0000000Ch
  '0047EC16: push 00403796h
  '0047EC1B: mov eax, fs:[00h]
  '0047EC21: push eax
  '0047EC22: mov fs:[00000000h], esp
  '0047EC29: sub esp, 0000000Ch
  '0047EC2C: push ebx
  '0047EC2D: push esi
  '0047EC2E: push edi
  '0047EC2F: mov [ebp-0Ch], esp
  '0047EC32: mov [ebp-08h], 004025F8h
  '0047EC39: xor edi, edi
  '0047EC3B: mov [ebp-04h], edi
  '0047EC3E: mov esi, [ebp+08h]
  '0047EC41: push esi
  '0047EC42: mov eax, [esi]
  '0047EC44: call [eax+04h]
  '0047EC47: mov ecx, [esi+000000C0h]
  '0047EC4D: mov [ebp-18h], edi
  '0047EC50: mov [ebp-18h], ecx
  '0047EC53: mov eax, [ebp+08h]
  '0047EC56: push eax
  '0047EC57: mov edx, [eax]
  '0047EC59: call [edx+08h]
  '0047EC5C: mov eax, [ebp+0Ch]
  '0047EC5F: mov ecx, [ebp-18h]
  '0047EC62: mov [eax], ecx
  '0047EC64: mov eax, [ebp-04h]
  '0047EC67: mov ecx, [ebp-14h]
  '0047EC6A: pop edi
  '0047EC6B: pop esi
  '0047EC6C: mov fs:[00000000h], ecx
  '0047EC73: pop ebx
  '0047EC74: mov esp, ebp
  '0047EC76: pop ebp
  '0047EC77: retn 0008h
End Sub
Private Sub unknown_47EC80
  '0047EC80: push ebp
  '0047EC81: mov ebp, esp
  '0047EC83: sub esp, 0000000Ch
  '0047EC86: push 00403796h
  '0047EC8B: mov eax, fs:[00h]
  '0047EC91: push eax
  '0047EC92: mov fs:[00000000h], esp
  '0047EC99: sub esp, 0000001Ch
  '0047EC9C: push ebx
  '0047EC9D: push esi
  '0047EC9E: push edi
  '0047EC9F: mov [ebp-0Ch], esp
  '0047ECA2: mov [ebp-08h], 00402600h
  '0047ECA9: mov [ebp-04h], 00000000h
  '0047ECB0: mov esi, [ebp+08h]
  '0047ECB3: push esi
  '0047ECB4: mov eax, [esi]
  '0047ECB6: call [eax+04h]
  '0047ECB9: mov ecx, [ebp+0Ch]
  '0047ECBC: sub esp, 00000010h
  '0047ECBF: mov [esi+000000C0h], ecx
  '0047ECC5: mov edi, esp
  '0047ECC7: mov ecx, 00000008h
  '0047ECCC: mov edx, [esi]
  '0047ECCE: mov [edi], ecx
  '0047ECD0: mov ecx, [ebp-20h]
  '0047ECD3: mov eax, 0042087Ch
  '0047ECD8: push esi
  '0047ECD9: mov [edi+04h], ecx
  '0047ECDC: mov [edi+08h], eax
  '0047ECDF: mov eax, [ebp-18h]
  '0047ECE2: mov [edi+0Ch], eax
  '0047ECE5: call [edx+00000390h]
  '0047ECEB: test eax, eax
  '0047ECED: fclex 
  '0047ECEF: jnl 47ED07h
  '0047ECF1: mov edi, [004010A8h]
  '0047ECF7: push 00000390h
  '0047ECFC: push 0041FF4Ch
  '0047ED01: push esi
  '0047ED02: push eax
  '0047ED03: call edi
  '0047ED05: jmp 47ED0Dh
  '0047ED07: mov edi, [004010A8h]
  '0047ED0D: cmp [esi+000000C0h], 00000003h
  '0047ED14: jnz 47ED33h
  '0047ED16: mov ecx, [esi]
  '0047ED18: push 00000000h
  '0047ED1A: push esi
  '0047ED1B: call [ecx+0000087Ch]
  '0047ED21: test eax, eax
  '0047ED23: jnl 47ED33h
  '0047ED25: push 0000087Ch
  '0047ED2A: push 0041FF7Ch
  '0047ED2F: push esi
  '0047ED30: push eax
  '0047ED31: call edi
  '0047ED33: mov edx, [esi]
  '0047ED35: push esi
  '0047ED36: call [edx+000008B8h]
  '0047ED3C: test eax, eax
  '0047ED3E: jnl 47ED4Eh
  '0047ED40: push 000008B8h
  '0047ED45: push 0041FF7Ch
  '0047ED4A: push esi
  '0047ED4B: push eax
  '0047ED4C: call edi
  '0047ED4E: mov eax, [ebp+08h]
  '0047ED51: push eax
  '0047ED52: mov ecx, [eax]
  '0047ED54: call [ecx+08h]
  '0047ED57: mov eax, [ebp-04h]
  '0047ED5A: mov ecx, [ebp-14h]
  '0047ED5D: pop edi
  '0047ED5E: pop esi
  '0047ED5F: mov fs:[00000000h], ecx
  '0047ED66: pop ebx
  '0047ED67: mov esp, ebp
  '0047ED69: pop ebp
  '0047ED6A: retn 0008h
End Sub
Private Sub unknown_47ED70
  '0047ED70: push ebp
  '0047ED71: mov ebp, esp
  '0047ED73: sub esp, 0000000Ch
  '0047ED76: push 00403796h
  '0047ED7B: mov eax, fs:[00h]
  '0047ED81: push eax
  '0047ED82: mov fs:[00000000h], esp
  '0047ED89: sub esp, 0000000Ch
  '0047ED8C: push ebx
  '0047ED8D: push esi
  '0047ED8E: push edi
  '0047ED8F: mov [ebp-0Ch], esp
  '0047ED92: mov [ebp-08h], 00402608h
  '0047ED99: xor edi, edi
  '0047ED9B: mov [ebp-04h], edi
  '0047ED9E: mov esi, [ebp+08h]
  '0047EDA1: push esi
  '0047EDA2: mov eax, [esi]
  '0047EDA4: call [eax+04h]
  '0047EDA7: mov ecx, [esi+000000BCh]
  '0047EDAD: mov [ebp-18h], edi
  '0047EDB0: mov [ebp-18h], ecx
  '0047EDB3: mov eax, [ebp+08h]
  '0047EDB6: push eax
  '0047EDB7: mov edx, [eax]
  '0047EDB9: call [edx+08h]
  '0047EDBC: mov eax, [ebp+0Ch]
  '0047EDBF: mov ecx, [ebp-18h]
  '0047EDC2: mov [eax], ecx
  '0047EDC4: mov eax, [ebp-04h]
  '0047EDC7: mov ecx, [ebp-14h]
  '0047EDCA: pop edi
  '0047EDCB: pop esi
  '0047EDCC: mov fs:[00000000h], ecx
  '0047EDD3: pop ebx
  '0047EDD4: mov esp, ebp
  '0047EDD6: pop ebp
  '0047EDD7: retn 0008h
End Sub
Private Sub unknown_47EDE0
  '0047EDE0: push ebp
  '0047EDE1: mov ebp, esp
  '0047EDE3: sub esp, 0000000Ch
  '0047EDE6: push 00403796h
  '0047EDEB: mov eax, fs:[00h]
  '0047EDF1: push eax
  '0047EDF2: mov fs:[00000000h], esp
  '0047EDF9: sub esp, 0000001Ch
  '0047EDFC: push ebx
  '0047EDFD: push esi
  '0047EDFE: push edi
  '0047EDFF: mov [ebp-0Ch], esp
  '0047EE02: mov [ebp-08h], 00402610h
  '0047EE09: mov [ebp-04h], 00000000h
  '0047EE10: mov esi, [ebp+08h]
  '0047EE13: push esi
  '0047EE14: mov eax, [esi]
  '0047EE16: call [eax+04h]
  '0047EE19: mov ecx, [ebp+0Ch]
  '0047EE1C: sub esp, 00000010h
  '0047EE1F: mov [esi+000000BCh], ecx
  '0047EE25: mov edi, esp
  '0047EE27: mov ecx, 00000008h
  '0047EE2C: mov edx, [esi]
  '0047EE2E: mov [edi], ecx
  '0047EE30: mov ecx, [ebp-20h]
  '0047EE33: mov eax, 00420858h
  '0047EE38: push esi
  '0047EE39: mov [edi+04h], ecx
  '0047EE3C: mov [edi+08h], eax
  '0047EE3F: mov eax, [ebp-18h]
  '0047EE42: mov [edi+0Ch], eax
  '0047EE45: call [edx+00000390h]
  '0047EE4B: test eax, eax
  '0047EE4D: fclex 
  '0047EE4F: jnl 47EE63h
  '0047EE51: push 00000390h
  '0047EE56: push 0041FF4Ch
  '0047EE5B: push esi
  '0047EE5C: push eax
  '0047EE5D: call [004010A8h]
  '0047EE63: mov ecx, [esi]
  '0047EE65: push esi
  '0047EE66: call [ecx+000007A4h]
  '0047EE6C: test eax, eax
  '0047EE6E: jnl 47EE82h
  '0047EE70: push 000007A4h
  '0047EE75: push 0041FF7Ch
  '0047EE7A: push esi
  '0047EE7B: push eax
  '0047EE7C: call [004010A8h]
  '0047EE82: mov eax, [ebp+08h]
  '0047EE85: push eax
  '0047EE86: mov edx, [eax]
  '0047EE88: call [edx+08h]
  '0047EE8B: mov eax, [ebp-04h]
  '0047EE8E: mov ecx, [ebp-14h]
  '0047EE91: pop edi
  '0047EE92: pop esi
  '0047EE93: mov fs:[00000000h], ecx
  '0047EE9A: pop ebx
  '0047EE9B: mov esp, ebp
  '0047EE9D: pop ebp
  '0047EE9E: retn 0008h
End Sub
Private Sub unknown_47EEB0
  '0047EEB0: push ebp
  '0047EEB1: mov ebp, esp
  '0047EEB3: sub esp, 0000000Ch
  '0047EEB6: push 00403796h
  '0047EEBB: mov eax, fs:[00h]
  '0047EEC1: push eax
  '0047EEC2: mov fs:[00000000h], esp
  '0047EEC9: sub esp, 0000000Ch
  '0047EECC: push ebx
  '0047EECD: push esi
  '0047EECE: push edi
  '0047EECF: mov [ebp-0Ch], esp
  '0047EED2: mov [ebp-08h], 00402618h
  '0047EED9: xor edi, edi
  '0047EEDB: mov [ebp-04h], edi
  '0047EEDE: mov esi, [ebp+08h]
  '0047EEE1: push esi
  '0047EEE2: mov eax, [esi]
  '0047EEE4: call [eax+04h]
  '0047EEE7: mov ecx, [ebp+0Ch]
  '0047EEEA: lea eax, [ebp-18h]
  '0047EEED: mov [ebp-18h], edi
  '0047EEF0: mov [ecx], edi
  '0047EEF2: mov edx, [esi+000000C4h]
  '0047EEF8: push edx
  '0047EEF9: push eax
  '0047EEFA: call [004010FCh]
  '0047EF00: push 0047EF12h
  '0047EF05: jmp 47EF11h
  '0047EF07: lea ecx, [ebp-18h]
  '0047EF0A: call [00401388h]
  '0047EF10: ret 
End Sub
Private Sub unknown_47EF40
  '0047EF40: push ebp
  '0047EF41: mov ebp, esp
  '0047EF43: sub esp, 0000000Ch
  '0047EF46: push 00403796h
  '0047EF4B: mov eax, fs:[00h]
  '0047EF51: push eax
  '0047EF52: mov fs:[00000000h], esp
  '0047EF59: sub esp, 0000006Ch
  '0047EF5C: push ebx
  '0047EF5D: push esi
  '0047EF5E: push edi
  '0047EF5F: mov [ebp-0Ch], esp
  '0047EF62: mov [ebp-08h], 00402628h
  '0047EF69: xor edi, edi
  '0047EF6B: mov [ebp-04h], edi
  '0047EF6E: mov esi, [ebp+08h]
  '0047EF71: push esi
  '0047EF72: mov eax, [esi]
  '0047EF74: call [eax+04h]
  '0047EF77: mov ecx, [ebp+0Ch]
  '0047EF7A: mov ebx, [004010FCh]
  '0047EF80: lea edx, [ebp-18h]
  '0047EF83: push ecx
  '0047EF84: push edx
  '0047EF85: mov [ebp-18h], edi
  '0047EF88: mov [ebp-28h], edi
  '0047EF8B: mov [ebp-48h], edi
  '0047EF8E: mov [ebp-4Ch], edi
  '0047EF91: mov [ebp-50h], edi
  '0047EF94: call ebx
  '0047EF96: mov eax, [ebp-18h]
  '0047EF99: lea edi, [esi+000000C4h]
  '0047EF9F: push eax
  '0047EFA0: push edi
  '0047EFA1: call ebx
  '0047EFA3: mov ecx, [ebp-18h]
  '0047EFA6: lea edx, [esi+000000B0h]
  '0047EFAC: push ecx
  '0047EFAD: push edx
  '0047EFAE: call ebx
  '0047EFB0: mov eax, [edi]
  '0047EFB2: push 00000000h
  '0047EFB4: push eax
  '0047EFB5: call [004011FCh]
  '0047EFBB: test ax, ax
  '0047EFBE: jz 47EFD9h
  '0047EFC0: mov edi, [ebp-34h]
  '0047EFC3: mov eax, 00000020h
  '0047EFC8: mov [esi+000000A8h], eax
  '0047EFCE: mov [esi+000000ACh], eax
  '0047EFD4: jmp 0047F19Ch
  '0047EFD9: mov ecx, [edi]
  '0047EFDB: push 00000000h
  '0047EFDD: push 00000004h
  '0047EFDF: lea edx, [ebp-28h]
  '0047EFE2: push ecx
  '0047EFE3: push edx
  '0047EFE4: call [004011D4h]
  '0047EFEA: mov eax, [esi+10h]
  '0047EFED: add esp, 00000010h
  '0047EFF0: lea edx, [ebp-4Ch]
  '0047EFF3: mov ecx, [eax]
  '0047EFF5: push edx
  '0047EFF6: push eax
  '0047EFF7: call [ecx+00000110h]
  '0047EFFD: test eax, eax
  '0047EFFF: fclex 
  '0047F001: jnl 47F018h
  '0047F003: mov ecx, [esi+10h]
  '0047F006: push 00000110h
  '0047F00B: push 0041FF4Ch
  '0047F010: push ecx
  '0047F011: push eax
  '0047F012: call [004010A8h]
  '0047F018: mov edi, [esi+10h]
  '0047F01B: mov dx, [ebp-4Ch]
  '0047F01F: mov eax, 00000002h
  '0047F024: mov [ebp-40h], dx
  '0047F028: mov ebx, [edi]
  '0047F02A: lea edi, [ebp-50h]
  '0047F02D: push edi
  '0047F02E: mov edx, eax
  '0047F030: sub esp, 00000010h
  '0047F033: mov ecx, 00000008h
  '0047F038: mov edi, esp
  '0047F03A: sub esp, 00000010h
  '0047F03D: mov [edi], eax
  '0047F03F: mov eax, [ebp-44h]
  '0047F042: mov [edi+04h], eax
  '0047F045: mov eax, [ebp-40h]
  '0047F048: mov [edi+08h], eax
  '0047F04B: mov eax, [ebp-3Ch]
  '0047F04E: mov [edi+0Ch], eax
  '0047F051: mov edi, [ebp-34h]
  '0047F054: mov eax, esp
  '0047F056: mov [eax], edx
  '0047F058: lea edx, [ebp-28h]
  '0047F05B: push edx
  '0047F05C: mov [eax+04h], edi
  '0047F05F: mov [eax+08h], ecx
  '0047F062: mov ecx, [ebp-2Ch]
  '0047F065: mov [eax+0Ch], ecx
  '0047F068: call [004012ECh]
  '0047F06E: mov [ebp-64h], eax
  '0047F071: mov ecx, [esi+10h]
  '0047F074: fild dword ptr [ebp-64h]
  '0047F077: fstp real4 ptr [ebp-68h]
  '0047F07A: mov eax, [ebp-68h]
  '0047F07D: push eax
  '0047F07E: push ecx
  '0047F07F: call [ebx+00000374h]
  '0047F085: test eax, eax
  '0047F087: fclex 
  '0047F089: jnl 47F0A0h
  '0047F08B: mov edx, [esi+10h]
  '0047F08E: push 00000374h
  '0047F093: push 0041FF4Ch
  '0047F098: push edx
  '0047F099: push eax
  '0047F09A: call [004010A8h]
  '0047F0A0: fld real4 ptr [ebp-50h]
  '0047F0A3: call [00401320h]
  '0047F0A9: lea ecx, [ebp-28h]
  '0047F0AC: mov [esi+000000A8h], eax
  '0047F0B2: call [00401034h]
  '0047F0B8: mov eax, [esi+000000C4h]
  '0047F0BE: push 00000000h
  '0047F0C0: push 00000005h
  '0047F0C2: lea ecx, [ebp-28h]
  '0047F0C5: push eax
  '0047F0C6: push ecx
  '0047F0C7: call [004011D4h]
  '0047F0CD: mov eax, [esi+10h]
  '0047F0D0: add esp, 00000010h
  '0047F0D3: lea ecx, [ebp-4Ch]
  '0047F0D6: mov edx, [eax]
  '0047F0D8: push ecx
  '0047F0D9: push eax
  '0047F0DA: call [edx+00000110h]
  '0047F0E0: test eax, eax
  '0047F0E2: fclex 
  '0047F0E4: jnl 47F0FBh
  '0047F0E6: mov edx, [esi+10h]
  '0047F0E9: push 00000110h
  '0047F0EE: push 0041FF4Ch
  '0047F0F3: push edx
  '0047F0F4: push eax
  '0047F0F5: call [004010A8h]
  '0047F0FB: mov edx, [esi+10h]
  '0047F0FE: mov ax, [ebp-4Ch]
  '0047F102: mov [ebp-40h], ax
  '0047F106: mov eax, 00000002h
  '0047F10B: mov ebx, [edx]
  '0047F10D: lea edx, [ebp-50h]
  '0047F110: push edx
  '0047F111: mov [ebp-38h], eax
  '0047F114: sub esp, 00000010h
  '0047F117: mov ecx, 00000008h
  '0047F11C: mov edx, esp
  '0047F11E: sub esp, 00000010h
  '0047F121: mov [edx], eax
  '0047F123: mov eax, [ebp-44h]
  '0047F126: mov [edx+04h], eax
  '0047F129: mov eax, [ebp-40h]
  '0047F12C: mov [edx+08h], eax
  '0047F12F: mov eax, [ebp-3Ch]
  '0047F132: mov [edx+0Ch], eax
  '0047F135: mov eax, [ebp-38h]
  '0047F138: mov edx, esp
  '0047F13A: mov [edx], eax
  '0047F13C: mov [edx+04h], edi
  '0047F13F: mov [edx+08h], ecx
  '0047F142: mov ecx, [ebp-2Ch]
  '0047F145: mov [edx+0Ch], ecx
  '0047F148: lea edx, [ebp-28h]
  '0047F14B: push edx
  '0047F14C: call [004012ECh]
  '0047F152: mov [ebp-6Ch], eax
  '0047F155: mov ecx, [esi+10h]
  '0047F158: fild dword ptr [ebp-6Ch]
  '0047F15B: fstp real4 ptr [ebp-70h]
  '0047F15E: mov eax, [ebp-70h]
  '0047F161: push eax
  '0047F162: push ecx
  '0047F163: call [ebx+00000378h]
  '0047F169: test eax, eax
  '0047F16B: fclex 
  '0047F16D: jnl 47F184h
  '0047F16F: mov edx, [esi+10h]
  '0047F172: push 00000378h
  '0047F177: push 0041FF4Ch
  '0047F17C: push edx
  '0047F17D: push eax
  '0047F17E: call [004010A8h]
  '0047F184: fld real4 ptr [ebp-50h]
  '0047F187: call [00401320h]
  '0047F18D: lea ecx, [ebp-28h]
  '0047F190: mov [esi+000000ACh], eax
  '0047F196: call [00401034h]
  '0047F19C: sub esp, 00000010h
  '0047F19F: mov ecx, 00000008h
  '0047F1A4: mov ebx, esp
  '0047F1A6: mov edx, [esi]
  '0047F1A8: mov eax, 00420898h
  '0047F1AD: push esi
  '0047F1AE: mov [ebx], ecx
  '0047F1B0: mov [ebx+04h], edi
  '0047F1B3: mov [ebx+08h], eax
  '0047F1B6: mov eax, [ebp-2Ch]
  '0047F1B9: mov [ebx+0Ch], eax
  '0047F1BC: call [edx+00000390h]
  '0047F1C2: test eax, eax
  '0047F1C4: fclex 
  '0047F1C6: jnl 47F1DAh
  '0047F1C8: push 00000390h
  '0047F1CD: push 0041FF4Ch
  '0047F1D2: push esi
  '0047F1D3: push eax
  '0047F1D4: call [004010A8h]
  '0047F1DA: mov eax, [esi+000000D0h]
  '0047F1E0: mov ebx, 00000002h
  '0047F1E5: cmp eax, ebx
  '0047F1E7: jnz 0047F3B2h
  '0047F1ED: mov ecx, [esi+000000C4h]
  '0047F1F3: push 00000000h
  '0047F1F5: push 00000004h
  '0047F1F7: lea edx, [ebp-28h]
  '0047F1FA: push ecx
  '0047F1FB: push edx
  '0047F1FC: call [004011D4h]
  '0047F202: mov eax, [esi+10h]
  '0047F205: add esp, 00000010h
  '0047F208: lea edx, [ebp-4Ch]
  '0047F20B: mov ecx, [eax]
  '0047F20D: push edx
  '0047F20E: push eax
  '0047F20F: call [ecx+00000110h]
  '0047F215: test eax, eax
  '0047F217: fclex 
  '0047F219: jnl 47F230h
  '0047F21B: mov ecx, [esi+10h]
  '0047F21E: push 00000110h
  '0047F223: push 0041FF4Ch
  '0047F228: push ecx
  '0047F229: push eax
  '0047F22A: call [004010A8h]
  '0047F230: mov dx, [ebp-4Ch]
  '0047F234: mov eax, ebx
  '0047F236: mov [ebp-40h], dx
  '0047F23A: mov edx, [esi+10h]
  '0047F23D: mov [ebp-38h], ebx
  '0047F240: mov ecx, 00000008h
  '0047F245: mov ebx, [edx]
  '0047F247: lea edx, [ebp-50h]
  '0047F24A: push edx
  '0047F24B: sub esp, 00000010h
  '0047F24E: mov edx, esp
  '0047F250: sub esp, 00000010h
  '0047F253: mov [edx], eax
  '0047F255: mov eax, [ebp-44h]
  '0047F258: mov [edx+04h], eax
  '0047F25B: mov eax, [ebp-40h]
  '0047F25E: mov [edx+08h], eax
  '0047F261: mov eax, [ebp-3Ch]
  '0047F264: mov [edx+0Ch], eax
  '0047F267: mov eax, [ebp-38h]
  '0047F26A: mov edx, esp
  '0047F26C: mov [edx], eax
  '0047F26E: mov [edx+04h], edi
  '0047F271: mov [edx+08h], ecx
  '0047F274: mov ecx, [ebp-2Ch]
  '0047F277: mov [edx+0Ch], ecx
  '0047F27A: lea edx, [ebp-28h]
  '0047F27D: push edx
  '0047F27E: call [004012ECh]
  '0047F284: mov [ebp-74h], eax
  '0047F287: mov ecx, [esi+10h]
  '0047F28A: fild dword ptr [ebp-74h]
  '0047F28D: fstp real4 ptr [ebp-78h]
  '0047F290: mov eax, [ebp-78h]
  '0047F293: push eax
  '0047F294: push ecx
  '0047F295: call [ebx+00000374h]
  '0047F29B: test eax, eax
  '0047F29D: fclex 
  '0047F29F: jnl 47F2B6h
  '0047F2A1: mov edx, [esi+10h]
  '0047F2A4: push 00000374h
  '0047F2A9: push 0041FF4Ch
  '0047F2AE: push edx
  '0047F2AF: push eax
  '0047F2B0: call [004010A8h]
  '0047F2B6: fld real4 ptr [ebp-50h]
  '0047F2B9: call [00401320h]
  '0047F2BF: lea ecx, [ebp-28h]
  '0047F2C2: mov [esi+000000C8h], eax
  '0047F2C8: call [00401034h]
  '0047F2CE: mov eax, [esi+000000C4h]
  '0047F2D4: push 00000000h
  '0047F2D6: push 00000005h
  '0047F2D8: lea ecx, [ebp-28h]
  '0047F2DB: push eax
  '0047F2DC: push ecx
  '0047F2DD: call [004011D4h]
  '0047F2E3: mov eax, [esi+10h]
  '0047F2E6: add esp, 00000010h
  '0047F2E9: lea ecx, [ebp-4Ch]
  '0047F2EC: mov edx, [eax]
  '0047F2EE: push ecx
  '0047F2EF: push eax
  '0047F2F0: call [edx+00000110h]
  '0047F2F6: test eax, eax
  '0047F2F8: fclex 
  '0047F2FA: jnl 47F311h
  '0047F2FC: mov edx, [esi+10h]
  '0047F2FF: push 00000110h
  '0047F304: push 0041FF4Ch
  '0047F309: push edx
  '0047F30A: push eax
  '0047F30B: call [004010A8h]
  '0047F311: mov edx, [esi+10h]
  '0047F314: mov ax, [ebp-4Ch]
  '0047F318: mov [ebp-40h], ax
  '0047F31C: mov eax, 00000002h
  '0047F321: mov ebx, [edx]
  '0047F323: lea edx, [ebp-50h]
  '0047F326: push edx
  '0047F327: mov [ebp-38h], eax
  '0047F32A: sub esp, 00000010h
  '0047F32D: mov ecx, 00000008h
  '0047F332: mov edx, esp
  '0047F334: sub esp, 00000010h
  '0047F337: mov [edx], eax
  '0047F339: mov eax, [ebp-44h]
  '0047F33C: mov [edx+04h], eax
  '0047F33F: mov eax, [ebp-40h]
  '0047F342: mov [edx+08h], eax
  '0047F345: mov eax, [ebp-3Ch]
  '0047F348: mov [edx+0Ch], eax
  '0047F34B: mov eax, [ebp-38h]
  '0047F34E: mov edx, esp
  '0047F350: mov [edx], eax
  '0047F352: mov [edx+04h], edi
  '0047F355: mov [edx+08h], ecx
  '0047F358: mov ecx, [ebp-2Ch]
  '0047F35B: mov [edx+0Ch], ecx
  '0047F35E: lea edx, [ebp-28h]
  '0047F361: push edx
  '0047F362: call [004012ECh]
  '0047F368: mov [ebp-7Ch], eax
  '0047F36B: mov ecx, [esi+10h]
  '0047F36E: fild dword ptr [ebp-7Ch]
  '0047F371: fstp real4 ptr [ebp-80h]
  '0047F374: mov eax, [ebp-80h]
  '0047F377: push eax
  '0047F378: push ecx
  '0047F379: call [ebx+00000378h]
  '0047F37F: test eax, eax
  '0047F381: fclex 
  '0047F383: jnl 47F39Ah
  '0047F385: mov edx, [esi+10h]
  '0047F388: push 00000378h
  '0047F38D: push 0041FF4Ch
  '0047F392: push edx
  '0047F393: push eax
  '0047F394: call [004010A8h]
  '0047F39A: fld real4 ptr [ebp-50h]
  '0047F39D: call [00401320h]
  '0047F3A3: lea ecx, [ebp-28h]
  '0047F3A6: mov [esi+000000CCh], eax
  '0047F3AC: call [00401034h]
  '0047F3B2: mov eax, [esi]
  '0047F3B4: push esi
  '0047F3B5: call [eax+000007A4h]
  '0047F3BB: test eax, eax
  '0047F3BD: jnl 47F3D1h
  '0047F3BF: push 000007A4h
  '0047F3C4: push 0041FF7Ch
  '0047F3C9: push esi
  '0047F3CA: push eax
  '0047F3CB: call [004010A8h]
  '0047F3D1: wait 
  '0047F3D2: push 0047F3EDh
  '0047F3D7: jmp 47F3E3h
  '0047F3D9: lea ecx, [ebp-28h]
  '0047F3DC: call [00401034h]
  '0047F3E2: ret 
End Sub
Private Sub unknown_47F410
  '0047F410: push ebp
  '0047F411: mov ebp, esp
  '0047F413: sub esp, 0000000Ch
  '0047F416: push 00403796h
  '0047F41B: mov eax, fs:[00h]
  '0047F421: push eax
  '0047F422: mov fs:[00000000h], esp
  '0047F429: sub esp, 0000000Ch
  '0047F42C: push ebx
  '0047F42D: push esi
  '0047F42E: push edi
  '0047F42F: mov [ebp-0Ch], esp
  '0047F432: mov [ebp-08h], 00402638h
  '0047F439: xor edi, edi
  '0047F43B: mov [ebp-04h], edi
  '0047F43E: mov esi, [ebp+08h]
  '0047F441: push esi
  '0047F442: mov eax, [esi]
  '0047F444: call [eax+04h]
  '0047F447: mov ecx, [esi+000000C8h]
  '0047F44D: mov [ebp-18h], edi
  '0047F450: mov [ebp-18h], ecx
  '0047F453: mov eax, [ebp+08h]
  '0047F456: push eax
  '0047F457: mov edx, [eax]
  '0047F459: call [edx+08h]
  '0047F45C: mov eax, [ebp+0Ch]
  '0047F45F: mov ecx, [ebp-18h]
  '0047F462: mov [eax], ecx
  '0047F464: mov eax, [ebp-04h]
  '0047F467: mov ecx, [ebp-14h]
  '0047F46A: pop edi
  '0047F46B: pop esi
  '0047F46C: mov fs:[00000000h], ecx
  '0047F473: pop ebx
  '0047F474: mov esp, ebp
  '0047F476: pop ebp
  '0047F477: retn 0008h
End Sub
Private Sub unknown_47F480
  '0047F480: push ebp
  '0047F481: mov ebp, esp
  '0047F483: sub esp, 0000000Ch
  '0047F486: push 00403796h
  '0047F48B: mov eax, fs:[00h]
  '0047F491: push eax
  '0047F492: mov fs:[00000000h], esp
  '0047F499: sub esp, 0000001Ch
  '0047F49C: push ebx
  '0047F49D: push esi
  '0047F49E: push edi
  '0047F49F: mov [ebp-0Ch], esp
  '0047F4A2: mov [ebp-08h], 00402640h
  '0047F4A9: mov [ebp-04h], 00000000h
  '0047F4B0: mov esi, [ebp+08h]
  '0047F4B3: push esi
  '0047F4B4: mov eax, [esi]
  '0047F4B6: call [eax+04h]
  '0047F4B9: mov ecx, [ebp+0Ch]
  '0047F4BC: sub esp, 00000010h
  '0047F4BF: mov [esi+000000C8h], ecx
  '0047F4C5: mov edi, esp
  '0047F4C7: mov ecx, 00000008h
  '0047F4CC: mov edx, [esi]
  '0047F4CE: mov [edi], ecx
  '0047F4D0: mov ecx, [ebp-20h]
  '0047F4D3: mov eax, 004208ACh
  '0047F4D8: push esi
  '0047F4D9: mov [edi+04h], ecx
  '0047F4DC: mov [edi+08h], eax
  '0047F4DF: mov eax, [ebp-18h]
  '0047F4E2: mov [edi+0Ch], eax
  '0047F4E5: call [edx+00000390h]
  '0047F4EB: test eax, eax
  '0047F4ED: fclex 
  '0047F4EF: jnl 47F503h
  '0047F4F1: push 00000390h
  '0047F4F6: push 0041FF4Ch
  '0047F4FB: push esi
  '0047F4FC: push eax
  '0047F4FD: call [004010A8h]
  '0047F503: mov ecx, [esi]
  '0047F505: push esi
  '0047F506: call [ecx+000007A4h]
  '0047F50C: test eax, eax
  '0047F50E: jnl 47F522h
  '0047F510: push 000007A4h
  '0047F515: push 0041FF7Ch
  '0047F51A: push esi
  '0047F51B: push eax
  '0047F51C: call [004010A8h]
  '0047F522: mov eax, [ebp+08h]
  '0047F525: push eax
  '0047F526: mov edx, [eax]
  '0047F528: call [edx+08h]
  '0047F52B: mov eax, [ebp-04h]
  '0047F52E: mov ecx, [ebp-14h]
  '0047F531: pop edi
  '0047F532: pop esi
  '0047F533: mov fs:[00000000h], ecx
  '0047F53A: pop ebx
  '0047F53B: mov esp, ebp
  '0047F53D: pop ebp
  '0047F53E: retn 0008h
End Sub
Private Sub unknown_47F550
  '0047F550: push ebp
  '0047F551: mov ebp, esp
  '0047F553: sub esp, 0000000Ch
  '0047F556: push 00403796h
  '0047F55B: mov eax, fs:[00h]
  '0047F561: push eax
  '0047F562: mov fs:[00000000h], esp
  '0047F569: sub esp, 0000000Ch
  '0047F56C: push ebx
  '0047F56D: push esi
  '0047F56E: push edi
  '0047F56F: mov [ebp-0Ch], esp
  '0047F572: mov [ebp-08h], 00402648h
  '0047F579: xor edi, edi
  '0047F57B: mov [ebp-04h], edi
  '0047F57E: mov esi, [ebp+08h]
  '0047F581: push esi
  '0047F582: mov eax, [esi]
  '0047F584: call [eax+04h]
  '0047F587: mov ecx, [esi+000000CCh]
  '0047F58D: mov [ebp-18h], edi
  '0047F590: mov [ebp-18h], ecx
  '0047F593: mov eax, [ebp+08h]
  '0047F596: push eax
  '0047F597: mov edx, [eax]
  '0047F599: call [edx+08h]
  '0047F59C: mov eax, [ebp+0Ch]
  '0047F59F: mov ecx, [ebp-18h]
  '0047F5A2: mov [eax], ecx
  '0047F5A4: mov eax, [ebp-04h]
  '0047F5A7: mov ecx, [ebp-14h]
  '0047F5AA: pop edi
  '0047F5AB: pop esi
  '0047F5AC: mov fs:[00000000h], ecx
  '0047F5B3: pop ebx
  '0047F5B4: mov esp, ebp
  '0047F5B6: pop ebp
  '0047F5B7: retn 0008h
End Sub
Private Sub unknown_47F5C0
  '0047F5C0: push ebp
  '0047F5C1: mov ebp, esp
  '0047F5C3: sub esp, 0000000Ch
  '0047F5C6: push 00403796h
  '0047F5CB: mov eax, fs:[00h]
  '0047F5D1: push eax
  '0047F5D2: mov fs:[00000000h], esp
  '0047F5D9: sub esp, 0000001Ch
  '0047F5DC: push ebx
  '0047F5DD: push esi
  '0047F5DE: push edi
  '0047F5DF: mov [ebp-0Ch], esp
  '0047F5E2: mov [ebp-08h], 00402650h
  '0047F5E9: mov [ebp-04h], 00000000h
  '0047F5F0: mov esi, [ebp+08h]
  '0047F5F3: push esi
  '0047F5F4: mov eax, [esi]
  '0047F5F6: call [eax+04h]
  '0047F5F9: mov ecx, [ebp+0Ch]
  '0047F5FC: sub esp, 00000010h
  '0047F5FF: mov [esi+000000CCh], ecx
  '0047F605: mov edi, esp
  '0047F607: mov ecx, 00000008h
  '0047F60C: mov edx, [esi]
  '0047F60E: mov [edi], ecx
  '0047F610: mov ecx, [ebp-20h]
  '0047F613: mov eax, 004208CCh
  '0047F618: push esi
  '0047F619: mov [edi+04h], ecx
  '0047F61C: mov [edi+08h], eax
  '0047F61F: mov eax, [ebp-18h]
  '0047F622: mov [edi+0Ch], eax
  '0047F625: call [edx+00000390h]
  '0047F62B: test eax, eax
  '0047F62D: fclex 
  '0047F62F: jnl 47F643h
  '0047F631: push 00000390h
  '0047F636: push 0041FF4Ch
  '0047F63B: push esi
  '0047F63C: push eax
  '0047F63D: call [004010A8h]
  '0047F643: mov ecx, [esi]
  '0047F645: push esi
  '0047F646: call [ecx+000007A4h]
  '0047F64C: test eax, eax
  '0047F64E: jnl 47F662h
  '0047F650: push 000007A4h
  '0047F655: push 0041FF7Ch
  '0047F65A: push esi
  '0047F65B: push eax
  '0047F65C: call [004010A8h]
  '0047F662: mov eax, [ebp+08h]
  '0047F665: push eax
  '0047F666: mov edx, [eax]
  '0047F668: call [edx+08h]
  '0047F66B: mov eax, [ebp-04h]
  '0047F66E: mov ecx, [ebp-14h]
  '0047F671: pop edi
  '0047F672: pop esi
  '0047F673: mov fs:[00000000h], ecx
  '0047F67A: pop ebx
  '0047F67B: mov esp, ebp
  '0047F67D: pop ebp
  '0047F67E: retn 0008h
End Sub
Private Sub unknown_47F690
  '0047F690: push ebp
  '0047F691: mov ebp, esp
  '0047F693: sub esp, 0000000Ch
  '0047F696: push 00403796h
  '0047F69B: mov eax, fs:[00h]
  '0047F6A1: push eax
  '0047F6A2: mov fs:[00000000h], esp
  '0047F6A9: sub esp, 0000000Ch
  '0047F6AC: push ebx
  '0047F6AD: push esi
  '0047F6AE: push edi
  '0047F6AF: mov [ebp-0Ch], esp
  '0047F6B2: mov [ebp-08h], 00402658h
  '0047F6B9: xor edi, edi
  '0047F6BB: mov [ebp-04h], edi
  '0047F6BE: mov esi, [ebp+08h]
  '0047F6C1: push esi
  '0047F6C2: mov eax, [esi]
  '0047F6C4: call [eax+04h]
  '0047F6C7: mov ecx, [esi+000000D0h]
  '0047F6CD: mov [ebp-18h], edi
  '0047F6D0: mov [ebp-18h], ecx
  '0047F6D3: mov eax, [ebp+08h]
  '0047F6D6: push eax
  '0047F6D7: mov edx, [eax]
  '0047F6D9: call [edx+08h]
  '0047F6DC: mov eax, [ebp+0Ch]
  '0047F6DF: mov ecx, [ebp-18h]
  '0047F6E2: mov [eax], ecx
  '0047F6E4: mov eax, [ebp-04h]
  '0047F6E7: mov ecx, [ebp-14h]
  '0047F6EA: pop edi
  '0047F6EB: pop esi
  '0047F6EC: mov fs:[00000000h], ecx
  '0047F6F3: pop ebx
  '0047F6F4: mov esp, ebp
  '0047F6F6: pop ebp
  '0047F6F7: retn 0008h
End Sub
Private Sub unknown_47F700
  '0047F700: push ebp
  '0047F701: mov ebp, esp
  '0047F703: sub esp, 0000000Ch
  '0047F706: push 00403796h
  '0047F70B: mov eax, fs:[00h]
  '0047F711: push eax
  '0047F712: mov fs:[00000000h], esp
  '0047F719: sub esp, 0000001Ch
  '0047F71C: push ebx
  '0047F71D: push esi
  '0047F71E: push edi
  '0047F71F: mov [ebp-0Ch], esp
  '0047F722: mov [ebp-08h], 00402660h
  '0047F729: mov [ebp-04h], 00000000h
  '0047F730: mov esi, [ebp+08h]
  '0047F733: push esi
  '0047F734: mov eax, [esi]
  '0047F736: call [eax+04h]
  '0047F739: sub esp, 00000010h
  '0047F73C: mov ecx, 00000008h
  '0047F741: mov ebx, esp
  '0047F743: mov edi, [ebp+0Ch]
  '0047F746: mov edx, [esi]
  '0047F748: mov eax, 004208ECh
  '0047F74D: mov [ebx], ecx
  '0047F74F: mov ecx, [ebp-20h]
  '0047F752: push esi
  '0047F753: mov [esi+000000D0h], edi
  '0047F759: mov [ebx+04h], ecx
  '0047F75C: mov [ebx+08h], eax
  '0047F75F: mov eax, [ebp-18h]
  '0047F762: mov [ebx+0Ch], eax
  '0047F765: call [edx+00000390h]
  '0047F76B: test eax, eax
  '0047F76D: fclex 
  '0047F76F: jnl 47F783h
  '0047F771: push 00000390h
  '0047F776: push 0041FF4Ch
  '0047F77B: push esi
  '0047F77C: push eax
  '0047F77D: call [004010A8h]
  '0047F783: test edi, edi
  '0047F785: jnz 47F78Eh
  '0047F787: mov eax, 00000010h
  '0047F78C: jmp 47F7C5h
  '0047F78E: cmp edi, 00000001h
  '0047F791: jz 47F7C0h
  '0047F793: cmp edi, 00000002h
  '0047F796: jnz 47F7D1h
  '0047F798: mov ecx, [esi+000000C4h]
  '0047F79E: push 00000000h
  '0047F7A0: push ecx
  '0047F7A1: call [004011FCh]
  '0047F7A7: test ax, ax
  '0047F7AA: jnz 47F7C0h
  '0047F7AC: mov edx, [esi+000000A8h]
  '0047F7B2: mov eax, [esi+000000ACh]
  '0047F7B8: mov [esi+000000C8h], edx
  '0047F7BE: jmp 47F7CBh
  '0047F7C0: mov eax, 00000020h
  '0047F7C5: mov [esi+000000C8h], eax
  '0047F7CB: mov [esi+000000CCh], eax
  '0047F7D1: mov ecx, [esi]
  '0047F7D3: push esi
  '0047F7D4: call [ecx+000007A4h]
  '0047F7DA: test eax, eax
  '0047F7DC: jnl 47F7F0h
  '0047F7DE: push 000007A4h
  '0047F7E3: push 0041FF7Ch
  '0047F7E8: push esi
  '0047F7E9: push eax
  '0047F7EA: call [004010A8h]
  '0047F7F0: mov eax, [ebp+08h]
  '0047F7F3: push eax
  '0047F7F4: mov edx, [eax]
  '0047F7F6: call [edx+08h]
  '0047F7F9: mov eax, [ebp-04h]
  '0047F7FC: mov ecx, [ebp-14h]
  '0047F7FF: pop edi
  '0047F800: pop esi
  '0047F801: mov fs:[00000000h], ecx
  '0047F808: pop ebx
  '0047F809: mov esp, ebp
  '0047F80B: pop ebp
  '0047F80C: retn 0008h
End Sub
Private Sub unknown_481500
  '00481500: push ebp
  '00481501: mov ebp, esp
  '00481503: sub esp, 0000000Ch
  '00481506: push 00403796h
  '0048150B: mov eax, fs:[00h]
  '00481511: push eax
  '00481512: mov fs:[00000000h], esp
  '00481519: sub esp, 0000000Ch
  '0048151C: push ebx
  '0048151D: push esi
  '0048151E: push edi
  '0048151F: mov [ebp-0Ch], esp
  '00481522: mov [ebp-08h], 00402710h
  '00481529: xor edi, edi
  '0048152B: mov [ebp-04h], edi
  '0048152E: mov esi, [ebp+08h]
  '00481531: push esi
  '00481532: mov eax, [esi]
  '00481534: call [eax+04h]
  '00481537: mov ecx, [ebp+0Ch]
  '0048153A: lea eax, [ebp-18h]
  '0048153D: mov [ebp-18h], edi
  '00481540: mov [ecx], edi
  '00481542: mov edx, [esi+000000B4h]
  '00481548: push edx
  '00481549: push eax
  '0048154A: call [004010FCh]
  '00481550: push 00481562h
  '00481555: jmp 481561h
  '00481557: lea ecx, [ebp-18h]
  '0048155A: call [00401388h]
  '00481560: ret 
End Sub
Private Sub unknown_481590
  '00481590: push ebp
  '00481591: mov ebp, esp
  '00481593: sub esp, 0000000Ch
  '00481596: push 00403796h
  '0048159B: mov eax, fs:[00h]
  '004815A1: push eax
  '004815A2: mov fs:[00000000h], esp
  '004815A9: sub esp, 00000020h
  '004815AC: push ebx
  '004815AD: push esi
  '004815AE: push edi
  '004815AF: mov [ebp-0Ch], esp
  '004815B2: mov [ebp-08h], 00402720h
  '004815B9: xor ebx, ebx
  '004815BB: mov [ebp-04h], ebx
  '004815BE: mov esi, [ebp+08h]
  '004815C1: push esi
  '004815C2: mov eax, [esi]
  '004815C4: call [eax+04h]
  '004815C7: mov ecx, [ebp+0Ch]
  '004815CA: mov edi, [004010FCh]
  '004815D0: lea edx, [ebp-18h]
  '004815D3: push ecx
  '004815D4: push edx
  '004815D5: mov [ebp-18h], ebx
  '004815D8: call edi
  '004815DA: mov eax, [ebp-18h]
  '004815DD: lea ecx, [esi+000000B4h]
  '004815E3: push eax
  '004815E4: push ecx
  '004815E5: call edi
  '004815E7: sub esp, 00000010h
  '004815EA: mov ecx, 00000008h
  '004815EF: mov edi, esp
  '004815F1: mov edx, [esi]
  '004815F3: mov eax, 00420974h
  '004815F8: push esi
  '004815F9: mov [edi], ecx
  '004815FB: mov ecx, [ebp-24h]
  '004815FE: mov [edi+04h], ecx
  '00481601: mov [edi+08h], eax
  '00481604: mov eax, [ebp-1Ch]
  '00481607: mov [edi+0Ch], eax
  '0048160A: call [edx+00000390h]
  '00481610: cmp eax, ebx
  '00481612: fclex 
  '00481614: jnl 481628h
  '00481616: push 00000390h
  '0048161B: push 0041FF4Ch
  '00481620: push esi
  '00481621: push eax
  '00481622: call [004010A8h]
  '00481628: push 00481637h
  '0048162D: lea ecx, [ebp-18h]
  '00481630: call [00401388h]
  '00481636: ret 
End Sub
Private Sub unknown_481660
  '00481660: push ebp
  '00481661: mov ebp, esp
  '00481663: sub esp, 0000000Ch
  '00481666: push 00403796h
  '0048166B: mov eax, fs:[00h]
  '00481671: push eax
  '00481672: mov fs:[00000000h], esp
  '00481679: sub esp, 0000000Ch
  '0048167C: push ebx
  '0048167D: push esi
  '0048167E: push edi
  '0048167F: mov [ebp-0Ch], esp
  '00481682: mov [ebp-08h], 00402730h
  '00481689: xor edi, edi
  '0048168B: mov [ebp-04h], edi
  '0048168E: mov esi, [ebp+08h]
  '00481691: push esi
  '00481692: mov eax, [esi]
  '00481694: call [eax+04h]
  '00481697: mov ecx, [esi+00000124h]
  '0048169D: mov [ebp-18h], edi
  '004816A0: mov [ebp-18h], ecx
  '004816A3: mov eax, [ebp+08h]
  '004816A6: push eax
  '004816A7: mov edx, [eax]
  '004816A9: call [edx+08h]
  '004816AC: mov eax, [ebp+0Ch]
  '004816AF: mov ecx, [ebp-18h]
  '004816B2: mov [eax], ecx
  '004816B4: mov eax, [ebp-04h]
  '004816B7: mov ecx, [ebp-14h]
  '004816BA: pop edi
  '004816BB: pop esi
  '004816BC: mov fs:[00000000h], ecx
  '004816C3: pop ebx
  '004816C4: mov esp, ebp
  '004816C6: pop ebp
  '004816C7: retn 0008h
End Sub
Private Sub unknown_4816D0
  '004816D0: push ebp
  '004816D1: mov ebp, esp
  '004816D3: sub esp, 0000000Ch
  '004816D6: push 00403796h
  '004816DB: mov eax, fs:[00h]
  '004816E1: push eax
  '004816E2: mov fs:[00000000h], esp
  '004816E9: sub esp, 0000001Ch
  '004816EC: push ebx
  '004816ED: push esi
  '004816EE: push edi
  '004816EF: mov [ebp-0Ch], esp
  '004816F2: mov [ebp-08h], 00402738h
  '004816F9: mov [ebp-04h], 00000000h
  '00481700: mov esi, [ebp+08h]
  '00481703: push esi
  '00481704: mov eax, [esi]
  '00481706: call [eax+04h]
  '00481709: mov ecx, [ebp+0Ch]
  '0048170C: sub esp, 00000010h
  '0048170F: mov [esi+00000124h], ecx
  '00481715: mov edi, esp
  '00481717: mov ecx, 00000008h
  '0048171C: mov edx, [esi]
  '0048171E: mov [edi], ecx
  '00481720: mov ecx, [ebp-20h]
  '00481723: mov eax, 004209ECh
  '00481728: push esi
  '00481729: mov [edi+04h], ecx
  '0048172C: mov [edi+08h], eax
  '0048172F: mov eax, [ebp-18h]
  '00481732: mov [edi+0Ch], eax
  '00481735: call [edx+00000390h]
  '0048173B: test eax, eax
  '0048173D: fclex 
  '0048173F: jnl 481753h
  '00481741: push 00000390h
  '00481746: push 0041FF4Ch
  '0048174B: push esi
  '0048174C: push eax
  '0048174D: call [004010A8h]
  '00481753: mov eax, [ebp+08h]
  '00481756: push eax
  '00481757: mov ecx, [eax]
  '00481759: call [ecx+08h]
  '0048175C: mov eax, [ebp-04h]
  '0048175F: mov ecx, [ebp-14h]
  '00481762: pop edi
  '00481763: pop esi
  '00481764: mov fs:[00000000h], ecx
  '0048176B: pop ebx
  '0048176C: mov esp, ebp
  '0048176E: pop ebp
  '0048176F: retn 0008h
End Sub
Private Sub unknown_481780
  '00481780: push ebp
  '00481781: mov ebp, esp
  '00481783: sub esp, 0000000Ch
  '00481786: push 00403796h
  '0048178B: mov eax, fs:[00h]
  '00481791: push eax
  '00481792: mov fs:[00000000h], esp
  '00481799: sub esp, 0000000Ch
  '0048179C: push ebx
  '0048179D: push esi
  '0048179E: push edi
  '0048179F: mov [ebp-0Ch], esp
  '004817A2: mov [ebp-08h], 00402740h
  '004817A9: xor edi, edi
  '004817AB: mov [ebp-04h], edi
  '004817AE: mov esi, [ebp+08h]
  '004817B1: push esi
  '004817B2: mov eax, [esi]
  '004817B4: call [eax+04h]
  '004817B7: mov ecx, [esi+00000128h]
  '004817BD: mov [ebp-18h], edi
  '004817C0: mov [ebp-18h], ecx
  '004817C3: mov eax, [ebp+08h]
  '004817C6: push eax
  '004817C7: mov edx, [eax]
  '004817C9: call [edx+08h]
  '004817CC: mov eax, [ebp+0Ch]
  '004817CF: mov ecx, [ebp-18h]
  '004817D2: mov [eax], ecx
  '004817D4: mov eax, [ebp-04h]
  '004817D7: mov ecx, [ebp-14h]
  '004817DA: pop edi
  '004817DB: pop esi
  '004817DC: mov fs:[00000000h], ecx
  '004817E3: pop ebx
  '004817E4: mov esp, ebp
  '004817E6: pop ebp
  '004817E7: retn 0008h
End Sub
Private Sub unknown_4817F0
  '004817F0: push ebp
  '004817F1: mov ebp, esp
  '004817F3: sub esp, 0000000Ch
  '004817F6: push 00403796h
  '004817FB: mov eax, fs:[00h]
  '00481801: push eax
  '00481802: mov fs:[00000000h], esp
  '00481809: sub esp, 0000001Ch
  '0048180C: push ebx
  '0048180D: push esi
  '0048180E: push edi
  '0048180F: mov [ebp-0Ch], esp
  '00481812: mov [ebp-08h], 00402748h
  '00481819: mov [ebp-04h], 00000000h
  '00481820: mov esi, [ebp+08h]
  '00481823: push esi
  '00481824: mov eax, [esi]
  '00481826: call [eax+04h]
  '00481829: mov ecx, [ebp+0Ch]
  '0048182C: sub esp, 00000010h
  '0048182F: mov [esi+00000128h], ecx
  '00481835: mov edi, esp
  '00481837: mov ecx, 00000008h
  '0048183C: mov edx, [esi]
  '0048183E: mov [edi], ecx
  '00481840: mov ecx, [ebp-20h]
  '00481843: mov eax, 00420A10h
  '00481848: push esi
  '00481849: mov [edi+04h], ecx
  '0048184C: mov [edi+08h], eax
  '0048184F: mov eax, [ebp-18h]
  '00481852: mov [edi+0Ch], eax
  '00481855: call [edx+00000390h]
  '0048185B: test eax, eax
  '0048185D: fclex 
  '0048185F: jnl 481873h
  '00481861: push 00000390h
  '00481866: push 0041FF4Ch
  '0048186B: push esi
  '0048186C: push eax
  '0048186D: call [004010A8h]
  '00481873: mov eax, [ebp+08h]
  '00481876: push eax
  '00481877: mov ecx, [eax]
  '00481879: call [ecx+08h]
  '0048187C: mov eax, [ebp-04h]
  '0048187F: mov ecx, [ebp-14h]
  '00481882: pop edi
  '00481883: pop esi
  '00481884: mov fs:[00000000h], ecx
  '0048188B: pop ebx
  '0048188C: mov esp, ebp
  '0048188E: pop ebp
  '0048188F: retn 0008h
End Sub
Private Sub unknown_4818A0
  '004818A0: push ebp
  '004818A1: mov ebp, esp
  '004818A3: sub esp, 0000000Ch
  '004818A6: push 00403796h
  '004818AB: mov eax, fs:[00h]
  '004818B1: push eax
  '004818B2: mov fs:[00000000h], esp
  '004818B9: sub esp, 0000000Ch
  '004818BC: push ebx
  '004818BD: push esi
  '004818BE: push edi
  '004818BF: mov [ebp-0Ch], esp
  '004818C2: mov [ebp-08h], 00402750h
  '004818C9: xor edi, edi
  '004818CB: mov [ebp-04h], edi
  '004818CE: mov esi, [ebp+08h]
  '004818D1: push esi
  '004818D2: mov eax, [esi]
  '004818D4: call [eax+04h]
  '004818D7: mov cx, [esi+00000120h]
  '004818DE: mov [ebp-18h], edi
  '004818E1: mov [ebp-18h], ecx
  '004818E4: mov eax, [ebp+08h]
  '004818E7: push eax
  '004818E8: mov edx, [eax]
  '004818EA: call [edx+08h]
  '004818ED: mov eax, [ebp+0Ch]
  '004818F0: mov cx, [ebp-18h]
  '004818F4: mov [eax], cx
  '004818F7: mov eax, [ebp-04h]
  '004818FA: mov ecx, [ebp-14h]
  '004818FD: pop edi
  '004818FE: pop esi
  '004818FF: mov fs:[00000000h], ecx
  '00481906: pop ebx
  '00481907: mov esp, ebp
  '00481909: pop ebp
  '0048190A: retn 0008h
End Sub
Private Sub unknown_481910
  '00481910: push ebp
  '00481911: mov ebp, esp
  '00481913: sub esp, 0000000Ch
  '00481916: push 00403796h
  '0048191B: mov eax, fs:[00h]
  '00481921: push eax
  '00481922: mov fs:[00000000h], esp
  '00481929: sub esp, 0000001Ch
  '0048192C: push ebx
  '0048192D: push esi
  '0048192E: push edi
  '0048192F: mov [ebp-0Ch], esp
  '00481932: mov [ebp-08h], 00402758h
  '00481939: mov [ebp-04h], 00000000h
  '00481940: mov esi, [ebp+08h]
  '00481943: push esi
  '00481944: mov eax, [esi]
  '00481946: call [eax+04h]
  '00481949: mov cx, [ebp+0Ch]
  '0048194D: sub esp, 00000010h
  '00481950: mov [esi+00000120h], cx
  '00481957: mov edi, esp
  '00481959: mov ecx, 00000008h
  '0048195E: mov edx, [esi]
  '00481960: mov [edi], ecx
  '00481962: mov ecx, [ebp-20h]
  '00481965: mov eax, 00420A30h
  '0048196A: push esi
  '0048196B: mov [edi+04h], ecx
  '0048196E: mov [edi+08h], eax
  '00481971: mov eax, [ebp-18h]
  '00481974: mov [edi+0Ch], eax
  '00481977: call [edx+00000390h]
  '0048197D: test eax, eax
  '0048197F: fclex 
  '00481981: jnl 481995h
  '00481983: push 00000390h
  '00481988: push 0041FF4Ch
  '0048198D: push esi
  '0048198E: push eax
  '0048198F: call [004010A8h]
  '00481995: mov eax, [ebp+08h]
  '00481998: push eax
  '00481999: mov ecx, [eax]
  '0048199B: call [ecx+08h]
  '0048199E: mov eax, [ebp-04h]
  '004819A1: mov ecx, [ebp-14h]
  '004819A4: pop edi
  '004819A5: pop esi
  '004819A6: mov fs:[00000000h], ecx
  '004819AD: pop ebx
  '004819AE: mov esp, ebp
  '004819B0: pop ebp
  '004819B1: retn 0008h
End Sub
Private Sub unknown_4819C0
  '004819C0: push ebp
  '004819C1: mov ebp, esp
  '004819C3: sub esp, 0000000Ch
  '004819C6: push 00403796h
  '004819CB: mov eax, fs:[00h]
  '004819D1: push eax
  '004819D2: mov fs:[00000000h], esp
  '004819D9: sub esp, 0000000Ch
  '004819DC: push ebx
  '004819DD: push esi
  '004819DE: push edi
  '004819DF: mov [ebp-0Ch], esp
  '004819E2: mov [ebp-08h], 00402760h
  '004819E9: xor edi, edi
  '004819EB: mov [ebp-04h], edi
  '004819EE: mov esi, [ebp+08h]
  '004819F1: push esi
  '004819F2: mov eax, [esi]
  '004819F4: call [eax+04h]
  '004819F7: mov ecx, [esi+0000011Ch]
  '004819FD: mov [ebp-18h], edi
  '00481A00: mov [ebp-18h], ecx
  '00481A03: mov eax, [ebp+08h]
  '00481A06: push eax
  '00481A07: mov edx, [eax]
  '00481A09: call [edx+08h]
  '00481A0C: mov eax, [ebp+0Ch]
  '00481A0F: mov ecx, [ebp-18h]
  '00481A12: mov [eax], ecx
  '00481A14: mov eax, [ebp-04h]
  '00481A17: mov ecx, [ebp-14h]
  '00481A1A: pop edi
  '00481A1B: pop esi
  '00481A1C: mov fs:[00000000h], ecx
  '00481A23: pop ebx
  '00481A24: mov esp, ebp
  '00481A26: pop ebp
  '00481A27: retn 0008h
End Sub
Private Sub unknown_481A30
  '00481A30: push ebp
  '00481A31: mov ebp, esp
  '00481A33: sub esp, 0000000Ch
  '00481A36: push 00403796h
  '00481A3B: mov eax, fs:[00h]
  '00481A41: push eax
  '00481A42: mov fs:[00000000h], esp
  '00481A49: sub esp, 0000001Ch
  '00481A4C: push ebx
  '00481A4D: push esi
  '00481A4E: push edi
  '00481A4F: mov [ebp-0Ch], esp
  '00481A52: mov [ebp-08h], 00402768h
  '00481A59: mov [ebp-04h], 00000000h
  '00481A60: mov esi, [ebp+08h]
  '00481A63: push esi
  '00481A64: mov eax, [esi]
  '00481A66: call [eax+04h]
  '00481A69: mov ecx, [ebp+0Ch]
  '00481A6C: sub esp, 00000010h
  '00481A6F: mov [esi+0000011Ch], ecx
  '00481A75: mov edi, esp
  '00481A77: mov ecx, 00000008h
  '00481A7C: mov edx, [esi]
  '00481A7E: mov [edi], ecx
  '00481A80: mov ecx, [ebp-20h]
  '00481A83: mov eax, 004207E4h
  '00481A88: push esi
  '00481A89: mov [edi+04h], ecx
  '00481A8C: mov [edi+08h], eax
  '00481A8F: mov eax, [ebp-18h]
  '00481A92: mov [edi+0Ch], eax
  '00481A95: call [edx+00000390h]
  '00481A9B: test eax, eax
  '00481A9D: fclex 
  '00481A9F: jnl 481AB7h
  '00481AA1: mov edi, [004010A8h]
  '00481AA7: push 00000390h
  '00481AAC: push 0041FF4Ch
  '00481AB1: push esi
  '00481AB2: push eax
  '00481AB3: call edi
  '00481AB5: jmp 481ABDh
  '00481AB7: mov edi, [004010A8h]
  '00481ABD: mov eax, [esi+10h]
  '00481AC0: mov edx, [esi+0000011Ch]
  '00481AC6: push edx
  '00481AC7: push eax
  '00481AC8: mov ecx, [eax]
  '00481ACA: call [ecx+64h]
  '00481ACD: test eax, eax
  '00481ACF: fclex 
  '00481AD1: jnl 481AE1h
  '00481AD3: mov ecx, [esi+10h]
  '00481AD6: push 00000064h
  '00481AD8: push 0041FF4Ch
  '00481ADD: push ecx
  '00481ADE: push eax
  '00481ADF: call edi
  '00481AE1: mov edx, [esi]
  '00481AE3: push esi
  '00481AE4: call [edx+000007A4h]
  '00481AEA: test eax, eax
  '00481AEC: jnl 481AFCh
  '00481AEE: push 000007A4h
  '00481AF3: push 0041FF7Ch
  '00481AF8: push esi
  '00481AF9: push eax
  '00481AFA: call edi
  '00481AFC: mov eax, [ebp+08h]
  '00481AFF: push eax
  '00481B00: mov ecx, [eax]
  '00481B02: call [ecx+08h]
  '00481B05: mov eax, [ebp-04h]
  '00481B08: mov ecx, [ebp-14h]
  '00481B0B: pop edi
  '00481B0C: pop esi
  '00481B0D: mov fs:[00000000h], ecx
  '00481B14: pop ebx
  '00481B15: mov esp, ebp
  '00481B17: pop ebp
  '00481B18: retn 0008h
End Sub
Private Sub unknown_481B20
  '00481B20: push ebp
  '00481B21: mov ebp, esp
  '00481B23: sub esp, 0000000Ch
  '00481B26: push 00403796h
  '00481B2B: mov eax, fs:[00h]
  '00481B31: push eax
  '00481B32: mov fs:[00000000h], esp
  '00481B39: sub esp, 0000000Ch
  '00481B3C: push ebx
  '00481B3D: push esi
  '00481B3E: push edi
  '00481B3F: mov [ebp-0Ch], esp
  '00481B42: mov [ebp-08h], 00402770h
  '00481B49: xor edi, edi
  '00481B4B: mov [ebp-04h], edi
  '00481B4E: mov esi, [ebp+08h]
  '00481B51: push esi
  '00481B52: mov eax, [esi]
  '00481B54: call [eax+04h]
  '00481B57: mov ecx, [esi+00000118h]
  '00481B5D: mov [ebp-18h], edi
  '00481B60: mov [ebp-18h], ecx
  '00481B63: mov eax, [ebp+08h]
  '00481B66: push eax
  '00481B67: mov edx, [eax]
  '00481B69: call [edx+08h]
  '00481B6C: mov eax, [ebp+0Ch]
  '00481B6F: mov ecx, [ebp-18h]
  '00481B72: mov [eax], ecx
  '00481B74: mov eax, [ebp-04h]
  '00481B77: mov ecx, [ebp-14h]
  '00481B7A: pop edi
  '00481B7B: pop esi
  '00481B7C: mov fs:[00000000h], ecx
  '00481B83: pop ebx
  '00481B84: mov esp, ebp
  '00481B86: pop ebp
  '00481B87: retn 0008h
End Sub
Private Sub unknown_481B90
  '00481B90: push ebp
  '00481B91: mov ebp, esp
  '00481B93: sub esp, 0000000Ch
  '00481B96: push 00403796h
  '00481B9B: mov eax, fs:[00h]
  '00481BA1: push eax
  '00481BA2: mov fs:[00000000h], esp
  '00481BA9: sub esp, 0000001Ch
  '00481BAC: push ebx
  '00481BAD: push esi
  '00481BAE: push edi
  '00481BAF: mov [ebp-0Ch], esp
  '00481BB2: mov [ebp-08h], 00402778h
  '00481BB9: mov [ebp-04h], 00000000h
  '00481BC0: mov esi, [ebp+08h]
  '00481BC3: push esi
  '00481BC4: mov eax, [esi]
  '00481BC6: call [eax+04h]
  '00481BC9: mov ecx, [ebp+0Ch]
  '00481BCC: sub esp, 00000010h
  '00481BCF: mov [esi+00000118h], ecx
  '00481BD5: mov edi, esp
  '00481BD7: mov ecx, 00000008h
  '00481BDC: mov edx, [esi]
  '00481BDE: mov [edi], ecx
  '00481BE0: mov ecx, [ebp-20h]
  '00481BE3: mov eax, 0042080Ch
  '00481BE8: push esi
  '00481BE9: mov [edi+04h], ecx
  '00481BEC: mov [edi+08h], eax
  '00481BEF: mov eax, [ebp-18h]
  '00481BF2: mov [edi+0Ch], eax
  '00481BF5: call [edx+00000390h]
  '00481BFB: test eax, eax
  '00481BFD: fclex 
  '00481BFF: jnl 481C17h
  '00481C01: mov edi, [004010A8h]
  '00481C07: push 00000390h
  '00481C0C: push 0041FF4Ch
  '00481C11: push esi
  '00481C12: push eax
  '00481C13: call edi
  '00481C15: jmp 481C1Dh
  '00481C17: mov edi, [004010A8h]
  '00481C1D: mov eax, [esi+10h]
  '00481C20: mov edx, [esi+00000118h]
  '00481C26: push edx
  '00481C27: push eax
  '00481C28: mov ecx, [eax]
  '00481C2A: call [ecx+6Ch]
  '00481C2D: test eax, eax
  '00481C2F: fclex 
  '00481C31: jnl 481C41h
  '00481C33: mov ecx, [esi+10h]
  '00481C36: push 0000006Ch
  '00481C38: push 0041FF4Ch
  '00481C3D: push ecx
  '00481C3E: push eax
  '00481C3F: call edi
  '00481C41: mov edx, [esi]
  '00481C43: push esi
  '00481C44: call [edx+000007A4h]
  '00481C4A: test eax, eax
  '00481C4C: jnl 481C5Ch
  '00481C4E: push 000007A4h
  '00481C53: push 0041FF7Ch
  '00481C58: push esi
  '00481C59: push eax
  '00481C5A: call edi
  '00481C5C: mov eax, [ebp+08h]
  '00481C5F: push eax
  '00481C60: mov ecx, [eax]
  '00481C62: call [ecx+08h]
  '00481C65: mov eax, [ebp-04h]
  '00481C68: mov ecx, [ebp-14h]
  '00481C6B: pop edi
  '00481C6C: pop esi
  '00481C6D: mov fs:[00000000h], ecx
  '00481C74: pop ebx
  '00481C75: mov esp, ebp
  '00481C77: pop ebp
  '00481C78: retn 0008h
End Sub
Private Sub unknown_481C80
  '00481C80: push ebp
  '00481C81: mov ebp, esp
  '00481C83: sub esp, 0000000Ch
  '00481C86: push 00403796h
  '00481C8B: mov eax, fs:[00h]
  '00481C91: push eax
  '00481C92: mov fs:[00000000h], esp
  '00481C99: sub esp, 00000028h
  '00481C9C: push ebx
  '00481C9D: push esi
  '00481C9E: push edi
  '00481C9F: mov [ebp-0Ch], esp
  '00481CA2: mov [ebp-08h], 00402780h
  '00481CA9: xor edi, edi
  '00481CAB: mov [ebp-04h], edi
  '00481CAE: mov esi, [ebp+08h]
  '00481CB1: push esi
  '00481CB2: mov eax, [esi]
  '00481CB4: call [eax+04h]
  '00481CB7: mov ecx, [ebp+0Ch]
  '00481CBA: mov [ebp-34h], edi
  '00481CBD: mov [ebp-24h], edi
  '00481CC0: mov [ebp-34h], 00000008h
  '00481CC7: mov [ecx], edi
  '00481CC9: mov edx, [esi+00000110h]
  '00481CCF: mov [ebp-2Ch], edx
  '00481CD2: lea edx, [ebp-34h]
  '00481CD5: lea ecx, [ebp-24h]
  '00481CD8: call [00401324h]
  '00481CDE: push 00481CF0h
  '00481CE3: jmp 481CEFh
  '00481CE5: lea ecx, [ebp-24h]
  '00481CE8: call [00401034h]
  '00481CEE: ret 
End Sub
Private Sub unknown_481D30
  '00481D30: push ebp
  '00481D31: mov ebp, esp
  '00481D33: sub esp, 0000000Ch
  '00481D36: push 00403796h
  '00481D3B: mov eax, fs:[00h]
  '00481D41: push eax
  '00481D42: mov fs:[00000000h], esp
  '00481D49: sub esp, 00000030h
  '00481D4C: push ebx
  '00481D4D: push esi
  '00481D4E: push edi
  '00481D4F: mov [ebp-0Ch], esp
  '00481D52: mov [ebp-08h], 00402790h
  '00481D59: xor edi, edi
  '00481D5B: mov [ebp-04h], edi
  '00481D5E: mov esi, [ebp+08h]
  '00481D61: push esi
  '00481D62: mov eax, [esi]
  '00481D64: call [eax+04h]
  '00481D67: lea edx, [ebp+0Ch]
  '00481D6A: lea ecx, [ebp-24h]
  '00481D6D: mov [ebp-24h], edi
  '00481D70: mov [ebp-28h], edi
  '00481D73: call [00401308h]
  '00481D79: lea ecx, [ebp-24h]
  '00481D7C: push ecx
  '00481D7D: call [00401354h]
  '00481D83: mov edx, eax
  '00481D85: lea ecx, [ebp-28h]
  '00481D88: call [00401348h]
  '00481D8E: mov edx, eax
  '00481D90: lea ecx, [esi+00000110h]
  '00481D96: call [004012C4h]
  '00481D9C: lea ecx, [ebp-28h]
  '00481D9F: call [0040138Ch]
  '00481DA5: sub esp, 00000010h
  '00481DA8: mov ecx, 00000008h
  '00481DAD: mov ebx, esp
  '00481DAF: mov edx, [esi]
  '00481DB1: mov eax, 00420A54h
  '00481DB6: push esi
  '00481DB7: mov [ebx], ecx
  '00481DB9: mov ecx, [ebp-34h]
  '00481DBC: mov [ebx+04h], ecx
  '00481DBF: mov [ebx+08h], eax
  '00481DC2: mov eax, [ebp-2Ch]
  '00481DC5: mov [ebx+0Ch], eax
  '00481DC8: call [edx+00000390h]
  '00481DCE: cmp eax, edi
  '00481DD0: fclex 
  '00481DD2: jnl 481DE6h
  '00481DD4: push 00000390h
  '00481DD9: push 0041FF4Ch
  '00481DDE: push esi
  '00481DDF: push eax
  '00481DE0: call [004010A8h]
  '00481DE6: push 00481E01h
  '00481DEB: jmp 481DF7h
  '00481DED: lea ecx, [ebp-28h]
  '00481DF0: call [0040138Ch]
  '00481DF6: ret 
End Sub
Private Sub unknown_481E20
  '00481E20: push ebp
  '00481E21: mov ebp, esp
  '00481E23: sub esp, 0000000Ch
  '00481E26: push 00403796h
  '00481E2B: mov eax, fs:[00h]
  '00481E31: push eax
  '00481E32: mov fs:[00000000h], esp
  '00481E39: sub esp, 0000000Ch
  '00481E3C: push ebx
  '00481E3D: push esi
  '00481E3E: push edi
  '00481E3F: mov [ebp-0Ch], esp
  '00481E42: mov [ebp-08h], 004027A0h
  '00481E49: xor edi, edi
  '00481E4B: mov [ebp-04h], edi
  '00481E4E: mov esi, [ebp+08h]
  '00481E51: push esi
  '00481E52: mov eax, [esi]
  '00481E54: call [eax+04h]
  '00481E57: mov ecx, [ebp+0Ch]
  '00481E5A: mov [ebp-18h], edi
  '00481E5D: mov [ecx], edi
  '00481E5F: mov edx, [esi+00000114h]
  '00481E65: lea ecx, [ebp-18h]
  '00481E68: call [004012C4h]
  '00481E6E: push 00481E80h
  '00481E73: jmp 481E7Fh
  '00481E75: lea ecx, [ebp-18h]
  '00481E78: call [0040138Ch]
  '00481E7E: ret 
End Sub
Private Sub Refresh_481EB0
  '00481EB0: push ebp
  '00481EB1: mov ebp, esp
  '00481EB3: sub esp, 0000000Ch
  '00481EB6: push 00403796h
  '00481EBB: mov eax, fs:[00h]
  '00481EC1: push eax
  '00481EC2: mov fs:[00000000h], esp
  '00481EC9: sub esp, 00000020h
  '00481ECC: push ebx
  '00481ECD: push esi
  '00481ECE: push edi
  '00481ECF: mov [ebp-0Ch], esp
  '00481ED2: mov [ebp-08h], 004027B0h
  '00481ED9: xor ebx, ebx
  '00481EDB: mov [ebp-04h], ebx
  '00481EDE: mov esi, [ebp+08h]
  '00481EE1: push esi
  '00481EE2: mov eax, [esi]
  '00481EE4: call [eax+04h]
  '00481EE7: mov edx, [ebp+0Ch]
  '00481EEA: mov edi, [004012C4h]
  '00481EF0: lea ecx, [ebp-18h]
  '00481EF3: mov [ebp-18h], ebx
  '00481EF6: call edi
  '00481EF8: mov edx, [ebp-18h]
  '00481EFB: lea ecx, [esi+00000114h]
  '00481F01: call edi
  '00481F03: sub esp, 00000010h
  '00481F06: mov ecx, 00000008h
  '00481F0B: mov edi, esp
  '00481F0D: mov edx, [esi]
  '00481F0F: mov eax, 00420A6Ch
  '00481F14: push esi
  '00481F15: mov [edi], ecx
  '00481F17: mov ecx, [ebp-24h]
  '00481F1A: mov [edi+04h], ecx
  '00481F1D: mov [edi+08h], eax
  '00481F20: mov eax, [ebp-1Ch]
  '00481F23: mov [edi+0Ch], eax
  '00481F26: call [edx+00000390h]
  '00481F2C: cmp eax, ebx
  '00481F2E: fclex 
  '00481F30: jnl 481F44h
  '00481F32: push 00000390h
  '00481F37: push 0041FF4Ch
  '00481F3C: push esi
  '00481F3D: push eax
  '00481F3E: call [004010A8h]
  '00481F44: push 00481F53h
  '00481F49: lea ecx, [ebp-18h]
  '00481F4C: call [0040138Ch]
  '00481F52: ret 
End Sub
Private Sub unknown_481F80
  '00481F80: push ebp
  '00481F81: mov ebp, esp
  '00481F83: sub esp, 0000000Ch
  '00481F86: push 00403796h
  '00481F8B: mov eax, fs:[00h]
  '00481F91: push eax
  '00481F92: mov fs:[00000000h], esp
  '00481F99: sub esp, 00000018h
  '00481F9C: push ebx
  '00481F9D: push esi
  '00481F9E: push edi
  '00481F9F: mov [ebp-0Ch], esp
  '00481FA2: mov [ebp-08h], 004027C0h
  '00481FA9: xor edi, edi
  '00481FAB: mov [ebp-04h], edi
  '00481FAE: mov esi, [ebp+08h]
  '00481FB1: push esi
  '00481FB2: mov eax, [esi]
  '00481FB4: call [eax+04h]
  '00481FB7: mov ecx, [ebp+0Ch]
  '00481FBA: mov [ebp-18h], edi
  '00481FBD: mov [ebp-1Ch], edi
  '00481FC0: mov [ecx], edi
  '00481FC2: mov eax, [esi+10h]
  '00481FC5: lea ecx, [ebp-1Ch]
  '00481FC8: mov edx, [eax]
  '00481FCA: push ecx
  '00481FCB: push eax
  '00481FCC: call [edx+000001C0h]
  '00481FD2: cmp eax, edi
  '00481FD4: fclex 
  '00481FD6: jnl 481FEDh
  '00481FD8: mov edx, [esi+10h]
  '00481FDB: push 000001C0h
  '00481FE0: push 0041FF4Ch
  '00481FE5: push edx
  '00481FE6: push eax
  '00481FE7: call [004010A8h]
  '00481FED: mov edx, [ebp-1Ch]
  '00481FF0: lea ecx, [ebp-18h]
  '00481FF3: mov [ebp-1Ch], edi
  '00481FF6: call [00401348h]
  '00481FFC: push 0048201Dh
  '00482001: jmp 48201Ch
  '00482003: test byte ptr [ebp-04h], 04h
  '00482007: jz 482012h
  '00482009: lea ecx, [ebp-18h]
  '0048200C: call [0040138Ch]
  '00482012: lea ecx, [ebp-1Ch]
  '00482015: call [0040138Ch]
  '0048201B: ret 
End Sub
Private Sub unknown_482050
  '00482050: push ebp
  '00482051: mov ebp, esp
  '00482053: sub esp, 0000000Ch
  '00482056: push 00403796h
  '0048205B: mov eax, fs:[00h]
  '00482061: push eax
  '00482062: mov fs:[00000000h], esp
  '00482069: sub esp, 0000000Ch
  '0048206C: push ebx
  '0048206D: push esi
  '0048206E: push edi
  '0048206F: mov [ebp-0Ch], esp
  '00482072: mov [ebp-08h], 004027D0h
  '00482079: xor esi, esi
  '0048207B: mov [ebp-04h], esi
  '0048207E: mov eax, [ebp+08h]
  '00482081: push eax
  '00482082: mov ecx, [eax]
  '00482084: call [ecx+04h]
  '00482087: mov edx, [ebp+0Ch]
  '0048208A: lea ecx, [ebp-18h]
  '0048208D: mov [ebp-18h], esi
  '00482090: call [004012C4h]
  '00482096: push 004820A5h
  '0048209B: lea ecx, [ebp-18h]
  '0048209E: call [0040138Ch]
  '004820A4: ret 
End Sub
Private Sub unknown_482180
  '00482180: push ebp
  '00482181: mov ebp, esp
  '00482183: sub esp, 0000000Ch
  '00482186: push 00403796h
  '0048218B: mov eax, fs:[00h]
  '00482191: push eax
  '00482192: mov fs:[00000000h], esp
  '00482199: sub esp, 0000000Ch
  '0048219C: push ebx
  '0048219D: push esi
  '0048219E: push edi
  '0048219F: mov [ebp-0Ch], esp
  '004821A2: mov [ebp-08h], 004027F0h
  '004821A9: xor edi, edi
  '004821AB: mov [ebp-04h], edi
  '004821AE: mov esi, [ebp+08h]
  '004821B1: push esi
  '004821B2: mov eax, [esi]
  '004821B4: call [eax+04h]
  '004821B7: mov cx, [esi+0000010Eh]
  '004821BE: mov [ebp-18h], edi
  '004821C1: mov [ebp-18h], ecx
  '004821C4: mov eax, [ebp+08h]
  '004821C7: push eax
  '004821C8: mov edx, [eax]
  '004821CA: call [edx+08h]
  '004821CD: mov eax, [ebp+0Ch]
  '004821D0: mov cx, [ebp-18h]
  '004821D4: mov [eax], cx
  '004821D7: mov eax, [ebp-04h]
  '004821DA: mov ecx, [ebp-14h]
  '004821DD: pop edi
  '004821DE: pop esi
  '004821DF: mov fs:[00000000h], ecx
  '004821E6: pop ebx
  '004821E7: mov esp, ebp
  '004821E9: pop ebp
  '004821EA: retn 0008h
End Sub
Private Sub unknown_4821F0
  '004821F0: push ebp
  '004821F1: mov ebp, esp
  '004821F3: sub esp, 0000000Ch
  '004821F6: push 00403796h
  '004821FB: mov eax, fs:[00h]
  '00482201: push eax
  '00482202: mov fs:[00000000h], esp
  '00482209: sub esp, 00000038h
  '0048220C: push ebx
  '0048220D: push esi
  '0048220E: push edi
  '0048220F: mov [ebp-0Ch], esp
  '00482212: mov [ebp-08h], 004027F8h
  '00482219: xor edi, edi
  '0048221B: mov [ebp-04h], edi
  '0048221E: mov esi, [ebp+08h]
  '00482221: push esi
  '00482222: mov eax, [esi]
  '00482224: call [eax+04h]
  '00482227: mov cx, [ebp+0Ch]
  '0048222B: sub esp, 00000010h
  '0048222E: mov [esi+0000010Eh], cx
  '00482235: mov ebx, esp
  '00482237: mov ecx, 00000008h
  '0048223C: mov edx, [esi]
  '0048223E: mov [ebx], ecx
  '00482240: mov ecx, [ebp-2Ch]
  '00482243: mov eax, 00420A88h
  '00482248: push esi
  '00482249: mov [ebx+04h], ecx
  '0048224C: mov [ebp-18h], edi
  '0048224F: mov [ebp-1Ch], edi
  '00482252: mov [ebp-20h], edi
  '00482255: mov [ebx+08h], eax
  '00482258: mov eax, [ebp-24h]
  '0048225B: mov [ebx+0Ch], eax
  '0048225E: call [edx+00000390h]
  '00482264: cmp eax, edi
  '00482266: fclex 
  '00482268: jnl 482280h
  '0048226A: mov ebx, [004010A8h]
  '00482270: push 00000390h
  '00482275: push 0041FF4Ch
  '0048227A: push esi
  '0048227B: push eax
  '0048227C: call ebx
  '0048227E: jmp 482286h
  '00482280: mov ebx, [004010A8h]
  '00482286: cmp word ptr [esi+0000010Eh], FFFFh
  '0048228E: jnz 0048233Bh
  '00482294: mov ecx, [esi]
  '00482296: push esi
  '00482297: call [ecx+000003ACh]
  '0048229D: lea edx, [ebp-18h]
  '004822A0: push eax
  '004822A1: push edx
  '004822A2: call [004010F0h]
  '004822A8: mov edi, eax
  '004822AA: lea ecx, [ebp-1Ch]
  '004822AD: push ecx
  '004822AE: push edi
  '004822AF: mov eax, [edi]
  '004822B1: call [eax+58h]
  '004822B4: test eax, eax
  '004822B6: fclex 
  '004822B8: jnl 4822C5h
  '004822BA: push 00000058h
  '004822BC: push 00419324h
  '004822C1: push edi
  '004822C2: push eax
  '004822C3: call ebx
  '004822C5: mov eax, [ebp-1Ch]
  '004822C8: mov edx, [esi+10h]
  '004822CB: push eax
  '004822CC: lea eax, [ebp-20h]
  '004822CF: mov [ebp-1Ch], 00000000h
  '004822D6: mov edi, [edx]
  '004822D8: push eax
  '004822D9: call [004010F0h]
  '004822DF: mov ecx, [esi+10h]
  '004822E2: push eax
  '004822E3: push ecx
  '004822E4: call [edi+00000224h]
  '004822EA: test eax, eax
  '004822EC: fclex 
  '004822EE: jnl 482301h
  '004822F0: mov edx, [esi+10h]
  '004822F3: push 00000224h
  '004822F8: push 0041FF4Ch
  '004822FD: push edx
  '004822FE: push eax
  '004822FF: call ebx
  '00482301: lea eax, [ebp-20h]
  '00482304: lea ecx, [ebp-18h]
  '00482307: push eax
  '00482308: push ecx
  '00482309: push 00000002h
  '0048230B: call [0040106Ch]
  '00482311: mov eax, [esi+10h]
  '00482314: add esp, 0000000Ch
  '00482317: mov edx, [eax]
  '00482319: push 00000063h
  '0048231B: push eax
  '0048231C: call [edx+000000A4h]
  '00482322: test eax, eax
  '00482324: fclex 
  '00482326: jnl 482388h
  '00482328: mov ecx, [esi+10h]
  '0048232B: push 000000A4h
  '00482330: push 0041FF4Ch
  '00482335: push ecx
  '00482336: push eax
  '00482337: call ebx
  '00482339: jmp 482388h
  '0048233B: mov edx, [esi+10h]
  '0048233E: push 00412CE8h
  '00482343: push edi
  '00482344: mov edx, [edx]
  '00482346: mov [ebp-4Ch], edx
  '00482349: call [00401340h]
  '0048234F: push eax
  '00482350: lea eax, [ebp-18h]
  '00482353: push eax
  '00482354: call [004010F0h]
  '0048235A: mov ecx, [esi+10h]
  '0048235D: mov edx, [ebp-4Ch]
  '00482360: push eax
  '00482361: push ecx
  '00482362: call [edx+00000224h]
  '00482368: test eax, eax
  '0048236A: fclex 
  '0048236C: jnl 48237Fh
  '0048236E: mov ecx, [esi+10h]
  '00482371: push 00000224h
  '00482376: push 0041FF4Ch
  '0048237B: push ecx
  '0048237C: push eax
  '0048237D: call ebx
  '0048237F: lea ecx, [ebp-18h]
  '00482382: call [00401388h]
  '00482388: push 004823A8h
  '0048238D: jmp 4823A7h
  '0048238F: lea edx, [ebp-20h]
  '00482392: lea eax, [ebp-1Ch]
  '00482395: push edx
  '00482396: lea ecx, [ebp-18h]
  '00482399: push eax
  '0048239A: push ecx
  '0048239B: push 00000003h
  '0048239D: call [0040106Ch]
  '004823A3: add esp, 00000010h
  '004823A6: ret 
End Sub
Private Sub unknown_4823D0
  '004823D0: push ebp
  '004823D1: mov ebp, esp
  '004823D3: sub esp, 0000000Ch
  '004823D6: push 00403796h
  '004823DB: mov eax, fs:[00h]
  '004823E1: push eax
  '004823E2: mov fs:[00000000h], esp
  '004823E9: sub esp, 0000000Ch
  '004823EC: push ebx
  '004823ED: push esi
  '004823EE: push edi
  '004823EF: mov [ebp-0Ch], esp
  '004823F2: mov [ebp-08h], 00402808h
  '004823F9: xor edi, edi
  '004823FB: mov [ebp-04h], edi
  '004823FE: mov esi, [ebp+08h]
  '00482401: push esi
  '00482402: mov eax, [esi]
  '00482404: call [eax+04h]
  '00482407: mov cx, [esi+0000010Ch]
  '0048240E: mov [ebp-18h], edi
  '00482411: mov [ebp-18h], ecx
  '00482414: mov eax, [ebp+08h]
  '00482417: push eax
  '00482418: mov edx, [eax]
  '0048241A: call [edx+08h]
  '0048241D: mov eax, [ebp+0Ch]
  '00482420: mov cx, [ebp-18h]
  '00482424: mov [eax], cx
  '00482427: mov eax, [ebp-04h]
  '0048242A: mov ecx, [ebp-14h]
  '0048242D: pop edi
  '0048242E: pop esi
  '0048242F: mov fs:[00000000h], ecx
  '00482436: pop ebx
  '00482437: mov esp, ebp
  '00482439: pop ebp
  '0048243A: retn 0008h
End Sub
Private Sub unknown_482440
  '00482440: push ebp
  '00482441: mov ebp, esp
  '00482443: sub esp, 0000000Ch
  '00482446: push 00403796h
  '0048244B: mov eax, fs:[00h]
  '00482451: push eax
  '00482452: mov fs:[00000000h], esp
  '00482459: sub esp, 0000001Ch
  '0048245C: push ebx
  '0048245D: push esi
  '0048245E: push edi
  '0048245F: mov [ebp-0Ch], esp
  '00482462: mov [ebp-08h], 00402810h
  '00482469: mov [ebp-04h], 00000000h
  '00482470: mov esi, [ebp+08h]
  '00482473: push esi
  '00482474: mov eax, [esi]
  '00482476: call [eax+04h]
  '00482479: mov cx, [ebp+0Ch]
  '0048247D: sub esp, 00000010h
  '00482480: mov [esi+0000010Ch], cx
  '00482487: mov edi, esp
  '00482489: mov ecx, 00000008h
  '0048248E: mov edx, [esi]
  '00482490: mov [edi], ecx
  '00482492: mov ecx, [ebp-20h]
  '00482495: mov eax, 00420AA4h
  '0048249A: push esi
  '0048249B: mov [edi+04h], ecx
  '0048249E: mov [edi+08h], eax
  '004824A1: mov eax, [ebp-18h]
  '004824A4: mov [edi+0Ch], eax
  '004824A7: call [edx+00000390h]
  '004824AD: test eax, eax
  '004824AF: fclex 
  '004824B1: jnl 4824C5h
  '004824B3: push 00000390h
  '004824B8: push 0041FF4Ch
  '004824BD: push esi
  '004824BE: push eax
  '004824BF: call [004010A8h]
  '004824C5: mov eax, [ebp+08h]
  '004824C8: push eax
  '004824C9: mov ecx, [eax]
  '004824CB: call [ecx+08h]
  '004824CE: mov eax, [ebp-04h]
  '004824D1: mov ecx, [ebp-14h]
  '004824D4: pop edi
  '004824D5: pop esi
  '004824D6: mov fs:[00000000h], ecx
  '004824DD: pop ebx
  '004824DE: mov esp, ebp
  '004824E0: pop ebp
  '004824E1: retn 0008h
End Sub
Private Sub unknown_4824F0
  '004824F0: push ebp
  '004824F1: mov ebp, esp
  '004824F3: sub esp, 0000000Ch
  '004824F6: push 00403796h
  '004824FB: mov eax, fs:[00h]
  '00482501: push eax
  '00482502: mov fs:[00000000h], esp
  '00482509: sub esp, 0000000Ch
  '0048250C: push ebx
  '0048250D: push esi
  '0048250E: push edi
  '0048250F: mov [ebp-0Ch], esp
  '00482512: mov [ebp-08h], 00402818h
  '00482519: xor edi, edi
  '0048251B: mov [ebp-04h], edi
  '0048251E: mov esi, [ebp+08h]
  '00482521: push esi
  '00482522: mov eax, [esi]
  '00482524: call [eax+04h]
  '00482527: mov ecx, [esi+00000108h]
  '0048252D: mov [ebp-18h], edi
  '00482530: mov [ebp-18h], ecx
  '00482533: mov eax, [ebp+08h]
  '00482536: push eax
  '00482537: mov edx, [eax]
  '00482539: call [edx+08h]
  '0048253C: mov eax, [ebp+0Ch]
  '0048253F: mov ecx, [ebp-18h]
  '00482542: mov [eax], ecx
  '00482544: mov eax, [ebp-04h]
  '00482547: mov ecx, [ebp-14h]
  '0048254A: pop edi
  '0048254B: pop esi
  '0048254C: mov fs:[00000000h], ecx
  '00482553: pop ebx
  '00482554: mov esp, ebp
  '00482556: pop ebp
  '00482557: retn 0008h
End Sub
Private Sub Enabled_482560
  '00482560: push ebp
  '00482561: mov ebp, esp
  '00482563: sub esp, 0000000Ch
  '00482566: push 00403796h
  '0048256B: mov eax, fs:[00h]
  '00482571: push eax
  '00482572: mov fs:[00000000h], esp
  '00482579: sub esp, 0000001Ch
  '0048257C: push ebx
  '0048257D: push esi
  '0048257E: push edi
  '0048257F: mov [ebp-0Ch], esp
  '00482582: mov [ebp-08h], 00402820h
  '00482589: mov [ebp-04h], 00000000h
  '00482590: mov esi, [ebp+08h]
  '00482593: push esi
  '00482594: mov eax, [esi]
  '00482596: call [eax+04h]
  '00482599: mov ecx, [ebp+0Ch]
  '0048259C: sub esp, 00000010h
  '0048259F: mov [esi+00000108h], ecx
  '004825A5: mov edi, esp
  '004825A7: mov ecx, 00000008h
  '004825AC: mov edx, [esi]
  '004825AE: mov [edi], ecx
  '004825B0: mov ecx, [ebp-20h]
  '004825B3: mov eax, 00420AD0h
  '004825B8: push esi
  '004825B9: mov [edi+04h], ecx
  '004825BC: mov [edi+08h], eax
  '004825BF: mov eax, [ebp-18h]
  '004825C2: mov [edi+0Ch], eax
  '004825C5: call [edx+00000390h]
  '004825CB: test eax, eax
  '004825CD: fclex 
  '004825CF: jnl 4825E3h
  '004825D1: push 00000390h
  '004825D6: push 0041FF4Ch
  '004825DB: push esi
  '004825DC: push eax
  '004825DD: call [004010A8h]
  '004825E3: mov ecx, [esi]
  '004825E5: push esi
  '004825E6: call [ecx+000007A4h]
  '004825EC: test eax, eax
  '004825EE: jnl 482602h
  '004825F0: push 000007A4h
  '004825F5: push 0041FF7Ch
  '004825FA: push esi
  '004825FB: push eax
  '004825FC: call [004010A8h]
  '00482602: mov eax, [ebp+08h]
  '00482605: push eax
  '00482606: mov edx, [eax]
  '00482608: call [edx+08h]
  '0048260B: mov eax, [ebp-04h]
  '0048260E: mov ecx, [ebp-14h]
  '00482611: pop edi
  '00482612: pop esi
  '00482613: mov fs:[00000000h], ecx
  '0048261A: pop ebx
  '0048261B: mov esp, ebp
  '0048261D: pop ebp
  '0048261E: retn 0008h
End Sub
Private Sub Enabled_482630
  '00482630: push ebp
  '00482631: mov ebp, esp
  '00482633: sub esp, 0000000Ch
  '00482636: push 00403796h
  '0048263B: mov eax, fs:[00h]
  '00482641: push eax
  '00482642: mov fs:[00000000h], esp
  '00482649: sub esp, 0000000Ch
  '0048264C: push ebx
  '0048264D: push esi
  '0048264E: push edi
  '0048264F: mov [ebp-0Ch], esp
  '00482652: mov [ebp-08h], 00402828h
  '00482659: xor edi, edi
  '0048265B: mov [ebp-04h], edi
  '0048265E: mov esi, [ebp+08h]
  '00482661: push esi
  '00482662: mov eax, [esi]
  '00482664: call [eax+04h]
  '00482667: mov cx, [esi+00000106h]
  '0048266E: mov [ebp-18h], edi
  '00482671: mov [ebp-18h], ecx
  '00482674: mov eax, [ebp+08h]
  '00482677: push eax
  '00482678: mov edx, [eax]
  '0048267A: call [edx+08h]
  '0048267D: mov eax, [ebp+0Ch]
  '00482680: mov cx, [ebp-18h]
  '00482684: mov [eax], cx
  '00482687: mov eax, [ebp-04h]
  '0048268A: mov ecx, [ebp-14h]
  '0048268D: pop edi
  '0048268E: pop esi
  '0048268F: mov fs:[00000000h], ecx
  '00482696: pop ebx
  '00482697: mov esp, ebp
  '00482699: pop ebp
  '0048269A: retn 0008h
End Sub
Private Sub Font_4826A0
  '004826A0: push ebp
  '004826A1: mov ebp, esp
  '004826A3: sub esp, 0000000Ch
  '004826A6: push 00403796h
  '004826AB: mov eax, fs:[00h]
  '004826B1: push eax
  '004826B2: mov fs:[00000000h], esp
  '004826B9: sub esp, 0000001Ch
  '004826BC: push ebx
  '004826BD: push esi
  '004826BE: push edi
  '004826BF: mov [ebp-0Ch], esp
  '004826C2: mov [ebp-08h], 00402830h
  '004826C9: mov [ebp-04h], 00000000h
  '004826D0: mov esi, [ebp+08h]
  '004826D3: push esi
  '004826D4: mov eax, [esi]
  '004826D6: call [eax+04h]
  '004826D9: mov cx, [ebp+0Ch]
  '004826DD: sub esp, 00000010h
  '004826E0: mov [esi+00000106h], cx
  '004826E7: mov edi, esp
  '004826E9: mov ecx, 00000008h
  '004826EE: mov edx, [esi]
  '004826F0: mov [edi], ecx
  '004826F2: mov ecx, [ebp-20h]
  '004826F5: mov eax, 00420AE8h
  '004826FA: push esi
  '004826FB: mov [edi+04h], ecx
  '004826FE: mov [edi+08h], eax
  '00482701: mov eax, [ebp-18h]
  '00482704: mov [edi+0Ch], eax
  '00482707: call [edx+00000390h]
  '0048270D: test eax, eax
  '0048270F: fclex 
  '00482711: jnl 482725h
  '00482713: push 00000390h
  '00482718: push 0041FF4Ch
  '0048271D: push esi
  '0048271E: push eax
  '0048271F: call [004010A8h]
  '00482725: mov ecx, [esi]
  '00482727: push esi
  '00482728: call [ecx+000007A4h]
  '0048272E: test eax, eax
  '00482730: jnl 482744h
  '00482732: push 000007A4h
  '00482737: push 0041FF7Ch
  '0048273C: push esi
  '0048273D: push eax
  '0048273E: call [004010A8h]
  '00482744: mov eax, [ebp+08h]
  '00482747: push eax
  '00482748: mov edx, [eax]
  '0048274A: call [edx+08h]
  '0048274D: mov eax, [ebp-04h]
  '00482750: mov ecx, [ebp-14h]
  '00482753: pop edi
  '00482754: pop esi
  '00482755: mov fs:[00000000h], ecx
  '0048275C: pop ebx
  '0048275D: mov esp, ebp
  '0048275F: pop ebp
  '00482760: retn 0008h
End Sub
Private Sub Font_482770
  '00482770: push ebp
  '00482771: mov ebp, esp
  '00482773: sub esp, 0000000Ch
  '00482776: push 00403796h
  '0048277B: mov eax, fs:[00h]
  '00482781: push eax
  '00482782: mov fs:[00000000h], esp
  '00482789: sub esp, 0000000Ch
  '0048278C: push ebx
  '0048278D: push esi
  '0048278E: push edi
  '0048278F: mov [ebp-0Ch], esp
  '00482792: mov [ebp-08h], 00402838h
  '00482799: xor edi, edi
  '0048279B: mov [ebp-04h], edi
  '0048279E: mov esi, [ebp+08h]
  '004827A1: push esi
  '004827A2: mov eax, [esi]
  '004827A4: call [eax+04h]
  '004827A7: mov cx, [esi+00000102h]
  '004827AE: mov [ebp-18h], edi
  '004827B1: mov [ebp-18h], ecx
  '004827B4: mov eax, [ebp+08h]
  '004827B7: push eax
  '004827B8: mov edx, [eax]
  '004827BA: call [edx+08h]
  '004827BD: mov eax, [ebp+0Ch]
  '004827C0: mov cx, [ebp-18h]
  '004827C4: mov [eax], cx
  '004827C7: mov eax, [ebp-04h]
  '004827CA: mov ecx, [ebp-14h]
  '004827CD: pop edi
  '004827CE: pop esi
  '004827CF: mov fs:[00000000h], ecx
  '004827D6: pop ebx
  '004827D7: mov esp, ebp
  '004827D9: pop ebp
  '004827DA: retn 0008h
End Sub
Private Sub g_Font_FontChanged_4827E0
  '004827E0: push ebp
  '004827E1: mov ebp, esp
  '004827E3: sub esp, 0000000Ch
  '004827E6: push 00403796h
  '004827EB: mov eax, fs:[00h]
  '004827F1: push eax
  '004827F2: mov fs:[00000000h], esp
  '004827F9: sub esp, 0000001Ch
  '004827FC: push ebx
  '004827FD: push esi
  '004827FE: push edi
  '004827FF: mov [ebp-0Ch], esp
  '00482802: mov [ebp-08h], 00402840h
  '00482809: mov [ebp-04h], 00000000h
  '00482810: mov esi, [ebp+08h]
  '00482813: push esi
  '00482814: mov eax, [esi]
  '00482816: call [eax+04h]
  '00482819: mov cx, [ebp+0Ch]
  '0048281D: sub esp, 00000010h
  '00482820: mov [esi+00000102h], cx
  '00482827: mov edi, esp
  '00482829: mov ecx, 00000008h
  '0048282E: mov edx, [esi]
  '00482830: mov [edi], ecx
  '00482832: mov ecx, [ebp-20h]
  '00482835: mov eax, 00420B08h
  '0048283A: push esi
  '0048283B: mov [edi+04h], ecx
  '0048283E: mov [edi+08h], eax
  '00482841: mov eax, [ebp-18h]
  '00482844: mov [edi+0Ch], eax
  '00482847: call [edx+00000390h]
  '0048284D: test eax, eax
  '0048284F: fclex 
  '00482851: jnl 482865h
  '00482853: push 00000390h
  '00482858: push 0041FF4Ch
  '0048285D: push esi
  '0048285E: push eax
  '0048285F: call [004010A8h]
  '00482865: mov ecx, [esi]
  '00482867: push esi
  '00482868: call [ecx+000007A4h]
  '0048286E: test eax, eax
  '00482870: jnl 482884h
  '00482872: push 000007A4h
  '00482877: push 0041FF7Ch
  '0048287C: push esi
  '0048287D: push eax
  '0048287E: call [004010A8h]
  '00482884: mov eax, [ebp+08h]
  '00482887: push eax
  '00482888: mov edx, [eax]
  '0048288A: call [edx+08h]
  '0048288D: mov eax, [ebp-04h]
  '00482890: mov ecx, [ebp-14h]
  '00482893: pop edi
  '00482894: pop esi
  '00482895: mov fs:[00000000h], ecx
  '0048289C: pop ebx
  '0048289D: mov esp, ebp
  '0048289F: pop ebp
  '004828A0: retn 0008h
End Sub
Private Sub hwnd_4828B0
  '004828B0: push ebp
  '004828B1: mov ebp, esp
  '004828B3: sub esp, 0000000Ch
  '004828B6: push 00403796h
  '004828BB: mov eax, fs:[00h]
  '004828C1: push eax
  '004828C2: mov fs:[00000000h], esp
  '004828C9: sub esp, 0000000Ch
  '004828CC: push ebx
  '004828CD: push esi
  '004828CE: push edi
  '004828CF: mov [ebp-0Ch], esp
  '004828D2: mov [ebp-08h], 00402848h
  '004828D9: xor edi, edi
  '004828DB: mov [ebp-04h], edi
  '004828DE: mov esi, [ebp+08h]
  '004828E1: push esi
  '004828E2: mov eax, [esi]
  '004828E4: call [eax+04h]
  '004828E7: mov cx, [esi+00000104h]
  '004828EE: mov [ebp-18h], edi
  '004828F1: mov [ebp-18h], ecx
  '004828F4: mov eax, [ebp+08h]
  '004828F7: push eax
  '004828F8: mov edx, [eax]
  '004828FA: call [edx+08h]
  '004828FD: mov eax, [ebp+0Ch]
  '00482900: mov cx, [ebp-18h]
  '00482904: mov [eax], cx
  '00482907: mov eax, [ebp-04h]
  '0048290A: mov ecx, [ebp-14h]
  '0048290D: pop edi
  '0048290E: pop esi
  '0048290F: mov fs:[00000000h], ecx
  '00482916: pop ebx
  '00482917: mov esp, ebp
  '00482919: pop ebp
  '0048291A: retn 0008h
End Sub
Private Sub MousePointer_482920
  '00482920: push ebp
  '00482921: mov ebp, esp
  '00482923: sub esp, 0000000Ch
  '00482926: push 00403796h
  '0048292B: mov eax, fs:[00h]
  '00482931: push eax
  '00482932: mov fs:[00000000h], esp
  '00482939: sub esp, 0000001Ch
  '0048293C: push ebx
  '0048293D: push esi
  '0048293E: push edi
  '0048293F: mov [ebp-0Ch], esp
  '00482942: mov [ebp-08h], 00402850h
  '00482949: mov [ebp-04h], 00000000h
  '00482950: mov esi, [ebp+08h]
  '00482953: push esi
  '00482954: mov eax, [esi]
  '00482956: call [eax+04h]
  '00482959: mov cx, [ebp+0Ch]
  '0048295D: sub esp, 00000010h
  '00482960: mov [esi+00000104h], cx
  '00482967: mov edi, esp
  '00482969: mov ecx, 00000008h
  '0048296E: mov edx, [esi]
  '00482970: mov [edi], ecx
  '00482972: mov ecx, [ebp-20h]
  '00482975: mov eax, 00420B18h
  '0048297A: push esi
  '0048297B: mov [edi+04h], ecx
  '0048297E: mov [edi+08h], eax
  '00482981: mov eax, [ebp-18h]
  '00482984: mov [edi+0Ch], eax
  '00482987: call [edx+00000390h]
  '0048298D: test eax, eax
  '0048298F: fclex 
  '00482991: jnl 4829A5h
  '00482993: push 00000390h
  '00482998: push 0041FF4Ch
  '0048299D: push esi
  '0048299E: push eax
  '0048299F: call [004010A8h]
  '004829A5: mov ecx, [esi]
  '004829A7: push esi
  '004829A8: call [ecx+000007A4h]
  '004829AE: test eax, eax
  '004829B0: jnl 4829C4h
  '004829B2: push 000007A4h
  '004829B7: push 0041FF7Ch
  '004829BC: push esi
  '004829BD: push eax
  '004829BE: call [004010A8h]
  '004829C4: mov eax, [ebp+08h]
  '004829C7: push eax
  '004829C8: mov edx, [eax]
  '004829CA: call [edx+08h]
  '004829CD: mov eax, [ebp-04h]
  '004829D0: mov ecx, [ebp-14h]
  '004829D3: pop edi
  '004829D4: pop esi
  '004829D5: mov fs:[00000000h], ecx
  '004829DC: pop ebx
  '004829DD: mov esp, ebp
  '004829DF: pop ebp
  '004829E0: retn 0008h
End Sub
Private Sub ShowFocusRect_479FF0
  '00479FF0: push ebp
  '00479FF1: mov ebp, esp
  '00479FF3: sub esp, 00000008h
  '00479FF6: push 00403796h
  '00479FFB: mov eax, fs:[00h]
  '0047A001: push eax
  '0047A002: mov fs:[00000000h], esp
  '0047A009: sub esp, 00000114h
  '0047A00F: push ebx
  '0047A010: push esi
  '0047A011: push edi
  '0047A012: mov [ebp-08h], esp
  '0047A015: mov [ebp-04h], 00402430h
  '0047A01C: mov esi, [ebp+08h]
  '0047A01F: xor edi, edi
  '0047A021: lea ecx, [ebp-000000E8h]
  '0047A027: mov [ebp-24h], edi
  '0047A02A: mov [esi+00000098h], edi
  '0047A030: mov [esi+0000009Ch], edi
  '0047A036: mov eax, [esi]
  '0047A038: push ecx
  '0047A039: push esi
  '0047A03A: mov [ebp-34h], edi
  '0047A03D: mov [ebp-44h], edi
  '0047A040: mov [ebp-54h], edi
  '0047A043: mov [ebp-64h], edi
  '0047A046: mov [ebp-74h], edi
  '0047A049: mov [ebp-00000084h], edi
  '0047A04F: mov [ebp-00000094h], edi
  '0047A055: mov [ebp-000000A4h], edi
  '0047A05B: mov [ebp-000000B4h], edi
  '0047A061: mov [ebp-000000C4h], edi
  '0047A067: mov [ebp-000000D4h], edi
  '0047A06D: mov [ebp-000000E4h], edi
  '0047A073: mov [ebp-000000E8h], edi
  '0047A079: call [eax+00000100h]
  '0047A07F: cmp eax, edi
  '0047A081: fclex 
  '0047A083: jnl 47A097h
  '0047A085: push 00000100h
  '0047A08A: push 0041FF4Ch
  '0047A08F: push esi
  '0047A090: push eax
  '0047A091: call [004010A8h]
  '0047A097: fld real4 ptr [ebp-000000E8h]
  '0047A09D: fsub real4 ptr [00402428h]
  '0047A0A3: mov ebx, [00401320h]
  '0047A0A9: fstsw ax
  '0047A0AB: test al, 0Dh
  '0047A0AD: jnz 0047ACECh
  '0047A0B3: call ebx
  '0047A0B5: mov [esi+000000A0h], eax
  '0047A0BB: mov edx, [esi]
  '0047A0BD: lea eax, [ebp-000000E8h]
  '0047A0C3: push eax
  '0047A0C4: push esi
  '0047A0C5: call [edx+00000108h]
  '0047A0CB: cmp eax, edi
  '0047A0CD: fclex 
  '0047A0CF: jnl 47A0E3h
  '0047A0D1: push 00000108h
  '0047A0D6: push 0041FF4Ch
  '0047A0DB: push esi
  '0047A0DC: push eax
  '0047A0DD: call [004010A8h]
  '0047A0E3: fld real4 ptr [ebp-000000E8h]
  '0047A0E9: fsub real4 ptr [00402428h]
  '0047A0EF: fstsw ax
  '0047A0F1: test al, 0Dh
  '0047A0F3: jnz 0047ACECh
  '0047A0F9: call ebx
  '0047A0FB: mov [esi+000000A4h], eax
  '0047A101: mov ecx, [esi+00000098h]
  '0047A107: add ecx, 00000004h
  '0047A10A: push edi
  '0047A10B: jo 0047ACF1h
  '0047A111: mov [esi+48h], ecx
  '0047A114: mov edx, [esi+0000009Ch]
  '0047A11A: add edx, 00000004h
  '0047A11D: jo 0047ACF1h
  '0047A123: mov [esi+4Ch], edx
  '0047A126: mov eax, [esi+000000A0h]
  '0047A12C: sub eax, 00000004h
  '0047A12F: jo 0047ACF1h
  '0047A135: add eax, 00000001h
  '0047A138: jo 0047ACF1h
  '0047A13E: mov [esi+50h], eax
  '0047A141: mov ecx, [esi+000000A4h]
  '0047A147: sub ecx, 00000004h
  '0047A14A: jo 0047ACF1h
  '0047A150: add ecx, 00000001h
  '0047A153: jo 0047ACF1h
  '0047A159: mov [esi+54h], ecx
  '0047A15C: mov edx, [esi+000000C4h]
  '0047A162: push edx
  '0047A163: call [004011FCh]
  '0047A169: test ax, ax
  '0047A16C: jz 47A19Ah
  '0047A16E: mov eax, [esi+48h]
  '0047A171: push esi
  '0047A172: mov [esi+68h], eax
  '0047A175: mov ecx, [esi+4Ch]
  '0047A178: mov [esi+6Ch], ecx
  '0047A17B: mov edx, [esi+50h]
  '0047A17E: mov [esi+70h], edx
  '0047A181: mov eax, [esi+54h]
  '0047A184: mov [esi+74h], eax
  '0047A187: mov ecx, [esi]
  '0047A189: call [ecx+000008F8h]
  '0047A18F: wait 
  '0047A190: push 0047ACD7h
  '0047A195: jmp 0047ACC1h
  '0047A19A: mov edx, [esi+000000B8h]
  '0047A1A0: push edx
  '0047A1A1: push 0040FE84h
  '0047A1A6: call [00401184h]
  '0047A1AC: test eax, eax
  '0047A1AE: jnz 0047A23Bh
  '0047A1B4: mov ecx, [esi+48h]
  '0047A1B7: mov eax, [esi+50h]
  '0047A1BA: mov ebx, [esi+000000C8h]
  '0047A1C0: sub eax, ecx
  '0047A1C2: jo 0047ACF1h
  '0047A1C8: sub eax, ebx
  '0047A1CA: push 0047ACD7h
  '0047A1CF: jo 0047ACF1h
  '0047A1D5: cdq 
  '0047A1D6: wait 
  '0047A1D7: sub eax, edx
  '0047A1D9: sar eax, 01h
  '0047A1DB: add eax, ecx
  '0047A1DD: jo 0047ACF1h
  '0047A1E3: mov [esi+58h], eax
  '0047A1E6: mov ecx, [esi+4Ch]
  '0047A1E9: mov eax, [esi+54h]
  '0047A1EC: mov edx, [esi+000000CCh]
  '0047A1F2: sub eax, ecx
  '0047A1F4: jo 0047ACF1h
  '0047A1FA: sub eax, edx
  '0047A1FC: jo 0047ACF1h
  '0047A202: cdq 
  '0047A203: sub eax, edx
  '0047A205: sar eax, 01h
  '0047A207: add eax, ecx
  '0047A209: jo 0047ACF1h
  '0047A20F: mov [esi+5Ch], eax
  '0047A212: mov eax, [esi+000000C8h]
  '0047A218: add eax, [esi+58h]
  '0047A21B: jo 0047ACF1h
  '0047A221: mov [esi+60h], eax
  '0047A224: mov ecx, [esi+5Ch]
  '0047A227: add ecx, [esi+000000CCh]
  '0047A22D: jo 0047ACF1h
  '0047A233: mov [esi+64h], ecx
  '0047A236: jmp 0047ACC1h
  '0047A23B: mov edx, [esi+48h]
  '0047A23E: push esi
  '0047A23F: mov [esi+68h], edx
  '0047A242: mov eax, [esi+4Ch]
  '0047A245: mov [esi+6Ch], eax
  '0047A248: mov ecx, [esi+50h]
  '0047A24B: mov [esi+70h], ecx
  '0047A24E: mov edx, [esi+54h]
  '0047A251: mov [esi+74h], edx
  '0047A254: mov eax, [esi]
  '0047A256: call [eax+000008F8h]
  '0047A25C: mov ecx, [esi+000000C8h]
  '0047A262: mov ebx, [00401024h]
  '0047A268: mov [ebp-0000009Ch], ecx
  '0047A26E: mov edi, 00000003h
  '0047A273: lea edx, [ebp-000000A4h]
  '0047A279: lea ecx, [ebp-24h]
  '0047A27C: mov [ebp-000000A4h], edi
  '0047A282: call ebx
  '0047A284: mov edx, [esi+000000CCh]
  '0047A28A: lea ecx, [ebp-44h]
  '0047A28D: mov [ebp-0000009Ch], edx
  '0047A293: lea edx, [ebp-000000A4h]
  '0047A299: mov [ebp-000000A4h], edi
  '0047A29F: call ebx
  '0047A2A1: mov eax, [esi+70h]
  '0047A2A4: mov ecx, [esi+68h]
  '0047A2A7: sub eax, ecx
  '0047A2A9: lea edx, [ebp-000000A4h]
  '0047A2AF: jo 0047ACF1h
  '0047A2B5: lea ecx, [ebp-34h]
  '0047A2B8: mov [ebp-0000009Ch], eax
  '0047A2BE: mov [ebp-000000A4h], edi
  '0047A2C4: call ebx
  '0047A2C6: mov ebx, [esi+74h]
  '0047A2C9: mov edx, [esi+6Ch]
  '0047A2CC: mov eax, [esi+000000BCh]
  '0047A2D2: sub ebx, edx
  '0047A2D4: jo 0047ACF1h
  '0047A2DA: cmp eax, 00000001h
  '0047A2DD: jnz 0047A504h
  '0047A2E3: mov eax, [esi+4Ch]
  '0047A2E6: mov ecx, [esi+54h]
  '0047A2E9: sub ecx, eax
  '0047A2EB: mov [ebp-000000BCh], eax
  '0047A2F1: jo 0047ACF1h
  '0047A2F7: mov [ebp-0000009Ch], ecx
  '0047A2FD: mov ecx, 00000002h
  '0047A302: lea edx, [ebp-000000A4h]
  '0047A308: mov [ebp-000000ACh], ecx
  '0047A30E: mov [ebp-000000B4h], ecx
  '0047A314: lea eax, [ebp-44h]
  '0047A317: push edx
  '0047A318: lea ecx, [ebp-54h]
  '0047A31B: push eax
  '0047A31C: push ecx
  '0047A31D: mov [ebp-000000A4h], edi
  '0047A323: mov [ebp-000000C4h], edi
  '0047A329: call [00401004h]
  '0047A32F: push eax
  '0047A330: lea edx, [ebp-000000B4h]
  '0047A336: lea eax, [ebp-64h]
  '0047A339: push edx
  '0047A33A: push eax
  '0047A33B: call [00401050h]
  '0047A341: lea ecx, [ebp-000000C4h]
  '0047A347: push eax
  '0047A348: lea edx, [ebp-74h]
  '0047A34B: push ecx
  '0047A34C: push edx
  '0047A34D: call [00401300h]
  '0047A353: push eax
  '0047A354: call [004012ECh]
  '0047A35A: lea ecx, [ebp-74h]
  '0047A35D: mov [esi+5Ch], eax
  '0047A360: call [00401034h]
  '0047A366: mov eax, [esi+48h]
  '0047A369: mov ecx, [esi+50h]
  '0047A36C: sub ecx, eax
  '0047A36E: mov [ebp-000000CCh], eax
  '0047A374: jo 0047ACF1h
  '0047A37A: mov [ebp-000000ACh], ecx
  '0047A380: mov ecx, 00000002h
  '0047A385: lea edx, [ebp-000000B4h]
  '0047A38B: mov [ebp-000000BCh], ecx
  '0047A391: mov [ebp-000000C4h], ecx
  '0047A397: lea eax, [ebp-24h]
  '0047A39A: push edx
  '0047A39B: lea ecx, [ebp-000000A4h]
  '0047A3A1: push eax
  '0047A3A2: lea edx, [ebp-54h]
  '0047A3A5: push ecx
  '0047A3A6: push edx
  '0047A3A7: mov [ebp-000000B4h], edi
  '0047A3AD: mov byte ptr [ebp-0000009Ch], 04h
  '0047A3B4: mov [ebp-000000A4h], 00000011h
  '0047A3BE: mov [ebp-000000D4h], edi
  '0047A3C4: call [00401300h]
  '0047A3CA: push eax
  '0047A3CB: lea eax, [ebp-34h]
  '0047A3CE: lea ecx, [ebp-64h]
  '0047A3D1: push eax
  '0047A3D2: push ecx
  '0047A3D3: call [00401300h]
  '0047A3D9: lea edx, [ebp-74h]
  '0047A3DC: push eax
  '0047A3DD: push edx
  '0047A3DE: call [00401004h]
  '0047A3E4: push eax
  '0047A3E5: lea eax, [ebp-000000C4h]
  '0047A3EB: lea ecx, [ebp-00000084h]
  '0047A3F1: push eax
  '0047A3F2: push ecx
  '0047A3F3: call [00401050h]
  '0047A3F9: push eax
  '0047A3FA: lea edx, [ebp-000000D4h]
  '0047A400: lea eax, [ebp-00000094h]
  '0047A406: push edx
  '0047A407: push eax
  '0047A408: call [00401300h]
  '0047A40E: push eax
  '0047A40F: call [004012ECh]
  '0047A415: lea ecx, [ebp-00000094h]
  '0047A41B: mov [esi+58h], eax
  '0047A41E: lea edx, [ebp-64h]
  '0047A421: push ecx
  '0047A422: lea eax, [ebp-54h]
  '0047A425: push edx
  '0047A426: push eax
  '0047A427: push edi
  '0047A428: call [00401058h]
  '0047A42E: mov ecx, [esi+5Ch]
  '0047A431: add esp, 00000010h
  '0047A434: lea edx, [ebp-000000A4h]
  '0047A43A: mov [ebp-0000009Ch], ecx
  '0047A440: lea eax, [ebp-44h]
  '0047A443: push edx
  '0047A444: lea ecx, [ebp-54h]
  '0047A447: push eax
  '0047A448: push ecx
  '0047A449: mov [ebp-000000A4h], edi
  '0047A44F: call [00401300h]
  '0047A455: push eax
  '0047A456: call [004012ECh]
  '0047A45C: lea ecx, [ebp-54h]
  '0047A45F: mov [esi+64h], eax
  '0047A462: call [00401034h]
  '0047A468: mov edx, [esi+58h]
  '0047A46B: lea eax, [ebp-000000A4h]
  '0047A471: mov [ebp-0000009Ch], edx
  '0047A477: lea ecx, [ebp-24h]
  '0047A47A: push eax
  '0047A47B: lea edx, [ebp-54h]
  '0047A47E: push ecx
  '0047A47F: push edx
  '0047A480: mov [ebp-000000A4h], edi
  '0047A486: call [00401300h]
  '0047A48C: push eax
  '0047A48D: call [004012ECh]
  '0047A493: lea ecx, [ebp-54h]
  '0047A496: mov [esi+60h], eax
  '0047A499: call [00401034h]
  '0047A49F: mov ecx, [esi+4Ch]
  '0047A4A2: mov eax, [esi+54h]
  '0047A4A5: sub eax, ecx
  '0047A4A7: mov [ebp-000000A4h], edi
  '0047A4AD: jo 0047ACF1h
  '0047A4B3: sub eax, ebx
  '0047A4B5: jo 0047ACF1h
  '0047A4BB: cdq 
  '0047A4BC: sub eax, edx
  '0047A4BE: sar eax, 01h
  '0047A4C0: add eax, ecx
  '0047A4C2: jo 0047ACF1h
  '0047A4C8: mov [esi+6Ch], eax
  '0047A4CB: mov eax, [esi+60h]
  '0047A4CE: add eax, 00000004h
  '0047A4D1: jo 0047ACF1h
  '0047A4D7: mov [esi+68h], eax
  '0047A4DA: mov ecx, [esi+6Ch]
  '0047A4DD: add ecx, ebx
  '0047A4DF: mov edx, eax
  '0047A4E1: jo 0047ACF1h
  '0047A4E7: mov [esi+74h], ecx
  '0047A4EA: lea eax, [ebp-000000A4h]
  '0047A4F0: mov [ebp-0000009Ch], edx
  '0047A4F6: lea ecx, [ebp-34h]
  '0047A4F9: push eax
  '0047A4FA: lea edx, [ebp-54h]
  '0047A4FD: push ecx
  '0047A4FE: push edx
  '0047A4FF: jmp 0047A9D4h
  '0047A504: mov ecx, 00000002h
  '0047A509: cmp eax, ecx
  '0047A50B: jnz 0047A748h
  '0047A511: mov ecx, [esi+4Ch]
  '0047A514: mov eax, [esi+54h]
  '0047A517: sub eax, ecx
  '0047A519: mov [ebp-000000B4h], edi
  '0047A51F: jo 0047ACF1h
  '0047A525: sub eax, ebx
  '0047A527: mov byte ptr [ebp-0000009Ch], 04h
  '0047A52E: jo 0047ACF1h
  '0047A534: cdq 
  '0047A535: sub eax, edx
  '0047A537: lea edx, [ebp-000000B4h]
  '0047A53D: sar eax, 01h
  '0047A53F: add eax, ecx
  '0047A541: push edx
  '0047A542: jo 0047ACF1h
  '0047A548: mov [esi+6Ch], eax
  '0047A54B: mov eax, [esi+48h]
  '0047A54E: mov ecx, [esi+50h]
  '0047A551: mov [ebp-000000CCh], eax
  '0047A557: sub ecx, eax
  '0047A559: lea eax, [ebp-24h]
  '0047A55C: jo 0047ACF1h
  '0047A562: mov [ebp-000000ACh], ecx
  '0047A568: mov ecx, 00000002h
  '0047A56D: mov [ebp-000000BCh], ecx
  '0047A573: mov [ebp-000000C4h], ecx
  '0047A579: lea ecx, [ebp-000000A4h]
  '0047A57F: push eax
  '0047A580: lea edx, [ebp-54h]
  '0047A583: push ecx
  '0047A584: push edx
  '0047A585: mov [ebp-000000A4h], 00000011h
  '0047A58F: mov [ebp-000000D4h], edi
  '0047A595: call [00401300h]
  '0047A59B: push eax
  '0047A59C: lea eax, [ebp-34h]
  '0047A59F: lea ecx, [ebp-64h]
  '0047A5A2: push eax
  '0047A5A3: push ecx
  '0047A5A4: call [00401300h]
  '0047A5AA: lea edx, [ebp-74h]
  '0047A5AD: push eax
  '0047A5AE: push edx
  '0047A5AF: call [00401004h]
  '0047A5B5: push eax
  '0047A5B6: lea eax, [ebp-000000C4h]
  '0047A5BC: lea ecx, [ebp-00000084h]
  '0047A5C2: push eax
  '0047A5C3: push ecx
  '0047A5C4: call [00401050h]
  '0047A5CA: push eax
  '0047A5CB: lea edx, [ebp-000000D4h]
  '0047A5D1: lea eax, [ebp-00000094h]
  '0047A5D7: push edx
  '0047A5D8: push eax
  '0047A5D9: call [00401300h]
  '0047A5DF: push eax
  '0047A5E0: call [004012ECh]
  '0047A5E6: lea ecx, [ebp-00000094h]
  '0047A5EC: mov [esi+68h], eax
  '0047A5EF: lea edx, [ebp-64h]
  '0047A5F2: push ecx
  '0047A5F3: lea eax, [ebp-54h]
  '0047A5F6: push edx
  '0047A5F7: push eax
  '0047A5F8: push edi
  '0047A5F9: call [00401058h]
  '0047A5FF: mov ecx, [esi+6Ch]
  '0047A602: add esp, 00000010h
  '0047A605: add ecx, ebx
  '0047A607: lea eax, [ebp-000000A4h]
  '0047A60D: jo 0047ACF1h
  '0047A613: mov [esi+74h], ecx
  '0047A616: mov edx, [esi+68h]
  '0047A619: mov [ebp-0000009Ch], edx
  '0047A61F: lea ecx, [ebp-34h]
  '0047A622: push eax
  '0047A623: lea edx, [ebp-54h]
  '0047A626: push ecx
  '0047A627: mov [ebp-000000A4h], edi
  '0047A62D: push edx
  '0047A62E: call [00401300h]
  '0047A634: push eax
  '0047A635: call [004012ECh]
  '0047A63B: mov ebx, [00401034h]
  '0047A641: lea ecx, [ebp-54h]
  '0047A644: mov [esi+70h], eax
  '0047A647: call ebx
  '0047A649: mov eax, [esi+4Ch]
  '0047A64C: mov ecx, [esi+54h]
  '0047A64F: sub ecx, eax
  '0047A651: mov [ebp-000000BCh], eax
  '0047A657: jo 0047ACF1h
  '0047A65D: mov [ebp-0000009Ch], ecx
  '0047A663: mov ecx, 00000002h
  '0047A668: lea edx, [ebp-000000A4h]
  '0047A66E: mov [ebp-000000ACh], ecx
  '0047A674: mov [ebp-000000B4h], ecx
  '0047A67A: lea eax, [ebp-44h]
  '0047A67D: push edx
  '0047A67E: lea ecx, [ebp-54h]
  '0047A681: push eax
  '0047A682: push ecx
  '0047A683: mov [ebp-000000A4h], edi
  '0047A689: mov [ebp-000000C4h], edi
  '0047A68F: call [00401004h]
  '0047A695: push eax
  '0047A696: lea edx, [ebp-000000B4h]
  '0047A69C: lea eax, [ebp-64h]
  '0047A69F: push edx
  '0047A6A0: push eax
  '0047A6A1: call [00401050h]
  '0047A6A7: lea ecx, [ebp-000000C4h]
  '0047A6AD: push eax
  '0047A6AE: lea edx, [ebp-74h]
  '0047A6B1: push ecx
  '0047A6B2: push edx
  '0047A6B3: call [00401300h]
  '0047A6B9: push eax
  '0047A6BA: call [004012ECh]
  '0047A6C0: lea ecx, [ebp-74h]
  '0047A6C3: mov [esi+5Ch], eax
  '0047A6C6: call ebx
  '0047A6C8: mov eax, [esi+70h]
  '0047A6CB: lea edx, [ebp-000000A4h]
  '0047A6D1: add eax, 00000004h
  '0047A6D4: push edx
  '0047A6D5: jo 0047ACF1h
  '0047A6DB: mov [esi+58h], eax
  '0047A6DE: mov ecx, [esi+5Ch]
  '0047A6E1: mov [ebp-0000009Ch], ecx
  '0047A6E7: lea eax, [ebp-44h]
  '0047A6EA: lea ecx, [ebp-54h]
  '0047A6ED: push eax
  '0047A6EE: push ecx
  '0047A6EF: mov [ebp-000000A4h], edi
  '0047A6F5: call [00401300h]
  '0047A6FB: push eax
  '0047A6FC: call [004012ECh]
  '0047A702: lea ecx, [ebp-54h]
  '0047A705: mov [esi+64h], eax
  '0047A708: call ebx
  '0047A70A: mov edx, [esi+58h]
  '0047A70D: lea eax, [ebp-000000A4h]
  '0047A713: mov [ebp-0000009Ch], edx
  '0047A719: lea ecx, [ebp-24h]
  '0047A71C: push eax
  '0047A71D: lea edx, [ebp-54h]
  '0047A720: push ecx
  '0047A721: push edx
  '0047A722: mov [ebp-000000A4h], edi
  '0047A728: call [00401300h]
  '0047A72E: push eax
  '0047A72F: call [004012ECh]
  '0047A735: lea ecx, [ebp-54h]
  '0047A738: mov [esi+60h], eax
  '0047A73B: call ebx
  '0047A73D: wait 
  '0047A73E: push 0047ACD7h
  '0047A743: jmp 0047ACC1h
  '0047A748: test eax, eax
  '0047A74A: jnz 0047A9F8h
  '0047A750: mov eax, [esi+4Ch]
  '0047A753: mov edx, [esi+54h]
  '0047A756: sub edx, eax
  '0047A758: mov [ebp-000000DCh], eax
  '0047A75E: jo 0047ACF1h
  '0047A764: mov [ebp-000000CCh], ecx
  '0047A76A: mov [ebp-000000D4h], ecx
  '0047A770: lea eax, [ebp-000000C4h]
  '0047A776: mov [ebp-000000BCh], edx
  '0047A77C: lea ecx, [ebp-44h]
  '0047A77F: push eax
  '0047A780: lea edx, [ebp-000000A4h]
  '0047A786: push ecx
  '0047A787: lea eax, [ebp-54h]
  '0047A78A: push edx
  '0047A78B: push eax
  '0047A78C: mov [ebp-000000C4h], edi
  '0047A792: mov byte ptr [ebp-0000009Ch], 04h
  '0047A799: mov [ebp-000000A4h], 00000011h
  '0047A7A3: mov [ebp-000000ACh], ebx
  '0047A7A9: mov [ebp-000000B4h], edi
  '0047A7AF: mov [ebp-000000E4h], edi
  '0047A7B5: call [00401300h]
  '0047A7BB: lea ecx, [ebp-000000B4h]
  '0047A7C1: push eax
  '0047A7C2: lea edx, [ebp-64h]
  '0047A7C5: push ecx
  '0047A7C6: push edx
  '0047A7C7: call [00401300h]
  '0047A7CD: push eax
  '0047A7CE: lea eax, [ebp-74h]
  '0047A7D1: push eax
  '0047A7D2: call [00401004h]
  '0047A7D8: lea ecx, [ebp-000000D4h]
  '0047A7DE: push eax
  '0047A7DF: lea edx, [ebp-00000084h]
  '0047A7E5: push ecx
  '0047A7E6: push edx
  '0047A7E7: call [00401050h]
  '0047A7ED: push eax
  '0047A7EE: lea eax, [ebp-000000E4h]
  '0047A7F4: lea ecx, [ebp-00000094h]
  '0047A7FA: push eax
  '0047A7FB: push ecx
  '0047A7FC: call [00401300h]
  '0047A802: push eax
  '0047A803: call [004012ECh]
  '0047A809: mov [esi+5Ch], eax
  '0047A80C: lea edx, [ebp-00000094h]
  '0047A812: lea eax, [ebp-64h]
  '0047A815: push edx
  '0047A816: lea ecx, [ebp-54h]
  '0047A819: push eax
  '0047A81A: push ecx
  '0047A81B: push edi
  '0047A81C: call [00401058h]
  '0047A822: mov eax, [esi+48h]
  '0047A825: mov edx, [esi+50h]
  '0047A828: add esp, 00000010h
  '0047A82B: sub edx, eax
  '0047A82D: mov ecx, 00000002h
  '0047A832: mov [ebp-000000BCh], eax
  '0047A838: jo 0047ACF1h
  '0047A83E: mov [ebp-000000ACh], ecx
  '0047A844: mov [ebp-000000B4h], ecx
  '0047A84A: lea eax, [ebp-000000A4h]
  '0047A850: mov [ebp-0000009Ch], edx
  '0047A856: lea ecx, [ebp-24h]
  '0047A859: push eax
  '0047A85A: lea edx, [ebp-54h]
  '0047A85D: push ecx
  '0047A85E: push edx
  '0047A85F: mov [ebp-000000A4h], edi
  '0047A865: mov [ebp-000000C4h], edi
  '0047A86B: call [00401004h]
  '0047A871: push eax
  '0047A872: lea eax, [ebp-000000B4h]
  '0047A878: lea ecx, [ebp-64h]
  '0047A87B: push eax
  '0047A87C: push ecx
  '0047A87D: call [00401050h]
  '0047A883: push eax
  '0047A884: lea edx, [ebp-000000C4h]
  '0047A88A: lea eax, [ebp-74h]
  '0047A88D: push edx
  '0047A88E: push eax
  '0047A88F: call [00401300h]
  '0047A895: push eax
  '0047A896: call [004012ECh]
  '0047A89C: lea ecx, [ebp-74h]
  '0047A89F: mov [esi+58h], eax
  '0047A8A2: call [00401034h]
  '0047A8A8: mov ecx, [esi+5Ch]
  '0047A8AB: lea edx, [ebp-000000A4h]
  '0047A8B1: mov [ebp-0000009Ch], ecx
  '0047A8B7: lea eax, [ebp-44h]
  '0047A8BA: push edx
  '0047A8BB: lea ecx, [ebp-54h]
  '0047A8BE: push eax
  '0047A8BF: push ecx
  '0047A8C0: mov [ebp-000000A4h], edi
  '0047A8C6: call [00401300h]
  '0047A8CC: push eax
  '0047A8CD: call [004012ECh]
  '0047A8D3: lea ecx, [ebp-54h]
  '0047A8D6: mov [esi+64h], eax
  '0047A8D9: call [00401034h]
  '0047A8DF: mov edx, [esi+58h]
  '0047A8E2: lea eax, [ebp-000000A4h]
  '0047A8E8: mov [ebp-0000009Ch], edx
  '0047A8EE: lea ecx, [ebp-24h]
  '0047A8F1: push eax
  '0047A8F2: lea edx, [ebp-54h]
  '0047A8F5: push ecx
  '0047A8F6: push edx
  '0047A8F7: mov [ebp-000000A4h], edi
  '0047A8FD: call [00401300h]
  '0047A903: push eax
  '0047A904: call [004012ECh]
  '0047A90A: lea ecx, [ebp-54h]
  '0047A90D: mov [esi+60h], eax
  '0047A910: call [00401034h]
  '0047A916: mov eax, [esi+64h]
  '0047A919: lea edx, [ebp-000000A4h]
  '0047A91F: add eax, 00000004h
  '0047A922: push edx
  '0047A923: jo 0047ACF1h
  '0047A929: mov [esi+6Ch], eax
  '0047A92C: mov eax, [esi+48h]
  '0047A92F: mov ecx, [esi+50h]
  '0047A932: mov [ebp-000000BCh], eax
  '0047A938: sub ecx, eax
  '0047A93A: lea eax, [ebp-34h]
  '0047A93D: jo 0047ACF1h
  '0047A943: mov [ebp-0000009Ch], ecx
  '0047A949: mov ecx, 00000002h
  '0047A94E: mov [ebp-000000ACh], ecx
  '0047A954: mov [ebp-000000B4h], ecx
  '0047A95A: lea ecx, [ebp-54h]
  '0047A95D: push eax
  '0047A95E: push ecx
  '0047A95F: mov [ebp-000000A4h], edi
  '0047A965: mov [ebp-000000C4h], edi
  '0047A96B: call [00401004h]
  '0047A971: push eax
  '0047A972: lea edx, [ebp-000000B4h]
  '0047A978: lea eax, [ebp-64h]
  '0047A97B: push edx
  '0047A97C: push eax
  '0047A97D: call [00401050h]
  '0047A983: lea ecx, [ebp-000000C4h]
  '0047A989: push eax
  '0047A98A: lea edx, [ebp-74h]
  '0047A98D: push ecx
  '0047A98E: push edx
  '0047A98F: call [00401300h]
  '0047A995: push eax
  '0047A996: call [004012ECh]
  '0047A99C: lea ecx, [ebp-74h]
  '0047A99F: mov [esi+68h], eax
  '0047A9A2: call [00401034h]
  '0047A9A8: mov eax, [esi+6Ch]
  '0047A9AB: add eax, ebx
  '0047A9AD: lea edx, [ebp-000000A4h]
  '0047A9B3: jo 0047ACF1h
  '0047A9B9: mov [esi+74h], eax
  '0047A9BC: mov ecx, [esi+68h]
  '0047A9BF: mov [ebp-0000009Ch], ecx
  '0047A9C5: lea eax, [ebp-34h]
  '0047A9C8: push edx
  '0047A9C9: lea ecx, [ebp-54h]
  '0047A9CC: push eax
  '0047A9CD: mov [ebp-000000A4h], edi
  '0047A9D3: push ecx
  '0047A9D4: call [00401300h]
  '0047A9DA: push eax
  '0047A9DB: call [004012ECh]
  '0047A9E1: lea ecx, [ebp-54h]
  '0047A9E4: mov [esi+70h], eax
  '0047A9E7: call [00401034h]
  '0047A9ED: wait 
  '0047A9EE: push 0047ACD7h
  '0047A9F3: jmp 0047ACC1h
  '0047A9F8: cmp eax, edi
  '0047A9FA: jnz 0047AC93h
  '0047AA00: mov eax, [esi+4Ch]
  '0047AA03: mov edx, [esi+54h]
  '0047AA06: sub edx, eax
  '0047AA08: mov [ebp-000000DCh], eax
  '0047AA0E: jo 0047ACF1h
  '0047AA14: mov [ebp-000000CCh], ecx
  '0047AA1A: mov [ebp-000000D4h], ecx
  '0047AA20: lea eax, [ebp-000000C4h]
  '0047AA26: mov [ebp-000000BCh], edx
  '0047AA2C: lea ecx, [ebp-44h]
  '0047AA2F: push eax
  '0047AA30: lea edx, [ebp-000000A4h]
  '0047AA36: push ecx
  '0047AA37: lea eax, [ebp-54h]
  '0047AA3A: push edx
  '0047AA3B: push eax
  '0047AA3C: mov [ebp-000000C4h], edi
  '0047AA42: mov byte ptr [ebp-0000009Ch], 04h
  '0047AA49: mov [ebp-000000A4h], 00000011h
  '0047AA53: mov [ebp-000000ACh], ebx
  '0047AA59: mov [ebp-000000B4h], edi
  '0047AA5F: mov [ebp-000000E4h], edi
  '0047AA65: call [00401300h]
  '0047AA6B: lea ecx, [ebp-000000B4h]
  '0047AA71: push eax
  '0047AA72: lea edx, [ebp-64h]
  '0047AA75: push ecx
  '0047AA76: push edx
  '0047AA77: call [00401300h]
  '0047AA7D: push eax
  '0047AA7E: lea eax, [ebp-74h]
  '0047AA81: push eax
  '0047AA82: call [00401004h]
  '0047AA88: lea ecx, [ebp-000000D4h]
  '0047AA8E: push eax
  '0047AA8F: lea edx, [ebp-00000084h]
  '0047AA95: push ecx
  '0047AA96: push edx
  '0047AA97: call [00401050h]
  '0047AA9D: push eax
  '0047AA9E: lea eax, [ebp-000000E4h]
  '0047AAA4: lea ecx, [ebp-00000094h]
  '0047AAAA: push eax
  '0047AAAB: push ecx
  '0047AAAC: call [00401300h]
  '0047AAB2: push eax
  '0047AAB3: call [004012ECh]
  '0047AAB9: mov [esi+6Ch], eax
  '0047AABC: lea edx, [ebp-00000094h]
  '0047AAC2: lea eax, [ebp-64h]
  '0047AAC5: push edx
  '0047AAC6: lea ecx, [ebp-54h]
  '0047AAC9: push eax
  '0047AACA: push ecx
  '0047AACB: push edi
  '0047AACC: call [00401058h]
  '0047AAD2: mov eax, [esi+48h]
  '0047AAD5: mov edx, [esi+50h]
  '0047AAD8: add esp, 00000010h
  '0047AADB: sub edx, eax
  '0047AADD: mov ecx, 00000002h
  '0047AAE2: mov [ebp-000000BCh], eax
  '0047AAE8: jo 0047ACF1h
  '0047AAEE: mov [ebp-000000ACh], ecx
  '0047AAF4: mov [ebp-000000B4h], ecx
  '0047AAFA: lea eax, [ebp-000000A4h]
  '0047AB00: mov [ebp-0000009Ch], edx
  '0047AB06: lea ecx, [ebp-34h]
  '0047AB09: push eax
  '0047AB0A: lea edx, [ebp-54h]
  '0047AB0D: push ecx
  '0047AB0E: push edx
  '0047AB0F: mov [ebp-000000A4h], edi
  '0047AB15: mov [ebp-000000C4h], edi
  '0047AB1B: call [00401004h]
  '0047AB21: push eax
  '0047AB22: lea eax, [ebp-000000B4h]
  '0047AB28: lea ecx, [ebp-64h]
  '0047AB2B: push eax
  '0047AB2C: push ecx
  '0047AB2D: call [00401050h]
  '0047AB33: push eax
  '0047AB34: lea edx, [ebp-000000C4h]
  '0047AB3A: lea eax, [ebp-74h]
  '0047AB3D: push edx
  '0047AB3E: push eax
  '0047AB3F: call [00401300h]
  '0047AB45: push eax
  '0047AB46: call [004012ECh]
  '0047AB4C: lea ecx, [ebp-74h]
  '0047AB4F: mov [esi+68h], eax
  '0047AB52: call [00401034h]
  '0047AB58: mov ecx, [esi+6Ch]
  '0047AB5B: lea eax, [ebp-000000A4h]
  '0047AB61: add ecx, ebx
  '0047AB63: mov ebx, [00401300h]
  '0047AB69: jo 0047ACF1h
  '0047AB6F: mov [esi+74h], ecx
  '0047AB72: mov edx, [esi+68h]
  '0047AB75: mov [ebp-0000009Ch], edx
  '0047AB7B: lea ecx, [ebp-34h]
  '0047AB7E: push eax
  '0047AB7F: lea edx, [ebp-54h]
  '0047AB82: push ecx
  '0047AB83: push edx
  '0047AB84: mov [ebp-000000A4h], edi
  '0047AB8A: call ebx
  '0047AB8C: push eax
  '0047AB8D: call [004012ECh]
  '0047AB93: lea ecx, [ebp-54h]
  '0047AB96: mov [esi+70h], eax
  '0047AB99: call [00401034h]
  '0047AB9F: mov eax, [esi+74h]
  '0047ABA2: lea edx, [ebp-000000A4h]
  '0047ABA8: add eax, 00000004h
  '0047ABAB: push edx
  '0047ABAC: jo 0047ACF1h
  '0047ABB2: mov [esi+5Ch], eax
  '0047ABB5: mov eax, [esi+48h]
  '0047ABB8: mov ecx, [esi+50h]
  '0047ABBB: mov [ebp-000000BCh], eax
  '0047ABC1: sub ecx, eax
  '0047ABC3: lea eax, [ebp-24h]
  '0047ABC6: jo 0047ACF1h
  '0047ABCC: mov [ebp-0000009Ch], ecx
  '0047ABD2: mov ecx, 00000002h
  '0047ABD7: mov [ebp-000000ACh], ecx
  '0047ABDD: mov [ebp-000000B4h], ecx
  '0047ABE3: lea ecx, [ebp-54h]
  '0047ABE6: push eax
  '0047ABE7: push ecx
  '0047ABE8: mov [ebp-000000A4h], edi
  '0047ABEE: mov [ebp-000000C4h], edi
  '0047ABF4: call [00401004h]
  '0047ABFA: push eax
  '0047ABFB: lea edx, [ebp-000000B4h]
  '0047AC01: lea eax, [ebp-64h]
  '0047AC04: push edx
  '0047AC05: push eax
  '0047AC06: call [00401050h]
  '0047AC0C: lea ecx, [ebp-000000C4h]
  '0047AC12: push eax
  '0047AC13: lea edx, [ebp-74h]
  '0047AC16: push ecx
  '0047AC17: push edx
  '0047AC18: call ebx
  '0047AC1A: push eax
  '0047AC1B: call [004012ECh]
  '0047AC21: lea ecx, [ebp-74h]
  '0047AC24: mov [esi+58h], eax
  '0047AC27: call [00401034h]
  '0047AC2D: mov eax, [esi+5Ch]
  '0047AC30: lea ecx, [ebp-000000A4h]
  '0047AC36: mov [ebp-0000009Ch], eax
  '0047AC3C: lea edx, [ebp-44h]
  '0047AC3F: push ecx
  '0047AC40: lea eax, [ebp-54h]
  '0047AC43: push edx
  '0047AC44: push eax
  '0047AC45: mov [ebp-000000A4h], edi
  '0047AC4B: call ebx
  '0047AC4D: push eax
  '0047AC4E: call [004012ECh]
  '0047AC54: lea ecx, [ebp-54h]
  '0047AC57: mov [esi+64h], eax
  '0047AC5A: call [00401034h]
  '0047AC60: mov ecx, [esi+58h]
  '0047AC63: lea edx, [ebp-000000A4h]
  '0047AC69: mov [ebp-0000009Ch], ecx
  '0047AC6F: lea eax, [ebp-24h]
  '0047AC72: push edx
  '0047AC73: lea ecx, [ebp-54h]
  '0047AC76: push eax
  '0047AC77: push ecx
  '0047AC78: mov [ebp-000000A4h], edi
  '0047AC7E: call ebx
  '0047AC80: push eax
  '0047AC81: call [004012ECh]
  '0047AC87: lea ecx, [ebp-54h]
  '0047AC8A: mov [esi+60h], eax
  '0047AC8D: call [00401034h]
  '0047AC93: wait 
  '0047AC94: push 0047ACD7h
  '0047AC99: jmp 47ACC1h
  '0047AC9B: lea edx, [ebp-00000094h]
  '0047ACA1: lea eax, [ebp-00000084h]
  '0047ACA7: push edx
  '0047ACA8: lea ecx, [ebp-74h]
  '0047ACAB: push eax
  '0047ACAC: lea edx, [ebp-64h]
  '0047ACAF: push ecx
  '0047ACB0: lea eax, [ebp-54h]
  '0047ACB3: push edx
  '0047ACB4: push eax
  '0047ACB5: push 00000005h
  '0047ACB7: call [00401058h]
  '0047ACBD: add esp, 00000018h
  '0047ACC0: ret 
End Sub
Private Sub ButtonStyle_47C4C0
  '0047C4C0: push ebp
  '0047C4C1: mov ebp, esp
  '0047C4C3: sub esp, 0000000Ch
  '0047C4C6: push 00403796h
  '0047C4CB: mov eax, fs:[00h]
  '0047C4D1: push eax
  '0047C4D2: mov fs:[00000000h], esp
  '0047C4D9: sub esp, 00000020h
  '0047C4DC: push ebx
  '0047C4DD: push esi
  '0047C4DE: push edi
  '0047C4DF: mov [ebp-0Ch], esp
  '0047C4E2: mov [ebp-08h], 00402500h
  '0047C4E9: mov esi, [ebp+08h]
  '0047C4EC: mov eax, esi
  '0047C4EE: and eax, 00000001h
  '0047C4F1: mov [ebp-04h], eax
  '0047C4F4: and esi, FFFFFFFEh
  '0047C4F7: push esi
  '0047C4F8: mov [ebp+08h], esi
  '0047C4FB: mov ecx, [esi]
  '0047C4FD: call [ecx+04h]
  '0047C500: mov edx, [ebp+0Ch]
  '0047C503: xor ebx, ebx
  '0047C505: lea ecx, [ebp-18h]
  '0047C508: mov [ebp-18h], ebx
  '0047C50B: mov [ebp-1Ch], ebx
  '0047C50E: mov [ebp-20h], ebx
  '0047C511: call [004012C4h]
  '0047C517: mov edx, [esi]
  '0047C519: lea eax, [ebp-1Ch]
  '0047C51C: push eax
  '0047C51D: push esi
  '0047C51E: call [edx+00000938h]
  '0047C524: cmp eax, ebx
  '0047C526: fclex 
  '0047C528: jnl 47C540h
  '0047C52A: mov edi, [004010A8h]
  '0047C530: push 00000938h
  '0047C535: push 0041FF7Ch
  '0047C53A: push esi
  '0047C53B: push eax
  '0047C53C: call edi
  '0047C53E: jmp 47C546h
  '0047C540: mov edi, [004010A8h]
  '0047C546: mov eax, [ebp-1Ch]
  '0047C549: mov ecx, [esi+10h]
  '0047C54C: lea edx, [ebp-20h]
  '0047C54F: push eax
  '0047C550: mov [ebp-1Ch], ebx
  '0047C553: mov ebx, [ecx]
  '0047C555: push edx
  '0047C556: call [004010F0h]
  '0047C55C: push eax
  '0047C55D: mov eax, [esi+10h]
  '0047C560: push eax
  '0047C561: call [ebx+0000024Ch]
  '0047C567: test eax, eax
  '0047C569: fclex 
  '0047C56B: jnl 47C57Eh
  '0047C56D: mov ecx, [esi+10h]
  '0047C570: push 0000024Ch
  '0047C575: push 0041FF4Ch
  '0047C57A: push ecx
  '0047C57B: push eax
  '0047C57C: call edi
  '0047C57E: lea ecx, [ebp-20h]
  '0047C581: call [00401388h]
  '0047C587: mov edx, [esi]
  '0047C589: push esi
  '0047C58A: call [edx+000007A4h]
  '0047C590: test eax, eax
  '0047C592: jnl 47C5A2h
  '0047C594: push 000007A4h
  '0047C599: push 0041FF7Ch
  '0047C59E: push esi
  '0047C59F: push eax
  '0047C5A0: call edi
  '0047C5A2: mov [ebp-04h], 00000000h
  '0047C5A9: push 0047C5CEh
  '0047C5AE: jmp 47C5C4h
  '0047C5B0: lea eax, [ebp-20h]
  '0047C5B3: lea ecx, [ebp-1Ch]
  '0047C5B6: push eax
  '0047C5B7: push ecx
  '0047C5B8: push 00000002h
  '0047C5BA: call [0040106Ch]
  '0047C5C0: add esp, 0000000Ch
  '0047C5C3: ret 
End Sub
Private Sub PicturePosition_47CB10
  '0047CB10: sub esp, 00000068h
  '0047CB13: push ebx
  '0047CB14: push ebp
  '0047CB15: push esi
  '0047CB16: push edi
  '0047CB17: mov ecx, 00000006h
  '0047CB1C: xor eax, eax
  '0047CB1E: lea edi, [esp+60h]
  '0047CB22: mov ebx, [esp+00000088h]
  '0047CB29: rep stosd 
  '0047CB2B: mov ecx, 00000006h
  '0047CB30: lea edi, [esp+48h]
  '0047CB34: rep stosd 
  '0047CB36: mov ecx, 00000006h
  '0047CB3B: lea edi, [esp+30h]
  '0047CB3F: rep stosd 
  '0047CB41: mov cx, [ebx]
  '0047CB44: mov eax, [esp+00000080h]
  '0047CB4B: xor edx, edx
  '0047CB4D: mov esi, [esp+7Ch]
  '0047CB51: mov eax, [eax]
  '0047CB53: mov byte ptr [esp+13h], 00h
  '0047CB58: neg cx
  '0047CB5B: jo 0047CEC7h
  '0047CB61: mov [ebx], cx
  '0047CB64: mov ecx, [esp+00000084h]
  '0047CB6B: mov [esp+14h], edx
  '0047CB6F: mov [esp+20h], edx
  '0047CB73: mov di, [ecx]
  '0047CB76: mov [esp+1Ch], edx
  '0047CB7A: cmp di, dx
  '0047CB7D: mov [esp+24h], edx
  '0047CB81: jl 0047CCB2h
  '0047CB87: jmp 47CB8Dh
  '0047CB89: mov eax, [esp+18h]
  '0047CB8D: mov edx, [esi]
  '0047CB8F: lea ecx, [esp+14h]
  '0047CB93: push ecx
  '0047CB94: movsx ecx, word ptr [ebx]
  '0047CB97: push ecx
  '0047CB98: push eax
  '0047CB99: push esi
  '0047CB9A: call [edx+0000091Ch]
  '0047CBA0: mov eax, [esi]
  '0047CBA2: lea ecx, [esp+14h]
  '0047CBA6: mov edx, [esp+14h]
  '0047CBAA: push ecx
  '0047CBAB: push esi
  '0047CBAC: mov [esp+20h], edx
  '0047CBB0: call [eax+000000D8h]
  '0047CBB6: test eax, eax
  '0047CBB8: fclex 
  '0047CBBA: jnl 47CBD2h
  '0047CBBC: mov ebp, [004010A8h]
  '0047CBC2: push 000000D8h
  '0047CBC7: push 0041FF4Ch
  '0047CBCC: push esi
  '0047CBCD: push eax
  '0047CBCE: call ebp
  '0047CBD0: jmp 47CBD8h
  '0047CBD2: mov ebp, [004010A8h]
  '0047CBD8: mov edx, [esi]
  '0047CBDA: lea eax, [esp+20h]
  '0047CBDE: push eax
  '0047CBDF: push esi
  '0047CBE0: call [edx+00000100h]
  '0047CBE6: test eax, eax
  '0047CBE8: fclex 
  '0047CBEA: jnl 47CBFAh
  '0047CBEC: push 00000100h
  '0047CBF1: push 0041FF4Ch
  '0047CBF6: push esi
  '0047CBF7: push eax
  '0047CBF8: call ebp
  '0047CBFA: mov ecx, [esi]
  '0047CBFC: lea edx, [esp+1Ch]
  '0047CC00: push edx
  '0047CC01: push esi
  '0047CC02: call [ecx+00000108h]
  '0047CC08: test eax, eax
  '0047CC0A: fclex 
  '0047CC0C: jnl 47CC1Ch
  '0047CC0E: push 00000108h
  '0047CC13: push 0041FF4Ch
  '0047CC18: push esi
  '0047CC19: push eax
  '0047CC1A: call ebp
  '0047CC1C: xor ecx, ecx
  '0047CC1E: call [004011F4h]
  '0047CC24: movsx ecx, di
  '0047CC27: mov [esp+7Ch], ecx
  '0047CC2B: mov [esp+13h], al
  '0047CC2F: fild dword ptr [esp+7Ch]
  '0047CC33: mov eax, [esp+14h]
  '0047CC37: mov ebp, [esi]
  '0047CC39: mov [esp+24h], eax
  '0047CC3D: mov eax, [esp+18h]
  '0047CC41: fstp real4 ptr [esp+28h]
  '0047CC45: fld real4 ptr [esp+1Ch]
  '0047CC49: fsub real4 ptr [esp+28h]
  '0047CC4D: lea edx, [esp+13h]
  '0047CC51: push edx
  '0047CC52: push eax
  '0047CC53: fstsw ax
  '0047CC55: test al, 0Dh
  '0047CC57: jnz 0047CEC2h
  '0047CC5D: call [00401320h]
  '0047CC63: fild dword ptr [esp+00000084h]
  '0047CC6A: push eax
  '0047CC6B: fstp real4 ptr [esp+34h]
  '0047CC6F: fld real4 ptr [esp+2Ch]
  '0047CC73: fsub real4 ptr [esp+34h]
  '0047CC77: fstsw ax
  '0047CC79: test al, 0Dh
  '0047CC7B: jnz 0047CEC2h
  '0047CC81: call [00401320h]
  '0047CC87: push eax
  '0047CC88: mov eax, [esp+0000008Ch]
  '0047CC8F: push eax
  '0047CC90: lea ecx, [esp+38h]
  '0047CC94: push eax
  '0047CC95: push ecx
  '0047CC96: push esi
  '0047CC97: call [ebp+00000924h]
  '0047CC9D: sub di, 0001h
  '0047CCA1: jo 0047CEC7h
  '0047CCA7: test di, di
  '0047CCAA: jnl 0047CB89h
  '0047CCB0: xor edx, edx
  '0047CCB2: mov ax, [ebx]
  '0047CCB5: mov ecx, [esp+00000084h]
  '0047CCBC: neg ax
  '0047CCBF: jo 0047CEC7h
  '0047CCC5: mov [ebx], ax
  '0047CCC8: mov bp, [ecx]
  '0047CCCB: cmp bp, dx
  '0047CCCE: jl 0047CEB6h
  '0047CCD4: jmp 47CCDDh
  '0047CCD6: mov ebx, [esp+00000088h]
  '0047CCDD: mov ecx, [esp+00000080h]
  '0047CCE4: mov edx, [esi]
  '0047CCE6: mov edi, [00401318h]
  '0047CCEC: lea eax, [esp+60h]
  '0047CCF0: push eax
  '0047CCF1: push ecx
  '0047CCF2: push esi
  '0047CCF3: call [edx+00000914h]
  '0047CCF9: mov edx, [esi]
  '0047CCFB: lea eax, [esp+48h]
  '0047CCFF: mov ecx, [esp+00000080h]
  '0047CD06: push eax
  '0047CD07: push ecx
  '0047CD08: push esi
  '0047CD09: call [edx+00000914h]
  '0047CD0F: mov edx, [esi]
  '0047CD11: lea eax, [esp+30h]
  '0047CD15: mov ecx, [esp+00000080h]
  '0047CD1C: push eax
  '0047CD1D: push ecx
  '0047CD1E: push esi
  '0047CD1F: call [edx+00000914h]
  '0047CD25: movsx edx, word ptr [ebx]
  '0047CD28: mov [esp+00000084h], edx
  '0047CD2F: fild dword ptr [esp+00000084h]
  '0047CD36: fstp real8 ptr [esp+28h]
  '0047CD3A: fld real8 ptr [esp+28h]
  '0047CD3E: fadd real8 ptr [esp+40h]
  '0047CD42: fstsw ax
  '0047CD44: test al, 0Dh
  '0047CD46: jnz 0047CEC2h
  '0047CD4C: call edi
  '0047CD4E: push eax
  '0047CD4F: movsx eax, word ptr [ebx]
  '0047CD52: mov [esp+00000088h], eax
  '0047CD59: fild dword ptr [esp+00000088h]
  '0047CD60: fstp real8 ptr [esp+2Ch]
  '0047CD64: fld real8 ptr [esp+2Ch]
  '0047CD68: fadd real8 ptr [esp+54h]
  '0047CD6C: fstsw ax
  '0047CD6E: test al, 0Dh
  '0047CD70: jnz 0047CEC2h
  '0047CD76: call edi
  '0047CD78: movsx ecx, word ptr [ebx]
  '0047CD7B: mov [esp+00000088h], ecx
  '0047CD82: push eax
  '0047CD83: fild dword ptr [esp+0000008Ch]
  '0047CD8A: fstp real8 ptr [esp+30h]
  '0047CD8E: fld real8 ptr [esp+30h]
  '0047CD92: fadd real8 ptr [esp+68h]
  '0047CD96: fstsw ax
  '0047CD98: test al, 0Dh
  '0047CD9A: jnz 0047CEC2h
  '0047CDA0: call edi
  '0047CDA2: push eax
  '0047CDA3: call [00401044h]
  '0047CDA9: lea ecx, [esp+14h]
  '0047CDAD: mov edx, [esp+00000080h]
  '0047CDB4: push ecx
  '0047CDB5: push esi
  '0047CDB6: mov [edx], eax
  '0047CDB8: mov eax, [esi]
  '0047CDBA: call [eax+00000100h]
  '0047CDC0: test eax, eax
  '0047CDC2: fclex 
  '0047CDC4: jnl 47CDD8h
  '0047CDC6: push 00000100h
  '0047CDCB: push 0041FF4Ch
  '0047CDD0: push esi
  '0047CDD1: push eax
  '0047CDD2: call [004010A8h]
  '0047CDD8: mov edx, [esp+00000080h]
  '0047CDDF: mov cx, bp
  '0047CDE2: add cx, 0001h
  '0047CDE6: mov ebx, [esi]
  '0047CDE8: mov eax, [edx]
  '0047CDEA: jo 0047CEC7h
  '0047CDF0: movsx edx, cx
  '0047CDF3: mov [esp+00000084h], edx
  '0047CDFA: push eax
  '0047CDFB: fild dword ptr [esp+00000088h]
  '0047CE02: movsx edi, bp
  '0047CE05: fstp real4 ptr [esp+00000088h]
  '0047CE0C: fld real4 ptr [esp+18h]
  '0047CE10: fsub real4 ptr [esp+00000088h]
  '0047CE17: push edi
  '0047CE18: fstsw ax
  '0047CE1A: test al, 0Dh
  '0047CE1C: jnz 0047CEC2h
  '0047CE22: call [00401320h]
  '0047CE28: push eax
  '0047CE29: push edi
  '0047CE2A: push edi
  '0047CE2B: push esi
  '0047CE2C: call [ebx+00000920h]
  '0047CE32: mov eax, [esi]
  '0047CE34: lea ecx, [esp+14h]
  '0047CE38: push ecx
  '0047CE39: push esi
  '0047CE3A: call [eax+00000108h]
  '0047CE40: test eax, eax
  '0047CE42: fclex 
  '0047CE44: jnl 47CE58h
  '0047CE46: push 00000108h
  '0047CE4B: push 0041FF4Ch
  '0047CE50: push esi
  '0047CE51: push eax
  '0047CE52: call [004010A8h]
  '0047CE58: mov edx, [esp+00000080h]
  '0047CE5F: mov cx, bp
  '0047CE62: add cx, 0001h
  '0047CE66: mov ebx, [esi]
  '0047CE68: mov eax, [edx]
  '0047CE6A: jo 47CEC7h
  '0047CE6C: movsx edx, cx
  '0047CE6F: mov [esp+00000084h], edx
  '0047CE76: push eax
  '0047CE77: fild dword ptr [esp+00000088h]
  '0047CE7E: fstp real4 ptr [esp+00000088h]
  '0047CE85: fld real4 ptr [esp+18h]
  '0047CE89: fsub real4 ptr [esp+00000088h]
  '0047CE90: fstsw ax
  '0047CE92: test al, 0Dh
  '0047CE94: jnz 47CEC2h
  '0047CE96: call [00401320h]
  '0047CE9C: push eax
  '0047CE9D: push edi
  '0047CE9E: push edi
  '0047CE9F: push edi
  '0047CEA0: push esi
  '0047CEA1: call [ebx+00000920h]
  '0047CEA7: sub bp, 0001h
  '0047CEAB: jo 47CEC7h
  '0047CEAD: test bp, bp
  '0047CEB0: jnl 0047CCD6h
  '0047CEB6: pop edi
  '0047CEB7: pop esi
  '0047CEB8: pop ebp
  '0047CEB9: xor eax, eax
  '0047CEBB: pop ebx
  '0047CEBC: add esp, 00000068h
  '0047CEBF: retn 0010h
End Sub
Private Sub PicturePosition_47CED0
  '0047CED0: sub esp, 00000078h
  '0047CED3: push ebx
  '0047CED4: push ebp
  '0047CED5: push esi
  '0047CED6: push edi
  '0047CED7: mov ecx, 00000006h
  '0047CEDC: xor eax, eax
  '0047CEDE: lea edi, [esp+40h]
  '0047CEE2: mov esi, [esp+0000008Ch]
  '0047CEE9: rep stosd 
  '0047CEEB: mov ecx, 00000006h
  '0047CEF0: lea edi, [esp+58h]
  '0047CEF4: rep stosd 
  '0047CEF6: mov ecx, 00000006h
  '0047CEFB: lea edi, [esp+70h]
  '0047CEFF: rep stosd 
  '0047CF01: mov eax, [esp+00000090h]
  '0047CF08: mov ebx, [esp+00000098h]
  '0047CF0F: xor edx, edx
  '0047CF11: mov byte ptr [esp+13h], 00h
  '0047CF16: mov ecx, [eax]
  '0047CF18: mov eax, [esp+00000094h]
  '0047CF1F: mov [esp+14h], edx
  '0047CF23: mov [esp+28h], edx
  '0047CF27: mov di, [eax]
  '0047CF2A: mov [esp+24h], edx
  '0047CF2E: cmp di, dx
  '0047CF31: mov [esp+2Ch], edx
  '0047CF35: mov [esp+18h], ecx
  '0047CF39: jl 0047D10Bh
  '0047CF3F: mov ecx, [esi]
  '0047CF41: mov ebp, [00401318h]
  '0047CF47: lea edx, [esp+40h]
  '0047CF4B: lea eax, [esp+18h]
  '0047CF4F: push edx
  '0047CF50: push eax
  '0047CF51: push esi
  '0047CF52: call [ecx+00000914h]
  '0047CF58: movsx ecx, word ptr [ebx]
  '0047CF5B: mov [esp+1Ch], ecx
  '0047CF5F: fild dword ptr [esp+1Ch]
  '0047CF63: fstp real8 ptr [esp+38h]
  '0047CF67: fld real8 ptr [esp+38h]
  '0047CF6B: fadd real8 ptr [esp+40h]
  '0047CF6F: fstsw ax
  '0047CF71: test al, 0Dh
  '0047CF73: jnz 0047D258h
  '0047CF79: call ebp
  '0047CF7B: mov edx, [esi]
  '0047CF7D: mov [esp+38h], eax
  '0047CF81: lea eax, [esp+58h]
  '0047CF85: lea ecx, [esp+18h]
  '0047CF89: push eax
  '0047CF8A: push ecx
  '0047CF8B: push esi
  '0047CF8C: call [edx+00000914h]
  '0047CF92: movsx edx, word ptr [ebx]
  '0047CF95: mov [esp+1Ch], edx
  '0047CF99: fild dword ptr [esp+1Ch]
  '0047CF9D: fstp real8 ptr [esp+30h]
  '0047CFA1: fld real8 ptr [esp+30h]
  '0047CFA5: fadd real8 ptr [esp+60h]
  '0047CFA9: fstsw ax
  '0047CFAB: test al, 0Dh
  '0047CFAD: jnz 0047D258h
  '0047CFB3: call ebp
  '0047CFB5: lea ecx, [esp+70h]
  '0047CFB9: lea edx, [esp+18h]
  '0047CFBD: mov [esp+30h], eax
  '0047CFC1: mov eax, [esi]
  '0047CFC3: push ecx
  '0047CFC4: push edx
  '0047CFC5: push esi
  '0047CFC6: call [eax+00000914h]
  '0047CFCC: movsx eax, word ptr [ebx]
  '0047CFCF: mov [esp+1Ch], eax
  '0047CFD3: fild dword ptr [esp+1Ch]
  '0047CFD7: fstp real8 ptr [esp+1Ch]
  '0047CFDB: fld real8 ptr [esp+1Ch]
  '0047CFDF: fadd real8 ptr [esp+00000080h]
  '0047CFE6: fstsw ax
  '0047CFE8: test al, 0Dh
  '0047CFEA: jnz 0047D258h
  '0047CFF0: call ebp
  '0047CFF2: mov ecx, [esp+30h]
  '0047CFF6: mov edx, [esp+38h]
  '0047CFFA: push eax
  '0047CFFB: push ecx
  '0047CFFC: push edx
  '0047CFFD: call [00401044h]
  '0047D003: lea ecx, [esp+14h]
  '0047D007: mov [esp+18h], eax
  '0047D00B: mov eax, [esi]
  '0047D00D: push ecx
  '0047D00E: push esi
  '0047D00F: call [eax+000000D8h]
  '0047D015: test eax, eax
  '0047D017: fclex 
  '0047D019: jnl 47D031h
  '0047D01B: mov ebp, [004010A8h]
  '0047D021: push 000000D8h
  '0047D026: push 0041FF4Ch
  '0047D02B: push esi
  '0047D02C: push eax
  '0047D02D: call ebp
  '0047D02F: jmp 47D037h
  '0047D031: mov ebp, [004010A8h]
  '0047D037: mov edx, [esi]
  '0047D039: lea eax, [esp+28h]
  '0047D03D: push eax
  '0047D03E: push esi
  '0047D03F: call [edx+00000100h]
  '0047D045: test eax, eax
  '0047D047: fclex 
  '0047D049: jnl 47D059h
  '0047D04B: push 00000100h
  '0047D050: push 0041FF4Ch
  '0047D055: push esi
  '0047D056: push eax
  '0047D057: call ebp
  '0047D059: mov ecx, [esi]
  '0047D05B: lea edx, [esp+24h]
  '0047D05F: push edx
  '0047D060: push esi
  '0047D061: call [ecx+00000108h]
  '0047D067: test eax, eax
  '0047D069: fclex 
  '0047D06B: jnl 47D07Bh
  '0047D06D: push 00000108h
  '0047D072: push 0041FF4Ch
  '0047D077: push esi
  '0047D078: push eax
  '0047D079: call ebp
  '0047D07B: xor ecx, ecx
  '0047D07D: call [004011F4h]
  '0047D083: movsx ecx, di
  '0047D086: mov [esp+1Ch], ecx
  '0047D08A: mov [esp+13h], al
  '0047D08E: fild dword ptr [esp+1Ch]
  '0047D092: mov eax, [esp+14h]
  '0047D096: mov ebp, [esi]
  '0047D098: mov [esp+2Ch], eax
  '0047D09C: mov eax, [esp+18h]
  '0047D0A0: fstp real4 ptr [esp+38h]
  '0047D0A4: fld real4 ptr [esp+24h]
  '0047D0A8: fsub real4 ptr [esp+38h]
  '0047D0AC: lea edx, [esp+13h]
  '0047D0B0: push edx
  '0047D0B1: push eax
  '0047D0B2: fstsw ax
  '0047D0B4: test al, 0Dh
  '0047D0B6: jnz 0047D258h
  '0047D0BC: call [00401320h]
  '0047D0C2: fild dword ptr [esp+24h]
  '0047D0C6: push eax
  '0047D0C7: fstp real4 ptr [esp+44h]
  '0047D0CB: fld real4 ptr [esp+34h]
  '0047D0CF: fsub real4 ptr [esp+44h]
  '0047D0D3: fstsw ax
  '0047D0D5: test al, 0Dh
  '0047D0D7: jnz 0047D258h
  '0047D0DD: call [00401320h]
  '0047D0E3: push eax
  '0047D0E4: mov eax, [esp+2Ch]
  '0047D0E8: push eax
  '0047D0E9: lea ecx, [esp+40h]
  '0047D0ED: push eax
  '0047D0EE: push ecx
  '0047D0EF: push esi
  '0047D0F0: call [ebp+00000924h]
  '0047D0F6: sub di, 0001h
  '0047D0FA: jo 0047D25Dh
  '0047D100: test di, di
  '0047D103: jnl 0047CF3Fh
  '0047D109: xor edx, edx
  '0047D10B: mov ax, [ebx]
  '0047D10E: mov ecx, [esp+00000094h]
  '0047D115: neg ax
  '0047D118: jo 0047D25Dh
  '0047D11E: mov [ebx], ax
  '0047D121: mov bp, [ecx]
  '0047D124: cmp bp, dx
  '0047D127: jl 0047D24Ch
  '0047D12D: jmp 47D136h
  '0047D12F: mov ebx, [esp+00000098h]
  '0047D136: movsx ecx, word ptr [ebx]
  '0047D139: mov edx, [esi]
  '0047D13B: lea eax, [esp+14h]
  '0047D13F: push eax
  '0047D140: mov eax, [esp+00000094h]
  '0047D147: push ecx
  '0047D148: mov ecx, [eax]
  '0047D14A: push ecx
  '0047D14B: push esi
  '0047D14C: call [edx+0000091Ch]
  '0047D152: lea ecx, [esp+14h]
  '0047D156: mov ebx, [esp+00000090h]
  '0047D15D: mov edx, [esp+14h]
  '0047D161: push ecx
  '0047D162: push esi
  '0047D163: mov [ebx], edx
  '0047D165: mov eax, [esi]
  '0047D167: call [eax+00000100h]
  '0047D16D: test eax, eax
  '0047D16F: fclex 
  '0047D171: jnl 47D185h
  '0047D173: push 00000100h
  '0047D178: push 0041FF4Ch
  '0047D17D: push esi
  '0047D17E: push eax
  '0047D17F: call [004010A8h]
  '0047D185: mov eax, [ebx]
  '0047D187: mov cx, bp
  '0047D18A: add cx, 0001h
  '0047D18E: push eax
  '0047D18F: jo 0047D25Dh
  '0047D195: movsx eax, cx
  '0047D198: mov [esp+3Ch], eax
  '0047D19C: mov edx, [esi]
  '0047D19E: fild dword ptr [esp+3Ch]
  '0047D1A2: movsx edi, bp
  '0047D1A5: fstp real4 ptr [esp+3Ch]
  '0047D1A9: fld real4 ptr [esp+18h]
  '0047D1AD: fsub real4 ptr [esp+3Ch]
  '0047D1B1: push edi
  '0047D1B2: mov [esp+40h], edx
  '0047D1B6: fstsw ax
  '0047D1B8: test al, 0Dh
  '0047D1BA: jnz 0047D258h
  '0047D1C0: call [00401320h]
  '0047D1C6: mov ecx, [esp+40h]
  '0047D1CA: push eax
  '0047D1CB: push edi
  '0047D1CC: push edi
  '0047D1CD: push esi
  '0047D1CE: call [ecx+00000920h]
  '0047D1D4: mov edx, [esi]
  '0047D1D6: lea eax, [esp+14h]
  '0047D1DA: push eax
  '0047D1DB: push esi
  '0047D1DC: call [edx+00000108h]
  '0047D1E2: test eax, eax
  '0047D1E4: fclex 
  '0047D1E6: jnl 47D1FAh
  '0047D1E8: push 00000108h
  '0047D1ED: push 0041FF4Ch
  '0047D1F2: push esi
  '0047D1F3: push eax
  '0047D1F4: call [004010A8h]
  '0047D1FA: mov ecx, [esp+00000090h]
  '0047D201: mov ax, bp
  '0047D204: add ax, 0001h
  '0047D208: mov ebx, [esi]
  '0047D20A: mov edx, [ecx]
  '0047D20C: jo 47D25Dh
  '0047D20E: movsx ecx, ax
  '0047D211: mov [esp+38h], ecx
  '0047D215: push edx
  '0047D216: fild dword ptr [esp+3Ch]
  '0047D21A: fstp real4 ptr [esp+3Ch]
  '0047D21E: fld real4 ptr [esp+18h]
  '0047D222: fsub real4 ptr [esp+3Ch]
  '0047D226: fstsw ax
  '0047D228: test al, 0Dh
  '0047D22A: jnz 47D258h
  '0047D22C: call [00401320h]
  '0047D232: push eax
  '0047D233: push edi
  '0047D234: push edi
  '0047D235: push edi
  '0047D236: push esi
  '0047D237: call [ebx+00000920h]
  '0047D23D: sub bp, 0001h
  '0047D241: jo 47D25Dh
  '0047D243: test bp, bp
  '0047D246: jnl 0047D12Fh
  '0047D24C: pop edi
  '0047D24D: pop esi
  '0047D24E: pop ebp
  '0047D24F: xor eax, eax
  '0047D251: pop ebx
  '0047D252: add esp, 00000078h
  '0047D255: retn 0010h
End Sub
Private Sub Picture_47D270
  '0047D270: sub esp, 00000018h
  '0047D273: mov eax, [esp+24h]
  '0047D277: push ebx
  '0047D278: xor ebx, ebx
  '0047D27A: push esi
  '0047D27B: cmp word ptr [eax], 0002h
  '0047D27F: mov esi, [esp+24h]
  '0047D283: push edi
  '0047D284: mov [esp+14h], ebx
  '0047D288: mov [esp+20h], ebx
  '0047D28C: mov [esp+0Ch], ebx
  '0047D290: mov [esp+10h], ebx
  '0047D294: mov [esp+18h], ebx
  '0047D298: mov [esp+1Ch], ebx
  '0047D29C: jnl 0047D4F1h
  '0047D2A2: mov ecx, [esi]
  '0047D2A4: lea edx, [esp+0Ch]
  '0047D2A8: push edx
  '0047D2A9: push esi
  '0047D2AA: call [ecx+000000D8h]
  '0047D2B0: mov edi, [004010A8h]
  '0047D2B6: cmp eax, ebx
  '0047D2B8: fclex 
  '0047D2BA: jnl 47D2CAh
  '0047D2BC: push 000000D8h
  '0047D2C1: push 0041FF4Ch
  '0047D2C6: push esi
  '0047D2C7: push eax
  '0047D2C8: call edi
  '0047D2CA: mov eax, [esi]
  '0047D2CC: lea ecx, [esp+10h]
  '0047D2D0: push ecx
  '0047D2D1: push esi
  '0047D2D2: call [eax+00000100h]
  '0047D2D8: cmp eax, ebx
  '0047D2DA: fclex 
  '0047D2DC: jnl 47D2ECh
  '0047D2DE: push 00000100h
  '0047D2E3: push 0041FF4Ch
  '0047D2E8: push esi
  '0047D2E9: push eax
  '0047D2EA: call edi
  '0047D2EC: mov edx, [esi]
  '0047D2EE: lea eax, [esp+18h]
  '0047D2F2: push eax
  '0047D2F3: push esi
  '0047D2F4: call [edx+00000108h]
  '0047D2FA: cmp eax, ebx
  '0047D2FC: fclex 
  '0047D2FE: jnl 47D30Eh
  '0047D300: push 00000108h
  '0047D305: push 0041FF4Ch
  '0047D30A: push esi
  '0047D30B: push eax
  '0047D30C: call edi
  '0047D30E: fld real4 ptr [esp+18h]
  '0047D312: fsub real4 ptr [00402428h]
  '0047D318: mov ecx, [esp+0Ch]
  '0047D31C: lea edx, [esp+14h]
  '0047D320: push ebp
  '0047D321: mov ebp, [00401320h]
  '0047D327: push edx
  '0047D328: mov [esp+1Ch], bl
  '0047D32C: mov ebx, [esi]
  '0047D32E: push 80000010h
  '0047D333: fstsw ax
  '0047D335: test al, 0Dh
  '0047D337: jnz 0047D590h
  '0047D33D: mov [esp+28h], ecx
  '0047D341: call ebp
  '0047D343: fld real4 ptr [esp+1Ch]
  '0047D347: fsub real4 ptr [00402428h]
  '0047D34D: push eax
  '0047D34E: fstsw ax
  '0047D350: test al, 0Dh
  '0047D352: jnz 0047D590h
  '0047D358: call ebp
  '0047D35A: push eax
  '0047D35B: push 00000000h
  '0047D35D: lea eax, [esp+34h]
  '0047D361: push 00000000h
  '0047D363: push eax
  '0047D364: push esi
  '0047D365: call [ebx+00000924h]
  '0047D36B: mov ecx, [esi]
  '0047D36D: lea edx, [esp+10h]
  '0047D371: push edx
  '0047D372: push esi
  '0047D373: call [ecx+000000D8h]
  '0047D379: test eax, eax
  '0047D37B: fclex 
  '0047D37D: jnl 47D38Dh
  '0047D37F: push 000000D8h
  '0047D384: push 0041FF4Ch
  '0047D389: push esi
  '0047D38A: push eax
  '0047D38B: call edi
  '0047D38D: mov eax, [esi]
  '0047D38F: lea ecx, [esp+14h]
  '0047D393: push ecx
  '0047D394: push esi
  '0047D395: call [eax+00000100h]
  '0047D39B: test eax, eax
  '0047D39D: fclex 
  '0047D39F: jnl 47D3AFh
  '0047D3A1: push 00000100h
  '0047D3A6: push 0041FF4Ch
  '0047D3AB: push esi
  '0047D3AC: push eax
  '0047D3AD: call edi
  '0047D3AF: mov edx, [esi]
  '0047D3B1: lea eax, [esp+1Ch]
  '0047D3B5: push eax
  '0047D3B6: push esi
  '0047D3B7: call [edx+00000108h]
  '0047D3BD: test eax, eax
  '0047D3BF: fclex 
  '0047D3C1: jnl 47D3D1h
  '0047D3C3: push 00000108h
  '0047D3C8: push 0041FF4Ch
  '0047D3CD: push esi
  '0047D3CE: push eax
  '0047D3CF: call edi
  '0047D3D1: fld real4 ptr [esp+1Ch]
  '0047D3D5: fadd real4 ptr [00402428h]
  '0047D3DB: mov ecx, [esp+10h]
  '0047D3DF: mov ebx, [esi]
  '0047D3E1: lea edx, [esp+18h]
  '0047D3E5: mov byte ptr [esp+18h], 00h
  '0047D3EA: push edx
  '0047D3EB: push 80000014h
  '0047D3F0: fstsw ax
  '0047D3F2: test al, 0Dh
  '0047D3F4: jnz 0047D590h
  '0047D3FA: mov [esp+28h], ecx
  '0047D3FE: call ebp
  '0047D400: fld real4 ptr [esp+1Ch]
  '0047D404: fadd real4 ptr [00402428h]
  '0047D40A: push eax
  '0047D40B: fstsw ax
  '0047D40D: test al, 0Dh
  '0047D40F: jnz 0047D590h
  '0047D415: call ebp
  '0047D417: push eax
  '0047D418: push 00000000h
  '0047D41A: lea eax, [esp+34h]
  '0047D41E: push 00000000h
  '0047D420: push eax
  '0047D421: push esi
  '0047D422: call [ebx+00000924h]
  '0047D428: mov ecx, [esi]
  '0047D42A: lea edx, [esp+10h]
  '0047D42E: push edx
  '0047D42F: push esi
  '0047D430: call [ecx+000000D8h]
  '0047D436: test eax, eax
  '0047D438: fclex 
  '0047D43A: jnl 47D44Ah
  '0047D43C: push 000000D8h
  '0047D441: push 0041FF4Ch
  '0047D446: push esi
  '0047D447: push eax
  '0047D448: call edi
  '0047D44A: mov eax, [esi]
  '0047D44C: lea ecx, [esp+14h]
  '0047D450: push ecx
  '0047D451: push esi
  '0047D452: call [eax+00000100h]
  '0047D458: test eax, eax
  '0047D45A: fclex 
  '0047D45C: jnl 47D46Ch
  '0047D45E: push 00000100h
  '0047D463: push 0041FF4Ch
  '0047D468: push esi
  '0047D469: push eax
  '0047D46A: call edi
  '0047D46C: mov edx, [esi]
  '0047D46E: lea eax, [esp+1Ch]
  '0047D472: push eax
  '0047D473: push esi
  '0047D474: call [edx+00000108h]
  '0047D47A: test eax, eax
  '0047D47C: fclex 
  '0047D47E: jnl 47D48Eh
  '0047D480: push 00000108h
  '0047D485: push 0041FF4Ch
  '0047D48A: push esi
  '0047D48B: push eax
  '0047D48C: call edi
  '0047D48E: fld real4 ptr [esp+1Ch]
  '0047D492: fadd real4 ptr [00402428h]
  '0047D498: mov ecx, [esp+10h]
  '0047D49C: mov edi, [esi]
  '0047D49E: lea edx, [esp+18h]
  '0047D4A2: mov byte ptr [esp+18h], 00h
  '0047D4A7: push edx
  '0047D4A8: push 80000015h
  '0047D4AD: fstsw ax
  '0047D4AF: test al, 0Dh
  '0047D4B1: jnz 0047D590h
  '0047D4B7: mov [esp+28h], ecx
  '0047D4BB: call ebp
  '0047D4BD: fld real4 ptr [esp+1Ch]
  '0047D4C1: fadd real4 ptr [00402428h]
  '0047D4C7: push eax
  '0047D4C8: fstsw ax
  '0047D4CA: test al, 0Dh
  '0047D4CC: jnz 0047D590h
  '0047D4D2: call ebp
  '0047D4D4: push eax
  '0047D4D5: push FFFFFFFFh
  '0047D4D7: lea eax, [esp+34h]
  '0047D4DB: push FFFFFFFFh
  '0047D4DD: push eax
  '0047D4DE: push esi
  '0047D4DF: call [edi+00000924h]
  '0047D4E5: pop ebp
  '0047D4E6: pop edi
  '0047D4E7: pop esi
  '0047D4E8: xor eax, eax
  '0047D4EA: pop ebx
  '0047D4EB: add esp, 00000018h
  '0047D4EE: retn 0010h
End Sub
Private Sub Picture_47D5A0
  '0047D5A0: sub esp, 00000040h
  '0047D5A3: push ebx
  '0047D5A4: push ebp
  '0047D5A5: push esi
  '0047D5A6: mov esi, [esp+50h]
  '0047D5AA: push edi
  '0047D5AB: mov ecx, 00000006h
  '0047D5B0: xor eax, eax
  '0047D5B2: lea edi, [esp+20h]
  '0047D5B6: rep stosd 
  '0047D5B8: mov ecx, 00000006h
  '0047D5BD: lea edi, [esp+38h]
  '0047D5C1: rep stosd 
  '0047D5C3: mov eax, [esi+000000C0h]
  '0047D5C9: xor ebx, ebx
  '0047D5CB: cmp eax, 00000003h
  '0047D5CE: mov [esp+14h], ebx
  '0047D5D2: mov [esp+10h], ebx
  '0047D5D6: mov [esp+18h], ebx
  '0047D5DA: mov [esp+1Ch], ebx
  '0047D5DE: jz 0047D86Eh
  '0047D5E4: mov edi, [004010A8h]
  '0047D5EA: cmp eax, 00000002h
  '0047D5ED: jnz 47D632h
  '0047D5EF: cmp [esi+000000E9h], bl
  '0047D5F5: jnz 47D60Ch
  '0047D5F7: cmp word ptr [esi+00000106h], FFFFh
  '0047D5FF: jnz 47D60Ch
  '0047D601: mov eax, [esi]
  '0047D603: push esi
  '0047D604: call [eax+0000090Ch]
  '0047D60A: jmp 47D645h
  '0047D60C: mov eax, [esi+10h]
  '0047D60F: mov edx, [esi+0000011Ch]
  '0047D615: push edx
  '0047D616: push eax
  '0047D617: mov ecx, [eax]
  '0047D619: call [ecx+64h]
  '0047D61C: cmp eax, ebx
  '0047D61E: fclex 
  '0047D620: jnl 47D645h
  '0047D622: mov ecx, [esi+10h]
  '0047D625: push 00000064h
  '0047D627: push 0041FF4Ch
  '0047D62C: push ecx
  '0047D62D: push eax
  '0047D62E: call edi
  '0047D630: jmp 47D645h
  '0047D632: cmp word ptr [esi+00000106h], FFFFh
  '0047D63A: jnz 47D645h
  '0047D63C: mov edx, [esi]
  '0047D63E: push esi
  '0047D63F: call [edx+0000090Ch]
  '0047D645: cmp [esi+000000C0h], 00000002h
  '0047D64C: jnz 0047D86Eh
  '0047D652: mov eax, [esi]
  '0047D654: lea ecx, [esp+18h]
  '0047D658: lea edx, [esp+10h]
  '0047D65C: push ecx
  '0047D65D: push edx
  '0047D65E: push esi
  '0047D65F: mov [esp+1Ch], 8000000Dh
  '0047D667: call [eax+00000918h]
  '0047D66D: mov ecx, [esi]
  '0047D66F: lea edx, [esp+38h]
  '0047D673: mov eax, [esp+18h]
  '0047D677: push edx
  '0047D678: mov [esp+20h], eax
  '0047D67C: lea eax, [esp+20h]
  '0047D680: push eax
  '0047D681: push esi
  '0047D682: call [ecx+00000914h]
  '0047D688: lea ecx, [esp+38h]
  '0047D68C: lea edx, [esp+20h]
  '0047D690: push ecx
  '0047D691: push edx
  '0047D692: push 00000018h
  '0047D694: call [00401088h]
  '0047D69A: mov cl, [esi+000000EAh]
  '0047D6A0: mov dl, [esi+000000E9h]
  '0047D6A6: xor eax, eax
  '0047D6A8: cmp cl, 01h
  '0047D6AB: mov ebp, [00401318h]
  '0047D6B1: setnz al
  '0047D6B4: xor ecx, ecx
  '0047D6B6: cmp dl, bl
  '0047D6B8: setnz cl
  '0047D6BB: or eax, ecx
  '0047D6BD: jnz 0047D78Fh
  '0047D6C3: mov edx, [esi]
  '0047D6C5: lea eax, [esp+14h]
  '0047D6C9: push eax
  '0047D6CA: push esi
  '0047D6CB: call [edx+00000830h]
  '0047D6D1: cmp eax, ebx
  '0047D6D3: jnl 47D6E3h
  '0047D6D5: push 00000830h
  '0047D6DA: push 0041FF7Ch
  '0047D6DF: push esi
  '0047D6E0: push eax
  '0047D6E1: call edi
  '0047D6E3: cmp word ptr [esp+14h], FFFFh
  '0047D6E9: jnz 47D74Dh
  '0047D6EB: fld real8 ptr [esp+30h]
  '0047D6EF: fadd real8 ptr [00402570h]
  '0047D6F5: mov ecx, [esi+10h]
  '0047D6F8: mov ebx, [ecx]
  '0047D6FA: fstsw ax
  '0047D6FC: test al, 0Dh
  '0047D6FE: jnz 0047D87Ah
  '0047D704: call ebp
  '0047D706: fld real8 ptr [esp+28h]
  '0047D70A: fadd real8 ptr [00402568h]
  '0047D710: push eax
  '0047D711: fstsw ax
  '0047D713: test al, 0Dh
  '0047D715: jnz 0047D87Ah
  '0047D71B: call ebp
  '0047D71D: fld real8 ptr [esp+24h]
  '0047D721: fadd real8 ptr [00402560h]
  '0047D727: push eax
  '0047D728: fstsw ax
  '0047D72A: test al, 0Dh
  '0047D72C: jnz 0047D87Ah
  '0047D732: call ebp
  '0047D734: push eax
  '0047D735: call [00401044h]
  '0047D73B: mov edx, [esi+10h]
  '0047D73E: push eax
  '0047D73F: push edx
  '0047D740: call [ebx+64h]
  '0047D743: xor ebx, ebx
  '0047D745: cmp eax, ebx
  '0047D747: fclex 
  '0047D749: jnl 47D78Fh
  '0047D74B: jmp 47D781h
  '0047D74D: mov edx, [esi]
  '0047D74F: lea eax, [esp+10h]
  '0047D753: push eax
  '0047D754: push esi
  '0047D755: call [edx+00000828h]
  '0047D75B: cmp eax, ebx
  '0047D75D: jnl 47D76Dh
  '0047D75F: push 00000828h
  '0047D764: push 0041FF7Ch
  '0047D769: push esi
  '0047D76A: push eax
  '0047D76B: call edi
  '0047D76D: mov eax, [esi+10h]
  '0047D770: mov edx, [esp+10h]
  '0047D774: push edx
  '0047D775: push eax
  '0047D776: mov ecx, [eax]
  '0047D778: call [ecx+64h]
  '0047D77B: cmp eax, ebx
  '0047D77D: fclex 
  '0047D77F: jnl 47D78Fh
  '0047D781: mov ecx, [esi+10h]
  '0047D784: push 00000064h
  '0047D786: push 0041FF4Ch
  '0047D78B: push ecx
  '0047D78C: push eax
  '0047D78D: call edi
  '0047D78F: cmp byte ptr [esi+000000E9h], 01h
  '0047D796: jnz 0047D86Eh
  '0047D79C: mov edx, [esi]
  '0047D79E: lea eax, [esp+14h]
  '0047D7A2: push eax
  '0047D7A3: push esi
  '0047D7A4: call [edx+00000830h]
  '0047D7AA: cmp eax, ebx
  '0047D7AC: jnl 47D7BCh
  '0047D7AE: push 00000830h
  '0047D7B3: push 0041FF7Ch
  '0047D7B8: push esi
  '0047D7B9: push eax
  '0047D7BA: call edi
  '0047D7BC: cmp word ptr [esp+14h], FFFFh
  '0047D7C2: jnz 47D82Ch
  '0047D7C4: fld real8 ptr [esp+30h]
  '0047D7C8: fadd real8 ptr [00402570h]
  '0047D7CE: mov ecx, [esi+10h]
  '0047D7D1: mov ebx, [ecx]
  '0047D7D3: fstsw ax
  '0047D7D5: test al, 0Dh
  '0047D7D7: jnz 0047D87Ah
  '0047D7DD: call ebp
  '0047D7DF: fld real8 ptr [esp+28h]
  '0047D7E3: fadd real8 ptr [00402568h]
  '0047D7E9: push eax
  '0047D7EA: fsub real8 ptr [00402558h]
  '0047D7F0: fstsw ax
  '0047D7F2: test al, 0Dh
  '0047D7F4: jnz 0047D87Ah
  '0047D7FA: call ebp
  '0047D7FC: fld real8 ptr [esp+24h]
  '0047D800: fadd real8 ptr [00402560h]
  '0047D806: push eax
  '0047D807: fsub real8 ptr [00402558h]
  '0047D80D: fstsw ax
  '0047D80F: test al, 0Dh
  '0047D811: jnz 47D87Ah
  '0047D813: call ebp
  '0047D815: push eax
  '0047D816: call [00401044h]
  '0047D81C: mov edx, [esi+10h]
  '0047D81F: push eax
  '0047D820: push edx
  '0047D821: call [ebx+64h]
  '0047D824: test eax, eax
  '0047D826: fclex 
  '0047D828: jnl 47D86Eh
  '0047D82A: jmp 47D860h
  '0047D82C: mov edx, [esi]
  '0047D82E: lea eax, [esp+10h]
  '0047D832: push eax
  '0047D833: push esi
  '0047D834: call [edx+00000820h]
  '0047D83A: cmp eax, ebx
  '0047D83C: jnl 47D84Ch
  '0047D83E: push 00000820h
  '0047D843: push 0041FF7Ch
  '0047D848: push esi
  '0047D849: push eax
  '0047D84A: call edi
  '0047D84C: mov eax, [esi+10h]
  '0047D84F: mov edx, [esp+10h]
  '0047D853: push edx
  '0047D854: push eax
  '0047D855: mov ecx, [eax]
  '0047D857: call [ecx+64h]
  '0047D85A: cmp eax, ebx
  '0047D85C: fclex 
  '0047D85E: jnl 47D86Eh
  '0047D860: mov ecx, [esi+10h]
  '0047D863: push 00000064h
  '0047D865: push 0041FF4Ch
  '0047D86A: push ecx
  '0047D86B: push eax
  '0047D86C: call edi
  '0047D86E: pop edi
  '0047D86F: pop esi
  '0047D870: pop ebp
  '0047D871: xor eax, eax
  '0047D873: pop ebx
  '0047D874: add esp, 00000040h
  '0047D877: retn 0004h
End Sub
Private Sub PictureWidth_47D880
  '0047D880: push ebp
  '0047D881: mov ebp, esp
  '0047D883: sub esp, 00000008h
  '0047D886: push 00403796h
  '0047D88B: mov eax, fs:[00h]
  '0047D891: push eax
  '0047D892: mov fs:[00000000h], esp
  '0047D899: sub esp, 00000060h
  '0047D89C: push ebx
  '0047D89D: push esi
  '0047D89E: push edi
  '0047D89F: mov [ebp-08h], esp
  '0047D8A2: mov [ebp-04h], 00402578h
  '0047D8A9: mov esi, [ebp+08h]
  '0047D8AC: lea ecx, [ebp-14h]
  '0047D8AF: xor ebx, ebx
  '0047D8B1: push ecx
  '0047D8B2: mov eax, [esi]
  '0047D8B4: push esi
  '0047D8B5: mov [ebp-14h], ebx
  '0047D8B8: mov [ebp-24h], ebx
  '0047D8BB: mov [ebp-34h], ebx
  '0047D8BE: mov [ebp-44h], ebx
  '0047D8C1: mov [ebp-48h], ebx
  '0047D8C4: mov [ebp-4Ch], ebx
  '0047D8C7: mov [ebp-50h], ebx
  '0047D8CA: mov [ebp-54h], ebx
  '0047D8CD: mov [ebp-58h], ebx
  '0047D8D0: mov [ebp-5Ch], ebx
  '0047D8D3: call [eax+000002B0h]
  '0047D8D9: cmp eax, ebx
  '0047D8DB: fclex 
  '0047D8DD: jnl 47D8F5h
  '0047D8DF: mov edi, [004010A8h]
  '0047D8E5: push 000002B0h
  '0047D8EA: push 0041FF4Ch
  '0047D8EF: push esi
  '0047D8F0: push eax
  '0047D8F1: call edi
  '0047D8F3: jmp 47D8FBh
  '0047D8F5: mov edi, [004010A8h]
  '0047D8FB: mov eax, [ebp-14h]
  '0047D8FE: lea ecx, [ebp-48h]
  '0047D901: push ecx
  '0047D902: push eax
  '0047D903: mov edx, [eax]
  '0047D905: mov [ebp-64h], eax
  '0047D908: call [edx+3Ch]
  '0047D90B: cmp eax, ebx
  '0047D90D: fclex 
  '0047D90F: jnl 47D91Fh
  '0047D911: mov edx, [ebp-64h]
  '0047D914: push 0000003Ch
  '0047D916: push 0041BDC4h
  '0047D91B: push edx
  '0047D91C: push eax
  '0047D91D: call edi
  '0047D91F: mov ebx, [ebp-48h]
  '0047D922: lea ecx, [ebp-14h]
  '0047D925: not ebx
  '0047D927: call [00401388h]
  '0047D92D: mov eax, [esi+000000C0h]
  '0047D933: test bx, bx
  '0047D936: jz 0047DB72h
  '0047D93C: cmp eax, 00000003h
  '0047D93F: jnz 47D966h
  '0047D941: mov edi, [esi]
  '0047D943: lea eax, [ebp-48h]
  '0047D946: push eax
  '0047D947: xor ecx, ecx
  '0047D949: mov byte ptr [ebp-48h], 00h
  '0047D94D: call [004011F4h]
  '0047D953: push eax
  '0047D954: push esi
  '0047D955: call [edi+00000928h]
  '0047D95B: wait 
  '0047D95C: push 0047E463h
  '0047D961: jmp 0047E462h
  '0047D966: cmp eax, 00000002h
  '0047D969: jnz 47D97Fh
  '0047D96B: mov ecx, [esi]
  '0047D96D: push esi
  '0047D96E: call [ecx+000008E8h]
  '0047D974: wait 
  '0047D975: push 0047E463h
  '0047D97A: jmp 0047E462h
  '0047D97F: cmp word ptr [esi+00000102h], 0002h
  '0047D987: lea ebx, [esi+00000102h]
  '0047D98D: jnl 0047DAF2h
  '0047D993: mov edx, [esi]
  '0047D995: lea eax, [ebp-50h]
  '0047D998: push eax
  '0047D999: push esi
  '0047D99A: call [edx+000000D8h]
  '0047D9A0: test eax, eax
  '0047D9A2: fclex 
  '0047D9A4: jnl 47D9B4h
  '0047D9A6: push 000000D8h
  '0047D9AB: push 0041FF4Ch
  '0047D9B0: push esi
  '0047D9B1: push eax
  '0047D9B2: call edi
  '0047D9B4: mov ecx, [esi]
  '0047D9B6: lea edx, [ebp-54h]
  '0047D9B9: push edx
  '0047D9BA: push esi
  '0047D9BB: call [ecx+00000100h]
  '0047D9C1: test eax, eax
  '0047D9C3: fclex 
  '0047D9C5: jnl 47D9D5h
  '0047D9C7: push 00000100h
  '0047D9CC: push 0041FF4Ch
  '0047D9D1: push esi
  '0047D9D2: push eax
  '0047D9D3: call edi
  '0047D9D5: mov eax, [esi]
  '0047D9D7: lea ecx, [ebp-58h]
  '0047D9DA: push ecx
  '0047D9DB: push esi
  '0047D9DC: call [eax+00000108h]
  '0047D9E2: test eax, eax
  '0047D9E4: fclex 
  '0047D9E6: jnl 47D9F6h
  '0047D9E8: push 00000108h
  '0047D9ED: push 0041FF4Ch
  '0047D9F2: push esi
  '0047D9F3: push eax
  '0047D9F4: call edi
  '0047D9F6: mov edx, [ebp-50h]
  '0047D9F9: mov ebx, [esi]
  '0047D9FB: fld real4 ptr [ebp-58h]
  '0047D9FE: lea eax, [ebp-48h]
  '0047DA01: mov byte ptr [ebp-48h], 00h
  '0047DA05: push eax
  '0047DA06: push 80000010h
  '0047DA0B: mov [ebp-5Ch], edx
  '0047DA0E: call [00401320h]
  '0047DA14: fld real4 ptr [ebp-54h]
  '0047DA17: push eax
  '0047DA18: call [00401320h]
  '0047DA1E: push eax
  '0047DA1F: push 00000000h
  '0047DA21: lea ecx, [ebp-5Ch]
  '0047DA24: push 00000000h
  '0047DA26: push ecx
  '0047DA27: push esi
  '0047DA28: call [ebx+00000924h]
  '0047DA2E: mov edx, [esi]
  '0047DA30: lea eax, [ebp-50h]
  '0047DA33: push eax
  '0047DA34: push esi
  '0047DA35: call [edx+000000D8h]
  '0047DA3B: test eax, eax
  '0047DA3D: fclex 
  '0047DA3F: jnl 47DA4Fh
  '0047DA41: push 000000D8h
  '0047DA46: push 0041FF4Ch
  '0047DA4B: push esi
  '0047DA4C: push eax
  '0047DA4D: call edi
  '0047DA4F: mov ecx, [esi]
  '0047DA51: lea edx, [ebp-54h]
  '0047DA54: push edx
  '0047DA55: push esi
  '0047DA56: call [ecx+00000100h]
  '0047DA5C: test eax, eax
  '0047DA5E: fclex 
  '0047DA60: jnl 47DA70h
  '0047DA62: push 00000100h
  '0047DA67: push 0041FF4Ch
  '0047DA6C: push esi
  '0047DA6D: push eax
  '0047DA6E: call edi
  '0047DA70: mov eax, [esi]
  '0047DA72: lea ecx, [ebp-58h]
  '0047DA75: push ecx
  '0047DA76: push esi
  '0047DA77: call [eax+00000108h]
  '0047DA7D: test eax, eax
  '0047DA7F: fclex 
  '0047DA81: jnl 47DA91h
  '0047DA83: push 00000108h
  '0047DA88: push 0041FF4Ch
  '0047DA8D: push esi
  '0047DA8E: push eax
  '0047DA8F: call edi
  '0047DA91: fld real4 ptr [ebp-58h]
  '0047DA94: fadd real4 ptr [00402428h]
  '0047DA9A: mov edx, [ebp-50h]
  '0047DA9D: mov edi, [00401320h]
  '0047DAA3: mov ebx, [esi]
  '0047DAA5: lea eax, [ebp-48h]
  '0047DAA8: push eax
  '0047DAA9: push 80000014h
  '0047DAAE: fstsw ax
  '0047DAB0: test al, 0Dh
  '0047DAB2: jnz 0047E478h
  '0047DAB8: mov byte ptr [ebp-48h], 00h
  '0047DABC: mov [ebp-5Ch], edx
  '0047DABF: call edi
  '0047DAC1: fld real4 ptr [ebp-54h]
  '0047DAC4: fadd real4 ptr [00402428h]
  '0047DACA: push eax
  '0047DACB: fstsw ax
  '0047DACD: test al, 0Dh
  '0047DACF: jnz 0047E478h
  '0047DAD5: call edi
  '0047DAD7: push eax
  '0047DAD8: push 00000000h
  '0047DADA: lea ecx, [ebp-5Ch]
  '0047DADD: push 00000000h
  '0047DADF: push ecx
  '0047DAE0: push esi
  '0047DAE1: call [ebx+00000924h]
  '0047DAE7: wait 
  '0047DAE8: push 0047E463h
  '0047DAED: jmp 0047E462h
  '0047DAF2: mov eax, [esi+10h]
  '0047DAF5: lea ecx, [ebp-50h]
  '0047DAF8: push ecx
  '0047DAF9: push eax
  '0047DAFA: mov edx, [eax]
  '0047DAFC: call [edx+60h]
  '0047DAFF: test eax, eax
  '0047DB01: fclex 
  '0047DB03: jnl 47DB13h
  '0047DB05: mov edx, [esi+10h]
  '0047DB08: push 00000060h
  '0047DB0A: push 0041FF4Ch
  '0047DB0F: push edx
  '0047DB10: push eax
  '0047DB11: call edi
  '0047DB13: mov eax, [ebp-50h]
  '0047DB16: mov ecx, [esi]
  '0047DB18: mov [ebp-54h], eax
  '0047DB1B: lea edx, [ebp-58h]
  '0047DB1E: lea eax, [ebp-54h]
  '0047DB21: push edx
  '0047DB22: push eax
  '0047DB23: push esi
  '0047DB24: call [ecx+00000918h]
  '0047DB2A: mov ecx, [esi]
  '0047DB2C: lea edx, [ebp-48h]
  '0047DB2F: push edx
  '0047DB30: push esi
  '0047DB31: call [ecx+00000888h]
  '0047DB37: test eax, eax
  '0047DB39: jnl 47DB49h
  '0047DB3B: push 00000888h
  '0047DB40: push 0041FF7Ch
  '0047DB45: push esi
  '0047DB46: push eax
  '0047DB47: call edi
  '0047DB49: mov eax, [ebp-48h]
  '0047DB4C: mov ecx, [ebp-58h]
  '0047DB4F: mov edx, [esi]
  '0047DB51: mov [ebp-4Ch], eax
  '0047DB54: lea eax, [ebp-4Ch]
  '0047DB57: mov [ebp-5Ch], ecx
  '0047DB5A: push eax
  '0047DB5B: lea ecx, [ebp-5Ch]
  '0047DB5E: push ebx
  '0047DB5F: push ecx
  '0047DB60: push esi
  '0047DB61: call [edx+000008DCh]
  '0047DB67: wait 
  '0047DB68: push 0047E463h
  '0047DB6D: jmp 0047E462h
  '0047DB72: cmp eax, 00000002h
  '0047DB75: jnz 0047DC5Eh
  '0047DB7B: mov edx, [esi]
  '0047DB7D: lea eax, [ebp-48h]
  '0047DB80: push eax
  '0047DB81: push esi
  '0047DB82: call [edx+00000868h]
  '0047DB88: test eax, eax
  '0047DB8A: jnl 47DB9Ah
  '0047DB8C: push 00000868h
  '0047DB91: push 0041FF7Ch
  '0047DB96: push esi
  '0047DB97: push eax
  '0047DB98: call edi
  '0047DB9A: mov al, [esi+000000EAh]
  '0047DBA0: xor ecx, ecx
  '0047DBA2: test al, al
  '0047DBA4: setnz cl
  '0047DBA7: xor edx, edx
  '0047DBA9: cmp [ebp-48h], dx
  '0047DBAD: setnz dl
  '0047DBB0: or ecx, edx
  '0047DBB2: jz 0047E43Dh
  '0047DBB8: mov eax, [esi]
  '0047DBBA: lea ecx, [ebp-50h]
  '0047DBBD: push ecx
  '0047DBBE: push esi
  '0047DBBF: call [eax+000000D8h]
  '0047DBC5: test eax, eax
  '0047DBC7: fclex 
  '0047DBC9: jnl 47DBD9h
  '0047DBCB: push 000000D8h
  '0047DBD0: push 0041FF4Ch
  '0047DBD5: push esi
  '0047DBD6: push eax
  '0047DBD7: call edi
  '0047DBD9: mov edx, [esi]
  '0047DBDB: lea eax, [ebp-54h]
  '0047DBDE: push eax
  '0047DBDF: push esi
  '0047DBE0: call [edx+00000100h]
  '0047DBE6: test eax, eax
  '0047DBE8: fclex 
  '0047DBEA: jnl 47DBFAh
  '0047DBEC: push 00000100h
  '0047DBF1: push 0041FF4Ch
  '0047DBF6: push esi
  '0047DBF7: push eax
  '0047DBF8: call edi
  '0047DBFA: mov ecx, [esi]
  '0047DBFC: lea edx, [ebp-58h]
  '0047DBFF: push edx
  '0047DC00: push esi
  '0047DC01: call [ecx+00000108h]
  '0047DC07: test eax, eax
  '0047DC09: fclex 
  '0047DC0B: jnl 47DC1Bh
  '0047DC0D: push 00000108h
  '0047DC12: push 0041FF4Ch
  '0047DC17: push esi
  '0047DC18: push eax
  '0047DC19: call edi
  '0047DC1B: mov edx, [esi+00000118h]
  '0047DC21: mov eax, [ebp-50h]
  '0047DC24: fld real4 ptr [ebp-58h]
  '0047DC27: mov edi, [00401320h]
  '0047DC2D: mov ebx, [esi]
  '0047DC2F: lea ecx, [ebp-48h]
  '0047DC32: mov byte ptr [ebp-48h], 00h
  '0047DC36: push ecx
  '0047DC37: push edx
  '0047DC38: mov [ebp-5Ch], eax
  '0047DC3B: call edi
  '0047DC3D: fld real4 ptr [ebp-54h]
  '0047DC40: push eax
  '0047DC41: call edi
  '0047DC43: push eax
  '0047DC44: push 00000000h
  '0047DC46: lea eax, [ebp-5Ch]
  '0047DC49: push 00000000h
  '0047DC4B: push eax
  '0047DC4C: push esi
  '0047DC4D: call [ebx+00000924h]
  '0047DC53: wait 
  '0047DC54: push 0047E463h
  '0047DC59: jmp 0047E462h
  '0047DC5E: cmp eax, 00000003h
  '0047DC61: mov al, [esi+000000E9h]
  '0047DC67: jnz 0047DD15h
  '0047DC6D: cmp al, 01h
  '0047DC6F: jnz 47DC92h
  '0047DC71: mov edi, [004011F4h]
  '0047DC77: mov ebx, [esi]
  '0047DC79: lea ecx, [ebp-48h]
  '0047DC7C: mov byte ptr [ebp-48h], 00h
  '0047DC80: push ecx
  '0047DC81: mov ecx, 00000002h
  '0047DC86: call edi
  '0047DC88: push eax
  '0047DC89: push esi
  '0047DC8A: call [ebx+00000928h]
  '0047DC90: jmp 47DC98h
  '0047DC92: mov edi, [004011F4h]
  '0047DC98: mov al, [esi+000000EAh]
  '0047DC9E: mov bl, [esi+000000E9h]
  '0047DCA4: mov ecx, 00000001h
  '0047DCA9: xor edx, edx
  '0047DCAB: cmp al, cl
  '0047DCAD: setnz dl
  '0047DCB0: xor eax, eax
  '0047DCB2: test bl, bl
  '0047DCB4: setnz al
  '0047DCB7: or edx, eax
  '0047DCB9: jnz 47DCD2h
  '0047DCBB: call edi
  '0047DCBD: mov ebx, [esi]
  '0047DCBF: lea ecx, [ebp-48h]
  '0047DCC2: push ecx
  '0047DCC3: xor ecx, ecx
  '0047DCC5: mov [ebp-48h], al
  '0047DCC8: call edi
  '0047DCCA: push eax
  '0047DCCB: push esi
  '0047DCCC: call [ebx+00000928h]
  '0047DCD2: mov al, [esi+000000EAh]
  '0047DCD8: mov bl, [esi+000000E9h]
  '0047DCDE: xor edx, edx
  '0047DCE0: test al, al
  '0047DCE2: setnz dl
  '0047DCE5: xor eax, eax
  '0047DCE7: test bl, bl
  '0047DCE9: setnz al
  '0047DCEC: or edx, eax
  '0047DCEE: jnz 0047E43Dh
  '0047DCF4: mov ebx, [esi]
  '0047DCF6: lea ecx, [ebp-48h]
  '0047DCF9: push ecx
  '0047DCFA: xor ecx, ecx
  '0047DCFC: mov byte ptr [ebp-48h], 00h
  '0047DD00: call edi
  '0047DD02: push eax
  '0047DD03: push esi
  '0047DD04: call [ebx+00000928h]
  '0047DD0A: wait 
  '0047DD0B: push 0047E463h
  '0047DD10: jmp 0047E462h
  '0047DD15: cmp al, 01h
  '0047DD17: jnz 0047DEFEh
  '0047DD1D: cmp word ptr [esi+00000102h], 0002h
  '0047DD25: lea ebx, [esi+00000102h]
  '0047DD2B: jnl 0047DE89h
  '0047DD31: mov edx, [esi]
  '0047DD33: lea eax, [ebp-50h]
  '0047DD36: push eax
  '0047DD37: push esi
  '0047DD38: call [edx+000000D8h]
  '0047DD3E: test eax, eax
  '0047DD40: fclex 
  '0047DD42: jnl 47DD52h
  '0047DD44: push 000000D8h
  '0047DD49: push 0041FF4Ch
  '0047DD4E: push esi
  '0047DD4F: push eax
  '0047DD50: call edi
  '0047DD52: mov ecx, [esi]
  '0047DD54: lea edx, [ebp-54h]
  '0047DD57: push edx
  '0047DD58: push esi
  '0047DD59: call [ecx+00000100h]
  '0047DD5F: test eax, eax
  '0047DD61: fclex 
  '0047DD63: jnl 47DD73h
  '0047DD65: push 00000100h
  '0047DD6A: push 0041FF4Ch
  '0047DD6F: push esi
  '0047DD70: push eax
  '0047DD71: call edi
  '0047DD73: mov eax, [esi]
  '0047DD75: lea ecx, [ebp-58h]
  '0047DD78: push ecx
  '0047DD79: push esi
  '0047DD7A: call [eax+00000108h]
  '0047DD80: test eax, eax
  '0047DD82: fclex 
  '0047DD84: jnl 47DD94h
  '0047DD86: push 00000108h
  '0047DD8B: push 0041FF4Ch
  '0047DD90: push esi
  '0047DD91: push eax
  '0047DD92: call edi
  '0047DD94: mov edx, [ebp-50h]
  '0047DD97: mov ebx, [esi]
  '0047DD99: fld real4 ptr [ebp-58h]
  '0047DD9C: lea eax, [ebp-48h]
  '0047DD9F: mov byte ptr [ebp-48h], 00h
  '0047DDA3: push eax
  '0047DDA4: push 80000014h
  '0047DDA9: mov [ebp-5Ch], edx
  '0047DDAC: call [00401320h]
  '0047DDB2: fld real4 ptr [ebp-54h]
  '0047DDB5: push eax
  '0047DDB6: call [00401320h]
  '0047DDBC: push eax
  '0047DDBD: push 00000000h
  '0047DDBF: lea ecx, [ebp-5Ch]
  '0047DDC2: push 00000000h
  '0047DDC4: push ecx
  '0047DDC5: push esi
  '0047DDC6: call [ebx+00000924h]
  '0047DDCC: mov edx, [esi]
  '0047DDCE: lea eax, [ebp-50h]
  '0047DDD1: push eax
  '0047DDD2: push esi
  '0047DDD3: call [edx+000000D8h]
  '0047DDD9: test eax, eax
  '0047DDDB: fclex 
  '0047DDDD: jnl 47DDEDh
  '0047DDDF: push 000000D8h
  '0047DDE4: push 0041FF4Ch
  '0047DDE9: push esi
  '0047DDEA: push eax
  '0047DDEB: call edi
  '0047DDED: mov ecx, [esi]
  '0047DDEF: lea edx, [ebp-54h]
  '0047DDF2: push edx
  '0047DDF3: push esi
  '0047DDF4: call [ecx+00000100h]
  '0047DDFA: test eax, eax
  '0047DDFC: fclex 
  '0047DDFE: jnl 47DE0Eh
  '0047DE00: push 00000100h
  '0047DE05: push 0041FF4Ch
  '0047DE0A: push esi
  '0047DE0B: push eax
  '0047DE0C: call edi
  '0047DE0E: mov eax, [esi]
  '0047DE10: lea ecx, [ebp-58h]
  '0047DE13: push ecx
  '0047DE14: push esi
  '0047DE15: call [eax+00000108h]
  '0047DE1B: test eax, eax
  '0047DE1D: fclex 
  '0047DE1F: jnl 47DE2Fh
  '0047DE21: push 00000108h
  '0047DE26: push 0041FF4Ch
  '0047DE2B: push esi
  '0047DE2C: push eax
  '0047DE2D: call edi
  '0047DE2F: fld real4 ptr [ebp-58h]
  '0047DE32: fadd real4 ptr [00402428h]
  '0047DE38: mov edx, [ebp-50h]
  '0047DE3B: mov ebx, [esi]
  '0047DE3D: lea eax, [ebp-48h]
  '0047DE40: mov byte ptr [ebp-48h], 00h
  '0047DE44: push eax
  '0047DE45: push 80000010h
  '0047DE4A: fstsw ax
  '0047DE4C: test al, 0Dh
  '0047DE4E: jnz 0047E478h
  '0047DE54: mov [ebp-5Ch], edx
  '0047DE57: call [00401320h]
  '0047DE5D: fld real4 ptr [ebp-54h]
  '0047DE60: fadd real4 ptr [00402428h]
  '0047DE66: push eax
  '0047DE67: fstsw ax
  '0047DE69: test al, 0Dh
  '0047DE6B: jnz 0047E478h
  '0047DE71: call [00401320h]
  '0047DE77: push eax
  '0047DE78: push 00000000h
  '0047DE7A: lea ecx, [ebp-5Ch]
  '0047DE7D: push 00000000h
  '0047DE7F: push ecx
  '0047DE80: push esi
  '0047DE81: call [ebx+00000924h]
  '0047DE87: jmp 47DEFEh
  '0047DE89: mov eax, [esi+10h]
  '0047DE8C: lea ecx, [ebp-50h]
  '0047DE8F: push ecx
  '0047DE90: push eax
  '0047DE91: mov edx, [eax]
  '0047DE93: call [edx+60h]
  '0047DE96: test eax, eax
  '0047DE98: fclex 
  '0047DE9A: jnl 47DEAAh
  '0047DE9C: mov edx, [esi+10h]
  '0047DE9F: push 00000060h
  '0047DEA1: push 0041FF4Ch
  '0047DEA6: push edx
  '0047DEA7: push eax
  '0047DEA8: call edi
  '0047DEAA: mov eax, [ebp-50h]
  '0047DEAD: mov ecx, [esi]
  '0047DEAF: mov [ebp-54h], eax
  '0047DEB2: lea edx, [ebp-58h]
  '0047DEB5: lea eax, [ebp-54h]
  '0047DEB8: push edx
  '0047DEB9: push eax
  '0047DEBA: push esi
  '0047DEBB: call [ecx+00000918h]
  '0047DEC1: mov ecx, [esi]
  '0047DEC3: lea edx, [ebp-48h]
  '0047DEC6: push edx
  '0047DEC7: push esi
  '0047DEC8: call [ecx+00000888h]
  '0047DECE: test eax, eax
  '0047DED0: jnl 47DEE0h
  '0047DED2: push 00000888h
  '0047DED7: push 0041FF7Ch
  '0047DEDC: push esi
  '0047DEDD: push eax
  '0047DEDE: call edi
  '0047DEE0: mov eax, [ebp-48h]
  '0047DEE3: mov ecx, [ebp-58h]
  '0047DEE6: mov edx, [esi]
  '0047DEE8: mov [ebp-4Ch], eax
  '0047DEEB: lea eax, [ebp-4Ch]
  '0047DEEE: mov [ebp-5Ch], ecx
  '0047DEF1: push eax
  '0047DEF2: lea ecx, [ebp-5Ch]
  '0047DEF5: push ebx
  '0047DEF6: push ecx
  '0047DEF7: push esi
  '0047DEF8: call [edx+000008E0h]
  '0047DEFE: mov al, [esi+000000EAh]
  '0047DF04: mov bl, [esi+000000E9h]
  '0047DF0A: xor edx, edx
  '0047DF0C: cmp al, 01h
  '0047DF0E: setnz dl
  '0047DF11: xor eax, eax
  '0047DF13: test bl, bl
  '0047DF15: setnz al
  '0047DF18: or edx, eax
  '0047DF1A: jnz 0047E101h
  '0047DF20: cmp word ptr [esi+00000102h], 0002h
  '0047DF28: lea ebx, [esi+00000102h]
  '0047DF2E: jnl 0047E08Ch
  '0047DF34: mov ecx, [esi]
  '0047DF36: lea edx, [ebp-50h]
  '0047DF39: push edx
  '0047DF3A: push esi
  '0047DF3B: call [ecx+000000D8h]
  '0047DF41: test eax, eax
  '0047DF43: fclex 
  '0047DF45: jnl 47DF55h
  '0047DF47: push 000000D8h
  '0047DF4C: push 0041FF4Ch
  '0047DF51: push esi
  '0047DF52: push eax
  '0047DF53: call edi
  '0047DF55: mov eax, [esi]
  '0047DF57: lea ecx, [ebp-54h]
  '0047DF5A: push ecx
  '0047DF5B: push esi
  '0047DF5C: call [eax+00000100h]
  '0047DF62: test eax, eax
  '0047DF64: fclex 
  '0047DF66: jnl 47DF76h
  '0047DF68: push 00000100h
  '0047DF6D: push 0041FF4Ch
  '0047DF72: push esi
  '0047DF73: push eax
  '0047DF74: call edi
  '0047DF76: mov edx, [esi]
  '0047DF78: lea eax, [ebp-58h]
  '0047DF7B: push eax
  '0047DF7C: push esi
  '0047DF7D: call [edx+00000108h]
  '0047DF83: test eax, eax
  '0047DF85: fclex 
  '0047DF87: jnl 47DF97h
  '0047DF89: push 00000108h
  '0047DF8E: push 0041FF4Ch
  '0047DF93: push esi
  '0047DF94: push eax
  '0047DF95: call edi
  '0047DF97: mov ecx, [ebp-50h]
  '0047DF9A: mov ebx, [esi]
  '0047DF9C: fld real4 ptr [ebp-58h]
  '0047DF9F: lea edx, [ebp-48h]
  '0047DFA2: mov byte ptr [ebp-48h], 00h
  '0047DFA6: push edx
  '0047DFA7: push 80000010h
  '0047DFAC: mov [ebp-5Ch], ecx
  '0047DFAF: call [00401320h]
  '0047DFB5: fld real4 ptr [ebp-54h]
  '0047DFB8: push eax
  '0047DFB9: call [00401320h]
  '0047DFBF: push eax
  '0047DFC0: push 00000000h
  '0047DFC2: lea eax, [ebp-5Ch]
  '0047DFC5: push 00000000h
  '0047DFC7: push eax
  '0047DFC8: push esi
  '0047DFC9: call [ebx+00000924h]
  '0047DFCF: mov ecx, [esi]
  '0047DFD1: lea edx, [ebp-50h]
  '0047DFD4: push edx
  '0047DFD5: push esi
  '0047DFD6: call [ecx+000000D8h]
  '0047DFDC: test eax, eax
  '0047DFDE: fclex 
  '0047DFE0: jnl 47DFF0h
  '0047DFE2: push 000000D8h
  '0047DFE7: push 0041FF4Ch
  '0047DFEC: push esi
  '0047DFED: push eax
  '0047DFEE: call edi
  '0047DFF0: mov eax, [esi]
  '0047DFF2: lea ecx, [ebp-54h]
  '0047DFF5: push ecx
  '0047DFF6: push esi
  '0047DFF7: call [eax+00000100h]
  '0047DFFD: test eax, eax
  '0047DFFF: fclex 
  '0047E001: jnl 47E011h
  '0047E003: push 00000100h
  '0047E008: push 0041FF4Ch
  '0047E00D: push esi
  '0047E00E: push eax
  '0047E00F: call edi
  '0047E011: mov edx, [esi]
  '0047E013: lea eax, [ebp-58h]
  '0047E016: push eax
  '0047E017: push esi
  '0047E018: call [edx+00000108h]
  '0047E01E: test eax, eax
  '0047E020: fclex 
  '0047E022: jnl 47E032h
  '0047E024: push 00000108h
  '0047E029: push 0041FF4Ch
  '0047E02E: push esi
  '0047E02F: push eax
  '0047E030: call edi
  '0047E032: fld real4 ptr [ebp-58h]
  '0047E035: fadd real4 ptr [00402428h]
  '0047E03B: mov ecx, [ebp-50h]
  '0047E03E: mov ebx, [esi]
  '0047E040: lea edx, [ebp-48h]
  '0047E043: mov byte ptr [ebp-48h], 00h
  '0047E047: push edx
  '0047E048: push 80000014h
  '0047E04D: fstsw ax
  '0047E04F: test al, 0Dh
  '0047E051: jnz 0047E478h
  '0047E057: mov [ebp-5Ch], ecx
  '0047E05A: call [00401320h]
  '0047E060: fld real4 ptr [ebp-54h]
  '0047E063: fadd real4 ptr [00402428h]
  '0047E069: push eax
  '0047E06A: fstsw ax
  '0047E06C: test al, 0Dh
  '0047E06E: jnz 0047E478h
  '0047E074: call [00401320h]
  '0047E07A: push eax
  '0047E07B: push 00000000h
  '0047E07D: lea eax, [ebp-5Ch]
  '0047E080: push 00000000h
  '0047E082: push eax
  '0047E083: push esi
  '0047E084: call [ebx+00000924h]
  '0047E08A: jmp 47E101h
  '0047E08C: mov eax, [esi+10h]
  '0047E08F: lea edx, [ebp-50h]
  '0047E092: push edx
  '0047E093: push eax
  '0047E094: mov ecx, [eax]
  '0047E096: call [ecx+60h]
  '0047E099: test eax, eax
  '0047E09B: fclex 
  '0047E09D: jnl 47E0ADh
  '0047E09F: mov ecx, [esi+10h]
  '0047E0A2: push 00000060h
  '0047E0A4: push 0041FF4Ch
  '0047E0A9: push ecx
  '0047E0AA: push eax
  '0047E0AB: call edi
  '0047E0AD: mov edx, [ebp-50h]
  '0047E0B0: mov eax, [esi]
  '0047E0B2: mov [ebp-54h], edx
  '0047E0B5: lea ecx, [ebp-58h]
  '0047E0B8: lea edx, [ebp-54h]
  '0047E0BB: push ecx
  '0047E0BC: push edx
  '0047E0BD: push esi
  '0047E0BE: call [eax+00000918h]
  '0047E0C4: mov eax, [esi]
  '0047E0C6: lea ecx, [ebp-48h]
  '0047E0C9: push ecx
  '0047E0CA: push esi
  '0047E0CB: call [eax+00000888h]
  '0047E0D1: test eax, eax
  '0047E0D3: jnl 47E0E3h
  '0047E0D5: push 00000888h
  '0047E0DA: push 0041FF7Ch
  '0047E0DF: push esi
  '0047E0E0: push eax
  '0047E0E1: call edi
  '0047E0E3: mov edx, [ebp-48h]
  '0047E0E6: mov eax, [ebp-58h]
  '0047E0E9: mov ecx, [esi]
  '0047E0EB: mov [ebp-4Ch], edx
  '0047E0EE: lea edx, [ebp-4Ch]
  '0047E0F1: mov [ebp-5Ch], eax
  '0047E0F4: push edx
  '0047E0F5: lea eax, [ebp-5Ch]
  '0047E0F8: push ebx
  '0047E0F9: push eax
  '0047E0FA: push esi
  '0047E0FB: call [ecx+000008DCh]
  '0047E101: mov al, [esi+000000EAh]
  '0047E107: mov bl, [esi+000000E9h]
  '0047E10D: xor ecx, ecx
  '0047E10F: test al, al
  '0047E111: setnz cl
  '0047E114: xor edx, edx
  '0047E116: test bl, bl
  '0047E118: setnz dl
  '0047E11B: or ecx, edx
  '0047E11D: jnz 0047E312h
  '0047E123: mov eax, [esi+000000C0h]
  '0047E129: test eax, eax
  '0047E12B: jnz 0047E312h
  '0047E131: cmp word ptr [esi+00000102h], 0002h
  '0047E139: lea ebx, [esi+00000102h]
  '0047E13F: jnl 0047E29Dh
  '0047E145: mov eax, [esi]
  '0047E147: lea ecx, [ebp-50h]
  '0047E14A: push ecx
  '0047E14B: push esi
  '0047E14C: call [eax+000000D8h]
  '0047E152: test eax, eax
  '0047E154: fclex 
  '0047E156: jnl 47E166h
  '0047E158: push 000000D8h
  '0047E15D: push 0041FF4Ch
  '0047E162: push esi
  '0047E163: push eax
  '0047E164: call edi
  '0047E166: mov edx, [esi]
  '0047E168: lea eax, [ebp-54h]
  '0047E16B: push eax
  '0047E16C: push esi
  '0047E16D: call [edx+00000100h]
  '0047E173: test eax, eax
  '0047E175: fclex 
  '0047E177: jnl 47E187h
  '0047E179: push 00000100h
  '0047E17E: push 0041FF4Ch
  '0047E183: push esi
  '0047E184: push eax
  '0047E185: call edi
  '0047E187: mov ecx, [esi]
  '0047E189: lea edx, [ebp-58h]
  '0047E18C: push edx
  '0047E18D: push esi
  '0047E18E: call [ecx+00000108h]
  '0047E194: test eax, eax
  '0047E196: fclex 
  '0047E198: jnl 47E1A8h
  '0047E19A: push 00000108h
  '0047E19F: push 0041FF4Ch
  '0047E1A4: push esi
  '0047E1A5: push eax
  '0047E1A6: call edi
  '0047E1A8: mov eax, [ebp-50h]
  '0047E1AB: mov ebx, [esi]
  '0047E1AD: fld real4 ptr [ebp-58h]
  '0047E1B0: lea ecx, [ebp-48h]
  '0047E1B3: mov byte ptr [ebp-48h], 00h
  '0047E1B7: push ecx
  '0047E1B8: push 80000010h
  '0047E1BD: mov [ebp-5Ch], eax
  '0047E1C0: call [00401320h]
  '0047E1C6: fld real4 ptr [ebp-54h]
  '0047E1C9: push eax
  '0047E1CA: call [00401320h]
  '0047E1D0: push eax
  '0047E1D1: push 00000000h
  '0047E1D3: lea edx, [ebp-5Ch]
  '0047E1D6: push 00000000h
  '0047E1D8: push edx
  '0047E1D9: push esi
  '0047E1DA: call [ebx+00000924h]
  '0047E1E0: mov eax, [esi]
  '0047E1E2: lea ecx, [ebp-50h]
  '0047E1E5: push ecx
  '0047E1E6: push esi
  '0047E1E7: call [eax+000000D8h]
  '0047E1ED: test eax, eax
  '0047E1EF: fclex 
  '0047E1F1: jnl 47E201h
  '0047E1F3: push 000000D8h
  '0047E1F8: push 0041FF4Ch
  '0047E1FD: push esi
  '0047E1FE: push eax
  '0047E1FF: call edi
  '0047E201: mov edx, [esi]
  '0047E203: lea eax, [ebp-54h]
  '0047E206: push eax
  '0047E207: push esi
  '0047E208: call [edx+00000100h]
  '0047E20E: test eax, eax
  '0047E210: fclex 
  '0047E212: jnl 47E222h
  '0047E214: push 00000100h
  '0047E219: push 0041FF4Ch
  '0047E21E: push esi
  '0047E21F: push eax
  '0047E220: call edi
  '0047E222: mov ecx, [esi]
  '0047E224: lea edx, [ebp-58h]
  '0047E227: push edx
  '0047E228: push esi
  '0047E229: call [ecx+00000108h]
  '0047E22F: test eax, eax
  '0047E231: fclex 
  '0047E233: jnl 47E243h
  '0047E235: push 00000108h
  '0047E23A: push 0041FF4Ch
  '0047E23F: push esi
  '0047E240: push eax
  '0047E241: call edi
  '0047E243: fld real4 ptr [ebp-58h]
  '0047E246: fadd real4 ptr [00402428h]
  '0047E24C: mov eax, [ebp-50h]
  '0047E24F: mov ebx, [esi]
  '0047E251: lea ecx, [ebp-48h]
  '0047E254: mov [ebp-5Ch], eax
  '0047E257: push ecx
  '0047E258: push 80000014h
  '0047E25D: fstsw ax
  '0047E25F: test al, 0Dh
  '0047E261: jnz 0047E478h
  '0047E267: mov byte ptr [ebp-48h], 00h
  '0047E26B: call [00401320h]
  '0047E271: fld real4 ptr [ebp-54h]
  '0047E274: fadd real4 ptr [00402428h]
  '0047E27A: push eax
  '0047E27B: fstsw ax
  '0047E27D: test al, 0Dh
  '0047E27F: jnz 0047E478h
  '0047E285: call [00401320h]
  '0047E28B: push eax
  '0047E28C: push 00000000h
  '0047E28E: lea edx, [ebp-5Ch]
  '0047E291: push 00000000h
  '0047E293: push edx
  '0047E294: push esi
  '0047E295: call [ebx+00000924h]
  '0047E29B: jmp 47E312h
  '0047E29D: mov eax, [esi+10h]
  '0047E2A0: lea edx, [ebp-50h]
  '0047E2A3: push edx
  '0047E2A4: push eax
  '0047E2A5: mov ecx, [eax]
  '0047E2A7: call [ecx+60h]
  '0047E2AA: test eax, eax
  '0047E2AC: fclex 
  '0047E2AE: jnl 47E2BEh
  '0047E2B0: mov ecx, [esi+10h]
  '0047E2B3: push 00000060h
  '0047E2B5: push 0041FF4Ch
  '0047E2BA: push ecx
  '0047E2BB: push eax
  '0047E2BC: call edi
  '0047E2BE: mov edx, [ebp-50h]
  '0047E2C1: mov eax, [esi]
  '0047E2C3: mov [ebp-54h], edx
  '0047E2C6: lea ecx, [ebp-58h]
  '0047E2C9: lea edx, [ebp-54h]
  '0047E2CC: push ecx
  '0047E2CD: push edx
  '0047E2CE: push esi
  '0047E2CF: call [eax+00000918h]
  '0047E2D5: mov eax, [esi]
  '0047E2D7: lea ecx, [ebp-48h]
  '0047E2DA: push ecx
  '0047E2DB: push esi
  '0047E2DC: call [eax+00000888h]
  '0047E2E2: test eax, eax
  '0047E2E4: jnl 47E2F4h
  '0047E2E6: push 00000888h
  '0047E2EB: push 0041FF7Ch
  '0047E2F0: push esi
  '0047E2F1: push eax
  '0047E2F2: call edi
  '0047E2F4: mov edx, [ebp-48h]
  '0047E2F7: mov eax, [ebp-58h]
  '0047E2FA: mov ecx, [esi]
  '0047E2FC: mov [ebp-4Ch], edx
  '0047E2FF: lea edx, [ebp-4Ch]
  '0047E302: mov [ebp-5Ch], eax
  '0047E305: push edx
  '0047E306: lea eax, [ebp-5Ch]
  '0047E309: push ebx
  '0047E30A: push eax
  '0047E30B: push esi
  '0047E30C: call [ecx+000008DCh]
  '0047E312: mov dl, [esi+000000E8h]
  '0047E318: mov ebx, [esi+000000C0h]
  '0047E31E: xor ecx, ecx
  '0047E320: cmp dl, 01h
  '0047E323: setz cl
  '0047E326: neg ecx
  '0047E328: xor edx, edx
  '0047E32A: mov [ebp-44h], 0000000Bh
  '0047E331: test ebx, ebx
  '0047E333: setz dl
  '0047E336: neg edx
  '0047E338: and ecx, edx
  '0047E33A: mov dl, [esi+000000E9h]
  '0047E340: xor eax, eax
  '0047E342: test dl, dl
  '0047E344: setz al
  '0047E347: neg eax
  '0047E349: and ecx, eax
  '0047E34B: lea edx, [ebp-14h]
  '0047E34E: mov [ebp-3Ch], cx
  '0047E352: mov ecx, [esi]
  '0047E354: push edx
  '0047E355: push esi
  '0047E356: call [ecx+000002C0h]
  '0047E35C: test eax, eax
  '0047E35E: fclex 
  '0047E360: jnl 47E370h
  '0047E362: push 000002C0h
  '0047E367: push 0041FF4Ch
  '0047E36C: push esi
  '0047E36D: push eax
  '0047E36E: call edi
  '0047E370: mov ecx, [ebp-14h]
  '0047E373: lea eax, [ebp-44h]
  '0047E376: push eax
  '0047E377: push 00000000h
  '0047E379: push 00417028h
  '0047E37E: lea edx, [ebp-24h]
  '0047E381: push ecx
  '0047E382: push edx
  '0047E383: call [0040132Ch]
  '0047E389: add esp, 00000010h
  '0047E38C: push eax
  '0047E38D: lea eax, [ebp-34h]
  '0047E390: push eax
  '0047E391: call [004011ACh]
  '0047E397: push eax
  '0047E398: call [00401128h]
  '0047E39E: lea ecx, [ebp-14h]
  '0047E3A1: mov bx, ax
  '0047E3A4: call [00401388h]
  '0047E3AA: lea ecx, [ebp-24h]
  '0047E3AD: lea edx, [ebp-44h]
  '0047E3B0: push ecx
  '0047E3B1: push edx
  '0047E3B2: push 00000002h
  '0047E3B4: call [00401058h]
  '0047E3BA: add esp, 0000000Ch
  '0047E3BD: test bx, bx
  '0047E3C0: jz 47E43Dh
  '0047E3C2: mov eax, [esi+10h]
  '0047E3C5: lea edx, [ebp-50h]
  '0047E3C8: push edx
  '0047E3C9: push eax
  '0047E3CA: mov ecx, [eax]
  '0047E3CC: call [ecx+60h]
  '0047E3CF: test eax, eax
  '0047E3D1: fclex 
  '0047E3D3: jnl 47E3E3h
  '0047E3D5: mov ecx, [esi+10h]
  '0047E3D8: push 00000060h
  '0047E3DA: push 0041FF4Ch
  '0047E3DF: push ecx
  '0047E3E0: push eax
  '0047E3E1: call edi
  '0047E3E3: mov edx, [ebp-50h]
  '0047E3E6: mov eax, [esi]
  '0047E3E8: mov [ebp-54h], edx
  '0047E3EB: lea ecx, [ebp-58h]
  '0047E3EE: lea edx, [ebp-54h]
  '0047E3F1: push ecx
  '0047E3F2: push edx
  '0047E3F3: push esi
  '0047E3F4: call [eax+00000918h]
  '0047E3FA: mov eax, [esi]
  '0047E3FC: lea ecx, [ebp-48h]
  '0047E3FF: push ecx
  '0047E400: push esi
  '0047E401: call [eax+00000888h]
  '0047E407: test eax, eax
  '0047E409: jnl 47E419h
  '0047E40B: push 00000888h
  '0047E410: push 0041FF7Ch
  '0047E415: push esi
  '0047E416: push eax
  '0047E417: call edi
  '0047E419: mov edx, [ebp-48h]
  '0047E41C: mov eax, [ebp-58h]
  '0047E41F: mov ecx, [esi]
  '0047E421: mov [ebp-4Ch], edx
  '0047E424: lea edx, [ebp-4Ch]
  '0047E427: mov [ebp-5Ch], eax
  '0047E42A: push edx
  '0047E42B: lea eax, [esi+00000102h]
  '0047E431: lea edx, [ebp-5Ch]
  '0047E434: push eax
  '0047E435: push edx
  '0047E436: push esi
  '0047E437: call [ecx+000008E4h]
  '0047E43D: wait 
  '0047E43E: push 0047E463h
  '0047E443: jmp 47E462h
  '0047E445: lea ecx, [ebp-14h]
  '0047E448: call [00401388h]
  '0047E44E: lea eax, [ebp-34h]
  '0047E451: lea ecx, [ebp-24h]
  '0047E454: push eax
  '0047E455: push ecx
  '0047E456: push 00000002h
  '0047E458: call [00401058h]
  '0047E45E: add esp, 0000000Ch
  '0047E461: ret 
End Sub
Private Sub PictureHeight_47E810
  '0047E810: push ebp
  '0047E811: mov ebp, esp
  '0047E813: sub esp, 00000008h
  '0047E816: push 00403796h
  '0047E81B: mov eax, fs:[00h]
  '0047E821: push eax
  '0047E822: mov fs:[00000000h], esp
  '0047E829: sub esp, 0000002Ch
  '0047E82C: push ebx
  '0047E82D: push esi
  '0047E82E: push edi
  '0047E82F: mov [ebp-08h], esp
  '0047E832: mov [ebp-04h], 004025A8h
  '0047E839: mov edx, [ebp+10h]
  '0047E83C: xor edi, edi
  '0047E83E: lea ecx, [ebp-14h]
  '0047E841: mov [ebp-14h], edi
  '0047E844: mov [ebp-1Ch], edi
  '0047E847: mov [ebp-20h], edi
  '0047E84A: mov [ebp-24h], edi
  '0047E84D: mov [ebp-28h], edi
  '0047E850: mov [ebp-2Ch], edi
  '0047E853: call [004012C4h]
  '0047E859: mov eax, [ebp+0Ch]
  '0047E85C: lea edx, [ebp-2Ch]
  '0047E85F: push edx
  '0047E860: mov esi, [eax]
  '0047E862: push esi
  '0047E863: mov ecx, [esi]
  '0047E865: call [ecx+58h]
  '0047E868: cmp eax, edi
  '0047E86A: fclex 
  '0047E86C: jnl 47E87Dh
  '0047E86E: push 00000058h
  '0047E870: push 00413F90h
  '0047E875: push esi
  '0047E876: push eax
  '0047E877: call [004010A8h]
  '0047E87D: mov esi, [0040130Ch]
  '0047E883: push 00000001h
  '0047E885: lea eax, [ebp-28h]
  '0047E888: push 0040FE84h
  '0047E88D: push eax
  '0047E88E: call esi
  '0047E890: push eax
  '0047E891: lea ecx, [ebp-24h]
  '0047E894: push 0040FE84h
  '0047E899: push ecx
  '0047E89A: call esi
  '0047E89C: mov edx, [ebp-14h]
  '0047E89F: push eax
  '0047E8A0: lea eax, [ebp-20h]
  '0047E8A3: push edx
  '0047E8A4: push eax
  '0047E8A5: call esi
  '0047E8A7: push eax
  '0047E8A8: lea ecx, [ebp-1Ch]
  '0047E8AB: push 00410D60h
  '0047E8B0: push ecx
  '0047E8B1: call esi
  '0047E8B3: mov edx, [ebp-2Ch]
  '0047E8B6: push eax
  '0047E8B7: push edx
  '0047E8B8: call 00410194h
  '0047E8BD: call [004010A4h]
  '0047E8C3: mov eax, [ebp-20h]
  '0047E8C6: lea ecx, [ebp-14h]
  '0047E8C9: push eax
  '0047E8CA: push ecx
  '0047E8CB: call [00401228h]
  '0047E8D1: lea edx, [ebp-28h]
  '0047E8D4: lea eax, [ebp-24h]
  '0047E8D7: push edx
  '0047E8D8: lea ecx, [ebp-20h]
  '0047E8DB: push eax
  '0047E8DC: lea edx, [ebp-1Ch]
  '0047E8DF: push ecx
  '0047E8E0: push edx
  '0047E8E1: push 00000004h
  '0047E8E3: call [004012CCh]
  '0047E8E9: add esp, 00000014h
  '0047E8EC: push 0047E919h
  '0047E8F1: jmp 47E90Fh
  '0047E8F3: lea eax, [ebp-28h]
  '0047E8F6: lea ecx, [ebp-24h]
  '0047E8F9: push eax
  '0047E8FA: lea edx, [ebp-20h]
  '0047E8FD: push ecx
  '0047E8FE: lea eax, [ebp-1Ch]
  '0047E901: push edx
  '0047E902: push eax
  '0047E903: push 00000004h
  '0047E905: call [004012CCh]
  '0047E90B: add esp, 00000014h
  '0047E90E: ret 
End Sub
Private Sub PictureHeight_47F810
  '0047F810: push ebp
  '0047F811: mov ebp, esp
  '0047F813: sub esp, 00000008h
  '0047F816: push 00403796h
  '0047F81B: mov eax, fs:[00h]
  '0047F821: push eax
  '0047F822: mov fs:[00000000h], esp
  '0047F829: sub esp, 00000050h
  '0047F82C: push ebx
  '0047F82D: push esi
  '0047F82E: push edi
  '0047F82F: mov [ebp-08h], esp
  '0047F832: mov [ebp-04h], 00402668h
  '0047F839: mov esi, [ebp+08h]
  '0047F83C: mov eax, 00000001h
  '0047F841: lea ecx, [ebp-50h]
  '0047F844: xor edi, edi
  '0047F846: mov [esi+000000DCh], eax
  '0047F84C: mov [esi+000000E0h], eax
  '0047F852: mov [esi+000000D8h], eax
  '0047F858: mov [esi+000000D4h], 00000014h
  '0047F862: mov eax, [esi]
  '0047F864: push ecx
  '0047F865: push esi
  '0047F866: mov [ebp-20h], edi
  '0047F869: mov [ebp-2Ch], edi
  '0047F86C: mov [ebp-3Ch], edi
  '0047F86F: mov [ebp-4Ch], edi
  '0047F872: mov [ebp-50h], edi
  '0047F875: call [eax+000000D8h]
  '0047F87B: cmp eax, edi
  '0047F87D: fclex 
  '0047F87F: jnl 47F893h
  '0047F881: push 000000D8h
  '0047F886: push 0041FF4Ch
  '0047F88B: push esi
  '0047F88C: push eax
  '0047F88D: call [004010A8h]
  '0047F893: mov edx, [esi+000000B8h]
  '0047F899: lea ebx, [esi+000000B8h]
  '0047F89F: lea eax, [esi+000000D4h]
  '0047F8A5: lea edi, [esi+68h]
  '0047F8A8: push eax
  '0047F8A9: push 00000415h
  '0047F8AE: push edi
  '0047F8AF: push edx
  '0047F8B0: call [0040103Ch]
  '0047F8B6: push eax
  '0047F8B7: mov eax, [ebx]
  '0047F8B9: lea ecx, [ebp-2Ch]
  '0047F8BC: push eax
  '0047F8BD: push ecx
  '0047F8BE: call [0040130Ch]
  '0047F8C4: mov edx, [ebp-50h]
  '0047F8C7: push eax
  '0047F8C8: push edx
  '0047F8C9: call 00420668h
  '0047F8CE: call [004010A4h]
  '0047F8D4: mov eax, [ebp-2Ch]
  '0047F8D7: push eax
  '0047F8D8: push ebx
  '0047F8D9: call [00401228h]
  '0047F8DF: lea ecx, [ebp-2Ch]
  '0047F8E2: call [0040138Ch]
  '0047F8E8: mov ecx, [esi+70h]
  '0047F8EB: mov edx, [edi]
  '0047F8ED: sub ecx, edx
  '0047F8EF: lea edx, [ebp-4Ch]
  '0047F8F2: jo 0047F9E3h
  '0047F8F8: mov [ebp-44h], ecx
  '0047F8FB: lea ecx, [ebp-20h]
  '0047F8FE: mov [ebp-4Ch], 00000003h
  '0047F905: call [00401024h]
  '0047F90B: mov ebx, [esi+74h]
  '0047F90E: mov eax, [esi+6Ch]
  '0047F911: mov ecx, [esi+48h]
  '0047F914: mov edx, [esi+70h]
  '0047F917: sub ebx, eax
  '0047F919: mov eax, [esi+50h]
  '0047F91C: jo 0047F9E3h
  '0047F922: sub eax, ecx
  '0047F924: mov [ebp-4Ch], 00000003h
  '0047F92B: jo 0047F9E3h
  '0047F931: sub edx, [edi]
  '0047F933: jo 0047F9E3h
  '0047F939: sub eax, edx
  '0047F93B: jo 0047F9E3h
  '0047F941: cdq 
  '0047F942: sub eax, edx
  '0047F944: sar eax, 01h
  '0047F946: add eax, ecx
  '0047F948: jo 0047F9E3h
  '0047F94E: mov [edi], eax
  '0047F950: mov ecx, [esi+4Ch]
  '0047F953: mov eax, [esi+54h]
  '0047F956: mov edx, [esi+74h]
  '0047F959: sub eax, ecx
  '0047F95B: jo 0047F9E3h
  '0047F961: sub edx, [esi+6Ch]
  '0047F964: jo 47F9E3h
  '0047F966: sub eax, edx
  '0047F968: jo 47F9E3h
  '0047F96A: cdq 
  '0047F96B: sub eax, edx
  '0047F96D: lea edx, [ebp-20h]
  '0047F970: sar eax, 01h
  '0047F972: add eax, ecx
  '0047F974: lea ecx, [ebp-4Ch]
  '0047F977: jo 47F9E3h
  '0047F979: mov [edi+04h], eax
  '0047F97C: mov eax, [edi]
  '0047F97E: mov [ebp-44h], eax
  '0047F981: push ecx
  '0047F982: lea eax, [ebp-3Ch]
  '0047F985: push edx
  '0047F986: push eax
  '0047F987: call [00401300h]
  '0047F98D: push eax
  '0047F98E: call [004012ECh]
  '0047F994: lea ecx, [ebp-3Ch]
  '0047F997: mov [edi+08h], eax
  '0047F99A: call [00401034h]
  '0047F9A0: mov ecx, [esi+6Ch]
  '0047F9A3: push 0047F9CEh
  '0047F9A8: add ecx, ebx
  '0047F9AA: jo 47F9E3h
  '0047F9AC: mov [edi+0Ch], ecx
  '0047F9AF: jmp 47F9C4h
  '0047F9B1: lea ecx, [ebp-2Ch]
  '0047F9B4: call [0040138Ch]
  '0047F9BA: lea ecx, [ebp-3Ch]
  '0047F9BD: call [00401034h]
  '0047F9C3: ret 
End Sub
Private Sub PictureSize_47F9F0
  '0047F9F0: push ebp
  '0047F9F1: mov ebp, esp
  '0047F9F3: sub esp, 00000008h
  '0047F9F6: push 00403796h
  '0047F9FB: mov eax, fs:[00h]
  '0047FA01: push eax
  '0047FA02: mov fs:[00000000h], esp
  '0047FA09: sub esp, 00000040h
  '0047FA0C: push ebx
  '0047FA0D: push esi
  '0047FA0E: push edi
  '0047FA0F: mov [ebp-08h], esp
  '0047FA12: mov [ebp-04h], 00402678h
  '0047FA19: mov esi, [ebp+08h]
  '0047FA1C: xor eax, eax
  '0047FA1E: mov [ebp-20h], eax
  '0047FA21: xor ebx, ebx
  '0047FA23: mov ecx, [esi+000000B8h]
  '0047FA29: lea edi, [esi+000000B8h]
  '0047FA2F: mov [ebp-1Ch], eax
  '0047FA32: push ecx
  '0047FA33: mov [ebp-18h], eax
  '0047FA36: push 0040FE84h
  '0047FA3B: mov [ebp-14h], eax
  '0047FA3E: mov [ebp-24h], ebx
  '0047FA41: mov [ebp-2Ch], ebx
  '0047FA44: mov [ebp-30h], ebx
  '0047FA47: mov [ebp-34h], ebx
  '0047FA4A: mov [ebp-38h], ebx
  '0047FA4D: mov [ebp-3Ch], ebx
  '0047FA50: call [00401184h]
  '0047FA56: test eax, eax
  '0047FA58: jz 0047FDD3h
  '0047FA5E: mov edx, [esi]
  '0047FA60: lea eax, [ebp-34h]
  '0047FA63: push eax
  '0047FA64: push esi
  '0047FA65: call [edx+000000D8h]
  '0047FA6B: cmp eax, ebx
  '0047FA6D: fclex 
  '0047FA6F: jnl 47FA83h
  '0047FA71: push 000000D8h
  '0047FA76: push 0041FF4Ch
  '0047FA7B: push esi
  '0047FA7C: push eax
  '0047FA7D: call [004010A8h]
  '0047FA83: mov ecx, [esi]
  '0047FA85: lea edx, [ebp-38h]
  '0047FA88: lea eax, [esi+00000118h]
  '0047FA8E: push edx
  '0047FA8F: push eax
  '0047FA90: push esi
  '0047FA91: call [ecx+00000918h]
  '0047FA97: mov ecx, [ebp-38h]
  '0047FA9A: mov edx, [ebp-34h]
  '0047FA9D: push ecx
  '0047FA9E: push edx
  '0047FA9F: call 00420328h
  '0047FAA4: call [004010A4h]
  '0047FAAA: lea ebx, [esi+68h]
  '0047FAAD: lea eax, [esi+78h]
  '0047FAB0: push ebx
  '0047FAB1: push eax
  '0047FAB2: push 00000010h
  '0047FAB4: mov [ebp-50h], eax
  '0047FAB7: call [00401088h]
  '0047FABD: cmp byte ptr [esi+000000E9h], 01h
  '0047FAC4: jnz 47FB09h
  '0047FAC6: cmp [esi+000000C0h], 00000002h
  '0047FACD: jz 47FB09h
  '0047FACF: mov eax, [ebx]
  '0047FAD1: add eax, 00000001h
  '0047FAD4: jo 0047FDFAh
  '0047FADA: mov [ebx], eax
  '0047FADC: mov ecx, [esi+6Ch]
  '0047FADF: add ecx, 00000001h
  '0047FAE2: jo 0047FDFAh
  '0047FAE8: mov [ebx+04h], ecx
  '0047FAEB: mov edx, [esi+70h]
  '0047FAEE: add edx, 00000001h
  '0047FAF1: jo 0047FDFAh
  '0047FAF7: mov [ebx+08h], edx
  '0047FAFA: mov eax, [esi+74h]
  '0047FAFD: add eax, 00000001h
  '0047FB00: jo 0047FDFAh
  '0047FB06: mov [ebx+0Ch], eax
  '0047FB09: mov ecx, [esi]
  '0047FB0B: lea edx, [ebp-30h]
  '0047FB0E: push edx
  '0047FB0F: push esi
  '0047FB10: call [ecx+000007A8h]
  '0047FB16: test eax, eax
  '0047FB18: jnl 47FB2Ch
  '0047FB1A: push 000007A8h
  '0047FB1F: push 0041FF7Ch
  '0047FB24: push esi
  '0047FB25: push eax
  '0047FB26: call [004010A8h]
  '0047FB2C: cmp word ptr [ebp-30h], 0000h
  '0047FB31: jnz 0047FD5Ch
  '0047FB37: mov eax, [esi+10h]
  '0047FB3A: lea edx, [ebp-34h]
  '0047FB3D: push edx
  '0047FB3E: push eax
  '0047FB3F: mov ecx, [eax]
  '0047FB41: call [ecx+68h]
  '0047FB44: test eax, eax
  '0047FB46: fclex 
  '0047FB48: jnl 47FB5Ch
  '0047FB4A: mov ecx, [esi+10h]
  '0047FB4D: push 00000068h
  '0047FB4F: push 0041FF4Ch
  '0047FB54: push ecx
  '0047FB55: push eax
  '0047FB56: call [004010A8h]
  '0047FB5C: mov edx, [ebp-34h]
  '0047FB5F: mov eax, [esi]
  '0047FB61: lea ecx, [ebp-34h]
  '0047FB64: mov [ebp-24h], edx
  '0047FB67: push ecx
  '0047FB68: push esi
  '0047FB69: call [eax+000000D8h]
  '0047FB6F: test eax, eax
  '0047FB71: fclex 
  '0047FB73: jnl 47FB87h
  '0047FB75: push 000000D8h
  '0047FB7A: push 0041FF4Ch
  '0047FB7F: push esi
  '0047FB80: push eax
  '0047FB81: call [004010A8h]
  '0047FB87: mov edx, [esi]
  '0047FB89: lea eax, [ebp-3Ch]
  '0047FB8C: lea ecx, [ebp-38h]
  '0047FB8F: push eax
  '0047FB90: push ecx
  '0047FB91: push esi
  '0047FB92: mov [ebp-38h], 80000014h
  '0047FB99: call [edx+00000918h]
  '0047FB9F: mov edx, [ebp-3Ch]
  '0047FBA2: mov eax, [ebp-34h]
  '0047FBA5: push edx
  '0047FBA6: push eax
  '0047FBA7: call 00420328h
  '0047FBAC: call [004010A4h]
  '0047FBB2: mov edx, [ebx]
  '0047FBB4: mov eax, [esi+70h]
  '0047FBB7: mov ecx, [esi+74h]
  '0047FBBA: add edx, 00000001h
  '0047FBBD: jo 0047FDFAh
  '0047FBC3: add eax, 00000001h
  '0047FBC6: mov [ebp-14h], ecx
  '0047FBC9: mov ecx, [esi+6Ch]
  '0047FBCC: mov [ebp-20h], edx
  '0047FBCF: mov edx, [esi]
  '0047FBD1: jo 0047FDFAh
  '0047FBD7: mov [ebp-18h], eax
  '0047FBDA: lea eax, [ebp-34h]
  '0047FBDD: add ecx, 00000001h
  '0047FBE0: push eax
  '0047FBE1: jo 0047FDFAh
  '0047FBE7: push esi
  '0047FBE8: mov [ebp-1Ch], ecx
  '0047FBEB: call [edx+000000D8h]
  '0047FBF1: test eax, eax
  '0047FBF3: fclex 
  '0047FBF5: jnl 47FC09h
  '0047FBF7: push 000000D8h
  '0047FBFC: push 0041FF4Ch
  '0047FC01: push esi
  '0047FC02: push eax
  '0047FC03: call [004010A8h]
  '0047FC09: mov edx, [edi]
  '0047FC0B: lea eax, [esi+000000D4h]
  '0047FC11: push eax
  '0047FC12: lea ecx, [ebp-20h]
  '0047FC15: push 00000015h
  '0047FC17: push ecx
  '0047FC18: push edx
  '0047FC19: call [0040103Ch]
  '0047FC1F: push eax
  '0047FC20: mov eax, [edi]
  '0047FC22: lea ecx, [ebp-2Ch]
  '0047FC25: push eax
  '0047FC26: push ecx
  '0047FC27: call [0040130Ch]
  '0047FC2D: mov edx, [ebp-34h]
  '0047FC30: push eax
  '0047FC31: push edx
  '0047FC32: call 00420668h
  '0047FC37: call [004010A4h]
  '0047FC3D: mov eax, [ebp-2Ch]
  '0047FC40: push eax
  '0047FC41: push edi
  '0047FC42: call [00401228h]
  '0047FC48: lea ecx, [ebp-2Ch]
  '0047FC4B: call [0040138Ch]
  '0047FC51: mov ecx, [esi]
  '0047FC53: lea edx, [ebp-34h]
  '0047FC56: push edx
  '0047FC57: push esi
  '0047FC58: call [ecx+000000D8h]
  '0047FC5E: test eax, eax
  '0047FC60: fclex 
  '0047FC62: jnl 47FC76h
  '0047FC64: push 000000D8h
  '0047FC69: push 0041FF4Ch
  '0047FC6E: push esi
  '0047FC6F: push eax
  '0047FC70: call [004010A8h]
  '0047FC76: mov eax, [esi]
  '0047FC78: lea ecx, [ebp-3Ch]
  '0047FC7B: lea edx, [ebp-38h]
  '0047FC7E: push ecx
  '0047FC7F: push edx
  '0047FC80: push esi
  '0047FC81: mov [ebp-38h], 80000010h
  '0047FC88: call [eax+00000918h]
  '0047FC8E: mov eax, [ebp-3Ch]
  '0047FC91: mov ecx, [ebp-34h]
  '0047FC94: push eax
  '0047FC95: push ecx
  '0047FC96: call 00420328h
  '0047FC9B: call [004010A4h]
  '0047FCA1: mov edx, [esi]
  '0047FCA3: lea eax, [ebp-34h]
  '0047FCA6: push eax
  '0047FCA7: push esi
  '0047FCA8: call [edx+000000D8h]
  '0047FCAE: test eax, eax
  '0047FCB0: fclex 
  '0047FCB2: jnl 47FCC6h
  '0047FCB4: push 000000D8h
  '0047FCB9: push 0041FF4Ch
  '0047FCBE: push esi
  '0047FCBF: push eax
  '0047FCC0: call [004010A8h]
  '0047FCC6: mov ecx, [edi]
  '0047FCC8: lea eax, [esi+000000D4h]
  '0047FCCE: push eax
  '0047FCCF: push 00000015h
  '0047FCD1: push ebx
  '0047FCD2: push ecx
  '0047FCD3: call [0040103Ch]
  '0047FCD9: mov edx, [edi]
  '0047FCDB: push eax
  '0047FCDC: lea eax, [ebp-2Ch]
  '0047FCDF: push edx
  '0047FCE0: push eax
  '0047FCE1: call [0040130Ch]
  '0047FCE7: mov ecx, [ebp-34h]
  '0047FCEA: push eax
  '0047FCEB: push ecx
  '0047FCEC: call 00420668h
  '0047FCF1: mov ebx, [004010A4h]
  '0047FCF7: call ebx
  '0047FCF9: mov edx, [ebp-2Ch]
  '0047FCFC: push edx
  '0047FCFD: push edi
  '0047FCFE: call [00401228h]
  '0047FD04: lea ecx, [ebp-2Ch]
  '0047FD07: call [0040138Ch]
  '0047FD0D: mov eax, [esi]
  '0047FD0F: lea ecx, [ebp-34h]
  '0047FD12: push ecx
  '0047FD13: push esi
  '0047FD14: call [eax+000000D8h]
  '0047FD1A: test eax, eax
  '0047FD1C: fclex 
  '0047FD1E: jnl 47FD32h
  '0047FD20: push 000000D8h
  '0047FD25: push 0041FF4Ch
  '0047FD2A: push esi
  '0047FD2B: push eax
  '0047FD2C: call [004010A8h]
  '0047FD32: mov edx, [esi]
  '0047FD34: lea eax, [ebp-38h]
  '0047FD37: lea ecx, [ebp-24h]
  '0047FD3A: push eax
  '0047FD3B: push ecx
  '0047FD3C: push esi
  '0047FD3D: call [edx+00000918h]
  '0047FD43: mov edx, [ebp-38h]
  '0047FD46: mov eax, [ebp-34h]
  '0047FD49: push edx
  '0047FD4A: push eax
  '0047FD4B: call 00420328h
  '0047FD50: call ebx
  '0047FD52: push 0047FDE5h
  '0047FD57: jmp 0047FDE4h
  '0047FD5C: mov ecx, [esi]
  '0047FD5E: lea edx, [ebp-34h]
  '0047FD61: push edx
  '0047FD62: push esi
  '0047FD63: call [ecx+000000D8h]
  '0047FD69: test eax, eax
  '0047FD6B: fclex 
  '0047FD6D: jnl 47FD81h
  '0047FD6F: push 000000D8h
  '0047FD74: push 0041FF4Ch
  '0047FD79: push esi
  '0047FD7A: push eax
  '0047FD7B: call [004010A8h]
  '0047FD81: mov eax, [edi]
  '0047FD83: add esi, 000000D4h
  '0047FD89: push esi
  '0047FD8A: push 00000015h
  '0047FD8C: push ebx
  '0047FD8D: push eax
  '0047FD8E: call [0040103Ch]
  '0047FD94: mov ecx, [edi]
  '0047FD96: push eax
  '0047FD97: lea edx, [ebp-2Ch]
  '0047FD9A: push ecx
  '0047FD9B: push edx
  '0047FD9C: call [0040130Ch]
  '0047FDA2: push eax
  '0047FDA3: mov eax, [ebp-34h]
  '0047FDA6: push eax
  '0047FDA7: call 00420668h
  '0047FDAC: call [004010A4h]
  '0047FDB2: mov ecx, [ebp-2Ch]
  '0047FDB5: push ecx
  '0047FDB6: push edi
  '0047FDB7: call [00401228h]
  '0047FDBD: lea ecx, [ebp-2Ch]
  '0047FDC0: call [0040138Ch]
  '0047FDC6: mov edx, [ebp-50h]
  '0047FDC9: push edx
  '0047FDCA: push ebx
  '0047FDCB: push 00000010h
  '0047FDCD: call [00401088h]
  '0047FDD3: push 0047FDE5h
  '0047FDD8: jmp 47FDE4h
  '0047FDDA: lea ecx, [ebp-2Ch]
  '0047FDDD: call [0040138Ch]
  '0047FDE3: ret 
End Sub
Private Sub PictureSize_47FE00
  '0047FE00: push ebp
  '0047FE01: mov ebp, esp
  '0047FE03: sub esp, 00000008h
  '0047FE06: push 00403796h
  '0047FE0B: mov eax, fs:[00h]
  '0047FE11: push eax
  '0047FE12: mov fs:[00000000h], esp
  '0047FE19: sub esp, 0000005Ch
  '0047FE1C: push ebx
  '0047FE1D: push esi
  '0047FE1E: push edi
  '0047FE1F: mov [ebp-08h], esp
  '0047FE22: mov [ebp-04h], 00402688h
  '0047FE29: mov esi, [ebp+08h]
  '0047FE2C: lea ecx, [ebp-4Ch]
  '0047FE2F: xor edi, edi
  '0047FE31: push ecx
  '0047FE32: mov eax, [esi]
  '0047FE34: push esi
  '0047FE35: mov [ebp-24h], edi
  '0047FE38: mov [ebp-2Ch], edi
  '0047FE3B: mov [ebp-34h], edi
  '0047FE3E: mov [ebp-44h], edi
  '0047FE41: mov byte ptr [ebp-48h], 00h
  '0047FE45: mov [ebp-4Ch], edi
  '0047FE48: mov [ebp-50h], edi
  '0047FE4B: mov [ebp-54h], edi
  '0047FE4E: mov [ebp-58h], edi
  '0047FE51: mov [ebp-5Ch], edi
  '0047FE54: mov [ebp-60h], edi
  '0047FE57: call [eax+000000D8h]
  '0047FE5D: cmp eax, edi
  '0047FE5F: fclex 
  '0047FE61: jnl 47FE79h
  '0047FE63: mov ebx, [004010A8h]
  '0047FE69: push 000000D8h
  '0047FE6E: push 0041FF4Ch
  '0047FE73: push esi
  '0047FE74: push eax
  '0047FE75: call ebx
  '0047FE77: jmp 47FE7Fh
  '0047FE79: mov ebx, [004010A8h]
  '0047FE7F: mov edx, [ebp-4Ch]
  '0047FE82: push edx
  '0047FE83: call 0041289Ch
  '0047FE88: mov edi, [004010A4h]
  '0047FE8E: mov [ebp-50h], eax
  '0047FE91: call edi
  '0047FE93: mov eax, [ebp-50h]
  '0047FE96: mov ecx, [esi]
  '0047FE98: lea edx, [ebp-4Ch]
  '0047FE9B: mov [ebp-24h], eax
  '0047FE9E: push edx
  '0047FE9F: push esi
  '0047FEA0: call [ecx+000000D8h]
  '0047FEA6: test eax, eax
  '0047FEA8: fclex 
  '0047FEAA: jnl 47FEBAh
  '0047FEAC: push 000000D8h
  '0047FEB1: push 0041FF4Ch
  '0047FEB6: push esi
  '0047FEB7: push eax
  '0047FEB8: call ebx
  '0047FEBA: mov eax, [ebp-4Ch]
  '0047FEBD: push eax
  '0047FEBE: call 0041289Ch
  '0047FEC3: mov [ebp-50h], eax
  '0047FEC6: call edi
  '0047FEC8: mov ecx, [ebp-50h]
  '0047FECB: mov edx, [esi]
  '0047FECD: lea eax, [ebp-4Ch]
  '0047FED0: mov [ebp-2Ch], ecx
  '0047FED3: push eax
  '0047FED4: push esi
  '0047FED5: call [edx+000000D8h]
  '0047FEDB: test eax, eax
  '0047FEDD: fclex 
  '0047FEDF: jnl 47FEEFh
  '0047FEE1: push 000000D8h
  '0047FEE6: push 0041FF4Ch
  '0047FEEB: push esi
  '0047FEEC: push eax
  '0047FEED: call ebx
  '0047FEEF: mov ecx, [esi+000000ACh]
  '0047FEF5: mov edx, [esi+000000A8h]
  '0047FEFB: mov eax, [ebp-4Ch]
  '0047FEFE: lea ebx, [esi+000000ACh]
  '0047FF04: push ecx
  '0047FF05: push edx
  '0047FF06: push eax
  '0047FF07: call 004128ECh
  '0047FF0C: mov [ebp-50h], eax
  '0047FF0F: call edi
  '0047FF11: mov ecx, [ebp-50h]
  '0047FF14: mov edx, [esi]
  '0047FF16: lea eax, [ebp-4Ch]
  '0047FF19: mov [ebp-20h], ecx
  '0047FF1C: push eax
  '0047FF1D: push esi
  '0047FF1E: call [edx+000000D8h]
  '0047FF24: test eax, eax
  '0047FF26: fclex 
  '0047FF28: jnl 47FF3Ch
  '0047FF2A: push 000000D8h
  '0047FF2F: push 0041FF4Ch
  '0047FF34: push esi
  '0047FF35: push eax
  '0047FF36: call [004010A8h]
  '0047FF3C: mov ecx, [esi+000000CCh]
  '0047FF42: mov edx, [esi+000000C8h]
  '0047FF48: mov eax, [ebp-4Ch]
  '0047FF4B: push ecx
  '0047FF4C: push edx
  '0047FF4D: push eax
  '0047FF4E: call 004128ECh
  '0047FF53: mov [ebp-50h], eax
  '0047FF56: call edi
  '0047FF58: mov edx, [ebp-20h]
  '0047FF5B: mov eax, [ebp-24h]
  '0047FF5E: mov ecx, [ebp-50h]
  '0047FF61: push edx
  '0047FF62: push eax
  '0047FF63: mov [ebp-28h], ecx
  '0047FF66: call 00412934h
  '0047FF6B: mov [ebp-4Ch], eax
  '0047FF6E: call edi
  '0047FF70: mov edx, [ebp-28h]
  '0047FF73: mov eax, [ebp-2Ch]
  '0047FF76: mov ecx, [ebp-4Ch]
  '0047FF79: push edx
  '0047FF7A: push eax
  '0047FF7B: mov [ebp-18h], ecx
  '0047FF7E: call 00412934h
  '0047FF83: mov [ebp-4Ch], eax
  '0047FF86: call edi
  '0047FF88: mov edx, [ebp+0Ch]
  '0047FF8B: mov ecx, [ebp-4Ch]
  '0047FF8E: mov [ebp-1Ch], ecx
  '0047FF91: cmp byte ptr [edx], 00h
  '0047FF94: jnz 004801BBh
  '0047FF9A: mov eax, [esi]
  '0047FF9C: lea ecx, [ebp-4Ch]
  '0047FF9F: push ecx
  '0047FFA0: push esi
  '0047FFA1: call [eax+000000D8h]
  '0047FFA7: test eax, eax
  '0047FFA9: fclex 
  '0047FFAB: jnl 47FFBFh
  '0047FFAD: push 000000D8h
  '0047FFB2: push 0041FF4Ch
  '0047FFB7: push esi
  '0047FFB8: push eax
  '0047FFB9: call [004010A8h]
  '0047FFBF: mov edx, [ebp-4Ch]
  '0047FFC2: push edx
  '0047FFC3: call 0041289Ch
  '0047FFC8: mov [ebp-50h], eax
  '0047FFCB: call edi
  '0047FFCD: mov ecx, [esi+000000C4h]
  '0047FFD3: mov eax, [ebp-50h]
  '0047FFD6: push 00000000h
  '0047FFD8: push 00000000h
  '0047FFDA: lea edx, [ebp-44h]
  '0047FFDD: push ecx
  '0047FFDE: push edx
  '0047FFDF: mov [ebp-34h], eax
  '0047FFE2: call [004011D4h]
  '0047FFE8: add esp, 00000010h
  '0047FFEB: push eax
  '0047FFEC: call [004012ECh]
  '0047FFF2: push eax
  '0047FFF3: mov eax, [ebp-34h]
  '0047FFF6: push eax
  '0047FFF7: call 00412934h
  '0047FFFC: mov [ebp-4Ch], eax
  '0047FFFF: call edi
  '00480001: mov ecx, [ebp-4Ch]
  '00480004: mov [ebp-30h], ecx
  '00480007: lea ecx, [ebp-44h]
  '0048000A: call [00401034h]
  '00480010: mov edx, [ebp-24h]
  '00480013: push 00FFFFFFh
  '00480018: push edx
  '00480019: call 00412AA8h
  '0048001E: call edi
  '00480020: mov ecx, 00000001h
  '00480025: call [004011F4h]
  '0048002B: mov edx, [ebx]
  '0048002D: lea ecx, [ebp-48h]
  '00480030: push ecx
  '00480031: mov ecx, [esi+000000A8h]
  '00480037: push 00FFFFFFh
  '0048003C: push edx
  '0048003D: push ecx
  '0048003E: push 00000000h
  '00480040: lea edx, [ebp-24h]
  '00480043: mov [ebp-48h], al
  '00480046: mov eax, [esi]
  '00480048: push 00000000h
  '0048004A: push edx
  '0048004B: push esi
  '0048004C: call [eax+00000924h]
  '00480052: xor eax, eax
  '00480054: lea edx, [esi+00000108h]
  '0048005A: mov [ebp-58h], eax
  '0048005D: mov [ebp-54h], eax
  '00480060: mov [ebp-50h], eax
  '00480063: mov [ebp-4Ch], eax
  '00480066: push edx
  '00480067: lea eax, [ebp-58h]
  '0048006A: lea edx, [ebp-54h]
  '0048006D: push eax
  '0048006E: push edx
  '0048006F: lea eax, [esi+000000A8h]
  '00480075: push ebx
  '00480076: push eax
  '00480077: mov ecx, [esi]
  '00480079: lea eax, [ebp-50h]
  '0048007C: push eax
  '0048007D: lea edx, [ebp-4Ch]
  '00480080: lea eax, [ebp-34h]
  '00480083: push edx
  '00480084: push eax
  '00480085: lea edx, [ebp-24h]
  '00480088: lea eax, [ebp-24h]
  '0048008B: push edx
  '0048008C: push eax
  '0048008D: push esi
  '0048008E: call [ecx+00000930h]
  '00480094: mov ecx, [ebx]
  '00480096: mov edx, [esi+000000A8h]
  '0048009C: push 00CC0020h
  '004800A1: push ecx
  '004800A2: push edx
  '004800A3: mov eax, [ebp-24h]
  '004800A6: mov ecx, [esi+000000CCh]
  '004800AC: mov edx, [esi+000000C8h]
  '004800B2: push 00000000h
  '004800B4: push 00000000h
  '004800B6: push eax
  '004800B7: mov eax, [ebp-2Ch]
  '004800BA: push ecx
  '004800BB: push edx
  '004800BC: push 00000000h
  '004800BE: push 00000000h
  '004800C0: push eax
  '004800C1: call 00412A00h
  '004800C6: call edi
  '004800C8: mov ecx, [ebp-1Ch]
  '004800CB: mov edx, [ebp-2Ch]
  '004800CE: push ecx
  '004800CF: push edx
  '004800D0: call 00412934h
  '004800D5: call edi
  '004800D7: mov eax, [ebp+14h]
  '004800DA: cmp byte ptr [eax], 01h
  '004800DD: jnz 480156h
  '004800DF: push 00000092h
  '004800E4: push 00000092h
  '004800E9: push 00000092h
  '004800EE: call [00401044h]
  '004800F4: push eax
  '004800F5: call 004202E0h
  '004800FA: mov [ebp-4Ch], eax
  '004800FD: call edi
  '004800FF: mov ecx, [esi]
  '00480101: mov ebx, [ebp-4Ch]
  '00480104: lea edx, [ebp-4Ch]
  '00480107: push edx
  '00480108: push esi
  '00480109: call [ecx+000000D8h]
  '0048010F: test eax, eax
  '00480111: fclex 
  '00480113: jnl 480127h
  '00480115: push 000000D8h
  '0048011A: push 0041FF4Ch
  '0048011F: push esi
  '00480120: push eax
  '00480121: call [004010A8h]
  '00480127: mov eax, [ebp+10h]
  '0048012A: push 00000084h
  '0048012F: push 00000000h
  '00480131: push 00000000h
  '00480133: mov ecx, [eax+04h]
  '00480136: mov edx, [eax]
  '00480138: mov eax, [ebp-28h]
  '0048013B: push ecx
  '0048013C: mov ecx, [ebp-4Ch]
  '0048013F: push edx
  '00480140: push 00000000h
  '00480142: push eax
  '00480143: push 00000000h
  '00480145: push ebx
  '00480146: push ecx
  '00480147: call 004204E8h
  '0048014C: call edi
  '0048014E: push ebx
  '0048014F: call 0041297Ch
  '00480154: jmp 48019Eh
  '00480156: mov edx, [esi]
  '00480158: lea eax, [ebp-4Ch]
  '0048015B: push eax
  '0048015C: push esi
  '0048015D: call [edx+000000D8h]
  '00480163: test eax, eax
  '00480165: fclex 
  '00480167: jnl 48017Bh
  '00480169: push 000000D8h
  '0048016E: push 0041FF4Ch
  '00480173: push esi
  '00480174: push eax
  '00480175: call [004010A8h]
  '0048017B: mov eax, [ebp+10h]
  '0048017E: push 00000024h
  '00480180: push 00000000h
  '00480182: push 00000000h
  '00480184: mov ecx, [eax+04h]
  '00480187: mov edx, [eax]
  '00480189: mov eax, [ebp-28h]
  '0048018C: push ecx
  '0048018D: mov ecx, [ebp-4Ch]
  '00480190: push edx
  '00480191: push 00000000h
  '00480193: push eax
  '00480194: push 00000000h
  '00480196: push 00000000h
  '00480198: push ecx
  '00480199: call 004204E8h
  '0048019E: call edi
  '004801A0: mov edx, [ebp-30h]
  '004801A3: push edx
  '004801A4: call 0041297Ch
  '004801A9: call edi
  '004801AB: mov eax, [ebp-34h]
  '004801AE: push eax
  '004801AF: call 004127F0h
  '004801B4: call edi
  '004801B6: jmp 004802CEh
  '004801BB: mov ecx, [esi+000000C4h]
  '004801C1: push 00000000h
  '004801C3: push 00000000h
  '004801C5: lea edx, [ebp-44h]
  '004801C8: push ecx
  '004801C9: push edx
  '004801CA: call [004011D4h]
  '004801D0: add esp, 00000010h
  '004801D3: lea eax, [ebp-44h]
  '004801D6: push 00000004h
  '004801D8: push 00000000h
  '004801DA: push 00000000h
  '004801DC: push 00000000h
  '004801DE: push 00000000h
  '004801E0: push 00000000h
  '004801E2: push eax
  '004801E3: call [004012ECh]
  '004801E9: mov ecx, [ebp-24h]
  '004801EC: push eax
  '004801ED: push 00000000h
  '004801EF: push 00000000h
  '004801F1: push ecx
  '004801F2: call 004204E8h
  '004801F7: call edi
  '004801F9: lea ecx, [ebp-44h]
  '004801FC: call [00401034h]
  '00480202: mov edx, [ebx]
  '00480204: mov eax, [esi+000000A8h]
  '0048020A: mov ecx, [ebp-24h]
  '0048020D: push 00CC0020h
  '00480212: push edx
  '00480213: mov edx, [esi+000000CCh]
  '00480219: lea ebx, [esi+000000CCh]
  '0048021F: push eax
  '00480220: mov eax, [esi+000000C8h]
  '00480226: push 00000000h
  '00480228: push 00000000h
  '0048022A: push ecx
  '0048022B: mov ecx, [ebp-2Ch]
  '0048022E: push edx
  '0048022F: push eax
  '00480230: push 00000000h
  '00480232: push 00000000h
  '00480234: push ecx
  '00480235: call 00412A00h
  '0048023A: call edi
  '0048023C: mov edx, [esi]
  '0048023E: lea eax, [ebp-4Ch]
  '00480241: push eax
  '00480242: push esi
  '00480243: call [edx+000000D8h]
  '00480249: test eax, eax
  '0048024B: fclex 
  '0048024D: jnl 480261h
  '0048024F: push 000000D8h
  '00480254: push 0041FF4Ch
  '00480259: push esi
  '0048025A: push eax
  '0048025B: call [004010A8h]
  '00480261: mov ecx, [esi]
  '00480263: lea edx, [ebp-50h]
  '00480266: push edx
  '00480267: push esi
  '00480268: call [ecx+000000D8h]
  '0048026E: test eax, eax
  '00480270: fclex 
  '00480272: jnl 480286h
  '00480274: push 000000D8h
  '00480279: push 0041FF4Ch
  '0048027E: push esi
  '0048027F: push eax
  '00480280: call [004010A8h]
  '00480286: xor eax, eax
  '00480288: mov ecx, [ebp-4Ch]
  '0048028B: mov [ebp-60h], eax
  '0048028E: mov [ebp-5Ch], eax
  '00480291: mov eax, [ebp-50h]
  '00480294: mov [ebp-54h], ecx
  '00480297: mov [ebp-58h], eax
  '0048029A: lea eax, [esi+00000108h]
  '004802A0: push eax
  '004802A1: mov eax, [ebp+10h]
  '004802A4: mov edx, [esi]
  '004802A6: lea ecx, [eax+04h]
  '004802A9: push ecx
  '004802AA: push eax
  '004802AB: lea eax, [esi+000000C8h]
  '004802B1: push ebx
  '004802B2: push eax
  '004802B3: lea eax, [ebp-60h]
  '004802B6: push eax
  '004802B7: lea ecx, [ebp-5Ch]
  '004802BA: lea eax, [ebp-2Ch]
  '004802BD: push ecx
  '004802BE: push eax
  '004802BF: lea ecx, [ebp-58h]
  '004802C2: lea eax, [ebp-54h]
  '004802C5: push ecx
  '004802C6: push eax
  '004802C7: push esi
  '004802C8: call [edx+00000930h]
  '004802CE: mov ecx, [ebp-18h]
  '004802D1: mov edx, [ebp-24h]
  '004802D4: push ecx
  '004802D5: push edx
  '004802D6: call 00412934h
  '004802DB: call edi
  '004802DD: mov eax, [ebp-1Ch]
  '004802E0: mov ecx, [ebp-2Ch]
  '004802E3: push eax
  '004802E4: push ecx
  '004802E5: call 00412934h
  '004802EA: call edi
  '004802EC: mov edx, [ebp-20h]
  '004802EF: push edx
  '004802F0: call 0041297Ch
  '004802F5: call edi
  '004802F7: mov eax, [ebp-28h]
  '004802FA: push eax
  '004802FB: call 0041297Ch
  '00480300: call edi
  '00480302: mov ecx, [ebp-24h]
  '00480305: push ecx
  '00480306: call 004127F0h
  '0048030B: call edi
  '0048030D: mov edx, [ebp-2Ch]
  '00480310: push edx
  '00480311: call 004127F0h
  '00480316: call edi
  '00480318: push 0048032Ah
  '0048031D: jmp 480329h
  '0048031F: lea ecx, [ebp-44h]
  '00480322: call [00401034h]
  '00480328: ret 
End Sub
Private Sub unknown_480340
  '00480340: push ebp
  '00480341: mov ebp, esp
  '00480343: sub esp, 00000008h
  '00480346: push 00403796h
  '0048034B: mov eax, fs:[00h]
  '00480351: push eax
  '00480352: mov fs:[00000000h], esp
  '00480359: sub esp, 000000D8h
  '0048035F: push ebx
  '00480360: push esi
  '00480361: push edi
  '00480362: mov [ebp-08h], esp
  '00480365: mov [ebp-04h], 00402698h
  '0048036C: mov eax, [ebp+0Ch]
  '0048036F: xor edi, edi
  '00480371: mov [ebp-2Ch], edi
  '00480374: mov [ebp-30h], edi
  '00480377: mov cl, [eax]
  '00480379: mov [ebp-40h], edi
  '0048037C: test cl, cl
  '0048037E: mov [ebp-50h], edi
  '00480381: mov [ebp-60h], edi
  '00480384: mov [ebp-70h], edi
  '00480387: mov [ebp-80h], edi
  '0048038A: mov [ebp-00000090h], edi
  '00480390: mov [ebp-000000A0h], edi
  '00480396: mov [ebp-000000B0h], edi
  '0048039C: mov [ebp-000000B4h], edi
  '004803A2: mov [ebp-000000B8h], edi
  '004803A8: mov [ebp-000000BCh], edi
  '004803AE: mov [ebp-000000C0h], edi
  '004803B4: mov [ebp-000000C4h], edi
  '004803BA: mov [ebp-000000C8h], edi
  '004803C0: mov [ebp-000000CCh], edi
  '004803C6: jnz 0048076Ah
  '004803CC: mov esi, [ebp+08h]
  '004803CF: lea edx, [ebp-000000B4h]
  '004803D5: push edx
  '004803D6: push esi
  '004803D7: mov ecx, [esi]
  '004803D9: call [ecx+000000D8h]
  '004803DF: cmp eax, edi
  '004803E1: fclex 
  '004803E3: jnl 4803F7h
  '004803E5: push 000000D8h
  '004803EA: push 0041FF4Ch
  '004803EF: push esi
  '004803F0: push eax
  '004803F1: call [004010A8h]
  '004803F7: mov eax, [ebp-000000B4h]
  '004803FD: push eax
  '004803FE: call 0041289Ch
  '00480403: mov edi, [004010A4h]
  '00480409: mov [ebp-000000B8h], eax
  '0048040F: call edi
  '00480411: mov ecx, [esi]
  '00480413: mov ebx, [ebp-000000B8h]
  '00480419: lea edx, [ebp-000000B4h]
  '0048041F: push edx
  '00480420: push esi
  '00480421: call [ecx+000000D8h]
  '00480427: test eax, eax
  '00480429: fclex 
  '0048042B: jnl 48043Fh
  '0048042D: push 000000D8h
  '00480432: push 0041FF4Ch
  '00480437: push esi
  '00480438: push eax
  '00480439: call [004010A8h]
  '0048043F: mov eax, [esi+000000ACh]
  '00480445: mov ecx, [esi+000000A8h]
  '0048044B: mov edx, [ebp-000000B4h]
  '00480451: push eax
  '00480452: push ecx
  '00480453: push edx
  '00480454: call 004128ECh
  '00480459: mov [ebp-000000B8h], eax
  '0048045F: call edi
  '00480461: mov eax, [ebp-000000B8h]
  '00480467: mov ecx, [esi]
  '00480469: lea edx, [ebp-000000B4h]
  '0048046F: mov [ebp-20h], eax
  '00480472: push edx
  '00480473: push esi
  '00480474: call [ecx+000000D8h]
  '0048047A: test eax, eax
  '0048047C: fclex 
  '0048047E: jnl 480492h
  '00480480: push 000000D8h
  '00480485: push 0041FF4Ch
  '0048048A: push esi
  '0048048B: push eax
  '0048048C: call [004010A8h]
  '00480492: mov eax, [ebp-000000B4h]
  '00480498: push eax
  '00480499: call 0041289Ch
  '0048049E: mov [ebp-000000B8h], eax
  '004804A4: call edi
  '004804A6: mov ecx, [ebp-000000B8h]
  '004804AC: mov edx, [esi]
  '004804AE: lea eax, [ebp-000000B4h]
  '004804B4: mov [ebp-2Ch], ecx
  '004804B7: push eax
  '004804B8: push esi
  '004804B9: call [edx+000000D8h]
  '004804BF: test eax, eax
  '004804C1: fclex 
  '004804C3: jnl 4804D7h
  '004804C5: push 000000D8h
  '004804CA: push 0041FF4Ch
  '004804CF: push esi
  '004804D0: push eax
  '004804D1: call [004010A8h]
  '004804D7: mov ecx, [esi+000000CCh]
  '004804DD: mov edx, [esi+000000C8h]
  '004804E3: mov eax, [ebp-000000B4h]
  '004804E9: push ecx
  '004804EA: push edx
  '004804EB: push eax
  '004804EC: call 004128ECh
  '004804F1: mov [ebp-000000B8h], eax
  '004804F7: call edi
  '004804F9: mov edx, [ebp-20h]
  '004804FC: mov ecx, [ebp-000000B8h]
  '00480502: push edx
  '00480503: push ebx
  '00480504: mov [ebp-28h], ecx
  '00480507: call 00412934h
  '0048050C: mov [ebp-000000B4h], eax
  '00480512: call edi
  '00480514: mov ecx, [ebp-28h]
  '00480517: mov edx, [ebp-2Ch]
  '0048051A: mov eax, [ebp-000000B4h]
  '00480520: push ecx
  '00480521: push edx
  '00480522: mov [ebp-18h], eax
  '00480525: call 00412934h
  '0048052A: mov [ebp-000000B4h], eax
  '00480530: call edi
  '00480532: mov eax, [ebp-000000B4h]
  '00480538: mov ecx, [ebp+14h]
  '0048053B: mov [ebp-1Ch], eax
  '0048053E: cmp byte ptr [ecx], 01h
  '00480541: jnz 004805C9h
  '00480547: push 00000092h
  '0048054C: push 00000092h
  '00480551: push 00000092h
  '00480556: call [00401044h]
  '0048055C: push eax
  '0048055D: call 004202E0h
  '00480562: mov [ebp-000000B4h], eax
  '00480568: call edi
  '0048056A: mov eax, [esi+000000C4h]
  '00480570: mov edx, [ebp-000000B4h]
  '00480576: push 00000000h
  '00480578: push 00000000h
  '0048057A: lea ecx, [ebp-40h]
  '0048057D: push eax
  '0048057E: push ecx
  '0048057F: mov [ebp-14h], edx
  '00480582: call [004011D4h]
  '00480588: add esp, 00000010h
  '0048058B: lea edx, [ebp-40h]
  '0048058E: push 00000083h
  '00480593: push 00000000h
  '00480595: push 00000000h
  '00480597: push 00000000h
  '00480599: push 00000000h
  '0048059B: push 00000000h
  '0048059D: push edx
  '0048059E: call [004012ECh]
  '004805A4: push eax
  '004805A5: mov eax, [ebp-14h]
  '004805A8: push 00000000h
  '004805AA: push eax
  '004805AB: push ebx
  '004805AC: call 004204E8h
  '004805B1: call edi
  '004805B3: lea ecx, [ebp-40h]
  '004805B6: call [00401034h]
  '004805BC: mov ecx, [ebp-14h]
  '004805BF: push ecx
  '004805C0: call 0041297Ch
  '004805C5: call edi
  '004805C7: jmp 48060Dh
  '004805C9: mov edx, [esi+000000C4h]
  '004805CF: push 00000000h
  '004805D1: push 00000000h
  '004805D3: lea eax, [ebp-40h]
  '004805D6: push edx
  '004805D7: push eax
  '004805D8: call [004011D4h]
  '004805DE: add esp, 00000010h
  '004805E1: lea ecx, [ebp-40h]
  '004805E4: push 00000023h
  '004805E6: push 00000000h
  '004805E8: push 00000000h
  '004805EA: push 00000000h
  '004805EC: push 00000000h
  '004805EE: push 00000000h
  '004805F0: push ecx
  '004805F1: call [004012ECh]
  '004805F7: push eax
  '004805F8: push 00000000h
  '004805FA: push 00000000h
  '004805FC: push ebx
  '004805FD: call 004204E8h
  '00480602: call edi
  '00480604: lea ecx, [ebp-40h]
  '00480607: call [00401034h]
  '0048060D: mov edx, [esi+000000ACh]
  '00480613: mov eax, [ebp+10h]
  '00480616: mov ecx, [esi+000000A8h]
  '0048061C: push 00CC0020h
  '00480621: push edx
  '00480622: mov edx, [eax+0Ch]
  '00480625: push ecx
  '00480626: mov ecx, [eax+04h]
  '00480629: push 00000000h
  '0048062B: sub edx, ecx
  '0048062D: mov ecx, [eax+08h]
  '00480630: push 00000000h
  '00480632: push ebx
  '00480633: jo 00480921h
  '00480639: push edx
  '0048063A: mov edx, [eax]
  '0048063C: sub ecx, edx
  '0048063E: mov edx, [ebp-2Ch]
  '00480641: jo 00480921h
  '00480647: push ecx
  '00480648: push 00000000h
  '0048064A: push 00000000h
  '0048064C: push edx
  '0048064D: call 00412A00h
  '00480652: call edi
  '00480654: mov eax, [esi]
  '00480656: lea ecx, [ebp-000000B4h]
  '0048065C: push ecx
  '0048065D: push esi
  '0048065E: call [eax+000000D8h]
  '00480664: test eax, eax
  '00480666: fclex 
  '00480668: jnl 48067Ch
  '0048066A: push 000000D8h
  '0048066F: push 0041FF4Ch
  '00480674: push esi
  '00480675: push eax
  '00480676: call [004010A8h]
  '0048067C: mov edx, [esi]
  '0048067E: lea eax, [ebp-000000B8h]
  '00480684: push eax
  '00480685: push esi
  '00480686: call [edx+000000D8h]
  '0048068C: xor ecx, ecx
  '0048068E: cmp eax, ecx
  '00480690: fclex 
  '00480692: jnl 4806A8h
  '00480694: push 000000D8h
  '00480699: push 0041FF4Ch
  '0048069E: push esi
  '0048069F: push eax
  '004806A0: call [004010A8h]
  '004806A6: xor ecx, ecx
  '004806A8: mov edx, [ebp-000000B4h]
  '004806AE: mov eax, [ebp+10h]
  '004806B1: mov [ebp-000000BCh], edx
  '004806B7: lea edx, [ebp-000000CCh]
  '004806BD: add eax, 00000004h
  '004806C0: push edx
  '004806C1: mov edx, [ebp+10h]
  '004806C4: push eax
  '004806C5: lea eax, [esi+000000CCh]
  '004806CB: push edx
  '004806CC: push eax
  '004806CD: lea eax, [esi+000000C8h]
  '004806D3: push eax
  '004806D4: lea eax, [ebp-000000C8h]
  '004806DA: push eax
  '004806DB: lea edx, [ebp-000000C4h]
  '004806E1: lea eax, [ebp-2Ch]
  '004806E4: mov [ebp-000000CCh], ecx
  '004806EA: mov [ebp-000000C8h], ecx
  '004806F0: mov [ebp-000000C4h], ecx
  '004806F6: mov ecx, [ebp-000000B8h]
  '004806FC: push edx
  '004806FD: push eax
  '004806FE: lea edx, [ebp-000000C0h]
  '00480704: lea eax, [ebp-000000BCh]
  '0048070A: mov [ebp-000000C0h], ecx
  '00480710: mov ecx, [esi]
  '00480712: push edx
  '00480713: push eax
  '00480714: push esi
  '00480715: call [ecx+00000930h]
  '0048071B: mov ecx, [ebp-18h]
  '0048071E: push ecx
  '0048071F: push ebx
  '00480720: call 00412934h
  '00480725: call edi
  '00480727: mov edx, [ebp-1Ch]
  '0048072A: mov eax, [ebp-2Ch]
  '0048072D: push edx
  '0048072E: push eax
  '0048072F: call 00412934h
  '00480734: call edi
  '00480736: mov ecx, [ebp-20h]
  '00480739: push ecx
  '0048073A: call 0041297Ch
  '0048073F: call edi
  '00480741: mov edx, [ebp-28h]
  '00480744: push edx
  '00480745: call 0041297Ch
  '0048074A: call edi
  '0048074C: push ebx
  '0048074D: call 004127F0h
  '00480752: call edi
  '00480754: mov eax, [ebp-2Ch]
  '00480757: push eax
  '00480758: call 004127F0h
  '0048075D: call edi
  '0048075F: wait 
  '00480760: push 0048090Ch
  '00480765: jmp 0048090Bh
  '0048076A: mov ecx, [ebp+10h]
  '0048076D: mov edx, 0000000Ah
  '00480772: mov esi, [ebp+08h]
  '00480775: mov [ebp-70h], 00000002h
  '0048077C: mov edi, [ecx+04h]
  '0048077F: mov eax, [ecx+0Ch]
  '00480782: mov [ebp-000000DCh], edi
  '00480788: sub eax, edi
  '0048078A: mov edi, [ecx]
  '0048078C: mov ecx, [ecx+08h]
  '0048078F: jo 00480921h
  '00480795: sub ecx, edi
  '00480797: mov [ebp-50h], 00000003h
  '0048079E: jo 00480921h
  '004807A4: sub esp, 00000010h
  '004807A7: mov [ebp-000000E0h], edi
  '004807AD: mov ebx, esp
  '004807AF: sub esp, 00000010h
  '004807B2: mov edi, [esi+10h]
  '004807B5: mov [ebx], edx
  '004807B7: mov edx, [ebp-000000ACh]
  '004807BD: mov edi, [edi]
  '004807BF: mov [ebx+04h], edx
  '004807C2: mov edx, 80020004h
  '004807C7: mov [ebx+08h], edx
  '004807CA: mov edx, [ebp-000000A4h]
  '004807D0: mov [ebx+0Ch], edx
  '004807D3: mov ebx, esp
  '004807D5: mov edx, 00000003h
  '004807DA: sub esp, 00000010h
  '004807DD: mov [ebx], edx
  '004807DF: mov edx, [ebp-0000009Ch]
  '004807E5: mov [ebx+04h], edx
  '004807E8: mov edx, [esi+000000ACh]
  '004807EE: mov [ebx+08h], edx
  '004807F1: mov edx, [ebp-00000094h]
  '004807F7: mov [ebx+0Ch], edx
  '004807FA: mov ebx, esp
  '004807FC: mov edx, 00000003h
  '00480801: sub esp, 00000010h
  '00480804: mov [ebx], edx
  '00480806: mov edx, [ebp-0000008Ch]
  '0048080C: mov [ebx+04h], edx
  '0048080F: mov edx, [esi+000000A8h]
  '00480815: mov [ebx+08h], edx
  '00480818: mov edx, [ebp-00000084h]
  '0048081E: mov [ebx+0Ch], edx
  '00480821: mov ebx, esp
  '00480823: mov edx, 00000002h
  '00480828: sub esp, 00000010h
  '0048082B: mov [ebx], edx
  '0048082D: mov edx, [ebp-7Ch]
  '00480830: mov [ebx+04h], edx
  '00480833: xor edx, edx
  '00480835: mov [ebx+08h], edx
  '00480838: mov edx, [ebp-74h]
  '0048083B: mov [ebx+0Ch], edx
  '0048083E: mov edx, [ebp-70h]
  '00480841: mov ebx, esp
  '00480843: sub esp, 00000010h
  '00480846: mov [ebx], edx
  '00480848: mov edx, [ebp-6Ch]
  '0048084B: mov [ebx+04h], edx
  '0048084E: xor edx, edx
  '00480850: mov [ebx+08h], edx
  '00480853: mov edx, [ebp-64h]
  '00480856: mov [ebx+0Ch], edx
  '00480859: mov ebx, esp
  '0048085B: mov edx, 00000003h
  '00480860: sub esp, 00000010h
  '00480863: mov [ebx], edx
  '00480865: mov edx, [ebp-5Ch]
  '00480868: mov [ebx+04h], edx
  '0048086B: mov edx, esp
  '0048086D: mov [ebx+08h], eax
  '00480870: mov eax, [ebp-54h]
  '00480873: mov [ebx+0Ch], eax
  '00480876: mov eax, [ebp-50h]
  '00480879: mov [edx], eax
  '0048087B: mov eax, [ebp-4Ch]
  '0048087E: mov [edx+04h], eax
  '00480881: fild dword ptr [ebp-000000DCh]
  '00480887: mov [edx+08h], ecx
  '0048088A: mov ecx, [ebp-44h]
  '0048088D: fstp real4 ptr [ebp-000000E4h]
  '00480893: fild dword ptr [ebp-000000E0h]
  '00480899: mov [edx+0Ch], ecx
  '0048089C: mov edx, [ebp-000000E4h]
  '004808A2: mov ecx, [esi+000000C4h]
  '004808A8: push edx
  '004808A9: fstp real4 ptr [ebp-000000E8h]
  '004808AF: mov eax, [ebp-000000E8h]
  '004808B5: lea edx, [ebp-30h]
  '004808B8: push eax
  '004808B9: push ecx
  '004808BA: push edx
  '004808BB: call [004010FCh]
  '004808C1: push eax
  '004808C2: mov eax, [esi+10h]
  '004808C5: push eax
  '004808C6: call [edi+00000364h]
  '004808CC: test eax, eax
  '004808CE: fclex 
  '004808D0: jnl 4808E7h
  '004808D2: mov ecx, [esi+10h]
  '004808D5: push 00000364h
  '004808DA: push 0041FF4Ch
  '004808DF: push ecx
  '004808E0: push eax
  '004808E1: call [004010A8h]
  '004808E7: lea ecx, [ebp-30h]
  '004808EA: call [00401388h]
  '004808F0: wait 
  '004808F1: push 0048090Ch
  '004808F6: jmp 48090Bh
  '004808F8: lea ecx, [ebp-30h]
  '004808FB: call [00401388h]
  '00480901: lea ecx, [ebp-40h]
  '00480904: call [00401034h]
  '0048090A: ret 
End Sub
Private Sub unknown_480930
  '00480930: push ebp
  '00480931: mov ebp, esp
  '00480933: sub esp, 00000008h
  '00480936: push 00403796h
  '0048093B: mov eax, fs:[00h]
  '00480941: push eax
  '00480942: mov fs:[00000000h], esp
  '00480949: sub esp, 0000002Ch
  '0048094C: push ebx
  '0048094D: push esi
  '0048094E: push edi
  '0048094F: mov [ebp-08h], esp
  '00480952: mov [ebp-04h], 004026A8h
  '00480959: mov esi, [ebp+08h]
  '0048095C: xor ebx, ebx
  '0048095E: push ebx
  '0048095F: mov [ebp-24h], ebx
  '00480962: mov eax, [esi+000000C4h]
  '00480968: mov [ebp-28h], bl
  '0048096B: push eax
  '0048096C: mov [ebp-2Ch], bl
  '0048096F: call [004011FCh]
  '00480975: test ax, ax
  '00480978: jnz 00480C2Dh
  '0048097E: lea edi, [esi+58h]
  '00480981: lea eax, [esi+78h]
  '00480984: push edi
  '00480985: push eax
  '00480986: push 00000010h
  '00480988: mov [ebp-3Ch], eax
  '0048098B: call [00401088h]
  '00480991: mov dl, [esi+000000EAh]
  '00480997: mov al, [esi+000000E9h]
  '0048099D: xor ecx, ecx
  '0048099F: cmp dl, 01h
  '004809A2: setnz cl
  '004809A5: xor edx, edx
  '004809A7: test al, al
  '004809A9: setnz dl
  '004809AC: or ecx, edx
  '004809AE: jnz 4809C0h
  '004809B0: cmp [esi+000000C0h], 00000002h
  '004809B7: jnz 4809C0h
  '004809B9: mov ebx, FFFFFFFDh
  '004809BE: jmp 4809D2h
  '004809C0: cmp al, 01h
  '004809C2: jnz 4809D2h
  '004809C4: cmp [esi+000000C0h], 00000002h
  '004809CB: jz 4809D2h
  '004809CD: mov ebx, 00000001h
  '004809D2: mov edx, [edi]
  '004809D4: push 00000000h
  '004809D6: movsx eax, bx
  '004809D9: mov ecx, eax
  '004809DB: push 00000003h
  '004809DD: add ecx, edx
  '004809DF: mov edx, [edi+04h]
  '004809E2: jo 00480C54h
  '004809E8: mov [edi], ecx
  '004809EA: mov ecx, [edi+08h]
  '004809ED: add edx, eax
  '004809EF: jo 00480C54h
  '004809F5: mov [edi+04h], edx
  '004809F8: mov edx, [edi+0Ch]
  '004809FB: add ecx, eax
  '004809FD: jo 00480C54h
  '00480A03: add edx, eax
  '00480A05: mov [edi+08h], ecx
  '00480A08: jo 00480C54h
  '00480A0E: mov [edi+0Ch], edx
  '00480A11: mov eax, [esi+000000C4h]
  '00480A17: lea ecx, [ebp-24h]
  '00480A1A: push eax
  '00480A1B: push ecx
  '00480A1C: call [004011D4h]
  '00480A22: add esp, 00000010h
  '00480A25: push eax
  '00480A26: call [0040127Ch]
  '00480A2C: mov bx, ax
  '00480A2F: lea ecx, [ebp-24h]
  '00480A32: dec bx
  '00480A34: neg bx
  '00480A37: sbb ebx, ebx
  '00480A39: inc ebx
  '00480A3A: neg ebx
  '00480A3C: call [00401034h]
  '00480A42: test bx, bx
  '00480A45: jz 00480B1Bh
  '00480A4B: mov edx, [esi]
  '00480A4D: lea eax, [ebp-28h]
  '00480A50: push eax
  '00480A51: push esi
  '00480A52: call [edx+000007A8h]
  '00480A58: test eax, eax
  '00480A5A: jnl 480A6Eh
  '00480A5C: push 000007A8h
  '00480A61: push 0041FF7Ch
  '00480A66: push esi
  '00480A67: push eax
  '00480A68: call [004010A8h]
  '00480A6E: cmp word ptr [ebp-28h], 0000h
  '00480A73: jnz 480A9Bh
  '00480A75: xor ecx, ecx
  '00480A77: mov byte ptr [ebp-2Ch], 00h
  '00480A7B: call [004011F4h]
  '00480A81: mov ecx, [esi]
  '00480A83: lea edx, [ebp-2Ch]
  '00480A86: mov [ebp-28h], al
  '00480A89: push edx
  '00480A8A: lea eax, [ebp-28h]
  '00480A8D: push edi
  '00480A8E: push eax
  '00480A8F: push esi
  '00480A90: call [ecx+00000900h]
  '00480A96: jmp 00480C20h
  '00480A9B: mov al, [esi+000000EAh]
  '00480AA1: mov bl, [esi+000000E9h]
  '00480AA7: xor ecx, ecx
  '00480AA9: cmp al, 01h
  '00480AAB: setnz cl
  '00480AAE: xor edx, edx
  '00480AB0: test bl, bl
  '00480AB2: setnz dl
  '00480AB5: or ecx, edx
  '00480AB7: jnz 480AF0h
  '00480AB9: cmp [esi+000000C0h], 00000002h
  '00480AC0: jnz 480AF0h
  '00480AC2: mov ebx, [004011F4h]
  '00480AC8: mov ecx, 00000001h
  '00480ACD: call ebx
  '00480ACF: xor ecx, ecx
  '00480AD1: mov [ebp-2Ch], al
  '00480AD4: call ebx
  '00480AD6: mov edx, [ebp-3Ch]
  '00480AD9: lea ecx, [ebp-2Ch]
  '00480ADC: push ecx
  '00480ADD: lea ecx, [ebp-28h]
  '00480AE0: mov [ebp-28h], al
  '00480AE3: mov eax, [esi]
  '00480AE5: push edx
  '00480AE6: push ecx
  '00480AE7: push esi
  '00480AE8: call [eax+00000900h]
  '00480AEE: jmp 480AF6h
  '00480AF0: mov ebx, [004011F4h]
  '00480AF6: mov ecx, 00000001h
  '00480AFB: mov byte ptr [ebp-2Ch], 00h
  '00480AFF: call ebx
  '00480B01: mov edx, [esi]
  '00480B03: mov [ebp-28h], al
  '00480B06: lea eax, [ebp-2Ch]
  '00480B09: lea ecx, [ebp-28h]
  '00480B0C: push eax
  '00480B0D: push edi
  '00480B0E: push ecx
  '00480B0F: push esi
  '00480B10: call [edx+00000900h]
  '00480B16: jmp 00480C20h
  '00480B1B: mov edx, [esi+000000C4h]
  '00480B21: push 00000000h
  '00480B23: push 00000003h
  '00480B25: lea eax, [ebp-24h]
  '00480B28: push edx
  '00480B29: push eax
  '00480B2A: call [004011D4h]
  '00480B30: add esp, 00000010h
  '00480B33: push eax
  '00480B34: call [0040127Ch]
  '00480B3A: xor ebx, ebx
  '00480B3C: cmp ax, 0003h
  '00480B40: setz bl
  '00480B43: lea ecx, [ebp-24h]
  '00480B46: neg ebx
  '00480B48: call [00401034h]
  '00480B4E: test bx, bx
  '00480B51: jz 00480C20h
  '00480B57: mov ecx, [esi]
  '00480B59: lea edx, [ebp-28h]
  '00480B5C: push edx
  '00480B5D: push esi
  '00480B5E: call [ecx+000007A8h]
  '00480B64: test eax, eax
  '00480B66: jnl 480B7Ah
  '00480B68: push 000007A8h
  '00480B6D: push 0041FF7Ch
  '00480B72: push esi
  '00480B73: push eax
  '00480B74: call [004010A8h]
  '00480B7A: cmp word ptr [ebp-28h], 0000h
  '00480B7F: jnz 480BA4h
  '00480B81: xor ecx, ecx
  '00480B83: mov byte ptr [ebp-2Ch], 00h
  '00480B87: call [004011F4h]
  '00480B8D: lea ecx, [ebp-2Ch]
  '00480B90: lea edx, [ebp-28h]
  '00480B93: push ecx
  '00480B94: mov [ebp-28h], al
  '00480B97: mov eax, [esi]
  '00480B99: push edi
  '00480B9A: push edx
  '00480B9B: push esi
  '00480B9C: call [eax+00000904h]
  '00480BA2: jmp 480C20h
  '00480BA4: mov cl, [esi+000000EAh]
  '00480BAA: mov bl, [esi+000000E9h]
  '00480BB0: xor eax, eax
  '00480BB2: cmp cl, 01h
  '00480BB5: setnz al
  '00480BB8: xor ecx, ecx
  '00480BBA: test bl, bl
  '00480BBC: setnz cl
  '00480BBF: or eax, ecx
  '00480BC1: jnz 480BFAh
  '00480BC3: cmp [esi+000000C0h], 00000002h
  '00480BCA: jnz 480BFAh
  '00480BCC: mov ebx, [004011F4h]
  '00480BD2: mov ecx, 00000001h
  '00480BD7: call ebx
  '00480BD9: xor ecx, ecx
  '00480BDB: mov [ebp-2Ch], al
  '00480BDE: call ebx
  '00480BE0: mov ecx, [ebp-3Ch]
  '00480BE3: mov edx, [esi]
  '00480BE5: mov [ebp-28h], al
  '00480BE8: lea eax, [ebp-2Ch]
  '00480BEB: push eax
  '00480BEC: lea eax, [ebp-28h]
  '00480BEF: push ecx
  '00480BF0: push eax
  '00480BF1: push esi
  '00480BF2: call [edx+00000904h]
  '00480BF8: jmp 480C00h
  '00480BFA: mov ebx, [004011F4h]
  '00480C00: mov ecx, 00000001h
  '00480C05: mov byte ptr [ebp-2Ch], 00h
  '00480C09: call ebx
  '00480C0B: mov ecx, [esi]
  '00480C0D: lea edx, [ebp-2Ch]
  '00480C10: mov [ebp-28h], al
  '00480C13: push edx
  '00480C14: lea eax, [ebp-28h]
  '00480C17: push edi
  '00480C18: push eax
  '00480C19: push esi
  '00480C1A: call [ecx+00000904h]
  '00480C20: mov ecx, [ebp-3Ch]
  '00480C23: push ecx
  '00480C24: push edi
  '00480C25: push 00000010h
  '00480C27: call [00401088h]
  '00480C2D: push 00480C3Fh
  '00480C32: jmp 480C3Eh
  '00480C34: lea ecx, [ebp-24h]
  '00480C37: call [00401034h]
  '00480C3D: ret 
End Sub
Private Sub unknown_480C60
  '00480C60: push ebp
  '00480C61: mov ebp, esp
  '00480C63: sub esp, 00000018h
  '00480C66: push 00403796h
  '00480C6B: mov eax, fs:[00h]
  '00480C71: push eax
  '00480C72: mov fs:[00000000h], esp
  '00480C79: mov eax, 000000C8h
  '00480C7E: call 00403790h
  '00480C83: push ebx
  '00480C84: push esi
  '00480C85: push edi
  '00480C86: mov [ebp-18h], esp
  '00480C89: mov [ebp-14h], 004026B8h
  '00480C90: mov [ebp-10h], 00000000h
  '00480C97: mov [ebp-0Ch], 00000000h
  '00480C9E: mov [ebp-04h], 00000001h
  '00480CA5: mov [ebp-04h], 00000002h
  '00480CAC: push FFFFFFFFh
  '00480CAE: call [004010E8h]
  '00480CB4: mov [ebp-04h], 00000003h
  '00480CBB: lea eax, [ebp-44h]
  '00480CBE: push eax
  '00480CBF: mov ecx, [ebp+08h]
  '00480CC2: mov edx, [ecx]
  '00480CC4: mov eax, [ebp+08h]
  '00480CC7: push eax
  '00480CC8: call [edx+000002C0h]
  '00480CCE: fclex 
  '00480CD0: mov [ebp-0000008Ch], eax
  '00480CD6: cmp [ebp-0000008Ch], 00000000h
  '00480CDD: jnl 480D02h
  '00480CDF: push 000002C0h
  '00480CE4: push 0041FF4Ch
  '00480CE9: mov ecx, [ebp+08h]
  '00480CEC: push ecx
  '00480CED: mov edx, [ebp-0000008Ch]
  '00480CF3: push edx
  '00480CF4: call [004010A8h]
  '00480CFA: mov [ebp-000000B0h], eax
  '00480D00: jmp 480D0Ch
  '00480D02: mov [ebp-000000B0h], 00000000h
  '00480D0C: push 00000000h
  '00480D0E: push 00420964h
  '00480D13: mov eax, [ebp-44h]
  '00480D16: push eax
  '00480D17: lea ecx, [ebp-58h]
  '00480D1A: push ecx
  '00480D1B: call [0040132Ch]
  '00480D21: add esp, 00000010h
  '00480D24: lea edx, [ebp-48h]
  '00480D27: push edx
  '00480D28: mov eax, [ebp+08h]
  '00480D2B: mov ecx, [eax]
  '00480D2D: mov edx, [ebp+08h]
  '00480D30: push edx
  '00480D31: call [ecx+00000198h]
  '00480D37: fclex 
  '00480D39: mov [ebp-00000090h], eax
  '00480D3F: cmp [ebp-00000090h], 00000000h
  '00480D46: jnl 480D6Bh
  '00480D48: push 00000198h
  '00480D4D: push 0041FF4Ch
  '00480D52: mov eax, [ebp+08h]
  '00480D55: push eax
  '00480D56: mov ecx, [ebp-00000090h]
  '00480D5C: push ecx
  '00480D5D: call [004010A8h]
  '00480D63: mov [ebp-000000B4h], eax
  '00480D69: jmp 480D75h
  '00480D6B: mov [ebp-000000B4h], 00000000h
  '00480D75: push 00000000h
  '00480D77: push 00412F5Ch
  '00480D7C: mov edx, [ebp-48h]
  '00480D7F: push edx
  '00480D80: lea eax, [ebp-68h]
  '00480D83: push eax
  '00480D84: call [0040132Ch]
  '00480D8A: add esp, 00000010h
  '00480D8D: lea ecx, [ebp-7Ch]
  '00480D90: push ecx
  '00480D91: mov edx, [ebp+08h]
  '00480D94: mov eax, [edx]
  '00480D96: mov ecx, [ebp+08h]
  '00480D99: push ecx
  '00480D9A: call [eax+00000110h]
  '00480DA0: fclex 
  '00480DA2: mov [ebp-00000094h], eax
  '00480DA8: cmp [ebp-00000094h], 00000000h
  '00480DAF: jnl 480DD4h
  '00480DB1: push 00000110h
  '00480DB6: push 0041FF4Ch
  '00480DBB: mov edx, [ebp+08h]
  '00480DBE: push edx
  '00480DBF: mov eax, [ebp-00000094h]
  '00480DC5: push eax
  '00480DC6: call [004010A8h]
  '00480DCC: mov [ebp-000000B8h], eax
  '00480DD2: jmp 480DDEh
  '00480DD4: mov [ebp-000000B8h], 00000000h
  '00480DDE: mov cx, [ebp-7Ch]
  '00480DE2: mov [ebp-70h], cx
  '00480DE6: mov [ebp-78h], 00000002h
  '00480DED: lea edx, [ebp-80h]
  '00480DF0: push edx
  '00480DF1: mov eax, 00000010h
  '00480DF6: call 00403790h
  '00480DFB: mov eax, esp
  '00480DFD: mov ecx, [ebp-78h]
  '00480E00: mov [eax], ecx
  '00480E02: mov edx, [ebp-74h]
  '00480E05: mov [eax+04h], edx
  '00480E08: mov ecx, [ebp-70h]
  '00480E0B: mov [eax+08h], ecx
  '00480E0E: mov edx, [ebp-6Ch]
  '00480E11: mov [eax+0Ch], edx
  '00480E14: mov eax, 00000010h
  '00480E19: call 00403790h
  '00480E1E: mov eax, esp
  '00480E20: mov ecx, [ebp-68h]
  '00480E23: mov [eax], ecx
  '00480E25: mov edx, [ebp-64h]
  '00480E28: mov [eax+04h], edx
  '00480E2B: mov ecx, [ebp-60h]
  '00480E2E: mov [eax+08h], ecx
  '00480E31: mov edx, [ebp-5Ch]
  '00480E34: mov [eax+0Ch], edx
  '00480E37: lea eax, [ebp-58h]
  '00480E3A: push eax
  '00480E3B: call [004011CCh]
  '00480E41: push ecx
  '00480E42: fstp real4 ptr [esp]
  '00480E45: mov ecx, [ebp+08h]
  '00480E48: mov edx, [ecx]
  '00480E4A: mov eax, [ebp+08h]
  '00480E4D: push eax
  '00480E4E: call [edx+00000374h]
  '00480E54: fclex 
  '00480E56: mov [ebp-00000098h], eax
  '00480E5C: cmp [ebp-00000098h], 00000000h
  '00480E63: jnl 480E88h
  '00480E65: push 00000374h
  '00480E6A: push 0041FF4Ch
  '00480E6F: mov ecx, [ebp+08h]
  '00480E72: push ecx
  '00480E73: mov edx, [ebp-00000098h]
  '00480E79: push edx
  '00480E7A: call [004010A8h]
  '00480E80: mov [ebp-000000BCh], eax
  '00480E86: jmp 480E92h
  '00480E88: mov [ebp-000000BCh], 00000000h
  '00480E92: fld real4 ptr [ebp-80h]
  '00480E95: call [00401320h]
  '00480E9B: mov [ebp-3Ch], eax
  '00480E9E: lea eax, [ebp-48h]
  '00480EA1: push eax
  '00480EA2: lea ecx, [ebp-44h]
  '00480EA5: push ecx
  '00480EA6: push 00000002h
  '00480EA8: call [0040106Ch]
  '00480EAE: add esp, 0000000Ch
  '00480EB1: lea edx, [ebp-68h]
  '00480EB4: push edx
  '00480EB5: lea eax, [ebp-58h]
  '00480EB8: push eax
  '00480EB9: push 00000002h
  '00480EBB: call [00401058h]
  '00480EC1: add esp, 0000000Ch
  '00480EC4: mov [ebp-04h], 00000004h
  '00480ECB: lea ecx, [ebp-44h]
  '00480ECE: push ecx
  '00480ECF: mov edx, [ebp+08h]
  '00480ED2: mov eax, [edx]
  '00480ED4: mov ecx, [ebp+08h]
  '00480ED7: push ecx
  '00480ED8: call [eax+000002C0h]
  '00480EDE: fclex 
  '00480EE0: mov [ebp-0000008Ch], eax
  '00480EE6: cmp [ebp-0000008Ch], 00000000h
  '00480EED: jnl 480F12h
  '00480EEF: push 000002C0h
  '00480EF4: push 0041FF4Ch
  '00480EF9: mov edx, [ebp+08h]
  '00480EFC: push edx
  '00480EFD: mov eax, [ebp-0000008Ch]
  '00480F03: push eax
  '00480F04: call [004010A8h]
  '00480F0A: mov [ebp-000000C0h], eax
  '00480F10: jmp 480F1Ch
  '00480F12: mov [ebp-000000C0h], 00000000h
  '00480F1C: push 00000000h
  '00480F1E: push 0041B10Ch
  '00480F23: mov ecx, [ebp-44h]
  '00480F26: push ecx
  '00480F27: lea edx, [ebp-58h]
  '00480F2A: push edx
  '00480F2B: call [0040132Ch]
  '00480F31: add esp, 00000010h
  '00480F34: lea eax, [ebp-48h]
  '00480F37: push eax
  '00480F38: mov ecx, [ebp+08h]
  '00480F3B: mov edx, [ecx]
  '00480F3D: mov eax, [ebp+08h]
  '00480F40: push eax
  '00480F41: call [edx+00000198h]
  '00480F47: fclex 
  '00480F49: mov [ebp-00000090h], eax
  '00480F4F: cmp [ebp-00000090h], 00000000h
  '00480F56: jnl 480F7Bh
  '00480F58: push 00000198h
  '00480F5D: push 0041FF4Ch
  '00480F62: mov ecx, [ebp+08h]
  '00480F65: push ecx
  '00480F66: mov edx, [ebp-00000090h]
  '00480F6C: push edx
  '00480F6D: call [004010A8h]
  '00480F73: mov [ebp-000000C4h], eax
  '00480F79: jmp 480F85h
  '00480F7B: mov [ebp-000000C4h], 00000000h
  '00480F85: push 00000000h
  '00480F87: push 00412F5Ch
  '00480F8C: mov eax, [ebp-48h]
  '00480F8F: push eax
  '00480F90: lea ecx, [ebp-68h]
  '00480F93: push ecx
  '00480F94: call [0040132Ch]
  '00480F9A: add esp, 00000010h
  '00480F9D: lea edx, [ebp-7Ch]
  '00480FA0: push edx
  '00480FA1: mov eax, [ebp+08h]
  '00480FA4: mov ecx, [eax]
  '00480FA6: mov edx, [ebp+08h]
  '00480FA9: push edx
  '00480FAA: call [ecx+00000110h]
  '00480FB0: fclex 
  '00480FB2: mov [ebp-00000094h], eax
  '00480FB8: cmp [ebp-00000094h], 00000000h
  '00480FBF: jnl 480FE4h
  '00480FC1: push 00000110h
  '00480FC6: push 0041FF4Ch
  '00480FCB: mov eax, [ebp+08h]
  '00480FCE: push eax
  '00480FCF: mov ecx, [ebp-00000094h]
  '00480FD5: push ecx
  '00480FD6: call [004010A8h]
  '00480FDC: mov [ebp-000000C8h], eax
  '00480FE2: jmp 480FEEh
  '00480FE4: mov [ebp-000000C8h], 00000000h
  '00480FEE: mov dx, [ebp-7Ch]
  '00480FF2: mov [ebp-70h], dx
  '00480FF6: mov [ebp-78h], 00000002h
  '00480FFD: lea eax, [ebp-80h]
  '00481000: push eax
  '00481001: mov eax, 00000010h
  '00481006: call 00403790h
  '0048100B: mov ecx, esp
  '0048100D: mov edx, [ebp-78h]
  '00481010: mov [ecx], edx
  '00481012: mov eax, [ebp-74h]
  '00481015: mov [ecx+04h], eax
  '00481018: mov edx, [ebp-70h]
  '0048101B: mov [ecx+08h], edx
  '0048101E: mov eax, [ebp-6Ch]
  '00481021: mov [ecx+0Ch], eax
  '00481024: mov eax, 00000010h
  '00481029: call 00403790h
  '0048102E: mov ecx, esp
  '00481030: mov edx, [ebp-68h]
  '00481033: mov [ecx], edx
  '00481035: mov eax, [ebp-64h]
  '00481038: mov [ecx+04h], eax
  '0048103B: mov edx, [ebp-60h]
  '0048103E: mov [ecx+08h], edx
  '00481041: mov eax, [ebp-5Ch]
  '00481044: mov [ecx+0Ch], eax
  '00481047: lea ecx, [ebp-58h]
  '0048104A: push ecx
  '0048104B: call [004011CCh]
  '00481051: push ecx
  '00481052: fstp real4 ptr [esp]
  '00481055: mov edx, [ebp+08h]
  '00481058: mov eax, [edx]
  '0048105A: mov ecx, [ebp+08h]
  '0048105D: push ecx
  '0048105E: call [eax+00000378h]
  '00481064: fclex 
  '00481066: mov [ebp-00000098h], eax
  '0048106C: cmp [ebp-00000098h], 00000000h
  '00481073: jnl 481098h
  '00481075: push 00000378h
  '0048107A: push 0041FF4Ch
  '0048107F: mov edx, [ebp+08h]
  '00481082: push edx
  '00481083: mov eax, [ebp-00000098h]
  '00481089: push eax
  '0048108A: call [004010A8h]
  '00481090: mov [ebp-000000CCh], eax
  '00481096: jmp 4810A2h
  '00481098: mov [ebp-000000CCh], 00000000h
  '004810A2: fld real4 ptr [ebp-80h]
  '004810A5: call [00401320h]
  '004810AB: mov [ebp-2Ch], eax
  '004810AE: lea ecx, [ebp-48h]
  '004810B1: push ecx
  '004810B2: lea edx, [ebp-44h]
  '004810B5: push edx
  '004810B6: push 00000002h
  '004810B8: call [0040106Ch]
  '004810BE: add esp, 0000000Ch
  '004810C1: lea eax, [ebp-68h]
  '004810C4: push eax
  '004810C5: lea ecx, [ebp-58h]
  '004810C8: push ecx
  '004810C9: push 00000002h
  '004810CB: call [00401058h]
  '004810D1: add esp, 0000000Ch
  '004810D4: mov [ebp-04h], 00000005h
  '004810DB: lea edx, [ebp-44h]
  '004810DE: push edx
  '004810DF: mov eax, [ebp+08h]
  '004810E2: mov ecx, [eax]
  '004810E4: mov edx, [ebp+08h]
  '004810E7: push edx
  '004810E8: call [ecx+00000198h]
  '004810EE: fclex 
  '004810F0: mov [ebp-0000008Ch], eax
  '004810F6: cmp [ebp-0000008Ch], 00000000h
  '004810FD: jnl 481122h
  '004810FF: push 00000198h
  '00481104: push 0041FF4Ch
  '00481109: mov eax, [ebp+08h]
  '0048110C: push eax
  '0048110D: mov ecx, [ebp-0000008Ch]
  '00481113: push ecx
  '00481114: call [004010A8h]
  '0048111A: mov [ebp-000000D0h], eax
  '00481120: jmp 48112Ch
  '00481122: mov [ebp-000000D0h], 00000000h
  '0048112C: push 00412CE8h
  '00481131: push 00000000h
  '00481133: push 00412874h
  '00481138: mov edx, [ebp-44h]
  '0048113B: push edx
  '0048113C: lea eax, [ebp-58h]
  '0048113F: push eax
  '00481140: call [0040132Ch]
  '00481146: add esp, 00000010h
  '00481149: push eax
  '0048114A: call [004011B8h]
  '00481150: push eax
  '00481151: lea ecx, [ebp-24h]
  '00481154: push ecx
  '00481155: call [004010F0h]
  '0048115B: lea ecx, [ebp-44h]
  '0048115E: call [00401388h]
  '00481164: lea ecx, [ebp-58h]
  '00481167: call [00401034h]
  '0048116D: mov [ebp-04h], 00000006h
  '00481174: lea edx, [ebp-80h]
  '00481177: push edx
  '00481178: mov eax, [ebp+08h]
  '0048117B: mov ecx, [eax]
  '0048117D: mov edx, [ebp+08h]
  '00481180: push edx
  '00481181: call [ecx+000000D8h]
  '00481187: fclex 
  '00481189: mov [ebp-0000008Ch], eax
  '0048118F: cmp [ebp-0000008Ch], 00000000h
  '00481196: jnl 4811BBh
  '00481198: push 000000D8h
  '0048119D: push 0041FF4Ch
  '004811A2: mov eax, [ebp+08h]
  '004811A5: push eax
  '004811A6: mov ecx, [ebp-0000008Ch]
  '004811AC: push ecx
  '004811AD: call [004010A8h]
  '004811B3: mov [ebp-000000D4h], eax
  '004811B9: jmp 4811C5h
  '004811BB: mov [ebp-000000D4h], 00000000h
  '004811C5: mov edx, [ebp-80h]
  '004811C8: push edx
  '004811C9: call 0041289Ch
  '004811CE: mov [ebp-00000084h], eax
  '004811D4: call [004010A4h]
  '004811DA: mov eax, [ebp-00000084h]
  '004811E0: mov [ebp-38h], eax
  '004811E3: mov [ebp-04h], 00000007h
  '004811EA: lea ecx, [ebp-80h]
  '004811ED: push ecx
  '004811EE: mov edx, [ebp+08h]
  '004811F1: mov eax, [edx]
  '004811F3: mov ecx, [ebp+08h]
  '004811F6: push ecx
  '004811F7: call [eax+00000100h]
  '004811FD: fclex 
  '004811FF: mov [ebp-0000008Ch], eax
  '00481205: cmp [ebp-0000008Ch], 00000000h
  '0048120C: jnl 481231h
  '0048120E: push 00000100h
  '00481213: push 0041FF4Ch
  '00481218: mov edx, [ebp+08h]
  '0048121B: push edx
  '0048121C: mov eax, [ebp-0000008Ch]
  '00481222: push eax
  '00481223: call [004010A8h]
  '00481229: mov [ebp-000000D8h], eax
  '0048122F: jmp 48123Bh
  '00481231: mov [ebp-000000D8h], 00000000h
  '0048123B: lea ecx, [ebp-00000084h]
  '00481241: push ecx
  '00481242: mov edx, [ebp+08h]
  '00481245: mov eax, [edx]
  '00481247: mov ecx, [ebp+08h]
  '0048124A: push ecx
  '0048124B: call [eax+00000108h]
  '00481251: fclex 
  '00481253: mov [ebp-00000090h], eax
  '00481259: cmp [ebp-00000090h], 00000000h
  '00481260: jnl 481285h
  '00481262: push 00000108h
  '00481267: push 0041FF4Ch
  '0048126C: mov edx, [ebp+08h]
  '0048126F: push edx
  '00481270: mov eax, [ebp-00000090h]
  '00481276: push eax
  '00481277: call [004010A8h]
  '0048127D: mov [ebp-000000DCh], eax
  '00481283: jmp 48128Fh
  '00481285: mov [ebp-000000DCh], 00000000h
  '0048128F: fld real4 ptr [ebp-00000084h]
  '00481295: call [00401320h]
  '0048129B: push eax
  '0048129C: fld real4 ptr [ebp-80h]
  '0048129F: call [00401320h]
  '004812A5: push eax
  '004812A6: mov ecx, [ebp-38h]
  '004812A9: push ecx
  '004812AA: call 004128ECh
  '004812AF: mov [ebp-00000088h], eax
  '004812B5: call [004010A4h]
  '004812BB: mov edx, [ebp-00000088h]
  '004812C1: mov [ebp-34h], edx
  '004812C4: mov [ebp-04h], 00000008h
  '004812CB: push 00000000h
  '004812CD: push 00000000h
  '004812CF: mov eax, [ebp-24h]
  '004812D2: push eax
  '004812D3: lea ecx, [ebp-58h]
  '004812D6: push ecx
  '004812D7: call [004011D4h]
  '004812DD: add esp, 00000010h
  '004812E0: push eax
  '004812E1: call [004012ECh]
  '004812E7: push eax
  '004812E8: mov edx, [ebp-38h]
  '004812EB: push edx
  '004812EC: call 00412934h
  '004812F1: call [004010A4h]
  '004812F7: lea ecx, [ebp-58h]
  '004812FA: call [00401034h]
  '00481300: mov [ebp-04h], 00000009h
  '00481307: lea eax, [ebp-80h]
  '0048130A: push eax
  '0048130B: mov ecx, [ebp+08h]
  '0048130E: mov edx, [ecx]
  '00481310: mov eax, [ebp+08h]
  '00481313: push eax
  '00481314: call [edx+000000D8h]
  '0048131A: fclex 
  '0048131C: mov [ebp-0000008Ch], eax
  '00481322: cmp [ebp-0000008Ch], 00000000h
  '00481329: jnl 48134Eh
  '0048132B: push 000000D8h
  '00481330: push 0041FF4Ch
  '00481335: mov ecx, [ebp+08h]
  '00481338: push ecx
  '00481339: mov edx, [ebp-0000008Ch]
  '0048133F: push edx
  '00481340: call [004010A8h]
  '00481346: mov [ebp-000000E0h], eax
  '0048134C: jmp 481358h
  '0048134E: mov [ebp-000000E0h], 00000000h
  '00481358: lea eax, [ebp-00000084h]
  '0048135E: push eax
  '0048135F: mov ecx, [ebp+08h]
  '00481362: mov edx, [ecx]
  '00481364: mov eax, [ebp+08h]
  '00481367: push eax
  '00481368: call [edx+00000100h]
  '0048136E: fclex 
  '00481370: mov [ebp-00000090h], eax
  '00481376: cmp [ebp-00000090h], 00000000h
  '0048137D: jnl 4813A2h
  '0048137F: push 00000100h
  '00481384: push 0041FF4Ch
  '00481389: mov ecx, [ebp+08h]
  '0048138C: push ecx
  '0048138D: mov edx, [ebp-00000090h]
  '00481393: push edx
  '00481394: call [004010A8h]
  '0048139A: mov [ebp-000000E4h], eax
  '004813A0: jmp 4813ACh
  '004813A2: mov [ebp-000000E4h], 00000000h
  '004813AC: lea eax, [ebp-00000088h]
  '004813B2: push eax
  '004813B3: mov ecx, [ebp+08h]
  '004813B6: mov edx, [ecx]
  '004813B8: mov eax, [ebp+08h]
  '004813BB: push eax
  '004813BC: call [edx+00000108h]
  '004813C2: fclex 
  '004813C4: mov [ebp-00000094h], eax
  '004813CA: cmp [ebp-00000094h], 00000000h
  '004813D1: jnl 4813F6h
  '004813D3: push 00000108h
  '004813D8: push 0041FF4Ch
  '004813DD: mov ecx, [ebp+08h]
  '004813E0: push ecx
  '004813E1: mov edx, [ebp-00000094h]
  '004813E7: push edx
  '004813E8: call [004010A8h]
  '004813EE: mov [ebp-000000E8h], eax
  '004813F4: jmp 481400h
  '004813F6: mov [ebp-000000E8h], 00000000h
  '00481400: push 00CC0020h
  '00481405: mov eax, [ebp-2Ch]
  '00481408: push eax
  '00481409: mov ecx, [ebp-3Ch]
  '0048140C: push ecx
  '0048140D: mov edx, [ebp-38h]
  '00481410: push edx
  '00481411: fld real4 ptr [ebp-00000088h]
  '00481417: call [00401320h]
  '0048141D: push eax
  '0048141E: fld real4 ptr [ebp-00000084h]
  '00481424: call [00401320h]
  '0048142A: push eax
  '0048142B: push 00000000h
  '0048142D: push 00000000h
  '0048142F: mov eax, [ebp-80h]
  '00481432: push eax
  '00481433: call 004129BCh
  '00481438: call [004010A4h]
  '0048143E: mov [ebp-04h], 0000000Ah
  '00481445: mov ecx, [ebp-28h]
  '00481448: push ecx
  '00481449: mov edx, [ebp-38h]
  '0048144C: push edx
  '0048144D: call 00412934h
  '00481452: call [004010A4h]
  '00481458: mov [ebp-04h], 0000000Bh
  '0048145F: mov eax, [ebp-34h]
  '00481462: push eax
  '00481463: call 0041297Ch
  '00481468: call [004010A4h]
  '0048146E: mov [ebp-04h], 0000000Ch
  '00481475: mov ecx, [ebp-38h]
  '00481478: push ecx
  '00481479: call 004127F0h
  '0048147E: call [004010A4h]
  '00481484: mov [ebp-04h], 0000000Dh
  '0048148B: push 00412CE8h
  '00481490: push 00000000h
  '00481492: call [00401340h]
  '00481498: push eax
  '00481499: lea edx, [ebp-24h]
  '0048149C: push edx
  '0048149D: call [004010F0h]
  '004814A3: wait 
  '004814A4: push 004814DCh
  '004814A9: jmp 4814D2h
  '004814AB: lea eax, [ebp-48h]
  '004814AE: push eax
  '004814AF: lea ecx, [ebp-44h]
  '004814B2: push ecx
  '004814B3: push 00000002h
  '004814B5: call [0040106Ch]
  '004814BB: add esp, 0000000Ch
  '004814BE: lea edx, [ebp-68h]
  '004814C1: push edx
  '004814C2: lea eax, [ebp-58h]
  '004814C5: push eax
  '004814C6: push 00000002h
  '004814C8: call [00401058h]
  '004814CE: add esp, 0000000Ch
  '004814D1: ret 
End Sub
Private Sub unknown_4820D0
  '004820D0: push ebp
  '004820D1: mov ebp, esp
  '004820D3: sub esp, 00000008h
  '004820D6: push 00403796h
  '004820DB: mov eax, fs:[00h]
  '004820E1: push eax
  '004820E2: mov fs:[00000000h], esp
  '004820E9: sub esp, 00000010h
  '004820EC: push ebx
  '004820ED: push esi
  '004820EE: push edi
  '004820EF: mov [ebp-08h], esp
  '004820F2: mov [ebp-04h], 004027E0h
  '004820F9: mov esi, [ebp+0Ch]
  '004820FC: push 00020003h
  '00482101: push 00000001h
  '00482103: lea ecx, [ebp-18h]
  '00482106: mov eax, [esi]
  '00482108: mov [ebp-18h], 00000000h
  '0048210F: push eax
  '00482110: push ecx
  '00482111: call [0040130Ch]
  '00482117: push eax
  '00482118: call 0042053Ch
  '0048211D: mov edi, eax
  '0048211F: call [004010A4h]
  '00482125: mov edx, [ebp-18h]
  '00482128: push edx
  '00482129: push esi
  '0048212A: call [00401228h]
  '00482130: mov ecx, edi
  '00482132: call [0040120Ch]
  '00482138: lea ecx, [ebp-18h]
  '0048213B: mov [ebp-14h], al
  '0048213E: call [0040138Ch]
  '00482144: push 00482156h
  '00482149: jmp 482155h
  '0048214B: lea ecx, [ebp-18h]
  '0048214E: call [0040138Ch]
  '00482154: ret 
End Sub
Private Sub unknown_4829F0
  '004829F0: push ebp
  '004829F1: mov ebp, esp
  '004829F3: sub esp, 00000008h
  '004829F6: push 00403796h
  '004829FB: mov eax, fs:[00h]
  '00482A01: push eax
  '00482A02: mov fs:[00000000h], esp
  '00482A09: sub esp, 00000048h
  '00482A0C: push ebx
  '00482A0D: push esi
  '00482A0E: push edi
  '00482A0F: mov [ebp-08h], esp
  '00482A12: mov [ebp-04h], 00402858h
  '00482A19: mov esi, [ebp+0Ch]
  '00482A1C: mov ecx, 00000006h
  '00482A21: xor eax, eax
  '00482A23: lea edi, [ebp-2Ch]
  '00482A26: fild dword ptr [esi]
  '00482A28: rep stosd 
  '00482A2A: fstp real8 ptr [ebp-48h]
  '00482A2D: fld real8 ptr [ebp-48h]
  '00482A30: cmp [004A0000h], 00000000h
  '00482A37: jnz 482A41h
  '00482A39: fdiv real8 ptr [004022A0h]
  '00482A3F: jmp 482A52h
  '00482A41: push [004022A4h]
  '00482A47: push [004022A0h]
  '00482A4D: call 004037B4h
  '00482A52: mov [ebp-14h], 00000000h
  '00482A59: cmp [004A0000h], 00000000h
  '00482A60: jnz 482A6Ah
  '00482A62: fdiv real8 ptr [004022A0h]
  '00482A68: jmp 482A7Bh
  '00482A6A: push [004022A4h]
  '00482A70: push [004022A0h]
  '00482A76: call 004037B4h
  '00482A7B: fstsw ax
  '00482A7D: test al, 0Dh
  '00482A7F: jnz 00482B47h
  '00482A85: call [0040111Ch]
  '00482A8B: fstp real8 ptr [ebp-1Ch]
  '00482A8E: fld real8 ptr [ebp-1Ch]
  '00482A91: fmul real8 ptr [004022A0h]
  '00482A97: fmul real8 ptr [004022A0h]
  '00482A9D: fstp real8 ptr [ebp-3Ch]
  '00482AA0: fstsw ax
  '00482AA2: test al, 0Dh
  '00482AA4: jnz 00482B47h
  '00482AAA: fild dword ptr [esi]
  '00482AAC: fstp real8 ptr [ebp-50h]
  '00482AAF: fld real8 ptr [ebp-50h]
  '00482AB2: fsub real8 ptr [ebp-3Ch]
  '00482AB5: cmp [004A0000h], 00000000h
  '00482ABC: jnz 482AC6h
  '00482ABE: fdiv real8 ptr [004022A0h]
  '00482AC4: jmp 482AD7h
  '00482AC6: push [004022A4h]
  '00482ACC: push [004022A0h]
  '00482AD2: call 004037B4h
  '00482AD7: fstsw ax
  '00482AD9: test al, 0Dh
  '00482ADB: jnz 482B47h
  '00482ADD: call [0040111Ch]
  '00482AE3: fstp real8 ptr [ebp-24h]
  '00482AE6: fld real8 ptr [ebp-24h]
  '00482AE9: fmul real8 ptr [004022A0h]
  '00482AEF: fstp real8 ptr [ebp-34h]
  '00482AF2: fstsw ax
  '00482AF4: test al, 0Dh
  '00482AF6: jnz 482B47h
  '00482AF8: fild dword ptr [esi]
  '00482AFA: fstp real8 ptr [ebp-58h]
  '00482AFD: fld real8 ptr [ebp-58h]
  '00482B00: fsub real8 ptr [ebp-3Ch]
  '00482B03: fsub real8 ptr [ebp-34h]
  '00482B06: fstsw ax
  '00482B08: test al, 0Dh
  '00482B0A: jnz 482B47h
  '00482B0C: call [0040111Ch]
  '00482B12: fstp real8 ptr [ebp-2Ch]
  '00482B15: wait 
  '00482B16: push 00482B25h
  '00482B1B: lea ecx, [ebp-14h]
  '00482B1E: call [0040138Ch]
  '00482B24: ret 
End Sub
Private Sub unknown_482B50
  '00482B50: mov eax, [esp+08h]
  '00482B54: xor ecx, ecx
  '00482B56: mov eax, [eax]
  '00482B58: test eax, eax
  '00482B5A: setnl cl
  '00482B5D: xor edx, edx
  '00482B5F: cmp eax, 00FFFFFFh
  '00482B64: setle dl
  '00482B67: test ecx, edx
  '00482B69: jnz 482B8Bh
  '00482B6B: and eax, 00FFFFFFh
  '00482B70: push esi
  '00482B71: push eax
  '00482B72: call 004137ACh
  '00482B77: mov esi, eax
  '00482B79: call [004010A4h]
  '00482B7F: mov eax, [esp+10h]
  '00482B83: mov [eax], esi
  '00482B85: xor eax, eax
  '00482B87: pop esi
  '00482B88: retn 000Ch
End Sub
Private Sub PictureHover_482BA0
  '00482BA0: push ebx
  '00482BA1: push esi
  '00482BA2: mov esi, [esp+10h]
  '00482BA6: push edi
  '00482BA7: mov eax, esi
  '00482BA9: cdq 
  '00482BAA: and edx, 0000FFFFh
  '00482BB0: add eax, edx
  '00482BB2: sar eax, 10h
  '00482BB5: mov edi, eax
  '00482BB7: and edi, 800000FFh
  '00482BBD: jns 482BC7h
  '00482BBF: dec edi
  '00482BC0: or edi, FFFFFF00h
  '00482BC6: inc edi
  '00482BC7: mov ebx, [esp+18h]
  '00482BCB: mov ecx, edi
  '00482BCD: imul ecx, ebx
  '00482BD0: mov eax, 2AAAAAABh
  '00482BD5: jo 00482C85h
  '00482BDB: imul ecx
  '00482BDD: sar edx, 05h
  '00482BE0: mov eax, edx
  '00482BE2: shr eax, 1Fh
  '00482BE5: add edx, eax
  '00482BE7: mov eax, esi
  '00482BE9: mov ecx, edx
  '00482BEB: add ecx, edi
  '00482BED: cdq 
  '00482BEE: jo 00482C85h
  '00482BF4: and edx, 000000FFh
  '00482BFA: add eax, edx
  '00482BFC: sar eax, 08h
  '00482BFF: mov edi, eax
  '00482C01: and edi, 800000FFh
  '00482C07: jns 482C11h
  '00482C09: dec edi
  '00482C0A: or edi, FFFFFF00h
  '00482C10: inc edi
  '00482C11: add edi, ebx
  '00482C13: jo 482C85h
  '00482C15: and esi, 000000FFh
  '00482C1B: add esi, ebx
  '00482C1D: jo 482C85h
  '00482C1F: test esi, esi
  '00482C21: jnl 482C27h
  '00482C23: xor esi, esi
  '00482C25: jmp 482C34h
  '00482C27: cmp esi, 000000FFh
  '00482C2D: jle 482C34h
  '00482C2F: mov esi, 000000FFh
  '00482C34: test edi, edi
  '00482C36: jnl 482C3Ch
  '00482C38: xor edi, edi
  '00482C3A: jmp 482C49h
  '00482C3C: cmp edi, 000000FFh
  '00482C42: jle 482C49h
  '00482C44: mov edi, 000000FFh
  '00482C49: test ecx, ecx
  '00482C4B: jnl 482C51h
  '00482C4D: xor ecx, ecx
  '00482C4F: jmp 482C5Eh
  '00482C51: cmp ecx, 000000FFh
  '00482C57: jle 482C5Eh
  '00482C59: mov ecx, 000000FFh
  '00482C5E: mov ebx, [0040119Ch]
  '00482C64: call ebx
  '00482C66: push eax
  '00482C67: mov ecx, edi
  '00482C69: call ebx
  '00482C6B: push eax
  '00482C6C: mov ecx, esi
  '00482C6E: call ebx
  '00482C70: push eax
  '00482C71: call [00401044h]
  '00482C77: pop edi
  '00482C78: pop esi
  '00482C79: mov ecx, [esp+14h]
  '00482C7D: pop ebx
  '00482C7E: mov [ecx], eax
  '00482C80: xor eax, eax
  '00482C82: retn 0010h
End Sub
Private Sub PictureHover_482C90
  '00482C90: sub esp, 0000000Ch
  '00482C93: push ebp
  '00482C94: push esi
  '00482C95: mov esi, [esp+18h]
  '00482C99: xor eax, eax
  '00482C9B: lea edx, [esp+08h]
  '00482C9F: push edi
  '00482CA0: mov ecx, [esi]
  '00482CA2: mov [esp+10h], eax
  '00482CA6: push edx
  '00482CA7: push esi
  '00482CA8: mov [esp+1Ch], eax
  '00482CAC: mov [esp+14h], eax
  '00482CB0: call [ecx+000000D8h]
  '00482CB6: mov ebp, [004010A8h]
  '00482CBC: test eax, eax
  '00482CBE: fclex 
  '00482CC0: jnl 482CD0h
  '00482CC2: push 000000D8h
  '00482CC7: push 0041FF4Ch
  '00482CCC: push esi
  '00482CCD: push eax
  '00482CCE: call ebp
  '00482CD0: mov eax, [esp+30h]
  '00482CD4: push ebx
  '00482CD5: push eax
  '00482CD6: push 00000001h
  '00482CD8: push 00000000h
  '00482CDA: call 0042002Ch
  '00482CDF: mov edi, [004010A4h]
  '00482CE5: mov ebx, eax
  '00482CE7: call edi
  '00482CE9: mov ecx, [esp+10h]
  '00482CED: push ebx
  '00482CEE: push ecx
  '00482CEF: call 00412934h
  '00482CF4: mov ebx, eax
  '00482CF6: call edi
  '00482CF8: push ebx
  '00482CF9: call 0041297Ch
  '00482CFE: call edi
  '00482D00: mov edx, [esi]
  '00482D02: lea eax, [esp+10h]
  '00482D06: push eax
  '00482D07: push esi
  '00482D08: call [edx+000000D8h]
  '00482D0E: test eax, eax
  '00482D10: fclex 
  '00482D12: pop ebx
  '00482D13: jnl 482D23h
  '00482D15: push 000000D8h
  '00482D1A: push 0041FF4Ch
  '00482D1F: push esi
  '00482D20: push eax
  '00482D21: call ebp
  '00482D23: mov edx, [esp+24h]
  '00482D27: mov eax, [esp+20h]
  '00482D2B: lea ecx, [esp+10h]
  '00482D2F: push ecx
  '00482D30: mov ecx, [esp+10h]
  '00482D34: push edx
  '00482D35: push eax
  '00482D36: push ecx
  '00482D37: call 00420070h
  '00482D3C: call edi
  '00482D3E: mov edx, [esi]
  '00482D40: lea eax, [esp+0Ch]
  '00482D44: push eax
  '00482D45: push esi
  '00482D46: call [edx+000000D8h]
  '00482D4C: test eax, eax
  '00482D4E: fclex 
  '00482D50: jnl 482D60h
  '00482D52: push 000000D8h
  '00482D57: push 0041FF4Ch
  '00482D5C: push esi
  '00482D5D: push eax
  '00482D5E: call ebp
  '00482D60: mov ecx, [esp+2Ch]
  '00482D64: mov edx, [esp+28h]
  '00482D68: mov eax, [esp+0Ch]
  '00482D6C: push ecx
  '00482D6D: push edx
  '00482D6E: push eax
  '00482D6F: call 004200D0h
  '00482D74: call edi
  '00482D76: pop edi
  '00482D77: pop esi
  '00482D78: xor eax, eax
  '00482D7A: pop ebp
  '00482D7B: add esp, 0000000Ch
  '00482D7E: retn 0018h
End Sub
Private Sub XPColor_Pressed_482D90
  '00482D90: sub esp, 00000014h
  '00482D93: xor eax, eax
  '00482D95: push esi
  '00482D96: mov [esp+08h], eax
  '00482D9A: lea edx, [esp+04h]
  '00482D9E: mov [esp+0Ch], eax
  '00482DA2: push edi
  '00482DA3: mov [esp+14h], eax
  '00482DA7: push edx
  '00482DA8: mov [esp+1Ch], eax
  '00482DAC: mov [esp+0Ch], eax
  '00482DB0: mov eax, [esp+24h]
  '00482DB4: lea edx, [esp+3Ch]
  '00482DB8: push edx
  '00482DB9: push eax
  '00482DBA: mov ecx, [eax]
  '00482DBC: call [ecx+00000918h]
  '00482DC2: mov eax, [esp+08h]
  '00482DC6: push eax
  '00482DC7: call 004202E0h
  '00482DCC: mov edi, [004010A4h]
  '00482DD2: mov esi, eax
  '00482DD4: call edi
  '00482DD6: mov edx, [esp+2Ch]
  '00482DDA: mov ecx, [esp+28h]
  '00482DDE: mov eax, [esp+30h]
  '00482DE2: mov [esp+10h], edx
  '00482DE6: mov edx, [esp+3Ch]
  '00482DEA: mov [esp+0Ch], ecx
  '00482DEE: mov ecx, [esp+34h]
  '00482DF2: mov [esp+14h], eax
  '00482DF6: mov al, [edx]
  '00482DF8: mov [esp+18h], ecx
  '00482DFC: mov ecx, [esp+24h]
  '00482E00: cmp al, 01h
  '00482E02: lea eax, [esp+0Ch]
  '00482E06: push esi
  '00482E07: mov edx, [ecx]
  '00482E09: push eax
  '00482E0A: push edx
  '00482E0B: jnz 482E26h
  '00482E0D: call 00420114h
  '00482E12: call edi
  '00482E14: push esi
  '00482E15: call 0041297Ch
  '00482E1A: call edi
  '00482E1C: pop edi
  '00482E1D: xor eax, eax
  '00482E1F: pop esi
  '00482E20: add esp, 00000014h
  '00482E23: retn 0020h
End Sub
Private Sub XPColor_Pressed_482E40
  '00482E40: sub esp, 00000028h
  '00482E43: push ebx
  '00482E44: push ebp
  '00482E45: push esi
  '00482E46: mov esi, [esp+38h]
  '00482E4A: lea ecx, [esp+10h]
  '00482E4E: push edi
  '00482E4F: mov eax, [esi]
  '00482E51: xor edi, edi
  '00482E53: push ecx
  '00482E54: push esi
  '00482E55: mov [esp+24h], edi
  '00482E59: mov byte ptr [esp+1Ah], 00h
  '00482E5E: mov [esp+1Ch], edi
  '00482E62: mov [esp+20h], edi
  '00482E66: mov [esp+28h], edi
  '00482E6A: call [eax+000000D8h]
  '00482E70: mov ebx, [004010A8h]
  '00482E76: cmp eax, edi
  '00482E78: fclex 
  '00482E7A: jnl 482E8Ah
  '00482E7C: push 000000D8h
  '00482E81: push 0041FF4Ch
  '00482E86: push esi
  '00482E87: push eax
  '00482E88: call ebx
  '00482E8A: mov ebp, [004011F4h]
  '00482E90: mov ecx, 00000001h
  '00482E95: call ebp
  '00482E97: mov edx, [esp+14h]
  '00482E9B: lea edi, [esi+0000011Ch]
  '00482EA1: mov [esp+18h], edx
  '00482EA5: lea ecx, [esp+12h]
  '00482EA9: mov edx, [edi]
  '00482EAB: push ecx
  '00482EAC: mov ecx, [esi+44h]
  '00482EAF: push edx
  '00482EB0: mov edx, [esi+40h]
  '00482EB3: push ecx
  '00482EB4: push edx
  '00482EB5: push 00000000h
  '00482EB7: lea ecx, [esp+2Ch]
  '00482EBB: mov [esp+26h], al
  '00482EBF: mov eax, [esi]
  '00482EC1: push 00000000h
  '00482EC3: push ecx
  '00482EC4: push esi
  '00482EC5: call [eax+00000924h]
  '00482ECB: mov edx, [esi]
  '00482ECD: lea eax, [esp+12h]
  '00482ED1: push eax
  '00482ED2: push esi
  '00482ED3: call [edx+000007A8h]
  '00482ED9: test eax, eax
  '00482EDB: jnl 482EEBh
  '00482EDD: push 000007A8h
  '00482EE2: push 0041FF7Ch
  '00482EE7: push esi
  '00482EE8: push eax
  '00482EE9: call ebx
  '00482EEB: cmp word ptr [esp+12h], 0000h
  '00482EF1: jz 00483B77h
  '00482EF7: cmp word ptr [esi+00000120h], FFFFh
  '00482EFF: jnz 482F30h
  '00482F01: mov ebp, [00401044h]
  '00482F07: push 000000E6h
  '00482F0C: push 000000AAh
  '00482F11: push 0000008Ch
  '00482F16: call ebp
  '00482F18: push 00000047h
  '00482F1A: push 00000099h
  '00482F1F: push 000000E1h
  '00482F24: mov [esp+28h], eax
  '00482F28: call ebp
  '00482F2A: mov [esp+24h], eax
  '00482F2E: jmp 482F44h
  '00482F30: mov ecx, [esi+00000124h]
  '00482F36: mov edx, [esi+00000128h]
  '00482F3C: mov [esp+1Ch], ecx
  '00482F40: mov [esp+24h], edx
  '00482F44: mov al, [esp+40h]
  '00482F48: test al, al
  '00482F4A: jnz 00483725h
  '00482F50: fild dword ptr [esi+44h]
  '00482F53: lea ecx, [esp+14h]
  '00482F57: push ecx
  '00482F58: push edi
  '00482F59: fstp real8 ptr [esp+30h]
  '00482F5D: fld real8 ptr [00402868h]
  '00482F63: cmp [004A0000h], 00000000h
  '00482F6A: jnz 482F72h
  '00482F6C: fdiv real8 ptr [esp+30h]
  '00482F70: jmp 482F7Fh
  '00482F72: push [esp+34h]
  '00482F76: push [esp+34h]
  '00482F7A: call 004037B4h
  '00482F7F: push esi
  '00482F80: fstp real4 ptr [esp+48h]
  '00482F84: fstsw ax
  '00482F86: test al, 0Dh
  '00482F88: jnz 00483DBFh
  '00482F8E: mov eax, [esi]
  '00482F90: call [eax+00000918h]
  '00482F96: mov edx, [esi]
  '00482F98: lea eax, [esp+18h]
  '00482F9C: mov ecx, [esp+14h]
  '00482FA0: push eax
  '00482FA1: push 00000030h
  '00482FA3: push ecx
  '00482FA4: push esi
  '00482FA5: call [edx+0000091Ch]
  '00482FAB: mov eax, [esi+44h]
  '00482FAE: mov ebp, [esp+18h]
  '00482FB2: mov edi, 00000001h
  '00482FB7: mov [esp+28h], eax
  '00482FBB: cmp eax, edi
  '00482FBD: mov [esp+40h], edi
  '00482FC1: jl 483030h
  '00482FC3: fld real4 ptr [esp+3Ch]
  '00482FC7: fchs 
  '00482FC9: fstsw ax
  '00482FCB: test al, 0Dh
  '00482FCD: jnz 00483DBFh
  '00482FD3: fild dword ptr [esp+40h]
  '00482FD7: mov ebx, [esi]
  '00482FD9: lea edx, [esp+14h]
  '00482FDD: push edx
  '00482FDE: fstp real8 ptr [esp+34h]
  '00482FE2: fmul real8 ptr [esp+34h]
  '00482FE6: fstsw ax
  '00482FE8: test al, 0Dh
  '00482FEA: jnz 00483DBFh
  '00482FF0: call [00401320h]
  '00482FF6: push eax
  '00482FF7: push ebp
  '00482FF8: push esi
  '00482FF9: call [ebx+0000091Ch]
  '00482FFF: mov edx, [esi+40h]
  '00483002: mov eax, [esi]
  '00483004: mov ecx, [esp+14h]
  '00483008: push ecx
  '00483009: push edi
  '0048300A: push edx
  '0048300B: push edi
  '0048300C: push 00000000h
  '0048300E: push esi
  '0048300F: call [eax+00000920h]
  '00483015: add edi, 00000001h
  '00483018: mov eax, [esp+28h]
  '0048301C: jo 00483DC4h
  '00483022: cmp edi, eax
  '00483024: mov [esp+40h], edi
  '00483028: jle 482FC3h
  '0048302A: mov ebx, [004010A8h]
  '00483030: mov eax, [esi]
  '00483032: lea ecx, [esp+14h]
  '00483036: push ecx
  '00483037: push esi
  '00483038: call [eax+000000D8h]
  '0048303E: test eax, eax
  '00483040: fclex 
  '00483042: jnl 483052h
  '00483044: push 000000D8h
  '00483049: push 0041FF4Ch
  '0048304E: push esi
  '0048304F: push eax
  '00483050: call ebx
  '00483052: mov edx, [esp+14h]
  '00483056: mov eax, [esi]
  '00483058: lea ecx, [esp+12h]
  '0048305C: mov [esp+18h], edx
  '00483060: mov edx, [esi+44h]
  '00483063: push ecx
  '00483064: mov ecx, [esi+40h]
  '00483067: push 80000015h
  '0048306C: push edx
  '0048306D: push ecx
  '0048306E: push 00000000h
  '00483070: lea edx, [esp+2Ch]
  '00483074: push 00000000h
  '00483076: push edx
  '00483077: push esi
  '00483078: mov byte ptr [esp+32h], 00h
  '0048307D: call [eax+00000924h]
  '00483083: mov eax, [esi]
  '00483085: lea ecx, [esp+14h]
  '00483089: push ecx
  '0048308A: push esi
  '0048308B: call [eax+000000D8h]
  '00483091: test eax, eax
  '00483093: fclex 
  '00483095: jnl 4830A5h
  '00483097: push 000000D8h
  '0048309C: push 0041FF4Ch
  '004830A1: push esi
  '004830A2: push eax
  '004830A3: call ebx
  '004830A5: mov edx, [esp+14h]
  '004830A9: push 80000015h
  '004830AE: push 00000001h
  '004830B0: push 00000001h
  '004830B2: push edx
  '004830B3: call 0042019Ch
  '004830B8: mov edi, [004010A4h]
  '004830BE: call edi
  '004830C0: mov eax, [esi]
  '004830C2: lea ecx, [esp+14h]
  '004830C6: push ecx
  '004830C7: push esi
  '004830C8: call [eax+000000D8h]
  '004830CE: test eax, eax
  '004830D0: fclex 
  '004830D2: jnl 4830E2h
  '004830D4: push 000000D8h
  '004830D9: push 0041FF4Ch
  '004830DE: push esi
  '004830DF: push eax
  '004830E0: call ebx
  '004830E2: mov edx, [esi+44h]
  '004830E5: mov eax, [esp+14h]
  '004830E9: sub edx, 00000002h
  '004830EC: push 80000015h
  '004830F1: jo 00483DC4h
  '004830F7: push edx
  '004830F8: push 00000001h
  '004830FA: push eax
  '004830FB: call 0042019Ch
  '00483100: call edi
  '00483102: mov ecx, [esi]
  '00483104: lea edx, [esp+14h]
  '00483108: push edx
  '00483109: push esi
  '0048310A: call [ecx+000000D8h]
  '00483110: test eax, eax
  '00483112: fclex 
  '00483114: jnl 483124h
  '00483116: push 000000D8h
  '0048311B: push 0041FF4Ch
  '00483120: push esi
  '00483121: push eax
  '00483122: call ebx
  '00483124: mov eax, [esi+40h]
  '00483127: mov ecx, [esp+14h]
  '0048312B: sub eax, 00000002h
  '0048312E: push 80000015h
  '00483133: push 00000001h
  '00483135: jo 00483DC4h
  '0048313B: push eax
  '0048313C: push ecx
  '0048313D: call 0042019Ch
  '00483142: call edi
  '00483144: mov edx, [esi]
  '00483146: lea eax, [esp+14h]
  '0048314A: push eax
  '0048314B: push esi
  '0048314C: call [edx+000000D8h]
  '00483152: test eax, eax
  '00483154: fclex 
  '00483156: jnl 483166h
  '00483158: push 000000D8h
  '0048315D: push 0041FF4Ch
  '00483162: push esi
  '00483163: push eax
  '00483164: call ebx
  '00483166: mov ecx, [esi+44h]
  '00483169: mov edx, [esi+40h]
  '0048316C: mov eax, [esp+14h]
  '00483170: sub ecx, 00000002h
  '00483173: jo 00483DC4h
  '00483179: sub edx, 00000002h
  '0048317C: push 80000015h
  '00483181: push ecx
  '00483182: jo 00483DC4h
  '00483188: push edx
  '00483189: push eax
  '0048318A: call 0042019Ch
  '0048318F: call edi
  '00483191: cmp byte ptr [esi+000000E8h], 01h
  '00483198: jnz 0048339Fh
  '0048319E: mov ecx, [esi]
  '004831A0: lea edx, [esp+14h]
  '004831A4: push edx
  '004831A5: push esi
  '004831A6: call [ecx+000000D8h]
  '004831AC: test eax, eax
  '004831AE: fclex 
  '004831B0: jnl 4831C0h
  '004831B2: push 000000D8h
  '004831B7: push 0041FF4Ch
  '004831BC: push esi
  '004831BD: push eax
  '004831BE: call ebx
  '004831C0: mov eax, [esp+14h]
  '004831C4: lea edx, [esp+12h]
  '004831C8: mov [esp+18h], eax
  '004831CC: mov eax, [esp+1Ch]
  '004831D0: push edx
  '004831D1: mov edx, [esi+44h]
  '004831D4: push eax
  '004831D5: mov eax, [esi+40h]
  '004831D8: sub edx, 00000002h
  '004831DB: mov ecx, [esi]
  '004831DD: jo 00483DC4h
  '004831E3: sub eax, 00000001h
  '004831E6: push edx
  '004831E7: jo 00483DC4h
  '004831ED: push eax
  '004831EE: push 00000002h
  '004831F0: lea edx, [esp+2Ch]
  '004831F4: push 00000001h
  '004831F6: push edx
  '004831F7: push esi
  '004831F8: mov byte ptr [esp+32h], 00h
  '004831FD: call [ecx+00000924h]
  '00483203: mov eax, [esi]
  '00483205: lea ecx, [esp+14h]
  '00483209: lea edx, [esp+1Ch]
  '0048320D: push ecx
  '0048320E: push edx
  '0048320F: push esi
  '00483210: call [eax+00000918h]
  '00483216: mov eax, [esi]
  '00483218: lea ecx, [esp+18h]
  '0048321C: mov edx, [esp+14h]
  '00483220: push ecx
  '00483221: push FFFFFFDFh
  '00483223: push edx
  '00483224: push esi
  '00483225: call [eax+0000091Ch]
  '0048322B: mov eax, [esi+44h]
  '0048322E: mov ecx, [esi]
  '00483230: mov edx, [esp+18h]
  '00483234: push edx
  '00483235: mov edx, eax
  '00483237: sub edx, 00000002h
  '0048323A: jo 00483DC4h
  '00483240: push edx
  '00483241: mov edx, [esi+40h]
  '00483244: sub edx, 00000002h
  '00483247: jo 00483DC4h
  '0048324D: sub eax, 00000002h
  '00483250: push edx
  '00483251: jo 00483DC4h
  '00483257: push eax
  '00483258: push 00000002h
  '0048325A: push esi
  '0048325B: call [ecx+00000920h]
  '00483261: mov eax, [esi]
  '00483263: lea ecx, [esp+14h]
  '00483267: lea edx, [esp+1Ch]
  '0048326B: push ecx
  '0048326C: push edx
  '0048326D: push esi
  '0048326E: call [eax+00000918h]
  '00483274: mov eax, [esi]
  '00483276: lea ecx, [esp+18h]
  '0048327A: mov edx, [esp+14h]
  '0048327E: push ecx
  '0048327F: push 00000041h
  '00483281: push edx
  '00483282: push esi
  '00483283: call [eax+0000091Ch]
  '00483289: mov edx, [esi+40h]
  '0048328C: mov eax, [esi]
  '0048328E: mov ecx, [esp+18h]
  '00483292: sub edx, 00000002h
  '00483295: push ecx
  '00483296: push 00000001h
  '00483298: jo 00483DC4h
  '0048329E: push edx
  '0048329F: push 00000001h
  '004832A1: push 00000002h
  '004832A3: push esi
  '004832A4: call [eax+00000920h]
  '004832AA: mov eax, [esi]
  '004832AC: lea ecx, [esp+14h]
  '004832B0: lea edx, [esp+1Ch]
  '004832B4: push ecx
  '004832B5: push edx
  '004832B6: push esi
  '004832B7: call [eax+00000918h]
  '004832BD: mov eax, [esi]
  '004832BF: lea ecx, [esp+18h]
  '004832C3: mov edx, [esp+14h]
  '004832C7: push ecx
  '004832C8: push 00000032h
  '004832CA: push edx
  '004832CB: push esi
  '004832CC: call [eax+0000091Ch]
  '004832D2: mov edx, [esi+40h]
  '004832D5: mov eax, [esi]
  '004832D7: mov ecx, [esp+18h]
  '004832DB: sub edx, 00000001h
  '004832DE: push ecx
  '004832DF: push 00000002h
  '004832E1: jo 00483DC4h
  '004832E7: push edx
  '004832E8: push 00000002h
  '004832EA: push 00000001h
  '004832EC: push esi
  '004832ED: call [eax+00000920h]
  '004832F3: mov eax, [esi]
  '004832F5: lea ecx, [esp+14h]
  '004832F9: lea edx, [esp+1Ch]
  '004832FD: push ecx
  '004832FE: push edx
  '004832FF: push esi
  '00483300: call [eax+00000918h]
  '00483306: mov eax, [esi]
  '00483308: lea ecx, [esp+18h]
  '0048330C: mov edx, [esp+14h]
  '00483310: push ecx
  '00483311: push 0000001Fh
  '00483313: push edx
  '00483314: push esi
  '00483315: call [eax+0000091Ch]
  '0048331B: mov edx, [esi+44h]
  '0048331E: mov eax, [esi]
  '00483320: mov ecx, [esp+18h]
  '00483324: sub edx, 00000003h
  '00483327: push ecx
  '00483328: jo 00483DC4h
  '0048332E: push edx
  '0048332F: push 00000002h
  '00483331: push 00000003h
  '00483333: push 00000002h
  '00483335: push esi
  '00483336: call [eax+00000920h]
  '0048333C: mov eax, [esi]
  '0048333E: lea ecx, [esp+14h]
  '00483342: lea edx, [esp+1Ch]
  '00483346: push ecx
  '00483347: push edx
  '00483348: push esi
  '00483349: call [eax+00000918h]
  '0048334F: mov eax, [esi]
  '00483351: lea ecx, [esp+18h]
  '00483355: mov edx, [esp+14h]
  '00483359: push ecx
  '0048335A: push 0000001Fh
  '0048335C: push edx
  '0048335D: push esi
  '0048335E: call [eax+0000091Ch]
  '00483364: mov eax, [esi+40h]
  '00483367: mov ecx, [esi]
  '00483369: mov edx, [esp+18h]
  '0048336D: push edx
  '0048336E: mov edx, [esi+44h]
  '00483371: sub edx, 00000003h
  '00483374: jo 00483DC4h
  '0048337A: push edx
  '0048337B: mov edx, eax
  '0048337D: sub edx, 00000003h
  '00483380: jo 00483DC4h
  '00483386: sub eax, 00000003h
  '00483389: push edx
  '0048338A: push 00000003h
  '0048338C: jo 00483DC4h
  '00483392: push eax
  '00483393: push esi
  '00483394: call [ecx+00000920h]
  '0048339A: jmp 00483583h
  '0048339F: mov eax, [esi]
  '004833A1: lea ecx, [esp+14h]
  '004833A5: push ecx
  '004833A6: push FFFFFFD0h
  '004833A8: push ebp
  '004833A9: push esi
  '004833AA: call [eax+0000091Ch]
  '004833B0: mov eax, [esi+44h]
  '004833B3: mov edx, [esi]
  '004833B5: mov ecx, [esp+14h]
  '004833B9: push ecx
  '004833BA: mov ecx, eax
  '004833BC: sub ecx, 00000002h
  '004833BF: jo 00483DC4h
  '004833C5: push ecx
  '004833C6: mov ecx, [esi+40h]
  '004833C9: sub ecx, 00000002h
  '004833CC: jo 00483DC4h
  '004833D2: sub eax, 00000002h
  '004833D5: push ecx
  '004833D6: jo 00483DC4h
  '004833DC: push eax
  '004833DD: push 00000002h
  '004833DF: push esi
  '004833E0: call [edx+00000920h]
  '004833E6: mov edx, [esi]
  '004833E8: lea eax, [esp+14h]
  '004833EC: push eax
  '004833ED: push FFFFFFE0h
  '004833EF: push ebp
  '004833F0: push esi
  '004833F1: call [edx+0000091Ch]
  '004833F7: mov eax, [esi+44h]
  '004833FA: mov ecx, [esi]
  '004833FC: mov edx, [esp+14h]
  '00483400: push edx
  '00483401: mov edx, eax
  '00483403: sub edx, 00000003h
  '00483406: jo 00483DC4h
  '0048340C: push edx
  '0048340D: mov edx, [esi+40h]
  '00483410: sub edx, 00000002h
  '00483413: jo 00483DC4h
  '00483419: sub eax, 00000003h
  '0048341C: push edx
  '0048341D: jo 00483DC4h
  '00483423: push eax
  '00483424: push 00000001h
  '00483426: push esi
  '00483427: call [ecx+00000920h]
  '0048342D: mov eax, [esi]
  '0048342F: lea ecx, [esp+14h]
  '00483433: push ecx
  '00483434: push FFFFFFDCh
  '00483436: push ebp
  '00483437: push esi
  '00483438: call [eax+0000091Ch]
  '0048343E: mov eax, [esi+40h]
  '00483441: mov edx, [esi]
  '00483443: mov ecx, [esp+14h]
  '00483447: push ecx
  '00483448: mov ecx, [esi+44h]
  '0048344B: sub ecx, 00000002h
  '0048344E: jo 00483DC4h
  '00483454: push ecx
  '00483455: mov ecx, eax
  '00483457: sub ecx, 00000002h
  '0048345A: jo 00483DC4h
  '00483460: sub eax, 00000002h
  '00483463: push ecx
  '00483464: push 00000002h
  '00483466: jo 00483DC4h
  '0048346C: push eax
  '0048346D: push esi
  '0048346E: call [edx+00000920h]
  '00483474: mov edx, [esi]
  '00483476: lea eax, [esp+14h]
  '0048347A: push eax
  '0048347B: push FFFFFFE8h
  '0048347D: push ebp
  '0048347E: push esi
  '0048347F: call [edx+0000091Ch]
  '00483485: mov eax, [esi+40h]
  '00483488: mov ecx, [esi]
  '0048348A: mov edx, [esp+14h]
  '0048348E: push edx
  '0048348F: mov edx, [esi+44h]
  '00483492: sub edx, 00000003h
  '00483495: jo 00483DC4h
  '0048349B: push edx
  '0048349C: mov edx, eax
  '0048349E: sub edx, 00000003h
  '004834A1: jo 00483DC4h
  '004834A7: sub eax, 00000003h
  '004834AA: push edx
  '004834AB: push 00000003h
  '004834AD: jo 00483DC4h
  '004834B3: push eax
  '004834B4: push esi
  '004834B5: call [ecx+00000920h]
  '004834BB: mov eax, [esi]
  '004834BD: lea ecx, [esp+14h]
  '004834C1: push ecx
  '004834C2: push 00000010h
  '004834C4: push ebp
  '004834C5: push esi
  '004834C6: call [eax+0000091Ch]
  '004834CC: mov ecx, [esi+40h]
  '004834CF: mov edx, [esi]
  '004834D1: mov eax, [esp+14h]
  '004834D5: sub ecx, 00000002h
  '004834D8: push eax
  '004834D9: push 00000001h
  '004834DB: jo 00483DC4h
  '004834E1: push ecx
  '004834E2: push 00000001h
  '004834E4: push 00000002h
  '004834E6: push esi
  '004834E7: call [edx+00000920h]
  '004834ED: mov edx, [esi]
  '004834EF: lea eax, [esp+14h]
  '004834F3: push eax
  '004834F4: push 0000000Ah
  '004834F6: push ebp
  '004834F7: push esi
  '004834F8: call [edx+0000091Ch]
  '004834FE: mov eax, [esi+40h]
  '00483501: mov ecx, [esi]
  '00483503: mov edx, [esp+14h]
  '00483507: sub eax, 00000002h
  '0048350A: push edx
  '0048350B: push 00000002h
  '0048350D: jo 00483DC4h
  '00483513: push eax
  '00483514: push 00000002h
  '00483516: push 00000001h
  '00483518: push esi
  '00483519: call [ecx+00000920h]
  '0048351F: mov ecx, [esi]
  '00483521: lea edx, [esp+14h]
  '00483525: push edx
  '00483526: push FFFFFFFBh
  '00483528: push ebp
  '00483529: push esi
  '0048352A: call [ecx+0000091Ch]
  '00483530: mov edx, [esi+44h]
  '00483533: mov eax, [esi]
  '00483535: mov ecx, [esp+14h]
  '00483539: sub edx, 00000002h
  '0048353C: push ecx
  '0048353D: jo 00483DC4h
  '00483543: push edx
  '00483544: push 00000001h
  '00483546: push 00000002h
  '00483548: push 00000001h
  '0048354A: push esi
  '0048354B: call [eax+00000920h]
  '00483551: mov eax, [esi]
  '00483553: lea ecx, [esp+14h]
  '00483557: push ecx
  '00483558: push FFFFFFF6h
  '0048355A: push ebp
  '0048355B: push esi
  '0048355C: call [eax+0000091Ch]
  '00483562: mov ecx, [esi+44h]
  '00483565: mov edx, [esi]
  '00483567: mov eax, [esp+14h]
  '0048356B: sub ecx, 00000003h
  '0048356E: push eax
  '0048356F: jo 00483DC4h
  '00483575: push ecx
  '00483576: push 00000002h
  '00483578: push 00000003h
  '0048357A: push 00000002h
  '0048357C: push esi
  '0048357D: call [edx+00000920h]
  '00483583: mov edx, [esp+44h]
  '00483587: cmp byte ptr [edx], 01h
  '0048358A: jnz 00483DB3h
  '00483590: mov eax, [esi]
  '00483592: lea ecx, [esp+14h]
  '00483596: push ecx
  '00483597: push esi
  '00483598: call [eax+000000D8h]
  '0048359E: test eax, eax
  '004835A0: fclex 
  '004835A2: jnl 4835B2h
  '004835A4: push 000000D8h
  '004835A9: push 0041FF4Ch
  '004835AE: push esi
  '004835AF: push eax
  '004835B0: call ebx
  '004835B2: mov edx, [esp+14h]
  '004835B6: mov edi, [esp+24h]
  '004835BA: mov [esp+18h], edx
  '004835BE: mov edx, [esi+44h]
  '004835C1: lea ecx, [esp+12h]
  '004835C5: sub edx, 00000002h
  '004835C8: push ecx
  '004835C9: mov ecx, [esi+40h]
  '004835CC: mov eax, [esi]
  '004835CE: push edi
  '004835CF: jo 00483DC4h
  '004835D5: sub ecx, 00000001h
  '004835D8: push edx
  '004835D9: jo 00483DC4h
  '004835DF: push ecx
  '004835E0: push 00000002h
  '004835E2: lea edx, [esp+2Ch]
  '004835E6: push 00000001h
  '004835E8: push edx
  '004835E9: push esi
  '004835EA: mov byte ptr [esp+32h], 00h
  '004835EF: call [eax+00000924h]
  '004835F5: mov eax, [esi]
  '004835F7: lea ecx, [esp+14h]
  '004835FB: push ecx
  '004835FC: push FFFFFFD8h
  '004835FE: push edi
  '004835FF: push esi
  '00483600: call [eax+0000091Ch]
  '00483606: mov eax, [esi+44h]
  '00483609: mov edx, [esi]
  '0048360B: mov ecx, [esp+14h]
  '0048360F: push ecx
  '00483610: mov ecx, eax
  '00483612: sub ecx, 00000002h
  '00483615: jo 00483DC4h
  '0048361B: push ecx
  '0048361C: mov ecx, [esi+40h]
  '0048361F: sub ecx, 00000002h
  '00483622: jo 00483DC4h
  '00483628: sub eax, 00000002h
  '0048362B: push ecx
  '0048362C: jo 00483DC4h
  '00483632: push eax
  '00483633: push 00000002h
  '00483635: push esi
  '00483636: call [edx+00000920h]
  '0048363C: mov edx, [esi]
  '0048363E: lea eax, [esp+14h]
  '00483642: push eax
  '00483643: push 0000005Ah
  '00483645: push edi
  '00483646: push esi
  '00483647: call [edx+0000091Ch]
  '0048364D: mov eax, [esi+40h]
  '00483650: mov ecx, [esi]
  '00483652: mov edx, [esp+14h]
  '00483656: sub eax, 00000002h
  '00483659: push edx
  '0048365A: push 00000001h
  '0048365C: jo 00483DC4h
  '00483662: push eax
  '00483663: push 00000001h
  '00483665: push 00000002h
  '00483667: push esi
  '00483668: call [ecx+00000920h]
  '0048366E: mov ecx, [esi]
  '00483670: lea edx, [esp+14h]
  '00483674: push edx
  '00483675: push 00000023h
  '00483677: push edi
  '00483678: push esi
  '00483679: call [ecx+0000091Ch]
  '0048367F: mov edx, [esi+40h]
  '00483682: mov eax, [esi]
  '00483684: mov ecx, [esp+14h]
  '00483688: sub edx, 00000001h
  '0048368B: push ecx
  '0048368C: push 00000002h
  '0048368E: jo 00483DC4h
  '00483694: push edx
  '00483695: push 00000002h
  '00483697: push 00000001h
  '00483699: push esi
  '0048369A: call [eax+00000920h]
  '004836A0: mov eax, [esi]
  '004836A2: lea ecx, [esp+14h]
  '004836A6: push ecx
  '004836A7: push 00000014h
  '004836A9: push edi
  '004836AA: push esi
  '004836AB: call [eax+0000091Ch]
  '004836B1: mov ecx, [esi+44h]
  '004836B4: mov edx, [esi]
  '004836B6: mov eax, [esp+14h]
  '004836BA: sub ecx, 00000003h
  '004836BD: push eax
  '004836BE: jo 00483DC4h
  '004836C4: push ecx
  '004836C5: push 00000002h
  '004836C7: push 00000003h
  '004836C9: push 00000002h
  '004836CB: push esi
  '004836CC: call [edx+00000920h]
  '004836D2: mov edx, [esi]
  '004836D4: lea eax, [esp+14h]
  '004836D8: push eax
  '004836D9: push 00000014h
  '004836DB: push edi
  '004836DC: push esi
  '004836DD: call [edx+0000091Ch]
  '004836E3: mov eax, [esi+40h]
  '004836E6: mov ecx, [esi]
  '004836E8: mov edx, [esp+14h]
  '004836EC: push edx
  '004836ED: mov edx, [esi+44h]
  '004836F0: sub edx, 00000003h
  '004836F3: jo 00483DC4h
  '004836F9: push edx
  '004836FA: mov edx, eax
  '004836FC: sub edx, 00000003h
  '004836FF: jo 00483DC4h
  '00483705: sub eax, 00000003h
  '00483708: push edx
  '00483709: push 00000003h
  '0048370B: jo 00483DC4h
  '00483711: push eax
  '00483712: push esi
  '00483713: call [ecx+00000920h]
  '00483719: pop edi
  '0048371A: pop esi
  '0048371B: pop ebp
  '0048371C: xor eax, eax
  '0048371E: pop ebx
  '0048371F: add esp, 00000028h
  '00483722: retn 000Ch
End Sub
Private Sub XPColor_Hover_483DD0
  '00483DD0: push ecx
  '00483DD1: push ebx
  '00483DD2: push ebp
  '00483DD3: push esi
  '00483DD4: push edi
  '00483DD5: mov edi, [esp+18h]
  '00483DD9: mov [esp+10h], 00000000h
  '00483DE1: mov eax, [edi+3Ch]
  '00483DE4: push eax
  '00483DE5: call 0041297Ch
  '00483DEA: mov esi, [004010A4h]
  '00483DF0: call esi
  '00483DF2: mov ecx, [edi+44h]
  '00483DF5: mov edx, [edi+40h]
  '00483DF8: push ecx
  '00483DF9: push edx
  '00483DFA: push 00000000h
  '00483DFC: push 00000000h
  '00483DFE: call 004201E4h
  '00483E03: mov [esp+10h], eax
  '00483E07: call esi
  '00483E09: mov eax, [esp+10h]
  '00483E0D: push 00000000h
  '00483E0F: push 00000000h
  '00483E11: push 00000000h
  '00483E13: push 00000000h
  '00483E15: mov [edi+3Ch], eax
  '00483E18: call 004201E4h
  '00483E1D: mov [esp+10h], eax
  '00483E21: call esi
  '00483E23: mov ebx, [esp+10h]
  '00483E27: push 00000001h
  '00483E29: push 00000002h
  '00483E2B: push 00000000h
  '00483E2D: push 00000000h
  '00483E2F: call 004201E4h
  '00483E34: mov [esp+10h], eax
  '00483E38: call esi
  '00483E3A: mov eax, [esp+10h]
  '00483E3E: mov ecx, [edi+3Ch]
  '00483E41: push 00000004h
  '00483E43: push eax
  '00483E44: push ecx
  '00483E45: push ebx
  '00483E46: mov ebp, eax
  '00483E48: call 00420228h
  '00483E4D: call esi
  '00483E4F: push ebp
  '00483E50: call 0041297Ch
  '00483E55: call esi
  '00483E57: mov eax, [edi+44h]
  '00483E5A: mov edx, eax
  '00483E5C: sub edx, 00000001h
  '00483E5F: jo 00484059h
  '00483E65: push edx
  '00483E66: push 00000002h
  '00483E68: push eax
  '00483E69: push 00000000h
  '00483E6B: call 004201E4h
  '00483E70: mov [esp+10h], eax
  '00483E74: call esi
  '00483E76: mov eax, [esp+10h]
  '00483E7A: push 00000004h
  '00483E7C: mov ebp, eax
  '00483E7E: push eax
  '00483E7F: mov eax, [edi+3Ch]
  '00483E82: push ebx
  '00483E83: push eax
  '00483E84: call 00420228h
  '00483E89: call esi
  '00483E8B: push ebp
  '00483E8C: call 0041297Ch
  '00483E91: call esi
  '00483E93: mov eax, [edi+40h]
  '00483E96: push 00000001h
  '00483E98: mov ecx, eax
  '00483E9A: sub ecx, 00000002h
  '00483E9D: jo 00484059h
  '00483EA3: push ecx
  '00483EA4: push 00000000h
  '00483EA6: push eax
  '00483EA7: call 004201E4h
  '00483EAC: mov [esp+10h], eax
  '00483EB0: call esi
  '00483EB2: mov eax, [esp+10h]
  '00483EB6: mov edx, [edi+3Ch]
  '00483EB9: push 00000004h
  '00483EBB: push eax
  '00483EBC: push edx
  '00483EBD: push ebx
  '00483EBE: mov ebp, eax
  '00483EC0: call 00420228h
  '00483EC5: call esi
  '00483EC7: push ebp
  '00483EC8: call 0041297Ch
  '00483ECD: call esi
  '00483ECF: mov eax, [edi+44h]
  '00483ED2: mov ecx, [edi+40h]
  '00483ED5: mov edx, eax
  '00483ED7: sub edx, 00000001h
  '00483EDA: jo 00484059h
  '00483EE0: push edx
  '00483EE1: mov edx, ecx
  '00483EE3: sub edx, 00000002h
  '00483EE6: jo 00484059h
  '00483EEC: push edx
  '00483EED: push eax
  '00483EEE: push ecx
  '00483EEF: call 004201E4h
  '00483EF4: mov [esp+10h], eax
  '00483EF8: call esi
  '00483EFA: mov eax, [esp+10h]
  '00483EFE: push 00000004h
  '00483F00: mov ebp, eax
  '00483F02: push eax
  '00483F03: mov eax, [edi+3Ch]
  '00483F06: push ebx
  '00483F07: push eax
  '00483F08: call 00420228h
  '00483F0D: call esi
  '00483F0F: push ebp
  '00483F10: call 0041297Ch
  '00483F15: call esi
  '00483F17: push 00000002h
  '00483F19: push 00000001h
  '00483F1B: push 00000001h
  '00483F1D: push 00000000h
  '00483F1F: call 004201E4h
  '00483F24: mov [esp+10h], eax
  '00483F28: call esi
  '00483F2A: mov eax, [esp+10h]
  '00483F2E: mov ecx, [edi+3Ch]
  '00483F31: push 00000004h
  '00483F33: push eax
  '00483F34: push ecx
  '00483F35: push ebx
  '00483F36: mov ebp, eax
  '00483F38: call 00420228h
  '00483F3D: call esi
  '00483F3F: push ebp
  '00483F40: call 0041297Ch
  '00483F45: call esi
  '00483F47: mov eax, [edi+44h]
  '00483F4A: mov edx, eax
  '00483F4C: sub edx, 00000002h
  '00483F4F: jo 00484059h
  '00483F55: sub eax, 00000001h
  '00483F58: push edx
  '00483F59: push 00000001h
  '00483F5B: jo 00484059h
  '00483F61: push eax
  '00483F62: push 00000000h
  '00483F64: call 004201E4h
  '00483F69: mov [esp+10h], eax
  '00483F6D: call esi
  '00483F6F: mov eax, [esp+10h]
  '00483F73: push 00000004h
  '00483F75: mov ebp, eax
  '00483F77: push eax
  '00483F78: mov eax, [edi+3Ch]
  '00483F7B: push ebx
  '00483F7C: push eax
  '00483F7D: call 00420228h
  '00483F82: call esi
  '00483F84: push ebp
  '00483F85: call 0041297Ch
  '00483F8A: call esi
  '00483F8C: mov eax, [edi+40h]
  '00483F8F: push 00000002h
  '00483F91: mov ecx, eax
  '00483F93: sub ecx, 00000001h
  '00483F96: jo 00484059h
  '00483F9C: push ecx
  '00483F9D: push 00000001h
  '00483F9F: push eax
  '00483FA0: call 004201E4h
  '00483FA5: mov [esp+10h], eax
  '00483FA9: call esi
  '00483FAB: mov eax, [esp+10h]
  '00483FAF: mov edx, [edi+3Ch]
  '00483FB2: push 00000004h
  '00483FB4: push eax
  '00483FB5: push edx
  '00483FB6: push ebx
  '00483FB7: mov ebp, eax
  '00483FB9: call 00420228h
  '00483FBE: call esi
  '00483FC0: push ebp
  '00483FC1: call 0041297Ch
  '00483FC6: call esi
  '00483FC8: mov eax, [edi+44h]
  '00483FCB: mov ecx, [edi+40h]
  '00483FCE: mov edx, eax
  '00483FD0: sub edx, 00000002h
  '00483FD3: jo 00484059h
  '00483FD9: push edx
  '00483FDA: mov edx, ecx
  '00483FDC: sub edx, 00000001h
  '00483FDF: jo 484059h
  '00483FE1: sub eax, 00000001h
  '00483FE4: push edx
  '00483FE5: jo 484059h
  '00483FE7: push eax
  '00483FE8: push ecx
  '00483FE9: call 004201E4h
  '00483FEE: mov [esp+10h], eax
  '00483FF2: call esi
  '00483FF4: mov eax, [esp+10h]
  '00483FF8: push 00000004h
  '00483FFA: mov ebp, eax
  '00483FFC: push eax
  '00483FFD: mov eax, [edi+3Ch]
  '00484000: push ebx
  '00484001: push eax
  '00484002: call 00420228h
  '00484007: call esi
  '00484009: push ebp
  '0048400A: call 0041297Ch
  '0048400F: call esi
  '00484011: push ebx
  '00484012: call 0041297Ch
  '00484017: call esi
  '00484019: mov ecx, [edi]
  '0048401B: lea edx, [esp+10h]
  '0048401F: push edx
  '00484020: push edi
  '00484021: call [ecx+000007B8h]
  '00484027: test eax, eax
  '00484029: jnl 48403Dh
  '0048402B: push 000007B8h
  '00484030: push 0041FF7Ch
  '00484035: push edi
  '00484036: push eax
  '00484037: call [004010A8h]
  '0048403D: mov eax, [edi+3Ch]
  '00484040: mov ecx, [esp+10h]
  '00484044: push FFFFFFFFh
  '00484046: push eax
  '00484047: push ecx
  '00484048: call 00420294h
  '0048404D: call esi
  '0048404F: pop edi
  '00484050: pop esi
  '00484051: pop ebp
  '00484052: xor eax, eax
  '00484054: pop ebx
  '00484055: pop ecx
  '00484056: retn 0004h
End Sub
Private Sub XPColor_Hover_484060
  '00484060: sub esp, 00000024h
  '00484063: mov eax, [esp+38h]
  '00484067: mov edx, [esp+40h]
  '0048406B: push ebx
  '0048406C: push ebp
  '0048406D: mov eax, [eax]
  '0048406F: push esi
  '00484070: mov esi, [esp+48h]
  '00484074: push edi
  '00484075: mov edi, [0040119Ch]
  '0048407B: mov [esp+10h], eax
  '0048407F: mov ecx, [esi]
  '00484081: mov [esp+28h], ecx
  '00484085: mov ecx, [edx]
  '00484087: sub ecx, eax
  '00484089: jo 004843D8h
  '0048408F: call edi
  '00484091: mov ebp, [esi]
  '00484093: mov ebx, eax
  '00484095: mov eax, [esp+54h]
  '00484099: mov ecx, [eax]
  '0048409B: sub ecx, ebp
  '0048409D: jo 004843D8h
  '004840A3: call edi
  '004840A5: mov ebp, [esp+40h]
  '004840A9: mov edi, eax
  '004840AB: mov ecx, [ebp]
  '004840AE: push ecx
  '004840AF: call 0041289Ch
  '004840B4: mov esi, [004010A4h]
  '004840BA: mov [esp+48h], eax
  '004840BE: call esi
  '004840C0: mov eax, [ebp]
  '004840C3: mov edx, [esp+48h]
  '004840C7: push eax
  '004840C8: mov [esp+54h], edx
  '004840CC: call 0041289Ch
  '004840D1: mov [esp+48h], eax
  '004840D5: call esi
  '004840D7: mov ecx, [esp+48h]
  '004840DB: push 00000000h
  '004840DD: movsx edi, di
  '004840E0: movsx ebx, bx
  '004840E3: push 00000001h
  '004840E5: push 00000001h
  '004840E7: push edi
  '004840E8: push ebx
  '004840E9: mov [esp+68h], ecx
  '004840ED: call 00420370h
  '004840F2: mov [esp+48h], eax
  '004840F6: call esi
  '004840F8: mov edx, [esp+48h]
  '004840FC: push 00000000h
  '004840FE: push 00000001h
  '00484100: push 00000001h
  '00484102: push edi
  '00484103: push ebx
  '00484104: mov [esp+60h], edx
  '00484108: call 00420370h
  '0048410D: mov [esp+48h], eax
  '00484111: call esi
  '00484113: mov ecx, [esp+4Ch]
  '00484117: mov edx, [esp+50h]
  '0048411B: mov eax, [esp+48h]
  '0048411F: push ecx
  '00484120: push edx
  '00484121: mov [esp+1Ch], eax
  '00484125: call 00412934h
  '0048412A: mov [esp+48h], eax
  '0048412E: call esi
  '00484130: mov ecx, [esp+14h]
  '00484134: mov edx, [esp+54h]
  '00484138: mov eax, [esp+48h]
  '0048413C: push ecx
  '0048413D: push edx
  '0048413E: mov [esp+24h], eax
  '00484142: call 00412934h
  '00484147: mov [esp+48h], eax
  '0048414B: call esi
  '0048414D: mov eax, [esp+48h]
  '00484151: mov ecx, [ebp]
  '00484154: mov [esp+20h], eax
  '00484158: push ecx
  '00484159: call 0041289Ch
  '0048415E: mov ebp, eax
  '00484160: call esi
  '00484162: mov edx, [esp+40h]
  '00484166: mov eax, [edx]
  '00484168: push eax
  '00484169: call 0041289Ch
  '0048416E: mov [esp+48h], eax
  '00484172: call esi
  '00484174: mov edx, [esp+40h]
  '00484178: mov ecx, [esp+48h]
  '0048417C: push edi
  '0048417D: push ebx
  '0048417E: mov eax, [edx]
  '00484180: mov [esp+54h], ecx
  '00484184: push eax
  '00484185: call 004128ECh
  '0048418A: mov [esp+48h], eax
  '0048418E: call esi
  '00484190: mov edx, [esp+40h]
  '00484194: mov ecx, [esp+48h]
  '00484198: push edi
  '00484199: push ebx
  '0048419A: mov eax, [edx]
  '0048419C: mov [esp+1Ch], ecx
  '004841A0: push eax
  '004841A1: call 004128ECh
  '004841A6: mov [esp+48h], eax
  '004841AA: call esi
  '004841AC: mov edx, [esp+14h]
  '004841B0: mov ecx, [esp+48h]
  '004841B4: push edx
  '004841B5: push ebp
  '004841B6: mov [esp+20h], ecx
  '004841BA: call 00412934h
  '004841BF: mov [esp+48h], eax
  '004841C3: call esi
  '004841C5: mov ecx, [esp+18h]
  '004841C9: mov edx, [esp+4Ch]
  '004841CD: mov eax, [esp+48h]
  '004841D1: push ecx
  '004841D2: push edx
  '004841D3: mov [esp+1Ch], eax
  '004841D7: call 00412934h
  '004841DC: mov [esp+48h], eax
  '004841E0: call esi
  '004841E2: mov eax, [esp+48h]
  '004841E6: mov ecx, [esp+60h]
  '004841EA: mov [esp+18h], eax
  '004841EE: mov eax, [esp+44h]
  '004841F2: mov edx, [ecx]
  '004841F4: mov ecx, [eax]
  '004841F6: push edx
  '004841F7: push ecx
  '004841F8: call 00412AA8h
  '004841FD: mov [esp+48h], eax
  '00484201: call esi
  '00484203: mov edx, [esp+28h]
  '00484207: mov ecx, [esp+44h]
  '0048420B: mov eax, [esp+10h]
  '0048420F: push 00CC0020h
  '00484214: push edx
  '00484215: mov edx, [ecx]
  '00484217: push eax
  '00484218: mov eax, [esp+5Ch]
  '0048421C: push edx
  '0048421D: push edi
  '0048421E: push ebx
  '0048421F: push 00000000h
  '00484221: push 00000000h
  '00484223: push eax
  '00484224: call 004129BCh
  '00484229: call esi
  '0048422B: mov edx, [esp+44h]
  '0048422F: mov ecx, [esp+48h]
  '00484233: push ecx
  '00484234: mov eax, [edx]
  '00484236: push eax
  '00484237: call 00412AA8h
  '0048423C: mov [esp+48h], eax
  '00484240: call esi
  '00484242: mov eax, [esp+50h]
  '00484246: mov edx, [esp+60h]
  '0048424A: mov ecx, [esp+48h]
  '0048424E: push 00330008h
  '00484253: push 00000000h
  '00484255: push 00000000h
  '00484257: push eax
  '00484258: push edi
  '00484259: mov [edx], ecx
  '0048425B: mov ecx, [esp+68h]
  '0048425F: push ebx
  '00484260: push 00000000h
  '00484262: push 00000000h
  '00484264: push ecx
  '00484265: call 004129BCh
  '0048426A: call esi
  '0048426C: mov edx, [esp+5Ch]
  '00484270: mov ecx, [esp+58h]
  '00484274: push 00CC0020h
  '00484279: mov eax, [edx]
  '0048427B: mov edx, [ecx]
  '0048427D: push eax
  '0048427E: mov eax, [esp+48h]
  '00484282: push edx
  '00484283: mov ecx, [eax]
  '00484285: push ecx
  '00484286: push edi
  '00484287: push ebx
  '00484288: push 00000000h
  '0048428A: push 00000000h
  '0048428C: push ebp
  '0048428D: call 004129BCh
  '00484292: call esi
  '00484294: mov edx, [esp+50h]
  '00484298: push 008800C6h
  '0048429D: push 00000000h
  '0048429F: push 00000000h
  '004842A1: push edx
  '004842A2: push edi
  '004842A3: push ebx
  '004842A4: push 00000000h
  '004842A6: push 00000000h
  '004842A8: push ebp
  '004842A9: call 004129BCh
  '004842AE: call esi
  '004842B0: mov eax, [esp+28h]
  '004842B4: mov edx, [esp+44h]
  '004842B8: mov ecx, [esp+10h]
  '004842BC: push 00CC0020h
  '004842C1: push eax
  '004842C2: mov eax, [edx]
  '004842C4: push ecx
  '004842C5: mov ecx, [esp+58h]
  '004842C9: push eax
  '004842CA: push edi
  '004842CB: push ebx
  '004842CC: push 00000000h
  '004842CE: push 00000000h
  '004842D0: push ecx
  '004842D1: call 004129BCh
  '004842D6: call esi
  '004842D8: mov edx, [esp+54h]
  '004842DC: mov eax, [esp+4Ch]
  '004842E0: push 008800C6h
  '004842E5: push 00000000h
  '004842E7: push 00000000h
  '004842E9: push edx
  '004842EA: push edi
  '004842EB: push ebx
  '004842EC: push 00000000h
  '004842EE: push 00000000h
  '004842F0: push eax
  '004842F1: call 004129BCh
  '004842F6: call esi
  '004842F8: mov ecx, [esp+4Ch]
  '004842FC: push 00660046h
  '00484301: push 00000000h
  '00484303: push 00000000h
  '00484305: push ecx
  '00484306: push edi
  '00484307: push ebx
  '00484308: push 00000000h
  '0048430A: push 00000000h
  '0048430C: push ebp
  '0048430D: call 004129BCh
  '00484312: call esi
  '00484314: mov edx, [esp+5Ch]
  '00484318: mov ecx, [esp+58h]
  '0048431C: push 00CC0020h
  '00484321: push 00000000h
  '00484323: mov eax, [edx]
  '00484325: mov edx, [ecx]
  '00484327: push 00000000h
  '00484329: push ebp
  '0048432A: push edi
  '0048432B: push ebx
  '0048432C: push eax
  '0048432D: mov eax, [esp+58h]
  '00484331: push edx
  '00484332: mov ecx, [eax]
  '00484334: push ecx
  '00484335: call 004129BCh
  '0048433A: call esi
  '0048433C: mov edx, [esp+1Ch]
  '00484340: mov ebx, [esp+50h]
  '00484344: push edx
  '00484345: push ebx
  '00484346: call 00412934h
  '0048434B: mov edi, eax
  '0048434D: call esi
  '0048434F: push edi
  '00484350: call 0041297Ch
  '00484355: call esi
  '00484357: mov eax, [esp+20h]
  '0048435B: mov ecx, [esp+54h]
  '0048435F: push eax
  '00484360: push ecx
  '00484361: call 00412934h
  '00484366: mov edi, eax
  '00484368: call esi
  '0048436A: push edi
  '0048436B: call 0041297Ch
  '00484370: call esi
  '00484372: mov edx, [esp+14h]
  '00484376: push edx
  '00484377: push ebp
  '00484378: call 00412934h
  '0048437D: mov edi, eax
  '0048437F: call esi
  '00484381: push edi
  '00484382: call 0041297Ch
  '00484387: call esi
  '00484389: mov eax, [esp+18h]
  '0048438D: mov ecx, [esp+4Ch]
  '00484391: push eax
  '00484392: push ecx
  '00484393: call 00412934h
  '00484398: mov edi, eax
  '0048439A: call esi
  '0048439C: push edi
  '0048439D: call 0041297Ch
  '004843A2: call esi
  '004843A4: push ebx
  '004843A5: call 004127F0h
  '004843AA: call esi
  '004843AC: mov edx, [esp+54h]
  '004843B0: push edx
  '004843B1: call 004127F0h
  '004843B6: call esi
  '004843B8: push ebp
  '004843B9: call 004127F0h
  '004843BE: call esi
  '004843C0: mov eax, [esp+4Ch]
  '004843C4: push eax
  '004843C5: call 004127F0h
  '004843CA: call esi
  '004843CC: pop edi
  '004843CD: pop esi
  '004843CE: pop ebp
  '004843CF: xor eax, eax
  '004843D1: pop ebx
  '004843D2: add esp, 00000024h
  '004843D5: retn 002Ch
End Sub
Private Sub XPDefaultColors_4843E0
  '004843E0: push ebp
  '004843E1: mov ebp, esp
  '004843E3: sub esp, 00000008h
  '004843E6: push 00403796h
  '004843EB: mov eax, fs:[00h]
  '004843F1: push eax
  '004843F2: mov fs:[00000000h], esp
  '004843F9: sub esp, 00000070h
  '004843FC: push ebx
  '004843FD: push esi
  '004843FE: push edi
  '004843FF: mov [ebp-08h], esp
  '00484402: mov [ebp-04h], 00402870h
  '00484409: mov ebx, [ebp+08h]
  '0048440C: xor esi, esi
  '0048440E: mov [ebp-18h], esi
  '00484411: mov [ebp-28h], esi
  '00484414: mov eax, [ebx+000000B8h]
  '0048441A: lea edi, [ebx+000000B8h]
  '00484420: push eax
  '00484421: mov [ebp-38h], esi
  '00484424: mov [ebp-48h], esi
  '00484427: mov [ebp-58h], esi
  '0048442A: mov [ebp-78h], esi
  '0048442D: call [0040103Ch]
  '00484433: cmp eax, 00000001h
  '00484436: jle 004846CDh
  '0048443C: mov ecx, [edi]
  '0048443E: push 00000001h
  '00484440: push ecx
  '00484441: push 0041BDD8h
  '00484446: push 00000001h
  '00484448: call [004012A0h]
  '0048444E: mov edx, [edi]
  '00484450: mov esi, eax
  '00484452: push edx
  '00484453: call [0040103Ch]
  '00484459: cmp esi, eax
  '0048445B: jnl 004846B4h
  '00484461: test esi, esi
  '00484463: jle 004846B4h
  '00484469: mov ecx, esi
  '0048446B: lea eax, [ebp-28h]
  '0048446E: add ecx, 00000001h
  '00484471: push eax
  '00484472: jo 00484737h
  '00484478: lea edx, [ebp-58h]
  '0048447B: push ecx
  '0048447C: lea eax, [ebp-38h]
  '0048447F: push edx
  '00484480: push eax
  '00484481: mov [ebp-20h], 00000001h
  '00484488: mov [ebp-28h], 00000002h
  '0048448F: mov [ebp-50h], edi
  '00484492: mov [ebp-58h], 00004008h
  '00484499: call [00401148h]
  '0048449F: lea ecx, [ebp-38h]
  '004844A2: lea edx, [ebp-78h]
  '004844A5: push ecx
  '004844A6: push edx
  '004844A7: mov [ebp-70h], 0041BDD8h
  '004844AE: mov [ebp-78h], 00008008h
  '004844B5: call [004012E8h]
  '004844BB: mov [ebp-7Ch], ax
  '004844BF: lea eax, [ebp-38h]
  '004844C2: lea ecx, [ebp-28h]
  '004844C5: push eax
  '004844C6: push ecx
  '004844C7: push 00000002h
  '004844C9: call [00401058h]
  '004844CF: add esp, 0000000Ch
  '004844D2: cmp word ptr [ebp-7Ch], 0000h
  '004844D7: jz 00484582h
  '004844DD: lea edx, [ebp-28h]
  '004844E0: add esi, 00000001h
  '004844E3: push edx
  '004844E4: lea eax, [ebp-58h]
  '004844E7: jo 00484737h
  '004844ED: push esi
  '004844EE: lea ecx, [ebp-38h]
  '004844F1: push eax
  '004844F2: push ecx
  '004844F3: mov [ebp-20h], 00000001h
  '004844FA: mov [ebp-28h], 00000002h
  '00484501: mov [ebp-50h], edi
  '00484504: mov [ebp-58h], 00004008h
  '0048450B: call [00401148h]
  '00484511: lea edx, [ebp-38h]
  '00484514: lea eax, [ebp-48h]
  '00484517: push edx
  '00484518: push eax
  '00484519: call [00401080h]
  '0048451F: mov ecx, [ebx+10h]
  '00484522: lea edx, [ebp-48h]
  '00484525: lea eax, [ebp-18h]
  '00484528: push edx
  '00484529: mov esi, [ecx]
  '0048452B: push eax
  '0048452C: call [00401268h]
  '00484532: mov ecx, [ebx+10h]
  '00484535: push eax
  '00484536: push ecx
  '00484537: call [esi+00000324h]
  '0048453D: test eax, eax
  '0048453F: fclex 
  '00484541: jnl 484558h
  '00484543: mov edx, [ebx+10h]
  '00484546: push 00000324h
  '0048454B: push 0041FF4Ch
  '00484550: push edx
  '00484551: push eax
  '00484552: call [004010A8h]
  '00484558: lea ecx, [ebp-18h]
  '0048455B: call [0040138Ch]
  '00484561: lea eax, [ebp-48h]
  '00484564: lea ecx, [ebp-38h]
  '00484567: push eax
  '00484568: lea edx, [ebp-28h]
  '0048456B: push ecx
  '0048456C: push edx
  '0048456D: push 00000003h
  '0048456F: call [00401058h]
  '00484575: add esp, 00000010h
  '00484578: push 00484722h
  '0048457D: jmp 00484721h
  '00484582: mov eax, [edi]
  '00484584: add esi, 00000002h
  '00484587: jo 00484737h
  '0048458D: push esi
  '0048458E: push eax
  '0048458F: push 0041BDD8h
  '00484594: push 00000001h
  '00484596: call [004012A0h]
  '0048459C: mov esi, eax
  '0048459E: lea ecx, [ebp-28h]
  '004845A1: mov edx, esi
  '004845A3: push ecx
  '004845A4: add edx, 00000001h
  '004845A7: lea eax, [ebp-58h]
  '004845AA: jo 00484737h
  '004845B0: push edx
  '004845B1: lea ecx, [ebp-38h]
  '004845B4: push eax
  '004845B5: push ecx
  '004845B6: mov [ebp-20h], 00000001h
  '004845BD: mov [ebp-28h], 00000002h
  '004845C4: mov [ebp-50h], edi
  '004845C7: mov [ebp-58h], 00004008h
  '004845CE: call [00401148h]
  '004845D4: lea edx, [ebp-38h]
  '004845D7: lea eax, [ebp-78h]
  '004845DA: push edx
  '004845DB: push eax
  '004845DC: mov [ebp-70h], 0041BDD8h
  '004845E3: mov [ebp-78h], 00008008h
  '004845EA: call [004012E8h]
  '004845F0: lea ecx, [ebp-38h]
  '004845F3: lea edx, [ebp-28h]
  '004845F6: push ecx
  '004845F7: push edx
  '004845F8: push 00000002h
  '004845FA: mov [ebp-7Ch], ax
  '004845FE: call [00401058h]
  '00484604: add esp, 0000000Ch
  '00484607: cmp word ptr [ebp-7Ch], 0000h
  '0048460C: jz 004846B4h
  '00484612: lea eax, [ebp-28h]
  '00484615: add esi, 00000001h
  '00484618: push eax
  '00484619: lea ecx, [ebp-58h]
  '0048461C: jo 00484737h
  '00484622: push esi
  '00484623: lea edx, [ebp-38h]
  '00484626: push ecx
  '00484627: push edx
  '00484628: mov [ebp-20h], 00000001h
  '0048462F: mov [ebp-28h], 00000002h
  '00484636: mov [ebp-50h], edi
  '00484639: mov [ebp-58h], 00004008h
  '00484640: call [00401148h]
  '00484646: lea eax, [ebp-38h]
  '00484649: lea ecx, [ebp-48h]
  '0048464C: push eax
  '0048464D: push ecx
  '0048464E: call [00401080h]
  '00484654: mov edx, [ebx+10h]
  '00484657: lea eax, [ebp-48h]
  '0048465A: lea ecx, [ebp-18h]
  '0048465D: push eax
  '0048465E: mov esi, [edx]
  '00484660: push ecx
  '00484661: call [00401268h]
  '00484667: mov edx, [ebx+10h]
  '0048466A: push eax
  '0048466B: push edx
  '0048466C: call [esi+00000324h]
  '00484672: test eax, eax
  '00484674: fclex 
  '00484676: jnl 48468Dh
  '00484678: mov ecx, [ebx+10h]
  '0048467B: push 00000324h
  '00484680: push 0041FF4Ch
  '00484685: push ecx
  '00484686: push eax
  '00484687: call [004010A8h]
  '0048468D: lea ecx, [ebp-18h]
  '00484690: call [0040138Ch]
  '00484696: lea edx, [ebp-48h]
  '00484699: lea eax, [ebp-38h]
  '0048469C: push edx
  '0048469D: lea ecx, [ebp-28h]
  '004846A0: push eax
  '004846A1: push ecx
  '004846A2: push 00000003h
  '004846A4: call [00401058h]
  '004846AA: add esp, 00000010h
  '004846AD: push 00484722h
  '004846B2: jmp 484721h
  '004846B4: mov eax, [ebx+10h]
  '004846B7: push 0040FE84h
  '004846BC: push eax
  '004846BD: mov edx, [eax]
  '004846BF: call [edx+00000324h]
  '004846C5: test eax, eax
  '004846C7: fclex 
  '004846C9: jnl 4846F9h
  '004846CB: jmp 4846E4h
  '004846CD: mov eax, [ebx+10h]
  '004846D0: push 0040FE84h
  '004846D5: push eax
  '004846D6: mov edx, [eax]
  '004846D8: call [edx+00000324h]
  '004846DE: cmp eax, esi
  '004846E0: fclex 
  '004846E2: jnl 4846F9h
  '004846E4: mov ecx, [ebx+10h]
  '004846E7: push 00000324h
  '004846EC: push 0041FF4Ch
  '004846F1: push ecx
  '004846F2: push eax
  '004846F3: call [004010A8h]
  '004846F9: push 00484722h
  '004846FE: jmp 484721h
  '00484700: lea ecx, [ebp-18h]
  '00484703: call [0040138Ch]
  '00484709: lea edx, [ebp-48h]
  '0048470C: lea eax, [ebp-38h]
  '0048470F: push edx
  '00484710: lea ecx, [ebp-28h]
  '00484713: push eax
  '00484714: push ecx
  '00484715: push 00000003h
  '00484717: call [00401058h]
  '0048471D: add esp, 00000010h
  '00484720: ret 
End Sub

