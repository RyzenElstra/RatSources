 'VA: 41D1A4
Const cdata_0 = "(L"
 'VA: 41D1D8
Const cdata_1 = &H3C0010

Private Sub unknown_4FE140
  '004FE140: push ebp
  '004FE141: mov ebp, esp
  '004FE143: sub esp, 0000000Ch
  '004FE146: push 004081B6h
  '004FE14B: mov eax, fs:[00h]
  '004FE151: push eax
  '004FE152: mov fs:[00000000h], esp
  '004FE159: sub esp, 0000000Ch
  '004FE15C: push ebx
  '004FE15D: push esi
  '004FE15E: push edi
  '004FE15F: mov [ebp-0Ch], esp
  '004FE162: mov [ebp-08h], 00405C18h
  '004FE169: xor edi, edi
  '004FE16B: mov [ebp-04h], edi
  '004FE16E: mov esi, [ebp+08h]
  '004FE171: push esi
  '004FE172: mov eax, [esi]
  '004FE174: call [eax+04h]
  '004FE177: mov ecx, [esi+54h]
  '004FE17A: mov [ebp-18h], edi
  '004FE17D: mov [ebp-18h], ecx
  '004FE180: mov eax, [ebp+08h]
  '004FE183: push eax
  '004FE184: mov edx, [eax]
  '004FE186: call [edx+08h]
  '004FE189: mov eax, [ebp+0Ch]
  '004FE18C: mov ecx, [ebp-18h]
  '004FE18F: mov [eax], ecx
  '004FE191: mov eax, [ebp-04h]
  '004FE194: mov ecx, [ebp-14h]
  '004FE197: pop edi
  '004FE198: pop esi
  '004FE199: mov fs:[00000000h], ecx
  '004FE1A0: pop ebx
  '004FE1A1: mov esp, ebp
  '004FE1A3: pop ebp
  '004FE1A4: retn 0008h
End Sub
Private Sub unknown_4FE1B0
  '004FE1B0: push ebp
  '004FE1B1: mov ebp, esp
  '004FE1B3: sub esp, 0000000Ch
  '004FE1B6: push 004081B6h
  '004FE1BB: mov eax, fs:[00h]
  '004FE1C1: push eax
  '004FE1C2: mov fs:[00000000h], esp
  '004FE1C9: sub esp, 0000000Ch
  '004FE1CC: push ebx
  '004FE1CD: push esi
  '004FE1CE: push edi
  '004FE1CF: mov [ebp-0Ch], esp
  '004FE1D2: mov [ebp-08h], 00405C20h
  '004FE1D9: xor edi, edi
  '004FE1DB: mov [ebp-04h], edi
  '004FE1DE: mov esi, [ebp+08h]
  '004FE1E1: push esi
  '004FE1E2: mov eax, [esi]
  '004FE1E4: call [eax+04h]
  '004FE1E7: mov ecx, [esi+58h]
  '004FE1EA: mov [ebp-18h], edi
  '004FE1ED: mov [ebp-18h], ecx
  '004FE1F0: mov eax, [ebp+08h]
  '004FE1F3: push eax
  '004FE1F4: mov edx, [eax]
  '004FE1F6: call [edx+08h]
  '004FE1F9: mov eax, [ebp+0Ch]
  '004FE1FC: mov ecx, [ebp-18h]
  '004FE1FF: mov [eax], ecx
  '004FE201: mov eax, [ebp-04h]
  '004FE204: mov ecx, [ebp-14h]
  '004FE207: pop edi
  '004FE208: pop esi
  '004FE209: mov fs:[00000000h], ecx
  '004FE210: pop ebx
  '004FE211: mov esp, ebp
  '004FE213: pop ebp
  '004FE214: retn 0008h
End Sub
Private Sub unknown_4FE220
  '004FE220: push ebp
  '004FE221: mov ebp, esp
  '004FE223: sub esp, 0000000Ch
  '004FE226: push 004081B6h
  '004FE22B: mov eax, fs:[00h]
  '004FE231: push eax
  '004FE232: mov fs:[00000000h], esp
  '004FE239: sub esp, 000000FCh
  '004FE23F: push ebx
  '004FE240: push esi
  '004FE241: push edi
  '004FE242: mov [ebp-0Ch], esp
  '004FE245: mov [ebp-08h], 00405C28h
  '004FE24C: xor esi, esi
  '004FE24E: mov [ebp-04h], esi
  '004FE251: mov ebx, [ebp+08h]
  '004FE254: push ebx
  '004FE255: mov eax, [ebx]
  '004FE257: call [eax+04h]
  '004FE25A: mov ecx, 00000013h
  '004FE25F: xor eax, eax
  '004FE261: lea edi, [ebp-68h]
  '004FE264: mov [ebx+54h], esi
  '004FE267: rep stosd 
  '004FE269: mov ecx, 00000013h
  '004FE26E: lea edi, [ebp-000000ECh]
  '004FE274: rep stosd 
  '004FE276: mov ecx, [ebp+14h]
  '004FE279: mov [ebx+58h], esi
  '004FE27C: mov eax, [ebp+18h]
  '004FE27F: mov [ebp-1Ch], esi
  '004FE282: movsx edx, word ptr [ecx]
  '004FE285: imul edx, FFFFF000h
  '004FE28B: movsx ecx, word ptr [eax]
  '004FE28E: jo 004FE714h
  '004FE294: imul ecx, FFFFFE00h
  '004FE29A: mov eax, [ebp+1Ch]
  '004FE29D: mov [ebp-6Ch], esi
  '004FE2A0: jo 004FE714h
  '004FE2A6: or edx, ecx
  '004FE2A8: mov [ebp-74h], esi
  '004FE2AB: movsx ecx, word ptr [eax]
  '004FE2AE: mov eax, [ebp+20h]
  '004FE2B1: mov [ebp-78h], esi
  '004FE2B4: neg ecx
  '004FE2B6: jo 004FE714h
  '004FE2BC: or edx, ecx
  '004FE2BE: mov [ebp-00000088h], esi
  '004FE2C4: movsx ecx, word ptr [eax]
  '004FE2C7: imul ecx, FCh
  '004FE2CA: mov eax, [ebp+3Ch]
  '004FE2CD: lea edi, [ebp-68h]
  '004FE2D0: jo 004FE714h
  '004FE2D6: or edx, ecx
  '004FE2D8: mov ecx, [eax]
  '004FE2DA: and ecx, FFFFFF9Fh
  '004FE2DD: mov [ebp-68h], 0000004Ch
  '004FE2E4: or edx, ecx
  '004FE2E6: mov [ebp-34h], edx
  '004FE2E9: mov edx, [ebp+38h]
  '004FE2EC: mov eax, [edx]
  '004FE2EE: cmp eax, FFFFFFFFh
  '004FE2F1: jz 4FE2F6h
  '004FE2F3: mov [ebp-64h], eax
  '004FE2F6: mov eax, [ebp+2Ch]
  '004FE2F9: mov esi, [004012D8h]
  '004FE2FF: lea ecx, [ebp-3Ch]
  '004FE302: mov edx, [eax]
  '004FE304: call esi
  '004FE306: mov ecx, [ebp+34h]
  '004FE309: mov edx, [ecx]
  '004FE30B: lea ecx, [ebp-2Ch]
  '004FE30E: call esi
  '004FE310: mov edx, [ebp+30h]
  '004FE313: lea ecx, [ebp-38h]
  '004FE316: mov edx, [edx]
  '004FE318: call esi
  '004FE31A: mov eax, [ebp+24h]
  '004FE31D: mov ecx, [eax]
  '004FE31F: push ecx
  '004FE320: call [00401044h]
  '004FE326: mov ecx, eax
  '004FE328: call [004011A8h]
  '004FE32E: mov esi, [00401378h]
  '004FE334: mov [ebp-000000F4h], eax
  '004FE33A: mov eax, 00000001h
  '004FE33F: mov [ebp-18h], eax
  '004FE342: cmp ax, [ebp-000000F4h]
  '004FE349: jnle 004FE3FEh
  '004FE34F: mov ecx, [ebp+24h]
  '004FE352: lea edx, [ebp-00000088h]
  '004FE358: movsx eax, ax
  '004FE35B: push edx
  '004FE35C: mov edx, [ecx]
  '004FE35E: push eax
  '004FE35F: push edx
  '004FE360: mov [ebp-80h], 00000001h
  '004FE367: mov [ebp-00000088h], 00000002h
  '004FE371: call [00401148h]
  '004FE377: mov edx, eax
  '004FE379: lea ecx, [ebp-6Ch]
  '004FE37C: call esi
  '004FE37E: lea ecx, [ebp-00000088h]
  '004FE384: call [00401030h]
  '004FE38A: mov eax, [ebp-6Ch]
  '004FE38D: mov ebx, [00401184h]
  '004FE393: push eax
  '004FE394: push 0041E6DCh
  '004FE399: call ebx
  '004FE39B: mov ecx, [ebp-6Ch]
  '004FE39E: mov edx, eax
  '004FE3A0: neg edx
  '004FE3A2: sbb edx, edx
  '004FE3A4: push ecx
  '004FE3A5: neg edx
  '004FE3A7: push 0041C0D8h
  '004FE3AC: mov [ebp-00000110h], edx
  '004FE3B2: call ebx
  '004FE3B4: mov edx, [ebp-00000110h]
  '004FE3BA: neg eax
  '004FE3BC: sbb eax, eax
  '004FE3BE: neg eax
  '004FE3C0: test edx, eax
  '004FE3C2: jnz 4FE3CFh
  '004FE3C4: mov eax, [ebp-1Ch]
  '004FE3C7: push eax
  '004FE3C8: push 004288C0h
  '004FE3CD: jmp 4FE3D7h
  '004FE3CF: mov ecx, [ebp-1Ch]
  '004FE3D2: mov edx, [ebp-6Ch]
  '004FE3D5: push ecx
  '004FE3D6: push edx
  '004FE3D7: call [0040108Ch]
  '004FE3DD: mov edx, eax
  '004FE3DF: lea ecx, [ebp-1Ch]
  '004FE3E2: call esi
  '004FE3E4: mov ebx, [ebp+08h]
  '004FE3E7: mov eax, 00000001h
  '004FE3EC: add ax, [ebp-18h]
  '004FE3F0: jo 004FE714h
  '004FE3F6: mov [ebp-18h], eax
  '004FE3F9: jmp 004FE342h
  '004FE3FE: mov eax, [ebp-1Ch]
  '004FE401: push eax
  '004FE402: push 004288C0h
  '004FE407: call [0040108Ch]
  '004FE40D: mov edx, eax
  '004FE40F: lea ecx, [ebp-78h]
  '004FE412: call esi
  '004FE414: push eax
  '004FE415: push 004288C0h
  '004FE41A: call [0040108Ch]
  '004FE420: mov edx, eax
  '004FE422: lea ecx, [ebp-1Ch]
  '004FE425: call esi
  '004FE427: lea ecx, [ebp-78h]
  '004FE42A: call [004013B4h]
  '004FE430: mov edx, [ebp-1Ch]
  '004FE433: lea ecx, [edi+0Ch]
  '004FE436: call [004012D8h]
  '004FE43C: mov ecx, [ebp+28h]
  '004FE43F: mov eax, [ebp+0Ch]
  '004FE442: mov [ebp-80h], 00000000h
  '004FE449: mov [ebp-00000088h], 00000002h
  '004FE453: mov edx, [ecx]
  '004FE455: mov eax, [eax]
  '004FE457: lea ecx, [ebp-00000088h]
  '004FE45D: push eax
  '004FE45E: push ecx
  '004FE45F: push eax
  '004FE460: mov [edi+18h], edx
  '004FE463: call [00401044h]
  '004FE469: mov edx, 00000104h
  '004FE46E: sub edx, eax
  '004FE470: jo 004FE714h
  '004FE476: push edx
  '004FE477: call [0040123Ch]
  '004FE47D: mov edx, eax
  '004FE47F: lea ecx, [ebp-78h]
  '004FE482: call esi
  '004FE484: push eax
  '004FE485: call [0040108Ch]
  '004FE48B: mov edx, eax
  '004FE48D: lea ecx, [ebp-1Ch]
  '004FE490: call esi
  '004FE492: lea ecx, [ebp-78h]
  '004FE495: call [004013B4h]
  '004FE49B: lea ecx, [ebp-00000088h]
  '004FE4A1: call [00401030h]
  '004FE4A7: mov edx, [ebp-1Ch]
  '004FE4AA: lea ecx, [edi+1Ch]
  '004FE4AD: call [004012D8h]
  '004FE4B3: mov eax, [ebp+10h]
  '004FE4B6: lea ecx, [ebp-00000088h]
  '004FE4BC: mov [edi+20h], 00000104h
  '004FE4C3: mov [ebp-80h], 00000000h
  '004FE4CA: mov eax, [eax]
  '004FE4CC: mov [ebp-00000088h], 00000002h
  '004FE4D6: push eax
  '004FE4D7: push ecx
  '004FE4D8: push eax
  '004FE4D9: call [00401044h]
  '004FE4DF: mov edx, 00000104h
  '004FE4E4: sub edx, eax
  '004FE4E6: jo 004FE714h
  '004FE4EC: push edx
  '004FE4ED: call [0040123Ch]
  '004FE4F3: mov edx, eax
  '004FE4F5: lea ecx, [ebp-78h]
  '004FE4F8: call esi
  '004FE4FA: push eax
  '004FE4FB: call [0040108Ch]
  '004FE501: mov edx, eax
  '004FE503: lea ecx, [ebp-1Ch]
  '004FE506: call esi
  '004FE508: lea ecx, [ebp-78h]
  '004FE50B: call [004013B4h]
  '004FE511: lea ecx, [ebp-00000088h]
  '004FE517: call [00401030h]
  '004FE51D: mov edx, [ebp-1Ch]
  '004FE520: lea ecx, [edi+24h]
  '004FE523: call [004012D8h]
  '004FE529: mov [edi+28h], 00000104h
  '004FE530: lea eax, [ebp-68h]
  '004FE533: lea ecx, [ebp-000000ECh]
  '004FE539: push eax
  '004FE53A: push ecx
  '004FE53B: push 0041D1A4h
  '004FE540: call [004011F8h]
  '004FE546: push eax
  '004FE547: call 0041D5E0h
  '004FE54C: mov [ebp-0000009Ch], eax
  '004FE552: call [0040109Ch]
  '004FE558: lea edx, [ebp-000000ECh]
  '004FE55E: lea eax, [ebp-68h]
  '004FE561: push edx
  '004FE562: push eax
  '004FE563: push 0041D1A4h
  '004FE568: call [00401078h]
  '004FE56E: mov ecx, [ebp-0000009Ch]
  '004FE574: lea edx, [ebp-000000ECh]
  '004FE57A: push edx
  '004FE57B: push 0041D1A4h
  '004FE580: mov [ebx+54h], ecx
  '004FE583: call [00401364h]
  '004FE589: mov eax, [ebx+54h]
  '004FE58C: sub eax, 00000000h
  '004FE58F: jz 004FE65Fh
  '004FE595: dec eax
  '004FE596: jz 4FE5E0h
  '004FE598: call 0041D828h
  '004FE59D: mov esi, eax
  '004FE59F: call [0040109Ch]
  '004FE5A5: mov ecx, [ebp+0Ch]
  '004FE5A8: mov [ebx+58h], esi
  '004FE5AB: mov esi, [004012D8h]
  '004FE5B1: mov edx, 0041BC60h
  '004FE5B6: mov [ebp-74h], 00000000h
  '004FE5BD: call esi
  '004FE5BF: mov ecx, [ebp+10h]
  '004FE5C2: mov edx, 0041BC60h
  '004FE5C7: call esi
  '004FE5C9: mov eax, [ebp+3Ch]
  '004FE5CC: mov ecx, [ebp+28h]
  '004FE5CF: mov [eax], 00000000h
  '004FE5D5: mov [ecx], FFFFFFFFh
  '004FE5DB: jmp 004FE692h
  '004FE5E0: mov edx, [ebx]
  '004FE5E2: lea eax, [ebp-78h]
  '004FE5E5: push eax
  '004FE5E6: lea eax, [edi+1Ch]
  '004FE5E9: push eax
  '004FE5EA: push ebx
  '004FE5EB: mov [ebp-74h], FFFFFFFFh
  '004FE5F2: call [edx+48h]
  '004FE5F5: mov edx, [ebp-78h]
  '004FE5F8: mov ecx, [ebp+0Ch]
  '004FE5FB: mov [ebp-78h], 00000000h
  '004FE602: call esi
  '004FE604: mov ecx, [ebx]
  '004FE606: lea edx, [ebp-78h]
  '004FE609: lea eax, [edi+24h]
  '004FE60C: push edx
  '004FE60D: push eax
  '004FE60E: push ebx
  '004FE60F: call [ecx+48h]
  '004FE612: mov edx, [ebp-78h]
  '004FE615: mov ecx, [ebp+10h]
  '004FE618: mov [ebp-78h], 00000000h
  '004FE61F: call esi
  '004FE621: mov ecx, [ebp+3Ch]
  '004FE624: mov eax, [edi+34h]
  '004FE627: mov edx, [ebp+28h]
  '004FE62A: mov [ecx], eax
  '004FE62C: mov eax, [edi+18h]
  '004FE62F: mov [edx], eax
  '004FE631: mov ecx, [ebx]
  '004FE633: lea edx, [ebp-78h]
  '004FE636: push edx
  '004FE637: push eax
  '004FE638: mov eax, [edi+0Ch]
  '004FE63B: push eax
  '004FE63C: push ebx
  '004FE63D: call [ecx+4Ch]
  '004FE640: mov edx, [ebp-78h]
  '004FE643: mov ecx, [ebp+24h]
  '004FE646: mov [ebp-78h], 00000000h
  '004FE64D: call esi
  '004FE64F: test byte ptr [edi+34h], 01h
  '004FE653: jz 4FE69Ch
  '004FE655: mov ecx, [ebp+1Ch]
  '004FE658: mov word ptr [ecx], FFFFh
  '004FE65D: jmp 4FE69Ch
  '004FE65F: mov ecx, [ebp+0Ch]
  '004FE662: mov esi, [004012D8h]
  '004FE668: mov edx, 0041BC60h
  '004FE66D: mov [ebp-74h], 00000000h
  '004FE674: call esi
  '004FE676: mov ecx, [ebp+10h]
  '004FE679: mov edx, 0041BC60h
  '004FE67E: call esi
  '004FE680: mov edx, [ebp+3Ch]
  '004FE683: mov eax, [ebp+28h]
  '004FE686: mov [edx], 00000000h
  '004FE68C: mov [eax], FFFFFFFFh
  '004FE692: mov ecx, [ebp+24h]
  '004FE695: mov edx, 0041BC60h
  '004FE69A: call esi
  '004FE69C: push 004FE6EBh
  '004FE6A1: jmp 4FE6B9h
  '004FE6A3: lea ecx, [ebp-78h]
  '004FE6A6: call [004013B4h]
  '004FE6AC: lea ecx, [ebp-00000088h]
  '004FE6B2: call [00401030h]
  '004FE6B8: ret 
