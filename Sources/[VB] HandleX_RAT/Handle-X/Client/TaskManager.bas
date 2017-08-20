Attribute VB_Name = "TaskManager"
Option Explicit
' Enum Represent the Differant Priority Levels Of The Processes
Private Enum PriorityLevels
   REALTIME_PRIORITY_CLASS = &H100
   HIGH_PRIORITY_CLASS = &H80
   ABOVE_NORMAL_PRIORITY_CLASS = &H8000
   NORMAL_PRIORITY_CLASS = &H20
   BELOW_NORMAL_PRIORITY_CLASS = &H4000
   IDLE_PRIORITY_CLASS = &H40
End Enum
'This Module Is Include The Code of the System-GUI Control Code
Public Sub Load_Task_Manager()
    On Error Resume Next
    Dim i As Integer 'General Counter
    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Initializing..."
    For i = 1 To Frm_Main.Task_Manager_Buttons.UBound
        Frm_Main.Task_Manager_Buttons(i).BorderStyle = 0
        Frm_Main.Task_Manager_Buttons(i).Picture = Frm_Main.TaskManagerImageList.ListImages(i).Picture
    Next i
    DoEvents
End Sub
Public Sub TaskManagerFunctions(Function_ID As Byte, Function_Data As String)
'File Browser Functions
'110xxxxx [B: 11000000 > 11011111][D: 192 > 223]
On Error Resume Next
Dim Done As String 'Done If True
Dim ObjName As String, FeedBack As String  'Error Handlling Variables
Done = Mid$(Function_Data, 1, 1) '[T] or [F]
Function_Data = Mid$(Function_Data, 2) 'Rest Of The Data
If Done = "F" Then
    ObjName = Mid$(Function_Data, 1, InStr(1, Function_Data, Separator_Char) - 1)
    FeedBack = Mid$(Function_Data, Len(ObjName) + 2)
