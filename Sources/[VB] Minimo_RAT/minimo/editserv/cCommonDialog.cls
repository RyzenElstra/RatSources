 'VA: 4132B8
Const cdata_0 = "(L"
 'VA: 4132E0
Const cdata_1 = &H3C0010

Private Sub unknown_4943B0
  '004943B0: push ebp
  '004943B1: mov ebp, esp
  '004943B3: sub esp, 0000000Ch
  '004943B6: push 00403796h
  '004943BB: mov eax, fs:[00h]
  '004943C1: push eax
  '004943C2: mov fs:[00000000h], esp
  '004943C9: sub esp, 0000000Ch
  '004943CC: push ebx
  '004943CD: push esi
  '004943CE: push edi
  '004943CF: mov [ebp-0Ch], esp
  '004943D2: mov [ebp-08h], 00402D40h
  '004943D9: xor edi, edi
  '004943DB: mov [ebp-04h], edi
  '004943DE: mov esi, [ebp+08h]
  '004943E1: push esi
  '004943E2: mov eax, [esi]
  '004943E4: call [eax+04h]
  '004943E7: mov ecx, [esi+54h]
  '004943EA: mov [ebp-18h], edi
  '004943ED: mov [ebp-18h], ecx
  '004943F0: mov eax, [ebp+08h]
  '004943F3: push eax
  '004943F4: mov edx, [eax]
  '004943F6: call [edx+08h]
  '004943F9: mov eax, [ebp+0Ch]
  '004943FC: mov ecx, [ebp-18h]
  '004943FF: mov [eax], ecx
  '00494401: mov eax, [ebp-04h]
  '00494404: mov ecx, [ebp-14h]
  '00494407: pop edi
  '00494408: pop esi
  '00494409: mov fs:[00000000h], ecx
  '00494410: pop ebx
  '00494411: mov esp, ebp
  '00494413: pop ebp
  '00494414: retn 0008h
End Sub
Private Sub unknown_494420
  '00494420: push ebp
  '00494421: mov ebp, esp
  '00494423: sub esp, 0000000Ch
  '00494426: push 00403796h
  '0049442B: mov eax, fs:[00h]
  '00494431: push eax
  '00494432: mov fs:[00000000h], esp
  '00494439: sub esp, 0000000Ch
  '0049443C: push ebx
  '0049443D: push esi
  '0049443E: push edi
  '0049443F: mov [ebp-0Ch], esp
  '00494442: mov [ebp-08h], 00402D48h
  '00494449: xor edi, edi
  '0049444B: mov [ebp-04h], edi
  '0049444E: mov esi, [ebp+08h]
  '00494451: push esi
  '00494452: mov eax, [esi]
  '00494454: call [eax+04h]
  '00494457: mov ecx, [esi+58h]
  '0049445A: mov [ebp-18h], edi
  '0049445D: mov [ebp-18h], ecx
  '00494460: mov eax, [ebp+08h]
  '00494463: push eax
  '00494464: mov edx, [eax]
  '00494466: call [edx+08h]
  '00494469: mov eax, [ebp+0Ch]
  '0049446C: mov ecx, [ebp-18h]
  '0049446F: mov [eax], ecx
  '00494471: mov eax, [ebp-04h]
  '00494474: mov ecx, [ebp-14h]
  '00494477: pop edi
  '00494478: pop esi
  '00494479: mov fs:[00000000h], ecx
  '00494480: pop ebx
  '00494481: mov esp, ebp
  '00494483: pop ebp
  '00494484: retn 0008h
End Sub
Private Sub unknown_494490
  '00494490: push ebp
  '00494491: mov ebp, esp
  '00494493: sub esp, 0000000Ch
  '00494496: push 00403796h
  '0049449B: mov eax, fs:[00h]
  '004944A1: push eax
  '004944A2: mov fs:[00000000h], esp
  '004944A9: sub esp, 000000FCh
  '004944AF: push ebx
  '004944B0: push esi
  '004944B1: push edi
  '004944B2: mov [ebp-0Ch], esp
  '004944B5: mov [ebp-08h], 00402D50h
  '004944BC: xor esi, esi
  '004944BE: mov [ebp-04h], esi
  '004944C1: mov ebx, [ebp+08h]
  '004944C4: push ebx
  '004944C5: mov eax, [ebx]
  '004944C7: call [eax+04h]
  '004944CA: mov ecx, 00000013h
  '004944CF: xor eax, eax
  '004944D1: lea edi, [ebp-68h]
  '004944D4: mov [ebx+54h], esi
  '004944D7: rep stosd 
  '004944D9: mov ecx, 00000013h
  '004944DE: lea edi, [ebp-000000ECh]
  '004944E4: rep stosd 
  '004944E6: mov ecx, [ebp+14h]
  '004944E9: mov [ebx+58h], esi
  '004944EC: mov eax, [ebp+18h]
  '004944EF: mov [ebp-1Ch], esi
  '004944F2: movsx edx, word ptr [ecx]
  '004944F5: imul edx, FFFFF000h
  '004944FB: movsx ecx, word ptr [eax]
  '004944FE: jo 00494984h
  '00494504: imul ecx, FFFFFE00h
  '0049450A: mov eax, [ebp+1Ch]
  '0049450D: mov [ebp-6Ch], esi
  '00494510: jo 00494984h
  '00494516: or edx, ecx
  '00494518: mov [ebp-74h], esi
  '0049451B: movsx ecx, word ptr [eax]
  '0049451E: mov eax, [ebp+20h]
  '00494521: mov [ebp-78h], esi
  '00494524: neg ecx
  '00494526: jo 00494984h
  '0049452C: or edx, ecx
  '0049452E: mov [ebp-00000088h], esi
  '00494534: movsx ecx, word ptr [eax]
  '00494537: imul ecx, FCh
  '0049453A: mov eax, [ebp+3Ch]
  '0049453D: lea edi, [ebp-68h]
  '00494540: jo 00494984h
  '00494546: or edx, ecx
  '00494548: mov ecx, [eax]
  '0049454A: and ecx, FFFFFF9Fh
  '0049454D: mov [ebp-68h], 0000004Ch
  '00494554: or edx, ecx
  '00494556: mov [ebp-34h], edx
  '00494559: mov edx, [ebp+38h]
  '0049455C: mov eax, [edx]
  '0049455E: cmp eax, FFFFFFFFh
  '00494561: jz 494566h
  '00494563: mov [ebp-64h], eax
  '00494566: mov eax, [ebp+2Ch]
  '00494569: mov esi, [004012C4h]
  '0049456F: lea ecx, [ebp-3Ch]
  '00494572: mov edx, [eax]
  '00494574: call esi
  '00494576: mov ecx, [ebp+34h]
  '00494579: mov edx, [ecx]
  '0049457B: lea ecx, [ebp-2Ch]
  '0049457E: call esi
  '00494580: mov edx, [ebp+30h]
  '00494583: lea ecx, [ebp-38h]
  '00494586: mov edx, [edx]
  '00494588: call esi
  '0049458A: mov eax, [ebp+24h]
  '0049458D: mov ecx, [eax]
  '0049458F: push ecx
  '00494590: call [0040103Ch]
  '00494596: mov ecx, eax
  '00494598: call [0040119Ch]
  '0049459E: mov esi, [00401348h]
  '004945A4: mov [ebp-000000F4h], eax
  '004945AA: mov eax, 00000001h
  '004945AF: mov [ebp-18h], eax
  '004945B2: cmp ax, [ebp-000000F4h]
  '004945B9: jnle 0049466Eh
  '004945BF: mov ecx, [ebp+24h]
  '004945C2: lea edx, [ebp-00000088h]
  '004945C8: movsx eax, ax
  '004945CB: push edx
  '004945CC: mov edx, [ecx]
  '004945CE: push eax
  '004945CF: push edx
  '004945D0: mov [ebp-80h], 00000001h
  '004945D7: mov [ebp-00000088h], 00000002h
  '004945E1: call [00401138h]
  '004945E7: mov edx, eax
  '004945E9: lea ecx, [ebp-6Ch]
  '004945EC: call esi
  '004945EE: lea ecx, [ebp-00000088h]
  '004945F4: call [00401034h]
  '004945FA: mov eax, [ebp-6Ch]
  '004945FD: mov ebx, [00401184h]
  '00494603: push eax
  '00494604: push 0041D7FCh
  '00494609: call ebx
  '0049460B: mov ecx, [ebp-6Ch]
  '0049460E: mov edx, eax
  '00494610: neg edx
  '00494612: sbb edx, edx
  '00494614: push ecx
  '00494615: neg edx
  '00494617: push 0041CE70h
  '0049461C: mov [ebp-00000110h], edx
  '00494622: call ebx
  '00494624: mov edx, [ebp-00000110h]
  '0049462A: neg eax
  '0049462C: sbb eax, eax
  '0049462E: neg eax
  '00494630: test edx, eax
  '00494632: jnz 49463Fh
  '00494634: mov eax, [ebp-1Ch]
  '00494637: push eax
  '00494638: push 00421BACh
  '0049463D: jmp 494647h
  '0049463F: mov ecx, [ebp-1Ch]
  '00494642: mov edx, [ebp-6Ch]
  '00494645: push ecx
  '00494646: push edx
  '00494647: call [00401094h]
  '0049464D: mov edx, eax
  '0049464F: lea ecx, [ebp-1Ch]
  '00494652: call esi
  '00494654: mov ebx, [ebp+08h]
  '00494657: mov eax, 00000001h
  '0049465C: add ax, [ebp-18h]
  '00494660: jo 00494984h
  '00494666: mov [ebp-18h], eax
  '00494669: jmp 004945B2h
  '0049466E: mov eax, [ebp-1Ch]
  '00494671: push eax
  '00494672: push 00421BACh
  '00494677: call [00401094h]
  '0049467D: mov edx, eax
  '0049467F: lea ecx, [ebp-78h]
  '00494682: call esi
  '00494684: push eax
  '00494685: push 00421BACh
  '0049468A: call [00401094h]
  '00494690: mov edx, eax
  '00494692: lea ecx, [ebp-1Ch]
  '00494695: call esi
  '00494697: lea ecx, [ebp-78h]
  '0049469A: call [0040138Ch]
  '004946A0: mov edx, [ebp-1Ch]
  '004946A3: lea ecx, [edi+0Ch]
  '004946A6: call [004012C4h]
  '004946AC: mov ecx, [ebp+28h]
  '004946AF: mov eax, [ebp+0Ch]
  '004946B2: mov [ebp-80h], 00000000h
  '004946B9: mov [ebp-00000088h], 00000002h
  '004946C3: mov edx, [ecx]
  '004946C5: mov eax, [eax]
  '004946C7: lea ecx, [ebp-00000088h]
  '004946CD: push eax
  '004946CE: push ecx
  '004946CF: push eax
  '004946D0: mov [edi+18h], edx
  '004946D3: call [0040103Ch]
  '004946D9: mov edx, 00000104h
  '004946DE: sub edx, eax
  '004946E0: jo 00494984h
  '004946E6: push edx
  '004946E7: call [0040122Ch]
  '004946ED: mov edx, eax
  '004946EF: lea ecx, [ebp-78h]
  '004946F2: call esi
  '004946F4: push eax
  '004946F5: call [00401094h]
  '004946FB: mov edx, eax
  '004946FD: lea ecx, [ebp-1Ch]
  '00494700: call esi
  '00494702: lea ecx, [ebp-78h]
  '00494705: call [0040138Ch]
  '0049470B: lea ecx, [ebp-00000088h]
  '00494711: call [00401034h]
  '00494717: mov edx, [ebp-1Ch]
  '0049471A: lea ecx, [edi+1Ch]
  '0049471D: call [004012C4h]
  '00494723: mov eax, [ebp+10h]
  '00494726: lea ecx, [ebp-00000088h]
  '0049472C: mov [edi+20h], 00000104h
  '00494733: mov [ebp-80h], 00000000h
  '0049473A: mov eax, [eax]
  '0049473C: mov [ebp-00000088h], 00000002h
  '00494746: push eax
  '00494747: push ecx
  '00494748: push eax
  '00494749: call [0040103Ch]
  '0049474F: mov edx, 00000104h
  '00494754: sub edx, eax
  '00494756: jo 00494984h
  '0049475C: push edx
  '0049475D: call [0040122Ch]
  '00494763: mov edx, eax
  '00494765: lea ecx, [ebp-78h]
  '00494768: call esi
  '0049476A: push eax
  '0049476B: call [00401094h]
  '00494771: mov edx, eax
  '00494773: lea ecx, [ebp-1Ch]
  '00494776: call esi
  '00494778: lea ecx, [ebp-78h]
  '0049477B: call [0040138Ch]
  '00494781: lea ecx, [ebp-00000088h]
  '00494787: call [00401034h]
  '0049478D: mov edx, [ebp-1Ch]
  '00494790: lea ecx, [edi+24h]
  '00494793: call [004012C4h]
  '00494799: mov [edi+28h], 00000104h
  '004947A0: lea eax, [ebp-68h]
  '004947A3: lea ecx, [ebp-000000ECh]
  '004947A9: push eax
  '004947AA: push ecx
  '004947AB: push 004132B8h
  '004947B0: call [004011E8h]
  '004947B6: push eax
  '004947B7: call 00413678h
  '004947BC: mov [ebp-0000009Ch], eax
  '004947C2: call [004010A4h]
  '004947C8: lea edx, [ebp-000000ECh]
  '004947CE: lea eax, [ebp-68h]
  '004947D1: push edx
  '004947D2: push eax
  '004947D3: push 004132B8h
  '004947D8: call [0040107Ch]
  '004947DE: mov ecx, [ebp-0000009Ch]
  '004947E4: lea edx, [ebp-000000ECh]
  '004947EA: push edx
  '004947EB: push 004132B8h
  '004947F0: mov [ebx+54h], ecx
  '004947F3: call [00401328h]
  '004947F9: mov eax, [ebx+54h]
  '004947FC: sub eax, 00000000h
  '004947FF: jz 004948CFh
  '00494805: dec eax
  '00494806: jz 494850h
  '00494808: call 004138DCh
  '0049480D: mov esi, eax
  '0049480F: call [004010A4h]
  '00494815: mov ecx, [ebp+0Ch]
  '00494818: mov [ebx+58h], esi
  '0049481B: mov esi, [004012C4h]
  '00494821: mov edx, 0040FE84h
  '00494826: mov [ebp-74h], 00000000h
  '0049482D: call esi
  '0049482F: mov ecx, [ebp+10h]
  '00494832: mov edx, 0040FE84h
  '00494837: call esi
  '00494839: mov eax, [ebp+3Ch]
  '0049483C: mov ecx, [ebp+28h]
  '0049483F: mov [eax], 00000000h
  '00494845: mov [ecx], FFFFFFFFh
  '0049484B: jmp 00494902h
  '00494850: mov edx, [ebx]
  '00494852: lea eax, [ebp-78h]
  '00494855: push eax
  '00494856: lea eax, [edi+1Ch]
  '00494859: push eax
  '0049485A: push ebx
  '0049485B: mov [ebp-74h], FFFFFFFFh
  '00494862: call [edx+48h]
  '00494865: mov edx, [ebp-78h]
  '00494868: mov ecx, [ebp+0Ch]
  '0049486B: mov [ebp-78h], 00000000h
  '00494872: call esi
  '00494874: mov ecx, [ebx]
  '00494876: lea edx, [ebp-78h]
  '00494879: lea eax, [edi+24h]
  '0049487C: push edx
  '0049487D: push eax
  '0049487E: push ebx
  '0049487F: call [ecx+48h]
  '00494882: mov edx, [ebp-78h]
  '00494885: mov ecx, [ebp+10h]
  '00494888: mov [ebp-78h], 00000000h
  '0049488F: call esi
  '00494891: mov ecx, [ebp+3Ch]
  '00494894: mov eax, [edi+34h]
  '00494897: mov edx, [ebp+28h]
  '0049489A: mov [ecx], eax
  '0049489C: mov eax, [edi+18h]
  '0049489F: mov [edx], eax
  '004948A1: mov ecx, [ebx]
  '004948A3: lea edx, [ebp-78h]
  '004948A6: push edx
  '004948A7: push eax
  '004948A8: mov eax, [edi+0Ch]
  '004948AB: push eax
  '004948AC: push ebx
  '004948AD: call [ecx+4Ch]
  '004948B0: mov edx, [ebp-78h]
  '004948B3: mov ecx, [ebp+24h]
  '004948B6: mov [ebp-78h], 00000000h
  '004948BD: call esi
  '004948BF: test byte ptr [edi+34h], 01h
  '004948C3: jz 49490Ch
  '004948C5: mov ecx, [ebp+1Ch]
  '004948C8: mov word ptr [ecx], FFFFh
  '004948CD: jmp 49490Ch
  '004948CF: mov ecx, [ebp+0Ch]
  '004948D2: mov esi, [004012C4h]
  '004948D8: mov edx, 0040FE84h
  '004948DD: mov [ebp-74h], 00000000h
  '004948E4: call esi
  '004948E6: mov ecx, [ebp+10h]
  '004948E9: mov edx, 0040FE84h
  '004948EE: call esi
  '004948F0: mov edx, [ebp+3Ch]
  '004948F3: mov eax, [ebp+28h]
  '004948F6: mov [edx], 00000000h
  '004948FC: mov [eax], FFFFFFFFh
  '00494902: mov ecx, [ebp+24h]
  '00494905: mov edx, 0040FE84h
  '0049490A: call esi
  '0049490C: push 0049495Bh
  '00494911: jmp 494929h
  '00494913: lea ecx, [ebp-78h]
  '00494916: call [0040138Ch]
  '0049491C: lea ecx, [ebp-00000088h]
  '00494922: call [00401034h]
  '00494928: ret 
