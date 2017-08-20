VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   DrawStyle       =   5  'Transparent
   FillStyle       =   0  'Solid
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   21.75
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   FontTransparent =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   NegotiateMenus  =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.Timer tmrMain 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   2760
      Top             =   720
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

Select Case KeyCode
  Case vbKeyEscape
    dxDirectDraw7.RestoreDisplayMode
    dxDirectDraw7.SetCooperativeLevel Form1.hwnd, DDSCL_NORMAL
    ShowCursor (1)
    End
  Case vbKeyP
    If tmrMain.Enabled = False Then tmrMain.Enabled = True Else: tmrMain.Enabled = False
End Select


End Sub


Private Sub Form_Load()
SetupProg

Randomize

srfFront.SetFontBackColor vbBlack
srfFront.SetFontTransparency False


With fntCustom
    .Name = "Matrix"
    .Size = 8
    .Bold = False
End With

srfFront.SetFont fntCustom

Dim i As Integer, h As Integer


For i = 0 To 79
    intColumn(i).intLength = Int(Rnd * 10) + 30
    ReDim intColumn(i).Item(intColumn(i).intLength)
    intColumn(i).booActive = False
    intColumn(i).intCounter = 0
    intColumn(i).booOffScreen = False
    intColumn(i).intX = i
    intColumn(i).intY = 0
    For h = 0 To intColumn(i).intLength
        intColumn(i).Item(h).intCharacter = Int(Rnd * 43) + 65
        intColumn(i).Item(h).intGreenColour = Int(Rnd * 255)
    Next h
Next i

intTotalColumns = 0
booAlternate = True
Form1.tmrMain.Enabled = True
End Sub

Private Sub tmrMain_Timer()

Dim intStartColumn As Integer, x As Integer, y As Integer


If intTotalColumns <= 50 And booAlternate = True Then
    Do
        intStartColumn = Int(Rnd * 79)
    Loop Until intColumn(intStartColumn).booActive = False
    intColumn(intStartColumn).booActive = True
    srfFront.SetForeColor vbWhite
    Call srfFront.DrawText(intStartColumn * 8, 0, Chr(intColumn(intStartColumn).Item(0).intCharacter), False)
    intColumn(intStartColumn).intCounter = intColumn(intStartColumn).intCounter + 1
    intTotalColumns = intTotalColumns + 1
    booAlternate = False
Else: booAlternate = True
End If


For x = 0 To 79
    If intColumn(x).booActive = True Then
        If intColumn(x).intCounter < intColumn(x).intLength Then
            If intColumn(x).booOffScreen = False Then
                Call srfFront.SetForeColor(vbWhite)
                Call srfFront.DrawText(x * 8, intColumn(x).intCounter * 12, Chr(intColumn(x).Item(intColumn(x).intCounter).intCharacter), False)
                DoEvents
                Call srfFront.SetForeColor(RGB(0, 0, 0))
                Call srfFront.DrawText(x * 8, (intColumn(x).intCounter - 1) * 12, " ", False)
                DoEvents
                Call srfFront.SetForeColor(RGB(0, intColumn(x).Item(intColumn(x).intCounter - 1).intGreenColour, 0))
                Call srfFront.DrawText(x * 8, (intColumn(x).intCounter - 1) * 12, Chr(intColumn(x).Item(intColumn(x).intCounter - 1).intCharacter), False)
                intColumn(x).intCounter = intColumn(x).intCounter + 1
            End If
            If intColumn(x).booOffScreen = True Then
                If intTotalColumns > 20 Then
                    Call srfFront.SetForeColor(vbBlack)
                    Call srfFront.DrawText(x * 8, intColumn(x).intCounter * 12, Chr(intColumn(x).Item(intColumn(x).intCounter).intCharacter), False)
                    intColumn(x).intCounter = intColumn(x).intCounter + 1
                    If intColumn(x).intCounter = intColumn(x).intLength Then
                        intColumn(x).booActive = False
                        intColumn(x).booOffScreen = False
                        intTotalColumns = intTotalColumns - 1
                        intColumn(x).intCounter = 0
                    End If
                End If
            End If
            
            If intColumn(x).intCounter = intColumn(x).intLength Or intColumn(x).intCounter = 41 Then
                Call srfFront.SetForeColor(RGB(0, intColumn(x).Item(intColumn(x).intCounter - 1).intGreenColour, 0))
                Call srfFront.DrawText(x * 8, (intColumn(x).intCounter - 1) * 12, Chr(intColumn(x).Item(intColumn(x).intCounter - 1).intCharacter), False)
                intColumn(x).booOffScreen = True
                intColumn(x).intCounter = 0
            End If
       End If
    End If
Next x

End Sub
