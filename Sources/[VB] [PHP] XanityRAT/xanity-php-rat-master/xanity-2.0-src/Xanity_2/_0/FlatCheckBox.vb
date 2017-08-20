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
    Friend Class FlatCheckBox
        Inherits Control
        ' Events
        Public Custom Event CheckedChanged As CheckedChangedEventHandler

        ' Methods
        Public Sub New()
            FlatCheckBox.__ENCAddToList(Me)
            Me.State = MouseState.None
            Me._BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me._BorderColor = Helpers._FlatColor
            Me._TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint))), True)
            Me.DoubleBuffered = True
            Me.BackColor = Color.FromArgb(60, 70, &H49)
            Me.Cursor = Cursors.Hand
            Me.Font = New Font("Segoe UI", 10!)
            Dim size2 As New Size(&H70, &H16)
            Me.Size = size2
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatCheckBox.__ENCList
            SyncLock list
                If (FlatCheckBox.__ENCList.Count = FlatCheckBox.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatCheckBox.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatCheckBox.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatCheckBox.__ENCList.Item(index) = FlatCheckBox.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatCheckBox.__ENCList.RemoveRange(index, (FlatCheckBox.__ENCList.Count - index))
                    FlatCheckBox.__ENCList.Capacity = FlatCheckBox.__ENCList.Count
                End If
                FlatCheckBox.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub OnClick(ByVal e As EventArgs)
            Me._Checked = Not Me._Checked
            Dim checkedChangedEvent As CheckedChangedEventHandler = Me.CheckedChangedEvent
            If (Not checkedChangedEvent Is Nothing) Then
                checkedChangedEvent.Invoke(Me)
            End If
            MyBase.OnClick(e)
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
            Dim rectangle2 As Rectangle
            Helpers.B = New Bitmap(Me.Width, Me.Height)
            Helpers.G = Graphics.FromImage(Helpers.B)
            Me.W = (Me.Width - 1)
            Me.H = (Me.Height - 1)
            Dim rect As New Rectangle(0, 2, (Me.Height - 5), (Me.Height - 5))
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me.BackColor)
            Select Case Me.O
                Case _Options.Style1
                    g.FillRectangle(New SolidBrush(Me._BaseColor), rect)
                    Select Case CByte((CInt(Me.State) - 1))
                        Case 0
                            g.DrawRectangle(New Pen(Me._BorderColor), rect)
                            goto Label_00E9
                        Case 1
                            g.DrawRectangle(New Pen(Me._BorderColor), rect)
                            goto Label_00E9
                    End Select
                    Exit Select
                Case _Options.Style2
                    g.FillRectangle(New SolidBrush(Me._BaseColor), rect)
                    Select Case CByte((CInt(Me.State) - 1))
                        Case 0
                            g.DrawRectangle(New Pen(Me._BorderColor), rect)
                            g.FillRectangle(New SolidBrush(Color.FromArgb(&H76, &HD5, 170)), rect)
                            Exit Select
                        Case 1
                            g.DrawRectangle(New Pen(Me._BorderColor), rect)
                            g.FillRectangle(New SolidBrush(Color.FromArgb(&H76, &HD5, 170)), rect)
                            Exit Select
                    End Select
                    If Me.Checked Then
                        rectangle2 = New Rectangle(5, 7, (Me.H - 9), (Me.H - 9))
                        g.DrawString("ü", New Font("Wingdings", 18!), New SolidBrush(Me._BorderColor), rectangle2, Helpers.CenterSF)
                    End If
                    If Not Me.Enabled Then
                        g.FillRectangle(New SolidBrush(Color.FromArgb(&H36, &H3A, &H3D)), rect)
                        rectangle2 = New Rectangle(20, 2, Me.W, Me.H)
                        g.DrawString(Me.Text, Me.Font, New SolidBrush(Color.FromArgb(&H30, &H77, &H5B)), rectangle2, Helpers.NearSF)
                    End If
                    rectangle2 = New Rectangle(20, 2, Me.W, Me.H)
                    g.DrawString(Me.Text, Me.Font, New SolidBrush(Me._TextColor), rectangle2, Helpers.NearSF)
                    goto Label_0376
                Case Else
                    goto Label_0376
            End Select
        Label_00E9:
            If Me.Checked Then
                rectangle2 = New Rectangle(5, 7, (Me.H - 9), (Me.H - 9))
                g.DrawString("ü", New Font("Wingdings", 18!), New SolidBrush(Me._BorderColor), rectangle2, Helpers.CenterSF)
            End If
            If Not Me.Enabled Then
                g.FillRectangle(New SolidBrush(Color.FromArgb(&H36, &H3A, &H3D)), rect)
                rectangle2 = New Rectangle(20, 2, Me.W, Me.H)
                g.DrawString(Me.Text, Me.Font, New SolidBrush(Color.FromArgb(140, &H8E, &H8F)), rectangle2, Helpers.NearSF)
            End If
            rectangle2 = New Rectangle(20, 2, Me.W, Me.H)
            g.DrawString(Me.Text, Me.Font, New SolidBrush(Me._TextColor), rectangle2, Helpers.NearSF)
        Label_0376:
            g = Nothing
            MyBase.OnPaint(e)
            Helpers.G.Dispose
            e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
            e.Graphics.DrawImageUnscaled(Helpers.B, 0, 0)
            Helpers.B.Dispose
        End Sub

        Protected Overrides Sub OnResize(ByVal e As EventArgs)
            MyBase.OnResize(e)
            Me.Height = &H16
        End Sub

        Protected Overrides Sub OnTextChanged(ByVal e As EventArgs)
            MyBase.OnTextChanged(e)
            Me.Invalidate
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

        Public Property Checked As Boolean
            Get
                Return Me._Checked
            End Get
            Set(ByVal value As Boolean)
                Me._Checked = value
                Me.Invalidate
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
        Private _BaseColor As Color
        Private _BorderColor As Color
        Private _Checked As Boolean
        Private _TextColor As Color
        Private H As Integer
        Private O As _Options
        Private State As MouseState
        Private W As Integer

        ' Nested Types
        <Flags> _
        Public Enum _Options
            ' Fields
            Style1 = 0
            Style2 = 1
        End Enum

        Public Delegate Sub CheckedChangedEventHandler(ByVal sender As Object)
    End Class
End Namespace

