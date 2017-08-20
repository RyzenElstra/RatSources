 'VA: 41A764
Const cdata_0 = &H2C0010

Private Sub unknown_49D630
  '0049D630: push ebp
  '0049D631: mov ebp, esp
  '0049D633: sub esp, 0000000Ch
  '0049D636: push 00403796h
  '0049D63B: mov eax, fs:[00h]
  '0049D641: push eax
  '0049D642: mov fs:[00000000h], esp
  '0049D649: sub esp, 000000A4h
  '0049D64F: push ebx
  '0049D650: push esi
  '0049D651: push edi
  '0049D652: mov [ebp-0Ch], esp
  '0049D655: mov [ebp-08h], 00403648h
  '0049D65C: xor ebx, ebx
  '0049D65E: mov [ebp-04h], ebx
  '0049D661: mov esi, [ebp+08h]
  '0049D664: push esi
  '0049D665: mov eax, [esi]
  '0049D667: call [eax+04h]
  '0049D66A: xor ecx, ecx
  '0049D66C: xor eax, eax
  '0049D66E: mov [ebp-28h], ecx
  '0049D671: lea edi, [ebp-000000B0h]
  '0049D677: mov [ebp-24h], ecx
  '0049D67A: mov [ebp-2Ch], ebx
  '0049D67D: mov [ebp-20h], ecx
  '0049D680: mov [ebp-30h], ebx
  '0049D683: mov [ebp-1Ch], ecx
  '0049D686: mov ecx, 0000000Bh
  '0049D68B: rep stosd 
  '0049D68D: mov eax, [esi+54h]
  '0049D690: mov [ebp-34h], ebx
  '0049D693: cmp eax, ebx
  '0049D695: mov [ebp-44h], ebx
  '0049D698: mov [ebp-54h], ebx
  '0049D69B: mov [ebp-64h], ebx
  '0049D69E: mov [ebp-68h], ebx
  '0049D6A1: mov [ebp-6Ch], ebx
  '0049D6A4: mov [esi+34h], 00E0E0E0h
  '0049D6AB: mov [esi+40h], 00404040h
  '0049D6B2: mov [esi+48h], 00000001h
  '0049D6B9: jz 49D6CBh
  '0049D6BB: push eax
  '0049D6BC: call 0041A890h
  '0049D6C1: mov edi, [004010A4h]
  '0049D6C7: call edi
  '0049D6C9: jmp 49D6D1h
  '0049D6CB: mov edi, [004010A4h]
  '0049D6D1: mov edx, [esi+44h]
  '0049D6D4: push ebx
  '0049D6D5: push edx
  '0049D6D6: call [004011FCh]
  '0049D6DC: test ax, ax
  '0049D6DF: jnz 0049DA1Bh
  '0049D6E5: mov eax, [esi+44h]
  '0049D6E8: push ebx
  '0049D6E9: push 004146D8h
  '0049D6EE: lea ecx, [ebp-44h]
  '0049D6F1: push eax
  '0049D6F2: push ecx
  '0049D6F3: call [0040132Ch]
  '0049D6F9: mov eax, [4A0F98h]
  '0049D6FE: add esp, 00000010h
  '0049D701: cmp eax, ebx
  '0049D703: jnz 49D715h
  '0049D705: push 004A0F98h
  '0049D70A: push 0040FFF4h
  '0049D70F: call [004012A8h]
  '0049D715: mov ebx, [004A0F98h]
  '0049D71B: lea eax, [ebp-34h]
  '0049D71E: push eax
  '0049D71F: push ebx
  '0049D720: mov edx, [ebx]
  '0049D722: call [edx+14h]
  '0049D725: test eax, eax
  '0049D727: fclex 
  '0049D729: jnl 49D73Ah
  '0049D72B: push 00000014h
  '0049D72D: push 0040FFE4h
  '0049D732: push ebx
  '0049D733: push eax
  '0049D734: call [004010A8h]
  '0049D73A: mov eax, [ebp-34h]
  '0049D73D: lea edx, [ebp-68h]
  '0049D740: push edx
  '0049D741: push eax
  '0049D742: mov ecx, [eax]
  '0049D744: mov ebx, eax
  '0049D746: call [ecx+00000100h]
  '0049D74C: test eax, eax
  '0049D74E: fclex 
  '0049D750: jnl 49D764h
  '0049D752: push 00000100h
  '0049D757: push 00410004h
  '0049D75C: push ebx
  '0049D75D: push eax
  '0049D75E: call [004010A8h]
  '0049D764: mov ecx, [ebp-68h]
  '0049D767: mov ebx, [004012ECh]
  '0049D76D: lea eax, [ebp-6Ch]
  '0049D770: lea edx, [ebp-44h]
  '0049D773: push eax
  '0049D774: push ecx
  '0049D775: push 00000000h
  '0049D777: push edx
  '0049D778: mov [ebp-6Ch], 00000000h
  '0049D77F: call ebx
  '0049D781: push eax
  '0049D782: push 80000000h
  '0049D787: push 80000000h
  '0049D78C: push 80000000h
  '0049D791: push 80000000h
  '0049D796: push 00000043h
  '0049D798: push 00000000h
  '0049D79A: lea eax, [ebp-30h]
  '0049D79D: push 0040FE9Ch
  '0049D7A2: push eax
  '0049D7A3: call [0040130Ch]
  '0049D7A9: push eax
  '0049D7AA: push 00000000h
  '0049D7AC: call 0041A800h
  '0049D7B1: mov [ebp-70h], eax
  '0049D7B4: call edi
  '0049D7B6: mov ecx, [ebp-70h]
  '0049D7B9: mov [esi+54h], ecx
  '0049D7BC: lea ecx, [ebp-30h]
  '0049D7BF: call [0040138Ch]
  '0049D7C5: lea ecx, [ebp-34h]
  '0049D7C8: call [00401388h]
  '0049D7CE: lea ecx, [ebp-44h]
  '0049D7D1: call [00401034h]
  '0049D7D7: mov edx, [esi+54h]
  '0049D7DA: push 00000013h
  '0049D7DC: push 00000000h
  '0049D7DE: push 00000000h
  '0049D7E0: push 00000000h
  '0049D7E2: push 00000000h
  '0049D7E4: push FFFFFFFFh
  '0049D7E6: push edx
  '0049D7E7: call 004147A0h
  '0049D7EC: call edi
  '0049D7EE: mov eax, [esi+44h]
  '0049D7F1: push 00000000h
  '0049D7F3: push 004146D8h
  '0049D7F8: lea ecx, [ebp-44h]
  '0049D7FB: push eax
  '0049D7FC: push ecx
  '0049D7FD: call [0040132Ch]
  '0049D803: add esp, 00000010h
  '0049D806: lea edx, [ebp-28h]
  '0049D809: lea eax, [ebp-44h]
  '0049D80C: push edx
  '0049D80D: push eax
  '0049D80E: call ebx
  '0049D810: push eax
  '0049D811: call 0041A8D8h
  '0049D816: call edi
  '0049D818: lea ecx, [ebp-44h]
  '0049D81B: call [00401034h]
  '0049D821: cmp word ptr [esi+4Ch], 0000h
  '0049D826: lea edi, [esi+58h]
  '0049D829: jz 49D834h
  '0049D82B: mov [edi+04h], 00000012h
  '0049D832: jmp 49D83Bh
  '0049D834: mov [edi+04h], 00000010h
  '0049D83B: mov ecx, [esi+44h]
  '0049D83E: push 00000000h
  '0049D840: push 004146D8h
  '0049D845: lea edx, [ebp-44h]
  '0049D848: push ecx
  '0049D849: push edx
  '0049D84A: call [0040132Ch]
  '0049D850: add esp, 00000010h
  '0049D853: push eax
  '0049D854: call ebx
  '0049D856: lea ecx, [ebp-44h]
  '0049D859: mov [edi+08h], eax
  '0049D85C: call [00401034h]
  '0049D862: mov [edi+0Ch], 00000000h
  '0049D869: mov eax, [4A0F98h]
  '0049D86E: test eax, eax
  '0049D870: jnz 49D882h
  '0049D872: push 004A0F98h
  '0049D877: push 0040FFF4h
  '0049D87C: call [004012A8h]
  '0049D882: mov ebx, [004A0F98h]
  '0049D888: lea ecx, [ebp-34h]
  '0049D88B: push ecx
  '0049D88C: push ebx
  '0049D88D: mov eax, [ebx]
  '0049D88F: call [eax+14h]
  '0049D892: test eax, eax
  '0049D894: fclex 
  '0049D896: jnl 49D8A7h
  '0049D898: push 00000014h
  '0049D89A: push 0040FFE4h
  '0049D89F: push ebx
  '0049D8A0: push eax
  '0049D8A1: call [004010A8h]
  '0049D8A7: mov eax, [ebp-34h]
  '0049D8AA: lea ecx, [ebp-68h]
  '0049D8AD: push ecx
  '0049D8AE: push eax
  '0049D8AF: mov edx, [eax]
  '0049D8B1: mov ebx, eax
  '0049D8B3: call [edx+00000100h]
  '0049D8B9: test eax, eax
  '0049D8BB: fclex 
  '0049D8BD: jnl 49D8D1h
  '0049D8BF: push 00000100h
  '0049D8C4: push 00410004h
  '0049D8C9: push ebx
  '0049D8CA: push eax
  '0049D8CB: call [004010A8h]
  '0049D8D1: mov edx, [ebp-68h]
  '0049D8D4: lea ecx, [ebp-34h]
  '0049D8D7: mov [edi+20h], edx
  '0049D8DA: call [00401388h]
  '0049D8E0: lea eax, [ebp-28h]
  '0049D8E3: lea ecx, [edi+10h]
  '0049D8E6: push eax
  '0049D8E7: push ecx
  '0049D8E8: push 00000010h
  '0049D8EA: call [00401088h]
  '0049D8F0: lea edx, [ebp-000000B0h]
  '0049D8F6: push edi
  '0049D8F7: push edx
  '0049D8F8: push 0041A764h
  '0049D8FD: call [004011E8h]
  '0049D903: push eax
  '0049D904: mov eax, [esi+54h]
  '0049D907: push 00000000h
  '0049D909: push 00000404h
  '0049D90E: push eax
  '0049D90F: call 0041A848h
  '0049D914: mov ebx, [004010A4h]
  '0049D91A: call ebx
  '0049D91C: lea ecx, [ebp-000000B0h]
  '0049D922: push ecx
  '0049D923: push edi
  '0049D924: push 0041A764h
  '0049D929: call [0040107Ch]
  '0049D92F: lea edx, [ebp-000000B0h]
  '0049D935: push edx
  '0049D936: push 0041A764h
  '0049D93B: call [00401328h]
  '0049D941: mov eax, [esi+38h]
  '0049D944: lea edi, [esi+38h]
  '0049D947: push eax
  '0049D948: push 00000000h
  '0049D94A: call [00401184h]
  '0049D950: test eax, eax
  '0049D952: jnz 49D95Bh
  '0049D954: mov eax, [esi+48h]
  '0049D957: test eax, eax
  '0049D959: jz 49D991h
  '0049D95B: mov ecx, [edi]
  '0049D95D: lea edx, [ebp-30h]
  '0049D960: push ecx
  '0049D961: push edx
  '0049D962: call [0040130Ch]
  '0049D968: mov ecx, [esi+54h]
  '0049D96B: push eax
  '0049D96C: mov eax, [esi+48h]
  '0049D96F: push eax
  '0049D970: push 00000420h
  '0049D975: push ecx
  '0049D976: call 0041A848h
  '0049D97B: call ebx
  '0049D97D: mov edx, [ebp-30h]
  '0049D980: push edx
  '0049D981: push edi
  '0049D982: call [00401228h]
  '0049D988: lea ecx, [ebp-30h]
  '0049D98B: call [0040138Ch]
  '0049D991: mov eax, [esi+40h]
  '0049D994: mov edi, [004012E8h]
  '0049D99A: lea ecx, [ebp-64h]
  '0049D99D: lea edx, [ebp-54h]
  '0049D9A0: push ecx
  '0049D9A1: push edx
  '0049D9A2: mov [ebp-5Ch], eax
  '0049D9A5: mov [ebp-64h], 00008003h
  '0049D9AC: mov [ebp-54h], 00000000h
  '0049D9B3: call edi
  '0049D9B5: test ax, ax
  '0049D9B8: jz 49D9D9h
  '0049D9BA: mov ecx, [esi+40h]
  '0049D9BD: mov edx, [esi+54h]
  '0049D9C0: lea eax, [ebp-68h]
  '0049D9C3: mov [ebp-68h], 00000000h
  '0049D9CA: push eax
  '0049D9CB: push ecx
  '0049D9CC: push 00000414h
  '0049D9D1: push edx
  '0049D9D2: call 0041A848h
  '0049D9D7: call ebx
  '0049D9D9: mov eax, [esi+34h]
  '0049D9DC: lea ecx, [ebp-64h]
  '0049D9DF: lea edx, [ebp-54h]
  '0049D9E2: push ecx
  '0049D9E3: push edx
  '0049D9E4: mov [ebp-5Ch], eax
  '0049D9E7: mov [ebp-64h], 00008003h
  '0049D9EE: mov [ebp-54h], 00000000h
  '0049D9F5: call edi
  '0049D9F7: test ax, ax
  '0049D9FA: jz 49DA1Bh
  '0049D9FC: mov ecx, [esi+34h]
  '0049D9FF: mov edx, [esi+54h]
  '0049DA02: lea eax, [ebp-68h]
  '0049DA05: mov [ebp-68h], 00000000h
  '0049DA0C: push eax
  '0049DA0D: push ecx
  '0049DA0E: push 00000413h
  '0049DA13: push edx
  '0049DA14: call 0041A848h
  '0049DA19: call ebx
  '0049DA1B: push 0049DA51h
  '0049DA20: jmp 49DA3Eh
  '0049DA22: lea ecx, [ebp-30h]
  '0049DA25: call [0040138Ch]
  '0049DA2B: lea ecx, [ebp-34h]
  '0049DA2E: call [00401388h]
  '0049DA34: lea ecx, [ebp-44h]
  '0049DA37: call [00401034h]
  '0049DA3D: ret 
