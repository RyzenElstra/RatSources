Private Sub unknown_4EB140
  '004EB140: push ebp
  '004EB141: mov ebp, esp
  '004EB143: sub esp, 0000000Ch
  '004EB146: push 004081B6h
  '004EB14B: mov eax, fs:[00h]
  '004EB151: push eax
  '004EB152: mov fs:[00000000h], esp
  '004EB159: sub esp, 0000000Ch
  '004EB15C: push ebx
  '004EB15D: push esi
  '004EB15E: push edi
  '004EB15F: mov [ebp-0Ch], esp
  '004EB162: mov [ebp-08h], 00405530h
  '004EB169: xor edi, edi
  '004EB16B: mov [ebp-04h], edi
  '004EB16E: mov esi, [ebp+08h]
  '004EB171: push esi
  '004EB172: mov eax, [esi]
  '004EB174: call [eax+04h]
  '004EB177: mov edx, [ebp+0Ch]
  '004EB17A: mov [ebp-18h], edi
  '004EB17D: mov edi, [004012D8h]
  '004EB183: lea ecx, [ebp-18h]
  '004EB186: call edi
  '004EB188: mov edx, [ebp-18h]
  '004EB18B: lea ecx, [esi+38h]
  '004EB18E: call edi
  '004EB190: push 004EB19Fh
  '004EB195: lea ecx, [ebp-18h]
  '004EB198: call [004013B4h]
  '004EB19E: ret 
End Sub
Private Sub unknown_4EB1C0
  '004EB1C0: push ebp
  '004EB1C1: mov ebp, esp
  '004EB1C3: sub esp, 0000000Ch
  '004EB1C6: push 004081B6h
  '004EB1CB: mov eax, fs:[00h]
  '004EB1D1: push eax
  '004EB1D2: mov fs:[00000000h], esp
  '004EB1D9: sub esp, 0000000Ch
  '004EB1DC: push ebx
  '004EB1DD: push esi
  '004EB1DE: push edi
  '004EB1DF: mov [ebp-0Ch], esp
  '004EB1E2: mov [ebp-08h], 00405540h
  '004EB1E9: xor edi, edi
  '004EB1EB: mov [ebp-04h], edi
  '004EB1EE: mov esi, [ebp+08h]
  '004EB1F1: push esi
  '004EB1F2: mov eax, [esi]
  '004EB1F4: call [eax+04h]
  '004EB1F7: mov ecx, [ebp+0Ch]
  '004EB1FA: mov [ebp-18h], edi
  '004EB1FD: mov [ecx], edi
  '004EB1FF: mov edx, [esi+38h]
  '004EB202: lea ecx, [ebp-18h]
  '004EB205: call [004012D8h]
  '004EB20B: push 004EB21Dh
  '004EB210: jmp 4EB21Ch
  '004EB212: lea ecx, [ebp-18h]
  '004EB215: call [004013B4h]
  '004EB21B: ret 
End Sub
Private Sub unknown_4EB250
  '004EB250: push ebp
  '004EB251: mov ebp, esp
  '004EB253: sub esp, 0000000Ch
  '004EB256: push 004081B6h
  '004EB25B: mov eax, fs:[00h]
  '004EB261: push eax
  '004EB262: mov fs:[00000000h], esp
  '004EB269: sub esp, 00000008h
  '004EB26C: push ebx
  '004EB26D: push esi
  '004EB26E: push edi
  '004EB26F: mov [ebp-0Ch], esp
  '004EB272: mov [ebp-08h], 00405550h
  '004EB279: mov [ebp-04h], 00000000h
  '004EB280: mov esi, [ebp+08h]
  '004EB283: push esi
  '004EB284: mov eax, [esi]
  '004EB286: call [eax+04h]
  '004EB289: mov ecx, [ebp+0Ch]
  '004EB28C: add esi, 00000034h
  '004EB28F: mov edx, [ecx]
  '004EB291: push edx
  '004EB292: push esi
  '004EB293: call [004010F8h]
  '004EB299: mov eax, [ebp+08h]
  '004EB29C: push eax
  '004EB29D: mov ecx, [eax]
  '004EB29F: call [ecx+08h]
  '004EB2A2: mov eax, [ebp-04h]
  '004EB2A5: mov ecx, [ebp-14h]
  '004EB2A8: pop edi
  '004EB2A9: pop esi
  '004EB2AA: mov fs:[00000000h], ecx
  '004EB2B1: pop ebx
  '004EB2B2: mov esp, ebp
  '004EB2B4: pop ebp
  '004EB2B5: retn 0008h
End Sub
Private Sub unknown_4EB2C0
  '004EB2C0: push ebp
  '004EB2C1: mov ebp, esp
  '004EB2C3: sub esp, 0000000Ch
  '004EB2C6: push 004081B6h
  '004EB2CB: mov eax, fs:[00h]
  '004EB2D1: push eax
  '004EB2D2: mov fs:[00000000h], esp
  '004EB2D9: sub esp, 0000000Ch
  '004EB2DC: push ebx
  '004EB2DD: push esi
  '004EB2DE: push edi
  '004EB2DF: mov [ebp-0Ch], esp
  '004EB2E2: mov [ebp-08h], 00405558h
  '004EB2E9: xor edi, edi
  '004EB2EB: mov [ebp-04h], edi
  '004EB2EE: mov esi, [ebp+08h]
  '004EB2F1: push esi
  '004EB2F2: mov eax, [esi]
  '004EB2F4: call [eax+04h]
  '004EB2F7: mov ecx, [esi+58h]
  '004EB2FA: mov [ebp-18h], edi
  '004EB2FD: mov [ebp-18h], ecx
  '004EB300: mov eax, [ebp+08h]
  '004EB303: push eax
  '004EB304: mov edx, [eax]
  '004EB306: call [edx+08h]
  '004EB309: mov eax, [ebp+0Ch]
  '004EB30C: mov ecx, [ebp-18h]
  '004EB30F: mov [eax], ecx
  '004EB311: mov eax, [ebp-04h]
  '004EB314: mov ecx, [ebp-14h]
  '004EB317: pop edi
  '004EB318: pop esi
  '004EB319: mov fs:[00000000h], ecx
  '004EB320: pop ebx
  '004EB321: mov esp, ebp
  '004EB323: pop ebp
  '004EB324: retn 0008h