End If
Dim i As Integer 'General Counter
    Select Case Function_ID
           Case 192 'LoadProcesses
                'Function_Data contains The Processes Information
                 If Done = "T" Then
                    Dim Items() As String, lenOfItem As Integer
                    Items = Split(Function_Data, vbCrLf) 'Split Into Items
                    Dim ProcName As String, PerVal As Byte, ID As Long, ParentID As Long, Threads As Long
                    Frm_Main.ProcView.ListItems.Clear
                    For i = 0 To UBound(Items) - 1
                       'Load Each Item Into The ProcView
                        lenOfItem = Len(Items(i))
                        Threads = Long_Representation(Mid$(Items(i), lenOfItem - 3))
                        ParentID = Long_Representation(Mid$(Items(i), lenOfItem - 7, 4))
                        ID = Long_Representation(Mid$(Items(i), lenOfItem - 11, 4))
                        PerVal = (Mid$(Items(i), lenOfItem - 12, 1))
                        ProcName = Mid$(Items(i), 1, lenOfItem - 13)
                        Frm_Main.ProcView.ListItems.Add , "P" & i, LCase$(ProcName)
                        Frm_Main.ProcView.ListItems("P" & i).SubItems(1) = PerVal
                        Frm_Main.ProcView.ListItems("P" & i).SubItems(2) = ID
                        Frm_Main.ProcView.ListItems("P" & i).SubItems(3) = Threads
                        Frm_Main.ProcView.ListItems("P" & i).Tag = ParentID
                    Next i
                 Else
                    MsgBox "Unable To Load Processes!" & vbCrLf & "Error Description:" & Function_Data
                 End If
                 Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>" & "Loadding Applications..."
                 Frm_Main.Send_Data (Chr$(193)) 'Load Processes Signal
           Case 193 'LoadTasks
                'Function_Data contains The Tasks Information
                 If Done = "T" Then
                    Dim Tasks() As String, lenOfTaskItem As Integer
                    Tasks = Split(Function_Data, vbCrLf) 'Split Into Items
                    Dim ProcHandle As Long, Handle As Long, State As Byte, TiTle As String
                    Frm_Main.TaskView.ListItems.Clear
                    For i = 0 To UBound(Tasks) - 1
                       'Load Each Item Into The ProcView
                        lenOfTaskItem = Len(Tasks(i))
                        ProcHandle = Long_Representation(Mid$(Tasks(i), lenOfTaskItem - 3))
                        Handle = Long_Representation(Mid$(Tasks(i), lenOfTaskItem - 7, 4))
                        State = (Mid$(Tasks(i), lenOfTaskItem - 8, 1))
                        TiTle = Mid$(Tasks(i), 1, lenOfTaskItem - 9)
                        Frm_Main.TaskView.ListItems.Add , "T" & i, TiTle
                        Frm_Main.TaskView.ListItems("T" & i).SubItems(1) = Handle
                        Frm_Main.TaskView.ListItems("T" & i).SubItems(2) = ProcHandle
                        If State = 1 Then
                            Frm_Main.TaskView.ListItems("T" & i).SubItems(3) = "Yes"
                        ElseIf State = 2 Then
                            Frm_Main.TaskView.ListItems("T" & i).SubItems(4) = "Yes"
                        ElseIf State = 3 Then
                            Frm_Main.TaskView.ListItems("T" & i).SubItems(3) = "Yes"
                            Frm_Main.TaskView.ListItems("T" & i).SubItems(4) = "Yes"
                        End If
                    Next i
                 Else
                    MsgBox "Unable To Load Processes!" & vbCrLf & "Error Description:" & Function_Data
                 End If
                 Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
           Case 194 'EndProcess
                 If Done = "F" Then
                    MsgBox "Endding Process: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                    If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Ending Process..." Then
                       Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                    End If
                 End If
           Case 195 'SusspendProcess
                 If Done = "F" Then
                    MsgBox "Susspendding Process: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                    If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Susspending Process..." Then
                       Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                    End If
                 End If
           Case 196 'SetPeriority
                 If Done = "F" Then
                    MsgBox "Modifiing Priority of Process: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                    If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Modifiing Priority..." Then
                       Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                    End If
                 End If
           Case 197 'Reserved
           Case 198 'Reservd
           
           Case 199 'Reserved
           
           Case 200 'New Task
                If Done = "F" Then
                    MsgBox "Shelling New Task: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack & vbCrLf & vbCrLf & _
                    "Hint: Check The Task Must Be an Executable File Or Internal Command.", vbInformation, AppName
                End If
                If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Shelling New Task ..." Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                End If
           Case 201 'Rename Task
                If Done = "F" Then
                    MsgBox "Renamming Task: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack & vbCrLf, vbInformation, AppName
                End If
                If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Renamming Task ..." Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                End If
           Case 202 'End Task
                 If Done = "F" Then
                    MsgBox "Endding Task: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                    If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Ending Task ..." Then
                       Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                    End If
                 End If
           Case 203 'Disable Task
                  If Done = "F" Then
                    MsgBox "Disableing Task: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                    If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Disableing Task ..." Then
                       Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                    End If
                 End If
           Case 204 'Enable Task
                 If Done = "F" Then
                    MsgBox "Enableing Task: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                    If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Enableing Task ..." Then
                       Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                    End If
                 End If
           Case 205 'Hide Task
                 If Done = "F" Then
                    MsgBox "Hidding Task: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                    If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Hidding Task ..." Then
                       Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                    End If
                 End If
           Case 206 'Show Task
                 If Done = "F" Then
                    MsgBox "Showing Task: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                    If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Showing Task ..." Then
                       Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                    End If
                 End If
           Case 207 'Make Task On Top
                 If Done = "F" Then
                    MsgBox "Making Task On Top: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                    If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Making Task On Top ..." Then
                       Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                    End If
                 End If
           Case 208 'Make Task Not On Top
                 If Done = "F" Then
                    MsgBox "Making Task Not On Top: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                    If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Making Task Not On Top ..." Then
                       Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                    End If
                 End If
           Case 209 'Maximize Task
                 If Done = "F" Then
                    MsgBox "Maximizing Task: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                    If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Maximizing Task ..." Then
                       Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                    End If
                 End If
           Case 210 'Minimze Task
                 If Done = "F" Then
                    MsgBox "Minimizing Task: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                    If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Minimizing Task ..." Then
                       Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                    End If
                 End If
           Case 211 'Restore Task
                 If Done = "F" Then
                    MsgBox "Restoring Task: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                    If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Restoring Task ..." Then
                       Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                    End If
                 End If
           Case 212 'Flash Window
                 If Done = "F" Then
                    MsgBox "Flashing Window: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                    If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Flashing Task ..." Then
                       Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                    End If
                 End If
           Case 213 'Send Keys
                 If Done = "T" Then
                    'MsgBox Function_Data, vbInformation, AppName
                 ElseIf Done = "F" Then
                    MsgBox "Sending Keys To Task: [" & ObjName & "] Is Failed" & vbCrLf & vbCrLf & _
                    "Error Discription: " & FeedBack, vbInformation, AppName
                 End If
                 If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Sending Keys ..." Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                 End If
           Case 214 'Reserved
           
           Case 215 'Reserved
           
           Case 216 'Reserved
           
           Case 217 'reserved
           
           Case 218 'Stop All processes
                 MsgBox Function_Data, vbInformation, AppName
                 If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Stop All Working Process ..." Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                 End If
           Case 219 'Disable Windows Task Manager
                 MsgBox Function_Data, vbInformation, AppName
                 If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Disableing Windows Task Manager ..." Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                 End If
           Case 220 'Enable Windows Task Manager
                 MsgBox Function_Data, vbInformation, AppName
                 If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Enableing Windows Task Manager ..." Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                 End If
           Case 221 'Disable System
                 MsgBox Function_Data, vbInformation, AppName
           Case 222 'Enable System
                 MsgBox Function_Data, vbInformation, AppName
                 If Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>UnFreezing Te Remoted System ..." Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                 End If
           Case 223 'Reserved
           
    End Select
