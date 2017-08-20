Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Text
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Namespace Xanity_2._0
    Friend Class FlatColorPalette
        Inherits Control
        ' Methods
        Public Sub New()
            FlatColorPalette.__ENCAddToList(Me)
            Me._Red = Color.FromArgb(220, &H55, &H60)
            Me._Cyan = Color.FromArgb(10, &H9A, &H9D)
            Me._Blue = Color.FromArgb(0, &H80, &HFF)
            Me._LimeGreen = Color.FromArgb(&H23, &HA8, &H6D)
            Me._Orange = Color.FromArgb(&HFD, &HB5, &H3F)
            Me._Purple = Color.FromArgb(&H9B, &H58, &HB5)
            Me._Black = Color.FromArgb(&H2D, &H2F, &H31)
            Me._Gray = Color.FromArgb(&H3F, 70, &H49)
            Me._White = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint))), True)
            Me.DoubleBuffered = True
            Me.BackColor = Color.FromArgb(60, 70, &H49)
            Dim size2 As New Size(160, 80)
            Me.Size = size2
            Me.Font = New Font("Segoe UI", 12!)
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatColorPalette.__ENCList
            SyncLock list
                If (FlatColorPalette.__ENCList.Count = FlatColorPalette.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatColorPalette.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatColorPalette.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatColorPalette.__ENCList.Item(index) = FlatColorPalette.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatColorPalette.__ENCList.RemoveRange(index, (FlatColorPalette.__ENCList.Count - index))
                    FlatColorPalette.__ENCList.Capacity = FlatColorPalette.__ENCList.Count
                End If
                FlatColorPalette.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Helpers.B = New Bitmap(Me.Width, Me.Height)
            Helpers.G = Graphics.FromImage(Helpers.B)
            Me.W = (Me.Width - 1)
            Me.H = (Me.Height - 1)
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.PixelOffsetMode = PixelOffsetMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me.BackColor)
            Dim rect As New Rectangle(0, 0, 20, 40)
            g.FillRectangle(New SolidBrush(Me._Red), rect)
            rect = New Rectangle(20, 0, 20, 40)
            g.FillRectangle(New SolidBrush(Me._Cyan), rect)
            rect = New Rectangle(40, 0, 20, 40)
            g.FillRectangle(New SolidBrush(Me._Blue), rect)
            rect = New Rectangle(60, 0, 20, 40)
            g.FillRectangle(New SolidBrush(Me._LimeGreen), rect)
            rect = New Rectangle(80, 0, 20, 40)
            g.FillRectangle(New SolidBrush(Me._Orange), rect)
            rect = New Rectangle(100, 0, 20, 40)
            g.FillRectangle(New SolidBrush(Me._Purple), rect)
            rect = New Rectangle(120, 0, 20, 40)
            g.FillRectangle(New SolidBrush(Me._Black), rect)
            rect = New Rectangle(140, 0, 20, 40)
            g.FillRectangle(New SolidBrush(Me._Gray), rect)
            rect = New Rectangle(160, 0, 20, 40)
            g.FillRectangle(New SolidBrush(Me._White), rect)
            rect = New Rectangle(0, &H16, Me.W, Me.H)
            g.DrawString("Color Palette", Me.Font, New SolidBrush(Me._White), rect, Helpers.CenterSF)
            g = Nothing
            MyBase.OnPaint(e)
            Helpers.G.Dispose
            e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
            e.Graphics.DrawImageUnscaled(Helpers.B, 0, 0)
            Helpers.B.Dispose
        End Sub

        Protected Overrides Sub OnResize(ByVal e As EventArgs)
            MyBase.OnResize(e)
            Me.Width = 180
            Me.Height = 80
        End Sub


        ' Properties
        <Category("Colors")> _
        Public Property Black As Color
            Get
                Return Me._Black
            End Get
            Set(ByVal value As Color)
                Me._Black = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property Blue As Color
            Get
                Return Me._Blue
            End Get
            Set(ByVal value As Color)
                Me._Blue = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property Cyan As Color
            Get
                Return Me._Cyan
            End Get
            Set(ByVal value As Color)
                Me._Cyan = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property Gray As Color
            Get
                Return Me._Gray
            End Get
            Set(ByVal value As Color)
                Me._Gray = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property LimeGreen As Color
            Get
                Return Me._LimeGreen
            End Get
            Set(ByVal value As Color)
                Me._LimeGreen = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property Orange As Color
            Get
                Return Me._Orange
            End Get
            Set(ByVal value As Color)
                Me._Orange = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property Purple As Color
            Get
                Return Me._Purple
            End Get
            Set(ByVal value As Color)
                Me._Purple = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property Red As Color
            Get
                Return Me._Red
            End Get
            Set(ByVal value As Color)
                Me._Red = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property White As Color
            Get
                Return Me._White
            End Get
            Set(ByVal value As Color)
                Me._White = value
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private _Black As Color
        Private _Blue As Color
        Private _Cyan As Color
        Private _Gray As Color
        Private _LimeGreen As Color
        Private _Orange As Color
        Private _Purple As Color
        Private _Red As Color
        Private _White As Color
        Private H As Integer
        Private W As Integer
    End Class
End Namespace