End Sub
Private Sub unknown_4EB330
  '004EB330: push ebp
  '004EB331: mov ebp, esp
  '004EB333: sub esp, 0000000Ch
  '004EB336: push 004081B6h
  '004EB33B: mov eax, fs:[00h]
  '004EB341: push eax
  '004EB342: mov fs:[00000000h], esp
  '004EB349: sub esp, 00000010h
  '004EB34C: push ebx
  '004EB34D: push esi
  '004EB34E: push edi
  '004EB34F: mov [ebp-0Ch], esp
  '004EB352: mov [ebp-08h], 00405560h
  '004EB359: xor ebx, ebx
  '004EB35B: mov [ebp-04h], ebx
  '004EB35E: mov esi, [ebp+08h]
  '004EB361: push esi
  '004EB362: mov eax, [esi]
  '004EB364: call [eax+04h]
  '004EB367: mov eax, [ebp+0Ch]
  '004EB36A: mov ecx, [esi+58h]
  '004EB36D: cmp ecx, eax
  '004EB36F: mov [ebp-18h], ebx
  '004EB372: jz 4EB3E4h
  '004EB374: lea ecx, [ebp-18h]
  '004EB377: mov [esi+58h], eax
  '004EB37A: push ecx
  '004EB37B: push ebx
  '004EB37C: push eax
  '004EB37D: call 00420C94h
  '004EB382: call [0040109Ch]
  '004EB388: mov ecx, [ebp-18h]
  '004EB38B: mov edi, [004011A8h]
  '004EB391: and ecx, 000000FFh
  '004EB397: call edi
  '004EB399: mov edx, [esi+4Ch]
  '004EB39C: xor ecx, ecx
  '004EB39E: mov [edx], ax
  '004EB3A1: mov cl, [ebp-17h]
  '004EB3A4: call edi
  '004EB3A6: mov ecx, [esi+4Ch]
  '004EB3A9: mov [ecx+02h], ax
  '004EB3AD: xor ecx, ecx
  '004EB3AF: mov cl, [ebp-16h]
  '004EB3B2: call edi
  '004EB3B4: mov edx, [esi+4Ch]
  '004EB3B7: push ebx
  '004EB3B8: mov [edx+04h], ax
  '004EB3BC: mov eax, [esi+34h]
  '004EB3BF: push eax
  '004EB3C0: call [00401210h]
  '004EB3C6: test ax, ax
  '004EB3C9: jnz 4EB3E4h
  '004EB3CB: mov ecx, [esi]
  '004EB3CD: push esi
  '004EB3CE: call [ecx+38h]
  '004EB3D1: cmp eax, ebx
  '004EB3D3: jnl 4EB3E4h
  '004EB3D5: push 00000038h
  '004EB3D7: push 004209FCh
  '004EB3DC: push esi
  '004EB3DD: push eax
  '004EB3DE: call [004010A0h]
  '004EB3E4: mov eax, [ebp+08h]
  '004EB3E7: push eax
  '004EB3E8: mov edx, [eax]
  '004EB3EA: call [edx+08h]
  '004EB3ED: mov eax, [ebp-04h]
  '004EB3F0: mov ecx, [ebp-14h]
  '004EB3F3: pop edi
  '004EB3F4: pop esi
  '004EB3F5: mov fs:[00000000h], ecx
  '004EB3FC: pop ebx
  '004EB3FD: mov esp, ebp
  '004EB3FF: pop ebp
  '004EB400: retn 0008h
End Sub
Private Sub unknown_4EB410
  '004EB410: push ebp
  '004EB411: mov ebp, esp
  '004EB413: sub esp, 0000000Ch
  '004EB416: push 004081B6h
  '004EB41B: mov eax, fs:[00h]
  '004EB421: push eax
  '004EB422: mov fs:[00000000h], esp
  '004EB429: sub esp, 0000000Ch
  '004EB42C: push ebx
  '004EB42D: push esi
  '004EB42E: push edi
  '004EB42F: mov [ebp-0Ch], esp
  '004EB432: mov [ebp-08h], 00405568h
  '004EB439: xor edi, edi
  '004EB43B: mov [ebp-04h], edi
  '004EB43E: mov esi, [ebp+08h]
  '004EB441: push esi
  '004EB442: mov eax, [esi]
  '004EB444: call [eax+04h]
  '004EB447: mov ecx, [esi+78h]
  '004EB44A: mov [ebp-18h], edi
  '004EB44D: mov [ebp-18h], ecx
  '004EB450: mov eax, [ebp+08h]
  '004EB453: push eax
  '004EB454: mov edx, [eax]
  '004EB456: call [edx+08h]
  '004EB459: mov eax, [ebp+0Ch]
  '004EB45C: mov ecx, [ebp-18h]
  '004EB45F: mov [eax], ecx
  '004EB461: mov eax, [ebp-04h]
  '004EB464: mov ecx, [ebp-14h]
  '004EB467: pop edi
  '004EB468: pop esi
  '004EB469: mov fs:[00000000h], ecx
  '004EB470: pop ebx
  '004EB471: mov esp, ebp
  '004EB473: pop ebp
  '004EB474: retn 0008h
End Sub
Private Sub unknown_4EB480
  '004EB480: push ebp
  '004EB481: mov ebp, esp
  '004EB483: sub esp, 0000000Ch
  '004EB486: push 004081B6h
  '004EB48B: mov eax, fs:[00h]
  '004EB491: push eax
  '004EB492: mov fs:[00000000h], esp
  '004EB499: sub esp, 00000010h
  '004EB49C: push ebx
  '004EB49D: push esi
  '004EB49E: push edi
  '004EB49F: mov [ebp-0Ch], esp
  '004EB4A2: mov [ebp-08h], 00405570h
  '004EB4A9: xor ebx, ebx
  '004EB4AB: mov [ebp-04h], ebx
  '004EB4AE: mov esi, [ebp+08h]
  '004EB4B1: push esi
  '004EB4B2: mov eax, [esi]
  '004EB4B4: call [eax+04h]
  '004EB4B7: mov eax, [ebp+0Ch]
  '004EB4BA: mov ecx, [esi+78h]
  '004EB4BD: cmp ecx, eax
  '004EB4BF: mov [ebp-18h], ebx
  '004EB4C2: jz 4EB534h
  '004EB4C4: lea ecx, [ebp-18h]
  '004EB4C7: mov [esi+78h], eax
  '004EB4CA: push ecx
  '004EB4CB: push ebx
  '004EB4CC: push eax
  '004EB4CD: call 00420C94h
  '004EB4D2: call [0040109Ch]
  '004EB4D8: mov ecx, [ebp-18h]
  '004EB4DB: mov edi, [004011A8h]
  '004EB4E1: and ecx, 000000FFh
  '004EB4E7: call edi
  '004EB4E9: mov edx, [esi+6Ch]
  '004EB4EC: xor ecx, ecx
  '004EB4EE: mov [edx], ax
  '004EB4F1: mov cl, [ebp-17h]
  '004EB4F4: call edi
  '004EB4F6: mov ecx, [esi+6Ch]
  '004EB4F9: mov [ecx+02h], ax
  '004EB4FD: xor ecx, ecx
  '004EB4FF: mov cl, [ebp-16h]
  '004EB502: call edi
  '004EB504: mov edx, [esi+6Ch]
  '004EB507: push ebx
  '004EB508: mov [edx+04h], ax
  '004EB50C: mov eax, [esi+34h]
  '004EB50F: push eax
  '004EB510: call [00401210h]
  '004EB516: test ax, ax
  '004EB519: jnz 4EB534h
  '004EB51B: mov ecx, [esi]
  '004EB51D: push esi
  '004EB51E: call [ecx+38h]
  '004EB521: cmp eax, ebx
  '004EB523: jnl 4EB534h
  '004EB525: push 00000038h
  '004EB527: push 004209FCh
  '004EB52C: push esi
  '004EB52D: push eax
  '004EB52E: call [004010A0h]
  '004EB534: mov eax, [ebp+08h]
  '004EB537: push eax
  '004EB538: mov edx, [eax]
  '004EB53A: call [edx+08h]
  '004EB53D: mov eax, [ebp-04h]
  '004EB540: mov ecx, [ebp-14h]
  '004EB543: pop edi
  '004EB544: pop esi
  '004EB545: mov fs:[00000000h], ecx
  '004EB54C: pop ebx
  '004EB54D: mov esp, ebp
  '004EB54F: pop ebp
  '004EB550: retn 0008h
