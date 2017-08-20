Attribute VB_Name = "MainMod"
Public Declare Function StrFormatByteSize Lib "shlwapi" Alias "StrFormatByteSizeA" (ByVal dw As Long, ByVal pszBuf As String, ByRef cchBuf As Long) As String

'shlwapi.dll is used to get the format of converting bytes
'into bytes, KB, MB and GB
Public Function FormatKB(ByVal Amount As Long) As String
    Dim Buffer As String
    Dim result As String
    Buffer = Space$(255)
    result = StrFormatByteSize(Amount, Buffer, Len(Buffer))
    If InStr(result, vbNullChar) > 1 Then FormatKB = Left$(result, InStr(result, vbNullChar) - 1)
End Function

Public Sub UnloadFormsOpen()
    
    On Error Resume Next
    Unload FrmPrintText
    Unload FrmRemoveDir
    Unload FrmDownload
    Unload FrmCreateDir
    Unload FrmFileBrowse
    Unload FrmBusy
    Unload FrmConnectionInfo
    Unload FrmKeyCtrls
    Unload FrmUpload
    
    'I found out infact that these loaded the forms at first and not unloaded them
    'This was a bad problem because all Form_Load() sub's started in the following forms
    'and lots of silly thing starting happening.
    
'    If FrmPrintText.Visible = True Then Unload FrmPrintText
'    If FrmRemoveDir.Visible = True Then Unload FrmRemoveDir
'    If FrmDownload.Visible = True Then Unload FrmDownload
'    If FrmCreateDir.Visible = True Then Unload FrmCreateDir
'    If FrmFileBrowse.Visible = True Then Unload FrmFileBrowse
'    If FrmBusy.Visible = True Then Unload FrmBusy
'    If FrmConnectionInfo.Visible = True Then Unload FrmConnectionInfo
'    If FrmKeyCtrls.Visible = True Then Unload FrmKeyCtrls
'    If FrmUpload.Visible = True Then Unload FrmUpload
    
End Sub
