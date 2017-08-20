Private Sub unknown_5304E0
  '005304E0: push ebp
  '005304E1: mov ebp, esp
  '005304E3: sub esp, 0000000Ch
  '005304E6: push 004081B6h
  '005304EB: mov eax, fs:[00h]
  '005304F1: push eax
  '005304F2: mov fs:[00000000h], esp
  '005304F9: sub esp, 0000000Ch
  '005304FC: push ebx
  '005304FD: push esi
  '005304FE: push edi
  '005304FF: mov [ebp-0Ch], esp
  '00530502: mov [ebp-08h], 00407980h
  '00530509: xor edi, edi
  '0053050B: mov [ebp-04h], edi
  '0053050E: mov esi, [ebp+08h]
  '00530511: push esi
  '00530512: mov eax, [esi]
  '00530514: call [eax+04h]
  '00530517: mov edx, [esi+40h]
  '0053051A: xor ecx, ecx
  '0053051C: cmp edx, edi
  '0053051E: mov [ebp-18h], edi
  '00530521: setz cl
  '00530524: dec ecx
  '00530525: mov [ebp-18h], ecx
  '00530528: mov eax, [ebp+08h]
  '0053052B: push eax
  '0053052C: mov edx, [eax]
  '0053052E: call [edx+08h]
  '00530531: mov eax, [ebp+0Ch]
  '00530534: mov cx, [ebp-18h]
  '00530538: mov [eax], cx
  '0053053B: mov eax, [ebp-04h]
  '0053053E: mov ecx, [ebp-14h]
  '00530541: pop edi
  '00530542: pop esi
  '00530543: mov fs:[00000000h], ecx
  '0053054A: pop ebx
  '0053054B: mov esp, ebp
  '0053054D: pop ebp
  '0053054E: retn 0008h
End Sub
Private Sub unknown_530560
  '00530560: push ebp
  '00530561: mov ebp, esp
  '00530563: sub esp, 0000000Ch
  '00530566: push 004081B6h
  '0053056B: mov eax, fs:[00h]
  '00530571: push eax
  '00530572: mov fs:[00000000h], esp
  '00530579: sub esp, 0000000Ch
  '0053057C: push ebx
  '0053057D: push esi
  '0053057E: push edi
  '0053057F: mov [ebp-0Ch], esp
  '00530582: mov [ebp-08h], 00407988h
  '00530589: mov [ebp-04h], 00000000h
  '00530590: mov esi, [ebp+08h]
  '00530593: push esi
  '00530594: mov eax, [esi]
  '00530596: call [eax+04h]
  '00530599: cmp word ptr [ebp+0Ch], 0000h
  '0053059E: jz 5305B9h
  '005305A0: mov eax, [esi+40h]
  '005305A3: test eax, eax
  '005305A5: jnz 5305CCh
  '005305A7: call 0042CDC4h
  '005305AC: mov edi, eax
  '005305AE: call [0040109Ch]
  '005305B4: mov [esi+40h], edi
  '005305B7: jmp 5305CCh
  '005305B9: mov esi, [esi+40h]
  '005305BC: test esi, esi
  '005305BE: jz 5305CCh
  '005305C0: push esi
  '005305C1: call 0042CE0Ch
  '005305C6: call [0040109Ch]
  '005305CC: mov eax, [ebp+08h]
  '005305CF: push eax
  '005305D0: mov ecx, [eax]
  '005305D2: call [ecx+08h]
  '005305D5: mov eax, [ebp-04h]
  '005305D8: mov ecx, [ebp-14h]
  '005305DB: pop edi
  '005305DC: pop esi
  '005305DD: mov fs:[00000000h], ecx
  '005305E4: pop ebx
  '005305E5: mov esp, ebp
  '005305E7: pop ebp
  '005305E8: retn 0008h
End Sub
Private Sub unknown_5305F0
  '005305F0: push ebp
  '005305F1: mov ebp, esp
  '005305F3: sub esp, 0000000Ch
  '005305F6: push 004081B6h
  '005305FB: mov eax, fs:[00h]
  '00530601: push eax
  '00530602: mov fs:[00000000h], esp
  '00530609: sub esp, 00000018h
  '0053060C: push ebx
  '0053060D: push esi
  '0053060E: push edi
  '0053060F: mov [ebp-0Ch], esp
  '00530612: mov [ebp-08h], 00407990h
  '00530619: xor ebx, ebx
  '0053061B: mov [ebp-04h], ebx
  '0053061E: mov edi, [ebp+08h]
  '00530621: push edi
  '00530622: mov eax, [edi]
  '00530624: call [eax+04h]
  '00530627: mov ecx, [ebp+10h]
  '0053062A: mov edx, [ebp+14h]
  '0053062D: lea esi, [edi+48h]
  '00530630: mov [ebp-18h], ebx
  '00530633: mov [ebp-1Ch], ebx
  '00530636: mov [esi+04h], ecx
  '00530639: lea ecx, [ebp-1Ch]
  '0053063C: mov [esi], 00000028h
  '00530642: mov [esi+08h], edx
  '00530645: mov word ptr [esi+0Ch], 0001h
  '0053064B: mov word ptr [esi+0Eh], 0020h
  '00530651: mov [esi+10h], ebx
  '00530654: mov eax, [edi]
  '00530656: push ecx
  '00530657: push edi
  '00530658: call [eax+34h]
  '0053065B: cmp eax, ebx
  '0053065D: jnl 53066Eh
  '0053065F: push 00000034h
  '00530661: push 0042C8ECh
  '00530666: push edi
  '00530667: push eax
  '00530668: call [004010A0h]
  '0053066E: mov edx, [esi+08h]
  '00530671: mov eax, [ebp+0Ch]
  '00530674: imul edx, [ebp-1Ch]
  '00530678: jo 5306D1h
  '0053067A: push ebx
  '0053067B: add edi, 00000044h
  '0053067E: push ebx
  '0053067F: push edi
  '00530680: push ebx
  '00530681: push esi
  '00530682: push eax
  '00530683: mov [esi+14h], edx
  '00530686: call 0042CA30h
  '0053068B: mov [ebp-1Ch], eax
  '0053068E: call [0040109Ch]
  '00530694: mov eax, [ebp-1Ch]
  '00530697: mov ecx, [ebp+18h]
  '0053069A: xor edx, edx
  '0053069C: cmp eax, ebx
  '0053069E: setnz dl
  '005306A1: neg edx
  '005306A3: mov [ecx], eax
  '005306A5: mov [ebp-18h], edx
  '005306A8: mov eax, [ebp+08h]
  '005306AB: push eax
  '005306AC: mov ecx, [eax]
  '005306AE: call [ecx+08h]
  '005306B1: mov edx, [ebp+1Ch]
  '005306B4: mov ax, [ebp-18h]
  '005306B8: mov [edx], ax
  '005306BB: mov eax, [ebp-04h]
  '005306BE: mov ecx, [ebp-14h]
  '005306C1: pop edi
  '005306C2: pop esi
  '005306C3: mov fs:[00000000h], ecx
  '005306CA: pop ebx
  '005306CB: mov esp, ebp
  '005306CD: pop ebp
  '005306CE: retn 0018h
End Sub
Private Sub unknown_5306E0
  '005306E0: push ebp
  '005306E1: mov ebp, esp
  '005306E3: sub esp, 0000000Ch
  '005306E6: push 004081B6h
  '005306EB: mov eax, fs:[00h]
  '005306F1: push eax
  '005306F2: mov fs:[00000000h], esp
  '005306F9: sub esp, 0000003Ch
  '005306FC: push ebx
  '005306FD: push esi
  '005306FE: push edi
  '005306FF: mov [ebp-0Ch], esp
  '00530702: mov [ebp-08h], 00407998h
  '00530709: xor edi, edi
  '0053070B: mov [ebp-04h], edi
  '0053070E: mov esi, [ebp+08h]
  '00530711: push esi
  '00530712: mov eax, [esi]
  '00530714: call [eax+04h]
  '00530717: mov ecx, [ebp+10h]
  '0053071A: mov eax, [ebp+0Ch]
  '0053071D: lea edx, [ebp-44h]
  '00530720: mov [ebp-24h], edi
  '00530723: mov [ecx], edi
  '00530725: mov ecx, [eax]
  '00530727: mov ebx, [esi]
  '00530729: push edx
  '0053072A: push edi
  '0053072B: push edi
  '0053072C: lea edx, [ebp-34h]
  '0053072F: push ecx
  '00530730: push edx
  '00530731: mov [ebp-34h], edi
  '00530734: mov [ebp-44h], edi
  '00530737: call [004011E4h]
  '0053073D: add esp, 00000010h
  '00530740: push eax
  '00530741: call [0040130Ch]
  '00530747: push eax
  '00530748: push esi
  '00530749: call [ebx+2Ch]
  '0053074C: cmp eax, edi
  '0053074E: jnl 53075Fh
  '00530750: push 0000002Ch
  '00530752: push 0042C8ECh
  '00530757: push esi
  '00530758: push eax
  '00530759: call [004010A0h]
  '0053075F: lea eax, [ebp-44h]
  '00530762: lea ecx, [ebp-34h]
  '00530765: push eax
  '00530766: push ecx
  '00530767: push 00000002h
  '00530769: call [00401050h]
  '0053076F: add esp, 0000000Ch
  '00530772: push 0053079Dh
  '00530777: jmp 53079Ch
  '00530779: test byte ptr [ebp-04h], 04h
  '0053077D: jz 530788h
  '0053077F: lea ecx, [ebp-24h]
  '00530782: call [00401030h]
  '00530788: lea edx, [ebp-44h]
  '0053078B: lea eax, [ebp-34h]
  '0053078E: push edx
  '0053078F: push eax
  '00530790: push 00000002h
  '00530792: call [00401050h]
  '00530798: add esp, 0000000Ch
  '0053079B: ret 
End Sub
Private Sub unknown_5307E0
  '005307E0: push ebp
  '005307E1: mov ebp, esp
  '005307E3: sub esp, 0000000Ch
  '005307E6: push 004081B6h
  '005307EB: mov eax, fs:[00h]
  '005307F1: push eax
  '005307F2: mov fs:[00000000h], esp
  '005307F9: sub esp, 0000004Ch
  '005307FC: push ebx
  '005307FD: push esi
  '005307FE: push edi
  '005307FF: mov [ebp-0Ch], esp
  '00530802: mov [ebp-08h], 004079A8h
  '00530809: xor esi, esi
  '0053080B: mov [ebp-04h], esi
  '0053080E: mov ebx, [ebp+08h]
  '00530811: push ebx
  '00530812: mov eax, [ebx]
  '00530814: call [eax+04h]
  '00530817: mov ecx, 00000006h
  '0053081C: xor eax, eax
  '0053081E: lea edi, [ebp-48h]
  '00530821: lea edx, [ebp-48h]
  '00530824: rep stosd 
  '00530826: mov ecx, [ebp+10h]
  '00530829: mov eax, [ebp+0Ch]
  '0053082C: push edx
  '0053082D: push 00000018h
  '0053082F: push eax
  '00530830: mov [ebp-30h], esi
  '00530833: mov [ebp-50h], esi
  '00530836: mov [ecx], esi
  '00530838: call 0042CB1Ch
  '0053083D: mov esi, [0040109Ch]
  '00530843: call esi
  '00530845: mov eax, [ebp-40h]
  '00530848: mov ecx, [ebx]
  '0053084A: lea edx, [ebp-50h]
  '0053084D: push edx
  '0053084E: mov edx, [ebp-44h]
  '00530851: push eax
  '00530852: push edx
  '00530853: push ebx
  '00530854: call [ecx+30h]
  '00530857: test eax, eax
  '00530859: jnl 53086Ah
  '0053085B: push 00000030h
  '0053085D: push 0042C8ECh
  '00530862: push ebx
  '00530863: push eax
  '00530864: call [004010A0h]
  '0053086A: cmp word ptr [ebp-50h], 0000h
  '0053086F: jz 005308FCh
  '00530875: call 0042C9E4h
  '0053087A: mov edi, eax
  '0053087C: call esi
  '0053087E: push edi
  '0053087F: mov [ebp-18h], edi
  '00530882: call 0042C954h
  '00530887: mov edi, eax
  '00530889: call esi
  '0053088B: test edi, edi
  '0053088D: mov [ebp-1Ch], edi
  '00530890: jz 5308FCh
  '00530892: push edi
  '00530893: call 004275F8h
  '00530898: mov edi, eax
  '0053089A: call esi
  '0053089C: mov eax, [ebp-1Ch]
  '0053089F: mov ecx, [ebp-18h]
  '005308A2: push eax
  '005308A3: push ecx
  '005308A4: mov [ebp-20h], edi
  '005308A7: call 0042C998h
  '005308AC: call esi
  '005308AE: test edi, edi
  '005308B0: jz 5308FCh
  '005308B2: mov edx, [ebp+0Ch]
  '005308B5: push edx
  '005308B6: push edi
  '005308B7: call 00420BECh
  '005308BC: mov [ebp-54h], eax
  '005308BF: call esi
  '005308C1: mov eax, [ebx]
  '005308C3: push 00CC0020h
  '005308C8: push FFFFFFFFh
  '005308CA: push FFFFFFFFh
  '005308CC: push 00000000h
  '005308CE: push 00000000h
  '005308D0: push edi
  '005308D1: push ebx
  '005308D2: call [eax+40h]
  '005308D5: test eax, eax
  '005308D7: jnl 5308E8h
  '005308D9: push 00000040h
  '005308DB: push 0042C8ECh
  '005308E0: push ebx
  '005308E1: push eax
  '005308E2: call [004010A0h]
  '005308E8: mov ecx, [ebp-54h]
  '005308EB: push ecx
  '005308EC: push edi
  '005308ED: call 00420BECh
  '005308F2: call esi
  '005308F4: push edi
  '005308F5: call 00420C34h
  '005308FA: call esi
  '005308FC: push 0053090Eh
  '00530901: jmp 53090Dh
  '00530903: lea ecx, [ebp-30h]
  '00530906: call [00401030h]
  '0053090C: ret 
End Sub
Private Sub unknown_530950
  '00530950: push ebp
  '00530951: mov ebp, esp
  '00530953: sub esp, 0000000Ch
  '00530956: push 004081B6h
  '0053095B: mov eax, fs:[00h]
  '00530961: push eax
  '00530962: mov fs:[00000000h], esp
  '00530969: sub esp, 0000001Ch
  '0053096C: push ebx
  '0053096D: push esi
  '0053096E: push edi
  '0053096F: mov [ebp-0Ch], esp
  '00530972: mov [ebp-08h], 004079B8h
  '00530979: xor ebx, ebx
  '0053097B: mov [ebp-04h], ebx
  '0053097E: mov esi, [ebp+08h]
  '00530981: push esi
  '00530982: mov eax, [esi]
  '00530984: call [eax+04h]
  '00530987: mov ecx, [esi]
  '00530989: lea edx, [ebp-20h]
  '0053098C: push edx
  '0053098D: push esi
  '0053098E: mov [ebp-1Ch], ebx
  '00530991: mov [ebp-20h], ebx
  '00530994: call [ecx+1Ch]
  '00530997: cmp eax, ebx
  '00530999: jnl 5309AAh
  '0053099B: push 0000001Ch
  '0053099D: push 0042C8ECh
  '005309A2: push esi
  '005309A3: push eax
  '005309A4: call [004010A0h]
  '005309AA: mov eax, [ebp-20h]
  '005309AD: mov ecx, [esi]
  '005309AF: push esi
  '005309B0: mov [ebp-18h], eax
  '005309B3: call [ecx+68h]
  '005309B6: cmp eax, ebx
  '005309B8: jnl 5309C9h
  '005309BA: push 00000068h
  '005309BC: push 0042C8ECh
  '005309C1: push esi
  '005309C2: push eax
  '005309C3: call [004010A0h]
  '005309C9: push ebx
  '005309CA: call 004275F8h
  '005309CF: mov edi, eax
  '005309D1: call [0040109Ch]
  '005309D7: cmp edi, ebx
  '005309D9: mov [esi+3Ch], edi
  '005309DC: jz 00530A66h
  '005309E2: mov ecx, [ebp+10h]
  '005309E5: mov edx, [esi]
  '005309E7: lea eax, [ebp-20h]
  '005309EA: lea ebx, [esi+34h]
  '005309ED: push eax
  '005309EE: mov eax, [ebp+0Ch]
  '005309F1: push ebx
  '005309F2: push ecx
  '005309F3: push eax
  '005309F4: push edi
  '005309F5: push esi
  '005309F6: call [edx+24h]
  '005309F9: test eax, eax
  '005309FB: jnl 530A0Ch
  '005309FD: push 00000024h
  '005309FF: push 0042C8ECh
  '00530A04: push esi
  '00530A05: push eax
  '00530A06: call [004010A0h]
  '00530A0C: cmp word ptr [ebp-20h], 0000h
  '00530A11: jz 530A50h
  '00530A13: mov ecx, [ebx]
  '00530A15: mov edx, [esi+3Ch]
  '00530A18: push ecx
  '00530A19: push edx
  '00530A1A: call 00420BECh
  '00530A1F: mov edi, eax
  '00530A21: call [0040109Ch]
  '00530A27: mov ecx, [ebp-18h]
  '00530A2A: mov eax, [esi]
  '00530A2C: push ecx
  '00530A2D: push esi
  '00530A2E: mov [esi+38h], edi
  '00530A31: call [eax+20h]
  '00530A34: test eax, eax
  '00530A36: jnl 530A47h
  '00530A38: push 00000020h
  '00530A3A: push 0042C8ECh
  '00530A3F: push esi
  '00530A40: push eax
  '00530A41: call [004010A0h]
  '00530A47: mov [ebp-1Ch], FFFFFFFFh
  '00530A4E: jmp 530A66h
  '00530A50: mov edx, [esi+3Ch]
  '00530A53: push edx
  '00530A54: call 00420C34h
  '00530A59: call [0040109Ch]
  '00530A5F: mov [esi+3Ch], 00000000h
  '00530A66: mov eax, [ebp+08h]
  '00530A69: push eax
  '00530A6A: mov ecx, [eax]
  '00530A6C: call [ecx+08h]
  '00530A6F: mov edx, [ebp+14h]
  '00530A72: mov ax, [ebp-1Ch]
  '00530A76: mov [edx], ax
  '00530A79: mov eax, [ebp-04h]
  '00530A7C: mov ecx, [ebp-14h]
  '00530A7F: pop edi
  '00530A80: pop esi
  '00530A81: mov fs:[00000000h], ecx
  '00530A88: pop ebx
  '00530A89: mov esp, ebp
  '00530A8B: pop ebp
  '00530A8C: retn 0010h
End Sub
Private Sub unknown_530A90
  '00530A90: push ebp
  '00530A91: mov ebp, esp
  '00530A93: sub esp, 0000000Ch
  '00530A96: push 004081B6h
  '00530A9B: mov eax, fs:[00h]
  '00530AA1: push eax
  '00530AA2: mov fs:[00000000h], esp
  '00530AA9: sub esp, 0000000Ch
  '00530AAC: push ebx
  '00530AAD: push esi
  '00530AAE: push edi
  '00530AAF: mov [ebp-0Ch], esp
  '00530AB2: mov [ebp-08h], 004079C0h
  '00530AB9: xor edi, edi
  '00530ABB: mov [ebp-04h], edi
  '00530ABE: mov esi, [ebp+08h]
  '00530AC1: push esi
  '00530AC2: mov eax, [esi]
  '00530AC4: call [eax+04h]
  '00530AC7: mov ecx, [esi+4Ch]
  '00530ACA: mov [ebp-18h], edi
  '00530ACD: imul ecx, 04h
  '00530AD0: jo 530AFCh
  '00530AD2: mov [ebp-18h], ecx
  '00530AD5: mov eax, [ebp+08h]
  '00530AD8: push eax
  '00530AD9: mov edx, [eax]
  '00530ADB: call [edx+08h]
  '00530ADE: mov eax, [ebp+0Ch]
  '00530AE1: mov ecx, [ebp-18h]
  '00530AE4: mov [eax], ecx
  '00530AE6: mov eax, [ebp-04h]
  '00530AE9: mov ecx, [ebp-14h]
  '00530AEC: pop edi
  '00530AED: pop esi
  '00530AEE: mov fs:[00000000h], ecx
  '00530AF5: pop ebx
  '00530AF6: mov esp, ebp
  '00530AF8: pop ebp
  '00530AF9: retn 0008h
End Sub
Private Sub unknown_530B10
  '00530B10: push ebp
  '00530B11: mov ebp, esp
  '00530B13: sub esp, 0000000Ch
  '00530B16: push 004081B6h
  '00530B1B: mov eax, fs:[00h]
  '00530B21: push eax
  '00530B22: mov fs:[00000000h], esp
  '00530B29: sub esp, 0000000Ch
  '00530B2C: push ebx
  '00530B2D: push esi
  '00530B2E: push edi
  '00530B2F: mov [ebp-0Ch], esp
  '00530B32: mov [ebp-08h], 004079C8h
  '00530B39: xor edi, edi
  '00530B3B: mov [ebp-04h], edi
  '00530B3E: mov esi, [ebp+08h]
  '00530B41: push esi
  '00530B42: mov eax, [esi]
  '00530B44: call [eax+04h]
  '00530B47: mov ecx, [esi+4Ch]
  '00530B4A: mov [ebp-18h], edi
  '00530B4D: mov [ebp-18h], ecx
  '00530B50: mov eax, [ebp+08h]
  '00530B53: push eax
  '00530B54: mov edx, [eax]
  '00530B56: call [edx+08h]
  '00530B59: mov eax, [ebp+0Ch]
  '00530B5C: mov ecx, [ebp-18h]
  '00530B5F: mov [eax], ecx
  '00530B61: mov eax, [ebp-04h]
  '00530B64: mov ecx, [ebp-14h]
  '00530B67: pop edi
  '00530B68: pop esi
  '00530B69: mov fs:[00000000h], ecx
  '00530B70: pop ebx
  '00530B71: mov esp, ebp
  '00530B73: pop ebp
  '00530B74: retn 0008h
End Sub
Private Sub unknown_530B80
  '00530B80: push ebp
  '00530B81: mov ebp, esp
  '00530B83: sub esp, 0000000Ch
  '00530B86: push 004081B6h
  '00530B8B: mov eax, fs:[00h]
  '00530B91: push eax
  '00530B92: mov fs:[00000000h], esp
  '00530B99: sub esp, 0000000Ch
  '00530B9C: push ebx
  '00530B9D: push esi
  '00530B9E: push edi
  '00530B9F: mov [ebp-0Ch], esp
  '00530BA2: mov [ebp-08h], 004079D0h
  '00530BA9: xor edi, edi
  '00530BAB: mov [ebp-04h], edi
  '00530BAE: mov esi, [ebp+08h]
  '00530BB1: push esi
  '00530BB2: mov eax, [esi]
  '00530BB4: call [eax+04h]
  '00530BB7: mov ecx, [esi+50h]
  '00530BBA: mov [ebp-18h], edi
  '00530BBD: mov [ebp-18h], ecx
  '00530BC0: mov eax, [ebp+08h]
  '00530BC3: push eax
  '00530BC4: mov edx, [eax]
  '00530BC6: call [edx+08h]
  '00530BC9: mov eax, [ebp+0Ch]
  '00530BCC: mov ecx, [ebp-18h]
  '00530BCF: mov [eax], ecx
  '00530BD1: mov eax, [ebp-04h]
  '00530BD4: mov ecx, [ebp-14h]
  '00530BD7: pop edi
  '00530BD8: pop esi
  '00530BD9: mov fs:[00000000h], ecx
  '00530BE0: pop ebx
  '00530BE1: mov esp, ebp
  '00530BE3: pop ebp
  '00530BE4: retn 0008h
End Sub
Private Sub unknown_530BF0
  '00530BF0: push ebp
  '00530BF1: mov ebp, esp
  '00530BF3: sub esp, 0000000Ch
  '00530BF6: push 004081B6h
  '00530BFB: mov eax, fs:[00h]
  '00530C01: push eax
  '00530C02: mov fs:[00000000h], esp
  '00530C09: sub esp, 00000008h
  '00530C0C: push ebx
  '00530C0D: push esi
  '00530C0E: push edi
  '00530C0F: mov [ebp-0Ch], esp
  '00530C12: mov [ebp-08h], 004079D8h
  '00530C19: mov [ebp-04h], 00000000h
  '00530C20: mov esi, [ebp+08h]
  '00530C23: push esi
  '00530C24: mov eax, [esi]
  '00530C26: call [eax+04h]
  '00530C29: mov ecx, [ebp+18h]
  '00530C2C: test ecx, ecx
  '00530C2E: jnl 530C33h
  '00530C30: mov ecx, [esi+4Ch]
  '00530C33: mov eax, [ebp+1Ch]
  '00530C36: test eax, eax
  '00530C38: jnl 530C3Dh
  '00530C3A: mov eax, [esi+50h]
  '00530C3D: mov edx, [ebp+20h]
  '00530C40: push edx
  '00530C41: mov edx, [ebp+14h]
  '00530C44: push edx
  '00530C45: mov edx, [ebp+10h]
  '00530C48: push edx
  '00530C49: mov edx, [ebp+0Ch]
  '00530C4C: push edx
  '00530C4D: push eax
  '00530C4E: mov eax, [esi+3Ch]
  '00530C51: push ecx
  '00530C52: push 00000000h
  '00530C54: push 00000000h
  '00530C56: push eax
  '00530C57: call 00427568h
  '00530C5C: call [0040109Ch]
  '00530C62: mov eax, [ebp+08h]
  '00530C65: push eax
  '00530C66: mov ecx, [eax]
  '00530C68: call [ecx+08h]
  '00530C6B: mov eax, [ebp-04h]
  '00530C6E: mov ecx, [ebp-14h]
  '00530C71: pop edi
  '00530C72: pop esi
  '00530C73: mov fs:[00000000h], ecx
  '00530C7A: pop ebx
  '00530C7B: mov esp, ebp
  '00530C7D: pop ebp
  '00530C7E: retn 001Ch