End Sub
Private Sub unknown_49DA80
  '0049DA80: push ebp
  '0049DA81: mov ebp, esp
  '0049DA83: sub esp, 0000000Ch
  '0049DA86: push 00403796h
  '0049DA8B: mov eax, fs:[00h]
  '0049DA91: push eax
  '0049DA92: mov fs:[00000000h], esp
  '0049DA99: sub esp, 0000000Ch
  '0049DA9C: push ebx
  '0049DA9D: push esi
  '0049DA9E: push edi
  '0049DA9F: mov [ebp-0Ch], esp
  '0049DAA2: mov [ebp-08h], 00403658h
  '0049DAA9: xor edi, edi
  '0049DAAB: mov [ebp-04h], edi
  '0049DAAE: mov esi, [ebp+08h]
  '0049DAB1: push esi
  '0049DAB2: mov eax, [esi]
  '0049DAB4: call [eax+04h]
  '0049DAB7: mov ecx, [ebp+0Ch]
  '0049DABA: lea edx, [ebp-18h]
  '0049DABD: mov [ebp-18h], edi
  '0049DAC0: mov edi, [004010FCh]
  '0049DAC6: push ecx
  '0049DAC7: push edx
  '0049DAC8: call edi
  '0049DACA: mov eax, [ebp-18h]
  '0049DACD: add esi, 00000044h
  '0049DAD0: push eax
  '0049DAD1: push esi
  '0049DAD2: call edi
  '0049DAD4: push 0049DAE3h
  '0049DAD9: lea ecx, [ebp-18h]
  '0049DADC: call [00401388h]
  '0049DAE2: ret 