End Sub
Private Sub unknown_494A50
  '00494A50: push ebp
  '00494A51: mov ebp, esp
  '00494A53: sub esp, 0000000Ch
  '00494A56: push 00403796h
  '00494A5B: mov eax, fs:[00h]
  '00494A61: push eax
  '00494A62: mov fs:[00000000h], esp
  '00494A69: sub esp, 000000FCh
  '00494A6F: push ebx
  '00494A70: push esi
  '00494A71: push edi
  '00494A72: mov [ebp-0Ch], esp
  '00494A75: mov [ebp-08h], 00402D70h
  '00494A7C: xor esi, esi
  '00494A7E: mov [ebp-04h], esi
  '00494A81: mov ebx, [ebp+08h]
  '00494A84: push ebx
  '00494A85: mov eax, [ebx]
  '00494A87: call [eax+04h]
  '00494A8A: mov ecx, 00000013h
  '00494A8F: xor eax, eax
  '00494A91: lea edi, [ebp-68h]
  '00494A94: mov [ebx+54h], esi
  '00494A97: rep stosd 
  '00494A99: mov ecx, 00000013h
  '00494A9E: lea edi, [ebp-000000E8h]
  '00494AA4: rep stosd 
  '00494AA6: mov ecx, [ebp+14h]
  '00494AA9: mov [ebx+58h], esi
  '00494AAC: mov eax, [ebp+30h]
  '00494AAF: mov [ebp-1Ch], esi
  '00494AB2: movsx edx, word ptr [ecx]
  '00494AB5: imul edx, FEh
  '00494AB8: mov ecx, [eax]
  '00494ABA: mov [ebp-6Ch], esi
  '00494ABD: jo 00494EFBh
  '00494AC3: and ecx, FFFFFF9Fh
  '00494AC6: mov [ebp-70h], esi
  '00494AC9: or edx, ecx
  '00494ACB: mov [ebp-74h], esi
  '00494ACE: or edx, 00000004h
  '00494AD1: mov [ebp-00000084h], esi
  '00494AD7: mov [ebp-34h], edx
  '00494ADA: mov edx, [ebp+2Ch]
  '00494ADD: mov [ebp-68h], 0000004Ch
  '00494AE4: mov eax, [edx]
  '00494AE6: cmp eax, FFFFFFFFh
  '00494AE9: jz 494AEEh
  '00494AEB: mov [ebp-64h], eax
  '00494AEE: mov eax, [ebp+20h]
  '00494AF1: mov esi, [004012C4h]
  '00494AF7: lea ecx, [ebp-3Ch]
  '00494AFA: mov edx, [eax]
  '00494AFC: call esi
  '00494AFE: mov ecx, [ebp+28h]
  '00494B01: mov edx, [ecx]
  '00494B03: lea ecx, [ebp-2Ch]
  '00494B06: call esi
  '00494B08: mov edx, [ebp+24h]
  '00494B0B: lea ecx, [ebp-38h]
  '00494B0E: mov edx, [edx]
  '00494B10: call esi
  '00494B12: mov eax, [ebp+18h]
  '00494B15: mov ecx, [eax]
  '00494B17: push ecx
  '00494B18: call [0040103Ch]
  '00494B1E: mov ecx, eax
  '00494B20: call [0040119Ch]
  '00494B26: mov esi, [00401348h]
  '00494B2C: mov [ebp-000000F0h], eax
  '00494B32: mov eax, 00000001h
  '00494B37: mov [ebp-18h], eax
  '00494B3A: cmp ax, [ebp-000000F0h]
  '00494B41: mov edi, [00401184h]
  '00494B47: jnle 00494BF3h
  '00494B4D: mov ecx, [ebp+18h]
  '00494B50: lea edx, [ebp-00000084h]
  '00494B56: movsx eax, ax
  '00494B59: push edx
  '00494B5A: mov edx, [ecx]
  '00494B5C: push eax
  '00494B5D: push edx
  '00494B5E: mov [ebp-7Ch], 00000001h
  '00494B65: mov [ebp-00000084h], 00000002h
  '00494B6F: call [00401138h]
  '00494B75: mov edx, eax
  '00494B77: lea ecx, [ebp-6Ch]
  '00494B7A: call esi
  '00494B7C: lea ecx, [ebp-00000084h]
  '00494B82: call [00401034h]
  '00494B88: mov eax, [ebp-6Ch]
  '00494B8B: push eax
  '00494B8C: push 0041D7FCh
  '00494B91: call edi
  '00494B93: mov ecx, [ebp-6Ch]
  '00494B96: mov edx, eax
  '00494B98: neg edx
  '00494B9A: sbb edx, edx
  '00494B9C: push ecx
  '00494B9D: neg edx
  '00494B9F: push 0041CE70h
  '00494BA4: mov [ebp-0000010Ch], edx
  '00494BAA: call edi
  '00494BAC: mov edx, [ebp-0000010Ch]
  '00494BB2: neg eax
  '00494BB4: sbb eax, eax
  '00494BB6: neg eax
  '00494BB8: test edx, eax
  '00494BBA: jnz 494BC7h
  '00494BBC: mov eax, [ebp-1Ch]
  '00494BBF: push eax
  '00494BC0: push 00421BACh
  '00494BC5: jmp 494BCFh
  '00494BC7: mov ecx, [ebp-1Ch]
  '00494BCA: mov edx, [ebp-6Ch]
  '00494BCD: push ecx
  '00494BCE: push edx
  '00494BCF: call [00401094h]
  '00494BD5: mov edx, eax
  '00494BD7: lea ecx, [ebp-1Ch]
  '00494BDA: call esi
  '00494BDC: mov eax, 00000001h
  '00494BE1: add ax, [ebp-18h]
  '00494BE5: jo 00494EFBh
  '00494BEB: mov [ebp-18h], eax
  '00494BEE: jmp 00494B3Ah
  '00494BF3: mov eax, [ebp-1Ch]
  '00494BF6: mov edi, [00401094h]
  '00494BFC: push eax
  '00494BFD: push 00421BACh
  '00494C02: call edi
  '00494C04: mov edx, eax
  '00494C06: lea ecx, [ebp-74h]
  '00494C09: call esi
  '00494C0B: push eax
  '00494C0C: push 00421BACh
  '00494C11: call edi
  '00494C13: mov edx, eax
  '00494C15: lea ecx, [ebp-1Ch]
  '00494C18: call esi
  '00494C1A: lea ecx, [ebp-74h]
  '00494C1D: call [0040138Ch]
  '00494C23: mov edx, [ebp-1Ch]
  '00494C26: lea edi, [ebp-68h]
  '00494C29: lea ecx, [edi+0Ch]
  '00494C2C: mov [ebp-00000110h], ecx
  '00494C32: call [004012C4h]
  '00494C38: mov ecx, [ebp+1Ch]
  '00494C3B: mov eax, [ebp+0Ch]
  '00494C3E: mov [ebp-7Ch], 00000000h
  '00494C45: mov [ebp-00000084h], 00000002h
  '00494C4F: mov edx, [ecx]
  '00494C51: mov eax, [eax]
  '00494C53: lea ecx, [ebp-00000084h]
  '00494C59: push eax
  '00494C5A: push ecx
  '00494C5B: push eax
  '00494C5C: mov [edi+18h], edx
  '00494C5F: call [0040103Ch]
  '00494C65: mov edx, 00000104h
  '00494C6A: sub edx, eax
  '00494C6C: jo 00494EFBh
  '00494C72: push edx
  '00494C73: call [0040122Ch]
  '00494C79: mov edx, eax
  '00494C7B: lea ecx, [ebp-74h]
  '00494C7E: call esi
  '00494C80: push eax
  '00494C81: call [00401094h]
  '00494C87: mov edx, eax
  '00494C89: lea ecx, [ebp-1Ch]
  '00494C8C: call esi
  '00494C8E: lea ecx, [ebp-74h]
  '00494C91: call [0040138Ch]
  '00494C97: lea ecx, [ebp-00000084h]
  '00494C9D: call [00401034h]
  '00494CA3: mov edx, [ebp-1Ch]
  '00494CA6: lea ecx, [edi+1Ch]
  '00494CA9: call [004012C4h]
  '00494CAF: mov eax, [ebp+10h]
  '00494CB2: lea ecx, [ebp-00000084h]
  '00494CB8: mov [edi+20h], 00000104h
  '00494CBF: mov [ebp-7Ch], 00000000h
  '00494CC6: mov eax, [eax]
  '00494CC8: mov [ebp-00000084h], 00000002h
  '00494CD2: push eax
  '00494CD3: push ecx
  '00494CD4: push eax
  '00494CD5: call [0040103Ch]
  '00494CDB: mov edx, 00000104h
  '00494CE0: sub edx, eax
  '00494CE2: jo 00494EFBh
  '00494CE8: push edx
  '00494CE9: call [0040122Ch]
  '00494CEF: mov edx, eax
  '00494CF1: lea ecx, [ebp-74h]
  '00494CF4: call esi
  '00494CF6: push eax
  '00494CF7: call [00401094h]
  '00494CFD: mov edx, eax
  '00494CFF: lea ecx, [ebp-1Ch]
  '00494D02: call esi
  '00494D04: lea ecx, [ebp-74h]
  '00494D07: call [0040138Ch]
  '00494D0D: lea ecx, [ebp-00000084h]
  '00494D13: call [00401034h]
  '00494D19: lea ecx, [edi+24h]
  '00494D1C: mov edx, [ebp-1Ch]
  '00494D1F: call [004012C4h]
  '00494D25: lea eax, [ebp-68h]
  '00494D28: lea ecx, [ebp-000000E8h]
  '00494D2E: push eax
  '00494D2F: push ecx
  '00494D30: push 004132B8h
  '00494D35: mov [edi+28h], 00000104h
  '00494D3C: call [004011E8h]
  '00494D42: push eax
  '00494D43: call 004136C4h
  '00494D48: mov [ebp-00000098h], eax
  '00494D4E: call [004010A4h]
  '00494D54: lea edx, [ebp-000000E8h]
  '00494D5A: lea eax, [ebp-68h]
  '00494D5D: push edx
  '00494D5E: push eax
  '00494D5F: push 004132B8h
  '00494D64: call [0040107Ch]
  '00494D6A: mov ecx, [ebp-00000098h]
  '00494D70: lea edx, [ebp-000000E8h]
  '00494D76: push edx
  '00494D77: push 004132B8h
  '00494D7C: mov [ebx+54h], ecx
  '00494D7F: call [00401328h]
  '00494D85: mov eax, [ebx+54h]
  '00494D88: xor ecx, ecx
  '00494D8A: sub eax, ecx
  '00494D8C: jz 00494E4Ah
  '00494D92: dec eax
  '00494D93: jz 494DD9h
  '00494D95: mov [ebp-70h], ecx
  '00494D98: call 004138DCh
  '00494D9D: mov esi, eax
  '00494D9F: call [004010A4h]
  '00494DA5: mov ecx, [ebp+0Ch]
  '00494DA8: mov [ebx+58h], esi
  '00494DAB: mov esi, [004012C4h]
  '00494DB1: mov edx, 0040FE84h
  '00494DB6: call esi
  '00494DB8: mov ecx, [ebp+10h]
  '00494DBB: mov edx, 0040FE84h
  '00494DC0: call esi
  '00494DC2: mov eax, [ebp+30h]
  '00494DC5: mov ecx, [ebp+1Ch]
  '00494DC8: mov [eax], 00000000h
  '00494DCE: mov [ecx], 00000000h
  '00494DD4: jmp 00494E79h
  '00494DD9: mov edx, [ebx]
  '00494DDB: lea eax, [ebp-74h]
  '00494DDE: push eax
  '00494DDF: lea eax, [edi+1Ch]
  '00494DE2: push eax
  '00494DE3: push ebx
  '00494DE4: mov [ebp-70h], FFFFFFFFh
  '00494DEB: call [edx+48h]
  '00494DEE: mov edx, [ebp-74h]
  '00494DF1: mov ecx, [ebp+0Ch]
  '00494DF4: mov [ebp-74h], 00000000h
  '00494DFB: call esi
  '00494DFD: mov ecx, [ebx]
  '00494DFF: lea edx, [ebp-74h]
  '00494E02: lea eax, [edi+24h]
  '00494E05: push edx
  '00494E06: push eax
  '00494E07: push ebx
  '00494E08: call [ecx+48h]
  '00494E0B: mov edx, [ebp-74h]
  '00494E0E: mov ecx, [ebp+10h]
  '00494E11: mov [ebp-74h], 00000000h
  '00494E18: call esi
  '00494E1A: mov ecx, [ebp+30h]
  '00494E1D: mov eax, [edi+34h]
  '00494E20: mov edx, [ebp+1Ch]
  '00494E23: mov edi, [edi+18h]
  '00494E26: mov [ecx], eax
  '00494E28: lea ecx, [ebp-74h]
  '00494E2B: mov [edx], edi
  '00494E2D: mov edx, [ebp-00000110h]
  '00494E33: mov eax, [ebx]
  '00494E35: push ecx
  '00494E36: mov ecx, [edx]
  '00494E38: push edi
  '00494E39: push ecx
  '00494E3A: push ebx
  '00494E3B: call [eax+4Ch]
  '00494E3E: mov edx, [ebp-74h]
  '00494E41: mov [ebp-74h], 00000000h
  '00494E48: jmp 494E7Eh
  '00494E4A: mov esi, [004012C4h]
  '00494E50: mov [ebp-70h], ecx
  '00494E53: mov ecx, [ebp+0Ch]
  '00494E56: mov edx, 0040FE84h
  '00494E5B: call esi
  '00494E5D: mov ecx, [ebp+10h]
  '00494E60: mov edx, 0040FE84h
  '00494E65: call esi
  '00494E67: mov edx, [ebp+30h]
  '00494E6A: mov eax, [ebp+1Ch]
  '00494E6D: mov [edx], 00000000h
  '00494E73: mov [eax], 00000000h
  '00494E79: mov edx, 0040FE84h
  '00494E7E: mov ecx, [ebp+18h]
  '00494E81: call esi
  '00494E83: push 00494ED2h
  '00494E88: jmp 494EA0h
  '00494E8A: lea ecx, [ebp-74h]
  '00494E8D: call [0040138Ch]
  '00494E93: lea ecx, [ebp-00000084h]
  '00494E99: call [00401034h]
  '00494E9F: ret 
End Sub
Private Sub unknown_495080
  '00495080: push ebp
  '00495081: mov ebp, esp
  '00495083: sub esp, 0000000Ch
  '00495086: push 00403796h
  '0049508B: mov eax, fs:[00h]
  '00495091: push eax
  '00495092: mov fs:[00000000h], esp
  '00495099: sub esp, 00000040h
  '0049509C: push ebx
  '0049509D: push esi
  '0049509E: push edi
  '0049509F: mov [ebp-0Ch], esp
  '004950A2: mov [ebp-08h], 00402D90h
  '004950A9: xor esi, esi
  '004950AB: mov [ebp-04h], esi
  '004950AE: mov eax, [ebp+08h]
  '004950B1: push eax
  '004950B2: mov ecx, [eax]
  '004950B4: call [ecx+04h]
  '004950B7: mov edx, [ebp+10h]
  '004950BA: lea eax, [ebp-38h]
  '004950BD: push eax
  '004950BE: mov [ebp-38h], esi
  '004950C1: push 00000104h
  '004950C6: mov [ebp-18h], esi
  '004950C9: mov [ebp-20h], esi
  '004950CC: mov [ebp-24h], esi
  '004950CF: mov [ebp-28h], esi
  '004950D2: mov [edx], esi
  '004950D4: mov [ebp-30h], esi
  '004950D7: mov [ebp-38h], 00000002h
  '004950DE: call [0040122Ch]
  '004950E4: mov edx, eax
  '004950E6: lea ecx, [ebp-18h]
  '004950E9: call [00401348h]
  '004950EF: lea ecx, [ebp-38h]
  '004950F2: call [00401034h]
  '004950F8: mov ecx, [ebp-18h]
  '004950FB: mov edi, [0040130Ch]
  '00495101: push 00000104h
  '00495106: lea edx, [ebp-28h]
  '00495109: push ecx
  '0049510A: push edx
  '0049510B: call edi
  '0049510D: mov ebx, [ebp+0Ch]
  '00495110: push eax
  '00495111: lea ecx, [ebp-24h]
  '00495114: mov eax, [ebx]
  '00495116: push eax
  '00495117: push ecx
  '00495118: call edi
  '0049511A: push eax
  '0049511B: call 0041370Ch
  '00495120: mov edi, eax
  '00495122: call [004010A4h]
  '00495128: mov edx, [ebp-24h]
  '0049512B: push edx
  '0049512C: push ebx
  '0049512D: mov ebx, [00401228h]
  '00495133: call ebx
  '00495135: mov eax, [ebp-28h]
  '00495138: lea ecx, [ebp-18h]
  '0049513B: push eax
  '0049513C: push ecx
  '0049513D: call ebx
  '0049513F: mov ecx, edi
  '00495141: call [0040119Ch]
  '00495147: mov edi, eax
  '00495149: lea edx, [ebp-28h]
  '0049514C: lea eax, [ebp-24h]
  '0049514F: push edx
  '00495150: push eax
  '00495151: push 00000002h
  '00495153: call [004012CCh]
  '00495159: add esp, 0000000Ch
  '0049515C: cmp di, si
  '0049515F: jz 495171h
  '00495161: mov edx, 0040FE84h
  '00495166: lea ecx, [ebp-20h]
  '00495169: call [004012C4h]
  '0049516F: jmp 49519Eh
  '00495171: mov ecx, [ebp-18h]
  '00495174: push 00000001h
  '00495176: push ecx
  '00495177: push 00421BACh
  '0049517C: push esi
  '0049517D: call [004012A0h]
  '00495183: mov edx, [ebp-18h]
  '00495186: sub eax, 00000001h
  '00495189: jo 495202h
  '0049518B: push eax
  '0049518C: push edx
  '0049518D: call [0040131Ch]
  '00495193: mov edx, eax
  '00495195: lea ecx, [ebp-20h]
  '00495198: call [00401348h]
  '0049519E: push 004951DBh
  '004951A3: jmp 4951D1h
  '004951A5: test byte ptr [ebp-04h], 04h
  '004951A9: jz 4951B4h
  '004951AB: lea ecx, [ebp-20h]
  '004951AE: call [0040138Ch]
  '004951B4: lea eax, [ebp-28h]
  '004951B7: lea ecx, [ebp-24h]
  '004951BA: push eax
  '004951BB: push ecx
  '004951BC: push 00000002h
  '004951BE: call [004012CCh]
  '004951C4: add esp, 0000000Ch
  '004951C7: lea ecx, [ebp-38h]
  '004951CA: call [00401034h]
  '004951D0: ret 
