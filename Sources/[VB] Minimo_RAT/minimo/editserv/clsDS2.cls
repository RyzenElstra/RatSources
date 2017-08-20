Private Sub unknown_484B10
  '00484B10: push ebp
  '00484B11: mov ebp, esp
  '00484B13: sub esp, 0000000Ch
  '00484B16: push 00403796h
  '00484B1B: mov eax, fs:[00h]
  '00484B21: push eax
  '00484B22: mov fs:[00000000h], esp
  '00484B29: sub esp, 00000078h
  '00484B2C: push ebx
  '00484B2D: push esi
  '00484B2E: push edi
  '00484B2F: mov [ebp-0Ch], esp
  '00484B32: mov [ebp-08h], 004028A8h
  '00484B39: xor esi, esi
  '00484B3B: mov [ebp-04h], esi
  '00484B3E: mov edi, [ebp+08h]
  '00484B41: push edi
  '00484B42: mov eax, [edi]
  '00484B44: call [eax+04h]
  '00484B47: mov ecx, [ebp+10h]
  '00484B4A: push edi
  '00484B4B: mov [ebp-18h], esi
  '00484B4E: mov [ebp-24h], esi
  '00484B51: mov [ecx], esi
  '00484B53: mov edx, [edi]
  '00484B55: mov [ebp-28h], esi
  '00484B58: mov [ebp-38h], esi
  '00484B5B: mov [ebp-48h], esi
  '00484B5E: mov [ebp-6Ch], esi
  '00484B61: call [edx+48h]
  '00484B64: mov eax, [ebp+0Ch]
  '00484B67: mov ecx, [eax]
  '00484B69: push ecx
  '00484B6A: call [0040103Ch]
  '00484B70: mov ebx, [004012BCh]
  '00484B76: mov [ebp-0000008Ch], eax
  '00484B7C: fild dword ptr [ebp-0000008Ch]
  '00484B82: mov eax, 3FF00000h
  '00484B87: mov [ebp-74h], esi
  '00484B8A: mov [ebp-20h], esi
  '00484B8D: mov esi, [00401348h]
  '00484B93: fstp real8 ptr [ebp-7Ch]
  '00484B96: mov [ebp-70h], eax
  '00484B99: mov [ebp-1Ch], eax
  '00484B9C: fld real8 ptr [ebp-20h]
  '00484B9F: fcomp real8 ptr [ebp-7Ch]
  '00484BA2: fstsw ax
  '00484BA4: test ah, 41h
  '00484BA7: jz 00484C69h
  '00484BAD: fld real8 ptr [ebp-20h]
  '00484BB0: lea edx, [ebp-38h]
  '00484BB3: mov [ebp-30h], 00000001h
  '00484BBA: push edx
  '00484BBB: mov [ebp-38h], 00000002h
  '00484BC2: call [00401320h]
  '00484BC8: push eax
  '00484BC9: mov eax, [ebp+0Ch]
  '00484BCC: mov ecx, [eax]
  '00484BCE: push ecx
  '00484BCF: call [00401138h]
  '00484BD5: mov edx, eax
  '00484BD7: lea ecx, [ebp-28h]
  '00484BDA: call esi
  '00484BDC: push eax
  '00484BDD: call [00401070h]
  '00484BE3: lea edx, [ebp-48h]
  '00484BE6: mov [ebp-40h], ax
  '00484BEA: push edx
  '00484BEB: mov [ebp-48h], 00000002h
  '00484BF2: call ebx
  '00484BF4: mov edx, eax
  '00484BF6: lea ecx, [ebp-18h]
  '00484BF9: call esi
  '00484BFB: lea ecx, [ebp-28h]
  '00484BFE: call [0040138Ch]
  '00484C04: lea eax, [ebp-48h]
  '00484C07: lea ecx, [ebp-38h]
  '00484C0A: push eax
  '00484C0B: push ecx
  '00484C0C: push 00000002h
  '00484C0E: call [00401058h]
  '00484C14: mov edx, [ebp-18h]
  '00484C17: add esp, 0000000Ch
  '00484C1A: push edx
  '00484C1B: call [0040103Ch]
  '00484C21: cmp eax, 00000002h
  '00484C24: jnl 484C3Ch
  '00484C26: mov eax, [ebp-18h]
  '00484C29: push 00417468h
  '00484C2E: push eax
  '00484C2F: call [00401094h]
  '00484C35: mov edx, eax
  '00484C37: lea ecx, [ebp-18h]
  '00484C3A: call esi
  '00484C3C: mov ecx, [edi]
  '00484C3E: lea edx, [ebp-6Ch]
  '00484C41: lea eax, [ebp-18h]
  '00484C44: push edx
  '00484C45: push eax
  '00484C46: push edi
  '00484C47: mov [ebp-6Ch], 00000000h
  '00484C4E: call [ecx+38h]
  '00484C51: fld real8 ptr [ebp-74h]
  '00484C54: fadd real8 ptr [ebp-20h]
  '00484C57: fstp real8 ptr [ebp-20h]
  '00484C5A: fstsw ax
  '00484C5C: test al, 0Dh
  '00484C5E: jnz 00484CEDh
  '00484C64: jmp 00484B9Ch
  '00484C69: mov ecx, [edi]
  '00484C6B: lea edx, [ebp-28h]
  '00484C6E: push edx
  '00484C6F: push edi
  '00484C70: call [ecx+44h]
  '00484C73: mov edx, [ebp-28h]
  '00484C76: lea ecx, [ebp-24h]
  '00484C79: mov [ebp-28h], 00000000h
  '00484C80: call esi
  '00484C82: mov eax, [edi]
  '00484C84: push edi
  '00484C85: call [eax+48h]
  '00484C88: wait 
  '00484C89: push 00484CC6h
  '00484C8E: jmp 484CBCh
  '00484C90: test byte ptr [ebp-04h], 04h
  '00484C94: jz 484C9Fh
  '00484C96: lea ecx, [ebp-24h]
  '00484C99: call [0040138Ch]
  '00484C9F: lea ecx, [ebp-28h]
  '00484CA2: call [0040138Ch]
  '00484CA8: lea ecx, [ebp-48h]
  '00484CAB: lea edx, [ebp-38h]
  '00484CAE: push ecx
  '00484CAF: push edx
  '00484CB0: push 00000002h
  '00484CB2: call [00401058h]
  '00484CB8: add esp, 0000000Ch
  '00484CBB: ret 
End Sub
Private Sub unknown_484F10
  '00484F10: push ebp
  '00484F11: mov ebp, esp
  '00484F13: sub esp, 00000014h
  '00484F16: push 00403796h
  '00484F1B: mov eax, fs:[00h]
  '00484F21: push eax
  '00484F22: mov fs:[00000000h], esp
  '00484F29: mov eax, 00000060h
  '00484F2E: call 00403790h
  '00484F33: push ebx
  '00484F34: push esi
  '00484F35: push edi
  '00484F36: mov [ebp-14h], esp
  '00484F39: mov [ebp-10h], 004028F0h
  '00484F40: mov [ebp-0Ch], 00000000h
  '00484F47: mov [ebp-08h], 00000000h
  '00484F4E: mov eax, [ebp+08h]
  '00484F51: mov ecx, [eax]
  '00484F53: mov edx, [ebp+08h]
  '00484F56: push edx
  '00484F57: call [ecx+04h]
  '00484F5A: push 00000001h
  '00484F5C: call [004010E8h]
  '00484F62: lea eax, [ebp-60h]
  '00484F65: push eax
  '00484F66: call [0040123Ch]
  '00484F6C: test eax, eax
  '00484F6E: jnz 484F72h
  '00484F70: jmp 484F7Dh
  '00484F72: mov word ptr [ebp-28h], 0000h
  '00484F78: jmp 00485202h
  '00484F7D: lea ecx, [ebp-58h]
  '00484F80: push ecx
  '00484F81: mov edx, [ebp+0Ch]
  '00484F84: push edx
  '00484F85: mov eax, [ebp+08h]
  '00484F88: mov ecx, [eax]
  '00484F8A: mov edx, [ebp+08h]
  '00484F8D: push edx
  '00484F8E: call [ecx+40h]
  '00484F91: movsx eax, word ptr [ebp-58h]
  '00484F95: test eax, eax
  '00484F97: jnz 484FA4h
  '00484F99: mov word ptr [ebp-28h], 0000h
  '00484F9F: jmp 00485202h
  '00484FA4: lea ecx, [ebp-58h]
  '00484FA7: push ecx
  '00484FA8: mov edx, [ebp+10h]
  '00484FAB: push edx
  '00484FAC: mov eax, [ebp+08h]
  '00484FAF: mov ecx, [eax]
  '00484FB1: mov edx, [ebp+08h]
  '00484FB4: push edx
  '00484FB5: call [ecx+40h]
  '00484FB8: xor eax, eax
  '00484FBA: cmp word ptr [ebp-58h], FFFFh
  '00484FBF: setnz al
  '00484FC2: mov ecx, [ebp+14h]
  '00484FC5: movsx edx, word ptr [ecx]
  '00484FC8: neg edx
  '00484FCA: sbb edx, edx
  '00484FCC: neg edx
  '00484FCE: or eax, edx
  '00484FD0: test eax, eax
  '00484FD2: jnz 484FDFh
  '00484FD4: mov word ptr [ebp-28h], 0000h
  '00484FDA: jmp 00485202h
  '00484FDF: mov [ebp-38h], 80020004h
  '00484FE6: mov [ebp-40h], 0000000Ah
  '00484FED: lea eax, [ebp-40h]
  '00484FF0: push eax
  '00484FF1: call [00401298h]
  '00484FF7: mov [ebp-24h], ax
  '00484FFB: lea ecx, [ebp-40h]
  '00484FFE: call [00401034h]
  '00485004: mov ecx, [ebp+0Ch]
  '00485007: mov edx, [ecx]
  '00485009: push edx
  '0048500A: mov ax, [ebp-24h]
  '0048500E: push eax
  '0048500F: push FFFFFFFFh
  '00485011: push 00000020h
  '00485013: call [00401290h]
  '00485019: push 00000000h
  '0048501B: mov cx, [ebp-24h]
  '0048501F: push ecx
  '00485020: call [0040129Ch]
  '00485026: push eax
  '00485027: push 00000001h
  '00485029: push 00000011h
  '0048502B: lea edx, [ebp-30h]
  '0048502E: push edx
  '0048502F: push 00000001h
  '00485031: push 00000080h
  '00485036: call [004011E4h]
  '0048503C: add esp, 0000001Ch
  '0048503F: cmp [ebp-30h], 00000000h
  '00485043: jz 485084h
  '00485045: mov eax, [ebp-30h]
  '00485048: cmp word ptr [eax], 0001h
  '0048504C: jnz 485084h
  '0048504E: push 00000001h
  '00485050: call [0040129Ch]
  '00485056: mov ecx, [ebp-30h]
  '00485059: sub eax, [ecx+14h]
  '0048505C: mov [ebp-5Ch], eax
  '0048505F: mov edx, [ebp-30h]
  '00485062: mov eax, [ebp-5Ch]
  '00485065: cmp eax, [edx+10h]
  '00485068: jnb 485073h
  '0048506A: mov [ebp-74h], 00000000h
  '00485071: jmp 48507Ch
  '00485073: call [00401170h]
  '00485079: mov [ebp-74h], eax
  '0048507C: mov ecx, [ebp-5Ch]
  '0048507F: mov [ebp-78h], ecx
  '00485082: jmp 48508Dh
  '00485084: call [00401170h]
  '0048508A: mov [ebp-78h], eax
  '0048508D: mov ecx, 00000020h
  '00485092: call [004011F4h]
  '00485098: mov edx, [ebp-30h]
  '0048509B: mov ecx, [edx+0Ch]
  '0048509E: mov edx, [ebp-78h]
  '004850A1: mov [ecx+edx], al
  '004850A4: mov ax, [ebp-24h]
  '004850A8: push eax
  '004850A9: lea ecx, [ebp-30h]
  '004850AC: push ecx
  '004850AD: push 00420E48h
  '004850B2: call [00401260h]
  '004850B8: mov dx, [ebp-24h]
  '004850BC: push edx
  '004850BD: call [00401160h]
  '004850C3: mov eax, [ebp+18h]
  '004850C6: mov [ebp-4Ch], eax
  '004850C9: mov [ebp-54h], 00004008h
  '004850D0: push 00000000h
  '004850D2: push 00000080h
  '004850D7: lea ecx, [ebp-54h]
  '004850DA: push ecx
  '004850DB: lea edx, [ebp-40h]
  '004850DE: push edx
  '004850DF: call [00401254h]
  '004850E5: lea eax, [ebp-40h]
  '004850E8: push eax
  '004850E9: lea ecx, [ebp-44h]
  '004850EC: push ecx
  '004850ED: call [00401294h]
  '004850F3: lea edx, [ebp-44h]
  '004850F6: push edx
  '004850F7: lea eax, [ebp-2Ch]
  '004850FA: push eax
  '004850FB: call [00401030h]
  '00485101: lea ecx, [ebp-40h]
  '00485104: call [00401034h]
  '0048510A: lea ecx, [ebp-40h]
  '0048510D: push ecx
  '0048510E: lea edx, [ebp-2Ch]
  '00485111: push edx
  '00485112: lea eax, [ebp-30h]
  '00485115: push eax
  '00485116: mov ecx, [ebp+08h]
  '00485119: mov edx, [ecx]
  '0048511B: mov eax, [ebp+08h]
  '0048511E: push eax
  '0048511F: call [edx+30h]
  '00485122: mov [ebp-5Ch], eax
  '00485125: cmp [ebp-5Ch], 00000000h
  '00485129: jnl 485145h
  '0048512B: push 00000030h
  '0048512D: push 00420CBCh
  '00485132: mov ecx, [ebp+08h]
  '00485135: push ecx
  '00485136: mov edx, [ebp-5Ch]
  '00485139: push edx
  '0048513A: call [004010A8h]
  '00485140: mov [ebp-7Ch], eax
  '00485143: jmp 48514Ch
  '00485145: mov [ebp-7Ch], 00000000h
  '0048514C: lea eax, [ebp-40h]
  '0048514F: push eax
  '00485150: lea ecx, [ebp-44h]
  '00485153: push ecx
  '00485154: call [00401294h]
  '0048515A: lea edx, [ebp-44h]
  '0048515D: push edx
  '0048515E: lea eax, [ebp-20h]
  '00485161: push eax
  '00485162: call [00401030h]
  '00485168: lea ecx, [ebp-40h]
  '0048516B: call [00401034h]
  '00485171: lea ecx, [ebp-58h]
  '00485174: push ecx
  '00485175: mov edx, [ebp+10h]
  '00485178: push edx
  '00485179: mov eax, [ebp+08h]
  '0048517C: mov ecx, [eax]
  '0048517E: mov edx, [ebp+08h]
  '00485181: push edx
  '00485182: call [ecx+40h]
  '00485185: cmp word ptr [ebp-58h], FFFFh
  '0048518A: jnz 4851A3h
  '0048518C: mov eax, [ebp+10h]
  '0048518F: mov [ebp-4Ch], eax
  '00485192: mov [ebp-54h], 00004008h
  '00485199: lea ecx, [ebp-54h]
  '0048519C: push ecx
  '0048519D: call [0040117Ch]
  '004851A3: mov [ebp-38h], 80020004h
  '004851AA: mov [ebp-40h], 0000000Ah
  '004851B1: lea edx, [ebp-40h]
  '004851B4: push edx
  '004851B5: call [00401298h]
  '004851BB: mov [ebp-24h], ax
  '004851BF: lea ecx, [ebp-40h]
  '004851C2: call [00401034h]
  '004851C8: mov eax, [ebp+10h]
  '004851CB: mov ecx, [eax]
  '004851CD: push ecx
  '004851CE: mov dx, [ebp-24h]
  '004851D2: push edx
  '004851D3: push FFFFFFFFh
  '004851D5: push 00000020h
  '004851D7: call [00401290h]
  '004851DD: mov ax, [ebp-24h]
  '004851E1: push eax
  '004851E2: lea ecx, [ebp-20h]
  '004851E5: push ecx
  '004851E6: push 00420E48h
  '004851EB: call [0040118Ch]
  '004851F1: mov dx, [ebp-24h]
  '004851F5: push edx
  '004851F6: call [00401160h]
  '004851FC: mov word ptr [ebp-28h], FFFFh
  '00485202: call [004010D4h]
  '00485208: push 00485254h
  '0048520D: jmp 485225h
  '0048520F: lea ecx, [ebp-40h]
  '00485212: call [00401034h]
  '00485218: lea eax, [ebp-44h]
  '0048521B: push eax
  '0048521C: push 00000000h
  '0048521E: call [004010C8h]
  '00485224: ret 