End Sub
Private Sub unknown_4FE7E0
  '004FE7E0: push ebp
  '004FE7E1: mov ebp, esp
  '004FE7E3: sub esp, 0000000Ch
  '004FE7E6: push 004081B6h
  '004FE7EB: mov eax, fs:[00h]
  '004FE7F1: push eax
  '004FE7F2: mov fs:[00000000h], esp
  '004FE7F9: sub esp, 000000FCh
  '004FE7FF: push ebx
  '004FE800: push esi
  '004FE801: push edi
  '004FE802: mov [ebp-0Ch], esp
  '004FE805: mov [ebp-08h], 00405C48h
  '004FE80C: xor esi, esi
  '004FE80E: mov [ebp-04h], esi
  '004FE811: mov ebx, [ebp+08h]
  '004FE814: push ebx
  '004FE815: mov eax, [ebx]
  '004FE817: call [eax+04h]
  '004FE81A: mov ecx, 00000013h
  '004FE81F: xor eax, eax
  '004FE821: lea edi, [ebp-68h]
  '004FE824: mov [ebx+54h], esi
  '004FE827: rep stosd 
  '004FE829: mov ecx, 00000013h
  '004FE82E: lea edi, [ebp-000000E8h]
  '004FE834: rep stosd 
  '004FE836: mov ecx, [ebp+14h]
  '004FE839: mov [ebx+58h], esi
  '004FE83C: mov eax, [ebp+30h]
  '004FE83F: mov [ebp-1Ch], esi
  '004FE842: movsx edx, word ptr [ecx]
  '004FE845: imul edx, FEh
  '004FE848: mov ecx, [eax]
  '004FE84A: mov [ebp-6Ch], esi
  '004FE84D: jo 004FEC8Bh
  '004FE853: and ecx, FFFFFF9Fh
  '004FE856: mov [ebp-70h], esi
  '004FE859: or edx, ecx
  '004FE85B: mov [ebp-74h], esi
  '004FE85E: or edx, 00000004h
  '004FE861: mov [ebp-00000084h], esi
  '004FE867: mov [ebp-34h], edx
  '004FE86A: mov edx, [ebp+2Ch]
  '004FE86D: mov [ebp-68h], 0000004Ch
  '004FE874: mov eax, [edx]
  '004FE876: cmp eax, FFFFFFFFh
  '004FE879: jz 4FE87Eh
  '004FE87B: mov [ebp-64h], eax
  '004FE87E: mov eax, [ebp+20h]
  '004FE881: mov esi, [004012D8h]
  '004FE887: lea ecx, [ebp-3Ch]
  '004FE88A: mov edx, [eax]
  '004FE88C: call esi
  '004FE88E: mov ecx, [ebp+28h]
  '004FE891: mov edx, [ecx]
  '004FE893: lea ecx, [ebp-2Ch]
  '004FE896: call esi
  '004FE898: mov edx, [ebp+24h]
  '004FE89B: lea ecx, [ebp-38h]
  '004FE89E: mov edx, [edx]
  '004FE8A0: call esi
  '004FE8A2: mov eax, [ebp+18h]
  '004FE8A5: mov ecx, [eax]
  '004FE8A7: push ecx
  '004FE8A8: call [00401044h]
  '004FE8AE: mov ecx, eax
  '004FE8B0: call [004011A8h]
  '004FE8B6: mov esi, [00401378h]
  '004FE8BC: mov [ebp-000000F0h], eax
  '004FE8C2: mov eax, 00000001h
  '004FE8C7: mov [ebp-18h], eax
  '004FE8CA: cmp ax, [ebp-000000F0h]
  '004FE8D1: mov edi, [00401184h]
  '004FE8D7: jnle 004FE983h
  '004FE8DD: mov ecx, [ebp+18h]
  '004FE8E0: lea edx, [ebp-00000084h]
  '004FE8E6: movsx eax, ax
  '004FE8E9: push edx
  '004FE8EA: mov edx, [ecx]
  '004FE8EC: push eax
  '004FE8ED: push edx
  '004FE8EE: mov [ebp-7Ch], 00000001h
  '004FE8F5: mov [ebp-00000084h], 00000002h
  '004FE8FF: call [00401148h]
  '004FE905: mov edx, eax
  '004FE907: lea ecx, [ebp-6Ch]
  '004FE90A: call esi
  '004FE90C: lea ecx, [ebp-00000084h]
  '004FE912: call [00401030h]
  '004FE918: mov eax, [ebp-6Ch]
  '004FE91B: push eax
  '004FE91C: push 0041E6DCh
  '004FE921: call edi
  '004FE923: mov ecx, [ebp-6Ch]
  '004FE926: mov edx, eax
  '004FE928: neg edx
  '004FE92A: sbb edx, edx
  '004FE92C: push ecx
  '004FE92D: neg edx
  '004FE92F: push 0041C0D8h
  '004FE934: mov [ebp-0000010Ch], edx
  '004FE93A: call edi
  '004FE93C: mov edx, [ebp-0000010Ch]
  '004FE942: neg eax
  '004FE944: sbb eax, eax
  '004FE946: neg eax
  '004FE948: test edx, eax
  '004FE94A: jnz 4FE957h
  '004FE94C: mov eax, [ebp-1Ch]
  '004FE94F: push eax
  '004FE950: push 004288C0h
  '004FE955: jmp 4FE95Fh
  '004FE957: mov ecx, [ebp-1Ch]
  '004FE95A: mov edx, [ebp-6Ch]
  '004FE95D: push ecx
  '004FE95E: push edx
  '004FE95F: call [0040108Ch]
  '004FE965: mov edx, eax
  '004FE967: lea ecx, [ebp-1Ch]
  '004FE96A: call esi
  '004FE96C: mov eax, 00000001h
  '004FE971: add ax, [ebp-18h]
  '004FE975: jo 004FEC8Bh
  '004FE97B: mov [ebp-18h], eax
  '004FE97E: jmp 004FE8CAh
  '004FE983: mov eax, [ebp-1Ch]
  '004FE986: mov edi, [0040108Ch]
  '004FE98C: push eax
  '004FE98D: push 004288C0h
  '004FE992: call edi
  '004FE994: mov edx, eax
  '004FE996: lea ecx, [ebp-74h]
  '004FE999: call esi
  '004FE99B: push eax
  '004FE99C: push 004288C0h
  '004FE9A1: call edi
  '004FE9A3: mov edx, eax
  '004FE9A5: lea ecx, [ebp-1Ch]
  '004FE9A8: call esi
  '004FE9AA: lea ecx, [ebp-74h]
  '004FE9AD: call [004013B4h]
  '004FE9B3: mov edx, [ebp-1Ch]
  '004FE9B6: lea edi, [ebp-68h]
  '004FE9B9: lea ecx, [edi+0Ch]
  '004FE9BC: mov [ebp-00000110h], ecx
  '004FE9C2: call [004012D8h]
  '004FE9C8: mov ecx, [ebp+1Ch]
  '004FE9CB: mov eax, [ebp+0Ch]
  '004FE9CE: mov [ebp-7Ch], 00000000h
  '004FE9D5: mov [ebp-00000084h], 00000002h
  '004FE9DF: mov edx, [ecx]
  '004FE9E1: mov eax, [eax]
  '004FE9E3: lea ecx, [ebp-00000084h]
  '004FE9E9: push eax
  '004FE9EA: push ecx
  '004FE9EB: push eax
  '004FE9EC: mov [edi+18h], edx
  '004FE9EF: call [00401044h]
  '004FE9F5: mov edx, 00000104h
  '004FE9FA: sub edx, eax
  '004FE9FC: jo 004FEC8Bh
  '004FEA02: push edx
  '004FEA03: call [0040123Ch]
  '004FEA09: mov edx, eax
  '004FEA0B: lea ecx, [ebp-74h]
  '004FEA0E: call esi
  '004FEA10: push eax
  '004FEA11: call [0040108Ch]
  '004FEA17: mov edx, eax
  '004FEA19: lea ecx, [ebp-1Ch]
  '004FEA1C: call esi
  '004FEA1E: lea ecx, [ebp-74h]
  '004FEA21: call [004013B4h]
  '004FEA27: lea ecx, [ebp-00000084h]
  '004FEA2D: call [00401030h]
  '004FEA33: mov edx, [ebp-1Ch]
  '004FEA36: lea ecx, [edi+1Ch]
  '004FEA39: call [004012D8h]
  '004FEA3F: mov eax, [ebp+10h]
  '004FEA42: lea ecx, [ebp-00000084h]
  '004FEA48: mov [edi+20h], 00000104h
  '004FEA4F: mov [ebp-7Ch], 00000000h
  '004FEA56: mov eax, [eax]
  '004FEA58: mov [ebp-00000084h], 00000002h
  '004FEA62: push eax
  '004FEA63: push ecx
  '004FEA64: push eax
  '004FEA65: call [00401044h]
  '004FEA6B: mov edx, 00000104h
  '004FEA70: sub edx, eax
  '004FEA72: jo 004FEC8Bh
  '004FEA78: push edx
  '004FEA79: call [0040123Ch]
  '004FEA7F: mov edx, eax
  '004FEA81: lea ecx, [ebp-74h]
  '004FEA84: call esi
  '004FEA86: push eax
  '004FEA87: call [0040108Ch]
  '004FEA8D: mov edx, eax
  '004FEA8F: lea ecx, [ebp-1Ch]
  '004FEA92: call esi
  '004FEA94: lea ecx, [ebp-74h]
  '004FEA97: call [004013B4h]
  '004FEA9D: lea ecx, [ebp-00000084h]
  '004FEAA3: call [00401030h]
  '004FEAA9: lea ecx, [edi+24h]
  '004FEAAC: mov edx, [ebp-1Ch]
  '004FEAAF: call [004012D8h]
  '004FEAB5: lea eax, [ebp-68h]
  '004FEAB8: lea ecx, [ebp-000000E8h]
  '004FEABE: push eax
  '004FEABF: push ecx
  '004FEAC0: push 0041D1A4h
  '004FEAC5: mov [edi+28h], 00000104h
  '004FEACC: call [004011F8h]
  '004FEAD2: push eax
  '004FEAD3: call 0041D62Ch
  '004FEAD8: mov [ebp-00000098h], eax
  '004FEADE: call [0040109Ch]
  '004FEAE4: lea edx, [ebp-000000E8h]
  '004FEAEA: lea eax, [ebp-68h]
  '004FEAED: push edx
  '004FEAEE: push eax
  '004FEAEF: push 0041D1A4h
  '004FEAF4: call [00401078h]
  '004FEAFA: mov ecx, [ebp-00000098h]
  '004FEB00: lea edx, [ebp-000000E8h]
  '004FEB06: push edx
  '004FEB07: push 0041D1A4h
  '004FEB0C: mov [ebx+54h], ecx
  '004FEB0F: call [00401364h]
  '004FEB15: mov eax, [ebx+54h]
  '004FEB18: xor ecx, ecx
  '004FEB1A: sub eax, ecx
  '004FEB1C: jz 004FEBDAh
  '004FEB22: dec eax
  '004FEB23: jz 4FEB69h
  '004FEB25: mov [ebp-70h], ecx
  '004FEB28: call 0041D828h
  '004FEB2D: mov esi, eax
  '004FEB2F: call [0040109Ch]
  '004FEB35: mov ecx, [ebp+0Ch]
  '004FEB38: mov [ebx+58h], esi
  '004FEB3B: mov esi, [004012D8h]
  '004FEB41: mov edx, 0041BC60h
  '004FEB46: call esi
  '004FEB48: mov ecx, [ebp+10h]
  '004FEB4B: mov edx, 0041BC60h
  '004FEB50: call esi
  '004FEB52: mov eax, [ebp+30h]
  '004FEB55: mov ecx, [ebp+1Ch]
  '004FEB58: mov [eax], 00000000h
  '004FEB5E: mov [ecx], 00000000h
  '004FEB64: jmp 004FEC09h
  '004FEB69: mov edx, [ebx]
  '004FEB6B: lea eax, [ebp-74h]
  '004FEB6E: push eax
  '004FEB6F: lea eax, [edi+1Ch]
  '004FEB72: push eax
  '004FEB73: push ebx
  '004FEB74: mov [ebp-70h], FFFFFFFFh
  '004FEB7B: call [edx+48h]
  '004FEB7E: mov edx, [ebp-74h]
  '004FEB81: mov ecx, [ebp+0Ch]
  '004FEB84: mov [ebp-74h], 00000000h
  '004FEB8B: call esi
  '004FEB8D: mov ecx, [ebx]
  '004FEB8F: lea edx, [ebp-74h]
  '004FEB92: lea eax, [edi+24h]
  '004FEB95: push edx
  '004FEB96: push eax
  '004FEB97: push ebx
  '004FEB98: call [ecx+48h]
  '004FEB9B: mov edx, [ebp-74h]
  '004FEB9E: mov ecx, [ebp+10h]
  '004FEBA1: mov [ebp-74h], 00000000h
  '004FEBA8: call esi
  '004FEBAA: mov ecx, [ebp+30h]
  '004FEBAD: mov eax, [edi+34h]
  '004FEBB0: mov edx, [ebp+1Ch]
  '004FEBB3: mov edi, [edi+18h]
  '004FEBB6: mov [ecx], eax
  '004FEBB8: lea ecx, [ebp-74h]
  '004FEBBB: mov [edx], edi
  '004FEBBD: mov edx, [ebp-00000110h]
  '004FEBC3: mov eax, [ebx]
  '004FEBC5: push ecx
  '004FEBC6: mov ecx, [edx]
  '004FEBC8: push edi
  '004FEBC9: push ecx
  '004FEBCA: push ebx
  '004FEBCB: call [eax+4Ch]
  '004FEBCE: mov edx, [ebp-74h]
  '004FEBD1: mov [ebp-74h], 00000000h
  '004FEBD8: jmp 4FEC0Eh
  '004FEBDA: mov esi, [004012D8h]
  '004FEBE0: mov [ebp-70h], ecx
  '004FEBE3: mov ecx, [ebp+0Ch]
  '004FEBE6: mov edx, 0041BC60h
  '004FEBEB: call esi
  '004FEBED: mov ecx, [ebp+10h]
  '004FEBF0: mov edx, 0041BC60h
  '004FEBF5: call esi
  '004FEBF7: mov edx, [ebp+30h]
  '004FEBFA: mov eax, [ebp+1Ch]
  '004FEBFD: mov [edx], 00000000h
  '004FEC03: mov [eax], 00000000h
  '004FEC09: mov edx, 0041BC60h
  '004FEC0E: mov ecx, [ebp+18h]
  '004FEC11: call esi
  '004FEC13: push 004FEC62h
  '004FEC18: jmp 4FEC30h
  '004FEC1A: lea ecx, [ebp-74h]
  '004FEC1D: call [004013B4h]
  '004FEC23: lea ecx, [ebp-00000084h]
  '004FEC29: call [00401030h]
  '004FEC2F: ret 
End Sub
Private Sub unknown_4FEE10
  '004FEE10: push ebp
  '004FEE11: mov ebp, esp
  '004FEE13: sub esp, 0000000Ch
  '004FEE16: push 004081B6h
  '004FEE1B: mov eax, fs:[00h]
  '004FEE21: push eax
  '004FEE22: mov fs:[00000000h], esp
  '004FEE29: sub esp, 00000040h
  '004FEE2C: push ebx
  '004FEE2D: push esi
  '004FEE2E: push edi
  '004FEE2F: mov [ebp-0Ch], esp
  '004FEE32: mov [ebp-08h], 00405C68h
  '004FEE39: xor esi, esi
  '004FEE3B: mov [ebp-04h], esi
  '004FEE3E: mov eax, [ebp+08h]
  '004FEE41: push eax
  '004FEE42: mov ecx, [eax]
  '004FEE44: call [ecx+04h]
  '004FEE47: mov edx, [ebp+10h]
  '004FEE4A: lea eax, [ebp-38h]
  '004FEE4D: push eax
  '004FEE4E: mov [ebp-38h], esi
  '004FEE51: push 00000104h
  '004FEE56: mov [ebp-18h], esi
  '004FEE59: mov [ebp-20h], esi
  '004FEE5C: mov [ebp-24h], esi
  '004FEE5F: mov [ebp-28h], esi
  '004FEE62: mov [edx], esi
  '004FEE64: mov [ebp-30h], esi
  '004FEE67: mov [ebp-38h], 00000002h
  '004FEE6E: call [0040123Ch]
  '004FEE74: mov edx, eax
  '004FEE76: lea ecx, [ebp-18h]
  '004FEE79: call [00401378h]
  '004FEE7F: lea ecx, [ebp-38h]
  '004FEE82: call [00401030h]
  '004FEE88: mov ecx, [ebp-18h]
  '004FEE8B: mov edi, [00401330h]
  '004FEE91: push 00000104h
  '004FEE96: lea edx, [ebp-28h]
  '004FEE99: push ecx
  '004FEE9A: push edx
  '004FEE9B: call edi
  '004FEE9D: mov ebx, [ebp+0Ch]
  '004FEEA0: push eax
  '004FEEA1: lea ecx, [ebp-24h]
  '004FEEA4: mov eax, [ebx]
  '004FEEA6: push eax
  '004FEEA7: push ecx
  '004FEEA8: call edi
  '004FEEAA: push eax
  '004FEEAB: call 0041D674h
  '004FEEB0: mov edi, eax
  '004FEEB2: call [0040109Ch]
  '004FEEB8: mov edx, [ebp-24h]
  '004FEEBB: push edx
  '004FEEBC: push ebx
  '004FEEBD: mov ebx, [00401238h]
  '004FEEC3: call ebx
  '004FEEC5: mov eax, [ebp-28h]
  '004FEEC8: lea ecx, [ebp-18h]
  '004FEECB: push eax
  '004FEECC: push ecx
  '004FEECD: call ebx
  '004FEECF: mov ecx, edi
  '004FEED1: call [004011A8h]
  '004FEED7: mov edi, eax
  '004FEED9: lea edx, [ebp-28h]
  '004FEEDC: lea eax, [ebp-24h]
  '004FEEDF: push edx
  '004FEEE0: push eax
  '004FEEE1: push 00000002h
  '004FEEE3: call [004012E8h]
  '004FEEE9: add esp, 0000000Ch
  '004FEEEC: cmp di, si
  '004FEEEF: jz 4FEF01h
  '004FEEF1: mov edx, 0041BC60h
  '004FEEF6: lea ecx, [ebp-20h]
  '004FEEF9: call [004012D8h]
  '004FEEFF: jmp 4FEF2Eh
  '004FEF01: mov ecx, [ebp-18h]
  '004FEF04: push 00000001h
  '004FEF06: push ecx
  '004FEF07: push 004288C0h
  '004FEF0C: push esi
  '004FEF0D: call [004012ACh]
  '004FEF13: mov edx, [ebp-18h]
  '004FEF16: sub eax, 00000001h
  '004FEF19: jo 4FEF92h
  '004FEF1B: push eax
  '004FEF1C: push edx
  '004FEF1D: call [00401354h]
  '004FEF23: mov edx, eax
  '004FEF25: lea ecx, [ebp-20h]
  '004FEF28: call [00401378h]
  '004FEF2E: push 004FEF6Bh
  '004FEF33: jmp 4FEF61h
  '004FEF35: test byte ptr [ebp-04h], 04h
  '004FEF39: jz 4FEF44h
  '004FEF3B: lea ecx, [ebp-20h]
  '004FEF3E: call [004013B4h]
  '004FEF44: lea eax, [ebp-28h]
  '004FEF47: lea ecx, [ebp-24h]
  '004FEF4A: push eax
  '004FEF4B: push ecx
  '004FEF4C: push 00000002h
  '004FEF4E: call [004012E8h]
  '004FEF54: add esp, 0000000Ch
  '004FEF57: lea ecx, [ebp-38h]
  '004FEF5A: call [00401030h]
  '004FEF60: ret 
