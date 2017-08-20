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
    <DefaultEvent("CheckedChanged")> _
    Friend Class FlatToggle
        Inherits Control
        ' Events
        Public Custom Event CheckedChanged As CheckedChangedEventHandler

        ' Methods
        Public Sub New()
            FlatToggle.__ENCAddToList(Me)
            Me._Checked = False
            Me.State = MouseState.None
            Me.BaseColor = Helpers._FlatColor
            Me.BaseColorRed = Color.FromArgb(220, &H55, &H60)
            Me.BGColor = Color.FromArgb(&H54, &H55, &H56)
            Me.ToggleColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.SupportsTransparentBackColor Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint)))), True)
            Me.DoubleBuffered = True
            Me.BackColor = Color.Transparent
            Dim size2 As New Size(&H2C, (Me.Height + 1))
            Me.Size = size2
            Me.Cursor = Cursors.Hand
            Me.Font = New Font("Segoe UI", 10!)
            size2 = New Size(&H4C, &H21)
            Me.Size = size2
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatToggle.__ENCList
            SyncLock list
                If (FlatToggle.__ENCList.Count = FlatToggle.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatToggle.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatToggle.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatToggle.__ENCList.Item(index) = FlatToggle.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatToggle.__ENCList.RemoveRange(index, (FlatToggle.__ENCList.Count - index))
                    FlatToggle.__ENCList.Capacity = FlatToggle.__ENCList.Count
                End If
                FlatToggle.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub OnClick(ByVal e As EventArgs)
            MyBase.OnClick(e)
            Me._Checked = Not Me._Checked
            Dim checkedChangedEvent As CheckedChangedEventHandler = Me.CheckedChangedEvent
            If (Not checkedChangedEvent Is Nothing) Then
                checkedChangedEvent.Invoke(Me)
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

        Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
            MyBase.OnMouseUp(e)
            Me.State = MouseState.Over
            Me.Invalidate
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Dim rectangle3 As Rectangle
            Helpers.B = New Bitmap(Me.Width, Me.Height)
            Helpers.G = Graphics.FromImage(Helpers.B)
            Me.W = (Me.Width - 1)
            Me.H = (Me.Height - 1)
            Dim path As New GraphicsPath
            Dim path2 As New GraphicsPath
            Dim rectangle As New Rectangle(0, 0, Me.W, Me.H)
            Dim rectangle2 As New Rectangle((Me.W / 2), 0, &H26, Me.H)
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.PixelOffsetMode = PixelOffsetMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me.BackColor)
            Select Case Me.O
                Case _Options.Style1
                    path = Helpers.RoundRec(rectangle, 6)
                    path2 = Helpers.RoundRec(rectangle2, 6)
                    g.FillPath(New SolidBrush(Me.BGColor), path)
                    g.FillPath(New SolidBrush(Me.ToggleColor), path2)
                    rectangle3 = New Rectangle(&H13, 1, Me.W, Me.H)
                    g.DrawString("OFF", Me.Font, New SolidBrush(Me.BGColor), rectangle3, Helpers.CenterSF)
                    If Me.Checked Then
                        path = Helpers.RoundRec(rectangle, 6)
                        rectangle3 = New Rectangle((Me.W / 2), 0, &H26, Me.H)
                        path2 = Helpers.RoundRec(rectangle3, 6)
                        g.FillPath(New SolidBrush(Me.ToggleColor), path)
                        g.FillPath(New SolidBrush(Me.BaseColor), path2)
                        rectangle3 = New Rectangle(8, 7, Me.W, Me.H)
                        g.DrawString("ON", Me.Font, New SolidBrush(Me.BaseColor), rectangle3, Helpers.NearSF)
                    End If
                    Exit Select
                Case _Options.Style2
                    path = Helpers.RoundRec(rectangle, 6)
                    rectangle2 = New Rectangle(4, 4, &H24, (Me.H - 8))
                    path2 = Helpers.RoundRec(rectangle2, 4)
                    g.FillPath(New SolidBrush(Me.BaseColorRed), path)
                    g.FillPath(New SolidBrush(Me.ToggleColor), path2)
                    g.DrawLine(New Pen(Me.BGColor), &H12, 20, &H12, 12)
                    g.DrawLine(New Pen(Me.BGColor), &H16, 20, &H16, 12)
                    g.DrawLine(New Pen(Me.BGColor), &H1A, 20, &H1A, 12)
                    rectangle3 = New Rectangle(&H13, 2, Me.Width, Me.Height)
                    g.DrawString("r", New Font("Marlett", 8!), New SolidBrush(Me.TextColor), rectangle3, Helpers.CenterSF)
                    If Me.Checked Then
                        path = Helpers.RoundRec(rectangle, 6)
                        rectangle2 = New Rectangle(((Me.W / 2) - 2), 4, &H24, (Me.H - 8))
                        path2 = Helpers.RoundRec(rectangle2, 4)
                        g.FillPath(New SolidBrush(Me.BaseColor), path)
                        g.FillPath(New SolidBrush(Me.ToggleColor), path2)
                        g.DrawLine(New Pen(Me.BGColor), ((Me.W / 2) + 12), 20, ((Me.W / 2) + 12), 12)
                        g.DrawLine(New Pen(Me.BGColor), ((Me.W / 2) + &H10), 20, ((Me.W / 2) + &H10), 12)
                        g.DrawLine(New Pen(Me.BGColor), ((Me.W / 2) + 20), 20, ((Me.W / 2) + 20), 12)
                        rectangle3 = New Rectangle(8, 7, Me.Width, Me.Height)
                        g.DrawString("ü", New Font("Wingdings", 14!), New SolidBrush(Me.TextColor), rectangle3, Helpers.NearSF)
                    End If
                    Exit Select
                Case _Options.Style3
                    path = Helpers.RoundRec(rectangle, &H10)
                    rectangle2 = New Rectangle((Me.W - &H1C), 4, &H16, (Me.H - 8))
                    path2.AddEllipse(rectangle2)
                    g.FillPath(New SolidBrush(Me.ToggleColor), path)
                    g.FillPath(New SolidBrush(Me.BaseColorRed), path2)
                    rectangle3 = New Rectangle(-12, 2, Me.W, Me.H)
                    g.DrawString("OFF", Me.Font, New SolidBrush(Me.BaseColorRed), rectangle3, Helpers.CenterSF)
                    If Me.Checked Then
                        path = Helpers.RoundRec(rectangle, &H10)
                        rectangle2 = New Rectangle(6, 4, &H16, (Me.H - 8))
                        path2.Reset
                        path2.AddEllipse(rectangle2)
                        g.FillPath(New SolidBrush(Me.ToggleColor), path)
                        g.FillPath(New SolidBrush(Me.BaseColor), path2)
                        rectangle3 = New Rectangle(12, 2, Me.W, Me.H)
                        g.DrawString("ON", Me.Font, New SolidBrush(Me.BaseColor), rectangle3, Helpers.CenterSF)
                    End If
                    Exit Select
                Case _Options.Style4
                    If Not Me.Checked Then
                    End If
                    Exit Select
                Case _Options.Style5
                    If Not Me.Checked Then
                    End If
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
            Me.Width = &H4C
            Me.Height = &H21
        End Sub

        Protected Overrides Sub OnTextChanged(ByVal e As EventArgs)
            MyBase.OnTextChanged(e)
            Me.Invalidate
        End Sub


        ' Properties
        <Category("Options")> _
        Public Property Checked As Boolean
            Get
                Return Me._Checked
            End Get
            Set(ByVal value As Boolean)
                Me._Checked = value
            End Set
        End Property

        <Category("Options")> _
        Public Property Options As _Options
            Get
                Return Me.O
            End Get
            Set(ByVal value As _Options)
                Me.O = value
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private _Checked As Boolean
        Private BaseColor As Color
        Private BaseColorRed As Color
        Private BGColor As Color
        Private H As Integer
        Private O As _Options
        Private State As MouseState
        Private TextColor As Color
        Private ToggleColor As Color
        Private W As Integer

        ' Nested Types
        <Flags> _
        Public Enum _Options
            ' Fields
            Style1 = 0
            Style2 = 1
            Style3 = 2
            Style4 = 3
            Style5 = 4
        End Enum

        Public Delegate Sub CheckedChangedEventHandler(ByVal sender As Object)
    End Class
End Namespace

