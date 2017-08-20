Attribute VB_Name = "NetWorkManager"
'This Module has Direct Access To The Sockets System lies in the frm_main FROM
'--------------------------------------<< Connection Mnagare >> ----------------------------
'Public Types and Structures
 Public Type AddressBookEntry
    IP_Address As String * 15
    Port As String * 5
    Comment As String * 100
 End Type
'Constants
 Private Const AddressBookFileName = "AddrBook.INI"
'Variables
 Public Current_PC As String, Current_IP As String, Current_Port As String
 Public Current_Index As Integer   'The Index Of Activated Socket Now
 Private AddressBookFilePath As String
Public Sub Load_Network_Manager()
     On Error Resume Next
    'Load The Buttons Images
     Dim i As Integer 'General Counter
     Frm_Main.RoomTitle(0) = "\Handle-X\IP Managerr :\>Initializing..."
     For i = 0 To Frm_Main.IP_Buttons.UBound
        Frm_Main.IP_Buttons(i).BorderStyle = 0
        Frm_Main.IP_Buttons(i).Picture = Frm_Main.IpManagerImageList.ListImages(i + 1).Picture
     Next i
     DoEvents
    'Load Address Book From The File
     Dim Item As AddressBookEntry, ItemKey As String
     AddressBookFilePath = App.Path & "\INI\" & AddressBookFileName
     Dim FFile As Integer
     FFile = FreeFile
     Open AddressBookFilePath For Random As #FFile Len = Len(Item)
        Do While Not EOF(FFile)
            Get #FFile, , Item
            If Len(Trim$(Item.IP_Address)) Then
                'Add To List View
                 With Frm_Main.AddressBook
                 ItemKey = Trim$(Item.IP_Address) & "," & Trim$(Item.Port)
                    .ListItems.Add , ItemKey, Trim$(Item.IP_Address)
                    .ListItems(ItemKey).SubItems(1) = Trim$(Item.Port)
                    .ListItems(ItemKey).SubItems(2) = Trim$(Item.Comment)
                 End With
            End If
        Loop
     Close #FFile
     Frm_Main.AddressBook.ListItems.Remove (Frm_Main.AddressBook.ListItems.Count)
     Frm_Main.RoomTitle(0) = "\Handle-X\IP Managerr :\>_"
End Sub
Public Sub ConnectionManagerButtons(Index As Integer)
On Error Resume Next
Dim i As Integer 'General Counter
Dim Item As AddressBookEntry, ItemKey As String
    Select Case Index
        Case 0:
            If MsgBox("Are You Sure You Want To Exit ?", vbExclamation + vbYesNo, AppName) = vbYes Then
                End   'Unload All Program
            End If
        Case 1: Frm_Main.WindowState = 1   'Minimize
        Case 2: 'Connect
                Dim FreeIndex As Integer, Found As Boolean 'Carry the index of the Current Free Socket Control
                Dim ReqIP As String, ReqPort As String
                ReqIP = Trim$(Frm_Main.txt_IP)
                ReqPort = Trim$(Frm_Main.txt_Port)
               'CheckValid IP Address
                If IsValidIpAddress(ReqIP) = False Then
                    MsgBox "Invalid IP Address.", vbCritical, AppName
                    txt_IP = ""
                    Frm_Main.txt_IP.SetFocus
                    Exit Sub
                End If
                If IsValidPortNumber(ReqPort) = False Then
                    MsgBox "Invalid Port Number.", vbCritical, AppName
                    txt_Port = ""
                    Frm_Main.txt_Port.SetFocus
                    Exit Sub
                End If
               'Save & Update The Address Book
               'Ckeck If Exist Entry
                ItemKey = ReqIP & "," & ReqPort
                For i = 1 To Frm_Main.AddressBook.ListItems.Count
                    If Frm_Main.AddressBook.ListItems(i).Key = ItemKey Then
                        GoTo ResumeConnection
                    End If
                Next
                If MsgBox("Would You Like To Add This Entry To The Address Book ??", vbQuestion + vbYesNo, "New Entry Detected.") = vbYes Then
                     Item.IP_Address = ReqIP
                     Item.Port = ReqPort
                     Item.Comment = InputBox("Add The Comment Of That Entry To Help You To Remember That Device Information Next Time in less than 100 Char's", "Add Comment", Now)
                    'Add To List View
                     With Frm_Main.AddressBook
                        .ListItems.Add , ItemKey, Trim$(Item.IP_Address)
                        .ListItems(ItemKey).SubItems(1) = Trim$(Item.Port)
                        .ListItems(ItemKey).SubItems(2) = Trim$(Item.Comment)
                     End With
                    'Add To File On The Disk
                     Dim FFile As Integer
                     FFile = FreeFile
                    'Open The File And Store The New Record
                     Open AddressBookFilePath For Random As #FFile Len = Len(Item)
                        Seek #FFile, FileLen(AddressBookFilePath) + 1
                        Put #FFile, Frm_Main.AddressBook.ListItems.Count, Item
                     Close #FFile
                End If
