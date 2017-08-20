VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsRemoteControl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function StretchBlt Lib "gdi32" (ByVal hDc As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Private Declare Function SetStretchBltMode Lib "gdi32" (ByVal hDc As Long, ByVal hStretchMode As Long) As Long
Private Const STRETCHMODE = vbPaletteModeNone   'You can find other modes in the "PaletteModeConstants" section of your Object Browser

Public ClientScale As Single
Public Capture_Width As Long, Capture_Height As Long
Public Block_Left As Long, Block_Top As Long, Block_Width As Long, Block_Height As Long, xBlocks As Long, yBlocks As Long, ColorDepth As Long
Public Destination_hDc

Public BackBuffer As New clsDIB
Public ZLib As New clsZLib
Public DIB As New clsDIB
Private Scaled As New clsDIB


Public MouseX As Long, MouseY As Long, OldX As Long, OldY As Long

Private BlockData As String, BlockSizeReceived As Long, BlockSizeTotal As Long

Public Function Proccess(ByVal Arguments As String)
    Dim Command As String, Information() As String
    
    If InStr(1, Arguments, ";") = 0 Then
        Command = Arguments
    Else
        Command = Split(Arguments, ";", 2)(0)
        Information() = Split(Mid(Arguments, Len(Command) + 2), Chr(0))
    End If
    
    Select Case Command
    Case "newblock"
        'Set the variables for the new block
        'NewBlock Information(0), Information(1), Information(2), Information(3), Information(4), Information(5)
        
        'Tell remote party to begin sending the block data
        BasMain.Send "remotecontrol;ready"
    Case "done"
        DrawBlock StrConv(BlockData, vbFromUnicode)
        BlockData = ""
        BasMain.Send "remotecontrol;ok"
    End Select
End Function

Function ReceiveBlockData(Data As String)
    BlockData = BlockData & Data
    
    BlockSizeReceived = BlockSizeReceived & Len(Data)
End Function

Sub DrawBlock(ByteArray() As Byte)
    
    If DIB.Colors <> ColorDepth Or DIB.Width <> Block_Width Or DIB.Height <> Block_Height Then
        Set DIB = Nothing
        Set DIB = New clsDIB
        DIB.Colors = ColorDepth
        DIB.Create Block_Width, Block_Height
    End If
        
    'If ZLib.DecompressByte(ByteArray()) = 0 Then Exit Sub
    
    DIB.ParseByte ByteArray()
    
    If ClientScale = 100 Then
        BitBlt picCapture.hDc, Block_Left, Block_Top, Block_Width, Block_Height, DIB.hDc, 0, 0, vbSrcCopy
    Else
        SetStretchBltMode picCapture.hDc, STRETCHMODE
        'StretchBlt picCapture.hdc, ToScale(Block_Left), ToScale(Block_Top), ToScale(Block_Width), ToScale(Block_Height), DIB.hdc, 0, 0, Block_Width, Block_Height, vbSrcCopy
    End If
    
    'Draw the block to the backbuffer
    BitBlt BackBuffer.hDc, Block_Left, Block_Top, Block_Width, Block_Height, DIB.hDc, 0, 0, vbSrcCopy
    
    Send Chr(3) & Chr(4)
    'picCapture.Refresh
End Sub

Function NewBlock(Left As Long, Top As Long, Width As Long, Height As Long, Colors As Long, Size As Long)
    Block_Left = Left
    Block_Top = Top
    Block_Width = Width
    Block_Height = Height
    
    ColorDepth = Colors
    
    BlockSizeTotal = Size
End Function