End Sub
Private Sub unknown_49DB10
  '0049DB10: push ebp
  '0049DB11: mov ebp, esp
  '0049DB13: sub esp, 0000000Ch
  '0049DB16: push 00403796h
  '0049DB1B: mov eax, fs:[00h]
  '0049DB21: push eax
  '0049DB22: mov fs:[00000000h], esp
  '0049DB29: sub esp, 0000000Ch
  '0049DB2C: push ebx
  '0049DB2D: push esi
  '0049DB2E: push edi
  '0049DB2F: mov [ebp-0Ch], esp
  '0049DB32: mov [ebp-08h], 00403668h
  '0049DB39: xor edi, edi
  '0049DB3B: mov [ebp-04h], edi
  '0049DB3E: mov esi, [ebp+08h]
  '0049DB41: push esi
  '0049DB42: mov eax, [esi]
  '0049DB44: call [eax+04h]
  '0049DB47: mov ecx, [ebp+0Ch]
  '0049DB4A: lea eax, [ebp-18h]
  '0049DB4D: mov [ebp-18h], edi
  '0049DB50: mov [ecx], edi
  '0049DB52: mov edx, [esi+44h]
  '0049DB55: push edx
  '0049DB56: push eax
  '0049DB57: call [004010FCh]
  '0049DB5D: push 0049DB6Fh
  '0049DB62: jmp 49DB6Eh
  '0049DB64: lea ecx, [ebp-18h]
  '0049DB67: call [00401388h]
  '0049DB6D: ret 
