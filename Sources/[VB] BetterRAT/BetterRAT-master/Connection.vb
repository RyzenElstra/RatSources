Imports System.Net
Imports System.Net.Sockets
Imports System.IO
Public Class Connection
    Private client As TcpClient
    Private IP As String
    Private _Socket As String
    Public Event GotInfo(ByVal client As Connection, ByVal Message As String)
    Public Event Disconnected(ByVal client As Connection)
    Sub New(ByVal client As TcpClient)
        Me.client = client
        client.GetStream().BeginRead(New Byte() {0}, 0, 0, AddressOf Read, Nothing)
        IP = client.Client.RemoteEndPoint.ToString().Remove(client.Client.RemoteEndPoint.ToString().LastIndexOf(":"))
        _Socket = client.Client.RemoteEndPoint.ToString().Split(":")(1)
    End Sub
    Sub Read(ByVal ar As IAsyncResult)
        Dim Message As String
        Try
            Dim reader As New StreamReader(client.GetStream())
            Message = reader.ReadLine()
            RaiseEvent GotInfo(Me, Message) 'RemoteDesktop
            client.GetStream().BeginRead(New Byte() {0}, 0, 0, AddressOf Read, Nothing)
        Catch ex As Exception
            RaiseEvent Disconnected(Me)
        End Try
    End Sub
    Public Sub Send(ByVal Message As String)
        Try
            Dim writer As New StreamWriter(client.GetStream())
            writer.WriteLine(Message)
            writer.Flush()
        Catch ex As Exception
            Console.WriteLine(ex.Message)
        End Try
    End Sub
    Public ReadOnly Property IPAddress
        Get
            Return IP
        End Get
    End Property
    Public ReadOnly Property RemoteSocket
        Get
            Return _Socket
        End Get
    End Property
End Class
