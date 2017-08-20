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
    Friend Class FlatNumeric
        Inherits Control
        ' Methods
        Public Sub New()
            FlatNumeric.__ENCAddToList(Me)
            Me.State = MouseState.None
            Me._BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me._ButtonColor = Helpers._FlatColor
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.SupportsTransparentBackColor Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint)))), True)
            Me.DoubleBuffered = True
            Me.Font = New Font("Segoe UI", 10!)
            Me.BackColor = Color.FromArgb(60, 70, &H49)
            Me.ForeColor = Color.White
            Me._Min = 0
            Me._Max = &H98967F
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatNumeric.__ENCList
            SyncLock list
                If (FlatNumeric.__ENCList.Count = FlatNumeric.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatNumeric.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatNumeric.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatNumeric.__ENCList.Item(index) = FlatNumeric.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatNumeric.__ENCList.RemoveRange(index, (FlatNumeric.__ENCList.Count - index))
                    FlatNumeric.__ENCList.Capacity = FlatNumeric.__ENCList.Count
                End If
                FlatNumeric.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub OnKeyDown(ByVal e As KeyEventArgs)
            MyBase.OnKeyDown(e)
            If (e.KeyCode = Keys.Back) Then
                Me.Value = 0
            End If
        End Sub

        Protected Overrides Sub OnKeyPress(ByVal e As KeyPressEventArgs)
            MyBase.OnKeyPress(e)
            Try 
                If Me.Bool Then
                    Me._Value = Conversions.ToLong((Conversions.ToString(Me._Value) & e.KeyChar.ToString))
                End If
                If (Me._Value > Me._Max) Then
                    Me._Value = Me._Max
                End If
                Me.Invalidate
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
            MyBase.OnMouseDown(e)
            If (If(((Me.x <= (Me.Width - &H15)) OrElse (Me.x >= (Me.Width - 3))), 0, 1) <> 0) Then
                If (Me.y < 15) Then
                    If ((Me.Value + 1) <= Me._Max) Then
                        Me._Value = (Me._Value + 1)
                    End If
                ElseIf ((Me.Value - 1) >= Me._Min) Then
                    Me._Value = (Me._Value - 1)
                End If
            Else
                Me.Bool = Not Me.Bool
                Me.Focus
            End If
            Me.Invalidate
        End Sub

        Protected Overrides Sub OnMouseMove(ByVal e As MouseEventArgs)
            MyBase.OnMouseMove(e)
            Me.x = e.Location.X
            Me.y = e.Location.Y
            Me.Invalidate
            If (e.X < (Me.Width - &H17)) Then
                Me.Cursor = Cursors.IBeam
            Else
                Me.Cursor = Cursors.Hand
            End If
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Helpers.B = New Bitmap(Me.Width, Me.Height)
            Helpers.G = Graphics.FromImage(Helpers.B)
            Me.W = Me.Width
            Me.H = Me.Height
            Dim rect As New Rectangle(0, 0, Me.W, Me.H)
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.PixelOffsetMode = PixelOffsetMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me.BackColor)
            g.FillRectangle(New SolidBrush(Me._BaseColor), rect)
            Dim rectangle2 As New Rectangle((Me.Width - &H18), 0, &H18, Me.H)
            g.FillRectangle(New SolidBrush(Me._ButtonColor), rectangle2)
            Dim point As New Point((Me.Width - 12), 8)
            g.DrawString("+", New Font("Segoe UI", 12!), Brushes.White, DirectCast(point, PointF), Helpers.CenterSF)
            point = New Point((Me.Width - 12), &H16)
            g.DrawString("-", New Font("Segoe UI", 10!, FontStyle.Bold), Brushes.White, DirectCast(point, PointF), Helpers.CenterSF)
            rectangle2 = New Rectangle(5, 1, Me.W, Me.H)
            Dim format As New StringFormat With { _
                .LineAlignment = StringAlignment.Center _
            }
            g.DrawString(Conversions.ToString(Me.Value), Me.Font, Brushes.White, rectangle2, format)
            g = Nothing
            MyBase.OnPaint(e)
            Helpers.G.Dispose
            e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
            e.Graphics.DrawImageUnscaled(Helpers.B, 0, 0)
            Helpers.B.Dispose
        End Sub

        Protected Overrides Sub OnResize(ByVal e As EventArgs)
            MyBase.OnResize(e)
            Me.Height = 30
        End Sub


        ' Properties
        <Category("Colors")> _
        Public Property BaseColor As Color
            Get
                Return Me._BaseColor
            End Get
            Set(ByVal value As Color)
                Me._BaseColor = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property ButtonColor As Color
            Get
                Return Me._ButtonColor
            End Get
            Set(ByVal value As Color)
                Me._ButtonColor = value
            End Set
        End Property

        Public Property Maximum As Long
            Get
                Return Me._Max
            End Get
            Set(ByVal value As Long)
                If (value > Me._Min) Then
                    Me._Max = value
                End If
                If (Me._Value > Me._Max) Then
                    Me._Value = Me._Max
                End If
                Me.Invalidate
            End Set
        End Property

        Public Property Minimum As Long
            Get
                Return Me._Min
            End Get
            Set(ByVal value As Long)
                If (value < Me._Max) Then
                    Me._Min = value
                End If
                If (Me._Value < Me._Min) Then
                    Me._Value = Me.Minimum
                End If
                Me.Invalidate
            End Set
        End Property

        Public Property Value As Long
            Get
                Return Me._Value
            End Get
            Set(ByVal value As Long)
                If ((value <= Me._Max) And (value >= Me._Min)) Then
                    Me._Value = value
                End If
                Me.Invalidate
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private _BaseColor As Color
        Private _ButtonColor As Color
        Private _Max As Long
        Private _Min As Long
        Private _Value As Long
        Private Bool As Boolean
        Private H As Integer
        Private State As MouseState
        Private W As Integer
        Private x As Integer
        Private y As Integer
    End Class
End Namespace

