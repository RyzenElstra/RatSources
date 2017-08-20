Private Sub unknown_49E790
  '0049E790: push ebp
  '0049E791: mov ebp, esp
  '0049E793: sub esp, 0000000Ch
  '0049E796: push 00403796h
  '0049E79B: mov eax, fs:[00h]
  '0049E7A1: push eax
  '0049E7A2: mov fs:[00000000h], esp
  '0049E7A9: sub esp, 0000001Ch
  '0049E7AC: push ebx
  '0049E7AD: push esi
  '0049E7AE: push edi
  '0049E7AF: mov [ebp-0Ch], esp
  '0049E7B2: mov [ebp-08h], 00403710h
  '0049E7B9: xor esi, esi
  '0049E7BB: mov [ebp-04h], esi
  '0049E7BE: mov eax, [ebp+08h]
  '0049E7C1: push eax
  '0049E7C2: mov ecx, [eax]
  '0049E7C4: call [ecx+04h]
  '0049E7C7: mov edx, [ebp+0Ch]
  '0049E7CA: lea eax, [ebp-28h]
  '0049E7CD: push eax
  '0049E7CE: mov [ebp-18h], esi
  '0049E7D1: mov [ebp-28h], esi
  '0049E7D4: mov [edx], esi
  '0049E7D6: call [00401354h]
  '0049E7DC: mov edx, eax
  '0049E7DE: lea ecx, [ebp-18h]
  '0049E7E1: call [00401348h]
  '0049E7E7: push 0049E802h
  '0049E7EC: jmp 49E7F8h
  '0049E7EE: lea ecx, [ebp-18h]
  '0049E7F1: call [0040138Ch]
  '0049E7F7: ret 
