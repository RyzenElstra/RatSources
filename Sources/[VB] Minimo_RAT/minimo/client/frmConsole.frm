VERSION 5.00
Begin VB.Form frmConsole
  Caption = "MiniMo Data Console"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  Icon = "frmConsole.frx":0
  LinkTopic = "Form2"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 165
  ClientTop = 450
  ClientWidth = 5055
  ClientHeight = 2700
  BeginProperty Font
    Name = "Tahoma"
    Size = 8.25
    Charset = 0
    Weight = 400
    Underline = 0 'False
    Italic = 0 'False
    Strikethrough = 0 'False
  EndProperty
  StartUpPosition = 1 'CenterOwner
  Begin VB.TextBox txtConsole
    ForeColor = &H404040&
    Left = 0
    Top = 0
    Width = 5055
    Height = 2415
    TabIndex = 0
    MultiLine = -1  'True
    ScrollBars = 2
    Locked = -1  'True
  End
  Begin MSComctlLib.StatusBar StatusBar1
    Left = 0
    Top = 2445
    Width = 5055
    Height = 255
    TabIndex = 1
  End
  Begin VB.Menu options_menu
    Caption = "Options"
    Begin VB.Menu save_data
      Caption = "Save data"
    End
    Begin VB.Menu clear_data
      Caption = "Clear data"
    End
    Begin VB.Menu hide_me
      Caption = "Hide me"
    End
  End
End

Attribute VB_Name = "frmConsole"