End Sub
Private Sub unknown_495210
  '00495210: push ebp
  '00495211: mov ebp, esp
  '00495213: sub esp, 0000000Ch
  '00495216: push 00403796h
  '0049521B: mov eax, fs:[00h]
  '00495221: push eax
  '00495222: mov fs:[00000000h], esp
  '00495229: sub esp, 00000120h
  '0049522F: push ebx
  '00495230: push esi
  '00495231: push edi
  '00495232: mov [ebp-0Ch], esp
  '00495235: mov [ebp-08h], 00402DA0h
  '0049523C: xor ebx, ebx
  '0049523E: mov [ebp-04h], ebx
  '00495241: mov esi, [ebp+08h]
  '00495244: push esi
  '00495245: mov eax, [esi]
  '00495247: call [eax+04h]
  '0049524A: mov ecx, 00000009h
  '0049524F: xor eax, eax
  '00495251: lea edi, [ebp-38h]
  '00495254: mov [ebp-3Ch], ebx
  '00495257: rep stosd 
  '00495259: mov ecx, [ebp+1Ch]
  '0049525C: mov [ebp-50h], ebx
  '0049525F: mov [ebp-60h], ebx
  '00495262: mov [ebp-70h], ebx
  '00495265: mov eax, [ecx]
  '00495267: mov [ebp-80h], ebx
  '0049526A: cmp eax, FFFFFFFFh
  '0049526D: mov [ebp-00000090h], ebx
  '00495273: mov [ebp-000000A0h], ebx
  '00495279: mov [ebp-000000B0h], ebx
  '0049527F: mov [ebp-000000C0h], ebx
  '00495285: mov [ebp-000000F0h], ebx
  '0049528B: mov [ebp-00000100h], ebx
  '00495291: mov [ebp-00000110h], ebx
  '00495297: mov [ebp-00000120h], ebx
  '0049529D: mov [ebp-38h], 00000024h
  '004952A4: jz 4952A9h
  '004952A6: mov [ebp-34h], eax
  '004952A9: mov edx, [ebp+0Ch]
  '004952AC: mov ecx, [ebp+10h]
  '004952AF: mov [ebp-000000B8h], ecx
  '004952B5: lea ecx, [ebp-000000C0h]
  '004952BB: mov eax, [edx]
  '004952BD: lea edx, [ebp-60h]
  '004952C0: mov [ebp-2Ch], eax
  '004952C3: lea eax, [ebp-50h]
  '004952C6: push edx
  '004952C7: push eax
  '004952C8: lea edx, [ebp-70h]
  '004952CB: mov edi, 00000003h
  '004952D0: push ecx
  '004952D1: push edx
  '004952D2: mov [ebp-00000118h], FFFFFFCFh
  '004952DC: mov [ebp-00000120h], edi
  '004952E2: mov [ebp-000000E8h], 00000001h
  '004952EC: mov [ebp-000000F0h], edi
  '004952F2: mov [ebp-58h], 00000080h
  '004952F9: mov [ebp-60h], edi
  '004952FC: mov [ebp-48h], 00000100h
  '00495303: mov [ebp-50h], edi
  '00495306: mov [ebp-000000C0h], 0000400Bh
  '00495310: call [004012C8h]
  '00495316: mov eax, [ebp+14h]
  '00495319: mov edx, [ebp+18h]
  '0049531C: mov [ebp-00000100h], edi
  '00495322: mov [ebp-00000110h], edi
  '00495328: movsx ecx, word ptr [eax]
  '0049532B: imul ecx, FEh
  '0049532E: movsx eax, word ptr [edx]
  '00495331: jo 0049547Eh
  '00495337: imul eax, FCh
  '0049533A: mov edi, [004011ACh]
  '00495340: mov [ebp-000000F8h], ecx
  '00495346: jo 0049547Eh
  '0049534C: lea ecx, [ebp-00000120h]
  '00495352: mov [ebp-00000108h], eax
  '00495358: lea edx, [ebp-000000F0h]
  '0049535E: push ecx
  '0049535F: lea eax, [ebp-70h]
  '00495362: push edx
  '00495363: lea ecx, [ebp-80h]
  '00495366: push eax
  '00495367: push ecx
  '00495368: call edi
  '0049536A: push eax
  '0049536B: lea edx, [ebp-00000100h]
  '00495371: lea eax, [ebp-00000090h]
  '00495377: push edx
  '00495378: push eax
  '00495379: call edi
  '0049537B: lea ecx, [ebp-00000110h]
  '00495381: push eax
  '00495382: lea edx, [ebp-000000A0h]
  '00495388: push ecx
  '00495389: push edx
  '0049538A: call edi
  '0049538C: push eax
  '0049538D: lea eax, [ebp-000000B0h]
  '00495393: push eax
  '00495394: call [00401200h]
  '0049539A: push eax
  '0049539B: call [004012ECh]
  '004953A1: lea ecx, [ebp-70h]
  '004953A4: mov [ebp-24h], eax
  '004953A7: lea edx, [ebp-60h]
  '004953AA: push ecx
  '004953AB: lea eax, [ebp-50h]
  '004953AE: push edx
  '004953AF: push eax
  '004953B0: push 00000003h
  '004953B2: call [00401058h]
  '004953B8: add esp, 00000010h
  '004953BB: cmp [esi+50h], bx
  '004953BF: jnz 4953C7h
  '004953C1: mov ecx, [esi]
  '004953C3: push esi
  '004953C4: call [ecx+50h]
  '004953C7: mov edx, [esi+44h]
  '004953CA: push edx
  '004953CB: call [00401280h]
  '004953D1: mov [ebp-28h], eax
  '004953D4: lea eax, [ebp-38h]
  '004953D7: push eax
  '004953D8: call 00413768h
  '004953DD: mov edi, eax
  '004953DF: call [004010A4h]
  '004953E5: mov [esi+54h], edi
  '004953E8: sub edi, ebx
  '004953EA: jz 4953FFh
  '004953EC: dec edi
  '004953ED: jz 495412h
  '004953EF: call 004138DCh
  '004953F4: mov edi, eax
  '004953F6: call [004010A4h]
  '004953FC: mov [esi+58h], edi
  '004953FF: mov ecx, [ebp+0Ch]
  '00495402: mov [ebp-3Ch], ebx
  '00495405: mov [ecx], FFFFFFFFh
  '0049540B: push 00495455h
  '00495410: jmp 495454h
  '00495412: mov eax, [ebp+0Ch]
  '00495415: mov edx, [ebp-2Ch]
  '00495418: mov [ebp-3Ch], FFFFFFFFh
  '0049541F: mov [eax], edx
  '00495421: jmp 49540Bh
  '00495423: lea edx, [ebp-000000B0h]
  '00495429: lea eax, [ebp-000000A0h]
  '0049542F: push edx
  '00495430: lea ecx, [ebp-00000090h]
  '00495436: push eax
  '00495437: lea edx, [ebp-80h]
  '0049543A: push ecx
  '0049543B: lea eax, [ebp-70h]
  '0049543E: push edx
  '0049543F: lea ecx, [ebp-60h]
  '00495442: push eax
  '00495443: lea edx, [ebp-50h]
  '00495446: push ecx
  '00495447: push edx
  '00495448: push 00000007h
  '0049544A: call [00401058h]
  '00495450: add esp, 00000020h
  '00495453: ret 
End Sub
Private Sub unknown_4954E0
  '004954E0: push ebp
  '004954E1: mov ebp, esp
  '004954E3: sub esp, 0000000Ch
  '004954E6: push 00403796h
  '004954EB: mov eax, fs:[00h]
  '004954F1: push eax
  '004954F2: mov fs:[00000000h], esp
  '004954F9: sub esp, 00000010h
  '004954FC: push ebx
  '004954FD: push esi
  '004954FE: push edi
  '004954FF: mov [ebp-0Ch], esp
  '00495502: mov [ebp-08h], 00402DB0h
  '00495509: xor edi, edi
  '0049550B: mov [ebp-04h], edi
  '0049550E: mov esi, [ebp+08h]
  '00495511: push esi
  '00495512: mov eax, [esi]
  '00495514: call [eax+04h]
  '00495517: cmp [esi+50h], di
  '0049551B: mov [ebp-18h], edi
  '0049551E: jnz 495526h
  '00495520: mov ecx, [esi]
  '00495522: push esi
  '00495523: call [ecx+50h]
  '00495526: mov edx, [ebp+0Ch]
  '00495529: xor ecx, ecx
  '0049552B: mov ax, [edx]
  '0049552E: cmp ax, 000Fh
  '00495532: setnle cl
  '00495535: xor edx, edx
  '00495537: cmp ax, di
  '0049553A: setl dl
  '0049553D: or ecx, edx
  '0049553F: jnz 49555Ah
  '00495541: movsx edi, ax
  '00495544: cmp edi, 00000010h
  '00495547: jb 49554Fh
  '00495549: call [00401170h]
  '0049554F: mov eax, [esi+44h]
  '00495552: mov ecx, [eax+edi*4]
  '00495555: mov [ebp-18h], ecx
  '00495558: jmp 495561h
  '0049555A: mov [ebp-18h], FFFFFFFFh
  '00495561: mov eax, [ebp+08h]
  '00495564: push eax
  '00495565: mov edx, [eax]
  '00495567: call [edx+08h]
  '0049556A: mov eax, [ebp+10h]
  '0049556D: mov ecx, [ebp-18h]
  '00495570: mov [eax], ecx
  '00495572: mov eax, [ebp-04h]
  '00495575: mov ecx, [ebp-14h]
  '00495578: pop edi
  '00495579: pop esi
  '0049557A: mov fs:[00000000h], ecx
  '00495581: pop ebx
  '00495582: mov esp, ebp
  '00495584: pop ebp
  '00495585: retn 000Ch
End Sub
Private Sub unknown_495590
  '00495590: push ebp
  '00495591: mov ebp, esp
  '00495593: sub esp, 0000000Ch
  '00495596: push 00403796h
  '0049559B: mov eax, fs:[00h]
  '004955A1: push eax
  '004955A2: mov fs:[00000000h], esp
  '004955A9: sub esp, 0000000Ch
  '004955AC: push ebx
  '004955AD: push esi
  '004955AE: push edi
  '004955AF: mov [ebp-0Ch], esp
  '004955B2: mov [ebp-08h], 00402DB8h
  '004955B9: mov [ebp-04h], 00000000h
  '004955C0: mov esi, [ebp+08h]
  '004955C3: push esi
  '004955C4: mov eax, [esi]
  '004955C6: call [eax+04h]
  '004955C9: cmp word ptr [esi+50h], 0000h
  '004955CE: jnz 4955D6h
  '004955D0: mov ecx, [esi]
  '004955D2: push esi
  '004955D3: call [ecx+50h]
  '004955D6: mov edx, [ebp+0Ch]
  '004955D9: xor ecx, ecx
  '004955DB: mov ax, [edx]
  '004955DE: cmp ax, 000Fh
  '004955E2: setnle cl
  '004955E5: xor edx, edx
  '004955E7: test ax, ax
  '004955EA: setl dl
  '004955ED: or ecx, edx
  '004955EF: jnz 49560Ah
  '004955F1: movsx edi, ax
  '004955F4: cmp edi, 00000010h
  '004955F7: jb 4955FFh
  '004955F9: call [00401170h]
  '004955FF: mov ecx, [ebp+10h]
  '00495602: mov eax, [esi+44h]
  '00495605: mov edx, [ecx]
  '00495607: mov [eax+edi*4], edx
  '0049560A: mov eax, [ebp+08h]
  '0049560D: push eax
  '0049560E: mov ecx, [eax]
  '00495610: call [ecx+08h]
  '00495613: mov eax, [ebp-04h]
  '00495616: mov ecx, [ebp-14h]
  '00495619: pop edi
  '0049561A: pop esi
  '0049561B: mov fs:[00000000h], ecx
  '00495622: pop ebx
  '00495623: mov esp, ebp
  '00495625: pop ebp
  '00495626: retn 000Ch