End Sub
Private Sub unknown_4EB560
  '004EB560: push ebp
  '004EB561: mov ebp, esp
  '004EB563: sub esp, 00000014h
  '004EB566: push 004081B6h
  '004EB56B: mov eax, fs:[00h]
  '004EB571: push eax
  '004EB572: mov fs:[00000000h], esp
  '004EB579: sub esp, 00000178h
  '004EB57F: push ebx
  '004EB580: push esi
  '004EB581: push edi
  '004EB582: mov [ebp-14h], esp
  '004EB585: mov [ebp-10h], 00405578h
  '004EB58C: xor ebx, ebx
  '004EB58E: mov [ebp-0Ch], ebx
  '004EB591: mov [ebp-08h], ebx
  '004EB594: mov esi, [ebp+08h]
  '004EB597: mov eax, [esi]
  '004EB599: push esi
  '004EB59A: call [eax+04h]
  '004EB59D: mov [ebp-4Ch], ebx
  '004EB5A0: xor ecx, ecx
  '004EB5A2: mov [ebp-00000084h], ecx
  '004EB5A8: mov [ebp-80h], ecx
  '004EB5AB: mov [ebp-7Ch], ecx
  '004EB5AE: mov [ebp-78h], ecx
  '004EB5B1: xor edx, edx
  '004EB5B3: mov [ebp-00000094h], edx
  '004EB5B9: mov [ebp-00000090h], edx
  '004EB5BF: mov [ebp-0000008Ch], edx
  '004EB5C5: mov [ebp-00000088h], edx
  '004EB5CB: mov ecx, 00000010h
  '004EB5D0: xor eax, eax
  '004EB5D2: lea edi, [ebp-000000D4h]
  '004EB5D8: rep stosd 
  '004EB5DA: mov [ebp-000000DCh], ebx
  '004EB5E0: mov [ebp-000000E0h], ebx
  '004EB5E6: mov [ebp-000000E4h], ebx
  '004EB5EC: mov [ebp-000000E8h], ebx
  '004EB5F2: mov [ebp-000000ECh], ebx
  '004EB5F8: mov [ebp-000000F0h], ebx
  '004EB5FE: push 00000002h
  '004EB600: push 004271A8h
  '004EB605: lea eax, [ebp-40h]
  '004EB608: push eax
  '004EB609: mov edi, [00401190h]
  '004EB60F: call edi
  '004EB611: push 00000005h
  '004EB613: push 004271C4h
  '004EB618: lea ecx, [ebp-70h]
  '004EB61B: push ecx
  '004EB61C: call edi
  '004EB61E: push 00000001h
  '004EB620: call [004010E8h]
  '004EB626: mov eax, [esi+34h]
  '004EB629: mov edx, [eax]
  '004EB62B: lea ecx, [ebp-000000ECh]
  '004EB631: push ecx
  '004EB632: push eax
  '004EB633: call [edx+000000E0h]
  '004EB639: fclex 
  '004EB63B: cmp eax, ebx
  '004EB63D: jnl 4EB658h
  '004EB63F: push 000000E0h
  '004EB644: push 0041C058h
  '004EB649: mov edx, [esi+34h]
  '004EB64C: push edx
  '004EB64D: push eax
  '004EB64E: mov ebx, [004010A0h]
  '004EB654: call ebx
  '004EB656: jmp 4EB65Eh
  '004EB658: mov ebx, [004010A0h]
  '004EB65E: mov eax, [ebp-000000ECh]
  '004EB664: mov [ebp-4Ch], eax
  '004EB667: mov eax, [esi+34h]
  '004EB66A: mov ecx, [eax]
  '004EB66C: lea edx, [ebp-000000ECh]
  '004EB672: push edx
  '004EB673: push eax
  '004EB674: call [ecx+00000088h]
  '004EB67A: fclex 
  '004EB67C: test eax, eax
  '004EB67E: jnl 4EB691h
  '004EB680: push 00000088h
  '004EB685: push 0041C058h
  '004EB68A: mov ecx, [esi+34h]
  '004EB68D: push ecx
  '004EB68E: push eax
  '004EB68F: call ebx
  '004EB691: mov eax, [54238Ch]
  '004EB696: test eax, eax
  '004EB698: jnz 4EB6AAh
  '004EB69A: push 0054238Ch
  '004EB69F: push 0041D9E0h
  '004EB6A4: call [004012B8h]
  '004EB6AA: mov edi, [0054238Ch]
  '004EB6B0: mov edx, [edi]
  '004EB6B2: lea eax, [ebp-000000E4h]
  '004EB6B8: push eax
  '004EB6B9: push edi
  '004EB6BA: call [edx+18h]
  '004EB6BD: fclex 
  '004EB6BF: test eax, eax
  '004EB6C1: jnl 4EB6CEh
  '004EB6C3: push 00000018h
  '004EB6C5: push 0041D9D0h
  '004EB6CA: push edi
  '004EB6CB: push eax
  '004EB6CC: call ebx
  '004EB6CE: mov eax, [ebp-000000E4h]
  '004EB6D4: mov edi, eax
  '004EB6D6: mov ecx, [eax]
  '004EB6D8: lea edx, [ebp-000000F0h]
  '004EB6DE: push edx
  '004EB6DF: push eax
  '004EB6E0: call [ecx+00000088h]
  '004EB6E6: fclex 
  '004EB6E8: test eax, eax
  '004EB6EA: jnl 4EB6FAh
  '004EB6EC: push 00000088h
  '004EB6F1: push 00420F20h
  '004EB6F6: push edi
  '004EB6F7: push eax
  '004EB6F8: call ebx
  '004EB6FA: fld real4 ptr [ebp-000000F0h]
  '004EB700: mov edi, [0040135Ch]
  '004EB706: call edi
  '004EB708: mov edx, eax
  '004EB70A: fld real4 ptr [ebp-000000ECh]
  '004EB710: mov [ebp-00000124h], edx
  '004EB716: call edi
  '004EB718: cdq 
  '004EB719: mov ecx, [ebp-00000124h]
  '004EB71F: idiv ecx
  '004EB721: mov edi, eax
  '004EB723: mov [ebp-48h], edi
  '004EB726: lea ecx, [ebp-000000E4h]
  '004EB72C: call [004013B8h]
  '004EB732: mov eax, [esi+34h]
  '004EB735: mov edx, [eax]
  '004EB737: lea ecx, [ebp-000000ECh]
  '004EB73D: push ecx
  '004EB73E: push eax
  '004EB73F: call [edx+00000080h]
  '004EB745: fclex 
  '004EB747: test eax, eax
  '004EB749: jnl 4EB75Ch
  '004EB74B: push 00000080h
  '004EB750: push 0041C058h
  '004EB755: mov edx, [esi+34h]
  '004EB758: push edx
  '004EB759: push eax
  '004EB75A: call ebx
  '004EB75C: mov eax, [54238Ch]
  '004EB761: test eax, eax
  '004EB763: jnz 4EB775h
  '004EB765: push 0054238Ch
  '004EB76A: push 0041D9E0h
  '004EB76F: call [004012B8h]
  '004EB775: mov ebx, [0054238Ch]
  '004EB77B: mov eax, [ebx]
  '004EB77D: lea ecx, [ebp-000000E4h]
  '004EB783: push ecx
  '004EB784: push ebx
  '004EB785: call [eax+18h]
  '004EB788: fclex 
  '004EB78A: test eax, eax
  '004EB78C: jnl 4EB79Dh
  '004EB78E: push 00000018h
  '004EB790: push 0041D9D0h
  '004EB795: push ebx
  '004EB796: push eax
  '004EB797: call [004010A0h]
  '004EB79D: mov eax, [ebp-000000E4h]
  '004EB7A3: mov ebx, eax
  '004EB7A5: mov edx, [eax]
  '004EB7A7: lea ecx, [ebp-000000F0h]
  '004EB7AD: push ecx
  '004EB7AE: push eax
  '004EB7AF: call [edx+00000088h]
  '004EB7B5: fclex 
  '004EB7B7: test eax, eax
  '004EB7B9: jnl 4EB7CDh
  '004EB7BB: push 00000088h
  '004EB7C0: push 00420F20h
  '004EB7C5: push ebx
  '004EB7C6: push eax
  '004EB7C7: call [004010A0h]
  '004EB7CD: fld real4 ptr [ebp-000000F0h]
  '004EB7D3: mov ebx, [0040135Ch]
  '004EB7D9: call ebx
  '004EB7DB: mov edx, eax
  '004EB7DD: fld real4 ptr [ebp-000000ECh]
  '004EB7E3: mov [ebp-00000128h], edx
  '004EB7E9: call ebx
  '004EB7EB: cdq 
  '004EB7EC: mov ecx, [ebp-00000128h]
  '004EB7F2: idiv ecx
  '004EB7F4: mov [ebp-7Ch], eax
  '004EB7F7: lea ecx, [ebp-000000E4h]
  '004EB7FD: call [004013B8h]
  '004EB803: mov eax, 80808081h
  '004EB808: imul edi
  '004EB80A: add edx, edi
  '004EB80C: sar edx, 07h
  '004EB80F: mov eax, edx
  '004EB811: shr eax, 1Fh
  '004EB814: add edx, eax
  '004EB816: mov [ebp-58h], edx
  '004EB819: jnz 4EB822h
  '004EB81B: mov [ebp-58h], 00000001h
  '004EB822: mov [ebp-78h], edi
  '004EB825: lea ecx, [ebp-00000084h]
  '004EB82B: push ecx
  '004EB82C: lea edx, [ebp-00000094h]
  '004EB832: push edx
  '004EB833: push 00000010h
  '004EB835: call [00401084h]
  '004EB83B: mov eax, [esi+4Ch]
  '004EB83E: mov cx, [eax]
  '004EB841: mov edx, [ebp-34h]
  '004EB844: mov [edx], cx
  '004EB847: mov eax, [esi+4Ch]
  '004EB84A: mov cx, [eax+02h]
  '004EB84E: mov edx, [ebp-34h]
  '004EB851: mov [edx+02h], cx
  '004EB855: mov eax, [esi+4Ch]
  '004EB858: mov cx, [eax+04h]
  '004EB85C: mov edx, [ebp-34h]
  '004EB85F: mov [edx+04h], cx
  '004EB863: mov eax, [esi+6Ch]
  '004EB866: mov ecx, [esi+4Ch]
  '004EB869: mov dx, [eax]
  '004EB86C: sub dx, [ecx]
  '004EB86F: jo 004EBDBCh
  '004EB875: movsx eax, dx
  '004EB878: mov [ebp-0000012Ch], eax
  '004EB87E: fild dword ptr [ebp-0000012Ch]
  '004EB884: mov ecx, [ebp-64h]
  '004EB887: fstp real8 ptr [ecx]
  '004EB889: mov edx, [esi+6Ch]
  '004EB88C: mov eax, [esi+4Ch]
  '004EB88F: mov cx, [edx+02h]
  '004EB893: sub cx, [eax+02h]
  '004EB897: jo 004EBDBCh
  '004EB89D: movsx edx, cx
  '004EB8A0: mov [ebp-00000130h], edx
  '004EB8A6: fild dword ptr [ebp-00000130h]
  '004EB8AC: mov eax, [ebp-64h]
  '004EB8AF: fstp real8 ptr [eax+08h]
  '004EB8B2: mov ecx, [esi+6Ch]
  '004EB8B5: mov edx, [esi+4Ch]
  '004EB8B8: mov ax, [ecx+04h]
  '004EB8BC: sub ax, [edx+04h]
  '004EB8C0: jo 004EBDBCh
  '004EB8C6: movsx ecx, ax
  '004EB8C9: mov [ebp-00000134h], ecx
  '004EB8CF: fild dword ptr [ebp-00000134h]
  '004EB8D5: mov edx, [ebp-64h]
  '004EB8D8: fstp real8 ptr [edx+10h]
  '004EB8DB: mov eax, [ebp-58h]
  '004EB8DE: neg eax
  '004EB8E0: mov [ebp-00000108h], eax
  '004EB8E6: mov [ebp-50h], edi
  '004EB8E9: mov ebx, [0040109Ch]
  '004EB8EF: sar eax, 1Fh
  '004EB8F2: mov edx, eax
  '004EB8F4: xor ecx, ecx
  '004EB8F6: xor edx, ecx
  '004EB8F8: xor eax, [ebp-50h]
  '004EB8FB: cmp eax, edx
  '004EB8FD: jnle 004EBB3Bh
  '004EB903: mov eax, [ebp-78h]
  '004EB906: sub eax, [ebp-58h]
  '004EB909: jo 004EBDBCh
  '004EB90F: mov [ebp-80h], eax
  '004EB912: mov eax, [ebp-34h]
  '004EB915: movsx ecx, word ptr [eax+02h]
  '004EB919: imul ecx, 00000100h
  '004EB91F: jo 004EBDBCh
  '004EB925: movsx edx, word ptr [eax+04h]
  '004EB929: imul edx, 00010000h
  '004EB92F: jo 004EBDBCh
  '004EB935: add ecx, edx
  '004EB937: jo 004EBDBCh
  '004EB93D: movsx eax, word ptr [eax]
  '004EB940: add ecx, eax
  '004EB942: jo 004EBDBCh
  '004EB948: push ecx
  '004EB949: call 00420A8Ch
  '004EB94E: mov [ebp-000000ECh], eax
  '004EB954: call ebx
  '004EB956: mov eax, [ebp-000000ECh]
  '004EB95C: mov [ebp-54h], eax
  '004EB95F: push eax
  '004EB960: lea ecx, [ebp-00000084h]
  '004EB966: push ecx
  '004EB967: mov edx, [ebp-4Ch]
  '004EB96A: push edx
  '004EB96B: call 00420A34h
  '004EB970: call ebx
  '004EB972: mov eax, [ebp-54h]
  '004EB975: push eax
  '004EB976: call 00420C34h
  '004EB97B: call ebx
  '004EB97D: mov ecx, [ebp-80h]
  '004EB980: mov [ebp-78h], ecx
  '004EB983: mov edx, edi
  '004EB985: sub edx, [ebp-50h]
  '004EB988: jo 004EBDBCh
  '004EB98E: mov [ebp-00000138h], edx
  '004EB994: fild dword ptr [ebp-00000138h]
  '004EB99A: fstp real8 ptr [ebp-00000140h]
  '004EB9A0: fld real8 ptr [ebp-00000140h]
  '004EB9A6: mov eax, [ebp-64h]
  '004EB9A9: fmul real8 ptr [eax]
  '004EB9AB: fild dword ptr [ebp-48h]
  '004EB9AE: fstp real8 ptr [ebp-00000148h]
  '004EB9B4: cmp [00541000h], 00000000h
  '004EB9BB: jnz 4EB9C5h
  '004EB9BD: fdiv real8 ptr [ebp-00000148h]
  '004EB9C3: jmp 4EB9D6h
  '004EB9C5: push [ebp-00000144h]
  '004EB9CB: push [ebp-00000148h]
  '004EB9D1: call 004081D4h
  '004EB9D6: mov ecx, [esi+4Ch]
  '004EB9D9: movsx edx, word ptr [ecx]
  '004EB9DC: mov [ebp-0000014Ch], edx
  '004EB9E2: fild dword ptr [ebp-0000014Ch]
  '004EB9E8: fstp real8 ptr [ebp-00000154h]
  '004EB9EE: fadd real8 ptr [ebp-00000154h]
  '004EB9F4: fstsw ax
  '004EB9F6: test al, 0Dh
  '004EB9F8: jnz 004EBDB7h
  '004EB9FE: call [00401348h]
  '004EBA04: mov ecx, [ebp-34h]
  '004EBA07: mov [ecx], ax
  '004EBA0A: mov edx, edi
  '004EBA0C: sub edx, [ebp-50h]
  '004EBA0F: jo 004EBDBCh
  '004EBA15: mov [ebp-00000158h], edx
  '004EBA1B: fild dword ptr [ebp-00000158h]
  '004EBA21: fstp real8 ptr [ebp-00000160h]
  '004EBA27: fld real8 ptr [ebp-00000160h]
  '004EBA2D: mov eax, [ebp-64h]
  '004EBA30: fmul real8 ptr [eax+08h]
  '004EBA33: fild dword ptr [ebp-48h]
  '004EBA36: fstp real8 ptr [ebp-00000168h]
  '004EBA3C: cmp [00541000h], 00000000h
  '004EBA43: jnz 4EBA4Dh
  '004EBA45: fdiv real8 ptr [ebp-00000168h]
  '004EBA4B: jmp 4EBA5Eh
  '004EBA4D: push [ebp-00000164h]
  '004EBA53: push [ebp-00000168h]
  '004EBA59: call 004081D4h
  '004EBA5E: mov ecx, [esi+4Ch]
  '004EBA61: movsx edx, word ptr [ecx+02h]
  '004EBA65: mov [ebp-0000016Ch], edx
  '004EBA6B: fild dword ptr [ebp-0000016Ch]
  '004EBA71: fstp real8 ptr [ebp-00000174h]
  '004EBA77: fadd real8 ptr [ebp-00000174h]
  '004EBA7D: fstsw ax
  '004EBA7F: test al, 0Dh
  '004EBA81: jnz 004EBDB7h
  '004EBA87: call [00401348h]
  '004EBA8D: mov ecx, [ebp-34h]
  '004EBA90: mov [ecx+02h], ax
  '004EBA94: mov edx, edi
  '004EBA96: sub edx, [ebp-50h]
  '004EBA99: jo 004EBDBCh
  '004EBA9F: mov [ebp-00000178h], edx
  '004EBAA5: fild dword ptr [ebp-00000178h]
  '004EBAAB: fstp real8 ptr [ebp-00000180h]
  '004EBAB1: fld real8 ptr [ebp-00000180h]
  '004EBAB7: mov eax, [ebp-64h]
  '004EBABA: fmul real8 ptr [eax+10h]
  '004EBABD: fild dword ptr [ebp-48h]
  '004EBAC0: fstp real8 ptr [ebp-00000188h]
  '004EBAC6: cmp [00541000h], 00000000h
  '004EBACD: jnz 4EBAD7h
  '004EBACF: fdiv real8 ptr [ebp-00000188h]
  '004EBAD5: jmp 4EBAE8h
  '004EBAD7: push [ebp-00000184h]
  '004EBADD: push [ebp-00000188h]
  '004EBAE3: call 004081D4h
  '004EBAE8: mov ecx, [esi+4Ch]
  '004EBAEB: movsx edx, word ptr [ecx+04h]
  '004EBAEF: mov [ebp-0000018Ch], edx
  '004EBAF5: fild dword ptr [ebp-0000018Ch]
  '004EBAFB: fstp real8 ptr [ebp-00000194h]
  '004EBB01: fadd real8 ptr [ebp-00000194h]
  '004EBB07: fstsw ax
  '004EBB09: test al, 0Dh
  '004EBB0B: jnz 004EBDB7h
  '004EBB11: call [00401348h]
  '004EBB17: mov ecx, [ebp-34h]
  '004EBB1A: mov [ecx+04h], ax
  '004EBB1E: mov edx, [ebp-00000108h]
  '004EBB24: add edx, [ebp-50h]
  '004EBB27: jo 004EBDBCh
  '004EBB2D: mov [ebp-50h], edx
  '004EBB30: mov eax, [ebp-00000108h]
  '004EBB36: jmp 004EB8EFh
  '004EBB3B: mov eax, [esi+34h]
  '004EBB3E: mov ecx, [eax]
  '004EBB40: lea edx, [ebp-000000E4h]
  '004EBB46: push edx
  '004EBB47: push eax
  '004EBB48: call [ecx+00000210h]
  '004EBB4E: fclex 
  '004EBB50: test eax, eax
  '004EBB52: jnl 4EBB69h
  '004EBB54: push 00000210h
  '004EBB59: push 0041C058h
  '004EBB5E: mov ecx, [esi+34h]
  '004EBB61: push ecx
  '004EBB62: push eax
  '004EBB63: call [004010A0h]
  '004EBB69: mov eax, [ebp-000000E4h]
  '004EBB6F: mov [ebp-000000E4h], 00000000h
  '004EBB79: push eax
  '004EBB7A: lea edx, [ebp-000000E8h]
  '004EBB80: push edx
  '004EBB81: call [004010E4h]
  '004EBB87: mov eax, [esi]
  '004EBB89: lea ecx, [ebp-000000D4h]
  '004EBB8F: push ecx
  '004EBB90: lea edx, [ebp-4Ch]
  '004EBB93: push edx
  '004EBB94: lea ecx, [ebp-000000E8h]
  '004EBB9A: push ecx
  '004EBB9B: push esi
  '004EBB9C: call [eax+3Ch]
  '004EBB9F: lea ecx, [ebp-000000E8h]
  '004EBBA5: call [004013B8h]
  '004EBBAB: mov [ebp-000000CCh], 00000384h
  '004EBBB5: lea edx, [ebp-000000D4h]
  '004EBBBB: push edx
  '004EBBBC: call 00420BA4h
  '004EBBC1: mov [ebp-000000ECh], eax
  '004EBBC7: call ebx
  '004EBBC9: mov eax, [ebp-000000ECh]
  '004EBBCF: mov [ebp-000000D8h], eax
  '004EBBD5: test eax, eax
  '004EBBD7: jz 004EBCA5h
  '004EBBDD: push eax
  '004EBBDE: mov eax, [ebp-4Ch]
  '004EBBE1: push eax
  '004EBBE2: call 00420BECh
  '004EBBE7: mov [ebp-000000ECh], eax
  '004EBBED: call ebx
  '004EBBEF: mov ecx, [ebp-000000ECh]
  '004EBBF5: mov [ebp-28h], ecx
  '004EBBF8: mov edx, [esi+38h]
  '004EBBFB: push edx
  '004EBBFC: lea eax, [ebp-000000DCh]
  '004EBC02: push eax
  '004EBC03: call [00401330h]
  '004EBC09: push eax
  '004EBC0A: call 0041D338h
  '004EBC0F: mov [ebp-000000ECh], eax
  '004EBC15: call ebx
  '004EBC17: mov ecx, [ebp-000000DCh]
  '004EBC1D: push ecx
  '004EBC1E: lea eax, [esi+38h]
  '004EBC21: push eax
  '004EBC22: call [00401238h]
  '004EBC28: mov edx, [ebp-000000ECh]
  '004EBC2E: push edx
  '004EBC2F: mov eax, [esi+38h]
  '004EBC32: push eax
  '004EBC33: lea ecx, [ebp-000000E0h]
  '004EBC39: push ecx
  '004EBC3A: call [00401330h]
  '004EBC40: push eax
  '004EBC41: sub edi, 00000010h
  '004EBC44: jo 004EBDBCh
  '004EBC4A: push edi
  '004EBC4B: push 00000000h
  '004EBC4D: mov edx, [ebp-4Ch]
  '004EBC50: push edx
  '004EBC51: call 00420AD0h
  '004EBC56: mov [ebp-000000F0h], eax
  '004EBC5C: call ebx
  '004EBC5E: mov eax, [ebp-000000E0h]
  '004EBC64: push eax
  '004EBC65: lea eax, [esi+38h]
  '004EBC68: push eax
  '004EBC69: call [00401238h]
  '004EBC6F: lea ecx, [ebp-000000E0h]
  '004EBC75: push ecx
  '004EBC76: lea edx, [ebp-000000DCh]
  '004EBC7C: push edx
  '004EBC7D: push 00000002h
  '004EBC7F: call [004012E8h]
  '004EBC85: add esp, 0000000Ch
  '004EBC88: mov eax, [ebp-28h]
  '004EBC8B: push eax
  '004EBC8C: mov ecx, [ebp-4Ch]
  '004EBC8F: push ecx
  '004EBC90: call 00420BECh
  '004EBC95: call ebx
  '004EBC97: mov edx, [ebp-000000D8h]
  '004EBC9D: push edx
  '004EBC9E: call 00420C34h
  '004EBCA3: call ebx
  '004EBCA5: mov eax, [esi+34h]
  '004EBCA8: mov ecx, [eax]
  '004EBCAA: push eax
  '004EBCAB: call [ecx+00000264h]
  '004EBCB1: fclex 
  '004EBCB3: test eax, eax
  '004EBCB5: jnl 4EBD2Bh
  '004EBCB7: push 00000264h
  '004EBCBC: push 0041C058h
  '004EBCC1: mov edx, [esi+34h]
  '004EBCC4: push edx
  '004EBCC5: push eax
  '004EBCC6: call [004010A0h]
  '004EBCCC: jmp 4EBD2Bh
  '004EBCCE: call [00401300h]
  '004EBCD4: push eax
  '004EBCD5: lea eax, [ebp-000000E4h]
  '004EBCDB: push eax
  '004EBCDC: call [004010E4h]
  '004EBCE2: mov esi, eax
  '004EBCE4: mov ecx, [esi]
  '004EBCE6: lea edx, [ebp-000000DCh]
  '004EBCEC: push edx
  '004EBCED: push esi
  '004EBCEE: call [ecx+2Ch]
  '004EBCF1: fclex 
  '004EBCF3: test eax, eax
  '004EBCF5: jnl 4EBD06h
  '004EBCF7: push 0000002Ch
  '004EBCF9: push 0041E948h
  '004EBCFE: push esi
  '004EBCFF: push eax
  '004EBD00: call [004010A0h]
  '004EBD06: lea eax, [ebp-000000E0h]
  '004EBD0C: push eax
  '004EBD0D: lea ecx, [ebp-000000DCh]
  '004EBD13: push ecx
  '004EBD14: push 00000002h
  '004EBD16: call [004012E8h]
  '004EBD1C: add esp, 0000000Ch
  '004EBD1F: lea ecx, [ebp-000000E4h]
  '004EBD25: call [004013B8h]
  '004EBD2B: call [004010D0h]
  '004EBD31: wait 
  '004EBD32: push 004EBD98h
  '004EBD37: jmp 4EBD69h
  '004EBD39: lea edx, [ebp-000000E0h]
  '004EBD3F: push edx
  '004EBD40: lea eax, [ebp-000000DCh]
  '004EBD46: push eax
  '004EBD47: push 00000002h
  '004EBD49: call [004012E8h]
  '004EBD4F: lea ecx, [ebp-000000E8h]
  '004EBD55: push ecx
  '004EBD56: lea edx, [ebp-000000E4h]
  '004EBD5C: push edx
  '004EBD5D: push 00000002h
  '004EBD5F: call [00401064h]
  '004EBD65: add esp, 00000018h
  '004EBD68: ret 
