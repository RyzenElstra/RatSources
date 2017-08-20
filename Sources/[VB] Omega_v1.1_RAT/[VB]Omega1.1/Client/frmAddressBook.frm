VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmAddressBook 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Address Book"
   ClientHeight    =   3990
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5895
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAddressBook.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3990
   ScaleWidth      =   5895
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtToken 
      Height          =   285
      Left            =   270
      TabIndex        =   12
      Top             =   4050
      Width           =   1515
   End
   Begin VB.CommandButton cmdModify 
      Caption         =   "Modify IP"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3590
      TabIndex        =   11
      ToolTipText     =   "Modify selected IP"
      Top             =   3540
      Width           =   1050
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   2805
      Left            =   120
      TabIndex        =   10
      Top             =   120
      Width           =   5700
      _ExtentX        =   10054
      _ExtentY        =   4948
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      AllowReorder    =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "IP"
         Object.Width           =   2646
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Port"
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Comments"
         Object.Width           =   4375
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Status"
         Object.Width           =   1235
      EndProperty
   End
   Begin VB.TextBox txtComments 
      Height          =   285
      Left            =   3810
      MaxLength       =   30
      TabIndex        =   9
      Top             =   3090
      Width           =   1965
   End
   Begin VB.TextBox txtIP 
      Height          =   285
      Left            =   360
      MaxLength       =   15
      TabIndex        =   7
      Top             =   3090
      Width           =   1365
   End
   Begin VB.TextBox txtPort 
      Height          =   285
      Left            =   2250
      MaxLength       =   5
      TabIndex        =   4
      Text            =   "54896"
      ToolTipText     =   "Port number"
      Top             =   3090
      Width           =   555
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4750
      TabIndex        =   3
      ToolTipText     =   "Close"
      Top             =   3540
      Width           =   1050
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Delete IP"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2430
      TabIndex        =   2
      ToolTipText     =   "Delete selected IP"
      Top             =   3540
      Width           =   1050
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add IP"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1280
      TabIndex        =   1
      ToolTipText     =   "Add specified IP"
      Top             =   3540
      Width           =   1050
   End
   Begin VB.CommandButton cmdConnect 
      Caption         =   "Connect"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   130
      TabIndex        =   0
      ToolTipText     =   "Connect to selected IP"
      Top             =   3540
      Width           =   1050
   End
   Begin VB.Label lblTemp 
      Height          =   315
      Left            =   1830
      TabIndex        =   13
      Top             =   4050
      Width           =   675
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Comments:"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   2940
      TabIndex        =   8
      Top             =   3150
      Width           =   1065
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Port:"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   1860
      TabIndex        =   6
      Top             =   3150
      Width           =   405
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "IP:"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   120
      TabIndex        =   5
      Top             =   3150
      Width           =   315
   End
End
Attribute VB_Name = "frmAddressBook"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private ListNo As Long
Private addrData(300) As String
Dim Profile As String
Dim iCount As Integer

'private sub Select
Public Sub cmdConnect_Click()
If ListNo <> -1 Then
   With ListView1.ListItems
     frmMain.cbIP.text = .Item(ListNo).text
     frmMain.txtPort.text = .Item(ListNo).SubItems(1)
   End With
   ListNo = -1
   Call frmMain.cmdConnect_Click
Else
   MsgBox "Please select one.", vbExclamation, "Address Book"
End If
End Sub

Private Sub cmdAdd_Click()
If ListView1.ListItems.Count < 100 Then
   If Trim(txtIP.text) <> "" And Trim(txtPort.text) <> "" Then
      Call AddData(Trim(txtIP.text), Trim(txtPort.text), Trim(txtComments.text))
      Call SaveData
   Else
      MsgBox "Please input IP address and port number.", vbExclamation, "Address Book"
   End If
Else
   MsgBox "Maximum 100 records.", vbExclamation, "Address Book"
   Exit Sub
End If
End Sub

Private Sub AddData(dIP As String, dPort As String, dComments As String)
  With ListView1.ListItems
  .Add.text = dIP
  .Item(ListView1.ListItems.Count).SubItems(1) = dPort
  .Item(ListView1.ListItems.Count).SubItems(2) = dComments
  .Item(ListView1.ListItems.Count).SubItems(3) = "Offline"
  End With
End Sub

Private Sub SaveData()
Dim i As Integer
Dim sData As String

