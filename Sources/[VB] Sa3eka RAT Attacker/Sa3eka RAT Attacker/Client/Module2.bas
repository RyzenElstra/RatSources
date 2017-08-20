Attribute VB_Name = "Module1"
Dim i As Integer
Public Function f() As Integer
sent = 0
For i = 1 To Form1.ListView1.ListItems.Count
Form1.Text1.text = Form1.ListView1.ListItems.Item(i).Selected
f = Form1.Text1.text
DoEvents
Next i
End Function