End Sub
Private Sub unknown_485280
  '00485280: push ebp
  '00485281: mov ebp, esp
  '00485283: sub esp, 0000000Ch
  '00485286: push 00403796h
  '0048528B: mov eax, fs:[00h]
  '00485291: push eax
  '00485292: mov fs:[00000000h], esp
  '00485299: sub esp, 00000080h
  '0048529F: push ebx
  '004852A0: push esi
  '004852A1: push edi
  '004852A2: mov [ebp-0Ch], esp
  '004852A5: mov [ebp-08h], 00402918h
  '004852AC: xor edi, edi
  '004852AE: mov [ebp-04h], edi
  '004852B1: mov esi, [ebp+08h]
  '004852B4: push esi
  '004852B5: mov eax, [esi]
  '004852B7: call [eax+04h]
  '004852BA: mov ecx, [ebp+18h]
  '004852BD: mov edx, [ebp+0Ch]
  '004852C0: mov ebx, [00401254h]
  '004852C6: push edi
  '004852C7: mov [ecx], edi
  '004852C9: lea eax, [ebp-74h]
  '004852CC: push 00000080h
  '004852D1: lea ecx, [ebp-2Ch]
  '004852D4: push eax
  '004852D5: mov [ebp-74h], edi
  '004852D8: push ecx
  '004852D9: mov [ebp-18h], edi
  '004852DC: mov [ebp-1Ch], edi
  '004852DF: mov [ebp-2Ch], edi
  '004852E2: mov [ebp-3Ch], edi
  '004852E5: mov [ebp-4Ch], edi
  '004852E8: mov [ebp-5Ch], edi
  '004852EB: mov [ebp-60h], edi
  '004852EE: mov [ebp-64h], edi
  '004852F1: mov [ebp-00000084h], edi
  '004852F7: mov [ebp-6Ch], edx
  '004852FA: mov [ebp-74h], 00004008h
  '00485301: call ebx
  '00485303: mov edx, [ebp+10h]
  '00485306: push edi
  '00485307: lea eax, [ebp-00000084h]
  '0048530D: push 00000080h
  '00485312: lea ecx, [ebp-3Ch]
  '00485315: push eax
  '00485316: push ecx
  '00485317: mov [ebp-7Ch], edx
  '0048531A: mov [ebp-00000084h], 00004008h
  '00485324: call ebx
  '00485326: lea edx, [ebp-3Ch]
  '00485329: lea eax, [ebp-64h]
  '0048532C: push edx
  '0048532D: push eax
  '0048532E: call [00401294h]
  '00485334: lea ecx, [ebp-2Ch]
  '00485337: lea edx, [ebp-60h]
  '0048533A: push ecx
  '0048533B: push edx
  '0048533C: call [00401294h]
  '00485342: mov eax, [esi]
  '00485344: lea ecx, [ebp-4Ch]
  '00485347: push ecx
  '00485348: lea edx, [ebp-64h]
  '0048534B: lea ecx, [ebp-60h]
  '0048534E: push edx
  '0048534F: push ecx
  '00485350: push esi
  '00485351: call [eax+30h]
  '00485354: cmp eax, edi
  '00485356: jnl 485367h
  '00485358: push 00000030h
  '0048535A: push 00420CBCh
  '0048535F: push esi
  '00485360: push eax
  '00485361: call [004010A8h]
  '00485367: lea edx, [ebp-60h]
  '0048536A: push edx
  '0048536B: push edi
  '0048536C: call [0040113Ch]
  '00485372: lea eax, [ebp-64h]
  '00485375: push eax
  '00485376: push edi
  '00485377: call [0040113Ch]
  '0048537D: push edi
  '0048537E: lea ecx, [ebp-4Ch]
  '00485381: push 00000040h
  '00485383: lea edx, [ebp-5Ch]
  '00485386: push ecx
  '00485387: push edx
  '00485388: call ebx
  '0048538A: lea eax, [ebp-5Ch]
  '0048538D: push eax
  '0048538E: call [00401048h]
  '00485394: mov ebx, [00401348h]
  '0048539A: mov edx, eax
  '0048539C: lea ecx, [ebp-18h]
  '0048539F: call ebx
  '004853A1: lea ecx, [ebp-5Ch]
  '004853A4: lea edx, [ebp-4Ch]
  '004853A7: push ecx
  '004853A8: lea eax, [ebp-3Ch]
  '004853AB: push edx
  '004853AC: lea ecx, [ebp-2Ch]
  '004853AF: push eax
  '004853B0: push ecx
  '004853B1: push 00000004h
  '004853B3: call [00401058h]
  '004853B9: mov edx, [ebp+14h]
  '004853BC: add esp, 00000014h
  '004853BF: cmp word ptr [edx], FFFFh
  '004853C3: jnz 4853F1h
  '004853C5: mov eax, [esi]
  '004853C7: lea ecx, [ebp-1Ch]
  '004853CA: lea edx, [ebp-18h]
  '004853CD: push ecx
  '004853CE: push edx
  '004853CF: push esi
  '004853D0: call [eax+1Ch]
  '004853D3: cmp eax, edi
  '004853D5: jnl 4853E6h
  '004853D7: push 0000001Ch
  '004853D9: push 00420CBCh
  '004853DE: push esi
  '004853DF: push eax
  '004853E0: call [004010A8h]
  '004853E6: mov edx, [ebp-1Ch]
  '004853E9: lea ecx, [ebp-18h]
  '004853EC: mov [ebp-1Ch], edi
  '004853EF: call ebx
  '004853F1: push 00485443h
  '004853F6: jmp 485442h
  '004853F8: test byte ptr [ebp-04h], 04h
  '004853FC: jz 485407h
  '004853FE: lea ecx, [ebp-18h]
  '00485401: call [0040138Ch]
  '00485407: lea ecx, [ebp-1Ch]
  '0048540A: call [0040138Ch]
  '00485410: lea eax, [ebp-5Ch]
  '00485413: lea ecx, [ebp-4Ch]
  '00485416: push eax
  '00485417: lea edx, [ebp-3Ch]
  '0048541A: push ecx
  '0048541B: lea eax, [ebp-2Ch]
  '0048541E: push edx
  '0048541F: push eax
  '00485420: push 00000004h
  '00485422: call [00401058h]
  '00485428: mov esi, [004010C8h]
  '0048542E: add esp, 00000014h
  '00485431: lea ecx, [ebp-60h]
  '00485434: xor edi, edi
  '00485436: push ecx
  '00485437: push edi
  '00485438: call esi
  '0048543A: lea edx, [ebp-64h]
  '0048543D: push edx
  '0048543E: push edi
  '0048543F: call esi
  '00485441: ret 
End Sub
Private Sub EnHex_485470
  '00485470: push ebp
  '00485471: mov ebp, esp
  '00485473: sub esp, 0000000Ch
  '00485476: push 00403796h
  '0048547B: mov eax, fs:[00h]
  '00485481: push eax
  '00485482: mov fs:[00000000h], esp
  '00485489: sub esp, 00000080h
  '0048548F: push ebx
  '00485490: push esi
  '00485491: push edi
  '00485492: mov [ebp-0Ch], esp
  '00485495: mov [ebp-08h], 00402928h
  '0048549C: xor ebx, ebx
  '0048549E: mov [ebp-04h], ebx
  '004854A1: mov esi, [ebp+08h]
  '004854A4: push esi
  '004854A5: mov eax, [esi]
  '004854A7: call [eax+04h]
  '004854AA: mov ecx, [ebp+18h]
  '004854AD: mov edx, [ebp+14h]
  '004854B0: mov [ebp-18h], ebx
  '004854B3: mov [ebp-1Ch], ebx
  '004854B6: mov [ecx], ebx
  '004854B8: cmp word ptr [edx], FFFFh
  '004854BC: mov [ebp-2Ch], ebx
  '004854BF: mov [ebp-3Ch], ebx
  '004854C2: mov [ebp-4Ch], ebx
  '004854C5: mov [ebp-5Ch], ebx
  '004854C8: mov [ebp-60h], ebx
  '004854CB: mov [ebp-64h], ebx
  '004854CE: mov [ebp-74h], ebx
  '004854D1: mov [ebp-00000084h], ebx
  '004854D7: jnz 4854F7h
  '004854D9: mov edi, [ebp+0Ch]
  '004854DC: mov eax, [esi]
  '004854DE: lea ecx, [ebp-1Ch]
  '004854E1: push ecx
  '004854E2: push edi
  '004854E3: push esi
  '004854E4: call [eax+3Ch]
  '004854E7: mov edx, [ebp-1Ch]
  '004854EA: mov ecx, edi
  '004854EC: mov [ebp-1Ch], ebx
  '004854EF: call [00401348h]
  '004854F5: jmp 4854FAh
  '004854F7: mov edi, [ebp+0Ch]
  '004854FA: push ebx
  '004854FB: lea edx, [ebp-74h]
  '004854FE: push 00000080h
  '00485503: lea eax, [ebp-2Ch]
  '00485506: mov [ebp-6Ch], edi
  '00485509: mov edi, [00401254h]
  '0048550F: push edx
  '00485510: push eax
  '00485511: mov [ebp-74h], 00004008h
  '00485518: call edi
  '0048551A: mov ecx, [ebp+10h]
  '0048551D: push ebx
  '0048551E: lea edx, [ebp-00000084h]
  '00485524: push 00000080h
  '00485529: lea eax, [ebp-3Ch]
  '0048552C: push edx
  '0048552D: push eax
  '0048552E: mov [ebp-7Ch], ecx
  '00485531: mov [ebp-00000084h], 00004008h
  '0048553B: call edi
  '0048553D: mov ebx, [00401294h]
  '00485543: lea ecx, [ebp-3Ch]
  '00485546: lea edx, [ebp-64h]
  '00485549: push ecx
  '0048554A: push edx
  '0048554B: call ebx
  '0048554D: lea eax, [ebp-2Ch]
  '00485550: lea ecx, [ebp-60h]
  '00485553: push eax
  '00485554: push ecx
  '00485555: call ebx
  '00485557: mov edx, [esi]
  '00485559: lea eax, [ebp-4Ch]
  '0048555C: push eax
  '0048555D: lea ecx, [ebp-64h]
  '00485560: lea eax, [ebp-60h]
  '00485563: push ecx
  '00485564: push eax
  '00485565: push esi
  '00485566: call [edx+34h]
  '00485569: test eax, eax
  '0048556B: jnl 48557Ch
  '0048556D: push 00000034h
  '0048556F: push 00420CBCh
  '00485574: push esi
  '00485575: push eax
  '00485576: call [004010A8h]
  '0048557C: mov esi, [0040113Ch]
  '00485582: lea ecx, [ebp-60h]
  '00485585: push ecx
  '00485586: push 00000000h
  '00485588: call esi
  '0048558A: lea edx, [ebp-64h]
  '0048558D: push edx
  '0048558E: push 00000000h
  '00485590: call esi
  '00485592: push 00000000h
  '00485594: lea eax, [ebp-4Ch]
  '00485597: push 00000040h
  '00485599: lea ecx, [ebp-5Ch]
  '0048559C: push eax
  '0048559D: push ecx
  '0048559E: call edi
  '004855A0: lea edx, [ebp-5Ch]
  '004855A3: push edx
  '004855A4: call [00401048h]
  '004855AA: mov edx, eax
  '004855AC: lea ecx, [ebp-18h]
  '004855AF: call [00401348h]
  '004855B5: lea eax, [ebp-5Ch]
  '004855B8: lea ecx, [ebp-4Ch]
  '004855BB: push eax
  '004855BC: lea edx, [ebp-3Ch]
  '004855BF: push ecx
  '004855C0: lea eax, [ebp-2Ch]
  '004855C3: push edx
  '004855C4: push eax
  '004855C5: push 00000004h
  '004855C7: call [00401058h]
  '004855CD: add esp, 00000014h
  '004855D0: push 00485622h
  '004855D5: jmp 485621h
  '004855D7: test byte ptr [ebp-04h], 04h
  '004855DB: jz 4855E6h
  '004855DD: lea ecx, [ebp-18h]
  '004855E0: call [0040138Ch]
  '004855E6: lea ecx, [ebp-1Ch]
  '004855E9: call [0040138Ch]
  '004855EF: lea ecx, [ebp-5Ch]
  '004855F2: lea edx, [ebp-4Ch]
  '004855F5: push ecx
  '004855F6: lea eax, [ebp-3Ch]
  '004855F9: push edx
  '004855FA: lea ecx, [ebp-2Ch]
  '004855FD: push eax
  '004855FE: push ecx
  '004855FF: push 00000004h
  '00485601: call [00401058h]
  '00485607: mov esi, [004010C8h]
  '0048560D: add esp, 00000014h
  '00485610: lea edx, [ebp-60h]
  '00485613: push edx
  '00485614: push 00000000h
  '00485616: call esi
  '00485618: lea eax, [ebp-64h]
  '0048561B: push eax
  '0048561C: push 00000000h
  '0048561E: call esi
  '00485620: ret 
End Sub
Private Sub unknown_485650
  '00485650: push ebp
  '00485651: mov ebp, esp
  '00485653: sub esp, 00000014h
  '00485656: push 00403796h
  '0048565B: mov eax, fs:[00h]
  '00485661: push eax
  '00485662: mov fs:[00000000h], esp
  '00485669: mov eax, 00000058h
  '0048566E: call 00403790h
  '00485673: push ebx
  '00485674: push esi
  '00485675: push edi
  '00485676: mov [ebp-14h], esp
  '00485679: mov [ebp-10h], 00402938h
  '00485680: mov [ebp-0Ch], 00000000h
  '00485687: mov [ebp-08h], 00000000h
  '0048568E: mov eax, [ebp+08h]
  '00485691: mov ecx, [eax]
  '00485693: mov edx, [ebp+08h]
  '00485696: push edx
  '00485697: call [ecx+04h]
  '0048569A: push 00000001h
  '0048569C: call [004010E8h]
  '004856A2: lea eax, [ebp-60h]
  '004856A5: push eax
  '004856A6: call [0040123Ch]
  '004856AC: test eax, eax
  '004856AE: jnz 4856B2h
  '004856B0: jmp 4856BDh
  '004856B2: mov word ptr [ebp-30h], 0000h
  '004856B8: jmp 004858D1h
  '004856BD: lea ecx, [ebp-58h]
  '004856C0: push ecx
  '004856C1: mov edx, [ebp+0Ch]
  '004856C4: push edx
  '004856C5: mov eax, [ebp+08h]
  '004856C8: mov ecx, [eax]
  '004856CA: mov edx, [ebp+08h]
  '004856CD: push edx
  '004856CE: call [ecx+40h]
  '004856D1: movsx eax, word ptr [ebp-58h]
  '004856D5: test eax, eax
  '004856D7: jnz 4856E4h
  '004856D9: mov word ptr [ebp-30h], 0000h
  '004856DF: jmp 004858D1h
  '004856E4: lea ecx, [ebp-58h]
  '004856E7: push ecx
  '004856E8: mov edx, [ebp+10h]
  '004856EB: push edx
  '004856EC: mov eax, [ebp+08h]
  '004856EF: mov ecx, [eax]
  '004856F1: mov edx, [ebp+08h]
  '004856F4: push edx
  '004856F5: call [ecx+40h]
  '004856F8: cmp word ptr [ebp-58h], FFFFh
  '004856FD: jnz 48570Ah
  '004856FF: mov word ptr [ebp-30h], 0000h
  '00485705: jmp 004858D1h
  '0048570A: mov [ebp-38h], 80020004h
  '00485711: mov [ebp-40h], 0000000Ah
  '00485718: lea eax, [ebp-40h]
  '0048571B: push eax
  '0048571C: call [00401298h]
  '00485722: mov [ebp-24h], ax
  '00485726: lea ecx, [ebp-40h]
  '00485729: call [00401034h]
  '0048572F: mov ecx, [ebp+0Ch]
  '00485732: mov edx, [ecx]
  '00485734: push edx
  '00485735: mov ax, [ebp-24h]
  '00485739: push eax
  '0048573A: push FFFFFFFFh
  '0048573C: push 00000020h
  '0048573E: call [00401290h]
  '00485744: push 00000000h
  '00485746: mov cx, [ebp-24h]
  '0048574A: push ecx
  '0048574B: call [0040129Ch]
  '00485751: sub eax, 00000001h
  '00485754: jo 0048594Fh
  '0048575A: push eax
  '0048575B: push 00000001h
  '0048575D: push 00000011h
  '0048575F: lea edx, [ebp-2Ch]
  '00485762: push edx
  '00485763: push 00000001h
  '00485765: push 00000080h
  '0048576A: call [004011E4h]
  '00485770: add esp, 0000001Ch
  '00485773: mov ax, [ebp-24h]
  '00485777: push eax
  '00485778: lea ecx, [ebp-2Ch]
  '0048577B: push ecx
  '0048577C: push 00420E48h
  '00485781: call [00401260h]
  '00485787: mov dx, [ebp-24h]
  '0048578B: push edx
  '0048578C: call [00401160h]
  '00485792: mov eax, [ebp+18h]
  '00485795: mov [ebp-4Ch], eax
  '00485798: mov [ebp-54h], 00004008h
  '0048579F: push 00000000h
  '004857A1: push 00000080h
  '004857A6: lea ecx, [ebp-54h]
  '004857A9: push ecx
  '004857AA: lea edx, [ebp-40h]
  '004857AD: push edx
  '004857AE: call [00401254h]
  '004857B4: lea eax, [ebp-40h]
  '004857B7: push eax
  '004857B8: lea ecx, [ebp-44h]
  '004857BB: push ecx
  '004857BC: call [00401294h]
  '004857C2: lea edx, [ebp-44h]
  '004857C5: push edx
  '004857C6: lea eax, [ebp-28h]
  '004857C9: push eax
  '004857CA: call [00401030h]
  '004857D0: lea ecx, [ebp-40h]
  '004857D3: call [00401034h]
  '004857D9: lea ecx, [ebp-40h]
  '004857DC: push ecx
  '004857DD: lea edx, [ebp-28h]
  '004857E0: push edx
  '004857E1: lea eax, [ebp-2Ch]
  '004857E4: push eax
  '004857E5: mov ecx, [ebp+08h]
  '004857E8: mov edx, [ecx]
  '004857EA: mov eax, [ebp+08h]
  '004857ED: push eax
  '004857EE: call [edx+34h]
  '004857F1: mov [ebp-5Ch], eax
  '004857F4: cmp [ebp-5Ch], 00000000h
  '004857F8: jnl 485814h
  '004857FA: push 00000034h
  '004857FC: push 00420CBCh
  '00485801: mov ecx, [ebp+08h]
  '00485804: push ecx
  '00485805: mov edx, [ebp-5Ch]
  '00485808: push edx
  '00485809: call [004010A8h]
  '0048580F: mov [ebp-74h], eax
  '00485812: jmp 48581Bh
  '00485814: mov [ebp-74h], 00000000h
  '0048581B: lea eax, [ebp-40h]
  '0048581E: push eax
  '0048581F: lea ecx, [ebp-44h]
  '00485822: push ecx
  '00485823: call [00401294h]
  '00485829: lea edx, [ebp-44h]
  '0048582C: push edx
  '0048582D: lea eax, [ebp-20h]
  '00485830: push eax
  '00485831: call [00401030h]
  '00485837: lea ecx, [ebp-40h]
  '0048583A: call [00401034h]
  '00485840: lea ecx, [ebp-58h]
  '00485843: push ecx
  '00485844: mov edx, [ebp+10h]
  '00485847: push edx
  '00485848: mov eax, [ebp+08h]
  '0048584B: mov ecx, [eax]
  '0048584D: mov edx, [ebp+08h]
  '00485850: push edx
  '00485851: call [ecx+40h]
  '00485854: cmp word ptr [ebp-58h], FFFFh
  '00485859: jnz 485872h
  '0048585B: mov eax, [ebp+10h]
  '0048585E: mov [ebp-4Ch], eax
  '00485861: mov [ebp-54h], 00004008h
  '00485868: lea ecx, [ebp-54h]
  '0048586B: push ecx
  '0048586C: call [0040117Ch]
  '00485872: mov [ebp-38h], 80020004h
  '00485879: mov [ebp-40h], 0000000Ah
  '00485880: lea edx, [ebp-40h]
  '00485883: push edx
  '00485884: call [00401298h]
  '0048588A: mov [ebp-24h], ax
  '0048588E: lea ecx, [ebp-40h]
  '00485891: call [00401034h]
  '00485897: mov eax, [ebp+10h]
  '0048589A: mov ecx, [eax]
  '0048589C: push ecx
  '0048589D: mov dx, [ebp-24h]
  '004858A1: push edx
  '004858A2: push FFFFFFFFh
  '004858A4: push 00000020h
  '004858A6: call [00401290h]
  '004858AC: mov ax, [ebp-24h]
  '004858B0: push eax
  '004858B1: lea ecx, [ebp-20h]
  '004858B4: push ecx
  '004858B5: push 00420E48h
  '004858BA: call [0040118Ch]
  '004858C0: mov dx, [ebp-24h]
  '004858C4: push edx
  '004858C5: call [00401160h]
  '004858CB: mov word ptr [ebp-30h], FFFFh
  '004858D1: call [004010D4h]
  '004858D7: push 00485923h
  '004858DC: jmp 4858F4h
  '004858DE: lea ecx, [ebp-40h]
  '004858E1: call [00401034h]
  '004858E7: lea eax, [ebp-44h]
  '004858EA: push eax
  '004858EB: push 00000000h
  '004858ED: call [004010C8h]
  '004858F3: ret 