End Sub
Private Sub unknown_49E830
  '0049E830: push ebp
  '0049E831: mov ebp, esp
  '0049E833: sub esp, 0000000Ch
  '0049E836: push 00403796h
  '0049E83B: mov eax, fs:[00h]
  '0049E841: push eax
  '0049E842: mov fs:[00000000h], esp
  '0049E849: sub esp, 0000007Ch
  '0049E84C: push ebx
  '0049E84D: push esi
  '0049E84E: push edi
  '0049E84F: mov [ebp-0Ch], esp
  '0049E852: mov [ebp-08h], 00403720h
  '0049E859: xor edi, edi
  '0049E85B: mov [ebp-04h], edi
  '0049E85E: mov esi, [ebp+08h]
  '0049E861: push esi
  '0049E862: mov eax, [esi]
  '0049E864: call [eax+04h]
  '0049E867: mov ebx, [ebp+0Ch]
  '0049E86A: xor ecx, ecx
  '0049E86C: mov [ebp-1Ch], ecx
  '0049E86F: push 00000007h
  '0049E871: mov edx, [ebx]
  '0049E873: mov [ebp-18h], ecx
  '0049E876: push edx
  '0049E877: mov [ebp-24h], edi
  '0049E87A: mov [ebp-34h], edi
  '0049E87D: mov [ebp-38h], edi
  '0049E880: mov [ebp-48h], edi
  '0049E883: mov [ebp-4Ch], edi
  '0049E886: mov [ebp-50h], edi
  '0049E889: mov [ebp-54h], edi
  '0049E88C: mov [ebp-58h], edi
  '0049E88F: mov [ebp-68h], edi
  '0049E892: mov [ebp-78h], edi
  '0049E895: mov [ebp-7Ch], edi
  '0049E898: mov [ebp-00000084h], edi
  '0049E89E: call [0040131Ch]
  '0049E8A4: mov edx, eax
  '0049E8A6: lea ecx, [ebp-50h]
  '0049E8A9: call [00401348h]
  '0049E8AF: push eax
  '0049E8B0: push 00424628h
  '0049E8B5: call [00401184h]
  '0049E8BB: mov edi, eax
  '0049E8BD: lea ecx, [ebp-50h]
  '0049E8C0: neg edi
  '0049E8C2: sbb edi, edi
  '0049E8C4: inc edi
  '0049E8C5: neg edi
  '0049E8C7: call [0040138Ch]
  '0049E8CD: test di, di
  '0049E8D0: jz 49E906h
  '0049E8D2: mov ecx, [ebx]
  '0049E8D4: lea eax, [ebp-68h]
  '0049E8D7: push eax
  '0049E8D8: push 00000008h
  '0049E8DA: push ecx
  '0049E8DB: mov [ebp-60h], 80020004h
  '0049E8E2: mov [ebp-68h], 0000000Ah
  '0049E8E9: call [00401138h]
  '0049E8EF: mov edi, [00401348h]
  '0049E8F5: mov edx, eax
  '0049E8F7: mov ecx, ebx
  '0049E8F9: call edi
  '0049E8FB: lea ecx, [ebp-68h]
  '0049E8FE: call [00401034h]
  '0049E904: jmp 49E90Ch
  '0049E906: mov edi, [00401348h]
  '0049E90C: mov edx, [ebx]
  '0049E90E: push 00000001h
  '0049E910: push edx
  '0049E911: push 004222E8h
  '0049E916: push 00000000h
  '0049E918: call [004012A0h]
  '0049E91E: test eax, eax
  '0049E920: jnz 49E93Bh
  '0049E922: mov edx, [ebx]
  '0049E924: mov edi, [004012C4h]
  '0049E92A: lea ecx, [ebp-24h]
  '0049E92D: call edi
  '0049E92F: mov edx, 0040FE84h
  '0049E934: lea ecx, [ebp-38h]
  '0049E937: call edi
  '0049E939: jmp 49E9A6h
  '0049E93B: mov eax, [ebx]
  '0049E93D: push 00000001h
  '0049E93F: push eax
  '0049E940: push 004222E8h
  '0049E945: push 00000000h
  '0049E947: call [004012A0h]
  '0049E94D: mov ecx, [ebx]
  '0049E94F: sub eax, 00000001h
  '0049E952: jo 0049EBD6h
  '0049E958: push eax
  '0049E959: push ecx
  '0049E95A: call [0040131Ch]
  '0049E960: mov edx, eax
  '0049E962: lea ecx, [ebp-24h]
  '0049E965: call edi
  '0049E967: mov eax, [ebp-24h]
  '0049E96A: lea edx, [ebp-68h]
  '0049E96D: push edx
  '0049E96E: push eax
  '0049E96F: mov [ebp-60h], 80020004h
  '0049E976: mov [ebp-68h], 0000000Ah
  '0049E97D: call [0040103Ch]
  '0049E983: mov ecx, [ebx]
  '0049E985: add eax, 00000001h
  '0049E988: jo 0049EBD6h
  '0049E98E: push eax
  '0049E98F: push ecx
  '0049E990: call [00401138h]
  '0049E996: mov edx, eax
  '0049E998: lea ecx, [ebp-38h]
  '0049E99B: call edi
  '0049E99D: lea ecx, [ebp-68h]
  '0049E9A0: call [00401034h]
  '0049E9A6: mov edi, 00000008h
  '0049E9AB: lea edx, [ebp-78h]
  '0049E9AE: lea ecx, [ebp-48h]
  '0049E9B1: mov [ebp-70h], 0040FE84h
  '0049E9B8: mov [ebp-78h], edi
  '0049E9BB: call [00401324h]
  '0049E9C1: mov eax, [esi+34h]
  '0049E9C4: test eax, eax
  '0049E9C6: jz 0049EB1Fh
  '0049E9CC: lea edx, [ebp-00000084h]
  '0049E9D2: lea ecx, [ebp-1Ch]
  '0049E9D5: push edx
  '0049E9D6: push ecx
  '0049E9D7: push 00000028h
  '0049E9D9: push eax
  '0049E9DA: mov [ebp-00000084h], edi
  '0049E9E0: call 0041D41Ch
  '0049E9E5: call [004010A4h]
  '0049E9EB: mov edx, [ebp-1Ch]
  '0049E9EE: mov ecx, [ebp-24h]
  '0049E9F1: mov eax, [ebp-18h]
  '0049E9F4: mov edi, [0040130Ch]
  '0049E9FA: push 00000000h
  '0049E9FC: push 00000000h
  '0049E9FE: push 00000003h
  '0049EA00: push 00000000h
  '0049EA02: mov [esi+40h], edx
  '0049EA05: push 00000000h
  '0049EA07: push 00000050h
  '0049EA09: lea edx, [ebp-50h]
  '0049EA0C: push ecx
  '0049EA0D: push edx
  '0049EA0E: mov [esi+44h], eax
  '0049EA11: call edi
  '0049EA13: push eax
  '0049EA14: mov eax, [esi+34h]
  '0049EA17: push eax
  '0049EA18: call 0041ECD8h
  '0049EA1D: mov [ebp-00000084h], eax
  '0049EA23: call [004010A4h]
  '0049EA29: mov ecx, [ebp-50h]
  '0049EA2C: lea edx, [ebp-24h]
  '0049EA2F: push ecx
  '0049EA30: push edx
  '0049EA31: call [00401228h]
  '0049EA37: mov eax, [ebp-00000084h]
  '0049EA3D: lea ecx, [ebp-50h]
  '0049EA40: mov [esi+38h], eax
  '0049EA43: call [0040138Ch]
  '0049EA49: mov eax, [esi+38h]
  '0049EA4C: test eax, eax
  '0049EA4E: jle 0049EB16h
  '0049EA54: push 00000000h
  '0049EA56: push 80000000h
  '0049EA5B: push 00000000h
  '0049EA5D: push 00000000h
  '0049EA5F: lea ecx, [ebp-58h]
  '0049EA62: push 00424648h
  '0049EA67: push ecx
  '0049EA68: call edi
  '0049EA6A: mov edx, [ebp-38h]
  '0049EA6D: push eax
  '0049EA6E: lea eax, [ebp-54h]
  '0049EA71: push edx
  '0049EA72: push eax
  '0049EA73: call edi
  '0049EA75: push eax
  '0049EA76: lea ecx, [ebp-50h]
  '0049EA79: push 0042463Ch
  '0049EA7E: push ecx
  '0049EA7F: call edi
  '0049EA81: mov edx, [esi+38h]
  '0049EA84: push eax
  '0049EA85: push edx
  '0049EA86: call 0041E73Ch
  '0049EA8B: mov edi, [004010A4h]
  '0049EA91: mov [ebp-00000084h], eax
  '0049EA97: call edi
  '0049EA99: mov eax, [ebp-54h]
  '0049EA9C: lea ecx, [ebp-38h]
  '0049EA9F: push eax
  '0049EAA0: push ecx
  '0049EAA1: call [00401228h]
  '0049EAA7: mov edx, [ebp-00000084h]
  '0049EAAD: lea eax, [ebp-58h]
  '0049EAB0: mov [esi+3Ch], edx
  '0049EAB3: lea ecx, [ebp-54h]
  '0049EAB6: push eax
  '0049EAB7: lea edx, [ebp-50h]
  '0049EABA: push ecx
  '0049EABB: push edx
  '0049EABC: push 00000003h
  '0049EABE: call [004012CCh]
  '0049EAC4: mov esi, [esi+3Ch]
  '0049EAC7: add esp, 00000010h
  '0049EACA: test esi, esi
  '0049EACC: jz 49EAEEh
  '0049EACE: lea eax, [ebp-7Ch]
  '0049EAD1: push 00000000h
  '0049EAD3: push eax
  '0049EAD4: push 00000000h
  '0049EAD6: push 00000000h
  '0049EAD8: push esi
  '0049EAD9: mov [ebp-7Ch], 00000000h
  '0049EAE0: call 0041DF90h
  '0049EAE5: call edi
  '0049EAE7: mov edi, 00000008h
  '0049EAEC: jmp 49EB3Ch
  '0049EAEE: mov [ebp-70h], 00424660h
  '0049EAF5: lea edx, [ebp-78h]
  '0049EAF8: lea ecx, [ebp-34h]
  '0049EAFB: mov [ebp-78h], 00000008h
  '0049EB02: call [00401324h]
  '0049EB08: mov [ebp-4Ch], 00000000h
  '0049EB0F: mov edi, 00000008h
  '0049EB14: jmp 49EB3Ch
  '0049EB16: mov [ebp-70h], 00424694h
  '0049EB1D: jmp 49EAF5h
  '0049EB1F: lea edx, [ebp-78h]
  '0049EB22: lea ecx, [ebp-34h]
  '0049EB25: mov [ebp-70h], 004246C8h
  '0049EB2C: mov [ebp-78h], edi
  '0049EB2F: call [00401324h]
  '0049EB35: mov [ebp-4Ch], 00000000h
  '0049EB3C: mov esi, [00401324h]
  '0049EB42: lea edx, [ebp-78h]
  '0049EB45: lea ecx, [ebp-34h]
  '0049EB48: mov [ebp-70h], 0040FE84h
  '0049EB4F: mov [ebp-78h], edi
  '0049EB52: call esi
  '0049EB54: mov ecx, [ebx]
  '0049EB56: lea edx, [ebp-78h]
  '0049EB59: mov [ebp-70h], ecx
  '0049EB5C: lea ecx, [ebp-48h]
  '0049EB5F: mov [ebp-78h], edi
  '0049EB62: call esi
  '0049EB64: push 0049EBADh
  '0049EB69: jmp 49EB8Ch
  '0049EB6B: lea edx, [ebp-58h]
  '0049EB6E: lea eax, [ebp-54h]
  '0049EB71: push edx
  '0049EB72: lea ecx, [ebp-50h]
  '0049EB75: push eax
  '0049EB76: push ecx
  '0049EB77: push 00000003h
  '0049EB79: call [004012CCh]
  '0049EB7F: add esp, 00000010h
  '0049EB82: lea ecx, [ebp-68h]
  '0049EB85: call [00401034h]
  '0049EB8B: ret 
