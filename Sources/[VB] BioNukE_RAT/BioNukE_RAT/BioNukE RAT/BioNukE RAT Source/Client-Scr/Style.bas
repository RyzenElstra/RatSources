Attribute VB_Name = "Style"
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

Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, lpKeyName As Any, ByVal lpDefault As String, ByVal lpRetunedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Public Sub StyleME()
    On Error Resume Next
    Dim BG As String
    Dim fc As String
    Dim TB As String
    Dim TF As String
    Dim FT As String
    Dim BT As String
    BG = GetStyle("color", "background")
    fc = GetStyle("color", "forecolor")
    TB = GetStyle("color", "textbackcolor")
    TF = GetStyle("color", "textforecolor")
    FT = GetStyle("color", "font")
    Call StableMenu

    
    With frmMain
        .BackColor = BG
        .StatusBar1.Font = FT
        .StatusBar1.Panels(3).Text = "Disconnected"
        .StatusBar1.Panels(4).Text = "Disconnected"
        .Slider.BackColor = BG
        For ii = 0 To .Frame.UBound
            .Frame(ii).BackColor = BG
        Next ii
        For ii = 0 To .List.UBound
            .List(ii).ForeColor = TF
            .List(ii).Font = FT
            .List(ii).BackColor = TB
        Next ii
        For ii = 0 To .Frame.UBound
            .Frame(ii).Left = 3600
        Next ii
        For ii = 0 To .Label.UBound
            .Label(ii).ForeColor = TF
            .Label(ii).Font = FT
            .Label(ii).BackStyle = 0
        Next ii
        For ii = 0 To .Text.UBound
            .Text(ii).ForeColor = TF
            .Text(ii).BackColor = TB
            .Text(ii).Font = FT
        Next ii
        For ii = 0 To .Combo.UBound
            .Combo(ii).ForeColor = TF
            .Combo(ii).BackColor = TB
            .Combo(ii).Font = FT
        Next ii
        For ii = 0 To .Check.UBound
            .Check(ii).ForeColor = fc
            .Check(ii).BackColor = BG
            .Check(ii).Font = FT
        Next ii
    End With
End Sub
Public Sub StableMenu()
    With frmMain.ListMenu.Nodes
        .Clear
        .Add , , "local", "Lokales", 1
            .Add "local", tvwChild, "l0", "About", 12
            .Add "local", tvwChild, "l1", "Logs", 12
            .Add "local", tvwChild, "l2", "Server Tracker", 12
            .Add "local", tvwChild, "l3", "EditServer", 12
            .Add "local", tvwChild, "l4", "Skins", 12
            
        .Add , , "msg", "Nachrichten", 5
            .Add "msg", tvwChild, "l5", "Chat", 10
                .Add "l5", tvwChild, "l37", "Client2Server", 12
                .Add "l5", tvwChild, "l38", "Client2Client", 12
            .Add "msg", tvwChild, "l6", "Sendkeys", 12
            .Add "msg", tvwChild, "l7", "Fragebox", 12
            .Add "msg", tvwChild, "l8", "Fake Msg.", 12
            
        .Add , , "spy", "Spy & Co", 4
            .Add "spy", tvwChild, "l9", "Favoriten", 12
            .Add "spy", tvwChild, "l10", "Freigaben", 12
            .Add "spy", tvwChild, "l11", "Benutzerkonten", 12
            .Add "spy", tvwChild, "l12", "Services", 12
            .Add "spy", tvwChild, "l13", "Screen", 11
                .Add "l13", tvwChild, "s51", "Screenshot", 12
                .Add "l13", tvwChild, "s52", "Screen-Capture", 12
            .Add "spy", tvwChild, "l14", "Mikrophon-Aufnahme", 12
            .Add "spy", tvwChild, "l15", "Computerinfos", 12
            
        .Add , , "adv", "Advanced", 8
            .Add "adv", tvwChild, "l16", "Freigabe", 12
            .Add "adv", tvwChild, "l17", "Benutzerkonten", 12
            .Add "adv", tvwChild, "l18", "Druck-Manager", 12
            .Add "adv", tvwChild, "l19", "Dateimanager", 12
            .Add "adv", tvwChild, "l20", "Registryeditor", 12
            .Add "adv", tvwChild, "l21", "Fenstermanager", 12
            .Add "adv", tvwChild, "l22", "Prozessmanager", 12
            .Add "adv", tvwChild, "l23", "Clipboard Manager", 12
            
        .Add , , "snt", "Sonstiges", 7
            .Add "snt", tvwChild, "l25", "TCP-Tunnel", 12
            .Add "snt", tvwChild, "l26", "Remote DOS", 12
            .Add "snt", tvwChild, "l27", "Monitor-Control", 12
            .Add "snt", tvwChild, "l28", "Redirect Download", 12
            .Add "snt", tvwChild, "l29", "Serverinfos", 12
            .Add "snt", tvwChild, "l30", "Server Optionen", 12
            .Add "snt", tvwChild, "l31", "Remote Shutdown", 12
            
        .Add , , "cod", "Coding", 6
            .Add "cod", tvwChild, "l32", "CMD", 12
            .Add "cod", tvwChild, "l33", "JavaScript", 12
            .Add "cod", tvwChild, "l34", "VBScript", 12
            
        .Add , , "mgn", "Fun-Manager", 9
            .Add "mgn", tvwChild, "l39", "Fun I", 12
            .Add "mgn", tvwChild, "l40", "Fun II", 12
            .Add "mgn", tvwChild, "l41", "Maus", 12
            .Add "mgn", tvwChild, "l42", "Tastatur", 12
            .Add "mgn", tvwChild, "l43", "Nuke", 12
            
        .Add , , "plg", "Plugins", 3
            .Add "plg", tvwChild, "l35", "Lokale Plugins", 12
            .Add "plg", tvwChild, "l36", "Remote Plugins", 12
    End With
    
    frmMain.Frame(0).ZOrder
End Sub
Public Function GetStyle(AppName$, KeyName$, Optional File$) As String
    Dim RetStr As String
    Dim TMpFile As String
    
    If File$ = "" Then TMpFile = App.Path & "\Skins\" & GetSetting("bionuke", "options", "style", "Standart.ini") Else TMpFile = File$
    If Dir(TMpFile) = "" Then TMpFile = App.Path & "\Skins\" & "Standart.ini"
    If Dir(TMpFile) = "" Then
        MsgBox "Keine Skin-Templates vorhanden!", vbInformation
        Unload frmMain
        Unload frmSIN
        End
    End If
    RetStr = String(255, Chr(0))
        GetStyle = Left(RetStr, GetPrivateProfileString(AppName$, ByVal KeyName$, "", RetStr, Len(RetStr), TMpFile))
End Function

