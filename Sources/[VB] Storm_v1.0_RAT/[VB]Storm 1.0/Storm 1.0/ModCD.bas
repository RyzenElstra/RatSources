Attribute VB_Name = "ModCD"
Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As Any, ByVal uReturnLength As Long, ByVal hWndCallback As Long) As Long
Declare Function sndPlaySound Lib "winmm" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
Public Const SND_SYNC = &H0         '  play synchronously (default)
Public Const SND_ASYNC = &H1        '  play asynchronously
Public Const SND_LOOP = &H8         '  loop the sound until next sndPlaySound
Public lRet As Long

Sub OpenCDTray()
lRet = mciSendString("set cdaudio door open", 0&, 0, 0)
End Sub

Sub CloseCDTray()
lRet = mciSendString("set cdaudio door closed", 0&, 0, 0)
End Sub

Sub PlaySound(SoundFile, Loopy As Boolean)
If Loopy = True Then
    sndPlaySound SoundFile, SND_LOOP
Else
    sndPlaySound SoundFile, SND_ASYNC
End If
End Sub