End Sub
Private Sub unknown_4FEFA0
  '004FEFA0: push ebp
  '004FEFA1: mov ebp, esp
  '004FEFA3: sub esp, 0000000Ch
  '004FEFA6: push 004081B6h
  '004FEFAB: mov eax, fs:[00h]
  '004FEFB1: push eax
  '004FEFB2: mov fs:[00000000h], esp
  '004FEFB9: sub esp, 00000120h
  '004FEFBF: push ebx
  '004FEFC0: push esi
  '004FEFC1: push edi
  '004FEFC2: mov [ebp-0Ch], esp
  '004FEFC5: mov [ebp-08h], 00405C78h
  '004FEFCC: xor ebx, ebx
  '004FEFCE: mov [ebp-04h], ebx
  '004FEFD1: mov esi, [ebp+08h]
  '004FEFD4: push esi
  '004FEFD5: mov eax, [esi]
  '004FEFD7: call [eax+04h]
  '004FEFDA: mov ecx, 00000009h
  '004FEFDF: xor eax, eax
  '004FEFE1: lea edi, [ebp-38h]
  '004FEFE4: mov [ebp-3Ch], ebx
  '004FEFE7: rep stosd 
  '004FEFE9: mov ecx, [ebp+1Ch]
  '004FEFEC: mov [ebp-50h], ebx
  '004FEFEF: mov [ebp-60h], ebx
  '004FEFF2: mov [ebp-70h], ebx
  '004FEFF5: mov eax, [ecx]
  '004FEFF7: mov [ebp-80h], ebx
  '004FEFFA: cmp eax, FFFFFFFFh
  '004FEFFD: mov [ebp-00000090h], ebx
  '004FF003: mov [ebp-000000A0h], ebx
  '004FF009: mov [ebp-000000B0h], ebx
  '004FF00F: mov [ebp-000000C0h], ebx
  '004FF015: mov [ebp-000000F0h], ebx
  '004FF01B: mov [ebp-00000100h], ebx
  '004FF021: mov [ebp-00000110h], ebx
  '004FF027: mov [ebp-00000120h], ebx
  '004FF02D: mov [ebp-38h], 00000024h
  '004FF034: jz 4FF039h
  '004FF036: mov [ebp-34h], eax
  '004FF039: mov edx, [ebp+0Ch]
  '004FF03C: mov ecx, [ebp+10h]
  '004FF03F: mov [ebp-000000B8h], ecx
  '004FF045: lea ecx, [ebp-000000C0h]
  '004FF04B: mov eax, [edx]
  '004FF04D: lea edx, [ebp-60h]
  '004FF050: mov [ebp-2Ch], eax
  '004FF053: lea eax, [ebp-50h]
  '004FF056: push edx
  '004FF057: push eax
  '004FF058: lea edx, [ebp-70h]
  '004FF05B: mov edi, 00000003h
  '004FF060: push ecx
  '004FF061: push edx
  '004FF062: mov [ebp-00000118h], FFFFFFCFh
  '004FF06C: mov [ebp-00000120h], edi
  '004FF072: mov [ebp-000000E8h], 00000001h
  '004FF07C: mov [ebp-000000F0h], edi
  '004FF082: mov [ebp-58h], 00000080h
  '004FF089: mov [ebp-60h], edi
  '004FF08C: mov [ebp-48h], 00000100h
  '004FF093: mov [ebp-50h], edi
  '004FF096: mov [ebp-000000C0h], 0000400Bh
  '004FF0A0: call [004012DCh]
  '004FF0A6: mov eax, [ebp+14h]
  '004FF0A9: mov edx, [ebp+18h]
  '004FF0AC: mov [ebp-00000100h], edi
  '004FF0B2: mov [ebp-00000110h], edi
  '004FF0B8: movsx ecx, word ptr [eax]
  '004FF0BB: imul ecx, FEh
  '004FF0BE: movsx eax, word ptr [edx]
  '004FF0C1: jo 004FF20Eh
  '004FF0C7: imul eax, FCh
  '004FF0CA: mov edi, [004011B8h]
  '004FF0D0: mov [ebp-000000F8h], ecx
  '004FF0D6: jo 004FF20Eh
  '004FF0DC: lea ecx, [ebp-00000120h]
  '004FF0E2: mov [ebp-00000108h], eax
  '004FF0E8: lea edx, [ebp-000000F0h]
  '004FF0EE: push ecx
  '004FF0EF: lea eax, [ebp-70h]
  '004FF0F2: push edx
  '004FF0F3: lea ecx, [ebp-80h]
  '004FF0F6: push eax
  '004FF0F7: push ecx
  '004FF0F8: call edi
  '004FF0FA: push eax
  '004FF0FB: lea edx, [ebp-00000100h]
  '004FF101: lea eax, [ebp-00000090h]
  '004FF107: push edx
  '004FF108: push eax
  '004FF109: call edi
  '004FF10B: lea ecx, [ebp-00000110h]
  '004FF111: push eax
  '004FF112: lea edx, [ebp-000000A0h]
  '004FF118: push ecx
  '004FF119: push edx
  '004FF11A: call edi
  '004FF11C: push eax
  '004FF11D: lea eax, [ebp-000000B0h]
  '004FF123: push eax
  '004FF124: call [00401214h]
  '004FF12A: push eax
  '004FF12B: call [0040130Ch]
  '004FF131: lea ecx, [ebp-70h]
  '004FF134: mov [ebp-24h], eax
  '004FF137: lea edx, [ebp-60h]
  '004FF13A: push ecx
  '004FF13B: lea eax, [ebp-50h]
  '004FF13E: push edx
  '004FF13F: push eax
  '004FF140: push 00000003h
  '004FF142: call [00401050h]
  '004FF148: add esp, 00000010h
  '004FF14B: cmp [esi+50h], bx
  '004FF14F: jnz 4FF157h
  '004FF151: mov ecx, [esi]
  '004FF153: push esi
  '004FF154: call [ecx+50h]
  '004FF157: mov edx, [esi+44h]
  '004FF15A: push edx
  '004FF15B: call [00401288h]
  '004FF161: mov [ebp-28h], eax
  '004FF164: lea eax, [ebp-38h]
  '004FF167: push eax
  '004FF168: call 0041D6D0h
  '004FF16D: mov edi, eax
  '004FF16F: call [0040109Ch]
  '004FF175: mov [esi+54h], edi
  '004FF178: sub edi, ebx
  '004FF17A: jz 4FF18Fh
  '004FF17C: dec edi
  '004FF17D: jz 4FF1A2h
  '004FF17F: call 0041D828h
  '004FF184: mov edi, eax
  '004FF186: call [0040109Ch]
  '004FF18C: mov [esi+58h], edi
  '004FF18F: mov ecx, [ebp+0Ch]
  '004FF192: mov [ebp-3Ch], ebx
  '004FF195: mov [ecx], FFFFFFFFh
  '004FF19B: push 004FF1E5h
  '004FF1A0: jmp 4FF1E4h
  '004FF1A2: mov eax, [ebp+0Ch]
  '004FF1A5: mov edx, [ebp-2Ch]
  '004FF1A8: mov [ebp-3Ch], FFFFFFFFh
  '004FF1AF: mov [eax], edx
  '004FF1B1: jmp 4FF19Bh
  '004FF1B3: lea edx, [ebp-000000B0h]
  '004FF1B9: lea eax, [ebp-000000A0h]
  '004FF1BF: push edx
  '004FF1C0: lea ecx, [ebp-00000090h]
  '004FF1C6: push eax
  '004FF1C7: lea edx, [ebp-80h]
  '004FF1CA: push ecx
  '004FF1CB: lea eax, [ebp-70h]
  '004FF1CE: push edx
  '004FF1CF: lea ecx, [ebp-60h]
  '004FF1D2: push eax
  '004FF1D3: lea edx, [ebp-50h]
  '004FF1D6: push ecx
  '004FF1D7: push edx
  '004FF1D8: push 00000007h
  '004FF1DA: call [00401050h]
  '004FF1E0: add esp, 00000020h
  '004FF1E3: ret 
End Sub
Private Sub unknown_4FF270
  '004FF270: push ebp
  '004FF271: mov ebp, esp
  '004FF273: sub esp, 0000000Ch
  '004FF276: push 004081B6h
  '004FF27B: mov eax, fs:[00h]
  '004FF281: push eax
  '004FF282: mov fs:[00000000h], esp
  '004FF289: sub esp, 00000010h
  '004FF28C: push ebx
  '004FF28D: push esi
  '004FF28E: push edi
  '004FF28F: mov [ebp-0Ch], esp
  '004FF292: mov [ebp-08h], 00405C88h
  '004FF299: xor edi, edi
  '004FF29B: mov [ebp-04h], edi
  '004FF29E: mov esi, [ebp+08h]
  '004FF2A1: push esi
  '004FF2A2: mov eax, [esi]
  '004FF2A4: call [eax+04h]
  '004FF2A7: cmp [esi+50h], di
  '004FF2AB: mov [ebp-18h], edi
  '004FF2AE: jnz 4FF2B6h
  '004FF2B0: mov ecx, [esi]
  '004FF2B2: push esi
  '004FF2B3: call [ecx+50h]
  '004FF2B6: mov edx, [ebp+0Ch]
  '004FF2B9: xor ecx, ecx
  '004FF2BB: mov ax, [edx]
  '004FF2BE: cmp ax, 000Fh
  '004FF2C2: setnle cl
  '004FF2C5: xor edx, edx
  '004FF2C7: cmp ax, di
  '004FF2CA: setl dl
  '004FF2CD: or ecx, edx
  '004FF2CF: jnz 4FF2EAh
  '004FF2D1: movsx edi, ax
  '004FF2D4: cmp edi, 00000010h
  '004FF2D7: jb 4FF2DFh
  '004FF2D9: call [00401178h]
  '004FF2DF: mov eax, [esi+44h]
  '004FF2E2: mov ecx, [eax+edi*4]
  '004FF2E5: mov [ebp-18h], ecx
  '004FF2E8: jmp 4FF2F1h
  '004FF2EA: mov [ebp-18h], FFFFFFFFh
  '004FF2F1: mov eax, [ebp+08h]
  '004FF2F4: push eax
  '004FF2F5: mov edx, [eax]
  '004FF2F7: call [edx+08h]
  '004FF2FA: mov eax, [ebp+10h]
  '004FF2FD: mov ecx, [ebp-18h]
  '004FF300: mov [eax], ecx
  '004FF302: mov eax, [ebp-04h]
  '004FF305: mov ecx, [ebp-14h]
  '004FF308: pop edi
  '004FF309: pop esi
  '004FF30A: mov fs:[00000000h], ecx
  '004FF311: pop ebx
  '004FF312: mov esp, ebp
  '004FF314: pop ebp
  '004FF315: retn 000Ch
End Sub
Private Sub unknown_4FF320
  '004FF320: push ebp
  '004FF321: mov ebp, esp
  '004FF323: sub esp, 0000000Ch
  '004FF326: push 004081B6h
  '004FF32B: mov eax, fs:[00h]
  '004FF331: push eax
  '004FF332: mov fs:[00000000h], esp
  '004FF339: sub esp, 0000000Ch
  '004FF33C: push ebx
  '004FF33D: push esi
  '004FF33E: push edi
  '004FF33F: mov [ebp-0Ch], esp
  '004FF342: mov [ebp-08h], 00405C90h
  '004FF349: mov [ebp-04h], 00000000h
  '004FF350: mov esi, [ebp+08h]
  '004FF353: push esi
  '004FF354: mov eax, [esi]
  '004FF356: call [eax+04h]
  '004FF359: cmp word ptr [esi+50h], 0000h
  '004FF35E: jnz 4FF366h
  '004FF360: mov ecx, [esi]
  '004FF362: push esi
  '004FF363: call [ecx+50h]
  '004FF366: mov edx, [ebp+0Ch]
  '004FF369: xor ecx, ecx
  '004FF36B: mov ax, [edx]
  '004FF36E: cmp ax, 000Fh
  '004FF372: setnle cl
  '004FF375: xor edx, edx
  '004FF377: test ax, ax
  '004FF37A: setl dl
  '004FF37D: or ecx, edx
  '004FF37F: jnz 4FF39Ah
  '004FF381: movsx edi, ax
  '004FF384: cmp edi, 00000010h
  '004FF387: jb 4FF38Fh
  '004FF389: call [00401178h]
  '004FF38F: mov ecx, [ebp+10h]
  '004FF392: mov eax, [esi+44h]
  '004FF395: mov edx, [ecx]
  '004FF397: mov [eax+edi*4], edx
  '004FF39A: mov eax, [ebp+08h]
  '004FF39D: push eax
  '004FF39E: mov ecx, [eax]
  '004FF3A0: call [ecx+08h]
  '004FF3A3: mov eax, [ebp-04h]
  '004FF3A6: mov ecx, [ebp-14h]
  '004FF3A9: pop edi
  '004FF3AA: pop esi
  '004FF3AB: mov fs:[00000000h], ecx
  '004FF3B2: pop ebx
  '004FF3B3: mov esp, ebp
  '004FF3B5: pop ebp
  '004FF3B6: retn 000Ch