End Sub
Private Sub unknown_495630
  '00495630: push ebp
  '00495631: mov ebp, esp
  '00495633: sub esp, 0000000Ch
  '00495636: push 00403796h
  '0049563B: mov eax, fs:[00h]
  '00495641: push eax
  '00495642: mov fs:[00000000h], esp
  '00495649: sub esp, 0000013Ch
  '0049564F: push ebx
  '00495650: push esi
  '00495651: push edi
  '00495652: mov [ebp-0Ch], esp
  '00495655: mov [ebp-08h], 00402DD0h
  '0049565C: xor esi, esi
  '0049565E: mov [ebp-04h], esi
  '00495661: mov ebx, [ebp+08h]
  '00495664: push ebx
  '00495665: mov eax, [ebx]
  '00495667: call [eax+04h]
  '0049566A: mov ecx, 00000010h
  '0049566F: xor eax, eax
  '00495671: lea edi, [ebp-58h]
  '00495674: push 00000011h
  '00495676: rep stosd 
  '00495678: mov ecx, 0000000Fh
  '0049567D: lea edi, [ebp-00000094h]
  '00495683: rep stosd 
  '00495685: mov ecx, 0000000Fh
  '0049568A: lea edi, [ebp-0000011Ch]
  '00495690: rep stosd 
  '00495692: lea ecx, [ebp-00000138h]
  '00495698: push 00421BC4h
  '0049569D: push ecx
  '0049569E: mov [ebp-18h], esi
  '004956A1: mov [ebp-00000098h], esi
  '004956A7: mov [ebp-0000009Ch], esi
  '004956AD: mov [ebp-000000ACh], esi
  '004956B3: mov [ebp-000000BCh], esi
  '004956B9: mov [ebp-000000D0h], esi
  '004956BF: call [00401188h]
  '004956C5: mov [ebx+54h], esi
  '004956C8: mov [ebx+58h], esi
  '004956CB: mov ebx, [ebp+10h]
  '004956CE: cmp [ebx], FFFFFFFFh
  '004956D1: jnz 0049576Bh
  '004956D7: mov [ebx], esi
  '004956D9: mov esi, [ebp+24h]
  '004956DC: test byte ptr [esi], 02h
  '004956DF: jz 00495781h
  '004956E5: mov eax, [4A0F98h]
  '004956EA: test eax, eax
  '004956EC: jnz 4956FEh
  '004956EE: push 004A0F98h
  '004956F3: push 0040FFF4h
  '004956F8: call [004012A8h]
  '004956FE: mov edi, [004A0F98h]
  '00495704: lea eax, [ebp-0000009Ch]
  '0049570A: push eax
  '0049570B: push edi
  '0049570C: mov edx, [edi]
  '0049570E: call [edx+20h]
  '00495711: test eax, eax
  '00495713: fclex 
  '00495715: jnl 495726h
  '00495717: push 00000020h
  '00495719: push 0040FFE4h
  '0049571E: push edi
  '0049571F: push eax
  '00495720: call [004010A8h]
  '00495726: mov ecx, [ebp-0000009Ch]
  '0049572C: mov edi, [004011D4h]
  '00495732: push 00000000h
  '00495734: push 00010009h
  '00495739: lea edx, [ebp-000000ACh]
  '0049573F: push ecx
  '00495740: push edx
  '00495741: call edi
  '00495743: add esp, 00000010h
  '00495746: push eax
  '00495747: call [004012ECh]
  '0049574D: lea ecx, [ebp-0000009Ch]
  '00495753: mov [ebx], eax
  '00495755: call [00401388h]
  '0049575B: mov ebx, [00401034h]
  '00495761: lea ecx, [ebp-000000ACh]
  '00495767: call ebx
  '00495769: jmp 49578Dh
  '0049576B: mov eax, [ebp+24h]
  '0049576E: mov edi, [004011D4h]
  '00495774: mov ebx, [00401034h]
  '0049577A: mov esi, eax
  '0049577C: or [eax], 00000002h
  '0049577F: jmp 49578Dh
  '00495781: mov edi, [004011D4h]
  '00495787: mov ebx, [00401034h]
  '0049578D: mov eax, [esi]
  '0049578F: test al, 02h
  '00495791: jnz 495797h
  '00495793: or al, 01h
  '00495795: mov [esi], eax
  '00495797: mov eax, [ebp+18h]
  '0049579A: cmp [eax], 00000000h
  '0049579D: jz 4957A6h
  '0049579F: mov eax, [esi]
  '004957A1: or ah, 01h
  '004957A4: mov [esi], eax
  '004957A6: mov ecx, [ebp+1Ch]
  '004957A9: cmp [ecx], 00000000h
  '004957AC: jz 4957B5h
  '004957AE: mov eax, [esi]
  '004957B0: or ah, 20h
  '004957B3: mov [esi], eax
  '004957B5: mov edx, [ebp+20h]
  '004957B8: cmp [edx], 00000000h
  '004957BB: jz 4957C4h
  '004957BD: mov eax, [esi]
  '004957BF: or ah, 20h
  '004957C2: mov [esi], eax
  '004957C4: mov eax, [esi]
  '004957C6: and eax, FFFFFDE7h
  '004957CB: or al, 40h
  '004957CD: mov [esi], eax
  '004957CF: mov eax, [4A0F98h]
  '004957D4: test eax, eax
  '004957D6: jnz 4957E8h
  '004957D8: push 004A0F98h
  '004957DD: push 0040FFF4h
  '004957E2: call [004012A8h]
  '004957E8: mov esi, [004A0F98h]
  '004957EE: lea edx, [ebp-0000009Ch]
  '004957F4: push edx
  '004957F5: push esi
  '004957F6: mov ecx, [esi]
  '004957F8: call [ecx+18h]
  '004957FB: test eax, eax
  '004957FD: fclex 
  '004957FF: jnl 495810h
  '00495801: push 00000018h
  '00495803: push 0040FFE4h
  '00495808: push esi
  '00495809: push eax
  '0049580A: call [004010A8h]
  '00495810: mov eax, [ebp-0000009Ch]
  '00495816: lea edx, [ebp-000000D0h]
  '0049581C: push edx
  '0049581D: push eax
  '0049581E: mov ecx, [eax]
  '00495820: mov esi, eax
  '00495822: call [ecx+00000088h]
  '00495828: test eax, eax
  '0049582A: fclex 
  '0049582C: jnl 495840h
  '0049582E: push 00000088h
  '00495833: push 00421BB0h
  '00495838: push esi
  '00495839: push eax
  '0049583A: call [004010A8h]
  '00495840: mov esi, [ebp+0Ch]
  '00495843: push 00000000h
  '00495845: push 00000002h
  '00495847: lea ecx, [ebp-000000ACh]
  '0049584D: mov eax, [esi]
  '0049584F: push eax
  '00495850: push ecx
  '00495851: call edi
  '00495853: add esp, 00000010h
  '00495856: push eax
  '00495857: call [0040115Ch]
  '0049585D: push edx
  '0049585E: push eax
  '0049585F: call [004011DCh]
  '00495865: fld real4 ptr [ebp-000000D0h]
  '0049586B: cmp [004A0000h], 00000000h
  '00495872: jnz 49587Ch
  '00495874: fdivr real8 ptr [00402DC8h]
  '0049587A: jmp 49588Dh
  '0049587C: push [00402DCCh]
  '00495882: push [00402DC8h]
  '00495888: call 004037D2h
  '0049588D: fmulp st(1), st(0)
  '0049588F: fchs 
  '00495891: fstsw ax
  '00495893: test al, 0Dh
  '00495895: jnz 00495D49h
  '0049589B: call [00401320h]
  '004958A1: lea ecx, [ebp-0000009Ch]
  '004958A7: mov [ebp-58h], eax
  '004958AA: call [00401388h]
  '004958B0: lea ecx, [ebp-000000ACh]
  '004958B6: call ebx
  '004958B8: mov edx, [esi]
  '004958BA: push 00000000h
  '004958BC: push 00000007h
  '004958BE: lea eax, [ebp-000000ACh]
  '004958C4: push edx
  '004958C5: push eax
  '004958C6: call edi
  '004958C8: add esp, 00000010h
  '004958CB: push eax
  '004958CC: call [0040127Ch]
  '004958D2: movsx ecx, ax
  '004958D5: mov [ebp-48h], ecx
  '004958D8: lea ecx, [ebp-000000ACh]
  '004958DE: call ebx
  '004958E0: mov edx, [esi]
  '004958E2: push 00000000h
  '004958E4: push 00000004h
  '004958E6: lea eax, [ebp-000000ACh]
  '004958EC: push edx
  '004958ED: push eax
  '004958EE: call edi
  '004958F0: add esp, 00000010h
  '004958F3: push eax
  '004958F4: call [0040110Ch]
  '004958FA: lea ecx, [ebp-000000ACh]
  '00495900: mov [ebp-44h], al
  '00495903: call ebx
  '00495905: mov ecx, [esi]
  '00495907: push 00000000h
  '00495909: push 00000005h
  '0049590B: lea edx, [ebp-000000ACh]
  '00495911: push ecx
  '00495912: push edx
  '00495913: call edi
  '00495915: add esp, 00000010h
  '00495918: push eax
  '00495919: call [0040110Ch]
  '0049591F: lea ecx, [ebp-000000ACh]
  '00495925: mov [ebp-43h], al
  '00495928: call ebx
  '0049592A: mov eax, [esi]
  '0049592C: push 00000000h
  '0049592E: push 00000006h
  '00495930: lea ecx, [ebp-000000ACh]
  '00495936: push eax
  '00495937: push ecx
  '00495938: call edi
  '0049593A: add esp, 00000010h
  '0049593D: push eax
  '0049593E: call [0040110Ch]
  '00495944: lea ecx, [ebp-000000ACh]
  '0049594A: mov [ebp-42h], al
  '0049594D: call ebx
  '0049594F: mov edx, [esi]
  '00495951: push 00000000h
  '00495953: push 00000000h
  '00495955: lea eax, [ebp-000000ACh]
  '0049595B: push edx
  '0049595C: push eax
  '0049595D: call edi
  '0049595F: add esp, 00000010h
  '00495962: push eax
  '00495963: call [00401048h]
  '00495969: mov edx, eax
  '0049596B: lea ecx, [ebp-00000098h]
  '00495971: call [00401348h]
  '00495977: mov eax, [ebp+08h]
  '0049597A: lea edx, [ebp-00000138h]
  '00495980: mov [ebp-000000D0h], edx
  '00495986: lea edx, [ebp-00000098h]
  '0049598C: lea ecx, [ebp-3Ch]
  '0049598F: push edx
  '00495990: lea edx, [ebp-000000D0h]
  '00495996: mov [ebp-0000012Ch], ecx
  '0049599C: mov ecx, [eax]
  '0049599E: push edx
  '0049599F: push eax
  '004959A0: call [ecx+5Ch]
  '004959A3: lea ecx, [ebp-00000098h]
  '004959A9: call [0040138Ch]
  '004959AF: lea ecx, [ebp-000000ACh]
  '004959B5: call ebx
  '004959B7: mov eax, [ebp+14h]
  '004959BA: mov [ebp-00000094h], 0000003Ch
  '004959C4: mov eax, [eax]
  '004959C6: cmp eax, FFFFFFFFh
  '004959C9: jz 4959D1h
  '004959CB: mov [ebp-00000090h], eax
  '004959D1: mov ecx, [ebp+10h]
  '004959D4: lea eax, [ebp-58h]
  '004959D7: push eax
  '004959D8: mov edx, [ecx]
  '004959DA: mov [ebp-0000008Ch], edx
  '004959E0: call [00401280h]
  '004959E6: mov ecx, [esi]
  '004959E8: push 00000000h
  '004959EA: push 00000002h
  '004959EC: lea edx, [ebp-000000ACh]
  '004959F2: push ecx
  '004959F3: push edx
  '004959F4: mov [ebp-00000088h], eax
  '004959FA: call edi
  '004959FC: add esp, 00000010h
  '004959FF: push eax
  '00495A00: call [0040115Ch]
  '00495A06: push edx
  '00495A07: push eax
  '00495A08: push 0000000Ah
  '00495A0A: call [004012ACh]
  '00495A10: push edx
  '00495A11: push eax
  '00495A12: call [00401350h]
  '00495A18: lea ecx, [ebp-000000ACh]
  '00495A1E: mov [ebp-00000084h], eax
  '00495A24: call ebx
  '00495A26: mov ebx, [ebp+24h]
  '00495A29: mov edi, [ebp+18h]
  '00495A2C: mov edx, [ebp+1Ch]
  '00495A2F: mov eax, [ebx]
  '00495A31: mov ecx, [edi]
  '00495A33: mov [ebp-80h], eax
  '00495A36: mov eax, [edx]
  '00495A38: mov [ebp-7Ch], ecx
  '00495A3B: mov ecx, [ebp+20h]
  '00495A3E: mov [ebp-60h], eax
  '00495A41: lea eax, [ebp-00000094h]
  '00495A47: mov edx, [ecx]
  '00495A49: lea ecx, [ebp-0000011Ch]
  '00495A4F: push eax
  '00495A50: push ecx
  '00495A51: push 004132E0h
  '00495A56: mov [ebp-5Ch], edx
  '00495A59: call [004011E8h]
  '00495A5F: push eax
  '00495A60: call 004137F0h
  '00495A65: mov [ebp-000000D0h], eax
  '00495A6B: call [004010A4h]
  '00495A71: lea edx, [ebp-0000011Ch]
  '00495A77: lea eax, [ebp-00000094h]
  '00495A7D: push edx
  '00495A7E: push eax
  '00495A7F: push 004132E0h
  '00495A84: call [0040107Ch]
  '00495A8A: mov edx, [ebp+08h]
  '00495A8D: mov ecx, [ebp-000000D0h]
  '00495A93: lea eax, [ebp-0000011Ch]
  '00495A99: push eax
  '00495A9A: push 004132E0h
  '00495A9F: mov [edx+54h], ecx
  '00495AA2: call [00401328h]
  '00495AA8: mov ecx, [ebp+08h]
  '00495AAB: mov eax, [ecx+54h]
  '00495AAE: sub eax, 00000000h
  '00495AB1: jz 495AD3h
  '00495AB3: dec eax
  '00495AB4: jz 495AE5h
  '00495AB6: call 004138DCh
  '00495ABB: mov [ebp-000000D0h], eax
  '00495AC1: call [004010A4h]
  '00495AC7: mov eax, [ebp+08h]
  '00495ACA: mov edx, [ebp-000000D0h]
  '00495AD0: mov [eax+58h], edx
  '00495AD3: mov [ebp-18h], 00000000h
  '00495ADA: wait 
  '00495ADB: push 00495D20h
  '00495AE0: jmp 00495CFBh
  '00495AE5: mov ecx, [ebp-80h]
  '00495AE8: mov edx, [ebp-7Ch]
  '00495AEB: mov eax, [ebp-64h]
  '00495AEE: mov [ebx], ecx
  '00495AF0: mov ebx, [ebp-000000B8h]
  '00495AF6: sub esp, 00000010h
  '00495AF9: mov [edi], edx
  '00495AFB: mov edx, esp
  '00495AFD: mov ecx, 00000003h
  '00495B02: mov edi, [0040136Ch]
  '00495B08: mov [edx], ecx
  '00495B0A: and eax, 00000100h
  '00495B0F: push ecx
  '00495B10: mov ecx, [esi]
  '00495B12: mov [edx+04h], ebx
  '00495B15: mov [ebp-000000B4h], eax
  '00495B1B: push ecx
  '00495B1C: mov [ebp-18h], FFFFFFFFh
  '00495B23: mov [edx+08h], eax
  '00495B26: mov eax, [ebp-000000B0h]
  '00495B2C: mov [edx+0Ch], eax
  '00495B2F: call edi
  '00495B31: mov dl, [ebp-44h]
  '00495B34: sub esp, 00000010h
  '00495B37: mov ecx, esp
  '00495B39: mov eax, 00000011h
  '00495B3E: mov [ebp-000000B4h], dl
  '00495B44: mov edx, [ebp-000000B4h]
  '00495B4A: mov [ecx], eax
  '00495B4C: mov eax, [ebp-000000B0h]
  '00495B52: push 00000004h
  '00495B54: mov [ecx+04h], ebx
  '00495B57: mov [ecx+08h], edx
  '00495B5A: mov [ecx+0Ch], eax
  '00495B5D: mov ecx, [esi]
  '00495B5F: push ecx
  '00495B60: call edi
  '00495B62: mov dl, [ebp-42h]
  '00495B65: sub esp, 00000010h
  '00495B68: mov ecx, esp
  '00495B6A: mov eax, 00000011h
  '00495B6F: mov [ebp-000000B4h], dl
  '00495B75: mov edx, [ebp-000000B4h]
  '00495B7B: mov [ecx], eax
  '00495B7D: mov eax, [ebp-000000B0h]
  '00495B83: push 00000006h
  '00495B85: mov [ecx+04h], ebx
  '00495B88: mov [ecx+08h], edx
  '00495B8B: mov [ecx+0Ch], eax
  '00495B8E: mov ecx, [esi]
  '00495B90: push ecx
  '00495B91: call edi
  '00495B93: mov dl, [ebp-43h]
  '00495B96: sub esp, 00000010h
  '00495B99: mov ecx, esp
  '00495B9B: mov eax, 00000011h
  '00495BA0: mov [ebp-000000B4h], dl
  '00495BA6: mov edx, [ebp-000000B4h]
  '00495BAC: mov [ecx], eax
  '00495BAE: mov eax, [ebp-000000B0h]
  '00495BB4: push 00000005h
  '00495BB6: mov [ecx+04h], ebx
  '00495BB9: mov [ecx+08h], edx
  '00495BBC: mov [ecx+0Ch], eax
  '00495BBF: mov ecx, [esi]
  '00495BC1: push ecx
  '00495BC2: call edi
  '00495BC4: sub esp, 00000010h
  '00495BC7: mov eax, [ebp-48h]
  '00495BCA: mov edx, esp
  '00495BCC: mov ecx, 00000003h
  '00495BD1: push 00000007h
  '00495BD3: mov [edx], ecx
  '00495BD5: mov ecx, [esi]
  '00495BD7: push ecx
  '00495BD8: mov [edx+04h], ebx
  '00495BDB: mov [edx+08h], eax
  '00495BDE: mov eax, [ebp-000000B0h]
  '00495BE4: mov [edx+0Ch], eax
  '00495BE7: call edi
  '00495BE9: fild dword ptr [ebp-00000084h]
  '00495BEF: fstp real8 ptr [ebp-00000150h]
  '00495BF5: fld real8 ptr [ebp-00000150h]
  '00495BFB: cmp [004A0000h], 00000000h
  '00495C02: jnz 495C0Ch
  '00495C04: fdiv real8 ptr [00402DC0h]
  '00495C0A: jmp 495C1Dh
  '00495C0C: push [00402DC4h]
  '00495C12: push [00402DC0h]
  '00495C18: call 004037B4h
  '00495C1D: fstp real8 ptr [ebp-000000B4h]
  '00495C23: fstsw ax
  '00495C25: test al, 0Dh
  '00495C27: jnz 00495D49h
  '00495C2D: sub esp, 00000010h
  '00495C30: mov eax, 00000005h
  '00495C35: mov edx, esp
  '00495C37: mov ecx, [ebp-000000B0h]
  '00495C3D: push 00000002h
  '00495C3F: mov [edx], eax
  '00495C41: mov eax, [ebp-000000B4h]
  '00495C47: mov [edx+04h], ebx
  '00495C4A: mov [edx+08h], eax
  '00495C4D: mov [edx+0Ch], ecx
  '00495C50: mov edx, [esi]
  '00495C52: push edx
  '00495C53: call edi
  '00495C55: lea ecx, [ebp-00000138h]
  '00495C5B: lea eax, [ebp-3Ch]
  '00495C5E: mov [ebp-000000D0h], ecx
  '00495C64: lea ecx, [ebp-00000098h]
  '00495C6A: mov [ebp-0000012Ch], eax
  '00495C70: mov eax, [ebp+08h]
  '00495C73: push ecx
  '00495C74: lea ecx, [ebp-000000D0h]
  '00495C7A: mov edx, [eax]
  '00495C7C: push ecx
  '00495C7D: push eax
  '00495C7E: call [edx+60h]
  '00495C81: sub esp, 00000010h
  '00495C84: mov eax, [ebp-00000098h]
  '00495C8A: mov edx, esp
  '00495C8C: mov ecx, 00000008h
  '00495C91: mov [ebp-000000ACh], ecx
  '00495C97: mov [ebp-000000A4h], eax
  '00495C9D: mov [edx], ecx
  '00495C9F: mov ecx, [ebp-000000A8h]
  '00495CA5: push 00000000h
  '00495CA7: mov [ebp-00000098h], 00000000h
  '00495CB1: mov [edx+04h], ecx
  '00495CB4: mov ecx, [esi]
  '00495CB6: push ecx
  '00495CB7: mov [edx+08h], eax
  '00495CBA: mov eax, [ebp-000000A0h]
  '00495CC0: mov [edx+0Ch], eax
  '00495CC3: call edi
  '00495CC5: lea ecx, [ebp-000000ACh]
  '00495CCB: call [00401034h]
  '00495CD1: jmp 00495ADAh
  '00495CD6: lea ecx, [ebp-00000098h]
  '00495CDC: call [0040138Ch]
  '00495CE2: lea ecx, [ebp-0000009Ch]
  '00495CE8: call [00401388h]
  '00495CEE: lea ecx, [ebp-000000ACh]
  '00495CF4: call [00401034h]
  '00495CFA: ret 