End Sub
Private Sub unknown_530C90
  '00530C90: push ebp
  '00530C91: mov ebp, esp
  '00530C93: sub esp, 0000000Ch
  '00530C96: push 004081B6h
  '00530C9B: mov eax, fs:[00h]
  '00530CA1: push eax
  '00530CA2: mov fs:[00000000h], esp
  '00530CA9: sub esp, 00000028h
  '00530CAC: push ebx
  '00530CAD: push esi
  '00530CAE: push edi
  '00530CAF: mov [ebp-0Ch], esp
  '00530CB2: mov [ebp-08h], 004079E0h
  '00530CB9: xor edi, edi
  '00530CBB: mov [ebp-04h], edi
  '00530CBE: mov esi, [ebp+08h]
  '00530CC1: push esi
  '00530CC2: mov eax, [esi]
  '00530CC4: call [eax+04h]
  '00530CC7: mov edx, [ebp+0Ch]
  '00530CCA: lea ecx, [ebp-20h]
  '00530CCD: mov [ebp-20h], edi
  '00530CD0: mov [ebp-24h], edi
  '00530CD3: mov [ebp-34h], edi
  '00530CD6: call [004012D8h]
  '00530CDC: mov eax, [ebp-20h]
  '00530CDF: mov ecx, [esi]
  '00530CE1: lea edx, [ebp-34h]
  '00530CE4: push edx
  '00530CE5: mov edx, [esi+44h]
  '00530CE8: push eax
  '00530CE9: push edx
  '00530CEA: push esi
  '00530CEB: call [ecx+70h]
  '00530CEE: lea eax, [ebp-34h]
  '00530CF1: push eax
  '00530CF2: call [00401114h]
  '00530CF8: lea ecx, [ebp-34h]
  '00530CFB: mov [ebp-24h], eax
  '00530CFE: call [00401030h]
  '00530D04: push 00530D1Fh
  '00530D09: jmp 530D15h
  '00530D0B: lea ecx, [ebp-34h]
  '00530D0E: call [00401030h]
  '00530D14: ret 
End Sub
Private Sub unknown_5313D0
  '005313D0: push ebp
  '005313D1: mov ebp, esp
  '005313D3: sub esp, 0000000Ch
  '005313D6: push 004081B6h
  '005313DB: mov eax, fs:[00h]
  '005313E1: push eax
  '005313E2: mov fs:[00000000h], esp
  '005313E9: sub esp, 00000008h
  '005313EC: push ebx
  '005313ED: push esi
  '005313EE: push edi
  '005313EF: mov [ebp-0Ch], esp
  '005313F2: mov [ebp-08h], 00407A10h
  '005313F9: mov [ebp-04h], 00000000h
  '00531400: mov esi, [ebp+08h]
  '00531403: push esi
  '00531404: mov eax, [esi]
  '00531406: call [eax+04h]
  '00531409: mov ecx, [ebp+18h]
  '0053140C: test ecx, ecx
  '0053140E: jnl 531413h
  '00531410: mov ecx, [esi+4Ch]
  '00531413: mov eax, [ebp+1Ch]
  '00531416: test eax, eax
  '00531418: jnl 53141Dh
  '0053141A: mov eax, [esi+50h]
  '0053141D: mov edx, [esi+40h]
  '00531420: test edx, edx
  '00531422: jz 53144Eh
  '00531424: mov edi, [ebp+24h]
  '00531427: push 00000000h
  '00531429: push eax
  '0053142A: push ecx
  '0053142B: push edi
  '0053142C: mov edi, [ebp+20h]
  '0053142F: push edi
  '00531430: mov edi, [esi+44h]
  '00531433: add esi, 00000048h
  '00531436: push edi
  '00531437: push esi
  '00531438: push eax
  '00531439: mov eax, [ebp+10h]
  '0053143C: push ecx
  '0053143D: mov ecx, [ebp+14h]
  '00531440: push ecx
  '00531441: mov ecx, [ebp+0Ch]
  '00531444: push eax
  '00531445: push ecx
  '00531446: push edx
  '00531447: call 0042CE64h
  '0053144C: jmp 531471h
  '0053144E: mov edx, [ebp+28h]
  '00531451: push edx
  '00531452: mov edx, [ebp+24h]
  '00531455: push edx
  '00531456: mov edx, [ebp+20h]
  '00531459: push edx
  '0053145A: mov edx, [esi+3Ch]
  '0053145D: push edx
  '0053145E: mov edx, [ebp+0Ch]
  '00531461: push eax
  '00531462: mov eax, [ebp+14h]
  '00531465: push ecx
  '00531466: mov ecx, [ebp+10h]
  '00531469: push eax
  '0053146A: push ecx
  '0053146B: push edx
  '0053146C: call 00427568h
  '00531471: call [0040109Ch]
  '00531477: mov eax, [ebp+08h]
  '0053147A: push eax
  '0053147B: mov ecx, [eax]
  '0053147D: call [ecx+08h]
  '00531480: mov eax, [ebp-04h]
  '00531483: mov ecx, [ebp-14h]
  '00531486: pop edi
  '00531487: pop esi
  '00531488: mov fs:[00000000h], ecx
  '0053148F: pop ebx
  '00531490: mov esp, ebp
  '00531492: pop ebp
  '00531493: retn 0024h
End Sub
Private Sub unknown_5314A0
  '005314A0: push ebp
  '005314A1: mov ebp, esp
  '005314A3: sub esp, 0000000Ch
  '005314A6: push 004081B6h
  '005314AB: mov eax, fs:[00h]
  '005314B1: push eax
  '005314B2: mov fs:[00000000h], esp
  '005314B9: sub esp, 00000028h
  '005314BC: push ebx
  '005314BD: push esi
  '005314BE: push edi
  '005314BF: mov [ebp-0Ch], esp
  '005314C2: mov [ebp-08h], 00407A18h
  '005314C9: xor edi, edi
  '005314CB: mov [ebp-04h], edi
  '005314CE: mov esi, [ebp+08h]
  '005314D1: push esi
  '005314D2: mov eax, [esi]
  '005314D4: call [eax+04h]
  '005314D7: mov ebx, [ebp+18h]
  '005314DA: mov [ebp-18h], edi
  '005314DD: cmp ebx, edi
  '005314DF: mov [ebp-20h], edi
  '005314E2: mov [ebp-24h], edi
  '005314E5: mov [ebp-28h], edi
  '005314E8: mov [ebp-2Ch], edi
  '005314EB: jnl 5314F0h
  '005314ED: mov ebx, [esi+4Ch]
  '005314F0: mov edi, [ebp+1Ch]
  '005314F3: test edi, edi
  '005314F5: jnl 5314FAh
  '005314F7: mov edi, [esi+50h]
  '005314FA: mov esi, [00401208h]
  '00531500: xor ecx, ecx
  '00531502: call esi
  '00531504: xor ecx, ecx
  '00531506: mov [ebp-20h], al
  '00531509: call esi
  '0053150B: mov cl, [ebp+28h]
  '0053150E: mov [ebp-1Fh], al
  '00531511: mov [ebp-1Eh], cl
  '00531514: mov ecx, 00000001h
  '00531519: call esi
  '0053151B: mov [ebp-1Dh], al
  '0053151E: lea edx, [ebp-20h]
  '00531521: push 00000004h
  '00531523: lea eax, [ebp-18h]
  '00531526: push edx
  '00531527: push eax
  '00531528: call 0041D584h
  '0053152D: mov esi, [0040109Ch]
  '00531533: call esi
  '00531535: mov ecx, [ebp-18h]
  '00531538: mov edx, [ebp+24h]
  '0053153B: mov eax, [ebp+20h]
  '0053153E: push ecx
  '0053153F: mov ecx, [ebp+08h]
  '00531542: push edi
  '00531543: push ebx
  '00531544: push edx
  '00531545: mov edx, [ecx+3Ch]
  '00531548: mov ecx, [ebp+10h]
  '0053154B: push eax
  '0053154C: mov eax, [ebp+14h]
  '0053154F: push edx
  '00531550: mov edx, [ebp+0Ch]
  '00531553: push edi
  '00531554: push ebx
  '00531555: push eax
  '00531556: push ecx
  '00531557: push edx
  '00531558: call 0042CA84h
  '0053155D: mov [ebp-2Ch], eax
  '00531560: call esi
  '00531562: mov eax, [ebp-2Ch]
  '00531565: test eax, eax
  '00531567: jnz 5315BEh
  '00531569: call [00401300h]
  '0053156F: push eax
  '00531570: lea eax, [ebp-28h]
  '00531573: push eax
  '00531574: call [004010E4h]
  '0053157A: mov esi, eax
  '0053157C: lea edx, [ebp-2Ch]
  '0053157F: push edx
  '00531580: push esi
  '00531581: mov ecx, [esi]
  '00531583: call [ecx+4Ch]
  '00531586: test eax, eax
  '00531588: fclex 
  '0053158A: jnl 53159Bh
  '0053158C: push 0000004Ch
  '0053158E: push 0041E948h
  '00531593: push esi
  '00531594: push eax
  '00531595: call [004010A0h]
  '0053159B: mov eax, [ebp+08h]
  '0053159E: lea edx, [ebp-24h]
  '005315A1: push edx
  '005315A2: mov edx, [ebp-2Ch]
  '005315A5: mov ecx, [eax]
  '005315A7: push edx
  '005315A8: push eax
  '005315A9: call [ecx+74h]
  '005315AC: lea ecx, [ebp-24h]
  '005315AF: call [004013B4h]
  '005315B5: lea ecx, [ebp-28h]
  '005315B8: call [004013B8h]
  '005315BE: push 005315D9h
  '005315C3: jmp 5315D8h
  '005315C5: lea ecx, [ebp-24h]
  '005315C8: call [004013B4h]
  '005315CE: lea ecx, [ebp-28h]
  '005315D1: call [004013B8h]
  '005315D7: ret 
