VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00808000&
   BorderStyle     =   0  'None
   ClientHeight    =   90
   ClientLeft      =   -15
   ClientTop       =   -15
   ClientWidth     =   90
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   ScaleHeight     =   90
   ScaleWidth      =   90
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.TextBox Text2 
      Height          =   288
      Left            =   1200
      TabIndex        =   2
      Top             =   360
      Visible         =   0   'False
      Width           =   2412
   End
   Begin VB.TextBox Text1 
      Height          =   288
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Visible         =   0   'False
      Width           =   972
   End
   Begin VB.CommandButton Command1 
      Caption         =   "GetUserData"
      Height          =   252
      Left            =   1800
      TabIndex        =   0
      Top             =   840
      Visible         =   0   'False
      Width           =   1812
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long

Const LB_ADDSTRING = &H180
Const WM_SETREDRAW = &HB

Private WithEvents icq As cICQ
Attribute icq.VB_VarHelpID = -1
Dim cdl As Cmdlg

Dim iVersion As Long

Private Sub Command1_Click()
On Error GoTo z
  If Len(Text1.Text) = 0 Then
DerSpaeher.Dialog "I could not find an IP-adress", "OK"
    Exit Sub
  End If

  Dim ret As Long, email$, nick$
  Dim bs As BSICQAPI_User
  Dim IP As String
  bs.m_iUIN = Val(Text1.Text)
  If Not Compiled Then On Error Resume Next
  ret = GetFullUserData(bs, iVersion)
  IP = Hex(bs.m_iIP)
  Text2.Text = CDec("&h" & Right$(IP, 2)) & "." & CDec("&h" & Mid$(IP, 5, 2)) & "." & CDec("&h" & Mid$(IP, 3, 2)) & "." & CDec("&h" & left$(IP, 2))
  Exit Sub
z:
  Unload Form1
  DerSpaeher.Dialog "Shit, there was an error!", "OK"
End Sub
Sub IPAuslesen2()
On Error GoTo z


  Dim ret As Long, email$, nick$
  Dim bs As BSICQAPI_User
  Dim IP As String
  bs.m_iUIN = Val(Text1.Text)
  If Not Compiled Then On Error Resume Next
  ret = GetFullUserData(bs, iVersion)
  IP = Hex(bs.m_iIP)
  Text2.Text = CDec("&h" & Right$(IP, 2)) & "." & CDec("&h" & Mid$(IP, 5, 2)) & "." & CDec("&h" & Mid$(IP, 3, 2)) & "." & CDec("&h" & left$(IP, 2))
  Exit Sub
z:
  Unload Form1
End Sub

Private Function sc(b() As Byte) As String
  sc = TrimNull(StrConv(b, vbUnicode))
End Function

Private Function TrimNull(s As String) As String
  Dim iWhere%
  iWhere = InStr(1, s, Chr(0))
  
  If iWhere > 0 Then
    TrimNull = left$(s, iWhere - 1)
  Else
    TrimNull = s
    Debug.Print s & " " & "no null present"
  End If
End Function



Private Sub form_load()
  Set cdl = New Cmdlg
  Set icq = New cICQ
  iVersion = icq.VersionNum
  Debug.Print iVersion & "<-iversion"
End Sub

Private Sub String2Byte(s As String, b() As Byte)

    Dim i As Long

    For i = 1 To Len(s)
        b(i - 1) = Asc(Mid$(s, i, 1))
    Next i
End Sub


Private Sub Form_Unload(Cancel As Integer)

 Set icq = Nothing
 Set cdl = Nothing
End Sub

Private Function AllNumeric(s As String) As Boolean
  If Len(s) = 0 Then Exit Function
  
  Dim i&, bFound As Boolean
  For i = 1 To Len(s)
    If Asc(Mid$(s, i, 1)) > 57 Or Asc(Mid$(s, i, 1)) < 48 Then
      bFound = True
      Exit For
    End If
  Next i
  
  If bFound = True Then
    AllNumeric = False
  Else
    AllNumeric = True
  End If
End Function