End Sub
Private Sub unknown_4EBDD0
  '004EBDD0: push ebp
  '004EBDD1: mov ebp, esp
  '004EBDD3: sub esp, 00000008h
  '004EBDD6: push 004081B6h
  '004EBDDB: mov eax, fs:[00h]
  '004EBDE1: push eax
  '004EBDE2: mov fs:[00000000h], esp
  '004EBDE9: sub esp, 00000048h
  '004EBDEC: push ebx
  '004EBDED: push esi
  '004EBDEE: push edi
  '004EBDEF: mov [ebp-08h], esp
  '004EBDF2: mov [ebp-04h], 004055A0h
  '004EBDF9: xor eax, eax
  '004EBDFB: mov ebx, [ebp+14h]
  '004EBDFE: push eax
  '004EBDFF: mov [ebp-18h], eax
  '004EBE02: mov [ebp-1Ch], eax
  '004EBE05: mov [ebp-2Ch], eax
  '004EBE08: push eax
  '004EBE09: mov eax, [ebp+0Ch]
  '004EBE0C: lea edx, [ebp-2Ch]
  '004EBE0F: mov ecx, [eax]
  '004EBE11: push ecx
  '004EBE12: push edx
  '004EBE13: call [004011E4h]
  '004EBE19: add esp, 00000010h
  '004EBE1C: push eax
  '004EBE1D: call [0040103Ch]
  '004EBE23: mov edx, eax
  '004EBE25: lea ecx, [ebp-18h]
  '004EBE28: call [00401378h]
  '004EBE2E: mov edi, [00401030h]
  '004EBE34: lea ecx, [ebp-2Ch]
  '004EBE37: call edi
  '004EBE39: mov eax, [ebp-18h]
  '004EBE3C: push eax
  '004EBE3D: call [00401044h]
  '004EBE43: mov ecx, eax
  '004EBE45: call [004011A8h]
  '004EBE4B: mov [ebp-54h], eax
  '004EBE4E: mov esi, 00000001h
  '004EBE53: cmp si, [ebp-54h]
  '004EBE57: jnle 004EBEDFh
  '004EBE5D: mov cx, si
  '004EBE60: mov [ebp-24h], 00000001h
  '004EBE67: sub cx, 0001h
  '004EBE6B: mov [ebp-2Ch], 00000002h
  '004EBE72: jo 004EC052h
  '004EBE78: movsx eax, cx
  '004EBE7B: cmp eax, 00000021h
  '004EBE7E: mov [ebp-48h], eax
  '004EBE81: jb 4EBE89h
  '004EBE83: call [00401178h]
  '004EBE89: mov ecx, [ebp-18h]
  '004EBE8C: lea edx, [ebp-2Ch]
  '004EBE8F: movsx eax, si
  '004EBE92: push edx
  '004EBE93: push eax
  '004EBE94: push ecx
  '004EBE95: call [00401148h]
  '004EBE9B: mov edx, eax
  '004EBE9D: lea ecx, [ebp-1Ch]
  '004EBEA0: call [00401378h]
  '004EBEA6: push eax
  '004EBEA7: call [00401068h]
  '004EBEAD: mov ecx, eax
  '004EBEAF: call [00401208h]
  '004EBEB5: mov edx, [ebp-48h]
  '004EBEB8: lea ecx, [ebp-1Ch]
  '004EBEBB: mov [edx+ebx+1Ch], al
  '004EBEBF: call [004013B4h]
  '004EBEC5: lea ecx, [ebp-2Ch]
  '004EBEC8: call edi
  '004EBECA: mov eax, 00000001h
  '004EBECF: add ax, si
  '004EBED2: jo 004EC052h
  '004EBED8: mov esi, eax
  '004EBEDA: jmp 004EBE53h
  '004EBEDF: mov esi, [ebp+0Ch]
  '004EBEE2: push 00000000h
  '004EBEE4: push 00000002h
  '004EBEE6: lea ecx, [ebp-2Ch]
  '004EBEE9: mov eax, [esi]
  '004EBEEB: push eax
  '004EBEEC: push ecx
  '004EBEED: call [004011E4h]
  '004EBEF3: mov edx, [ebp+10h]
  '004EBEF6: add esp, 00000010h
  '004EBEF9: mov eax, [edx]
  '004EBEFB: push 0000005Ah
  '004EBEFD: push eax
  '004EBEFE: call 00420B18h
  '004EBF03: mov [ebp-40h], eax
  '004EBF06: call [0040109Ch]
  '004EBF0C: mov ecx, [ebp-40h]
  '004EBF0F: push 00000048h
  '004EBF11: lea edx, [ebp-2Ch]
  '004EBF14: push ecx
  '004EBF15: push edx
  '004EBF16: call [00401160h]
  '004EBF1C: push edx
  '004EBF1D: push eax
  '004EBF1E: call [0040138Ch]
  '004EBF24: push eax
  '004EBF25: call 00420B58h
  '004EBF2A: mov [ebp-44h], eax
  '004EBF2D: call [0040109Ch]
  '004EBF33: mov eax, [ebp-44h]
  '004EBF36: lea ecx, [ebp-2Ch]
  '004EBF39: neg eax
  '004EBF3B: mov [ebx], eax
  '004EBF3D: call edi
  '004EBF3F: mov eax, [esi]
  '004EBF41: push 00000000h
  '004EBF43: push 00000004h
  '004EBF45: lea ecx, [ebp-2Ch]
  '004EBF48: push eax
  '004EBF49: push ecx
  '004EBF4A: call [004011E4h]
  '004EBF50: add esp, 00000010h
  '004EBF53: push eax
  '004EBF54: call [00401114h]
  '004EBF5A: lea ecx, [ebp-2Ch]
  '004EBF5D: mov [ebx+14h], al
  '004EBF60: call edi
  '004EBF62: mov edx, [esi]
  '004EBF64: push 00000000h
  '004EBF66: push 00000003h
  '004EBF68: lea eax, [ebp-2Ch]
  '004EBF6B: push edx
  '004EBF6C: push eax
  '004EBF6D: call [004011E4h]
  '004EBF73: add esp, 00000010h
  '004EBF76: push eax
  '004EBF77: call [00401114h]
  '004EBF7D: lea ecx, [ebp-2Ch]
  '004EBF80: mov [ebp-48h], eax
  '004EBF83: call edi
  '004EBF85: cmp word ptr [ebp-48h], 0000h
  '004EBF8A: jz 4EBF95h
  '004EBF8C: mov [ebx+10h], 000002BCh
  '004EBF93: jmp 4EBF9Ch
  '004EBF95: mov [ebx+10h], 00000190h
  '004EBF9C: mov ecx, [esi]
  '004EBF9E: push 00000000h
  '004EBFA0: push 00000005h
  '004EBFA2: lea edx, [ebp-2Ch]
  '004EBFA5: push ecx
  '004EBFA6: push edx
  '004EBFA7: call [004011E4h]
  '004EBFAD: add esp, 00000010h
  '004EBFB0: push eax
  '004EBFB1: call [00401114h]
  '004EBFB7: lea ecx, [ebp-2Ch]
  '004EBFBA: mov [ebx+15h], al
  '004EBFBD: call edi
  '004EBFBF: mov eax, [esi]
  '004EBFC1: push 00000000h
  '004EBFC3: push 00000006h
  '004EBFC5: lea ecx, [ebp-2Ch]
  '004EBFC8: push eax
  '004EBFC9: push ecx
  '004EBFCA: call [004011E4h]
  '004EBFD0: add esp, 00000010h
  '004EBFD3: push eax
  '004EBFD4: call [00401114h]
  '004EBFDA: lea ecx, [ebp-2Ch]
  '004EBFDD: mov [ebx+16h], al
  '004EBFE0: call edi
  '004EBFE2: mov edx, [esi]
  '004EBFE4: push 00000000h
  '004EBFE6: push 00000008h
  '004EBFE8: lea eax, [ebp-2Ch]
  '004EBFEB: push edx
  '004EBFEC: push eax
  '004EBFED: call [004011E4h]
  '004EBFF3: add esp, 00000010h
  '004EBFF6: push eax
  '004EBFF7: call [00401284h]
  '004EBFFD: mov esi, [00401208h]
  '004EC003: mov ecx, eax
  '004EC005: call esi
  '004EC007: lea ecx, [ebp-2Ch]
  '004EC00A: mov [ebx+17h], al
  '004EC00D: call edi
  '004EC00F: mov ecx, 00000004h
  '004EC014: call esi
  '004EC016: mov [ebx+1Ah], al
  '004EC019: push 004EC03Dh
  '004EC01E: jmp 4EC033h
  '004EC020: lea ecx, [ebp-1Ch]
  '004EC023: call [004013B4h]
  '004EC029: lea ecx, [ebp-2Ch]
  '004EC02C: call [00401030h]
  '004EC032: ret 