End Sub
Private Sub unknown_531600
  '00531600: push ebp
  '00531601: mov ebp, esp
  '00531603: sub esp, 0000000Ch
  '00531606: push 004081B6h
  '0053160B: mov eax, fs:[00h]
  '00531611: push eax
  '00531612: mov fs:[00000000h], esp
  '00531619: sub esp, 00000110h
  '0053161F: push ebx
  '00531620: push esi
  '00531621: push edi
  '00531622: mov [ebp-0Ch], esp
  '00531625: mov [ebp-08h], 00407A28h
  '0053162C: xor ebx, ebx
  '0053162E: mov [ebp-04h], ebx
  '00531631: mov eax, [ebp+08h]
  '00531634: push eax
  '00531635: mov ecx, [eax]
  '00531637: call [ecx+04h]
  '0053163A: mov ecx, 00000008h
  '0053163F: xor eax, eax
  '00531641: lea edi, [ebp-34h]
  '00531644: mov [ebp-60h], ebx
  '00531647: rep stosd 
  '00531649: mov ecx, 00000008h
  '0053164E: lea edi, [ebp-58h]
  '00531651: rep stosd 
  '00531653: mov edi, [ebp+10h]
  '00531656: lea eax, [ebp-78h]
  '00531659: mov [ebp-64h], ebx
  '0053165C: mov [ebp-78h], ebx
  '0053165F: mov esi, [edi]
  '00531661: mov [ebp-7Ch], ebx
  '00531664: mov [ebp-54h], 00000001h
  '0053166B: mov word ptr [ebp-58h], 0002h
  '00531671: mov [ebp-44h], ebx
  '00531674: mov edx, [esi]
  '00531676: push eax
  '00531677: push esi
  '00531678: mov [ebp-38h], ebx
  '0053167B: mov [ebp-68h], ebx
  '0053167E: call [edx+3Ch]
  '00531681: cmp eax, ebx
  '00531683: fclex 
  '00531685: jnl 53169Ah
  '00531687: push 0000003Ch
  '00531689: push 0042C8ECh
  '0053168E: push esi
  '0053168F: mov esi, [004010A0h]
  '00531695: push eax
  '00531696: call esi
  '00531698: jmp 5316A0h
  '0053169A: mov esi, [004010A0h]
  '005316A0: mov ecx, [ebp-78h]
  '005316A3: mov edi, [edi]
  '005316A5: lea eax, [ebp-78h]
  '005316A8: mov [ebp-48h], ecx
  '005316AB: mov [ebp-3Ch], ebx
  '005316AE: mov edx, [edi]
  '005316B0: push eax
  '005316B1: push edi
  '005316B2: call [edx+34h]
  '005316B5: cmp eax, ebx
  '005316B7: fclex 
  '005316B9: jnl 5316C6h
  '005316BB: push 00000034h
  '005316BD: push 0042C8ECh
  '005316C2: push edi
  '005316C3: push eax
  '005316C4: call esi
  '005316C6: mov edx, [ebp+10h]
  '005316C9: mov ecx, [ebp-78h]
  '005316CC: mov [ebp-40h], ecx
  '005316CF: lea ecx, [ebp-78h]
  '005316D2: mov edi, [edx]
  '005316D4: push ecx
  '005316D5: push edi
  '005316D6: mov eax, [edi]
  '005316D8: call [eax+5Ch]
  '005316DB: cmp eax, ebx
  '005316DD: fclex 
  '005316DF: jnl 5316ECh
  '005316E1: push 0000005Ch
  '005316E3: push 0042C8ECh
  '005316E8: push edi
  '005316E9: push eax
  '005316EA: call esi
  '005316EC: mov edx, [ebp-78h]
  '005316EF: lea eax, [ebp-64h]
  '005316F2: push eax
  '005316F3: mov [ebp-4Ch], edx
  '005316F6: call 0042C914h
  '005316FB: mov ebx, [0040109Ch]
  '00531701: mov [ebp-78h], eax
  '00531704: call ebx
  '00531706: lea ecx, [ebp-58h]
  '00531709: push ecx
  '0053170A: call [00401288h]
  '00531710: mov [ebp-7Ch], eax
  '00531713: mov eax, [ebp-78h]
  '00531716: lea edx, [ebp-7Ch]
  '00531719: push 00000004h
  '0053171B: push edx
  '0053171C: push eax
  '0053171D: call 0041D584h
  '00531722: call ebx
  '00531724: mov ecx, [ebp+0Ch]
  '00531727: lea eax, [ebp-78h]
  '0053172A: mov [ebp-30h], 00000001h
  '00531731: mov word ptr [ebp-34h], 0002h
  '00531737: mov edi, [ecx]
  '00531739: mov [ebp-20h], 00000000h
  '00531740: push eax
  '00531741: push edi
  '00531742: mov edx, [edi]
  '00531744: call [edx+3Ch]
  '00531747: test eax, eax
  '00531749: fclex 
  '0053174B: jnl 531758h
  '0053174D: push 0000003Ch
  '0053174F: push 0042C8ECh
  '00531754: push edi
  '00531755: push eax
  '00531756: call esi
  '00531758: mov edx, [ebp+0Ch]
  '0053175B: mov ecx, [ebp-78h]
  '0053175E: mov [ebp-24h], ecx
  '00531761: lea ecx, [ebp-78h]
  '00531764: mov edi, [edx]
  '00531766: mov [ebp-18h], 00000000h
  '0053176D: push ecx
  '0053176E: push edi
  '0053176F: mov eax, [edi]
  '00531771: call [eax+34h]
  '00531774: test eax, eax
  '00531776: fclex 
  '00531778: jnl 531785h
  '0053177A: push 00000034h
  '0053177C: push 0042C8ECh
  '00531781: push edi
  '00531782: push eax
  '00531783: call esi
  '00531785: mov eax, [ebp+0Ch]
  '00531788: mov edx, [ebp-78h]
  '0053178B: mov [ebp-1Ch], edx
  '0053178E: lea edx, [ebp-78h]
  '00531791: mov edi, [eax]
  '00531793: push edx
  '00531794: push edi
  '00531795: mov ecx, [edi]
  '00531797: call [ecx+5Ch]
  '0053179A: test eax, eax
  '0053179C: fclex 
  '0053179E: jnl 5317ABh
  '005317A0: push 0000005Ch
  '005317A2: push 0042C8ECh
  '005317A7: push edi
  '005317A8: push eax
  '005317A9: call esi
  '005317AB: mov eax, [ebp-78h]
  '005317AE: lea ecx, [ebp-60h]
  '005317B1: push ecx
  '005317B2: mov [ebp-28h], eax
  '005317B5: call 0042C914h
  '005317BA: mov [ebp-78h], eax
  '005317BD: call ebx
  '005317BF: lea edx, [ebp-34h]
  '005317C2: push edx
  '005317C3: call [00401288h]
  '005317C9: mov ecx, [ebp-78h]
  '005317CC: mov [ebp-7Ch], eax
  '005317CF: lea eax, [ebp-7Ch]
  '005317D2: push 00000004h
  '005317D4: push eax
  '005317D5: push ecx
  '005317D6: call 0041D584h
  '005317DB: call ebx
  '005317DD: cmp [ebp+1Ch], FFFFFFFFh
  '005317E1: jnz 0053189Fh
  '005317E7: mov edx, [ebp+0Ch]
  '005317EA: lea ecx, [ebp-78h]
  '005317ED: push ecx
  '005317EE: mov edi, [edx]
  '005317F0: push edi
  '005317F1: mov eax, [edi]
  '005317F3: call [eax+38h]
  '005317F6: test eax, eax
  '005317F8: fclex 
  '005317FA: jnl 531807h
  '005317FC: push 00000038h
  '005317FE: push 0042C8ECh
  '00531803: push edi
  '00531804: push eax
  '00531805: call esi
  '00531807: mov ebx, [ebp+10h]
  '0053180A: mov edx, [ebp-78h]
  '0053180D: lea ecx, [ebp-78h]
  '00531810: mov [ebp+1Ch], edx
  '00531813: mov edi, [ebx]
  '00531815: push ecx
  '00531816: push edi
  '00531817: mov eax, [edi]
  '00531819: call [eax+38h]
  '0053181C: test eax, eax
  '0053181E: fclex 
  '00531820: jnl 53182Dh
  '00531822: push 00000038h
  '00531824: push 0042C8ECh
  '00531829: push edi
  '0053182A: push eax
  '0053182B: call esi
  '0053182D: mov edx, [ebp+1Ch]
  '00531830: mov eax, [ebp-78h]
  '00531833: cmp edx, eax
  '00531835: jle 531879h
  '00531837: mov edi, [ebx]
  '00531839: lea ecx, [ebp-78h]
  '0053183C: push ecx
  '0053183D: push edi
  '0053183E: mov eax, [edi]
  '00531840: call [eax+38h]
  '00531843: test eax, eax
  '00531845: fclex 
  '00531847: jnl 531854h
  '00531849: push 00000038h
  '0053184B: push 0042C8ECh
  '00531850: push edi
  '00531851: push eax
  '00531852: call esi
  '00531854: mov edi, [ebx]
  '00531856: lea eax, [ebp-78h]
  '00531859: push eax
  '0053185A: push edi
  '0053185B: mov edx, [edi]
  '0053185D: call [edx+34h]
  '00531860: test eax, eax
  '00531862: fclex 
  '00531864: jnl 531871h
  '00531866: push 00000034h
  '00531868: push 0042C8ECh
  '0053186D: push edi
  '0053186E: push eax
  '0053186F: call esi
  '00531871: mov ecx, [ebp-78h]
  '00531874: mov [ebp-38h], ecx
  '00531877: jmp 53189Fh
  '00531879: mov edx, [ebp+0Ch]
  '0053187C: lea ecx, [ebp-78h]
  '0053187F: push ecx
  '00531880: mov edi, [edx]
  '00531882: push edi
  '00531883: mov eax, [edi]
  '00531885: call [eax+34h]
  '00531888: test eax, eax
  '0053188A: fclex 
  '0053188C: jnl 531899h
  '0053188E: push 00000034h
  '00531890: push 0042C8ECh
  '00531895: push edi
  '00531896: push eax
  '00531897: call esi
  '00531899: mov edx, [ebp-78h]
  '0053189C: mov [ebp-38h], edx
  '0053189F: cmp [ebp+20h], FFFFFFFFh
  '005318A3: jnz 0053195Ch
  '005318A9: mov eax, [ebp+0Ch]
  '005318AC: lea edx, [ebp-78h]
  '005318AF: push edx
  '005318B0: mov edi, [eax]
  '005318B2: push edi
  '005318B3: mov ecx, [edi]
  '005318B5: call [ecx+3Ch]
  '005318B8: test eax, eax
  '005318BA: fclex 
  '005318BC: jnl 5318C9h
  '005318BE: push 0000003Ch
  '005318C0: push 0042C8ECh
  '005318C5: push edi
  '005318C6: push eax
  '005318C7: call esi
  '005318C9: mov eax, [ebp+10h]
  '005318CC: mov ebx, [ebp-78h]
  '005318CF: lea edx, [ebp-78h]
  '005318D2: mov edi, [eax]
  '005318D4: push edx
  '005318D5: push edi
  '005318D6: mov ecx, [edi]
  '005318D8: call [ecx+3Ch]
  '005318DB: test eax, eax
  '005318DD: fclex 
  '005318DF: jnl 5318ECh
  '005318E1: push 0000003Ch
  '005318E3: push 0042C8ECh
  '005318E8: push edi
  '005318E9: push eax
  '005318EA: call esi
  '005318EC: cmp ebx, [ebp-78h]
  '005318EF: jle 531936h
  '005318F1: mov ebx, [ebp+10h]
  '005318F4: lea ecx, [ebp-78h]
  '005318F7: push ecx
  '005318F8: mov edi, [ebx]
  '005318FA: push edi
  '005318FB: mov eax, [edi]
  '005318FD: call [eax+3Ch]
  '00531900: test eax, eax
  '00531902: fclex 
  '00531904: jnl 531911h
  '00531906: push 0000003Ch
  '00531908: push 0042C8ECh
  '0053190D: push edi
  '0053190E: push eax
  '0053190F: call esi
  '00531911: mov edi, [ebx]
  '00531913: lea eax, [ebp-78h]
  '00531916: push eax
  '00531917: push edi
  '00531918: mov edx, [edi]
  '0053191A: call [edx+3Ch]
  '0053191D: test eax, eax
  '0053191F: fclex 
  '00531921: jnl 53192Eh
  '00531923: push 0000003Ch
  '00531925: push 0042C8ECh
  '0053192A: push edi
  '0053192B: push eax
  '0053192C: call esi
  '0053192E: mov ecx, [ebp-78h]
  '00531931: mov [ebp-68h], ecx
  '00531934: jmp 53195Ch
  '00531936: mov edx, [ebp+0Ch]
  '00531939: lea ecx, [ebp-78h]
  '0053193C: push ecx
  '0053193D: mov edi, [edx]
  '0053193F: push edi
  '00531940: mov eax, [edi]
  '00531942: call [eax+3Ch]
  '00531945: test eax, eax
  '00531947: fclex 
  '00531949: jnl 531956h
  '0053194B: push 0000003Ch
  '0053194D: push 0042C8ECh
  '00531952: push edi
  '00531953: push eax
  '00531954: call esi
  '00531956: mov edx, [ebp-78h]
  '00531959: mov [ebp-68h], edx
  '0053195C: mov eax, [ebp-38h]
  '0053195F: mov ebx, [00401178h]
  '00531965: sub eax, 00000004h
  '00531968: jo 00532014h
  '0053196E: xor edi, edi
  '00531970: mov [ebp-000000A8h], eax
  '00531976: mov [ebp-74h], edi
  '00531979: cmp edi, [ebp-000000A8h]
  '0053197F: jnle 00531F87h
  '00531985: mov eax, [ebp+14h]
  '00531988: imul eax, 04h
  '0053198B: jo 00532014h
  '00531991: add eax, edi
  '00531993: jo 00532014h
  '00531999: mov [ebp-70h], eax
  '0053199C: mov eax, [ebp-68h]
  '0053199F: sub eax, 00000001h
  '005319A2: jo 00532014h
  '005319A8: xor esi, esi
  '005319AA: mov [ebp-000000B0h], eax
  '005319B0: mov [ebp-6Ch], esi
  '005319B3: cmp esi, eax
  '005319B5: jnle 00531F70h
  '005319BB: mov edx, [ebp+18h]
  '005319BE: mov eax, esi
  '005319C0: add eax, edx
  '005319C2: jo 00532014h
  '005319C8: mov [ebp-5Ch], eax
  '005319CB: mov eax, [ebp-64h]
  '005319CE: test eax, eax
  '005319D0: jz 531A04h
  '005319D2: cmp word ptr [eax], 0002h
  '005319D6: jnz 531A04h
  '005319D8: mov edx, [eax+1Ch]
  '005319DB: mov ecx, [eax+18h]
  '005319DE: sub edi, edx
  '005319E0: cmp edi, ecx
  '005319E2: jb 5319E6h
  '005319E4: call ebx
  '005319E6: mov eax, [ebp-64h]
  '005319E9: mov edx, [eax+14h]
  '005319EC: mov ecx, [eax+10h]
  '005319EF: sub esi, edx
  '005319F1: cmp esi, ecx
  '005319F3: jb 5319F7h
  '005319F5: call ebx
  '005319F7: mov eax, [ebp-64h]
  '005319FA: mov ebx, [eax+18h]
  '005319FD: imul ebx, esi
  '00531A00: add ebx, edi
  '00531A02: jmp 531A0Ch
  '00531A04: call [00401178h]
  '00531A0A: mov ebx, eax
  '00531A0C: mov eax, [ebp-60h]
  '00531A0F: mov [ebp-000000BCh], ebx
  '00531A15: test eax, eax
  '00531A17: jz 531A65h
  '00531A19: cmp word ptr [eax], 0002h
  '00531A1D: jnz 531A65h
  '00531A1F: mov ecx, [ebp-70h]
  '00531A22: mov esi, [eax+1Ch]
  '00531A25: mov edx, [eax+18h]
  '00531A28: sub ecx, esi
  '00531A2A: cmp ecx, edx
  '00531A2C: mov [ebp-00000098h], ecx
  '00531A32: jb 531A3Dh
  '00531A34: call [00401178h]
  '00531A3A: mov eax, [ebp-60h]
  '00531A3D: mov esi, [ebp-5Ch]
  '00531A40: mov edx, [eax+14h]
  '00531A43: mov ecx, [eax+10h]
  '00531A46: sub esi, edx
  '00531A48: cmp esi, ecx
  '00531A4A: jb 531A55h
  '00531A4C: call [00401178h]
  '00531A52: mov eax, [ebp-60h]
  '00531A55: mov edi, [eax+18h]
  '00531A58: mov ecx, [ebp-00000098h]
  '00531A5E: imul edi, esi
  '00531A61: add edi, ecx
  '00531A63: jmp 531A70h
  '00531A65: call [00401178h]
  '00531A6B: mov edi, eax
  '00531A6D: mov eax, [ebp-60h]
  '00531A70: test eax, eax
  '00531A72: jz 531AC6h
  '00531A74: cmp word ptr [eax], 0002h
  '00531A78: jnz 531AC6h
  '00531A7A: mov ecx, [ebp-70h]
  '00531A7D: mov esi, [eax+1Ch]
  '00531A80: mov edx, [eax+18h]
  '00531A83: sub ecx, esi
  '00531A85: cmp ecx, edx
  '00531A87: mov [ebp-00000088h], ecx
  '00531A8D: jb 531A98h
  '00531A8F: call [00401178h]
  '00531A95: mov eax, [ebp-60h]
  '00531A98: mov ebx, [ebp-5Ch]
  '00531A9B: mov edx, [eax+14h]
  '00531A9E: mov ecx, [eax+10h]
  '00531AA1: sub ebx, edx
  '00531AA3: cmp ebx, ecx
  '00531AA5: jb 531AB0h
  '00531AA7: call [00401178h]
  '00531AAD: mov eax, [ebp-60h]
  '00531AB0: mov esi, [eax+18h]
  '00531AB3: mov ecx, [ebp-00000088h]
  '00531AB9: imul esi, ebx
  '00531ABC: mov ebx, [ebp-000000BCh]
  '00531AC2: add esi, ecx
  '00531AC4: jmp 531AD1h
  '00531AC6: call [00401178h]
  '00531ACC: mov esi, eax
  '00531ACE: mov eax, [ebp-60h]
  '00531AD1: fild dword ptr [ebp+24h]
  '00531AD4: mov ecx, [eax+0Ch]
  '00531AD7: mov eax, [ebp-64h]
  '00531ADA: xor edx, edx
  '00531ADC: fstp real8 ptr [ebp-000000C4h]
  '00531AE2: fld real8 ptr [ebp-000000C4h]
  '00531AE8: cmp [00541000h], 00000000h
  '00531AEF: jnz 531AF9h
  '00531AF1: fdiv real8 ptr [00406D50h]
  '00531AF7: jmp 531B0Ah
  '00531AF9: push [00406D54h]
  '00531AFF: push [00406D50h]
  '00531B05: call 004081D4h
  '00531B0A: mov dl, [ecx+edi]
  '00531B0D: mov ecx, [eax+0Ch]
  '00531B10: mov [ebp-000000C8h], edx
  '00531B16: xor edx, edx
  '00531B18: mov dl, [ecx+ebx]
  '00531B1B: imul edx, [ebp+24h]
  '00531B1F: fsubr real8 ptr [004019B8h]
  '00531B25: fild dword ptr [ebp-000000C8h]
  '00531B2B: jo 00532014h
  '00531B31: fstp real8 ptr [ebp-000000D0h]
  '00531B37: fmul real8 ptr [ebp-000000D0h]
  '00531B3D: mov [ebp-000000D4h], edx
  '00531B43: fild dword ptr [ebp-000000D4h]
  '00531B49: fstp real8 ptr [ebp-000000DCh]
  '00531B4F: fld real8 ptr [ebp-000000DCh]
  '00531B55: cmp [00541000h], 00000000h
  '00531B5C: jnz 531B66h
  '00531B5E: fdiv real8 ptr [00406D50h]
  '00531B64: jmp 531B77h
  '00531B66: push [00406D54h]
  '00531B6C: push [00406D50h]
  '00531B72: call 004081D4h
  '00531B77: faddp st(1), st(0)
  '00531B79: fstsw ax
  '00531B7B: test al, 0Dh
  '00531B7D: jnz 0053200Fh
  '00531B83: call [004011C4h]
  '00531B89: mov ecx, [ebp-60h]
  '00531B8C: mov edx, [ecx+0Ch]
  '00531B8F: mov [edx+esi], al
  '00531B92: mov eax, [ebp-64h]
  '00531B95: test eax, eax
  '00531B97: jz 531BE0h
  '00531B99: cmp word ptr [eax], 0002h
  '00531B9D: jnz 531BE0h
  '00531B9F: mov esi, [ebp-74h]
  '00531BA2: mov edx, [eax+1Ch]
  '00531BA5: mov ecx, [eax+18h]
  '00531BA8: mov ebx, [00401178h]
  '00531BAE: add esi, 00000001h
  '00531BB1: jo 00532014h
  '00531BB7: sub esi, edx
  '00531BB9: cmp esi, ecx
  '00531BBB: jb 531BBFh
  '00531BBD: call ebx
  '00531BBF: mov eax, [ebp-64h]
  '00531BC2: mov edi, [ebp-6Ch]
  '00531BC5: mov edx, [eax+14h]
  '00531BC8: mov ecx, [eax+10h]
  '00531BCB: sub edi, edx
  '00531BCD: cmp edi, ecx
  '00531BCF: jb 531BD3h
  '00531BD1: call ebx
  '00531BD3: mov eax, [ebp-64h]
  '00531BD6: mov eax, [eax+18h]
  '00531BD9: imul eax, edi
  '00531BDC: add eax, esi
  '00531BDE: jmp 531BE8h
  '00531BE0: mov ebx, [00401178h]
  '00531BE6: call ebx
  '00531BE8: mov [ebp-000000E0h], eax
  '00531BEE: mov eax, [ebp-60h]
  '00531BF1: test eax, eax
  '00531BF3: jz 531C36h
  '00531BF5: cmp word ptr [eax], 0002h
  '00531BF9: jnz 531C36h
  '00531BFB: mov esi, [ebp-70h]
  '00531BFE: mov edx, [eax+1Ch]
  '00531C01: mov ecx, [eax+18h]
  '00531C04: add esi, 00000001h
  '00531C07: jo 00532014h
  '00531C0D: sub esi, edx
  '00531C0F: cmp esi, ecx
  '00531C11: jb 531C18h
  '00531C13: call ebx
  '00531C15: mov eax, [ebp-60h]
  '00531C18: mov edi, [ebp-5Ch]
  '00531C1B: mov edx, [eax+14h]
  '00531C1E: mov ecx, [eax+10h]
  '00531C21: sub edi, edx
  '00531C23: cmp edi, ecx
  '00531C25: jb 531C2Ch
  '00531C27: call ebx
  '00531C29: mov eax, [ebp-60h]
  '00531C2C: mov ebx, [eax+18h]
  '00531C2F: imul ebx, edi
  '00531C32: add ebx, esi
  '00531C34: jmp 531C41h
  '00531C36: call [00401178h]
  '00531C3C: mov ebx, eax
  '00531C3E: mov eax, [ebp-60h]
  '00531C41: test eax, eax
  '00531C43: jz 531CA0h
  '00531C45: cmp word ptr [eax], 0002h
  '00531C49: jnz 531CA0h
  '00531C4B: mov edi, [ebp-70h]
  '00531C4E: mov edx, [eax+1Ch]
  '00531C51: mov ecx, [eax+18h]
  '00531C54: add edi, 00000001h
  '00531C57: jo 00532014h
  '00531C5D: sub edi, edx
  '00531C5F: cmp edi, ecx
  '00531C61: jb 531C6Ch
  '00531C63: call [00401178h]
  '00531C69: mov eax, [ebp-60h]
  '00531C6C: mov ecx, [ebp-5Ch]
  '00531C6F: mov esi, [eax+14h]
  '00531C72: mov edx, [eax+10h]
  '00531C75: sub ecx, esi
  '00531C77: cmp ecx, edx
  '00531C79: mov [ebp-00000084h], ecx
  '00531C7F: jb 531C90h
  '00531C81: call [00401178h]
  '00531C87: mov eax, [ebp-60h]
  '00531C8A: mov ecx, [ebp-00000084h]
  '00531C90: mov esi, [eax+18h]
  '00531C93: imul esi, ecx
  '00531C96: add esi, edi
  '00531C98: mov edi, [00401178h]
  '00531C9E: jmp 531CADh
  '00531CA0: mov edi, [00401178h]
  '00531CA6: call edi
  '00531CA8: mov esi, eax
  '00531CAA: mov eax, [ebp-60h]
  '00531CAD: fild dword ptr [ebp+24h]
  '00531CB0: mov ecx, [eax+0Ch]
  '00531CB3: mov eax, [ebp-64h]
  '00531CB6: xor edx, edx
  '00531CB8: fstp real8 ptr [ebp-000000E8h]
  '00531CBE: fld real8 ptr [ebp-000000E8h]
  '00531CC4: cmp [00541000h], 00000000h
  '00531CCB: jnz 531CD5h
  '00531CCD: fdiv real8 ptr [00406D50h]
  '00531CD3: jmp 531CE6h
  '00531CD5: push [00406D54h]
  '00531CDB: push [00406D50h]
  '00531CE1: call 004081D4h
  '00531CE6: mov dl, [ecx+ebx]
  '00531CE9: mov ecx, [eax+0Ch]
  '00531CEC: mov eax, [ebp-000000E0h]
  '00531CF2: mov [ebp-000000ECh], edx
  '00531CF8: xor edx, edx
  '00531CFA: mov dl, [ecx+eax]
  '00531CFD: imul edx, [ebp+24h]
  '00531D01: fsubr real8 ptr [004019B8h]
  '00531D07: fild dword ptr [ebp-000000ECh]
  '00531D0D: jo 00532014h
  '00531D13: fstp real8 ptr [ebp-000000F4h]
  '00531D19: fmul real8 ptr [ebp-000000F4h]
  '00531D1F: mov [ebp-000000F8h], edx
  '00531D25: fild dword ptr [ebp-000000F8h]
  '00531D2B: fstp real8 ptr [ebp-00000100h]
  '00531D31: fld real8 ptr [ebp-00000100h]
  '00531D37: cmp [00541000h], 00000000h
  '00531D3E: jnz 531D48h
  '00531D40: fdiv real8 ptr [00406D50h]
  '00531D46: jmp 531D59h
  '00531D48: push [00406D54h]
  '00531D4E: push [00406D50h]
  '00531D54: call 004081D4h
  '00531D59: faddp st(1), st(0)
  '00531D5B: fstsw ax
  '00531D5D: test al, 0Dh
  '00531D5F: jnz 0053200Fh
  '00531D65: call [004011C4h]
  '00531D6B: mov ecx, [ebp-60h]
  '00531D6E: mov edx, [ecx+0Ch]
  '00531D71: mov [edx+esi], al
  '00531D74: mov eax, [ebp-64h]
  '00531D77: test eax, eax
  '00531D79: jz 531DBCh
  '00531D7B: cmp word ptr [eax], 0002h
  '00531D7F: jnz 531DBCh
  '00531D81: mov esi, [ebp-74h]
  '00531D84: mov edx, [eax+1Ch]
  '00531D87: mov ecx, [eax+18h]
  '00531D8A: add esi, 00000002h
  '00531D8D: jo 00532014h
  '00531D93: sub esi, edx
  '00531D95: cmp esi, ecx
  '00531D97: jb 531D9Bh
  '00531D99: call edi
  '00531D9B: mov eax, [ebp-64h]
  '00531D9E: mov ebx, [ebp-6Ch]
  '00531DA1: mov edx, [eax+14h]
  '00531DA4: mov ecx, [eax+10h]
  '00531DA7: sub ebx, edx
  '00531DA9: cmp ebx, ecx
  '00531DAB: jb 531DAFh
  '00531DAD: call edi
  '00531DAF: mov eax, [ebp-64h]
  '00531DB2: mov eax, [eax+18h]
  '00531DB5: imul eax, ebx
  '00531DB8: add eax, esi
  '00531DBA: jmp 531DBEh
  '00531DBC: call edi
  '00531DBE: mov [ebp-00000104h], eax
  '00531DC4: mov eax, [ebp-60h]
  '00531DC7: test eax, eax
  '00531DC9: jz 531E10h
  '00531DCB: cmp word ptr [eax], 0002h
  '00531DCF: jnz 531E10h
  '00531DD1: mov esi, [ebp-70h]
  '00531DD4: mov edx, [eax+1Ch]
  '00531DD7: mov ecx, [eax+18h]
  '00531DDA: add esi, 00000002h
  '00531DDD: jo 00532014h
  '00531DE3: sub esi, edx
  '00531DE5: cmp esi, ecx
  '00531DE7: jb 531DEEh
  '00531DE9: call edi
  '00531DEB: mov eax, [ebp-60h]
  '00531DEE: mov edi, [ebp-5Ch]
  '00531DF1: mov edx, [eax+14h]
  '00531DF4: mov ecx, [eax+10h]
  '00531DF7: sub edi, edx
  '00531DF9: cmp edi, ecx
  '00531DFB: jb 531E06h
  '00531DFD: call [00401178h]
  '00531E03: mov eax, [ebp-60h]
  '00531E06: mov ebx, [eax+18h]
  '00531E09: imul ebx, edi
  '00531E0C: add ebx, esi
  '00531E0E: jmp 531E1Bh
  '00531E10: call [00401178h]
  '00531E16: mov ebx, eax
  '00531E18: mov eax, [ebp-60h]
  '00531E1B: test eax, eax
  '00531E1D: jz 531E74h
  '00531E1F: cmp word ptr [eax], 0002h
  '00531E23: jnz 531E74h
  '00531E25: mov edi, [ebp-70h]
  '00531E28: mov edx, [eax+1Ch]
  '00531E2B: mov ecx, [eax+18h]
  '00531E2E: add edi, 00000002h
  '00531E31: jo 00532014h
  '00531E37: sub edi, edx
  '00531E39: cmp edi, ecx
  '00531E3B: jb 531E46h
  '00531E3D: call [00401178h]
  '00531E43: mov eax, [ebp-60h]
  '00531E46: mov ecx, [ebp-5Ch]
  '00531E49: mov esi, [eax+14h]
  '00531E4C: mov edx, [eax+10h]
  '00531E4F: sub ecx, esi
  '00531E51: cmp ecx, edx
  '00531E53: mov [ebp-00000084h], ecx
  '00531E59: jb 531E6Ah
  '00531E5B: call [00401178h]
  '00531E61: mov eax, [ebp-60h]
  '00531E64: mov ecx, [ebp-00000084h]
  '00531E6A: mov esi, [eax+18h]
  '00531E6D: imul esi, ecx
  '00531E70: add esi, edi
  '00531E72: jmp 531E7Fh
  '00531E74: call [00401178h]
  '00531E7A: mov esi, eax
  '00531E7C: mov eax, [ebp-60h]
  '00531E7F: fild dword ptr [ebp+24h]
  '00531E82: mov ecx, [eax+0Ch]
  '00531E85: mov eax, [ebp-64h]
  '00531E88: xor edx, edx
  '00531E8A: fstp real8 ptr [ebp-0000010Ch]
  '00531E90: fld real8 ptr [ebp-0000010Ch]
  '00531E96: cmp [00541000h], 00000000h
  '00531E9D: jnz 531EA7h
  '00531E9F: fdiv real8 ptr [00406D50h]
  '00531EA5: jmp 531EB8h
  '00531EA7: push [00406D54h]
  '00531EAD: push [00406D50h]
  '00531EB3: call 004081D4h
  '00531EB8: mov dl, [ecx+ebx]
  '00531EBB: mov ecx, [eax+0Ch]
  '00531EBE: mov eax, [ebp-00000104h]
  '00531EC4: mov [ebp-00000110h], edx
  '00531ECA: xor edx, edx
  '00531ECC: mov dl, [ecx+eax]
  '00531ECF: imul edx, [ebp+24h]
  '00531ED3: fsubr real8 ptr [004019B8h]
  '00531ED9: fild dword ptr [ebp-00000110h]
  '00531EDF: jo 00532014h
  '00531EE5: fstp real8 ptr [ebp-00000118h]
  '00531EEB: fmul real8 ptr [ebp-00000118h]
  '00531EF1: mov [ebp-0000011Ch], edx
  '00531EF7: fild dword ptr [ebp-0000011Ch]
  '00531EFD: fstp real8 ptr [ebp-00000124h]
  '00531F03: fld real8 ptr [ebp-00000124h]
  '00531F09: cmp [00541000h], 00000000h
  '00531F10: jnz 531F1Ah
  '00531F12: fdiv real8 ptr [00406D50h]
  '00531F18: jmp 531F2Bh
  '00531F1A: push [00406D54h]
  '00531F20: push [00406D50h]
  '00531F26: call 004081D4h
  '00531F2B: faddp st(1), st(0)
  '00531F2D: fstsw ax
  '00531F2F: test al, 0Dh
  '00531F31: jnz 0053200Fh
  '00531F37: call [004011C4h]
  '00531F3D: mov ecx, [ebp-60h]
  '00531F40: mov edi, [ebp-74h]
  '00531F43: mov ebx, [00401178h]
  '00531F49: mov edx, [ecx+0Ch]
  '00531F4C: mov ecx, [ebp-6Ch]
  '00531F4F: mov [edx+esi], al
  '00531F52: mov eax, 00000001h
  '00531F57: add eax, ecx
  '00531F59: jo 00532014h
  '00531F5F: mov [ebp-6Ch], eax
  '00531F62: mov eax, [ebp-000000B0h]
  '00531F68: mov esi, [ebp-6Ch]
  '00531F6B: jmp 005319B3h
  '00531F70: mov eax, 00000004h
  '00531F75: add eax, edi
  '00531F77: jo 00532014h
  '00531F7D: mov edi, eax
  '00531F7F: mov [ebp-74h], edi
  '00531F82: jmp 00531979h
  '00531F87: lea eax, [ebp-60h]
  '00531F8A: push eax
  '00531F8B: call 0042C914h
  '00531F90: mov esi, [0040109Ch]
  '00531F96: mov [ebp-78h], eax
  '00531F99: call esi
  '00531F9B: mov edx, [ebp-78h]
  '00531F9E: lea ecx, [ebp-7Ch]
  '00531FA1: push 00000004h
  '00531FA3: xor edi, edi
  '00531FA5: push ecx
  '00531FA6: push edx
  '00531FA7: mov [ebp-7Ch], edi
  '00531FAA: call 0041D584h
  '00531FAF: call esi
  '00531FB1: lea eax, [ebp-64h]
  '00531FB4: push eax
  '00531FB5: call 0042C914h
  '00531FBA: mov [ebp-78h], eax
  '00531FBD: call esi
  '00531FBF: mov edx, [ebp-78h]
  '00531FC2: lea ecx, [ebp-7Ch]
  '00531FC5: push 00000004h
  '00531FC7: push ecx
  '00531FC8: push edx
  '00531FC9: mov [ebp-7Ch], edi
  '00531FCC: call 0041D584h
  '00531FD1: call esi
  '00531FD3: wait 
  '00531FD4: push 00531FF0h
  '00531FD9: mov esi, [004010B8h]
  '00531FDF: lea eax, [ebp-60h]
  '00531FE2: push eax
  '00531FE3: push 00000000h
  '00531FE5: call esi
  '00531FE7: lea ecx, [ebp-64h]
  '00531FEA: push ecx
  '00531FEB: push 00000000h
  '00531FED: call esi
  '00531FEF: ret 
End Sub
Private Sub unknown_532020
  '00532020: push ebp
  '00532021: mov ebp, esp
  '00532023: sub esp, 0000000Ch
  '00532026: push 004081B6h
  '0053202B: mov eax, fs:[00h]
  '00532031: push eax
  '00532032: mov fs:[00000000h], esp
  '00532039: sub esp, 0000000Ch
  '0053203C: push ebx
  '0053203D: push esi
  '0053203E: push edi
  '0053203F: mov [ebp-0Ch], esp
  '00532042: mov [ebp-08h], 00407A38h
  '00532049: xor edi, edi
  '0053204B: mov [ebp-04h], edi
  '0053204E: mov esi, [ebp+08h]
  '00532051: push esi
  '00532052: mov eax, [esi]
  '00532054: call [eax+04h]
  '00532057: mov ecx, [esi+3Ch]
  '0053205A: mov [ebp-18h], edi
  '0053205D: mov [ebp-18h], ecx
  '00532060: mov eax, [ebp+08h]
  '00532063: push eax
  '00532064: mov edx, [eax]
  '00532066: call [edx+08h]
  '00532069: mov eax, [ebp+0Ch]
  '0053206C: mov ecx, [ebp-18h]
  '0053206F: mov [eax], ecx
  '00532071: mov eax, [ebp-04h]
  '00532074: mov ecx, [ebp-14h]
  '00532077: pop edi
  '00532078: pop esi
  '00532079: mov fs:[00000000h], ecx
  '00532080: pop ebx
  '00532081: mov esp, ebp
  '00532083: pop ebp
  '00532084: retn 0008h
End Sub
Private Sub unknown_532090
  '00532090: push ebp
  '00532091: mov ebp, esp
  '00532093: sub esp, 0000000Ch
  '00532096: push 004081B6h
  '0053209B: mov eax, fs:[00h]
  '005320A1: push eax
  '005320A2: mov fs:[00000000h], esp
  '005320A9: sub esp, 0000000Ch
  '005320AC: push ebx
  '005320AD: push esi
  '005320AE: push edi
  '005320AF: mov [ebp-0Ch], esp
  '005320B2: mov [ebp-08h], 00407A40h
  '005320B9: xor edi, edi
  '005320BB: mov [ebp-04h], edi
  '005320BE: mov esi, [ebp+08h]
  '005320C1: push esi
  '005320C2: mov eax, [esi]
  '005320C4: call [eax+04h]
  '005320C7: mov ecx, [esi+34h]
  '005320CA: mov [ebp-18h], edi
  '005320CD: mov [ebp-18h], ecx
  '005320D0: mov eax, [ebp+08h]
  '005320D3: push eax
  '005320D4: mov edx, [eax]
  '005320D6: call [edx+08h]
  '005320D9: mov eax, [ebp+0Ch]
  '005320DC: mov ecx, [ebp-18h]
  '005320DF: mov [eax], ecx
  '005320E1: mov eax, [ebp-04h]
  '005320E4: mov ecx, [ebp-14h]
  '005320E7: pop edi
  '005320E8: pop esi
  '005320E9: mov fs:[00000000h], ecx
  '005320F0: pop ebx
  '005320F1: mov esp, ebp
  '005320F3: pop ebp
  '005320F4: retn 0008h
