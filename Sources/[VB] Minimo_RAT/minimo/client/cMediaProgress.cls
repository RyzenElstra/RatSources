Private Sub unknown_534390
  '00534390: push ebp
  '00534391: mov ebp, esp
  '00534393: sub esp, 0000000Ch
  '00534396: push 004081B6h
  '0053439B: mov eax, fs:[00h]
  '005343A1: push eax
  '005343A2: mov fs:[00000000h], esp
  '005343A9: sub esp, 0000000Ch
  '005343AC: push ebx
  '005343AD: push esi
  '005343AE: push edi
  '005343AF: mov [ebp-0Ch], esp
  '005343B2: mov [ebp-08h], 00407AA0h
  '005343B9: xor edi, edi
  '005343BB: mov [ebp-04h], edi
  '005343BE: mov esi, [ebp+08h]
  '005343C1: push esi
  '005343C2: mov eax, [esi]
  '005343C4: call [eax+04h]
  '005343C7: mov ecx, [esi+60h]
  '005343CA: mov [ebp-18h], edi
  '005343CD: mov [ebp-18h], ecx
  '005343D0: mov eax, [ebp+08h]
  '005343D3: push eax
  '005343D4: mov edx, [eax]
  '005343D6: call [edx+08h]
  '005343D9: mov eax, [ebp+0Ch]
  '005343DC: mov ecx, [ebp-18h]
  '005343DF: mov [eax], ecx
  '005343E1: mov eax, [ebp-04h]
  '005343E4: mov ecx, [ebp-14h]
  '005343E7: pop edi
  '005343E8: pop esi
  '005343E9: mov fs:[00000000h], ecx
  '005343F0: pop ebx
  '005343F1: mov esp, ebp
  '005343F3: pop ebp
  '005343F4: retn 0008h
End Sub
Private Sub unknown_534400
  '00534400: push ebp
  '00534401: mov ebp, esp
  '00534403: sub esp, 0000000Ch
  '00534406: push 004081B6h
  '0053440B: mov eax, fs:[00h]
  '00534411: push eax
  '00534412: mov fs:[00000000h], esp
  '00534419: sub esp, 00000094h
  '0053441F: push ebx
  '00534420: push esi
  '00534421: push edi
  '00534422: mov [ebp-0Ch], esp
  '00534425: mov [ebp-08h], 00407AA8h
  '0053442C: xor edi, edi
  '0053442E: mov [ebp-04h], edi
  '00534431: mov esi, [ebp+08h]
  '00534434: push esi
  '00534435: mov eax, [esi]
  '00534437: call [eax+04h]
  '0053443A: cmp [esi+50h], di
  '0053443E: mov [ebp-18h], edi
  '00534441: mov [ebp-28h], edi
  '00534444: mov [ebp-38h], edi
  '00534447: mov [ebp-48h], edi
  '0053444A: mov [ebp-58h], edi
  '0053444D: jz 005344DEh
  '00534453: call [00401300h]
  '00534459: lea ecx, [ebp-18h]
  '0053445C: push eax
  '0053445D: push ecx
  '0053445E: call [004010E4h]
  '00534464: mov esi, eax
  '00534466: mov eax, 0000000Ah
  '0053446B: mov ecx, 80020004h
  '00534470: mov [ebp-58h], eax
  '00534473: mov [ebp-48h], eax
  '00534476: mov [ebp-38h], eax
  '00534479: mov [ebp-28h], eax
  '0053447C: mov [ebp-50h], ecx
  '0053447F: mov [ebp-40h], ecx
  '00534482: mov [ebp-30h], ecx
  '00534485: mov [ebp-20h], ecx
  '00534488: mov edx, [esi]
  '0053448A: lea eax, [ebp-58h]
  '0053448D: lea ecx, [ebp-48h]
  '00534490: push eax
  '00534491: push ecx
  '00534492: lea eax, [ebp-38h]
  '00534495: lea ecx, [ebp-28h]
  '00534498: push eax
  '00534499: push ecx
  '0053449A: push 000001A9h
  '0053449F: push esi
  '005344A0: call [edx+44h]
  '005344A3: cmp eax, edi
  '005344A5: fclex 
  '005344A7: jnl 5344B8h
  '005344A9: push 00000044h
  '005344AB: push 0041E948h
  '005344B0: push esi
  '005344B1: push eax
  '005344B2: call [004010A0h]
  '005344B8: lea ecx, [ebp-18h]
  '005344BB: call [004013B8h]
  '005344C1: lea edx, [ebp-58h]
  '005344C4: lea eax, [ebp-48h]
  '005344C7: push edx
  '005344C8: lea ecx, [ebp-38h]
  '005344CB: push eax
  '005344CC: lea edx, [ebp-28h]
  '005344CF: push ecx
  '005344D0: push edx
  '005344D1: push 00000004h
  '005344D3: call [00401050h]
  '005344D9: add esp, 00000014h
  '005344DC: jmp 534510h
  '005344DE: mov eax, [ebp+0Ch]
  '005344E1: mov ecx, [esi]
  '005344E3: lea edx, [ebp-28h]
  '005344E6: mov [esi+60h], eax
  '005344E9: push edx
  '005344EA: push esi
  '005344EB: call [ecx+00000084h]
  '005344F1: cmp eax, edi
  '005344F3: jnl 534507h
  '005344F5: push 00000084h
  '005344FA: push 0042D004h
  '005344FF: push esi
  '00534500: push eax
  '00534501: call [004010A0h]
  '00534507: lea ecx, [ebp-28h]
  '0053450A: call [00401030h]
  '00534510: push 0053453Dh
  '00534515: jmp 53453Ch
  '00534517: lea ecx, [ebp-18h]
  '0053451A: call [004013B8h]
  '00534520: lea eax, [ebp-58h]
  '00534523: lea ecx, [ebp-48h]
  '00534526: push eax
  '00534527: lea edx, [ebp-38h]
  '0053452A: push ecx
  '0053452B: lea eax, [ebp-28h]
  '0053452E: push edx
  '0053452F: push eax
  '00534530: push 00000004h
  '00534532: call [00401050h]
  '00534538: add esp, 00000014h
  '0053453B: ret 
End Sub
Private Sub unknown_534560
  '00534560: push ebp
  '00534561: mov ebp, esp
  '00534563: sub esp, 0000000Ch
  '00534566: push 004081B6h
  '0053456B: mov eax, fs:[00h]
  '00534571: push eax
  '00534572: mov fs:[00000000h], esp
  '00534579: sub esp, 0000000Ch
  '0053457C: push ebx
  '0053457D: push esi
  '0053457E: push edi
  '0053457F: mov [ebp-0Ch], esp
  '00534582: mov [ebp-08h], 00407AB8h
  '00534589: xor edi, edi
  '0053458B: mov [ebp-04h], edi
  '0053458E: mov esi, [ebp+08h]
  '00534591: push esi
  '00534592: mov eax, [esi]
  '00534594: call [eax+04h]
  '00534597: mov ecx, [esi+64h]
  '0053459A: mov [ebp-18h], edi
  '0053459D: mov [ebp-18h], ecx
  '005345A0: mov eax, [ebp+08h]
  '005345A3: push eax
  '005345A4: mov edx, [eax]
  '005345A6: call [edx+08h]
  '005345A9: mov eax, [ebp+0Ch]
  '005345AC: mov ecx, [ebp-18h]
  '005345AF: mov [eax], ecx
  '005345B1: mov eax, [ebp-04h]
  '005345B4: mov ecx, [ebp-14h]
  '005345B7: pop edi
  '005345B8: pop esi
  '005345B9: mov fs:[00000000h], ecx
  '005345C0: pop ebx
  '005345C1: mov esp, ebp
  '005345C3: pop ebp
  '005345C4: retn 0008h
End Sub
Private Sub unknown_5345D0
  '005345D0: push ebp
  '005345D1: mov ebp, esp
  '005345D3: sub esp, 0000000Ch
  '005345D6: push 004081B6h
  '005345DB: mov eax, fs:[00h]
  '005345E1: push eax
  '005345E2: mov fs:[00000000h], esp
  '005345E9: sub esp, 0000001Ch
  '005345EC: push ebx
  '005345ED: push esi
  '005345EE: push edi
  '005345EF: mov [ebp-0Ch], esp
  '005345F2: mov [ebp-08h], 00407AC0h
  '005345F9: xor edi, edi
  '005345FB: mov [ebp-04h], edi
  '005345FE: mov esi, [ebp+08h]
  '00534601: push esi
  '00534602: mov eax, [esi]
  '00534604: call [eax+04h]
  '00534607: mov ecx, [ebp+0Ch]
  '0053460A: cmp [esi+50h], di
  '0053460E: mov [ebp-24h], edi
  '00534611: mov [esi+64h], ecx
  '00534614: jz 534642h
  '00534616: mov edx, [esi]
  '00534618: lea eax, [ebp-24h]
  '0053461B: push eax
  '0053461C: push esi
  '0053461D: call [edx+00000084h]
  '00534623: cmp eax, edi
  '00534625: jnl 534639h
  '00534627: push 00000084h
  '0053462C: push 0042D004h
  '00534631: push esi
  '00534632: push eax
  '00534633: call [004010A0h]
  '00534639: lea ecx, [ebp-24h]
  '0053463C: call [00401030h]
  '00534642: push 00534654h
  '00534647: jmp 534653h
  '00534649: lea ecx, [ebp-24h]
  '0053464C: call [00401030h]
  '00534652: ret 
End Sub
Private Sub unknown_534680
  '00534680: push ebp
  '00534681: mov ebp, esp
  '00534683: sub esp, 0000000Ch
  '00534686: push 004081B6h
  '0053468B: mov eax, fs:[00h]
  '00534691: push eax
  '00534692: mov fs:[00000000h], esp
  '00534699: sub esp, 0000000Ch
  '0053469C: push ebx
  '0053469D: push esi
  '0053469E: push edi
  '0053469F: mov [ebp-0Ch], esp
  '005346A2: mov [ebp-08h], 00407AD0h
  '005346A9: xor edi, edi
  '005346AB: mov [ebp-04h], edi
  '005346AE: mov esi, [ebp+08h]
  '005346B1: push esi
  '005346B2: mov eax, [esi]
  '005346B4: call [eax+04h]
  '005346B7: mov ecx, [esi+68h]
  '005346BA: mov [ebp-18h], edi
  '005346BD: mov [ebp-18h], ecx
  '005346C0: mov eax, [ebp+08h]
  '005346C3: push eax
  '005346C4: mov edx, [eax]
  '005346C6: call [edx+08h]
  '005346C9: mov eax, [ebp+0Ch]
  '005346CC: mov ecx, [ebp-18h]
  '005346CF: mov [eax], ecx
  '005346D1: mov eax, [ebp-04h]
  '005346D4: mov ecx, [ebp-14h]
  '005346D7: pop edi
  '005346D8: pop esi
  '005346D9: mov fs:[00000000h], ecx
  '005346E0: pop ebx
  '005346E1: mov esp, ebp
  '005346E3: pop ebp
  '005346E4: retn 0008h
End Sub
Private Sub unknown_5346F0
  '005346F0: push ebp
  '005346F1: mov ebp, esp
  '005346F3: sub esp, 0000000Ch
  '005346F6: push 004081B6h
  '005346FB: mov eax, fs:[00h]
  '00534701: push eax
  '00534702: mov fs:[00000000h], esp
  '00534709: sub esp, 0000001Ch
  '0053470C: push ebx
  '0053470D: push esi
  '0053470E: push edi
  '0053470F: mov [ebp-0Ch], esp
  '00534712: mov [ebp-08h], 00407AD8h
  '00534719: xor edi, edi
  '0053471B: mov [ebp-04h], edi
  '0053471E: mov esi, [ebp+08h]
  '00534721: push esi
  '00534722: mov eax, [esi]
  '00534724: call [eax+04h]
  '00534727: mov ecx, [ebp+0Ch]
  '0053472A: mov edx, [esi]
  '0053472C: lea eax, [ebp-24h]
  '0053472F: mov [ebp-24h], edi
  '00534732: push eax
  '00534733: push esi
  '00534734: mov [esi+68h], ecx
  '00534737: call [edx+00000084h]
  '0053473D: cmp eax, edi
  '0053473F: jnl 534753h
  '00534741: push 00000084h
  '00534746: push 0042D004h
  '0053474B: push esi
  '0053474C: push eax
  '0053474D: call [004010A0h]
  '00534753: lea ecx, [ebp-24h]
  '00534756: call [00401030h]
  '0053475C: push 0053476Eh
  '00534761: jmp 53476Dh
  '00534763: lea ecx, [ebp-24h]
  '00534766: call [00401030h]
  '0053476C: ret 
End Sub
Private Sub unknown_534790
  '00534790: push ebp
  '00534791: mov ebp, esp
  '00534793: sub esp, 0000000Ch
  '00534796: push 004081B6h
  '0053479B: mov eax, fs:[00h]
  '005347A1: push eax
  '005347A2: mov fs:[00000000h], esp
  '005347A9: sub esp, 0000000Ch
  '005347AC: push ebx
  '005347AD: push esi
  '005347AE: push edi
  '005347AF: mov [ebp-0Ch], esp
  '005347B2: mov [ebp-08h], 00407AE8h
  '005347B9: xor edi, edi
  '005347BB: mov [ebp-04h], edi
  '005347BE: mov esi, [ebp+08h]
  '005347C1: push esi
  '005347C2: mov eax, [esi]
  '005347C4: call [eax+04h]
  '005347C7: mov ecx, [ebp+0Ch]
  '005347CA: lea eax, [ebp-18h]
  '005347CD: mov [ebp-18h], edi
  '005347D0: mov [ecx], edi
  '005347D2: mov edx, [esi+58h]
  '005347D5: push edx
  '005347D6: push eax
  '005347D7: call [004010F8h]
  '005347DD: push 005347EFh
  '005347E2: jmp 5347EEh
  '005347E4: lea ecx, [ebp-18h]
  '005347E7: call [004013B8h]
  '005347ED: ret 
End Sub
Private Sub unknown_534820
  '00534820: push ebp
  '00534821: mov ebp, esp
  '00534823: sub esp, 0000000Ch
  '00534826: push 004081B6h
  '0053482B: mov eax, fs:[00h]
  '00534831: push eax
  '00534832: mov fs:[00000000h], esp
  '00534839: sub esp, 00000020h
  '0053483C: push ebx
  '0053483D: push esi
  '0053483E: push edi
  '0053483F: mov [ebp-0Ch], esp
  '00534842: mov [ebp-08h], 00407AF8h
  '00534849: xor ebx, ebx
  '0053484B: mov [ebp-04h], ebx
  '0053484E: mov esi, [ebp+08h]
  '00534851: push esi
  '00534852: mov eax, [esi]
  '00534854: call [eax+04h]
  '00534857: mov ecx, [ebp+0Ch]
  '0053485A: mov edi, [004010F8h]
  '00534860: lea edx, [ebp-18h]
  '00534863: push ecx
  '00534864: push edx
  '00534865: mov [ebp-18h], ebx
  '00534868: mov [ebp-28h], ebx
  '0053486B: call edi
  '0053486D: mov eax, [ebp-18h]
  '00534870: lea ecx, [esi+58h]
  '00534873: push eax
  '00534874: push ecx
  '00534875: call edi
  '00534877: mov edx, [esi]
  '00534879: lea eax, [ebp-28h]
  '0053487C: push eax
  '0053487D: push esi
  '0053487E: call [edx+00000084h]
  '00534884: cmp eax, ebx
  '00534886: jnl 53489Ah
  '00534888: push 00000084h
  '0053488D: push 0042D004h
  '00534892: push esi
  '00534893: push eax
  '00534894: call [004010A0h]
  '0053489A: lea ecx, [ebp-28h]
  '0053489D: call [00401030h]
  '005348A3: push 005348BEh
  '005348A8: jmp 5348B4h
  '005348AA: lea ecx, [ebp-28h]
  '005348AD: call [00401030h]
  '005348B3: ret 
End Sub
Private Sub unknown_5348E0
  '005348E0: push ebp
  '005348E1: mov ebp, esp
  '005348E3: sub esp, 0000000Ch
  '005348E6: push 004081B6h
  '005348EB: mov eax, fs:[00h]
  '005348F1: push eax
  '005348F2: mov fs:[00000000h], esp
  '005348F9: sub esp, 00000020h
  '005348FC: push ebx
  '005348FD: push esi
  '005348FE: push edi
  '005348FF: mov [ebp-0Ch], esp
  '00534902: mov [ebp-08h], 00407B08h
  '00534909: xor ebx, ebx
  '0053490B: mov [ebp-04h], ebx
  '0053490E: mov esi, [ebp+08h]
  '00534911: push esi
  '00534912: mov eax, [esi]
  '00534914: call [eax+04h]
  '00534917: mov ecx, [ebp+0Ch]
  '0053491A: mov edi, [004010F8h]
  '00534920: lea edx, [ebp-18h]
  '00534923: push ecx
  '00534924: push edx
  '00534925: mov [ebp-18h], ebx
  '00534928: mov [ebp-28h], ebx
  '0053492B: call edi
  '0053492D: mov eax, [ebp-18h]
  '00534930: lea ecx, [esi+58h]
  '00534933: push eax
  '00534934: push ecx
  '00534935: call edi
  '00534937: mov edx, [esi]
  '00534939: lea eax, [ebp-28h]
  '0053493C: push eax
  '0053493D: push esi
  '0053493E: call [edx+00000084h]
  '00534944: cmp eax, ebx
  '00534946: jnl 53495Ah
  '00534948: push 00000084h
  '0053494D: push 0042D004h
  '00534952: push esi
  '00534953: push eax
  '00534954: call [004010A0h]
  '0053495A: lea ecx, [ebp-28h]
  '0053495D: call [00401030h]
  '00534963: push 0053497Eh
  '00534968: jmp 534974h
  '0053496A: lea ecx, [ebp-28h]
  '0053496D: call [00401030h]
  '00534973: ret 
End Sub
Private Sub unknown_5349A0
  '005349A0: push ebp
  '005349A1: mov ebp, esp
  '005349A3: sub esp, 0000000Ch
  '005349A6: push 004081B6h
  '005349AB: mov eax, fs:[00h]
  '005349B1: push eax
  '005349B2: mov fs:[00000000h], esp
  '005349B9: sub esp, 0000000Ch
  '005349BC: push ebx
  '005349BD: push esi
  '005349BE: push edi
  '005349BF: mov [ebp-0Ch], esp
  '005349C2: mov [ebp-08h], 00407B18h
  '005349C9: xor edi, edi
  '005349CB: mov [ebp-04h], edi
  '005349CE: mov esi, [ebp+08h]
  '005349D1: push esi
  '005349D2: mov eax, [esi]
  '005349D4: call [eax+04h]
  '005349D7: mov ecx, [esi+54h]
  '005349DA: mov [ebp-18h], edi
  '005349DD: mov [ebp-18h], ecx
  '005349E0: mov eax, [ebp+08h]
  '005349E3: push eax
  '005349E4: mov edx, [eax]
  '005349E6: call [edx+08h]
  '005349E9: mov eax, [ebp+0Ch]
  '005349EC: mov ecx, [ebp-18h]
  '005349EF: mov [eax], ecx
  '005349F1: mov eax, [ebp-04h]
  '005349F4: mov ecx, [ebp-14h]
  '005349F7: pop edi
  '005349F8: pop esi
  '005349F9: mov fs:[00000000h], ecx
  '00534A00: pop ebx
  '00534A01: mov esp, ebp
  '00534A03: pop ebp
  '00534A04: retn 0008h