End Sub
Private Sub unknown_4FF3C0
  '004FF3C0: push ebp
  '004FF3C1: mov ebp, esp
  '004FF3C3: sub esp, 0000000Ch
  '004FF3C6: push 004081B6h
  '004FF3CB: mov eax, fs:[00h]
  '004FF3D1: push eax
  '004FF3D2: mov fs:[00000000h], esp
  '004FF3D9: sub esp, 0000013Ch
  '004FF3DF: push ebx
  '004FF3E0: push esi
  '004FF3E1: push edi
  '004FF3E2: mov [ebp-0Ch], esp
  '004FF3E5: mov [ebp-08h], 00405CA8h
  '004FF3EC: xor esi, esi
  '004FF3EE: mov [ebp-04h], esi
  '004FF3F1: mov ebx, [ebp+08h]
  '004FF3F4: push ebx
  '004FF3F5: mov eax, [ebx]
  '004FF3F7: call [eax+04h]
  '004FF3FA: mov ecx, 00000010h
  '004FF3FF: xor eax, eax
  '004FF401: lea edi, [ebp-58h]
  '004FF404: push 00000011h
  '004FF406: rep stosd 
  '004FF408: mov ecx, 0000000Fh
  '004FF40D: lea edi, [ebp-00000094h]
  '004FF413: rep stosd 
  '004FF415: mov ecx, 0000000Fh
  '004FF41A: lea edi, [ebp-0000011Ch]
  '004FF420: rep stosd 
  '004FF422: lea ecx, [ebp-00000138h]
  '004FF428: push 004288C8h
  '004FF42D: push ecx
  '004FF42E: mov [ebp-18h], esi
  '004FF431: mov [ebp-00000098h], esi
  '004FF437: mov [ebp-0000009Ch], esi
  '004FF43D: mov [ebp-000000ACh], esi
  '004FF443: mov [ebp-000000BCh], esi
  '004FF449: mov [ebp-000000D0h], esi
  '004FF44F: call [00401190h]
  '004FF455: mov [ebx+54h], esi
  '004FF458: mov [ebx+58h], esi
  '004FF45B: mov ebx, [ebp+10h]
  '004FF45E: cmp [ebx], FFFFFFFFh
  '004FF461: jnz 004FF4FBh
  '004FF467: mov [ebx], esi
  '004FF469: mov esi, [ebp+24h]
  '004FF46C: test byte ptr [esi], 02h
  '004FF46F: jz 004FF511h
  '004FF475: mov eax, [54238Ch]
  '004FF47A: test eax, eax
  '004FF47C: jnz 4FF48Eh
  '004FF47E: push 0054238Ch
  '004FF483: push 0041D9E0h
  '004FF488: call [004012B8h]
  '004FF48E: mov edi, [0054238Ch]
  '004FF494: lea eax, [ebp-0000009Ch]
  '004FF49A: push eax
  '004FF49B: push edi
  '004FF49C: mov edx, [edi]
  '004FF49E: call [edx+20h]
  '004FF4A1: test eax, eax
  '004FF4A3: fclex 
  '004FF4A5: jnl 4FF4B6h
  '004FF4A7: push 00000020h
  '004FF4A9: push 0041D9D0h
  '004FF4AE: push edi
  '004FF4AF: push eax
  '004FF4B0: call [004010A0h]
  '004FF4B6: mov ecx, [ebp-0000009Ch]
  '004FF4BC: mov edi, [004011E4h]
  '004FF4C2: push 00000000h
  '004FF4C4: push 00010009h
  '004FF4C9: lea edx, [ebp-000000ACh]
  '004FF4CF: push ecx
  '004FF4D0: push edx
  '004FF4D1: call edi
  '004FF4D3: add esp, 00000010h
  '004FF4D6: push eax
  '004FF4D7: call [0040130Ch]
  '004FF4DD: lea ecx, [ebp-0000009Ch]
  '004FF4E3: mov [ebx], eax
  '004FF4E5: call [004013B8h]
  '004FF4EB: mov ebx, [00401030h]
  '004FF4F1: lea ecx, [ebp-000000ACh]
  '004FF4F7: call ebx
  '004FF4F9: jmp 4FF51Dh
  '004FF4FB: mov eax, [ebp+24h]
  '004FF4FE: mov edi, [004011E4h]
  '004FF504: mov ebx, [00401030h]
  '004FF50A: mov esi, eax
  '004FF50C: or [eax], 00000002h
  '004FF50F: jmp 4FF51Dh
  '004FF511: mov edi, [004011E4h]
  '004FF517: mov ebx, [00401030h]
  '004FF51D: mov eax, [esi]
  '004FF51F: test al, 02h
  '004FF521: jnz 4FF527h
  '004FF523: or al, 01h
  '004FF525: mov [esi], eax
  '004FF527: mov eax, [ebp+18h]
  '004FF52A: cmp [eax], 00000000h
  '004FF52D: jz 4FF536h
  '004FF52F: mov eax, [esi]
  '004FF531: or ah, 01h
  '004FF534: mov [esi], eax
  '004FF536: mov ecx, [ebp+1Ch]
  '004FF539: cmp [ecx], 00000000h
  '004FF53C: jz 4FF545h
  '004FF53E: mov eax, [esi]
  '004FF540: or ah, 20h
  '004FF543: mov [esi], eax
  '004FF545: mov edx, [ebp+20h]
  '004FF548: cmp [edx], 00000000h
  '004FF54B: jz 4FF554h
  '004FF54D: mov eax, [esi]
  '004FF54F: or ah, 20h
  '004FF552: mov [esi], eax
  '004FF554: mov eax, [esi]
  '004FF556: and eax, FFFFFDE7h
  '004FF55B: or al, 40h
  '004FF55D: mov [esi], eax
  '004FF55F: mov eax, [54238Ch]
  '004FF564: test eax, eax
  '004FF566: jnz 4FF578h
  '004FF568: push 0054238Ch
  '004FF56D: push 0041D9E0h
  '004FF572: call [004012B8h]
  '004FF578: mov esi, [0054238Ch]
  '004FF57E: lea edx, [ebp-0000009Ch]
  '004FF584: push edx
  '004FF585: push esi
  '004FF586: mov ecx, [esi]
  '004FF588: call [ecx+18h]
  '004FF58B: test eax, eax
  '004FF58D: fclex 
  '004FF58F: jnl 4FF5A0h
  '004FF591: push 00000018h
  '004FF593: push 0041D9D0h
  '004FF598: push esi
  '004FF599: push eax
  '004FF59A: call [004010A0h]
  '004FF5A0: mov eax, [ebp-0000009Ch]
  '004FF5A6: lea edx, [ebp-000000D0h]
  '004FF5AC: push edx
  '004FF5AD: push eax
  '004FF5AE: mov ecx, [eax]
  '004FF5B0: mov esi, eax
  '004FF5B2: call [ecx+00000088h]
  '004FF5B8: test eax, eax
  '004FF5BA: fclex 
  '004FF5BC: jnl 4FF5D0h
  '004FF5BE: push 00000088h
  '004FF5C3: push 00420F20h
  '004FF5C8: push esi
  '004FF5C9: push eax
  '004FF5CA: call [004010A0h]
  '004FF5D0: mov esi, [ebp+0Ch]
  '004FF5D3: push 00000000h
  '004FF5D5: push 00000002h
  '004FF5D7: lea ecx, [ebp-000000ACh]
  '004FF5DD: mov eax, [esi]
  '004FF5DF: push eax
  '004FF5E0: push ecx
  '004FF5E1: call edi
  '004FF5E3: add esp, 00000010h
  '004FF5E6: push eax
  '004FF5E7: call [00401160h]
  '004FF5ED: push edx
  '004FF5EE: push eax
  '004FF5EF: call [004011ECh]
  '004FF5F5: fld real4 ptr [ebp-000000D0h]
  '004FF5FB: cmp [00541000h], 00000000h
  '004FF602: jnz 4FF60Ch
  '004FF604: fdivr real8 ptr [00405CA0h]
  '004FF60A: jmp 4FF61Dh
  '004FF60C: push [00405CA4h]
  '004FF612: push [00405CA0h]
  '004FF618: call 004081F2h
  '004FF61D: fmulp st(1), st(0)
  '004FF61F: fchs 
  '004FF621: fstsw ax
  '004FF623: test al, 0Dh
  '004FF625: jnz 004FFAD9h
  '004FF62B: call [0040135Ch]
  '004FF631: lea ecx, [ebp-0000009Ch]
  '004FF637: mov [ebp-58h], eax
  '004FF63A: call [004013B8h]
  '004FF640: lea ecx, [ebp-000000ACh]
  '004FF646: call ebx
  '004FF648: mov edx, [esi]
  '004FF64A: push 00000000h
  '004FF64C: push 00000007h
  '004FF64E: lea eax, [ebp-000000ACh]
  '004FF654: push edx
  '004FF655: push eax
  '004FF656: call edi
  '004FF658: add esp, 00000010h
  '004FF65B: push eax
  '004FF65C: call [00401284h]
  '004FF662: movsx ecx, ax
  '004FF665: mov [ebp-48h], ecx
  '004FF668: lea ecx, [ebp-000000ACh]
  '004FF66E: call ebx
  '004FF670: mov edx, [esi]
  '004FF672: push 00000000h
  '004FF674: push 00000004h
  '004FF676: lea eax, [ebp-000000ACh]
  '004FF67C: push edx
  '004FF67D: push eax
  '004FF67E: call edi
  '004FF680: add esp, 00000010h
  '004FF683: push eax
  '004FF684: call [00401114h]
  '004FF68A: lea ecx, [ebp-000000ACh]
  '004FF690: mov [ebp-44h], al
  '004FF693: call ebx
  '004FF695: mov ecx, [esi]
  '004FF697: push 00000000h
  '004FF699: push 00000005h
  '004FF69B: lea edx, [ebp-000000ACh]
  '004FF6A1: push ecx
  '004FF6A2: push edx
  '004FF6A3: call edi
  '004FF6A5: add esp, 00000010h
  '004FF6A8: push eax
  '004FF6A9: call [00401114h]
  '004FF6AF: lea ecx, [ebp-000000ACh]
  '004FF6B5: mov [ebp-43h], al
  '004FF6B8: call ebx
  '004FF6BA: mov eax, [esi]
  '004FF6BC: push 00000000h
  '004FF6BE: push 00000006h
  '004FF6C0: lea ecx, [ebp-000000ACh]
  '004FF6C6: push eax
  '004FF6C7: push ecx
  '004FF6C8: call edi
  '004FF6CA: add esp, 00000010h
  '004FF6CD: push eax
  '004FF6CE: call [00401114h]
  '004FF6D4: lea ecx, [ebp-000000ACh]
  '004FF6DA: mov [ebp-42h], al
  '004FF6DD: call ebx
  '004FF6DF: mov edx, [esi]
  '004FF6E1: push 00000000h
  '004FF6E3: push 00000000h
  '004FF6E5: lea eax, [ebp-000000ACh]
  '004FF6EB: push edx
  '004FF6EC: push eax
  '004FF6ED: call edi
  '004FF6EF: add esp, 00000010h
  '004FF6F2: push eax
  '004FF6F3: call [0040103Ch]
  '004FF6F9: mov edx, eax
  '004FF6FB: lea ecx, [ebp-00000098h]
  '004FF701: call [00401378h]
  '004FF707: mov eax, [ebp+08h]
  '004FF70A: lea edx, [ebp-00000138h]
  '004FF710: mov [ebp-000000D0h], edx
  '004FF716: lea edx, [ebp-00000098h]
  '004FF71C: lea ecx, [ebp-3Ch]
  '004FF71F: push edx
  '004FF720: lea edx, [ebp-000000D0h]
  '004FF726: mov [ebp-0000012Ch], ecx
  '004FF72C: mov ecx, [eax]
  '004FF72E: push edx
  '004FF72F: push eax
  '004FF730: call [ecx+5Ch]
  '004FF733: lea ecx, [ebp-00000098h]
  '004FF739: call [004013B4h]
  '004FF73F: lea ecx, [ebp-000000ACh]
  '004FF745: call ebx
  '004FF747: mov eax, [ebp+14h]
  '004FF74A: mov [ebp-00000094h], 0000003Ch
  '004FF754: mov eax, [eax]
  '004FF756: cmp eax, FFFFFFFFh
  '004FF759: jz 4FF761h
  '004FF75B: mov [ebp-00000090h], eax
  '004FF761: mov ecx, [ebp+10h]
  '004FF764: lea eax, [ebp-58h]
  '004FF767: push eax
  '004FF768: mov edx, [ecx]
  '004FF76A: mov [ebp-0000008Ch], edx
  '004FF770: call [00401288h]
  '004FF776: mov ecx, [esi]
  '004FF778: push 00000000h
  '004FF77A: push 00000002h
  '004FF77C: lea edx, [ebp-000000ACh]
  '004FF782: push ecx
  '004FF783: push edx
  '004FF784: mov [ebp-00000088h], eax
  '004FF78A: call edi
  '004FF78C: add esp, 00000010h
  '004FF78F: push eax
  '004FF790: call [00401160h]
  '004FF796: push edx
  '004FF797: push eax
  '004FF798: push 0000000Ah
  '004FF79A: call [004012C4h]
  '004FF7A0: push edx
  '004FF7A1: push eax
  '004FF7A2: call [0040138Ch]
  '004FF7A8: lea ecx, [ebp-000000ACh]
  '004FF7AE: mov [ebp-00000084h], eax
  '004FF7B4: call ebx
  '004FF7B6: mov ebx, [ebp+24h]
  '004FF7B9: mov edi, [ebp+18h]
  '004FF7BC: mov edx, [ebp+1Ch]
  '004FF7BF: mov eax, [ebx]
  '004FF7C1: mov ecx, [edi]
  '004FF7C3: mov [ebp-80h], eax
  '004FF7C6: mov eax, [edx]
  '004FF7C8: mov [ebp-7Ch], ecx
  '004FF7CB: mov ecx, [ebp+20h]
  '004FF7CE: mov [ebp-60h], eax
  '004FF7D1: lea eax, [ebp-00000094h]
  '004FF7D7: mov edx, [ecx]
  '004FF7D9: lea ecx, [ebp-0000011Ch]
  '004FF7DF: push eax
  '004FF7E0: push ecx
  '004FF7E1: push 0041D1D8h
  '004FF7E6: mov [ebp-5Ch], edx
  '004FF7E9: call [004011F8h]
  '004FF7EF: push eax
  '004FF7F0: call 0041D74Ch
  '004FF7F5: mov [ebp-000000D0h], eax
  '004FF7FB: call [0040109Ch]
  '004FF801: lea edx, [ebp-0000011Ch]
  '004FF807: lea eax, [ebp-00000094h]
  '004FF80D: push edx
  '004FF80E: push eax
  '004FF80F: push 0041D1D8h
  '004FF814: call [00401078h]
  '004FF81A: mov edx, [ebp+08h]
  '004FF81D: mov ecx, [ebp-000000D0h]
  '004FF823: lea eax, [ebp-0000011Ch]
  '004FF829: push eax
  '004FF82A: push 0041D1D8h
  '004FF82F: mov [edx+54h], ecx
  '004FF832: call [00401364h]
  '004FF838: mov ecx, [ebp+08h]
  '004FF83B: mov eax, [ecx+54h]
  '004FF83E: sub eax, 00000000h
  '004FF841: jz 4FF863h
  '004FF843: dec eax
  '004FF844: jz 4FF875h
  '004FF846: call 0041D828h
  '004FF84B: mov [ebp-000000D0h], eax
  '004FF851: call [0040109Ch]
  '004FF857: mov eax, [ebp+08h]
  '004FF85A: mov edx, [ebp-000000D0h]
  '004FF860: mov [eax+58h], edx
  '004FF863: mov [ebp-18h], 00000000h
  '004FF86A: wait 
  '004FF86B: push 004FFAB0h
  '004FF870: jmp 004FFA8Bh
  '004FF875: mov ecx, [ebp-80h]
  '004FF878: mov edx, [ebp-7Ch]
  '004FF87B: mov eax, [ebp-64h]
  '004FF87E: mov [ebx], ecx
  '004FF880: mov ebx, [ebp-000000B8h]
  '004FF886: sub esp, 00000010h
  '004FF889: mov [edi], edx
  '004FF88B: mov edx, esp
  '004FF88D: mov ecx, 00000003h
  '004FF892: mov edi, [0040139Ch]
  '004FF898: mov [edx], ecx
  '004FF89A: and eax, 00000100h
  '004FF89F: push ecx
  '004FF8A0: mov ecx, [esi]
  '004FF8A2: mov [edx+04h], ebx
  '004FF8A5: mov [ebp-000000B4h], eax
  '004FF8AB: push ecx
  '004FF8AC: mov [ebp-18h], FFFFFFFFh
  '004FF8B3: mov [edx+08h], eax
  '004FF8B6: mov eax, [ebp-000000B0h]
  '004FF8BC: mov [edx+0Ch], eax
  '004FF8BF: call edi
  '004FF8C1: mov dl, [ebp-44h]
  '004FF8C4: sub esp, 00000010h
  '004FF8C7: mov ecx, esp
  '004FF8C9: mov eax, 00000011h
  '004FF8CE: mov [ebp-000000B4h], dl
  '004FF8D4: mov edx, [ebp-000000B4h]
  '004FF8DA: mov [ecx], eax
  '004FF8DC: mov eax, [ebp-000000B0h]
  '004FF8E2: push 00000004h
  '004FF8E4: mov [ecx+04h], ebx
  '004FF8E7: mov [ecx+08h], edx
  '004FF8EA: mov [ecx+0Ch], eax
  '004FF8ED: mov ecx, [esi]
  '004FF8EF: push ecx
  '004FF8F0: call edi
  '004FF8F2: mov dl, [ebp-42h]
  '004FF8F5: sub esp, 00000010h
  '004FF8F8: mov ecx, esp
  '004FF8FA: mov eax, 00000011h
  '004FF8FF: mov [ebp-000000B4h], dl
  '004FF905: mov edx, [ebp-000000B4h]
  '004FF90B: mov [ecx], eax
  '004FF90D: mov eax, [ebp-000000B0h]
  '004FF913: push 00000006h
  '004FF915: mov [ecx+04h], ebx
  '004FF918: mov [ecx+08h], edx
  '004FF91B: mov [ecx+0Ch], eax
  '004FF91E: mov ecx, [esi]
  '004FF920: push ecx
  '004FF921: call edi
  '004FF923: mov dl, [ebp-43h]
  '004FF926: sub esp, 00000010h
  '004FF929: mov ecx, esp
  '004FF92B: mov eax, 00000011h
  '004FF930: mov [ebp-000000B4h], dl
  '004FF936: mov edx, [ebp-000000B4h]
  '004FF93C: mov [ecx], eax
  '004FF93E: mov eax, [ebp-000000B0h]
  '004FF944: push 00000005h
  '004FF946: mov [ecx+04h], ebx
  '004FF949: mov [ecx+08h], edx
  '004FF94C: mov [ecx+0Ch], eax
  '004FF94F: mov ecx, [esi]
  '004FF951: push ecx
  '004FF952: call edi
  '004FF954: sub esp, 00000010h
  '004FF957: mov eax, [ebp-48h]
  '004FF95A: mov edx, esp
  '004FF95C: mov ecx, 00000003h
  '004FF961: push 00000007h
  '004FF963: mov [edx], ecx
  '004FF965: mov ecx, [esi]
  '004FF967: push ecx
  '004FF968: mov [edx+04h], ebx
  '004FF96B: mov [edx+08h], eax
  '004FF96E: mov eax, [ebp-000000B0h]
  '004FF974: mov [edx+0Ch], eax
  '004FF977: call edi
  '004FF979: fild dword ptr [ebp-00000084h]
  '004FF97F: fstp real8 ptr [ebp-00000150h]
  '004FF985: fld real8 ptr [ebp-00000150h]
  '004FF98B: cmp [00541000h], 00000000h
  '004FF992: jnz 4FF99Ch
  '004FF994: fdiv real8 ptr [00405C98h]
  '004FF99A: jmp 4FF9ADh
  '004FF99C: push [00405C9Ch]
  '004FF9A2: push [00405C98h]
  '004FF9A8: call 004081D4h
  '004FF9AD: fstp real8 ptr [ebp-000000B4h]
  '004FF9B3: fstsw ax
  '004FF9B5: test al, 0Dh
  '004FF9B7: jnz 004FFAD9h
  '004FF9BD: sub esp, 00000010h
  '004FF9C0: mov eax, 00000005h
  '004FF9C5: mov edx, esp
  '004FF9C7: mov ecx, [ebp-000000B0h]
  '004FF9CD: push 00000002h
  '004FF9CF: mov [edx], eax
  '004FF9D1: mov eax, [ebp-000000B4h]
  '004FF9D7: mov [edx+04h], ebx
  '004FF9DA: mov [edx+08h], eax
  '004FF9DD: mov [edx+0Ch], ecx
  '004FF9E0: mov edx, [esi]
  '004FF9E2: push edx
  '004FF9E3: call edi
  '004FF9E5: lea ecx, [ebp-00000138h]
  '004FF9EB: lea eax, [ebp-3Ch]
  '004FF9EE: mov [ebp-000000D0h], ecx
  '004FF9F4: lea ecx, [ebp-00000098h]
  '004FF9FA: mov [ebp-0000012Ch], eax
  '004FFA00: mov eax, [ebp+08h]
  '004FFA03: push ecx
  '004FFA04: lea ecx, [ebp-000000D0h]
  '004FFA0A: mov edx, [eax]
  '004FFA0C: push ecx
  '004FFA0D: push eax
  '004FFA0E: call [edx+60h]
  '004FFA11: sub esp, 00000010h
  '004FFA14: mov eax, [ebp-00000098h]
  '004FFA1A: mov edx, esp
  '004FFA1C: mov ecx, 00000008h
  '004FFA21: mov [ebp-000000ACh], ecx
  '004FFA27: mov [ebp-000000A4h], eax
  '004FFA2D: mov [edx], ecx
  '004FFA2F: mov ecx, [ebp-000000A8h]
  '004FFA35: push 00000000h
  '004FFA37: mov [ebp-00000098h], 00000000h
  '004FFA41: mov [edx+04h], ecx
  '004FFA44: mov ecx, [esi]
  '004FFA46: push ecx
  '004FFA47: mov [edx+08h], eax
  '004FFA4A: mov eax, [ebp-000000A0h]
  '004FFA50: mov [edx+0Ch], eax
  '004FFA53: call edi
  '004FFA55: lea ecx, [ebp-000000ACh]
  '004FFA5B: call [00401030h]
  '004FFA61: jmp 004FF86Ah
  '004FFA66: lea ecx, [ebp-00000098h]
  '004FFA6C: call [004013B4h]
  '004FFA72: lea ecx, [ebp-0000009Ch]
  '004FFA78: call [004013B8h]
  '004FFA7E: lea ecx, [ebp-000000ACh]
  '004FFA84: call [00401030h]
  '004FFA8A: ret 