End Sub
Private Sub unknown_49EBE0
  '0049EBE0: push ebp
  '0049EBE1: mov ebp, esp
  '0049EBE3: sub esp, 0000000Ch
  '0049EBE6: push 00403796h
  '0049EBEB: mov eax, fs:[00h]
  '0049EBF1: push eax
  '0049EBF2: mov fs:[00000000h], esp
  '0049EBF9: sub esp, 00000030h
  '0049EBFC: push ebx
  '0049EBFD: push esi
  '0049EBFE: push edi
  '0049EBFF: mov [ebp-0Ch], esp
  '0049EC02: mov [ebp-08h], 00403730h
  '0049EC09: mov esi, [ebp+08h]
  '0049EC0C: mov eax, esi
  '0049EC0E: and eax, 00000001h
  '0049EC11: mov [ebp-04h], eax
  '0049EC14: and esi, FFFFFFFEh
  '0049EC17: push esi
  '0049EC18: mov [ebp+08h], esi
  '0049EC1B: mov ecx, [esi]
  '0049EC1D: call [ecx+04h]
  '0049EC20: xor ebx, ebx
  '0049EC22: lea edx, [ebp-28h]
  '0049EC25: push ebx
  '0049EC26: push ebx
  '0049EC27: push ebx
  '0049EC28: push ebx
  '0049EC29: push 004246FCh
  '0049EC2E: push edx
  '0049EC2F: mov [ebp-24h], ebx
  '0049EC32: mov [ebp-28h], ebx
  '0049EC35: mov [ebp-38h], ebx
  '0049EC38: call [0040130Ch]
  '0049EC3E: push eax
  '0049EC3F: call 0041EEDCh
  '0049EC44: mov edi, eax
  '0049EC46: call [004010A4h]
  '0049EC4C: lea ecx, [ebp-28h]
  '0049EC4F: mov [esi+34h], edi
  '0049EC52: call [0040138Ch]
  '0049EC58: mov eax, [esi+34h]
  '0049EC5B: mov [ebp-30h], 0040FE84h
  '0049EC62: cmp eax, ebx
  '0049EC64: jnz 49EC6Dh
  '0049EC66: mov [ebp-30h], 0042471Ch
  '0049EC6D: lea edx, [ebp-38h]
  '0049EC70: lea ecx, [ebp-24h]
  '0049EC73: mov [ebp-38h], 00000008h
  '0049EC7A: call [00401324h]
  '0049EC80: mov [ebp-04h], ebx
  '0049EC83: push 0049EC9Eh
  '0049EC88: jmp 49EC94h
  '0049EC8A: lea ecx, [ebp-28h]
  '0049EC8D: call [0040138Ch]
  '0049EC93: ret 