End Sub
Private Sub unknown_532100
  '00532100: push ebp
  '00532101: mov ebp, esp
  '00532103: sub esp, 0000000Ch
  '00532106: push 004081B6h
  '0053210B: mov eax, fs:[00h]
  '00532111: push eax
  '00532112: mov fs:[00000000h], esp
  '00532119: sub esp, 0000000Ch
  '0053211C: push ebx
  '0053211D: push esi
  '0053211E: push edi
  '0053211F: mov [ebp-0Ch], esp
  '00532122: mov [ebp-08h], 00407A48h
  '00532129: xor edi, edi
  '0053212B: mov [ebp-04h], edi
  '0053212E: mov esi, [ebp+08h]
  '00532131: push esi
  '00532132: mov eax, [esi]
  '00532134: call [eax+04h]
  '00532137: mov ecx, [esi+44h]
  '0053213A: mov [ebp-18h], edi
  '0053213D: mov [ebp-18h], ecx
  '00532140: mov eax, [ebp+08h]
  '00532143: push eax
  '00532144: mov edx, [eax]
  '00532146: call [edx+08h]
  '00532149: mov eax, [ebp+0Ch]
  '0053214C: mov ecx, [ebp-18h]
  '0053214F: mov [eax], ecx
  '00532151: mov eax, [ebp-04h]
  '00532154: mov ecx, [ebp-14h]
  '00532157: pop edi
  '00532158: pop esi
  '00532159: mov fs:[00000000h], ecx
  '00532160: pop ebx
  '00532161: mov esp, ebp
  '00532163: pop ebp
  '00532164: retn 0008h
End Sub
Private Sub unknown_532170
  '00532170: push ebp
  '00532171: mov ebp, esp
  '00532173: sub esp, 0000000Ch
  '00532176: push 004081B6h
  '0053217B: mov eax, fs:[00h]
  '00532181: push eax
  '00532182: mov fs:[00000000h], esp
  '00532189: sub esp, 0000005Ch
  '0053218C: push ebx
  '0053218D: push esi
  '0053218E: push edi
  '0053218F: mov [ebp-0Ch], esp
  '00532192: mov [ebp-08h], 00407A50h
  '00532199: xor ebx, ebx
  '0053219B: mov [ebp-04h], ebx
  '0053219E: mov esi, [ebp+08h]
  '005321A1: push esi
  '005321A2: mov eax, [esi]
  '005321A4: call [eax+04h]
  '005321A7: mov edx, [esi]
  '005321A9: mov ecx, 00000008h
  '005321AE: xor eax, eax
  '005321B0: lea edi, [ebp-34h]
  '005321B3: rep stosd 
  '005321B5: mov ecx, [esi+50h]
  '005321B8: lea eax, [ebp-44h]
  '005321BB: push eax
  '005321BC: push esi
  '005321BD: mov [ebp-40h], ebx
  '005321C0: mov [ebp-44h], ebx
  '005321C3: mov [ebp-48h], ebx
  '005321C6: mov [ebp-30h], 00000001h
  '005321CD: mov word ptr [ebp-34h], 0002h
  '005321D3: mov [ebp-20h], ebx
  '005321D6: mov [ebp-24h], ecx
  '005321D9: mov [ebp-18h], ebx
  '005321DC: call [edx+34h]
  '005321DF: cmp eax, ebx
  '005321E1: jnl 5321F2h
  '005321E3: push 00000034h
  '005321E5: push 0042C8ECh
  '005321EA: push esi
  '005321EB: push eax
  '005321EC: call [004010A0h]
  '005321F2: mov ecx, [ebp-44h]
  '005321F5: mov edx, [esi+44h]
  '005321F8: lea eax, [ebp-40h]
  '005321FB: mov [ebp-1Ch], ecx
  '005321FE: push eax
  '005321FF: mov [ebp-28h], edx
  '00532202: call 0042C914h
  '00532207: mov edi, [0040109Ch]
  '0053220D: mov [ebp-44h], eax
  '00532210: call edi
  '00532212: lea ecx, [ebp-34h]
  '00532215: push ecx
  '00532216: call [00401288h]
  '0053221C: mov [ebp-48h], eax
  '0053221F: mov eax, [ebp-44h]
  '00532222: lea edx, [ebp-48h]
  '00532225: push 00000004h
  '00532227: push edx
  '00532228: push eax
  '00532229: call 0041D584h
  '0053222E: call edi
  '00532230: mov ecx, [esi]
  '00532232: lea edx, [ebp-44h]
  '00532235: push edx
  '00532236: push esi
  '00532237: call [ecx+34h]
  '0053223A: cmp eax, ebx
  '0053223C: jnl 53224Dh
  '0053223E: push 00000034h
  '00532240: push 0042C8ECh
  '00532245: push esi
  '00532246: push eax
  '00532247: call [004010A0h]
  '0053224D: mov ecx, [ebp-44h]
  '00532250: mov [ebp-3Ch], ebx
  '00532253: sub ecx, 00000001h
  '00532256: jo 005324B1h
  '0053225C: mov [ebp-60h], ecx
  '0053225F: cmp ebx, ecx
  '00532261: jnle 0053245Ah
  '00532267: mov eax, [esi+50h]
  '0053226A: sub eax, 00000001h
  '0053226D: jo 005324B1h
  '00532273: xor edi, edi
  '00532275: mov [ebp-68h], eax
  '00532278: mov [ebp-38h], edi
  '0053227B: cmp edi, eax
  '0053227D: jnle 00532441h
  '00532283: mov eax, [ebp-40h]
  '00532286: test eax, eax
  '00532288: jz 5322D4h
  '0053228A: cmp word ptr [eax], 0002h
  '0053228E: jnz 5322D4h
  '00532290: mov edx, [eax+1Ch]
  '00532293: mov ecx, [eax+18h]
  '00532296: mov esi, ebx
  '00532298: add esi, 00000003h
  '0053229B: jo 005324B1h
  '005322A1: sub esi, edx
  '005322A3: cmp esi, ecx
  '005322A5: jb 5322B0h
  '005322A7: call [00401178h]
  '005322AD: mov eax, [ebp-40h]
  '005322B0: mov edx, [eax+14h]
  '005322B3: mov ecx, [eax+10h]
  '005322B6: mov ebx, edi
  '005322B8: sub ebx, edx
  '005322BA: cmp ebx, ecx
  '005322BC: jb 5322C7h
  '005322BE: call [00401178h]
  '005322C4: mov eax, [ebp-40h]
  '005322C7: mov edi, [eax+18h]
  '005322CA: imul edi, ebx
  '005322CD: mov ebx, [ebp-3Ch]
  '005322D0: add edi, esi
  '005322D2: jmp 5322DCh
  '005322D4: call [00401178h]
  '005322DA: mov edi, eax
  '005322DC: xor ecx, ecx
  '005322DE: call [00401208h]
  '005322E4: mov ecx, [ebp-40h]
  '005322E7: mov edx, [ecx+0Ch]
  '005322EA: mov [edx+edi], al
  '005322ED: mov eax, [ebp-40h]
  '005322F0: test eax, eax
  '005322F2: jz 532334h
  '005322F4: cmp word ptr [eax], 0002h
  '005322F8: jnz 532334h
  '005322FA: mov edx, [eax+1Ch]
  '005322FD: mov ecx, [eax+18h]
  '00532300: sub ebx, edx
  '00532302: cmp ebx, ecx
  '00532304: jb 53230Fh
  '00532306: call [00401178h]
  '0053230C: mov eax, [ebp-40h]
  '0053230F: mov edi, [ebp-38h]
  '00532312: mov edx, [eax+14h]
  '00532315: mov ecx, [eax+10h]
  '00532318: sub edi, edx
  '0053231A: cmp edi, ecx
  '0053231C: jb 532327h
  '0053231E: call [00401178h]
  '00532324: mov eax, [ebp-40h]
  '00532327: mov esi, [eax+18h]
  '0053232A: imul esi, edi
  '0053232D: add esi, ebx
  '0053232F: mov ebx, [ebp-3Ch]
  '00532332: jmp 53233Ch
  '00532334: call [00401178h]
  '0053233A: mov esi, eax
  '0053233C: xor ecx, ecx
  '0053233E: call [00401208h]
  '00532344: mov ecx, [ebp-40h]
  '00532347: mov edx, [ecx+0Ch]
  '0053234A: mov [edx+esi], al
  '0053234D: mov eax, [ebp-40h]
  '00532350: test eax, eax
  '00532352: jz 5323A2h
  '00532354: cmp word ptr [eax], 0002h
  '00532358: jnz 5323A2h
  '0053235A: mov edx, [eax+1Ch]
  '0053235D: mov ecx, [eax+18h]
  '00532360: mov esi, ebx
  '00532362: add esi, 00000001h
  '00532365: jo 005324B1h
  '0053236B: sub esi, edx
  '0053236D: cmp esi, ecx
  '0053236F: jb 53237Ah
  '00532371: call [00401178h]
  '00532377: mov eax, [ebp-40h]
  '0053237A: mov ebx, [ebp-38h]
  '0053237D: mov edx, [eax+14h]
  '00532380: mov ecx, [eax+10h]
  '00532383: sub ebx, edx
  '00532385: cmp ebx, ecx
  '00532387: jb 532392h
  '00532389: call [00401178h]
  '0053238F: mov eax, [ebp-40h]
  '00532392: mov edi, [eax+18h]
  '00532395: imul edi, ebx
  '00532398: mov ebx, [00401178h]
  '0053239E: add edi, esi
  '005323A0: jmp 5323ACh
  '005323A2: mov ebx, [00401178h]
  '005323A8: call ebx
  '005323AA: mov edi, eax
  '005323AC: xor ecx, ecx
  '005323AE: call [00401208h]
  '005323B4: mov ecx, [ebp-40h]
  '005323B7: mov edx, [ecx+0Ch]
  '005323BA: mov [edx+edi], al
  '005323BD: mov eax, [ebp-40h]
  '005323C0: test eax, eax
  '005323C2: jz 532409h
  '005323C4: cmp word ptr [eax], 0002h
  '005323C8: jnz 532409h
  '005323CA: mov esi, [ebp-3Ch]
  '005323CD: mov edx, [eax+1Ch]
  '005323D0: mov ecx, [eax+18h]
  '005323D3: add esi, 00000002h
  '005323D6: jo 005324B1h
  '005323DC: sub esi, edx
  '005323DE: cmp esi, ecx
  '005323E0: jb 5323E7h
  '005323E2: call ebx
  '005323E4: mov eax, [ebp-40h]
  '005323E7: mov ebx, [ebp-38h]
  '005323EA: mov edx, [eax+14h]
  '005323ED: mov ecx, [eax+10h]
  '005323F0: sub ebx, edx
  '005323F2: cmp ebx, ecx
  '005323F4: jb 5323FFh
  '005323F6: call [00401178h]
  '005323FC: mov eax, [ebp-40h]
  '005323FF: mov edi, [eax+18h]
  '00532402: imul edi, ebx
  '00532405: add edi, esi
  '00532407: jmp 53240Dh
  '00532409: call ebx
  '0053240B: mov edi, eax
  '0053240D: xor ecx, ecx
  '0053240F: call [00401208h]
  '00532415: mov ecx, [ebp-40h]
  '00532418: mov esi, [ebp+08h]
  '0053241B: mov ebx, [ebp-3Ch]
  '0053241E: mov edx, [ecx+0Ch]
  '00532421: mov ecx, [ebp-38h]
  '00532424: mov [edx+edi], al
  '00532427: mov eax, 00000001h
  '0053242C: add eax, ecx
  '0053242E: mov ecx, [ebp-60h]
  '00532431: jo 5323B1h
  '00532433: mov [ebp-38h], eax
  '00532436: mov eax, [ebp-68h]
  '00532439: mov edi, [ebp-38h]
  '0053243C: jmp 0053227Bh
  '00532441: mov edi, [0040109Ch]
  '00532447: mov eax, 00000004h
  '0053244C: add eax, ebx
  '0053244E: jo 5324B1h
  '00532450: mov [ebp-3Ch], eax
  '00532453: mov ebx, eax
  '00532455: jmp 0053225Fh
  '0053245A: lea eax, [ebp-40h]
  '0053245D: push eax
  '0053245E: call 0042C914h
  '00532463: mov [ebp-44h], eax
  '00532466: call edi
  '00532468: mov edx, [ebp-44h]
  '0053246B: lea ecx, [ebp-48h]
  '0053246E: push 00000004h
  '00532470: push ecx
  '00532471: push edx
  '00532472: mov [ebp-48h], 00000000h
  '00532479: call 0041D584h
  '0053247E: call edi
  '00532480: push 00532492h
  '00532485: lea eax, [ebp-40h]
  '00532488: push eax
  '00532489: push 00000000h
  '0053248B: call [004010B8h]
  '00532491: ret 