End Sub
Private Sub unknown_49DBA0
  '0049DBA0: push ebp
  '0049DBA1: mov ebp, esp
  '0049DBA3: sub esp, 0000000Ch
  '0049DBA6: push 00403796h
  '0049DBAB: mov eax, fs:[00h]
  '0049DBB1: push eax
  '0049DBB2: mov fs:[00000000h], esp
  '0049DBB9: sub esp, 00000084h
  '0049DBBF: push ebx
  '0049DBC0: push esi
  '0049DBC1: push edi
  '0049DBC2: mov [ebp-0Ch], esp
  '0049DBC5: mov [ebp-08h], 00403678h
  '0049DBCC: xor edi, edi
  '0049DBCE: mov [ebp-04h], edi
  '0049DBD1: mov esi, [ebp+08h]
  '0049DBD4: push esi
  '0049DBD5: mov eax, [esi]
  '0049DBD7: call [eax+04h]
  '0049DBDA: mov edx, [ebp+0Ch]
  '0049DBDD: lea ecx, [ebp-18h]
  '0049DBE0: mov [ebp-18h], edi
  '0049DBE3: mov [ebp-1Ch], edi
  '0049DBE6: mov [ebp-2Ch], edi
  '0049DBE9: mov [ebp-3Ch], edi
  '0049DBEC: mov [ebp-4Ch], edi
  '0049DBEF: mov [ebp-5Ch], edi
  '0049DBF2: mov [ebp-6Ch], edi
  '0049DBF5: mov [ebp-7Ch], edi
  '0049DBF8: mov [ebp-0000008Ch], edi
  '0049DBFE: call [004012C4h]
  '0049DC04: mov edx, [ebp-18h]
  '0049DC07: lea ebx, [esi+38h]
  '0049DC0A: mov ecx, ebx
  '0049DC0C: call [004012C4h]
  '0049DC12: mov edx, [esi+54h]
  '0049DC15: xor ecx, ecx
  '0049DC17: cmp edx, edi
  '0049DC19: mov edx, [ebx]
  '0049DC1B: setnz cl
  '0049DC1E: neg ecx
  '0049DC20: mov [ebp-64h], edx
  '0049DC23: mov edx, [esi+48h]
  '0049DC26: mov [ebp-74h], cx
  '0049DC2A: xor ecx, ecx
  '0049DC2C: cmp edx, edi
  '0049DC2E: mov eax, 0000000Bh
  '0049DC33: setnz cl
  '0049DC36: neg ecx
  '0049DC38: mov [ebp-7Ch], eax
  '0049DC3B: mov [ebp-0000008Ch], eax
  '0049DC41: lea edx, [ebp-7Ch]
  '0049DC44: mov [ebp-00000084h], cx
  '0049DC4B: lea eax, [ebp-6Ch]
  '0049DC4E: push edx
  '0049DC4F: lea ecx, [ebp-5Ch]
  '0049DC52: push eax
  '0049DC53: lea edx, [ebp-2Ch]
  '0049DC56: push ecx
  '0049DC57: push edx
  '0049DC58: mov [ebp-6Ch], 00008008h
  '0049DC5F: mov [ebp-5Ch], edi
  '0049DC62: call [00401090h]
  '0049DC68: push eax
  '0049DC69: lea eax, [ebp-3Ch]
  '0049DC6C: push eax
  '0049DC6D: call [00401200h]
  '0049DC73: lea ecx, [ebp-0000008Ch]
  '0049DC79: push eax
  '0049DC7A: lea edx, [ebp-4Ch]
  '0049DC7D: push ecx
  '0049DC7E: push edx
  '0049DC7F: call [00401200h]
  '0049DC85: push eax
  '0049DC86: call [00401128h]
  '0049DC8C: mov [ebp-00000090h], eax
  '0049DC92: lea eax, [ebp-0000008Ch]
  '0049DC98: lea ecx, [ebp-7Ch]
  '0049DC9B: push eax
  '0049DC9C: push ecx
  '0049DC9D: push 00000002h
  '0049DC9F: call [00401058h]
  '0049DCA5: add esp, 0000000Ch
  '0049DCA8: cmp [ebp-00000090h], di
  '0049DCAF: jz 49DCEBh
  '0049DCB1: mov edx, [ebx]
  '0049DCB3: lea eax, [ebp-1Ch]
  '0049DCB6: push edx
  '0049DCB7: push eax
  '0049DCB8: call [0040130Ch]
  '0049DCBE: mov ecx, [esi+48h]
  '0049DCC1: mov edx, [esi+54h]
  '0049DCC4: push eax
  '0049DCC5: push ecx
  '0049DCC6: push 00000420h
  '0049DCCB: push edx
  '0049DCCC: call 0041A848h
  '0049DCD1: call [004010A4h]
  '0049DCD7: mov eax, [ebp-1Ch]
  '0049DCDA: push eax
  '0049DCDB: push ebx
  '0049DCDC: call [00401228h]
  '0049DCE2: lea ecx, [ebp-1Ch]
  '0049DCE5: call [0040138Ch]
  '0049DCEB: push 0049DD1Dh
  '0049DCF0: jmp 49DD13h
  '0049DCF2: lea ecx, [ebp-1Ch]
  '0049DCF5: call [0040138Ch]
  '0049DCFB: lea ecx, [ebp-4Ch]
  '0049DCFE: lea edx, [ebp-3Ch]
  '0049DD01: push ecx
  '0049DD02: lea eax, [ebp-2Ch]
  '0049DD05: push edx
  '0049DD06: push eax
  '0049DD07: push 00000003h
  '0049DD09: call [00401058h]
  '0049DD0F: add esp, 00000010h
  '0049DD12: ret 