Private Sub Form__512450
  '00512450: push ebp
  '00512451: mov ebp, esp
  '00512453: sub esp, 0000000Ch
  '00512456: push 004081B6h
  '0051245B: mov eax, fs:[00h]
  '00512461: push eax
  '00512462: mov fs:[00000000h], esp
  '00512469: sub esp, 00000070h
  '0051246C: push ebx
  '0051246D: push esi
  '0051246E: push edi
  '0051246F: mov [ebp-0Ch], esp
  '00512472: mov [ebp-08h], 004067A8h
  '00512479: mov esi, [ebp+08h]
  '0051247C: mov eax, esi
  '0051247E: and eax, 00000001h
  '00512481: mov [ebp-04h], eax
  '00512484: and esi, FFFFFFFEh
  '00512487: push esi
  '00512488: mov [ebp+08h], esi
  '0051248B: mov ecx, [esi]
  '0051248D: call [ecx+04h]
  '00512490: mov edx, [esi]
  '00512492: lea eax, [ebp-28h]
  '00512495: xor ebx, ebx
  '00512497: push eax
  '00512498: push esi
  '00512499: mov [ebp-18h], ebx
  '0051249C: mov [ebp-20h], ebx
  '0051249F: mov [ebp-24h], ebx
  '005124A2: mov [ebp-28h], ebx
  '005124A5: mov [ebp-38h], ebx
  '005124A8: mov [ebp-48h], ebx
  '005124AB: mov [ebp-58h], ebx
  '005124AE: mov [ebp-5Ch], ebx
  '005124B1: mov [ebp-60h], ebx
  '005124B4: mov [ebp-70h], ebx
  '005124B7: mov [ebp-74h], ebx
  '005124BA: call [edx+00000218h]
  '005124C0: cmp eax, ebx
  '005124C2: fclex 
  '005124C4: jnl 5124D8h
  '005124C6: push 00000218h
  '005124CB: push 004204F4h
  '005124D0: push esi
  '005124D1: push eax
  '005124D2: call [004010A0h]
  '005124D8: mov eax, [ebp-28h]
  '005124DB: lea ecx, [ebp-70h]
  '005124DE: push eax
  '005124DF: push ecx
  '005124E0: mov [ebp-28h], ebx
  '005124E3: call [004010E4h]
  '005124E9: push eax
  '005124EA: lea edx, [ebp-18h]
  '005124ED: lea eax, [ebp-74h]
  '005124F0: push edx
  '005124F1: push eax
  '005124F2: push 0041F304h
  '005124F7: call [004010CCh]
  '005124FD: mov esi, [00401278h]
  '00512503: cmp eax, ebx
  '00512505: jz 005125B1h
  '0051250B: mov ecx, [ebp-18h]
  '0051250E: push 0041E3FCh
  '00512513: push ecx
  '00512514: call esi
  '00512516: mov edx, [ebp-18h]
  '00512519: mov di, ax
  '0051251C: neg di
  '0051251F: sbb edi, edi
  '00512521: push 00420F60h
  '00512526: push edx
  '00512527: inc edi
  '00512528: call esi
  '0051252A: neg ax
  '0051252D: sbb eax, eax
  '0051252F: push 0041FB8Ch
  '00512534: inc eax
  '00512535: and edi, eax
  '00512537: mov eax, [ebp-18h]
  '0051253A: neg edi
  '0051253C: sbb edi, edi
  '0051253E: push eax
  '0051253F: neg edi
  '00512541: call esi
  '00512543: neg ax
  '00512546: mov ecx, [ebp-18h]
  '00512549: push 0041CE08h
  '0051254E: sbb eax, eax
  '00512550: push ecx
  '00512551: inc eax
  '00512552: and edi, eax
  '00512554: neg edi
  '00512556: sbb edi, edi
  '00512558: neg edi
  '0051255A: call esi
  '0051255C: neg ax
  '0051255F: sbb eax, eax
  '00512561: inc eax
  '00512562: test edi, eax
  '00512564: jnz 512599h
  '00512566: mov edx, [ebp-18h]
  '00512569: push ebx
  '0051256A: push 00420F70h
  '0051256F: lea eax, [ebp-38h]
  '00512572: push edx
  '00512573: push eax
  '00512574: call [00401368h]
  '0051257A: add esp, 00000010h
  '0051257D: push eax
  '0051257E: call [0040130Ch]
  '00512584: lea ecx, [ebp-60h]
  '00512587: mov [ebp-60h], eax
  '0051258A: push ecx
  '0051258B: call 004EB0B0h
  '00512590: lea ecx, [ebp-38h]
  '00512593: call [00401030h]
  '00512599: lea edx, [ebp-18h]
  '0051259C: lea eax, [ebp-74h]
  '0051259F: push edx
  '005125A0: push eax
  '005125A1: push 0041F304h
  '005125A6: call [00401150h]
  '005125AC: jmp 00512503h
  '005125B1: mov eax, [54106Ch]
  '005125B6: cmp eax, ebx
  '005125B8: jnz 5125CFh
  '005125BA: push 0054106Ch
  '005125BF: push 00411238h
  '005125C4: call [004012B8h]
  '005125CA: mov eax, [54106Ch]
  '005125CF: mov ecx, [eax]
  '005125D1: push eax
  '005125D2: call [ecx+00000328h]
  '005125D8: lea edx, [ebp-28h]
  '005125DB: push eax
  '005125DC: push edx
  '005125DD: call [004010E4h]
  '005125E3: mov esi, eax
  '005125E5: lea ecx, [ebp-5Ch]
  '005125E8: push ecx
  '005125E9: push esi
  '005125EA: mov eax, [esi]
  '005125EC: call [eax+000000E0h]
  '005125F2: cmp eax, ebx
  '005125F4: fclex 
  '005125F6: jnl 51260Ah
  '005125F8: push 000000E0h
  '005125FD: push 0041E108h
  '00512602: push esi
  '00512603: push eax
  '00512604: call [004010A0h]
  '0051260A: mov edi, [004013B8h]
  '00512610: xor edx, edx
  '00512612: cmp word ptr [ebp-5Ch], 0001h
  '00512617: lea ecx, [ebp-28h]
  '0051261A: setz dl
  '0051261D: neg edx
  '0051261F: mov esi, edx
  '00512621: call edi
  '00512623: cmp si, bx
  '00512626: jz 512650h
  '00512628: mov esi, [ebp+08h]
  '0051262B: push ebx
  '0051262C: push 0041E3ECh
  '00512631: push esi
  '00512632: call [0040137Ch]
  '00512638: push eax
  '00512639: lea eax, [ebp-28h]
  '0051263C: push eax
  '0051263D: call [004010E4h]
  '00512643: push eax
  '00512644: call 004F8E60h
  '00512649: lea ecx, [ebp-28h]
  '0051264C: call edi
  '0051264E: jmp 512653h
  '00512650: mov esi, [ebp+08h]
  '00512653: call [00401104h]
  '00512659: lea ecx, [ebp-38h]
  '0051265C: mov [ebp-50h], 00429990h
  '00512663: push ecx
  '00512664: mov [ebp-58h], 00000008h
  '0051266B: call [004013A4h]
  '00512671: lea edx, [ebp-58h]
  '00512674: lea eax, [ebp-38h]
  '00512677: push edx
  '00512678: lea ecx, [ebp-48h]
  '0051267B: push eax
  '0051267C: push ecx
  '0051267D: call [00401274h]
  '00512683: push eax
  '00512684: call [0040103Ch]
  '0051268A: mov edx, eax
  '0051268C: lea ecx, [ebp-24h]
  '0051268F: call [00401378h]
  '00512695: mov edx, [esi]
  '00512697: lea eax, [ebp-24h]
  '0051269A: push eax
  '0051269B: push esi
  '0051269C: call [edx+00000714h]
  '005126A2: lea ecx, [ebp-24h]
  '005126A5: call [004013B4h]
  '005126AB: lea ecx, [ebp-48h]
  '005126AE: lea edx, [ebp-38h]
  '005126B1: push ecx
  '005126B2: push edx
  '005126B3: push 00000002h
  '005126B5: call [00401050h]
  '005126BB: add esp, 0000000Ch
  '005126BE: mov [ebp-04h], ebx
  '005126C1: push 00512714h
  '005126C6: jmp 5126EEh
  '005126C8: lea ecx, [ebp-24h]
  '005126CB: call [004013B4h]
  '005126D1: lea ecx, [ebp-28h]
  '005126D4: call [004013B8h]
  '005126DA: lea eax, [ebp-48h]
  '005126DD: lea ecx, [ebp-38h]
  '005126E0: push eax
  '005126E1: push ecx
  '005126E2: push 00000002h
  '005126E4: call [00401050h]
  '005126EA: add esp, 0000000Ch
  '005126ED: ret 