End Sub
Private Sub unknown_4859A0
  '004859A0: push ebp
  '004859A1: mov ebp, esp
  '004859A3: sub esp, 0000000Ch
  '004859A6: push 00403796h
  '004859AB: mov eax, fs:[00h]
  '004859B1: push eax
  '004859B2: mov fs:[00000000h], esp
  '004859B9: sub esp, 000000ACh
  '004859BF: push ebx
  '004859C0: push esi
  '004859C1: push edi
  '004859C2: mov [ebp-0Ch], esp
  '004859C5: mov [ebp-08h], 00402970h
  '004859CC: xor esi, esi
  '004859CE: mov [ebp-04h], esi
  '004859D1: mov eax, [ebp+08h]
  '004859D4: push eax
  '004859D5: mov ecx, [eax]
  '004859D7: call [ecx+04h]
  '004859DA: mov edx, [ebp+14h]
  '004859DD: mov edi, [ebp+10h]
  '004859E0: mov ebx, [00401264h]
  '004859E6: mov [ebp-34h], esi
  '004859E9: mov [edx], esi
  '004859EB: mov eax, [edi]
  '004859ED: push eax
  '004859EE: push 00000001h
  '004859F0: mov [ebp-38h], esi
  '004859F3: mov [ebp-3Ch], esi
  '004859F6: mov [ebp-40h], esi
  '004859F9: mov [ebp-50h], esi
  '004859FC: mov [ebp-60h], esi
  '004859FF: mov [ebp-64h], esi
  '00485A02: call ebx
  '00485A04: test eax, eax
  '00485A06: jnl 00485AD8h
  '00485A0C: push esi
  '00485A0D: push 00000002h
  '00485A0F: push 00000001h
  '00485A11: push 00000011h
  '00485A13: push edi
  '00485A14: push 00000001h
  '00485A16: push 00000080h
  '00485A1B: call [004011E4h]
  '00485A21: mov eax, [edi]
  '00485A23: add esp, 0000001Ch
  '00485A26: cmp eax, esi
  '00485A28: jz 485A44h
  '00485A2A: cmp word ptr [eax], 0001h
  '00485A2E: jnz 485A44h
  '00485A30: mov ebx, [eax+14h]
  '00485A33: mov ecx, [eax+10h]
  '00485A36: neg ebx
  '00485A38: cmp ebx, ecx
  '00485A3A: jb 485A4Ch
  '00485A3C: call [00401170h]
  '00485A42: jmp 485A4Ch
  '00485A44: call [00401170h]
  '00485A4A: mov ebx, eax
  '00485A4C: mov esi, [004011F4h]
  '00485A52: mov ecx, 00000001h
  '00485A57: call esi
  '00485A59: mov ecx, [edi]
  '00485A5B: mov edx, [ecx+0Ch]
  '00485A5E: mov [edx+ebx], al
  '00485A61: mov eax, [edi]
  '00485A63: test eax, eax
  '00485A65: jz 485A86h
  '00485A67: cmp word ptr [eax], 0001h
  '00485A6B: jnz 485A86h
  '00485A6D: mov edx, [eax+14h]
  '00485A70: mov ecx, [eax+10h]
  '00485A73: mov ebx, 00000001h
  '00485A78: sub ebx, edx
  '00485A7A: cmp ebx, ecx
  '00485A7C: jb 485A8Eh
  '00485A7E: call [00401170h]
  '00485A84: jmp 485A8Eh
  '00485A86: call [00401170h]
  '00485A8C: mov ebx, eax
  '00485A8E: mov ecx, 00000001h
  '00485A93: call esi
  '00485A95: mov ecx, [edi]
  '00485A97: mov edx, [ecx+0Ch]
  '00485A9A: mov [edx+ebx], al
  '00485A9D: mov eax, [edi]
  '00485A9F: test eax, eax
  '00485AA1: jz 00485C56h
  '00485AA7: cmp word ptr [eax], 0001h
  '00485AAB: jnz 00485C56h
  '00485AB1: mov edx, [eax+14h]
  '00485AB4: mov ecx, [eax+10h]
  '00485AB7: mov ebx, 00000002h
  '00485ABC: sub ebx, edx
  '00485ABE: cmp ebx, ecx
  '00485AC0: jb 00485C5Eh
  '00485AC6: call [00401170h]
  '00485ACC: mov ecx, 00000001h
  '00485AD1: call esi
  '00485AD3: jmp 00485E8Dh
  '00485AD8: mov eax, [edi]
  '00485ADA: push eax
  '00485ADB: push 00000001h
  '00485ADD: call ebx
  '00485ADF: test eax, eax
  '00485AE1: jnz 00485C6Ah
  '00485AE7: push esi
  '00485AE8: push esi
  '00485AE9: push 00000001h
  '00485AEB: lea ecx, [ebp-38h]
  '00485AEE: push 00000011h
  '00485AF0: push ecx
  '00485AF1: push 00000001h
  '00485AF3: push 00000080h
  '00485AF8: call [004011E4h]
  '00485AFE: mov eax, [edi]
  '00485B00: add esp, 0000001Ch
  '00485B03: cmp eax, esi
  '00485B05: jz 485B23h
  '00485B07: cmp word ptr [eax], 0001h
  '00485B0B: jnz 485B23h
  '00485B0D: mov ebx, [eax+14h]
  '00485B10: mov ecx, [eax+10h]
  '00485B13: neg ebx
  '00485B15: cmp ebx, ecx
  '00485B17: jb 485B1Fh
  '00485B19: call [00401170h]
  '00485B1F: mov esi, ebx
  '00485B21: jmp 485B2Bh
  '00485B23: call [00401170h]
  '00485B29: mov esi, eax
  '00485B2B: mov ecx, [ebp-38h]
  '00485B2E: test ecx, ecx
  '00485B30: jz 485B51h
  '00485B32: cmp word ptr [ecx], 0001h
  '00485B36: jnz 485B51h
  '00485B38: mov ebx, [ecx+14h]
  '00485B3B: mov eax, [ecx+10h]
  '00485B3E: neg ebx
  '00485B40: cmp ebx, eax
  '00485B42: jb 485B4Dh
  '00485B44: call [00401170h]
  '00485B4A: mov ecx, [ebp-38h]
  '00485B4D: mov eax, ebx
  '00485B4F: jmp 485B5Ah
  '00485B51: call [00401170h]
  '00485B57: mov ecx, [ebp-38h]
  '00485B5A: mov edx, [edi]
  '00485B5C: mov ecx, [ecx+0Ch]
  '00485B5F: push 00000000h
  '00485B61: push 00000002h
  '00485B63: mov edx, [edx+0Ch]
  '00485B66: push 00000001h
  '00485B68: push 00000011h
  '00485B6A: push edi
  '00485B6B: mov dl, [edx+esi]
  '00485B6E: push 00000001h
  '00485B70: push 00000080h
  '00485B75: mov [ecx+eax], dl
  '00485B78: call [004011E4h]
  '00485B7E: mov eax, [ebp-38h]
  '00485B81: add esp, 0000001Ch
  '00485B84: test eax, eax
  '00485B86: jz 485BA4h
  '00485B88: cmp word ptr [eax], 0001h
  '00485B8C: jnz 485BA4h
  '00485B8E: mov ebx, [eax+14h]
  '00485B91: mov ecx, [eax+10h]
  '00485B94: neg ebx
  '00485B96: cmp ebx, ecx
  '00485B98: jb 485BA0h
  '00485B9A: call [00401170h]
  '00485BA0: mov esi, ebx
  '00485BA2: jmp 485BACh
  '00485BA4: call [00401170h]
  '00485BAA: mov esi, eax
  '00485BAC: mov eax, [edi]
  '00485BAE: test eax, eax
  '00485BB0: jz 485BCEh
  '00485BB2: cmp word ptr [eax], 0001h
  '00485BB6: jnz 485BCEh
  '00485BB8: mov ebx, [eax+14h]
  '00485BBB: mov ecx, [eax+10h]
  '00485BBE: neg ebx
  '00485BC0: cmp ebx, ecx
  '00485BC2: jb 485BCAh
  '00485BC4: call [00401170h]
  '00485BCA: mov eax, ebx
  '00485BCC: jmp 485BD4h
  '00485BCE: call [00401170h]
  '00485BD4: mov ecx, [ebp-38h]
  '00485BD7: mov edx, [ecx+0Ch]
  '00485BDA: mov ecx, [edi]
  '00485BDC: mov ecx, [ecx+0Ch]
  '00485BDF: mov dl, [edx+esi]
  '00485BE2: mov [ecx+eax], dl
  '00485BE5: mov eax, [edi]
  '00485BE7: test eax, eax
  '00485BE9: jz 485C0Ah
  '00485BEB: cmp word ptr [eax], 0001h
  '00485BEF: jnz 485C0Ah
  '00485BF1: mov edx, [eax+14h]
  '00485BF4: mov ecx, [eax+10h]
  '00485BF7: mov ebx, 00000001h
  '00485BFC: sub ebx, edx
  '00485BFE: cmp ebx, ecx
  '00485C00: jb 485C12h
  '00485C02: call [00401170h]
  '00485C08: jmp 485C12h
  '00485C0A: call [00401170h]
  '00485C10: mov ebx, eax
  '00485C12: mov esi, [004011F4h]
  '00485C18: mov ecx, 00000001h
  '00485C1D: call esi
  '00485C1F: mov ecx, [edi]
  '00485C21: mov edx, [ecx+0Ch]
  '00485C24: mov [edx+ebx], al
  '00485C27: mov eax, [edi]
  '00485C29: test eax, eax
  '00485C2B: jz 485C56h
  '00485C2D: cmp word ptr [eax], 0001h
  '00485C31: jnz 485C56h
  '00485C33: mov edx, [eax+14h]
  '00485C36: mov ecx, [eax+10h]
  '00485C39: mov ebx, 00000002h
  '00485C3E: sub ebx, edx
  '00485C40: cmp ebx, ecx
  '00485C42: jb 485C5Eh
  '00485C44: call [00401170h]
  '00485C4A: mov ecx, 00000001h
  '00485C4F: call esi
  '00485C51: jmp 00485E8Dh
  '00485C56: call [00401170h]
  '00485C5C: mov ebx, eax
  '00485C5E: mov ecx, 00000001h
  '00485C63: call esi
  '00485C65: jmp 00485E8Dh
  '00485C6A: mov eax, [edi]
  '00485C6C: push eax
  '00485C6D: push 00000001h
  '00485C6F: call ebx
  '00485C71: cmp eax, 00000001h
  '00485C74: jnz 00485E97h
  '00485C7A: push esi
  '00485C7B: push eax
  '00485C7C: push eax
  '00485C7D: lea ecx, [ebp-38h]
  '00485C80: push 00000011h
  '00485C82: push ecx
  '00485C83: push eax
  '00485C84: push 00000080h
  '00485C89: call [004011E4h]
  '00485C8F: mov eax, [edi]
  '00485C91: add esp, 0000001Ch
  '00485C94: cmp eax, esi
  '00485C96: jz 485CB4h
  '00485C98: cmp word ptr [eax], 0001h
  '00485C9C: jnz 485CB4h
  '00485C9E: mov ebx, [eax+14h]
  '00485CA1: mov ecx, [eax+10h]
  '00485CA4: neg ebx
  '00485CA6: cmp ebx, ecx
  '00485CA8: jb 485CB0h
  '00485CAA: call [00401170h]
  '00485CB0: mov esi, ebx
  '00485CB2: jmp 485CBCh
  '00485CB4: call [00401170h]
  '00485CBA: mov esi, eax
  '00485CBC: mov ecx, [ebp-38h]
  '00485CBF: test ecx, ecx
  '00485CC1: jz 485CE2h
  '00485CC3: cmp word ptr [ecx], 0001h
  '00485CC7: jnz 485CE2h
  '00485CC9: mov ebx, [ecx+14h]
  '00485CCC: mov eax, [ecx+10h]
  '00485CCF: neg ebx
  '00485CD1: cmp ebx, eax
  '00485CD3: jb 485CDEh
  '00485CD5: call [00401170h]
  '00485CDB: mov ecx, [ebp-38h]
  '00485CDE: mov eax, ebx
  '00485CE0: jmp 485CEBh
  '00485CE2: call [00401170h]
  '00485CE8: mov ecx, [ebp-38h]
  '00485CEB: mov edx, [edi]
  '00485CED: mov ecx, [ecx+0Ch]
  '00485CF0: mov edx, [edx+0Ch]
  '00485CF3: mov dl, [edx+esi]
  '00485CF6: mov [ecx+eax], dl
  '00485CF9: mov eax, [edi]
  '00485CFB: test eax, eax
  '00485CFD: jz 485D20h
  '00485CFF: cmp word ptr [eax], 0001h
  '00485D03: jnz 485D20h
  '00485D05: mov edx, [eax+14h]
  '00485D08: mov ecx, [eax+10h]
  '00485D0B: mov ebx, 00000001h
  '00485D10: sub ebx, edx
  '00485D12: cmp ebx, ecx
  '00485D14: jb 485D1Ch
  '00485D16: call [00401170h]
  '00485D1C: mov esi, ebx
  '00485D1E: jmp 485D28h
  '00485D20: call [00401170h]
  '00485D26: mov esi, eax
  '00485D28: mov ecx, [ebp-38h]
  '00485D2B: test ecx, ecx
  '00485D2D: jz 485D53h
  '00485D2F: cmp word ptr [ecx], 0001h
  '00485D33: jnz 485D53h
  '00485D35: mov edx, [ecx+14h]
  '00485D38: mov eax, [ecx+10h]
  '00485D3B: mov ebx, 00000001h
  '00485D40: sub ebx, edx
  '00485D42: cmp ebx, eax
  '00485D44: jb 485D4Fh
  '00485D46: call [00401170h]
  '00485D4C: mov ecx, [ebp-38h]
  '00485D4F: mov eax, ebx
  '00485D51: jmp 485D5Ch
  '00485D53: call [00401170h]
  '00485D59: mov ecx, [ebp-38h]
  '00485D5C: mov edx, [edi]
  '00485D5E: mov ecx, [ecx+0Ch]
  '00485D61: push 00000000h
  '00485D63: push 00000002h
  '00485D65: mov edx, [edx+0Ch]
  '00485D68: push 00000001h
  '00485D6A: push 00000011h
  '00485D6C: push edi
  '00485D6D: mov dl, [edx+esi]
  '00485D70: push 00000001h
  '00485D72: push 00000080h
  '00485D77: mov [ecx+eax], dl
  '00485D7A: call [004011E4h]
  '00485D80: mov eax, [ebp-38h]
  '00485D83: add esp, 0000001Ch
  '00485D86: test eax, eax
  '00485D88: jz 485DA6h
  '00485D8A: cmp word ptr [eax], 0001h
  '00485D8E: jnz 485DA6h
  '00485D90: mov ebx, [eax+14h]
  '00485D93: mov ecx, [eax+10h]
  '00485D96: neg ebx
  '00485D98: cmp ebx, ecx
  '00485D9A: jb 485DA2h
  '00485D9C: call [00401170h]
  '00485DA2: mov esi, ebx
  '00485DA4: jmp 485DAEh
  '00485DA6: call [00401170h]
  '00485DAC: mov esi, eax
  '00485DAE: mov eax, [edi]
  '00485DB0: test eax, eax
  '00485DB2: jz 485DD0h
  '00485DB4: cmp word ptr [eax], 0001h
  '00485DB8: jnz 485DD0h
  '00485DBA: mov ebx, [eax+14h]
  '00485DBD: mov ecx, [eax+10h]
  '00485DC0: neg ebx
  '00485DC2: cmp ebx, ecx
  '00485DC4: jb 485DCCh
  '00485DC6: call [00401170h]
  '00485DCC: mov eax, ebx
  '00485DCE: jmp 485DD6h
  '00485DD0: call [00401170h]
  '00485DD6: mov ecx, [ebp-38h]
  '00485DD9: mov edx, [ecx+0Ch]
  '00485DDC: mov ecx, [edi]
  '00485DDE: mov ecx, [ecx+0Ch]
  '00485DE1: mov dl, [edx+esi]
  '00485DE4: mov [ecx+eax], dl
  '00485DE7: mov eax, [ebp-38h]
  '00485DEA: test eax, eax
  '00485DEC: jz 485E0Fh
  '00485DEE: cmp word ptr [eax], 0001h
  '00485DF2: jnz 485E0Fh
  '00485DF4: mov edx, [eax+14h]
  '00485DF7: mov ecx, [eax+10h]
  '00485DFA: mov ebx, 00000001h
  '00485DFF: sub ebx, edx
  '00485E01: cmp ebx, ecx
  '00485E03: jb 485E0Bh
  '00485E05: call [00401170h]
  '00485E0B: mov esi, ebx
  '00485E0D: jmp 485E17h
  '00485E0F: call [00401170h]
  '00485E15: mov esi, eax
  '00485E17: mov eax, [edi]
  '00485E19: test eax, eax
  '00485E1B: jz 485E3Eh
  '00485E1D: cmp word ptr [eax], 0001h
  '00485E21: jnz 485E3Eh
  '00485E23: mov edx, [eax+14h]
  '00485E26: mov ecx, [eax+10h]
  '00485E29: mov ebx, 00000001h
  '00485E2E: sub ebx, edx
  '00485E30: cmp ebx, ecx
  '00485E32: jb 485E3Ah
  '00485E34: call [00401170h]
  '00485E3A: mov eax, ebx
  '00485E3C: jmp 485E44h
  '00485E3E: call [00401170h]
  '00485E44: mov ecx, [ebp-38h]
  '00485E47: mov edx, [ecx+0Ch]
  '00485E4A: mov ecx, [edi]
  '00485E4C: mov ecx, [ecx+0Ch]
  '00485E4F: mov dl, [edx+esi]
  '00485E52: mov [ecx+eax], dl
  '00485E55: mov eax, [edi]
  '00485E57: test eax, eax
  '00485E59: jz 485E7Ah
  '00485E5B: cmp word ptr [eax], 0001h
  '00485E5F: jnz 485E7Ah
  '00485E61: mov edx, [eax+14h]
  '00485E64: mov ecx, [eax+10h]
  '00485E67: mov ebx, 00000002h
  '00485E6C: sub ebx, edx
  '00485E6E: cmp ebx, ecx
  '00485E70: jb 485E82h
  '00485E72: call [00401170h]
  '00485E78: jmp 485E82h
  '00485E7A: call [00401170h]
  '00485E80: mov ebx, eax
  '00485E82: mov ecx, 00000001h
  '00485E87: call [004011F4h]
  '00485E8D: mov ecx, [edi]
  '00485E8F: xor esi, esi
  '00485E91: mov edx, [ecx+0Ch]
  '00485E94: mov [edx+ebx], al
  '00485E97: mov ebx, [ebp+0Ch]
  '00485E9A: push esi
  '00485E9B: mov eax, [ebx]
  '00485E9D: push eax
  '00485E9E: push 00000001h
  '00485EA0: call [00401264h]
  '00485EA6: add eax, 00000005h
  '00485EA9: lea ecx, [ebp-38h]
  '00485EAC: jo 00486811h
  '00485EB2: push eax
  '00485EB3: push 00000001h
  '00485EB5: push 00000011h
  '00485EB7: push ecx
  '00485EB8: push 00000001h
  '00485EBA: push 00000080h
  '00485EBF: call [004011E4h]
  '00485EC5: add esp, 0000001Ch
  '00485EC8: call [00401274h]
  '00485ECE: fstp real4 ptr [ebp-48h]
  '00485ED1: lea edx, [ebp-50h]
  '00485ED4: mov [ebp-50h], 00000004h
  '00485EDB: push edx
  '00485EDC: call [004010E0h]
  '00485EE2: mov edi, [00401034h]
  '00485EE8: lea ecx, [ebp-50h]
  '00485EEB: call edi
  '00485EED: mov eax, [ebp-38h]
  '00485EF0: mov [ebp-48h], 80020004h
  '00485EF7: cmp eax, esi
  '00485EF9: mov [ebp-50h], 0000000Ah
  '00485F00: jz 485F22h
  '00485F02: cmp word ptr [eax], 0001h
  '00485F06: jnz 485F22h
  '00485F08: mov esi, [eax+14h]
  '00485F0B: mov ecx, [eax+10h]
  '00485F0E: neg esi
  '00485F10: cmp esi, ecx
  '00485F12: jb 485F1Ah
  '00485F14: call [00401170h]
  '00485F1A: mov [ebp-000000A0h], esi
  '00485F20: jmp 485F2Eh
  '00485F22: call [00401170h]
  '00485F28: mov [ebp-000000A0h], eax
  '00485F2E: lea eax, [ebp-50h]
  '00485F31: push eax
  '00485F32: call [004010D8h]
  '00485F38: fmul real4 ptr [00402968h]
  '00485F3E: fadd real4 ptr [00402428h]
  '00485F44: fstsw ax
  '00485F46: test al, 0Dh
  '00485F48: jnz 0048680Ch
  '00485F4E: call [0040137Ch]
  '00485F54: mov esi, [004011B4h]
  '00485F5A: call esi
  '00485F5C: mov ecx, [ebp-38h]
  '00485F5F: mov edx, [ecx+0Ch]
  '00485F62: mov ecx, [ebp-000000A0h]
  '00485F68: mov [edx+ecx], al
  '00485F6B: lea ecx, [ebp-50h]
  '00485F6E: call edi
  '00485F70: mov eax, [ebp-38h]
  '00485F73: mov [ebp-48h], 80020004h
  '00485F7A: test eax, eax
  '00485F7C: mov [ebp-50h], 0000000Ah
  '00485F83: jz 485FB0h
  '00485F85: cmp word ptr [eax], 0001h
  '00485F89: jnz 485FB0h
  '00485F8B: mov edx, [eax+14h]
  '00485F8E: mov ecx, 00000001h
  '00485F93: sub ecx, edx
  '00485F95: mov edx, [eax+10h]
  '00485F98: cmp ecx, edx
  '00485F9A: mov [ebp-68h], ecx
  '00485F9D: jb 485FA8h
  '00485F9F: call [00401170h]
  '00485FA5: mov ecx, [ebp-68h]
  '00485FA8: mov [ebp-000000A4h], ecx
  '00485FAE: jmp 485FBCh
  '00485FB0: call [00401170h]
  '00485FB6: mov [ebp-000000A4h], eax
  '00485FBC: lea edx, [ebp-50h]
  '00485FBF: push edx
  '00485FC0: call [004010D8h]
  '00485FC6: fmul real4 ptr [00402968h]
  '00485FCC: fadd real4 ptr [00402428h]
  '00485FD2: fstsw ax
  '00485FD4: test al, 0Dh
  '00485FD6: jnz 0048680Ch
  '00485FDC: call [0040137Ch]
  '00485FE2: call esi
  '00485FE4: mov ecx, [ebp-38h]
  '00485FE7: mov edx, [ecx+0Ch]
  '00485FEA: mov ecx, [ebp-000000A4h]
  '00485FF0: mov [edx+ecx], al
  '00485FF3: lea ecx, [ebp-50h]
  '00485FF6: call edi
  '00485FF8: mov eax, [ebp-38h]
  '00485FFB: mov [ebp-48h], 80020004h
  '00486002: test eax, eax
  '00486004: mov [ebp-50h], 0000000Ah
  '0048600B: jz 486038h
  '0048600D: cmp word ptr [eax], 0001h
  '00486011: jnz 486038h
  '00486013: mov edx, [eax+14h]
  '00486016: mov ecx, 00000002h
  '0048601B: sub ecx, edx
  '0048601D: mov edx, [eax+10h]
  '00486020: cmp ecx, edx
  '00486022: mov [ebp-68h], ecx
  '00486025: jb 486030h
  '00486027: call [00401170h]
  '0048602D: mov ecx, [ebp-68h]
  '00486030: mov [ebp-000000A8h], ecx
  '00486036: jmp 486044h
  '00486038: call [00401170h]
  '0048603E: mov [ebp-000000A8h], eax
  '00486044: lea edx, [ebp-50h]
  '00486047: push edx
  '00486048: call [004010D8h]
  '0048604E: fmul real4 ptr [00402968h]
  '00486054: fadd real4 ptr [00402428h]
  '0048605A: fstsw ax
  '0048605C: test al, 0Dh
  '0048605E: jnz 0048680Ch
  '00486064: call [0040137Ch]
  '0048606A: call esi
  '0048606C: mov ecx, [ebp-38h]
  '0048606F: mov edx, [ecx+0Ch]
  '00486072: mov ecx, [ebp-000000A8h]
  '00486078: mov [edx+ecx], al
  '0048607B: lea ecx, [ebp-50h]
  '0048607E: call edi
  '00486080: mov eax, [ebp-38h]
  '00486083: mov [ebp-48h], 80020004h
  '0048608A: test eax, eax
  '0048608C: mov [ebp-50h], 0000000Ah
  '00486093: jz 4860C9h
  '00486095: cmp word ptr [eax], 0001h
  '00486099: jnz 4860C9h
  '0048609B: push eax
  '0048609C: push 00000001h
  '0048609E: call [00401264h]
  '004860A4: mov esi, eax
  '004860A6: mov eax, [ebp-38h]
  '004860A9: mov edx, [eax+14h]
  '004860AC: mov ecx, [eax+10h]
  '004860AF: sub esi, edx
  '004860B1: cmp esi, ecx
  '004860B3: jb 4860BBh
  '004860B5: call [00401170h]
  '004860BB: mov [ebp-000000ACh], esi
  '004860C1: mov esi, [004011B4h]
  '004860C7: jmp 4860D5h
  '004860C9: call [00401170h]
  '004860CF: mov [ebp-000000ACh], eax
  '004860D5: lea edx, [ebp-50h]
  '004860D8: push edx
  '004860D9: call [004010D8h]
  '004860DF: fmul real4 ptr [00402968h]
  '004860E5: fadd real4 ptr [00402428h]
  '004860EB: fstsw ax
  '004860ED: test al, 0Dh
  '004860EF: jnz 0048680Ch
  '004860F5: call [0040137Ch]
  '004860FB: call esi
  '004860FD: mov ecx, [ebp-38h]
  '00486100: mov edx, [ecx+0Ch]
  '00486103: mov ecx, [ebp-000000ACh]
  '00486109: mov [edx+ecx], al
  '0048610C: lea ecx, [ebp-50h]
  '0048610F: call edi
  '00486111: mov eax, [ebp-38h]
  '00486114: mov [ebp-48h], 80020004h
  '0048611B: test eax, eax
  '0048611D: mov [ebp-50h], 0000000Ah
  '00486124: jz 486163h
  '00486126: cmp word ptr [eax], 0001h
  '0048612A: jnz 486163h
  '0048612C: push eax
  '0048612D: push 00000001h
  '0048612F: call [00401264h]
  '00486135: mov esi, eax
  '00486137: mov eax, [ebp-38h]
  '0048613A: sub esi, 00000001h
  '0048613D: mov edx, [eax+14h]
  '00486140: mov ecx, [eax+10h]
  '00486143: jo 00486811h
  '00486149: sub esi, edx
  '0048614B: cmp esi, ecx
  '0048614D: jb 486155h
  '0048614F: call [00401170h]
  '00486155: mov [ebp-000000B0h], esi
  '0048615B: mov esi, [004011B4h]
  '00486161: jmp 48616Fh
  '00486163: call [00401170h]
  '00486169: mov [ebp-000000B0h], eax
  '0048616F: lea edx, [ebp-50h]
  '00486172: push edx
  '00486173: call [004010D8h]
  '00486179: fmul real4 ptr [00402968h]
  '0048617F: fadd real4 ptr [00402428h]
  '00486185: fstsw ax
  '00486187: test al, 0Dh
  '00486189: jnz 0048680Ch
  '0048618F: call [0040137Ch]
  '00486195: call esi
  '00486197: mov ecx, [ebp-38h]
  '0048619A: mov edx, [ecx+0Ch]
  '0048619D: mov ecx, [ebp-000000B0h]
  '004861A3: mov [edx+ecx], al
  '004861A6: lea ecx, [ebp-50h]
  '004861A9: call edi
  '004861AB: mov edx, [ebx]
  '004861AD: mov edi, [004012F8h]
  '004861B3: lea eax, [ebp-40h]
  '004861B6: push edx
  '004861B7: push eax
  '004861B8: call edi
  '004861BA: mov eax, [ebp-40h]
  '004861BD: test eax, eax
  '004861BF: jz 4861E1h
  '004861C1: cmp word ptr [eax], 0001h
  '004861C5: jnz 4861E1h
  '004861C7: mov esi, [eax+14h]
  '004861CA: mov ecx, [eax+10h]
  '004861CD: neg esi
  '004861CF: cmp esi, ecx
  '004861D1: jb 4861D9h
  '004861D3: call [00401170h]
  '004861D9: mov [ebp-000000B4h], esi
  '004861DF: jmp 4861EDh
  '004861E1: call [00401170h]
  '004861E7: mov [ebp-000000B4h], eax
  '004861ED: mov ecx, [ebp-38h]
  '004861F0: lea edx, [ebp-3Ch]
  '004861F3: push ecx
  '004861F4: push edx
  '004861F5: call edi
  '004861F7: mov eax, [ebp-3Ch]
  '004861FA: test eax, eax
  '004861FC: jz 48621Dh
  '004861FE: cmp word ptr [eax], 0001h
  '00486202: jnz 48621Dh
  '00486204: mov edx, [eax+14h]
  '00486207: mov ecx, [eax+10h]
  '0048620A: mov esi, 00000003h
  '0048620F: sub esi, edx
  '00486211: cmp esi, ecx
  '00486213: jb 486225h
  '00486215: call [00401170h]
  '0048621B: jmp 486225h
  '0048621D: call [00401170h]
  '00486223: mov esi, eax
  '00486225: mov eax, [ebx]
  '00486227: mov edi, [00401264h]
  '0048622D: push eax
  '0048622E: push 00000001h
  '00486230: call edi
  '00486232: mov ecx, [ebp-40h]
  '00486235: add eax, 00000001h
  '00486238: jo 00486811h
  '0048623E: mov edx, [ecx+0Ch]
  '00486241: mov ecx, [ebp-000000B4h]
  '00486247: push eax
  '00486248: mov eax, [ebp-3Ch]
  '0048624B: add edx, ecx
  '0048624D: mov ecx, [eax+0Ch]
  '00486250: push edx
  '00486251: add ecx, esi
  '00486253: push ecx
  '00486254: call 004101ECh
  '00486259: call [004010A4h]
  '0048625F: mov esi, [00401378h]
  '00486265: lea edx, [ebp-3Ch]
  '00486268: push edx
  '00486269: call esi
  '0048626B: lea eax, [ebp-40h]
  '0048626E: push eax
  '0048626F: call esi
  '00486271: mov ecx, [ebp-38h]
  '00486274: push 00000000h
  '00486276: push ecx
  '00486277: push 00000001h
  '00486279: call edi
  '0048627B: mov esi, [004011E4h]
  '00486281: push eax
  '00486282: push 00000001h
  '00486284: push 00000011h
  '00486286: push ebx
  '00486287: push 00000001h
  '00486289: push 00000080h
  '0048628E: call esi
  '00486290: add esp, 0000001Ch
  '00486293: lea edx, [ebp-38h]
  '00486296: push edx
  '00486297: push ebx
  '00486298: call [00401344h]
  '0048629E: push 00000000h
  '004862A0: push 00000000h
  '004862A2: push 00000001h
  '004862A4: lea eax, [ebp-38h]
  '004862A7: push 00000011h
  '004862A9: push eax
  '004862AA: push 00000001h
  '004862AC: push 00000080h
  '004862B1: call esi
  '004862B3: add esp, 0000001Ch
  '004862B6: mov esi, 00000001h
  '004862BB: mov eax, 00000010h
  '004862C0: mov [ebp-24h], esi
  '004862C3: cmp si, ax
  '004862C6: jnle 0048677Bh
  '004862CC: mov ecx, [ebp+10h]
  '004862CF: mov edx, [ecx]
  '004862D1: push edx
  '004862D2: push 00000001h
  '004862D4: call edi
  '004862D6: mov ecx, eax
  '004862D8: call [0040119Ch]
  '004862DE: mov [ebp-1Ch], eax
  '004862E1: mov eax, [ebx]
  '004862E3: push eax
  '004862E4: push 00000001h
  '004862E6: mov [ebp-20h], 00000000h
  '004862ED: call edi
  '004862EF: sub eax, 00000001h
  '004862F2: mov [ebp-18h], 00000000h
  '004862F9: jo 00486811h
  '004862FF: mov [ebp-00000094h], eax
  '00486305: mov ecx, [ebp-18h]
  '00486308: cmp ecx, eax
  '0048630A: jnle 004866DBh
  '00486310: mov dx, [ebp-20h]
  '00486314: cmp dx, [ebp-1Ch]
  '00486318: jnz 486321h
  '0048631A: mov [ebp-20h], 00000000h
  '00486321: mov eax, [ebx]
  '00486323: test eax, eax
  '00486325: jz 486345h
  '00486327: cmp word ptr [eax], 0001h
  '0048632B: jnz 486345h
  '0048632D: mov edx, [eax+14h]
  '00486330: mov esi, ecx
  '00486332: mov ecx, [eax+10h]
  '00486335: sub esi, edx
  '00486337: cmp esi, ecx
  '00486339: jb 486341h
  '0048633B: call [00401170h]
  '00486341: mov eax, esi
  '00486343: jmp 48634Bh
  '00486345: call [00401170h]
  '0048634B: mov ecx, [ebx]
  '0048634D: mov edx, [ecx+0Ch]
  '00486350: xor ecx, ecx
  '00486352: mov cl, [edx+eax]
  '00486355: mov eax, ecx
  '00486357: cmp eax, 00000100h
  '0048635C: mov [ebp-00000084h], eax
  '00486362: jb 48636Ah
  '00486364: call [00401170h]
  '0048636A: mov eax, [ebx]
  '0048636C: test eax, eax
  '0048636E: jz 486398h
  '00486370: cmp word ptr [eax], 0001h
  '00486374: jnz 486398h
  '00486376: mov esi, [ebp-18h]
  '00486379: mov edx, [eax+14h]
  '0048637C: mov ecx, [eax+10h]
  '0048637F: add esi, 00000001h
  '00486382: jo 00486811h
  '00486388: sub esi, edx
  '0048638A: cmp esi, ecx
  '0048638C: jb 486394h
  '0048638E: call [00401170h]
  '00486394: mov eax, esi
  '00486396: jmp 48639Eh
  '00486398: call [00401170h]
  '0048639E: mov edx, [ebx]
  '004863A0: mov ecx, [edx+0Ch]
  '004863A3: xor edx, edx
  '004863A5: mov dl, [ecx+eax]
  '004863A8: mov edi, edx
  '004863AA: cmp edi, 00000100h
  '004863B0: jb 4863B8h
  '004863B2: call [00401170h]
  '004863B8: mov eax, [ebp+10h]
  '004863BB: mov eax, [eax]
  '004863BD: test eax, eax
  '004863BF: jz 4863E1h
  '004863C1: cmp word ptr [eax], 0001h
  '004863C5: jnz 4863E1h
  '004863C7: movsx esi, word ptr [ebp-20h]
  '004863CB: mov edx, [eax+14h]
  '004863CE: mov ecx, [eax+10h]
  '004863D1: sub esi, edx
  '004863D3: cmp esi, ecx
  '004863D5: jb 4863DDh
  '004863D7: call [00401170h]
  '004863DD: mov eax, esi
  '004863DF: jmp 4863E7h
  '004863E1: call [00401170h]
  '004863E7: mov ecx, [ebp+10h]
  '004863EA: mov edx, [ecx]
  '004863EC: mov ecx, [edx+0Ch]
  '004863EF: xor edx, edx
  '004863F1: mov dl, [ecx+eax]
  '004863F4: mov esi, edx
  '004863F6: cmp esi, 00000100h
  '004863FC: jb 486404h
  '004863FE: call [00401170h]
  '00486404: mov eax, [ebp+08h]
  '00486407: shl esi, 08h
  '0048640A: mov ecx, [eax+58h]
  '0048640D: add esi, ecx
  '0048640F: xor ecx, ecx
  '00486411: mov cl, [esi+edi]
  '00486414: mov esi, ecx
  '00486416: cmp esi, 00000100h
  '0048641C: jb 486424h
  '0048641E: call [00401170h]
  '00486424: mov eax, [ebx]
  '00486426: test eax, eax
  '00486428: jz 486449h
  '0048642A: cmp word ptr [eax], 0001h
  '0048642E: jnz 486449h
  '00486430: mov edi, [ebp-18h]
  '00486433: mov edx, [eax+14h]
  '00486436: mov ecx, [eax+10h]
  '00486439: sub edi, edx
  '0048643B: cmp edi, ecx
  '0048643D: jb 486445h
  '0048643F: call [00401170h]
  '00486445: mov eax, edi
  '00486447: jmp 48644Fh
  '00486449: call [00401170h]
  '0048644F: mov edx, [ebp+08h]
  '00486452: mov ecx, [ebx]
  '00486454: shl esi, 08h
  '00486457: mov edi, [edx+7Ch]
  '0048645A: mov edx, [ecx+0Ch]
  '0048645D: mov ecx, [ebp-00000084h]
  '00486463: add esi, edi
  '00486465: mov cl, [esi+ecx]
  '00486468: mov [edx+eax], cl
  '0048646B: mov eax, [ebx]
  '0048646D: test eax, eax
  '0048646F: jz 486490h
  '00486471: cmp word ptr [eax], 0001h
  '00486475: jnz 486490h
  '00486477: mov esi, [ebp-18h]
  '0048647A: mov edx, [eax+14h]
  '0048647D: mov ecx, [eax+10h]
  '00486480: sub esi, edx
  '00486482: cmp esi, ecx
  '00486484: jb 48648Ch
  '00486486: call [00401170h]
  '0048648C: mov eax, esi
  '0048648E: jmp 486496h
  '00486490: call [00401170h]
  '00486496: mov edx, [ebx]
  '00486498: mov ecx, [edx+0Ch]
  '0048649B: xor edx, edx
  '0048649D: mov dl, [ecx+eax]
  '004864A0: mov eax, edx
  '004864A2: cmp eax, 00000100h
  '004864A7: mov [ebp-78h], eax
  '004864AA: jb 4864B2h
  '004864AC: call [00401170h]
  '004864B2: mov eax, [ebx]
  '004864B4: test eax, eax
  '004864B6: jz 4864E0h
  '004864B8: cmp word ptr [eax], 0001h
  '004864BC: jnz 4864E0h
  '004864BE: mov esi, [ebp-18h]
  '004864C1: mov edx, [eax+14h]
  '004864C4: mov ecx, [eax+10h]
  '004864C7: add esi, 00000001h
  '004864CA: jo 00486811h
  '004864D0: sub esi, edx
  '004864D2: cmp esi, ecx
  '004864D4: jb 4864DCh
  '004864D6: call [00401170h]
  '004864DC: mov eax, esi
  '004864DE: jmp 4864E6h
  '004864E0: call [00401170h]
  '004864E6: mov ecx, [ebx]
  '004864E8: mov edx, [ecx+0Ch]
  '004864EB: xor ecx, ecx
  '004864ED: mov cl, [edx+eax]
  '004864F0: mov esi, ecx
  '004864F2: cmp esi, 00000100h
  '004864F8: jb 486500h
  '004864FA: call [00401170h]
  '00486500: mov eax, [ebx]
  '00486502: test eax, eax
  '00486504: jz 48652Eh
  '00486506: cmp word ptr [eax], 0001h
  '0048650A: jnz 48652Eh
  '0048650C: mov edi, [ebp-18h]
  '0048650F: mov edx, [eax+14h]
  '00486512: mov ecx, [eax+10h]
  '00486515: add edi, 00000001h
  '00486518: jo 00486811h
  '0048651E: sub edi, edx
  '00486520: cmp edi, ecx
  '00486522: jb 48652Ah
  '00486524: call [00401170h]
  '0048652A: mov eax, edi
  '0048652C: jmp 486534h
  '0048652E: call [00401170h]
  '00486534: mov edx, [ebp+08h]
  '00486537: mov ecx, [ebx]
  '00486539: shl esi, 08h
  '0048653C: mov edi, [edx+7Ch]
  '0048653F: mov edx, [ecx+0Ch]
  '00486542: mov ecx, [ebp-78h]
  '00486545: add esi, edi
  '00486547: mov cl, [esi+ecx]
  '0048654A: mov [edx+eax], cl
  '0048654D: mov eax, [ebx]
  '0048654F: test eax, eax
  '00486551: jz 486572h
  '00486553: cmp word ptr [eax], 0001h
  '00486557: jnz 486572h
  '00486559: mov esi, [ebp-18h]
  '0048655C: mov edx, [eax+14h]
  '0048655F: mov ecx, [eax+10h]
  '00486562: sub esi, edx
  '00486564: cmp esi, ecx
  '00486566: jb 48656Eh
  '00486568: call [00401170h]
  '0048656E: mov eax, esi
  '00486570: jmp 486578h
  '00486572: call [00401170h]
  '00486578: mov edx, [ebx]
  '0048657A: mov ecx, [edx+0Ch]
  '0048657D: xor edx, edx
  '0048657F: mov dl, [ecx+eax]
  '00486582: mov eax, edx
  '00486584: cmp eax, 00000100h
  '00486589: mov [ebp-00000084h], eax
  '0048658F: jb 486597h
  '00486591: call [00401170h]
  '00486597: mov eax, [ebx]
  '00486599: test eax, eax
  '0048659B: jz 4865C5h
  '0048659D: cmp word ptr [eax], 0001h
  '004865A1: jnz 4865C5h
  '004865A3: mov esi, [ebp-18h]
  '004865A6: mov edx, [eax+14h]
  '004865A9: mov ecx, [eax+10h]
  '004865AC: add esi, 00000001h
  '004865AF: jo 00486811h
  '004865B5: sub esi, edx
  '004865B7: cmp esi, ecx
  '004865B9: jb 4865C1h
  '004865BB: call [00401170h]
  '004865C1: mov eax, esi
  '004865C3: jmp 4865CBh
  '004865C5: call [00401170h]
  '004865CB: mov ecx, [ebx]
  '004865CD: mov edx, [ecx+0Ch]
  '004865D0: xor ecx, ecx
  '004865D2: mov cl, [edx+eax]
  '004865D5: mov edi, ecx
  '004865D7: cmp edi, 00000100h
  '004865DD: jb 4865E5h
  '004865DF: call [00401170h]
  '004865E5: mov edx, [ebp+10h]
  '004865E8: mov eax, [edx]
  '004865EA: test eax, eax
  '004865EC: jz 48661Bh
  '004865EE: cmp word ptr [eax], 0001h
  '004865F2: jnz 48661Bh
  '004865F4: mov cx, [ebp-20h]
  '004865F8: mov edx, [eax+14h]
  '004865FB: add cx, 0001h
  '004865FF: jo 00486811h
  '00486605: movsx esi, cx
  '00486608: mov ecx, [eax+10h]
  '0048660B: sub esi, edx
  '0048660D: cmp esi, ecx
  '0048660F: jb 486617h
  '00486611: call [00401170h]
  '00486617: mov eax, esi
  '00486619: jmp 486621h
  '0048661B: call [00401170h]
  '00486621: mov edx, [ebp+10h]
  '00486624: mov ecx, [edx]
  '00486626: mov edx, [ecx+0Ch]
  '00486629: xor ecx, ecx
  '0048662B: mov cl, [edx+eax]
  '0048662E: mov esi, ecx
  '00486630: cmp esi, 00000100h
  '00486636: jb 48663Eh
  '00486638: call [00401170h]
  '0048663E: mov edx, [ebp+08h]
  '00486641: xor eax, eax
  '00486643: shl esi, 08h
  '00486646: add esi, [edx+58h]
  '00486649: mov al, [esi+edi]
  '0048664C: mov esi, eax
  '0048664E: cmp esi, 00000100h
  '00486654: jb 48665Ch
  '00486656: call [00401170h]
  '0048665C: mov eax, [ebx]
  '0048665E: test eax, eax
  '00486660: jz 486681h
  '00486662: cmp word ptr [eax], 0001h
  '00486666: jnz 486681h
  '00486668: mov edi, [ebp-18h]
  '0048666B: mov edx, [eax+14h]
  '0048666E: mov ecx, [eax+10h]
  '00486671: sub edi, edx
  '00486673: cmp edi, ecx
  '00486675: jb 48667Dh
  '00486677: call [00401170h]
  '0048667D: mov eax, edi
  '0048667F: jmp 486687h
  '00486681: call [00401170h]
  '00486687: mov ecx, [ebp+08h]
  '0048668A: mov edx, [ebx]
  '0048668C: shl esi, 08h
  '0048668F: mov edi, [ecx+7Ch]
  '00486692: mov ecx, [edx+0Ch]
  '00486695: mov edx, [ebp-00000084h]
  '0048669B: add esi, edi
  '0048669D: mov edi, [00401264h]
  '004866A3: mov dl, [esi+edx]
  '004866A6: mov esi, [ebp-24h]
  '004866A9: mov [ecx+eax], dl
  '004866AC: mov ax, [ebp-20h]
  '004866B0: mov ecx, [ebp-18h]
  '004866B3: add ax, 0001h
  '004866B7: jo 00486811h
  '004866BD: mov [ebp-20h], eax
  '004866C0: mov eax, 00000001h
  '004866C5: add eax, ecx
  '004866C7: jo 00486811h
  '004866CD: mov [ebp-18h], eax
  '004866D0: mov eax, [ebp-00000094h]
  '004866D6: jmp 00486305h
  '004866DB: movsx ecx, si
  '004866DE: mov [ebp-000000B8h], ecx
  '004866E4: fild dword ptr [ebp-000000B8h]
  '004866EA: fstp real8 ptr [ebp-000000C0h]
  '004866F0: fld real8 ptr [ebp-000000C0h]
  '004866F6: cmp [004A0000h], 00000000h
  '004866FD: jnz 486707h
  '004866FF: fdiv real8 ptr [00402960h]
  '00486705: jmp 486718h
  '00486707: push [00402964h]
  '0048670D: push [00402960h]
  '00486713: call 004037B4h
  '00486718: fmul real8 ptr [00401AF0h]
  '0048671E: fstsw ax
  '00486720: test al, 0Dh
  '00486722: jnz 0048680Ch
  '00486728: call [00401318h]
  '0048672E: sub esp, 00000010h
  '00486731: mov ecx, 00004002h
  '00486736: mov edx, esp
  '00486738: mov [ebp-60h], ecx
  '0048673B: mov [ebp-64h], eax
  '0048673E: lea eax, [ebp-64h]
  '00486741: mov [edx], ecx
  '00486743: mov ecx, [ebp-5Ch]
  '00486746: mov [ebp-58h], eax
  '00486749: push 00000001h
  '0048674B: mov [edx+04h], ecx
  '0048674E: mov ecx, [ebp+08h]
  '00486751: push 00000001h
  '00486753: push ecx
  '00486754: mov [edx+08h], eax
  '00486757: mov eax, [ebp-54h]
  '0048675A: mov [edx+0Ch], eax
  '0048675D: call [00401068h]
  '00486763: mov eax, 00000001h
  '00486768: add esp, 0000001Ch
  '0048676B: add ax, si
  '0048676E: jo 00486811h
  '00486774: mov esi, eax
  '00486776: jmp 004862BBh
  '0048677B: mov edx, [ebx]
  '0048677D: lea ecx, [ebp-34h]
  '00486780: mov [ebp-58h], edx
  '00486783: lea edx, [ebp-60h]
  '00486786: mov [ebp-60h], 00002011h
  '0048678D: call [00401324h]
  '00486793: wait 
  '00486794: push 004867D3h
  '00486799: jmp 4867C6h
  '0048679B: test byte ptr [ebp-04h], 04h
  '0048679F: jz 4867AAh
  '004867A1: lea ecx, [ebp-34h]
  '004867A4: call [00401034h]
  '004867AA: mov esi, [00401378h]
  '004867B0: lea eax, [ebp-3Ch]
  '004867B3: push eax
  '004867B4: call esi
  '004867B6: lea ecx, [ebp-40h]
  '004867B9: push ecx
  '004867BA: call esi
  '004867BC: lea ecx, [ebp-50h]
  '004867BF: call [00401034h]
  '004867C5: ret 