End Sub
Private Sub unknown_5324C0
  '005324C0: push ebp
  '005324C1: mov ebp, esp
  '005324C3: sub esp, 0000000Ch
  '005324C6: push 004081B6h
  '005324CB: mov eax, fs:[00h]
  '005324D1: push eax
  '005324D2: mov fs:[00000000h], esp
  '005324D9: sub esp, 000000D4h
  '005324DF: push ebx
  '005324E0: push esi
  '005324E1: push edi
  '005324E2: mov [ebp-0Ch], esp
  '005324E5: mov [ebp-08h], 00407A60h
  '005324EC: xor ebx, ebx
  '005324EE: mov [ebp-04h], ebx
  '005324F1: mov esi, [ebp+08h]
  '005324F4: push esi
  '005324F5: mov eax, [esi]
  '005324F7: call [eax+04h]
  '005324FA: mov edx, [esi]
  '005324FC: mov ecx, 00000008h
  '00532501: xor eax, eax
  '00532503: lea edi, [ebp-38h]
  '00532506: rep stosd 
  '00532508: mov ecx, [esi+50h]
  '0053250B: lea eax, [ebp-68h]
  '0053250E: push eax
  '0053250F: push esi
  '00532510: mov [ebp-44h], ebx
  '00532513: mov [ebp-54h], ebx
  '00532516: mov [ebp-68h], ebx
  '00532519: mov [ebp-6Ch], ebx
  '0053251C: mov [ebp-34h], 00000001h
  '00532523: mov word ptr [ebp-38h], 0002h
  '00532529: mov [ebp-24h], ebx
  '0053252C: mov [ebp-28h], ecx
  '0053252F: mov [ebp-1Ch], ebx
  '00532532: call [edx+34h]
  '00532535: cmp eax, ebx
  '00532537: jnl 532548h
  '00532539: push 00000034h
  '0053253B: push 0042C8ECh
  '00532540: push esi
  '00532541: push eax
  '00532542: call [004010A0h]
  '00532548: mov ecx, [ebp-68h]
  '0053254B: mov edx, [esi+44h]
  '0053254E: lea eax, [ebp-44h]
  '00532551: mov [ebp-20h], ecx
  '00532554: push eax
  '00532555: mov [ebp-2Ch], edx
  '00532558: call 0042C914h
  '0053255D: mov edi, [0040109Ch]
  '00532563: mov [ebp-68h], eax
  '00532566: call edi
  '00532568: lea ecx, [ebp-38h]
  '0053256B: push ecx
  '0053256C: call [00401288h]
  '00532572: mov [ebp-6Ch], eax
  '00532575: mov eax, [ebp-68h]
  '00532578: lea edx, [ebp-6Ch]
  '0053257B: push 00000004h
  '0053257D: push edx
  '0053257E: push eax
  '0053257F: call 0041D584h
  '00532584: call edi
  '00532586: call [0040127Ch]
  '0053258C: fstp real4 ptr [ebp-4Ch]
  '0053258F: lea ecx, [ebp-54h]
  '00532592: mov [ebp-54h], 00000004h
  '00532599: push ecx
  '0053259A: call [004010D8h]
  '005325A0: lea ecx, [ebp-54h]
  '005325A3: call [00401030h]
  '005325A9: cmp [ebp+0Ch], bx
  '005325AD: jz 00532A72h
  '005325B3: mov eax, [esi+50h]
  '005325B6: mov [ebp-3Ch], ebx
  '005325B9: sub eax, 00000001h
  '005325BC: mov edi, 80020004h
  '005325C1: jo 00532FA8h
  '005325C7: mov [ebp-0000008Ch], eax
  '005325CD: cmp [ebp-3Ch], eax
  '005325D0: jnle 00532F39h
  '005325D6: mov edx, [esi]
  '005325D8: lea eax, [ebp-68h]
  '005325DB: push eax
  '005325DC: push esi
  '005325DD: call [edx+34h]
  '005325E0: test eax, eax
  '005325E2: jnl 5325F3h
  '005325E4: push 00000034h
  '005325E6: push 0042C8ECh
  '005325EB: push esi
  '005325EC: push eax
  '005325ED: call [004010A0h]
  '005325F3: mov eax, [ebp-68h]
  '005325F6: sub eax, 00000001h
  '005325F9: jo 00532FA8h
  '005325FF: xor ebx, ebx
  '00532601: mov [ebp-00000094h], eax
  '00532607: mov [ebp-40h], ebx
  '0053260A: cmp ebx, eax
  '0053260C: jnle 00532A54h
  '00532612: lea ecx, [ebp-54h]
  '00532615: mov esi, 0000000Ah
  '0053261A: push ecx
  '0053261B: mov [ebp-4Ch], edi
  '0053261E: mov [ebp-54h], esi
  '00532621: call [004010C0h]
  '00532627: fmul real4 ptr [00407A5Ch]
  '0053262D: fstsw ax
  '0053262F: test al, 0Dh
  '00532631: jnz 00532FA3h
  '00532637: call [0040135Ch]
  '0053263D: lea ecx, [ebp-54h]
  '00532640: mov [ebp-18h], eax
  '00532643: call [00401030h]
  '00532649: mov eax, [ebp-44h]
  '0053264C: mov [ebp-4Ch], edi
  '0053264F: test eax, eax
  '00532651: mov [ebp-54h], esi
  '00532654: jz 5326A1h
  '00532656: cmp word ptr [eax], 0002h
  '0053265A: jnz 5326A1h
  '0053265C: mov edx, [eax+1Ch]
  '0053265F: mov ecx, [eax+18h]
  '00532662: mov esi, ebx
  '00532664: add esi, 00000003h
  '00532667: jo 00532FA8h
  '0053266D: sub esi, edx
  '0053266F: cmp esi, ecx
  '00532671: jb 53267Ch
  '00532673: call [00401178h]
  '00532679: mov eax, [ebp-44h]
  '0053267C: mov ebx, [ebp-3Ch]
  '0053267F: mov edx, [eax+14h]
  '00532682: mov ecx, [eax+10h]
  '00532685: sub ebx, edx
  '00532687: cmp ebx, ecx
  '00532689: jb 532694h
  '0053268B: call [00401178h]
  '00532691: mov eax, [ebp-44h]
  '00532694: mov edi, [eax+18h]
  '00532697: imul edi, ebx
  '0053269A: mov ebx, [ebp-40h]
  '0053269D: add edi, esi
  '0053269F: jmp 5326A9h
  '005326A1: call [00401178h]
  '005326A7: mov edi, eax
  '005326A9: lea edx, [ebp-54h]
  '005326AC: push edx
  '005326AD: call [004010C0h]
  '005326B3: fmul real4 ptr [00407A5Ch]
  '005326B9: fstsw ax
  '005326BB: test al, 0Dh
  '005326BD: jnz 00532FA3h
  '005326C3: call [004011C4h]
  '005326C9: mov ecx, [ebp-44h]
  '005326CC: mov edx, [ecx+0Ch]
  '005326CF: lea ecx, [ebp-54h]
  '005326D2: mov [edx+edi], al
  '005326D5: call [00401030h]
  '005326DB: mov eax, [ebp-44h]
  '005326DE: test eax, eax
  '005326E0: jz 53272Ah
  '005326E2: cmp word ptr [eax], 0002h
  '005326E6: jnz 53272Ah
  '005326E8: mov edx, [eax+1Ch]
  '005326EB: mov ecx, [eax+18h]
  '005326EE: mov esi, ebx
  '005326F0: add esi, 00000003h
  '005326F3: jo 00532FA8h
  '005326F9: sub esi, edx
  '005326FB: cmp esi, ecx
  '005326FD: jb 532708h
  '005326FF: call [00401178h]
  '00532705: mov eax, [ebp-44h]
  '00532708: mov ebx, [ebp-3Ch]
  '0053270B: mov edx, [eax+14h]
  '0053270E: mov ecx, [eax+10h]
  '00532711: sub ebx, edx
  '00532713: cmp ebx, ecx
  '00532715: jb 532720h
  '00532717: call [00401178h]
  '0053271D: mov eax, [ebp-44h]
  '00532720: mov edi, [eax+18h]
  '00532723: imul edi, ebx
  '00532726: add edi, esi
  '00532728: jmp 532735h
  '0053272A: call [00401178h]
  '00532730: mov edi, eax
  '00532732: mov eax, [ebp-44h]
  '00532735: test eax, eax
  '00532737: jz 532785h
  '00532739: cmp word ptr [eax], 0002h
  '0053273D: jnz 532785h
  '0053273F: mov ecx, [ebp-40h]
  '00532742: mov esi, [eax+1Ch]
  '00532745: mov edx, [eax+18h]
  '00532748: sub ecx, esi
  '0053274A: cmp ecx, edx
  '0053274C: mov [ebp-78h], ecx
  '0053274F: jb 53275Ah
  '00532751: call [00401178h]
  '00532757: mov eax, [ebp-44h]
  '0053275A: mov ebx, [ebp-3Ch]
  '0053275D: mov edx, [eax+14h]
  '00532760: mov ecx, [eax+10h]
  '00532763: sub ebx, edx
  '00532765: cmp ebx, ecx
  '00532767: jb 532772h
  '00532769: call [00401178h]
  '0053276F: mov eax, [ebp-44h]
  '00532772: mov esi, [eax+18h]
  '00532775: mov ecx, [ebp-78h]
  '00532778: imul esi, ebx
  '0053277B: mov ebx, [00401178h]
  '00532781: add esi, ecx
  '00532783: jmp 532792h
  '00532785: mov ebx, [00401178h]
  '0053278B: call ebx
  '0053278D: mov esi, eax
  '0053278F: mov eax, [ebp-44h]
  '00532792: mov eax, [eax+0Ch]
  '00532795: xor ecx, ecx
  '00532797: mov cl, [eax+edi]
  '0053279A: imul ecx, [ebp-18h]
  '0053279E: jo 00532FA8h
  '005327A4: mov [ebp-000000B0h], ecx
  '005327AA: fild dword ptr [ebp-000000B0h]
  '005327B0: fstp real8 ptr [ebp-000000B8h]
  '005327B6: fld real8 ptr [ebp-000000B8h]
  '005327BC: cmp [00541000h], 00000000h
  '005327C3: jnz 5327CDh
  '005327C5: fdiv real8 ptr [00406D50h]
  '005327CB: jmp 5327DEh
  '005327CD: push [00406D54h]
  '005327D3: push [00406D50h]
  '005327D9: call 004081D4h
  '005327DE: fstsw ax
  '005327E0: test al, 0Dh
  '005327E2: jnz 00532FA3h
  '005327E8: call [004011C4h]
  '005327EE: mov edx, [ebp-44h]
  '005327F1: mov ecx, [edx+0Ch]
  '005327F4: mov [ecx+esi], al
  '005327F7: mov eax, [ebp-44h]
  '005327FA: test eax, eax
  '005327FC: jz 53283Fh
  '005327FE: cmp word ptr [eax], 0002h
  '00532802: jnz 53283Fh
  '00532804: mov esi, [ebp-40h]
  '00532807: mov edx, [eax+1Ch]
  '0053280A: mov ecx, [eax+18h]
  '0053280D: add esi, 00000003h
  '00532810: jo 00532FA8h
  '00532816: sub esi, edx
  '00532818: cmp esi, ecx
  '0053281A: jb 532821h
  '0053281C: call ebx
  '0053281E: mov eax, [ebp-44h]
  '00532821: mov edi, [ebp-3Ch]
  '00532824: mov edx, [eax+14h]
  '00532827: mov ecx, [eax+10h]
  '0053282A: sub edi, edx
  '0053282C: cmp edi, ecx
  '0053282E: jb 532835h
  '00532830: call ebx
  '00532832: mov eax, [ebp-44h]
  '00532835: mov ebx, [eax+18h]
  '00532838: imul ebx, edi
  '0053283B: add ebx, esi
  '0053283D: jmp 53284Ah
  '0053283F: call [00401178h]
  '00532845: mov ebx, eax
  '00532847: mov eax, [ebp-44h]
  '0053284A: test eax, eax
  '0053284C: jz 53289Dh
  '0053284E: cmp word ptr [eax], 0002h
  '00532852: jnz 53289Dh
  '00532854: mov edi, [ebp-40h]
  '00532857: mov edx, [eax+1Ch]
  '0053285A: mov ecx, [eax+18h]
  '0053285D: add edi, 00000001h
  '00532860: jo 00532FA8h
  '00532866: sub edi, edx
  '00532868: cmp edi, ecx
  '0053286A: jb 532875h
  '0053286C: call [00401178h]
  '00532872: mov eax, [ebp-44h]
  '00532875: mov ecx, [ebp-3Ch]
  '00532878: mov esi, [eax+14h]
  '0053287B: mov edx, [eax+10h]
  '0053287E: sub ecx, esi
  '00532880: cmp ecx, edx
  '00532882: mov [ebp-74h], ecx
  '00532885: jb 532893h
  '00532887: call [00401178h]
  '0053288D: mov eax, [ebp-44h]
  '00532890: mov ecx, [ebp-74h]
  '00532893: mov esi, [eax+18h]
  '00532896: imul esi, ecx
  '00532899: add esi, edi
  '0053289B: jmp 5328A8h
  '0053289D: call [00401178h]
  '005328A3: mov esi, eax
  '005328A5: mov eax, [ebp-44h]
  '005328A8: mov edx, [eax+0Ch]
  '005328AB: xor eax, eax
  '005328AD: mov al, [edx+ebx]
  '005328B0: imul eax, [ebp-18h]
  '005328B4: jo 00532FA8h
  '005328BA: mov [ebp-000000BCh], eax
  '005328C0: fild dword ptr [ebp-000000BCh]
  '005328C6: fstp real8 ptr [ebp-000000C4h]
  '005328CC: fld real8 ptr [ebp-000000C4h]
  '005328D2: cmp [00541000h], 00000000h
  '005328D9: jnz 5328E3h
  '005328DB: fdiv real8 ptr [00406D50h]
  '005328E1: jmp 5328F4h
  '005328E3: push [00406D54h]
  '005328E9: push [00406D50h]
  '005328EF: call 004081D4h
  '005328F4: fstsw ax
  '005328F6: test al, 0Dh
  '005328F8: jnz 00532FA3h
  '005328FE: call [004011C4h]
  '00532904: mov ecx, [ebp-44h]
  '00532907: mov edx, [ecx+0Ch]
  '0053290A: mov [edx+esi], al
  '0053290D: mov eax, [ebp-44h]
  '00532910: test eax, eax
  '00532912: jz 53295Dh
  '00532914: cmp word ptr [eax], 0002h
  '00532918: jnz 53295Dh
  '0053291A: mov esi, [ebp-40h]
  '0053291D: mov edx, [eax+1Ch]
  '00532920: mov ecx, [eax+18h]
  '00532923: add esi, 00000003h
  '00532926: jo 00532FA8h
  '0053292C: sub esi, edx
  '0053292E: cmp esi, ecx
  '00532930: jb 53293Bh
  '00532932: call [00401178h]
  '00532938: mov eax, [ebp-44h]
  '0053293B: mov edi, [ebp-3Ch]
  '0053293E: mov edx, [eax+14h]
  '00532941: mov ecx, [eax+10h]
  '00532944: sub edi, edx
  '00532946: cmp edi, ecx
  '00532948: jb 532953h
  '0053294A: call [00401178h]
  '00532950: mov eax, [ebp-44h]
  '00532953: mov ebx, [eax+18h]
  '00532956: imul ebx, edi
  '00532959: add ebx, esi
  '0053295B: jmp 532968h
  '0053295D: call [00401178h]
  '00532963: mov ebx, eax
  '00532965: mov eax, [ebp-44h]
  '00532968: test eax, eax
  '0053296A: jz 5329BBh
  '0053296C: cmp word ptr [eax], 0002h
  '00532970: jnz 5329BBh
  '00532972: mov edi, [ebp-40h]
  '00532975: mov edx, [eax+1Ch]
  '00532978: mov ecx, [eax+18h]
  '0053297B: add edi, 00000002h
  '0053297E: jo 00532FA8h
  '00532984: sub edi, edx
  '00532986: cmp edi, ecx
  '00532988: jb 532993h
  '0053298A: call [00401178h]
  '00532990: mov eax, [ebp-44h]
  '00532993: mov ecx, [ebp-3Ch]
  '00532996: mov esi, [eax+14h]
  '00532999: mov edx, [eax+10h]
  '0053299C: sub ecx, esi
  '0053299E: cmp ecx, edx
  '005329A0: mov [ebp-74h], ecx
  '005329A3: jb 5329B1h
  '005329A5: call [00401178h]
  '005329AB: mov eax, [ebp-44h]
  '005329AE: mov ecx, [ebp-74h]
  '005329B1: mov esi, [eax+18h]
  '005329B4: imul esi, ecx
  '005329B7: add esi, edi
  '005329B9: jmp 5329C6h
  '005329BB: call [00401178h]
  '005329C1: mov esi, eax
  '005329C3: mov eax, [ebp-44h]
  '005329C6: mov eax, [eax+0Ch]
  '005329C9: xor ecx, ecx
  '005329CB: mov cl, [eax+ebx]
  '005329CE: imul ecx, [ebp-18h]
  '005329D2: jo 00532FA8h
  '005329D8: mov [ebp-000000C8h], ecx
  '005329DE: fild dword ptr [ebp-000000C8h]
  '005329E4: fstp real8 ptr [ebp-000000D0h]
  '005329EA: fld real8 ptr [ebp-000000D0h]
  '005329F0: cmp [00541000h], 00000000h
  '005329F7: jnz 532A01h
  '005329F9: fdiv real8 ptr [00406D50h]
  '005329FF: jmp 532A12h
  '00532A01: push [00406D54h]
  '00532A07: push [00406D50h]
  '00532A0D: call 004081D4h
  '00532A12: fstsw ax
  '00532A14: test al, 0Dh
  '00532A16: jnz 00532FA3h
  '00532A1C: call [004011C4h]
  '00532A22: mov edx, [ebp-44h]
  '00532A25: mov edi, 80020004h
  '00532A2A: mov ecx, [edx+0Ch]
  '00532A2D: mov [ecx+esi], al
  '00532A30: mov ecx, [ebp-40h]
  '00532A33: mov esi, [ebp+08h]
  '00532A36: mov eax, 00000004h
  '00532A3B: add eax, ecx
  '00532A3D: jo 00532FA8h
  '00532A43: mov [ebp-40h], eax
  '00532A46: mov eax, [ebp-00000094h]
  '00532A4C: mov ebx, [ebp-40h]
  '00532A4F: jmp 0053260Ah
  '00532A54: mov ecx, [ebp-3Ch]
  '00532A57: mov eax, 00000001h
  '00532A5C: add eax, ecx
  '00532A5E: jo 00532FA8h
  '00532A64: mov [ebp-3Ch], eax
  '00532A67: mov eax, [ebp-0000008Ch]
  '00532A6D: jmp 005325CDh
  '00532A72: mov ebx, [esi+50h]
  '00532A75: mov [ebp-3Ch], 00000000h
  '00532A7C: sub ebx, 00000001h
  '00532A7F: jo 00532FA8h
  '00532A85: mov [ebp-0000009Ch], ebx
  '00532A8B: cmp [ebp-3Ch], ebx
  '00532A8E: jnle 00532F39h
  '00532A94: mov edx, [esi]
  '00532A96: lea eax, [ebp-68h]
  '00532A99: push eax
  '00532A9A: push esi
  '00532A9B: call [edx+34h]
  '00532A9E: test eax, eax
  '00532AA0: jnl 532AB1h
  '00532AA2: push 00000034h
  '00532AA4: push 0042C8ECh
  '00532AA9: push esi
  '00532AAA: push eax
  '00532AAB: call [004010A0h]
  '00532AB1: mov eax, [ebp-68h]
  '00532AB4: sub eax, 00000001h
  '00532AB7: jo 00532FA8h
  '00532ABD: xor edi, edi
  '00532ABF: mov [ebp-000000A4h], eax
  '00532AC5: mov [ebp-40h], edi
  '00532AC8: cmp edi, eax
  '00532ACA: jnle 00532F25h
  '00532AD0: mov eax, [ebp-44h]
  '00532AD3: mov [ebp-4Ch], 80020004h
  '00532ADA: test eax, eax
  '00532ADC: mov [ebp-54h], 0000000Ah
  '00532AE3: jz 532B34h
  '00532AE5: cmp word ptr [eax], 0002h
  '00532AE9: jnz 532B34h
  '00532AEB: mov edx, [eax+1Ch]
  '00532AEE: mov ecx, [eax+18h]
  '00532AF1: add edi, 00000003h
  '00532AF4: jo 00532FA8h
  '00532AFA: sub edi, edx
  '00532AFC: cmp edi, ecx
  '00532AFE: jb 532B09h
  '00532B00: call [00401178h]
  '00532B06: mov eax, [ebp-44h]
  '00532B09: mov ebx, [ebp-3Ch]
  '00532B0C: mov edx, [eax+14h]
  '00532B0F: mov ecx, [eax+10h]
  '00532B12: sub ebx, edx
  '00532B14: cmp ebx, ecx
  '00532B16: jb 532B21h
  '00532B18: call [00401178h]
  '00532B1E: mov eax, [ebp-44h]
  '00532B21: mov esi, [eax+18h]
  '00532B24: imul esi, ebx
  '00532B27: mov ebx, [00401178h]
  '00532B2D: add esi, edi
  '00532B2F: mov edi, [ebp-40h]
  '00532B32: jmp 532B3Eh
  '00532B34: mov ebx, [00401178h]
  '00532B3A: call ebx
  '00532B3C: mov esi, eax
  '00532B3E: lea ecx, [ebp-54h]
  '00532B41: push ecx
  '00532B42: call [004010C0h]
  '00532B48: fmul real4 ptr [00407A5Ch]
  '00532B4E: fstsw ax
  '00532B50: test al, 0Dh
  '00532B52: jnz 00532FA3h
  '00532B58: call [004011C4h]
  '00532B5E: mov edx, [ebp-44h]
  '00532B61: mov ecx, [edx+0Ch]
  '00532B64: mov [ecx+esi], al
  '00532B67: lea ecx, [ebp-54h]
  '00532B6A: call [00401030h]
  '00532B70: mov eax, [ebp-44h]
  '00532B73: mov [ebp-4Ch], 80020004h
  '00532B7A: test eax, eax
  '00532B7C: mov [ebp-54h], 0000000Ah
  '00532B83: jz 532BC9h
  '00532B85: cmp word ptr [eax], 0002h
  '00532B89: jnz 532BC9h
  '00532B8B: mov edx, [eax+1Ch]
  '00532B8E: mov ecx, [eax+18h]
  '00532B91: mov esi, edi
  '00532B93: add esi, 00000003h
  '00532B96: jo 00532FA8h
  '00532B9C: sub esi, edx
  '00532B9E: cmp esi, ecx
  '00532BA0: jb 532BA7h
  '00532BA2: call ebx
  '00532BA4: mov eax, [ebp-44h]
  '00532BA7: mov ebx, [ebp-3Ch]
  '00532BAA: mov edx, [eax+14h]
  '00532BAD: mov ecx, [eax+10h]
  '00532BB0: sub ebx, edx
  '00532BB2: cmp ebx, ecx
  '00532BB4: jb 532BBFh
  '00532BB6: call [00401178h]
  '00532BBC: mov eax, [ebp-44h]
  '00532BBF: mov edi, [eax+18h]
  '00532BC2: imul edi, ebx
  '00532BC5: add edi, esi
  '00532BC7: jmp 532BD0h
  '00532BC9: call ebx
  '00532BCB: mov edi, eax
  '00532BCD: mov eax, [ebp-44h]
  '00532BD0: test eax, eax
  '00532BD2: jz 532C20h
  '00532BD4: cmp word ptr [eax], 0002h
  '00532BD8: jnz 532C20h
  '00532BDA: mov ecx, [ebp-40h]
  '00532BDD: mov esi, [eax+1Ch]
  '00532BE0: mov edx, [eax+18h]
  '00532BE3: sub ecx, esi
  '00532BE5: cmp ecx, edx
  '00532BE7: mov [ebp-78h], ecx
  '00532BEA: jb 532BF5h
  '00532BEC: call [00401178h]
  '00532BF2: mov eax, [ebp-44h]
  '00532BF5: mov ebx, [ebp-3Ch]
  '00532BF8: mov edx, [eax+14h]
  '00532BFB: mov ecx, [eax+10h]
  '00532BFE: sub ebx, edx
  '00532C00: cmp ebx, ecx
  '00532C02: jb 532C0Dh
  '00532C04: call [00401178h]
  '00532C0A: mov eax, [ebp-44h]
  '00532C0D: mov esi, [eax+18h]
  '00532C10: mov eax, [ebp-78h]
  '00532C13: imul esi, ebx
  '00532C16: mov ebx, [00401178h]
  '00532C1C: add esi, eax
  '00532C1E: jmp 532C2Ah
  '00532C20: mov ebx, [00401178h]
  '00532C26: call ebx
  '00532C28: mov esi, eax
  '00532C2A: lea edx, [ebp-54h]
  '00532C2D: push edx
  '00532C2E: call [004010C0h]
  '00532C34: mov eax, [ebp-44h]
  '00532C37: xor edx, edx
  '00532C39: fmul real4 ptr [00407A5Ch]
  '00532C3F: mov ecx, [eax+0Ch]
  '00532C42: mov dl, [ecx+edi]
  '00532C45: mov [ebp-000000D4h], edx
  '00532C4B: fild dword ptr [ebp-000000D4h]
  '00532C51: fstp real4 ptr [ebp-000000D8h]
  '00532C57: fmul real4 ptr [ebp-000000D8h]
  '00532C5D: cmp [00541000h], 00000000h
  '00532C64: jnz 532C6Eh
  '00532C66: fdiv real4 ptr [00407A5Ch]
  '00532C6C: jmp 532C79h
  '00532C6E: push [00407A5Ch]
  '00532C74: call 004081C8h
  '00532C79: fstsw ax
  '00532C7B: test al, 0Dh
  '00532C7D: jnz 00532FA3h
  '00532C83: call [004011C4h]
  '00532C89: mov ecx, [ebp-44h]
  '00532C8C: mov edx, [ecx+0Ch]
  '00532C8F: lea ecx, [ebp-54h]
  '00532C92: mov [edx+esi], al
  '00532C95: call [00401030h]
  '00532C9B: mov eax, [ebp-44h]
  '00532C9E: mov [ebp-4Ch], 80020004h
  '00532CA5: test eax, eax
  '00532CA7: mov [ebp-54h], 0000000Ah
  '00532CAE: jz 532CF1h
  '00532CB0: cmp word ptr [eax], 0002h
  '00532CB4: jnz 532CF1h
  '00532CB6: mov esi, [ebp-40h]
  '00532CB9: mov edx, [eax+1Ch]
  '00532CBC: mov ecx, [eax+18h]
  '00532CBF: add esi, 00000003h
  '00532CC2: jo 00532FA8h
  '00532CC8: sub esi, edx
  '00532CCA: cmp esi, ecx
  '00532CCC: jb 532CD3h
  '00532CCE: call ebx
  '00532CD0: mov eax, [ebp-44h]
  '00532CD3: mov edi, [ebp-3Ch]
  '00532CD6: mov edx, [eax+14h]
  '00532CD9: mov ecx, [eax+10h]
  '00532CDC: sub edi, edx
  '00532CDE: cmp edi, ecx
  '00532CE0: jb 532CE7h
  '00532CE2: call ebx
  '00532CE4: mov eax, [ebp-44h]
  '00532CE7: mov ebx, [eax+18h]
  '00532CEA: imul ebx, edi
  '00532CED: add ebx, esi
  '00532CEF: jmp 532CFCh
  '00532CF1: call [00401178h]
  '00532CF7: mov ebx, eax
  '00532CF9: mov eax, [ebp-44h]
  '00532CFC: test eax, eax
  '00532CFE: jz 532D55h
  '00532D00: cmp word ptr [eax], 0002h
  '00532D04: jnz 532D55h
  '00532D06: mov edi, [ebp-40h]
  '00532D09: mov edx, [eax+1Ch]
  '00532D0C: mov ecx, [eax+18h]
  '00532D0F: add edi, 00000001h
  '00532D12: jo 00532FA8h
  '00532D18: sub edi, edx
  '00532D1A: cmp edi, ecx
  '00532D1C: jb 532D27h
  '00532D1E: call [00401178h]
  '00532D24: mov eax, [ebp-44h]
  '00532D27: mov ecx, [ebp-3Ch]
  '00532D2A: mov esi, [eax+14h]
  '00532D2D: mov edx, [eax+10h]
  '00532D30: sub ecx, esi
  '00532D32: cmp ecx, edx
  '00532D34: mov [ebp-74h], ecx
  '00532D37: jb 532D45h
  '00532D39: call [00401178h]
  '00532D3F: mov eax, [ebp-44h]
  '00532D42: mov ecx, [ebp-74h]
  '00532D45: mov esi, [eax+18h]
  '00532D48: imul esi, ecx
  '00532D4B: add esi, edi
  '00532D4D: mov edi, [00401178h]
  '00532D53: jmp 532D5Fh
  '00532D55: mov edi, [00401178h]
  '00532D5B: call edi
  '00532D5D: mov esi, eax
  '00532D5F: lea eax, [ebp-54h]
  '00532D62: push eax
  '00532D63: call [004010C0h]
  '00532D69: mov ecx, [ebp-44h]
  '00532D6C: xor eax, eax
  '00532D6E: fmul real4 ptr [00407A5Ch]
  '00532D74: mov edx, [ecx+0Ch]
  '00532D77: mov al, [edx+ebx]
  '00532D7A: mov [ebp-000000DCh], eax
  '00532D80: fild dword ptr [ebp-000000DCh]
  '00532D86: fstp real4 ptr [ebp-000000E0h]
  '00532D8C: fmul real4 ptr [ebp-000000E0h]
  '00532D92: cmp [00541000h], 00000000h
  '00532D99: jnz 532DA3h
  '00532D9B: fdiv real4 ptr [00407A5Ch]
  '00532DA1: jmp 532DAEh
  '00532DA3: push [00407A5Ch]
  '00532DA9: call 004081C8h
  '00532DAE: fstsw ax
  '00532DB0: test al, 0Dh
  '00532DB2: jnz 00532FA3h
  '00532DB8: call [004011C4h]
  '00532DBE: mov ecx, [ebp-44h]
  '00532DC1: mov edx, [ecx+0Ch]
  '00532DC4: lea ecx, [ebp-54h]
  '00532DC7: mov [edx+esi], al
  '00532DCA: call [00401030h]
  '00532DD0: mov eax, [ebp-44h]
  '00532DD3: mov [ebp-4Ch], 80020004h
  '00532DDA: test eax, eax
  '00532DDC: mov [ebp-54h], 0000000Ah
  '00532DE3: jz 532E2Ah
  '00532DE5: cmp word ptr [eax], 0002h
  '00532DE9: jnz 532E2Ah
  '00532DEB: mov esi, [ebp-40h]
  '00532DEE: mov edx, [eax+1Ch]
  '00532DF1: mov ecx, [eax+18h]
  '00532DF4: add esi, 00000003h
  '00532DF7: jo 00532FA8h
  '00532DFD: sub esi, edx
  '00532DFF: cmp esi, ecx
  '00532E01: jb 532E08h
  '00532E03: call edi
  '00532E05: mov eax, [ebp-44h]
  '00532E08: mov edi, [ebp-3Ch]
  '00532E0B: mov edx, [eax+14h]
  '00532E0E: mov ecx, [eax+10h]
  '00532E11: sub edi, edx
  '00532E13: cmp edi, ecx
  '00532E15: jb 532E20h
  '00532E17: call [00401178h]
  '00532E1D: mov eax, [ebp-44h]
  '00532E20: mov ebx, [eax+18h]
  '00532E23: imul ebx, edi
  '00532E26: add ebx, esi
  '00532E28: jmp 532E31h
  '00532E2A: call edi
  '00532E2C: mov ebx, eax
  '00532E2E: mov eax, [ebp-44h]
  '00532E31: test eax, eax
  '00532E33: jz 532E82h
  '00532E35: cmp word ptr [eax], 0002h
  '00532E39: jnz 532E82h
  '00532E3B: mov esi, [ebp-40h]
  '00532E3E: mov edx, [eax+1Ch]
  '00532E41: mov ecx, [eax+18h]
  '00532E44: add esi, 00000002h
  '00532E47: jo 00532FA8h
  '00532E4D: sub esi, edx
  '00532E4F: cmp esi, ecx
  '00532E51: jb 532E5Ch
  '00532E53: call [00401178h]
  '00532E59: mov eax, [ebp-44h]
  '00532E5C: mov ecx, [ebp-3Ch]
  '00532E5F: mov edi, [eax+14h]
  '00532E62: mov edx, [eax+10h]
  '00532E65: sub ecx, edi
  '00532E67: cmp ecx, edx
  '00532E69: mov [ebp-74h], ecx
  '00532E6C: jb 532E77h
  '00532E6E: call [00401178h]
  '00532E74: mov eax, [ebp-44h]
  '00532E77: mov edi, [eax+18h]
  '00532E7A: imul edi, [ebp-74h]
  '00532E7E: add edi, esi
  '00532E80: jmp 532E8Ah
  '00532E82: call [00401178h]
  '00532E88: mov edi, eax
  '00532E8A: lea eax, [ebp-54h]
  '00532E8D: push eax
  '00532E8E: call [004010C0h]
  '00532E94: mov ecx, [ebp-44h]
  '00532E97: xor eax, eax
  '00532E99: fmul real4 ptr [00407A5Ch]
  '00532E9F: mov edx, [ecx+0Ch]
  '00532EA2: mov al, [edx+ebx]
  '00532EA5: mov [ebp-000000E4h], eax
  '00532EAB: fild dword ptr [ebp-000000E4h]
  '00532EB1: fstp real4 ptr [ebp-000000E8h]
  '00532EB7: fmul real4 ptr [ebp-000000E8h]
  '00532EBD: cmp [00541000h], 00000000h
  '00532EC4: jnz 532ECEh
  '00532EC6: fdiv real4 ptr [00407A5Ch]
  '00532ECC: jmp 532ED9h
  '00532ECE: push [00407A5Ch]
  '00532ED4: call 004081C8h
  '00532ED9: fstsw ax
  '00532EDB: test al, 0Dh
  '00532EDD: jnz 00532FA3h
  '00532EE3: call [004011C4h]
  '00532EE9: mov ecx, [ebp-44h]
  '00532EEC: mov edx, [ecx+0Ch]
  '00532EEF: lea ecx, [ebp-54h]
  '00532EF2: mov [edx+edi], al
  '00532EF5: call [00401030h]
  '00532EFB: mov ecx, [ebp-40h]
  '00532EFE: mov esi, [ebp+08h]
  '00532F01: mov ebx, [ebp-0000009Ch]
  '00532F07: mov eax, 00000004h
  '00532F0C: add eax, ecx
  '00532F0E: jo 00532FA8h
  '00532F14: mov [ebp-40h], eax
  '00532F17: mov eax, [ebp-000000A4h]
  '00532F1D: mov edi, [ebp-40h]
  '00532F20: jmp 00532AC8h
  '00532F25: mov ecx, [ebp-3Ch]
  '00532F28: mov eax, 00000001h
  '00532F2D: add eax, ecx
  '00532F2F: jo 532FA8h
  '00532F31: mov [ebp-3Ch], eax
  '00532F34: jmp 00532A8Bh
  '00532F39: lea eax, [ebp-44h]
  '00532F3C: push eax
  '00532F3D: call 0042C914h
  '00532F42: mov esi, [0040109Ch]
  '00532F48: mov [ebp-68h], eax
  '00532F4B: call esi
  '00532F4D: mov edx, [ebp-68h]
  '00532F50: lea ecx, [ebp-6Ch]
  '00532F53: push 00000004h
  '00532F55: push ecx
  '00532F56: push edx
  '00532F57: mov [ebp-6Ch], 00000000h
  '00532F5E: call 0041D584h
  '00532F63: call esi
  '00532F65: wait 
  '00532F66: push 00532F84h
  '00532F6B: jmp 532F77h
  '00532F6D: lea ecx, [ebp-54h]
  '00532F70: call [00401030h]
  '00532F76: ret 
End Sub
Private Sub unknown_532FB0
  '00532FB0: push ebp
  '00532FB1: mov ebp, esp
  '00532FB3: sub esp, 0000000Ch
  '00532FB6: push 004081B6h
  '00532FBB: mov eax, fs:[00h]
  '00532FC1: push eax
  '00532FC2: mov fs:[00000000h], esp
  '00532FC9: sub esp, 00000008h
  '00532FCC: push ebx
  '00532FCD: push esi
  '00532FCE: push edi
  '00532FCF: mov [ebp-0Ch], esp
  '00532FD2: mov [ebp-08h], 00407A70h
  '00532FD9: xor ebx, ebx
  '00532FDB: mov [ebp-04h], ebx
  '00532FDE: mov esi, [ebp+08h]
  '00532FE1: push esi
  '00532FE2: mov eax, [esi]
  '00532FE4: call [eax+04h]
  '00532FE7: mov eax, [esi+3Ch]
  '00532FEA: cmp eax, ebx
  '00532FEC: jz 533030h
  '00532FEE: cmp [esi+34h], ebx
  '00532FF1: jz 53301Dh
  '00532FF3: mov ecx, [esi+38h]
  '00532FF6: push ecx
  '00532FF7: push eax
  '00532FF8: call 00420BECh
  '00532FFD: mov edi, [0040109Ch]
  '00533003: call edi
  '00533005: mov edx, [esi+34h]
  '00533008: push edx
  '00533009: call 00420C34h
  '0053300E: call edi
  '00533010: mov eax, [esi+3Ch]
  '00533013: push eax
  '00533014: call 00420C34h
  '00533019: call edi
  '0053301B: jmp 533036h
  '0053301D: mov eax, [esi+3Ch]
  '00533020: mov edi, [0040109Ch]
  '00533026: push eax
  '00533027: call 00420C34h
  '0053302C: call edi
  '0053302E: jmp 533036h
  '00533030: mov edi, [0040109Ch]
  '00533036: mov eax, [esi+40h]
  '00533039: mov [esi+3Ch], ebx
  '0053303C: cmp eax, ebx
  '0053303E: mov [esi+34h], ebx
  '00533041: mov [esi+38h], ebx
  '00533044: mov [esi+44h], ebx
  '00533047: jz 533054h
  '00533049: push eax
  '0053304A: call 0042CE0Ch
  '0053304F: call edi
  '00533051: mov [esi+40h], ebx
  '00533054: mov eax, [ebp+08h]
  '00533057: push eax
  '00533058: mov ecx, [eax]
  '0053305A: call [ecx+08h]
  '0053305D: mov eax, [ebp-04h]
  '00533060: mov ecx, [ebp-14h]
  '00533063: pop edi
  '00533064: pop esi
  '00533065: mov fs:[00000000h], ecx
  '0053306C: pop ebx
  '0053306D: mov esp, ebp
  '0053306F: pop ebp
  '00533070: retn 0004h
