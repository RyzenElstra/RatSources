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
    Friend Class FormSkin
        Inherits ContainerControl
        ' Methods
        Public Sub New()
            AddHandler MyBase.MouseDoubleClick, New MouseEventHandler(AddressOf Me.FormSkin_MouseDoubleClick)
            FormSkin.__ENCAddToList(Me)
            Me.Cap = False
            Me._HeaderMaximize = False
            Me.MousePoint = New Point(0, 0)
            Me.MoveHeight = 50
            Me._HeaderColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me._BaseColor = Color.FromArgb(60, 70, &H49)
            Me._BorderColor = Color.FromArgb(&H35, &H3A, 60)
            Me.TextColor = Color.FromArgb(&HEA, &HEA, &HEA)
            Me._HeaderLight = Color.FromArgb(&HAB, &HAB, &HAC)
            Me._BaseLight = Color.FromArgb(&HC4, &HC7, 200)
            Me.TextLight = Color.FromArgb(&H2D, &H2F, &H31)
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint))), True)
            Me.DoubleBuffered = True
            Me.BackColor = Color.White
            Me.Font = New Font("Segoe UI", 12!)
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FormSkin.__ENCList
            SyncLock list
                If (FormSkin.__ENCList.Count = FormSkin.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FormSkin.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FormSkin.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FormSkin.__ENCList.Item(index) = FormSkin.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FormSkin.__ENCList.RemoveRange(index, (FormSkin.__ENCList.Count - index))
                    FormSkin.__ENCList.Capacity = FormSkin.__ENCList.Count
                End If
                FormSkin.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Private Sub FormSkin_MouseDoubleClick(ByVal sender As Object, ByVal e As MouseEventArgs)
            If Me.HeaderMaximize Then
                Dim rectangle2 As New Rectangle(0, 0, Me.Width, Conversions.ToInteger(Me.MoveHeight))
                If ((e.Button = MouseButtons.Left) And rectangle2.Contains(e.Location)) Then
                    If (Me.FindForm.WindowState = FormWindowState.Normal) Then
                        Me.FindForm.WindowState = FormWindowState.Maximized
                        Me.FindForm.Refresh
                    ElseIf (Me.FindForm.WindowState = FormWindowState.Maximized) Then
                        Me.FindForm.WindowState = FormWindowState.Normal
                        Me.FindForm.Refresh
                    End If
                End If
            End If
        End Sub

        Protected Overrides Sub OnCreateControl()
            MyBase.OnCreateControl
            Me.ParentForm.FormBorderStyle = FormBorderStyle.None
            Me.ParentForm.AllowTransparency = False
            Me.ParentForm.TransparencyKey = Color.Fuchsia
            Me.ParentForm.FindForm.StartPosition = FormStartPosition.CenterScreen
            Me.Dock = DockStyle.Fill
            Me.Invalidate
        End Sub

        Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
            MyBase.OnMouseDown(e)
            Dim rectangle2 As New Rectangle(0, 0, Me.Width, Conversions.ToInteger(Me.MoveHeight))
            If ((e.Button = MouseButtons.Left) And rectangle2.Contains(e.Location)) Then
                Me.Cap = True
                Me.MousePoint = e.Location
            End If
        End Sub

        Protected Overrides Sub OnMouseMove(ByVal e As MouseEventArgs)
            MyBase.OnMouseMove(e)
            If Me.Cap Then
                Me.Parent.Location = (Control.MousePosition - DirectCast(Me.MousePoint, Size))
            End If
        End Sub

        Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
            MyBase.OnMouseUp(e)
            Me.Cap = False
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Helpers.B = New Bitmap(Me.Width, Me.Height)
            Helpers.G = Graphics.FromImage(Helpers.B)
            Me.W = Me.Width
            Me.H = Me.Height
            Dim rect As New Rectangle(0, 0, Me.W, Me.H)
            Dim rectangle2 As New Rectangle(0, 0, Me.W, 50)
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.PixelOffsetMode = PixelOffsetMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me.BackColor)
            g.FillRectangle(New SolidBrush(Me._BaseColor), rect)
            g.FillRectangle(New SolidBrush(Me._HeaderColor), rectangle2)
            Dim rectangle3 As New Rectangle(8, &H10, 4, &H12)
            g.FillRectangle(New SolidBrush(Color.FromArgb(&HF3, &HF3, &HF3)), rectangle3)
            g.FillRectangle(New SolidBrush(Helpers._FlatColor), &H10, &H10, 4, &H12)
            rectangle3 = New Rectangle(&H1A, 15, Me.W, Me.H)
            g.DrawString(Me.Text, Me.Font, New SolidBrush(Me.TextColor), rectangle3, Helpers.NearSF)
            g.DrawRectangle(New Pen(Me._BorderColor), rect)
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

        <Category("Colors")> _
        Public Property BorderColor As Color
            Get
                Return Me._BorderColor
            End Get
            Set(ByVal value As Color)
                Me._BorderColor = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property FlatColor As Color
            Get
                Return Helpers._FlatColor
            End Get
            Set(ByVal value As Color)
                Helpers._FlatColor = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property HeaderColor As Color
            Get
                Return Me._HeaderColor
            End Get
            Set(ByVal value As Color)
                Me._HeaderColor = value
            End Set
        End Property

        <Category("Options")> _
        Public Property HeaderMaximize As Boolean
            Get
                Return Me._HeaderMaximize
            End Get
            Set(ByVal value As Boolean)
                Me._HeaderMaximize = value
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private _BaseColor As Color
        Private _BaseLight As Color
        Private _BorderColor As Color
        Private _HeaderColor As Color
        Private _HeaderLight As Color
        Private _HeaderMaximize As Boolean
        Private Cap As Boolean
        Private H As Integer
        Private MousePoint As Point
        Private MoveHeight As Object
        Private TextColor As Color
        Public TextLight As Color
        Private W As Integer
    End Class
End Namespace