End Sub
Private Sub EncryptFile_486820
  '00486820: push ebp
  '00486821: mov ebp, esp
  '00486823: sub esp, 0000000Ch
  '00486826: push 00403796h
  '0048682B: mov eax, fs:[00h]
  '00486831: push eax
  '00486832: mov fs:[00000000h], esp
  '00486839: sub esp, 0000008Ch
  '0048683F: push ebx
  '00486840: push esi
  '00486841: push edi
  '00486842: mov [ebp-0Ch], esp
  '00486845: mov [ebp-08h], 00402980h
  '0048684C: xor ebx, ebx
  '0048684E: mov [ebp-04h], ebx
  '00486851: mov eax, [ebp+08h]
  '00486854: push eax
  '00486855: mov ecx, [eax]
  '00486857: call [ecx+04h]
  '0048685A: mov edx, [ebp+14h]
  '0048685D: mov edi, [ebp+10h]
  '00486860: mov esi, [00401264h]
  '00486866: mov [ebp-34h], ebx
  '00486869: mov [edx], ebx
  '0048686B: mov eax, [edi]
  '0048686D: push eax
  '0048686E: push 00000001h
  '00486870: mov [ebp-38h], ebx
  '00486873: mov [ebp-3Ch], ebx
  '00486876: mov [ebp-40h], ebx
  '00486879: mov [ebp-50h], ebx
  '0048687C: mov [ebp-54h], ebx
  '0048687F: call esi
  '00486881: test eax, eax
  '00486883: jnl 00486955h
  '00486889: push ebx
  '0048688A: push 00000002h
  '0048688C: push 00000001h
  '0048688E: push 00000011h
  '00486890: push edi
  '00486891: push 00000001h
  '00486893: push 00000080h
  '00486898: call [004011E4h]
  '0048689E: mov eax, [edi]
  '004868A0: add esp, 0000001Ch
  '004868A3: cmp eax, ebx
  '004868A5: jz 4868C1h
  '004868A7: cmp word ptr [eax], 0001h
  '004868AB: jnz 4868C1h
  '004868AD: mov esi, [eax+14h]
  '004868B0: mov ecx, [eax+10h]
  '004868B3: neg esi
  '004868B5: cmp esi, ecx
  '004868B7: jb 4868C9h
  '004868B9: call [00401170h]
  '004868BF: jmp 4868C9h
  '004868C1: call [00401170h]
  '004868C7: mov esi, eax
  '004868C9: mov ebx, [004011F4h]
  '004868CF: mov ecx, 00000001h
  '004868D4: call ebx
  '004868D6: mov ecx, [edi]
  '004868D8: mov edx, [ecx+0Ch]
  '004868DB: mov [edx+esi], al
  '004868DE: mov eax, [edi]
  '004868E0: test eax, eax
  '004868E2: jz 486903h
  '004868E4: cmp word ptr [eax], 0001h
  '004868E8: jnz 486903h
  '004868EA: mov edx, [eax+14h]
  '004868ED: mov ecx, [eax+10h]
  '004868F0: mov esi, 00000001h
  '004868F5: sub esi, edx
  '004868F7: cmp esi, ecx
  '004868F9: jb 48690Bh
  '004868FB: call [00401170h]
  '00486901: jmp 48690Bh
  '00486903: call [00401170h]
  '00486909: mov esi, eax
  '0048690B: mov ecx, 00000001h
  '00486910: call ebx
  '00486912: mov ecx, [edi]
  '00486914: mov edx, [ecx+0Ch]
  '00486917: mov [edx+esi], al
  '0048691A: mov eax, [edi]
  '0048691C: test eax, eax
  '0048691E: jz 00486AD3h
  '00486924: cmp word ptr [eax], 0001h
  '00486928: jnz 00486AD3h
  '0048692E: mov edx, [eax+14h]
  '00486931: mov ecx, [eax+10h]
  '00486934: mov esi, 00000002h
  '00486939: sub esi, edx
  '0048693B: cmp esi, ecx
  '0048693D: jb 00486ADBh
  '00486943: call [00401170h]
  '00486949: mov ecx, 00000001h
  '0048694E: call ebx
  '00486950: jmp 00486D0Ah
  '00486955: mov eax, [edi]
  '00486957: push eax
  '00486958: push 00000001h
  '0048695A: call esi
  '0048695C: test eax, eax
  '0048695E: jnz 00486AE7h
  '00486964: push ebx
  '00486965: push ebx
  '00486966: push 00000001h
  '00486968: lea ecx, [ebp-38h]
  '0048696B: push 00000011h
  '0048696D: push ecx
  '0048696E: push 00000001h
  '00486970: push 00000080h
  '00486975: call [004011E4h]
  '0048697B: mov eax, [edi]
  '0048697D: add esp, 0000001Ch
  '00486980: cmp eax, ebx
  '00486982: jz 4869A0h
  '00486984: cmp word ptr [eax], 0001h
  '00486988: jnz 4869A0h
  '0048698A: mov esi, [eax+14h]
  '0048698D: mov ecx, [eax+10h]
  '00486990: neg esi
  '00486992: cmp esi, ecx
  '00486994: jb 48699Ch
  '00486996: call [00401170h]
  '0048699C: mov ebx, esi
  '0048699E: jmp 4869A8h
  '004869A0: call [00401170h]
  '004869A6: mov ebx, eax
  '004869A8: mov ecx, [ebp-38h]
  '004869AB: test ecx, ecx
  '004869AD: jz 4869CEh
  '004869AF: cmp word ptr [ecx], 0001h
  '004869B3: jnz 4869CEh
  '004869B5: mov esi, [ecx+14h]
  '004869B8: mov eax, [ecx+10h]
  '004869BB: neg esi
  '004869BD: cmp esi, eax
  '004869BF: jb 4869CAh
  '004869C1: call [00401170h]
  '004869C7: mov ecx, [ebp-38h]
  '004869CA: mov eax, esi
  '004869CC: jmp 4869D7h
  '004869CE: call [00401170h]
  '004869D4: mov ecx, [ebp-38h]
  '004869D7: mov edx, [edi]
  '004869D9: mov ecx, [ecx+0Ch]
  '004869DC: push 00000000h
  '004869DE: push 00000002h
  '004869E0: mov edx, [edx+0Ch]
  '004869E3: push 00000001h
  '004869E5: push 00000011h
  '004869E7: push edi
  '004869E8: mov dl, [edx+ebx]
  '004869EB: push 00000001h
  '004869ED: push 00000080h
  '004869F2: mov [ecx+eax], dl
  '004869F5: call [004011E4h]
  '004869FB: mov eax, [ebp-38h]
  '004869FE: add esp, 0000001Ch
  '00486A01: test eax, eax
  '00486A03: jz 486A21h
  '00486A05: cmp word ptr [eax], 0001h
  '00486A09: jnz 486A21h
  '00486A0B: mov esi, [eax+14h]
  '00486A0E: mov ecx, [eax+10h]
  '00486A11: neg esi
  '00486A13: cmp esi, ecx
  '00486A15: jb 486A1Dh
  '00486A17: call [00401170h]
  '00486A1D: mov ebx, esi
  '00486A1F: jmp 486A29h
  '00486A21: call [00401170h]
  '00486A27: mov ebx, eax
  '00486A29: mov eax, [edi]
  '00486A2B: test eax, eax
  '00486A2D: jz 486A4Bh
  '00486A2F: cmp word ptr [eax], 0001h
  '00486A33: jnz 486A4Bh
  '00486A35: mov esi, [eax+14h]
  '00486A38: mov ecx, [eax+10h]
  '00486A3B: neg esi
  '00486A3D: cmp esi, ecx
  '00486A3F: jb 486A47h
  '00486A41: call [00401170h]
  '00486A47: mov eax, esi
  '00486A49: jmp 486A51h
  '00486A4B: call [00401170h]
  '00486A51: mov ecx, [ebp-38h]
  '00486A54: mov edx, [ecx+0Ch]
  '00486A57: mov ecx, [edi]
  '00486A59: mov ecx, [ecx+0Ch]
  '00486A5C: mov dl, [edx+ebx]
  '00486A5F: mov [ecx+eax], dl
  '00486A62: mov eax, [edi]
  '00486A64: test eax, eax
  '00486A66: jz 486A87h
  '00486A68: cmp word ptr [eax], 0001h
  '00486A6C: jnz 486A87h
  '00486A6E: mov edx, [eax+14h]
  '00486A71: mov ecx, [eax+10h]
  '00486A74: mov esi, 00000001h
  '00486A79: sub esi, edx
  '00486A7B: cmp esi, ecx
  '00486A7D: jb 486A8Fh
  '00486A7F: call [00401170h]
  '00486A85: jmp 486A8Fh
  '00486A87: call [00401170h]
  '00486A8D: mov esi, eax
  '00486A8F: mov ebx, [004011F4h]
  '00486A95: mov ecx, 00000001h
  '00486A9A: call ebx
  '00486A9C: mov ecx, [edi]
  '00486A9E: mov edx, [ecx+0Ch]
  '00486AA1: mov [edx+esi], al
  '00486AA4: mov eax, [edi]
  '00486AA6: test eax, eax
  '00486AA8: jz 486AD3h
  '00486AAA: cmp word ptr [eax], 0001h
  '00486AAE: jnz 486AD3h
  '00486AB0: mov edx, [eax+14h]
  '00486AB3: mov ecx, [eax+10h]
  '00486AB6: mov esi, 00000002h
  '00486ABB: sub esi, edx
  '00486ABD: cmp esi, ecx
  '00486ABF: jb 486ADBh
  '00486AC1: call [00401170h]
  '00486AC7: mov ecx, 00000001h
  '00486ACC: call ebx
  '00486ACE: jmp 00486D0Ah
  '00486AD3: call [00401170h]
  '00486AD9: mov esi, eax
  '00486ADB: mov ecx, 00000001h
  '00486AE0: call ebx
  '00486AE2: jmp 00486D0Ah
  '00486AE7: mov eax, [edi]
  '00486AE9: push eax
  '00486AEA: push 00000001h
  '00486AEC: call esi
  '00486AEE: cmp eax, 00000001h
  '00486AF1: jnz 00486D12h
  '00486AF7: push ebx
  '00486AF8: push eax
  '00486AF9: push eax
  '00486AFA: lea ecx, [ebp-38h]
  '00486AFD: push 00000011h
  '00486AFF: push ecx
  '00486B00: push eax
  '00486B01: push 00000080h
  '00486B06: call [004011E4h]
  '00486B0C: mov eax, [edi]
  '00486B0E: add esp, 0000001Ch
  '00486B11: cmp eax, ebx
  '00486B13: jz 486B31h
  '00486B15: cmp word ptr [eax], 0001h
  '00486B19: jnz 486B31h
  '00486B1B: mov esi, [eax+14h]
  '00486B1E: mov ecx, [eax+10h]
  '00486B21: neg esi
  '00486B23: cmp esi, ecx
  '00486B25: jb 486B2Dh
  '00486B27: call [00401170h]
  '00486B2D: mov ebx, esi
  '00486B2F: jmp 486B39h
  '00486B31: call [00401170h]
  '00486B37: mov ebx, eax
  '00486B39: mov ecx, [ebp-38h]
  '00486B3C: test ecx, ecx
  '00486B3E: jz 486B5Fh
  '00486B40: cmp word ptr [ecx], 0001h
  '00486B44: jnz 486B5Fh
  '00486B46: mov esi, [ecx+14h]
  '00486B49: mov eax, [ecx+10h]
  '00486B4C: neg esi
  '00486B4E: cmp esi, eax
  '00486B50: jb 486B5Bh
  '00486B52: call [00401170h]
  '00486B58: mov ecx, [ebp-38h]
  '00486B5B: mov eax, esi
  '00486B5D: jmp 486B68h
  '00486B5F: call [00401170h]
  '00486B65: mov ecx, [ebp-38h]
  '00486B68: mov edx, [edi]
  '00486B6A: mov ecx, [ecx+0Ch]
  '00486B6D: mov edx, [edx+0Ch]
  '00486B70: mov dl, [edx+ebx]
  '00486B73: mov [ecx+eax], dl
  '00486B76: mov eax, [edi]
  '00486B78: test eax, eax
  '00486B7A: jz 486B9Dh
  '00486B7C: cmp word ptr [eax], 0001h
  '00486B80: jnz 486B9Dh
  '00486B82: mov edx, [eax+14h]
  '00486B85: mov ecx, [eax+10h]
  '00486B88: mov esi, 00000001h
  '00486B8D: sub esi, edx
  '00486B8F: cmp esi, ecx
  '00486B91: jb 486B99h
  '00486B93: call [00401170h]
  '00486B99: mov ebx, esi
  '00486B9B: jmp 486BA5h
  '00486B9D: call [00401170h]
  '00486BA3: mov ebx, eax
  '00486BA5: mov ecx, [ebp-38h]
  '00486BA8: test ecx, ecx
  '00486BAA: jz 486BD0h
  '00486BAC: cmp word ptr [ecx], 0001h
  '00486BB0: jnz 486BD0h
  '00486BB2: mov edx, [ecx+14h]
  '00486BB5: mov eax, [ecx+10h]
  '00486BB8: mov esi, 00000001h
  '00486BBD: sub esi, edx
  '00486BBF: cmp esi, eax
  '00486BC1: jb 486BCCh
  '00486BC3: call [00401170h]
  '00486BC9: mov ecx, [ebp-38h]
  '00486BCC: mov eax, esi
  '00486BCE: jmp 486BD9h
  '00486BD0: call [00401170h]
  '00486BD6: mov ecx, [ebp-38h]
  '00486BD9: mov edx, [edi]
  '00486BDB: mov ecx, [ecx+0Ch]
  '00486BDE: push 00000000h
  '00486BE0: push 00000002h
  '00486BE2: mov edx, [edx+0Ch]
  '00486BE5: push 00000001h
  '00486BE7: push 00000011h
  '00486BE9: push edi
  '00486BEA: mov dl, [edx+ebx]
  '00486BED: push 00000001h
  '00486BEF: push 00000080h
  '00486BF4: mov [ecx+eax], dl
  '00486BF7: call [004011E4h]
  '00486BFD: mov eax, [ebp-38h]
  '00486C00: add esp, 0000001Ch
  '00486C03: test eax, eax
  '00486C05: jz 486C23h
  '00486C07: cmp word ptr [eax], 0001h
  '00486C0B: jnz 486C23h
  '00486C0D: mov esi, [eax+14h]
  '00486C10: mov ecx, [eax+10h]
  '00486C13: neg esi
  '00486C15: cmp esi, ecx
  '00486C17: jb 486C1Fh
  '00486C19: call [00401170h]
  '00486C1F: mov ebx, esi
  '00486C21: jmp 486C2Bh
  '00486C23: call [00401170h]
  '00486C29: mov ebx, eax
  '00486C2B: mov eax, [edi]
  '00486C2D: test eax, eax
  '00486C2F: jz 486C4Dh
  '00486C31: cmp word ptr [eax], 0001h
  '00486C35: jnz 486C4Dh
  '00486C37: mov esi, [eax+14h]
  '00486C3A: mov ecx, [eax+10h]
  '00486C3D: neg esi
  '00486C3F: cmp esi, ecx
  '00486C41: jb 486C49h
  '00486C43: call [00401170h]
  '00486C49: mov eax, esi
  '00486C4B: jmp 486C53h
  '00486C4D: call [00401170h]
  '00486C53: mov ecx, [ebp-38h]
  '00486C56: mov edx, [ecx+0Ch]
  '00486C59: mov ecx, [edi]
  '00486C5B: mov ecx, [ecx+0Ch]
  '00486C5E: mov dl, [edx+ebx]
  '00486C61: mov [ecx+eax], dl
  '00486C64: mov eax, [ebp-38h]
  '00486C67: test eax, eax
  '00486C69: jz 486C8Ch
  '00486C6B: cmp word ptr [eax], 0001h
  '00486C6F: jnz 486C8Ch
  '00486C71: mov edx, [eax+14h]
  '00486C74: mov ecx, [eax+10h]
  '00486C77: mov esi, 00000001h
  '00486C7C: sub esi, edx
  '00486C7E: cmp esi, ecx
  '00486C80: jb 486C88h
  '00486C82: call [00401170h]
  '00486C88: mov ebx, esi
  '00486C8A: jmp 486C94h
  '00486C8C: call [00401170h]
  '00486C92: mov ebx, eax
  '00486C94: mov eax, [edi]
  '00486C96: test eax, eax
  '00486C98: jz 486CBBh
  '00486C9A: cmp word ptr [eax], 0001h
  '00486C9E: jnz 486CBBh
  '00486CA0: mov edx, [eax+14h]
  '00486CA3: mov ecx, [eax+10h]
  '00486CA6: mov esi, 00000001h
  '00486CAB: sub esi, edx
  '00486CAD: cmp esi, ecx
  '00486CAF: jb 486CB7h
  '00486CB1: call [00401170h]
  '00486CB7: mov eax, esi
  '00486CB9: jmp 486CC1h
  '00486CBB: call [00401170h]
  '00486CC1: mov ecx, [ebp-38h]
  '00486CC4: mov edx, [ecx+0Ch]
  '00486CC7: mov ecx, [edi]
  '00486CC9: mov ecx, [ecx+0Ch]
  '00486CCC: mov dl, [edx+ebx]
  '00486CCF: mov [ecx+eax], dl
  '00486CD2: mov eax, [edi]
  '00486CD4: test eax, eax
  '00486CD6: jz 486CF7h
  '00486CD8: cmp word ptr [eax], 0001h
  '00486CDC: jnz 486CF7h
  '00486CDE: mov edx, [eax+14h]
  '00486CE1: mov ecx, [eax+10h]
  '00486CE4: mov esi, 00000002h
  '00486CE9: sub esi, edx
  '00486CEB: cmp esi, ecx
  '00486CED: jb 486CFFh
  '00486CEF: call [00401170h]
  '00486CF5: jmp 486CFFh
  '00486CF7: call [00401170h]
  '00486CFD: mov esi, eax
  '00486CFF: mov ecx, 00000001h
  '00486D04: call [004011F4h]
  '00486D0A: mov ecx, [edi]
  '00486D0C: mov edx, [ecx+0Ch]
  '00486D0F: mov [edx+esi], al
  '00486D12: mov ebx, [ebp+0Ch]
  '00486D15: mov esi, 00000001h
  '00486D1A: mov [ebp-24h], esi
  '00486D1D: mov eax, 00000010h
  '00486D22: cmp si, ax
  '00486D25: jnle 004871DDh
  '00486D2B: mov eax, [edi]
  '00486D2D: push eax
  '00486D2E: push 00000001h
  '00486D30: call [00401264h]
  '00486D36: mov ecx, eax
  '00486D38: call [0040119Ch]
  '00486D3E: mov ecx, [edi]
  '00486D40: mov edi, [00401264h]
  '00486D46: push ecx
  '00486D47: push 00000001h
  '00486D49: mov [ebp-1Ch], eax
  '00486D4C: call edi
  '00486D4E: mov edx, eax
  '00486D50: mov eax, [ebx]
  '00486D52: push eax
  '00486D53: push 00000001h
  '00486D55: mov [ebp-00000090h], edx
  '00486D5B: call edi
  '00486D5D: mov ecx, [ebp-00000090h]
  '00486D63: cdq 
  '00486D64: idiv ecx
  '00486D66: mov [ebp-20h], edx
  '00486D69: mov edx, [ebx]
  '00486D6B: push edx
  '00486D6C: push 00000001h
  '00486D6E: call edi
  '00486D70: mov edi, [ebp+10h]
  '00486D73: mov [ebp-18h], eax
  '00486D76: mov ecx, [ebp-18h]
  '00486D79: mov eax, 00000001h
  '00486D7E: cmp ecx, eax
  '00486D80: jl 0048713Ah
  '00486D86: mov eax, [ebp-20h]
  '00486D89: test eax, eax
  '00486D8B: jnz 486D94h
  '00486D8D: movsx eax, word ptr [ebp-1Ch]
  '00486D91: mov [ebp-20h], eax
  '00486D94: mov eax, [ebx]
  '00486D96: test eax, eax
  '00486D98: jz 486DC1h
  '00486D9A: cmp word ptr [eax], 0001h
  '00486D9E: jnz 486DC1h
  '00486DA0: mov edx, [eax+14h]
  '00486DA3: mov esi, ecx
  '00486DA5: mov ecx, [eax+10h]
  '00486DA8: sub esi, 00000001h
  '00486DAB: jo 00487385h
  '00486DB1: sub esi, edx
  '00486DB3: cmp esi, ecx
  '00486DB5: jb 486DBDh
  '00486DB7: call [00401170h]
  '00486DBD: mov eax, esi
  '00486DBF: jmp 486DC7h
  '00486DC1: call [00401170h]
  '00486DC7: mov ecx, [ebx]
  '00486DC9: mov edx, [ecx+0Ch]
  '00486DCC: xor ecx, ecx
  '00486DCE: mov cl, [edx+eax]
  '00486DD1: mov eax, ecx
  '00486DD3: cmp eax, 00000100h
  '00486DD8: mov [ebp-74h], eax
  '00486DDB: jb 486DE3h
  '00486DDD: call [00401170h]
  '00486DE3: mov eax, [ebx]
  '00486DE5: test eax, eax
  '00486DE7: jz 486E08h
  '00486DE9: cmp word ptr [eax], 0001h
  '00486DED: jnz 486E08h
  '00486DEF: mov esi, [ebp-18h]
  '00486DF2: mov edx, [eax+14h]
  '00486DF5: mov ecx, [eax+10h]
  '00486DF8: sub esi, edx
  '00486DFA: cmp esi, ecx
  '00486DFC: jb 486E04h
  '00486DFE: call [00401170h]
  '00486E04: mov eax, esi
  '00486E06: jmp 486E0Eh
  '00486E08: call [00401170h]
  '00486E0E: mov edx, [ebx]
  '00486E10: mov ecx, [edx+0Ch]
  '00486E13: xor edx, edx
  '00486E15: mov dl, [ecx+eax]
  '00486E18: mov eax, edx
  '00486E1A: cmp eax, 00000100h
  '00486E1F: mov [ebp-68h], eax
  '00486E22: jb 486E2Ah
  '00486E24: call [00401170h]
  '00486E2A: mov eax, [edi]
  '00486E2C: test eax, eax
  '00486E2E: jz 486E4Fh
  '00486E30: cmp word ptr [eax], 0001h
  '00486E34: jnz 486E4Fh
  '00486E36: mov esi, [ebp-20h]
  '00486E39: mov edx, [eax+14h]
  '00486E3C: mov ecx, [eax+10h]
  '00486E3F: sub esi, edx
  '00486E41: cmp esi, ecx
  '00486E43: jb 486E4Bh
  '00486E45: call [00401170h]
  '00486E4B: mov eax, esi
  '00486E4D: jmp 486E55h
  '00486E4F: call [00401170h]
  '00486E55: mov ecx, [edi]
  '00486E57: mov edx, [ecx+0Ch]
  '00486E5A: xor ecx, ecx
  '00486E5C: mov cl, [edx+eax]
  '00486E5F: mov esi, ecx
  '00486E61: cmp esi, 00000100h
  '00486E67: jb 486E6Fh
  '00486E69: call [00401170h]
  '00486E6F: mov edx, [ebp+08h]
  '00486E72: xor eax, eax
  '00486E74: shl esi, 08h
  '00486E77: mov ecx, [edx+58h]
  '00486E7A: add esi, ecx
  '00486E7C: mov ecx, [ebp-68h]
  '00486E7F: mov al, [esi+ecx]
  '00486E82: mov esi, eax
  '00486E84: cmp esi, 00000100h
  '00486E8A: jb 486E92h
  '00486E8C: call [00401170h]
  '00486E92: mov eax, [ebx]
  '00486E94: test eax, eax
  '00486E96: jz 486EC0h
  '00486E98: cmp word ptr [eax], 0001h
  '00486E9C: jnz 486EC0h
  '00486E9E: mov edi, [ebp-18h]
  '00486EA1: mov edx, [eax+14h]
  '00486EA4: mov ecx, [eax+10h]
  '00486EA7: sub edi, 00000001h
  '00486EAA: jo 00487385h
  '00486EB0: sub edi, edx
  '00486EB2: cmp edi, ecx
  '00486EB4: jb 486EBCh
  '00486EB6: call [00401170h]
  '00486EBC: mov eax, edi
  '00486EBE: jmp 486EC6h
  '00486EC0: call [00401170h]
  '00486EC6: mov edx, [ebp+08h]
  '00486EC9: mov ecx, [ebx]
  '00486ECB: shl esi, 08h
  '00486ECE: mov edi, [edx+7Ch]
  '00486ED1: mov edx, [ecx+0Ch]
  '00486ED4: mov ecx, [ebp-74h]
  '00486ED7: add esi, edi
  '00486ED9: mov cl, [esi+ecx]
  '00486EDC: mov [edx+eax], cl
  '00486EDF: mov eax, [ebx]
  '00486EE1: test eax, eax
  '00486EE3: jz 486F0Dh
  '00486EE5: cmp word ptr [eax], 0001h
  '00486EE9: jnz 486F0Dh
  '00486EEB: mov esi, [ebp-18h]
  '00486EEE: mov edx, [eax+14h]
  '00486EF1: mov ecx, [eax+10h]
  '00486EF4: sub esi, 00000001h
  '00486EF7: jo 00487385h
  '00486EFD: sub esi, edx
  '00486EFF: cmp esi, ecx
  '00486F01: jb 486F09h
  '00486F03: call [00401170h]
  '00486F09: mov eax, esi
  '00486F0B: jmp 486F13h
  '00486F0D: call [00401170h]
  '00486F13: mov edx, [ebx]
  '00486F15: mov ecx, [edx+0Ch]
  '00486F18: xor edx, edx
  '00486F1A: mov dl, [ecx+eax]
  '00486F1D: mov edi, edx
  '00486F1F: cmp edi, 00000100h
  '00486F25: mov [ebp-68h], edi
  '00486F28: jb 486F30h
  '00486F2A: call [00401170h]
  '00486F30: mov eax, [ebx]
  '00486F32: test eax, eax
  '00486F34: jz 486F55h
  '00486F36: cmp word ptr [eax], 0001h
  '00486F3A: jnz 486F55h
  '00486F3C: mov esi, [ebp-18h]
  '00486F3F: mov edx, [eax+14h]
  '00486F42: mov ecx, [eax+10h]
  '00486F45: sub esi, edx
  '00486F47: cmp esi, ecx
  '00486F49: jb 486F51h
  '00486F4B: call [00401170h]
  '00486F51: mov eax, esi
  '00486F53: jmp 486F5Bh
  '00486F55: call [00401170h]
  '00486F5B: mov ecx, [ebx]
  '00486F5D: mov edx, [ecx+0Ch]
  '00486F60: xor ecx, ecx
  '00486F62: mov cl, [edx+eax]
  '00486F65: mov esi, ecx
  '00486F67: cmp esi, 00000100h
  '00486F6D: jb 486F75h
  '00486F6F: call [00401170h]
  '00486F75: mov eax, [ebx]
  '00486F77: test eax, eax
  '00486F79: jz 486F9Dh
  '00486F7B: cmp word ptr [eax], 0001h
  '00486F7F: jnz 486F9Dh
  '00486F81: mov edi, [ebp-18h]
  '00486F84: mov edx, [eax+14h]
  '00486F87: mov ecx, [eax+10h]
  '00486F8A: sub edi, edx
  '00486F8C: cmp edi, ecx
  '00486F8E: jb 486F96h
  '00486F90: call [00401170h]
  '00486F96: mov eax, edi
  '00486F98: mov edi, [ebp-68h]
  '00486F9B: jmp 486FA3h
  '00486F9D: call [00401170h]
  '00486FA3: mov edx, [ebp+08h]
  '00486FA6: shl esi, 08h
  '00486FA9: mov ecx, [edx+7Ch]
  '00486FAC: add esi, ecx
  '00486FAE: mov ecx, [ebx]
  '00486FB0: mov edx, [ecx+0Ch]
  '00486FB3: mov cl, [esi+edi]
  '00486FB6: mov [edx+eax], cl
  '00486FB9: mov eax, [ebx]
  '00486FBB: test eax, eax
  '00486FBD: jz 486FE7h
  '00486FBF: cmp word ptr [eax], 0001h
  '00486FC3: jnz 486FE7h
  '00486FC5: mov esi, [ebp-18h]
  '00486FC8: mov edx, [eax+14h]
  '00486FCB: mov ecx, [eax+10h]
  '00486FCE: sub esi, 00000001h
  '00486FD1: jo 00487385h
  '00486FD7: sub esi, edx
  '00486FD9: cmp esi, ecx
  '00486FDB: jb 486FE3h
  '00486FDD: call [00401170h]
  '00486FE3: mov eax, esi
  '00486FE5: jmp 486FEDh
  '00486FE7: call [00401170h]
  '00486FED: mov edx, [ebx]
  '00486FEF: mov ecx, [edx+0Ch]
  '00486FF2: xor edx, edx
  '00486FF4: mov dl, [ecx+eax]
  '00486FF7: mov eax, edx
  '00486FF9: cmp eax, 00000100h
  '00486FFE: mov [ebp-74h], eax
  '00487001: jb 487009h
  '00487003: call [00401170h]
  '00487009: mov eax, [ebx]
  '0048700B: test eax, eax
  '0048700D: jz 48702Eh
  '0048700F: cmp word ptr [eax], 0001h
  '00487013: jnz 48702Eh
  '00487015: mov esi, [ebp-18h]
  '00487018: mov edx, [eax+14h]
  '0048701B: mov ecx, [eax+10h]
  '0048701E: sub esi, edx
  '00487020: cmp esi, ecx
  '00487022: jb 48702Ah
  '00487024: call [00401170h]
  '0048702A: mov eax, esi
  '0048702C: jmp 487034h
  '0048702E: call [00401170h]
  '00487034: mov ecx, [ebx]
  '00487036: mov edx, [ecx+0Ch]
  '00487039: xor ecx, ecx
  '0048703B: mov cl, [edx+eax]
  '0048703E: mov edi, ecx
  '00487040: cmp edi, 00000100h
  '00487046: jb 48704Eh
  '00487048: call [00401170h]
  '0048704E: mov edx, [ebp+10h]
  '00487051: mov eax, [edx]
  '00487053: test eax, eax
  '00487055: jz 48707Fh
  '00487057: cmp word ptr [eax], 0001h
  '0048705B: jnz 48707Fh
  '0048705D: mov esi, [ebp-20h]
  '00487060: mov edx, [eax+14h]
  '00487063: mov ecx, [eax+10h]
  '00487066: sub esi, 00000001h
  '00487069: jo 00487385h
  '0048706F: sub esi, edx
  '00487071: cmp esi, ecx
  '00487073: jb 48707Bh
  '00487075: call [00401170h]
  '0048707B: mov eax, esi
  '0048707D: jmp 487085h
  '0048707F: call [00401170h]
  '00487085: mov ecx, [ebp+10h]
  '00487088: mov edx, [ecx]
  '0048708A: mov ecx, [edx+0Ch]
  '0048708D: xor edx, edx
  '0048708F: mov dl, [ecx+eax]
  '00487092: mov esi, edx
  '00487094: cmp esi, 00000100h
  '0048709A: jb 4870A2h
  '0048709C: call [00401170h]
  '004870A2: mov eax, [ebp+08h]
  '004870A5: shl esi, 08h
  '004870A8: mov ecx, [eax+58h]
  '004870AB: add esi, ecx
  '004870AD: xor ecx, ecx
  '004870AF: mov cl, [esi+edi]
  '004870B2: mov esi, ecx
  '004870B4: cmp esi, 00000100h
  '004870BA: jb 4870C2h
  '004870BC: call [00401170h]
  '004870C2: mov eax, [ebx]
  '004870C4: test eax, eax
  '004870C6: jz 4870F0h
  '004870C8: cmp word ptr [eax], 0001h
  '004870CC: jnz 4870F0h
  '004870CE: mov edi, [ebp-18h]
  '004870D1: mov edx, [eax+14h]
  '004870D4: mov ecx, [eax+10h]
  '004870D7: sub edi, 00000001h
  '004870DA: jo 00487385h
  '004870E0: sub edi, edx
  '004870E2: cmp edi, ecx
  '004870E4: jb 4870ECh
  '004870E6: call [00401170h]
  '004870EC: mov eax, edi
  '004870EE: jmp 4870F6h
  '004870F0: call [00401170h]
  '004870F6: mov edx, [ebp+08h]
  '004870F9: mov ecx, [ebx]
  '004870FB: shl esi, 08h
  '004870FE: mov edi, [edx+7Ch]
  '00487101: mov edx, [ecx+0Ch]
  '00487104: mov ecx, [ebp-74h]
  '00487107: add esi, edi
  '00487109: mov edi, [ebp+10h]
  '0048710C: mov cl, [esi+ecx]
  '0048710F: mov esi, [ebp-24h]
  '00487112: mov [edx+eax], cl
  '00487115: mov edx, [ebp-20h]
  '00487118: mov ecx, [ebp-18h]
  '0048711B: sub edx, 00000001h
  '0048711E: jo 00487385h
  '00487124: or eax, FFFFFFFFh
  '00487127: mov [ebp-20h], edx
  '0048712A: add eax, ecx
  '0048712C: jo 00487385h
  '00487132: mov [ebp-18h], eax
  '00487135: jmp 00486D76h
  '0048713A: movsx eax, si
  '0048713D: mov [ebp-00000094h], eax
  '00487143: fild dword ptr [ebp-00000094h]
  '00487149: fstp real8 ptr [ebp-0000009Ch]
  '0048714F: fld real8 ptr [ebp-0000009Ch]
  '00487155: cmp [004A0000h], 00000000h
  '0048715C: jnz 487166h
  '0048715E: fdiv real8 ptr [00402960h]
  '00487164: jmp 487177h
  '00487166: push [00402964h]
  '0048716C: push [00402960h]
  '00487172: call 004037B4h
  '00487177: fmul real8 ptr [00401AF0h]
  '0048717D: fstsw ax
  '0048717F: test al, 0Dh
  '00487181: jnz 00487380h
  '00487187: call [00401318h]
  '0048718D: sub esp, 00000010h
  '00487190: mov ecx, 00004002h
  '00487195: mov edx, esp
  '00487197: mov [ebp-50h], ecx
  '0048719A: mov [ebp-54h], eax
  '0048719D: lea eax, [ebp-54h]
  '004871A0: mov [edx], ecx
  '004871A2: mov ecx, [ebp-4Ch]
  '004871A5: mov [ebp-48h], eax
  '004871A8: push 00000001h
  '004871AA: mov [edx+04h], ecx
  '004871AD: mov ecx, [ebp+08h]
  '004871B0: push 00000001h
  '004871B2: push ecx
  '004871B3: mov [edx+08h], eax
  '004871B6: mov eax, [ebp-44h]
  '004871B9: mov [edx+0Ch], eax
  '004871BC: call [00401068h]
  '004871C2: mov eax, 00000001h
  '004871C7: add esp, 0000001Ch
  '004871CA: add ax, si
  '004871CD: jo 00487385h
  '004871D3: mov esi, eax
  '004871D5: mov [ebp-24h], esi
  '004871D8: jmp 00486D1Dh
  '004871DD: lea edx, [ebp-38h]
  '004871E0: push ebx
  '004871E1: push edx
  '004871E2: call [00401344h]
  '004871E8: mov eax, [ebp-38h]
  '004871EB: mov edi, [00401264h]
  '004871F1: push 00000000h
  '004871F3: push eax
  '004871F4: push 00000001h
  '004871F6: call edi
  '004871F8: sub eax, 00000004h
  '004871FB: jo 00487385h
  '00487201: push eax
  '00487202: push 00000001h
  '00487204: push 00000011h
  '00487206: push ebx
  '00487207: push 00000001h
  '00487209: push 00000080h
  '0048720E: call [004011E4h]
  '00487214: mov ecx, [ebp-38h]
  '00487217: add esp, 0000001Ch
  '0048721A: lea edx, [ebp-40h]
  '0048721D: push ecx
  '0048721E: push edx
  '0048721F: call [004012F8h]
  '00487225: mov eax, [ebp-40h]
  '00487228: test eax, eax
  '0048722A: jz 487251h
  '0048722C: cmp word ptr [eax], 0001h
  '00487230: jnz 487251h
  '00487232: mov edx, [eax+14h]
  '00487235: mov ecx, [eax+10h]
  '00487238: mov esi, 00000003h
  '0048723D: sub esi, edx
  '0048723F: cmp esi, ecx
  '00487241: jb 487249h
  '00487243: call [00401170h]
  '00487249: mov [ebp-000000A0h], esi
  '0048724F: jmp 48725Dh
  '00487251: call [00401170h]
  '00487257: mov [ebp-000000A0h], eax
  '0048725D: mov eax, [ebx]
  '0048725F: lea ecx, [ebp-3Ch]
  '00487262: push eax
  '00487263: push ecx
  '00487264: call [004012F8h]
  '0048726A: mov eax, [ebp-3Ch]
  '0048726D: test eax, eax
  '0048726F: jz 48728Bh
  '00487271: cmp word ptr [eax], 0001h
  '00487275: jnz 48728Bh
  '00487277: mov esi, [eax+14h]
  '0048727A: mov ecx, [eax+10h]
  '0048727D: neg esi
  '0048727F: cmp esi, ecx
  '00487281: jb 487293h
  '00487283: call [00401170h]
  '00487289: jmp 487293h
  '0048728B: call [00401170h]
  '00487291: mov esi, eax
  '00487293: mov edx, [ebx]
  '00487295: push edx
  '00487296: push 00000001h
  '00487298: call edi
  '0048729A: mov edx, [ebp-3Ch]
  '0048729D: push eax
  '0048729E: mov eax, [ebp-40h]
  '004872A1: mov ecx, [eax+0Ch]
  '004872A4: mov eax, [ebp-000000A0h]
  '004872AA: add ecx, eax
  '004872AC: mov eax, [edx+0Ch]
  '004872AF: add eax, esi
  '004872B1: push ecx
  '004872B2: push eax
  '004872B3: call 004101ECh
  '004872B8: call [004010A4h]
  '004872BE: mov esi, [00401378h]
  '004872C4: lea ecx, [ebp-3Ch]
  '004872C7: push ecx
  '004872C8: call esi
  '004872CA: lea edx, [ebp-40h]
  '004872CD: push edx
  '004872CE: call esi
  '004872D0: mov eax, [ebx]
  '004872D2: push 00000000h
  '004872D4: push eax
  '004872D5: push 00000001h
  '004872D7: call edi
  '004872D9: sub eax, 00000001h
  '004872DC: jo 00487385h
  '004872E2: push eax
  '004872E3: push 00000001h
  '004872E5: push 00000011h
  '004872E7: push ebx
  '004872E8: push 00000001h
  '004872EA: push 00000080h
  '004872EF: call [004011BCh]
  '004872F5: mov ecx, [ebx]
  '004872F7: add esp, 0000001Ch
  '004872FA: mov [ebp-48h], ecx
  '004872FD: lea edx, [ebp-50h]
  '00487300: lea ecx, [ebp-34h]
  '00487303: mov [ebp-50h], 00002011h
  '0048730A: call [00401324h]
  '00487310: wait 
  '00487311: push 00487347h
  '00487316: jmp 48733Ah
  '00487318: test byte ptr [ebp-04h], 04h
  '0048731C: jz 487327h
  '0048731E: lea ecx, [ebp-34h]
  '00487321: call [00401034h]
  '00487327: mov esi, [00401378h]
  '0048732D: lea edx, [ebp-3Ch]
  '00487330: push edx
  '00487331: call esi
  '00487333: lea eax, [ebp-40h]
  '00487336: push eax
  '00487337: call esi
  '00487339: ret 