End Sub
Private Sub unknown_49DD40
  '0049DD40: push ebp
  '0049DD41: mov ebp, esp
  '0049DD43: sub esp, 0000000Ch
  '0049DD46: push 00403796h
  '0049DD4B: mov eax, fs:[00h]
  '0049DD51: push eax
  '0049DD52: mov fs:[00000000h], esp
  '0049DD59: sub esp, 0000000Ch
  '0049DD5C: push ebx
  '0049DD5D: push esi
  '0049DD5E: push edi
  '0049DD5F: mov [ebp-0Ch], esp
  '0049DD62: mov [ebp-08h], 00403688h
  '0049DD69: xor edi, edi
  '0049DD6B: mov [ebp-04h], edi
  '0049DD6E: mov esi, [ebp+08h]
  '0049DD71: push esi
  '0049DD72: mov eax, [esi]
  '0049DD74: call [eax+04h]
  '0049DD77: mov ecx, [ebp+0Ch]
  '0049DD7A: mov [ebp-18h], edi
  '0049DD7D: mov [ecx], edi
  '0049DD7F: mov edx, [esi+7Ch]
  '0049DD82: lea ecx, [ebp-18h]
  '0049DD85: call [004012C4h]
  '0049DD8B: push 0049DD9Dh
  '0049DD90: jmp 49DD9Ch
  '0049DD92: lea ecx, [ebp-18h]
  '0049DD95: call [0040138Ch]
  '0049DD9B: ret 
