VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Begin VB.Form Whois 
   Appearance      =   0  'Flat
   BackColor       =   &H00404040&
   BorderStyle     =   0  'None
   Caption         =   " X-WhoIs V1.0"
   ClientHeight    =   5055
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7935
   Icon            =   "Whois.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5055
   ScaleWidth      =   7935
   StartUpPosition =   2  'CenterScreen
   Begin MSWinsockLib.Winsock Whois 
      Left            =   7140
      Top             =   1140
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.TextBox WhoisData 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   3915
      Index           =   2
      Left            =   60
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   8
      Top             =   1080
      Width           =   7815
   End
   Begin VB.TextBox WhoisData 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   260
      IMEMode         =   3  'DISABLE
      Index           =   1
      Left            =   1680
      TabIndex        =   7
      Top             =   720
      Width           =   5250
   End
   Begin VB.TextBox WhoisData 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   260
      IMEMode         =   3  'DISABLE
      Index           =   0
      Left            =   1680
      TabIndex        =   0
      Text            =   "206.117.161.84"
      Top             =   400
      Width           =   5250
   End
   Begin VB.Label Buttons 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00008000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "X-Editor"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Index           =   1
      Left            =   6960
      MouseIcon       =   "Whois.frx":0442
      MousePointer    =   99  'Custom
      TabIndex        =   10
      ToolTipText     =   "Copy The Comming Data To X-Editor"
      Top             =   720
      Width           =   915
   End
   Begin VB.Label Buttons 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00008000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Whois"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Index           =   0
      Left            =   6960
      MouseIcon       =   "Whois.frx":074C
      MousePointer    =   99  'Custom
      TabIndex        =   9
      ToolTipText     =   "Send Whois Quary to the spacified Host"
      Top             =   420
      Width           =   915
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " Host/IP :-"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   255
      Index           =   1
      Left            =   80
      TabIndex        =   6
      Top             =   720
      Width           =   1545
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   2
      X1              =   0
      X2              =   7920
      Y1              =   1030
      Y2              =   1030
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " Whois Server :-"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   260
      Index           =   0
      Left            =   80
      TabIndex        =   5
      Top             =   400
      Width           =   1540
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   1
      X1              =   0
      X2              =   7920
      Y1              =   5040
      Y2              =   5040
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   0
      X1              =   0
      X2              =   7920
      Y1              =   360
      Y2              =   360
   End
   Begin VB.Label TiTle 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   " X-WhoIs V1.0"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   60
      TabIndex        =   4
      Top             =   60
      Width           =   6840
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   7600
      MouseIcon       =   "Whois.frx":0A56
      MousePointer    =   99  'Custom
      TabIndex        =   3
      ToolTipText     =   "Exit X-Downloader V1.0"
      Top             =   60
      Width           =   255
   End
   Begin VB.Line Line2 
      BorderWidth     =   2
      Index           =   1
      X1              =   15
      X2              =   15
      Y1              =   0
      Y2              =   5040
   End
   Begin VB.Line Line2 
      BorderWidth     =   2
      Index           =   0
      X1              =   7920
      X2              =   7920
      Y1              =   0
      Y2              =   5040
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   8
      X1              =   6960
      X2              =   6960
      Y1              =   340
      Y2              =   0
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "?"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   2
      Left            =   7020
      MouseIcon       =   "Whois.frx":0D60
      MousePointer    =   99  'Custom
      TabIndex        =   2
      ToolTipText     =   "Help ?"
      Top             =   60
      Width           =   255
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "-"
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   13.5
         Charset         =   255
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   7320
      MouseIcon       =   "Whois.frx":106A
      MousePointer    =   99  'Custom
      TabIndex        =   1
      ToolTipText     =   "Minimize"
      Top             =   60
      Width           =   255
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      Index           =   11
      X1              =   0
      X2              =   7920
      Y1              =   15
      Y2              =   0
   End
End
Attribute VB_Name = "Whois"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'My Variables
Dim b As Integer, C As Integer, a As Boolean   'Variables Needed for the movinfg of the editor
Public Sub ExecuteWhois(IPAddress As String)
    Me.Show
    WhoisData(1) = IPAddress
    Call ProcessQuary
End Sub
Private Sub ProcessQuary()
    If Kernel.CheckIPAddress(WhoisData(1)) = False Then
        WhoisData(1) = Ping.GetIPFromHostName(WhoisData(1))
    End If
    Whois.Close
    WhoisData(2) = ""
    Whois.Connect WhoisData(0), 43 'Send Connect signal to the Whois host
End Sub
Private Sub Buttons_Click(Index As Integer)
    Select Case Index
           Case 0 'Whois Quary
                Call ProcessQuary
           Case 1 'Copy to x-editor
                If Len(Trim$(WhoisData(2))) > 0 Then
                    Editor.SetString WhoisData(2), "Whois Data of (" & WhoisData(1) & ")"
                End If
    End Select
End Sub
Private Sub Whois_Connect()
    'Connection Established
     'Check IP
        Dim Quary As String
        Quary = WhoisData(1) & vbCrLf
        If Whois.State = 7 Then 'connected
            Whois.SendData Quary
        Else
            MsgBox "Error Occured During connection to the Whois host, Try Again!.", vbExclamation, AppName
        End If
End Sub
Private Sub Whois_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim Data As String
   Whois.GetData Data, vbString
  'Parse The Comming Data
  'Get search string from user.
      Data = Replace(Data, Chr$(10), vbCrLf) 'Replace the Dos new lines by Windows New lines
      WhoisData(2) = WhoisData(2) & Data
      Exit Sub  'Notify user.
Whois.Close
End Sub
Private Sub Whois_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    Whois.Close
    MsgBox "Error #: " & Number & vbCrLf & "Description :" & Description, vbCritical, "Whois Error!"
End Sub
Private Sub Control_Box_Click(Index As Integer)
Select Case Index
    Case 0 'Hide
        Unload Me
    Case 1 'Minimize
        Me.WindowState = 1
    Case 2 'Help
        MsgBox "X-Whois V1.0 Can execute the net command [Whois] " & vbCrLf & _
               "The Whois data may includes the location,ISP,region," & vbCrLf & _
               "Country,server information and admin contact information." & vbCrLf & vbCrLf & _
               "Copy Rights Reserved To:" & vbCrLf & _
               "Author: Blackguy" & vbCrLf & _
               "Email Address: blackguy@hotmail.com", vbInformation, AppName
End Select
End Sub
Private Sub Image1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Image1.BorderStyle = 1
End Sub
Private Sub Image1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Image1.BorderStyle = 0
End Sub
Private Sub TiTle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Operate the drag and drop of the main form
  b = X
  C = Y
  a = True
End Sub
Private Sub TiTle_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'Operate the drag and drop of the main form
    On Error Resume Next
    If a Then
        Me.Move Left + (X - b), Top + (Y - C)
    End If
End Sub
Private Sub TiTle_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  'Operate the drag and drop of the main form
   a = False
End Sub
Private Sub Control_Box_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Control_Box(Index).ForeColor = vbBlack
    Control_Box(Index).BackColor = vbWhite
End Sub
Private Sub Control_Box_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Control_Box(Index).ForeColor = vbWhite
    Control_Box(Index).BackColor = vbBlack
End Sub
Private Sub WhoisData_KeyPress(Index As Integer, KeyAscii As Integer)
    'Check Enter Pressed
     If Index = 1 And KeyAscii = 13 Then
        ProcessQuary
     End If
End Sub
Private Sub Buttons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Buttons(Index).BackColor = &H5000&
End Sub
Private Sub Buttons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Buttons(Index).BackColor = &H8000&
End Sub