End Sub
Private Sub EncryptString_4847D0
  '004847D0: push ebp
  '004847D1: mov ebp, esp
  '004847D3: sub esp, 00000008h
  '004847D6: push 00403796h
  '004847DB: mov eax, fs:[00h]
  '004847E1: push eax
  '004847E2: mov fs:[00000000h], esp
  '004847E9: sub esp, 00000018h
  '004847EC: push ebx
  '004847ED: push esi
  '004847EE: push edi
  '004847EF: mov [ebp-08h], esp
  '004847F2: mov [ebp-04h], 00402888h
  '004847F9: mov eax, [ebp+10h]
  '004847FC: xor edi, edi
  '004847FE: mov [ebp-18h], edi
  '00484801: mov [ebp-1Ch], edi
  '00484804: mov ebx, [eax]
  '00484806: cmp ebx, edi
  '00484808: jnle 484818h
  '0048480A: mov ecx, [ebp+0Ch]
  '0048480D: mov edx, [ecx]
  '0048480F: push edx
  '00484810: call [0040103Ch]
  '00484816: mov ebx, eax
  '00484818: mov esi, [ebp+08h]
  '0048481B: mov ecx, [esi+40h]
  '0048481E: mov eax, [esi+44h]
  '00484821: add ecx, ebx
  '00484823: jo 0048491Dh
  '00484829: cmp ecx, eax
  '0048482B: jle 484855h
  '0048482D: add eax, 00000400h
  '00484832: push edi
  '00484833: jo 0048491Dh
  '00484839: push eax
  '0048483A: push 00000001h
  '0048483C: lea edx, [esi+3Ch]
  '0048483F: push 00000011h
  '00484841: push edx
  '00484842: push 00000001h
  '00484844: push 00000080h
  '00484849: mov [esi+44h], eax
  '0048484C: call [004011BCh]
  '00484852: add esp, 0000001Ch
  '00484855: mov eax, [esi+3Ch]
  '00484858: lea ecx, [ebp-18h]
  '0048485B: push eax
  '0048485C: push ecx
  '0048485D: call [004012F8h]
  '00484863: mov ecx, [ebp-18h]
  '00484866: cmp ecx, edi
  '00484868: jz 48488Ch
  '0048486A: cmp word ptr [ecx], 0001h
  '0048486E: jnz 48488Ch
  '00484870: mov edi, [esi+40h]
  '00484873: mov edx, [ecx+14h]
  '00484876: mov eax, [ecx+10h]
  '00484879: sub edi, edx
  '0048487B: cmp edi, eax
  '0048487D: jb 484888h
  '0048487F: call [00401170h]
  '00484885: mov ecx, [ebp-18h]
  '00484888: mov eax, edi
  '0048488A: jmp 484895h
  '0048488C: call [00401170h]
  '00484892: mov ecx, [ebp-18h]
  '00484895: mov edx, [ecx+0Ch]
  '00484898: add edx, eax
  '0048489A: push edx
  '0048489B: call [00401280h]
  '004848A1: mov edi, eax
  '004848A3: lea eax, [ebp-18h]
  '004848A6: push eax
  '004848A7: call [00401378h]
  '004848AD: mov ecx, [ebp+0Ch]
  '004848B0: push ebx
  '004848B1: lea eax, [ebp-1Ch]
  '004848B4: mov edx, [ecx]
  '004848B6: push edx
  '004848B7: push eax
  '004848B8: call [0040130Ch]
  '004848BE: push eax
  '004848BF: push edi
  '004848C0: call 004101ECh
  '004848C5: call [004010A4h]
  '004848CB: mov ecx, [ebp-1Ch]
  '004848CE: mov edx, [ebp+0Ch]
  '004848D1: push ecx
  '004848D2: push edx
  '004848D3: call [00401228h]
  '004848D9: lea ecx, [ebp-1Ch]
  '004848DC: call [0040138Ch]
  '004848E2: mov eax, [esi+40h]
  '004848E5: push 00484908h
  '004848EA: add eax, ebx
  '004848EC: jo 48491Dh
  '004848EE: mov [esi+40h], eax
  '004848F1: jmp 484907h
  '004848F3: lea ecx, [ebp-18h]
  '004848F6: push ecx
  '004848F7: call [00401378h]
  '004848FD: lea ecx, [ebp-1Ch]
  '00484900: call [0040138Ch]
  '00484906: ret 