End Sub
Private Sub unknown_4FFAE0
  '004FFAE0: push ebp
  '004FFAE1: mov ebp, esp
  '004FFAE3: sub esp, 00000018h
  '004FFAE6: push 004081B6h
  '004FFAEB: mov eax, fs:[00h]
  '004FFAF1: push eax
  '004FFAF2: mov fs:[00000000h], esp
  '004FFAF9: mov eax, 00000114h
  '004FFAFE: call 004081B0h
  '004FFB03: push ebx
  '004FFB04: push esi
  '004FFB05: push edi
  '004FFB06: mov [ebp-18h], esp
  '004FFB09: mov [ebp-14h], 00405CB8h
  '004FFB10: mov [ebp-10h], 00000000h
  '004FFB17: mov [ebp-0Ch], 00000000h
  '004FFB1E: mov eax, [ebp+08h]
  '004FFB21: mov ecx, [eax]
  '004FFB23: mov edx, [ebp+08h]
  '004FFB26: push edx
  '004FFB27: call [ecx+04h]
  '004FFB2A: mov [ebp-04h], 00000001h
  '004FFB31: mov [ebp-04h], 00000002h
  '004FFB38: mov eax, [ebp+08h]
  '004FFB3B: mov [eax+54h], 00000000h
  '004FFB42: mov [ebp-04h], 00000003h
  '004FFB49: mov ecx, [ebp+08h]
  '004FFB4C: mov [ecx+58h], 00000000h
  '004FFB53: mov [ebp-04h], 00000004h
  '004FFB5A: mov edx, [ebp+14h]
  '004FFB5D: mov ax, [edx]
  '004FFB60: neg ax
  '004FFB63: movsx ecx, ax
  '004FFB66: imul ecx, 08h
  '004FFB69: jo 005000B4h
  '004FFB6F: mov edx, [ebp+2Ch]
  '004FFB72: mov ax, [edx]
  '004FFB75: neg ax
  '004FFB78: movsx edx, ax
  '004FFB7B: imul edx, 00080000h
  '004FFB81: jo 005000B4h
  '004FFB87: or ecx, edx
  '004FFB89: mov eax, [ebp+20h]
  '004FFB8C: mov dx, [eax]
  '004FFB8F: neg dx
  '004FFB92: movsx eax, dx
  '004FFB95: imul eax, 04h
  '004FFB98: jo 005000B4h
  '004FFB9E: or ecx, eax
  '004FFBA0: mov edx, [ebp+30h]
  '004FFBA3: mov ax, [edx]
  '004FFBA6: neg ax
  '004FFBA9: movsx edx, ax
  '004FFBAC: imul edx, 20h
  '004FFBAF: jo 005000B4h
  '004FFBB5: or ecx, edx
  '004FFBB7: mov eax, [ebp+28h]
  '004FFBBA: mov dx, [eax]
  '004FFBBD: not dx
  '004FFBC0: neg dx
  '004FFBC3: movsx eax, dx
  '004FFBC6: imul eax, 00100000h
  '004FFBCC: jo 005000B4h
  '004FFBD2: or ecx, eax
  '004FFBD4: mov edx, [ebp+38h]
  '004FFBD7: mov ax, [edx]
  '004FFBDA: neg ax
  '004FFBDD: movsx edx, ax
  '004FFBE0: imul edx, 00000080h
  '004FFBE6: jo 005000B4h
  '004FFBEC: or ecx, edx
  '004FFBEE: mov eax, [ebp+34h]
  '004FFBF1: mov dx, [eax]
  '004FFBF4: neg dx
  '004FFBF7: movsx eax, dx
  '004FFBFA: imul eax, 10h
  '004FFBFD: jo 005000B4h
  '004FFC03: or ecx, eax
  '004FFC05: or ecx, 00040000h
  '004FFC0B: or ch, 01h
  '004FFC0E: mov [ebp-70h], ecx
  '004FFC11: mov [ebp-04h], 00000005h
  '004FFC18: mov ecx, [ebp+10h]
  '004FFC1B: cmp [ecx], 00000001h
  '004FFC1E: jnz 4FFC32h
  '004FFC20: mov [ebp-04h], 00000006h
  '004FFC27: mov edx, [ebp-70h]
  '004FFC2A: or edx, 00000002h
  '004FFC2D: mov [ebp-70h], edx
  '004FFC30: jmp 4FFC51h
  '004FFC32: mov [ebp-04h], 00000007h
  '004FFC39: mov eax, [ebp+10h]
  '004FFC3C: cmp [eax], 00000002h
  '004FFC3F: jnz 4FFC51h
  '004FFC41: mov [ebp-04h], 00000008h
  '004FFC48: mov ecx, [ebp-70h]
  '004FFC4B: or ecx, 00000001h
  '004FFC4E: mov [ebp-70h], ecx
  '004FFC51: mov [ebp-04h], 0000000Ah
  '004FFC58: mov [ebp-74h], FFFFAFFFh
  '004FFC5F: mov [ebp-04h], 0000000Bh
  '004FFC66: mov edx, [ebp-74h]
  '004FFC69: and dh, 5Fh
  '004FFC6C: mov [ebp-74h], edx
  '004FFC6F: mov [ebp-04h], 0000000Ch
  '004FFC76: mov [ebp-6Ch], 00000042h
  '004FFC7D: mov [ebp-04h], 0000000Dh
  '004FFC84: mov eax, [ebp+3Ch]
  '004FFC87: mov ecx, [eax]
  '004FFC89: mov [ebp-68h], ecx
  '004FFC8C: mov [ebp-04h], 0000000Eh
  '004FFC93: mov edx, [ebp-70h]
  '004FFC96: and edx, [ebp-74h]
  '004FFC99: mov [ebp-58h], edx
  '004FFC9C: mov [ebp-04h], 0000000Fh
  '004FFCA3: mov eax, [ebp+18h]
  '004FFCA6: mov ecx, [eax]
  '004FFCA8: call [004011A8h]
  '004FFCAE: mov [ebp-54h], ax
  '004FFCB2: mov [ebp-04h], 00000010h
  '004FFCB9: mov ecx, [ebp+1Ch]
  '004FFCBC: mov ecx, [ecx]
  '004FFCBE: call [004011A8h]
  '004FFCC4: mov [ebp-52h], ax
  '004FFCC8: mov [ebp-04h], 00000011h
  '004FFCCF: mov word ptr [ebp-50h], 0001h
  '004FFCD5: mov [ebp-04h], 00000012h
  '004FFCDC: mov word ptr [ebp-4Eh], FFFFh
  '004FFCE2: mov [ebp-04h], 00000013h
  '004FFCE9: lea edx, [ebp-6Ch]
  '004FFCEC: push edx
  '004FFCED: call 0041D790h
  '004FFCF2: mov [ebp-00000098h], ax
  '004FFCF9: call [0040109Ch]
  '004FFCFF: movsx eax, word ptr [ebp-00000098h]
  '004FFD06: mov ecx, [ebp+08h]
  '004FFD09: mov [ecx+54h], eax
  '004FFD0C: mov [ebp-04h], 00000014h
  '004FFD13: mov edx, [ebp+08h]
  '004FFD16: mov eax, [edx+54h]
  '004FFD19: mov [ebp-0000011Ch], eax
  '004FFD1F: mov ecx, [ebp-0000011Ch]
  '004FFD25: mov [ebp-00000134h], ecx
  '004FFD2B: cmp [ebp-00000134h], 00000000h
  '004FFD32: jz 00500048h
  '004FFD38: cmp [ebp-00000134h], 00000001h
  '004FFD3F: jz 4FFD4Bh
  '004FFD41: jmp 00500057h
  '004FFD46: jmp 00500088h
  '004FFD4B: mov [ebp-04h], 00000016h
  '004FFD52: mov word ptr [ebp-24h], FFFFh
  '004FFD58: mov [ebp-04h], 00000017h
  '004FFD5F: mov edx, [ebp+0Ch]
  '004FFD62: mov eax, [ebp-5Ch]
  '004FFD65: mov [edx], eax
  '004FFD67: mov [ebp-04h], 00000018h
  '004FFD6E: mov ecx, [ebp-58h]
  '004FFD71: and ecx, 00000002h
  '004FFD74: test ecx, ecx
  '004FFD76: jz 4FFD8Ah
  '004FFD78: mov [ebp-04h], 00000019h
  '004FFD7F: mov edx, [ebp+10h]
  '004FFD82: mov [edx], 00000001h
  '004FFD88: jmp 4FFDBDh
  '004FFD8A: mov [ebp-04h], 0000001Ah
  '004FFD91: mov eax, [ebp-58h]
  '004FFD94: and eax, 00000001h
  '004FFD97: test eax, eax
  '004FFD99: jz 4FFDADh
  '004FFD9B: mov [ebp-04h], 0000001Bh
  '004FFDA2: mov ecx, [ebp+10h]
  '004FFDA5: mov [ecx], 00000002h
  '004FFDAB: jmp 4FFDBDh
  '004FFDAD: mov [ebp-04h], 0000001Dh
  '004FFDB4: mov edx, [ebp+10h]
  '004FFDB7: mov [edx], 00000000h
  '004FFDBD: mov [ebp-04h], 0000001Fh
  '004FFDC4: movsx eax, word ptr [ebp-54h]
  '004FFDC8: mov ecx, [ebp+18h]
  '004FFDCB: mov [ecx], eax
  '004FFDCD: mov [ebp-04h], 00000020h
  '004FFDD4: movsx edx, word ptr [ebp-52h]
  '004FFDD8: mov eax, [ebp+1Ch]
  '004FFDDB: mov [eax], edx
  '004FFDDD: mov [ebp-04h], 00000021h
  '004FFDE4: mov ecx, [ebp-58h]
  '004FFDE7: and ecx, 00000020h
  '004FFDEA: neg ecx
  '004FFDEC: sbb ecx, ecx
  '004FFDEE: neg ecx
  '004FFDF0: neg ecx
  '004FFDF2: mov edx, [ebp+30h]
  '004FFDF5: mov [edx], cx
  '004FFDF8: mov [ebp-04h], 00000022h
  '004FFDFF: mov eax, [ebp-64h]
  '004FFE02: push eax
  '004FFE03: call 0041D44Ch
  '004FFE08: mov [ebp-0000009Ch], eax
  '004FFE0E: call [0040109Ch]
  '004FFE14: mov ecx, [ebp-0000009Ch]
  '004FFE1A: mov [ebp-28h], ecx
  '004FFE1D: mov [ebp-04h], 00000023h
  '004FFE24: push 0000007Ah
  '004FFE26: mov edx, [ebp-28h]
  '004FFE29: push edx
  '004FFE2A: mov eax, [ebp+08h]
  '004FFE2D: add eax, 0000005Ch
  '004FFE30: push eax
  '004FFE31: lea ecx, [ebp-00000118h]
  '004FFE37: push ecx
  '004FFE38: push 0041D20Ch
  '004FFE3D: call [004011F8h]
  '004FFE43: push eax
  '004FFE44: call 0041D584h
  '004FFE49: call [0040109Ch]
  '004FFE4F: lea edx, [ebp-00000118h]
  '004FFE55: push edx
  '004FFE56: mov eax, [ebp+08h]
  '004FFE59: add eax, 0000005Ch
  '004FFE5C: push eax
  '004FFE5D: push 0041D20Ch
  '004FFE62: call [00401078h]
  '004FFE68: mov [ebp-04h], 00000024h
  '004FFE6F: mov ecx, [ebp-64h]
  '004FFE72: push ecx
  '004FFE73: call 0041D53Ch
  '004FFE78: call [0040109Ch]
  '004FFE7E: mov [ebp-04h], 00000025h
  '004FFE85: mov edx, [ebp+24h]
  '004FFE88: mov eax, [ebp+08h]
  '004FFE8B: mov cx, [eax+000000B2h]
  '004FFE92: mov [edx], cx
  '004FFE95: mov [ebp-04h], 00000026h
  '004FFE9C: mov edx, [ebp+08h]
  '004FFE9F: xor eax, eax
  '004FFEA1: cmp word ptr [edx+000000C0h], 0001h
  '004FFEA9: setz al
  '004FFEAC: neg eax
  '004FFEAE: mov ecx, [ebp+34h]
  '004FFEB1: mov [ecx], ax
  '004FFEB4: mov [ebp-04h], 00000027h
  '004FFEBB: push FFFFFFFFh
  '004FFEBD: call [004010E8h]
  '004FFEC3: mov [ebp-04h], 00000028h
  '004FFECA: push 00000000h
  '004FFECC: mov edx, [ebp+40h]
  '004FFECF: mov eax, [edx]
  '004FFED1: push eax
  '004FFED2: call [00401210h]
  '004FFED8: movsx ecx, ax
  '004FFEDB: test ecx, ecx
  '004FFEDD: jnz 00500037h
  '004FFEE3: mov [ebp-04h], 00000029h
  '004FFEEA: mov edx, [ebp+24h]
  '004FFEED: mov ax, [edx]
  '004FFEF0: mov [ebp-7Ch], ax
  '004FFEF4: mov [ebp-00000084h], 00000002h
  '004FFEFE: mov eax, 00000010h
  '004FFF03: call 004081B0h
  '004FFF08: mov ecx, esp
  '004FFF0A: mov edx, [ebp-00000084h]
  '004FFF10: mov [ecx], edx
  '004FFF12: mov eax, [ebp-80h]
  '004FFF15: mov [ecx+04h], eax
  '004FFF18: mov edx, [ebp-7Ch]
  '004FFF1B: mov [ecx+08h], edx
  '004FFF1E: mov eax, [ebp-78h]
  '004FFF21: mov [ecx+0Ch], eax
  '004FFF24: push 004288E0h
  '004FFF29: mov ecx, [ebp+40h]
  '004FFF2C: mov edx, [ecx]
  '004FFF2E: push edx
  '004FFF2F: call [004010BCh]
  '004FFF35: mov [ebp-04h], 0000002Ah
  '004FFF3C: mov eax, [ebp+08h]
  '004FFF3F: mov cx, [eax+000000A8h]
  '004FFF46: mov [ebp-7Ch], cx
  '004FFF4A: mov [ebp-00000084h], 00000002h
  '004FFF54: mov eax, 00000010h
  '004FFF59: call 004081B0h
  '004FFF5E: mov edx, esp
  '004FFF60: mov eax, [ebp-00000084h]
  '004FFF66: mov [edx], eax
  '004FFF68: mov ecx, [ebp-80h]
  '004FFF6B: mov [edx+04h], ecx
  '004FFF6E: mov eax, [ebp-7Ch]
  '004FFF71: mov [edx+08h], eax
  '004FFF74: mov ecx, [ebp-78h]
  '004FFF77: mov [edx+0Ch], ecx
  '004FFF7A: push 004288F0h
  '004FFF7F: mov edx, [ebp+40h]
  '004FFF82: mov eax, [edx]
  '004FFF84: push eax
  '004FFF85: call [004010BCh]
  '004FFF8B: mov [ebp-04h], 0000002Bh
  '004FFF92: mov ecx, [ebp+08h]
  '004FFF95: mov dx, [ecx+000000AAh]
  '004FFF9C: mov [ebp-7Ch], dx
  '004FFFA0: mov [ebp-00000084h], 00000002h
  '004FFFAA: mov eax, 00000010h
  '004FFFAF: call 004081B0h
  '004FFFB4: mov eax, esp
  '004FFFB6: mov ecx, [ebp-00000084h]
  '004FFFBC: mov [eax], ecx
  '004FFFBE: mov edx, [ebp-80h]
  '004FFFC1: mov [eax+04h], edx
  '004FFFC4: mov ecx, [ebp-7Ch]
  '004FFFC7: mov [eax+08h], ecx
  '004FFFCA: mov edx, [ebp-78h]
  '004FFFCD: mov [eax+0Ch], edx
  '004FFFD0: push 00428908h
  '004FFFD5: mov eax, [ebp+40h]
  '004FFFD8: mov ecx, [eax]
  '004FFFDA: push ecx
  '004FFFDB: call [004010BCh]
  '004FFFE1: mov [ebp-04h], 0000002Ch
  '004FFFE8: mov edx, [ebp+08h]
  '004FFFEB: mov ax, [edx+000000B6h]
  '004FFFF2: mov [ebp-7Ch], ax
  '004FFFF6: mov [ebp-00000084h], 00000002h
  '00500000: mov eax, 00000010h
  '00500005: call 004081B0h
  '0050000A: mov ecx, esp
  '0050000C: mov edx, [ebp-00000084h]
  '00500012: mov [ecx], edx
  '00500014: mov eax, [ebp-80h]
  '00500017: mov [ecx+04h], eax
  '0050001A: mov edx, [ebp-7Ch]
  '0050001D: mov [ecx+08h], edx
  '00500020: mov eax, [ebp-78h]
  '00500023: mov [ecx+0Ch], eax
  '00500026: push 0042891Ch
  '0050002B: mov ecx, [ebp+40h]
  '0050002E: mov edx, [ecx]
  '00500030: push edx
  '00500031: call [004010BCh]
  '00500037: mov [ebp-04h], 0000002Eh
  '0050003E: push 00000000h
  '00500040: call [004010E8h]
  '00500046: jmp 500088h
  '00500048: mov [ebp-04h], 00000030h
  '0050004F: mov word ptr [ebp-24h], 0000h
  '00500055: jmp 500088h
  '00500057: mov [ebp-04h], 00000032h
  '0050005E: call 0041D828h
  '00500063: mov [ebp-0000009Ch], eax
  '00500069: call [0040109Ch]
  '0050006F: mov eax, [ebp+08h]
  '00500072: mov ecx, [ebp-0000009Ch]
  '00500078: mov [eax+58h], ecx
  '0050007B: mov [ebp-04h], 00000033h
  '00500082: mov word ptr [ebp-24h], 0000h
  '00500088: mov edx, [ebp+08h]
  '0050008B: mov eax, [edx]
  '0050008D: mov ecx, [ebp+08h]
  '00500090: push ecx
  '00500091: call [eax+08h]
  '00500094: mov edx, [ebp+48h]
  '00500097: mov ax, [ebp-24h]
  '0050009B: mov [edx], ax
  '0050009E: mov eax, [ebp-10h]
  '005000A1: mov ecx, [ebp-20h]
  '005000A4: mov fs:[00000000h], ecx
  '005000AB: pop edi
  '005000AC: pop esi
  '005000AD: pop ebx
  '005000AE: mov esp, ebp
  '005000B0: pop ebp
  '005000B1: retn 0044h
