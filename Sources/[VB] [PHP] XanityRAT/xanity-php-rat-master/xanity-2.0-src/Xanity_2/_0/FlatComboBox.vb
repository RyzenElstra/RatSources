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
    Friend Class FlatComboBox
        Inherits ComboBox
        ' Methods
        Public Sub New()
            AddHandler MyBase.DrawItem, New DrawItemEventHandler(AddressOf Me.DrawItem_)
            FlatComboBox.__ENCAddToList(Me)
            Me._StartIndex = 0
            Me.State = MouseState.None
            Me._BaseColor = Color.FromArgb(&H19, &H1B, &H1D)
            Me._BGColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me._HoverColor = Color.FromArgb(&H23, &HA8, &H6D)
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint))), True)
            Me.DoubleBuffered = True
            Me.DrawMode = DrawMode.OwnerDrawFixed
            Me.BackColor = Color.FromArgb(&H2D, &H2D, &H30)
            Me.ForeColor = Color.White
            Me.DropDownStyle = ComboBoxStyle.DropDownList
            Me.Cursor = Cursors.Hand
            Me.StartIndex = 0
            Me.ItemHeight = &H12
            Me.Font = New Font("Segoe UI", 8!, FontStyle.Regular)
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatComboBox.__ENCList
            SyncLock list
                If (FlatComboBox.__ENCList.Count = FlatComboBox.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatComboBox.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatComboBox.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatComboBox.__ENCList.Item(index) = FlatComboBox.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatComboBox.__ENCList.RemoveRange(index, (FlatComboBox.__ENCList.Count - index))
                    FlatComboBox.__ENCList.Capacity = FlatComboBox.__ENCList.Count
                End If
                FlatComboBox.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Public Sub DrawItem_(ByVal sender As Object, ByVal e As DrawItemEventArgs)
            If (e.Index >= 0) Then
                e.DrawBackground
                e.DrawFocusRectangle
                e.Graphics.SmoothingMode = SmoothingMode.HighQuality
                e.Graphics.PixelOffsetMode = PixelOffsetMode.HighQuality
                e.Graphics.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
                e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
                If ((e.State And DrawItemState.Selected) = DrawItemState.Selected) Then
                    e.Graphics.FillRectangle(New SolidBrush(Me._HoverColor), e.Bounds)
                Else
                    e.Graphics.FillRectangle(New SolidBrush(Me._BaseColor), e.Bounds)
                End If
                Dim layoutRectangle As New Rectangle((e.Bounds.X + 2), (e.Bounds.Y + 2), e.Bounds.Width, e.Bounds.Height)
                e.Graphics.DrawString(MyBase.GetItemText(RuntimeHelpers.GetObjectValue(MyBase.Items.Item(e.Index))), New Font("Segoe UI", 8!), Brushes.White, layoutRectangle)
                e.Graphics.Dispose
            End If
        End Sub

        Protected Overrides Sub OnClick(ByVal e As EventArgs)
            MyBase.OnClick(e)
            Me.Invalidate
        End Sub

        Protected Overrides Sub OnDrawItem(ByVal e As DrawItemEventArgs)
            MyBase.OnDrawItem(e)
            Me.Invalidate
            If ((e.State And DrawItemState.Selected) = DrawItemState.Selected) Then
                Me.Invalidate
            End If
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
            Me.x = e.Location.X
            Me.y = e.Location.Y
            Me.Invalidate
            If (e.X < (Me.Width - &H29)) Then
                Me.Cursor = Cursors.IBeam
            Else
                Me.Cursor = Cursors.Hand
            End If
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
            Dim rect As New Rectangle(0, 0, Me.W, Me.H)
            Dim rectangle2 As New Rectangle((Me.W - 40), 0, Me.W, Me.H)
            Dim path As New GraphicsPath
            New GraphicsPath
            Dim g As Graphics = Helpers.G
            g.Clear(Color.FromArgb(&H2D, &H2D, &H30))
            g.SmoothingMode = SmoothingMode.HighQuality
            g.PixelOffsetMode = PixelOffsetMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.FillRectangle(New SolidBrush(Me._BGColor), rect)
            path.Reset
            path.AddRectangle(rectangle2)
            g.SetClip(path)
            g.FillRectangle(New SolidBrush(Me._BaseColor), rectangle2)
            g.ResetClip
            g.DrawLine(Pens.White, (Me.W - 10), 6, (Me.W - 30), 6)
            g.DrawLine(Pens.White, (Me.W - 10), 12, (Me.W - 30), 12)
            g.DrawLine(Pens.White, (Me.W - 10), &H12, (Me.W - 30), &H12)
            Dim point As New Point(4, 6)
            g.DrawString(Me.Text, Me.Font, Brushes.White, DirectCast(point, PointF), Helpers.NearSF)
            g = Nothing
            Helpers.G.Dispose
            e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
            e.Graphics.DrawImageUnscaled(Helpers.B, 0, 0)
            Helpers.B.Dispose
        End Sub

        Protected Overrides Sub OnResize(ByVal e As EventArgs)
            MyBase.OnResize(e)
            Me.Height = &H12
        End Sub


        ' Properties
        <Category("Colors")> _
        Public Property HoverColor As Color
            Get
                Return Me._HoverColor
            End Get
            Set(ByVal value As Color)
                Me._HoverColor = value
            End Set
        End Property

        Private Property StartIndex As Integer
            Get
                Return Me._StartIndex
            End Get
            Set(ByVal value As Integer)
                Me._StartIndex = value
                Try 
                    MyBase.SelectedIndex = value
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    ProjectData.ClearProjectError
                End Try
                Me.Invalidate
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private _BaseColor As Color
        Private _BGColor As Color
        Private _HoverColor As Color
        Private _StartIndex As Integer
        Private H As Integer
        Private State As MouseState
        Private W As Integer
        Private x As Integer
        Private y As Integer
    End Class
End Namespace

