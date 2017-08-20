Attribute VB_Name = "Module3"

Option Explicit

Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Public Const DRIVE_CDROM = 5
Public Const DRIVE_FIXED = 3
Public Const DRIVE_RAMDISK = 6
Public Const DRIVE_REMOTE = 4
Public Const DRIVE_REMOVABLE = 2


Public Sub Populate_Tree_With_Drives(sDrives As String, objTV As TreeView)

On Error GoTo Populate_Tree_With_Drives_Error

Dim objDriveCollection  As Collection
Dim lLoop               As Long
Dim sDriveLetter        As String
Dim iDriveType          As String
Dim objSngDrive         As Collection
Dim sImage              As String

    sDrives = Mid$(sDrives, 7, Len(sDrives))
    
    Set objDriveCollection = ParseString(sDrives, "|")
    
        For lLoop = 1 To objDriveCollection.Count
            
            Set objSngDrive = ParseString(objDriveCollection.Item(lLoop), ",")
                
            With objSngDrive
                sDriveLetter = .Item(1)
                iDriveType = CInt(.Item(2))
            End With
            
            Select Case iDriveType
               Case DRIVE_REMOVABLE
                    sImage = "FD"
               Case DRIVE_FIXED
                    sImage = "HD"
               Case DRIVE_REMOTE
                    sImage = "ND"
               Case DRIVE_CDROM
                    sImage = "CD"
               Case DRIVE_RAMDISK
                    sImage = "RAM Disk"
               Case Else
                    sImage = ""
            End Select
    
          objTV.Nodes.Add "xxxROOTxxx", tvwChild, sDriveLetter & ":\", sDriveLetter & ":\", sImage, sImage
            
        Next lLoop

Populate_Tree_With_Drives_Exit:
    Exit Sub

Populate_Tree_With_Drives_Error:
    Err.Raise Err.Number, "Procedure: Populate_Tree_With_Drives" & vbCrLf & "Module: modParser"
    Exit Sub

End Sub


Public Sub Populate_Files(sString As String, objLV As ListView)

On Error Resume Next

Dim objFileCollection       As Collection
Dim lLoop                   As Long
Dim sParentPath             As String
Dim sFile                   As String
Dim objSngFile              As Collection
Dim sFileList               As String
Dim objPartCollection       As Collection

    sFileList = Mid$(sString, 8, Len(sString))
    
     Form5.lvFiles.ListItems.Clear
     DoEvents
     
    Set objFileCollection = ParseString(sFileList, ",")
        
        With objFileCollection
            For lLoop = 1 To .Count
              
              If Len(Trim(.Item(lLoop))) <> 0 Then
                Set objPartCollection = ParseString(.Item(lLoop), "|")
                objLV.ListItems.Add , objPartCollection(1), Get_File_Name(objPartCollection(1)), "FILE"
                objLV.ListItems(objPartCollection(1)).SubItems(1) = objPartCollection(2)
              End If
            
            Next lLoop
        End With
        
End Sub


Public Function Get_File_Name(sString As String) As String



On Error GoTo Get_File_Name_Error

Dim lLoop As Long

    For lLoop = Len(sString) To 1 Step -1
    
        If Mid$(sString, lLoop, 1) = "\" Then
            Get_File_Name = Mid$(sString, lLoop + 1, Len(sString))
            Exit Function
        End If

    Next lLoop

Get_File_Name_Exit:
    Exit Function

Get_File_Name_Error:
    Err.Raise Err.Number, "Function: Get_File_Name" & vbCrLf & "Module: modParser"
    Exit Function
    
End Function


Public Function NormalizePath(sPath As String) As String
  
On Error GoTo NormalizePath_Error

  
  If Right$(sPath, 1) <> "\" Then
    NormalizePath = sPath & "\"
  Else
    NormalizePath = sPath
  End If
  
NormalizePath_Exit:
    Exit Function

NormalizePath_Error:
    Err.Raise Err.Number, "Function: NormalizePath" & vbCrLf & "Module: modParser"
    Exit Function
    
  
End Function

Public Function Populate_Folders(sFolderString As String, objTV As TreeView)


On Error Resume Next

Dim objFolderCollection     As Collection
Dim lLoop                   As Long
Dim sParentPath             As String
Dim sFolder                 As String
Dim objSngFolder            As Collection
Dim sFolderList             As String

sFolderList = Mid$(sFolderString, 10, Len(sFolderString))

Set objFolderCollection = ParseString(sFolderList, "|")

    For lLoop = 1 To objFolderCollection.Count
        
        Set objSngFolder = ParseString(objFolderCollection.Item(lLoop), ",")
            
        With objSngFolder
            sParentPath = .Item(1)
            sFolder = .Item(2)
        End With
        
        With objTV.Nodes
            If Len(sParentPath) > 4 Then
                .Add Mid$(sParentPath, 1, Len(sParentPath) - 1), tvwChild, sParentPath & sFolder, sFolder, "CLOSED", "OPEN"
            Else
                .Add sParentPath, tvwChild, sParentPath & sFolder, sFolder, "CLOSED", "OPEN"
            End If
        End With
        
    Next lLoop

End Function


Public Sub Delete_Child_Nodes(objTV As TreeView, nodSibling As Node)
  

On Error GoTo Delete_Child_Nodes_Error

Dim nodChild  As Node
  
    Do While (nodSibling Is Nothing) = False
        
        If nodSibling.Expanded Then
            Call Delete_Child_Nodes(objTV, nodSibling.Child)
        Else
            Set nodChild = nodSibling.Child
            Do While (nodChild Is Nothing) = False
                objTV.Nodes.Remove nodChild.Index
                Set nodChild = nodSibling.Child
            Loop
        End If
    
        Set nodSibling = nodSibling.Next
        
    Loop
    
Delete_Child_Nodes_Exit:
    Exit Sub

Delete_Child_Nodes_Error:
    Err.Raise Err.Number, "Procedure: Delete_Child_Nodes" & vbCrLf & "Module: modParser"
    Exit Sub
    
End Sub


Function ParseString(ByVal sString As String, ByVal Delimiter As String) As Collection


On Error GoTo ParseString_Error


Dim CurPos       As Long
Dim lNextPos     As Long
Dim iDelLen      As Integer
Dim iCount       As Integer
        
      Set ParseString = New Collection
        
      
      sString = Delimiter & sString & Delimiter

      iDelLen = Len(Delimiter)
      
      
      iCount = 0: CurPos = 1
      lNextPos = InStr(CurPos + iDelLen, sString, Delimiter)

      
      Do Until lNextPos = 0
         
         ParseString.Add Mid$(sString, CurPos + iDelLen, lNextPos - CurPos - iDelLen)
         iCount = iCount + 1
         CurPos = lNextPos
         lNextPos = InStr(CurPos + iDelLen, sString, Delimiter)
      Loop

ParseString_Exit:
    Exit Function

ParseString_Error:
    Err.Raise Err.Number, "ParseString" & vbCrLf & "Module: modParser"
    Exit Function

End Function