End Sub
Private Sub unknown_500110
  '00500110: push ebp
  '00500111: mov ebp, esp
  '00500113: sub esp, 00000018h
  '00500116: push 004081B6h
  '0050011B: mov eax, fs:[00h]
  '00500121: push eax
  '00500122: mov fs:[00000000h], esp
  '00500129: mov eax, 0000025Ch
  '0050012E: call 004081B0h
  '00500133: push ebx
  '00500134: push esi
  '00500135: push edi
  '00500136: mov [ebp-18h], esp
  '00500139: mov [ebp-14h], 00405DB0h
  '00500140: mov [ebp-10h], 00000000h
  '00500147: mov [ebp-0Ch], 00000000h
  '0050014E: mov eax, [ebp+08h]
  '00500151: mov ecx, [eax]
  '00500153: mov edx, [ebp+08h]
  '00500156: push edx
  '00500157: call [ecx+04h]
  '0050015A: mov [ebp-04h], 00000001h
  '00500161: mov [ebp-04h], 00000002h
  '00500168: mov eax, [ebp+08h]
  '0050016B: mov [eax+54h], 00000000h
  '00500172: mov [ebp-04h], 00000003h
  '00500179: mov ecx, [ebp+08h]
  '0050017C: mov [ecx+58h], 00000000h
  '00500183: mov [ebp-04h], 00000004h
  '0050018A: mov [ebp-00000140h], FFFB5FFFh
  '00500194: mov [ebp-04h], 00000005h
  '0050019B: mov edx, [ebp+10h]
  '0050019E: mov ax, [edx]
  '005001A1: neg ax
  '005001A4: movsx ecx, ax
  '005001A7: imul ecx, 10h
  '005001AA: jo 0050096Dh
  '005001B0: mov edx, [ebp+14h]
  '005001B3: mov ax, [edx]
  '005001B6: neg ax
  '005001B9: movsx edx, ax
  '005001BC: imul edx, 00000100h
  '005001C2: jo 0050096Dh
  '005001C8: or ecx, edx
  '005001CA: mov eax, [ebp+18h]
  '005001CD: mov dx, [eax]
  '005001D0: neg dx
  '005001D3: movsx eax, dx
  '005001D6: imul eax, 00000200h
  '005001DC: jo 0050096Dh
  '005001E2: or ecx, eax
  '005001E4: mov edx, [ebp+1Ch]
  '005001E7: mov ax, [edx]
  '005001EA: neg ax
  '005001ED: movsx edx, ax
  '005001F0: imul edx, 20h
  '005001F3: jo 0050096Dh
  '005001F9: or ecx, edx
  '005001FB: or ecx, 00000002h
  '005001FE: mov eax, [ebp-00000140h]
  '00500204: and eax, 00000001h
  '00500207: or ecx, eax
  '00500209: mov [ebp-0000013Ch], ecx
  '0050020F: mov [ebp-04h], 00000006h
  '00500216: mov ecx, [ebp+4Ch]
  '00500219: cmp [ecx], 00000000h
  '0050021C: jnz 500247h
  '0050021E: mov [ebp-04h], 00000007h
  '00500225: mov edx, [ebp-0000013Ch]
  '0050022B: or edx, 00000004h
  '0050022E: mov [ebp-0000013Ch], edx
  '00500234: mov [ebp-04h], 00000008h
  '0050023B: mov [ebp-00000144h], 000003E8h
  '00500245: jmp 50026Dh
  '00500247: mov [ebp-04h], 0000000Ah
  '0050024E: mov eax, [ebp-0000013Ch]
  '00500254: or al, 08h
  '00500256: mov [ebp-0000013Ch], eax
  '0050025C: mov [ebp-04h], 0000000Bh
  '00500263: mov [ebp-00000144h], 00000064h
  '0050026D: mov [ebp-04h], 0000000Dh
  '00500274: mov [ebp-00000134h], 00000054h
  '0050027E: mov [ebp-04h], 0000000Eh
  '00500285: mov ecx, [ebp+0Ch]
  '00500288: mov edx, [ecx]
  '0050028A: mov [ebp-00000130h], edx
  '00500290: mov [ebp-04h], 0000000Fh
  '00500297: mov eax, [ebp+30h]
  '0050029A: mov ecx, [eax]
  '0050029C: imul ecx, [ebp-00000144h]
  '005002A3: jo 0050096Dh
  '005002A9: mov [ebp-00000104h], ecx
  '005002AF: mov [ebp-04h], 00000010h
  '005002B6: mov edx, [ebp+20h]
  '005002B9: mov eax, [edx]
  '005002BB: imul eax, [ebp-00000144h]
  '005002C2: jo 0050096Dh
  '005002C8: mov [ebp-00000108h], eax
  '005002CE: mov [ebp-04h], 00000011h
  '005002D5: mov ecx, [ebp+38h]
  '005002D8: mov edx, [ecx]
  '005002DA: imul edx, [ebp-00000144h]
  '005002E1: jo 0050096Dh
  '005002E7: mov [ebp-000000FCh], edx
  '005002ED: mov [ebp-04h], 00000012h
  '005002F4: mov eax, [ebp+28h]
  '005002F7: mov ecx, [eax]
  '005002F9: imul ecx, [ebp-00000144h]
  '00500300: jo 0050096Dh
  '00500306: mov [ebp-00000100h], ecx
  '0050030C: mov [ebp-04h], 00000013h
  '00500313: mov edx, [ebp+34h]
  '00500316: mov eax, [edx]
  '00500318: imul eax, [ebp-00000144h]
  '0050031F: jo 0050096Dh
  '00500325: mov [ebp-00000114h], eax
  '0050032B: mov [ebp-04h], 00000014h
  '00500332: mov ecx, [ebp+24h]
  '00500335: mov edx, [ecx]
  '00500337: imul edx, [ebp-00000144h]
  '0050033E: jo 0050096Dh
  '00500344: mov [ebp-00000118h], edx
  '0050034A: mov [ebp-04h], 00000015h
  '00500351: mov eax, [ebp+3Ch]
  '00500354: mov ecx, [eax]
  '00500356: imul ecx, [ebp-00000144h]
  '0050035D: jo 0050096Dh
  '00500363: mov [ebp-0000010Ch], ecx
  '00500369: mov [ebp-04h], 00000016h
  '00500370: mov edx, [ebp+2Ch]
  '00500373: mov eax, [edx]
  '00500375: imul eax, [ebp-00000144h]
  '0050037C: jo 0050096Dh
  '00500382: mov [ebp-00000110h], eax
  '00500388: mov [ebp-04h], 00000017h
  '0050038F: mov ecx, [ebp-0000013Ch]
  '00500395: mov [ebp-00000124h], ecx
  '0050039B: mov [ebp-04h], 00000018h
  '005003A2: lea edx, [ebp-00000134h]
  '005003A8: push edx
  '005003A9: call 0041D7D8h
  '005003AE: mov [ebp-00000168h], ax
  '005003B5: call [0040109Ch]
  '005003BB: movsx eax, word ptr [ebp-00000168h]
  '005003C2: test eax, eax
  '005003C4: jz 00500939h
  '005003CA: mov [ebp-04h], 00000019h
  '005003D1: mov word ptr [ebp-00000138h], FFFFh
  '005003DA: mov [ebp-04h], 0000001Ah
  '005003E1: fild dword ptr [ebp-00000104h]
  '005003E7: fstp real8 ptr [ebp-00000204h]
  '005003ED: fild dword ptr [ebp-00000144h]
  '005003F3: fstp real8 ptr [ebp-0000020Ch]
  '005003F9: fld real8 ptr [ebp-00000204h]
  '005003FF: cmp [00541000h], 00000000h
  '00500406: jnz 500410h
  '00500408: fdiv real8 ptr [ebp-0000020Ch]
  '0050040E: jmp 500421h
  '00500410: push [ebp-00000208h]
  '00500416: push [ebp-0000020Ch]
  '0050041C: call 004081D4h
  '00500421: fstsw ax
  '00500423: test al, 0Dh
  '00500425: jnz 00500968h
  '0050042B: call [0040135Ch]
  '00500431: mov ecx, [ebp+30h]
  '00500434: mov [ecx], eax
  '00500436: mov [ebp-04h], 0000001Bh
  '0050043D: fild dword ptr [ebp-00000108h]
  '00500443: fstp real8 ptr [ebp-00000214h]
  '00500449: fild dword ptr [ebp-00000144h]
  '0050044F: fstp real8 ptr [ebp-0000021Ch]
  '00500455: fld real8 ptr [ebp-00000214h]
  '0050045B: cmp [00541000h], 00000000h
  '00500462: jnz 50046Ch
  '00500464: fdiv real8 ptr [ebp-0000021Ch]
  '0050046A: jmp 50047Dh
  '0050046C: push [ebp-00000218h]
  '00500472: push [ebp-0000021Ch]
  '00500478: call 004081D4h
  '0050047D: fstsw ax
  '0050047F: test al, 0Dh
  '00500481: jnz 00500968h
  '00500487: call [0040135Ch]
  '0050048D: mov edx, [ebp+20h]
  '00500490: mov [edx], eax
  '00500492: mov [ebp-04h], 0000001Ch
  '00500499: fild dword ptr [ebp-000000FCh]
  '0050049F: fstp real8 ptr [ebp-00000224h]
  '005004A5: fild dword ptr [ebp-00000144h]
  '005004AB: fstp real8 ptr [ebp-0000022Ch]
  '005004B1: fld real8 ptr [ebp-00000224h]
  '005004B7: cmp [00541000h], 00000000h
  '005004BE: jnz 5004C8h
  '005004C0: fdiv real8 ptr [ebp-0000022Ch]
  '005004C6: jmp 5004D9h
  '005004C8: push [ebp-00000228h]
  '005004CE: push [ebp-0000022Ch]
  '005004D4: call 004081D4h
  '005004D9: fstsw ax
  '005004DB: test al, 0Dh
  '005004DD: jnz 00500968h
  '005004E3: call [0040135Ch]
  '005004E9: mov ecx, [ebp+38h]
  '005004EC: mov [ecx], eax
  '005004EE: mov [ebp-04h], 0000001Dh
  '005004F5: fild dword ptr [ebp-00000100h]
  '005004FB: fstp real8 ptr [ebp-00000234h]
  '00500501: fild dword ptr [ebp-00000144h]
  '00500507: fstp real8 ptr [ebp-0000023Ch]
  '0050050D: fld real8 ptr [ebp-00000234h]
  '00500513: cmp [00541000h], 00000000h
  '0050051A: jnz 500524h
  '0050051C: fdiv real8 ptr [ebp-0000023Ch]
  '00500522: jmp 500535h
  '00500524: push [ebp-00000238h]
  '0050052A: push [ebp-0000023Ch]
  '00500530: call 004081D4h
  '00500535: fstsw ax
  '00500537: test al, 0Dh
  '00500539: jnz 00500968h
  '0050053F: call [0040135Ch]
  '00500545: mov edx, [ebp+28h]
  '00500548: mov [edx], eax
  '0050054A: mov [ebp-04h], 0000001Eh
  '00500551: fild dword ptr [ebp-00000114h]
  '00500557: fstp real8 ptr [ebp-00000244h]
  '0050055D: fild dword ptr [ebp-00000144h]
  '00500563: fstp real8 ptr [ebp-0000024Ch]
  '00500569: fld real8 ptr [ebp-00000244h]
  '0050056F: cmp [00541000h], 00000000h
  '00500576: jnz 500580h
  '00500578: fdiv real8 ptr [ebp-0000024Ch]
  '0050057E: jmp 500591h
  '00500580: push [ebp-00000248h]
  '00500586: push [ebp-0000024Ch]
  '0050058C: call 004081D4h
  '00500591: fstsw ax
  '00500593: test al, 0Dh
  '00500595: jnz 00500968h
  '0050059B: call [0040135Ch]
  '005005A1: mov ecx, [ebp+34h]
  '005005A4: mov [ecx], eax
  '005005A6: mov [ebp-04h], 0000001Fh
  '005005AD: fild dword ptr [ebp-00000118h]
  '005005B3: fstp real8 ptr [ebp-00000254h]
  '005005B9: fild dword ptr [ebp-00000144h]
  '005005BF: fstp real8 ptr [ebp-0000025Ch]
  '005005C5: fld real8 ptr [ebp-00000254h]
  '005005CB: cmp [00541000h], 00000000h
  '005005D2: jnz 5005DCh
  '005005D4: fdiv real8 ptr [ebp-0000025Ch]
  '005005DA: jmp 5005EDh
  '005005DC: push [ebp-00000258h]
  '005005E2: push [ebp-0000025Ch]
  '005005E8: call 004081D4h
  '005005ED: fstsw ax
  '005005EF: test al, 0Dh
  '005005F1: jnz 00500968h
  '005005F7: call [0040135Ch]
  '005005FD: mov edx, [ebp+24h]
  '00500600: mov [edx], eax
  '00500602: mov [ebp-04h], 00000020h
  '00500609: fild dword ptr [ebp-0000010Ch]
  '0050060F: fstp real8 ptr [ebp-00000264h]
  '00500615: fild dword ptr [ebp-00000144h]
  '0050061B: fstp real8 ptr [ebp-0000026Ch]
  '00500621: fld real8 ptr [ebp-00000264h]
  '00500627: cmp [00541000h], 00000000h
  '0050062E: jnz 500638h
  '00500630: fdiv real8 ptr [ebp-0000026Ch]
  '00500636: jmp 500649h
  '00500638: push [ebp-00000268h]
  '0050063E: push [ebp-0000026Ch]
  '00500644: call 004081D4h
  '00500649: fstsw ax
  '0050064B: test al, 0Dh
  '0050064D: jnz 00500968h
  '00500653: call [0040135Ch]
  '00500659: mov ecx, [ebp+3Ch]
  '0050065C: mov [ecx], eax
  '0050065E: mov [ebp-04h], 00000021h
  '00500665: fild dword ptr [ebp-00000110h]
  '0050066B: fstp real8 ptr [ebp-00000274h]
  '00500671: fild dword ptr [ebp-00000144h]
  '00500677: fstp real8 ptr [ebp-0000027Ch]
  '0050067D: fld real8 ptr [ebp-00000274h]
  '00500683: cmp [00541000h], 00000000h
  '0050068A: jnz 500694h
  '0050068C: fdiv real8 ptr [ebp-0000027Ch]
  '00500692: jmp 5006A5h
  '00500694: push [ebp-00000278h]
  '0050069A: push [ebp-0000027Ch]
  '005006A0: call 004081D4h
  '005006A5: fstsw ax
  '005006A7: test al, 0Dh
  '005006A9: jnz 00500968h
  '005006AF: call [0040135Ch]
  '005006B5: mov edx, [ebp+2Ch]
  '005006B8: mov [edx], eax
  '005006BA: mov [ebp-04h], 00000022h
  '005006C1: mov eax, [ebp-0000012Ch]
  '005006C7: push eax
  '005006C8: call 0041D44Ch
  '005006CD: mov [ebp-0000016Ch], eax
  '005006D3: call [0040109Ch]
  '005006D9: mov ecx, [ebp-0000016Ch]
  '005006DF: mov [ebp-24h], ecx
  '005006E2: mov [ebp-04h], 00000023h
  '005006E9: push 0000007Ah
  '005006EB: mov edx, [ebp-24h]
  '005006EE: push edx
  '005006EF: lea eax, [ebp-000000E0h]
  '005006F5: push eax
  '005006F6: lea ecx, [ebp-000001E8h]
  '005006FC: push ecx
  '005006FD: push 0041D20Ch
  '00500702: call [004011F8h]
  '00500708: push eax
  '00500709: call 0041D584h
  '0050070E: call [0040109Ch]
  '00500714: lea edx, [ebp-000001E8h]
  '0050071A: push edx
  '0050071B: lea eax, [ebp-000000E0h]
  '00500721: push eax
  '00500722: push 0041D20Ch
  '00500727: call [00401078h]
  '0050072D: mov [ebp-04h], 00000024h
  '00500734: mov ecx, [ebp-0000012Ch]
  '0050073A: push ecx
  '0050073B: call 0041D53Ch
  '00500740: call [0040109Ch]
  '00500746: mov [ebp-04h], 00000025h
  '0050074D: movsx edx, word ptr [ebp-00000092h]
  '00500754: mov eax, [ebp+40h]
  '00500757: mov [eax], edx
  '00500759: mov [ebp-04h], 00000026h
  '00500760: movsx ecx, word ptr [ebp-00000094h]
  '00500767: mov edx, [ebp+44h]
  '0050076A: mov [edx], ecx
  '0050076C: mov [ebp-04h], 00000027h
  '00500773: movsx eax, word ptr [ebp-00000086h]
  '0050077A: mov ecx, [ebp+48h]
  '0050077D: mov [ecx], eax
  '0050077F: mov [ebp-04h], 00000028h
  '00500786: push FFFFFFFFh
  '00500788: call [004010E8h]
  '0050078E: mov [ebp-04h], 00000029h
  '00500795: push 00000000h
  '00500797: mov edx, [ebp+50h]
  '0050079A: mov eax, [edx]
  '0050079C: push eax
  '0050079D: call [00401210h]
  '005007A3: movsx ecx, ax
  '005007A6: test ecx, ecx
  '005007A8: jnz 0050092Ah
  '005007AE: mov [ebp-04h], 0000002Ah
  '005007B5: mov dx, [ebp-0000008Ah]
  '005007BC: mov [ebp-0000014Ch], dx
  '005007C3: mov [ebp-00000154h], 00000002h
  '005007CD: mov eax, 00000010h
  '005007D2: call 004081B0h
  '005007D7: mov eax, esp
  '005007D9: mov ecx, [ebp-00000154h]
  '005007DF: mov [eax], ecx
  '005007E1: mov edx, [ebp-00000150h]
  '005007E7: mov [eax+04h], edx
  '005007EA: mov ecx, [ebp-0000014Ch]
  '005007F0: mov [eax+08h], ecx
  '005007F3: mov edx, [ebp-00000148h]
  '005007F9: mov [eax+0Ch], edx
  '005007FC: push 004288E0h
  '00500801: mov eax, [ebp+50h]
  '00500804: mov ecx, [eax]
  '00500806: push ecx
  '00500807: call [004010BCh]
  '0050080D: mov [ebp-04h], 0000002Bh
  '00500814: mov dx, [ebp-00000094h]
  '0050081B: mov [ebp-0000014Ch], dx
  '00500822: mov [ebp-00000154h], 00000002h
  '0050082C: mov eax, 00000010h
  '00500831: call 004081B0h
  '00500836: mov eax, esp
  '00500838: mov ecx, [ebp-00000154h]
  '0050083E: mov [eax], ecx
  '00500840: mov edx, [ebp-00000150h]
  '00500846: mov [eax+04h], edx
  '00500849: mov ecx, [ebp-0000014Ch]
  '0050084F: mov [eax+08h], ecx
  '00500852: mov edx, [ebp-00000148h]
  '00500858: mov [eax+0Ch], edx
  '0050085B: push 004288F0h
  '00500860: mov eax, [ebp+50h]
  '00500863: mov ecx, [eax]
  '00500865: push ecx
  '00500866: call [004010BCh]
  '0050086C: mov [ebp-04h], 0000002Ch
  '00500873: mov dx, [ebp-00000092h]
  '0050087A: mov [ebp-0000014Ch], dx
  '00500881: mov [ebp-00000154h], 00000002h
  '0050088B: mov eax, 00000010h
  '00500890: call 004081B0h
  '00500895: mov eax, esp
  '00500897: mov ecx, [ebp-00000154h]
  '0050089D: mov [eax], ecx
  '0050089F: mov edx, [ebp-00000150h]
  '005008A5: mov [eax+04h], edx
  '005008A8: mov ecx, [ebp-0000014Ch]
  '005008AE: mov [eax+08h], ecx
  '005008B1: mov edx, [ebp-00000148h]
  '005008B7: mov [eax+0Ch], edx
  '005008BA: push 00428908h
  '005008BF: mov eax, [ebp+50h]
  '005008C2: mov ecx, [eax]
  '005008C4: push ecx
  '005008C5: call [004010BCh]
  '005008CB: mov [ebp-04h], 0000002Dh
  '005008D2: mov dx, [ebp-00000086h]
  '005008D9: mov [ebp-0000014Ch], dx
  '005008E0: mov [ebp-00000154h], 00000002h
  '005008EA: mov eax, 00000010h
  '005008EF: call 004081B0h
  '005008F4: mov eax, esp
  '005008F6: mov ecx, [ebp-00000154h]
  '005008FC: mov [eax], ecx
  '005008FE: mov edx, [ebp-00000150h]
  '00500904: mov [eax+04h], edx
  '00500907: mov ecx, [ebp-0000014Ch]
  '0050090D: mov [eax+08h], ecx
  '00500910: mov edx, [ebp-00000148h]
  '00500916: mov [eax+0Ch], edx
  '00500919: push 0042891Ch
  '0050091E: mov eax, [ebp+50h]
  '00500921: mov ecx, [eax]
  '00500923: push ecx
  '00500924: call [004010BCh]
  '0050092A: mov [ebp-04h], 0000002Fh
  '00500931: push 00000000h
  '00500933: call [004010E8h]
  '00500939: mov edx, [ebp+08h]
  '0050093C: mov eax, [edx]
  '0050093E: mov ecx, [ebp+08h]
  '00500941: push ecx
  '00500942: call [eax+08h]
  '00500945: mov edx, [ebp+58h]
  '00500948: mov ax, [ebp-00000138h]
  '0050094F: mov [edx], ax
  '00500952: mov eax, [ebp-10h]
  '00500955: mov ecx, [ebp-20h]
  '00500958: mov fs:[00000000h], ecx
  '0050095F: pop edi
  '00500960: pop esi
  '00500961: pop ebx
  '00500962: mov esp, ebp
  '00500964: pop ebp
  '00500965: retn 0054h