End Sub
Private Sub unknown_49DDD0
  '0049DDD0: push ebp
  '0049DDD1: mov ebp, esp
  '0049DDD3: sub esp, 0000000Ch
  '0049DDD6: push 00403796h
  '0049DDDB: mov eax, fs:[00h]
  '0049DDE1: push eax
  '0049DDE2: mov fs:[00000000h], esp
  '0049DDE9: sub esp, 00000038h
  '0049DDEC: push ebx
  '0049DDED: push esi
  '0049DDEE: push edi
  '0049DDEF: mov [ebp-0Ch], esp
  '0049DDF2: mov [ebp-08h], 00403698h
  '0049DDF9: xor ebx, ebx
  '0049DDFB: mov [ebp-04h], ebx
  '0049DDFE: mov esi, [ebp+08h]
  '0049DE01: push esi
  '0049DE02: mov eax, [esi]
  '0049DE04: call [eax+04h]
  '0049DE07: mov edx, [ebp+0Ch]
  '0049DE0A: mov ecx, 0000000Bh
  '0049DE0F: xor eax, eax
  '0049DE11: lea edi, [ebp-44h]
  '0049DE14: rep stosd 
  '0049DE16: mov edi, [004012C4h]
  '0049DE1C: lea ecx, [ebp-18h]
  '0049DE1F: mov [ebp-18h], ebx
  '0049DE22: call edi
  '0049DE24: mov edx, [ebp-18h]
  '0049DE27: lea ecx, [esi+7Ch]
  '0049DE2A: call edi
  '0049DE2C: cmp [esi+54h], ebx
  '0049DE2F: jz 49DE79h
  '0049DE31: lea edi, [esi+58h]
  '0049DE34: lea ecx, [ebp-44h]
  '0049DE37: push edi
  '0049DE38: push ecx
  '0049DE39: push 0041A764h
  '0049DE3E: call [004011E8h]
  '0049DE44: mov edx, [esi+54h]
  '0049DE47: push eax
  '0049DE48: push ebx
  '0049DE49: push 0000040Ch
  '0049DE4E: push edx
  '0049DE4F: call 0041A848h
  '0049DE54: call [004010A4h]
  '0049DE5A: lea eax, [ebp-44h]
  '0049DE5D: push eax
  '0049DE5E: push edi
  '0049DE5F: push 0041A764h
  '0049DE64: call [0040107Ch]
  '0049DE6A: lea ecx, [ebp-44h]
  '0049DE6D: push ecx
  '0049DE6E: push 0041A764h
  '0049DE73: call [00401328h]
  '0049DE79: push 0049DE97h
  '0049DE7E: lea edx, [ebp-44h]
  '0049DE81: push edx
  '0049DE82: push 0041A764h
  '0049DE87: call [00401328h]
  '0049DE8D: lea ecx, [ebp-18h]
  '0049DE90: call [0040138Ch]
  '0049DE96: ret 
