Imports System.Collections.Generic
Imports System.Net.Sockets
Imports System.Net
Imports System.ComponentModel
Imports System.IO

'------------------
'Creator: aeonhack
'Site: nimoru.com
'Name: Buffered Server
'Created: 9/12/2012
'Changed: 6/13/2013
'Version: 1.2.0.3
'------------------

NotInheritable Class ServerClient
    Implements IDisposable

    'TODO: Lock objects where needed.
    'TODO: Create and handle ReadQueue?
    'TODO: Provide option to disable buffering.

#Region " Events "

    Public Event ExceptionThrown As ExceptionThrownEventHandler
    Public Delegate Sub ExceptionThrownEventHandler(sender As ServerClient, ex As Exception)

    Private Sub OnExceptionThrown(ex As Exception)
        RaiseEvent ExceptionThrown(Me, ex)
    End Sub

    Public Event StateChanged As StateChangedEventHandler
    Public Delegate Sub StateChangedEventHandler(sender As ServerClient, connected As Boolean)

    Private Sub OnStateChanged(connected As Boolean)
        RaiseEvent StateChanged(Me, connected)
    End Sub

    Public Event ReadPacket As ReadPacketEventHandler
    Public Delegate Sub ReadPacketEventHandler(sender As ServerClient, data As Byte())

    Private Sub OnReadPacket(data As Byte())
        RaiseEvent ReadPacket(Me, data)
    End Sub

    Public Event ReadProgressChanged As ReadProgressChangedEventHandler
    Public Delegate Sub ReadProgressChangedEventHandler(sender As ServerClient, progress As Double, bytesRead As Integer, bytesToRead As Integer)

    Private Sub OnReadProgressChanged(progress As Double, bytesRead As Integer, bytesToRead As Integer)
        RaiseEvent ReadProgressChanged(Me, progress, bytesRead, bytesToRead)
    End Sub

    Public Event WritePacket As WritePacketEventHandler
    Public Delegate Sub WritePacketEventHandler(sender As ServerClient, size As Integer)

    Private Sub OnWritePacket(size As Integer)
        RaiseEvent WritePacket(Me, size)
    End Sub

    Public Event WriteProgressChanged As WriteProgressChangedEventHandler
    Public Delegate Sub WriteProgressChangedEventHandler(sender As ServerClient, progress As Double, bytesWritten As Integer, bytesToWrite As Integer)

    Private Sub OnWriteProgressChanged(progress As Double, bytesWritten As Integer, bytesToWrite As Integer)
        RaiseEvent WriteProgressChanged(Me, progress, bytesWritten, bytesToWrite)
    End Sub

#End Region

#Region " Properties "

    Private _BufferSize As UShort = 8192
    Public ReadOnly Property BufferSize() As UShort
        Get
            Return _BufferSize
        End Get
    End Property

    Private _MaxPacketSize As Integer = 10485760
    Public Property MaxPacketSize() As Integer
        Get
            Return _MaxPacketSize
        End Get
        Set(value As Integer)
            If value < 1 Then
                Throw New Exception("Value must be greater than 0.")
            Else
                _MaxPacketSize = value
            End If
        End Set
    End Property

    Private _UserState As Object
    Public Property UserState() As Object
        Get
            Return _UserState
        End Get
        Set(value As Object)
            _UserState = value
        End Set
    End Property

    Private _EndPoint As IPEndPoint
    Public ReadOnly Property EndPoint() As IPEndPoint
        Get
            If _EndPoint IsNot Nothing Then
                Return _EndPoint
            Else
                Return New IPEndPoint(IPAddress.None, 0)
            End If
        End Get
    End Property

    Private _Connected As Boolean
    Public ReadOnly Property Connected() As Boolean
        Get
            Return _Connected
        End Get
    End Property