End Sub
Private Sub unknown_534A10
  '00534A10: push ebp
  '00534A11: mov ebp, esp
  '00534A13: sub esp, 0000000Ch
  '00534A16: push 004081B6h
  '00534A1B: mov eax, fs:[00h]
  '00534A21: push eax
  '00534A22: mov fs:[00000000h], esp
  '00534A29: sub esp, 0000001Ch
  '00534A2C: push ebx
  '00534A2D: push esi
  '00534A2E: push edi
  '00534A2F: mov [ebp-0Ch], esp
  '00534A32: mov [ebp-08h], 00407B20h
  '00534A39: xor edi, edi
  '00534A3B: mov [ebp-04h], edi
  '00534A3E: mov esi, [ebp+08h]
  '00534A41: push esi
  '00534A42: mov eax, [esi]
  '00534A44: call [eax+04h]
  '00534A47: mov ecx, [ebp+0Ch]
  '00534A4A: mov edx, [esi]
  '00534A4C: lea eax, [ebp-24h]
  '00534A4F: mov [ebp-24h], edi
  '00534A52: push eax
  '00534A53: push esi
  '00534A54: mov [esi+54h], ecx
  '00534A57: call [edx+00000084h]
  '00534A5D: cmp eax, edi
  '00534A5F: jnl 534A73h
  '00534A61: push 00000084h
  '00534A66: push 0042D004h
  '00534A6B: push esi
  '00534A6C: push eax
  '00534A6D: call [004010A0h]
  '00534A73: lea ecx, [ebp-24h]
  '00534A76: call [00401030h]
  '00534A7C: push 00534A8Eh
  '00534A81: jmp 534A8Dh
  '00534A83: lea ecx, [ebp-24h]
  '00534A86: call [00401030h]
  '00534A8C: ret 
End Sub
Private Sub unknown_534AB0
  '00534AB0: push ebp
  '00534AB1: mov ebp, esp
  '00534AB3: sub esp, 0000000Ch
  '00534AB6: push 004081B6h
  '00534ABB: mov eax, fs:[00h]
  '00534AC1: push eax
  '00534AC2: mov fs:[00000000h], esp
  '00534AC9: sub esp, 0000000Ch
  '00534ACC: push ebx
  '00534ACD: push esi
  '00534ACE: push edi
  '00534ACF: mov [ebp-0Ch], esp
  '00534AD2: mov [ebp-08h], 00407B30h
  '00534AD9: xor edi, edi
  '00534ADB: mov [ebp-04h], edi
  '00534ADE: mov esi, [ebp+08h]
  '00534AE1: push esi
  '00534AE2: mov eax, [esi]
  '00534AE4: call [eax+04h]
  '00534AE7: mov cx, [esi+50h]
  '00534AEB: mov [ebp-18h], edi
  '00534AEE: mov [ebp-18h], ecx
  '00534AF1: mov eax, [ebp+08h]
  '00534AF4: push eax
  '00534AF5: mov edx, [eax]
  '00534AF7: call [edx+08h]
  '00534AFA: mov eax, [ebp+0Ch]
  '00534AFD: mov cx, [ebp-18h]
  '00534B01: mov [eax], cx
  '00534B04: mov eax, [ebp-04h]
  '00534B07: mov ecx, [ebp-14h]
  '00534B0A: pop edi
  '00534B0B: pop esi
  '00534B0C: mov fs:[00000000h], ecx
  '00534B13: pop ebx
  '00534B14: mov esp, ebp
  '00534B16: pop ebp
  '00534B17: retn 0008h
End Sub
Private Sub unknown_534B20
  '00534B20: push ebp
  '00534B21: mov ebp, esp
  '00534B23: sub esp, 0000000Ch
  '00534B26: push 004081B6h
  '00534B2B: mov eax, fs:[00h]
  '00534B31: push eax
  '00534B32: mov fs:[00000000h], esp
  '00534B39: sub esp, 0000001Ch
  '00534B3C: push ebx
  '00534B3D: push esi
  '00534B3E: push edi
  '00534B3F: mov [ebp-0Ch], esp
  '00534B42: mov [ebp-08h], 00407B38h
  '00534B49: xor edi, edi
  '00534B4B: mov [ebp-04h], edi
  '00534B4E: mov esi, [ebp+08h]
  '00534B51: push esi
  '00534B52: mov eax, [esi]
  '00534B54: call [eax+04h]
  '00534B57: mov cx, [ebp+0Ch]
  '00534B5B: mov edx, [esi]
  '00534B5D: lea eax, [ebp-24h]
  '00534B60: mov [ebp-24h], edi
  '00534B63: push eax
  '00534B64: push esi
  '00534B65: mov [esi+50h], cx
  '00534B69: call [edx+00000084h]
  '00534B6F: cmp eax, edi
  '00534B71: jnl 534B85h
  '00534B73: push 00000084h
  '00534B78: push 0042D004h
  '00534B7D: push esi
  '00534B7E: push eax
  '00534B7F: call [004010A0h]
  '00534B85: lea ecx, [ebp-24h]
  '00534B88: call [00401030h]
  '00534B8E: push 00534BA0h
  '00534B93: jmp 534B9Fh
  '00534B95: lea ecx, [ebp-24h]
  '00534B98: call [00401030h]
  '00534B9E: ret 
End Sub
Private Sub unknown_534BC0
  '00534BC0: push ebp
  '00534BC1: mov ebp, esp
  '00534BC3: sub esp, 0000000Ch
  '00534BC6: push 004081B6h
  '00534BCB: mov eax, fs:[00h]
  '00534BD1: push eax
  '00534BD2: mov fs:[00000000h], esp
  '00534BD9: sub esp, 0000000Ch
  '00534BDC: push ebx
  '00534BDD: push esi
  '00534BDE: push edi
  '00534BDF: mov [ebp-0Ch], esp
  '00534BE2: mov [ebp-08h], 00407B48h
  '00534BE9: xor edi, edi
  '00534BEB: mov [ebp-04h], edi
  '00534BEE: mov esi, [ebp+08h]
  '00534BF1: push esi
  '00534BF2: mov eax, [esi]
  '00534BF4: call [eax+04h]
  '00534BF7: mov cx, [esi+52h]
  '00534BFB: mov [ebp-18h], edi
  '00534BFE: mov [ebp-18h], ecx
  '00534C01: mov eax, [ebp+08h]
  '00534C04: push eax
  '00534C05: mov edx, [eax]
  '00534C07: call [edx+08h]
  '00534C0A: mov eax, [ebp+0Ch]
  '00534C0D: mov cx, [ebp-18h]
  '00534C11: mov [eax], cx
  '00534C14: mov eax, [ebp-04h]
  '00534C17: mov ecx, [ebp-14h]
  '00534C1A: pop edi
  '00534C1B: pop esi
  '00534C1C: mov fs:[00000000h], ecx
  '00534C23: pop ebx
  '00534C24: mov esp, ebp
  '00534C26: pop ebp
  '00534C27: retn 0008h
End Sub
Private Sub unknown_534C30
  '00534C30: push ebp
  '00534C31: mov ebp, esp
  '00534C33: sub esp, 0000000Ch
  '00534C36: push 004081B6h
  '00534C3B: mov eax, fs:[00h]
  '00534C41: push eax
  '00534C42: mov fs:[00000000h], esp
  '00534C49: sub esp, 0000001Ch
  '00534C4C: push ebx
  '00534C4D: push esi
  '00534C4E: push edi
  '00534C4F: mov [ebp-0Ch], esp
  '00534C52: mov [ebp-08h], 00407B50h
  '00534C59: xor edi, edi
  '00534C5B: mov [ebp-04h], edi
  '00534C5E: mov esi, [ebp+08h]
  '00534C61: push esi
  '00534C62: mov eax, [esi]
  '00534C64: call [eax+04h]
  '00534C67: mov cx, [ebp+0Ch]
  '00534C6B: mov edx, [esi]
  '00534C6D: lea eax, [ebp-24h]
  '00534C70: mov [ebp-24h], edi
  '00534C73: push eax
  '00534C74: push esi
  '00534C75: mov [esi+52h], cx
  '00534C79: call [edx+00000084h]
  '00534C7F: cmp eax, edi
  '00534C81: jnl 534C95h
  '00534C83: push 00000084h
  '00534C88: push 0042D004h
  '00534C8D: push esi
  '00534C8E: push eax
  '00534C8F: call [004010A0h]
  '00534C95: lea ecx, [ebp-24h]
  '00534C98: call [00401030h]
  '00534C9E: push 00534CB0h
  '00534CA3: jmp 534CAFh
  '00534CA5: lea ecx, [ebp-24h]
  '00534CA8: call [00401030h]
  '00534CAE: ret 
End Sub
Private Sub unknown_534CD0
  '00534CD0: push ebp
  '00534CD1: mov ebp, esp
  '00534CD3: sub esp, 0000000Ch
  '00534CD6: push 004081B6h
  '00534CDB: mov eax, fs:[00h]
  '00534CE1: push eax
  '00534CE2: mov fs:[00000000h], esp
  '00534CE9: sub esp, 0000000Ch
  '00534CEC: push ebx
  '00534CED: push esi
  '00534CEE: push edi
  '00534CEF: mov [ebp-0Ch], esp
  '00534CF2: mov [ebp-08h], 00407B60h
  '00534CF9: xor edi, edi
  '00534CFB: mov [ebp-04h], edi
  '00534CFE: mov esi, [ebp+08h]
  '00534D01: push esi
  '00534D02: mov eax, [esi]
  '00534D04: call [eax+04h]
  '00534D07: mov ecx, [ebp+0Ch]
  '00534D0A: mov [ebp-18h], edi
  '00534D0D: mov [ecx], edi
  '00534D0F: mov edx, [esi+4Ch]
  '00534D12: lea ecx, [ebp-18h]
  '00534D15: call [004012D8h]
  '00534D1B: push 00534D2Dh
  '00534D20: jmp 534D2Ch
  '00534D22: lea ecx, [ebp-18h]
  '00534D25: call [004013B4h]
  '00534D2B: ret 
End Sub
Private Sub unknown_534D60
  '00534D60: push ebp
  '00534D61: mov ebp, esp
  '00534D63: sub esp, 0000000Ch
  '00534D66: push 004081B6h
  '00534D6B: mov eax, fs:[00h]
  '00534D71: push eax
  '00534D72: mov fs:[00000000h], esp
  '00534D79: sub esp, 00000020h
  '00534D7C: push ebx
  '00534D7D: push esi
  '00534D7E: push edi
  '00534D7F: mov [ebp-0Ch], esp
  '00534D82: mov [ebp-08h], 00407B70h
  '00534D89: xor ebx, ebx
  '00534D8B: mov [ebp-04h], ebx
  '00534D8E: mov esi, [ebp+08h]
  '00534D91: push esi
  '00534D92: mov eax, [esi]
  '00534D94: call [eax+04h]
  '00534D97: mov edx, [ebp+0Ch]
  '00534D9A: mov edi, [004012D8h]
  '00534DA0: lea ecx, [ebp-18h]
  '00534DA3: mov [ebp-18h], ebx
  '00534DA6: mov [ebp-28h], ebx
  '00534DA9: call edi
  '00534DAB: mov edx, [ebp-18h]
  '00534DAE: lea ecx, [esi+4Ch]
  '00534DB1: call edi
  '00534DB3: mov ecx, [esi]
  '00534DB5: lea edx, [ebp-28h]
  '00534DB8: push edx
  '00534DB9: push esi
  '00534DBA: call [ecx+00000084h]
  '00534DC0: cmp eax, ebx
  '00534DC2: jnl 534DD6h
  '00534DC4: push 00000084h
  '00534DC9: push 0042D004h
  '00534DCE: push esi
  '00534DCF: push eax
  '00534DD0: call [004010A0h]
  '00534DD6: lea ecx, [ebp-28h]
  '00534DD9: call [00401030h]
  '00534DDF: push 00534DFAh
  '00534DE4: jmp 534DF0h
  '00534DE6: lea ecx, [ebp-28h]
  '00534DE9: call [00401030h]
  '00534DEF: ret 
End Sub
Private Sub unknown_534E20
  '00534E20: push ebp
  '00534E21: mov ebp, esp
  '00534E23: sub esp, 0000000Ch
  '00534E26: push 004081B6h
  '00534E2B: mov eax, fs:[00h]
  '00534E31: push eax
  '00534E32: mov fs:[00000000h], esp
  '00534E39: sub esp, 0000000Ch
  '00534E3C: push ebx
  '00534E3D: push esi
  '00534E3E: push edi
  '00534E3F: mov [ebp-0Ch], esp
  '00534E42: mov [ebp-08h], 00407B80h
  '00534E49: xor edi, edi
  '00534E4B: mov [ebp-04h], edi
  '00534E4E: mov esi, [ebp+08h]
  '00534E51: push esi
  '00534E52: mov eax, [esi]
  '00534E54: call [eax+04h]
  '00534E57: mov ecx, [esi+3Ch]
  '00534E5A: mov [ebp-18h], edi
  '00534E5D: mov [ebp-18h], ecx
  '00534E60: mov eax, [ebp+08h]
  '00534E63: push eax
  '00534E64: mov edx, [eax]
  '00534E66: call [edx+08h]
  '00534E69: mov eax, [ebp+0Ch]
  '00534E6C: mov ecx, [ebp-18h]
  '00534E6F: mov [eax], ecx
  '00534E71: mov eax, [ebp-04h]
  '00534E74: mov ecx, [ebp-14h]
  '00534E77: pop edi
  '00534E78: pop esi
  '00534E79: mov fs:[00000000h], ecx
  '00534E80: pop ebx
  '00534E81: mov esp, ebp
  '00534E83: pop ebp
  '00534E84: retn 0008h
End Sub
Private Sub unknown_534E90
  '00534E90: push ebp
  '00534E91: mov ebp, esp
  '00534E93: sub esp, 0000000Ch
  '00534E96: push 004081B6h
  '00534E9B: mov eax, fs:[00h]
  '00534EA1: push eax
  '00534EA2: mov fs:[00000000h], esp
  '00534EA9: sub esp, 0000001Ch
  '00534EAC: push ebx
  '00534EAD: push esi
  '00534EAE: push edi
  '00534EAF: mov [ebp-0Ch], esp
  '00534EB2: mov [ebp-08h], 00407B88h
  '00534EB9: xor edi, edi
  '00534EBB: mov [ebp-04h], edi
  '00534EBE: mov esi, [ebp+08h]
  '00534EC1: push esi
  '00534EC2: mov eax, [esi]
  '00534EC4: call [eax+04h]
  '00534EC7: mov ecx, [ebp+0Ch]
  '00534ECA: mov edx, [esi]
  '00534ECC: lea eax, [ebp-24h]
  '00534ECF: mov [ebp-24h], edi
  '00534ED2: push eax
  '00534ED3: push esi
  '00534ED4: mov [esi+3Ch], ecx
  '00534ED7: call [edx+00000084h]
  '00534EDD: cmp eax, edi
  '00534EDF: jnl 534EF3h
  '00534EE1: push 00000084h
  '00534EE6: push 0042D004h
  '00534EEB: push esi
  '00534EEC: push eax
  '00534EED: call [004010A0h]
  '00534EF3: lea ecx, [ebp-24h]
  '00534EF6: call [00401030h]
  '00534EFC: push 00534F0Eh
  '00534F01: jmp 534F0Dh
  '00534F03: lea ecx, [ebp-24h]
  '00534F06: call [00401030h]
  '00534F0C: ret 
End Sub
Private Sub unknown_534F30
  '00534F30: push ebp
  '00534F31: mov ebp, esp
  '00534F33: sub esp, 0000000Ch
  '00534F36: push 004081B6h
  '00534F3B: mov eax, fs:[00h]
  '00534F41: push eax
  '00534F42: mov fs:[00000000h], esp
  '00534F49: sub esp, 0000000Ch
  '00534F4C: push ebx
  '00534F4D: push esi
  '00534F4E: push edi
  '00534F4F: mov [ebp-0Ch], esp
  '00534F52: mov [ebp-08h], 00407B98h
  '00534F59: xor edi, edi
  '00534F5B: mov [ebp-04h], edi
  '00534F5E: mov esi, [ebp+08h]
  '00534F61: push esi
  '00534F62: mov eax, [esi]
  '00534F64: call [eax+04h]
  '00534F67: mov ecx, [esi+40h]
  '00534F6A: mov [ebp-18h], edi
  '00534F6D: mov [ebp-18h], ecx
  '00534F70: mov eax, [ebp+08h]
  '00534F73: push eax
  '00534F74: mov edx, [eax]
  '00534F76: call [edx+08h]
  '00534F79: mov eax, [ebp+0Ch]
  '00534F7C: mov ecx, [ebp-18h]
  '00534F7F: mov [eax], ecx
  '00534F81: mov eax, [ebp-04h]
  '00534F84: mov ecx, [ebp-14h]
  '00534F87: pop edi
  '00534F88: pop esi
  '00534F89: mov fs:[00000000h], ecx
  '00534F90: pop ebx
  '00534F91: mov esp, ebp
  '00534F93: pop ebp
  '00534F94: retn 0008h
End Sub
Private Sub unknown_534FA0
  '00534FA0: push ebp
  '00534FA1: mov ebp, esp
  '00534FA3: sub esp, 0000000Ch
  '00534FA6: push 004081B6h
  '00534FAB: mov eax, fs:[00h]
  '00534FB1: push eax
  '00534FB2: mov fs:[00000000h], esp
  '00534FB9: sub esp, 0000001Ch
  '00534FBC: push ebx
  '00534FBD: push esi
  '00534FBE: push edi
  '00534FBF: mov [ebp-0Ch], esp
  '00534FC2: mov [ebp-08h], 00407BA0h
  '00534FC9: xor edi, edi
  '00534FCB: mov [ebp-04h], edi
  '00534FCE: mov esi, [ebp+08h]
  '00534FD1: push esi
  '00534FD2: mov eax, [esi]
  '00534FD4: call [eax+04h]
  '00534FD7: mov ecx, [ebp+0Ch]
  '00534FDA: mov edx, [esi]
  '00534FDC: lea eax, [ebp-24h]
  '00534FDF: mov [ebp-24h], edi
  '00534FE2: push eax
  '00534FE3: push esi
  '00534FE4: mov [esi+40h], ecx
  '00534FE7: call [edx+00000084h]
  '00534FED: cmp eax, edi
  '00534FEF: jnl 535003h
  '00534FF1: push 00000084h
  '00534FF6: push 0042D004h
  '00534FFB: push esi
  '00534FFC: push eax
  '00534FFD: call [004010A0h]
  '00535003: lea ecx, [ebp-24h]
  '00535006: call [00401030h]
  '0053500C: push 0053501Eh
  '00535011: jmp 53501Dh
  '00535013: lea ecx, [ebp-24h]
  '00535016: call [00401030h]
  '0053501C: ret 