End Sub
Private Sub unknown_4FE720
  '004FE720: push ebp
  '004FE721: mov ebp, esp
  '004FE723: sub esp, 0000000Ch
  '004FE726: push 004081B6h
  '004FE72B: mov eax, fs:[00h]
  '004FE731: push eax
  '004FE732: mov fs:[00000000h], esp
  '004FE739: sub esp, 00000014h
  '004FE73C: push ebx
  '004FE73D: push esi
  '004FE73E: push edi
  '004FE73F: mov [ebp-0Ch], esp
  '004FE742: mov [ebp-08h], 00405C38h
  '004FE749: mov ecx, [ebp+10h]
  '004FE74C: mov esi, [ebp+0Ch]
  '004FE74F: xor eax, eax
  '004FE751: mov [ecx], eax
  '004FE753: mov edx, [esi]
  '004FE755: mov [ebp-18h], eax
  '004FE758: mov [ebp-1Ch], eax
  '004FE75B: lea eax, [ebp-1Ch]
  '004FE75E: push edx
  '004FE75F: push eax
  '004FE760: call [00401330h]
  '004FE766: push eax
  '004FE767: call 0041D338h
  '004FE76C: mov edi, eax
  '004FE76E: call [0040109Ch]
  '004FE774: mov ecx, [ebp-1Ch]
  '004FE777: push ecx
  '004FE778: push esi
  '004FE779: call [00401238h]
  '004FE77F: mov edx, [esi]
  '004FE781: push edi
  '004FE782: push edx
  '004FE783: call [00401354h]
  '004FE789: mov edx, eax
  '004FE78B: lea ecx, [ebp-18h]
  '004FE78E: call [00401378h]
  '004FE794: lea ecx, [ebp-1Ch]
  '004FE797: call [004013B4h]
  '004FE79D: push 004FE7BEh
  '004FE7A2: jmp 4FE7BDh
  '004FE7A4: test byte ptr [ebp-04h], 04h
  '004FE7A8: jz 4FE7B3h
  '004FE7AA: lea ecx, [ebp-18h]
  '004FE7AD: call [004013B4h]
  '004FE7B3: lea ecx, [ebp-1Ch]
  '004FE7B6: call [004013B4h]
  '004FE7BC: ret 
End Sub
Private Sub unknown_4FECA0
  '004FECA0: push ebp
  '004FECA1: mov ebp, esp
  '004FECA3: sub esp, 0000000Ch
  '004FECA6: push 004081B6h
  '004FECAB: mov eax, fs:[00h]
  '004FECB1: push eax
  '004FECB2: mov fs:[00000000h], esp
  '004FECB9: sub esp, 0000003Ch
  '004FECBC: push ebx
  '004FECBD: push esi
  '004FECBE: push edi
  '004FECBF: mov [ebp-0Ch], esp
  '004FECC2: mov [ebp-08h], 00405C58h
  '004FECC9: mov edx, [ebp+0Ch]
  '004FECCC: xor esi, esi
  '004FECCE: lea ecx, [ebp-24h]
  '004FECD1: mov [ebp-20h], esi
  '004FECD4: mov [ebp-24h], esi
  '004FECD7: mov [ebp-28h], esi
  '004FECDA: mov [ebp-38h], esi
  '004FECDD: call [004012D8h]
  '004FECE3: mov ecx, [ebp-24h]
  '004FECE6: mov eax, [ebp+14h]
  '004FECE9: push ecx
  '004FECEA: push 0041BC60h
  '004FECEF: mov [eax], esi
  '004FECF1: mov edi, 00000001h
  '004FECF6: call [00401184h]
  '004FECFC: test eax, eax
  '004FECFE: jz 004FEDBCh
  '004FED04: mov ebx, [00401378h]
  '004FED0A: mov edx, [ebp-24h]
  '004FED0D: push edi
  '004FED0E: push edx
  '004FED0F: push 004288C0h
  '004FED14: push esi
  '004FED15: mov esi, [004012ACh]
  '004FED1B: call esi
  '004FED1D: test eax, eax
  '004FED1F: jz 004FEDBCh
  '004FED25: add eax, 00000001h
  '004FED28: jo 004FEE0Ah
  '004FED2E: push eax
  '004FED2F: mov eax, [ebp-24h]
  '004FED32: push eax
  '004FED33: push 004288C0h
  '004FED38: push 00000000h
  '004FED3A: call esi
  '004FED3C: mov esi, eax
  '004FED3E: test esi, esi
  '004FED40: jz 4FED61h
  '004FED42: mov eax, [ebp-24h]
  '004FED45: mov ecx, esi
  '004FED47: lea edx, [ebp-38h]
  '004FED4A: sub ecx, edi
  '004FED4C: push edx
  '004FED4D: push edi
  '004FED4E: jo 004FEE0Ah
  '004FED54: mov [ebp-30h], ecx
  '004FED57: mov [ebp-38h], 00000003h
  '004FED5E: push eax
  '004FED5F: jmp 4FED78h
  '004FED61: mov edx, [ebp-24h]
  '004FED64: lea ecx, [ebp-38h]
  '004FED67: push ecx
  '004FED68: push edi
  '004FED69: mov [ebp-30h], 80020004h
  '004FED70: mov [ebp-38h], 0000000Ah
  '004FED77: push edx
  '004FED78: call [00401148h]
  '004FED7E: mov edx, eax
  '004FED80: lea ecx, [ebp-28h]
  '004FED83: call ebx
  '004FED85: lea ecx, [ebp-38h]
  '004FED88: call [00401030h]
  '004FED8E: mov eax, [ebp+10h]
  '004FED91: add esi, 00000001h
  '004FED94: jo 4FEE0Ah
  '004FED96: cmp eax, 00000001h
  '004FED99: mov edi, esi
  '004FED9B: jz 4FEDB0h
  '004FED9D: sub eax, 00000001h
  '004FEDA0: jo 4FEE0Ah
  '004FEDA2: test eax, eax
  '004FEDA4: mov [ebp+10h], eax
  '004FEDA7: jz 4FEDBCh
  '004FEDA9: xor esi, esi
  '004FEDAB: jmp 004FED0Ah
  '004FEDB0: mov edx, [ebp-28h]
  '004FEDB3: lea ecx, [ebp-20h]
  '004FEDB6: call [004012D8h]
  '004FEDBC: push 004FEDEDh
  '004FEDC1: jmp 4FEDDCh
  '004FEDC3: test byte ptr [ebp-04h], 04h
  '004FEDC7: jz 4FEDD2h
  '004FEDC9: lea ecx, [ebp-20h]
  '004FEDCC: call [004013B4h]
  '004FEDD2: lea ecx, [ebp-38h]
  '004FEDD5: call [00401030h]
  '004FEDDB: ret 
End Sub
Private Sub unknown_4FF220
  '004FF220: push ebx
  '004FF221: push ebp
  '004FF222: mov ebp, [esp+0Ch]
  '004FF226: push esi
  '004FF227: push edi
  '004FF228: xor esi, esi
  '004FF22A: movsx edi, si
  '004FF22D: push edi
  '004FF22E: call 0041D708h
  '004FF233: mov ebx, eax
  '004FF235: call [0040109Ch]
  '004FF23B: cmp edi, 00000010h
  '004FF23E: jb 4FF246h
  '004FF240: call [00401178h]
  '004FF246: mov eax, [ebp+44h]
  '004FF249: add si, 0001h
  '004FF24D: jo 4FF267h
  '004FF24F: cmp si, 000Fh
  '004FF253: mov [eax+edi*4], ebx
  '004FF256: jle 4FF22Ah
  '004FF258: pop edi
  '004FF259: mov word ptr [ebp+50h], FFFFh
  '004FF25F: pop esi
  '004FF260: pop ebp
  '004FF261: xor eax, eax
  '004FF263: pop ebx
  '004FF264: retn 0004h
End Sub
Private Sub unknown_5000C0
  '005000C0: sub esp, 000000BCh
  '005000C6: mov ecx, 0000002Fh
  '005000CB: xor eax, eax
  '005000CD: push esi
  '005000CE: push edi
  '005000CF: lea edi, [esp+08h]
  '005000D3: rep stosd 
  '005000D5: mov eax, [esp+000000C8h]
  '005000DC: lea ecx, [esp+08h]
  '005000E0: add eax, 0000005Ch
  '005000E3: push eax
  '005000E4: push ecx
  '005000E5: push 000000BCh
  '005000EA: call [00401084h]
  '005000F0: mov ecx, 0000002Fh
  '005000F5: lea esi, [esp+08h]
  '005000F9: mov edi, [esp+000000CCh]
  '00500100: xor eax, eax
  '00500102: rep movsd 
  '00500104: pop edi
  '00500105: pop esi
  '00500106: add esp, 000000BCh
  '0050010C: retn 0008h
End Sub
Private Sub unknown_500980
  '00500980: push ebp
  '00500981: mov ebp, esp
  '00500983: sub esp, 00000008h
  '00500986: push 004081B6h
  '0050098B: mov eax, fs:[00h]
  '00500991: push eax
  '00500992: mov fs:[00000000h], esp
  '00500999: sub esp, 00000098h
  '0050099F: push ebx
  '005009A0: push esi
  '005009A1: push edi
  '005009A2: mov [ebp-08h], esp
  '005009A5: mov [ebp-04h], 00405E98h
  '005009AC: mov eax, [ebp+0Ch]
  '005009AF: xor edi, edi
  '005009B1: mov [ebp-14h], edi
  '005009B4: mov [ebp-18h], edi
  '005009B7: mov ecx, [eax]
  '005009B9: mov eax, [54238Ch]
  '005009BE: cmp ecx, 000003E8h
  '005009C4: mov [ebp-1Ch], edi
  '005009C7: mov [ebp-20h], edi
  '005009CA: mov [ebp-30h], edi
  '005009CD: mov [ebp-40h], edi
  '005009D0: mov [ebp-50h], edi
  '005009D3: mov [ebp-60h], edi
  '005009D6: mov [ebp-70h], edi
  '005009D9: mov [ebp-00000094h], edi
  '005009DF: jle 00500B1Ah
  '005009E5: cmp eax, edi
  '005009E7: jnz 5009F9h
  '005009E9: push 0054238Ch
  '005009EE: push 0041D9E0h
  '005009F3: call [004012B8h]
  '005009F9: mov esi, [0054238Ch]
  '005009FF: lea edx, [ebp-20h]
  '00500A02: push edx
  '00500A03: push esi
  '00500A04: mov ecx, [esi]
  '00500A06: call [ecx+14h]
  '00500A09: cmp eax, edi
  '00500A0B: fclex 
  '00500A0D: jnl 500A22h
  '00500A0F: mov ebx, [004010A0h]
  '00500A15: push 00000014h
  '00500A17: push 0041D9D0h
  '00500A1C: push esi
  '00500A1D: push eax
  '00500A1E: call ebx
  '00500A20: jmp 500A28h
  '00500A22: mov ebx, [004010A0h]
  '00500A28: mov eax, [ebp-20h]
  '00500A2B: lea edx, [ebp-1Ch]
  '00500A2E: push edx
  '00500A2F: push eax
  '00500A30: mov ecx, [eax]
  '00500A32: mov esi, eax
  '00500A34: call [ecx+58h]
  '00500A37: cmp eax, edi
  '00500A39: fclex 
  '00500A3B: jnl 500A48h
  '00500A3D: push 00000058h
  '00500A3F: push 0041D9F0h
  '00500A44: push esi
  '00500A45: push eax
  '00500A46: call ebx
  '00500A48: mov eax, [ebp-1Ch]
  '00500A4B: push eax
  '00500A4C: push 0042893Ch
  '00500A51: call [0040108Ch]
  '00500A57: mov edx, eax
  '00500A59: lea ecx, [ebp-18h]
  '00500A5C: call [00401378h]
  '00500A62: lea ecx, [ebp-1Ch]
  '00500A65: call [004013B4h]
  '00500A6B: mov edi, [004013B8h]
  '00500A71: lea ecx, [ebp-20h]
  '00500A74: call edi
  '00500A76: mov eax, [ebp+08h]
  '00500A79: lea edx, [ebp-00000094h]
  '00500A7F: push edx
  '00500A80: mov edx, [ebp+0Ch]
  '00500A83: mov ecx, [eax]
  '00500A85: push edx
  '00500A86: push eax
  '00500A87: call [ecx+64h]
  '00500A8A: call [00401300h]
  '00500A90: push eax
  '00500A91: lea eax, [ebp-20h]
  '00500A94: push eax
  '00500A95: call [004010E4h]
  '00500A9B: mov ecx, 80020004h
  '00500AA0: lea edx, [ebp-18h]
  '00500AA3: mov [ebp-38h], ecx
  '00500AA6: mov [ebp-28h], ecx
  '00500AA9: lea ecx, [ebp-14h]
  '00500AAC: mov esi, eax
  '00500AAE: mov [ebp-68h], ecx
  '00500AB1: lea ecx, [ebp-40h]
  '00500AB4: mov [ebp-58h], edx
  '00500AB7: mov eax, 0000000Ah
  '00500ABC: push ecx
  '00500ABD: lea edx, [ebp-30h]
  '00500AC0: lea ecx, [ebp-70h]
  '00500AC3: mov [ebp-40h], eax
  '00500AC6: mov [ebp-30h], eax
  '00500AC9: push edx
  '00500ACA: mov eax, 00004008h
  '00500ACF: push ecx
  '00500AD0: mov ecx, [ebp-00000094h]
  '00500AD6: lea edx, [ebp-60h]
  '00500AD9: mov [ebp-70h], eax
  '00500ADC: mov [ebp-60h], eax
  '00500ADF: mov eax, [esi]
  '00500AE1: push edx
  '00500AE2: push ecx
  '00500AE3: push esi
  '00500AE4: call [eax+44h]
  '00500AE7: test eax, eax
  '00500AE9: fclex 
  '00500AEB: jnl 500AF8h
  '00500AED: push 00000044h
  '00500AEF: push 0041E948h
  '00500AF4: push esi
  '00500AF5: push eax
  '00500AF6: call ebx
  '00500AF8: lea ecx, [ebp-20h]
  '00500AFB: call edi
  '00500AFD: lea edx, [ebp-40h]
  '00500B00: lea eax, [ebp-30h]
  '00500B03: push edx
  '00500B04: push eax
  '00500B05: push 00000002h
  '00500B07: call [00401050h]
  '00500B0D: add esp, 0000000Ch
  '00500B10: push 00500C72h
  '00500B15: jmp 00500C61h
  '00500B1A: cmp eax, edi
  '00500B1C: jnz 500B2Eh
  '00500B1E: push 0054238Ch
  '00500B23: push 0041D9E0h
  '00500B28: call [004012B8h]
  '00500B2E: mov esi, [0054238Ch]
  '00500B34: lea edx, [ebp-20h]
  '00500B37: push edx
  '00500B38: push esi
  '00500B39: mov ecx, [esi]
  '00500B3B: call [ecx+14h]
  '00500B3E: cmp eax, edi
  '00500B40: fclex 
  '00500B42: jnl 500B57h
  '00500B44: mov ebx, [004010A0h]
  '00500B4A: push 00000014h
  '00500B4C: push 0041D9D0h
  '00500B51: push esi
  '00500B52: push eax
  '00500B53: call ebx
  '00500B55: jmp 500B5Dh
  '00500B57: mov ebx, [004010A0h]
  '00500B5D: mov eax, [ebp-20h]
  '00500B60: lea edx, [ebp-1Ch]
  '00500B63: push edx
  '00500B64: push eax
  '00500B65: mov ecx, [eax]
  '00500B67: mov esi, eax
  '00500B69: call [ecx+58h]
  '00500B6C: cmp eax, edi
  '00500B6E: fclex 
  '00500B70: jnl 500B7Dh
  '00500B72: push 00000058h
  '00500B74: push 0041D9F0h
  '00500B79: push esi
  '00500B7A: push eax
  '00500B7B: call ebx
  '00500B7D: mov eax, [ebp-1Ch]
  '00500B80: push eax
  '00500B81: push 0042895Ch
  '00500B86: call [0040108Ch]
  '00500B8C: mov edx, eax
  '00500B8E: lea ecx, [ebp-18h]
  '00500B91: call [00401378h]
  '00500B97: lea ecx, [ebp-1Ch]
  '00500B9A: call [004013B4h]
  '00500BA0: mov edi, [004013B8h]
  '00500BA6: lea ecx, [ebp-20h]
  '00500BA9: call edi
  '00500BAB: call [00401300h]
  '00500BB1: lea ecx, [ebp-20h]
  '00500BB4: push eax
  '00500BB5: push ecx
  '00500BB6: call [004010E4h]
  '00500BBC: mov ecx, 80020004h
  '00500BC1: lea edx, [ebp-18h]
  '00500BC4: mov [ebp-48h], ecx
  '00500BC7: mov [ebp-38h], ecx
  '00500BCA: mov [ebp-28h], ecx
  '00500BCD: lea ecx, [ebp-50h]
  '00500BD0: mov [ebp-58h], edx
  '00500BD3: push ecx
  '00500BD4: lea edx, [ebp-40h]
  '00500BD7: lea ecx, [ebp-30h]
  '00500BDA: push edx
  '00500BDB: push ecx
  '00500BDC: mov ecx, [ebp+0Ch]
  '00500BDF: lea edx, [ebp-60h]
  '00500BE2: mov esi, eax
  '00500BE4: mov eax, 0000000Ah
  '00500BE9: push edx
  '00500BEA: mov edx, [ecx]
  '00500BEC: mov [ebp-50h], eax
  '00500BEF: mov [ebp-40h], eax
  '00500BF2: mov [ebp-30h], eax
  '00500BF5: mov [ebp-60h], 00004008h
  '00500BFC: mov eax, [esi]
  '00500BFE: push edx
  '00500BFF: push esi
  '00500C00: call [eax+44h]
  '00500C03: test eax, eax
  '00500C05: fclex 
  '00500C07: jnl 500C14h
  '00500C09: push 00000044h
  '00500C0B: push 0041E948h
  '00500C10: push esi
  '00500C11: push eax
  '00500C12: call ebx
  '00500C14: lea ecx, [ebp-20h]
  '00500C17: call edi
  '00500C19: lea eax, [ebp-50h]
  '00500C1C: lea ecx, [ebp-40h]
  '00500C1F: push eax
  '00500C20: lea edx, [ebp-30h]
  '00500C23: push ecx
  '00500C24: push edx
  '00500C25: push 00000003h
  '00500C27: call [00401050h]
  '00500C2D: add esp, 00000010h
  '00500C30: push 00500C72h
  '00500C35: jmp 500C61h
  '00500C37: lea ecx, [ebp-1Ch]
  '00500C3A: call [004013B4h]
  '00500C40: lea ecx, [ebp-20h]
  '00500C43: call [004013B8h]
  '00500C49: lea eax, [ebp-50h]
  '00500C4C: lea ecx, [ebp-40h]
  '00500C4F: push eax
  '00500C50: lea edx, [ebp-30h]
  '00500C53: push ecx
  '00500C54: push edx
  '00500C55: push 00000003h
  '00500C57: call [00401050h]
  '00500C5D: add esp, 00000010h
  '00500C60: ret 
