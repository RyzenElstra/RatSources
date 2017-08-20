Attribute VB_Name = "FileManager"
Option Explicit ''''''''''''''''''''''''''''<< File Browser >>'''''''''''''''''''''''
'<<<<< File Browser >>>>>
Public Type Drive
    StrName As String
    StrTotal As String
    StrFree As String
    StrUsed As String
    StrUserFree As String
End Type

Public Type FileType 'Type used to descripe a certain file type such "exe's , text files , and so on.."
    Tag As String
    ExtensionsArray As Variant
End Type

Public Type CopiedMovedItem
    OldPath As String
    NewPath As String
    CopyOrMove As Byte '20 Means Copy , 30 Means Move
End Type

Public CNode As Node
Public Drives() As Drive
Public FileTypes(9) As FileType
Public IsFileBrowserLoaded As Boolean
Public Sub Load_File_Browser()
On Error Resume Next
Dim i As Integer  'General porpouse variable
   '- Write The code of loadding of the File-Browser Here
   'The Files Extinsion
    FileTypes(0).Tag = "Doc"
    FileTypes(0).ExtensionsArray = Array("txt", "doc", "rtf", "ini", "inf", "dat", "wri")
    FileTypes(1).Tag = "Audio"
    FileTypes(1).ExtensionsArray = Array("mp3", "mp2", "wav", "mid", ".rm", "ram", "wma")
    FileTypes(2).Tag = "Exe"
    FileTypes(2).ExtensionsArray = Array("exe", "msi", "msc", "scr", "reg")
    FileTypes(3).Tag = "Photo"
    FileTypes(3).ExtensionsArray = Array("bmp", "gif", "jpg", "png", "ico", "tiff", "jpeg")
    FileTypes(4).Tag = "Video"
    FileTypes(4).ExtensionsArray = Array("avi", "mov", "mpeg", "mpg", "asf", "wmv")
    FileTypes(5).Tag = "Sys"
    FileTypes(5).ExtensionsArray = Array("sys", "dll", "ocx", "vxd")
    FileTypes(6).Tag = "Dos"
    FileTypes(6).ExtensionsArray = Array("com", "pif", "dos", "bat")
    FileTypes(7).Tag = "Net"
    FileTypes(7).ExtensionsArray = Array("html", "htm", "php", "asp", "aspx", "dhtml", "url", "xml", "swf")
    FileTypes(8).Tag = "Soft"
    FileTypes(8).ExtensionsArray = Array("bas", "cls", "frm", "vbp", ".res", ".c", ".cpp", ".h", ".rs", "dsp", "dsw", "asm", "dfm", "pas", "dpr", ".js", ".vs", "java", "class")
    FileTypes(9).Tag = "Zip"
    FileTypes(9).ExtensionsArray = Array("zip", "rar", ".z", ".jz", "cab", "tar", "taz", "arc")
    For i = 0 To Frm_Main.File_Browser_Buttons.UBound
        Frm_Main.File_Browser_Buttons(i).BorderStyle = 0
        Frm_Main.File_Browser_Buttons(i).Picture = Frm_Main.ImageList1.ListImages(i + 1).Picture
    Next i
End Sub
Public Sub LoadDrives()
    'Load Dirs
    'Clear The drives Buffer
    'Ask the server for the drives info
    On Error Resume Next
    'Set First Loaded Bool-Variable
        Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Loading Drivers..."
        If Frm_Main.Send_Data(Chr$(128)) = False Then 'Ask from server to send the drives information
            Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
        End If
        Frm_Main.Dirs_Explore.Nodes.Clear
        Frm_Main.Dirs_Explore.Nodes.Add , , "My Computer", "My Computer", 1, 1
        DoEvents
    'Clear the Files View
        Frm_Main.Files_Explore.ListItems.Clear
        Frm_Main.Files_Explore.Refresh
