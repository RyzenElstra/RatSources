Attribute VB_Name = "Module2"
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" _
(ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long

'Listview Extension (Sub Class) Constants.
Global Const LVS_EX_FULLROWSELECT = &H20
Global Const LVM_FIRST = &H1000
Global Const LVM_GETEXTENDEDLISTVIEWSTYLE = LVM_FIRST + &H37
Global Const LVM_SETEXTENDEDLISTVIEWSTYLE = LVM_FIRST + &H36

Public Enum tColumnType
   gcnNumber = 0
   gcnText = 1
   gcnDateTime = 2
End Enum

Public Function Improve_Listview(objListBox As Object) As Boolean



On Error GoTo Improve_Listview_Error

Dim lStyle As Long
     
     lStyle = SendMessage(objListBox.hwnd, _
     LVM_GETEXTENDEDLISTVIEWSTYLE, 0, 0)
     lStyle = LVS_EX_FULLROWSELECT
     Call SendMessage(objListBox.hwnd, LVM_SETEXTENDEDLISTVIEWSTYLE, _
      0, ByVal lStyle)

Improve_Listview_Exit:
    Improve_Listview = True
    Exit Function

Improve_Listview_Error:
     Improve_Listview = False
     Exit Function

End Function

Public Sub msSortListview(lsv As ListView, lncol As Integer, lnType As tColumnType)
Dim li As ListItem
   If lnType <> gcnText Then
      For Each li In lsv.ListItems
         If lncol > 1 Then
            li.Tag = li.SubItems(lncol - 1)
         Else
            li.Tag = li.Text
         End If
      Next
      For Each li In lsv.ListItems
         Select Case lnType
            Case gcnNumber
               If lncol > 1 Then
                  li.SubItems(lncol - 1) = Format(Val(li.SubItems(lncol - 1)), "0000000000.00000")
               Else
                  li.Text = Format(Val(li.Text), "0000000000.00000")
               End If
            Case gcnDateTime
               If lncol > 1 Then
                  li.SubItems(lncol - 1) = Format(CVDate(li.SubItems(lncol - 1)), "yyyy/mm/dd hh:mm:ss")
               Else
                  li.Text = Format(CVDate(li.Text), "yyyy/mm/dd hh:mm:ss")
               End If
            Case gcnText
         End Select
      Next
   End If
   If lsv.SortKey = lncol - 1 Then
      lsv.SortOrder = IIf(lsv.SortOrder = lvwAscending, lvwDescending, lvwAscending)
   Else
      lsv.SortOrder = lvwAscending
      lsv.SortKey = lncol - 1
   End If
   lsv.Sorted = True
   If lnType <> gcnText Then
      For Each li In lsv.ListItems
         If lncol > 1 Then
            li.SubItems(lncol - 1) = li.Tag
         Else
            li.Text = li.Tag
         End If
         li.Tag = ""
      Next
   End If
End Sub