End Sub
Private Sub Width_535040
  '00535040: push ebp
  '00535041: mov ebp, esp
  '00535043: sub esp, 0000000Ch
  '00535046: push 004081B6h
  '0053504B: mov eax, fs:[00h]
  '00535051: push eax
  '00535052: mov fs:[00000000h], esp
  '00535059: sub esp, 0000000Ch
  '0053505C: push ebx
  '0053505D: push esi
  '0053505E: push edi
  '0053505F: mov [ebp-0Ch], esp
  '00535062: mov [ebp-08h], 00407BB0h
  '00535069: xor edi, edi
  '0053506B: mov [ebp-04h], edi
  '0053506E: mov esi, [ebp+08h]
  '00535071: push esi
  '00535072: mov eax, [esi]
  '00535074: call [eax+04h]
  '00535077: mov ecx, [esi+48h]
  '0053507A: mov [ebp-18h], edi
  '0053507D: mov [ebp-18h], ecx
  '00535080: mov eax, [ebp+08h]
  '00535083: push eax
  '00535084: mov edx, [eax]
  '00535086: call [edx+08h]
  '00535089: mov ecx, [ebp+0Ch]
  '0053508C: mov eax, [ebp-18h]
  '0053508F: mov [ecx], eax
  '00535091: mov eax, [ebp-04h]
  '00535094: mov ecx, [ebp-14h]
  '00535097: pop edi
  '00535098: pop esi
  '00535099: mov fs:[00000000h], ecx
  '005350A0: pop ebx
  '005350A1: mov esp, ebp
  '005350A3: pop ebp
  '005350A4: retn 0008h
End Sub
Private Sub Width_5350B0
  '005350B0: push ebp
  '005350B1: mov ebp, esp
  '005350B3: sub esp, 0000000Ch
  '005350B6: push 004081B6h
  '005350BB: mov eax, fs:[00h]
  '005350C1: push eax
  '005350C2: mov fs:[00000000h], esp
  '005350C9: sub esp, 0000001Ch
  '005350CC: push ebx
  '005350CD: push esi
  '005350CE: push edi
  '005350CF: mov [ebp-0Ch], esp
  '005350D2: mov [ebp-08h], 00407BB8h
  '005350D9: xor edi, edi
  '005350DB: mov [ebp-04h], edi
  '005350DE: mov esi, [ebp+08h]
  '005350E1: push esi
  '005350E2: mov eax, [esi]
  '005350E4: call [eax+04h]
  '005350E7: mov ecx, [ebp+0Ch]
  '005350EA: mov edx, [esi]
  '005350EC: lea eax, [ebp-24h]
  '005350EF: mov [ebp-24h], edi
  '005350F2: push eax
  '005350F3: push esi
  '005350F4: mov [esi+48h], ecx
  '005350F7: call [edx+00000084h]
  '005350FD: cmp eax, edi
  '005350FF: jnl 535113h
  '00535101: push 00000084h
  '00535106: push 0042D004h
  '0053510B: push esi
  '0053510C: push eax
  '0053510D: call [004010A0h]
  '00535113: lea ecx, [ebp-24h]
  '00535116: call [00401030h]
  '0053511C: wait 
  '0053511D: push 0053512Fh
  '00535122: jmp 53512Eh
  '00535124: lea ecx, [ebp-24h]
  '00535127: call [00401030h]
  '0053512D: ret 
End Sub
Private Sub MinWidth_535150
  '00535150: push ebp
  '00535151: mov ebp, esp
  '00535153: sub esp, 0000000Ch
  '00535156: push 004081B6h
  '0053515B: mov eax, fs:[00h]
  '00535161: push eax
  '00535162: mov fs:[00000000h], esp
  '00535169: sub esp, 0000000Ch
  '0053516C: push ebx
  '0053516D: push esi
  '0053516E: push edi
  '0053516F: mov [ebp-0Ch], esp
  '00535172: mov [ebp-08h], 00407BC8h
  '00535179: xor edi, edi
  '0053517B: mov [ebp-04h], edi
  '0053517E: mov esi, [ebp+08h]
  '00535181: push esi
  '00535182: mov eax, [esi]
  '00535184: call [eax+04h]
  '00535187: mov ecx, [esi+44h]
  '0053518A: mov [ebp-18h], edi
  '0053518D: mov [ebp-18h], ecx
  '00535190: mov eax, [ebp+08h]
  '00535193: push eax
  '00535194: mov edx, [eax]
  '00535196: call [edx+08h]
  '00535199: mov eax, [ebp+0Ch]
  '0053519C: mov ecx, [ebp-18h]
  '0053519F: mov [eax], ecx
  '005351A1: mov eax, [ebp-04h]
  '005351A4: mov ecx, [ebp-14h]
  '005351A7: pop edi
  '005351A8: pop esi
  '005351A9: mov fs:[00000000h], ecx
  '005351B0: pop ebx
  '005351B1: mov esp, ebp
  '005351B3: pop ebp
  '005351B4: retn 0008h
End Sub
Private Sub MinWidth_5351C0
  '005351C0: push ebp
  '005351C1: mov ebp, esp
  '005351C3: sub esp, 0000000Ch
  '005351C6: push 004081B6h
  '005351CB: mov eax, fs:[00h]
  '005351D1: push eax
  '005351D2: mov fs:[00000000h], esp
  '005351D9: sub esp, 00000030h
  '005351DC: push ebx
  '005351DD: push esi
  '005351DE: push edi
  '005351DF: mov [ebp-0Ch], esp
  '005351E2: mov [ebp-08h], 00407BD0h
  '005351E9: xor edi, edi
  '005351EB: mov [ebp-04h], edi
  '005351EE: mov esi, [ebp+08h]
  '005351F1: push esi
  '005351F2: mov eax, [esi]
  '005351F4: call [eax+04h]
  '005351F7: mov ecx, [ebp+0Ch]
  '005351FA: mov eax, [esi+40h]
  '005351FD: mov [esi+44h], ecx
  '00535200: mov ecx, [esi+3Ch]
  '00535203: mov edx, eax
  '00535205: mov [ebp-24h], edi
  '00535208: sub edx, ecx
  '0053520A: jo 005352B8h
  '00535210: test edx, edx
  '00535212: jle 535252h
  '00535214: fild dword ptr [ebp+0Ch]
  '00535217: sub eax, ecx
  '00535219: jo 005352B8h
  '0053521F: fstp real8 ptr [ebp-38h]
  '00535222: fld real8 ptr [ebp-38h]
  '00535225: mov [ebp-3Ch], eax
  '00535228: fild dword ptr [ebp-3Ch]
  '0053522B: fstp real8 ptr [ebp-44h]
  '0053522E: cmp [00541000h], 00000000h
  '00535235: jnz 53523Ch
  '00535237: fdiv real8 ptr [ebp-44h]
  '0053523A: jmp 535247h
  '0053523C: push [ebp-40h]
  '0053523F: push [ebp-44h]
  '00535242: call 004081D4h
  '00535247: fstp real4 ptr [esi+48h]
  '0053524A: fstsw ax
  '0053524C: test al, 0Dh
  '0053524E: jnz 5352B3h
  '00535250: jmp 535255h
  '00535252: mov [esi+48h], edi
  '00535255: mov eax, [esi]
  '00535257: lea ecx, [ebp-24h]
  '0053525A: push ecx
  '0053525B: push esi
  '0053525C: call [eax+00000084h]
  '00535262: cmp eax, edi
  '00535264: jnl 535278h
  '00535266: push 00000084h
  '0053526B: push 0042D004h
  '00535270: push esi
  '00535271: push eax
  '00535272: call [004010A0h]
  '00535278: lea ecx, [ebp-24h]
  '0053527B: call [00401030h]
  '00535281: wait 
  '00535282: push 00535294h
  '00535287: jmp 535293h
  '00535289: lea ecx, [ebp-24h]
  '0053528C: call [00401030h]
  '00535292: ret 
End Sub
Private Sub Height_5352C0
  '005352C0: push ebp
  '005352C1: mov ebp, esp
  '005352C3: sub esp, 0000000Ch
  '005352C6: push 004081B6h
  '005352CB: mov eax, fs:[00h]
  '005352D1: push eax
  '005352D2: mov fs:[00000000h], esp
  '005352D9: sub esp, 00000018h
  '005352DC: push ebx
  '005352DD: push esi
  '005352DE: push edi
  '005352DF: mov [ebp-0Ch], esp
  '005352E2: mov [ebp-08h], 00407BE0h
  '005352E9: xor ebx, ebx
  '005352EB: mov [ebp-04h], ebx
  '005352EE: mov esi, [ebp+08h]
  '005352F1: push esi
  '005352F2: mov eax, [esi]
  '005352F4: call [eax+04h]
  '005352F7: mov edi, [ebp+18h]
  '005352FA: mov [ebp-18h], ebx
  '005352FD: cmp edi, FFFFFFFFh
  '00535300: mov [ebp-1Ch], ebx
  '00535303: mov [ebp-20h], ebx
  '00535306: jnz 53531Ah
  '00535308: cmp [esi+50h], bx
  '0053530C: mov edi, [esi+60h]
  '0053530F: jz 53531Ah
  '00535311: mov eax, [esi+64h]
  '00535314: cmp edi, eax
  '00535316: jnl 53531Ah
  '00535318: mov edi, eax
  '0053531A: cmp [ebp+1Ch], FFFFFFFFh
  '0053531E: jnz 535326h
  '00535320: mov ecx, [esi+68h]
  '00535323: mov [ebp+1Ch], ecx
  '00535326: mov ebx, [ebp+20h]
  '00535329: cmp ebx, 000000FFh
  '0053532F: jz 005353B6h
  '00535335: cmp word ptr [esi+38h], 0000h
  '0053533A: jz 5353B6h
  '0053533C: xor ecx, ecx
  '0053533E: call [00401208h]
  '00535344: mov ecx, ebx
  '00535346: mov [ebp-1Ch], al
  '00535349: call [00401220h]
  '0053534F: mov [ebp-1Ah], al
  '00535352: lea edx, [ebp-1Ch]
  '00535355: push 00000000h
  '00535357: lea eax, [ebp-18h]
  '0053535A: push edx
  '0053535B: push eax
  '0053535C: call 0041D584h
  '00535361: mov ebx, [0040109Ch]
  '00535367: call ebx
  '00535369: mov eax, [esi+5Ch]
  '0053536C: lea edx, [ebp-20h]
  '0053536F: push edx
  '00535370: push eax
  '00535371: mov ecx, [eax]
  '00535373: call [ecx+54h]
  '00535376: test eax, eax
  '00535378: fclex 
  '0053537A: jnl 53538Eh
  '0053537C: mov ecx, [esi+5Ch]
  '0053537F: push 00000054h
  '00535381: push 0042C8ECh
  '00535386: push ecx
  '00535387: push eax
  '00535388: call [004010A0h]
  '0053538E: mov edx, [ebp-18h]
  '00535391: mov eax, [ebp+1Ch]
  '00535394: mov ecx, [ebp-20h]
  '00535397: push edx
  '00535398: mov edx, [ebp+14h]
  '0053539B: push eax
  '0053539C: push edi
  '0053539D: push 00000000h
  '0053539F: push 00000000h
  '005353A1: push ecx
  '005353A2: mov ecx, [ebp+0Ch]
  '005353A5: push eax
  '005353A6: mov eax, [ebp+10h]
  '005353A9: push edi
  '005353AA: push edx
  '005353AB: push eax
  '005353AC: push ecx
  '005353AD: call 0042CA84h
  '005353B2: call ebx
  '005353B4: jmp 535404h
  '005353B6: mov eax, [esi+5Ch]
  '005353B9: lea ecx, [ebp-20h]
  '005353BC: push ecx
  '005353BD: push eax
  '005353BE: mov edx, [eax]
  '005353C0: call [edx+54h]
  '005353C3: test eax, eax
  '005353C5: fclex 
  '005353C7: jnl 5353DBh
  '005353C9: mov edx, [esi+5Ch]
  '005353CC: push 00000054h
  '005353CE: push 0042C8ECh
  '005353D3: push edx
  '005353D4: push eax
  '005353D5: call [004010A0h]
  '005353DB: mov eax, [ebp-20h]
  '005353DE: mov ecx, [ebp+1Ch]
  '005353E1: mov edx, [ebp+14h]
  '005353E4: push 00CC0020h
  '005353E9: push 00000000h
  '005353EB: push 00000000h
  '005353ED: push eax
  '005353EE: mov eax, [ebp+10h]
  '005353F1: push ecx
  '005353F2: mov ecx, [ebp+0Ch]
  '005353F5: push edi
  '005353F6: push edx
  '005353F7: push eax
  '005353F8: push ecx
  '005353F9: call 00427568h
  '005353FE: call [0040109Ch]
  '00535404: mov eax, [ebp+08h]
  '00535407: push eax
  '00535408: mov edx, [eax]
  '0053540A: call [edx+08h]
  '0053540D: mov eax, [ebp-04h]
  '00535410: mov ecx, [ebp-14h]
  '00535413: pop edi
  '00535414: pop esi
  '00535415: mov fs:[00000000h], ecx
  '0053541C: pop ebx
  '0053541D: mov esp, ebp
  '0053541F: pop ebp
  '00535420: retn 001Ch