End Sub
Private Sub unknown_495D50
  '00495D50: push ebp
  '00495D51: mov ebp, esp
  '00495D53: sub esp, 00000018h
  '00495D56: push 00403796h
  '00495D5B: mov eax, fs:[00h]
  '00495D61: push eax
  '00495D62: mov fs:[00000000h], esp
  '00495D69: mov eax, 00000114h
  '00495D6E: call 00403790h
  '00495D73: push ebx
  '00495D74: push esi
  '00495D75: push edi
  '00495D76: mov [ebp-18h], esp
  '00495D79: mov [ebp-14h], 00402DE0h
  '00495D80: mov [ebp-10h], 00000000h
  '00495D87: mov [ebp-0Ch], 00000000h
  '00495D8E: mov eax, [ebp+08h]
  '00495D91: mov ecx, [eax]
  '00495D93: mov edx, [ebp+08h]
  '00495D96: push edx
  '00495D97: call [ecx+04h]
  '00495D9A: mov [ebp-04h], 00000001h
  '00495DA1: mov [ebp-04h], 00000002h
  '00495DA8: mov eax, [ebp+08h]
  '00495DAB: mov [eax+54h], 00000000h
  '00495DB2: mov [ebp-04h], 00000003h
  '00495DB9: mov ecx, [ebp+08h]
  '00495DBC: mov [ecx+58h], 00000000h
  '00495DC3: mov [ebp-04h], 00000004h
  '00495DCA: mov edx, [ebp+14h]
  '00495DCD: mov ax, [edx]
  '00495DD0: neg ax
  '00495DD3: movsx ecx, ax
  '00495DD6: imul ecx, 08h
  '00495DD9: jo 00496324h
  '00495DDF: mov edx, [ebp+2Ch]
  '00495DE2: mov ax, [edx]
  '00495DE5: neg ax
  '00495DE8: movsx edx, ax
  '00495DEB: imul edx, 00080000h
  '00495DF1: jo 00496324h
  '00495DF7: or ecx, edx
  '00495DF9: mov eax, [ebp+20h]
  '00495DFC: mov dx, [eax]
  '00495DFF: neg dx
  '00495E02: movsx eax, dx
  '00495E05: imul eax, 04h
  '00495E08: jo 00496324h
  '00495E0E: or ecx, eax
  '00495E10: mov edx, [ebp+30h]
  '00495E13: mov ax, [edx]
  '00495E16: neg ax
  '00495E19: movsx edx, ax
  '00495E1C: imul edx, 20h
  '00495E1F: jo 00496324h
  '00495E25: or ecx, edx
  '00495E27: mov eax, [ebp+28h]
  '00495E2A: mov dx, [eax]
  '00495E2D: not dx
  '00495E30: neg dx
  '00495E33: movsx eax, dx
  '00495E36: imul eax, 00100000h
  '00495E3C: jo 00496324h
  '00495E42: or ecx, eax
  '00495E44: mov edx, [ebp+38h]
  '00495E47: mov ax, [edx]
  '00495E4A: neg ax
  '00495E4D: movsx edx, ax
  '00495E50: imul edx, 00000080h
  '00495E56: jo 00496324h
  '00495E5C: or ecx, edx
  '00495E5E: mov eax, [ebp+34h]
  '00495E61: mov dx, [eax]
  '00495E64: neg dx
  '00495E67: movsx eax, dx
  '00495E6A: imul eax, 10h
  '00495E6D: jo 00496324h
  '00495E73: or ecx, eax
  '00495E75: or ecx, 00040000h
  '00495E7B: or ch, 01h
  '00495E7E: mov [ebp-70h], ecx
  '00495E81: mov [ebp-04h], 00000005h
  '00495E88: mov ecx, [ebp+10h]
  '00495E8B: cmp [ecx], 00000001h
  '00495E8E: jnz 495EA2h
  '00495E90: mov [ebp-04h], 00000006h
  '00495E97: mov edx, [ebp-70h]
  '00495E9A: or edx, 00000002h
  '00495E9D: mov [ebp-70h], edx
  '00495EA0: jmp 495EC1h
  '00495EA2: mov [ebp-04h], 00000007h
  '00495EA9: mov eax, [ebp+10h]
  '00495EAC: cmp [eax], 00000002h
  '00495EAF: jnz 495EC1h
  '00495EB1: mov [ebp-04h], 00000008h
  '00495EB8: mov ecx, [ebp-70h]
  '00495EBB: or ecx, 00000001h
  '00495EBE: mov [ebp-70h], ecx
  '00495EC1: mov [ebp-04h], 0000000Ah
  '00495EC8: mov [ebp-74h], FFFFAFFFh
  '00495ECF: mov [ebp-04h], 0000000Bh
  '00495ED6: mov edx, [ebp-74h]
  '00495ED9: and dh, 5Fh
  '00495EDC: mov [ebp-74h], edx
  '00495EDF: mov [ebp-04h], 0000000Ch
  '00495EE6: mov [ebp-6Ch], 00000042h
  '00495EED: mov [ebp-04h], 0000000Dh
  '00495EF4: mov eax, [ebp+3Ch]
  '00495EF7: mov ecx, [eax]
  '00495EF9: mov [ebp-68h], ecx
  '00495EFC: mov [ebp-04h], 0000000Eh
  '00495F03: mov edx, [ebp-70h]
  '00495F06: and edx, [ebp-74h]
  '00495F09: mov [ebp-58h], edx
  '00495F0C: mov [ebp-04h], 0000000Fh
  '00495F13: mov eax, [ebp+18h]
  '00495F16: mov ecx, [eax]
  '00495F18: call [0040119Ch]
  '00495F1E: mov [ebp-54h], ax
  '00495F22: mov [ebp-04h], 00000010h
  '00495F29: mov ecx, [ebp+1Ch]
  '00495F2C: mov ecx, [ecx]
  '00495F2E: call [0040119Ch]
  '00495F34: mov [ebp-52h], ax
  '00495F38: mov [ebp-04h], 00000011h
  '00495F3F: mov word ptr [ebp-50h], 0001h
  '00495F45: mov [ebp-04h], 00000012h
  '00495F4C: mov word ptr [ebp-4Eh], FFFFh
  '00495F52: mov [ebp-04h], 00000013h
  '00495F59: lea edx, [ebp-6Ch]
  '00495F5C: push edx
  '00495F5D: call 00413834h
  '00495F62: mov [ebp-00000098h], ax
  '00495F69: call [004010A4h]
  '00495F6F: movsx eax, word ptr [ebp-00000098h]
  '00495F76: mov ecx, [ebp+08h]
  '00495F79: mov [ecx+54h], eax
  '00495F7C: mov [ebp-04h], 00000014h
  '00495F83: mov edx, [ebp+08h]
  '00495F86: mov eax, [edx+54h]
  '00495F89: mov [ebp-0000011Ch], eax
  '00495F8F: mov ecx, [ebp-0000011Ch]
  '00495F95: mov [ebp-00000134h], ecx
  '00495F9B: cmp [ebp-00000134h], 00000000h
  '00495FA2: jz 004962B8h
  '00495FA8: cmp [ebp-00000134h], 00000001h
  '00495FAF: jz 495FBBh
  '00495FB1: jmp 004962C7h
  '00495FB6: jmp 004962F8h
  '00495FBB: mov [ebp-04h], 00000016h
  '00495FC2: mov word ptr [ebp-24h], FFFFh
  '00495FC8: mov [ebp-04h], 00000017h
  '00495FCF: mov edx, [ebp+0Ch]
  '00495FD2: mov eax, [ebp-5Ch]
  '00495FD5: mov [edx], eax
  '00495FD7: mov [ebp-04h], 00000018h
  '00495FDE: mov ecx, [ebp-58h]
  '00495FE1: and ecx, 00000002h
  '00495FE4: test ecx, ecx
  '00495FE6: jz 495FFAh
  '00495FE8: mov [ebp-04h], 00000019h
  '00495FEF: mov edx, [ebp+10h]
  '00495FF2: mov [edx], 00000001h
  '00495FF8: jmp 49602Dh
  '00495FFA: mov [ebp-04h], 0000001Ah
  '00496001: mov eax, [ebp-58h]
  '00496004: and eax, 00000001h
  '00496007: test eax, eax
  '00496009: jz 49601Dh
  '0049600B: mov [ebp-04h], 0000001Bh
  '00496012: mov ecx, [ebp+10h]
  '00496015: mov [ecx], 00000002h
  '0049601B: jmp 49602Dh
  '0049601D: mov [ebp-04h], 0000001Dh
  '00496024: mov edx, [ebp+10h]
  '00496027: mov [edx], 00000000h
  '0049602D: mov [ebp-04h], 0000001Fh
  '00496034: movsx eax, word ptr [ebp-54h]
  '00496038: mov ecx, [ebp+18h]
  '0049603B: mov [ecx], eax
  '0049603D: mov [ebp-04h], 00000020h
  '00496044: movsx edx, word ptr [ebp-52h]
  '00496048: mov eax, [ebp+1Ch]
  '0049604B: mov [eax], edx
  '0049604D: mov [ebp-04h], 00000021h
  '00496054: mov ecx, [ebp-58h]
  '00496057: and ecx, 00000020h
  '0049605A: neg ecx
  '0049605C: sbb ecx, ecx
  '0049605E: neg ecx
  '00496060: neg ecx
  '00496062: mov edx, [ebp+30h]
  '00496065: mov [edx], cx
  '00496068: mov [ebp-04h], 00000022h
  '0049606F: mov eax, [ebp-64h]
  '00496072: push eax
  '00496073: call 00413548h
  '00496078: mov [ebp-0000009Ch], eax
  '0049607E: call [004010A4h]
  '00496084: mov ecx, [ebp-0000009Ch]
  '0049608A: mov [ebp-28h], ecx
  '0049608D: mov [ebp-04h], 00000023h
  '00496094: push 0000007Ah
  '00496096: mov edx, [ebp-28h]
  '00496099: push edx
  '0049609A: mov eax, [ebp+08h]
  '0049609D: add eax, 0000005Ch
  '004960A0: push eax
  '004960A1: lea ecx, [ebp-00000118h]
  '004960A7: push ecx
  '004960A8: push 00413314h
  '004960AD: call [004011E8h]
  '004960B3: push eax
  '004960B4: call 004101ECh
  '004960B9: call [004010A4h]
  '004960BF: lea edx, [ebp-00000118h]
  '004960C5: push edx
  '004960C6: mov eax, [ebp+08h]
  '004960C9: add eax, 0000005Ch
  '004960CC: push eax
  '004960CD: push 00413314h
  '004960D2: call [0040107Ch]
  '004960D8: mov [ebp-04h], 00000024h
  '004960DF: mov ecx, [ebp-64h]
  '004960E2: push ecx
  '004960E3: call 0041361Ch
  '004960E8: call [004010A4h]
  '004960EE: mov [ebp-04h], 00000025h
  '004960F5: mov edx, [ebp+24h]
  '004960F8: mov eax, [ebp+08h]
  '004960FB: mov cx, [eax+000000B2h]
  '00496102: mov [edx], cx
  '00496105: mov [ebp-04h], 00000026h
  '0049610C: mov edx, [ebp+08h]
  '0049610F: xor eax, eax
  '00496111: cmp word ptr [edx+000000C0h], 0001h
  '00496119: setz al
  '0049611C: neg eax
  '0049611E: mov ecx, [ebp+34h]
  '00496121: mov [ecx], ax
  '00496124: mov [ebp-04h], 00000027h
  '0049612B: push FFFFFFFFh
  '0049612D: call [004010E8h]
  '00496133: mov [ebp-04h], 00000028h
  '0049613A: push 00000000h
  '0049613C: mov edx, [ebp+40h]
  '0049613F: mov eax, [edx]
  '00496141: push eax
  '00496142: call [004011FCh]
  '00496148: movsx ecx, ax
  '0049614B: test ecx, ecx
  '0049614D: jnz 004962A7h
  '00496153: mov [ebp-04h], 00000029h
  '0049615A: mov edx, [ebp+24h]
  '0049615D: mov ax, [edx]
  '00496160: mov [ebp-7Ch], ax
  '00496164: mov [ebp-00000084h], 00000002h
  '0049616E: mov eax, 00000010h
  '00496173: call 00403790h
  '00496178: mov ecx, esp
  '0049617A: mov edx, [ebp-00000084h]
  '00496180: mov [ecx], edx
  '00496182: mov eax, [ebp-80h]
  '00496185: mov [ecx+04h], eax
  '00496188: mov edx, [ebp-7Ch]
  '0049618B: mov [ecx+08h], edx
  '0049618E: mov eax, [ebp-78h]
  '00496191: mov [ecx+0Ch], eax
  '00496194: push 00421BDCh
  '00496199: mov ecx, [ebp+40h]
  '0049619C: mov edx, [ecx]
  '0049619E: push edx
  '0049619F: call [004010CCh]
  '004961A5: mov [ebp-04h], 0000002Ah
  '004961AC: mov eax, [ebp+08h]
  '004961AF: mov cx, [eax+000000A8h]
  '004961B6: mov [ebp-7Ch], cx
  '004961BA: mov [ebp-00000084h], 00000002h
  '004961C4: mov eax, 00000010h
  '004961C9: call 00403790h
  '004961CE: mov edx, esp
  '004961D0: mov eax, [ebp-00000084h]
  '004961D6: mov [edx], eax
  '004961D8: mov ecx, [ebp-80h]
  '004961DB: mov [edx+04h], ecx
  '004961DE: mov eax, [ebp-7Ch]
  '004961E1: mov [edx+08h], eax
  '004961E4: mov ecx, [ebp-78h]
  '004961E7: mov [edx+0Ch], ecx
  '004961EA: push 00421BECh
  '004961EF: mov edx, [ebp+40h]
  '004961F2: mov eax, [edx]
  '004961F4: push eax
  '004961F5: call [004010CCh]
  '004961FB: mov [ebp-04h], 0000002Bh
  '00496202: mov ecx, [ebp+08h]
  '00496205: mov dx, [ecx+000000AAh]
  '0049620C: mov [ebp-7Ch], dx
  '00496210: mov [ebp-00000084h], 00000002h
  '0049621A: mov eax, 00000010h
  '0049621F: call 00403790h
  '00496224: mov eax, esp
  '00496226: mov ecx, [ebp-00000084h]
  '0049622C: mov [eax], ecx
  '0049622E: mov edx, [ebp-80h]
  '00496231: mov [eax+04h], edx
  '00496234: mov ecx, [ebp-7Ch]
  '00496237: mov [eax+08h], ecx
  '0049623A: mov edx, [ebp-78h]
  '0049623D: mov [eax+0Ch], edx
  '00496240: push 00421B38h
  '00496245: mov eax, [ebp+40h]
  '00496248: mov ecx, [eax]
  '0049624A: push ecx
  '0049624B: call [004010CCh]
  '00496251: mov [ebp-04h], 0000002Ch
  '00496258: mov edx, [ebp+08h]
  '0049625B: mov ax, [edx+000000B6h]
  '00496262: mov [ebp-7Ch], ax
  '00496266: mov [ebp-00000084h], 00000002h
  '00496270: mov eax, 00000010h
  '00496275: call 00403790h
  '0049627A: mov ecx, esp
  '0049627C: mov edx, [ebp-00000084h]
  '00496282: mov [ecx], edx
  '00496284: mov eax, [ebp-80h]
  '00496287: mov [ecx+04h], eax
  '0049628A: mov edx, [ebp-7Ch]
  '0049628D: mov [ecx+08h], edx
  '00496290: mov eax, [ebp-78h]
  '00496293: mov [ecx+0Ch], eax
  '00496296: push 00420ED4h
  '0049629B: mov ecx, [ebp+40h]
  '0049629E: mov edx, [ecx]
  '004962A0: push edx
  '004962A1: call [004010CCh]
  '004962A7: mov [ebp-04h], 0000002Eh
  '004962AE: push 00000000h
  '004962B0: call [004010E8h]
  '004962B6: jmp 4962F8h
  '004962B8: mov [ebp-04h], 00000030h
  '004962BF: mov word ptr [ebp-24h], 0000h
  '004962C5: jmp 4962F8h
  '004962C7: mov [ebp-04h], 00000032h
  '004962CE: call 004138DCh
  '004962D3: mov [ebp-0000009Ch], eax
  '004962D9: call [004010A4h]
  '004962DF: mov eax, [ebp+08h]
  '004962E2: mov ecx, [ebp-0000009Ch]
  '004962E8: mov [eax+58h], ecx
  '004962EB: mov [ebp-04h], 00000033h
  '004962F2: mov word ptr [ebp-24h], 0000h
  '004962F8: mov edx, [ebp+08h]
  '004962FB: mov eax, [edx]
  '004962FD: mov ecx, [ebp+08h]
  '00496300: push ecx
  '00496301: call [eax+08h]
  '00496304: mov edx, [ebp+48h]
  '00496307: mov ax, [ebp-24h]
  '0049630B: mov [edx], ax
  '0049630E: mov eax, [ebp-10h]
  '00496311: mov ecx, [ebp-20h]
  '00496314: mov fs:[00000000h], ecx
  '0049631B: pop edi
  '0049631C: pop esi
  '0049631D: pop ebx
  '0049631E: mov esp, ebp
  '00496320: pop ebp
  '00496321: retn 0044h