End Sub
Private Sub Create_49DEC0
  '0049DEC0: push ebp
  '0049DEC1: mov ebp, esp
  '0049DEC3: sub esp, 0000000Ch
  '0049DEC6: push 00403796h
  '0049DECB: mov eax, fs:[00h]
  '0049DED1: push eax
  '0049DED2: mov fs:[00000000h], esp
  '0049DED9: sub esp, 0000000Ch
  '0049DEDC: push ebx
  '0049DEDD: push esi
  '0049DEDE: push edi
  '0049DEDF: mov [ebp-0Ch], esp
  '0049DEE2: mov [ebp-08h], 004036A8h
  '0049DEE9: xor edi, edi
  '0049DEEB: mov [ebp-04h], edi
  '0049DEEE: mov esi, [ebp+08h]
  '0049DEF1: push esi
  '0049DEF2: mov eax, [esi]
  '0049DEF4: call [eax+04h]
  '0049DEF7: mov ecx, [ebp+0Ch]
  '0049DEFA: mov [ebp-18h], edi
  '0049DEFD: mov [ecx], edi
  '0049DEFF: mov edx, [esi+3Ch]
  '0049DF02: lea ecx, [ebp-18h]
  '0049DF05: call [004012C4h]
  '0049DF0B: push 0049DF1Dh
  '0049DF10: jmp 49DF1Ch
  '0049DF12: lea ecx, [ebp-18h]
  '0049DF15: call [0040138Ch]
  '0049DF1B: ret 