End Sub
Private Sub Form__5127E0
  '005127E0: push ebp
  '005127E1: mov ebp, esp
  '005127E3: sub esp, 0000000Ch
  '005127E6: push 004081B6h
  '005127EB: mov eax, fs:[00h]
  '005127F1: push eax
  '005127F2: mov fs:[00000000h], esp
  '005127F9: sub esp, 00000054h
  '005127FC: push ebx
  '005127FD: push esi
  '005127FE: push edi
  '005127FF: mov [ebp-0Ch], esp
  '00512802: mov [ebp-08h], 004067C8h
  '00512809: mov esi, [ebp+08h]
  '0051280C: mov eax, esi
  '0051280E: and eax, 00000001h
  '00512811: mov [ebp-04h], eax
  '00512814: and esi, FFFFFFFEh
  '00512817: push esi
  '00512818: mov [ebp+08h], esi
  '0051281B: mov ecx, [esi]
  '0051281D: call [ecx+04h]
  '00512820: mov edx, [esi]
  '00512822: lea eax, [ebp-4Ch]
  '00512825: xor edi, edi
  '00512827: push eax
  '00512828: push esi
  '00512829: mov [ebp-18h], edi
  '0051282C: mov [ebp-4Ch], edi
  '0051282F: mov [ebp-50h], edi
  '00512832: call [edx+00000088h]
  '00512838: cmp eax, edi
  '0051283A: fclex 
  '0051283C: jnl 512854h
  '0051283E: mov ebx, [004010A0h]
  '00512844: push 00000088h
  '00512849: push 004204F4h
  '0051284E: push esi
  '0051284F: push eax
  '00512850: call ebx
  '00512852: jmp 51285Ah
  '00512854: mov ebx, [004010A0h]
  '0051285A: fld real4 ptr [ebp-4Ch]
  '0051285D: fcomp real4 ptr [004067C4h]
  '00512863: fstsw ax
  '00512865: test ah, 01h
  '00512868: jz 51288Ch
  '0051286A: mov ecx, [esi]
  '0051286C: push 44BB8000h
  '00512871: push esi
  '00512872: call [ecx+0000008Ch]
  '00512878: cmp eax, edi
  '0051287A: fclex 
  '0051287C: jnl 51288Ch
  '0051287E: push 0000008Ch
  '00512883: push 004204F4h
  '00512888: push esi
  '00512889: push eax
  '0051288A: call ebx
  '0051288C: mov edx, [esi]
  '0051288E: lea eax, [ebp-4Ch]
  '00512891: push eax
  '00512892: push esi
  '00512893: call [edx+00000080h]
  '00512899: cmp eax, edi
  '0051289B: fclex 
  '0051289D: jnl 5128ADh
  '0051289F: push 00000080h
  '005128A4: push 004204F4h
  '005128A9: push esi
  '005128AA: push eax
  '005128AB: call ebx
  '005128AD: fld real4 ptr [ebp-4Ch]
  '005128B0: fcomp real4 ptr [004067C4h]
  '005128B6: fstsw ax
  '005128B8: test ah, 01h
  '005128BB: jz 5128DFh
  '005128BD: mov ecx, [esi]
  '005128BF: push 44BB8000h
  '005128C4: push esi
  '005128C5: call [ecx+00000084h]
  '005128CB: cmp eax, edi
  '005128CD: fclex 
  '005128CF: jnl 5128DFh
  '005128D1: push 00000084h
  '005128D6: push 004204F4h
  '005128DB: push esi
  '005128DC: push eax
  '005128DD: call ebx
  '005128DF: mov edx, [esi]
  '005128E1: lea eax, [ebp-4Ch]
  '005128E4: push eax
  '005128E5: push esi
  '005128E6: call [edx+00000100h]
  '005128EC: cmp eax, edi
  '005128EE: fclex 
  '005128F0: jnl 512900h
  '005128F2: push 00000100h
  '005128F7: push 004204F4h
  '005128FC: push esi
  '005128FD: push eax
  '005128FE: call ebx
  '00512900: mov ecx, [esi]
  '00512902: push esi
  '00512903: call [ecx+000002FCh]
  '00512909: lea edx, [ebp-18h]
  '0051290C: push eax
  '0051290D: push edx
  '0051290E: call [004010E4h]
  '00512914: lea ecx, [ebp-50h]
  '00512917: mov edi, eax
  '00512919: mov eax, [esi]
  '0051291B: push ecx
  '0051291C: push esi
  '0051291D: call [eax+00000108h]
  '00512923: test eax, eax
  '00512925: fclex 
  '00512927: jnl 512937h
  '00512929: push 00000108h
  '0051292E: push 004204F4h
  '00512933: push esi
  '00512934: push eax
  '00512935: call ebx
  '00512937: fld real4 ptr [ebp-50h]
  '0051293A: fsub real4 ptr [004067C0h]
  '00512940: mov ecx, [ebp-4Ch]
  '00512943: mov esi, [edi]
  '00512945: fstp real4 ptr [ebp-40h]
  '00512948: fstsw ax
  '0051294A: test al, 0Dh
  '0051294C: jnz 00512A07h
  '00512952: sub esp, 00000010h
  '00512955: mov eax, 00000004h
  '0051295A: mov ebx, esp
  '0051295C: mov edx, eax
  '0051295E: sub esp, 00000010h
  '00512961: mov [ebx], eax
  '00512963: mov eax, [ebp-44h]
  '00512966: mov [ebx+04h], eax
  '00512969: mov eax, [ebp-40h]
  '0051296C: mov [ebx+08h], eax
  '0051296F: mov eax, [ebp-3Ch]
  '00512972: mov [ebx+0Ch], eax
  '00512975: mov eax, esp
  '00512977: sub esp, 00000010h
  '0051297A: mov [eax], edx
  '0051297C: mov edx, [ebp-34h]
  '0051297F: mov [eax+04h], edx
  '00512982: mov edx, esp
  '00512984: mov [eax+08h], ecx
  '00512987: mov ecx, [ebp-2Ch]
  '0051298A: mov [eax+0Ch], ecx
  '0051298D: mov eax, 00000002h
  '00512992: mov ecx, [ebp-1Ch]
  '00512995: mov [edx], eax
  '00512997: mov eax, [ebp-24h]
  '0051299A: mov [edx+04h], eax
  '0051299D: xor eax, eax
  '0051299F: push eax
  '005129A0: push edi
  '005129A1: mov [edx+08h], eax
  '005129A4: mov [edx+0Ch], ecx
  '005129A7: call [esi+00000224h]
  '005129AD: test eax, eax
  '005129AF: fclex 
  '005129B1: jnl 5129C5h
  '005129B3: push 00000224h
  '005129B8: push 0041E3FCh
  '005129BD: push edi
  '005129BE: push eax
  '005129BF: call [004010A0h]
  '005129C5: lea ecx, [ebp-18h]
  '005129C8: call [004013B8h]
  '005129CE: mov [ebp-04h], 00000000h
  '005129D5: wait 
  '005129D6: push 005129E8h
  '005129DB: jmp 5129E7h
  '005129DD: lea ecx, [ebp-18h]
  '005129E0: call [004013B8h]
  '005129E6: ret 
