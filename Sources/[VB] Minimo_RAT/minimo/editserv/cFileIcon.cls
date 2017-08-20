Private Sub unknown_48B920
  '0048B920: push ebp
  '0048B921: mov ebp, esp
  '0048B923: sub esp, 0000000Ch
  '0048B926: push 00403796h
  '0048B92B: mov eax, fs:[00h]
  '0048B931: push eax
  '0048B932: mov fs:[00000000h], esp
  '0048B939: sub esp, 00000074h
  '0048B93C: push ebx
  '0048B93D: push esi
  '0048B93E: push edi
  '0048B93F: mov [ebp-0Ch], esp
  '0048B942: mov [ebp-08h], 00402A90h
  '0048B949: xor edi, edi
  '0048B94B: mov [ebp-04h], edi
  '0048B94E: mov eax, [ebp+08h]
  '0048B951: push eax
  '0048B952: mov ecx, [eax]
  '0048B954: call [ecx+04h]
  '0048B957: mov ebx, [004012C4h]
  '0048B95D: xor edx, edx
  '0048B95F: mov [ebp-40h], edx
  '0048B962: lea ecx, [ebp-28h]
  '0048B965: mov [ebp-3Ch], dx
  '0048B969: mov edx, [ebp+0Ch]
  '0048B96C: mov [ebp-18h], edi
  '0048B96F: mov [ebp-24h], edi
  '0048B972: mov [ebp-28h], edi
  '0048B975: mov [ebp-38h], edi
  '0048B978: mov [ebp-44h], edi
  '0048B97B: mov [ebp-48h], edi
  '0048B97E: mov [ebp-50h], edi
  '0048B981: mov [ebp-54h], edi
  '0048B984: mov [ebp-64h], edi
  '0048B987: call ebx
  '0048B989: mov eax, [ebp+10h]
  '0048B98C: mov edx, 004213F8h
  '0048B991: lea ecx, [ebp-24h]
  '0048B994: mov [eax], edi
  '0048B996: call ebx
  '0048B998: mov ecx, [ebp-28h]
  '0048B99B: push edi
  '0048B99C: push 00000080h
  '0048B9A1: push 00000003h
  '0048B9A3: push edi
  '0048B9A4: push edi
  '0048B9A5: push 80000000h
  '0048B9AA: lea edx, [ebp-54h]
  '0048B9AD: push ecx
  '0048B9AE: push edx
  '0048B9AF: call [0040130Ch]
  '0048B9B5: push eax
  '0048B9B6: call 00412288h
  '0048B9BB: mov esi, eax
  '0048B9BD: call [004010A4h]
  '0048B9C3: mov eax, [ebp-54h]
  '0048B9C6: lea ecx, [ebp-28h]
  '0048B9C9: push eax
  '0048B9CA: push ecx
  '0048B9CB: call [00401228h]
  '0048B9D1: lea ecx, [ebp-54h]
  '0048B9D4: mov [ebp-20h], esi
  '0048B9D7: call [0040138Ch]
  '0048B9DD: cmp esi, edi
  '0048B9DF: jz 0048BD6Fh
  '0048B9E5: push edi
  '0048B9E6: push esi
  '0048B9E7: call 00412388h
  '0048B9EC: mov esi, [004010A4h]
  '0048B9F2: mov [ebp-68h], eax
  '0048B9F5: call esi
  '0048B9F7: mov ecx, [ebp-20h]
  '0048B9FA: lea edx, [ebp-44h]
  '0048B9FD: push edi
  '0048B9FE: push edx
  '0048B9FF: lea eax, [ebp-40h]
  '0048BA02: push 00000006h
  '0048BA04: push eax
  '0048BA05: push ecx
  '0048BA06: call 004122CCh
  '0048BA0B: call esi
  '0048BA0D: cmp [ebp-44h], 00000006h
  '0048BA11: jnz 0048BD57h
  '0048BA17: cmp [ebp-40h], di
  '0048BA1B: jnz 0048BD57h
  '0048BA21: mov esi, 00000001h
  '0048BA26: cmp [ebp-3Eh], si
  '0048BA2A: jnz 0048BD57h
  '0048BA30: mov ax, [ebp-3Ch]
  '0048BA34: cmp ax, di
  '0048BA37: jle 0048BD57h
  '0048BA3D: cmp ax, 0100h
  '0048BA41: jnle 0048BD57h
  '0048BA47: sub ax, si
  '0048BA4A: push edi
  '0048BA4B: jo 0048BE15h
  '0048BA51: movsx edx, ax
  '0048BA54: push edx
  '0048BA55: push esi
  '0048BA56: lea eax, [ebp-48h]
  '0048BA59: push edi
  '0048BA5A: push eax
  '0048BA5B: push 00000010h
  '0048BA5D: push edi
  '0048BA5E: call [004011E4h]
  '0048BA64: movsx ecx, word ptr [ebp-3Ch]
  '0048BA68: mov ebx, [00401170h]
  '0048BA6E: mov [ebp-80h], ecx
  '0048BA71: mov ecx, [ebp-48h]
  '0048BA74: add esp, 0000001Ch
  '0048BA77: mov [ebp-4Ch], esi
  '0048BA7A: cmp esi, [ebp-80h]
  '0048BA7D: jnle 0048BD5Eh
  '0048BA83: lea edx, [ebp-50h]
  '0048BA86: push ecx
  '0048BA87: push edx
  '0048BA88: call [004012F8h]
  '0048BA8E: mov ecx, [ebp-50h]
  '0048BA91: cmp ecx, edi
  '0048BA93: jz 48BABFh
  '0048BA95: cmp word ptr [ecx], 0001h
  '0048BA99: jnz 48BABFh
  '0048BA9B: mov edx, [ecx+14h]
  '0048BA9E: mov eax, [ecx+10h]
  '0048BAA1: sub esi, 00000001h
  '0048BAA4: jo 0048BE15h
  '0048BAAA: sub esi, edx
  '0048BAAC: cmp esi, eax
  '0048BAAE: jb 48BAB5h
  '0048BAB0: call ebx
  '0048BAB2: mov ecx, [ebp-50h]
  '0048BAB5: shl esi, 04h
  '0048BAB8: mov eax, esi
  '0048BABA: mov esi, [ebp-4Ch]
  '0048BABD: jmp 48BAC4h
  '0048BABF: call ebx
  '0048BAC1: mov ecx, [ebp-50h]
  '0048BAC4: mov ecx, [ecx+0Ch]
  '0048BAC7: lea edx, [ebp-44h]
  '0048BACA: push edi
  '0048BACB: push edx
  '0048BACC: mov edx, [ebp-20h]
  '0048BACF: add ecx, eax
  '0048BAD1: push 00000010h
  '0048BAD3: push ecx
  '0048BAD4: push edx
  '0048BAD5: call 004122CCh
  '0048BADA: call [004010A4h]
  '0048BAE0: lea eax, [ebp-50h]
  '0048BAE3: push eax
  '0048BAE4: call [00401378h]
  '0048BAEA: cmp [ebp-44h], 00000010h
  '0048BAEE: jnz 0048BD42h
  '0048BAF4: mov ecx, [ebp-48h]
  '0048BAF7: cmp ecx, edi
  '0048BAF9: jz 48BB22h
  '0048BAFB: cmp word ptr [ecx], 0001h
  '0048BAFF: jnz 48BB22h
  '0048BB01: mov edx, [ecx+14h]
  '0048BB04: mov eax, [ecx+10h]
  '0048BB07: sub esi, 00000001h
  '0048BB0A: jo 0048BE15h
  '0048BB10: sub esi, edx
  '0048BB12: cmp esi, eax
  '0048BB14: jb 48BB1Bh
  '0048BB16: call ebx
  '0048BB18: mov ecx, [ebp-48h]
  '0048BB1B: shl esi, 04h
  '0048BB1E: mov edi, esi
  '0048BB20: jmp 48BB29h
  '0048BB22: call ebx
  '0048BB24: mov ecx, [ebp-48h]
  '0048BB27: mov edi, eax
  '0048BB29: test ecx, ecx
  '0048BB2B: jz 48BB55h
  '0048BB2D: cmp word ptr [ecx], 0001h
  '0048BB31: jnz 48BB55h
  '0048BB33: mov esi, [ebp-4Ch]
  '0048BB36: mov edx, [ecx+14h]
  '0048BB39: mov eax, [ecx+10h]
  '0048BB3C: sub esi, 00000001h
  '0048BB3F: jo 0048BE15h
  '0048BB45: sub esi, edx
  '0048BB47: cmp esi, eax
  '0048BB49: jb 48BB50h
  '0048BB4B: call ebx
  '0048BB4D: mov ecx, [ebp-48h]
  '0048BB50: shl esi, 04h
  '0048BB53: jmp 48BB5Ch
  '0048BB55: call ebx
  '0048BB57: mov ecx, [ebp-48h]
  '0048BB5A: mov esi, eax
  '0048BB5C: mov edx, [ecx+0Ch]
  '0048BB5F: xor al, al
  '0048BB61: cmp al, [edx+esi]
  '0048BB64: sbb esi, esi
  '0048BB66: inc esi
  '0048BB67: cmp al, [edx+edi+01h]
  '0048BB6B: sbb edx, edx
  '0048BB6D: inc edx
  '0048BB6E: or esi, edx
  '0048BB70: jnz 0048BD15h
  '0048BB76: test ecx, ecx
  '0048BB78: jz 48BBA4h
  '0048BB7A: cmp word ptr [ecx], 0001h
  '0048BB7E: jnz 48BBA4h
  '0048BB80: mov esi, [ebp-4Ch]
  '0048BB83: mov edx, [ecx+14h]
  '0048BB86: mov eax, [ecx+10h]
  '0048BB89: sub esi, 00000001h
  '0048BB8C: jo 0048BE15h
  '0048BB92: sub esi, edx
  '0048BB94: cmp esi, eax
  '0048BB96: jb 48BB9Dh
  '0048BB98: call ebx
  '0048BB9A: mov ecx, [ebp-48h]
  '0048BB9D: shl esi, 04h
  '0048BBA0: mov edi, esi
  '0048BBA2: jmp 48BBABh
  '0048BBA4: call ebx
  '0048BBA6: mov ecx, [ebp-48h]
  '0048BBA9: mov edi, eax
  '0048BBAB: test ecx, ecx
  '0048BBAD: jz 48BBD9h
  '0048BBAF: cmp word ptr [ecx], 0001h
  '0048BBB3: jnz 48BBD9h
  '0048BBB5: mov esi, [ebp-4Ch]
  '0048BBB8: mov edx, [ecx+14h]
  '0048BBBB: mov eax, [ecx+10h]
  '0048BBBE: sub esi, 00000001h
  '0048BBC1: jo 0048BE15h
  '0048BBC7: sub esi, edx
  '0048BBC9: cmp esi, eax
  '0048BBCB: jb 48BBD2h
  '0048BBCD: call ebx
  '0048BBCF: mov ecx, [ebp-48h]
  '0048BBD2: shl esi, 04h
  '0048BBD5: mov eax, esi
  '0048BBD7: jmp 48BBDEh
  '0048BBD9: call ebx
  '0048BBDB: mov ecx, [ebp-48h]
  '0048BBDE: mov edx, [ecx+0Ch]
  '0048BBE1: movzx esi, byte ptr [edx+eax]
  '0048BBE6: xor eax, eax
  '0048BBE8: cmp si, 0100h
  '0048BBED: movzx esi, byte ptr [edx+edi+01h]
  '0048BBF3: setnle al
  '0048BBF6: xor edx, edx
  '0048BBF8: cmp si, 0100h
  '0048BBFD: setnle dl
  '0048BC00: or eax, edx
  '0048BC02: jnz 0048BD0Eh
  '0048BC08: test ecx, ecx
  '0048BC0A: jz 48BC38h
  '0048BC0C: cmp word ptr [ecx], 0001h
  '0048BC10: jnz 48BC38h
  '0048BC12: mov edi, [ebp-4Ch]
  '0048BC15: mov edx, [ecx+14h]
  '0048BC18: mov eax, [ecx+10h]
  '0048BC1B: mov esi, edi
  '0048BC1D: sub esi, 00000001h
  '0048BC20: jo 0048BE15h
  '0048BC26: sub esi, edx
  '0048BC28: cmp esi, eax
  '0048BC2A: jb 48BC31h
  '0048BC2C: call ebx
  '0048BC2E: mov ecx, [ebp-48h]
  '0048BC31: shl esi, 04h
  '0048BC34: mov eax, esi
  '0048BC36: jmp 48BC40h
  '0048BC38: call ebx
  '0048BC3A: mov ecx, [ebp-48h]
  '0048BC3D: mov edi, [ebp-4Ch]
  '0048BC40: mov edx, [ecx+0Ch]
  '0048BC43: cmp [edx+eax+08h], 00000010h
  '0048BC48: jle 0048BD29h
  '0048BC4E: test ecx, ecx
  '0048BC50: jz 48BC7Bh
  '0048BC52: cmp word ptr [ecx], 0001h
  '0048BC56: jnz 48BC7Bh
  '0048BC58: mov edx, [ecx+14h]
  '0048BC5B: mov eax, [ecx+10h]
  '0048BC5E: mov esi, edi
  '0048BC60: sub esi, 00000001h
  '0048BC63: jo 0048BE15h
  '0048BC69: sub esi, edx
  '0048BC6B: cmp esi, eax
  '0048BC6D: jb 48BC74h
  '0048BC6F: call ebx
  '0048BC71: mov ecx, [ebp-48h]
  '0048BC74: shl esi, 04h
  '0048BC77: mov eax, esi
  '0048BC79: jmp 48BC80h
  '0048BC7B: call ebx
  '0048BC7D: mov ecx, [ebp-48h]
  '0048BC80: mov edx, [ecx+0Ch]
  '0048BC83: cmp [edx+eax+0Ch], 00000010h
  '0048BC88: jle 0048BD29h
  '0048BC8E: test ecx, ecx
  '0048BC90: jz 48BCBBh
  '0048BC92: cmp word ptr [ecx], 0001h
  '0048BC96: jnz 48BCBBh
  '0048BC98: mov edx, [ecx+14h]
  '0048BC9B: mov eax, [ecx+10h]
  '0048BC9E: mov esi, edi
  '0048BCA0: sub esi, 00000001h
  '0048BCA3: jo 0048BE15h
  '0048BCA9: sub esi, edx
  '0048BCAB: cmp esi, eax
  '0048BCAD: jb 48BCB4h
  '0048BCAF: call ebx
  '0048BCB1: mov ecx, [ebp-48h]
  '0048BCB4: shl esi, 04h
  '0048BCB7: mov eax, esi
  '0048BCB9: jmp 48BCC0h
  '0048BCBB: call ebx
  '0048BCBD: mov ecx, [ebp-48h]
  '0048BCC0: mov edx, [ecx+0Ch]
  '0048BCC3: mov eax, [edx+eax+08h]
  '0048BCC7: mov edx, [ebp-68h]
  '0048BCCA: cmp eax, edx
  '0048BCCC: jl 48BD29h
  '0048BCCE: test ecx, ecx
  '0048BCD0: jz 48BCFBh
  '0048BCD2: cmp word ptr [ecx], 0001h
  '0048BCD6: jnz 48BCFBh
  '0048BCD8: mov edx, [ecx+14h]
  '0048BCDB: mov eax, [ecx+10h]
  '0048BCDE: mov esi, edi
  '0048BCE0: sub esi, 00000001h
  '0048BCE3: jo 0048BE15h
  '0048BCE9: sub esi, edx
  '0048BCEB: cmp esi, eax
  '0048BCED: jb 48BCF4h
  '0048BCEF: call ebx
  '0048BCF1: mov ecx, [ebp-48h]
  '0048BCF4: shl esi, 04h
  '0048BCF7: mov eax, esi
  '0048BCF9: jmp 48BD00h
  '0048BCFB: call ebx
  '0048BCFD: mov ecx, [ebp-48h]
  '0048BD00: mov edx, [ecx+0Ch]
  '0048BD03: mov esi, [ebp-68h]
  '0048BD06: cmp [edx+eax+0Ch], esi
  '0048BD0A: jnl 48BD49h
  '0048BD0C: jmp 48BD29h
  '0048BD0E: mov edx, 00421674h
  '0048BD13: jmp 48BD1Ah
  '0048BD15: mov edx, 004216CCh
  '0048BD1A: lea ecx, [ebp-24h]
  '0048BD1D: call [004012C4h]
  '0048BD23: mov ecx, [ebp-48h]
  '0048BD26: mov edi, [ebp-4Ch]
  '0048BD29: mov eax, 00000001h
  '0048BD2E: add eax, edi
  '0048BD30: jo 0048BE15h
  '0048BD36: mov [ebp-4Ch], eax
  '0048BD39: xor edi, edi
  '0048BD3B: mov esi, eax
  '0048BD3D: jmp 0048BA7Ah
  '0048BD42: mov edx, 00421214h
  '0048BD47: jmp 48BD4Eh
  '0048BD49: mov edx, 00421600h
  '0048BD4E: lea ecx, [ebp-24h]
  '0048BD51: call [004012C4h]
  '0048BD57: mov [ebp-18h], FFFFFFFFh
  '0048BD5E: mov eax, [ebp-20h]
  '0048BD61: push eax
  '0048BD62: call 00410830h
  '0048BD67: call [004010A4h]
  '0048BD6D: jmp 48BD79h
  '0048BD6F: mov edx, 00421720h
  '0048BD74: lea ecx, [ebp-24h]
  '0048BD77: call ebx
  '0048BD79: mov eax, [ebp-18h]
  '0048BD7C: lea edx, [ebp-64h]
  '0048BD7F: not eax
  '0048BD81: lea ecx, [ebp-38h]
  '0048BD84: mov [ebp-5Ch], ax
  '0048BD88: mov [ebp-64h], 0000000Bh
  '0048BD8F: call [00401024h]
  '0048BD95: push 0048BDDCh
  '0048BD9A: jmp 48BDBFh
  '0048BD9C: test byte ptr [ebp-04h], 04h
  '0048BDA0: jz 48BDABh
  '0048BDA2: lea ecx, [ebp-38h]
  '0048BDA5: call [00401034h]
  '0048BDAB: lea ecx, [ebp-50h]
  '0048BDAE: push ecx
  '0048BDAF: call [00401378h]
  '0048BDB5: lea ecx, [ebp-54h]
  '0048BDB8: call [0040138Ch]
  '0048BDBE: ret 
End Sub
Private Sub unknown_48BE20
  '0048BE20: push ebp
  '0048BE21: mov ebp, esp
  '0048BE23: sub esp, 0000000Ch
  '0048BE26: push 00403796h
  '0048BE2B: mov eax, fs:[00h]
  '0048BE31: push eax
  '0048BE32: mov fs:[00000000h], esp
  '0048BE39: sub esp, 00000008h
  '0048BE3C: push ebx
  '0048BE3D: push esi
  '0048BE3E: push edi
  '0048BE3F: mov [ebp-0Ch], esp
  '0048BE42: mov [ebp-08h], 00402AA0h
  '0048BE49: mov [ebp-04h], 00000000h
  '0048BE50: mov esi, [ebp+08h]
  '0048BE53: push esi
  '0048BE54: mov eax, [esi]
  '0048BE56: call [eax+04h]
  '0048BE59: lea ecx, [esi+54h]
  '0048BE5C: lea edx, [esi+50h]
  '0048BE5F: push ecx
  '0048BE60: push edx
  '0048BE61: mov edx, [ebp+0Ch]
  '0048BE64: lea eax, [esi+48h]
  '0048BE67: lea ecx, [esi+38h]
  '0048BE6A: push eax
  '0048BE6B: mov eax, [edx]
  '0048BE6D: add esi, 00000034h
  '0048BE70: push ecx
  '0048BE71: push esi
  '0048BE72: push eax
  '0048BE73: call 0048BEA0h
  '0048BE78: mov eax, [ebp+08h]
  '0048BE7B: push eax
  '0048BE7C: mov ecx, [eax]
  '0048BE7E: call [ecx+08h]
  '0048BE81: mov eax, [ebp-04h]
  '0048BE84: mov ecx, [ebp-14h]
  '0048BE87: pop edi
  '0048BE88: pop esi
  '0048BE89: mov fs:[00000000h], ecx
  '0048BE90: pop ebx
  '0048BE91: mov esp, ebp
  '0048BE93: pop ebp
  '0048BE94: retn 0008h
End Sub
Private Sub unknown_48C280
  '0048C280: push ebp
  '0048C281: mov ebp, esp
  '0048C283: sub esp, 0000000Ch
  '0048C286: push 00403796h
  '0048C28B: mov eax, fs:[00h]
  '0048C291: push eax
  '0048C292: mov fs:[00000000h], esp
  '0048C299: sub esp, 0000000Ch
  '0048C29C: push ebx
  '0048C29D: push esi
  '0048C29E: push edi
  '0048C29F: mov [ebp-0Ch], esp
  '0048C2A2: mov [ebp-08h], 00402AB8h
  '0048C2A9: xor edi, edi
  '0048C2AB: mov [ebp-04h], edi
  '0048C2AE: mov esi, [ebp+08h]
  '0048C2B1: push esi
  '0048C2B2: mov eax, [esi]
  '0048C2B4: call [eax+04h]
  '0048C2B7: mov ecx, [ebp+0Ch]
  '0048C2BA: mov [ebp-18h], edi
  '0048C2BD: mov [ecx], edi
  '0048C2BF: mov edx, [esi+34h]
  '0048C2C2: lea ecx, [ebp-18h]
  '0048C2C5: call [004012C4h]
  '0048C2CB: push 0048C2DDh
  '0048C2D0: jmp 48C2DCh
  '0048C2D2: lea ecx, [ebp-18h]
  '0048C2D5: call [0040138Ch]
  '0048C2DB: ret 
End Sub
Private Sub unknown_48C310
  '0048C310: push ebp
  '0048C311: mov ebp, esp
  '0048C313: sub esp, 0000000Ch
  '0048C316: push 00403796h
  '0048C31B: mov eax, fs:[00h]
  '0048C321: push eax
  '0048C322: mov fs:[00000000h], esp
  '0048C329: sub esp, 00000018h
  '0048C32C: push ebx
  '0048C32D: push esi
  '0048C32E: push edi
  '0048C32F: mov [ebp-0Ch], esp
  '0048C332: mov [ebp-08h], 00402AC8h
  '0048C339: xor edi, edi
  '0048C33B: mov [ebp-04h], edi
  '0048C33E: mov esi, [ebp+08h]
  '0048C341: push esi
  '0048C342: mov eax, [esi]
  '0048C344: call [eax+04h]
  '0048C347: mov ecx, [ebp+0Ch]
  '0048C34A: lea edx, [esi+38h]
  '0048C34D: mov [ebp-24h], edi
  '0048C350: mov [ecx], edi
  '0048C352: lea ecx, [ebp-24h]
  '0048C355: call [00401324h]
  '0048C35B: push 0048C36Dh
  '0048C360: jmp 48C36Ch
  '0048C362: lea ecx, [ebp-24h]
  '0048C365: call [00401034h]
  '0048C36B: ret 
End Sub
Private Sub unknown_48C540
  '0048C540: push ebp
  '0048C541: mov ebp, esp
  '0048C543: sub esp, 0000000Ch
  '0048C546: push 00403796h
  '0048C54B: mov eax, fs:[00h]
  '0048C551: push eax
  '0048C552: mov fs:[00000000h], esp
  '0048C559: sub esp, 0000001Ch
  '0048C55C: push ebx
  '0048C55D: push esi
  '0048C55E: push edi
  '0048C55F: mov [ebp-0Ch], esp
  '0048C562: mov [ebp-08h], 00402AE8h
  '0048C569: xor edi, edi
  '0048C56B: mov [ebp-04h], edi
  '0048C56E: mov esi, [ebp+08h]
  '0048C571: push esi
  '0048C572: mov eax, [esi]
  '0048C574: call [eax+04h]
  '0048C577: mov ecx, [ebp+14h]
  '0048C57A: lea eax, [ebp-24h]
  '0048C57D: push eax
  '0048C57E: mov eax, [ebp+0Ch]
  '0048C581: mov [ecx], edi
  '0048C583: mov ecx, [ebp+10h]
  '0048C586: mov edx, [esi]
  '0048C588: push ecx
  '0048C589: push eax
  '0048C58A: push esi
  '0048C58B: mov [ebp-18h], edi
  '0048C58E: mov [ebp-20h], edi
  '0048C591: mov [ebp-24h], edi
  '0048C594: call [edx+30h]
  '0048C597: cmp eax, edi
  '0048C599: jnl 48C5AAh
  '0048C59B: push 00000030h
  '0048C59D: push 00411F08h
  '0048C5A2: push esi
  '0048C5A3: push eax
  '0048C5A4: call [004010A8h]
  '0048C5AA: mov eax, [ebp-24h]
  '0048C5AD: cmp eax, edi
  '0048C5AF: jz 48C5DFh
  '0048C5B1: mov ecx, [esi]
  '0048C5B3: lea edx, [ebp-20h]
  '0048C5B6: push edx
  '0048C5B7: push eax
  '0048C5B8: push esi
  '0048C5B9: call [ecx+70h]
  '0048C5BC: mov eax, [ebp-20h]
  '0048C5BF: push 00412CE8h
  '0048C5C4: push eax
  '0048C5C5: call [00401340h]
  '0048C5CB: lea ecx, [ebp-18h]
  '0048C5CE: push eax
  '0048C5CF: push ecx
  '0048C5D0: call [004010F0h]
  '0048C5D6: lea ecx, [ebp-20h]
  '0048C5D9: call [00401388h]
  '0048C5DF: push 0048C600h
  '0048C5E4: jmp 48C5FFh
  '0048C5E6: test byte ptr [ebp-04h], 04h
  '0048C5EA: jz 48C5F5h
  '0048C5EC: lea ecx, [ebp-18h]
  '0048C5EF: call [00401388h]
  '0048C5F5: lea ecx, [ebp-20h]
  '0048C5F8: call [00401388h]
  '0048C5FE: ret 
End Sub
Private Sub unknown_48C630
  '0048C630: push ebp
  '0048C631: mov ebp, esp
  '0048C633: sub esp, 0000000Ch
  '0048C636: push 00403796h
  '0048C63B: mov eax, fs:[00h]
  '0048C641: push eax
  '0048C642: mov fs:[00000000h], esp
  '0048C649: sub esp, 0000002Ch
  '0048C64C: push ebx
  '0048C64D: push esi
  '0048C64E: push edi
  '0048C64F: mov [ebp-0Ch], esp
  '0048C652: mov [ebp-08h], 00402AF8h
  '0048C659: xor edi, edi
  '0048C65B: mov [ebp-04h], edi
  '0048C65E: mov esi, [ebp+08h]
  '0048C661: push esi
  '0048C662: mov eax, [esi]
  '0048C664: call [eax+04h]
  '0048C667: lea eax, [ebp-38h]
  '0048C66A: mov ebx, [ebp+0Ch]
  '0048C66D: push eax
  '0048C66E: push FFFFFFFFh
  '0048C670: push edi
  '0048C671: push edi
  '0048C672: xor ecx, ecx
  '0048C674: mov edx, [esi]
  '0048C676: push edi
  '0048C677: push edi
  '0048C678: mov [ebp-28h], ecx
  '0048C67B: push edi
  '0048C67C: push edi
  '0048C67D: mov [ebp-24h], ecx
  '0048C680: mov [ebp-34h], edi
  '0048C683: mov [ebp-38h], edi
  '0048C686: push edi
  '0048C687: mov edi, [ebp+10h]
  '0048C68A: mov [ebp-20h], ecx
  '0048C68D: push edi
  '0048C68E: mov [ebp-1Ch], ecx
  '0048C691: push ebx
  '0048C692: push esi
  '0048C693: mov [ebp-18h], ecx
  '0048C696: mov [ebp-28h], 00000001h
  '0048C69D: call [edx+74h]
  '0048C6A0: lea eax, [ebp-38h]
  '0048C6A3: mov ecx, [ebp-38h]
  '0048C6A6: push eax
  '0048C6A7: push FFFFFFFFh
  '0048C6A9: mov edx, [esi]
  '0048C6AB: push 00000000h
  '0048C6AD: push 00000000h
  '0048C6AF: push 00000000h
  '0048C6B1: push 00000000h
  '0048C6B3: push 00000000h
  '0048C6B5: push 00000000h
  '0048C6B7: push 00000001h
  '0048C6B9: push edi
  '0048C6BA: push ebx
  '0048C6BB: push esi
  '0048C6BC: mov [ebp-18h], ecx
  '0048C6BF: call [edx+74h]
  '0048C6C2: mov ecx, [ebp-38h]
  '0048C6C5: lea edx, [ebp-28h]
  '0048C6C8: push edx
  '0048C6C9: mov [ebp-1Ch], ecx
  '0048C6CC: call 00412B38h
  '0048C6D1: mov esi, [004010A4h]
  '0048C6D7: mov [ebp-38h], eax
  '0048C6DA: call esi
  '0048C6DC: mov ecx, [ebp-18h]
  '0048C6DF: mov eax, [ebp-38h]
  '0048C6E2: push ecx
  '0048C6E3: mov [ebp-34h], eax
  '0048C6E6: call 0041297Ch
  '0048C6EB: call esi
  '0048C6ED: mov edx, [ebp-1Ch]
  '0048C6F0: push edx
  '0048C6F1: call 0041297Ch
  '0048C6F6: call esi
  '0048C6F8: mov eax, [ebp+08h]
  '0048C6FB: push eax
  '0048C6FC: mov ecx, [eax]
  '0048C6FE: call [ecx+08h]
  '0048C701: mov edx, [ebp+14h]
  '0048C704: mov eax, [ebp-34h]
  '0048C707: mov [edx], eax
  '0048C709: mov eax, [ebp-04h]
  '0048C70C: mov ecx, [ebp-14h]
  '0048C70F: pop edi
  '0048C710: pop esi
  '0048C711: mov fs:[00000000h], ecx
  '0048C718: pop ebx
  '0048C719: mov esp, ebp
  '0048C71B: pop ebp
  '0048C71C: retn 0010h
End Sub
Private Sub unknown_48C720
  '0048C720: push ebp
  '0048C721: mov ebp, esp
  '0048C723: sub esp, 0000000Ch
  '0048C726: push 00403796h
  '0048C72B: mov eax, fs:[00h]
  '0048C731: push eax
  '0048C732: mov fs:[00000000h], esp
  '0048C739: sub esp, 0000000Ch
  '0048C73C: push ebx
  '0048C73D: push esi
  '0048C73E: push edi
  '0048C73F: mov [ebp-0Ch], esp
  '0048C742: mov [ebp-08h], 00402B00h
  '0048C749: xor edi, edi
  '0048C74B: mov [ebp-04h], edi
  '0048C74E: mov esi, [ebp+08h]
  '0048C751: push esi
  '0048C752: mov eax, [esi]
  '0048C754: call [eax+04h]
  '0048C757: movsx ecx, word ptr [esi+4Ch]
  '0048C75B: mov [ebp-18h], edi
  '0048C75E: mov [ebp-18h], ecx
  '0048C761: mov eax, [ebp+08h]
  '0048C764: push eax
  '0048C765: mov edx, [eax]
  '0048C767: call [edx+08h]
  '0048C76A: mov eax, [ebp+0Ch]
  '0048C76D: mov ecx, [ebp-18h]
  '0048C770: mov [eax], ecx
  '0048C772: mov eax, [ebp-04h]
  '0048C775: mov ecx, [ebp-14h]
  '0048C778: pop edi
  '0048C779: pop esi
  '0048C77A: mov fs:[00000000h], ecx
  '0048C781: pop ebx
  '0048C782: mov esp, ebp
  '0048C784: pop ebp
  '0048C785: retn 0008h
End Sub
Private Sub unknown_48C790
  '0048C790: push ebp
  '0048C791: mov ebp, esp
  '0048C793: sub esp, 0000000Ch
  '0048C796: push 00403796h
  '0048C79B: mov eax, fs:[00h]
  '0048C7A1: push eax
  '0048C7A2: mov fs:[00000000h], esp
  '0048C7A9: sub esp, 00000010h
  '0048C7AC: push ebx
  '0048C7AD: push esi
  '0048C7AE: push edi
  '0048C7AF: mov [ebp-0Ch], esp
  '0048C7B2: mov [ebp-08h], 00402B08h
  '0048C7B9: xor esi, esi
  '0048C7BB: mov [ebp-04h], esi
  '0048C7BE: mov edi, [ebp+08h]
  '0048C7C1: push edi
  '0048C7C2: mov eax, [edi]
  '0048C7C4: call [eax+04h]
  '0048C7C7: mov eax, [edi+50h]
  '0048C7CA: mov [ebp-18h], esi
  '0048C7CD: cmp eax, esi
  '0048C7CF: jz 48C7F8h
  '0048C7D1: cmp word ptr [eax], 0001h
  '0048C7D5: jnz 48C7F8h
  '0048C7D7: mov esi, [ebp+0Ch]
  '0048C7DA: mov edx, [eax+14h]
  '0048C7DD: mov ecx, [eax+10h]
  '0048C7E0: sub esi, 00000001h
  '0048C7E3: jo 48C833h
  '0048C7E5: sub esi, edx
  '0048C7E7: cmp esi, ecx
  '0048C7E9: jb 48C7F1h
  '0048C7EB: call [00401170h]
  '0048C7F1: shl esi, 04h
  '0048C7F4: mov eax, esi
  '0048C7F6: jmp 48C7FEh
  '0048C7F8: call [00401170h]
  '0048C7FE: mov ecx, [edi+50h]
  '0048C801: mov edx, [ecx+0Ch]
  '0048C804: xor ecx, ecx
  '0048C806: mov cl, [edx+eax]
  '0048C809: mov [ebp-18h], ecx
  '0048C80C: mov eax, [ebp+08h]
  '0048C80F: push eax
  '0048C810: mov edx, [eax]
  '0048C812: call [edx+08h]
  '0048C815: mov eax, [ebp+10h]
  '0048C818: mov ecx, [ebp-18h]
  '0048C81B: mov [eax], ecx
  '0048C81D: mov eax, [ebp-04h]
  '0048C820: mov ecx, [ebp-14h]
  '0048C823: pop edi
  '0048C824: pop esi
  '0048C825: mov fs:[00000000h], ecx
  '0048C82C: pop ebx
  '0048C82D: mov esp, ebp
  '0048C82F: pop ebp
  '0048C830: retn 000Ch
End Sub
Private Sub unknown_48C840
  '0048C840: push ebp
  '0048C841: mov ebp, esp
  '0048C843: sub esp, 0000000Ch
  '0048C846: push 00403796h
  '0048C84B: mov eax, fs:[00h]
  '0048C851: push eax
  '0048C852: mov fs:[00000000h], esp
  '0048C859: sub esp, 00000010h
  '0048C85C: push ebx
  '0048C85D: push esi
  '0048C85E: push edi
  '0048C85F: mov [ebp-0Ch], esp
  '0048C862: mov [ebp-08h], 00402B10h
  '0048C869: xor esi, esi
  '0048C86B: mov [ebp-04h], esi
  '0048C86E: mov edi, [ebp+08h]
  '0048C871: push edi
  '0048C872: mov eax, [edi]
  '0048C874: call [eax+04h]
  '0048C877: mov eax, [edi+50h]
  '0048C87A: mov [ebp-18h], esi
  '0048C87D: cmp eax, esi
  '0048C87F: jz 48C8A8h
  '0048C881: cmp word ptr [eax], 0001h
  '0048C885: jnz 48C8A8h
  '0048C887: mov esi, [ebp+0Ch]
  '0048C88A: mov edx, [eax+14h]
  '0048C88D: mov ecx, [eax+10h]
  '0048C890: sub esi, 00000001h
  '0048C893: jo 48C8E4h
  '0048C895: sub esi, edx
  '0048C897: cmp esi, ecx
  '0048C899: jb 48C8A1h
  '0048C89B: call [00401170h]
  '0048C8A1: shl esi, 04h
  '0048C8A4: mov eax, esi
  '0048C8A6: jmp 48C8AEh
  '0048C8A8: call [00401170h]
  '0048C8AE: mov ecx, [edi+50h]
  '0048C8B1: mov edx, [ecx+0Ch]
  '0048C8B4: xor ecx, ecx
  '0048C8B6: mov cl, [edx+eax+01h]
  '0048C8BA: mov [ebp-18h], ecx
  '0048C8BD: mov eax, [ebp+08h]
  '0048C8C0: push eax
  '0048C8C1: mov edx, [eax]
  '0048C8C3: call [edx+08h]
  '0048C8C6: mov eax, [ebp+10h]
  '0048C8C9: mov ecx, [ebp-18h]
  '0048C8CC: mov [eax], ecx
  '0048C8CE: mov eax, [ebp-04h]
  '0048C8D1: mov ecx, [ebp-14h]
  '0048C8D4: pop edi
  '0048C8D5: pop esi
  '0048C8D6: mov fs:[00000000h], ecx
  '0048C8DD: pop ebx
  '0048C8DE: mov esp, ebp
  '0048C8E0: pop ebp
  '0048C8E1: retn 000Ch
End Sub
Private Sub unknown_48C8F0
  '0048C8F0: push ebp
  '0048C8F1: mov ebp, esp
  '0048C8F3: sub esp, 0000000Ch
  '0048C8F6: push 00403796h
  '0048C8FB: mov eax, fs:[00h]
  '0048C901: push eax
  '0048C902: mov fs:[00000000h], esp
  '0048C909: sub esp, 00000050h
  '0048C90C: push ebx
  '0048C90D: push esi
  '0048C90E: push edi
  '0048C90F: mov [ebp-0Ch], esp
  '0048C912: mov [ebp-08h], 00402B18h
  '0048C919: xor ebx, ebx
  '0048C91B: mov [ebp-04h], ebx
  '0048C91E: mov esi, [ebp+08h]
  '0048C921: push esi
  '0048C922: mov eax, [esi]
  '0048C924: call [eax+04h]
  '0048C927: mov ecx, 0000000Ah
  '0048C92C: xor eax, eax
  '0048C92E: lea edi, [ebp-3Ch]
  '0048C931: lea edx, [ebp-48h]
  '0048C934: rep stosd 
  '0048C936: mov ecx, [esi+54h]
  '0048C939: mov [ebp-40h], ebx
  '0048C93C: mov [ebp-44h], ebx
  '0048C93F: mov [ebp-48h], ebx
  '0048C942: mov ebx, [004012F8h]
  '0048C948: push ecx
  '0048C949: push edx
  '0048C94A: call ebx
  '0048C94C: mov ecx, [ebp-48h]
  '0048C94F: test ecx, ecx
  '0048C951: jz 48C985h
  '0048C953: cmp word ptr [ecx], 0001h
  '0048C957: jnz 48C985h
  '0048C959: mov esi, [ebp+0Ch]
  '0048C95C: mov edx, [ecx+14h]
  '0048C95F: mov eax, [ecx+10h]
  '0048C962: mov edi, [00401170h]
  '0048C968: sub esi, 00000001h
  '0048C96B: jo 0048CA5Bh
  '0048C971: sub esi, edx
  '0048C973: cmp esi, eax
  '0048C975: jb 48C97Ch
  '0048C977: call edi
  '0048C979: mov ecx, [ebp-48h]
  '0048C97C: lea eax, [esi*4]
  '0048C983: jmp 48C990h
  '0048C985: mov edi, [00401170h]
  '0048C98B: call edi
  '0048C98D: mov ecx, [ebp-48h]
  '0048C990: mov ecx, [ecx+0Ch]
  '0048C993: mov edx, [ecx+eax]
  '0048C996: lea eax, [ebp-44h]
  '0048C999: push edx
  '0048C99A: push eax
  '0048C99B: call ebx
  '0048C99D: mov ecx, [ebp-44h]
  '0048C9A0: test ecx, ecx
  '0048C9A2: jz 48C9BFh
  '0048C9A4: cmp word ptr [ecx], 0001h
  '0048C9A8: jnz 48C9BFh
  '0048C9AA: mov esi, [ecx+14h]
  '0048C9AD: mov eax, [ecx+10h]
  '0048C9B0: neg esi
  '0048C9B2: cmp esi, eax
  '0048C9B4: jb 48C9BBh
  '0048C9B6: call edi
  '0048C9B8: mov ecx, [ebp-44h]
  '0048C9BB: mov eax, esi
  '0048C9BD: jmp 48C9C4h
  '0048C9BF: call edi
  '0048C9C1: mov ecx, [ebp-44h]
  '0048C9C4: mov ecx, [ecx+0Ch]
  '0048C9C7: push 00000028h
  '0048C9C9: add ecx, eax
  '0048C9CB: lea edx, [ebp-3Ch]
  '0048C9CE: push ecx
  '0048C9CF: push edx
  '0048C9D0: call 004101ECh
  '0048C9D5: call [004010A4h]
  '0048C9DB: mov esi, [00401378h]
  '0048C9E1: lea eax, [ebp-44h]
  '0048C9E4: push eax
  '0048C9E5: call esi
  '0048C9E7: lea ecx, [ebp-48h]
  '0048C9EA: push ecx
  '0048C9EB: call esi
  '0048C9ED: movsx edx, word ptr [ebp-2Eh]
  '0048C9F1: mov [ebp-5Ch], edx
  '0048C9F4: fild dword ptr [ebp-5Ch]
  '0048C9F7: fstp real8 ptr [ebp-64h]
  '0048C9FA: mov eax, [ebp-60h]
  '0048C9FD: mov ecx, [ebp-64h]
  '0048CA00: push eax
  '0048CA01: push ecx
  '0048CA02: push 40000000h
  '0048CA07: push 00000000h
  '0048CA09: call [004012D4h]
  '0048CA0F: call [00401320h]
  '0048CA15: mov [ebp-40h], eax
  '0048CA18: wait 
  '0048CA19: push 0048CA34h
  '0048CA1E: jmp 48CA33h
  '0048CA20: mov esi, [00401378h]
  '0048CA26: lea edx, [ebp-44h]
  '0048CA29: push edx
  '0048CA2A: call esi
  '0048CA2C: lea eax, [ebp-48h]
  '0048CA2F: push eax
  '0048CA30: call esi
  '0048CA32: ret 
End Sub
Private Sub unknown_48CA70
  '0048CA70: push ebp
  '0048CA71: mov ebp, esp
  '0048CA73: sub esp, 0000000Ch
  '0048CA76: push 00403796h
  '0048CA7B: mov eax, fs:[00h]
  '0048CA81: push eax
  '0048CA82: mov fs:[00000000h], esp
  '0048CA89: sub esp, 00000010h
  '0048CA8C: push ebx
  '0048CA8D: push esi
  '0048CA8E: push edi
  '0048CA8F: mov [ebp-0Ch], esp
  '0048CA92: mov [ebp-08h], 00402B28h
  '0048CA99: xor esi, esi
  '0048CA9B: mov [ebp-04h], esi
  '0048CA9E: mov edi, [ebp+08h]
  '0048CAA1: push edi
  '0048CAA2: mov eax, [edi]
  '0048CAA4: call [eax+04h]
  '0048CAA7: mov eax, [edi+50h]
  '0048CAAA: mov [ebp-18h], esi
  '0048CAAD: cmp eax, esi
  '0048CAAF: jz 48CAD8h
  '0048CAB1: cmp word ptr [eax], 0001h
  '0048CAB5: jnz 48CAD8h
  '0048CAB7: mov esi, [ebp+0Ch]
  '0048CABA: mov edx, [eax+14h]
  '0048CABD: mov ecx, [eax+10h]
  '0048CAC0: sub esi, 00000001h
  '0048CAC3: jo 48CB12h
  '0048CAC5: sub esi, edx
  '0048CAC7: cmp esi, ecx
  '0048CAC9: jb 48CAD1h
  '0048CACB: call [00401170h]
  '0048CAD1: shl esi, 04h
  '0048CAD4: mov eax, esi
  '0048CAD6: jmp 48CADEh
  '0048CAD8: call [00401170h]
  '0048CADE: mov ecx, [edi+50h]
  '0048CAE1: mov edx, [ecx+0Ch]
  '0048CAE4: mov eax, [edx+eax+08h]
  '0048CAE8: mov [ebp-18h], eax
  '0048CAEB: mov eax, [ebp+08h]
  '0048CAEE: push eax
  '0048CAEF: mov ecx, [eax]
  '0048CAF1: call [ecx+08h]
  '0048CAF4: mov edx, [ebp+10h]
  '0048CAF7: mov eax, [ebp-18h]
  '0048CAFA: mov [edx], eax
  '0048CAFC: mov eax, [ebp-04h]
  '0048CAFF: mov ecx, [ebp-14h]
  '0048CB02: pop edi
  '0048CB03: pop esi
  '0048CB04: mov fs:[00000000h], ecx
  '0048CB0B: pop ebx
  '0048CB0C: mov esp, ebp
  '0048CB0E: pop ebp
  '0048CB0F: retn 000Ch
End Sub
Private Sub unknown_48CB20
  '0048CB20: push ebp
  '0048CB21: mov ebp, esp
  '0048CB23: sub esp, 0000000Ch
  '0048CB26: push 00403796h
  '0048CB2B: mov eax, fs:[00h]
  '0048CB31: push eax
  '0048CB32: mov fs:[00000000h], esp
  '0048CB39: sub esp, 00000060h
  '0048CB3C: push ebx
  '0048CB3D: push esi
  '0048CB3E: push edi
  '0048CB3F: mov [ebp-0Ch], esp
  '0048CB42: mov [ebp-08h], 00402B30h
  '0048CB49: xor edi, edi
  '0048CB4B: mov [ebp-04h], edi
  '0048CB4E: mov esi, [ebp+08h]
  '0048CB51: push esi
  '0048CB52: mov eax, [esi]
  '0048CB54: call [eax+04h]
  '0048CB57: mov ax, [esi+4Ch]
  '0048CB5B: xor ecx, ecx
  '0048CB5D: mov [ebp-34h], ecx
  '0048CB60: cmp ax, 0001h
  '0048CB64: mov [ebp-30h], ecx
  '0048CB67: mov [ebp-1Ch], edi
  '0048CB6A: mov [ebp-2Ch], ecx
  '0048CB6D: mov [ebp-20h], edi
  '0048CB70: mov [ebp-24h], edi
  '0048CB73: mov [ebp-28h], ecx
  '0048CB76: mov [ebp-38h], edi
  '0048CB79: mov [ebp-3Ch], edi
  '0048CB7C: mov [ebp-40h], edi
  '0048CB7F: mov [ebp-44h], edi
  '0048CB82: jle 0048D00Eh
  '0048CB88: sub ax, 0001h
  '0048CB8C: jo 0048D07Ah
  '0048CB92: movsx edx, ax
  '0048CB95: xor ebx, ebx
  '0048CB97: mov [ebp-5Ch], edx
  '0048CB9A: mov [ebp-18h], ebx
  '0048CB9D: cmp ebx, [ebp-5Ch]
  '0048CBA0: jnle 0048CEFCh
  '0048CBA6: mov eax, [ebp+0Ch]
  '0048CBA9: mov ecx, ebx
  '0048CBAB: add ecx, 00000001h
  '0048CBAE: jo 0048D07Ah
  '0048CBB4: cmp eax, ecx
  '0048CBB6: jnz 48CC11h
  '0048CBB8: mov eax, [esi+50h]
  '0048CBBB: mov [ebp-20h], FFFFFFFFh
  '0048CBC2: cmp eax, edi
  '0048CBC4: jz 48CBF9h
  '0048CBC6: cmp word ptr [eax], 0001h
  '0048CBCA: jnz 48CBF9h
  '0048CBCC: mov edx, [eax+14h]
  '0048CBCF: mov ecx, [eax+10h]
  '0048CBD2: mov edi, ebx
  '0048CBD4: sub edi, edx
  '0048CBD6: cmp edi, ecx
  '0048CBD8: jb 48CBE0h
  '0048CBDA: call [00401170h]
  '0048CBE0: mov edx, [esi+50h]
  '0048CBE3: shl edi, 04h
  '0048CBE6: mov ecx, [edx+0Ch]
  '0048CBE9: mov eax, edi
  '0048CBEB: xor edi, edi
  '0048CBED: mov edx, [ecx+eax+08h]
  '0048CBF1: mov [ebp-24h], edx
  '0048CBF4: jmp 0048CEE5h
  '0048CBF9: call [00401170h]
  '0048CBFF: mov edx, [esi+50h]
  '0048CC02: mov ecx, [edx+0Ch]
  '0048CC05: mov edx, [ecx+eax+08h]
  '0048CC09: mov [ebp-24h], edx
  '0048CC0C: jmp 0048CEE5h
  '0048CC11: mov ecx, ebx
  '0048CC13: add ecx, 00000001h
  '0048CC16: jo 0048D07Ah
  '0048CC1C: cmp ecx, eax
  '0048CC1E: jl 0048CEE5h
  '0048CC24: mov eax, [esi+50h]
  '0048CC27: cmp eax, edi
  '0048CC29: jz 48CC4Ch
  '0048CC2B: cmp word ptr [eax], 0001h
  '0048CC2F: jnz 48CC4Ch
  '0048CC31: mov edx, [eax+14h]
  '0048CC34: mov ecx, [eax+10h]
  '0048CC37: mov edi, ebx
  '0048CC39: sub edi, edx
  '0048CC3B: cmp edi, ecx
  '0048CC3D: jb 48CC45h
  '0048CC3F: call [00401170h]
  '0048CC45: shl edi, 04h
  '0048CC48: mov eax, edi
  '0048CC4A: jmp 48CC52h
  '0048CC4C: call [00401170h]
  '0048CC52: mov edx, [esi+50h]
  '0048CC55: mov ebx, [00401088h]
  '0048CC5B: mov ecx, [edx+0Ch]
  '0048CC5E: lea edx, [ebp-34h]
  '0048CC61: add ecx, eax
  '0048CC63: push ecx
  '0048CC64: push edx
  '0048CC65: push 00000010h
  '0048CC67: call ebx
  '0048CC69: mov eax, [esi+50h]
  '0048CC6C: test eax, eax
  '0048CC6E: jz 48CC9Bh
  '0048CC70: cmp word ptr [eax], 0001h
  '0048CC74: jnz 48CC9Bh
  '0048CC76: mov edi, [ebp-18h]
  '0048CC79: mov edx, [eax+14h]
  '0048CC7C: mov ecx, [eax+10h]
  '0048CC7F: sub edi, 00000001h
  '0048CC82: jo 0048D07Ah
  '0048CC88: sub edi, edx
  '0048CC8A: cmp edi, ecx
  '0048CC8C: jb 48CC94h
  '0048CC8E: call [00401170h]
  '0048CC94: shl edi, 04h
  '0048CC97: mov eax, edi
  '0048CC99: jmp 48CCA1h
  '0048CC9B: call [00401170h]
  '0048CCA1: mov edx, [esi+50h]
  '0048CCA4: lea ecx, [ebp-34h]
  '0048CCA7: push ecx
  '0048CCA8: mov ecx, [edx+0Ch]
  '0048CCAB: add ecx, eax
  '0048CCAD: push ecx
  '0048CCAE: push 00000010h
  '0048CCB0: call ebx
  '0048CCB2: mov eax, [esi+54h]
  '0048CCB5: test eax, eax
  '0048CCB7: jz 48CCE6h
  '0048CCB9: cmp word ptr [eax], 0001h
  '0048CCBD: jnz 48CCE6h
  '0048CCBF: mov edi, [ebp-18h]
  '0048CCC2: mov edx, [eax+14h]
  '0048CCC5: mov ecx, [eax+10h]
  '0048CCC8: sub edi, 00000001h
  '0048CCCB: jo 0048D07Ah
  '0048CCD1: sub edi, edx
  '0048CCD3: cmp edi, ecx
  '0048CCD5: jb 48CCDDh
  '0048CCD7: call [00401170h]
  '0048CCDD: lea eax, [edi*4]
  '0048CCE4: jmp 48CCECh
  '0048CCE6: call [00401170h]
  '0048CCEC: mov edx, [ebp-2Ch]
  '0048CCEF: mov ecx, [esi+54h]
  '0048CCF2: sub edx, 00000001h
  '0048CCF5: push 00000000h
  '0048CCF7: jo 0048D07Ah
  '0048CCFD: push edx
  '0048CCFE: mov edx, [ecx+0Ch]
  '0048CD01: push 00000001h
  '0048CD03: add edx, eax
  '0048CD05: push 00000011h
  '0048CD07: push edx
  '0048CD08: push 00000001h
  '0048CD0A: push 00000080h
  '0048CD0F: call [004011BCh]
  '0048CD15: mov eax, [esi+54h]
  '0048CD18: mov ebx, [004012F8h]
  '0048CD1E: add esp, 0000001Ch
  '0048CD21: lea ecx, [ebp-44h]
  '0048CD24: push eax
  '0048CD25: push ecx
  '0048CD26: call ebx
  '0048CD28: mov ecx, [ebp-44h]
  '0048CD2B: test ecx, ecx
  '0048CD2D: jz 48CD56h
  '0048CD2F: cmp word ptr [ecx], 0001h
  '0048CD33: jnz 48CD56h
  '0048CD35: mov edi, [ebp-18h]
  '0048CD38: mov edx, [ecx+14h]
  '0048CD3B: mov eax, [ecx+10h]
  '0048CD3E: sub edi, edx
  '0048CD40: cmp edi, eax
  '0048CD42: jb 48CD4Dh
  '0048CD44: call [00401170h]
  '0048CD4A: mov ecx, [ebp-44h]
  '0048CD4D: lea eax, [edi*4]
  '0048CD54: jmp 48CD5Fh
  '0048CD56: call [00401170h]
  '0048CD5C: mov ecx, [ebp-44h]
  '0048CD5F: mov edx, [ecx+0Ch]
  '0048CD62: lea ecx, [ebp-40h]
  '0048CD65: mov eax, [edx+eax]
  '0048CD68: push eax
  '0048CD69: push ecx
  '0048CD6A: call ebx
  '0048CD6C: mov eax, [ebp-40h]
  '0048CD6F: test eax, eax
  '0048CD71: jz 48CD90h
  '0048CD73: cmp word ptr [eax], 0001h
  '0048CD77: jnz 48CD90h
  '0048CD79: mov edi, [eax+14h]
  '0048CD7C: mov ecx, [eax+10h]
  '0048CD7F: neg edi
  '0048CD81: cmp edi, ecx
  '0048CD83: jb 48CD8Bh
  '0048CD85: call [00401170h]
  '0048CD8B: mov [ebp-70h], edi
  '0048CD8E: jmp 48CD99h
  '0048CD90: call [00401170h]
  '0048CD96: mov [ebp-70h], eax
  '0048CD99: mov edx, [esi+54h]
  '0048CD9C: lea eax, [ebp-3Ch]
  '0048CD9F: push edx
  '0048CDA0: push eax
  '0048CDA1: call ebx
  '0048CDA3: mov ecx, [ebp-3Ch]
  '0048CDA6: test ecx, ecx
  '0048CDA8: jz 48CDDAh
  '0048CDAA: cmp word ptr [ecx], 0001h
  '0048CDAE: jnz 48CDDAh
  '0048CDB0: mov edi, [ebp-18h]
  '0048CDB3: mov edx, [ecx+14h]
  '0048CDB6: mov eax, [ecx+10h]
  '0048CDB9: sub edi, 00000001h
  '0048CDBC: jo 0048D07Ah
  '0048CDC2: sub edi, edx
  '0048CDC4: cmp edi, eax
  '0048CDC6: jb 48CDD1h
  '0048CDC8: call [00401170h]
  '0048CDCE: mov ecx, [ebp-3Ch]
  '0048CDD1: lea eax, [edi*4]
  '0048CDD8: jmp 48CDE3h
  '0048CDDA: call [00401170h]
  '0048CDE0: mov ecx, [ebp-3Ch]
  '0048CDE3: mov ecx, [ecx+0Ch]
  '0048CDE6: mov edx, [ecx+eax]
  '0048CDE9: lea eax, [ebp-38h]
  '0048CDEC: push edx
  '0048CDED: push eax
  '0048CDEE: call ebx
  '0048CDF0: mov ecx, [ebp-38h]
  '0048CDF3: test ecx, ecx
  '0048CDF5: jz 48CE16h
  '0048CDF7: cmp word ptr [ecx], 0001h
  '0048CDFB: jnz 48CE16h
  '0048CDFD: mov edi, [ecx+14h]
  '0048CE00: mov eax, [ecx+10h]
  '0048CE03: neg edi
  '0048CE05: cmp edi, eax
  '0048CE07: jb 48CE12h
  '0048CE09: call [00401170h]
  '0048CE0F: mov ecx, [ebp-38h]
  '0048CE12: mov eax, edi
  '0048CE14: jmp 48CE1Fh
  '0048CE16: call [00401170h]
  '0048CE1C: mov ecx, [ebp-38h]
  '0048CE1F: mov edx, [ebp-2Ch]
  '0048CE22: mov ebx, [ebp-70h]
  '0048CE25: mov ecx, [ecx+0Ch]
  '0048CE28: push edx
  '0048CE29: mov edx, [ebp-40h]
  '0048CE2C: add ecx, eax
  '0048CE2E: mov edx, [edx+0Ch]
  '0048CE31: add edx, ebx
  '0048CE33: push edx
  '0048CE34: push ecx
  '0048CE35: call 004101ECh
  '0048CE3A: call [004010A4h]
  '0048CE40: mov edi, [00401378h]
  '0048CE46: lea edx, [ebp-38h]
  '0048CE49: push edx
  '0048CE4A: call edi
  '0048CE4C: lea eax, [ebp-3Ch]
  '0048CE4F: push eax
  '0048CE50: call edi
  '0048CE52: lea ecx, [ebp-40h]
  '0048CE55: push ecx
  '0048CE56: call edi
  '0048CE58: lea edx, [ebp-44h]
  '0048CE5B: push edx
  '0048CE5C: call edi
  '0048CE5E: mov eax, [esi+50h]
  '0048CE61: test eax, eax
  '0048CE63: jz 48CE87h
  '0048CE65: cmp word ptr [eax], 0001h
  '0048CE69: jnz 48CE87h
  '0048CE6B: mov edi, [ebp-18h]
  '0048CE6E: mov edx, [eax+14h]
  '0048CE71: mov ecx, [eax+10h]
  '0048CE74: sub edi, edx
  '0048CE76: cmp edi, ecx
  '0048CE78: jb 48CE80h
  '0048CE7A: call [00401170h]
  '0048CE80: shl edi, 04h
  '0048CE83: mov ebx, edi
  '0048CE85: jmp 48CE8Fh
  '0048CE87: call [00401170h]
  '0048CE8D: mov ebx, eax
  '0048CE8F: mov eax, [esi+50h]
  '0048CE92: test eax, eax
  '0048CE94: jz 48CEC1h
  '0048CE96: cmp word ptr [eax], 0001h
  '0048CE9A: jnz 48CEC1h
  '0048CE9C: mov edi, [ebp-18h]
  '0048CE9F: mov edx, [eax+14h]
  '0048CEA2: mov ecx, [eax+10h]
  '0048CEA5: sub edi, 00000001h
  '0048CEA8: jo 0048D07Ah
  '0048CEAE: sub edi, edx
  '0048CEB0: cmp edi, ecx
  '0048CEB2: jb 48CEBAh
  '0048CEB4: call [00401170h]
  '0048CEBA: shl edi, 04h
  '0048CEBD: mov eax, edi
  '0048CEBF: jmp 48CEC7h
  '0048CEC1: call [00401170h]
  '0048CEC7: mov ecx, [esi+50h]
  '0048CECA: mov edi, [ebp-24h]
  '0048CECD: mov ecx, [ecx+0Ch]
  '0048CED0: mov edx, [ecx+ebx+0Ch]
  '0048CED4: mov ebx, [ebp-18h]
  '0048CED7: sub edx, edi
  '0048CED9: jo 0048D07Ah
  '0048CEDF: mov [ecx+eax+0Ch], edx
  '0048CEE3: xor edi, edi
  '0048CEE5: mov eax, 00000001h
  '0048CEEA: add eax, ebx
  '0048CEEC: jo 0048D07Ah
  '0048CEF2: mov [ebp-18h], eax
  '0048CEF5: mov ebx, eax
  '0048CEF7: jmp 0048CB9Dh
  '0048CEFC: mov ax, [esi+4Ch]
  '0048CF00: mov edi, [004011BCh]
  '0048CF06: sub ax, 0001h
  '0048CF0A: push 00000000h
  '0048CF0C: jo 0048D07Ah
  '0048CF12: mov [esi+4Ch], ax
  '0048CF16: sub ax, 0001h
  '0048CF1A: jo 0048D07Ah
  '0048CF20: movsx eax, ax
  '0048CF23: push eax
  '0048CF24: lea ebx, [esi+50h]
  '0048CF27: push 00000001h
  '0048CF29: push 00000000h
  '0048CF2B: push ebx
  '0048CF2C: push 00000010h
  '0048CF2E: push 00000000h
  '0048CF30: call edi
  '0048CF32: mov cx, [esi+4Ch]
  '0048CF36: push 00000000h
  '0048CF38: sub cx, 0001h
  '0048CF3C: lea eax, [esi+54h]
  '0048CF3F: jo 0048D07Ah
  '0048CF45: movsx edx, cx
  '0048CF48: push edx
  '0048CF49: push 00000001h
  '0048CF4B: push 004121DCh
  '0048CF50: push eax
  '0048CF51: push 00000004h
  '0048CF53: push 00000000h
  '0048CF55: call edi
  '0048CF57: mov cx, [esi+4Ch]
  '0048CF5B: add esp, 00000038h
  '0048CF5E: sub cx, 0001h
  '0048CF62: jo 0048D07Ah
  '0048CF68: movsx edx, cx
  '0048CF6B: mov [ebp-64h], edx
  '0048CF6E: xor edi, edi
  '0048CF70: cmp edi, [ebp-64h]
  '0048CF73: jnle 0048D02Ch
  '0048CF79: mov eax, [ebx]
  '0048CF7B: test eax, eax
  '0048CF7D: jz 48CFA1h
  '0048CF7F: cmp word ptr [eax], 0001h
  '0048CF83: jnz 48CFA1h
  '0048CF85: mov edx, [eax+14h]
  '0048CF88: mov ecx, [eax+10h]
  '0048CF8B: mov esi, edi
  '0048CF8D: sub esi, edx
  '0048CF8F: cmp esi, ecx
  '0048CF91: jb 48CF99h
  '0048CF93: call [00401170h]
  '0048CF99: shl esi, 04h
  '0048CF9C: mov [ebp-74h], esi
  '0048CF9F: jmp 48CFAAh
  '0048CFA1: call [00401170h]
  '0048CFA7: mov [ebp-74h], eax
  '0048CFAA: mov eax, [ebx]
  '0048CFAC: test eax, eax
  '0048CFAE: jz 48CFD1h
  '0048CFB0: cmp word ptr [eax], 0001h
  '0048CFB4: jnz 48CFD1h
  '0048CFB6: mov edx, [eax+14h]
  '0048CFB9: mov ecx, [eax+10h]
  '0048CFBC: mov esi, edi
  '0048CFBE: sub esi, edx
  '0048CFC0: cmp esi, ecx
  '0048CFC2: jb 48CFCAh
  '0048CFC4: call [00401170h]
  '0048CFCA: shl esi, 04h
  '0048CFCD: mov eax, esi
  '0048CFCF: jmp 48CFD7h
  '0048CFD1: call [00401170h]
  '0048CFD7: mov dx, [ebp-20h]
  '0048CFDB: mov ecx, [ebx]
  '0048CFDD: imul dx, 10h
  '0048CFE1: mov ecx, [ecx+0Ch]
  '0048CFE4: mov esi, [ebp-74h]
  '0048CFE7: jo 0048D07Ah
  '0048CFED: movsx edx, dx
  '0048CFF0: add edx, [ecx+esi+0Ch]
  '0048CFF4: jo 0048D07Ah
  '0048CFFA: mov [ecx+eax+0Ch], edx
  '0048CFFE: mov eax, 00000001h
  '0048D003: add eax, edi
  '0048D005: jo 48D07Ah
  '0048D007: mov edi, eax
  '0048D009: jmp 0048CF70h
  '0048D00E: lea eax, [esi+50h]
  '0048D011: push eax
  '0048D012: push edi
  '0048D013: mov edi, [0040113Ch]
  '0048D019: call edi
  '0048D01B: lea ecx, [esi+54h]
  '0048D01E: push ecx
  '0048D01F: push 004121DCh
  '0048D024: call edi
  '0048D026: mov word ptr [esi+4Ch], 0000h
  '0048D02C: push 0048D053h
  '0048D031: jmp 48D052h
  '0048D033: mov esi, [00401378h]
  '0048D039: lea edx, [ebp-38h]
  '0048D03C: push edx
  '0048D03D: call esi
  '0048D03F: lea eax, [ebp-3Ch]
  '0048D042: push eax
  '0048D043: call esi
  '0048D045: lea ecx, [ebp-40h]
  '0048D048: push ecx
  '0048D049: call esi
  '0048D04B: lea edx, [ebp-44h]
  '0048D04E: push edx
  '0048D04F: call esi
  '0048D051: ret 
End Sub
Private Sub unknown_48D080
  '0048D080: push ebp
  '0048D081: mov ebp, esp
  '0048D083: sub esp, 0000000Ch
  '0048D086: push 00403796h
  '0048D08B: mov eax, fs:[00h]
  '0048D091: push eax
  '0048D092: mov fs:[00000000h], esp
  '0048D099: sub esp, 00000114h
  '0048D09F: push ebx
  '0048D0A0: push esi
  '0048D0A1: push edi
  '0048D0A2: mov [ebp-0Ch], esp
  '0048D0A5: mov [ebp-08h], 00402B40h
  '0048D0AC: xor esi, esi
  '0048D0AE: mov [ebp-04h], esi
  '0048D0B1: mov ebx, [ebp+08h]
  '0048D0B4: push ebx
  '0048D0B5: mov eax, [ebx]
  '0048D0B7: call [eax+04h]
  '0048D0BA: mov ecx, 0000000Ah
  '0048D0BF: xor eax, eax
  '0048D0C1: lea edi, [ebp-3Ch]
  '0048D0C4: mov [ebp-44h], esi
  '0048D0C7: rep stosd 
  '0048D0C9: mov ax, [ebx+4Ch]
  '0048D0CD: mov [ebp-4Ch], esi
  '0048D0D0: cmp ax, si
  '0048D0D3: mov [ebp-50h], esi
  '0048D0D6: mov [ebp-58h], esi
  '0048D0D9: mov [ebp-5Ch], esi
  '0048D0DC: mov [ebp-60h], esi
  '0048D0DF: mov [ebp-64h], esi
  '0048D0E2: mov [ebp-68h], esi
  '0048D0E5: mov [ebp-78h], esi
  '0048D0E8: mov [ebp-00000088h], esi
  '0048D0EE: mov [ebp-00000098h], esi
  '0048D0F4: mov [ebp-000000A8h], esi
  '0048D0FA: mov [ebp-000000B8h], esi
  '0048D100: mov [ebp-000000DCh], esi
  '0048D106: mov [ebp-000000F8h], esi
  '0048D10C: mov [ebp-000000FCh], esi
  '0048D112: mov word ptr [ebx+4Ah], 0001h
  '0048D118: jle 0048D4B5h
  '0048D11E: sub ax, 0001h
  '0048D122: jo 0048D9BEh
  '0048D128: movsx ecx, ax
  '0048D12B: mov [ebp-0000010Ch], ecx
  '0048D131: xor edi, edi
  '0048D133: cmp edi, [ebp-0000010Ch]
  '0048D139: jnle 0048D36Ah
  '0048D13F: mov edx, [ebx+50h]
  '0048D142: lea eax, [ebp-000000F8h]
  '0048D148: push edx
  '0048D149: push eax
  '0048D14A: call [004012F8h]
  '0048D150: mov ecx, [ebp-000000F8h]
  '0048D156: cmp ecx, esi
  '0048D158: jz 48D181h
  '0048D15A: cmp word ptr [ecx], 0001h
  '0048D15E: jnz 48D181h
  '0048D160: mov edx, [ecx+14h]
  '0048D163: mov eax, [ecx+10h]
  '0048D166: mov esi, edi
  '0048D168: sub esi, edx
  '0048D16A: cmp esi, eax
  '0048D16C: jb 48D17Ah
  '0048D16E: call [00401170h]
  '0048D174: mov ecx, [ebp-000000F8h]
  '0048D17A: shl esi, 04h
  '0048D17D: mov eax, esi
  '0048D17F: jmp 48D18Dh
  '0048D181: call [00401170h]
  '0048D187: mov ecx, [ebp-000000F8h]
  '0048D18D: mov esi, [ecx+0Ch]
  '0048D190: mov ecx, [ebx]
  '0048D192: add esi, eax
  '0048D194: mov eax, edi
  '0048D196: lea edx, [ebp-000000DCh]
  '0048D19C: add eax, 00000001h
  '0048D19F: push edx
  '0048D1A0: jo 0048D9BEh
  '0048D1A6: push eax
  '0048D1A7: push ebx
  '0048D1A8: call [ecx+40h]
  '0048D1AB: test eax, eax
  '0048D1AD: jnl 48D1BEh
  '0048D1AF: push 00000040h
  '0048D1B1: push 00411F08h
  '0048D1B6: push ebx
  '0048D1B7: push eax
  '0048D1B8: call [004010A8h]
  '0048D1BE: mov eax, [ebp+10h]
  '0048D1C1: xor ecx, ecx
  '0048D1C3: mov cl, [esi+01h]
  '0048D1C6: xor edx, edx
  '0048D1C8: cmp ecx, eax
  '0048D1CA: setnz dl
  '0048D1CD: xor eax, eax
  '0048D1CF: xor ecx, ecx
  '0048D1D1: mov al, [esi]
  '0048D1D3: mov esi, [ebp+0Ch]
  '0048D1D6: cmp eax, esi
  '0048D1D8: mov esi, [ebp-000000DCh]
  '0048D1DE: setnz cl
  '0048D1E1: or edx, ecx
  '0048D1E3: mov ecx, [ebp+14h]
  '0048D1E6: neg edx
  '0048D1E8: sbb edx, edx
  '0048D1EA: xor eax, eax
  '0048D1EC: neg edx
  '0048D1EE: cmp esi, ecx
  '0048D1F0: setnz al
  '0048D1F3: or edx, eax
  '0048D1F5: jz 48D21Ah
  '0048D1F7: lea edx, [ebp-000000F8h]
  '0048D1FD: push edx
  '0048D1FE: call [00401378h]
  '0048D204: mov eax, 00000001h
  '0048D209: add eax, edi
  '0048D20B: jo 0048D9BEh
  '0048D211: mov edi, eax
  '0048D213: xor esi, esi
  '0048D215: jmp 0048D133h
  '0048D21A: mov eax, [4A0F98h]
  '0048D21F: test eax, eax
  '0048D221: jnz 48D233h
  '0048D223: push 004A0F98h
  '0048D228: push 0040FFF4h
  '0048D22D: call [004012A8h]
  '0048D233: mov esi, [004A0F98h]
  '0048D239: lea ecx, [ebp-64h]
  '0048D23C: push ecx
  '0048D23D: push esi
  '0048D23E: mov eax, [esi]
  '0048D240: call [eax+14h]
  '0048D243: test eax, eax
  '0048D245: fclex 
  '0048D247: jnl 48D25Ch
  '0048D249: mov ebx, [004010A8h]
  '0048D24F: push 00000014h
  '0048D251: push 0040FFE4h
  '0048D256: push esi
  '0048D257: push eax
  '0048D258: call ebx
  '0048D25A: jmp 48D262h
  '0048D25C: mov ebx, [004010A8h]
  '0048D262: mov eax, [ebp-64h]
  '0048D265: lea ecx, [ebp-60h]
  '0048D268: push ecx
  '0048D269: push eax
  '0048D26A: mov edx, [eax]
  '0048D26C: mov esi, eax
  '0048D26E: call [edx+58h]
  '0048D271: test eax, eax
  '0048D273: fclex 
  '0048D275: jnl 48D282h
  '0048D277: push 00000058h
  '0048D279: push 00410004h
  '0048D27E: push esi
  '0048D27F: push eax
  '0048D280: call ebx
  '0048D282: call [004012E0h]
  '0048D288: lea edx, [ebp-68h]
  '0048D28B: push eax
  '0048D28C: push edx
  '0048D28D: call [004010F0h]
  '0048D293: mov ecx, 80020004h
  '0048D298: mov esi, eax
  '0048D29A: mov [ebp-000000A0h], ecx
  '0048D2A0: mov eax, 0000000Ah
  '0048D2A5: mov [ebp-00000090h], ecx
  '0048D2AB: mov edi, 00000008h
  '0048D2B0: lea edx, [ebp-000000B8h]
  '0048D2B6: lea ecx, [ebp-00000088h]
  '0048D2BC: mov [ebp-000000A8h], eax
  '0048D2C2: mov [ebp-00000098h], eax
  '0048D2C8: mov [ebp-000000B0h], 0042179Ch
  '0048D2D2: mov [ebp-000000B8h], edi
  '0048D2D8: call [00401308h]
  '0048D2DE: mov eax, [ebp-60h]
  '0048D2E1: push eax
  '0048D2E2: push 00421780h
  '0048D2E7: call [00401094h]
  '0048D2ED: mov [ebp-70h], eax
  '0048D2F0: lea edx, [ebp-000000A8h]
  '0048D2F6: lea eax, [ebp-00000098h]
  '0048D2FC: push edx
  '0048D2FD: push eax
  '0048D2FE: lea edx, [ebp-00000088h]
  '0048D304: lea eax, [ebp-78h]
  '0048D307: push edx
  '0048D308: mov [ebp-78h], edi
  '0048D30B: mov ecx, [esi]
  '0048D30D: push eax
  '0048D30E: push 80040419h
  '0048D313: push esi
  '0048D314: call [ecx+44h]
  '0048D317: test eax, eax
  '0048D319: fclex 
  '0048D31B: jnl 48D328h
  '0048D31D: push 00000044h
  '0048D31F: push 00411C80h
  '0048D324: push esi
  '0048D325: push eax
  '0048D326: call ebx
  '0048D328: lea ecx, [ebp-60h]
  '0048D32B: call [0040138Ch]
  '0048D331: lea ecx, [ebp-68h]
  '0048D334: lea edx, [ebp-64h]
  '0048D337: push ecx
  '0048D338: push edx
  '0048D339: push 00000002h
  '0048D33B: call [0040106Ch]
  '0048D341: lea eax, [ebp-000000A8h]
  '0048D347: lea ecx, [ebp-00000098h]
  '0048D34D: push eax
  '0048D34E: lea edx, [ebp-00000088h]
  '0048D354: push ecx
  '0048D355: lea eax, [ebp-78h]
  '0048D358: push edx
  '0048D359: push eax
  '0048D35A: push 00000004h
  '0048D35C: call [00401058h]
  '0048D362: add esp, 00000020h
  '0048D365: jmp 0048D927h
  '0048D36A: mov cx, [ebx+4Ch]
  '0048D36E: sub cx, 0001h
  '0048D372: jo 0048D9BEh
  '0048D378: movsx edx, cx
  '0048D37B: mov [ebp-00000114h], edx
  '0048D381: xor edi, edi
  '0048D383: cmp edi, [ebp-00000114h]
  '0048D389: jnle 0048D428h
  '0048D38F: mov eax, [ebx+50h]
  '0048D392: cmp eax, esi
  '0048D394: jz 48D3BBh
  '0048D396: cmp word ptr [eax], 0001h
  '0048D39A: jnz 48D3BBh
  '0048D39C: mov edx, [eax+14h]
  '0048D39F: mov ecx, [eax+10h]
  '0048D3A2: mov esi, edi
  '0048D3A4: sub esi, edx
  '0048D3A6: cmp esi, ecx
  '0048D3A8: jb 48D3B0h
  '0048D3AA: call [00401170h]
  '0048D3B0: shl esi, 04h
  '0048D3B3: mov [ebp-00000120h], esi
  '0048D3B9: jmp 48D3C7h
  '0048D3BB: call [00401170h]
  '0048D3C1: mov [ebp-00000120h], eax
  '0048D3C7: mov eax, [ebx+50h]
  '0048D3CA: test eax, eax
  '0048D3CC: jz 48D3EFh
  '0048D3CE: cmp word ptr [eax], 0001h
  '0048D3D2: jnz 48D3EFh
  '0048D3D4: mov edx, [eax+14h]
  '0048D3D7: mov ecx, [eax+10h]
  '0048D3DA: mov esi, edi
  '0048D3DC: sub esi, edx
  '0048D3DE: cmp esi, ecx
  '0048D3E0: jb 48D3E8h
  '0048D3E2: call [00401170h]
  '0048D3E8: shl esi, 04h
  '0048D3EB: mov eax, esi
  '0048D3ED: jmp 48D3F5h
  '0048D3EF: call [00401170h]
  '0048D3F5: mov ecx, [ebx+50h]
  '0048D3F8: mov edx, [ebp-00000120h]
  '0048D3FE: mov ecx, [ecx+0Ch]
  '0048D401: mov edx, [ecx+edx+0Ch]
  '0048D405: add edx, 00000010h
  '0048D408: jo 0048D9BEh
  '0048D40E: mov [ecx+eax+0Ch], edx
  '0048D412: mov eax, 00000001h
  '0048D417: add eax, edi
  '0048D419: jo 0048D9BEh
  '0048D41F: mov edi, eax
  '0048D421: xor esi, esi
  '0048D423: jmp 0048D383h
  '0048D428: mov ax, [ebx+4Ch]
  '0048D42C: sub ax, 0001h
  '0048D430: jo 0048D9BEh
  '0048D436: movsx ecx, ax
  '0048D439: mov eax, [ebx+50h]
  '0048D43C: mov [ebp-40h], ecx
  '0048D43F: cmp eax, esi
  '0048D441: jz 48D465h
  '0048D443: cmp word ptr [eax], 0001h
  '0048D447: jnz 48D465h
  '0048D449: mov edx, [eax+14h]
  '0048D44C: mov edi, ecx
  '0048D44E: sub edi, edx
  '0048D450: mov edx, [eax+10h]
  '0048D453: cmp edi, edx
  '0048D455: jb 48D460h
  '0048D457: call [00401170h]
  '0048D45D: mov ecx, [ebp-40h]
  '0048D460: shl edi, 04h
  '0048D463: jmp 48D470h
  '0048D465: call [00401170h]
  '0048D46B: mov ecx, [ebp-40h]
  '0048D46E: mov edi, eax
  '0048D470: mov eax, [ebx+50h]
  '0048D473: cmp eax, esi
  '0048D475: jz 48D496h
  '0048D477: cmp word ptr [eax], 0001h
  '0048D47B: jnz 48D496h
  '0048D47D: sub ecx, [eax+14h]
  '0048D480: mov esi, ecx
  '0048D482: mov ecx, [eax+10h]
  '0048D485: cmp esi, ecx
  '0048D487: jb 48D48Fh
  '0048D489: call [00401170h]
  '0048D48F: shl esi, 04h
  '0048D492: mov eax, esi
  '0048D494: jmp 48D49Ch
  '0048D496: call [00401170h]
  '0048D49C: mov ecx, [ebx+50h]
  '0048D49F: mov ecx, [ecx+0Ch]
  '0048D4A2: mov eax, [ecx+eax+08h]
  '0048D4A6: mov edx, [ecx+edi+0Ch]
  '0048D4AA: add eax, edx
  '0048D4AC: jo 0048D9BEh
  '0048D4B2: mov [ebp-44h], eax
  '0048D4B5: mov ax, [ebx+4Ch]
  '0048D4B9: push 00000000h
  '0048D4BB: add ax, 0001h
  '0048D4BF: lea edi, [ebx+50h]
  '0048D4C2: jo 0048D9BEh
  '0048D4C8: mov [ebx+4Ch], ax
  '0048D4CC: sub ax, 0001h
  '0048D4D0: jo 0048D9BEh
  '0048D4D6: movsx esi, ax
  '0048D4D9: push esi
  '0048D4DA: push 00000001h
  '0048D4DC: push 00000000h
  '0048D4DE: push edi
  '0048D4DF: push 00000010h
  '0048D4E1: push 00000000h
  '0048D4E3: mov [ebp-48h], esi
  '0048D4E6: mov [ebp-00000124h], edi
  '0048D4EC: call [004011BCh]
  '0048D4F2: mov edx, [edi]
  '0048D4F4: add esp, 0000001Ch
  '0048D4F7: lea eax, [ebp-000000FCh]
  '0048D4FD: push edx
  '0048D4FE: push eax
  '0048D4FF: call [004012F8h]
  '0048D505: mov ecx, [ebp-000000FCh]
  '0048D50B: test ecx, ecx
  '0048D50D: jz 48D534h
  '0048D50F: cmp word ptr [ecx], 0001h
  '0048D513: jnz 48D534h
  '0048D515: mov edx, [ecx+14h]
  '0048D518: mov eax, [ecx+10h]
  '0048D51B: sub esi, edx
  '0048D51D: cmp esi, eax
  '0048D51F: jb 48D52Dh
  '0048D521: call [00401170h]
  '0048D527: mov ecx, [ebp-000000FCh]
  '0048D52D: shl esi, 04h
  '0048D530: mov eax, esi
  '0048D532: jmp 48D540h
  '0048D534: call [00401170h]
  '0048D53A: mov ecx, [ebp-000000FCh]
  '0048D540: mov esi, [ecx+0Ch]
  '0048D543: add esi, eax
  '0048D545: mov eax, [ebp+14h]
  '0048D548: cmp eax, 00000002h
  '0048D54B: jnz 48D55Dh
  '0048D54D: mov ecx, eax
  '0048D54F: mov word ptr [esi+06h], 0001h
  '0048D555: call [0040120Ch]
  '0048D55B: jmp 48D58Fh
  '0048D55D: cmp eax, 00000010h
  '0048D560: jnz 48D572h
  '0048D562: mov ecx, eax
  '0048D564: mov word ptr [esi+06h], 0004h
  '0048D56A: call [0040120Ch]
  '0048D570: jmp 48D58Fh
  '0048D572: cmp eax, 00000100h
  '0048D577: jnz 48D581h
  '0048D579: mov word ptr [esi+06h], 0008h
  '0048D57F: jmp 48D587h
  '0048D581: mov word ptr [esi+06h], 0018h
  '0048D587: xor ecx, ecx
  '0048D589: call [004011F4h]
  '0048D58F: mov ecx, [ebp+0Ch]
  '0048D592: mov [esi+02h], al
  '0048D595: mov word ptr [esi+04h], 0001h
  '0048D59B: call [0040120Ch]
  '0048D5A1: mov edi, [ebp+10h]
  '0048D5A4: mov [esi], al
  '0048D5A6: mov ecx, edi
  '0048D5A8: call [0040120Ch]
  '0048D5AE: mov [esi+01h], al
  '0048D5B1: mov eax, [ebp-48h]
  '0048D5B4: test eax, eax
  '0048D5B6: jnz 48D5C1h
  '0048D5B8: mov [esi+0Ch], 00000016h
  '0048D5BF: jmp 48D5C7h
  '0048D5C1: mov ecx, [ebp-44h]
  '0048D5C4: mov [esi+0Ch], ecx
  '0048D5C7: movzx edx, byte ptr [esi+02h]
  '0048D5CC: cmp dx, 0100h
  '0048D5D1: jnle 48D5EDh
  '0048D5D3: mov eax, [ebp+14h]
  '0048D5D6: imul eax, 04h
  '0048D5D9: jo 0048D9BEh
  '0048D5DF: add eax, 00000028h
  '0048D5E2: jo 0048D9BEh
  '0048D5E8: mov [esi+08h], eax
  '0048D5EB: jmp 48D5F4h
  '0048D5ED: mov [esi+08h], 00000028h
  '0048D5F4: movsx edx, word ptr [esi+06h]
  '0048D5F8: imul edx, [ebp+0Ch]
  '0048D5FC: lea ecx, [ebp-000000DCh]
  '0048D602: mov eax, [ebx]
  '0048D604: push ecx
  '0048D605: movsx ecx, word ptr [esi+04h]
  '0048D609: jo 0048D9BEh
  '0048D60F: imul edx, ecx
  '0048D612: jo 0048D9BEh
  '0048D618: push edx
  '0048D619: push ebx
  '0048D61A: call [eax+00000080h]
  '0048D620: mov edx, [ebp-000000DCh]
  '0048D626: mov eax, [esi+08h]
  '0048D629: imul edx, edi
  '0048D62C: jo 0048D9BEh
  '0048D632: add edx, eax
  '0048D634: lea ecx, [ebp-000000DCh]
  '0048D63A: jo 0048D9BEh
  '0048D640: mov [esi+08h], edx
  '0048D643: mov edx, [ebp+0Ch]
  '0048D646: mov eax, [ebx]
  '0048D648: push ecx
  '0048D649: push edx
  '0048D64A: push ebx
  '0048D64B: call [eax+00000080h]
  '0048D651: mov eax, [ebp-000000DCh]
  '0048D657: mov ecx, [esi+08h]
  '0048D65A: imul eax, edi
  '0048D65D: jo 0048D9BEh
  '0048D663: add eax, ecx
  '0048D665: lea ecx, [ebp-000000FCh]
  '0048D66B: jo 0048D9BEh
  '0048D671: push ecx
  '0048D672: mov [esi+08h], eax
  '0048D675: call [00401378h]
  '0048D67B: mov edx, [ebp-48h]
  '0048D67E: push 00000000h
  '0048D680: push edx
  '0048D681: add ebx, 00000054h
  '0048D684: push 00000001h
  '0048D686: push 004121DCh
  '0048D68B: push ebx
  '0048D68C: push 00000004h
  '0048D68E: push 00000000h
  '0048D690: call [004011BCh]
  '0048D696: mov eax, [ebp-00000124h]
  '0048D69C: add esp, 0000001Ch
  '0048D69F: mov eax, [eax]
  '0048D6A1: test eax, eax
  '0048D6A3: jz 48D6CBh
  '0048D6A5: cmp word ptr [eax], 0001h
  '0048D6A9: jnz 48D6CBh
  '0048D6AB: mov esi, [ebp-48h]
  '0048D6AE: mov edx, [eax+14h]
  '0048D6B1: mov ecx, [eax+10h]
  '0048D6B4: sub esi, edx
  '0048D6B6: cmp esi, ecx
  '0048D6B8: jb 48D6C0h
  '0048D6BA: call [00401170h]
  '0048D6C0: shl esi, 04h
  '0048D6C3: mov [ebp-00000128h], esi
  '0048D6C9: jmp 48D6D7h
  '0048D6CB: call [00401170h]
  '0048D6D1: mov [ebp-00000128h], eax
  '0048D6D7: mov eax, [ebx]
  '0048D6D9: test eax, eax
  '0048D6DB: jz 48D701h
  '0048D6DD: cmp word ptr [eax], 0001h
  '0048D6E1: jnz 48D701h
  '0048D6E3: mov esi, [ebp-48h]
  '0048D6E6: mov edx, [eax+14h]
  '0048D6E9: mov ecx, [eax+10h]
  '0048D6EC: sub esi, edx
  '0048D6EE: cmp esi, ecx
  '0048D6F0: jb 48D6F8h
  '0048D6F2: call [00401170h]
  '0048D6F8: lea eax, [esi*4]
  '0048D6FF: jmp 48D707h
  '0048D701: call [00401170h]
  '0048D707: mov esi, [ebp-00000124h]
  '0048D70D: push 00000000h
  '0048D70F: mov ecx, [esi]
  '0048D711: mov edx, [ecx+0Ch]
  '0048D714: mov ecx, [ebp-00000128h]
  '0048D71A: mov edx, [edx+ecx+08h]
  '0048D71E: mov ecx, [ebx]
  '0048D720: sub edx, 00000001h
  '0048D723: jo 0048D9BEh
  '0048D729: push edx
  '0048D72A: mov edx, [ecx+0Ch]
  '0048D72D: push 00000001h
  '0048D72F: add edx, eax
  '0048D731: push 00000011h
  '0048D733: push edx
  '0048D734: push 00000001h
  '0048D736: push 00000080h
  '0048D73B: call [004011BCh]
  '0048D741: add esp, 0000001Ch
  '0048D744: mov eax, [ebp+0Ch]
  '0048D747: imul edi, 02h
  '0048D74A: mov [ebp-38h], eax
  '0048D74D: mov eax, [esi]
  '0048D74F: jo 0048D9BEh
  '0048D755: test eax, eax
  '0048D757: mov [ebp-3Ch], 00000028h
  '0048D75E: mov [ebp-34h], edi
  '0048D761: mov word ptr [ebp-30h], 0001h
  '0048D767: jz 48D78Bh
  '0048D769: cmp word ptr [eax], 0001h
  '0048D76D: jnz 48D78Bh
  '0048D76F: mov edi, [ebp-48h]
  '0048D772: mov edx, [eax+14h]
  '0048D775: mov ecx, [eax+10h]
  '0048D778: sub edi, edx
  '0048D77A: cmp edi, ecx
  '0048D77C: jb 48D784h
  '0048D77E: call [00401170h]
  '0048D784: shl edi, 04h
  '0048D787: mov eax, edi
  '0048D789: jmp 48D791h
  '0048D78B: call [00401170h]
  '0048D791: mov ecx, [esi]
  '0048D793: mov edi, [004012F8h]
  '0048D799: mov edx, [ecx+0Ch]
  '0048D79C: mov ecx, [ebx]
  '0048D79E: push ecx
  '0048D79F: mov ax, [edx+eax+06h]
  '0048D7A4: lea edx, [ebp-5Ch]
  '0048D7A7: mov [ebp-2Eh], ax
  '0048D7AB: xor eax, eax
  '0048D7AD: push edx
  '0048D7AE: mov [ebp-2Ch], eax
  '0048D7B1: mov [ebp-1Ch], eax
  '0048D7B4: call edi
  '0048D7B6: mov ecx, [ebp-5Ch]
  '0048D7B9: test ecx, ecx
  '0048D7BB: jz 48D7E4h
  '0048D7BD: cmp word ptr [ecx], 0001h
  '0048D7C1: jnz 48D7E4h
  '0048D7C3: mov esi, [ebp-48h]
  '0048D7C6: mov edx, [ecx+14h]
  '0048D7C9: mov eax, [ecx+10h]
  '0048D7CC: sub esi, edx
  '0048D7CE: cmp esi, eax
  '0048D7D0: jb 48D7DBh
  '0048D7D2: call [00401170h]
  '0048D7D8: mov ecx, [ebp-5Ch]
  '0048D7DB: lea eax, [esi*4]
  '0048D7E2: jmp 48D7EDh
  '0048D7E4: call [00401170h]
  '0048D7EA: mov ecx, [ebp-5Ch]
  '0048D7ED: mov ecx, [ecx+0Ch]
  '0048D7F0: mov edx, [ecx+eax]
  '0048D7F3: lea eax, [ebp-58h]
  '0048D7F6: push edx
  '0048D7F7: push eax
  '0048D7F8: call edi
  '0048D7FA: mov ecx, [ebp-58h]
  '0048D7FD: test ecx, ecx
  '0048D7FF: jz 48D820h
  '0048D801: cmp word ptr [ecx], 0001h
  '0048D805: jnz 48D820h
  '0048D807: mov esi, [ecx+14h]
  '0048D80A: mov eax, [ecx+10h]
  '0048D80D: neg esi
  '0048D80F: cmp esi, eax
  '0048D811: jb 48D81Ch
  '0048D813: call [00401170h]
  '0048D819: mov ecx, [ebp-58h]
  '0048D81C: mov eax, esi
  '0048D81E: jmp 48D829h
  '0048D820: call [00401170h]
  '0048D826: mov ecx, [ebp-58h]
  '0048D829: mov ecx, [ecx+0Ch]
  '0048D82C: lea edx, [ebp-3Ch]
  '0048D82F: push 00000028h
  '0048D831: add ecx, eax
  '0048D833: push edx
  '0048D834: push ecx
  '0048D835: call 004101ECh
  '0048D83A: call [004010A4h]
  '0048D840: mov esi, [00401378h]
  '0048D846: lea edx, [ebp-58h]
  '0048D849: push edx
  '0048D84A: call esi
  '0048D84C: lea eax, [ebp-5Ch]
  '0048D84F: push eax
  '0048D850: call esi
  '0048D852: cmp word ptr [ebp-2Eh], 0001h
  '0048D857: jnz 0048D927h
  '0048D85D: mov esi, [004011F4h]
  '0048D863: mov ecx, 000000FFh
  '0048D868: call esi
  '0048D86A: mov ecx, 000000FFh
  '0048D86F: mov [ebp-4Ch], al
  '0048D872: call esi
  '0048D874: mov ecx, 000000FFh
  '0048D879: mov [ebp-4Ah], al
  '0048D87C: call esi
  '0048D87E: mov ecx, [ebx]
  '0048D880: lea edx, [ebp-5Ch]
  '0048D883: push ecx
  '0048D884: push edx
  '0048D885: mov [ebp-4Bh], al
  '0048D888: call edi
  '0048D88A: mov ecx, [ebp-5Ch]
  '0048D88D: test ecx, ecx
  '0048D88F: jz 48D8BAh
  '0048D891: cmp word ptr [ecx], 0001h
  '0048D895: jnz 48D8BAh
  '0048D897: mov esi, [ebp-48h]
  '0048D89A: mov edx, [ecx+14h]
  '0048D89D: mov eax, [ecx+10h]
  '0048D8A0: mov ebx, [00401170h]
  '0048D8A6: sub esi, edx
  '0048D8A8: cmp esi, eax
  '0048D8AA: jb 48D8B1h
  '0048D8AC: call ebx
  '0048D8AE: mov ecx, [ebp-5Ch]
  '0048D8B1: lea eax, [esi*4]
  '0048D8B8: jmp 48D8C5h
  '0048D8BA: mov ebx, [00401170h]
  '0048D8C0: call ebx
  '0048D8C2: mov ecx, [ebp-5Ch]
  '0048D8C5: mov ecx, [ecx+0Ch]
  '0048D8C8: mov edx, [ecx+eax]
  '0048D8CB: lea eax, [ebp-58h]
  '0048D8CE: push edx
  '0048D8CF: push eax
  '0048D8D0: call edi
  '0048D8D2: mov ecx, [ebp-58h]
  '0048D8D5: test ecx, ecx
  '0048D8D7: jz 48D8F9h
  '0048D8D9: cmp word ptr [ecx], 0001h
  '0048D8DD: jnz 48D8F9h
  '0048D8DF: mov edx, [ecx+14h]
  '0048D8E2: mov eax, [ecx+10h]
  '0048D8E5: mov esi, 0000002Ch
  '0048D8EA: sub esi, edx
  '0048D8EC: cmp esi, eax
  '0048D8EE: jb 48D8F5h
  '0048D8F0: call ebx
  '0048D8F2: mov ecx, [ebp-58h]
  '0048D8F5: mov eax, esi
  '0048D8F7: jmp 48D8FEh
  '0048D8F9: call ebx
  '0048D8FB: mov ecx, [ebp-58h]
  '0048D8FE: mov ecx, [ecx+0Ch]
  '0048D901: lea edx, [ebp-4Ch]
  '0048D904: push 00000004h
  '0048D906: add ecx, eax
  '0048D908: push edx
  '0048D909: push ecx
  '0048D90A: call 004101ECh
  '0048D90F: call [004010A4h]
  '0048D915: mov esi, [00401378h]
  '0048D91B: lea edx, [ebp-58h]
  '0048D91E: push edx
  '0048D91F: call esi
  '0048D921: lea eax, [ebp-5Ch]
  '0048D924: push eax
  '0048D925: call esi
  '0048D927: push 0048D997h
  '0048D92C: jmp 48D97Eh
  '0048D92E: mov esi, [00401378h]
  '0048D934: lea ecx, [ebp-58h]
  '0048D937: push ecx
  '0048D938: call esi
  '0048D93A: lea edx, [ebp-5Ch]
  '0048D93D: push edx
  '0048D93E: call esi
  '0048D940: lea ecx, [ebp-60h]
  '0048D943: call [0040138Ch]
  '0048D949: lea eax, [ebp-68h]
  '0048D94C: lea ecx, [ebp-64h]
  '0048D94F: push eax
  '0048D950: push ecx
  '0048D951: push 00000002h
  '0048D953: call [0040106Ch]
  '0048D959: lea edx, [ebp-000000A8h]
  '0048D95F: lea eax, [ebp-00000098h]
  '0048D965: push edx
  '0048D966: lea ecx, [ebp-00000088h]
  '0048D96C: push eax
  '0048D96D: lea edx, [ebp-78h]
  '0048D970: push ecx
  '0048D971: push edx
  '0048D972: push 00000004h
  '0048D974: call [00401058h]
  '0048D97A: add esp, 00000020h
  '0048D97D: ret 
End Sub
Private Sub unknown_48D9D0
  '0048D9D0: push ebp
  '0048D9D1: mov ebp, esp
  '0048D9D3: sub esp, 0000000Ch
  '0048D9D6: push 00403796h
  '0048D9DB: mov eax, fs:[00h]
  '0048D9E1: push eax
  '0048D9E2: mov fs:[00000000h], esp
  '0048D9E9: sub esp, 00000110h
  '0048D9EF: push ebx
  '0048D9F0: push esi
  '0048D9F1: push edi
  '0048D9F2: mov [ebp-0Ch], esp
  '0048D9F5: mov [ebp-08h], 00402B50h
  '0048D9FC: mov [ebp-04h], 00000000h
  '0048DA03: mov ebx, [ebp+08h]
  '0048DA06: push ebx
  '0048DA07: mov eax, [ebx]
  '0048DA09: call [eax+04h]
  '0048DA0C: xor ecx, ecx
  '0048DA0E: mov edx, [ebp+0Ch]
  '0048DA11: mov edi, [004012C4h]
  '0048DA17: mov [ebp-50h], ecx
  '0048DA1A: mov [ebp-4Ch], ecx
  '0048DA1D: xor esi, esi
  '0048DA1F: mov [ebp-48h], ecx
  '0048DA22: mov [ebp-18h], esi
  '0048DA25: mov [ebp-44h], ecx
  '0048DA28: lea ecx, [ebp-34h]
  '0048DA2B: mov [ebp-24h], esi
  '0048DA2E: mov [ebp-2Ch], esi
  '0048DA31: mov [ebp-34h], esi
  '0048DA34: mov [ebp-38h], esi
  '0048DA37: mov [ebp-3Ch], esi
  '0048DA3A: mov [ebp-5Ch], esi
  '0048DA3D: mov [ebp-60h], esi
  '0048DA40: mov [ebp-64h], esi
  '0048DA43: mov [ebp-68h], esi
  '0048DA46: mov [ebp-6Ch], esi
  '0048DA49: mov [ebp-7Ch], esi
  '0048DA4C: mov [ebp-0000008Ch], esi
  '0048DA52: mov [ebp-0000009Ch], esi
  '0048DA58: mov [ebp-000000ACh], esi
  '0048DA5E: mov [ebp-000000BCh], esi
  '0048DA64: call edi
  '0048DA66: mov edx, [ebp+14h]
  '0048DA69: lea ecx, [ebp-24h]
  '0048DA6C: call edi
  '0048DA6E: mov edx, [ebp-34h]
  '0048DA71: lea ecx, [ebx+34h]
  '0048DA74: call edi
  '0048DA76: lea edi, [ebx+38h]
  '0048DA79: lea edx, [ebp-000000BCh]
  '0048DA7F: mov ecx, edi
  '0048DA81: mov [ebp-000000BCh], esi
  '0048DA87: call [00401024h]
  '0048DA8D: lea eax, [ebx+50h]
  '0048DA90: push eax
  '0048DA91: push esi
  '0048DA92: call [0040113Ch]
  '0048DA98: lea edx, [ebx+54h]
  '0048DA9B: push edx
  '0048DA9C: push 004121DCh
  '0048DAA1: call [0040113Ch]
  '0048DAA7: mov eax, [ebp-34h]
  '0048DAAA: push 00000002h
  '0048DAAC: add ebx, 00000048h
  '0048DAAF: push esi
  '0048DAB0: lea ecx, [ebp-64h]
  '0048DAB3: push eax
  '0048DAB4: push ecx
  '0048DAB5: mov [ebx+04h], si
  '0048DAB9: mov [ebx], si
  '0048DABC: mov [ebx+02h], si
  '0048DAC0: call [0040130Ch]
  '0048DAC6: push eax
  '0048DAC7: call 004123D0h
  '0048DACC: mov esi, eax
  '0048DACE: call [004010A4h]
  '0048DAD4: mov edx, [ebp-64h]
  '0048DAD7: lea eax, [ebp-34h]
  '0048DADA: push edx
  '0048DADB: push eax
  '0048DADC: call [00401228h]
  '0048DAE2: lea ecx, [ebp-64h]
  '0048DAE5: mov [ebp-1Ch], esi
  '0048DAE8: call [0040138Ch]
  '0048DAEE: test esi, esi
  '0048DAF0: jnz 48DAFAh
  '0048DAF2: mov [ebp-38h], esi
  '0048DAF5: jmp 0048E829h
  '0048DAFA: mov eax, [ebp+10h]
  '0048DAFD: test eax, eax
  '0048DAFF: jz 0048DB92h
  '0048DB05: mov ecx, eax
  '0048DB07: push 00414210h
  '0048DB0C: push ecx
  '0048DB0D: call [00401028h]
  '0048DB13: mov edx, eax
  '0048DB15: lea ecx, [ebp-64h]
  '0048DB18: call [00401348h]
  '0048DB1E: push eax
  '0048DB1F: call [00401094h]
  '0048DB25: mov edx, eax
  '0048DB27: lea ecx, [ebp-24h]
  '0048DB2A: call [00401348h]
  '0048DB30: lea ecx, [ebp-64h]
  '0048DB33: call [0040138Ch]
  '0048DB39: mov edx, [ebp-24h]
  '0048DB3C: push 0000000Eh
  '0048DB3E: lea eax, [ebp-64h]
  '0048DB41: push edx
  '0048DB42: push eax
  '0048DB43: call [0040130Ch]
  '0048DB49: push eax
  '0048DB4A: push esi
  '0048DB4B: call 00412510h
  '0048DB50: mov esi, eax
  '0048DB52: call [004010A4h]
  '0048DB58: mov ecx, [ebp-64h]
  '0048DB5B: lea edx, [ebp-24h]
  '0048DB5E: push ecx
  '0048DB5F: push edx
  '0048DB60: call [00401228h]
  '0048DB66: lea ecx, [ebp-64h]
  '0048DB69: call [0040138Ch]
  '0048DB6F: mov eax, [ebp+10h]
  '0048DB72: lea edx, [ebp-000000BCh]
  '0048DB78: mov ecx, edi
  '0048DB7A: mov [ebp-000000B4h], eax
  '0048DB80: mov [ebp-000000BCh], 00000003h
  '0048DB8A: call [00401024h]
  '0048DB90: jmp 48DBE9h
  '0048DB92: mov ecx, [ebp-24h]
  '0048DB95: push 0000000Eh
  '0048DB97: lea edx, [ebp-64h]
  '0048DB9A: push ecx
  '0048DB9B: push edx
  '0048DB9C: call [0040130Ch]
  '0048DBA2: push eax
  '0048DBA3: push esi
  '0048DBA4: call 00412510h
  '0048DBA9: mov esi, eax
  '0048DBAB: call [004010A4h]
  '0048DBB1: mov eax, [ebp-64h]
  '0048DBB4: lea ecx, [ebp-24h]
  '0048DBB7: push eax
  '0048DBB8: push ecx
  '0048DBB9: call [00401228h]
  '0048DBBF: lea ecx, [ebp-64h]
  '0048DBC2: call [0040138Ch]
  '0048DBC8: mov edx, [ebp-24h]
  '0048DBCB: mov ecx, edi
  '0048DBCD: mov [ebp-000000B4h], edx
  '0048DBD3: lea edx, [ebp-000000BCh]
  '0048DBD9: mov [ebp-000000BCh], 00000008h
  '0048DBE3: call [00401324h]
  '0048DBE9: test esi, esi
  '0048DBEB: jnz 0048DD48h
  '0048DBF1: mov eax, [4A0F98h]
  '0048DBF6: test eax, eax
  '0048DBF8: jnz 48DC0Ah
  '0048DBFA: push 004A0F98h
  '0048DBFF: push 0040FFF4h
  '0048DC04: call [004012A8h]
  '0048DC0A: mov esi, [004A0F98h]
  '0048DC10: lea ecx, [ebp-68h]
  '0048DC13: push ecx
  '0048DC14: push esi
  '0048DC15: mov eax, [esi]
  '0048DC17: call [eax+14h]
  '0048DC1A: test eax, eax
  '0048DC1C: fclex 
  '0048DC1E: jnl 48DC33h
  '0048DC20: mov edi, [004010A8h]
  '0048DC26: push 00000014h
  '0048DC28: push 0040FFE4h
  '0048DC2D: push esi
  '0048DC2E: push eax
  '0048DC2F: call edi
  '0048DC31: jmp 48DC39h
  '0048DC33: mov edi, [004010A8h]
  '0048DC39: mov eax, [ebp-68h]
  '0048DC3C: lea ecx, [ebp-64h]
  '0048DC3F: push ecx
  '0048DC40: push eax
  '0048DC41: mov edx, [eax]
  '0048DC43: mov esi, eax
  '0048DC45: call [edx+58h]
  '0048DC48: test eax, eax
  '0048DC4A: fclex 
  '0048DC4C: jnl 48DC59h
  '0048DC4E: push 00000058h
  '0048DC50: push 00410004h
  '0048DC55: push esi
  '0048DC56: push eax
  '0048DC57: call edi
  '0048DC59: call [004012E0h]
  '0048DC5F: lea edx, [ebp-6Ch]
  '0048DC62: push eax
  '0048DC63: push edx
  '0048DC64: call [004010F0h]
  '0048DC6A: mov ecx, 80020004h
  '0048DC6F: mov esi, eax
  '0048DC71: mov [ebp-000000A4h], ecx
  '0048DC77: mov eax, 0000000Ah
  '0048DC7C: mov [ebp-00000094h], ecx
  '0048DC82: mov ebx, 00000008h
  '0048DC87: lea edx, [ebp-000000BCh]
  '0048DC8D: lea ecx, [ebp-0000008Ch]
  '0048DC93: mov [ebp-000000ACh], eax
  '0048DC99: mov [ebp-0000009Ch], eax
  '0048DC9F: mov [ebp-000000B4h], 00421420h
  '0048DCA9: mov [ebp-000000BCh], ebx
  '0048DCAF: call [00401308h]
  '0048DCB5: mov eax, [ebp-64h]
  '0048DCB8: push eax
  '0048DCB9: push 00421780h
  '0048DCBE: call [00401094h]
  '0048DCC4: mov [ebp-74h], eax
  '0048DCC7: lea edx, [ebp-000000ACh]
  '0048DCCD: lea eax, [ebp-0000009Ch]
  '0048DCD3: push edx
  '0048DCD4: push eax
  '0048DCD5: lea edx, [ebp-0000008Ch]
  '0048DCDB: lea eax, [ebp-7Ch]
  '0048DCDE: push edx
  '0048DCDF: mov [ebp-7Ch], ebx
  '0048DCE2: mov ecx, [esi]
  '0048DCE4: push eax
  '0048DCE5: push 8004041Fh
  '0048DCEA: push esi
  '0048DCEB: call [ecx+44h]
  '0048DCEE: test eax, eax
  '0048DCF0: fclex 
  '0048DCF2: jnl 48DCFFh
  '0048DCF4: push 00000044h
  '0048DCF6: push 00411C80h
  '0048DCFB: push esi
  '0048DCFC: push eax
  '0048DCFD: call edi
  '0048DCFF: lea ecx, [ebp-64h]
  '0048DD02: call [0040138Ch]
  '0048DD08: lea ecx, [ebp-6Ch]
  '0048DD0B: lea edx, [ebp-68h]
  '0048DD0E: push ecx
  '0048DD0F: push edx
  '0048DD10: push 00000002h
  '0048DD12: call [0040106Ch]
  '0048DD18: lea eax, [ebp-000000ACh]
  '0048DD1E: lea ecx, [ebp-0000009Ch]
  '0048DD24: push eax
  '0048DD25: lea edx, [ebp-0000008Ch]
  '0048DD2B: push ecx
  '0048DD2C: lea eax, [ebp-7Ch]
  '0048DD2F: push edx
  '0048DD30: push eax
  '0048DD31: push 00000004h
  '0048DD33: call [00401058h]
  '0048DD39: add esp, 00000020h
  '0048DD3C: mov [ebp-38h], 00000000h
  '0048DD43: jmp 0048E81Ah
  '0048DD48: mov ecx, [ebp-1Ch]
  '0048DD4B: push esi
  '0048DD4C: push ecx
  '0048DD4D: call 0041245Ch
  '0048DD52: mov esi, eax
  '0048DD54: call [004010A4h]
  '0048DD5A: test esi, esi
  '0048DD5C: jnz 0048DE79h
  '0048DD62: mov eax, [4A0F98h]
  '0048DD67: test eax, eax
  '0048DD69: jnz 48DD7Bh
  '0048DD6B: push 004A0F98h
  '0048DD70: push 0040FFF4h
  '0048DD75: call [004012A8h]
  '0048DD7B: mov esi, [004A0F98h]
  '0048DD81: lea eax, [ebp-68h]
  '0048DD84: push eax
  '0048DD85: push esi
  '0048DD86: mov edx, [esi]
  '0048DD88: call [edx+14h]
  '0048DD8B: test eax, eax
  '0048DD8D: fclex 
  '0048DD8F: jnl 48DDA4h
  '0048DD91: mov edi, [004010A8h]
  '0048DD97: push 00000014h
  '0048DD99: push 0040FFE4h
  '0048DD9E: push esi
  '0048DD9F: push eax
  '0048DDA0: call edi
  '0048DDA2: jmp 48DDAAh
  '0048DDA4: mov edi, [004010A8h]
  '0048DDAA: mov eax, [ebp-68h]
  '0048DDAD: lea edx, [ebp-64h]
  '0048DDB0: push edx
  '0048DDB1: push eax
  '0048DDB2: mov ecx, [eax]
  '0048DDB4: mov esi, eax
  '0048DDB6: call [ecx+58h]
  '0048DDB9: test eax, eax
  '0048DDBB: fclex 
  '0048DDBD: jnl 48DDCAh
  '0048DDBF: push 00000058h
  '0048DDC1: push 00410004h
  '0048DDC6: push esi
  '0048DDC7: push eax
  '0048DDC8: call edi
  '0048DDCA: call [004012E0h]
  '0048DDD0: push eax
  '0048DDD1: lea eax, [ebp-6Ch]
  '0048DDD4: push eax
  '0048DDD5: call [004010F0h]
  '0048DDDB: mov ecx, 80020004h
  '0048DDE0: mov esi, eax
  '0048DDE2: mov [ebp-000000A4h], ecx
  '0048DDE8: mov eax, 0000000Ah
  '0048DDED: mov [ebp-00000094h], ecx
  '0048DDF3: mov ebx, 00000008h
  '0048DDF8: lea edx, [ebp-000000BCh]
  '0048DDFE: lea ecx, [ebp-0000008Ch]
  '0048DE04: mov [ebp-000000ACh], eax
  '0048DE0A: mov [ebp-0000009Ch], eax
  '0048DE10: mov [ebp-000000B4h], 004217DCh
  '0048DE1A: mov [ebp-000000BCh], ebx
  '0048DE20: call [00401308h]
  '0048DE26: mov ecx, [ebp-64h]
  '0048DE29: push ecx
  '0048DE2A: push 00421780h
  '0048DE2F: call [00401094h]
  '0048DE35: mov [ebp-74h], eax
  '0048DE38: lea eax, [ebp-000000ACh]
  '0048DE3E: lea ecx, [ebp-0000009Ch]
  '0048DE44: push eax
  '0048DE45: push ecx
  '0048DE46: lea eax, [ebp-0000008Ch]
  '0048DE4C: lea ecx, [ebp-7Ch]
  '0048DE4F: push eax
  '0048DE50: mov [ebp-7Ch], ebx
  '0048DE53: mov edx, [esi]
  '0048DE55: push ecx
  '0048DE56: push 80040420h
  '0048DE5B: push esi
  '0048DE5C: call [edx+44h]
  '0048DE5F: test eax, eax
  '0048DE61: fclex 
  '0048DE63: jnl 0048DF9Fh
  '0048DE69: push 00000044h
  '0048DE6B: push 00411C80h
  '0048DE70: push esi
  '0048DE71: push eax
  '0048DE72: call edi
  '0048DE74: jmp 0048DF9Fh
  '0048DE79: push esi
  '0048DE7A: call 004124A4h
  '0048DE7F: mov esi, [004010A4h]
  '0048DE85: mov edi, eax
  '0048DE87: call esi
  '0048DE89: test edi, edi
  '0048DE8B: jnz 0048DFD6h
  '0048DE91: mov eax, [4A0F98h]
  '0048DE96: test eax, eax
  '0048DE98: jnz 48DEAAh
  '0048DE9A: push 004A0F98h
  '0048DE9F: push 0040FFF4h
  '0048DEA4: call [004012A8h]
  '0048DEAA: mov esi, [004A0F98h]
  '0048DEB0: lea eax, [ebp-68h]
  '0048DEB3: push eax
  '0048DEB4: push esi
  '0048DEB5: mov edx, [esi]
  '0048DEB7: call [edx+14h]
  '0048DEBA: test eax, eax
  '0048DEBC: fclex 
  '0048DEBE: jnl 48DED3h
  '0048DEC0: mov ebx, [004010A8h]
  '0048DEC6: push 00000014h
  '0048DEC8: push 0040FFE4h
  '0048DECD: push esi
  '0048DECE: push eax
  '0048DECF: call ebx
  '0048DED1: jmp 48DED9h
  '0048DED3: mov ebx, [004010A8h]
  '0048DED9: mov eax, [ebp-68h]
  '0048DEDC: lea edx, [ebp-64h]
  '0048DEDF: push edx
  '0048DEE0: push eax
  '0048DEE1: mov ecx, [eax]
  '0048DEE3: mov esi, eax
  '0048DEE5: call [ecx+58h]
  '0048DEE8: test eax, eax
  '0048DEEA: fclex 
  '0048DEEC: jnl 48DEF9h
  '0048DEEE: push 00000058h
  '0048DEF0: push 00410004h
  '0048DEF5: push esi
  '0048DEF6: push eax
  '0048DEF7: call ebx
  '0048DEF9: call [004012E0h]
  '0048DEFF: push eax
  '0048DF00: lea eax, [ebp-6Ch]
  '0048DF03: push eax
  '0048DF04: call [004010F0h]
  '0048DF0A: mov ecx, 80020004h
  '0048DF0F: mov esi, eax
  '0048DF11: mov [ebp-000000A4h], ecx
  '0048DF17: mov eax, 0000000Ah
  '0048DF1C: mov [ebp-00000094h], ecx
  '0048DF22: mov edi, 00000008h
  '0048DF27: lea edx, [ebp-000000BCh]
  '0048DF2D: lea ecx, [ebp-0000008Ch]
  '0048DF33: mov [ebp-000000ACh], eax
  '0048DF39: mov [ebp-0000009Ch], eax
  '0048DF3F: mov [ebp-000000B4h], 0042180Ch
  '0048DF49: mov [ebp-000000BCh], edi
  '0048DF4F: call [00401308h]
  '0048DF55: mov ecx, [ebp-64h]
  '0048DF58: push ecx
  '0048DF59: push 00421780h
  '0048DF5E: call [00401094h]
  '0048DF64: mov [ebp-74h], eax
  '0048DF67: lea eax, [ebp-000000ACh]
  '0048DF6D: lea ecx, [ebp-0000009Ch]
  '0048DF73: push eax
  '0048DF74: push ecx
  '0048DF75: lea eax, [ebp-0000008Ch]
  '0048DF7B: lea ecx, [ebp-7Ch]
  '0048DF7E: push eax
  '0048DF7F: mov [ebp-7Ch], edi
  '0048DF82: mov edx, [esi]
  '0048DF84: push ecx
  '0048DF85: push 80040420h
  '0048DF8A: push esi
  '0048DF8B: call [edx+44h]
  '0048DF8E: test eax, eax
  '0048DF90: fclex 
  '0048DF92: jnl 48DF9Fh
  '0048DF94: push 00000044h
  '0048DF96: push 00411C80h
  '0048DF9B: push esi
  '0048DF9C: push eax
  '0048DF9D: call ebx
  '0048DF9F: lea ecx, [ebp-64h]
  '0048DFA2: call [0040138Ch]
  '0048DFA8: lea edx, [ebp-6Ch]
  '0048DFAB: lea eax, [ebp-68h]
  '0048DFAE: push edx
  '0048DFAF: push eax
  '0048DFB0: push 00000002h
  '0048DFB2: call [0040106Ch]
  '0048DFB8: lea ecx, [ebp-000000ACh]
  '0048DFBE: lea edx, [ebp-0000009Ch]
  '0048DFC4: push ecx
  '0048DFC5: lea eax, [ebp-0000008Ch]
  '0048DFCB: push edx
  '0048DFCC: lea ecx, [ebp-7Ch]
  '0048DFCF: push eax
  '0048DFD0: push ecx
  '0048DFD1: jmp 0048DD31h
  '0048DFD6: push 00000006h
  '0048DFD8: push edi
  '0048DFD9: push ebx
  '0048DFDA: call 004101ECh
  '0048DFDF: call esi
  '0048DFE1: mov edx, [ebp+08h]
  '0048DFE4: mov ax, [edx+4Ch]
  '0048DFE8: test ax, ax
  '0048DFEB: jle 0048E81Ah
  '0048DFF1: sub ax, 0001h
  '0048DFF5: mov esi, [004011E4h]
  '0048DFFB: jo 0048E8D0h
  '0048E001: movsx eax, ax
  '0048E004: mov ebx, edx
  '0048E006: push 00000000h
  '0048E008: push eax
  '0048E009: push 00000001h
  '0048E00B: lea eax, [ebx+50h]
  '0048E00E: push 00000000h
  '0048E010: push eax
  '0048E011: push 00000010h
  '0048E013: push 00000000h
  '0048E015: mov [ebp-00000120h], eax
  '0048E01B: call esi
  '0048E01D: mov cx, [ebx+4Ch]
  '0048E021: push 00000000h
  '0048E023: sub cx, 0001h
  '0048E027: lea eax, [ebp-2Ch]
  '0048E02A: jo 0048E8D0h
  '0048E030: movsx edx, cx
  '0048E033: push edx
  '0048E034: push 00000001h
  '0048E036: push 00000002h
  '0048E038: push eax
  '0048E039: push 00000002h
  '0048E03B: push 00000080h
  '0048E040: call esi
  '0048E042: mov cx, [ebx+4Ch]
  '0048E046: push 00000000h
  '0048E048: imul cx, 0Eh
  '0048E04C: jo 0048E8D0h
  '0048E052: add cx, 0006h
  '0048E056: lea eax, [ebp-3Ch]
  '0048E059: jo 0048E8D0h
  '0048E05F: sub cx, 0001h
  '0048E063: jo 0048E8D0h
  '0048E069: movsx edx, cx
  '0048E06C: push edx
  '0048E06D: push 00000001h
  '0048E06F: push 00000011h
  '0048E071: push eax
  '0048E072: push 00000001h
  '0048E074: push 00000080h
  '0048E079: call esi
  '0048E07B: mov ecx, [ebp-3Ch]
  '0048E07E: add esp, 00000054h
  '0048E081: lea edx, [ebp-5Ch]
  '0048E084: push ecx
  '0048E085: push edx
  '0048E086: call [004012F8h]
  '0048E08C: mov ecx, [ebp-5Ch]
  '0048E08F: test ecx, ecx
  '0048E091: jz 48E0B2h
  '0048E093: cmp word ptr [ecx], 0001h
  '0048E097: jnz 48E0B2h
  '0048E099: mov esi, [ecx+14h]
  '0048E09C: mov eax, [ecx+10h]
  '0048E09F: neg esi
  '0048E0A1: cmp esi, eax
  '0048E0A3: jb 48E0AEh
  '0048E0A5: call [00401170h]
  '0048E0AB: mov ecx, [ebp-5Ch]
  '0048E0AE: mov eax, esi
  '0048E0B0: jmp 48E0BBh
  '0048E0B2: call [00401170h]
  '0048E0B8: mov ecx, [ebp-5Ch]
  '0048E0BB: mov esi, [ebp+08h]
  '0048E0BE: mov ecx, [ecx+0Ch]
  '0048E0C1: mov dx, [esi+4Ch]
  '0048E0C5: imul dx, 0Eh
  '0048E0C9: jo 0048E8D0h
  '0048E0CF: add dx, 0006h
  '0048E0D3: jo 0048E8D0h
  '0048E0D9: movsx edx, dx
  '0048E0DC: push edx
  '0048E0DD: add ecx, eax
  '0048E0DF: push edi
  '0048E0E0: push ecx
  '0048E0E1: call 004101ECh
  '0048E0E6: call [004010A4h]
  '0048E0EC: lea edx, [ebp-5Ch]
  '0048E0EF: push edx
  '0048E0F0: call [00401378h]
  '0048E0F6: mov ax, [esi+4Ch]
  '0048E0FA: sub ax, 0001h
  '0048E0FE: jo 0048E8D0h
  '0048E104: movsx ecx, ax
  '0048E107: mov [ebp-00000104h], ecx
  '0048E10D: xor ebx, ebx
  '0048E10F: cmp ebx, [ebp-00000104h]
  '0048E115: jnle 0048E244h
  '0048E11B: mov edx, [ebp-3Ch]
  '0048E11E: lea eax, [ebp-5Ch]
  '0048E121: push edx
  '0048E122: push eax
  '0048E123: call [004012F8h]
  '0048E129: mov ecx, [ebp-5Ch]
  '0048E12C: test ecx, ecx
  '0048E12E: jz 48E163h
  '0048E130: cmp word ptr [ecx], 0001h
  '0048E134: jnz 48E163h
  '0048E136: mov esi, ebx
  '0048E138: mov edx, [ecx+14h]
  '0048E13B: imul esi, 0Eh
  '0048E13E: mov eax, [ecx+10h]
  '0048E141: jo 0048E8D0h
  '0048E147: add esi, 00000006h
  '0048E14A: jo 0048E8D0h
  '0048E150: sub esi, edx
  '0048E152: cmp esi, eax
  '0048E154: jb 48E15Fh
  '0048E156: call [00401170h]
  '0048E15C: mov ecx, [ebp-5Ch]
  '0048E15F: mov eax, esi
  '0048E161: jmp 48E16Ch
  '0048E163: call [00401170h]
  '0048E169: mov ecx, [ebp-5Ch]
  '0048E16C: mov ecx, [ecx+0Ch]
  '0048E16F: push 0000000Eh
  '0048E171: add ecx, eax
  '0048E173: lea edx, [ebp-50h]
  '0048E176: push ecx
  '0048E177: push edx
  '0048E178: call 004101ECh
  '0048E17D: mov edi, [004010A4h]
  '0048E183: call edi
  '0048E185: lea eax, [ebp-5Ch]
  '0048E188: push eax
  '0048E189: call [00401378h]
  '0048E18F: mov ecx, [ebp-2Ch]
  '0048E192: test ecx, ecx
  '0048E194: jz 48E1B8h
  '0048E196: cmp word ptr [ecx], 0001h
  '0048E19A: jnz 48E1B8h
  '0048E19C: mov edx, [ecx+14h]
  '0048E19F: mov eax, [ecx+10h]
  '0048E1A2: mov esi, ebx
  '0048E1A4: sub esi, edx
  '0048E1A6: cmp esi, eax
  '0048E1A8: jb 48E1B3h
  '0048E1AA: call [00401170h]
  '0048E1B0: mov ecx, [ebp-2Ch]
  '0048E1B3: lea eax, [esi+esi]
  '0048E1B6: jmp 48E1C1h
  '0048E1B8: call [00401170h]
  '0048E1BE: mov ecx, [ebp-2Ch]
  '0048E1C1: mov ecx, [ecx+0Ch]
  '0048E1C4: mov dx, [ebp-44h]
  '0048E1C8: mov [ecx+eax], dx
  '0048E1CC: mov eax, [ebp-00000120h]
  '0048E1D2: lea edx, [ebp-5Ch]
  '0048E1D5: mov ecx, [eax]
  '0048E1D7: push ecx
  '0048E1D8: push edx
  '0048E1D9: call [004012F8h]
  '0048E1DF: mov ecx, [ebp-5Ch]
  '0048E1E2: test ecx, ecx
  '0048E1E4: jz 48E20Ah
  '0048E1E6: cmp word ptr [ecx], 0001h
  '0048E1EA: jnz 48E20Ah
  '0048E1EC: mov edx, [ecx+14h]
  '0048E1EF: mov eax, [ecx+10h]
  '0048E1F2: mov esi, ebx
  '0048E1F4: sub esi, edx
  '0048E1F6: cmp esi, eax
  '0048E1F8: jb 48E203h
  '0048E1FA: call [00401170h]
  '0048E200: mov ecx, [ebp-5Ch]
  '0048E203: shl esi, 04h
  '0048E206: mov eax, esi
  '0048E208: jmp 48E213h
  '0048E20A: call [00401170h]
  '0048E210: mov ecx, [ebp-5Ch]
  '0048E213: mov ecx, [ecx+0Ch]
  '0048E216: lea edx, [ebp-50h]
  '0048E219: push 0000000Eh
  '0048E21B: add ecx, eax
  '0048E21D: push edx
  '0048E21E: push ecx
  '0048E21F: call 004101ECh
  '0048E224: call edi
  '0048E226: lea edx, [ebp-5Ch]
  '0048E229: push edx
  '0048E22A: call [00401378h]
  '0048E230: mov eax, 00000001h
  '0048E235: add eax, ebx
  '0048E237: jo 0048E8D0h
  '0048E23D: mov ebx, eax
  '0048E23F: jmp 0048E10Fh
  '0048E244: mov eax, [ebp+08h]
  '0048E247: mov edx, [ebp-00000120h]
  '0048E24D: mov cx, [eax+4Ch]
  '0048E251: mov eax, [edx]
  '0048E253: imul cx, 10h
  '0048E257: jo 0048E8D0h
  '0048E25D: add cx, 0006h
  '0048E261: jo 0048E8D0h
  '0048E267: test eax, eax
  '0048E269: movsx edi, cx
  '0048E26C: jz 48E28Dh
  '0048E26E: cmp word ptr [eax], 0001h
  '0048E272: jnz 48E28Dh
  '0048E274: mov esi, [eax+14h]
  '0048E277: mov ecx, [eax+10h]
  '0048E27A: neg esi
  '0048E27C: cmp esi, ecx
  '0048E27E: jb 48E286h
  '0048E280: call [00401170h]
  '0048E286: shl esi, 04h
  '0048E289: mov eax, esi
  '0048E28B: jmp 48E293h
  '0048E28D: call [00401170h]
  '0048E293: mov ebx, [ebp+08h]
  '0048E296: mov ecx, [ebx+50h]
  '0048E299: mov edx, [ecx+0Ch]
  '0048E29C: mov [edx+eax+0Ch], edi
  '0048E2A0: mov ax, [ebx+4Ch]
  '0048E2A4: sub ax, 0001h
  '0048E2A8: mov edi, 00000001h
  '0048E2AD: jo 0048E8D0h
  '0048E2B3: movsx ecx, ax
  '0048E2B6: mov [ebp-0000010Ch], ecx
  '0048E2BC: cmp edi, [ebp-0000010Ch]
  '0048E2C2: jnle 0048E3ACh
  '0048E2C8: mov eax, [ebx+50h]
  '0048E2CB: add ebx, 00000050h
  '0048E2CE: test eax, eax
  '0048E2D0: jz 48E300h
  '0048E2D2: cmp word ptr [eax], 0001h
  '0048E2D6: jnz 48E300h
  '0048E2D8: mov edx, [eax+14h]
  '0048E2DB: mov ecx, [eax+10h]
  '0048E2DE: mov esi, edi
  '0048E2E0: sub esi, 00000001h
  '0048E2E3: jo 0048E8D0h
  '0048E2E9: sub esi, edx
  '0048E2EB: cmp esi, ecx
  '0048E2ED: jb 48E2F5h
  '0048E2EF: call [00401170h]
  '0048E2F5: shl esi, 04h
  '0048E2F8: mov [ebp-00000124h], esi
  '0048E2FE: jmp 48E30Ch
  '0048E300: call [00401170h]
  '0048E306: mov [ebp-00000124h], eax
  '0048E30C: mov eax, [ebx]
  '0048E30E: test eax, eax
  '0048E310: jz 48E33Ah
  '0048E312: cmp word ptr [eax], 0001h
  '0048E316: jnz 48E33Ah
  '0048E318: mov edx, [eax+14h]
  '0048E31B: mov ecx, [eax+10h]
  '0048E31E: mov esi, edi
  '0048E320: sub esi, 00000001h
  '0048E323: jo 0048E8D0h
  '0048E329: sub esi, edx
  '0048E32B: cmp esi, ecx
  '0048E32D: jb 48E335h
  '0048E32F: call [00401170h]
  '0048E335: shl esi, 04h
  '0048E338: jmp 48E342h
  '0048E33A: call [00401170h]
  '0048E340: mov esi, eax
  '0048E342: mov eax, [ebx]
  '0048E344: test eax, eax
  '0048E346: jz 48E369h
  '0048E348: cmp word ptr [eax], 0001h
  '0048E34C: jnz 48E369h
  '0048E34E: mov edx, [eax+14h]
  '0048E351: mov ecx, [eax+10h]
  '0048E354: mov ebx, edi
  '0048E356: sub ebx, edx
  '0048E358: cmp ebx, ecx
  '0048E35A: jb 48E362h
  '0048E35C: call [00401170h]
  '0048E362: shl ebx, 04h
  '0048E365: mov eax, ebx
  '0048E367: jmp 48E36Fh
  '0048E369: call [00401170h]
  '0048E36F: mov edx, [ebp+08h]
  '0048E372: lea ecx, [edx+50h]
  '0048E375: mov ecx, [edx+50h]
  '0048E378: mov ecx, [ecx+0Ch]
  '0048E37B: mov edx, [esi+ecx+08h]
  '0048E37F: mov esi, [ebp-00000124h]
  '0048E385: mov ebx, [esi+ecx+0Ch]
  '0048E389: add edx, ebx
  '0048E38B: mov ebx, [ebp+08h]
  '0048E38E: jo 0048E8D0h
  '0048E394: mov [eax+ecx+0Ch], edx
  '0048E398: mov eax, 00000001h
  '0048E39D: add eax, edi
  '0048E39F: jo 0048E8D0h
  '0048E3A5: mov edi, eax
  '0048E3A7: jmp 0048E2BCh
  '0048E3AC: mov ax, [ebx+4Ch]
  '0048E3B0: push 00000000h
  '0048E3B2: sub ax, 0001h
  '0048E3B6: lea edx, [ebx+54h]
  '0048E3B9: jo 0048E8D0h
  '0048E3BF: movsx ecx, ax
  '0048E3C2: push ecx
  '0048E3C3: push 00000001h
  '0048E3C5: push 004121DCh
  '0048E3CA: push edx
  '0048E3CB: push 00000004h
  '0048E3CD: push 00000000h
  '0048E3CF: call [004011E4h]
  '0048E3D5: mov ax, [ebx+4Ch]
  '0048E3D9: add esp, 0000001Ch
  '0048E3DC: sub ax, 0001h
  '0048E3E0: jo 0048E8D0h
  '0048E3E6: movsx ecx, ax
  '0048E3E9: xor esi, esi
  '0048E3EB: mov [ebp-00000114h], ecx
  '0048E3F1: mov [ebp-58h], esi
  '0048E3F4: mov eax, [ebp-00000114h]
  '0048E3FA: mov edi, [00401348h]
  '0048E400: cmp esi, eax
  '0048E402: jnle 0048E67Dh
  '0048E408: mov ecx, [ebp-2Ch]
  '0048E40B: test ecx, ecx
  '0048E40D: jz 48E42Fh
  '0048E40F: cmp word ptr [ecx], 0001h
  '0048E413: jnz 48E42Fh
  '0048E415: mov edx, [ecx+14h]
  '0048E418: mov eax, [ecx+10h]
  '0048E41B: sub esi, edx
  '0048E41D: cmp esi, eax
  '0048E41F: jb 48E42Ah
  '0048E421: call [00401170h]
  '0048E427: mov ecx, [ebp-2Ch]
  '0048E42A: lea eax, [esi+esi]
  '0048E42D: jmp 48E438h
  '0048E42F: call [00401170h]
  '0048E435: mov ecx, [ebp-2Ch]
  '0048E438: mov edx, [ecx+0Ch]
  '0048E43B: push 00414210h
  '0048E440: mov ax, [edx+eax]
  '0048E444: push eax
  '0048E445: call [0040100Ch]
  '0048E44B: mov edx, eax
  '0048E44D: lea ecx, [ebp-64h]
  '0048E450: call edi
  '0048E452: push eax
  '0048E453: call [00401094h]
  '0048E459: mov edx, eax
  '0048E45B: lea ecx, [ebp-24h]
  '0048E45E: call edi
  '0048E460: lea ecx, [ebp-64h]
  '0048E463: call [0040138Ch]
  '0048E469: mov ecx, [ebp-24h]
  '0048E46C: push 00000003h
  '0048E46E: lea edx, [ebp-64h]
  '0048E471: push ecx
  '0048E472: push edx
  '0048E473: call [0040130Ch]
  '0048E479: push eax
  '0048E47A: mov eax, [ebp-1Ch]
  '0048E47D: push eax
  '0048E47E: call 00412510h
  '0048E483: mov esi, eax
  '0048E485: call [004010A4h]
  '0048E48B: mov ecx, [ebp-64h]
  '0048E48E: lea edx, [ebp-24h]
  '0048E491: push ecx
  '0048E492: push edx
  '0048E493: call [00401228h]
  '0048E499: lea ecx, [ebp-64h]
  '0048E49C: call [0040138Ch]
  '0048E4A2: test esi, esi
  '0048E4A4: jz 0048E66Ah
  '0048E4AA: mov edi, [ebp-1Ch]
  '0048E4AD: push esi
  '0048E4AE: push edi
  '0048E4AF: call 0041245Ch
  '0048E4B4: mov ebx, eax
  '0048E4B6: call [004010A4h]
  '0048E4BC: test ebx, ebx
  '0048E4BE: mov [ebp-28h], ebx
  '0048E4C1: jz 0048E673h
  '0048E4C7: push esi
  '0048E4C8: push edi
  '0048E4C9: call 00412558h
  '0048E4CE: mov ebx, eax
  '0048E4D0: call [004010A4h]
  '0048E4D6: test ebx, ebx
  '0048E4D8: mov [ebp-20h], ebx
  '0048E4DB: jle 0048E646h
  '0048E4E1: mov edi, [ebp+08h]
  '0048E4E4: mov eax, [edi+50h]
  '0048E4E7: test eax, eax
  '0048E4E9: jz 48E50Dh
  '0048E4EB: cmp word ptr [eax], 0001h
  '0048E4EF: jnz 48E50Dh
  '0048E4F1: mov esi, [ebp-58h]
  '0048E4F4: mov edx, [eax+14h]
  '0048E4F7: mov ecx, [eax+10h]
  '0048E4FA: sub esi, edx
  '0048E4FC: cmp esi, ecx
  '0048E4FE: jb 48E506h
  '0048E500: call [00401170h]
  '0048E506: shl esi, 04h
  '0048E509: mov eax, esi
  '0048E50B: jmp 48E513h
  '0048E50D: call [00401170h]
  '0048E513: mov ecx, [edi+50h]
  '0048E516: mov edx, [ecx+0Ch]
  '0048E519: cmp ebx, [edx+eax+08h]
  '0048E51D: jnz 0048E646h
  '0048E523: mov eax, [ebp-28h]
  '0048E526: push eax
  '0048E527: call 004124A4h
  '0048E52C: mov esi, eax
  '0048E52E: mov [ebp-000000E0h], esi
  '0048E534: call [004010A4h]
  '0048E53A: test esi, esi
  '0048E53C: jz 0048E673h
  '0048E542: mov eax, [edi+54h]
  '0048E545: test eax, eax
  '0048E547: jz 48E56Fh
  '0048E549: cmp word ptr [eax], 0001h
  '0048E54D: jnz 48E56Fh
  '0048E54F: mov esi, [ebp-58h]
  '0048E552: mov edx, [eax+14h]
  '0048E555: mov ecx, [eax+10h]
  '0048E558: mov ebx, [00401170h]
  '0048E55E: sub esi, edx
  '0048E560: cmp esi, ecx
  '0048E562: jb 48E566h
  '0048E564: call ebx
  '0048E566: lea eax, [esi*4]
  '0048E56D: jmp 48E577h
  '0048E56F: mov ebx, [00401170h]
  '0048E575: call ebx
  '0048E577: mov ecx, [ebp-20h]
  '0048E57A: mov edx, [edi+54h]
  '0048E57D: sub ecx, 00000001h
  '0048E580: push 00000000h
  '0048E582: jo 0048E8D0h
  '0048E588: push ecx
  '0048E589: mov ecx, [edx+0Ch]
  '0048E58C: push 00000001h
  '0048E58E: add ecx, eax
  '0048E590: push 00000011h
  '0048E592: push ecx
  '0048E593: push 00000001h
  '0048E595: push 00000080h
  '0048E59A: call [004011BCh]
  '0048E5A0: mov edx, [edi+54h]
  '0048E5A3: mov edi, [004012F8h]
  '0048E5A9: add esp, 0000001Ch
  '0048E5AC: lea eax, [ebp-60h]
  '0048E5AF: push edx
  '0048E5B0: push eax
  '0048E5B1: call edi
  '0048E5B3: mov ecx, [ebp-60h]
  '0048E5B6: test ecx, ecx
  '0048E5B8: jz 48E5DDh
  '0048E5BA: cmp word ptr [ecx], 0001h
  '0048E5BE: jnz 48E5DDh
  '0048E5C0: mov esi, [ebp-58h]
  '0048E5C3: mov edx, [ecx+14h]
  '0048E5C6: mov eax, [ecx+10h]
  '0048E5C9: sub esi, edx
  '0048E5CB: cmp esi, eax
  '0048E5CD: jb 48E5D4h
  '0048E5CF: call ebx
  '0048E5D1: mov ecx, [ebp-60h]
  '0048E5D4: lea eax, [esi*4]
  '0048E5DB: jmp 48E5E2h
  '0048E5DD: call ebx
  '0048E5DF: mov ecx, [ebp-60h]
  '0048E5E2: mov ecx, [ecx+0Ch]
  '0048E5E5: mov edx, [ecx+eax]
  '0048E5E8: lea eax, [ebp-5Ch]
  '0048E5EB: push edx
  '0048E5EC: push eax
  '0048E5ED: call edi
  '0048E5EF: mov ecx, [ebp-5Ch]
  '0048E5F2: test ecx, ecx
  '0048E5F4: jz 48E611h
  '0048E5F6: cmp word ptr [ecx], 0001h
  '0048E5FA: jnz 48E611h
  '0048E5FC: mov esi, [ecx+14h]
  '0048E5FF: mov eax, [ecx+10h]
  '0048E602: neg esi
  '0048E604: cmp esi, eax
  '0048E606: jb 48E60Dh
  '0048E608: call ebx
  '0048E60A: mov ecx, [ebp-5Ch]
  '0048E60D: mov eax, esi
  '0048E60F: jmp 48E616h
  '0048E611: call ebx
  '0048E613: mov ecx, [ebp-5Ch]
  '0048E616: mov edx, [ebp-20h]
  '0048E619: mov ecx, [ecx+0Ch]
  '0048E61C: push edx
  '0048E61D: mov edx, [ebp-000000E0h]
  '0048E623: add ecx, eax
  '0048E625: push edx
  '0048E626: push ecx
  '0048E627: call 004101ECh
  '0048E62C: call [004010A4h]
  '0048E632: mov esi, [00401378h]
  '0048E638: lea edx, [ebp-5Ch]
  '0048E63B: push edx
  '0048E63C: call esi
  '0048E63E: lea eax, [ebp-60h]
  '0048E641: push eax
  '0048E642: call esi
  '0048E644: jmp 48E64Dh
  '0048E646: mov [ebp-18h], FFFFFFFFh
  '0048E64D: mov ecx, [ebp-58h]
  '0048E650: mov ebx, [ebp+08h]
  '0048E653: mov eax, 00000001h
  '0048E658: add eax, ecx
  '0048E65A: jo 0048E8D0h
  '0048E660: mov [ebp-58h], eax
  '0048E663: mov esi, eax
  '0048E665: jmp 0048E3F4h
  '0048E66A: mov [ebp-18h], FFFFFFFFh
  '0048E671: jmp 48E67Dh
  '0048E673: mov ebx, [ebp+08h]
  '0048E676: mov [ebp-18h], FFFFFFFFh
  '0048E67D: cmp word ptr [ebp-18h], 0000h
  '0048E682: jz 0048E812h
  '0048E688: mov eax, [4A0F98h]
  '0048E68D: test eax, eax
  '0048E68F: jnz 48E6A1h
  '0048E691: push 004A0F98h
  '0048E696: push 0040FFF4h
  '0048E69B: call [004012A8h]
  '0048E6A1: mov esi, [004A0F98h]
  '0048E6A7: lea edx, [ebp-68h]
  '0048E6AA: push edx
  '0048E6AB: push esi
  '0048E6AC: mov ecx, [esi]
  '0048E6AE: call [ecx+14h]
  '0048E6B1: test eax, eax
  '0048E6B3: fclex 
  '0048E6B5: jnl 48E6C6h
  '0048E6B7: push 00000014h
  '0048E6B9: push 0040FFE4h
  '0048E6BE: push esi
  '0048E6BF: push eax
  '0048E6C0: call [004010A8h]
  '0048E6C6: mov eax, [ebp-68h]
  '0048E6C9: lea edx, [ebp-64h]
  '0048E6CC: push edx
  '0048E6CD: push eax
  '0048E6CE: mov ecx, [eax]
  '0048E6D0: mov esi, eax
  '0048E6D2: call [ecx+58h]
  '0048E6D5: test eax, eax
  '0048E6D7: fclex 
  '0048E6D9: jnl 48E6EAh
  '0048E6DB: push 00000058h
  '0048E6DD: push 00410004h
  '0048E6E2: push esi
  '0048E6E3: push eax
  '0048E6E4: call [004010A8h]
  '0048E6EA: call [004012E0h]
  '0048E6F0: push eax
  '0048E6F1: lea eax, [ebp-6Ch]
  '0048E6F4: push eax
  '0048E6F5: call [004010F0h]
  '0048E6FB: mov ecx, 80020004h
  '0048E700: mov esi, eax
  '0048E702: mov [ebp-000000A4h], ecx
  '0048E708: mov eax, 0000000Ah
  '0048E70D: mov [ebp-00000094h], ecx
  '0048E713: mov edi, 00000008h
  '0048E718: lea edx, [ebp-000000BCh]
  '0048E71E: lea ecx, [ebp-0000008Ch]
  '0048E724: mov [ebp-000000ACh], eax
  '0048E72A: mov [ebp-0000009Ch], eax
  '0048E730: mov [ebp-000000B4h], 00421848h
  '0048E73A: mov [ebp-000000BCh], edi
  '0048E740: call [00401308h]
  '0048E746: mov ecx, [ebp-64h]
  '0048E749: push ecx
  '0048E74A: push 00421780h
  '0048E74F: call [00401094h]
  '0048E755: mov [ebp-74h], eax
  '0048E758: lea eax, [ebp-000000ACh]
  '0048E75E: lea ecx, [ebp-0000009Ch]
  '0048E764: push eax
  '0048E765: push ecx
  '0048E766: lea eax, [ebp-0000008Ch]
  '0048E76C: lea ecx, [ebp-7Ch]
  '0048E76F: push eax
  '0048E770: mov [ebp-7Ch], edi
  '0048E773: mov edx, [esi]
  '0048E775: push ecx
  '0048E776: push 80040421h
  '0048E77B: push esi
  '0048E77C: call [edx+44h]
  '0048E77F: xor edi, edi
  '0048E781: cmp eax, edi
  '0048E783: fclex 
  '0048E785: jnl 48E796h
  '0048E787: push 00000044h
  '0048E789: push 00411C80h
  '0048E78E: push esi
  '0048E78F: push eax
  '0048E790: call [004010A8h]
  '0048E796: lea ecx, [ebp-64h]
  '0048E799: call [0040138Ch]
  '0048E79F: lea edx, [ebp-6Ch]
  '0048E7A2: lea eax, [ebp-68h]
  '0048E7A5: push edx
  '0048E7A6: push eax
  '0048E7A7: push 00000002h
  '0048E7A9: call [0040106Ch]
  '0048E7AF: lea ecx, [ebp-000000ACh]
  '0048E7B5: lea edx, [ebp-0000009Ch]
  '0048E7BB: push ecx
  '0048E7BC: lea eax, [ebp-0000008Ch]
  '0048E7C2: push edx
  '0048E7C3: lea ecx, [ebp-7Ch]
  '0048E7C6: push eax
  '0048E7C7: push ecx
  '0048E7C8: push 00000004h
  '0048E7CA: call [00401058h]
  '0048E7D0: add esp, 00000020h
  '0048E7D3: mov edx, 0040FE84h
  '0048E7D8: lea ecx, [ebp-34h]
  '0048E7DB: call [004012C4h]
  '0048E7E1: mov esi, [0040113Ch]
  '0048E7E7: lea edx, [ebx+50h]
  '0048E7EA: push edx
  '0048E7EB: push edi
  '0048E7EC: call esi
  '0048E7EE: lea eax, [ebx+54h]
  '0048E7F1: push eax
  '0048E7F2: push 004121DCh
  '0048E7F7: call esi
  '0048E7F9: lea edx, [ebp-000000BCh]
  '0048E7FF: lea ecx, [ebx+38h]
  '0048E802: mov [ebx+4Ch], di
  '0048E806: mov [ebp-000000BCh], edi
  '0048E80C: call [00401024h]
  '0048E812: mov eax, [ebp-18h]
  '0048E815: not eax
  '0048E817: mov [ebp-38h], eax
  '0048E81A: mov ecx, [ebp-1Ch]
  '0048E81D: push ecx
  '0048E81E: call 00412414h
  '0048E823: call [004010A4h]
  '0048E829: push 0048E8A7h
  '0048E82E: jmp 48E880h
  '0048E830: mov esi, [00401378h]
  '0048E836: lea edx, [ebp-5Ch]
  '0048E839: push edx
  '0048E83A: call esi
  '0048E83C: lea eax, [ebp-60h]
  '0048E83F: push eax
  '0048E840: call esi
  '0048E842: lea ecx, [ebp-64h]
  '0048E845: call [0040138Ch]
  '0048E84B: lea ecx, [ebp-6Ch]
  '0048E84E: lea edx, [ebp-68h]
  '0048E851: push ecx
  '0048E852: push edx
  '0048E853: push 00000002h
  '0048E855: call [0040106Ch]
  '0048E85B: lea eax, [ebp-000000ACh]
  '0048E861: lea ecx, [ebp-0000009Ch]
  '0048E867: push eax
  '0048E868: lea edx, [ebp-0000008Ch]
  '0048E86E: push ecx
  '0048E86F: lea eax, [ebp-7Ch]
  '0048E872: push edx
  '0048E873: push eax
  '0048E874: push 00000004h
  '0048E876: call [00401058h]
  '0048E87C: add esp, 00000020h
  '0048E87F: ret 
End Sub
Private Sub unknown_48E8E0
  '0048E8E0: push ebp
  '0048E8E1: mov ebp, esp
  '0048E8E3: sub esp, 0000000Ch
  '0048E8E6: push 00403796h
  '0048E8EB: mov eax, fs:[00h]
  '0048E8F1: push eax
  '0048E8F2: mov fs:[00000000h], esp
  '0048E8F9: sub esp, 00000110h
  '0048E8FF: push ebx
  '0048E900: push esi
  '0048E901: push edi
  '0048E902: mov [ebp-0Ch], esp
  '0048E905: mov [ebp-08h], 00402B60h
  '0048E90C: xor edi, edi
  '0048E90E: mov [ebp-04h], edi
  '0048E911: mov ebx, [ebp+08h]
  '0048E914: push ebx
  '0048E915: mov eax, [ebx]
  '0048E917: call [eax+04h]
  '0048E91A: mov edx, [ebp+0Ch]
  '0048E91D: mov esi, [004012C4h]
  '0048E923: lea ecx, [ebp-54h]
  '0048E926: mov [ebp-44h], edi
  '0048E929: mov [ebp-50h], edi
  '0048E92C: mov [ebp-54h], edi
  '0048E92F: mov [ebp-5Ch], edi
  '0048E932: mov [ebp-60h], edi
  '0048E935: mov [ebp-68h], edi
  '0048E938: mov [ebp-6Ch], edi
  '0048E93B: mov [ebp-70h], edi
  '0048E93E: mov [ebp-74h], edi
  '0048E941: mov [ebp-78h], edi
  '0048E944: mov [ebp-7Ch], edi
  '0048E947: mov [ebp-80h], edi
  '0048E94A: mov [ebp-00000090h], edi
  '0048E950: mov [ebp-000000A0h], edi
  '0048E956: mov [ebp-000000B0h], edi
  '0048E95C: mov [ebp-000000C0h], edi
  '0048E962: mov [ebp-000000D0h], edi
  '0048E968: call esi
  '0048E96A: mov edx, [ebp-54h]
  '0048E96D: lea ecx, [ebx+34h]
  '0048E970: call esi
  '0048E972: lea edx, [ebp-000000D0h]
  '0048E978: lea ecx, [ebx+38h]
  '0048E97B: mov [ebp-000000D0h], edi
  '0048E981: call [00401024h]
  '0048E987: mov esi, [0040113Ch]
  '0048E98D: lea eax, [ebx+50h]
  '0048E990: push eax
  '0048E991: push edi
  '0048E992: mov [ebp-0000011Ch], eax
  '0048E998: call esi
  '0048E99A: lea ecx, [ebx+54h]
  '0048E99D: push ecx
  '0048E99E: push 004121DCh
  '0048E9A3: call esi
  '0048E9A5: mov edx, [ebp-54h]
  '0048E9A8: push edi
  '0048E9A9: push 00000080h
  '0048E9AE: push 00000003h
  '0048E9B0: push edi
  '0048E9B1: push edi
  '0048E9B2: lea esi, [ebx+48h]
  '0048E9B5: push 80000000h
  '0048E9BA: lea eax, [ebp-70h]
  '0048E9BD: push edx
  '0048E9BE: push eax
  '0048E9BF: mov [esi+04h], di
  '0048E9C3: mov [esi], di
  '0048E9C6: mov [esi+02h], di
  '0048E9CA: call [0040130Ch]
  '0048E9D0: push eax
  '0048E9D1: call 00412288h
  '0048E9D6: mov [ebp-000000E4h], eax
  '0048E9DC: call [004010A4h]
  '0048E9E2: mov ecx, [ebp-70h]
  '0048E9E5: lea edx, [ebp-54h]
  '0048E9E8: push ecx
  '0048E9E9: push edx
  '0048E9EA: call [00401228h]
  '0048E9F0: lea ecx, [ebp-70h]
  '0048E9F3: call [0040138Ch]
  '0048E9F9: mov eax, [ebp-000000E4h]
  '0048E9FF: cmp eax, edi
  '0048EA01: jz 0048EFB3h
  '0048EA07: lea ecx, [ebp-5Ch]
  '0048EA0A: push edi
  '0048EA0B: push ecx
  '0048EA0C: push 00000006h
  '0048EA0E: push esi
  '0048EA0F: push eax
  '0048EA10: call 004122CCh
  '0048EA15: call [004010A4h]
  '0048EA1B: cmp [esi], di
  '0048EA1E: jnz 0048EFE3h
  '0048EA24: cmp word ptr [ebx+4Ah], 0001h
  '0048EA29: jnz 0048EFD0h
  '0048EA2F: mov ax, [ebx+4Ch]
  '0048EA33: cmp ax, di
  '0048EA36: jle 0048EFBDh
  '0048EA3C: sub ax, 0001h
  '0048EA40: push edi
  '0048EA41: jo 0048F08Eh
  '0048EA47: movsx edx, ax
  '0048EA4A: mov eax, [ebp-0000011Ch]
  '0048EA50: push edx
  '0048EA51: push 00000001h
  '0048EA53: push edi
  '0048EA54: push eax
  '0048EA55: push 00000010h
  '0048EA57: push edi
  '0048EA58: call [004011E4h]
  '0048EA5E: movsx ecx, word ptr [ebx+4Ch]
  '0048EA62: add esp, 0000001Ch
  '0048EA65: mov [ebp-00000108h], ecx
  '0048EA6B: mov edi, 00000001h
  '0048EA70: cmp edi, [ebp-00000108h]
  '0048EA76: jnle 0048EB25h
  '0048EA7C: mov edx, [ebp-0000011Ch]
  '0048EA82: lea ecx, [ebp-68h]
  '0048EA85: mov eax, [edx]
  '0048EA87: push eax
  '0048EA88: push ecx
  '0048EA89: call [004012F8h]
  '0048EA8F: mov ecx, [ebp-68h]
  '0048EA92: test ecx, ecx
  '0048EA94: jz 48EAC3h
  '0048EA96: cmp word ptr [ecx], 0001h
  '0048EA9A: jnz 48EAC3h
  '0048EA9C: mov edx, [ecx+14h]
  '0048EA9F: mov eax, [ecx+10h]
  '0048EAA2: mov esi, edi
  '0048EAA4: sub esi, 00000001h
  '0048EAA7: jo 0048F08Eh
  '0048EAAD: sub esi, edx
  '0048EAAF: cmp esi, eax
  '0048EAB1: jb 48EABCh
  '0048EAB3: call [00401170h]
  '0048EAB9: mov ecx, [ebp-68h]
  '0048EABC: shl esi, 04h
  '0048EABF: mov eax, esi
  '0048EAC1: jmp 48EACCh
  '0048EAC3: call [00401170h]
  '0048EAC9: mov ecx, [ebp-68h]
  '0048EACC: mov ecx, [ecx+0Ch]
  '0048EACF: lea edx, [ebp-5Ch]
  '0048EAD2: push 00000000h
  '0048EAD4: push edx
  '0048EAD5: mov edx, [ebp-000000E4h]
  '0048EADB: add ecx, eax
  '0048EADD: push 00000010h
  '0048EADF: push ecx
  '0048EAE0: push edx
  '0048EAE1: call 004122CCh
  '0048EAE6: call [004010A4h]
  '0048EAEC: lea eax, [ebp-68h]
  '0048EAEF: push eax
  '0048EAF0: call [00401378h]
  '0048EAF6: cmp [ebp-5Ch], 00000010h
  '0048EAFA: jnz 48EB10h
  '0048EAFC: mov eax, 00000001h
  '0048EB01: add eax, edi
  '0048EB03: jo 0048F08Eh
  '0048EB09: mov edi, eax
  '0048EB0B: jmp 0048EA70h
  '0048EB10: mov edx, 00421214h
  '0048EB15: lea ecx, [ebp-50h]
  '0048EB18: call [004012C4h]
  '0048EB1E: mov [ebp-44h], FFFFFFFFh
  '0048EB25: cmp word ptr [ebp-44h], 0000h
  '0048EB2A: jnz 0048EE17h
  '0048EB30: mov cx, [ebx+4Ch]
  '0048EB34: push 00000000h
  '0048EB36: sub cx, 0001h
  '0048EB3A: lea eax, [ebx+54h]
  '0048EB3D: jo 0048F08Eh
  '0048EB43: movsx edx, cx
  '0048EB46: push edx
  '0048EB47: push 00000001h
  '0048EB49: push 004121DCh
  '0048EB4E: push eax
  '0048EB4F: push 00000004h
  '0048EB51: push 00000000h
  '0048EB53: mov [ebp-00000120h], eax
  '0048EB59: call [004011E4h]
  '0048EB5F: movsx eax, word ptr [ebx+4Ch]
  '0048EB63: mov edi, 00000001h
  '0048EB68: add esp, 0000001Ch
  '0048EB6B: mov [ebp-00000110h], eax
  '0048EB71: mov [ebp-64h], edi
  '0048EB74: cmp edi, [ebp-00000110h]
  '0048EB7A: jnle 0048EE0Fh
  '0048EB80: mov ecx, [ebp-0000011Ch]
  '0048EB86: mov eax, [ecx]
  '0048EB88: test eax, eax
  '0048EB8A: jz 48EBB6h
  '0048EB8C: cmp word ptr [eax], 0001h
  '0048EB90: jnz 48EBB6h
  '0048EB92: mov edx, [eax+14h]
  '0048EB95: mov ecx, [eax+10h]
  '0048EB98: mov esi, edi
  '0048EB9A: sub esi, 00000001h
  '0048EB9D: jo 0048F08Eh
  '0048EBA3: sub esi, edx
  '0048EBA5: cmp esi, ecx
  '0048EBA7: jb 48EBAFh
  '0048EBA9: call [00401170h]
  '0048EBAF: shl esi, 04h
  '0048EBB2: mov eax, esi
  '0048EBB4: jmp 48EBBCh
  '0048EBB6: call [00401170h]
  '0048EBBC: mov esi, [ebp-0000011Ch]
  '0048EBC2: push 00000000h
  '0048EBC4: push 00000000h
  '0048EBC6: mov edx, [esi]
  '0048EBC8: mov ecx, [edx+0Ch]
  '0048EBCB: mov edx, [ecx+eax+0Ch]
  '0048EBCF: mov eax, [ebp-000000E4h]
  '0048EBD5: push edx
  '0048EBD6: push eax
  '0048EBD7: call 00412344h
  '0048EBDC: call [004010A4h]
  '0048EBE2: mov eax, [esi]
  '0048EBE4: test eax, eax
  '0048EBE6: jz 48EC10h
  '0048EBE8: cmp word ptr [eax], 0001h
  '0048EBEC: jnz 48EC10h
  '0048EBEE: mov edx, [eax+14h]
  '0048EBF1: mov ecx, [eax+10h]
  '0048EBF4: mov esi, edi
  '0048EBF6: sub esi, 00000001h
  '0048EBF9: jo 0048F08Eh
  '0048EBFF: sub esi, edx
  '0048EC01: cmp esi, ecx
  '0048EC03: jb 48EC0Bh
  '0048EC05: call [00401170h]
  '0048EC0B: shl esi, 04h
  '0048EC0E: jmp 48EC18h
  '0048EC10: call [00401170h]
  '0048EC16: mov esi, eax
  '0048EC18: mov ecx, [ebp-00000120h]
  '0048EC1E: mov eax, [ecx]
  '0048EC20: test eax, eax
  '0048EC22: jz 48EC51h
  '0048EC24: cmp word ptr [eax], 0001h
  '0048EC28: jnz 48EC51h
  '0048EC2A: mov edx, [eax+14h]
  '0048EC2D: mov ecx, [eax+10h]
  '0048EC30: sub edi, 00000001h
  '0048EC33: jo 0048F08Eh
  '0048EC39: sub edi, edx
  '0048EC3B: cmp edi, ecx
  '0048EC3D: jb 48EC45h
  '0048EC3F: call [00401170h]
  '0048EC45: lea eax, [edi*4]
  '0048EC4C: mov edi, [ebp-64h]
  '0048EC4F: jmp 48EC57h
  '0048EC51: call [00401170h]
  '0048EC57: mov ebx, [ebp-0000011Ch]
  '0048EC5D: push 00000000h
  '0048EC5F: mov edx, [ebx]
  '0048EC61: mov ecx, [edx+0Ch]
  '0048EC64: mov edx, [ecx+esi+08h]
  '0048EC68: mov ecx, [ebp-00000120h]
  '0048EC6E: push edx
  '0048EC6F: push 00000001h
  '0048EC71: mov edx, [ecx]
  '0048EC73: push 00000011h
  '0048EC75: mov ecx, [edx+0Ch]
  '0048EC78: add ecx, eax
  '0048EC7A: push ecx
  '0048EC7B: push 00000001h
  '0048EC7D: push 00000080h
  '0048EC82: call [004011E4h]
  '0048EC88: mov eax, [ebx]
  '0048EC8A: add esp, 0000001Ch
  '0048EC8D: test eax, eax
  '0048EC8F: jz 48ECBFh
  '0048EC91: cmp word ptr [eax], 0001h
  '0048EC95: jnz 48ECBFh
  '0048EC97: mov edx, [eax+14h]
  '0048EC9A: mov ecx, [eax+10h]
  '0048EC9D: mov esi, edi
  '0048EC9F: sub esi, 00000001h
  '0048ECA2: jo 0048F08Eh
  '0048ECA8: sub esi, edx
  '0048ECAA: cmp esi, ecx
  '0048ECAC: jb 48ECB4h
  '0048ECAE: call [00401170h]
  '0048ECB4: shl esi, 04h
  '0048ECB7: mov [ebp-00000124h], esi
  '0048ECBD: jmp 48ECCBh
  '0048ECBF: call [00401170h]
  '0048ECC5: mov [ebp-00000124h], eax
  '0048ECCB: mov edx, [ebp-00000120h]
  '0048ECD1: mov esi, [004012F8h]
  '0048ECD7: lea ecx, [ebp-6Ch]
  '0048ECDA: mov eax, [edx]
  '0048ECDC: push eax
  '0048ECDD: push ecx
  '0048ECDE: call esi
  '0048ECE0: mov ecx, [ebp-6Ch]
  '0048ECE3: test ecx, ecx
  '0048ECE5: jz 48ED17h
  '0048ECE7: cmp word ptr [ecx], 0001h
  '0048ECEB: jnz 48ED17h
  '0048ECED: mov edx, [ecx+14h]
  '0048ECF0: mov eax, [ecx+10h]
  '0048ECF3: sub edi, 00000001h
  '0048ECF6: jo 0048F08Eh
  '0048ECFC: sub edi, edx
  '0048ECFE: cmp edi, eax
  '0048ED00: jb 48ED0Bh
  '0048ED02: call [00401170h]
  '0048ED08: mov ecx, [ebp-6Ch]
  '0048ED0B: lea eax, [edi*4]
  '0048ED12: mov edi, [ebp-64h]
  '0048ED15: jmp 48ED20h
  '0048ED17: call [00401170h]
  '0048ED1D: mov ecx, [ebp-6Ch]
  '0048ED20: mov edx, [ecx+0Ch]
  '0048ED23: lea ecx, [ebp-68h]
  '0048ED26: mov eax, [edx+eax]
  '0048ED29: push eax
  '0048ED2A: push ecx
  '0048ED2B: call esi
  '0048ED2D: mov ecx, [ebp-68h]
  '0048ED30: test ecx, ecx
  '0048ED32: jz 48ED56h
  '0048ED34: cmp word ptr [ecx], 0001h
  '0048ED38: jnz 48ED56h
  '0048ED3A: mov edi, [ecx+14h]
  '0048ED3D: mov eax, [ecx+10h]
  '0048ED40: neg edi
  '0048ED42: cmp edi, eax
  '0048ED44: jb 48ED4Fh
  '0048ED46: call [00401170h]
  '0048ED4C: mov ecx, [ebp-68h]
  '0048ED4F: mov eax, edi
  '0048ED51: mov edi, [ebp-64h]
  '0048ED54: jmp 48ED5Fh
  '0048ED56: call [00401170h]
  '0048ED5C: mov ecx, [ebp-68h]
  '0048ED5F: mov esi, [ebp-00000124h]
  '0048ED65: lea edx, [ebp-5Ch]
  '0048ED68: push 00000000h
  '0048ED6A: mov ecx, [ecx+0Ch]
  '0048ED6D: push edx
  '0048ED6E: mov edx, [ebx]
  '0048ED70: add ecx, eax
  '0048ED72: mov edx, [edx+0Ch]
  '0048ED75: mov edx, [edx+esi+08h]
  '0048ED79: push edx
  '0048ED7A: mov edx, [ebp-000000E4h]
  '0048ED80: push ecx
  '0048ED81: push edx
  '0048ED82: call 004122CCh
  '0048ED87: call [004010A4h]
  '0048ED8D: mov esi, [00401378h]
  '0048ED93: lea eax, [ebp-68h]
  '0048ED96: push eax
  '0048ED97: call esi
  '0048ED99: lea ecx, [ebp-6Ch]
  '0048ED9C: push ecx
  '0048ED9D: call esi
  '0048ED9F: mov eax, [ebx]
  '0048EDA1: test eax, eax
  '0048EDA3: jz 48EDCFh
  '0048EDA5: cmp word ptr [eax], 0001h
  '0048EDA9: jnz 48EDCFh
  '0048EDAB: mov edx, [eax+14h]
  '0048EDAE: mov ecx, [eax+10h]
  '0048EDB1: mov esi, edi
  '0048EDB3: sub esi, 00000001h
  '0048EDB6: jo 0048F08Eh
  '0048EDBC: sub esi, edx
  '0048EDBE: cmp esi, ecx
  '0048EDC0: jb 48EDC8h
  '0048EDC2: call [00401170h]
  '0048EDC8: shl esi, 04h
  '0048EDCB: mov eax, esi
  '0048EDCD: jmp 48EDD5h
  '0048EDCF: call [00401170h]
  '0048EDD5: mov edx, [ebx]
  '0048EDD7: mov ecx, [edx+0Ch]
  '0048EDDA: mov edx, [ebp-5Ch]
  '0048EDDD: cmp edx, [ecx+eax+08h]
  '0048EDE1: jnz 48EDFAh
  '0048EDE3: mov eax, 00000001h
  '0048EDE8: add eax, edi
  '0048EDEA: jo 0048F08Eh
  '0048EDF0: mov [ebp-64h], eax
  '0048EDF3: mov edi, eax
  '0048EDF5: jmp 0048EB74h
  '0048EDFA: mov edx, 004218DCh
  '0048EDFF: lea ecx, [ebp-50h]
  '0048EE02: call [004012C4h]
  '0048EE08: mov [ebp-44h], FFFFFFFFh
  '0048EE0F: mov eax, [ebp-44h]
  '0048EE12: not eax
  '0048EE14: mov [ebp-60h], eax
  '0048EE17: xor edi, edi
  '0048EE19: mov ecx, [ebp-000000E4h]
  '0048EE1F: push ecx
  '0048EE20: call 00410830h
  '0048EE25: call [004010A4h]
  '0048EE2B: cmp [ebp-44h], di
  '0048EE2F: jz 0048EFB3h
  '0048EE35: cmp [004A0F98h], edi
  '0048EE3B: jnz 48EE4Dh
  '0048EE3D: push 004A0F98h
  '0048EE42: push 0040FFF4h
  '0048EE47: call [004012A8h]
  '0048EE4D: mov esi, [004A0F98h]
  '0048EE53: lea eax, [ebp-7Ch]
  '0048EE56: push eax
  '0048EE57: push esi
  '0048EE58: mov edx, [esi]
  '0048EE5A: call [edx+14h]
  '0048EE5D: cmp eax, edi
  '0048EE5F: fclex 
  '0048EE61: jnl 48EE72h
  '0048EE63: push 00000014h
  '0048EE65: push 0040FFE4h
  '0048EE6A: push esi
  '0048EE6B: push eax
  '0048EE6C: call [004010A8h]
  '0048EE72: mov eax, [ebp-7Ch]
  '0048EE75: lea edx, [ebp-70h]
  '0048EE78: push edx
  '0048EE79: push eax
  '0048EE7A: mov ecx, [eax]
  '0048EE7C: mov esi, eax
  '0048EE7E: call [ecx+58h]
  '0048EE81: cmp eax, edi
  '0048EE83: fclex 
  '0048EE85: jnl 48EE96h
  '0048EE87: push 00000058h
  '0048EE89: push 00410004h
  '0048EE8E: push esi
  '0048EE8F: push eax
  '0048EE90: call [004010A8h]
  '0048EE96: call [004012E0h]
  '0048EE9C: push eax
  '0048EE9D: lea eax, [ebp-80h]
  '0048EEA0: push eax
  '0048EEA1: call [004010F0h]
  '0048EEA7: mov edi, [00401094h]
  '0048EEAD: mov ecx, 80020004h
  '0048EEB2: mov [ebp-000000B8h], ecx
  '0048EEB8: mov [ebp-000000A8h], ecx
  '0048EEBE: mov ecx, [ebp-50h]
  '0048EEC1: mov esi, eax
  '0048EEC3: mov eax, 0000000Ah
  '0048EEC8: push 00421A18h
  '0048EECD: push ecx
  '0048EECE: mov [ebp-000000C0h], eax
  '0048EED4: mov [ebp-000000B0h], eax
  '0048EEDA: call edi
  '0048EEDC: mov edx, [ebp-70h]
  '0048EEDF: mov ebx, 00000008h
  '0048EEE4: push edx
  '0048EEE5: push 00421780h
  '0048EEEA: mov [ebp-00000098h], eax
  '0048EEF0: mov [ebp-000000A0h], ebx
  '0048EEF6: call edi
  '0048EEF8: lea ecx, [ebp-000000C0h]
  '0048EEFE: lea edx, [ebp-000000B0h]
  '0048EF04: push ecx
  '0048EF05: push edx
  '0048EF06: lea ecx, [ebp-000000A0h]
  '0048EF0C: lea edx, [ebp-00000090h]
  '0048EF12: push ecx
  '0048EF13: mov [ebp-00000088h], eax
  '0048EF19: mov [ebp-00000090h], ebx
  '0048EF1F: mov eax, [esi]
  '0048EF21: push edx
  '0048EF22: push 8004041Ah
  '0048EF27: push esi
  '0048EF28: call [eax+44h]
  '0048EF2B: test eax, eax
  '0048EF2D: fclex 
  '0048EF2F: jnl 48EF40h
  '0048EF31: push 00000044h
  '0048EF33: push 00411C80h
  '0048EF38: push esi
  '0048EF39: push eax
  '0048EF3A: call [004010A8h]
  '0048EF40: lea ecx, [ebp-70h]
  '0048EF43: call [0040138Ch]
  '0048EF49: lea eax, [ebp-80h]
  '0048EF4C: lea ecx, [ebp-7Ch]
  '0048EF4F: push eax
  '0048EF50: push ecx
  '0048EF51: push 00000002h
  '0048EF53: call [0040106Ch]
  '0048EF59: lea edx, [ebp-000000C0h]
  '0048EF5F: lea eax, [ebp-000000B0h]
  '0048EF65: push edx
  '0048EF66: lea ecx, [ebp-000000A0h]
  '0048EF6C: push eax
  '0048EF6D: lea edx, [ebp-00000090h]
  '0048EF73: push ecx
  '0048EF74: push edx
  '0048EF75: push 00000004h
  '0048EF77: call [00401058h]
  '0048EF7D: add esp, 00000020h
  '0048EF80: mov edx, 0040FE84h
  '0048EF85: lea ecx, [ebp-54h]
  '0048EF88: call [004012C4h]
  '0048EF8E: mov eax, [ebp+08h]
  '0048EF91: mov edi, [0040113Ch]
  '0048EF97: add eax, 00000050h
  '0048EF9A: push eax
  '0048EF9B: push 00000000h
  '0048EF9D: call edi
  '0048EF9F: mov esi, [ebp+08h]
  '0048EFA2: lea ecx, [esi+54h]
  '0048EFA5: push ecx
  '0048EFA6: push 004121DCh
  '0048EFAB: call edi
  '0048EFAD: mov word ptr [esi+4Ch], 0000h
  '0048EFB3: push 0048F065h
  '0048EFB8: jmp 0048F054h
  '0048EFBD: mov edx, 0042191Ch
  '0048EFC2: lea ecx, [ebp-50h]
  '0048EFC5: call [004012C4h]
  '0048EFCB: jmp 0048EE19h
  '0048EFD0: mov edx, 00421954h
  '0048EFD5: lea ecx, [ebp-50h]
  '0048EFD8: call [004012C4h]
  '0048EFDE: jmp 0048EE19h
  '0048EFE3: mov edx, 004219B8h
  '0048EFE8: lea ecx, [ebp-50h]
  '0048EFEB: call [004012C4h]
  '0048EFF1: jmp 0048EE19h
  '0048EFF6: mov esi, [00401378h]
  '0048EFFC: lea edx, [ebp-68h]
  '0048EFFF: push edx
  '0048F000: call esi
  '0048F002: lea eax, [ebp-6Ch]
  '0048F005: push eax
  '0048F006: call esi
  '0048F008: lea ecx, [ebp-78h]
  '0048F00B: lea edx, [ebp-74h]
  '0048F00E: push ecx
  '0048F00F: lea eax, [ebp-70h]
  '0048F012: push edx
  '0048F013: push eax
  '0048F014: push 00000003h
  '0048F016: call [004012CCh]
  '0048F01C: lea ecx, [ebp-80h]
  '0048F01F: lea edx, [ebp-7Ch]
  '0048F022: push ecx
  '0048F023: push edx
  '0048F024: push 00000002h
  '0048F026: call [0040106Ch]
  '0048F02C: lea eax, [ebp-000000C0h]
  '0048F032: lea ecx, [ebp-000000B0h]
  '0048F038: push eax
  '0048F039: lea edx, [ebp-000000A0h]
  '0048F03F: push ecx
  '0048F040: lea eax, [ebp-00000090h]
  '0048F046: push edx
  '0048F047: push eax
  '0048F048: push 00000004h
  '0048F04A: call [00401058h]
  '0048F050: add esp, 00000030h
  '0048F053: ret 
End Sub
Private Sub unknown_48F0A0
  '0048F0A0: push ebp
  '0048F0A1: mov ebp, esp
  '0048F0A3: sub esp, 0000000Ch
  '0048F0A6: push 00403796h
  '0048F0AB: mov eax, fs:[00h]
  '0048F0B1: push eax
  '0048F0B2: mov fs:[00000000h], esp
  '0048F0B9: sub esp, 00000058h
  '0048F0BC: push ebx
  '0048F0BD: push esi
  '0048F0BE: push edi
  '0048F0BF: mov [ebp-0Ch], esp
  '0048F0C2: mov [ebp-08h], 00402B70h
  '0048F0C9: xor esi, esi
  '0048F0CB: mov [ebp-04h], esi
  '0048F0CE: mov ebx, [ebp+08h]
  '0048F0D1: push ebx
  '0048F0D2: mov eax, [ebx]
  '0048F0D4: call [eax+04h]
  '0048F0D7: mov eax, [ebx+50h]
  '0048F0DA: mov [ebp-4Ch], esi
  '0048F0DD: cmp eax, esi
  '0048F0DF: mov [ebp-50h], esi
  '0048F0E2: jz 48F111h
  '0048F0E4: cmp word ptr [eax], 0001h
  '0048F0E8: jnz 48F111h
  '0048F0EA: mov edi, [ebp+0Ch]
  '0048F0ED: mov edx, [eax+14h]
  '0048F0F0: mov ecx, [eax+10h]
  '0048F0F3: mov esi, edi
  '0048F0F5: sub esi, 00000001h
  '0048F0F8: jo 0048F287h
  '0048F0FE: sub esi, edx
  '0048F100: cmp esi, ecx
  '0048F102: jb 48F10Ah
  '0048F104: call [00401170h]
  '0048F10A: shl esi, 04h
  '0048F10D: mov eax, esi
  '0048F10F: jmp 48F11Ah
  '0048F111: call [00401170h]
  '0048F117: mov edi, [ebp+0Ch]
  '0048F11A: mov ecx, [ebx+50h]
  '0048F11D: mov edx, [ecx+0Ch]
  '0048F120: cmp word ptr [edx+eax+06h], 0008h
  '0048F126: jnle 0048F24Ch
  '0048F12C: test ecx, ecx
  '0048F12E: jz 48F15Ah
  '0048F130: cmp word ptr [ecx], 0001h
  '0048F134: jnz 48F15Ah
  '0048F136: mov edx, [ecx+14h]
  '0048F139: mov eax, [ecx+10h]
  '0048F13C: mov esi, edi
  '0048F13E: sub esi, 00000001h
  '0048F141: jo 0048F287h
  '0048F147: sub esi, edx
  '0048F149: cmp esi, eax
  '0048F14B: jb 48F153h
  '0048F14D: call [00401170h]
  '0048F153: shl esi, 04h
  '0048F156: mov eax, esi
  '0048F158: jmp 48F160h
  '0048F15A: call [00401170h]
  '0048F160: mov ecx, [ebx+50h]
  '0048F163: mov edx, [ecx+0Ch]
  '0048F166: movsx eax, word ptr [edx+eax+06h]
  '0048F16B: mov [ebp-64h], eax
  '0048F16E: fild dword ptr [ebp-64h]
  '0048F171: fstp real8 ptr [ebp-6Ch]
  '0048F174: mov ecx, [ebp-68h]
  '0048F177: mov edx, [ebp-6Ch]
  '0048F17A: push ecx
  '0048F17B: push edx
  '0048F17C: push 40000000h
  '0048F181: push 00000000h
  '0048F183: call [004012D4h]
  '0048F189: call [00401320h]
  '0048F18F: mov esi, eax
  '0048F191: mov eax, [ebx+54h]
  '0048F194: mov ebx, [004012F8h]
  '0048F19A: lea ecx, [ebp-50h]
  '0048F19D: push eax
  '0048F19E: push ecx
  '0048F19F: call ebx
  '0048F1A1: mov ecx, [ebp-50h]
  '0048F1A4: test ecx, ecx
  '0048F1A6: jz 48F1D5h
  '0048F1A8: cmp word ptr [ecx], 0001h
  '0048F1AC: jnz 48F1D5h
  '0048F1AE: mov edx, [ecx+14h]
  '0048F1B1: mov eax, [ecx+10h]
  '0048F1B4: sub edi, 00000001h
  '0048F1B7: jo 0048F287h
  '0048F1BD: sub edi, edx
  '0048F1BF: cmp edi, eax
  '0048F1C1: jb 48F1CCh
  '0048F1C3: call [00401170h]
  '0048F1C9: mov ecx, [ebp-50h]
  '0048F1CC: lea eax, [edi*4]
  '0048F1D3: jmp 48F1DEh
  '0048F1D5: call [00401170h]
  '0048F1DB: mov ecx, [ebp-50h]
  '0048F1DE: mov edx, [ecx+0Ch]
  '0048F1E1: lea ecx, [ebp-4Ch]
  '0048F1E4: mov eax, [edx+eax]
  '0048F1E7: push eax
  '0048F1E8: push ecx
  '0048F1E9: call ebx
  '0048F1EB: mov ecx, [ebp-4Ch]
  '0048F1EE: test ecx, ecx
  '0048F1F0: jz 48F216h
  '0048F1F2: cmp word ptr [ecx], 0001h
  '0048F1F6: jnz 48F216h
  '0048F1F8: mov edx, [ecx+14h]
  '0048F1FB: mov eax, [ecx+10h]
  '0048F1FE: mov edi, 00000028h
  '0048F203: sub edi, edx
  '0048F205: cmp edi, eax
  '0048F207: jb 48F212h
  '0048F209: call [00401170h]
  '0048F20F: mov ecx, [ebp-4Ch]
  '0048F212: mov eax, edi
  '0048F214: jmp 48F21Fh
  '0048F216: call [00401170h]
  '0048F21C: mov ecx, [ebp-4Ch]
  '0048F21F: imul esi, 04h
  '0048F222: mov edx, [ecx+0Ch]
  '0048F225: jo 48F287h
  '0048F227: add edx, eax
  '0048F229: mov eax, [ebp+10h]
  '0048F22C: push esi
  '0048F22D: push edx
  '0048F22E: push eax
  '0048F22F: call 004101ECh
  '0048F234: call [004010A4h]
  '0048F23A: mov esi, [00401378h]
  '0048F240: lea ecx, [ebp-4Ch]
  '0048F243: push ecx
  '0048F244: call esi
  '0048F246: lea edx, [ebp-50h]
  '0048F249: push edx
  '0048F24A: call esi
  '0048F24C: wait 
  '0048F24D: push 0048F268h
  '0048F252: jmp 48F267h
  '0048F254: mov esi, [00401378h]
  '0048F25A: lea eax, [ebp-4Ch]
  '0048F25D: push eax
  '0048F25E: call esi
  '0048F260: lea ecx, [ebp-50h]
  '0048F263: push ecx
  '0048F264: call esi
  '0048F266: ret 
End Sub
Private Sub unknown_48F290
  '0048F290: push ebp
  '0048F291: mov ebp, esp
  '0048F293: sub esp, 0000000Ch
  '0048F296: push 00403796h
  '0048F29B: mov eax, fs:[00h]
  '0048F2A1: push eax
  '0048F2A2: mov fs:[00000000h], esp
  '0048F2A9: sub esp, 00000058h
  '0048F2AC: push ebx
  '0048F2AD: push esi
  '0048F2AE: push edi
  '0048F2AF: mov [ebp-0Ch], esp
  '0048F2B2: mov [ebp-08h], 00402B80h
  '0048F2B9: xor esi, esi
  '0048F2BB: mov [ebp-04h], esi
  '0048F2BE: mov ebx, [ebp+08h]
  '0048F2C1: push ebx
  '0048F2C2: mov eax, [ebx]
  '0048F2C4: call [eax+04h]
  '0048F2C7: mov eax, [ebx+50h]
  '0048F2CA: mov [ebp-4Ch], esi
  '0048F2CD: cmp eax, esi
  '0048F2CF: mov [ebp-50h], esi
  '0048F2D2: jz 48F301h
  '0048F2D4: cmp word ptr [eax], 0001h
  '0048F2D8: jnz 48F301h
  '0048F2DA: mov edi, [ebp+0Ch]
  '0048F2DD: mov edx, [eax+14h]
  '0048F2E0: mov ecx, [eax+10h]
  '0048F2E3: mov esi, edi
  '0048F2E5: sub esi, 00000001h
  '0048F2E8: jo 0048F477h
  '0048F2EE: sub esi, edx
  '0048F2F0: cmp esi, ecx
  '0048F2F2: jb 48F2FAh
  '0048F2F4: call [00401170h]
  '0048F2FA: shl esi, 04h
  '0048F2FD: mov eax, esi
  '0048F2FF: jmp 48F30Ah
  '0048F301: call [00401170h]
  '0048F307: mov edi, [ebp+0Ch]
  '0048F30A: mov ecx, [ebx+50h]
  '0048F30D: mov edx, [ecx+0Ch]
  '0048F310: cmp word ptr [edx+eax+06h], 0008h
  '0048F316: jnle 0048F43Ch
  '0048F31C: test ecx, ecx
  '0048F31E: jz 48F34Ah
  '0048F320: cmp word ptr [ecx], 0001h
  '0048F324: jnz 48F34Ah
  '0048F326: mov edx, [ecx+14h]
  '0048F329: mov eax, [ecx+10h]
  '0048F32C: mov esi, edi
  '0048F32E: sub esi, 00000001h
  '0048F331: jo 0048F477h
  '0048F337: sub esi, edx
  '0048F339: cmp esi, eax
  '0048F33B: jb 48F343h
  '0048F33D: call [00401170h]
  '0048F343: shl esi, 04h
  '0048F346: mov eax, esi
  '0048F348: jmp 48F350h
  '0048F34A: call [00401170h]
  '0048F350: mov ecx, [ebx+50h]
  '0048F353: mov edx, [ecx+0Ch]
  '0048F356: movsx eax, word ptr [edx+eax+06h]
  '0048F35B: mov [ebp-64h], eax
  '0048F35E: fild dword ptr [ebp-64h]
  '0048F361: fstp real8 ptr [ebp-6Ch]
  '0048F364: mov ecx, [ebp-68h]
  '0048F367: mov edx, [ebp-6Ch]
  '0048F36A: push ecx
  '0048F36B: push edx
  '0048F36C: push 40000000h
  '0048F371: push 00000000h
  '0048F373: call [004012D4h]
  '0048F379: call [00401320h]
  '0048F37F: mov esi, eax
  '0048F381: mov eax, [ebx+54h]
  '0048F384: mov ebx, [004012F8h]
  '0048F38A: lea ecx, [ebp-50h]
  '0048F38D: push eax
  '0048F38E: push ecx
  '0048F38F: call ebx
  '0048F391: mov ecx, [ebp-50h]
  '0048F394: test ecx, ecx
  '0048F396: jz 48F3C5h
  '0048F398: cmp word ptr [ecx], 0001h
  '0048F39C: jnz 48F3C5h
  '0048F39E: mov edx, [ecx+14h]
  '0048F3A1: mov eax, [ecx+10h]
  '0048F3A4: sub edi, 00000001h
  '0048F3A7: jo 0048F477h
  '0048F3AD: sub edi, edx
  '0048F3AF: cmp edi, eax
  '0048F3B1: jb 48F3BCh
  '0048F3B3: call [00401170h]
  '0048F3B9: mov ecx, [ebp-50h]
  '0048F3BC: lea eax, [edi*4]
  '0048F3C3: jmp 48F3CEh
  '0048F3C5: call [00401170h]
  '0048F3CB: mov ecx, [ebp-50h]
  '0048F3CE: mov edx, [ecx+0Ch]
  '0048F3D1: lea ecx, [ebp-4Ch]
  '0048F3D4: mov eax, [edx+eax]
  '0048F3D7: push eax
  '0048F3D8: push ecx
  '0048F3D9: call ebx
  '0048F3DB: mov ecx, [ebp-4Ch]
  '0048F3DE: test ecx, ecx
  '0048F3E0: jz 48F406h
  '0048F3E2: cmp word ptr [ecx], 0001h
  '0048F3E6: jnz 48F406h
  '0048F3E8: mov edx, [ecx+14h]
  '0048F3EB: mov eax, [ecx+10h]
  '0048F3EE: mov edi, 00000028h
  '0048F3F3: sub edi, edx
  '0048F3F5: cmp edi, eax
  '0048F3F7: jb 48F402h
  '0048F3F9: call [00401170h]
  '0048F3FF: mov ecx, [ebp-4Ch]
  '0048F402: mov eax, edi
  '0048F404: jmp 48F40Fh
  '0048F406: call [00401170h]
  '0048F40C: mov ecx, [ebp-4Ch]
  '0048F40F: imul esi, 04h
  '0048F412: mov ecx, [ecx+0Ch]
  '0048F415: mov edx, [ebp+10h]
  '0048F418: jo 48F477h
  '0048F41A: push esi
  '0048F41B: add ecx, eax
  '0048F41D: push edx
  '0048F41E: push ecx
  '0048F41F: call 004101ECh
  '0048F424: call [004010A4h]
  '0048F42A: mov esi, [00401378h]
  '0048F430: lea edx, [ebp-4Ch]
  '0048F433: push edx
  '0048F434: call esi
  '0048F436: lea eax, [ebp-50h]
  '0048F439: push eax
  '0048F43A: call esi
  '0048F43C: wait 
  '0048F43D: push 0048F458h
  '0048F442: jmp 48F457h
  '0048F444: mov esi, [00401378h]
  '0048F44A: lea ecx, [ebp-4Ch]
  '0048F44D: push ecx
  '0048F44E: call esi
  '0048F450: lea edx, [ebp-50h]
  '0048F453: push edx
  '0048F454: call esi
  '0048F456: ret 
End Sub
Private Sub unknown_48F480
  '0048F480: push ebp
  '0048F481: mov ebp, esp
  '0048F483: sub esp, 0000000Ch
  '0048F486: push 00403796h
  '0048F48B: mov eax, fs:[00h]
  '0048F491: push eax
  '0048F492: mov fs:[00000000h], esp
  '0048F499: sub esp, 000000D4h
  '0048F49F: push ebx
  '0048F4A0: push esi
  '0048F4A1: push edi
  '0048F4A2: mov [ebp-0Ch], esp
  '0048F4A5: mov [ebp-08h], 00402B90h
  '0048F4AC: mov [ebp-04h], 00000000h
  '0048F4B3: mov ebx, [ebp+08h]
  '0048F4B6: push ebx
  '0048F4B7: mov eax, [ebx]
  '0048F4B9: call [eax+04h]
  '0048F4BC: mov edx, [ebp+0Ch]
  '0048F4BF: xor eax, eax
  '0048F4C1: lea ecx, [ebp-20h]
  '0048F4C4: mov [ebp-18h], eax
  '0048F4C7: mov [ebp-20h], eax
  '0048F4CA: mov [ebp-24h], eax
  '0048F4CD: mov [ebp-28h], eax
  '0048F4D0: mov [ebp-30h], eax
  '0048F4D3: mov [ebp-34h], eax
  '0048F4D6: mov [ebp-38h], eax
  '0048F4D9: mov [ebp-3Ch], eax
  '0048F4DC: mov [ebp-40h], eax
  '0048F4DF: mov [ebp-50h], eax
  '0048F4E2: mov [ebp-60h], eax
  '0048F4E5: mov [ebp-70h], eax
  '0048F4E8: mov [ebp-80h], eax
  '0048F4EB: mov [ebp-00000090h], eax
  '0048F4F1: call [004012C4h]
  '0048F4F7: mov ecx, [ebx+34h]
  '0048F4FA: mov edi, [00401184h]
  '0048F500: lea esi, [ebx+34h]
  '0048F503: push ecx
  '0048F504: push 0040FE84h
  '0048F509: call edi
  '0048F50B: test eax, eax
  '0048F50D: jnz 0048F655h
  '0048F513: mov edx, [ebp-20h]
  '0048F516: push edx
  '0048F517: push 0040FE84h
  '0048F51C: call edi
  '0048F51E: test eax, eax
  '0048F520: jnz 0048F655h
  '0048F526: mov eax, [4A0F98h]
  '0048F52B: test eax, eax
  '0048F52D: jnz 48F53Fh
  '0048F52F: push 004A0F98h
  '0048F534: push 0040FFF4h
  '0048F539: call [004012A8h]
  '0048F53F: mov esi, [004A0F98h]
  '0048F545: lea ecx, [ebp-3Ch]
  '0048F548: push ecx
  '0048F549: push esi
  '0048F54A: mov eax, [esi]
  '0048F54C: call [eax+14h]
  '0048F54F: test eax, eax
  '0048F551: fclex 
  '0048F553: jnl 48F568h
  '0048F555: mov ebx, [004010A8h]
  '0048F55B: push 00000014h
  '0048F55D: push 0040FFE4h
  '0048F562: push esi
  '0048F563: push eax
  '0048F564: call ebx
  '0048F566: jmp 48F56Eh
  '0048F568: mov ebx, [004010A8h]
  '0048F56E: mov eax, [ebp-3Ch]
  '0048F571: lea ecx, [ebp-38h]
  '0048F574: push ecx
  '0048F575: push eax
  '0048F576: mov edx, [eax]
  '0048F578: mov esi, eax
  '0048F57A: call [edx+58h]
  '0048F57D: test eax, eax
  '0048F57F: fclex 
  '0048F581: jnl 48F58Eh
  '0048F583: push 00000058h
  '0048F585: push 00410004h
  '0048F58A: push esi
  '0048F58B: push eax
  '0048F58C: call ebx
  '0048F58E: call [004012E0h]
  '0048F594: lea edx, [ebp-40h]
  '0048F597: push eax
  '0048F598: push edx
  '0048F599: call [004010F0h]
  '0048F59F: mov ecx, 80020004h
  '0048F5A4: mov edi, eax
  '0048F5A6: mov [ebp-78h], ecx
  '0048F5A9: mov eax, 0000000Ah
  '0048F5AE: mov [ebp-68h], ecx
  '0048F5B1: mov esi, 00000008h
  '0048F5B6: lea edx, [ebp-00000090h]
  '0048F5BC: lea ecx, [ebp-60h]
  '0048F5BF: mov [ebp-80h], eax
  '0048F5C2: mov [ebp-70h], eax
  '0048F5C5: mov [ebp-00000088h], 00421A48h
  '0048F5CF: mov [ebp-00000090h], esi
  '0048F5D5: call [00401308h]
  '0048F5DB: mov eax, [ebp-38h]
  '0048F5DE: push eax
  '0048F5DF: push 00421780h
  '0048F5E4: call [00401094h]
  '0048F5EA: mov [ebp-48h], eax
  '0048F5ED: lea edx, [ebp-80h]
  '0048F5F0: lea eax, [ebp-70h]
  '0048F5F3: push edx
  '0048F5F4: push eax
  '0048F5F5: lea edx, [ebp-60h]
  '0048F5F8: lea eax, [ebp-50h]
  '0048F5FB: push edx
  '0048F5FC: mov [ebp-50h], esi
  '0048F5FF: mov ecx, [edi]
  '0048F601: push eax
  '0048F602: push 8004041Bh
  '0048F607: push edi
  '0048F608: call [ecx+44h]
  '0048F60B: test eax, eax
  '0048F60D: fclex 
  '0048F60F: jnl 48F61Ch
  '0048F611: push 00000044h
  '0048F613: push 00411C80h
  '0048F618: push edi
  '0048F619: push eax
  '0048F61A: call ebx
  '0048F61C: lea ecx, [ebp-38h]
  '0048F61F: call [0040138Ch]
  '0048F625: lea ecx, [ebp-40h]
  '0048F628: lea edx, [ebp-3Ch]
  '0048F62B: push ecx
  '0048F62C: push edx
  '0048F62D: push 00000002h
  '0048F62F: call [0040106Ch]
  '0048F635: lea eax, [ebp-80h]
  '0048F638: lea ecx, [ebp-70h]
  '0048F63B: push eax
  '0048F63C: lea edx, [ebp-60h]
  '0048F63F: push ecx
  '0048F640: lea eax, [ebp-50h]
  '0048F643: push edx
  '0048F644: push eax
  '0048F645: push 00000004h
  '0048F647: call [00401058h]
  '0048F64D: add esp, 00000020h
  '0048F650: jmp 0048FCE7h
  '0048F655: cmp word ptr [ebx+4Ch], 0000h
  '0048F65A: jnz 0048F78Fh
  '0048F660: mov eax, [4A0F98h]
  '0048F665: test eax, eax
  '0048F667: jnz 48F679h
  '0048F669: push 004A0F98h
  '0048F66E: push 0040FFF4h
  '0048F673: call [004012A8h]
  '0048F679: mov esi, [004A0F98h]
  '0048F67F: lea edx, [ebp-3Ch]
  '0048F682: push edx
  '0048F683: push esi
  '0048F684: mov ecx, [esi]
  '0048F686: call [ecx+14h]
  '0048F689: test eax, eax
  '0048F68B: fclex 
  '0048F68D: jnl 48F6A2h
  '0048F68F: mov ebx, [004010A8h]
  '0048F695: push 00000014h
  '0048F697: push 0040FFE4h
  '0048F69C: push esi
  '0048F69D: push eax
  '0048F69E: call ebx
  '0048F6A0: jmp 48F6A8h
  '0048F6A2: mov ebx, [004010A8h]
  '0048F6A8: mov eax, [ebp-3Ch]
  '0048F6AB: lea edx, [ebp-38h]
  '0048F6AE: push edx
  '0048F6AF: push eax
  '0048F6B0: mov ecx, [eax]
  '0048F6B2: mov esi, eax
  '0048F6B4: call [ecx+58h]
  '0048F6B7: test eax, eax
  '0048F6B9: fclex 
  '0048F6BB: jnl 48F6C8h
  '0048F6BD: push 00000058h
  '0048F6BF: push 00410004h
  '0048F6C4: push esi
  '0048F6C5: push eax
  '0048F6C6: call ebx
  '0048F6C8: call [004012E0h]
  '0048F6CE: push eax
  '0048F6CF: lea eax, [ebp-40h]
  '0048F6D2: push eax
  '0048F6D3: call [004010F0h]
  '0048F6D9: mov ecx, 80020004h
  '0048F6DE: mov edi, eax
  '0048F6E0: mov [ebp-78h], ecx
  '0048F6E3: mov eax, 0000000Ah
  '0048F6E8: mov [ebp-68h], ecx
  '0048F6EB: mov esi, 00000008h
  '0048F6F0: lea edx, [ebp-00000090h]
  '0048F6F6: lea ecx, [ebp-60h]
  '0048F6F9: mov [ebp-80h], eax
  '0048F6FC: mov [ebp-70h], eax
  '0048F6FF: mov [ebp-00000088h], 0042191Ch
  '0048F709: mov [ebp-00000090h], esi
  '0048F70F: call [00401308h]
  '0048F715: mov ecx, [ebp-38h]
  '0048F718: push ecx
  '0048F719: push 00421780h
  '0048F71E: call [00401094h]
  '0048F724: mov [ebp-48h], eax
  '0048F727: lea eax, [ebp-80h]
  '0048F72A: lea ecx, [ebp-70h]
  '0048F72D: push eax
  '0048F72E: push ecx
  '0048F72F: lea eax, [ebp-60h]
  '0048F732: lea ecx, [ebp-50h]
  '0048F735: push eax
  '0048F736: mov [ebp-50h], esi
  '0048F739: mov edx, [edi]
  '0048F73B: push ecx
  '0048F73C: push 8004041Ch
  '0048F741: push edi
  '0048F742: call [edx+44h]
  '0048F745: test eax, eax
  '0048F747: fclex 
  '0048F749: jnl 48F756h
  '0048F74B: push 00000044h
  '0048F74D: push 00411C80h
  '0048F752: push edi
  '0048F753: push eax
  '0048F754: call ebx
  '0048F756: lea ecx, [ebp-38h]
  '0048F759: call [0040138Ch]
  '0048F75F: lea edx, [ebp-40h]
  '0048F762: lea eax, [ebp-3Ch]
  '0048F765: push edx
  '0048F766: push eax
  '0048F767: push 00000002h
  '0048F769: call [0040106Ch]
  '0048F76F: lea ecx, [ebp-80h]
  '0048F772: lea edx, [ebp-70h]
  '0048F775: push ecx
  '0048F776: lea eax, [ebp-60h]
  '0048F779: push edx
  '0048F77A: lea ecx, [ebp-50h]
  '0048F77D: push eax
  '0048F77E: push ecx
  '0048F77F: push 00000004h
  '0048F781: call [00401058h]
  '0048F787: add esp, 00000020h
  '0048F78A: jmp 0048FCE7h
  '0048F78F: mov edx, [ebp-20h]
  '0048F792: push edx
  '0048F793: push 0040FE84h
  '0048F798: call edi
  '0048F79A: test eax, eax
  '0048F79C: jz 48F7A9h
  '0048F79E: mov edx, [ebp-20h]
  '0048F7A1: mov ecx, esi
  '0048F7A3: call [004012C4h]
  '0048F7A9: mov eax, [esi]
  '0048F7AB: push 00000000h
  '0048F7AD: push 00000080h
  '0048F7B2: push 00000002h
  '0048F7B4: push 00000000h
  '0048F7B6: push 00000000h
  '0048F7B8: push 40000000h
  '0048F7BD: lea ecx, [ebp-38h]
  '0048F7C0: push eax
  '0048F7C1: push ecx
  '0048F7C2: call [0040130Ch]
  '0048F7C8: push eax
  '0048F7C9: call 00412288h
  '0048F7CE: mov edi, eax
  '0048F7D0: mov [ebp-000000B4h], edi
  '0048F7D6: call [004010A4h]
  '0048F7DC: mov edx, [ebp-38h]
  '0048F7DF: push edx
  '0048F7E0: push esi
  '0048F7E1: call [00401228h]
  '0048F7E7: lea ecx, [ebp-38h]
  '0048F7EA: call [0040138Ch]
  '0048F7F0: cmp edi, FFFFFFFFh
  '0048F7F3: jnz 0048F928h
  '0048F7F9: mov eax, [4A0F98h]
  '0048F7FE: test eax, eax
  '0048F800: jnz 48F812h
  '0048F802: push 004A0F98h
  '0048F807: push 0040FFF4h
  '0048F80C: call [004012A8h]
  '0048F812: mov esi, [004A0F98h]
  '0048F818: lea ecx, [ebp-3Ch]
  '0048F81B: push ecx
  '0048F81C: push esi
  '0048F81D: mov eax, [esi]
  '0048F81F: call [eax+14h]
  '0048F822: test eax, eax
  '0048F824: fclex 
  '0048F826: jnl 48F83Bh
  '0048F828: mov ebx, [004010A8h]
  '0048F82E: push 00000014h
  '0048F830: push 0040FFE4h
  '0048F835: push esi
  '0048F836: push eax
  '0048F837: call ebx
  '0048F839: jmp 48F841h
  '0048F83B: mov ebx, [004010A8h]
  '0048F841: mov eax, [ebp-3Ch]
  '0048F844: lea ecx, [ebp-38h]
  '0048F847: push ecx
  '0048F848: push eax
  '0048F849: mov edx, [eax]
  '0048F84B: mov esi, eax
  '0048F84D: call [edx+58h]
  '0048F850: test eax, eax
  '0048F852: fclex 
  '0048F854: jnl 48F861h
  '0048F856: push 00000058h
  '0048F858: push 00410004h
  '0048F85D: push esi
  '0048F85E: push eax
  '0048F85F: call ebx
  '0048F861: call [004012E0h]
  '0048F867: lea edx, [ebp-40h]
  '0048F86A: push eax
  '0048F86B: push edx
  '0048F86C: call [004010F0h]
  '0048F872: mov ecx, 80020004h
  '0048F877: mov edi, eax
  '0048F879: mov [ebp-78h], ecx
  '0048F87C: mov eax, 0000000Ah
  '0048F881: mov [ebp-68h], ecx
  '0048F884: mov esi, 00000008h
  '0048F889: lea edx, [ebp-00000090h]
  '0048F88F: lea ecx, [ebp-60h]
  '0048F892: mov [ebp-80h], eax
  '0048F895: mov [ebp-70h], eax
  '0048F898: mov [ebp-00000088h], 00421A7Ch
  '0048F8A2: mov [ebp-00000090h], esi
  '0048F8A8: call [00401308h]
  '0048F8AE: mov eax, [ebp-38h]
  '0048F8B1: push eax
  '0048F8B2: push 00421780h
  '0048F8B7: call [00401094h]
  '0048F8BD: mov [ebp-48h], eax
  '0048F8C0: lea edx, [ebp-80h]
  '0048F8C3: lea eax, [ebp-70h]
  '0048F8C6: push edx
  '0048F8C7: push eax
  '0048F8C8: lea edx, [ebp-60h]
  '0048F8CB: lea eax, [ebp-50h]
  '0048F8CE: push edx
  '0048F8CF: mov [ebp-50h], esi
  '0048F8D2: mov ecx, [edi]
  '0048F8D4: push eax
  '0048F8D5: push 8004041Ch
  '0048F8DA: push edi
  '0048F8DB: call [ecx+44h]
  '0048F8DE: test eax, eax
  '0048F8E0: fclex 
  '0048F8E2: jnl 48F8EFh
  '0048F8E4: push 00000044h
  '0048F8E6: push 00411C80h
  '0048F8EB: push edi
  '0048F8EC: push eax
  '0048F8ED: call ebx
  '0048F8EF: lea ecx, [ebp-38h]
  '0048F8F2: call [0040138Ch]
  '0048F8F8: lea ecx, [ebp-40h]
  '0048F8FB: lea edx, [ebp-3Ch]
  '0048F8FE: push ecx
  '0048F8FF: push edx
  '0048F900: push 00000002h
  '0048F902: call [0040106Ch]
  '0048F908: lea eax, [ebp-80h]
  '0048F90B: lea ecx, [ebp-70h]
  '0048F90E: push eax
  '0048F90F: lea edx, [ebp-60h]
  '0048F912: push ecx
  '0048F913: lea eax, [ebp-50h]
  '0048F916: push edx
  '0048F917: push eax
  '0048F918: push 00000004h
  '0048F91A: call [00401058h]
  '0048F920: add esp, 00000020h
  '0048F923: jmp 0048FCE7h
  '0048F928: lea ecx, [ebp-28h]
  '0048F92B: push 00000000h
  '0048F92D: push ecx
  '0048F92E: lea edx, [ebx+48h]
  '0048F931: push 00000006h
  '0048F933: push edx
  '0048F934: push edi
  '0048F935: call 00412310h
  '0048F93A: call [004010A4h]
  '0048F940: cmp [ebp-28h], 00000006h
  '0048F944: jnz 0048FB96h
  '0048F94A: mov ax, [ebx+4Ch]
  '0048F94E: sub ax, 0001h
  '0048F952: jo 0048FD68h
  '0048F958: movsx ecx, ax
  '0048F95B: mov [ebp-000000D4h], ecx
  '0048F961: xor esi, esi
  '0048F963: mov eax, [ebp-000000D4h]
  '0048F969: mov [ebp-2Ch], esi
  '0048F96C: cmp esi, eax
  '0048F96E: jnle 0048F9FCh
  '0048F974: mov edx, [ebx+50h]
  '0048F977: lea eax, [ebp-30h]
  '0048F97A: push edx
  '0048F97B: push eax
  '0048F97C: call [004012F8h]
  '0048F982: mov ecx, [ebp-30h]
  '0048F985: test ecx, ecx
  '0048F987: jz 48F9AEh
  '0048F989: cmp word ptr [ecx], 0001h
  '0048F98D: jnz 48F9AEh
  '0048F98F: mov edx, [ecx+14h]
  '0048F992: mov eax, [ecx+10h]
  '0048F995: sub esi, edx
  '0048F997: cmp esi, eax
  '0048F999: jb 48F9A4h
  '0048F99B: call [00401170h]
  '0048F9A1: mov ecx, [ebp-30h]
  '0048F9A4: shl esi, 04h
  '0048F9A7: mov eax, esi
  '0048F9A9: mov esi, [ebp-2Ch]
  '0048F9AC: jmp 48F9B7h
  '0048F9AE: call [00401170h]
  '0048F9B4: mov ecx, [ebp-30h]
  '0048F9B7: mov ecx, [ecx+0Ch]
  '0048F9BA: lea edx, [ebp-28h]
  '0048F9BD: push 00000000h
  '0048F9BF: push edx
  '0048F9C0: add ecx, eax
  '0048F9C2: push 00000010h
  '0048F9C4: push ecx
  '0048F9C5: push edi
  '0048F9C6: call 00412310h
  '0048F9CB: call [004010A4h]
  '0048F9D1: lea edx, [ebp-30h]
  '0048F9D4: push edx
  '0048F9D5: call [00401378h]
  '0048F9DB: cmp [ebp-28h], 00000010h
  '0048F9DF: jnz 48F9F5h
  '0048F9E1: mov eax, 00000001h
  '0048F9E6: add eax, esi
  '0048F9E8: jo 0048FD68h
  '0048F9EE: mov esi, eax
  '0048F9F0: jmp 0048F963h
  '0048F9F5: mov [ebp-18h], FFFFFFFFh
  '0048F9FC: cmp word ptr [ebp-18h], 0000h
  '0048FA01: jnz 0048FB9Dh
  '0048FA07: mov ax, [ebx+4Ch]
  '0048FA0B: sub ax, 0001h
  '0048FA0F: jo 0048FD68h
  '0048FA15: movsx ecx, ax
  '0048FA18: xor esi, esi
  '0048FA1A: mov [ebp-000000DCh], ecx
  '0048FA20: mov [ebp-2Ch], esi
  '0048FA23: cmp esi, [ebp-000000DCh]
  '0048FA29: jnle 0048FB9Dh
  '0048FA2F: mov eax, [ebx+50h]
  '0048FA32: test eax, eax
  '0048FA34: jz 48FA59h
  '0048FA36: cmp word ptr [eax], 0001h
  '0048FA3A: jnz 48FA59h
  '0048FA3C: mov edx, [eax+14h]
  '0048FA3F: mov ecx, [eax+10h]
  '0048FA42: sub esi, edx
  '0048FA44: cmp esi, ecx
  '0048FA46: jb 48FA4Eh
  '0048FA48: call [00401170h]
  '0048FA4E: shl esi, 04h
  '0048FA51: mov [ebp-000000E8h], esi
  '0048FA57: jmp 48FA65h
  '0048FA59: call [00401170h]
  '0048FA5F: mov [ebp-000000E8h], eax
  '0048FA65: mov edx, [ebx+54h]
  '0048FA68: lea eax, [ebp-34h]
  '0048FA6B: push edx
  '0048FA6C: push eax
  '0048FA6D: call [004012F8h]
  '0048FA73: mov ecx, [ebp-34h]
  '0048FA76: test ecx, ecx
  '0048FA78: jz 48FAA3h
  '0048FA7A: cmp word ptr [ecx], 0001h
  '0048FA7E: jnz 48FAA3h
  '0048FA80: mov edi, [ebp-2Ch]
  '0048FA83: mov edx, [ecx+14h]
  '0048FA86: mov eax, [ecx+10h]
  '0048FA89: mov esi, [00401170h]
  '0048FA8F: sub edi, edx
  '0048FA91: cmp edi, eax
  '0048FA93: jb 48FA9Ah
  '0048FA95: call esi
  '0048FA97: mov ecx, [ebp-34h]
  '0048FA9A: lea eax, [edi*4]
  '0048FAA1: jmp 48FAB2h
  '0048FAA3: call [00401170h]
  '0048FAA9: mov ecx, [ebp-34h]
  '0048FAAC: mov esi, [00401170h]
  '0048FAB2: mov ecx, [ecx+0Ch]
  '0048FAB5: mov edx, [ecx+eax]
  '0048FAB8: lea eax, [ebp-30h]
  '0048FABB: push edx
  '0048FABC: push eax
  '0048FABD: call [004012F8h]
  '0048FAC3: mov ecx, [ebp-30h]
  '0048FAC6: test ecx, ecx
  '0048FAC8: jz 48FAE5h
  '0048FACA: cmp word ptr [ecx], 0001h
  '0048FACE: jnz 48FAE5h
  '0048FAD0: mov edi, [ecx+14h]
  '0048FAD3: mov eax, [ecx+10h]
  '0048FAD6: neg edi
  '0048FAD8: cmp edi, eax
  '0048FADA: jb 48FAE1h
  '0048FADC: call esi
  '0048FADE: mov ecx, [ebp-30h]
  '0048FAE1: mov eax, edi
  '0048FAE3: jmp 48FAEAh
  '0048FAE5: call esi
  '0048FAE7: mov ecx, [ebp-30h]
  '0048FAEA: mov edi, [ebp-000000E8h]
  '0048FAF0: lea edx, [ebp-28h]
  '0048FAF3: push 00000000h
  '0048FAF5: mov ecx, [ecx+0Ch]
  '0048FAF8: push edx
  '0048FAF9: mov edx, [ebx+50h]
  '0048FAFC: add ecx, eax
  '0048FAFE: mov edx, [edx+0Ch]
  '0048FB01: mov edx, [edx+edi+08h]
  '0048FB05: push edx
  '0048FB06: mov edx, [ebp-000000B4h]
  '0048FB0C: push ecx
  '0048FB0D: push edx
  '0048FB0E: call 00412310h
  '0048FB13: call [004010A4h]
  '0048FB19: mov edi, [00401378h]
  '0048FB1F: lea eax, [ebp-30h]
  '0048FB22: push eax
  '0048FB23: call edi
  '0048FB25: lea ecx, [ebp-34h]
  '0048FB28: push ecx
  '0048FB29: call edi
  '0048FB2B: mov eax, [ebx+50h]
  '0048FB2E: test eax, eax
  '0048FB30: jz 48FB54h
  '0048FB32: cmp word ptr [eax], 0001h
  '0048FB36: jnz 48FB54h
  '0048FB38: mov esi, [ebp-2Ch]
  '0048FB3B: mov edx, [eax+14h]
  '0048FB3E: mov ecx, [eax+10h]
  '0048FB41: sub esi, edx
  '0048FB43: cmp esi, ecx
  '0048FB45: jb 48FB4Dh
  '0048FB47: call [00401170h]
  '0048FB4D: shl esi, 04h
  '0048FB50: mov eax, esi
  '0048FB52: jmp 48FB56h
  '0048FB54: call esi
  '0048FB56: mov edx, [ebx+50h]
  '0048FB59: mov ecx, [edx+0Ch]
  '0048FB5C: mov edx, [ecx+eax+08h]
  '0048FB60: mov eax, [ebp-28h]
  '0048FB63: cmp edx, eax
  '0048FB65: jnz 48FB87h
  '0048FB67: mov ecx, [ebp-2Ch]
  '0048FB6A: mov edi, [ebp-000000B4h]
  '0048FB70: mov eax, 00000001h
  '0048FB75: add eax, ecx
  '0048FB77: jo 0048FD68h
  '0048FB7D: mov [ebp-2Ch], eax
  '0048FB80: mov esi, eax
  '0048FB82: jmp 0048FA23h
  '0048FB87: mov edi, [ebp-000000B4h]
  '0048FB8D: mov [ebp-18h], FFFFFFFFh
  '0048FB94: jmp 48FB9Dh
  '0048FB96: mov [ebp-18h], FFFFFFFFh
  '0048FB9D: push edi
  '0048FB9E: call 00410830h
  '0048FBA3: call [004010A4h]
  '0048FBA9: mov eax, [ebp-18h]
  '0048FBAC: test ax, ax
  '0048FBAF: jz 0048FCE2h
  '0048FBB5: mov eax, [4A0F98h]
  '0048FBBA: test eax, eax
  '0048FBBC: jnz 48FBCEh
  '0048FBBE: push 004A0F98h
  '0048FBC3: push 0040FFF4h
  '0048FBC8: call [004012A8h]
  '0048FBCE: mov esi, [004A0F98h]
  '0048FBD4: lea ecx, [ebp-3Ch]
  '0048FBD7: push ecx
  '0048FBD8: push esi
  '0048FBD9: mov eax, [esi]
  '0048FBDB: call [eax+14h]
  '0048FBDE: test eax, eax
  '0048FBE0: fclex 
  '0048FBE2: jnl 48FBF7h
  '0048FBE4: mov ebx, [004010A8h]
  '0048FBEA: push 00000014h
  '0048FBEC: push 0040FFE4h
  '0048FBF1: push esi
  '0048FBF2: push eax
  '0048FBF3: call ebx
  '0048FBF5: jmp 48FBFDh
  '0048FBF7: mov ebx, [004010A8h]
  '0048FBFD: mov eax, [ebp-3Ch]
  '0048FC00: lea ecx, [ebp-38h]
  '0048FC03: push ecx
  '0048FC04: push eax
  '0048FC05: mov edx, [eax]
  '0048FC07: mov esi, eax
  '0048FC09: call [edx+58h]
  '0048FC0C: test eax, eax
  '0048FC0E: fclex 
  '0048FC10: jnl 48FC1Dh
  '0048FC12: push 00000058h
  '0048FC14: push 00410004h
  '0048FC19: push esi
  '0048FC1A: push eax
  '0048FC1B: call ebx
  '0048FC1D: call [004012E0h]
  '0048FC23: lea edx, [ebp-40h]
  '0048FC26: push eax
  '0048FC27: push edx
  '0048FC28: call [004010F0h]
  '0048FC2E: mov ecx, 80020004h
  '0048FC33: mov edi, eax
  '0048FC35: mov [ebp-78h], ecx
  '0048FC38: mov eax, 0000000Ah
  '0048FC3D: mov [ebp-68h], ecx
  '0048FC40: mov esi, 00000008h
  '0048FC45: lea edx, [ebp-00000090h]
  '0048FC4B: lea ecx, [ebp-60h]
  '0048FC4E: mov [ebp-80h], eax
  '0048FC51: mov [ebp-70h], eax
  '0048FC54: mov [ebp-00000088h], 00421AC0h
  '0048FC5E: mov [ebp-00000090h], esi
  '0048FC64: call [00401308h]
  '0048FC6A: mov eax, [ebp-38h]
  '0048FC6D: push eax
  '0048FC6E: push 00421780h
  '0048FC73: call [00401094h]
  '0048FC79: mov [ebp-48h], eax
  '0048FC7C: lea edx, [ebp-80h]
  '0048FC7F: lea eax, [ebp-70h]
  '0048FC82: push edx
  '0048FC83: push eax
  '0048FC84: lea edx, [ebp-60h]
  '0048FC87: lea eax, [ebp-50h]
  '0048FC8A: push edx
  '0048FC8B: mov [ebp-50h], esi
  '0048FC8E: mov ecx, [edi]
  '0048FC90: push eax
  '0048FC91: push 8004041Dh
  '0048FC96: push edi
  '0048FC97: call [ecx+44h]
  '0048FC9A: test eax, eax
  '0048FC9C: fclex 
  '0048FC9E: jnl 48FCABh
  '0048FCA0: push 00000044h
  '0048FCA2: push 00411C80h
  '0048FCA7: push edi
  '0048FCA8: push eax
  '0048FCA9: call ebx
  '0048FCAB: lea ecx, [ebp-38h]
  '0048FCAE: call [0040138Ch]
  '0048FCB4: lea ecx, [ebp-40h]
  '0048FCB7: lea edx, [ebp-3Ch]
  '0048FCBA: push ecx
  '0048FCBB: push edx
  '0048FCBC: push 00000002h
  '0048FCBE: call [0040106Ch]
  '0048FCC4: lea eax, [ebp-80h]
  '0048FCC7: lea ecx, [ebp-70h]
  '0048FCCA: push eax
  '0048FCCB: lea edx, [ebp-60h]
  '0048FCCE: push ecx
  '0048FCCF: lea eax, [ebp-50h]
  '0048FCD2: push edx
  '0048FCD3: push eax
  '0048FCD4: push 00000004h
  '0048FCD6: call [00401058h]
  '0048FCDC: mov eax, [ebp-18h]
  '0048FCDF: add esp, 00000020h
  '0048FCE2: not eax
  '0048FCE4: mov [ebp-24h], eax
  '0048FCE7: push 0048FD3Fh
  '0048FCEC: jmp 48FD35h
  '0048FCEE: mov esi, [00401378h]
  '0048FCF4: lea ecx, [ebp-30h]
  '0048FCF7: push ecx
  '0048FCF8: call esi
  '0048FCFA: lea edx, [ebp-34h]
  '0048FCFD: push edx
  '0048FCFE: call esi
  '0048FD00: lea ecx, [ebp-38h]
  '0048FD03: call [0040138Ch]
  '0048FD09: lea eax, [ebp-40h]
  '0048FD0C: lea ecx, [ebp-3Ch]
  '0048FD0F: push eax
  '0048FD10: push ecx
  '0048FD11: push 00000002h
  '0048FD13: call [0040106Ch]
  '0048FD19: lea edx, [ebp-80h]
  '0048FD1C: lea eax, [ebp-70h]
  '0048FD1F: push edx
  '0048FD20: lea ecx, [ebp-60h]
  '0048FD23: push eax
  '0048FD24: lea edx, [ebp-50h]
  '0048FD27: push ecx
  '0048FD28: push edx
  '0048FD29: push 00000004h
  '0048FD2B: call [00401058h]
  '0048FD31: add esp, 00000020h
  '0048FD34: ret 
End Sub
Private Sub unknown_48FD70
  '0048FD70: push ebp
  '0048FD71: mov ebp, esp
  '0048FD73: sub esp, 0000000Ch
  '0048FD76: push 00403796h
  '0048FD7B: mov eax, fs:[00h]
  '0048FD81: push eax
  '0048FD82: mov fs:[00000000h], esp
  '0048FD89: sub esp, 0000000Ch
  '0048FD8C: push ebx
  '0048FD8D: push esi
  '0048FD8E: push edi
  '0048FD8F: mov [ebp-0Ch], esp
  '0048FD92: mov [ebp-08h], 00402BA0h
  '0048FD99: xor edi, edi
  '0048FD9B: mov [ebp-04h], edi
  '0048FD9E: mov esi, [ebp+08h]
  '0048FDA1: push esi
  '0048FDA2: mov eax, [esi]
  '0048FDA4: call [eax+04h]
  '0048FDA7: mov eax, [ebp+28h]
  '0048FDAA: lea edx, [ebp-18h]
  '0048FDAD: push edx
  '0048FDAE: mov edx, [ebp+24h]
  '0048FDB1: push edi
  '0048FDB2: push eax
  '0048FDB3: mov eax, [ebp+20h]
  '0048FDB6: push edx
  '0048FDB7: mov edx, [ebp+1Ch]
  '0048FDBA: mov ecx, [esi]
  '0048FDBC: push eax
  '0048FDBD: mov eax, [ebp+18h]
  '0048FDC0: push edx
  '0048FDC1: mov edx, [ebp+14h]
  '0048FDC4: push eax
  '0048FDC5: mov eax, [ebp+10h]
  '0048FDC8: push FFFFFFFFh
  '0048FDCA: push edx
  '0048FDCB: mov edx, [ebp+0Ch]
  '0048FDCE: push eax
  '0048FDCF: push edx
  '0048FDD0: push esi
  '0048FDD1: mov [ebp-18h], edi
  '0048FDD4: call [ecx+74h]
  '0048FDD7: mov eax, [ebp+08h]
  '0048FDDA: push eax
  '0048FDDB: mov ecx, [eax]
  '0048FDDD: call [ecx+08h]
  '0048FDE0: mov eax, [ebp-04h]
  '0048FDE3: mov ecx, [ebp-14h]
  '0048FDE6: pop edi
  '0048FDE7: pop esi
  '0048FDE8: mov fs:[00000000h], ecx
  '0048FDEF: pop ebx
  '0048FDF0: mov esp, ebp
  '0048FDF2: pop ebp
  '0048FDF3: retn 0024h
End Sub
Private Sub unknown_48FE00
  '0048FE00: push ebp
  '0048FE01: mov ebp, esp
  '0048FE03: sub esp, 0000000Ch
  '0048FE06: push 00403796h
  '0048FE0B: mov eax, fs:[00h]
  '0048FE11: push eax
  '0048FE12: mov fs:[00000000h], esp
  '0048FE19: sub esp, 000000E4h
  '0048FE1F: push ebx
  '0048FE20: push esi
  '0048FE21: push edi
  '0048FE22: mov [ebp-0Ch], esp
  '0048FE25: mov [ebp-08h], 00402BA8h
  '0048FE2C: xor esi, esi
  '0048FE2E: mov [ebp-04h], esi
  '0048FE31: mov ebx, [ebp+08h]
  '0048FE34: push ebx
  '0048FE35: mov eax, [ebx]
  '0048FE37: call [eax+04h]
  '0048FE3A: mov ecx, 0000000Ah
  '0048FE3F: xor eax, eax
  '0048FE41: lea edi, [ebp-4Ch]
  '0048FE44: mov [ebp-5Ch], esi
  '0048FE47: rep stosd 
  '0048FE49: mov ecx, 0000000Ch
  '0048FE4E: lea edi, [ebp-000000B0h]
  '0048FE54: rep stosd 
  '0048FE56: mov ecx, [ebp+28h]
  '0048FE59: lea eax, [ebp-000000B8h]
  '0048FE5F: mov [ebp-74h], esi
  '0048FE62: mov [ebp-000000B4h], esi
  '0048FE68: mov [ecx], esi
  '0048FE6A: mov edx, [ebx+54h]
  '0048FE6D: push edx
  '0048FE6E: push eax
  '0048FE6F: mov [ebp-000000B8h], esi
  '0048FE75: mov [ebp-000000BCh], esi
  '0048FE7B: call [004012F8h]
  '0048FE81: mov ecx, [ebp-000000B8h]
  '0048FE87: cmp ecx, esi
  '0048FE89: jz 48FEBEh
  '0048FE8B: cmp word ptr [ecx], 0001h
  '0048FE8F: jnz 48FEBEh
  '0048FE91: mov esi, [ebp+10h]
  '0048FE94: mov edx, [ecx+14h]
  '0048FE97: mov eax, [ecx+10h]
  '0048FE9A: sub esi, 00000001h
  '0048FE9D: jo 004909A2h
  '0048FEA3: sub esi, edx
  '0048FEA5: cmp esi, eax
  '0048FEA7: jb 48FEB5h
  '0048FEA9: call [00401170h]
  '0048FEAF: mov ecx, [ebp-000000B8h]
  '0048FEB5: lea eax, [esi*4]
  '0048FEBC: jmp 48FECAh
  '0048FEBE: call [00401170h]
  '0048FEC4: mov ecx, [ebp-000000B8h]
  '0048FECA: mov ecx, [ecx+0Ch]
  '0048FECD: mov edx, [ecx+eax]
  '0048FED0: lea eax, [ebp-000000B4h]
  '0048FED6: push edx
  '0048FED7: push eax
  '0048FED8: call [004012F8h]
  '0048FEDE: mov ecx, [ebp-000000B4h]
  '0048FEE4: test ecx, ecx
  '0048FEE6: jz 48FF0Ah
  '0048FEE8: cmp word ptr [ecx], 0001h
  '0048FEEC: jnz 48FF0Ah
  '0048FEEE: mov esi, [ecx+14h]
  '0048FEF1: mov eax, [ecx+10h]
  '0048FEF4: neg esi
  '0048FEF6: cmp esi, eax
  '0048FEF8: jb 48FF06h
  '0048FEFA: call [00401170h]
  '0048FF00: mov ecx, [ebp-000000B4h]
  '0048FF06: mov eax, esi
  '0048FF08: jmp 48FF16h
  '0048FF0A: call [00401170h]
  '0048FF10: mov ecx, [ebp-000000B4h]
  '0048FF16: mov ecx, [ecx+0Ch]
  '0048FF19: push 00000028h
  '0048FF1B: add ecx, eax
  '0048FF1D: lea edx, [ebp-4Ch]
  '0048FF20: push ecx
  '0048FF21: push edx
  '0048FF22: call 004101ECh
  '0048FF27: mov esi, [004010A4h]
  '0048FF2D: call esi
  '0048FF2F: mov edi, [00401378h]
  '0048FF35: lea eax, [ebp-000000B4h]
  '0048FF3B: push eax
  '0048FF3C: call edi
  '0048FF3E: lea ecx, [ebp-000000B8h]
  '0048FF44: push ecx
  '0048FF45: call edi
  '0048FF47: mov eax, [ebp-44h]
  '0048FF4A: cdq 
  '0048FF4B: sub eax, edx
  '0048FF4D: mov edx, [ebx+54h]
  '0048FF50: sar eax, 01h
  '0048FF52: mov [ebp-44h], eax
  '0048FF55: lea eax, [ebp-000000B8h]
  '0048FF5B: push edx
  '0048FF5C: push eax
  '0048FF5D: call [004012F8h]
  '0048FF63: mov ecx, [ebp-000000B8h]
  '0048FF69: test ecx, ecx
  '0048FF6B: jz 48FFA6h
  '0048FF6D: cmp word ptr [ecx], 0001h
  '0048FF71: jnz 48FFA6h
  '0048FF73: mov edi, [ebp+10h]
  '0048FF76: mov edx, [ecx+14h]
  '0048FF79: mov eax, [ecx+10h]
  '0048FF7C: sub edi, 00000001h
  '0048FF7F: jo 004909A2h
  '0048FF85: sub edi, edx
  '0048FF87: cmp edi, eax
  '0048FF89: jb 48FF97h
  '0048FF8B: call [00401170h]
  '0048FF91: mov ecx, [ebp-000000B8h]
  '0048FF97: lea eax, [edi*4]
  '0048FF9E: mov edi, [00401378h]
  '0048FFA4: jmp 48FFB2h
  '0048FFA6: call [00401170h]
  '0048FFAC: mov ecx, [ebp-000000B8h]
  '0048FFB2: mov ecx, [ecx+0Ch]
  '0048FFB5: mov edx, [ecx+eax]
  '0048FFB8: lea eax, [ebp-000000B4h]
  '0048FFBE: push edx
  '0048FFBF: push eax
  '0048FFC0: call [004012F8h]
  '0048FFC6: mov ecx, [ebp-000000B4h]
  '0048FFCC: test ecx, ecx
  '0048FFCE: jz 48FFFCh
  '0048FFD0: cmp word ptr [ecx], 0001h
  '0048FFD4: jnz 48FFFCh
  '0048FFD6: mov eax, [ecx+14h]
  '0048FFD9: mov edx, [ecx+10h]
  '0048FFDC: neg eax
  '0048FFDE: cmp eax, edx
  '0048FFE0: mov [ebp-000000C4h], eax
  '0048FFE6: jb 490008h
  '0048FFE8: call [00401170h]
  '0048FFEE: mov ecx, [ebp-000000B4h]
  '0048FFF4: mov eax, [ebp-000000C4h]
  '0048FFFA: jmp 490008h
  '0048FFFC: call [00401170h]
  '00490002: mov ecx, [ebp-000000B4h]
  '00490008: mov ecx, [ecx+0Ch]
  '0049000B: lea edx, [ebp-4Ch]
  '0049000E: push 00000028h
  '00490010: add ecx, eax
  '00490012: push edx
  '00490013: push ecx
  '00490014: call 004101ECh
  '00490019: call esi
  '0049001B: lea edx, [ebp-000000B4h]
  '00490021: push edx
  '00490022: call edi
  '00490024: lea eax, [ebp-000000B8h]
  '0049002A: push eax
  '0049002B: call edi
  '0049002D: mov ecx, [ebx]
  '0049002F: lea edx, [ebp-000000BCh]
  '00490035: lea eax, [ebp-4Ch]
  '00490038: push edx
  '00490039: push eax
  '0049003A: push ebx
  '0049003B: call [ecx+78h]
  '0049003E: mov ecx, [ebp-000000BCh]
  '00490044: lea eax, [ebp-000000BCh]
  '0049004A: mov [ebp-70h], ecx
  '0049004D: push eax
  '0049004E: movsx ecx, word ptr [ebp-40h]
  '00490052: imul ecx, [ebp-48h]
  '00490056: movsx eax, word ptr [ebp-3Eh]
  '0049005A: jo 004909A2h
  '00490060: imul ecx, eax
  '00490063: mov edx, [ebx]
  '00490065: jo 004909A2h
  '0049006B: push ecx
  '0049006C: push ebx
  '0049006D: call [edx+00000080h]
  '00490073: mov eax, [ebx+50h]
  '00490076: test eax, eax
  '00490078: jz 4900A5h
  '0049007A: cmp word ptr [eax], 0001h
  '0049007E: jnz 4900A5h
  '00490080: mov edi, [ebp+10h]
  '00490083: mov edx, [eax+14h]
  '00490086: mov ecx, [eax+10h]
  '00490089: sub edi, 00000001h
  '0049008C: jo 004909A2h
  '00490092: sub edi, edx
  '00490094: cmp edi, ecx
  '00490096: jb 49009Eh
  '00490098: call [00401170h]
  '0049009E: shl edi, 04h
  '004900A1: mov eax, edi
  '004900A3: jmp 4900ABh
  '004900A5: call [00401170h]
  '004900AB: mov ecx, [ebx+50h]
  '004900AE: mov edx, [ecx+0Ch]
  '004900B1: xor ecx, ecx
  '004900B3: mov cl, [edx+eax+01h]
  '004900B7: mov [ebp-000000E0h], ecx
  '004900BD: fild dword ptr [ebp-000000E0h]
  '004900C3: fstp real8 ptr [ebp-000000E8h]
  '004900C9: fld real8 ptr [ebp-000000E8h]
  '004900CF: fild dword ptr [ebp-000000BCh]
  '004900D5: fstp real8 ptr [ebp-000000F0h]
  '004900DB: fmul real8 ptr [ebp-000000F0h]
  '004900E1: fild dword ptr [ebp-70h]
  '004900E4: fstp real8 ptr [ebp-000000F8h]
  '004900EA: fadd real8 ptr [ebp-000000F8h]
  '004900F0: fstsw ax
  '004900F2: test al, 0Dh
  '004900F4: jnz 0049099Dh
  '004900FA: call [00401320h]
  '00490100: mov [ebp-64h], eax
  '00490103: mov eax, [ebp+20h]
  '00490106: cmp eax, FFFFFFFFh
  '00490109: jnz 49012Fh
  '0049010B: mov edx, [ebp+18h]
  '0049010E: mov eax, [ebp+14h]
  '00490111: mov ebx, [ebp+0Ch]
  '00490114: push edx
  '00490115: push eax
  '00490116: push ebx
  '00490117: call 00412A64h
  '0049011C: mov [ebp-000000BCh], eax
  '00490122: call esi
  '00490124: mov ecx, [ebp-000000BCh]
  '0049012A: mov [ebp+20h], ecx
  '0049012D: jmp 490132h
  '0049012F: mov ebx, [ebp+0Ch]
  '00490132: push 00000000h
  '00490134: call 0041289Ch
  '00490139: mov [ebp-000000BCh], eax
  '0049013F: call esi
  '00490141: mov eax, [ebp-000000BCh]
  '00490147: test eax, eax
  '00490149: mov [ebp-18h], eax
  '0049014C: jz 00490780h
  '00490152: mov ecx, [ebp-48h]
  '00490155: mov edx, [ebp-44h]
  '00490158: mov edi, [004011F4h]
  '0049015E: mov eax, 00000001h
  '00490163: mov [ebp-000000ACh], ecx
  '00490169: xor ecx, ecx
  '0049016B: mov [ebp-000000B0h], 00000028h
  '00490175: mov [ebp-000000A4h], ax
  '0049017C: mov [ebp-000000A8h], edx
  '00490182: mov [ebp-000000A2h], ax
  '00490189: mov [ebp-000000A0h], 00000000h
  '00490193: call edi
  '00490195: xor ecx, ecx
  '00490197: mov [ebp-00000088h], al
  '0049019D: call edi
  '0049019F: xor ecx, ecx
  '004901A1: mov [ebp-00000087h], al
  '004901A7: call edi
  '004901A9: mov ecx, 000000FFh
  '004901AE: mov [ebp-00000086h], al
  '004901B4: call edi
  '004901B6: mov ecx, 000000FFh
  '004901BB: mov [ebp-00000084h], al
  '004901C1: call edi
  '004901C3: mov ecx, 000000FFh
  '004901C8: mov [ebp-00000083h], al
  '004901CE: call edi
  '004901D0: mov edx, [ebp-44h]
  '004901D3: mov ecx, [ebp-18h]
  '004901D6: mov [ebp-00000082h], al
  '004901DC: mov eax, [ebp-48h]
  '004901DF: push edx
  '004901E0: push eax
  '004901E1: push ecx
  '004901E2: call 004128ECh
  '004901E7: mov [ebp-000000BCh], eax
  '004901ED: call esi
  '004901EF: mov eax, [ebp-000000BCh]
  '004901F5: test eax, eax
  '004901F7: mov [ebp-60h], eax
  '004901FA: jz 00490775h
  '00490200: mov edi, [ebp-18h]
  '00490203: push eax
  '00490204: push edi
  '00490205: call 00412934h
  '0049020A: mov [ebp-000000BCh], eax
  '00490210: call esi
  '00490212: mov eax, [ebp+24h]
  '00490215: mov edx, [ebp-000000BCh]
  '0049021B: test eax, eax
  '0049021D: mov [ebp-24h], edx
  '00490220: jnz 490253h
  '00490222: mov eax, [ebp+20h]
  '00490225: push eax
  '00490226: push 00000000h
  '00490228: call 00412AA8h
  '0049022D: call esi
  '0049022F: mov ecx, [ebp+20h]
  '00490232: push ecx
  '00490233: push ebx
  '00490234: call 00412AA8h
  '00490239: call esi
  '0049023B: mov edx, [ebp+18h]
  '0049023E: mov eax, [ebp+14h]
  '00490241: mov ecx, [ebp-44h]
  '00490244: push 00330008h
  '00490249: push edx
  '0049024A: mov edx, [ebp-48h]
  '0049024D: push eax
  '0049024E: push ebx
  '0049024F: push ecx
  '00490250: push edx
  '00490251: jmp 490269h
  '00490253: mov ecx, [ebp+18h]
  '00490256: mov edx, [ebp+14h]
  '00490259: push 00CC0020h
  '0049025E: push ecx
  '0049025F: mov ecx, [ebp-48h]
  '00490262: push edx
  '00490263: push eax
  '00490264: mov eax, [ebp-44h]
  '00490267: push eax
  '00490268: push ecx
  '00490269: push 00000000h
  '0049026B: push 00000000h
  '0049026D: push edi
  '0049026E: call 004129BCh
  '00490273: call esi
  '00490275: push ebx
  '00490276: call 0041289Ch
  '0049027B: mov [ebp-000000BCh], eax
  '00490281: call esi
  '00490283: mov edi, [ebp-000000BCh]
  '00490289: test edi, edi
  '0049028B: mov [ebp-78h], edi
  '0049028E: jz 0049075Bh
  '00490294: mov edx, [ebp-44h]
  '00490297: mov eax, [ebp-48h]
  '0049029A: push edx
  '0049029B: push eax
  '0049029C: push ebx
  '0049029D: call 004128ECh
  '004902A2: mov [ebp-000000BCh], eax
  '004902A8: call esi
  '004902AA: mov eax, [ebp-000000BCh]
  '004902B0: test eax, eax
  '004902B2: mov [ebp-80h], eax
  '004902B5: jz 00490753h
  '004902BB: push eax
  '004902BC: push edi
  '004902BD: call 00412934h
  '004902C2: mov [ebp-000000BCh], eax
  '004902C8: call esi
  '004902CA: mov ecx, [ebp+18h]
  '004902CD: mov edx, [ebp+14h]
  '004902D0: mov eax, [ebp-44h]
  '004902D3: push 00CC0020h
  '004902D8: push ecx
  '004902D9: mov ecx, [ebp-48h]
  '004902DC: push edx
  '004902DD: push ebx
  '004902DE: push eax
  '004902DF: push ecx
  '004902E0: push 00000000h
  '004902E2: push 00000000h
  '004902E4: push edi
  '004902E5: call 004129BCh
  '004902EA: call esi
  '004902EC: mov edx, [ebp-18h]
  '004902EF: mov eax, [ebp-44h]
  '004902F2: mov ecx, [ebp-48h]
  '004902F5: push 008800C6h
  '004902FA: push 00000000h
  '004902FC: push 00000000h
  '004902FE: push edx
  '004902FF: push eax
  '00490300: push ecx
  '00490301: push 00000000h
  '00490303: push 00000000h
  '00490305: push edi
  '00490306: call 004129BCh
  '0049030B: call esi
  '0049030D: mov edx, [ebp+08h]
  '00490310: lea ecx, [ebp-000000B8h]
  '00490316: mov eax, [edx+54h]
  '00490319: push eax
  '0049031A: push ecx
  '0049031B: call [004012F8h]
  '00490321: mov ecx, [ebp-000000B8h]
  '00490327: test ecx, ecx
  '00490329: jz 490361h
  '0049032B: cmp word ptr [ecx], 0001h
  '0049032F: jnz 490361h
  '00490331: mov edi, [ebp+10h]
  '00490334: mov edx, [ecx+14h]
  '00490337: mov eax, [ecx+10h]
  '0049033A: sub edi, 00000001h
  '0049033D: jo 004909A2h
  '00490343: sub edi, edx
  '00490345: cmp edi, eax
  '00490347: jb 490355h
  '00490349: call [00401170h]
  '0049034F: mov ecx, [ebp-000000B8h]
  '00490355: lea eax, [edi*4]
  '0049035C: mov edi, [ebp-78h]
  '0049035F: jmp 49036Dh
  '00490361: call [00401170h]
  '00490367: mov ecx, [ebp-000000B8h]
  '0049036D: mov edx, [ecx+0Ch]
  '00490370: lea ecx, [ebp-000000B4h]
  '00490376: mov eax, [edx+eax]
  '00490379: push eax
  '0049037A: push ecx
  '0049037B: call [004012F8h]
  '00490381: mov ecx, [ebp-000000B4h]
  '00490387: test ecx, ecx
  '00490389: jz 4903B7h
  '0049038B: cmp word ptr [ecx], 0001h
  '0049038F: jnz 4903B7h
  '00490391: mov eax, [ecx+14h]
  '00490394: mov edx, [ecx+10h]
  '00490397: neg eax
  '00490399: cmp eax, edx
  '0049039B: mov [ebp-000000C4h], eax
  '004903A1: jb 4903C3h
  '004903A3: call [00401170h]
  '004903A9: mov ecx, [ebp-000000B4h]
  '004903AF: mov eax, [ebp-000000C4h]
  '004903B5: jmp 4903C3h
  '004903B7: call [00401170h]
  '004903BD: mov ecx, [ebp-000000B4h]
  '004903C3: mov ecx, [ecx+0Ch]
  '004903C6: push 00000000h
  '004903C8: lea edx, [ebp-74h]
  '004903CB: push 00000000h
  '004903CD: push edx
  '004903CE: add ecx, eax
  '004903D0: push 00000000h
  '004903D2: push ecx
  '004903D3: push ebx
  '004903D4: call 00412724h
  '004903D9: mov [ebp-000000BCh], eax
  '004903DF: call esi
  '004903E1: lea edx, [ebp-000000B4h]
  '004903E7: push edx
  '004903E8: call [00401378h]
  '004903EE: lea eax, [ebp-000000B8h]
  '004903F4: push eax
  '004903F5: call [00401378h]
  '004903FB: mov eax, [ebp-000000BCh]
  '00490401: test eax, eax
  '00490403: mov [ebp-68h], eax
  '00490406: jz 0049059Ch
  '0049040C: push ebx
  '0049040D: call 0041289Ch
  '00490412: mov [ebp-000000BCh], eax
  '00490418: call esi
  '0049041A: mov edi, [ebp-000000BCh]
  '00490420: test edi, edi
  '00490422: jz 0049058Eh
  '00490428: mov ecx, [ebp-68h]
  '0049042B: push ecx
  '0049042C: push edi
  '0049042D: call 00412934h
  '00490432: mov [ebp-000000BCh], eax
  '00490438: call esi
  '0049043A: mov edx, [ebp-78h]
  '0049043D: mov eax, [ebp-44h]
  '00490440: mov ecx, [ebp-48h]
  '00490443: push 00CC0020h
  '00490448: mov ebx, [ebp-000000BCh]
  '0049044E: push 00000000h
  '00490450: push 00000000h
  '00490452: push edx
  '00490453: push eax
  '00490454: push ecx
  '00490455: push 00000000h
  '00490457: push 00000000h
  '00490459: push edi
  '0049045A: call 004129BCh
  '0049045F: call esi
  '00490461: push ebx
  '00490462: push edi
  '00490463: call 00412934h
  '00490468: call esi
  '0049046A: push edi
  '0049046B: call 004127F0h
  '00490470: call esi
  '00490472: call 00412AECh
  '00490477: call esi
  '00490479: mov ecx, [ebp-48h]
  '0049047C: lea eax, [ebp-000000BCh]
  '00490482: imul ecx, [ebp-44h]
  '00490486: push eax
  '00490487: mov edi, [ebp+08h]
  '0049048A: movsx eax, word ptr [ebp-40h]
  '0049048E: jo 004909A2h
  '00490494: imul ecx, eax
  '00490497: movsx eax, word ptr [ebp-3Eh]
  '0049049B: jo 004909A2h
  '004904A1: imul ecx, eax
  '004904A4: mov edx, [edi]
  '004904A6: jo 004909A2h
  '004904AC: push ecx
  '004904AD: push edi
  '004904AE: call [edx+00000080h]
  '004904B4: mov ecx, [edi+54h]
  '004904B7: lea edx, [ebp-000000B8h]
  '004904BD: push ecx
  '004904BE: push edx
  '004904BF: call [004012F8h]
  '004904C5: mov ecx, [ebp-000000B8h]
  '004904CB: test ecx, ecx
  '004904CD: jz 490504h
  '004904CF: cmp word ptr [ecx], 0001h
  '004904D3: jnz 490504h
  '004904D5: mov edi, [ebp+10h]
  '004904D8: mov edx, [ecx+14h]
  '004904DB: mov eax, [ecx+10h]
  '004904DE: mov ebx, [00401170h]
  '004904E4: sub edi, 00000001h
  '004904E7: jo 004909A2h
  '004904ED: sub edi, edx
  '004904EF: cmp edi, eax
  '004904F1: jb 4904FBh
  '004904F3: call ebx
  '004904F5: mov ecx, [ebp-000000B8h]
  '004904FB: lea eax, [edi*4]
  '00490502: jmp 490512h
  '00490504: mov ebx, [00401170h]
  '0049050A: call ebx
  '0049050C: mov ecx, [ebp-000000B8h]
  '00490512: mov ecx, [ecx+0Ch]
  '00490515: mov edx, [ecx+eax]
  '00490518: lea eax, [ebp-000000B4h]
  '0049051E: push edx
  '0049051F: push eax
  '00490520: call [004012F8h]
  '00490526: mov ecx, [ebp-000000B4h]
  '0049052C: test ecx, ecx
  '0049052E: jz 490553h
  '00490530: cmp word ptr [ecx], 0001h
  '00490534: jnz 490553h
  '00490536: mov eax, [ebp-70h]
  '00490539: mov edx, [ecx+14h]
  '0049053C: sub eax, edx
  '0049053E: mov edi, eax
  '00490540: mov eax, [ecx+10h]
  '00490543: cmp edi, eax
  '00490545: jb 49054Fh
  '00490547: call ebx
  '00490549: mov ecx, [ebp-000000B4h]
  '0049054F: mov eax, edi
  '00490551: jmp 49055Bh
  '00490553: call ebx
  '00490555: mov ecx, [ebp-000000B4h]
  '0049055B: mov edx, [ebp-000000BCh]
  '00490561: mov ecx, [ecx+0Ch]
  '00490564: push edx
  '00490565: mov edx, [ebp-74h]
  '00490568: add ecx, eax
  '0049056A: push edx
  '0049056B: push ecx
  '0049056C: call 004101ECh
  '00490571: call esi
  '00490573: mov edi, [00401378h]
  '00490579: lea edx, [ebp-000000B4h]
  '0049057F: push edx
  '00490580: call edi
  '00490582: lea eax, [ebp-000000B8h]
  '00490588: push eax
  '00490589: call edi
  '0049058B: mov ebx, [ebp+0Ch]
  '0049058E: mov ecx, [ebp-68h]
  '00490591: push ecx
  '00490592: call 0041297Ch
  '00490597: call esi
  '00490599: mov edi, [ebp-78h]
  '0049059C: push 00000000h
  '0049059E: lea edx, [ebp-74h]
  '004905A1: push 00000000h
  '004905A3: push edx
  '004905A4: lea eax, [ebp-000000B0h]
  '004905AA: push 00000000h
  '004905AC: push eax
  '004905AD: push ebx
  '004905AE: call 00412724h
  '004905B3: mov [ebp-000000BCh], eax
  '004905B9: call esi
  '004905BB: mov eax, [ebp-000000BCh]
  '004905C1: test eax, eax
  '004905C3: mov [ebp-68h], eax
  '004905C6: jz 0049073Fh
  '004905CC: push ebx
  '004905CD: call 0041289Ch
  '004905D2: mov [ebp-000000BCh], eax
  '004905D8: call esi
  '004905DA: mov edi, [ebp-000000BCh]
  '004905E0: test edi, edi
  '004905E2: jz 00490731h
  '004905E8: mov ecx, [ebp-68h]
  '004905EB: push ecx
  '004905EC: push edi
  '004905ED: call 00412934h
  '004905F2: mov [ebp-000000BCh], eax
  '004905F8: call esi
  '004905FA: mov edx, [ebp-18h]
  '004905FD: mov eax, [ebp-44h]
  '00490600: mov ecx, [ebp-48h]
  '00490603: push 00330008h
  '00490608: mov ebx, [ebp-000000BCh]
  '0049060E: push 00000000h
  '00490610: push 00000000h
  '00490612: push edx
  '00490613: push eax
  '00490614: push ecx
  '00490615: push 00000000h
  '00490617: push 00000000h
  '00490619: push edi
  '0049061A: call 004129BCh
  '0049061F: call esi
  '00490621: push ebx
  '00490622: push edi
  '00490623: call 00412934h
  '00490628: call esi
  '0049062A: push edi
  '0049062B: call 004127F0h
  '00490630: call esi
  '00490632: call 00412AECh
  '00490637: call esi
  '00490639: mov edi, [ebp+08h]
  '0049063C: mov ecx, [ebp-48h]
  '0049063F: lea eax, [ebp-000000BCh]
  '00490645: mov edx, [edi]
  '00490647: push eax
  '00490648: push ecx
  '00490649: push edi
  '0049064A: call [edx+00000080h]
  '00490650: mov edx, [edi+54h]
  '00490653: lea eax, [ebp-000000B8h]
  '00490659: push edx
  '0049065A: push eax
  '0049065B: call [004012F8h]
  '00490661: mov ecx, [ebp-000000B8h]
  '00490667: test ecx, ecx
  '00490669: jz 4906A0h
  '0049066B: cmp word ptr [ecx], 0001h
  '0049066F: jnz 4906A0h
  '00490671: mov edi, [ebp+10h]
  '00490674: mov edx, [ecx+14h]
  '00490677: mov eax, [ecx+10h]
  '0049067A: mov ebx, [00401170h]
  '00490680: sub edi, 00000001h
  '00490683: jo 004909A2h
  '00490689: sub edi, edx
  '0049068B: cmp edi, eax
  '0049068D: jb 490697h
  '0049068F: call ebx
  '00490691: mov ecx, [ebp-000000B8h]
  '00490697: lea eax, [edi*4]
  '0049069E: jmp 4906AEh
  '004906A0: mov ebx, [00401170h]
  '004906A6: call ebx
  '004906A8: mov ecx, [ebp-000000B8h]
  '004906AE: mov ecx, [ecx+0Ch]
  '004906B1: mov edx, [ecx+eax]
  '004906B4: lea eax, [ebp-000000B4h]
  '004906BA: push edx
  '004906BB: push eax
  '004906BC: call [004012F8h]
  '004906C2: mov ecx, [ebp-000000B4h]
  '004906C8: test ecx, ecx
  '004906CA: jz 4906EFh
  '004906CC: cmp word ptr [ecx], 0001h
  '004906D0: jnz 4906EFh
  '004906D2: mov eax, [ebp-64h]
  '004906D5: mov edx, [ecx+14h]
  '004906D8: sub eax, edx
  '004906DA: mov edi, eax
  '004906DC: mov eax, [ecx+10h]
  '004906DF: cmp edi, eax
  '004906E1: jb 4906EBh
  '004906E3: call ebx
  '004906E5: mov ecx, [ebp-000000B4h]
  '004906EB: mov eax, edi
  '004906ED: jmp 4906F7h
  '004906EF: call ebx
  '004906F1: mov ecx, [ebp-000000B4h]
  '004906F7: mov edx, [ebp-44h]
  '004906FA: mov ecx, [ecx+0Ch]
  '004906FD: imul edx, [ebp-000000BCh]
  '00490704: jo 004909A2h
  '0049070A: push edx
  '0049070B: mov edx, [ebp-74h]
  '0049070E: add ecx, eax
  '00490710: push edx
  '00490711: push ecx
  '00490712: call 004101ECh
  '00490717: call esi
  '00490719: mov edi, [00401378h]
  '0049071F: lea edx, [ebp-000000B4h]
  '00490725: push edx
  '00490726: call edi
  '00490728: lea eax, [ebp-000000B8h]
  '0049072E: push eax
  '0049072F: call edi
  '00490731: mov ecx, [ebp-68h]
  '00490734: push ecx
  '00490735: call 0041297Ch
  '0049073A: call esi
  '0049073C: mov edi, [ebp-78h]
  '0049073F: mov ebx, [ebp-80h]
  '00490742: push ebx
  '00490743: push edi
  '00490744: call 00412934h
  '00490749: call esi
  '0049074B: push ebx
  '0049074C: call 0041297Ch
  '00490751: call esi
  '00490753: push edi
  '00490754: call 004127F0h
  '00490759: call esi
  '0049075B: mov edx, [ebp-24h]
  '0049075E: mov eax, [ebp-18h]
  '00490761: push edx
  '00490762: push eax
  '00490763: call 00412934h
  '00490768: call esi
  '0049076A: mov ecx, [ebp-60h]
  '0049076D: push ecx
  '0049076E: call 0041297Ch
  '00490773: call esi
  '00490775: mov edx, [ebp-18h]
  '00490778: push edx
  '00490779: call 004127F0h
  '0049077E: call esi
  '00490780: mov eax, [ebp+08h]
  '00490783: lea edx, [ebp-000000B8h]
  '00490789: mov ecx, [eax+54h]
  '0049078C: push ecx
  '0049078D: push edx
  '0049078E: call [004012F8h]
  '00490794: mov ecx, [ebp-000000B8h]
  '0049079A: test ecx, ecx
  '0049079C: jz 4907D3h
  '0049079E: cmp word ptr [ecx], 0001h
  '004907A2: jnz 4907D3h
  '004907A4: mov ebx, [ebp+10h]
  '004907A7: mov edx, [ecx+14h]
  '004907AA: mov eax, [ecx+10h]
  '004907AD: mov edi, ebx
  '004907AF: sub edi, 00000001h
  '004907B2: jo 004909A2h
  '004907B8: sub edi, edx
  '004907BA: cmp edi, eax
  '004907BC: jb 4907CAh
  '004907BE: call [00401170h]
  '004907C4: mov ecx, [ebp-000000B8h]
  '004907CA: lea eax, [edi*4]
  '004907D1: jmp 4907E2h
  '004907D3: call [00401170h]
  '004907D9: mov ecx, [ebp-000000B8h]
  '004907DF: mov ebx, [ebp+10h]
  '004907E2: mov ecx, [ecx+0Ch]
  '004907E5: mov edx, [ecx+eax]
  '004907E8: lea eax, [ebp-000000B4h]
  '004907EE: push edx
  '004907EF: push eax
  '004907F0: call [004012F8h]
  '004907F6: mov ecx, [ebp-000000B4h]
  '004907FC: test ecx, ecx
  '004907FE: jz 490822h
  '00490800: cmp word ptr [ecx], 0001h
  '00490804: jnz 490822h
  '00490806: mov edi, [ecx+14h]
  '00490809: mov eax, [ecx+10h]
  '0049080C: neg edi
  '0049080E: cmp edi, eax
  '00490810: jb 49081Eh
  '00490812: call [00401170h]
  '00490818: mov ecx, [ebp-000000B4h]
  '0049081E: mov eax, edi
  '00490820: jmp 49082Eh
  '00490822: call [00401170h]
  '00490828: mov ecx, [ebp-000000B4h]
  '0049082E: mov ecx, [ecx+0Ch]
  '00490831: push 00000028h
  '00490833: add ecx, eax
  '00490835: lea edx, [ebp-4Ch]
  '00490838: push ecx
  '00490839: push edx
  '0049083A: call 004101ECh
  '0049083F: call esi
  '00490841: mov edi, [00401378h]
  '00490847: lea eax, [ebp-000000B4h]
  '0049084D: push eax
  '0049084E: call edi
  '00490850: lea ecx, [ebp-000000B8h]
  '00490856: push ecx
  '00490857: call edi
  '00490859: mov edx, [ebp-44h]
  '0049085C: mov eax, [ebp+08h]
  '0049085F: imul edx, 02h
  '00490862: mov ecx, [eax+54h]
  '00490865: jo 004909A2h
  '0049086B: mov [ebp-44h], edx
  '0049086E: lea edx, [ebp-000000B8h]
  '00490874: push ecx
  '00490875: push edx
  '00490876: call [004012F8h]
  '0049087C: mov ecx, [ebp-000000B8h]
  '00490882: test ecx, ecx
  '00490884: jz 4908B6h
  '00490886: cmp word ptr [ecx], 0001h
  '0049088A: jnz 4908B6h
  '0049088C: mov edx, [ecx+14h]
  '0049088F: mov eax, [ecx+10h]
  '00490892: sub ebx, 00000001h
  '00490895: jo 004909A2h
  '0049089B: sub ebx, edx
  '0049089D: cmp ebx, eax
  '0049089F: jb 4908ADh
  '004908A1: call [00401170h]
  '004908A7: mov ecx, [ebp-000000B8h]
  '004908AD: lea eax, [ebx*4]
  '004908B4: jmp 4908C2h
  '004908B6: call [00401170h]
  '004908BC: mov ecx, [ebp-000000B8h]
  '004908C2: mov ecx, [ecx+0Ch]
  '004908C5: mov edx, [ecx+eax]
  '004908C8: lea eax, [ebp-000000B4h]
  '004908CE: push edx
  '004908CF: push eax
  '004908D0: call [004012F8h]
  '004908D6: mov ecx, [ebp-000000B4h]
  '004908DC: test ecx, ecx
  '004908DE: jz 490902h
  '004908E0: cmp word ptr [ecx], 0001h
  '004908E4: jnz 490902h
  '004908E6: mov ebx, [ecx+14h]
  '004908E9: mov eax, [ecx+10h]
  '004908EC: neg ebx
  '004908EE: cmp ebx, eax
  '004908F0: jb 4908FEh
  '004908F2: call [00401170h]
  '004908F8: mov ecx, [ebp-000000B4h]
  '004908FE: mov eax, ebx
  '00490900: jmp 49090Eh
  '00490902: call [00401170h]
  '00490908: mov ecx, [ebp-000000B4h]
  '0049090E: mov ecx, [ecx+0Ch]
  '00490911: lea edx, [ebp-4Ch]
  '00490914: push 00000028h
  '00490916: add ecx, eax
  '00490918: push edx
  '00490919: push ecx
  '0049091A: call 004101ECh
  '0049091F: call esi
  '00490921: lea edx, [ebp-000000B4h]
  '00490927: push edx
  '00490928: call edi
  '0049092A: lea eax, [ebp-000000B8h]
  '00490930: push eax
  '00490931: call edi
  '00490933: wait 
  '00490934: push 00490964h
  '00490939: jmp 490963h
  '0049093B: test byte ptr [ebp-04h], 04h
  '0049093F: jz 49094Ah
  '00490941: lea ecx, [ebp-5Ch]
  '00490944: call [00401034h]
  '0049094A: mov esi, [00401378h]
  '00490950: lea ecx, [ebp-000000B4h]
  '00490956: push ecx
  '00490957: call esi
  '00490959: lea edx, [ebp-000000B8h]
  '0049095F: push edx
  '00490960: call esi
  '00490962: ret 
End Sub
Private Sub unknown_48BEA0
  '0048BEA0: push ebp
  '0048BEA1: mov ebp, esp
  '0048BEA3: sub esp, 00000008h
  '0048BEA6: push 00403796h
  '0048BEAB: mov eax, fs:[00h]
  '0048BEB1: push eax
  '0048BEB2: mov fs:[00000000h], esp
  '0048BEB9: sub esp, 00000050h
  '0048BEBC: push ebx
  '0048BEBD: push esi
  '0048BEBE: push edi
  '0048BEBF: mov [ebp-08h], esp
  '0048BEC2: mov [ebp-04h], 00402AA8h
  '0048BEC9: mov esi, [ebp+08h]
  '0048BECC: xor ebx, ebx
  '0048BECE: mov [ebp-18h], ebx
  '0048BED1: mov [ebp-1Ch], ebx
  '0048BED4: mov eax, [esi]
  '0048BED6: mov [ebp-20h], ebx
  '0048BED9: cmp eax, 004A3440h
  '0048BEDE: mov [ebp-24h], ebx
  '0048BEE1: mov [ebp-34h], ebx
  '0048BEE4: jz 48BEECh
  '0048BEE6: call [00401238h]
  '0048BEEC: mov eax, [ebp+0Ch]
  '0048BEEF: lea ecx, [esi+34h]
  '0048BEF2: mov edx, [eax]
  '0048BEF4: call [004012C4h]
  '0048BEFA: mov edx, [ebp+10h]
  '0048BEFD: lea ecx, [ebp-34h]
  '0048BF00: call [0040102Ch]
  '0048BF06: mov edx, eax
  '0048BF08: lea ecx, [esi+38h]
  '0048BF0B: call [00401324h]
  '0048BF11: mov ecx, [ebp+14h]
  '0048BF14: lea edx, [esi+48h]
  '0048BF17: push ecx
  '0048BF18: push edx
  '0048BF19: push 00000006h
  '0048BF1B: call [00401088h]
  '0048BF21: mov cx, [esi+4Ch]
  '0048BF25: mov edi, [004011E4h]
  '0048BF2B: sub cx, 0001h
  '0048BF2F: push ebx
  '0048BF30: jo 0048C27Ah
  '0048BF36: movsx edx, cx
  '0048BF39: push edx
  '0048BF3A: lea eax, [esi+50h]
  '0048BF3D: push 00000001h
  '0048BF3F: push ebx
  '0048BF40: push eax
  '0048BF41: push 00000010h
  '0048BF43: push ebx
  '0048BF44: mov [ebp-58h], eax
  '0048BF47: call edi
  '0048BF49: mov cx, [esi+4Ch]
  '0048BF4D: push ebx
  '0048BF4E: sub cx, 0001h
  '0048BF52: lea eax, [esi+54h]
  '0048BF55: jo 0048C27Ah
  '0048BF5B: movsx edx, cx
  '0048BF5E: push edx
  '0048BF5F: push 00000001h
  '0048BF61: push 004121DCh
  '0048BF66: push eax
  '0048BF67: push 00000004h
  '0048BF69: push ebx
  '0048BF6A: mov [ebp-5Ch], eax
  '0048BF6D: call edi
  '0048BF6F: mov ax, [esi+4Ch]
  '0048BF73: add esp, 00000038h
  '0048BF76: mov ebx, [ebp+18h]
  '0048BF79: sub ax, 0001h
  '0048BF7D: jo 0048C27Ah
  '0048BF83: movsx ecx, ax
  '0048BF86: xor esi, esi
  '0048BF88: mov [ebp-50h], ecx
  '0048BF8B: mov [ebp-14h], esi
  '0048BF8E: cmp esi, [ebp-50h]
  '0048BF91: jnle 0048C23Eh
  '0048BF97: mov eax, [ebx]
  '0048BF99: test eax, eax
  '0048BF9B: jz 48BFBFh
  '0048BF9D: cmp word ptr [eax], 0001h
  '0048BFA1: jnz 48BFBFh
  '0048BFA3: mov edx, [eax+14h]
  '0048BFA6: mov ecx, [eax+10h]
  '0048BFA9: sub esi, edx
  '0048BFAB: cmp esi, ecx
  '0048BFAD: jb 48BFB5h
  '0048BFAF: call [00401170h]
  '0048BFB5: shl esi, 04h
  '0048BFB8: mov edi, esi
  '0048BFBA: mov esi, [ebp-14h]
  '0048BFBD: jmp 48BFC7h
  '0048BFBF: call [00401170h]
  '0048BFC5: mov edi, eax
  '0048BFC7: mov edx, [ebp-58h]
  '0048BFCA: mov eax, [edx]
  '0048BFCC: test eax, eax
  '0048BFCE: jz 48BFF2h
  '0048BFD0: cmp word ptr [eax], 0001h
  '0048BFD4: jnz 48BFF2h
  '0048BFD6: mov edx, [eax+14h]
  '0048BFD9: mov ecx, [eax+10h]
  '0048BFDC: sub esi, edx
  '0048BFDE: cmp esi, ecx
  '0048BFE0: jb 48BFE8h
  '0048BFE2: call [00401170h]
  '0048BFE8: shl esi, 04h
  '0048BFEB: mov eax, esi
  '0048BFED: mov esi, [ebp-14h]
  '0048BFF0: jmp 48BFF8h
  '0048BFF2: call [00401170h]
  '0048BFF8: mov ecx, [ebx]
  '0048BFFA: mov edx, [ecx+0Ch]
  '0048BFFD: mov ecx, [ebp-58h]
  '0048C000: add edx, edi
  '0048C002: push edx
  '0048C003: mov edx, [ecx]
  '0048C005: mov ecx, [edx+0Ch]
  '0048C008: add ecx, eax
  '0048C00A: push ecx
  '0048C00B: push 00000010h
  '0048C00D: call [00401088h]
  '0048C013: mov eax, [ebx]
  '0048C015: test eax, eax
  '0048C017: jz 48C038h
  '0048C019: cmp word ptr [eax], 0001h
  '0048C01D: jnz 48C038h
  '0048C01F: mov edx, [eax+14h]
  '0048C022: mov ecx, [eax+10h]
  '0048C025: mov edi, [00401170h]
  '0048C02B: sub esi, edx
  '0048C02D: cmp esi, ecx
  '0048C02F: jb 48C033h
  '0048C031: call edi
  '0048C033: shl esi, 04h
  '0048C036: jmp 48C046h
  '0048C038: call [00401170h]
  '0048C03E: mov edi, [00401170h]
  '0048C044: mov esi, eax
  '0048C046: mov edx, [ebp-5Ch]
  '0048C049: mov eax, [edx]
  '0048C04B: test eax, eax
  '0048C04D: jz 48C079h
  '0048C04F: cmp word ptr [eax], 0001h
  '0048C053: jnz 48C079h
  '0048C055: mov edi, [ebp-14h]
  '0048C058: mov edx, [eax+14h]
  '0048C05B: mov ecx, [eax+10h]
  '0048C05E: sub edi, edx
  '0048C060: cmp edi, ecx
  '0048C062: jb 48C06Ah
  '0048C064: call [00401170h]
  '0048C06A: lea eax, [edi*4]
  '0048C071: mov edi, [00401170h]
  '0048C077: jmp 48C07Bh
  '0048C079: call edi
  '0048C07B: mov ecx, [ebx]
  '0048C07D: push 00000000h
  '0048C07F: mov edx, [ecx+0Ch]
  '0048C082: mov ecx, [edx+esi+08h]
  '0048C086: mov edx, [ebp-5Ch]
  '0048C089: sub ecx, 00000001h
  '0048C08C: jo 0048C27Ah
  '0048C092: push ecx
  '0048C093: mov ecx, [edx]
  '0048C095: push 00000001h
  '0048C097: push 00000011h
  '0048C099: mov edx, [ecx+0Ch]
  '0048C09C: add edx, eax
  '0048C09E: push edx
  '0048C09F: push 00000001h
  '0048C0A1: push 00000080h
  '0048C0A6: call [004011BCh]
  '0048C0AC: mov eax, [ebx]
  '0048C0AE: add esp, 0000001Ch
  '0048C0B1: test eax, eax
  '0048C0B3: jz 48C0D4h
  '0048C0B5: cmp word ptr [eax], 0001h
  '0048C0B9: jnz 48C0D4h
  '0048C0BB: mov esi, [ebp-14h]
  '0048C0BE: mov edx, [eax+14h]
  '0048C0C1: mov ecx, [eax+10h]
  '0048C0C4: sub esi, edx
  '0048C0C6: cmp esi, ecx
  '0048C0C8: jb 48C0CCh
  '0048C0CA: call edi
  '0048C0CC: shl esi, 04h
  '0048C0CF: mov [ebp-60h], esi
  '0048C0D2: jmp 48C0D9h
  '0048C0D4: call edi
  '0048C0D6: mov [ebp-60h], eax
  '0048C0D9: mov eax, [ebp+1Ch]
  '0048C0DC: mov esi, [004012F8h]
  '0048C0E2: lea edx, [ebp-24h]
  '0048C0E5: mov ecx, [eax]
  '0048C0E7: push ecx
  '0048C0E8: push edx
  '0048C0E9: call esi
  '0048C0EB: mov ecx, [ebp-24h]
  '0048C0EE: test ecx, ecx
  '0048C0F0: jz 48C11Fh
  '0048C0F2: cmp word ptr [ecx], 0001h
  '0048C0F6: jnz 48C11Fh
  '0048C0F8: mov edi, [ebp-14h]
  '0048C0FB: mov edx, [ecx+14h]
  '0048C0FE: mov eax, [ecx+10h]
  '0048C101: sub edi, edx
  '0048C103: cmp edi, eax
  '0048C105: jb 48C110h
  '0048C107: call [00401170h]
  '0048C10D: mov ecx, [ebp-24h]
  '0048C110: lea eax, [edi*4]
  '0048C117: mov edi, [00401170h]
  '0048C11D: jmp 48C124h
  '0048C11F: call edi
  '0048C121: mov ecx, [ebp-24h]
  '0048C124: mov ecx, [ecx+0Ch]
  '0048C127: mov edx, [ecx+eax]
  '0048C12A: lea eax, [ebp-20h]
  '0048C12D: push edx
  '0048C12E: push eax
  '0048C12F: call esi
  '0048C131: mov eax, [ebp-20h]
  '0048C134: test eax, eax
  '0048C136: jz 48C15Ah
  '0048C138: cmp word ptr [eax], 0001h
  '0048C13C: jnz 48C15Ah
  '0048C13E: mov edi, [eax+14h]
  '0048C141: mov ecx, [eax+10h]
  '0048C144: neg edi
  '0048C146: cmp edi, ecx
  '0048C148: jb 48C150h
  '0048C14A: call [00401170h]
  '0048C150: mov esi, edi
  '0048C152: mov edi, [00401170h]
  '0048C158: jmp 48C15Eh
  '0048C15A: call edi
  '0048C15C: mov esi, eax
  '0048C15E: mov ecx, [ebp-5Ch]
  '0048C161: lea eax, [ebp-1Ch]
  '0048C164: mov edx, [ecx]
  '0048C166: push edx
  '0048C167: push eax
  '0048C168: call [004012F8h]
  '0048C16E: mov ecx, [ebp-1Ch]
  '0048C171: test ecx, ecx
  '0048C173: jz 48C1A2h
  '0048C175: cmp word ptr [ecx], 0001h
  '0048C179: jnz 48C1A2h
  '0048C17B: mov edi, [ebp-14h]
  '0048C17E: mov edx, [ecx+14h]
  '0048C181: mov eax, [ecx+10h]
  '0048C184: sub edi, edx
  '0048C186: cmp edi, eax
  '0048C188: jb 48C193h
  '0048C18A: call [00401170h]
  '0048C190: mov ecx, [ebp-1Ch]
  '0048C193: lea eax, [edi*4]
  '0048C19A: mov edi, [00401170h]
  '0048C1A0: jmp 48C1A7h
  '0048C1A2: call edi
  '0048C1A4: mov ecx, [ebp-1Ch]
  '0048C1A7: mov ecx, [ecx+0Ch]
  '0048C1AA: mov edx, [ecx+eax]
  '0048C1AD: lea eax, [ebp-18h]
  '0048C1B0: push edx
  '0048C1B1: push eax
  '0048C1B2: call [004012F8h]
  '0048C1B8: mov ecx, [ebp-18h]
  '0048C1BB: test ecx, ecx
  '0048C1BD: jz 48C1DEh
  '0048C1BF: cmp word ptr [ecx], 0001h
  '0048C1C3: jnz 48C1DEh
  '0048C1C5: mov edi, [ecx+14h]
  '0048C1C8: mov eax, [ecx+10h]
  '0048C1CB: neg edi
  '0048C1CD: cmp edi, eax
  '0048C1CF: jb 48C1DAh
  '0048C1D1: call [00401170h]
  '0048C1D7: mov ecx, [ebp-18h]
  '0048C1DA: mov eax, edi
  '0048C1DC: jmp 48C1E3h
  '0048C1DE: call edi
  '0048C1E0: mov ecx, [ebp-18h]
  '0048C1E3: mov edx, [ebx]
  '0048C1E5: mov edi, [ebp-60h]
  '0048C1E8: mov ecx, [ecx+0Ch]
  '0048C1EB: mov edx, [edx+0Ch]
  '0048C1EE: add ecx, eax
  '0048C1F0: mov edx, [edx+edi+08h]
  '0048C1F4: push edx
  '0048C1F5: mov edx, [ebp-20h]
  '0048C1F8: mov edx, [edx+0Ch]
  '0048C1FB: add edx, esi
  '0048C1FD: push edx
  '0048C1FE: push ecx
  '0048C1FF: call 004101ECh
  '0048C204: call [004010A4h]
  '0048C20A: mov esi, [00401378h]
  '0048C210: lea edx, [ebp-18h]
  '0048C213: push edx
  '0048C214: call esi
  '0048C216: lea eax, [ebp-1Ch]
  '0048C219: push eax
  '0048C21A: call esi
  '0048C21C: lea ecx, [ebp-20h]
  '0048C21F: push ecx
  '0048C220: call esi
  '0048C222: lea edx, [ebp-24h]
  '0048C225: push edx
  '0048C226: call esi
  '0048C228: mov ecx, [ebp-14h]
  '0048C22B: mov eax, 00000001h
  '0048C230: add eax, ecx
  '0048C232: jo 48C27Ah
  '0048C234: mov [ebp-14h], eax
  '0048C237: mov esi, eax
  '0048C239: jmp 0048BF8Eh
  '0048C23E: push 0048C265h
  '0048C243: jmp 48C264h
  '0048C245: mov esi, [00401378h]
  '0048C24B: lea eax, [ebp-18h]
  '0048C24E: push eax
  '0048C24F: call esi
  '0048C251: lea ecx, [ebp-1Ch]
  '0048C254: push ecx
  '0048C255: call esi
  '0048C257: lea edx, [ebp-20h]
  '0048C25A: push edx
  '0048C25B: call esi
  '0048C25D: lea eax, [ebp-24h]
  '0048C260: push eax
  '0048C261: call esi
  '0048C263: ret 
End Sub
Private Sub unknown_48C3B0
  '0048C3B0: push ebp
  '0048C3B1: mov ebp, esp
  '0048C3B3: sub esp, 0000000Ch
  '0048C3B6: push 00403796h
  '0048C3BB: mov eax, fs:[00h]
  '0048C3C1: push eax
  '0048C3C2: mov fs:[00000000h], esp
  '0048C3C9: sub esp, 00000040h
  '0048C3CC: push ebx
  '0048C3CD: push esi
  '0048C3CE: push edi
  '0048C3CF: mov [ebp-0Ch], esp
  '0048C3D2: mov [ebp-08h], 00402AD8h
  '0048C3D9: xor eax, eax
  '0048C3DB: xor edx, edx
  '0048C3DD: mov [ebp-2Ch], eax
  '0048C3E0: xor ecx, ecx
  '0048C3E2: mov [ebp-28h], eax
  '0048C3E5: mov [ebp-40h], edx
  '0048C3E8: mov [ebp-24h], eax
  '0048C3EB: mov [ebp-3Ch], edx
  '0048C3EE: mov [ebp-20h], eax
  '0048C3F1: mov [ebp-38h], edx
  '0048C3F4: mov [ebp-1Ch], eax
  '0048C3F7: mov eax, [ebp+10h]
  '0048C3FA: mov [ebp-18h], ecx
  '0048C3FD: mov [ebp-30h], ecx
  '0048C400: mov [eax], ecx
  '0048C402: mov eax, [ebp+0Ch]
  '0048C405: cmp eax, ecx
  '0048C407: mov [ebp-34h], edx
  '0048C40A: mov [ebp-44h], ecx
  '0048C40D: jz 0048C4EBh
  '0048C413: mov esi, [004011F4h]
  '0048C419: mov ecx, 0000008Bh
  '0048C41E: mov [ebp-2Ch], 00000014h
  '0048C425: mov [ebp-28h], 00000003h
  '0048C42C: mov [ebp-24h], eax
  '0048C42F: mov [ebp-40h], 7BF80980h
  '0048C436: mov word ptr [ebp-3Ch], BF32h
  '0048C43C: mov word ptr [ebp-3Ah], 101Ah
  '0048C442: call esi
  '0048C444: mov ecx, 000000BBh
  '0048C449: mov [ebp-38h], al
  '0048C44C: call esi
  '0048C44E: xor ecx, ecx
  '0048C450: mov [ebp-37h], al
  '0048C453: call esi
  '0048C455: mov ecx, 000000AAh
  '0048C45A: mov [ebp-36h], al
  '0048C45D: call esi
  '0048C45F: xor ecx, ecx
  '0048C461: mov [ebp-35h], al
  '0048C464: call esi
  '0048C466: mov ecx, 00000030h
  '0048C46B: mov [ebp-34h], al
  '0048C46E: call esi
  '0048C470: mov ecx, 0000000Ch
  '0048C475: mov [ebp-33h], al
  '0048C478: call esi
  '0048C47A: mov ecx, 000000ABh
  '0048C47F: mov [ebp-32h], al
  '0048C482: call esi
  '0048C484: mov ecx, [ebp-30h]
  '0048C487: mov esi, [00401340h]
  '0048C48D: push 0042176Ch
  '0048C492: push ecx
  '0048C493: mov [ebp-31h], al
  '0048C496: call esi
  '0048C498: mov edi, [004010F0h]
  '0048C49E: lea edx, [ebp-44h]
  '0048C4A1: push eax
  '0048C4A2: push edx
  '0048C4A3: call edi
  '0048C4A5: lea eax, [ebp-44h]
  '0048C4A8: lea ecx, [ebp-40h]
  '0048C4AB: push eax
  '0048C4AC: push FFFFFFFFh
  '0048C4AE: lea edx, [ebp-2Ch]
  '0048C4B1: push ecx
  '0048C4B2: push edx
  '0048C4B3: call 00412BE4h
  '0048C4B8: call [004010A4h]
  '0048C4BE: mov eax, [ebp-44h]
  '0048C4C1: push 00412CE8h
  '0048C4C6: push eax
  '0048C4C7: call esi
  '0048C4C9: lea ecx, [ebp-30h]
  '0048C4CC: push eax
  '0048C4CD: push ecx
  '0048C4CE: call edi
  '0048C4D0: lea ecx, [ebp-44h]
  '0048C4D3: call [00401388h]
  '0048C4D9: mov edx, [ebp-30h]
  '0048C4DC: push 0042176Ch
  '0048C4E1: push edx
  '0048C4E2: call esi
  '0048C4E4: push eax
  '0048C4E5: lea eax, [ebp-18h]
  '0048C4E8: push eax
  '0048C4E9: call edi
  '0048C4EB: push 0048C515h
  '0048C4F0: jmp 48C50Bh
  '0048C4F2: test byte ptr [ebp-04h], 04h
  '0048C4F6: jz 48C501h
  '0048C4F8: lea ecx, [ebp-18h]
  '0048C4FB: call [00401388h]
  '0048C501: lea ecx, [ebp-44h]
  '0048C504: call [00401388h]
  '0048C50A: ret 
End Sub
Private Sub unknown_4909B0
  '004909B0: push ebp
  '004909B1: mov ebp, esp
  '004909B3: sub esp, 00000008h
  '004909B6: push 00403796h
  '004909BB: mov eax, fs:[00h]
  '004909C1: push eax
  '004909C2: mov fs:[00000000h], esp
  '004909C9: sub esp, 000000ECh
  '004909CF: push ebx
  '004909D0: push esi
  '004909D1: push edi
  '004909D2: mov [ebp-08h], esp
  '004909D5: mov [ebp-04h], 00402BB8h
  '004909DC: mov ecx, 0000000Ah
  '004909E1: xor eax, eax
  '004909E3: lea edi, [ebp-4Ch]
  '004909E6: xor esi, esi
  '004909E8: rep stosd 
  '004909EA: mov ecx, 0000000Ch
  '004909EF: lea edi, [ebp-00000084h]
  '004909F5: rep stosd 
  '004909F7: mov eax, [ebp+14h]
  '004909FA: mov [ebp-18h], esi
  '004909FD: cmp eax, esi
  '004909FF: mov [ebp-00000088h], esi
  '00490A05: mov [ebp-0000008Ch], esi
  '00490A0B: mov [ebp-00000090h], esi
  '00490A11: mov [ebp-00000094h], esi
  '00490A17: mov [ebp-00000098h], esi
  '00490A1D: jnz 0049139Ch
  '00490A23: mov eax, [ebp+0Ch]
  '00490A26: push eax
  '00490A27: call 0041289Ch
  '00490A2C: mov ebx, [004010A4h]
  '00490A32: mov [ebp-00000098h], eax
  '00490A38: call ebx
  '00490A3A: mov eax, [ebp-00000098h]
  '00490A40: cmp eax, esi
  '00490A42: mov [ebp-20h], eax
  '00490A45: jz 00491AEEh
  '00490A4B: mov ecx, [ebp+08h]
  '00490A4E: mov eax, [ecx+50h]
  '00490A51: cmp eax, esi
  '00490A53: jz 490A80h
  '00490A55: cmp word ptr [eax], 0001h
  '00490A59: jnz 490A80h
  '00490A5B: mov esi, [ebp+10h]
  '00490A5E: mov edx, [eax+14h]
  '00490A61: mov ecx, [eax+10h]
  '00490A64: sub esi, 00000001h
  '00490A67: jo 00491B44h
  '00490A6D: sub esi, edx
  '00490A6F: cmp esi, ecx
  '00490A71: jb 490A79h
  '00490A73: call [00401170h]
  '00490A79: shl esi, 04h
  '00490A7C: mov edi, esi
  '00490A7E: jmp 490A88h
  '00490A80: call [00401170h]
  '00490A86: mov edi, eax
  '00490A88: mov edx, [ebp+08h]
  '00490A8B: mov eax, [edx+50h]
  '00490A8E: test eax, eax
  '00490A90: jz 490ABDh
  '00490A92: cmp word ptr [eax], 0001h
  '00490A96: jnz 490ABDh
  '00490A98: mov esi, [ebp+10h]
  '00490A9B: mov edx, [eax+14h]
  '00490A9E: mov ecx, [eax+10h]
  '00490AA1: sub esi, 00000001h
  '00490AA4: jo 00491B44h
  '00490AAA: sub esi, edx
  '00490AAC: cmp esi, ecx
  '00490AAE: jb 490AB6h
  '00490AB0: call [00401170h]
  '00490AB6: shl esi, 04h
  '00490AB9: mov eax, esi
  '00490ABB: jmp 490AC3h
  '00490ABD: call [00401170h]
  '00490AC3: mov ecx, [ebp+08h]
  '00490AC6: mov edx, [ecx+50h]
  '00490AC9: mov ecx, [edx+0Ch]
  '00490ACC: xor edx, edx
  '00490ACE: mov dl, [ecx+edi+01h]
  '00490AD2: push edx
  '00490AD3: xor edx, edx
  '00490AD5: mov dl, [ecx+eax]
  '00490AD8: mov eax, [ebp+0Ch]
  '00490ADB: push edx
  '00490ADC: push eax
  '00490ADD: call 004128ECh
  '00490AE2: mov [ebp-00000098h], eax
  '00490AE8: call ebx
  '00490AEA: mov eax, [ebp-00000098h]
  '00490AF0: mov esi, eax
  '00490AF2: test eax, eax
  '00490AF4: mov [ebp-14h], esi
  '00490AF7: jz 00491386h
  '00490AFD: mov ecx, [ebp-20h]
  '00490B00: push eax
  '00490B01: push ecx
  '00490B02: call 00412934h
  '00490B07: mov [ebp-00000098h], eax
  '00490B0D: call ebx
  '00490B0F: mov eax, [ebp-00000098h]
  '00490B15: test eax, eax
  '00490B17: mov [ebp-24h], eax
  '00490B1A: jz 0049135Eh
  '00490B20: mov edx, [ebp+08h]
  '00490B23: mov ebx, [004012F8h]
  '00490B29: lea ecx, [ebp-0000008Ch]
  '00490B2F: mov eax, [edx+54h]
  '00490B32: push eax
  '00490B33: push ecx
  '00490B34: call ebx
  '00490B36: mov ecx, [ebp-0000008Ch]
  '00490B3C: test ecx, ecx
  '00490B3E: jz 490B75h
  '00490B40: cmp word ptr [ecx], 0001h
  '00490B44: jnz 490B75h
  '00490B46: mov esi, [ebp+10h]
  '00490B49: mov edx, [ecx+14h]
  '00490B4C: mov eax, [ecx+10h]
  '00490B4F: mov edi, [00401170h]
  '00490B55: sub esi, 00000001h
  '00490B58: jo 00491B44h
  '00490B5E: sub esi, edx
  '00490B60: cmp esi, eax
  '00490B62: jb 490B6Ch
  '00490B64: call edi
  '00490B66: mov ecx, [ebp-0000008Ch]
  '00490B6C: lea eax, [esi*4]
  '00490B73: jmp 490B83h
  '00490B75: mov edi, [00401170h]
  '00490B7B: call edi
  '00490B7D: mov ecx, [ebp-0000008Ch]
  '00490B83: mov edx, [ecx+0Ch]
  '00490B86: lea ecx, [ebp-00000088h]
  '00490B8C: mov eax, [edx+eax]
  '00490B8F: push eax
  '00490B90: push ecx
  '00490B91: call ebx
  '00490B93: mov ecx, [ebp-00000088h]
  '00490B99: test ecx, ecx
  '00490B9B: jz 490BBBh
  '00490B9D: cmp word ptr [ecx], 0001h
  '00490BA1: jnz 490BBBh
  '00490BA3: mov esi, [ecx+14h]
  '00490BA6: mov eax, [ecx+10h]
  '00490BA9: neg esi
  '00490BAB: cmp esi, eax
  '00490BAD: jb 490BB7h
  '00490BAF: call edi
  '00490BB1: mov ecx, [ebp-00000088h]
  '00490BB7: mov eax, esi
  '00490BB9: jmp 490BC3h
  '00490BBB: call edi
  '00490BBD: mov ecx, [ebp-00000088h]
  '00490BC3: mov edx, [ecx+0Ch]
  '00490BC6: push 00000028h
  '00490BC8: add edx, eax
  '00490BCA: lea eax, [ebp-4Ch]
  '00490BCD: push edx
  '00490BCE: push eax
  '00490BCF: call 004101ECh
  '00490BD4: call [004010A4h]
  '00490BDA: mov edi, [00401378h]
  '00490BE0: lea ecx, [ebp-00000088h]
  '00490BE6: push ecx
  '00490BE7: call edi
  '00490BE9: lea edx, [ebp-0000008Ch]
  '00490BEF: push edx
  '00490BF0: call edi
  '00490BF2: mov eax, [ebp-44h]
  '00490BF5: mov esi, [ebp+08h]
  '00490BF8: cdq 
  '00490BF9: sub eax, edx
  '00490BFB: lea ecx, [ebp-0000008Ch]
  '00490C01: sar eax, 01h
  '00490C03: mov [ebp-44h], eax
  '00490C06: mov eax, [esi+54h]
  '00490C09: push eax
  '00490C0A: push ecx
  '00490C0B: call ebx
  '00490C0D: mov ecx, [ebp-0000008Ch]
  '00490C13: test ecx, ecx
  '00490C15: jz 490C4Dh
  '00490C17: cmp word ptr [ecx], 0001h
  '00490C1B: jnz 490C4Dh
  '00490C1D: mov esi, [ebp+10h]
  '00490C20: mov edx, [ecx+14h]
  '00490C23: mov eax, [ecx+10h]
  '00490C26: sub esi, 00000001h
  '00490C29: jo 00491B44h
  '00490C2F: sub esi, edx
  '00490C31: cmp esi, eax
  '00490C33: jb 490C41h
  '00490C35: call [00401170h]
  '00490C3B: mov ecx, [ebp-0000008Ch]
  '00490C41: lea eax, [esi*4]
  '00490C48: mov esi, [ebp+08h]
  '00490C4B: jmp 490C59h
  '00490C4D: call [00401170h]
  '00490C53: mov ecx, [ebp-0000008Ch]
  '00490C59: mov edx, [ecx+0Ch]
  '00490C5C: lea ecx, [ebp-00000088h]
  '00490C62: mov eax, [edx+eax]
  '00490C65: push eax
  '00490C66: push ecx
  '00490C67: call ebx
  '00490C69: mov ecx, [ebp-00000088h]
  '00490C6F: test ecx, ecx
  '00490C71: jz 490C98h
  '00490C73: cmp word ptr [ecx], 0001h
  '00490C77: jnz 490C98h
  '00490C79: mov esi, [ecx+14h]
  '00490C7C: mov eax, [ecx+10h]
  '00490C7F: neg esi
  '00490C81: cmp esi, eax
  '00490C83: jb 490C91h
  '00490C85: call [00401170h]
  '00490C8B: mov ecx, [ebp-00000088h]
  '00490C91: mov eax, esi
  '00490C93: mov esi, [ebp+08h]
  '00490C96: jmp 490CA4h
  '00490C98: call [00401170h]
  '00490C9E: mov ecx, [ebp-00000088h]
  '00490CA4: mov ecx, [ecx+0Ch]
  '00490CA7: lea edx, [ebp-4Ch]
  '00490CAA: push 00000028h
  '00490CAC: add ecx, eax
  '00490CAE: push edx
  '00490CAF: push ecx
  '00490CB0: call 004101ECh
  '00490CB5: call [004010A4h]
  '00490CBB: lea edx, [ebp-00000088h]
  '00490CC1: push edx
  '00490CC2: call edi
  '00490CC4: lea eax, [ebp-0000008Ch]
  '00490CCA: push eax
  '00490CCB: call edi
  '00490CCD: mov ecx, [esi]
  '00490CCF: lea edx, [ebp-00000098h]
  '00490CD5: lea eax, [ebp-4Ch]
  '00490CD8: push edx
  '00490CD9: push eax
  '00490CDA: push esi
  '00490CDB: call [ecx+78h]
  '00490CDE: mov edx, [esi+54h]
  '00490CE1: mov ecx, [ebp-00000098h]
  '00490CE7: lea eax, [ebp-00000094h]
  '00490CED: push edx
  '00490CEE: push eax
  '00490CEF: mov [ebp-54h], ecx
  '00490CF2: call ebx
  '00490CF4: mov ecx, [ebp-00000094h]
  '00490CFA: test ecx, ecx
  '00490CFC: jz 490D31h
  '00490CFE: cmp word ptr [ecx], 0001h
  '00490D02: jnz 490D31h
  '00490D04: mov esi, [ebp+10h]
  '00490D07: mov edx, [ecx+14h]
  '00490D0A: mov eax, [ecx+10h]
  '00490D0D: sub esi, 00000001h
  '00490D10: jo 00491B44h
  '00490D16: sub esi, edx
  '00490D18: cmp esi, eax
  '00490D1A: jb 490D28h
  '00490D1C: call [00401170h]
  '00490D22: mov ecx, [ebp-00000094h]
  '00490D28: lea eax, [esi*4]
  '00490D2F: jmp 490D3Dh
  '00490D31: call [00401170h]
  '00490D37: mov ecx, [ebp-00000094h]
  '00490D3D: mov ecx, [ecx+0Ch]
  '00490D40: mov edx, [ecx+eax]
  '00490D43: lea eax, [ebp-00000090h]
  '00490D49: push edx
  '00490D4A: push eax
  '00490D4B: call ebx
  '00490D4D: mov eax, [ebp-00000090h]
  '00490D53: test eax, eax
  '00490D55: jz 490D77h
  '00490D57: cmp word ptr [eax], 0001h
  '00490D5B: jnz 490D77h
  '00490D5D: mov esi, [eax+14h]
  '00490D60: mov ecx, [eax+10h]
  '00490D63: neg esi
  '00490D65: cmp esi, ecx
  '00490D67: jb 490D6Fh
  '00490D69: call [00401170h]
  '00490D6F: mov [ebp-000000CCh], esi
  '00490D75: jmp 490D83h
  '00490D77: call [00401170h]
  '00490D7D: mov [ebp-000000CCh], eax
  '00490D83: mov edi, [ebp+08h]
  '00490D86: lea edx, [ebp-0000008Ch]
  '00490D8C: mov ecx, [edi+54h]
  '00490D8F: push ecx
  '00490D90: push edx
  '00490D91: call ebx
  '00490D93: mov ecx, [ebp-0000008Ch]
  '00490D99: test ecx, ecx
  '00490D9B: jz 490DD0h
  '00490D9D: cmp word ptr [ecx], 0001h
  '00490DA1: jnz 490DD0h
  '00490DA3: mov esi, [ebp+10h]
  '00490DA6: mov edx, [ecx+14h]
  '00490DA9: mov eax, [ecx+10h]
  '00490DAC: sub esi, 00000001h
  '00490DAF: jo 00491B44h
  '00490DB5: sub esi, edx
  '00490DB7: cmp esi, eax
  '00490DB9: jb 490DC7h
  '00490DBB: call [00401170h]
  '00490DC1: mov ecx, [ebp-0000008Ch]
  '00490DC7: lea eax, [esi*4]
  '00490DCE: jmp 490DDCh
  '00490DD0: call [00401170h]
  '00490DD6: mov ecx, [ebp-0000008Ch]
  '00490DDC: mov ecx, [ecx+0Ch]
  '00490DDF: mov edx, [ecx+eax]
  '00490DE2: lea eax, [ebp-00000088h]
  '00490DE8: push edx
  '00490DE9: push eax
  '00490DEA: call ebx
  '00490DEC: mov eax, [ebp-00000088h]
  '00490DF2: test eax, eax
  '00490DF4: jz 490E19h
  '00490DF6: cmp word ptr [eax], 0001h
  '00490DFA: jnz 490E19h
  '00490DFC: mov esi, [ebp-54h]
  '00490DFF: mov edx, [eax+14h]
  '00490E02: mov ecx, [eax+10h]
  '00490E05: sub esi, edx
  '00490E07: cmp esi, ecx
  '00490E09: jb 490E11h
  '00490E0B: call [00401170h]
  '00490E11: mov [ebp-000000D0h], esi
  '00490E17: jmp 490E25h
  '00490E19: call [00401170h]
  '00490E1F: mov [ebp-000000D0h], eax
  '00490E25: mov eax, [edi+50h]
  '00490E28: test eax, eax
  '00490E2A: jz 490E57h
  '00490E2C: cmp word ptr [eax], 0001h
  '00490E30: jnz 490E57h
  '00490E32: mov esi, [ebp+10h]
  '00490E35: mov edx, [eax+14h]
  '00490E38: mov ecx, [eax+10h]
  '00490E3B: sub esi, 00000001h
  '00490E3E: jo 00491B44h
  '00490E44: sub esi, edx
  '00490E46: cmp esi, ecx
  '00490E48: jb 490E50h
  '00490E4A: call [00401170h]
  '00490E50: shl esi, 04h
  '00490E53: mov ebx, esi
  '00490E55: jmp 490E5Fh
  '00490E57: call [00401170h]
  '00490E5D: mov ebx, eax
  '00490E5F: mov ecx, [ebp+08h]
  '00490E62: mov eax, [ecx+50h]
  '00490E65: test eax, eax
  '00490E67: jz 490E94h
  '00490E69: cmp word ptr [eax], 0001h
  '00490E6D: jnz 490E94h
  '00490E6F: mov esi, [ebp+10h]
  '00490E72: mov edx, [eax+14h]
  '00490E75: mov ecx, [eax+10h]
  '00490E78: sub esi, 00000001h
  '00490E7B: jo 00491B44h
  '00490E81: sub esi, edx
  '00490E83: cmp esi, ecx
  '00490E85: jb 490E8Dh
  '00490E87: call [00401170h]
  '00490E8D: shl esi, 04h
  '00490E90: mov edi, esi
  '00490E92: jmp 490E9Ch
  '00490E94: call [00401170h]
  '00490E9A: mov edi, eax
  '00490E9C: mov edx, [ebp+08h]
  '00490E9F: mov eax, [edx+50h]
  '00490EA2: test eax, eax
  '00490EA4: jz 490ED1h
  '00490EA6: cmp word ptr [eax], 0001h
  '00490EAA: jnz 490ED1h
  '00490EAC: mov esi, [ebp+10h]
  '00490EAF: mov edx, [eax+14h]
  '00490EB2: mov ecx, [eax+10h]
  '00490EB5: sub esi, 00000001h
  '00490EB8: jo 00491B44h
  '00490EBE: sub esi, edx
  '00490EC0: cmp esi, ecx
  '00490EC2: jb 490ECAh
  '00490EC4: call [00401170h]
  '00490ECA: shl esi, 04h
  '00490ECD: mov eax, esi
  '00490ECF: jmp 490ED7h
  '00490ED1: call [00401170h]
  '00490ED7: mov ecx, [ebp+08h]
  '00490EDA: mov esi, [ebp-000000CCh]
  '00490EE0: push 00000000h
  '00490EE2: mov edx, [ecx+50h]
  '00490EE5: mov ecx, [edx+0Ch]
  '00490EE8: mov edx, [ebp-00000090h]
  '00490EEE: mov edx, [edx+0Ch]
  '00490EF1: add edx, esi
  '00490EF3: mov esi, [ebp-000000D0h]
  '00490EF9: push edx
  '00490EFA: mov edx, [ebp-00000088h]
  '00490F00: mov edx, [edx+0Ch]
  '00490F03: add edx, esi
  '00490F05: push edx
  '00490F06: xor edx, edx
  '00490F08: mov dl, [ecx+ebx+01h]
  '00490F0C: push edx
  '00490F0D: xor edx, edx
  '00490F0F: mov dl, [ecx+edi+01h]
  '00490F13: push 00000000h
  '00490F15: push 00000000h
  '00490F17: push 00000000h
  '00490F19: push edx
  '00490F1A: xor edx, edx
  '00490F1C: mov dl, [ecx+eax]
  '00490F1F: mov eax, [ebp-20h]
  '00490F22: push edx
  '00490F23: push 00000000h
  '00490F25: push 00000000h
  '00490F27: push eax
  '00490F28: call 00412680h
  '00490F2D: mov [ebp-00000098h], eax
  '00490F33: call [004010A4h]
  '00490F39: mov esi, [00401378h]
  '00490F3F: lea ecx, [ebp-00000088h]
  '00490F45: push ecx
  '00490F46: call esi
  '00490F48: lea edx, [ebp-0000008Ch]
  '00490F4E: push edx
  '00490F4F: call esi
  '00490F51: lea eax, [ebp-00000090h]
  '00490F57: push eax
  '00490F58: call esi
  '00490F5A: lea ecx, [ebp-00000094h]
  '00490F60: push ecx
  '00490F61: call esi
  '00490F63: cmp word ptr [ebp+18h], 0000h
  '00490F68: jz 0049118Bh
  '00490F6E: mov eax, [ebp+24h]
  '00490F71: test eax, eax
  '00490F73: jnz 00491081h
  '00490F79: mov ecx, [ebp+28h]
  '00490F7C: test ecx, ecx
  '00490F7E: jnz 00491031h
  '00490F84: mov edx, [ebp+08h]
  '00490F87: mov eax, [edx+50h]
  '00490F8A: test eax, eax
  '00490F8C: jz 490FB9h
  '00490F8E: cmp word ptr [eax], 0001h
  '00490F92: jnz 490FB9h
  '00490F94: mov esi, [ebp+10h]
  '00490F97: mov edx, [eax+14h]
  '00490F9A: mov ecx, [eax+10h]
  '00490F9D: sub esi, 00000001h
  '00490FA0: jo 00491B44h
  '00490FA6: sub esi, edx
  '00490FA8: cmp esi, ecx
  '00490FAA: jb 490FB2h
  '00490FAC: call [00401170h]
  '00490FB2: shl esi, 04h
  '00490FB5: mov edi, esi
  '00490FB7: jmp 490FC1h
  '00490FB9: call [00401170h]
  '00490FBF: mov edi, eax
  '00490FC1: mov ebx, [ebp+08h]
  '00490FC4: mov eax, [ebx+50h]
  '00490FC7: test eax, eax
  '00490FC9: jz 490FF6h
  '00490FCB: cmp word ptr [eax], 0001h
  '00490FCF: jnz 490FF6h
  '00490FD1: mov esi, [ebp+10h]
  '00490FD4: mov edx, [eax+14h]
  '00490FD7: mov ecx, [eax+10h]
  '00490FDA: sub esi, 00000001h
  '00490FDD: jo 00491B44h
  '00490FE3: sub esi, edx
  '00490FE5: cmp esi, ecx
  '00490FE7: jb 490FEFh
  '00490FE9: call [00401170h]
  '00490FEF: shl esi, 04h
  '00490FF2: mov eax, esi
  '00490FF4: jmp 490FFCh
  '00490FF6: call [00401170h]
  '00490FFC: mov edx, [ebp+2Ch]
  '00490FFF: mov ecx, [ebx+50h]
  '00491002: push edx
  '00491003: mov edx, [ebp-20h]
  '00491006: mov ecx, [ecx+0Ch]
  '00491009: push 00000000h
  '0049100B: push 00000000h
  '0049100D: push edx
  '0049100E: xor edx, edx
  '00491010: mov dl, [ecx+edi+01h]
  '00491014: push edx
  '00491015: xor edx, edx
  '00491017: mov dl, [eax+ecx]
  '0049101A: mov eax, [ebp+20h]
  '0049101D: mov ecx, [ebp+1Ch]
  '00491020: push edx
  '00491021: mov edx, [ebp+0Ch]
  '00491024: push eax
  '00491025: push ecx
  '00491026: push edx
  '00491027: call 004129BCh
  '0049102C: jmp 00491185h
  '00491031: test eax, eax
  '00491033: jnz 491081h
  '00491035: mov eax, [ebp+08h]
  '00491038: mov eax, [eax+50h]
  '0049103B: test eax, eax
  '0049103D: jz 49106Ah
  '0049103F: cmp word ptr [eax], 0001h
  '00491043: jnz 49106Ah
  '00491045: mov esi, [ebp+10h]
  '00491048: mov edx, [eax+14h]
  '0049104B: mov ecx, [eax+10h]
  '0049104E: sub esi, 00000001h
  '00491051: jo 00491B44h
  '00491057: sub esi, edx
  '00491059: cmp esi, ecx
  '0049105B: jb 491063h
  '0049105D: call [00401170h]
  '00491063: shl esi, 04h
  '00491066: mov eax, esi
  '00491068: jmp 491070h
  '0049106A: call [00401170h]
  '00491070: mov ecx, [ebp+08h]
  '00491073: mov edx, [ecx+50h]
  '00491076: mov ecx, [edx+0Ch]
  '00491079: xor edx, edx
  '0049107B: mov dl, [ecx+eax]
  '0049107E: mov [ebp+24h], edx
  '00491081: mov eax, [ebp+28h]
  '00491084: test eax, eax
  '00491086: jnz 4910D5h
  '00491088: mov eax, [ebp+08h]
  '0049108B: mov eax, [eax+50h]
  '0049108E: test eax, eax
  '00491090: jz 4910BDh
  '00491092: cmp word ptr [eax], 0001h
  '00491096: jnz 4910BDh
  '00491098: mov esi, [ebp+10h]
  '0049109B: mov edx, [eax+14h]
  '0049109E: mov ecx, [eax+10h]
  '004910A1: sub esi, 00000001h
  '004910A4: jo 00491B44h
  '004910AA: sub esi, edx
  '004910AC: cmp esi, ecx
  '004910AE: jb 4910B6h
  '004910B0: call [00401170h]
  '004910B6: shl esi, 04h
  '004910B9: mov eax, esi
  '004910BB: jmp 4910C3h
  '004910BD: call [00401170h]
  '004910C3: mov ecx, [ebp+08h]
  '004910C6: mov edx, [ecx+50h]
  '004910C9: mov ecx, [edx+0Ch]
  '004910CC: xor edx, edx
  '004910CE: mov dl, [ecx+eax+01h]
  '004910D2: mov [ebp+28h], edx
  '004910D5: mov eax, [ebp+08h]
  '004910D8: mov eax, [eax+50h]
  '004910DB: test eax, eax
  '004910DD: jz 49110Ah
  '004910DF: cmp word ptr [eax], 0001h
  '004910E3: jnz 49110Ah
  '004910E5: mov esi, [ebp+10h]
  '004910E8: mov edx, [eax+14h]
  '004910EB: mov ecx, [eax+10h]
  '004910EE: sub esi, 00000001h
  '004910F1: jo 00491B44h
  '004910F7: sub esi, edx
  '004910F9: cmp esi, ecx
  '004910FB: jb 491103h
  '004910FD: call [00401170h]
  '00491103: shl esi, 04h
  '00491106: mov edi, esi
  '00491108: jmp 491112h
  '0049110A: call [00401170h]
  '00491110: mov edi, eax
  '00491112: mov ebx, [ebp+08h]
  '00491115: mov eax, [ebx+50h]
  '00491118: test eax, eax
  '0049111A: jz 491147h
  '0049111C: cmp word ptr [eax], 0001h
  '00491120: jnz 491147h
  '00491122: mov esi, [ebp+10h]
  '00491125: mov edx, [eax+14h]
  '00491128: mov ecx, [eax+10h]
  '0049112B: sub esi, 00000001h
  '0049112E: jo 00491B44h
  '00491134: sub esi, edx
  '00491136: cmp esi, ecx
  '00491138: jb 491140h
  '0049113A: call [00401170h]
  '00491140: shl esi, 04h
  '00491143: mov eax, esi
  '00491145: jmp 49114Dh
  '00491147: call [00401170h]
  '0049114D: mov ecx, [ebx+50h]
  '00491150: mov edx, [ebp+2Ch]
  '00491153: push edx
  '00491154: xor edx, edx
  '00491156: mov ecx, [ecx+0Ch]
  '00491159: mov dl, [edi+ecx+01h]
  '0049115D: push edx
  '0049115E: xor edx, edx
  '00491160: mov dl, [eax+ecx]
  '00491163: mov eax, [ebp-20h]
  '00491166: mov ecx, [ebp+28h]
  '00491169: push edx
  '0049116A: mov edx, [ebp+24h]
  '0049116D: push 00000000h
  '0049116F: push 00000000h
  '00491171: push eax
  '00491172: mov eax, [ebp+20h]
  '00491175: push ecx
  '00491176: mov ecx, [ebp+1Ch]
  '00491179: push edx
  '0049117A: mov edx, [ebp+0Ch]
  '0049117D: push eax
  '0049117E: push ecx
  '0049117F: push edx
  '00491180: call 00412A00h
  '00491185: call [004010A4h]
  '0049118B: mov eax, [ebp+08h]
  '0049118E: lea edx, [ebp-0000008Ch]
  '00491194: mov ecx, [eax+54h]
  '00491197: push ecx
  '00491198: push edx
  '00491199: call [004012F8h]
  '0049119F: mov ecx, [ebp-0000008Ch]
  '004911A5: test ecx, ecx
  '004911A7: jz 4911E0h
  '004911A9: cmp word ptr [ecx], 0001h
  '004911AD: jnz 4911E0h
  '004911AF: mov ebx, [ebp+10h]
  '004911B2: mov edx, [ecx+14h]
  '004911B5: mov eax, [ecx+10h]
  '004911B8: mov esi, ebx
  '004911BA: mov edi, [00401170h]
  '004911C0: sub esi, 00000001h
  '004911C3: jo 00491B44h
  '004911C9: sub esi, edx
  '004911CB: cmp esi, eax
  '004911CD: jb 4911D7h
  '004911CF: call edi
  '004911D1: mov ecx, [ebp-0000008Ch]
  '004911D7: lea eax, [esi*4]
  '004911DE: jmp 4911F1h
  '004911E0: mov edi, [00401170h]
  '004911E6: call edi
  '004911E8: mov ecx, [ebp-0000008Ch]
  '004911EE: mov ebx, [ebp+10h]
  '004911F1: mov ecx, [ecx+0Ch]
  '004911F4: mov edx, [ecx+eax]
  '004911F7: lea eax, [ebp-00000088h]
  '004911FD: push edx
  '004911FE: push eax
  '004911FF: call [004012F8h]
  '00491205: mov ecx, [ebp-00000088h]
  '0049120B: test ecx, ecx
  '0049120D: jz 49122Dh
  '0049120F: cmp word ptr [ecx], 0001h
  '00491213: jnz 49122Dh
  '00491215: mov esi, [ecx+14h]
  '00491218: mov eax, [ecx+10h]
  '0049121B: neg esi
  '0049121D: cmp esi, eax
  '0049121F: jb 491229h
  '00491221: call edi
  '00491223: mov ecx, [ebp-00000088h]
  '00491229: mov eax, esi
  '0049122B: jmp 491235h
  '0049122D: call edi
  '0049122F: mov ecx, [ebp-00000088h]
  '00491235: mov ecx, [ecx+0Ch]
  '00491238: push 00000028h
  '0049123A: add ecx, eax
  '0049123C: lea edx, [ebp-4Ch]
  '0049123F: push ecx
  '00491240: push edx
  '00491241: call 004101ECh
  '00491246: call [004010A4h]
  '0049124C: mov edi, [00401378h]
  '00491252: lea eax, [ebp-00000088h]
  '00491258: push eax
  '00491259: call edi
  '0049125B: lea ecx, [ebp-0000008Ch]
  '00491261: push ecx
  '00491262: call edi
  '00491264: mov edx, [ebp-44h]
  '00491267: mov eax, [ebp+08h]
  '0049126A: imul edx, 02h
  '0049126D: mov ecx, [eax+54h]
  '00491270: jo 00491B44h
  '00491276: mov [ebp-44h], edx
  '00491279: lea edx, [ebp-0000008Ch]
  '0049127F: push ecx
  '00491280: push edx
  '00491281: call [004012F8h]
  '00491287: mov ecx, [ebp-0000008Ch]
  '0049128D: test ecx, ecx
  '0049128F: jz 4912C3h
  '00491291: cmp word ptr [ecx], 0001h
  '00491295: jnz 4912C3h
  '00491297: mov edx, [ecx+14h]
  '0049129A: mov eax, [ecx+10h]
  '0049129D: sub ebx, 00000001h
  '004912A0: jo 00491B44h
  '004912A6: sub ebx, edx
  '004912A8: mov esi, ebx
  '004912AA: cmp esi, eax
  '004912AC: jb 4912BAh
  '004912AE: call [00401170h]
  '004912B4: mov ecx, [ebp-0000008Ch]
  '004912BA: lea eax, [esi*4]
  '004912C1: jmp 4912CFh
  '004912C3: call [00401170h]
  '004912C9: mov ecx, [ebp-0000008Ch]
  '004912CF: mov ecx, [ecx+0Ch]
  '004912D2: mov edx, [ecx+eax]
  '004912D5: lea eax, [ebp-00000088h]
  '004912DB: push edx
  '004912DC: push eax
  '004912DD: call [004012F8h]
  '004912E3: mov ecx, [ebp-00000088h]
  '004912E9: test ecx, ecx
  '004912EB: jz 49130Fh
  '004912ED: cmp word ptr [ecx], 0001h
  '004912F1: jnz 49130Fh
  '004912F3: mov esi, [ecx+14h]
  '004912F6: mov eax, [ecx+10h]
  '004912F9: neg esi
  '004912FB: cmp esi, eax
  '004912FD: jb 49130Bh
  '004912FF: call [00401170h]
  '00491305: mov ecx, [ebp-00000088h]
  '0049130B: mov eax, esi
  '0049130D: jmp 49131Bh
  '0049130F: call [00401170h]
  '00491315: mov ecx, [ebp-00000088h]
  '0049131B: mov ecx, [ecx+0Ch]
  '0049131E: lea edx, [ebp-4Ch]
  '00491321: push 00000028h
  '00491323: add ecx, eax
  '00491325: push edx
  '00491326: push ecx
  '00491327: call 004101ECh
  '0049132C: mov esi, [004010A4h]
  '00491332: call esi
  '00491334: lea edx, [ebp-00000088h]
  '0049133A: push edx
  '0049133B: call edi
  '0049133D: lea eax, [ebp-0000008Ch]
  '00491343: push eax
  '00491344: call edi
  '00491346: mov ecx, [ebp-24h]
  '00491349: mov edx, [ebp-20h]
  '0049134C: push ecx
  '0049134D: push edx
  '0049134E: call 00412934h
  '00491353: call esi
  '00491355: mov esi, [ebp-14h]
  '00491358: mov ebx, [004010A4h]
  '0049135E: cmp word ptr [ebp+30h], 0000h
  '00491363: jz 49137Eh
  '00491365: mov eax, [ebp-20h]
  '00491368: mov [ebp-18h], esi
  '0049136B: push eax
  '0049136C: call 004127F0h
  '00491371: call ebx
  '00491373: wait 
  '00491374: push 00491B22h
  '00491379: jmp 00491B21h
  '0049137E: push esi
  '0049137F: call 0041297Ch
  '00491384: call ebx
  '00491386: mov eax, [ebp-20h]
  '00491389: push eax
  '0049138A: call 004127F0h
  '0049138F: call ebx
  '00491391: wait 
  '00491392: push 00491B22h
  '00491397: jmp 00491B21h
  '0049139C: push esi
  '0049139D: call 0041289Ch
  '004913A2: mov [ebp-00000098h], eax
  '004913A8: call [004010A4h]
  '004913AE: mov eax, [ebp-00000098h]
  '004913B4: cmp eax, esi
  '004913B6: mov [ebp-20h], eax
  '004913B9: jz 00491AEEh
  '004913BF: mov edi, [ebp+08h]
  '004913C2: mov eax, [edi+50h]
  '004913C5: cmp eax, esi
  '004913C7: jz 4913F4h
  '004913C9: cmp word ptr [eax], 0001h
  '004913CD: jnz 4913F4h
  '004913CF: mov esi, [ebp+10h]
  '004913D2: mov edx, [eax+14h]
  '004913D5: mov ecx, [eax+10h]
  '004913D8: sub esi, 00000001h
  '004913DB: jo 00491B44h
  '004913E1: sub esi, edx
  '004913E3: cmp esi, ecx
  '004913E5: jb 4913EDh
  '004913E7: call [00401170h]
  '004913ED: shl esi, 04h
  '004913F0: mov ebx, esi
  '004913F2: jmp 4913FCh
  '004913F4: call [00401170h]
  '004913FA: mov ebx, eax
  '004913FC: mov eax, [edi+50h]
  '004913FF: test eax, eax
  '00491401: jz 49142Eh
  '00491403: cmp word ptr [eax], 0001h
  '00491407: jnz 49142Eh
  '00491409: mov esi, [ebp+10h]
  '0049140C: mov edx, [eax+14h]
  '0049140F: mov ecx, [eax+10h]
  '00491412: sub esi, 00000001h
  '00491415: jo 00491B44h
  '0049141B: sub esi, edx
  '0049141D: cmp esi, ecx
  '0049141F: jb 491427h
  '00491421: call [00401170h]
  '00491427: shl esi, 04h
  '0049142A: mov eax, esi
  '0049142C: jmp 491434h
  '0049142E: call [00401170h]
  '00491434: mov ecx, [edi+50h]
  '00491437: xor edx, edx
  '00491439: mov ecx, [ecx+0Ch]
  '0049143C: mov dl, [ebx+ecx+01h]
  '00491440: push edx
  '00491441: xor edx, edx
  '00491443: mov dl, [eax+ecx]
  '00491446: mov eax, [ebp-20h]
  '00491449: push edx
  '0049144A: push eax
  '0049144B: call 004128ECh
  '00491450: mov [ebp-00000098h], eax
  '00491456: call [004010A4h]
  '0049145C: mov eax, [ebp-00000098h]
  '00491462: mov esi, eax
  '00491464: test eax, eax
  '00491466: mov [ebp-14h], esi
  '00491469: jz 00491ADFh
  '0049146F: mov ecx, [ebp-20h]
  '00491472: push eax
  '00491473: push ecx
  '00491474: call 00412934h
  '00491479: mov [ebp-00000098h], eax
  '0049147F: call [004010A4h]
  '00491485: mov eax, [ebp-00000098h]
  '0049148B: test eax, eax
  '0049148D: mov [ebp-24h], eax
  '00491490: jz 00491AC7h
  '00491496: mov edx, [edi+54h]
  '00491499: mov ebx, [004012F8h]
  '0049149F: lea eax, [ebp-0000008Ch]
  '004914A5: push edx
  '004914A6: push eax
  '004914A7: call ebx
  '004914A9: mov ecx, [ebp-0000008Ch]
  '004914AF: test ecx, ecx
  '004914B1: jz 4914E6h
  '004914B3: cmp word ptr [ecx], 0001h
  '004914B7: jnz 4914E6h
  '004914B9: mov esi, [ebp+10h]
  '004914BC: mov edx, [ecx+14h]
  '004914BF: mov eax, [ecx+10h]
  '004914C2: sub esi, 00000001h
  '004914C5: jo 00491B44h
  '004914CB: sub esi, edx
  '004914CD: cmp esi, eax
  '004914CF: jb 4914DDh
  '004914D1: call [00401170h]
  '004914D7: mov ecx, [ebp-0000008Ch]
  '004914DD: lea eax, [esi*4]
  '004914E4: jmp 4914F2h
  '004914E6: call [00401170h]
  '004914EC: mov ecx, [ebp-0000008Ch]
  '004914F2: mov ecx, [ecx+0Ch]
  '004914F5: mov edx, [ecx+eax]
  '004914F8: lea eax, [ebp-00000088h]
  '004914FE: push edx
  '004914FF: push eax
  '00491500: call ebx
  '00491502: mov ecx, [ebp-00000088h]
  '00491508: test ecx, ecx
  '0049150A: jz 49152Eh
  '0049150C: cmp word ptr [ecx], 0001h
  '00491510: jnz 49152Eh
  '00491512: mov esi, [ecx+14h]
  '00491515: mov eax, [ecx+10h]
  '00491518: neg esi
  '0049151A: cmp esi, eax
  '0049151C: jb 49152Ah
  '0049151E: call [00401170h]
  '00491524: mov ecx, [ebp-00000088h]
  '0049152A: mov eax, esi
  '0049152C: jmp 49153Ah
  '0049152E: call [00401170h]
  '00491534: mov ecx, [ebp-00000088h]
  '0049153A: mov ecx, [ecx+0Ch]
  '0049153D: push 00000028h
  '0049153F: add ecx, eax
  '00491541: lea edx, [ebp-00000084h]
  '00491547: push ecx
  '00491548: push edx
  '00491549: call 004101ECh
  '0049154E: call [004010A4h]
  '00491554: mov esi, [00401378h]
  '0049155A: lea eax, [ebp-00000088h]
  '00491560: push eax
  '00491561: call esi
  '00491563: lea ecx, [ebp-0000008Ch]
  '00491569: push ecx
  '0049156A: call esi
  '0049156C: mov edx, [edi]
  '0049156E: lea eax, [ebp-00000098h]
  '00491574: lea ecx, [ebp-00000084h]
  '0049157A: push eax
  '0049157B: push ecx
  '0049157C: push edi
  '0049157D: call [edx+78h]
  '00491580: mov edx, [ebp-00000098h]
  '00491586: lea ecx, [ebp-00000098h]
  '0049158C: mov [ebp-54h], edx
  '0049158F: push ecx
  '00491590: movsx edx, word ptr [ebp-78h]
  '00491594: imul edx, [ebp-80h]
  '00491598: movsx ecx, word ptr [ebp-76h]
  '0049159C: jo 00491B44h
  '004915A2: imul edx, ecx
  '004915A5: mov eax, [edi]
  '004915A7: jo 00491B44h
  '004915AD: push edx
  '004915AE: push edi
  '004915AF: call [eax+00000080h]
  '004915B5: mov eax, [edi+50h]
  '004915B8: test eax, eax
  '004915BA: jz 4915E7h
  '004915BC: cmp word ptr [eax], 0001h
  '004915C0: jnz 4915E7h
  '004915C2: mov esi, [ebp+10h]
  '004915C5: mov edx, [eax+14h]
  '004915C8: mov ecx, [eax+10h]
  '004915CB: sub esi, 00000001h
  '004915CE: jo 00491B44h
  '004915D4: sub esi, edx
  '004915D6: cmp esi, ecx
  '004915D8: jb 4915E0h
  '004915DA: call [00401170h]
  '004915E0: shl esi, 04h
  '004915E3: mov eax, esi
  '004915E5: jmp 4915EDh
  '004915E7: call [00401170h]
  '004915ED: mov edx, [edi+50h]
  '004915F0: mov ecx, [edx+0Ch]
  '004915F3: xor edx, edx
  '004915F5: mov dl, [ecx+eax+01h]
  '004915F9: mov [ebp-000000D4h], edx
  '004915FF: fild dword ptr [ebp-000000D4h]
  '00491605: fstp real8 ptr [ebp-000000DCh]
  '0049160B: fld real8 ptr [ebp-000000DCh]
  '00491611: fild dword ptr [ebp-00000098h]
  '00491617: fstp real8 ptr [ebp-000000E4h]
  '0049161D: fmul real8 ptr [ebp-000000E4h]
  '00491623: fild dword ptr [ebp-54h]
  '00491626: fstp real8 ptr [ebp-000000ECh]
  '0049162C: fadd real8 ptr [ebp-000000ECh]
  '00491632: fstsw ax
  '00491634: test al, 0Dh
  '00491636: jnz 00491B3Fh
  '0049163C: call [00401320h]
  '00491642: mov ebx, eax
  '00491644: mov eax, [ebp-7Ch]
  '00491647: cdq 
  '00491648: sub eax, edx
  '0049164A: mov esi, [004011F4h]
  '00491650: sar eax, 01h
  '00491652: mov [ebp-7Ch], eax
  '00491655: mov eax, 00000001h
  '0049165A: mov [ebp-78h], ax
  '0049165E: mov [ebp-76h], ax
  '00491662: xor eax, eax
  '00491664: xor ecx, ecx
  '00491666: mov [ebp-74h], eax
  '00491669: mov [ebp-70h], eax
  '0049166C: mov [ebp-6Ch], eax
  '0049166F: mov [ebp-68h], eax
  '00491672: mov [ebp-64h], eax
  '00491675: mov [ebp-60h], eax
  '00491678: call esi
  '0049167A: xor ecx, ecx
  '0049167C: mov [ebp-5Ah], al
  '0049167F: call esi
  '00491681: xor ecx, ecx
  '00491683: mov [ebp-5Bh], al
  '00491686: call esi
  '00491688: xor ecx, ecx
  '0049168A: mov [ebp-5Ch], al
  '0049168D: call esi
  '0049168F: mov ecx, 000000FFh
  '00491694: mov [ebp-59h], al
  '00491697: call esi
  '00491699: mov ecx, 000000FFh
  '0049169E: mov [ebp-56h], al
  '004916A1: call esi
  '004916A3: mov ecx, 000000FFh
  '004916A8: mov [ebp-57h], al
  '004916AB: call esi
  '004916AD: xor ecx, ecx
  '004916AF: mov [ebp-58h], al
  '004916B2: call esi
  '004916B4: mov [ebp-55h], al
  '004916B7: mov eax, [edi+54h]
  '004916BA: lea ecx, [ebp-0000008Ch]
  '004916C0: push eax
  '004916C1: push ecx
  '004916C2: call [004012F8h]
  '004916C8: mov ecx, [ebp-0000008Ch]
  '004916CE: test ecx, ecx
  '004916D0: jz 49170Bh
  '004916D2: cmp word ptr [ecx], 0001h
  '004916D6: jnz 49170Bh
  '004916D8: mov esi, [ebp+10h]
  '004916DB: mov edx, [ecx+14h]
  '004916DE: mov eax, [ecx+10h]
  '004916E1: sub esi, 00000001h
  '004916E4: jo 00491B44h
  '004916EA: sub esi, edx
  '004916EC: cmp esi, eax
  '004916EE: jb 4916FCh
  '004916F0: call [00401170h]
  '004916F6: mov ecx, [ebp-0000008Ch]
  '004916FC: lea eax, [esi*4]
  '00491703: mov esi, [00401170h]
  '00491709: jmp 491719h
  '0049170B: mov esi, [00401170h]
  '00491711: call esi
  '00491713: mov ecx, [ebp-0000008Ch]
  '00491719: mov edx, [ecx+0Ch]
  '0049171C: lea ecx, [ebp-00000088h]
  '00491722: mov eax, [edx+eax]
  '00491725: push eax
  '00491726: push ecx
  '00491727: call [004012F8h]
  '0049172D: mov eax, [ebp-00000088h]
  '00491733: test eax, eax
  '00491735: jz 491753h
  '00491737: cmp word ptr [eax], 0001h
  '0049173B: jnz 491753h
  '0049173D: mov edx, [eax+14h]
  '00491740: mov ecx, [eax+10h]
  '00491743: sub ebx, edx
  '00491745: cmp ebx, ecx
  '00491747: jb 49174Bh
  '00491749: call esi
  '0049174B: mov [ebp-000000F0h], ebx
  '00491751: jmp 49175Bh
  '00491753: call esi
  '00491755: mov [ebp-000000F0h], eax
  '0049175B: mov eax, [edi+50h]
  '0049175E: test eax, eax
  '00491760: jz 491791h
  '00491762: cmp word ptr [eax], 0001h
  '00491766: jnz 491791h
  '00491768: mov esi, [ebp+10h]
  '0049176B: mov edx, [eax+14h]
  '0049176E: mov ecx, [eax+10h]
  '00491771: sub esi, 00000001h
  '00491774: jo 00491B44h
  '0049177A: sub esi, edx
  '0049177C: cmp esi, ecx
  '0049177E: jb 491786h
  '00491780: call [00401170h]
  '00491786: shl esi, 04h
  '00491789: mov [ebp-000000F4h], esi
  '0049178F: jmp 491799h
  '00491791: call esi
  '00491793: mov [ebp-000000F4h], eax
  '00491799: mov eax, [edi+50h]
  '0049179C: test eax, eax
  '0049179E: jz 4917CBh
  '004917A0: cmp word ptr [eax], 0001h
  '004917A4: jnz 4917CBh
  '004917A6: mov esi, [ebp+10h]
  '004917A9: mov edx, [eax+14h]
  '004917AC: mov ecx, [eax+10h]
  '004917AF: sub esi, 00000001h
  '004917B2: jo 00491B44h
  '004917B8: sub esi, edx
  '004917BA: cmp esi, ecx
  '004917BC: jb 4917C4h
  '004917BE: call [00401170h]
  '004917C4: shl esi, 04h
  '004917C7: mov ebx, esi
  '004917C9: jmp 4917D3h
  '004917CB: call [00401170h]
  '004917D1: mov ebx, eax
  '004917D3: mov eax, [edi+50h]
  '004917D6: test eax, eax
  '004917D8: jz 491805h
  '004917DA: cmp word ptr [eax], 0001h
  '004917DE: jnz 491805h
  '004917E0: mov esi, [ebp+10h]
  '004917E3: mov edx, [eax+14h]
  '004917E6: mov ecx, [eax+10h]
  '004917E9: sub esi, 00000001h
  '004917EC: jo 00491B44h
  '004917F2: sub esi, edx
  '004917F4: cmp esi, ecx
  '004917F6: jb 4917FEh
  '004917F8: call [00401170h]
  '004917FE: shl esi, 04h
  '00491801: mov eax, esi
  '00491803: jmp 49180Bh
  '00491805: call [00401170h]
  '0049180B: mov edx, [edi+50h]
  '0049180E: mov esi, [ebp-000000F0h]
  '00491814: push 00000000h
  '00491816: mov ecx, [edx+0Ch]
  '00491819: lea edx, [ebp-00000084h]
  '0049181F: push edx
  '00491820: mov edx, [ebp-00000088h]
  '00491826: mov edx, [edx+0Ch]
  '00491829: add edx, esi
  '0049182B: mov esi, [ebp-000000F4h]
  '00491831: push edx
  '00491832: xor edx, edx
  '00491834: mov dl, [esi+ecx+01h]
  '00491838: push edx
  '00491839: xor edx, edx
  '0049183B: mov dl, [ebx+ecx+01h]
  '0049183F: push 00000000h
  '00491841: push 00000000h
  '00491843: push 00000000h
  '00491845: push edx
  '00491846: xor edx, edx
  '00491848: mov dl, [eax+ecx]
  '0049184B: mov eax, [ebp-20h]
  '0049184E: push edx
  '0049184F: push 00000000h
  '00491851: push 00000000h
  '00491853: push eax
  '00491854: call 00412680h
  '00491859: mov [ebp-00000098h], eax
  '0049185F: call [004010A4h]
  '00491865: mov esi, [00401378h]
  '0049186B: lea ecx, [ebp-00000088h]
  '00491871: push ecx
  '00491872: call esi
  '00491874: lea edx, [ebp-0000008Ch]
  '0049187A: push edx
  '0049187B: call esi
  '0049187D: cmp word ptr [ebp+18h], 0000h
  '00491882: jz 00491AB1h
  '00491888: mov eax, [ebp+24h]
  '0049188B: test eax, eax
  '0049188D: jnz 004919A1h
  '00491893: mov ecx, [ebp+28h]
  '00491896: test ecx, ecx
  '00491898: jnz 00491957h
  '0049189E: mov eax, [edi+50h]
  '004918A1: test eax, eax
  '004918A3: jz 4918D6h
  '004918A5: cmp word ptr [eax], 0001h
  '004918A9: jnz 4918D6h
  '004918AB: mov ebx, [ebp+10h]
  '004918AE: mov edx, [eax+14h]
  '004918B1: mov ecx, [eax+10h]
  '004918B4: mov esi, ebx
  '004918B6: sub esi, 00000001h
  '004918B9: jo 00491B44h
  '004918BF: sub esi, edx
  '004918C1: cmp esi, ecx
  '004918C3: jb 4918CBh
  '004918C5: call [00401170h]
  '004918CB: shl esi, 04h
  '004918CE: mov [ebp-000000F8h], esi
  '004918D4: jmp 4918E5h
  '004918D6: call [00401170h]
  '004918DC: mov ebx, [ebp+10h]
  '004918DF: mov [ebp-000000F8h], eax
  '004918E5: mov eax, [edi+50h]
  '004918E8: test eax, eax
  '004918EA: jz 491916h
  '004918EC: cmp word ptr [eax], 0001h
  '004918F0: jnz 491916h
  '004918F2: mov edx, [eax+14h]
  '004918F5: mov ecx, [eax+10h]
  '004918F8: sub ebx, 00000001h
  '004918FB: jo 00491B44h
  '00491901: sub ebx, edx
  '00491903: mov esi, ebx
  '00491905: cmp esi, ecx
  '00491907: jb 49190Fh
  '00491909: call [00401170h]
  '0049190F: shl esi, 04h
  '00491912: mov eax, esi
  '00491914: jmp 49191Ch
  '00491916: call [00401170h]
  '0049191C: mov edx, [ebp+2Ch]
  '0049191F: mov ecx, [edi+50h]
  '00491922: mov esi, [ebp-000000F8h]
  '00491928: push edx
  '00491929: mov edx, [ebp-20h]
  '0049192C: mov ecx, [ecx+0Ch]
  '0049192F: push 00000000h
  '00491931: push 00000000h
  '00491933: push edx
  '00491934: xor edx, edx
  '00491936: mov dl, [esi+ecx+01h]
  '0049193A: push edx
  '0049193B: xor edx, edx
  '0049193D: mov dl, [eax+ecx]
  '00491940: mov eax, [ebp+20h]
  '00491943: mov ecx, [ebp+1Ch]
  '00491946: push edx
  '00491947: mov edx, [ebp+0Ch]
  '0049194A: push eax
  '0049194B: push ecx
  '0049194C: push edx
  '0049194D: call 004129BCh
  '00491952: jmp 00491AABh
  '00491957: test eax, eax
  '00491959: jnz 4919A1h
  '0049195B: mov eax, [edi+50h]
  '0049195E: test eax, eax
  '00491960: jz 49198Dh
  '00491962: cmp word ptr [eax], 0001h
  '00491966: jnz 49198Dh
  '00491968: mov esi, [ebp+10h]
  '0049196B: mov edx, [eax+14h]
  '0049196E: mov ecx, [eax+10h]
  '00491971: sub esi, 00000001h
  '00491974: jo 00491B44h
  '0049197A: sub esi, edx
  '0049197C: cmp esi, ecx
  '0049197E: jb 491986h
  '00491980: call [00401170h]
  '00491986: shl esi, 04h
  '00491989: mov eax, esi
  '0049198B: jmp 491993h
  '0049198D: call [00401170h]
  '00491993: mov ecx, [edi+50h]
  '00491996: mov edx, [ecx+0Ch]
  '00491999: xor ecx, ecx
  '0049199B: mov cl, [edx+eax]
  '0049199E: mov [ebp+24h], ecx
  '004919A1: mov eax, [ebp+28h]
  '004919A4: test eax, eax
  '004919A6: jnz 4919EFh
  '004919A8: mov eax, [edi+50h]
  '004919AB: test eax, eax
  '004919AD: jz 4919DAh
  '004919AF: cmp word ptr [eax], 0001h
  '004919B3: jnz 4919DAh
  '004919B5: mov esi, [ebp+10h]
  '004919B8: mov edx, [eax+14h]
  '004919BB: mov ecx, [eax+10h]
  '004919BE: sub esi, 00000001h
  '004919C1: jo 00491B44h
  '004919C7: sub esi, edx
  '004919C9: cmp esi, ecx
  '004919CB: jb 4919D3h
  '004919CD: call [00401170h]
  '004919D3: shl esi, 04h
  '004919D6: mov eax, esi
  '004919D8: jmp 4919E0h
  '004919DA: call [00401170h]
  '004919E0: mov edx, [edi+50h]
  '004919E3: mov ecx, [edx+0Ch]
  '004919E6: xor edx, edx
  '004919E8: mov dl, [ecx+eax+01h]
  '004919EC: mov [ebp+28h], edx
  '004919EF: mov eax, [edi+50h]
  '004919F2: test eax, eax
  '004919F4: jz 491A27h
  '004919F6: cmp word ptr [eax], 0001h
  '004919FA: jnz 491A27h
  '004919FC: mov ebx, [ebp+10h]
  '004919FF: mov edx, [eax+14h]
  '00491A02: mov ecx, [eax+10h]
  '00491A05: mov esi, ebx
  '00491A07: sub esi, 00000001h
  '00491A0A: jo 00491B44h
  '00491A10: sub esi, edx
  '00491A12: cmp esi, ecx
  '00491A14: jb 491A1Ch
  '00491A16: call [00401170h]
  '00491A1C: shl esi, 04h
  '00491A1F: mov [ebp-000000FCh], esi
  '00491A25: jmp 491A36h
  '00491A27: call [00401170h]
  '00491A2D: mov ebx, [ebp+10h]
  '00491A30: mov [ebp-000000FCh], eax
  '00491A36: mov eax, [edi+50h]
  '00491A39: test eax, eax
  '00491A3B: jz 491A67h
  '00491A3D: cmp word ptr [eax], 0001h
  '00491A41: jnz 491A67h
  '00491A43: mov edx, [eax+14h]
  '00491A46: mov ecx, [eax+10h]
  '00491A49: sub ebx, 00000001h
  '00491A4C: jo 00491B44h
  '00491A52: sub ebx, edx
  '00491A54: mov esi, ebx
  '00491A56: cmp esi, ecx
  '00491A58: jb 491A60h
  '00491A5A: call [00401170h]
  '00491A60: shl esi, 04h
  '00491A63: mov eax, esi
  '00491A65: jmp 491A6Dh
  '00491A67: call [00401170h]
  '00491A6D: mov ecx, [edi+50h]
  '00491A70: mov edx, [ebp+2Ch]
  '00491A73: mov esi, [ebp-000000FCh]
  '00491A79: push edx
  '00491A7A: mov ecx, [ecx+0Ch]
  '00491A7D: xor edx, edx
  '00491A7F: mov dl, [ecx+esi+01h]
  '00491A83: push edx
  '00491A84: xor edx, edx
  '00491A86: mov dl, [ecx+eax]
  '00491A89: mov eax, [ebp-20h]
  '00491A8C: mov ecx, [ebp+28h]
  '00491A8F: push edx
  '00491A90: mov edx, [ebp+24h]
  '00491A93: push 00000000h
  '00491A95: push 00000000h
  '00491A97: push eax
  '00491A98: mov eax, [ebp+20h]
  '00491A9B: push ecx
  '00491A9C: mov ecx, [ebp+1Ch]
  '00491A9F: push edx
  '00491AA0: mov edx, [ebp+0Ch]
  '00491AA3: push eax
  '00491AA4: push ecx
  '00491AA5: push edx
  '00491AA6: call 00412A00h
  '00491AAB: call [004010A4h]
  '00491AB1: mov eax, [ebp-24h]
  '00491AB4: mov ecx, [ebp-20h]
  '00491AB7: push eax
  '00491AB8: push ecx
  '00491AB9: call 00412934h
  '00491ABE: call [004010A4h]
  '00491AC4: mov esi, [ebp-14h]
  '00491AC7: cmp word ptr [ebp+30h], 0000h
  '00491ACC: jz 491AD3h
  '00491ACE: mov [ebp-18h], esi
  '00491AD1: jmp 491ADFh
  '00491AD3: push esi
  '00491AD4: call 0041297Ch
  '00491AD9: call [004010A4h]
  '00491ADF: mov edx, [ebp-20h]
  '00491AE2: push edx
  '00491AE3: call 0041297Ch
  '00491AE8: call [004010A4h]
  '00491AEE: wait 
  '00491AEF: push 00491B22h
  '00491AF4: jmp 491B21h
  '00491AF6: mov esi, [00401378h]
  '00491AFC: lea eax, [ebp-00000088h]
  '00491B02: push eax
  '00491B03: call esi
  '00491B05: lea ecx, [ebp-0000008Ch]
  '00491B0B: push ecx
  '00491B0C: call esi
  '00491B0E: lea edx, [ebp-00000090h]
  '00491B14: push edx
  '00491B15: call esi
  '00491B17: lea eax, [ebp-00000094h]
  '00491B1D: push eax
  '00491B1E: call esi
  '00491B20: ret 
End Sub
Private Sub unknown_491B50
  '00491B50: push ecx
  '00491B51: mov eax, [esp+08h]
  '00491B55: lea edx, [esp]
  '00491B59: push edx
  '00491B5A: mov edx, [esp+10h]
  '00491B5E: mov ecx, [eax]
  '00491B60: push edx
  '00491B61: push eax
  '00491B62: mov [esp+0Ch], 00000000h
  '00491B6A: call [ecx+7Ch]
  '00491B6D: mov eax, [esp]
  '00491B71: mov ecx, [esp+10h]
  '00491B75: imul eax, 04h
  '00491B78: jo 491B87h
  '00491B7A: add eax, 00000028h
  '00491B7D: jo 491B87h
  '00491B7F: mov [ecx], eax
  '00491B81: xor eax, eax
  '00491B83: pop ecx
  '00491B84: retn 000Ch
End Sub
Private Sub unknown_491B90
  '00491B90: mov ecx, [esp+08h]
  '00491B94: mov eax, [ecx+20h]
  '00491B97: test eax, eax
  '00491B99: jnz 491BDCh
  '00491B9B: movsx eax, word ptr [ecx+0Eh]
  '00491B9F: dec eax
  '00491BA0: jz 491BD7h
  '00491BA2: sub eax, 00000003h
  '00491BA5: jz 491BC7h
  '00491BA7: sub eax, 00000004h
  '00491BAA: jz 491BB7h
  '00491BAC: mov ecx, [esp+0Ch]
  '00491BB0: xor eax, eax
  '00491BB2: mov [ecx], eax
  '00491BB4: retn 000Ch
End Sub
Private Sub unknown_491BF0
  '00491BF0: mov eax, [esp+08h]
  '00491BF4: mov ecx, [esp+0Ch]
  '00491BF8: add eax, 0000001Fh
  '00491BFB: jo 491C12h
  '00491BFD: cdq 
  '00491BFE: and edx, 0000001Fh
  '00491C01: add eax, edx
  '00491C03: sar eax, 05h
  '00491C06: imul eax, 04h
  '00491C09: jo 491C12h
  '00491C0B: mov [ecx], eax
  '00491C0D: xor eax, eax
  '00491C0F: retn 000Ch
End Sub

