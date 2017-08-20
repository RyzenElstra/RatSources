VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsGradient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'I got this module from somewhere else but it is the module which applys
'the gradient to the pictures which are used in the status bar

Option Explicit

'Property Storage Variables
Private mlColor1    As Long
Private mlColor2    As Long
Private mfAngle     As Single

'Property Default Constants - Colors and Angle match Kath-Rock logo.
Private Const mlDefColor1   As Long = &HFFFFD0  'Very Light Blue
Private Const mlDefColor2   As Long = &H400000  'Very Dark Blue
Private Const mfDefAngle    As Single = 315     'Upper-Left to Lower-Right

'Misc Constants
Private Const PI    As Double = 3.14159265358979
Private Const RADS  As Double = PI / 180    '<Degrees> * RADS = radians

'TypeDefs
Private Type PointSng   'Internal Point structure
    X   As Single       'Uses Singles for more precision.
    Y   As Single
End Type

Private Type PointAPI   'API Point structure
    X   As Long
    Y   As Long
End Type

Private Type RectAPI    'API Rect structure
    Left    As Long
    Top     As Long
    Right   As Long
    Bottom  As Long
End Type

'API functions and Constants
Private Const PS_SOLID As Long = 0  'Solid Pen Style (Used for CreatePen())
Private Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function GetClientRect Lib "user32" (ByVal hWnd As Long, lpRect As RectAPI) As Long
Private Declare Function GetPixel Lib "gdi32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
Private Declare Function GetTickCount Lib "kernel32" () As Long
Private Declare Function LineTo Lib "gdi32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function LockWindowUpdate Lib "user32" (ByVal hWndLock As Long) As Long
Private Declare Function MoveToEx Lib "gdi32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long, lpPoint As PointAPI) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hDC As Long, ByVal hObject As Long) As Long

Public Function Draw(picObj As Object) As Boolean

'Note: This class uses API functions to draw. If the
'      destination object is in AutoRedraw mode, the
'      Refresh method for that object must be invoked.

'picObj can be a Form or PictureBox.

Dim lRet    As Long
Dim lIdx    As Long
Dim lTime   As Long
Dim uRect   As RectAPI

'    lTime = GetTickCount()
    
    On Error GoTo LocalError
    
    'Stop the window from updating until we're finished.
    lRet = LockWindowUpdate(picObj.hWnd)
    
    'Get the client rect in pixels
    lRet = GetClientRect(picObj.hWnd, uRect)
    
    'Test for possible errors (GetClientRect failure or Rect < 2 pixels)
    If lRet <> 0 Then
        If uRect.Right > 1 And uRect.Bottom > 1 Then
            lIdx = DrawGradient(picObj.hDC, uRect.Right, uRect.Bottom)
            Draw = (lIdx > 0)
        End If
    End If
    
    'My P3-500 took 99 millisecs (.099 secs) to create and draw 2554 diagonal
    'lines at 315 degrees. That was frmDemo maximized on a 1280 x 1024 screen.
    'At this speed I can redraw an entire 1280px. screen over 10 times per second.
    
    'Same size rect at a 0 degree angle took 48 millisecs (.048 secs) to create and
    'draw 1278 lines. This speed can redraw a 1280px. screen 20 times per second.
    
    'Uncomment the two lines below and the lTime line at the top
    'of this function to test the times on your PC.
    
'    lTime = GetTickCount() - lTime
'    MsgBox CStr(lIdx / 2) & " lines drawn in " & CStr(lTime) & " milliseconds"
        
NormalExit:
    'Unlock the window to allow it to update now.
    lRet = LockWindowUpdate(0)
    Exit Function
    
LocalError:
    MsgBox Err.Description, vbExclamation
    Resume NormalExit

End Function
Public Function BlendColors(ByVal lColor1 As Long, ByVal lColor2 As Long, ByVal lSteps As Long, laRetColors() As Long) As Long

'Creates an array of colors blending from
'Color1 to Color2 in lSteps number of steps.
'Returns the count and fills the laRetColors() array.