End Sub
Private Sub unknown_49ECC0
  '0049ECC0: push ebp
  '0049ECC1: mov ebp, esp
  '0049ECC3: sub esp, 00000018h
  '0049ECC6: push 00403796h
  '0049ECCB: mov eax, fs:[00h]
  '0049ECD1: push eax
  '0049ECD2: mov fs:[00000000h], esp
  '0049ECD9: mov eax, 00000014h
  '0049ECDE: call 00403790h
  '0049ECE3: push ebx
  '0049ECE4: push esi
  '0049ECE5: push edi
  '0049ECE6: mov [ebp-18h], esp
  '0049ECE9: mov [ebp-14h], 00403740h
  '0049ECF0: mov eax, [ebp+08h]
  '0049ECF3: and eax, 00000001h
  '0049ECF6: mov [ebp-10h], eax
  '0049ECF9: mov ecx, [ebp+08h]
  '0049ECFC: and ecx, FFFFFFFEh
  '0049ECFF: mov [ebp+08h], ecx
  '0049ED02: mov [ebp-0Ch], 00000000h
  '0049ED09: mov edx, [ebp+08h]
  '0049ED0C: mov eax, [edx]
  '0049ED0E: mov ecx, [ebp+08h]
  '0049ED11: push ecx
  '0049ED12: call [eax+04h]
  '0049ED15: mov [ebp-04h], 00000001h
  '0049ED1C: mov [ebp-04h], 00000002h
  '0049ED23: push FFFFFFFFh
  '0049ED25: call [004010E8h]
  '0049ED2B: mov [ebp-04h], 00000003h
  '0049ED32: mov edx, [ebp+08h]
  '0049ED35: mov eax, [edx+3Ch]
  '0049ED38: push eax
  '0049ED39: call 0041D9C0h
  '0049ED3E: call [004010A4h]
  '0049ED44: mov [ebp-04h], 00000004h
  '0049ED4B: mov ecx, [ebp+08h]
  '0049ED4E: mov edx, [ecx+34h]
  '0049ED51: push edx
  '0049ED52: call 0041D9C0h
  '0049ED57: call [004010A4h]
  '0049ED5D: mov [ebp-04h], 00000005h
  '0049ED64: mov eax, [ebp+08h]
  '0049ED67: mov ecx, [eax+38h]
  '0049ED6A: push ecx
  '0049ED6B: call 0041D9C0h
  '0049ED70: call [004010A4h]
  '0049ED76: mov [ebp-10h], 00000000h
  '0049ED7D: mov edx, [ebp+08h]
  '0049ED80: mov eax, [edx]
  '0049ED82: mov ecx, [ebp+08h]
  '0049ED85: push ecx
  '0049ED86: call [eax+08h]
  '0049ED89: mov eax, [ebp-10h]
  '0049ED8C: mov ecx, [ebp-20h]
  '0049ED8F: mov fs:[00000000h], ecx
  '0049ED96: pop edi
  '0049ED97: pop esi
  '0049ED98: pop ebx
  '0049ED99: mov esp, ebp
  '0049ED9B: pop ebp
  '0049ED9C: retn 0004h
End Sub

