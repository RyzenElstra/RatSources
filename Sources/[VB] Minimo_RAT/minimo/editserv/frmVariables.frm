VERSION 5.00
Begin VB.Form frmVariables
  Caption = "MiniMo Global Variables"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  BorderStyle = 4 'Fixed ToolWindow
  'Icon = n/a
  LinkTopic = "Form1"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 45
  ClientTop = 285
  ClientWidth = 5535
  ClientHeight = 4005
  ShowInTaskbar = 0   'False
  StartUpPosition = 1 'CenterOwner
  Begin VB.TextBox txtVars
    Left = 0
    Top = 0
    Width = 5535
    Height = 3975
    Text = "%IP = IP Address\n%RP = IP Address with the ""."" replaced with a random character\n%UN = User name\n%NM = CGI name\n%VS = Visible Server ( returns True or False )\n%PP = Password Protected ( returns True or False )\n%CY = Country\n%NY = Country Code\n%CN = ComputerName\n%DT = Current Date and Time\n%PT = Server Port\n%PW = Server Password ( returns ""(none)"" if no pass )\n%AU = ICQ Number\n%FN = Server FileName\n%OS = Operating system\n%RT = How long the server has been running\n%SD = System Directory Path\n%WD = Windows Directory Path\n%CT = Connection type (LAN, Modem, Proxy)\n%VE = MiniMo Version\n%CP = CPU Speed\n%MC = Default Mail Clients\n%WP = Current URL in Explorer\n%IT = Server install date + time\n%IF = File that was run to infect the PC\n%MU = Available RAM\n%SP = The server's current path\n%WC = Webcam (True/False)\n%\SD\ = System Directory\n%\WD\ = Windows Directory\n%\CD\ = Cookies Directory\n%\DD\ = Desktop\n%\FD\ = Fonts Directory\n%\HD\ = History Directory\n%\ID\ = Temporary Internet Files\n%\MD\ = My Documents\n%\NN\ = Network Neighbourhood\n%\PG\ = Program Files\n%\RD\ = Recent Directory\n%\ST\ = Send To Directory\n%\SM\ = Start Menu\n%\SU\ = StartUp Directory\n%\TD\ = Templates Directory\n"
    TabIndex = 0
    MultiLine = -1  'True
    ScrollBars = 2
    BeginProperty Font
      Name = "Tahoma"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
End

Attribute VB_Name = "frmVariables"

Private Sub Form__49EDA0
  '0049EDA0: push ebp
  '0049EDA1: mov ebp, esp
  '0049EDA3: sub esp, 0000000Ch
  '0049EDA6: push 00403796h
  '0049EDAB: mov eax, fs:[00h]
  '0049EDB1: push eax
  '0049EDB2: mov fs:[00000000h], esp
  '0049EDB9: sub esp, 0000001Ch
  '0049EDBC: push ebx
  '0049EDBD: push esi
  '0049EDBE: push edi
  '0049EDBF: mov [ebp-0Ch], esp
  '0049EDC2: mov [ebp-08h], 00403778h
  '0049EDC9: mov esi, [ebp+08h]
  '0049EDCC: mov eax, esi
  '0049EDCE: and eax, 00000001h
  '0049EDD1: mov [ebp-04h], eax
  '0049EDD4: and esi, FFFFFFFEh
  '0049EDD7: push esi
  '0049EDD8: mov [ebp+08h], esi
  '0049EDDB: mov ecx, [esi]
  '0049EDDD: call [ecx+04h]
  '0049EDE0: mov edx, [esi]
  '0049EDE2: xor edi, edi
  '0049EDE4: push esi
  '0049EDE5: mov [ebp-18h], edi
  '0049EDE8: mov [ebp-1Ch], edi
  '0049EDEB: mov [ebp-20h], edi
  '0049EDEE: call [edx+000002FCh]
  '0049EDF4: push eax
  '0049EDF5: lea eax, [ebp-18h]
  '0049EDF8: push eax
  '0049EDF9: call [004010F0h]
  '0049EDFF: mov esi, eax
  '0049EE01: lea edx, [ebp-1Ch]
  '0049EE04: push edx
  '0049EE05: push esi
  '0049EE06: mov ecx, [esi]
  '0049EE08: call [ecx+00000180h]
  '0049EE0E: cmp eax, edi
  '0049EE10: fclex 
  '0049EE12: jnl 49EE26h
  '0049EE14: push 00000180h
  '0049EE19: push 00411B44h
  '0049EE1E: push esi
  '0049EE1F: push eax
  '0049EE20: call [004010A8h]
  '0049EE26: mov eax, [ebp-1Ch]
  '0049EE29: lea ecx, [ebp-20h]
  '0049EE2C: push ecx
  '0049EE2D: mov [ebp-20h], eax
  '0049EE30: call 00484740h
  '0049EE35: lea ecx, [ebp-18h]
  '0049EE38: call [00401388h]
  '0049EE3E: mov [ebp-04h], edi
  '0049EE41: push 0049EE53h
  '0049EE46: jmp 49EE52h
  '0049EE48: lea ecx, [ebp-18h]
  '0049EE4B: call [00401388h]
  '0049EE51: ret 
End Sub