End Sub
Private Sub ParentControl_49DF50
  '0049DF50: push ebp
  '0049DF51: mov ebp, esp
  '0049DF53: sub esp, 0000000Ch
  '0049DF56: push 00403796h
  '0049DF5B: mov eax, fs:[00h]
  '0049DF61: push eax
  '0049DF62: mov fs:[00000000h], esp
  '0049DF69: sub esp, 00000008h
  '0049DF6C: push ebx
  '0049DF6D: push esi
  '0049DF6E: push edi
  '0049DF6F: mov [ebp-0Ch], esp
  '0049DF72: mov [ebp-08h], 004036B8h
  '0049DF79: mov esi, [ebp+08h]
  '0049DF7C: mov eax, esi
  '0049DF7E: and eax, 00000001h
  '0049DF81: mov [ebp-04h], eax
  '0049DF84: and esi, FFFFFFFEh
  '0049DF87: push esi
  '0049DF88: mov [ebp+08h], esi
  '0049DF8B: mov ecx, [esi]
  '0049DF8D: call [ecx+04h]
  '0049DF90: mov esi, [esi+54h]
  '0049DF93: test esi, esi
  '0049DF95: jz 49DFA3h
  '0049DF97: push esi
  '0049DF98: call 0041A890h
  '0049DF9D: call [004010A4h]
  '0049DFA3: mov [ebp-04h], 00000000h
  '0049DFAA: mov eax, [ebp+08h]
  '0049DFAD: push eax
  '0049DFAE: mov edx, [eax]
  '0049DFB0: call [edx+08h]
  '0049DFB3: mov eax, [ebp-04h]
  '0049DFB6: mov ecx, [ebp-14h]
  '0049DFB9: pop edi
  '0049DFBA: pop esi
  '0049DFBB: mov fs:[00000000h], ecx
  '0049DFC2: pop ebx
  '0049DFC3: mov esp, ebp
  '0049DFC5: pop ebp
  '0049DFC6: retn 0004h
End Sub

