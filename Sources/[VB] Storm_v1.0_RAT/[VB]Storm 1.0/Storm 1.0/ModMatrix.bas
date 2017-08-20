Attribute VB_Name = "Module1"
Public Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long
Option Explicit

Public dxDirectX As New DirectX7
Public dxDirectDraw7 As DirectDraw7

Public sdFront As DDSURFACEDESC2
Public srfFront As DirectDrawSurface7
Public sdBackBuffer As DDSURFACEDESC2
Public srfBackBuffer As DirectDrawSurface7

Public Type typColumnItem
  x As Integer
  y As Integer
  intGreenColour As Integer
  intCharacter As Integer
End Type

Public Type typColumn
  Item() As typColumnItem
  intX As Integer
  intY As Integer
  intLength As Integer
  booActive As Boolean
  booOffScreen As Boolean
  intCounter As Integer
End Type

Public intColumn(79) As typColumn
Public fntCustom As New StdFont
Public intTotalColumns As Integer
Public booAlternate As Boolean

Sub SetupProg()

ShowCursor (0)

Set srfBackBuffer = Nothing
Set srfFront = Nothing

Set dxDirectDraw7 = dxDirectX.DirectDrawCreate("")
dxDirectDraw7.SetCooperativeLevel Form1.hwnd, DDSCL_FULLSCREEN Or DDSCL_EXCLUSIVE Or DDSCL_ALLOWMODEX
Call dxDirectDraw7.SetDisplayMode(640, 480, 32, 0, DDSDM_DEFAULT)
sdFront.lFlags = DDSD_CAPS Or DDSD_BACKBUFFERCOUNT
sdFront.ddsCaps.lCaps = DDSCAPS_PRIMARYSURFACE Or DDSCAPS_COMPLEX Or DDSCAPS_FLIP
sdFront.lBackBufferCount = 1
Set srfFront = dxDirectDraw7.CreateSurface(sdFront)

Dim ddCaps As DDSCAPS2
ddCaps.lCaps = DDSCAPS_BACKBUFFER
Set srfBackBuffer = srfFront.GetAttachedSurface(ddCaps)
srfBackBuffer.GetSurfaceDesc sdBackBuffer


End Sub
