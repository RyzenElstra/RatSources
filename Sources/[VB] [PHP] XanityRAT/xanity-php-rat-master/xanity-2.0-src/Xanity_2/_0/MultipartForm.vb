Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections
Imports System.IO
Imports System.Net
Imports System.Runtime.CompilerServices
Imports System.Text

Namespace Xanity_2._0
    Public Class MultipartForm
        ' Methods
        Public Sub New(ByVal url__1 As String)
            Me.URL = url__1
            Me.coFormFields = New Hashtable
            Me.ResponseText = New StringBuilder
            Me.BufferSize = &H2800
            Me.BeginBoundary = "ou812--------------8c405ee4e38917c"
            Me.TransferHttpVersion = HttpVersion.Version11
            Me.FileContentType = "text/xml"
        End Sub

        Public Function getFileheader(ByVal aFilename As String) As String
            Return String.Concat(New String() { Me.ContentBoundary, ChrW(13) & ChrW(10), MultipartForm.CONTENT_DISP, """file""; filename=""", Path.GetFileName(aFilename), """" & ChrW(13) & ChrW(10) & "Content-type: ", Me.FileContentType, ChrW(13) & ChrW(10) & ChrW(13) & ChrW(10) })
        End Function

        Public Function getFiletrailer() As String
            Return (ChrW(13) & ChrW(10) & Me.EndingBoundary)
        End Function

        Public Function getFormfields() As String
            Dim str2 As String = ""
            Dim enumerator As IDictionaryEnumerator = Me.coFormFields.GetEnumerator
            Do While enumerator.MoveNext
                str2 = String.Concat(New String() { str2, Me.ContentBoundary, ChrW(13) & ChrW(10), MultipartForm.CONTENT_DISP, """", Convert.ToString(RuntimeHelpers.GetObjectValue(enumerator.Key)), """" & ChrW(13) & ChrW(10) & ChrW(13) & ChrW(10), Convert.ToString(RuntimeHelpers.GetObjectValue(enumerator.Value)), ChrW(13) & ChrW(10) })
            Loop
            Return str2
        End Function

        Public Overridable Sub getResponse()
            If (Me.coFileStream Is Nothing) Then
                Dim response As WebResponse
                Dim str As String
                Try 
                    response = Me.coRequest.GetResponse
                Catch exception1 As WebException
                    ProjectData.SetProjectError(exception1)
                    Dim exception As WebException = exception1
                    response = exception.Response
                    ProjectData.ClearProjectError
                End Try
                If (response Is Nothing) Then
                    Throw New Exception("MultipartForm: Error retrieving server response")
                End If
                Dim reader As New StreamReader(response.GetResponseStream)
                Me.ResponseText.Length = 0
                Do While (Not MultipartForm.InlineAssignHelper(Of String)(str, reader.ReadLine) Is Nothing)
                    Me.ResponseText.Append(str)
                Loop
                response.Close
            End If
        End Sub

        Public Overridable Function getStream() As Stream
            If (Me.coFileStream Is Nothing) Then
                Return Me.coRequest.GetRequestStream
            End If
            Return Me.coFileStream
        End Function

        Private Shared Function InlineAssignHelper(Of T)(ByRef target As T, ByVal value As T) As T
            target = value
            Return value
        End Function

        Public Sub sendFile(ByVal aFilename As String)
            Me.coRequest = DirectCast(WebRequest.Create(Me.URL), HttpWebRequest)
            Me.coRequest.ProtocolVersion = Me.TransferHttpVersion
            Me.coRequest.Method = "POST"
            Me.coRequest.ContentType = ("multipart/form-data; boundary=" & Me.BeginBoundary)
            Me.coRequest.Headers.Add("Cache-Control", "no-cache")
            Me.coRequest.KeepAlive = True
            Dim str As String = Me.getFormfields
            Dim str2 As String = Me.getFileheader(aFilename)
            Dim str3 As String = Me.getFiletrailer
            Dim info As New FileInfo(aFilename)
            Me.coRequest.ContentLength = (((str.Length + str2.Length) + str3.Length) + info.Length)
            Dim io As Stream = Me.getStream
            Me.writeString(io, str)
            Me.writeString(io, str2)
            Me.writeFile(io, aFilename)
            Me.writeString(io, str3)
            Me.getResponse
            io.Close
            Me.coRequest = Nothing
        End Sub

        Public Sub setField(ByVal key As String, ByVal str As String)
            Me.coFormFields.Item(key) = str
        End Sub

        Public Sub setFilename(ByVal path As String)
            Me.coFileStream = New FileStream(path, FileMode.Create, FileAccess.Write)
        End Sub

        Public Sub writeFile(ByVal io As Stream, ByVal aFilename As String)
            Dim num As Integer
            Dim stream As New FileStream(aFilename, FileMode.Open, FileAccess.Read)
            stream.Seek(0, SeekOrigin.Begin)
            Dim array As Byte() = New Byte(((Me.BufferSize - 1) + 1)  - 1) {}
            Do While (MultipartForm.InlineAssignHelper(Of Integer)(num, stream.Read(array, 0, Me.BufferSize)) > 0)
                io.Write(array, 0, num)
            Loop
            stream.Close
        End Sub

        Public Sub writeString(ByVal io As Stream, ByVal str As String)
            Dim bytes As Byte() = Encoding.ASCII.GetBytes(str)
            io.Write(bytes, 0, bytes.Length)
        End Sub


        ' Properties
        Public Property BeginBoundary As String
            Get
                Return Me._BeginBoundary
            End Get
            Set(ByVal value As String)
                Me._BeginBoundary = value
                Me.ContentBoundary = ("--" & Me.BeginBoundary)
                Me.EndingBoundary = (Me.ContentBoundary & "--")
            End Set
        End Property

        Public Property BufferSize As Integer
            Get
                Return Me._BufferSize
            End Get
            Set(ByVal value As Integer)
                Me._BufferSize = value
            End Set
        End Property

        Protected Property ContentBoundary As String
            Get
                Return Me._ContentBoundary
            End Get
            Set(ByVal value As String)
                Me._ContentBoundary = value
            End Set
        End Property

        Protected Property EndingBoundary As String
            Get
                Return Me._EndingBoundary
            End Get
            Set(ByVal value As String)
                Me._EndingBoundary = value
            End Set
        End Property

        Public Property FileContentType As String
            Get
                Return Me.coFileContentType
            End Get
            Set(ByVal value As String)
                Me.coFileContentType = value
            End Set
        End Property

        Public Property ResponseText As StringBuilder
            Get
                Return Me._ResponseText
            End Get
            Set(ByVal value As StringBuilder)
                Me._ResponseText = value
            End Set
        End Property

        Public Property TransferHttpVersion As Version
            Get
                Return Me.coHttpVersion
            End Get
            Set(ByVal value As Version)
                Me.coHttpVersion = value
            End Set
        End Property

        Public Property URL As String
            Get
                Return Me._URL
            End Get
            Set(ByVal value As String)
                Me._URL = value
            End Set
        End Property


        ' Fields
        Private _BeginBoundary As String
        Private _BufferSize As Integer
        Private _ContentBoundary As String
        Private _EndingBoundary As String
        Private _ResponseText As StringBuilder
        Private _URL As String
        Private coFileContentType As String
        Private coFileStream As Stream
        Private coFormFields As Hashtable
        Private coHttpVersion As Version
        Private Shared CONTENT_DISP As String = "Content-Disposition: form-data; name="
        Protected coRequest As HttpWebRequest
    End Class
End Namespace