End Sub
Private Sub Form__512740
  '00512740: push ebp
  '00512741: mov ebp, esp
  '00512743: sub esp, 0000000Ch
  '00512746: push 004081B6h
  '0051274B: mov eax, fs:[00h]
  '00512751: push eax
  '00512752: mov fs:[00000000h], esp
  '00512759: sub esp, 0000000Ch
  '0051275C: push ebx
  '0051275D: push esi
  '0051275E: push edi
  '0051275F: mov [ebp-0Ch], esp
  '00512762: mov [ebp-08h], 004067B8h
  '00512769: mov esi, [ebp+08h]
  '0051276C: mov eax, esi
  '0051276E: and eax, 00000001h
  '00512771: mov [ebp-04h], eax
  '00512774: and esi, FFFFFFFEh
  '00512777: push esi
  '00512778: mov [ebp+08h], esi
  '0051277B: mov ecx, [esi]
  '0051277D: call [ecx+04h]
  '00512780: cmp word ptr [0054104Eh], 0000h
  '00512788: jnz 5127B9h
  '0051278A: mov edx, [ebp+0Ch]
  '0051278D: push esi
  '0051278E: mov word ptr [edx], 0001h
  '00512793: mov eax, [esi]
  '00512795: call [eax+000002B4h]
  '0051279B: test eax, eax
  '0051279D: fclex 
  '0051279F: jnl 5127B3h
  '005127A1: push 000002B4h
  '005127A6: push 004204F4h
  '005127AB: push esi
  '005127AC: push eax
  '005127AD: call [004010A0h]
  '005127B3: call [00401104h]
  '005127B9: mov [ebp-04h], 00000000h
  '005127C0: mov eax, [ebp+08h]
  '005127C3: push eax
  '005127C4: mov ecx, [eax]
  '005127C6: call [ecx+08h]
  '005127C9: mov eax, [ebp-04h]
  '005127CC: mov ecx, [ebp-14h]
  '005127CF: pop edi
  '005127D0: pop esi
  '005127D1: mov fs:[00000000h], ecx
  '005127D8: pop ebx
  '005127D9: mov esp, ebp
  '005127DB: pop ebp
  '005127DC: retn 000Ch
