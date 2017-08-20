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
    <DefaultEvent("CheckedChanged")> _
    Friend Class RadioButton
        Inherits Control
        ' Events
        Public Custom Event CheckedChanged As CheckedChangedEventHandler

        ' Methods
        Public Sub New()
            RadioButton.__ENCAddToList(Me)
            Me.State = MouseState.None
            Me._BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me._BorderColor = Helpers._FlatColor
            Me._TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint))), True)
            Me.DoubleBuffered = True
            Me.Cursor = Cursors.Hand
            Dim size2 As New Size(100, &H16)
            Me.Size = size2
            Me.BackColor = Color.FromArgb(60, 70, &H49)
            Me.Font = New Font("Segoe UI", 10!)
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = RadioButton.__ENCList
            SyncLock list
                If (RadioButton.__ENCList.Count = RadioButton.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (RadioButton.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = RadioButton.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                RadioButton.__ENCList.Item(index) = RadioButton.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    RadioButton.__ENCList.RemoveRange(index, (RadioButton.__ENCList.Count - index))
                    RadioButton.__ENCList.Capacity = RadioButton.__ENCList.Count
                End If
                RadioButton.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Private Sub InvalidateControls()
            If (Me.IsHandleCreated AndAlso Me._Checked) Then
                Dim enumerator As IEnumerator
                Try 
                    enumerator = Me.Parent.Controls.GetEnumerator
                    Do While enumerator.MoveNext
                        Dim current As Control = DirectCast(enumerator.Current, Control)
                        If (If(((current Is Me) OrElse Not TypeOf current Is RadioButton), 0, 1) <> 0) Then
                            DirectCast(current, RadioButton).Checked = False
                            Me.Invalidate
                        End If
                    Loop
                Finally
                    If TypeOf enumerator Is IDisposable Then
                        TryCast(enumerator,IDisposable).Dispose
                    End If
                End Try
            End If
        End Sub

        Protected Overrides Sub OnClick(ByVal e As EventArgs)
            If Not Me._Checked Then
                Me.Checked = True
            End If
            MyBase.OnClick(e)
        End Sub

        Protected Overrides Sub OnCreateControl()
            MyBase.OnCreateControl
            Me.InvalidateControls
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
            Dim rect As New Rectangle(0, 2, (Me.Height - 5), (Me.Height - 5))
            Dim rectangle2 As New Rectangle(4, 6, (Me.H - 12), (Me.H - 12))
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me.BackColor)
            Select Case Me.O
                Case _Options.Style1
                    g.FillEllipse(New SolidBrush(Me._BaseColor), rect)
                    Select Case CByte((CInt(Me.State) - 1))
                        Case 0
                            g.DrawEllipse(New Pen(Me._BorderColor), rect)
                            goto Label_0104
                        Case 1
                            g.DrawEllipse(New Pen(Me._BorderColor), rect)
                            goto Label_0104
                    End Select
                    Exit Select
                Case _Options.Style2
                    g.FillEllipse(New SolidBrush(Me._BaseColor), rect)
                    Select Case CByte((CInt(Me.State) - 1))
                        Case 0
                            g.DrawEllipse(New Pen(Me._BorderColor), rect)
                            g.FillEllipse(New SolidBrush(Color.FromArgb(&H6F, &H1F, &H95)), rect)
                            Exit Select
                        Case 1
                            g.DrawEllipse(New Pen(Me._BorderColor), rect)
                            g.FillEllipse(New SolidBrush(Color.FromArgb(&H6F, &H1F, &H95)), rect)
                            Exit Select
                    End Select
                    If Me.Checked Then
                        g.FillEllipse(New SolidBrush(Me._BorderColor), rectangle2)
                    End If
                    goto Label_01C7
                Case Else
                    goto Label_01C7
            End Select
        Label_0104:
            If Me.Checked Then
                g.FillEllipse(New SolidBrush(Me._BorderColor), rectangle2)
            End If
        Label_01C7:
            rectangle3 = New Rectangle(20, 2, Me.W, Me.H)
            g.DrawString(Me.Text, Me.Font, New SolidBrush(Me._TextColor), rectangle3, Helpers.NearSF)
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


        ' Properties
        Public Property Checked As Boolean
            Get
                Return Me._Checked
            End Get
            Set(ByVal value As Boolean)
                Me._Checked = value
                Me.InvalidateControls
                Dim checkedChangedEvent As CheckedChangedEventHandler = Me.CheckedChangedEvent
                If (Not checkedChangedEvent Is Nothing) Then
                    checkedChangedEvent.Invoke(Me)
                End If
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