End Sub
Private Sub unknown_496380
  '00496380: push ebp
  '00496381: mov ebp, esp
  '00496383: sub esp, 00000018h
  '00496386: push 00403796h
  '0049638B: mov eax, fs:[00h]
  '00496391: push eax
  '00496392: mov fs:[00000000h], esp
  '00496399: mov eax, 0000025Ch
  '0049639E: call 00403790h
  '004963A3: push ebx
  '004963A4: push esi
  '004963A5: push edi
  '004963A6: mov [ebp-18h], esp
  '004963A9: mov [ebp-14h], 00402ED8h
  '004963B0: mov [ebp-10h], 00000000h
  '004963B7: mov [ebp-0Ch], 00000000h
  '004963BE: mov eax, [ebp+08h]
  '004963C1: mov ecx, [eax]
  '004963C3: mov edx, [ebp+08h]
  '004963C6: push edx
  '004963C7: call [ecx+04h]
  '004963CA: mov [ebp-04h], 00000001h
  '004963D1: mov [ebp-04h], 00000002h
  '004963D8: mov eax, [ebp+08h]
  '004963DB: mov [eax+54h], 00000000h
  '004963E2: mov [ebp-04h], 00000003h
  '004963E9: mov ecx, [ebp+08h]
  '004963EC: mov [ecx+58h], 00000000h
  '004963F3: mov [ebp-04h], 00000004h
  '004963FA: mov [ebp-00000140h], FFFB5FFFh
  '00496404: mov [ebp-04h], 00000005h
  '0049640B: mov edx, [ebp+10h]
  '0049640E: mov ax, [edx]
  '00496411: neg ax
  '00496414: movsx ecx, ax
  '00496417: imul ecx, 10h
  '0049641A: jo 00496BDDh
  '00496420: mov edx, [ebp+14h]
  '00496423: mov ax, [edx]
  '00496426: neg ax
  '00496429: movsx edx, ax
  '0049642C: imul edx, 00000100h
  '00496432: jo 00496BDDh
  '00496438: or ecx, edx
  '0049643A: mov eax, [ebp+18h]
  '0049643D: mov dx, [eax]
  '00496440: neg dx
  '00496443: movsx eax, dx
  '00496446: imul eax, 00000200h
  '0049644C: jo 00496BDDh
  '00496452: or ecx, eax
  '00496454: mov edx, [ebp+1Ch]
  '00496457: mov ax, [edx]
  '0049645A: neg ax
  '0049645D: movsx edx, ax
  '00496460: imul edx, 20h
  '00496463: jo 00496BDDh
  '00496469: or ecx, edx
  '0049646B: or ecx, 00000002h
  '0049646E: mov eax, [ebp-00000140h]
  '00496474: and eax, 00000001h
  '00496477: or ecx, eax
  '00496479: mov [ebp-0000013Ch], ecx
  '0049647F: mov [ebp-04h], 00000006h
  '00496486: mov ecx, [ebp+4Ch]
  '00496489: cmp [ecx], 00000000h
  '0049648C: jnz 4964B7h
  '0049648E: mov [ebp-04h], 00000007h
  '00496495: mov edx, [ebp-0000013Ch]
  '0049649B: or edx, 00000004h
  '0049649E: mov [ebp-0000013Ch], edx
  '004964A4: mov [ebp-04h], 00000008h
  '004964AB: mov [ebp-00000144h], 000003E8h
  '004964B5: jmp 4964DDh
  '004964B7: mov [ebp-04h], 0000000Ah
  '004964BE: mov eax, [ebp-0000013Ch]
  '004964C4: or al, 08h
  '004964C6: mov [ebp-0000013Ch], eax
  '004964CC: mov [ebp-04h], 0000000Bh
  '004964D3: mov [ebp-00000144h], 00000064h
  '004964DD: mov [ebp-04h], 0000000Dh
  '004964E4: mov [ebp-00000134h], 00000054h
  '004964EE: mov [ebp-04h], 0000000Eh
  '004964F5: mov ecx, [ebp+0Ch]
  '004964F8: mov edx, [ecx]
  '004964FA: mov [ebp-00000130h], edx
  '00496500: mov [ebp-04h], 0000000Fh
  '00496507: mov eax, [ebp+30h]
  '0049650A: mov ecx, [eax]
  '0049650C: imul ecx, [ebp-00000144h]
  '00496513: jo 00496BDDh
  '00496519: mov [ebp-00000104h], ecx
  '0049651F: mov [ebp-04h], 00000010h
  '00496526: mov edx, [ebp+20h]
  '00496529: mov eax, [edx]
  '0049652B: imul eax, [ebp-00000144h]
  '00496532: jo 00496BDDh
  '00496538: mov [ebp-00000108h], eax
  '0049653E: mov [ebp-04h], 00000011h
  '00496545: mov ecx, [ebp+38h]
  '00496548: mov edx, [ecx]
  '0049654A: imul edx, [ebp-00000144h]
  '00496551: jo 00496BDDh
  '00496557: mov [ebp-000000FCh], edx
  '0049655D: mov [ebp-04h], 00000012h
  '00496564: mov eax, [ebp+28h]
  '00496567: mov ecx, [eax]
  '00496569: imul ecx, [ebp-00000144h]
  '00496570: jo 00496BDDh
  '00496576: mov [ebp-00000100h], ecx
  '0049657C: mov [ebp-04h], 00000013h
  '00496583: mov edx, [ebp+34h]
  '00496586: mov eax, [edx]
  '00496588: imul eax, [ebp-00000144h]
  '0049658F: jo 00496BDDh
  '00496595: mov [ebp-00000114h], eax
  '0049659B: mov [ebp-04h], 00000014h
  '004965A2: mov ecx, [ebp+24h]
  '004965A5: mov edx, [ecx]
  '004965A7: imul edx, [ebp-00000144h]
  '004965AE: jo 00496BDDh
  '004965B4: mov [ebp-00000118h], edx
  '004965BA: mov [ebp-04h], 00000015h
  '004965C1: mov eax, [ebp+3Ch]
  '004965C4: mov ecx, [eax]
  '004965C6: imul ecx, [ebp-00000144h]
  '004965CD: jo 00496BDDh
  '004965D3: mov [ebp-0000010Ch], ecx
  '004965D9: mov [ebp-04h], 00000016h
  '004965E0: mov edx, [ebp+2Ch]
  '004965E3: mov eax, [edx]
  '004965E5: imul eax, [ebp-00000144h]
  '004965EC: jo 00496BDDh
  '004965F2: mov [ebp-00000110h], eax
  '004965F8: mov [ebp-04h], 00000017h
  '004965FF: mov ecx, [ebp-0000013Ch]
  '00496605: mov [ebp-00000124h], ecx
  '0049660B: mov [ebp-04h], 00000018h
  '00496612: lea edx, [ebp-00000134h]
  '00496618: push edx
  '00496619: call 0041388Ch
  '0049661E: mov [ebp-00000168h], ax
  '00496625: call [004010A4h]
  '0049662B: movsx eax, word ptr [ebp-00000168h]
  '00496632: test eax, eax
  '00496634: jz 00496BA9h
  '0049663A: mov [ebp-04h], 00000019h
  '00496641: mov word ptr [ebp-00000138h], FFFFh
  '0049664A: mov [ebp-04h], 0000001Ah
  '00496651: fild dword ptr [ebp-00000104h]
  '00496657: fstp real8 ptr [ebp-00000204h]
  '0049665D: fild dword ptr [ebp-00000144h]
  '00496663: fstp real8 ptr [ebp-0000020Ch]
  '00496669: fld real8 ptr [ebp-00000204h]
  '0049666F: cmp [004A0000h], 00000000h
  '00496676: jnz 496680h
  '00496678: fdiv real8 ptr [ebp-0000020Ch]
  '0049667E: jmp 496691h
  '00496680: push [ebp-00000208h]
  '00496686: push [ebp-0000020Ch]
  '0049668C: call 004037B4h
  '00496691: fstsw ax
  '00496693: test al, 0Dh
  '00496695: jnz 00496BD8h
  '0049669B: call [00401320h]
  '004966A1: mov ecx, [ebp+30h]
  '004966A4: mov [ecx], eax
  '004966A6: mov [ebp-04h], 0000001Bh
  '004966AD: fild dword ptr [ebp-00000108h]
  '004966B3: fstp real8 ptr [ebp-00000214h]
  '004966B9: fild dword ptr [ebp-00000144h]
  '004966BF: fstp real8 ptr [ebp-0000021Ch]
  '004966C5: fld real8 ptr [ebp-00000214h]
  '004966CB: cmp [004A0000h], 00000000h
  '004966D2: jnz 4966DCh
  '004966D4: fdiv real8 ptr [ebp-0000021Ch]
  '004966DA: jmp 4966EDh
  '004966DC: push [ebp-00000218h]
  '004966E2: push [ebp-0000021Ch]
  '004966E8: call 004037B4h
  '004966ED: fstsw ax
  '004966EF: test al, 0Dh
  '004966F1: jnz 00496BD8h
  '004966F7: call [00401320h]
  '004966FD: mov edx, [ebp+20h]
  '00496700: mov [edx], eax
  '00496702: mov [ebp-04h], 0000001Ch
  '00496709: fild dword ptr [ebp-000000FCh]
  '0049670F: fstp real8 ptr [ebp-00000224h]
  '00496715: fild dword ptr [ebp-00000144h]
  '0049671B: fstp real8 ptr [ebp-0000022Ch]
  '00496721: fld real8 ptr [ebp-00000224h]
  '00496727: cmp [004A0000h], 00000000h
  '0049672E: jnz 496738h
  '00496730: fdiv real8 ptr [ebp-0000022Ch]
  '00496736: jmp 496749h
  '00496738: push [ebp-00000228h]
  '0049673E: push [ebp-0000022Ch]
  '00496744: call 004037B4h
  '00496749: fstsw ax
  '0049674B: test al, 0Dh
  '0049674D: jnz 00496BD8h
  '00496753: call [00401320h]
  '00496759: mov ecx, [ebp+38h]
  '0049675C: mov [ecx], eax
  '0049675E: mov [ebp-04h], 0000001Dh
  '00496765: fild dword ptr [ebp-00000100h]
  '0049676B: fstp real8 ptr [ebp-00000234h]
  '00496771: fild dword ptr [ebp-00000144h]
  '00496777: fstp real8 ptr [ebp-0000023Ch]
  '0049677D: fld real8 ptr [ebp-00000234h]
  '00496783: cmp [004A0000h], 00000000h
  '0049678A: jnz 496794h
  '0049678C: fdiv real8 ptr [ebp-0000023Ch]
  '00496792: jmp 4967A5h
  '00496794: push [ebp-00000238h]
  '0049679A: push [ebp-0000023Ch]
  '004967A0: call 004037B4h
  '004967A5: fstsw ax
  '004967A7: test al, 0Dh
  '004967A9: jnz 00496BD8h
  '004967AF: call [00401320h]
  '004967B5: mov edx, [ebp+28h]
  '004967B8: mov [edx], eax
  '004967BA: mov [ebp-04h], 0000001Eh
  '004967C1: fild dword ptr [ebp-00000114h]
  '004967C7: fstp real8 ptr [ebp-00000244h]
  '004967CD: fild dword ptr [ebp-00000144h]
  '004967D3: fstp real8 ptr [ebp-0000024Ch]
  '004967D9: fld real8 ptr [ebp-00000244h]
  '004967DF: cmp [004A0000h], 00000000h
  '004967E6: jnz 4967F0h
  '004967E8: fdiv real8 ptr [ebp-0000024Ch]
  '004967EE: jmp 496801h
  '004967F0: push [ebp-00000248h]
  '004967F6: push [ebp-0000024Ch]
  '004967FC: call 004037B4h
  '00496801: fstsw ax
  '00496803: test al, 0Dh
  '00496805: jnz 00496BD8h
  '0049680B: call [00401320h]
  '00496811: mov ecx, [ebp+34h]
  '00496814: mov [ecx], eax
  '00496816: mov [ebp-04h], 0000001Fh
  '0049681D: fild dword ptr [ebp-00000118h]
  '00496823: fstp real8 ptr [ebp-00000254h]
  '00496829: fild dword ptr [ebp-00000144h]
  '0049682F: fstp real8 ptr [ebp-0000025Ch]
  '00496835: fld real8 ptr [ebp-00000254h]
  '0049683B: cmp [004A0000h], 00000000h
  '00496842: jnz 49684Ch
  '00496844: fdiv real8 ptr [ebp-0000025Ch]
  '0049684A: jmp 49685Dh
  '0049684C: push [ebp-00000258h]
  '00496852: push [ebp-0000025Ch]
  '00496858: call 004037B4h
  '0049685D: fstsw ax
  '0049685F: test al, 0Dh
  '00496861: jnz 00496BD8h
  '00496867: call [00401320h]
  '0049686D: mov edx, [ebp+24h]
  '00496870: mov [edx], eax
  '00496872: mov [ebp-04h], 00000020h
  '00496879: fild dword ptr [ebp-0000010Ch]
  '0049687F: fstp real8 ptr [ebp-00000264h]
  '00496885: fild dword ptr [ebp-00000144h]
  '0049688B: fstp real8 ptr [ebp-0000026Ch]
  '00496891: fld real8 ptr [ebp-00000264h]
  '00496897: cmp [004A0000h], 00000000h
  '0049689E: jnz 4968A8h
  '004968A0: fdiv real8 ptr [ebp-0000026Ch]
  '004968A6: jmp 4968B9h
  '004968A8: push [ebp-00000268h]
  '004968AE: push [ebp-0000026Ch]
  '004968B4: call 004037B4h
  '004968B9: fstsw ax
  '004968BB: test al, 0Dh
  '004968BD: jnz 00496BD8h
  '004968C3: call [00401320h]
  '004968C9: mov ecx, [ebp+3Ch]
  '004968CC: mov [ecx], eax
  '004968CE: mov [ebp-04h], 00000021h
  '004968D5: fild dword ptr [ebp-00000110h]
  '004968DB: fstp real8 ptr [ebp-00000274h]
  '004968E1: fild dword ptr [ebp-00000144h]
  '004968E7: fstp real8 ptr [ebp-0000027Ch]
  '004968ED: fld real8 ptr [ebp-00000274h]
  '004968F3: cmp [004A0000h], 00000000h
  '004968FA: jnz 496904h
  '004968FC: fdiv real8 ptr [ebp-0000027Ch]
  '00496902: jmp 496915h
  '00496904: push [ebp-00000278h]
  '0049690A: push [ebp-0000027Ch]
  '00496910: call 004037B4h
  '00496915: fstsw ax
  '00496917: test al, 0Dh
  '00496919: jnz 00496BD8h
  '0049691F: call [00401320h]
  '00496925: mov edx, [ebp+2Ch]
  '00496928: mov [edx], eax
  '0049692A: mov [ebp-04h], 00000022h
  '00496931: mov eax, [ebp-0000012Ch]
  '00496937: push eax
  '00496938: call 00413548h
  '0049693D: mov [ebp-0000016Ch], eax
  '00496943: call [004010A4h]
  '00496949: mov ecx, [ebp-0000016Ch]
  '0049694F: mov [ebp-24h], ecx
  '00496952: mov [ebp-04h], 00000023h
  '00496959: push 0000007Ah
  '0049695B: mov edx, [ebp-24h]
  '0049695E: push edx
  '0049695F: lea eax, [ebp-000000E0h]
  '00496965: push eax
  '00496966: lea ecx, [ebp-000001E8h]
  '0049696C: push ecx
  '0049696D: push 00413314h
  '00496972: call [004011E8h]
  '00496978: push eax
  '00496979: call 004101ECh
  '0049697E: call [004010A4h]
  '00496984: lea edx, [ebp-000001E8h]
  '0049698A: push edx
  '0049698B: lea eax, [ebp-000000E0h]
  '00496991: push eax
  '00496992: push 00413314h
  '00496997: call [0040107Ch]
  '0049699D: mov [ebp-04h], 00000024h
  '004969A4: mov ecx, [ebp-0000012Ch]
  '004969AA: push ecx
  '004969AB: call 0041361Ch
  '004969B0: call [004010A4h]
  '004969B6: mov [ebp-04h], 00000025h
  '004969BD: movsx edx, word ptr [ebp-00000092h]
  '004969C4: mov eax, [ebp+40h]
  '004969C7: mov [eax], edx
  '004969C9: mov [ebp-04h], 00000026h
  '004969D0: movsx ecx, word ptr [ebp-00000094h]
  '004969D7: mov edx, [ebp+44h]
  '004969DA: mov [edx], ecx
  '004969DC: mov [ebp-04h], 00000027h
  '004969E3: movsx eax, word ptr [ebp-00000086h]
  '004969EA: mov ecx, [ebp+48h]
  '004969ED: mov [ecx], eax
  '004969EF: mov [ebp-04h], 00000028h
  '004969F6: push FFFFFFFFh
  '004969F8: call [004010E8h]
  '004969FE: mov [ebp-04h], 00000029h
  '00496A05: push 00000000h
  '00496A07: mov edx, [ebp+50h]
  '00496A0A: mov eax, [edx]
  '00496A0C: push eax
  '00496A0D: call [004011FCh]
  '00496A13: movsx ecx, ax
  '00496A16: test ecx, ecx
  '00496A18: jnz 00496B9Ah
  '00496A1E: mov [ebp-04h], 0000002Ah
  '00496A25: mov dx, [ebp-0000008Ah]
  '00496A2C: mov [ebp-0000014Ch], dx
  '00496A33: mov [ebp-00000154h], 00000002h
  '00496A3D: mov eax, 00000010h
  '00496A42: call 00403790h
  '00496A47: mov eax, esp
  '00496A49: mov ecx, [ebp-00000154h]
  '00496A4F: mov [eax], ecx
  '00496A51: mov edx, [ebp-00000150h]
  '00496A57: mov [eax+04h], edx
  '00496A5A: mov ecx, [ebp-0000014Ch]
  '00496A60: mov [eax+08h], ecx
  '00496A63: mov edx, [ebp-00000148h]
  '00496A69: mov [eax+0Ch], edx
  '00496A6C: push 00421BDCh
  '00496A71: mov eax, [ebp+50h]
  '00496A74: mov ecx, [eax]
  '00496A76: push ecx
  '00496A77: call [004010CCh]
  '00496A7D: mov [ebp-04h], 0000002Bh
  '00496A84: mov dx, [ebp-00000094h]
  '00496A8B: mov [ebp-0000014Ch], dx
  '00496A92: mov [ebp-00000154h], 00000002h
  '00496A9C: mov eax, 00000010h
  '00496AA1: call 00403790h
  '00496AA6: mov eax, esp
  '00496AA8: mov ecx, [ebp-00000154h]
  '00496AAE: mov [eax], ecx
  '00496AB0: mov edx, [ebp-00000150h]
  '00496AB6: mov [eax+04h], edx
  '00496AB9: mov ecx, [ebp-0000014Ch]
  '00496ABF: mov [eax+08h], ecx
  '00496AC2: mov edx, [ebp-00000148h]
  '00496AC8: mov [eax+0Ch], edx
  '00496ACB: push 00421BECh
  '00496AD0: mov eax, [ebp+50h]
  '00496AD3: mov ecx, [eax]
  '00496AD5: push ecx
  '00496AD6: call [004010CCh]
  '00496ADC: mov [ebp-04h], 0000002Ch
  '00496AE3: mov dx, [ebp-00000092h]
  '00496AEA: mov [ebp-0000014Ch], dx
  '00496AF1: mov [ebp-00000154h], 00000002h
  '00496AFB: mov eax, 00000010h
  '00496B00: call 00403790h
  '00496B05: mov eax, esp
  '00496B07: mov ecx, [ebp-00000154h]
  '00496B0D: mov [eax], ecx
  '00496B0F: mov edx, [ebp-00000150h]
  '00496B15: mov [eax+04h], edx
  '00496B18: mov ecx, [ebp-0000014Ch]
  '00496B1E: mov [eax+08h], ecx
  '00496B21: mov edx, [ebp-00000148h]
  '00496B27: mov [eax+0Ch], edx
  '00496B2A: push 00421B38h
  '00496B2F: mov eax, [ebp+50h]
  '00496B32: mov ecx, [eax]
  '00496B34: push ecx
  '00496B35: call [004010CCh]
  '00496B3B: mov [ebp-04h], 0000002Dh
  '00496B42: mov dx, [ebp-00000086h]
  '00496B49: mov [ebp-0000014Ch], dx
  '00496B50: mov [ebp-00000154h], 00000002h
  '00496B5A: mov eax, 00000010h
  '00496B5F: call 00403790h
  '00496B64: mov eax, esp
  '00496B66: mov ecx, [ebp-00000154h]
  '00496B6C: mov [eax], ecx
  '00496B6E: mov edx, [ebp-00000150h]
  '00496B74: mov [eax+04h], edx
  '00496B77: mov ecx, [ebp-0000014Ch]
  '00496B7D: mov [eax+08h], ecx
  '00496B80: mov edx, [ebp-00000148h]
  '00496B86: mov [eax+0Ch], edx
  '00496B89: push 00420ED4h
  '00496B8E: mov eax, [ebp+50h]
  '00496B91: mov ecx, [eax]
  '00496B93: push ecx
  '00496B94: call [004010CCh]
  '00496B9A: mov [ebp-04h], 0000002Fh
  '00496BA1: push 00000000h
  '00496BA3: call [004010E8h]
  '00496BA9: mov edx, [ebp+08h]
  '00496BAC: mov eax, [edx]
  '00496BAE: mov ecx, [ebp+08h]
  '00496BB1: push ecx
  '00496BB2: call [eax+08h]
  '00496BB5: mov edx, [ebp+58h]
  '00496BB8: mov ax, [ebp-00000138h]
  '00496BBF: mov [edx], ax
  '00496BC2: mov eax, [ebp-10h]
  '00496BC5: mov ecx, [ebp-20h]
  '00496BC8: mov fs:[00000000h], ecx
  '00496BCF: pop edi
  '00496BD0: pop esi
  '00496BD1: pop ebx
  '00496BD2: mov esp, ebp
  '00496BD4: pop ebp
  '00496BD5: retn 0054h