End Sub
Private Sub Height_535430
  '00535430: push ebp
  '00535431: mov ebp, esp
  '00535433: sub esp, 0000000Ch
  '00535436: push 004081B6h
  '0053543B: mov eax, fs:[00h]
  '00535441: push eax
  '00535442: mov fs:[00000000h], esp
  '00535449: sub esp, 000001C4h
  '0053544F: push ebx
  '00535450: push esi
  '00535451: push edi
  '00535452: mov [ebp-0Ch], esp
  '00535455: mov [ebp-08h], 00407BE8h
  '0053545C: xor ebx, ebx
  '0053545E: mov [ebp-04h], ebx
  '00535461: mov esi, [ebp+08h]
  '00535464: push esi
  '00535465: mov eax, [esi]
  '00535467: call [eax+04h]
  '0053546A: xor ecx, ecx
  '0053546C: xor eax, eax
  '0053546E: mov [ebp-2Ch], ecx
  '00535471: xor edx, edx
  '00535473: mov [ebp-28h], ecx
  '00535476: mov [ebp-78h], eax
  '00535479: mov [ebp-24h], ecx
  '0053547C: lea edi, [ebp-00000098h]
  '00535482: mov [ebp-20h], ecx
  '00535485: mov ecx, 00000008h
  '0053548A: mov [ebp-48h], edx
  '0053548D: mov [ebp-18h], ebx
  '00535490: rep stosd 
  '00535492: mov [ebp-44h], edx
  '00535495: xor ecx, ecx
  '00535497: mov [ebp-40h], edx
  '0053549A: mov [ebp-000000B0h], ecx
  '005354A0: mov [ebp-3Ch], edx
  '005354A3: mov edx, [ebp+0Ch]
  '005354A6: mov [ebp-000000ACh], ecx
  '005354AC: mov [ebp-1Ch], ebx
  '005354AF: mov [ebp-000000A8h], ecx
  '005354B5: mov [edx], ebx
  '005354B7: mov edx, [esi+4Ch]
  '005354BA: mov [ebp-000000A4h], ecx
  '005354C0: lea ecx, [ebp-1Ch]
  '005354C3: mov [ebp-38h], ebx
  '005354C6: mov [ebp-50h], ebx
  '005354C9: mov [ebp-54h], ebx
  '005354CC: mov [ebp-64h], ebx
  '005354CF: mov [ebp-68h], ebx
  '005354D2: mov [ebp-6Ch], ebx
  '005354D5: mov [ebp-70h], ebx
  '005354D8: mov [ebp-74h], eax
  '005354DB: mov [ebp-0000009Ch], ebx
  '005354E1: mov [ebp-000000BCh], ebx
  '005354E7: mov [ebp-000000C0h], ebx
  '005354ED: mov [ebp-000000C4h], ebx
  '005354F3: mov [ebp-000000D0h], ebx
  '005354F9: mov [ebp-000000D8h], ebx
  '005354FF: mov [ebp-000000DCh], ebx
  '00535505: mov [ebp-000000ECh], ebx
  '0053550B: mov [ebp-000000FCh], ebx
  '00535511: mov [ebp-0000010Ch], ebx
  '00535517: mov [ebp-0000011Ch], ebx
  '0053551D: mov [ebp-0000012Ch], ebx
  '00535523: mov [ebp-0000013Ch], ebx
  '00535529: mov [ebp-0000015Ch], ebx
  '0053552F: mov [ebp-0000016Ch], ebx
  '00535535: mov [ebp-00000180h], ebx
  '0053553B: mov [ebp-00000184h], ebx
  '00535541: mov [ebp-00000188h], ebx
  '00535547: mov [ebp-0000018Ch], ebx
  '0053554D: mov [ebp-00000190h], ebx
  '00535553: call [004012D8h]
  '00535559: cmp [esi+52h], bx
  '0053555D: jz 00535679h
  '00535563: mov eax, [ebp-1Ch]
  '00535566: push eax
  '00535567: call [00401044h]
  '0053556D: test eax, eax
  '0053556F: jle 535594h
  '00535571: mov ecx, [ebp-1Ch]
  '00535574: mov edi, [0040108Ch]
  '0053557A: push ecx
  '0053557B: push 0041E5A8h
  '00535580: or ebx, FFFFFFFFh
  '00535583: call edi
  '00535585: mov esi, [00401378h]
  '0053558B: mov edx, eax
  '0053558D: lea ecx, [ebp-1Ch]
  '00535590: call esi
  '00535592: jmp 5355A0h
  '00535594: mov esi, [00401378h]
  '0053559A: mov edi, [0040108Ch]
  '005355A0: lea edx, [ebp-0000013Ch]
  '005355A6: lea ecx, [ebp-000000FCh]
  '005355AC: mov [ebp-00000134h], 0042AF9Ch
  '005355B6: mov [ebp-0000013Ch], 00000008h
  '005355C0: call [00401338h]
  '005355C6: mov edx, [ebp+08h]
  '005355C9: lea ecx, [ebp-000000FCh]
  '005355CF: mov [ebp-000000ECh], 00000004h
  '005355D9: fld real4 ptr [edx+48h]
  '005355DC: fmul real4 ptr [0040739Ch]
  '005355E2: lea edx, [ebp-000000ECh]
  '005355E8: fstp real4 ptr [ebp-000000E4h]
  '005355EE: fstsw ax
  '005355F0: test al, 0Dh
  '005355F2: jnz 005368FBh
  '005355F8: mov eax, [ebp-1Ch]
  '005355FB: push eax
  '005355FC: push 00000001h
  '005355FE: push 00000001h
  '00535600: push ecx
  '00535601: push edx
  '00535602: call [00401394h]
  '00535608: mov edx, eax
  '0053560A: lea ecx, [ebp-000000D8h]
  '00535610: call esi
  '00535612: push eax
  '00535613: call edi
  '00535615: mov edx, eax
  '00535617: lea ecx, [ebp-000000DCh]
  '0053561D: call esi
  '0053561F: push eax
  '00535620: push 0042C8D8h
  '00535625: call edi
  '00535627: mov edx, eax
  '00535629: lea ecx, [ebp-1Ch]
  '0053562C: call esi
  '0053562E: lea eax, [ebp-000000DCh]
  '00535634: lea ecx, [ebp-000000D8h]
  '0053563A: push eax
  '0053563B: push ecx
  '0053563C: push 00000002h
  '0053563E: call [004012E8h]
  '00535644: lea edx, [ebp-000000FCh]
  '0053564A: lea eax, [ebp-000000ECh]
  '00535650: push edx
  '00535651: push eax
  '00535652: push 00000002h
  '00535654: call [00401050h]
  '0053565A: add esp, 00000018h
  '0053565D: test bx, bx
  '00535660: jz 535674h
  '00535662: mov ecx, [ebp-1Ch]
  '00535665: push ecx
  '00535666: push 0041F530h
  '0053566B: call edi
  '0053566D: mov edx, eax
  '0053566F: lea ecx, [ebp-1Ch]
  '00535672: call esi
  '00535674: mov esi, [ebp+08h]
  '00535677: xor ebx, ebx
  '00535679: cmp [esi+50h], bx
  '0053567D: jz 005357AEh
  '00535683: mov edx, [esi+68h]
  '00535686: cmp [esi+34h], bx
  '0053568A: mov [ebp-000000A4h], edx
  '00535690: jz 53570Ah
  '00535692: mov eax, [ebp-1Ch]
  '00535695: mov edi, [00401288h]
  '0053569B: push eax
  '0053569C: call edi
  '0053569E: test eax, eax
  '005356A0: jle 5356FCh
  '005356A2: mov eax, [esi+5Ch]
  '005356A5: lea edx, [ebp-00000184h]
  '005356AB: push edx
  '005356AC: push eax
  '005356AD: mov ecx, [eax]
  '005356AF: call [ecx+54h]
  '005356B2: cmp eax, ebx
  '005356B4: fclex 
  '005356B6: jnl 5356CAh
  '005356B8: mov ecx, [esi+5Ch]
  '005356BB: push 00000054h
  '005356BD: push 0042C8ECh
  '005356C2: push ecx
  '005356C3: push eax
  '005356C4: call [004010A0h]
  '005356CA: mov edx, [ebp-1Ch]
  '005356CD: push edx
  '005356CE: call edi
  '005356D0: mov edx, [ebp-00000184h]
  '005356D6: lea ecx, [ebp-000000B0h]
  '005356DC: push 00000420h
  '005356E1: push ecx
  '005356E2: push FFFFFFFFh
  '005356E4: push eax
  '005356E5: push edx
  '005356E6: mov [ebp-00000188h], eax
  '005356EC: call 0042D124h
  '005356F1: call [0040109Ch]
  '005356F7: jmp 00535781h
  '005356FC: mov eax, [ebp-000000B0h]
  '00535702: mov [ebp-000000A8h], eax
  '00535708: jmp 535787h
  '0053570A: mov eax, [esi+5Ch]
  '0053570D: lea edx, [ebp-00000184h]
  '00535713: push edx
  '00535714: push eax
  '00535715: mov ecx, [eax]
  '00535717: call [ecx+54h]
  '0053571A: cmp eax, ebx
  '0053571C: fclex 
  '0053571E: jnl 535732h
  '00535720: mov ecx, [esi+5Ch]
  '00535723: push 00000054h
  '00535725: push 0042C8ECh
  '0053572A: push ecx
  '0053572B: push eax
  '0053572C: call [004010A0h]
  '00535732: mov eax, [ebp-1Ch]
  '00535735: lea edx, [ebp-000000B0h]
  '0053573B: push 00000420h
  '00535740: push edx
  '00535741: push FFFFFFFFh
  '00535743: lea ecx, [ebp-000000D8h]
  '00535749: push eax
  '0053574A: push ecx
  '0053574B: call [00401330h]
  '00535751: mov edx, [ebp-00000184h]
  '00535757: push eax
  '00535758: push edx
  '00535759: call 00420D24h
  '0053575E: call [0040109Ch]
  '00535764: mov eax, [ebp-000000D8h]
  '0053576A: lea ecx, [ebp-1Ch]
  '0053576D: push eax
  '0053576E: push ecx
  '0053576F: call [00401238h]
  '00535775: lea ecx, [ebp-000000D8h]
  '0053577B: call [004013B4h]
  '00535781: mov eax, [ebp-000000A8h]
  '00535787: sub eax, [ebp-000000B0h]
  '0053578D: jo 00536900h
  '00535793: add eax, 00000004h
  '00535796: jo 00536900h
  '0053579C: mov [esi+60h], eax
  '0053579F: mov esi, [esi+64h]
  '005357A2: cmp eax, esi
  '005357A4: mov [ebp-18h], eax
  '005357A7: jnl 5357B4h
  '005357A9: mov [ebp-18h], esi
  '005357AC: jmp 5357B4h
  '005357AE: mov edx, [esi+60h]
  '005357B1: mov [ebp-18h], edx
  '005357B4: mov ebx, [ebp+08h]
  '005357B7: lea edx, [ebp-00000184h]
  '005357BD: push edx
  '005357BE: mov eax, [ebx+5Ch]
  '005357C1: lea esi, [ebx+5Ch]
  '005357C4: push eax
  '005357C5: mov ecx, [eax]
  '005357C7: call [ecx+38h]
  '005357CA: test eax, eax
  '005357CC: fclex 
  '005357CE: jnl 5357E5h
  '005357D0: mov ecx, [esi]
  '005357D2: mov edi, [004010A0h]
  '005357D8: push 00000038h
  '005357DA: push 0042C8ECh
  '005357DF: push ecx
  '005357E0: push eax
  '005357E1: call edi
  '005357E3: jmp 5357EBh
  '005357E5: mov edi, [004010A0h]
  '005357EB: mov eax, [esi]
  '005357ED: lea ecx, [ebp-00000188h]
  '005357F3: push ecx
  '005357F4: push eax
  '005357F5: mov edx, [eax]
  '005357F7: call [edx+3Ch]
  '005357FA: test eax, eax
  '005357FC: fclex 
  '005357FE: jnl 53580Dh
  '00535800: mov edx, [esi]
  '00535802: push 0000003Ch
  '00535804: push 0042C8ECh
  '00535809: push edx
  '0053580A: push eax
  '0053580B: call edi
  '0053580D: mov ecx, [ebp-18h]
  '00535810: mov edx, [ebp-00000184h]
  '00535816: add ebx, 00000068h
  '00535819: xor eax, eax
  '0053581B: cmp ecx, edx
  '0053581D: mov ecx, [ebx]
  '0053581F: setle al
  '00535822: xor edx, edx
  '00535824: cmp ecx, [ebp-00000188h]
  '0053582A: setle dl
  '0053582D: test eax, edx
  '0053582F: jnz 00535A1Dh
  '00535835: mov eax, [esi]
  '00535837: lea ecx, [ebp-00000184h]
  '0053583D: push ecx
  '0053583E: push eax
  '0053583F: mov edx, [eax]
  '00535841: call [edx+38h]
  '00535844: test eax, eax
  '00535846: fclex 
  '00535848: jnl 535857h
  '0053584A: mov edx, [esi]
  '0053584C: push 00000038h
  '0053584E: push 0042C8ECh
  '00535853: push edx
  '00535854: push eax
  '00535855: call edi
  '00535857: mov eax, [esi]
  '00535859: lea edx, [ebp-00000188h]
  '0053585F: push edx
  '00535860: push eax
  '00535861: mov ecx, [eax]
  '00535863: call [ecx+38h]
  '00535866: test eax, eax
  '00535868: fclex 
  '0053586A: jnl 535879h
  '0053586C: mov ecx, [esi]
  '0053586E: push 00000038h
  '00535870: push 0042C8ECh
  '00535875: push ecx
  '00535876: push eax
  '00535877: call edi
  '00535879: mov edx, [ebp-00000188h]
  '0053587F: mov edi, [ebp-00000184h]
  '00535885: mov [ebp-000000E4h], edx
  '0053588B: mov edx, [ebp-18h]
  '0053588E: xor ecx, ecx
  '00535890: cmp edx, edi
  '00535892: setnle cl
  '00535895: lea eax, [ebp-18h]
  '00535898: mov edi, [004012DCh]
  '0053589E: neg ecx
  '005358A0: mov [ebp-00000134h], eax
  '005358A6: mov [ebp-00000124h], cx
  '005358AD: lea eax, [ebp-000000ECh]
  '005358B3: lea ecx, [ebp-0000013Ch]
  '005358B9: push eax
  '005358BA: lea edx, [ebp-0000012Ch]
  '005358C0: push ecx
  '005358C1: lea eax, [ebp-000000FCh]
  '005358C7: push edx
  '005358C8: push eax
  '005358C9: mov [ebp-000000ECh], 00000003h
  '005358D3: mov [ebp-0000013Ch], 00004003h
  '005358DD: mov [ebp-0000012Ch], 0000000Bh
  '005358E7: call edi
  '005358E9: mov eax, [esi]
  '005358EB: lea edx, [ebp-0000018Ch]
  '005358F1: push edx
  '005358F2: push eax
  '005358F3: mov ecx, [eax]
  '005358F5: call [ecx+3Ch]
  '005358F8: test eax, eax
  '005358FA: fclex 
  '005358FC: jnl 53590Fh
  '005358FE: mov ecx, [esi]
  '00535900: push 0000003Ch
  '00535902: push 0042C8ECh
  '00535907: push ecx
  '00535908: push eax
  '00535909: call [004010A0h]
  '0053590F: mov eax, [esi]
  '00535911: lea ecx, [ebp-00000190h]
  '00535917: push ecx
  '00535918: push eax
  '00535919: mov edx, [eax]
  '0053591B: call [edx+3Ch]
  '0053591E: test eax, eax
  '00535920: fclex 
  '00535922: jnl 535935h
  '00535924: mov edx, [esi]
  '00535926: push 0000003Ch
  '00535928: push 0042C8ECh
  '0053592D: push edx
  '0053592E: push eax
  '0053592F: call [004010A0h]
  '00535935: mov edx, [ebx]
  '00535937: mov eax, [ebp-00000190h]
  '0053593D: mov [ebp-00000164h], ebx
  '00535943: mov ebx, [ebp-0000018Ch]
  '00535949: xor ecx, ecx
  '0053594B: cmp edx, ebx
  '0053594D: setnle cl
  '00535950: neg ecx
  '00535952: mov [ebp-00000104h], eax
  '00535958: mov [ebp-00000154h], cx
  '0053595F: lea eax, [ebp-0000010Ch]
  '00535965: lea ecx, [ebp-0000016Ch]
  '0053596B: push eax
  '0053596C: lea edx, [ebp-0000015Ch]
  '00535972: push ecx
  '00535973: lea eax, [ebp-0000011Ch]
  '00535979: push edx
  '0053597A: push eax
  '0053597B: mov [ebp-0000010Ch], 00000003h
  '00535985: mov [ebp-0000016Ch], 00004003h
  '0053598F: mov [ebp-0000015Ch], 0000000Bh
  '00535999: call edi
  '0053599B: mov ecx, [esi]
  '0053599D: mov edi, [0040130Ch]
  '005359A3: lea edx, [ebp-00000180h]
  '005359A9: lea eax, [ebp-0000011Ch]
  '005359AF: mov ebx, [ecx]
  '005359B1: push edx
  '005359B2: push eax
  '005359B3: call edi
  '005359B5: lea ecx, [ebp-000000FCh]
  '005359BB: push eax
  '005359BC: push ecx
  '005359BD: call edi
  '005359BF: mov edx, [esi]
  '005359C1: push eax
  '005359C2: push edx
  '005359C3: call [ebx+30h]
  '005359C6: test eax, eax
  '005359C8: fclex 
  '005359CA: jnl 5359DDh
  '005359CC: mov ecx, [esi]
  '005359CE: push 00000030h
  '005359D0: push 0042C8ECh
  '005359D5: push ecx
  '005359D6: push eax
  '005359D7: call [004010A0h]
  '005359DD: lea edx, [ebp-0000011Ch]
  '005359E3: lea eax, [ebp-000000FCh]
  '005359E9: push edx
  '005359EA: lea ecx, [ebp-0000010Ch]
  '005359F0: push eax
  '005359F1: lea edx, [ebp-0000015Ch]
  '005359F7: push ecx
  '005359F8: lea eax, [ebp-000000ECh]
  '005359FE: push edx
  '005359FF: lea ecx, [ebp-0000012Ch]
  '00535A05: push eax
  '00535A06: push ecx
  '00535A07: push 00000006h
  '00535A09: call [00401050h]
  '00535A0F: mov eax, [ebp+08h]
  '00535A12: mov ebx, [0040109Ch]
  '00535A18: add esp, 0000001Ch
  '00535A1B: jmp 535A26h
  '00535A1D: mov ebx, [0040109Ch]
  '00535A23: mov eax, [ebp+08h]
  '00535A26: mov edx, [ebp-18h]
  '00535A29: lea edi, [ebp-00000188h]
  '00535A2F: mov [ebp-000000A8h], edx
  '00535A35: mov edx, [eax+68h]
  '00535A38: push edi
  '00535A39: lea edi, [ebp-00000184h]
  '00535A3F: xor ecx, ecx
  '00535A41: mov [ebp-000000A4h], edx
  '00535A47: mov edx, [eax]
  '00535A49: push edi
  '00535A4A: push ecx
  '00535A4B: push eax
  '00535A4C: mov [ebp-000000B0h], ecx
  '00535A52: mov [ebp-000000ACh], ecx
  '00535A58: mov [ebp-00000184h], ecx
  '00535A5E: call [edx+00000088h]
  '00535A64: mov eax, [ebp-00000188h]
  '00535A6A: push eax
  '00535A6B: call 00420A8Ch
  '00535A70: mov [ebp-0000018Ch], eax
  '00535A76: call ebx
  '00535A78: mov eax, [esi]
  '00535A7A: mov edi, [ebp-0000018Ch]
  '00535A80: lea edx, [ebp-00000184h]
  '00535A86: mov ecx, [eax]
  '00535A88: push edx
  '00535A89: push eax
  '00535A8A: call [ecx+54h]
  '00535A8D: test eax, eax
  '00535A8F: fclex 
  '00535A91: jnl 535AA4h
  '00535A93: mov ecx, [esi]
  '00535A95: push 00000054h
  '00535A97: push 0042C8ECh
  '00535A9C: push ecx
  '00535A9D: push eax
  '00535A9E: call [004010A0h]
  '00535AA4: mov eax, [ebp-00000184h]
  '00535AAA: lea edx, [ebp-000000B0h]
  '00535AB0: push edi
  '00535AB1: push edx
  '00535AB2: push eax
  '00535AB3: call 00420A34h
  '00535AB8: call ebx
  '00535ABA: push edi
  '00535ABB: call 00420C34h
  '00535AC0: call ebx
  '00535AC2: push 00646464h
  '00535AC7: push 00000001h
  '00535AC9: push 00000000h
  '00535ACB: call 00427318h
  '00535AD0: mov [ebp-00000184h], eax
  '00535AD6: call ebx
  '00535AD8: mov eax, [esi]
  '00535ADA: mov edi, [ebp-00000184h]
  '00535AE0: lea edx, [ebp-00000184h]
  '00535AE6: mov ecx, [eax]
  '00535AE8: push edx
  '00535AE9: push eax
  '00535AEA: call [ecx+54h]
  '00535AED: test eax, eax
  '00535AEF: fclex 
  '00535AF1: jnl 535B04h
  '00535AF3: mov ecx, [esi]
  '00535AF5: push 00000054h
  '00535AF7: push 0042C8ECh
  '00535AFC: push ecx
  '00535AFD: push eax
  '00535AFE: call [004010A0h]
  '00535B04: mov edx, [ebp-00000184h]
  '00535B0A: push edi
  '00535B0B: push edx
  '00535B0C: call 00420BECh
  '00535B11: mov [ebp-00000188h], eax
  '00535B17: call [0040109Ch]
  '00535B1D: mov eax, [esi]
  '00535B1F: mov ebx, [ebp-00000188h]
  '00535B25: lea edx, [ebp-00000184h]
  '00535B2B: mov ecx, [eax]
  '00535B2D: push edx
  '00535B2E: push eax
  '00535B2F: call [ecx+54h]
  '00535B32: test eax, eax
  '00535B34: fclex 
  '00535B36: jnl 535B49h
  '00535B38: mov ecx, [esi]
  '00535B3A: push 00000054h
  '00535B3C: push 0042C8ECh
  '00535B41: push ecx
  '00535B42: push eax
  '00535B43: call [004010A0h]
  '00535B49: mov eax, [ebp-000000ACh]
  '00535B4F: mov ecx, [ebp-000000B0h]
  '00535B55: lea edx, [ebp-78h]
  '00535B58: push edx
  '00535B59: mov edx, [ebp-00000184h]
  '00535B5F: push eax
  '00535B60: push ecx
  '00535B61: push edx
  '00535B62: call 0042735Ch
  '00535B67: call [0040109Ch]
  '00535B6D: mov eax, [esi]
  '00535B6F: lea edx, [ebp-00000184h]
  '00535B75: push edx
  '00535B76: push eax
  '00535B77: mov ecx, [eax]
  '00535B79: call [ecx+54h]
  '00535B7C: test eax, eax
  '00535B7E: fclex 
  '00535B80: jnl 535B93h
  '00535B82: mov ecx, [esi]
  '00535B84: push 00000054h
  '00535B86: push 0042C8ECh
  '00535B8B: push ecx
  '00535B8C: push eax
  '00535B8D: call [004010A0h]
  '00535B93: mov eax, [ebp-000000A8h]
  '00535B99: mov edx, [ebp-000000ACh]
  '00535B9F: mov ecx, [ebp-00000184h]
  '00535BA5: sub eax, 00000001h
  '00535BA8: push edx
  '00535BA9: jo 00536900h
  '00535BAF: push eax
  '00535BB0: push ecx
  '00535BB1: call 0042739Ch
  '00535BB6: call [0040109Ch]
  '00535BBC: mov eax, [esi]
  '00535BBE: lea ecx, [ebp-00000184h]
  '00535BC4: push ecx
  '00535BC5: push eax
  '00535BC6: mov edx, [eax]
  '00535BC8: call [edx+54h]
  '00535BCB: test eax, eax
  '00535BCD: fclex 
  '00535BCF: jnl 535BE2h
  '00535BD1: mov edx, [esi]
  '00535BD3: push 00000054h
  '00535BD5: push 0042C8ECh
  '00535BDA: push edx
  '00535BDB: push eax
  '00535BDC: call [004010A0h]
  '00535BE2: mov eax, [ebp-000000A4h]
  '00535BE8: mov ecx, [ebp-000000A8h]
  '00535BEE: mov edx, [ebp-00000184h]
  '00535BF4: sub eax, 00000001h
  '00535BF7: jo 00536900h
  '00535BFD: sub ecx, 00000001h
  '00535C00: push eax
  '00535C01: jo 00536900h
  '00535C07: push ecx
  '00535C08: push edx
  '00535C09: call 0042739Ch
  '00535C0E: call [0040109Ch]
  '00535C14: mov eax, [esi]
  '00535C16: lea edx, [ebp-00000184h]
  '00535C1C: push edx
  '00535C1D: push eax
  '00535C1E: mov ecx, [eax]
  '00535C20: call [ecx+54h]
  '00535C23: test eax, eax
  '00535C25: fclex 
  '00535C27: jnl 535C3Ah
  '00535C29: mov ecx, [esi]
  '00535C2B: push 00000054h
  '00535C2D: push 0042C8ECh
  '00535C32: push ecx
  '00535C33: push eax
  '00535C34: call [004010A0h]
  '00535C3A: mov edx, [ebp-000000A4h]
  '00535C40: mov eax, [ebp-000000B0h]
  '00535C46: mov ecx, [ebp-00000184h]
  '00535C4C: sub edx, 00000001h
  '00535C4F: jo 00536900h
  '00535C55: push edx
  '00535C56: push eax
  '00535C57: push ecx
  '00535C58: call 0042739Ch
  '00535C5D: call [0040109Ch]
  '00535C63: mov eax, [esi]
  '00535C65: lea ecx, [ebp-00000184h]
  '00535C6B: push ecx
  '00535C6C: push eax
  '00535C6D: mov edx, [eax]
  '00535C6F: call [edx+54h]
  '00535C72: test eax, eax
  '00535C74: fclex 
  '00535C76: jnl 535C89h
  '00535C78: mov edx, [esi]
  '00535C7A: push 00000054h
  '00535C7C: push 0042C8ECh
  '00535C81: push edx
  '00535C82: push eax
  '00535C83: call [004010A0h]
  '00535C89: mov eax, [ebp-000000ACh]
  '00535C8F: mov ecx, [ebp-000000B0h]
  '00535C95: mov edx, [ebp-00000184h]
  '00535C9B: push eax
  '00535C9C: push ecx
  '00535C9D: push edx
  '00535C9E: call 0042739Ch
  '00535CA3: call [0040109Ch]
  '00535CA9: mov eax, [esi]
  '00535CAB: lea edx, [ebp-00000184h]
  '00535CB1: push edx
  '00535CB2: push eax
  '00535CB3: mov ecx, [eax]
  '00535CB5: call [ecx+54h]
  '00535CB8: test eax, eax
  '00535CBA: fclex 
  '00535CBC: jnl 535CCFh
  '00535CBE: mov ecx, [esi]
  '00535CC0: push 00000054h
  '00535CC2: push 0042C8ECh
  '00535CC7: push ecx
  '00535CC8: push eax
  '00535CC9: call [004010A0h]
  '00535CCF: mov edx, [ebp-00000184h]
  '00535CD5: push ebx
  '00535CD6: push edx
  '00535CD7: call 00420BECh
  '00535CDC: mov ebx, [0040109Ch]
  '00535CE2: call ebx
  '00535CE4: push edi
  '00535CE5: call 00420C34h
  '00535CEA: call ebx
  '00535CEC: mov edi, [00401084h]
  '00535CF2: lea eax, [ebp-000000B0h]
  '00535CF8: lea ecx, [ebp-48h]
  '00535CFB: push eax
  '00535CFC: push ecx
  '00535CFD: push 00000010h
  '00535CFF: call edi
  '00535D01: mov edx, [ebp-48h]
  '00535D04: mov eax, [ebp-44h]
  '00535D07: mov ecx, [ebp-40h]
  '00535D0A: add edx, 00000002h
  '00535D0D: jo 00536900h
  '00535D13: add eax, 00000002h
  '00535D16: mov [ebp-48h], edx
  '00535D19: mov edx, [ebp-3Ch]
  '00535D1C: jo 00536900h
  '00535D22: sub ecx, 00000001h
  '00535D25: mov [ebp-44h], eax
  '00535D28: jo 00536900h
  '00535D2E: mov [ebp-40h], ecx
  '00535D31: lea eax, [ebp-48h]
  '00535D34: lea ecx, [ebp-2Ch]
  '00535D37: sub edx, 00000002h
  '00535D3A: push eax
  '00535D3B: push ecx
  '00535D3C: jo 00536900h
  '00535D42: push 00000010h
  '00535D44: mov [ebp-3Ch], edx
  '00535D47: call edi
  '00535D49: mov edx, [ebp-40h]
  '00535D4C: mov eax, [ebp-48h]
  '00535D4F: sub edx, eax
  '00535D51: mov eax, [ebp+08h]
  '00535D54: jo 00536900h
  '00535D5A: add edx, 00000001h
  '00535D5D: jo 00536900h
  '00535D63: mov [ebp-000001C8h], edx
  '00535D69: fild dword ptr [ebp-000001C8h]
  '00535D6F: fstp real8 ptr [ebp-000001D0h]
  '00535D75: fld real4 ptr [eax+48h]
  '00535D78: fmul real8 ptr [ebp-000001D0h]
  '00535D7E: fstsw ax
  '00535D80: test al, 0Dh
  '00535D82: jnz 005368FBh
  '00535D88: call [0040135Ch]
  '00535D8E: mov [ebp-24h], eax
  '00535D91: mov eax, [esi]
  '00535D93: lea edx, [ebp-00000184h]
  '00535D99: mov ecx, [eax]
  '00535D9B: push edx
  '00535D9C: push eax
  '00535D9D: call [ecx+54h]
  '00535DA0: test eax, eax
  '00535DA2: fclex 
  '00535DA4: jnl 535DB7h
  '00535DA6: mov ecx, [esi]
  '00535DA8: push 00000054h
  '00535DAA: push 0042C8ECh
  '00535DAF: push ecx
  '00535DB0: push eax
  '00535DB1: call [004010A0h]
  '00535DB7: mov eax, [ebp+08h]
  '00535DBA: push 00000000h
  '00535DBC: push 00646464h
  '00535DC1: lea ecx, [ebp-2Ch]
  '00535DC4: mov edx, [eax]
  '00535DC6: push 00000000h
  '00535DC8: push ecx
  '00535DC9: mov ecx, [ebp-00000184h]
  '00535DCF: push ecx
  '00535DD0: push eax
  '00535DD1: call [edx+00000090h]
  '00535DD7: mov edx, [ebp-1Ch]
  '00535DDA: push edx
  '00535DDB: call [00401044h]
  '00535DE1: test eax, eax
  '00535DE3: jle 005361D8h
  '00535DE9: mov eax, [ebp-38h]
  '00535DEC: test eax, eax
  '00535DEE: jnz 535E06h
  '00535DF0: mov ebx, [004012B8h]
  '00535DF6: lea eax, [ebp-38h]
  '00535DF9: push eax
  '00535DFA: push 004099F4h
  '00535DFF: call ebx
  '00535E01: mov eax, [ebp-38h]
  '00535E04: jmp 535E0Ch
  '00535E06: mov ebx, [004012B8h]
  '00535E0C: lea edx, [ebp-00000180h]
  '00535E12: mov ecx, [eax]
  '00535E14: push edx
  '00535E15: mov edx, [ebp-3Ch]
  '00535E18: sub edx, [ebp-44h]
  '00535E1B: mov edi, eax
  '00535E1D: jo 00536900h
  '00535E23: push edx
  '00535E24: mov edx, [ebp-40h]
  '00535E27: sub edx, [ebp-48h]
  '00535E2A: jo 00536900h
  '00535E30: push edx
  '00535E31: push eax
  '00535E32: call [ecx+30h]
  '00535E35: test eax, eax
  '00535E37: fclex 
  '00535E39: jnl 535E4Ah
  '00535E3B: push 00000030h
  '00535E3D: push 0042C8ECh
  '00535E42: push edi
  '00535E43: push eax
  '00535E44: call [004010A0h]
  '00535E4A: mov eax, [ebp-38h]
  '00535E4D: test eax, eax
  '00535E4F: jnz 535E5Fh
  '00535E51: lea eax, [ebp-38h]
  '00535E54: push eax
  '00535E55: push 004099F4h
  '00535E5A: call ebx
  '00535E5C: mov eax, [ebp-38h]
  '00535E5F: mov ecx, [eax]
  '00535E61: push 00000000h
  '00535E63: push eax
  '00535E64: mov edi, eax
  '00535E66: call [ecx+60h]
  '00535E69: test eax, eax
  '00535E6B: fclex 
  '00535E6D: jnl 535E7Eh
  '00535E6F: push 00000060h
  '00535E71: push 0042C8ECh
  '00535E76: push edi
  '00535E77: push eax
  '00535E78: call [004010A0h]
  '00535E7E: mov eax, [ebp-38h]
  '00535E81: test eax, eax
  '00535E83: jnz 535E93h
  '00535E85: lea edx, [ebp-38h]
  '00535E88: push edx
  '00535E89: push 004099F4h
  '00535E8E: call ebx
  '00535E90: mov eax, [ebp-38h]
  '00535E93: mov ecx, [eax]
  '00535E95: lea edx, [ebp-00000184h]
  '00535E9B: push edx
  '00535E9C: push eax
  '00535E9D: mov edi, eax
  '00535E9F: call [ecx+54h]
  '00535EA2: test eax, eax
  '00535EA4: fclex 
  '00535EA6: jnl 535EB7h
  '00535EA8: push 00000054h
  '00535EAA: push 0042C8ECh
  '00535EAF: push edi
  '00535EB0: push eax
  '00535EB1: call [004010A0h]
  '00535EB7: mov eax, [ebp-00000184h]
  '00535EBD: push 00000001h
  '00535EBF: push eax
  '00535EC0: call 0042D09Ch
  '00535EC5: mov ebx, [0040109Ch]
  '00535ECB: call ebx
  '00535ECD: mov eax, [ebp-38h]
  '00535ED0: test eax, eax
  '00535ED2: jnz 535EE6h
  '00535ED4: lea ecx, [ebp-38h]
  '00535ED7: push ecx
  '00535ED8: push 004099F4h
  '00535EDD: call [004012B8h]
  '00535EE3: mov eax, [ebp-38h]
  '00535EE6: mov edx, [eax]
  '00535EE8: lea ecx, [ebp-00000184h]
  '00535EEE: push ecx
  '00535EEF: push eax
  '00535EF0: mov edi, eax
  '00535EF2: call [edx+54h]
  '00535EF5: test eax, eax
  '00535EF7: fclex 
  '00535EF9: jnl 535F0Ah
  '00535EFB: push 00000054h
  '00535EFD: push 0042C8ECh
  '00535F02: push edi
  '00535F03: push eax
  '00535F04: call [004010A0h]
  '00535F0A: mov edx, [ebp-00000184h]
  '00535F10: push 00FFFFFFh
  '00535F15: push edx
  '00535F16: call 004276F0h
  '00535F1B: call ebx
  '00535F1D: mov eax, [ebp-38h]
  '00535F20: test eax, eax
  '00535F22: jnz 535F36h
  '00535F24: lea eax, [ebp-38h]
  '00535F27: push eax
  '00535F28: push 004099F4h
  '00535F2D: call [004012B8h]
  '00535F33: mov eax, [ebp-38h]
  '00535F36: mov ecx, [eax]
  '00535F38: lea edx, [ebp-00000184h]
  '00535F3E: push edx
  '00535F3F: push eax
  '00535F40: mov edi, eax
  '00535F42: call [ecx+54h]
  '00535F45: test eax, eax
  '00535F47: fclex 
  '00535F49: jnl 535F5Ah
  '00535F4B: push 00000054h
  '00535F4D: push 0042C8ECh
  '00535F52: push edi
  '00535F53: push eax
  '00535F54: call [004010A0h]
  '00535F5A: mov edi, [ebp+08h]
  '00535F5D: lea edx, [ebp-00000188h]
  '00535F63: push edx
  '00535F64: mov eax, [edi+58h]
  '00535F67: push eax
  '00535F68: mov ecx, [eax]
  '00535F6A: call [ecx+4Ch]
  '00535F6D: test eax, eax
  '00535F6F: fclex 
  '00535F71: jnl 535F85h
  '00535F73: mov ecx, [edi+58h]
  '00535F76: push 0000004Ch
  '00535F78: push 0042CE38h
  '00535F7D: push ecx
  '00535F7E: push eax
  '00535F7F: call [004010A0h]
  '00535F85: mov edx, [ebp-00000188h]
  '00535F8B: mov eax, [ebp-00000184h]
  '00535F91: push edx
  '00535F92: push eax
  '00535F93: call 00420BECh
  '00535F98: mov [ebp-0000018Ch], eax
  '00535F9E: call [0040109Ch]
  '00535FA4: mov ecx, [ebp+08h]
  '00535FA7: mov ebx, [ebp-0000018Ch]
  '00535FAD: mov eax, [ebp-38h]
  '00535FB0: cmp word ptr [ecx+34h], 0000h
  '00535FB5: jz 536021h
  '00535FB7: test eax, eax
  '00535FB9: jnz 535FCDh
  '00535FBB: lea edx, [ebp-38h]
  '00535FBE: push edx
  '00535FBF: push 004099F4h
  '00535FC4: call [004012B8h]
  '00535FCA: mov eax, [ebp-38h]
  '00535FCD: mov ecx, [eax]
  '00535FCF: lea edx, [ebp-00000184h]
  '00535FD5: push edx
  '00535FD6: push eax
  '00535FD7: mov edi, eax
  '00535FD9: call [ecx+54h]
  '00535FDC: test eax, eax
  '00535FDE: fclex 
  '00535FE0: jnl 535FF1h
  '00535FE2: push 00000054h
  '00535FE4: push 0042C8ECh
  '00535FE9: push edi
  '00535FEA: push eax
  '00535FEB: call [004010A0h]
  '00535FF1: mov eax, [ebp-1Ch]
  '00535FF4: push eax
  '00535FF5: call [00401288h]
  '00535FFB: mov edx, [ebp-00000184h]
  '00536001: lea ecx, [ebp-48h]
  '00536004: push 00000025h
  '00536006: push ecx
  '00536007: push FFFFFFFFh
  '00536009: push eax
  '0053600A: push edx
  '0053600B: mov [ebp-00000188h], eax
  '00536011: call 0042D124h
  '00536016: call [0040109Ch]
  '0053601C: jmp 005360A4h
  '00536021: test eax, eax
  '00536023: jnz 536037h
  '00536025: lea eax, [ebp-38h]
  '00536028: push eax
  '00536029: push 004099F4h
  '0053602E: call [004012B8h]
  '00536034: mov eax, [ebp-38h]
  '00536037: mov ecx, [eax]
  '00536039: lea edx, [ebp-00000184h]
  '0053603F: push edx
  '00536040: push eax
  '00536041: mov edi, eax
  '00536043: call [ecx+54h]
  '00536046: test eax, eax
  '00536048: fclex 
  '0053604A: jnl 53605Bh
  '0053604C: push 00000054h
  '0053604E: push 0042C8ECh
  '00536053: push edi
  '00536054: push eax
  '00536055: call [004010A0h]
  '0053605B: mov ecx, [ebp-1Ch]
  '0053605E: lea eax, [ebp-48h]
  '00536061: push 00000025h
  '00536063: push eax
  '00536064: push FFFFFFFFh
  '00536066: lea edx, [ebp-000000D8h]
  '0053606C: push ecx
  '0053606D: push edx
  '0053606E: call [00401330h]
  '00536074: push eax
  '00536075: mov eax, [ebp-00000184h]
  '0053607B: push eax
  '0053607C: call 00420D24h
  '00536081: call [0040109Ch]
  '00536087: mov ecx, [ebp-000000D8h]
  '0053608D: lea edx, [ebp-1Ch]
  '00536090: push ecx
  '00536091: push edx
  '00536092: call [00401238h]
  '00536098: lea ecx, [ebp-000000D8h]
  '0053609E: call [004013B4h]
  '005360A4: mov eax, [ebp-38h]
  '005360A7: test eax, eax
  '005360A9: jnz 5360BDh
  '005360AB: lea eax, [ebp-38h]
  '005360AE: push eax
  '005360AF: push 004099F4h
  '005360B4: call [004012B8h]
  '005360BA: mov eax, [ebp-38h]
  '005360BD: mov ecx, [eax]
  '005360BF: lea edx, [ebp-00000184h]
  '005360C5: push edx
  '005360C6: push eax
  '005360C7: mov edi, eax
  '005360C9: call [ecx+54h]
  '005360CC: test eax, eax
  '005360CE: fclex 
  '005360D0: jnl 5360E1h
  '005360D2: push 00000054h
  '005360D4: push 0042C8ECh
  '005360D9: push edi
  '005360DA: push eax
  '005360DB: call [004010A0h]
  '005360E1: mov eax, [ebp-00000184h]
  '005360E7: push ebx
  '005360E8: push eax
  '005360E9: call 00420BECh
  '005360EE: call [0040109Ch]
  '005360F4: mov ecx, [ebp+08h]
  '005360F7: cmp word ptr [ecx+38h], 0000h
  '005360FC: jz 53615Fh
  '005360FE: mov edi, [ebp-38h]
  '00536101: test edi, edi
  '00536103: jnz 53612Ah
  '00536105: lea edx, [ebp-38h]
  '00536108: push edx
  '00536109: push 004099F4h
  '0053610E: call [004012B8h]
  '00536114: mov edi, [ebp-38h]
  '00536117: test edi, edi
  '00536119: jnz 53612Ah
  '0053611B: lea eax, [ebp-38h]
  '0053611E: push eax
  '0053611F: push 004099F4h
  '00536124: call [004012B8h]
  '0053612A: mov ecx, [edi]
  '0053612C: push 00000080h
  '00536131: push FFFFFFFFh
  '00536133: push FFFFFFFFh
  '00536135: push 00000001h
  '00536137: lea edx, [ebp-38h]
  '0053613A: push 00000001h
  '0053613C: push edx
  '0053613D: push esi
  '0053613E: push edi
  '0053613F: call [ecx+50h]
  '00536142: test eax, eax
  '00536144: fclex 
  '00536146: jnl 005361D8h
  '0053614C: mov ebx, [004010A0h]
  '00536152: push 00000050h
  '00536154: push 0042C8ECh
  '00536159: push edi
  '0053615A: push eax
  '0053615B: call ebx
  '0053615D: jmp 5360DEh
  '0053615F: mov eax, [esi]
  '00536161: lea edx, [ebp-00000184h]
  '00536167: push edx
  '00536168: push eax
  '00536169: mov ecx, [eax]
  '0053616B: call [ecx+54h]
  '0053616E: test eax, eax
  '00536170: fclex 
  '00536172: jnl 536185h
  '00536174: mov ecx, [esi]
  '00536176: push 00000054h
  '00536178: push 0042C8ECh
  '0053617D: push ecx
  '0053617E: push eax
  '0053617F: call [004010A0h]
  '00536185: mov edi, [ebp-38h]
  '00536188: test edi, edi
  '0053618A: jnz 53619Eh
  '0053618C: lea edx, [ebp-38h]
  '0053618F: push edx
  '00536190: push 004099F4h
  '00536195: call [004012B8h]
  '0053619B: mov edi, [ebp-38h]
  '0053619E: mov ebx, [edi]
  '005361A0: mov ecx, 00000080h
  '005361A5: call [00401208h]
  '005361AB: push eax
  '005361AC: mov eax, [ebp-00000184h]
  '005361B2: push 00000000h
  '005361B4: push 00000000h
  '005361B6: push FFFFFFFFh
  '005361B8: push FFFFFFFFh
  '005361BA: push 00000001h
  '005361BC: push 00000001h
  '005361BE: push eax
  '005361BF: push edi
  '005361C0: call [ebx+4Ch]
  '005361C3: test eax, eax
  '005361C5: fclex 
  '005361C7: jnl 5361D8h
  '005361C9: push 0000004Ch
  '005361CB: push 0042C8ECh
  '005361D0: push edi
  '005361D1: push eax
  '005361D2: call [004010A0h]
  '005361D8: mov ebx, [004010A0h]
  '005361DE: mov edi, [ebp+08h]
  '005361E1: lea edx, [ebp-00000188h]
  '005361E7: push edx
  '005361E8: lea eax, [ebp-00000184h]
  '005361EE: mov edx, [edi+54h]
  '005361F1: mov ecx, [edi]
  '005361F3: push eax
  '005361F4: push edx
  '005361F5: push edi
  '005361F6: mov [ebp-00000184h], 00000000h
  '00536200: call [ecx+00000088h]
  '00536206: lea edx, [ebp-000000C4h]
  '0053620C: lea eax, [ebp-70h]
  '0053620F: push edx
  '00536210: push eax
  '00536211: xor eax, eax
  '00536213: lea edx, [ebp-50h]
  '00536216: mov al, [ebp-00000186h]
  '0053621C: mov ecx, [edi]
  '0053621E: push edx
  '0053621F: push eax
  '00536220: mov eax, [ebp-00000188h]
  '00536226: xor edx, edx
  '00536228: mov dl, ah
  '0053622A: and eax, 000000FFh
  '0053622F: push edx
  '00536230: push eax
  '00536231: push edi
  '00536232: call [ecx+0000009Ch]
  '00536238: mov eax, [esi]
  '0053623A: lea edx, [ebp-00000184h]
  '00536240: mov [ebp-00000094h], 00000001h
  '0053624A: mov word ptr [ebp-00000098h], 0002h
  '00536253: mov [ebp-00000084h], 00000000h
  '0053625D: mov ecx, [eax]
  '0053625F: push edx
  '00536260: push eax
  '00536261: call [ecx+3Ch]
  '00536264: test eax, eax
  '00536266: fclex 
  '00536268: jnl 536277h
  '0053626A: mov ecx, [esi]
  '0053626C: push 0000003Ch
  '0053626E: push 0042C8ECh
  '00536273: push ecx
  '00536274: push eax
  '00536275: call ebx
  '00536277: mov edx, [ebp-00000184h]
  '0053627D: mov eax, [esi]
  '0053627F: mov [ebp-00000088h], edx
  '00536285: lea edx, [ebp-00000184h]
  '0053628B: mov [ebp-7Ch], 00000000h
  '00536292: mov ecx, [eax]
  '00536294: push edx
  '00536295: push eax
  '00536296: call [ecx+34h]
  '00536299: test eax, eax
  '0053629B: fclex 
  '0053629D: jnl 5362ACh
  '0053629F: mov ecx, [esi]
  '005362A1: push 00000034h
  '005362A3: push 0042C8ECh
  '005362A8: push ecx
  '005362A9: push eax
  '005362AA: call ebx
  '005362AC: mov edx, [ebp-00000184h]
  '005362B2: mov eax, [esi]
  '005362B4: mov [ebp-80h], edx
  '005362B7: lea edx, [ebp-00000184h]
  '005362BD: mov ecx, [eax]
  '005362BF: push edx
  '005362C0: push eax
  '005362C1: call [ecx+5Ch]
  '005362C4: test eax, eax
  '005362C6: fclex 
  '005362C8: jnl 5362D7h
  '005362CA: mov ecx, [esi]
  '005362CC: push 0000005Ch
  '005362CE: push 0042C8ECh
  '005362D3: push ecx
  '005362D4: push eax
  '005362D5: call ebx
  '005362D7: mov edx, [ebp-00000184h]
  '005362DD: lea eax, [ebp-000000D0h]
  '005362E3: push eax
  '005362E4: mov [ebp-0000008Ch], edx
  '005362EA: call 0042C914h
  '005362EF: mov [ebp-00000184h], eax
  '005362F5: call [0040109Ch]
  '005362FB: lea ecx, [ebp-00000098h]
  '00536301: push ecx
  '00536302: call [00401288h]
  '00536308: mov [ebp-0000018Ch], eax
  '0053630E: mov [ebp-00000188h], eax
  '00536314: mov eax, [ebp-00000184h]
  '0053631A: lea edx, [ebp-00000188h]
  '00536320: push 00000004h
  '00536322: push edx
  '00536323: push eax
  '00536324: call 0041D584h
  '00536329: call [0040109Ch]
  '0053632F: mov eax, [esi]
  '00536331: lea edx, [ebp-00000184h]
  '00536337: push edx
  '00536338: push eax
  '00536339: mov ecx, [eax]
  '0053633B: call [ecx+34h]
  '0053633E: test eax, eax
  '00536340: fclex 
  '00536342: jnl 536351h
  '00536344: mov ecx, [esi]
  '00536346: push 00000034h
  '00536348: push 0042C8ECh
  '0053634D: push ecx
  '0053634E: push eax
  '0053634F: call ebx
  '00536351: mov esi, [ebp-00000184h]
  '00536357: mov [ebp-000000CCh], 00000000h
  '00536361: sub esi, 00000001h
  '00536364: jo 00536900h
  '0053636A: mov [ebp-000001B4h], esi
  '00536370: cmp [ebp-000000CCh], esi
  '00536376: jnle 00536810h
  '0053637C: mov eax, [edi+5Ch]
  '0053637F: lea ecx, [ebp-00000184h]
  '00536385: push ecx
  '00536386: push eax
  '00536387: mov edx, [eax]
  '00536389: call [edx+3Ch]
  '0053638C: test eax, eax
  '0053638E: fclex 
  '00536390: jnl 5363A0h
  '00536392: mov edx, [edi+5Ch]
  '00536395: push 0000003Ch
  '00536397: push 0042C8ECh
  '0053639C: push edx
  '0053639D: push eax
  '0053639E: call ebx
  '005363A0: mov eax, [ebp-00000184h]
  '005363A6: mov [ebp-000000B8h], 00000000h
  '005363B0: sub eax, 00000001h
  '005363B3: jo 00536900h
  '005363B9: mov [ebp-000001BCh], eax
  '005363BF: cmp [ebp-000000B8h], eax
  '005363C5: jnle 005367F2h
  '005363CB: mov esi, [ebp+08h]
  '005363CE: lea edx, [ebp-00000184h]
  '005363D4: push edx
  '005363D5: xor edi, edi
  '005363D7: mov eax, [esi+5Ch]
  '005363DA: push eax
  '005363DB: mov ecx, [eax]
  '005363DD: call [ecx+3Ch]
  '005363E0: test eax, eax
  '005363E2: fclex 
  '005363E4: jnl 5363F4h
  '005363E6: mov ecx, [esi+5Ch]
  '005363E9: push 0000003Ch
  '005363EB: push 0042C8ECh
  '005363F0: push ecx
  '005363F1: push eax
  '005363F2: call ebx
  '005363F4: mov edx, [ebp-00000184h]
  '005363FA: mov eax, [ebp-000000B8h]
  '00536400: sub edx, 00000001h
  '00536403: jo 00536900h
  '00536409: cmp eax, edx
  '0053640B: jnl 53647Eh
  '0053640D: test eax, eax
  '0053640F: jz 53647Eh
  '00536411: mov ecx, [ebp-24h]
  '00536414: mov eax, [ebp-000000CCh]
  '0053641A: imul ecx, 04h
  '0053641D: jo 00536900h
  '00536423: cmp eax, ecx
  '00536425: jl 536432h
  '00536427: test eax, eax
  '00536429: jz 536432h
  '0053642B: mov esi, 00000001h
  '00536430: jmp 536434h
  '00536432: xor esi, esi
  '00536434: mov edx, [ebp+08h]
  '00536437: mov eax, [edx+5Ch]
  '0053643A: lea edx, [ebp-00000184h]
  '00536440: push edx
  '00536441: push eax
  '00536442: mov ecx, [eax]
  '00536444: call [ecx+34h]
  '00536447: test eax, eax
  '00536449: fclex 
  '0053644B: jnl 53645Eh
  '0053644D: mov ecx, [ebp+08h]
  '00536450: push 00000034h
  '00536452: push 0042C8ECh
  '00536457: mov edx, [ecx+5Ch]
  '0053645A: push edx
  '0053645B: push eax
  '0053645C: call ebx
  '0053645E: mov eax, [ebp-00000184h]
  '00536464: mov edx, [ebp-000000CCh]
  '0053646A: sub eax, 00000004h
  '0053646D: jo 00536900h
  '00536473: xor ecx, ecx
  '00536475: cmp edx, eax
  '00536477: setnz cl
  '0053647A: test ecx, esi
  '0053647C: jnz 536481h
  '0053647E: or edi, FFFFFFFFh
  '00536481: test di, di
  '00536484: jz 005367C5h
  '0053648A: mov ecx, [ebp-000000D0h]
  '00536490: test ecx, ecx
  '00536492: jz 5364E6h
  '00536494: cmp word ptr [ecx], 0002h
  '00536498: jnz 5364E6h
  '0053649A: mov edi, [ebp-000000CCh]
  '005364A0: mov edx, [ecx+1Ch]
  '005364A3: mov eax, [ecx+18h]
  '005364A6: sub edi, edx
  '005364A8: cmp edi, eax
  '005364AA: jb 5364B8h
  '005364AC: call [00401178h]
  '005364B2: mov ecx, [ebp-000000D0h]
  '005364B8: mov esi, [ebp-000000B8h]
  '005364BE: mov edx, [ecx+14h]
  '005364C1: mov eax, [ecx+10h]
  '005364C4: sub esi, edx
  '005364C6: cmp esi, eax
  '005364C8: jb 5364D6h
  '005364CA: call [00401178h]
  '005364D0: mov ecx, [ebp-000000D0h]
  '005364D6: mov ebx, [ecx+18h]
  '005364D9: imul ebx, esi
  '005364DC: add ebx, edi
  '005364DE: mov [ebp-000001D4h], ebx
  '005364E4: jmp 5364FAh
  '005364E6: call [00401178h]
  '005364EC: mov ecx, [ebp-000000D0h]
  '005364F2: mov ebx, eax
  '005364F4: mov [ebp-000001D4h], ebx
  '005364FA: test ecx, ecx
  '005364FC: jz 53655Dh
  '005364FE: cmp word ptr [ecx], 0002h
  '00536502: jnz 53655Dh
  '00536504: mov esi, [ebp-000000CCh]
  '0053650A: mov edx, [ecx+1Ch]
  '0053650D: mov eax, [ecx+18h]
  '00536510: add esi, 00000001h
  '00536513: jo 00536900h
  '00536519: sub esi, edx
  '0053651B: cmp esi, eax
  '0053651D: jb 53652Bh
  '0053651F: call [00401178h]
  '00536525: mov ecx, [ebp-000000D0h]
  '0053652B: mov eax, [ebp-000000B8h]
  '00536531: mov edi, [ecx+14h]
  '00536534: mov edx, [ecx+10h]
  '00536537: sub eax, edi
  '00536539: cmp eax, edx
  '0053653B: mov [ebp-0000019Ch], eax
  '00536541: jb 53654Fh
  '00536543: call [00401178h]
  '00536549: mov ecx, [ebp-000000D0h]
  '0053654F: mov edi, [ecx+18h]
  '00536552: imul edi, [ebp-0000019Ch]
  '00536559: add edi, esi
  '0053655B: jmp 53656Bh
  '0053655D: call [00401178h]
  '00536563: mov ecx, [ebp-000000D0h]
  '00536569: mov edi, eax
  '0053656B: test ecx, ecx
  '0053656D: jz 5365CAh
  '0053656F: cmp word ptr [ecx], 0002h
  '00536573: jnz 5365CAh
  '00536575: mov esi, [ebp-000000CCh]
  '0053657B: mov edx, [ecx+1Ch]
  '0053657E: mov eax, [ecx+18h]
  '00536581: add esi, 00000002h
  '00536584: jo 00536900h
  '0053658A: sub esi, edx
  '0053658C: cmp esi, eax
  '0053658E: jb 53659Ch
  '00536590: call [00401178h]
  '00536596: mov ecx, [ebp-000000D0h]
  '0053659C: mov ebx, [ebp-000000B8h]
  '005365A2: mov edx, [ecx+14h]
  '005365A5: mov eax, [ecx+10h]
  '005365A8: sub ebx, edx
  '005365AA: cmp ebx, eax
  '005365AC: jb 5365BAh
  '005365AE: call [00401178h]
  '005365B4: mov ecx, [ebp-000000D0h]
  '005365BA: mov eax, [ecx+18h]
  '005365BD: imul eax, ebx
  '005365C0: mov ebx, [ebp-000001D4h]
  '005365C6: add eax, esi
  '005365C8: jmp 5365D6h
  '005365CA: call [00401178h]
  '005365D0: mov ecx, [ebp-000000D0h]
  '005365D6: mov edx, [ebp+08h]
  '005365D9: mov ecx, [ecx+0Ch]
  '005365DC: lea esi, [ebp-54h]
  '005365DF: mov edx, [edx]
  '005365E1: push esi
  '005365E2: lea esi, [ebp-0000009Ch]
  '005365E8: mov [ebp-000001D8h], edx
  '005365EE: push esi
  '005365EF: xor edx, edx
  '005365F1: mov dl, [ecx+ebx]
  '005365F4: lea esi, [ebp-000000BCh]
  '005365FA: push esi
  '005365FB: push edx
  '005365FC: xor edx, edx
  '005365FE: mov esi, [ebp+08h]
  '00536601: mov dl, [ecx+edi]
  '00536604: push edx
  '00536605: xor edx, edx
  '00536607: mov dl, [ecx+eax]
  '0053660A: mov eax, [ebp-000001D8h]
  '00536610: push edx
  '00536611: push esi
  '00536612: call [eax+0000009Ch]
  '00536618: fld real4 ptr [ebp-000000C4h]
  '0053661E: fmul real4 ptr [ebp-54h]
  '00536621: mov ecx, [esi]
  '00536623: lea edx, [ebp-68h]
  '00536626: push edx
  '00536627: lea eax, [ebp-000000C0h]
  '0053662D: lea edx, [ebp-6Ch]
  '00536630: push eax
  '00536631: push edx
  '00536632: mov edx, [ebp-50h]
  '00536635: fstsw ax
  '00536637: test al, 0Dh
  '00536639: jnz 005368FBh
  '0053663F: mov eax, [ebp-70h]
  '00536642: push ecx
  '00536643: fstp real4 ptr [esp]
  '00536646: push eax
  '00536647: push edx
  '00536648: push esi
  '00536649: call [ecx+000000A0h]
  '0053664F: mov eax, [ebp-000000D0h]
  '00536655: test eax, eax
  '00536657: jz 5366B4h
  '00536659: cmp word ptr [eax], 0002h
  '0053665D: jnz 5366B4h
  '0053665F: mov esi, [ebp-000000CCh]
  '00536665: mov edx, [eax+1Ch]
  '00536668: mov ecx, [eax+18h]
  '0053666B: add esi, 00000002h
  '0053666E: jo 00536900h
  '00536674: sub esi, edx
  '00536676: cmp esi, ecx
  '00536678: jb 536686h
  '0053667A: call [00401178h]
  '00536680: mov eax, [ebp-000000D0h]
  '00536686: mov ebx, [ebp-000000B8h]
  '0053668C: mov edx, [eax+14h]
  '0053668F: mov ecx, [eax+10h]
  '00536692: sub ebx, edx
  '00536694: cmp ebx, ecx
  '00536696: jb 5366A4h
  '00536698: call [00401178h]
  '0053669E: mov eax, [ebp-000000D0h]
  '005366A4: mov edi, [eax+18h]
  '005366A7: imul edi, ebx
  '005366AA: add edi, esi
  '005366AC: mov esi, [00401178h]
  '005366B2: jmp 5366BEh
  '005366B4: mov esi, [00401178h]
  '005366BA: call esi
  '005366BC: mov edi, eax
  '005366BE: mov ecx, [ebp-6Ch]
  '005366C1: call [00401220h]
  '005366C7: mov ecx, [ebp-000000D0h]
  '005366CD: mov edx, [ecx+0Ch]
  '005366D0: mov [edx+edi], al
  '005366D3: mov eax, [ebp-000000D0h]
  '005366D9: test eax, eax
  '005366DB: jz 536738h
  '005366DD: cmp word ptr [eax], 0002h
  '005366E1: jnz 536738h
  '005366E3: mov esi, [ebp-000000CCh]
  '005366E9: mov edx, [eax+1Ch]
  '005366EC: mov ecx, [eax+18h]
  '005366EF: add esi, 00000001h
  '005366F2: jo 00536900h
  '005366F8: sub esi, edx
  '005366FA: cmp esi, ecx
  '005366FC: jb 53670Ah
  '005366FE: call [00401178h]
  '00536704: mov eax, [ebp-000000D0h]
  '0053670A: mov ebx, [ebp-000000B8h]
  '00536710: mov edx, [eax+14h]
  '00536713: mov ecx, [eax+10h]
  '00536716: sub ebx, edx
  '00536718: cmp ebx, ecx
  '0053671A: jb 536728h
  '0053671C: call [00401178h]
  '00536722: mov eax, [ebp-000000D0h]
  '00536728: mov edi, [eax+18h]
  '0053672B: imul edi, ebx
  '0053672E: add edi, esi
  '00536730: mov esi, [00401178h]
  '00536736: jmp 53673Ch
  '00536738: call esi
  '0053673A: mov edi, eax
  '0053673C: mov ecx, [ebp-000000C0h]
  '00536742: call [00401220h]
  '00536748: mov ecx, [ebp-000000D0h]
  '0053674E: mov edx, [ecx+0Ch]
  '00536751: mov [edx+edi], al
  '00536754: mov eax, [ebp-000000D0h]
  '0053675A: test eax, eax
  '0053675C: jz 5367A2h
  '0053675E: cmp word ptr [eax], 0002h
  '00536762: jnz 5367A2h
  '00536764: mov ebx, [ebp-000000CCh]
  '0053676A: mov edx, [eax+1Ch]
  '0053676D: mov ecx, [eax+18h]
  '00536770: sub ebx, edx
  '00536772: cmp ebx, ecx
  '00536774: jb 53677Eh
  '00536776: call esi
  '00536778: mov eax, [ebp-000000D0h]
  '0053677E: mov edi, [ebp-000000B8h]
  '00536784: mov edx, [eax+14h]
  '00536787: mov ecx, [eax+10h]
  '0053678A: sub edi, edx
  '0053678C: cmp edi, ecx
  '0053678E: jb 536798h
  '00536790: call esi
  '00536792: mov eax, [ebp-000000D0h]
  '00536798: mov esi, [eax+18h]
  '0053679B: imul esi, edi
  '0053679E: add esi, ebx
  '005367A0: jmp 5367AAh
  '005367A2: call [00401178h]
  '005367A8: mov esi, eax
  '005367AA: mov ecx, [ebp-68h]
  '005367AD: call [00401220h]
  '005367B3: mov ecx, [ebp-000000D0h]
  '005367B9: mov ebx, [004010A0h]
  '005367BF: mov edx, [ecx+0Ch]
  '005367C2: mov [edx+esi], al
  '005367C5: mov ecx, [ebp-000000B8h]
  '005367CB: mov edi, [ebp+08h]
  '005367CE: mov esi, [ebp-000001B4h]
  '005367D4: mov eax, 00000001h
  '005367D9: add eax, ecx
  '005367DB: jo 00536900h
  '005367E1: mov [ebp-000000B8h], eax
  '005367E7: mov eax, [ebp-000001BCh]
  '005367ED: jmp 005363BFh
  '005367F2: mov ecx, [ebp-000000CCh]
  '005367F8: mov eax, 00000004h
  '005367FD: add eax, ecx
  '005367FF: jo 00536900h
  '00536805: mov [ebp-000000CCh], eax
  '0053680B: jmp 00536370h
  '00536810: lea eax, [ebp-000000D0h]
  '00536816: push eax
  '00536817: call 0042C914h
  '0053681C: mov esi, [0040109Ch]
  '00536822: mov [ebp-00000184h], eax
  '00536828: call esi
  '0053682A: mov edx, [ebp-00000184h]
  '00536830: lea ecx, [ebp-00000188h]
  '00536836: push 00000004h
  '00536838: push ecx
  '00536839: push edx
  '0053683A: mov [ebp-00000188h], 00000000h
  '00536844: call 0041D584h
  '00536849: call esi
  '0053684B: wait 
  '0053684C: push 005368C2h
  '00536851: jmp 5368A0h
  '00536853: test byte ptr [ebp-04h], 04h
  '00536857: jz 536862h
  '00536859: lea ecx, [ebp-64h]
  '0053685C: call [00401030h]
  '00536862: lea eax, [ebp-000000DCh]
  '00536868: lea ecx, [ebp-000000D8h]
  '0053686E: push eax
  '0053686F: push ecx
  '00536870: push 00000002h
  '00536872: call [004012E8h]
  '00536878: lea edx, [ebp-0000011Ch]
  '0053687E: lea eax, [ebp-0000010Ch]
  '00536884: push edx
  '00536885: lea ecx, [ebp-000000FCh]
  '0053688B: push eax
  '0053688C: lea edx, [ebp-000000ECh]
  '00536892: push ecx
  '00536893: push edx
  '00536894: push 00000004h
  '00536896: call [00401050h]
  '0053689C: add esp, 00000020h
  '0053689F: ret 
