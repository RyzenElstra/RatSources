Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Text
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms
Imports Xanity_2._0.My

Namespace Xanity_2._0
    Friend Class FlatCloseRE
        Inherits Control
        ' Methods
        Public Sub New()
            FlatCloseRE.__ENCAddToList(Me)
            Me.State = MouseState.None
            Me._BaseColor = Color.FromArgb(&HA8, &H23, &H23)
            Me._TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint))), True)
            Me.DoubleBuffered = True
            Me.BackColor = Color.White
            Dim size2 As New Size(&H12, &H12)
            Me.Size = size2
            Me.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.Font = New Font("Marlett", 10!)
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatCloseRE.__ENCList
            SyncLock list
                If (FlatCloseRE.__ENCList.Count = FlatCloseRE.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatCloseRE.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatCloseRE.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatCloseRE.__ENCList.Item(index) = FlatCloseRE.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatCloseRE.__ENCList.RemoveRange(index, (FlatCloseRE.__ENCList.Count - index))
                    FlatCloseRE.__ENCList.Capacity = FlatCloseRE.__ENCList.Count
                End If
                FlatCloseRE.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub OnClick(ByVal e As EventArgs)
            MyBase.OnClick(e)
            MyProject.Forms.remotescreen.Close
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

        Protected Overrides Sub OnMouseMove(ByVal e As MouseEventArgs)
            MyBase.OnMouseMove(e)
            Me.x = e.X
            Me.Invalidate
        End Sub

        Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
            MyBase.OnMouseUp(e)
            Me.State = MouseState.Over
            Me.Invalidate
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Dim image As New Bitmap(Me.Width, Me.Height)
            Dim graphics As Graphics = Graphics.FromImage(image)
            Dim rect As New Rectangle(0, 0, Me.Width, Me.Height)
            Dim graphics2 As Graphics = graphics
            graphics2.SmoothingMode = SmoothingMode.HighQuality
            graphics2.PixelOffsetMode = PixelOffsetMode.HighQuality
            graphics2.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            graphics2.Clear(Me.BackColor)
            graphics2.FillRectangle(New SolidBrush(Me._BaseColor), rect)
            Dim layoutRectangle As New Rectangle(0, 0, Me.Width, Me.Height)
            graphics2.DrawString("r", Me.Font, New SolidBrush(Me.TextColor), layoutRectangle, Helpers.CenterSF)
            Select Case CByte((CInt(Me.State) - 1))
                Case 0
                    graphics2.FillRectangle(New SolidBrush(Color.FromArgb(30, Color.White)), rect)
                    Exit Select
                Case 1
                    graphics2.FillRectangle(New SolidBrush(Color.FromArgb(30, Color.Black)), rect)
                    Exit Select
            End Select
            graphics2 = Nothing
            MyBase.OnPaint(e)
            graphics.Dispose
            e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
            e.Graphics.DrawImageUnscaled(image, 0, 0)
            image.Dispose
        End Sub

        Protected Overrides Sub OnResize(ByVal e As EventArgs)
            MyBase.OnResize(e)
            Dim size2 As New Size(&H12, &H12)
            Me.Size = size2
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
        Private _TextColor As Color
        Private State As MouseState
        Private x As Integer
    End Class
End Namespace