#End Region

    Private Handle As Socket

    Private SendIndex As Integer
    Private SendBuffer As Byte()

    Private ReadIndex As Integer
    Private ReadBuffer As Byte()

    Private SendQueue As Queue(Of Byte())

    Private Processing As Boolean() = New Boolean(1) {}
    Private Items As SocketAsyncEventArgs() = New SocketAsyncEventArgs(1) {}

    Public Sub New(sock As Socket, bufferSize As UShort, maxPacketSize As Integer)
        Try
            Initialize()
            Items(0).SetBuffer(New Byte(bufferSize - 1) {}, 0, bufferSize)

            Handle = sock

            _BufferSize = bufferSize
            _MaxPacketSize = maxPacketSize
            _EndPoint = DirectCast(Handle.RemoteEndPoint, IPEndPoint)
            _Connected = True

            If Not Handle.ReceiveAsync(Items(0)) Then
                Process(Nothing, Items(0))
            End If
        Catch ex As Exception
            OnExceptionThrown(ex)
            Disconnect()
        End Try
    End Sub

    Private Sub Initialize()
        Processing = New Boolean(1) {}

        SendIndex = 0
        ReadIndex = 0

        SendBuffer = New Byte(-1) {}
        ReadBuffer = New Byte(-1) {}

        SendQueue = New Queue(Of Byte())()

        Items = New SocketAsyncEventArgs(1) {}

        Items(0) = New SocketAsyncEventArgs()
        Items(1) = New SocketAsyncEventArgs()
        AddHandler Items(0).Completed, AddressOf Process
        AddHandler Items(1).Completed, AddressOf Process
    End Sub

    Private Sub Process(s As Object, e As SocketAsyncEventArgs)
        Try
            If e.SocketError = SocketError.Success Then
                Select Case e.LastOperation
                    Case SocketAsyncOperation.Receive
                        If Not _Connected Then Return

                        If Not e.BytesTransferred = 0 Then
                            HandleRead(e.Buffer, 0, e.BytesTransferred)

                            If Not Handle.ReceiveAsync(e) Then
                                Process(Nothing, e)
                            End If
                        Else
                            Disconnect()
                        End If
                    Case SocketAsyncOperation.Send
                        If Not _Connected Then Return

                        Dim EOS As Boolean
                        SendIndex += e.BytesTransferred

                        OnWriteProgressChanged((SendIndex / SendBuffer.Length) * 100, SendIndex, SendBuffer.Length)

                        If (SendIndex >= SendBuffer.Length) Then
                            EOS = True
                            OnWritePacket(SendBuffer.Length - 4)
                        End If

                        If SendQueue.Count = 0 AndAlso EOS Then
                            Processing(1) = False
                        Else
                            HandleSendQueue()
                        End If
                End Select
            Else
                OnExceptionThrown(New SocketException(e.SocketError))
                Disconnect()
            End If
        Catch ex As Exception
            OnExceptionThrown(ex)
            Disconnect()
        End Try
    End Sub

    Public Sub Disconnect()
        If Processing(0) Then
            Return
        Else
            Processing(0) = True
        End If

        Dim Raise As Boolean = _Connected
        _Connected = False

        If Handle IsNot Nothing Then
            Handle.Close()
        End If

        If SendQueue IsNot Nothing Then
            SendQueue.Clear()
        End If

        SendBuffer = New Byte(-1) {}
        ReadBuffer = New Byte(-1) {}

        If Raise Then
            OnStateChanged(False)
        End If

        If Items IsNot Nothing Then
            Items(0).Dispose()
            Items(1).Dispose()
        End If

        _UserState = Nothing
        _EndPoint = Nothing
    End Sub

    Public Sub Send(data As Byte())
        If Not _Connected Then Return

        SendQueue.Enqueue(data)

        If Not Processing(1) Then
            Processing(1) = True
            HandleSendQueue()
        End If
    End Sub

    Private Sub HandleSendQueue()
        Try
            If SendIndex >= SendBuffer.Length Then
                SendIndex = 0
                SendBuffer = Header(SendQueue.Dequeue())
            End If

            Dim Write As Integer = Math.Min(SendBuffer.Length - SendIndex, _BufferSize)
            Items(1).SetBuffer(SendBuffer, SendIndex, Write)

            If Not Handle.SendAsync(Items(1)) Then
                Process(Nothing, Items(1))
            End If
        Catch ex As Exception
            OnExceptionThrown(ex)
            Disconnect()
        End Try
    End Sub

    Private Shared Function Header(data As Byte()) As Byte()
        Dim T As Byte() = New Byte(data.Length + 3) {}
        Buffer.BlockCopy(BitConverter.GetBytes(data.Length), 0, T, 0, 4)
        Buffer.BlockCopy(data, 0, T, 4, data.Length)
        Return T
    End Function

    Private Sub HandleRead(data As Byte(), index As Integer, length As Integer)
        If ReadIndex >= ReadBuffer.Length Then
            ReadIndex = 0
            If data.Length < 4 Then
                OnExceptionThrown(New Exception("Missing or corrupt packet header."))
                Disconnect()
                Return
            End If

            Dim PacketSize As Integer = BitConverter.ToInt32(data, index)
            If PacketSize > _MaxPacketSize Then
                OnExceptionThrown(New Exception("Packet size exceeds MaxPacketSize."))
                Disconnect()
                Return
            End If

            Array.Resize(ReadBuffer, PacketSize)
            index += 4
        End If

        Dim Read As Integer = Math.Min(ReadBuffer.Length - ReadIndex, length - index)
        Buffer.BlockCopy(data, index, ReadBuffer, ReadIndex, Read)
        ReadIndex += Read

        OnReadProgressChanged((ReadIndex / ReadBuffer.Length) * 100, ReadIndex, ReadBuffer.Length)

        If ReadIndex >= ReadBuffer.Length Then
            OnReadPacket(ReadBuffer)
        End If

        If Read < (length - index) Then
            HandleRead(data, index + Read, length)
        End If
    End Sub