End Sub
Public Sub FileBrowserFunctions(Function_ID As Byte, Function_Data As String)
'File Browser Functions
'100xxxxx [10000000 > 10011111]
Dim Done As String 'Done If True
Dim Return_Path As String 'The Return Path from the operation
Dim New_Path As String, Old_Path As String 'The New Path changed by renaming operations
Dim Parent_Dir As String, offset As Integer, Data As String
Dim i As Integer 'General Counter
'Initialization
Done = Mid$(Function_Data, 1, 5) '[True ] or [False]
Return_Path = Mid$(Function_Data, 6) 'The Returned Path
Select Case Function_ID
Case 128 'Drives Information Back From Server
            Dim Ctr As Integer, RepStmt() As String, Tmp() As String
            RepStmt = Split(Function_Data, vbCrLf) 'Split the drives info into the buffer Repstmt
            ReDim Drives(UBound(RepStmt()) - 1) 'Resize The Drives Buffer
            For Ctr = 0 To UBound(RepStmt()) - 1
                'I Have now the drives information
                    Tmp = Split(RepStmt(Ctr), "*") 'Split the size's information of each drive
                    If Left$(Tmp(0), 1) >= "A" And Left$(Tmp(0), 1) <= "Z" Then
                        Drives(Ctr).StrName = Tmp(0)
                    End If
                   'Fill The Buffer with the Obtained Information
                    Drives(Ctr).StrTotal = Tmp(1)
                    Drives(Ctr).StrFree = Tmp(2)
                    Drives(Ctr).StrUsed = Tmp(3)
                    Drives(Ctr).StrUserFree = Tmp(4)
            Next
            For i = 0 To UBound(Drives) 'Add The Drives Names to the Dirs Tree View
                    Frm_Main.Dirs_Explore.Nodes.Add "My Computer", 4, Left$(Drives(i).StrName, 3), Drives(i).StrName, 2, 2
            Next
            Frm_Main.Dirs_Explore.Nodes.Item("My Computer").Expanded = True
            Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
            IsFileBrowserLoaded = True 'Set The Flag of the FileManager Loaded
Case 129 'Dris Information Back From Server
            offset = 1 'len(REXP) + 1
            Data = Mid$(Function_Data, offset)
            Parent_Dir = Left$(Function_Data, InStr(1, Function_Data, vbCrLf) - 1) 'Fetch the parent directory
            offset = Len(Parent_Dir) + offset + 2  ' len(vbcrlf) = 2 bytes
            Data = Mid$(Function_Data, offset)
            Insert_Dirs Parent_Dir, Data
            Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Accepting Files Information..."
            Frm_Main.Send_Data (Chr$(130) & Parent_Dir) 'Ask The Server For The Files Information
Case 130 'Files Information Back From Server
            Dim DataType As String 'Indicates weather pure data or Filepath to big data
            Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Loading Files..."
            Frm_Main.RoomTitle(2).Refresh
            offset = 1 'len(REXP) + 1
            Data = Mid$(Function_Data, offset)
            Parent_Dir = Left$(Data, InStr(1, Data, Separator_Char) - 1)
            offset = Len(Parent_Dir) + offset + 1
            Data = Mid$(Function_Data, offset)
            DataType = Left$(Data, 1)
            If Val(DataType) = 0 Then
                Insert_Files Parent_Dir, Mid$(Data, 2)
            ElseIf Val(DataType) = 1 Then
                If MsgBox("The comming files data need to be downloaded , Ok?", vbQuestion + vbYesNo, AppName) = vbYes Then
                    DownloadManager.Accept_File_Disk Mid$(Data, 6), Long_Representation(Mid$(Data, 2, 4)), 1, "Files Info."
                Else
                    Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>"
                End If
            End If
Case 131 'Reserved
           'TODO
Case 132 'Reserved
           'TODO
Case 133 'Reserved
           'TODO
