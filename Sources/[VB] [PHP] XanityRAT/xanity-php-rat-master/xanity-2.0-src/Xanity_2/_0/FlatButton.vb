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
    Friend Class FlatButton
        Inherits Control
        ' Methods
        Public Sub New()
            FlatButton.__ENCAddToList(Me)
            Me._Rounded = False
            Me.State = MouseState.None
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
            Dim list As List(Of WeakReference) = FlatButton.__ENCList
            SyncLock list
                If (FlatButton.__ENCList.Count = FlatButton.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatButton.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatButton.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatButton.__ENCList.Item(index) = FlatButton.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatButton.__ENCList.RemoveRange(index, (FlatButton.__ENCList.Count - index))
                    FlatButton.__ENCList.Capacity = FlatButton.__ENCList.Count
                End If
                FlatButton.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
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
            Me.W = (Me.Width - 1)
            Me.H = (Me.Height - 1)
            Dim path As New GraphicsPath
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
                    path = Helpers.RoundRec(rect, 6)
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
                    path = Helpers.RoundRec(rect, 6)
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
                    path = Helpers.RoundRec(rect, 6)
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