#Region " IDisposable Support "

    Private DisposedValue As Boolean

    Private Sub Dispose(disposing As Boolean)
        If Not DisposedValue AndAlso disposing Then Disconnect()
        DisposedValue = True
    End Sub

    Public Sub Dispose() Implements IDisposable.Dispose
        Dispose(True)
        GC.SuppressFinalize(Me)
    End Sub

#End Region

End Class

NotInheritable Class ServerListener
    Implements IDisposable

    'TODO: Remove some redundant code (e.g. Listen and Process socket preparation.)
    'TODO: Stop listening when at connection capacity, as opposed to disconnecting.
    'TODO: Implement option to limit simultaneous connections per source.

#Region " Events "

    Public Event StateChanged As StateChangedEventHandler
    Public Delegate Sub StateChangedEventHandler(sender As ServerListener, listening As Boolean)

    Private Sub OnStateChanged(listening As Boolean)
        RaiseEvent StateChanged(Me, listening)
    End Sub

    Public Event ExceptionThrown As ExceptionThrownEventHandler
    Public Delegate Sub ExceptionThrownEventHandler(sender As ServerListener, ex As Exception)

    Private Sub OnExceptionThrown(ex As Exception)
        RaiseEvent ExceptionThrown(Me, ex)
    End Sub

    Public Event ClientExceptionThrown As ClientExceptionThrownEventHandler
    Public Delegate Sub ClientExceptionThrownEventHandler(sender As ServerListener, client As ServerClient, ex As Exception)

    Private Sub OnClientExceptionThrown(client As ServerClient, ex As Exception)
        RaiseEvent ClientExceptionThrown(Me, client, ex)
    End Sub

    Public Event ClientStateChanged As ClientStateChangedEventHandler
    Public Delegate Sub ClientStateChangedEventHandler(sender As ServerListener, client As ServerClient, connected As Boolean)

    Private Sub OnClientStateChanged(client As ServerClient, connected As Boolean)
        RaiseEvent ClientStateChanged(Me, client, connected)
    End Sub

    Public Event ClientReadPacket As ClientReadPacketEventHandler
    Public Delegate Sub ClientReadPacketEventHandler(sender As ServerListener, client As ServerClient, data As Byte())

    Private Sub OnClientReadPacket(client As ServerClient, data As Byte())
        RaiseEvent ClientReadPacket(Me, client, data)
    End Sub

    Public Event ClientReadProgressChanged As ClientReadProgressChangedEventHandler
    Public Delegate Sub ClientReadProgressChangedEventHandler(sender As ServerListener, client As ServerClient, progress As Double, bytesRead As Integer, bytesToRead As Integer)

    Private Sub OnClientReadProgressChanged(client As ServerClient, progress As Double, bytesRead As Integer, bytesToRead As Integer)
        RaiseEvent ClientReadProgressChanged(Me, client, progress, bytesRead, bytesToRead)
    End Sub

    Public Event ClientWritePacket As ClientWritePacketEventHandler
    Public Delegate Sub ClientWritePacketEventHandler(sender As ServerListener, client As ServerClient, size As Integer)

    Private Sub OnClientWritePacket(client As ServerClient, size As Integer)
        RaiseEvent ClientWritePacket(Me, client, size)
    End Sub

    Public Event ClientWriteProgressChanged As ClientWriteProgressChangedEventHandler
    Public Delegate Sub ClientWriteProgressChangedEventHandler(sender As ServerListener, client As ServerClient, progress As Double, bytesWritten As Integer, bytesToWrite As Integer)

    Private Sub OnClientWriteProgressChanged(client As ServerClient, progress As Double, bytesWritten As Integer, bytesToWrite As Integer)
        RaiseEvent ClientWriteProgressChanged(Me, client, progress, bytesWritten, bytesToWrite)
    End Sub

#End Region