End Sub
Private Sub unknown_533080
  '00533080: push ebp
  '00533081: mov ebp, esp
  '00533083: sub esp, 0000000Ch
  '00533086: push 004081B6h
  '0053308B: mov eax, fs:[00h]
  '00533091: push eax
  '00533092: mov fs:[00000000h], esp
  '00533099: sub esp, 00000018h
  '0053309C: push ebx
  '0053309D: push esi
  '0053309E: push edi
  '0053309F: mov [ebp-0Ch], esp
  '005330A2: mov [ebp-08h], 00407A78h
  '005330A9: xor ebx, ebx
  '005330AB: mov [ebp-04h], ebx
  '005330AE: mov esi, [ebp+08h]
  '005330B1: push esi
  '005330B2: mov eax, [esi]
  '005330B4: call [eax+04h]
  '005330B7: mov ecx, [ebp+14h]
  '005330BA: push 004099F4h
  '005330BF: mov [ebp-18h], ebx
  '005330C2: mov [ebp-1Ch], ebx
  '005330C5: mov [ebp-20h], ebx
  '005330C8: mov [ecx], ebx
  '005330CA: call [00401200h]
  '005330D0: lea edx, [ebp-18h]
  '005330D3: push eax
  '005330D4: push edx
  '005330D5: call [004010E4h]
  '005330DB: mov eax, [ebp-18h]
  '005330DE: mov edi, [ebp+10h]
  '005330E1: lea edx, [ebp-20h]
  '005330E4: mov ecx, [eax]
  '005330E6: push edx
  '005330E7: mov edx, [ebp+0Ch]
  '005330EA: push edx
  '005330EB: push edi
  '005330EC: push eax
  '005330ED: call [ecx+30h]
  '005330F0: cmp eax, ebx
  '005330F2: fclex 
  '005330F4: jnl 533108h
  '005330F6: mov ecx, [ebp-18h]
  '005330F9: push 00000030h
  '005330FB: push 0042C8ECh
  '00533100: push ecx
  '00533101: push eax
  '00533102: call [004010A0h]
  '00533108: cmp [ebp-20h], bx
  '0053310C: jz 53316Bh
  '0053310E: cmp edi, [esi+4Ch]
  '00533111: jnz 53314Fh
  '00533113: mov edx, [ebp+0Ch]
  '00533116: mov eax, [esi+50h]
  '00533119: cmp edx, eax
  '0053311B: jnz 53314Fh
  '0053311D: mov eax, [ebp-18h]
  '00533120: mov edx, [esi+3Ch]
  '00533123: push 00CC0020h
  '00533128: push FFFFFFFFh
  '0053312A: mov ecx, [eax]
  '0053312C: push FFFFFFFFh
  '0053312E: push ebx
  '0053312F: push ebx
  '00533130: push edx
  '00533131: push eax
  '00533132: call [ecx+40h]
  '00533135: cmp eax, ebx
  '00533137: fclex 
  '00533139: jnl 53315Dh
  '0053313B: mov ecx, [ebp-18h]
  '0053313E: push 00000040h
  '00533140: push 0042C8ECh
  '00533145: push ecx
  '00533146: push eax
  '00533147: call [004010A0h]
  '0053314D: jmp 53315Dh
  '0053314F: mov edx, [esi]
  '00533151: lea eax, [ebp-20h]
  '00533154: lea ecx, [ebp-18h]
  '00533157: push eax
  '00533158: push ecx
  '00533159: push esi
  '0053315A: call [edx+7Ch]
  '0053315D: mov edx, [ebp-18h]
  '00533160: lea eax, [ebp-1Ch]
  '00533163: push edx
  '00533164: push eax
  '00533165: call [004010F8h]
  '0053316B: push 00533186h
  '00533170: jmp 53317Ch
  '00533172: lea ecx, [ebp-1Ch]
  '00533175: call [004013B8h]
  '0053317B: ret 
End Sub
Private Sub unknown_530D50
  '00530D50: push ebp
  '00530D51: mov ebp, esp
  '00530D53: sub esp, 0000000Ch
  '00530D56: push 004081B6h
  '00530D5B: mov eax, fs:[00h]
  '00530D61: push eax
  '00530D62: mov fs:[00000000h], esp
  '00530D69: sub esp, 000000E8h
  '00530D6F: push ebx
  '00530D70: push esi
  '00530D71: push edi
  '00530D72: mov [ebp-0Ch], esp
  '00530D75: mov [ebp-08h], 004079F0h
  '00530D7C: mov edx, [ebp+10h]
  '00530D7F: xor eax, eax
  '00530D81: mov [ebp-48h], eax
  '00530D84: xor ebx, ebx
  '00530D86: mov [ebp-44h], eax
  '00530D89: lea ecx, [ebp-30h]
  '00530D8C: mov [ebp-40h], eax
  '00530D8F: mov [ebp-18h], ebx
  '00530D92: mov [ebp-30h], ebx
  '00530D95: mov [ebp-3Ch], eax
  '00530D98: mov [ebp-58h], ebx
  '00530D9B: mov [ebp-60h], ebx
  '00530D9E: mov [ebp-64h], ebx
  '00530DA1: mov [ebp-68h], ebx
  '00530DA4: mov [ebp-6Ch], ebx
  '00530DA7: mov [ebp-7Ch], ebx
  '00530DAA: mov [ebp-0000008Ch], ebx
  '00530DB0: mov [ebp-0000009Ch], ebx
  '00530DB6: mov [ebp-000000ACh], ebx
  '00530DBC: mov [ebp-000000BCh], ebx
  '00530DC2: mov [ebp-000000D0h], ebx
  '00530DC8: mov [ebp-000000D4h], ebx
  '00530DCE: call [004012D8h]
  '00530DD4: mov ecx, [ebp+14h]
  '00530DD7: mov edi, [ebp+08h]
  '00530DDA: mov eax, [ebp-30h]
  '00530DDD: push ebx
  '00530DDE: push 00000080h
  '00530DE3: mov [ecx], ebx
  '00530DE5: mov edx, [edi+5Ch]
  '00530DE8: push 00000002h
  '00530DEA: push ebx
  '00530DEB: push ebx
  '00530DEC: add edx, 0000003Ah
  '00530DEF: push C0000000h
  '00530DF4: lea ecx, [ebp-60h]
  '00530DF7: push eax
  '00530DF8: jo 00531239h
  '00530DFE: push ecx
  '00530DFF: mov word ptr [ebp-48h], 4D42h
  '00530E05: mov [ebp-3Ch], 0000003Ah
  '00530E0C: mov [ebp-44h], edx
  '00530E0F: call [00401330h]
  '00530E15: push eax
  '00530E16: call 0042CB60h
  '00530E1B: mov esi, [0040109Ch]
  '00530E21: mov [ebp-000000D4h], eax
  '00530E27: call esi
  '00530E29: mov edx, [ebp-60h]
  '00530E2C: lea eax, [ebp-30h]
  '00530E2F: push edx
  '00530E30: push eax
  '00530E31: call [00401238h]
  '00530E37: mov ecx, [ebp-000000D4h]
  '00530E3D: mov [ebp-24h], ecx
  '00530E40: lea ecx, [ebp-60h]
  '00530E43: call [004013B4h]
  '00530E49: call [00401300h]
  '00530E4F: lea edx, [ebp-68h]
  '00530E52: push eax
  '00530E53: push edx
  '00530E54: call [004010E4h]
  '00530E5A: mov ecx, [eax]
  '00530E5C: lea edx, [ebp-000000D4h]
  '00530E62: push edx
  '00530E63: push eax
  '00530E64: mov [ebp-000000D8h], eax
  '00530E6A: call [ecx+4Ch]
  '00530E6D: cmp eax, ebx
  '00530E6F: fclex 
  '00530E71: jnl 530E88h
  '00530E73: mov ecx, [ebp-000000D8h]
  '00530E79: push 0000004Ch
  '00530E7B: push 0041E948h
  '00530E80: push ecx
  '00530E81: push eax
  '00530E82: call [004010A0h]
  '00530E88: mov edx, [ebp-000000D4h]
  '00530E8E: lea ecx, [ebp-68h]
  '00530E91: mov [ebp-5Ch], edx
  '00530E94: call [004013B8h]
  '00530E9A: cmp [ebp-24h], FFFFFFFFh
  '00530E9E: jnz 00530FF1h
  '00530EA4: cmp [0054238Ch], ebx
  '00530EAA: jnz 530EBCh
  '00530EAC: push 0054238Ch
  '00530EB1: push 0041D9E0h
  '00530EB6: call [004012B8h]
  '00530EBC: mov esi, [0054238Ch]
  '00530EC2: lea ecx, [ebp-68h]
  '00530EC5: push ecx
  '00530EC6: push esi
  '00530EC7: mov eax, [esi]
  '00530EC9: call [eax+14h]
  '00530ECC: cmp eax, ebx
  '00530ECE: fclex 
  '00530ED0: jnl 530EE1h
  '00530ED2: push 00000014h
  '00530ED4: push 0041D9D0h
  '00530ED9: push esi
  '00530EDA: push eax
  '00530EDB: call [004010A0h]
  '00530EE1: mov eax, [ebp-68h]
  '00530EE4: lea ecx, [ebp-60h]
  '00530EE7: push ecx
  '00530EE8: push eax
  '00530EE9: mov edx, [eax]
  '00530EEB: mov esi, eax
  '00530EED: call [edx+58h]
  '00530EF0: cmp eax, ebx
  '00530EF2: fclex 
  '00530EF4: jnl 530F05h
  '00530EF6: push 00000058h
  '00530EF8: push 0041D9F0h
  '00530EFD: push esi
  '00530EFE: push eax
  '00530EFF: call [004010A0h]
  '00530F05: mov ecx, [ebp-5Ch]
  '00530F08: mov edx, [edi]
  '00530F0A: lea eax, [ebp-64h]
  '00530F0D: push eax
  '00530F0E: push ecx
  '00530F0F: push edi
  '00530F10: call [edx+74h]
  '00530F13: call [00401300h]
  '00530F19: lea edx, [ebp-6Ch]
  '00530F1C: push eax
  '00530F1D: push edx
  '00530F1E: call [004010E4h]
  '00530F24: mov edi, eax
  '00530F26: mov eax, 0000000Ah
  '00530F2B: mov [ebp-000000ACh], eax
  '00530F31: mov [ebp-0000009Ch], eax
  '00530F37: mov eax, [ebp-64h]
  '00530F3A: mov ecx, 80020004h
  '00530F3F: mov [ebp-00000084h], eax
  '00530F45: mov eax, [ebp-60h]
  '00530F48: mov esi, 00000008h
  '00530F4D: push eax
  '00530F4E: push 0042CF94h
  '00530F53: mov [ebp-000000A4h], ecx
  '00530F59: mov [ebp-00000094h], ecx
  '00530F5F: mov [ebp-64h], ebx
  '00530F62: mov [ebp-0000008Ch], esi
  '00530F68: call [0040108Ch]
  '00530F6E: mov [ebp-74h], eax
  '00530F71: lea edx, [ebp-000000ACh]
  '00530F77: lea eax, [ebp-0000009Ch]
  '00530F7D: push edx
  '00530F7E: push eax
  '00530F7F: lea edx, [ebp-0000008Ch]
  '00530F85: lea eax, [ebp-7Ch]
  '00530F88: push edx
  '00530F89: mov [ebp-7Ch], esi
  '00530F8C: mov ecx, [edi]
  '00530F8E: push eax
  '00530F8F: push 00000011h
  '00530F91: push edi
  '00530F92: call [ecx+44h]
  '00530F95: cmp eax, ebx
  '00530F97: fclex 
  '00530F99: jnl 530FAAh
  '00530F9B: push 00000044h
  '00530F9D: push 0041E948h
  '00530FA2: push edi
  '00530FA3: push eax
  '00530FA4: call [004010A0h]
  '00530FAA: lea ecx, [ebp-60h]
  '00530FAD: call [004013B4h]
  '00530FB3: lea ecx, [ebp-6Ch]
  '00530FB6: lea edx, [ebp-68h]
  '00530FB9: push ecx
  '00530FBA: push edx
  '00530FBB: push 00000002h
  '00530FBD: call [00401064h]
  '00530FC3: lea eax, [ebp-000000ACh]
  '00530FC9: lea ecx, [ebp-0000009Ch]
  '00530FCF: push eax
  '00530FD0: lea edx, [ebp-0000008Ch]
  '00530FD6: push ecx
  '00530FD7: lea eax, [ebp-7Ch]
  '00530FDA: push edx
  '00530FDB: push eax
  '00530FDC: push 00000004h
  '00530FDE: call [00401050h]
  '00530FE4: add esp, 00000020h
  '00530FE7: push 0053120Ah
  '00530FEC: jmp 00531200h
  '00530FF1: push 0000000Eh
  '00530FF3: push 00000040h
  '00530FF5: call 0041D37Ch
  '00530FFA: mov [ebp-000000D4h], eax
  '00531000: call esi
  '00531002: mov eax, [ebp-000000D4h]
  '00531008: push eax
  '00531009: mov [ebp-34h], eax
  '0053100C: call 0041D44Ch
  '00531011: mov [ebp-000000D4h], eax
  '00531017: call esi
  '00531019: mov eax, [ebp-000000D4h]
  '0053101F: lea ecx, [ebp-48h]
  '00531022: push 00000002h
  '00531024: push ecx
  '00531025: push eax
  '00531026: mov [ebp-38h], eax
  '00531029: call 0041D584h
  '0053102E: call esi
  '00531030: mov eax, [ebp-38h]
  '00531033: lea edx, [ebp-44h]
  '00531036: add eax, 00000002h
  '00531039: push 00000004h
  '0053103B: push edx
  '0053103C: jo 00531239h
  '00531042: push eax
  '00531043: call 0041D584h
  '00531048: call esi
  '0053104A: mov edx, [ebp-38h]
  '0053104D: lea ecx, [ebp-000000D4h]
  '00531053: add edx, 00000006h
  '00531056: push 00000004h
  '00531058: push ecx
  '00531059: mov [ebp-000000D4h], ebx
  '0053105F: jo 00531239h
  '00531065: push edx
  '00531066: call 0041D584h
  '0053106B: call esi
  '0053106D: mov ecx, [ebp-38h]
  '00531070: lea eax, [ebp-3Ch]
  '00531073: add ecx, 0000000Ah
  '00531076: push 00000004h
  '00531078: push eax
  '00531079: jo 00531239h
  '0053107F: push ecx
  '00531080: call 0041D584h
  '00531085: call esi
  '00531087: mov eax, [ebp-38h]
  '0053108A: mov ecx, [ebp-24h]
  '0053108D: lea edx, [ebp-18h]
  '00531090: push ebx
  '00531091: push edx
  '00531092: push 0000000Eh
  '00531094: push eax
  '00531095: push ecx
  '00531096: call 0042CBE8h
  '0053109B: mov [ebp-000000D4h], eax
  '005310A1: call esi
  '005310A3: mov eax, [ebp-34h]
  '005310A6: mov edx, [ebp-000000D4h]
  '005310AC: push eax
  '005310AD: mov [ebp-20h], edx
  '005310B0: call 0041D53Ch
  '005310B5: call esi
  '005310B7: mov ecx, [ebp-34h]
  '005310BA: push ecx
  '005310BB: call 0041D408h
  '005310C0: call esi
  '005310C2: mov ecx, [ebp-18h]
  '005310C5: mov edx, [edi]
  '005310C7: lea eax, [ebp-000000D0h]
  '005310CD: push eax
  '005310CE: mov eax, [ebp-20h]
  '005310D1: push ecx
  '005310D2: push 0000000Eh
  '005310D4: push eax
  '005310D5: push edi
  '005310D6: call [edx+78h]
  '005310D9: mov eax, [ebp-000000D0h]
  '005310DF: mov [ebp-2Ch], eax
  '005310E2: cmp ax, bx
  '005310E5: jnz 00531175h
  '005310EB: mov eax, [ebp-24h]
  '005310EE: lea ecx, [ebp-18h]
  '005310F1: push ebx
  '005310F2: push ecx
  '005310F3: lea edx, [edi+48h]
  '005310F6: push 0000002Ch
  '005310F8: push edx
  '005310F9: push eax
  '005310FA: call 0042CBE8h
  '005310FF: mov [ebp-000000D4h], eax
  '00531105: call esi
  '00531107: mov eax, [ebp-18h]
  '0053110A: mov ecx, [edi]
  '0053110C: lea edx, [ebp-000000D0h]
  '00531112: push edx
  '00531113: mov edx, [ebp-000000D4h]
  '00531119: push eax
  '0053111A: push 0000002Ch
  '0053111C: push edx
  '0053111D: push edi
  '0053111E: call [ecx+78h]
  '00531121: mov eax, [ebp-000000D0h]
  '00531127: cmp ax, bx
  '0053112A: mov [ebp-2Ch], eax
  '0053112D: jnz 531175h
  '0053112F: mov eax, [edi+5Ch]
  '00531132: mov edx, [ebp+0Ch]
  '00531135: lea ecx, [ebp-18h]
  '00531138: push ebx
  '00531139: push ecx
  '0053113A: mov [ebp-1Ch], eax
  '0053113D: push eax
  '0053113E: mov eax, [ebp-24h]
  '00531141: push edx
  '00531142: push eax
  '00531143: call 0042CBE8h
  '00531148: mov [ebp-000000D4h], eax
  '0053114E: call esi
  '00531150: mov eax, [ebp-18h]
  '00531153: mov ecx, [edi]
  '00531155: lea edx, [ebp-000000D0h]
  '0053115B: push edx
  '0053115C: mov edx, [ebp-1Ch]
  '0053115F: push eax
  '00531160: mov eax, [ebp-000000D4h]
  '00531166: push edx
  '00531167: push eax
  '00531168: push edi
  '00531169: call [ecx+78h]
  '0053116C: mov ecx, [ebp-000000D0h]
  '00531172: mov [ebp-2Ch], ecx
  '00531175: mov edx, [ebp-24h]
  '00531178: push edx
  '00531179: call 0042CC9Ch
  '0053117E: call esi
  '00531180: mov eax, [ebp-2Ch]
  '00531183: lea edx, [ebp-000000BCh]
  '00531189: not eax
  '0053118B: lea ecx, [ebp-58h]
  '0053118E: mov [ebp-000000B4h], ax
  '00531195: mov [ebp-000000BCh], 0000000Bh
  '0053119F: call [00401020h]
  '005311A5: push 0053120Ah
  '005311AA: jmp 531200h
  '005311AC: test byte ptr [ebp-04h], 04h
  '005311B0: jz 5311BBh
  '005311B2: lea ecx, [ebp-58h]
  '005311B5: call [00401030h]
  '005311BB: lea eax, [ebp-64h]
  '005311BE: lea ecx, [ebp-60h]
  '005311C1: push eax
  '005311C2: push ecx
  '005311C3: push 00000002h
  '005311C5: call [004012E8h]
  '005311CB: lea edx, [ebp-6Ch]
  '005311CE: lea eax, [ebp-68h]
  '005311D1: push edx
  '005311D2: push eax
  '005311D3: push 00000002h
  '005311D5: call [00401064h]
  '005311DB: lea ecx, [ebp-000000ACh]
  '005311E1: lea edx, [ebp-0000009Ch]
  '005311E7: push ecx
  '005311E8: lea eax, [ebp-0000008Ch]
  '005311EE: push edx
  '005311EF: lea ecx, [ebp-7Ch]
  '005311F2: push eax
  '005311F3: push ecx
  '005311F4: push 00000004h
  '005311F6: call [00401050h]
  '005311FC: add esp, 0000002Ch
  '005311FF: ret 
End Sub
Private Sub unknown_531240
  '00531240: push ebp
  '00531241: mov ebp, esp
  '00531243: sub esp, 0000000Ch
  '00531246: push 004081B6h
  '0053124B: mov eax, fs:[00h]
  '00531251: push eax
  '00531252: mov fs:[00000000h], esp
  '00531259: sub esp, 00000050h
  '0053125C: push ebx
  '0053125D: push esi
  '0053125E: push edi
  '0053125F: mov [ebp-0Ch], esp
  '00531262: mov [ebp-08h], 00407A00h
  '00531269: mov eax, [ebp+10h]
  '0053126C: lea ecx, [ebp-34h]
  '0053126F: push ecx
  '00531270: lea edx, [ebp-44h]
  '00531273: xor esi, esi
  '00531275: push 00000100h
  '0053127A: push edx
  '0053127B: mov [ebp-1Ch], esi
  '0053127E: mov [ebp-20h], esi
  '00531281: mov [ebp-24h], esi
  '00531284: mov [ebp-44h], esi
  '00531287: mov [ebp-58h], esi
  '0053128A: mov [eax], esi
  '0053128C: mov [ebp-2Ch], esi
  '0053128F: mov [ebp-34h], 00000002h
  '00531296: call [00401248h]
  '0053129C: lea eax, [ebp-44h]
  '0053129F: push eax
  '005312A0: call [0040103Ch]
  '005312A6: mov ebx, [00401378h]
  '005312AC: mov edx, eax
  '005312AE: lea ecx, [ebp-1Ch]
  '005312B1: call ebx
  '005312B3: lea ecx, [ebp-44h]
  '005312B6: lea edx, [ebp-34h]
  '005312B9: push ecx
  '005312BA: push edx
  '005312BB: push 00000002h
  '005312BD: call [00401050h]
  '005312C3: mov eax, [ebp-1Ch]
  '005312C6: add esp, 0000000Ch
  '005312C9: mov [ebp-58h], esi
  '005312CC: push esi
  '005312CD: push eax
  '005312CE: call [00401044h]
  '005312D4: mov ecx, [ebp-1Ch]
  '005312D7: push eax
  '005312D8: lea edx, [ebp-24h]
  '005312DB: push ecx
  '005312DC: push edx
  '005312DD: call [00401330h]
  '005312E3: push eax
  '005312E4: mov eax, [ebp+0Ch]
  '005312E7: push esi
  '005312E8: lea ecx, [ebp-58h]
  '005312EB: push eax
  '005312EC: push ecx
  '005312ED: push 00001200h
  '005312F2: call 0042CCE4h
  '005312F7: mov edi, eax
  '005312F9: call [0040109Ch]
  '005312FF: mov edx, [ebp-24h]
  '00531302: lea eax, [ebp-1Ch]
  '00531305: push edx
  '00531306: push eax
  '00531307: call [00401238h]
  '0053130D: lea ecx, [ebp-24h]
  '00531310: call [004013B4h]
  '00531316: cmp edi, esi
  '00531318: jz 53132Ch
  '0053131A: mov ecx, [ebp-1Ch]
  '0053131D: push edi
  '0053131E: push ecx
  '0053131F: call [00401354h]
  '00531325: mov edx, eax
  '00531327: lea ecx, [ebp-20h]
  '0053132A: call ebx
  '0053132C: push 00531369h
  '00531331: jmp 53135Fh
  '00531333: test byte ptr [ebp-04h], 04h
  '00531337: jz 531342h
  '00531339: lea ecx, [ebp-20h]
  '0053133C: call [004013B4h]
  '00531342: lea ecx, [ebp-24h]
  '00531345: call [004013B4h]
  '0053134B: lea edx, [ebp-44h]
  '0053134E: lea eax, [ebp-34h]
  '00531351: push edx
  '00531352: push eax
  '00531353: push 00000002h
  '00531355: call [00401050h]
  '0053135B: add esp, 0000000Ch
  '0053135E: ret 