End Sub
Public Sub TaskManagerButtons(Index As Integer)
    On Error Resume Next
    Dim i As Integer 'General counter
    Dim ItemIndex As Integer
   'Check If Selected Process
    If Index >= 5 And Index <= 9 Then
        ItemIndex = Frm_Main.ProcView.SelectedItem.Index
        If ItemIndex = 0 Then
            MsgBox "No Valid Selected Process!", vbExclamation, AppName
            Exit Sub
        End If
    ElseIf Index >= 11 And Index <= 23 Then
        ItemIndex = Frm_Main.TaskView.SelectedItem.Index
        If ItemIndex = 0 Then
            MsgBox "No Valid Selected Task!", vbExclamation, AppName
        End If
    End If
    Select Case Index
           Case 1 'ReLoad All (Processes and then Tasks)
                Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>" & "Loadding Processes..."
                If Frm_Main.Send_Data(Chr$(192)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>_"
                End If
           Case 2 'copy all to X-Editor
                Dim Str As String
               'Collect Processes Information
                If Frm_Main.ProcView.ListItems.Count > 0 Then
                    Str = Str & "-----------------------------------------------------<< Processes Report >>-----------------------------------------------------" & vbCrLf
                    For i = 1 To Frm_Main.ProcView.ListItems.Count
                        With Frm_Main.ProcView.ListItems(i)
                            Str = Str & "(" & i & ")" & vbCrLf
                            Str = Str & "ProcessName: " & .Text & vbCrLf
                            Str = Str & "ProcessID: " & .SubItems(2) & vbCrLf
                            Str = Str & "ParentID: " & .Tag & vbCrLf
                            Str = Str & "Priority: " & PriorityValToStr(.SubItems(1)) & vbCrLf
                            Str = Str & "No.Of Threads: " & .SubItems(3) & vbCrLf
                        End With
                    Next i
                    Str = Str & vbCrLf
                End If
               'Collect Tasks Information
                If Frm_Main.TaskView.ListItems.Count > 0 Then
                    Str = Str & "-------------------------------------------------------<< Tasks Report >>--------------------------------------------------------" & vbCrLf
                    For i = 1 To Frm_Main.TaskView.ListItems.Count
                        With Frm_Main.TaskView.ListItems(i)
                            Str = Str & "(" & i & ")" & vbCrLf
                            Str = Str & "Task Title: " & .Text & vbCrLf
                            Str = Str & "Handle: " & .SubItems(1) & vbCrLf
                            Str = Str & "Process Handle: " & .SubItems(2) & vbCrLf
                        End With
                    Next i
                End If
                If Len(Str) > 0 And Editor.SetString(Str, "Task Manager Report") = True Then
                    Editor.Show
                End If
           Case 3 'Reserved
                
           Case 4 'Stop All Tasks
                If MsgBox("Are you Sure to Stop All Working Processes At The Remoted System?", vbQuestion + vbYesNo, AppName) = vbYes Then
                    If Frm_Main.Send_Data(Chr$(218)) = True Then
                        Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Stop All Working Process..."
                    End If
                End If
           Case 5 'End Process
                If Frm_Main.Send_Data(Chr$(194) & Char_Representation(Frm_Main.ProcView.SelectedItem.SubItems(2))) = True Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Ending Process..."
                End If
           Case 6 'End Process Tree
                If Frm_Main.Send_Data(Chr$(195) & Char_Representation(Frm_Main.ProcView.SelectedItem.SubItems(2))) = True Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Susspending Process..."
                End If
           Case 7 'Set Priority
                'Inithialize The Priority Menu
                 SetPriorityMenuItems Char_Representation(Frm_Main.ProcView.SelectedItem.SubItems(2))
                 For i = 0 To Menus.PrVal.UBound
                    Menus.PrVal(i).Checked = False
                    Menus.PrVal(i).Enabled = True
                 Next i
                 Menus.PrVal(Frm_Main.ProcView.SelectedItem.SubItems(1)).Checked = True
                 Menus.PrVal(Frm_Main.ProcView.SelectedItem.SubItems(1)).Enabled = False
                 Frm_Main.PopupMenu Menus.TMPriority, , (Frm_Main.Task_Manager_Buttons(7).Left + Frm_Main.room(3).Left), (Frm_Main.Task_Manager_Buttons(7).Top + Frm_Main.Task_Manager_Buttons(7).Height + Frm_Main.room(3).Top + 10)
           Case 8 'Get Parent
                'Search For The Parent Process Of That Process (parentid in the tag feild
                 ItemIndex = GetParent(ItemIndex)
                 If ItemIndex >= 0 Then
                    MsgBox "Parent Title: " & Frm_Main.ProcView.ListItems(ItemIndex).Text & vbCrLf & _
                        "Parent ID: " & Frm_Main.ProcView.ListItems(ItemIndex).SubItems(2), vbInformation, AppName
                 Else
                    MsgBox "Unable To Find It's Parent !!!", vbInformation, AppName
                 End If
           Case 9 'Get Childs
                'Search For The Parent Process Of That Process (parentid in the tag feild
                 Dim ChildsStr As String
                 For i = 1 To Frm_Main.ProcView.ListItems.Count
                    If Frm_Main.ProcView.ListItems(i).Tag = Frm_Main.ProcView.ListItems(ItemIndex).SubItems(2) Then
                        ChildsStr = ChildsStr & "Parent Title: " & Frm_Main.ProcView.ListItems(i).Text & vbCrLf & _
                               "Parent ID: " & Frm_Main.ProcView.ListItems(i).SubItems(2) & vbCrLf & vbCrLf
                    End If
                 Next i
                 If Len(ChildsStr) > 0 Then
                    MsgBox Mid$(ChildsStr, 1, Len(ChildsStr) - 2), vbInformation, AppName
                 Else
                    MsgBox "Unable To Find A Childs To This Process", vbInformation, AppName
                 End If
           Case 10 'New Task ...
                 'Call The NewTask Manager
                  FileBrowser.New_Task
                  If Len(FileBrowser.FileName(6)) > 0 Then
                        If Frm_Main.Send_Data(Chr$(200) & Task_Manager_Shell_Value & FileBrowser.FileName(6)) = True Then
                            Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Shelling New Task ..."
                        End If
                  End If
           Case 11 'rename Task
                 'Accept The Name From The User
                  Dim OldName As String, NewName As String
                  OldName = Frm_Main.TaskView.SelectedItem.Text
                  NewName = InputBox("Enter The New Title...", "Renaming Task", OldName)
                  If OldName <> NewName And Len(NewName) > 0 Then
                    'Send The Rename Signal
                     If Frm_Main.Send_Data(Chr$(201) & OldName & Separator_Char & NewName) = True Then
                        Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Renamming Task ..."
                     End If
                  End If
           Case 12 'End Task
                If Frm_Main.Send_Data(Chr$(202) & Frm_Main.TaskView.SelectedItem.Text) = True Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Ending Task ..."
                End If
           Case 13 'Disable Window
                If Frm_Main.Send_Data(Chr$(203) & Frm_Main.TaskView.SelectedItem.Text) = True Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Disableing Task ..."
                End If
           Case 14 'Enable window
                If Frm_Main.Send_Data(Chr$(204) & Frm_Main.TaskView.SelectedItem.Text) = True Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Enableing Task ..."
                End If
           Case 15 'Hide Window
                If Frm_Main.Send_Data(Chr$(205) & Frm_Main.TaskView.SelectedItem.Text) = True Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Hidding Task ..."
                End If
           Case 16 'Show Window
                If Frm_Main.Send_Data(Chr$(206) & Frm_Main.TaskView.SelectedItem.Text) = True Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Showing Task ..."
                End If
           Case 17 'Make On Top
                If Frm_Main.Send_Data(Chr$(207) & Frm_Main.TaskView.SelectedItem.Text) = True Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Making Task On Top ..."
                End If
           Case 18 'Not On Top
                If Frm_Main.Send_Data(Chr$(208) & Frm_Main.TaskView.SelectedItem.Text) = True Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Making Task Not On Top ..."
                End If
           Case 19 'Maximize
                If Frm_Main.Send_Data(Chr$(209) & Frm_Main.TaskView.SelectedItem.Text) = True Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Maximizing Task ..."
                End If
           Case 20 'Minimize
                If Frm_Main.Send_Data(Chr$(210) & Frm_Main.TaskView.SelectedItem.Text) = True Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Minimizing Task ..."
                End If
           Case 21 'Restore
                If Frm_Main.Send_Data(Chr$(211) & Frm_Main.TaskView.SelectedItem.Text) = True Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Restoring Task ..."
                End If
           Case 22 'Flas Window
                If Frm_Main.Send_Data(Chr$(212) & Frm_Main.TaskView.SelectedItem.Text) = True Then
                    Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Flashing Task ..."
                End If
           Case 23 'Send Keys
                Dim Keys As String
                Keys = InputBox("Enter The Desired Keys To Send..." & vbCrLf & "Hint: View The Help Fore More Information About Sending Keys", "Sending Keys")
                If Len(Keys) > 0 Then
                    If Frm_Main.Send_Data(Chr$(213) & Frm_Main.TaskView.SelectedItem.Text & Separator_Char & Keys) = True Then
                        Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Sending Keys ..."
                    End If
                End If
                'MsgBox "Not Supported In This Version!", vbInformation, AppName
           Case 24 'Disable Task Manager
                If MsgBox("Are you Sure to Disable The Windows Task Manager of the remoted system??", vbQuestion + vbYesNo, AppName) = vbYes Then
                    If Frm_Main.Send_Data(Chr$(219)) = True Then
                        Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Disableing Windows Task Manager ..."
                    End If
                End If
           Case 25 'Enable Task Manager
                If MsgBox("Are you Sure to Enable The Windows Task Manager of the remoted system??", vbQuestion + vbYesNo, AppName) = vbYes Then
                    If Frm_Main.Send_Data(Chr$(220)) = True Then
                        Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Enableing Windows Task Manager ..."
                    End If
                End If
           Case 26 'Freez All
                If MsgBox("Are you Sure You Want To Freez The Remoted system??", vbQuestion + vbYesNo, AppName) = vbYes Then
                    If Frm_Main.Send_Data(Chr$(221)) = True Then
                        Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Freez Commend Has Been Sent To The Remoted System."
                    End If
                End If
           Case 27 'UnFreez All
                If MsgBox("Are you Sure You Want To UnFreez The Remoted system??", vbQuestion + vbYesNo, AppName) = vbYes Then
                    If Frm_Main.Send_Data(Chr$(222)) = True Then
                        Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>UnFreezing Te Remoted System ..."
                    End If
                End If
    End Select
    Exit Sub
Failed:
    MsgBox err.Description, vbCritical, AppName
End Sub
Public Sub GiveDetailsAbtTMProc()
    'Give The Process Details
     Dim Msg As String
     Dim ItemID As Integer
     With Frm_Main.ProcView
         ItemID = .SelectedItem.Index
        'Collect Information
         Msg = "Process Details :-" & vbCrLf
         Msg = Msg & "-----------------------" & vbCrLf & vbCrLf
         Msg = Msg & "Process Name : " & .ListItems(ItemID).Text & vbCrLf
         Msg = Msg & "Process Periority : " & PriorityValToStr(CByte(.ListItems(ItemID).SubItems(1))) & vbCrLf
         Msg = Msg & "Process ID : " & .ListItems(ItemID).SubItems(2) & vbCrLf
         Msg = Msg & "Number Of Threads : " & .ListItems(ItemID).SubItems(3) & vbCrLf & vbCrLf
         Msg = Msg & "Parent Process : " & Frm_Main.ProcView.ListItems(GetParent(ItemID)).Text & vbCrLf
         Msg = Msg & "Parent ID : " & Frm_Main.ProcView.ListItems(GetParent(ItemID)).SubItems(2)
     End With
    'Show Information
     Editor.SetString Msg, "Process details"
End Sub
Public Sub GiveDetailsAbtTMTask()
    'Give The Window Details
     Dim Msg As String
     Dim ItemID As Integer
     With Frm_Main.TaskView
         ItemID = .SelectedItem.Index
        'Collect Information
         Msg = "Window Details :-" & vbCrLf
         Msg = Msg & "---------------------" & vbCrLf & vbCrLf
         Msg = Msg & "Window Title : " & .ListItems(ItemID).Text & vbCrLf
         Msg = Msg & "Window Handle : " & .ListItems(ItemID).SubItems(1) & vbCrLf
         Msg = Msg & "Related Process ID : " & .ListItems(ItemID).SubItems(2) & vbCrLf
         Msg = Msg & "Is Window Hidden ? " & .ListItems(ItemID).SubItems(3) & vbCrLf
         Msg = Msg & "Is Window Disabled ? " & .ListItems(ItemID).SubItems(4) & vbCrLf
     End With
    'Show Information
     Editor.SetString Msg, "Window details"
End Sub
Private Function GetParent(ItemIndex As Integer) As Integer
'Retruns the index of the parent process
Dim i As Integer 'Generla Counter
For i = 1 To Frm_Main.ProcView.ListItems.Count
   If Frm_Main.ProcView.ListItems(ItemIndex).Tag = Frm_Main.ProcView.ListItems(i).SubItems(2) Then
    GetParent = i
    Exit Function
   End If
Next i
GetParent = -1 'Unable To Find The Parent
End Function
Private Function PriorityValToStr(PrVal As Byte) As String
    On Error Resume Next
    Select Case PrVal
           Case 0
                PriorityValToStr = "IDLE_PRIORITY_CLASS"
           Case 1
                PriorityValToStr = "BELOW_NORMAL_PRIORITY_CLASS"
           Case 2
                PriorityValToStr = "NORMAL_PRIORITY_CLASS"
           Case 3
                PriorityValToStr = "ABOVE_NORMAL_PRIORITY_CLASS"
           Case 4
                PriorityValToStr = "HIGH_PRIORITY_CLASS"
           Case 5
                PriorityValToStr = "REALTIME_PRIORITY_CLASS"
    End Select
End Function
Private Function PriorityStrToVal(PrStr As String) As Byte
    On Error Resume Next
    Select Case PrStr
           Case "IDLE_PRIORITY_CLASS"
                        PriorityStrToVal = 0
           Case "BELOW_NORMAL_PRIORITY_CLASS"
                        PriorityStrToVal = 1
           Case "NORMAL_PRIORITY_CLASS"
                        PriorityStrToVal = 2
           Case "ABOVE_NORMAL_PRIORITY_CLASS"
                        PriorityStrToVal = 3
           Case "HIGH_PRIORITY_CLASS"
                        PriorityStrToVal = 4
           Case "REALTIME_PRIORITY_CLASS"
                        PriorityStrToVal = 5
    End Select
End Function
Public Function SetPriorityMenuItems(Optional CharProcID As String, Optional Index As Integer)
    Static MyProcName As String
    If Len(CharProcID) > 0 Then
        MyProcName = CharProcID
    ElseIf Index >= 0 Then
      'Check Highest Priority 'Real Time
      If Index = 5 Then 'Real Time Priority
        If MsgBox("Warnning: This Priority Level May Cause The Remoted System To Hang!.So Are You Sure To Doing That??", vbQuestion + vbYesNo, AppName) = vbNo Then Exit Function
      End If
        'Send The Signal(Command)
         If Frm_Main.Send_Data(Chr$(196) & Index & MyProcName) = True Then
                Frm_Main.RoomTitle(3) = "\Handle-X\Task Manager :\>Modifiing Priority..."
         End If
    End If
End Function
