Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.Diagnostics
Imports System.IO
Imports System.Net.Sockets
Imports System.Runtime.CompilerServices
Imports System.Threading

Public Class SK

    Public Disconnect2 As List(Of Client) = New List(Of Client)
    Private IT As Client() = New Client(&H65 - 1) {}
    Private [OFF] As Boolean = False
    Public Online2 As Collection = New Collection
    Public S As TcpListener
    Public SPL As String = "[endof]"

    Public Sub New(ByVal port As Integer)
        S = New TcpListener(port)
        S.Server.SendTimeout = -1
        S.Server.ReceiveTimeout = -1
        S.Start()
        Dim zz As New Thread(New ThreadStart(AddressOf WL), 1)
        zz.Start()
    End Sub

    Private Sub _Lambda__2(ByVal a0 As Object)
        READ(Conversions.ToInteger(a0))
    End Sub

    Public Function fx(ByVal b As Byte()) As Array
        Dim list As New List(Of Byte())
        Dim stream As New MemoryStream
        Dim stream2 As New MemoryStream
        Dim strArray As String() = Strings.Split(FN.BS(b), SPL, -1, CompareMethod.Binary)
        stream.Write(b, 0, strArray(0).Length)
        stream2.Write(b, (strArray(0).Length + SPL.Length), (b.Length - (strArray(0).Length + SPL.Length)))
        list.Add(stream.ToArray)
        list.Add(stream2.ToArray)
        stream.Dispose()
        stream2.Dispose()
        Return list.ToArray
    End Function

    Public Function GetClient(ByVal ID As String) As Client
        Dim online As Collection = Me.Online2
        SyncLock online
            Try
                Return DirectCast(online.Item(ID), Client)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                ProjectData.ClearProjectError()
            End Try
            Return Nothing
        End SyncLock
    End Function

    Public Sub pnd()
        Do While True
            Try
                Dim item As New Client(S.AcceptTcpClient)
                item.Client.ReceiveTimeout = -1
                item.Client.SendTimeout = -1
                Dim online As Collection = Online2
                SyncLock online
                    online.Add(item, item.ip, Nothing, Nothing)
                End SyncLock
                ind.Log(("New Connection " & item.ip))
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                ind.Log(("errpnd " & exception.Message))
                ProjectData.ClearProjectError()
            End Try
        Loop
    End Sub

    Private Sub READ(ByVal id As Integer)
Label_0008:
        Do While (IT(id) Is Nothing)
            Thread.Sleep(1)
        Loop
        Dim num As Integer = 0
        Dim item As Client = IT(id)
        If (OFF OrElse Not item.CN) Then
            GoTo Label_02C6
        End If
        Try
            num = 1
            If Not item.Client.Connected Then
                GoTo Label_02C6
            End If
            If Not item.IsPNGED Then
                If (item.Ping <= &H4B0) Then
                    GoTo Label_0098
                End If
                item.IsPNGED = True
                item.Ping = 0
                If item.Send("P") Then
                    GoTo Label_0098
                End If
                num = 2
                GoTo Label_02C6
            End If
            If (item.Ping > &HBB8) Then
                num = 3
                GoTo Label_02C6
            End If
Label_0098:
            If (item.Client.Available <= 0) Then
                GoTo Label_02B1
            End If
            Dim buffer As Byte() = New Byte(((item.Client.Available - 1) + 1) - 1) {}
            item.Client.Client.Receive(buffer, 0, buffer.Length, SocketFlags.None)
            ind.RC = (ind.RC + buffer.Length)
            item.M.Write(buffer, 0, buffer.Length)