End Sub
Private Sub hide_me__512A10
  '00512A10: push ebp
  '00512A11: mov ebp, esp
  '00512A13: sub esp, 0000000Ch
  '00512A16: push 004081B6h
  '00512A1B: mov eax, fs:[00h]
  '00512A21: push eax
  '00512A22: mov fs:[00000000h], esp
  '00512A29: sub esp, 0000000Ch
  '00512A2C: push ebx
  '00512A2D: push esi
  '00512A2E: push edi
  '00512A2F: mov [ebp-0Ch], esp
  '00512A32: mov [ebp-08h], 004067D8h
  '00512A39: mov esi, [ebp+08h]
  '00512A3C: mov eax, esi
  '00512A3E: and eax, 00000001h
  '00512A41: mov [ebp-04h], eax
  '00512A44: and esi, FFFFFFFEh
  '00512A47: push esi
  '00512A48: mov [ebp+08h], esi
  '00512A4B: mov ecx, [esi]
  '00512A4D: call [ecx+04h]
  '00512A50: mov edx, [esi]
  '00512A52: push esi
  '00512A53: call [edx+000002B4h]
  '00512A59: test eax, eax
  '00512A5B: fclex 
  '00512A5D: jnl 512A71h
  '00512A5F: push 000002B4h
  '00512A64: push 004204F4h
  '00512A69: push esi
  '00512A6A: push eax
  '00512A6B: call [004010A0h]
  '00512A71: mov [ebp-04h], 00000000h
  '00512A78: mov eax, [ebp+08h]
  '00512A7B: push eax
  '00512A7C: mov ecx, [eax]
  '00512A7E: call [ecx+08h]
  '00512A81: mov eax, [ebp-04h]
  '00512A84: mov ecx, [ebp-14h]
  '00512A87: pop edi
  '00512A88: pop esi
  '00512A89: mov fs:[00000000h], ecx
  '00512A90: pop ebx
  '00512A91: mov esp, ebp
  '00512A93: pop ebp
  '00512A94: retn 0004h
End Sub
Private Sub clear_data__512360
  '00512360: push ebp
  '00512361: mov ebp, esp
  '00512363: sub esp, 0000000Ch
  '00512366: push 004081B6h
  '0051236B: mov eax, fs:[00h]
  '00512371: push eax
  '00512372: mov fs:[00000000h], esp
  '00512379: sub esp, 00000018h
  '0051237C: push ebx
  '0051237D: push esi
  '0051237E: push edi
  '0051237F: mov [ebp-0Ch], esp
  '00512382: mov [ebp-08h], 00406798h
  '00512389: mov esi, [ebp+08h]
  '0051238C: mov eax, esi
  '0051238E: and eax, 00000001h
  '00512391: mov [ebp-04h], eax
  '00512394: and esi, FFFFFFFEh
  '00512397: push esi
  '00512398: mov [ebp+08h], esi
  '0051239B: mov ecx, [esi]
  '0051239D: call [ecx+04h]
  '005123A0: mov edx, [esi]
  '005123A2: xor ebx, ebx
  '005123A4: push esi
  '005123A5: mov [ebp-18h], ebx
  '005123A8: mov [ebp-1Ch], ebx
  '005123AB: call [edx+000002FCh]
  '005123B1: push eax
  '005123B2: lea eax, [ebp-1Ch]
  '005123B5: push eax
  '005123B6: call [004010E4h]
  '005123BC: mov edi, eax
  '005123BE: push 0041BC60h
  '005123C3: push edi
  '005123C4: mov ecx, [edi]
  '005123C6: call [ecx+000000A4h]
  '005123CC: cmp eax, ebx
  '005123CE: fclex 
  '005123D0: jnl 5123E4h
  '005123D2: push 000000A4h
  '005123D7: push 0041E3FCh
  '005123DC: push edi
  '005123DD: push eax
  '005123DE: call [004010A0h]
  '005123E4: lea ecx, [ebp-1Ch]
  '005123E7: call [004013B8h]
  '005123ED: mov edx, 00429970h
  '005123F2: lea ecx, [ebp-18h]
  '005123F5: call [004012D8h]
  '005123FB: mov edx, [esi]
  '005123FD: lea eax, [ebp-18h]
  '00512400: push eax
  '00512401: push esi
  '00512402: call [edx+00000714h]
  '00512408: lea ecx, [ebp-18h]
  '0051240B: call [004013B4h]
  '00512411: mov [ebp-04h], ebx
  '00512414: push 0051242Fh
  '00512419: jmp 51242Eh
  '0051241B: lea ecx, [ebp-18h]
  '0051241E: call [004013B4h]
  '00512424: lea ecx, [ebp-1Ch]
  '00512427: call [004013B8h]
  '0051242D: ret 
