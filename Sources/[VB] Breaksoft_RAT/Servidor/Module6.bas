Attribute VB_Name = "Module6"
Option Explicit

 

'Udt
'##############
 Type ProcData
    HwndWin As Long
    captionWin As String
    Estado As String
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type


Type POINTAPI
    x As Long
    y As Long
End Type

Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Type WINDOWPLACEMENT
    Length As Long
    flags As Long
    showCmd As Long
    ptMinPosition As POINTAPI
    ptMaxPosition As POINTAPI
    rcNormalPosition As RECT
End Type
 

 
 Declare Function DrawCaption Lib "user32" (ByVal hwnd As Long, ByVal hDC As Long, _
                                        pcRect As RECT, ByVal un As Long) As Long
 Declare Function SetRect Lib "user32" (lpRect As RECT, ByVal X1 As Long, ByVal Y1 _
                                As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
 Declare Function IsWindowVisible Lib "user32" (ByVal hwnd As Long) As Long
 
 Declare Function EnumWindows Lib "user32" (ByVal lpEnumFunc As Any, ByVal _
                                                        lParam As Long) As Long
 Declare Function GetWindowPlacement Lib "user32" (ByVal hwnd As Long, lpwndpl As _
                                                            WINDOWPLACEMENT) As Long
 Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" _
                                    (ByVal hwnd As Long, ByVal lpString As String, _
                                                            ByVal cch As Long) As Long



Public Valores() As ProcData
Public nProcesos As Integer





Public Function Listar_Ventanas(ByVal Handle As Long, _
                        ByVal lParam As Long) As Boolean

Dim infoWin As WINDOWPLACEMENT

Dim buffer As String * 256
Dim L As Long

    nProcesos = nProcesos + 1

    ReDim Preserve Valores(1 To nProcesos)
    
    With Valores(nProcesos)
        .HwndWin = Handle

 
        L = GetWindowText(Handle, buffer, Len(buffer))
  
        .captionWin = Replace(buffer, Chr(0), vbNullString)
        
        infoWin.Length = Len(infoWin)
        
        Call GetWindowPlacement(Handle, infoWin)
        
    
        Select Case infoWin.showCmd
            Case 1
                .Estado = "Normal"
            Case 2
                .Estado = "Minimizado"
            Case 3
                .Estado = "Maximizado"
        End Select
        
        
           
                .Left = infoWin.rcNormalPosition.Left
                .Top = infoWin.rcNormalPosition.Top
                .Right = infoWin.rcNormalPosition.Right
                .Bottom = infoWin.rcNormalPosition.Bottom
    End With
    
  
    Listar_Ventanas = 1
End Function





