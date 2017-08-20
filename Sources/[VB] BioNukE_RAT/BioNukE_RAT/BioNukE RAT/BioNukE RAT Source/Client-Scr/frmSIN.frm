VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmSIN 
   BorderStyle     =   4  'Festes Werkzeugfenster
   Caption         =   "Verfügbare Server"
   ClientHeight    =   3945
   ClientLeft      =   9165
   ClientTop       =   690
   ClientWidth     =   7470
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3945
   ScaleWidth      =   7470
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text 
      Appearance      =   0  '2D
      Height          =   285
      Index           =   0
      Left            =   600
      TabIndex        =   3
      Text            =   "12121"
      Top             =   3360
      Width           =   1215
   End
   Begin CLIENT.ChameleonButton Button 
      Height          =   375
      Index           =   0
      Left            =   5640
      TabIndex        =   1
      Top             =   3360
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   661
      BTYPE           =   3
      TX              =   "Login"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "frmSIN.frx":0000
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   3240
      Top             =   1680
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   1
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmSIN.frx":001C
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin CLIENT.ChameleonButton Button 
      Height          =   375
      Index           =   1
      Left            =   1920
      TabIndex        =   4
      Top             =   3360
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      BTYPE           =   3
      TX              =   "Starten"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "frmSIN.frx":01FB
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin CLIENT.ChameleonButton Button 
      Height          =   375
      Index           =   2
      Left            =   4080
      TabIndex        =   5
      Top             =   3360
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      BTYPE           =   3
      TX              =   "Ausblenden"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "frmSIN.frx":0217
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin MSComctlLib.ListView ListSvr 
      Height          =   3135
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7455
      _ExtentX        =   13150
      _ExtentY        =   5530
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      Icons           =   "ImageList1"
      SmallIcons      =   "ImageList1"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "IP-Adresse"
         Object.Width           =   3422
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Computername"
         Object.Width           =   3052
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Servername"
         Object.Width           =   3263
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Windows"
         Object.Width           =   3246
      EndProperty
   End
   Begin VB.Label Label 
      BackStyle       =   0  'Transparent
      Caption         =   "Port:"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   2
      Top             =   3360
      Width           =   2175
   End
End
Attribute VB_Name = "frmSIN"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Sub AddIP(ByVal tIP As String, ByVal tPC As String, ByVal tServer As String, ByVal tWindows As String, ByVal tKey As String)
        On Error Resume Next
        Dim lItem As ListItem
        Set lItem = ListSvr.ListItems.Add(, tKey, tIP, , 1)
        lItem.ListSubItems.Add , , tPC
        lItem.ListSubItems.Add , , tServer
        lItem.ListSubItems.Add , , tWindows
        Status "Server """ & tServer & """ (" & tIP & ") ist online!!"
End Sub

Public Sub DelIP(ByVal tKey As String)
    On Error Resume Next
    If Mid(tKey, 2) = Server.Index Then
            SetDisconnected
    End If
    For ii = 1 To ListSvr.ListItems.Count
        If ListSvr.ListItems(ii).Key = tKey Then
            Status "Server """ & ListSvr.ListItems(ii).SubItems(2) & """ (" & ListSvr.ListItems(ii).Text & ")  ging offline"
            ListSvr.ListItems.Remove ii
        End If
    Next ii
    
End Sub



Private Sub Button_Click(Index As Integer)
    On Error Resume Next
    Select Case Index
        Case 0
            If Button(0).Caption = "Login" Then
                Login
            Else
                Status "Logout...", "Wait"
                Senden Server.Index, CMD_LOGIN & "0"
            End If
        Case 1
            frmMain.wsk(0).LocalPort = Text(0)
            frmMain.wsk(0).Listen
            Button(1).Enabled = False
        Case 2
            Me.Hide
    End Select
End Sub

Sub Login()
    On Error Resume Next
                If ListSvr.SelectedItem.Index = 0 Then
                    MsgBox "Es wurde kein aktiver Server ausgewählt.", vbInformation
                Else
                    Dim tPass As String
                    tPass = InputBox("Passwort für Server """ & ListSvr.SelectedItem.SubItems(2) & """ (" & ListSvr.SelectedItem.Text & "):", , "default")
                    If tPass = "" Then Exit Sub
                    Server.Connected = False
                    Server.Index = Mid(ListSvr.SelectedItem.Key, 2)
                    Server.RemIP = ListSvr.SelectedItem.Text
                    Server.Servername = ListSvr.SelectedItem.SubItems(2)
                    Senden Mid(ListSvr.SelectedItem.Key, 2), CMD_LOGIN & tPass
                    Status "Versuche Authentifizierung...", "Log in"
                End If
End Sub
Private Sub ListSvr_DblClick()
    Login
End Sub