sData = ""
For i = 1 To ListView1.ListItems.Count
  With ListView1.ListItems
       sData = sData & .Item(i).text & Delimiter & _
             .Item(i).SubItems(1) & Delimiter & _
             .Item(i).SubItems(2) & Delimiter
  End With
Next i

SaveProfile "Address Book", "IPs", sData, cPath & "Omega.ini"

End Sub

Private Sub LoadData()
Dim i As Integer
Dim j As Integer

ListView1.ListItems.Clear
Profile = "Address Book"
LoadProfile "Address Book", "IPs", cPath & "Omega.ini"

j = 0
For i = 1 To (iCount / 3)
    With ListView1.ListItems
    .Add.text = addrData(j)
    .Item(ListView1.ListItems.Count).SubItems(1) = addrData(j + 1)
    .Item(ListView1.ListItems.Count).SubItems(2) = addrData(j + 2)
    .Item(ListView1.ListItems.Count).SubItems(3) = "Offline"
    End With
    addrData(j) = ""
    addrData(j + 1) = ""
    addrData(j + 2) = ""
    j = j + 3
Next i
iCount = -1
End Sub

Public Sub cmdDelete_Click()
If ListNo <> -1 Then
   ListView1.ListItems.Remove ListNo
   ListNo = -1
   Call SaveData
Else
   MsgBox "Please select one.", vbExclamation, "Address Book"
End If
End Sub

Private Sub cmdModify_Click()
If ListNo <> -1 Then
   With ListView1.ListItems
   .Item(ListNo).text = Trim(txtIP.text)
   .Item(ListNo).SubItems(1) = Trim(txtPort.text)
   .Item(ListNo).SubItems(2) = Trim(txtComments.text)
   .Item(ListNo).SubItems(3) = "Offline"
   End With
   ListNo = -1
   Call SaveData
Else
   MsgBox "Please select one.", vbExclamation, "Address Book"
End If
End Sub

Private Sub cmdClose_Click()
Unload Me
End Sub

Public Sub PingSelectedIP()
Me.MousePointer = vbHourglass
With ListView1.ListItems
  .Item(ListNo).SubItems(3) = PingIp(.Item(ListNo).text)
End With
Me.MousePointer = vbDefault
End Sub

Public Sub PingAllIP()
Dim i As Integer

Me.MousePointer = vbHourglass
For i = 1 To ListView1.ListItems.Count
    With ListView1.ListItems
    .Item(i).SubItems(3) = PingIp(.Item(i).text)
    DoEvents
    End With
Next i
Me.MousePointer = vbDefault
End Sub

Private Sub txtPort_KeyPress(KeyAscii As Integer)
If KeyAscii = 8 Then
ElseIf KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Then
Else
   KeyAscii = 0
End If
End Sub

Private Sub Form_Load()
  ListNo = -1
  Call LoadData
End Sub

Private Sub ListView1_ItemClick(ByVal Item As MSComctlLib.ListItem)
ListNo = Item.Index
End Sub

Private Sub ListView1_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
If ListNo <> -1 Then
   'is right click
   If Button = 2 Then
      Me.PopupMenu frmPopupMenu.mnuAddrBook
   End If
End If
End Sub

Private Sub LoadProfile(AppName As String, KeyName As String, FileName As String)
 On Error GoTo errHandle
 Dim ret As Long
 Dim temp As String * 8192
 Dim lpAppName As String, lpKeyName As String, lpDefault As String, lpFileName As String
 
 lpAppName = AppName
 lpKeyName = KeyName
 lpDefault = FileName
 lpFileName = FileName
 
 ret = GetPrivateProfileString(lpAppName, lpKeyName, lpDefault, temp, Len(temp), lpFileName)
 If Not ret = 0 Then
 
    Select Case Profile
        
        Case "Address Book"
        lblTemp.Caption = Trim(temp)
        iCount = AddrBookSplit(lblTemp.Caption)
        
   End Select
   
 End If
 
Exit Sub
errHandle:
MsgBox Err.Description, vbExclamation, "Address Book"
End Sub

Function AddrBookSplit(DATA As String) As Integer
On Error Resume Next
Dim i As Integer, j As Integer, t As Integer
Dim s As String

j = 0 'set data count to zero
t = 1 'set start to zero

For i = 1 To Len(DATA)
    s = Mid$(DATA, i, 1)
    If s = Delimiter Then
       addrData(j) = Mid$(DATA, t, i - t)
       If Trim(addrData(j)) = "" Then
          addrData(j) = " "
       End If
       t = i + 1
       j = j + 1
    End If
Next i

AddrBookSplit = j - 1
End Function
