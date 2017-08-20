Imports System
Imports System.Collections
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Text
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Namespace Xanity_2._0
    Friend Class FlatStickyButton
        Inherits Control
        ' Methods
        Public Sub New()
            FlatStickyButton.__ENCAddToList(Me)
            Me.State = MouseState.None
            Me._Rounded = False
            Me._BaseColor = Helpers._FlatColor
            Me._TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.SupportsTransparentBackColor Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint)))), True)
            Me.DoubleBuffered = True
            Dim size2 As New Size(&H6A, &H20)
            Me.Size = size2
            Me.BackColor = Color.Transparent
            Me.Font = New Font("Segoe UI", 12!)
            Me.Cursor = Cursors.Hand
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatStickyButton.__ENCList
            SyncLock list
                If (FlatStickyButton.__ENCList.Count = FlatStickyButton.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatStickyButton.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatStickyButton.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatStickyButton.__ENCList.Item(index) = FlatStickyButton.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatStickyButton.__ENCList.RemoveRange(index, (FlatStickyButton.__ENCList.Count - index))
                    FlatStickyButton.__ENCList.Capacity = FlatStickyButton.__ENCList.Count
                End If
                FlatStickyButton.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Private Function GetConnectedSides() As Boolean()
            Dim enumerator As IEnumerator
            Dim flagArray As Boolean() = New Boolean() { False, False, False, False }
            Try 
                enumerator = Me.Parent.Controls.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As Control = DirectCast(enumerator.Current, Control)
                    If (TypeOf current Is FlatStickyButton AndAlso Not ((current Is Me) Or Not Me.Rect.IntersectsWith(Me.Rect))) Then
                        Dim a As Double = ((Math.Atan2(CDbl((Me.Left - current.Left)), CDbl((Me.Top - current.Top))) * 2) / 3.1415926535897931)
                        If ((CLng(Math.Round(a)) / 1) = a) Then
                            flagArray(CInt(Math.Round(CDbl((a + 1))))) = True
                        End If
                    End If
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator,IDisposable).Dispose
                End If
            End Try
            Return flagArray
        End Function

        Protected Overrides Sub OnCreateControl()
            MyBase.OnCreateControl
        End Sub

        Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
            MyBase.OnMouseDown(e)
            Me.State = MouseState.Down
            Me.Invalidate
        End Sub

        Protected Overrides Sub OnMouseEnter(ByVal e As EventArgs)
            MyBase.OnMouseEnter(e)
            Me.State = MouseState.Over
            Me.Invalidate
        End Sub

        Protected Overrides Sub OnMouseLeave(ByVal e As EventArgs)
            MyBase.OnMouseLeave(e)
            Me.State = MouseState.None
            Me.Invalidate
        End Sub

        Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
            MyBase.OnMouseUp(e)
            Me.State = MouseState.Over
            Me.Invalidate
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Helpers.B = New Bitmap(Me.Width, Me.Height)
            Helpers.G = Graphics.FromImage(Helpers.B)
            Me.W = Me.Width
            Me.H = Me.Height
            Dim path As New GraphicsPath
            Dim connectedSides As Boolean() = Me.GetConnectedSides
            Dim path2 As GraphicsPath = Helpers.RoundRect(0!, 0!, CSng(Me.W), CSng(Me.H), 0.3!, Not (connectedSides(2) Or connectedSides(1)), Not (connectedSides(1) Or connectedSides(0)), Not (connectedSides(3) Or connectedSides(0)), Not (connectedSides(3) Or connectedSides(2)))
            Dim rect As New Rectangle(0, 0, Me.W, Me.H)
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.PixelOffsetMode = PixelOffsetMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me.BackColor)
            Select Case Me.State
                Case MouseState.None
                    If Not Me.Rounded Then
                        g.FillRectangle(New SolidBrush(Me._BaseColor), rect)
                        g.DrawString(Me.Text, Me.Font, New SolidBrush(Me._TextColor), rect, Helpers.CenterSF)
                        Exit Select
                    End If
                    path = path2
                    g.FillPath(New SolidBrush(Me._BaseColor), path)
                    g.DrawString(Me.Text, Me.Font, New SolidBrush(Me._TextColor), rect, Helpers.CenterSF)
                    Exit Select
                Case MouseState.Over
                    If Not Me.Rounded Then
                        g.FillRectangle(New SolidBrush(Me._BaseColor), rect)
                        g.FillRectangle(New SolidBrush(Color.FromArgb(20, Color.White)), rect)
                        g.DrawString(Me.Text, Me.Font, New SolidBrush(Me._TextColor), rect, Helpers.CenterSF)
                        Exit Select
                    End If
                    path = path2
                    g.FillPath(New SolidBrush(Me._BaseColor), path)
                    g.FillPath(New SolidBrush(Color.FromArgb(20, Color.White)), path)
                    g.DrawString(Me.Text, Me.Font, New SolidBrush(Me._TextColor), rect, Helpers.CenterSF)
                    Exit Select
                Case MouseState.Down
                    If Not Me.Rounded Then
                        g.FillRectangle(New SolidBrush(Me._BaseColor), rect)
                        g.FillRectangle(New SolidBrush(Color.FromArgb(20, Color.Black)), rect)
                        g.DrawString(Me.Text, Me.Font, New SolidBrush(Me._TextColor), rect, Helpers.CenterSF)
                        Exit Select
                    End If
                    path = path2
                    g.FillPath(New SolidBrush(Me._BaseColor), path)
                    g.FillPath(New SolidBrush(Color.FromArgb(20, Color.Black)), path)
                    g.DrawString(Me.Text, Me.Font, New SolidBrush(Me._TextColor), rect, Helpers.CenterSF)
                    Exit Select
            End Select
            g = Nothing
            MyBase.OnPaint(e)
            Helpers.G.Dispose
            e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
            e.Graphics.DrawImageUnscaled(Helpers.B, 0, 0)
            Helpers.B.Dispose
        End Sub

        Protected Overrides Sub OnResize(ByVal e As EventArgs)
            MyBase.OnResize(e)
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

        Private ReadOnly Property Rect As Rectangle
            Get
                Return New Rectangle(Me.Left, Me.Top, Me.Width, Me.Height)
            End Get
        End Property

        <Category("Options")> _
        Public Property Rounded As Boolean
            Get
                Return Me._Rounded
            End Get
            Set(ByVal value As Boolean)
                Me._Rounded = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property TextColor As Color
            Get
                Return Me._TextColor
            End Get
            Set(ByVal value As Color)
                Me._TextColor = value
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private _BaseColor As Color
        Private _Rounded As Boolean
        Private _TextColor As Color
        Private H As Integer
        Private State As MouseState
        Private W As Integer
    End Class
End Namespace