End Sub
Private Sub unknown_4EC060
  '004EC060: push ebp
  '004EC061: mov ebp, esp
  '004EC063: sub esp, 0000000Ch
  '004EC066: push 004081B6h
  '004EC06B: mov eax, fs:[00h]
  '004EC071: push eax
  '004EC072: mov fs:[00000000h], esp
  '004EC079: sub esp, 0000000Ch
  '004EC07C: push ebx
  '004EC07D: push esi
  '004EC07E: push edi
  '004EC07F: mov [ebp-0Ch], esp
  '004EC082: mov [ebp-08h], 004055B0h
  '004EC089: mov esi, [ebp+08h]
  '004EC08C: mov eax, esi
  '004EC08E: and eax, 00000001h
  '004EC091: mov [ebp-04h], eax
  '004EC094: and esi, FFFFFFFEh
  '004EC097: push esi
  '004EC098: mov [ebp+08h], esi
  '004EC09B: mov ecx, [esi]
  '004EC09D: call [ecx+04h]
  '004EC0A0: mov edx, [esi]
  '004EC0A2: push 00000000h
  '004EC0A4: push esi
  '004EC0A5: call [edx+2Ch]
  '004EC0A8: test eax, eax
  '004EC0AA: jnl 4EC0BBh
  '004EC0AC: push 0000002Ch
  '004EC0AE: push 004209FCh
  '004EC0B3: push esi
  '004EC0B4: push eax
  '004EC0B5: call [004010A0h]
  '004EC0BB: mov eax, [esi]
  '004EC0BD: push 8000000Fh
  '004EC0C2: push esi
  '004EC0C3: call [eax+34h]
  '004EC0C6: test eax, eax
  '004EC0C8: jnl 4EC0D9h
  '004EC0CA: push 00000034h
  '004EC0CC: push 004209FCh
  '004EC0D1: push esi
  '004EC0D2: push eax
  '004EC0D3: call [004010A0h]
  '004EC0D9: mov [ebp-04h], 00000000h
  '004EC0E0: mov eax, [ebp+08h]
  '004EC0E3: push eax
  '004EC0E4: mov ecx, [eax]
  '004EC0E6: call [ecx+08h]
  '004EC0E9: mov eax, [ebp-04h]
  '004EC0EC: mov ecx, [ebp-14h]
  '004EC0EF: pop edi
  '004EC0F0: pop esi
  '004EC0F1: mov fs:[00000000h], ecx
  '004EC0F8: pop ebx
  '004EC0F9: mov esp, ebp
  '004EC0FB: pop ebp
  '004EC0FC: retn 0004h
End Sub

