Attribute VB_Name = "SystemManager"
Public IsFileRegistryLoaded As Boolean
Public Function Load_Registry_Manager()
    On Error Resume Next
    Dim i As Integer 'General Counter
    Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>Initializing..."
    For i = 0 To Frm_Main.Reg_Manager_Buttons.UBound
        Frm_Main.Reg_Manager_Buttons(i).BorderStyle = 0
        Frm_Main.Reg_Manager_Buttons(i).Picture = Frm_Main.RegImageList.ListImages(i + 1).Picture
    Next i
    DoEvents
    Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>_"
End Function
Public Sub SystemControlButtons(Index As Integer)
    On Error Resume Next
    Dim i As Integer 'General counter
    Select Case Index
           Case 0 'Shut Down
                Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Shuting Down ..."
                If Frm_Main.Send_Data(Chr$(160)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
           Case 1 'Reboot
                Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Rebooting ..."
                If Frm_Main.Send_Data(Chr$(161)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
           Case 2 'Log Off
                Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Logging Off ..."
                If Frm_Main.Send_Data(Chr$(162)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
           Case 3 'Hibernate
                Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Hibernatting ..."
                If Frm_Main.Send_Data(Chr$(163)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
           Case 4 'Hang
                Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Hangging ..."
                If Frm_Main.Send_Data(Chr$(164)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
           Case 5 'Get Time
                Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Getting Time ..."
                If Frm_Main.Send_Data(Chr$(166)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
           Case 6 'Set Time
                Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Setting Time ..."
                If Frm_Main.Send_Data(Chr$(167) & Frm_Main.WindowsControl(0)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
           Case 7 'Get Date
                Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Getting Date ..."
                If Frm_Main.Send_Data(Chr$(168)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
           Case 8 'Set Date
                Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Setting Date ..."
                If Frm_Main.Send_Data(Chr$(169) & Frm_Main.WindowsControl(1)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
           Case 9 'GetClipboard
                Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Getting ClipBoard ..."
                If Frm_Main.Send_Data(Chr$(171)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
           Case 10 'SetClipboard
                Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Setting ClipBoard ..."
                If Frm_Main.Send_Data(Chr$(172) & Frm_Main.WindowsControl(2)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
           Case 11 'Clear Clipboard
                Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Clearing ClipBoard ..."
                Frm_Main.WindowsControl(2) = ""
                If Frm_Main.Send_Data(Chr$(173)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
           Case 12 'Disable Clip
                Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Disableing ClipBoard ..."
                If Frm_Main.Send_Data(Chr$(174)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
           Case 13 'Enable Clip
                Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Enableing ClipBoard ..."
                If Frm_Main.Send_Data(Chr$(175)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
    End Select
End Sub
Public Sub SystemFunctions(Function_ID As Byte, Function_Data As String)
'File Browser Functions
'101xxxxx [10100000 > 10111111]
On Error Resume Next
Dim i As Integer 'General Counter
Dim Done As String, Data1 As String, Data2 As String
Done = Left$(Function_Data, 1)
Function_Data = Mid$(Function_Data, 2)
Dim HKey As String
    Select Case Function_ID
            Case 160 'Shutdown
                If Done = "F" Then
                    MsgBox "Shutdown Operation Failed !" & vbCrLf & "Discription: " & Function_Data, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Shuting Down ..." Then
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
            Case 161 'Reboot
                If Done = "F" Then
                    MsgBox "Reboot Operation failed !" & vbCrLf & "Discription: " & Function_Data, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Rebooting ..." Then
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
            Case 162 'Log Off
                If Done = "F" Then
                    MsgBox "LogOff Operation Failed !" & vbCrLf & "Discription: " & Function_Data, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Logging Off ..." Then
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
            Case 163 'Hibernate
                If Done = "F" Then
                    MsgBox "Hibernate Operation Failed !" & vbCrLf & "Discription: " & Function_Data, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Hibernatting ..." Then
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
            Case 164 'Hang/Freez
                If Done = "F" Then
                    MsgBox "Hang Operation Failed !" & vbCrLf & "Discription: " & Function_Data, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Hangging ..." Then
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
            Case 165 'Reversed

            Case 166 'Get Time
                If Done = "T" Then
                    Frm_Main.WindowsControl(0) = TimeValue(Function_Data)
                ElseIf Done = "F" Then
                    MsgBox "Getting Time Operation Failed !" & vbCrLf & "Discription: " & Function_Data, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Getting Time ..." Then
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
            Case 167 'Set Time
                If Done = "T" Then
                    Frm_Main.WindowsControl(0) = TimeValue(Function_Data)
                ElseIf Done = "F" Then
                    MsgBox "Setting Time Operation Failed !" & vbCrLf & "Discription: " & Function_Data, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Setting Time ..." Then
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
            Case 168 'Get Date
                If Done = "T" Then
                    Frm_Main.WindowsControl(1) = Function_Data
                ElseIf Done = "F" Then
                    MsgBox "Getting Date Operation Failed !" & vbCrLf & "Discription: " & Function_Data, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Getting Date ..." Then
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
            Case 169 'Set Date
                If Done = "T" Then
                    Frm_Main.WindowsControl(1) = Function_Data
                ElseIf Done = "F" Then
                    MsgBox "Setting Date Operation Failed !" & vbCrLf & "Discription: " & Function_Data, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Setting Date ..." Then
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
            Case 170 'Reserved
            
            Case 171 'Get Clipboard
                If Done = "T" Then
                    Frm_Main.WindowsControl(2) = Function_Data
                ElseIf Done = "F" Then
                    MsgBox "Getting Clipboard Operation Failed !" & vbCrLf & "Discription: " & Function_Data, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Getting ClipBoard ..." Then
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
            Case 172 'Set ClipBoard
                If Done = "F" Then
                    MsgBox "Setting Clipboard Operation Failed !" & vbCrLf & "Discription: " & Function_Data, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Setting ClipBoard ..." Then
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
            Case 173 'Clear ClipBoard
                If Done = "F" Then
                    MsgBox "Clearing Clipboard Operation Failed !" & vbCrLf & "Discription: " & Function_Data, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Clearing ClipBoard ..." Then
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
            Case 174 'Disable ClipBoard
                If Done = "F" Then
                    MsgBox "Disnableing Clipboard Operation Failed !" & vbCrLf & "Discription: " & Function_Data, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Disableing ClipBoard ..." Then
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
            Case 175 'Enable ClipBoard
                If Done = "F" Then
                    MsgBox "Enableing Clipboard Operation Failed !" & vbCrLf & "Discription: " & Function_Data, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>" & "Enableing ClipBoard ..." Then
                    Frm_Main.RoomTitle(4) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
            Case 176 'Reserved

            Case 177 'Read Reg Classes
                Dim ClassArr() As String
                IsFileRegistryLoaded = True
                ClassArr = Split(Function_Data, Chr$(0))
                Frm_Main.RegKeysTree.Nodes.Clear
                For i = 0 To UBound(ClassArr) - 1
                    Frm_Main.RegKeysTree.Nodes.Add , , CStr(ClassArr(i)) & "\", SwitchRegClasses(ClassArr(i)), 1, 1
                Next i
                If Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Readding Main Registry Classes ..." Then
                    Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>_"
                End If
            Case 178 'Explore Key
                If Done = "T" Then
                    If Left$(Function_Data, 1) = "0" Then
                        Function_Data = Mid$(Function_Data, 2)
                        HKey = Mid$(Function_Data, 1, InStr(1, Function_Data, Chr$(0)) - 1)
                        Insert_Items HKey, Mid$(Function_Data, Len(HKey) + 2)
                    Else
                        If MsgBox("The Comming Data is Too Big Size , So It Comes as A file ,Do You Want To Add That File To X-Downloader??" & vbCrLf & vbCrLf & "Note: The Data will Be Automatically viewd after downloaded.", vbInformation + vbYesNo, AppName) = vbYes Then
                            Function_Data = Mid$(Function_Data, 2)
                            DownloadManager.Accept_File_Disk Mid$(Function_Data, 5), Long_Representation(Left$(Function_Data, 4)), 1, "Reg-Explore."
                        End If
                    End If
                End If
                If Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Exploreing Selected Key ..." Then
                    Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>_"
                End If
            Case 179 'Creat Key
                If Done = "T" Then
                    'Update The Tree View
                     Data1 = Mid$(Function_Data, 1, InStrRev(Function_Data, "\")) 'Parent
                     Data2 = Mid$(Function_Data, Len(Data1) + 1) 'The Child
                     Frm_Main.RegKeysTree.Nodes.Add Data1, 4, Data1 & Data2 & "\", Data2
                ElseIf Done = "F" Then
                    'Show The Error Massege
                     Data1 = SwitchRegClasses(Left$(Function_Data, 1)) & Mid$(Function_Data, 2, InStr(1, Function_Data, Chr$(0)) - 2)
                     Data2 = Mid$(Function_Data, InStr(1, Function_Data, Chr$(0)) + 1)
                     MsgBox "Error In Creatting The Key" & vbCrLf & Data1 & vbCrLf & "Description : " & Data2, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Creatting The Key ..." Then
                     Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>_"
                End If
            Case 180 'Delete Key
                If Done = "T" Then
                    'Update The Tree View
                     Data1 = AddBackslash(Function_Data) 'OldPath
                     Frm_Main.RegKeysTree.Nodes.Remove Data1
                ElseIf Done = "F" Then
                    'Show The Error Massege
                     Data1 = SwitchRegClasses(Left$(Function_Data, 1)) & Mid$(Function_Data, 2, InStr(1, Function_Data, Chr$(0)) - 2)
                     Data2 = Mid$(Function_Data, InStr(1, Function_Data, Chr$(0)) + 1)
                     MsgBox "Error In Deleting The Key" & vbCrLf & Data1 & vbCrLf & "Description : " & Data2, vbExclamation, AppName
                End If
                If Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Deleting Selected Key ..." Then
                     Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>_"
                End If
            Case 181 'Find Keys
                If Done = "T" Then
                     If Left$(Function_Data, 1) = "0" Then 'Pure Data
                        Editor.SetString Mid$(Function_Data, 2), "Find Keys Results"
                     Else
                        DownloadManager.Accept_File_Disk Mid$(Function_Data, 6), Long_Representation(Mid$(Function_Data, 2, 4)), 1, "Reg-Key-Search."
                     End If
                End If
                If Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Searching Selecting Key ..." Then
                     Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>_"
                End If
            Case 182 'Find Values
                If Done = "T" Then
                     If Left$(Function_Data, 1) = "0" Then 'Pure Data
                        Editor.SetString Mid$(Function_Data, 2), "Find Values Results"
                     Else
                        DownloadManager.Accept_File_Disk Mid$(Function_Data, 6), Long_Representation(Mid$(Function_Data, 2, 4)), 1, "Reg-Val-Search."
                     End If
                End If
                If Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Searching Selecting Key ..." Then
                     Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>_"
                End If
            Case 183 'Reserved
            
            Case 184 'Creat Value
                Data1 = Mid$(Function_Data, 1, InStr(1, Function_Data, Chr$(0)) - 1)
                Data2 = Mid$(Function_Data, Len(Data1) + 2)
                If Done = "T" Then
                    With Frm_Main.RegListView
                        .ListItems.Add , Data1, Data1, 11, 11
                        .ListItems(Data1).SubItems(1) = "R_STR"
                        .ListItems(Data1).SubItems(2) = Data2
                    End With
                ElseIf Done = "F" Then
                    MsgBox "An Error Occure When Tring to Create The Value [" & Data1 & vbCrLf & "Decsription: " & Data2, vbInformation, AppName
                End If
                If Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Creating New Value ..." Then
                     Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>_"
                End If
            Case 185 'Rename Value
                Data1 = Mid$(Function_Data, 1, InStr(1, Function_Data, Chr$(0)) - 1)
                Data2 = Mid$(Function_Data, Len(Data1) + 2)
                If Done = "T" Then
                    Frm_Main.RegListView.ListItems(Data1 & "Val").Text = Data2 'The Old Name
                    Frm_Main.RegListView.ListItems(Data1 & "Val").Key = Data2 & "Val" 'The New Name
                ElseIf Done = "F" Then
                    MsgBox "An Error Occure When Tring to Rename The Value [" & Data1 & vbCrLf & "Decsription: " & Data2, vbInformation, AppName
                End If
                If Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Renaming Value ..." Then
                     Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>_"
                End If
            Case 186 'Modify Value
                Data1 = Mid$(Function_Data, 1, InStr(1, Function_Data, Chr$(0)) - 1) 'The Value Name
                Data2 = Mid$(Function_Data, Len(Data1) + 2) 'The Value Data
                If Done = "T" Then
                    Frm_Main.RegListView.ListItems(Data1 & "Val").SubItems(2) = Data2
                ElseIf Done = "F" Then
                    MsgBox "An Error Occure When Tring to Modifing The Value [" & Data1 & "]" & vbCrLf & "Decsription: " & Data2, vbInformation, AppName
                End If
                If Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Modifing Value ..." Then
                     Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>_"
                End If
            Case 187 'Delete Value
                Data1 = Mid$(Function_Data, 1, InStr(1, Function_Data, Chr$(0)) - 1) 'The Value Data
                If Done = "T" Then
                    Frm_Main.RegListView.ListItems.Remove (Data1 & "Val")
                ElseIf Done = "F" Then
                    Data2 = Mid$(Function_Data, Len(Data1) + 2)
                    MsgBox "An Error Occure When Tring to Deleting The Value [" & Data1 & "]" & vbCrLf & "Decsription: " & Data2, vbInformation, AppName
                End If
                If Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Deleting Value ..." Then
                     Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>_"
                End If
            Case 188 'Reserved
            
            Case 190 'Internet Manager
                If Done = "T" Then
                     If Left$(Function_Data, 1) = "0" Then 'Pure Data
                        Editor.SetString Mid$(Function_Data, 2), "History Files Cached"
                     Else
                        DownloadManager.Accept_File_Disk Mid$(Function_Data, 6), Long_Representation(Mid$(Function_Data, 2, 4)), 1, "Get-Hist-Result."
                     End If
                End If
                If Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Searching Selecting Key ..." Then
                     Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>_"
                End If
     End Select
End Sub
Public Sub RegistryManagerButtons(Index As Integer)
    On Error Resume Next
    Dim i As Integer 'General Counter
    Dim ValName As String, Value As String
    Select Case Index
           Case 0 'load Main Classes
                Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Readding Main Registry Classes ..."
                If Frm_Main.Send_Data(Chr$(177)) = False Then 'Load Processes Signal
                    Frm_Main.RoomTitle(5) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
                Frm_Main.RegListView.ListItems.Clear
           Case 1 'Explore
                Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Exploreing Selected Key ..."
                If Frm_Main.Send_Data(Chr$(178) & Mid$(Frm_Main.RegKeysTree.SelectedItem.Key, 1, Len(Frm_Main.RegKeysTree.SelectedItem.Key) - 1)) = False Then
                    Frm_Main.RoomTitle(5) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                End If
           Case 2 'Creat New Key
                Dim NewKey As String
                NewKey = Trim$(InputBox("Enter The Key Name...", AppName, "NewKey"))
                If Len(NewKey) Then
                    Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Creatting The Key ..."
                    If Frm_Main.Send_Data(Chr$(179) & Frm_Main.RegKeysTree.SelectedItem.Key & NewKey) = False Then
                        Frm_Main.RoomTitle(5) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                    End If
                End If
           Case 3 'Delete Key
                If MsgBox("Are You Sure To Delete This Key with all Relatives??", vbExclamation + vbYesNo, AppName) = vbYes Then
                    Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Deleting Selected Key ..."
                    If Frm_Main.Send_Data(Chr$(180) & Mid$(Frm_Main.RegKeysTree.SelectedItem.Key, 1, Len(Frm_Main.RegKeysTree.SelectedItem.Key) - 1)) = False Then
                        Frm_Main.RoomTitle(5) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                    End If
                End If
           Case 4 'Find Key
                Dim Pattern As String
                Pattern = Trim$(InputBox("Enter The Pattern To Search for ..." & vbCrLf & "Attention : The remoted system may be heavy during searching!", AppName))
                If Len(Pattern) Then
                    Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Searching Selecting Key ..."
                    If Frm_Main.Send_Data(Chr$(181) & Frm_Main.RegKeysTree.SelectedItem.Key & Chr$(0) & Pattern) = False Then
                        Frm_Main.RoomTitle(5) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                    End If
                End If
           Case 5 'Find Value
                Pattern = Trim$(InputBox("Enter The Pattern To Search for ..." & vbCrLf & "Attention : The remoted system may be heavy during searching!", AppName))
                If Len(Pattern) Then
                    Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Searching Selecting Key ..."
                    If Frm_Main.Send_Data(Chr$(182) & Frm_Main.RegKeysTree.SelectedItem.Key & Chr$(0) & Pattern) = False Then
                        Frm_Main.RoomTitle(5) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                    End If
                End If
           Case 6 'Creat New Value
                ValName = Trim$(InputBox("Input The New Value Name ...", AppName))
                If Len(ValName) Then
                    Value = Trim$(InputBox("Input The New Value Data ...", AppName))
                    If Len(Value) Then
                        Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Creating New Value ..."
                        If Frm_Main.Send_Data(Chr$(184) & Frm_Main.RegKeysTree.SelectedItem.Key & Chr$(0) & ValName & Chr$(0) & Value) = False Then
                            Frm_Main.RoomTitle(5) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                        End If
                    End If
                End If
           Case 7 'Rename Vlaue
                ValName = Trim$(InputBox("Write The New Value Name...", AppName, Frm_Main.RegListView.SelectedItem.Text))
                If Len(ValName) And LCase(Frm_Main.RegListView.SelectedItem.Text) <> LCase(ValName) Then
                    Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Renaming Value ..."
                    If Frm_Main.Send_Data(Chr$(185) & Frm_Main.RegKeysTree.SelectedItem.Key & Chr$(0) & Frm_Main.RegListView.SelectedItem.Text & Chr$(0) & ValName) = False Then
                        Frm_Main.RoomTitle(5) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                    End If
                End If
           Case 8 'Modify Value
                Dim OldVal As String
                OldVal = Frm_Main.RegListView.SelectedItem.SubItems(2)
                Value = Trim$(InputBox("Write The New Value Data...", AppName, OldVal))
                If (Value <> OldVal) Then
                    Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Modifing Value ..."
                    If Frm_Main.Send_Data(Chr$(186) & Frm_Main.RegKeysTree.SelectedItem.Key & Chr$(0) & Frm_Main.RegListView.SelectedItem.Text & Chr$(0) & Value) = False Then
                        Frm_Main.RoomTitle(5) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                    End If
                End If
           Case 9 'Delete Value
                If MsgBox("Are You Sure You Want to Delete The Selected Value?", vbQuestion + vbYesNo, AppName) = vbYes Then
                    OldVal = Frm_Main.RegListView.SelectedItem.Text
                    Frm_Main.RoomTitle(5) = "\Handle-X\Registry Manager :\>" & "Deleting Value ..."
                    If Frm_Main.Send_Data(Chr$(187) & Frm_Main.RegKeysTree.SelectedItem.Key & Chr$(0) & OldVal) = False Then
                        Frm_Main.RoomTitle(5) = "\Handle-X\Windows&&Clipboard Manager :\>_"
                    End If
                End If
    End Select
End Sub
Public Sub GiveDetailsAbtRMvalue()
    'Give The Registry Value Details
     Dim Msg As String
     Dim ItemID As Integer
     With Frm_Main.RegListView
         ItemID = .SelectedItem.Index
        'Collect Information
         Msg = "Registry Value Details :-" & vbCrLf
         Msg = Msg & "---------------------" & vbCrLf & vbCrLf
         Msg = Msg & "Value Path : " & SwitchRegClasses(Left$(.Tag, 1)) & Mid$(.Tag, 2) & vbCrLf
         Msg = Msg & "Value Name : " & .ListItems(ItemID).Text & vbCrLf
         Msg = Msg & "Data Type : " & .ListItems(ItemID).SubItems(1) & vbCrLf
         Msg = Msg & "Data : " & .ListItems(ItemID).SubItems(2) & vbCrLf
     End With
    'Show Information
     Editor.SetString Msg, "Registry Value details"
End Sub
Private Function SwitchRegClasses(HkeyLong As String) As String
    'On Error Resume Next
        'Convert To long to String
         Select Case HkeyLong
                Case 0
                    SwitchRegClasses = "HKEY_CLASSES_ROOT"
                Case 1
                    SwitchRegClasses = "HKEY_CURRENT_USER"
                Case 2
                    SwitchRegClasses = "HKEY_LOCAL_MACHINE"
                Case 3
                    SwitchRegClasses = "HKEY_USERS"
                Case 4
                    SwitchRegClasses = "HKEY_PERFORMANCE_DATA"
                Case 5
                    SwitchRegClasses = "HKEY_CURRENT_CONFIG"
                Case 6
                    SwitchRegClasses = "HKEY_DYN_DATA"
                Case Else
                    SwitchRegClasses = "Unknown Class!"
         End Select
End Function
Private Sub Insert_Items(Parent As String, Data As String)
    On Error Resume Next
    Dim KeyArr() As String, ValArr() As String, ValCols() As String
    Dim KeyData As String, ValData As String
   'This Function Inserts The Items in the registry tree
    KeyData = Mid$(Data, 1, InStr(1, Data, Chr$(0) & Chr$(0)) - 1)
    ValData = Mid$(Data, Len(KeyData) + 2)
    If Left$(ValData, 1) = Chr$(0) Then ValData = Mid$(ValData, 2)
   'Keys Parssing
    Parent = AddBackslash(Parent)
    KeyArr = Split(KeyData, Chr$(0))
    For i = 0 To UBound(KeyArr)
        Frm_Main.RegKeysTree.Nodes.Add Parent, 4, Parent & KeyArr(i) & "\", KeyArr(i)
    Next i
   'Values Parssing
    Frm_Main.RegListView.ListItems.Clear
    ValArr = Split(ValData, vbCrLf)
    For i = 0 To UBound(ValArr) - 1
        ValCols = Split(ValArr(i), Chr$(0))
        With Frm_Main.RegListView
             .Tag = Parent 'Set The Parent path of the values information
             If (Val(ValCols(1)) > 2 And Val(ValCols(1)) < 5) Then  'Binary Values
                If Len(ValCols(0)) > 0 Then .ListItems.Add , ValCols(0), ValCols(0), 12, 12
             ElseIf Val(ValCols(1)) = 9 Then
                If Len(ValCols(0)) > 0 Then .ListItems.Add , ValCols(0), ValCols(0), 12, 12
                ValCols(2) = StrToHex(ValCols(2))
             Else
                If Len(ValCols(0)) > 0 Then .ListItems.Add , ValCols(0) & "Val", ValCols(0), 11, 11
             End If
            .ListItems(ValCols(0) & "Val").SubItems(2) = ValCols(2)
            .ListItems(ValCols(0) & "Val").SubItems(1) = ClassTypes(Val(ValCols(1)))
        End With
    Next i
End Sub
Public Sub RegTreeViewDblClick()
    On Error Resume Next
    RegistryManagerButtons (1)
End Sub
Public Sub RegTreeViewClick()
    On Error Resume Next
    Frm_Main.bar(3) = SwitchRegClasses(Left$(Frm_Main.RegKeysTree.SelectedItem.Key, 1)) & Mid$(Frm_Main.RegKeysTree.SelectedItem.Key, 2)
    Frm_Main.RegListView.ListItems.Clear
End Sub
Private Function ClassTypes(CType As Long) As String
    'This Function Returns The Eqavelant Class Name String
     Select Case CType
            Case 1
                ClassTypes = "R_STR"
            Case 2
                ClassTypes = "R_EXPSTR"
            Case 3
                ClassTypes = "R_BIN"
            Case 4
                ClassTypes = "R_DWORD"
            Case 7
                ClassTypes = "R_MULSTR"
            Case 9
                ClassTypes = "R_FULL_RESOURCE_DESCRIPTOR"
            Case Else
                ClassTypes = "R_UKNOWN"
     End Select
End Function
Private Function StrToHex(Str As String) As String
    Dim HexStr As String
    For i = 1 To Len(Str)
        HexStr = HexStr & Hex(Asc(Mid$(Str, i, 1)))
    Next
    StrToHex = HexStr
End Function