End Sub
Private Sub Font_5340D0
  '005340D0: push ecx
  '005340D1: mov ecx, [esp+10h]
  '005340D5: lea eax, [esp]
  '005340D9: push esi
  '005340DA: push eax
  '005340DB: mov edx, [ecx]
  '005340DD: mov eax, [esp+14h]
  '005340E1: push edx
  '005340E2: push eax
  '005340E3: mov [esp+10h], 00000000h
  '005340EB: call 00420C94h
  '005340F0: mov esi, eax
  '005340F2: call [0040109Ch]
  '005340F8: test esi, esi
  '005340FA: pop esi
  '005340FB: jz 53410Ch
  '005340FD: mov ecx, [esp+14h]
  '00534101: or eax, FFFFFFFFh
  '00534104: mov [ecx], eax
  '00534106: xor eax, eax
  '00534108: pop ecx
  '00534109: retn 0010h
End Sub
Private Sub Font_534120
  '00534120: sub esp, 00000010h
  '00534123: push ebx
  '00534124: push ebp
  '00534125: push esi
  '00534126: mov esi, [esp+20h]
  '0053412A: lea ecx, [esp+0Ch]
  '0053412E: push edi
  '0053412F: mov eax, [esi]
  '00534131: push ecx
  '00534132: mov ecx, [esp+2Ch]
  '00534136: lea edx, [esp+18h]
  '0053413A: push edx
  '0053413B: xor edi, edi
  '0053413D: push ecx
  '0053413E: push esi
  '0053413F: mov [esp+20h], edi
  '00534143: mov [esp+24h], edi
  '00534147: call [eax+00000088h]
  '0053414D: mov ebx, [esp+10h]
  '00534151: mov edx, [esi]
  '00534153: lea eax, [esp+10h]
  '00534157: lea ecx, [esp+14h]
  '0053415B: push eax
  '0053415C: mov eax, [esp+30h]
  '00534160: push ecx
  '00534161: push eax
  '00534162: push esi
  '00534163: mov [esp+34h], ebx
  '00534167: mov [esp+24h], edi
  '0053416B: call [edx+00000088h]
  '00534171: xor ecx, ecx
  '00534173: xor edx, edx
  '00534175: mov cl, bh
  '00534177: mov esi, ebx
  '00534179: mov ebx, [esp+30h]
  '0053417D: mov edi, ecx
  '0053417F: mov ecx, [esp+10h]
  '00534183: and esi, 000000FFh
  '00534189: mov dl, ch
  '0053418B: mov ebp, ecx
  '0053418D: mov [esp+28h], edx
  '00534191: mov edx, 000000FFh
  '00534196: xor eax, eax
  '00534198: and ebp, 000000FFh
  '0053419E: xor ecx, ecx
  '005341A0: sub edx, ebx
  '005341A2: mov cl, [esp+12h]
  '005341A6: mov al, [esp+26h]
  '005341AA: jo 0053437Eh
  '005341B0: imul edx, ecx
  '005341B3: jo 0053437Eh
  '005341B9: imul eax, ebx
  '005341BC: mov [esp+24h], edx
  '005341C0: fild dword ptr [esp+24h]
  '005341C4: jo 0053437Eh
  '005341CA: mov [esp+24h], eax
  '005341CE: fstp real8 ptr [esp+18h]
  '005341D2: fld real8 ptr [esp+18h]
  '005341D6: cmp [00541000h], 00000000h
  '005341DD: jnz 5341E7h
  '005341DF: fdiv real8 ptr [00406D50h]
  '005341E5: jmp 5341F8h
  '005341E7: push [00406D54h]
  '005341ED: push [00406D50h]
  '005341F3: call 004081D4h
  '005341F8: fild dword ptr [esp+24h]
  '005341FC: fstp real8 ptr [esp+18h]
  '00534200: fld real8 ptr [esp+18h]
  '00534204: cmp [00541000h], 00000000h
  '0053420B: jnz 534215h
  '0053420D: fdiv real8 ptr [00406D50h]
  '00534213: jmp 534226h
  '00534215: push [00406D54h]
  '0053421B: push [00406D50h]
  '00534221: call 004081D4h
  '00534226: faddp st(1), st(0)
  '00534228: fstsw ax
  '0053422A: test al, 0Dh
  '0053422C: jnz 00534379h
  '00534232: call [00401348h]
  '00534238: push eax
  '00534239: mov eax, 000000FFh
  '0053423E: sub eax, ebx
  '00534240: jo 0053437Eh
  '00534246: imul eax, [esp+2Ch]
  '0053424B: jo 0053437Eh
  '00534251: imul edi, ebx
  '00534254: mov [esp+28h], eax
  '00534258: fild dword ptr [esp+28h]
  '0053425C: fstp real8 ptr [esp+1Ch]
  '00534260: fld real8 ptr [esp+1Ch]
  '00534264: cmp [00541000h], 00000000h
  '0053426B: jnz 534275h
  '0053426D: fdiv real8 ptr [00406D50h]
  '00534273: jmp 534286h
  '00534275: push [00406D54h]
  '0053427B: push [00406D50h]
  '00534281: call 004081D4h
  '00534286: jo 0053437Eh
  '0053428C: mov [esp+28h], edi
  '00534290: mov edi, [00401348h]
  '00534296: fild dword ptr [esp+28h]
  '0053429A: fstp real8 ptr [esp+1Ch]
  '0053429E: fld real8 ptr [esp+1Ch]
  '005342A2: cmp [00541000h], 00000000h
  '005342A9: jnz 5342B3h
  '005342AB: fdiv real8 ptr [00406D50h]
  '005342B1: jmp 5342C4h
  '005342B3: push [00406D54h]
  '005342B9: push [00406D50h]
  '005342BF: call 004081D4h
  '005342C4: faddp st(1), st(0)
  '005342C6: fstsw ax
  '005342C8: test al, 0Dh
  '005342CA: jnz 00534379h
  '005342D0: call edi
  '005342D2: mov ecx, 000000FFh
  '005342D7: push eax
  '005342D8: sub ecx, ebx
  '005342DA: jo 0053437Eh
  '005342E0: imul ecx, ebp
  '005342E3: jo 0053437Eh
  '005342E9: imul esi, ebx
  '005342EC: mov [esp+2Ch], ecx
  '005342F0: fild dword ptr [esp+2Ch]
  '005342F4: jo 0053437Eh
  '005342FA: mov [esp+2Ch], esi
  '005342FE: fstp real8 ptr [esp+20h]
  '00534302: fld real8 ptr [esp+20h]
  '00534306: cmp [00541000h], 00000000h
  '0053430D: jnz 534317h
  '0053430F: fdiv real8 ptr [00406D50h]
  '00534315: jmp 534328h
  '00534317: push [00406D54h]
  '0053431D: push [00406D50h]
  '00534323: call 004081D4h
  '00534328: fild dword ptr [esp+2Ch]
  '0053432C: fstp real8 ptr [esp+20h]
  '00534330: fld real8 ptr [esp+20h]
  '00534334: cmp [00541000h], 00000000h
  '0053433B: jnz 534345h
  '0053433D: fdiv real8 ptr [00406D50h]
  '00534343: jmp 534356h
  '00534345: push [00406D54h]
  '0053434B: push [00406D50h]
  '00534351: call 004081D4h
  '00534356: faddp st(1), st(0)
  '00534358: fstsw ax
  '0053435A: test al, 0Dh
  '0053435C: jnz 534379h
  '0053435E: call edi
  '00534360: push eax
  '00534361: call [00401034h]
  '00534367: pop edi
  '00534368: pop esi
  '00534369: mov edx, [esp+2Ch]
  '0053436D: pop ebp
  '0053436E: pop ebx
  '0053436F: mov [edx], eax
  '00534371: xor eax, eax
  '00534373: add esp, 00000010h
  '00534376: retn 0014h
