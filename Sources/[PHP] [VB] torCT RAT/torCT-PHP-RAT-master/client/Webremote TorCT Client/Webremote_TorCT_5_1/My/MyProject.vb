Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.ApplicationServices
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.CodeDom.Compiler
Imports System.Collections
Imports System.ComponentModel
Imports System.ComponentModel.Design
Imports System.Diagnostics
Imports System.Reflection
Imports System.Runtime.CompilerServices
Imports System.Runtime.InteropServices
Imports Webremote_TorCT_5_1

Namespace Webremote_TorCT_5_1.My
    <StandardModule, GeneratedCode("MyTemplate", "8.0.0.0"), HideModuleName> _
    Friend NotInheritable Class MyProject
        ' Properties
        <HelpKeyword("My.Application")> _
        Friend Shared ReadOnly Property Application As MyApplication
            <DebuggerHidden> _
            Get
                Return MyProject.m_AppObjectProvider.GetInstance
            End Get
        End Property

        <HelpKeyword("My.Computer")> _
        Friend Shared ReadOnly Property Computer As MyComputer
            <DebuggerHidden> _
            Get
                Return MyProject.m_ComputerObjectProvider.GetInstance
            End Get
        End Property

        <HelpKeyword("My.Forms")> _
        Friend Shared ReadOnly Property Forms As MyForms
            <DebuggerHidden> _
            Get
                Return MyProject.m_MyFormsObjectProvider.GetInstance
            End Get
        End Property

        <HelpKeyword("My.User")> _
        Friend Shared ReadOnly Property User As User
            <DebuggerHidden> _
            Get
                Return MyProject.m_UserObjectProvider.GetInstance
            End Get
        End Property

        <HelpKeyword("My.WebServices")> _
        Friend Shared ReadOnly Property WebServices As MyWebServices
            <DebuggerHidden> _
            Get
                Return MyProject.m_MyWebServicesObjectProvider.GetInstance
            End Get
        End Property


        ' Fields
        Private Shared ReadOnly m_AppObjectProvider As ThreadSafeObjectProvider(Of MyApplication) = New ThreadSafeObjectProvider(Of MyApplication)
        Private Shared ReadOnly m_ComputerObjectProvider As ThreadSafeObjectProvider(Of MyComputer) = New ThreadSafeObjectProvider(Of MyComputer)
        Private Shared m_MyFormsObjectProvider As ThreadSafeObjectProvider(Of MyForms) = New ThreadSafeObjectProvider(Of MyForms)
        Private Shared ReadOnly m_MyWebServicesObjectProvider As ThreadSafeObjectProvider(Of MyWebServices) = New ThreadSafeObjectProvider(Of MyWebServices)
        Private Shared ReadOnly m_UserObjectProvider As ThreadSafeObjectProvider(Of User) = New ThreadSafeObjectProvider(Of User)

        ' Nested Types
        <EditorBrowsable(EditorBrowsableState.Never), MyGroupCollection("System.Windows.Forms.Form", "Create__Instance__", "Dispose__Instance__", "My.MyProject.Forms")> _
        Friend NotInheritable Class MyForms
            ' Methods
            <DebuggerHidden> _
            Private Shared Function Create__Instance__(Of T As { Form, New })(ByVal Instance As T) As T
                Dim local As T
                If (If(((Instance Is Nothing) OrElse Instance.IsDisposed), 1, 0) = 0) Then
                    Return Instance
                End If
                If (Not MyForms.m_FormBeingCreated Is Nothing) Then
                    If MyForms.m_FormBeingCreated.ContainsKey(GetType(T)) Then
                        Throw New InvalidOperationException(Utils.GetResourceString("WinForms_RecursiveFormCreate", New String(0  - 1) {}))
                    End If
                Else
                    MyForms.m_FormBeingCreated = New Hashtable
                End If
                MyForms.m_FormBeingCreated.Add(GetType(T), Nothing)
                Try 
                    Return Activator.CreateInstance(Of T)
                Catch obj1 As Object When (?)
                    Dim exception As TargetInvocationException
                    Throw New InvalidOperationException(Utils.GetResourceString("WinForms_SeeInnerException", New String() { exception.InnerException.Message }), exception.InnerException)
                    ProjectData.ClearProjectError
                Finally
                    MyForms.m_FormBeingCreated.Remove(GetType(T))
                End Try
                Return local
            End Function

            <DebuggerHidden> _
            Private Sub Dispose__Instance__(Of T As Form)(ByRef instance As T)
                instance.Dispose
                instance = CType(Nothing, T)
            End Sub

            <EditorBrowsable(EditorBrowsableState.Never)> _
            Public Overrides Function Equals(ByVal o As Object) As Boolean
                Return MyBase.Equals(RuntimeHelpers.GetObjectValue(o))
            End Function

            <EditorBrowsable(EditorBrowsableState.Never)> _
            Public Overrides Function GetHashCode() As Integer
                Return MyBase.GetHashCode
            End Function

            <EditorBrowsable(EditorBrowsableState.Never)> _
            Friend Function [GetType]() As Type
                Return GetType(MyForms)
            End Function

            <EditorBrowsable(EditorBrowsableState.Never)> _
            Public Overrides Function ToString() As String
                Return MyBase.ToString
            End Function


            ' Properties
            Public Property Chat As Chat
                <DebuggerNonUserCode> _
                Get
                    Me.m_Chat = MyForms.Create__Instance__(Of Chat)(Me.m_Chat)
                    Return Me.m_Chat
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As Chat)
                    If (Not Value Is Me.m_Chat) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of Chat)(Me.m_Chat)
                    End If
                End Set
            End Property

            Public Property Client As Client
                <DebuggerNonUserCode> _
                Get
                    Me.m_Client = MyForms.Create__Instance__(Of Client)(Me.m_Client)
                    Return Me.m_Client
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As Client)
                    If (Not Value Is Me.m_Client) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of Client)(Me.m_Client)
                    End If
                End Set
            End Property

            Public Property Clientpasswordwindows As Clientpasswordwindows
                <DebuggerNonUserCode> _
                Get
                    Me.m_Clientpasswordwindows = MyForms.Create__Instance__(Of Clientpasswordwindows)(Me.m_Clientpasswordwindows)
                    Return Me.m_Clientpasswordwindows
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As Clientpasswordwindows)
                    If (Not Value Is Me.m_Clientpasswordwindows) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of Clientpasswordwindows)(Me.m_Clientpasswordwindows)
                    End If
                End Set
            End Property

            Public Property CMDScript As CMDScript
                <DebuggerNonUserCode> _
                Get
                    Me.m_CMDScript = MyForms.Create__Instance__(Of CMDScript)(Me.m_CMDScript)
                    Return Me.m_CMDScript
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As CMDScript)
                    If (Not Value Is Me.m_CMDScript) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of CMDScript)(Me.m_CMDScript)
                    End If
                End Set
            End Property

            Public Property CreateServer As CreateServer
                <DebuggerNonUserCode> _
                Get
                    Me.m_CreateServer = MyForms.Create__Instance__(Of CreateServer)(Me.m_CreateServer)
                    Return Me.m_CreateServer
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As CreateServer)
                    If (Not Value Is Me.m_CreateServer) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of CreateServer)(Me.m_CreateServer)
                    End If
                End Set
            End Property

            Public Property FileBrowser As FileBrowser
                <DebuggerNonUserCode> _
                Get
                    Me.m_FileBrowser = MyForms.Create__Instance__(Of FileBrowser)(Me.m_FileBrowser)
                    Return Me.m_FileBrowser
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As FileBrowser)
                    If (Not Value Is Me.m_FileBrowser) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of FileBrowser)(Me.m_FileBrowser)
                    End If
                End Set
            End Property

            Public Property getactivewindow As getactivewindow
                <DebuggerNonUserCode> _
                Get
                    Me.m_getactivewindow = MyForms.Create__Instance__(Of getactivewindow)(Me.m_getactivewindow)
                    Return Me.m_getactivewindow
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As getactivewindow)
                    If (Not Value Is Me.m_getactivewindow) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of getactivewindow)(Me.m_getactivewindow)
                    End If
                End Set
            End Property

            Public Property Loding_Screen As Loding_Screen
                <DebuggerNonUserCode> _
                Get
                    Me.m_Loding_Screen = MyForms.Create__Instance__(Of Loding_Screen)(Me.m_Loding_Screen)
                    Return Me.m_Loding_Screen
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As Loding_Screen)
                    If (Not Value Is Me.m_Loding_Screen) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of Loding_Screen)(Me.m_Loding_Screen)
                    End If
                End Set
            End Property

            Public Property ProcessView As ProcessView
                <DebuggerNonUserCode> _
                Get
                    Me.m_ProcessView = MyForms.Create__Instance__(Of ProcessView)(Me.m_ProcessView)
                    Return Me.m_ProcessView
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As ProcessView)
                    If (Not Value Is Me.m_ProcessView) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of ProcessView)(Me.m_ProcessView)
                    End If
                End Set
            End Property

            Public Property processviewer As processviewer
                <DebuggerNonUserCode> _
                Get
                    Me.m_processviewer = MyForms.Create__Instance__(Of processviewer)(Me.m_processviewer)
                    Return Me.m_processviewer
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As processviewer)
                    If (Not Value Is Me.m_processviewer) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of processviewer)(Me.m_processviewer)
                    End If
                End Set
            End Property

            Public Property SetupClient As SetupClient
                <DebuggerNonUserCode> _
                Get
                    Me.m_SetupClient = MyForms.Create__Instance__(Of SetupClient)(Me.m_SetupClient)
                    Return Me.m_SetupClient
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As SetupClient)
                    If (Not Value Is Me.m_SetupClient) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of SetupClient)(Me.m_SetupClient)
                    End If
                End Set
            End Property

            Public Property ShowImageScreen As ShowImageScreen
                <DebuggerNonUserCode> _
                Get
                    Me.m_ShowImageScreen = MyForms.Create__Instance__(Of ShowImageScreen)(Me.m_ShowImageScreen)
                    Return Me.m_ShowImageScreen
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As ShowImageScreen)
                    If (Not Value Is Me.m_ShowImageScreen) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of ShowImageScreen)(Me.m_ShowImageScreen)
                    End If
                End Set
            End Property

            Public Property UdpForum As UdpForum
                <DebuggerNonUserCode> _
                Get
                    Me.m_UdpForum = MyForms.Create__Instance__(Of UdpForum)(Me.m_UdpForum)
                    Return Me.m_UdpForum
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As UdpForum)
                    If (Not Value Is Me.m_UdpForum) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of UdpForum)(Me.m_UdpForum)
                    End If
                End Set
            End Property

            Public Property UploadFileTo As UploadFileTo
                <DebuggerNonUserCode> _
                Get
                    Me.m_UploadFileTo = MyForms.Create__Instance__(Of UploadFileTo)(Me.m_UploadFileTo)
                    Return Me.m_UploadFileTo
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As UploadFileTo)
                    If (Not Value Is Me.m_UploadFileTo) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of UploadFileTo)(Me.m_UploadFileTo)
                    End If
                End Set
            End Property

            Public Property WebOrScreenCapture As WebOrScreenCapture
                <DebuggerNonUserCode> _
                Get
                    Me.m_WebOrScreenCapture = MyForms.Create__Instance__(Of WebOrScreenCapture)(Me.m_WebOrScreenCapture)
                    Return Me.m_WebOrScreenCapture
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As WebOrScreenCapture)
                    If (Not Value Is Me.m_WebOrScreenCapture) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of WebOrScreenCapture)(Me.m_WebOrScreenCapture)
                    End If
                End Set
            End Property


            ' Fields
            Public m_Chat As Chat
            Public m_Client As Client
            Public m_Clientpasswordwindows As Clientpasswordwindows
            Public m_CMDScript As CMDScript
            Public m_CreateServer As CreateServer
            Public m_FileBrowser As FileBrowser
            <ThreadStatic> _
            Private Shared m_FormBeingCreated As Hashtable
            Public m_getactivewindow As getactivewindow
            Public m_Loding_Screen As Loding_Screen
            Public m_ProcessView As ProcessView
            Public m_processviewer As processviewer
            Public m_SetupClient As SetupClient
            Public m_ShowImageScreen As ShowImageScreen
            Public m_UdpForum As UdpForum
            Public m_UploadFileTo As UploadFileTo
            Public m_WebOrScreenCapture As WebOrScreenCapture
        End Class

        <EditorBrowsable(EditorBrowsableState.Never), MyGroupCollection("System.Web.Services.Protocols.SoapHttpClientProtocol", "Create__Instance__", "Dispose__Instance__", "")> _
        Friend NotInheritable Class MyWebServices
            ' Methods
            <DebuggerHidden> _
            Private Shared Function Create__Instance__(Of T As New)(ByVal instance As T) As T
                If (instance Is Nothing) Then
                    Return Activator.CreateInstance(Of T)
                End If
                Return instance
            End Function

            <DebuggerHidden> _
            Private Sub Dispose__Instance__(Of T)(ByRef instance As T)
                instance = CType(Nothing, T)
            End Sub

            <EditorBrowsable(EditorBrowsableState.Never), DebuggerHidden> _
            Public Overrides Function Equals(ByVal o As Object) As Boolean
                Return MyBase.Equals(RuntimeHelpers.GetObjectValue(o))
            End Function

            <EditorBrowsable(EditorBrowsableState.Never), DebuggerHidden> _
            Public Overrides Function GetHashCode() As Integer
                Return MyBase.GetHashCode
            End Function

            <EditorBrowsable(EditorBrowsableState.Never), DebuggerHidden> _
            Friend Function [GetType]() As Type
                Return GetType(MyWebServices)
            End Function

            <DebuggerHidden, EditorBrowsable(EditorBrowsableState.Never)> _
            Public Overrides Function ToString() As String
                Return MyBase.ToString
            End Function

        End Class

        <ComVisible(False), EditorBrowsable(EditorBrowsableState.Never)> _
        Friend NotInheritable Class ThreadSafeObjectProvider(Of T As New)
            ' Properties
            Friend ReadOnly Property GetInstance As T
                <DebuggerHidden> _
                Get
                    If (ThreadSafeObjectProvider(Of T).m_ThreadStaticValue Is Nothing) Then
                        ThreadSafeObjectProvider(Of T).m_ThreadStaticValue = Activator.CreateInstance(Of T)
                    End If
                    Return ThreadSafeObjectProvider(Of T).m_ThreadStaticValue
                End Get
            End Property


            ' Fields
            <ThreadStatic, CompilerGenerated> _
            Private Shared m_ThreadStaticValue As T
        End Class
    End Class
End Namespace