End Sub
Private Sub DecryptString_484930
  '00484930: push ebp
  '00484931: mov ebp, esp
  '00484933: sub esp, 0000000Ch
  '00484936: push 00403796h
  '0048493B: mov eax, fs:[00h]
  '00484941: push eax
  '00484942: mov fs:[00000000h], esp
  '00484949: sub esp, 00000064h
  '0048494C: push ebx
  '0048494D: push esi
  '0048494E: push edi
  '0048494F: mov [ebp-0Ch], esp
  '00484952: mov [ebp-08h], 00402898h
  '00484959: mov eax, [ebp+10h]
  '0048495C: mov edi, [ebp+08h]
  '0048495F: xor esi, esi
  '00484961: push edi
  '00484962: mov [eax], esi
  '00484964: mov ecx, [edi]
  '00484966: mov [ebp-20h], esi
  '00484969: mov [ebp-24h], esi
  '0048496C: mov [ebp-28h], esi
  '0048496F: mov [ebp-2Ch], esi
  '00484972: mov [ebp-30h], esi
  '00484975: mov [ebp-40h], esi
  '00484978: mov [ebp-54h], esi
  '0048497B: call [ecx+48h]
  '0048497E: mov edx, [ebp+0Ch]
  '00484981: mov eax, [edx]
  '00484983: push eax
  '00484984: call [0040103Ch]
  '0048498A: mov ebx, [00401320h]
  '00484990: mov [ebp-78h], eax
  '00484993: fild dword ptr [ebp-78h]
  '00484996: mov [ebp-5Ch], esi
  '00484999: mov [ebp-1Ch], esi
  '0048499C: mov esi, [00401348h]
  '004849A2: mov [ebp-58h], 40000000h
  '004849A9: fstp real8 ptr [ebp-64h]
  '004849AC: mov [ebp-18h], 3FF00000h
  '004849B3: mov ecx, [ebp-58h]
  '004849B6: mov edx, [ebp-5Ch]
  '004849B9: mov eax, [ebp-60h]
  '004849BC: push ecx
  '004849BD: mov ecx, [ebp-64h]
  '004849C0: push edx
  '004849C1: mov edx, [ebp-18h]
  '004849C4: push eax
  '004849C5: mov eax, [ebp-1Ch]
  '004849C8: push ecx
  '004849C9: push edx
  '004849CA: push eax
  '004849CB: call [00401014h]
  '004849D1: test eax, eax
  '004849D3: jz 00484A81h
  '004849D9: fld real8 ptr [ebp-1Ch]
  '004849DC: lea ecx, [ebp-40h]
  '004849DF: mov eax, 00000002h
  '004849E4: push 00420E3Ch
  '004849E9: push ecx
  '004849EA: mov [ebp-38h], eax
  '004849ED: mov [ebp-40h], eax
  '004849F0: call ebx
  '004849F2: mov edx, [ebp+0Ch]
  '004849F5: push eax
  '004849F6: mov eax, [edx]
  '004849F8: push eax
  '004849F9: call [00401138h]
  '004849FF: mov edx, eax
  '00484A01: lea ecx, [ebp-24h]
  '00484A04: call esi
  '00484A06: push eax
  '00484A07: call [00401094h]
  '00484A0D: mov edx, eax
  '00484A0F: lea ecx, [ebp-28h]
  '00484A12: call esi
  '00484A14: push eax
  '00484A15: call [00401390h]
  '00484A1B: call ebx
  '00484A1D: push eax
  '00484A1E: call [00401284h]
  '00484A24: mov edx, eax
  '00484A26: lea ecx, [ebp-30h]
  '00484A29: call esi
  '00484A2B: mov edx, [ebp-30h]
  '00484A2E: xor eax, eax
  '00484A30: lea ecx, [ebp-2Ch]
  '00484A33: mov [ebp-54h], eax
  '00484A36: mov [ebp-30h], eax
  '00484A39: call esi
  '00484A3B: mov ecx, [edi]
  '00484A3D: lea edx, [ebp-54h]
  '00484A40: lea eax, [ebp-2Ch]
  '00484A43: push edx
  '00484A44: push eax
  '00484A45: push edi
  '00484A46: call [ecx+38h]
  '00484A49: lea ecx, [ebp-30h]
  '00484A4C: lea edx, [ebp-2Ch]
  '00484A4F: push ecx
  '00484A50: lea eax, [ebp-28h]
  '00484A53: push edx
  '00484A54: lea ecx, [ebp-24h]
  '00484A57: push eax
  '00484A58: push ecx
  '00484A59: push 00000004h
  '00484A5B: call [004012CCh]
  '00484A61: add esp, 00000014h
  '00484A64: lea ecx, [ebp-40h]
  '00484A67: call [00401034h]
  '00484A6D: fld real8 ptr [ebp-5Ch]
  '00484A70: fadd real8 ptr [ebp-1Ch]
  '00484A73: fstp real8 ptr [ebp-1Ch]
  '00484A76: fstsw ax
  '00484A78: test al, 0Dh
  '00484A7A: jnz 4849FAh
  '00484A7C: jmp 004849B3h
  '00484A81: mov edx, [edi]
  '00484A83: lea eax, [ebp-24h]
  '00484A86: push eax
  '00484A87: push edi
  '00484A88: call [edx+44h]
  '00484A8B: mov edx, [ebp-24h]
  '00484A8E: lea ecx, [ebp-20h]
  '00484A91: mov [ebp-24h], 00000000h
  '00484A98: call esi
  '00484A9A: mov ecx, [edi]
  '00484A9C: push edi
  '00484A9D: call [ecx+48h]
  '00484AA0: wait 
  '00484AA1: push 00484ADDh
  '00484AA6: jmp 484ADCh
  '00484AA8: test byte ptr [ebp-04h], 04h
  '00484AAC: jz 484AB7h
  '00484AAE: lea ecx, [ebp-20h]
  '00484AB1: call [0040138Ch]
  '00484AB7: lea edx, [ebp-30h]
  '00484ABA: lea eax, [ebp-2Ch]
  '00484ABD: push edx
  '00484ABE: lea ecx, [ebp-28h]
  '00484AC1: push eax
  '00484AC2: lea edx, [ebp-24h]
  '00484AC5: push ecx
  '00484AC6: push edx
  '00484AC7: push 00000004h
  '00484AC9: call [004012CCh]
  '00484ACF: add esp, 00000014h
  '00484AD2: lea ecx, [ebp-40h]
  '00484AD5: call [00401034h]
  '00484ADB: ret 