Label_00F3:
            If FN.BS(item.M.ToArray).Contains(SPL) Then
                Dim instance As Array = fx(item.M.ToArray)
                Dim arguments As Object() = New Object(1 - 1) {}
                Dim num2 As Integer = 0
                arguments(0) = num2
                Dim b As Byte() = DirectCast(NewLateBinding.LateIndexGet(instance, arguments, Nothing), Byte())
                NewLateBinding.LateIndexSetComplex(instance, New Object() {num2, b}, Nothing, True, False)
                If (FN.BS(b) = "P") Then
                    num = 4
                    If (item.L Is Nothing) Then
                        GoTo Label_02C6
                    End If
                    ind.Req(New Object() {item, FN.SB(("P" & ind.Y & Conversions.ToString(item.Ping)))})
                    item.IsPNGED = False
                    item.Ping = 0
                Else
                    ind.Req(New Object() {item, RuntimeHelpers.GetObjectValue(NewLateBinding.LateIndexGet(instance, New Object() {0}, Nothing))})
                End If
                item.M.Dispose()
                item.M = New MemoryStream
                If (instance.Length = 2) Then
                    item.M.Write(DirectCast(NewLateBinding.LateIndexGet(instance, New Object() {1}, Nothing), Byte()), 0, Conversions.ToInteger(NewLateBinding.LateGet(NewLateBinding.LateIndexGet(instance, New Object() {1}, Nothing), Nothing, "length", New Object(0 - 1) {}, Nothing, Nothing, Nothing)))
                    GoTo Label_00F3
                End If
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            num = 5
            ProjectData.ClearProjectError()
            GoTo Label_02C6
        End Try
Label_02B1:
        item.Buzy = False
        IT(id) = Nothing
        GoTo Label_0008
Label_02C6:
        item.T.Enabled = False
        item.T.Dispose()
        item.CN = False
        Dim disconnect As List(Of Client) = Disconnect2
        SyncLock disconnect
            disconnect.Add(item)
        End SyncLock
        IT(id) = Nothing
        ind.Log(("Disconnected " & Conversions.ToString(num) & " " & item.ip))
        GoTo Label_0008
    End Sub

    Private Sub WL()
        Dim collection As Collection
        Dim num As Integer = 0
        Dim num6 As Integer = (IT.Length - 1)
        Dim i As Integer = 0
        Do While (i <= num6)
            Dim thread2 As New Thread(New ParameterizedThreadStart(AddressOf _Lambda__2), 0)
            thread2.Priority = ThreadPriority.Lowest
            thread2.Start(i)
            i += 1
        Loop
        Dim thread As New Thread(New ThreadStart(AddressOf pnd))
        thread.Start()

Label_0067:
        collection = Online2
        SyncLock collection
            Dim disconnect As List(Of Client) = Disconnect2
            SyncLock disconnect
                Dim client As Client
                Dim num4 As Integer = 0
                Do
                    Try
                        If (disconnect.Count > 0) Then
                            client = disconnect.Item(0)
                            disconnect.RemoveAt(0)
                            Try
                                client.Client.Client.Disconnect(False)
                            Catch exception1 As Exception
                                ProjectData.SetProjectError(exception1)
                                Dim exception As Exception = exception1
                                ProjectData.ClearProjectError()
                            End Try
                            Try
                                client.Client.Close()
                            Catch exception4 As Exception
                                ProjectData.SetProjectError(exception4)
                                Dim exception2 As Exception = exception4
                                ProjectData.ClearProjectError()
                            End Try
                            Online2.Remove(client.ip.ToString)
                            thread = New Thread(New ParameterizedThreadStart(AddressOf ind.Req), 1)
                            Dim parameter As Object() = New Object(2 - 1) {}
                            parameter(0) = client
                            Dim s As String = "!"
                            parameter(1) = FN.SB(s)
                            thread.Start(parameter)
                        End If
                    Catch exception5 As Exception
                        ProjectData.SetProjectError(exception5)
                        Dim exception3 As Exception = exception5
                        ProjectData.ClearProjectError()
                    End Try
                    num4 += 1
                Loop While (num4 <= 0)
                Dim num7 As Integer = (IT.Length - 1)
                Dim j As Integer = 0
                Do While (j <= num7)
                    If (IT(j) Is Nothing) Then
                        If (Online2.Count <= 0) Then
                            GoTo Label_01E8
                        End If
                        num += 1
                        If (num > Online2.Count) Then
                            num = 1
                        End If
                        client = DirectCast(Online2.Item(num), Client)
                        If Not client.Buzy Then
                            client.Buzy = True
                            IT(j) = client
                        End If
                    End If
                    j += 1
                Loop
            End SyncLock
        End SyncLock
Label_01E8:
        thread.Sleep(1)
        GoTo Label_0067
    End Sub

End Class