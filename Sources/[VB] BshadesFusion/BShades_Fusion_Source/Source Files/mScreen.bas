Attribute VB_Name = "mScreen"
Private Declare Function GdiplusShutdown Lib "GDIPlus" (ByVal Token As Long) As Long
Private Declare Function GdipDisposeImage Lib "GDIPlus" (ByVal Image As Long) As Long
Private Declare Function GdipSaveImageToFile Lib "GDIPlus" (ByVal Image As Long, ByVal FileName As Long, clsidEncoder As guid, encoderParams As Any) As Long
Private Declare Function CLSIDFromString Lib "ole32" (ByVal str As Long, id As guid) As Long
Private Declare Function GetWindowRect Lib "user32" (ByVal hWnd As Long, lpRect As RECT) As Long
Private Declare Function GetWindowDC Lib "user32" (ByVal hWnd As Long) As Long
Private Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
Private Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Private Declare Function SelectObject Lib "gdi32.dll" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteDC Lib "gdi32.dll" (ByVal hdc As Long) As Long
Private Declare Function ReleaseDC Lib "user32" (ByVal hWnd As Long, ByVal hdc As Long) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private Declare Function OleCreatePictureIndirect Lib "olepro32.dll" (pic As PicBmp, RefIID As guid, ByVal fPictureOwnsHandle As Long, IPic As IPictureDisp) As Long
Private Declare Function StretchBlt Lib "gdi32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal hSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Private Declare Function SetStretchBltMode Lib "gdi32" (ByVal hdc As Long, ByVal nStretchMode As Long) As Long
Private Declare Function GdiplusStartup Lib "GDIPlus" (Token As Long, inputbuf As GdiplusStartupInput, Optional ByVal outputbuf As Long = 0) As Long
Private Declare Function GdipCreateBitmapFromHBITMAP Lib "GDIPlus" (ByVal hbm As Long, ByVal hPal As Long, Bitmap As Long) As Long

Private Type guid
   Data1 As Long
   Data2 As Integer
   Data3 As Integer
   Data4(0 To 7) As Byte
End Type

Private Type EncoderParameter
   guid As guid
   NumberOfValues As Long
   Type As Long
   Value As Long
End Type

Private Type EncoderParameters
   Count As Long
   Parameter As EncoderParameter
End Type

Private Type PicBmp
  Size As Long
  Type As Long
  hBmp As Long
  Reserved As Long
End Type

Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Private Type GdiplusStartupInput
   GdiplusVersion As Long
   DebugEventCallback As Long
   SuppressBackgroundThread As Long
   SuppressExternalCodecs As Long
End Type

Public Sub SCREENSHOT_DUMP(ByVal strDest As String, ByVal btSize As Byte, ByVal btQuality As Byte, Optional hWnd As Long)
    Dim IID_IDispatch As guid
    Dim WidthSrc As Long
    Dim HeightSrc As Long
    Dim r As RECT
    Dim pic As PicBmp
    Dim IPic As IPicture
        
    If hWnd = 0 Then
        WidthSrc = Screen.Width / Screen.TwipsPerPixelX
        HeightSrc = Screen.Height / Screen.TwipsPerPixelY
        
        WidthSrc = WidthSrc * (btSize / 100)
        HeightSrc = HeightSrc * (btSize / 100)
        
        hDCSrc = GetWindowDC(0) 'Desktop
    Else
        hDCSrc = GetWindowDC(hWnd) 'Window
        Call GetWindowRect(hWnd, r)
        WidthSrc = (r.Right - r.Left)
        HeightSrc = (r.Bottom - r.Top)
    End If
    
    hDCMemory = CreateCompatibleDC(hDCSrc)
    hBmp = CreateCompatibleBitmap(hDCSrc, WidthSrc, HeightSrc)
    hBmpPrev = SelectObject(hDCMemory, hBmp)
    SetStretchBltMode hDCMemory, vbPaletteModeNone
      
    If hWnd = 0 Then
        StretchBlt hDCMemory, 0, 0, WidthSrc, HeightSrc, hDCSrc, 0, 0, Screen.Width / Screen.TwipsPerPixelX, Screen.Height / Screen.TwipsPerPixelY, vbSrcCopy
    Else
        StretchBlt hDCMemory, 0, 0, WidthSrc, HeightSrc, hDCSrc, 0, 0, WidthSrc, HeightSrc, vbSrcCopy
    End If
        
    hBmp = SelectObject(hDCMemory, hBmpPrev)
    
    With IID_IDispatch
       .Data1 = &H20400
       .Data4(0) = &HC0
       .Data4(7) = &H46
     End With
    
    With pic
       .Size = Len(pic)         'Length of structure
       .Type = vbPicTypeBitmap  'Type of Picture (bitmap)
       .hBmp = hBmp             'Handle to bitmap
       .Reserved = 0&           'Handle to palette (may be null)
     End With
        
    Call OleCreatePictureIndirect(pic, IID_IDispatch, 1, IPic)
         
    SaveJPG IPic, strDest, btQuality 'JPG
    
    Call DeleteDC(hDCMemory)
    Call DeleteDC(hDCSrc)
    ReleaseDC 0, hDCMemory
    ReleaseDC 0, hDCSrc
    
    DeleteObject PicBM
    DeleteObject hBmp
    DeleteObject hBmpPrev
        
    Set cPic = Nothing
    Set IPic = Nothing