End Sub
Private Sub unknown_494990
  '00494990: push ebp
  '00494991: mov ebp, esp
  '00494993: sub esp, 0000000Ch
  '00494996: push 00403796h
  '0049499B: mov eax, fs:[00h]
  '004949A1: push eax
  '004949A2: mov fs:[00000000h], esp
  '004949A9: sub esp, 00000014h
  '004949AC: push ebx
  '004949AD: push esi
  '004949AE: push edi
  '004949AF: mov [ebp-0Ch], esp
  '004949B2: mov [ebp-08h], 00402D60h
  '004949B9: mov ecx, [ebp+10h]
  '004949BC: mov esi, [ebp+0Ch]
  '004949BF: xor eax, eax
  '004949C1: mov [ecx], eax
  '004949C3: mov edx, [esi]
  '004949C5: mov [ebp-18h], eax
  '004949C8: mov [ebp-1Ch], eax
  '004949CB: lea eax, [ebp-1Ch]
  '004949CE: push edx
  '004949CF: push eax
  '004949D0: call [0040130Ch]
  '004949D6: push eax
  '004949D7: call 00413428h
  '004949DC: mov edi, eax
  '004949DE: call [004010A4h]
  '004949E4: mov ecx, [ebp-1Ch]
  '004949E7: push ecx
  '004949E8: push esi
  '004949E9: call [00401228h]
  '004949EF: mov edx, [esi]
  '004949F1: push edi
  '004949F2: push edx
  '004949F3: call [0040131Ch]
  '004949F9: mov edx, eax
  '004949FB: lea ecx, [ebp-18h]
  '004949FE: call [00401348h]
  '00494A04: lea ecx, [ebp-1Ch]
  '00494A07: call [0040138Ch]
  '00494A0D: push 00494A2Eh
  '00494A12: jmp 494A2Dh
  '00494A14: test byte ptr [ebp-04h], 04h
  '00494A18: jz 494A23h
  '00494A1A: lea ecx, [ebp-18h]
  '00494A1D: call [0040138Ch]
  '00494A23: lea ecx, [ebp-1Ch]
  '00494A26: call [0040138Ch]
  '00494A2C: ret 
End Sub
Private Sub unknown_494F10
  '00494F10: push ebp
  '00494F11: mov ebp, esp
  '00494F13: sub esp, 0000000Ch
  '00494F16: push 00403796h
  '00494F1B: mov eax, fs:[00h]
  '00494F21: push eax
  '00494F22: mov fs:[00000000h], esp
  '00494F29: sub esp, 0000003Ch
  '00494F2C: push ebx
  '00494F2D: push esi
  '00494F2E: push edi
  '00494F2F: mov [ebp-0Ch], esp
  '00494F32: mov [ebp-08h], 00402D80h
  '00494F39: mov edx, [ebp+0Ch]
  '00494F3C: xor esi, esi
  '00494F3E: lea ecx, [ebp-24h]
  '00494F41: mov [ebp-20h], esi
  '00494F44: mov [ebp-24h], esi
  '00494F47: mov [ebp-28h], esi
  '00494F4A: mov [ebp-38h], esi
  '00494F4D: call [004012C4h]
  '00494F53: mov ecx, [ebp-24h]
  '00494F56: mov eax, [ebp+14h]
  '00494F59: push ecx
  '00494F5A: push 0040FE84h
  '00494F5F: mov [eax], esi
  '00494F61: mov edi, 00000001h
  '00494F66: call [00401184h]
  '00494F6C: test eax, eax
  '00494F6E: jz 0049502Ch
  '00494F74: mov ebx, [00401348h]
  '00494F7A: mov edx, [ebp-24h]
  '00494F7D: push edi
  '00494F7E: push edx
  '00494F7F: push 00421BACh
  '00494F84: push esi
  '00494F85: mov esi, [004012A0h]
  '00494F8B: call esi
  '00494F8D: test eax, eax
  '00494F8F: jz 0049502Ch
  '00494F95: add eax, 00000001h
  '00494F98: jo 0049507Ah
  '00494F9E: push eax
  '00494F9F: mov eax, [ebp-24h]
  '00494FA2: push eax
  '00494FA3: push 00421BACh
  '00494FA8: push 00000000h
  '00494FAA: call esi
  '00494FAC: mov esi, eax
  '00494FAE: test esi, esi
  '00494FB0: jz 494FD1h
  '00494FB2: mov eax, [ebp-24h]
  '00494FB5: mov ecx, esi
  '00494FB7: lea edx, [ebp-38h]
  '00494FBA: sub ecx, edi
  '00494FBC: push edx
  '00494FBD: push edi
  '00494FBE: jo 0049507Ah
  '00494FC4: mov [ebp-30h], ecx
  '00494FC7: mov [ebp-38h], 00000003h
  '00494FCE: push eax
  '00494FCF: jmp 494FE8h
  '00494FD1: mov edx, [ebp-24h]
  '00494FD4: lea ecx, [ebp-38h]
  '00494FD7: push ecx
  '00494FD8: push edi
  '00494FD9: mov [ebp-30h], 80020004h
  '00494FE0: mov [ebp-38h], 0000000Ah
  '00494FE7: push edx
  '00494FE8: call [00401138h]
  '00494FEE: mov edx, eax
  '00494FF0: lea ecx, [ebp-28h]
  '00494FF3: call ebx
  '00494FF5: lea ecx, [ebp-38h]
  '00494FF8: call [00401034h]
  '00494FFE: mov eax, [ebp+10h]
  '00495001: add esi, 00000001h
  '00495004: jo 49507Ah
  '00495006: cmp eax, 00000001h
  '00495009: mov edi, esi
  '0049500B: jz 495020h
  '0049500D: sub eax, 00000001h
  '00495010: jo 49507Ah
  '00495012: test eax, eax
  '00495014: mov [ebp+10h], eax
  '00495017: jz 49502Ch
  '00495019: xor esi, esi
  '0049501B: jmp 00494F7Ah
  '00495020: mov edx, [ebp-28h]
  '00495023: lea ecx, [ebp-20h]
  '00495026: call [004012C4h]
  '0049502C: push 0049505Dh
  '00495031: jmp 49504Ch
  '00495033: test byte ptr [ebp-04h], 04h
  '00495037: jz 495042h
  '00495039: lea ecx, [ebp-20h]
  '0049503C: call [0040138Ch]
  '00495042: lea ecx, [ebp-38h]
  '00495045: call [00401034h]
  '0049504B: ret 
End Sub
Private Sub unknown_495490
  '00495490: push ebx
  '00495491: push ebp
  '00495492: mov ebp, [esp+0Ch]
  '00495496: push esi
  '00495497: push edi
  '00495498: xor esi, esi
  '0049549A: movsx edi, si
  '0049549D: push edi
  '0049549E: call 004137ACh
  '004954A3: mov ebx, eax
  '004954A5: call [004010A4h]
  '004954AB: cmp edi, 00000010h
  '004954AE: jb 4954B6h
  '004954B0: call [00401170h]
  '004954B6: mov eax, [ebp+44h]
  '004954B9: add si, 0001h
  '004954BD: jo 4954D7h
  '004954BF: cmp si, 000Fh
  '004954C3: mov [eax+edi*4], ebx
  '004954C6: jle 49549Ah
  '004954C8: pop edi
  '004954C9: mov word ptr [ebp+50h], FFFFh
  '004954CF: pop esi
  '004954D0: pop ebp
  '004954D1: xor eax, eax
  '004954D3: pop ebx
  '004954D4: retn 0004h
End Sub
Private Sub unknown_496330
  '00496330: sub esp, 000000BCh
  '00496336: mov ecx, 0000002Fh
  '0049633B: xor eax, eax
  '0049633D: push esi
  '0049633E: push edi
  '0049633F: lea edi, [esp+08h]
  '00496343: rep stosd 
  '00496345: mov eax, [esp+000000C8h]
  '0049634C: lea ecx, [esp+08h]
  '00496350: add eax, 0000005Ch
  '00496353: push eax
  '00496354: push ecx
  '00496355: push 000000BCh
  '0049635A: call [00401088h]
  '00496360: mov ecx, 0000002Fh
  '00496365: lea esi, [esp+08h]
  '00496369: mov edi, [esp+000000CCh]
  '00496370: xor eax, eax
  '00496372: rep movsd 
  '00496374: pop edi
  '00496375: pop esi
  '00496376: add esp, 000000BCh
  '0049637C: retn 0008h
End Sub
Private Sub unknown_496BF0
  '00496BF0: push ebp
  '00496BF1: mov ebp, esp
  '00496BF3: sub esp, 00000008h
  '00496BF6: push 00403796h
  '00496BFB: mov eax, fs:[00h]
  '00496C01: push eax
  '00496C02: mov fs:[00000000h], esp
  '00496C09: sub esp, 00000098h
  '00496C0F: push ebx
  '00496C10: push esi
  '00496C11: push edi
  '00496C12: mov [ebp-08h], esp
  '00496C15: mov [ebp-04h], 00402FC0h
  '00496C1C: mov eax, [ebp+0Ch]
  '00496C1F: xor edi, edi
  '00496C21: mov [ebp-14h], edi
  '00496C24: mov [ebp-18h], edi
  '00496C27: mov ecx, [eax]
  '00496C29: mov eax, [4A0F98h]
  '00496C2E: cmp ecx, 000003E8h
  '00496C34: mov [ebp-1Ch], edi
  '00496C37: mov [ebp-20h], edi
  '00496C3A: mov [ebp-30h], edi
  '00496C3D: mov [ebp-40h], edi
  '00496C40: mov [ebp-50h], edi
  '00496C43: mov [ebp-60h], edi
  '00496C46: mov [ebp-70h], edi
  '00496C49: mov [ebp-00000094h], edi
  '00496C4F: jle 00496D8Ah
  '00496C55: cmp eax, edi
  '00496C57: jnz 496C69h
  '00496C59: push 004A0F98h
  '00496C5E: push 0040FFF4h
  '00496C63: call [004012A8h]
  '00496C69: mov esi, [004A0F98h]
  '00496C6F: lea edx, [ebp-20h]
  '00496C72: push edx
  '00496C73: push esi
  '00496C74: mov ecx, [esi]
  '00496C76: call [ecx+14h]
  '00496C79: cmp eax, edi
  '00496C7B: fclex 
  '00496C7D: jnl 496C92h
  '00496C7F: mov ebx, [004010A8h]
  '00496C85: push 00000014h
  '00496C87: push 0040FFE4h
  '00496C8C: push esi
  '00496C8D: push eax
  '00496C8E: call ebx
  '00496C90: jmp 496C98h
  '00496C92: mov ebx, [004010A8h]
  '00496C98: mov eax, [ebp-20h]
  '00496C9B: lea edx, [ebp-1Ch]
  '00496C9E: push edx
  '00496C9F: push eax
  '00496CA0: mov ecx, [eax]
  '00496CA2: mov esi, eax
  '00496CA4: call [ecx+58h]
  '00496CA7: cmp eax, edi
  '00496CA9: fclex 
  '00496CAB: jnl 496CB8h
  '00496CAD: push 00000058h
  '00496CAF: push 00410004h
  '00496CB4: push esi
  '00496CB5: push eax
  '00496CB6: call ebx
  '00496CB8: mov eax, [ebp-1Ch]
  '00496CBB: push eax
  '00496CBC: push 00421C0Ch
  '00496CC1: call [00401094h]
  '00496CC7: mov edx, eax
  '00496CC9: lea ecx, [ebp-18h]
  '00496CCC: call [00401348h]
  '00496CD2: lea ecx, [ebp-1Ch]
  '00496CD5: call [0040138Ch]
  '00496CDB: mov edi, [00401388h]
  '00496CE1: lea ecx, [ebp-20h]
  '00496CE4: call edi
  '00496CE6: mov eax, [ebp+08h]
  '00496CE9: lea edx, [ebp-00000094h]
  '00496CEF: push edx
  '00496CF0: mov edx, [ebp+0Ch]
  '00496CF3: mov ecx, [eax]
  '00496CF5: push edx
  '00496CF6: push eax
  '00496CF7: call [ecx+64h]
  '00496CFA: call [004012E0h]
  '00496D00: push eax
  '00496D01: lea eax, [ebp-20h]
  '00496D04: push eax
  '00496D05: call [004010F0h]
  '00496D0B: mov ecx, 80020004h
  '00496D10: lea edx, [ebp-18h]
  '00496D13: mov [ebp-38h], ecx
  '00496D16: mov [ebp-28h], ecx
  '00496D19: lea ecx, [ebp-14h]
  '00496D1C: mov esi, eax
  '00496D1E: mov [ebp-68h], ecx
  '00496D21: lea ecx, [ebp-40h]
  '00496D24: mov [ebp-58h], edx
  '00496D27: mov eax, 0000000Ah
  '00496D2C: push ecx
  '00496D2D: lea edx, [ebp-30h]
  '00496D30: lea ecx, [ebp-70h]
  '00496D33: mov [ebp-40h], eax
  '00496D36: mov [ebp-30h], eax
  '00496D39: push edx
  '00496D3A: mov eax, 00004008h
  '00496D3F: push ecx
  '00496D40: mov ecx, [ebp-00000094h]
  '00496D46: lea edx, [ebp-60h]
  '00496D49: mov [ebp-70h], eax
  '00496D4C: mov [ebp-60h], eax
  '00496D4F: mov eax, [esi]
  '00496D51: push edx
  '00496D52: push ecx
  '00496D53: push esi
  '00496D54: call [eax+44h]
  '00496D57: test eax, eax
  '00496D59: fclex 
  '00496D5B: jnl 496D68h
  '00496D5D: push 00000044h
  '00496D5F: push 00411C80h
  '00496D64: push esi
  '00496D65: push eax
  '00496D66: call ebx
  '00496D68: lea ecx, [ebp-20h]
  '00496D6B: call edi
  '00496D6D: lea edx, [ebp-40h]
  '00496D70: lea eax, [ebp-30h]
  '00496D73: push edx
  '00496D74: push eax
  '00496D75: push 00000002h
  '00496D77: call [00401058h]
  '00496D7D: add esp, 0000000Ch
  '00496D80: push 00496EE2h
  '00496D85: jmp 00496ED1h
  '00496D8A: cmp eax, edi
  '00496D8C: jnz 496D9Eh
  '00496D8E: push 004A0F98h
  '00496D93: push 0040FFF4h
  '00496D98: call [004012A8h]
  '00496D9E: mov esi, [004A0F98h]
  '00496DA4: lea edx, [ebp-20h]
  '00496DA7: push edx
  '00496DA8: push esi
  '00496DA9: mov ecx, [esi]
  '00496DAB: call [ecx+14h]
  '00496DAE: cmp eax, edi
  '00496DB0: fclex 
  '00496DB2: jnl 496DC7h
  '00496DB4: mov ebx, [004010A8h]
  '00496DBA: push 00000014h
  '00496DBC: push 0040FFE4h
  '00496DC1: push esi
  '00496DC2: push eax
  '00496DC3: call ebx
  '00496DC5: jmp 496DCDh
  '00496DC7: mov ebx, [004010A8h]
  '00496DCD: mov eax, [ebp-20h]
  '00496DD0: lea edx, [ebp-1Ch]
  '00496DD3: push edx
  '00496DD4: push eax
  '00496DD5: mov ecx, [eax]
  '00496DD7: mov esi, eax
  '00496DD9: call [ecx+58h]
  '00496DDC: cmp eax, edi
  '00496DDE: fclex 
  '00496DE0: jnl 496DEDh
  '00496DE2: push 00000058h
  '00496DE4: push 00410004h
  '00496DE9: push esi
  '00496DEA: push eax
  '00496DEB: call ebx
  '00496DED: mov eax, [ebp-1Ch]
  '00496DF0: push eax
  '00496DF1: push 00421C2Ch
  '00496DF6: call [00401094h]
  '00496DFC: mov edx, eax
  '00496DFE: lea ecx, [ebp-18h]
  '00496E01: call [00401348h]
  '00496E07: lea ecx, [ebp-1Ch]
  '00496E0A: call [0040138Ch]
  '00496E10: mov edi, [00401388h]
  '00496E16: lea ecx, [ebp-20h]
  '00496E19: call edi
  '00496E1B: call [004012E0h]
  '00496E21: lea ecx, [ebp-20h]
  '00496E24: push eax
  '00496E25: push ecx
  '00496E26: call [004010F0h]
  '00496E2C: mov ecx, 80020004h
  '00496E31: lea edx, [ebp-18h]
  '00496E34: mov [ebp-48h], ecx
  '00496E37: mov [ebp-38h], ecx
  '00496E3A: mov [ebp-28h], ecx
  '00496E3D: lea ecx, [ebp-50h]
  '00496E40: mov [ebp-58h], edx
  '00496E43: push ecx
  '00496E44: lea edx, [ebp-40h]
  '00496E47: lea ecx, [ebp-30h]
  '00496E4A: push edx
  '00496E4B: push ecx
  '00496E4C: mov ecx, [ebp+0Ch]
  '00496E4F: lea edx, [ebp-60h]
  '00496E52: mov esi, eax
  '00496E54: mov eax, 0000000Ah
  '00496E59: push edx
  '00496E5A: mov edx, [ecx]
  '00496E5C: mov [ebp-50h], eax
  '00496E5F: mov [ebp-40h], eax
  '00496E62: mov [ebp-30h], eax
  '00496E65: mov [ebp-60h], 00004008h
  '00496E6C: mov eax, [esi]
  '00496E6E: push edx
  '00496E6F: push esi
  '00496E70: call [eax+44h]
  '00496E73: test eax, eax
  '00496E75: fclex 
  '00496E77: jnl 496E84h
  '00496E79: push 00000044h
  '00496E7B: push 00411C80h
  '00496E80: push esi
  '00496E81: push eax
  '00496E82: call ebx
  '00496E84: lea ecx, [ebp-20h]
  '00496E87: call edi
  '00496E89: lea eax, [ebp-50h]
  '00496E8C: lea ecx, [ebp-40h]
  '00496E8F: push eax
  '00496E90: lea edx, [ebp-30h]
  '00496E93: push ecx
  '00496E94: push edx
  '00496E95: push 00000003h
  '00496E97: call [00401058h]
  '00496E9D: add esp, 00000010h
  '00496EA0: push 00496EE2h
  '00496EA5: jmp 496ED1h
  '00496EA7: lea ecx, [ebp-1Ch]
  '00496EAA: call [0040138Ch]
  '00496EB0: lea ecx, [ebp-20h]
  '00496EB3: call [00401388h]
  '00496EB9: lea eax, [ebp-50h]
  '00496EBC: lea ecx, [ebp-40h]
  '00496EBF: push eax
  '00496EC0: lea edx, [ebp-30h]
  '00496EC3: push ecx
  '00496EC4: push edx
  '00496EC5: push 00000003h
  '00496EC7: call [00401058h]
  '00496ECD: add esp, 00000010h
  '00496ED0: ret 