#Region " Properties "

    Private _BufferSize As UShort = 8192
    Public Property BufferSize() As UShort
        Get
            Return _BufferSize
        End Get
        Set(value As UShort)
            If value < 1 Then
                Throw New Exception("Value must be greater than 0.")
            Else
                _BufferSize = value
            End If
        End Set
    End Property

    Private _MaxPacketSize As Integer = 10485760
    Public Property MaxPacketSize() As Integer
        Get
            Return _MaxPacketSize
        End Get
        Set(value As Integer)
            If value < 1 Then
                Throw New Exception("Value must be greater than 0.")
            Else
                _MaxPacketSize = value
            End If
        End Set
    End Property

    Private _KeepAlive As Boolean = True
    Public Property KeepAlive() As Boolean
        Get
            Return _KeepAlive
        End Get
        Set(value As Boolean)
            If _Listening Then
                Throw New Exception("Unable to change this option while listening.")
            Else
                _KeepAlive = value
            End If
        End Set
    End Property

    Private _MaxConnections As UShort = 65535
    Public Property MaxConnections() As UShort
        Get
            Return _MaxConnections
        End Get
        Set(value As UShort)
            _MaxConnections = value
        End Set
    End Property

    Private _Listening As Boolean
    Public ReadOnly Property Listening() As Boolean
        Get
            Return _Listening
        End Get
    End Property

    Private _Clients As List(Of ServerClient)
    Public ReadOnly Property Clients() As ServerClient()
        Get
            If _Listening Then
                Return _Clients.ToArray()
            Else
                Return New ServerClient() {}
            End If
        End Get
    End Property

#End Region

    Private Handle As Socket

    Private Processing As Boolean
    Private Item As SocketAsyncEventArgs

    Public Sub Listen(port As UShort)
        Try
            If Not _Listening Then
                _Clients = New List(Of ServerClient)()

                Item = New SocketAsyncEventArgs()
                AddHandler Item.Completed, AddressOf Process
                Item.AcceptSocket = New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
                Item.AcceptSocket.NoDelay = True

                If _KeepAlive Then
                    Item.AcceptSocket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.KeepAlive, 20000)
                End If

                Handle = New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
                Handle.Bind(New IPEndPoint(IPAddress.Any, port))
                Handle.Listen(10)

                Processing = False
                _Listening = True

                OnStateChanged(True)
                If Not Handle.AcceptAsync(Item) Then
                    Process(Nothing, Item)
                End If
            End If
        Catch ex As Exception
            OnExceptionThrown(ex)
            Disconnect()
        End Try
    End Sub

    Private Sub Process(s As Object, e As SocketAsyncEventArgs)
        Try
            If e.SocketError = SocketError.Success Then
                Dim T As New ServerClient(e.AcceptSocket, _BufferSize, _MaxPacketSize)

                SyncLock _Clients
                    If _Clients.Count < _MaxConnections Then
                        _Clients.Add(T)
                        AddHandler T.StateChanged, AddressOf HandleStateChanged
                        AddHandler T.ExceptionThrown, AddressOf OnClientExceptionThrown
                        AddHandler T.ReadPacket, AddressOf OnClientReadPacket
                        AddHandler T.ReadProgressChanged, AddressOf OnClientReadProgressChanged
                        AddHandler T.WritePacket, AddressOf OnClientWritePacket
                        AddHandler T.WriteProgressChanged, AddressOf OnClientWriteProgressChanged

                        OnClientStateChanged(T, True)
                    Else
                        T.Disconnect()
                    End If
                End SyncLock

                e.AcceptSocket = New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
                e.AcceptSocket.NoDelay = True

                If _KeepAlive Then
                    e.AcceptSocket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.KeepAlive, 20000)
                End If

                If Not Handle.AcceptAsync(e) Then
                    Process(Nothing, e)
                End If
            Else
                OnExceptionThrown(New SocketException(e.SocketError))
                Disconnect()
            End If
        Catch ex As Exception
            OnExceptionThrown(ex)
            Disconnect()
        End Try
    End Sub

    Public Sub Disconnect()
        If Processing Then
            Return
        Else
            Processing = True
        End If

        If Handle IsNot Nothing Then
            Handle.Close()
        End If

        SyncLock _Clients
            While _Clients.Count > 0
                _Clients(0).Disconnect()
                _Clients.RemoveAt(0)
            End While
        End SyncLock

        If Item IsNot Nothing Then
            Item.Dispose()
        End If

        _Listening = False
        OnStateChanged(False)
    End Sub

    Private Sub HandleStateChanged(client As ServerClient, connected As Boolean)
        SyncLock _Clients
            _Clients.Remove(client)
            OnClientStateChanged(client, False)
        End SyncLock
    End Sub

#Region " IDisposable Support "

    Private DisposedValue As Boolean

    Private Sub Dispose(disposing As Boolean)
        If Not DisposedValue AndAlso disposing Then Disconnect()
        DisposedValue = True
    End Sub

    Public Sub Dispose() Implements IDisposable.Dispose
        Dispose(True)
        GC.SuppressFinalize(Me)
    End Sub

#End Region

End Class