ResumeConnection:
               'Check Ambigous Connection
                For i = 1 To Frm_Main.Current_Connected.ListItems.Count
                    If Frm_Main.Current_Connected.ListItems(i).Key = ReqIP & "," & ReqPort Then
                        MsgBox "Already Connected Device.", vbCritical, AppName
                        Exit Sub
                    End If
                Next i
               'Check The Password and Disable it's input interface
                Frm_Main.Txt_Pass.Enabled = False
               'Check Free Socket Control from the already exist ones
                For i = 0 To Frm_Main.Socket.UBound
                    If Frm_Main.Socket(i).State <> 7 Then 'Found Free Socket
                        FreeIndex = i
                        Found = True
                        Exit For
                    End If
                Next i
               'Check If Found Or No
                If Found = False Then
                    'Load A New Socket
                     Load Frm_Main.Socket(Frm_Main.Socket.UBound + 1) 'Create A New Instance of the socket
                     FreeIndex = Frm_Main.Socket.UBound
                End If
               'Now The Lucky Socket is ready to be connected
                Frm_Main.Socket(FreeIndex).Close
                DoEvents
                Frm_Main.Socket(FreeIndex).Connect ReqIP, ReqPort
               'Set The lucky Socket as a Current Activated Socket
                Current_Index = FreeIndex
                Frm_Main.bar(1) = " Waitting For Replay Form The Server..."
               'Set Timer To waitting State
                Frm_Main.TheManager.Tag = 1
        Case 3: ' Disconnect
               'The Current Activated Socket Is The Disconnected One
                Frm_Main.TheManager.Tag = 0 'Cancel Wait-For-Server-Replay State
                If MsgBox("Are You Sure To Disconnect From The Current Connection ??", vbQuestion + vbYesNo, AppName) = vbYes Then
                     Remove_Terminal (Current_Index)
                     Frm_Main.WaitVal = 0
                End If
               'Update Discription
                UpdateCurrentConnection
        Case 4: 'Show Help File
               'Executting The Help File
                FileBrowser.CMD1.HelpFile = App.Path & "\Help\Handle-X.hlp"
                FileBrowser.CMD1.HelpCommand = &HB
                FileBrowser.CMD1.ShowHelp
        Case 5: 'Hide Handle-X to work in background and restore it by the Hot Key [ALT+CTRL+F12]
               'Authrization Processing
                
               'Register The Hot Key(CTRL+ALT+F12)
                If RegHotKey() = True Then
                    'Hide Handle-X If hot-key registration succeed
                     Frm_Main.Hide
                     App.TaskVisible = False
                     HKMsgFlag = True 'Set The Hotkey flag to force Handle-X To Accept and examin HotKeys messages
                     ProcessMessages 'Examin Messages
                End If
     End Select
End Sub
Public Sub CurrentConnectedDblClick()
    On Error Resume Next
    Dim Index As Integer
    Index = Frm_Main.Current_Connected.SelectedItem.Index
    If Index > 0 Then
        Current_Index = Frm_Main.Current_Connected.SelectedItem.Tag
        UpdateCurrentConnection
        Frm_Main.TheManager_Timer
    Else
        MsgBox "Invalid Selected Item!", vbExclamation, AppName
    End If
End Sub
Public Sub Insert_Terminal(PcName As String)
Dim StrName As String
    With Frm_Main.Socket(Current_Index)
       'Variables
        Current_IP = .RemoteHostIP
        Current_Port = .RemotePort
        Current_PC = PcName
        StrName = Current_IP & "," & Current_Port 'The Key String Indicates That u can Connect twice to the same ip , but from differant port
       'Update List View
        Frm_Main.Current_Connected.ListItems.Add , StrName, Current_PC
        Frm_Main.Current_Connected.ListItems(StrName).SubItems(1) = Current_IP
        Frm_Main.Current_Connected.ListItems(StrName).SubItems(2) = Current_Port
        Frm_Main.Current_Connected.ListItems(StrName).SubItems(3) = time
        Frm_Main.Current_Connected.ListItems(StrName).Tag = Current_Index 'Set The Realated Socket Index
       'Update The Bar lies there at the bottom of the Main Window
        UpdateCurrentConnection
    End With
End Sub
Public Sub Remove_Terminal(Index As Integer)
'This function removers entry in the list witch related to the comming socket index
'And Sended Disconnect Signal
'The Terminal Here Points to the Socket Index
Dim ListIndex As Integer
'Select The Index
 If Frm_Main.Current_Connected.ListItems.Count > 0 Then
    For i = 1 To Frm_Main.Current_Connected.ListItems.Count
        If Frm_Main.Current_Connected.ListItems(i).Tag = Index Then
            'Found List Index
             ListIndex = i
             Exit For
        End If
    Next i
    If ListIndex > 0 Then
        'Remove From List View
         Frm_Main.Current_Connected.ListItems.Remove (ListIndex)
        'Send Disconnect Signal if current state = 7
         'If Frm_Main.Socket(Current_Index).State = 7 Then Frm_Main.Send_Data ("Disconnect")
    End If
   'Close Socket
    Frm_Main.Socket(Index).Close
 End If