Dim lIdx    As Long
Dim lRed    As Long
Dim lGrn    As Long
Dim lBlu    As Long
Dim fRedStp As Single
Dim fGrnStp As Single
Dim fBluStp As Single

    'Stop possible error
    If lSteps < 2 Then lSteps = 2
    
    'Extract Red, Blue and Green values from the start and end colors.
    lRed = (lColor1 And &HFF&)
    lGrn = (lColor1 And &HFF00&) / &H100
    lBlu = (lColor1 And &HFF0000) / &H10000
    
    'Find the amount of change for each color element per color change.
    fRedStp = Div(CSng((lColor2 And &HFF&) - lRed), CSng(lSteps))
    fGrnStp = Div(CSng(((lColor2 And &HFF00&) / &H100&) - lGrn), CSng(lSteps))
    fBluStp = Div(CSng(((lColor2 And &HFF0000) / &H10000) - lBlu), CSng(lSteps))
    
    'Create the colors
    ReDim laRetColors(lSteps - 1)
    laRetColors(0) = lColor1            'First Color
    laRetColors(lSteps - 1) = lColor2   'Last Color
    For lIdx = 1 To lSteps - 2          'All Colors between
        laRetColors(lIdx) = CLng(lRed + (fRedStp * CSng(lIdx))) + _
            (CLng(lGrn + (fGrnStp * CSng(lIdx))) * &H100&) + _
            (CLng(lBlu + (fBluStp * CSng(lIdx))) * &H10000)
    Next lIdx
    
    'Return number of colors in array
    BlendColors = lSteps

End Function
Private Function DrawGradient(ByVal hDC As Long, ByVal lWidth As Long, ByVal lHeight As Long) As Long

