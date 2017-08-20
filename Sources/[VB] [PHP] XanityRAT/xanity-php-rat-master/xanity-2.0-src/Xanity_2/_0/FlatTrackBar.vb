Imports Microsoft.VisualBasic.CompilerServices
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
    <DefaultEvent("Scroll")> _
    Friend Class FlatTrackBar
        Inherits Control
        ' Events
        Public Custom Event Scroll As ScrollEventHandler

        ' Methods
        Public Sub New()
            FlatTrackBar.__ENCAddToList(Me)
            Me._Maximum = 10
            Me._ShowValue = False
            Me.BaseColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me._TrackColor = Helpers._FlatColor
            Me.SliderColor = Color.White
            Me._HatchColor = Color.DeepPink
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint))), True)
            Me.DoubleBuffered = True
            Me.Height = &H12
            Me.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatTrackBar.__ENCList
            SyncLock list
                If (FlatTrackBar.__ENCList.Count = FlatTrackBar.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatTrackBar.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatTrackBar.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatTrackBar.__ENCList.Item(index) = FlatTrackBar.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatTrackBar.__ENCList.RemoveRange(index, (FlatTrackBar.__ENCList.Count - index))
                    FlatTrackBar.__ENCList.Capacity = FlatTrackBar.__ENCList.Count
                End If
                FlatTrackBar.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub OnKeyDown(ByVal e As KeyEventArgs)
            MyBase.OnKeyDown(e)
            If (e.KeyCode = Keys.Subtract) Then
                If (Me.Value <> 0) Then
                    Me.Value -= 1
                End If
            ElseIf ((e.KeyCode = Keys.Add) AndAlso (Me.Value <> Me._Maximum)) Then
                Me.Value += 1
            End If
        End Sub

        Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
            MyBase.OnMouseDown(e)
            If (e.Button = MouseButtons.Left) Then
                Me.Val = CInt(Math.Round(CDbl(((CDbl((Me._Value - Me._Minimum)) / CDbl((Me._Maximum - Me._Minimum))) * (Me.Width - 11)))))
                Me.Track = New Rectangle(Me.Val, 0, 10, 20)
                Me.Bool = Me.Track.Contains(e.Location)
            End If
        End Sub

        Protected Overrides Sub OnMouseMove(ByVal e As MouseEventArgs)
            MyBase.OnMouseMove(e)
            If (If(((Not Me.Bool OrElse (e.X <= -1)) OrElse (e.X >= (Me.Width + 1))), 0, 1) <> 0) Then
                Me.Value = (Me._Minimum + CInt(Math.Round(CDbl(((Me._Maximum - Me._Minimum) * (CDbl(e.X) / CDbl(Me.Width)))))))
            End If
        End Sub

        Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
            MyBase.OnMouseUp(e)
            Me.Bool = False
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Helpers.B = New Bitmap(Me.Width, Me.Height)
            Helpers.G = Graphics.FromImage(Helpers.B)
            Me.W = (Me.Width - 1)
            Me.H = (Me.Height - 1)
            Dim rect As New Rectangle(1, 6, (Me.W - 2), 8)
            Dim path As New GraphicsPath
            Dim path2 As New GraphicsPath
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.PixelOffsetMode = PixelOffsetMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me.BackColor)
            Me.Val = CInt(Math.Round(CDbl(((CDbl((Me._Value - Me._Minimum)) / CDbl((Me._Maximum - Me._Minimum))) * (Me.W - 10)))))
            Me.Track = New Rectangle(Me.Val, 0, 10, 20)
            Me.Knob = New Rectangle(Me.Val, 4, 11, 14)
            path.AddRectangle(rect)
            g.SetClip(path)
            Dim rectangle2 As New Rectangle(0, 7, Me.W, 8)
            g.FillRectangle(New SolidBrush(Me.BaseColor), rectangle2)
            rectangle2 = New Rectangle(0, 7, (Me.Track.X + Me.Track.Width), 8)
            g.FillRectangle(New SolidBrush(Me._TrackColor), rectangle2)
            g.ResetClip
            Dim brush As New HatchBrush(HatchStyle.Plaid, Me.HatchColor, Me._TrackColor)
            rectangle2 = New Rectangle(-10, 7, (Me.Track.X + Me.Track.Width), 8)
            g.FillRectangle(brush, rectangle2)
            Select Case Me.Style
                Case _Style.Slider
                    path2.AddRectangle(Me.Track)
                    g.FillPath(New SolidBrush(Me.SliderColor), path2)
                    Exit Select
                Case _Style.Knob
                    path2.AddEllipse(Me.Knob)
                    g.FillPath(New SolidBrush(Me.SliderColor), path2)
                    Exit Select
            End Select
            If Me.ShowValue Then
                rectangle2 = New Rectangle(1, 6, Me.W, Me.H)
                Dim format As New StringFormat With { _
                    .Alignment = StringAlignment.Far, _
                    .LineAlignment = StringAlignment.Far _
                }
                g.DrawString(Conversions.ToString(Me.Value), New Font("Segoe UI", 8!), Brushes.White, rectangle2, format)
            End If
            g = Nothing
            MyBase.OnPaint(e)
            Helpers.G.Dispose
            e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
            e.Graphics.DrawImageUnscaled(Helpers.B, 0, 0)
            Helpers.B.Dispose
        End Sub

        Protected Overrides Sub OnResize(ByVal e As EventArgs)
            MyBase.OnResize(e)
            Me.Height = &H17
        End Sub

        Protected Overrides Sub OnTextChanged(ByVal e As EventArgs)
            MyBase.OnTextChanged(e)
            Me.Invalidate
        End Sub


        ' Properties
        <Category("Colors")> _
        Public Property HatchColor As Color
            Get
                Return Me._HatchColor
            End Get
            Set(ByVal value As Color)
                Me._HatchColor = value
            End Set
        End Property

        Public Property Maximum As Integer
            Get
                Return Me._Maximum
            End Get
            Set(ByVal value As Integer)
                If (value < 0) Then
                End If
                Me._Maximum = value
                If (value < Me._Value) Then
                    Me._Value = value
                End If
                If (value < Me._Minimum) Then
                    Me._Minimum = value
                End If
                Me.Invalidate
            End Set
        End Property

        Public Property Minimum As Integer
            Get
                Return 0
            End Get
            Set(ByVal value As Integer)
                If (value < 0) Then
                End If
                Me._Minimum = value
                If (value > Me._Value) Then
                    Me._Value = value
                End If
                If (value > Me._Maximum) Then
                    Me._Maximum = value
                End If
                Me.Invalidate
            End Set
        End Property

        Public Property ShowValue As Boolean
            Get
                Return Me._ShowValue
            End Get
            Set(ByVal value As Boolean)
                Me._ShowValue = value
            End Set
        End Property

        Public Property Style As _Style
            Get
                Return Me.Style_
            End Get
            Set(ByVal value As _Style)
                Me.Style_ = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property TrackColor As Color
            Get
                Return Me._TrackColor
            End Get
            Set(ByVal value As Color)
                Me._TrackColor = value
            End Set
        End Property

        Public Property Value As Integer
            Get
                Return Me._Value
            End Get
            Set(ByVal value As Integer)
                If (value <> Me._Value) Then
                    If ((value > Me._Maximum) OrElse (value < Me._Minimum)) Then
                    End If
                    Me._Value = value
                    Me.Invalidate
                    Dim scrollEvent As ScrollEventHandler = Me.ScrollEvent
                    If (Not scrollEvent Is Nothing) Then
                        scrollEvent.Invoke(Me)
                    End If
                End If
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private _HatchColor As Color
        Private _Maximum As Integer
        Private _Minimum As Integer
        Private _ShowValue As Boolean
        Private _TrackColor As Color
        Private _Value As Integer
        Private BaseColor As Color
        Private Bool As Boolean
        Private H As Integer
        Private Knob As Rectangle
        Private SliderColor As Color
        Private Style_ As _Style
        Private Track As Rectangle
        Private Val As Integer
        Private W As Integer

        ' Nested Types
        <Flags> _
        Public Enum _Style
            ' Fields
            Knob = 1
            Slider = 0
        End Enum

        Public Delegate Sub ScrollEventHandler(ByVal sender As Object)
    End Class
End Namespace