End Sub
Private Sub DecryptFile_484D00
  '00484D00: push ebp
  '00484D01: mov ebp, esp
  '00484D03: sub esp, 00000014h
  '00484D06: push 00403796h
  '00484D0B: mov eax, fs:[00h]
  '00484D11: push eax
  '00484D12: mov fs:[00000000h], esp
  '00484D19: mov eax, 00000018h
  '00484D1E: call 00403790h
  '00484D23: push ebx
  '00484D24: push esi
  '00484D25: push edi
  '00484D26: mov [ebp-14h], esp
  '00484D29: mov [ebp-10h], 004028B8h
  '00484D30: mov [ebp-0Ch], 00000000h
  '00484D37: mov [ebp-08h], 00000000h
  '00484D3E: push 00000001h
  '00484D40: call [004010E8h]
  '00484D46: lea eax, [ebp-24h]
  '00484D49: push eax
  '00484D4A: call [0040123Ch]
  '00484D50: test eax, eax
  '00484D52: jnz 484D56h
  '00484D54: jmp 484D5Eh
  '00484D56: mov word ptr [ebp-20h], 0000h
  '00484D5C: jmp 484D70h
  '00484D5E: mov ecx, [ebp+0Ch]
  '00484D61: mov edx, [ecx]
  '00484D63: push edx
  '00484D64: call [004012DCh]
  '00484D6A: mov word ptr [ebp-20h], FFFFh
  '00484D70: call [004010D4h]
  '00484D76: push 00484D86h
  '00484D7B: lea eax, [ebp-24h]
  '00484D7E: push eax
  '00484D7F: call [00401158h]
  '00484D85: ret 
