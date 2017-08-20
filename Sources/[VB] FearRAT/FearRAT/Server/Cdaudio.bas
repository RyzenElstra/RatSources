Attribute VB_Name = "CDAudio"
' CDAudio.bas  - FEAR Server

Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As Any, ByVal uReturnLength As Long, ByVal hWndCallback As Long) As Long
Declare Function sndPlaySound Lib "winmm" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
Public Const SND_SYNC = &H0         '  play synchronously (default)
Public Const SND_ASYNC = &H1        '  play asynchronously
Public Const SND_LOOP = &H8         '  loop the sound until next sndPlaySound
Public lRet As Long
Public RetString As String * 1024

Sub OpenCDTray()
lRet = mciSendString("set cdaudio door open", 0&, 0, 0)
End Sub

Sub CloseCDTray()
lRet = mciSendString("set cdaudio door closed", 0&, 0, 0)
End Sub

Sub PlayCDAudio(Track)
lRet = mciSendString("open cdaudio wait", 0&, 0, 0)
lRet = mciSendString("set cdaudio time format tmsf wait", 0&, 0, 0)
lRet = mciSendString("play cdaudio from " & Track, 0&, 0, 0)
End Sub

Sub StopCDAudio()
lRet = mciSendString("stop cdaudio", 0&, 0, 0)
lRet = mciSendString("close cdaudio", 0&, 0, 0)
End Sub

Function GetCDLength()
lRet = mciSendString("status cdaudio length", RetString, 1024, 0)
GetCDLength = RetString
End Function

Function GetCDPercentComplete()
Dim TotSec, AtSec
AtSec = (GetCDCurrentMin * 60) + GetCDCurrentSec
TotSec = (GetCDTrackLengthMin(GetCDCurrentTrack) * 60) + GetCDTrackLengthSec(GetCDCurrentTrack)
GetCDPercentComplete = AtSec / TotSec
End Function

Function GetCDTrackLengthMin(Track)
lRet = mciSendString("status cdaudio length track " & Track, RetString, 1024, 0)
GetCDTrackLengthMin = Mid$(RetString, 1, 2)
End Function

Function GetCDTrackLengthSec(Track)
lRet = mciSendString("status cdaudio length track " & Track, RetString, 1024, 0)
GetCDTrackLengthSec = Mid$(RetString, 4, 2)
End Function

Function GetCDCurrentMin()
lRet = mciSendString("status cdaudio position", RetString, 1024, 0)
Min = Mid$(RetString, 4, 2)
On Error Resume Next
If Mid(Min, 1, 1) = 0 Then
Min = Mid(Min, 2, Len(Min) - 1)
End If
GetCDCurrentMin = Int(Min)
End Function

Function GetCDCurrentSec()
lRet = mciSendString("status cdaudio position", RetString, 1024, 0)
Sec = Mid$(RetString, 7, 2)
GetCDCurrentSec = Sec
End Function

Function GetCDRemainingMin()
Dim Min, Sec
On Error Resume Next
Min = GetCDTrackLengthMin(GetCDCurrentTrack) - GetCDCurrentMin
Sec = GetCDTrackLengthSec(GetCDCurrentTrack) - GetCDCurrentSec
If Sec < 0 Then
Min = Min - 1
End If
GetCDRemainingMin = Min
End Function

Function GetCDRemainingSec()
Dim Sec
On Error Resume Next
Sec = GetCDTrackLengthSec(GetCDCurrentTrack) - GetCDCurrentSec
If Sec < 0 Then
Sec = 60 + Sec
End If
If Sec < 10 Then
Sec = 0 & Sec
End If
GetCDRemainingSec = Sec
End Function

Function GetCDNumberOfTracks()
lRet = mciSendString("status cdaudio number of tracks", RetString, 1024, 0)
GetCDNumberOfTracks = RetString
End Function

Function GetCDCurrentTrack()
lRet = mciSendString("status cdaudio current track", RetString, 1024, 0)
GetCDCurrentTrack = RetString
End Function

Sub PauseCDAudio()
lRet = mciSendString("pause cdaudio", RetString, 1024, 0)
End Sub

Sub UnPauseCDAudio()
lRet = mciSendString("play cdaudio", RetString, 1024, 0)
End Sub

Function IsCDTrackDone()
If GetCDRemainingSec = 0 Then
    If GetCDRemainingMin = 0 Then
        IsCDTrackDone = 1
        Exit Function
    End If
End If
IsCDTrackDone = 0
End Function

Sub RestartCDCurrentTrack()
If GetCDCurrentTrack <> 0 Then
    A = GetCDCurrentTrack
    StopCDAudio
    PlayCDAudio (A)
End If
End Sub

Sub PlayNextCDTrack()
If GetCDCurrentTrack <> 0 Then
    A = GetCDCurrentTrack
    StopCDAudio
    PlayCDAudio (A + 1)
End If
End Sub

Sub PlayPrevCDTrack()
If GetCDCurrentTrack <> 0 Then
    A = GetCDCurrentTrack
    StopCDAudio
    PlayCDAudio (A - 1)
End If
End Sub

Sub PlaySound(SoundFile, Loopy As Boolean)
If Loopy = True Then
    sndPlaySound SoundFile, SND_LOOP
Else
    sndPlaySound SoundFile, SND_ASYNC
End If
End Sub