End Sub
Private Sub save_data__512AA0
  '00512AA0: push ebp
  '00512AA1: mov ebp, esp
  '00512AA3: sub esp, 0000000Ch
  '00512AA6: push 004081B6h
  '00512AAB: mov eax, fs:[00h]
  '00512AB1: push eax
  '00512AB2: mov fs:[00000000h], esp
  '00512AB9: sub esp, 0000005Ch
  '00512ABC: push ebx
  '00512ABD: push esi
  '00512ABE: push edi
  '00512ABF: mov [ebp-0Ch], esp
  '00512AC2: mov [ebp-08h], 004067E0h
  '00512AC9: mov esi, [ebp+08h]
  '00512ACC: mov eax, esi
  '00512ACE: and eax, 00000001h
  '00512AD1: mov [ebp-04h], eax
  '00512AD4: and esi, FFFFFFFEh
  '00512AD7: push esi
  '00512AD8: mov [ebp+08h], esi
  '00512ADB: mov ecx, [esi]
  '00512ADD: call [ecx+04h]
  '00512AE0: mov edx, [esi]
  '00512AE2: xor ebx, ebx
  '00512AE4: push esi
  '00512AE5: mov [ebp-18h], ebx
  '00512AE8: mov [ebp-1Ch], ebx
  '00512AEB: mov [ebp-20h], ebx
  '00512AEE: mov [ebp-24h], ebx
  '00512AF1: mov [ebp-28h], ebx
  '00512AF4: mov [ebp-2Ch], ebx
  '00512AF7: mov [ebp-30h], ebx
  '00512AFA: mov [ebp-34h], ebx
  '00512AFD: mov [ebp-48h], ebx
  '00512B00: mov [ebp-4Ch], ebx
  '00512B03: mov [ebp-50h], ebx
  '00512B06: mov [ebp-54h], ebx
  '00512B09: mov [ebp-58h], ebx
  '00512B0C: mov [ebp-5Ch], ebx
  '00512B0F: call [edx+000002FCh]
  '00512B15: push eax
  '00512B16: lea eax, [ebp-34h]
  '00512B19: push eax
  '00512B1A: call [004010E4h]
  '00512B20: mov edi, eax
  '00512B22: lea edx, [ebp-20h]
  '00512B25: push edx
  '00512B26: push edi
  '00512B27: mov ecx, [edi]
  '00512B29: call [ecx+000000A0h]
  '00512B2F: cmp eax, ebx
  '00512B31: fclex 
  '00512B33: jnl 512B47h
  '00512B35: push 000000A0h
  '00512B3A: push 0041E3FCh
  '00512B3F: push edi
  '00512B40: push eax
  '00512B41: call [004010A0h]
  '00512B47: mov eax, [ebp-20h]
  '00512B4A: push eax
  '00512B4B: push 0041BC60h
  '00512B50: call [00401184h]
  '00512B56: mov edi, eax
  '00512B58: lea ecx, [ebp-20h]
  '00512B5B: neg edi
  '00512B5D: sbb edi, edi
  '00512B5F: neg edi
  '00512B61: neg edi
  '00512B63: call [004013B4h]
  '00512B69: lea ecx, [ebp-34h]
  '00512B6C: call [004013B8h]
  '00512B72: cmp di, bx
  '00512B75: jz 00512D29h
  '00512B7B: push 00409784h
  '00512B80: call [00401200h]
  '00512B86: lea ecx, [ebp-18h]
  '00512B89: push eax
  '00512B8A: push ecx
  '00512B8B: call [004010E4h]
  '00512B91: mov edx, [esi]
  '00512B93: lea eax, [ebp-50h]
  '00512B96: push eax
  '00512B97: push esi
  '00512B98: call [edx+58h]
  '00512B9B: cmp eax, ebx
  '00512B9D: fclex 
  '00512B9F: jnl 512BB0h
  '00512BA1: push 00000058h
  '00512BA3: push 004204F4h
  '00512BA8: push esi
  '00512BA9: push eax
  '00512BAA: call [004010A0h]
  '00512BB0: mov ecx, [ebp-50h]
  '00512BB3: mov edi, [004012D8h]
  '00512BB9: mov [ebp-58h], ecx
  '00512BBC: mov edx, 0041F400h
  '00512BC1: lea ecx, [ebp-30h]
  '00512BC4: mov [ebp-5Ch], ebx
  '00512BC7: call edi
  '00512BC9: mov edx, 00422BA4h
  '00512BCE: lea ecx, [ebp-2Ch]
  '00512BD1: call edi
  '00512BD3: xor edx, edx
  '00512BD5: lea ecx, [ebp-28h]
  '00512BD8: call edi
  '00512BDA: mov edx, 0041F3A8h
  '00512BDF: lea ecx, [ebp-24h]
  '00512BE2: mov [ebp-54h], 00000001h
  '00512BE9: call edi
  '00512BEB: xor edx, edx
  '00512BED: lea ecx, [ebp-20h]
  '00512BF0: mov [ebp-48h], FFFFFFFFh
  '00512BF7: call edi
  '00512BF9: lea ecx, [ebp-4Ch]
  '00512BFC: mov eax, [ebp-18h]
  '00512BFF: push ecx
  '00512C00: lea ecx, [ebp-5Ch]
  '00512C03: push ecx
  '00512C04: lea ecx, [ebp-58h]
  '00512C07: push ecx
  '00512C08: lea ecx, [ebp-30h]
  '00512C0B: push ecx
  '00512C0C: lea ecx, [ebp-2Ch]
  '00512C0F: push ecx
  '00512C10: lea ecx, [ebp-28h]
  '00512C13: push ecx
  '00512C14: lea ecx, [ebp-54h]
  '00512C17: push ecx
  '00512C18: lea ecx, [ebp-24h]
  '00512C1B: push ecx
  '00512C1C: mov edx, [eax]
  '00512C1E: lea ecx, [ebp-48h]
  '00512C21: push ecx
  '00512C22: lea ecx, [ebp-20h]
  '00512C25: push ecx
  '00512C26: lea ecx, [ebp-1Ch]
  '00512C29: push ecx
  '00512C2A: push eax
  '00512C2B: call [edx+28h]
  '00512C2E: cmp eax, ebx
  '00512C30: fclex 
  '00512C32: jnl 512C46h
  '00512C34: mov edx, [ebp-18h]
  '00512C37: push 00000028h
  '00512C39: push 0041D108h
  '00512C3E: push edx
  '00512C3F: push eax
  '00512C40: call [004010A0h]
  '00512C46: lea eax, [ebp-30h]
  '00512C49: lea ecx, [ebp-2Ch]
  '00512C4C: push eax
  '00512C4D: lea edx, [ebp-28h]
  '00512C50: push ecx
  '00512C51: lea eax, [ebp-24h]
  '00512C54: push edx
  '00512C55: lea ecx, [ebp-20h]
  '00512C58: push eax
  '00512C59: push ecx
  '00512C5A: push 00000005h
  '00512C5C: call [004012E8h]
  '00512C62: mov edx, [ebp-1Ch]
  '00512C65: add esp, 00000018h
  '00512C68: push edx
  '00512C69: push 0041BC60h
  '00512C6E: call [00401184h]
  '00512C74: test eax, eax
  '00512C76: jz 00512D4Dh
  '00512C7C: mov eax, [ebp-1Ch]
  '00512C7F: push eax
  '00512C80: push 00000001h
  '00512C82: push FFFFFFFFh
  '00512C84: push 00000002h
  '00512C86: call [004012A0h]
  '00512C8C: mov ecx, [esi]
  '00512C8E: push esi
  '00512C8F: call [ecx+000002FCh]
  '00512C95: lea edx, [ebp-34h]
  '00512C98: push eax
  '00512C99: push edx
  '00512C9A: call [004010E4h]
  '00512CA0: mov ecx, [eax]
  '00512CA2: lea edx, [ebp-20h]
  '00512CA5: push edx
  '00512CA6: push eax
  '00512CA7: mov [ebp-60h], eax
  '00512CAA: call [ecx+000000A0h]
  '00512CB0: cmp eax, ebx
  '00512CB2: fclex 
  '00512CB4: jnl 512CCBh
  '00512CB6: mov ecx, [ebp-60h]
  '00512CB9: push 000000A0h
  '00512CBE: push 0041E3FCh
  '00512CC3: push ecx
  '00512CC4: push eax
  '00512CC5: call [004010A0h]
  '00512CCB: mov edx, [ebp-20h]
  '00512CCE: push edx
  '00512CCF: push 00000001h
  '00512CD1: push 0041E878h
  '00512CD6: call [00401234h]
  '00512CDC: add esp, 0000000Ch
  '00512CDF: lea ecx, [ebp-20h]
  '00512CE2: call [004013B4h]
  '00512CE8: lea ecx, [ebp-34h]
  '00512CEB: call [004013B8h]
  '00512CF1: push 00000001h
  '00512CF3: call [00401168h]
  '00512CF9: push 0041D108h
  '00512CFE: push ebx
  '00512CFF: call [0040137Ch]
  '00512D05: push eax
  '00512D06: lea eax, [ebp-18h]
  '00512D09: push eax
  '00512D0A: call [004010E4h]
  '00512D10: mov edx, 004299BCh
  '00512D15: lea ecx, [ebp-20h]
  '00512D18: call edi
  '00512D1A: mov ecx, [esi]
  '00512D1C: lea edx, [ebp-20h]
  '00512D1F: push edx
  '00512D20: push esi
  '00512D21: call [ecx+00000714h]
  '00512D27: jmp 512D44h
  '00512D29: mov edx, 004299D8h
  '00512D2E: lea ecx, [ebp-20h]
  '00512D31: call [004012D8h]
  '00512D37: mov eax, [esi]
  '00512D39: lea ecx, [ebp-20h]
  '00512D3C: push ecx
  '00512D3D: push esi
  '00512D3E: call [eax+00000714h]
  '00512D44: lea ecx, [ebp-20h]
  '00512D47: call [004013B4h]
  '00512D4D: mov [ebp-04h], ebx
  '00512D50: push 00512D93h
  '00512D55: jmp 512D80h
  '00512D57: lea edx, [ebp-30h]
  '00512D5A: lea eax, [ebp-2Ch]
  '00512D5D: push edx
  '00512D5E: lea ecx, [ebp-28h]
  '00512D61: push eax
  '00512D62: lea edx, [ebp-24h]
  '00512D65: push ecx
  '00512D66: lea eax, [ebp-20h]
  '00512D69: push edx
  '00512D6A: push eax
  '00512D6B: push 00000005h
  '00512D6D: call [004012E8h]
  '00512D73: add esp, 00000018h
  '00512D76: lea ecx, [ebp-34h]
  '00512D79: call [004013B8h]
  '00512D7F: ret 