'Check If No Current Connections ??
 If Frm_Main.Current_Connected.ListItems.Count = 0 Then
    Frm_Main.bar(1) = " No Current Connection"
    Current_Index = 0
 Else
    Current_Index = Val(Frm_Main.Current_Connected.ListItems(1).Tag)
 End If
End Sub
Public Sub UpdateCurrentConnection()
        Dim PcName As String, PcIP As String, PcPort As String
        Dim i As Integer
       'I have The Socket index = current_index
       'The Info in the list view , so search over it
        If Frm_Main.Current_Connected.ListItems.Count > 0 Then
            For i = 1 To Frm_Main.Current_Connected.ListItems.Count
                If Frm_Main.Current_Connected.ListItems(i).Tag = Current_Index Then
                    With Frm_Main.Current_Connected.ListItems(i)
                        PcName = .Text
                        PcIP = .SubItems(1)
                        PcPort = .SubItems(2)
                        Frm_Main.bar(1) = " Current Connection : [PC Name : " & PcName & "] [IP Address : " & PcIP & "] [Remoted Port : " & PcPort & "]"
                    End With
                    Exit Sub
                End If
            Next
        Else
            Frm_Main.bar(1) = " No Current Connection"
        End If
End Sub
Public Sub EditAddressPort(Index As Integer)
    On Error Resume Next
    Dim FFile As Integer, NewPort As String, Item As AddressBookEntry
   'Accept The New Port
    NewPort = InputBox("Enter The New Port Or Keep It.", "Edit Port", Frm_Main.AddressBook.ListItems(Index).SubItems(1))
    If NewPort <> Frm_Main.AddressBook.ListItems(Index).SubItems(1) And IsValidPortNumber(NewPort) Then
        'Update The View On The Address book
         Frm_Main.AddressBook.ListItems(Index).SubItems(1) = NewPort
        'Write The Modifacation To The Disk
         FFile = FreeFile
         Open AddressBookFilePath For Random As #FFile Len = Len(Item)
            Item.IP_Address = Frm_Main.AddressBook.ListItems(Index).Text
            Item.Port = Frm_Main.AddressBook.ListItems(Index).SubItems(1)
            Item.Comment = Frm_Main.AddressBook.ListItems(Index).SubItems(2)
         Put #FFile, Index, Item
         Close #FFile
    Else
        MsgBox "Invalid operation,Check again for valid new port", vbCritical, AppName
    End If
End Sub
Public Sub EditAddressComment(Index As Integer)
    On Error Resume Next
    Dim FFile As Integer, NewComment As String, Item As AddressBookEntry
   'Accept The New Port
    NewComment = InputBox("Enter The New Port Or Keep It.", "Edit Port", Frm_Main.AddressBook.ListItems(Index).SubItems(2))
    If NewComment <> Frm_Main.AddressBook.ListItems(Index).SubItems(2) Then
        'Update The View On The Address book
         Frm_Main.AddressBook.ListItems(Index).SubItems(2) = NewComment
        'Write The Modifacation To The Disk
         FFile = FreeFile
         Open AddressBookFilePath For Random As #FFile Len = Len(Item)
            Item.IP_Address = Frm_Main.AddressBook.ListItems(Index).Text
            Item.Port = Frm_Main.AddressBook.ListItems(Index).SubItems(1)
            Item.Comment = Frm_Main.AddressBook.ListItems(Index).SubItems(2)
         Put #FFile, Index, Item
         Close #FFile
    Else
        MsgBox "Invalid Operation,Check Again If Valid New NewComment", vbCritical, AppName
    End If
End Sub
Public Sub RemoveEntry(Index As Integer)
    'On Error GoTo Failed
   'Remove From List View AddressBookFilePath
    Frm_Main.AddressBook.ListItems.Remove (Index)
    Dim Item As AddressBookEntry
    Dim i As Integer, FFile As Integer
   'Update The Address Book File
    Kill AddressBookFilePath
    FFile = FreeFile
    Open AddressBookFilePath For Random As #FFile Len = Len(Item)
        For i = 1 To Frm_Main.AddressBook.ListItems.Count
            Item.IP_Address = Frm_Main.AddressBook.ListItems(i).Text
            Item.Port = Frm_Main.AddressBook.ListItems(i).SubItems(1)
            Item.Comment = Frm_Main.AddressBook.ListItems(i).SubItems(2)
            Put #FFile, i, Item
        Next i
    Close
    Exit Sub
Failed:
    MsgBox "Cann't Complete That Operation!", vbExclamation, AppName
End Sub