End Sub
Private Sub unknown_496F00
  '00496F00: push ebp
  '00496F01: mov ebp, esp
  '00496F03: sub esp, 00000008h
  '00496F06: push 00403796h
  '00496F0B: mov eax, fs:[00h]
  '00496F11: push eax
  '00496F12: mov fs:[00000000h], esp
  '00496F19: sub esp, 0000003Ch
  '00496F1C: push ebx
  '00496F1D: push esi
  '00496F1E: push edi
  '00496F1F: mov [ebp-08h], esp
  '00496F22: mov [ebp-04h], 00402FD0h
  '00496F29: mov eax, [ebp+08h]
  '00496F2C: mov edi, [ebp+0Ch]
  '00496F2F: lea edx, [ebp-44h]
  '00496F32: xor esi, esi
  '00496F34: mov ecx, [eax]
  '00496F36: push edx
  '00496F37: lea edx, [ebp-40h]
  '00496F3A: mov [ebp-18h], esi
  '00496F3D: push edx
  '00496F3E: push eax
  '00496F3F: mov [ebp-1Ch], esi
  '00496F42: mov [ebp-2Ch], esi
  '00496F45: mov [ebp-30h], esi
  '00496F48: mov [ebp-44h], esi
  '00496F4B: mov [ebp-38h], edi
  '00496F4E: mov [ebp-40h], 00006011h
  '00496F55: call [ecx+68h]
  '00496F58: cmp [ebp-44h], si
  '00496F5C: jz 496FABh
  '00496F5E: mov eax, [ebp+10h]
  '00496F61: push esi
  '00496F62: lea ecx, [ebp-40h]
  '00496F65: push 00000080h
  '00496F6A: lea edx, [ebp-2Ch]
  '00496F6D: push ecx
  '00496F6E: push edx
  '00496F6F: mov [ebp-38h], eax
  '00496F72: mov [ebp-40h], 00004008h
  '00496F79: call [00401254h]
  '00496F7F: lea eax, [ebp-2Ch]
  '00496F82: lea ecx, [ebp-30h]
  '00496F85: push eax
  '00496F86: push ecx
  '00496F87: call [00401294h]
  '00496F8D: lea edx, [ebp-30h]
  '00496F90: push edx
  '00496F91: push edi
  '00496F92: call [00401030h]
  '00496F98: lea ecx, [ebp-2Ch]
  '00496F9B: call [00401034h]
  '00496FA1: push 004970F9h
  '00496FA6: jmp 004970F8h
  '00496FAB: mov eax, [edi]
  '00496FAD: push eax
  '00496FAE: push 00000001h
  '00496FB0: call [004011C0h]
  '00496FB6: mov ecx, [edi]
  '00496FB8: mov ebx, eax
  '00496FBA: push ecx
  '00496FBB: push 00000001h
  '00496FBD: call [00401264h]
  '00496FC3: mov esi, eax
  '00496FC5: sub esi, ebx
  '00496FC7: mov ebx, [ebp+10h]
  '00496FCA: jo 0049710Eh
  '00496FD0: mov edx, [ebx]
  '00496FD2: add esi, 00000001h
  '00496FD5: push edx
  '00496FD6: jo 0049710Eh
  '00496FDC: call [0040103Ch]
  '00496FE2: cmp eax, esi
  '00496FE4: jnl 497041h
  '00496FE6: mov eax, [ebx]
  '00496FE8: lea ecx, [ebp-2Ch]
  '00496FEB: push eax
  '00496FEC: push ecx
  '00496FED: push eax
  '00496FEE: mov [ebp-24h], 00000000h
  '00496FF5: mov [ebp-2Ch], 00000002h
  '00496FFC: call [0040103Ch]
  '00497002: mov edx, esi
  '00497004: sub edx, eax
  '00497006: jo 0049710Eh
  '0049700C: push edx
  '0049700D: call [0040122Ch]
  '00497013: mov edx, eax
  '00497015: lea ecx, [ebp-1Ch]
  '00497018: call [00401348h]
  '0049701E: push eax
  '0049701F: call [00401094h]
  '00497025: mov edx, eax
  '00497027: mov ecx, ebx
  '00497029: call [00401348h]
  '0049702F: lea ecx, [ebp-1Ch]
  '00497032: call [0040138Ch]
  '00497038: lea ecx, [ebp-2Ch]
  '0049703B: call [00401034h]
  '00497041: mov eax, [edi]
  '00497043: lea ecx, [ebp-18h]
  '00497046: push eax
  '00497047: push ecx
  '00497048: call [004012F8h]
  '0049704E: mov eax, [ebp-18h]
  '00497051: test eax, eax
  '00497053: jz 49707Fh
  '00497055: cmp word ptr [eax], 0001h
  '00497059: jnz 49707Fh
  '0049705B: mov edx, [edi]
  '0049705D: push edx
  '0049705E: push 00000001h
  '00497060: call [004011C0h]
  '00497066: mov edi, eax
  '00497068: mov eax, [ebp-18h]
  '0049706B: mov edx, [eax+14h]
  '0049706E: mov ecx, [eax+10h]
  '00497071: sub edi, edx
  '00497073: cmp edi, ecx
  '00497075: jb 497087h
  '00497077: call [00401170h]
  '0049707D: jmp 497087h
  '0049707F: call [00401170h]
  '00497085: mov edi, eax
  '00497087: mov eax, [ebx]
  '00497089: push esi
  '0049708A: lea ecx, [ebp-1Ch]
  '0049708D: push eax
  '0049708E: push ecx
  '0049708F: call [0040130Ch]
  '00497095: mov edx, [ebp-18h]
  '00497098: push eax
  '00497099: mov eax, [edx+0Ch]
  '0049709C: add eax, edi
  '0049709E: push eax
  '0049709F: call 004101ECh
  '004970A4: call [004010A4h]
  '004970AA: lea ecx, [ebp-18h]
  '004970AD: push ecx
  '004970AE: call [00401378h]
  '004970B4: mov edx, [ebp-1Ch]
  '004970B7: push edx
  '004970B8: push ebx
  '004970B9: call [00401228h]
  '004970BF: lea ecx, [ebp-1Ch]
  '004970C2: call [0040138Ch]
  '004970C8: push 004970F9h
  '004970CD: jmp 4970F8h
  '004970CF: lea eax, [ebp-18h]
  '004970D2: push eax
  '004970D3: call [00401378h]
  '004970D9: lea ecx, [ebp-1Ch]
  '004970DC: call [0040138Ch]
  '004970E2: lea ecx, [ebp-2Ch]
  '004970E5: call [00401034h]
  '004970EB: lea ecx, [ebp-30h]
  '004970EE: push ecx
  '004970EF: push 00000000h
  '004970F1: call [004010C8h]
  '004970F7: ret 
End Sub
Private Sub unknown_497120
  '00497120: push ebp
  '00497121: mov ebp, esp
  '00497123: sub esp, 0000000Ch
  '00497126: push 00403796h
  '0049712B: mov eax, fs:[00h]
  '00497131: push eax
  '00497132: mov fs:[00000000h], esp
  '00497139: sub esp, 0000002Ch
  '0049713C: push ebx
  '0049713D: push esi
  '0049713E: push edi
  '0049713F: mov [ebp-0Ch], esp
  '00497142: mov [ebp-08h], 00402FE0h
  '00497149: mov ecx, [ebp+10h]
  '0049714C: mov edx, [ebp+0Ch]
  '0049714F: xor eax, eax
  '00497151: mov [ebp-30h], edx
  '00497154: mov [ebp-18h], eax
  '00497157: mov [ebp-28h], eax
  '0049715A: mov [ecx], eax
  '0049715C: push eax
  '0049715D: lea eax, [ebp-38h]
  '00497160: push 00000040h
  '00497162: lea ecx, [ebp-28h]
  '00497165: push eax
  '00497166: push ecx
  '00497167: mov [ebp-38h], 00006011h
  '0049716E: call [00401254h]
  '00497174: lea edx, [ebp-28h]
  '00497177: push edx
  '00497178: call [00401048h]
  '0049717E: mov edx, eax
  '00497180: lea ecx, [ebp-18h]
  '00497183: call [00401348h]
  '00497189: lea ecx, [ebp-28h]
  '0049718C: call [00401034h]
  '00497192: push 004971B3h
  '00497197: jmp 4971B2h
  '00497199: test byte ptr [ebp-04h], 04h
  '0049719D: jz 4971A8h
  '0049719F: lea ecx, [ebp-18h]
  '004971A2: call [0040138Ch]
  '004971A8: lea ecx, [ebp-28h]
  '004971AB: call [00401034h]
  '004971B1: ret 
End Sub
Private Sub unknown_4971D0
  '004971D0: mov eax, [esp+08h]
  '004971D4: mov edx, [esp+0Ch]
  '004971D8: mov ecx, [eax]
  '004971DA: xor eax, eax
  '004971DC: or ecx, 80040000h
  '004971E2: mov [edx], ecx
  '004971E4: retn 000Ch
End Sub
Private Sub APIReturn_4971F0
  '004971F0: push ebp
  '004971F1: mov ebp, esp
  '004971F3: sub esp, 00000018h
  '004971F6: push 00403796h
  '004971FB: mov eax, fs:[00h]
  '00497201: push eax
  '00497202: mov fs:[00000000h], esp
  '00497209: mov eax, 0000006Ch
  '0049720E: call 00403790h
  '00497213: push ebx
  '00497214: push esi
  '00497215: push edi
  '00497216: mov [ebp-18h], esp
  '00497219: mov [ebp-14h], 00402FF0h
  '00497220: mov [ebp-10h], 00000000h
  '00497227: mov [ebp-0Ch], 00000000h
  '0049722E: mov [ebp-04h], 00000001h
  '00497235: mov [ebp-04h], 00000002h
  '0049723C: push FFFFFFFFh
  '0049723E: call [004010E8h]
  '00497244: mov [ebp-04h], 00000003h
  '0049724B: mov eax, [ebp+0Ch]
  '0049724E: push eax
  '0049724F: call [0040112Ch]
  '00497255: mov ecx, [eax]
  '00497257: push ecx
  '00497258: push 00000001h
  '0049725A: call [004011C0h]
  '00497260: mov [ebp-50h], eax
  '00497263: mov [ebp-58h], 00000003h
  '0049726A: mov eax, 00000010h
  '0049726F: call 00403790h
  '00497274: mov edx, esp
  '00497276: mov eax, [ebp-58h]
  '00497279: mov [edx], eax
  '0049727B: mov ecx, [ebp-54h]
  '0049727E: mov [edx+04h], ecx
  '00497281: mov eax, [ebp-50h]
  '00497284: mov [edx+08h], eax
  '00497287: mov ecx, [ebp-4Ch]
  '0049728A: mov [edx+0Ch], ecx
  '0049728D: push 00000001h
  '0049728F: mov edx, [ebp+0Ch]
  '00497292: push edx
  '00497293: lea eax, [ebp-48h]
  '00497296: push eax
  '00497297: call [00401104h]
  '0049729D: add esp, 0000001Ch
  '004972A0: mov edx, eax
  '004972A2: lea ecx, [ebp-34h]
  '004972A5: call [00401024h]
  '004972AB: mov [ebp-04h], 00000004h
  '004972B2: call [004012E0h]
  '004972B8: push eax
  '004972B9: lea ecx, [ebp-38h]
  '004972BC: push ecx
  '004972BD: call [004010F0h]
  '004972C3: mov [ebp-70h], eax
  '004972C6: lea edx, [ebp-6Ch]
  '004972C9: push edx
  '004972CA: mov eax, [ebp-70h]
  '004972CD: mov ecx, [eax]
  '004972CF: mov edx, [ebp-70h]
  '004972D2: push edx
  '004972D3: call [ecx+1Ch]
  '004972D6: fclex 
  '004972D8: mov [ebp-74h], eax
  '004972DB: cmp [ebp-74h], 00000000h
  '004972DF: jnl 4972FEh
  '004972E1: push 0000001Ch
  '004972E3: push 00411C80h
  '004972E8: mov eax, [ebp-70h]
  '004972EB: push eax
  '004972EC: mov ecx, [ebp-74h]
  '004972EF: push ecx
  '004972F0: call [004010A8h]
  '004972F6: mov [ebp-0000008Ch], eax
  '004972FC: jmp 497308h
  '004972FE: mov [ebp-0000008Ch], 00000000h
  '00497308: xor edx, edx
  '0049730A: cmp [ebp-6Ch], 00000000h
  '0049730E: setnz dl
  '00497311: neg edx
  '00497313: mov [ebp-24h], dx
  '00497317: lea ecx, [ebp-38h]
  '0049731A: call [00401388h]
  '00497320: push 00497344h
  '00497325: jmp 49733Ah
  '00497327: lea ecx, [ebp-38h]
  '0049732A: call [00401388h]
  '00497330: lea ecx, [ebp-48h]
  '00497333: call [00401034h]
  '00497339: ret 
End Sub

