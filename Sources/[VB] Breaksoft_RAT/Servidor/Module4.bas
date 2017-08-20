Attribute VB_Name = "Module4"
Option Explicit

Public Declare Function timeGetSystemTime Lib "winmm.dll" (lpTime As MMTIME, ByVal uSize As Long) As Long
Type smpte
      hour As Byte
      min As Byte
      sec As Byte
      frame As Byte
      fps As Byte
      dummy As Byte
      pad(2) As Byte
End Type
Type MMTIME
      wType As Long
      units As Long
      smtpeVal As smpte
      songptrpos As Long
End Type