Case 134 'New Folder(Dir_Path)
           Parent_Dir = Mid$(Return_Path, 1, InStrRev(Return_Path, "\")) 'Ex: [C:\ahmed\]
           Data = Mid$(Return_Path, Len(Parent_Dir) + 1) 'Ex: [New Folder]
           If Done = "True " Then
                If Len(Parent_Dir) <> 3 Then Parent_Dir = Mid$(Parent_Dir, 1, Len(Parent_Dir) - 1) 'Remove the slash if Not Drive is the parent
                Frm_Main.Dirs_Explore.Nodes.Add Parent_Dir, 4, AddBackslash(Parent_Dir) & Data, Data 'Update the dirs view with the new folder created
           ElseIf Done = "False" Then
                'The Return_path cotain information about the error description and the Path
                MsgBox "Error in creating directory [" & Mid$(Return_Path, InStr(1, Return_Path, Separator_Char) + 1) & "]", vbExclamation, Mid$(Return_Path, 1, InStr(1, Return_Path, Separator_Char) - 1)
           End If
          'Check if the title = remove then clear it...
           If Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Creating New Directory..." Then
                Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
           End If
Case 135 'Rename Folder
           Return_Path = Mid$(Function_Data, 6, InStr(1, Function_Data, Separator_Char) - 6) 'The Old_Path returned from the
           New_Path = Mid$(Function_Data, InStr(1, Function_Data, Separator_Char) + 1) 'Ex [E:\NewFolderName]
           Data = Mid$(New_Path, InStrRev(Return_Path, "\") + 1) 'Ex: [New Folder]
           If Done = "True " Then
               'Check Interferance of folders
                'If InStr(1, Data, "\") > 0 Then
                    'Parent_Dir = Return_Path & "\" & Mid$(Data, 1, InStr(1, Data, "\") - 1)
                    'Data = Mid$(Data, InStr(1, Data, "\") + 1)
                    'Frm_Main.Dirs_Explore.Nodes.Add Parent_Dir, 4, AddBackslash(Parent_Dir) & Data, Data 'Update the dirs view with the new folder created
                    'Frm_Main.Dirs_Explore.Nodes.Remove Return_Path
                'Else
                    Frm_Main.Dirs_Explore.Nodes.Item(Return_Path).Key = New_Path 'Rename the Directory-Node
                    Frm_Main.Dirs_Explore.Nodes.Item(New_Path).Text = Data 'Rename the Directory-Node
                'End If
           ElseIf Done = "False" Then
                'The Return_path cotain information about the error description and the Path
                'The New_Path here contain the Errored old_path
                MsgBox "Error in renaming path [" & New_Path & "]", vbExclamation, Return_Path
           End If
          'Check if the title = rename then clear it...
           If Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Renaming Directory..." Then
                Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
           End If
Case 136 'Removing Directory
           If Done = "True " Then
                Frm_Main.Dirs_Explore.Nodes.Remove (Return_Path) 'Remove the Directory-Node
                Update_Description 'Update The Address Bar at the button by the new selected Path in the Dir_Explore
                Frm_Main.File_Browser_Buttons_Click (5) 'Update The File-List Contents
           ElseIf Done = "False" Then
                'The Return_path cotain information about the error description and the Path
                MsgBox "Error in removing path [" & Mid$(Return_Path, InStr(1, Return_Path, Separator_Char) + 1) & "]" & vbCrLf & "Hint: The Directory may be ReadOnly!", vbExclamation, Mid$(Return_Path, 1, InStr(1, Return_Path, Separator_Char) - 1)
           End If
          'Check if the title = remove then clear it...
           If Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Removing Directory..." Then
                Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
           End If
Case 137 'New File
           Data = Mid$(Return_Path, InStrRev(Return_Path, "\") + 1) 'Ex : [New File.txt]
           If Done = "True " Then
                     Frm_Main.Files_Explore.ListItems.Add , Return_Path, Data, CheckFileType(Data), CheckFileType(Data)
                     Frm_Main.Files_Explore.ListItems(Return_Path).SubItems(1) = "0 B" 'Size
                     Frm_Main.Files_Explore.Refresh
           ElseIf Done = "False" Then
                'The Return_path cotain information about the error description and the Path
                MsgBox "Error in creating file [" & Mid$(Return_Path, InStr(1, Return_Path, Separator_Char) + 1) & "]", vbExclamation, Mid$(Return_Path, 1, InStr(1, Return_Path, Separator_Char) - 1)
           End If
           'Check if the title = remove then clear it...
           If Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Creating New File..." Then
                Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
           End If
Case 138 'Rename File
           Return_Path = Mid$(Function_Data, 6, InStr(1, Function_Data, Separator_Char) - 6) 'Ex: [E:\Old File.txt]
           New_Path = Mid$(Function_Data, InStr(1, Function_Data, Separator_Char) + 1) 'Ex [E:\New File.txt]
           Data = Mid$(New_Path, InStrRev(Return_Path, "\") + 1) 'Ex: [New File.txt]
           If Done = "True " Then
                Frm_Main.Files_Explore.ListItems(Return_Path).Key = New_Path 'Update The Key In the file list
                Frm_Main.Files_Explore.ListItems(New_Path).Text = Data 'Update The Text Viewed in the file list
                Frm_Main.Files_Explore.ListItems(New_Path).SmallIcon = CheckFileType(Data)
           ElseIf Done = "False" Then
                'The Return_path cotain information about the error description and the Path
                'The New_Path here contain the Errored old_path
                MsgBox "Error in Renaming Path [" & New_Path & "]", vbExclamation, Return_Path
           End If
          'Check if the title = rename then clear it...
           If Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Renaming File..." Then
                Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
           End If
Case 139 'Remove FIle
           If Done = "True " Then
                Frm_Main.Files_Explore.ListItems.Remove (Return_Path) 'Remove the Removed-File's Node
           ElseIf Done = "False" Then
                'The Return_path cotain information about the error description and the Path
                MsgBox "Error in Removing File [" & Mid$(Return_Path, InStr(1, Return_Path, Separator_Char) + 1) & "]" & vbCrLf & "Hint: The File may be ReadOnly!", vbExclamation, Mid$(Return_Path, 1, InStr(1, Return_Path, Separator_Char) - 1)
           End If
          'Check if the title = remove then clear it...
           If Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Removing File..." Then
                Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
           End If
Case 140 'Set Attributes
           Old_Path = Mid$(Return_Path, 1, InStr(1, Return_Path, Separator_Char) - 1) 'The File
           Data = Mid$(Return_Path, Len(Old_Path) + 2) 'The Atrrinbut Values or the error disciption
           If Done = "True " Then
               'Modify The Attributes in the file view
                Data = Asc(Data) 'The Atrributes Value
                If Data And vbReadOnly Then
                    Frm_Main.Files_Explore.ListItems(Old_Path).SubItems(2) = "Yes"
                Else
                    Frm_Main.Files_Explore.ListItems(Old_Path).SubItems(2) = ""
                End If
                If Data And vbHidden Then
                    Frm_Main.Files_Explore.ListItems(Old_Path).SubItems(3) = "Yes"
                Else
                    Frm_Main.Files_Explore.ListItems(Old_Path).SubItems(3) = ""
                End If
                If Data And vbSystem Then
                    Frm_Main.Files_Explore.ListItems(Old_Path).SubItems(4) = "Yes"
                Else
                    Frm_Main.Files_Explore.ListItems(Old_Path).SubItems(4) = ""
                End If
           ElseIf Done = "False" Then
                'The Return_path cotain information about the error description and the Path
                MsgBox "Error in Modifying Attributes of File [" & Mid$(Return_Path, InStr(1, Return_Path, Separator_Char) + 1) & "]", vbExclamation, Mid$(Return_Path, 1, InStr(1, Return_Path, Separator_Char) - 1)
           End If
          'Check if the title = Modifying File Atrributes... then clear it...
           If Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Modifying File Atrributes..." Then
                Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
           End If
Case 141 'Execute File
           If Done = "True " Then
                'Do Noting
           ElseIf Done = "False" Then
                'The Return_path cotain information about the error description and the Path
                MsgBox "Error in Executing File [" & Mid$(Return_Path, InStr(1, Return_Path, Separator_Char) + 1) & "]", vbExclamation, Mid$(Return_Path, 1, InStr(1, Return_Path, Separator_Char) - 1)
           End If
          'Check if the title = "Executing File..." then clear it...
           If Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Executing File..." Then
                Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
           End If
Case 142 'Print File
       
Case 143 'DownLoad File
           If Done = "True " Then
                Dim FileOffset As Long
                FileOffset = Long_Representation(Left$(Return_Path, 4))
                Return_Path = Mid$(Return_Path, 5) 'The Rest of the File Info
                New_Path = Mid$(Return_Path, 1, InStr(1, Return_Path, Separator_Char) - 1) 'The File Path
                Data = Mid$(Return_Path, Len(New_Path) + 2)
                DownloadManager.Accept_Data New_Path, FileOffset, Data
           ElseIf Done = "False" Then
                'The Return_path cotain information about the error description and the Path
                New_Path = Mid$(Return_Path, 1, InStr(1, Return_Path, Separator_Char) - 1)
                Data = Mid$(Return_Path, Len(New_Path) + 2)
                'Data is The Error Description
                'Bug : Disable Error Messaging Until Data Integrity Check Completed
                'Tell The Download Manager about That Error
                DownloadManager.Error_Handel (New_Path)
           Else
                'MsgBox Return_Path, , "Non Reguler Data"
           End If
Case 144 'Upload File
           If Done = "True " Then
                FileOffset = Long_Representation(Left$(Return_Path, 4))
                New_Path = Mid$(Return_Path, 5) 'The File Path
                'Acknowlege The Upload Manager with that message
                FileBrowser.Upload_ACk New_Path, FileOffset
           ElseIf Done = "False" Then
                'The Return_path cotain information about the error description and the Path
                New_Path = Mid$(Return_Path, 1, InStr(1, Return_Path, Separator_Char) - 1)
                Data = Mid$(Return_Path, Len(New_Path) + 2)
                'Data is The Error Description
                MsgBox "Error In Uploading file[" & New_Path & "]", vbExclamation, Data
                'Tell The Upload Manager about That Error
                FileBrowser.Upload_NAK (New_Path)
           End If
Case 145 'Find File
           'We need the following variables (parent_path,pattern,signal,data)
           'Function_data contains the whole data
           'Return_path is the patters and new_path is the kind of comming data
            Parent_Dir = Mid$(Function_Data, 1, InStr(1, Function_Data, Separator_Char) - 1) 'Parent Dir
            Function_Data = Mid$(Function_Data, Len(Parent_Dir) + 2)
            Return_Path = Mid$(Function_Data, 1, InStr(1, Function_Data, Separator_Char) - 1) 'Pattern
            Function_Data = Mid$(Function_Data, Len(Return_Path) + 2)
            New_Path = Left$(Function_Data, 1)
            Data = Mid$(Function_Data, 2)  'The Result Body(Direct Data or File Contains The Data
            Select Case Asc(New_Path)
                Case 13 'Nothing Found
                    MsgBox "No match items for this search :- " & vbCrLf & vbCrLf & "Parent Path : [" & Parent_Dir & "]" & vbCrLf & "Searched Pattern : [" & Return_Path & "]" & vbCrLf & vbCrLf & Data, vbInformation, "Searshing Results"
                Case 14 'Found And Result is the Data
                    Dim Editor_String As String
                    Editor_String = "Search Results..." & vbCrLf & vbCrLf
                    Editor_String = Editor_String & "Parent Path :[" & Parent_Dir & "]" & vbCrLf
                    Editor_String = Editor_String & "Searched Pattern :[" & Return_Path & "]" & vbCrLf & vbCrLf
                    Editor_String = Editor_String & "The Result :-" & vbCrLf & "------------" & vbCrLf & vbCrLf
                    Editor_String = Editor_String & Data
                    Editor.Txt_Screen = Editor_String
                    Editor.Show
                Case 15 'Found And Result stored into a file and the Path To The File is the Data
                    Dim Size As Long
                    Size = Long_Representation(Left$(Data, 4)) 'File Size
                    Data = Mid$(Data, 5)
                   'Add The File As A system file to Download Manager
                    DownloadManager.Accept_File_Disk Data, Size, 1, "Search Results."
                    MsgBox "The Search results are added to  X-Downloader,Check there!"
            End Select
           If Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Searching For [" & Return_Path & "] ..." Then
                Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
           End If
Case 146 'Get_File_Information For The Download manager
           New_Path = Mid$(Return_Path, 1, InStr(1, Return_Path, Separator_Char) - 1)
           Data = Mid$(Return_Path, Len(New_Path) + 2)
           If Done = "True " Then
                'Start To Download The File
                DownloadManager.Accept_File_Disk New_Path, Long_Representation(Data), 1
           ElseIf Done = "False" Then
                'The Return_path cotain information about the error description and the Path
                MsgBox "Error in Adding The File [" & New_Path & "] To Download Manager", vbExclamation, Data
           End If
Case 147 'CopyTo / MoveTo Files
           Dim CopyOrMove As Byte
           CopyOrMove = Asc(Left$(Return_Path, 1))
           Return_Path = Mid$(Return_Path, 2) 'Stretch The Comming data to include the old/new Filenames
           Old_Path = Mid$(Return_Path, 1, InStr(1, Return_Path, Separator_Char) - 1)
           If Done = "True " Then
                New_Path = Mid$(Return_Path, Len(Old_Path) + 2)
                If CopyOrMove = 30 Then 'Old_Path IS frequantly Moved to the New_Path
                    Frm_Main.Files_Explore.ListItems.Remove (Old_Path) 'Remove The Old_Path File from the current directory
                    'Bug : If The user used the move to rename a file it will removed from the list view and not updated as normal
                End If
           ElseIf Done = "False" Then
                Data = Mid$(Return_Path, Len(Old_Path) + 2)
               'Error Message
                If CopyOrMove = 20 Then 'Old_Path Is failed to be Copied to New_Path
                    Return_Path = "Error Is Occured During Copying Operation !"
                Else 'Old_Path Is failed to be Moved to New_Path
                    Return_Path = "Error Is Occured During Moveing Operation !"
                End If
                MsgBox Return_Path & vbCrLf & vbCrLf & "Source File: [" & Old_Path & "]" & vbCrLf & "Error Discription: [" & Data _
                    & "]" & vbCrLf & "Hint : [Ensure Letter's Case]", vbExclamation, AppName
           End If
          'Del Current FileBrowser Title If It Matched
           If CopyOrMove = 20 Then 'Old_Path Is failed to be Copied to New_Path
                If Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Copying File ..." Then
                    Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
                End If
           Else 'Old_Path Is failed to be Moved to New_Path
                If Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Moveing File ..." Then
                    Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
                End If
           End If
Case 148
       '........
       
Case 159 'last Reserved Command
End Select
End Sub
Public Sub DirsExploreDblClick()
    On Error Resume Next
    Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Loading Directories..."
    Frm_Main.Files_Explore.Tag = Frm_Main.Dirs_Explore.SelectedItem.Key 'Set The Path of the current files exploreing items
    If Frm_Main.Send_Data(Chr$(129) & Frm_Main.Dirs_Explore.SelectedItem.Key) = False Then 'Ask Server for the DirsIn the Clicked Path
        Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
    End If
End Sub
Public Sub DirsExplorelClick()
   'Update The Bar Discription under the File Browser Window
    Update_Description
End Sub
Public Sub GiveDetailsAbtFBitems()
    'Collect and show the file details
     Dim Msg As String
     Dim ItemID As Integer
     With Frm_Main.Files_Explore
         ItemID = .SelectedItem.Index
        'Collect Information
         Msg = "File Details :-" & vbCrLf
         Msg = Msg & "---------------------" & vbCrLf & vbCrLf
         Msg = Msg & "File Name : " & .ListItems(ItemID).Text & vbCrLf
         Msg = Msg & "File Path : " & .Tag
         Msg = Msg & "File Size : " & .ListItems(ItemID).SubItems(1) & vbCrLf
         Msg = Msg & "Is File Read only ? " & .ListItems(ItemID).SubItems(2) & vbCrLf
         Msg = Msg & "Is File Hidden ? " & .ListItems(ItemID).SubItems(3) & vbCrLf
         Msg = Msg & "Is File System ? " & .ListItems(ItemID).SubItems(4) & vbCrLf
     End With
    'Show Information
     Editor.SetString Msg, "File details"
End Sub
Private Sub Update_Description()
'This Fuction Updates the Address Bar At The Button
On Error Resume Next
    Dim i As Integer, Is_Derive As Boolean
    Dim Node_Key As String
    Node_Key = Frm_Main.Dirs_Explore.SelectedItem.Key
    For i = 0 To UBound(Drives)
        If Left$(Drives(i).StrName, 3) = Node_Key Then Is_Derive = True: Exit For
    Next
   'Explore
    If Is_Derive = True Then
        Dim Msg As String
        Msg = Drives(i).StrTotal & " | "
        Msg = Msg & Drives(i).StrUsed & " | "
        Msg = Msg & Drives(i).StrFree & " | "
        Msg = Msg & Drives(i).StrUserFree
       'Print Drive Information
        Frm_Main.bar(2) = " " & Left$(Drives(i).StrName, 3) & " (" & Msg & ")" 'Write the Drive proparties
    Else
        Frm_Main.bar(2) = " " & Node_Key   'Hide drives information
    End If
End Sub
Private Function Insert_Dirs(Parent As String, Dirs As String)
On Error Resume Next
  Dim Child_Dirs() As String, i As Integer
  Child_Dirs = Split(Dirs, vbCrLf)
  For i = 0 To UBound(Child_Dirs) - 1
    Frm_Main.Dirs_Explore.Nodes.Add Parent, 4, AddBackslash(Parent) & Child_Dirs(i), Child_Dirs(i)
  Next i
  Frm_Main.Dirs_Explore.Refresh
End Function
Private Function CheckFileType(FileName As String) As String
'The Function Return The Tag of the type found , Else return None
Dim i As Integer, j As Integer  'General Counters
CheckFileType = "None"
For i = 0 To UBound(FileTypes)
    For j = 0 To UBound(FileTypes(i).ExtensionsArray)
        If LCase(Right$(FileName, Len(FileTypes(i).ExtensionsArray(j)))) = FileTypes(i).ExtensionsArray(j) Then
           'Type Identified
            CheckFileType = FileTypes(i).Tag
            Exit Function
        End If
    Next j
Next i
End Function
Public Sub Insert_Files(Parent As String, files As String) 'Public for "ComplieSystemFiles"
On Error Resume Next
    Dim Child_Files() As String
    Dim Subs(2) As String, Current_Item As String
    Dim FileIcon As String 'Represent The Tag In The Image List
    Dim i As Integer 'General Counter
    Frm_Main.Files_Explore.ListItems.Clear
    Frm_Main.Files_Explore.Refresh
    Child_Files = Split(files, vbCrLf)
    For i = 0 To UBound(Child_Files) - 1
        Subs(0) = Mid$(Child_Files(i), 1, InStr(1, Child_Files(i), "|") - 1) 'File Name
        Subs(1) = Mid$(Child_Files(i), Len(Subs(0)) + 2, 4)
        Subs(2) = Mid$(Child_Files(i), Len(Subs(0)) + Len(Subs(1)) + 3)
        Current_Item = AddBackslash(Parent) & Subs(0)
       'Take Care Of The File Icons
        FileIcon = CheckFileType(Subs(0))
        Frm_Main.Files_Explore.ListItems.Add , Current_Item, Subs(0), FileIcon, FileIcon
        'The Size
        Frm_Main.Files_Explore.ListItems(Current_Item).SubItems(1) = String_Size(Long_Representation(Subs(1)))
        Frm_Main.Files_Explore.ListItems(Current_Item).Tag = Long_Representation(Subs(1))
       'Put Attributes
        If Val(Subs(2)) And vbReadOnly Then Frm_Main.Files_Explore.ListItems(Current_Item).SubItems(2) = "Yes"
        If Val(Subs(2)) And vbHidden Then Frm_Main.Files_Explore.ListItems(Current_Item).SubItems(3) = "Yes"
        If Val(Subs(2)) And vbSystem Then Frm_Main.Files_Explore.ListItems(Current_Item).SubItems(4) = "Yes"
        Frm_Main.Files_Explore.Refresh
    Next i
    Frm_Main.Files_Explore.Refresh
    Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>_"
End Sub
Public Sub FileBrowserButtons(Index As Integer)
Dim Old_Path As String, New_Path As String
Dim Data As String, i As Integer
    Select Case Index
Case 0 'Relaod Directory View
                LoadDrives 'Call LoadDrives Function to load the drives of the Current remoted system
Case 1 'New Folder
           On Error GoTo Err1
                Old_Path = Frm_Main.Dirs_Explore.SelectedItem.Key
                If Old_Path = "My Computer" Then GoTo Err1 'Check My Computer selection
                New_Path = InputBox("Enter The New Folder Name...", "Creating New Folder", "New Folder")
                If (Trim$(New_Path) = "") Then Exit Sub      'Check Cancel OR No Changes been made
                Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Creating New Directory..."
                New_Path = AddBackslash(Old_Path) & New_Path
                Frm_Main.Send_Data Chr$(134) & New_Path
                Exit Sub
Err1:
                MsgBox "No valid selected drive or directory", vbExclamation, "Error !"
           Case 2 'rename Directory
                On Error GoTo Err2
                    Old_Path = Frm_Main.Dirs_Explore.SelectedItem.Key
                    If Len(Old_Path) = 3 Then GoTo Err2 'Check Drive Selection
                    If Old_Path = "My Computer" Then GoTo Err2 'Check My Computer selection
                    New_Path = InputBox("Enter New Path...", "Renaming Directory", Old_Path)
                    If (New_Path = Old_Path Or Trim$(New_Path) = "") Then Exit Sub      'Check Cancel OR No Changes been made
                    Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Renaming Directory..."
                    Frm_Main.Send_Data Chr$(135) & Old_Path & Separator_Char & New_Path
                    Exit Sub
Err2:
                MsgBox "Invalid Directory Name or No Valid Selected Directory", vbExclamation, "Error !"
Case 3 'Removeing Directory
                On Error GoTo Err3
                    Old_Path = Frm_Main.Dirs_Explore.SelectedItem.Key
                    If Len(Old_Path) = 3 Then GoTo Err3 'Check Drive Selection
                    If Old_Path = "My Computer" Then GoTo Err3 'Check My Computer selection
                    If MsgBox("Are You Sure you want to remove this directory [" & Old_Path & "] ?", vbQuestion + vbYesNo, AppName) = vbYes Then
                        Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Removing Directory..."
                        Frm_Main.Send_Data Chr$(136) & Old_Path
                    End If
                    Exit Sub
Err3:
                MsgBox "No Valid Selected Directory", vbExclamation, "Error !"
Case 4 'Search Folder
                On Error GoTo Err4
                    Old_Path = AddBackslash(Frm_Main.Dirs_Explore.SelectedItem.Key)
                    If Old_Path = "My Computer" Then GoTo Err4 'Check My Computer selection
                    FileBrowser.Search_Entry (Old_Path)
                    New_Path = File_Browser_Search_Value
                    If Len(New_Path) Then
                        'Attend User That the search Operation Start
                        Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Searching For [" & New_Path & "] ..."
                        Frm_Main.Send_Data Chr$(145) & Old_Path & Separator_Char & New_Path
                    End If
                    Exit Sub
Err4:
                MsgBox "No Valid Selected Path", vbExclamation, "Error !"
Case 5 'Reaload files
                On Error GoTo Err5
                    Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Loading Files..."
                    Frm_Main.Send_Data Chr$(129) & Frm_Main.Dirs_Explore.SelectedItem.Key
                Exit Sub
Err5:
                MsgBox "No Current Selected Drive or Directory", vbExclamation, "Error !"
Case 6 'New File
           On Error GoTo Err6
                Old_Path = Frm_Main.Dirs_Explore.SelectedItem.Key
                If Old_Path = "My Computer" Then GoTo Err6 'Check My Computer selection
                New_Path = InputBox("Enter The New File Name...", "Creating New File", "New File.txt")
                If Trim$(New_Path) <> "" Then
                    Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Creating New File..."
                    New_Path = AddBackslash(Old_Path) & New_Path
                    Frm_Main.Send_Data Chr$(137) & New_Path
                End If
                    Exit Sub
Err6:
                MsgBox "No Valid Selected Drive or Directory", vbExclamation, "Error !"
Case 7 'Rename File
                On Error GoTo Err7
                    Old_Path = Frm_Main.Files_Explore.SelectedItem.Key 'Ex: [C:\Windows\Old File.txt]
                    Data = Mid$(Old_Path, InStrRev(Old_Path, "\") + 1) 'Ex: [Old File]
                    If Old_Path = "My Computer" Then GoTo Err7 'Check My Computer selection
                    New_Path = InputBox("Enter New Name...", "Renaming File", Data) 'Ex: [New File.txt]
                    If (New_Path = Data Or Trim$(New_Path) = "") Then Exit Sub      'Check Cancel OR No Changes been made
                    New_Path = Mid$(Old_Path, 1, Len(Old_Path) - Len(Data)) & New_Path 'Ex: [C:\Windows\New File.txt]
                    Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Renaming File..."
                    Frm_Main.Send_Data Chr$(138) & Old_Path & Separator_Char & New_Path
                    Exit Sub
Err7:
                MsgBox "No Valid Selected File", vbExclamation, "Error !"
Case 8 'Remove File
                On Error GoTo Err8
                    Old_Path = Frm_Main.Files_Explore.SelectedItem.Key 'Ex: [C:\Windows\Old File.txt]
                    If MsgBox("Are You Sure Removing [" & Old_Path & "] ?", vbQuestion + vbYesNo, AppName) = vbYes Then
                        Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Removing File..."
                        Frm_Main.Send_Data Chr$(139) & Old_Path
                    End If
                    Exit Sub
Err8:
                MsgBox "No Valid Selected File", vbExclamation, "Error !"
Case 9 'Modify Attributes
                'Read The Selected File
                On Error GoTo Err9
                    Old_Path = Frm_Main.Files_Explore.SelectedItem.Key 'Ex: [C:\Windows\Old File.txt]
                   'Read The File Information Into The FileBrowser\Modify Attributes Form
                    FileBrowser.FileName(0) = Old_Path
                    FileBrowser.Attributes(1).Value = 1
                    For i = 2 To 4
                        FileBrowser.Attributes(i).Value = 0
                        If (Len(Frm_Main.Files_Explore.ListItems(Old_Path).SubItems(i)) = 3) Then FileBrowser.Attributes(i).Value = 1
                        FileBrowser.Attributes(1).Value = FileBrowser.Attributes(1).Value And Not FileBrowser.Attributes(i).Value
                    Next
                    FileBrowser.Modify_Attributes
                   'Check Cancel Pressed ??
                    If File_Browser_Attributes_Value = 255 Then Exit Sub
                   'Else
                    Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Modifying File Atrributes..."
                    Frm_Main.Send_Data Chr$(140) & Old_Path & Separator_Char & Chr$(File_Browser_Attributes_Value)
                    Exit Sub
Err9:
                MsgBox "No Valid Selected File", vbExclamation, "Error !"
Case 10 'Execute File
                'Read The Selected File
                On Error GoTo Err10
                    Old_Path = Frm_Main.Files_Explore.SelectedItem.Key 'Ex: [C:\Windows\Old File.txt]
                    FileBrowser.FileName(1) = Old_Path
                    FileBrowser.Shell_Execute
                   'Check Cancel Pressed ??
                    If File_Browser_Shell_Value = 255 Then Exit Sub
                   'Else
                    Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Executing File..."
                    Frm_Main.Send_Data Chr$(141) & Old_Path & Separator_Char & Chr$(File_Browser_Shell_Value)
                    Exit Sub
Err10:
                MsgBox "No Valid Selected File", vbExclamation, "Error !"
Case 11 'CopyTo/MoveTo
                'Read The Selected File
                On Error GoTo Err11
                    Old_Path = Frm_Main.Files_Explore.SelectedItem.Key 'Ex: [C:\Windows\Old File.txt]
                    FileBrowser.CopyTo_MoveTo Old_Path, 20
                   'Check Cancel Pressed ??
                    If File_Browser_Copy_Move.CopyOrMove = 0 Then
                        Exit Sub
                    ElseIf File_Browser_Copy_Move.CopyOrMove = 20 Then
                        Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Copying File ..."
                    Else
                        Frm_Main.RoomTitle(2) = "\Handle-X\File Browser :\>" & "Moveing File ..."
                    End If
                    Frm_Main.Send_Data (Chr$(147) & Chr$(File_Browser_Copy_Move.CopyOrMove) & File_Browser_Copy_Move.OldPath & Separator_Char & File_Browser_Copy_Move.NewPath)
                    Exit Sub
Err11:
                MsgBox "There Is No Valid Selected Source File", vbExclamation, "Error !"
Case 12 'Append File
                MsgBox "This Action Is Not Supported In This Version.", vbExclamation, AppName
Case 13 'Print File
                MsgBox "This Action Is Not Supported In This Version.", vbExclamation, AppName
Case 14 'Add to Download Manager
                'Read The Selected File
                On Error GoTo Err14
                    Old_Path = Frm_Main.Files_Explore.SelectedItem.Key 'Ex: [C:\Windows\Old File.txt]
                    If MsgBox("Are You Sure Adding [" & Old_Path & "] To The Download Mnagager?", vbQuestion + vbYesNo, AppName) = vbYes Then
                        DownloadManager.Accept_File_Disk Old_Path, Frm_Main.Files_Explore.ListItems(Old_Path).Tag, 0, "New Threat!"
                    End If
                    Exit Sub
Err14:
                MsgBox "No Valid Selected File", vbExclamation, "Error !"
Case 15 'Upload File
                'Read The Selected File
                On Error GoTo Err15
                    Old_Path = Frm_Main.Dirs_Explore.SelectedItem.Key 'Ex: [C:\Windows\Old File.txt]
                    FileBrowser.Upload_File AddBackslash(Old_Path)
                    Exit Sub
Err15:
                MsgBox "No Valid Selected Path", vbExclamation, "Error !"
    End Select
End Sub