End Sub

Public Sub SaveJPG(ByVal pict As StdPicture, ByVal FileName As String, Optional ByVal Quality As Byte = 80)
On Error Resume Next
Dim tSI As GdiplusStartupInput
Dim lRes As Long
Dim lGDIP As Long
Dim lBitmap As Long

On Error Resume Next
   tSI.GdiplusVersion = 1
   lRes = GdiplusStartup(lGDIP, tSI)

   If lRes = 0 Then
      lRes = GdipCreateBitmapFromHBITMAP(pict.Handle, 0, lBitmap)

      If lRes = 0 Then
         Dim tJpgEncoder As guid
         Dim tParams As EncoderParameters

         CLSIDFromString StrPtr("{557CF401-1A04-11D3-9A73-0000F81EF32E}"), tJpgEncoder

         tParams.Count = 1
         With tParams.Parameter
            CLSIDFromString StrPtr("{1D5BE4B5-FA4A-452D-9CDD-5DB35105E7EB}"), .guid
            .NumberOfValues = 1
            .Type = 4
            .Value = VarPtr(Quality)
         End With

         lRes = GdipSaveImageToFile(lBitmap, StrPtr(FileName), tJpgEncoder, tParams)
         GdipDisposeImage lBitmap
      End If
      GdiplusShutdown lGDIP
   End If
   If lRes Then
      Err.Raise 5, , "Cannot save the image. GDI+ Error:" & lRes
   End If
End Sub

Public Sub WEBCAM_DUMP(ByVal strDest As String, ByVal btQuality As Byte)
    Dim i As Long
    
    frmMain.tmrDoWork.Enabled = True
    
    If frmMain.tmrDoWork.Tag = vbNullString Then 'First time
        For i = 1 To 3
            If mCaphWnd <> 0 Then SendMessage mCaphWnd, WM_CAP_DRIVER_DISCONNECT, 0, 0
            mCaphWnd = capCreateCaptureWindow("WebCamCapture", 0, 0, 0, 320, 240, frmMain.picWC.hWnd, 0)
            DoEvents: SendMessage mCaphWnd, WM_CAP_DRIVER_CONNECT, 0, 0
            Call SendMessage(mCaphWnd, WM_CAP_SET_SCALE, True, 0&)
            SendMessage mCaphWnd, WM_CAP_GRAB_FRAME, 0, 0
            SendMessage mCaphWnd, WM_CAP_EDIT_COPY, 0, 0
            frmMain.picWC.Picture = Clipboard.GetData
            Clipboard.Clear
            Call Screenshot_WebCam(frmMain.picWC, strDest, btQuality, True)
            frmMain.tmrDoWork.Enabled = False
        Next i
        frmMain.tmrDoWork.Tag = "1"
    Else
        Call SendMessage(mCaphWnd, WM_CAP_SET_SCALE, True, 0&)
        SendMessage mCaphWnd, WM_CAP_GRAB_FRAME, 0, 0
        SendMessage mCaphWnd, WM_CAP_EDIT_COPY, 0, 0
        frmMain.picWC.Picture = Clipboard.GetData
        Clipboard.Clear
        Call Screenshot_WebCam(frmMain.picWC, strDest, btQuality, True)
    End If
    
    frmMain.tmrDoWork.Enabled = False
End Sub

Function Screenshot_WebCam(RetPictureBox As PictureBox, SaveFilePath As String, Optional JPGImageQuality As Byte = 80, Optional boolThumbnail As Boolean)
    On Local Error Resume Next
    Dim x1 As Single, y1 As Single
    Dim xWidth As Long, xHeight As Long
    
    If boolThumbnail = True Then
        xWidth = 160
        xHeight = 120
    Else
        xWidth = 320
        xHeight = 240
    End If
    
    RetPictureBox.Width = RetPictureBox.ScaleX(xWidth, vbPixels, vbTwips)
    RetPictureBox.Height = RetPictureBox.ScaleY(xHeight, vbPixels, vbTwips)
    x1 = RetPictureBox.Width: y1 = RetPictureBox.Height
                          
    Do While x1 > (xWidth * Screen.TwipsPerPixelX) Or y1 > (xHeight * Screen.TwipsPerPixelY)
       x1 = x1 / 1.01
       y1 = y1 / 1.01
    Loop
    
    RetPictureBox.PaintPicture RetPictureBox.Picture, 0, 0, x1, y1
    RetPictureBox.Picture = RetPictureBox.Image
    
    SaveJPG RetPictureBox, SaveFilePath, JPGImageQuality
End Function