End Sub
Private Sub unknown_531390
  '00531390: mov ecx, [esp+08h]
  '00531394: xor eax, eax
  '00531396: test ecx, ecx
  '00531398: jz 5313A6h
  '0053139A: mov ecx, [esp+0Ch]
  '0053139E: mov edx, [esp+10h]
  '005313A2: cmp ecx, edx
  '005313A4: jz 5313B5h
  '005313A6: mov edx, [esp+14h]
  '005313AA: or eax, FFFFFFFFh
  '005313AD: mov [edx], ax
  '005313B0: xor eax, eax
  '005313B2: retn 0014h
End Sub
Private Sub unknown_5331B0
  '005331B0: push ebp
  '005331B1: mov ebp, esp
  '005331B3: sub esp, 00000008h
  '005331B6: push 004081B6h
  '005331BB: mov eax, fs:[00h]
  '005331C1: push eax
  '005331C2: mov fs:[00000000h], esp
  '005331C9: sub esp, 000001ACh
  '005331CF: push ebx
  '005331D0: push esi
  '005331D1: push edi
  '005331D2: mov [ebp-08h], esp
  '005331D5: mov [ebp-04h], 00407A88h
  '005331DC: mov ecx, 00000008h
  '005331E1: xor eax, eax
  '005331E3: lea edi, [ebp-58h]
  '005331E6: lea edx, [ebp-000000E4h]
  '005331EC: rep stosd 
  '005331EE: mov ecx, 00000008h
  '005331F3: lea edi, [ebp-000000C0h]
  '005331F9: rep stosd 
  '005331FB: mov edi, [ebp+08h]
  '005331FE: xor esi, esi
  '00533200: push edx
  '00533201: push edi
  '00533202: mov eax, [edi+50h]
  '00533205: mov ecx, [edi]
  '00533207: mov [ebp-6Ch], esi
  '0053320A: mov [ebp-74h], esi
  '0053320D: mov [ebp-0000008Ch], esi
  '00533213: mov [ebp-000000E4h], esi
  '00533219: mov [ebp-000000E8h], esi
  '0053321F: mov [ebp-000000BCh], 00000001h
  '00533229: mov word ptr [ebp-000000C0h], 0002h
  '00533232: mov [ebp-000000ACh], esi
  '00533238: mov [ebp-000000B0h], eax
  '0053323E: mov [ebp-000000A4h], esi
  '00533244: call [ecx+34h]
  '00533247: cmp eax, esi
  '00533249: jnl 53325Eh
  '0053324B: mov ebx, [004010A0h]
  '00533251: push 00000034h
  '00533253: push 0042C8ECh
  '00533258: push edi
  '00533259: push eax
  '0053325A: call ebx
  '0053325C: jmp 533264h
  '0053325E: mov ebx, [004010A0h]
  '00533264: mov eax, [ebp-000000E4h]
  '0053326A: mov ecx, [edi+44h]
  '0053326D: lea edx, [ebp-0000008Ch]
  '00533273: mov [ebp-000000A8h], eax
  '00533279: push edx
  '0053327A: mov [ebp-000000B4h], ecx
  '00533280: call 0042C914h
  '00533285: mov esi, [0040109Ch]
  '0053328B: mov [ebp-000000E4h], eax
  '00533291: call esi
  '00533293: lea eax, [ebp-000000C0h]
  '00533299: push eax
  '0053329A: call [00401288h]
  '005332A0: mov edx, [ebp-000000E4h]
  '005332A6: lea ecx, [ebp-000000E8h]
  '005332AC: push 00000004h
  '005332AE: push ecx
  '005332AF: push edx
  '005332B0: mov [ebp-000000E8h], eax
  '005332B6: call 0041D584h
  '005332BB: call esi
  '005332BD: mov eax, [ebp+0Ch]
  '005332C0: lea edx, [ebp-000000E4h]
  '005332C6: mov [ebp-54h], 00000001h
  '005332CD: mov word ptr [ebp-58h], 0002h
  '005332D3: mov esi, [eax]
  '005332D5: mov [ebp-44h], 00000000h
  '005332DC: push edx
  '005332DD: push esi
  '005332DE: mov ecx, [esi]
  '005332E0: call [ecx+3Ch]
  '005332E3: test eax, eax
  '005332E5: fclex 
  '005332E7: jnl 5332F4h
  '005332E9: push 0000003Ch
  '005332EB: push 0042C8ECh
  '005332F0: push esi
  '005332F1: push eax
  '005332F2: call ebx
  '005332F4: mov ecx, [ebp+0Ch]
  '005332F7: mov eax, [ebp-000000E4h]
  '005332FD: mov [ebp-48h], eax
  '00533300: lea eax, [ebp-000000E4h]
  '00533306: mov esi, [ecx]
  '00533308: mov [ebp-3Ch], 00000000h
  '0053330F: push eax
  '00533310: push esi
  '00533311: mov edx, [esi]
  '00533313: call [edx+34h]
  '00533316: test eax, eax
  '00533318: fclex 
  '0053331A: jnl 533327h
  '0053331C: push 00000034h
  '0053331E: push 0042C8ECh
  '00533323: push esi
  '00533324: push eax
  '00533325: call ebx
  '00533327: mov edx, [ebp+0Ch]
  '0053332A: mov ecx, [ebp-000000E4h]
  '00533330: mov [ebp-40h], ecx
  '00533333: lea ecx, [ebp-000000E4h]
  '00533339: mov esi, [edx]
  '0053333B: push ecx
  '0053333C: push esi
  '0053333D: mov eax, [esi]
  '0053333F: call [eax+5Ch]
  '00533342: test eax, eax
  '00533344: fclex 
  '00533346: jnl 533353h
  '00533348: push 0000005Ch
  '0053334A: push 0042C8ECh
  '0053334F: push esi
  '00533350: push eax
  '00533351: call ebx
  '00533353: mov edx, [ebp-000000E4h]
  '00533359: lea eax, [ebp-6Ch]
  '0053335C: push eax
  '0053335D: mov [ebp-4Ch], edx
  '00533360: call 0042C914h
  '00533365: mov esi, [0040109Ch]
  '0053336B: mov [ebp-000000E4h], eax
  '00533371: call esi
  '00533373: lea ecx, [ebp-58h]
  '00533376: push ecx
  '00533377: call [00401288h]
  '0053337D: mov [ebp-000000E8h], eax
  '00533383: mov eax, [ebp-000000E4h]
  '00533389: lea edx, [ebp-000000E8h]
  '0053338F: push 00000004h
  '00533391: push edx
  '00533392: push eax
  '00533393: call 0041D584h
  '00533398: call esi
  '0053339A: mov ecx, [ebp+0Ch]
  '0053339D: lea eax, [ebp-000000E8h]
  '005333A3: push eax
  '005333A4: mov esi, [ecx]
  '005333A6: push esi
  '005333A7: mov edx, [esi]
  '005333A9: call [edx+38h]
  '005333AC: test eax, eax
  '005333AE: fclex 
  '005333B0: jnl 5333BDh
  '005333B2: push 00000038h
  '005333B4: push 0042C8ECh
  '005333B9: push esi
  '005333BA: push eax
  '005333BB: call ebx
  '005333BD: mov ecx, [edi]
  '005333BF: lea edx, [ebp-000000E4h]
  '005333C5: push edx
  '005333C6: push edi
  '005333C7: call [ecx+38h]
  '005333CA: test eax, eax
  '005333CC: jnl 5333D9h
  '005333CE: push 00000038h
  '005333D0: push 0042C8ECh
  '005333D5: push edi
  '005333D6: push eax
  '005333D7: call ebx
  '005333D9: mov eax, [ebp-000000E4h]
  '005333DF: mov ecx, [ebp+0Ch]
  '005333E2: sub eax, 00000001h
  '005333E5: jo 00534042h
  '005333EB: mov [ebp-00000118h], eax
  '005333F1: mov esi, [ecx]
  '005333F3: fild dword ptr [ebp-00000118h]
  '005333F9: mov edx, [esi]
  '005333FB: fstp real8 ptr [ebp-00000120h]
  '00533401: fild dword ptr [ebp-000000E8h]
  '00533407: fstp real8 ptr [ebp-00000128h]
  '0053340D: fld real8 ptr [ebp-00000120h]
  '00533413: cmp [00541000h], 00000000h
  '0053341A: jnz 533424h
  '0053341C: fdiv real8 ptr [ebp-00000128h]
  '00533422: jmp 533435h
  '00533424: push [ebp-00000124h]
  '0053342A: push [ebp-00000128h]
  '00533430: call 004081D4h
  '00533435: fstp real4 ptr [ebp-7Ch]
  '00533438: fstsw ax
  '0053343A: test al, 0Dh
  '0053343C: jnz 0053403Dh
  '00533442: lea eax, [ebp-000000E8h]
  '00533448: push eax
  '00533449: push esi
  '0053344A: call [edx+3Ch]
  '0053344D: test eax, eax
  '0053344F: fclex 
  '00533451: jnl 53345Eh
  '00533453: push 0000003Ch
  '00533455: push 0042C8ECh
  '0053345A: push esi
  '0053345B: push eax
  '0053345C: call ebx
  '0053345E: mov ecx, [edi]
  '00533460: lea edx, [ebp-000000E4h]
  '00533466: push edx
  '00533467: push edi
  '00533468: call [ecx+3Ch]
  '0053346B: test eax, eax
  '0053346D: jnl 53347Ah
  '0053346F: push 0000003Ch
  '00533471: push 0042C8ECh
  '00533476: push edi
  '00533477: push eax
  '00533478: call ebx
  '0053347A: mov eax, [ebp-000000E4h]
  '00533480: mov ecx, [ebp+0Ch]
  '00533483: sub eax, 00000001h
  '00533486: jo 00534042h
  '0053348C: mov [ebp-0000012Ch], eax
  '00533492: mov edi, [ecx]
  '00533494: fild dword ptr [ebp-0000012Ch]
  '0053349A: mov edx, [edi]
  '0053349C: fstp real8 ptr [ebp-00000134h]
  '005334A2: fild dword ptr [ebp-000000E8h]
  '005334A8: fstp real8 ptr [ebp-0000013Ch]
  '005334AE: fld real8 ptr [ebp-00000134h]
  '005334B4: cmp [00541000h], 00000000h
  '005334BB: jnz 5334C5h
  '005334BD: fdiv real8 ptr [ebp-0000013Ch]
  '005334C3: jmp 5334D6h
  '005334C5: push [ebp-00000138h]
  '005334CB: push [ebp-0000013Ch]
  '005334D1: call 004081D4h
  '005334D6: fstp real4 ptr [ebp-70h]
  '005334D9: fstsw ax
  '005334DB: test al, 0Dh
  '005334DD: jnz 0053403Dh
  '005334E3: lea eax, [ebp-000000E4h]
  '005334E9: push eax
  '005334EA: push edi
  '005334EB: call [edx+38h]
  '005334EE: test eax, eax
  '005334F0: fclex 
  '005334F2: jnl 5334FFh
  '005334F4: push 00000038h
  '005334F6: push 0042C8ECh
  '005334FB: push edi
  '005334FC: push eax
  '005334FD: call ebx
  '005334FF: mov ecx, [ebp+0Ch]
  '00533502: mov edi, [ebp-000000E4h]
  '00533508: lea eax, [ebp-000000E4h]
  '0053350E: sub edi, 00000001h
  '00533511: mov esi, [ecx]
  '00533513: push eax
  '00533514: jo 00534042h
  '0053351A: mov edx, [esi]
  '0053351C: push esi
  '0053351D: mov [ebp-38h], edi
  '00533520: call [edx+3Ch]
  '00533523: test eax, eax
  '00533525: fclex 
  '00533527: jnl 533534h
  '00533529: push 0000003Ch
  '0053352B: push 0042C8ECh
  '00533530: push esi
  '00533531: push eax
  '00533532: call ebx
  '00533534: mov ebx, [ebp-000000E4h]
  '0053353A: mov esi, [00401384h]
  '00533540: sub ebx, 00000001h
  '00533543: mov [ebp-000000CCh], 00000000h
  '0053354D: jo 00534042h
  '00533553: mov [ebp-00000108h], ebx
  '00533559: cmp [ebp-000000CCh], ebx
  '0053355F: jnle 00533F97h
  '00533565: fild dword ptr [ebp-000000CCh]
  '0053356B: fstp real8 ptr [ebp-00000144h]
  '00533571: fld real4 ptr [ebp-70h]
  '00533574: fmul real8 ptr [ebp-00000144h]
  '0053357A: fstp real4 ptr [ebp-78h]
  '0053357D: fstsw ax
  '0053357F: test al, 0Dh
  '00533581: jnz 0053403Dh
  '00533587: fld real4 ptr [ebp-78h]
  '0053358A: call esi
  '0053358C: fld real4 ptr [ebp-78h]
  '0053358F: mov [ebp-00000094h], eax
  '00533595: mov [ebp-000000E0h], 00000000h
  '0053359F: fild dword ptr [ebp-00000094h]
  '005335A5: fstp real8 ptr [ebp-0000014Ch]
  '005335AB: fsub real8 ptr [ebp-0000014Ch]
  '005335B1: fstp real4 ptr [ebp-000000D8h]
  '005335B7: fstsw ax
  '005335B9: test al, 0Dh
  '005335BB: jnz 0053403Dh
  '005335C1: cmp [ebp-000000E0h], edi
  '005335C7: jnle 00533F79h
  '005335CD: fild dword ptr [ebp-000000E0h]
  '005335D3: fstp real8 ptr [ebp-00000154h]
  '005335D9: fld real4 ptr [ebp-7Ch]
  '005335DC: fmul real8 ptr [ebp-00000154h]
  '005335E2: fstp real4 ptr [ebp-000000A0h]
  '005335E8: fstsw ax
  '005335EA: test al, 0Dh
  '005335EC: jnz 0053403Dh
  '005335F2: fld real4 ptr [ebp-000000A0h]
  '005335F8: call esi
  '005335FA: fld real4 ptr [ebp-000000A0h]
  '00533600: mov ecx, eax
  '00533602: mov [ebp-000000D0h], ecx
  '00533608: fild dword ptr [ebp-000000D0h]
  '0053360E: fstp real8 ptr [ebp-0000015Ch]
  '00533614: fsub real8 ptr [ebp-0000015Ch]
  '0053361A: fstp real4 ptr [ebp-24h]
  '0053361D: fstsw ax
  '0053361F: test al, 0Dh
  '00533621: jnz 0053403Dh
  '00533627: imul ecx, 03h
  '0053362A: jo 00534042h
  '00533630: mov edi, ecx
  '00533632: mov ecx, [ebp-0000008Ch]
  '00533638: test ecx, ecx
  '0053363A: mov [ebp-000000D0h], edi
  '00533640: jz 533686h
  '00533642: cmp word ptr [ecx], 0002h
  '00533646: jnz 533686h
  '00533648: mov edx, [ecx+1Ch]
  '0053364B: mov eax, [ecx+18h]
  '0053364E: mov ebx, [00401178h]
  '00533654: sub edi, edx
  '00533656: cmp edi, eax
  '00533658: jb 533662h
  '0053365A: call ebx
  '0053365C: mov ecx, [ebp-0000008Ch]
  '00533662: mov esi, [ebp-00000094h]
  '00533668: mov edx, [ecx+14h]
  '0053366B: mov eax, [ecx+10h]
  '0053366E: sub esi, edx
  '00533670: cmp esi, eax
  '00533672: jb 53367Ch
  '00533674: call ebx
  '00533676: mov ecx, [ebp-0000008Ch]
  '0053367C: mov eax, [ecx+18h]
  '0053367F: imul eax, esi
  '00533682: add eax, edi
  '00533684: jmp 533694h
  '00533686: mov ebx, [00401178h]
  '0053368C: call ebx
  '0053368E: mov ecx, [ebp-0000008Ch]
  '00533694: mov esi, [ecx+0Ch]
  '00533697: xor edx, edx
  '00533699: test ecx, ecx
  '0053369B: mov dl, [esi+eax]
  '0053369E: mov [ebp-00000160h], edx
  '005336A4: fild dword ptr [ebp-00000160h]
  '005336AA: fstp real4 ptr [ebp-14h]
  '005336AD: jz 5336FCh
  '005336AF: cmp word ptr [ecx], 0002h
  '005336B3: jnz 5336FCh
  '005336B5: mov esi, [ebp-000000D0h]
  '005336BB: mov edx, [ecx+1Ch]
  '005336BE: mov eax, [ecx+18h]
  '005336C1: add esi, 00000001h
  '005336C4: jo 00534042h
  '005336CA: sub esi, edx
  '005336CC: cmp esi, eax
  '005336CE: jb 5336D8h
  '005336D0: call ebx
  '005336D2: mov ecx, [ebp-0000008Ch]
  '005336D8: mov edi, [ebp-00000094h]
  '005336DE: mov edx, [ecx+14h]
  '005336E1: mov eax, [ecx+10h]
  '005336E4: sub edi, edx
  '005336E6: cmp edi, eax
  '005336E8: jb 5336F2h
  '005336EA: call ebx
  '005336EC: mov ecx, [ebp-0000008Ch]
  '005336F2: mov eax, [ecx+18h]
  '005336F5: imul eax, edi
  '005336F8: add eax, esi
  '005336FA: jmp 533704h
  '005336FC: call ebx
  '005336FE: mov ecx, [ebp-0000008Ch]
  '00533704: mov esi, [ecx+0Ch]
  '00533707: xor edx, edx
  '00533709: test ecx, ecx
  '0053370B: mov dl, [esi+eax]
  '0053370E: mov [ebp-00000164h], edx
  '00533714: fild dword ptr [ebp-00000164h]
  '0053371A: fstp real4 ptr [ebp-00000084h]
  '00533720: jz 53376Fh
  '00533722: cmp word ptr [ecx], 0002h
  '00533726: jnz 53376Fh
  '00533728: mov esi, [ebp-000000D0h]
  '0053372E: mov edx, [ecx+1Ch]
  '00533731: mov eax, [ecx+18h]
  '00533734: add esi, 00000002h
  '00533737: jo 00534042h
  '0053373D: sub esi, edx
  '0053373F: cmp esi, eax
  '00533741: jb 53374Bh
  '00533743: call ebx
  '00533745: mov ecx, [ebp-0000008Ch]
  '0053374B: mov edi, [ebp-00000094h]
  '00533751: mov edx, [ecx+14h]
  '00533754: mov eax, [ecx+10h]
  '00533757: sub edi, edx
  '00533759: cmp edi, eax
  '0053375B: jb 533765h
  '0053375D: call ebx
  '0053375F: mov ecx, [ebp-0000008Ch]
  '00533765: mov eax, [ecx+18h]
  '00533768: imul eax, edi
  '0053376B: add eax, esi
  '0053376D: jmp 533777h
  '0053376F: call ebx
  '00533771: mov ecx, [ebp-0000008Ch]
  '00533777: mov esi, [ecx+0Ch]
  '0053377A: xor edx, edx
  '0053377C: test ecx, ecx
  '0053377E: mov dl, [esi+eax]
  '00533781: mov [ebp-00000168h], edx
  '00533787: fild dword ptr [ebp-00000168h]
  '0053378D: fstp real4 ptr [ebp-18h]
  '00533790: jz 5337DFh
  '00533792: cmp word ptr [ecx], 0002h
  '00533796: jnz 5337DFh
  '00533798: mov esi, [ebp-000000D0h]
  '0053379E: mov edx, [ecx+1Ch]
  '005337A1: mov eax, [ecx+18h]
  '005337A4: add esi, 00000003h
  '005337A7: jo 00534042h
  '005337AD: sub esi, edx
  '005337AF: cmp esi, eax
  '005337B1: jb 5337BBh
  '005337B3: call ebx
  '005337B5: mov ecx, [ebp-0000008Ch]
  '005337BB: mov edi, [ebp-00000094h]
  '005337C1: mov edx, [ecx+14h]
  '005337C4: mov eax, [ecx+10h]
  '005337C7: sub edi, edx
  '005337C9: cmp edi, eax
  '005337CB: jb 5337D5h
  '005337CD: call ebx
  '005337CF: mov ecx, [ebp-0000008Ch]
  '005337D5: mov eax, [ecx+18h]
  '005337D8: imul eax, edi
  '005337DB: add eax, esi
  '005337DD: jmp 5337E7h
  '005337DF: call ebx
  '005337E1: mov ecx, [ebp-0000008Ch]
  '005337E7: mov esi, [ecx+0Ch]
  '005337EA: xor edx, edx
  '005337EC: test ecx, ecx
  '005337EE: mov dl, [esi+eax]
  '005337F1: mov [ebp-0000016Ch], edx
  '005337F7: fild dword ptr [ebp-0000016Ch]
  '005337FD: fstp real4 ptr [ebp-1Ch]
  '00533800: jz 53384Fh
  '00533802: cmp word ptr [ecx], 0002h
  '00533806: jnz 53384Fh
  '00533808: mov esi, [ebp-000000D0h]
  '0053380E: mov edx, [ecx+1Ch]
  '00533811: mov eax, [ecx+18h]
  '00533814: add esi, 00000004h
  '00533817: jo 00534042h
  '0053381D: sub esi, edx
  '0053381F: cmp esi, eax
  '00533821: jb 53382Bh
  '00533823: call ebx
  '00533825: mov ecx, [ebp-0000008Ch]
  '0053382B: mov edi, [ebp-00000094h]
  '00533831: mov edx, [ecx+14h]
  '00533834: mov eax, [ecx+10h]
  '00533837: sub edi, edx
  '00533839: cmp edi, eax
  '0053383B: jb 533845h
  '0053383D: call ebx
  '0053383F: mov ecx, [ebp-0000008Ch]
  '00533845: mov eax, [ecx+18h]
  '00533848: imul eax, edi
  '0053384B: add eax, esi
  '0053384D: jmp 533857h
  '0053384F: call ebx
  '00533851: mov ecx, [ebp-0000008Ch]
  '00533857: mov esi, [ecx+0Ch]
  '0053385A: xor edx, edx
  '0053385C: test ecx, ecx
  '0053385E: mov dl, [esi+eax]
  '00533861: mov [ebp-00000170h], edx
  '00533867: fild dword ptr [ebp-00000170h]
  '0053386D: fstp real4 ptr [ebp-00000090h]
  '00533873: jz 5338C2h
  '00533875: cmp word ptr [ecx], 0002h
  '00533879: jnz 5338C2h
  '0053387B: mov esi, [ebp-000000D0h]
  '00533881: mov edx, [ecx+1Ch]
  '00533884: mov eax, [ecx+18h]
  '00533887: add esi, 00000005h
  '0053388A: jo 00534042h
  '00533890: sub esi, edx
  '00533892: cmp esi, eax
  '00533894: jb 53389Eh
  '00533896: call ebx
  '00533898: mov ecx, [ebp-0000008Ch]
  '0053389E: mov edi, [ebp-00000094h]
  '005338A4: mov edx, [ecx+14h]
  '005338A7: mov eax, [ecx+10h]
  '005338AA: sub edi, edx
  '005338AC: cmp edi, eax
  '005338AE: jb 5338B8h
  '005338B0: call ebx
  '005338B2: mov ecx, [ebp-0000008Ch]
  '005338B8: mov eax, [ecx+18h]
  '005338BB: imul eax, edi
  '005338BE: add eax, esi
  '005338C0: jmp 5338CAh
  '005338C2: call ebx
  '005338C4: mov ecx, [ebp-0000008Ch]
  '005338CA: mov esi, [ecx+0Ch]
  '005338CD: xor edx, edx
  '005338CF: test ecx, ecx
  '005338D1: mov dl, [esi+eax]
  '005338D4: mov [ebp-00000174h], edx
  '005338DA: fild dword ptr [ebp-00000174h]
  '005338E0: fstp real4 ptr [ebp-20h]
  '005338E3: jz 533932h
  '005338E5: cmp word ptr [ecx], 0002h
  '005338E9: jnz 533932h
  '005338EB: mov edi, [ebp-000000D0h]
  '005338F1: mov edx, [ecx+1Ch]
  '005338F4: mov eax, [ecx+18h]
  '005338F7: sub edi, edx
  '005338F9: cmp edi, eax
  '005338FB: jb 533905h
  '005338FD: call ebx
  '005338FF: mov ecx, [ebp-0000008Ch]
  '00533905: mov esi, [ebp-00000094h]
  '0053390B: mov edx, [ecx+14h]
  '0053390E: mov eax, [ecx+10h]
  '00533911: add esi, 00000001h
  '00533914: jo 00534042h
  '0053391A: sub esi, edx
  '0053391C: cmp esi, eax
  '0053391E: jb 533928h
  '00533920: call ebx
  '00533922: mov ecx, [ebp-0000008Ch]
  '00533928: mov eax, [ecx+18h]
  '0053392B: imul eax, esi
  '0053392E: add eax, edi
  '00533930: jmp 53393Ah
  '00533932: call ebx
  '00533934: mov ecx, [ebp-0000008Ch]
  '0053393A: mov esi, [ecx+0Ch]
  '0053393D: xor edx, edx
  '0053393F: test ecx, ecx
  '00533941: mov dl, [esi+eax]
  '00533944: mov [ebp-00000178h], edx
  '0053394A: fild dword ptr [ebp-00000178h]
  '00533950: fstp real4 ptr [ebp-30h]
  '00533953: jz 5339ABh
  '00533955: cmp word ptr [ecx], 0002h
  '00533959: jnz 5339ABh
  '0053395B: mov edi, [ebp-000000D0h]
  '00533961: mov edx, [ecx+1Ch]
  '00533964: mov eax, [ecx+18h]
  '00533967: add edi, 00000001h
  '0053396A: jo 00534042h
  '00533970: sub edi, edx
  '00533972: cmp edi, eax
  '00533974: jb 53397Eh
  '00533976: call ebx
  '00533978: mov ecx, [ebp-0000008Ch]
  '0053397E: mov esi, [ebp-00000094h]
  '00533984: mov edx, [ecx+14h]
  '00533987: mov eax, [ecx+10h]
  '0053398A: add esi, 00000001h
  '0053398D: jo 00534042h
  '00533993: sub esi, edx
  '00533995: cmp esi, eax
  '00533997: jb 5339A1h
  '00533999: call ebx
  '0053399B: mov ecx, [ebp-0000008Ch]
  '005339A1: mov eax, [ecx+18h]
  '005339A4: imul eax, esi
  '005339A7: add eax, edi
  '005339A9: jmp 5339B3h
  '005339AB: call ebx
  '005339AD: mov ecx, [ebp-0000008Ch]
  '005339B3: mov esi, [ecx+0Ch]
  '005339B6: xor edx, edx
  '005339B8: test ecx, ecx
  '005339BA: mov dl, [esi+eax]
  '005339BD: mov [ebp-0000017Ch], edx
  '005339C3: fild dword ptr [ebp-0000017Ch]
  '005339C9: fstp real4 ptr [ebp-0000009Ch]
  '005339CF: jz 533A27h
  '005339D1: cmp word ptr [ecx], 0002h
  '005339D5: jnz 533A27h
  '005339D7: mov edi, [ebp-000000D0h]
  '005339DD: mov edx, [ecx+1Ch]
  '005339E0: mov eax, [ecx+18h]
  '005339E3: add edi, 00000002h
  '005339E6: jo 00534042h
  '005339EC: sub edi, edx
  '005339EE: cmp edi, eax
  '005339F0: jb 5339FAh
  '005339F2: call ebx
  '005339F4: mov ecx, [ebp-0000008Ch]
  '005339FA: mov esi, [ebp-00000094h]
  '00533A00: mov edx, [ecx+14h]
  '00533A03: mov eax, [ecx+10h]
  '00533A06: add esi, 00000001h
  '00533A09: jo 00534042h
  '00533A0F: sub esi, edx
  '00533A11: cmp esi, eax
  '00533A13: jb 533A1Dh
  '00533A15: call ebx
  '00533A17: mov ecx, [ebp-0000008Ch]
  '00533A1D: mov eax, [ecx+18h]
  '00533A20: imul eax, esi
  '00533A23: add eax, edi
  '00533A25: jmp 533A2Fh
  '00533A27: call ebx
  '00533A29: mov ecx, [ebp-0000008Ch]
  '00533A2F: mov esi, [ecx+0Ch]
  '00533A32: xor edx, edx
  '00533A34: test ecx, ecx
  '00533A36: mov dl, [esi+eax]
  '00533A39: mov [ebp-00000180h], edx
  '00533A3F: fild dword ptr [ebp-00000180h]
  '00533A45: fstp real4 ptr [ebp-34h]
  '00533A48: jz 533AA0h
  '00533A4A: cmp word ptr [ecx], 0002h
  '00533A4E: jnz 533AA0h
  '00533A50: mov edi, [ebp-000000D0h]
  '00533A56: mov edx, [ecx+1Ch]
  '00533A59: mov eax, [ecx+18h]
  '00533A5C: add edi, 00000003h
  '00533A5F: jo 00534042h
  '00533A65: sub edi, edx
  '00533A67: cmp edi, eax
  '00533A69: jb 533A73h
  '00533A6B: call ebx
  '00533A6D: mov ecx, [ebp-0000008Ch]
  '00533A73: mov esi, [ebp-00000094h]
  '00533A79: mov edx, [ecx+14h]
  '00533A7C: mov eax, [ecx+10h]
  '00533A7F: add esi, 00000001h
  '00533A82: jo 00534042h
  '00533A88: sub esi, edx
  '00533A8A: cmp esi, eax
  '00533A8C: jb 533A96h
  '00533A8E: call ebx
  '00533A90: mov ecx, [ebp-0000008Ch]
  '00533A96: mov eax, [ecx+18h]
  '00533A99: imul eax, esi
  '00533A9C: add eax, edi
  '00533A9E: jmp 533AA8h
  '00533AA0: call ebx
  '00533AA2: mov ecx, [ebp-0000008Ch]
  '00533AA8: mov esi, [ecx+0Ch]
  '00533AAB: xor edx, edx
  '00533AAD: test ecx, ecx
  '00533AAF: mov dl, [esi+eax]
  '00533AB2: mov [ebp-00000184h], edx
  '00533AB8: fild dword ptr [ebp-00000184h]
  '00533ABE: fstp real4 ptr [ebp-64h]
  '00533AC1: jz 533B19h
  '00533AC3: cmp word ptr [ecx], 0002h
  '00533AC7: jnz 533B19h
  '00533AC9: mov edi, [ebp-000000D0h]
  '00533ACF: mov edx, [ecx+1Ch]
  '00533AD2: mov eax, [ecx+18h]
  '00533AD5: add edi, 00000004h
  '00533AD8: jo 00534042h
  '00533ADE: sub edi, edx
  '00533AE0: cmp edi, eax
  '00533AE2: jb 533AECh
  '00533AE4: call ebx
  '00533AE6: mov ecx, [ebp-0000008Ch]
  '00533AEC: mov esi, [ebp-00000094h]
  '00533AF2: mov edx, [ecx+14h]
  '00533AF5: mov eax, [ecx+10h]
  '00533AF8: add esi, 00000001h
  '00533AFB: jo 00534042h
  '00533B01: sub esi, edx
  '00533B03: cmp esi, eax
  '00533B05: jb 533B0Fh
  '00533B07: call ebx
  '00533B09: mov ecx, [ebp-0000008Ch]
  '00533B0F: mov eax, [ecx+18h]
  '00533B12: imul eax, esi
  '00533B15: add eax, edi
  '00533B17: jmp 533B21h
  '00533B19: call ebx
  '00533B1B: mov ecx, [ebp-0000008Ch]
  '00533B21: mov esi, [ecx+0Ch]
  '00533B24: xor edx, edx
  '00533B26: test ecx, ecx
  '00533B28: mov dl, [esi+eax]
  '00533B2B: mov [ebp-00000188h], edx
  '00533B31: fild dword ptr [ebp-00000188h]
  '00533B37: fstp real4 ptr [ebp-000000C8h]
  '00533B3D: jz 533B95h
  '00533B3F: cmp word ptr [ecx], 0002h
  '00533B43: jnz 533B95h
  '00533B45: mov edi, [ebp-000000D0h]
  '00533B4B: mov edx, [ecx+1Ch]
  '00533B4E: mov eax, [ecx+18h]
  '00533B51: add edi, 00000005h
  '00533B54: jo 00534042h
  '00533B5A: sub edi, edx
  '00533B5C: cmp edi, eax
  '00533B5E: jb 533B68h
  '00533B60: call ebx
  '00533B62: mov ecx, [ebp-0000008Ch]
  '00533B68: mov esi, [ebp-00000094h]
  '00533B6E: mov edx, [ecx+14h]
  '00533B71: mov eax, [ecx+10h]
  '00533B74: add esi, 00000001h
  '00533B77: jo 00534042h
  '00533B7D: sub esi, edx
  '00533B7F: cmp esi, eax
  '00533B81: jb 533B8Bh
  '00533B83: call ebx
  '00533B85: mov ecx, [ebp-0000008Ch]
  '00533B8B: mov eax, [ecx+18h]
  '00533B8E: imul eax, esi
  '00533B91: add eax, edi
  '00533B93: jmp 533B9Dh
  '00533B95: call ebx
  '00533B97: mov ecx, [ebp-0000008Ch]
  '00533B9D: mov ecx, [ecx+0Ch]
  '00533BA0: xor edx, edx
  '00533BA2: mov ebx, [0040135Ch]
  '00533BA8: mov dl, [ecx+eax]
  '00533BAB: mov [ebp-0000018Ch], edx
  '00533BB1: fild dword ptr [ebp-0000018Ch]
  '00533BB7: fstp real4 ptr [ebp-68h]
  '00533BBA: fld real4 ptr [004055F8h]
  '00533BC0: fsub real4 ptr [ebp-000000D8h]
  '00533BC6: fmul real4 ptr [ebp-18h]
  '00533BC9: fld real4 ptr [ebp-000000D8h]
  '00533BCF: fmul real4 ptr [ebp-34h]
  '00533BD2: faddp st(1), st(0)
  '00533BD4: fstsw ax
  '00533BD6: test al, 0Dh
  '00533BD8: jnz 0053403Dh
  '00533BDE: call ebx
  '00533BE0: fld real4 ptr [004055F8h]
  '00533BE6: fsub real4 ptr [ebp-000000D8h]
  '00533BEC: mov [ebp-2Ch], eax
  '00533BEF: fmul real4 ptr [ebp-00000084h]
  '00533BF5: fld real4 ptr [ebp-000000D8h]
  '00533BFB: fmul real4 ptr [ebp-0000009Ch]
  '00533C01: faddp st(1), st(0)
  '00533C03: fstsw ax
  '00533C05: test al, 0Dh
  '00533C07: jnz 0053403Dh
  '00533C0D: call ebx
  '00533C0F: fld real4 ptr [004055F8h]
  '00533C15: fsub real4 ptr [ebp-000000D8h]
  '00533C1B: mov [ebp-00000098h], eax
  '00533C21: fmul real4 ptr [ebp-14h]
  '00533C24: fld real4 ptr [ebp-000000D8h]
  '00533C2A: fmul real4 ptr [ebp-30h]
  '00533C2D: faddp st(1), st(0)
  '00533C2F: fstsw ax
  '00533C31: test al, 0Dh
  '00533C33: jnz 0053403Dh
  '00533C39: call ebx
  '00533C3B: fld real4 ptr [004055F8h]
  '00533C41: fsub real4 ptr [ebp-000000D8h]
  '00533C47: mov [ebp-28h], eax
  '00533C4A: fmul real4 ptr [ebp-20h]
  '00533C4D: fld real4 ptr [ebp-000000D8h]
  '00533C53: fmul real4 ptr [ebp-68h]
  '00533C56: faddp st(1), st(0)
  '00533C58: fstsw ax
  '00533C5A: test al, 0Dh
  '00533C5C: jnz 0053403Dh
  '00533C62: call ebx
  '00533C64: fld real4 ptr [004055F8h]
  '00533C6A: fsub real4 ptr [ebp-000000D8h]
  '00533C70: mov [ebp-60h], eax
  '00533C73: fmul real4 ptr [ebp-00000090h]
  '00533C79: fld real4 ptr [ebp-000000D8h]
  '00533C7F: fmul real4 ptr [ebp-000000C8h]
  '00533C85: faddp st(1), st(0)
  '00533C87: fstsw ax
  '00533C89: test al, 0Dh
  '00533C8B: jnz 0053403Dh
  '00533C91: call ebx
  '00533C93: fld real4 ptr [004055F8h]
  '00533C99: fsub real4 ptr [ebp-000000D8h]
  '00533C9F: mov [ebp-000000C4h], eax
  '00533CA5: fmul real4 ptr [ebp-1Ch]
  '00533CA8: fld real4 ptr [ebp-000000D8h]
  '00533CAE: fmul real4 ptr [ebp-64h]
  '00533CB1: faddp st(1), st(0)
  '00533CB3: fstsw ax
  '00533CB5: test al, 0Dh
  '00533CB7: jnz 0053403Dh
  '00533CBD: call ebx
  '00533CBF: fld real4 ptr [004055F8h]
  '00533CC5: fsub real4 ptr [ebp-24h]
  '00533CC8: mov [ebp-5Ch], eax
  '00533CCB: fstsw ax
  '00533CCD: test al, 0Dh
  '00533CCF: jnz 0053403Dh
  '00533CD5: fild dword ptr [ebp-2Ch]
  '00533CD8: fstp real8 ptr [ebp-00000194h]
  '00533CDE: fmul real8 ptr [ebp-00000194h]
  '00533CE4: fild dword ptr [ebp-60h]
  '00533CE7: fstp real8 ptr [ebp-0000019Ch]
  '00533CED: fld real4 ptr [ebp-24h]
  '00533CF0: fmul real8 ptr [ebp-0000019Ch]
  '00533CF6: faddp st(1), st(0)
  '00533CF8: fstsw ax
  '00533CFA: test al, 0Dh
  '00533CFC: jnz 0053403Dh
  '00533D02: call ebx
  '00533D04: fld real4 ptr [004055F8h]
  '00533D0A: fsub real4 ptr [ebp-24h]
  '00533D0D: mov esi, eax
  '00533D0F: mov [ebp-00000088h], esi
  '00533D15: fstsw ax
  '00533D17: test al, 0Dh
  '00533D19: jnz 0053403Dh
  '00533D1F: fild dword ptr [ebp-00000098h]
  '00533D25: fstp real8 ptr [ebp-000001A4h]
  '00533D2B: fmul real8 ptr [ebp-000001A4h]
  '00533D31: fild dword ptr [ebp-000000C4h]
  '00533D37: fstp real8 ptr [ebp-000001ACh]
  '00533D3D: fld real4 ptr [ebp-24h]
  '00533D40: fmul real8 ptr [ebp-000001ACh]
  '00533D46: faddp st(1), st(0)
  '00533D48: fstsw ax
  '00533D4A: test al, 0Dh
  '00533D4C: jnz 0053403Dh
  '00533D52: call ebx
  '00533D54: fld real4 ptr [004055F8h]
  '00533D5A: fsub real4 ptr [ebp-24h]
  '00533D5D: mov edi, eax
  '00533D5F: mov [ebp-000000D4h], edi
  '00533D65: fstsw ax
  '00533D67: test al, 0Dh
  '00533D69: jnz 0053403Dh
  '00533D6F: fild dword ptr [ebp-28h]
  '00533D72: fstp real8 ptr [ebp-000001B4h]
  '00533D78: fmul real8 ptr [ebp-000001B4h]
  '00533D7E: fild dword ptr [ebp-5Ch]
  '00533D81: fstp real8 ptr [ebp-000001BCh]
  '00533D87: fld real4 ptr [ebp-24h]
  '00533D8A: fmul real8 ptr [ebp-000001BCh]
  '00533D90: faddp st(1), st(0)
  '00533D92: fstsw ax
  '00533D94: test al, 0Dh
  '00533D96: jnz 0053403Dh
  '00533D9C: call ebx
  '00533D9E: mov ebx, eax
  '00533DA0: test esi, esi
  '00533DA2: mov [ebp-80h], ebx
  '00533DA5: jnl 533DAFh
  '00533DA7: xor esi, esi
  '00533DA9: mov [ebp-00000088h], esi
  '00533DAF: mov eax, 000000FFh
  '00533DB4: cmp esi, eax
  '00533DB6: jle 533DBEh
  '00533DB8: mov [ebp-00000088h], eax
  '00533DBE: test edi, edi
  '00533DC0: jnl 533DCAh
  '00533DC2: xor edi, edi
  '00533DC4: mov [ebp-000000D4h], edi
  '00533DCA: cmp edi, eax
  '00533DCC: jle 533DD4h
  '00533DCE: mov [ebp-000000D4h], eax
  '00533DD4: test ebx, ebx
  '00533DD6: jnl 533DDDh
  '00533DD8: xor ebx, ebx
  '00533DDA: mov [ebp-80h], ebx
  '00533DDD: cmp ebx, eax
  '00533DDF: jle 533DE6h
  '00533DE1: mov ebx, eax
  '00533DE3: mov [ebp-80h], ebx
  '00533DE6: mov esi, [ebp-000000E0h]
  '00533DEC: mov eax, [ebp-6Ch]
  '00533DEF: imul esi, 03h
  '00533DF2: jo 00534042h
  '00533DF8: test eax, eax
  '00533DFA: jz 533E4Dh
  '00533DFC: cmp word ptr [eax], 0002h
  '00533E00: jnz 533E4Dh
  '00533E02: mov edi, [eax+1Ch]
  '00533E05: mov edx, [eax+18h]
  '00533E08: mov ecx, esi
  '00533E0A: sub ecx, edi
  '00533E0C: cmp ecx, edx
  '00533E0E: mov [ebp-000000F4h], ecx
  '00533E14: jb 533E1Fh
  '00533E16: call [00401178h]
  '00533E1C: mov eax, [ebp-6Ch]
  '00533E1F: mov ebx, [ebp-000000CCh]
  '00533E25: mov edx, [eax+14h]
  '00533E28: mov ecx, [eax+10h]
  '00533E2B: sub ebx, edx
  '00533E2D: cmp ebx, ecx
  '00533E2F: jb 533E3Ah
  '00533E31: call [00401178h]
  '00533E37: mov eax, [ebp-6Ch]
  '00533E3A: mov edi, [eax+18h]
  '00533E3D: mov eax, [ebp-000000F4h]
  '00533E43: imul edi, ebx
  '00533E46: mov ebx, [ebp-80h]
  '00533E49: add edi, eax
  '00533E4B: jmp 533E55h
  '00533E4D: call [00401178h]
  '00533E53: mov edi, eax
  '00533E55: mov ecx, ebx
  '00533E57: call [00401220h]
  '00533E5D: mov ecx, [ebp-6Ch]
  '00533E60: mov edx, [ecx+0Ch]
  '00533E63: mov [edx+edi], al
  '00533E66: mov eax, [ebp-6Ch]
  '00533E69: test eax, eax
  '00533E6B: jz 533EC8h
  '00533E6D: cmp word ptr [eax], 0002h
  '00533E71: jnz 533EC8h
  '00533E73: mov edx, [eax+1Ch]
  '00533E76: mov ecx, [eax+18h]
  '00533E79: mov edi, esi
  '00533E7B: add edi, 00000001h
  '00533E7E: jo 00534042h
  '00533E84: sub edi, edx
  '00533E86: cmp edi, ecx
  '00533E88: jb 533E93h
  '00533E8A: call [00401178h]
  '00533E90: mov eax, [ebp-6Ch]
  '00533E93: mov ecx, [ebp-000000CCh]
  '00533E99: mov ebx, [eax+14h]
  '00533E9C: mov edx, [eax+10h]
  '00533E9F: sub ecx, ebx
  '00533EA1: cmp ecx, edx
  '00533EA3: mov [ebp-000000F0h], ecx
  '00533EA9: jb 533EB4h
  '00533EAB: call [00401178h]
  '00533EB1: mov eax, [ebp-6Ch]
  '00533EB4: mov ebx, [eax+18h]
  '00533EB7: imul ebx, [ebp-000000F0h]
  '00533EBE: add ebx, edi
  '00533EC0: mov edi, [00401178h]
  '00533EC6: jmp 533ED2h
  '00533EC8: mov edi, [00401178h]
  '00533ECE: call edi
  '00533ED0: mov ebx, eax
  '00533ED2: mov ecx, [ebp-000000D4h]
  '00533ED8: call [00401220h]
  '00533EDE: mov ecx, [ebp-6Ch]
  '00533EE1: mov edx, [ecx+0Ch]
  '00533EE4: mov [edx+ebx], al
  '00533EE7: mov eax, [ebp-6Ch]
  '00533EEA: test eax, eax
  '00533EEC: jz 533F2Fh
  '00533EEE: cmp word ptr [eax], 0002h
  '00533EF2: jnz 533F2Fh
  '00533EF4: mov edx, [eax+1Ch]
  '00533EF7: mov ecx, [eax+18h]
  '00533EFA: add esi, 00000002h
  '00533EFD: jo 00534042h
  '00533F03: sub esi, edx
  '00533F05: cmp esi, ecx
  '00533F07: jb 533F0Eh
  '00533F09: call edi
  '00533F0B: mov eax, [ebp-6Ch]
  '00533F0E: mov ebx, [ebp-000000CCh]
  '00533F14: mov edx, [eax+14h]
  '00533F17: mov ecx, [eax+10h]
  '00533F1A: sub ebx, edx
  '00533F1C: cmp ebx, ecx
  '00533F1E: jb 533F25h
  '00533F20: call edi
  '00533F22: mov eax, [ebp-6Ch]
  '00533F25: mov edi, [eax+18h]
  '00533F28: imul edi, ebx
  '00533F2B: add edi, esi
  '00533F2D: jmp 533F37h
  '00533F2F: call [00401178h]
  '00533F35: mov edi, eax
  '00533F37: mov ecx, [ebp-00000088h]
  '00533F3D: call [00401220h]
  '00533F43: mov ecx, [ebp-6Ch]
  '00533F46: mov esi, [00401384h]
  '00533F4C: mov ebx, [ebp-00000108h]
  '00533F52: mov edx, [ecx+0Ch]
  '00533F55: mov ecx, [ebp-000000E0h]
  '00533F5B: mov [edx+edi], al
  '00533F5E: mov edi, [ebp-38h]
  '00533F61: mov eax, 00000001h
  '00533F66: add eax, ecx
  '00533F68: jo 00534042h
  '00533F6E: mov [ebp-000000E0h], eax
  '00533F74: jmp 005335C1h
  '00533F79: mov ecx, [ebp-000000CCh]
  '00533F7F: mov eax, 00000001h
  '00533F84: add eax, ecx
  '00533F86: jo 00534042h
  '00533F8C: mov [ebp-000000CCh], eax
  '00533F92: jmp 00533559h
  '00533F97: lea eax, [ebp-0000008Ch]
  '00533F9D: push eax
  '00533F9E: call 0042C914h
  '00533FA3: mov esi, [0040109Ch]
  '00533FA9: mov [ebp-000000E4h], eax
  '00533FAF: call esi
  '00533FB1: mov edx, [ebp-000000E4h]
  '00533FB7: lea ecx, [ebp-000000E8h]
  '00533FBD: push 00000004h
  '00533FBF: xor edi, edi
  '00533FC1: push ecx
  '00533FC2: push edx
  '00533FC3: mov [ebp-000000E8h], edi
  '00533FC9: call 0041D584h
  '00533FCE: call esi
  '00533FD0: lea eax, [ebp-6Ch]
  '00533FD3: push eax
  '00533FD4: call 0042C914h
  '00533FD9: mov [ebp-000000E4h], eax
  '00533FDF: call esi
  '00533FE1: mov edx, [ebp-000000E4h]
  '00533FE7: lea ecx, [ebp-000000E8h]
  '00533FED: push 00000004h
  '00533FEF: push ecx
  '00533FF0: push edx
  '00533FF1: mov [ebp-000000E8h], edi
  '00533FF7: call 0041D584h
  '00533FFC: call esi
  '00533FFE: wait 
  '00533FFF: push 0053401Eh
  '00534004: mov esi, [004010B8h]
  '0053400A: lea eax, [ebp-6Ch]
  '0053400D: push eax
  '0053400E: push 00000000h
  '00534010: call esi
  '00534012: lea ecx, [ebp-0000008Ch]
  '00534018: push ecx
  '00534019: push 00000000h
  '0053401B: call esi
  '0053401D: ret 