Dim bDone       As Boolean
Dim iIncX       As Integer
Dim iIncY       As Integer
Dim lIdx        As Long
Dim lRet        As Long
Dim hPen        As Long
Dim hOldPen     As Long
Dim lPointCnt   As Long
Dim laColors()  As Long
Dim fMovX       As Single
Dim fMovY       As Single
Dim fDist       As Single
Dim fAngle      As Single
Dim fLongSide   As Single
Dim uTmpPt      As PointAPI
Dim uaPts()     As PointAPI
Dim uaTmpPts()  As PointSng
    
    On Error GoTo LocalError
    
    'Start with center of rect
    ReDim uaTmpPts(2)
    uaTmpPts(2).X = Int(lWidth / 2)
    uaTmpPts(2).Y = Int(lHeight / 2)
    
    'Calc distance to furthest edge as if rect were square
    fLongSide = IIf(lWidth > lHeight, lWidth, lHeight)
    fDist = (Sqr((fLongSide ^ 2) + (fLongSide ^ 2)) + 2) / 2
    
    'Create points to the left and the right at a 0º angle (horizontal)
    uaTmpPts(0).X = uaTmpPts(2).X - fDist
    uaTmpPts(0).Y = uaTmpPts(2).Y
    uaTmpPts(1).X = uaTmpPts(2).X + fDist
    uaTmpPts(1).Y = uaTmpPts(2).Y
    
    'Lines will be drawn perpendicular to mfAngle so
    'add 90º and correct for 360º wrap
    fAngle = CDbl(mfAngle + 90) - Int(Int(CDbl(mfAngle + 90) / 360#) * 360#)
    
    'Rotate second and third points to fAngle
    Call RotatePoint(uaTmpPts(2), uaTmpPts(0), fAngle)
    Call RotatePoint(uaTmpPts(2), uaTmpPts(1), fAngle)
    
    'We now have a line that crosses the center and
    'two sides of the rect at the correct angle.
    
    'Calc the starting quadrant, direction of and amount of first move
    '(fMovX, fMovY moves line from center to starting edge)
    'and direction of each incremental move (iIncX, iIncY).
    Select Case mfAngle
        Case 0 To 90
            'Left Bottom
            If Abs(uaTmpPts(0).X - uaTmpPts(1).X) <= Abs(uaTmpPts(0).Y - uaTmpPts(1).Y) Then
                'Move line to left edge; Draw left to right
                fMovX = IIf(uaTmpPts(0).X > uaTmpPts(1).X, -uaTmpPts(0).X, -uaTmpPts(1).X)
                fMovY = 0
                iIncX = 1
                iIncY = 0
            Else
                'Move line to bottom edge; Draw bottom to top
                fMovX = 0
                fMovY = IIf(uaTmpPts(0).Y > uaTmpPts(1).Y, lHeight - uaTmpPts(1).Y, lHeight - uaTmpPts(0).Y)
                iIncX = 0
                iIncY = -1
            End If
        Case 90 To 180
            'Right Bottom
            If Abs(uaTmpPts(0).X - uaTmpPts(1).X) <= Abs(uaTmpPts(0).Y - uaTmpPts(1).Y) Then
                'Move line to right edge; Draw right to left
                fMovX = IIf(uaTmpPts(0).X > uaTmpPts(1).X, lWidth - uaTmpPts(1).X, lWidth - uaTmpPts(0).X)
                fMovY = 0
                iIncX = -1
                iIncY = 0
            Else
                'Move line to bottom edge; Draw bottom to top
                fMovX = 0
                fMovY = IIf(uaTmpPts(0).Y > uaTmpPts(1).Y, lHeight - uaTmpPts(1).Y, lHeight - uaTmpPts(0).Y)
                iIncX = 0
                iIncY = -1
            End If
        Case 180 To 270
            'Right Top
            If Abs(uaTmpPts(0).X - uaTmpPts(1).X) <= Abs(uaTmpPts(0).Y - uaTmpPts(1).Y) Then
                'Move line to right edge; Draw right to left
                fMovX = IIf(uaTmpPts(0).X > uaTmpPts(1).X, lWidth - uaTmpPts(1).X, lWidth - uaTmpPts(0).X)
                fMovY = 0
                iIncX = -1
                iIncY = 0
            Else
                'Move line to top edge; Draw top to bottom
                fMovX = 0
                fMovY = IIf(uaTmpPts(0).Y > uaTmpPts(1).Y, -uaTmpPts(0).Y, -uaTmpPts(1).Y)
                iIncX = 0
                iIncY = 1
            End If
        Case Else   '(270 to 360)
            'Left Top
            If Abs(uaTmpPts(0).X - uaTmpPts(1).X) <= Abs(uaTmpPts(0).Y - uaTmpPts(1).Y) Then
                'Move line to left edge; Draw left to right
                fMovX = IIf(uaTmpPts(0).X > uaTmpPts(1).X, -uaTmpPts(0).X, -uaTmpPts(1).X)
                fMovY = 0
                iIncX = 1
                iIncY = 0
            Else
                'Move line to top edge; Draw top to bottom
                fMovX = 0
                fMovY = IIf(uaTmpPts(0).Y > uaTmpPts(1).Y, -uaTmpPts(0).Y, -uaTmpPts(1).Y)
                iIncX = 0
                iIncY = 1
            End If
    End Select
    
    'At this point we could calculate where the lines will cross the rect edges, but
    'this would slow things down. The picObj clipping region will take care of this.
    
    'Start with 1000 points and add more if needed. This increases
    'speed by not re-dimming the array in each loop.
    ReDim uaPts(999)
    
    'Set the first two points in the array
    uaPts(0).X = uaTmpPts(0).X + fMovX
    uaPts(0).Y = uaTmpPts(0).Y + fMovY
    uaPts(1).X = uaTmpPts(1).X + fMovX
    uaPts(1).Y = uaTmpPts(1).Y + fMovY
    
    lIdx = 2
    'Create the rest of the points by incrementing both points
    'on each line iIncX, iIncY from the previous line's points.
    'Where we stop depends on the direction of travel.
    'We'll continue until both points in a set reach the end.
    While Not bDone
        uaPts(lIdx).X = uaPts(lIdx - 2).X + iIncX
        uaPts(lIdx).Y = uaPts(lIdx - 2).Y + iIncY
        lIdx = lIdx + 1
        Select Case True
            Case iIncX > 0  'Moving Left to Right
                bDone = uaPts(lIdx - 1).X > lWidth And uaPts(lIdx - 2).X > lWidth
            Case iIncX < 0  'Moving Right to Left
                bDone = uaPts(lIdx - 1).X < 0 And uaPts(lIdx - 2).X < 0
            Case iIncY > 0  'Moving Top to Bottom
                bDone = uaPts(lIdx - 1).Y > lHeight And uaPts(lIdx - 2).Y > lHeight
            Case iIncY < 0  'Moving Bottom to Top
                bDone = uaPts(lIdx - 1).Y < 0 And uaPts(lIdx - 2).Y < 0
        End Select
        If (lIdx Mod 1000) = 0 Then
            ReDim Preserve uaPts(UBound(uaPts) + 1000)
        End If
    Wend
    
    'Free excess memory (may have 1001 points dimmed to 2000)
    ReDim Preserve uaPts(lIdx - 1)
    
    'Create the array of colors blending from mlColor1 to mlColor2
    lRet = BlendColors(mlColor1, mlColor2, lIdx / 2, laColors)
    
    'Now draw each line in it's own color
    For lIdx = 0 To UBound(uaPts) - 1 Step 2
        'Move to next point
        lRet = MoveToEx(hDC, uaPts(lIdx).X, uaPts(lIdx).Y, uTmpPt)
        'Create the colored pen and select it into the DC
        hPen = CreatePen(PS_SOLID, 1, laColors(Int(lIdx / 2)))
        hOldPen = SelectObject(hDC, hPen)
        'Draw the line
        lRet = LineTo(hDC, uaPts(lIdx + 1).X, uaPts(lIdx + 1).Y)
        'Get the pen back out of the DC and destroy it
        lRet = SelectObject(hDC, hOldPen)
        lRet = DeleteObject(hPen)
    Next lIdx
    
    DrawGradient = lIdx
    
NormalExit:
    'Free the memory
    Erase laColors
    Erase uaPts
    Erase uaTmpPts
    Exit Function
    
LocalError:
    MsgBox Err.Description, vbExclamation, "GradientRect.cls"
    DrawGradient = 0
    Resume 'NormalExit
    
End Function

Private Sub RotatePoint(uAxisPt As PointSng, uRotatePt As PointSng, fDegrees As Single)

Dim fDX         As Single
Dim fDY         As Single
Dim fRadians    As Single

    fRadians = fDegrees * RADS
    fDX = uRotatePt.X - uAxisPt.X
    fDY = uRotatePt.Y - uAxisPt.Y
    uRotatePt.X = uAxisPt.X + ((fDX * Cos(fRadians)) + (fDY * Sin(fRadians)))
    uRotatePt.Y = uAxisPt.Y + -((fDX * Sin(fRadians)) - (fDY * Cos(fRadians)))
    
End Sub



Private Function Div(ByVal dNumer As Double, ByVal dDenom As Double) As Double
    
'Divides dNumer by dDenom if dDenom <> 0
'Eliminates 'Division By Zero' error.

    If dDenom <> 0 Then
        Div = dNumer / dDenom
    Else
        Div = 0
    End If

End Function

Public Property Let Color1(ByVal lData As Long)
    
Dim lIdx As Long

    mlColor1 = lData
    If mlColor1 < 0 Then
        lIdx = (mlColor1 And Not &H80000000)
        If lIdx >= 0 And lIdx <= 24 Then
            mlColor1 = GetSysColor(lIdx)
        End If
    End If
    
End Property


Public Property Get Color1() As Long
    Color1 = mlColor1
End Property



Public Property Let Color2(ByVal lData As Long)

Dim lIdx As Long

    mlColor2 = lData
    If mlColor2 < 0 Then
        lIdx = (mlColor2 And Not &H80000000)
        If lIdx >= 0 And lIdx <= 24 Then
            mlColor2 = GetSysColor(lIdx)
        End If
    End If

End Property


Public Property Get Color2() As Long
    Color2 = mlColor2
End Property



Public Property Let Angle(ByVal fData As Single)
    
'Angles are counter-clockwise and may be
'any Single value from 0 to 359.999999999.

' 135  90 45
'    \ | /
'180 --o-- 0
'    / | \
' 235 270 315

    'Correct angle to ensure between 0 and 359.999999999
    mfAngle = CDbl(fData) - Int(Int(CDbl(fData) / 360#) * 360#)

End Property


Public Property Get Angle() As Single
    Angle = mfAngle
End Property







Private Sub Class_Initialize()

    mlColor1 = mlDefColor1
    mlColor2 = mlDefColor2
    mfAngle = mfDefAngle
    
End Sub