End Sub
Private Sub Font_536910
  '00536910: push ebp
  '00536911: mov ebp, esp
  '00536913: sub esp, 00000008h
  '00536916: push 004081B6h
  '0053691B: mov eax, fs:[00h]
  '00536921: push eax
  '00536922: mov fs:[00000000h], esp
  '00536929: sub esp, 00000048h
  '0053692C: push ebx
  '0053692D: push esi
  '0053692E: push edi
  '0053692F: mov [ebp-08h], esp
  '00536932: mov [ebp-04h], 00407BF8h
  '00536939: xor ebx, ebx
  '0053693B: xor eax, eax
  '0053693D: push ebx
  '0053693E: lea ecx, [ebp-34h]
  '00536941: mov [ebp-44h], eax
  '00536944: push 0042D148h
  '00536949: push ecx
  '0053694A: mov [ebp-14h], ebx
  '0053694D: mov [ebp-1Ch], ebx
  '00536950: mov [ebp-40h], eax
  '00536953: mov [ebp-48h], ebx
  '00536956: mov [ebp-4Ch], ebx
  '00536959: call [00401190h]
  '0053695F: mov esi, [ebp+08h]
  '00536962: lea eax, [ebp-4Ch]
  '00536965: lea ecx, [ebp-48h]
  '00536968: push eax
  '00536969: cmp [esi+36h], bx
  '0053696D: mov edx, [esi]
  '0053696F: mov [ebp-48h], ebx
  '00536972: push ecx
  '00536973: jz 00536A1Dh
  '00536979: mov eax, [ebp+14h]
  '0053697C: push eax
  '0053697D: push esi
  '0053697E: call [edx+00000088h]
  '00536984: mov ecx, [ebp-4Ch]
  '00536987: mov edx, [esi]
  '00536989: lea eax, [ebp-4Ch]
  '0053698C: mov [ebp-14h], ecx
  '0053698F: push eax
  '00536990: mov eax, [ebp+18h]
  '00536993: lea ecx, [ebp-48h]
  '00536996: mov [ebp-48h], ebx
  '00536999: push ecx
  '0053699A: push eax
  '0053699B: push esi
  '0053699C: call [edx+00000088h]
  '005369A2: mov ecx, [ebp-4Ch]
  '005369A5: mov edx, [esi]
  '005369A7: mov [ebp-1Ch], ecx
  '005369AA: mov ecx, [ebp-28h]
  '005369AD: lea eax, [ebp-14h]
  '005369B0: push eax
  '005369B1: push ecx
  '005369B2: push esi
  '005369B3: call [edx+00000094h]
  '005369B9: mov edi, [ebp+10h]
  '005369BC: mov eax, [ebp-28h]
  '005369BF: mov edx, [edi]
  '005369C1: mov [eax], edx
  '005369C3: mov edx, [ebp-28h]
  '005369C6: mov ecx, [edi+04h]
  '005369C9: mov [edx+04h], ecx
  '005369CC: mov edx, [ebp-28h]
  '005369CF: mov eax, [esi]
  '005369D1: lea ecx, [ebp-1Ch]
  '005369D4: add edx, 00000010h
  '005369D7: push ecx
  '005369D8: push edx
  '005369D9: push esi
  '005369DA: call [eax+00000094h]
  '005369E0: mov ecx, [ebp-28h]
  '005369E3: mov eax, [edi+08h]
  '005369E6: mov [ecx+10h], eax
  '005369E9: mov eax, [ebp-28h]
  '005369EC: mov edx, [edi+0Ch]
  '005369EF: mov ecx, [ebp+1Ch]
  '005369F2: mov [eax+14h], edx
  '005369F5: mov eax, [ebp-28h]
  '005369F8: push ecx
  '005369F9: mov ecx, [ebp+0Ch]
  '005369FC: lea edx, [ebp-44h]
  '005369FF: push 00000001h
  '00536A01: push edx
  '00536A02: push 00000002h
  '00536A04: push eax
  '00536A05: push ecx
  '00536A06: mov [ebp-44h], ebx
  '00536A09: mov [ebp-40h], 00000001h
  '00536A10: call 0042D058h
  '00536A15: call [0040109Ch]
  '00536A1B: jmp 536A53h
  '00536A1D: mov eax, [ebp+18h]
  '00536A20: push eax
  '00536A21: push esi
  '00536A22: call [edx+00000088h]
  '00536A28: mov ecx, [ebp-4Ch]
  '00536A2B: push ecx
  '00536A2C: call 00420A8Ch
  '00536A31: mov edi, [0040109Ch]
  '00536A37: mov esi, eax
  '00536A39: call edi
  '00536A3B: mov edx, [ebp+10h]
  '00536A3E: mov eax, [ebp+0Ch]
  '00536A41: push esi
  '00536A42: push edx
  '00536A43: push eax
  '00536A44: call 00420A34h
  '00536A49: call edi
  '00536A4B: push esi
  '00536A4C: call 00420C34h
  '00536A51: call edi
  '00536A53: push 00536A6Bh
  '00536A58: lea edx, [ebp-48h]
  '00536A5B: lea ecx, [ebp-34h]
  '00536A5E: push edx
  '00536A5F: push 00000000h
  '00536A61: mov [ebp-48h], ecx
  '00536A64: call [004010B8h]
  '00536A6A: ret 
