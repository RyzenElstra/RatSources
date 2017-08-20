VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmIPTool 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "IP Tool"
   ClientHeight    =   4005
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4995
   Icon            =   "frmIPTool.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4005
   ScaleWidth      =   4995
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.ListView ListView1 
      Height          =   2355
      Left            =   120
      TabIndex        =   9
      Top             =   1530
      Width           =   4755
      _ExtentX        =   8387
      _ExtentY        =   4154
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
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "IP"
         Object.Width           =   2646
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Host Name"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Status"
         Object.Width           =   1764
      EndProperty
   End
   Begin VB.CommandButton cmdPing 
      Caption         =   "Ping"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   3990
      Style           =   1  'Graphical
      TabIndex        =   8
      ToolTipText     =   "Ping IP address"
      Top             =   570
      Width           =   900
   End
   Begin VB.CommandButton cmdReverse 
      Caption         =   "Reverse"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   3030
      Style           =   1  'Graphical
      TabIndex        =   6
      ToolTipText     =   "Reverse IP address"
      Top             =   570
      Width           =   900
   End
   Begin VB.CommandButton cmdResolve 
      Caption         =   "Resolve Host Name"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   3030
      Style           =   1  'Graphical
      TabIndex        =   5
      ToolTipText     =   "Resolve host name"
      Top             =   150
      Width           =   1875
   End
   Begin VB.TextBox txtHostName 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   960
      TabIndex        =   2
      Top             =   150
      Width           =   2000
   End
   Begin VB.TextBox txtIP 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   960
      TabIndex        =   1
      Top             =   570
      Width           =   2000
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   3990
      Style           =   1  'Graphical
      TabIndex        =   0
      ToolTipText     =   "Clear list"
      Top             =   1020
      Width           =   900
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Status:"
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
      Height          =   195
      Index           =   2
      Left            =   120
      TabIndex        =   7
      Top             =   1200
      Width           =   525
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "IP:"
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
      Height          =   195
      Index           =   1
      Left            =   720
      TabIndex        =   4
      Top             =   600
      Width           =   210
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Host Name:"
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
      Height          =   195
      Index           =   0
      Left            =   90
      TabIndex        =   3
      Top             =   180
      Width           =   840
   End
End
Attribute VB_Name = "frmIPTool"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdResolve_Click()
txtHostName.text = Trim(txtHostName.text)
With ListView1.ListItems
  .Add.text = AddrToIP(txtHostName.text)
  .Item(ListView1.ListItems.Count).SubItems(1) = txtHostName.text
  .Item(ListView1.ListItems.Count).SubItems(2) = "Unknown"
End With
End Sub

Private Sub cmdReverse_Click()
txtIP.text = Trim(txtIP.text)
With ListView1.ListItems
  .Add.text = txtIP.text
  .Item(ListView1.ListItems.Count).SubItems(1) = IpToAddr(txtIP.text)
  .Item(ListView1.ListItems.Count).SubItems(2) = "Unknown"
End With
End Sub

Private Sub cmdPing_Click()
Me.MousePointer = vbHourglass

txtIP.text = Trim(txtIP.text)
With ListView1.ListItems
  .Add.text = txtIP.text
  .Item(ListView1.ListItems.Count).SubItems(1) = "Unknown"
  .Item(ListView1.ListItems.Count).SubItems(2) = PingIp(txtIP.text)
End With

Me.MousePointer = vbDefault
End Sub

Private Sub cmdClear_Click()
    ListView1.ListItems.Clear
End Sub

Private Sub Form_Load()
    ListView1.ListItems.Clear
    Call StartWinsock("")
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
     Unload Me
End Sub
