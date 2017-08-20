Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.Drawing
Imports System.IO
Imports System.Net.Sockets
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class Client

    Private _T As Timer
    Public Buzy As Boolean = False
    Public Client As TcpClient
    Public CN As Boolean = True
    Public Folder As String
    Public Isend As Boolean = False
    Public IsPNGED As Boolean = False
    Public IsUSB As Boolean = False
    Public L As ListViewItem
    Public lp As Integer = 0
    Public M As New MemoryStream
    Private oip As String = ""
    Public pc As Bitmap = Nothing
    Public Ping As Integer = 0
    Public plg As New List(Of String)
    Public snf As String() = Nothing
    Public SPL As String = "[endof]"


    Public Sub New(ByVal c As TcpClient)
        Client = c
        ind.F.Invoke(New _INV(AddressOf inv))
    End Sub

    Private Delegate Sub _INV()

    Private Sub inv()
        Dim timer As New Timer
        timer.Interval = 1
        timer.Enabled = True
        T = timer
    End Sub

    Public Function ip() As String
        If (oip.Length <= 0) Then
            Try
                oip = Client.Client.RemoteEndPoint.ToString
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                oip = GetHashCode.ToString
                ProjectData.ClearProjectError()
            End Try
        End If
        Return oip
    End Function

    Public Function Send(ByVal b As Byte()) As Boolean
        Dim flag As Boolean
        If Not CN Then
            Return False
        End If
        Try
            Dim client As Socket = Me.Client.Client
            SyncLock client
                Dim stream As New MemoryStream
                stream.Write(b, 0, b.Length)
                stream.Write(FN.SB(SPL), 0, SPL.Length)
                Me.Client.Client.Send(stream.ToArray, 0, CInt(stream.Length), SocketFlags.None)
                ind.SNT = (ind.SNT + CInt(stream.Length))
                stream.Dispose()
            End SyncLock
            flag = True
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            Me.CN = False
            flag = False
            ProjectData.ClearProjectError()
        End Try
        Return flag
    End Function

    Public Function Send(ByVal S As String) As Boolean
        Return Send(FN.SB(S))
    End Function

    Public Sub SendNoWait(ByVal b As Byte())
        Send(b)
    End Sub

    Private Sub T_Tick(ByVal sender As Object, ByVal e As EventArgs)
        Ping += 1
    End Sub

    Public Overridable Property T As Timer
        Get
            Return _T
        End Get
        <MethodImpl(MethodImplOptions.Synchronized)> _
        Set(ByVal WithEventsValue As Timer)
            Dim handler As EventHandler = New EventHandler(AddressOf Me.T_Tick)
            If (Not _T Is Nothing) Then
                RemoveHandler Me._T.Tick, handler
            End If
            _T = WithEventsValue
            If (Not _T Is Nothing) Then
                AddHandler _T.Tick, handler
            End If
        End Set
    End Property

End Class