End Sub
Private Sub unknown_534050
  '00534050: push ebp
  '00534051: mov ebp, esp
  '00534053: sub esp, 0000000Ch
  '00534056: push 004081B6h
  '0053405B: mov eax, fs:[00h]
  '00534061: push eax
  '00534062: mov fs:[00000000h], esp
  '00534069: sub esp, 0000000Ch
  '0053406C: push ebx
  '0053406D: push esi
  '0053406E: push edi
  '0053406F: mov [ebp-0Ch], esp
  '00534072: mov [ebp-08h], 00407A98h
  '00534079: mov esi, [ebp+08h]
  '0053407C: mov eax, esi
  '0053407E: and eax, 00000001h
  '00534081: mov [ebp-04h], eax
  '00534084: and esi, FFFFFFFEh
  '00534087: push esi
  '00534088: mov [ebp+08h], esi
  '0053408B: mov ecx, [esi]
  '0053408D: call [ecx+04h]
  '00534090: mov edx, [esi]
  '00534092: push esi
  '00534093: call [edx+68h]
  '00534096: test eax, eax
  '00534098: jnl 5340A9h
  '0053409A: push 00000068h
  '0053409C: push 0042C8ECh
  '005340A1: push esi
  '005340A2: push eax
  '005340A3: call [004010A0h]
  '005340A9: mov [ebp-04h], 00000000h
  '005340B0: mov eax, [ebp+08h]
  '005340B3: push eax
  '005340B4: mov ecx, [eax]
  '005340B6: call [ecx+08h]
  '005340B9: mov eax, [ebp-04h]
  '005340BC: mov ecx, [ebp-14h]
  '005340BF: pop edi
  '005340C0: pop esi
  '005340C1: mov fs:[00000000h], ecx
  '005340C8: pop ebx
  '005340C9: mov esp, ebp
  '005340CB: pop ebp
  '005340CC: retn 0004h
End Sub