End Sub
Private Sub BarColor_536A80
  '00536A80: mov eax, [esp+0Ch]
  '00536A84: push ebx
  '00536A85: push ebp
  '00536A86: push esi
  '00536A87: mov ecx, [eax]
  '00536A89: mov esi, [esp+10h]
  '00536A8D: mov eax, ecx
  '00536A8F: push edi
  '00536A90: and eax, 000000FFh
  '00536A95: mov edi, [esp+18h]
  '00536A99: imul eax, 00000100h
  '00536A9F: mov edx, [esi]
  '00536AA1: mov [esp+1Ch], ecx
  '00536AA5: jo 536AE8h
  '00536AA7: and ecx, 0000FF00h
  '00536AAD: push eax
  '00536AAE: mov ebx, ecx
  '00536AB0: xor ecx, ecx
  '00536AB2: mov ch, [esp+22h]
  '00536AB6: lea eax, [edi+08h]
  '00536AB9: push eax
  '00536ABA: push esi
  '00536ABB: mov ebp, ecx
  '00536ABD: call [edx+00000098h]
  '00536AC3: mov ecx, [esi]
  '00536AC5: lea edx, [edi+0Ah]
  '00536AC8: push ebx
  '00536AC9: push edx
  '00536ACA: push esi
  '00536ACB: call [ecx+00000098h]
  '00536AD1: mov eax, [esi]
  '00536AD3: add edi, 0000000Ch
  '00536AD6: push ebp
  '00536AD7: push edi
  '00536AD8: push esi
  '00536AD9: call [eax+00000098h]
  '00536ADF: pop edi
  '00536AE0: pop esi
  '00536AE1: pop ebp
  '00536AE2: xor eax, eax
  '00536AE4: pop ebx
  '00536AE5: retn 000Ch
End Sub
Private Sub BarColor_536AF0
  '00536AF0: mov ecx, [esp+0Ch]
  '00536AF4: mov eax, ecx
  '00536AF6: and eax, 00008000h
  '00536AFB: cmp eax, 00008000h
  '00536B00: jnz 536B1Fh
  '00536B02: and ecx, 00007F00h
  '00536B08: call [004011A8h]
  '00536B0E: mov ecx, [esp+08h]
  '00536B12: or eax, FFFF8000h
  '00536B17: mov [ecx], ax
  '00536B1A: xor eax, eax
  '00536B1C: retn 000Ch