End Sub
Private Sub txtConsole__512DC0
  '00512DC0: push ebp
  '00512DC1: mov ebp, esp
  '00512DC3: sub esp, 0000000Ch
  '00512DC6: push 004081B6h
  '00512DCB: mov eax, fs:[00h]
  '00512DD1: push eax
  '00512DD2: mov fs:[00000000h], esp
  '00512DD9: sub esp, 00000024h
  '00512DDC: push ebx
  '00512DDD: push esi
  '00512DDE: push edi
  '00512DDF: mov [ebp-0Ch], esp
  '00512DE2: mov [ebp-08h], 004067F0h
  '00512DE9: mov esi, [ebp+08h]
  '00512DEC: mov eax, esi
  '00512DEE: and eax, 00000001h
  '00512DF1: mov [ebp-04h], eax
  '00512DF4: and esi, FFFFFFFEh
  '00512DF7: push esi
  '00512DF8: mov [ebp+08h], esi
  '00512DFB: mov ecx, [esi]
  '00512DFD: call [ecx+04h]
  '00512E00: mov edx, [esi]
  '00512E02: xor eax, eax
  '00512E04: push esi
  '00512E05: mov [ebp-18h], eax
  '00512E08: mov [ebp-1Ch], eax
  '00512E0B: mov [ebp-20h], eax
  '00512E0E: call [edx+000002FCh]
  '00512E14: mov ebx, [004010E4h]
  '00512E1A: push eax
  '00512E1B: lea eax, [ebp-20h]
  '00512E1E: push eax
  '00512E1F: call ebx
  '00512E21: mov ecx, [esi]
  '00512E23: push esi
  '00512E24: mov edi, eax
  '00512E26: call [ecx+000002FCh]
  '00512E2C: lea edx, [ebp-1Ch]
  '00512E2F: push eax
  '00512E30: push edx
  '00512E31: call ebx
  '00512E33: mov esi, eax
  '00512E35: lea ecx, [ebp-18h]
  '00512E38: push ecx
  '00512E39: push esi
  '00512E3A: mov eax, [esi]
  '00512E3C: call [eax+000000A0h]
  '00512E42: test eax, eax
  '00512E44: fclex 
  '00512E46: jnl 512E5Ah
  '00512E48: push 000000A0h
  '00512E4D: push 0041E3FCh
  '00512E52: push esi
  '00512E53: push eax
  '00512E54: call [004010A0h]
  '00512E5A: mov edx, [ebp-18h]
  '00512E5D: mov esi, [edi]
  '00512E5F: push edx
  '00512E60: call [00401044h]
  '00512E66: push eax
  '00512E67: push edi
  '00512E68: call [esi+00000114h]
  '00512E6E: test eax, eax
  '00512E70: fclex 
  '00512E72: jnl 512E86h
  '00512E74: push 00000114h
  '00512E79: push 0041E3FCh
  '00512E7E: push edi
  '00512E7F: push eax
  '00512E80: call [004010A0h]
  '00512E86: lea ecx, [ebp-18h]
  '00512E89: call [004013B4h]
  '00512E8F: lea eax, [ebp-20h]
  '00512E92: lea ecx, [ebp-1Ch]
  '00512E95: push eax
  '00512E96: push ecx
  '00512E97: push 00000002h
  '00512E99: call [00401064h]
  '00512E9F: add esp, 0000000Ch
  '00512EA2: mov [ebp-04h], 00000000h
  '00512EA9: push 00512ECEh
  '00512EAE: jmp 512ECDh
  '00512EB0: lea ecx, [ebp-18h]
  '00512EB3: call [004013B4h]
  '00512EB9: lea edx, [ebp-20h]
  '00512EBC: lea eax, [ebp-1Ch]
  '00512EBF: push edx
  '00512EC0: push eax
  '00512EC1: push 00000002h
  '00512EC3: call [00401064h]
  '00512EC9: add esp, 0000000Ch
  '00512ECC: ret 
End Sub

