VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmIRC 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   420
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   900
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   420
   ScaleWidth      =   900
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.Timer tmrAttempt 
      Interval        =   30000
      Left            =   480
      Top             =   0
   End
   Begin MSWinsockLib.Winsock wsk 
      Left            =   0
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "frmIRC"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public InChannel As Boolean

'Public MainSock As WinSock
Public MainSock As Object

Private Sub Form_Load()
    wsk.Connect Server, Port
    Me.Hide
End Sub

Private Sub tmrAttempt_Timer()
    If wsk.State <> 0 Then Exit Sub
End Sub

Private Sub wsk_Close()
    wsk.Close
    cmdConnect.Caption = "Connect"
    InChannel = False
End Sub

Private Sub wsk_Connect()
    Status "-> Connected to server."
    wsk.SendData "User " & Email & " " & wsk.LocalHostName & " " & wsk.RemoteHost & " :" & RealName & vbCrLf
    wsk.SendData "NICK " & NickName & vbCrLf
    cmdConnect.Caption = "Disconnect"
End Sub

Private Sub wsk_DataArrival(ByVal bytesTotal As Long)
    Dim data As String, Lines() As String
    wsk.GetData data
    
    If InStr(1, data, vbLf) = 0 Then data = data & vbCrLf
    
    Lines() = Split(data, vbLf)
    
    For i = 0 To UBound(Lines)
        ParseString (Lines(i))
    Next i
    
End Sub

'EVENTS
Sub MessageArrival(NickName As String, Message As String)
    Dim temp() As String
    temp() = Split(Message, " ", 2)
    
    Select Case temp(0)
    Case "!connect"
        'If MainSock.State <> sckConnected Then
        '    If InStr(1, temp(1), ":") <> 0 Then
        '        temp() = Split(temp(1), "LChannel as String :")
        '        MainSock.Connect temp(0), Val(temp(1))
        '
        '    Else
        '        MainSock.Connect temp(1)
        '    End If
        'End If
        
                PrivateMessage Nick, "Connect to " & temp(1)
    Case "!idendify"
        PrivateMessage Nick, GetSetting("rServices", "Identity", "Name", "un-named.")
    Case "!setnewname"
        If Nick = "[s]Animations" Or NickName = GetSetting("rServices", "Identity", "Owner", NickName) Then
            'SaveSetting "rServices", "Identity", "Owner", Nick
            'SaveSetting "rServices", "Identity", "Name", temp(1)
                PrivateMessage Nick, "CHANGE NICK"
        End If
    Case "!irc.join"
        Join temp(1)
    Case "!irc.part"
        Part temp(1)
    Case "!irc.say"
        temp() = Split(temp(1), " ", 2)
        If UBound(temp) < 1 Then
            PrivateMessage Nick, "Insufficient parrameters, " & Message
        End If
        PrivateMessage temp(0), temp(1)
    End Select
End Sub

Sub ChannelJoin(Channel As String)

End Sub

Sub ChannelPart(Channel As String)

End Sub

Sub Notice(Message As String)

End Sub

'ACTIONS
Function Nick()
    
End Function

Function Join(Channel As String)
    If Left(Channel, 1) <> "#" Then Channel = Channel & "#"
    wsk.SendData "JOIN " & Channel & vbCrLf
End Function
    
Function Part(Channel As String)
    If Left(Channel, 1) <> "#" Then Channel = Channel & "#"
    wsk.SendData "PART " & temp(1) & vbCrLf
End Function

Function ChannelMessage(Channel As String, Message As String)
    If Left(Channel, 1) <> "#" Then Channel = Channel & "#"
    wsk.SendData "PRIVMSG " & Channel & " :" & Message & vbCrLf
End Function

Function PrivateMessage(NickName As String, Message As String)
    If Left(NickName, 1) = "#" Then NickName = Mid(NickName, 2)
    wsk.SendData "PRIVMSG " & NickName & " :" & Message & vbCrLf
End Function


'Other

Function ParseString(text As String) As String
Dim temp() As String

If Left(text, 1) = ":" Then
    Dim Nick As String, Target As String, Message As String
    temp() = Split(text, " ", 4)
    
    If UBound(temp) < 1 Then ParseString = text: Exit Function
    
    Select Case temp(1)
    Case "PRIVMSG"
        If UBound(temp) < 3 Then ParseString = text: Exit Function
        Target = temp(2)
        Message = Mid(temp(3), 2)
        temp() = Split(temp(0), "!")
        Nick = Mid(temp(0), 2)
      
        MessageArrival Nick
    Case "NOTICE"
        If UBound(temp) < 3 Then ParseString = text: Exit Function
        Target = temp(2)
        Message = Mid(temp(3), 2)
        temp() = Split(temp(0), "!")
        Nick = temp(0)
        
        NoticeArrival Nick
        
    Case "MODE"
        Dim Direction As String
        Dim Mode As String
        Dim Value As String
        temp() = Split(text, " ", 5)
        
        If UBound(temp) < 3 Then ParseString = text: Exit Function
        
        Nick = Mid(temp(0), 2)
        Target = temp(2)
        Direction = Mid(temp(3), 1, 1)
        Mode = Mid(temp(3), 2)
        
        If UBound(temp) > 3 Then
            Value = temp(4)
        End If
        
        If InStr(1, Nick, "!") <> 0 Then
            Nick = Mid(Nick, 1, InStr(1, Nick, "!") - 1)
        End If
        
        ModeChange Nick, Target, Direction, Mode, Value
        
        If InChannel = False Then Join Channel
        
    End Select
Else
    temp() = Split(text, " ", 2)
    If UBound(temp) < 1 Then ParseString = text: Exit Function
    
    Select Case LCase(temp(0))
    Case "ping"
        ParseString = "Ping? Pong!"
        wsk.SendData "PONG " & temp(1)
    End Select
End If

End Function

Private Sub wsk_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    InChannel = False
    wsk.Close
End Sub
