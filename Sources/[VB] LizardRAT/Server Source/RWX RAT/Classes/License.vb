Imports System
Imports System.Net
Imports System.Text
Imports System.IO
Imports System.IO.Compression
Imports System.Diagnostics
Imports System.Reflection
Imports System.Windows.Forms
Imports System.ComponentModel
Imports System.Security.Cryptography
Imports System.Collections.Generic
Imports System.Runtime.InteropServices
Imports System.Net.Security
Imports System.Security
Imports System.Security.Cryptography.X509Certificates
Imports System.Security.Principal
Imports System.Net.Cache
Imports System.Threading
Imports System.Net.Sockets
Imports System.Drawing
Imports System.Globalization

' Version: 2.1.1.1, Changed: 11/1/2016

Namespace NetSeal

    Friend NotInheritable Class Broker

#Region " Events "

        ''' <summary>
        ''' Occurs when the user's license is suspended.
        ''' </summary>
        Public Event LicenseSuspended(sender As Object, e As EventArgs)

        ''' <summary>
        ''' Occurs when the user's license is authorized by the server.
        ''' </summary>
        Public Event LicenseAuthorized(sender As Object, e As EventArgs)

        ''' <summary>
        ''' Occurs when the user's license is reauthorized by the server.
        ''' </summary>
        Public Event LicenseRefreshed(sender As Object, e As EventArgs)

#End Region

#Region " Properties "

        ''' <summary>
        ''' Gets the user's wide area network IPv4 address.
        ''' </summary>
        Public ReadOnly Property IPAddress() As IPAddress
            Get
                EnsureInitialization()

                Return DirectCast(_AuthenticatorType.GetMethod("GetIPAddress").Invoke(_Authenticator, Nothing), IPAddress)
            End Get
        End Property

        ''' <summary>
        ''' Gets the user's sign-in name.
        ''' </summary>
        Public ReadOnly Property UserName() As String
            Get
                EnsureInitialization()

                Return DirectCast(_AuthenticatorType.GetMethod("GetUserName").Invoke(_Authenticator, Nothing), String)
            End Get
        End Property

        ''' <summary>
        ''' Gets the date the user's license was first created. 
        ''' </summary>
        Public ReadOnly Property CreationDate() As Date
            Get
                EnsureInitialization()

                Return DirectCast(_AuthenticatorType.GetMethod("GetCreationDate").Invoke(_Authenticator, Nothing), Date)
            End Get
        End Property

        ''' <summary>
        ''' Gets the expiration date of the user's license, when <see cref="LicenseExpires"/> is True. 
        ''' </summary>
        Public ReadOnly Property ExpirationDate() As Date
            Get
                EnsureInitialization()

                Return DirectCast(_AuthenticatorType.GetMethod("GetExpirationDate").Invoke(_Authenticator, Nothing), Date)
            End Get
        End Property

        ''' <summary>
        ''' Gets the time remaining on the user's license, when <see cref="LicenseExpires"/> is True. 
        ''' </summary>
        Public ReadOnly Property TimeRemaining() As TimeSpan
            Get
                EnsureInitialization()

                Return DirectCast(_AuthenticatorType.GetMethod("GetTimeRemaining").Invoke(_Authenticator, Nothing), TimeSpan)
            End Get
        End Property

        ''' <summary>
        ''' Gets the license type associated with the user's license.
        ''' </summary>
        Public ReadOnly Property LicenseType() As LicenseType
            Get
                EnsureInitialization()

                Return DirectCast(_AuthenticatorType.GetMethod("GetLicenseType").Invoke(_Authenticator, Nothing), LicenseType)
            End Get
        End Property

        ''' <summary>
        ''' Gets a value indicating whether the user's license will expire.
        ''' </summary>
        Public ReadOnly Property LicenseExpires() As Boolean
            Get
                EnsureInitialization()

                Return DirectCast(_AuthenticatorType.GetMethod("GetLicenseExpires").Invoke(_Authenticator, Nothing), Boolean)
            End Get
        End Property

        ''' <summary>
        ''' Gets a unique identifier for the machine. This value is not static.
        ''' </summary>
        Public ReadOnly Property MachineId() As String
            Get
                EnsureInitialization()

                Return DirectCast(_AuthenticatorType.GetMethod("GetMachineId").Invoke(_Authenticator, Nothing), String)
            End Get
        End Property

#End Region

#Region " Commands "

        ''' <summary>
        ''' Gets a token representing the key returned by <see cref="GetPrivateKey"/> which can be decoded with the PrivateKey web API.
        ''' </summary>
        Public Function GetPublicToken() As String
            EnsureInitialization()

            Return DirectCast(_AuthenticatorType.GetMethod("GetPublicToken").Invoke(_Authenticator, Nothing), String)
        End Function

        ''' <summary>
        ''' Gets a secret key that can be used for encryption.
        ''' </summary>
        Public Function GetPrivateKey() As Byte()
            EnsureInitialization()

            Return DirectCast(_AuthenticatorType.GetMethod("GetPrivateKey").Invoke(_Authenticator, Nothing), Byte())
        End Function

        ''' <summary>
        ''' Gets the number of users currently signed in and using the program.
        ''' </summary>
        Public Function GetUsersOnline() As Integer
            EnsureInitialization()

            Return DirectCast(_AuthenticatorType.GetMethod("GetUsersOnline").Invoke(_Authenticator, Nothing), Integer)
        End Function

        ''' <summary>
        ''' Gets a value indicating whether updates are available.
        ''' </summary>
        Public Function GetUpdatesAvailable() As Boolean
            EnsureInitialization()

            Return DirectCast(_AuthenticatorType.GetMethod("GetUpdatesAvailable").Invoke(_Authenticator, Nothing), Boolean)
        End Function

        ''' <summary>
        ''' Gets blog posts submitted by the application developer.
        ''' </summary>
        Public Function GetBlogPosts() As BlogPost()
            EnsureInitialization()

            Dim Posts As New List(Of BlogPost)
            Dim Values As Object() = DirectCast(_AuthenticatorType.GetMethod("GetBlogPosts").Invoke(_Authenticator, Nothing), Object())

            For I As Integer = 0 To Values.Length - 1 Step 4
                Dim Id As Integer = DirectCast(Values(I), Integer)
                Dim Title As String = DirectCast(Values(I + 1), String)
                Dim TimesRead As Integer = DirectCast(Values(I + 2), Integer)
                Dim DatePosted As Date = DirectCast(Values(I + 3), Date)

                Dim Post As New BlogPost(Id, Title, TimesRead, DatePosted, New GetPostBodyDelegate(AddressOf GetPostBody))
                Posts.Add(Post)
            Next

            Return Posts.ToArray()
        End Function

        ''' <summary>
        ''' Gets settings defined by the application developer.
        ''' </summary>
        Public Function GetSetting(name As String) As String
            EnsureInitialization()

            Return DirectCast(_AuthenticatorType.GetMethod("GetSetting").Invoke(_Authenticator, New Object() {name}), String)
        End Function

        ''' <summary>
        ''' Downloads and installs updates if they are available.
        ''' </summary>
        Public Sub InstallUpdates()
            EnsureInitialization()

            _AuthenticatorType.GetMethod("InstallUpdates").Invoke(_Authenticator, Nothing)
        End Sub

        ''' <summary>
        ''' Suspends the currently signed in user's license.
        ''' </summary>
        Public Sub SuspendUser(reason As String)
            EnsureInitialization()

            _AuthenticatorType.GetMethod("SuspendUser").Invoke(_Authenticator, New Object() {reason})
        End Sub

#End Region

#Region " Members "

        Private _Version As Version

        Private _LzmaLibType As Type

        Private _Authenticator As Object
        Private _AuthenticatorType As Type

        Private _HttpClient As HttpClient
        Private _DnsClient As DnsClient
        Private _StrongNameVerifier As StrongNameVerifierLite

        Private _PreferredMetadataEndPoint As String
        Private _AlternateMetadataEndPoint As String

        Private _ComponentAesEncryptor As ICryptoTransform
        Private _ComponentAesDecryptor As ICryptoTransform

        Private _ComponentKey As Byte()
        Private _AuthenticatorKey As Byte()

        Private _ServerEndPoint As String
        Private _ComponentEndPoint As String

        Private _LzmaLibHash As String
        Private _AuthenticatorHash As String

        Private _LzmaLibData As Byte()
        Private _AuthenticatorData As Byte()

        Private _ProductDirectory As String

#End Region

#Region " Delegates "

        Private Delegate Sub CallbackDelegate()
        Private Delegate Function GetPostBodyDelegate(postId As Integer) As String

#End Region

#Region " Event Handling "

        Private Sub HttpClient_WebRequestResolveHost(sender As Object, e As HttpClient.WebRequestResolveHostEventArgs)
            Try
                Dim AddressList As IPAddress()

                SyncLock _DnsClient
                    AddressList = _DnsClient.Resolve(e.HostName)
                End SyncLock

                If AddressList.Length = 0 Then
                    Return
                End If

                e.Address = AddressList(0)
            Catch ex As Exception
                HandleException(ex)
            End Try
        End Sub

#End Region

#Region " Constructor "

        Public Sub New()
            _Version = New Version(2, 1, 1, 1)

            _PreferredMetadataEndPoint = "http://seal.nimoru.com/Base/checksumSE.php"
            _AlternateMetadataEndPoint = "https://s3-us-west-2.amazonaws.com/netseal/checksumSE.txt"

            _ComponentKey = New Byte() {65, 118, 65, 114, 101, 79, 118, 101, 114, 122, 101, 97, 108, 111, 117, 115}
            _AuthenticatorKey = New Byte() {6, 2, 0, 0, 0, 34, 0, 0, 68, 83, 83, 49, 0, 4, 0, 0, 165, 101, 186, 183, 89, 49, 161, 242, 152, 217, 52, 227, 36, 114, 221, 81, 163, 208, 24, 95, 234, 1, 136, 6, 193, 171, 215, 57, 56, 216, 186, 221, 159, 6, 11, 126, 249, 251, 48, 16, 34, 98, 128, 135, 217, 192, 244, 236, 207, 199, 184, 206, 141, 91, 85, 170, 37, 5, 69, 218, 137, 176, 31, 148, 182, 215, 92, 31, 188, 16, 174, 181, 79, 118, 71, 21, 229, 118, 103, 239, 119, 78, 165, 241, 228, 42, 154, 154, 115, 181, 130, 43, 93, 220, 102, 91, 64, 81, 150, 139, 1, 40, 243, 57, 154, 206, 152, 93, 153, 232, 48, 171, 30, 2, 138, 153, 232, 8, 243, 107, 197, 61, 64, 34, 76, 145, 33, 210, 71, 227, 182, 220, 74, 6, 143, 213, 126, 239, 28, 36, 10, 134, 7, 146, 81, 109, 44, 156, 196, 68, 30, 178, 252, 53, 181, 4, 32, 135, 132, 182, 229, 206, 145, 115, 250, 104, 109, 212, 32, 250, 196, 8, 182, 64, 19, 88, 238, 246, 92, 89, 214, 234, 163, 230, 75, 79, 140, 187, 179, 15, 35, 83, 173, 101, 137, 128, 110, 100, 176, 63, 183, 238, 138, 30, 26, 8, 193, 159, 141, 32, 74, 236, 8, 117, 185, 68, 63, 101, 159, 149, 105, 48, 46, 186, 192, 16, 156, 99, 159, 120, 101, 50, 12, 106, 114, 46, 190, 106, 112, 225, 228, 26, 81, 118, 79, 160, 202, 32, 127, 111, 96, 38, 2, 82, 162, 86, 131, 131, 152, 143, 213, 112, 234, 204, 228, 207, 187, 212, 93, 176, 119, 183, 71, 86, 90, 54, 9, 107, 47, 78, 115, 161, 51, 61, 225, 153, 37, 228, 164, 254, 108, 240, 20, 11, 223, 100, 26, 177, 3, 152, 216, 169, 123, 171, 99, 240, 92, 40, 57, 51, 77, 105, 54, 142, 189, 102, 101, 93, 59, 64, 125, 172, 106, 25, 94, 59, 159, 18, 159, 105, 184, 49, 18, 93, 60, 159, 71, 55, 60, 18, 68, 141, 70, 115, 39, 135, 33, 193, 13, 132, 199, 96, 57, 185, 128, 96, 70, 233, 28, 152, 169, 145, 153, 220, 8, 166, 17, 234, 208, 140, 29, 163, 20, 181, 251, 161, 210, 193, 124, 96, 213, 221, 196, 16, 10, 49, 39, 190, 81, 213, 228, 151, 23, 231, 23, 57, 224, 187, 119, 245, 54, 81, 141, 45, 171, 0, 0, 0, 203, 211, 139, 62, 110, 51, 58, 65, 64, 134, 29, 53, 198, 216, 158, 178, 112, 28, 230, 228}
        End Sub

#End Region

#Region " Initialization "

        ''' <summary>
        ''' Initializes the authenticator and shows the authentication dialog.
        ''' </summary>
        Public Sub Initialize(productId As String)
            Initialize(productId, New BrokerSettings())
        End Sub

        ''' <summary>
        ''' Initializes the authenticator and shows the authentication dialog.
        ''' </summary>
        Public Sub Initialize(productId As String, settings As BrokerSettings)
            Try
                If _Authenticator IsNot Nothing Then
                    Throw New InvalidOperationException("Loader has already been initialized.")
                End If

                If settings Is Nothing Then
                    Throw New ArgumentNullException("settings")
                End If

                Dim Culture As ThreadCulture = NormalizeCulture()

                If settings.VerifyRuntimeIntegrity Then
                    _StrongNameVerifier = New StrongNameVerifierLite()
                    CheckFrameworkStrongNames()
                End If

                InitializeWebHandling()
                InitializeComponentTransform()

                _ProductDirectory = GetProductDirectory()

                Dim Metadata As String() = GetMetadata()
                ParseMetadata(Metadata)

                If Not Directory.Exists(_ProductDirectory) Then
                    Directory.CreateDirectory(_ProductDirectory)
                End If

                InitializeLzmaLib()
                InitializeAuthenticator()

                VerifyAuthenticator()

                _AuthenticatorType = Assembly.Load(_AuthenticatorData).GetType("Controller")
                _Authenticator = Activator.CreateInstance(_AuthenticatorType)

                Dim UpdateMethod As MethodInfo = _AuthenticatorType.GetMethod("UpdateValue")
                UpdateMethod.Invoke(_Authenticator, New Object() {"ProductId", productId})
                UpdateMethod.Invoke(_Authenticator, New Object() {"CatchUnhandledExceptions", settings.CatchUnhandledExceptions})
                UpdateMethod.Invoke(_Authenticator, New Object() {"DeferAutomaticUpdates", settings.DeferAutomaticUpdates})
                UpdateMethod.Invoke(_Authenticator, New Object() {"SilentAuthentication", settings.SilentAuthentication})
                UpdateMethod.Invoke(_Authenticator, New Object() {"DialogTheme", CInt(settings.DialogTheme)})
                UpdateMethod.Invoke(_Authenticator, New Object() {"LoaderVersion", _Version})
                UpdateMethod.Invoke(_Authenticator, New Object() {"ProductVersion", New Version(Application.ProductVersion)})
                UpdateMethod.Invoke(_Authenticator, New Object() {"Metadata", Metadata})
                UpdateMethod.Invoke(_Authenticator, New Object() {"AuthorizedCallback", New CallbackDelegate(AddressOf AuthorizedCallback)})
                UpdateMethod.Invoke(_Authenticator, New Object() {"RefreshedCallback", New CallbackDelegate(AddressOf RefreshedCallback)})
                UpdateMethod.Invoke(_Authenticator, New Object() {"SuspendedCallback", New CallbackDelegate(AddressOf SuspendedCallback)})

                Dim InitializeMethod As MethodInfo = _AuthenticatorType.GetMethod("Initialize")
                InitializeMethod.Invoke(_Authenticator, Nothing)

                DisposeMembers()

                RestoreCulture(Culture)
            Catch ex As Exception
                HandleException(ex)
            End Try
        End Sub

        Private Sub InitializeWebHandling()
            _DnsClient = New DnsClient()
            _HttpClient = New HttpClient()

            _HttpClient.RequestThrottleTime = 100
            _HttpClient.MaxConcurrentRequests = 1

            AddHandler _HttpClient.WebRequestResolveHost, AddressOf HttpClient_WebRequestResolveHost
        End Sub

        Private Sub InitializeComponentTransform()
            Dim Aes As New RijndaelManaged()
            Aes.BlockSize = 128
            Aes.KeySize = 128
            Aes.Padding = PaddingMode.PKCS7
            Aes.Mode = CipherMode.CBC

            Aes.Key = _ComponentKey
            Aes.IV = Aes.Key

            _ComponentAesEncryptor = Aes.CreateEncryptor()
            _ComponentAesDecryptor = Aes.CreateDecryptor()
        End Sub

#End Region

#Region " Delegate Handling "

        Private Sub AuthorizedCallback()
            RaiseEvent LicenseAuthorized(Me, EventArgs.Empty)
        End Sub

        Private Sub RefreshedCallback()
            RaiseEvent LicenseRefreshed(Me, EventArgs.Empty)
        End Sub

        Private Sub SuspendedCallback()
            RaiseEvent LicenseSuspended(Me, EventArgs.Empty)
        End Sub

        Private Function GetPostBody(postId As Integer) As String
            Return DirectCast(_AuthenticatorType.GetMethod("GetPostBody").Invoke(_Authenticator, New Object() {postId}), String)
        End Function

#End Region

#Region " Exception Handling "

        Private Sub HandleException(ex As Exception)
            Dim StackTrace As String = ExceptionToString(ex)

            Dim Builder As New StringBuilder()
            Builder.AppendFormat("[Loader: {0}]", _Version)
            Builder.AppendLine()
            Builder.AppendLine()
            Builder.Append(StackTrace)

            Dim ExceptionForm As New ExceptionForm(Builder.ToString())
            ExceptionForm.ShowDialog()

            Environment.Exit(0)
        End Sub

        Private Function ExceptionToString(ex As Exception) As String
            Dim Builder As New StringBuilder()

            Builder.AppendLine(ex.Message)
            Builder.AppendLine()
            Builder.AppendLine(ex.GetType().FullName)
            Builder.AppendLine(ex.StackTrace)

            If ex.InnerException IsNot Nothing Then
                Builder.AppendLine()
                Builder.AppendLine(ExceptionToString(ex.InnerException))
            End If

            Return Builder.ToString()
        End Function

        Private Sub EnsureInitialization()
            If _Authenticator Is Nothing Then
                Throw New Exception("Loader has not been initialized.")
            End If
        End Sub

#End Region

#Region " Verification "

        Private Sub CheckFrameworkStrongNames()
            Dim Base As String = RuntimeEnvironment.GetRuntimeDirectory()
            Dim EcmaToken As Byte() = New Byte() {183, 122, 92, 86, 25, 52, 224, 137} 'b77a5c561934e089
            Dim FinalToken As Byte() = New Byte() {176, 63, 95, 127, 17, 213, 10, 58} 'b03f5f7f11d50a3a

            CheckStrongName(Path.Combine(Base, "mscorlib.dll"), EcmaToken)
            CheckStrongName(Path.Combine(Base, "System.dll"), EcmaToken)
            CheckStrongName(Path.Combine(Base, "System.Security.dll"), FinalToken)
        End Sub

        Private Sub CheckStrongName(fileName As String, token As Byte())
            Dim AssemblyName As String = Path.GetFileName(fileName)

            If Not _StrongNameVerifier.VerifyStrongName(fileName, token) Then
                Throw New Exception(String.Format("Could not verify strong name of file or assembly '{0}'.", AssemblyName))
            End If
        End Sub

        Private Sub VerifyAuthenticator()
            Dim Signature(40 - 1) As Byte
            Dim ImageData(_AuthenticatorData.Length - 42 - 1) As Byte

            Buffer.BlockCopy(_AuthenticatorData, 2, Signature, 0, Signature.Length)
            Buffer.BlockCopy(_AuthenticatorData, 42, ImageData, 0, ImageData.Length)

            Dim DsaProvider As New DSACryptoServiceProvider()
            DsaProvider.ImportCspBlob(_AuthenticatorKey)

            If Not DsaProvider.VerifyData(ImageData, Signature) Then
                Throw New Exception("Could not verify signature of authenticator.")
            End If
        End Sub

#End Region

#Region " Metadata "

        Private Function GetMetadata() As String()
            Try
                Dim Data As Byte() = DownloadData(_PreferredMetadataEndPoint)
                Return Encoding.UTF8.GetString(Data).Split(Char.MinValue)
            Catch
                Return GetMetadataFallback()
            End Try
        End Function

        Private Function GetMetadataFallback() As String()
            Try
                Dim Data As Byte() = DownloadData(_AlternateMetadataEndPoint)
                Return Encoding.UTF8.GetString(Data).Split("|"c)
            Catch ex As Exception
                HandleException(ex)
            End Try

            Return Nothing
        End Function

        Private Sub ParseMetadata(metadata As String())
            _ComponentEndPoint = metadata(0)
            _LzmaLibHash = metadata(1)
            _AuthenticatorHash = metadata(3)
            _ServerEndPoint = metadata(5)
        End Sub

#End Region

#Region " Hashing "

        Private Function Md5HashData(data As Byte()) As String
            Dim MD5 As New MD5CryptoServiceProvider()
            Return ByteArrayToString(MD5.ComputeHash(data))
        End Function

        Private Function ByteArrayToString(data As Byte()) As String
            Return BitConverter.ToString(data).ToLower().Replace("-", String.Empty)
        End Function

#End Region

#Region " LzmaLib "

        Private Sub InitializeLzmaLib()
            Dim LzmaLibFileName As String = GetLzmaLibFileName()

            If File.Exists(LzmaLibFileName) Then
                _LzmaLibData = LoadComponentData(LzmaLibFileName)

                If Not _LzmaLibHash.Equals(Md5HashData(_LzmaLibData)) Then
                    _LzmaLibData = InstallLzmaLib(LzmaLibFileName)
                End If
            Else
                _LzmaLibData = InstallLzmaLib(LzmaLibFileName)
            End If
        End Sub

        Private Function InstallLzmaLib(fileName As String) As Byte()
            Dim Url As String = GetComponentEndPoint(_LzmaLibHash)
            Dim Data As Byte() = DeflateDecompress(DownloadData(Url))

            SaveComponentData(fileName, Data)

            Return Data
        End Function

        Private Function GetLzmaLibFileName() As String
            Return Path.Combine(_ProductDirectory, "LzmaLib.bin")
        End Function

#End Region

#Region " Authenticator "

        Private Sub InitializeAuthenticator()
            Dim AuthenticatorFileName As String = GetAuthenticatorFileName()

            If File.Exists(AuthenticatorFileName) Then
                _AuthenticatorData = LoadComponentData(AuthenticatorFileName)

                If Not _AuthenticatorHash.Equals(Md5HashData(_AuthenticatorData)) Then
                    _AuthenticatorData = InstallAuthenticator(AuthenticatorFileName)
                End If
            Else
                _AuthenticatorData = InstallAuthenticator(AuthenticatorFileName)
            End If
        End Sub

        Private Function InstallAuthenticator(fileName As String) As Byte()
            Dim Url As String = GetComponentEndPoint(_AuthenticatorHash)
            Dim Data As Byte() = LzmaDecompress(DownloadData(Url))

            SaveComponentData(fileName, Data)

            Return Data
        End Function

        Private Function GetAuthenticatorFileName() As String
            Return Path.Combine(_ProductDirectory, "License.bin")
        End Function

#End Region

#Region " Component Helpers "

        Private Function GetComponentEndPoint(hash As String) As String
            Return Path.Combine(_ComponentEndPoint, hash) & ".co"
        End Function

        Private Function LoadComponentData(fileName As String) As Byte()
            Dim Data As Byte() = File.ReadAllBytes(fileName)

            Return _ComponentAesDecryptor.TransformFinalBlock(Data, 0, Data.Length)
        End Function

        Private Sub SaveComponentData(fileName As String, data As Byte())
            Dim ComponentData As Byte() = _ComponentAesEncryptor.TransformFinalBlock(data, 0, data.Length)

            File.WriteAllBytes(fileName, ComponentData)
        End Sub

#End Region

#Region " Decompression "

        Private Function DeflateDecompress(data As Byte()) As Byte()
            Dim Length As Integer = BitConverter.ToInt32(data, 0)

            Dim Buffer(Length - 1) As Byte
            Dim Stream As New MemoryStream(data, 4, data.Length - 4)

            Dim Deflate As New DeflateStream(Stream, CompressionMode.Decompress, False)
            Deflate.Read(Buffer, 0, Buffer.Length)

            Deflate.Close()
            Stream.Close()

            Return Buffer
        End Function

        Private Function LzmaDecompress(data As Byte()) As Byte()
            If _LzmaLibType Is Nothing Then
                _LzmaLibType = Assembly.Load(_LzmaLibData).GetType("H")
            End If

            Return DirectCast(_LzmaLibType.GetMethod("Decompress").Invoke(Nothing, New Object() {data}), Byte())
        End Function

#End Region

#Region " Helpers "

        Private Function DownloadData(url As String) As Byte()
            Dim Options As New HttpClient.RequestOptions()
            Options.Timeout = 60000
            Options.RetryCount = 3
            Options.Proxy = Nothing
            Options.Method = "GET"

            Return _HttpClient.UploadValues(url, Nothing, Options)
        End Function

        Private Function GetProductDirectory() As String
            Return Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Net Seal")
        End Function

        Private Function NormalizeCulture() As ThreadCulture
            Dim Thread As Thread = Threading.Thread.CurrentThread
            Dim Culture As New ThreadCulture(Thread.CurrentCulture, Thread.CurrentUICulture)

            Thread.CurrentCulture = CultureInfo.InvariantCulture
            Thread.CurrentUICulture = CultureInfo.InvariantCulture

            Return Culture
        End Function

        Private Sub RestoreCulture(threadCulture As ThreadCulture)
            Dim Thread As Thread = Threading.Thread.CurrentThread

            Thread.CurrentCulture = threadCulture.Culture
            Thread.CurrentUICulture = threadCulture.UICulture
        End Sub

#End Region

#Region " Disposal "

        Private Sub DisposeMembers()
            _LzmaLibData = Nothing
            _AuthenticatorData = Nothing
            _ComponentKey = Nothing
            _AuthenticatorKey = Nothing

            _ComponentEndPoint = Nothing
            _ServerEndPoint = Nothing
            _AuthenticatorHash = Nothing
            _LzmaLibHash = Nothing
            _PreferredMetadataEndPoint = Nothing
            _AlternateMetadataEndPoint = Nothing

            _LzmaLibType = Nothing

            _HttpClient = Nothing
            _DnsClient = Nothing
            _StrongNameVerifier = Nothing

            _ComponentAesDecryptor = Nothing
            _ComponentAesEncryptor = Nothing
        End Sub

#End Region

#Region " Private Types "

        Private NotInheritable Class ThreadCulture

            Public ReadOnly Property Culture As CultureInfo
                Get
                    Return _Culture
                End Get
            End Property

            Public ReadOnly Property UICulture As CultureInfo
                Get
                    Return _UICulture
                End Get
            End Property

            Private _Culture As CultureInfo
            Private _UICulture As CultureInfo

            Public Sub New(culture As CultureInfo, uiCulture As CultureInfo)
                _Culture = culture
                _UICulture = uiCulture
            End Sub

        End Class

        Private NotInheritable Class StrongNameVerifierLite

            Private _StrongName As IStrongName
            Private _UsingComInterfaces As Boolean
            Private _RuntimeVersion As String

            Public Sub New()
                _RuntimeVersion = RuntimeEnvironment.GetSystemVersion()

                If Int32.Parse(_RuntimeVersion(1).ToString()) >= 4 Then
                    _UsingComInterfaces = True
                    InitializeComInterfaces()
                End If
            End Sub

            Private Sub InitializeComInterfaces()
                Dim CID_META_HOST As New Guid("9280188D-0E8E-4867-B30C-7FA83884E8DE")
                Dim CID_STRONG_NAME As New Guid("B79B0ACD-F5CD-409B-B5A5-A16244610B92")

                Dim Meta As IMeta = DirectCast(CLRCreateInstance(CID_META_HOST, GetType(IMeta).GUID), IMeta)
                Dim Runtime As IRuntime = DirectCast(Meta.GetRuntime(_RuntimeVersion, GetType(IRuntime).GUID), IRuntime)

                _StrongName = DirectCast(Runtime.GetInterface(CID_STRONG_NAME, GetType(IStrongName).GUID), IStrongName)
            End Sub

            Public Function VerifyStrongName(assemblyPath As String, publicToken As Byte()) As Boolean
                Return VerifyStrongName(assemblyPath, publicToken, False)
            End Function

            Public Function VerifyStrongName(assemblyPath As String, publicToken As Byte(), ignoreToken As Boolean) As Boolean
                Dim Token As IntPtr
                Dim TokenLength As Integer
                Dim Genuine As Boolean

                If _UsingComInterfaces Then
                    If Not (_StrongName.StrongNameSignatureVerificationEx(assemblyPath, True, Genuine) = 0 AndAlso Genuine) Then
                        Return False
                    End If

                    If Not ignoreToken AndAlso Not (_StrongName.StrongNameTokenFromAssembly(assemblyPath, Token, TokenLength) = 0) Then
                        Return False
                    End If
                Else
                    If Not (StrongNameSignatureVerificationEx(assemblyPath, True, Genuine) AndAlso Genuine) Then
                        Return False
                    End If

                    If Not ignoreToken AndAlso Not StrongNameTokenFromAssembly(assemblyPath, Token, TokenLength) Then
                        Return False
                    End If
                End If

                If Not ignoreToken Then
                    Dim TokenData(TokenLength - 1) As Byte
                    Marshal.Copy(Token, TokenData, 0, TokenLength)

                    If _UsingComInterfaces Then
                        _StrongName.StrongNameFreeBuffer(Token)
                    Else
                        StrongNameFreeBuffer(Token)
                    End If

                    If Not TokenData.Length = publicToken.Length Then
                        Return False
                    End If

                    For I As Integer = 0 To TokenData.Length - 1
                        If Not TokenData(I) = publicToken(I) Then Return False
                    Next
                End If

                Return True
            End Function

            <DllImport("mscoree.dll", EntryPoint:="StrongNameFreeBuffer")>
            Private Shared Sub StrongNameFreeBuffer(ByVal token As IntPtr)
            End Sub

            <DllImport("mscoree.dll", EntryPoint:="StrongNameSignatureVerificationEx", CharSet:=CharSet.Unicode)>
            Private Shared Function StrongNameSignatureVerificationEx(
        ByVal fileName As String,
        ByVal force As Boolean,
        ByRef genuine As Boolean) As Boolean
            End Function

            <DllImport("mscoree.dll", EntryPoint:="StrongNameTokenFromAssembly", CharSet:=CharSet.Unicode)>
            Private Shared Function StrongNameTokenFromAssembly(
        ByVal fileName As String,
        ByRef token As IntPtr,
        ByRef tokenLength As Integer) As Boolean
            End Function

            <DllImport("mscoree.dll", PreserveSig:=False, EntryPoint:="CLRCreateInstance")>
            Private Shared Function CLRCreateInstance(
        <MarshalAs(UnmanagedType.LPStruct)> ByVal cid As Guid,
        <MarshalAs(UnmanagedType.LPStruct)> ByVal iid As Guid) As <MarshalAs(UnmanagedType.Interface)> Object
            End Function

            <InterfaceType(ComInterfaceType.InterfaceIsIUnknown), Guid("D332DB9E-B9B3-4125-8207-A14884F53216")>
            Private Interface IMeta
                Function GetRuntime(version As String, <MarshalAs(UnmanagedType.LPStruct)> iid As Guid) As <MarshalAs(UnmanagedType.Interface)> Object
            End Interface

            <InterfaceType(ComInterfaceType.InterfaceIsIUnknown), Guid("BD39D1D2-BA2F-486A-89B0-B4B0CB466891")>
            Private Interface IRuntime
                Sub Reserved1()
                Sub Reserved2()
                Sub Reserved3()
                Sub Reserved4()
                Sub Reserved5()
                Sub Reserved6()
                Function GetInterface(<MarshalAs(UnmanagedType.LPStruct)> cid As Guid, <MarshalAs(UnmanagedType.LPStruct)> iid As Guid) As <MarshalAs(UnmanagedType.Interface)> Object
            End Interface

            <InterfaceType(ComInterfaceType.InterfaceIsIUnknown), Guid("9FD93CCF-3280-4391-B3A9-96E1CDE77C8D")>
            Private Interface IStrongName
                Sub Reserved1()
                Sub Reserved2()
                Sub Reserved3()
                Sub Reserved4()
                Sub Reserved5()
                Sub Reserved6()
                Sub Reserved7()
                Function StrongNameFreeBuffer(token As IntPtr) As Integer
                Sub Reserved8()
                Sub Reserved9()
                Sub Reserved10()
                Sub Reserved11()
                Sub Reserved12()
                Sub Reserved13()
                Sub Reserved14()
                Sub Reserved15()
                Sub Reserved16()
                Sub Reserved17()
                Sub Reserved18()
                Sub Reserved19()
                Function StrongNameSignatureVerificationEx(filePath As String, force As Boolean, ByRef genuine As Boolean) As Integer
                Sub Reserved20()
                Function StrongNameTokenFromAssembly(filePath As String, ByRef token As IntPtr, ByRef tokenLength As Integer) As Integer
            End Interface

        End Class

        Private NotInheritable Class ExceptionForm
            Inherits Form

            Public Sub New(stackTrace As String)
                SuspendLayout()

                Dim PictureBox As New PictureBox()
                PictureBox.Location = New Point(12, 9)
                PictureBox.Size = New Size(32, 32)
                PictureBox.TabStop = False
                PictureBox.Image = SystemIcons.Error.ToBitmap()

                Dim Label As New Label()
                Label.Anchor = DirectCast(13, AnchorStyles)
                Label.AutoEllipsis = True
                Label.Font = New Font("Verdana", 8.25!)
                Label.Location = New Point(50, 9)
                Label.Size = New Size(367, 32)
                Label.Text = "The application has encountered an unexpected exception and must terminate."
                Label.TextAlign = ContentAlignment.MiddleLeft

                Dim TextBox As New TextBox()
                TextBox.Anchor = DirectCast(15, AnchorStyles)
                TextBox.BackColor = SystemColors.Window
                TextBox.Font = New Font("Verdana", 8.25!)
                TextBox.Location = New Point(12, 47)
                TextBox.Multiline = True
                TextBox.ReadOnly = True
                TextBox.ScrollBars = ScrollBars.Vertical
                TextBox.Size = New Size(405, 183)
                TextBox.Text = stackTrace

                Dim Button As New Button()
                Button.Anchor = DirectCast(10, AnchorStyles)
                Button.DialogResult = DirectCast(2, DialogResult)
                Button.Font = New Font("Verdana", 8.25!)
                Button.Location = New Point(312, 236)
                Button.Size = New Size(105, 26)
                Button.TabIndex = 0
                Button.Text = "Close"
                Button.UseVisualStyleBackColor = True

                Text = "Application Error"
                ClientSize = New Size(430, 270)
                MinimumSize = New Size(360, 245)
                MaximizeBox = False
                MinimizeBox = False
                ShowIcon = False

                Controls.Add(PictureBox)
                Controls.Add(Label)
                Controls.Add(TextBox)
                Controls.Add(Button)

                ResumeLayout(False)
                PerformLayout()
            End Sub

        End Class

#End Region

    End Class

#Region " Public Types "

    Friend NotInheritable Class DnsClient

#Region " Properties "

        Public Property PreferredDnsServer() As IPAddress
            Get
                Return _PreferredDnsServer
            End Get
            Set(value As IPAddress)
                _PreferredDnsServer = value
                ClearCache()
            End Set
        End Property

        Public Property AlternateDnsServer() As IPAddress
            Get
                Return _AlternateDnsServer
            End Get
            Set(value As IPAddress)
                _AlternateDnsServer = value
                ClearCache()
            End Set
        End Property

        Public Property IgnoreHostsFile() As Boolean
            Get
                Return _IgnoreHostsFile
            End Get
            Set(value As Boolean)
                _IgnoreHostsFile = value
                ClearCache()
            End Set
        End Property

        Public Property IgnoreResolverCache() As Boolean
            Get
                Return _IgnoreResolverCache
            End Get
            Set(value As Boolean)
                _IgnoreResolverCache = value
                ClearCache()
            End Set
        End Property

        Public Property SystemDnsFallback() As Boolean
            Get
                Return _SystemDnsFallback
            End Get
            Set(value As Boolean)
                _SystemDnsFallback = value
                ClearCache()
            End Set
        End Property

        Public Property CacheDnsResults() As Boolean
            Get
                Return _CacheDnsResults
            End Get
            Set(value As Boolean)
                _CacheDnsResults = value
                ClearCache()
            End Set
        End Property

        Public Property CacheTTL() As Integer
            Get
                Return _CacheTTL
            End Get
            Set(value As Integer)
                _CacheTTL = value
            End Set
        End Property

#End Region

#Region " Members "

        Private _PreferredDnsServer As IPAddress
        Private _AlternateDnsServer As IPAddress

        Private _IgnoreHostsFile As Boolean
        Private _IgnoreResolverCache As Boolean
        Private _SystemDnsFallback As Boolean

        Private _CacheDnsResults As Boolean
        Private _CacheTTL As Integer

        Private Cache As Dictionary(Of String, DnsResult)

#End Region

#Region " Constructor "

        Public Sub New()
            _PreferredDnsServer = New IPAddress(New Byte() {8, 8, 8, 8}) 'NOTE: Google preferred DNS server
            _AlternateDnsServer = New IPAddress(New Byte() {8, 8, 4, 4}) 'NOTE: Google alternate DNS server

            _CacheTTL = 900 'NOTE: 15 minutes.

            _IgnoreHostsFile = True
            _IgnoreResolverCache = True
            _SystemDnsFallback = True
            _CacheDnsResults = True

            Cache = New Dictionary(Of String, DnsResult)
        End Sub

#End Region

#Region " DNS Handling "

        Public Function Resolve(hostName As String) As IPAddress()
            Dim IP As IPAddress = IPAddress.None

            'NOTE: If we get an IP address just return it.
            If IPAddress.TryParse(hostName, IP) Then
                If IP.AddressFamily = AddressFamily.InterNetwork Then
                    Return New IPAddress() {IP}
                Else
                    'NOTE: For the sake of consistency we should reject IPv6 addresses.
                    Throw New NotImplementedException("IPv6 addresses are not supported.")
                End If
            End If

            If IsHostNameValid(hostName) Then
                Dim AddressList As IPAddress()

                'NOTE: Host names should be normalized for caching.
                Dim Host As String = hostName.Trim().ToLower()

                If CacheDnsResults Then
                    AddressList = QueryCache(Host)

                    If Not AddressList.Length = 0 Then
                        Return AddressList
                    End If
                End If

                If PreferredDnsServer IsNot Nothing Then
                    AddressList = GetDnsRecords(Host, PreferredDnsServer)

                    If Not AddressList.Length = 0 Then
                        Return CacheResults(Host, AddressList)
                    End If
                End If

                If AlternateDnsServer IsNot Nothing Then
                    AddressList = GetDnsRecords(Host, AlternateDnsServer)

                    If Not AddressList.Length = 0 Then
                        Return CacheResults(Host, AddressList)
                    End If
                End If

                'NOTE: This is required when resolving LAN host names.
                If SystemDnsFallback Then
                    AddressList = GetDnsRecords(Host, Nothing)

                    If Not AddressList.Length = 0 Then
                        Return CacheResults(Host, AddressList)
                    End If
                End If
            End If

            Return New IPAddress() {}
        End Function

        Private Function GetDnsRecords(hostName As String, dnsServer As IPAddress) As IPAddress()
            Dim QueryList As IntPtr
            Dim Addresses As New List(Of IPAddress)

            Dim Reserved As IntPtr = IntPtr.Zero
            Dim IPv4Array As IPv4Array = GetIPv4ArrayFromIPAddress(dnsServer)

            If DnsQueryA(hostName, 1, 8 Or 64, IPv4Array, QueryList, Reserved) = 0 Then
                Dim Record As DnsRecordA = DirectCast(Marshal.PtrToStructure(QueryList, GetType(DnsRecordA)), DnsRecordA)
                Dim Address As IPAddress = GetAddressFromRecord(Record)

                If Address IsNot IPAddress.None Then
                    Addresses.Add(Address)
                End If

                While Not (Record.NextRecord = IntPtr.Zero)
                    Record = DirectCast(Marshal.PtrToStructure(Record.NextRecord, GetType(DnsRecordA)), DnsRecordA)
                    Address = GetAddressFromRecord(Record)

                    If Address IsNot IPAddress.None Then
                        Addresses.Add(Address)
                    End If
                End While
            End If

            Return Addresses.ToArray()
        End Function

        Private Function GetIPv4ArrayFromIPAddress(address As IPAddress) As IPv4Array
            Dim IP4rray As New IPv4Array()

            If address IsNot Nothing Then
                IP4rray.Count = 1
                IP4rray.Addresses = New UInteger() {BitConverter.ToUInt32(address.GetAddressBytes(), 0)}
            End If

            Return IP4rray
        End Function

        Private Function GetAddressFromRecord(record As DnsRecordA) As IPAddress
            If Not record.Type = 1 Then
                Return IPAddress.None
            End If

            If Not (record.Flags And 3) < 2 Then
                Return IPAddress.None
            End If

            Return New IPAddress(record.Data)
        End Function

#End Region

#Region " Cache Handling "

        Private Sub ClearCache()
            Cache.Clear()
        End Sub

        Private Function QueryCache(hostName As String) As IPAddress()
            If Cache.ContainsKey(hostName) Then
                Dim Result As DnsResult = Cache(hostName)

                If (Date.Now - Result.ResolutionTime).TotalSeconds > CacheTTL Then
                    Cache.Remove(hostName)
                Else
                    Return Result.AddressList
                End If
            End If

            Return New IPAddress() {}
        End Function

        Private Function CacheResults(hostName As String, addressList As IPAddress()) As IPAddress()
            If CacheDnsResults Then
                Cache.Add(hostName, New DnsResult(addressList))
            End If

            Return addressList
        End Function

#End Region

#Region " Validation "

        Private Function IsHostNameValid(hostName As String) As Boolean
            'NOTE: RFC 2181 [Sec. 11] states a maximum length of 255 characters.
            If hostName.Length > Byte.MaxValue Then
                Throw New ArgumentOutOfRangeException("hostName", "Host name must not exceed 255 characters.")
            End If

            Dim Labels As String()

            If hostName.Contains(".") Then
                Labels = hostName.Split("."c)
            Else
                Labels = New String() {hostName}
            End If

            'NOTE: RFC 952 [Sec. 1] & RFC 1123 [Sec. 2.1] states host names should follow these naming conventions.
            '-Labels (delimited by periods) must be between 1 and 63 characters long.
            '-Labels must start and end with alphanumeric characters.
            '-Host names may only contains letters a-z, digits 0-9, hyphen (-), and periods (.).

            For Each Label As String In Labels
                If Label.Length = 0 OrElse Label.Length > 63 Then
                    Throw New FormatException("Labels in host names must be between 1 and 63 characters in length.")
                End If

                Dim FirstChar As Integer = Convert.ToInt32(Label(0))
                Dim LastChar As Integer = Convert.ToInt32(Label(Label.Length - 1))

                If Not (IsLetterOrDigit(FirstChar) OrElse IsLetterOrDigit(LastChar)) Then
                    Throw New FormatException("Labels in host names must begin and end with alphanumeric ASCII characters.")
                End If

                For I As Integer = 1 To Label.Length - 2
                    Dim Value As Integer = Convert.ToInt32(Label(I))

                    If Not (IsLetterOrDigit(Value) OrElse IsHyphen(Value)) Then
                        Throw New FormatException("Host names may only contain alphanumeric ASCII characters, hyphens (-), and periods (.).")
                    End If
                Next
            Next

            Return True
        End Function

        Private Function IsLetterOrDigit(value As Integer) As Boolean
            Return (value >= 48 AndAlso value <= 57) OrElse (value >= 65 AndAlso value <= 90) OrElse (value >= 97 AndAlso value <= 122)
        End Function

        Private Function IsHyphen(value As Integer) As Boolean
            Return value = 45
        End Function

#End Region

#Region " Win32 "

        <DllImport("dnsapi.dll", EntryPoint:="DnsQuery_A")>
        Private Shared Function DnsQueryA(
        ByVal hostName As String,
        ByVal type As Short,
        ByVal options As Integer,
        ByRef dnsServers As IPv4Array,
        ByRef recordList As IntPtr,
        ByRef reserved As IntPtr) As Integer
        End Function

#End Region

#Region " Type Definitions "

        Private Class DnsResult

            Public ReadOnly ResolutionTime As Date
            Public ReadOnly AddressList As IPAddress()

            Sub New(addressesList As IPAddress())
                Me.ResolutionTime = Date.Now
                Me.AddressList = addressesList
            End Sub

        End Class

        <StructLayout(LayoutKind.Sequential, Pack:=1)>
        Private Structure DnsRecordA
            Public NextRecord As IntPtr
            Public Name As String
            Public Type As Short
            Public DataLength As Short
            Public Flags As Integer
            Public Ttl As Integer
            Public Reserved As Integer
            Public Data As UInteger
        End Structure

        <StructLayout(LayoutKind.Sequential, Pack:=1)>
        Private Structure IPv4Array
            Public Count As Integer
            <MarshalAs(UnmanagedType.ByValArray, SizeConst:=1, ArraySubType:=UnmanagedType.U4)>
            Public Addresses As UInteger()
        End Structure

#End Region

    End Class

    Friend NotInheritable Class HttpClient

#Region " Properties "

        Public Property BypassPageCaching() As Boolean
            Get
                Return _BypassPageCaching
            End Get
            Set(value As Boolean)
                _BypassPageCaching = value
            End Set
        End Property

        Public Property RequestThrottleTime As Integer
            Get
                Return _RequestThrottleTime
            End Get
            Set(value As Integer)
                _RequestThrottleTime = Math.Max(value, 0)
            End Set
        End Property

        Public Property MaxConcurrentRequests As Integer
            Get
                Return _MaxConcurrentRequests
            End Get
            Set(value As Integer)
                _MaxConcurrentRequests = Math.Max(value, 0)
            End Set
        End Property

        Public Property RetryDelayTime As Integer
            Get
                Return _RetryDelayTime
            End Get
            Set(value As Integer)
                _RetryDelayTime = Math.Max(value, 0)
            End Set
        End Property

#End Region

#Region " Events "

        Public Event WebRequestDownloadProgress(sender As Object, e As WebRequestProgressEventArgs)

        Public Event WebRequestUploadProgress(sender As Object, e As WebRequestProgressEventArgs)

        Public Event WebRequestCompleted(sender As Object, e As WebRequestCompletedEventArgs)

        Public Event WebRequestResolveHost(sender As Object, e As WebRequestResolveHostEventArgs)

        Public Event WebRequestValidateHost(sender As Object, e As WebRequestValidateHostEventArgs)

#End Region

#Region " Members "

        Private _RetryDelayTime As Integer
        Private _ConcurrentRequests As Integer
        Private _RequestThrottleTime As Integer
        Private _MaxConcurrentRequests As Integer
        Private _BypassPageCaching As Boolean
        Private _CertificateCache As List(Of String)
        Private _PendingRequests As Dictionary(Of WebRequest, Boolean)
        Private _RequestTime As Date
        Private _ThrottleLock As Object

#End Region

#Region " Constructor "

        Public Sub New()
            _BypassPageCaching = True
            _RetryDelayTime = 1000
            _ThrottleLock = New Object()
            _CertificateCache = New List(Of String)
            _PendingRequests = New Dictionary(Of WebRequest, Boolean)

            ServicePointManager.CheckCertificateRevocationList = False
            ServicePointManager.DnsRefreshTimeout = Timeout.Infinite
            ServicePointManager.EnableDnsRoundRobin = False
            ServicePointManager.ServerCertificateValidationCallback = AddressOf ValidateCertificate

            'NOTE: Tls is more secure but is not properly supported until .NET 4.0.

            'If Environment.Version.Major < 4 Then
            '    ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3
            'End If
        End Sub

#End Region

#Region " Request Handling "

        Public Function DownloadData(host As String) As Byte()
            Dim Options As New RequestOptions()
            Options.Method = "GET"

            Return UploadValues(host, Nothing, Options)
        End Function

        Public Function UploadValues(host As String, values As Dictionary(Of String, Object)) As Byte()
            Return UploadValues(host, values, Nothing)
        End Function

        Public Function UploadValues(host As String, values As Dictionary(Of String, Object), options As RequestOptions) As Byte()
            If options Is Nothing Then
                options = New RequestOptions()
            End If

            Return ExecuteRequest(host, values, New RequestState(options, Nothing, False))
        End Function

        Public Sub DownloadDataAsync(host As String)
            Dim Options As New RequestOptions()
            Options.Method = "GET"

            UploadValuesAsync(host, Nothing, Options, Nothing)
        End Sub

        Public Sub DownloadDataAsync(host As String, userState As Object)
            Dim Options As New RequestOptions()
            Options.Method = "GET"

            UploadValuesAsync(host, Nothing, Options, userState)
        End Sub

        Public Sub UploadValuesAsync(host As String, values As Dictionary(Of String, Object))
            UploadValuesAsync(host, values, Nothing, Nothing)
        End Sub

        Public Sub UploadValuesAsync(host As String, values As Dictionary(Of String, Object), userState As Object)
            UploadValuesAsync(host, values, Nothing, userState)
        End Sub

        Public Sub UploadValuesAsync(host As String, values As Dictionary(Of String, Object), options As RequestOptions)
            UploadValuesAsync(host, values, options, Nothing)
        End Sub

        Public Sub UploadValuesAsync(host As String, values As Dictionary(Of String, Object), options As RequestOptions, userState As Object)
            If options Is Nothing Then
                options = New RequestOptions()
            End If

            ThreadPool.QueueUserWorkItem(Sub() ExecuteRequest(host, values, New RequestState(options, userState, True)))
        End Sub

        Private Sub ThrottleRequest()
            While True
                Dim ElapsedTime As TimeSpan
                Dim CurrentRequests As Integer = _ConcurrentRequests

                If _RequestThrottleTime = 0 Then
                    ElapsedTime = TimeSpan.MaxValue
                Else
                    SyncLock _ThrottleLock
                        ElapsedTime = (Date.Now - _RequestTime)
                    End SyncLock
                End If

                If _MaxConcurrentRequests = 0 Then
                    CurrentRequests = -1
                End If

                If (ElapsedTime.TotalMilliseconds > _RequestThrottleTime) AndAlso (CurrentRequests < _MaxConcurrentRequests) Then
                    Exit While
                End If

                Thread.Sleep(15)
            End While
        End Sub

        Private Function ExecuteRequest(host As String, values As Dictionary(Of String, Object), state As RequestState) As Byte()
            Thread.CurrentThread.CurrentCulture = CultureInfo.InvariantCulture
            Thread.CurrentThread.CurrentUICulture = CultureInfo.InvariantCulture

            Dim Count As Integer = 0
            Dim Request As WebRequest = Nothing
            Dim [Error] As Exception = Nothing
            Dim Result As Byte() = Nothing
            Dim Headers As WebHeaderCollection = Nothing

            While state.Options.RetryCount >= Count
                If (_RequestThrottleTime > 0) OrElse (_MaxConcurrentRequests > 0) Then
                    ThrottleRequest()
                End If

                SyncLock _ThrottleLock
                    If Date.Now > _RequestTime Then
                        _RequestTime = Date.Now
                    End If
                End SyncLock

                Interlocked.Increment(_ConcurrentRequests)

                Try
                    Request = Nothing
                    [Error] = Nothing
                    Result = Nothing

                    Dim Address As Uri = PrepareUri(host, values, state.Options)
                    Dim Secured As Boolean = (Address.Scheme = Uri.UriSchemeHttps)

                    Request = PrepareWebRequest(Address, state.Options)

                    If Secured Then
                        RegisterPendingRequest(Address, Request)
                    End If

                    If (values IsNot Nothing) AndAlso (state.Options.Method = "POST") Then
                        WriteRequest(Request, values, state)
                    End If

                    Dim Response As WebResponse = Request.GetResponse()

                    If Secured Then
                        If Not VerifyPendingRequest(Request) Then
                            Throw New Exception("Could not establish trust relationship for the SSL/TLS secure channel.")
                        End If
                    End If

                    Result = ReadResponse(Response, state)
                    Headers = Response.Headers

                    Interlocked.Decrement(_ConcurrentRequests)

                    Exit While
                Catch ex As Exception
                    [Error] = ex
                End Try

                Count += 1
                UnregisterPendingRequest(Request)

                Interlocked.Decrement(_ConcurrentRequests)

                Thread.Sleep(RetryDelayTime)
            End While

            If state.RaiseEvents Then
                Dim EventArgs As New WebRequestCompletedEventArgs([Error], Result, Headers, state.UserState)

                RaiseEvent WebRequestCompleted(Me, EventArgs)
            ElseIf [Error] IsNot Nothing Then
                Throw [Error]
            End If

            Return Result
        End Function

        Private Function PrepareUri(host As String, values As Dictionary(Of String, Object), options As RequestOptions) As Uri
            Dim UriBuilder As New UriBuilder(host)
            Dim StringBuilder As New StringBuilder()

            If UriBuilder.Query.Length > 0 Then
                StringBuilder.AppendFormat("{0}&", UriBuilder.Query.Substring(1))
            End If

            If (values IsNot Nothing) AndAlso (options.Method = "GET") Then
                For Each K As KeyValuePair(Of String, Object) In values
                    StringBuilder.AppendFormat("{0}={1}&", Uri.EscapeDataString(K.Key), Uri.EscapeDataString(K.Value.ToString()))
                Next

                StringBuilder.Length -= 1
            End If

            If _BypassPageCaching Then
                StringBuilder.Append(Guid.NewGuid().ToString().Remove(8))
            End If

            UriBuilder.Query = StringBuilder.ToString()

            Return UriBuilder.Uri
        End Function

        Private Function PrepareWebRequest(address As Uri, options As RequestOptions) As HttpWebRequest
            Dim HttpRequest As HttpWebRequest = DirectCast(WebRequest.Create(address), HttpWebRequest)

            HttpRequest.Accept = Nothing
            HttpRequest.AllowAutoRedirect = True
            HttpRequest.AllowWriteStreamBuffering = False
            HttpRequest.AuthenticationLevel = AuthenticationLevel.None
            HttpRequest.AutomaticDecompression = DecompressionMethods.GZip Or DecompressionMethods.Deflate
            HttpRequest.CachePolicy = New RequestCachePolicy(RequestCacheLevel.BypassCache)
            HttpRequest.ClientCertificates = New X509CertificateCollection()
            HttpRequest.ConnectionGroupName = Nothing
            HttpRequest.ContentLength = 0
            HttpRequest.ContinueDelegate = Nothing
            HttpRequest.Credentials = Nothing
            HttpRequest.CookieContainer = options.Cookies
            HttpRequest.Expect = Nothing
            HttpRequest.ImpersonationLevel = TokenImpersonationLevel.None
            HttpRequest.KeepAlive = True
            HttpRequest.MaximumAutomaticRedirections = 10
            HttpRequest.MaximumResponseHeadersLength = -1
            HttpRequest.MediaType = Nothing
            HttpRequest.Method = options.Method
            HttpRequest.Pipelined = True
            HttpRequest.PreAuthenticate = False
            HttpRequest.ProtocolVersion = HttpVersion.Version11
            HttpRequest.Proxy = options.Proxy
            HttpRequest.ReadWriteTimeout = options.Timeout
            HttpRequest.Referer = options.Referer
            HttpRequest.SendChunked = False
            HttpRequest.Timeout = options.Timeout
            HttpRequest.TransferEncoding = Nothing
            HttpRequest.UnsafeAuthenticatedConnectionSharing = True
            HttpRequest.UseDefaultCredentials = False
            HttpRequest.UserAgent = options.UserAgent

            HttpRequest.ServicePoint.BindIPEndPointDelegate = AddressOf BindIPEndPoint
            HttpRequest.ServicePoint.ConnectionLeaseTimeout = 60000
            HttpRequest.ServicePoint.ConnectionLimit = 100
            HttpRequest.ServicePoint.Expect100Continue = False
            HttpRequest.ServicePoint.MaxIdleTime = 10000
            HttpRequest.ServicePoint.ReceiveBufferSize = UShort.MaxValue
            HttpRequest.ServicePoint.UseNagleAlgorithm = True

            If _BypassPageCaching Then
                HttpRequest.Headers("Cache-Control") = "no-cache, no-store, no-transform"
                HttpRequest.Headers("Pragma") = "no-cache"
            End If

            If options.Headers IsNot Nothing Then
                HttpRequest.Headers.Add(options.Headers)
            End If

            Return HttpRequest
        End Function

        Private Function PrepareRequestStream(values As Dictionary(Of String, Object), boundary As String) As Byte()
            Dim MemoryStream As New MemoryStream()
            Dim StreamWriter As New StreamWriter(MemoryStream)

            'NOTE: RFC 2388 describes the format of multipart/form-data POST requests.

            Dim IsBinary As Boolean

            For Each K As KeyValuePair(Of String, Object) In values
                IsBinary = (TypeOf K.Value Is Byte())

                StreamWriter.WriteLine(String.Format("--{0}", boundary))
                StreamWriter.WriteLine(String.Format("Content-Disposition: form-data; name=""{0}""", K.Key))

                If IsBinary Then
                    StreamWriter.WriteLine("Content-Type: application/octet-stream")
                End If

                StreamWriter.WriteLine()

                If IsBinary Then
                    Dim ValueData As Byte() = DirectCast(K.Value, Byte())

                    StreamWriter.Flush()
                    MemoryStream.Write(ValueData, 0, ValueData.Length)

                    StreamWriter.WriteLine()
                Else
                    StreamWriter.WriteLine(K.Value)
                End If
            Next

            StreamWriter.WriteLine(String.Format("--{0}--", boundary))
            StreamWriter.Close()

            Return MemoryStream.ToArray()
        End Function

        Private Sub RegisterPendingRequest(address As Uri, request As WebRequest)
            SyncLock _PendingRequests
                Dim HostName As String = address.DnsSafeHost.ToLowerInvariant()
                _PendingRequests.Add(request, _CertificateCache.Contains(HostName))
            End SyncLock
        End Sub

        Private Function VerifyPendingRequest(request As WebRequest) As Boolean
            Dim IsValid As Boolean

            SyncLock _PendingRequests
                IsValid = _PendingRequests(request)
                _PendingRequests.Remove(request)
            End SyncLock

            Return IsValid
        End Function

        Private Sub UnregisterPendingRequest(request As WebRequest)
            SyncLock _PendingRequests
                _PendingRequests.Remove(request)
            End SyncLock
        End Sub

        Private Sub WriteRequest(request As WebRequest, values As Dictionary(Of String, Object), state As RequestState)
            If values.Count = 0 Then
                Return
            End If

            Dim Boundary As String = Date.UtcNow.Ticks.ToString()
            Dim Data As Byte() = PrepareRequestStream(values, Boundary)

            request.ContentType = String.Format("multipart/form-data; boundary={0}", Boundary)
            request.ContentLength = Data.Length

            Dim BytesToWrite As Integer
            Dim BytesTransferred As Integer

            Dim RequestStream As Stream = request.GetRequestStream()

            While True
                If state.RaiseEvents Then
                    RaiseEvent WebRequestUploadProgress(Me, New WebRequestProgressEventArgs(BytesTransferred, Data.Length, state.UserState))
                End If

                BytesToWrite = Math.Min(UShort.MaxValue, Data.Length - BytesTransferred)

                If BytesToWrite = 0 Then
                    Exit While
                End If

                RequestStream.Write(Data, BytesTransferred, BytesToWrite)
                BytesTransferred += BytesToWrite
            End While
        End Sub

        Private Function ReadResponse(response As WebResponse, state As RequestState) As Byte()
            Dim MemoryStream As New MemoryStream()

            Dim Length As Integer = CInt(response.ContentLength)

            Dim BytesRead As Integer
            Dim BytesTransferred As Integer

            Dim Buffer(UShort.MaxValue - 1) As Byte
            Dim ResponseStream As Stream = response.GetResponseStream()

            While True
                If state.RaiseEvents Then
                    If Length = -1 Then
                        RaiseEvent WebRequestDownloadProgress(Me, New WebRequestProgressEventArgs(BytesTransferred, BytesTransferred, state.UserState))
                    Else
                        RaiseEvent WebRequestDownloadProgress(Me, New WebRequestProgressEventArgs(BytesTransferred, Length, state.UserState))
                    End If
                End If

                BytesRead = ResponseStream.Read(Buffer, 0, Buffer.Length)

                If BytesRead = 0 Then
                    Exit While
                End If

                MemoryStream.Write(Buffer, 0, BytesRead)
                BytesTransferred += BytesRead
            End While

            response.Close()
            MemoryStream.Close()

            Return MemoryStream.ToArray()
        End Function

#End Region

#Region " Resolve Host "

        Private Function BindIPEndPoint(servicePoint As ServicePoint, remoteEndPoint As IPEndPoint, retryCount As Integer) As IPEndPoint
            Dim HostName As String = servicePoint.Address.DnsSafeHost.ToLower()
            Dim EventArgs As New WebRequestResolveHostEventArgs(HostName, remoteEndPoint.Address)

            RaiseEvent WebRequestResolveHost(Me, EventArgs)

            remoteEndPoint.Address = EventArgs.Address

            Return Nothing
        End Function

#End Region

#Region " Validate Host "

        Private Function ValidateCertificate(sender As Object, cert As X509Certificate, chain As X509Chain, errors As SslPolicyErrors) As Boolean
            'NOTE: We must ensure the request was created by our class before raising events for it.

            If Not (TypeOf sender Is WebRequest) Then
                Return True
            End If

            SyncLock _PendingRequests
                If Not _PendingRequests.ContainsKey(DirectCast(sender, WebRequest)) Then
                    Return True
                End If
            End SyncLock

            Dim Request As WebRequest = DirectCast(sender, WebRequest)
            Dim HostName As String = Request.RequestUri.DnsSafeHost.ToLowerInvariant()

            Dim EventArgs As New WebRequestValidateHostEventArgs(HostName, cert, errors)

            RaiseEvent WebRequestValidateHost(Me, EventArgs)

            SyncLock _PendingRequests
                If EventArgs.Valid Then
                    If Not _CertificateCache.Contains(HostName) Then
                        _CertificateCache.Add(HostName)
                    End If
                Else
                    _CertificateCache.Remove(HostName)
                End If

                _PendingRequests(Request) = EventArgs.Valid
            End SyncLock

            Return EventArgs.Valid
        End Function

#End Region

#Region " Type Definitions "

        <EditorBrowsable(EditorBrowsableState.Advanced)>
        Public NotInheritable Class WebRequestResolveHostEventArgs

#Region " Properties "

            Public ReadOnly Property HostName() As String
                Get
                    Return _HostName
                End Get
            End Property

            Public Property Address() As IPAddress
                Get
                    Return _Address
                End Get
                Set(value As IPAddress)
                    _Address = value
                End Set
            End Property

#End Region

#Region " Members "

            Private _HostName As String
            Private _Address As IPAddress

#End Region

#Region " Constructor "

            Public Sub New(hostName As String, address As IPAddress)
                _HostName = hostName
                _Address = address
            End Sub

#End Region

        End Class

        <EditorBrowsable(EditorBrowsableState.Advanced)>
        Public NotInheritable Class WebRequestValidateHostEventArgs

#Region " Properties "

            Public ReadOnly Property HostName() As String
                Get
                    Return _HostName
                End Get
            End Property

            Public ReadOnly Property Certificate() As X509Certificate
                Get
                    Return _Certificate
                End Get
            End Property

            Public ReadOnly Property Errors() As SslPolicyErrors
                Get
                    Return _Errors
                End Get
            End Property

            Public Property Valid() As Boolean
                Get
                    Return _Valid
                End Get
                Set(value As Boolean)
                    _Valid = value
                End Set
            End Property

#End Region

#Region " Members "

            Private _HostName As String
            Private _Certificate As X509Certificate
            Private _Errors As SslPolicyErrors
            Private _Valid As Boolean

#End Region

#Region " Constructor "

            Public Sub New(hostName As String, certificate As X509Certificate, errors As SslPolicyErrors)
                _HostName = hostName
                _Certificate = certificate
                _Errors = errors
                _Valid = True
            End Sub

#End Region

        End Class

        <EditorBrowsable(EditorBrowsableState.Advanced)>
        Public NotInheritable Class WebRequestCompletedEventArgs

#Region " Properties "

            Public ReadOnly Property [Error]() As Exception
                Get
                    Return _Error
                End Get
            End Property

            Public ReadOnly Property Result() As Byte()
                Get
                    Return _Result
                End Get
            End Property

            Public ReadOnly Property Headers As WebHeaderCollection
                Get
                    Return _Headers
                End Get
            End Property

            Public ReadOnly Property UserState() As Object
                Get
                    Return _UserState
                End Get
            End Property

#End Region

#Region " Members "

            Private _Error As Exception
            Private _Result As Byte()
            Private _Headers As WebHeaderCollection
            Private _UserState As Object

#End Region

#Region " Constructor "

            Public Sub New([error] As Exception, result As Byte(), headers As WebHeaderCollection, userState As Object)
                _Error = [error]
                _Result = result
                _Headers = headers
                _UserState = userState
            End Sub

#End Region

        End Class

        <EditorBrowsable(EditorBrowsableState.Advanced)>
        Public NotInheritable Class WebRequestProgressEventArgs

#Region " Properties "

            Public ReadOnly Property ProgressPercentage() As Double
                Get
                    Return _ProgressPercentage
                End Get
            End Property

            Public ReadOnly Property BytesTransferred() As Integer
                Get
                    Return _BytesTransferred
                End Get
            End Property

            Public ReadOnly Property TotalBytesToTransfer() As Integer
                Get
                    Return _TotalBytesToTransfer
                End Get
            End Property

            Public ReadOnly Property UserState() As Object
                Get
                    Return _UserState
                End Get
            End Property

#End Region

#Region " Members "

            Private _ProgressPercentage As Double
            Private _BytesTransferred As Integer
            Private _TotalBytesToTransfer As Integer
            Private _UserState As Object

#End Region

#Region " Constructor "

            Public Sub New(bytesTransferred As Integer, totalBytesToTransfer As Integer, userState As Object)
                _BytesTransferred = bytesTransferred
                _TotalBytesToTransfer = totalBytesToTransfer

                If Not totalBytesToTransfer = 0 Then
                    _ProgressPercentage = (_BytesTransferred / _TotalBytesToTransfer) * 100
                End If

                _UserState = userState
            End Sub

#End Region

        End Class

        Public NotInheritable Class RequestOptions

#Region " Properties "

            Public Property Proxy() As IWebProxy
                Get
                    Return _Proxy
                End Get
                Set(value As IWebProxy)
                    _Proxy = value
                End Set
            End Property

            Public Property UserAgent() As String
                Get
                    Return _UserAgent
                End Get
                Set(value As String)
                    _UserAgent = value
                End Set
            End Property

            Public Property Referer() As String
                Get
                    Return _Referer
                End Get
                Set(value As String)
                    _Referer = value
                End Set
            End Property

            Public Property Cookies() As CookieContainer
                Get
                    Return _Cookies
                End Get
                Set(value As CookieContainer)
                    _Cookies = value
                End Set
            End Property

            Public Property Headers As WebHeaderCollection
                Get
                    Return _Headers
                End Get
                Set(value As WebHeaderCollection)
                    _Headers = value
                End Set
            End Property

            Public Property Timeout() As Integer
                Get
                    Return _Timeout
                End Get
                Set(value As Integer)
                    _Timeout = value
                End Set
            End Property

            Public Property RetryCount() As Integer
                Get
                    Return _RetryCount
                End Get
                Set(value As Integer)
                    _RetryCount = Math.Max(value, 0)
                End Set
            End Property

            Public Property Method() As String
                Get
                    Return _Method
                End Get
                Set(value As String)
                    If String.IsNullOrEmpty(value) Then
                        _Method = "POST"
                    Else
                        _Method = value.Trim().ToUpper()
                    End If
                End Set
            End Property

#End Region

#Region " Members "

            Private _Proxy As IWebProxy
            Private _UserAgent As String
            Private _Referer As String
            Private _Cookies As CookieContainer
            Private _Headers As WebHeaderCollection
            Private _Timeout As Integer
            Private _RetryCount As Integer
            Private _Method As String

#End Region

#Region " Constructor "

            Public Sub New()
                _Method = "POST"
                _Timeout = 60000
                _Proxy = WebRequest.DefaultWebProxy
                _Cookies = New CookieContainer()
                _Headers = New WebHeaderCollection()
            End Sub

#End Region

        End Class

        Private NotInheritable Class RequestState

#Region " Properties "

            Public ReadOnly Property Options() As RequestOptions
                Get
                    Return _Options
                End Get
            End Property

            Public ReadOnly Property UserState() As Object
                Get
                    Return _UserState
                End Get
            End Property

            Public ReadOnly Property RaiseEvents() As Boolean
                Get
                    Return _RaiseEvents
                End Get
            End Property

#End Region

#Region " Members "

            Private _Options As RequestOptions
            Private _UserState As Object
            Private _RaiseEvents As Boolean

#End Region

#Region " Constructor "

            Public Sub New(options As RequestOptions, userState As Object, raiseEvents As Boolean)
                _Options = options
                _UserState = userState
                _RaiseEvents = raiseEvents
            End Sub

#End Region

        End Class

#End Region

        Public Function EstimateMaxTimeout(numberOfBytes As Integer) As Integer
            Dim GracePeriod As Integer = 5000 '5 seconds to establish a connection.
            Dim TimePerChunk As Integer = 1000 'We'll assume each chunk takes 1 second.
            Dim TransferSpeed As Integer = 32000 '256 Kbps download / upload speed.
            Dim NumberOfChunks As Integer = CInt(Math.Ceiling(numberOfBytes / TransferSpeed))

            Return GracePeriod + (NumberOfChunks * TimePerChunk)
        End Function

    End Class

    Friend NotInheritable Class BlogPost

        ''' <summary>
        ''' Gets the unique id for the post.
        ''' </summary>
        Public ReadOnly Property Id As Integer
            Get
                Return _Id
            End Get
        End Property

        ''' <summary>
        ''' Gets the title for the post.
        ''' </summary>
        Public ReadOnly Property Title As String
            Get
                Return _Title
            End Get
        End Property

        ''' <summary>
        ''' Gets the number of times the post has been read by users.
        ''' </summary>
        Public ReadOnly Property TimesRead As Integer
            Get
                Return _TimesRead
            End Get
        End Property

        ''' <summary>
        ''' Gets the date that the post was originally posted.
        ''' </summary>
        Public ReadOnly Property DatePosted As Date
            Get
                Return _DatePosted
            End Get
        End Property

        Private _Id As Integer
        Private _Title As String
        Private _TimesRead As Integer
        Private _DatePosted As Date
        Private _GetPostBodyDelegate As [Delegate]

        Public Sub New(id As Integer, title As String, timesRead As Integer, datePosted As Date, getPostBodyDelegate As [Delegate])
            _Id = id
            _Title = title
            _TimesRead = timesRead
            _DatePosted = datePosted
            _GetPostBodyDelegate = getPostBodyDelegate
        End Sub

        ''' <summary>
        ''' Gets the body for the post.
        ''' </summary>
        Public Function GetPostBody() As String
            Return DirectCast(_GetPostBodyDelegate.DynamicInvoke(_Id), String)
        End Function

    End Class

    Friend NotInheritable Class BrokerSettings

        ''' <summary>
        ''' Gets or sets the theme that will be used by the authentication dialog.
        ''' </summary>
        Property DialogTheme As DialogTheme

        ''' <summary>
        ''' Gets or sets a value indicating whether to catch unhandled exceptions and report them to the server.
        ''' </summary>
        Property CatchUnhandledExceptions As Boolean

        ''' <summary>
        ''' Gets or sets a value indicating whether to ignore automatic updates.
        ''' </summary>
        Property DeferAutomaticUpdates As Boolean

        ''' <summary>
        ''' Gets or sets a value indicating whether the authentication window will be shown. This option should only be used in
        ''' products that provide lifetime licenses.
        ''' </summary>
        Property SilentAuthentication As Boolean

        ''' <summary>
        ''' Gets or sets a value indicating whether to verify the integrity of core runtime files (mscorlib, System, and System.Security). 
        ''' </summary>
        Property VerifyRuntimeIntegrity As Boolean


        Public Sub New()
            CatchUnhandledExceptions = True
            VerifyRuntimeIntegrity = True
            DialogTheme = NetSeal.DialogTheme.Light
        End Sub

    End Class

    Friend Enum DialogTheme As Integer
        None = 0
        Light = 1
        Dark = 2
    End Enum

    Friend Enum LicenseType As Byte
        Special = 0
        Bronze = 1
        Silver = 2
        Gold = 3
        Platinum = 4
        Diamond = 5
    End Enum

#End Region

End Namespace