End Sub
Private Sub unknown_500C90
  '00500C90: push ebp
  '00500C91: mov ebp, esp
  '00500C93: sub esp, 00000008h
  '00500C96: push 004081B6h
  '00500C9B: mov eax, fs:[00h]
  '00500CA1: push eax
  '00500CA2: mov fs:[00000000h], esp
  '00500CA9: sub esp, 0000003Ch
  '00500CAC: push ebx
  '00500CAD: push esi
  '00500CAE: push edi
  '00500CAF: mov [ebp-08h], esp
  '00500CB2: mov [ebp-04h], 00405EA8h
  '00500CB9: mov eax, [ebp+08h]
  '00500CBC: mov edi, [ebp+0Ch]
  '00500CBF: lea edx, [ebp-44h]
  '00500CC2: xor esi, esi
  '00500CC4: mov ecx, [eax]
  '00500CC6: push edx
  '00500CC7: lea edx, [ebp-40h]
  '00500CCA: mov [ebp-18h], esi
  '00500CCD: push edx
  '00500CCE: push eax
  '00500CCF: mov [ebp-1Ch], esi
  '00500CD2: mov [ebp-2Ch], esi
  '00500CD5: mov [ebp-30h], esi
  '00500CD8: mov [ebp-44h], esi
  '00500CDB: mov [ebp-38h], edi
  '00500CDE: mov [ebp-40h], 00006011h
  '00500CE5: call [ecx+68h]
  '00500CE8: cmp [ebp-44h], si
  '00500CEC: jz 500D3Bh
  '00500CEE: mov eax, [ebp+10h]
  '00500CF1: push esi
  '00500CF2: lea ecx, [ebp-40h]
  '00500CF5: push 00000080h
  '00500CFA: lea edx, [ebp-2Ch]
  '00500CFD: push ecx
  '00500CFE: push edx
  '00500CFF: mov [ebp-38h], eax
  '00500D02: mov [ebp-40h], 00004008h
  '00500D09: call [0040125Ch]
  '00500D0F: lea eax, [ebp-2Ch]
  '00500D12: lea ecx, [ebp-30h]
  '00500D15: push eax
  '00500D16: push ecx
  '00500D17: call [004012B4h]
  '00500D1D: lea edx, [ebp-30h]
  '00500D20: push edx
  '00500D21: push edi
  '00500D22: call [0040102Ch]
  '00500D28: lea ecx, [ebp-2Ch]
  '00500D2B: call [00401030h]
  '00500D31: push 00500E89h
  '00500D36: jmp 00500E88h
  '00500D3B: mov eax, [edi]
  '00500D3D: push eax
  '00500D3E: push 00000001h
  '00500D40: call [004011D0h]
  '00500D46: mov ecx, [edi]
  '00500D48: mov ebx, eax
  '00500D4A: push ecx
  '00500D4B: push 00000001h
  '00500D4D: call [00401268h]
  '00500D53: mov esi, eax
  '00500D55: sub esi, ebx
  '00500D57: mov ebx, [ebp+10h]
  '00500D5A: jo 00500E9Eh
  '00500D60: mov edx, [ebx]
  '00500D62: add esi, 00000001h
  '00500D65: push edx
  '00500D66: jo 00500E9Eh
  '00500D6C: call [00401044h]
  '00500D72: cmp eax, esi
  '00500D74: jnl 500DD1h
  '00500D76: mov eax, [ebx]
  '00500D78: lea ecx, [ebp-2Ch]
  '00500D7B: push eax
  '00500D7C: push ecx
  '00500D7D: push eax
  '00500D7E: mov [ebp-24h], 00000000h
  '00500D85: mov [ebp-2Ch], 00000002h
  '00500D8C: call [00401044h]
  '00500D92: mov edx, esi
  '00500D94: sub edx, eax
  '00500D96: jo 00500E9Eh
  '00500D9C: push edx
  '00500D9D: call [0040123Ch]
  '00500DA3: mov edx, eax
  '00500DA5: lea ecx, [ebp-1Ch]
  '00500DA8: call [00401378h]
  '00500DAE: push eax
  '00500DAF: call [0040108Ch]
  '00500DB5: mov edx, eax
  '00500DB7: mov ecx, ebx
  '00500DB9: call [00401378h]
  '00500DBF: lea ecx, [ebp-1Ch]
  '00500DC2: call [004013B4h]
  '00500DC8: lea ecx, [ebp-2Ch]
  '00500DCB: call [00401030h]
  '00500DD1: mov eax, [edi]
  '00500DD3: lea ecx, [ebp-18h]
  '00500DD6: push eax
  '00500DD7: push ecx
  '00500DD8: call [00401324h]
  '00500DDE: mov eax, [ebp-18h]
  '00500DE1: test eax, eax
  '00500DE3: jz 500E0Fh
  '00500DE5: cmp word ptr [eax], 0001h
  '00500DE9: jnz 500E0Fh
  '00500DEB: mov edx, [edi]
  '00500DED: push edx
  '00500DEE: push 00000001h
  '00500DF0: call [004011D0h]
  '00500DF6: mov edi, eax
  '00500DF8: mov eax, [ebp-18h]
  '00500DFB: mov edx, [eax+14h]
  '00500DFE: mov ecx, [eax+10h]
  '00500E01: sub edi, edx
  '00500E03: cmp edi, ecx
  '00500E05: jb 500E17h
  '00500E07: call [00401178h]
  '00500E0D: jmp 500E17h
  '00500E0F: call [00401178h]
  '00500E15: mov edi, eax
  '00500E17: mov eax, [ebx]
  '00500E19: push esi
  '00500E1A: lea ecx, [ebp-1Ch]
  '00500E1D: push eax
  '00500E1E: push ecx
  '00500E1F: call [00401330h]
  '00500E25: mov edx, [ebp-18h]
  '00500E28: push eax
  '00500E29: mov eax, [edx+0Ch]
  '00500E2C: add eax, edi
  '00500E2E: push eax
  '00500E2F: call 0041D584h
  '00500E34: call [0040109Ch]
  '00500E3A: lea ecx, [ebp-18h]
  '00500E3D: push ecx
  '00500E3E: call [004013A8h]
  '00500E44: mov edx, [ebp-1Ch]
  '00500E47: push edx
  '00500E48: push ebx
  '00500E49: call [00401238h]
  '00500E4F: lea ecx, [ebp-1Ch]
  '00500E52: call [004013B4h]
  '00500E58: push 00500E89h
  '00500E5D: jmp 500E88h
  '00500E5F: lea eax, [ebp-18h]
  '00500E62: push eax
  '00500E63: call [004013A8h]
  '00500E69: lea ecx, [ebp-1Ch]
  '00500E6C: call [004013B4h]
  '00500E72: lea ecx, [ebp-2Ch]
  '00500E75: call [00401030h]
  '00500E7B: lea ecx, [ebp-30h]
  '00500E7E: push ecx
  '00500E7F: push 00000000h
  '00500E81: call [004010B8h]
  '00500E87: ret 
End Sub
Private Sub unknown_500EB0
  '00500EB0: push ebp
  '00500EB1: mov ebp, esp
  '00500EB3: sub esp, 0000000Ch
  '00500EB6: push 004081B6h
  '00500EBB: mov eax, fs:[00h]
  '00500EC1: push eax
  '00500EC2: mov fs:[00000000h], esp
  '00500EC9: sub esp, 0000002Ch
  '00500ECC: push ebx
  '00500ECD: push esi
  '00500ECE: push edi
  '00500ECF: mov [ebp-0Ch], esp
  '00500ED2: mov [ebp-08h], 00405EB8h
  '00500ED9: mov ecx, [ebp+10h]
  '00500EDC: mov edx, [ebp+0Ch]
  '00500EDF: xor eax, eax
  '00500EE1: mov [ebp-30h], edx
  '00500EE4: mov [ebp-18h], eax
  '00500EE7: mov [ebp-28h], eax
  '00500EEA: mov [ecx], eax
  '00500EEC: push eax
  '00500EED: lea eax, [ebp-38h]
  '00500EF0: push 00000040h
  '00500EF2: lea ecx, [ebp-28h]
  '00500EF5: push eax
  '00500EF6: push ecx
  '00500EF7: mov [ebp-38h], 00006011h
  '00500EFE: call [0040125Ch]
  '00500F04: lea edx, [ebp-28h]
  '00500F07: push edx
  '00500F08: call [0040103Ch]
  '00500F0E: mov edx, eax
  '00500F10: lea ecx, [ebp-18h]
  '00500F13: call [00401378h]
  '00500F19: lea ecx, [ebp-28h]
  '00500F1C: call [00401030h]
  '00500F22: push 00500F43h
  '00500F27: jmp 500F42h
  '00500F29: test byte ptr [ebp-04h], 04h
  '00500F2D: jz 500F38h
  '00500F2F: lea ecx, [ebp-18h]
  '00500F32: call [004013B4h]
  '00500F38: lea ecx, [ebp-28h]
  '00500F3B: call [00401030h]
  '00500F41: ret 
End Sub
Private Sub unknown_500F60
  '00500F60: mov eax, [esp+08h]
  '00500F64: mov edx, [esp+0Ch]
  '00500F68: mov ecx, [eax]
  '00500F6A: xor eax, eax
  '00500F6C: or ecx, 80040000h
  '00500F72: mov [edx], ecx
  '00500F74: retn 000Ch
End Sub
Private Sub APIReturn_500F80
  '00500F80: push ebp
  '00500F81: mov ebp, esp
  '00500F83: sub esp, 00000018h
  '00500F86: push 004081B6h
  '00500F8B: mov eax, fs:[00h]
  '00500F91: push eax
  '00500F92: mov fs:[00000000h], esp
  '00500F99: mov eax, 0000006Ch
  '00500F9E: call 004081B0h
  '00500FA3: push ebx
  '00500FA4: push esi
  '00500FA5: push edi
  '00500FA6: mov [ebp-18h], esp
  '00500FA9: mov [ebp-14h], 00405EC8h
  '00500FB0: mov [ebp-10h], 00000000h
  '00500FB7: mov [ebp-0Ch], 00000000h
  '00500FBE: mov [ebp-04h], 00000001h
  '00500FC5: mov [ebp-04h], 00000002h
  '00500FCC: push FFFFFFFFh
  '00500FCE: call [004010E8h]
  '00500FD4: mov [ebp-04h], 00000003h
  '00500FDB: mov eax, [ebp+0Ch]
  '00500FDE: push eax
  '00500FDF: call [00401130h]
  '00500FE5: mov ecx, [eax]
  '00500FE7: push ecx
  '00500FE8: push 00000001h
  '00500FEA: call [004011D0h]
  '00500FF0: mov [ebp-50h], eax
  '00500FF3: mov [ebp-58h], 00000003h
  '00500FFA: mov eax, 00000010h
  '00500FFF: call 004081B0h
  '00501004: mov edx, esp
  '00501006: mov eax, [ebp-58h]
  '00501009: mov [edx], eax
  '0050100B: mov ecx, [ebp-54h]
  '0050100E: mov [edx+04h], ecx
  '00501011: mov eax, [ebp-50h]
  '00501014: mov [edx+08h], eax
  '00501017: mov ecx, [ebp-4Ch]
  '0050101A: mov [edx+0Ch], ecx
  '0050101D: push 00000001h
  '0050101F: mov edx, [ebp+0Ch]
  '00501022: push edx
  '00501023: lea eax, [ebp-48h]
  '00501026: push eax
  '00501027: call [00401100h]
  '0050102D: add esp, 0000001Ch
  '00501030: mov edx, eax
  '00501032: lea ecx, [ebp-34h]
  '00501035: call [00401020h]
  '0050103B: mov [ebp-04h], 00000004h
  '00501042: call [00401300h]
  '00501048: push eax
  '00501049: lea ecx, [ebp-38h]
  '0050104C: push ecx
  '0050104D: call [004010E4h]
  '00501053: mov [ebp-70h], eax
  '00501056: lea edx, [ebp-6Ch]
  '00501059: push edx
  '0050105A: mov eax, [ebp-70h]
  '0050105D: mov ecx, [eax]
  '0050105F: mov edx, [ebp-70h]
  '00501062: push edx
  '00501063: call [ecx+1Ch]
  '00501066: fclex 
  '00501068: mov [ebp-74h], eax
  '0050106B: cmp [ebp-74h], 00000000h
  '0050106F: jnl 50108Eh
  '00501071: push 0000001Ch
  '00501073: push 0041E948h
  '00501078: mov eax, [ebp-70h]
  '0050107B: push eax
  '0050107C: mov ecx, [ebp-74h]
  '0050107F: push ecx
  '00501080: call [004010A0h]
  '00501086: mov [ebp-0000008Ch], eax
  '0050108C: jmp 501098h
  '0050108E: mov [ebp-0000008Ch], 00000000h
  '00501098: xor edx, edx
  '0050109A: cmp [ebp-6Ch], 00000000h
  '0050109E: setnz dl
  '005010A1: neg edx
  '005010A3: mov [ebp-24h], dx
  '005010A7: lea ecx, [ebp-38h]
  '005010AA: call [004013B8h]
  '005010B0: push 005010D4h
  '005010B5: jmp 5010CAh
  '005010B7: lea ecx, [ebp-38h]
  '005010BA: call [004013B8h]
  '005010C0: lea ecx, [ebp-48h]
  '005010C3: call [00401030h]
  '005010C9: ret 
End Sub