End Sub
Private Sub unknown_484DB0
  '00484DB0: push ebp
  '00484DB1: mov ebp, esp
  '00484DB3: sub esp, 0000000Ch
  '00484DB6: push 00403796h
  '00484DBB: mov eax, fs:[00h]
  '00484DC1: push eax
  '00484DC2: mov fs:[00000000h], esp
  '00484DC9: sub esp, 00000030h
  '00484DCC: push ebx
  '00484DCD: push esi
  '00484DCE: push edi
  '00484DCF: mov [ebp-0Ch], esp
  '00484DD2: mov [ebp-08h], 004028E0h
  '00484DD9: mov eax, [ebp+0Ch]
  '00484DDC: mov edi, [ebp+08h]
  '00484DDF: xor esi, esi
  '00484DE1: lea edx, [ebp-34h]
  '00484DE4: mov [eax], esi
  '00484DE6: mov ecx, [edi+40h]
  '00484DE9: push ecx
  '00484DEA: push edx
  '00484DEB: mov [ebp-18h], esi
  '00484DEE: mov [ebp-1Ch], esi
  '00484DF1: mov [ebp-20h], esi
  '00484DF4: mov [ebp-24h], esi
  '00484DF7: mov [ebp-34h], esi
  '00484DFA: call [00401164h]
  '00484E00: lea eax, [ebp-34h]
  '00484E03: push eax
  '00484E04: call [00401048h]
  '00484E0A: mov edx, eax
  '00484E0C: lea ecx, [ebp-1Ch]
  '00484E0F: call [00401348h]
  '00484E15: lea ecx, [ebp-34h]
  '00484E18: call [00401034h]
  '00484E1E: mov ecx, [edi+3Ch]
  '00484E21: lea edx, [ebp-20h]
  '00484E24: push ecx
  '00484E25: push edx
  '00484E26: call [004012F8h]
  '00484E2C: mov ecx, [ebp-20h]
  '00484E2F: cmp ecx, esi
  '00484E31: jz 484E52h
  '00484E33: cmp word ptr [ecx], 0001h
  '00484E37: jnz 484E52h
  '00484E39: mov esi, [ecx+14h]
  '00484E3C: mov eax, [ecx+10h]
  '00484E3F: neg esi
  '00484E41: cmp esi, eax
  '00484E43: jb 484E4Eh
  '00484E45: call [00401170h]
  '00484E4B: mov ecx, [ebp-20h]
  '00484E4E: mov eax, esi
  '00484E50: jmp 484E5Bh
  '00484E52: call [00401170h]
  '00484E58: mov ecx, [ebp-20h]
  '00484E5B: mov ecx, [ecx+0Ch]
  '00484E5E: add ecx, eax
  '00484E60: push ecx
  '00484E61: call [00401280h]
  '00484E67: lea edx, [ebp-20h]
  '00484E6A: mov esi, eax
  '00484E6C: push edx
  '00484E6D: call [00401378h]
  '00484E73: mov eax, [edi+40h]
  '00484E76: mov ecx, [ebp-1Ch]
  '00484E79: push eax
  '00484E7A: push esi
  '00484E7B: lea edx, [ebp-24h]
  '00484E7E: push ecx
  '00484E7F: push edx
  '00484E80: call [0040130Ch]
  '00484E86: push eax
  '00484E87: call 004101ECh
  '00484E8C: call [004010A4h]
  '00484E92: mov eax, [ebp-24h]
  '00484E95: lea ecx, [ebp-1Ch]
  '00484E98: push eax
  '00484E99: push ecx
  '00484E9A: call [00401228h]
  '00484EA0: lea ecx, [ebp-24h]
  '00484EA3: call [0040138Ch]
  '00484EA9: mov edx, [ebp-1Ch]
  '00484EAC: lea ecx, [ebp-18h]
  '00484EAF: call [004012C4h]
  '00484EB5: push 00484EF2h
  '00484EBA: jmp 484EE8h
  '00484EBC: test byte ptr [ebp-04h], 04h
  '00484EC0: jz 484ECBh
  '00484EC2: lea ecx, [ebp-18h]
  '00484EC5: call [0040138Ch]
  '00484ECB: lea edx, [ebp-20h]
  '00484ECE: push edx
  '00484ECF: call [00401378h]
  '00484ED5: lea ecx, [ebp-24h]
  '00484ED8: call [0040138Ch]
  '00484EDE: lea ecx, [ebp-34h]
  '00484EE1: call [00401034h]
  '00484EE7: ret 
End Sub
Private Sub EncryptByte_485960
  '00485960: mov eax, [esp+04h]
  '00485964: push 00000000h
  '00485966: push 00000400h
  '0048596B: push 00000001h
  '0048596D: mov [eax+40h], 00000000h
  '00485974: mov [eax+44h], 00000400h
  '0048597B: add eax, 0000003Ch
  '0048597E: push 00000011h
  '00485980: push eax
  '00485981: push 00000001h
  '00485983: push 00000080h
  '00485988: call [004011E4h]
  '0048598E: add esp, 0000001Ch
  '00485991: xor eax, eax
  '00485993: retn 0004h
End Sub
Private Sub n/a_487390
  '00487390: push ebp
  '00487391: mov ebp, esp
  '00487393: sub esp, 0000000Ch
  '00487396: push 00403796h
  '0048739B: mov eax, fs:[00h]
  '004873A1: push eax
  '004873A2: mov fs:[00000000h], esp
  '004873A9: sub esp, 00000028h
  '004873AC: push ebx
  '004873AD: push esi
  '004873AE: push edi
  '004873AF: mov [ebp-0Ch], esp
  '004873B2: mov [ebp-08h], 00402990h
  '004873B9: mov eax, [ebp+08h]
  '004873BC: mov ecx, eax
  '004873BE: and ecx, 00000001h
  '004873C1: mov [ebp-04h], ecx
  '004873C4: and al, FEh
  '004873C6: push eax
  '004873C7: mov [ebp+08h], eax
  '004873CA: mov edx, [eax]
  '004873CC: call [edx+04h]
  '004873CF: mov [ebp-18h], 00000000h
  '004873D6: movsx ebx, word ptr [ebp-18h]
  '004873DA: xor edi, edi
  '004873DC: cmp ebx, 00000100h
  '004873E2: jb 4873EAh
  '004873E4: call [00401170h]
  '004873EA: movsx esi, di
  '004873ED: cmp esi, 00000100h
  '004873F3: jb 4873FBh
  '004873F5: call [00401170h]
  '004873FB: mov eax, [ebp-18h]
  '004873FE: mov ecx, edi
  '00487400: xor ecx, eax
  '00487402: call [004011F4h]
  '00487408: mov edx, [ebp+08h]
  '0048740B: mov ecx, esi
  '0048740D: shl ecx, 08h
  '00487410: add ecx, [edx+7Ch]
  '00487413: cmp ebx, 00000100h
  '00487419: mov [ecx+ebx], al
  '0048741C: jb 487424h
  '0048741E: call [00401170h]
  '00487424: cmp esi, 00000100h
  '0048742A: jb 487432h
  '0048742C: call [00401170h]
  '00487432: mov ax, di
  '00487435: mov cx, 00FFh
  '00487439: add ax, [ebp-18h]
  '0048743D: jo 4874A8h
  '0048743F: cwd 
  '00487441: idiv cx
  '00487444: mov ecx, edx
  '00487446: call [004011F4h]
  '0048744C: mov edx, [ebp+08h]
  '0048744F: shl esi, 08h
  '00487452: mov ecx, [edx+58h]
  '00487455: add esi, ecx
  '00487457: add di, 0001h
  '0048745B: jo 4874A8h
  '0048745D: cmp di, 00FFh
  '00487462: mov [esi+ebx], al
  '00487465: jle 004873DCh
  '0048746B: mov ax, [ebp-18h]
  '0048746F: add ax, 0001h
  '00487473: jo 4874A8h
  '00487475: cmp ax, 00FFh
  '00487479: mov [ebp-18h], eax
  '0048747C: jle 004873D6h
  '00487482: mov [ebp-04h], 00000000h
  '00487489: mov eax, [ebp+08h]
  '0048748C: push eax
  '0048748D: mov ecx, [eax]
  '0048748F: call [ecx+08h]
  '00487492: mov eax, [ebp-04h]
  '00487495: mov ecx, [ebp-14h]
  '00487498: pop edi
  '00487499: pop esi
  '0048749A: mov fs:[00000000h], ecx
  '004874A1: pop ebx
  '004874A2: mov esp, ebp
  '004874A4: pop ebp
  '004874A5: retn 0004h
End Sub