End Sub
Private Sub AutoSize_536B40
  '00536B40: sub esp, 00000018h
  '00536B43: fild dword ptr [esp+20h]
  '00536B47: lea ecx, [esp]
  '00536B4B: push esi
  '00536B4C: mov esi, [esp+20h]
  '00536B50: lea edx, [esp+2Ch]
  '00536B54: fstp real8 ptr [esp+0Ch]
  '00536B58: fld real8 ptr [esp+0Ch]
  '00536B5C: cmp [00541000h], 00000000h
  '00536B63: jnz 536B6Dh
  '00536B65: fdiv real8 ptr [00406D50h]
  '00536B6B: jmp 536B7Eh
  '00536B6D: push [00406D54h]
  '00536B73: push [00406D50h]
  '00536B79: call 004081D4h
  '00536B7E: push ecx
  '00536B7F: push edx
  '00536B80: lea ecx, [esp+14h]
  '00536B84: lea edx, [esp+10h]
  '00536B88: push ecx
  '00536B89: push edx
  '00536B8A: push esi
  '00536B8B: mov [esp+18h], 00000000h
  '00536B93: fstp real4 ptr [esp+1Ch]
  '00536B97: fstsw ax
  '00536B99: test al, 0Dh
  '00536B9B: jnz 00536DFBh
  '00536BA1: fild dword ptr [esp+3Ch]
  '00536BA5: fstp real8 ptr [esp+20h]
  '00536BA9: fld real8 ptr [esp+20h]
  '00536BAD: cmp [00541000h], 00000000h
  '00536BB4: jnz 536BBEh
  '00536BB6: fdiv real8 ptr [00406D50h]
  '00536BBC: jmp 536BCFh
  '00536BBE: push [00406D54h]
  '00536BC4: push [00406D50h]
  '00536BCA: call 004081D4h
  '00536BCF: fstp real4 ptr [esp+20h]
  '00536BD3: fstsw ax
  '00536BD5: test al, 0Dh
  '00536BD7: jnz 00536DFBh
  '00536BDD: fild dword ptr [esp+40h]
  '00536BE1: fstp real8 ptr [esp+28h]
  '00536BE5: fld real8 ptr [esp+28h]
  '00536BE9: cmp [00541000h], 00000000h
  '00536BF0: jnz 536BFAh
  '00536BF2: fdiv real8 ptr [00406D50h]
  '00536BF8: jmp 536C0Bh
  '00536BFA: push [00406D54h]
  '00536C00: push [00406D50h]
  '00536C06: call 004081D4h
  '00536C0B: fstp real4 ptr [esp+40h]
  '00536C0F: fstsw ax
  '00536C11: test al, 0Dh
  '00536C13: jnz 00536DFBh
  '00536C19: mov eax, [esi]
  '00536C1B: call [eax+000000A4h]
  '00536C21: mov ecx, [esi]
  '00536C23: lea edx, [esp+04h]
  '00536C27: mov eax, [esp+04h]
  '00536C2B: push edx
  '00536C2C: mov [esp+28h], eax
  '00536C30: lea eax, [esp+30h]
  '00536C34: push eax
  '00536C35: lea edx, [esp+14h]
  '00536C39: lea eax, [esp+10h]
  '00536C3D: push edx
  '00536C3E: push eax
  '00536C3F: push esi
  '00536C40: call [ecx+000000A8h]
  '00536C46: fld real4 ptr [esp+04h]
  '00536C4A: fadd real4 ptr [esp+24h]
  '00536C4E: mov esi, [esp+38h]
  '00536C52: mov ecx, [esp+04h]
  '00536C56: mov [esp+28h], ecx
  '00536C5A: cmp [00541000h], 00000000h
  '00536C61: jnz 536C6Bh
  '00536C63: fdiv real4 ptr [00407C08h]
  '00536C69: jmp 536C76h
  '00536C6B: push [00407C08h]
  '00536C71: call 004081C8h
  '00536C76: fstp real4 ptr [esi]
  '00536C78: fstsw ax
  '00536C7A: test al, 0Dh
  '00536C7C: jnz 00536DFBh
  '00536C82: fld real4 ptr [esp+24h]
  '00536C86: fcomp real4 ptr [esp+04h]
  '00536C8A: fstsw ax
  '00536C8C: test ah, 40h
  '00536C8F: jz 536CAEh
  '00536C91: mov edx, [esp+34h]
  '00536C95: mov eax, [esp+30h]
  '00536C99: pop esi
  '00536C9A: mov [edx], 00000000h
  '00536CA0: mov [eax], 00000000h
  '00536CA6: xor eax, eax
  '00536CA8: add esp, 00000018h
  '00536CAB: retn 001Ch
End Sub
Private Sub AutoSize_536E00
  '00536E00: fld real4 ptr [esp+0Ch]
  '00536E04: fcomp real4 ptr [00405680h]
  '00536E0A: sub esp, 0000000Ch
  '00536E0D: fstsw ax
  '00536E0F: test ah, 40h
  '00536E12: jz 536E29h
  '00536E14: mov eax, [esp+1Ch]
  '00536E18: mov [esp], eax
  '00536E1C: mov [esp+04h], eax
  '00536E20: mov [esp+08h], eax
  '00536E24: jmp 00536FF0h
  '00536E29: fld real4 ptr [00407C04h]
  '00536E2F: call [00401108h]
  '00536E35: fcomp real4 ptr [esp+1Ch]
  '00536E39: fld real4 ptr [004055F8h]
  '00536E3F: fstsw ax
  '00536E41: test ah, 01h
  '00536E44: jnz 536E50h
  '00536E46: fsub real4 ptr [esp+18h]
  '00536E4A: fmul real4 ptr [esp+1Ch]
  '00536E4E: jmp 536E5Ch
  '00536E50: fsub real4 ptr [esp+1Ch]
  '00536E54: fmul real4 ptr [esp+18h]
  '00536E58: fsubr real4 ptr [esp+1Ch]
  '00536E5C: fstp real4 ptr [esp+18h]
  '00536E60: fstsw ax
  '00536E62: test al, 0Dh
  '00536E64: jnz 00537048h
  '00536E6A: fld real4 ptr [esp+1Ch]
  '00536E6E: fadd st(0), st(0)
  '00536E70: fsub real4 ptr [esp+18h]
  '00536E74: fstp real4 ptr [esp+1Ch]
  '00536E78: fstsw ax
  '00536E7A: test al, 0Dh
  '00536E7C: jnz 00537048h
  '00536E82: fld real4 ptr [esp+14h]
  '00536E86: fcomp real4 ptr [004055F8h]
  '00536E8C: fstsw ax
  '00536E8E: test ah, 01h
  '00536E91: jz 536F02h
  '00536E93: fld real4 ptr [esp+14h]
  '00536E97: fcomp real4 ptr [00405680h]
  '00536E9D: mov eax, [esp+1Ch]
  '00536EA1: mov [esp], eax
  '00536EA5: fstsw ax
  '00536EA7: test ah, 01h
  '00536EAA: jz 536ED7h
  '00536EAC: fld real4 ptr [esp+1Ch]
  '00536EB0: fsub real4 ptr [esp+18h]
  '00536EB4: mov ecx, [esp+18h]
  '00536EB8: mov [esp+04h], ecx
  '00536EBC: fmul real4 ptr [esp+14h]
  '00536EC0: fsubr real4 ptr [esp+18h]
  '00536EC4: fstp real4 ptr [esp+08h]
  '00536EC8: fstsw ax
  '00536ECA: test al, 0Dh
  '00536ECC: jnz 00537048h
  '00536ED2: jmp 00536FF0h
  '00536ED7: fld real4 ptr [esp+1Ch]
  '00536EDB: fsub real4 ptr [esp+18h]
  '00536EDF: mov edx, [esp+18h]
  '00536EE3: mov [esp+08h], edx
  '00536EE7: fmul real4 ptr [esp+14h]
  '00536EEB: fadd real4 ptr [esp+18h]
  '00536EEF: fstp real4 ptr [esp+04h]
  '00536EF3: fstsw ax
  '00536EF5: test al, 0Dh
  '00536EF7: jnz 00537048h
  '00536EFD: jmp 00536FF0h
  '00536F02: fld real4 ptr [esp+14h]
  '00536F06: fcomp real4 ptr [00407C0Ch]
  '00536F0C: fstsw ax
  '00536F0E: test ah, 01h
  '00536F11: mov eax, [esp+1Ch]
  '00536F15: jz 536F81h
  '00536F17: fld real4 ptr [esp+14h]
  '00536F1B: fcomp real4 ptr [00407C08h]
  '00536F21: mov [esp+04h], eax
  '00536F25: fstsw ax
  '00536F27: test ah, 01h
  '00536F2A: jz 536F51h
  '00536F2C: fld real4 ptr [esp+1Ch]
  '00536F30: fsub real4 ptr [esp+18h]
  '00536F34: fld real4 ptr [esp+14h]
  '00536F38: fsub real4 ptr [00407C08h]
  '00536F3E: mov ecx, [esp+18h]
  '00536F42: fmulp st(1), st(0)
  '00536F44: mov [esp+08h], ecx
  '00536F48: fsubr real4 ptr [esp+18h]
  '00536F4C: jmp 00536FE6h
  '00536F51: fld real4 ptr [esp+1Ch]
  '00536F55: fsub real4 ptr [esp+18h]
  '00536F59: fld real4 ptr [esp+14h]
  '00536F5D: fsub real4 ptr [00407C08h]
  '00536F63: mov edx, [esp+18h]
  '00536F67: fmulp st(1), st(0)
  '00536F69: mov [esp], edx
  '00536F6D: fadd real4 ptr [esp+18h]
  '00536F71: fstp real4 ptr [esp+08h]
  '00536F75: fstsw ax
  '00536F77: test al, 0Dh
  '00536F79: jnz 00537048h
  '00536F7F: jmp 536FF0h
  '00536F81: fld real4 ptr [esp+14h]
  '00536F85: fcomp real4 ptr [00405640h]
  '00536F8B: mov [esp+08h], eax
  '00536F8F: fstsw ax
  '00536F91: test ah, 01h
  '00536F94: jz 536FC6h
  '00536F96: fld real4 ptr [esp+1Ch]
  '00536F9A: fsub real4 ptr [esp+18h]
  '00536F9E: fld real4 ptr [esp+14h]
  '00536FA2: fsub real4 ptr [00405640h]
  '00536FA8: mov ecx, [esp+18h]
  '00536FAC: fmulp st(1), st(0)
  '00536FAE: mov [esp], ecx
  '00536FB2: fsubr real4 ptr [esp+18h]
  '00536FB6: fstp real4 ptr [esp+04h]
  '00536FBA: fstsw ax
  '00536FBC: test al, 0Dh
  '00536FBE: jnz 00537048h
  '00536FC4: jmp 536FF0h
  '00536FC6: fld real4 ptr [esp+1Ch]
  '00536FCA: fsub real4 ptr [esp+18h]
  '00536FCE: fld real4 ptr [esp+14h]
  '00536FD2: fsub real4 ptr [00405640h]
  '00536FD8: mov edx, [esp+18h]
  '00536FDC: fmulp st(1), st(0)
  '00536FDE: mov [esp+04h], edx
  '00536FE2: fadd real4 ptr [esp+18h]
  '00536FE6: fstp real4 ptr [esp]
  '00536FEA: fstsw ax
  '00536FEC: test al, 0Dh
  '00536FEE: jnz 537048h
  '00536FF0: fld real4 ptr [esp]
  '00536FF4: fmul real4 ptr [00407A5Ch]
  '00536FFA: push esi
  '00536FFB: mov esi, [0040135Ch]
  '00537001: fstsw ax
  '00537003: test al, 0Dh
  '00537005: jnz 537048h
  '00537007: call esi
  '00537009: fld real4 ptr [esp+08h]
  '0053700D: fmul real4 ptr [00407A5Ch]
  '00537013: mov ecx, [esp+24h]
  '00537017: mov [ecx], eax
  '00537019: fstsw ax
  '0053701B: test al, 0Dh
  '0053701D: jnz 537048h
  '0053701F: call esi
  '00537021: fld real4 ptr [esp+0Ch]
  '00537025: fmul real4 ptr [00407A5Ch]
  '0053702B: mov edx, [esp+28h]
  '0053702F: mov [edx], eax
  '00537031: fstsw ax
  '00537033: test al, 0Dh
  '00537035: jnz 537048h
  '00537037: call esi
  '00537039: mov ecx, [esp+2Ch]
  '0053703D: pop esi
  '0053703E: mov [ecx], eax
  '00537040: xor eax, eax
  '00537042: add esp, 0000000Ch
  '00537045: retn 001Ch
End Sub
Private Sub ShowPercentage_537050
  '00537050: mov ecx, [esp+08h]
  '00537054: mov edx, [esp+0Ch]
  '00537058: fld real4 ptr [ecx]
  '0053705A: fcomp real4 ptr [edx]
  '0053705C: fstsw ax
  '0053705E: test ah, 41h
  '00537061: jnz 53707Fh
  '00537063: mov edx, [esp+10h]
  '00537067: fld real4 ptr [ecx]
  '00537069: fcomp real4 ptr [edx]
  '0053706B: fstsw ax
  '0053706D: test ah, 41h
  '00537070: jnz 53709Bh
  '00537072: mov eax, [ecx]
  '00537074: mov ecx, [esp+14h]
  '00537078: mov [ecx], eax
  '0053707A: xor eax, eax
  '0053707C: retn 0014h
End Sub
Private Sub ShowPercentage_5370B0
  '005370B0: mov ecx, [esp+08h]
  '005370B4: mov edx, [esp+0Ch]
  '005370B8: fld real4 ptr [ecx]
  '005370BA: fcomp real4 ptr [edx]
  '005370BC: fstsw ax
  '005370BE: test ah, 01h
  '005370C1: jz 5370DFh
  '005370C3: mov edx, [esp+10h]
  '005370C7: fld real4 ptr [ecx]
  '005370C9: fcomp real4 ptr [edx]
  '005370CB: fstsw ax
  '005370CD: test ah, 01h
  '005370D0: jz 5370FBh
  '005370D2: mov eax, [ecx]
  '005370D4: mov ecx, [esp+14h]
  '005370D8: mov [ecx], eax
  '005370DA: xor eax, eax
  '005370DC: retn 0014h
End Sub
Private Sub Text_537110
  '00537110: sub esp, 00000094h
  '00537116: push esi
  '00537117: push edi
  '00537118: mov ecx, 00000025h
  '0053711D: xor eax, eax
  '0053711F: lea edi, [esp+08h]
  '00537123: rep stosd 
  '00537125: lea eax, [esp+08h]
  '00537129: mov [esp+08h], 00000094h
  '00537131: push eax
  '00537132: call 0041EF58h
  '00537137: call [0040109Ch]
  '0053713D: mov ecx, [esp+18h]
  '00537141: mov eax, [esp+000000A0h]
  '00537148: and ecx, 00000002h
  '0053714B: xor edi, edi
  '0053714D: or esi, FFFFFFFFh
  '00537150: xor edx, edx
  '00537152: cmp cl, 02h
  '00537155: mov ecx, [esp+0Ch]
  '00537159: setz dl
  '0053715C: neg edx
  '0053715E: cmp ecx, 00000005h
  '00537161: mov [eax+36h], di
  '00537165: mov [eax+38h], si
  '00537169: mov [eax+34h], dx
  '0053716D: jle 537184h
  '0053716F: mov [eax+38h], di
  '00537173: mov [eax+36h], si
  '00537177: pop edi
  '00537178: xor eax, eax
  '0053717A: pop esi
  '0053717B: add esp, 00000094h
  '00537181: retn 0004h
End Sub
Private Sub Text_5371C0
  '005371C0: push ebp
  '005371C1: mov ebp, esp
  '005371C3: sub esp, 0000000Ch
  '005371C6: push 004081B6h
  '005371CB: mov eax, fs:[00h]
  '005371D1: push eax
  '005371D2: mov fs:[00000000h], esp
  '005371D9: sub esp, 00000014h
  '005371DC: push ebx
  '005371DD: push esi
  '005371DE: push edi
  '005371DF: mov [ebp-0Ch], esp
  '005371E2: mov [ebp-08h], 00407C18h
  '005371E9: mov esi, [ebp+08h]
  '005371EC: mov eax, esi
  '005371EE: and eax, 00000001h
  '005371F1: mov [ebp-04h], eax
  '005371F4: and esi, FFFFFFFEh
  '005371F7: push esi
  '005371F8: mov [ebp+08h], esi
  '005371FB: mov ecx, [esi]
  '005371FD: call [ecx+04h]
  '00537200: mov edx, [esi]
  '00537202: xor eax, eax
  '00537204: push esi
  '00537205: mov [ebp-18h], eax
  '00537208: mov [ebp-1Ch], eax
  '0053720B: mov [esi+54h], 0069C85Dh
  '00537212: call [edx+000000ACh]
  '00537218: push 004099F4h
  '0053721D: call [00401200h]
  '00537223: mov ebx, [004010E4h]
  '00537229: push eax
  '0053722A: lea eax, [ebp-18h]
  '0053722D: push eax
  '0053722E: call ebx
  '00537230: lea ecx, [esi+5Ch]
  '00537233: push eax
  '00537234: push ecx
  '00537235: call [004010F8h]
  '0053723B: lea ecx, [ebp-18h]
  '0053723E: call [004013B8h]
  '00537244: push 0042CE38h
  '00537249: push 00427F88h
  '0053724E: mov word ptr [esi+52h], FFFFh
  '00537254: mov [esi+68h], 00000014h
  '0053725B: mov [esi+60h], 00000064h
  '00537262: lea edi, [esi+58h]
  '00537265: call [00401200h]
  '0053726B: lea edx, [ebp-18h]
  '0053726E: push eax
  '0053726F: push edx
  '00537270: call ebx
  '00537272: push eax
  '00537273: call [0040137Ch]
  '00537279: push eax
  '0053727A: lea eax, [ebp-1Ch]
  '0053727D: push eax
  '0053727E: call ebx
  '00537280: push eax
  '00537281: push edi
  '00537282: call [004010F8h]
  '00537288: lea ecx, [ebp-1Ch]
  '0053728B: lea edx, [ebp-18h]
  '0053728E: push ecx
  '0053728F: push edx
  '00537290: push 00000002h
  '00537292: call [00401064h]
  '00537298: mov eax, [edi]
  '0053729A: add esp, 0000000Ch
  '0053729D: mov ecx, [eax]
  '0053729F: push 00420F80h
  '005372A4: push eax
  '005372A5: call [ecx+10h]
  '005372A8: test eax, eax
  '005372AA: fclex 
  '005372AC: jnl 5372BFh
  '005372AE: mov edx, [edi]
  '005372B0: push 00000010h
  '005372B2: push 0042CE38h
  '005372B7: push edx
  '005372B8: push eax
  '005372B9: call [004010A0h]
  '005372BF: mov eax, [edi]
  '005372C1: fld real8 ptr [00407C10h]
  '005372C7: mov ebx, [eax]
  '005372C9: call [00401318h]
  '005372CF: mov ecx, [edi]
  '005372D1: push edx
  '005372D2: push eax
  '005372D3: push ecx
  '005372D4: call [ebx+18h]
  '005372D7: test eax, eax
  '005372D9: fclex 
  '005372DB: jnl 5372EEh
  '005372DD: mov edx, [edi]
  '005372DF: push 00000018h
  '005372E1: push 0042CE38h
  '005372E6: push edx
  '005372E7: push eax
  '005372E8: call [004010A0h]
  '005372EE: mov [esi+64h], 00000010h
  '005372F5: mov [ebp-04h], 00000000h
  '005372FC: wait 
  '005372FD: push 00537319h
  '00537302: jmp 537318h
  '00537304: lea eax, [ebp-1Ch]
  '00537307: lea ecx, [ebp-18h]
  '0053730A: push eax
  '0053730B: push ecx
  '0053730C: push 00000002h
  '0053730E: call [00401064h]
  '00537314: add esp, 0000000Ch
  '00537317: ret 
End Sub

