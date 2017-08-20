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
    Friend Class FlatAlertBox
        Inherits Control
        ' Methods
        Public Sub New()
            FlatAlertBox.__ENCAddToList(Me)
            Me.State = MouseState.None
            Me.SuccessColor = Color.FromArgb(60, &H55, &H4F)
            Me.SuccessText = Color.FromArgb(&H23, &HA9, 110)
            Me.ErrorColor = Color.FromArgb(&H57, &H47, &H47)
            Me.ErrorText = Color.FromArgb(&HFE, &H8E, &H7A)
            Me.InfoColor = Color.FromArgb(70, &H5B, &H5E)
            Me.InfoText = Color.FromArgb(&H61, &HB9, &HBA)
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint))), True)
            Me.DoubleBuffered = True
            Me.BackColor = Color.FromArgb(60, 70, &H49)
            Dim size2 As New Size(&H240, &H2A)
            Me.Size = size2
            Dim point2 As New Point(10, &H3D)
            Me.Location = point2
            Me.Font = New Font("Segoe UI", 10!)
            Me.Cursor = Cursors.Hand
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatAlertBox.__ENCList
            SyncLock list
                If (FlatAlertBox.__ENCList.Count = FlatAlertBox.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatAlertBox.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatAlertBox.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatAlertBox.__ENCList.Item(index) = FlatAlertBox.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatAlertBox.__ENCList.RemoveRange(index, (FlatAlertBox.__ENCList.Count - index))
                    FlatAlertBox.__ENCList.Capacity = FlatAlertBox.__ENCList.Count
                End If
                FlatAlertBox.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub OnClick(ByVal e As EventArgs)
            MyBase.OnClick(e)
            Me.Visible = False
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
            Me.X = e.X
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
            Dim rect As New Rectangle(0, 0, Me.W, Me.H)
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me.BackColor)
            Select Case Me.K
                Case _Kind.Success
                    g.FillRectangle(New SolidBrush(Me.SuccessColor), rect)
                    rectangle2 = New Rectangle(8, 9, &H18, &H18)
                    g.FillEllipse(New SolidBrush(Me.SuccessText), rectangle2)
                    rectangle2 = New Rectangle(10, 11, 20, 20)
                    g.FillEllipse(New SolidBrush(Me.SuccessColor), rectangle2)
                    rectangle2 = New Rectangle(7, 7, Me.W, Me.H)
                    g.DrawString("ü", New Font("Wingdings", 22!), New SolidBrush(Me.SuccessText), rectangle2, Helpers.NearSF)
                    rectangle2 = New Rectangle(&H30, 12, Me.W, Me.H)
                    g.DrawString(Me.Text, Me.Font, New SolidBrush(Me.SuccessText), rectangle2, Helpers.NearSF)
                    rectangle2 = New Rectangle((Me.W - 30), (Me.H - &H1D), &H11, &H11)
                    g.FillEllipse(New SolidBrush(Color.FromArgb(&H23, Color.Black)), rectangle2)
                    rectangle2 = New Rectangle((Me.W - &H1C), &H10, Me.W, Me.H)
                    g.DrawString("r", New Font("Marlett", 8!), New SolidBrush(Me.SuccessColor), rectangle2, Helpers.NearSF)
                    If (Me.State = MouseState.Over) Then
                        rectangle2 = New Rectangle((Me.W - &H1C), &H10, Me.W, Me.H)
                        g.DrawString("r", New Font("Marlett", 8!), New SolidBrush(Color.FromArgb(&H19, Color.White)), rectangle2, Helpers.NearSF)
                    End If
                    Exit Select
                Case _Kind.Error
                    g.FillRectangle(New SolidBrush(Me.ErrorColor), rect)
                    rectangle2 = New Rectangle(8, 9, &H18, &H18)
                    g.FillEllipse(New SolidBrush(Me.ErrorText), rectangle2)
                    rectangle2 = New Rectangle(10, 11, 20, 20)
                    g.FillEllipse(New SolidBrush(Me.ErrorColor), rectangle2)
                    rectangle2 = New Rectangle(6, 11, Me.W, Me.H)
                    g.DrawString("r", New Font("Marlett", 16!), New SolidBrush(Me.ErrorText), rectangle2, Helpers.NearSF)
                    rectangle2 = New Rectangle(&H30, 12, Me.W, Me.H)
                    g.DrawString(Me.Text, Me.Font, New SolidBrush(Me.ErrorText), rectangle2, Helpers.NearSF)
                    rectangle2 = New Rectangle((Me.W - &H20), (Me.H - &H1D), &H11, &H11)
                    g.FillEllipse(New SolidBrush(Color.FromArgb(&H23, Color.Black)), rectangle2)
                    rectangle2 = New Rectangle((Me.W - 30), &H11, Me.W, Me.H)
                    g.DrawString("r", New Font("Marlett", 8!), New SolidBrush(Me.ErrorColor), rectangle2, Helpers.NearSF)
                    If (Me.State = MouseState.Over) Then
                        rectangle2 = New Rectangle((Me.W - 30), 15, Me.W, Me.H)
                        g.DrawString("r", New Font("Marlett", 8!), New SolidBrush(Color.FromArgb(&H19, Color.White)), rectangle2, Helpers.NearSF)
                    End If
                    Exit Select
                Case _Kind.Info
                    g.FillRectangle(New SolidBrush(Me.InfoColor), rect)
                    rectangle2 = New Rectangle(8, 9, &H18, &H18)
                    g.FillEllipse(New SolidBrush(Me.InfoText), rectangle2)
                    rectangle2 = New Rectangle(10, 11, 20, 20)
                    g.FillEllipse(New SolidBrush(Me.InfoColor), rectangle2)
                    rectangle2 = New Rectangle(12, -4, Me.W, Me.H)
                    g.DrawString("¡", New Font("Segoe UI", 20!, FontStyle.Bold), New SolidBrush(Me.InfoText), rectangle2, Helpers.NearSF)
                    rectangle2 = New Rectangle(&H30, 12, Me.W, Me.H)
                    g.DrawString(Me.Text, Me.Font, New SolidBrush(Me.InfoText), rectangle2, Helpers.NearSF)
                    rectangle2 = New Rectangle((Me.W - &H20), (Me.H - &H1D), &H11, &H11)
                    g.FillEllipse(New SolidBrush(Color.FromArgb(&H23, Color.Black)), rectangle2)
                    rectangle2 = New Rectangle((Me.W - 30), &H11, Me.W, Me.H)
                    g.DrawString("r", New Font("Marlett", 8!), New SolidBrush(Me.InfoColor), rectangle2, Helpers.NearSF)
                    If (Me.State = MouseState.Over) Then
                        rectangle2 = New Rectangle((Me.W - 30), &H11, Me.W, Me.H)
                        g.DrawString("r", New Font("Marlett", 8!), New SolidBrush(Color.FromArgb(&H19, Color.White)), rectangle2, Helpers.NearSF)
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
            Me.Height = &H2A
        End Sub

        Protected Overrides Sub OnTextChanged(ByVal e As EventArgs)
            MyBase.OnTextChanged(e)
            Me.Invalidate
        End Sub

        Public Sub ShowControl(ByVal Kind As _Kind, ByVal Str As String, ByVal Interval As Integer)
            Me.K = Kind
            Me.Text = Str
            Me.Visible = True
            Me.T = New Timer
            Me.T.Interval = Interval
            Me.T.Enabled = True
        End Sub

        Private Sub T_Tick(ByVal sender As Object, ByVal e As EventArgs)
            Me.Visible = False
            Me.T.Enabled = False
            Me.T.Dispose
        End Sub


        ' Properties
        <Category("Options")> _
        Public Property kind As _Kind
            Get
                Return Me.K
            End Get
            Set(ByVal value As _Kind)
                Me.K = value
            End Set
        End Property

        Private Overridable Property T As Timer
            <DebuggerNonUserCode> _
            Get
                Return Me._T
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As Timer)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.T_Tick)
                If (Not Me._T Is Nothing) Then
                    RemoveHandler Me._T.Tick, handler
                End If
                Me._T = value
                If (Not Me._T Is Nothing) Then
                    AddHandler Me._T.Tick, handler
                End If
            End Set
        End Property

        <Category("Options")> _
        Public Overrides Property [Text] As String
            Get
                Return MyBase.Text
            End Get
            Set(ByVal value As String)
                MyBase.Text = value
                If (Not Me._Text Is Nothing) Then
                    Me._Text = value
                End If
            End Set
        End Property

        <Category("Options")> _
        Public Property Visible As Boolean
            Get
                Return Not MyBase.Visible
            End Get
            Set(ByVal value As Boolean)
                MyBase.Visible = value
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("T")> _
        Private _T As Timer
        Private _Text As String
        Private ErrorColor As Color
        Private ErrorText As Color
        Private H As Integer
        Private InfoColor As Color
        Private InfoText As Color
        Private K As _Kind
        Private State As MouseState
        Private SuccessColor As Color
        Private SuccessText As Color
        Private W As Integer
        Private X As Integer

        ' Nested Types
        <Flags> _
        Public Enum _Kind
            ' Fields
            [Error] = 1
            Info = 2
            Success = 0
        End Enum
    End Class
End Namespace

